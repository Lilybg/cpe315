{\rtf1\ansi\ansicpg1252\cocoartf2639
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fnil\fcharset0 Monaco;}
{\colortbl;\red255\green255\blue255;\red0\green0\blue0;\red255\green255\blue255;\red255\green255\blue255;
}
{\*\expandedcolortbl;;\cssrgb\c0\c0\c0;\cssrgb\c100000\c100000\c99985\c0;\cssrgb\c100000\c100000\c99971;
}
\margl1440\margr1440\vieww11520\viewh8400\viewkind0
\deftab720
\pard\pardeftab720\partightenfactor0

\f0\fs28 \cf2 \cb3 \expnd0\expndtw0\kerning0
\outl0\strokewidth0 \strokec4 .globl main\
.globl upper\
.globl lower\
.globl divisor\
.globl nl\
.globl quotient\
.data\
\
upper:\
   .asciiz "Enter the upper 32 bits: "\
lower:\
   .asciiz "Enter the lower 32 bits: "\
divisor:\
   .asciiz "Enter a 31-bit divisor (power of 2): "\
nl:\
   .asciiz "\\n"\
quotient:\
   .asciiz "Quotient: "\
\
.text\
\
main:\
\
   # Print upper prompt\
   li $v0, 4\
   lui $a0, 0x1001\
   ori $a0, $a0, 0x0000\
   syscall\
\
   # Read upper bits\
   li $v0, 5\
   syscall\
   addu $t0, $zero, $v0\
\
   # Print lower prompt\
   li $v0, 4\
   lui $a0, 0x1001\
   ori $a0, $a0, 0x0010\
   syscall\
\
   # Read lower bits\
   li $v0, 5\
   syscall\
   addu $t1, $zero, $v0\
\
   # Print divisor prompt\
   li $v0, 4\
   lui $a0, 0x1001\
   ori $a0, $a0, 0x0020\
   syscall\
\
   # Read divisor\
   li $v0, 5\
   syscall\
   addu $t2, $zero, $v0\
   \
   # Initialize loop counter\
   li $t3, 64\
\
   # Initialize quotient upper\
   li $t4, 0\
\
   # Initialize quotient lower\
   li $t5, 0\
   \
loop:\
   \
   # Shift remainder left by 1\
   sll $t6, $t0, 1   # Shift upper left\
   srl $t7, $t1, 31  # Shift low part right, saving bit\
   or $t0, $t6, $t7\
   sll $t1, $t1, 1 # Shift lower left\
\
   sll $t5, $t5, 1\
   srl $t8, $t4, 31\
   or $t5, $t5, $t8\
   sll $t4, $t4, 1\
\
   # Subtract divisor or jump to end\
   sltu $t9, $t0, $t2   # Check if upper < divisor\
   beqz $t9, subtract\
   j loop2\
\
subtract:\
   \
   # Subtract divisor from upper, and shift quotient left\
   subu $t0, $t0, $t2\
   ori $t5, $t5, 1\
\
loop2:\
   \
   # Increment counter and continue\
   addi $t3, $t3, -1\
   bnez $t3, loop\
\
   # Print quotient prompt\
   li $v0, 4\
   lui $a0, 0x1001\
   ori $a0, $a0, 0x0034\
   syscall\
\
\pard\pardeftab720\partightenfactor0
\cf2 \cb3 \strokec4    # Print quotient prompt\
   li $v0, 4\
   lui $a0, 0x1001\
   ori $a0, $a0, 0x0034\
   syscall\
\
   # Print quotient upper bits\
   li $v0, 1\
   addu $a0, $zero, $t4\
   syscall\
\
   # Print quotient lower bits\
   li $v0, 1\
   addu $a0, $zero, $t5\
   syscall\
\
   # Print newline\
   li $v0, 4\
   lui $a0, 0x1001\
   ori $a0, $a0, 0x0030\
   syscall\
\
   # Exit\
   li $v0, 10\
   syscall}