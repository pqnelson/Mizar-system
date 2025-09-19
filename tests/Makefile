# Makefile for Mizar 

# Target for installation
DESTDIR=/usr/local/bin
SYS=POSIX

# Directory for sources
MIZSRC=..

# Directories for binaries
FPCBIN=../bin

# Directories for object and unit files
FPCOBJ=../obj

# Path to Mizar units
MIZ_UNITS =base kernel usrtools libtools addtools 

# Compilers
FPC = fpc -a -al -Sdg -FE$(FPCBIN) -FU$(FPCOBJ) \
	$(addprefix -Fu$(MIZSRC)/,$(MIZ_UNITS)) 


all:
	$(FPC) -gv testrunner.pas

clean:
	rm *.o *.ppu testrunner