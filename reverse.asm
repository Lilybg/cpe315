# Lab 1: Reverse
# Lily Goldman
# CPE 315 Section 3
# Description:

# declare global so programmer can see actual addresses.
.globl welcome
.globl prompt
.globl sumText


#  Data Area (this area contains strings to be displayed during the program)
.data


welcome:
	.asciiz " This program reverses numbers \n\n"

prompt:
	.asciiz " Enter an Integer: "

sumText:
	.asciiz " \n r\ Reverse = "


#Text Area (i.e. instructions)
.text

main:
    # Display the welcome message (load 4 into $v0 to display)
    #System.out.println("This program reverses a number");
    ori     $v0, $0, 4

	# This generates the starting address for the welcome message.
    # (assumes the register first contains 0).
    lui     $a0, 0x1001
    syscall

    # Display prompt
    #System.out.println("Enter an Integer:");
   	ori     $v0, $0, 4

   	# This is the starting address of the prompt (notice the
   	# different address from the welcome message)
   	lui     $a0, 0x1001
   	ori     $a0, $a0,0x22
   	syscall

   	# Read 1st integer from the user (5 is loaded into $v0, then a syscall)
   	#Scanner myObj = new Scanner(System.in);
   	#String x = myObj.nextLine();
   	ori     $v0, $0, 5
   	syscall

   	# Clear $s0 for the sum
   	ori     $s0, $0, 0
   	ori     $s1, $0, 0

   	# Add 1st integer to sum
    # (could have put 1st integer into $s0 and skipped clearing it above)
    addu    $s0, $v0, $s0

    #initialize the AND value
    #static int t0 = 1;
    li $t0, 1

    #initialize the counter
    #static int t1 = 0;
    li $t1, 0

    #reverse loop
    #static int t3 = 32;
    li $t3, 32

    #for(int i = 0; i < t3; i++)
    loop1:  beq $t1, $t3, end

            #and the input with 1
            #t0 = x && 1;
            andi $t0, $s0, 1

            #shift output left by 1
            #y = y <<< 1;
            sll $s1, $s1, 1

            #add the anded value to s1
            #y = y + t0;
            add $s1, $s1, $t0

            #shift the input right by one
            #x = x >>> 1;
            srl $s0, $s0, 1

            #add to counter
            #t1 = t1 + 1;
            add $t1, $t1, 1

            #end loop
            j loop1
    end:

    # Display the sum text
    	ori     $v0, $0, 4
    	lui     $a0, 0x1001
    	ori     $a0, $a0,0x36
    	syscall

    	# Display the sum
    	# load 1 into $v0 to display an integer
    	#System.out.print(y);
    	ori     $v0, $0, 1
    	add 	$a0, $s1, $0
    	syscall

    	# Exit (load 10 into $v0)
    	ori     $v0, $0, 10
    	syscall
