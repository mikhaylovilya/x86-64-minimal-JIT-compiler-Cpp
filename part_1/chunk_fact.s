; nasm -f elf64 chunk_fact.s -o chunk_fact.o
; 

extern printf

mov rax, 5
call factorial

push rbp

; rewrite mov rdi, format as:
lea rdi, [rel 0x13]
mov rsi, rax
xor rax, rax
call printf
    
pop rbp

mov rax, 0
ret

format: db "%d", 10, 0

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
