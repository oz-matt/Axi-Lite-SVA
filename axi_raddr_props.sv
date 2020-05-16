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
    
  property AXI4_ERRM_ARPROT_STABLE;
    @(posedge AXI_ACLK)
    !($isunknown({AXI_ARADDR, AXI_ARVALID, AXI_ARREADY})) &
    AXI_ARVALID & !AXI_ARREADY & AXI_ARESETN 
    ##1 AXI_ARESETN 
    |-> $stable(AXI_ARPROT);
  endproperty
  AXI4_ERRM_ARPROT_STABLE_inst: assert property (AXI4_ERRM_ARPROT_STABLE);
    
  property AXI4_ERRM_ARPROT_X;
    @(posedge AXI_ACLK)
    AXI_ARVALID & AXI_ARESETN 
    |-> !$isunknown({AXI_ARPROT});
  endproperty
  AXI4_ERRM_ARPROT_X_inst: assert property (AXI4_ERRM_ARPROT_X);
    
  property AXI4_ERRM_ARVALID_RESET;
    @(posedge AXI_ACLK)
    !AXI_ARESETN & !$isunknown(AXI_ARESETN)
      ##1  AXI_ARESETN
      |-> !AXI_ARVALID;
  endproperty
  AXI4_ERRM_ARVALID_RESET_inst: assert property (AXI4_ERRM_ARVALID_RESET);
    
