.intel_syntax noprefix

.section .bss
string: .skip  200                                     #Gives place for a string consisting of 10 individual Numbers
counter: .skip 8                                      
Number: .skip 400
tempNumber: .skip 8
NumberCounter: .skip 8
currentCounter: .skip 8
offsetCounter: .skip 8



.section .text
.global _start


_exitCall:
      mov rax, 0x3c
      mov rdi, 0x0
      syscall
      ret

_start:
      mov dword ptr [offsetCounter], 0
      mov dword ptr [NumberCounter], 1
      mov dword ptr [currentCounter], 1
      mov rax, offsetCounter
      mov qword ptr [Number+rax], 123456789       #Setup the Number
      add rax, 8                                  #set the offset
      mov rdx, NumberCounter
      inc rdx
      mov dword ptr [offsetCounter], eax
      mov qword ptr [Number+rax], 987654321         #Bitoffset -> 8 byte ausrichtung
      mov dword ptr [NumberCounter], edx
      mov dword ptr [counter], 1                  #Setup the counter We start at 1 so we dont have to cmp negatives
      call _printInt
      call _exitCall


 
_printInt:
      #add a Newline at the end
      mov rax, 0xa
      mov rbx, counter
      inc rbx
      mov byte ptr [string+rbx], al
      mov dword ptr [counter], ebx            

_setNumbersInTemp:
      #Setup the Numbers on the string:
      mov r12, offsetCounter
      mov rax, [Number+r12]                       #Mov the Number on rax for the division   Max size of Number:2^27
      sub r12, 0x8
      mov qword ptr [tempNumber], rax
      mov dword ptr [offsetCounter], r12d
_setNumbers:
      mov rax, tempNumber
      mov rbx, 10                                 #Mov the divisor into rbx
      xor rdx, rdx                                #Xor rdx to set to 0
      div rbx                                     #Reminder of Number lands in rdx
      mov qword ptr [tempNumber], rax             #Store the leftover Number back
      mov rbx, counter                            #Move counter to rbx
      inc rbx                                     #Inc the counter since we had one more Number
      mov dword ptr [counter], ebx                #Store the inced counter back
      add rdx, 0x30                               #Add 48 to get ascii val of Number
      mov byte ptr [string+rbx], dl               #use dl -> lowbyte to store only the number (efficient space usage on string)                             
      cmp rax, 0                                  #Number is still on rax -> cmp to 0
      jg _setNumbers                              #cmp flag says greater jump back to begin and repeat
      mov r12, NumberCounter
      mov rax, currentCounter
      inc rax
      mov dword ptr [currentCounter], eax
      cmp rax, r12
      jle _setNumbersInTemp
      mov rbx, counter                            #Mov the counter alrdy in rbx to prepare for print
      jmp _printfromBack                          #else jmp in the print loop
      
      mov dword ptr [counter], 1   
_decCounter:
      dec rbx                                     #dec the counter
_printfromBack:
      #Print from back beginning at Counter:
      #Prepare the syscall
      mov rax, 1                          
      mov rdi, 1
      mov rdx, 1                                  #Mov the counter into rbx
      lea rsi, [string+rbx]                       #Load the adress at counter
      syscall
      cmp rbx, 0x0                                #Cmp the counter to 0
      jg _decCounter                              #If greate then 0 dec and start again
      
      ret
      
