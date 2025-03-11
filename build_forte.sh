source_dir=/home/sydong/work/learnspace/quantum_chemistry/software/forte_install/forte
rm -rf $source_dir/CMakeCache.txt $source_dir/CMakeFiles
psi4_plugin=`psi4 --plugin-compile`
$psi4_plugin -S$source_dir \
	-B$source_dir \
	-DCMAKE_C_COMPILER=icx \
	-DCMAKE_CXX_COMPILER=icpx \
	-Dambit_DIR=$HOME/install_tutorial/ambit/share/cmake/ambit/ \
	-DHDF5_ROOT=$HOME/install_tutorial/hdf5/cmake \
	-DCMAKE_BUILD_TYPE=Debug \

cmake --build  $source_dir  -j16
## -Dambit_DIR= the installed ambit directory 
## -DHDF5_ROOT is  installed hdf5 directory 
## source_dir your forte src directory 
## !! unlike most software ,forte is build just in source directory ,
## which is generally not recommended .
