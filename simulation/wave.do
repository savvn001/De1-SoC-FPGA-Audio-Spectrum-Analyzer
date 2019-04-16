onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix unsigned /audioCore_tb/reset
add wave -noupdate -radix hexadecimal /audioCore_tb/sample_value
add wave -noupdate -radix unsigned /audioCore_tb/AUD_BCLK_sig
add wave -noupdate -radix unsigned /audioCore_tb/AUD_LRC_sig
add wave -noupdate /audioCore_tb/audioCore_inst/AUD_LRC_EXT
add wave -noupdate -radix unsigned /audioCore_tb/AUD_ADC_DATA_sig
add wave -noupdate -radix unsigned /audioCore_tb/bclk_counter
add wave -noupdate -radix unsigned /audioCore_tb/sample_value_bit_ctr
add wave -noupdate -radix unsigned -radixshowbase 0 /audioCore_tb/audioCore_inst/adcbitcntr32
add wave -noupdate -radix hexadecimal /audioCore_tb/DATA_OUT_sig
add wave -noupdate -radix binary -radixshowbase 0 /audioCore_tb/audioCore_inst/left_data
add wave -noupdate /audioCore_tb/audioCore_inst/right_data
add wave -noupdate /audioCore_tb/audioCore_inst/LRCLK_posedge
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {2586678832 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 341
configure wave -valuecolwidth 218
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
WaveRestoreZoom {0 ps} {32812500 ns}
