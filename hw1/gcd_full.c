#include <stdio.h>

/* Imperative style modification of example 1.20  */

    int gcdI(int i, int j) {
       while ( i != j) { 
           if (i > j) {
              i = i - j;
           } else {
              j = j - i;
           }
       }      
       return i;
    }

/* Modiification of 1.4 page 38 */
 int  gcdM(int i, int j) {
	int r = j;
	int temp = 0;
	while(r != 0){
		temp = r;
		r = i % r;
		i = temp;
	}
   	return i;
 }

 int  gcdR(int i, int j) {
	if(i % j != 0 && j % i != 0){
		if(i > j) return gcdR(i % j, i);
		else return gcdR(i, j % i);
	}
	if(i > j) return j;
	else return i;
 }

int gcdF(int i, int j){
	if(i % j != 0 && j % i != 0){
		if(i > j) return gcdF(i % j, i);
		else return gcdF(i, j % i);
	}
	if(i > j) return i;
	else return j;
}

int main(int argc, char **argv) {
  if (argc < 3) {
    printf("%s usage: [I] [J]\n", argv[0]);
    return 1;
  }
  int i = atoi(argv[1]);
  int j = atoi(argv[2]);
  int r = gcdR(i,j);
  int o = gcdM(i, j);
  int k = gcdI(i, j);
  printf("%d\n", r);
  printf("%d\n", o);
  printf("%d\n", k);
  return 0;
}



