{\rtf1\ansi\ansicpg1252\cocoartf2639
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\margl1440\margr1440\vieww11520\viewh8400\viewkind0
\pard\tx720\tx1440\tx2160\tx2880\tx3600\tx4320\tx5040\tx5760\tx6480\tx7200\tx7920\tx8640\pardirnatural\partightenfactor0

\f0\fs24 \cf0 .globl main\
.data\
\
welcome:\
   .asciiz "This program finds the modulo of a given numerator and divisor\\n"\
numer:   \
   .asciiz "Numerator: "\
denom:\
   .asciiz "Divisor: "\
nl:\
   .asciiz "\\n"\
remain:\
   .asciiz "Remainder: "\
\
.text\
\
main:\
\
   # Print welcome\
   li $v0, 4\
   lui $a0, 0x1001\
   ori $a0, $a0, 0x0000\
   syscall\
\
   # Print newline\
   li $v0, 4\
   lui $a0, 0x1001\
   ori $a0, $a0, 0x0040\
   syscall

   # Print numerator input prompt\
   li $v0, 4\
   lui $a0, 0x1001\
   ori $a0, $a0, 0x0010\
   syscall\
\
   # Read Num\
   #Scanner myObj = new Scanner(System.in);  // Create a Scanner object
   #String num = myObj.nextLine();
   li $v0, 5\
   syscall\
   add $t0, $zero, $v0\
\
   # Print divisor prompt\
   #Scanner myObj = new Scanner(System.in);  // Create a Scanner object
   #String div = myObj.nextLine();
   li $v0, 4\
   lui $a0, 0x1001\
   ori $a0, $a0, 0x0040\
   syscall\
   lui $a0, 0x1001\
   ori $a0, $a0, 0x0020\
   syscall\
\
   # Read Div\
   li $v0, 5\
   syscall\
   add $t1, $zero, $v0\
\
   # Calculate remainder\
   addi $t2, $t1, -1\
   and $t3, $t0, $t2\
\
   # Print remainder text\
   li $v0, 4\
   lui $a0, 0x1001\
   ori $a0, $a0, 0x0040\
   syscall\
   lui $a0, 0x1001\
   ori $a0, $a0, 0x0030\
   syscall\
\
   # Print remainder\
   #System.out.printf(String.valueOf(z));
   li $v0, 1\
   add $a0, $zero, $t3\
   syscall\
\
   # Print newline\
   li $v0, 4\
   lui $a0, 0x1001\
   ori $a0, $a0, 0x0040\
   syscall\
\
   # Exit\
   li $v0, 10\
   syscall\
}