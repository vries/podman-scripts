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

get_packages ()
{
    file="$1"

    # shellcheck disable=SC2002
    cat "$file" \
	| sed 's/#.*//' \
	| sed 's/  */\n/g' \
	| grep -v "^$" \
	| sort
}

fedora()
{
    mapfile -t packages < <(get_packages fedora.packages)

    for version in "$@"; do
	file=fedora-$version-gdb.Containerfile

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

opensuse_packages_for ()
{
    version="$1"
    shift

    for package in "$@"; do
	case $package in
	    mold)
		case $version in
		    tumbleweed)
			true
			;;
		    *)
			continue
			;;
		esac
	esac

	case $version in
	    leap:43*|leap:15.0|leap:15.1|leap:15.2|leap:15.3)
		case $package in
		    libdebuginfod-devel|elfutils-debuginfod)
			continue
			;;
		    libboost_regex-devel)
			continue
			;;
		esac
	esac

	case $version in
	    *)
		case $package in
		    gcc-32bit|gcc-c++-32bit|glibc-devel-32bit|glibc-devel-static-32bit)
			continue
			;;
		esac
	esac

	echo "$package"
    done
}

opensuse ()
{
    mapfile -t packages < <(get_packages opensuse.packages)

    for version in "$@"; do
	id=${version//:/-}

	file=$id-gdb.Containerfile

	{
	    echo "FROM registry.opensuse.org/opensuse/$version"
	    echo
	    case " $version " in
		" leap "|" tumbleweed ")
		    echo "RUN zypper -n dup"
		    echo
	    esac
	    echo "RUN zypper -n install \\"
	    mapfile -t packages_for_version \
		    < <(opensuse_packages_for "$version" "${packages[@]}")
	    print_packages "${packages_for_version[@]}"
	    echo
	    echo "RUN zypper clean"
	} > "$file"
    done
}

debian ()
{
    mapfile -t packages < <(get_packages debian.packages)

    for version in "$@"; do
	file=debian-$version-gdb.Containerfile

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
