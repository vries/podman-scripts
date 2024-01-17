FROM registry.fedoraproject.org/fedora:38

RUN dnf upgrade -y && \
    dnf install -y \
        gcc gcc-c++ libubsan libasan libtool valgrind \
	glibc-gconv-extra \
	isl-devel libmpc-devel mpfr-devel gmp-devel autogen \
        patch util-linux diffutils bsdtar cpio procps \
        coreutils make git autoconf dejagnu automake gettext-devel bison flex \
        bzip2 bzip2-devel xz xz-devel gzip zlib-devel zstd libzstd-devel \
        expat-devel \
        findutils file tar curl libarchive-devel libcurl-devel \
        elfutils elfutils-devel ncurses-devel \
        texinfo elfutils-debuginfod elfutils-debuginfod-client-devel \
        gcc-plugin-devel binutils-devel \
        gc-devel readline-devel texinfo-tex \
        libxml2-devel dos2unix dpkg python3-devel \
        mailcap gdb help2man wget xxhash-devel \
	black && \
   dnf clean all
