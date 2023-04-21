# Lab 1: Reverse
# Lily Goldman
# CPE 315

# declare global so programmer can see actual addresses.
.globl welcome
.globl prompt
.globl sumText


#  Data Area (this area contains strings to be displayed during the program)
.data

welcome:
	.asciiz " This program outputs the reverse-ordered binary of the input number \n\n"

prompt:
	.asciiz " Enter an integer: "

sumText:
	.asciiz " \n r\Reverse = "


#Text Area (i.e. instructions)
.text

main:

	# Display the welcome message (load 4 into $v0 to display)
	ori     $v0, $0, 4

	# This generates the starting address for the welcome message.
	# (assumes the register first contains 0).
	lui     $a0, 0x1001

    syscall

    # Display prompt
   	ori     $v0, $0, 4

   	# This is the starting address of the prompt (notice the
   	# different address from the welcome message)
   	lui     $a0, 0x1001
   	ori     $a0, $a0,0x22
   	syscall

   	# Read 1st integer from the user (5 is loaded into $v0, then a syscall)
   	ori     $v0, $0, 5
   	syscall

   	# Clear $s0 for the sum
   	ori     $s0, $0, 0
