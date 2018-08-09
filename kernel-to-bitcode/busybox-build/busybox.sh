if [ !e "linux-stable/arch/x86/boot/bzImage" ] 
then 
    bash qemu-kernel.sh
fi

wget https://busybox.net/downloads/busybox-1.26.2.tar.bz2 | tar xjf -

cd busybox-1.26.2
mkdir -pv ../build/busybox-x86
make O=../build/busybox-x86 defconfig

cp ../busybox-config ../build/busybox-x86/.config

cd ../build/busybox-x86

make

# Building busybox into bitcode and back using musllvm libc
get-bc busybox
clang -o busybox busybox.bc ../../libc.a.bc ../../libc.a 
make install

mkdir ../initramfs
cd ../initramfs
mkdir -pv {bin,sbin,etc,proc,sys,usr/{bin,sbin}}
cp -av ../busybox-x86/_install/* .

cp ../../init .

# It is possible to add binaries and other files to the file system here
find . -print0 \
    | cpio --null -ov --format=newc \
    | gzip -9 > ../initramfs-busybox-x86.cpio.gz


cd ../..
qemu-system-x86_64 \
    -kernel  linux-stable/arch/x86/boot/bzImage \
    -initrd build/initramfs-busybox-x86.cpio.gz \
    -nographic -append "console=ttyS0" 