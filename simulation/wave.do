onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /afifo_tb/CLK_50_sig
add wave -noupdate /afifo_tb/CLK_48_sig
add wave -noupdate /afifo_tb/FIFO_IN_DATA
add wave -noupdate /afifo_tb/reset_sig
add wave -noupdate /afifo_tb/readEn_in_sig
add wave -noupdate /afifo_tb/writeEn_in_sig
add wave -noupdate /afifo_tb/clear_in_sig
add wave -noupdate /afifo_tb/write_full
add wave -noupdate /afifo_tb/FIFO_OUTPUT
add wave -noupdate /afifo_tb/read_empty
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 0
configure wave -namecolwidth 150
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
configure wave -timelineunits ms
update
WaveRestoreZoom {0 ps} {1 ns}
