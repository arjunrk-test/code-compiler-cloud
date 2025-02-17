#!/bin/bash

# Create a Bash file inside the container 
echo -e "$CODE" | base64 -d > /usr/src/app/script.sh

# Create input file inside the container (only if input is provided)
if [ ! -z "$INPUT" ]; then
    echo -e "$INPUT" | base64 -d > /usr/src/app/input.txt
fi

# Check if the Bash script exists
if [ ! -f "/usr/src/app/script.sh" ]; then
  echo "No Bash script found!"
  exit 1
fi

# Give execution permissions to the script
chmod +x /usr/src/app/script.sh

# Run the script, capturing both stdout and stderr
if [ -f "/usr/src/app/input.txt" ]; then
    bash /usr/src/app/script.sh < /usr/src/app/input.txt 2>&1 | tee runtime_error.txt
else
    bash /usr/src/app/script.sh 2>&1 | tee runtime_error.txt
fi

if [ $? -ne 0 ]; then
  cat syntax_error.txt
  exit 1
fi

