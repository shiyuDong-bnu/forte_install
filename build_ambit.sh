cmake -S. -B build \
	-DCMAKE_CXX_COMPILER=icpx \
	-DCMAKE_C_COMPILER=icx \
	-DHDF5_ROOT=$HOME/install_tutorial/hdf5/cmake \
	-DCMAKE_INSTALL_PREFIX=$HOME/install_tutorial/ambit \

cmake --build build -j16
## -DHDF5_ROOT the installed hdf5 directory 