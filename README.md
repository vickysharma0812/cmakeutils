[![Build Status](https://travis-ci.com/scivision/cmake-utils.svg?branch=master)](https://travis-ci.com/scivision/cmake-utils)
[![Build status](https://ci.appveyor.com/api/projects/status/bg07qlioi71k3stx?svg=true)](https://ci.appveyor.com/project/scivision/cmake-utils)
[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.1488084.svg)](https://doi.org/10.5281/zenodo.1488084)

# CMake Utils

CMake is a powerful and easy to use build system for a wide variety of languages including:
 
* C / C++
* modern object-oriented Fortran 2008 / 2018
* Python
* Matlab / GNU Octave

It's important to use a recent CMake version to be effective and clean with CMake script.
SSL support is also essential for any download/upload with CMake.

## Install CMake

* MacOS: `brew install cmake`
* [Windows](https://cmake.org/download/)
* Linux: 
  1. browse to https://cmake.org/download/
  2. scroll down to "Binary Distributions"
  3. download cmake-*-Linux-x86_64.sh
  4. install CMake for Linux almost instantly by:
    ```sh
    ./cmake-*-Linux-x86_64.sh --prefix=$HOME/.local --exclude-subdir
    ```
    

## Examples

* Download with [SSL](./ssl)
* Download and extract [ZIP](./zip)

### GNU Octave

[Octave from CMake](./octave) via our 
[FindOctave.cmake](./cmake/Modules/FindOctave.cmake) 
works well from CMake for unit tests, liboctave, etc. for Octave &ge; 3.8.
We didn't try older versions of Octave.

### Matlab

One-time setup: if you've never used `mex` before, you must setup the C++ compiler.
It doesn't hurt to do this again if you're not sure.
From Matlab:
```matlab
mex -setup -client engine C++
```

Will ask you to select a compiler, or simply return:

> ENGINE configured to use 'g++' for C++ language compilation.



## CMake modules

To avoid duplication, we have several scientific computing CMake modules in 
[scivision/fortran-libs](https://github.com/scivision/fortran-libs/tree/master/cmake/Modules) 
repo.
