.intel_syntax noprefix
.global myAtoi
myAtoi:
    #Save Callers no-volatiles:
    push rbp
    push rsi
    push rbx
    push r15
    push r14
    push r13
    push r12
    #Prepare the flags and boundaries:
    mov r9, 0
    mov rsi, 0x7FFFFFFF   #Max boundarie
    xor rax, rax      #Init the registers with 0
    xor rbx, rbx
    mov rcx, 10
    xor r11, r11
    xor r12, r12
    xor r13, r13
    xor r14, r14
    xor r15, r15
_arrayLoop:
    xor ebx, ebx    
    movzx ebx, byte ptr [rdi + r9]  #movzx to move a byte ptr into a dword Size registers with filled 0s
    cmp ebx, 0
    je _exit
    cmp ebx, 43     #Dec Val for +
    je _plusSign   
    cmp ebx, 45     #Dec Val for -
    je _minusSign
    cmp ebx, 32     #Dec Val for Spacebar
    je _checkleadingSpacebar
    cmp ebx, 48     #Dec Val for 0
    je _checkLeadingZero
    cmp ebx, 57     #Dec Val for any Char 
    jg _exit
    cmp ebx, 46     #Dec Val for .
    je _exit
    mov r12, 1      #Set the digit Flag
_sub:
    sub rbx, 48
    imul rax, rax, 10
    add rax, rbx
    cmp rax, rsi
    jg _returnMax
_skipSub:
    inc r9          #Inc the counter for the offset
    jmp _arrayLoop
_plusSign:
    cmp r11, 1
    je _exit
    cmp r15, 1
    je _exit
    cmp r14, 1
    je _exit
    mov r14, 1
    jmp _skipSub
_minusSign:
    cmp r11, 1
    je _exit
    cmp r12, 1
    je _exit
    cmp r14, 1
    je _exit
    cmp r15, 1
    je _exit
    mov r15, 1
    jmp _skipSub
_checkLeadingZero:
    cmp r12, 1
    je _sub
    mov r11, 1
    jmp _skipSub
_checkleadingSpacebar:
    #Ckeck if any other Flag is set if so go to exit and return
    cmp r12, 1
    je _exit
    cmp r15, 1
    je _exit
    cmp r14, 1
    je _exit
    cmp r13, 1
    je _exit
    cmp r11, 1
    je _exit
    jmp _skipSub
_exit:
    #Check if the Negative Flag is set (Minus Flag)
    cmp r15, 0
    je _return
    neg rax
    jmp _return
_returnMax:
    cmp r15, 0
    je _returnPosMax
    mov rax, 0x80000000 #Maxnumber of signed int32 if negative
    jmp _return
_returnPosMax:
    mov rax, 0x7FFFFFFF #Maxnumber of signed int32 if postive
_return:
    #Pop the saved volatiles from the stack and return
    pop r12
    pop r13
    pop r14
    pop r15
    pop rbx
    pop rsi
    pop rbp
    ret

