#!/bin/sh
echo "$CODE" > main.c

# Compile the C program
gcc main.c -o main.out 2> error.log

# If compilation succeeds, run the program
if [ $? -eq 0 ]; then
    ./main.out
else
    cat error.log
fi
