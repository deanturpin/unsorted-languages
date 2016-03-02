.SILENT:

CC=clang++
RM=rm -f
FLAGS=-Wall -Wextra -pedantic -pedantic-errors -std=c++1z

%.o:%.cpp
	echo Compiling $*.cpp
	$(CC) $(FLAGS) -o $*.o -c $*.cpp

# Target name is the same for all projects (makes .gitignore simple)
target := foo

# Compile and link all source files into a single executable
objects := $(patsubst %.cpp,%.o,$(wildcard *.cpp))
$(target) : $(objects)
	echo Linking -o $@ $(objects)
	$(CC) -o $@ $(objects)

clean:
	$(RM) $(target) $(objects)

run: $(target)
	./run
	# if [[ -e foo ]]; then echo running; else echo not running; fi

.PHONY: fresh
fresh: clean foo
