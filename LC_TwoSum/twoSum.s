.intel_syntax noprefix
.bss
.text

.global twoSum
  #Arguments Coming into:
  #RDI int* nums ->Array coming from C Code -> Ints should be stored in an 4 byte (16bit) offset
  #RSI numsSize ->Size of corresponding Array
  #RDX target
  #RCX int* returnSize <--- mov 2 in rsp 0x28 and the returnArray in rax with the two numbers by 4 byte (16bit) offset
twoSum:
    #Save Callers Stack + non-volatile registers:
    push rbp                         
    push r12
    push r13
    push r14
    push r15
    #Save the Arguments:
    sub rsp, 0x40   #Make room for our arguments
    mov qword ptr [rsp+0x30], rdi
    mov dword ptr [rsp+0x38], esi   #incoming Array.size()
    mov dword ptr [rsp+0x40], edx   #incoming Target
    mov qword ptr [rsp+0x48], rcx   #incoming return Adress
    #Get our Store for Answer:
    mov rdi, 8
    call malloc
    mov qword ptr [rsp+0x50], rax
    
    #Start the Algorithm:
    mov rdi, qword ptr [rsp+0x30]
    mov edx, dword ptr [rsp+0x40]   #Target
    mov ebx, dword ptr [rsp+0x38]   #numsSize
    jmp _outerLoopStart
    #looping -> two for-loops
    #outer i is in r15
    #inner i is in r14
    #offsetCounter outer is in r13
    #offsetCounter inner is in r12
_inOuterLoop:
    lea rsi, [rdi+r15*4]
    mov r11d, dword ptr [rsi]   #CurrentNumber outer
    jmp _innerLoopStart

_inInnerLoop:
    xor rax, rax
    lea rsi, [rdi+r14*4]
    mov eax, dword ptr [rsi]#CurrentNumber inner
    add rax, r11            #CurrentNumber outer  
    cmp rax, rdx
    je _res
    inc r14


_innerLoopStart:
    cmp r14, rbx
    jl _inInnerLoop
    mov r12, 0
    inc r15
       
_outerLoopStart:
    mov r14, 0                      #Prepare the counter for the innerloop
    cmp r15, rbx
    jl _inOuterLoop
    jmp _exitCall


_res:
    mov rax, qword ptr [rsp+0x48]
    mov dword ptr [rax], 0x2
    xor rax, rax
    mov rax, qword ptr [rsp+0x50]
    mov dword ptr [rax], r15d
    lea rax, [rax+4]
    mov dword ptr [rax], r14d
    mov rax, qword ptr [rsp+0x50]
    
_exitCall:
    mov rax, [rsp+0x48]
    add rsp, 0x40
    pop r15
    pop r14
    pop r13
    pop r12
    pop rbp
    ret
