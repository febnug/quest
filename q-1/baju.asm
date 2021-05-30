;; Soal No. 3


; bikin program .EXE
;
; caranya :
;
; C:\> tasm BAJU
; C:\> tlink BAJU
;
; jalanin programnya :
;
; C:\> BAJU

.model small
.stack 100h
org 100h

.data

      input db 13, 10, 'Ukuran baju (S/M/L) ? $'
      input2 db 13, 10, 'Input lagi (Y/T) ? $'
      ukuran_besar db 13, 10, 'Ukuran baju besar $'
      ukuran_sedang db 13, 10, 'Ukuran baju sedang $'
      ukuran_kecil db 13, 10, 'Ukuran baju kecil $'

.code

mulai:

      mov     ax, @data
      mov     ds, ax

input_user:
      lea     dx, input
      mov     ah, 09h
      int     21h

      xor     ah, ah
      int     16h 
      mov     bx, ax
      mov     dl, al
      mov     ah, 2
      int     21h

kecil:
      cmp     bl, 53h
      je      cetak_string_kecil
      jne     sedang
      jmp     input_lagi

sedang:
      cmp     bl, 4Dh
      je      cetak_string_sedang
      jne     besar

besar:
      cmp     bl, 4Ch
      je      cetak_string_besar
      jmp     input_lagi

input_lagi:
      lea     dx, input2
      mov     ah, 09
      int     21h

      xor     ah, ah
      int     16h
      mov     bx, ax
      mov     dl, al
      mov     ah, 2
      int     21h

ya:
      cmp     bl, 59h
      je      input_user
      jne     tidak

tidak:
      cmp     bl, 54h
      je      selesai

cetak_string_kecil:
      lea     dx, ukuran_kecil
      jmp     cetak

cetak_string_sedang:
      lea     dx, ukuran_sedang
      jmp     cetak

cetak_string_besar:
      lea     dx, ukuran_besar
      jmp     cetak

cetak:
      mov     ah, 09h
      int     21h

      jmp     input_lagi

selesai:
      mov     ax, 4c00h
      int     21h

end   mulai
