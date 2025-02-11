class d_seq extends uvm_sequence#(d_seqitem);
  `uvm_object_utils(d_seq)
  
  d_seqitem tx;
  
  //constructor
  function new (string name="d_seq");
    super.new(name);
    `uvm_info("d_seq","constructor",UVM_MEDIUM)
  endfunction
  
  
  task body();
    repeat(5) begin
      
    tx = d_seqitem ::type_id::create("tx");
    
    wait_for_grant();
    tx.randomize();// with (rst==1);
    send_request(tx);
    wait_for_item_done();
    
    end
  endtask
    
  
  
  
endclass
