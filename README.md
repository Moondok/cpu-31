## A Harvard-structure CPU which supports 31 Mips instructions



### IO relationship for each instruction

| instruction |  PC  | NPC  | IMEM | RegFile  | ALU op1 | ALU op2 | Ex5-32  |
| :---------: | :--: | :--: | :--: | :------: | :-----: | :-----: | ------- |
|     add     | NPC  |  PC  |  PC  |   ALU    |   Rs    |   Rt    |         |
|    addu     | NPC  |  PC  |  PC  |   ALU    |   Rs    |   Rt    |         |
|     sub     | NPC  |  PC  |  PC  |   ALU    |   Rs    |   Rt    |         |
|    subu     | NPC  |  PC  |  PC  |   ALU    |   Rs    |   Rt    |         |
|     and     | NPC  |  PC  |  PC  |   ALU    |   Rs    |   Rt    |         |
|     or      | NPC  |  PC  |  PC  |   ALU    |   Rs    |   Rt    |         |
|     xor     | NPC  |  PC  |  PC  |   ALU    |   Rs    |   Rt    |         |
|     nor     | NPC  |  PC  |  PC  |   ALU    |   Rs    |   Rt    |         |
|     slt     | NPC  |  PC  |  PC  | ALU->MUX |   Rs    |   Rt    |         |
|    sltu     | NPC  |  PC  |  PC  | ALU->MUX |   Rs    |   Rt    |         |
|     sll     | NPC  |  PC  |  PC  |   ALU    | Ex5-16  |   Rt    | sa      |
|     srl     | NPC  |  PC  |  PC  |   ALU    | Ex5-16  |   Rt    | sa      |
|     sra     | NPC  |  PC  |  PC  |   ALU    | Ex5-16  |   Rt    | sa      |
|    sllv     | NPC  |  PC  |  PC  |   ALU    | Ex5-16  |   Rt    | Rs[4:0] |
|    srlv     | NPC  |  PC  |  PC  |   ALU    | Ex5-16  |   Rt    | Rs[4:0] |
|    srav     | NPC  |  PC  |  PC  |   ALU    | Ex5-16  |   Rt    | Rs[4:0] |
|     jr      |  Rs  |  PC  |  PC  |          |         |         |         |

+ some comments
  - ```slt```: we execute ```sub```  instruction in ALU, then use an ```mux``` to get the right answer for Rd , same for  ```sltu```.
  - ```sllv``` : though the value we get from ```Rs``` is already 32 bit , we want to restrain it to 0-31, so we pass the lowest 5 bits to ```Ext5-16```.



