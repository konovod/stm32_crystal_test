# General-purpose I/Os
module GPIOB
  VERSION      = nil
  BASE_ADDRESS = 0x48000400_u64

  # GPIO port mode register
  struct MODER
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
      new(0x280_u64)
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

    # Port x configuration bits (y =              0..15)
    def _15 : UInt8
      UInt8.new!((@value >> 30) & 0x3_u32)
    end

    # Port x configuration bits (y =              0..15)
    def self._15 : UInt8
      value._15
    end

    # Port x configuration bits (y =              0..15)
    def self._15=(value : UInt8) : UInt8
      self.set(_15: value)
      value
    end

    # Port x configuration bits (y =              0..15)
    def _14 : UInt8
      UInt8.new!((@value >> 28) & 0x3_u32)
    end

    # Port x configuration bits (y =              0..15)
    def self._14 : UInt8
      value._14
    end

    # Port x configuration bits (y =              0..15)
    def self._14=(value : UInt8) : UInt8
      self.set(_14: value)
      value
    end

    # Port x configuration bits (y =              0..15)
    def _13 : UInt8
      UInt8.new!((@value >> 26) & 0x3_u32)
    end

    # Port x configuration bits (y =              0..15)
    def self._13 : UInt8
      value._13
    end

    # Port x configuration bits (y =              0..15)
    def self._13=(value : UInt8) : UInt8
      self.set(_13: value)
      value
    end

    # Port x configuration bits (y =              0..15)
    def _12 : UInt8
      UInt8.new!((@value >> 24) & 0x3_u32)
    end

    # Port x configuration bits (y =              0..15)
    def self._12 : UInt8
      value._12
    end

    # Port x configuration bits (y =              0..15)
    def self._12=(value : UInt8) : UInt8
      self.set(_12: value)
      value
    end

    # Port x configuration bits (y =              0..15)
    def _11 : UInt8
      UInt8.new!((@value >> 22) & 0x3_u32)
    end

    # Port x configuration bits (y =              0..15)
    def self._11 : UInt8
      value._11
    end

    # Port x configuration bits (y =              0..15)
    def self._11=(value : UInt8) : UInt8
      self.set(_11: value)
      value
    end

    # Port x configuration bits (y =              0..15)
    def _10 : UInt8
      UInt8.new!((@value >> 20) & 0x3_u32)
    end

    # Port x configuration bits (y =              0..15)
    def self._10 : UInt8
      value._10
    end

    # Port x configuration bits (y =              0..15)
    def self._10=(value : UInt8) : UInt8
      self.set(_10: value)
      value
    end

    # Port x configuration bits (y =              0..15)
    def _9 : UInt8
      UInt8.new!((@value >> 18) & 0x3_u32)
    end

    # Port x configuration bits (y =              0..15)
    def self._9 : UInt8
      value._9
    end

    # Port x configuration bits (y =              0..15)
    def self._9=(value : UInt8) : UInt8
      self.set(_9: value)
      value
    end

    # Port x configuration bits (y =              0..15)
    def _8 : UInt8
      UInt8.new!((@value >> 16) & 0x3_u32)
    end

    # Port x configuration bits (y =              0..15)
    def self._8 : UInt8
      value._8
    end

    # Port x configuration bits (y =              0..15)
    def self._8=(value : UInt8) : UInt8
      self.set(_8: value)
      value
    end

    # Port x configuration bits (y =              0..15)
    def _7 : UInt8
      UInt8.new!((@value >> 14) & 0x3_u32)
    end

    # Port x configuration bits (y =              0..15)
    def self._7 : UInt8
      value._7
    end

    # Port x configuration bits (y =              0..15)
    def self._7=(value : UInt8) : UInt8
      self.set(_7: value)
      value
    end

    # Port x configuration bits (y =              0..15)
    def _6 : UInt8
      UInt8.new!((@value >> 12) & 0x3_u32)
    end

    # Port x configuration bits (y =              0..15)
    def self._6 : UInt8
      value._6
    end

    # Port x configuration bits (y =              0..15)
    def self._6=(value : UInt8) : UInt8
      self.set(_6: value)
      value
    end

    # Port x configuration bits (y =              0..15)
    def _5 : UInt8
      UInt8.new!((@value >> 10) & 0x3_u32)
    end

    # Port x configuration bits (y =              0..15)
    def self._5 : UInt8
      value._5
    end

    # Port x configuration bits (y =              0..15)
    def self._5=(value : UInt8) : UInt8
      self.set(_5: value)
      value
    end

    # Port x configuration bits (y =              0..15)
    def _4 : UInt8
      UInt8.new!((@value >> 8) & 0x3_u32)
    end

    # Port x configuration bits (y =              0..15)
    def self._4 : UInt8
      value._4
    end

    # Port x configuration bits (y =              0..15)
    def self._4=(value : UInt8) : UInt8
      self.set(_4: value)
      value
    end

    # Port x configuration bits (y =              0..15)
    def _3 : UInt8
      UInt8.new!((@value >> 6) & 0x3_u32)
    end

    # Port x configuration bits (y =              0..15)
    def self._3 : UInt8
      value._3
    end

    # Port x configuration bits (y =              0..15)
    def self._3=(value : UInt8) : UInt8
      self.set(_3: value)
      value
    end

    # Port x configuration bits (y =              0..15)
    def _2 : UInt8
      UInt8.new!((@value >> 4) & 0x3_u32)
    end

    # Port x configuration bits (y =              0..15)
    def self._2 : UInt8
      value._2
    end

    # Port x configuration bits (y =              0..15)
    def self._2=(value : UInt8) : UInt8
      self.set(_2: value)
      value
    end

    # Port x configuration bits (y =              0..15)
    def _1 : UInt8
      UInt8.new!((@value >> 2) & 0x3_u32)
    end

    # Port x configuration bits (y =              0..15)
    def self._1 : UInt8
      value._1
    end

    # Port x configuration bits (y =              0..15)
    def self._1=(value : UInt8) : UInt8
      self.set(_1: value)
      value
    end

    enum N0 : UInt8
      # Input mode (reset state)
      INPUT = 0x0_u64

      # General purpose output mode
      OUTPUT = 0x1_u64

      # Alternate function mode
      ALTERNATE = 0x2_u64

      # Analog mode
      ANALOG = 0x3_u64

      def self.reset_value : N0
        MODER.reset_value._0
      end
    end

    # Port x configuration bits (y =              0..15)
    def _0 : N0
      N0.new!((@value >> 0) & 0x3_u32)
    end

    # Port x configuration bits (y =              0..15)
    def self._0 : N0
      value._0
    end

    # Port x configuration bits (y =              0..15)
    def self._0=(value : N0) : N0
      self.set(_0: value)
      value
    end

    def copy_with(
      *,

      _15 : UInt8? = nil,

      _14 : UInt8? = nil,

      _13 : UInt8? = nil,

      _12 : UInt8? = nil,

      _11 : UInt8? = nil,

      _10 : UInt8? = nil,

      _9 : UInt8? = nil,

      _8 : UInt8? = nil,

      _7 : UInt8? = nil,

      _6 : UInt8? = nil,

      _5 : UInt8? = nil,

      _4 : UInt8? = nil,

      _3 : UInt8? = nil,

      _2 : UInt8? = nil,

      _1 : UInt8? = nil,

      _0 : N0? = nil
    ) : self
      value = @value

      unless _15.nil?
        value = (value & 0x3fffffff_u32) |
                UInt32.new!(_15.to_int).&(0x3_u32) << 30
      end

      unless _14.nil?
        value = (value & 0xcfffffff_u32) |
                UInt32.new!(_14.to_int).&(0x3_u32) << 28
      end

      unless _13.nil?
        value = (value & 0xf3ffffff_u32) |
                UInt32.new!(_13.to_int).&(0x3_u32) << 26
      end

      unless _12.nil?
        value = (value & 0xfcffffff_u32) |
                UInt32.new!(_12.to_int).&(0x3_u32) << 24
      end

      unless _11.nil?
        value = (value & 0xff3fffff_u32) |
                UInt32.new!(_11.to_int).&(0x3_u32) << 22
      end

      unless _10.nil?
        value = (value & 0xffcfffff_u32) |
                UInt32.new!(_10.to_int).&(0x3_u32) << 20
      end

      unless _9.nil?
        value = (value & 0xfff3ffff_u32) |
                UInt32.new!(_9.to_int).&(0x3_u32) << 18
      end

      unless _8.nil?
        value = (value & 0xfffcffff_u32) |
                UInt32.new!(_8.to_int).&(0x3_u32) << 16
      end

      unless _7.nil?
        value = (value & 0xffff3fff_u32) |
                UInt32.new!(_7.to_int).&(0x3_u32) << 14
      end

      unless _6.nil?
        value = (value & 0xffffcfff_u32) |
                UInt32.new!(_6.to_int).&(0x3_u32) << 12
      end

      unless _5.nil?
        value = (value & 0xfffff3ff_u32) |
                UInt32.new!(_5.to_int).&(0x3_u32) << 10
      end

      unless _4.nil?
        value = (value & 0xfffffcff_u32) |
                UInt32.new!(_4.to_int).&(0x3_u32) << 8
      end

      unless _3.nil?
        value = (value & 0xffffff3f_u32) |
                UInt32.new!(_3.to_int).&(0x3_u32) << 6
      end

      unless _2.nil?
        value = (value & 0xffffffcf_u32) |
                UInt32.new!(_2.to_int).&(0x3_u32) << 4
      end

      unless _1.nil?
        value = (value & 0xfffffff3_u32) |
                UInt32.new!(_1.to_int).&(0x3_u32) << 2
      end

      unless _0.nil?
        value = (value & 0xfffffffc_u32) |
                UInt32.new!(_0.to_int).&(0x3_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      _15 : UInt8? = nil,
      _14 : UInt8? = nil,
      _13 : UInt8? = nil,
      _12 : UInt8? = nil,
      _11 : UInt8? = nil,
      _10 : UInt8? = nil,
      _9 : UInt8? = nil,
      _8 : UInt8? = nil,
      _7 : UInt8? = nil,
      _6 : UInt8? = nil,
      _5 : UInt8? = nil,
      _4 : UInt8? = nil,
      _3 : UInt8? = nil,
      _2 : UInt8? = nil,
      _1 : UInt8? = nil,
      _0 : N0? = nil
    ) : Nil
      self.value = self.value.copy_with(
        _15: _15,
        _14: _14,
        _13: _13,
        _12: _12,
        _11: _11,
        _10: _10,
        _9: _9,
        _8: _8,
        _7: _7,
        _6: _6,
        _5: _5,
        _4: _4,
        _3: _3,
        _2: _2,
        _1: _1,
        _0: _0,
      )
    end
  end # struct

  # GPIO port output type register
  struct OTYPER
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

    # Port x configuration bit              15
    def ot15 : Bool
      @value.bits_set?(0x8000_u32)
    end

    # Port x configuration bit              15
    def self.ot15 : Bool
      value.ot15
    end

    # Port x configuration bit              15
    def self.ot15=(value : Bool) : Bool
      self.set(ot15: value)
      value
    end

    # Port x configuration bit              14
    def ot14 : Bool
      @value.bits_set?(0x4000_u32)
    end

    # Port x configuration bit              14
    def self.ot14 : Bool
      value.ot14
    end

    # Port x configuration bit              14
    def self.ot14=(value : Bool) : Bool
      self.set(ot14: value)
      value
    end

    # Port x configuration bit              13
    def ot13 : Bool
      @value.bits_set?(0x2000_u32)
    end

    # Port x configuration bit              13
    def self.ot13 : Bool
      value.ot13
    end

    # Port x configuration bit              13
    def self.ot13=(value : Bool) : Bool
      self.set(ot13: value)
      value
    end

    # Port x configuration bit              12
    def ot12 : Bool
      @value.bits_set?(0x1000_u32)
    end

    # Port x configuration bit              12
    def self.ot12 : Bool
      value.ot12
    end

    # Port x configuration bit              12
    def self.ot12=(value : Bool) : Bool
      self.set(ot12: value)
      value
    end

    # Port x configuration bit              11
    def ot11 : Bool
      @value.bits_set?(0x800_u32)
    end

    # Port x configuration bit              11
    def self.ot11 : Bool
      value.ot11
    end

    # Port x configuration bit              11
    def self.ot11=(value : Bool) : Bool
      self.set(ot11: value)
      value
    end

    # Port x configuration bit              10
    def ot10 : Bool
      @value.bits_set?(0x400_u32)
    end

    # Port x configuration bit              10
    def self.ot10 : Bool
      value.ot10
    end

    # Port x configuration bit              10
    def self.ot10=(value : Bool) : Bool
      self.set(ot10: value)
      value
    end

    # Port x configuration bit 9
    def ot9 : Bool
      @value.bits_set?(0x200_u32)
    end

    # Port x configuration bit 9
    def self.ot9 : Bool
      value.ot9
    end

    # Port x configuration bit 9
    def self.ot9=(value : Bool) : Bool
      self.set(ot9: value)
      value
    end

    # Port x configuration bit 8
    def ot8 : Bool
      @value.bits_set?(0x100_u32)
    end

    # Port x configuration bit 8
    def self.ot8 : Bool
      value.ot8
    end

    # Port x configuration bit 8
    def self.ot8=(value : Bool) : Bool
      self.set(ot8: value)
      value
    end

    # Port x configuration bit 7
    def ot7 : Bool
      @value.bits_set?(0x80_u32)
    end

    # Port x configuration bit 7
    def self.ot7 : Bool
      value.ot7
    end

    # Port x configuration bit 7
    def self.ot7=(value : Bool) : Bool
      self.set(ot7: value)
      value
    end

    # Port x configuration bit 6
    def ot6 : Bool
      @value.bits_set?(0x40_u32)
    end

    # Port x configuration bit 6
    def self.ot6 : Bool
      value.ot6
    end

    # Port x configuration bit 6
    def self.ot6=(value : Bool) : Bool
      self.set(ot6: value)
      value
    end

    # Port x configuration bit 5
    def ot5 : Bool
      @value.bits_set?(0x20_u32)
    end

    # Port x configuration bit 5
    def self.ot5 : Bool
      value.ot5
    end

    # Port x configuration bit 5
    def self.ot5=(value : Bool) : Bool
      self.set(ot5: value)
      value
    end

    # Port x configuration bit 4
    def ot4 : Bool
      @value.bits_set?(0x10_u32)
    end

    # Port x configuration bit 4
    def self.ot4 : Bool
      value.ot4
    end

    # Port x configuration bit 4
    def self.ot4=(value : Bool) : Bool
      self.set(ot4: value)
      value
    end

    # Port x configuration bit 3
    def ot3 : Bool
      @value.bits_set?(0x8_u32)
    end

    # Port x configuration bit 3
    def self.ot3 : Bool
      value.ot3
    end

    # Port x configuration bit 3
    def self.ot3=(value : Bool) : Bool
      self.set(ot3: value)
      value
    end

    # Port x configuration bit 2
    def ot2 : Bool
      @value.bits_set?(0x4_u32)
    end

    # Port x configuration bit 2
    def self.ot2 : Bool
      value.ot2
    end

    # Port x configuration bit 2
    def self.ot2=(value : Bool) : Bool
      self.set(ot2: value)
      value
    end

    # Port x configuration bit 1
    def ot1 : Bool
      @value.bits_set?(0x2_u32)
    end

    # Port x configuration bit 1
    def self.ot1 : Bool
      value.ot1
    end

    # Port x configuration bit 1
    def self.ot1=(value : Bool) : Bool
      self.set(ot1: value)
      value
    end

    enum OT0 : UInt8
      # Output push-pull (reset state)
      PUSHPULL = 0x0_u64

      # Output open-drain
      OPENDRAIN = 0x1_u64

      def self.reset_value : OT0
        OTYPER.reset_value.ot0
      end
    end

    # Port x configuration bit 0
    def ot0 : OT0
      OT0.new!((@value >> 0) & 0x1_u32)
    end

    # Port x configuration bit 0
    def self.ot0 : OT0
      value.ot0
    end

    # Port x configuration bit 0
    def self.ot0=(value : OT0) : OT0
      self.set(ot0: value)
      value
    end

    def copy_with(
      *,

      ot15 : Bool? = nil,

      ot14 : Bool? = nil,

      ot13 : Bool? = nil,

      ot12 : Bool? = nil,

      ot11 : Bool? = nil,

      ot10 : Bool? = nil,

      ot9 : Bool? = nil,

      ot8 : Bool? = nil,

      ot7 : Bool? = nil,

      ot6 : Bool? = nil,

      ot5 : Bool? = nil,

      ot4 : Bool? = nil,

      ot3 : Bool? = nil,

      ot2 : Bool? = nil,

      ot1 : Bool? = nil,

      ot0 : OT0? = nil
    ) : self
      value = @value

      unless ot15.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(ot15.to_int).&(0x1_u32) << 15
      end

      unless ot14.nil?
        value = (value & 0xffffbfff_u32) |
                UInt32.new!(ot14.to_int).&(0x1_u32) << 14
      end

      unless ot13.nil?
        value = (value & 0xffffdfff_u32) |
                UInt32.new!(ot13.to_int).&(0x1_u32) << 13
      end

      unless ot12.nil?
        value = (value & 0xffffefff_u32) |
                UInt32.new!(ot12.to_int).&(0x1_u32) << 12
      end

      unless ot11.nil?
        value = (value & 0xfffff7ff_u32) |
                UInt32.new!(ot11.to_int).&(0x1_u32) << 11
      end

      unless ot10.nil?
        value = (value & 0xfffffbff_u32) |
                UInt32.new!(ot10.to_int).&(0x1_u32) << 10
      end

      unless ot9.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(ot9.to_int).&(0x1_u32) << 9
      end

      unless ot8.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(ot8.to_int).&(0x1_u32) << 8
      end

      unless ot7.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(ot7.to_int).&(0x1_u32) << 7
      end

      unless ot6.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(ot6.to_int).&(0x1_u32) << 6
      end

      unless ot5.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(ot5.to_int).&(0x1_u32) << 5
      end

      unless ot4.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(ot4.to_int).&(0x1_u32) << 4
      end

      unless ot3.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(ot3.to_int).&(0x1_u32) << 3
      end

      unless ot2.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(ot2.to_int).&(0x1_u32) << 2
      end

      unless ot1.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(ot1.to_int).&(0x1_u32) << 1
      end

      unless ot0.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(ot0.to_int).&(0x1_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      ot15 : Bool? = nil,
      ot14 : Bool? = nil,
      ot13 : Bool? = nil,
      ot12 : Bool? = nil,
      ot11 : Bool? = nil,
      ot10 : Bool? = nil,
      ot9 : Bool? = nil,
      ot8 : Bool? = nil,
      ot7 : Bool? = nil,
      ot6 : Bool? = nil,
      ot5 : Bool? = nil,
      ot4 : Bool? = nil,
      ot3 : Bool? = nil,
      ot2 : Bool? = nil,
      ot1 : Bool? = nil,
      ot0 : OT0? = nil
    ) : Nil
      self.value = self.value.copy_with(
        ot15: ot15,
        ot14: ot14,
        ot13: ot13,
        ot12: ot12,
        ot11: ot11,
        ot10: ot10,
        ot9: ot9,
        ot8: ot8,
        ot7: ot7,
        ot6: ot6,
        ot5: ot5,
        ot4: ot4,
        ot3: ot3,
        ot2: ot2,
        ot1: ot1,
        ot0: ot0,
      )
    end
  end # struct

  # GPIO port output speed          register
  struct OSPEEDR
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
      new(0xc0_u64)
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

    # Port x configuration bits (y =              0..15)
    def _15 : UInt8
      UInt8.new!((@value >> 30) & 0x3_u32)
    end

    # Port x configuration bits (y =              0..15)
    def self._15 : UInt8
      value._15
    end

    # Port x configuration bits (y =              0..15)
    def self._15=(value : UInt8) : UInt8
      self.set(_15: value)
      value
    end

    # Port x configuration bits (y =              0..15)
    def _14 : UInt8
      UInt8.new!((@value >> 28) & 0x3_u32)
    end

    # Port x configuration bits (y =              0..15)
    def self._14 : UInt8
      value._14
    end

    # Port x configuration bits (y =              0..15)
    def self._14=(value : UInt8) : UInt8
      self.set(_14: value)
      value
    end

    # Port x configuration bits (y =              0..15)
    def _13 : UInt8
      UInt8.new!((@value >> 26) & 0x3_u32)
    end

    # Port x configuration bits (y =              0..15)
    def self._13 : UInt8
      value._13
    end

    # Port x configuration bits (y =              0..15)
    def self._13=(value : UInt8) : UInt8
      self.set(_13: value)
      value
    end

    # Port x configuration bits (y =              0..15)
    def _12 : UInt8
      UInt8.new!((@value >> 24) & 0x3_u32)
    end

    # Port x configuration bits (y =              0..15)
    def self._12 : UInt8
      value._12
    end

    # Port x configuration bits (y =              0..15)
    def self._12=(value : UInt8) : UInt8
      self.set(_12: value)
      value
    end

    # Port x configuration bits (y =              0..15)
    def _11 : UInt8
      UInt8.new!((@value >> 22) & 0x3_u32)
    end

    # Port x configuration bits (y =              0..15)
    def self._11 : UInt8
      value._11
    end

    # Port x configuration bits (y =              0..15)
    def self._11=(value : UInt8) : UInt8
      self.set(_11: value)
      value
    end

    # Port x configuration bits (y =              0..15)
    def _10 : UInt8
      UInt8.new!((@value >> 20) & 0x3_u32)
    end

    # Port x configuration bits (y =              0..15)
    def self._10 : UInt8
      value._10
    end

    # Port x configuration bits (y =              0..15)
    def self._10=(value : UInt8) : UInt8
      self.set(_10: value)
      value
    end

    # Port x configuration bits (y =              0..15)
    def _9 : UInt8
      UInt8.new!((@value >> 18) & 0x3_u32)
    end

    # Port x configuration bits (y =              0..15)
    def self._9 : UInt8
      value._9
    end

    # Port x configuration bits (y =              0..15)
    def self._9=(value : UInt8) : UInt8
      self.set(_9: value)
      value
    end

    # Port x configuration bits (y =              0..15)
    def _8 : UInt8
      UInt8.new!((@value >> 16) & 0x3_u32)
    end

    # Port x configuration bits (y =              0..15)
    def self._8 : UInt8
      value._8
    end

    # Port x configuration bits (y =              0..15)
    def self._8=(value : UInt8) : UInt8
      self.set(_8: value)
      value
    end

    # Port x configuration bits (y =              0..15)
    def _7 : UInt8
      UInt8.new!((@value >> 14) & 0x3_u32)
    end

    # Port x configuration bits (y =              0..15)
    def self._7 : UInt8
      value._7
    end

    # Port x configuration bits (y =              0..15)
    def self._7=(value : UInt8) : UInt8
      self.set(_7: value)
      value
    end

    # Port x configuration bits (y =              0..15)
    def _6 : UInt8
      UInt8.new!((@value >> 12) & 0x3_u32)
    end

    # Port x configuration bits (y =              0..15)
    def self._6 : UInt8
      value._6
    end

    # Port x configuration bits (y =              0..15)
    def self._6=(value : UInt8) : UInt8
      self.set(_6: value)
      value
    end

    # Port x configuration bits (y =              0..15)
    def _5 : UInt8
      UInt8.new!((@value >> 10) & 0x3_u32)
    end

    # Port x configuration bits (y =              0..15)
    def self._5 : UInt8
      value._5
    end

    # Port x configuration bits (y =              0..15)
    def self._5=(value : UInt8) : UInt8
      self.set(_5: value)
      value
    end

    # Port x configuration bits (y =              0..15)
    def _4 : UInt8
      UInt8.new!((@value >> 8) & 0x3_u32)
    end

    # Port x configuration bits (y =              0..15)
    def self._4 : UInt8
      value._4
    end

    # Port x configuration bits (y =              0..15)
    def self._4=(value : UInt8) : UInt8
      self.set(_4: value)
      value
    end

    # Port x configuration bits (y =              0..15)
    def _3 : UInt8
      UInt8.new!((@value >> 6) & 0x3_u32)
    end

    # Port x configuration bits (y =              0..15)
    def self._3 : UInt8
      value._3
    end

    # Port x configuration bits (y =              0..15)
    def self._3=(value : UInt8) : UInt8
      self.set(_3: value)
      value
    end

    # Port x configuration bits (y =              0..15)
    def _2 : UInt8
      UInt8.new!((@value >> 4) & 0x3_u32)
    end

    # Port x configuration bits (y =              0..15)
    def self._2 : UInt8
      value._2
    end

    # Port x configuration bits (y =              0..15)
    def self._2=(value : UInt8) : UInt8
      self.set(_2: value)
      value
    end

    # Port x configuration bits (y =              0..15)
    def _1 : UInt8
      UInt8.new!((@value >> 2) & 0x3_u32)
    end

    # Port x configuration bits (y =              0..15)
    def self._1 : UInt8
      value._1
    end

    # Port x configuration bits (y =              0..15)
    def self._1=(value : UInt8) : UInt8
      self.set(_1: value)
      value
    end

    enum N0 : UInt8
      # Low speed
      LOWSPEED = 0x0_u64

      # Medium speed
      MEDIUMSPEED = 0x1_u64

      # High speed
      HIGHSPEED = 0x3_u64

      def self.reset_value : N0
        OSPEEDR.reset_value._0
      end
    end

    # Port x configuration bits (y =              0..15)
    def _0 : N0
      N0.new!((@value >> 0) & 0x3_u32)
    end

    # Port x configuration bits (y =              0..15)
    def self._0 : N0
      value._0
    end

    # Port x configuration bits (y =              0..15)
    def self._0=(value : N0) : N0
      self.set(_0: value)
      value
    end

    def copy_with(
      *,

      _15 : UInt8? = nil,

      _14 : UInt8? = nil,

      _13 : UInt8? = nil,

      _12 : UInt8? = nil,

      _11 : UInt8? = nil,

      _10 : UInt8? = nil,

      _9 : UInt8? = nil,

      _8 : UInt8? = nil,

      _7 : UInt8? = nil,

      _6 : UInt8? = nil,

      _5 : UInt8? = nil,

      _4 : UInt8? = nil,

      _3 : UInt8? = nil,

      _2 : UInt8? = nil,

      _1 : UInt8? = nil,

      _0 : N0? = nil
    ) : self
      value = @value

      unless _15.nil?
        value = (value & 0x3fffffff_u32) |
                UInt32.new!(_15.to_int).&(0x3_u32) << 30
      end

      unless _14.nil?
        value = (value & 0xcfffffff_u32) |
                UInt32.new!(_14.to_int).&(0x3_u32) << 28
      end

      unless _13.nil?
        value = (value & 0xf3ffffff_u32) |
                UInt32.new!(_13.to_int).&(0x3_u32) << 26
      end

      unless _12.nil?
        value = (value & 0xfcffffff_u32) |
                UInt32.new!(_12.to_int).&(0x3_u32) << 24
      end

      unless _11.nil?
        value = (value & 0xff3fffff_u32) |
                UInt32.new!(_11.to_int).&(0x3_u32) << 22
      end

      unless _10.nil?
        value = (value & 0xffcfffff_u32) |
                UInt32.new!(_10.to_int).&(0x3_u32) << 20
      end

      unless _9.nil?
        value = (value & 0xfff3ffff_u32) |
                UInt32.new!(_9.to_int).&(0x3_u32) << 18
      end

      unless _8.nil?
        value = (value & 0xfffcffff_u32) |
                UInt32.new!(_8.to_int).&(0x3_u32) << 16
      end

      unless _7.nil?
        value = (value & 0xffff3fff_u32) |
                UInt32.new!(_7.to_int).&(0x3_u32) << 14
      end

      unless _6.nil?
        value = (value & 0xffffcfff_u32) |
                UInt32.new!(_6.to_int).&(0x3_u32) << 12
      end

      unless _5.nil?
        value = (value & 0xfffff3ff_u32) |
                UInt32.new!(_5.to_int).&(0x3_u32) << 10
      end

      unless _4.nil?
        value = (value & 0xfffffcff_u32) |
                UInt32.new!(_4.to_int).&(0x3_u32) << 8
      end

      unless _3.nil?
        value = (value & 0xffffff3f_u32) |
                UInt32.new!(_3.to_int).&(0x3_u32) << 6
      end

      unless _2.nil?
        value = (value & 0xffffffcf_u32) |
                UInt32.new!(_2.to_int).&(0x3_u32) << 4
      end

      unless _1.nil?
        value = (value & 0xfffffff3_u32) |
                UInt32.new!(_1.to_int).&(0x3_u32) << 2
      end

      unless _0.nil?
        value = (value & 0xfffffffc_u32) |
                UInt32.new!(_0.to_int).&(0x3_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      _15 : UInt8? = nil,
      _14 : UInt8? = nil,
      _13 : UInt8? = nil,
      _12 : UInt8? = nil,
      _11 : UInt8? = nil,
      _10 : UInt8? = nil,
      _9 : UInt8? = nil,
      _8 : UInt8? = nil,
      _7 : UInt8? = nil,
      _6 : UInt8? = nil,
      _5 : UInt8? = nil,
      _4 : UInt8? = nil,
      _3 : UInt8? = nil,
      _2 : UInt8? = nil,
      _1 : UInt8? = nil,
      _0 : N0? = nil
    ) : Nil
      self.value = self.value.copy_with(
        _15: _15,
        _14: _14,
        _13: _13,
        _12: _12,
        _11: _11,
        _10: _10,
        _9: _9,
        _8: _8,
        _7: _7,
        _6: _6,
        _5: _5,
        _4: _4,
        _3: _3,
        _2: _2,
        _1: _1,
        _0: _0,
      )
    end
  end # struct

  # GPIO port pull-up/pull-down          register
  struct PUPDR
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
      new(0x100_u64)
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

    # Port x configuration bits (y =              0..15)
    def _15 : UInt8
      UInt8.new!((@value >> 30) & 0x3_u32)
    end

    # Port x configuration bits (y =              0..15)
    def self._15 : UInt8
      value._15
    end

    # Port x configuration bits (y =              0..15)
    def self._15=(value : UInt8) : UInt8
      self.set(_15: value)
      value
    end

    # Port x configuration bits (y =              0..15)
    def _14 : UInt8
      UInt8.new!((@value >> 28) & 0x3_u32)
    end

    # Port x configuration bits (y =              0..15)
    def self._14 : UInt8
      value._14
    end

    # Port x configuration bits (y =              0..15)
    def self._14=(value : UInt8) : UInt8
      self.set(_14: value)
      value
    end

    # Port x configuration bits (y =              0..15)
    def _13 : UInt8
      UInt8.new!((@value >> 26) & 0x3_u32)
    end

    # Port x configuration bits (y =              0..15)
    def self._13 : UInt8
      value._13
    end

    # Port x configuration bits (y =              0..15)
    def self._13=(value : UInt8) : UInt8
      self.set(_13: value)
      value
    end

    # Port x configuration bits (y =              0..15)
    def _12 : UInt8
      UInt8.new!((@value >> 24) & 0x3_u32)
    end

    # Port x configuration bits (y =              0..15)
    def self._12 : UInt8
      value._12
    end

    # Port x configuration bits (y =              0..15)
    def self._12=(value : UInt8) : UInt8
      self.set(_12: value)
      value
    end

    # Port x configuration bits (y =              0..15)
    def _11 : UInt8
      UInt8.new!((@value >> 22) & 0x3_u32)
    end

    # Port x configuration bits (y =              0..15)
    def self._11 : UInt8
      value._11
    end

    # Port x configuration bits (y =              0..15)
    def self._11=(value : UInt8) : UInt8
      self.set(_11: value)
      value
    end

    # Port x configuration bits (y =              0..15)
    def _10 : UInt8
      UInt8.new!((@value >> 20) & 0x3_u32)
    end

    # Port x configuration bits (y =              0..15)
    def self._10 : UInt8
      value._10
    end

    # Port x configuration bits (y =              0..15)
    def self._10=(value : UInt8) : UInt8
      self.set(_10: value)
      value
    end

    # Port x configuration bits (y =              0..15)
    def _9 : UInt8
      UInt8.new!((@value >> 18) & 0x3_u32)
    end

    # Port x configuration bits (y =              0..15)
    def self._9 : UInt8
      value._9
    end

    # Port x configuration bits (y =              0..15)
    def self._9=(value : UInt8) : UInt8
      self.set(_9: value)
      value
    end

    # Port x configuration bits (y =              0..15)
    def _8 : UInt8
      UInt8.new!((@value >> 16) & 0x3_u32)
    end

    # Port x configuration bits (y =              0..15)
    def self._8 : UInt8
      value._8
    end

    # Port x configuration bits (y =              0..15)
    def self._8=(value : UInt8) : UInt8
      self.set(_8: value)
      value
    end

    # Port x configuration bits (y =              0..15)
    def _7 : UInt8
      UInt8.new!((@value >> 14) & 0x3_u32)
    end

    # Port x configuration bits (y =              0..15)
    def self._7 : UInt8
      value._7
    end

    # Port x configuration bits (y =              0..15)
    def self._7=(value : UInt8) : UInt8
      self.set(_7: value)
      value
    end

    # Port x configuration bits (y =              0..15)
    def _6 : UInt8
      UInt8.new!((@value >> 12) & 0x3_u32)
    end

    # Port x configuration bits (y =              0..15)
    def self._6 : UInt8
      value._6
    end

    # Port x configuration bits (y =              0..15)
    def self._6=(value : UInt8) : UInt8
      self.set(_6: value)
      value
    end

    # Port x configuration bits (y =              0..15)
    def _5 : UInt8
      UInt8.new!((@value >> 10) & 0x3_u32)
    end

    # Port x configuration bits (y =              0..15)
    def self._5 : UInt8
      value._5
    end

    # Port x configuration bits (y =              0..15)
    def self._5=(value : UInt8) : UInt8
      self.set(_5: value)
      value
    end

    # Port x configuration bits (y =              0..15)
    def _4 : UInt8
      UInt8.new!((@value >> 8) & 0x3_u32)
    end

    # Port x configuration bits (y =              0..15)
    def self._4 : UInt8
      value._4
    end

    # Port x configuration bits (y =              0..15)
    def self._4=(value : UInt8) : UInt8
      self.set(_4: value)
      value
    end

    # Port x configuration bits (y =              0..15)
    def _3 : UInt8
      UInt8.new!((@value >> 6) & 0x3_u32)
    end

    # Port x configuration bits (y =              0..15)
    def self._3 : UInt8
      value._3
    end

    # Port x configuration bits (y =              0..15)
    def self._3=(value : UInt8) : UInt8
      self.set(_3: value)
      value
    end

    # Port x configuration bits (y =              0..15)
    def _2 : UInt8
      UInt8.new!((@value >> 4) & 0x3_u32)
    end

    # Port x configuration bits (y =              0..15)
    def self._2 : UInt8
      value._2
    end

    # Port x configuration bits (y =              0..15)
    def self._2=(value : UInt8) : UInt8
      self.set(_2: value)
      value
    end

    # Port x configuration bits (y =              0..15)
    def _1 : UInt8
      UInt8.new!((@value >> 2) & 0x3_u32)
    end

    # Port x configuration bits (y =              0..15)
    def self._1 : UInt8
      value._1
    end

    # Port x configuration bits (y =              0..15)
    def self._1=(value : UInt8) : UInt8
      self.set(_1: value)
      value
    end

    enum N0 : UInt8
      # No pull-up, pull-down
      FLOATING = 0x0_u64

      # Pull-up
      PULLUP = 0x1_u64

      # Pull-down
      PULLDOWN = 0x2_u64

      def self.reset_value : N0
        PUPDR.reset_value._0
      end
    end

    # Port x configuration bits (y =              0..15)
    def _0 : N0
      N0.new!((@value >> 0) & 0x3_u32)
    end

    # Port x configuration bits (y =              0..15)
    def self._0 : N0
      value._0
    end

    # Port x configuration bits (y =              0..15)
    def self._0=(value : N0) : N0
      self.set(_0: value)
      value
    end

    def copy_with(
      *,

      _15 : UInt8? = nil,

      _14 : UInt8? = nil,

      _13 : UInt8? = nil,

      _12 : UInt8? = nil,

      _11 : UInt8? = nil,

      _10 : UInt8? = nil,

      _9 : UInt8? = nil,

      _8 : UInt8? = nil,

      _7 : UInt8? = nil,

      _6 : UInt8? = nil,

      _5 : UInt8? = nil,

      _4 : UInt8? = nil,

      _3 : UInt8? = nil,

      _2 : UInt8? = nil,

      _1 : UInt8? = nil,

      _0 : N0? = nil
    ) : self
      value = @value

      unless _15.nil?
        value = (value & 0x3fffffff_u32) |
                UInt32.new!(_15.to_int).&(0x3_u32) << 30
      end

      unless _14.nil?
        value = (value & 0xcfffffff_u32) |
                UInt32.new!(_14.to_int).&(0x3_u32) << 28
      end

      unless _13.nil?
        value = (value & 0xf3ffffff_u32) |
                UInt32.new!(_13.to_int).&(0x3_u32) << 26
      end

      unless _12.nil?
        value = (value & 0xfcffffff_u32) |
                UInt32.new!(_12.to_int).&(0x3_u32) << 24
      end

      unless _11.nil?
        value = (value & 0xff3fffff_u32) |
                UInt32.new!(_11.to_int).&(0x3_u32) << 22
      end

      unless _10.nil?
        value = (value & 0xffcfffff_u32) |
                UInt32.new!(_10.to_int).&(0x3_u32) << 20
      end

      unless _9.nil?
        value = (value & 0xfff3ffff_u32) |
                UInt32.new!(_9.to_int).&(0x3_u32) << 18
      end

      unless _8.nil?
        value = (value & 0xfffcffff_u32) |
                UInt32.new!(_8.to_int).&(0x3_u32) << 16
      end

      unless _7.nil?
        value = (value & 0xffff3fff_u32) |
                UInt32.new!(_7.to_int).&(0x3_u32) << 14
      end

      unless _6.nil?
        value = (value & 0xffffcfff_u32) |
                UInt32.new!(_6.to_int).&(0x3_u32) << 12
      end

      unless _5.nil?
        value = (value & 0xfffff3ff_u32) |
                UInt32.new!(_5.to_int).&(0x3_u32) << 10
      end

      unless _4.nil?
        value = (value & 0xfffffcff_u32) |
                UInt32.new!(_4.to_int).&(0x3_u32) << 8
      end

      unless _3.nil?
        value = (value & 0xffffff3f_u32) |
                UInt32.new!(_3.to_int).&(0x3_u32) << 6
      end

      unless _2.nil?
        value = (value & 0xffffffcf_u32) |
                UInt32.new!(_2.to_int).&(0x3_u32) << 4
      end

      unless _1.nil?
        value = (value & 0xfffffff3_u32) |
                UInt32.new!(_1.to_int).&(0x3_u32) << 2
      end

      unless _0.nil?
        value = (value & 0xfffffffc_u32) |
                UInt32.new!(_0.to_int).&(0x3_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      _15 : UInt8? = nil,
      _14 : UInt8? = nil,
      _13 : UInt8? = nil,
      _12 : UInt8? = nil,
      _11 : UInt8? = nil,
      _10 : UInt8? = nil,
      _9 : UInt8? = nil,
      _8 : UInt8? = nil,
      _7 : UInt8? = nil,
      _6 : UInt8? = nil,
      _5 : UInt8? = nil,
      _4 : UInt8? = nil,
      _3 : UInt8? = nil,
      _2 : UInt8? = nil,
      _1 : UInt8? = nil,
      _0 : N0? = nil
    ) : Nil
      self.value = self.value.copy_with(
        _15: _15,
        _14: _14,
        _13: _13,
        _12: _12,
        _11: _11,
        _10: _10,
        _9: _9,
        _8: _8,
        _7: _7,
        _6: _6,
        _5: _5,
        _4: _4,
        _3: _3,
        _2: _2,
        _1: _1,
        _0: _0,
      )
    end
  end # struct

  # GPIO port input data register
  struct IDR
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

    # Port input data (y =              0..15)
    def _15 : Bool
      @value.bits_set?(0x8000_u32)
    end

    # Port input data (y =              0..15)
    def self._15 : Bool
      value._15
    end

    # Port input data (y =              0..15)
    def _14 : Bool
      @value.bits_set?(0x4000_u32)
    end

    # Port input data (y =              0..15)
    def self._14 : Bool
      value._14
    end

    # Port input data (y =              0..15)
    def _13 : Bool
      @value.bits_set?(0x2000_u32)
    end

    # Port input data (y =              0..15)
    def self._13 : Bool
      value._13
    end

    # Port input data (y =              0..15)
    def _12 : Bool
      @value.bits_set?(0x1000_u32)
    end

    # Port input data (y =              0..15)
    def self._12 : Bool
      value._12
    end

    # Port input data (y =              0..15)
    def _11 : Bool
      @value.bits_set?(0x800_u32)
    end

    # Port input data (y =              0..15)
    def self._11 : Bool
      value._11
    end

    # Port input data (y =              0..15)
    def _10 : Bool
      @value.bits_set?(0x400_u32)
    end

    # Port input data (y =              0..15)
    def self._10 : Bool
      value._10
    end

    # Port input data (y =              0..15)
    def _9 : Bool
      @value.bits_set?(0x200_u32)
    end

    # Port input data (y =              0..15)
    def self._9 : Bool
      value._9
    end

    # Port input data (y =              0..15)
    def _8 : Bool
      @value.bits_set?(0x100_u32)
    end

    # Port input data (y =              0..15)
    def self._8 : Bool
      value._8
    end

    # Port input data (y =              0..15)
    def _7 : Bool
      @value.bits_set?(0x80_u32)
    end

    # Port input data (y =              0..15)
    def self._7 : Bool
      value._7
    end

    # Port input data (y =              0..15)
    def _6 : Bool
      @value.bits_set?(0x40_u32)
    end

    # Port input data (y =              0..15)
    def self._6 : Bool
      value._6
    end

    # Port input data (y =              0..15)
    def _5 : Bool
      @value.bits_set?(0x20_u32)
    end

    # Port input data (y =              0..15)
    def self._5 : Bool
      value._5
    end

    # Port input data (y =              0..15)
    def _4 : Bool
      @value.bits_set?(0x10_u32)
    end

    # Port input data (y =              0..15)
    def self._4 : Bool
      value._4
    end

    # Port input data (y =              0..15)
    def _3 : Bool
      @value.bits_set?(0x8_u32)
    end

    # Port input data (y =              0..15)
    def self._3 : Bool
      value._3
    end

    # Port input data (y =              0..15)
    def _2 : Bool
      @value.bits_set?(0x4_u32)
    end

    # Port input data (y =              0..15)
    def self._2 : Bool
      value._2
    end

    # Port input data (y =              0..15)
    def _1 : Bool
      @value.bits_set?(0x2_u32)
    end

    # Port input data (y =              0..15)
    def self._1 : Bool
      value._1
    end

    enum N0 : UInt8
      # Input is logic high
      HIGH = 0x1_u64

      # Input is logic low
      LOW = 0x0_u64

      def self.reset_value : N0
        IDR.reset_value._0
      end
    end

    # Port input data (y =              0..15)
    def _0 : N0
      N0.new!((@value >> 0) & 0x1_u32)
    end

    # Port input data (y =              0..15)
    def self._0 : N0
      value._0
    end
  end # struct

  # GPIO port output data register
  struct ODR
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

    # Port output data (y =              0..15)
    def _15 : Bool
      @value.bits_set?(0x8000_u32)
    end

    # Port output data (y =              0..15)
    def self._15 : Bool
      value._15
    end

    # Port output data (y =              0..15)
    def self._15=(value : Bool) : Bool
      self.set(_15: value)
      value
    end

    # Port output data (y =              0..15)
    def _14 : Bool
      @value.bits_set?(0x4000_u32)
    end

    # Port output data (y =              0..15)
    def self._14 : Bool
      value._14
    end

    # Port output data (y =              0..15)
    def self._14=(value : Bool) : Bool
      self.set(_14: value)
      value
    end

    # Port output data (y =              0..15)
    def _13 : Bool
      @value.bits_set?(0x2000_u32)
    end

    # Port output data (y =              0..15)
    def self._13 : Bool
      value._13
    end

    # Port output data (y =              0..15)
    def self._13=(value : Bool) : Bool
      self.set(_13: value)
      value
    end

    # Port output data (y =              0..15)
    def _12 : Bool
      @value.bits_set?(0x1000_u32)
    end

    # Port output data (y =              0..15)
    def self._12 : Bool
      value._12
    end

    # Port output data (y =              0..15)
    def self._12=(value : Bool) : Bool
      self.set(_12: value)
      value
    end

    # Port output data (y =              0..15)
    def _11 : Bool
      @value.bits_set?(0x800_u32)
    end

    # Port output data (y =              0..15)
    def self._11 : Bool
      value._11
    end

    # Port output data (y =              0..15)
    def self._11=(value : Bool) : Bool
      self.set(_11: value)
      value
    end

    # Port output data (y =              0..15)
    def _10 : Bool
      @value.bits_set?(0x400_u32)
    end

    # Port output data (y =              0..15)
    def self._10 : Bool
      value._10
    end

    # Port output data (y =              0..15)
    def self._10=(value : Bool) : Bool
      self.set(_10: value)
      value
    end

    # Port output data (y =              0..15)
    def _9 : Bool
      @value.bits_set?(0x200_u32)
    end

    # Port output data (y =              0..15)
    def self._9 : Bool
      value._9
    end

    # Port output data (y =              0..15)
    def self._9=(value : Bool) : Bool
      self.set(_9: value)
      value
    end

    # Port output data (y =              0..15)
    def _8 : Bool
      @value.bits_set?(0x100_u32)
    end

    # Port output data (y =              0..15)
    def self._8 : Bool
      value._8
    end

    # Port output data (y =              0..15)
    def self._8=(value : Bool) : Bool
      self.set(_8: value)
      value
    end

    # Port output data (y =              0..15)
    def _7 : Bool
      @value.bits_set?(0x80_u32)
    end

    # Port output data (y =              0..15)
    def self._7 : Bool
      value._7
    end

    # Port output data (y =              0..15)
    def self._7=(value : Bool) : Bool
      self.set(_7: value)
      value
    end

    # Port output data (y =              0..15)
    def _6 : Bool
      @value.bits_set?(0x40_u32)
    end

    # Port output data (y =              0..15)
    def self._6 : Bool
      value._6
    end

    # Port output data (y =              0..15)
    def self._6=(value : Bool) : Bool
      self.set(_6: value)
      value
    end

    # Port output data (y =              0..15)
    def _5 : Bool
      @value.bits_set?(0x20_u32)
    end

    # Port output data (y =              0..15)
    def self._5 : Bool
      value._5
    end

    # Port output data (y =              0..15)
    def self._5=(value : Bool) : Bool
      self.set(_5: value)
      value
    end

    # Port output data (y =              0..15)
    def _4 : Bool
      @value.bits_set?(0x10_u32)
    end

    # Port output data (y =              0..15)
    def self._4 : Bool
      value._4
    end

    # Port output data (y =              0..15)
    def self._4=(value : Bool) : Bool
      self.set(_4: value)
      value
    end

    # Port output data (y =              0..15)
    def _3 : Bool
      @value.bits_set?(0x8_u32)
    end

    # Port output data (y =              0..15)
    def self._3 : Bool
      value._3
    end

    # Port output data (y =              0..15)
    def self._3=(value : Bool) : Bool
      self.set(_3: value)
      value
    end

    # Port output data (y =              0..15)
    def _2 : Bool
      @value.bits_set?(0x4_u32)
    end

    # Port output data (y =              0..15)
    def self._2 : Bool
      value._2
    end

    # Port output data (y =              0..15)
    def self._2=(value : Bool) : Bool
      self.set(_2: value)
      value
    end

    # Port output data (y =              0..15)
    def _1 : Bool
      @value.bits_set?(0x2_u32)
    end

    # Port output data (y =              0..15)
    def self._1 : Bool
      value._1
    end

    # Port output data (y =              0..15)
    def self._1=(value : Bool) : Bool
      self.set(_1: value)
      value
    end

    enum N0 : UInt8
      # Set output to logic high
      HIGH = 0x1_u64

      # Set output to logic low
      LOW = 0x0_u64

      def self.reset_value : N0
        ODR.reset_value._0
      end
    end

    # Port output data (y =              0..15)
    def _0 : N0
      N0.new!((@value >> 0) & 0x1_u32)
    end

    # Port output data (y =              0..15)
    def self._0 : N0
      value._0
    end

    # Port output data (y =              0..15)
    def self._0=(value : N0) : N0
      self.set(_0: value)
      value
    end

    def copy_with(
      *,

      _15 : Bool? = nil,

      _14 : Bool? = nil,

      _13 : Bool? = nil,

      _12 : Bool? = nil,

      _11 : Bool? = nil,

      _10 : Bool? = nil,

      _9 : Bool? = nil,

      _8 : Bool? = nil,

      _7 : Bool? = nil,

      _6 : Bool? = nil,

      _5 : Bool? = nil,

      _4 : Bool? = nil,

      _3 : Bool? = nil,

      _2 : Bool? = nil,

      _1 : Bool? = nil,

      _0 : N0? = nil
    ) : self
      value = @value

      unless _15.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(_15.to_int).&(0x1_u32) << 15
      end

      unless _14.nil?
        value = (value & 0xffffbfff_u32) |
                UInt32.new!(_14.to_int).&(0x1_u32) << 14
      end

      unless _13.nil?
        value = (value & 0xffffdfff_u32) |
                UInt32.new!(_13.to_int).&(0x1_u32) << 13
      end

      unless _12.nil?
        value = (value & 0xffffefff_u32) |
                UInt32.new!(_12.to_int).&(0x1_u32) << 12
      end

      unless _11.nil?
        value = (value & 0xfffff7ff_u32) |
                UInt32.new!(_11.to_int).&(0x1_u32) << 11
      end

      unless _10.nil?
        value = (value & 0xfffffbff_u32) |
                UInt32.new!(_10.to_int).&(0x1_u32) << 10
      end

      unless _9.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(_9.to_int).&(0x1_u32) << 9
      end

      unless _8.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(_8.to_int).&(0x1_u32) << 8
      end

      unless _7.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(_7.to_int).&(0x1_u32) << 7
      end

      unless _6.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(_6.to_int).&(0x1_u32) << 6
      end

      unless _5.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(_5.to_int).&(0x1_u32) << 5
      end

      unless _4.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(_4.to_int).&(0x1_u32) << 4
      end

      unless _3.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(_3.to_int).&(0x1_u32) << 3
      end

      unless _2.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(_2.to_int).&(0x1_u32) << 2
      end

      unless _1.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(_1.to_int).&(0x1_u32) << 1
      end

      unless _0.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(_0.to_int).&(0x1_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      _15 : Bool? = nil,
      _14 : Bool? = nil,
      _13 : Bool? = nil,
      _12 : Bool? = nil,
      _11 : Bool? = nil,
      _10 : Bool? = nil,
      _9 : Bool? = nil,
      _8 : Bool? = nil,
      _7 : Bool? = nil,
      _6 : Bool? = nil,
      _5 : Bool? = nil,
      _4 : Bool? = nil,
      _3 : Bool? = nil,
      _2 : Bool? = nil,
      _1 : Bool? = nil,
      _0 : N0? = nil
    ) : Nil
      self.value = self.value.copy_with(
        _15: _15,
        _14: _14,
        _13: _13,
        _12: _12,
        _11: _11,
        _10: _10,
        _9: _9,
        _8: _8,
        _7: _7,
        _6: _6,
        _5: _5,
        _4: _4,
        _3: _3,
        _2: _2,
        _1: _1,
        _0: _0,
      )
    end
  end # struct

  # GPIO port bit set/reset          register
  struct BSRR
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

    # Port x reset bit y (y =              0..15)
    def self.br15=(value : Bool) : Bool
      self.set(br15: value)
      value
    end

    # Port x reset bit y (y =              0..15)
    def self.br14=(value : Bool) : Bool
      self.set(br14: value)
      value
    end

    # Port x reset bit y (y =              0..15)
    def self.br13=(value : Bool) : Bool
      self.set(br13: value)
      value
    end

    # Port x reset bit y (y =              0..15)
    def self.br12=(value : Bool) : Bool
      self.set(br12: value)
      value
    end

    # Port x reset bit y (y =              0..15)
    def self.br11=(value : Bool) : Bool
      self.set(br11: value)
      value
    end

    # Port x reset bit y (y =              0..15)
    def self.br10=(value : Bool) : Bool
      self.set(br10: value)
      value
    end

    # Port x reset bit y (y =              0..15)
    def self.br9=(value : Bool) : Bool
      self.set(br9: value)
      value
    end

    # Port x reset bit y (y =              0..15)
    def self.br8=(value : Bool) : Bool
      self.set(br8: value)
      value
    end

    # Port x reset bit y (y =              0..15)
    def self.br7=(value : Bool) : Bool
      self.set(br7: value)
      value
    end

    # Port x reset bit y (y =              0..15)
    def self.br6=(value : Bool) : Bool
      self.set(br6: value)
      value
    end

    # Port x reset bit y (y =              0..15)
    def self.br5=(value : Bool) : Bool
      self.set(br5: value)
      value
    end

    # Port x reset bit y (y =              0..15)
    def self.br4=(value : Bool) : Bool
      self.set(br4: value)
      value
    end

    # Port x reset bit y (y =              0..15)
    def self.br3=(value : Bool) : Bool
      self.set(br3: value)
      value
    end

    # Port x reset bit y (y =              0..15)
    def self.br2=(value : Bool) : Bool
      self.set(br2: value)
      value
    end

    # Port x reset bit y (y =              0..15)
    def self.br1=(value : Bool) : Bool
      self.set(br1: value)
      value
    end

    enum BR0 : UInt8
      # Resets the corresponding ODRx bit
      RESET = 0x1_u64

      def self.reset_value : BR0
        BSRR.reset_value.br0
      end
    end

    # Port x set bit y (y=              0..15)
    def self.br0=(value : BR0) : BR0
      self.set(br0: value)
      value
    end

    # Port x set bit y (y=              0..15)
    def self.bs15=(value : Bool) : Bool
      self.set(bs15: value)
      value
    end

    # Port x set bit y (y=              0..15)
    def self.bs14=(value : Bool) : Bool
      self.set(bs14: value)
      value
    end

    # Port x set bit y (y=              0..15)
    def self.bs13=(value : Bool) : Bool
      self.set(bs13: value)
      value
    end

    # Port x set bit y (y=              0..15)
    def self.bs12=(value : Bool) : Bool
      self.set(bs12: value)
      value
    end

    # Port x set bit y (y=              0..15)
    def self.bs11=(value : Bool) : Bool
      self.set(bs11: value)
      value
    end

    # Port x set bit y (y=              0..15)
    def self.bs10=(value : Bool) : Bool
      self.set(bs10: value)
      value
    end

    # Port x set bit y (y=              0..15)
    def self.bs9=(value : Bool) : Bool
      self.set(bs9: value)
      value
    end

    # Port x set bit y (y=              0..15)
    def self.bs8=(value : Bool) : Bool
      self.set(bs8: value)
      value
    end

    # Port x set bit y (y=              0..15)
    def self.bs7=(value : Bool) : Bool
      self.set(bs7: value)
      value
    end

    # Port x set bit y (y=              0..15)
    def self.bs6=(value : Bool) : Bool
      self.set(bs6: value)
      value
    end

    # Port x set bit y (y=              0..15)
    def self.bs5=(value : Bool) : Bool
      self.set(bs5: value)
      value
    end

    # Port x set bit y (y=              0..15)
    def self.bs4=(value : Bool) : Bool
      self.set(bs4: value)
      value
    end

    # Port x set bit y (y=              0..15)
    def self.bs3=(value : Bool) : Bool
      self.set(bs3: value)
      value
    end

    # Port x set bit y (y=              0..15)
    def self.bs2=(value : Bool) : Bool
      self.set(bs2: value)
      value
    end

    # Port x set bit y (y=              0..15)
    def self.bs1=(value : Bool) : Bool
      self.set(bs1: value)
      value
    end

    enum BS0 : UInt8
      # Sets the corresponding ODRx bit
      SET = 0x1_u64

      def self.reset_value : BS0
        BSRR.reset_value.bs0
      end
    end

    # Port x set bit y (y=              0..15)
    def self.bs0=(value : BS0) : BS0
      self.set(bs0: value)
      value
    end

    def copy_with(
      *,

      br15 : Bool? = nil,

      br14 : Bool? = nil,

      br13 : Bool? = nil,

      br12 : Bool? = nil,

      br11 : Bool? = nil,

      br10 : Bool? = nil,

      br9 : Bool? = nil,

      br8 : Bool? = nil,

      br7 : Bool? = nil,

      br6 : Bool? = nil,

      br5 : Bool? = nil,

      br4 : Bool? = nil,

      br3 : Bool? = nil,

      br2 : Bool? = nil,

      br1 : Bool? = nil,

      br0 : BR0? = nil,

      bs15 : Bool? = nil,

      bs14 : Bool? = nil,

      bs13 : Bool? = nil,

      bs12 : Bool? = nil,

      bs11 : Bool? = nil,

      bs10 : Bool? = nil,

      bs9 : Bool? = nil,

      bs8 : Bool? = nil,

      bs7 : Bool? = nil,

      bs6 : Bool? = nil,

      bs5 : Bool? = nil,

      bs4 : Bool? = nil,

      bs3 : Bool? = nil,

      bs2 : Bool? = nil,

      bs1 : Bool? = nil,

      bs0 : BS0? = nil
    ) : self
      value = @value

      unless br15.nil?
        value = (value & 0x7fffffff_u32) |
                UInt32.new!(br15.to_int).&(0x1_u32) << 31
      end

      unless br14.nil?
        value = (value & 0xbfffffff_u32) |
                UInt32.new!(br14.to_int).&(0x1_u32) << 30
      end

      unless br13.nil?
        value = (value & 0xdfffffff_u32) |
                UInt32.new!(br13.to_int).&(0x1_u32) << 29
      end

      unless br12.nil?
        value = (value & 0xefffffff_u32) |
                UInt32.new!(br12.to_int).&(0x1_u32) << 28
      end

      unless br11.nil?
        value = (value & 0xf7ffffff_u32) |
                UInt32.new!(br11.to_int).&(0x1_u32) << 27
      end

      unless br10.nil?
        value = (value & 0xfbffffff_u32) |
                UInt32.new!(br10.to_int).&(0x1_u32) << 26
      end

      unless br9.nil?
        value = (value & 0xfdffffff_u32) |
                UInt32.new!(br9.to_int).&(0x1_u32) << 25
      end

      unless br8.nil?
        value = (value & 0xfeffffff_u32) |
                UInt32.new!(br8.to_int).&(0x1_u32) << 24
      end

      unless br7.nil?
        value = (value & 0xff7fffff_u32) |
                UInt32.new!(br7.to_int).&(0x1_u32) << 23
      end

      unless br6.nil?
        value = (value & 0xffbfffff_u32) |
                UInt32.new!(br6.to_int).&(0x1_u32) << 22
      end

      unless br5.nil?
        value = (value & 0xffdfffff_u32) |
                UInt32.new!(br5.to_int).&(0x1_u32) << 21
      end

      unless br4.nil?
        value = (value & 0xffefffff_u32) |
                UInt32.new!(br4.to_int).&(0x1_u32) << 20
      end

      unless br3.nil?
        value = (value & 0xfff7ffff_u32) |
                UInt32.new!(br3.to_int).&(0x1_u32) << 19
      end

      unless br2.nil?
        value = (value & 0xfffbffff_u32) |
                UInt32.new!(br2.to_int).&(0x1_u32) << 18
      end

      unless br1.nil?
        value = (value & 0xfffdffff_u32) |
                UInt32.new!(br1.to_int).&(0x1_u32) << 17
      end

      unless br0.nil?
        value = (value & 0xfffeffff_u32) |
                UInt32.new!(br0.to_int).&(0x1_u32) << 16
      end

      unless bs15.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(bs15.to_int).&(0x1_u32) << 15
      end

      unless bs14.nil?
        value = (value & 0xffffbfff_u32) |
                UInt32.new!(bs14.to_int).&(0x1_u32) << 14
      end

      unless bs13.nil?
        value = (value & 0xffffdfff_u32) |
                UInt32.new!(bs13.to_int).&(0x1_u32) << 13
      end

      unless bs12.nil?
        value = (value & 0xffffefff_u32) |
                UInt32.new!(bs12.to_int).&(0x1_u32) << 12
      end

      unless bs11.nil?
        value = (value & 0xfffff7ff_u32) |
                UInt32.new!(bs11.to_int).&(0x1_u32) << 11
      end

      unless bs10.nil?
        value = (value & 0xfffffbff_u32) |
                UInt32.new!(bs10.to_int).&(0x1_u32) << 10
      end

      unless bs9.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(bs9.to_int).&(0x1_u32) << 9
      end

      unless bs8.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(bs8.to_int).&(0x1_u32) << 8
      end

      unless bs7.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(bs7.to_int).&(0x1_u32) << 7
      end

      unless bs6.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(bs6.to_int).&(0x1_u32) << 6
      end

      unless bs5.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(bs5.to_int).&(0x1_u32) << 5
      end

      unless bs4.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(bs4.to_int).&(0x1_u32) << 4
      end

      unless bs3.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(bs3.to_int).&(0x1_u32) << 3
      end

      unless bs2.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(bs2.to_int).&(0x1_u32) << 2
      end

      unless bs1.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(bs1.to_int).&(0x1_u32) << 1
      end

      unless bs0.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(bs0.to_int).&(0x1_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      br15 : Bool? = nil,
      br14 : Bool? = nil,
      br13 : Bool? = nil,
      br12 : Bool? = nil,
      br11 : Bool? = nil,
      br10 : Bool? = nil,
      br9 : Bool? = nil,
      br8 : Bool? = nil,
      br7 : Bool? = nil,
      br6 : Bool? = nil,
      br5 : Bool? = nil,
      br4 : Bool? = nil,
      br3 : Bool? = nil,
      br2 : Bool? = nil,
      br1 : Bool? = nil,
      br0 : BR0? = nil,
      bs15 : Bool? = nil,
      bs14 : Bool? = nil,
      bs13 : Bool? = nil,
      bs12 : Bool? = nil,
      bs11 : Bool? = nil,
      bs10 : Bool? = nil,
      bs9 : Bool? = nil,
      bs8 : Bool? = nil,
      bs7 : Bool? = nil,
      bs6 : Bool? = nil,
      bs5 : Bool? = nil,
      bs4 : Bool? = nil,
      bs3 : Bool? = nil,
      bs2 : Bool? = nil,
      bs1 : Bool? = nil,
      bs0 : BS0? = nil
    ) : Nil
      self.value = self.value.copy_with(
        br15: br15,
        br14: br14,
        br13: br13,
        br12: br12,
        br11: br11,
        br10: br10,
        br9: br9,
        br8: br8,
        br7: br7,
        br6: br6,
        br5: br5,
        br4: br4,
        br3: br3,
        br2: br2,
        br1: br1,
        br0: br0,
        bs15: bs15,
        bs14: bs14,
        bs13: bs13,
        bs12: bs12,
        bs11: bs11,
        bs10: bs10,
        bs9: bs9,
        bs8: bs8,
        bs7: bs7,
        bs6: bs6,
        bs5: bs5,
        bs4: bs4,
        bs3: bs3,
        bs2: bs2,
        bs1: bs1,
        bs0: bs0,
      )
    end
  end # struct

  # GPIO port configuration lock          register
  struct LCKR
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

    enum LCKK : UInt8
      # Port configuration lock key not active
      NOTACTIVE = 0x0_u64

      # Port configuration lock key active
      ACTIVE = 0x1_u64

      def self.reset_value : LCKK
        LCKR.reset_value.lckk
      end
    end

    # Lok Key
    def lckk : LCKK
      LCKK.new!((@value >> 16) & 0x1_u32)
    end

    # Lok Key
    def self.lckk : LCKK
      value.lckk
    end

    # Lok Key
    def self.lckk=(value : LCKK) : LCKK
      self.set(lckk: value)
      value
    end

    # Port x lock bit y (y=              0..15)
    def lck15 : Bool
      @value.bits_set?(0x8000_u32)
    end

    # Port x lock bit y (y=              0..15)
    def self.lck15 : Bool
      value.lck15
    end

    # Port x lock bit y (y=              0..15)
    def self.lck15=(value : Bool) : Bool
      self.set(lck15: value)
      value
    end

    # Port x lock bit y (y=              0..15)
    def lck14 : Bool
      @value.bits_set?(0x4000_u32)
    end

    # Port x lock bit y (y=              0..15)
    def self.lck14 : Bool
      value.lck14
    end

    # Port x lock bit y (y=              0..15)
    def self.lck14=(value : Bool) : Bool
      self.set(lck14: value)
      value
    end

    # Port x lock bit y (y=              0..15)
    def lck13 : Bool
      @value.bits_set?(0x2000_u32)
    end

    # Port x lock bit y (y=              0..15)
    def self.lck13 : Bool
      value.lck13
    end

    # Port x lock bit y (y=              0..15)
    def self.lck13=(value : Bool) : Bool
      self.set(lck13: value)
      value
    end

    # Port x lock bit y (y=              0..15)
    def lck12 : Bool
      @value.bits_set?(0x1000_u32)
    end

    # Port x lock bit y (y=              0..15)
    def self.lck12 : Bool
      value.lck12
    end

    # Port x lock bit y (y=              0..15)
    def self.lck12=(value : Bool) : Bool
      self.set(lck12: value)
      value
    end

    # Port x lock bit y (y=              0..15)
    def lck11 : Bool
      @value.bits_set?(0x800_u32)
    end

    # Port x lock bit y (y=              0..15)
    def self.lck11 : Bool
      value.lck11
    end

    # Port x lock bit y (y=              0..15)
    def self.lck11=(value : Bool) : Bool
      self.set(lck11: value)
      value
    end

    enum LCK10 : UInt8
      # Port configuration not locked
      UNLOCKED = 0x0_u64

      # Port configuration locked
      LOCKED = 0x1_u64

      def self.reset_value : LCK10
        LCKR.reset_value.lck10
      end
    end

    # Port x lock bit y (y=              0..15)
    def lck10 : LCK10
      LCK10.new!((@value >> 10) & 0x1_u32)
    end

    # Port x lock bit y (y=              0..15)
    def self.lck10 : LCK10
      value.lck10
    end

    # Port x lock bit y (y=              0..15)
    def self.lck10=(value : LCK10) : LCK10
      self.set(lck10: value)
      value
    end

    # Port x lock bit y (y=              0..15)
    def lck9 : Bool
      @value.bits_set?(0x200_u32)
    end

    # Port x lock bit y (y=              0..15)
    def self.lck9 : Bool
      value.lck9
    end

    # Port x lock bit y (y=              0..15)
    def self.lck9=(value : Bool) : Bool
      self.set(lck9: value)
      value
    end

    # Port x lock bit y (y=              0..15)
    def lck8 : Bool
      @value.bits_set?(0x100_u32)
    end

    # Port x lock bit y (y=              0..15)
    def self.lck8 : Bool
      value.lck8
    end

    # Port x lock bit y (y=              0..15)
    def self.lck8=(value : Bool) : Bool
      self.set(lck8: value)
      value
    end

    # Port x lock bit y (y=              0..15)
    def lck7 : Bool
      @value.bits_set?(0x80_u32)
    end

    # Port x lock bit y (y=              0..15)
    def self.lck7 : Bool
      value.lck7
    end

    # Port x lock bit y (y=              0..15)
    def self.lck7=(value : Bool) : Bool
      self.set(lck7: value)
      value
    end

    # Port x lock bit y (y=              0..15)
    def lck6 : Bool
      @value.bits_set?(0x40_u32)
    end

    # Port x lock bit y (y=              0..15)
    def self.lck6 : Bool
      value.lck6
    end

    # Port x lock bit y (y=              0..15)
    def self.lck6=(value : Bool) : Bool
      self.set(lck6: value)
      value
    end

    # Port x lock bit y (y=              0..15)
    def lck5 : Bool
      @value.bits_set?(0x20_u32)
    end

    # Port x lock bit y (y=              0..15)
    def self.lck5 : Bool
      value.lck5
    end

    # Port x lock bit y (y=              0..15)
    def self.lck5=(value : Bool) : Bool
      self.set(lck5: value)
      value
    end

    # Port x lock bit y (y=              0..15)
    def lck4 : Bool
      @value.bits_set?(0x10_u32)
    end

    # Port x lock bit y (y=              0..15)
    def self.lck4 : Bool
      value.lck4
    end

    # Port x lock bit y (y=              0..15)
    def self.lck4=(value : Bool) : Bool
      self.set(lck4: value)
      value
    end

    # Port x lock bit y (y=              0..15)
    def lck3 : Bool
      @value.bits_set?(0x8_u32)
    end

    # Port x lock bit y (y=              0..15)
    def self.lck3 : Bool
      value.lck3
    end

    # Port x lock bit y (y=              0..15)
    def self.lck3=(value : Bool) : Bool
      self.set(lck3: value)
      value
    end

    # Port x lock bit y (y=              0..15)
    def lck2 : Bool
      @value.bits_set?(0x4_u32)
    end

    # Port x lock bit y (y=              0..15)
    def self.lck2 : Bool
      value.lck2
    end

    # Port x lock bit y (y=              0..15)
    def self.lck2=(value : Bool) : Bool
      self.set(lck2: value)
      value
    end

    # Port x lock bit y (y=              0..15)
    def lck1 : Bool
      @value.bits_set?(0x2_u32)
    end

    # Port x lock bit y (y=              0..15)
    def self.lck1 : Bool
      value.lck1
    end

    # Port x lock bit y (y=              0..15)
    def self.lck1=(value : Bool) : Bool
      self.set(lck1: value)
      value
    end

    enum LCK0 : UInt8
      # Port configuration not locked
      UNLOCKED = 0x0_u64

      # Port configuration locked
      LOCKED = 0x1_u64

      def self.reset_value : LCK0
        LCKR.reset_value.lck0
      end
    end

    # Port x lock bit y (y=              0..15)
    def lck0 : LCK0
      LCK0.new!((@value >> 0) & 0x1_u32)
    end

    # Port x lock bit y (y=              0..15)
    def self.lck0 : LCK0
      value.lck0
    end

    # Port x lock bit y (y=              0..15)
    def self.lck0=(value : LCK0) : LCK0
      self.set(lck0: value)
      value
    end

    def copy_with(
      *,

      lckk : LCKK? = nil,

      lck15 : Bool? = nil,

      lck14 : Bool? = nil,

      lck13 : Bool? = nil,

      lck12 : Bool? = nil,

      lck11 : Bool? = nil,

      lck10 : LCK10? = nil,

      lck9 : Bool? = nil,

      lck8 : Bool? = nil,

      lck7 : Bool? = nil,

      lck6 : Bool? = nil,

      lck5 : Bool? = nil,

      lck4 : Bool? = nil,

      lck3 : Bool? = nil,

      lck2 : Bool? = nil,

      lck1 : Bool? = nil,

      lck0 : LCK0? = nil
    ) : self
      value = @value

      unless lckk.nil?
        value = (value & 0xfffeffff_u32) |
                UInt32.new!(lckk.to_int).&(0x1_u32) << 16
      end

      unless lck15.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(lck15.to_int).&(0x1_u32) << 15
      end

      unless lck14.nil?
        value = (value & 0xffffbfff_u32) |
                UInt32.new!(lck14.to_int).&(0x1_u32) << 14
      end

      unless lck13.nil?
        value = (value & 0xffffdfff_u32) |
                UInt32.new!(lck13.to_int).&(0x1_u32) << 13
      end

      unless lck12.nil?
        value = (value & 0xffffefff_u32) |
                UInt32.new!(lck12.to_int).&(0x1_u32) << 12
      end

      unless lck11.nil?
        value = (value & 0xfffff7ff_u32) |
                UInt32.new!(lck11.to_int).&(0x1_u32) << 11
      end

      unless lck10.nil?
        value = (value & 0xfffffbff_u32) |
                UInt32.new!(lck10.to_int).&(0x1_u32) << 10
      end

      unless lck9.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(lck9.to_int).&(0x1_u32) << 9
      end

      unless lck8.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(lck8.to_int).&(0x1_u32) << 8
      end

      unless lck7.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(lck7.to_int).&(0x1_u32) << 7
      end

      unless lck6.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(lck6.to_int).&(0x1_u32) << 6
      end

      unless lck5.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(lck5.to_int).&(0x1_u32) << 5
      end

      unless lck4.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(lck4.to_int).&(0x1_u32) << 4
      end

      unless lck3.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(lck3.to_int).&(0x1_u32) << 3
      end

      unless lck2.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(lck2.to_int).&(0x1_u32) << 2
      end

      unless lck1.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(lck1.to_int).&(0x1_u32) << 1
      end

      unless lck0.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(lck0.to_int).&(0x1_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      lckk : LCKK? = nil,
      lck15 : Bool? = nil,
      lck14 : Bool? = nil,
      lck13 : Bool? = nil,
      lck12 : Bool? = nil,
      lck11 : Bool? = nil,
      lck10 : LCK10? = nil,
      lck9 : Bool? = nil,
      lck8 : Bool? = nil,
      lck7 : Bool? = nil,
      lck6 : Bool? = nil,
      lck5 : Bool? = nil,
      lck4 : Bool? = nil,
      lck3 : Bool? = nil,
      lck2 : Bool? = nil,
      lck1 : Bool? = nil,
      lck0 : LCK0? = nil
    ) : Nil
      self.value = self.value.copy_with(
        lckk: lckk,
        lck15: lck15,
        lck14: lck14,
        lck13: lck13,
        lck12: lck12,
        lck11: lck11,
        lck10: lck10,
        lck9: lck9,
        lck8: lck8,
        lck7: lck7,
        lck6: lck6,
        lck5: lck5,
        lck4: lck4,
        lck3: lck3,
        lck2: lck2,
        lck1: lck1,
        lck0: lck0,
      )
    end
  end # struct

  # GPIO alternate function low          register
  struct AFRL
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

    # Alternate function selection for port x              bit y (y = 0..7)
    def _7 : UInt8
      UInt8.new!((@value >> 28) & 0xf_u32)
    end

    # Alternate function selection for port x              bit y (y = 0..7)
    def self._7 : UInt8
      value._7
    end

    # Alternate function selection for port x              bit y (y = 0..7)
    def self._7=(value : UInt8) : UInt8
      self.set(_7: value)
      value
    end

    # Alternate function selection for port x              bit y (y = 0..7)
    def _6 : UInt8
      UInt8.new!((@value >> 24) & 0xf_u32)
    end

    # Alternate function selection for port x              bit y (y = 0..7)
    def self._6 : UInt8
      value._6
    end

    # Alternate function selection for port x              bit y (y = 0..7)
    def self._6=(value : UInt8) : UInt8
      self.set(_6: value)
      value
    end

    # Alternate function selection for port x              bit y (y = 0..7)
    def _5 : UInt8
      UInt8.new!((@value >> 20) & 0xf_u32)
    end

    # Alternate function selection for port x              bit y (y = 0..7)
    def self._5 : UInt8
      value._5
    end

    # Alternate function selection for port x              bit y (y = 0..7)
    def self._5=(value : UInt8) : UInt8
      self.set(_5: value)
      value
    end

    # Alternate function selection for port x              bit y (y = 0..7)
    def _4 : UInt8
      UInt8.new!((@value >> 16) & 0xf_u32)
    end

    # Alternate function selection for port x              bit y (y = 0..7)
    def self._4 : UInt8
      value._4
    end

    # Alternate function selection for port x              bit y (y = 0..7)
    def self._4=(value : UInt8) : UInt8
      self.set(_4: value)
      value
    end

    # Alternate function selection for port x              bit y (y = 0..7)
    def _3 : UInt8
      UInt8.new!((@value >> 12) & 0xf_u32)
    end

    # Alternate function selection for port x              bit y (y = 0..7)
    def self._3 : UInt8
      value._3
    end

    # Alternate function selection for port x              bit y (y = 0..7)
    def self._3=(value : UInt8) : UInt8
      self.set(_3: value)
      value
    end

    # Alternate function selection for port x              bit y (y = 0..7)
    def _2 : UInt8
      UInt8.new!((@value >> 8) & 0xf_u32)
    end

    # Alternate function selection for port x              bit y (y = 0..7)
    def self._2 : UInt8
      value._2
    end

    # Alternate function selection for port x              bit y (y = 0..7)
    def self._2=(value : UInt8) : UInt8
      self.set(_2: value)
      value
    end

    # Alternate function selection for port x              bit y (y = 0..7)
    def _1 : UInt8
      UInt8.new!((@value >> 4) & 0xf_u32)
    end

    # Alternate function selection for port x              bit y (y = 0..7)
    def self._1 : UInt8
      value._1
    end

    # Alternate function selection for port x              bit y (y = 0..7)
    def self._1=(value : UInt8) : UInt8
      self.set(_1: value)
      value
    end

    enum N0 : UInt8
      # AF0
      AF0 = 0x0_u64

      # AF1
      AF1 = 0x1_u64

      # AF2
      AF2 = 0x2_u64

      # AF3
      AF3 = 0x3_u64

      # AF4
      AF4 = 0x4_u64

      # AF5
      AF5 = 0x5_u64

      # AF6
      AF6 = 0x6_u64

      # AF7
      AF7 = 0x7_u64

      # AF8
      AF8 = 0x8_u64

      # AF9
      AF9 = 0x9_u64

      # AF10
      AF10 = 0xa_u64

      # AF11
      AF11 = 0xb_u64

      # AF12
      AF12 = 0xc_u64

      # AF13
      AF13 = 0xd_u64

      # AF14
      AF14 = 0xe_u64

      # AF15
      AF15 = 0xf_u64

      def self.reset_value : N0
        AFRL.reset_value._0
      end
    end

    # Alternate function selection for port x              bit y (y = 0..7)
    def _0 : N0
      N0.new!((@value >> 0) & 0xf_u32)
    end

    # Alternate function selection for port x              bit y (y = 0..7)
    def self._0 : N0
      value._0
    end

    # Alternate function selection for port x              bit y (y = 0..7)
    def self._0=(value : N0) : N0
      self.set(_0: value)
      value
    end

    def copy_with(
      *,

      _7 : UInt8? = nil,

      _6 : UInt8? = nil,

      _5 : UInt8? = nil,

      _4 : UInt8? = nil,

      _3 : UInt8? = nil,

      _2 : UInt8? = nil,

      _1 : UInt8? = nil,

      _0 : N0? = nil
    ) : self
      value = @value

      unless _7.nil?
        value = (value & 0xfffffff_u32) |
                UInt32.new!(_7.to_int).&(0xf_u32) << 28
      end

      unless _6.nil?
        value = (value & 0xf0ffffff_u32) |
                UInt32.new!(_6.to_int).&(0xf_u32) << 24
      end

      unless _5.nil?
        value = (value & 0xff0fffff_u32) |
                UInt32.new!(_5.to_int).&(0xf_u32) << 20
      end

      unless _4.nil?
        value = (value & 0xfff0ffff_u32) |
                UInt32.new!(_4.to_int).&(0xf_u32) << 16
      end

      unless _3.nil?
        value = (value & 0xffff0fff_u32) |
                UInt32.new!(_3.to_int).&(0xf_u32) << 12
      end

      unless _2.nil?
        value = (value & 0xfffff0ff_u32) |
                UInt32.new!(_2.to_int).&(0xf_u32) << 8
      end

      unless _1.nil?
        value = (value & 0xffffff0f_u32) |
                UInt32.new!(_1.to_int).&(0xf_u32) << 4
      end

      unless _0.nil?
        value = (value & 0xfffffff0_u32) |
                UInt32.new!(_0.to_int).&(0xf_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      _7 : UInt8? = nil,
      _6 : UInt8? = nil,
      _5 : UInt8? = nil,
      _4 : UInt8? = nil,
      _3 : UInt8? = nil,
      _2 : UInt8? = nil,
      _1 : UInt8? = nil,
      _0 : N0? = nil
    ) : Nil
      self.value = self.value.copy_with(
        _7: _7,
        _6: _6,
        _5: _5,
        _4: _4,
        _3: _3,
        _2: _2,
        _1: _1,
        _0: _0,
      )
    end
  end # struct

  # GPIO alternate function high          register
  struct AFRH
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

    # Alternate function selection for port x              bit y (y = 8..15)
    def _15 : UInt8
      UInt8.new!((@value >> 28) & 0xf_u32)
    end

    # Alternate function selection for port x              bit y (y = 8..15)
    def self._15 : UInt8
      value._15
    end

    # Alternate function selection for port x              bit y (y = 8..15)
    def self._15=(value : UInt8) : UInt8
      self.set(_15: value)
      value
    end

    # Alternate function selection for port x              bit y (y = 8..15)
    def _14 : UInt8
      UInt8.new!((@value >> 24) & 0xf_u32)
    end

    # Alternate function selection for port x              bit y (y = 8..15)
    def self._14 : UInt8
      value._14
    end

    # Alternate function selection for port x              bit y (y = 8..15)
    def self._14=(value : UInt8) : UInt8
      self.set(_14: value)
      value
    end

    # Alternate function selection for port x              bit y (y = 8..15)
    def _13 : UInt8
      UInt8.new!((@value >> 20) & 0xf_u32)
    end

    # Alternate function selection for port x              bit y (y = 8..15)
    def self._13 : UInt8
      value._13
    end

    # Alternate function selection for port x              bit y (y = 8..15)
    def self._13=(value : UInt8) : UInt8
      self.set(_13: value)
      value
    end

    # Alternate function selection for port x              bit y (y = 8..15)
    def _12 : UInt8
      UInt8.new!((@value >> 16) & 0xf_u32)
    end

    # Alternate function selection for port x              bit y (y = 8..15)
    def self._12 : UInt8
      value._12
    end

    # Alternate function selection for port x              bit y (y = 8..15)
    def self._12=(value : UInt8) : UInt8
      self.set(_12: value)
      value
    end

    # Alternate function selection for port x              bit y (y = 8..15)
    def _11 : UInt8
      UInt8.new!((@value >> 12) & 0xf_u32)
    end

    # Alternate function selection for port x              bit y (y = 8..15)
    def self._11 : UInt8
      value._11
    end

    # Alternate function selection for port x              bit y (y = 8..15)
    def self._11=(value : UInt8) : UInt8
      self.set(_11: value)
      value
    end

    # Alternate function selection for port x              bit y (y = 8..15)
    def _10 : UInt8
      UInt8.new!((@value >> 8) & 0xf_u32)
    end

    # Alternate function selection for port x              bit y (y = 8..15)
    def self._10 : UInt8
      value._10
    end

    # Alternate function selection for port x              bit y (y = 8..15)
    def self._10=(value : UInt8) : UInt8
      self.set(_10: value)
      value
    end

    # Alternate function selection for port x              bit y (y = 8..15)
    def _9 : UInt8
      UInt8.new!((@value >> 4) & 0xf_u32)
    end

    # Alternate function selection for port x              bit y (y = 8..15)
    def self._9 : UInt8
      value._9
    end

    # Alternate function selection for port x              bit y (y = 8..15)
    def self._9=(value : UInt8) : UInt8
      self.set(_9: value)
      value
    end

    enum N8 : UInt8
      # AF0
      AF0 = 0x0_u64

      # AF1
      AF1 = 0x1_u64

      # AF2
      AF2 = 0x2_u64

      # AF3
      AF3 = 0x3_u64

      # AF4
      AF4 = 0x4_u64

      # AF5
      AF5 = 0x5_u64

      # AF6
      AF6 = 0x6_u64

      # AF7
      AF7 = 0x7_u64

      # AF8
      AF8 = 0x8_u64

      # AF9
      AF9 = 0x9_u64

      # AF10
      AF10 = 0xa_u64

      # AF11
      AF11 = 0xb_u64

      # AF12
      AF12 = 0xc_u64

      # AF13
      AF13 = 0xd_u64

      # AF14
      AF14 = 0xe_u64

      # AF15
      AF15 = 0xf_u64

      def self.reset_value : N8
        AFRH.reset_value._8
      end
    end

    # Alternate function selection for port x              bit y (y = 8..15)
    def _8 : N8
      N8.new!((@value >> 0) & 0xf_u32)
    end

    # Alternate function selection for port x              bit y (y = 8..15)
    def self._8 : N8
      value._8
    end

    # Alternate function selection for port x              bit y (y = 8..15)
    def self._8=(value : N8) : N8
      self.set(_8: value)
      value
    end

    def copy_with(
      *,

      _15 : UInt8? = nil,

      _14 : UInt8? = nil,

      _13 : UInt8? = nil,

      _12 : UInt8? = nil,

      _11 : UInt8? = nil,

      _10 : UInt8? = nil,

      _9 : UInt8? = nil,

      _8 : N8? = nil
    ) : self
      value = @value

      unless _15.nil?
        value = (value & 0xfffffff_u32) |
                UInt32.new!(_15.to_int).&(0xf_u32) << 28
      end

      unless _14.nil?
        value = (value & 0xf0ffffff_u32) |
                UInt32.new!(_14.to_int).&(0xf_u32) << 24
      end

      unless _13.nil?
        value = (value & 0xff0fffff_u32) |
                UInt32.new!(_13.to_int).&(0xf_u32) << 20
      end

      unless _12.nil?
        value = (value & 0xfff0ffff_u32) |
                UInt32.new!(_12.to_int).&(0xf_u32) << 16
      end

      unless _11.nil?
        value = (value & 0xffff0fff_u32) |
                UInt32.new!(_11.to_int).&(0xf_u32) << 12
      end

      unless _10.nil?
        value = (value & 0xfffff0ff_u32) |
                UInt32.new!(_10.to_int).&(0xf_u32) << 8
      end

      unless _9.nil?
        value = (value & 0xffffff0f_u32) |
                UInt32.new!(_9.to_int).&(0xf_u32) << 4
      end

      unless _8.nil?
        value = (value & 0xfffffff0_u32) |
                UInt32.new!(_8.to_int).&(0xf_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      _15 : UInt8? = nil,
      _14 : UInt8? = nil,
      _13 : UInt8? = nil,
      _12 : UInt8? = nil,
      _11 : UInt8? = nil,
      _10 : UInt8? = nil,
      _9 : UInt8? = nil,
      _8 : N8? = nil
    ) : Nil
      self.value = self.value.copy_with(
        _15: _15,
        _14: _14,
        _13: _13,
        _12: _12,
        _11: _11,
        _10: _10,
        _9: _9,
        _8: _8,
      )
    end
  end # struct

  # Port bit reset register
  struct BRR
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

    enum BR0 : UInt8
      # No action on the corresponding ODx bit
      NOACTION = 0x0_u64

      # Reset the ODx bit
      RESET = 0x1_u64

      def self.reset_value : BR0
        BRR.reset_value.br0
      end
    end

    # Port x Reset bit y
    def self.br0=(value : BR0) : BR0
      self.set(br0: value)
      value
    end

    # Port x Reset bit y
    def self.br1=(value : Bool) : Bool
      self.set(br1: value)
      value
    end

    # Port x Reset bit y
    def self.br2=(value : Bool) : Bool
      self.set(br2: value)
      value
    end

    # Port x Reset bit y
    def self.br3=(value : Bool) : Bool
      self.set(br3: value)
      value
    end

    # Port x Reset bit y
    def self.br4=(value : Bool) : Bool
      self.set(br4: value)
      value
    end

    # Port x Reset bit y
    def self.br5=(value : Bool) : Bool
      self.set(br5: value)
      value
    end

    # Port x Reset bit y
    def self.br6=(value : Bool) : Bool
      self.set(br6: value)
      value
    end

    # Port x Reset bit y
    def self.br7=(value : Bool) : Bool
      self.set(br7: value)
      value
    end

    # Port x Reset bit y
    def self.br8=(value : Bool) : Bool
      self.set(br8: value)
      value
    end

    # Port x Reset bit y
    def self.br9=(value : Bool) : Bool
      self.set(br9: value)
      value
    end

    enum BR10 : UInt8
      # No action on the corresponding ODx bit
      NOACTION = 0x0_u64

      # Reset the ODx bit
      RESET = 0x1_u64

      def self.reset_value : BR10
        BRR.reset_value.br10
      end
    end

    # Port x Reset bit y
    def self.br10=(value : BR10) : BR10
      self.set(br10: value)
      value
    end

    # Port x Reset bit y
    def self.br11=(value : Bool) : Bool
      self.set(br11: value)
      value
    end

    # Port x Reset bit y
    def self.br12=(value : Bool) : Bool
      self.set(br12: value)
      value
    end

    # Port x Reset bit y
    def self.br13=(value : Bool) : Bool
      self.set(br13: value)
      value
    end

    # Port x Reset bit y
    def self.br14=(value : Bool) : Bool
      self.set(br14: value)
      value
    end

    # Port x Reset bit y
    def self.br15=(value : Bool) : Bool
      self.set(br15: value)
      value
    end

    def copy_with(
      *,

      br0 : BR0? = nil,

      br1 : Bool? = nil,

      br2 : Bool? = nil,

      br3 : Bool? = nil,

      br4 : Bool? = nil,

      br5 : Bool? = nil,

      br6 : Bool? = nil,

      br7 : Bool? = nil,

      br8 : Bool? = nil,

      br9 : Bool? = nil,

      br10 : BR10? = nil,

      br11 : Bool? = nil,

      br12 : Bool? = nil,

      br13 : Bool? = nil,

      br14 : Bool? = nil,

      br15 : Bool? = nil
    ) : self
      value = @value

      unless br0.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(br0.to_int).&(0x1_u32) << 0
      end

      unless br1.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(br1.to_int).&(0x1_u32) << 1
      end

      unless br2.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(br2.to_int).&(0x1_u32) << 2
      end

      unless br3.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(br3.to_int).&(0x1_u32) << 3
      end

      unless br4.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(br4.to_int).&(0x1_u32) << 4
      end

      unless br5.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(br5.to_int).&(0x1_u32) << 5
      end

      unless br6.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(br6.to_int).&(0x1_u32) << 6
      end

      unless br7.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(br7.to_int).&(0x1_u32) << 7
      end

      unless br8.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(br8.to_int).&(0x1_u32) << 8
      end

      unless br9.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(br9.to_int).&(0x1_u32) << 9
      end

      unless br10.nil?
        value = (value & 0xfffffbff_u32) |
                UInt32.new!(br10.to_int).&(0x1_u32) << 10
      end

      unless br11.nil?
        value = (value & 0xfffff7ff_u32) |
                UInt32.new!(br11.to_int).&(0x1_u32) << 11
      end

      unless br12.nil?
        value = (value & 0xffffefff_u32) |
                UInt32.new!(br12.to_int).&(0x1_u32) << 12
      end

      unless br13.nil?
        value = (value & 0xffffdfff_u32) |
                UInt32.new!(br13.to_int).&(0x1_u32) << 13
      end

      unless br14.nil?
        value = (value & 0xffffbfff_u32) |
                UInt32.new!(br14.to_int).&(0x1_u32) << 14
      end

      unless br15.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(br15.to_int).&(0x1_u32) << 15
      end

      self.class.new(value)
    end

    def self.set(
      *,
      br0 : BR0? = nil,
      br1 : Bool? = nil,
      br2 : Bool? = nil,
      br3 : Bool? = nil,
      br4 : Bool? = nil,
      br5 : Bool? = nil,
      br6 : Bool? = nil,
      br7 : Bool? = nil,
      br8 : Bool? = nil,
      br9 : Bool? = nil,
      br10 : BR10? = nil,
      br11 : Bool? = nil,
      br12 : Bool? = nil,
      br13 : Bool? = nil,
      br14 : Bool? = nil,
      br15 : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        br0: br0,
        br1: br1,
        br2: br2,
        br3: br3,
        br4: br4,
        br5: br5,
        br6: br6,
        br7: br7,
        br8: br8,
        br9: br9,
        br10: br10,
        br11: br11,
        br12: br12,
        br13: br13,
        br14: br14,
        br15: br15,
      )
    end
  end # struct

end
