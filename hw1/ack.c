#include <stdio.h>
#include <stdlib.h>

int ack(int m, int n){
	if(m == 0) return n+1;
	else if(n == 0 && m > 0) return ack(m-1, 1);
	else return ack(m-1, ack(m, n-1));
}

int main(int argc, char * argv[]){
	printf("%d\n", ack(atoi(argv[1]), atoi(argv[2])));
}