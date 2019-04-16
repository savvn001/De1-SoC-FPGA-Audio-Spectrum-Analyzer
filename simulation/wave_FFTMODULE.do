onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /FFTtest_tb/clk_sig
add wave -noupdate -radix decimal -radixshowbase 0 /FFTtest_tb/sink_real_sig
add wave -noupdate -radix decimal -radixshowbase 0 /FFTtest_tb/sink_imag_sig
add wave -noupdate /FFTtest_tb/sink_ready_sig
add wave -noupdate /FFTtest_tb/source_error_sig
add wave -noupdate /FFTtest_tb/source_valid_sig
add wave -noupdate /FFTtest_tb/source_sop_sig
add wave -noupdate /FFTtest_tb/source_eop_sig
add wave -noupdate -radix decimal -radixshowbase 0 /FFTtest_tb/source_real_sig
add wave -noupdate -radix decimal -radixshowbase 0 /FFTtest_tb/source_imag_sig
add wave -noupdate -radix decimal -radixshowbase 0 /FFTtest_tb/source_exp_sig
add wave -noupdate /FFTtest_tb/file
add wave -noupdate -divider fft
add wave -noupdate /FFTtest_tb/FFTtest_inst/reset
add wave -noupdate /FFTtest_tb/FFTtest_inst/sink_sop
add wave -noupdate /FFTtest_tb/FFTtest_inst/sink_eop
add wave -noupdate -radix decimal -radixshowbase 0 /FFTtest_tb/FFTtest_inst/sample_counter
add wave -noupdate /FFTtest_tb/FFTtest_inst/sink_valid
add wave -noupdate /FFTtest_tb/FFTtest_inst/source_ready
add wave -noupdate /FFTtest_tb/FFTtest_inst/inverse
add wave -noupdate /FFTtest_tb/FFTtest_inst/sink_error
add wave -noupdate -divider U0
add wave -noupdate /FFTtest_tb/FFTtest_inst/u0/reset_n
add wave -noupdate /FFTtest_tb/FFTtest_inst/u0/clk
add wave -noupdate /FFTtest_tb/FFTtest_inst/u0/reset_n
add wave -noupdate /FFTtest_tb/FFTtest_inst/u0/sink_valid
add wave -noupdate /FFTtest_tb/FFTtest_inst/u0/sink_ready
add wave -noupdate /FFTtest_tb/FFTtest_inst/u0/sink_error
add wave -noupdate /FFTtest_tb/FFTtest_inst/u0/sink_sop
add wave -noupdate /FFTtest_tb/FFTtest_inst/u0/sink_eop
add wave -noupdate -radix decimal -radixshowbase 0 /FFTtest_tb/FFTtest_inst/u0/sink_real
add wave -noupdate -radix decimal -radixshowbase 0 /FFTtest_tb/FFTtest_inst/u0/sink_imag
add wave -noupdate /FFTtest_tb/FFTtest_inst/u0/inverse
add wave -noupdate /FFTtest_tb/FFTtest_inst/u0/source_valid
add wave -noupdate /FFTtest_tb/FFTtest_inst/u0/source_ready
add wave -noupdate /FFTtest_tb/FFTtest_inst/u0/source_error
add wave -noupdate /FFTtest_tb/FFTtest_inst/u0/source_sop
add wave -noupdate /FFTtest_tb/FFTtest_inst/u0/source_eop
add wave -noupdate /FFTtest_tb/FFTtest_inst/u0/source_real
add wave -noupdate /FFTtest_tb/FFTtest_inst/u0/source_imag
add wave -noupdate /FFTtest_tb/FFTtest_inst/u0/source_exp
add wave -noupdate -divider DUNNO
add wave -noupdate /FFTtest_tb/FFTtest_inst/u0/fft_ii_0/asj_fft_dualstream_inst/auk_dsp_atlantic_sink_1/PACKET_SIZE_g
add wave -noupdate /FFTtest_tb/FFTtest_inst/u0/fft_ii_0/asj_fft_dualstream_inst/auk_dsp_atlantic_sink_1/WIDTH_g
add wave -noupdate /FFTtest_tb/FFTtest_inst/u0/fft_ii_0/asj_fft_dualstream_inst/auk_dsp_atlantic_sink_1/MIN_DATA_COUNT_g
add wave -noupdate /FFTtest_tb/FFTtest_inst/u0/fft_ii_0/asj_fft_dualstream_inst/auk_dsp_atlantic_sink_1/clk
add wave -noupdate /FFTtest_tb/FFTtest_inst/u0/fft_ii_0/asj_fft_dualstream_inst/auk_dsp_atlantic_sink_1/reset_n
add wave -noupdate /FFTtest_tb/FFTtest_inst/u0/fft_ii_0/asj_fft_dualstream_inst/auk_dsp_atlantic_sink_1/data
add wave -noupdate /FFTtest_tb/FFTtest_inst/u0/fft_ii_0/asj_fft_dualstream_inst/auk_dsp_atlantic_sink_1/packet_error
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {180163726 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 335
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits us
update
WaveRestoreZoom {0 ps} {359884789 ps}
