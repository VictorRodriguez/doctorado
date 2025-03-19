# Use a base image with necessary dependencies
FROM ubuntu:20.04
ARG DEBIAN_FRONTEND=noninteractive

ENV https_proxy="http://proxy-us.intel.com:911"
ENV http_proxy="http://proxy-us.intel.com:911"

# Install required packages
RUN apt-get update && \
    apt-get install -y \
    build-essential \
    cmake \
    git \
    wget \
    unzip \
    && rm -rf /var/lib/apt/lists/*

# Clone the oneDNN repository
RUN git clone https://github.com/oneapi-src/oneDNN.git

# Change working directory
WORKDIR /oneDNN/

# Build the benchdnn tests
RUN mkdir build && \
    cd build && \
    cmake .. && \
    make -j

# Set entry point script
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

