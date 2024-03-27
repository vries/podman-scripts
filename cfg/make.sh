#!/bin/sh

last ()
{
    last=$#
    echo ${!last}
}

print_packages ()
{
    last_package=$(last $@)

    for package in $@; do
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
	| sed 's/  */\n/' \
	| sort \
	| tr '\n' ' ' \
	| sed 's/  */ /g;s/^ *//;s/ *$//'
}

fedora()
{
    versions="38 39 40 rawhide"
    packages=$(get_packages fedora.packages)

    for version in $versions; do
	file=fedora-$version-gdb.Containerfile

	{
	    echo "FROM registry.fedoraproject.org/fedora:$version"
	    echo
	    echo "RUN dnf upgrade -y"
	    echo
	    echo "RUN dnf install -y \\"
	    print_packages $packages
	    echo
	    echo "RUN dnf clean all"
	} > "$file"
    done
}

opensuse_packages_for ()
{
    local version="$1"
    shift

    packages=""

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

	packages="$packages $package"
    done

    echo $packages
}

opensuse ()
{
    versions="leap leap:15.1 tumbleweed"
    packages=$(get_packages opensuse.packages)

    for version in $versions; do
	id=$(echo $version | sed 's/:/-/g')
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
	    print_packages $(opensuse_packages_for $version $packages)
	    echo
	    echo "RUN zypper clean"
	} > "$file"
    done
}

debian ()
{
    versions="stable"
    packages=$(get_packages debian.packages)

    for version in $versions; do
	file=debian-$version-gdb.Containerfile

	{
	    echo "FROM debian:$version"
	    echo
	    echo "RUN apt-get update"
	    echo
	    echo "RUN apt-get upgrade -y"
	    echo
	    echo "RUN apt-get install -y \\"
	    print_packages $packages
	    echo
	    echo "RUN apt-get clean"
	} > "$file"
    done
}

main ()
{
    fedora
    opensuse
    debian
}

main "$@"
