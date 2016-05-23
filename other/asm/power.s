#PURPOSE: Program to show how functions work
#         Will compute 2^3 + 5^2

.section .data
# empty. Only using registers
.section .text

.globl _start

_start:
  pushq $3 # 2nd arg
  pushq $2 # 1st arg
  call power
  addl $8, %esp # set the stack pointer back

  pushq %eax # save response from power

  pushq $2 # 2nd arg
  pushq $5 # 1st arg
  call power
  addl $8, %esp # set the stack pointer back

  popq %ebx # awnser from first call to power

  addl %eax, %ebx # add the two responces

exit:
  movl $1, %eax # 1 is exit code (%ebx is returned)
  int $0x80

.type power, @function
power:
  pushq %ebp # save old base pointer
  movl %esp, %ebp # stack pointer to base pointer
  subl $4, %esp # make room for local storage

  movl 8(%ebp), %ebx
  movl 12(%ebp), %ecx
  movl %ebx, -4(%ebp)

power_loop_start:
  cmpl $1, %ecx # base case. get it? "base"?
  je end_power

  movl -4(%ebp), %eax # get current
  imull %ebx, %eax # multiple current total by base

  movl %eax, -4(%ebp) # store current

  decl %ecx # dec power

  jmp power_loop_start

end_power:
  movl -4(%ebp), %eax # return val to eax
  movl %ebp, %esp # restore stack pointer
  popq %ebp # restore base pointer
  ret
