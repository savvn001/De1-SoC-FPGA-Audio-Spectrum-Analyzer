transcript on
if ![file isdirectory FFTtest_iputf_libs] {
	file mkdir FFTtest_iputf_libs
}

if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

###### Libraries for IPUTF cores 
vlib FFTtest_iputf_libs/fft_ii_0
vmap fft_ii_0 ./FFTtest_iputf_libs/fft_ii_0
###### End libraries for IPUTF cores 
###### MIF file copy and HDL compilation commands for IPUTF cores 

file copy -force C:/intelFPGA_lite/17.1/projects/FFTtest/FFT/simulation/submodules/FFT_fft_ii_0_1n1024cos.hex ./
file copy -force C:/intelFPGA_lite/17.1/projects/FFTtest/FFT/simulation/submodules/FFT_fft_ii_0_2n1024cos.hex ./
file copy -force C:/intelFPGA_lite/17.1/projects/FFTtest/FFT/simulation/submodules/FFT_fft_ii_0_1n1024sin.hex ./
file copy -force C:/intelFPGA_lite/17.1/projects/FFTtest/FFT/simulation/submodules/FFT_fft_ii_0_2n1024sin.hex ./
file copy -force C:/intelFPGA_lite/17.1/projects/FFTtest/FFT/simulation/submodules/FFT_fft_ii_0_3n1024cos.hex ./
file copy -force C:/intelFPGA_lite/17.1/projects/FFTtest/FFT/simulation/submodules/FFT_fft_ii_0_3n1024sin.hex ./

vcom     "C:/intelFPGA_lite/17.1/projects/FFTtest/FFT/simulation/submodules/auk_dspip_text_pkg.vhd"                             -work fft_ii_0
vcom     "C:/intelFPGA_lite/17.1/projects/FFTtest/FFT/simulation/submodules/auk_dspip_math_pkg.vhd"                             -work fft_ii_0
vcom     "C:/intelFPGA_lite/17.1/projects/FFTtest/FFT/simulation/submodules/auk_dspip_lib_pkg.vhd"                              -work fft_ii_0
vcom     "C:/intelFPGA_lite/17.1/projects/FFTtest/FFT/simulation/submodules/mentor/auk_dspip_avalon_streaming_block_sink.vhd"   -work fft_ii_0
vcom     "C:/intelFPGA_lite/17.1/projects/FFTtest/FFT/simulation/submodules/mentor/auk_dspip_avalon_streaming_block_source.vhd" -work fft_ii_0
vcom     "C:/intelFPGA_lite/17.1/projects/FFTtest/FFT/simulation/submodules/auk_dspip_roundsat.vhd"                             -work fft_ii_0
vcom     "C:/intelFPGA_lite/17.1/projects/FFTtest/FFT/simulation/submodules/auk_dspip_avalon_streaming_sink.vhd"                -work fft_ii_0
vcom     "C:/intelFPGA_lite/17.1/projects/FFTtest/FFT/simulation/submodules/auk_dspip_avalon_streaming_source.vhd"              -work fft_ii_0
vcom     "C:/intelFPGA_lite/17.1/projects/FFTtest/FFT/simulation/submodules/auk_dspip_avalon_streaming_controller.vhd"          -work fft_ii_0
vcom     "C:/intelFPGA_lite/17.1/projects/FFTtest/FFT/simulation/submodules/mentor/altera_fft_dual_port_ram.vhd"                -work fft_ii_0
vcom     "C:/intelFPGA_lite/17.1/projects/FFTtest/FFT/simulation/submodules/mentor/altera_fft_dual_port_rom.vhd"                -work fft_ii_0
vcom     "C:/intelFPGA_lite/17.1/projects/FFTtest/FFT/simulation/submodules/mentor/altera_fft_mult_add.vhd"                     -work fft_ii_0
vcom     "C:/intelFPGA_lite/17.1/projects/FFTtest/FFT/simulation/submodules/mentor/altera_fft_single_port_rom.vhd"              -work fft_ii_0
vcom     "C:/intelFPGA_lite/17.1/projects/FFTtest/FFT/simulation/submodules/mentor/auk_fft_pkg.vhd"                             -work fft_ii_0
vlog     "C:/intelFPGA_lite/17.1/projects/FFTtest/FFT/simulation/submodules/mentor/hyper_pipeline_interface.v"                  -work fft_ii_0
vlog -sv "C:/intelFPGA_lite/17.1/projects/FFTtest/FFT/simulation/submodules/mentor/counter_module.sv"                           -work fft_ii_0
vcom     "C:/intelFPGA_lite/17.1/projects/FFTtest/FFT/simulation/submodules/mentor/fft_pack.vhd"                                -work fft_ii_0
vcom     "C:/intelFPGA_lite/17.1/projects/FFTtest/FFT/simulation/submodules/mentor/apn_fft_cmult_cpx.vhd"                       -work fft_ii_0
vcom     "C:/intelFPGA_lite/17.1/projects/FFTtest/FFT/simulation/submodules/mentor/apn_fft_cmult_cpx2.vhd"                      -work fft_ii_0
vcom     "C:/intelFPGA_lite/17.1/projects/FFTtest/FFT/simulation/submodules/mentor/apn_fft_mult_can.vhd"                        -work fft_ii_0
vcom     "C:/intelFPGA_lite/17.1/projects/FFTtest/FFT/simulation/submodules/mentor/apn_fft_mult_cpx.vhd"                        -work fft_ii_0
vcom     "C:/intelFPGA_lite/17.1/projects/FFTtest/FFT/simulation/submodules/mentor/asj_fft_1dp_ram.vhd"                         -work fft_ii_0
vcom     "C:/intelFPGA_lite/17.1/projects/FFTtest/FFT/simulation/submodules/mentor/asj_fft_1tdp_rom.vhd"                        -work fft_ii_0
vcom     "C:/intelFPGA_lite/17.1/projects/FFTtest/FFT/simulation/submodules/mentor/asj_fft_3dp_rom.vhd"                         -work fft_ii_0
vcom     "C:/intelFPGA_lite/17.1/projects/FFTtest/FFT/simulation/submodules/mentor/asj_fft_3pi_mram.vhd"                        -work fft_ii_0
vcom     "C:/intelFPGA_lite/17.1/projects/FFTtest/FFT/simulation/submodules/mentor/asj_fft_3tdp_rom.vhd"                        -work fft_ii_0
vcom     "C:/intelFPGA_lite/17.1/projects/FFTtest/FFT/simulation/submodules/mentor/asj_fft_4dp_ram.vhd"                         -work fft_ii_0
vcom     "C:/intelFPGA_lite/17.1/projects/FFTtest/FFT/simulation/submodules/mentor/asj_fft_6tdp_rom.vhd"                        -work fft_ii_0
vcom     "C:/intelFPGA_lite/17.1/projects/FFTtest/FFT/simulation/submodules/mentor/asj_fft_alt_shift_tdl.vhd"                   -work fft_ii_0
vcom     "C:/intelFPGA_lite/17.1/projects/FFTtest/FFT/simulation/submodules/mentor/asj_fft_bfp_ctrl.vhd"                        -work fft_ii_0
vcom     "C:/intelFPGA_lite/17.1/projects/FFTtest/FFT/simulation/submodules/mentor/asj_fft_bfp_i.vhd"                           -work fft_ii_0
vcom     "C:/intelFPGA_lite/17.1/projects/FFTtest/FFT/simulation/submodules/mentor/asj_fft_bfp_i_1pt.vhd"                       -work fft_ii_0
vcom     "C:/intelFPGA_lite/17.1/projects/FFTtest/FFT/simulation/submodules/mentor/asj_fft_bfp_o.vhd"                           -work fft_ii_0
vcom     "C:/intelFPGA_lite/17.1/projects/FFTtest/FFT/simulation/submodules/mentor/asj_fft_bfp_o_1pt.vhd"                       -work fft_ii_0
vcom     "C:/intelFPGA_lite/17.1/projects/FFTtest/FFT/simulation/submodules/mentor/asj_fft_burst_ctrl.vhd"                      -work fft_ii_0
vcom     "C:/intelFPGA_lite/17.1/projects/FFTtest/FFT/simulation/submodules/mentor/asj_fft_burst_ctrl_de.vhd"                   -work fft_ii_0
vcom     "C:/intelFPGA_lite/17.1/projects/FFTtest/FFT/simulation/submodules/mentor/asj_fft_burst_ctrl_qe.vhd"                   -work fft_ii_0
vcom     "C:/intelFPGA_lite/17.1/projects/FFTtest/FFT/simulation/submodules/mentor/asj_fft_cmult_can.vhd"                       -work fft_ii_0
vcom     "C:/intelFPGA_lite/17.1/projects/FFTtest/FFT/simulation/submodules/mentor/asj_fft_cmult_std.vhd"                       -work fft_ii_0
vcom     "C:/intelFPGA_lite/17.1/projects/FFTtest/FFT/simulation/submodules/mentor/asj_fft_cnt_ctrl.vhd"                        -work fft_ii_0
vcom     "C:/intelFPGA_lite/17.1/projects/FFTtest/FFT/simulation/submodules/mentor/asj_fft_cnt_ctrl_de.vhd"                     -work fft_ii_0
vcom     "C:/intelFPGA_lite/17.1/projects/FFTtest/FFT/simulation/submodules/mentor/asj_fft_cxb_addr.vhd"                        -work fft_ii_0
vcom     "C:/intelFPGA_lite/17.1/projects/FFTtest/FFT/simulation/submodules/mentor/asj_fft_cxb_data.vhd"                        -work fft_ii_0
vcom     "C:/intelFPGA_lite/17.1/projects/FFTtest/FFT/simulation/submodules/mentor/asj_fft_cxb_data_mram.vhd"                   -work fft_ii_0
vcom     "C:/intelFPGA_lite/17.1/projects/FFTtest/FFT/simulation/submodules/mentor/asj_fft_cxb_data_r.vhd"                      -work fft_ii_0
vcom     "C:/intelFPGA_lite/17.1/projects/FFTtest/FFT/simulation/submodules/mentor/asj_fft_dataadgen.vhd"                       -work fft_ii_0
vcom     "C:/intelFPGA_lite/17.1/projects/FFTtest/FFT/simulation/submodules/mentor/asj_fft_data_ram.vhd"                        -work fft_ii_0
vcom     "C:/intelFPGA_lite/17.1/projects/FFTtest/FFT/simulation/submodules/mentor/asj_fft_data_ram_dp.vhd"                     -work fft_ii_0
vcom     "C:/intelFPGA_lite/17.1/projects/FFTtest/FFT/simulation/submodules/mentor/asj_fft_dft_bfp.vhd"                         -work fft_ii_0
vcom     "C:/intelFPGA_lite/17.1/projects/FFTtest/FFT/simulation/submodules/mentor/asj_fft_dft_bfp_sgl.vhd"                     -work fft_ii_0
vcom     "C:/intelFPGA_lite/17.1/projects/FFTtest/FFT/simulation/submodules/mentor/asj_fft_dpi_mram.vhd"                        -work fft_ii_0
vcom     "C:/intelFPGA_lite/17.1/projects/FFTtest/FFT/simulation/submodules/mentor/asj_fft_dp_mram.vhd"                         -work fft_ii_0
vcom     "C:/intelFPGA_lite/17.1/projects/FFTtest/FFT/simulation/submodules/mentor/asj_fft_dualstream.vhd"                      -work fft_ii_0
vcom     "C:/intelFPGA_lite/17.1/projects/FFTtest/FFT/simulation/submodules/mentor/asj_fft_in_write_sgl.vhd"                    -work fft_ii_0
vcom     "C:/intelFPGA_lite/17.1/projects/FFTtest/FFT/simulation/submodules/mentor/asj_fft_lcm_mult.vhd"                        -work fft_ii_0
vcom     "C:/intelFPGA_lite/17.1/projects/FFTtest/FFT/simulation/submodules/mentor/asj_fft_lcm_mult_2m.vhd"                     -work fft_ii_0
vcom     "C:/intelFPGA_lite/17.1/projects/FFTtest/FFT/simulation/submodules/mentor/asj_fft_lpp.vhd"                             -work fft_ii_0
vcom     "C:/intelFPGA_lite/17.1/projects/FFTtest/FFT/simulation/submodules/mentor/asj_fft_lpprdadgen.vhd"                      -work fft_ii_0
vcom     "C:/intelFPGA_lite/17.1/projects/FFTtest/FFT/simulation/submodules/mentor/asj_fft_lpprdadr2gen.vhd"                    -work fft_ii_0
vcom     "C:/intelFPGA_lite/17.1/projects/FFTtest/FFT/simulation/submodules/mentor/asj_fft_lpp_serial.vhd"                      -work fft_ii_0
vcom     "C:/intelFPGA_lite/17.1/projects/FFTtest/FFT/simulation/submodules/mentor/asj_fft_lpp_serial_r2.vhd"                   -work fft_ii_0
vcom     "C:/intelFPGA_lite/17.1/projects/FFTtest/FFT/simulation/submodules/mentor/asj_fft_mult_add.vhd"                        -work fft_ii_0
vcom     "C:/intelFPGA_lite/17.1/projects/FFTtest/FFT/simulation/submodules/mentor/asj_fft_m_k_counter.vhd"                     -work fft_ii_0
vcom     "C:/intelFPGA_lite/17.1/projects/FFTtest/FFT/simulation/submodules/mentor/asj_fft_pround.vhd"                          -work fft_ii_0
vcom     "C:/intelFPGA_lite/17.1/projects/FFTtest/FFT/simulation/submodules/mentor/asj_fft_sglstream.vhd"                       -work fft_ii_0
vcom     "C:/intelFPGA_lite/17.1/projects/FFTtest/FFT/simulation/submodules/mentor/asj_fft_si_de_so_b.vhd"                      -work fft_ii_0
vcom     "C:/intelFPGA_lite/17.1/projects/FFTtest/FFT/simulation/submodules/mentor/asj_fft_si_de_so_bb.vhd"                     -work fft_ii_0
vcom     "C:/intelFPGA_lite/17.1/projects/FFTtest/FFT/simulation/submodules/mentor/asj_fft_si_qe_so_b.vhd"                      -work fft_ii_0
vcom     "C:/intelFPGA_lite/17.1/projects/FFTtest/FFT/simulation/submodules/mentor/asj_fft_si_qe_so_bb.vhd"                     -work fft_ii_0
vcom     "C:/intelFPGA_lite/17.1/projects/FFTtest/FFT/simulation/submodules/mentor/asj_fft_si_se_so_b.vhd"                      -work fft_ii_0
vcom     "C:/intelFPGA_lite/17.1/projects/FFTtest/FFT/simulation/submodules/mentor/asj_fft_si_se_so_bb.vhd"                     -work fft_ii_0
vcom     "C:/intelFPGA_lite/17.1/projects/FFTtest/FFT/simulation/submodules/mentor/asj_fft_si_sose_so_b.vhd"                    -work fft_ii_0
vcom     "C:/intelFPGA_lite/17.1/projects/FFTtest/FFT/simulation/submodules/mentor/asj_fft_tdl.vhd"                             -work fft_ii_0
vcom     "C:/intelFPGA_lite/17.1/projects/FFTtest/FFT/simulation/submodules/mentor/asj_fft_tdl_bit.vhd"                         -work fft_ii_0
vcom     "C:/intelFPGA_lite/17.1/projects/FFTtest/FFT/simulation/submodules/mentor/asj_fft_tdl_bit_rst.vhd"                     -work fft_ii_0
vcom     "C:/intelFPGA_lite/17.1/projects/FFTtest/FFT/simulation/submodules/mentor/asj_fft_tdl_rst.vhd"                         -work fft_ii_0
vcom     "C:/intelFPGA_lite/17.1/projects/FFTtest/FFT/simulation/submodules/mentor/asj_fft_twadgen.vhd"                         -work fft_ii_0
vcom     "C:/intelFPGA_lite/17.1/projects/FFTtest/FFT/simulation/submodules/mentor/asj_fft_twadgen_dual.vhd"                    -work fft_ii_0
vcom     "C:/intelFPGA_lite/17.1/projects/FFTtest/FFT/simulation/submodules/mentor/asj_fft_twadsogen.vhd"                       -work fft_ii_0
vcom     "C:/intelFPGA_lite/17.1/projects/FFTtest/FFT/simulation/submodules/mentor/asj_fft_twadsogen_q.vhd"                     -work fft_ii_0
vcom     "C:/intelFPGA_lite/17.1/projects/FFTtest/FFT/simulation/submodules/mentor/asj_fft_twiddle_ctrl_qe.vhd"                 -work fft_ii_0
vcom     "C:/intelFPGA_lite/17.1/projects/FFTtest/FFT/simulation/submodules/mentor/asj_fft_twid_rom_tdp.vhd"                    -work fft_ii_0
vcom     "C:/intelFPGA_lite/17.1/projects/FFTtest/FFT/simulation/submodules/mentor/asj_fft_unbburst_ctrl.vhd"                   -work fft_ii_0
vcom     "C:/intelFPGA_lite/17.1/projects/FFTtest/FFT/simulation/submodules/mentor/asj_fft_unbburst_ctrl_de.vhd"                -work fft_ii_0
vcom     "C:/intelFPGA_lite/17.1/projects/FFTtest/FFT/simulation/submodules/mentor/asj_fft_unbburst_ctrl_qe.vhd"                -work fft_ii_0
vcom     "C:/intelFPGA_lite/17.1/projects/FFTtest/FFT/simulation/submodules/mentor/asj_fft_unbburst_sose_ctrl.vhd"              -work fft_ii_0
vcom     "C:/intelFPGA_lite/17.1/projects/FFTtest/FFT/simulation/submodules/mentor/asj_fft_wrengen.vhd"                         -work fft_ii_0
vcom     "C:/intelFPGA_lite/17.1/projects/FFTtest/FFT/simulation/submodules/mentor/asj_fft_wrswgen.vhd"                         -work fft_ii_0
vcom     "C:/intelFPGA_lite/17.1/projects/FFTtest/FFT/simulation/submodules/mentor/twid_rom.vhd"                                -work fft_ii_0
vlog     "C:/intelFPGA_lite/17.1/projects/FFTtest/FFT/simulation/submodules/mentor/apn_fft_mult_cpx_1825.v"                     -work fft_ii_0
vlog -sv "C:/intelFPGA_lite/17.1/projects/FFTtest/FFT/simulation/submodules/FFT_fft_ii_0.sv"                                    -work fft_ii_0
vlog     "C:/intelFPGA_lite/17.1/projects/FFTtest/FFT/simulation/FFT.v"                                                                       
vlog     "C:/intelFPGA_lite/17.1/projects/FFTtest/PLL/PLL_sim/PLL.vo"                                                                         

vlog -vlog01compat -work work +incdir+C:/intelFPGA_lite/17.1/projects/FFTtest {C:/intelFPGA_lite/17.1/projects/FFTtest/ledMatrix.v}

vlog -vlog01compat -work work +incdir+C:/intelFPGA_lite/17.1/projects/FFTtest/simulation {C:/intelFPGA_lite/17.1/projects/FFTtest/simulation/ledMatrix_tb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -L fft_ii_0 -voptargs="+acc"  ledMatrix_tb

do C:/intelFPGA_lite/17.1/projects/FFTtest/simulation/load_sim.tcl
