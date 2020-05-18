interface axic_waddr
  #(
    parameter integer maxwait = 5
  )
  (
    input wire AXI_ACLK,
    input wire AXI_ARESETN,
    input wire AXI_AWADDR,
    input wire AXI_AWVALID,
    input wire AXI_AWREADY
  );

  property AXI4_ERRM_AWADDR_STABLE;
    @(posedge AXI_ACLK)
      !($isunknown({AXI_AWADDR, AXI_AWVALID, AXI_AWREADY})) &
      AXI_AWVALID & !AXI_AWREADY & AXI_ARESETN
      ##1 AXI_ARESETN
      |-> $stable(AXI_AWADDR);
  endproperty
  AXI4_ERRM_AWADDR_STABLE_inst: assert property (AXI4_ERRM_AWADDR_STABLE);

  property AXI4_ERRM_AWADDR_X;
    @(posedge AXI_ACLK)
      AXI_AWVALID & AXI_ARESETN
      |-> !$isunknown({AXI_AWADDR});
  endproperty
  AXI4_ERRM_AWADDR_X_inst: assert property (AXI4_ERRM_AWADDR_X);


  property AXI4_ERRM_AWVALID_RESET;
    @(posedge AXI_ACLK)
      !AXI_ARESETN & !$isunknown(AXI_ARESETN)
      ##1 AXI_ARESETN
      |-> !AXI_AWVALID;
  endproperty
  AXI4_ERRM_AWVALID_RESET_inst: assert property (AXI4_ERRM_AWVALID_RESET);

  property AXI4_ERRM_AWVALID_STABLE;
    @(posedge AXI_ACLK)
      AXI_ARESETN & AXI_AWVALID & !AXI_AWREADY & !$isunknown({AXI_AWVALID, AXI_AWREADY})
      ##1 AXI_ARESETN
      |-> AXI_AWVALID;
  endproperty
  AXI4_ERRM_AWVALID_STABLE_inst: assert property (AXI4_ERRM_AWVALID_STABLE);

  property AXI4_ERRM_AWVALID_X;
    @(posedge AXI_ACLK)
      AXI_ARESETN
      |-> !$isunknown({AXI_AWVALID});
  endproperty
  AXI4_ERRM_AWVALID_X_inst: assert property (AXI4_ERRM_AWVALID_X);

  property AXI4_ERRS_AWREADY_X;
    @(posedge AXI_ACLK)
      AXI_ARESETN
      |-> !$isunknown({AXI_AWREADY});
  endproperty
  AXI4_ERRS_AWREADY_X_inst: assert property (AXI4_ERRS_AWREADY_X);

  property AXI4_RECS_AWREADY_MAX_WAIT;
    @(posedge AXI_ACLK)
      AXI_ARESETN & AXI_AWVALID & !AXI_AWREADY & !$isunknown({AXI_AWVALID, AXI_AWREADY})
      |-> ##[1:maxwait] AXI_AWREADY;
  endproperty
  AXI4_RECS_AWREADY_MAX_WAIT_inst: assert property (AXI4_RECS_AWREADY_MAX_WAIT);

endinterface: axic_waddr

