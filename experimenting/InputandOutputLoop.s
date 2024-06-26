#erstellen eines Arrays in welchem 5 namen gespeichert werden
#via userinput und hiernach ausgegeben werden.


.intel_syntax noprefix


.section .bss
namesArray: .skip 1600      #8 bit für 1 char -> 10*8 = 80*5 = 400 -> 1600 für max 20 namen
namesCount: .skip 4
buffer: .skip 8
LF: .skip 1
offsetCounter: .skip 8
currentOffset: .skip 8

.section .data
maxChars: .ascii "Bitte maximal 10 Buchstaben eingeben:"    #36
howMany: .ascii "Bitte 5 Namen eingeben:"   #23

.section .text

.global _start


_start:
      mov dword ptr [offsetCounter], 0
      mov dword ptr [currentOffset], 0
      mov byte ptr [LF], 0xa      #add a LF -> ja ich hab keine Ahnung wie das im string declared wird....
      mov dword ptr [namesCount], 5    




_writeMaxChars:
      #Wie viele Namen Abfrage:
      mov rax, 1
      mov rdi, 1
      lea rsi, [maxChars]
      mov rdx, 36
      syscall
      mov rax, 1
      mov rdi, 1
      lea rsi, [LF]
      mov rdx, 2      #8 bit für 1 char -> 10*8 = 80*5 = 400 -> 1600 für max 20 namen
      syscall
      mov rax, 1
      mov rdi, 1
      lea rsi, [howMany]
      mov rdx, 23
      syscall
      mov rax, 1
      mov rdi, 1
      lea rsi, [LF]
      mov rdx, 2
      syscall
      jmp _startForLoop

_inForLoop: mov dword ptr [offsetCounter], r12d

      mov r9, [namesCount]
      dec r9
      mov dword ptr [namesCount], r9d
      mov r12, [offsetCounter]
      mov rax, 0
      mov rdi, 0
      lea rsi, [namesArray+r12]
      mov rdx, 10
      add r12, 10
      mov dword ptr [offsetCounter], r12d
      syscall
 mov dword ptr [offsetCounter], r12d


_startForLoop:
      mov r9, [namesCount]
      cmp r9, 0x0
      jg _inForLoop
      jmp _printLoopStart


_printLoop:
      mov r9, [currentOffset]
      mov rax, 1
      mov rdi, 1
      lea rsi, [namesArray+r9]
      mov rdx, 10
      add r9, 10
      mov dword ptr [currentOffset], r9d

      syscall
      



_printLoopStart:
      mov r9, [offsetCounter]
      mov r10, [currentOffset]
      cmp r9, r10 
      jg _printLoop
      
      


      
_exitCall:
      mov rax, 60
      mov rdi, 0
      syscall
