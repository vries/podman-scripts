FROM debian:stable

RUN apt-get update

RUN apt-get upgrade -y

RUN apt-get install -y \
    build-essential \
    bzip2 \
    coreutils \
    dos2unix \
    python3-dev \
    python3-mock \
    doxygen \
    file \
    tar \
    curl \
    libarchive-tools \
    libarchive-dev \
    libcurl4-gnutls-dev \
    findutils \
    gawk \
    g++ \
    libubsan1 \
    libasan6 \
    libtool \
    ccache \
    valgrind \
    jq \
    socat \
    libbz2-dev \
    xz-utils \
    liblzma-dev \
    gzip \
    zlib1g-dev \
    zstd \
    libzstd-dev \
    libdebuginfod-dev \
    libexpat-dev \
    libisl-dev \
    libjson-c-dev \
    libmicrohttpd-dev \
    libmpc-dev \
    libgmp-dev \
    libmpfr-dev \
    libgmp-dev \
    libncurses-dev \
    libsqlite3-dev \
    libelf-dev \
    libdw-dev \
    elfutils \
    dwz \
    libxml2-dev \
    m4 \
    pkg-config \
    gettext \
    autopoint \
    autogen \
    lcov \
    mailcap \
    make \
    git \
    autotools-dev \
    autoconf \
    dejagnu \
    automake \
    gettext \
    bison \
    flex \
    media-types \
    patch \
    python3-rpm \
    python3-sphinx \
    python3-xdg \
    libopenmpi-dev \
    gdb \
    help2man \
    wget \
    libxxhash-dev \
    texinfo \
    util-linux \
    diffutils \
    iproute2 \
    libarchive-tools \
    cpio \
    rpm2cpio \
    procps \
    xmlto \
    xsltproc \
    docbook-xsl \
    docbook-xml

RUN apt-get clean
