include $(ROOT)/usr/include/make/PRdefs

N64KITDIR    = $(N64_SDK)/nintendo/n64kit
NUSYSINCDIR  = $(N64KITDIR)/nusys/include
NUSYSLIBDIR  = $(N64KITDIR)/nusys/lib

LIB = $(ROOT)/usr/lib
LPR = $(LIB)/PR
INC = $(ROOT)/usr/include

LCDEFS =	
LCINCS =	-I. -I$(NUSYSINCDIR) -I$(ROOT)/usr/include/PR
LCOPTS =	-G 0
LDFLAGS = $(MKDEPOPT) -L$(LIB) -lgultra_rom -L$(NUSYSLIBDIR) -L$(GCCDIR)/mipse/lib -lkmc -Ltarget/mips-unknown-elf/debug -lminimal

OPTIMIZER   =	-g

APP         =	minimal.out

TARGETS     =	minimal.n64

HFILES      =	

CFILES      = 	main.c

RUSTLIB     =   target/mips-unknown-elf/debug/libminimal.a

CARGO       =   xargo

CARGO_OPTS  =   --target=mips-unknown-elf

CODEOBJECTS =	$(CFILES:.c=.o)

DATAFILES   =  

DATAOBJECTS =	$(DATAFILES:.c=.o)

CODESEGMENT =	codesegment.o

OBJECTS     =	$(CODESEGMENT) $(DATAOBJECTS) 

default:        $(TARGETS)

include $(COMMONRULES)

$(RUSTLIB):
	$(CARGO) build $(CARGO_OPTS)

$(CODESEGMENT):	$(CODEOBJECTS) $(RUSTLIB) Makefile
		$(LD) -o $(CODESEGMENT) -r $(CODEOBJECTS) $(LDFLAGS)

$(TARGETS):	$(OBJECTS)
	#       spicy not working for me
	#	$(MAKEROM) spec -I$(NUSYSINCDIR) -r minimal.n64 -e minimal.out

clean: 
	rm -f *.o && rm -f *.n64 && rm -f *.out && $(CARGO) clean
