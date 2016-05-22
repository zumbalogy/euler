#PURPOSE: This program finds the maximum number of  a
#         set of data items.
#

#VARIABLES: The registers have the following uses:
#
# %edi - Holds the index of the data item being examined
# %ebx - Lagest data item found
# %eax - Curent data item
#
# The gollowing memory lactions are used:
#
# data_items - contains the item data. A 0 is used
#              to terminate the data
#

.section .data

data_items:
 .long 3,67,34,222,45,75,54,34,44,33,22,11,66,0

 .section .text

 .globl _start

_start:
 movl $0, %edi     # move 0 into the index register

start_loop:
 movl data_items(,%edi,4), %eax
 incl %edi         # increment index
 cmpl $0, %eax     # check to see if we have hit the end
 je loop_exit
 cmpl %ebx, %eax   # compare values
 jle start_loop    # jump to beginning of loop if new
                   # one is not bigger

 movl %eax, %ebx   # move the value as the largest
 jmp start_loop

loop_exit:
 # %ebx is the status code for the exit system call
 # and it already has the maximum number
 movl $1, %eax     # 1 is the exit() syscall
 int $0x80
