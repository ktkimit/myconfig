# Plot csv files
# Check if at least 2 arguments are given
if (ARGC < 3) {
    print "Usage: gnuplot -c csvline.gp \"filename.csv\" <x_column> <y_column1> [<y_column2> ...]"
    exit
}

# Assign arguments to variables
FILE_IN = ARG1
COL_X = int(ARG2)

# Read the header for the X-axis from the first line
HEADER_X = system(sprintf("awk -F',' 'NR==1{print $%d}' %s", COL_X, FILE_IN))

# Configure the plot
set datafile separator comma
set key autotitle columnhead
set xlabel HEADER_X
set grid

# Build the plot command dynamically
plot_command = "plot "
# Loop through the remaining arguments (starting from ARG3)
do for [i=3:ARGC] {
    COL_Y = int(ARGV[i])
    plot_command = plot_command.sprintf("\"%s\" using %d:%d with lines", FILE_IN, COL_X, COL_Y)
    if (i < ARGC) {
        plot_command = plot_command.", "
    }
}

# Execute the constructed plot command
eval plot_command

pause mouse close
