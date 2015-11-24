#! /bin/bash -x

set -e

gitdir=$(dirname "$0")
cd "$gitdir"

autoreconf -vfi
./configure "--prefix=$(pwd)"
make
