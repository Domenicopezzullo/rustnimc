#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>

static inline int32_t fib(int32_t n, int32_t *memo) {
    if (n < 2) {
        return n;
    }
    if (memo[n] != -1) {
        return memo[n];
    }
    memo[n] = fib(n - 1, memo) + fib(n - 2, memo);
    return memo[n];
}

int main(void) {
    const int32_t n = 10;
    int32_t *memo = (int32_t *)malloc((n + 1) * sizeof(int32_t));

    if (memo == NULL) {
        fprintf(stderr, "Memory allocation failed\n");
        return 1;
    }

    for (int32_t i = 0; i <= n; i++) {
        memo[i] = -1;
    }

    int32_t acc = 0;
    for (int32_t i = 0; i < 1000000; i++) {
        acc += fib(n, memo);
    }

    printf("%d\n", acc);

    free(memo);
    return 0;
}
