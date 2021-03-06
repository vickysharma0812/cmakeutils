#!/bin/bash
#
# NOTE: most Linux users can simply download and install almost instantly
#   instead of this lengthly compilation with cmake_setup.py
# ------------------------------------------------------------------------
#
# Does NOT use sudo
#
# Compiles and installs CMake on Linux (CentOS, Debian, Ubuntu)
#
# Alternatives: linuxbrew (Linux), Homebrew (Mac), Scoop (Windows)
#
# For Windows, simply use the .msi from  https://cmake.org/download/
#
# prereqs
# CentOS:    yum install gcc-c++ make ncurses-devel openssl-devel unzip
# Debian / Ubuntu: apt install g++ make libncurses-dev libssl-dev unzip
#
# Git > 2.18 required, or specify CMake version at command line e.g.
#
# ./cmake_setup.sh v3.14.2


[[ -z $PREFIX ]] && PREFIX=$HOME/.local

url=https://github.com/Kitware/CMake/releases/download/

# git >= 2.18
[[ $# -ne 1 ]] && cver=$(git ls-remote --tags --sort="v:refname" git://github.com/kitware/cmake.git | tail -n1 | sed 's/.*\///; s/\^{}//') || cver=$1

WD=build

stem=cmake-${cver:1}
cfn=$stem-SHA-256.txt
fn=$stem.tar.gz

set -e

# 0. check prereqs
if [[ $OSTYPE != cygwin ]];
then
[[ $(ldconfig -p | grep ssl) ]] || { echo "must have SSL development library installed"; exit 1; }
fi


# 1. download
[[ -f $WD/$fn ]] || curl -L $url/$cver/$fn -o $WD/$fn

# 2. build
(
cd $WD

[[ -f $cfn ]] || curl -L $url/$cver/$cfn -o $cfn
csum=$(grep $fn $cfn | cut -f1 -d' ')
[[ $(sha256sum $fn | cut -f1 -d' ') == $csum ]] || { echo "checksum does not match $fn"; exit 1; }

tar -xf $fn

echo "installing cmake to $PREFIX"

./cmake-${cver:1}/bootstrap --prefix=$PREFIX --parallel=2 -- -DCMAKE_BUILD_TYPE:STRING=Release -DCMAKE_USE_OPENSSL:BOOL=ON

make -j -l 2

mkdir -p $PREFIX

make install
)

echo "----------------------------------------------------"
echo "please add to ~/.bashrc:"
echo
echo "export PATH='$PREFIX'/bin/:$PATH'"
echo
echo "then reopen a new terminal to use CMake $cver"
