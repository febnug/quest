;; Soal No. 2
;;
;; Tested on DOSBox
;;
;; How to assembling and linking :
;; tasm sss.asm
;; tlink sss

.model small
.stack 200h
org 100h

.data

        msg     db "SAYA SUKA SATE"

.code

mulai:
        mov     ax, @data
        mov     ds, ax

        mov     ah, 0eh
        mov     cx, 11
        mov     si, offset msg
    .loop:
        lodsb
        cmp     al, "S"
        je      .cetak_dollar
        int     10h
        dec     cx
        jcxz    .exit
        jne     .loop
.cetak_dollar:
        mov     al, "$"
        int     10h
        jmp     .loop
    .exit:
        mov     ax, 4c00h
        int     21h

end     mulai
