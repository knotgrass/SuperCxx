#include <iostream>
#include <torch/torch.h>

struct Net : torch::nn::Module {
    Net(int64_t N, int64_t M): linear(register_module("linear", torch::nn::Linear(N, M))) {
        another_bias = register_parameter("b", torch::randn(M));
    }

    torch::Tensor forward(torch::Tensor input) {
        return linear(input) + another_bias;
    }
    torch::nn::Linear linear;
    torch::Tensor another_bias;
};

int main(int argc, char* argv[] ) {
    torch::Device* pdevice;
    torch::Tensor tensor = torch::rand({2, 3});

    if (torch::cuda::is_available())
        pdevice = new torch::Device(torch::kCUDA);
    else
        pdevice = new torch::Device(torch::kCPU);

    tensor = tensor.to(*pdevice);
    delete pdevice;
    std::cout << tensor << std::endl;
    return 0;
}
