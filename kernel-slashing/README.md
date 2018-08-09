This folders gathers scripts used for using OCCAM's razor on the Linux kernel.
This is work in progress. In the current form, the scripts will link the kernel without an error, but it will not boot.

## How to use the scripts

Make sure you have [OCCAM](https://github.com/SRI-CSL/OCCAM) installed.

Copy the scripts into the folder where you have your bitcode stored after running the built-in-parsing script (bitcode-build if you ran the example build). 
I have included a list of all syscalls + start_kernel in [syscall.list](syscall.list). You can add the global variables missing from it by running [loop-add-globals.sh](loop-add-globals.sh) or expand from the [excluded.list](excluded.list) that I built for my kernel configuration.
