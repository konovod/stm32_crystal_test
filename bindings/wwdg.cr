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

    # 7-bit counter
    def t : UInt8
      UInt8.new!((@value >> 0) & 0x7f_u32)
    end

    # 7-bit counter
    def self.t : UInt8
      value.t
    end

    # 7-bit counter
    def self.t=(value : UInt8) : UInt8
      self.set(t: value)
      value
    end

    enum WDGA : UInt8
      # Watchdog disabled
      DISABLED = 0x0_u64

      # Watchdog enabled
      ENABLED = 0x1_u64

      def self.reset_value : WDGA
        CR.reset_value.wdga
      end
    end

    # Activation bit
    def wdga : WDGA
      WDGA.new!((@value >> 7) & 0x1_u32)
    end

    # Activation bit
    def self.wdga : WDGA
      value.wdga
    end

    # Activation bit
    def self.wdga=(value : WDGA) : WDGA
      self.set(wdga: value)
      value
    end

    def copy_with(
      *,

      t : UInt8? = nil,

      wdga : WDGA? = nil
    ) : self
      value = @value

      unless t.nil?
        value = (value & 0xffffff80_u32) |
                UInt32.new!(t.to_int).&(0x7f_u32) << 0
      end

      unless wdga.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(wdga.to_int).&(0x1_u32) << 7
      end

      self.class.new(value)
    end

    def self.set(
      *,
      t : UInt8? = nil,
      wdga : WDGA? = nil
    ) : Nil
      self.value = self.value.copy_with(
        t: t,
        wdga: wdga,
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

    enum EWI : UInt8
      # interrupt occurs whenever the counter reaches the value 0x40
      ENABLE = 0x1_u64

      def self.reset_value : EWI
        CFR.reset_value.ewi
      end
    end

    # Early wakeup interrupt
    def ewi : EWI
      EWI.new!((@value >> 9) & 0x1_u32)
    end

    # Early wakeup interrupt
    def self.ewi : EWI
      value.ewi
    end

    # Early wakeup interrupt
    def self.ewi=(value : EWI) : EWI
      self.set(ewi: value)
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

    enum WDGTB : UInt8
      # Counter clock (PCLK1 div 4096) div 1
      DIV1 = 0x0_u64

      # Counter clock (PCLK1 div 4096) div 2
      DIV2 = 0x1_u64

      # Counter clock (PCLK1 div 4096) div 4
      DIV4 = 0x2_u64

      # Counter clock (PCLK1 div 4096) div 8
      DIV8 = 0x3_u64

      def self.reset_value : WDGTB
        CFR.reset_value.wdgtb
      end
    end

    # Timer base
    def wdgtb : WDGTB
      WDGTB.new!((@value >> 7) & 0x3_u32)
    end

    # Timer base
    def self.wdgtb : WDGTB
      value.wdgtb
    end

    # Timer base
    def self.wdgtb=(value : WDGTB) : WDGTB
      self.set(wdgtb: value)
      value
    end

    def copy_with(
      *,

      ewi : EWI? = nil,

      w : UInt8? = nil,

      wdgtb : WDGTB? = nil
    ) : self
      value = @value

      unless ewi.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(ewi.to_int).&(0x1_u32) << 9
      end

      unless w.nil?
        value = (value & 0xffffff80_u32) |
                UInt32.new!(w.to_int).&(0x7f_u32) << 0
      end

      unless wdgtb.nil?
        value = (value & 0xfffffe7f_u32) |
                UInt32.new!(wdgtb.to_int).&(0x3_u32) << 7
      end

      self.class.new(value)
    end

    def self.set(
      *,
      ewi : EWI? = nil,
      w : UInt8? = nil,
      wdgtb : WDGTB? = nil
    ) : Nil
      self.value = self.value.copy_with(
        ewi: ewi,
        w: w,
        wdgtb: wdgtb,
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

    enum EWIF : UInt8
      # The EWI Interrupt Service Routine has been triggered
      PENDING = 0x1_u64

      # The EWI Interrupt Service Routine has been serviced
      FINISHED = 0x0_u64

      def self.reset_value : EWIF
        SR.reset_value.ewif
      end
    end

    # Early wakeup interrupt              flag
    def ewif : EWIF
      EWIF.new!((@value >> 0) & 0x1_u32)
    end

    # Early wakeup interrupt              flag
    def self.ewif : EWIF
      value.ewif
    end

    # Early wakeup interrupt              flag
    def self.ewif=(value : EWIF) : EWIF
      self.set(ewif: value)
      value
    end

    def copy_with(
      *,

      ewif : EWIF? = nil
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
      ewif : EWIF? = nil
    ) : Nil
      self.value = self.value.copy_with(
        ewif: ewif,
      )
    end
  end # struct

end
