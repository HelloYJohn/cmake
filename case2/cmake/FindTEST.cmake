MESSAGE(STATUS "HELLO FindTEST.cmake")
FIND_PATH(TEST_INCLUDE_DIR test.h ${PROJECT_SOURCE_DIR}/include)
MESSAGE(STATUS "FIND_PATH: " ${TEST_INCLUDE_DIR})

FIND_LIBRARY(TEST_LIBRARY NAMES test PATHS ${HELLO_BINARY_DIR}/lib)
MESSAGE(STATUS "FIND_LIBRARY: " ${TEST_LIBRARY})

IF(TEST_INCLUDE_DIR AND TEST_LIBRARY)
    SET(TEST_FOUND TRUE)
ENDIF(TEST_INCLUDE_DIR AND TEST_LIBRARY)
MESSAGE(STATUS "TEST_FOUND: " ${TEST_FOUND})

IF(TEST_FOUND)
    IF(NOT TEST_FIND_QUIETLY)
        MESSAGE(STATUS "Found test: ${TEST_LIBARY}")
    ENDIF(NOT TEST_FIND_QUIETLY)
ELSE(TEST_FOUND)
    IF(TEST_FIND_REQUIRED)
        MESSAGE(STATUS "Could not find test library")
    ENDIF(TEST_FIND_REQUIRED)
ENDIF(TEST_FOUND)

