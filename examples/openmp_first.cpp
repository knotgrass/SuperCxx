#include <stdio.h>

int main(int argc, char* argv[])
{
#pragma omp parallel
  printf("This is a thread.\n");
  return 0;
}

/*
 * g++ -fopenmp examples/openmp_first.cpp -o examples/bin/openmp_first
 */