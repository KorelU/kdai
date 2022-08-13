MODULE=kdai
PWD := $(shell pwd)
KERNELRELEASE := $(shell uname -r)
KDIR := /lib/modules/${KERNELRELEASE}/build
MDIR := /lib/modules/${KERNELRELEASE}
obj-m := ${MODULE}.o
${MODULE}-objs := main.o dhcp.o

all:
	make -C ${KDIR} M=${PWD} modules
	rm -r -f *.mod.c .*.cmd *.symvers *.o
install:
	sudo insmod ${MODULE}.ko
remove:
	sudo rmmod ${MODULE}
clean:
	make -C  ${KDIR} M=${PWD} clean
