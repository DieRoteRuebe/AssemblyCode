__attribute__((naked)) int minimumIndex(int* nums, int numsSize) {
    __asm__(".intel_syntax noprefix;\
    push rbp;\
    push rbx;\
    push r10;\
    push r11;\
    push r12;\
    push r13;\
    push r14;\
    push r15;\
    mov rcx, 0;\
    lea rdx, [rdi+rcx*4];\
    mov r8d, [rdx];\
    inc rcx;\
    mov rax, 1;\
    _head:%;\
    lea rdx, [rdi+rcx*4];\
    mov r9d, [rdx];\
    cmp r9d, r8d;\
    jne _decFreq;\
    inc rax;\
    jmp _checkZero;\
    _decFreq:%;\
    dec rax;\
    _checkZero:%;\
    cmp rax, 0;\
    jne _tail;\
    mov r8d, [rdx];\
    mov rax, 1;\
    _tail:%;\
    inc rcx;\
    cmp rcx, rsi;\
    jl _head;\
    xor rbx, rbx;\
    mov rcx, 0;\
    _head2:%;\
    lea rdx, [rdi+rcx*4];\
    mov r9d, [rdx];\
    cmp r9d, r8d;\
    jne _tail2;\
    inc rbx;\
    _tail2:%;\
    inc rcx;\
    cmp rcx, rsi;\
    jl _head2;\
    xor rcx, rcx;\
    xor r10, r10;\
    xor r12, r12;\
    _head3:%;\
    lea rdx, [rdi+rcx*4];\
    mov r9d, [rdx];\
    cmp r9d, r8d;\
    jne _tail3;\
    dec rbx;\
    inc r10;\
    mov r11, 2;\
    mov rax, rbx;\
    mul r11;\
    mov r13, rax;\
    mov r11, 2;\
    mov rax, r10;\
    mul r11;\
    mov r12, rax;\
    mov r14, rcx;\
    inc r14;\
    mov r15, rsi;\
    sub r15, rcx;\
    dec r15;\
    cmp r12, r14;\
    jle _tail3;\
    cmp r13, r15;\
    jle _tail3;\
    mov rax, rcx;\
    jmp _return;\
    _tail3:%;\
    inc rcx;\
    cmp rcx, rsi;\
    jl _head3;\
    mov rax, -1;\
    _return:%;\
    pop r15;\
    pop r14;\
    pop r13;\
    pop r12;\
    pop r11;\
    pop r10;\
    pop rbx;\
    pop rbp;\
    ret;\
    .att_syntax;" : : );
}