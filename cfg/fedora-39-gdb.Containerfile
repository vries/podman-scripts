FROM registry.fedoraproject.org/fedora:39

RUN dnf upgrade -y

RUN dnf install -y \
    autoconf \
    autogen \
    automake \
    bison \
    black \
    bsdtar \
    bzip2 \
    clang \
    coreutils \
    cpio \
    curl \
    dejagnu \
    diffutils \
    dpkg \
    dwz \
    elfutils \
    elfutils-debuginfod \
    elfutils-debuginfod-client-devel \
    elfutils-devel \
    emacs \
    expat-devel \
    file \
    findutils \
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
    systemtap-sdt-devel \
    tar \
    texinfo \
    util-linux \
    valgrind \
    wget \
    xxhash-devel \
    xz \
    xz-devel \
    zlib-devel \
    zstd

RUN dnf clean all
