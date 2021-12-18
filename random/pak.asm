; solver for this question : https://t.me/belajarngodingbareng/155774

org 100h
 
        mov     cx, 3
        jmp     i
    a:
        mov     cx, 3
        mov     ah, 0eh
        mov     al, 13
        int     10h
        mov     al, 10
        int     10h
    i:  
        jcxz    press_any_key    
        mov     ah, 01h
        int     21h
        mov     ah, 0eh
        mov     al, 13
        int     10h
        mov     al, 10
        int     10h        
        loop    i
press_any_key:
        mov     ah, 09h
        mov     dx, press_any_key_string
        int     21h
        xor     ax, ax    
        int     16h
        cmp     al, "n" ; tekan tombol "n" exit program
        je      we_exit_program_now
        cmp     al, "y" ; tekan tombol "y" lanjut input
        je      a
we_exit_program_now:
        mov     ax, 4c00h
        int     21h   

press_any_key_string db "Press any key to continue...$"
