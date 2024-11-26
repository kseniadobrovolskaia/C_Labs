                             //
                             // ram 
                             // ram:00010000-ram:00017fff
                             //
        00010000 97 02 00 00     auipc      t0,0x0
        00010004 93 82 82 10     addi       t0,t0,0x108
        00010008 73 90 52 30     csrrw      zero,mtvec,t0
        0001000c 21 49           c.li       s2,0x8
        0001000e 73 10 49 30     csrrw      zero,mie,s2
        00010012 81 44           c.li       s1,0x0
        00010014 73 29 40 f1     csrrs      s2,mhartid,zero
        00010018 63 98 24 09     bne        s1,s2,LAB_000100a8
        0001001c b7 02 08 03     lui        t0,0x3080
        00010020 05 43           c.li       t1,0x1
        00010022 23 a0 62 00     sw         t1,0x0(t0=>DAT_03080000)
        00010026 37 03 1e 00     lui        t1,0x1e0
        0001002a 23 b4 62 00     sd         t1,0x8(t0=>DAT_03080008)
        0001002e 37 03 00 08     lui        t1,0x8000
        00010032 23 b8 62 00     sd         t1,0x10(t0=>DAT_03080010)
        00010036 37 03 00 09     lui        t1,0x9000
        0001003a 23 bc 62 00     sd         t1,0x18(t0=>DAT_03080018)
        0001003e 1b 03 f0 0f     addiw      t1,zero,0xff
        00010042 13 13 83 01     slli       t1,t1,0x18
        00010046 23 a2 62 00     sw         t1,0x4(t0=>DAT_03080004)
        0001004a 0d 43           c.li       t1,0x3
        0001004c 23 a0 62 00     sw         t1,0x0(t0=>DAT_03080000)
                             LAB_00010050                                    XREF[1]:     00010058(j)  
        00010050 03 a3 02 00     lw         t1,0x0(t0=>DAT_03080000)
        00010054 13 73 23 00     andi       t1,t1,0x2
        00010058 e3 1c 03 fe     bne        t1,zero,LAB_00010050
        0001005c 23 a0 02 00     sw         zero,0x0(t0=>DAT_03080000)
        00010060 97 32 00 00     auipc      t0,0x3
        00010064 93 82 02 76     addi       t0,t0,0x760
        00010068 17 03 0f 08     auipc      t1,0x80f0
        0001006c 13 03 83 f9     addi       t1,t1,-0x68
        00010070 63 80 62 02     beq        t0,t1,LAB_00010090
        00010074 97 33 00 00     auipc      t2,0x3
        00010078 93 83 43 71     addi       t2,t2,0x714
        0001007c 63 7a 73 00     bgeu       t1,t2,LAB_00010090
                             LAB_00010080                                    XREF[1]:     0001008c(j)  
        00010080 03 be 02 00     ld         t3,0x0(t0=>DAT_000137c0)
        00010084 23 30 c3 01     sd         t3,0x0(t1=>DAT_08100000)
        00010088 a1 02           c.addi     t0,0x8
        0001008a 21 03           c.addi     t1,0x8
        0001008c e3 6a 73 fe     bltu       t1,t2,LAB_00010080
                             LAB_00010090                                    XREF[2]:     00010070(j), 0001007c(j)  
        00010090 b7 04 00 02     lui        s1,0x2000
                             LAB_00010094                                    XREF[1]:     000100a4(j)  
        00010094 05 49           c.li       s2,0x1
        00010096 23 a0 24 01     sw         s2,0x0(s1=>DAT_02000000)
        0001009a 91 04           c.addi     s1,0x4
        0001009c 37 09 00 02     lui        s2,0x2000
        000100a0 1b 09 09 08     addiw      s2,s2,0x80
        000100a4 e3 c8 24 ff     blt        s1,s2,LAB_00010094
                             LAB_000100a8                                    XREF[2]:     00010018(j), 000100b4(j)  
        000100a8 73 00 50 10     wfi
        000100ac 73 29 40 34     csrrs      s2,mip,zero
        000100b0 13 79 89 00     andi       s2,s2,0x8
        000100b4 e3 0a 09 fe     beq        s2,zero,LAB_000100a8
        000100b8 b7 04 00 02     lui        s1,0x2000
        000100bc 73 29 40 f1     csrrs      s2,mhartid,zero
        000100c0 0a 09           c.slli     s2,0x2
        000100c2 26 99           c.add      s2,s1
        000100c4 23 20 09 00     sw         zero,0x0(s2=>DAT_02000000)
                             LAB_000100c8                                    XREF[2]:     000100cc(j), 000100da(j)  
        000100c8 03 a9 04 00     lw         s2,0x0(s1=>DAT_02000000)
        000100cc e3 1e 09 fe     bne        s2,zero,LAB_000100c8
        000100d0 91 04           c.addi     s1,0x4
        000100d2 37 09 00 02     lui        s2,0x2000
        000100d6 1b 09 09 08     addiw      s2,s2,0x80
        000100da e3 c7 24 ff     blt        s1,s2,LAB_000100c8
        000100de f3 22 40 f1     csrrs      t0,mhartid,zero
        000100e2 b2 02           c.slli     t0,0xc
        000100e4 17 01 1d 08     auipc      sp,0x81d0
        000100e8 13 01 c1 f1     addi       sp,sp,-0xe4
        000100ec 33 01 51 40     sub        sp,sp,t0
        000100f0 ef 00 60 08     jal        ra,FUN_00010176                                  undefined FUN_00010176()
        000100f4 b7 02 00 08     lui        t0,0x8000
        000100f8 73 25 40 f1     csrrs      a0,mhartid,zero
        000100fc 97 15 00 00     auipc      a1,0x1
        00010100 93 85 45 d8     addi       a1,a1,-0x27c
        00010104 82 82           c.jr       t0=>LAB_08000000
        00010106 01 00           c.nop
        00010108 ef 00 80 03     jal        ra,FUN_00010140                                  undefined FUN_00010140()
                             **************************************************************
                             *                          FUNCTION                          *
                             **************************************************************
                             undefined FUN_00010140()
             undefined         a0:1           <RETURN>
                             FUN_00010140                                    XREF[1]:     00010108(c)  
        00010140 73 25 20 34     csrrs      a0,mcause,zero
        00010144 85 45           c.li       a1,0x1
        00010146 6f 00 00 54     j          FUN_00010686                                     undefined FUN_00010686()
                             -- Flow Override: CALL_RETURN (CALL_TERMINATOR)
                             **************************************************************
                             *                          FUNCTION                          *
                             **************************************************************
                             undefined FUN_00010176()
             undefined         a0:1           <RETURN>
                             FUN_00010176                                    XREF[1]:     000100f0(c)  
        00010176 41 11           c.addi     sp,-0x10
        00010178 06 e4           c.sdsp     ra,0x8(sp)
        0001017a f3 27 40 f1     csrrs      a5,mhartid,zero
        0001017e 8d e3           c.bnez     a5,LAB_000101a0
        00010180 b7 07 01 10     lui        a5,0x10010
        00010184 13 07 10 0e     li         a4,0xe1
        00010188 19 66           c.lui      a2,0x6
        0001018a 98 cf           c.sw       a4,0x18(a5=>DAT_10010018)
        0001018c 13 06 06 59     addi       a2,a2,0x590
        00010190 97 35 00 00     auipc      a1,0x3
        00010194 93 85 85 5d     addi       a1=>DAT_00013768,a1,0x5d8
        00010198 37 05 00 08     lui        a0,0x8000
        0001019c ef 00 80 56     jal        ra,FUN_00010704                                  undefined FUN_00010704()
                             LAB_000101a0                                    XREF[1]:     0001017e(j)  
        000101a0 17 06 0f 08     auipc      a2,0x80f0
        000101a4 13 06 06 e6     addi       a2,a2,-0x1a0
        000101a8 0f 00 f0 0f     fence      0xf,0xf
        000101ac 1c 4a           c.lw       a5,0x10(a2=>DAT_08100010)
        000101ae 05 45           c.li       a0,0x1
        000101b0 0f 00 f0 0f     fence      0xf,0xf
        000101b4 81 27           c.addiw    a5,0x0
        000101b6 13 97 27 00     slli       a4,a5,0x2
        000101ba b3 06 e6 00     add        a3,a2,a4
        000101be 0f 00 50 0f     fence      0xf,0x5
        000101c2 af a5 a6 04     amoadd.w   a1,a0,(a3)
        000101c6 21 07           c.addi     a4,0x8
        000101c8 81 25           c.addiw    a1,0x0
        000101ca 11 48           c.li       a6,0x4
        000101cc 32 97           c.add      a4,a2
        000101ce 63 8b 05 03     beq        a1,a6,LAB_00010204
                             LAB_000101d2                                    XREF[1]:     000101de(j)  
        000101d2 0f 00 f0 0f     fence      0xf,0xf
        000101d6 1c 43           c.lw       a5,0x0(a4)
        000101d8 0f 00 f0 0f     fence      0xf,0xf
        000101dc 81 27           c.addiw    a5,0x0
        000101de f5 db           c.beqz     a5,LAB_000101d2
        000101e0 7d 56           c.li       a2,-0x1
        000101e2 0f 00 50 0f     fence      0xf,0x5
        000101e6 af a7 c6 04     amoadd.w   a5,a2,(a3)
        000101ea 81 27           c.addiw    a5,0x0
        000101ec 85 46           c.li       a3,0x1
        000101ee 63 86 d7 00     beq        a5,a3,LAB_000101fa
                             LAB_000101f2                                    XREF[2]:     00010202(j), 00010224(j)  
        000101f2 a2 60           c.ldsp     ra,0x8(sp)
        000101f4 01 45           c.li       a0,0x0
        000101f6 41 01           c.addi     sp,0x10
        000101f8 82 80           ret
                             LAB_000101fa                                    XREF[1]:     000101ee(j)  
        000101fa 0f 00 50 0f     fence      0xf,0x5
        000101fe 2f 20 07 0c     amoswap.   zero,zero,(a4)
        00010202 c5 bf           c.j        LAB_000101f2
                             LAB_00010204                                    XREF[1]:     000101ce(j)  
        00010204 bb 07 f5 40     subw       a5,a0,a5
        00010208 41 06           c.addi     a2,0x10
        0001020a 0f 00 50 0f     fence      0xf,0x5
        0001020e 2f 20 f6 0c     amoswap.   zero,a5,(a2=>DAT_08100010)
        00010212 fd 57           c.li       a5,-0x1
        00010214 0f 00 50 0f     fence      0xf,0x5
        00010218 2f a0 f6 04     amoadd.w   zero,a5,(a3)
        0001021c 0f 00 50 0f     fence      0xf,0x5
        00010220 2f 20 a7 0c     amoswap.   zero,a0,(a4)
        00010224 f9 b7           c.j        LAB_000101f2
                             **************************************************************
                             *                          FUNCTION                          *
                             **************************************************************
                             undefined FUN_00010258()
             undefined         a0:1           <RETURN>
                             FUN_00010258                                    XREF[31]:    00010264(j), 
                                                                                          FUN_00010704:000107e2(c), 
                                                                                          FUN_00010704:000107ec(c), 
                                                                                          FUN_00010aba:00010adc(c), 
                                                                                          FUN_00010aba:00010ae4(c), 
                                                                                          FUN_00010aba:00010af2(c), 
                                                                                          FUN_00010aba:00010b00(c), 
                                                                                          FUN_00010aba:00010b0e(c), 
                                                                                          FUN_00010aba:00010b18(c), 
                                                                                          FUN_00010aba:00010b20(c), 
                                                                                          FUN_00010aba:00010b32(c), 
                                                                                          FUN_00010b54:00010be2(c), 
                                                                                          FUN_00010b54:00010c06(c), 
                                                                                          FUN_00010b54:00010c32(c), 
                                                                                          FUN_00010b54:00010c3c(c), 
                                                                                          FUN_00010b54:00010c46(c), 
                                                                                          FUN_00010b54:00010c52(c), 
                                                                                          FUN_00010b54:00010c7c(c), 
                                                                                          FUN_00010b54:00010ca4(c), 
                                                                                          FUN_00010b54:00010cca(c), [more]
        00010258 93 07 85 04     addi       a5,a0,0x48
        0001025c af a7 b7 40     amoor.w    a5,a1,(a5)
        00010260 13 97 07 02     slli       a4,a5,0x20
        00010264 e3 4a 07 fe     blt        a4,zero,FUN_00010258
                             LAB_00010268                                    XREF[1]:     0001026c(j)  
        00010268 7c 45           c.lw       a5,0x4c(a0)
        0001026a 81 27           c.addiw    a5,0x0
        0001026c e3 ce 07 fe     blt        a5,zero,LAB_00010268
        00010270 13 f5 f7 0f     andi       a0,a5,0xff
        00010274 82 80           ret
                             **************************************************************
                             *                          FUNCTION                          *
                             **************************************************************
                             undefined FUN_00010276()
             undefined         a0:1           <RETURN>
                             FUN_00010276                                    XREF[3]:     FUN_000103ec:00010424(c), 
                                                                                          FUN_000103ec:0001045a(c), 
                                                                                          FUN_000103ec:0001048e(c)  
        00010276 18 4d           c.lw       a4,0x18(a0)
        00010278 aa 87           c.mv       a5,a0
        0001027a 71 9b           c.andi     a4,-0x4
        0001027c 13 67 27 00     ori        a4,a4,0x2
        00010280 18 cd           c.sw       a4,0x18(a0)
        00010282 0d 47           c.li       a4,0x3
                             LAB_00010284                                    XREF[1]:     00010290(j)  
        00010284 13 85 87 04     addi       a0,a5,0x48
        00010288 2f 25 e5 40     amoor.w    a0,a4,(a0)
        0001028c 13 18 05 02     slli       a6,a0,0x20
        00010290 e3 4a 08 fe     blt        a6,zero,LAB_00010284
                             LAB_00010294                                    XREF[1]:     00010296(j)  
        00010294 f8 47           c.lw       a4,0x4c(a5)
        00010296 e3 4f 07 fe     blt        a4,zero,LAB_00010294
        0001029a 1b 57 06 01     srliw      a4,a2,0x10
        0001029e 13 77 f7 0f     andi       a4,a4,0xff
                             LAB_000102a2                                    XREF[1]:     000102ae(j)  
        000102a2 13 85 87 04     addi       a0,a5,0x48
        000102a6 2f 25 e5 40     amoor.w    a0,a4,(a0)
        000102aa 13 18 05 02     slli       a6,a0,0x20
        000102ae e3 4a 08 fe     blt        a6,zero,LAB_000102a2
                             LAB_000102b2                                    XREF[1]:     000102b4(j)  
        000102b2 f8 47           c.lw       a4,0x4c(a5)
        000102b4 e3 4f 07 fe     blt        a4,zero,LAB_000102b2
        000102b8 1b 57 86 00     srliw      a4,a2,0x8
        000102bc 13 77 f7 0f     andi       a4,a4,0xff
                             LAB_000102c0                                    XREF[1]:     000102cc(j)  
        000102c0 13 85 87 04     addi       a0,a5,0x48
        000102c4 2f 25 e5 40     amoor.w    a0,a4,(a0)
        000102c8 13 18 05 02     slli       a6,a0,0x20
        000102cc e3 4a 08 fe     blt        a6,zero,LAB_000102c0
                             LAB_000102d0                                    XREF[1]:     000102d2(j)  
        000102d0 f8 47           c.lw       a4,0x4c(a5)
        000102d2 e3 4f 07 fe     blt        a4,zero,LAB_000102d0
        000102d6 13 76 f6 0f     andi       a2,a2,0xff
                             LAB_000102da                                    XREF[1]:     000102e6(j)  
        000102da 13 87 87 04     addi       a4,a5,0x48
        000102de 2f 27 c7 40     amoor.w    a4,a2,(a4)
        000102e2 13 15 07 02     slli       a0,a4,0x20
        000102e6 e3 4a 05 fe     blt        a0,zero,LAB_000102da
                             LAB_000102ea                                    XREF[1]:     000102ec(j)  
        000102ea f8 47           c.lw       a4,0x4c(a5)
        000102ec e3 4f 07 fe     blt        a4,zero,LAB_000102ea
        000102f0 8d ca           c.beqz     a3,LAB_00010322
        000102f2 1b 86 f6 ff     addiw      a2,a3,-0x1
        000102f6 02 16           c.slli     a2,0x20
        000102f8 01 92           c.srli     a2,0x20
        000102fa 05 06           c.addi     a2,0x1
        000102fc 2e 96           c.add      a2,a1
        000102fe 81 46           c.li       a3,0x0
                             LAB_00010300                                    XREF[2]:     0001030c(j), 0001031e(j)  
        00010300 13 87 87 04     addi       a4,a5,0x48
        00010304 2f 27 d7 40     amoor.w    a4,a3,(a4)
        00010308 13 15 07 02     slli       a0,a4,0x20
        0001030c e3 4a 05 fe     blt        a0,zero,LAB_00010300
                             LAB_00010310                                    XREF[1]:     00010314(j)  
        00010310 f8 47           c.lw       a4,0x4c(a5)
        00010312 01 27           c.addiw    a4,0x0
        00010314 e3 4e 07 fe     blt        a4,zero,LAB_00010310
        00010318 23 80 e5 00     sb         a4,0x0(a1)
        0001031c 85 05           c.addi     a1,0x1
        0001031e e3 11 b6 fe     bne        a2,a1,LAB_00010300
                             LAB_00010322                                    XREF[1]:     000102f0(j)  
        00010322 98 4f           c.lw       a4,0x18(a5)
        00010324 01 45           c.li       a0,0x0
        00010326 71 9b           c.andi     a4,-0x4
        00010328 98 cf           c.sw       a4,0x18(a5)
        0001032a 82 80           ret
                             **************************************************************
                             *                          FUNCTION                          *
                             **************************************************************
                             undefined FUN_00010348()
             undefined         a0:1           <RETURN>
                             FUN_00010348                                    XREF[1]:     FUN_00010686:000106bc(c)  
        00010348 83 c7 05 00     lbu        a5,0x0(a1)
        0001034c 99 cb           c.beqz     a5,LAB_00010362
                             LAB_0001034e                                    XREF[1]:     00010360(j)  
        0001034e 85 05           c.addi     a1,0x1
                             LAB_00010350                                    XREF[1]:     00010358(j)  
        00010350 2f 27 f5 40     amoor.w    a4,a5,(a0)
        00010354 93 16 07 02     slli       a3,a4,0x20
        00010358 e3 cc 06 fe     blt        a3,zero,LAB_00010350
        0001035c 83 c7 05 00     lbu        a5,0x0(a1)
        00010360 fd f7           c.bnez     a5,LAB_0001034e
                             LAB_00010362                                    XREF[1]:     0001034c(j)  
        00010362 82 80           ret
                             **************************************************************
                             *                          FUNCTION                          *
                             **************************************************************
                             undefined FUN_00010364()
             undefined         a0:1           <RETURN>
                             FUN_00010364                                    XREF[2]:     FUN_00010686:000106c8(c), 
                                                                                          FUN_00010686:000106d4(c)  
        00010364 f1 46           c.li       a3,0x1c
        00010366 25 48           c.li       a6,0x9
        00010368 71 56           c.li       a2,-0x4
                             LAB_0001036a                                    XREF[1]:     0001038a(j)  
        0001036a 3b d7 d5 00     srlw       a4,a1,a3
        0001036e 3d 8b           c.andi     a4,0xf
        00010370 93 07 77 05     addi       a5,a4,0x57
        00010374 63 64 e8 00     bltu       a6,a4,LAB_0001037c
        00010378 93 07 07 03     addi       a5,a4,0x30
                             LAB_0001037c                                    XREF[2]:     00010374(j), 00010384(j)  
        0001037c 2f 27 f5 40     amoor.w    a4,a5,(a0)
        00010380 93 18 07 02     slli       a7,a4,0x20
        00010384 e3 cc 08 fe     blt        a7,zero,LAB_0001037c
        00010388 f1 36           c.addiw    a3,-0x4
        0001038a e3 90 c6 fe     bne        a3,a2,LAB_0001036a
        0001038e 82 80           ret
                             **************************************************************
                             *                          FUNCTION                          *
                             **************************************************************
                             undefined FUN_000103ec()
             undefined         a0:1           <RETURN>
                             FUN_000103ec                                    XREF[1]:     FUN_00010704:00010940(c)  
        000103ec 13 01 01 da     addi       sp,sp,-0x260
        000103f0 23 34 51 23     sd         s5,0x228(sp)
        000103f4 23 30 61 23     sd         s6,0x220(sp)
        000103f8 b2 8a           c.mv       s5,a2
        000103fa 2e 8b           c.mv       s6,a1
        000103fc 93 06 c0 05     li         a3,0x5c
        00010400 13 06 00 20     li         a2,0x200
        00010404 0c 08           c.addi4spn a1,sp,0x10
        00010406 23 3c 31 23     sd         s3,0x238(sp)
        0001040a 23 3c 11 24     sd         ra,0x258(sp)
        0001040e 23 38 81 24     sd         s0,0x250(sp)
        00010412 23 34 91 24     sd         s1,0x248(sp)
        00010416 23 30 21 25     sd         s2,0x240(sp)
        0001041a 23 38 41 23     sd         s4,0x230(sp)
        0001041e 23 3c 71 21     sd         s7,0x218(sp)
        00010422 aa 89           c.mv       s3,a0
        00010424 ef f0 3f e5     jal        ra,FUN_00010276                                  undefined FUN_00010276()
        00010428 35 e5           c.bnez     a0,LAB_00010494
        0001042a 16 5a           c.lwsp     s4,0x64(sp)
        0001042c 06 59           c.lwsp     s2,0x60(sp)
        0001042e 66 64           c.ldsp     s0,0x58(sp)
        00010430 3b 09 49 03     mulw       s2,s2,s4
        00010434 1b 09 f9 1f     addiw      s2,s2,0x1ff
        00010438 1b 59 99 00     srliw      s2,s2,0x9
        0001043c 02 19           c.slli     s2,0x20
        0001043e 13 59 09 02     srli       s2,s2,0x20
        00010442 22 99           c.add      s2,s0
        00010444 63 7a 24 03     bgeu       s0,s2,LAB_00010478
        00010448 9b 14 94 00     slliw      s1,s0,0x9
        0001044c 93 0b 00 20     li         s7,0x200
                             LAB_00010450                                    XREF[1]:     00010474(j)  
        00010450 26 86           c.mv       a2,s1
        00010452 0c 08           c.addi4spn a1,sp,0x10
        00010454 93 06 00 20     li         a3,0x200
        00010458 4e 85           c.mv       a0,s3
        0001045a ef f0 df e1     jal        ra,FUN_00010276                                  undefined FUN_00010276()
        0001045e 3b d6 4b 03     divuw      a2,s7,s4
        00010462 d6 85           c.mv       a1,s5
        00010464 08 08           c.addi4spn a0,sp,0x10
        00010466 05 04           c.addi     s0,0x1
        00010468 9b 84 04 20     addiw      s1,s1,0x200
        0001046c ef 00 40 51     jal        ra,FUN_00010980                                  undefined FUN_00010980()
        00010470 11 c1           c.beqz     a0,LAB_00010474
        00010472 89 e5           c.bnez     a1,LAB_0001047c
                             LAB_00010474                                    XREF[1]:     00010470(j)  
        00010474 e3 6e 24 fd     bltu       s0,s2,LAB_00010450
                             LAB_00010478                                    XREF[1]:     00010444(j)  
        00010478 0d 45           c.li       a0,0x3
        0001047a 31 a8           c.j        LAB_00010496
                             LAB_0001047c                                    XREF[1]:     00010472(j)  
        0001047c 93 86 15 00     addi       a3,a1,0x1
        00010480 89 8e           c.sub      a3,a0
        00010482 1b 16 95 00     slliw      a2,a0,0x9
        00010486 9b 96 96 00     slliw      a3,a3,0x9
        0001048a da 85           c.mv       a1,s6
        0001048c 4e 85           c.mv       a0,s3
        0001048e ef f0 9f de     jal        ra,FUN_00010276                                  undefined FUN_00010276()
        00010492 11 c1           c.beqz     a0,LAB_00010496
                             LAB_00010494                                    XREF[1]:     00010428(j)  
        00010494 11 45           c.li       a0,0x4
                             LAB_00010496                                    XREF[2]:     0001047a(j), 00010492(j)  
        00010496 83 30 81 25     ld         ra,0x258(sp)
        0001049a 03 34 01 25     ld         s0,0x250(sp)
        0001049e 83 34 81 24     ld         s1,0x248(sp)
        000104a2 03 39 01 24     ld         s2,0x240(sp)
        000104a6 83 39 81 23     ld         s3,0x238(sp)
        000104aa 03 3a 01 23     ld         s4,0x230(sp)
        000104ae 83 3a 81 22     ld         s5,0x228(sp)
        000104b2 03 3b 01 22     ld         s6,0x220(sp)
        000104b6 83 3b 81 21     ld         s7,0x218(sp)
        000104ba 13 01 01 26     addi       sp,sp,0x260
        000104be 82 80           ret
                             **************************************************************
                             *                          FUNCTION                          *
                             **************************************************************
                             undefined FUN_000104c0()
             undefined         a0:1           <RETURN>
                             FUN_000104c0                                    XREF[1]:     FUN_00010704:0001089c(c)  
        000104c0 13 01 01 db     addi       sp,sp,-0x250
        000104c4 23 34 31 23     sd         s3,0x228(sp)
        000104c8 23 3c 51 21     sd         s5,0x218(sp)
        000104cc b2 89           c.mv       s3,a2
        000104ce ae 8a           c.mv       s5,a1
        000104d0 85 46           c.li       a3,0x1
        000104d2 05 46           c.li       a2,0x1
        000104d4 0c 08           c.addi4spn a1,sp,0x10
        000104d6 23 38 21 23     sd         s2,0x230(sp)
        000104da 23 34 11 24     sd         ra,0x248(sp)
        000104de 23 30 81 24     sd         s0,0x240(sp)
        000104e2 23 3c 91 22     sd         s1,0x238(sp)
        000104e6 23 30 41 23     sd         s4,0x220(sp)
        000104ea 23 38 61 21     sd         s6,0x210(sp)
        000104ee 2a 89           c.mv       s2,a0
        000104f0 ef 00 f0 01     jal        ra,FUN_00010d0e                                  undefined FUN_00010d0e()
        000104f4 1d c9           c.beqz     a0,LAB_0001052a
        000104f6 85 47           c.li       a5,0x1
        000104f8 63 0b f5 08     beq        a0,a5,LAB_0001058e
        000104fc 89 47           c.li       a5,0x2
        000104fe 63 06 f5 08     beq        a0,a5,LAB_0001058a
                             LAB_00010502                                    XREF[1]:     00010586(j)  
        00010502 31 45           c.li       a0,0xc
                             LAB_00010504                                    XREF[4]:     0001057c(j), 0001058c(j), 
                                                                                          00010590(j), 00010598(j)  
        00010504 83 30 81 24     ld         ra,0x248(sp)
        00010508 03 34 01 24     ld         s0,0x240(sp)
        0001050c 83 34 81 23     ld         s1,0x238(sp)
        00010510 03 39 01 23     ld         s2,0x230(sp)
        00010514 83 39 81 22     ld         s3,0x228(sp)
        00010518 03 3a 01 22     ld         s4,0x220(sp)
        0001051c 83 3a 81 21     ld         s5,0x218(sp)
        00010520 03 3b 01 21     ld         s6,0x210(sp)
        00010524 13 01 01 25     addi       sp,sp,0x250
        00010528 82 80           ret
                             LAB_0001052a                                    XREF[1]:     000104f4(j)  
        0001052a 16 5a           c.lwsp     s4,0x64(sp)
        0001052c 86 54           c.lwsp     s1,0x60(sp)
        0001052e 66 64           c.ldsp     s0,0x58(sp)
        00010530 bb 84 44 03     mulw       s1,s1,s4
        00010534 9b 84 f4 1f     addiw      s1,s1,0x1ff
        00010538 9b d4 94 00     srliw      s1,s1,0x9
        0001053c 82 14           c.slli     s1,0x20
        0001053e 81 90           c.srli     s1,0x20
        00010540 a2 94           c.add      s1,s0
        00010542 63 7a 94 04     bgeu       s0,s1,LAB_00010596
        00010546 13 0b 00 20     li         s6,0x200
                             LAB_0001054a                                    XREF[1]:     00010592(j)  
        0001054a 1b 06 04 00     sext.w     a2,s0
        0001054e 0c 08           c.addi4spn a1,sp,0x10
        00010550 85 46           c.li       a3,0x1
        00010552 4a 85           c.mv       a0,s2
        00010554 ef 00 a0 7b     jal        ra,FUN_00010d0e                                  undefined FUN_00010d0e()
        00010558 3b 56 4b 03     divuw      a2,s6,s4
        0001055c ce 85           c.mv       a1,s3
        0001055e 08 08           c.addi4spn a0,sp,0x10
        00010560 05 04           c.addi     s0,0x1
        00010562 ef 00 e0 41     jal        ra,FUN_00010980                                  undefined FUN_00010980()
        00010566 15 c5           c.beqz     a0,LAB_00010592
        00010568 8d c5           c.beqz     a1,LAB_00010592
        0001056a 93 86 15 00     addi       a3,a1,0x1
        0001056e 89 8e           c.sub      a3,a0
        00010570 1b 06 05 00     sext.w     a2,a0
        00010574 d6 85           c.mv       a1,s5
        00010576 4a 85           c.mv       a0,s2
        00010578 ef 00 60 79     jal        ra,FUN_00010d0e                                  undefined FUN_00010d0e()
        0001057c 41 d5           c.beqz     a0,LAB_00010504
        0001057e 05 47           c.li       a4,0x1
        00010580 63 07 e5 00     beq        a0,a4,LAB_0001058e
        00010584 09 47           c.li       a4,0x2
        00010586 e3 1e e5 f6     bne        a0,a4,LAB_00010502
                             LAB_0001058a                                    XREF[1]:     000104fe(j)  
        0001058a 2d 45           c.li       a0,0xb
        0001058c a5 bf           c.j        LAB_00010504
                             LAB_0001058e                                    XREF[2]:     000104f8(j), 00010580(j)  
        0001058e 29 45           c.li       a0,0xa
        00010590 95 bf           c.j        LAB_00010504
                             LAB_00010592                                    XREF[2]:     00010566(j), 00010568(j)  
        00010592 e3 6c 94 fa     bltu       s0,s1,LAB_0001054a
                             LAB_00010596                                    XREF[1]:     00010542(j)  
        00010596 0d 45           c.li       a0,0x3
        00010598 b5 b7           c.j        LAB_00010504
                             **************************************************************
                             *                          FUNCTION                          *
                             **************************************************************
                             undefined FUN_0001059a()
             undefined         a0:1           <RETURN>
             undefined8        Stack[-0x30]:8 local_30                                XREF[1]:     000105ba(*)  
                             FUN_0001059a                                    XREF[1]:     FUN_00010704:00010812(c)  
        0001059a 79 71           c.addi16sp sp,-0x30
        0001059c 22 f0           c.sdsp     s0,0x20(sp)
        0001059e 2a 84           c.mv       s0,a0
        000105a0 03 35 85 24     ld         a0,0x248(a0)
        000105a4 32 87           c.mv       a4,a2
        000105a6 03 26 04 25     lw         a2,0x250(s0)
        000105aa 26 05           c.slli     a0,0x9
        000105ac 26 ec           c.sdsp     s1,0x18(sp)
        000105ae 22 95           c.add      a0,s0
        000105b0 ae 84           c.mv       s1,a1
        000105b2 ba 85           c.mv       a1,a4
        000105b4 06 f4           c.sdsp     ra,0x28(sp)
        000105b6 ef 00 a0 3c     jal        ra,FUN_00010980                                  undefined FUN_00010980()
        000105ba 2a e0           c.sdsp     a0,0x0(sp=>local_30)
        000105bc 2e e4           c.sdsp     a1,0x8(sp)
        000105be 09 c9           c.beqz     a0,LAB_000105d0
        000105c0 aa 87           c.mv       a5,a0
        000105c2 0d 45           c.li       a0,0x3
        000105c4 81 ed           c.bnez     a1,LAB_000105dc
        000105c6 a2 70           c.ldsp     ra,0x28(sp)
        000105c8 02 74           c.ldsp     s0,0x20(sp)
        000105ca e2 64           c.ldsp     s1,0x18(sp)
        000105cc 45 61           c.addi16sp sp,0x30
        000105ce 82 80           ret
                             LAB_000105d0                                    XREF[1]:     000105be(j)  
        000105d0 a2 70           c.ldsp     ra,0x28(sp)
        000105d2 02 74           c.ldsp     s0,0x20(sp)
        000105d4 e2 64           c.ldsp     s1,0x18(sp)
        000105d6 0d 45           c.li       a0,0x3
        000105d8 45 61           c.addi16sp sp,0x30
        000105da 82 80           ret
                             LAB_000105dc                                    XREF[1]:     000105c4(j)  
        000105dc b7 06 08 03     lui        a3,0x3080
        000105e0 05 47           c.li       a4,0x1
        000105e2 23 80 e6 00     sb         a4,0x0(a3=>DAT_03080000)
        000105e6 98 42           c.lw       a4,0x0(a3=>DAT_03080000)
        000105e8 1b 57 e7 01     srliw      a4,a4,0x1e
        000105ec 01 27           c.addiw    a4,0x0
        000105ee 19 c7           c.beqz     a4,LAB_000105fc
                             LAB_000105f0                                    XREF[1]:     0001062c(j)  
        000105f0 01 45           c.li       a0,0x0
                             LAB_000105f2                                    XREF[1]:     00010636(j)  
        000105f2 a2 70           c.ldsp     ra,0x28(sp)
        000105f4 02 74           c.ldsp     s0,0x20(sp)
        000105f6 e2 64           c.ldsp     s1,0x18(sp)
        000105f8 45 61           c.addi16sp sp,0x30
        000105fa 82 80           ret
                             LAB_000105fc                                    XREF[1]:     000105ee(j)  
        000105fc 85 05           c.addi     a1,0x1
        000105fe 9d 8d           c.sub      a1,a5
        00010600 a6 05           c.slli     a1,0x9
        00010602 8c e6           c.sd       a1,0x8(a3=>DAT_03080008)
        00010604 a6 07           c.slli     a5,0x9
        00010606 84 ea           c.sd       s1,0x10(a3=>DAT_03080010)
        00010608 a2 97           c.add      a5,s0
        0001060a 9c ee           c.sd       a5,0x18(a3=>DAT_03080018)
        0001060c b7 07 00 3f     lui        a5,0x3f000
        00010610 a1 27           c.addiw    a5,0x8
        00010612 dc c2           c.sw       a5,0x4(a3=>DAT_03080004)
        00010614 23 80 a6 00     sb         a0,0x0(a3=>DAT_03080000)
        00010618 37 07 08 03     lui        a4,0x3080
                             LAB_0001061c                                    XREF[1]:     00010620(j)  
        0001061c 1c 43           c.lw       a5,0x0(a4=>DAT_03080000)
        0001061e 89 8b           c.andi     a5,0x2
        00010620 f5 ff           c.bnez     a5,LAB_0001061c
        00010622 1c 43           c.lw       a5,0x0(a4=>DAT_03080000)
        00010624 85 46           c.li       a3,0x1
        00010626 9b d7 e7 01     srliw      a5,a5,0x1e
        0001062a 81 27           c.addiw    a5,0x0
        0001062c e3 92 d7 fc     bne        a5,a3,LAB_000105f0
        00010630 23 00 07 00     sb         zero,0x0(a4=>DAT_03080000)
        00010634 01 45           c.li       a0,0x0
        00010636 75 bf           c.j        LAB_000105f2
                             **************************************************************
                             *                          FUNCTION                          *
                             **************************************************************
                             undefined FUN_00010686()
             undefined         a0:1           <RETURN>
             undefined8        Stack[-0x10]:8 local_10                                XREF[1]:     0001068a(*)  
                             FUN_00010686                                    XREF[3]:     FUN_00010140:00010146(c), 
                                                                                          FUN_00010704:0001072a(c), 
                                                                                          FUN_00010704:000108c4(c)  
        00010686 41 11           c.addi     sp,-0x10
        00010688 06 e4           c.sdsp     ra,0x8(sp)
        0001068a 22 e0           c.sdsp     s0,0x0(sp=>local_10)
        0001068c f3 27 40 f1     csrrs      a5,mhartid,zero
        00010690 a1 e7           c.bnez     a5,LAB_000106d8
        00010692 b7 07 01 10     lui        a5,0x10010
        00010696 05 47           c.li       a4,0x1
        00010698 98 c7           c.sw       a4,0x8(a5=>DAT_10010008)
        0001069a aa 87           c.mv       a5,a0
        0001069c 99 c5           c.beqz     a1,LAB_000106aa
        0001069e 63 56 05 00     bge        a0,zero,LAB_000106aa
        000106a2 05 47           c.li       a4,0x1
        000106a4 5e 17           c.slli     a4,0x37
        000106a6 b3 67 e5 00     or         a5,a0,a4
                             LAB_000106aa                                    XREF[2]:     0001069c(j), 0001069e(j)  
        000106aa 13 94 85 03     slli       s0,a1,0x38
        000106ae 37 05 01 10     lui        a0,0x10010
        000106b2 97 35 00 00     auipc      a1,0x3
        000106b6 93 85 65 09     addi       a1=>s_Error_0x_00013748,a1,0x96                  = "Error 0x"
        000106ba 5d 8c           c.or       s0,a5
        000106bc ef f0 df c8     jal        ra,FUN_00010348                                  undefined FUN_00010348()
        000106c0 93 55 04 42     srai       a1,s0,0x20
        000106c4 37 05 01 10     lui        a0,0x10010
        000106c8 ef f0 df c9     jal        ra,FUN_00010364                                  undefined FUN_00010364()
        000106cc 9b 05 04 00     sext.w     a1,s0
        000106d0 37 05 01 10     lui        a0,0x10010
        000106d4 ef f0 1f c9     jal        ra,FUN_00010364                                  undefined FUN_00010364()
                             LAB_000106d8                                    XREF[1]:     00010690(j)  
        000106d8 b7 07 06 10     lui        a5,0x10060
        000106dc 93 86 c7 00     addi       a3,a5,0xc
        000106e0 21 67           c.lui      a4,0x8
        000106e2 0f 00 50 0f     fence      0xf,0x5
        000106e6 2f a0 e6 44     amoor.w.aq zero,a4,(a3=>DAT_1006000c)
        000106ea 93 86 87 00     addi       a3,a5,0x8
        000106ee 0f 00 50 0f     fence      0xf,0x5
        000106f2 2f a0 e6 44     amoor.w.aq zero,a4,(a3=>DAT_10060008)
        000106f6 93 87 07 04     addi       a5,a5,0x40
        000106fa 0f 00 50 0f     fence      0xf,0x5
        000106fe 2f a0 e7 44     amoor.w.aq zero,a4,(a5=>DAT_10060040)
                             LAB_00010702                                    XREF[1]:     00010702(j)  
        00010702 01 a0           c.j        LAB_00010702
                             **************************************************************
                             *                          FUNCTION                          *
                             **************************************************************
                             undefined FUN_00010704()
             undefined         a0:1           <RETURN>
             undefined8        Stack[-0x40]:8 local_40                                XREF[2]:     0001071a(*), 
                                                                                                   00010828(*)  
                             FUN_00010704                                    XREF[1]:     FUN_00010176:0001019c(c)  
        00010704 85 67           c.lui      a5,0x1
        00010706 9c 43           c.lw       a5=>DAT_00001000,0x0(a5)
        00010708 39 71           c.addi16sp sp,-0x40
        0001070a 06 fc           c.sdsp     ra,0x38(sp)
        0001070c 81 27           c.addiw    a5,0x0
        0001070e 22 f8           c.sdsp     s0,0x30(sp)
        00010710 26 f4           c.sdsp     s1,0x28(sp)
        00010712 4a f0           c.sdsp     s2,0x20(sp)
        00010714 4e ec           c.sdsp     s3,0x18(sp)
        00010716 52 e8           c.sdsp     s4,0x10(sp)
        00010718 56 e4           c.sdsp     s5,0x8(sp)
        0001071a 5a e0           c.sdsp     s6,0x0(sp=>local_40)
        0001071c 29 47           c.li       a4,0xa
        0001071e 9b 86 b7 ff     addiw      a3,a5,-0x5
        00010722 63 76 d7 00     bgeu       a4,a3,LAB_0001072e
                             LAB_00010726                                    XREF[1]:     0001074a(j)  
        00010726 81 45           c.li       a1,0x0
        00010728 05 45           c.li       a0,0x1
        0001072a ef f0 df f5     jal        ra,FUN_00010686                                  undefined FUN_00010686()
                             LAB_0001072e                                    XREF[1]:     00010722(j)  
        0001072e 05 47           c.li       a4,0x1
        00010730 33 17 d7 00     sll        a4,a4,a3
        00010734 93 76 37 62     andi       a3,a4,0x623
        00010738 aa 84           c.mv       s1,a0
        0001073a 2e 89           c.mv       s2,a1
        0001073c 32 84           c.mv       s0,a2
        0001073e 85 ea           c.bnez     a3,LAB_0001076e
        00010740 93 76 07 05     andi       a3,a4,0x50
        00010744 b1 e6           c.bnez     a3,LAB_00010790
        00010746 13 77 c7 18     andi       a4,a4,0x18c
        0001074a 71 df           c.beqz     a4,LAB_00010726
        0001074c e9 37           c.addiw    a5,-0x6
        0001074e 9b 86 07 00     sext.w     a3,a5
        00010752 25 47           c.li       a4,0x9
        00010754 63 63 d7 18     bltu       a4,a3,switchD_0001076c::caseD_a
        00010758 82 17           c.slli     a5,0x20
        0001075a 81 93           c.srli     a5,0x20
        0001075c 17 37 00 00     auipc      a4,0x3
        00010760 13 07 c7 f5     addi       a4=>switchD_0001076c::switchdataD_000136b8,a4,   = FFFFD22Ch
        00010764 8a 07           c.slli     a5,0x2
        00010766 ba 97           c.add      a5,a4
        00010768 9c 43           c.lw       a5,0x0(a5=>switchD_0001076c::switchdataD_00013   = FFFFD22Ch
        0001076a ba 97           c.add      a5,a4
                             switchD_0001076c::switchD
        0001076c 82 87           c.jr       a5
                             LAB_0001076e                                    XREF[1]:     0001073e(j)  
        0001076e e9 37           c.addiw    a5,-0x6
        00010770 9b 86 07 00     sext.w     a3,a5
        00010774 25 47           c.li       a4,0x9
        00010776 63 6e d7 02     bltu       a4,a3,switchD_0001078e::caseD_a
        0001077a 82 17           c.slli     a5,0x20
        0001077c 81 93           c.srli     a5,0x20
        0001077e 17 37 00 00     auipc      a4,0x3
        00010782 13 07 27 f6     addi       a4=>switchD_0001078e::switchdataD_000136e0,a4,   = FFFFD14Eh
        00010786 8a 07           c.slli     a5,0x2
        00010788 ba 97           c.add      a5,a4
        0001078a 9c 43           c.lw       a5,0x0(a5=>switchD_0001078e::switchdataD_00013   = FFFFD14Eh
        0001078c ba 97           c.add      a5,a4
                             switchD_0001078e::switchD
        0001078e 82 87           c.jr       a5
                             LAB_00010790                                    XREF[1]:     00010744(j)  
        00010790 e9 37           c.addiw    a5,-0x6
        00010792 9b 86 07 00     sext.w     a3,a5
        00010796 25 47           c.li       a4,0x9
        00010798 63 6b d7 14     bltu       a4,a3,switchD_000107b0::caseD_a
        0001079c 82 17           c.slli     a5,0x20
        0001079e 81 93           c.srli     a5,0x20
        000107a0 17 37 00 00     auipc      a4,0x3
        000107a4 13 07 87 f6     addi       a4=>switchD_000107b0::switchdataD_00013708,a4,   = FFFFD1C4h
        000107a8 8a 07           c.slli     a5,0x2
        000107aa ba 97           c.add      a5,a4
        000107ac 9c 43           c.lw       a5,0x0(a5=>switchD_000107b0::switchdataD_00013   = FFFFD1C4h
        000107ae ba 97           c.add      a5,a4
                             switchD_000107b0::switchD
        000107b0 82 87           c.jr       a5
                             switchD_0001078e::caseD_a                       XREF[2]:     00010776(j), 0001078e(j)  
        000107b2 37 0a 00 20     lui        s4,0x20000
        000107b6 b7 09 04 10     lui        s3,0x10040
                             LAB_000107ba                                    XREF[2]:     000108e2(j), 000108f4(j)  
        000107ba 15 67           c.lui      a4,0x5
        000107bc 9b 07 f7 e1     addiw      a5,a4,-0x1e1
        000107c0 3d 9c           c.addw     s0,a5
        000107c2 1b 07 07 e2     addiw      a4,a4,-0x1e0
        000107c6 bb 57 e4 02     divuw      a5,s0,a4
        000107ca 91 c3           c.beqz     a5,LAB_000107ce
        000107cc fd 37           c.addiw    a5,-0x1
                             LAB_000107ce                                    XREF[1]:     000107ca(j)  
        000107ce 23 a0 f9 00     sw         a5,0x0(s3=>DAT_10041000)
        000107d2 83 a7 09 06     lw         a5,0x60(s3=>DAT_10041060)
        000107d6 93 05 60 06     li         a1,0x66
        000107da 4e 85           c.mv       a0=>DAT_10041000,s3
        000107dc f9 9b           c.andi     a5,-0x2
        000107de 23 a0 f9 06     sw         a5,0x60(s3=>DAT_10041060)
        000107e2 ef f0 7f a7     jal        ra,FUN_00010258                                  undefined FUN_00010258()
        000107e6 93 05 90 09     li         a1,0x99
        000107ea 4e 85           c.mv       a0=>DAT_10041000,s3
        000107ec ef f0 df a6     jal        ra,FUN_00010258                                  undefined FUN_00010258()
        000107f0 b7 07 03 00     lui        a5,0x30
        000107f4 93 e7 77 00     ori        a5,a5,0x7
                             LAB_000107f8                                    XREF[1]:     00010878(j)  
        000107f8 23 a2 f9 06     sw         a5,0x64(s3=>DAT_10040064)
        000107fc 83 a7 09 06     lw         a5,0x60(s3=>DAT_10040060)
        00010800 93 e7 17 00     ori        a5,a5,0x1
        00010804 23 a0 f9 06     sw         a5,0x60(s3=>DAT_10040060)
        00010808 0f 00 c0 0c     fence      0xc,0xc
        0001080c 4a 86           c.mv       a2,s2
        0001080e a6 85           c.mv       a1,s1
        00010810 52 85           c.mv       a0,s4
        00010812 ef f0 9f d8     jal        ra,FUN_0001059a                                  undefined FUN_0001059a()
        00010816 01 25           c.addiw    a0,0x0
                             LAB_00010818                                    XREF[2]:     000108a2(j), 00010946(j)  
        00010818 5d e1           c.bnez     a0,LAB_000108be
        0001081a e2 70           c.ldsp     ra,0x38(sp)
        0001081c 42 74           c.ldsp     s0,0x30(sp)
        0001081e a2 74           c.ldsp     s1,0x28(sp)
        00010820 02 79           c.ldsp     s2,0x20(sp)
        00010822 e2 69           c.ldsp     s3,0x18(sp)
        00010824 42 6a           c.ldsp     s4,0x10(sp)
        00010826 a2 6a           c.ldsp     s5,0x8(sp)
        00010828 02 6b           c.ldsp     s6,0x0(sp=>local_40)
        0001082a 21 61           c.addi16sp sp,0x40
        0001082c 82 80           ret
                             switchD_0001078e::caseD_7                       XREF[1]:     0001078e(j)  
                             switchD_0001078e::caseD_a
                             switchD_0001078e::caseD_d
                             switchD_0001078e::caseD_f
                             switchD_0001078e::caseD_6
        0001082e 81 47           c.li       a5,0x0
                             LAB_00010830                                    XREF[1]:     000108e6(j)  
        00010830 f9 e3           c.bnez     a5,LAB_000108f6
        00010832 37 0a 00 20     lui        s4,0x20000
        00010836 b7 09 04 10     lui        s3,0x10040
                             LAB_0001083a                                    XREF[2]:     000108d2(j), 000108fe(j)  
        0001083a 15 67           c.lui      a4,0x5
        0001083c 9b 07 f7 e1     addiw      a5,a4,-0x1e1
        00010840 3d 9c           c.addw     s0,a5
        00010842 1b 07 07 e2     addiw      a4,a4,-0x1e0
        00010846 bb 57 e4 02     divuw      a5,s0,a4
        0001084a 91 c3           c.beqz     a5,LAB_0001084e
        0001084c fd 37           c.addiw    a5,-0x1
                             LAB_0001084e                                    XREF[1]:     0001084a(j)  
        0001084e 23 a0 f9 00     sw         a5,0x0(s3=>DAT_10040000)
        00010852 83 a7 09 06     lw         a5,0x60(s3=>DAT_10040060)
        00010856 93 05 60 06     li         a1,0x66
        0001085a 4e 85           c.mv       a0=>DAT_10040000,s3
        0001085c f9 9b           c.andi     a5,-0x2
        0001085e 23 a0 f9 06     sw         a5,0x60(s3=>DAT_10040060)
        00010862 ef f0 7f 9f     jal        ra,FUN_00010258                                  undefined FUN_00010258()
        00010866 93 05 90 09     li         a1,0x99
        0001086a 4e 85           c.mv       a0=>DAT_10040000,s3
        0001086c ef f0 df 9e     jal        ra,FUN_00010258                                  undefined FUN_00010258()
        00010870 b7 27 6b 00     lui        a5,0x6b2
        00010874 93 87 77 08     addi       a5,a5,0x87
        00010878 41 b7           c.j        LAB_000107f8
                             switchD_0001078e::caseD_b                       XREF[1]:     0001078e(j)  
                             switchD_0001078e::caseD_8
        0001087a 37 0a 04 10     lui        s4,0x10040
                             LAB_0001087e                                    XREF[2]:     000108d8(j), 000108ec(j)  
        0001087e c1 49           c.li       s3,0x10
        00010880 91 4a           c.li       s5,0x4
        00010882 17 3b 00 00     auipc      s6,0x3
        00010886 13 0b eb ea     addi       s6,s6,-0x152
                             LAB_0001088a                                    XREF[1]:     000108ba(j)  
        0001088a 01 46           c.li       a2,0x0
        0001088c a2 85           c.mv       a1,s0
        0001088e 52 85           c.mv       a0=>DAT_10041000,s4
        00010890 ef 00 40 2c     jal        ra,FUN_00010b54                                  undefined FUN_00010b54()
        00010894 01 e9           c.bnez     a0,LAB_000108a4
                             LAB_00010896                                    XREF[1]:     000108b6(j)  
        00010896 4a 86           c.mv       a2,s2
        00010898 a6 85           c.mv       a1,s1
        0001089a 52 85           c.mv       a0,s4
        0001089c ef f0 5f c2     jal        ra,FUN_000104c0                                  undefined FUN_000104c0()
        000108a0 01 25           c.addiw    a0,0x0
        000108a2 9d bf           c.j        LAB_00010818
                             LAB_000108a4                                    XREF[1]:     00010894(j)  
        000108a4 7d 35           c.addiw    a0,-0x1
        000108a6 9b 07 05 00     sext.w     a5,a0
        000108aa 63 ef fa 00     bltu       s5,a5,LAB_000108c8
        000108ae 02 15           c.slli     a0,0x20
        000108b0 79 81           c.srli     a0,0x1e
        000108b2 5a 95           c.add      a0,s6
        000108b4 08 41           c.lw       a0,0x0(a0)
        000108b6 65 d1           c.beqz     a0,LAB_00010896
                             LAB_000108b8                                    XREF[1]:     000108ca(j)  
        000108b8 fd 19           c.addi     s3,-0x1
        000108ba e3 98 09 fc     bne        s3,zero,LAB_0001088a
                             LAB_000108be                                    XREF[1]:     00010818(j)  
        000108be 02 15           c.slli     a0,0x20
        000108c0 81 45           c.li       a1,0x0
        000108c2 01 91           c.srli     a0,0x20
        000108c4 ef f0 3f dc     jal        ra,FUN_00010686                                  undefined FUN_00010686()
                             LAB_000108c8                                    XREF[1]:     000108aa(j)  
        000108c8 31 45           c.li       a0,0xc
        000108ca fd b7           c.j        LAB_000108b8
                             switchD_000107b0::caseD_7                       XREF[1]:     000107b0(j)  
                             switchD_000107b0::caseD_a
                             switchD_000107b0::caseD_d
                             switchD_000107b0::caseD_f
                             switchD_000107b0::caseD_6
        000108cc 01 4a           c.li       s4,0x0
        000108ce b7 09 05 10     lui        s3,0x10050
        000108d2 a5 b7           c.j        LAB_0001083a
                             switchD_000107b0::caseD_b                       XREF[1]:     000107b0(j)  
                             switchD_000107b0::caseD_8
        000108d4 37 0a 05 10     lui        s4,0x10050
        000108d8 5d b7           c.j        LAB_0001087e
                             switchD_0001076c::caseD_a                       XREF[2]:     00010754(j), 0001076c(j)  
        000108da 37 0a 00 30     lui        s4,0x30000
        000108de b7 19 04 10     lui        s3,0x10041
        000108e2 e1 bd           c.j        LAB_000107ba
                             switchD_0001076c::caseD_7                       XREF[1]:     0001076c(j)  
                             switchD_0001076c::caseD_a
                             switchD_0001076c::caseD_d
                             switchD_0001076c::caseD_f
                             switchD_0001076c::caseD_6
        000108e4 85 47           c.li       a5,0x1
        000108e6 a9 b7           c.j        LAB_00010830
                             switchD_0001076c::caseD_b                       XREF[1]:     0001076c(j)  
                             switchD_0001076c::caseD_8
        000108e8 37 1a 04 10     lui        s4,0x10041
        000108ec 49 bf           c.j        LAB_0001087e
                             switchD_000107b0::caseD_a                       XREF[2]:     00010798(j), 000107b0(j)  
        000108ee 01 4a           c.li       s4,0x0
        000108f0 b7 09 05 10     lui        s3,0x10050
        000108f4 d9 b5           c.j        LAB_000107ba
                             LAB_000108f6                                    XREF[1]:     00010830(j)  
        000108f6 37 0a 00 30     lui        s4,0x30000
        000108fa b7 19 04 10     lui        s3,0x10041
        000108fe 35 bf           c.j        LAB_0001083a
                             switchD_0001078e::caseD_c                       XREF[1]:     0001078e(j)  
                             switchD_0001078e::caseD_e
                             switchD_0001078e::caseD_9
        00010900 b7 09 04 10     lui        s3,0x10040
                             LAB_00010904                                    XREF[2]:     0001094c(j), 00010952(j)  
        00010904 15 67           c.lui      a4,0x5
        00010906 9b 07 f7 e1     addiw      a5,a4,-0x1e1
        0001090a 3d 9c           c.addw     s0,a5
        0001090c 1b 07 07 e2     addiw      a4,a4,-0x1e0
        00010910 bb 57 e4 02     divuw      a5,s0,a4
        00010914 91 c3           c.beqz     a5,LAB_00010918
        00010916 fd 37           c.addiw    a5,-0x1
                             LAB_00010918                                    XREF[1]:     00010914(j)  
        00010918 23 a0 f9 00     sw         a5,0x0(s3=>DAT_10041000)
        0001091c 83 a7 09 06     lw         a5,0x60(s3=>DAT_10041060)
        00010920 93 05 60 06     li         a1,0x66
        00010924 4e 85           c.mv       a0=>DAT_10041000,s3
        00010926 f9 9b           c.andi     a5,-0x2
        00010928 23 a0 f9 06     sw         a5,0x60(s3=>DAT_10041060)
        0001092c ef f0 df 92     jal        ra,FUN_00010258                                  undefined FUN_00010258()
        00010930 93 05 90 09     li         a1,0x99
        00010934 4e 85           c.mv       a0=>DAT_10041000,s3
        00010936 ef f0 3f 92     jal        ra,FUN_00010258                                  undefined FUN_00010258()
        0001093a 4a 86           c.mv       a2,s2
        0001093c a6 85           c.mv       a1,s1
        0001093e 4e 85           c.mv       a0=>DAT_10041000,s3
        00010940 ef f0 df aa     jal        ra,FUN_000103ec                                  undefined FUN_000103ec()
        00010944 01 25           c.addiw    a0,0x0
        00010946 c9 bd           c.j        LAB_00010818
                             switchD_0001076c::caseD_c                       XREF[1]:     0001076c(j)  
                             switchD_0001076c::caseD_e
                             switchD_0001076c::caseD_9
        00010948 b7 19 04 10     lui        s3,0x10041
        0001094c 65 bf           c.j        LAB_00010904
                             switchD_000107b0::caseD_c                       XREF[1]:     000107b0(j)  
                             switchD_000107b0::caseD_e
                             switchD_000107b0::caseD_9
        0001094e b7 09 05 10     lui        s3,0x10050
        00010952 4d bf           c.j        LAB_00010904
                             **************************************************************
                             *                          FUNCTION                          *
                             **************************************************************
                             undefined FUN_00010980()
             undefined         a0:1           <RETURN>
             undefined8        Stack[-0x10]:8 local_10                                XREF[4]:     000109ba(*), 
                                                                                                   000109be(*), 
                                                                                                   000109cc(*), 
                                                                                                   000109ce(*)  
                             FUN_00010980                                    XREF[3]:     FUN_000103ec:0001046c(c), 
                                                                                          FUN_000104c0:00010562(c), 
                                                                                          FUN_0001059a:000105b6(c)  
        00010980 41 11           c.addi     sp,-0x10
        00010982 05 ce           c.beqz     a2,LAB_000109ba
        00010984 9b 08 f6 ff     addiw      a7,a2,-0x1
        00010988 82 18           c.slli     a7,0x20
        0001098a 93 d8 98 01     srli       a7,a7,0x19
        0001098e aa 98           c.add      a7,a0
        00010990 93 88 08 08     addi       a7,a7,0x80
                             LAB_00010994                                    XREF[1]:     000109b6(j)  
        00010994 2e 87           c.mv       a4,a1
        00010996 13 08 05 01     addi       a6,a0,0x10
        0001099a aa 87           c.mv       a5,a0
        0001099c 19 a0           c.j        LAB_000109a2
                             LAB_0001099e                                    XREF[1]:     000109ae(j)  
        0001099e 63 84 07 03     beq        a5,a6,LAB_000109c6
                             LAB_000109a2                                    XREF[1]:     0001099c(j)  
        000109a2 03 c6 07 00     lbu        a2,0x0(a5)
        000109a6 83 46 07 00     lbu        a3,0x0(a4)
        000109aa 85 07           c.addi     a5,0x1
        000109ac 05 07           c.addi     a4,0x1
        000109ae e3 08 d6 fe     beq        a2,a3,LAB_0001099e
        000109b2 13 05 05 08     addi       a0,a0,0x80
        000109b6 e3 1f 15 fd     bne        a0,a7,LAB_00010994
                             LAB_000109ba                                    XREF[1]:     00010982(j)  
        000109ba 02 e0           c.sdsp     zero,0x0(sp=>local_10)
        000109bc 02 e4           c.sdsp     zero,0x8(sp)
        000109be 02 65           c.ldsp     a0,0x0(sp=>local_10)
        000109c0 a2 65           c.ldsp     a1,0x8(sp)
        000109c2 41 01           c.addi     sp,0x10
        000109c4 82 80           ret
                             LAB_000109c6                                    XREF[1]:     0001099e(j)  
        000109c6 18 75           c.ld       a4,0x28(a0)
        000109c8 1c 71           c.ld       a5,0x20(a0)
        000109ca 3a e4           c.sdsp     a4,0x8(sp)
        000109cc 3e e0           c.sdsp     a5,0x0(sp=>local_10)
        000109ce 02 65           c.ldsp     a0,0x0(sp=>local_10)
        000109d0 a2 65           c.ldsp     a1,0x8(sp)
        000109d2 41 01           c.addi     sp,0x10
        000109d4 82 80           ret
                             **************************************************************
                             *                          FUNCTION                          *
                             **************************************************************
                             undefined FUN_00010aba()
             undefined         a0:1           <RETURN>
                             FUN_00010aba                                    XREF[7]:     FUN_00010b54:00010bfa(c), 
                                                                                          FUN_00010b54:00010c26(c), 
                                                                                          FUN_00010b54:00010c9a(c), 
                                                                                          FUN_00010b54:00010cbc(c), 
                                                                                          FUN_00010b54:00010cea(c), 
                                                                                          FUN_00010d0e:00010d2e(c), 
                                                                                          FUN_00010d0e:00010de4(c)  
        00010aba 79 71           c.addi16sp sp,-0x30
        00010abc 06 f4           c.sdsp     ra,0x28(sp)
        00010abe 22 f0           c.sdsp     s0,0x20(sp)
        00010ac0 26 ec           c.sdsp     s1,0x18(sp)
        00010ac2 4a e8           c.sdsp     s2,0x10(sp)
        00010ac4 4e e4           c.sdsp     s3,0x8(sp)
        00010ac6 1c 4d           c.lw       a5,0x18(a0)
        00010ac8 ae 89           c.mv       s3,a1
        00010aca 93 05 f0 0f     li         a1,0xff
        00010ace f1 9b           c.andi     a5,-0x4
        00010ad0 93 e7 27 00     ori        a5,a5,0x2
        00010ad4 1c cd           c.sw       a5,0x18(a0)
        00010ad6 32 84           c.mv       s0,a2
        00010ad8 36 89           c.mv       s2,a3
        00010ada aa 84           c.mv       s1,a0
        00010adc ef f0 cf f7     jal        ra,FUN_00010258                                  undefined FUN_00010258()
        00010ae0 ce 85           c.mv       a1,s3
        00010ae2 26 85           c.mv       a0,s1
        00010ae4 ef f0 4f f7     jal        ra,FUN_00010258                                  undefined FUN_00010258()
        00010ae8 9b 55 84 01     srliw      a1,s0,0x18
        00010aec 93 f5 f5 0f     andi       a1,a1,0xff
        00010af0 26 85           c.mv       a0,s1
        00010af2 ef f0 6f f6     jal        ra,FUN_00010258                                  undefined FUN_00010258()
        00010af6 9b 55 04 01     srliw      a1,s0,0x10
        00010afa 93 f5 f5 0f     andi       a1,a1,0xff
        00010afe 26 85           c.mv       a0,s1
        00010b00 ef f0 8f f5     jal        ra,FUN_00010258                                  undefined FUN_00010258()
        00010b04 9b 55 84 00     srliw      a1,s0,0x8
        00010b08 93 f5 f5 0f     andi       a1,a1,0xff
        00010b0c 26 85           c.mv       a0,s1
        00010b0e ef f0 af f4     jal        ra,FUN_00010258                                  undefined FUN_00010258()
        00010b12 93 75 f4 0f     andi       a1,s0,0xff
        00010b16 26 85           c.mv       a0,s1
        00010b18 ef f0 0f f4     jal        ra,FUN_00010258                                  undefined FUN_00010258()
        00010b1c ca 85           c.mv       a1,s2
        00010b1e 26 85           c.mv       a0,s1
        00010b20 ef f0 8f f3     jal        ra,FUN_00010258                                  undefined FUN_00010258()
        00010b24 13 04 80 3e     li         s0,0x3e8
        00010b28 11 a0           c.j        LAB_00010b2c
                             LAB_00010b2a                                    XREF[1]:     00010b40(j)  
        00010b2a 09 cc           c.beqz     s0,LAB_00010b44
                             LAB_00010b2c                                    XREF[1]:     00010b28(j)  
        00010b2c 93 05 f0 0f     li         a1,0xff
        00010b30 26 85           c.mv       a0,s1
        00010b32 ef f0 6f f2     jal        ra,FUN_00010258                                  undefined FUN_00010258()
        00010b36 9b 17 85 01     slliw      a5,a0,0x18
        00010b3a 9b d7 87 41     sraiw      a5,a5,0x18
        00010b3e 7d 14           c.addi     s0,-0x1
        00010b40 e3 c5 07 fe     blt        a5,zero,LAB_00010b2a
                             LAB_00010b44                                    XREF[1]:     00010b2a(j)  
        00010b44 a2 70           c.ldsp     ra,0x28(sp)
        00010b46 02 74           c.ldsp     s0,0x20(sp)
        00010b48 e2 64           c.ldsp     s1,0x18(sp)
        00010b4a 42 69           c.ldsp     s2,0x10(sp)
        00010b4c a2 69           c.ldsp     s3,0x8(sp)
        00010b4e 01 25           c.addiw    a0,0x0
        00010b50 45 61           c.addi16sp sp,0x30
        00010b52 82 80           ret
                             **************************************************************
                             *                          FUNCTION                          *
                             **************************************************************
                             undefined FUN_00010b54()
             undefined         a0:1           <RETURN>
                             FUN_00010b54                                    XREF[1]:     FUN_00010704:00010890(c)  
        00010b54 79 71           c.addi16sp sp,-0x30
        00010b56 22 f0           c.sdsp     s0,0x20(sp)
        00010b58 4a e8           c.sdsp     s2,0x10(sp)
        00010b5a 06 f4           c.sdsp     ra,0x28(sp)
        00010b5c 26 ec           c.sdsp     s1,0x18(sp)
        00010b5e 4e e4           c.sdsp     s3,0x8(sp)
        00010b60 2a 84           c.mv       s0,a0
        00010b62 2e 89           c.mv       s2,a1
        00010b64 15 c6           c.beqz     a2,LAB_00010b90
                             LAB_00010b66                                    XREF[1]:     00010d02(j)  
        00010b66 a9 67           c.lui      a5,0xa
        00010b68 9b 85 f7 c3     addiw      a1,a5,-0x3c1
        00010b6c bb 05 b9 00     addw       a1,s2,a1
        00010b70 9b 87 07 c4     addiw      a5,a5,-0x3c0
        00010b74 bb d7 f5 02     divuw      a5,a1,a5
        00010b78 91 eb           c.bnez     a5,LAB_00010b8c
                             LAB_00010b7a                                    XREF[1]:     00010b8e(j)  
        00010b7a 1c c0           c.sw       a5,0x0(s0)
        00010b7c 01 45           c.li       a0,0x0
                             LAB_00010b7e                                    XREF[4]:     00010c14(j), 00010c88(j), 
                                                                                          00010cda(j), 00010d06(j)  
        00010b7e a2 70           c.ldsp     ra,0x28(sp)
        00010b80 02 74           c.ldsp     s0,0x20(sp)
        00010b82 e2 64           c.ldsp     s1,0x18(sp)
        00010b84 42 69           c.ldsp     s2,0x10(sp)
        00010b86 a2 69           c.ldsp     s3,0x8(sp)
        00010b88 45 61           c.addi16sp sp,0x30
        00010b8a 82 80           ret
                             LAB_00010b8c                                    XREF[1]:     00010b78(j)  
        00010b8c fd 37           c.addiw    a5,-0x1
        00010b8e f5 b7           c.j        LAB_00010b7a
                             LAB_00010b90                                    XREF[1]:     00010b64(j)  
        00010b90 b7 c7 00 02     lui        a5,0x200c
        00010b94 03 b7 87 ff     ld         a4,-0x8(a5=>DAT_0200bff8)
        00010b98 b7 c6 00 02     lui        a3,0x200c
        00010b9c 13 07 97 3e     addi       a4,a4,0x3e9
                             LAB_00010ba0                                    XREF[1]:     00010ba4(j)  
        00010ba0 83 b7 86 ff     ld         a5,-0x8(a3=>DAT_0200bff8)
        00010ba4 e3 ee e7 fe     bltu       a5,a4,LAB_00010ba0
        00010ba8 13 07 00 32     li         a4,0x320
        00010bac 9b 07 f9 31     addiw      a5,s2,0x31f
        00010bb0 bb d7 e7 02     divuw      a5,a5,a4
        00010bb4 37 07 08 00     lui        a4,0x80
        00010bb8 38 c0           c.sw       a4,0x40(s0)
        00010bba 58 48           c.lw       a4,0x14(s0)
        00010bbc 13 67 17 00     ori        a4,a4,0x1
        00010bc0 58 c8           c.sw       a4,0x14(s0)
        00010bc2 23 28 04 00     sw         zero,0x10(s0)
        00010bc6 1b 87 07 00     sext.w     a4,a5
        00010bca 63 1f 07 12     bne        a4,zero,LAB_00010d08
                             LAB_00010bce                                    XREF[1]:     00010d0c(j)  
        00010bce 18 c0           c.sw       a4,0x0(s0)
        00010bd0 1c 4c           c.lw       a5,0x18(s0)
        00010bd2 a9 44           c.li       s1,0xa
        00010bd4 93 e7 37 00     ori        a5,a5,0x3
        00010bd8 1c cc           c.sw       a5,0x18(s0)
                             LAB_00010bda                                    XREF[1]:     00010be6(j)  
        00010bda fd 34           c.addiw    s1,-0x1
        00010bdc 93 05 f0 0f     li         a1,0xff
        00010be0 22 85           c.mv       a0,s0
        00010be2 ef f0 6f e7     jal        ra,FUN_00010258                                  undefined FUN_00010258()
        00010be6 f5 f8           c.bnez     s1,LAB_00010bda
        00010be8 1c 4c           c.lw       a5,0x18(s0)
        00010bea 93 06 50 09     li         a3,0x95
        00010bee 01 46           c.li       a2,0x0
        00010bf0 f1 9b           c.andi     a5,-0x4
        00010bf2 1c cc           c.sw       a5,0x18(s0)
        00010bf4 93 05 00 04     li         a1,0x40
        00010bf8 22 85           c.mv       a0,s0
        00010bfa ef f0 1f ec     jal        ra,FUN_00010aba                                  undefined FUN_00010aba()
        00010bfe aa 84           c.mv       s1,a0
        00010c00 93 05 f0 0f     li         a1,0xff
        00010c04 22 85           c.mv       a0,s0
        00010c06 ef f0 2f e5     jal        ra,FUN_00010258                                  undefined FUN_00010258()
        00010c0a 1c 4c           c.lw       a5,0x18(s0)
        00010c0c 05 47           c.li       a4,0x1
        00010c0e 05 45           c.li       a0,0x1
        00010c10 f1 9b           c.andi     a5,-0x4
        00010c12 1c cc           c.sw       a5,0x18(s0)
        00010c14 e3 95 e4 f6     bne        s1,a4,LAB_00010b7e
        00010c18 93 06 70 08     li         a3,0x87
        00010c1c 13 06 a0 1a     li         a2,0x1aa
        00010c20 93 05 80 04     li         a1,0x48
        00010c24 22 85           c.mv       a0,s0
        00010c26 ef f0 5f e9     jal        ra,FUN_00010aba                                  undefined FUN_00010aba()
        00010c2a aa 84           c.mv       s1,a0
        00010c2c 93 05 f0 0f     li         a1,0xff
        00010c30 22 85           c.mv       a0,s0
        00010c32 ef f0 6f e2     jal        ra,FUN_00010258                                  undefined FUN_00010258()
        00010c36 93 05 f0 0f     li         a1,0xff
        00010c3a 22 85           c.mv       a0,s0
        00010c3c ef f0 cf e1     jal        ra,FUN_00010258                                  undefined FUN_00010258()
        00010c40 93 05 f0 0f     li         a1,0xff
        00010c44 22 85           c.mv       a0,s0
        00010c46 ef f0 2f e1     jal        ra,FUN_00010258                                  undefined FUN_00010258()
        00010c4a aa 89           c.mv       s3,a0
        00010c4c 93 05 f0 0f     li         a1,0xff
        00010c50 22 85           c.mv       a0,s0
        00010c52 ef f0 6f e0     jal        ra,FUN_00010258                                  undefined FUN_00010258()
        00010c56 1b 07 05 00     sext.w     a4,a0
        00010c5a 13 07 67 f5     addi       a4,a4,-0xaa
        00010c5e fd 14           c.addi     s1,-0x1
        00010c60 93 f7 f9 00     andi       a5,s3,0xf
        00010c64 33 37 e0 00     sltu       a4,zero,a4
        00010c68 b3 34 90 00     sltu       s1,zero,s1
        00010c6c fd 17           c.addi     a5,-0x1
        00010c6e b3 37 f0 00     sltu       a5,zero,a5
        00010c72 d9 8c           c.or       s1,a4
        00010c74 93 05 f0 0f     li         a1,0xff
        00010c78 22 85           c.mv       a0,s0
        00010c7a dd 8c           c.or       s1,a5
        00010c7c ef f0 cf dd     jal        ra,FUN_00010258                                  undefined FUN_00010258()
        00010c80 1c 4c           c.lw       a5,0x18(s0)
        00010c82 09 45           c.li       a0,0x2
        00010c84 f1 9b           c.andi     a5,-0x4
        00010c86 1c cc           c.sw       a5,0x18(s0)
        00010c88 e3 9b 04 ee     bne        s1,zero,LAB_00010b7e
        00010c8c 85 49           c.li       s3,0x1
                             LAB_00010c8e                                    XREF[1]:     00010cd4(j)  
        00010c8e 93 06 50 06     li         a3,0x65
        00010c92 01 46           c.li       a2,0x0
        00010c94 93 05 70 07     li         a1,0x77
        00010c98 22 85           c.mv       a0,s0
        00010c9a ef f0 1f e2     jal        ra,FUN_00010aba                                  undefined FUN_00010aba()
        00010c9e 93 05 f0 0f     li         a1,0xff
        00010ca2 22 85           c.mv       a0,s0
        00010ca4 ef f0 4f db     jal        ra,FUN_00010258                                  undefined FUN_00010258()
        00010ca8 1c 4c           c.lw       a5,0x18(s0)
        00010caa 93 06 70 07     li         a3,0x77
        00010cae 37 06 00 40     lui        a2,0x40000
        00010cb2 f1 9b           c.andi     a5,-0x4
        00010cb4 1c cc           c.sw       a5,0x18(s0)
        00010cb6 93 05 90 06     li         a1,0x69
        00010cba 22 85           c.mv       a0,s0
        00010cbc ef f0 ff df     jal        ra,FUN_00010aba                                  undefined FUN_00010aba()
        00010cc0 93 74 f5 0f     andi       s1,a0,0xff
        00010cc4 93 05 f0 0f     li         a1,0xff
        00010cc8 22 85           c.mv       a0,s0
        00010cca ef f0 ef d8     jal        ra,FUN_00010258                                  undefined FUN_00010258()
        00010cce 1c 4c           c.lw       a5,0x18(s0)
        00010cd0 f1 9b           c.andi     a5,-0x4
        00010cd2 1c cc           c.sw       a5,0x18(s0)
        00010cd4 e3 8d 34 fb     beq        s1,s3,LAB_00010c8e
        00010cd8 0d 45           c.li       a0,0x3
        00010cda e3 92 04 ea     bne        s1,zero,LAB_00010b7e
        00010cde d5 46           c.li       a3,0x15
        00010ce0 13 06 00 20     li         a2,0x200
        00010ce4 93 05 00 05     li         a1,0x50
        00010ce8 22 85           c.mv       a0,s0
        00010cea ef f0 1f dd     jal        ra,FUN_00010aba                                  undefined FUN_00010aba()
        00010cee aa 84           c.mv       s1,a0
        00010cf0 93 05 f0 0f     li         a1,0xff
        00010cf4 22 85           c.mv       a0,s0
        00010cf6 ef f0 2f d6     jal        ra,FUN_00010258                                  undefined FUN_00010258()
        00010cfa 1c 4c           c.lw       a5,0x18(s0)
        00010cfc 15 45           c.li       a0,0x5
        00010cfe f1 9b           c.andi     a5,-0x4
        00010d00 1c cc           c.sw       a5,0x18(s0)
        00010d02 e3 82 04 e6     beq        s1,zero,LAB_00010b66
        00010d06 a5 bd           c.j        LAB_00010b7e
                             LAB_00010d08                                    XREF[1]:     00010bca(j)  
        00010d08 1b 87 f7 ff     addiw      a4,a5,-0x1
        00010d0c c9 b5           c.j        LAB_00010bce
                             **************************************************************
                             *                          FUNCTION                          *
                             **************************************************************
                             undefined FUN_00010d0e()
             undefined         a0:1           <RETURN>
                             FUN_00010d0e                                    XREF[3]:     FUN_000104c0:000104f0(c), 
                                                                                          FUN_000104c0:00010554(c), 
                                                                                          FUN_000104c0:00010578(c)  
        00010d0e 5d 71           c.addi16sp sp,-0x50
        00010d10 52 f0           c.sdsp     s4,0x20(sp)
        00010d12 5e e4           c.sdsp     s7,0x8(sp)
        00010d14 36 8a           c.mv       s4,a3
        00010d16 ae 8b           c.mv       s7,a1
        00010d18 85 46           c.li       a3,0x1
        00010d1a 93 05 20 05     li         a1,0x52
        00010d1e a2 e0           c.sdsp     s0,0x40(sp)
        00010d20 86 e4           c.sdsp     ra,0x48(sp)
        00010d22 26 fc           c.sdsp     s1,0x38(sp)
        00010d24 4a f8           c.sdsp     s2,0x30(sp)
        00010d26 4e f4           c.sdsp     s3,0x28(sp)
        00010d28 56 ec           c.sdsp     s5,0x18(sp)
        00010d2a 5a e8           c.sdsp     s6,0x10(sp)
        00010d2c 2a 84           c.mv       s0,a0
        00010d2e ef f0 df d8     jal        ra,FUN_00010aba                                  undefined FUN_00010aba()
        00010d32 6d e1           c.bnez     a0,LAB_00010e14
        00010d34 09 69           c.lui      s2,0x2
        00010d36 aa 8a           c.mv       s5,a0
        00010d38 93 09 e0 0f     li         s3,0xfe
        00010d3c 01 19           c.addi     s2,-0x20
                             LAB_00010d3e                                    XREF[2]:     00010d48(j), 00010dd6(j)  
        00010d3e 93 05 f0 0f     li         a1,0xff
        00010d42 22 85           c.mv       a0,s0
        00010d44 ef f0 4f d1     jal        ra,FUN_00010258                                  undefined FUN_00010258()
        00010d48 e3 1b 35 ff     bne        a0,s3,LAB_00010d3e
        00010d4c 93 84 0b 20     addi       s1,s7,0x200
        00010d50 01 4b           c.li       s6,0x0
                             LAB_00010d52                                    XREF[1]:     00010da8(j)  
        00010d52 93 05 f0 0f     li         a1,0xff
        00010d56 22 85           c.mv       a0,s0
        00010d58 ef f0 0f d0     jal        ra,FUN_00010258                                  undefined FUN_00010258()
        00010d5c 1b 57 8b 00     srliw      a4,s6,0x8
        00010d60 93 17 8b 00     slli       a5,s6,0x8
        00010d64 d9 8f           c.or       a5,a4
        00010d66 a9 8f           c.xor      a5,a0
        00010d68 13 9b 07 03     slli       s6,a5,0x30
        00010d6c 13 5b 0b 03     srli       s6,s6,0x30
        00010d70 9b 57 4b 00     srliw      a5,s6,0x4
        00010d74 bd 8b           c.andi     a5,0xf
        00010d76 b3 c7 67 01     xor        a5,a5,s6
        00010d7a 13 97 c7 00     slli       a4,a5,0xc
        00010d7e b9 8f           c.xor      a5,a4
        00010d80 9b 97 07 01     slliw      a5,a5,0x10
        00010d84 9b d7 07 41     sraiw      a5,a5,0x10
        00010d88 1b 97 07 01     slliw      a4,a5,0x10
        00010d8c 1b 57 07 01     srliw      a4,a4,0x10
        00010d90 1b 17 57 00     slliw      a4,a4,0x5
        00010d94 33 77 27 01     and        a4,a4,s2
        00010d98 b9 8f           c.xor      a5,a4
        00010d9a 23 80 ab 00     sb         a0,0x0(s7)
        00010d9e 13 9b 07 03     slli       s6,a5,0x30
        00010da2 85 0b           c.addi     s7,0x1
        00010da4 13 5b 0b 03     srli       s6,s6,0x30
        00010da8 e3 95 9b fa     bne        s7,s1,LAB_00010d52
        00010dac 93 05 f0 0f     li         a1,0xff
        00010db0 22 85           c.mv       a0,s0
        00010db2 ef f0 6f ca     jal        ra,FUN_00010258                                  undefined FUN_00010258()
        00010db6 9b 14 85 00     slliw      s1,a0,0x8
        00010dba 93 05 f0 0f     li         a1,0xff
        00010dbe 22 85           c.mv       a0,s0
        00010dc0 c2 14           c.slli     s1,0x30
        00010dc2 c1 90           c.srli     s1,0x30
        00010dc4 ef f0 4f c9     jal        ra,FUN_00010258                                  undefined FUN_00010258()
        00010dc8 b3 e7 a4 00     or         a5,s1,a0
        00010dcc c2 17           c.slli     a5,0x30
        00010dce c1 93           c.srli     a5,0x30
        00010dd0 63 90 67 05     bne        a5,s6,LAB_00010e10
        00010dd4 7d 1a           c.addi     s4,-0x1
        00010dd6 e3 44 40 f7     blt        zero,s4,LAB_00010d3e
                             LAB_00010dda                                    XREF[1]:     00010e12(j)  
        00010dda 85 46           c.li       a3,0x1
        00010ddc 01 46           c.li       a2,0x0
        00010dde 93 05 c0 04     li         a1,0x4c
        00010de2 22 85           c.mv       a0,s0
        00010de4 ef f0 7f cd     jal        ra,FUN_00010aba                                  undefined FUN_00010aba()
        00010de8 93 05 f0 0f     li         a1,0xff
        00010dec 22 85           c.mv       a0,s0
        00010dee ef f0 af c6     jal        ra,FUN_00010258                                  undefined FUN_00010258()
        00010df2 1c 4c           c.lw       a5,0x18(s0)
        00010df4 f1 9b           c.andi     a5,-0x4
        00010df6 1c cc           c.sw       a5,0x18(s0)
                             LAB_00010df8                                    XREF[1]:     00010e26(j)  
        00010df8 a6 60           c.ldsp     ra,0x48(sp)
        00010dfa 06 64           c.ldsp     s0,0x40(sp)
        00010dfc 56 85           c.mv       a0,s5
        00010dfe e2 74           c.ldsp     s1,0x38(sp)
        00010e00 42 79           c.ldsp     s2,0x30(sp)
        00010e02 a2 79           c.ldsp     s3,0x28(sp)
        00010e04 02 7a           c.ldsp     s4,0x20(sp)
        00010e06 e2 6a           c.ldsp     s5,0x18(sp)
        00010e08 42 6b           c.ldsp     s6,0x10(sp)
        00010e0a a2 6b           c.ldsp     s7,0x8(sp)
        00010e0c 61 61           c.addi16sp sp,0x50
        00010e0e 82 80           ret
                             LAB_00010e10                                    XREF[1]:     00010dd0(j)  
        00010e10 89 4a           c.li       s5,0x2
        00010e12 e1 b7           c.j        LAB_00010dda
                             LAB_00010e14                                    XREF[1]:     00010d32(j)  
        00010e14 93 05 f0 0f     li         a1,0xff
        00010e18 22 85           c.mv       a0,s0
        00010e1a ef f0 ef c3     jal        ra,FUN_00010258                                  undefined FUN_00010258()
        00010e1e 1c 4c           c.lw       a5,0x18(s0)
        00010e20 85 4a           c.li       s5,0x1
        00010e22 f1 9b           c.andi     a5,-0x4
        00010e24 1c cc           c.sw       a5,0x18(s0)
        00010e26 c9 bf           c.j        LAB_00010df8
