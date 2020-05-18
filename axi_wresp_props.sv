interface axic_wresp
  #(
    parameter integer maxwait = 5
  )
  (
    input wire AXI_ACLK,
    input wire AXI_ARESETN,
    input wire AXI_BRESP,
    input wire AXI_BVALID,
    input wire AXI_BREADY
  );

  property AXI4_ERRS_BRESP_STABLE;
    @(posedge AXI_ACLK)
      AXI_ARESETN & AXI_BVALID & !AXI_BREADY & !$isunknown({AXI_BVALID, AXI_BREADY, AXI_BRESP})
      ##1 AXI_ARESETN
      |-> $stable(AXI_BRESP);
  endproperty
  AXI4_ERRS_BRESP_STABLE_inst: assert property (AXI4_ERRS_BRESP_STABLE);

  property AXI4_ERRS_BRESP_X;
    @(posedge AXI_ACLK)
      AXI_ARESETN & AXI_BVALID
      |-> !$isunknown(AXI_BRESP);
  endproperty
  AXI4_ERRS_BRESP_X_inst: assert property (AXI4_ERRS_BRESP_X);

  property AXI4_ERRS_BVALID_RESET;
    @(posedge AXI_ACLK)
      !AXI_ARESETN
      ##1 AXI_ARESETN
      |-> !AXI_BVALID;
  endproperty
  AXI4_ERRS_BVALID_RESET_inst: assert property (AXI4_ERRS_BVALID_RESET);

  property AXI4_ERRS_BVALID_STABLE;
    @(posedge AXI_ACLK)
      AXI_ARESETN & AXI_BVALID & !AXI_BREADY & !$isunknown({AXI_BVALID, AXI_BREADY})
      ##1 AXI_ARESETN
      |-> AXI_BVALID;
  endproperty
  AXI4_ERRS_BVALID_STABLE_inst: assert property (AXI4_ERRS_BVALID_STABLE);

  property AXI4_ERRS_BVALID_X;
    @(posedge AXI_ACLK)
      AXI_ARESETN
      |-> !$isunknown({AXI_BVALID});
  endproperty
  AXI4_ERRS_BVALID_X_inst: assert property (AXI4_ERRS_BVALID_X);

  property AXI4_ERRM_BREADY_X;
    @(posedge AXI_ACLK)
      AXI_ARESETN
      |-> !$isunknown({AXI_BREADY});
  endproperty
  AXI4_ERRM_BREADY_X_inst: assert property (AXI4_ERRM_BREADY_X);


  property AXI4_RECM_BREADY_MAX_WAIT;
    @(posedge AXI_ACLK)
      AXI_ARESETN & AXI_BVALID & !AXI_BREADY & !$isunknown({AXI_BVALID, AXI_BREADY})
      |-> ##[1:maxwait] AXI_BREADY;
  endproperty
  AXI4_RECM_BREADY_MAX_WAIT_inst: assert property (AXI4_RECM_BREADY_MAX_WAIT);

endinterface: axic_wresp