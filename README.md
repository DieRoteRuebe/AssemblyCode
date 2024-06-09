# AssemblyCode
Assembly Code


I just store Assembly code ive written in here.
compile with:
  gcc -o <fileout.o> <filein.s>
  ld -o <fileout> <filein.o>
for debug symbols:
  gcc <filein.s> -c -g
  ld -o <fileou> <filein.o>
