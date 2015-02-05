/*
 * defines for learn.
 */

#define	READY	0
#define	PRINT	1
#define	COPYIN	2
#define	COPYOUT	3
#define	UNCOPIN	4
#define	UNCOPOUT	5
#define	PIPE	6
#define	UNPIPE	7
#define	YES	8
#define	NO	9
#define	SUCCEED	10
#define	FAIL	11
#define	BYE	12
#define	LOG	13
#define	CHDIR	14
#define	LEARN	15
#define	MV	16
#define	USER	17
#define	NEXT	18
#define	SKIP	19
#define	WHERE	20
#define	MATCH	21
#define	NOP	22
#define	BAD	23
#define	CREATE	24
#define	CMP	25
#define	GOTO	26
#define	ONCE	27

extern	int	more;
extern	char	*level;
extern	int	speed;
extern	char	*sname;
extern	char	*direct;
extern	char	*todo;
extern	int	didok;
extern	int	sequence;
extern	int	comfile;
extern	int	status;
extern	int	wrong;
extern	char	*pwline;
extern	char	*dir;
extern	FILE	*incopy;
extern	FILE	*scrin;
extern	int	logging;
extern	int	ask;

void	signal_hangup(int);
void	signal_intrpt(int);
void	copy(int, FILE *);
int	pgets(char *, int, int, FILE *f);
void	trim(char *);
void	scopy(FILE *, FILE *);
int	cmp(char *);
char *	wordb(char *, char *);
void	dounit(void);
void	list(char *);
void	signal_stop(int);
int	makpipe(void);
int	maktee(void);
void	untee(void);
int *	action(char *);
void	setdid(char *, int);
int	already(char *);
int	mysys(char *);
int	system(const char *);
int	getargs(char *, char **);
void	selsub(int, char **);
void	chknam(char *);
void	selunit(void);
int	abs(int);
void	start(char *);
void	fcopy(char *, char *);
void	whatnow(void);
void	wrapup(int);
