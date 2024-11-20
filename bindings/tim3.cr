# General purpose timer
module TIM3
  VERSION      = nil
  BASE_ADDRESS = 0x40000400_u64

  # control register 1
  struct CR1
    ADDRESS = BASE_ADDRESS + 0x0_u64

    protected def self.address : UInt64
      ADDRESS
    end

    @value : UInt32

    def initialize(@value : UInt32)
    end

    def to_int : UInt32
      @value
    end

    def self.reset_value : self
      new(0x0_u64)
    end

    def self.pointer : Pointer(UInt32)
      Pointer(UInt32).new(self.address)
    end

    def self.value : self
      value = self.pointer.load(volatile: true)
      new(value)
    end

    def self.value=(value : self) : self
      self.pointer.store(value.to_int, volatile: true)
      value
    end

    enum CEN : UInt8
      # Counter disabled
      DISABLED = 0x0_u64

      # Counter enabled
      ENABLED = 0x1_u64

      def self.reset_value : CEN
        CR1.reset_value.cen
      end
    end

    # Counter enable
    def cen : CEN
      CEN.new!((@value >> 0) & 0x1_u32)
    end

    # Counter enable
    def self.cen : CEN
      value.cen
    end

    # Counter enable
    def self.cen=(value : CEN) : CEN
      self.set(cen: value)
      value
    end

    enum UDIS : UInt8
      # Update event enabled
      ENABLED = 0x0_u64

      # Update event disabled
      DISABLED = 0x1_u64

      def self.reset_value : UDIS
        CR1.reset_value.udis
      end
    end

    # Update disable
    def udis : UDIS
      UDIS.new!((@value >> 1) & 0x1_u32)
    end

    # Update disable
    def self.udis : UDIS
      value.udis
    end

    # Update disable
    def self.udis=(value : UDIS) : UDIS
      self.set(udis: value)
      value
    end

    enum URS : UInt8
      # Any of counter overflow/underflow, setting UG, or update through slave mode, generates an update interrupt or DMA request
      ANYEVENT = 0x0_u64

      # Only counter overflow/underflow generates an update interrupt or DMA request
      COUNTERONLY = 0x1_u64

      def self.reset_value : URS
        CR1.reset_value.urs
      end
    end

    # Update request source
    def urs : URS
      URS.new!((@value >> 2) & 0x1_u32)
    end

    # Update request source
    def self.urs : URS
      value.urs
    end

    # Update request source
    def self.urs=(value : URS) : URS
      self.set(urs: value)
      value
    end

    enum OPM : UInt8
      # Counter is not stopped at update event
      DISABLED = 0x0_u64

      # Counter stops counting at the next update event (clearing the CEN bit)
      ENABLED = 0x1_u64

      def self.reset_value : OPM
        CR1.reset_value.opm
      end
    end

    # One-pulse mode
    def opm : OPM
      OPM.new!((@value >> 3) & 0x1_u32)
    end

    # One-pulse mode
    def self.opm : OPM
      value.opm
    end

    # One-pulse mode
    def self.opm=(value : OPM) : OPM
      self.set(opm: value)
      value
    end

    enum DIR : UInt8
      # Counter used as upcounter
      UP = 0x0_u64

      # Counter used as downcounter
      DOWN = 0x1_u64

      def self.reset_value : DIR
        CR1.reset_value.dir
      end
    end

    # Direction
    def dir : DIR
      DIR.new!((@value >> 4) & 0x1_u32)
    end

    # Direction
    def self.dir : DIR
      value.dir
    end

    # Direction
    def self.dir=(value : DIR) : DIR
      self.set(dir: value)
      value
    end

    enum CMS : UInt8
      # The counter counts up or down depending on the direction bit
      EDGEALIGNED = 0x0_u64

      # The counter counts up and down alternatively. Output compare interrupt flags are set only when the counter is counting down.
      CENTERALIGNED1 = 0x1_u64

      # The counter counts up and down alternatively. Output compare interrupt flags are set only when the counter is counting up.
      CENTERALIGNED2 = 0x2_u64

      # The counter counts up and down alternatively. Output compare interrupt flags are set both when the counter is counting up or down.
      CENTERALIGNED3 = 0x3_u64

      def self.reset_value : CMS
        CR1.reset_value.cms
      end
    end

    # Center-aligned mode              selection
    def cms : CMS
      CMS.new!((@value >> 5) & 0x3_u32)
    end

    # Center-aligned mode              selection
    def self.cms : CMS
      value.cms
    end

    # Center-aligned mode              selection
    def self.cms=(value : CMS) : CMS
      self.set(cms: value)
      value
    end

    enum ARPE : UInt8
      # TIMx_APRR register is not buffered
      DISABLED = 0x0_u64

      # TIMx_APRR register is buffered
      ENABLED = 0x1_u64

      def self.reset_value : ARPE
        CR1.reset_value.arpe
      end
    end

    # Auto-reload preload enable
    def arpe : ARPE
      ARPE.new!((@value >> 7) & 0x1_u32)
    end

    # Auto-reload preload enable
    def self.arpe : ARPE
      value.arpe
    end

    # Auto-reload preload enable
    def self.arpe=(value : ARPE) : ARPE
      self.set(arpe: value)
      value
    end

    enum CKD : UInt8
      # t_DTS = t_CK_INT
      DIV1 = 0x0_u64

      # t_DTS = 2 × t_CK_INT
      DIV2 = 0x1_u64

      # t_DTS = 4 × t_CK_INT
      DIV4 = 0x2_u64

      def self.reset_value : CKD
        CR1.reset_value.ckd
      end
    end

    # Clock division
    def ckd : CKD
      CKD.new!((@value >> 8) & 0x3_u32)
    end

    # Clock division
    def self.ckd : CKD
      value.ckd
    end

    # Clock division
    def self.ckd=(value : CKD) : CKD
      self.set(ckd: value)
      value
    end

    # UIF status bit remapping
    def uifremap : Bool
      @value.bits_set?(0x800_u32)
    end

    # UIF status bit remapping
    def self.uifremap : Bool
      value.uifremap
    end

    # UIF status bit remapping
    def self.uifremap=(value : Bool) : Bool
      self.set(uifremap: value)
      value
    end

    def copy_with(
      *,

      cen : CEN? = nil,

      udis : UDIS? = nil,

      urs : URS? = nil,

      opm : OPM? = nil,

      dir : DIR? = nil,

      cms : CMS? = nil,

      arpe : ARPE? = nil,

      ckd : CKD? = nil,

      uifremap : Bool? = nil
    ) : self
      value = @value

      unless cen.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(cen.to_int).&(0x1_u32) << 0
      end

      unless udis.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(udis.to_int).&(0x1_u32) << 1
      end

      unless urs.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(urs.to_int).&(0x1_u32) << 2
      end

      unless opm.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(opm.to_int).&(0x1_u32) << 3
      end

      unless dir.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(dir.to_int).&(0x1_u32) << 4
      end

      unless cms.nil?
        value = (value & 0xffffff9f_u32) |
                UInt32.new!(cms.to_int).&(0x3_u32) << 5
      end

      unless arpe.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(arpe.to_int).&(0x1_u32) << 7
      end

      unless ckd.nil?
        value = (value & 0xfffffcff_u32) |
                UInt32.new!(ckd.to_int).&(0x3_u32) << 8
      end

      unless uifremap.nil?
        value = (value & 0xfffff7ff_u32) |
                UInt32.new!(uifremap.to_int).&(0x1_u32) << 11
      end

      self.class.new(value)
    end

    def self.set(
      *,
      cen : CEN? = nil,
      udis : UDIS? = nil,
      urs : URS? = nil,
      opm : OPM? = nil,
      dir : DIR? = nil,
      cms : CMS? = nil,
      arpe : ARPE? = nil,
      ckd : CKD? = nil,
      uifremap : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        cen: cen,
        udis: udis,
        urs: urs,
        opm: opm,
        dir: dir,
        cms: cms,
        arpe: arpe,
        ckd: ckd,
        uifremap: uifremap,
      )
    end
  end # struct

  # control register 2
  struct CR2
    ADDRESS = BASE_ADDRESS + 0x4_u64

    protected def self.address : UInt64
      ADDRESS
    end

    @value : UInt32

    def initialize(@value : UInt32)
    end

    def to_int : UInt32
      @value
    end

    def self.reset_value : self
      new(0x0_u64)
    end

    def self.pointer : Pointer(UInt32)
      Pointer(UInt32).new(self.address)
    end

    def self.value : self
      value = self.pointer.load(volatile: true)
      new(value)
    end

    def self.value=(value : self) : self
      self.pointer.store(value.to_int, volatile: true)
      value
    end

    enum TI1S : UInt8
      # The TIMx_CH1 pin is connected to TI1 input
      NORMAL = 0x0_u64

      # The TIMx_CH1, CH2, CH3 pins are connected to TI1 input
      XOR = 0x1_u64

      def self.reset_value : TI1S
        CR2.reset_value.ti1_s
      end
    end

    # TI1 selection
    def ti1_s : TI1S
      TI1S.new!((@value >> 7) & 0x1_u32)
    end

    # TI1 selection
    def self.ti1_s : TI1S
      value.ti1_s
    end

    # TI1 selection
    def self.ti1_s=(value : TI1S) : TI1S
      self.set(ti1_s: value)
      value
    end

    enum MMS : UInt8
      # The UG bit from the TIMx_EGR register is used as trigger output
      RESET = 0x0_u64

      # The counter enable signal, CNT_EN, is used as trigger output
      ENABLE = 0x1_u64

      # The update event is selected as trigger output
      UPDATE = 0x2_u64

      # The trigger output send a positive pulse when the CC1IF flag it to be set, as soon as a capture or a compare match occurred
      COMPAREPULSE = 0x3_u64

      # OC1REF signal is used as trigger output
      COMPAREOC1 = 0x4_u64

      # OC2REF signal is used as trigger output
      COMPAREOC2 = 0x5_u64

      # OC3REF signal is used as trigger output
      COMPAREOC3 = 0x6_u64

      # OC4REF signal is used as trigger output
      COMPAREOC4 = 0x7_u64

      def self.reset_value : MMS
        CR2.reset_value.mms
      end
    end

    # Master mode selection
    def mms : MMS
      MMS.new!((@value >> 4) & 0x7_u32)
    end

    # Master mode selection
    def self.mms : MMS
      value.mms
    end

    # Master mode selection
    def self.mms=(value : MMS) : MMS
      self.set(mms: value)
      value
    end

    enum CCDS : UInt8
      # CCx DMA request sent when CCx event occurs
      ONCOMPARE = 0x0_u64

      # CCx DMA request sent when update event occurs
      ONUPDATE = 0x1_u64

      def self.reset_value : CCDS
        CR2.reset_value.ccds
      end
    end

    # Capture/compare DMA              selection
    def ccds : CCDS
      CCDS.new!((@value >> 3) & 0x1_u32)
    end

    # Capture/compare DMA              selection
    def self.ccds : CCDS
      value.ccds
    end

    # Capture/compare DMA              selection
    def self.ccds=(value : CCDS) : CCDS
      self.set(ccds: value)
      value
    end

    def copy_with(
      *,

      ti1_s : TI1S? = nil,

      mms : MMS? = nil,

      ccds : CCDS? = nil
    ) : self
      value = @value

      unless ti1_s.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(ti1_s.to_int).&(0x1_u32) << 7
      end

      unless mms.nil?
        value = (value & 0xffffff8f_u32) |
                UInt32.new!(mms.to_int).&(0x7_u32) << 4
      end

      unless ccds.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(ccds.to_int).&(0x1_u32) << 3
      end

      self.class.new(value)
    end

    def self.set(
      *,
      ti1_s : TI1S? = nil,
      mms : MMS? = nil,
      ccds : CCDS? = nil
    ) : Nil
      self.value = self.value.copy_with(
        ti1_s: ti1_s,
        mms: mms,
        ccds: ccds,
      )
    end
  end # struct

  # slave mode control register
  struct SMCR
    ADDRESS = BASE_ADDRESS + 0x8_u64

    protected def self.address : UInt64
      ADDRESS
    end

    @value : UInt32

    def initialize(@value : UInt32)
    end

    def to_int : UInt32
      @value
    end

    def self.reset_value : self
      new(0x0_u64)
    end

    def self.pointer : Pointer(UInt32)
      Pointer(UInt32).new(self.address)
    end

    def self.value : self
      value = self.pointer.load(volatile: true)
      new(value)
    end

    def self.value=(value : self) : self
      self.pointer.store(value.to_int, volatile: true)
      value
    end

    enum SMS : UInt8
      # Slave mode disabled - if CEN = ‘1 then the prescaler is clocked directly by the internal clock.
      DISABLED = 0x0_u64

      # Encoder mode 1 - Counter counts up/down on TI2FP1 edge depending on TI1FP2 level.
      ENCODER_MODE_1 = 0x1_u64

      # Encoder mode 2 - Counter counts up/down on TI1FP2 edge depending on TI2FP1 level.
      ENCODER_MODE_2 = 0x2_u64

      # Encoder mode 3 - Counter counts up/down on both TI1FP1 and TI2FP2 edges depending on the level of the other input.
      ENCODER_MODE_3 = 0x3_u64

      # Reset Mode - Rising edge of the selected trigger input (TRGI) reinitializes the counter and generates an update of the registers.
      RESET_MODE = 0x4_u64

      # Gated Mode - The counter clock is enabled when the trigger input (TRGI) is high. The counter stops (but is not reset) as soon as the trigger becomes low. Both start and stop of the counter are controlled.
      GATED_MODE = 0x5_u64

      # Trigger Mode - The counter starts at a rising edge of the trigger TRGI (but it is not reset). Only the start of the counter is controlled.
      TRIGGER_MODE = 0x6_u64

      # External Clock Mode 1 - Rising edges of the selected trigger (TRGI) clock the counter.
      EXT_CLOCK_MODE = 0x7_u64

      def self.reset_value : SMS
        SMCR.reset_value.sms
      end
    end

    # Slave mode selection
    def sms : SMS
      SMS.new!((@value >> 0) & 0x7_u32)
    end

    # Slave mode selection
    def self.sms : SMS
      value.sms
    end

    # Slave mode selection
    def self.sms=(value : SMS) : SMS
      self.set(sms: value)
      value
    end

    # OCREF clear selection
    def occs : Bool
      @value.bits_set?(0x8_u32)
    end

    # OCREF clear selection
    def self.occs : Bool
      value.occs
    end

    # OCREF clear selection
    def self.occs=(value : Bool) : Bool
      self.set(occs: value)
      value
    end

    enum TS : UInt8
      # Internal Trigger 0 (ITR0)
      ITR0 = 0x0_u64

      # Internal Trigger 1 (ITR1)
      ITR1 = 0x1_u64

      # Internal Trigger 2 (ITR2)
      ITR2 = 0x2_u64

      # TI1 Edge Detector (TI1F_ED)
      TI1F_ED = 0x4_u64

      # Filtered Timer Input 1 (TI1FP1)
      TI1FP1 = 0x5_u64

      # Filtered Timer Input 2 (TI2FP2)
      TI2FP2 = 0x6_u64

      # External Trigger input (ETRF)
      ETRF = 0x7_u64

      def self.reset_value : TS
        SMCR.reset_value.ts
      end
    end

    # Trigger selection
    def ts : TS
      TS.new!((@value >> 4) & 0x7_u32)
    end

    # Trigger selection
    def self.ts : TS
      value.ts
    end

    # Trigger selection
    def self.ts=(value : TS) : TS
      self.set(ts: value)
      value
    end

    enum MSM : UInt8
      # No action
      NOSYNC = 0x0_u64

      # The effect of an event on the trigger input (TRGI) is delayed to allow a perfect synchronization between the current timer and its slaves (through TRGO). It is useful if we want to synchronize several timers on a single external event.
      SYNC = 0x1_u64

      def self.reset_value : MSM
        SMCR.reset_value.msm
      end
    end

    # Master/Slave mode
    def msm : MSM
      MSM.new!((@value >> 7) & 0x1_u32)
    end

    # Master/Slave mode
    def self.msm : MSM
      value.msm
    end

    # Master/Slave mode
    def self.msm=(value : MSM) : MSM
      self.set(msm: value)
      value
    end

    enum ETF : UInt8
      # No filter, sampling is done at fDTS
      NOFILTER = 0x0_u64

      # fSAMPLING=fCK_INT, N=2
      FCK_INT_N2 = 0x1_u64

      # fSAMPLING=fCK_INT, N=4
      FCK_INT_N4 = 0x2_u64

      # fSAMPLING=fCK_INT, N=8
      FCK_INT_N8 = 0x3_u64

      # fSAMPLING=fDTS/2, N=6
      FDTS_DIV2_N6 = 0x4_u64

      # fSAMPLING=fDTS/2, N=8
      FDTS_DIV2_N8 = 0x5_u64

      # fSAMPLING=fDTS/4, N=6
      FDTS_DIV4_N6 = 0x6_u64

      # fSAMPLING=fDTS/4, N=8
      FDTS_DIV4_N8 = 0x7_u64

      # fSAMPLING=fDTS/8, N=6
      FDTS_DIV8_N6 = 0x8_u64

      # fSAMPLING=fDTS/8, N=8
      FDTS_DIV8_N8 = 0x9_u64

      # fSAMPLING=fDTS/16, N=5
      FDTS_DIV16_N5 = 0xa_u64

      # fSAMPLING=fDTS/16, N=6
      FDTS_DIV16_N6 = 0xb_u64

      # fSAMPLING=fDTS/16, N=8
      FDTS_DIV16_N8 = 0xc_u64

      # fSAMPLING=fDTS/32, N=5
      FDTS_DIV32_N5 = 0xd_u64

      # fSAMPLING=fDTS/32, N=6
      FDTS_DIV32_N6 = 0xe_u64

      # fSAMPLING=fDTS/32, N=8
      FDTS_DIV32_N8 = 0xf_u64

      def self.reset_value : ETF
        SMCR.reset_value.etf
      end
    end

    # External trigger filter
    def etf : ETF
      ETF.new!((@value >> 8) & 0xf_u32)
    end

    # External trigger filter
    def self.etf : ETF
      value.etf
    end

    # External trigger filter
    def self.etf=(value : ETF) : ETF
      self.set(etf: value)
      value
    end

    enum ETPS : UInt8
      # Prescaler OFF
      DIV1 = 0x0_u64

      # ETRP frequency divided by 2
      DIV2 = 0x1_u64

      # ETRP frequency divided by 4
      DIV4 = 0x2_u64

      # ETRP frequency divided by 8
      DIV8 = 0x3_u64

      def self.reset_value : ETPS
        SMCR.reset_value.etps
      end
    end

    # External trigger prescaler
    def etps : ETPS
      ETPS.new!((@value >> 12) & 0x3_u32)
    end

    # External trigger prescaler
    def self.etps : ETPS
      value.etps
    end

    # External trigger prescaler
    def self.etps=(value : ETPS) : ETPS
      self.set(etps: value)
      value
    end

    enum ECE : UInt8
      # External clock mode 2 disabled
      DISABLED = 0x0_u64

      # External clock mode 2 enabled. The counter is clocked by any active edge on the ETRF signal.
      ENABLED = 0x1_u64

      def self.reset_value : ECE
        SMCR.reset_value.ece
      end
    end

    # External clock enable
    def ece : ECE
      ECE.new!((@value >> 14) & 0x1_u32)
    end

    # External clock enable
    def self.ece : ECE
      value.ece
    end

    # External clock enable
    def self.ece=(value : ECE) : ECE
      self.set(ece: value)
      value
    end

    enum ETP : UInt8
      # ETR is noninverted, active at high level or rising edge
      NOTINVERTED = 0x0_u64

      # ETR is inverted, active at low level or falling edge
      INVERTED = 0x1_u64

      def self.reset_value : ETP
        SMCR.reset_value.etp
      end
    end

    # External trigger polarity
    def etp : ETP
      ETP.new!((@value >> 15) & 0x1_u32)
    end

    # External trigger polarity
    def self.etp : ETP
      value.etp
    end

    # External trigger polarity
    def self.etp=(value : ETP) : ETP
      self.set(etp: value)
      value
    end

    # Slave mode selection bit3
    def sms_3 : Bool
      @value.bits_set?(0x10000_u32)
    end

    # Slave mode selection bit3
    def self.sms_3 : Bool
      value.sms_3
    end

    # Slave mode selection bit3
    def self.sms_3=(value : Bool) : Bool
      self.set(sms_3: value)
      value
    end

    def copy_with(
      *,

      sms : SMS? = nil,

      occs : Bool? = nil,

      ts : TS? = nil,

      msm : MSM? = nil,

      etf : ETF? = nil,

      etps : ETPS? = nil,

      ece : ECE? = nil,

      etp : ETP? = nil,

      sms_3 : Bool? = nil
    ) : self
      value = @value

      unless sms.nil?
        value = (value & 0xfffffff8_u32) |
                UInt32.new!(sms.to_int).&(0x7_u32) << 0
      end

      unless occs.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(occs.to_int).&(0x1_u32) << 3
      end

      unless ts.nil?
        value = (value & 0xffffff8f_u32) |
                UInt32.new!(ts.to_int).&(0x7_u32) << 4
      end

      unless msm.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(msm.to_int).&(0x1_u32) << 7
      end

      unless etf.nil?
        value = (value & 0xfffff0ff_u32) |
                UInt32.new!(etf.to_int).&(0xf_u32) << 8
      end

      unless etps.nil?
        value = (value & 0xffffcfff_u32) |
                UInt32.new!(etps.to_int).&(0x3_u32) << 12
      end

      unless ece.nil?
        value = (value & 0xffffbfff_u32) |
                UInt32.new!(ece.to_int).&(0x1_u32) << 14
      end

      unless etp.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(etp.to_int).&(0x1_u32) << 15
      end

      unless sms_3.nil?
        value = (value & 0xfffeffff_u32) |
                UInt32.new!(sms_3.to_int).&(0x1_u32) << 16
      end

      self.class.new(value)
    end

    def self.set(
      *,
      sms : SMS? = nil,
      occs : Bool? = nil,
      ts : TS? = nil,
      msm : MSM? = nil,
      etf : ETF? = nil,
      etps : ETPS? = nil,
      ece : ECE? = nil,
      etp : ETP? = nil,
      sms_3 : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        sms: sms,
        occs: occs,
        ts: ts,
        msm: msm,
        etf: etf,
        etps: etps,
        ece: ece,
        etp: etp,
        sms_3: sms_3,
      )
    end
  end # struct

  # DMA/Interrupt enable register
  struct DIER
    ADDRESS = BASE_ADDRESS + 0xc_u64

    protected def self.address : UInt64
      ADDRESS
    end

    @value : UInt32

    def initialize(@value : UInt32)
    end

    def to_int : UInt32
      @value
    end

    def self.reset_value : self
      new(0x0_u64)
    end

    def self.pointer : Pointer(UInt32)
      Pointer(UInt32).new(self.address)
    end

    def self.value : self
      value = self.pointer.load(volatile: true)
      new(value)
    end

    def self.value=(value : self) : self
      self.pointer.store(value.to_int, volatile: true)
      value
    end

    enum TDE : UInt8
      # Trigger DMA request disabled
      DISABLED = 0x0_u64

      # Trigger DMA request enabled
      ENABLED = 0x1_u64

      def self.reset_value : TDE
        DIER.reset_value.tde
      end
    end

    # Trigger DMA request enable
    def tde : TDE
      TDE.new!((@value >> 14) & 0x1_u32)
    end

    # Trigger DMA request enable
    def self.tde : TDE
      value.tde
    end

    # Trigger DMA request enable
    def self.tde=(value : TDE) : TDE
      self.set(tde: value)
      value
    end

    # Capture/Compare 4 DMA request              enable
    def cc4_de : Bool
      @value.bits_set?(0x1000_u32)
    end

    # Capture/Compare 4 DMA request              enable
    def self.cc4_de : Bool
      value.cc4_de
    end

    # Capture/Compare 4 DMA request              enable
    def self.cc4_de=(value : Bool) : Bool
      self.set(cc4_de: value)
      value
    end

    # Capture/Compare 3 DMA request              enable
    def cc3_de : Bool
      @value.bits_set?(0x800_u32)
    end

    # Capture/Compare 3 DMA request              enable
    def self.cc3_de : Bool
      value.cc3_de
    end

    # Capture/Compare 3 DMA request              enable
    def self.cc3_de=(value : Bool) : Bool
      self.set(cc3_de: value)
      value
    end

    # Capture/Compare 2 DMA request              enable
    def cc2_de : Bool
      @value.bits_set?(0x400_u32)
    end

    # Capture/Compare 2 DMA request              enable
    def self.cc2_de : Bool
      value.cc2_de
    end

    # Capture/Compare 2 DMA request              enable
    def self.cc2_de=(value : Bool) : Bool
      self.set(cc2_de: value)
      value
    end

    enum CC1DE : UInt8
      # CCx DMA request disabled
      DISABLED = 0x0_u64

      # CCx DMA request enabled
      ENABLED = 0x1_u64

      def self.reset_value : CC1DE
        DIER.reset_value.cc1_de
      end
    end

    # Capture/Compare 1 DMA request              enable
    def cc1_de : CC1DE
      CC1DE.new!((@value >> 9) & 0x1_u32)
    end

    # Capture/Compare 1 DMA request              enable
    def self.cc1_de : CC1DE
      value.cc1_de
    end

    # Capture/Compare 1 DMA request              enable
    def self.cc1_de=(value : CC1DE) : CC1DE
      self.set(cc1_de: value)
      value
    end

    enum UDE : UInt8
      # Update DMA request disabled
      DISABLED = 0x0_u64

      # Update DMA request enabled
      ENABLED = 0x1_u64

      def self.reset_value : UDE
        DIER.reset_value.ude
      end
    end

    # Update DMA request enable
    def ude : UDE
      UDE.new!((@value >> 8) & 0x1_u32)
    end

    # Update DMA request enable
    def self.ude : UDE
      value.ude
    end

    # Update DMA request enable
    def self.ude=(value : UDE) : UDE
      self.set(ude: value)
      value
    end

    enum TIE : UInt8
      # Trigger interrupt disabled
      DISABLED = 0x0_u64

      # Trigger interrupt enabled
      ENABLED = 0x1_u64

      def self.reset_value : TIE
        DIER.reset_value.tie
      end
    end

    # Trigger interrupt enable
    def tie : TIE
      TIE.new!((@value >> 6) & 0x1_u32)
    end

    # Trigger interrupt enable
    def self.tie : TIE
      value.tie
    end

    # Trigger interrupt enable
    def self.tie=(value : TIE) : TIE
      self.set(tie: value)
      value
    end

    # Capture/Compare 4 interrupt              enable
    def cc4_ie : Bool
      @value.bits_set?(0x10_u32)
    end

    # Capture/Compare 4 interrupt              enable
    def self.cc4_ie : Bool
      value.cc4_ie
    end

    # Capture/Compare 4 interrupt              enable
    def self.cc4_ie=(value : Bool) : Bool
      self.set(cc4_ie: value)
      value
    end

    # Capture/Compare 3 interrupt              enable
    def cc3_ie : Bool
      @value.bits_set?(0x8_u32)
    end

    # Capture/Compare 3 interrupt              enable
    def self.cc3_ie : Bool
      value.cc3_ie
    end

    # Capture/Compare 3 interrupt              enable
    def self.cc3_ie=(value : Bool) : Bool
      self.set(cc3_ie: value)
      value
    end

    # Capture/Compare 2 interrupt              enable
    def cc2_ie : Bool
      @value.bits_set?(0x4_u32)
    end

    # Capture/Compare 2 interrupt              enable
    def self.cc2_ie : Bool
      value.cc2_ie
    end

    # Capture/Compare 2 interrupt              enable
    def self.cc2_ie=(value : Bool) : Bool
      self.set(cc2_ie: value)
      value
    end

    enum CC1IE : UInt8
      # CCx interrupt disabled
      DISABLED = 0x0_u64

      # CCx interrupt enabled
      ENABLED = 0x1_u64

      def self.reset_value : CC1IE
        DIER.reset_value.cc1_ie
      end
    end

    # Capture/Compare 1 interrupt              enable
    def cc1_ie : CC1IE
      CC1IE.new!((@value >> 1) & 0x1_u32)
    end

    # Capture/Compare 1 interrupt              enable
    def self.cc1_ie : CC1IE
      value.cc1_ie
    end

    # Capture/Compare 1 interrupt              enable
    def self.cc1_ie=(value : CC1IE) : CC1IE
      self.set(cc1_ie: value)
      value
    end

    enum UIE : UInt8
      # Update interrupt disabled
      DISABLED = 0x0_u64

      # Update interrupt enabled
      ENABLED = 0x1_u64

      def self.reset_value : UIE
        DIER.reset_value.uie
      end
    end

    # Update interrupt enable
    def uie : UIE
      UIE.new!((@value >> 0) & 0x1_u32)
    end

    # Update interrupt enable
    def self.uie : UIE
      value.uie
    end

    # Update interrupt enable
    def self.uie=(value : UIE) : UIE
      self.set(uie: value)
      value
    end

    def copy_with(
      *,

      tde : TDE? = nil,

      cc4_de : Bool? = nil,

      cc3_de : Bool? = nil,

      cc2_de : Bool? = nil,

      cc1_de : CC1DE? = nil,

      ude : UDE? = nil,

      tie : TIE? = nil,

      cc4_ie : Bool? = nil,

      cc3_ie : Bool? = nil,

      cc2_ie : Bool? = nil,

      cc1_ie : CC1IE? = nil,

      uie : UIE? = nil
    ) : self
      value = @value

      unless tde.nil?
        value = (value & 0xffffbfff_u32) |
                UInt32.new!(tde.to_int).&(0x1_u32) << 14
      end

      unless cc4_de.nil?
        value = (value & 0xffffefff_u32) |
                UInt32.new!(cc4_de.to_int).&(0x1_u32) << 12
      end

      unless cc3_de.nil?
        value = (value & 0xfffff7ff_u32) |
                UInt32.new!(cc3_de.to_int).&(0x1_u32) << 11
      end

      unless cc2_de.nil?
        value = (value & 0xfffffbff_u32) |
                UInt32.new!(cc2_de.to_int).&(0x1_u32) << 10
      end

      unless cc1_de.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(cc1_de.to_int).&(0x1_u32) << 9
      end

      unless ude.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(ude.to_int).&(0x1_u32) << 8
      end

      unless tie.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(tie.to_int).&(0x1_u32) << 6
      end

      unless cc4_ie.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(cc4_ie.to_int).&(0x1_u32) << 4
      end

      unless cc3_ie.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(cc3_ie.to_int).&(0x1_u32) << 3
      end

      unless cc2_ie.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(cc2_ie.to_int).&(0x1_u32) << 2
      end

      unless cc1_ie.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(cc1_ie.to_int).&(0x1_u32) << 1
      end

      unless uie.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(uie.to_int).&(0x1_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      tde : TDE? = nil,
      cc4_de : Bool? = nil,
      cc3_de : Bool? = nil,
      cc2_de : Bool? = nil,
      cc1_de : CC1DE? = nil,
      ude : UDE? = nil,
      tie : TIE? = nil,
      cc4_ie : Bool? = nil,
      cc3_ie : Bool? = nil,
      cc2_ie : Bool? = nil,
      cc1_ie : CC1IE? = nil,
      uie : UIE? = nil
    ) : Nil
      self.value = self.value.copy_with(
        tde: tde,
        cc4_de: cc4_de,
        cc3_de: cc3_de,
        cc2_de: cc2_de,
        cc1_de: cc1_de,
        ude: ude,
        tie: tie,
        cc4_ie: cc4_ie,
        cc3_ie: cc3_ie,
        cc2_ie: cc2_ie,
        cc1_ie: cc1_ie,
        uie: uie,
      )
    end
  end # struct

  # status register
  struct SR
    ADDRESS = BASE_ADDRESS + 0x10_u64

    protected def self.address : UInt64
      ADDRESS
    end

    @value : UInt32

    def initialize(@value : UInt32)
    end

    def to_int : UInt32
      @value
    end

    def self.reset_value : self
      new(0x0_u64)
    end

    def self.pointer : Pointer(UInt32)
      Pointer(UInt32).new(self.address)
    end

    def self.value : self
      value = self.pointer.load(volatile: true)
      new(value)
    end

    def self.value=(value : self) : self
      self.pointer.store(value.to_int, volatile: true)
      value
    end

    # Capture/Compare 4 overcapture              flag
    def cc4_of : Bool
      @value.bits_set?(0x1000_u32)
    end

    # Capture/Compare 4 overcapture              flag
    def self.cc4_of : Bool
      value.cc4_of
    end

    # Capture/Compare 4 overcapture              flag
    def self.cc4_of=(value : Bool) : Bool
      self.set(cc4_of: value)
      value
    end

    # Capture/Compare 3 overcapture              flag
    def cc3_of : Bool
      @value.bits_set?(0x800_u32)
    end

    # Capture/Compare 3 overcapture              flag
    def self.cc3_of : Bool
      value.cc3_of
    end

    # Capture/Compare 3 overcapture              flag
    def self.cc3_of=(value : Bool) : Bool
      self.set(cc3_of: value)
      value
    end

    # Capture/compare 2 overcapture              flag
    def cc2_of : Bool
      @value.bits_set?(0x400_u32)
    end

    # Capture/compare 2 overcapture              flag
    def self.cc2_of : Bool
      value.cc2_of
    end

    # Capture/compare 2 overcapture              flag
    def self.cc2_of=(value : Bool) : Bool
      self.set(cc2_of: value)
      value
    end

    enum CC1OF : UInt8
      # The counter value has been captured in TIMx_CCRx register while CCxIF flag was already set
      OVERCAPTURE = 0x1_u64

      def self.reset_value : CC1OF
        SR.reset_value.cc1_of
      end
    end

    # Capture/Compare 1 overcapture              flag
    def cc1_of : CC1OF
      CC1OF.new!((@value >> 9) & 0x1_u32)
    end

    # Capture/Compare 1 overcapture              flag
    def self.cc1_of : CC1OF
      value.cc1_of
    end

    # Capture/Compare 1 overcapture              flag
    def self.cc1_of=(value : CC1OF) : CC1OF
      self.set(cc1_of: value)
      value
    end

    enum TIF : UInt8
      # No trigger event occurred
      NOTRIGGER = 0x0_u64

      # Trigger interrupt pending
      TRIGGER = 0x1_u64

      def self.reset_value : TIF
        SR.reset_value.tif
      end
    end

    # Trigger interrupt flag
    def tif : TIF
      TIF.new!((@value >> 6) & 0x1_u32)
    end

    # Trigger interrupt flag
    def self.tif : TIF
      value.tif
    end

    # Trigger interrupt flag
    def self.tif=(value : TIF) : TIF
      self.set(tif: value)
      value
    end

    # Capture/Compare 4 interrupt              flag
    def cc4_if : Bool
      @value.bits_set?(0x10_u32)
    end

    # Capture/Compare 4 interrupt              flag
    def self.cc4_if : Bool
      value.cc4_if
    end

    # Capture/Compare 4 interrupt              flag
    def self.cc4_if=(value : Bool) : Bool
      self.set(cc4_if: value)
      value
    end

    # Capture/Compare 3 interrupt              flag
    def cc3_if : Bool
      @value.bits_set?(0x8_u32)
    end

    # Capture/Compare 3 interrupt              flag
    def self.cc3_if : Bool
      value.cc3_if
    end

    # Capture/Compare 3 interrupt              flag
    def self.cc3_if=(value : Bool) : Bool
      self.set(cc3_if: value)
      value
    end

    # Capture/Compare 2 interrupt              flag
    def cc2_if : Bool
      @value.bits_set?(0x4_u32)
    end

    # Capture/Compare 2 interrupt              flag
    def self.cc2_if : Bool
      value.cc2_if
    end

    # Capture/Compare 2 interrupt              flag
    def self.cc2_if=(value : Bool) : Bool
      self.set(cc2_if: value)
      value
    end

    enum CC1IF : UInt8
      # If CC1 is an output: The content of the counter TIMx_CNT matches the content of the TIMx_CCR1 register. If CC1 is an input: The counter value has been captured in TIMx_CCR1 register.
      MATCH = 0x1_u64

      def self.reset_value : CC1IF
        SR.reset_value.cc1_if
      end
    end

    # Capture/compare 1 interrupt              flag
    def cc1_if : CC1IF
      CC1IF.new!((@value >> 1) & 0x1_u32)
    end

    # Capture/compare 1 interrupt              flag
    def self.cc1_if : CC1IF
      value.cc1_if
    end

    # Capture/compare 1 interrupt              flag
    def self.cc1_if=(value : CC1IF) : CC1IF
      self.set(cc1_if: value)
      value
    end

    enum UIF : UInt8
      # No update occurred
      CLEAR = 0x0_u64

      # Update interrupt pending.
      UPDATEPENDING = 0x1_u64

      def self.reset_value : UIF
        SR.reset_value.uif
      end
    end

    # Update interrupt flag
    def uif : UIF
      UIF.new!((@value >> 0) & 0x1_u32)
    end

    # Update interrupt flag
    def self.uif : UIF
      value.uif
    end

    # Update interrupt flag
    def self.uif=(value : UIF) : UIF
      self.set(uif: value)
      value
    end

    def copy_with(
      *,

      cc4_of : Bool? = nil,

      cc3_of : Bool? = nil,

      cc2_of : Bool? = nil,

      cc1_of : CC1OF? = nil,

      tif : TIF? = nil,

      cc4_if : Bool? = nil,

      cc3_if : Bool? = nil,

      cc2_if : Bool? = nil,

      cc1_if : CC1IF? = nil,

      uif : UIF? = nil
    ) : self
      value = @value

      unless cc4_of.nil?
        value = (value & 0xffffefff_u32) |
                UInt32.new!(cc4_of.to_int).&(0x1_u32) << 12
      end

      unless cc3_of.nil?
        value = (value & 0xfffff7ff_u32) |
                UInt32.new!(cc3_of.to_int).&(0x1_u32) << 11
      end

      unless cc2_of.nil?
        value = (value & 0xfffffbff_u32) |
                UInt32.new!(cc2_of.to_int).&(0x1_u32) << 10
      end

      unless cc1_of.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(cc1_of.to_int).&(0x1_u32) << 9
      end

      unless tif.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(tif.to_int).&(0x1_u32) << 6
      end

      unless cc4_if.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(cc4_if.to_int).&(0x1_u32) << 4
      end

      unless cc3_if.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(cc3_if.to_int).&(0x1_u32) << 3
      end

      unless cc2_if.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(cc2_if.to_int).&(0x1_u32) << 2
      end

      unless cc1_if.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(cc1_if.to_int).&(0x1_u32) << 1
      end

      unless uif.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(uif.to_int).&(0x1_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      cc4_of : Bool? = nil,
      cc3_of : Bool? = nil,
      cc2_of : Bool? = nil,
      cc1_of : CC1OF? = nil,
      tif : TIF? = nil,
      cc4_if : Bool? = nil,
      cc3_if : Bool? = nil,
      cc2_if : Bool? = nil,
      cc1_if : CC1IF? = nil,
      uif : UIF? = nil
    ) : Nil
      self.value = self.value.copy_with(
        cc4_of: cc4_of,
        cc3_of: cc3_of,
        cc2_of: cc2_of,
        cc1_of: cc1_of,
        tif: tif,
        cc4_if: cc4_if,
        cc3_if: cc3_if,
        cc2_if: cc2_if,
        cc1_if: cc1_if,
        uif: uif,
      )
    end
  end # struct

  # event generation register
  struct EGR
    ADDRESS = BASE_ADDRESS + 0x14_u64

    protected def self.address : UInt64
      ADDRESS
    end

    @value : UInt32

    def initialize(@value : UInt32)
    end

    def to_int : UInt32
      @value
    end

    def self.reset_value : self
      new(0x0_u64)
    end

    def self.pointer : Pointer(UInt32)
      Pointer(UInt32).new(self.address)
    end

    def self.value : self
      value = self.pointer.load(volatile: true)
      new(value)
    end

    def self.value=(value : self) : self
      self.pointer.store(value.to_int, volatile: true)
      value
    end

    enum TG : UInt8
      # The TIF flag is set in TIMx_SR register. Related interrupt or DMA transfer can occur if enabled.
      TRIGGER = 0x1_u64

      def self.reset_value : TG
        EGR.reset_value.tg
      end
    end

    # Trigger generation
    def self.tg=(value : TG) : TG
      self.set(tg: value)
      value
    end

    # Capture/compare 4              generation
    def self.cc4_g=(value : Bool) : Bool
      self.set(cc4_g: value)
      value
    end

    # Capture/compare 3              generation
    def self.cc3_g=(value : Bool) : Bool
      self.set(cc3_g: value)
      value
    end

    # Capture/compare 2              generation
    def self.cc2_g=(value : Bool) : Bool
      self.set(cc2_g: value)
      value
    end

    enum CC1G : UInt8
      # If CC1 is an output: CC1IF flag is set, Corresponding interrupt or DMA request is sent if enabled. If CC1 is an input: The current value of the counter is captured in TIMx_CCR1 register.
      TRIGGER = 0x1_u64

      def self.reset_value : CC1G
        EGR.reset_value.cc1_g
      end
    end

    # Capture/compare 1              generation
    def self.cc1_g=(value : CC1G) : CC1G
      self.set(cc1_g: value)
      value
    end

    enum UG : UInt8
      # Re-initializes the timer counter and generates an update of the registers.
      UPDATE = 0x1_u64

      def self.reset_value : UG
        EGR.reset_value.ug
      end
    end

    # Update generation
    def self.ug=(value : UG) : UG
      self.set(ug: value)
      value
    end

    def copy_with(
      *,

      tg : TG? = nil,

      cc4_g : Bool? = nil,

      cc3_g : Bool? = nil,

      cc2_g : Bool? = nil,

      cc1_g : CC1G? = nil,

      ug : UG? = nil
    ) : self
      value = @value

      unless tg.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(tg.to_int).&(0x1_u32) << 6
      end

      unless cc4_g.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(cc4_g.to_int).&(0x1_u32) << 4
      end

      unless cc3_g.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(cc3_g.to_int).&(0x1_u32) << 3
      end

      unless cc2_g.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(cc2_g.to_int).&(0x1_u32) << 2
      end

      unless cc1_g.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(cc1_g.to_int).&(0x1_u32) << 1
      end

      unless ug.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(ug.to_int).&(0x1_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      tg : TG? = nil,
      cc4_g : Bool? = nil,
      cc3_g : Bool? = nil,
      cc2_g : Bool? = nil,
      cc1_g : CC1G? = nil,
      ug : UG? = nil
    ) : Nil
      self.value = self.value.copy_with(
        tg: tg,
        cc4_g: cc4_g,
        cc3_g: cc3_g,
        cc2_g: cc2_g,
        cc1_g: cc1_g,
        ug: ug,
      )
    end
  end # struct

  # capture/compare mode register 1 (output          mode)
  struct CCMR1_Output
    ADDRESS = BASE_ADDRESS + 0x18_u64

    protected def self.address : UInt64
      ADDRESS
    end

    @value : UInt32

    def initialize(@value : UInt32)
    end

    def to_int : UInt32
      @value
    end

    def self.reset_value : self
      new(0x0_u64)
    end

    def self.pointer : Pointer(UInt32)
      Pointer(UInt32).new(self.address)
    end

    def self.value : self
      value = self.pointer.load(volatile: true)
      new(value)
    end

    def self.value=(value : self) : self
      self.pointer.store(value.to_int, volatile: true)
      value
    end

    enum CC1S : UInt8
      # CC1 channel is configured as output
      OUTPUT = 0x0_u64

      def self.reset_value : CC1S
        CCMR1_Output.reset_value.cc1_s
      end
    end

    # Capture/Compare 1              selection
    def cc1_s : CC1S
      CC1S.new!((@value >> 0) & 0x3_u32)
    end

    # Capture/Compare 1              selection
    def self.cc1_s : CC1S
      value.cc1_s
    end

    # Capture/Compare 1              selection
    def self.cc1_s=(value : CC1S) : CC1S
      self.set(cc1_s: value)
      value
    end

    # Output compare 1 fast              enable
    def oc1_fe : Bool
      @value.bits_set?(0x4_u32)
    end

    # Output compare 1 fast              enable
    def self.oc1_fe : Bool
      value.oc1_fe
    end

    # Output compare 1 fast              enable
    def self.oc1_fe=(value : Bool) : Bool
      self.set(oc1_fe: value)
      value
    end

    enum OC1PE : UInt8
      # Preload register on CCR1 disabled. New values written to CCR1 are taken into account immediately
      DISABLED = 0x0_u64

      # Preload register on CCR1 enabled. Preload value is loaded into active register on each update event
      ENABLED = 0x1_u64

      def self.reset_value : OC1PE
        CCMR1_Output.reset_value.oc1_pe
      end
    end

    # Output compare 1 preload              enable
    def oc1_pe : OC1PE
      OC1PE.new!((@value >> 3) & 0x1_u32)
    end

    # Output compare 1 preload              enable
    def self.oc1_pe : OC1PE
      value.oc1_pe
    end

    # Output compare 1 preload              enable
    def self.oc1_pe=(value : OC1PE) : OC1PE
      self.set(oc1_pe: value)
      value
    end

    enum OC1M : UInt8
      # The comparison between the output compare register TIMx_CCRy and the counter TIMx_CNT has no effect on the outputs / OpmMode1: Retriggerable OPM mode 1 - In up-counting mode, the channel is active until a trigger event is detected (on TRGI signal). In down-counting mode, the channel is inactive
      FROZEN = 0x0_u64

      # Set channel to active level on match. OCyREF signal is forced high when the counter matches the capture/compare register / OpmMode2: Inversely to OpmMode1
      ACTIVEONMATCH = 0x1_u64

      # Set channel to inactive level on match. OCyREF signal is forced low when the counter matches the capture/compare register / Reserved
      INACTIVEONMATCH = 0x2_u64

      # OCyREF toggles when TIMx_CNT=TIMx_CCRy / Reserved
      TOGGLE = 0x3_u64

      # OCyREF is forced low / CombinedPwmMode1: OCyREF has the same behavior as in PWM mode 1. OCyREFC is the logical OR between OC1REF and OC2REF
      FORCEINACTIVE = 0x4_u64

      # OCyREF is forced high / CombinedPwmMode2: OCyREF has the same behavior as in PWM mode 2. OCyREFC is the logical AND between OC1REF and OC2REF
      FORCEACTIVE = 0x5_u64

      # In upcounting, channel is active as long as TIMx_CNT<TIMx_CCRy else inactive. In downcounting, channel is inactive as long as TIMx_CNT>TIMx_CCRy else active / AsymmetricPwmMode1: OCyREF has the same behavior as in PWM mode 1. OCyREFC outputs OC1REF when the counter is counting up, OC2REF when it is counting down
      PWMMODE1 = 0x6_u64

      # Inversely to PwmMode1 / AsymmetricPwmMode2: Inversely to AsymmetricPwmMode1
      PWMMODE2 = 0x7_u64

      def self.reset_value : OC1M
        CCMR1_Output.reset_value.oc1_m
      end
    end

    # Output compare 1 mode
    def oc1_m : OC1M
      OC1M.new!((@value >> 4) & 0x7_u32)
    end

    # Output compare 1 mode
    def self.oc1_m : OC1M
      value.oc1_m
    end

    # Output compare 1 mode
    def self.oc1_m=(value : OC1M) : OC1M
      self.set(oc1_m: value)
      value
    end

    # Output compare 1 clear              enable
    def oc1_ce : Bool
      @value.bits_set?(0x80_u32)
    end

    # Output compare 1 clear              enable
    def self.oc1_ce : Bool
      value.oc1_ce
    end

    # Output compare 1 clear              enable
    def self.oc1_ce=(value : Bool) : Bool
      self.set(oc1_ce: value)
      value
    end

    enum CC2S : UInt8
      # CC2 channel is configured as output
      OUTPUT = 0x0_u64

      def self.reset_value : CC2S
        CCMR1_Output.reset_value.cc2_s
      end
    end

    # Capture/Compare 2              selection
    def cc2_s : CC2S
      CC2S.new!((@value >> 8) & 0x3_u32)
    end

    # Capture/Compare 2              selection
    def self.cc2_s : CC2S
      value.cc2_s
    end

    # Capture/Compare 2              selection
    def self.cc2_s=(value : CC2S) : CC2S
      self.set(cc2_s: value)
      value
    end

    # Output compare 2 fast              enable
    def oc2_fe : Bool
      @value.bits_set?(0x400_u32)
    end

    # Output compare 2 fast              enable
    def self.oc2_fe : Bool
      value.oc2_fe
    end

    # Output compare 2 fast              enable
    def self.oc2_fe=(value : Bool) : Bool
      self.set(oc2_fe: value)
      value
    end

    enum OC2PE : UInt8
      # Preload register on CCR2 disabled. New values written to CCR2 are taken into account immediately
      DISABLED = 0x0_u64

      # Preload register on CCR2 enabled. Preload value is loaded into active register on each update event
      ENABLED = 0x1_u64

      def self.reset_value : OC2PE
        CCMR1_Output.reset_value.oc2_pe
      end
    end

    # Output compare 2 preload              enable
    def oc2_pe : OC2PE
      OC2PE.new!((@value >> 11) & 0x1_u32)
    end

    # Output compare 2 preload              enable
    def self.oc2_pe : OC2PE
      value.oc2_pe
    end

    # Output compare 2 preload              enable
    def self.oc2_pe=(value : OC2PE) : OC2PE
      self.set(oc2_pe: value)
      value
    end

    # Output compare 2 mode
    def oc2_m : UInt8
      UInt8.new!((@value >> 12) & 0x7_u32)
    end

    # Output compare 2 mode
    def self.oc2_m : UInt8
      value.oc2_m
    end

    # Output compare 2 mode
    def self.oc2_m=(value : UInt8) : UInt8
      self.set(oc2_m: value)
      value
    end

    # Output compare 2 clear              enable
    def oc2_ce : Bool
      @value.bits_set?(0x8000_u32)
    end

    # Output compare 2 clear              enable
    def self.oc2_ce : Bool
      value.oc2_ce
    end

    # Output compare 2 clear              enable
    def self.oc2_ce=(value : Bool) : Bool
      self.set(oc2_ce: value)
      value
    end

    enum OC1M_3 : UInt8
      # Normal output compare mode (modes 0-7)
      NORMAL = 0x0_u64

      # Extended output compare mode (modes 7-15)
      EXTENDED = 0x1_u64

      def self.reset_value : OC1M_3
        CCMR1_Output.reset_value.oc1_m_3
      end
    end

    # Output compare 1 mode bit              3
    def oc1_m_3 : OC1M_3
      OC1M_3.new!((@value >> 16) & 0x1_u32)
    end

    # Output compare 1 mode bit              3
    def self.oc1_m_3 : OC1M_3
      value.oc1_m_3
    end

    # Output compare 1 mode bit              3
    def self.oc1_m_3=(value : OC1M_3) : OC1M_3
      self.set(oc1_m_3: value)
      value
    end

    # Output compare 2 mode bit              3
    def oc2_m_3 : Bool
      @value.bits_set?(0x1000000_u32)
    end

    # Output compare 2 mode bit              3
    def self.oc2_m_3 : Bool
      value.oc2_m_3
    end

    # Output compare 2 mode bit              3
    def self.oc2_m_3=(value : Bool) : Bool
      self.set(oc2_m_3: value)
      value
    end

    def copy_with(
      *,

      cc1_s : CC1S? = nil,

      oc1_fe : Bool? = nil,

      oc1_pe : OC1PE? = nil,

      oc1_m : OC1M? = nil,

      oc1_ce : Bool? = nil,

      cc2_s : CC2S? = nil,

      oc2_fe : Bool? = nil,

      oc2_pe : OC2PE? = nil,

      oc2_m : UInt8? = nil,

      oc2_ce : Bool? = nil,

      oc1_m_3 : OC1M_3? = nil,

      oc2_m_3 : Bool? = nil
    ) : self
      value = @value

      unless cc1_s.nil?
        value = (value & 0xfffffffc_u32) |
                UInt32.new!(cc1_s.to_int).&(0x3_u32) << 0
      end

      unless oc1_fe.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(oc1_fe.to_int).&(0x1_u32) << 2
      end

      unless oc1_pe.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(oc1_pe.to_int).&(0x1_u32) << 3
      end

      unless oc1_m.nil?
        value = (value & 0xffffff8f_u32) |
                UInt32.new!(oc1_m.to_int).&(0x7_u32) << 4
      end

      unless oc1_ce.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(oc1_ce.to_int).&(0x1_u32) << 7
      end

      unless cc2_s.nil?
        value = (value & 0xfffffcff_u32) |
                UInt32.new!(cc2_s.to_int).&(0x3_u32) << 8
      end

      unless oc2_fe.nil?
        value = (value & 0xfffffbff_u32) |
                UInt32.new!(oc2_fe.to_int).&(0x1_u32) << 10
      end

      unless oc2_pe.nil?
        value = (value & 0xfffff7ff_u32) |
                UInt32.new!(oc2_pe.to_int).&(0x1_u32) << 11
      end

      unless oc2_m.nil?
        value = (value & 0xffff8fff_u32) |
                UInt32.new!(oc2_m.to_int).&(0x7_u32) << 12
      end

      unless oc2_ce.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(oc2_ce.to_int).&(0x1_u32) << 15
      end

      unless oc1_m_3.nil?
        value = (value & 0xfffeffff_u32) |
                UInt32.new!(oc1_m_3.to_int).&(0x1_u32) << 16
      end

      unless oc2_m_3.nil?
        value = (value & 0xfeffffff_u32) |
                UInt32.new!(oc2_m_3.to_int).&(0x1_u32) << 24
      end

      self.class.new(value)
    end

    def self.set(
      *,
      cc1_s : CC1S? = nil,
      oc1_fe : Bool? = nil,
      oc1_pe : OC1PE? = nil,
      oc1_m : OC1M? = nil,
      oc1_ce : Bool? = nil,
      cc2_s : CC2S? = nil,
      oc2_fe : Bool? = nil,
      oc2_pe : OC2PE? = nil,
      oc2_m : UInt8? = nil,
      oc2_ce : Bool? = nil,
      oc1_m_3 : OC1M_3? = nil,
      oc2_m_3 : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        cc1_s: cc1_s,
        oc1_fe: oc1_fe,
        oc1_pe: oc1_pe,
        oc1_m: oc1_m,
        oc1_ce: oc1_ce,
        cc2_s: cc2_s,
        oc2_fe: oc2_fe,
        oc2_pe: oc2_pe,
        oc2_m: oc2_m,
        oc2_ce: oc2_ce,
        oc1_m_3: oc1_m_3,
        oc2_m_3: oc2_m_3,
      )
    end
  end # struct

  # capture/compare mode register 1 (input          mode)
  struct CCMR1_Input
    ADDRESS = BASE_ADDRESS + 0x18_u64

    protected def self.address : UInt64
      ADDRESS
    end

    @value : UInt32

    def initialize(@value : UInt32)
    end

    def to_int : UInt32
      @value
    end

    def self.reset_value : self
      new(0x0_u64)
    end

    def self.pointer : Pointer(UInt32)
      Pointer(UInt32).new(self.address)
    end

    def self.value : self
      value = self.pointer.load(volatile: true)
      new(value)
    end

    def self.value=(value : self) : self
      self.pointer.store(value.to_int, volatile: true)
      value
    end

    # Input capture 2 filter
    def ic2_f : UInt8
      UInt8.new!((@value >> 12) & 0xf_u32)
    end

    # Input capture 2 filter
    def self.ic2_f : UInt8
      value.ic2_f
    end

    # Input capture 2 filter
    def self.ic2_f=(value : UInt8) : UInt8
      self.set(ic2_f: value)
      value
    end

    # Input capture 2 prescaler
    def ic2_psc : UInt8
      UInt8.new!((@value >> 10) & 0x3_u32)
    end

    # Input capture 2 prescaler
    def self.ic2_psc : UInt8
      value.ic2_psc
    end

    # Input capture 2 prescaler
    def self.ic2_psc=(value : UInt8) : UInt8
      self.set(ic2_psc: value)
      value
    end

    enum CC2S : UInt8
      # CC2 channel is configured as input, IC2 is mapped on TI2
      TI2 = 0x1_u64

      # CC2 channel is configured as input, IC2 is mapped on TI1
      TI1 = 0x2_u64

      # CC2 channel is configured as input, IC2 is mapped on TRC
      TRC = 0x3_u64

      def self.reset_value : CC2S
        CCMR1_Input.reset_value.cc2_s
      end
    end

    # Capture/compare 2              selection
    def cc2_s : CC2S
      CC2S.new!((@value >> 8) & 0x3_u32)
    end

    # Capture/compare 2              selection
    def self.cc2_s : CC2S
      value.cc2_s
    end

    # Capture/compare 2              selection
    def self.cc2_s=(value : CC2S) : CC2S
      self.set(cc2_s: value)
      value
    end

    enum IC1F : UInt8
      # No filter, sampling is done at fDTS
      NOFILTER = 0x0_u64

      # fSAMPLING=fCK_INT, N=2
      FCK_INT_N2 = 0x1_u64

      # fSAMPLING=fCK_INT, N=4
      FCK_INT_N4 = 0x2_u64

      # fSAMPLING=fCK_INT, N=8
      FCK_INT_N8 = 0x3_u64

      # fSAMPLING=fDTS/2, N=6
      FDTS_DIV2_N6 = 0x4_u64

      # fSAMPLING=fDTS/2, N=8
      FDTS_DIV2_N8 = 0x5_u64

      # fSAMPLING=fDTS/4, N=6
      FDTS_DIV4_N6 = 0x6_u64

      # fSAMPLING=fDTS/4, N=8
      FDTS_DIV4_N8 = 0x7_u64

      # fSAMPLING=fDTS/8, N=6
      FDTS_DIV8_N6 = 0x8_u64

      # fSAMPLING=fDTS/8, N=8
      FDTS_DIV8_N8 = 0x9_u64

      # fSAMPLING=fDTS/16, N=5
      FDTS_DIV16_N5 = 0xa_u64

      # fSAMPLING=fDTS/16, N=6
      FDTS_DIV16_N6 = 0xb_u64

      # fSAMPLING=fDTS/16, N=8
      FDTS_DIV16_N8 = 0xc_u64

      # fSAMPLING=fDTS/32, N=5
      FDTS_DIV32_N5 = 0xd_u64

      # fSAMPLING=fDTS/32, N=6
      FDTS_DIV32_N6 = 0xe_u64

      # fSAMPLING=fDTS/32, N=8
      FDTS_DIV32_N8 = 0xf_u64

      def self.reset_value : IC1F
        CCMR1_Input.reset_value.ic1_f
      end
    end

    # Input capture 1 filter
    def ic1_f : IC1F
      IC1F.new!((@value >> 4) & 0xf_u32)
    end

    # Input capture 1 filter
    def self.ic1_f : IC1F
      value.ic1_f
    end

    # Input capture 1 filter
    def self.ic1_f=(value : IC1F) : IC1F
      self.set(ic1_f: value)
      value
    end

    # Input capture 1 prescaler
    def ic1_psc : UInt8
      UInt8.new!((@value >> 2) & 0x3_u32)
    end

    # Input capture 1 prescaler
    def self.ic1_psc : UInt8
      value.ic1_psc
    end

    # Input capture 1 prescaler
    def self.ic1_psc=(value : UInt8) : UInt8
      self.set(ic1_psc: value)
      value
    end

    enum CC1S : UInt8
      # CC1 channel is configured as input, IC1 is mapped on TI1
      TI1 = 0x1_u64

      # CC1 channel is configured as input, IC1 is mapped on TI2
      TI2 = 0x2_u64

      # CC1 channel is configured as input, IC1 is mapped on TRC
      TRC = 0x3_u64

      def self.reset_value : CC1S
        CCMR1_Input.reset_value.cc1_s
      end
    end

    # Capture/Compare 1              selection
    def cc1_s : CC1S
      CC1S.new!((@value >> 0) & 0x3_u32)
    end

    # Capture/Compare 1              selection
    def self.cc1_s : CC1S
      value.cc1_s
    end

    # Capture/Compare 1              selection
    def self.cc1_s=(value : CC1S) : CC1S
      self.set(cc1_s: value)
      value
    end

    def copy_with(
      *,

      ic2_f : UInt8? = nil,

      ic2_psc : UInt8? = nil,

      cc2_s : CC2S? = nil,

      ic1_f : IC1F? = nil,

      ic1_psc : UInt8? = nil,

      cc1_s : CC1S? = nil
    ) : self
      value = @value

      unless ic2_f.nil?
        value = (value & 0xffff0fff_u32) |
                UInt32.new!(ic2_f.to_int).&(0xf_u32) << 12
      end

      unless ic2_psc.nil?
        value = (value & 0xfffff3ff_u32) |
                UInt32.new!(ic2_psc.to_int).&(0x3_u32) << 10
      end

      unless cc2_s.nil?
        value = (value & 0xfffffcff_u32) |
                UInt32.new!(cc2_s.to_int).&(0x3_u32) << 8
      end

      unless ic1_f.nil?
        value = (value & 0xffffff0f_u32) |
                UInt32.new!(ic1_f.to_int).&(0xf_u32) << 4
      end

      unless ic1_psc.nil?
        value = (value & 0xfffffff3_u32) |
                UInt32.new!(ic1_psc.to_int).&(0x3_u32) << 2
      end

      unless cc1_s.nil?
        value = (value & 0xfffffffc_u32) |
                UInt32.new!(cc1_s.to_int).&(0x3_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      ic2_f : UInt8? = nil,
      ic2_psc : UInt8? = nil,
      cc2_s : CC2S? = nil,
      ic1_f : IC1F? = nil,
      ic1_psc : UInt8? = nil,
      cc1_s : CC1S? = nil
    ) : Nil
      self.value = self.value.copy_with(
        ic2_f: ic2_f,
        ic2_psc: ic2_psc,
        cc2_s: cc2_s,
        ic1_f: ic1_f,
        ic1_psc: ic1_psc,
        cc1_s: cc1_s,
      )
    end
  end # struct

  # capture/compare mode register 2 (output          mode)
  struct CCMR2_Output
    ADDRESS = BASE_ADDRESS + 0x1c_u64

    protected def self.address : UInt64
      ADDRESS
    end

    @value : UInt32

    def initialize(@value : UInt32)
    end

    def to_int : UInt32
      @value
    end

    def self.reset_value : self
      new(0x0_u64)
    end

    def self.pointer : Pointer(UInt32)
      Pointer(UInt32).new(self.address)
    end

    def self.value : self
      value = self.pointer.load(volatile: true)
      new(value)
    end

    def self.value=(value : self) : self
      self.pointer.store(value.to_int, volatile: true)
      value
    end

    enum CC3S : UInt8
      # CC3 channel is configured as output
      OUTPUT = 0x0_u64

      def self.reset_value : CC3S
        CCMR2_Output.reset_value.cc3_s
      end
    end

    # Capture/Compare 3              selection
    def cc3_s : CC3S
      CC3S.new!((@value >> 0) & 0x3_u32)
    end

    # Capture/Compare 3              selection
    def self.cc3_s : CC3S
      value.cc3_s
    end

    # Capture/Compare 3              selection
    def self.cc3_s=(value : CC3S) : CC3S
      self.set(cc3_s: value)
      value
    end

    # Output compare 3 fast              enable
    def oc3_fe : Bool
      @value.bits_set?(0x4_u32)
    end

    # Output compare 3 fast              enable
    def self.oc3_fe : Bool
      value.oc3_fe
    end

    # Output compare 3 fast              enable
    def self.oc3_fe=(value : Bool) : Bool
      self.set(oc3_fe: value)
      value
    end

    enum OC3PE : UInt8
      # Preload register on CCR3 disabled. New values written to CCR3 are taken into account immediately
      DISABLED = 0x0_u64

      # Preload register on CCR3 enabled. Preload value is loaded into active register on each update event
      ENABLED = 0x1_u64

      def self.reset_value : OC3PE
        CCMR2_Output.reset_value.oc3_pe
      end
    end

    # Output compare 3 preload              enable
    def oc3_pe : OC3PE
      OC3PE.new!((@value >> 3) & 0x1_u32)
    end

    # Output compare 3 preload              enable
    def self.oc3_pe : OC3PE
      value.oc3_pe
    end

    # Output compare 3 preload              enable
    def self.oc3_pe=(value : OC3PE) : OC3PE
      self.set(oc3_pe: value)
      value
    end

    enum OC3M : UInt8
      # The comparison between the output compare register TIMx_CCRy and the counter TIMx_CNT has no effect on the outputs / OpmMode1: Retriggerable OPM mode 1 - In up-counting mode, the channel is active until a trigger event is detected (on TRGI signal). In down-counting mode, the channel is inactive
      FROZEN = 0x0_u64

      # Set channel to active level on match. OCyREF signal is forced high when the counter matches the capture/compare register / OpmMode2: Inversely to OpmMode1
      ACTIVEONMATCH = 0x1_u64

      # Set channel to inactive level on match. OCyREF signal is forced low when the counter matches the capture/compare register / Reserved
      INACTIVEONMATCH = 0x2_u64

      # OCyREF toggles when TIMx_CNT=TIMx_CCRy / Reserved
      TOGGLE = 0x3_u64

      # OCyREF is forced low / CombinedPwmMode1: OCyREF has the same behavior as in PWM mode 1. OCyREFC is the logical OR between OC1REF and OC2REF
      FORCEINACTIVE = 0x4_u64

      # OCyREF is forced high / CombinedPwmMode2: OCyREF has the same behavior as in PWM mode 2. OCyREFC is the logical AND between OC1REF and OC2REF
      FORCEACTIVE = 0x5_u64

      # In upcounting, channel is active as long as TIMx_CNT<TIMx_CCRy else inactive. In downcounting, channel is inactive as long as TIMx_CNT>TIMx_CCRy else active / AsymmetricPwmMode1: OCyREF has the same behavior as in PWM mode 1. OCyREFC outputs OC1REF when the counter is counting up, OC2REF when it is counting down
      PWMMODE1 = 0x6_u64

      # Inversely to PwmMode1 / AsymmetricPwmMode2: Inversely to AsymmetricPwmMode1
      PWMMODE2 = 0x7_u64

      def self.reset_value : OC3M
        CCMR2_Output.reset_value.oc3_m
      end
    end

    # Output compare 3 mode
    def oc3_m : OC3M
      OC3M.new!((@value >> 4) & 0x7_u32)
    end

    # Output compare 3 mode
    def self.oc3_m : OC3M
      value.oc3_m
    end

    # Output compare 3 mode
    def self.oc3_m=(value : OC3M) : OC3M
      self.set(oc3_m: value)
      value
    end

    # Output compare 3 clear              enable
    def oc3_ce : Bool
      @value.bits_set?(0x80_u32)
    end

    # Output compare 3 clear              enable
    def self.oc3_ce : Bool
      value.oc3_ce
    end

    # Output compare 3 clear              enable
    def self.oc3_ce=(value : Bool) : Bool
      self.set(oc3_ce: value)
      value
    end

    enum CC4S : UInt8
      # CC4 channel is configured as output
      OUTPUT = 0x0_u64

      def self.reset_value : CC4S
        CCMR2_Output.reset_value.cc4_s
      end
    end

    # Capture/Compare 4              selection
    def cc4_s : CC4S
      CC4S.new!((@value >> 8) & 0x3_u32)
    end

    # Capture/Compare 4              selection
    def self.cc4_s : CC4S
      value.cc4_s
    end

    # Capture/Compare 4              selection
    def self.cc4_s=(value : CC4S) : CC4S
      self.set(cc4_s: value)
      value
    end

    # Output compare 4 fast              enable
    def oc4_fe : Bool
      @value.bits_set?(0x400_u32)
    end

    # Output compare 4 fast              enable
    def self.oc4_fe : Bool
      value.oc4_fe
    end

    # Output compare 4 fast              enable
    def self.oc4_fe=(value : Bool) : Bool
      self.set(oc4_fe: value)
      value
    end

    enum OC4PE : UInt8
      # Preload register on CCR4 disabled. New values written to CCR4 are taken into account immediately
      DISABLED = 0x0_u64

      # Preload register on CCR4 enabled. Preload value is loaded into active register on each update event
      ENABLED = 0x1_u64

      def self.reset_value : OC4PE
        CCMR2_Output.reset_value.oc4_pe
      end
    end

    # Output compare 4 preload              enable
    def oc4_pe : OC4PE
      OC4PE.new!((@value >> 11) & 0x1_u32)
    end

    # Output compare 4 preload              enable
    def self.oc4_pe : OC4PE
      value.oc4_pe
    end

    # Output compare 4 preload              enable
    def self.oc4_pe=(value : OC4PE) : OC4PE
      self.set(oc4_pe: value)
      value
    end

    # Output compare 4 mode
    def oc4_m : UInt8
      UInt8.new!((@value >> 12) & 0x7_u32)
    end

    # Output compare 4 mode
    def self.oc4_m : UInt8
      value.oc4_m
    end

    # Output compare 4 mode
    def self.oc4_m=(value : UInt8) : UInt8
      self.set(oc4_m: value)
      value
    end

    # Output compare 4 clear              enable
    def oc4_ce : Bool
      @value.bits_set?(0x8000_u32)
    end

    # Output compare 4 clear              enable
    def self.oc4_ce : Bool
      value.oc4_ce
    end

    # Output compare 4 clear              enable
    def self.oc4_ce=(value : Bool) : Bool
      self.set(oc4_ce: value)
      value
    end

    enum OC3M_3 : UInt8
      # Normal output compare mode (modes 0-7)
      NORMAL = 0x0_u64

      # Extended output compare mode (modes 7-15)
      EXTENDED = 0x1_u64

      def self.reset_value : OC3M_3
        CCMR2_Output.reset_value.oc3_m_3
      end
    end

    # Output compare 3 mode bit3
    def oc3_m_3 : OC3M_3
      OC3M_3.new!((@value >> 16) & 0x1_u32)
    end

    # Output compare 3 mode bit3
    def self.oc3_m_3 : OC3M_3
      value.oc3_m_3
    end

    # Output compare 3 mode bit3
    def self.oc3_m_3=(value : OC3M_3) : OC3M_3
      self.set(oc3_m_3: value)
      value
    end

    # Output compare 4 mode bit3
    def oc4_m_3 : Bool
      @value.bits_set?(0x1000000_u32)
    end

    # Output compare 4 mode bit3
    def self.oc4_m_3 : Bool
      value.oc4_m_3
    end

    # Output compare 4 mode bit3
    def self.oc4_m_3=(value : Bool) : Bool
      self.set(oc4_m_3: value)
      value
    end

    def copy_with(
      *,

      cc3_s : CC3S? = nil,

      oc3_fe : Bool? = nil,

      oc3_pe : OC3PE? = nil,

      oc3_m : OC3M? = nil,

      oc3_ce : Bool? = nil,

      cc4_s : CC4S? = nil,

      oc4_fe : Bool? = nil,

      oc4_pe : OC4PE? = nil,

      oc4_m : UInt8? = nil,

      oc4_ce : Bool? = nil,

      oc3_m_3 : OC3M_3? = nil,

      oc4_m_3 : Bool? = nil
    ) : self
      value = @value

      unless cc3_s.nil?
        value = (value & 0xfffffffc_u32) |
                UInt32.new!(cc3_s.to_int).&(0x3_u32) << 0
      end

      unless oc3_fe.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(oc3_fe.to_int).&(0x1_u32) << 2
      end

      unless oc3_pe.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(oc3_pe.to_int).&(0x1_u32) << 3
      end

      unless oc3_m.nil?
        value = (value & 0xffffff8f_u32) |
                UInt32.new!(oc3_m.to_int).&(0x7_u32) << 4
      end

      unless oc3_ce.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(oc3_ce.to_int).&(0x1_u32) << 7
      end

      unless cc4_s.nil?
        value = (value & 0xfffffcff_u32) |
                UInt32.new!(cc4_s.to_int).&(0x3_u32) << 8
      end

      unless oc4_fe.nil?
        value = (value & 0xfffffbff_u32) |
                UInt32.new!(oc4_fe.to_int).&(0x1_u32) << 10
      end

      unless oc4_pe.nil?
        value = (value & 0xfffff7ff_u32) |
                UInt32.new!(oc4_pe.to_int).&(0x1_u32) << 11
      end

      unless oc4_m.nil?
        value = (value & 0xffff8fff_u32) |
                UInt32.new!(oc4_m.to_int).&(0x7_u32) << 12
      end

      unless oc4_ce.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(oc4_ce.to_int).&(0x1_u32) << 15
      end

      unless oc3_m_3.nil?
        value = (value & 0xfffeffff_u32) |
                UInt32.new!(oc3_m_3.to_int).&(0x1_u32) << 16
      end

      unless oc4_m_3.nil?
        value = (value & 0xfeffffff_u32) |
                UInt32.new!(oc4_m_3.to_int).&(0x1_u32) << 24
      end

      self.class.new(value)
    end

    def self.set(
      *,
      cc3_s : CC3S? = nil,
      oc3_fe : Bool? = nil,
      oc3_pe : OC3PE? = nil,
      oc3_m : OC3M? = nil,
      oc3_ce : Bool? = nil,
      cc4_s : CC4S? = nil,
      oc4_fe : Bool? = nil,
      oc4_pe : OC4PE? = nil,
      oc4_m : UInt8? = nil,
      oc4_ce : Bool? = nil,
      oc3_m_3 : OC3M_3? = nil,
      oc4_m_3 : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        cc3_s: cc3_s,
        oc3_fe: oc3_fe,
        oc3_pe: oc3_pe,
        oc3_m: oc3_m,
        oc3_ce: oc3_ce,
        cc4_s: cc4_s,
        oc4_fe: oc4_fe,
        oc4_pe: oc4_pe,
        oc4_m: oc4_m,
        oc4_ce: oc4_ce,
        oc3_m_3: oc3_m_3,
        oc4_m_3: oc4_m_3,
      )
    end
  end # struct

  # capture/compare mode register 2 (input          mode)
  struct CCMR2_Input
    ADDRESS = BASE_ADDRESS + 0x1c_u64

    protected def self.address : UInt64
      ADDRESS
    end

    @value : UInt32

    def initialize(@value : UInt32)
    end

    def to_int : UInt32
      @value
    end

    def self.reset_value : self
      new(0x0_u64)
    end

    def self.pointer : Pointer(UInt32)
      Pointer(UInt32).new(self.address)
    end

    def self.value : self
      value = self.pointer.load(volatile: true)
      new(value)
    end

    def self.value=(value : self) : self
      self.pointer.store(value.to_int, volatile: true)
      value
    end

    # Input capture 4 filter
    def ic4_f : UInt8
      UInt8.new!((@value >> 12) & 0xf_u32)
    end

    # Input capture 4 filter
    def self.ic4_f : UInt8
      value.ic4_f
    end

    # Input capture 4 filter
    def self.ic4_f=(value : UInt8) : UInt8
      self.set(ic4_f: value)
      value
    end

    # Input capture 4 prescaler
    def ic4_psc : UInt8
      UInt8.new!((@value >> 10) & 0x3_u32)
    end

    # Input capture 4 prescaler
    def self.ic4_psc : UInt8
      value.ic4_psc
    end

    # Input capture 4 prescaler
    def self.ic4_psc=(value : UInt8) : UInt8
      self.set(ic4_psc: value)
      value
    end

    enum CC4S : UInt8
      # CC4 channel is configured as input, IC4 is mapped on TI4
      TI4 = 0x1_u64

      # CC4 channel is configured as input, IC4 is mapped on TI3
      TI3 = 0x2_u64

      # CC4 channel is configured as input, IC4 is mapped on TRC
      TRC = 0x3_u64

      def self.reset_value : CC4S
        CCMR2_Input.reset_value.cc4_s
      end
    end

    # Capture/Compare 4              selection
    def cc4_s : CC4S
      CC4S.new!((@value >> 8) & 0x3_u32)
    end

    # Capture/Compare 4              selection
    def self.cc4_s : CC4S
      value.cc4_s
    end

    # Capture/Compare 4              selection
    def self.cc4_s=(value : CC4S) : CC4S
      self.set(cc4_s: value)
      value
    end

    # Input capture 3 filter
    def ic3_f : UInt8
      UInt8.new!((@value >> 4) & 0xf_u32)
    end

    # Input capture 3 filter
    def self.ic3_f : UInt8
      value.ic3_f
    end

    # Input capture 3 filter
    def self.ic3_f=(value : UInt8) : UInt8
      self.set(ic3_f: value)
      value
    end

    # Input capture 3 prescaler
    def ic3_psc : UInt8
      UInt8.new!((@value >> 2) & 0x3_u32)
    end

    # Input capture 3 prescaler
    def self.ic3_psc : UInt8
      value.ic3_psc
    end

    # Input capture 3 prescaler
    def self.ic3_psc=(value : UInt8) : UInt8
      self.set(ic3_psc: value)
      value
    end

    enum CC3S : UInt8
      # CC3 channel is configured as input, IC3 is mapped on TI3
      TI3 = 0x1_u64

      # CC3 channel is configured as input, IC3 is mapped on TI4
      TI4 = 0x2_u64

      # CC3 channel is configured as input, IC3 is mapped on TRC
      TRC = 0x3_u64

      def self.reset_value : CC3S
        CCMR2_Input.reset_value.cc3_s
      end
    end

    # Capture/Compare 3              selection
    def cc3_s : CC3S
      CC3S.new!((@value >> 0) & 0x3_u32)
    end

    # Capture/Compare 3              selection
    def self.cc3_s : CC3S
      value.cc3_s
    end

    # Capture/Compare 3              selection
    def self.cc3_s=(value : CC3S) : CC3S
      self.set(cc3_s: value)
      value
    end

    def copy_with(
      *,

      ic4_f : UInt8? = nil,

      ic4_psc : UInt8? = nil,

      cc4_s : CC4S? = nil,

      ic3_f : UInt8? = nil,

      ic3_psc : UInt8? = nil,

      cc3_s : CC3S? = nil
    ) : self
      value = @value

      unless ic4_f.nil?
        value = (value & 0xffff0fff_u32) |
                UInt32.new!(ic4_f.to_int).&(0xf_u32) << 12
      end

      unless ic4_psc.nil?
        value = (value & 0xfffff3ff_u32) |
                UInt32.new!(ic4_psc.to_int).&(0x3_u32) << 10
      end

      unless cc4_s.nil?
        value = (value & 0xfffffcff_u32) |
                UInt32.new!(cc4_s.to_int).&(0x3_u32) << 8
      end

      unless ic3_f.nil?
        value = (value & 0xffffff0f_u32) |
                UInt32.new!(ic3_f.to_int).&(0xf_u32) << 4
      end

      unless ic3_psc.nil?
        value = (value & 0xfffffff3_u32) |
                UInt32.new!(ic3_psc.to_int).&(0x3_u32) << 2
      end

      unless cc3_s.nil?
        value = (value & 0xfffffffc_u32) |
                UInt32.new!(cc3_s.to_int).&(0x3_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      ic4_f : UInt8? = nil,
      ic4_psc : UInt8? = nil,
      cc4_s : CC4S? = nil,
      ic3_f : UInt8? = nil,
      ic3_psc : UInt8? = nil,
      cc3_s : CC3S? = nil
    ) : Nil
      self.value = self.value.copy_with(
        ic4_f: ic4_f,
        ic4_psc: ic4_psc,
        cc4_s: cc4_s,
        ic3_f: ic3_f,
        ic3_psc: ic3_psc,
        cc3_s: cc3_s,
      )
    end
  end # struct

  # capture/compare enable          register
  struct CCER
    ADDRESS = BASE_ADDRESS + 0x20_u64

    protected def self.address : UInt64
      ADDRESS
    end

    @value : UInt32

    def initialize(@value : UInt32)
    end

    def to_int : UInt32
      @value
    end

    def self.reset_value : self
      new(0x0_u64)
    end

    def self.pointer : Pointer(UInt32)
      Pointer(UInt32).new(self.address)
    end

    def self.value : self
      value = self.pointer.load(volatile: true)
      new(value)
    end

    def self.value=(value : self) : self
      self.pointer.store(value.to_int, volatile: true)
      value
    end

    # Capture/Compare 1 output              enable
    def cc1_e : Bool
      @value.bits_set?(0x1_u32)
    end

    # Capture/Compare 1 output              enable
    def self.cc1_e : Bool
      value.cc1_e
    end

    # Capture/Compare 1 output              enable
    def self.cc1_e=(value : Bool) : Bool
      self.set(cc1_e: value)
      value
    end

    # Capture/Compare 1 output              Polarity
    def cc1_p : Bool
      @value.bits_set?(0x2_u32)
    end

    # Capture/Compare 1 output              Polarity
    def self.cc1_p : Bool
      value.cc1_p
    end

    # Capture/Compare 1 output              Polarity
    def self.cc1_p=(value : Bool) : Bool
      self.set(cc1_p: value)
      value
    end

    # Capture/Compare 1 output              Polarity
    def cc1_np : Bool
      @value.bits_set?(0x8_u32)
    end

    # Capture/Compare 1 output              Polarity
    def self.cc1_np : Bool
      value.cc1_np
    end

    # Capture/Compare 1 output              Polarity
    def self.cc1_np=(value : Bool) : Bool
      self.set(cc1_np: value)
      value
    end

    # Capture/Compare 2 output              enable
    def cc2_e : Bool
      @value.bits_set?(0x10_u32)
    end

    # Capture/Compare 2 output              enable
    def self.cc2_e : Bool
      value.cc2_e
    end

    # Capture/Compare 2 output              enable
    def self.cc2_e=(value : Bool) : Bool
      self.set(cc2_e: value)
      value
    end

    # Capture/Compare 2 output              Polarity
    def cc2_p : Bool
      @value.bits_set?(0x20_u32)
    end

    # Capture/Compare 2 output              Polarity
    def self.cc2_p : Bool
      value.cc2_p
    end

    # Capture/Compare 2 output              Polarity
    def self.cc2_p=(value : Bool) : Bool
      self.set(cc2_p: value)
      value
    end

    # Capture/Compare 2 output              Polarity
    def cc2_np : Bool
      @value.bits_set?(0x80_u32)
    end

    # Capture/Compare 2 output              Polarity
    def self.cc2_np : Bool
      value.cc2_np
    end

    # Capture/Compare 2 output              Polarity
    def self.cc2_np=(value : Bool) : Bool
      self.set(cc2_np: value)
      value
    end

    # Capture/Compare 3 output              enable
    def cc3_e : Bool
      @value.bits_set?(0x100_u32)
    end

    # Capture/Compare 3 output              enable
    def self.cc3_e : Bool
      value.cc3_e
    end

    # Capture/Compare 3 output              enable
    def self.cc3_e=(value : Bool) : Bool
      self.set(cc3_e: value)
      value
    end

    # Capture/Compare 3 output              Polarity
    def cc3_p : Bool
      @value.bits_set?(0x200_u32)
    end

    # Capture/Compare 3 output              Polarity
    def self.cc3_p : Bool
      value.cc3_p
    end

    # Capture/Compare 3 output              Polarity
    def self.cc3_p=(value : Bool) : Bool
      self.set(cc3_p: value)
      value
    end

    # Capture/Compare 3 output              Polarity
    def cc3_np : Bool
      @value.bits_set?(0x800_u32)
    end

    # Capture/Compare 3 output              Polarity
    def self.cc3_np : Bool
      value.cc3_np
    end

    # Capture/Compare 3 output              Polarity
    def self.cc3_np=(value : Bool) : Bool
      self.set(cc3_np: value)
      value
    end

    # Capture/Compare 4 output              enable
    def cc4_e : Bool
      @value.bits_set?(0x1000_u32)
    end

    # Capture/Compare 4 output              enable
    def self.cc4_e : Bool
      value.cc4_e
    end

    # Capture/Compare 4 output              enable
    def self.cc4_e=(value : Bool) : Bool
      self.set(cc4_e: value)
      value
    end

    # Capture/Compare 3 output              Polarity
    def cc4_p : Bool
      @value.bits_set?(0x2000_u32)
    end

    # Capture/Compare 3 output              Polarity
    def self.cc4_p : Bool
      value.cc4_p
    end

    # Capture/Compare 3 output              Polarity
    def self.cc4_p=(value : Bool) : Bool
      self.set(cc4_p: value)
      value
    end

    # Capture/Compare 3 output              Polarity
    def cc4_np : Bool
      @value.bits_set?(0x8000_u32)
    end

    # Capture/Compare 3 output              Polarity
    def self.cc4_np : Bool
      value.cc4_np
    end

    # Capture/Compare 3 output              Polarity
    def self.cc4_np=(value : Bool) : Bool
      self.set(cc4_np: value)
      value
    end

    def copy_with(
      *,

      cc1_e : Bool? = nil,

      cc1_p : Bool? = nil,

      cc1_np : Bool? = nil,

      cc2_e : Bool? = nil,

      cc2_p : Bool? = nil,

      cc2_np : Bool? = nil,

      cc3_e : Bool? = nil,

      cc3_p : Bool? = nil,

      cc3_np : Bool? = nil,

      cc4_e : Bool? = nil,

      cc4_p : Bool? = nil,

      cc4_np : Bool? = nil
    ) : self
      value = @value

      unless cc1_e.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(cc1_e.to_int).&(0x1_u32) << 0
      end

      unless cc1_p.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(cc1_p.to_int).&(0x1_u32) << 1
      end

      unless cc1_np.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(cc1_np.to_int).&(0x1_u32) << 3
      end

      unless cc2_e.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(cc2_e.to_int).&(0x1_u32) << 4
      end

      unless cc2_p.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(cc2_p.to_int).&(0x1_u32) << 5
      end

      unless cc2_np.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(cc2_np.to_int).&(0x1_u32) << 7
      end

      unless cc3_e.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(cc3_e.to_int).&(0x1_u32) << 8
      end

      unless cc3_p.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(cc3_p.to_int).&(0x1_u32) << 9
      end

      unless cc3_np.nil?
        value = (value & 0xfffff7ff_u32) |
                UInt32.new!(cc3_np.to_int).&(0x1_u32) << 11
      end

      unless cc4_e.nil?
        value = (value & 0xffffefff_u32) |
                UInt32.new!(cc4_e.to_int).&(0x1_u32) << 12
      end

      unless cc4_p.nil?
        value = (value & 0xffffdfff_u32) |
                UInt32.new!(cc4_p.to_int).&(0x1_u32) << 13
      end

      unless cc4_np.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(cc4_np.to_int).&(0x1_u32) << 15
      end

      self.class.new(value)
    end

    def self.set(
      *,
      cc1_e : Bool? = nil,
      cc1_p : Bool? = nil,
      cc1_np : Bool? = nil,
      cc2_e : Bool? = nil,
      cc2_p : Bool? = nil,
      cc2_np : Bool? = nil,
      cc3_e : Bool? = nil,
      cc3_p : Bool? = nil,
      cc3_np : Bool? = nil,
      cc4_e : Bool? = nil,
      cc4_p : Bool? = nil,
      cc4_np : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        cc1_e: cc1_e,
        cc1_p: cc1_p,
        cc1_np: cc1_np,
        cc2_e: cc2_e,
        cc2_p: cc2_p,
        cc2_np: cc2_np,
        cc3_e: cc3_e,
        cc3_p: cc3_p,
        cc3_np: cc3_np,
        cc4_e: cc4_e,
        cc4_p: cc4_p,
        cc4_np: cc4_np,
      )
    end
  end # struct

  # counter
  struct CNT
    ADDRESS = BASE_ADDRESS + 0x24_u64

    protected def self.address : UInt64
      ADDRESS
    end

    @value : UInt32

    def initialize(@value : UInt32)
    end

    def to_int : UInt32
      @value
    end

    def self.reset_value : self
      new(0x0_u64)
    end

    def self.pointer : Pointer(UInt32)
      Pointer(UInt32).new(self.address)
    end

    def self.value : self
      value = self.pointer.load(volatile: true)
      new(value)
    end

    def self.value=(value : self) : self
      self.pointer.store(value.to_int, volatile: true)
      value
    end

    # Counter value
    def cnt : UInt16
      UInt16.new!((@value >> 0) & 0xffff_u32)
    end

    # Counter value
    def self.cnt : UInt16
      value.cnt
    end

    # Counter value
    def self.cnt=(value : UInt16) : UInt16
      self.set(cnt: value)
      value
    end

    # High counter value
    def h : UInt16
      UInt16.new!((@value >> 16) & 0x7fff_u32)
    end

    # High counter value
    def self.h : UInt16
      value.h
    end

    # High counter value
    def self.h=(value : UInt16) : UInt16
      self.set(h: value)
      value
    end

    # if IUFREMAP=0 than CNT with read write              access else UIFCPY with read only              access
    def or_uifcpy : Bool
      @value.bits_set?(0x80000000_u32)
    end

    # if IUFREMAP=0 than CNT with read write              access else UIFCPY with read only              access
    def self.or_uifcpy : Bool
      value.or_uifcpy
    end

    # if IUFREMAP=0 than CNT with read write              access else UIFCPY with read only              access
    def self.or_uifcpy=(value : Bool) : Bool
      self.set(or_uifcpy: value)
      value
    end

    def copy_with(
      *,

      cnt : UInt16? = nil,

      h : UInt16? = nil,

      or_uifcpy : Bool? = nil
    ) : self
      value = @value

      unless cnt.nil?
        value = (value & 0xffff0000_u32) |
                UInt32.new!(cnt.to_int).&(0xffff_u32) << 0
      end

      unless h.nil?
        value = (value & 0x8000ffff_u32) |
                UInt32.new!(h.to_int).&(0x7fff_u32) << 16
      end

      unless or_uifcpy.nil?
        value = (value & 0x7fffffff_u32) |
                UInt32.new!(or_uifcpy.to_int).&(0x1_u32) << 31
      end

      self.class.new(value)
    end

    def self.set(
      *,
      cnt : UInt16? = nil,
      h : UInt16? = nil,
      or_uifcpy : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        cnt: cnt,
        h: h,
        or_uifcpy: or_uifcpy,
      )
    end
  end # struct

  # prescaler
  struct PSC
    ADDRESS = BASE_ADDRESS + 0x28_u64

    protected def self.address : UInt64
      ADDRESS
    end

    @value : UInt32

    def initialize(@value : UInt32)
    end

    def to_int : UInt32
      @value
    end

    def self.reset_value : self
      new(0x0_u64)
    end

    def self.pointer : Pointer(UInt32)
      Pointer(UInt32).new(self.address)
    end

    def self.value : self
      value = self.pointer.load(volatile: true)
      new(value)
    end

    def self.value=(value : self) : self
      self.pointer.store(value.to_int, volatile: true)
      value
    end

    # Prescaler value
    def psc : UInt16
      UInt16.new!((@value >> 0) & 0xffff_u32)
    end

    # Prescaler value
    def self.psc : UInt16
      value.psc
    end

    # Prescaler value
    def self.psc=(value : UInt16) : UInt16
      self.set(psc: value)
      value
    end

    def copy_with(
      *,

      psc : UInt16? = nil
    ) : self
      value = @value

      unless psc.nil?
        value = (value & 0xffff0000_u32) |
                UInt32.new!(psc.to_int).&(0xffff_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      psc : UInt16? = nil
    ) : Nil
      self.value = self.value.copy_with(
        psc: psc,
      )
    end
  end # struct

  # auto-reload register
  struct ARR
    ADDRESS = BASE_ADDRESS + 0x2c_u64

    protected def self.address : UInt64
      ADDRESS
    end

    @value : UInt32

    def initialize(@value : UInt32)
    end

    def to_int : UInt32
      @value
    end

    def self.reset_value : self
      new(0x0_u64)
    end

    def self.pointer : Pointer(UInt32)
      Pointer(UInt32).new(self.address)
    end

    def self.value : self
      value = self.pointer.load(volatile: true)
      new(value)
    end

    def self.value=(value : self) : self
      self.pointer.store(value.to_int, volatile: true)
      value
    end

    # Auto-reload value
    def arr : UInt16
      UInt16.new!((@value >> 0) & 0xffff_u32)
    end

    # Auto-reload value
    def self.arr : UInt16
      value.arr
    end

    # Auto-reload value
    def self.arr=(value : UInt16) : UInt16
      self.set(arr: value)
      value
    end

    # High Auto-reload value
    def h : UInt16
      UInt16.new!((@value >> 16) & 0xffff_u32)
    end

    # High Auto-reload value
    def self.h : UInt16
      value.h
    end

    # High Auto-reload value
    def self.h=(value : UInt16) : UInt16
      self.set(h: value)
      value
    end

    def copy_with(
      *,

      arr : UInt16? = nil,

      h : UInt16? = nil
    ) : self
      value = @value

      unless arr.nil?
        value = (value & 0xffff0000_u32) |
                UInt32.new!(arr.to_int).&(0xffff_u32) << 0
      end

      unless h.nil?
        value = (value & 0xffff_u32) |
                UInt32.new!(h.to_int).&(0xffff_u32) << 16
      end

      self.class.new(value)
    end

    def self.set(
      *,
      arr : UInt16? = nil,
      h : UInt16? = nil
    ) : Nil
      self.value = self.value.copy_with(
        arr: arr,
        h: h,
      )
    end
  end # struct

  # capture/compare register
  abstract struct CCR
    @value : UInt32

    def initialize(@value : UInt32)
    end

    def to_int : UInt32
      @value
    end

    def self.reset_value : self
      new(0x0_u64)
    end

    def self.pointer : Pointer(UInt32)
      Pointer(UInt32).new(self.address)
    end

    def self.value : self
      value = self.pointer.load(volatile: true)
      new(value)
    end

    def self.value=(value : self) : self
      self.pointer.store(value.to_int, volatile: true)
      value
    end

    # Capture/Compare value
    def ccr : UInt16
      UInt16.new!((@value >> 0) & 0xffff_u32)
    end

    # Capture/Compare value
    def self.ccr : UInt16
      value.ccr
    end

    # Capture/Compare value
    def self.ccr=(value : UInt16) : UInt16
      self.set(ccr: value)
      value
    end

    # High Capture/Compare 1 value (on              TIM2)
    def ccr1_h : UInt16
      UInt16.new!((@value >> 16) & 0xffff_u32)
    end

    # High Capture/Compare 1 value (on              TIM2)
    def self.ccr1_h : UInt16
      value.ccr1_h
    end

    # High Capture/Compare 1 value (on              TIM2)
    def self.ccr1_h=(value : UInt16) : UInt16
      self.set(ccr1_h: value)
      value
    end

    def copy_with(
      *,

      ccr : UInt16? = nil,

      ccr1_h : UInt16? = nil
    ) : self
      value = @value

      unless ccr.nil?
        value = (value & 0xffff0000_u32) |
                UInt32.new!(ccr.to_int).&(0xffff_u32) << 0
      end

      unless ccr1_h.nil?
        value = (value & 0xffff_u32) |
                UInt32.new!(ccr1_h.to_int).&(0xffff_u32) << 16
      end

      self.class.new(value)
    end

    def self.set(
      *,
      ccr : UInt16? = nil,
      ccr1_h : UInt16? = nil
    ) : Nil
      self.value = self.value.copy_with(
        ccr: ccr,
        ccr1_h: ccr1_h,
      )
    end
  end # struct

  # dim.instance_name(register.name, dim_index)
  struct CCR0 < CCR
    ADDRESS = BASE_ADDRESS + 0x34_u64

    protected def self.address : UInt64
      ADDRESS
    end
  end

  # dim.instance_name(register.name, dim_index)
  struct CCR1 < CCR
    ADDRESS = BASE_ADDRESS + 0x38_u64

    protected def self.address : UInt64
      ADDRESS
    end
  end

  # dim.instance_name(register.name, dim_index)
  struct CCR2 < CCR
    ADDRESS = BASE_ADDRESS + 0x3c_u64

    protected def self.address : UInt64
      ADDRESS
    end
  end

  # dim.instance_name(register.name, dim_index)
  struct CCR3 < CCR
    ADDRESS = BASE_ADDRESS + 0x40_u64

    protected def self.address : UInt64
      ADDRESS
    end
  end

  # DMA control register
  struct DCR
    ADDRESS = BASE_ADDRESS + 0x48_u64

    protected def self.address : UInt64
      ADDRESS
    end

    @value : UInt32

    def initialize(@value : UInt32)
    end

    def to_int : UInt32
      @value
    end

    def self.reset_value : self
      new(0x0_u64)
    end

    def self.pointer : Pointer(UInt32)
      Pointer(UInt32).new(self.address)
    end

    def self.value : self
      value = self.pointer.load(volatile: true)
      new(value)
    end

    def self.value=(value : self) : self
      self.pointer.store(value.to_int, volatile: true)
      value
    end

    # DMA burst length
    def dbl : UInt8
      UInt8.new!((@value >> 8) & 0x1f_u32)
    end

    # DMA burst length
    def self.dbl : UInt8
      value.dbl
    end

    # DMA burst length
    def self.dbl=(value : UInt8) : UInt8
      self.set(dbl: value)
      value
    end

    # DMA base address
    def dba : UInt8
      UInt8.new!((@value >> 0) & 0x1f_u32)
    end

    # DMA base address
    def self.dba : UInt8
      value.dba
    end

    # DMA base address
    def self.dba=(value : UInt8) : UInt8
      self.set(dba: value)
      value
    end

    def copy_with(
      *,

      dbl : UInt8? = nil,

      dba : UInt8? = nil
    ) : self
      value = @value

      unless dbl.nil?
        value = (value & 0xffffe0ff_u32) |
                UInt32.new!(dbl.to_int).&(0x1f_u32) << 8
      end

      unless dba.nil?
        value = (value & 0xffffffe0_u32) |
                UInt32.new!(dba.to_int).&(0x1f_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      dbl : UInt8? = nil,
      dba : UInt8? = nil
    ) : Nil
      self.value = self.value.copy_with(
        dbl: dbl,
        dba: dba,
      )
    end
  end # struct

  # DMA address for full transfer
  struct DMAR
    ADDRESS = BASE_ADDRESS + 0x4c_u64

    protected def self.address : UInt64
      ADDRESS
    end

    @value : UInt32

    def initialize(@value : UInt32)
    end

    def to_int : UInt32
      @value
    end

    def self.reset_value : self
      new(0x0_u64)
    end

    def self.pointer : Pointer(UInt32)
      Pointer(UInt32).new(self.address)
    end

    def self.value : self
      value = self.pointer.load(volatile: true)
      new(value)
    end

    def self.value=(value : self) : self
      self.pointer.store(value.to_int, volatile: true)
      value
    end

    # DMA register for burst              accesses
    def dmab : UInt16
      UInt16.new!((@value >> 0) & 0xffff_u32)
    end

    # DMA register for burst              accesses
    def self.dmab : UInt16
      value.dmab
    end

    # DMA register for burst              accesses
    def self.dmab=(value : UInt16) : UInt16
      self.set(dmab: value)
      value
    end

    def copy_with(
      *,

      dmab : UInt16? = nil
    ) : self
      value = @value

      unless dmab.nil?
        value = (value & 0xffff0000_u32) |
                UInt32.new!(dmab.to_int).&(0xffff_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      dmab : UInt16? = nil
    ) : Nil
      self.value = self.value.copy_with(
        dmab: dmab,
      )
    end
  end # struct

end
