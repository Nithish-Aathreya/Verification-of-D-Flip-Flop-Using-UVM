class d_test extends uvm_test;
  `uvm_component_utils(d_test)
  
  d_env env;
  d_seq seq;
  //constructor
  
  function new (string name="d_test",uvm_component parent);
    super.new(name,parent);
    `uvm_info("d_test","constructor",UVM_MEDIUM)
  endfunction
  
  //buildphase
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    env= d_env::type_id::create("env",this);
    seq= d_seq::type_id::create("seq",this);
  endfunction
  
  //end of ellaboration
  
  virtual function void end_of_elaboration();
    `uvm_info("d_test","elaboration",UVM_MEDIUM)
    print();
  endfunction
  
  //run phase
  
    task run_phase(uvm_phase phase);
      `uvm_info("d_test","run phase",UVM_MEDIUM)
      
      phase.raise_objection(this);
      seq.start(env.agent.seqr);
      phase.drop_objection(this);
    endtask
  
  
  
  
endclass
