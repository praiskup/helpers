AC_INIT([helpers], [0.0], [praiskup@redhat.com])

config_aux_dir="build-aux"
AC_SUBST([config_aux_dir])


AC_CONFIG_MACRO_DIR([m4])
AC_CONFIG_AUX_DIR([build-aux])

AM_INIT_AUTOMAKE([-Wall foreign])
AM_SILENT_RULES([yes])

_AX_TEXT_TPL_INIT
_AX_TEXT_TPL_SUBST([eimgdatadir], ['${datadir}/eimg'])

insecure_ssh='ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null'
insecure_ssh="$insecure_ssh -o BatchMode=yes"
_AX_TEXT_TPL_SUBST([insecure_ssh])

# TODO: Document how to setup this with libvirt.
_AX_TEXT_TPL_SUBST([pi_exp_host], [192.168.122.100])

AC_CONFIG_FILES([Makefile])
AC_OUTPUT
AC_MSG_NOTICE([dnl
  Configured the folowing way:

    prefix:             $prefix
])
