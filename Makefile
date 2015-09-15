PACKAGE=rest-dbus

prefix?=/usr/local
bin=$(prefix)/usr/bin
share=$(prefix)/usr/share/$(PACKAGE)
srv=$(prefix)/lib/systemd/system/

build clean all:

install:
	@install -d $(bin) $(share)/resources $(srv)
	@install -m 755 $(PACKAGE) $(bin)
	@for f in resources/*; do \
		install -m644 $$f $(share)/resources; \
	done
	@install $(PACKAGE).service $(srv)

uninstall:
	@rm -f $(bin)/$(PACKAGE)
	@rm -rf $(share)
	@rm -f $(srv)/$(PACKAGE).service
