#!/bin/bash

# Check if the env.sh file exists
if [ ! -f "env.sh" ]; then
    echo "env.sh file not found!"
    exit 1
fi

# Create or overwrite the env.list file
> env.list

# Read through each line of env.sh
while IFS= read -r line; do
    # Skip comments and empty lines
    if [[ ! $line =~ ^# ]] && [[ -n $line ]]; then
        # Strip 'export ' and remove any quotes from the value, then write to env.list
        sanitized_line=$(echo "${line#export }" | sed 's/["'\'']//g')
        echo "$sanitized_line" >> env.list
    fi
done < env.sh

echo "Conversion complete. The env.list file has been created."
