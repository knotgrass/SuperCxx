### setup

##### 1. cài đặt các package cần thiết 
```sudo apt install gcc g++ git build-essential gdb cmake make```

##### 2. <span style="color: RED">BUILD</span> `.vscode/tasks.json` 
* setup default compiler và các flag để [build](https://code.visualstudio.com/docs/cpp/config-linux#_run-helloworldcpp).
* `-I` chứa các file `header` để `include`
* `-L` để chứa các file `.so`
* `-o` chỉ output file sau khi compile: "${fileDirname}/bin/${fileBasenameNoExtension}" thay đổi vị trí lưu file sau compile. [link](https://www.youtube.com/watch?v=9pjBseGfEPU)
##### 3. <span style="color: RED">RUN/DEBUG</span> `.vscode/launch.json` 
* file này sử dụng khi `run/debug` chương trình.
* ấn F5 là có thể bắt đầu [debug](https://devblogs.microsoft.com/cppblog/visual-studio-code-c-c-extension-july-2019-update/)
* chú ý "environment" dùng để chỉ đến **những** folder chứa file `.so`
* sử dụng **abspath** bằng `${workspaceFolder}`
* 2 *abspath* cạnh nhau phân tách bằng dấu `:`
* tất cả các *abspath* nằm trong 1 cặp **double quote** duy nhất
* ví dụ
```
"environment": [
    {
        "name": "LD_LIBRARY_PATH", 
        "value": "${workspaceFolder}/include/oneapi-tbb-2021.8.0/lib/intel64/gcc4.8:${workspaceFolder}/include/oneapi-tbb-2021.8.0/lib/ia32/gcc4.8"
    }
]
```
##### 4. `c_cpp_properties.json`
* cài đặt [C/C++ configurations](https://code.visualstudio.com/docs/cpp/config-linux#_cc-configurations)

* chỉnh include path trong `.vscode/c_cpp_properties.json`


##### 5. Linking to the Library
* Khi compile cần thêm file thư viện `.so` vào flag -L [xem ví dụ](tasks.json) 
* Khi run cần khai báo **folder**  chứa file `.so` (~~không phải path của file .so~~) vào biến môi trường `LD_LIBRARY_PATH` [E.g 1](launch.json): `.vscode/launch.json`, [E.g 2](https://oneapi-src.github.io/oneDNN/dev_guide_link.html#linux-macos): oneDNN in anaconda