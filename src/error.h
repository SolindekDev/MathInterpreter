#ifndef H_ERROR
    #define H_ERROR 0x1

    #include <stdio.h>

    typedef struct ERROR {
        char* title;
        char* message;
        char* fileName;
        int line;
        int column;
    } ERROR;

    static ERROR 
    makeErr(char* title, char* message, char* fileName, int line, int column) {
        ERROR err;

        err.title = title;
        err.message = message;
        err.fileName = fileName;
        err.line = line;
        err.column = column;

        return err;
    }

    static void
    rawErr(ERROR err) {
        printf("%s: %s:%d:%d: %s\n", 
            err.title,
            err.fileName,
            err.line,
            err.column,
            err.message
        );
    }

#endif