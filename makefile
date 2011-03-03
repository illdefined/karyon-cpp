CXX      ?= clang++
CPP      ?= $(CC) -E

CPPFLAGS := -std=c++0x -nostdinc -Iinclude -ftabstop=4
CXXFLAGS := -pipe -ffreestanding -Wall -Wno-parentheses -O2
CXXFLAGS += -fmerge-all-constants -fstrict-overflow -fwhole-program -freg-struct-return -fshort-enums
LDFLAGS  := -nostdlib -static

.if $(CXX) == g++
CXXFLAGS += -combine
.endif

karyon  := karyon.c++

karyon: .depend
	$(CROSS)$(CXX) $(CPPFLAGS) $(CXXFLAGS) -o $@ $(karyon) $(LDFLAGS)

.depend: $(karyon)
	$(CROSS)$(CPP) $(CPPFLAGS) -M -MT karyon $(karyon) >$@

clean:
	rm -f .depend karyon

.PHONY: clean
.SUFFIXES:
