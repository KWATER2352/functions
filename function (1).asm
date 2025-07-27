section .data
    even_msg db "even", 10       
    even_len equ $ - even_msg

    odd_msg db "odd", 10         
    odd_len equ $ - odd_msg

section .bss
    res resb 1                  

section .text
    global _start

_start:
    mov eax, 13                
    call check_odd_even

    mov eax, 1
    xor ebx, ebx
    int 0x80

check_odd_even:
    test eax, 1                
    jz is_even

    mov ecx, odd_msg
    mov edx, odd_len
    jmp print_result

is_even:
    mov ecx, even_msg
    mov edx, even_len

print_result:
    mov eax, 4                 
    mov ebx, 1                 
    int 0x80
    ret
