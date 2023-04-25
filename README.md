## A Harvard-structure CPU which supports 31 Mips instructions

```mermaid
flowchart LR
a[NPC]-->c[pc]
c-->a
c-->d[IMEM]
e[Regfile]-->f[ALU]
f-->e
```

