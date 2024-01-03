// Multiplies R0 and R1 and stores the result in R2.
// Assumes that R0 >= 0, R1 >= 0, and R0 * R1 < 32768.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

@sum
M = 0

@R2
M = 0

@R0
D = M

@i
M = D

(LOOP)
  @i 
  D = M
  
  @SET_RESULT
  D; JEQ // if D == 0 -> jump
  
  @R1
  D = M
  
  @sum
  M = M + D
  
  @i
  M = M - 1
  
  @LOOP
  0; JMP

(SET_RESULT)
  @sum
  D = M
  @R2
  M = D

  @END

(END)
  @END
  0; JMP