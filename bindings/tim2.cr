# General purpose timers
module TIM2
  VERSION      = nil
  BASE_ADDRESS = 0x40000000_u64

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

    # Clock division
    def ckd : UInt8
      UInt8.new!((@value >> 8) & 0x3_u32)
    end

    # Clock division
    def self.ckd : UInt8
      value.ckd
    end

    # Clock division
    def self.ckd=(value : UInt8) : UInt8
      self.set(ckd: value)
      value
    end

    # Auto-reload preload enable
    def arpe : Bool
      @value.bits_set?(0x80_u32)
    end

    # Auto-reload preload enable
    def self.arpe : Bool
      value.arpe
    end

    # Auto-reload preload enable
    def self.arpe=(value : Bool) : Bool
      self.set(arpe: value)
      value
    end

    # Center-aligned mode              selection
    def cms : UInt8
      UInt8.new!((@value >> 5) & 0x3_u32)
    end

    # Center-aligned mode              selection
    def self.cms : UInt8
      value.cms
    end

    # Center-aligned mode              selection
    def self.cms=(value : UInt8) : UInt8
      self.set(cms: value)
      value
    end

    # Direction
    def dir : Bool
      @value.bits_set?(0x10_u32)
    end

    # Direction
    def self.dir : Bool
      value.dir
    end

    # Direction
    def self.dir=(value : Bool) : Bool
      self.set(dir: value)
      value
    end

    # One-pulse mode
    def opm : Bool
      @value.bits_set?(0x8_u32)
    end

    # One-pulse mode
    def self.opm : Bool
      value.opm
    end

    # One-pulse mode
    def self.opm=(value : Bool) : Bool
      self.set(opm: value)
      value
    end

    # Update request source
    def urs : Bool
      @value.bits_set?(0x4_u32)
    end

    # Update request source
    def self.urs : Bool
      value.urs
    end

    # Update request source
    def self.urs=(value : Bool) : Bool
      self.set(urs: value)
      value
    end

    # Update disable
    def udis : Bool
      @value.bits_set?(0x2_u32)
    end

    # Update disable
    def self.udis : Bool
      value.udis
    end

    # Update disable
    def self.udis=(value : Bool) : Bool
      self.set(udis: value)
      value
    end

    # Counter enable
    def cen : Bool
      @value.bits_set?(0x1_u32)
    end

    # Counter enable
    def self.cen : Bool
      value.cen
    end

    # Counter enable
    def self.cen=(value : Bool) : Bool
      self.set(cen: value)
      value
    end

    def copy_with(
      *,

      ckd : UInt8? = nil,

      arpe : Bool? = nil,

      cms : UInt8? = nil,

      dir : Bool? = nil,

      opm : Bool? = nil,

      urs : Bool? = nil,

      udis : Bool? = nil,

      cen : Bool? = nil
    ) : self
      value = @value

      unless ckd.nil?
        value = (value & 0xfffffcff_u32) |
                UInt32.new!(ckd.to_int).&(0x3_u32) << 8
      end

      unless arpe.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(arpe.to_int).&(0x1_u32) << 7
      end

      unless cms.nil?
        value = (value & 0xffffff9f_u32) |
                UInt32.new!(cms.to_int).&(0x3_u32) << 5
      end

      unless dir.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(dir.to_int).&(0x1_u32) << 4
      end

      unless opm.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(opm.to_int).&(0x1_u32) << 3
      end

      unless urs.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(urs.to_int).&(0x1_u32) << 2
      end

      unless udis.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(udis.to_int).&(0x1_u32) << 1
      end

      unless cen.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(cen.to_int).&(0x1_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      ckd : UInt8? = nil,
      arpe : Bool? = nil,
      cms : UInt8? = nil,
      dir : Bool? = nil,
      opm : Bool? = nil,
      urs : Bool? = nil,
      udis : Bool? = nil,
      cen : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        ckd: ckd,
        arpe: arpe,
        cms: cms,
        dir: dir,
        opm: opm,
        urs: urs,
        udis: udis,
        cen: cen,
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

    # TI1 selection
    def ti1_s : Bool
      @value.bits_set?(0x80_u32)
    end

    # TI1 selection
    def self.ti1_s : Bool
      value.ti1_s
    end

    # TI1 selection
    def self.ti1_s=(value : Bool) : Bool
      self.set(ti1_s: value)
      value
    end

    # Master mode selection
    def mms : UInt8
      UInt8.new!((@value >> 4) & 0x7_u32)
    end

    # Master mode selection
    def self.mms : UInt8
      value.mms
    end

    # Master mode selection
    def self.mms=(value : UInt8) : UInt8
      self.set(mms: value)
      value
    end

    # Capture/compare DMA              selection
    def ccds : Bool
      @value.bits_set?(0x8_u32)
    end

    # Capture/compare DMA              selection
    def self.ccds : Bool
      value.ccds
    end

    # Capture/compare DMA              selection
    def self.ccds=(value : Bool) : Bool
      self.set(ccds: value)
      value
    end

    def copy_with(
      *,

      ti1_s : Bool? = nil,

      mms : UInt8? = nil,

      ccds : Bool? = nil
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
      ti1_s : Bool? = nil,
      mms : UInt8? = nil,
      ccds : Bool? = nil
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

    # External trigger polarity
    def etp : Bool
      @value.bits_set?(0x8000_u32)
    end

    # External trigger polarity
    def self.etp : Bool
      value.etp
    end

    # External trigger polarity
    def self.etp=(value : Bool) : Bool
      self.set(etp: value)
      value
    end

    # External clock enable
    def ece : Bool
      @value.bits_set?(0x4000_u32)
    end

    # External clock enable
    def self.ece : Bool
      value.ece
    end

    # External clock enable
    def self.ece=(value : Bool) : Bool
      self.set(ece: value)
      value
    end

    # External trigger prescaler
    def etps : UInt8
      UInt8.new!((@value >> 12) & 0x3_u32)
    end

    # External trigger prescaler
    def self.etps : UInt8
      value.etps
    end

    # External trigger prescaler
    def self.etps=(value : UInt8) : UInt8
      self.set(etps: value)
      value
    end

    # External trigger filter
    def etf : UInt8
      UInt8.new!((@value >> 8) & 0xf_u32)
    end

    # External trigger filter
    def self.etf : UInt8
      value.etf
    end

    # External trigger filter
    def self.etf=(value : UInt8) : UInt8
      self.set(etf: value)
      value
    end

    # Master/Slave mode
    def msm : Bool
      @value.bits_set?(0x80_u32)
    end

    # Master/Slave mode
    def self.msm : Bool
      value.msm
    end

    # Master/Slave mode
    def self.msm=(value : Bool) : Bool
      self.set(msm: value)
      value
    end

    # Trigger selection
    def ts : UInt8
      UInt8.new!((@value >> 4) & 0x7_u32)
    end

    # Trigger selection
    def self.ts : UInt8
      value.ts
    end

    # Trigger selection
    def self.ts=(value : UInt8) : UInt8
      self.set(ts: value)
      value
    end

    # Slave mode selection
    def sms : UInt8
      UInt8.new!((@value >> 0) & 0x7_u32)
    end

    # Slave mode selection
    def self.sms : UInt8
      value.sms
    end

    # Slave mode selection
    def self.sms=(value : UInt8) : UInt8
      self.set(sms: value)
      value
    end

    def copy_with(
      *,

      etp : Bool? = nil,

      ece : Bool? = nil,

      etps : UInt8? = nil,

      etf : UInt8? = nil,

      msm : Bool? = nil,

      ts : UInt8? = nil,

      sms : UInt8? = nil
    ) : self
      value = @value

      unless etp.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(etp.to_int).&(0x1_u32) << 15
      end

      unless ece.nil?
        value = (value & 0xffffbfff_u32) |
                UInt32.new!(ece.to_int).&(0x1_u32) << 14
      end

      unless etps.nil?
        value = (value & 0xffffcfff_u32) |
                UInt32.new!(etps.to_int).&(0x3_u32) << 12
      end

      unless etf.nil?
        value = (value & 0xfffff0ff_u32) |
                UInt32.new!(etf.to_int).&(0xf_u32) << 8
      end

      unless msm.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(msm.to_int).&(0x1_u32) << 7
      end

      unless ts.nil?
        value = (value & 0xffffff8f_u32) |
                UInt32.new!(ts.to_int).&(0x7_u32) << 4
      end

      unless sms.nil?
        value = (value & 0xfffffff8_u32) |
                UInt32.new!(sms.to_int).&(0x7_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      etp : Bool? = nil,
      ece : Bool? = nil,
      etps : UInt8? = nil,
      etf : UInt8? = nil,
      msm : Bool? = nil,
      ts : UInt8? = nil,
      sms : UInt8? = nil
    ) : Nil
      self.value = self.value.copy_with(
        etp: etp,
        ece: ece,
        etps: etps,
        etf: etf,
        msm: msm,
        ts: ts,
        sms: sms,
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

    # Trigger DMA request enable
    def tde : Bool
      @value.bits_set?(0x4000_u32)
    end

    # Trigger DMA request enable
    def self.tde : Bool
      value.tde
    end

    # Trigger DMA request enable
    def self.tde=(value : Bool) : Bool
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

    # Capture/Compare 1 DMA request              enable
    def cc1_de : Bool
      @value.bits_set?(0x200_u32)
    end

    # Capture/Compare 1 DMA request              enable
    def self.cc1_de : Bool
      value.cc1_de
    end

    # Capture/Compare 1 DMA request              enable
    def self.cc1_de=(value : Bool) : Bool
      self.set(cc1_de: value)
      value
    end

    # Update DMA request enable
    def ude : Bool
      @value.bits_set?(0x100_u32)
    end

    # Update DMA request enable
    def self.ude : Bool
      value.ude
    end

    # Update DMA request enable
    def self.ude=(value : Bool) : Bool
      self.set(ude: value)
      value
    end

    # Trigger interrupt enable
    def tie : Bool
      @value.bits_set?(0x40_u32)
    end

    # Trigger interrupt enable
    def self.tie : Bool
      value.tie
    end

    # Trigger interrupt enable
    def self.tie=(value : Bool) : Bool
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

    # Capture/Compare 1 interrupt              enable
    def cc1_ie : Bool
      @value.bits_set?(0x2_u32)
    end

    # Capture/Compare 1 interrupt              enable
    def self.cc1_ie : Bool
      value.cc1_ie
    end

    # Capture/Compare 1 interrupt              enable
    def self.cc1_ie=(value : Bool) : Bool
      self.set(cc1_ie: value)
      value
    end

    # Update interrupt enable
    def uie : Bool
      @value.bits_set?(0x1_u32)
    end

    # Update interrupt enable
    def self.uie : Bool
      value.uie
    end

    # Update interrupt enable
    def self.uie=(value : Bool) : Bool
      self.set(uie: value)
      value
    end

    def copy_with(
      *,

      tde : Bool? = nil,

      cc4_de : Bool? = nil,

      cc3_de : Bool? = nil,

      cc2_de : Bool? = nil,

      cc1_de : Bool? = nil,

      ude : Bool? = nil,

      tie : Bool? = nil,

      cc4_ie : Bool? = nil,

      cc3_ie : Bool? = nil,

      cc2_ie : Bool? = nil,

      cc1_ie : Bool? = nil,

      uie : Bool? = nil
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
      tde : Bool? = nil,
      cc4_de : Bool? = nil,
      cc3_de : Bool? = nil,
      cc2_de : Bool? = nil,
      cc1_de : Bool? = nil,
      ude : Bool? = nil,
      tie : Bool? = nil,
      cc4_ie : Bool? = nil,
      cc3_ie : Bool? = nil,
      cc2_ie : Bool? = nil,
      cc1_ie : Bool? = nil,
      uie : Bool? = nil
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

    # Capture/Compare 1 overcapture              flag
    def cc1_of : Bool
      @value.bits_set?(0x200_u32)
    end

    # Capture/Compare 1 overcapture              flag
    def self.cc1_of : Bool
      value.cc1_of
    end

    # Capture/Compare 1 overcapture              flag
    def self.cc1_of=(value : Bool) : Bool
      self.set(cc1_of: value)
      value
    end

    # Trigger interrupt flag
    def tif : Bool
      @value.bits_set?(0x40_u32)
    end

    # Trigger interrupt flag
    def self.tif : Bool
      value.tif
    end

    # Trigger interrupt flag
    def self.tif=(value : Bool) : Bool
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

    # Capture/compare 1 interrupt              flag
    def cc1_if : Bool
      @value.bits_set?(0x2_u32)
    end

    # Capture/compare 1 interrupt              flag
    def self.cc1_if : Bool
      value.cc1_if
    end

    # Capture/compare 1 interrupt              flag
    def self.cc1_if=(value : Bool) : Bool
      self.set(cc1_if: value)
      value
    end

    # Update interrupt flag
    def uif : Bool
      @value.bits_set?(0x1_u32)
    end

    # Update interrupt flag
    def self.uif : Bool
      value.uif
    end

    # Update interrupt flag
    def self.uif=(value : Bool) : Bool
      self.set(uif: value)
      value
    end

    def copy_with(
      *,

      cc4_of : Bool? = nil,

      cc3_of : Bool? = nil,

      cc2_of : Bool? = nil,

      cc1_of : Bool? = nil,

      tif : Bool? = nil,

      cc4_if : Bool? = nil,

      cc3_if : Bool? = nil,

      cc2_if : Bool? = nil,

      cc1_if : Bool? = nil,

      uif : Bool? = nil
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
      cc1_of : Bool? = nil,
      tif : Bool? = nil,
      cc4_if : Bool? = nil,
      cc3_if : Bool? = nil,
      cc2_if : Bool? = nil,
      cc1_if : Bool? = nil,
      uif : Bool? = nil
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

    # Trigger generation
    def self.tg=(value : Bool) : Bool
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

    # Capture/compare 1              generation
    def self.cc1_g=(value : Bool) : Bool
      self.set(cc1_g: value)
      value
    end

    # Update generation
    def self.ug=(value : Bool) : Bool
      self.set(ug: value)
      value
    end

    def copy_with(
      *,

      tg : Bool? = nil,

      cc4_g : Bool? = nil,

      cc3_g : Bool? = nil,

      cc2_g : Bool? = nil,

      cc1_g : Bool? = nil,

      ug : Bool? = nil
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
      tg : Bool? = nil,
      cc4_g : Bool? = nil,
      cc3_g : Bool? = nil,
      cc2_g : Bool? = nil,
      cc1_g : Bool? = nil,
      ug : Bool? = nil
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

    # OC2CE
    def oc2_ce : Bool
      @value.bits_set?(0x8000_u32)
    end

    # OC2CE
    def self.oc2_ce : Bool
      value.oc2_ce
    end

    # OC2CE
    def self.oc2_ce=(value : Bool) : Bool
      self.set(oc2_ce: value)
      value
    end

    # OC2M
    def oc2_m : UInt8
      UInt8.new!((@value >> 12) & 0x7_u32)
    end

    # OC2M
    def self.oc2_m : UInt8
      value.oc2_m
    end

    # OC2M
    def self.oc2_m=(value : UInt8) : UInt8
      self.set(oc2_m: value)
      value
    end

    # OC2PE
    def oc2_pe : Bool
      @value.bits_set?(0x800_u32)
    end

    # OC2PE
    def self.oc2_pe : Bool
      value.oc2_pe
    end

    # OC2PE
    def self.oc2_pe=(value : Bool) : Bool
      self.set(oc2_pe: value)
      value
    end

    # OC2FE
    def oc2_fe : Bool
      @value.bits_set?(0x400_u32)
    end

    # OC2FE
    def self.oc2_fe : Bool
      value.oc2_fe
    end

    # OC2FE
    def self.oc2_fe=(value : Bool) : Bool
      self.set(oc2_fe: value)
      value
    end

    # CC2S
    def cc2_s : UInt8
      UInt8.new!((@value >> 8) & 0x3_u32)
    end

    # CC2S
    def self.cc2_s : UInt8
      value.cc2_s
    end

    # CC2S
    def self.cc2_s=(value : UInt8) : UInt8
      self.set(cc2_s: value)
      value
    end

    # OC1CE
    def oc1_ce : Bool
      @value.bits_set?(0x80_u32)
    end

    # OC1CE
    def self.oc1_ce : Bool
      value.oc1_ce
    end

    # OC1CE
    def self.oc1_ce=(value : Bool) : Bool
      self.set(oc1_ce: value)
      value
    end

    # OC1M
    def oc1_m : UInt8
      UInt8.new!((@value >> 4) & 0x7_u32)
    end

    # OC1M
    def self.oc1_m : UInt8
      value.oc1_m
    end

    # OC1M
    def self.oc1_m=(value : UInt8) : UInt8
      self.set(oc1_m: value)
      value
    end

    # OC1PE
    def oc1_pe : Bool
      @value.bits_set?(0x8_u32)
    end

    # OC1PE
    def self.oc1_pe : Bool
      value.oc1_pe
    end

    # OC1PE
    def self.oc1_pe=(value : Bool) : Bool
      self.set(oc1_pe: value)
      value
    end

    # OC1FE
    def oc1_fe : Bool
      @value.bits_set?(0x4_u32)
    end

    # OC1FE
    def self.oc1_fe : Bool
      value.oc1_fe
    end

    # OC1FE
    def self.oc1_fe=(value : Bool) : Bool
      self.set(oc1_fe: value)
      value
    end

    # CC1S
    def cc1_s : UInt8
      UInt8.new!((@value >> 0) & 0x3_u32)
    end

    # CC1S
    def self.cc1_s : UInt8
      value.cc1_s
    end

    # CC1S
    def self.cc1_s=(value : UInt8) : UInt8
      self.set(cc1_s: value)
      value
    end

    def copy_with(
      *,

      oc2_ce : Bool? = nil,

      oc2_m : UInt8? = nil,

      oc2_pe : Bool? = nil,

      oc2_fe : Bool? = nil,

      cc2_s : UInt8? = nil,

      oc1_ce : Bool? = nil,

      oc1_m : UInt8? = nil,

      oc1_pe : Bool? = nil,

      oc1_fe : Bool? = nil,

      cc1_s : UInt8? = nil
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

      self.class.new(value)
    end

    def self.set(
      *,
      oc2_ce : Bool? = nil,
      oc2_m : UInt8? = nil,
      oc2_pe : Bool? = nil,
      oc2_fe : Bool? = nil,
      cc2_s : UInt8? = nil,
      oc1_ce : Bool? = nil,
      oc1_m : UInt8? = nil,
      oc1_pe : Bool? = nil,
      oc1_fe : Bool? = nil,
      cc1_s : UInt8? = nil
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
    def ic2_pcs : UInt8
      UInt8.new!((@value >> 10) & 0x3_u32)
    end

    # Input capture 2 prescaler
    def self.ic2_pcs : UInt8
      value.ic2_pcs
    end

    # Input capture 2 prescaler
    def self.ic2_pcs=(value : UInt8) : UInt8
      self.set(ic2_pcs: value)
      value
    end

    # Capture/Compare 2              selection
    def cc2_s : UInt8
      UInt8.new!((@value >> 8) & 0x3_u32)
    end

    # Capture/Compare 2              selection
    def self.cc2_s : UInt8
      value.cc2_s
    end

    # Capture/Compare 2              selection
    def self.cc2_s=(value : UInt8) : UInt8
      self.set(cc2_s: value)
      value
    end

    # Input capture 1 filter
    def ic1_f : UInt8
      UInt8.new!((@value >> 4) & 0xf_u32)
    end

    # Input capture 1 filter
    def self.ic1_f : UInt8
      value.ic1_f
    end

    # Input capture 1 filter
    def self.ic1_f=(value : UInt8) : UInt8
      self.set(ic1_f: value)
      value
    end

    # Input capture 1 prescaler
    def icpcs : UInt8
      UInt8.new!((@value >> 2) & 0x3_u32)
    end

    # Input capture 1 prescaler
    def self.icpcs : UInt8
      value.icpcs
    end

    # Input capture 1 prescaler
    def self.icpcs=(value : UInt8) : UInt8
      self.set(icpcs: value)
      value
    end

    # Capture/Compare 1              selection
    def cc1_s : UInt8
      UInt8.new!((@value >> 0) & 0x3_u32)
    end

    # Capture/Compare 1              selection
    def self.cc1_s : UInt8
      value.cc1_s
    end

    # Capture/Compare 1              selection
    def self.cc1_s=(value : UInt8) : UInt8
      self.set(cc1_s: value)
      value
    end

    def copy_with(
      *,

      ic2_f : UInt8? = nil,

      ic2_pcs : UInt8? = nil,

      cc2_s : UInt8? = nil,

      ic1_f : UInt8? = nil,

      icpcs : UInt8? = nil,

      cc1_s : UInt8? = nil
    ) : self
      value = @value

      unless ic2_f.nil?
        value = (value & 0xffff0fff_u32) |
                UInt32.new!(ic2_f.to_int).&(0xf_u32) << 12
      end

      unless ic2_pcs.nil?
        value = (value & 0xfffff3ff_u32) |
                UInt32.new!(ic2_pcs.to_int).&(0x3_u32) << 10
      end

      unless cc2_s.nil?
        value = (value & 0xfffffcff_u32) |
                UInt32.new!(cc2_s.to_int).&(0x3_u32) << 8
      end

      unless ic1_f.nil?
        value = (value & 0xffffff0f_u32) |
                UInt32.new!(ic1_f.to_int).&(0xf_u32) << 4
      end

      unless icpcs.nil?
        value = (value & 0xfffffff3_u32) |
                UInt32.new!(icpcs.to_int).&(0x3_u32) << 2
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
      ic2_pcs : UInt8? = nil,
      cc2_s : UInt8? = nil,
      ic1_f : UInt8? = nil,
      icpcs : UInt8? = nil,
      cc1_s : UInt8? = nil
    ) : Nil
      self.value = self.value.copy_with(
        ic2_f: ic2_f,
        ic2_pcs: ic2_pcs,
        cc2_s: cc2_s,
        ic1_f: ic1_f,
        icpcs: icpcs,
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

    # O24CE
    def o24_ce : Bool
      @value.bits_set?(0x8000_u32)
    end

    # O24CE
    def self.o24_ce : Bool
      value.o24_ce
    end

    # O24CE
    def self.o24_ce=(value : Bool) : Bool
      self.set(o24_ce: value)
      value
    end

    # OC4M
    def oc4_m : UInt8
      UInt8.new!((@value >> 12) & 0x7_u32)
    end

    # OC4M
    def self.oc4_m : UInt8
      value.oc4_m
    end

    # OC4M
    def self.oc4_m=(value : UInt8) : UInt8
      self.set(oc4_m: value)
      value
    end

    # OC4PE
    def oc4_pe : Bool
      @value.bits_set?(0x800_u32)
    end

    # OC4PE
    def self.oc4_pe : Bool
      value.oc4_pe
    end

    # OC4PE
    def self.oc4_pe=(value : Bool) : Bool
      self.set(oc4_pe: value)
      value
    end

    # OC4FE
    def oc4_fe : Bool
      @value.bits_set?(0x400_u32)
    end

    # OC4FE
    def self.oc4_fe : Bool
      value.oc4_fe
    end

    # OC4FE
    def self.oc4_fe=(value : Bool) : Bool
      self.set(oc4_fe: value)
      value
    end

    # CC4S
    def cc4_s : UInt8
      UInt8.new!((@value >> 8) & 0x3_u32)
    end

    # CC4S
    def self.cc4_s : UInt8
      value.cc4_s
    end

    # CC4S
    def self.cc4_s=(value : UInt8) : UInt8
      self.set(cc4_s: value)
      value
    end

    # OC3CE
    def oc3_ce : Bool
      @value.bits_set?(0x80_u32)
    end

    # OC3CE
    def self.oc3_ce : Bool
      value.oc3_ce
    end

    # OC3CE
    def self.oc3_ce=(value : Bool) : Bool
      self.set(oc3_ce: value)
      value
    end

    # OC3M
    def oc3_m : UInt8
      UInt8.new!((@value >> 4) & 0x7_u32)
    end

    # OC3M
    def self.oc3_m : UInt8
      value.oc3_m
    end

    # OC3M
    def self.oc3_m=(value : UInt8) : UInt8
      self.set(oc3_m: value)
      value
    end

    # OC3PE
    def oc3_pe : Bool
      @value.bits_set?(0x8_u32)
    end

    # OC3PE
    def self.oc3_pe : Bool
      value.oc3_pe
    end

    # OC3PE
    def self.oc3_pe=(value : Bool) : Bool
      self.set(oc3_pe: value)
      value
    end

    # OC3FE
    def oc3_fe : Bool
      @value.bits_set?(0x4_u32)
    end

    # OC3FE
    def self.oc3_fe : Bool
      value.oc3_fe
    end

    # OC3FE
    def self.oc3_fe=(value : Bool) : Bool
      self.set(oc3_fe: value)
      value
    end

    # CC3S
    def cc3_s : UInt8
      UInt8.new!((@value >> 0) & 0x3_u32)
    end

    # CC3S
    def self.cc3_s : UInt8
      value.cc3_s
    end

    # CC3S
    def self.cc3_s=(value : UInt8) : UInt8
      self.set(cc3_s: value)
      value
    end

    def copy_with(
      *,

      o24_ce : Bool? = nil,

      oc4_m : UInt8? = nil,

      oc4_pe : Bool? = nil,

      oc4_fe : Bool? = nil,

      cc4_s : UInt8? = nil,

      oc3_ce : Bool? = nil,

      oc3_m : UInt8? = nil,

      oc3_pe : Bool? = nil,

      oc3_fe : Bool? = nil,

      cc3_s : UInt8? = nil
    ) : self
      value = @value

      unless o24_ce.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(o24_ce.to_int).&(0x1_u32) << 15
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

      self.class.new(value)
    end

    def self.set(
      *,
      o24_ce : Bool? = nil,
      oc4_m : UInt8? = nil,
      oc4_pe : Bool? = nil,
      oc4_fe : Bool? = nil,
      cc4_s : UInt8? = nil,
      oc3_ce : Bool? = nil,
      oc3_m : UInt8? = nil,
      oc3_pe : Bool? = nil,
      oc3_fe : Bool? = nil,
      cc3_s : UInt8? = nil
    ) : Nil
      self.value = self.value.copy_with(
        o24_ce: o24_ce,
        oc4_m: oc4_m,
        oc4_pe: oc4_pe,
        oc4_fe: oc4_fe,
        cc4_s: cc4_s,
        oc3_ce: oc3_ce,
        oc3_m: oc3_m,
        oc3_pe: oc3_pe,
        oc3_fe: oc3_fe,
        cc3_s: cc3_s,
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

    # Capture/Compare 4              selection
    def cc4_s : UInt8
      UInt8.new!((@value >> 8) & 0x3_u32)
    end

    # Capture/Compare 4              selection
    def self.cc4_s : UInt8
      value.cc4_s
    end

    # Capture/Compare 4              selection
    def self.cc4_s=(value : UInt8) : UInt8
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

    # Capture/compare 3              selection
    def cc3_s : UInt8
      UInt8.new!((@value >> 0) & 0x3_u32)
    end

    # Capture/compare 3              selection
    def self.cc3_s : UInt8
      value.cc3_s
    end

    # Capture/compare 3              selection
    def self.cc3_s=(value : UInt8) : UInt8
      self.set(cc3_s: value)
      value
    end

    def copy_with(
      *,

      ic4_f : UInt8? = nil,

      ic4_psc : UInt8? = nil,

      cc4_s : UInt8? = nil,

      ic3_f : UInt8? = nil,

      ic3_psc : UInt8? = nil,

      cc3_s : UInt8? = nil
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
      cc4_s : UInt8? = nil,
      ic3_f : UInt8? = nil,
      ic3_psc : UInt8? = nil,
      cc3_s : UInt8? = nil
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

    def copy_with(
      *,

      cc4_np : Bool? = nil,

      cc4_p : Bool? = nil,

      cc4_e : Bool? = nil,

      cc3_np : Bool? = nil,

      cc3_p : Bool? = nil,

      cc3_e : Bool? = nil,

      cc2_np : Bool? = nil,

      cc2_p : Bool? = nil,

      cc2_e : Bool? = nil,

      cc1_np : Bool? = nil,

      cc1_p : Bool? = nil,

      cc1_e : Bool? = nil
    ) : self
      value = @value

      unless cc4_np.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(cc4_np.to_int).&(0x1_u32) << 15
      end

      unless cc4_p.nil?
        value = (value & 0xffffdfff_u32) |
                UInt32.new!(cc4_p.to_int).&(0x1_u32) << 13
      end

      unless cc4_e.nil?
        value = (value & 0xffffefff_u32) |
                UInt32.new!(cc4_e.to_int).&(0x1_u32) << 12
      end

      unless cc3_np.nil?
        value = (value & 0xfffff7ff_u32) |
                UInt32.new!(cc3_np.to_int).&(0x1_u32) << 11
      end

      unless cc3_p.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(cc3_p.to_int).&(0x1_u32) << 9
      end

      unless cc3_e.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(cc3_e.to_int).&(0x1_u32) << 8
      end

      unless cc2_np.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(cc2_np.to_int).&(0x1_u32) << 7
      end

      unless cc2_p.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(cc2_p.to_int).&(0x1_u32) << 5
      end

      unless cc2_e.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(cc2_e.to_int).&(0x1_u32) << 4
      end

      unless cc1_np.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(cc1_np.to_int).&(0x1_u32) << 3
      end

      unless cc1_p.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(cc1_p.to_int).&(0x1_u32) << 1
      end

      unless cc1_e.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(cc1_e.to_int).&(0x1_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      cc4_np : Bool? = nil,
      cc4_p : Bool? = nil,
      cc4_e : Bool? = nil,
      cc3_np : Bool? = nil,
      cc3_p : Bool? = nil,
      cc3_e : Bool? = nil,
      cc2_np : Bool? = nil,
      cc2_p : Bool? = nil,
      cc2_e : Bool? = nil,
      cc1_np : Bool? = nil,
      cc1_p : Bool? = nil,
      cc1_e : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        cc4_np: cc4_np,
        cc4_p: cc4_p,
        cc4_e: cc4_e,
        cc3_np: cc3_np,
        cc3_p: cc3_p,
        cc3_e: cc3_e,
        cc2_np: cc2_np,
        cc2_p: cc2_p,
        cc2_e: cc2_e,
        cc1_np: cc1_np,
        cc1_p: cc1_p,
        cc1_e: cc1_e,
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

    # High counter value
    def h : UInt16
      UInt16.new!((@value >> 16) & 0xffff_u32)
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

    # Low counter value
    def l : UInt16
      UInt16.new!((@value >> 0) & 0xffff_u32)
    end

    # Low counter value
    def self.l : UInt16
      value.l
    end

    # Low counter value
    def self.l=(value : UInt16) : UInt16
      self.set(l: value)
      value
    end

    def copy_with(
      *,

      h : UInt16? = nil,

      l : UInt16? = nil
    ) : self
      value = @value

      unless h.nil?
        value = (value & 0xffff_u32) |
                UInt32.new!(h.to_int).&(0xffff_u32) << 16
      end

      unless l.nil?
        value = (value & 0xffff0000_u32) |
                UInt32.new!(l.to_int).&(0xffff_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      h : UInt16? = nil,
      l : UInt16? = nil
    ) : Nil
      self.value = self.value.copy_with(
        h: h,
        l: l,
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

    # Low Auto-reload value
    def l : UInt16
      UInt16.new!((@value >> 0) & 0xffff_u32)
    end

    # Low Auto-reload value
    def self.l : UInt16
      value.l
    end

    # Low Auto-reload value
    def self.l=(value : UInt16) : UInt16
      self.set(l: value)
      value
    end

    def copy_with(
      *,

      h : UInt16? = nil,

      l : UInt16? = nil
    ) : self
      value = @value

      unless h.nil?
        value = (value & 0xffff_u32) |
                UInt32.new!(h.to_int).&(0xffff_u32) << 16
      end

      unless l.nil?
        value = (value & 0xffff0000_u32) |
                UInt32.new!(l.to_int).&(0xffff_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      h : UInt16? = nil,
      l : UInt16? = nil
    ) : Nil
      self.value = self.value.copy_with(
        h: h,
        l: l,
      )
    end
  end # struct

  # capture/compare register 1
  struct CCR1
    ADDRESS = BASE_ADDRESS + 0x34_u64

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

    # High Capture/Compare 1              value
    def h : UInt16
      UInt16.new!((@value >> 16) & 0xffff_u32)
    end

    # High Capture/Compare 1              value
    def self.h : UInt16
      value.h
    end

    # High Capture/Compare 1              value
    def self.h=(value : UInt16) : UInt16
      self.set(h: value)
      value
    end

    # Low Capture/Compare 1              value
    def l : UInt16
      UInt16.new!((@value >> 0) & 0xffff_u32)
    end

    # Low Capture/Compare 1              value
    def self.l : UInt16
      value.l
    end

    # Low Capture/Compare 1              value
    def self.l=(value : UInt16) : UInt16
      self.set(l: value)
      value
    end

    def copy_with(
      *,

      h : UInt16? = nil,

      l : UInt16? = nil
    ) : self
      value = @value

      unless h.nil?
        value = (value & 0xffff_u32) |
                UInt32.new!(h.to_int).&(0xffff_u32) << 16
      end

      unless l.nil?
        value = (value & 0xffff0000_u32) |
                UInt32.new!(l.to_int).&(0xffff_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      h : UInt16? = nil,
      l : UInt16? = nil
    ) : Nil
      self.value = self.value.copy_with(
        h: h,
        l: l,
      )
    end
  end # struct

  # capture/compare register 2
  struct CCR2
    ADDRESS = BASE_ADDRESS + 0x38_u64

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

    # High Capture/Compare 2              value
    def h : UInt16
      UInt16.new!((@value >> 16) & 0xffff_u32)
    end

    # High Capture/Compare 2              value
    def self.h : UInt16
      value.h
    end

    # High Capture/Compare 2              value
    def self.h=(value : UInt16) : UInt16
      self.set(h: value)
      value
    end

    # Low Capture/Compare 2              value
    def l : UInt16
      UInt16.new!((@value >> 0) & 0xffff_u32)
    end

    # Low Capture/Compare 2              value
    def self.l : UInt16
      value.l
    end

    # Low Capture/Compare 2              value
    def self.l=(value : UInt16) : UInt16
      self.set(l: value)
      value
    end

    def copy_with(
      *,

      h : UInt16? = nil,

      l : UInt16? = nil
    ) : self
      value = @value

      unless h.nil?
        value = (value & 0xffff_u32) |
                UInt32.new!(h.to_int).&(0xffff_u32) << 16
      end

      unless l.nil?
        value = (value & 0xffff0000_u32) |
                UInt32.new!(l.to_int).&(0xffff_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      h : UInt16? = nil,
      l : UInt16? = nil
    ) : Nil
      self.value = self.value.copy_with(
        h: h,
        l: l,
      )
    end
  end # struct

  # capture/compare register 3
  struct CCR3
    ADDRESS = BASE_ADDRESS + 0x3c_u64

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

    # High Capture/Compare value
    def h : UInt16
      UInt16.new!((@value >> 16) & 0xffff_u32)
    end

    # High Capture/Compare value
    def self.h : UInt16
      value.h
    end

    # High Capture/Compare value
    def self.h=(value : UInt16) : UInt16
      self.set(h: value)
      value
    end

    # Low Capture/Compare value
    def l : UInt16
      UInt16.new!((@value >> 0) & 0xffff_u32)
    end

    # Low Capture/Compare value
    def self.l : UInt16
      value.l
    end

    # Low Capture/Compare value
    def self.l=(value : UInt16) : UInt16
      self.set(l: value)
      value
    end

    def copy_with(
      *,

      h : UInt16? = nil,

      l : UInt16? = nil
    ) : self
      value = @value

      unless h.nil?
        value = (value & 0xffff_u32) |
                UInt32.new!(h.to_int).&(0xffff_u32) << 16
      end

      unless l.nil?
        value = (value & 0xffff0000_u32) |
                UInt32.new!(l.to_int).&(0xffff_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      h : UInt16? = nil,
      l : UInt16? = nil
    ) : Nil
      self.value = self.value.copy_with(
        h: h,
        l: l,
      )
    end
  end # struct

  # capture/compare register 4
  struct CCR4
    ADDRESS = BASE_ADDRESS + 0x40_u64

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

    # High Capture/Compare value
    def h : UInt16
      UInt16.new!((@value >> 16) & 0xffff_u32)
    end

    # High Capture/Compare value
    def self.h : UInt16
      value.h
    end

    # High Capture/Compare value
    def self.h=(value : UInt16) : UInt16
      self.set(h: value)
      value
    end

    # Low Capture/Compare value
    def l : UInt16
      UInt16.new!((@value >> 0) & 0xffff_u32)
    end

    # Low Capture/Compare value
    def self.l : UInt16
      value.l
    end

    # Low Capture/Compare value
    def self.l=(value : UInt16) : UInt16
      self.set(l: value)
      value
    end

    def copy_with(
      *,

      h : UInt16? = nil,

      l : UInt16? = nil
    ) : self
      value = @value

      unless h.nil?
        value = (value & 0xffff_u32) |
                UInt32.new!(h.to_int).&(0xffff_u32) << 16
      end

      unless l.nil?
        value = (value & 0xffff0000_u32) |
                UInt32.new!(l.to_int).&(0xffff_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      h : UInt16? = nil,
      l : UInt16? = nil
    ) : Nil
      self.value = self.value.copy_with(
        h: h,
        l: l,
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

  # TIM5 option register
  struct OR
    ADDRESS = BASE_ADDRESS + 0x50_u64

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

    # Timer Input 4 remap
    def itr1_rmp : UInt8
      UInt8.new!((@value >> 10) & 0x3_u32)
    end

    # Timer Input 4 remap
    def self.itr1_rmp : UInt8
      value.itr1_rmp
    end

    # Timer Input 4 remap
    def self.itr1_rmp=(value : UInt8) : UInt8
      self.set(itr1_rmp: value)
      value
    end

    def copy_with(
      *,

      itr1_rmp : UInt8? = nil
    ) : self
      value = @value

      unless itr1_rmp.nil?
        value = (value & 0xfffff3ff_u32) |
                UInt32.new!(itr1_rmp.to_int).&(0x3_u32) << 10
      end

      self.class.new(value)
    end

    def self.set(
      *,
      itr1_rmp : UInt8? = nil
    ) : Nil
      self.value = self.value.copy_with(
        itr1_rmp: itr1_rmp,
      )
    end
  end # struct

end
