scripts/sortextable vmlinux 
nm -n vmlinux | grep -v '\( [aNUw] \)\|\(__crc_\)\|\( \$[adt]\)\|\( .L\)' > System.map
make CC=gclang 
sudo make modules_install install
