#include <stdio.h>

#include "error.h"

int main(int argc, char **argv) {
    ERROR err = makeErr("ShellError", "Invalid number of arguments", "Makefile",0, 0);
    rawErr(err);
    return 0;
}