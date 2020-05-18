interface axic_wdata
  #(
    parameter integer maxwait = 5
  )
  (
    input wire AXI_ACLK,
    input wire AXI_ARESETN,
    input wire AXI_WDATA,
    input wire AXI_WVALID,
    input wire AXI_WREADY
  );

  property AXI4_ERRM_WDATA_STABLE;
    @(posedge AXI_ACLK)
      AXI_ARESETN & AXI_WVALID & !AXI_WREADY & !$isunknown({AXI_WVALID, AXI_WREADY})
      ##1 AXI_ARESETN
      |-> $stable(AXI_WDATA);
  endproperty
  AXI4_ERRM_WDATA_STABLE_inst: assert property (AXI4_ERRM_WDATA_STABLE);


  property AXI4_ERRM_WDATA_X;
    @(posedge AXI_ACLK)
      AXI_ARESETN & AXI_WVALID
      |-> !$isunknown(AXI_WDATA);
  endproperty
  AXI4_ERRM_WDATA_X_inst: assert property (AXI4_ERRM_WDATA_X);


  property AXI4_ERRM_WVALID_RESET;
    @(posedge AXI_ACLK)
      !AXI_ARESETN
      ##1 AXI_ARESETN
      |-> !AXI_WVALID;
  endproperty
  AXI4_ERRM_WVALID_RESET_inst: assert property (AXI4_ERRM_WVALID_RESET);

  property AXI4_ERRM_WVALID_STABLE;
    @(posedge AXI_ACLK)
      AXI_ARESETN & AXI_WVALID & !AXI_WREADY & !$isunknown({AXI_WVALID, AXI_WREADY})
      ##1 AXI_ARESETN
      |-> AXI_WVALID;
  endproperty
  AXI4_ERRM_WVALID_STABLE_inst: assert property (AXI4_ERRM_WVALID_STABLE);


  property AXI4_ERRM_WVALID_X;
    @(posedge AXI_ACLK)
      AXI_ARESETN
      |-> !$isunknown({AXI_WVALID});
  endproperty
  AXI4_ERRM_WVALID_X_inst: assert property (AXI4_ERRM_WVALID_X);

  property AXI4_ERRS_WREADY_X;
    @(posedge AXI_ACLK)
      AXI_ARESETN
      |-> !$isunknown({AXI_WREADY});
  endproperty
  AXI4_ERRS_WREADY_X_inst: assert property (AXI4_ERRS_WREADY_X);


  property AXI4_RECS_WREADY_MAX_WAIT;
    @(posedge AXI_ACLK)
      AXI_ARESETN & AXI_WVALID & !AXI_WREADY & !$isunknown({AXI_WVALID, AXI_WREADY})
      |-> ##[1:maxwait] AXI_WREADY;
  endproperty
  AXI4_RECS_WREADY_MAX_WAIT_inst: assert property (AXI4_RECS_WREADY_MAX_WAIT);

endinterface: axic_wdata