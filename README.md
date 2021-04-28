Helper scripts, some are related to Copr build system maintenance.

Generating copr images
----------------------

The `copr-image` script is basically a generic way to modify a qcow2 image by
using a ansible playbook.  It downloads the given qcow2 image, prepares it with
virt-sysprep, starts a VM using that image and executes the playbook against the
VM.  Once that is done, a new qcow2 image is generated from that VM, and the
image is minimized.

Something like this could be implemented in `virt-sysprep` directly:
https://bugzilla.redhat.com/show_bug.cgi?id=1954513

Quick HOWTO:

```
$ cat /etc/eimg/eimg.sh
# configure where to execute playbook from, and the playbook name
EIMG_COPR_PLAYBOOK_DIR=/home/praiskup/rh/projects/rhcopr/pagure/vm-provisioning
EIMG_COPR_PLAYBOOK=local-image-update.yml
$ copr-image https://download.fedoraproject.org/pub/fedora/linux/releases/34/Cloud/x86_64/images/Fedora-Cloud-Base-34-1.2.x86_64.qcow2
...
++ date -I
+ qemu-img convert -f qcow2 /tmp/wip-image-DZ4Fg.qcow2 -c -O qcow2 -o compat=0.10 /tmp/praiskup-eimg-hspElc/eimg-fixed-2021-04-28.qcow2
+ cleanup
+ rm -rf /tmp/wip-image-DZ4Fg.qcow2
```
... you can see that the final **qcow** image is on `/tmp/praiskup-eimg-hspElc/eimg-fixed-2021-04-28.qcow2`.


CI/CD of this project
---------------------

Builds from the `main` branch are in [copr repo][copr_repo].

Last build: [![last build](https://copr.fedorainfracloud.org/coprs/praiskup/helpers/package/praiskup-helpers/status_image/last_build.png)](https://copr.fedorainfracloud.org/coprs/praiskup/helpers/package/praiskup-helpers/)

[copr_repo]: https://copr.fedorainfracloud.org/coprs/praiskup/helpers/
