---
title: "Machine language and debugging"
teaching: 0
exercises: 0
questions:
- "Getting closer to the hardware via machine languages"
objectives:
- "First learning objective. (FIXME)"
keypoints:
- "First key point. Brief Answer to questions. (FIXME)"
---


> ## 1. Intel x86 processors
> - Dominate laptop/desktop/server market
> - Evolutionary design
>   - Backwards compatible up until 8086, introduced in 1978
>   - Added more features as time goes on
> - x86 is a Complex Instruction Set Computer (CISC)
>   - Many different instructions with many different formats
>   - But, only small subset encountered with Linux programs
> - Compare: Reduced Instruction Set Computer (RISC)
>   - RISC: *very few* instructions, with *very few* modes for each
>   - RISC can be quite fast (but Intel still wins on speed!)
>   - Current RISC renaissance (e.g., ARM, RISC V), especially for low-power
{: .slide}


> ## 2. Intel x86 processors: machine evolution
>
> | Name            | Date | Transistor Counts |  
> | --------------- | ---- | ----------------- |  
> | 386             | 1985 | 0.3M              |   
> | Pentium         | 1993 | 3.1M              |  
> | Pentium/MMX     | 1997 | 4.5M              |  
> | Pentium Pro     | 1995 | 6.5M              |  
> | Pentium III     | 1999 | 8.2M              |  
> | Pentium 4       | 2000 | 42M               |  
> | Core 2 Duo      | 2006 | 291M              |  
> | Core i7         | 2000 | 42M               |  
> | Core i7 Skylake | 2006 | 291M              |  
>
>
> - Added features
>   - Instructions to support multimedia operations
>   - Instructions to enable more efficient conditional operations (**!**)
>   - Transition from 32 bits to 64 bits
>   - More cores
{: .slide}


> ## 3. x86 clones: Advanced Micro Devices (AMD)
> - Historically
>   - AMD has followed just behind Intel
>   - A little bit slower, a lot cheaper
> - Then
>   - Recruited top circuit designers from Digital Equipment Corp. 
>   and other downward trending companies
>   - Built Opteron: tough competitor to Pentium 4
>   - Developed x86-64, their own extension to 64 bits
> - Recent Years
>   - Intel got its act together
>     - 1995-2011: Lead semiconductor “fab” in world
>     - 2018: #2 largest by $$ (#1 is Samsung)
>     - 2019: reclaimed #1
> - AMD fell behind
>   - Relies on external semiconductor manufacturer GlobalFoundaries
>   - ca. 2019 CPUs (e.g., Ryzen) are competitive again
>   - 2020 Epyc
> 
> <img src="../fig/04-machine/01.jpeg" alt="amd trolls intel 1" style="height:300px">
> <img src="../fig/04-machine/02.jpeg" alt="amd trolls intel 2" style="height:300px">
{: .slide}


> ## 4. Machine programming: levels of abstraction
>
> <img src="../fig/04-machine/03.png" alt="levels of abstraction" style="height:300px">
>
> - `Architecture`: (also `ISA`: instruction set architecture) The parts of a processor 
> design that one needs to understand for writing correct machine/assembly code
>   - Examples:  instruction set specification, registers
>   - `Machine Code`: The byte-level programs that a processor executes
>   - `Assembly Code`: A text representation of machine code
> - `Microarchitecture`: Implementation of the architecture
>   - Examples: cache sizes and core frequency
> - Example ISAs: 
>   - Intel: x86, IA32, Itanium, x86-64
>   - ARM: Used in almost all mobile phones
>   - RISC V: New open-source ISA
{: .slide}


> ## 5. Assembly/Machine code view
>
> - Machine code (Assembly code) differs greatly from the original C code. 
> - Parts of processor state that are not visible/accessible from C programs 
> are now visible. 
>   - PC: Program counter
>     - Contains address of next instruction
>     - Called `%rip` (instruction pointer register)
>   - Register file
>     - contains 16 named locations (registers), each can store 64-bit values. 
>     - These registers can hold addresses (~ C pointers) or integer data. 
>   - Condition codes
>     - Store status information about most recent arithmetic or 
>     logical operation
>     - Used for conditional branching (`if`/`while`)
>   - Vector registers to hold one or more integers or floating-point values. 
>   - Memory
>     - Is seen  as a byte-addressable array
>     - Contains code and user data
>     - Stack to support procedures
>
>
> <img src="../fig/04-machine/04.png" alt="Assembly programmer" style="height:300px">
>
{: .slide}


> ## 6. Hands on: assembly/machine code example
>
> - In your home directory, create a directory called `04-machine` and change into this directory.
> - Create a file named `mstore.c` with the following contents:
>
> <script src="https://gist.github.com/linhbngo/d1e9336a82632c528ea797210ed0f553.js?file=mstore.c"></script>
>
> - Run the following commands 
> *It is capital o, not number 0*
>
> ~~~
> $ gcc -Og -S mstore.c
> $ cat mstore.s
> $ gcc -Og -c mstore.c
> $ objdump -d mstore.o
> ~~~
> {: .language-bash}
>
> <img src="../fig/04-machine/05.png" alt="Assembler code" style="height:700px">
>
> - x86_64 instructions range in length from 1 to 15 bytes
> - The disassembler determines the assembly code based purely on the 
> byte-sequence in the machine-code file. 
> - All lines begin with `.`  are directirves to the assembler and linker. 
{: .slide}


> ## 7. Data format
>
> 
> | C data type | Intel data type  | Assembly-code suffix | Size  |  
> | ----------- | ---------------- | -------------------- | ----- |  
> | char        | Byte             | b                    | 1     |  
> | short       | Word             | w                    | 2     |  
> | int         | Double word      | l                    | 4     |  
> | long        | Quad word        | q                    | 8     |  
> | char *      | Quad word        | q                    | 8     |  
> | float       | Single precision | s                    | 4     |  
> | double      | Double precision | l                    | 8     |  
>
{: .slide}


> ## 8. Integer registers
>
> - x86_64 CPU contains a set of 16 `general purpose registers` storing 64-bit values.  
> - Original 8086 design has eight 16-bit registers, `%ax` through `%sp`. 
> - After IA32 extension, these registers grew to 32 bits, labeled `%eax` through `%esp`. 
> - After x86_64 extension, these registers were expanded to 64 bits, labeled `%rax` 
> through `%rsp`. Eight new registered were added: `%r8` through `%r15`. 
> - Instructions can operate on data of different sizes stored in low-order bytes of the
> 16 registers. 
>
> <img src="../fig/04-machine/06.png" alt="general purpose registers" style="height:800px">
> *Bryant and O' Hallaron, Computer Systems: A Programmer's Perspective, Third Edition*
{: .slide}


{% include links.md %}

