AC_INIT([helpers], [0.1], [praiskup@redhat.com])

config_aux_dir="build-aux"
AC_SUBST([config_aux_dir])


AC_CONFIG_MACRO_DIR([m4])
AC_CONFIG_AUX_DIR([build-aux])

AM_INIT_AUTOMAKE([-Wall foreign])
AM_SILENT_RULES([yes])

_AX_TEXT_TPL_INIT

m4_define([conf_path], [dnl
test -z "$$1" && $1=$2
_AX_TEXT_TPL_SUBST([$1])
])

_AX_TEXT_TPL_SUBST([eimgdatadir], ['${datadir}/eimg'])
_AX_TEXT_TPL_SUBST([eimgtemplates], ['${eimgdatadir}/templates'])
_AX_TEXT_TPL_SUBST([eimgfilesdir], ['${eimgdatadir}/files'])
_AX_TEXT_TPL_SUBST([eimgconfdir], ['${sysconfdir}/eimg'])

conf_path([eimg_copr_playbook_dir], [/usr/srv])
conf_path([eimg_copr_playbook], [local-image-update.yml])

insecure_ssh='ssh -q -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null'
insecure_ssh="$insecure_ssh -o BatchMode=yes"
_AX_TEXT_TPL_SUBST([insecure_ssh])

AC_CONFIG_FILES([Makefile])
AC_OUTPUT
AC_MSG_NOTICE([dnl
  Configured the folowing way:

    prefix:             $prefix
])
