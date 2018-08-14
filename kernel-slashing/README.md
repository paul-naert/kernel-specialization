This folders gathers scripts used for using OCCAM's razor on the Linux kernel.
This is work in progress. In the current form, the scripts will link the kernel without an error, but it will not boot, except with a very inclusive [list](large.list) for symbols kept.

## How to use the scripts

Make sure you have [OCCAM](https://github.com/SRI-CSL/OCCAM) installed.

Copy the scripts into the folder where you have your bitcode stored after running the built-in-parsing script (bitcode-build if you ran the example build). 
I have included a list of all syscalls + start_kernel in [syscall.list](syscall.list). You can add the global variables missing from it by running [loop-add-globals.sh](loop-add-globals.sh) or expand from the [excluded.list](excluded.list) that I built for my kernel configuration.
Launching [add-missing-globals.sh](add-missing-globals.sh) will do one pass, which should be enough if you are using exclude.list. It is them possible to copy vmlinux into the linux-stable directory and finish the build.

I have added [large.list](large.list) which allows the kernel to boot when slashed with this exclusion list. However, for now it is huge and most of the entries are not necessary. I have built that list by adding the full nm for the original nm to a list, and then excluding categories. The way I do this is by parsing the file and determining what keywords appear most frequently, and trying to exclude all lines including those. However, this reaches its limits very fast. I was able to take out acpi, ata, ksymtab, kstrtab and netlink for a total of 14000 lines. However, it does not allow me to take out init pci or attr, which make a big portion of the remaining names.

[extract-keywords.py](extract-keywords.py) will print the most used keywords, and [trim-list.py](trim-list.py) will delete from the list the symbols including the string it is given as second argument.

The trim-list and parse-errlog scripts both take the name of the target list as first argument.
