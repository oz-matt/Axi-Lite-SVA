property AXI4_ERRS_RDATA_STABLE;
    @(posedge AXI_ACLK)
    AXI_ARESETN & AXI_RVALID & !AXI_RREADY & !$isunknown({AXI_RVALID, AXI_RREADY})
    ##1 AXI_ARESETN
    |-> $stable(AXI_RDATA);
  endproperty
  AXI4_ERRS_RDATA_STABLE_inst: assert property (AXI4_ERRS_RDATA_STABLE);
    

  property AXI4_ERRS_RDATA_X;
    @(posedge AXI_ACLK)
    AXI_ARESETN & AXI_RVALID
    |-> !$isunknown(AXI_RDATA);
  endproperty
  AXI4_ERRS_RDATA_X_inst: assert property (AXI4_ERRS_RDATA_X);
    

  property AXI4_ERRS_RVALID_RESET;
    @(posedge AXI_ACLK)
    !AXI_ARESETN
    ##1 AXI_ARESETN
    |-> !AXI_RVALID;
  endproperty
  AXI4_ERRS_RVALID_RESET_inst: assert property (AXI4_ERRS_RVALID_RESET);

  property AXI4_ERRS_RVALID_STABLE;
    @(posedge AXI_ACLK)
    AXI_ARESETN & AXI_RVALID & !AXI_RREADY & !$isunknown({AXI_RVALID, AXI_RREADY})
    ##1 AXI_ARESETN
    |-> AXI_RVALID;
  endproperty
  AXI4_ERRS_RVALID_STABLE_inst: assert property (AXI4_ERRS_RVALID_STABLE);
    
    
  property AXI4_ERRS_RVALID_X;
    @(posedge AXI_ACLK)
    AXI_ARESETN
    |-> !$isunknown({AXI_RVALID});
  endproperty
  AXI4_ERRS_RVALID_X_inst: assert property (AXI4_ERRS_RVALID_X);
    
property AXI4_ERRM_RREADY_X;
    @(posedge AXI_ACLK)
    AXI_ARESETN
  |-> !$isunknown({AXI_RREADY});
  endproperty
  AXI4_ERRM_RREADY_X_inst: assert property (AXI4_ERRM_RREADY_X);

    
  property AXI4_RECM_RREADY_MAX_WAIT;
    @(posedge AXI_ACLK)
    AXI_ARESETN & AXI_RVALID & !AXI_RREADY & !$isunknown({AXI_RVALID, AXI_RREADY})
    |-> ##[1:`max_wait] AXI_RREADY;
  endproperty
  AXI4_RECM_RREADY_MAX_WAIT_inst: assert property (AXI4_RECM_RREADY_MAX_WAIT);

