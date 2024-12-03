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

      arpe : Bool? = nil,

      opm : Bool? = nil,

      urs : Bool? = nil,

      udis : Bool? = nil,

      cen : Bool? = nil
    ) : self
      value = @value

      unless arpe.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(arpe.to_int).&(0x1_u32) << 7
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
      arpe : Bool? = nil,
      opm : Bool? = nil,
      urs : Bool? = nil,
      udis : Bool? = nil,
      cen : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        arpe: arpe,
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

    def copy_with(
      *,

      mms : UInt8? = nil
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
      mms : UInt8? = nil
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

      ude : Bool? = nil,

      uie : Bool? = nil
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
      ude : Bool? = nil,
      uie : Bool? = nil
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

      uif : Bool? = nil
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
      uif : Bool? = nil
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

    # Update generation
    def self.ug=(value : Bool) : Bool
      self.set(ug: value)
      value
    end

    def copy_with(
      *,

      ug : Bool? = nil
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
      ug : Bool? = nil
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
