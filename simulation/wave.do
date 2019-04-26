onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider TopLevel
add wave -noupdate -divider aFIFO
add wave -noupdate /FFTcore_tb/MCLK
add wave -noupdate /FFTcore_tb/sink_real_sig
add wave -noupdate /FFTcore_tb/sink_imag_sig
add wave -noupdate /FFTcore_tb/sink_valid_sig
add wave -noupdate /FFTcore_tb/reset_sig
add wave -noupdate /FFTcore_tb/sink_ready_sig
add wave -noupdate /FFTcore_tb/source_error_sig
add wave -noupdate /FFTcore_tb/source_valid_sig
add wave -noupdate /FFTcore_tb/source_sop_sig
add wave -noupdate /FFTcore_tb/source_eop_sig
add wave -noupdate /FFTcore_tb/source_real_sig
add wave -noupdate /FFTcore_tb/source_imag_sig
add wave -noupdate /FFTcore_tb/source_exp_sig
add wave -noupdate /FFTcore_tb/sample_interval_counter
add wave -noupdate /FFTcore_tb/samples_sent_counter
add wave -noupdate /FFTcore_tb/sink_sop
add wave -noupdate /FFTcore_tb/sink_eop
add wave -noupdate /FFTcore_tb/file
add wave -noupdate /FFTcore_tb/file2
add wave -noupdate /FFTcore_tb/sample_val
add wave -noupdate /FFTcore_tb/error
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {209778 ps} 0} {{Cursor 2} {74196030000 ps} 0}
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
WaveRestoreZoom {0 ps} {32813550 ps}
