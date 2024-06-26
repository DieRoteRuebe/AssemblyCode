.intel_syntax noprefix

.section .bss
counter: .skip 8
currentNumber: .skip 8
digitArray: .skip 64 
outputBuffer: .skip 1
LF: .skip 1
digitCount: .skip 4

.section .data
message: .asciz "the Number: "     #12
message2: .asciz " is a harshad Number"  #20

.section .text
.global _start



_start:
    mov dword ptr [digitCount], 0
    mov byte ptr [LF], 0xa
    mov dword ptr [counter], 1000000 
    mov dword ptr [currentNumber], 0 
    call _startOuter
    call _exitCall

_inOuter:
    inc r12
    mov r13,[currentNumber]
    inc r13
    mov dword ptr [currentNumber], r13d
    jmp _innerLoopStart
_inInner:
    xor rdx, rdx
    mov rbx, 10
    div rbx
    add r14, rdx
    cmp rax, 0
    jg _inInner     
    xor rdx, rdx
    mov rax, r13
    mov rbx, r14
    div rbx
    cmp rdx, 0
    je _printRes
    jmp _startOuter


  #Schleifenköpfe:
_innerLoopStart:
    mov r14, 0
    mov rax, r13
    cmp rax, 0
    jg _inInner

_startOuter:
    mov r12, [currentNumber]
    mov rdx, [counter]
    cmp r12, rdx
    jl _inOuter
    ret

_printRes:
    mov rax, 1
    mov rdi, 1
    lea rsi, [message]
    mov rdx, 12
    syscall
    #Convert the Number and print it
    mov r13, [currentNumber]
    call _convertStart
_printDigits:
    #comes back with stored digits on digitArray
    mov r12, [digitCount]
    mov r14, [digitArray+r12]
    mov byte ptr [outputBuffer], r14b
    mov rax, 1
    mov rdi, 1
    lea rsi, [outputBuffer]
    mov rdx, 1
    syscall
    cmp r12, 0
    jg _printOther
    jmp _printEndLF
_printOther:
    dec r12
    mov dword ptr [digitCount], r12d
    jmp _printDigits


_printEndLF:
    #Print the rest of the Message
    mov rax, 1
    mov rdi, 1
    lea rsi, [message2]
    mov rdx, 20
    syscall
    mov rax, 1
    mov rdi, 1
    lea rsi, [LF]
    mov rdx, 2
    syscall
    xor r15, r15
    mov dword ptr [digitCount], 0
    jmp _startOuter

_moreDigits:
    inc r12
    mov dword ptr [digitCount], r12d

_convertStart:
    xor rdx, rdx
    mov rax, r13
    cmp rax, 0
    je _skipDiv
    mov rbx, 10
    div rbx
_skipDiv:
    add rdx, 48
    mov r13, rax
    mov r9, rdx
    mov r12, [digitCount] 
    mov byte ptr [digitArray+r12], r9b
    cmp r13, 0
    jg _moreDigits
    ret

    

    
_exitCall:
    mov rax, 60
    mov rdi, 0
    syscall
