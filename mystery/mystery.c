#include <stdio.h>
#include <string.h>

/* Reconstructed version of mystery.s
 fibonacci with a few extra functions to try to obscure its true nature
 this is an attempt to faithfully recreate it.

 It seems that in the assembly it was being called recursively, but in practice
 this takes too long so I have used the better method of simply creating an array and
 working iteratively.
*/

int add(int a, int b){
    return a + b;
}

int dothething(int n) {

    int memo[n+2];
    memo[0] = 0L;
    memo[1] = 1L;

    for (int i = 2; i <= n; i++){
        memo[i] = add(memo[i-1], memo[i-2]);
    }

    return memo[n];

}
int main(int argc, char* argv[]){
    int n;
    int fib;
    sscanf(argv[1], "%d", &n); // get arg into an int... can't use atoi as in mystery.s
    if (n > 199){ //this check was in the assembly code I believe.
        n = 0;
    }
    fib = dothething(n);
    printf("Value: %d\n", fib);
}
