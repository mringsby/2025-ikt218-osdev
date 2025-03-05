#include "libc/stdint.h"
#include "libc/stddef.h"
#include "libc/stdbool.h"
#include <multiboot2.h>

#include "gdt.h"

#include "terminal.h"

void kernel_main(void) {
    terminal_initialize();
    terminal_writestring("Hello World");
}



struct multiboot_info {
    uint32_t size;
    uint32_t reserved;
    struct multiboot_tag *first;
};


int main(uint32_t magic, struct multiboot_info* mb_info_addr) {

    gdt_install();

    while(true)
    {
        // Do nothing
    }
    return 0;

}
