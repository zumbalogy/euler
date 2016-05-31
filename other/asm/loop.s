.section .data
swap:
  .byte 0
.section .text
.global _start
_start:
  push $654321
  push $swap
  call print_register
exit:
  mov $60, %rax               # system call 60 is exit
  xor %rdi, %rdi              # we want return code 0
  syscall                     # invoke operating system to exit
print_register:
  pop %rsi                    # address of string to output
  pop %rsi                    # address of string to output
  pop %rbx                    # value to print
  # TODO: this not popping right thing because stack frame function stuff needs to be done
  mov %rbx, %rax
  mov $0, %rdi                # digit counter
count_digits_loop:
  inc %rdi
  mov $0, %rdx
  mov $10, %rcx
  div %rcx                    # rdx:rax / input => rax mod rdx
  cmp $0, %rax
  jg count_digits_loop
print_register_loop:
  mov $0, %rdx
  mov %rbx, %rax
  mov $10, %rcx
  div %rcx                    # rdx:rax / input => rax mod rdx
  mov %rax, %rbx
  add $48, %rdx               # ascii 0-9 is 48-57
  mov %rdx, (%rsi)
  mov $1, %rax                # system call 1 is write
  mov $1, %rdi                # file handle 1 is stdout
  mov $1, %rdx                # number of bytes
  syscall
  cmp $0, %rbx
  jg print_register_loop
print_register_exit:
  ret
