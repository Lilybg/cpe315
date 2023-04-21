.globl main
.data

welcome:
   .asciiz "This program finds the modulo of a given numerator and divisorn"
numer:   
   .asciiz "Numerator: "
denom:
   .asciiz "Divisor: "
nl:
   .asciiz "n"
remain:
   .asciiz "Remainder: "

.text

main:

   # Print welcome
   #System.out.println("This program finds the modulo of a given numerator and divisor");
   li $v0, 4
   lui $a0, 0x1001
   ori $a0, $a0, 0x0000
   syscall

   # Print newline
   li $v0, 4
   lui $a0, 0x1001
   ori $a0, $a0, 0x0040
   syscall

   # Print numerator input prompt
   #System.out.println("Numerator:");
   li $v0, 4
   lui $a0, 0x1001
   ori $a0, $a0, 0x0010
   syscall

   # Read Num
   #Scanner myObj = new Scanner(System.in);
   #String num = myObj.nextLine();
   li $v0, 5
   syscall
   add $t0, $zero, $v0

   # Print divisor prompt
   #System.out.println("Divisor:");
   li $v0, 4
   lui $a0, 0x1001
   ori $a0, $a0, 0x0040
   syscall
   lui $a0, 0x1001
   ori $a0, $a0, 0x0020
   syscall

   # Read Div
   #Scanner myObj = new Scanner(System.in);
   #String div = myObj.nextLine();
   li $v0, 5
   syscall
   add $t1, $zero, $v0

   # Calculate remainder
   #temp = div - 1;
   addi $t2, $t1, -1
   #temp2 = (num && temp)
   and $t3, $t0, $t2

   # Print remainder text
   #System.out.printf(String.valueOf(temp2));
   li $v0, 4
   lui $a0, 0x1001
   ori $a0, $a0, 0x0040
   syscall
   lui $a0, 0x1001
   ori $a0, $a0, 0x0030
   syscall

   # Print remainder
   #System.out.printf("Remainder: ");
   li $v0, 1
   add $a0, $zero, $t3
   syscall

   # Print newline
   li $v0, 4
   lui $a0, 0x1001
   ori $a0, $a0, 0x0040
   syscall

   # Exit
   li $v0, 10
   syscall
   
