class d_seqitem extends uvm_sequence_item;
  `uvm_object_utils(d_seqitem)
  
  rand logic d;
  rand logic rst;
   logic q;
  
  //constructor
  function new (string name="d_seqitem");
    super.new(name);
    `uvm_info("d_seqitem","constructor",UVM_MEDIUM)
  endfunction
  
   constraint wr_rd_c { rst != 1; }; 
  
  
endclass
