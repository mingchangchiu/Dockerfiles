FROM ubuntu:18.04

MAINTAINER Ming-Chang Chiu <ericchiu0721@gmail.com>

# Pick up some TF dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
        build-essential \
        curl \
        libfreetype6-dev \
        libpng12-dev \
        libzmq3-dev \
        pkg-config \
        python \
        python-dev \
        rsync \
        software-properties-common \
        unzip \
        vim \
        emacs \
        && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN curl -O https://bootstrap.pypa.io/get-pip.py && \
    python get-pip.py && \
    rm get-pip.py

RUN pip --no-cache-dir install \
        ipykernel \
        jupyter \
        matplotlib \
        numpy \
        scipy \
        sklearn \
        pandas \
        Pillow \
        h5py \
        nltk \
        supervisor\
        && \
    python -m ipykernel.kernelspec

# --- DO NOT EDIT OR DELETE BETWEEN THE LINES --- #
# These lines will be edited automatically by parameterized_docker_build.sh. #
# COPY _PIP_FILE_ /
# RUN pip --no-cache-dir install /_PIP_FILE_
# RUN rm -f /_PIP_FILE_

# Install TensorFlow CPU version from central repo
RUN pip --no-cache-dir install \
    tensorflow
# --- ~ DO NOT EDIT OR DELETE BETWEEN THE LINES --- #

# RUN ln -s /usr/bin/python3 /usr/bin/python#


# TensorBoard
EXPOSE 6006
# IPython
EXPOSE 8888


CMD ["echo", "done"]
