interface axic_raddr
	#(
		parameter integer maxwait = 5
		)
		(
			input wire AXI_ACLK,    
		input wire AXI_ARESETN,
		input wire AXI_ARADDR,    
		input wire AXI_ARVALID,    
		input wire AXI_ARREADY
		);
	
	
property AXI4_ERRM_ARADDR_STABLE;
		@(posedge AXI_ACLK)
		!($isunknown({AXI_ARADDR, AXI_ARVALID, AXI_ARREADY})) &
		AXI_ARVALID & !AXI_ARREADY & AXI_ARESETN 
		##1 AXI_ARESETN 
		|-> $stable(AXI_ARADDR);
	endproperty
	AXI4_ERRM_ARADDR_STABLE_inst: assert property (AXI4_ERRM_ARADDR_STABLE);
	
	property AXI4_ERRM_ARADDR_X;
		@(posedge AXI_ACLK)
		AXI_ARVALID & AXI_ARESETN 
		|-> !$isunknown({AXI_ARADDR});
	endproperty
	AXI4_ERRM_ARADDR_X_inst: assert property (AXI4_ERRM_ARADDR_X);
		
	property AXI4_ERRM_ARVALID_RESET;
		@(posedge AXI_ACLK)
		!AXI_ARESETN & !$isunknown(AXI_ARESETN)
			##1  AXI_ARESETN
			|-> !AXI_ARVALID;
	endproperty
	AXI4_ERRM_ARVALID_RESET_inst: assert property (AXI4_ERRM_ARVALID_RESET);
		
		
	property AXI4_ERRM_ARVALID_STABLE;
		@(posedge AXI_ACLK)
		AXI_ARESETN & AXI_ARVALID & !AXI_ARREADY & !$isunknown({AXI_ARVALID, AXI_ARREADY})
			##1  AXI_ARESETN
			|-> AXI_ARVALID;
	endproperty
	AXI4_ERRM_ARVALID_STABLE_inst: assert property (AXI4_ERRM_ARVALID_STABLE);
		
	property AXI4_ERRM_ARVALID_X;
		@(posedge AXI_ACLK)
		AXI_ARESETN
		|-> !$isunknown({AXI_ARVALID});
	endproperty
	AXI4_ERRM_ARVALID_X_inst: assert property (AXI4_ERRM_ARVALID_X);
			
	property AXI4_ERRS_ARREADY_X;
		@(posedge AXI_ACLK)
		AXI_ARESETN
		|-> !$isunknown({AXI_ARREADY});
	endproperty
	AXI4_ERRS_ARREADY_X_inst: assert property (AXI4_ERRS_ARREADY_X);
		
	property AXI4_RECS_ARREADY_MAX_WAIT;
		@(posedge AXI_ACLK)
		AXI_ARESETN & AXI_ARVALID & !AXI_ARREADY & !$isunknown({AXI_ARVALID, AXI_ARREADY})
		|-> ##[1:maxwait] AXI_ARREADY;
	endproperty
	AXI4_RECS_ARREADY_MAX_WAIT_inst: assert property (AXI4_RECS_ARREADY_MAX_WAIT);
		
		
endinterface: axic_raddr
		
