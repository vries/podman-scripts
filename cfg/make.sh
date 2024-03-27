#!/bin/bash

last ()
{
    last=$#
    # shellcheck disable=SC3053
    echo ${!last}
}

print_packages ()
{
    last_package=$(last "$@")

    for package in "$@"; do
	if [ "$package" = "$last_package" ]; then
	    echo "    $package"
	else
	    echo "    $package \\"
	fi
    done
}

fedora()
{
    for version in "$@"; do
	file=fedora-$version-gdb.Containerfile

	mapfile -t packages < <(./packages.sh fedora "$version")

	{
	    echo "FROM registry.fedoraproject.org/fedora:$version"
	    echo
	    echo "RUN dnf upgrade -y"
	    echo
	    echo "RUN dnf install -y \\"
	    print_packages "${packages[@]}"
	    echo
	    echo "RUN dnf clean all"
	} > "$file"
    done
}

opensuse ()
{
    for version in "$@"; do
	id=${version//:/-}

	file=$id-gdb.Containerfile

	mapfile -t packages < <(./packages.sh opensuse "$version")

	{
	    echo "FROM registry.opensuse.org/opensuse/$version"
	    echo
	    case " $version " in
		" leap "|" tumbleweed ")
		    echo "RUN zypper -n dup"
		    echo
	    esac
	    echo "RUN zypper -n install \\"
	    print_packages "${packages[@]}"
	    echo
	    echo "RUN zypper clean"
	} > "$file"
    done
}

debian ()
{
    for version in "$@"; do
	file=debian-$version-gdb.Containerfile

	mapfile -t packages < <(./packages.sh debian "$version")


	{
	    echo "FROM debian:$version"
	    echo
	    echo "RUN apt-get update"
	    echo
	    echo "RUN apt-get upgrade -y"
	    echo
	    echo "RUN apt-get install -y \\"
	    print_packages "${packages[@]}"
	    echo
	    echo "RUN apt-get clean"
	} > "$file"
    done
}

main ()
{
    fedora \
	38 \
	39 \
	40 \
	rawhide

    opensuse \
	leap \
	leap:15.1 \
	tumbleweed

    debian \
	stable
}

main "$@"
