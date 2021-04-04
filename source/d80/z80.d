module d80.z80;

/**
 * Strings and instruction lengths for Zilog Z80.
 */
struct z80 {
    string s;           /// Instruction name
    ubyte n;            /// Length of instruction in bytes
}

/**
 * Primary table of Zilog Z80 instructions.
 */
immutable z80[] insnz80 = [
    { "nop",                 1 },
    { "ld\tbc, ",            3 },
    { "ld\t(bc), ",          1 },
    { "inc\tbc",             1 },
    { "inc\tb",              1 },
    { "dec\tb",              1 },
    { "ld\tb, ",             2 },
    { "rlca",                1 },
    { "ex\taf, af'",         1 },
    { "add\thl, bc",         1 },
    { "ld\ta, (bc)",         1 },
    { "dec\tbc",             1 },
    { "inc\tc",              1 },
    { "dec\tc",              1 },
    { "ld\tc, ",             2 },
    { "rrca",                1 },
    { "djnz\t",              2 },
    { "ld\tde, ",            3 },
    { "ld\t(de), a",         1 },
    { "inc\tde",             1 },
    { "inc\td",              1 },
    { "dec\td",              1 },
    { "ld\td, ",             2 },
    { "rla",                 1 },
    { "jr\tx",               2 },
    { "add\thl, de",         1 },
    { "ld\ta, (de)",         1 },
    { "dec\tde" ,            1 },
    { "inc\te",              1 },
    { "dec\te",              1 },
    { "ld\te, ",             2 },
    { "rra",                 1 },
    { "jr\tnz, ",            2 },
    { "ld\thl, ",            3 },
    { "ld\t(%02x%02xh), hl", 3 },
    { "inc\thl",             1 },
    { "inc\th",              1 },
    { "dec\th",              1 },
    { "ld\th, ",             2 },
    { "daa",                 1 },
    { "jr\tz, ",             2 },
    { "add\thl, hl",         1 },
    { "ld\thl, (%02x%02xh)", 3 },
    { "dec\thl",             1 },
    { "inc\tl",              1 },
    { "dec\tl",              1 },
    { "ld\tl, ",             2 },
    { "cpl",                 1 },
    { "jr\tnc, ",            2 },
    { "ld\tsp, ",            3 },
    { "ld\t(%02x%02xh), a",  3 },
    { "inc\tsp",             1 },
    { "inc\t(hl)",           1 },
    { "dec\t(hl)",           1 },
    { "ld\t(hl), ",          2 },
    { "scf",                 1 },
    { "jr\tc, ",             2 },
    { "add\thl, sp",         1 },
    { "ld\ta, (%02x%02xh)",  3 },
    { "dec\tsp",             1 },
    { "inc\ta",              1 },
    { "dec\ta",              1 },
    { "ld\ta, ",             2 },
    { "ccf",                 1 },
    { "ld\tb, b",            1 },
    { "ld\tb, c",            1 },
    { "ld\tb, d",            1 },
    { "ld\tb, e",            1 },
    { "ld\tb, h",            1 },
    { "ld\tb, l",            1 },
    { "ld\tb, (hl)",         1 },
    { "ld\tb, a",            1 },
    { "ld\tc, b",            1 },
    { "ld\tc, c",            1 },
    { "ld\tc, d",            1 },
    { "ld\tc, e",            1 },
    { "ld\tc, h",            1 },
    { "ld\tc, l",            1 },
    { "ld\tc, (hl)",         1 },
    { "ld\tc, a",            1 },
    { "ld\td, b",            1 },
    { "ld\td, c",            1 },
    { "ld\td, d",            1 },
    { "ld\td, e",            1 },
    { "ld\td, h",            1 },
    { "ld\td, l",            1 },
    { "ld\td, (hl)",         1 },
    { "ld\td, a",            1 },
    { "ld\te, b",            1 },
    { "ld\te, c",            1 },
    { "ld\te, d",            1 },
    { "ld\te, e",            1 },
    { "ld\te, h",            1 },
    { "ld\te, l",            1 },
    { "ld\te, (hl)",         1 },
    { "ld\te, a",            1 },
    { "ld\th, b",            1 },
    { "ld\th, c",            1 },
    { "ld\th, d",            1 },
    { "ld\th, e",            1 },
    { "ld\th, h",            1 },
    { "ld\th, l",            1 },
    { "ld\th, (hl)",         1 },
    { "ld\th, a",            1 },
    { "ld\tl, b",            1 },
    { "ld\tl, c",            1 },
    { "ld\tl, d",            1 },
    { "ld\tl, e",            1 },
    { "ld\tl, h",            1 },
    { "ld\tl, l",            1 },
    { "ld\tl, (hl)",         1 },
    { "ld\tl, a",            1 },
    { "ld\t(hl), b",         1 },
    { "ld\t(hl), c",         1 },
    { "ld\t(hl), d",         1 },
    { "ld\t(hl), e",         1 },
    { "ld\t(hl), h",         1 },
    { "ld\t(hl), l",         1 },
    { "halt",                1 },
    { "ld\t(hl), a",         1 },
    { "ld\ta, b",            1 },
    { "ld\ta, c",            1 },
    { "ld\ta, d",            1 },
    { "ld\ta, e",            1 },
    { "ld\ta, h",            1 },
    { "ld\ta, l",            1 },
    { "ld\ta, (hl)",         1 },
    { "ld\ta, a",            1 },
    { "add\ta, b",           1 },
    { "add\ta, c",           1 },
    { "add\ta, d",           1 },
    { "add\ta, e",           1 },
    { "add\ta, h",           1 },
    { "add\ta, l",           1 },
    { "add\ta, (hl)",        1 },
    { "add\ta, a",           1 },
    { "adc\ta, b",           1 },
    { "adc\ta, c",           1 },
    { "adc\ta, d",           1 },
    { "adc\ta, e",           1 },
    { "adc\ta, h",           1 },
    { "adc\ta, l",           1 },
    { "adc\ta, (hl)",        1 },
    { "adc\ta, a",           1 },
    { "sub\tb",              1 },
    { "sub\tc",              1 },
    { "sub\td",              1 },
    { "sub\te",              1 },
    { "sub\th",              1 },
    { "sub\tl",              1 },
    { "sub\t(hl)",           1 },
    { "sub\ta",              1 },
    { "sbc\ta, b",           1 },
    { "sbc\ta, c",           1 },
    { "sbc\ta, d",           1 },
    { "sbc\ta, e",           1 },
    { "sbc\ta, h",           1 },
    { "sbc\ta, l",           1 },
    { "sbc\ta, (hl)",        1 },
    { "sbb\ta, a",           1 },
    { "and\tb",              1 },
    { "and\tc",              1 },
    { "and\td",              1 },
    { "and\te",              1 },
    { "and\th",              1 },
    { "and\tl",              1 },
    { "and\t(hl)",           1 },
    { "and\ta",              1 },
    { "xor\tb",              1 },
    { "xor\tc",              1 },
    { "xor\td",              1 },
    { "xor\te",              1 },
    { "xor\th",              1 },
    { "xor\tl",              1 },
    { "xor\t(hl)",           1 },
    { "xor\ta",              1 },
    { "or\tb",               1 },
    { "or\tc",               1 },
    { "or\td",               1 },
    { "or\te",               1 },
    { "or\th",               1 },
    { "or\tl",               1 },
    { "or\t(hl)",            1 },
    { "or\ta",               1 },
    { "cp\tb",               1 },
    { "cp\tc",               1 },
    { "cp\td",               1 },
    { "cp\te",               1 },
    { "cp\th",               1 },
    { "cp\tl",               1 },
    { "cp\t(hl)",            1 },
    { "cp\ta",               1 },
    { "ret\tnz",             1 },
    { "pop\tbc",             1 },
    { "jp\tnz, ",            3 },
    { "jp\t",                3 },
    { "call\t nz, ",         3 },
    { "push\tbc",            1 },
    { "add\ta, ",            2 },
    { "rst\t00h",            1 },
    { "ret\tz",              1 },
    { "ret",                 1 },
    { "jp\tz, ",             3 },
    { "xxBITxx",             2 },
    { "call\tz, ",           3 },
    { "call\t",              3 },
    { "adc\ta, ",            2 },
    { "rst\t08h",            1 },
    { "ret\tnc",             1 },
    { "pop\tde",             1 },
    { "jp\tnc, ",            3 },
    { "out\t(%02xh), a",     2 },
    { "call\tnc, ",          3 },
    { "push\tde",            1 },
    { "sub\t",               2 },
    { "rst\t10h",            1 },
    { "ret\tc",              1 },
    { "exx",                 1 },
    { "jp\tc, ",             3 },
    { "in\ta, (%02xh)",      2 },
    { "call\tc, ",           3 },
    { "xxIXxx",              1 },
    { "sbc\ta, ",            2 },
    { "rst\t18h",            1 },
    { "ret\tpo",             1 },
    { "pop\thl",             1 },
    { "jp\tpo, ",            3 },
    { "ex\t(sp), hl",        1 },
    { "call\tpo, ",          3 },
    { "push\thl",            1 },
    { "and\t",               2 },
    { "rst\t20h",            1 },
    { "ret\tpe",             1 },
    { "jp\t(hl)",            1 },
    { "jp\tpe, ",            3 },
    { "ex\tde, hl",          1 },
    { "call\tpe, ",          3 },
    { "xx80xx",              1 },
    { "xor\t",               2 },
    { "rst\t28h",            1 },
    { "ret\tp",              1 },
    { "pop\taf",             1 },
    { "jp\tp, ",             3 },
    { "di",                  1 },
    { "call\tp, ",           3 },
    { "push\taf",            1 },
    { "or\t",                2 },
    { "rst\t30h",            1 },
    { "ret\tm",              1 },
    { "ld\tsp, hl",          1 },
    { "jp\tm, ",             3 },
    { "ei",                  1 },
    { "call\tm, ",           3 },
    { "xxIYxx",              1 },
    { "cp\t",                2 },
    { "rst\t38h",            1 }
];

/**
 * CB table of Z80 instructions.
 * n = 0 because all instructions in this table are
 *   2 bytes in length and we handle that in the
 *   primary table.
 */
immutable z80[] insnz80cb = [
    { "rlc\tb",       0 },
    { "rlc\tc",       0 },
    { "rlc\td",       0 },
    { "rlc\te",       0 },
    { "rlc\th",       0 },
    { "rlc\tl",       0 },
    { "rlc\t(hl)",    0 },
    { "rlc\ta",       0 },
    { "rrc\tb",       0 },
    { "rrc\tc",       0 },
    { "rrc\td",       0 },
    { "rrc\te",       0 },
    { "rrc\th",       0 },
    { "rrc\tl",       0 },
    { "rrc\t(hl)",    0 },
    { "rrc\ta",       0 },
    { "rl\tb",        0 },
    { "rl\tc",        0 },
    { "rl\td",        0 },
    { "rl\te",        0 },
    { "rl\th",        0 },
    { "rl\tl",        0 },
    { "rl\t(hl)",     0 },
    { "rl\ta",        0 },
    { "rr\tb",        0 },
    { "rr\tc",        0 },
    { "rr\td",        0 },
    { "rr\te",        0 },
    { "rr\th",        0 },
    { "rr\tl",        0 },
    { "rr\t(hl)",     0 },
    { "rr\ta",        0 },
    { "sla\tb",       0 },
    { "sla\tc",       0 },
    { "sla\td",       0 },
    { "sla\te",       0 },
    { "sla\th",       0 },
    { "sla\tl",       0 },
    { "sla\t(hl)",    0 },
    { "sla\ta",       0 },
    { "sra\tb",       0 },
    { "sra\tc",       0 },
    { "sra\td",       0 },
    { "sra\te",       0 },
    { "sra\th",       0 },
    { "sra\tl",       0 },
    { "sra\t(hl)",    0 },
    { "sra\ta",       0 },
    { "slr\tb",       0 },
    { "slr\tc",       0 },
    { "slr\td",       0 },
    { "slr\te",       0 },
    { "slr\th",       0 },
    { "slr\tl",       0 },
    { "slr\t(hl)",    0 },
    { "slr\ta",       0 },
    { "srr\tb",       0 },
    { "srr\tc",       0 },
    { "srr\td",       0 },
    { "srr\te",       0 },
    { "srr\th",       0 },
    { "srr\tl",       0 },
    { "srr\t(hl)",    0 },
    { "srr\ta",       0 },
    { "bit\t0, b",    0 },
    { "bit\t0, c",    0 },
    { "bit\t0, d",    0 },
    { "bit\t0, e",    0 },
    { "bit\t0, h",    0 },
    { "bit\t0, l",    0 },
    { "bit\t0, (hl)", 0 },
    { "bit\t0, a",    0 },
    { "bit\t1, b",    0 },
    { "bit\t1, c",    0 },
    { "bit\t1, d",    0 },
    { "bit\t1, e",    0 },
    { "bit\t1, h",    0 },
    { "bit\t1, l",    0 },
    { "bit\t1, (hl)", 0 },
    { "bit\t1, a",    0 },
    { "bit\t2, b",    0 },
    { "bit\t2, c",    0 },
    { "bit\t2, d",    0 },
    { "bit\t2, e",    0 },
    { "bit\t2, h",    0 },
    { "bit\t2, l",    0 },
    { "bit\t2, (hl)", 0 },
    { "bit\t2, a",    0 },
    { "bit\t3, b",    0 },
    { "bit\t3, c",    0 },
    { "bit\t3, d",    0 },
    { "bit\t3, e",    0 },
    { "bit\t3, h",    0 },
    { "bit\t3, l",    0 },
    { "bit\t3, (hl)", 0 },
    { "bit\t3, a",    0 },
    { "bit\t4, b",    0 },
    { "bit\t4, c",    0 },
    { "bit\t4, d",    0 },
    { "bit\t4, e",    0 },
    { "bit\t4, h",    0 },
    { "bit\t4, l",    0 },
    { "bit\t4, (hl)", 0 },
    { "bit\t4, a",    0 },
    { "bit\t5, b",    0 },
    { "bit\t5, c",    0 },
    { "bit\t5, d",    0 },
    { "bit\t5, e",    0 },
    { "bit\t5, h",    0 },
    { "bit\t5, l",    0 },
    { "bit\t5, (hl)", 0 },
    { "bit\t5, a",    0 },
    { "bit\t6, b",    0 },
    { "bit\t6, c",    0 },
    { "bit\t6, d",    0 },
    { "bit\t6, e",    0 },
    { "bit\t6, h",    0 },
    { "bit\t6, l",    0 },
    { "bit\t6, (hl)", 0 },
    { "bit\t6, a",    0 },
    { "bit\t7, b",    0 },
    { "bit\t7, c",    0 },
    { "bit\t7, d",    0 },
    { "bit\t7, e",    0 },
    { "bit\t7, h",    0 },
    { "bit\t7, l",    0 },
    { "bit\t7, (hl)", 0 },
    { "bit\t7, a",    0 },
    { "res\t0, b",    0 },
    { "res\t0, c",    0 },
    { "res\t0, d",    0 },
    { "res\t0, e",    0 },
    { "res\t0, h",    0 },
    { "res\t0, l",    0 },
    { "res\t0, (hl)", 0 },
    { "res\t0, a",    0 },
    { "res\t1, b",    0 },
    { "res\t1, c",    0 },
    { "res\t1, d",    0 },
    { "res\t1, e",    0 },
    { "res\t1, h",    0 },
    { "res\t1, l",    0 },
    { "res\t1, (hl)", 0 },
    { "res\t1, a",    0 },
    { "res\t2, b",    0 },
    { "res\t2, c",    0 },
    { "res\t2, d",    0 },
    { "res\t2, e",    0 },
    { "res\t2, h",    0 },
    { "res\t2, l",    0 },
    { "res\t2, (hl)", 0 },
    { "res\t2, a",    0 },
    { "res\t3, b",    0 },
    { "res\t3, c",    0 },
    { "res\t3, d",    0 },
    { "res\t3, e",    0 },
    { "res\t3, h",    0 },
    { "res\t3, l",    0 },
    { "res\t3, (hl)", 0 },
    { "res\t3, a",    0 },
    { "res\t4, b",    0 },
    { "res\t4, c",    0 },
    { "res\t4, d",    0 },
    { "res\t4, e",    0 },
    { "res\t4, h",    0 },
    { "res\t4, l",    0 },
    { "res\t4, (hl)", 0 },
    { "res\t4, a",    0 },
    { "res\t5, b",    0 },
    { "res\t5, c",    0 },
    { "res\t5, d",    0 },
    { "res\t5, e",    0 },
    { "res\t5, h",    0 },
    { "res\t5, l",    0 },
    { "res\t5, (hl)", 0 },
    { "res\t5, a",    0 },
    { "res\t6, b",    0 },
    { "res\t6, c",    0 },
    { "res\t6, d",    0 },
    { "res\t6, e",    0 },
    { "res\t6, h",    0 },
    { "res\t6, l",    0 },
    { "res\t6, (hl)", 0 },
    { "res\t6, a",    0 },
    { "res\t7, b",    0 },
    { "res\t7, c",    0 },
    { "res\t7, d",    0 },
    { "res\t7, e",    0 },
    { "res\t7, h",    0 },
    { "res\t7, l",    0 },
    { "res\t7, (hl)", 0 },
    { "res\t7, a",    0 },
    { "set\t0, c",    0 },
    { "set\t0, d",    0 },
    { "set\t0, e",    0 },
    { "set\t0, h",    0 },
    { "set\t0, l",    0 },
    { "set\t0, (hl)", 0 },
    { "set\t0, a",    0 },
    { "set\t1, b",    0 },
    { "set\t1, c",    0 },
    { "set\t1, d",    0 },
    { "set\t1, e",    0 },
    { "set\t1, h",    0 },
    { "set\t1, l",    0 },
    { "set\t1, (hl)", 0 },
    { "set\t1, a",    0 },
    { "set\t2, b",    0 },
    { "set\t2, c",    0 },
    { "set\t2, d",    0 },
    { "set\t2, e",    0 },
    { "set\t2, h",    0 },
    { "set\t2, l",    0 },
    { "set\t2, (hl)", 0 },
    { "set\t2, a",    0 },
    { "set\t3, b",    0 },
    { "set\t3, c",    0 },
    { "set\t3, d",    0 },
    { "set\t3, e",    0 },
    { "set\t3, h",    0 },
    { "set\t3, l",    0 },
    { "set\t3, (hl)", 0 },
    { "set\t3, a",    0 },
    { "set\t4, b",    0 },
    { "set\t4, c",    0 },
    { "set\t4, d",    0 },
    { "set\t4, e",    0 },
    { "set\t4, h",    0 },
    { "set\t4, l",    0 },
    { "set\t4, (hl)", 0 },
    { "set\t4, a",    0 },
    { "set\t5, b",    0 },
    { "set\t5, c",    0 },
    { "set\t5, d",    0 },
    { "set\t5, e",    0 },
    { "set\t5, h",    0 },
    { "set\t5, l",    0 },
    { "set\t5, (hl)", 0 },
    { "set\t5, a",    0 },
    { "set\t6, b",    0 },
    { "set\t6, c",    0 },
    { "set\t6, d",    0 },
    { "set\t6, e",    0 },
    { "set\t6, h",    0 },
    { "set\t6, l",    0 },
    { "set\t6, (hl)", 0 },
    { "set\t6, a",    0 },
    { "set\t7, b",    0 },
    { "set\t7, c",    0 },
    { "set\t7, d",    0 },
    { "set\t7, e",    0 },
    { "set\t7, h",    0 },
    { "set\t7, l",    0 },
    { "set\t7, (hl)", 0 },
    { "set\t7, a",    0 },
];
