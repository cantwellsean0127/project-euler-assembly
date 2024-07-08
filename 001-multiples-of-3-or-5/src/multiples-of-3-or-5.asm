;; If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23. Find the sum of all the multiples of 3 or 5 below 1,000

extern printf

section .data

    three dq 3
    five dq 5

    current_number dq 3

    sum dq 0

    format_string_for_strings db "%s", 0
    format_string_for_integers db "%d", 0

    solution_msg db "Solution: ", 0

    newline db 10, 0

section .text

    global main

main:
    
    push rbp
    mov rbp, rsp

natural_numbers_loop:

    cmp qword [current_number], 1000
    jae print_solution

check_if_multiple:

    mov rax, [current_number]
    mov rdx, 0
    idiv qword [three]
    cmp rdx, 0
    je is_multiple

    mov rax, [current_number]
    mov rdx, 0
    idiv qword [five]
    cmp rdx, 0
    je is_multiple

after_check_if_multiple:

    inc qword [current_number]
    jmp natural_numbers_loop

is_multiple:

    mov rax, qword [current_number]
    add qword [sum], rax
    jmp after_check_if_multiple

print_solution:

    mov rdi, format_string_for_strings
    mov rsi, solution_msg
    mov rax, 0
    call printf

    mov rdi, format_string_for_integers
    mov rsi, [sum]
    mov rax, 0
    call printf

    mov rdi, format_string_for_strings
    mov rsi, newline
    mov rax, 0
    call printf

exit:

    mov rsp, rbp
    pop rbp
    
    mov rax, 60
    mov rdi, 0
    syscall