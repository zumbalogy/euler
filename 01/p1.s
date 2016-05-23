# Find the sum of all the multiples of 3 or 5 below 1000.

.globl _start

_start:
  mov $0, %rbx # total
  mov $0, %rdi # index

start_loop:
  inc %rdi # inc index
  cmp $1000, %rdi
  je exit
  mov $3, %rcx # divisor
  call check_div
  mov $5, %rcx # divisor
  call check_div
  jmp start_loop

check_div:
  mov $0, %rdx
  mov %rdi, %rax
  div %rcx # rdx:rax / rcx = rax % rdx
  cmp $0, %rdx
  je hit
  ret

hit:
  add %rdi, %rbx
  jmp start_loop

exit:
  sub $233168, %rbx
  mov $1, %rax # 1 is the exit() syscall
  int $0x80
  # this prints zero right now, meaning ebx is at 233168, which is correct
  # TODO: proper printing
