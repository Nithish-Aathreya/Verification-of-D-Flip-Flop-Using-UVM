class d_agent extends uvm_agent;
  `uvm_component_utils(d_agent)
  
  
  d_seqr seqr;
  d_driver driv;
  d_monitor mon;
  
  //constructor
  function new (string name="d_agent",uvm_component parent);
    super.new(name,parent);
    `uvm_info("d_agent","constructor",UVM_MEDIUM)
  endfunction
  
    //buildphase
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    seqr= d_seqr::type_id::create("seqr",this);
    driv= d_driver::type_id::create("driv",this);
    mon= d_monitor::type_id::create("mon",this);
  endfunction
  
    //connectphase
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    `uvm_info("d_agent","connect phase",UVM_MEDIUM)
    driv.seq_item_port.connect(seqr.seq_item_export);
  endfunction
  
  
  
  
endclass
