# cyclic redundancy check calculation      unit
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

    # Data register bits
    def dr : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # Data register bits
    def self.dr : UInt32
      value.dr
    end

    # Data register bits
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

  # Independent data register
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

    # General-purpose 8-bit data register              bits
    def idr : UInt8
      UInt8.new!((@value >> 0) & 0xff_u32)
    end

    # General-purpose 8-bit data register              bits
    def self.idr : UInt8
      value.idr
    end

    # General-purpose 8-bit data register              bits
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

    enum RESET : UInt8
      # Resets the CRC calculation unit and sets the data register to 0xFFFF FFFF
      RESET = 0x1_u64

      def self.reset_value : RESET
        CR.reset_value.reset
      end
    end

    # reset bit
    def reset : RESET
      RESET.new!((@value >> 0) & 0x1_u32)
    end

    # reset bit
    def self.reset : RESET
      value.reset
    end

    # reset bit
    def self.reset=(value : RESET) : RESET
      self.set(reset: value)
      value
    end

    enum POLYSIZE : UInt8
      # 32-bit polynomial
      POLYSIZE32 = 0x0_u64

      # 16-bit polynomial
      POLYSIZE16 = 0x1_u64

      # 8-bit polynomial
      POLYSIZE8 = 0x2_u64

      # 7-bit polynomial
      POLYSIZE7 = 0x3_u64

      def self.reset_value : POLYSIZE
        CR.reset_value.polysize
      end
    end

    # Polynomial size
    def polysize : POLYSIZE
      POLYSIZE.new!((@value >> 3) & 0x3_u32)
    end

    # Polynomial size
    def self.polysize : POLYSIZE
      value.polysize
    end

    # Polynomial size
    def self.polysize=(value : POLYSIZE) : POLYSIZE
      self.set(polysize: value)
      value
    end

    enum REV_IN : UInt8
      # Bit order not affected
      NORMAL = 0x0_u64

      # Bit reversal done by byte
      BYTE = 0x1_u64

      # Bit reversal done by half-word
      HALFWORD = 0x2_u64

      # Bit reversal done by word
      WORD = 0x3_u64

      def self.reset_value : REV_IN
        CR.reset_value.rev_in
      end
    end

    # Reverse input data
    def rev_in : REV_IN
      REV_IN.new!((@value >> 5) & 0x3_u32)
    end

    # Reverse input data
    def self.rev_in : REV_IN
      value.rev_in
    end

    # Reverse input data
    def self.rev_in=(value : REV_IN) : REV_IN
      self.set(rev_in: value)
      value
    end

    enum REV_OUT : UInt8
      # Bit order not affected
      NORMAL = 0x0_u64

      # Bit reversed output
      REVERSED = 0x1_u64

      def self.reset_value : REV_OUT
        CR.reset_value.rev_out
      end
    end

    # Reverse output data
    def rev_out : REV_OUT
      REV_OUT.new!((@value >> 7) & 0x1_u32)
    end

    # Reverse output data
    def self.rev_out : REV_OUT
      value.rev_out
    end

    # Reverse output data
    def self.rev_out=(value : REV_OUT) : REV_OUT
      self.set(rev_out: value)
      value
    end

    def copy_with(
      *,

      reset : RESET? = nil,

      polysize : POLYSIZE? = nil,

      rev_in : REV_IN? = nil,

      rev_out : REV_OUT? = nil
    ) : self
      value = @value

      unless reset.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(reset.to_int).&(0x1_u32) << 0
      end

      unless polysize.nil?
        value = (value & 0xffffffe7_u32) |
                UInt32.new!(polysize.to_int).&(0x3_u32) << 3
      end

      unless rev_in.nil?
        value = (value & 0xffffff9f_u32) |
                UInt32.new!(rev_in.to_int).&(0x3_u32) << 5
      end

      unless rev_out.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(rev_out.to_int).&(0x1_u32) << 7
      end

      self.class.new(value)
    end

    def self.set(
      *,
      reset : RESET? = nil,
      polysize : POLYSIZE? = nil,
      rev_in : REV_IN? = nil,
      rev_out : REV_OUT? = nil
    ) : Nil
      self.value = self.value.copy_with(
        reset: reset,
        polysize: polysize,
        rev_in: rev_in,
        rev_out: rev_out,
      )
    end
  end # struct

  # Initial CRC value
  struct INIT
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

    # Programmable initial CRC              value
    def init : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # Programmable initial CRC              value
    def self.init : UInt32
      value.init
    end

    # Programmable initial CRC              value
    def self.init=(value : UInt32) : UInt32
      self.set(init: value)
      value
    end

    def copy_with(
      *,

      init : UInt32? = nil
    ) : self
      value = @value

      unless init.nil?
        value = (value & 0xffffffff_u32) |
                UInt32.new!(init.to_int).&(0x0_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      init : UInt32? = nil
    ) : Nil
      self.value = self.value.copy_with(
        init: init,
      )
    end
  end # struct

  # CRC polynomial
  struct POL
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
      new(0x4c11db7_u64)
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

    # Programmable polynomial
    def pol : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # Programmable polynomial
    def self.pol : UInt32
      value.pol
    end

    # Programmable polynomial
    def self.pol=(value : UInt32) : UInt32
      self.set(pol: value)
      value
    end

    def copy_with(
      *,

      pol : UInt32? = nil
    ) : self
      value = @value

      unless pol.nil?
        value = (value & 0xffffffff_u32) |
                UInt32.new!(pol.to_int).&(0x0_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      pol : UInt32? = nil
    ) : Nil
      self.value = self.value.copy_with(
        pol: pol,
      )
    end
  end # struct

  # Data register - byte sized
  struct DR8
    ADDRESS = BASE_ADDRESS + 0x0_u64

    protected def self.address : UInt64
      ADDRESS
    end

    @value : UInt8

    def initialize(@value : UInt8)
    end

    def to_int : UInt8
      @value
    end

    def self.reset_value : self
      new(0xff_u64)
    end

    def self.pointer : Pointer(UInt8)
      Pointer(UInt8).new(self.address)
    end

    def self.value : self
      value = self.pointer.load(volatile: true)
      new(value)
    end

    def self.value=(value : self) : self
      self.pointer.store(value.to_int, volatile: true)
      value
    end

    # Data register bits
    def dr8 : UInt8
      UInt8.new!((@value >> 0) & 0x0_u8)
    end

    # Data register bits
    def self.dr8 : UInt8
      value.dr8
    end

    # Data register bits
    def self.dr8=(value : UInt8) : UInt8
      self.set(dr8: value)
      value
    end

    def copy_with(
      *,

      dr8 : UInt8? = nil
    ) : self
      value = @value

      unless dr8.nil?
        value = (value & 0xff_u8) |
                UInt8.new!(dr8.to_int).&(0x0_u8) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      dr8 : UInt8? = nil
    ) : Nil
      self.value = self.value.copy_with(
        dr8: dr8,
      )
    end
  end # struct

  # Data register - half-word sized
  struct DR16
    ADDRESS = BASE_ADDRESS + 0x0_u64

    protected def self.address : UInt64
      ADDRESS
    end

    @value : UInt16

    def initialize(@value : UInt16)
    end

    def to_int : UInt16
      @value
    end

    def self.reset_value : self
      new(0xffff_u64)
    end

    def self.pointer : Pointer(UInt16)
      Pointer(UInt16).new(self.address)
    end

    def self.value : self
      value = self.pointer.load(volatile: true)
      new(value)
    end

    def self.value=(value : self) : self
      self.pointer.store(value.to_int, volatile: true)
      value
    end

    # Data register bits
    def dr16 : UInt16
      UInt16.new!((@value >> 0) & 0x0_u16)
    end

    # Data register bits
    def self.dr16 : UInt16
      value.dr16
    end

    # Data register bits
    def self.dr16=(value : UInt16) : UInt16
      self.set(dr16: value)
      value
    end

    def copy_with(
      *,

      dr16 : UInt16? = nil
    ) : self
      value = @value

      unless dr16.nil?
        value = (value & 0xffff_u16) |
                UInt16.new!(dr16.to_int).&(0x0_u16) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      dr16 : UInt16? = nil
    ) : Nil
      self.value = self.value.copy_with(
        dr16: dr16,
      )
    end
  end # struct

end
