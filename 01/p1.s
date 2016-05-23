# Find the sum of all the multiples of 3 or 5 below 1000.

.globl _start

_start:
  movl $0, %ebx # total
  movl $0, %edi # index

start_loop:
  incl %edi # inc index
  cmpl $1000, %edi
  je exit
  movl $3, %ecx # divisor
  call check_div
  movl $5, %ecx # divisor
  call check_div
  jmp start_loop

check_div:
  movl $0, %edx
  movl %edi, %eax
  div %ecx # edx:eax / ecx = eax % edx
  cmpl $0, %edx
  je hit
  ret

hit:
  add %edi, %ebx
  jmp start_loop

exit:
  sub $233168, %ebx
  movl $1, %eax # 1 is the exit() syscall
  int $0x80
  # this prints zero right now, meaning ebx is at 233168, which is correct
  # TODO: proper printing
