class d_env extends uvm_env;
  `uvm_component_utils(d_env)
  

  
  d_agent agent;
  d_scb scb;
  
  //constructor
  function new (string name="d_env",uvm_component parent);
    super.new(name,parent);
     `uvm_info("d_env","constructor",UVM_MEDIUM)
  endfunction
  
    //buildphase
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    agent= d_agent::type_id::create("agent",this);
    scb= d_scb::type_id::create("scb",this);
    
  endfunction
  
  //connectphase
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    `uvm_info("d_env","connect phase",UVM_MEDIUM)
    agent.mon.item_collected_port.connect(scb.item_collected_export);
  endfunction
  
  
  
  
endclass
