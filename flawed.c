#include <stdio.h>
#include <string.h>
void uncalled() {
puts("SEKKRIT STUFF!\n");
}
void smash(char *input) {
char buffer[5];
strcpy(buffer, input); // Vulnerable function
}
int main(int argc, char *argv[]) {
if (argc != 2) {
printf("Usage: %s <input>\n", argv[0]);
return 1;
}
smash(argv[1]);
return 0;
}

