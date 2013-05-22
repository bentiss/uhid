MODULE_NAME := uhid

obj-m			+= $(MODULE_NAME).o

KDIR := /lib/modules/$(shell uname -r)/build
PWD := $(shell pwd)

default:
	$(MAKE) -C $(KDIR) SUBDIRS=$(PWD) $(LINUXINCLUDE) modules

test: $(MODULE_NAME).ko
	/bin/bash test.sh

install: $(MODULE_NAME).ko
	/bin/bash install.sh

uninstall:
	/bin/bash restore.sh

clean:
	$(MAKE) -C $(KDIR) SUBDIRS=$(PWD) clean

