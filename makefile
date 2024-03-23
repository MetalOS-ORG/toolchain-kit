 #
 #	========================================================
 #
 #	MPCC
 # 	Copyright Mahrouss Logic, all rights reserved.
 #
 # 	========================================================
 #

COMMON_INC=-IHeaders -I./

ifeq ($(shell uname), "Darwin")
LINK_CC=g++ -std=c++20
else
LINK_CC=x86_64-w64-mingw32-g++ -std=c++20
endif

LINK_SRC=Sources/link.cc
LINK_OUTPUT=Output/link.exe
LINK_ALT_OUTPUT=Output/64link.exe
LINK_ALT_3_OUTPUT=Output/i64link.exe
LINK_ALT_2_OUTPUT=Output/32link.exe

PP_SRC=Sources/bpp.cc
PP_OUTPUT=Output/bpp.exe

# C Compiler
CC_SRC=Sources/cc.cc Headers/StdKit/*.cc Headers/AsmKit/*.cc
CC_OUTPUT=Output/cc.exe

# C++ Compiler
CXX_SRC=Sources/ccplus.cc Headers/StdKit/*.cc Headers/AsmKit/*.cc
CXX_OUTPUT=Output/ccplus.exe

# Assembler
ASM_SRC=Sources/64asm.cc Headers/StdKit/*.cc Headers/AsmKit/*.cc
ASM_OUTPUT=Output/64asm.exe

IASM_SRC=Sources/i64asm.cc Headers/StdKit/*.cc Headers/AsmKit/*.cc
IASM_OUTPUT=Output/i64asm.exe

.PHONY: all
all:
	@echo "Use a specific target."

.PHONY: pp
pp:
	$(LINK_CC) $(COMMON_INC) $(PP_SRC) -o $(PP_OUTPUT)

.PHONY: cl
cl:
	$(LINK_CC) $(COMMON_INC) $(CC_SRC) -o $(CC_OUTPUT)
	$(LINK_CC) $(COMMON_INC) $(CXX_SRC) -o $(CXX_OUTPUT)
	$(LINK_CC) $(COMMON_INC) $(IASM_SRC) -o $(IASM_OUTPUT)
	$(LINK_CC) $(COMMON_INC) $(ASM_SRC) -o $(ASM_OUTPUT)

.PHONY: link
link:
	$(LINK_CC) $(COMMON_INC) $(LINK_SRC) -o $(LINK_OUTPUT)
	cp $(LINK_OUTPUT) $(LINK_ALT_OUTPUT)
	cp $(LINK_OUTPUT) $(LINK_ALT_2_OUTPUT)
	cp $(LINK_OUTPUT) $(LINK_ALT_3_OUTPUT)

.PHONY: help
help:
	@echo "cl 	- Mahrouss Compilers."
	@echo "pp 	- Mahrouss Preprocessors."
	@echo "link 	- Mahrouss Linkers."

.PHONY: clean
clean:
	rm Output/$(MKCDFS_OUTPUT)
	rm Output/$(CC_OUTPUT)
	rm Output/$(PP_OUTPUT)
	rm Output/$(LINK_OUTPUT)

# Last rev 8-1-24