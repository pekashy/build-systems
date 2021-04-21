FROM gcc:latest as build

RUN apt-get update && \
    apt-get install -y \
      cmake \
      libboost-system-dev \
      doxygen \
      graphviz \
      sendmail \
      gsasl libgsasl7 libgsasl7-dev\
      git

WORKDIR /app/build

RUN git clone https://github.com/akhtyamovpavel/PatternsCollection.git && \
    cd PatternsCollection && \
    cmake . && \
    make

RUN ls /app/build/bin