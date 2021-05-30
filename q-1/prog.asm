  MOV     CX, 004       ; simpan nilai 004 di register cx, untuk menghitung loop
  MOV     AX, 0200H     ; simpan nilai 0200h di register ax, nilai servis untuk mencetak karakter
  MOV     DX, 4141H     ; simpan nilai "4141" ("AA") di register dx
X:
  INT     21H           ; cetak karakter 
  INC     DL            ; nilai DL ditambah 1
                        ; DX = 4142
  PUSH    DX            ; nilai DX di simpan ke stack
  MOV     DL,DH         ; copy nilai DH ke register DL
                        ; DX = 4141
  INT     21H           ; cetak karakter
  POP     DX            ; ambil nilai DX di stack
                        ; DX=4142
  LOOP    X             ; lompat ke label "X"

  INT     20H           ; laksanakan !
