# Parameterizable LFSR Core

This project provides a simple, parameterizable **Linear Feedback Shift Register (LFSR)** implemented in Verilog. It is designed for generating pseudo-random binary sequences (PRBS) or m-sequences.

## Features

- **Parameterizable Width:** Easily adjust the bit-width ($N$) of the register.

- **Customizable Taps:** Configure the feedback polynomial using the `TAPS` parameter.

- **XNOR Feedback:** Uses an XNOR-based feedback path, which allows the register to safely start or recover from an "all-zeros" state.

- **Dual Output:** Provides both the parallel state (`q_out`) and the serial m-sequence bit (`m_seq`).

------

## Module Description

### Parameters

| **Parameter** | **Default Value** |                       **Description**                        |
| :-----------: | :---------------: | :----------------------------------------------------------: |
|      `N`      |       `10`        |          The number of bits in the shift register.           |
|    `TAPS`     |     `10'h240`     | A bitmask defining which bits are used in the feedback path. |

### Ports

| **Port** | **Direction** | **Width** |               **Description**                |
| :------: | :-----------: | :-------: | :------------------------------------------: |
|  `clk`   |     Input     |     1     |                System clock.                 |
| `rst_n`  |     Input     |     1     |        Asynchronous active-low reset.        |
| `q_out`  |    Output     |  `[N:1]`  |   The current parallel state of the LFSR.    |
| `m_seq`  |    Output     |     1     | The serial output (Maximum Length Sequence). |