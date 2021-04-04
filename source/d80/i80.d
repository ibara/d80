module d80.i80;

/**
 * Strings and instruction lengths for Intel 8080.
 */
struct i80 {
    string s;           /// Instruction name
    ubyte n;            /// Length of instruction in bytes
}

/**
 * Table of Intel 8080 instructions.
 */
i80[] insni80 = [
    { "nop",       1 },
    { "lxi\tb, ",  3 },
    { "stax\tb",   1 },
    { "inx\tb",    1 },
    { "inr\tb",    1 },
    { "dcr",       1 },
    { "mvi\tb, ",  2 },
    { "rlc",       1 },
    { "nop",       1 },
    { "dad",       1 },
    { "ldax\tb",   1 },
    { "dcx\tb",    1 },
    { "inr\tc",    1 },
    { "dcr\tc",    1 },
    { "mvi\tc, ",  2 },
    { "rrc",       1 },
    { "nop",       1 },
    { "lxi\td, ",  3 },
    { "stax\td",   1 },
    { "inx\td",    1 },
    { "inr\td",    1 },
    { "dcr\td",    1 },
    { "mvi\td, ",  2 },
    { "ral",       1 },
    { "nop",       1 },
    { "dad\td",    1 },
    { "ldax\td",   1 },
    { "dcx\td" ,   1 },
    { "inr\te",    1 },
    { "dcr\te",    1 },
    { "mvi\te, ",  2 },
    { "rar",       1 },
    { "nop",       1 },
    { "lxi\th, ",  3 },
    { "shld\t",    3 },
    { "inx\th",    1 },
    { "inr\th",    1 },
    { "dcr\th",    1 },
    { "mvi\th, ",  2 },
    { "daa",       1 },
    { "nop",       1 },
    { "dad\th",    1 },
    { "lhld\t",    3 },
    { "dcx\th",    1 },
    { "inr\tl",    1 },
    { "dcr\tl",    1 },
    { "mvi\tl, ",  2 },
    { "cma",       1 },
    { "nop",       1 },
    { "lxi\tsp, ", 3 },
    { "sta\t",     3 },
    { "inx\tsp",   1 },
    { "inr\tm",    1 },
    { "dcr\tm",    1 },
    { "mvi\tm, ",  2 },
    { "stc",       1 },
    { "nop",       1 },
    { "dad\tsp",   1 },
    { "lda\t",     3 },
    { "dcx\tsp",   1 },
    { "inr\ta",    1 },
    { "dcr\ta",    1 },
    { "mvi\ta, ",  2 },
    { "cmc",       1 },
    { "mov\tb, b", 1 },
    { "mov\tb, c", 1 },
    { "mov\tb, d", 1 },
    { "mov\tb, e", 1 },
    { "mov\tb, h", 1 },
    { "mov\tb, l", 1 },
    { "mov\tb, m", 1 },
    { "mov\tb, a", 1 },
    { "mov\tc, b", 1 },
    { "mov\tc, c", 1 },
    { "mov\tc, d", 1 },
    { "mov\tc, e", 1 },
    { "mov\tc, h", 1 },
    { "mov\tc, l", 1 },
    { "mov\tc, m", 1 },
    { "mov\tc, a", 1 },
    { "mov\td, b", 1 },
    { "mov\td, c", 1 },
    { "mov\td, d", 1 },
    { "mov\td, e", 1 },
    { "mov\td, h", 1 },
    { "mov\td, l", 1 },
    { "mov\td, m", 1 },
    { "mov\td, a", 1 },
    { "mov\te, b", 1 },
    { "mov\te, c", 1 },
    { "mov\te, d", 1 },
    { "mov\te, e", 1 },
    { "mov\te, h", 1 },
    { "mov\te, l", 1 },
    { "mov\te, m", 1 },
    { "mov\te, a", 1 },
    { "mov\th, b", 1 },
    { "mov\th, c", 1 },
    { "mov\th, d", 1 },
    { "mov\th, e", 1 },
    { "mov\th, h", 1 },
    { "mov\th, l", 1 },
    { "mov\th, m", 1 },
    { "mov\th, a", 1 },
    { "mov\tl, b", 1 },
    { "mov\tl, c", 1 },
    { "mov\tl, d", 1 },
    { "mov\tl, e", 1 },
    { "mov\tl, h", 1 },
    { "mov\tl, l", 1 },
    { "mov\tl, m", 1 },
    { "mov\tl, a", 1 },
    { "mov\tm, b", 1 },
    { "mov\tm, c", 1 },
    { "mov\tm, d", 1 },
    { "mov\tm, e", 1 },
    { "mov\tm, h", 1 },
    { "mov\tm, l", 1 },
    { "hlt",       1 },
    { "mov\tm, a", 1 },
    { "mov\ta, b", 1 },
    { "mov\ta, c", 1 },
    { "mov\ta, d", 1 },
    { "mov\ta, e", 1 },
    { "mov\ta, h", 1 },
    { "mov\ta, l", 1 },
    { "mov\ta, m", 1 },
    { "mov\ta, a", 1 },
    { "add\tb",    1 },
    { "add\tc",    1 },
    { "add\td",    1 },
    { "add\te",    1 },
    { "add\th",    1 },
    { "add\tl",    1 },
    { "add\tm",    1 },
    { "add\ta",    1 },
    { "adc\tb",    1 },
    { "adc\tc",    1 },
    { "adc\td",    1 },
    { "adc\te",    1 },
    { "adc\th",    1 },
    { "adc\tl",    1 },
    { "adc\tm",    1 },
    { "adc\ta",    1 },
    { "sub\tb",    1 },
    { "sub\tc",    1 },
    { "sub\td",    1 },
    { "sub\te",    1 },
    { "sub\th",    1 },
    { "sub\tl",    1 },
    { "sub\tm",    1 },
    { "sub\ta",    1 },
    { "sbb\tb",    1 },
    { "sbb\tc",    1 },
    { "sbb\td",    1 },
    { "sbb\te",    1 },
    { "sbb\th",    1 },
    { "sbb\tl",    1 },
    { "sbb\tm",    1 },
    { "sbb\ta",    1 },
    { "ana\tb",    1 },
    { "ana\tc",    1 },
    { "ana\td",    1 },
    { "ana\te",    1 },
    { "ana\th",    1 },
    { "ana\tl",    1 },
    { "ana\tm",    1 },
    { "ana\ta",    1 },
    { "xra\tb",    1 },
    { "xra\tc",    1 },
    { "xra\td",    1 },
    { "xra\te",    1 },
    { "xra\th",    1 },
    { "xra\tl",    1 },
    { "xra\tm",    1 },
    { "xra\ta",    1 },
    { "ora\tb",    1 },
    { "ora\tc",    1 },
    { "ora\td",    1 },
    { "ora\te",    1 },
    { "ora\th",    1 },
    { "ora\tl",    1 },
    { "ora\tm",    1 },
    { "ora\ta",    1 },
    { "cmp\tb",    1 },
    { "cmp\tc",    1 },
    { "cmp\td",    1 },
    { "cmp\te",    1 },
    { "cmp\th",    1 },
    { "cmp\tl",    1 },
    { "cmp\tm",    1 },
    { "cmp\ta",    1 },
    { "rnz",       1 },
    { "pop\tb",    1 },
    { "jnz\t",     3 },
    { "jmp\t",     3 },
    { "cnz\t",     3 },
    { "push\tb",   1 },
    { "adi\t",     2 },
    { "rst\t0",    1 },
    { "rz",        1 },
    { "ret",       1 },
    { "jz\t",      3 },
    { "jmp\t",     3 },
    { "cz\t",      3 },
    { "call\t",    3 },
    { "aci\t",     2 },
    { "rst\t1",    1 },
    { "rnc",       1 },
    { "pop\td",    1 },
    { "jnc\t",     3 },
    { "out\t",     2 },
    { "cnc\t",     3 },
    { "push\td",   1 },
    { "sui\t",     2 },
    { "rst\t2",    1 },
    { "rc",        1 },
    { "ret",       1 },
    { "jc\t",      3 },
    { "in\t",      2 },
    { "cc\t",      3 },
    { "call\t",    3 },
    { "sbi\t",     2 },
    { "rst\t3",    1 },
    { "rpo",       1 },
    { "pop\th",    1 },
    { "jpo\t",     3 },
    { "xthl",      1 },
    { "cpo\t",     3 },
    { "push\th",   1 },
    { "ani\t",     2 },
    { "rst\t4",    1 },
    { "rpe",       1 },
    { "pchl",      1 },
    { "jpe\t",     3 },
    { "xchg",      1 },
    { "cpe\t",     3 },
    { "call\t",    3 },
    { "xri\t",     2 },
    { "rst\t5",    1 },
    { "rp",        1 },
    { "pop\tpsw",  1 },
    { "jp\t",      3 },
    { "di",        1 },
    { "cp\t",      3 },
    { "push\tpsw", 1 },
    { "ori\t",     2 },
    { "rst\t6",    1 },
    { "rm",        1 },
    { "sphl",      1 },
    { "jm\t",      3 },
    { "ei",        1 },
    { "cm\t",      3 },
    { "call\t",    3 },
    { "cpi\t",     2 },
    { "rst\t7",    1 }
];
