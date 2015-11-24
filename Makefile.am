bin_SCRIPTS =
libexec_SCRIPTS =
eimgdata_DATA =

EXTRA_DIST =
CLEANFILES =
DISTCLEANFILES = ChangeLog
GENERATED_FILES =
ADDITIONAL_SED_SUBSTITUTIONS =

makefile_am_gen = $(config_aux_dir)/gen-makefile-am

# Make sure GENERATED_FILES is non-empty
$(TEST_GEN_FILES_LIST): $(GENERATED_FILES)
	$(AM_V_GEN)rm -rf $(TEST_GEN_FILES_LIST) && \
	for i in $(GENERATED_FILES); do \
	    echo $$i >> $@ ; \
	done

include Makefile-includes.inc

CLEANFILES += \
	$(GENERATED_FILES) \
	$(TEST_GEN_FILES_LIST) \
	$(dep)


GL_GEN_DIR = $(srcdir)
GL_GEN_BIN = gitlog-to-changelog
GL_GEN = if test -d $(top_srcdir)/../.git; then \
	   $(SHELL) $(top_srcdir)/$(config_aux_dir)/missing --run \
	   $(GL_GEN_BIN) --format='%s%n%n%b%n' --since 2015-02-16 \
	           $(GL_GEN_DIR) > ChangeLog ; \
	   rc=$$? ; \
	   if test $$rc -eq 127; then \
	     if test x"$$IGNORE_CHANGELOG" != xyes; then \
	       echo >&2 "ERROR: Get the $(GL_GEN_BIN) or ignore ChangeLog by IGNORE_CHANGELOG=yes" ; \
	       exit 1 ; \
	     fi ; \
	   else \
	     test $$rc -eq 0 ; \
	   fi \
	 fi

.PHONY: ChangeLog
ChangeLog:
	$(AM_V_GEN)$(GL_GEN)

dist-hook: ChangeLog
