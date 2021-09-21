; link tugas : https://t.me/belajarngodingbareng/80429
; assembling pake FASM di DOSBox
; fasm kali.asm

org 100h
    
    mov     di, 19
    xor     ax, ax 
    xor     bx, bx
.loop:  
    mul     bx     
    call    cetak_nilai
    pop     ax
    inc     ax   
    mov     bx, ax
    push    ax   

    dec     di 
    test    di, di
    je      exit_program
    jnz    .loop

cetak_nilai:  
    mov     bx, 10
    xor     cx, cx
_divisor:
    xor     dx, dx
    div     bx
    push    dx
    inc     cx
    test    ax, ax
    jnz     _divisor
_ascii:
    pop     dx
    add     dl, 30h
    mov     ah, 02h
    int     21h 
    loop    _ascii 
     
_spasi:    
    mov     ah, 0eh
    mov     al, 20h
    int     10h 
    
nol_kan_nilai:    
    xor     ax, ax
    ret   
 
exit_program:
    mov     ax, 4c00h
    int     21h       
