
cp -f C:/intelFPGA_lite/17.1/projects/FFTtest/FFT/simulation/submodules/FFT_fft_ii_0_1n1024cos.hex ./
cp -f C:/intelFPGA_lite/17.1/projects/FFTtest/FFT/simulation/submodules/FFT_fft_ii_0_2n1024cos.hex ./
cp -f C:/intelFPGA_lite/17.1/projects/FFTtest/FFT/simulation/submodules/FFT_fft_ii_0_1n1024sin.hex ./
cp -f C:/intelFPGA_lite/17.1/projects/FFTtest/FFT/simulation/submodules/FFT_fft_ii_0_2n1024sin.hex ./
cp -f C:/intelFPGA_lite/17.1/projects/FFTtest/FFT/simulation/submodules/FFT_fft_ii_0_3n1024cos.hex ./
cp -f C:/intelFPGA_lite/17.1/projects/FFTtest/FFT/simulation/submodules/FFT_fft_ii_0_3n1024sin.hex ./

vhdlan -xlrm          "C:/intelFPGA_lite/17.1/projects/FFTtest/FFT/simulation/submodules/auk_dspip_text_pkg.vhd"                    -work fft_ii_0
vhdlan -xlrm          "C:/intelFPGA_lite/17.1/projects/FFTtest/FFT/simulation/submodules/auk_dspip_math_pkg.vhd"                    -work fft_ii_0
vhdlan -xlrm          "C:/intelFPGA_lite/17.1/projects/FFTtest/FFT/simulation/submodules/auk_dspip_lib_pkg.vhd"                     -work fft_ii_0
vhdlan -xlrm          "C:/intelFPGA_lite/17.1/projects/FFTtest/FFT/simulation/submodules/auk_dspip_roundsat.vhd"                    -work fft_ii_0
vhdlan -xlrm          "C:/intelFPGA_lite/17.1/projects/FFTtest/FFT/simulation/submodules/auk_dspip_avalon_streaming_sink.vhd"       -work fft_ii_0
vhdlan -xlrm          "C:/intelFPGA_lite/17.1/projects/FFTtest/FFT/simulation/submodules/auk_dspip_avalon_streaming_source.vhd"     -work fft_ii_0
vhdlan -xlrm          "C:/intelFPGA_lite/17.1/projects/FFTtest/FFT/simulation/submodules/auk_dspip_avalon_streaming_controller.vhd" -work fft_ii_0
vlogan +v2k -sverilog "C:/intelFPGA_lite/17.1/projects/FFTtest/FFT/simulation/submodules/FFT_fft_ii_0.sv"                           -work fft_ii_0
vlogan +v2k           "C:/intelFPGA_lite/17.1/projects/FFTtest/FFT/simulation/FFT.v"                                                              
