default: all

fedora_versions = 38 39 40 rawhide
fedoras = $(foreach version,$(fedora_versions),fedora-$(version)-gdb.Containerfile)
fedora_packages=$(shell cat fedora.packages | sed 's/^#.*//; s/\n//g')

fedora-%-gdb.Containerfile: fedora.packages Makefile
	echo "FROM registry.fedoraproject.org/fedora:$*" > "$@"
	echo "RUN dnf upgrade -y && dnf install -y $(fedora_packages) && dnf clean all" >> "$@"

all: $(fedoras)
