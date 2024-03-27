FROM debian:stable

RUN apt-get update

RUN apt-get upgrade -y

RUN apt-get install -y \
    autoconf \
    autogen \
    automake \
    autopoint \
    autotools-dev \
    bison \
    build-essential \
    bzip2 \
    ccache \
    coreutils \
    cpio \
    curl \
    dejagnu \
    diffutils \
    docbook-xml \
    docbook-xsl \
    dos2unix \
    doxygen \
    dwz \
    elfutils \
    file \
    findutils \
    flex \
    g++ \
    gawk \
    gdb \
    gettext \
    gettext \
    git \
    gzip \
    help2man \
    iproute2 \
    jq \
    lcov \
    libarchive-dev \
    libarchive-tools \
    libarchive-tools \
    libasan6 \
    libbz2-dev \
    libcurl4-gnutls-dev \
    libdebuginfod-dev \
    libdw-dev \
    libelf-dev \
    libexpat-dev \
    libgmp-dev \
    libgmp-dev \
    libisl-dev \
    libjson-c-dev \
    liblzma-dev \
    libmicrohttpd-dev \
    libmpc-dev \
    libmpfr-dev \
    libncurses-dev \
    libopenmpi-dev \
    libsqlite3-dev \
    libtool \
    libubsan1 \
    libxml2-dev \
    libxxhash-dev \
    libzstd-dev \
    m4 \
    mailcap \
    make \
    media-types \
    patch \
    pkg-config \
    procps \
    python3-dev \
    python3-mock \
    python3-rpm \
    python3-sphinx \
    python3-xdg \
    rpm2cpio \
    socat \
    tar \
    texinfo \
    util-linux \
    valgrind \
    wget \
    xmlto \
    xsltproc \
    xz-utils \
    zlib1g-dev \
    zstd

RUN apt-get clean
