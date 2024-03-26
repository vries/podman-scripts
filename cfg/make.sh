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

opensuse_versions="leap tumbleweed"
opensuse_packages=$(get_packages opensuse.packages)

for opensuse_version in $opensuse_versions; do
    file=$opensuse_version-gdb.Containerfile

    {
	echo "FROM registry.opensuse.org/opensuse/$opensuse_version"
	echo
	echo "RUN zypper -n dup"
	echo
	echo "RUN zypper -n install \\"
	for opensuse_package in $opensuse_packages; do
	    echo "    $opensuse_package \\"
	done
	echo "# End of list."
	echo
	echo "RUN zypper clean"
    } > "$file"
done
