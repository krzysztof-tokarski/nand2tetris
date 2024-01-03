// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen
// by writing 'black' in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen by writing
// 'white' in every pixel;
// the screen should remain fully clear as long as no key is pressed.

//could be refactored to reduce the code duplication

@KBD
D = A

// temporarily save KBD address here
@pixelsOnScreenAmount
M = D

@SCREEN 
D = A

// difference between KBD and SCREEN addresses gives us amount of pixels on screen as KBD register is located right after SCREEN memory part
@pixelsOnScreenAmount
M = M - D

(LOOP)
  @KBD
  D = M

  @LIGHT_ON
    D; JNE

  @LIGHT_OFF
    D; JEQ


(LIGHT_ON)
  @i
  M = 0

  @pixelsOnScreenAmount
  D = M

  (LIGHT_ON_LOOP)
    @i
    D = M

    @SCREEN
    D = A + D
    
    A = D
    M = -1

    @i
    M = M + 1

    @KBD
    D = A - D

    @LIGHT_ON_LOOP
    D = D - 1 // check if next iteration would overwrite KBD
    D; JNE

    @LOOP
      0; JMP



(LIGHT_OFF)
  @i
  M = 0

  @pixelsOnScreenAmount
  D = M

  (LIGHT_OFF_LOOP)
    @i
    D = M

    @SCREEN
    D = A + D
    
    A = D
    M = 0

    @i
    M = M + 1

    @KBD
    D = A - D

    @LIGHT_OFF_LOOP
    D = D - 1 // check if next iteration would overwrite KBD
    D; JNE

    @LOOP
      0; JMP
