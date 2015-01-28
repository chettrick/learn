PROG=		learn
LPROGS=		lcount tee

PREFIX?=	/usr/local
BINDIR?=	${PREFIX}/bin
MANDIR?=	${PREFIX}/man/man
LLIB=		${PREFIX}/share/learn

CFLAGS+=	-g

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

.include <bsd.prog.mk>
