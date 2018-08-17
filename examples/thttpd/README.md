# thttpd example
This example is designed to present how to build an application and boot it on a minimal VM with a slashed kernel.

For the sake of simplicity, we do not build nor slash the kernel here, and use a pre-built one (slashed-kernel). In order to do a full build, it is possible to add the syscalls extracted from here + those from busybox to a whitelist, and slash the kernel with that. Make sure you take out the other syscalls from the whitelist as for now they are included by default.
