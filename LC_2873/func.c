
__attribute__((naked)) long long max(long long a, long long b) {
    __asm__(".intel_syntax noprefix;\
    push rbp;\
    mov rbp, rsp;\
    cmp rdx, rcx;\
    jge _a_gt_b;\
    mov rax, rcx;\
    jmp _ret_max;\
_a_gt_b:%;\
    mov rax, rdx;\
_ret_max:%;\
    mov rsp, rbp;\
    pop rbp;\
    ret;\
    .att_syntax" : : );
}

//RDI
//RSI
//RDX -> a
//RCX -> b
//R8
//R9
__attribute__((naked)) long long maximumTripletValue(int* nums, int nsize) {
    __asm__(".intel_syntax noprefix;\
    push rbp;\
    push rbx;\
    push r12;\
    push r13;\
    push r14;\
    push r15;\
    /*RDI = nums; RSI = size*/;\
    /*For loop counter = r12*/;\
    mov r12, 0;\
    /*vars:*/;\
    /*r15 = amax; r14 = bmax; r13 = retval*/;\
    mov r15, 0;\
    mov r14, 0;\
    mov r13, 0;\
    jmp _for_head;\
_in_for_loop:%;\
    /**/;\
    mov ebx, dword ptr[rdi+0x04*r12];\
    mov rax, r15;\
    mov rcx, rbx;\
    imul rcx;\
    mov rdx, r13;\
    mov rcx, rax;\
    call max;\
    mov r13, rax;\
    mov rdx, r15;\
    mov rcx, r14;\
    sub rcx, rbx;\
    call max;\
    mov r15, rax;\
    mov rdx, r14;\
    mov rcx, rbx;\
    call max;\
    mov r14, rax;\
    inc r12;\
_for_head:%;\
    cmp r12, rsi;\
    jl _in_for_loop;\
    mov rax, r13;\
    pop r15;\
    pop r14;\
    pop r13;\
    pop r12;\
    pop rbx;\
    pop rbp;\
    ret;\
    .att_syntax;" : : );
}