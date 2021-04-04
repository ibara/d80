import std.stdio;
import std.file;
import d80.i80;

void main(string[] args)
{
    if (args.length != 2) {
        stderr.writeln("usage: d80 file");
        return;
    }

    ubyte[] b = cast(ubyte[])read(args[1]);

    auto a = 0;
    while (a < b.length) {
        writef("%04x\t%s", a, insns[b[a]].s);
        if (insns[b[a]].n > 1) {
            if (insns[b[a]].n == 3)
                writef("%02x", b[a + 2]);
            writef("%02xh", b[a + 1]);
        }
        writeln();

        a += insns[b[a]].n;
    }
}
