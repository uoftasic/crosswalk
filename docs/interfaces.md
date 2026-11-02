# CrossWalk interface table

**Supply:** 1.8 V (Vref = VDD). All digital signals are 0 to 1.8 V.

| Signal | Type | From | To | Notes |
|---|---|---|---|---|
| `Vin` | analog | external pin | Sample/hold | input voltage becomes single-ended, 0 to Vref |
| `clk_in` | clock | external pin | Clocks | 4 MHz (proposed) |
| `clk_sh` | clock | Clocks | Sample/hold | active in P0 |
| `Vsh` | analog | Sample/hold | Comparator | may merge with CDAC |
| `Vref` | analog | supply | CDAC | = VDD |
| `Dtrial[7:0]` | digital, 8-bit | SAR logic | CDAC | trial code |
| `Vdac` | analog | CDAC | Comparator | trial voltage |
| `comp_bit` | digital | Comparator | SAR logic | 1-bit decision |
| `clk_sar` | clock | Clocks | SAR logic, Comparator | 50% duty, also drives the comparator |
| `rst` | digital | Clocks | SAR logic | |
| `final_code[7:0]` | digital, 8-bit | SAR logic | Output register | unsigned binary |
| `clk_door` | clock | Clocks | Output register | active in P9 |
| `D[7:0]` | digital, 8-bit | Output register | external pins | final output, unsigned binary |

**Frame:** P0 sample, P1 to P8 bit decisions, P9 output capture.
