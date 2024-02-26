# labwork.S
  # Written 2015-2017 by F Lundevall
  # Skeleton file for IS1200/IS1500 lab 1.
  # The macros PUSH and POP are in the public domain.
  # Please add your own code at the end of the file.

  #
  # Please keep the two macros PUSH and POP unchanged
  #
.macro	PUSH reg
	addi	$sp,$sp,-4
	sw	\reg,0($sp)
.endm

.macro	POP reg
	lw	\reg,0($sp)
	addi	$sp,$sp,4
.endm
  #
  # Please add your own code below this line
  #
 

  .data
  .text
  
.global hexasc
  hexasc:
    andi  $t0, $a0, 0x0000000F # bitmask, ignore the 28 msb
     sltiu $t1,$t0,10  
   
    beqz $t1,bigger
   
    nop
    addi  $v0, $t0, 48
    jr    $ra
    nop

bigger:
    addi  $v0, $t0, 55
    jr    $ra
    nop
.global delay   
delay:
    PUSH $ra
    addi $t2,$a0,0
    move $t0, $0  # $t0 = i;
outerloop:
    bleu $t2, 0, exitloop1
    nop
    addi $t2, $t2, -1
   

innerloop:
   
    li $t1, 370000  # stop för loopen


    bgeu $t0, $t1, exitloop  # om i = 4711 så stoppar loopen
    nop

    addi $t0, $t0,1
    j innerloop
    nop

exitloop:
    j outerloop
    nop
exitloop1:
    POP  $ra
    jr   $ra
    nop
    
.global time2string       
time2string:
andi $a1, $a1, 0xFFFF # bitmask to ignore the 16 msb's

PUSH $ra # keep the main return address on the stack
PUSH $s0 # save $s0, need to restore it later
move $s0, $a0 # store $a0's address in $s0, because $a0 is used in the fn hexasc

srl $a0, $a1, 12 # shift so that we get 0x00000005 (1st iteration)
jal hexasc
nop
sb $v0, 0($s0)

#andi $t0, $a1, 0xFFF # ignore 20 msb's
srl $a0, $a1, 8 # shift so that we get 0x00000009 (1st iteration)
jal hexasc
nop
sb $v0, 1($s0)

addi $t0, $zero, 0x3a # colon
sb $t0, 2($s0)

#andi $t0, $a1, 0xFF # ignore 24 msb's
srl $a0, $a1, 4 # shift so that we get 0x00000005 (1st iteration)
jal hexasc
nop
sb $v0, 3($s0)

move $a0, $a1 # ignore 28 msb's, we get 0x00000008 (1st iteration)
jal hexasc
nop
sb $v0, 4($s0)

sb $zero, 5($s0) # null
addi    $v0, $s0, 0
POP     $s0 # restore $s0
POP $ra                     # restore return adress

jr $ra
nop

.global enable_interrupt
enable_interrupt:
ei
jr $ra
nop

