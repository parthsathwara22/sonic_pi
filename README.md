## Sonic Pi

# Ambient Electronic Composition

A layered ambient/electronic piece written in Sonic Pi, featuring evolving textures and dynamic soundscapes.

## Overview

- **Tempo**: 84 BPM
- **Duration**: ~52 seconds
- **Style**: Ambient Electronic / Cinematic
- **Key**: C Major/E Minor

## Structure

The piece unfolds in distinct sections that build and evolve:

1. **Intro** (0-4s) - Shimmering chimes with filtered pad
2. **Main Loop** (4-20s) - Arpeggiated patterns with kick drum
3. **First Hit** (4-12s) - Deep bass attack with sustained pad
4. **Second Hit** (12-20s) - Choir-like textures and filtered bass
5. **Third Hit** (20-36s) - Complex layered basslines and harmonies
6. **Outro** (36-52s) - Resolving pad melody

## Sound Design

### Key Elements

- **Chimes**: High register arpeggios (C6-C7) with reverb and bandpass filtering
- **Pads**: Low-pass filtered pulse and saw waves creating ambient wash
- **Bass**: Multiple layers including sine, triangle, and detuned saw waves
- **Kick**: Simple 4-on-the-floor pattern with ada sample
- **Choir**: Hollow synth with bandpass filtering for vocal-like quality

### Notable Techniques

- Dynamic cutoff filter modulation for movement and tension
- Parallel thread execution for complex layering
- Reverb and distortion for depth and character
- Ixi techno filter for rhythmic bass movement
- Careful amplitude balancing across frequency spectrum

## Performance Notes

All parts are defined as functions and triggered with precise timing using `in_thread` and `delay` parameters. The arrangement automatically plays when the script runs.

### Running the Code

Simply run the entire script in Sonic Pi - the composition will execute automatically via the `arrangement` function call at the bottom.

## Technical Details

- Uses live loops for the main arpeggio patterns
- Employs extensive use of FX chains (reverb, lpf, bpf, distortion)
- Careful thread management ensures all parts stop cleanly
- Filter cutoff automation creates evolving timbres throughout

## Customization

You can adjust:
- `use_bpm` value to change overall tempo
- Individual `amp:` parameters to rebalance the mix
- `cutoff:` values in FX chains to alter brightness
- `release:` and `sustain:` values to change note lengths
- Thread `delay:` values to restructure the arrangement

---

*Created with Sonic Pi - the live coding music synth*
