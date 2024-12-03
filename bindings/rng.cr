# Random number generator
module RNG
  VERSION      = nil
  BASE_ADDRESS = 0x50060800_u64

  # control register
  struct CR
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

    # Interrupt enable
    def ie : Bool
      @value.bits_set?(0x8_u32)
    end

    # Interrupt enable
    def self.ie : Bool
      value.ie
    end

    # Interrupt enable
    def self.ie=(value : Bool) : Bool
      self.set(ie: value)
      value
    end

    # Random number generator              enable
    def en : Bool
      @value.bits_set?(0x4_u32)
    end

    # Random number generator              enable
    def self.en : Bool
      value.en
    end

    # Random number generator              enable
    def self.en=(value : Bool) : Bool
      self.set(en: value)
      value
    end

    def copy_with(
      *,

      ie : Bool? = nil,

      en : Bool? = nil
    ) : self
      value = @value

      unless ie.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(ie.to_int).&(0x1_u32) << 3
      end

      unless en.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(en.to_int).&(0x1_u32) << 2
      end

      self.class.new(value)
    end

    def self.set(
      *,
      ie : Bool? = nil,
      en : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        ie: ie,
        en: en,
      )
    end
  end # struct

  # status register
  struct SR
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

    # Seed error interrupt              status
    def seis : Bool
      @value.bits_set?(0x40_u32)
    end

    # Seed error interrupt              status
    def self.seis : Bool
      value.seis
    end

    # Seed error interrupt              status
    def self.seis=(value : Bool) : Bool
      self.set(seis: value)
      value
    end

    # Clock error interrupt              status
    def ceis : Bool
      @value.bits_set?(0x20_u32)
    end

    # Clock error interrupt              status
    def self.ceis : Bool
      value.ceis
    end

    # Clock error interrupt              status
    def self.ceis=(value : Bool) : Bool
      self.set(ceis: value)
      value
    end

    # Seed error current status
    def secs : Bool
      @value.bits_set?(0x4_u32)
    end

    # Seed error current status
    def self.secs : Bool
      value.secs
    end

    # Clock error current status
    def cecs : Bool
      @value.bits_set?(0x2_u32)
    end

    # Clock error current status
    def self.cecs : Bool
      value.cecs
    end

    # Data ready
    def drdy : Bool
      @value.bits_set?(0x1_u32)
    end

    # Data ready
    def self.drdy : Bool
      value.drdy
    end

    def copy_with(
      *,

      seis : Bool? = nil,

      ceis : Bool? = nil
    ) : self
      value = @value

      unless seis.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(seis.to_int).&(0x1_u32) << 6
      end

      unless ceis.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(ceis.to_int).&(0x1_u32) << 5
      end

      self.class.new(value)
    end

    def self.set(
      *,
      seis : Bool? = nil,
      ceis : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        seis: seis,
        ceis: ceis,
      )
    end
  end # struct

  # data register
  struct DR
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

    # Random data
    def rndata : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # Random data
    def self.rndata : UInt32
      value.rndata
    end
  end # struct

end
