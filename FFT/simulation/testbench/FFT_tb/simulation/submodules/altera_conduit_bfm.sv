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
// output_name:                                       altera_conduit_bfm
// role:width:direction:                              inverse:1:output,sink_eop:1:output,sink_error:2:output,sink_imag:24:output,sink_ready:1:input,sink_real:24:output,sink_sop:1:output,sink_valid:1:output
// 1
//-----------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module altera_conduit_bfm
(
   clk,
   reset,
   reset_n,
   sig_inverse,
   sig_sink_eop,
   sig_sink_error,
   sig_sink_imag,
   sig_sink_ready,
   sig_sink_real,
   sig_sink_sop,
   sig_sink_valid
);

   //--------------------------------------------------------------------------
   // =head1 PINS 
   // =head2 User defined interface
   //--------------------------------------------------------------------------
   input clk;
   input reset;
   input reset_n;
   output sig_inverse;
   output sig_sink_eop;
   output [1 : 0] sig_sink_error;
   output [23 : 0] sig_sink_imag;
   input sig_sink_ready;
   output [23 : 0] sig_sink_real;
   output sig_sink_sop;
   output sig_sink_valid;

   // synthesis translate_off
   import verbosity_pkg::*;
   
   typedef logic ROLE_inverse_t;
   typedef logic ROLE_sink_eop_t;
   typedef logic [1 : 0] ROLE_sink_error_t;
   typedef logic [23 : 0] ROLE_sink_imag_t;
   typedef logic ROLE_sink_ready_t;
   typedef logic [23 : 0] ROLE_sink_real_t;
   typedef logic ROLE_sink_sop_t;
   typedef logic ROLE_sink_valid_t;

   reg sig_inverse_temp;
   reg sig_inverse_out;
   reg sig_sink_eop_temp;
   reg sig_sink_eop_out;
   reg [1 : 0] sig_sink_error_temp;
   reg [1 : 0] sig_sink_error_out;
   reg [23 : 0] sig_sink_imag_temp;
   reg [23 : 0] sig_sink_imag_out;
   logic [0 : 0] sig_sink_ready_in;
   logic [0 : 0] sig_sink_ready_local;
   reg [23 : 0] sig_sink_real_temp;
   reg [23 : 0] sig_sink_real_out;
   reg sig_sink_sop_temp;
   reg sig_sink_sop_out;
   reg sig_sink_valid_temp;
   reg sig_sink_valid_out;

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
   event signal_input_sink_ready_change;
   
   function automatic string get_version();  // public
      // Return BFM version string. For example, version 9.1 sp1 is "9.1sp1" 
      string ret_version = "17.1";
      return ret_version;
   endfunction

   // -------------------------------------------------------
   // inverse
   // -------------------------------------------------------

   function automatic void set_inverse (
      ROLE_inverse_t new_value
   );
      // Drive the new value to inverse.
      
      $sformat(message, "%m: method called arg0 %0d", new_value); 
      print(VERBOSITY_DEBUG, message);
      
      sig_inverse_temp = new_value;
   endfunction

   // -------------------------------------------------------
   // sink_eop
   // -------------------------------------------------------

   function automatic void set_sink_eop (
      ROLE_sink_eop_t new_value
   );
      // Drive the new value to sink_eop.
      
      $sformat(message, "%m: method called arg0 %0d", new_value); 
      print(VERBOSITY_DEBUG, message);
      
      sig_sink_eop_temp = new_value;
   endfunction

   // -------------------------------------------------------
   // sink_error
   // -------------------------------------------------------

   function automatic void set_sink_error (
      ROLE_sink_error_t new_value
   );
      // Drive the new value to sink_error.
      
      $sformat(message, "%m: method called arg0 %0d", new_value); 
      print(VERBOSITY_DEBUG, message);
      
      sig_sink_error_temp = new_value;
   endfunction

   // -------------------------------------------------------
   // sink_imag
   // -------------------------------------------------------

   function automatic void set_sink_imag (
      ROLE_sink_imag_t new_value
   );
      // Drive the new value to sink_imag.
      
      $sformat(message, "%m: method called arg0 %0d", new_value); 
      print(VERBOSITY_DEBUG, message);
      
      sig_sink_imag_temp = new_value;
   endfunction

   // -------------------------------------------------------
   // sink_ready
   // -------------------------------------------------------
   function automatic ROLE_sink_ready_t get_sink_ready();
   
      // Gets the sink_ready input value.
      $sformat(message, "%m: called get_sink_ready");
      print(VERBOSITY_DEBUG, message);
      return sig_sink_ready_in;
      
   endfunction

   // -------------------------------------------------------
   // sink_real
   // -------------------------------------------------------

   function automatic void set_sink_real (
      ROLE_sink_real_t new_value
   );
      // Drive the new value to sink_real.
      
      $sformat(message, "%m: method called arg0 %0d", new_value); 
      print(VERBOSITY_DEBUG, message);
      
      sig_sink_real_temp = new_value;
   endfunction

   // -------------------------------------------------------
   // sink_sop
   // -------------------------------------------------------

   function automatic void set_sink_sop (
      ROLE_sink_sop_t new_value
   );
      // Drive the new value to sink_sop.
      
      $sformat(message, "%m: method called arg0 %0d", new_value); 
      print(VERBOSITY_DEBUG, message);
      
      sig_sink_sop_temp = new_value;
   endfunction

   // -------------------------------------------------------
   // sink_valid
   // -------------------------------------------------------

   function automatic void set_sink_valid (
      ROLE_sink_valid_t new_value
   );
      // Drive the new value to sink_valid.
      
      $sformat(message, "%m: method called arg0 %0d", new_value); 
      print(VERBOSITY_DEBUG, message);
      
      sig_sink_valid_temp = new_value;
   endfunction

   always @(posedge clk) begin
      sig_inverse_out <= sig_inverse_temp;
      sig_sink_eop_out <= sig_sink_eop_temp;
      sig_sink_error_out <= sig_sink_error_temp;
      sig_sink_imag_out <= sig_sink_imag_temp;
      sig_sink_ready_in <= sig_sink_ready;
      sig_sink_real_out <= sig_sink_real_temp;
      sig_sink_sop_out <= sig_sink_sop_temp;
      sig_sink_valid_out <= sig_sink_valid_temp;
   end
   
   assign sig_inverse = sig_inverse_out;
   assign sig_sink_eop = sig_sink_eop_out;
   assign sig_sink_error = sig_sink_error_out;
   assign sig_sink_imag = sig_sink_imag_out;
   assign sig_sink_real = sig_sink_real_out;
   assign sig_sink_sop = sig_sink_sop_out;
   assign sig_sink_valid = sig_sink_valid_out;

   always @(posedge reset or negedge reset_n) begin
      -> signal_reset_asserted;
   end

   always @(sig_sink_ready_in) begin
      if (sig_sink_ready_local != sig_sink_ready_in)
         -> signal_input_sink_ready_change;
      sig_sink_ready_local = sig_sink_ready_in;
   end
   


// synthesis translate_on

endmodule

