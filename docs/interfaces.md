# CrossWalk interface table

**Supply:** 1.8 V (Vref = VDD). All digital signals are 0 to 1.8 V.

**Change log**
- Nov 8: Sample/hold and CDAC merged into one block ("S/H + CDAC"). `Vsh` and `Vdac` removed. `Vcm` and `Vtop` added. `comp_bit` polarity written down (proposed). See "Open items".

## Blocks

Sample/hold + CDAC (merged), Comparator, SAR logic, Clocks, Output register.

The merged block is a single-ended charge-redistribution capacitor array. The same capacitors store `Vin` during P0 and make the trial voltage during P1 to P8. The comparator only sees the shared top-plate node (`Vtop`) and compares it to `Vcm`.

## Signals

| Signal | Type | From | To | Notes |
|---|---|---|---|---|
| `Vin` | analog | external pin | S/H + CDAC | single-ended, 0 to Vref. Connects to the bottom plates through `S_in`, closed in P0 only |
| `Vcm` | analog | Vcm source (owner TBD) | S/H + CDAC, Comparator | fixed VDD/2 = 0.9 V. Used by the top-plate switch in P0 and as the comparator's reference input. Must stay steady for the whole frame |
| `Vref` | analog | supply | S/H + CDAC | = VDD |
| `clk_in` | clock | external pin | Clocks | 4 MHz (proposed) |
| `clk_sh` | clock | Clocks | S/H + CDAC | active in P0. Closes `S_top` and `S_in`. `S_top` must open before `S_in` |
| `Dtrial[7:0]` | digital, 8-bit | SAR logic | S/H + CDAC | trial code. Bit = 1 puts that bit's bottom plate on VDD, bit = 0 puts it on GND (P1 to P8) |
| `Vtop` | analog | S/H + CDAC | Comparator | top-plate node. `Vtop = Vcm + (Vtrial - Vin)`. This is the comparator's "+" input |
| `comp_bit` | digital | Comparator | SAR logic | 1-bit decision. **Proposed:** 1 = `Vtop` above `Vcm` = trial above `Vin` = clear the bit being tested. 0 = keep it |
| `clk_sar` | clock | Clocks | SAR logic, Comparator | 50% duty, also drives the comparator |
| `rst` | digital | Clocks | SAR logic | |
| `final_code[7:0]` | digital, 8-bit | SAR logic | Output register | unsigned binary |
| `clk_door` | clock | Clocks | Output register | active in P9 |
| `D[7:0]` | digital, 8-bit | Output register | external pins | final output, unsigned binary |

## Switches inside the S/H + CDAC block

Per bit, the bottom plate has three switches. Exactly one is closed at a time.

| Switch | Closed when | Connects bottom plate to |
|---|---|---|
| `S_in` | `clk_sh` (P0) | `Vin` |
| `S_vdd` | not P0, and `Dtrial` bit = 1 | VDD |
| `S_gnd` | not P0, and `Dtrial` bit = 0 | GND |

A separate top-plate switch `S_top` connects `Vtop` to `Vcm` during P0 only.

The array is 8 binary-weighted capacitors (128C to 1C) plus one dummy 1C, 256 units in total. The dummy's bottom plate follows `Vin` in P0 and then stays on GND.

The logic that turns `clk_sh` and `Dtrial` into the switch signals is **not assigned yet** (see Open items).

## Decisions

Nov 1:
- Comparator clock: shares `clk_sar` (50% duty, one decision per cycle).
- Input: single-ended, 0 to Vref (= VDD).
- Output: unsigned binary, 0 to 255.
- Clocking: synchronous.

Nov 8:
- Sample/hold and CDAC are merged into one block.

**Frame:** P0 sample, P1 to P8 bit decisions, P9 output capture.

## Open items

- [ ] **Vcm source.** Not one of the six blocks. Needs an owner. An ideal 0.9 V source is fine for early simulations. The real one must be stable and able to pull the top plate back to 0.9 V in P0.
- [ ] **Switch-drive logic.** Needs an owner and a home (inside the S/H + CDAC block or in the digital side).
- [ ] **`comp_bit` polarity.** The proposal above needs agreement from the SAR logic and comparator owners.
- [ ] **Clock edge split inside one cycle.** The SAR flip-flop updates on one edge and the comparator evaluates on the other, so flip-flop + CDAC switch + CDAC settling must fit in half a period (125 ns). The current per-bit budget in `spec.md` (25 + 125 ns) does not fit. Agree with both teams by Nov 20.
- [ ] **Quantization offset convention.** Decide whether to shift the transfer curve by half an LSB (true ±1/2 LSB quantization error) or accept 0 to 1 LSB and absorb the shift in the offset budget.
- [ ] **`spec.md` and `verification.md` follow-up.** Both still describe `Vsh` and `Vdac` as separate. Update them once these items are settled.
