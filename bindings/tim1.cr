# Advanced timer
module TIM1
  VERSION      = nil
  BASE_ADDRESS = 0x40012c00_u64

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

    # Capture/compare preloaded              control
    def ccpc : Bool
      @value.bits_set?(0x1_u32)
    end

    # Capture/compare preloaded              control
    def self.ccpc : Bool
      value.ccpc
    end

    # Capture/compare preloaded              control
    def self.ccpc=(value : Bool) : Bool
      self.set(ccpc: value)
      value
    end

    # Capture/compare control update              selection
    def ccus : Bool
      @value.bits_set?(0x4_u32)
    end

    # Capture/compare control update              selection
    def self.ccus : Bool
      value.ccus
    end

    # Capture/compare control update              selection
    def self.ccus=(value : Bool) : Bool
      self.set(ccus: value)
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

    # Output Idle state 1
    def ois1 : Bool
      @value.bits_set?(0x100_u32)
    end

    # Output Idle state 1
    def self.ois1 : Bool
      value.ois1
    end

    # Output Idle state 1
    def self.ois1=(value : Bool) : Bool
      self.set(ois1: value)
      value
    end

    # Output Idle state 1
    def ois1_n : Bool
      @value.bits_set?(0x200_u32)
    end

    # Output Idle state 1
    def self.ois1_n : Bool
      value.ois1_n
    end

    # Output Idle state 1
    def self.ois1_n=(value : Bool) : Bool
      self.set(ois1_n: value)
      value
    end

    # Output Idle state 2
    def ois2 : Bool
      @value.bits_set?(0x400_u32)
    end

    # Output Idle state 2
    def self.ois2 : Bool
      value.ois2
    end

    # Output Idle state 2
    def self.ois2=(value : Bool) : Bool
      self.set(ois2: value)
      value
    end

    # Output Idle state 2
    def ois2_n : Bool
      @value.bits_set?(0x800_u32)
    end

    # Output Idle state 2
    def self.ois2_n : Bool
      value.ois2_n
    end

    # Output Idle state 2
    def self.ois2_n=(value : Bool) : Bool
      self.set(ois2_n: value)
      value
    end

    # Output Idle state 3
    def ois3 : Bool
      @value.bits_set?(0x1000_u32)
    end

    # Output Idle state 3
    def self.ois3 : Bool
      value.ois3
    end

    # Output Idle state 3
    def self.ois3=(value : Bool) : Bool
      self.set(ois3: value)
      value
    end

    # Output Idle state 3
    def ois3_n : Bool
      @value.bits_set?(0x2000_u32)
    end

    # Output Idle state 3
    def self.ois3_n : Bool
      value.ois3_n
    end

    # Output Idle state 3
    def self.ois3_n=(value : Bool) : Bool
      self.set(ois3_n: value)
      value
    end

    # Output Idle state 4
    def ois4 : Bool
      @value.bits_set?(0x4000_u32)
    end

    # Output Idle state 4
    def self.ois4 : Bool
      value.ois4
    end

    # Output Idle state 4
    def self.ois4=(value : Bool) : Bool
      self.set(ois4: value)
      value
    end

    # Output Idle state 5
    def ois5 : Bool
      @value.bits_set?(0x10000_u32)
    end

    # Output Idle state 5
    def self.ois5 : Bool
      value.ois5
    end

    # Output Idle state 5
    def self.ois5=(value : Bool) : Bool
      self.set(ois5: value)
      value
    end

    # Output Idle state 6
    def ois6 : Bool
      @value.bits_set?(0x40000_u32)
    end

    # Output Idle state 6
    def self.ois6 : Bool
      value.ois6
    end

    # Output Idle state 6
    def self.ois6=(value : Bool) : Bool
      self.set(ois6: value)
      value
    end

    # Master mode selection 2
    def mms2 : UInt8
      UInt8.new!((@value >> 20) & 0xf_u32)
    end

    # Master mode selection 2
    def self.mms2 : UInt8
      value.mms2
    end

    # Master mode selection 2
    def self.mms2=(value : UInt8) : UInt8
      self.set(mms2: value)
      value
    end

    def copy_with(
      *,

      ccpc : Bool? = nil,

      ccus : Bool? = nil,

      ccds : CCDS? = nil,

      mms : MMS? = nil,

      ti1_s : TI1S? = nil,

      ois1 : Bool? = nil,

      ois1_n : Bool? = nil,

      ois2 : Bool? = nil,

      ois2_n : Bool? = nil,

      ois3 : Bool? = nil,

      ois3_n : Bool? = nil,

      ois4 : Bool? = nil,

      ois5 : Bool? = nil,

      ois6 : Bool? = nil,

      mms2 : UInt8? = nil
    ) : self
      value = @value

      unless ccpc.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(ccpc.to_int).&(0x1_u32) << 0
      end

      unless ccus.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(ccus.to_int).&(0x1_u32) << 2
      end

      unless ccds.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(ccds.to_int).&(0x1_u32) << 3
      end

      unless mms.nil?
        value = (value & 0xffffff8f_u32) |
                UInt32.new!(mms.to_int).&(0x7_u32) << 4
      end

      unless ti1_s.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(ti1_s.to_int).&(0x1_u32) << 7
      end

      unless ois1.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(ois1.to_int).&(0x1_u32) << 8
      end

      unless ois1_n.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(ois1_n.to_int).&(0x1_u32) << 9
      end

      unless ois2.nil?
        value = (value & 0xfffffbff_u32) |
                UInt32.new!(ois2.to_int).&(0x1_u32) << 10
      end

      unless ois2_n.nil?
        value = (value & 0xfffff7ff_u32) |
                UInt32.new!(ois2_n.to_int).&(0x1_u32) << 11
      end

      unless ois3.nil?
        value = (value & 0xffffefff_u32) |
                UInt32.new!(ois3.to_int).&(0x1_u32) << 12
      end

      unless ois3_n.nil?
        value = (value & 0xffffdfff_u32) |
                UInt32.new!(ois3_n.to_int).&(0x1_u32) << 13
      end

      unless ois4.nil?
        value = (value & 0xffffbfff_u32) |
                UInt32.new!(ois4.to_int).&(0x1_u32) << 14
      end

      unless ois5.nil?
        value = (value & 0xfffeffff_u32) |
                UInt32.new!(ois5.to_int).&(0x1_u32) << 16
      end

      unless ois6.nil?
        value = (value & 0xfffbffff_u32) |
                UInt32.new!(ois6.to_int).&(0x1_u32) << 18
      end

      unless mms2.nil?
        value = (value & 0xff0fffff_u32) |
                UInt32.new!(mms2.to_int).&(0xf_u32) << 20
      end

      self.class.new(value)
    end

    def self.set(
      *,
      ccpc : Bool? = nil,
      ccus : Bool? = nil,
      ccds : CCDS? = nil,
      mms : MMS? = nil,
      ti1_s : TI1S? = nil,
      ois1 : Bool? = nil,
      ois1_n : Bool? = nil,
      ois2 : Bool? = nil,
      ois2_n : Bool? = nil,
      ois3 : Bool? = nil,
      ois3_n : Bool? = nil,
      ois4 : Bool? = nil,
      ois5 : Bool? = nil,
      ois6 : Bool? = nil,
      mms2 : UInt8? = nil
    ) : Nil
      self.value = self.value.copy_with(
        ccpc: ccpc,
        ccus: ccus,
        ccds: ccds,
        mms: mms,
        ti1_s: ti1_s,
        ois1: ois1,
        ois1_n: ois1_n,
        ois2: ois2,
        ois2_n: ois2_n,
        ois3: ois3,
        ois3_n: ois3_n,
        ois4: ois4,
        ois5: ois5,
        ois6: ois6,
        mms2: mms2,
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

    # Slave mode selection bit 3
    def sms3 : Bool
      @value.bits_set?(0x10000_u32)
    end

    # Slave mode selection bit 3
    def self.sms3 : Bool
      value.sms3
    end

    # Slave mode selection bit 3
    def self.sms3=(value : Bool) : Bool
      self.set(sms3: value)
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

      sms3 : Bool? = nil
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

      unless sms3.nil?
        value = (value & 0xfffeffff_u32) |
                UInt32.new!(sms3.to_int).&(0x1_u32) << 16
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
      sms3 : Bool? = nil
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
        sms3: sms3,
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

    # COM DMA request enable
    def comde : Bool
      @value.bits_set?(0x2000_u32)
    end

    # COM DMA request enable
    def self.comde : Bool
      value.comde
    end

    # COM DMA request enable
    def self.comde=(value : Bool) : Bool
      self.set(comde: value)
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

    # Break interrupt enable
    def bie : Bool
      @value.bits_set?(0x80_u32)
    end

    # Break interrupt enable
    def self.bie : Bool
      value.bie
    end

    # Break interrupt enable
    def self.bie=(value : Bool) : Bool
      self.set(bie: value)
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

    # COM interrupt enable
    def comie : Bool
      @value.bits_set?(0x20_u32)
    end

    # COM interrupt enable
    def self.comie : Bool
      value.comie
    end

    # COM interrupt enable
    def self.comie=(value : Bool) : Bool
      self.set(comie: value)
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

      comde : Bool? = nil,

      cc4_de : Bool? = nil,

      cc3_de : Bool? = nil,

      cc2_de : Bool? = nil,

      cc1_de : CC1DE? = nil,

      ude : UDE? = nil,

      bie : Bool? = nil,

      tie : TIE? = nil,

      comie : Bool? = nil,

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

      unless comde.nil?
        value = (value & 0xffffdfff_u32) |
                UInt32.new!(comde.to_int).&(0x1_u32) << 13
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

      unless bie.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(bie.to_int).&(0x1_u32) << 7
      end

      unless tie.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(tie.to_int).&(0x1_u32) << 6
      end

      unless comie.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(comie.to_int).&(0x1_u32) << 5
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
      comde : Bool? = nil,
      cc4_de : Bool? = nil,
      cc3_de : Bool? = nil,
      cc2_de : Bool? = nil,
      cc1_de : CC1DE? = nil,
      ude : UDE? = nil,
      bie : Bool? = nil,
      tie : TIE? = nil,
      comie : Bool? = nil,
      cc4_ie : Bool? = nil,
      cc3_ie : Bool? = nil,
      cc2_ie : Bool? = nil,
      cc1_ie : CC1IE? = nil,
      uie : UIE? = nil
    ) : Nil
      self.value = self.value.copy_with(
        tde: tde,
        comde: comde,
        cc4_de: cc4_de,
        cc3_de: cc3_de,
        cc2_de: cc2_de,
        cc1_de: cc1_de,
        ude: ude,
        bie: bie,
        tie: tie,
        comie: comie,
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

    # COM interrupt flag
    def comif : Bool
      @value.bits_set?(0x20_u32)
    end

    # COM interrupt flag
    def self.comif : Bool
      value.comif
    end

    # COM interrupt flag
    def self.comif=(value : Bool) : Bool
      self.set(comif: value)
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

    # Break interrupt flag
    def bif : Bool
      @value.bits_set?(0x80_u32)
    end

    # Break interrupt flag
    def self.bif : Bool
      value.bif
    end

    # Break interrupt flag
    def self.bif=(value : Bool) : Bool
      self.set(bif: value)
      value
    end

    # Break 2 interrupt flag
    def b2_if : Bool
      @value.bits_set?(0x100_u32)
    end

    # Break 2 interrupt flag
    def self.b2_if : Bool
      value.b2_if
    end

    # Break 2 interrupt flag
    def self.b2_if=(value : Bool) : Bool
      self.set(b2_if: value)
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

    # Capture/Compare 5 interrupt              flag
    def c5_if : Bool
      @value.bits_set?(0x10000_u32)
    end

    # Capture/Compare 5 interrupt              flag
    def self.c5_if : Bool
      value.c5_if
    end

    # Capture/Compare 5 interrupt              flag
    def self.c5_if=(value : Bool) : Bool
      self.set(c5_if: value)
      value
    end

    # Capture/Compare 6 interrupt              flag
    def c6_if : Bool
      @value.bits_set?(0x20000_u32)
    end

    # Capture/Compare 6 interrupt              flag
    def self.c6_if : Bool
      value.c6_if
    end

    # Capture/Compare 6 interrupt              flag
    def self.c6_if=(value : Bool) : Bool
      self.set(c6_if: value)
      value
    end

    def copy_with(
      *,

      uif : UIF? = nil,

      cc1_if : CC1IF? = nil,

      cc2_if : Bool? = nil,

      cc3_if : Bool? = nil,

      cc4_if : Bool? = nil,

      comif : Bool? = nil,

      tif : TIF? = nil,

      bif : Bool? = nil,

      b2_if : Bool? = nil,

      cc1_of : CC1OF? = nil,

      cc2_of : Bool? = nil,

      cc3_of : Bool? = nil,

      cc4_of : Bool? = nil,

      c5_if : Bool? = nil,

      c6_if : Bool? = nil
    ) : self
      value = @value

      unless uif.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(uif.to_int).&(0x1_u32) << 0
      end

      unless cc1_if.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(cc1_if.to_int).&(0x1_u32) << 1
      end

      unless cc2_if.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(cc2_if.to_int).&(0x1_u32) << 2
      end

      unless cc3_if.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(cc3_if.to_int).&(0x1_u32) << 3
      end

      unless cc4_if.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(cc4_if.to_int).&(0x1_u32) << 4
      end

      unless comif.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(comif.to_int).&(0x1_u32) << 5
      end

      unless tif.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(tif.to_int).&(0x1_u32) << 6
      end

      unless bif.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(bif.to_int).&(0x1_u32) << 7
      end

      unless b2_if.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(b2_if.to_int).&(0x1_u32) << 8
      end

      unless cc1_of.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(cc1_of.to_int).&(0x1_u32) << 9
      end

      unless cc2_of.nil?
        value = (value & 0xfffffbff_u32) |
                UInt32.new!(cc2_of.to_int).&(0x1_u32) << 10
      end

      unless cc3_of.nil?
        value = (value & 0xfffff7ff_u32) |
                UInt32.new!(cc3_of.to_int).&(0x1_u32) << 11
      end

      unless cc4_of.nil?
        value = (value & 0xffffefff_u32) |
                UInt32.new!(cc4_of.to_int).&(0x1_u32) << 12
      end

      unless c5_if.nil?
        value = (value & 0xfffeffff_u32) |
                UInt32.new!(c5_if.to_int).&(0x1_u32) << 16
      end

      unless c6_if.nil?
        value = (value & 0xfffdffff_u32) |
                UInt32.new!(c6_if.to_int).&(0x1_u32) << 17
      end

      self.class.new(value)
    end

    def self.set(
      *,
      uif : UIF? = nil,
      cc1_if : CC1IF? = nil,
      cc2_if : Bool? = nil,
      cc3_if : Bool? = nil,
      cc4_if : Bool? = nil,
      comif : Bool? = nil,
      tif : TIF? = nil,
      bif : Bool? = nil,
      b2_if : Bool? = nil,
      cc1_of : CC1OF? = nil,
      cc2_of : Bool? = nil,
      cc3_of : Bool? = nil,
      cc4_of : Bool? = nil,
      c5_if : Bool? = nil,
      c6_if : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        uif: uif,
        cc1_if: cc1_if,
        cc2_if: cc2_if,
        cc3_if: cc3_if,
        cc4_if: cc4_if,
        comif: comif,
        tif: tif,
        bif: bif,
        b2_if: b2_if,
        cc1_of: cc1_of,
        cc2_of: cc2_of,
        cc3_of: cc3_of,
        cc4_of: cc4_of,
        c5_if: c5_if,
        c6_if: c6_if,
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

    # Capture/compare 2              generation
    def self.cc2_g=(value : Bool) : Bool
      self.set(cc2_g: value)
      value
    end

    # Capture/compare 3              generation
    def self.cc3_g=(value : Bool) : Bool
      self.set(cc3_g: value)
      value
    end

    # Capture/compare 4              generation
    def self.cc4_g=(value : Bool) : Bool
      self.set(cc4_g: value)
      value
    end

    # Capture/Compare control update              generation
    def self.comg=(value : Bool) : Bool
      self.set(comg: value)
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

    # Break generation
    def self.bg=(value : Bool) : Bool
      self.set(bg: value)
      value
    end

    # Break 2 generation
    def self.b2_g=(value : Bool) : Bool
      self.set(b2_g: value)
      value
    end

    def copy_with(
      *,

      ug : UG? = nil,

      cc1_g : CC1G? = nil,

      cc2_g : Bool? = nil,

      cc3_g : Bool? = nil,

      cc4_g : Bool? = nil,

      comg : Bool? = nil,

      tg : TG? = nil,

      bg : Bool? = nil,

      b2_g : Bool? = nil
    ) : self
      value = @value

      unless ug.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(ug.to_int).&(0x1_u32) << 0
      end

      unless cc1_g.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(cc1_g.to_int).&(0x1_u32) << 1
      end

      unless cc2_g.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(cc2_g.to_int).&(0x1_u32) << 2
      end

      unless cc3_g.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(cc3_g.to_int).&(0x1_u32) << 3
      end

      unless cc4_g.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(cc4_g.to_int).&(0x1_u32) << 4
      end

      unless comg.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(comg.to_int).&(0x1_u32) << 5
      end

      unless tg.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(tg.to_int).&(0x1_u32) << 6
      end

      unless bg.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(bg.to_int).&(0x1_u32) << 7
      end

      unless b2_g.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(b2_g.to_int).&(0x1_u32) << 8
      end

      self.class.new(value)
    end

    def self.set(
      *,
      ug : UG? = nil,
      cc1_g : CC1G? = nil,
      cc2_g : Bool? = nil,
      cc3_g : Bool? = nil,
      cc4_g : Bool? = nil,
      comg : Bool? = nil,
      tg : TG? = nil,
      bg : Bool? = nil,
      b2_g : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        ug: ug,
        cc1_g: cc1_g,
        cc2_g: cc2_g,
        cc3_g: cc3_g,
        cc4_g: cc4_g,
        comg: comg,
        tg: tg,
        bg: bg,
        b2_g: b2_g,
      )
    end
  end # struct

  # capture/compare mode register (output          mode)
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

    # Output Compare 2 clear              enable
    def oc2_ce : Bool
      @value.bits_set?(0x8000_u32)
    end

    # Output Compare 2 clear              enable
    def self.oc2_ce : Bool
      value.oc2_ce
    end

    # Output Compare 2 clear              enable
    def self.oc2_ce=(value : Bool) : Bool
      self.set(oc2_ce: value)
      value
    end

    # Output Compare 2 mode
    def oc2_m : UInt8
      UInt8.new!((@value >> 12) & 0x7_u32)
    end

    # Output Compare 2 mode
    def self.oc2_m : UInt8
      value.oc2_m
    end

    # Output Compare 2 mode
    def self.oc2_m=(value : UInt8) : UInt8
      self.set(oc2_m: value)
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

    # Output Compare 2 preload              enable
    def oc2_pe : OC2PE
      OC2PE.new!((@value >> 11) & 0x1_u32)
    end

    # Output Compare 2 preload              enable
    def self.oc2_pe : OC2PE
      value.oc2_pe
    end

    # Output Compare 2 preload              enable
    def self.oc2_pe=(value : OC2PE) : OC2PE
      self.set(oc2_pe: value)
      value
    end

    # Output Compare 2 fast              enable
    def oc2_fe : Bool
      @value.bits_set?(0x400_u32)
    end

    # Output Compare 2 fast              enable
    def self.oc2_fe : Bool
      value.oc2_fe
    end

    # Output Compare 2 fast              enable
    def self.oc2_fe=(value : Bool) : Bool
      self.set(oc2_fe: value)
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

    # Output Compare 1 clear              enable
    def oc1_ce : Bool
      @value.bits_set?(0x80_u32)
    end

    # Output Compare 1 clear              enable
    def self.oc1_ce : Bool
      value.oc1_ce
    end

    # Output Compare 1 clear              enable
    def self.oc1_ce=(value : Bool) : Bool
      self.set(oc1_ce: value)
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

    # Output Compare 1 mode
    def oc1_m : OC1M
      OC1M.new!((@value >> 4) & 0x7_u32)
    end

    # Output Compare 1 mode
    def self.oc1_m : OC1M
      value.oc1_m
    end

    # Output Compare 1 mode
    def self.oc1_m=(value : OC1M) : OC1M
      self.set(oc1_m: value)
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

    # Output Compare 1 preload              enable
    def oc1_pe : OC1PE
      OC1PE.new!((@value >> 3) & 0x1_u32)
    end

    # Output Compare 1 preload              enable
    def self.oc1_pe : OC1PE
      value.oc1_pe
    end

    # Output Compare 1 preload              enable
    def self.oc1_pe=(value : OC1PE) : OC1PE
      self.set(oc1_pe: value)
      value
    end

    # Output Compare 1 fast              enable
    def oc1_fe : Bool
      @value.bits_set?(0x4_u32)
    end

    # Output Compare 1 fast              enable
    def self.oc1_fe : Bool
      value.oc1_fe
    end

    # Output Compare 1 fast              enable
    def self.oc1_fe=(value : Bool) : Bool
      self.set(oc1_fe: value)
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

    enum OC1M_3 : UInt8
      # Normal output compare mode (modes 0-7)
      NORMAL = 0x0_u64

      # Extended output compare mode (modes 7-15)
      EXTENDED = 0x1_u64

      def self.reset_value : OC1M_3
        CCMR1_Output.reset_value.oc1_m_3
      end
    end

    # Output Compare 1 mode bit              3
    def oc1_m_3 : OC1M_3
      OC1M_3.new!((@value >> 16) & 0x1_u32)
    end

    # Output Compare 1 mode bit              3
    def self.oc1_m_3 : OC1M_3
      value.oc1_m_3
    end

    # Output Compare 1 mode bit              3
    def self.oc1_m_3=(value : OC1M_3) : OC1M_3
      self.set(oc1_m_3: value)
      value
    end

    # Output Compare 2 mode bit              3
    def oc2_m_3 : Bool
      @value.bits_set?(0x1000000_u32)
    end

    # Output Compare 2 mode bit              3
    def self.oc2_m_3 : Bool
      value.oc2_m_3
    end

    # Output Compare 2 mode bit              3
    def self.oc2_m_3=(value : Bool) : Bool
      self.set(oc2_m_3: value)
      value
    end

    def copy_with(
      *,

      oc2_ce : Bool? = nil,

      oc2_m : UInt8? = nil,

      oc2_pe : OC2PE? = nil,

      oc2_fe : Bool? = nil,

      cc2_s : CC2S? = nil,

      oc1_ce : Bool? = nil,

      oc1_m : OC1M? = nil,

      oc1_pe : OC1PE? = nil,

      oc1_fe : Bool? = nil,

      cc1_s : CC1S? = nil,

      oc1_m_3 : OC1M_3? = nil,

      oc2_m_3 : Bool? = nil
    ) : self
      value = @value

      unless oc2_ce.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(oc2_ce.to_int).&(0x1_u32) << 15
      end

      unless oc2_m.nil?
        value = (value & 0xffff8fff_u32) |
                UInt32.new!(oc2_m.to_int).&(0x7_u32) << 12
      end

      unless oc2_pe.nil?
        value = (value & 0xfffff7ff_u32) |
                UInt32.new!(oc2_pe.to_int).&(0x1_u32) << 11
      end

      unless oc2_fe.nil?
        value = (value & 0xfffffbff_u32) |
                UInt32.new!(oc2_fe.to_int).&(0x1_u32) << 10
      end

      unless cc2_s.nil?
        value = (value & 0xfffffcff_u32) |
                UInt32.new!(cc2_s.to_int).&(0x3_u32) << 8
      end

      unless oc1_ce.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(oc1_ce.to_int).&(0x1_u32) << 7
      end

      unless oc1_m.nil?
        value = (value & 0xffffff8f_u32) |
                UInt32.new!(oc1_m.to_int).&(0x7_u32) << 4
      end

      unless oc1_pe.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(oc1_pe.to_int).&(0x1_u32) << 3
      end

      unless oc1_fe.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(oc1_fe.to_int).&(0x1_u32) << 2
      end

      unless cc1_s.nil?
        value = (value & 0xfffffffc_u32) |
                UInt32.new!(cc1_s.to_int).&(0x3_u32) << 0
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
      oc2_ce : Bool? = nil,
      oc2_m : UInt8? = nil,
      oc2_pe : OC2PE? = nil,
      oc2_fe : Bool? = nil,
      cc2_s : CC2S? = nil,
      oc1_ce : Bool? = nil,
      oc1_m : OC1M? = nil,
      oc1_pe : OC1PE? = nil,
      oc1_fe : Bool? = nil,
      cc1_s : CC1S? = nil,
      oc1_m_3 : OC1M_3? = nil,
      oc2_m_3 : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        oc2_ce: oc2_ce,
        oc2_m: oc2_m,
        oc2_pe: oc2_pe,
        oc2_fe: oc2_fe,
        cc2_s: cc2_s,
        oc1_ce: oc1_ce,
        oc1_m: oc1_m,
        oc1_pe: oc1_pe,
        oc1_fe: oc1_fe,
        cc1_s: cc1_s,
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

  # capture/compare mode register (output          mode)
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

    enum OC3M_3 : UInt8
      # Normal output compare mode (modes 0-7)
      NORMAL = 0x0_u64

      # Extended output compare mode (modes 7-15)
      EXTENDED = 0x1_u64

      def self.reset_value : OC3M_3
        CCMR2_Output.reset_value.oc3_m_3
      end
    end

    # Output Compare 3 mode bit              3
    def oc3_m_3 : OC3M_3
      OC3M_3.new!((@value >> 16) & 0x1_u32)
    end

    # Output Compare 3 mode bit              3
    def self.oc3_m_3 : OC3M_3
      value.oc3_m_3
    end

    # Output Compare 3 mode bit              3
    def self.oc3_m_3=(value : OC3M_3) : OC3M_3
      self.set(oc3_m_3: value)
      value
    end

    # Output Compare 4 mode bit              3
    def oc4_m_3 : Bool
      @value.bits_set?(0x1000000_u32)
    end

    # Output Compare 4 mode bit              3
    def self.oc4_m_3 : Bool
      value.oc4_m_3
    end

    # Output Compare 4 mode bit              3
    def self.oc4_m_3=(value : Bool) : Bool
      self.set(oc4_m_3: value)
      value
    end

    def copy_with(
      *,

      oc4_ce : Bool? = nil,

      oc4_m : UInt8? = nil,

      oc4_pe : OC4PE? = nil,

      oc4_fe : Bool? = nil,

      cc4_s : CC4S? = nil,

      oc3_ce : Bool? = nil,

      oc3_m : OC3M? = nil,

      oc3_pe : OC3PE? = nil,

      oc3_fe : Bool? = nil,

      cc3_s : CC3S? = nil,

      oc3_m_3 : OC3M_3? = nil,

      oc4_m_3 : Bool? = nil
    ) : self
      value = @value

      unless oc4_ce.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(oc4_ce.to_int).&(0x1_u32) << 15
      end

      unless oc4_m.nil?
        value = (value & 0xffff8fff_u32) |
                UInt32.new!(oc4_m.to_int).&(0x7_u32) << 12
      end

      unless oc4_pe.nil?
        value = (value & 0xfffff7ff_u32) |
                UInt32.new!(oc4_pe.to_int).&(0x1_u32) << 11
      end

      unless oc4_fe.nil?
        value = (value & 0xfffffbff_u32) |
                UInt32.new!(oc4_fe.to_int).&(0x1_u32) << 10
      end

      unless cc4_s.nil?
        value = (value & 0xfffffcff_u32) |
                UInt32.new!(cc4_s.to_int).&(0x3_u32) << 8
      end

      unless oc3_ce.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(oc3_ce.to_int).&(0x1_u32) << 7
      end

      unless oc3_m.nil?
        value = (value & 0xffffff8f_u32) |
                UInt32.new!(oc3_m.to_int).&(0x7_u32) << 4
      end

      unless oc3_pe.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(oc3_pe.to_int).&(0x1_u32) << 3
      end

      unless oc3_fe.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(oc3_fe.to_int).&(0x1_u32) << 2
      end

      unless cc3_s.nil?
        value = (value & 0xfffffffc_u32) |
                UInt32.new!(cc3_s.to_int).&(0x3_u32) << 0
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
      oc4_ce : Bool? = nil,
      oc4_m : UInt8? = nil,
      oc4_pe : OC4PE? = nil,
      oc4_fe : Bool? = nil,
      cc4_s : CC4S? = nil,
      oc3_ce : Bool? = nil,
      oc3_m : OC3M? = nil,
      oc3_pe : OC3PE? = nil,
      oc3_fe : Bool? = nil,
      cc3_s : CC3S? = nil,
      oc3_m_3 : OC3M_3? = nil,
      oc4_m_3 : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        oc4_ce: oc4_ce,
        oc4_m: oc4_m,
        oc4_pe: oc4_pe,
        oc4_fe: oc4_fe,
        cc4_s: cc4_s,
        oc3_ce: oc3_ce,
        oc3_m: oc3_m,
        oc3_pe: oc3_pe,
        oc3_fe: oc3_fe,
        cc3_s: cc3_s,
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

    # Capture/compare 3              selection
    def cc3_s : CC3S
      CC3S.new!((@value >> 0) & 0x3_u32)
    end

    # Capture/compare 3              selection
    def self.cc3_s : CC3S
      value.cc3_s
    end

    # Capture/compare 3              selection
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

    # Capture/Compare 1 complementary output              enable
    def cc1_ne : Bool
      @value.bits_set?(0x4_u32)
    end

    # Capture/Compare 1 complementary output              enable
    def self.cc1_ne : Bool
      value.cc1_ne
    end

    # Capture/Compare 1 complementary output              enable
    def self.cc1_ne=(value : Bool) : Bool
      self.set(cc1_ne: value)
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

    # Capture/Compare 2 complementary output              enable
    def cc2_ne : Bool
      @value.bits_set?(0x40_u32)
    end

    # Capture/Compare 2 complementary output              enable
    def self.cc2_ne : Bool
      value.cc2_ne
    end

    # Capture/Compare 2 complementary output              enable
    def self.cc2_ne=(value : Bool) : Bool
      self.set(cc2_ne: value)
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

    # Capture/Compare 3 complementary output              enable
    def cc3_ne : Bool
      @value.bits_set?(0x400_u32)
    end

    # Capture/Compare 3 complementary output              enable
    def self.cc3_ne : Bool
      value.cc3_ne
    end

    # Capture/Compare 3 complementary output              enable
    def self.cc3_ne=(value : Bool) : Bool
      self.set(cc3_ne: value)
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

    # Capture/Compare 4 output              Polarity
    def cc4_np : Bool
      @value.bits_set?(0x8000_u32)
    end

    # Capture/Compare 4 output              Polarity
    def self.cc4_np : Bool
      value.cc4_np
    end

    # Capture/Compare 4 output              Polarity
    def self.cc4_np=(value : Bool) : Bool
      self.set(cc4_np: value)
      value
    end

    # Capture/Compare 5 output              enable
    def cc5_e : Bool
      @value.bits_set?(0x10000_u32)
    end

    # Capture/Compare 5 output              enable
    def self.cc5_e : Bool
      value.cc5_e
    end

    # Capture/Compare 5 output              enable
    def self.cc5_e=(value : Bool) : Bool
      self.set(cc5_e: value)
      value
    end

    # Capture/Compare 5 output              Polarity
    def cc5_p : Bool
      @value.bits_set?(0x20000_u32)
    end

    # Capture/Compare 5 output              Polarity
    def self.cc5_p : Bool
      value.cc5_p
    end

    # Capture/Compare 5 output              Polarity
    def self.cc5_p=(value : Bool) : Bool
      self.set(cc5_p: value)
      value
    end

    # Capture/Compare 6 output              enable
    def cc6_e : Bool
      @value.bits_set?(0x100000_u32)
    end

    # Capture/Compare 6 output              enable
    def self.cc6_e : Bool
      value.cc6_e
    end

    # Capture/Compare 6 output              enable
    def self.cc6_e=(value : Bool) : Bool
      self.set(cc6_e: value)
      value
    end

    # Capture/Compare 6 output              Polarity
    def cc6_p : Bool
      @value.bits_set?(0x200000_u32)
    end

    # Capture/Compare 6 output              Polarity
    def self.cc6_p : Bool
      value.cc6_p
    end

    # Capture/Compare 6 output              Polarity
    def self.cc6_p=(value : Bool) : Bool
      self.set(cc6_p: value)
      value
    end

    def copy_with(
      *,

      cc1_e : Bool? = nil,

      cc1_p : Bool? = nil,

      cc1_ne : Bool? = nil,

      cc1_np : Bool? = nil,

      cc2_e : Bool? = nil,

      cc2_p : Bool? = nil,

      cc2_ne : Bool? = nil,

      cc2_np : Bool? = nil,

      cc3_e : Bool? = nil,

      cc3_p : Bool? = nil,

      cc3_ne : Bool? = nil,

      cc3_np : Bool? = nil,

      cc4_e : Bool? = nil,

      cc4_p : Bool? = nil,

      cc4_np : Bool? = nil,

      cc5_e : Bool? = nil,

      cc5_p : Bool? = nil,

      cc6_e : Bool? = nil,

      cc6_p : Bool? = nil
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

      unless cc1_ne.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(cc1_ne.to_int).&(0x1_u32) << 2
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

      unless cc2_ne.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(cc2_ne.to_int).&(0x1_u32) << 6
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

      unless cc3_ne.nil?
        value = (value & 0xfffffbff_u32) |
                UInt32.new!(cc3_ne.to_int).&(0x1_u32) << 10
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

      unless cc5_e.nil?
        value = (value & 0xfffeffff_u32) |
                UInt32.new!(cc5_e.to_int).&(0x1_u32) << 16
      end

      unless cc5_p.nil?
        value = (value & 0xfffdffff_u32) |
                UInt32.new!(cc5_p.to_int).&(0x1_u32) << 17
      end

      unless cc6_e.nil?
        value = (value & 0xffefffff_u32) |
                UInt32.new!(cc6_e.to_int).&(0x1_u32) << 20
      end

      unless cc6_p.nil?
        value = (value & 0xffdfffff_u32) |
                UInt32.new!(cc6_p.to_int).&(0x1_u32) << 21
      end

      self.class.new(value)
    end

    def self.set(
      *,
      cc1_e : Bool? = nil,
      cc1_p : Bool? = nil,
      cc1_ne : Bool? = nil,
      cc1_np : Bool? = nil,
      cc2_e : Bool? = nil,
      cc2_p : Bool? = nil,
      cc2_ne : Bool? = nil,
      cc2_np : Bool? = nil,
      cc3_e : Bool? = nil,
      cc3_p : Bool? = nil,
      cc3_ne : Bool? = nil,
      cc3_np : Bool? = nil,
      cc4_e : Bool? = nil,
      cc4_p : Bool? = nil,
      cc4_np : Bool? = nil,
      cc5_e : Bool? = nil,
      cc5_p : Bool? = nil,
      cc6_e : Bool? = nil,
      cc6_p : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        cc1_e: cc1_e,
        cc1_p: cc1_p,
        cc1_ne: cc1_ne,
        cc1_np: cc1_np,
        cc2_e: cc2_e,
        cc2_p: cc2_p,
        cc2_ne: cc2_ne,
        cc2_np: cc2_np,
        cc3_e: cc3_e,
        cc3_p: cc3_p,
        cc3_ne: cc3_ne,
        cc3_np: cc3_np,
        cc4_e: cc4_e,
        cc4_p: cc4_p,
        cc4_np: cc4_np,
        cc5_e: cc5_e,
        cc5_p: cc5_p,
        cc6_e: cc6_e,
        cc6_p: cc6_p,
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

    # counter value
    def cnt : UInt16
      UInt16.new!((@value >> 0) & 0xffff_u32)
    end

    # counter value
    def self.cnt : UInt16
      value.cnt
    end

    # counter value
    def self.cnt=(value : UInt16) : UInt16
      self.set(cnt: value)
      value
    end

    # UIF copy
    def uifcpy : Bool
      @value.bits_set?(0x80000000_u32)
    end

    # UIF copy
    def self.uifcpy : Bool
      value.uifcpy
    end

    def copy_with(
      *,

      cnt : UInt16? = nil
    ) : self
      value = @value

      unless cnt.nil?
        value = (value & 0xffff0000_u32) |
                UInt32.new!(cnt.to_int).&(0xffff_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      cnt : UInt16? = nil
    ) : Nil
      self.value = self.value.copy_with(
        cnt: cnt,
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

    def copy_with(
      *,

      arr : UInt16? = nil
    ) : self
      value = @value

      unless arr.nil?
        value = (value & 0xffff0000_u32) |
                UInt32.new!(arr.to_int).&(0xffff_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      arr : UInt16? = nil
    ) : Nil
      self.value = self.value.copy_with(
        arr: arr,
      )
    end
  end # struct

  # repetition counter register
  struct RCR
    ADDRESS = BASE_ADDRESS + 0x30_u64

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

    # Repetition counter value
    def rep : UInt16
      UInt16.new!((@value >> 0) & 0xffff_u32)
    end

    # Repetition counter value
    def self.rep : UInt16
      value.rep
    end

    # Repetition counter value
    def self.rep=(value : UInt16) : UInt16
      self.set(rep: value)
      value
    end

    def copy_with(
      *,

      rep : UInt16? = nil
    ) : self
      value = @value

      unless rep.nil?
        value = (value & 0xffff0000_u32) |
                UInt32.new!(rep.to_int).&(0xffff_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      rep : UInt16? = nil
    ) : Nil
      self.value = self.value.copy_with(
        rep: rep,
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

    def copy_with(
      *,

      ccr : UInt16? = nil
    ) : self
      value = @value

      unless ccr.nil?
        value = (value & 0xffff0000_u32) |
                UInt32.new!(ccr.to_int).&(0xffff_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      ccr : UInt16? = nil
    ) : Nil
      self.value = self.value.copy_with(
        ccr: ccr,
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

  # break and dead-time register
  struct BDTR
    ADDRESS = BASE_ADDRESS + 0x44_u64

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

    # Dead-time generator setup
    def dtg : UInt8
      UInt8.new!((@value >> 0) & 0xff_u32)
    end

    # Dead-time generator setup
    def self.dtg : UInt8
      value.dtg
    end

    # Dead-time generator setup
    def self.dtg=(value : UInt8) : UInt8
      self.set(dtg: value)
      value
    end

    # Lock configuration
    def lock : UInt8
      UInt8.new!((@value >> 8) & 0x3_u32)
    end

    # Lock configuration
    def self.lock : UInt8
      value.lock
    end

    # Lock configuration
    def self.lock=(value : UInt8) : UInt8
      self.set(lock: value)
      value
    end

    enum OSSI : UInt8
      # When inactive, OC/OCN outputs are disabled
      DISABLED = 0x0_u64

      # When inactive, OC/OCN outputs are forced to idle level
      IDLELEVEL = 0x1_u64

      def self.reset_value : OSSI
        BDTR.reset_value.ossi
      end
    end

    # Off-state selection for Idle              mode
    def ossi : OSSI
      OSSI.new!((@value >> 10) & 0x1_u32)
    end

    # Off-state selection for Idle              mode
    def self.ossi : OSSI
      value.ossi
    end

    # Off-state selection for Idle              mode
    def self.ossi=(value : OSSI) : OSSI
      self.set(ossi: value)
      value
    end

    enum OSSR : UInt8
      # When inactive, OC/OCN outputs are disabled
      DISABLED = 0x0_u64

      # When inactive, OC/OCN outputs are enabled with their inactive level
      IDLELEVEL = 0x1_u64

      def self.reset_value : OSSR
        BDTR.reset_value.ossr
      end
    end

    # Off-state selection for Run              mode
    def ossr : OSSR
      OSSR.new!((@value >> 11) & 0x1_u32)
    end

    # Off-state selection for Run              mode
    def self.ossr : OSSR
      value.ossr
    end

    # Off-state selection for Run              mode
    def self.ossr=(value : OSSR) : OSSR
      self.set(ossr: value)
      value
    end

    # Break enable
    def bke : Bool
      @value.bits_set?(0x1000_u32)
    end

    # Break enable
    def self.bke : Bool
      value.bke
    end

    # Break enable
    def self.bke=(value : Bool) : Bool
      self.set(bke: value)
      value
    end

    # Break polarity
    def bkp : Bool
      @value.bits_set?(0x2000_u32)
    end

    # Break polarity
    def self.bkp : Bool
      value.bkp
    end

    # Break polarity
    def self.bkp=(value : Bool) : Bool
      self.set(bkp: value)
      value
    end

    # Automatic output enable
    def aoe : Bool
      @value.bits_set?(0x4000_u32)
    end

    # Automatic output enable
    def self.aoe : Bool
      value.aoe
    end

    # Automatic output enable
    def self.aoe=(value : Bool) : Bool
      self.set(aoe: value)
      value
    end

    enum MOE : UInt8
      # OC/OCN are disabled or forced idle depending on OSSI
      DISABLEDIDLE = 0x0_u64

      # OC/OCN are enabled if CCxE/CCxNE are set
      ENABLED = 0x1_u64

      def self.reset_value : MOE
        BDTR.reset_value.moe
      end
    end

    # Main output enable
    def moe : MOE
      MOE.new!((@value >> 15) & 0x1_u32)
    end

    # Main output enable
    def self.moe : MOE
      value.moe
    end

    # Main output enable
    def self.moe=(value : MOE) : MOE
      self.set(moe: value)
      value
    end

    # Break filter
    def bkf : UInt8
      UInt8.new!((@value >> 16) & 0xf_u32)
    end

    # Break filter
    def self.bkf : UInt8
      value.bkf
    end

    # Break filter
    def self.bkf=(value : UInt8) : UInt8
      self.set(bkf: value)
      value
    end

    # Break 2 filter
    def bk2_f : UInt8
      UInt8.new!((@value >> 20) & 0xf_u32)
    end

    # Break 2 filter
    def self.bk2_f : UInt8
      value.bk2_f
    end

    # Break 2 filter
    def self.bk2_f=(value : UInt8) : UInt8
      self.set(bk2_f: value)
      value
    end

    # Break 2 enable
    def bk2_e : Bool
      @value.bits_set?(0x1000000_u32)
    end

    # Break 2 enable
    def self.bk2_e : Bool
      value.bk2_e
    end

    # Break 2 enable
    def self.bk2_e=(value : Bool) : Bool
      self.set(bk2_e: value)
      value
    end

    # Break 2 polarity
    def bk2_p : Bool
      @value.bits_set?(0x2000000_u32)
    end

    # Break 2 polarity
    def self.bk2_p : Bool
      value.bk2_p
    end

    # Break 2 polarity
    def self.bk2_p=(value : Bool) : Bool
      self.set(bk2_p: value)
      value
    end

    def copy_with(
      *,

      dtg : UInt8? = nil,

      lock : UInt8? = nil,

      ossi : OSSI? = nil,

      ossr : OSSR? = nil,

      bke : Bool? = nil,

      bkp : Bool? = nil,

      aoe : Bool? = nil,

      moe : MOE? = nil,

      bkf : UInt8? = nil,

      bk2_f : UInt8? = nil,

      bk2_e : Bool? = nil,

      bk2_p : Bool? = nil
    ) : self
      value = @value

      unless dtg.nil?
        value = (value & 0xffffff00_u32) |
                UInt32.new!(dtg.to_int).&(0xff_u32) << 0
      end

      unless lock.nil?
        value = (value & 0xfffffcff_u32) |
                UInt32.new!(lock.to_int).&(0x3_u32) << 8
      end

      unless ossi.nil?
        value = (value & 0xfffffbff_u32) |
                UInt32.new!(ossi.to_int).&(0x1_u32) << 10
      end

      unless ossr.nil?
        value = (value & 0xfffff7ff_u32) |
                UInt32.new!(ossr.to_int).&(0x1_u32) << 11
      end

      unless bke.nil?
        value = (value & 0xffffefff_u32) |
                UInt32.new!(bke.to_int).&(0x1_u32) << 12
      end

      unless bkp.nil?
        value = (value & 0xffffdfff_u32) |
                UInt32.new!(bkp.to_int).&(0x1_u32) << 13
      end

      unless aoe.nil?
        value = (value & 0xffffbfff_u32) |
                UInt32.new!(aoe.to_int).&(0x1_u32) << 14
      end

      unless moe.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(moe.to_int).&(0x1_u32) << 15
      end

      unless bkf.nil?
        value = (value & 0xfff0ffff_u32) |
                UInt32.new!(bkf.to_int).&(0xf_u32) << 16
      end

      unless bk2_f.nil?
        value = (value & 0xff0fffff_u32) |
                UInt32.new!(bk2_f.to_int).&(0xf_u32) << 20
      end

      unless bk2_e.nil?
        value = (value & 0xfeffffff_u32) |
                UInt32.new!(bk2_e.to_int).&(0x1_u32) << 24
      end

      unless bk2_p.nil?
        value = (value & 0xfdffffff_u32) |
                UInt32.new!(bk2_p.to_int).&(0x1_u32) << 25
      end

      self.class.new(value)
    end

    def self.set(
      *,
      dtg : UInt8? = nil,
      lock : UInt8? = nil,
      ossi : OSSI? = nil,
      ossr : OSSR? = nil,
      bke : Bool? = nil,
      bkp : Bool? = nil,
      aoe : Bool? = nil,
      moe : MOE? = nil,
      bkf : UInt8? = nil,
      bk2_f : UInt8? = nil,
      bk2_e : Bool? = nil,
      bk2_p : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        dtg: dtg,
        lock: lock,
        ossi: ossi,
        ossr: ossr,
        bke: bke,
        bkp: bkp,
        aoe: aoe,
        moe: moe,
        bkf: bkf,
        bk2_f: bk2_f,
        bk2_e: bk2_e,
        bk2_p: bk2_p,
      )
    end
  end # struct

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

  # capture/compare mode register 3 (output          mode)
  struct CCMR3_Output
    ADDRESS = BASE_ADDRESS + 0x54_u64

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

    # Output compare 5 fast              enable
    def oc5_fe : Bool
      @value.bits_set?(0x4_u32)
    end

    # Output compare 5 fast              enable
    def self.oc5_fe : Bool
      value.oc5_fe
    end

    # Output compare 5 fast              enable
    def self.oc5_fe=(value : Bool) : Bool
      self.set(oc5_fe: value)
      value
    end

    # Output compare 5 preload              enable
    def oc5_pe : Bool
      @value.bits_set?(0x8_u32)
    end

    # Output compare 5 preload              enable
    def self.oc5_pe : Bool
      value.oc5_pe
    end

    # Output compare 5 preload              enable
    def self.oc5_pe=(value : Bool) : Bool
      self.set(oc5_pe: value)
      value
    end

    enum OC5M : UInt8
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

      def self.reset_value : OC5M
        CCMR3_Output.reset_value.oc5_m
      end
    end

    # Output compare 5 mode
    def oc5_m : OC5M
      OC5M.new!((@value >> 4) & 0x7_u32)
    end

    # Output compare 5 mode
    def self.oc5_m : OC5M
      value.oc5_m
    end

    # Output compare 5 mode
    def self.oc5_m=(value : OC5M) : OC5M
      self.set(oc5_m: value)
      value
    end

    # Output compare 5 clear              enable
    def oc5_ce : Bool
      @value.bits_set?(0x80_u32)
    end

    # Output compare 5 clear              enable
    def self.oc5_ce : Bool
      value.oc5_ce
    end

    # Output compare 5 clear              enable
    def self.oc5_ce=(value : Bool) : Bool
      self.set(oc5_ce: value)
      value
    end

    # Output compare 6 fast              enable
    def oc6_fe : Bool
      @value.bits_set?(0x400_u32)
    end

    # Output compare 6 fast              enable
    def self.oc6_fe : Bool
      value.oc6_fe
    end

    # Output compare 6 fast              enable
    def self.oc6_fe=(value : Bool) : Bool
      self.set(oc6_fe: value)
      value
    end

    # Output compare 6 preload              enable
    def oc6_pe : Bool
      @value.bits_set?(0x800_u32)
    end

    # Output compare 6 preload              enable
    def self.oc6_pe : Bool
      value.oc6_pe
    end

    # Output compare 6 preload              enable
    def self.oc6_pe=(value : Bool) : Bool
      self.set(oc6_pe: value)
      value
    end

    # Output compare 6 mode
    def oc6_m : UInt8
      UInt8.new!((@value >> 12) & 0x7_u32)
    end

    # Output compare 6 mode
    def self.oc6_m : UInt8
      value.oc6_m
    end

    # Output compare 6 mode
    def self.oc6_m=(value : UInt8) : UInt8
      self.set(oc6_m: value)
      value
    end

    # Output compare 6 clear              enable
    def oc6_ce : Bool
      @value.bits_set?(0x8000_u32)
    end

    # Output compare 6 clear              enable
    def self.oc6_ce : Bool
      value.oc6_ce
    end

    # Output compare 6 clear              enable
    def self.oc6_ce=(value : Bool) : Bool
      self.set(oc6_ce: value)
      value
    end

    enum OC5M_3 : UInt8
      # Normal output compare mode (modes 0-7)
      NORMAL = 0x0_u64

      # Extended output compare mode (modes 7-15)
      EXTENDED = 0x1_u64

      def self.reset_value : OC5M_3
        CCMR3_Output.reset_value.oc5_m_3
      end
    end

    # Outout Compare 5 mode bit              3
    def oc5_m_3 : OC5M_3
      OC5M_3.new!((@value >> 16) & 0x1_u32)
    end

    # Outout Compare 5 mode bit              3
    def self.oc5_m_3 : OC5M_3
      value.oc5_m_3
    end

    # Outout Compare 5 mode bit              3
    def self.oc5_m_3=(value : OC5M_3) : OC5M_3
      self.set(oc5_m_3: value)
      value
    end

    # Outout Compare 6 mode bit              3
    def oc6_m_3 : Bool
      @value.bits_set?(0x1000000_u32)
    end

    # Outout Compare 6 mode bit              3
    def self.oc6_m_3 : Bool
      value.oc6_m_3
    end

    # Outout Compare 6 mode bit              3
    def self.oc6_m_3=(value : Bool) : Bool
      self.set(oc6_m_3: value)
      value
    end

    def copy_with(
      *,

      oc5_fe : Bool? = nil,

      oc5_pe : Bool? = nil,

      oc5_m : OC5M? = nil,

      oc5_ce : Bool? = nil,

      oc6_fe : Bool? = nil,

      oc6_pe : Bool? = nil,

      oc6_m : UInt8? = nil,

      oc6_ce : Bool? = nil,

      oc5_m_3 : OC5M_3? = nil,

      oc6_m_3 : Bool? = nil
    ) : self
      value = @value

      unless oc5_fe.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(oc5_fe.to_int).&(0x1_u32) << 2
      end

      unless oc5_pe.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(oc5_pe.to_int).&(0x1_u32) << 3
      end

      unless oc5_m.nil?
        value = (value & 0xffffff8f_u32) |
                UInt32.new!(oc5_m.to_int).&(0x7_u32) << 4
      end

      unless oc5_ce.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(oc5_ce.to_int).&(0x1_u32) << 7
      end

      unless oc6_fe.nil?
        value = (value & 0xfffffbff_u32) |
                UInt32.new!(oc6_fe.to_int).&(0x1_u32) << 10
      end

      unless oc6_pe.nil?
        value = (value & 0xfffff7ff_u32) |
                UInt32.new!(oc6_pe.to_int).&(0x1_u32) << 11
      end

      unless oc6_m.nil?
        value = (value & 0xffff8fff_u32) |
                UInt32.new!(oc6_m.to_int).&(0x7_u32) << 12
      end

      unless oc6_ce.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(oc6_ce.to_int).&(0x1_u32) << 15
      end

      unless oc5_m_3.nil?
        value = (value & 0xfffeffff_u32) |
                UInt32.new!(oc5_m_3.to_int).&(0x1_u32) << 16
      end

      unless oc6_m_3.nil?
        value = (value & 0xfeffffff_u32) |
                UInt32.new!(oc6_m_3.to_int).&(0x1_u32) << 24
      end

      self.class.new(value)
    end

    def self.set(
      *,
      oc5_fe : Bool? = nil,
      oc5_pe : Bool? = nil,
      oc5_m : OC5M? = nil,
      oc5_ce : Bool? = nil,
      oc6_fe : Bool? = nil,
      oc6_pe : Bool? = nil,
      oc6_m : UInt8? = nil,
      oc6_ce : Bool? = nil,
      oc5_m_3 : OC5M_3? = nil,
      oc6_m_3 : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        oc5_fe: oc5_fe,
        oc5_pe: oc5_pe,
        oc5_m: oc5_m,
        oc5_ce: oc5_ce,
        oc6_fe: oc6_fe,
        oc6_pe: oc6_pe,
        oc6_m: oc6_m,
        oc6_ce: oc6_ce,
        oc5_m_3: oc5_m_3,
        oc6_m_3: oc6_m_3,
      )
    end
  end # struct

  # capture/compare register
  struct CCR5
    ADDRESS = BASE_ADDRESS + 0x58_u64

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

    # Group Channel 5 and Channel              1
    def gc5_c1 : Bool
      @value.bits_set?(0x20000000_u32)
    end

    # Group Channel 5 and Channel              1
    def self.gc5_c1 : Bool
      value.gc5_c1
    end

    # Group Channel 5 and Channel              1
    def self.gc5_c1=(value : Bool) : Bool
      self.set(gc5_c1: value)
      value
    end

    # Group Channel 5 and Channel              2
    def gc5_c2 : Bool
      @value.bits_set?(0x40000000_u32)
    end

    # Group Channel 5 and Channel              2
    def self.gc5_c2 : Bool
      value.gc5_c2
    end

    # Group Channel 5 and Channel              2
    def self.gc5_c2=(value : Bool) : Bool
      self.set(gc5_c2: value)
      value
    end

    # Group Channel 5 and Channel              3
    def gc5_c3 : Bool
      @value.bits_set?(0x80000000_u32)
    end

    # Group Channel 5 and Channel              3
    def self.gc5_c3 : Bool
      value.gc5_c3
    end

    # Group Channel 5 and Channel              3
    def self.gc5_c3=(value : Bool) : Bool
      self.set(gc5_c3: value)
      value
    end

    def copy_with(
      *,

      ccr : UInt16? = nil,

      gc5_c1 : Bool? = nil,

      gc5_c2 : Bool? = nil,

      gc5_c3 : Bool? = nil
    ) : self
      value = @value

      unless ccr.nil?
        value = (value & 0xffff0000_u32) |
                UInt32.new!(ccr.to_int).&(0xffff_u32) << 0
      end

      unless gc5_c1.nil?
        value = (value & 0xdfffffff_u32) |
                UInt32.new!(gc5_c1.to_int).&(0x1_u32) << 29
      end

      unless gc5_c2.nil?
        value = (value & 0xbfffffff_u32) |
                UInt32.new!(gc5_c2.to_int).&(0x1_u32) << 30
      end

      unless gc5_c3.nil?
        value = (value & 0x7fffffff_u32) |
                UInt32.new!(gc5_c3.to_int).&(0x1_u32) << 31
      end

      self.class.new(value)
    end

    def self.set(
      *,
      ccr : UInt16? = nil,
      gc5_c1 : Bool? = nil,
      gc5_c2 : Bool? = nil,
      gc5_c3 : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        ccr: ccr,
        gc5_c1: gc5_c1,
        gc5_c2: gc5_c2,
        gc5_c3: gc5_c3,
      )
    end
  end # struct

  # capture/compare register
  struct CCR6
    ADDRESS = BASE_ADDRESS + 0x5c_u64

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

    def copy_with(
      *,

      ccr : UInt16? = nil
    ) : self
      value = @value

      unless ccr.nil?
        value = (value & 0xffff0000_u32) |
                UInt32.new!(ccr.to_int).&(0xffff_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      ccr : UInt16? = nil
    ) : Nil
      self.value = self.value.copy_with(
        ccr: ccr,
      )
    end
  end # struct

  # option registers
  struct OR
    ADDRESS = BASE_ADDRESS + 0x60_u64

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

    # TIM1_ETR_ADC1 remapping              capability
    def etr_adc1_rmp : UInt8
      UInt8.new!((@value >> 0) & 0x3_u32)
    end

    # TIM1_ETR_ADC1 remapping              capability
    def self.etr_adc1_rmp : UInt8
      value.etr_adc1_rmp
    end

    # TIM1_ETR_ADC1 remapping              capability
    def self.etr_adc1_rmp=(value : UInt8) : UInt8
      self.set(etr_adc1_rmp: value)
      value
    end

    # TIM1_ETR_ADC4 remapping              capability
    def etr_adc4_rmp : UInt8
      UInt8.new!((@value >> 2) & 0x3_u32)
    end

    # TIM1_ETR_ADC4 remapping              capability
    def self.etr_adc4_rmp : UInt8
      value.etr_adc4_rmp
    end

    # TIM1_ETR_ADC4 remapping              capability
    def self.etr_adc4_rmp=(value : UInt8) : UInt8
      self.set(etr_adc4_rmp: value)
      value
    end

    def copy_with(
      *,

      etr_adc1_rmp : UInt8? = nil,

      etr_adc4_rmp : UInt8? = nil
    ) : self
      value = @value

      unless etr_adc1_rmp.nil?
        value = (value & 0xfffffffc_u32) |
                UInt32.new!(etr_adc1_rmp.to_int).&(0x3_u32) << 0
      end

      unless etr_adc4_rmp.nil?
        value = (value & 0xfffffff3_u32) |
                UInt32.new!(etr_adc4_rmp.to_int).&(0x3_u32) << 2
      end

      self.class.new(value)
    end

    def self.set(
      *,
      etr_adc1_rmp : UInt8? = nil,
      etr_adc4_rmp : UInt8? = nil
    ) : Nil
      self.value = self.value.copy_with(
        etr_adc1_rmp: etr_adc1_rmp,
        etr_adc4_rmp: etr_adc4_rmp,
      )
    end
  end # struct

end
