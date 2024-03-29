# compiler
FC = gfortran

# compiler flags
CFLAGS = -g -fcheck=all -fbacktrace -Waliasing -Wampersand -Wconversion -Wsurprising -Wc-binding-type -Wintrinsics-std -Wintrinsic-shadow -Wline-truncation -Wtarget-lifetime -Winteger-division -Wreal-q-constant -Wunused -Wundefined-do-loop

# lib flags
LFLAGS = -Wl,-flat_namespace -Wl,-commons,use_dylibs  -I/opt/homebrew/Cellar/open-mpi/4.1.5/lib  -L/opt/homebrew/Cellar/open-mpi/4.1.5/lib  -I/opt/homebrew/Cellar/open-mpi/4.1.5/include  -L/opt/homebrew/Cellar/open-mpi/4.1.5/include  -L/opt/homebrew/Cellar/libevent/2.1.12/lib  -lmpi_usempif08 -lmpi_usempi_ignore_tkr -lmpi_mpifh -lmpi

# source files
SRCS= header utils fzero findGM findV findIntSum findIntRed
OBJS = $(SRCS:=.o)

# executable
EXE = exe1
OUT = output1

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
	@$(RM) -rf *.dSYM $(OUT)