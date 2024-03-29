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
    fpc \
    gcc \
    gcc-ada \
    gcc-c++ \
    gcc-fortran \
    gcc-go \
    gcc-objc \
    gettext-devel \
    git \
    glibc-devel \
    glibc-devel-static \
    glibc-locale \
    gmp-devel \
    gzip \
    libboost_regex-devel \
    libbz2-devel \
    libcurl-devel \
    libdebuginfod-devel \
    libdw-devel \
    libelf-devel \
    libexpat-devel \
    libsource-highlight-devel \
    libtool \
    libzstd-devel \
    make \
    mold \
    mpfr-devel \
    ncurses-devel \
    patch \
    procps \
    python3-curses \
    python3-devel \
    python3-pygments \
    rust \
    sharutils \
    systemtap-sdt-devel \
    tar \
    texinfo \
    util-linux \
    valgrind \
    xxhash-devel \
    xz \
    xz-devel \
    zlib-devel \
    zstd \
    zypper

RUN zypper clean
