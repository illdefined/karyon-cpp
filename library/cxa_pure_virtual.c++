extern "C" {
	void __cxa_pure_virtual() {
#if defined __x86_64__
		asm volatile ("cli\n\thlt");
#endif
loop:
		goto loop;
	}
}
