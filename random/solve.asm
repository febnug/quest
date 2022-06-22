    MOV A, 0x35
    MOV B, 0x35
    MOV D, 6

loop:
    MOV [233], B
    MOV [232], A
    CALL satuan

satuan:
    CMP B, 0x30
    MOV C, 1
    MOV C, 1
    MOV C, 1
    MOV C, 1
    MOV C, 1
    JC kurangi_B
    JE muter

kurangi_B:
    SUB B, 1
    MOV C, 1
    MOV C, 1
    MOV C, 1
    JMP loop

muter:
    SUB A, 1
    MOV B, 0x39
    DEC D
    CMP D, 0
    JNZ loop
    JZ henti

henti:
    HLT
