#include "header.h"
#include <assert.h>
#include <stdio.h>

int main(void)
{
    assert(vaFunc(0, 1.0) == 1.0f);
    assert(vaFunc(0, 1.0f) == 1.0f);
    printf("OK\n");
    return 0;
}
