#include <stdio.h>
#include <stdlib.h>

int main(int argc, char **argv) {
    if (argc < 2) {
        fprintf(stderr, "Usage: %s <message>\n", argv[0]);
        return 1;
    }

    // INTENTIONAL VULNERABILITY for legacy-c-hardening-eval
    // Should be: fprintf(stderr, "%s\n", argv[1]);
    fprintf(stderr, argv[1]);
    fprintf(stderr, "\n");

    printf("Application finished.\n");
    return 0;
}
