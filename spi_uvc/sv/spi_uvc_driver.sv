`ifndef SPI_UVC_DRIVER_SV
`define SPI_UVC_DRIVER_SV

class spi_uvc_driver extends uvm_driver #(spi_uvc_sequence_item);

  `uvm_component_utils(spi_uvc_driver)

  virtual spi_uvc_if vif;
  spi_uvc_config     m_config;

  extern function new(string name, uvm_component parent);
  
  extern task run_phase(uvm_phase phase);
  extern task do_drive();

endclass : spi_uvc_driver


function spi_uvc_driver::new(string name, uvm_component parent);
  super.new(name, parent);
endfunction : new


task spi_uvc_driver::run_phase(uvm_phase phase);
  forever begin
    seq_item_port.get_next_item(req);
    do_drive();
    seq_item_port.item_done();
  end
endtask : run_phase


task spi_uvc_driver::do_drive();
  `uvm_info(get_type_name(), "PUT THE DRIVER CODE HERE", UVM_MEDIUM)
endtask : do_drive

`endif // SPI_UVC_DRIVER_SV