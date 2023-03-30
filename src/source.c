#include "header.h"
#include <stdarg.h>

float vaFunc(int x, ...)
{
    float value;

    va_list args;
    va_start(args, x);

    value = va_arg(args, double);

    va_end(args);

    return value;
}
