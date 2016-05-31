.section .data
swap:
  .byte 0
.section .text
.global _start
_start:
  push $987654
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
count_digits_start:
  mov $1, %r8                 # digit counter
  mov %rbx, %rsp              # rsp = remaining digits
  mov $10, %rcx               # will be divisor and multiplier
count_digits_loop:
  mov $0, %rdx                # prefix of rax for multiply and divide
  mov $10, %rcx               # will be divisor and multiplier
  mov %r8, %rax
  mul %rcx                    # rax * input => rdx:rax
  mov %rax, %r8
  mov %rsp, %rax
  mov $10, %rcx               # will be divisor and multiplier
  mov $0, %rdx                # prefix of rax for multiply and divide
  div %rcx                    # rdx:rax / input => rax mod rdx
  mov %rax, %rsp
  cmp $10, %rax               # 10 to avoid having 1 extra digit in rdi
  jg count_digits_loop
  # r8 is now a base 10 number with the same number of digits as rbx
  #mov %r8, %rbx
print_register_loop:
  mov $0, %rdx
  mov %rbx, %rax
  div %r8                    # rdx:rax / input => rax mod rdx
  mov %rax, %rbx
  add $48, %rax               # ascii 0-9 is 48-57
  mov %rax, (%rsi)
  mov $1, %rax                # system call 1 is write
  mov $1, %rdi                # file handle 1 is stdout
  mov $1, %rdx                # number of bytes
  syscall
  mov $0, %rdx
  mov $10, %rcx
  mov %r8, %rax
  div %rcx                    # rdx:rax / input => rax mod rdx
  mov %rax, %r8
  cmp $0, %r8
  jg print_register_loop
print_register_exit:
  ret
