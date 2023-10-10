# compiler
FC = gfortran

# compiler flags
CFLAGS = -I/sw/pkgs/arc/stacks/gcc/10.3.0/openmpi/4.1.4/include  -pthread  -I/sw/pkgs/arc/stacks/gcc/10.3.0/openmpi/4.1.4/lib  -fcheck=all -fbacktrace -Waliasing -Wampersand -Wconversion -Wsurprising -Wc-binding-type -Wintrinsics-std -Wintrinsic-shadow -Wline-truncation -Wtarget-lifetime -Winteger-division -Wreal-q-constant -Wunused -Wundefined-do-loop

# lib flags
LFLAGS = -L/sw/pkgs/arc/stacks/gcc/10.3.0/openmpi/4.1.4/lib -L/opt/pmix/3.2.3/lib  -Wl,-rpath -Wl,/sw/pkgs/arc/stacks/gcc/10.3.0/openmpi/4.1.4/lib  -Wl,-rpath -Wl,/opt/pmix/3.2.3/lib -Wl,--enable-new-dtags -lmpi_usempif08 -lmpi_usempi_ignore_tkr -lmpi_mpifh -lmpi

# source files
SRCS=header utils fzero findGM findV findIntSum findIntRed
OBJS = $(SRCS:=.o)

# executable
## EXE = exe
## OUT = output

# compile project
all : $(EXE)
	@mkdir $(OUT)
	@echo "   --> Model compiled!"

$(EXE)	: $(OBJS)
	@$(FC) $(CFLAGS) -o $(EXE) $(OBJS) $(LFLAGS) -cpp main.f90

.SUFFIXES : .o .f90

.f90.o :
	@$(FC) $(CFLAGS) $(LFLAGS) -c $<

clean :
	@$(RM) *.o *.so *.mod $(EXE)
	@$(RM) -rf $(OUT)