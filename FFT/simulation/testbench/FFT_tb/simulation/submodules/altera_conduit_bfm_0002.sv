// (C) 2001-2017 Intel Corporation. All rights reserved.
// Your use of Intel Corporation's design tools, logic functions and other 
// software and tools, and its AMPP partner logic functions, and any output 
// files from any of the foregoing (including device programming or simulation 
// files), and any associated documentation or information are expressly subject 
// to the terms and conditions of the Intel Program License Subscription 
// Agreement, Intel FPGA IP License Agreement, or other applicable 
// license agreement, including, without limitation, that your use is for the 
// sole purpose of programming logic devices manufactured by Intel and sold by 
// Intel or its authorized distributors.  Please refer to the applicable 
// agreement for further details.


// $Id: //acds/main/ip/sopc/components/verification/altera_tristate_conduit_bfm/altera_tristate_conduit_bfm.sv.terp#7 $
// $Revision: #7 $
// $Date: 2010/08/05 $
// $Author: klong $
//-----------------------------------------------------------------------------
// =head1 NAME
// altera_conduit_bfm
// =head1 SYNOPSIS
// Bus Functional Model (BFM) for a Standard Conduit BFM
//-----------------------------------------------------------------------------
// =head1 DESCRIPTION
// This is a Bus Functional Model (BFM) for a Standard Conduit Master.
// This BFM sampled the input/bidirection port value or driving user's value to 
// output ports when user call the API.  
// This BFM's HDL is been generated through terp file in Qsys/SOPC Builder.
// Generation parameters:
// output_name:                                       altera_conduit_bfm_0002
// role:width:direction:                              source_eop:1:input,source_error:2:input,source_exp:6:input,source_imag:24:input,source_ready:1:output,source_real:24:input,source_sop:1:input,source_valid:1:input
// 1
//-----------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module altera_conduit_bfm_0002
(
   clk,
   reset,
   reset_n,
   sig_source_eop,
   sig_source_error,
   sig_source_exp,
   sig_source_imag,
   sig_source_ready,
   sig_source_real,
   sig_source_sop,
   sig_source_valid
);

   //--------------------------------------------------------------------------
   // =head1 PINS 
   // =head2 User defined interface
   //--------------------------------------------------------------------------
   input clk;
   input reset;
   input reset_n;
   input sig_source_eop;
   input [1 : 0] sig_source_error;
   input [5 : 0] sig_source_exp;
   input [23 : 0] sig_source_imag;
   output sig_source_ready;
   input [23 : 0] sig_source_real;
   input sig_source_sop;
   input sig_source_valid;

   // synthesis translate_off
   import verbosity_pkg::*;
   
   typedef logic ROLE_source_eop_t;
   typedef logic [1 : 0] ROLE_source_error_t;
   typedef logic [5 : 0] ROLE_source_exp_t;
   typedef logic [23 : 0] ROLE_source_imag_t;
   typedef logic ROLE_source_ready_t;
   typedef logic [23 : 0] ROLE_source_real_t;
   typedef logic ROLE_source_sop_t;
   typedef logic ROLE_source_valid_t;

   logic [0 : 0] sig_source_eop_in;
   logic [0 : 0] sig_source_eop_local;
   logic [1 : 0] sig_source_error_in;
   logic [1 : 0] sig_source_error_local;
   logic [5 : 0] sig_source_exp_in;
   logic [5 : 0] sig_source_exp_local;
   logic [23 : 0] sig_source_imag_in;
   logic [23 : 0] sig_source_imag_local;
   reg sig_source_ready_temp;
   reg sig_source_ready_out;
   logic [23 : 0] sig_source_real_in;
   logic [23 : 0] sig_source_real_local;
   logic [0 : 0] sig_source_sop_in;
   logic [0 : 0] sig_source_sop_local;
   logic [0 : 0] sig_source_valid_in;
   logic [0 : 0] sig_source_valid_local;

   //--------------------------------------------------------------------------
   // =head1 Public Methods API
   // =pod
   // This section describes the public methods in the application programming
   // interface (API). The application program interface provides methods for 
   // a testbench which instantiates, controls and queries state in this BFM 
   // component. Test programs must only use these public access methods and 
   // events to communicate with this BFM component. The API and module pins
   // are the only interfaces of this component that are guaranteed to be
   // stable. The API will be maintained for the life of the product. 
   // While we cannot prevent a test program from directly accessing internal
   // tasks, functions, or data private to the BFM, there is no guarantee that
   // these will be present in the future. In fact, it is best for the user
   // to assume that the underlying implementation of this component can 
   // and will change.
   // =cut
   //--------------------------------------------------------------------------
   
   event signal_reset_asserted;
   event signal_input_source_eop_change;
   event signal_input_source_error_change;
   event signal_input_source_exp_change;
   event signal_input_source_imag_change;
   event signal_input_source_real_change;
   event signal_input_source_sop_change;
   event signal_input_source_valid_change;
   
   function automatic string get_version();  // public
      // Return BFM version string. For example, version 9.1 sp1 is "9.1sp1" 
      string ret_version = "17.1";
      return ret_version;
   endfunction

   // -------------------------------------------------------
   // source_eop
   // -------------------------------------------------------
   function automatic ROLE_source_eop_t get_source_eop();
   
      // Gets the source_eop input value.
      $sformat(message, "%m: called get_source_eop");
      print(VERBOSITY_DEBUG, message);
      return sig_source_eop_in;
      
   endfunction

   // -------------------------------------------------------
   // source_error
   // -------------------------------------------------------
   function automatic ROLE_source_error_t get_source_error();
   
      // Gets the source_error input value.
      $sformat(message, "%m: called get_source_error");
      print(VERBOSITY_DEBUG, message);
      return sig_source_error_in;
      
   endfunction

   // -------------------------------------------------------
   // source_exp
   // -------------------------------------------------------
   function automatic ROLE_source_exp_t get_source_exp();
   
      // Gets the source_exp input value.
      $sformat(message, "%m: called get_source_exp");
      print(VERBOSITY_DEBUG, message);
      return sig_source_exp_in;
      
   endfunction

   // -------------------------------------------------------
   // source_imag
   // -------------------------------------------------------
   function automatic ROLE_source_imag_t get_source_imag();
   
      // Gets the source_imag input value.
      $sformat(message, "%m: called get_source_imag");
      print(VERBOSITY_DEBUG, message);
      return sig_source_imag_in;
      
   endfunction

   // -------------------------------------------------------
   // source_ready
   // -------------------------------------------------------

   function automatic void set_source_ready (
      ROLE_source_ready_t new_value
   );
      // Drive the new value to source_ready.
      
      $sformat(message, "%m: method called arg0 %0d", new_value); 
      print(VERBOSITY_DEBUG, message);
      
      sig_source_ready_temp = new_value;
   endfunction

   // -------------------------------------------------------
   // source_real
   // -------------------------------------------------------
   function automatic ROLE_source_real_t get_source_real();
   
      // Gets the source_real input value.
      $sformat(message, "%m: called get_source_real");
      print(VERBOSITY_DEBUG, message);
      return sig_source_real_in;
      
   endfunction

   // -------------------------------------------------------
   // source_sop
   // -------------------------------------------------------
   function automatic ROLE_source_sop_t get_source_sop();
   
      // Gets the source_sop input value.
      $sformat(message, "%m: called get_source_sop");
      print(VERBOSITY_DEBUG, message);
      return sig_source_sop_in;
      
   endfunction

   // -------------------------------------------------------
   // source_valid
   // -------------------------------------------------------
   function automatic ROLE_source_valid_t get_source_valid();
   
      // Gets the source_valid input value.
      $sformat(message, "%m: called get_source_valid");
      print(VERBOSITY_DEBUG, message);
      return sig_source_valid_in;
      
   endfunction

   always @(posedge clk) begin
      sig_source_eop_in <= sig_source_eop;
      sig_source_error_in <= sig_source_error;
      sig_source_exp_in <= sig_source_exp;
      sig_source_imag_in <= sig_source_imag;
      sig_source_ready_out <= sig_source_ready_temp;
      sig_source_real_in <= sig_source_real;
      sig_source_sop_in <= sig_source_sop;
      sig_source_valid_in <= sig_source_valid;
   end
   
   assign sig_source_ready = sig_source_ready_out;

   always @(posedge reset or negedge reset_n) begin
      -> signal_reset_asserted;
   end

   always @(sig_source_eop_in) begin
      if (sig_source_eop_local != sig_source_eop_in)
         -> signal_input_source_eop_change;
      sig_source_eop_local = sig_source_eop_in;
   end
   
   always @(sig_source_error_in) begin
      if (sig_source_error_local != sig_source_error_in)
         -> signal_input_source_error_change;
      sig_source_error_local = sig_source_error_in;
   end
   
   always @(sig_source_exp_in) begin
      if (sig_source_exp_local != sig_source_exp_in)
         -> signal_input_source_exp_change;
      sig_source_exp_local = sig_source_exp_in;
   end
   
   always @(sig_source_imag_in) begin
      if (sig_source_imag_local != sig_source_imag_in)
         -> signal_input_source_imag_change;
      sig_source_imag_local = sig_source_imag_in;
   end
   
   always @(sig_source_real_in) begin
      if (sig_source_real_local != sig_source_real_in)
         -> signal_input_source_real_change;
      sig_source_real_local = sig_source_real_in;
   end
   
   always @(sig_source_sop_in) begin
      if (sig_source_sop_local != sig_source_sop_in)
         -> signal_input_source_sop_change;
      sig_source_sop_local = sig_source_sop_in;
   end
   
   always @(sig_source_valid_in) begin
      if (sig_source_valid_local != sig_source_valid_in)
         -> signal_input_source_valid_change;
      sig_source_valid_local = sig_source_valid_in;
   end
   


// synthesis translate_on

endmodule

