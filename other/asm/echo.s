.section .data

message:
  .byte 48,49,50,51,52,32,0

.section .text
.global _start

_start:
  push $message
  call print

exit:
  mov $60, %rax               # system call 60 is exit
  xor %rdi, %rdi              # we want return code 0
  syscall                     # invoke operating system to exit

print:
  mov $1, %rax                # system call 1 is write
  mov $1, %rdi                # file handle 1 is stdout
  mov $1, %rdx                # number of bytes
  pop %rsi                    # address of string to output
  pop %rsi                    # address of string to output
  # TODO: this not popping right thing because stack frame function stuff needs to be done
print_loop:
  movb (%rsi), %r8b        # bx current location to print
  cmpb $0, %r8b
  je print_exit
  syscall                     # invoke OS to write
  inc %rsi
  jmp print_loop
print_exit:
  ret
