import std.stdio;
import std.file;
import std.getopt;
import d80.i80;
import d80.z80;

version (OpenBSD)
{
    import core.sys.openbsd.unistd;
}

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
        case 0xdd:      /// DD table
            switch (b[a + 1]) {
            case 0x21:
            case 0x22:
            case 0x2a:
            case 0x36:
                writef(insnz80dd[b[a + 1]].s, b[a + 3], b[a + 2]);
                a += insnz80dd[b[a + 1]].n;
                break;
            case 0x26:
            case 0x2e:
            case 0x34:
            case 0x35:
            case 0x46:
            case 0x4e:
            case 0x56:
            case 0x5e:
            case 0x66:
            case 0x6e:
            case 0x70:
            case 0x71:
            case 0x72:
            case 0x73:
            case 0x74:
            case 0x75:
            case 0x77:
            case 0x7e:
            case 0x86:
            case 0x8e:
            case 0x96:
            case 0x9e:
            case 0xa6:
            case 0xae:
            case 0xb6:
            case 0xbe:
                writef(insnz80dd[b[a + 1]].s, b[a + 2]);
                a += insnz80dd[b[a + 1]].n;
                break;
            case 0xcb:  /// DDCB table
                writef(insnz80ddcb[b[a + 3]].s, b[a + 2]);
                a += insnz80ddcb[b[a + 3]].n;
                break;
            default:
                writef("%s", insnz80dd[b[a + 1]].s);
            }
            break;
        case 0xed:      /// ED table
            switch (b[a + 1]) {
            case 0x43:
            case 0x4b:
            case 0x53:
            case 0x5b:
            case 0x63:
            case 0x6b:
            case 0x73:
            case 0x7b:
                writef(insnz80ed[b[a + 1]].s, b[a + 3], b[a + 2]);
                a += insnz80ed[b[a + 1]].n;
                break;
            default:
                writef("%s", insnz80ed[b[a + 1]].s);
            }
            break;
        case 0xfd:      /// FD table
            switch (b[a + 1]) {
            case 0x21:
            case 0x22:
            case 0x2a:
            case 0x36:
                writef(insnz80fd[b[a + 1]].s, b[a + 3], b[a + 2]);
                a += insnz80fd[b[a + 1]].n;
                break;
            case 0x26:
            case 0x2e:
            case 0x34:
            case 0x35:
            case 0x46:
            case 0x4e:
            case 0x56:
            case 0x5e:
            case 0x66:
            case 0x6e:
            case 0x70:
            case 0x71:
            case 0x72:
            case 0x73:
            case 0x74:
            case 0x75:
            case 0x77:
            case 0x7e:
            case 0x86:
            case 0x8e:
            case 0x96:
            case 0x9e:
            case 0xa6:
            case 0xae:
            case 0xb6:
            case 0xbe:
                writef(insnz80fd[b[a + 1]].s, b[a + 2]);
                a += insnz80fd[b[a + 1]].n;
                break;
            case 0xcb:  /// FDCB table
                writef(insnz80fdcb[b[a + 3]].s, b[a + 2]);
                a += insnz80fdcb[b[a + 3]].n;
                break;
            default:
                writef("%s", insnz80fd[b[a + 1]].s);
            }
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

    version (OpenBSD)
    {
        if (pledge("stdio rpath", null) == -1) {
            stderr.writeln("pledge");
            return;
        }
    }

    auto Option = getopt(args, "cpu|c", &cpu);

    if (Option.helpWanted || args.length != 2) {
        stderr.writeln("usage: d80 [-c cpu] file");
        return;
    }

    ubyte[] b = cast(ubyte[])read(args[1]);

    version (OpenBSD)
    {
        if (pledge("stdio", null) == -1) {
            stderr.writeln("pledge");
            return;
        }
    }

    if (cpu == cpu.i80)
        disi80(b);
    else
        disz80(b);
}
