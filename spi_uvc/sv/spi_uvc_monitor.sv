`ifndef SPI_UVC_MONITOR_SV
`define SPI_UVC_MONITOR_SV

class spi_uvc_monitor extends uvm_monitor;

  `uvm_component_utils(spi_uvc_monitor)

  uvm_analysis_port #(spi_uvc_sequence_item) analysis_port;

  virtual spi_uvc_if    vif;
  spi_uvc_config        m_config;
  spi_uvc_sequence_item m_trans;

  extern function new(string name, uvm_component parent);

  extern task run_phase(uvm_phase phase);
  extern task do_mon();

endclass : spi_uvc_monitor


function spi_uvc_monitor::new(string name, uvm_component parent);
  super.new(name, parent);
endfunction : new



task spi_uvc_monitor::run_phase(uvm_phase phase);
  m_trans = spi_uvc_sequence_item::type_id::create("m_trans");
  //do_mon();
endtask : run_phase


task spi_uvc_monitor::do_mon();
  forever begin
    `uvm_info(get_type_name(), "PUT THE MONITOR CODE HERE", UVM_MEDIUM)
    analysis_port.write(m_trans);
  end
endtask : do_mon

`endif // SPI_UVC_MONITOR_SV