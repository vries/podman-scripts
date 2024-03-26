#!/bin/sh

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

fedora_versions="38 39 40 rawhide"
fedora_packages=$(get_packages fedora.packages)

for fedora_version in $fedora_versions; do
    file=fedora-$fedora_version-gdb.Containerfile

    {
	echo "FROM registry.fedoraproject.org/fedora:$fedora_version"
	echo
	echo "RUN dnf upgrade -y"
	echo
	echo "RUN dnf install -y \\"
	for fedora_package in $fedora_packages; do
	    echo "    $fedora_package \\"
	done
	echo "# End of list."
	echo
	echo "RUN dnf clean all"
    } > "$file"
done

opensuse_versions="leap leap:15.1 tumbleweed"
opensuse_packages=$(get_packages opensuse.packages)

opensuse_packages_for ()
{
    local version="$1"

    packages=""

    for package in $opensuse_packages; do
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

for opensuse_version in $opensuse_versions; do
    id=$(echo $opensuse_version | sed 's/:/-/g')
    file=$id-gdb.Containerfile

    {
	echo "FROM registry.opensuse.org/opensuse/$opensuse_version"
	echo
	case " $opensuse_version " in
	    " leap "|" tumbleweed ")
		echo "RUN zypper -n dup"
		echo
	esac
	echo "RUN zypper -n install \\"
	for opensuse_package in $opensuse_packages; do
	    echo "    $opensuse_package \\"
	done
	echo "# End of list."
	echo
	echo "RUN zypper clean"
    } > "$file"
done
