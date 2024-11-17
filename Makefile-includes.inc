$(srcdir)/bin/Makefile.inc: $(srcdir)/bin/Makefile.inc.in $(makefile_am_gen)
	target=bin $(makefile_am_gen) > $@

$(srcdir)/libexec/Makefile.inc: $(srcdir)/libexec/Makefile.inc.in $(makefile_am_gen)
	target=libexec $(makefile_am_gen) > $@

$(srcdir)/share/eimg/Makefile.inc: $(srcdir)/share/eimg/Makefile.inc.in $(makefile_am_gen)
	target=share/eimg $(makefile_am_gen) > $@

$(srcdir)/etc/eimg/Makefile.inc: $(srcdir)/etc/eimg/Makefile.inc.in $(makefile_am_gen)
	target=etc/eimg $(makefile_am_gen) > $@

# dynamically generated
include $(srcdir)/bin/Makefile.inc
include $(srcdir)/libexec/Makefile.inc
include $(srcdir)/share/eimg/Makefile.inc
include $(srcdir)/etc/eimg/Makefile.inc
include $(srcdir)/share/eimg/ansible-container/Makefile.inc

# static
include $(srcdir)/share/eimg/files/Makefile.inc
