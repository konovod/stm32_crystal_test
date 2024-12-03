# Cryptographic processor
module CRC
  VERSION      = nil
  BASE_ADDRESS = 0x40023000_u64

  # Data register
  struct DR
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
      new(0xffffffff_u64)
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

    # Data Register
    def dr : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # Data Register
    def self.dr : UInt32
      value.dr
    end

    # Data Register
    def self.dr=(value : UInt32) : UInt32
      self.set(dr: value)
      value
    end

    def copy_with(
      *,

      dr : UInt32? = nil
    ) : self
      value = @value

      unless dr.nil?
        value = (value & 0xffffffff_u32) |
                UInt32.new!(dr.to_int).&(0x0_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      dr : UInt32? = nil
    ) : Nil
      self.value = self.value.copy_with(
        dr: dr,
      )
    end
  end # struct

  # Independent Data register
  struct IDR
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

    # Independent Data register
    def idr : UInt8
      UInt8.new!((@value >> 0) & 0xff_u32)
    end

    # Independent Data register
    def self.idr : UInt8
      value.idr
    end

    # Independent Data register
    def self.idr=(value : UInt8) : UInt8
      self.set(idr: value)
      value
    end

    def copy_with(
      *,

      idr : UInt8? = nil
    ) : self
      value = @value

      unless idr.nil?
        value = (value & 0xffffff00_u32) |
                UInt32.new!(idr.to_int).&(0xff_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      idr : UInt8? = nil
    ) : Nil
      self.value = self.value.copy_with(
        idr: idr,
      )
    end
  end # struct

  # Control register
  struct CR
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

    # Control regidter
    def self.cr=(value : Bool) : Bool
      self.set(cr: value)
      value
    end

    def copy_with(
      *,

      cr : Bool? = nil
    ) : self
      value = @value

      unless cr.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(cr.to_int).&(0x1_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      cr : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        cr: cr,
      )
    end
  end # struct

end
