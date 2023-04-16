{\rtf1\ansi\ansicpg1252\cocoartf2639
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fnil\fcharset0 Monaco;}
{\colortbl;\red255\green255\blue255;\red255\green255\blue255;\red255\green255\blue255;}
{\*\expandedcolortbl;;\cssrgb\c100000\c100000\c99985;\cssrgb\c100000\c100000\c100000\c0;}
\margl1440\margr1440\vieww11520\viewh8400\viewkind0
\deftab720
\pard\pardeftab720\partightenfactor0

\f0\fs28 \cf2 \cb3 \expnd0\expndtw0\kerning0
.globl main\
.data\
   welcome: .asciiz "This program takes in two numbers, x and y, and raises x to the y power.\\n"\
   prompt1: .asciiz "X = "\
   prompt2: .asciiz "y = "\
   prompt3: .asciiz "x^y = "\
   x: .word 0\
   y: .word 0\
   result: .word 0\
\
.text\
\
main:\
   # Ask for x\
   li $v0, 4\
   lui $a0, 0x1001\
   ori $a0, $a0, 0x0000\
   syscall\
\
   # Read X\
   li $v0, 5\
   syscall\
   sw $v0, x\
\
   # Ask for y\
   li $v0, 4\
   lui $a0, 0x1001\
   ori $a0, $a0, 0x0040\
   syscall\
\
   # Read y\
   li $v0, 5\
   syscall\
   sw $v0, y\
\
   # Start exponential function\
   lw $a0, x\
   lw $a1, y\
   jal exponent\
   sw $v0, result\
\
   # Print result\
   li $v0, 4\
   lui $a0, 0x1001\
   ori $a0, $a0, 0x0080\
   syscall\
   li $v0, 1\
   lw $a0, result\
   syscall\
\
   # Exit\
   li $v0, 10\
   syscall\
\
exponent: # $a0 = x $a1 = y $v0 = result\
\
   # Init vars\
   li $v0, 1\
   li $t0, 0\
\
loop1: # Exponential loop\
   beq $a1, $t0, exp_done\
   add $t1, $zero, $zero\
   li $t2, 0\
\
loop2: # Multiplication loop\
   beq $t2, $a0, mul_done\
\
   add $t1, $t1, $v0\
   addi $t2, $t2, 1\
\
   j loop2\
\
mul_done:\
   add $v0, $t1, $zero  # Result = temp\
   addi $t0, $t0, 1  # Counter++\
\
   j loop1\
\
exp_done:\
   jr $ra   # Return to print}