# Setup the (minimal) image, upgrade.
FROM registry.opensuse.org/opensuse/leap:42.3

RUN zypper -n dup

# Packages to build gdb.
RUN zypper -n install \
    gcc gcc-c++ \
    libtool \
    isl-devel mpc-devel mpfr-devel gmp-devel \
    util-linux \
    cpio \
    procps \
    coreutils \
    make \
    bison flex \
    bzip2 libbz2-devel xz xz-devel gzip zlib-devel zstd libzstd-devel \
    findutils file \
    bsdtar tar \
    libelf-devel \
    libdw-devel \
    libcurl-devel \
    elfutils \
    dos2unix \
    python \
    python3-devel \
    texinfo \
    libexpat-devel \
    glibc-devel glibc-locale \
    ncurses-devel \
    libsource-highlight-devel \
    libboost_regex-devel

# Packages to test gdb.
RUN zypper -n install \
    dejagnu \
    systemtap-sdt-devel \
    glibc-devel-32bit glibc-devel-static glibc-devel-static-32bit \
    gcc-32bit gcc-c++-32bit \
    valgrind \
    gcc-ada gcc-fortran gcc-objc \
    sharutils \
    binutils-gold

# Other packages
RUN zypper -n install \
    emacs \
    patch diffutils \
    git autoconf automake \
    dpkg zypper

RUN zypper clean
