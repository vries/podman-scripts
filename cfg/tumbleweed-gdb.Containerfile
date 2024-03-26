FROM registry.opensuse.org/opensuse/tumbleweed

RUN zypper -n dup

RUN zypper -n install \
    autoconf \
    automake \
    binutils-gold \
    bison \
    bsdtar \
    bzip2 \
    coreutils \
    cpio \
    dejagnu \
    diffutils \
    dos2unix \
    dpkg \
    elfutils \
    elfutils-debuginfod \
    emacs \
    file \
    findutils \
    flex \
    gcc \
    gcc-32bit \
    gcc-ada \
    gcc-c++ \
    gcc-c++-32bit \
    gcc-fortran \
    fpc \
    rust \
    gcc-objc \
    gcc-go \
    gettext-devel \
    git \
    glibc-devel \
    glibc-devel-32bit \
    glibc-devel-static \
    glibc-devel-static-32bit \
    glibc-locale \
    gmp-devel \
    libboost_regex-devel \
    libbz2-devel \
    xz \
    xz-devel \
    gzip \
    zlib-devel \
    zstd \
    libzstd-devel \
    libcurl-devel \
    libdebuginfod-devel \
    libdw-devel \
    libelf-devel \
    libexpat-devel \
    libsource-highlight-devel \
    libtool \
    make \
    mold \
    mpfr-devel \
    ncurses-devel \
    patch \
    procps \
    python3-devel \
    python3-pygments \
    sharutils \
    systemtap-sdt-devel \
    tar \
    texinfo \
    util-linux \
    valgrind \
    xxhash-devel \
    zypper

RUN zypper clean
