onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider Codec
add wave -noupdate /topLevel_tb/topLevel_inst/MCLK
add wave -noupdate /topLevel_tb/topLevel_inst/AUD_LRC
add wave -noupdate /topLevel_tb/topLevel_inst/AUD_BCLK
add wave -noupdate /topLevel_tb/topLevel_inst/AUD_ADC_DATA
add wave -noupdate -divider RESET
add wave -noupdate /topLevel_tb/topLevel_inst/RESET
add wave -noupdate -divider audioCore
add wave -noupdate /topLevel_tb/topLevel_inst/LRC_CLK_OUT
add wave -noupdate /topLevel_tb/topLevel_inst/audio_core_out
add wave -noupdate -divider aFIFO
add wave -noupdate /topLevel_tb/topLevel_inst/FIFO_read_empty
add wave -noupdate /topLevel_tb/topLevel_inst/FIFO_read_en
add wave -noupdate /topLevel_tb/topLevel_inst/FIFO_OUTPUT
add wave -noupdate /topLevel_tb/topLevel_inst/FIFO_write_full
add wave -noupdate /topLevel_tb/topLevel_inst/FIFO_write_en
add wave -noupdate /topLevel_tb/topLevel_inst/FIFO_clear_in
add wave -noupdate -divider FFT
add wave -noupdate /topLevel_tb/topLevel_inst/sink_valid
add wave -noupdate /topLevel_tb/topLevel_inst/sink_imag_sig
add wave -noupdate /topLevel_tb/topLevel_inst/sink_sop
add wave -noupdate /topLevel_tb/topLevel_inst/sink_eop
add wave -noupdate /topLevel_tb/topLevel_inst/samples_sent_counter
add wave -noupdate /topLevel_tb/topLevel_inst/sink_ready_sig
add wave -noupdate /topLevel_tb/topLevel_inst/source_error_sig
add wave -noupdate /topLevel_tb/topLevel_inst/source_valid_sig
add wave -noupdate /topLevel_tb/topLevel_inst/source_sop_sig
add wave -noupdate /topLevel_tb/topLevel_inst/source_eop_sig
add wave -noupdate /topLevel_tb/topLevel_inst/source_exp_sig
add wave -noupdate /topLevel_tb/topLevel_inst/source_real_sig
add wave -noupdate -divider CLK
add wave -noupdate /topLevel_tb/topLevel_inst/CODEC_CLOCK
add wave -noupdate /topLevel_tb/topLevel_inst/PLL_RESET
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 261
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
WaveRestoreZoom {0 ps} {2262712 ps}
