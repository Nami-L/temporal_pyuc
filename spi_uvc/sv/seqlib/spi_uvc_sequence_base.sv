`ifndef SPI_UVC_SEQUENCE_BASE_SV
`define SPI_UVC_SEQUENCE_BASE_SV

class spi_uvc_sequence_base extends uvm_sequence #(spi_uvc_sequence_item);

  `uvm_object_utils(spi_uvc_sequence_base)

  extern function new(string name = "");

  extern virtual task body();

endclass : spi_uvc_sequence_base


function spi_uvc_sequence_base::new(string name = "");
  super.new(name);
endfunction : new


task spi_uvc_sequence_base::body();
    req = spi_uvc_sequence_item::type_id::create("req");
    start_item(req);
    if ( !req.randomize() ) begin
      `uvm_error(get_type_name(), "Failed to randomize transaction")
    end
    finish_item(req);
endtask : body

`endif // SPI_UVC_SEQUENCE_BASE_SV