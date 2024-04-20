 #
 #	========================================================
 #
 #	MPCC
 # 	Copyright Mahrouss Logic, all rights reserved.
 #
 # 	========================================================
 #

COMMON_INC=-I./Headers -I./ -I./Sources/Detail
LINK_CC=g++ -std=c++20
LINK_SRC=Sources/link.cc
LINK_OUTPUT=Output/link.exec
LINK_ALT_OUTPUT=Output/64link.exec
LINK_ALT_3_OUTPUT=Output/i64link.exec
LINK_ALT_2_OUTPUT=Output/32link.exec

PP_SRC=Sources/bpp.cc
PP_OUTPUT=Output/bpp.exec

SRC_COMMON=Sources/String.cc Sources/AsmKit.cc

# C Compiler (POWER)
64X0_CC_SRC=Sources/64x0-cc.cc $(SRC_COMMON)
64X0_CC_OUTPUT=Output/64x0-cc.exec

# C Compiler (Our own RISC)
PPC_CC_SRC=Sources/ppc-cc.cc $(SRC_COMMON)
PPC_CC_OUTPUT=Output/ppc-cc.exec

# 64x0 Assembler (Our Own RISC)
ASM_SRC=Sources/64asm.cc $(SRC_COMMON)
ASM_OUTPUT=Output/64asm.exec

# AMD64 Assembler (Intel CISC)
IASM_SRC=Sources/i64asm.cc $(SRC_COMMON)
IASM_OUTPUT=Output/i64asm.exec

# Power4 Assembler (IBM RISC)
PPCASM_SRC=Sources/ppcasm.cc $(SRC_COMMON)
PPCASM_OUTPUT=Output/ppcasm.exec

.PHONY: all
all: pre-processor compiler linker
	@echo "make: done."

.PHONY: pre-processor
pre-processor:
	$(LINK_CC) $(COMMON_INC) $(PP_SRC) -o $(PP_OUTPUT)

.PHONY: compiler
compiler:
	$(LINK_CC) $(COMMON_INC) $(64X0_CC_SRC) -o $(64X0_CC_OUTPUT)
	$(LINK_CC) $(COMMON_INC) $(PPC_CC_SRC) -o $(PPC_CC_OUTPUT)
	$(LINK_CC) $(COMMON_INC) $(IASM_SRC) -o $(IASM_OUTPUT)
	$(LINK_CC) $(COMMON_INC) $(ASM_SRC) -o $(ASM_OUTPUT)
	$(LINK_CC) $(COMMON_INC) $(PPCASM_SRC) -o $(PPCASM_OUTPUT)

.PHONY: linker
linker:
	$(LINK_CC) $(COMMON_INC) $(LINK_SRC) -o $(LINK_OUTPUT)
	cp $(LINK_OUTPUT) $(LINK_ALT_OUTPUT)
	cp $(LINK_OUTPUT) $(LINK_ALT_2_OUTPUT)
	cp $(LINK_OUTPUT) $(LINK_ALT_3_OUTPUT)

.PHONY: help
help:
	@echo "Compiler 	- Mahrouss Compilers."
	@echo "Preprocessor 	- Mahrouss Preprocessors."
	@echo "linker 		- Mahrouss Linkers."
	@echo "clean 		- Clean objects and executables."

.PHONY: clean
clean:
	rm -f $(64X0_CC_OUTPUT)
	rm -f $(PPC_CC_OUTPUT)
	rm -f $(PP_OUTPUT)
	rm -f $(ASM_OUTPUT)
	rm -f $(IASM_OUTPUT)
	rm -f $(LINK_OUTPUT)

# Last rev 8-1-24