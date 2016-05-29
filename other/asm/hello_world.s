# from http://cs.lmu.edu/~ray/notes/gasexamples/


.section .data

message:
  .byte 48,48,32
  #.ascii "Hello, world\n"

.section .text
.global _start

_start:
  mov $1, %rax                # system call 1 is write
  mov $1, %rdi                # file handle 1 is stdout
  mov $message, %rsi          # address of string to output
  # mov $13, %rdx               # number of bytes
  mov $3, %rdx                # number of bytes
  movb $49, message
  syscall                     # invoke operating system to do the write

  mov $60, %rax               # system call 60 is exit
  xor %rdi, %rdi              # we want return code 0
  syscall                     # invoke operating system to exit
