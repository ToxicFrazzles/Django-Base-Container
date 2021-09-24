#!/usr/bin/env bash
export PYTHON_VERSION 3.9.7
wget https://www.python.org/ftp/python/$PYTHON_VERSION/Python-$PYTHON_VERSION.tgz
tar -xf Python-$PYTHON_VERSION.tgz
cd Python-$PYTHON_VERSION
./configure --enable-optimizations
make -j $(nproc)
make altinstall
cd ../
rm Python-$PYTHON_VERSION.tgz
rm -rf Python-$PYTHON_VERSION
update-alternatives --install /usr/bin/python python /usr/local/bin/python3.9 1
update-alternatives --install /usr/bin/pip pip /usr/local/bin/pip3.9 1