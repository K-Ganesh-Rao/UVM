// Code your testbench here
// or browse Examples
// Code your testbench here
// or browse Examples

`include "uvm_macros.svh";
import uvm_pkg ::*;

///////////////////////////////////////////////////////////////////////////

class driver extends uvm_driver;
  
  `uvm_component_utils(driver)
  
  function new(string name = "driver" , uvm_component parent);
    super.new(name,parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("BUILD_PHASE","BUILD PHASE CALLED FROM DRIVER COMPONENT",UVM_LOW);
  endfunction
  
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    `uvm_info("Connect_PHASE","BUILD PHASE CALLED FROM DRIVER COMPONENT",UVM_LOW);
    
  endfunction
  
    function void end_of_elaboration_phase(uvm_phase phase);
    super.end_of_elaboration_phase(phase);
    `uvm_info("ENFD_OF_ELaBORATON_PHASE","BUILD PHASE CALLED FROM DRIVER COMPONENT",UVM_LOW);
  endfunction
  
endclass

///////////////////////////////////////////////////////////////////////////

class monitor extends uvm_monitor;
  
  `uvm_component_utils(monitor)
  
  function new(string name = "monitor" , uvm_component parent);
    super.new(name,parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("BUILD_PHASE","BUILD PHASE CALLED FROM MONITOR COMPONENT",UVM_LOW);
    
  endfunction 
  
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    `uvm_info("Connect_PHASE","BUILD PHASE CALLED FROM MONITOR COMPONENT",UVM_LOW);
    
  endfunction
  
  function void end_of_elaboration_phase(uvm_phase phase);
    super.end_of_elaboration_phase(phase);
    `uvm_info("ENFD_OF_ELaBORATON_PHASE","BUILD PHASE CALLED FROM MONITOR COMPONENT",UVM_LOW);
  endfunction
endclass

///////////////////////////////////////////////////////////////////////////

class agent extends uvm_agent;
  
  `uvm_component_utils(agent)
  driver drvh;
  monitor monh;
  
  function new(string name = "agent" , uvm_component parent);
    super.new(name,parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("BUILD_PHASE","BUILD PHASE CALLED FROM AGENT COMPONENT",UVM_LOW);
    
    drvh = driver :: type_id :: create("drvh",this);
    monh = monitor :: type_id :: create("monh",this);
    
  endfunction  
  
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    `uvm_info("Connect_PHASE","BUILD PHASE CALLED FROM AGENT COMPONENT",UVM_LOW);
    
  endfunction
  
  function void end_of_elaboration_phase(uvm_phase phase);
    super.end_of_elaboration_phase(phase);
    `uvm_info("ENFD_OF_ELaBORATON_PHASE","BUILD PHASE CALLED FROM AGENT COMPONENT",UVM_LOW);
  endfunction
endclass


///////////////////////////////////////////////////////////////////////////

class env extends uvm_env;
  
  `uvm_component_utils(env)
  agent agnth;
  
  function new(string name = "env" , uvm_component parent);
    super.new(name,parent);
  endfunction
  
    function void build_phase(uvm_phase phase);
    super.build_phase(phase);
      `uvm_info("BUILD_PHASE","BUILD PHASE CALLED FROM ENVIRONMENT COMPONENT",UVM_LOW);
      agnth = agent :: type_id :: create("agnth",this);
    
  endfunction  
  
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    `uvm_info("Connect_PHASE","BUILD PHASE CALLED FROM ENVIRONMENT COMPONENT",UVM_LOW);
    
  endfunction
  
  function void end_of_elaboration_phase(uvm_phase phase);
    super.end_of_elaboration_phase(phase);
    `uvm_info("ENFD_OF_ELaBORATON_PHASE","BUILD PHASE CALLED FROM ENVIRONMENT COMPONENT",UVM_LOW);
  endfunction
endclass


///////////////////////////////////////////////////////////////////////////

class test extends uvm_test;
  
  `uvm_component_utils(test)
  env envh;
  
  function new(string name = "test" , uvm_component parent);
    super.new(name,parent);
  endfunction
  
    function void build_phase(uvm_phase phase);
    super.build_phase(phase);
      `uvm_info("BUILD_PHASE","BUILD PHASE CALLED FROM TEST COMPONENT",UVM_LOW);
      envh = env :: type_id :: create("envh",this);
    
  endfunction  
  
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    `uvm_info("Connect_PHASE","BUILD PHASE CALLED FROM TEST COMPONENT",UVM_LOW);
    
  endfunction
  
  
  function void end_of_elaboration_phase(uvm_phase phase);
    super.end_of_elaboration_phase(phase);
    uvm_top.print_topology();
    `uvm_info("ENFD_OF_ELABORATON_PHASE","BUILD PHASE CALLED FROM TEST COMPONENT",UVM_LOW);
  endfunction
  
endclass

///////////////////////////////////////////////////////////////////////////


module top;
  
  initial begin
    run_test("test");      // starts tb and initiates phasing 
 
  end
endmodule




/*
[2025-07-23 03:28:59 UTC] vlib work && vlog '-timescale' '1ns/1ns' +incdir+$RIVIERA_HOME/vlib/uvm-1.2/src -l uvm_1_2 -err VCP2947 W9 -err VCP2974 W9 -err VCP3003 W9 -err VCP5417 W9 -err VCP6120 W9 -err VCP7862 W9 -err VCP2129 W9 design.sv testbench.sv  && vsim -c -do "vsim +access+r; run -all; exit"  
VSIMSA: Configuration file changed: `/home/runner/library.cfg'
ALIB: Library "work" attached.
work = /home/runner/work/work.lib
MESSAGE_SP VCP2124 "Package uvm_pkg found in library uvm_1_2."
MESSAGE "Unit top modules: top."
SUCCESS "Compile success 0 Errors 0 Warnings  Analysis time: 6[s]."
done
# Aldec, Inc. Riviera-PRO version 2023.04.112.8911 built for Linux64 on May 12, 2023.
# HDL, SystemC, and Assertions simulator, debugger, and design environment.
# (c) 1999-2023 Aldec, Inc. All rights reserved.
# ELBREAD: Elaboration process.
# ELBREAD: Warning: ELBREAD_0049 Package 'uvm_pkg' does not have a `timescale directive, but previous modules do.
# ELBREAD: Elaboration time 0.7 [s].
# KERNEL: Main thread initiated.
# KERNEL: Kernel process initialization phase.
# ELAB2: Elaboration final pass...
# KERNEL: PLI/VHPI kernel's engine initialization done.
# PLI: Loading library '/usr/share/Riviera-PRO/bin/libsystf.so'
# ELAB2: Create instances ...
# KERNEL: Info: Loading library:  /usr/share/Riviera-PRO/bin/uvm_1_2_dpi
# KERNEL: Time resolution set to 1ns.
# ELAB2: Create instances complete.
# SLP: Started
# SLP: Elaboration phase ...
# SLP: Elaboration phase ... skipped, nothing to simulate in SLP mode : 0.0 [s]
# SLP: Finished : 0.0 [s]
# ELAB2: Elaboration final pass complete - time: 2.8 [s].
# KERNEL: Warning: You are using the Riviera-PRO EDU Edition. The performance of simulation is reduced.
# KERNEL: Warning: Contact Aldec for available upgrade options - sales@aldec.com.
# KERNEL: Kernel process initialization done.
# Allocation: Simulator allocated 27423 kB (elbread=2004 elab2=20918 kernel=4499 sdf=0)
# KERNEL: UVM_INFO /home/build/vlib1/vlib/uvm-1.2/src/base/uvm_root.svh(392) @ 0: reporter [UVM/RELNOTES] 
# KERNEL: ----------------------------------------------------------------
# KERNEL: UVM-1.2
# KERNEL: (C) 2007-2014 Mentor Graphics Corporation
# KERNEL: (C) 2007-2014 Cadence Design Systems, Inc.
# KERNEL: (C) 2006-2014 Synopsys, Inc.
# KERNEL: (C) 2011-2013 Cypress Semiconductor Corp.
# KERNEL: (C) 2013-2014 NVIDIA Corporation
# KERNEL: ----------------------------------------------------------------
# KERNEL: 
# KERNEL:   ***********       IMPORTANT RELEASE NOTES         ************
# KERNEL: 
# KERNEL:   You are using a version of the UVM library that has been compiled
# KERNEL:   with `UVM_NO_DEPRECATED undefined.
# KERNEL:   See http://www.eda.org/svdb/view.php?id=3313 for more details.
# KERNEL: 
# KERNEL:   You are using a version of the UVM library that has been compiled
# KERNEL:   with `UVM_OBJECT_DO_NOT_NEED_CONSTRUCTOR undefined.
# KERNEL:   See http://www.eda.org/svdb/view.php?id=3770 for more details.
# KERNEL: 
# KERNEL:       (Specify +UVM_NO_RELNOTES to turn off this notice)
# KERNEL: 
# KERNEL: ASDB file was created in location /home/runner/dataset.asdb
# KERNEL: UVM_INFO @ 0: reporter [RNTST] Running test test...
# KERNEL: UVM_INFO /home/runner/testbench.sv(143) @ 0: uvm_test_top [BUILD_PHASE] BUILD PHASE CALLED FROM TEST COMPONENT
# KERNEL: UVM_INFO /home/runner/testbench.sv(112) @ 0: uvm_test_top.envh [BUILD_PHASE] BUILD PHASE CALLED FROM ENVIRONMENT COMPONENT
# KERNEL: UVM_INFO /home/runner/testbench.sv(79) @ 0: uvm_test_top.envh.agnth [BUILD_PHASE] BUILD PHASE CALLED FROM AGENT COMPONENT
# KERNEL: UVM_INFO /home/runner/testbench.sv(21) @ 0: uvm_test_top.envh.agnth.drvh [BUILD_PHASE] BUILD PHASE CALLED FROM DRIVER COMPONENT
# KERNEL: UVM_INFO /home/runner/testbench.sv(49) @ 0: uvm_test_top.envh.agnth.monh [BUILD_PHASE] BUILD PHASE CALLED FROM MONITOR COMPONENT
# KERNEL: UVM_INFO /home/runner/testbench.sv(26) @ 0: uvm_test_top.envh.agnth.drvh [Connect_PHASE] BUILD PHASE CALLED FROM DRIVER COMPONENT
# KERNEL: UVM_INFO /home/runner/testbench.sv(55) @ 0: uvm_test_top.envh.agnth.monh [Connect_PHASE] BUILD PHASE CALLED FROM MONITOR COMPONENT
# KERNEL: UVM_INFO /home/runner/testbench.sv(88) @ 0: uvm_test_top.envh.agnth [Connect_PHASE] BUILD PHASE CALLED FROM AGENT COMPONENT
# KERNEL: UVM_INFO /home/runner/testbench.sv(119) @ 0: uvm_test_top.envh [Connect_PHASE] BUILD PHASE CALLED FROM ENVIRONMENT COMPONENT
# KERNEL: UVM_INFO /home/runner/testbench.sv(150) @ 0: uvm_test_top [Connect_PHASE] BUILD PHASE CALLED FROM TEST COMPONENT
# KERNEL: UVM_INFO /home/runner/testbench.sv(32) @ 0: uvm_test_top.envh.agnth.drvh [ENFD_OF_ELaBORATON_PHASE] BUILD PHASE CALLED FROM DRIVER COMPONENT
# KERNEL: UVM_INFO /home/runner/testbench.sv(61) @ 0: uvm_test_top.envh.agnth.monh [ENFD_OF_ELaBORATON_PHASE] BUILD PHASE CALLED FROM MONITOR COMPONENT
# KERNEL: UVM_INFO /home/runner/testbench.sv(94) @ 0: uvm_test_top.envh.agnth [ENFD_OF_ELaBORATON_PHASE] BUILD PHASE CALLED FROM AGENT COMPONENT
# KERNEL: UVM_INFO /home/runner/testbench.sv(125) @ 0: uvm_test_top.envh [ENFD_OF_ELaBORATON_PHASE] BUILD PHASE CALLED FROM ENVIRONMENT COMPONENT
# KERNEL: UVM_INFO /home/build/vlib1/vlib/uvm-1.2/src/base/uvm_root.svh(583) @ 0: reporter [UVMTOP] UVM testbench topology:
# KERNEL: ----------------------------------------------------------
# KERNEL: Name                   Type                    Size  Value
# KERNEL: ----------------------------------------------------------
# KERNEL: uvm_test_top           test                    -     @335 
# KERNEL:   envh                 env                     -     @350 
# KERNEL:     agnth              agent                   -     @361 
# KERNEL:       drvh             driver                  -     @373 
# KERNEL:         rsp_port       uvm_analysis_port       -     @392 
# KERNEL:         seq_item_port  uvm_seq_item_pull_port  -     @382 
# KERNEL:       monh             monitor                 -     @402 
# KERNEL: ----------------------------------------------------------
# KERNEL: 
# KERNEL: UVM_INFO /home/runner/testbench.sv(158) @ 0: uvm_test_top [ENFD_OF_ELABORATON_PHASE] BUILD PHASE CALLED FROM TEST COMPONENT
# KERNEL: UVM_INFO /home/build/vlib1/vlib/uvm-1.2/src/base/uvm_report_server.svh(869) @ 0: reporter [UVM/REPORT/SERVER] 
# KERNEL: --- UVM Report Summary ---
# KERNEL: 
# KERNEL: ** Report counts by severity
# KERNEL: UVM_INFO :   18
# KERNEL: UVM_WARNING :    0
# KERNEL: UVM_ERROR :    0
# KERNEL: UVM_FATAL :    0
# KERNEL: ** Report counts by id
# KERNEL: [BUILD_PHASE]     5
# KERNEL: [Connect_PHASE]     5
# KERNEL: [ENFD_OF_ELABORATON_PHASE]     1
# KERNEL: [ENFD_OF_ELaBORATON_PHASE]     4
# KERNEL: [RNTST]     1
# KERNEL: [UVM/RELNOTES]     1
# KERNEL: [UVMTOP]     1
# KERNEL: 
# RUNTIME: Info: RUNTIME_0068 uvm_root.svh (521): $finish called.
# KERNEL: Time: 0 ns,  Iteration: 195,  Instance: /top,  Process: @INITIAL#168_0@.
# KERNEL: stopped at time: 0 ns
# VSIM: Simulation has finished. There are no more test vectors to simulate.
# VSIM: Simulation has finished.
*/
