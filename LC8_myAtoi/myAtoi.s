.intel_syntax noprefix

  #RDI: char* s

.global myAtoi


myAtoi:
  push rbp
  mov r9, 0
  mov rsi, 0x7FFFFFFF
  xor rax, rax
  xor rbx, rbx
  mov rcx, 10     #Multiplikator
  mov r11, 0      #LeadingZeroFlag
  mov r12, 0      #LeadingDigitFlag
  mov r13, 0      #LeadingZeroFlag
  mov r14, 0      #PlusFlag
  mov r15, 0      #MinusFlag
_arrayLoop:  
  #loop till 0 offset + 1  
  mov r10, [rdi+r9]
  mov bl, r10b
  cmp rbx, 0      #Nullterminator -> End of Char[]
  je _exit
  cmp rbx, 43     #Plussign
  je _plusSign
  cmp rbx, 45
  je _minusSign   #Minussign
  cmp rbx, 32
  je _checkleadingSpacebar     #spacebar
  cmp rbx, 46     #dot
  je _exit
  cmp rbx, 48     #Zero
  je _checkLeadingZero
  cmp rbx, 57     #Character
  jg _exit
  mov r12, 1
  jmp _sub
_sub:
  sub rbx, 48     #Get the val in int
  add rax, rbx
  cmp rax, rsi
  jg _returnMax
  mul rcx
_skipSub:
  inc r9
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
  cmp r12, 1
  je _exit
  jmp _skipSub
  
_exit:
  div rcx
  cmp r15, 0
  je _return
  neg eax

_return:
  pop rbp
  ret
_returnMax:
  cmp r15, 0
  je _returnPosMax
  mov rax, 2147483648
  jmp _return
_returnPosMax:
  mov rax, 2147483647
  jmp _return
