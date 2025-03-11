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
```sh
(forte) sydong@debianlab:~/forte_install$ git clone https://ghproxy.cn/https://github.com/jturney/ambit 
Cloning into 'ambit'...
warning: redirecting to https://ghproxy.cfd/https:/github.com/jturney/ambit/
remote: Enumerating objects: 4298, done.
remote: Counting objects: 100% (258/258), done.
remote: Compressing objects: 100% (20/20), done.
remote: Total 4298 (delta 240), reused 238 (delta 238), pack-reused 4040 (from 1)
Receiving objects: 100% (4298/4298), 1.25 MiB | 536.00 KiB/s, done.
Resolving deltas: 100% (2823/2823), done.
```
```sh
(forte) sydong@debianlab:~/forte_install$ git clone https://ghproxy.cn/https://github.com/HDFGroup/hdf5
Cloning into 'hdf5'...
warning: redirecting to https://ghproxy.cfd/https:/github.com/HDFGroup/hdf5/
remote: Enumerating objects: 751025, done.
remote: Counting objects: 100% (2449/2449), done.
remote: Compressing objects: 100% (963/963), done.
remote: Total 751025 (delta 2263), reused 1500 (delta 1486), pack-reused 748576 (from 2)
Receiving objects: 100% (751025/751025), 584.75 MiB | 17.17 MiB/s, done.
Resolving deltas: 100% (676804/676804), done.
```
#### 2. install hdf5
```sh
(forte) sydong@debianlab:~/forte_install$ cd hdf5
(forte) sydong@debianlab:~/forte_install/hdf5$ cp ../build_hdf5.sh .
(forte) sydong@debianlab:~/forte_install/hdf5$ bash build_hdf5.sh 
-- The C compiler identification is IntelLLVM 2025.0.4
-- Detecting C compiler ABI info
-- Detecting C compiler ABI info - done
-- Check for working C compiler: /home/sydong/intel/oneapi/2025.0/bin/icx - skipped
-- Detecting C compile features
-- Detecting C compile features - done

(forte) sydong@debianlab:~/forte_install/hdf5$ cd  build/
(forte) sydong@debianlab:~/forte_install/hdf5/build$ make install 
(forte) sydong@debianlab:~/forte_install/hdf5$ cd build/
(forte) sydong@debianlab:~/forte_install/hdf5/build$ make install 
[ 13%] Built target hdf5-static
[ 25%] Built target hdf5-shared
[ 25%] Built target hdf5_test-static
[ 26%] Built target hdf5_test-shared
(forte) sydong@debianlab:~/forte_install/hdf5/build$ ls ~/install_tutorial/
hdf5  psi4  psi4_env.sh
```
#### 3. install ambit
```sh
(forte) sydong@debianlab:~/forte_install$ cd ambit/
(forte) sydong@debianlab:~/forte_install/ambit$ cp ../build_ambit.sh .
(forte) sydong@debianlab:~/forte_install/ambit$ bash build_ambit.sh 
-- The C compiler identification is IntelLLVM 2025.0.4
-- The CXX compiler identification is IntelLLVM 2025.0.4
-- Detecting C compiler ABI info
-- Detecting C compiler ABI info - done
-- Check for working C compiler: /home/sydong/intel/oneapi/2025.0/bin/icx - skipped
-- Detecting C compile features
-- Detecting C compile features - done

(forte) sydong@debianlab:~/forte_install/ambit$ cd build/
(forte) sydong@debianlab:~/forte_install/ambit/build$ make install 
(forte) sydong@debianlab:~/forte_install/ambit/build$ ls ~/install_tutorial/
ambit  hdf5  psi4  psi4_env.sh
(forte) sydong@debianlab:~/forte_install/ambit/build$ cd ../../
```

#### 4. set enviromental variable
now we install hdf5 and ambit in the desired directory ,we need to set enviromental variables
```sh
(forte) sydong@debianlab:~/forte_install$ cp ambit_hdf5_env.sh  ~/install_tutorial/
(forte) sydong@debianlab:~/forte_install$ source ~/install_tutorial/ambit_hdf5_env.sh
(forte) sydong@debianlab:~/forte_install$ python
Python 3.12.9 | packaged by conda-forge | (main, Feb 14 2025, 08:00:06) [GCC 13.3.0] on linux
Type "help", "copyright", "credits" or "license" for more information.
>>> import ambit
>>> 


```
## Install forte
#### 1. download forte
```sh
(base) sydong@debianlab:~/forte_install$ git clone git@github.com:evangelistalab/forte.git
Cloning into 'forte'...
remote: Enumerating objects: 47382, done.
remote: Counting objects: 100% (346/346), done.
remote: Compressing objects: 100% (173/173), done.
remote: Total 47382 (delta 251), reused 206 (delta 172), pack-reused 47036 (from 2)
Receiving objects: 100% (47382/47382), 68.53 MiB | 5.70 MiB/s, done.
Resolving deltas: 100% (33983/33983), done.
(forte) sydong@debianlab:~/forte_install$ cd forte
(forte) sydong@debianlab:~/forte_install/forte$ git tag
v0.1.0
v0.2.0
v0.2.3
v0.3.0
v0.4.0
v0.4.1
v0.4.2
v0.4.3
(forte) sydong@debianlab:~/forte_install/forte$ git checkout v0.4.3
Note: switching to 'v0.4.3'.

You are in 'detached HEAD' state. You can look around, make experimental
changes and commit them, and you can discard any commits you make in this
state without impacting any branches by switching back to a branch.

If you want to create a new branch to retain commits you create, you may
do so (now or later) by using -c with the switch command. Example:

  git switch -c <new-branch-name>

Or undo this operation with:

  git switch -

Turn off this advice by setting config variable advice.detachedHead to false

HEAD is now at 259d7b80 Expose CI RDMs (#440)

```
#### ~~2. patch active_space_integra.cc~~
Do not need patch ,if you set your compiler correct.
```sh
(forte) sydong@debianlab:~/work/learnspace/quantum_chemistry/software/forte_install/forte$ cp ../build_forte.sh  .
(forte) sydong@debianlab:~/work/learnspace/quantum_chemistry/software/forte_install/forte$ bash build_forte.sh 
loading initial cache file /home/sydong/install_tutorial/psi4/share/cmake/psi4/psi4PluginCache.cmake
-- The C compiler identification is IntelLLVM 2025.0.4
-- The CXX compiler identification is IntelLLVM 2025.0.4
-- Detecting C compiler ABI info
-- Detecting C compiler ABI info - done
-- Check for working C compiler: /home/sydong/intel/oneapi/2025.0/bin/icx - skipped
-- Detecting C compile features

/home/sydong/work/learnspace/quantum_chemistry/software/forte_install/forte/forte/integrals/active_space_integrals.cc:481:10: error: no member named 'transform' in namespace 'std'
  481 |     std::transform(oei_a_.begin(), oei_a_.end(), as_ints->oei_a_vector().begin(), oei_a_.begin(),
      |     ~~~~~^
/home/sydong/work/learnspace/quantum_chemistry/software/forte_install/forte/forte/integrals/active_space_integrals.cc:483:10: error: no member named 'transform' in namespace 'std'
  483 |     std::transform(oei_b_.begin(), oei_b_.end(), as_ints->oei_b_vector().begin(), oei_b_.begin(),
      |     ~~~~~^
/home/sydong/work/learnspace/quantum_chemistry/software/forte_install/forte/forte/integrals/active_space_integrals.cc:486:10: error: no member named 'transform' in namespace 'std'
  486 |     std::transform(tei_aa_.begin(), tei_aa_.end(), as_ints->tei_aa_vector().begin(),
      |     ~~~~~^
[ 53%] Building CXX object forte/CMakeFiles/_forte.dir/integrals/make_integrals.cc.o
/home/sydong/work/learnspace/quantum_chemistry/software/forte_install/forte/forte/integrals/active_space_integrals.cc:488:10: error: no member named 'transform' in namespace 'std'
  488 |     std::transform(tei_ab_.begin(), tei_ab_.end(), as_ints->tei_ab_vector().begin(),
      |     ~~~~~^
/home/sydong/work/learnspace/quantum_chemistry/software/forte_install/forte/forte/integrals/active_space_integrals.cc:490:10: error: no member named 'transform' in namespace 'std'
  490 |     std::transform(tei_bb_.begin(), tei_bb_.end(), as_ints->tei_bb_vector().begin(),
      |     ~~~~~^
5 errors generated.
gmake[2]: *** [forte/CMakeFiles/_forte.dir/build.make:1423: forte/CMakeFiles/_forte.dir/integrals/active_space_integrals.cc.o] Error 1
gmake[2]: *** Waiting for unfinished jobs....
gmake[1]: *** [CMakeFiles/Makefile2:209: forte/CMakeFiles/_forte.dir/all] Error 2
gmake: *** [Makefile:136: all] Error 2

```
~~Now the std::transform is recognised,we need to include algorithm~~
```sh
(forte) sydong@debianlab:~/forte_install/forte$ vi forte/integrals/active_space_integrals.cc 
(forte) sydong@debianlab:~/forte_install/forte$ git diff forte/integrals/active_space_integrals.cc
diff --git a/forte/integrals/active_space_integrals.cc b/forte/integrals/active_space_integrals.cc
index a6d69891..9504b2d6 100644
--- a/forte/integrals/active_space_integrals.cc
+++ b/forte/integrals/active_space_integrals.cc
@@ -33,6 +33,7 @@
 
 #include "base_classes/mo_space_info.h"
 #include "integrals/active_space_integrals.h"
+#include <algorithm>
 
 #define FAST_SLATER_RULES 0

```
#### 3. build forte
```sh
(forte) sydong@debianlab:~/forte_install/forte$ bash build_forte.sh 
loading initial cache file /home/sydong/install_tutorial/psi4/share/cmake/psi4/psi4PluginCache.cmake
-- The C compiler identification is IntelLLVM 2025.0.4
-- The CXX compiler identification is IntelLLVM 2025.0.4

```
#### 4. set forte enviroment variable
```sh
[ 98%] Built target _forte
[ 99%] Linking CXX executable forte_benchmarks
[ 99%] Built target forte_benchmarks
[100%] Linking CXX executable forte_tests
[100%] Built target forte_tests

```
Now we set forte enviromenta variable
```sh
(forte) sydong@debianlab:~/forte_install/forte$ cd ..
(forte) sydong@debianlab:~/forte_install$ source forte_env.sh 
(forte) sydong@debianlab:~/forte_install$ python
Python 3.12.9 | packaged by conda-forge | (main, Feb 14 2025, 08:00:06) [GCC 13.3.0] on linux
Type "help", "copyright", "credits" or "license" for more information.
>>> import forte
>>> 

```

## Test forte
```sh
(forte) sydong@debianlab:~/forte_install$ cd forte/tests/methods/
(forte) sydong@debianlab:~/forte_install/forte/tests/methods$ ./run_forte_tests.py 
Running forte tests using the psi4 executable found in:
  /home/sydong/install_tutorial/psi4/bin/psi4

Test group API
    Running test PASS_OPTIONS
INFO:psi4.driver.driver:Return energy(): -7.69658188092514
    SCF energy............................................................................PASSED
    FCI energy............................................................................PASSED

```