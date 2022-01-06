OUTPUT_FILE = app

OSE = other

ifeq ($(OS),Windows_NT)
	OSFLAG += win32
else
	UNAME_S := $(shell uname -s)
	ifeq ($(UNAME_S),Linux)
		OSFLAG += linux
	endif
	ifeq ($(UNAME_S),Darwin)
		OSFLAG += osx
	endif
endif

ifeq ($(OS), win32)
	OUTPUT_FILE = app.exe
endif

C_FILES = $(wildcard src/*.c)
O_FILES = ${C_FILES:.c=.o}
H_FILES = $(wildcard src/*.h)

SRC_DIR = src/

RM = rm
GCC = gcc

all: $(O_FILES) link clean

$(O_FILES): $(wildcard src/*.c)
	gcc -std=c89 -Wall -Wextra -Wno-unused-parameter -c $< -o $@

link:
	$(GCC) $(O_FILES) -o app.exe

clean:
	$(RM) $(SRC_DIR)*.o

run: 
	./app.exe

	