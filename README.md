d80
===
`d80` is an Intel 8080/Zilog Z80 disassembler.
Supports the entire i80 instruction set and the primary and CB Z80 tables
only (for now).

Usage
-----
```
d80 [-c cpu] file
```
Values for `cpu` are `i80` and `z80`, defaulting to `z80` if no option given.

Caveats
-------
`d80` cannot tell the difference between instructions and data bytes.
This might result in incorrect disassembly, depending on the values of those
data bytes.

License
-------
ISC License. See `LICENSE` for details.
