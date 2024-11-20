# General purpose timer
module TIM17
  VERSION      = nil
  BASE_ADDRESS = 0x40014800_u64

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

      opm : Bool? = nil,

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
      opm : Bool? = nil,
      arpe : ARPE? = nil,
      ckd : CKD? = nil,
      uifremap : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        cen: cen,
        udis: udis,
        urs: urs,
        opm: opm,
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

    def copy_with(
      *,

      ois1_n : Bool? = nil,

      ois1 : Bool? = nil,

      ccds : Bool? = nil,

      ccus : Bool? = nil,

      ccpc : Bool? = nil
    ) : self
      value = @value

      unless ois1_n.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(ois1_n.to_int).&(0x1_u32) << 9
      end

      unless ois1.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(ois1.to_int).&(0x1_u32) << 8
      end

      unless ccds.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(ccds.to_int).&(0x1_u32) << 3
      end

      unless ccus.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(ccus.to_int).&(0x1_u32) << 2
      end

      unless ccpc.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(ccpc.to_int).&(0x1_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      ois1_n : Bool? = nil,
      ois1 : Bool? = nil,
      ccds : Bool? = nil,
      ccus : Bool? = nil,
      ccpc : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        ois1_n: ois1_n,
        ois1: ois1,
        ccds: ccds,
        ccus: ccus,
        ccpc: ccpc,
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

    def copy_with(
      *,

      uie : UIE? = nil,

      cc1_ie : Bool? = nil,

      comie : Bool? = nil,

      tie : Bool? = nil,

      bie : Bool? = nil,

      ude : Bool? = nil,

      cc1_de : Bool? = nil,

      comde : Bool? = nil,

      tde : Bool? = nil
    ) : self
      value = @value

      unless uie.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(uie.to_int).&(0x1_u32) << 0
      end

      unless cc1_ie.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(cc1_ie.to_int).&(0x1_u32) << 1
      end

      unless comie.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(comie.to_int).&(0x1_u32) << 5
      end

      unless tie.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(tie.to_int).&(0x1_u32) << 6
      end

      unless bie.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(bie.to_int).&(0x1_u32) << 7
      end

      unless ude.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(ude.to_int).&(0x1_u32) << 8
      end

      unless cc1_de.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(cc1_de.to_int).&(0x1_u32) << 9
      end

      unless comde.nil?
        value = (value & 0xffffdfff_u32) |
                UInt32.new!(comde.to_int).&(0x1_u32) << 13
      end

      unless tde.nil?
        value = (value & 0xffffbfff_u32) |
                UInt32.new!(tde.to_int).&(0x1_u32) << 14
      end

      self.class.new(value)
    end

    def self.set(
      *,
      uie : UIE? = nil,
      cc1_ie : Bool? = nil,
      comie : Bool? = nil,
      tie : Bool? = nil,
      bie : Bool? = nil,
      ude : Bool? = nil,
      cc1_de : Bool? = nil,
      comde : Bool? = nil,
      tde : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        uie: uie,
        cc1_ie: cc1_ie,
        comie: comie,
        tie: tie,
        bie: bie,
        ude: ude,
        cc1_de: cc1_de,
        comde: comde,
        tde: tde,
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

      cc1_of : Bool? = nil,

      bif : Bool? = nil,

      tif : Bool? = nil,

      comif : Bool? = nil,

      cc1_if : Bool? = nil,

      uif : UIF? = nil
    ) : self
      value = @value

      unless cc1_of.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(cc1_of.to_int).&(0x1_u32) << 9
      end

      unless bif.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(bif.to_int).&(0x1_u32) << 7
      end

      unless tif.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(tif.to_int).&(0x1_u32) << 6
      end

      unless comif.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(comif.to_int).&(0x1_u32) << 5
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
      cc1_of : Bool? = nil,
      bif : Bool? = nil,
      tif : Bool? = nil,
      comif : Bool? = nil,
      cc1_if : Bool? = nil,
      uif : UIF? = nil
    ) : Nil
      self.value = self.value.copy_with(
        cc1_of: cc1_of,
        bif: bif,
        tif: tif,
        comif: comif,
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

    # Break generation
    def self.bg=(value : Bool) : Bool
      self.set(bg: value)
      value
    end

    # Trigger generation
    def self.tg=(value : Bool) : Bool
      self.set(tg: value)
      value
    end

    # Capture/Compare control update              generation
    def self.comg=(value : Bool) : Bool
      self.set(comg: value)
      value
    end

    # Capture/compare 1              generation
    def self.cc1_g=(value : Bool) : Bool
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

      bg : Bool? = nil,

      tg : Bool? = nil,

      comg : Bool? = nil,

      cc1_g : Bool? = nil,

      ug : UG? = nil
    ) : self
      value = @value

      unless bg.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(bg.to_int).&(0x1_u32) << 7
      end

      unless tg.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(tg.to_int).&(0x1_u32) << 6
      end

      unless comg.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(comg.to_int).&(0x1_u32) << 5
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
      bg : Bool? = nil,
      tg : Bool? = nil,
      comg : Bool? = nil,
      cc1_g : Bool? = nil,
      ug : UG? = nil
    ) : Nil
      self.value = self.value.copy_with(
        bg: bg,
        tg: tg,
        comg: comg,
        cc1_g: cc1_g,
        ug: ug,
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

    # Output Compare 1 preload              enable
    def oc1_pe : Bool
      @value.bits_set?(0x8_u32)
    end

    # Output Compare 1 preload              enable
    def self.oc1_pe : Bool
      value.oc1_pe
    end

    # Output Compare 1 preload              enable
    def self.oc1_pe=(value : Bool) : Bool
      self.set(oc1_pe: value)
      value
    end

    enum OC1M : UInt8
      # The comparison between the output compare register TIMx_CCRy and the counter TIMx_CNT has no effect on the outputs
      FROZEN = 0x0_u64

      # Set channel to active level on match. OCyREF signal is forced high when the counter matches the capture/compare register
      ACTIVEONMATCH = 0x1_u64

      # Set channel to inactive level on match. OCyREF signal is forced low when the counter matches the capture/compare register
      INACTIVEONMATCH = 0x2_u64

      # OCyREF toggles when TIMx_CNT=TIMx_CCRy
      TOGGLE = 0x3_u64

      # OCyREF is forced low
      FORCEINACTIVE = 0x4_u64

      # OCyREF is forced high
      FORCEACTIVE = 0x5_u64

      # In upcounting, channel is active as long as TIMx_CNT<TIMx_CCRy else inactive. In downcounting, channel is inactive as long as TIMx_CNT>TIMx_CCRy else active
      PWMMODE1 = 0x6_u64

      # Inversely to PwmMode1
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

    # Output Compare 1 mode
    def oc1_m_3 : Bool
      @value.bits_set?(0x10000_u32)
    end

    # Output Compare 1 mode
    def self.oc1_m_3 : Bool
      value.oc1_m_3
    end

    # Output Compare 1 mode
    def self.oc1_m_3=(value : Bool) : Bool
      self.set(oc1_m_3: value)
      value
    end

    def copy_with(
      *,

      cc1_s : UInt8? = nil,

      oc1_fe : Bool? = nil,

      oc1_pe : Bool? = nil,

      oc1_m : OC1M? = nil,

      oc1_m_3 : Bool? = nil
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

      unless oc1_m_3.nil?
        value = (value & 0xfffeffff_u32) |
                UInt32.new!(oc1_m_3.to_int).&(0x1_u32) << 16
      end

      self.class.new(value)
    end

    def self.set(
      *,
      cc1_s : UInt8? = nil,
      oc1_fe : Bool? = nil,
      oc1_pe : Bool? = nil,
      oc1_m : OC1M? = nil,
      oc1_m_3 : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        cc1_s: cc1_s,
        oc1_fe: oc1_fe,
        oc1_pe: oc1_pe,
        oc1_m: oc1_m,
        oc1_m_3: oc1_m_3,
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

      ic1_f : UInt8? = nil,

      ic1_psc : UInt8? = nil,

      cc1_s : UInt8? = nil
    ) : self
      value = @value

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
      ic1_f : UInt8? = nil,
      ic1_psc : UInt8? = nil,
      cc1_s : UInt8? = nil
    ) : Nil
      self.value = self.value.copy_with(
        ic1_f: ic1_f,
        ic1_psc: ic1_psc,
        cc1_s: cc1_s,
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

      cc1_np : Bool? = nil,

      cc1_ne : Bool? = nil,

      cc1_p : Bool? = nil,

      cc1_e : Bool? = nil
    ) : self
      value = @value

      unless cc1_np.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(cc1_np.to_int).&(0x1_u32) << 3
      end

      unless cc1_ne.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(cc1_ne.to_int).&(0x1_u32) << 2
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
      cc1_np : Bool? = nil,
      cc1_ne : Bool? = nil,
      cc1_p : Bool? = nil,
      cc1_e : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        cc1_np: cc1_np,
        cc1_ne: cc1_ne,
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

    # UIF Copy
    def uifcpy : Bool
      @value.bits_set?(0x80000000_u32)
    end

    # UIF Copy
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
    def rep : UInt8
      UInt8.new!((@value >> 0) & 0xff_u32)
    end

    # Repetition counter value
    def self.rep : UInt8
      value.rep
    end

    # Repetition counter value
    def self.rep=(value : UInt8) : UInt8
      self.set(rep: value)
      value
    end

    def copy_with(
      *,

      rep : UInt8? = nil
    ) : self
      value = @value

      unless rep.nil?
        value = (value & 0xffffff00_u32) |
                UInt32.new!(rep.to_int).&(0xff_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      rep : UInt8? = nil
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

    # Off-state selection for Idle              mode
    def ossi : Bool
      @value.bits_set?(0x400_u32)
    end

    # Off-state selection for Idle              mode
    def self.ossi : Bool
      value.ossi
    end

    # Off-state selection for Idle              mode
    def self.ossi=(value : Bool) : Bool
      self.set(ossi: value)
      value
    end

    # Off-state selection for Run              mode
    def ossr : Bool
      @value.bits_set?(0x800_u32)
    end

    # Off-state selection for Run              mode
    def self.ossr : Bool
      value.ossr
    end

    # Off-state selection for Run              mode
    def self.ossr=(value : Bool) : Bool
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

    # Main output enable
    def moe : Bool
      @value.bits_set?(0x8000_u32)
    end

    # Main output enable
    def self.moe : Bool
      value.moe
    end

    # Main output enable
    def self.moe=(value : Bool) : Bool
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

    def copy_with(
      *,

      dtg : UInt8? = nil,

      lock : UInt8? = nil,

      ossi : Bool? = nil,

      ossr : Bool? = nil,

      bke : Bool? = nil,

      bkp : Bool? = nil,

      aoe : Bool? = nil,

      moe : Bool? = nil,

      bkf : UInt8? = nil
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

      self.class.new(value)
    end

    def self.set(
      *,
      dtg : UInt8? = nil,
      lock : UInt8? = nil,
      ossi : Bool? = nil,
      ossr : Bool? = nil,
      bke : Bool? = nil,
      bkp : Bool? = nil,
      aoe : Bool? = nil,
      moe : Bool? = nil,
      bkf : UInt8? = nil
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

end
