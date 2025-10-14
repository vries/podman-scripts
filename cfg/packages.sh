#!/bin/bash

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
		;;

	    leap:16.0)
		case $package in
		    binutils-gold)
			continue
			;;
		    gettext-devel)
			echo "gettext-tools"
			continue
			;;
		    python3-curses|python3-pygments|python3-devel)
			echo "$package" | sed 's/python3-/python313-/'
			continue
			;;
		esac
		;;
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

usage ()
{
    echo "usage: $0: <distro> <version>"
}

main ()
{
    if [ $# -ne 2 ]; then
	usage
	exit 1
    fi

    distro="$1"
    version="$2"

    case "$distro" in
	fedora|opensuse|debian)
	    true
	    ;;
	*)
	    echo "unknown distro"
	    exit 1
	    ;;
    esac

    case "$distro" in
	fedora)
	    case "$version" in
		38|39|40|41|rawhide)
		    true
		    ;;
		*)
		    echo "unknown version for $distro"
		    exit 1
		    ;;
	    esac
	    ;;

	opensuse)
	    case "$version" in
		leap|leap:15.1|leap:15.6|leap:16.0|tumbleweed)
		    true
		    ;;
		*)
		    echo "unknown version for $distro"
		    exit 1
		    ;;
	    esac
	    ;;

	debian)
	    case "$version" in
		stable)
		    true
		    ;;
		*)
		    echo "unknown version for $distro"
		    exit 1
		    ;;
	    esac
	    ;;
    esac

    case "$distro" in
	opensuse)
	    mapfile -t packages < <(get_packages "$distro".packages)
	    opensuse_packages_for "$version" "${packages[@]}"
	;;
	*)
	    get_packages "$distro".packages
	;;
    esac
}

main "$@"
