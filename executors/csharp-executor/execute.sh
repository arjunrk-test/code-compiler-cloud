#!/bin/sh

echo "$CODE" > Program.cs

# Compile the C# program
mcs Program.cs -out:Program.exe 2> error.log

# If compilation succeeds, run the program
if [ $? -eq 0 ]; then
    mono Program.exe
else
    cat error.log
fi
