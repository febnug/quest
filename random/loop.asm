; link tugas : https://t.me/belajarngodingbareng/78099
; assemblepake FASM di DOSBox
; fasm loop.asm

org 100h
    
    mov     di, 4
    inc     al
    add     al, 30h
    mov     ah, 0eh  
    jmp     _cetak
_loop:
    inc     al
_cetak:
    cmp     al, 3ah 
    je      _ten
    cmp     al, 32h
    je      _baris_baru 
    cmp     al, 34h
    je      _baris_baru
    cmp     al, 37h
    je      _baris_baru
_cetak_2:
    int     10h 
    push    ax 
_spasi:
    mov     ah, 0eh
    mov     al, " "
    int     10h  
    pop     ax
    push    ax
    jmp     _loop    
_ten:
    and     al, 0fh  
    xor     ah, ah
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
_loop_end:
    cmp     di, 1
    jz      _exit      
_baris_baru:
    mov     ah, 0eh
    mov     al, 13
    int     10h
    mov     al, 10
    int     10h 
_simpan_nilai: 
    pop     ax 
    push    ax 
    inc     al
    push    ax
_loop_itter:  
    dec     di  
    jmp     _cetak_2
_exit:
    mov     ax, 4c00h
    int     21h
