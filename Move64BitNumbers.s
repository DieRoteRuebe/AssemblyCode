.global _start
.intel_syntax noprefix

.bss
nArray: .skip 16                    #Platzmachen für 16 Byte  

.text

_start:
    mov rax, 9223372036854775807    #Hier ist die Zahl an der oberen Grenze (MAX) = 2^63-1
    mov rbx, 9223372036854775808    #Ab hier wird die Zahl negativ weil der sign byte "geschalten ist" -> 2^63 bit
    mov r9, 0x7FFFFFFFFFFFFFFF      #Das ist die selbe zahl wie in rax nur in Hex -> 0x7 wegen -1Byte = 8 bits (sign Byte)
    mov r10, r9                     #Kopieren der zahl aus r9 in r10
    shr r10, 32                     #Bitshift um 32 bits nach rechts (31 plus sign bit) shr = logische Bewegung nach rechts
    mov r11d, r9d                   #Kopieren der unteren 2^32 bits aus r9 in r11d -> r9d = 32 bit Register-Abschnitt von r9       
#Achtung maximaler Mov von 32 bits:
    mov dword ptr [nArray], r10d    #Mov der 2^31 bits + sign bit aus r10 -> der untere teil r10d in das Array      
    mov dword ptr [nArray+8], r11d  #Mov der 2^31 bits + sign bit aus r11 -> untere teil r11d in das Array
    mov r12, [nArray]               #Mov aus dem Array in r12 (Oberer Teil)
    shl r12, 32                     #Logische verschiebung nach links um 32 bits -> multiplikation mit 2^32
    add r12, [nArray+8]             #Zuaddieren des unteren teils -> nun ist die ganze Zahl wieder in r12


    #Exit Call in Linux:
    mov rax, 60
    mov rdi, 0
    syscall
