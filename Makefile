prefix=/sw/pkgs/arc/stacks/gcc/10.3.0/openmpi/4.1.6
exec_prefix=${prefix}
includedir=${prefix}/include
libdir=${exec_prefix}/lib
pkgincludedir=${includedir}/openmpi

# compiler
FC = gfortran

# compiler flags
CFLAGS = -I${includedir}     -pthread  -I${libdir}

# lib flags
LFLAGS = -L${libdir} -L/opt/pmix/4.2.6/lib -L/usr/lib64   -Wl,-rpath -Wl,${libdir}  -Wl,-rpath -Wl,/opt/pmix/4.2.6/lib -Wl,-rpath -Wl,/usr/lib64 -Wl,--enable-new-dtags -lmpi_usempif08 -lmpi_usempi_ignore_tkr -lmpi_mpifh -lmpi

# source files
SRCS=header utils fzero findGM findV findIntSum findIntRed
OBJS = $(SRCS:=.o)

# # executable
# EXE = exe
# OUT = output

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