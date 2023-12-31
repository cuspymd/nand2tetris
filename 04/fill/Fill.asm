// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.
(LOOP)
    @KBD
    D=M
    @BLACK
    D;JNE
(WHITE)
    @color
    M=0
    @DRAW
    0;JMP
(BLACK)
    @color
    M=-1
(DRAW)    
    @i
    M=0
(LOOP2)    
    @SCREEN
    D=A
    @i
    D=D+M
    @sdest
    M=D
    @color
    D=M
    @sdest
    A=M
    M=D
    @i
    M=M+1
    D=M
    @8192
    D=D-A
    @LOOP2
    D;JLT
    @LOOP
    0;JMP
(END)
    @END
    0;JMP