`ifndef SPI_UVC_IF_SV
`define SPI_UVC_IF_SV

interface spi_uvc_if (
  input logic clk_i
);

  import spi_uvc_pkg::*;

  clocking cb_drv @(posedge clk_i);
    default input #1ns output #1ns;
  endclocking : cb_drv

  clocking cb_mon @(posedge clk_i);
    default input #1ns output #1ns;
  endclocking : cb_mon

  modport drv (clocking cb_drv);
  modport mon (clocking cb_mon);

endinterface : spi_uvc_if

`endif // SPI_UVC_IF_SV