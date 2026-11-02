# CrossWalk ADC spec sheet (draft v0.1, for lead approval)

An 8-bit SAR ADC in SKY130A, taken from spec to Tiny Tapeout. This sheet fixes the numbers every block is designed and checked against. Values marked *proposed* are starting points. Change them after the block research comes in, then freeze the sheet.

Related pages: `interfaces.md` (signals and timing) and `verification.md` (the checks for each block).

## 1. Reference numbers

| Item | Value |
|---|---|
| Resolution | 8 bits, unsigned binary (0 to 255) |
| Supply | 1.8 V (1.7 to 1.9 V). Vref = VDD. |
| Input | Single-ended, 0 to Vref |
| LSB | 1.8 V / 256 = 7.03 mV |
| Half an LSB | 3.52 mV |
| Clock | 4 MHz (250 ns), 50% duty |
| Conversion frame | 10 cycles (P0 sample, P1 to P8 decisions, P9 output) = 2.5 us per sample |
| Sample rate | 400 kS/s (Nyquist 200 kHz) |
| Temperature | -40 to 125 C |

## 2. ADC-level targets

| Parameter | Target | Note |
|---|---|---|
| DNL | within +/-1 LSB, no missing codes | Typical goal for a design like this. Confirm. |
| INL | within +/-1 LSB | Same. |
| Offset error | within +/-1 LSB (7 mV) | Proposed |
| Gain error | within +/-1 LSB | Proposed |
| ENOB | at least 7.0 bits (SNDR at least 43.9 dB) | Proposed. The reference tt06-sar reaches 7.63 bits with a differential input. Single-ended should be lower. |
| SFDR | TBD | tt06-sar reference: 49.7 dBc |
| Average supply current | at most 100 uA | Proposed. tt06-sar reference: 48 uA |
| Post-layout margin | 10% on every target above | To confirm |

Ideal 8-bit SNR is 6.02 x 8 + 1.76 = 49.9 dB. ENOB 7.0 means SNDR = 6.02 x 7 + 1.76 = 43.9 dB.

## 3. Tiny Tapeout limits (from the analog specs page)

| Limit | Value |
|---|---|
| Tile | 1x2 is about 160 x 225 um. 2x2 is about 334 x 225 um. Approximate, so use the template. |
| Analog pins | Up to 6 (`ua[0]` to `ua[5]`), used in order from 0. We need `Vin` only. |
| Pad path (pin to design) | under 500 ohm, under 5 pF, max 4 mA |
| Metal | No met5. Power stripes are vertical met4, at least 1.2 um wide, from the bottom 10 um to the top 10 um. |
| Power | VDPWR 1.8 V. About 20 mA of draw gives a 0.1 V drop. |
| Unused outputs | Tie unused `uo_out`, `uio_out` and `uio_oe` to GND. |
| Layout | Keep the Magic design hierarchical (do not flatten). |
| Cost | 1x2 tile is 140 EUR. Analog pins are 40 EUR each for the first two. |

## 4. Interfaces and decisions

Signals are in `interfaces.md`. Decisions made Nov 1: single-ended `Vin`, unsigned output, comparator shares `clk_sar`, synchronous clocking.

## 5. Timing budget (proposed, agree with both teams by Nov 20)

| Phase | Budget |
|---|---|
| P0: S/H acquisition | 250 ns, so total settling time constant (R x C) of at most 30 ns |
| Per bit (250 ns) | Comparator decision at most 100 ns. SAR flip-flop and CDAC switch at most 25 ns. CDAC settling at most 125 ns. |

Settling time constants are derived in section 6c. The exact sequencing inside one clock cycle needs to be confirmed with the digital team.

## 6. Error budget

The ADC cannot remove its own quantization error (+/-1/2 LSB). This budget covers all the other errors, and it uses half the +/-1 LSB ADC target (so +/-1/2 LSB = 3.5 mV) to leave margin for layout parasitics.

### 6a. Noise budget (rms)

For ENOB 7.0, total noise and distortion allowed with a full-scale sine is:
- Signal rms = 0.9 V / sqrt(2) = 0.636 V
- Allowed total rms = 0.636 V / 10^(43.9/20) = 4.06 mV
- Quantization noise (LSB / sqrt(12)) = 2.03 mV
- Allowed for everything else = sqrt(4.06^2 - 2.03^2) = 3.5 mV rms

| Source | Block | Budget (rms) |
|---|---|---|
| Comparator input-referred noise | Comparator | 2.0 mV |
| kT/C sampling noise | S/H and CDAC | 0.5 mV (met by any capacitor above about 16 fF) |
| Reference and supply noise | Supply | 1.0 mV |
| Switch non-linearity, jitter and margin | S/H, Clocks | 2.0 mV |
| **Total (root-sum-square)** | | **3.04 mV, within 3.5 mV** |

### 6b. Static error budget (peak)

| Source | Block | Budget |
|---|---|---|
| CDAC capacitor mismatch (3 sigma) | CDAC | 1.75 mV (0.25 LSB) |
| S/H charge injection, signal-dependent part | S/H | 0.5 mV |
| S/H incomplete settling | S/H | 0.5 mV |
| CDAC incomplete settling | CDAC | 0.5 mV |
| Comparator kickback on the CDAC | Comparator | 0.5 mV |
| Vref (= VDD) droop during switching | Supply | 0.5 mV |
| **Total (root-sum-square)** | | **2.1 mV (0.3 LSB), within 3.5 mV** |

A straight sum is 4.25 mV, which is over 3.5 mV. The budget relies on the errors not all peaking together, so Monte Carlo has to confirm it.

Signal-independent offset errors (comparator offset, charge-injection offset) go into the offset budget instead: the comparator offset (3 sigma) at most 3.5 mV, charge injection at most 1.0 mV, and the total offset error within +/-1 LSB (7 mV).

### 6c. Derived requirements for the blocks

| Requirement | Derivation | Value |
|---|---|---|
| S/H settling | Full-scale 1.8 V step settles to 0.5 mV: ratio 2.8e-4, so 8.2 time constants in 250 ns | R x C at most 30 ns, including the pad path of up to 500 ohm |
| CDAC settling | Largest step is 0.9 V settling to 0.5 mV: ratio 5.6e-4, so 7.5 time constants in 125 ns | R x C at most 16 ns |
| CDAC unit-capacitor matching | DNL sigma is about sqrt(255) x sigma_unit LSB. For DNL sigma of 0.15 LSB (so 3 sigma is under 0.5 LSB): | sigma_unit (relative) at most 0.9% |
| Comparator decision | Half a clock period | At most 100 ns (proposed) |

These are derived by hand. Confirm them in simulation.

## 7. Block requirements (summary)

All blocks: 1.8 V supply, 1.8 V devices only (SKY130A `nfet_01v8` and `pfet_01v8`, confirm in the PDK), minimum channel length from the PDK (0.15 um, confirm), no met5, simulate on SKY130A.

| Block | Key requirements | Current budget (proposed) |
|---|---|---|
| **Sample/hold** | Settles in P0 (R x C at most 30 ns). Charge injection at most 1.0 mV. Includes the pad path in simulation. | Passive |
| **CDAC** | Unit-capacitor matching at most 0.9% (sigma). Settles in at most 16 ns time constant. DNL and INL under 1/2 LSB. Fits the tile (256 x unit cap). | Switching only |
| **Comparator** | Offset (3 sigma) at most 3.5 mV. Noise at most 2.0 mV rms. Decides in at most 100 ns. Low kickback. | Low tens of uA |
| **SAR logic** | Resets to `1000 0000`. One decision per cycle. Meets timing in every corner. | Digital total under 10 uA |
| **Clocks** | 10-cycle frame. `clk_sh` only in P0, `clk_door` only in P9, `clk_sar` 50% duty. No glitches. | (included above) |
| **Output register** | Captures on `clk_door`, holds until the next one. | (included above) |

Area budget per block is TBD, until the tile size (1x2 or 2x2) is chosen. The CDAC decides it.

## 8. Still to confirm

- [ ] Tile size and pin plan (1x2 or 2x2, `Vin` plus any spare)
- [ ] SKY130 details: device names, minimum W and L, corner names, MIM vs MOM capacitors and their density
- [ ] Tile dimensions, from the template files
- [ ] ENOB, SFDR and power targets, after block research
- [ ] Timing split inside one clock cycle (section 5)
- [ ] 10% post-layout margin
