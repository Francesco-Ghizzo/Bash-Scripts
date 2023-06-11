#!/bin/bash

# This small tool cuts extracts a column interval from a comma separated (.csv) file.
# For separators different than comma (','), change 'delimiter' variable

# Usage: 

# chmod +x cut_columns.sh 
# ./cut_columns.sh file.csv i j, where i is the first column and j is the last column of the interval you want to cut.

# Example:

# ./cut_columns.sh file.csv 2 3

delimiter=","

filename=$1

start_column=$2

end_column=$3

cut_columns=""

for (( column=start_column; column<=end_column; column++ ))
do
	cut_columns+="<(cut -d$delimiter -f$column < $filename | head) "
done

full_command="paste -d, "$cut_columns

eval $full_command
