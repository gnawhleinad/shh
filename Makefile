INSTALL = /usr/local/opt
DAEMON_INSTALL = /Library/LaunchDaemons

$(INSTALL)/shh:
	mkdir -p $@

$(INSTALL)/shh/shh.sh: shh.sh | $(INSTALL)/shh
	cp $< $@
	chmod +x $@
$(DAEMON_INSTALL)/gnawhleinad.shh.plist: shh.plist
	cp $< $@

install: $(INSTALL)/shh/shh.sh $(DAEMON_INSTALL)/gnawhleinad.shh.plist
	-launchctl unload $(DAEMON_INSTALL)/gnawhleinad.shh.plist
	launchctl bootstrap system $(DAEMON_INSTALL)/gnawhleinad.shh.plist
	launchctl enable system/gnawhleinad.shh
	launchctl kickstart system/gnawhleinad.shh
