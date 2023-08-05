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

// pseudocode (infinite loop)
//if (keyIsPressed) 
// loop through each pixel in the screen and fill black
//else 
//loop through each pixel in the screen and fill white

(BEGIN)  	
	@8192 // each row (256 total) of the screen consists of 32 consecutive 16-bit words
	D=A     
	@i                   
	M=D // intialize var i to start at pixel 8192 (32 * 256)

(LOOP)      
	@i
	M=M-1 // i--
	D=M
	@BEGIN
	D;JLT // if (i < 0), then reset i back to 8192                 
	
    @KBD // load keyboard into memory     
	D=M
	
    @DRAWWHITE 	        
	D;JEQ // if (RAM[KBD] == 0), then do not fill (no key is being pressed)
	
    @DRAWBLACK // else, fill the screen (a key is being pressed)
	0;JMP 

(DRAWBLACK)             
	@SCREEN // predefined symbol for the first pixel in the screen memory map   
	D=A // load into memory 
	
    @i
	A=D+M              
	M=-1           
	
    @LOOP             
	0;JMP

(DRAWWHITE)
	@SCREEN // predefined symbol for the first pixel in the screen memory map             
	D=A // load into memory                
	
    @i        
	A=D+M              
	M=0                
	
    @LOOP           
	0;JMP
