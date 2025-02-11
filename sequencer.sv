class d_seqr extends uvm_sequencer#(d_seqitem);
  `uvm_component_utils(d_seqr)
  
  //constructor
  function new (string name="d_seqr",uvm_component parent);
    super.new(name,parent);
    `uvm_info("d_seqr","constructor",UVM_MEDIUM)
  endfunction
  
    //buildphase
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
  endfunction
  
  
  
  
  
endclass
