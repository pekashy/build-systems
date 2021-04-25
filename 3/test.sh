cd TechProgSimpleLibrary
wget "https://releases.linaro.org/components/toolchain/binaries/latest-7/arm-linux-gnueabihf/gcc-linaro-7.5.0-2019.12-i686_arm-linux-gnueabihf.tar.xz" -O gcc-linaro-7.5.0-2019.12-i686_arm-linux-gnueabihf.tar.xz && tar -xf gcc-linaro-7.5.0-2019.12-i686_arm-linux-gnueabihf.tar.xz > gcc-linaro-7.5.0-2019.12-i686_arm-linux-gnueabihf && rm sysroot-glibc-linaro-2.25-2019.12-armv8l-linux-gnueabihf.tar.xz

wget "http://releases.linaro.org/components/toolchain/binaries/7.5-2019.12/armv8l-linux-gnueabihf/sysroot-glibc-linaro-2.25-2019.12-armv8l-linux-gnueabihf.tar.xz" -O sysroot-glibc-linaro-2.25-2019.12-armv8l-linux-gnueabihf.tar.xz && tar -xf sysroot-glibc-linaro-2.25-2019.12-armv8l-linux-gnueabihf.tar.xz > sysroot-glibc-linaro-2.25-2019.12-armv8l-linux-gnueabihf && rm sysroot-glibc-linaro-2.25-2019.12-armv8l-linux-gnueabihf.tar.xz

cmake .
make
cmake --install .
qemu-arm -L . ./bin/MainLib
qemu-arm -L . ./bin/Main
