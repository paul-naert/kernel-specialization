
slash --work-dir=slashing --keep-external=exclude.list kernel-manifest.json

clang -Qunused-arguments -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -fno-strict-aliasing -fno-common -fshort-wchar -Werror-implicit-function-declaration -Wno-format-security -std=gnu89 -fno-PIE -mno-sse -mno-mmx -mno-sse2 -mno-3dnow -mno-avx -m64 -mno-80387 -mstack-alignment=8 -mtune=generic -mno-red-zone -mcmodel=kernel -funit-at-a-time -DCONFIG_AS_CFI=1 -DCONFIG_AS_CFI_SIGNAL_FRAME=1 -DCONFIG_AS_CFI_SECTIONS=1 -DCONFIG_AS_FXSAVEQ=1 -DCONFIG_AS_SSSE3=1 -DCONFIG_AS_CRC32=1 -DCONFIG_AS_AVX=1 -DCONFIG_AS_AVX2=1 -DCONFIG_AS_SHA1_NI=1 -DCONFIG_AS_SHA256_NI=1 -pipe  -fno-asynchronous-unwind-tables -O2 -fno-stack-protector  -mno-global-merge -no-integrated-as -fomit-frame-pointer  -fno-strict-overflow -nostdlib -fno-merge-all-constants -fno-stack-check -Wl,-T,vmlinux.lds -Wl,--whole-archive arch/x86/kernel/head_64.o arch/x86/kernel/head64.o arch/x86/kernel/ebda.o arch/x86/kernel/platform-quirks.o @link-args-final  lib/lib.a.o arch/x86/lib/lib.a.o arch/x86/lib/objects/*  .tmp_kallsyms2.o  -o vmlinux  2>errlog
cp errlog errlog.sav
python parse-errlog.py trimmed-list.py
