PROG=		learn
LPROGS=		lcount tee

PREFIX?=	/usr/local
BINDIR?=	${PREFIX}/bin
MANDIR?=	${PREFIX}/man/man
LLIB=		${PREFIX}/share/learn

CFLAGS+=	-g
ifeq ($(shell uname),Linux)
CFLAGS+=	-D_BSD_SOURCE -lbsd -Wno-format-nonliteral
.CURDIR=	$(shell pwd)
endif
CFLAGS+=	-Wall -Wextra -std=c99 -Wcast-qual -Wformat=2
CFLAGS+=	-Wmissing-declarations -pedantic-errors -Wstrict-prototypes
CFLAGS+=	-Wpointer-arith -Wuninitialized -Wmissing-prototypes
CFLAGS+=	-Wsign-compare -Wshadow -Wdeclaration-after-statement
CFLAGS+=	-Wfloat-equal -Wcast-align -Wundef -Wstrict-aliasing=2

CLEANFILES+=	${LPROGS}

all:		${PROG} ${LPROGS}

# tee and lcount must be installed in LLIB!
# old makefile installed learn into LLIB as well - is it needed there?
afterinstall:	${LPROGS}
	install -d ${LLIB}
	install -c -S -s -o ${BINOWN} -g ${BINGRP} -m ${BINMODE} \
	    ${LPROGS} ${LLIB}
	cp -R ${.CURDIR}/lib/* ${LLIB}

uninstall:
	rm ${BINDIR}/${PROG}
	rm ${MANDIR}1/${PROG}.1
	rm -R ${LLIB}

ifeq ($(shell uname),Linux)
else
.include <bsd.prog.mk>
endif
