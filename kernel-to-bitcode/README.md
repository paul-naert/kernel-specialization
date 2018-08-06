# Building the Linux Kernel into LLVM Bitcode

In order to apply OCCAM tools on the kernel, we need to have a bitcode base on which we can act.
Getting that bitcode is the goal of the [built-in-parsing.py](built-in-parsing.py) program. It will read all the files included in the built-in.o archive and convert what it can into bitcode, compile and link them.
Its first argument is the folder where the bitcode should be stored, and the rest are folders which should not be translated into bitcode and instead directly linked.
