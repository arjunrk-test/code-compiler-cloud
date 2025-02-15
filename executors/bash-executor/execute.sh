#!/bin/bash

# Check if the Bash script exists
if [ ! -f "/usr/src/app/script.sh" ]; then
  echo "No Bash script found!"
  exit 1
fi

# Give execution permissions to the script
chmod +x /usr/src/app/script.sh

# Run the script, capturing both stdout and stderr
/bin/bash -n /usr/src/app/script.sh 2> syntax_error.txt
if [ $? -ne 0 ]; then
  cat syntax_error.txt
  exit 1
fi

/bin/bash /usr/src/app/script.sh 2> runtime_error.txt
if [ $? -ne 0 ]; then
  cat runtime_error.txt
  exit 1
fi
