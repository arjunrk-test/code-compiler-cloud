#!/bin/sh
echo "$CODE" > main.cpp

# Compile the C++ program
g++ main.cpp -o main.out 2> error.log

# If compilation succeeds, run the program
if [ $? -eq 0 ]; then
    ./main.out
else
    cat error.log
fi
