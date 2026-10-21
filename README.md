# NAT2MADE COMP — source project (prototype v0.1)

This is an original JUCE-based compressor plugin prototype with two independently switchable stages. It is not a copy or merge of the three commercial VST3 binaries supplied as references.

## Included
- Block 01: input gain, three-band EQ before compression, threshold, ratio, attack, release, makeup and tone.
- Block 02: leveling-style compressor with threshold, ratio, attack, release, gain, saturation and an Effect blend control.
- Parameter state save/restore and a custom dark UI with a small butterfly-inspired motif.
- CMake project targeting VST3 and Standalone on Windows/macOS/Linux where JUCE supports the toolchain.

## Important prototype notes
- This source has **not been compiled or tested in a DAW in this environment**. Treat it as a development prototype, not a production-ready mastering plugin. The DSP code includes separate detector state per channel and assigns EQ coefficient pointers safely, but it still requires a successful Windows build and listening tests.
- The DSP is an original basic compressor implementation intended as a starting point. It does not claim to reproduce the sound or algorithms of Avalon, Mäag, or Summit hardware/software.
- The current interface is a first pass. It includes control labels and no gain-reduction meter; controls can be refined to match the intended final design.
- The EQ coefficients are updated per audio block in this prototype. For a production build, smooth parameter changes and avoid coefficient updates that can cause artifacts.

## Build on Windows
1. Install **Visual Studio 2022** with *Desktop development with C++* and a recent **CMake**.
2. Install Git.
3. Extract this folder to a normal local path, for example `C:\AudioDev\NAT2MADE_COMP`.
4. Open **x64 Native Tools Command Prompt for VS 2022**.
5. Run:
   ```bat
   cd C:\AudioDev\NAT2MADE_COMP
   build_windows.bat

   Or run the commands manually:
   ```bat
   cmake -S . -B build -G "Visual Studio 17 2022" -A x64
   cmake --build build --config Release --target NAT2MADE_COMP_VST3 NAT2MADE_COMP_Standalone
   ```
   ```
   The first configure fetches JUCE 8.0.6 from GitHub, so an internet connection is required.
6. Look for `NAT2MADE COMP.vst3` under the build output (the exact subfolder depends on the Visual Studio generator). If CMake reports an error, save the complete output and use it to fix the build.
7. Install/copy the VST3 bundle to `C:\Program Files\Common Files\VST3`, then rescan plug-ins in REAPER.

## Next development pass
Before relying on it for paid work: test mono/stereo and automation, smooth all controls, add a proper gain-reduction meter if wanted, validate parameter ranges, add oversampling/aliasing checks for saturation, and perform CPU, denormal, and audio-quality tests.
