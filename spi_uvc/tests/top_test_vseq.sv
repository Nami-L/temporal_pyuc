`ifndef TOP_TEST_VSEQ_SV
`define TOP_TEST_VSEQ_SV

class top_test_vseq extends uvm_sequence;

  `uvm_object_utils(top_test_vseq)
  `uvm_declare_p_sequencer(top_vsqr)

  extern function new(string name = "");

  extern task spi_uvc_seq();
  extern task body();

endclass : top_test_vseq


function top_test_vseq::new(string name = "");
  super.new(name);
endfunction : new


task top_test_vseq::spi_uvc_seq();
  // Write your sequence here
  // spi_uvc_sequence_base seq;
  // seq = spi_uvc_sequence_base::type_id::create("seq");
  // if (!seq.randomize()) begin
  //   `uvm_fatal(get_name(), "Failed to randomize sequence")
  // end
  // seq.start(p_sequencer.m_spi_sequencer)
endtask : spi_uvc_seq


task top_test_vseq::body();
  fork
    spi_uvc_seq();
  join
endtask : body

`endif // TOP_TEST_VSEQ_SV