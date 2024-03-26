default: all

fedora_versions = 38 39 40 rawhide
fedora_files = $(foreach version,$(fedora_versions),fedora-$(version)-gdb.Containerfile)
fedora_packages=$(shell cat fedora.packages | sed 's/#.*//; s/\n//g')

fedora-%-gdb.Containerfile: fedora.packages Makefile
	echo "FROM registry.fedoraproject.org/fedora:$*" > "$@"
	echo "RUN dnf upgrade -y && dnf install -y $(fedora_packages) && dnf clean all" >> "$@"

opensuse_versions = leap tumbleweed
opensuse_files = $(foreach version,$(opensuse_versions),$(version)-gdb.Containerfile)
opensuse_packages=$(shell cat opensuse.packages | sed 's/#.*//; s/\n//g')

%-gdb.Containerfile: opensuse.packages Makefile
	echo "FROM registry.opensuse.org/opensuse/$*" > "$@"
	echo "RUN zypper -n dup" >> "$@"
	echo "RUN zypper -n install $(opensuse_packages)" >> "$@"
	echo "RUN zypper clean" >> "$@"

all_files = $(fedoras_files) $(opensuse_files)

all: $(all_files)
