; filepath: /workspaces/2025-ikt218-osdev/src/38_DaemonDuo/src/interrupt.asm
[BITS 32]

; CPU Exception ISRs (0-31)
global isr0
global isr1
global isr2
global isr3
global isr4
global isr5
global isr6
global isr7
global isr8
global isr9
global isr10
global isr11
global isr12
global isr13
global isr14
global isr15
global isr16
global isr17
global isr18
global isr19
global isr20
global isr21
global isr22
global isr23
global isr24
global isr25
global isr26
global isr27
global isr28
global isr29
global isr30
global isr31

; IRQ handlers (32-47)
global irq0
global irq1
global irq2
global irq3
global irq4
global irq5
global irq6
global irq7
global irq8
global irq9
global irq10
global irq11
global irq12
global irq13
global irq14
global irq15

; C handlers
extern isr_handler
extern irq_handler

; ISR common handler
isr_common_stub:
    ; Save registers
    pusha
    push ds
    push es
    push fs
    push gs
    
    ; Set up kernel mode segments
    mov ax, 0x10
    mov ds, ax
    mov es, ax
    mov fs, ax
    mov gs, ax
    
     ; Pass stack pointer as argument to the C handler
    mov eax, esp
    push eax

    ; Call C handler
    call isr_handler
    
    ; Clean up the argument
    add esp, 4

    ; Restore registers
    pop gs
    pop fs
    pop es
    pop ds
    popa
    
    ; Clean up stack and return
    add esp, 8
    iret

; IRQ common handler
; irq_common_stub:
;     ; Save registers
;     pusha
;     push ds
;     push es
;     push fs
;     push gs
    
;     ; Set up kernel mode segments
;     mov ax, 0x10
;     mov ds, ax
;     mov es, ax
;     mov fs, ax
;     mov gs, ax
    
;     ; Call C handler
;     call irq_handler
    
;     ; Restore registers
;     pop gs
;     pop fs
;     pop es
;     pop ds
;     popa
    
;     ; Clean up stack and return
;     add esp, 8
;     iret

irq_common_stub:
    ; Save registers
    pusha
    push ds
    push es
    push fs
    push gs
    
    ; Set up kernel mode segments
    mov ax, 0x10
    mov ds, ax
    mov es, ax
    mov fs, ax
    mov gs, ax
    
    ; Pass stack pointer as argument to the C handler
    mov eax, esp
    push eax
    
    ; Call C handler
    call irq_handler
    
    ; Clean up the argument
    add esp, 4
    
    ; Restore registers
    pop gs
    pop fs
    pop es
    pop ds
    popa
    
    ; Clean up stack and return
    add esp, 8
    iret

; CPU Exception ISRs (0-31)
isr0:
    cli
    push byte 0    ; No error code
    push byte 0    ; Interrupt number
    jmp isr_common_stub

isr1:
    cli
    push byte 0
    push byte 1
    jmp isr_common_stub

isr2:
    cli
    push byte 0
    push byte 2
    jmp isr_common_stub

isr3:
    cli
    push byte 0
    push byte 3
    jmp isr_common_stub

isr4:
    cli
    push byte 0
    push byte 4
    jmp isr_common_stub

isr5:
    cli
    push byte 0
    push byte 5
    jmp isr_common_stub

isr6:
    cli
    push byte 0
    push byte 6
    jmp isr_common_stub

isr7:
    cli
    push byte 0
    push byte 7
    jmp isr_common_stub

isr8:
    cli
    ; Error code already pushed by CPU
    push byte 8
    jmp isr_common_stub

isr9:
    cli
    push byte 0
    push byte 9
    jmp isr_common_stub

isr10:
    cli
    ; Error code already pushed by CPU
    push byte 10
    jmp isr_common_stub

isr11:
    cli
    ; Error code already pushed by CPU
    push byte 11
    jmp isr_common_stub

isr12:
    cli
    ; Error code already pushed by CPU
    push byte 12
    jmp isr_common_stub

isr13:
    cli
    ; Error code already pushed by CPU
    push byte 13
    jmp isr_common_stub

isr14:
    cli
    ; Error code already pushed by CPU
    push byte 14
    jmp isr_common_stub

isr15:
    cli
    push byte 0
    push byte 15
    jmp isr_common_stub

isr16:
    cli
    push byte 0
    push byte 16
    jmp isr_common_stub

isr17:
    cli
    push byte 0
    push byte 17
    jmp isr_common_stub

isr18:
    cli
    push byte 0
    push byte 18
    jmp isr_common_stub

isr19:
    cli
    push byte 0
    push byte 19
    jmp isr_common_stub

isr20:
    cli
    push byte 0
    push byte 20
    jmp isr_common_stub

isr21:
    cli
    push byte 0
    push byte 21
    jmp isr_common_stub

isr22:
    cli
    push byte 0
    push byte 22
    jmp isr_common_stub

isr23:
    cli
    push byte 0
    push byte 23
    jmp isr_common_stub

isr24:
    cli
    push byte 0
    push byte 24
    jmp isr_common_stub

isr25:
    cli
    push byte 0
    push byte 25
    jmp isr_common_stub

isr26:
    cli
    push byte 0
    push byte 26
    jmp isr_common_stub

isr27:
    cli
    push byte 0
    push byte 27
    jmp isr_common_stub

isr28:
    cli
    push byte 0
    push byte 28
    jmp isr_common_stub

isr29:
    cli
    push byte 0
    push byte 29
    jmp isr_common_stub

isr30:
    cli
    push byte 0
    push byte 30
    jmp isr_common_stub

isr31:
    cli
    push byte 0
    push byte 31
    jmp isr_common_stub

; IRQ handlers (0-15, remapped to 32-47)
irq0:
    cli
    push byte 0
    push byte 32
    jmp irq_common_stub

irq1:
    cli
    push byte 0
    push byte 33
    jmp irq_common_stub

irq2:
    cli
    push byte 0
    push byte 34
    jmp irq_common_stub

irq3:
    cli
    push byte 0
    push byte 35
    jmp irq_common_stub

irq4:
    cli
    push byte 0
    push byte 36
    jmp irq_common_stub

irq5:
    cli
    push byte 0
    push byte 37
    jmp irq_common_stub

irq6:
    cli
    push byte 0
    push byte 38
    jmp irq_common_stub

irq7:
    cli
    push byte 0
    push byte 39
    jmp irq_common_stub

irq8:
    cli
    push byte 0
    push byte 40
    jmp irq_common_stub

irq9:
    cli
    push byte 0
    push byte 41
    jmp irq_common_stub

irq10:
    cli
    push byte 0
    push byte 42
    jmp irq_common_stub

irq11:
    cli
    push byte 0
    push byte 43
    jmp irq_common_stub

irq12:
    cli
    push byte 0
    push byte 44
    jmp irq_common_stub

irq13:
    cli
    push byte 0
    push byte 45
    jmp irq_common_stub

irq14:
    cli
    push byte 0
    push byte 46
    jmp irq_common_stub

irq15:
    cli
    push byte 0
    push byte 47
    jmp irq_common_stub