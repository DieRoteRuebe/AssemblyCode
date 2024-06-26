__attribute__((naked)) int myAtoi(char* s) {
    __asm__(".intel_syntax noprefix;\
    /* Save non-Volatiles */;\
    push rbp;\
    push rsi;\
    push rbx;\
    push r15;\
    push r14;\
    push r13;\
    push r12;\
    mov r9, 0;\
    mov rsi, 0x7FFFFFFF;\
    xor rax, rax;\
    xor rbx, rbx;\
    mov rcx, 10;\
    xor r11, r11;\
    xor r12, r12;\
    xor r13, r13;\
    xor r14, r14;\
    xor r15, r15;\
_arrayLoop:%;\
    xor ebx, ebx;\
    movzx ebx, byte ptr [rdi + r9];\
    cmp ebx, 0;\
    je _exit;\
    cmp ebx, 43;\
    je _plusSign;\
    cmp ebx, 45;\
    je _minusSign;\
    cmp ebx, 32;\
    je _checkleadingSpacebar;\
    cmp ebx, 48;\
    je _checkLeadingZero;\
    cmp ebx, 57;\
    jg _exit;\
    cmp ebx, 46;\
    je _exit;\
    mov r12, 1;\
    jmp _sub;\
_sub:%;\
    sub rbx, 48;\
    imul rax, rax, 10;\
    add rax, rbx;\
    cmp rax, rsi;\
    jg _returnMax;\
_skipSub:%;\
    inc r9;\
    jmp _arrayLoop;\
_plusSign:%;\
    cmp r11, 1;\
    je _exit;\
    cmp r15, 1;\
    je _exit;\
    cmp r14, 1;\
    je _exit;\
    mov r14, 1;\
    jmp _skipSub;\
_minusSign:%;\
    cmp r11, 1;\
    je _exit;\
    cmp r12, 1;\
    je _exit;\
    cmp r14, 1;\
    je _exit;\
    cmp r15, 1;\
    je _exit;\
    mov r15, 1;\
    jmp _skipSub;\
_checkLeadingZero:%;\
    cmp r12, 1;\
    je _sub;\
    mov r11, 1;\
    jmp _skipSub;\
_checkleadingSpacebar:%;\
    cmp r12, 1;\
    je _exit;\
    cmp r15, 1;\
    je _exit;\
    cmp r14, 1;\
    je _exit;\
    cmp r13, 1;\
    je _exit;\
    cmp r11, 1;\
    je _exit;\
    jmp _skipSub;\
_exit:%;\
    cmp r15, 0;\
    je _return;\
    neg rax;\
    jmp _return;\
_returnMax:%;\
    cmp r15, 0;\
    je _returnPosMax;\
    mov rax, 0x80000000;\
    jmp _return;\
_returnPosMax:%;\
    mov rax, 0x7FFFFFFF;\
_return:%;\
    /* Prepare for return and return */;\
    pop r12;\
    pop r13;\
    pop r14;\
    pop r15;\
    pop rbx;\
    pop rsi;\
    pop rbp;\
    ret;\
    .att_syntax;" : : );
}
