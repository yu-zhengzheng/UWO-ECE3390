signal Mem:myArray:=( 
    -- START, 0x 
    "00011100",             -- i++                  INR E 
    "00001110", "00000000", -- c=0                  MVI C,0x 
    "01111011",             -- j=i                  MOV A,E 
    -- LOOP, 4x 
    "00111101",             -- j--                  DCR A 
    "11001010", "00001101", -- if Zf=1 goto next    JZ Dx 
    "11101101",             -- i%j                  DIV 
    "11000010", "00000100", -- if Zf=0 goto loop    JNZ 4x 
    "00001100",             -- c++                  INR C 
    "11000011", "00000100", -- goto loop            JMP 4x 
    -- NEXT, Dx 
    "00001101",             -- c--                  DCR C 
    "11000010", "00000000", -- if Zf=0 goto start   JNZ 0x 
    "01000011",             -- print                MOV B,E 
    "11000011", "00000000"  -- goto start           JMP 0x 
); 