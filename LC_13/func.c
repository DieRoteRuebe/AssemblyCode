__attribute((naked)) int romanToInt(char* s) {
    __asm__(".intel_syntax noprefix;\
    push rbp;\
    mov rbp, rsp;\
    push rbx;\
    push r8;\
    push r9;\
    xor rax, rax;\
    xor rbx, rbx;\
    xor r9, r9;\
    mov bl, byte ptr [rdi];\
    jmp _loophead;\
_prepare_loop:%;\
    add r9, 1;\
    mov bl, byte ptr [rdi+r9];\
_loophead:%;\
    test bl, bl;\
    je _ret;\
    cmp bl, 73;\
    je _is_i;\
    cmp bl, 86;\
    je _is_v;\
    cmp bl, 88;\
    je _is_x;\
    cmp bl, 76;\
    je _is_l;\
    cmp bl, 67;\
    je _is_c;\
    cmp bl, 68;\
    je _is_d;\
    cmp bl, 77;\
    je _is_m;\
    jmp _ret;\
_is_i:%;\
    mov r8, r9;\
    add r8, 1;\
    mov bl, byte ptr [rdi+r8];\
    test bl, bl;\
    jne _is_i_cmp_v;\
    add rax, 1;\
    jmp _ret;\
_is_i_cmp_v:%;\
    cmp bl, 86;\
    jne _is_i_cmp_x;\
    sub rax, 1;\
    jmp _prepare_loop;\
_is_i_cmp_x:%;\
    cmp bl, 88;\
    jne _is_i_add;\
    sub rax, 1;\
    jmp _prepare_loop;\
_is_i_add:%;\
    add rax, 1;\
    jmp _prepare_loop;\
_is_v:%;\
    add rax, 5;\
    jmp _prepare_loop;\
_is_x:%;\
    mov r8, r9;\
    add r8, 1;\
    mov bl, byte ptr [rdi+r8];\
    test bl, bl;\
    jne _is_x_cmp_l;\
    add rax, 10;\
    jmp _ret;\
_is_x_cmp_l:%;\
    cmp bl, 76;\
    jne _is_x_cmp_c;\
    sub rax, 10;\
    jmp _prepare_loop;\
_is_x_cmp_c:%;\
    cmp bl, 67;\
    jne _is_x_add;\
    sub rax, 10;\
    jmp _prepare_loop;\
_is_x_add:%;\
    add rax, 10;\
    jmp _prepare_loop;\
_is_l:%;\
    add rax, 50;\
    jmp _prepare_loop;\
_is_c:%;\
    mov r8, r9;\
    add r8, 1;\
    mov bl, byte ptr [rdi+r8];\
    test bl, bl;\
    jne _is_c_cmp_d;\
    add rax, 100;\
    jmp _ret;\
_is_c_cmp_d:%;\
    cmp bl, 68;\
    jne _is_c_cmp_m;\
    sub rax, 100;\
    jmp _prepare_loop;\
_is_c_cmp_m:%;\
    cmp bl, 77;\
    jne _is_c_add;\
    sub rax, 100;\
    jmp _prepare_loop;\
_is_c_add:%;\
    add rax, 100;\
    jmp _prepare_loop;\
_is_d:%;\
    add rax, 500;\
    jmp _prepare_loop;\
_is_m:%;\
    add rax, 1000;\
    jmp _prepare_loop;\
_ret:%;\
    pop r9;\
    pop r8;\
    pop rbx;\
    mov rsp, rbp;\
    pop rbp;\
    ret;\
    .att_syntax" : : );
}   
