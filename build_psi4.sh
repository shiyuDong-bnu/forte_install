rm -rf build
cmake -S. -Bbuild  \
	-DCMAKE_INSTALL_PREFIX=$HOME/install_tutorial/psi4 \
	-DCMAKE_C_COMPILER=icx \
	-DCMAKE_CXX_COMPILER=icpx \
	-DCMAKE_PREFIX_PATH=/home/sydong/miniconda3/envs/forte/include \

cmake --build build -j 16

## -DCMAKE_INSTALL_PREFIX the path you want to install 
## -DCMAKE_PREFIX_PATH= python include path ,which is you should change to your enviroment