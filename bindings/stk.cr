# SysTick timer
module STK
  VERSION      = nil
  BASE_ADDRESS = 0xe000e010_u64

  # SysTick control and status          register
  struct CTRL
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

    # Counter enable
    def enable : Bool
      @value.bits_set?(0x1_u32)
    end

    # Counter enable
    def self.enable : Bool
      value.enable
    end

    # Counter enable
    def self.enable=(value : Bool) : Bool
      self.set(enable: value)
      value
    end

    # SysTick exception request              enable
    def tickint : Bool
      @value.bits_set?(0x2_u32)
    end

    # SysTick exception request              enable
    def self.tickint : Bool
      value.tickint
    end

    # SysTick exception request              enable
    def self.tickint=(value : Bool) : Bool
      self.set(tickint: value)
      value
    end

    # Clock source selection
    def clksource : Bool
      @value.bits_set?(0x4_u32)
    end

    # Clock source selection
    def self.clksource : Bool
      value.clksource
    end

    # Clock source selection
    def self.clksource=(value : Bool) : Bool
      self.set(clksource: value)
      value
    end

    # COUNTFLAG
    def countflag : Bool
      @value.bits_set?(0x10000_u32)
    end

    # COUNTFLAG
    def self.countflag : Bool
      value.countflag
    end

    # COUNTFLAG
    def self.countflag=(value : Bool) : Bool
      self.set(countflag: value)
      value
    end

    def copy_with(
      *,

      enable : Bool? = nil,

      tickint : Bool? = nil,

      clksource : Bool? = nil,

      countflag : Bool? = nil
    ) : self
      value = @value

      unless enable.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(enable.to_int).&(0x1_u32) << 0
      end

      unless tickint.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(tickint.to_int).&(0x1_u32) << 1
      end

      unless clksource.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(clksource.to_int).&(0x1_u32) << 2
      end

      unless countflag.nil?
        value = (value & 0xfffeffff_u32) |
                UInt32.new!(countflag.to_int).&(0x1_u32) << 16
      end

      self.class.new(value)
    end

    def self.set(
      *,
      enable : Bool? = nil,
      tickint : Bool? = nil,
      clksource : Bool? = nil,
      countflag : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        enable: enable,
        tickint: tickint,
        clksource: clksource,
        countflag: countflag,
      )
    end
  end # struct

  # SysTick reload value register
  struct LOAD
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

    # RELOAD value
    def reload : UInt32
      UInt32.new!((@value >> 0) & 0xffffff_u32)
    end

    # RELOAD value
    def self.reload : UInt32
      value.reload
    end

    # RELOAD value
    def self.reload=(value : UInt32) : UInt32
      self.set(reload: value)
      value
    end

    def copy_with(
      *,

      reload : UInt32? = nil
    ) : self
      value = @value

      unless reload.nil?
        value = (value & 0xff000000_u32) |
                UInt32.new!(reload.to_int).&(0xffffff_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      reload : UInt32? = nil
    ) : Nil
      self.value = self.value.copy_with(
        reload: reload,
      )
    end
  end # struct

  # SysTick current value register
  struct VAL
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

    # Current counter value
    def current : UInt32
      UInt32.new!((@value >> 0) & 0xffffff_u32)
    end

    # Current counter value
    def self.current : UInt32
      value.current
    end

    # Current counter value
    def self.current=(value : UInt32) : UInt32
      self.set(current: value)
      value
    end

    def copy_with(
      *,

      current : UInt32? = nil
    ) : self
      value = @value

      unless current.nil?
        value = (value & 0xff000000_u32) |
                UInt32.new!(current.to_int).&(0xffffff_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      current : UInt32? = nil
    ) : Nil
      self.value = self.value.copy_with(
        current: current,
      )
    end
  end # struct

  # SysTick calibration value          register
  struct CALIB
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

    # Calibration value
    def tenms : UInt32
      UInt32.new!((@value >> 0) & 0xffffff_u32)
    end

    # Calibration value
    def self.tenms : UInt32
      value.tenms
    end

    # Calibration value
    def self.tenms=(value : UInt32) : UInt32
      self.set(tenms: value)
      value
    end

    # SKEW flag: Indicates whether the TENMS              value is exact
    def skew : Bool
      @value.bits_set?(0x40000000_u32)
    end

    # SKEW flag: Indicates whether the TENMS              value is exact
    def self.skew : Bool
      value.skew
    end

    # SKEW flag: Indicates whether the TENMS              value is exact
    def self.skew=(value : Bool) : Bool
      self.set(skew: value)
      value
    end

    # NOREF flag. Reads as zero
    def noref : Bool
      @value.bits_set?(0x80000000_u32)
    end

    # NOREF flag. Reads as zero
    def self.noref : Bool
      value.noref
    end

    # NOREF flag. Reads as zero
    def self.noref=(value : Bool) : Bool
      self.set(noref: value)
      value
    end

    def copy_with(
      *,

      tenms : UInt32? = nil,

      skew : Bool? = nil,

      noref : Bool? = nil
    ) : self
      value = @value

      unless tenms.nil?
        value = (value & 0xff000000_u32) |
                UInt32.new!(tenms.to_int).&(0xffffff_u32) << 0
      end

      unless skew.nil?
        value = (value & 0xbfffffff_u32) |
                UInt32.new!(skew.to_int).&(0x1_u32) << 30
      end

      unless noref.nil?
        value = (value & 0x7fffffff_u32) |
                UInt32.new!(noref.to_int).&(0x1_u32) << 31
      end

      self.class.new(value)
    end

    def self.set(
      *,
      tenms : UInt32? = nil,
      skew : Bool? = nil,
      noref : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        tenms: tenms,
        skew: skew,
        noref: noref,
      )
    end
  end # struct

end
