LLVM_MINGW_PATH := $$HOME/opt/llvm-mingw-20261020-ucrt-ubuntu-22.04-x86_64

all: x64

update-submodule:
	git submodule update --init --remote --recursive

x64:
	cd external/zedBSD && $(MAKE) -j4 -f apps/browser-win32/Makefile LLVM_MINGW=$(LLVM_MINGW_PATH)
	cd external/zedBSD/build/browser-win64 && zip -r ../../../../browser-win64.zip OmniGrammaton
