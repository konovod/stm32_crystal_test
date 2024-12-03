# Window watchdog
module WWDG
  VERSION      = nil
  BASE_ADDRESS = 0x40002c00_u64

  # Control register
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
      new(0x7f_u64)
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

    # Activation bit
    def wdga : Bool
      @value.bits_set?(0x80_u32)
    end

    # Activation bit
    def self.wdga : Bool
      value.wdga
    end

    # Activation bit
    def self.wdga=(value : Bool) : Bool
      self.set(wdga: value)
      value
    end

    # 7-bit counter (MSB to LSB)
    def t : UInt8
      UInt8.new!((@value >> 0) & 0x7f_u32)
    end

    # 7-bit counter (MSB to LSB)
    def self.t : UInt8
      value.t
    end

    # 7-bit counter (MSB to LSB)
    def self.t=(value : UInt8) : UInt8
      self.set(t: value)
      value
    end

    def copy_with(
      *,

      wdga : Bool? = nil,

      t : UInt8? = nil
    ) : self
      value = @value

      unless wdga.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(wdga.to_int).&(0x1_u32) << 7
      end

      unless t.nil?
        value = (value & 0xffffff80_u32) |
                UInt32.new!(t.to_int).&(0x7f_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      wdga : Bool? = nil,
      t : UInt8? = nil
    ) : Nil
      self.value = self.value.copy_with(
        wdga: wdga,
        t: t,
      )
    end
  end # struct

  # Configuration register
  struct CFR
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
      new(0x7f_u64)
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

    # Early wakeup interrupt
    def ewi : Bool
      @value.bits_set?(0x200_u32)
    end

    # Early wakeup interrupt
    def self.ewi : Bool
      value.ewi
    end

    # Early wakeup interrupt
    def self.ewi=(value : Bool) : Bool
      self.set(ewi: value)
      value
    end

    # Timer base
    def wdgtb1 : Bool
      @value.bits_set?(0x100_u32)
    end

    # Timer base
    def self.wdgtb1 : Bool
      value.wdgtb1
    end

    # Timer base
    def self.wdgtb1=(value : Bool) : Bool
      self.set(wdgtb1: value)
      value
    end

    # Timer base
    def wdgtb0 : Bool
      @value.bits_set?(0x80_u32)
    end

    # Timer base
    def self.wdgtb0 : Bool
      value.wdgtb0
    end

    # Timer base
    def self.wdgtb0=(value : Bool) : Bool
      self.set(wdgtb0: value)
      value
    end

    # 7-bit window value
    def w : UInt8
      UInt8.new!((@value >> 0) & 0x7f_u32)
    end

    # 7-bit window value
    def self.w : UInt8
      value.w
    end

    # 7-bit window value
    def self.w=(value : UInt8) : UInt8
      self.set(w: value)
      value
    end

    def copy_with(
      *,

      ewi : Bool? = nil,

      wdgtb1 : Bool? = nil,

      wdgtb0 : Bool? = nil,

      w : UInt8? = nil
    ) : self
      value = @value

      unless ewi.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(ewi.to_int).&(0x1_u32) << 9
      end

      unless wdgtb1.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(wdgtb1.to_int).&(0x1_u32) << 8
      end

      unless wdgtb0.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(wdgtb0.to_int).&(0x1_u32) << 7
      end

      unless w.nil?
        value = (value & 0xffffff80_u32) |
                UInt32.new!(w.to_int).&(0x7f_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      ewi : Bool? = nil,
      wdgtb1 : Bool? = nil,
      wdgtb0 : Bool? = nil,
      w : UInt8? = nil
    ) : Nil
      self.value = self.value.copy_with(
        ewi: ewi,
        wdgtb1: wdgtb1,
        wdgtb0: wdgtb0,
        w: w,
      )
    end
  end # struct

  # Status register
  struct SR
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

    # Early wakeup interrupt              flag
    def ewif : Bool
      @value.bits_set?(0x1_u32)
    end

    # Early wakeup interrupt              flag
    def self.ewif : Bool
      value.ewif
    end

    # Early wakeup interrupt              flag
    def self.ewif=(value : Bool) : Bool
      self.set(ewif: value)
      value
    end

    def copy_with(
      *,

      ewif : Bool? = nil
    ) : self
      value = @value

      unless ewif.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(ewif.to_int).&(0x1_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      ewif : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        ewif: ewif,
      )
    end
  end # struct

end
