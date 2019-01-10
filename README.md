# N64-Rust-Sample
A minimal sample of calling Rust code from C on the Nintendo 64

This is a very minimalistic sample (literally just got it to work) of calling a rust static lib from C on the N64.

The program simply calls a rust function returning 1 and goes into an infinite loop.  I was able to validate storing the return value from the function to the C variable using PJ64d debugger.

I will write instructions on how to build your environment to run this sample.

The gist of it is that you need rust, clang, xargo, the n64 sdk, and the modern n64 toolchain.

With that you can just run make.  xargo will build the static lib and it will get linked together with the app as codesegment.o.  From there you need to run mild to build the rom (I've not had success with spicy, the open source version of mild yet).
