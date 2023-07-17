#include <iostream>
#include <algorithm>
#include <cmath>

int main(){
    const unsigned int size = 100'000'000;
    float* vals = new float[size];
    std::fill_n(vals, size, 1.0f);

    double total = 0.0f;
    float ss = 0.0f;

    for (int i=0; i<size; ++i){
        total += vals[i];
        ss = std::fabs(total - float(i+1));

        if (i >= 16777215){
            printf("vals[%d]=%0.40f\ttotal=%0.40f\tsaiso=%0.40f\n", i, vals[i], total, ss);
        }
    }

    // assert(std::fabs(total - float(size)) <= 1e-6);
    std::cout << total << '\n' <<std::endl;
    delete[] vals;
    return 0;
}
