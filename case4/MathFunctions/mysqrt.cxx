#include "mysqrt.h"
#include <stdio.h>
double mysqrt(double value) {
    if (value <= 0.0) {
        return 0.0;
    }
    printf("invoke mysqrt\n");
    const double const_precision = 0.000000000000001;
    double val = value;
    double lastVal = 0.0;
    double precision = 0.0;
    do {
        lastVal = val;
        val = (val + value / val) / 2;
        precision = (lastVal - val) > 0 ? (lastVal - val) : (val - lastVal);
    } while (precision  > const_precision);
    return val;
}
