all: foo cppcheck

# List of all directories containing a makefile
source_dirs := $(dir $(wildcard */makefile))

# cppcheck from top level
cppcheck:
	cppcheck --enable=all .

# Build each project
foo:
	$(foreach dir, $(source_dirs), echo $(dir); make -j -C $(dir);)

# Clean each project
clean:
	$(foreach dir, $(source_dirs), make -C $(dir) clean;)

# Include What You Use
iwyu:
	$(foreach dir, $(source_dirs), make -C $(dir) iwyu;)

# Call run script if present
run: foo
	$(foreach dir, $(source_dirs), make -C $(dir) run;)
