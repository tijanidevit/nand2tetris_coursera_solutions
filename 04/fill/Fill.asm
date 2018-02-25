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
	@clear
	M=0
	@fill
	M=-1
	@8191
	D=A
	@bayts
	M=D
(START)
	@KBD
	D=M
	@BLACKSCREEN
	D;JGT
	@clear
	
	D=M
	@color
	M=D
	@PAINT
	0;JMP
(BLACKSCREEN)
	@fill
	D=M
	@color
	M=D
(PAINT)
	@i
	M=0
(LOOPI)
	@i
	D=M
	@bayts
	D=M-D
	@END
	D;JLT
	@R0
	M=0
	@R0
	M=M+D
	@SCREEN
	D=A
	@R0
	M=M+D
	@color
	D=M
	@R0
	A=M
	M=D
	@i
	M=M+1
	@LOOPI
	0;JMP
(END)
	@START
	0;JMP
	
	