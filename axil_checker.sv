`ifndef AXIL_CHECKER
`define AXIL_CHECKER

`define max_wait 5

interface axil_checker #(
		parameter integer C_AXI_DATA_WIDTH = 32,
		parameter integer C_AXI_ADDR_WIDTH = 8
	)
	(
		input logic AXI_ACLK,
		input logic AXI_ARESETN,

		// Read address    M -> S
		input logic [C_AXI_ADDR_WIDTH-1 : 0] AXI_ARADDR,
		input logic AXI_ARVALID,
		input logic AXI_ARREADY,

		// Read data    S -> M
		input logic [C_AXI_DATA_WIDTH-1 : 0] AXI_RDATA,
		input logic AXI_RVALID,
		input logic AXI_RREADY,

		// Write address   M -> S
		input logic [C_AXI_ADDR_WIDTH-1 : 0] AXI_AWADDR,
		input logic AXI_AWVALID,
		input logic AXI_AWREADY,

		// Write data    M -> S
		input logic [C_AXI_DATA_WIDTH-1 : 0] AXI_WDATA,
		input logic AXI_WVALID,
		input logic AXI_WREADY,

		// Write response    S -> M
		input logic [1:0] AXI_BRESP,
		input logic AXI_BVALID,
		input logic AXI_BREADY

	);

	axic_raddr#(`max_wait, C_AXI_DATA_WIDTH, C_AXI_ADDR_WIDTH) axic_raddr_inst(.*);
	axic_rdata#(`max_wait, C_AXI_DATA_WIDTH, C_AXI_ADDR_WIDTH) axic_rdata_inst(.*);
	axic_waddr#(`max_wait, C_AXI_DATA_WIDTH, C_AXI_ADDR_WIDTH) axic_waddr_inst(.*);
	axic_wdata#(`max_wait, C_AXI_DATA_WIDTH, C_AXI_ADDR_WIDTH) axic_wdata_inst(.*);
	axic_wresp#(`max_wait, C_AXI_DATA_WIDTH, C_AXI_ADDR_WIDTH) axic_wresp_inst(.*);

endinterface : axil_checker


`endif
