#include "main.h"

beginseg
	name "code"
	flags BOOT OBJECT
	stack bootStack + STACKSIZE
	entry boot	
	include "codesegment.o"
endseg

beginwave
	name "main"
	include "code"
endwave
