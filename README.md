d80
===
`d80` is an Intel 8080/Zilog Z80 disassembler.
Supports the entire i80 and Z80 instruction sets.

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

Bugs
----
Found a bug? Want some additional feature? Open an Issue or Pull Request.

License
-------
ISC License. See `LICENSE` for details.
