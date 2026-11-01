global _start

section .data
    array1 dq 3, 4, 1, 2, 5
    array2 dq 1, 2, 3, 4, 5

section .bss
    result_array resq 5

section .text
_start:
    mov rdi, array1
    mov rsi, array2
    mov rdx, result_array
    mov rcx, 5
    call add_arrays

    mov rax, 60
    mov rdi, 0
    syscall

add_arrays:
    test rcx, rcx
    jz .done

.loop_start:
    mov rax, [rdi]
    add rax, [rsi]
    mov [rdx], rax

    add rdi, 8
    add rsi, 8
    add rdx, 8

    loop .loop_start

.done:
    ret
