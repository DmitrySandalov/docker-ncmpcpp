FROM ubuntu:trusty

MAINTAINER Dmitry Sandalov <dmitry@sandalov.org>

RUN apt-get update && \
    apt-get install -y git g++ autoconf automake build-essential make libtool \ 
                       libboost-all-dev libncurses5-dev libncursesw5-dev \
                       libmpdclient-dev libreadline-dev libfftw3-dev \
                       libcurl4-gnutls-dev libtag1-dev && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

WORKDIR /usr/src/ncmpcpp

RUN git clone --depth=1 https://github.com/arybczak/ncmpcpp.git ./
RUN ./autogen.sh && \
    ./configure --enable-outputs --enable-visualizer --enable-clock \
                --enable-unicode --with-curl --with-fftw --with-taglib && \
    make && make install

RUN locale-gen "ru_RU.UTF-8" && dpkg-reconfigure locales
ENV LC_ALL=ru_RU.UTF-8

CMD ["ncmpcpp"]
