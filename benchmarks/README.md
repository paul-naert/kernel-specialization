# Packaging a benchmark application
A good application to try and pack with OCCAM would be a benchmark which would provide figures for the performance of our reduced kernel.

I experimented with [filebench](https://github.com/filebench/filebench) but it would not compile with musl libc due to differences in mutexes. this made it impossible to have a the full bitcode version that I was looking for.

I tried [postmark](postmark-1.5.c) which is a lot simpler and does compile correctly even after slashing with OCCAM, provided you add __libc to the keep-external list.
