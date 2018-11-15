FROM nvidia/cuda:8.0-cudnn7-devel
#FROM ubuntu:16.04

RUN buildDeps='wget unzip libopenblas-dev libopencv-dev libboost-dev libboost-system-dev libboost-filesystem-dev libboost-regex-dev libboost-thread-dev  libboost-python-dev libprotobuf-dev protobuf-compiler libgflags-dev libgoogle-glog-dev python-numpy python-opencv libmpich-dev' \
    && apt-get update \
    && apt-get install -y $buildDeps \
    && cd ~ \
    && wget http://github.com/NVIDIA/nccl/archive/master.zip \
    && unzip master.zip \
    && cd nccl-master \
    && make \
    && make install \
    && cd ~ \
    && rm master.zip \
    && rm -rf nccl \
    && wget http://github.com/FalongShen/styletransfer/archive/master.zip \
    && unzip master.zip \    
    && cd styletransfer-master \
    && make clean \
    && make \
    && make pycaffe \
    && cd ~ \
    && rm master.zip \    
    # && apt-get purge -y --auto-remove $buildDeps
