//THIS CODE NEEDS TO BE RUN IN LEETCODE

__attribute__((naked))int pivotInteger(int n) {
    __asm__(".intel_syntax noprefix;\
    push r15;\
    push r14;\
    push r13;\
    push r12;\
    mov r15, -1;\
    mov r9, 0;\
    mov r10, 1;\
    jmp _outerloopstart;\
    _outerloop:%;\
    mov r11, 0;\
    mov r12, 0;\
    mov rdx, 0;\
    jmp _inner1start;\
    _ininner1:%;\
    add r11, rdx;\
    inc rdx;\ 
    _inner1start:%;\
    cmp rdx, r10;\
    jle _ininner1;\
    mov rdx, r10;\
    jmp _inner2start;\
    _ininner2:%;\
    add r12, rdx;\
    inc rdx;\
    _inner2start:%;\
    cmp rdx, rax;\
    jle _ininner2;\
    cmp r11, r12;\
    je _res;\
    inc r10;\
    _outerloopstart:%;\
    cmp r10, rax;\
    jle _outerloop;\
    jmp _nores;\
    _res:%;\
    mov rax, r10;\
    pop r12;\
    pop r13;\
    pop r14;\
    pop r15;\
    ret;\
    _nores:%;\
    mov rax, r15;\
    pop r12;\
    pop r13;\
    pop r14;\
    pop r15;\
    ret;\
    .att_syntax" : :);
    //r9 = c
    //r10 = i
    //r11 = s1
    //r12 = s2
    //rdx = j
    //r15 = res
}
