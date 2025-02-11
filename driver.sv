class d_driver extends uvm_driver#(d_seqitem);
  `uvm_component_utils(d_driver)
  
  virtual d_intf intf;
  d_seqitem tx;
  
  //constructor
  function new (string name="d_driver",uvm_component parent);
    super.new(name,parent);
    `uvm_info("d_driver","constructor",UVM_MEDIUM)
  endfunction
  
    //buildphase
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if(!uvm_config_db#(virtual d_intf)::get(this, "", "vif", intf))
      `uvm_fatal("no_inif in driver","virtual interface get failed from config db");
  endfunction
  
  //runphase
  
 task run_phase(uvm_phase phase);
    forever begin
      `uvm_info("driver Class", "run_phase", UVM_MEDIUM)

      seq_item_port.get_next_item(tx);
      drive(tx);
      seq_item_port.item_done();
    end
  endtask
  
  task drive(d_seqitem tx);
    @(posedge intf.clk)
    intf.rst <= tx.rst;
    intf.d <= tx.d;
    intf.q <= tx.q;
  endtask
    
  
  
endclass
