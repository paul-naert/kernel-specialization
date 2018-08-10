# SRI-naert
Documentation for my work at SRI

The general goal of my work was to provide a way to package an application and the Linux kernel in a small virtual machine that could be easily shipped. The main idea was to get LLVM IR code for the application and the kernel and apply the existing OCCAM tool to prune as much unnecessary functions as possible. 

Most of my work was thus to get a full version of the kernel code in LLVM IR, and then try to slash it using OCCAM's razor.

The kernel-to-bitcode folder contains scripts to build the Linux kernel and extract the bitcode in a way that makes it bootable when recompiled.

The kernel-slashing directory contains scripts used to apply OCCAM's razor on the kernel bitcode.

---

This material is based upon work supported by the National Science Foundation under Grant [ACI-1440800](http://www.nsf.gov/awardsearch/showAward?AWD_ID=1440800). Any opinions, findings, and conclusions or recommendations expressed in this material are those of the author(s) and do not necessarily reflect the views of the National Science Foundation.
