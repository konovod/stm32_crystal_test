# Basic timers
module TIM6
  VERSION      = nil
  BASE_ADDRESS = 0x40001000_u64

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

      arpe : ARPE? = nil,

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
      arpe : ARPE? = nil,
      uifremap : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        cen: cen,
        udis: udis,
        urs: urs,
        opm: opm,
        arpe: arpe,
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

    enum MMS : UInt8
      # Use UG bit from TIMx_EGR register
      RESET = 0x0_u64

      # Use CNT bit from TIMx_CEN register
      ENABLE = 0x1_u64

      # Use the update event
      UPDATE = 0x2_u64

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

    def copy_with(
      *,

      mms : MMS? = nil
    ) : self
      value = @value

      unless mms.nil?
        value = (value & 0xffffff8f_u32) |
                UInt32.new!(mms.to_int).&(0x7_u32) << 4
      end

      self.class.new(value)
    end

    def self.set(
      *,
      mms : MMS? = nil
    ) : Nil
      self.value = self.value.copy_with(
        mms: mms,
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

      ude : UDE? = nil,

      uie : UIE? = nil
    ) : self
      value = @value

      unless ude.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(ude.to_int).&(0x1_u32) << 8
      end

      unless uie.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(uie.to_int).&(0x1_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      ude : UDE? = nil,
      uie : UIE? = nil
    ) : Nil
      self.value = self.value.copy_with(
        ude: ude,
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

    def copy_with(
      *,

      uif : UIF? = nil
    ) : self
      value = @value

      unless uif.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(uif.to_int).&(0x1_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      uif : UIF? = nil
    ) : Nil
      self.value = self.value.copy_with(
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

      ug : UG? = nil
    ) : self
      value = @value

      unless ug.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(ug.to_int).&(0x1_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      ug : UG? = nil
    ) : Nil
      self.value = self.value.copy_with(
        ug: ug,
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

    # Low counter value
    def cnt : UInt16
      UInt16.new!((@value >> 0) & 0xffff_u32)
    end

    # Low counter value
    def self.cnt : UInt16
      value.cnt
    end

    # Low counter value
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

    # Low Auto-reload value
    def arr : UInt16
      UInt16.new!((@value >> 0) & 0xffff_u32)
    end

    # Low Auto-reload value
    def self.arr : UInt16
      value.arr
    end

    # Low Auto-reload value
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

end
