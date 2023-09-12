# Computer architecture

```{admonition} Relevant Reading
:class: tip

This lecture will cover sections 5.1 through 5.4 
from [Chapter 5](https://diveintosystems.org/book/C5-Arch/index.html) of the book. 

```

## 1. In the beginning ...

- `computer` = `the one who computes`

### Origin of modern computing architectures

- Jacquard Loom

<iframe width="560" height="315" src="https://www.youtube.com/embed/MQzpLLhN0fY" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

- Charles Babbage's Analytical Machine

<iframe width="560" height="315" src="https://www.youtube.com/embed/XSkGY6LchJs" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

- Hollerith Census Machine (eventually becomes IBM)

<iframe width="560" height="315" src="https://www.youtube.com/embed/9HXjLW7v-II" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

- ENIAC: First computer

<iframe width="560" height="315" src="https://www.youtube.com/embed/k4oGI_dNaPc" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

### Modern computer architecture

- von Neuman architecture
  - General purpose
  - A binary computer instead of a decimal computer
  - Stored-program

## 2. Logic Gates

- Building blocks of the digital circuitry that implements arithmetic, 
control, and storage functionality in a digital computer.
- Logic gates are created from transistors that are etched into a 
semiconductor material (e.g. silicon chips). 
- Transistors act as switches that control electrical flow through the chip. 
A transistor can switch its state between on or off (between a high or low 
voltage output). Its output state depends on its current state plus its input 
state (high or low voltage).

### 2.1 Basic Logic Gates

- AND, OR, and NOT form a set of basic logic gates from which 
any circuit can be constructed. 


```{admonition} Truth table for AND, OR, and NOT 

| A | B | A AND B  | A OR B  | NOT A | NOT B |
| - | - | -------- | ------- | ----- | ----- | 
| 0 | 0 | 0        | 0       | 1     | 1     |
| 0 | 1 | 0        | 1       | 1     | 0     |
| 1 | 0 | 0        | 1       | 0     | 1     |
| 1 | 1 | 1        | 1       | 0     | 0     |  

```

