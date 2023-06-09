#include <stdio.h>
#include <omp.h>

int main (int argc, char *argv[]) {
        omp_set_num_threads(4);
        #pragma omp parallel
        {
                int id = omp_get_thread_num();
                printf("Hello world from thread %d\n", id);
                if (id == 0)
                {
                        int num = omp_get_num_threads();
                        printf("Total number of threads: %d\n", num);
                }
        }
        return 0;
}