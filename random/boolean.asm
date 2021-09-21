; link tugas : https://t.me/belajarngodingbareng/80683
; assembling pake FASM di DOSBox
; fasm boolean.asm

org 100h

        mov     ah, 09h
        mov     dx, pesan1
        int     21h
        
        mov     ah, 0ah
        mov     dx, buffer   
        int     21h    
        
        mov     ah, 09h
        mov     dx, pesan2
        int     21h
        
        mov     bx, buffer+2 
        
    _loop:
        cmp     byte [bx], 0dh     
        je      _exit                       
        
        mov     dx, [bx]
        cmp     dx, "hi"
        je      _true
        jne     _false

    _true: 
        mov     ah, 09h
        mov     dx, true
        int     21h
        ret
    
    _false:
        mov     ah, 09h
        mov     dx, false
        int     21h
        ret
        
    _exit:
        mov     ax, 4c00h
        int     21h


pesan1   db "input  : $"
pesan2   db 13, 10, "output : $"  
buffer   db 50, ?, 50 dup(?) 
        
true     db "true $"
false    db "false $"
