# Disable all of make's built-in rules (similar to Fortran's implicit none)
MAKEFLAGS += --no-builtin-rules --no-builtin-variables
# configuration
FC := gfortran
LD := $(FC)
RM := rm -f
# list of all source files
SRCS := tabulate.f90 fonctions.f90
PROG := my_prog

OBJS := $(addsuffix .o, $(SRCS))

.PHONY: all clean
all: $(PROG)

$(PROG): $(OBJS)
	$(LD) -o $@ $^

$(OBJS): %.o: %
	$(FC) -c -o $@ $<

# define dependencies between object files
tabulate.f90.o: fonctions.f90.o user_functions.mod

# rebuild all object files in case this Makefile changes
$(OBJS): $(MAKEFILE_LIST)

clean:
	$(RM) $(filter %.o, $(OBJS)) $(wildcard *.mod) $(PROG)