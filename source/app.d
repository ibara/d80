import std.stdio;
import std.file;
import std.getopt;
import d80.i80;
import d80.z80;

enum CPU { z80, i80 };

static void disi80(ubyte[] b)
{
    auto a = 0;

    while (a < b.length) {
        writef("%04x\t%s", a, insni80[b[a]].s);
        if (insni80[b[a]].n > 1) {
            if (insni80[b[a]].n == 3)
                writef("%02x", b[a + 2]);
            writef("%02xh", b[a + 1]);
        }
        writeln();

        a += insni80[b[a]].n;
    }
}

static void disz80(ubyte[] b)
{
    auto a = 0;

    while (a < b.length) {
        writef("%04x\t", a);

        switch (b[a]) {
        case 0x22:
        case 0x2a:
        case 0x32:
        case 0x3a:
            writef(insnz80[b[a]].s, b[a + 2], b[a + 1]);
            break;
        case 0xcb:      /// CB table
            writef("%s", insnz80cb[b[a + 1]].s);
            break;
        case 0xd3:
        case 0xdb:
            writef(insnz80[b[a]].s, b[a + 1]);
            break;
        default:
            writef("%s", insnz80[b[a]].s);
            if (insnz80[b[a]].n > 1) {
                if (insnz80[b[a]].n == 3)
                    writef("%02x", b[a + 2]);
                writef("%02xh", b[a + 1]);
            }
        }
        writeln();

        a += insnz80[b[a]].n;
    }
}

void main(string[] args)
{
    CPU cpu;

    auto Option = getopt(args, "cpu|c", &cpu);

    if (Option.helpWanted || args.length != 2) {
        stderr.writeln("usage: d80 [-c cpu] file");
        return;
    }

    ubyte[] b = cast(ubyte[])read(args[1]);

    if (cpu == cpu.i80)
        disi80(b);
    else
        disz80(b);
}
