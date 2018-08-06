# Cloning the Linux kernel source code
##git clone git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git

cd linux-stable
# Using the 4.14 version of the kernel. Versions up to 4.16 should work, but 4.17 does not support clang 7 or under.
##git checkout v4.14.34
# Create a .config file with the default configuration for the current architecture
# It is possible to edit this configuration with make menuconfig or copy an existing one
##make defconfig
#cp ../miniconfig_x64 .config   # Uncommenting will use a smaller configuration for x86_64

# Building the kernel. A bug makes the build stop randomly with clang, so we start it again if it is not finished
# However, this will loop if there is an actual error.
##while [ ! -e "vmlinux" ]; do
   ## make vmlinux CC=gclang
##done

# The python script will extract the bitcode to the specified folder and link it all in a new vmlinux object
# It needs the gclang log to be forwarded to this specific path. It can be changed in the python code. 
mkdir wrapper-logs
export WLLVM_OUTPUT_FILE=wrapper-logs/wrapper.log
mkdir ../bitcode-build
python ../built-in-parsing.py ../bitcode-build drivers fs/ext4  
# Currently, the kernel will not boot if i use the bitcode for the drivers and ext4 file system, so I exclude those folders

# This script created with the previous command will copy the bitcode files and link them
bash build_script.sh

# Bringing back the new vmlinux 
cp ../bitcode-build/vmlinux .

# Finishing the build 
cp ../install.sh .
bash install.sh

# The new kernel is installed, you can test it by rebooting and selecting it in GRUB