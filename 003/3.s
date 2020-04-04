# The prime factors of 13195 are 5, 7, 13 and 29.
# What is the largest prime factor of the number 600851475143?
.section .data
swap:
  .byte 0
.section .text
.global _start
_start:
  mov $0, %rdx
  mov $600851475143, %rax
  mov $2, %rbx
even_loop:
  mov %rax, %rcx
  div %rbx # rdx:rax / input => rax mod rdx
  cmp $0, %rdx
  je even_loop
  jg even_restore
  jmp factor_loop_setup
even_restore:
  mov %rcx, %rax
factor_loop_setup:
  mov $1, %rbx
factor_loop:
  add $2, %rbx
  mov %rbx, %rcx
  imul %rcx, %rcx
  cmp %rcx, %rax
  jl exit
inner_loop:
  mov $0, %rdx
  mov %rax, %rcx
  div %rbx # rdx:rax / input => rax mod rdx
  cmp $0, %rdx
  jg restore
  jmp inner_loop
restore:
  mov %rcx, %rax
  jmp factor_loop
exit:
  push %rax
  push $swap
  call print_register
  # 6857
  mov $1, %rax # 1 is the exit() syscall
  int $0x80
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
  imul $10, %r8
  mov %rsp, %rax
  mov $10, %rcx               # will be divisor and multiplier
  mov $0, %rdx                # prefix of rax for multiply and divide
  div %rcx                    # rdx:rax / input => rax mod rdx
  mov %rax, %rsp
  cmp $10, %rax               # 10 to avoid having 1 extra digit in rdi
  jg count_digits_loop
  # r8 is now a base 10 number with the same number of digits as rbx
print_register_loop:
  mov $0, %rdx
  mov %rbx, %rax
  div %r8                     # rdx:rax / input => rax mod rdx
  mov %rax, %rsp
  add $48, %rsp               # ascii 0-9 is 48-57
  mov %rsp, (%rsi)
  imul %r8, %rax
  sub %rax, %rbx
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
  movb $10, (%rsi)            # 10 is ascii newline
  mov $1, %rax                # system call 1 is write
  mov $1, %rdi                # file handle 1 is stdout
  mov $1, %rdx                # number of bytes
  syscall
  ret
