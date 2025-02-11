class d_monitor extends uvm_monitor;
  `uvm_component_utils(d_monitor)
  
  uvm_analysis_port#(d_seqitem) item_collected_port;
  virtual d_intf intf;
  d_seqitem tx;
  
  //constructor
  function new (string name="d_monitor",uvm_component parent);
    super.new(name,parent);
    `uvm_info("d_monitor","constructor",UVM_MEDIUM)
  endfunction
  
    //buildphase
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    
    item_collected_port=new("item collected port",this);
    if(!uvm_config_db#(virtual d_intf)::get(this, "", "vif", intf))
      `uvm_fatal("no_inif in driver","virtual interface get failed from config db");
    
  endfunction
  
   task run_phase(uvm_phase phase);
    tx = d_seqitem::type_id::create("tx");
    wait(!intf.rst)
    
    //sampling the output
    @(posedge intf.clk)
    tx.rst = intf.rst;
    tx.d = intf.d;
    tx.q = intf.q;
  endtask
  
  
  
endclass
