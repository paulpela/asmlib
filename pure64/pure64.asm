; This uses code from http://github.com/ReturnInfinity/Pure64
; See LICENSE.txt
;
; Memory locations
E820Map:                                        equ 0x0000000000004000
InfoMap:                                        equ 0x0000000000005000
SystemVariables:                                equ 0x0000000000005A00
VBEModeInfoBlock:                               equ 0x0000000000005C00  ; 256 bytes
ahci_cmdlist:                                   equ 0x0000000000070000  ; 4096 bytes    0x070000 -> 0x071FFF
ahci_cmdtable:                                  equ 0x0000000000072000  ; 57344 bytes   0x072000 -> 0x07FFFF

; DQ - Starting at offset 0, increments by 0x8
os_ACPITableAddress:                            equ SystemVariables + 0x00
screen_cursor_offset:                           equ SystemVariables + 0x08
os_LocalX2APICAddress:                          equ SystemVariables + 0x10
os_Counter_Timer:                               equ SystemVariables + 0x18
os_Counter_RTC:                                 equ SystemVariables + 0x20
os_LocalAPICAddress:                            equ SystemVariables + 0x28
os_IOAPICAddress:                               equ SystemVariables + 0x30
os_HPETAddress:                                 equ SystemVariables + 0x38

; DD - Starting at offset 128, increments by 4
os_BSP:                                         equ SystemVariables + 128
mem_amount:                                     equ SystemVariables + 132
os_VideoBase:                                   equ SystemVariables + 136

; DW - Starting at offset 256, increments by 2
cpu_speed:      equ SystemVariables + 256
cpu_activated:      equ SystemVariables + 258
cpu_detected:       equ SystemVariables + 260

; DB - Starting at offset 384, increments by 1
screen_cursor_x:    equ SystemVariables + 386
screen_cursor_y:    equ SystemVariables + 387
memtempstring:      equ SystemVariables + 390
speedtempstring:    equ SystemVariables + 400
cpu_amount_string:  equ SystemVariables + 410
os_key:         equ SystemVariables + 421
os_IOAPICCount:     equ SystemVariables + 424

; VESA
; Mandatory information for all VBE revisions
VBEModeInfoBlock.ModeAttributes     equ VBEModeInfoBlock + 0    ; DW - mode attributes
VBEModeInfoBlock.WinAAttributes     equ VBEModeInfoBlock + 2    ; DB - window A attributes
VBEModeInfoBlock.WinBAttributes     equ VBEModeInfoBlock + 3    ; DB - window B attributes
VBEModeInfoBlock.WinGranularity     equ VBEModeInfoBlock + 4    ; DW - window granularity in KB
VBEModeInfoBlock.WinSize        equ VBEModeInfoBlock + 6    ; DW - window size in KB
VBEModeInfoBlock.WinASegment        equ VBEModeInfoBlock + 8    ; DW - window A start segment
VBEModeInfoBlock.WinBSegment        equ VBEModeInfoBlock + 10   ; DW - window B start segment
VBEModeInfoBlock.WinFuncPtr     equ VBEModeInfoBlock + 12   ; DD - real mode pointer to window function
VBEModeInfoBlock.BytesPerScanLine   equ VBEModeInfoBlock + 16   ; DW - bytes per scan line
; Mandatory information for VBE 1.2 and above
VBEModeInfoBlock.XResolution        equ VBEModeInfoBlock + 18   ; DW - horizontal resolution in pixels or characters
VBEModeInfoBlock.YResolution        equ VBEModeInfoBlock + 20   ; DW - vertical resolution in pixels or characters
VBEModeInfoBlock.XCharSize      equ VBEModeInfoBlock + 22   ; DB - character cell width in pixels
VBEModeInfoBlock.YCharSize      equ VBEModeInfoBlock + 23   ; DB - character cell height in pixels
VBEModeInfoBlock.NumberOfPlanes     equ VBEModeInfoBlock + 24   ; DB - number of memory planes
VBEModeInfoBlock.BitsPerPixel       equ VBEModeInfoBlock + 25   ; DB - bits per pixel
VBEModeInfoBlock.NumberOfBanks      equ VBEModeInfoBlock + 26   ; DB - number of banks
VBEModeInfoBlock.MemoryModel        equ VBEModeInfoBlock + 27   ; DB - memory model type
VBEModeInfoBlock.BankSize       equ VBEModeInfoBlock + 28   ; DB - bank size in KB
VBEModeInfoBlock.NumberOfImagePages equ VBEModeInfoBlock + 29   ; DB - number of image pages
VBEModeInfoBlock.Reserved       equ VBEModeInfoBlock + 30   ; DB - reserved (0x00 for VBE 1.0-2.0, 0x01 for VBE 3.0)
; Direct Color fields (required for direct/6 and YUV/7 memory models)
VBEModeInfoBlock.RedMaskSize        equ VBEModeInfoBlock + 31   ; DB - size of direct color red mask in bits
VBEModeInfoBlock.RedFieldPosition   equ VBEModeInfoBlock + 32   ; DB - bit position of lsb of red mask
VBEModeInfoBlock.GreenMaskSize      equ VBEModeInfoBlock + 33   ; DB - size of direct color green mask in bits
VBEModeInfoBlock.GreenFieldPosition equ VBEModeInfoBlock + 34   ; DB - bit position of lsb of green mask
VBEModeInfoBlock.BlueMaskSize       equ VBEModeInfoBlock + 35   ; DB - size of direct color blue mask in bits
VBEModeInfoBlock.BlueFieldPosition  equ VBEModeInfoBlock + 36   ; DB - bit position of lsb of blue mask
VBEModeInfoBlock.RsvdMaskSize       equ VBEModeInfoBlock + 37   ; DB - size of direct color reserved mask in bits
VBEModeInfoBlock.RsvdFieldPosition  equ VBEModeInfoBlock + 38   ; DB - bit position of lsb of reserved mask
VBEModeInfoBlock.DirectColorModeInfo    equ VBEModeInfoBlock + 39   ; DB - direct color mode attributes
; Mandatory information for VBE 2.0 and above
VBEModeInfoBlock.PhysBasePtr        equ VBEModeInfoBlock + 40   ; DD - physical address for flat memory frame buffer
VBEModeInfoBlock.Reserved1      equ VBEModeInfoBlock + 44   ; DD - Reserved - always set to 0
VBEModeInfoBlock.Reserved2      equ VBEModeInfoBlock + 48   ; DD - Reserved - always set to 0

