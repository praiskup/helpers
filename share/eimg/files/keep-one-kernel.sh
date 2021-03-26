#! /bin/bash

# Keep only one (latest) kernel package installed.
# Copyright (C) 2015 Red Hat, Inc.
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License along
# with this program; if not, write to the Free Software Foundation, Inc.,
# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.

set -o pipefail

: "${keep_all_kernels=no}"
test "$keep_all_kernels" = "yes" && exit 0

dnf=yum
if rpm -q dnf &>/dev/null; then
    dnf=dnf
elif rpm -q microdnf &>/dev/null; then
    dnf=microdnf
fi

for pkg_kernel in kernel-core kernel not-installed; do
    kernel_packages=$(rpm -q "$pkg_kernel" | sort -V -r)
    if test $? -eq 0; then
        break
    fi
done

if test $pkg_kernel = not-installed; then
    echo >&2 "kernel package not found"
    exit 1
fi

echo "Kernel packages:"
echo "$kernel_packages"

i=0
for pkg in $kernel_packages; do
    i=$(( i + 1 ))
    if test $i -eq 1; then
        echo >&2 " * keeping kernel: $pkg"
        continue
    fi

    $dnf remove -y "$pkg"
done
