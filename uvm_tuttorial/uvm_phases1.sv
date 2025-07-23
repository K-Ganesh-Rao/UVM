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
    `uvm_info("BUILD_PHASE","BUILD PHASE CALLED FROM DRIVER COMPONENT",uvm_low);
    
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
    `uvm_info("BUILD_PHASE","BUILD PHASE CALLED FROM MONITOR COMPONENT",uvm_low);
    
  endfunction  
endclass

///////////////////////////////////////////////////////////////////////////

class agent extends uvm_agent;
  
  `uvm_component_utils(agent)
  driver drvh;
  monitor monh'
  
  function new(string name = "agent" , uvm_component parent);
    super.new(name,parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("BUILD_PHASE","BUILD PHASE CALLED FROM AGENT COMPONENT",uvm_low);
    
    drvh = driver :: type_id :: create("drvh",this);
    monh = monitor :: type_id :: create("monh",this);
    
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
      `uvm_info("BUILD_PHASE","BUILD PHASE CALLED FROM ENVIRONMENT COMPONENT",uvm_low);
      agnth = agent :: type_id :: create("agnth",this);
    
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
      `uvm_info("BUILD_PHASE","BUILD PHASE CALLED FROM TEST COMPONENT",uvm_low);
      envh = env :: type_id :: create("envh",this);
    
  endfunction  
  
endclass

///////////////////////////////////////////////////////////////////////////


module top;
  
  initial begin
    run_test("test");      // starts tb and initiates phasing 
 
  end
endmodule
