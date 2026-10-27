#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <string.h>



int main(int argc, char **argv) {
    size_t alloc_size = 512 * 1024 * 1024; 
    int num_chuncks = 16;
    char **chunks = malloc(num_chuncks * sizeof(char*));
    for (int i = 0; i < num_chuncks; i++) {
        chunks[i] = malloc(alloc_size);
        for (size_t j = 0; j < alloc_size; j+= 4096) {
            chunks[i][j] = (char)(j % 256);
        }
        printf ("Bloc  %d assignat (Total: %d MB)\n", i + 1, (i + 1) * 512);
    }
    getchar();
    for (int i = 0; i < num_chuncks; i++) {
        free(chunks[i]);
    }
    free(chunks);
    return 0;
}


