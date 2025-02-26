rm -rf CMakeCache.txt CMakeFiles
psi4_plugin=`psi4 --plugin-compile`
$psi4_plugin -S.  \
	-DCMAKE_C_COMPILER=icx \
	-DCMAKE_CXX_COMPILER=icpx \
	-Dambit_DIR=$HOME/install_tutorial/ambit/share/cmake/ambit/ \
	-DCMAKE_BUILD_TYPE=Debug \

cmake --build  .  -j16
