#!/bin/bash
#git clone https://github.com/raspberrypi/tools.git
#git clone https://github.com/akhtyamovpavel/PatternsCollection
my_dir=$(pwd)
compiller=${my_dir}/tools/arm-bcm2708/arm-linux-gnueabihf/bin
sysroot=${my_dir}/tools/arm-bcm2708/arm-linux-gnueabihf/arm-linux-gnueabihf/sysroot

PATH=${PATH}:${compiller}
cd PatternsCollection
cmake ${my_dir}/PatternsCollection/CMakeLists.txt -DON_PI=ON -DSYSROOT=${sysroot}
make
make install DESTDIR=${my_dir}/project
cd ..

#zip -r archive.zip project
cd ${my_dir}/project/usr/local/bin

sudo chmod +x Facade
./Facade

