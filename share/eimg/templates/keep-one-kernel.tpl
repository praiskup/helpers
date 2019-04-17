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


distro={{ env['eimg_distro'] }}
keep_all_kernels={{ env['eimg_keep_all_kernels'] }}

case $keep_all_kernels in
    yes)
        exit 0
        ;;
esac

case ${distro} in
    fedora-20-*|fedora-19-*)
        package_name=kernel
        ;;
    fedora-*)
        package_name=kernel-core
        ;;
    *)
        package_name=kernel
        ;;
esac

i=0
for pkg in `rpm -q "$package_name" | sort -r`; do
    i=$(( i + 1 ))
    if test $i -eq 1; then
        echo >&2 " * keeping kernel: $pkg"
        continue
    fi

    "{{ commands.pkginstaller.binary }}" remove -y "$pkg"
done
