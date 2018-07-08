PROG=		learn
LCOUNT=		lcount
TEE=		tee

PREFIX?=	/usr/local
BINDIR?=	${PREFIX}/bin
MANDIR?=	${PREFIX}/man
LLIB=		${PREFIX}/share/learn

BINOWN?=	root
BINGRP?=	bin
BINMODE?=	0755
MANMODE?=	0644

CFLAGS+=	-g
CFLAGS+=	-O2 -pipe
CFLAGS+=	-Wall -Wextra -std=c99 -Wcast-qual -Wformat=2
CFLAGS+=	-Wmissing-declarations -pedantic-errors -Wstrict-prototypes
CFLAGS+=	-Wpointer-arith -Wuninitialized -Wmissing-prototypes
CFLAGS+=	-Wsign-compare -Wshadow -Wdeclaration-after-statement
CFLAGS+=	-Wfloat-equal -Wcast-align -Wundef -Wstrict-aliasing=2

all:		${PROG} ${LCOUNT} ${TEE}

${PROG}:	${PROG}.c
	${CC} ${CFLAGS} ${LDFLAGS} -o $@ ${PROG}.c

${LCOUNT}:	${LCOUNT}.c
	${CC} ${CFLAGS} ${LDFLAGS} -o $@ ${LCOUNT}.c

${TEE}:		${TEE}.c
	${CC} ${CFLAGS} ${LDFLAGS} -o $@ ${TEE}.c

# tee and lcount must be installed in LLIB!
# old makefile installed learn into LLIB as well - is it needed there?
install:	${PROG} ${LCOUNT} ${TEE}
	install -d ${BINDIR}
	install -c -S -s -o ${BINOWN} -g ${BINGRP} -m ${BINMODE} \
	    ${PROG} ${BINDIR}
	install -c -S -o ${BINOWN} -g ${BINGRP} -m ${MANMODE} \
	    ${PROG}.1 ${MANDIR}/man1
	install -d ${LLIB}
	install -c -S -s -o ${BINOWN} -g ${BINGRP} -m ${BINMODE} \
	    ${LCOUNT} ${TEE} ${LLIB}
	cp -R lib/* ${LLIB}

uninstall:
	rm ${BINDIR}/${PROG}
	rm ${MANDIR}/man1/${PROG}.1
	rm -R ${LLIB}

clean:
	rm -f [Ee]rrs mklog *.core core.* ${PROG} ${LCOUNT} ${TEE} *.o *.d

.PHONY:		all install uninstall clean
