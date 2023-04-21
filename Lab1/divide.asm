.globl main
.globl upper
.globl lower
.globl divisor
.globl nl
.globl quotient
.data

upper:
   .asciiz "Enter the upper 32 bits: "
lower:
   .asciiz "Enter the lower 32 bits: "
divisor:
   .asciiz "Enter a 31-bit divisor (power of 2): "
nl:
   .asciiz "n"
quotient:
   .asciiz "Quotient: "

.text

main:

   # Print upper prompt
   #System.out.println("Enter the upper 32 bits:");
   li $v0, 4
   lui $a0, 0x1001
   ori $a0, $a0, 0x0000
   syscall

   # Read upper bits
   #Scanner myObj = new Scanner(System.in);
   #String upper = myObj.nextLine();
   li $v0, 5
   syscall
   addu $t0, $zero, $v0

   # Print lower prompt
   #System.out.println("Enter the lower 32 bits:");
   li $v0, 4
   lui $a0, 0x1001
   ori $a0, $a0, 0x0010
   syscall

   # Read lower bits
   #Scanner myObj = new Scanner(System.in);
   #String lower = myObj.nextLine();
   li $v0, 5
   syscall
   addu $t1, $zero, $v0

   # Print divisor prompt
   #System.out.println("Enter a 31-bit divisor (power of 2):");
   li $v0, 4
   lui $a0, 0x1001
   ori $a0, $a0, 0x0020
   syscall

   # Read divisor
   #Scanner myObj = new Scanner(System.in);
   #String divisor = myObj.nextLine();
   li $v0, 5
   syscall
   addu $t2, $zero, $v0
   
   # Initialize loop counter
   #int counter = 64;
   li $t3, 64

   # Initialize quotient upper
   #int quotient_up = 0;
   li $t4, 0

   # Initialize quotient lower
   #int quotient_low = 0;
   li $t5, 0
   #while(counter != 0){
loop:
   
   # Shift remainder left by 1
   #upper = upper <<< 1;
   sll $t6, $t0, 1   # Shift upper left
   #lower = lower >>> 31;
   srl $t7, $t1, 31  # Shift low part right, saving bit
   #upper = (upper | lower);
   or $t0, $t6, $t7
   #lower = lower <<< 1;
   sll $t1, $t1, 1 # Shift lower left

   #quotient_low = quotient_low <<< 1;
   sll $t5, $t5, 1
   #quotient_up = quotient_up >>> 31;
   srl $t8, $t4, 31
   #quotient_low = (quotient_low | quotient_up);
   or $t5, $t5, $t8
   #quotient_low = quotient_low <<< 1;
   sll $t4, $t4, 1

   # Subtract divisor or jump to end
   #if(upper < divisor){
   #    upper = upper - divisor;
   #    quotient_low = quotient_low <<< 1;
   #}
   sltu $t9, $t0, $t2   # Check if upper < divisor
   beqz $t9, subtract
   j loop2
   #}
subtract:
   
   # Subtract divisor from upper, and shift quotient left
   subu $t0, $t0, $t2
   ori $t5, $t5, 1

loop2:
   
   # Increment counter and continue
   #counter = counter - 1;
   addi $t3, $t3, -1
   bnez $t3, loop

   # Print quotient prompt
   #System.out.print("Quotient: ");
   li $v0, 4
   lui $a0, 0x1001
   ori $a0, $a0, 0x0034
   syscall

   # Print quotient prompt
   li $v0, 4
   lui $a0, 0x1001
   ori $a0, $a0, 0x0034
   syscall

   # Print quotient upper bits
   #System.out.print(String.valueOf(quotient_up));
   li $v0, 1
   addu $a0, $zero, $t4
   syscall

   # Print quotient lower bits
   #System.out.print(String.valueOf(quotient_low));
   li $v0, 1
   addu $a0, $zero, $t5
   syscall

   # Print newline
   li $v0, 4
   lui $a0, 0x1001
   ori $a0, $a0, 0x0030
   syscall

   # Exit
   li $v0, 10
   syscall