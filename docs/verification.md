# CrossWalk verification plan

This page says what "done" means for each block. A block is done when it passes every check in its row. Numbers marked *proposed* are starting points that the lead can change after the block owners' research.

## Reference numbers

| Item | Value |
|---|---|
| Process | SKY130A |
| Supply | 1.8 V (range 1.7 to 1.9 V). Vref = VDD. |
| Input | Single-ended, 0 to Vref |
| LSB | 1.8 V / 256 = about 7 mV |
| Half an LSB | about 3.5 mV |
| Clock | 4 MHz (250 ns period), 50% duty |
| Frame | 10 cycles: P0 sample, P1 to P8 bit decisions, P9 output capture |
| Output | Unsigned binary, 0 to 255 |

Signals and timing are in `interfaces.md`.

## Block checks

| Block | Test | Pass criterion | Owner | Status |
|---|---|---|---|---|
| **Sample/hold** | Ramp or sine in, `clk_sh` on. Include the input pin path (up to 500 ohm and 5 pF). | Held voltage within half an LSB (3.5 mV) of the input at the end of the sample window (P0, 250 ns). Charge injection under half an LSB. kT/C noise well below half an LSB. | TBD | Not started |
| **CDAC** | Sweep all 256 codes | Every level matches the ideal. DNL and INL under half an LSB (proposed). Settles before the comparator decides. | TBD | Not started |
| **Comparator** | Sweep the input difference around zero. Run Monte Carlo. | Offset (3 sigma) and noise well below 3.5 mV (proposed: offset sigma about 1 mV, noise under 0.5 mV rms). Decides within half a clock period (125 ns). Low kickback onto the CDAC. | TBD | Not started |
| **SAR logic** | cocotb, with a behavioral comparator and CDAC | All 256 input levels convert to the correct code. Resets to `1000 0000`. One decision per clock cycle. | TBD | Not started |
| **Clocks** | cocotb | 10-cycle frame. `clk_sh` active only in P0. `clk_door` active only in P9. `clk_sar` is 50% duty. No glitches. | TBD | Not started |
| **Output register** | cocotb | Captures on `clk_door` and holds the value until the next `clk_door`. | TBD | Not started |

Digital tests run with `make` in `test/digital`, and automatically on every push (`test-digital`, `gds-digital`).

## Corners and variation (analog blocks)

Run each analog block at typical first. Once it passes, repeat across:

| Variable | Values |
|---|---|
| Process | typical, slow, fast and the skewed corners (SKY130 names: tt, ss, ff, sf, fs; confirm in your PDK) |
| Supply | 1.7 V, 1.8 V, 1.9 V |
| Temperature | -40, 27, 125 C |

Run **Monte Carlo** (many runs with random device mismatch) on the comparator and the CDAC, because their accuracy depends on matching.

## Full ADC checks (when all blocks are done)

| Test | What to measure |
|---|---|
| DC and ramp input | Codes are correct at the sampling instants. DNL, INL, missing codes, offset, gain error. |
| Sine input plus FFT | SNDR, ENOB, SFDR |
| Power | Average supply current |
| Timing | One conversion fits in 10 cycles, in every corner |

Targets for these come from the spec sheet. A typical goal for a design like this is DNL and INL within 1 LSB with no missing codes.

## How to report results

1. Put your results in your block's README: the test, the conditions (corner, supply, temperature) and the numbers, with a plot or table.
2. Say which row of the table above the result covers.
3. In your pull request, list which checks pass. A reviewer compares the README against the table before approving.

## Merge checklist

A pull request is ready to merge when:

- [ ] The block's checks above pass, with results in its README
- [ ] For digital blocks, `test-digital` and `gds-digital` are green on the Actions tab
- [ ] No interface changed, or the lead has signed off on the change and `interfaces.md` is updated
- [ ] A teammate has approved the pull request
