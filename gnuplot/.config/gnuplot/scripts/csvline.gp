# Plot csv files
# Usage:
#   gnuplot -c csvline.gp "file.csv"                             -> row index vs column 1
#   gnuplot -c csvline.gp "file.csv" <col>                       -> row index vs <col>
#   gnuplot -c csvline.gp "file.csv" <x_col> <y_col1> [<y_col2>...]
if (ARGC < 1) {
    print "Usage: gnuplot -c csvline.gp \"filename.csv\" [<x_column>] [<y_column1> ...]"
    exit
}

FILE_IN = ARG1

# --- Detect the field separator (comma, semicolon, tab or whitespace) -------
SEP = system(sprintf("awk 'NR==1{if (index($0,\",\")) print \"comma\"; \
    else if (index($0,\";\")) print \"semicolon\"; \
    else if (index($0,\"\\t\")) print \"tab\"; else print \"ws\"; exit}' %s", FILE_IN))

if (SEP eq "comma")     { set datafile separator comma;  AWKSEP = "," }
if (SEP eq "semicolon") { set datafile separator ";";    AWKSEP = ";" }
if (SEP eq "tab")       { set datafile separator "\t";   AWKSEP = "\t" }
if (SEP eq "ws")        { set datafile separator whitespace; AWKSEP = "[ \t]+" }

# --- Detect whether the first line is a header (any non-numeric field) ------
HAS_HEADER = int(system(sprintf("awk -F'%s' 'NR==1{h=0; for(i=1;i<=NF;i++){ \
    f=$i; gsub(/^[ \\t\"]+|[ \\t\"]+$/,\"\",f); \
    if (f !~ /^[+-]?([0-9]+[.]?[0-9]*|[.][0-9]+)([eE][+-]?[0-9]+)?$/) h=1} \
    print h; exit}' %s", AWKSEP, FILE_IN)))

# Return the label of a column: the header text, or "column N"
label(c) = HAS_HEADER \
    ? system(sprintf("awk -F'%s' 'NR==1{f=$%d; gsub(/^[ \\t\"]+|[ \\t\"]+$/,\"\",f); print f; exit}' %s", AWKSEP, c, FILE_IN)) \
    : sprintf("column %d", c)

if (HAS_HEADER) { set key autotitle columnhead } else { unset key; set key }

set grid

if (ARGC < 3) {
    # Single-column mode: row index vs the values of one column
    COL_Y = (ARGC >= 2) ? int(ARG2) : 1
    set xlabel "row index"
    set ylabel label(COL_Y)
    plot FILE_IN using (column(0)+(HAS_HEADER?1:0)):COL_Y with lines title label(COL_Y)
} else {
    COL_X = int(ARG2)
    set xlabel label(COL_X)

    plot_command = "plot "
    do for [i=3:ARGC] {
        COL_Y = int(ARGV[i])
        plot_command = plot_command.sprintf("\"%s\" using %d:%d with lines title \"%s\"", \
            FILE_IN, COL_X, COL_Y, label(COL_Y))
        if (i < ARGC) { plot_command = plot_command.", " }
    }
    eval plot_command
}

pause mouse close
