/**
 * Definition for a binary tree node.
 * struct TreeNode {
 *     int val;
 *     struct TreeNode *left;
 *     struct TreeNode *right;
 * };
 */
__attribute((naked)) uintptr_t dfs() {
    __asm__(".intel_syntax noprefix;\
    push rbp;\
    mov rbp, rsp;\
    sub rsp, 0x18;\
    /*Struct p { struct TreeNode* node; int depth}*/;\
    /*we get acces via offsets so for node* its [adr+0x00] for the int its [adr+0x08]/;\
    /*The same rule applies for the TreeNode* root:*/;\
    /*int val -> [adr+0x00]+padding to 8 byte; struct TreeNode* left -> [adr+0x08]; struct TreeNode* right -> [adr+0x10]*/;\
    cmp rdi, 0;\
    jne _recurs;\
    mov rax, 0;\
    mov rdx, 0;\
    jmp _ret;\
_recurs:%;\
    /*Stack:*/;\
    /*rsp+0 = root*/;\
    /*rsp+8 = left.node*/;\
    /*rsp+16 = left.depth*/;\
    /*right.node = rax*/;\
    /*right.depth = rdx*/;\
    mov qword ptr[rsp+0x00], rdi;\
    mov rsi, qword ptr[rdi+0x08];\
    mov rdi, rsi;\
    call dfs;\
    mov qword ptr[rsp+0x08], rax;\
    mov dword ptr[rsp+0x10], edx;\
    mov rsi, qword ptr[rsp+0x00];\
    mov rdi, qword ptr[rsi+0x10];\
    call dfs;\
    /*cmp left.depth, right.depth*/;\
    mov r8d, dword ptr[rsp+0x10];\
    cmp r8, rdx;\
    /*r8 = left.depth, rdx = right.depth*/;\
    je _ret_root;\
    jl _inc_rdx;\
    mov rax, qword ptr[rsp+0x08];\
    mov edx, dword ptr[rsp+0x10];\
    jmp _inc_rdx;\
_ret_root:%;\
    mov rax, qword ptr[rsp+0x00];\
    mov edx, dword ptr[rsp+0x10];\
_inc_rdx:%;\
    inc rdx;\
_ret:%;\
    add rsp, 0x18;\
    mov rsp, rbp;\
    pop rbp;\
    ret;\
    .att_syntax" : :);
}


__attribute__((naked)) struct TreeNode* lcaDeepestLeaves(struct TreeNode* root) {
    __asm__(".intel_syntax noprefix;\
    call dfs;\
    ret;\
    .att_syntax" : :);
}