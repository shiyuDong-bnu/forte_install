cmake -S. -B build \
	-DCMAKE_C_COMPILER=icx \
	-DCMAKE_CXX_COMPILER=icpx \
	-DCMAKE_INSTALL_PREFIX=$HOME/install_tutorial/hdf5 \


cmake --build build -j16
