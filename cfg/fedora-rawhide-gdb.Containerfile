FROM registry.fedoraproject.org/fedora:rawhide

RUN dnf upgrade -y

RUN dnf install -y \
    autoconf \
    automake \
    autogen \
    bison \
    black \
    bsdtar \
    bzip2 \
    clang \
    coreutils \
    curl \
    dejagnu \
    diffutils \
    cpio \
    dpkg \
    dwz \
    elfutils \
    elfutils-debuginfod \
    elfutils-debuginfod-client-devel \
    elfutils-devel \
    emacs \
    expat-devel \
    findutils \
    file \
    flex \
    fpc \
    gcc \
    gcc-c++ \
    gcc-gdc \
    gcc-gfortran \
    gcc-gm2 \
    gcc-gnat \
    gcc-go \
    gcc-objc \
    gcc-objc++ \
    gdb \
    gettext-devel \
    git \
    glibc-gconv-extra \
    glibc-static \
    gmp-devel \
    guile30-devel \
    gzip \
    zstd \
    ldc \
    libasan \
    libtool \
    libubsan \
    libzstd-devel \
    make \
    mold \
    mpfr-devel \
    ncurses-devel \
    patch \
    procps \
    python3-devel \
    python3-pygments \
    readline-devel \
    rustc \
    tar \
    texinfo \
    util-linux \
    valgrind \
    wget \
    xxhash-devel \
    xz \
    xz-devel \
    zlib-devel

RUN dnf clean all
