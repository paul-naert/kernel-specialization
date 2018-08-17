wget http://acme.com/software/thttpd/thttpd-2.27.tar.gz
tar xvf thttpd-2.27.tar.gz

cd thttpd-2.27

CC=gclang ./configure 
make CC=gclang

#You need to copy musllvm's libc.a and crt1.o in .. before running this
gclang -O2 -DHAVE__PROGNAME=1 -DHAVE_FCNTL_H=1 -DHAVE_GRP_H=1 -DHAVE_MEMORY_H=1 -DHAVE_PATHS_H=1 -DHAVE_POLL_H=1 -DHAVE_SYS_POLL_H=1 -DTIME_WITH_SYS_TIME=1 -DHAVE_DIRENT_H=1 -DHAVE_LIBCRYPT=1 -DHAVE_STRERROR=1 -DHAVE_WAITPID=1 -DHAVE_VSNPRINTF=1 -DHAVE_DAEMON=1-DHAVE_SETSID=1 -DHAVE_GETADDRINFO=1 -DHAVE_GETNAMEINFO=1 -DHAVE_GAI_STRERROR=1 -DHAVE_SIGSET=1 -DHAVE_ATOLL=1 -DHAVE_UNISTD_H=1 -DHAVE_GETPAGESIZE=1 -DHAVE_MMAP=1-DHAVE_SELECT=1 -DHAVE_POLL=1 -DHAVE_TM_GMTOFF=1 -DHAVE_INT64T=1 -DHAVE_SOCKLENT=1 -I. -o thttpd thttpd.o libhttpd.o fdwatch.o mmc.o timers.o match.o tdate_parse.o ../crt1.o ../libc.a -static -nostdlib

get-bc thttpd

slash --work-dir=slashing --keep-external=keep.list thttpd.json 

cp thttpd-slashed ../initramfs/bin
cd ../initramfs 
find . -print0 | cpio --null -ov --format=newc > ../filesystem.cpio
cd ..
qemu-system-x86_64 -kernel slashed-kernel -initrd filesystem.cpio -nographic -append "console=ttyS0"