#PURPOSE: Program to show how functions work
#         Will compute 2^3 + 5^2

.section .data
# empty. Only using registers
.section .text

.globl _start

_start:
  push $3 # 2nd arg
  push $2 # 1st arg
  call power
  add $8, %esp # set the stack pointer back

  push %eax # save response from power

  push $2 # 2nd arg
  push $5 # 1st arg
  call power
  add $8, %esp # set the stack pointer back

  pop %ebx # awnser from first call to power

  add %eax, %ebx # add the two responces

exit:
  mov $1, %eax # 1 is exit code (%ebx is returned)
  int $0x80

.type power, @function
power:
  push %ebp # save old base pointer
  mov %esp, %ebp # stack pointer to base pointer
  sub $4, %esp # make room for local storage

  mov 8(%ebp), %ebx
  mov 12(%ebp), %ecx
  mov %ebx, -4(%ebp)

power_loop_start:
  cmp $1, %ecx # base case. get it? "base"?
  je end_power

  mov -4(%ebp), %eax # get current
  imull %ebx, %eax # multiple current total by base

  mov %eax, -4(%ebp) # store current

  dec %ecx # dec power

  jmp power_loop_start

end_power:
  mov -4(%ebp), %eax # return val to eax
  mov %ebp, %esp # restore stack pointer
  pop %ebp # restore base pointer
  ret
