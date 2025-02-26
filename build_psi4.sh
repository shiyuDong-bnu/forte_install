rm -rf build
cmake -S. -Bbuild  \
	-DCMAKE_INSTALL_PREFIX=$HOME/install_tutorial/psi4 \
	-DCMAKE_C_COMPILER=icx \
	-DCMAKE_CXX_COMPILER=icpx \
	-DCMAKE_PREFIX_PATH=/home/sydong/miniconda3/envs/forte/include \

cmake --build build -j 16
