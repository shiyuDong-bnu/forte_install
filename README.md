# Installation of forte 
reproducing the result from https://lcygroup.org/instructions-for-installation-of-forte/
## prerequisite
<ol>
<li> gcc 14.2.0 
<li> Intel(R) oneAPI DPC++/C++ Compiler 2025.0.4
<li>  cmake version 3.31.5
</ol>

## Install psi4
#### 1. install dependency using conda
```sh

(base) sydong@debianlab:~/forte_install$ conda  env create -f forte.yml
Channels:
 - conda-forge
 - defaults
Platform: linux-64

```

```sh
(base) sydong@debianlab:~/forte_install$ conda activate forte
```
#### 2. downlaod psi4
```sh
(forte) sydong@debianlab:~/forte_install$ git clone https://ghproxy.cn/https://github.com/psi4/psi4.git
(forte) sydong@debianlab:~/forte_install$ cd psi4
(forte) sydong@debianlab:~/forte_install/psi4$ git tag
v1.0
v1.1
v1.1a1
v1.1rc1
v1.1rc2
v1.2
```

```sh
(forte) sydong@debianlab:~forte_install/psi4$ git checkout v1.9.1
Note: switching to 'v1.9.1'.

You are in 'detached HEAD' state. You can look around, make experimental
changes and commit them, and you can discard any commits you make in this
state without impacting any branches by switching back to a branch.

If you want to create a new branch to retain commits you create, you may
do so (now or later) by using -c with the switch command. Example:

  git switch -c <new-branch-name>

Or undo this operation with:

  git switch -

Turn off this advice by setting config variable advice.detachedHead to false

HEAD is now at f53cdd7cb v1.9.1
```

We are now at source folder and need to run compilation using cmake

```sh
(forte) sydong@debianlab:~/forte_install/psi4$ cp ../build_psi4.sh  .
(forte) sydong@debianlab:~/forte_install/psi4$ bash build_psi4.sh 
-- The C compiler identification is IntelLLVM 2025.0.4
-- The CXX compiler identification is IntelLLVM 2025.0.4
-- Detecting C compiler ABI info
-- Detecting C compiler ABI info - done
-- Check for working C compiler: /home/sydong/intel/oneapi/2025.0/bin/icx - skipped
```

If it all goes will , you will finish the compilation ,the output may be
```sh
-- Installing: /home/sydong/work/learnspace/quantum_chemistry/software/forte_install/psi4/build/stage/share/cmake/psi4/custom_cxxstandard.cmake
-- Installing: /home/sydong/work/learnspace/quantum_chemistry/software/forte_install/psi4/build/stage/share/cmake/psi4/xhost.cmake
-- Installing: /home/sydong/work/learnspace/quantum_chemistry/software/forte_install/psi4/build/stage/share/cmake/psi4/psi4Config.cmake
-- Installing: /home/sydong/work/learnspace/quantum_chemistry/software/forte_install/psi4/build/stage/share/cmake/psi4/psi4ConfigVersion.cmake
[100%] Completed 'psi4-core'
[100%] Built target psi4-core
```
now we install it 
```sh
(forte) sydong@debianlab:~/forte_install/psi4$ cd build
(forte) sydong@debianlab:~/forte_install/psi4/build$ make install 
[ 11%] Installing Psi4-detected BLAS/LAPACK
-- Install configuration: "Release"
[ 11%] Built target lapack_external
[ 22%] Performing build step for 'psi4-core'
[  1%] Generating version info
Defining release version: 1.9.1+f53cdd7 (recorded and computed)
1.9.1 {HEAD} f53cdd7 1.9.1.0  release 1.9.1 <-- 1.9.1+f53cdd7
[  1%] Built target update_version
[  1%] Built target diis
```
#### 3. set enviromental variable
check the psi4 at the installation directory 
```sh
(forte) sydong@debianlab:~/forte_install/psi4/build$ ls ~/install_tutorial/
psi4
(forte) sydong@debianlab:~/forte_install/psi4/build$ cd ../../
```
set the enviromental variable
```sh
(forte) sydong@debianlab:~/forte_install$ cp psi4_env.sh ~/install_tutorial/
(forte) sydong@debianlab:~/forte_install$ source ~/install_tutorial/psi4_env.sh 
(forte) sydong@debianlab:~/forte_install$ which psi4
/home/sydong/install_tutorial/psi4/bin/psi4
```
#### 4. test 
```sh
(forte) sydong@debianlab:~/forte_install$ cd psi4/tests/scf1/
(forte) sydong@debianlab:~/forte_install/psi4/tests/scf1$ psi4
    Nuclear repulsion energy..............................................................PASSED
    Reference energy......................................................................PASSED
```
## Install ambit
#### 1. download ambit and hdf5
#### 2. install hdf5
#### 3. install ambit
#### 4. set enviromental variable
## Install forte
#### 1. download forte
#### 2. patch active_space_integra.cc
#### 3. build forte
#### 4. set forte enviroment variable
## Test forte
