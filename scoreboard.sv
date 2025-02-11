class d_scb extends uvm_scoreboard;
  `uvm_component_utils(d_scb)
  
  uvm_analysis_imp#(d_seqitem, d_scb) item_collected_export;

  
   d_seqitem tx_q[$];

  
  //constructor
  function new (string name="d_scb",uvm_component parent);
    super.new(name,parent);
    `uvm_info("d_scb","constructor",UVM_MEDIUM)
  endfunction
  
    //buildphase
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    
    item_collected_export=new("item collected export",this);
  endfunction
  
  virtual function void write(d_seqitem tx);
    //pkt.print();
    tx_q.push_back(tx);
  endfunction
  
  
  
  
  
  
endclass
