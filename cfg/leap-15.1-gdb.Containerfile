# Setup the (minimal) image, upgrade.
FROM registry.opensuse.org/opensuse/leap:15.1
#RUN zypper -n dup

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
    gettext-devel \
    bison flex \
    bzip2 libbz2-devel xz xz-devel gzip zlib-devel zstd libzstd-devel \
    findutils file \
    bsdtar tar \
    libelf-devel \
    libdw-devel \
    libcurl-devel \
    elfutils \
    dos2unix \
    python3-devel \
    texinfo \
    libexpat-devel \
    glibc-devel glibc-locale \
    xxhash-devel \
    ncurses-devel \
    libsource-highlight-devel \
    libboost_regex-devel

# libdebuginfod-devel 

# Packages to test gdb.
RUN zypper -n install \
    dejagnu \
    systemtap-sdt-devel \
    glibc-devel-static  \
    valgrind \
    gcc-ada gcc-fortran fpc gcc-objc gcc-go \
    sharutils \
    binutils-gold

# Other packages
RUN zypper -n install \
    emacs \
    patch diffutils \
    git autoconf automake \
    dpkg zypper

RUN zypper clean
