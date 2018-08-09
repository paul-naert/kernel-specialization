cmd_coreutils/test_ptr_hack.o := gcc -Wp,-MD,coreutils/.test_ptr_hack.o.d   -std=gnu99 -Iinclude -Ilibbb -Iinclude2 -I/home/pn/SRI-naert/kernel-to-bitcode/qemu-kernel/busybox-1.26.2/include -I/home/pn/SRI-naert/kernel-to-bitcode/qemu-kernel/busybox-1.26.2/libbb -include include/autoconf.h -D_GNU_SOURCE -DNDEBUG -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -D"BB_VER=KBUILD_STR(1.26.2)" -DBB_BT=AUTOCONF_TIMESTAMP -I/home/pn/SRI-naert/kernel-to-bitcode/qemu-kernel/busybox-1.26.2/coreutils -Icoreutils -Wall -Wshadow -Wwrite-strings -Wundef -Wstrict-prototypes -Wunused -Wunused-parameter -Wunused-function -Wunused-value -Wmissing-prototypes -Wmissing-declarations -Wno-format-security -Wdeclaration-after-statement -Wold-style-definition -fno-builtin-strlen -finline-limit=0 -fomit-frame-pointer -ffunction-sections -fdata-sections -fno-guess-branch-probability -funsigned-char -static-libgcc -falign-functions=1 -falign-jumps=1 -falign-labels=1 -falign-loops=1 -fno-unwind-tables -fno-asynchronous-unwind-tables -fno-builtin-printf -Os  -D"KBUILD_STR(s)=\#s" -D"KBUILD_BASENAME=KBUILD_STR(test_ptr_hack)"  -D"KBUILD_MODNAME=KBUILD_STR(test_ptr_hack)" -c -o coreutils/test_ptr_hack.o /home/pn/SRI-naert/kernel-to-bitcode/qemu-kernel/busybox-1.26.2/coreutils/test_ptr_hack.c

deps_coreutils/test_ptr_hack.o := \
  /home/pn/SRI-naert/kernel-to-bitcode/qemu-kernel/busybox-1.26.2/coreutils/test_ptr_hack.c \
  /usr/include/stdc-predef.h \

coreutils/test_ptr_hack.o: $(deps_coreutils/test_ptr_hack.o)

$(deps_coreutils/test_ptr_hack.o):
