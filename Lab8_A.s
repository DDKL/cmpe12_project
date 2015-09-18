
#include <WProgram.h>

/* define all global symbols here */
.global MyFunc
.global milliseconds

.text
.set noreorder


/*********************************************************************
 * Setup MyFunc
 ********************************************************************/
.ent MyFunc
/*
Name: Lee, Doo Kyung
Lab8_A.s
6/7/2015
Section Ogleari TTh 11-1pm
dlee32@ucsc.edu
/*
MyFunc: /*SET (LEDS, 1);
        la  $t0, PORTE      /* LEA R0, PORTE
        lw  $t1, 0($t0)     /* LDR R1, R0, 0
        ori $t1, $t1, 0x1   /* OR  R1, R1, 1 toggle led 1*
        sw  $t1, 0($t0)     /* STR R1, R0, 0*
        /*nop*/
        /*PORTE = 1000111100110100 OR 0000000000000001
        /*TOGGLE (LEDS, 2); *
        lw  $t1, 0($t0)     /* LDR R1, R0, 0*
        xori $t1, $t1, 0x2   /* XOR  R1, R1, 2 toggle led 2*
        sw  $t1, 0($t0)     /* STR R1, R0, 0*
*/
MyFunc: /*SET (LEDS, 1); */
        li $t0, 0x0000
        sw $t0, TRISE
        la  $t0, PORTE      /* LEA R0, PORTE*/


        /*how to do branch
        if(SW1)
            SET(LEDS, 3);
        else(SW2)
            CLEAR(LEDS, 3);*/
        la $t2, PORTD       /*LEA R2, PORTD */
        lw $t3, 0($t2)      /*LDR R3, R2, 0 */
        lw $t5, 0($t2)
        lw $t6, 0($t2)
        lw $t7, 0($t2)
        lw $t8, 0($t2)
        lw $t9, 0($t2)
        lw $a0, 0($t2)
        andi $t3, $t3, 0b0000000100000000 /*AND R3, R3, x0100*/
        li  $t4, 0
        beq $t3, $t4, foo1  /*BRz foo*/
        nop
        lw $t1, 0($t0) /*LDR R1, R0, 0*/
        ori $t1, $t1, 0x1
        sw $t1, 0($t0) /*STR R1, R0, 0*/
        j endFunc
        nop
foo1:
        lw $t1, 0($t0) /*LDR R1, R0, 0*/
        andi $t1, $t1, 0xFFFE
        sw $t1, 0($t0) /*STR R1, R0, 0*/

        andi $t5, $t5, 0b0000001000000000 /*AND R3, R3, x0100*/
        li  $t4, 0
        beq $t5, $t4, foo2 /*BRz foo*/
        nop
        lw $t1, 0($t0) /*LDR R1, R0, 0*/
        ori $t1, $t1, 0x2
        sw $t1, 0($t0) /*STR R1, R0, 0*/
        j endFunc
        nop
foo2:
        lw $t1, 0($t0) /*LDR R1, R0, 0*/
        andi $t1, $t1, 0xFFFD
        sw $t1, 0($t0) /*STR R1, R0, 0*/

        andi $t6, $t6, 0b0000010000000000 /*AND R3, R3, x0100*/
        li  $t4, 0
        beq $t6, $t4, foo3  /*BRz foo*/
        nop
        lw $t1, 0($t0) /*LDR R1, R0, 0*/
        ori $t1, $t1, 0x4
        sw $t1, 0($t0) /*STR R1, R0, 0*/
        j endFunc
        nop
foo3:
        lw $t1, 0($t0) /*LDR R1, R0, 0*/
        andi $t1, $t1, 0xFFFB
        sw $t1, 0($t0) /*STR R1, R0, 0*/

        andi $t7, $t7, 0b0000100000000000 /*AND R3, R3, x0100*/
        li  $t4, 0
        beq $t7, $t4, foo4  /*BRz foo*/
        nop
        lw $t1, 0($t0) /*LDR R1, R0, 0*/
        ori $t1, $t1, 0x8
        sw $t1, 0($t0) /*STR R1, R0, 0*/
        j endFunc
        nop
foo4:
        lw $t1, 0($t0) /*LDR R1, R0, 0*/
        andi $t1, $t1, 0xFFF7
        sw $t1, 0($t0) /*STR R1, R0, 0*/

        andi $t8, $t8, 0b0000000000100000 /*AND R3, R3, x0100*/
        li  $t4, 0
        beq $t8, $t4, foo5  /*BRz foo*/
        nop
        lw $t1, 0($t0) /*LDR R1, R0, 0*/
        ori $t1, $t1, 0x20
        sw $t1, 0($t0) /*STR R1, R0, 0*/
        j endFunc
        nop
foo5:
        lw $t1, 0($t0) /*LDR R1, R0, 0*/
        andi $t1, $t1, 0xFFDF
        sw $t1, 0($t0) /*STR R1, R0, 0*/

        andi $t9, $t9, 0b0000000001000000 /*AND R3, R3, x0100*/
        li  $t4, 0
        beq $t9, $t4, foo6  /*BRz foo*/
        nop
        lw $t1, 0($t0) /*LDR R1, R0, 0*/
        ori $t1, $t1, 0x40
        sw $t1, 0($t0) /*STR R1, R0, 0*/
        j endFunc
        nop
foo6:
        lw $t1, 0($t0) /*LDR R1, R0, 0*/
        andi $t1, $t1, 0xFFBF
        sw $t1, 0($t0) /*STR R1, R0, 0*/

        andi $a0, $a0, 0b0000000010000000 /*AND R3, R3, x0100*/
        li  $t4, 0
        beq $a0, $t4, foo7  /*BRz foo*/
        nop
        lw $t1, 0($t0) /*LDR R1, R0, 0*/
        ori $t1, $t1, 0x80
        sw $t1, 0($t0) /*STR R1, R0, 0*/
        j endFunc
        nop
foo7:
        lw $t1, 0($t0) /*LDR R1, R0, 0*/
        andi $t1, $t1, 0xFF7F
        sw $t1, 0($t0) /*STR R1, R0, 0*/

        la $t2, PORTF       /*LEA R2, PORTD */
        lw $t3, 0($t2)      /*LDR R3, R2, 0 */
        andi $t3, $t3, 0b0000000000000010 /*AND R3, R3, x0100*/
        li  $t4, 0
        beq $t3, $t4, foo8  /*BRz foo*/
        nop
        lw $t1, 0($t0) /*LDR R1, R0, 0*/
        ori $t1, $t1, 0x10
        sw $t1, 0($t0) /*STR R1, R0, 0*/
        j endFunc
        nop
foo8:
        lw $t1, 0($t0) /*LDR R1, R0, 0*/
        andi $t1, $t1, 0xFFEF
        sw $t1, 0($t0) /*STR R1, R0, 0*/


endFunc:        jr $ra  /*RET*/
        nop     # Branch Delay Slot
.end MyFunc


/*********************************************************************
 * This is your ISR implementation. It is called from the vector table jump.
 ********************************************************************/
Lab5_ISR:



/*********************************************************************
 * This is the actual interrupt handler that gets installed
 * in the interrupt vector table. It jumps to the Lab5
 * interrupt handler function.
 ********************************************************************/
.section .vector_4, code
	j Lab5_ISR
	nop


.data
milliseconds: .word 0