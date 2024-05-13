; compile and run with:
; nasm -f elf64 asm_fact.s -o asm_fact.o && gcc -no-pie asm_fact.o -o asm_fact && ./asm_fact

; imagebase, relocation table
; objcopy

section .data
    format: db "%d", 10, 0
    ; msg: db "Hello world", 10, 0
section .text
    ; default rel
    extern printf
    global main

main:
    ; Calculate the factorial of 5 (5! = 120)
    mov rax, 5
    call factorial
    ; The result (120) is now stored in eax

    push rbp

    mov rdi, format
    ; alternative
    ; lea rdi, [rel format]
    mov rsi, rax
    xor rax, rax
    call printf

    ; Exit the program (32-bit style)
    ; mov rax, 1
    ; xor rbx, rbx
    ; int 0x80

    pop rbp

    mov rax, 0
    ret

; Factorial function using recursion
factorial:
    ; Check if eax is 0 (base condition)
    cmp rax, 0
    jz end_recursion

    ; Save the current value of eax
    push rax

    ; Decrement eax and call factorial function recursively
    dec rax
    call factorial

    ; Multiply the result returned in eax with the saved value of eax
    pop rbx
    imul rax, rbx

    ret

end_recursion:
    ; Return 1 when eax is 0 (base condition)
    mov rax, 1
    ret
