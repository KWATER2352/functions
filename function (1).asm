section .data
    even_msg db "even", 10       ; "even\n"
    even_len equ $ - even_msg

    odd_msg db "odd", 10         ; "odd\n"
    odd_len equ $ - odd_msg

section .bss
    res resb 1                  ; temp storage for printing

section .text
    global _start

_start:
    mov eax, 13                 ; number to check
    call check_odd_even

    ; exit
    mov eax, 1
    xor ebx, ebx
    int 0x80

; function: check_odd_even
; input: eax = number
; prints "even\n" if even, "odd\n" if odd
check_odd_even:
    test eax, 1                ; check lowest bit
    jz is_even

    mov ecx, odd_msg
    mov edx, odd_len
    jmp print_result

is_even:
    mov ecx, even_msg
    mov edx, even_len

print_result:
    mov eax, 4                 ; sys_write
    mov ebx, 1                 ; stdout
    int 0x80
    ret

