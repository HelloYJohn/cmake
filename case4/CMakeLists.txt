cmake_minimum_required(VERSION 2.6)
project(Tutorial)
set(Tutorial_VERSION_MAJOR 1)
set(Tutorial_VERSION_MINOR 0)

configure_file(
    "${PROJECT_SOURCE_DIR}/TutorialConfig.h.in"
    "${PROJECT_BINARY_DIR}/TutorialConfig.h"
    )
option(USE_MYMATH "Use tutorial provided math imp[lementation" ON)
include_directories("${PROJECT_BINARY_DIR}")
message(STATUS "begin")
if (USE_MYMATH)
    message(STATUS "use mymath")
    include_directories("${PROJECT_SOURCE_DIR}/MathFunctions")
    add_subdirectory(MathFunctions)
    set(EXTRA_LIBS ${EXTRA_LIBS} MathFunctions)
endif(USE_MYMATH)

add_executable(Tutorial tutorial.cxx)
target_link_libraries(Tutorial ${EXTRA_LIBS})

install (TARGETS Tutorial DESTINATION bin)
install (FILES "${PROJECT_BINARY_DIR}/TutorialConfig.h"        
         DESTINATION include)

include(CTest)
add_test (TutorialRuns Tutorial 5)
set_tests_properties (TutorialRuns PROPERTIES PASS_REGULAR_EXPRESSION "5 is 2.23607")
# does it sqrt of 25
add_test (TutorialComp25 Tutorial 25)
set_tests_properties (TutorialComp25 PROPERTIES PASS_REGULAR_EXPRESSION "25 is 5")

macro(do_test ARG1 RESULT)
    add_test(TutorialComp${ARG1} Tutorial ${ARG1})
    set_tests_properties(TutorialComp${ARG1} PROPERTIES PASS_REGULAR_EXPRESSION ${RESULT})
endmacro(do_test)

do_test(100, "100 is 10")
do_test(10000, "10000 is 100")
do_test(-10000, "-10000 is 0")
