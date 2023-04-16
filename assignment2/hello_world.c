#include <stdio.h>
#include <omp.h>

int main (int argc, char *argv[]) {
        omp_set_num_threads(4);
        #pragma omp parallel
        {
                int id = omp_get_thread_num();
                printf("Hello world %d of %d\n", id, 4);
        }
        return 0;
}