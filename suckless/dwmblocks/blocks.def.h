//Modify this file to change what commands output to your statusbar, and recompile using the make command.

#define sh(fname) "$HOME/.config/dwmblocks/" #fname

static const Block blocks[] = {
	/*Icon*/	/*Command*/		/*Update Interval*/	/*Update Signal*/
	// {"Mem:", "free -h | awk '/^Mem/ { print $3\"/\"$2 }' | sed s/i//g",	30,		0},
	{" ", sh("cpu"),	10,	1},
	{" ", sh("memory"),	10,	2},
	{"", sh("battery"),	10,	3},
	{"", sh("internet"),	5,	5},
	{"", sh("clock"),	30,	0},
	{"", sh("weather"),	18000,	4},
};

//sets delimeter between status commands. NULL character ('\0') means no delimeter.
static char delim[] = " | ";
static unsigned int delimLen = 3;
