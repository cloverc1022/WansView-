
AUTOMAKE_OPTIONS = foreign

SUBDIRS = libsidplay resid builders

# Remove CVS directories from any subdirs that get
# included completely (e.g. win, directx,...).

dist-hook:
		rm -rf `find $(distdir) -path \*/CVS`
