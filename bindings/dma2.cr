# DMA controller
module DMA2
  VERSION      = nil
  BASE_ADDRESS = 0x40026400_u64

  # low interrupt status register
  struct LISR
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

    # Stream x transfer complete interrupt              flag (x = 3..0)
    def tcif3 : Bool
      @value.bits_set?(0x8000000_u32)
    end

    # Stream x transfer complete interrupt              flag (x = 3..0)
    def self.tcif3 : Bool
      value.tcif3
    end

    # Stream x half transfer interrupt flag              (x=3..0)
    def htif3 : Bool
      @value.bits_set?(0x4000000_u32)
    end

    # Stream x half transfer interrupt flag              (x=3..0)
    def self.htif3 : Bool
      value.htif3
    end

    # Stream x transfer error interrupt flag              (x=3..0)
    def teif3 : Bool
      @value.bits_set?(0x2000000_u32)
    end

    # Stream x transfer error interrupt flag              (x=3..0)
    def self.teif3 : Bool
      value.teif3
    end

    # Stream x direct mode error interrupt              flag (x=3..0)
    def dmeif3 : Bool
      @value.bits_set?(0x1000000_u32)
    end

    # Stream x direct mode error interrupt              flag (x=3..0)
    def self.dmeif3 : Bool
      value.dmeif3
    end

    # Stream x FIFO error interrupt flag              (x=3..0)
    def feif3 : Bool
      @value.bits_set?(0x400000_u32)
    end

    # Stream x FIFO error interrupt flag              (x=3..0)
    def self.feif3 : Bool
      value.feif3
    end

    # Stream x transfer complete interrupt              flag (x = 3..0)
    def tcif2 : Bool
      @value.bits_set?(0x200000_u32)
    end

    # Stream x transfer complete interrupt              flag (x = 3..0)
    def self.tcif2 : Bool
      value.tcif2
    end

    # Stream x half transfer interrupt flag              (x=3..0)
    def htif2 : Bool
      @value.bits_set?(0x100000_u32)
    end

    # Stream x half transfer interrupt flag              (x=3..0)
    def self.htif2 : Bool
      value.htif2
    end

    # Stream x transfer error interrupt flag              (x=3..0)
    def teif2 : Bool
      @value.bits_set?(0x80000_u32)
    end

    # Stream x transfer error interrupt flag              (x=3..0)
    def self.teif2 : Bool
      value.teif2
    end

    # Stream x direct mode error interrupt              flag (x=3..0)
    def dmeif2 : Bool
      @value.bits_set?(0x40000_u32)
    end

    # Stream x direct mode error interrupt              flag (x=3..0)
    def self.dmeif2 : Bool
      value.dmeif2
    end

    # Stream x FIFO error interrupt flag              (x=3..0)
    def feif2 : Bool
      @value.bits_set?(0x10000_u32)
    end

    # Stream x FIFO error interrupt flag              (x=3..0)
    def self.feif2 : Bool
      value.feif2
    end

    # Stream x transfer complete interrupt              flag (x = 3..0)
    def tcif1 : Bool
      @value.bits_set?(0x800_u32)
    end

    # Stream x transfer complete interrupt              flag (x = 3..0)
    def self.tcif1 : Bool
      value.tcif1
    end

    # Stream x half transfer interrupt flag              (x=3..0)
    def htif1 : Bool
      @value.bits_set?(0x400_u32)
    end

    # Stream x half transfer interrupt flag              (x=3..0)
    def self.htif1 : Bool
      value.htif1
    end

    # Stream x transfer error interrupt flag              (x=3..0)
    def teif1 : Bool
      @value.bits_set?(0x200_u32)
    end

    # Stream x transfer error interrupt flag              (x=3..0)
    def self.teif1 : Bool
      value.teif1
    end

    # Stream x direct mode error interrupt              flag (x=3..0)
    def dmeif1 : Bool
      @value.bits_set?(0x100_u32)
    end

    # Stream x direct mode error interrupt              flag (x=3..0)
    def self.dmeif1 : Bool
      value.dmeif1
    end

    # Stream x FIFO error interrupt flag              (x=3..0)
    def feif1 : Bool
      @value.bits_set?(0x40_u32)
    end

    # Stream x FIFO error interrupt flag              (x=3..0)
    def self.feif1 : Bool
      value.feif1
    end

    # Stream x transfer complete interrupt              flag (x = 3..0)
    def tcif0 : Bool
      @value.bits_set?(0x20_u32)
    end

    # Stream x transfer complete interrupt              flag (x = 3..0)
    def self.tcif0 : Bool
      value.tcif0
    end

    # Stream x half transfer interrupt flag              (x=3..0)
    def htif0 : Bool
      @value.bits_set?(0x10_u32)
    end

    # Stream x half transfer interrupt flag              (x=3..0)
    def self.htif0 : Bool
      value.htif0
    end

    # Stream x transfer error interrupt flag              (x=3..0)
    def teif0 : Bool
      @value.bits_set?(0x8_u32)
    end

    # Stream x transfer error interrupt flag              (x=3..0)
    def self.teif0 : Bool
      value.teif0
    end

    # Stream x direct mode error interrupt              flag (x=3..0)
    def dmeif0 : Bool
      @value.bits_set?(0x4_u32)
    end

    # Stream x direct mode error interrupt              flag (x=3..0)
    def self.dmeif0 : Bool
      value.dmeif0
    end

    # Stream x FIFO error interrupt flag              (x=3..0)
    def feif0 : Bool
      @value.bits_set?(0x1_u32)
    end

    # Stream x FIFO error interrupt flag              (x=3..0)
    def self.feif0 : Bool
      value.feif0
    end
  end # struct

  # high interrupt status register
  struct HISR
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

    # Stream x transfer complete interrupt              flag (x=7..4)
    def tcif7 : Bool
      @value.bits_set?(0x8000000_u32)
    end

    # Stream x transfer complete interrupt              flag (x=7..4)
    def self.tcif7 : Bool
      value.tcif7
    end

    # Stream x half transfer interrupt flag              (x=7..4)
    def htif7 : Bool
      @value.bits_set?(0x4000000_u32)
    end

    # Stream x half transfer interrupt flag              (x=7..4)
    def self.htif7 : Bool
      value.htif7
    end

    # Stream x transfer error interrupt flag              (x=7..4)
    def teif7 : Bool
      @value.bits_set?(0x2000000_u32)
    end

    # Stream x transfer error interrupt flag              (x=7..4)
    def self.teif7 : Bool
      value.teif7
    end

    # Stream x direct mode error interrupt              flag (x=7..4)
    def dmeif7 : Bool
      @value.bits_set?(0x1000000_u32)
    end

    # Stream x direct mode error interrupt              flag (x=7..4)
    def self.dmeif7 : Bool
      value.dmeif7
    end

    # Stream x FIFO error interrupt flag              (x=7..4)
    def feif7 : Bool
      @value.bits_set?(0x400000_u32)
    end

    # Stream x FIFO error interrupt flag              (x=7..4)
    def self.feif7 : Bool
      value.feif7
    end

    # Stream x transfer complete interrupt              flag (x=7..4)
    def tcif6 : Bool
      @value.bits_set?(0x200000_u32)
    end

    # Stream x transfer complete interrupt              flag (x=7..4)
    def self.tcif6 : Bool
      value.tcif6
    end

    # Stream x half transfer interrupt flag              (x=7..4)
    def htif6 : Bool
      @value.bits_set?(0x100000_u32)
    end

    # Stream x half transfer interrupt flag              (x=7..4)
    def self.htif6 : Bool
      value.htif6
    end

    # Stream x transfer error interrupt flag              (x=7..4)
    def teif6 : Bool
      @value.bits_set?(0x80000_u32)
    end

    # Stream x transfer error interrupt flag              (x=7..4)
    def self.teif6 : Bool
      value.teif6
    end

    # Stream x direct mode error interrupt              flag (x=7..4)
    def dmeif6 : Bool
      @value.bits_set?(0x40000_u32)
    end

    # Stream x direct mode error interrupt              flag (x=7..4)
    def self.dmeif6 : Bool
      value.dmeif6
    end

    # Stream x FIFO error interrupt flag              (x=7..4)
    def feif6 : Bool
      @value.bits_set?(0x10000_u32)
    end

    # Stream x FIFO error interrupt flag              (x=7..4)
    def self.feif6 : Bool
      value.feif6
    end

    # Stream x transfer complete interrupt              flag (x=7..4)
    def tcif5 : Bool
      @value.bits_set?(0x800_u32)
    end

    # Stream x transfer complete interrupt              flag (x=7..4)
    def self.tcif5 : Bool
      value.tcif5
    end

    # Stream x half transfer interrupt flag              (x=7..4)
    def htif5 : Bool
      @value.bits_set?(0x400_u32)
    end

    # Stream x half transfer interrupt flag              (x=7..4)
    def self.htif5 : Bool
      value.htif5
    end

    # Stream x transfer error interrupt flag              (x=7..4)
    def teif5 : Bool
      @value.bits_set?(0x200_u32)
    end

    # Stream x transfer error interrupt flag              (x=7..4)
    def self.teif5 : Bool
      value.teif5
    end

    # Stream x direct mode error interrupt              flag (x=7..4)
    def dmeif5 : Bool
      @value.bits_set?(0x100_u32)
    end

    # Stream x direct mode error interrupt              flag (x=7..4)
    def self.dmeif5 : Bool
      value.dmeif5
    end

    # Stream x FIFO error interrupt flag              (x=7..4)
    def feif5 : Bool
      @value.bits_set?(0x40_u32)
    end

    # Stream x FIFO error interrupt flag              (x=7..4)
    def self.feif5 : Bool
      value.feif5
    end

    # Stream x transfer complete interrupt              flag (x=7..4)
    def tcif4 : Bool
      @value.bits_set?(0x20_u32)
    end

    # Stream x transfer complete interrupt              flag (x=7..4)
    def self.tcif4 : Bool
      value.tcif4
    end

    # Stream x half transfer interrupt flag              (x=7..4)
    def htif4 : Bool
      @value.bits_set?(0x10_u32)
    end

    # Stream x half transfer interrupt flag              (x=7..4)
    def self.htif4 : Bool
      value.htif4
    end

    # Stream x transfer error interrupt flag              (x=7..4)
    def teif4 : Bool
      @value.bits_set?(0x8_u32)
    end

    # Stream x transfer error interrupt flag              (x=7..4)
    def self.teif4 : Bool
      value.teif4
    end

    # Stream x direct mode error interrupt              flag (x=7..4)
    def dmeif4 : Bool
      @value.bits_set?(0x4_u32)
    end

    # Stream x direct mode error interrupt              flag (x=7..4)
    def self.dmeif4 : Bool
      value.dmeif4
    end

    # Stream x FIFO error interrupt flag              (x=7..4)
    def feif4 : Bool
      @value.bits_set?(0x1_u32)
    end

    # Stream x FIFO error interrupt flag              (x=7..4)
    def self.feif4 : Bool
      value.feif4
    end
  end # struct

  # low interrupt flag clear          register
  struct LIFCR
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

    # Stream x clear transfer complete              interrupt flag (x = 3..0)
    def ctcif3 : Bool
      @value.bits_set?(0x8000000_u32)
    end

    # Stream x clear transfer complete              interrupt flag (x = 3..0)
    def self.ctcif3 : Bool
      value.ctcif3
    end

    # Stream x clear transfer complete              interrupt flag (x = 3..0)
    def self.ctcif3=(value : Bool) : Bool
      self.set(ctcif3: value)
      value
    end

    # Stream x clear half transfer interrupt              flag (x = 3..0)
    def chtif3 : Bool
      @value.bits_set?(0x4000000_u32)
    end

    # Stream x clear half transfer interrupt              flag (x = 3..0)
    def self.chtif3 : Bool
      value.chtif3
    end

    # Stream x clear half transfer interrupt              flag (x = 3..0)
    def self.chtif3=(value : Bool) : Bool
      self.set(chtif3: value)
      value
    end

    # Stream x clear transfer error interrupt              flag (x = 3..0)
    def cteif3 : Bool
      @value.bits_set?(0x2000000_u32)
    end

    # Stream x clear transfer error interrupt              flag (x = 3..0)
    def self.cteif3 : Bool
      value.cteif3
    end

    # Stream x clear transfer error interrupt              flag (x = 3..0)
    def self.cteif3=(value : Bool) : Bool
      self.set(cteif3: value)
      value
    end

    # Stream x clear direct mode error              interrupt flag (x = 3..0)
    def cdmeif3 : Bool
      @value.bits_set?(0x1000000_u32)
    end

    # Stream x clear direct mode error              interrupt flag (x = 3..0)
    def self.cdmeif3 : Bool
      value.cdmeif3
    end

    # Stream x clear direct mode error              interrupt flag (x = 3..0)
    def self.cdmeif3=(value : Bool) : Bool
      self.set(cdmeif3: value)
      value
    end

    # Stream x clear FIFO error interrupt flag              (x = 3..0)
    def cfeif3 : Bool
      @value.bits_set?(0x400000_u32)
    end

    # Stream x clear FIFO error interrupt flag              (x = 3..0)
    def self.cfeif3 : Bool
      value.cfeif3
    end

    # Stream x clear FIFO error interrupt flag              (x = 3..0)
    def self.cfeif3=(value : Bool) : Bool
      self.set(cfeif3: value)
      value
    end

    # Stream x clear transfer complete              interrupt flag (x = 3..0)
    def ctcif2 : Bool
      @value.bits_set?(0x200000_u32)
    end

    # Stream x clear transfer complete              interrupt flag (x = 3..0)
    def self.ctcif2 : Bool
      value.ctcif2
    end

    # Stream x clear transfer complete              interrupt flag (x = 3..0)
    def self.ctcif2=(value : Bool) : Bool
      self.set(ctcif2: value)
      value
    end

    # Stream x clear half transfer interrupt              flag (x = 3..0)
    def chtif2 : Bool
      @value.bits_set?(0x100000_u32)
    end

    # Stream x clear half transfer interrupt              flag (x = 3..0)
    def self.chtif2 : Bool
      value.chtif2
    end

    # Stream x clear half transfer interrupt              flag (x = 3..0)
    def self.chtif2=(value : Bool) : Bool
      self.set(chtif2: value)
      value
    end

    # Stream x clear transfer error interrupt              flag (x = 3..0)
    def cteif2 : Bool
      @value.bits_set?(0x80000_u32)
    end

    # Stream x clear transfer error interrupt              flag (x = 3..0)
    def self.cteif2 : Bool
      value.cteif2
    end

    # Stream x clear transfer error interrupt              flag (x = 3..0)
    def self.cteif2=(value : Bool) : Bool
      self.set(cteif2: value)
      value
    end

    # Stream x clear direct mode error              interrupt flag (x = 3..0)
    def cdmeif2 : Bool
      @value.bits_set?(0x40000_u32)
    end

    # Stream x clear direct mode error              interrupt flag (x = 3..0)
    def self.cdmeif2 : Bool
      value.cdmeif2
    end

    # Stream x clear direct mode error              interrupt flag (x = 3..0)
    def self.cdmeif2=(value : Bool) : Bool
      self.set(cdmeif2: value)
      value
    end

    # Stream x clear FIFO error interrupt flag              (x = 3..0)
    def cfeif2 : Bool
      @value.bits_set?(0x10000_u32)
    end

    # Stream x clear FIFO error interrupt flag              (x = 3..0)
    def self.cfeif2 : Bool
      value.cfeif2
    end

    # Stream x clear FIFO error interrupt flag              (x = 3..0)
    def self.cfeif2=(value : Bool) : Bool
      self.set(cfeif2: value)
      value
    end

    # Stream x clear transfer complete              interrupt flag (x = 3..0)
    def ctcif1 : Bool
      @value.bits_set?(0x800_u32)
    end

    # Stream x clear transfer complete              interrupt flag (x = 3..0)
    def self.ctcif1 : Bool
      value.ctcif1
    end

    # Stream x clear transfer complete              interrupt flag (x = 3..0)
    def self.ctcif1=(value : Bool) : Bool
      self.set(ctcif1: value)
      value
    end

    # Stream x clear half transfer interrupt              flag (x = 3..0)
    def chtif1 : Bool
      @value.bits_set?(0x400_u32)
    end

    # Stream x clear half transfer interrupt              flag (x = 3..0)
    def self.chtif1 : Bool
      value.chtif1
    end

    # Stream x clear half transfer interrupt              flag (x = 3..0)
    def self.chtif1=(value : Bool) : Bool
      self.set(chtif1: value)
      value
    end

    # Stream x clear transfer error interrupt              flag (x = 3..0)
    def cteif1 : Bool
      @value.bits_set?(0x200_u32)
    end

    # Stream x clear transfer error interrupt              flag (x = 3..0)
    def self.cteif1 : Bool
      value.cteif1
    end

    # Stream x clear transfer error interrupt              flag (x = 3..0)
    def self.cteif1=(value : Bool) : Bool
      self.set(cteif1: value)
      value
    end

    # Stream x clear direct mode error              interrupt flag (x = 3..0)
    def cdmeif1 : Bool
      @value.bits_set?(0x100_u32)
    end

    # Stream x clear direct mode error              interrupt flag (x = 3..0)
    def self.cdmeif1 : Bool
      value.cdmeif1
    end

    # Stream x clear direct mode error              interrupt flag (x = 3..0)
    def self.cdmeif1=(value : Bool) : Bool
      self.set(cdmeif1: value)
      value
    end

    # Stream x clear FIFO error interrupt flag              (x = 3..0)
    def cfeif1 : Bool
      @value.bits_set?(0x40_u32)
    end

    # Stream x clear FIFO error interrupt flag              (x = 3..0)
    def self.cfeif1 : Bool
      value.cfeif1
    end

    # Stream x clear FIFO error interrupt flag              (x = 3..0)
    def self.cfeif1=(value : Bool) : Bool
      self.set(cfeif1: value)
      value
    end

    # Stream x clear transfer complete              interrupt flag (x = 3..0)
    def ctcif0 : Bool
      @value.bits_set?(0x20_u32)
    end

    # Stream x clear transfer complete              interrupt flag (x = 3..0)
    def self.ctcif0 : Bool
      value.ctcif0
    end

    # Stream x clear transfer complete              interrupt flag (x = 3..0)
    def self.ctcif0=(value : Bool) : Bool
      self.set(ctcif0: value)
      value
    end

    # Stream x clear half transfer interrupt              flag (x = 3..0)
    def chtif0 : Bool
      @value.bits_set?(0x10_u32)
    end

    # Stream x clear half transfer interrupt              flag (x = 3..0)
    def self.chtif0 : Bool
      value.chtif0
    end

    # Stream x clear half transfer interrupt              flag (x = 3..0)
    def self.chtif0=(value : Bool) : Bool
      self.set(chtif0: value)
      value
    end

    # Stream x clear transfer error interrupt              flag (x = 3..0)
    def cteif0 : Bool
      @value.bits_set?(0x8_u32)
    end

    # Stream x clear transfer error interrupt              flag (x = 3..0)
    def self.cteif0 : Bool
      value.cteif0
    end

    # Stream x clear transfer error interrupt              flag (x = 3..0)
    def self.cteif0=(value : Bool) : Bool
      self.set(cteif0: value)
      value
    end

    # Stream x clear direct mode error              interrupt flag (x = 3..0)
    def cdmeif0 : Bool
      @value.bits_set?(0x4_u32)
    end

    # Stream x clear direct mode error              interrupt flag (x = 3..0)
    def self.cdmeif0 : Bool
      value.cdmeif0
    end

    # Stream x clear direct mode error              interrupt flag (x = 3..0)
    def self.cdmeif0=(value : Bool) : Bool
      self.set(cdmeif0: value)
      value
    end

    # Stream x clear FIFO error interrupt flag              (x = 3..0)
    def cfeif0 : Bool
      @value.bits_set?(0x1_u32)
    end

    # Stream x clear FIFO error interrupt flag              (x = 3..0)
    def self.cfeif0 : Bool
      value.cfeif0
    end

    # Stream x clear FIFO error interrupt flag              (x = 3..0)
    def self.cfeif0=(value : Bool) : Bool
      self.set(cfeif0: value)
      value
    end

    def copy_with(
      *,

      ctcif3 : Bool? = nil,

      chtif3 : Bool? = nil,

      cteif3 : Bool? = nil,

      cdmeif3 : Bool? = nil,

      cfeif3 : Bool? = nil,

      ctcif2 : Bool? = nil,

      chtif2 : Bool? = nil,

      cteif2 : Bool? = nil,

      cdmeif2 : Bool? = nil,

      cfeif2 : Bool? = nil,

      ctcif1 : Bool? = nil,

      chtif1 : Bool? = nil,

      cteif1 : Bool? = nil,

      cdmeif1 : Bool? = nil,

      cfeif1 : Bool? = nil,

      ctcif0 : Bool? = nil,

      chtif0 : Bool? = nil,

      cteif0 : Bool? = nil,

      cdmeif0 : Bool? = nil,

      cfeif0 : Bool? = nil
    ) : self
      value = @value

      unless ctcif3.nil?
        value = (value & 0xf7ffffff_u32) |
                UInt32.new!(ctcif3.to_int).&(0x1_u32) << 27
      end

      unless chtif3.nil?
        value = (value & 0xfbffffff_u32) |
                UInt32.new!(chtif3.to_int).&(0x1_u32) << 26
      end

      unless cteif3.nil?
        value = (value & 0xfdffffff_u32) |
                UInt32.new!(cteif3.to_int).&(0x1_u32) << 25
      end

      unless cdmeif3.nil?
        value = (value & 0xfeffffff_u32) |
                UInt32.new!(cdmeif3.to_int).&(0x1_u32) << 24
      end

      unless cfeif3.nil?
        value = (value & 0xffbfffff_u32) |
                UInt32.new!(cfeif3.to_int).&(0x1_u32) << 22
      end

      unless ctcif2.nil?
        value = (value & 0xffdfffff_u32) |
                UInt32.new!(ctcif2.to_int).&(0x1_u32) << 21
      end

      unless chtif2.nil?
        value = (value & 0xffefffff_u32) |
                UInt32.new!(chtif2.to_int).&(0x1_u32) << 20
      end

      unless cteif2.nil?
        value = (value & 0xfff7ffff_u32) |
                UInt32.new!(cteif2.to_int).&(0x1_u32) << 19
      end

      unless cdmeif2.nil?
        value = (value & 0xfffbffff_u32) |
                UInt32.new!(cdmeif2.to_int).&(0x1_u32) << 18
      end

      unless cfeif2.nil?
        value = (value & 0xfffeffff_u32) |
                UInt32.new!(cfeif2.to_int).&(0x1_u32) << 16
      end

      unless ctcif1.nil?
        value = (value & 0xfffff7ff_u32) |
                UInt32.new!(ctcif1.to_int).&(0x1_u32) << 11
      end

      unless chtif1.nil?
        value = (value & 0xfffffbff_u32) |
                UInt32.new!(chtif1.to_int).&(0x1_u32) << 10
      end

      unless cteif1.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(cteif1.to_int).&(0x1_u32) << 9
      end

      unless cdmeif1.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(cdmeif1.to_int).&(0x1_u32) << 8
      end

      unless cfeif1.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(cfeif1.to_int).&(0x1_u32) << 6
      end

      unless ctcif0.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(ctcif0.to_int).&(0x1_u32) << 5
      end

      unless chtif0.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(chtif0.to_int).&(0x1_u32) << 4
      end

      unless cteif0.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(cteif0.to_int).&(0x1_u32) << 3
      end

      unless cdmeif0.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(cdmeif0.to_int).&(0x1_u32) << 2
      end

      unless cfeif0.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(cfeif0.to_int).&(0x1_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      ctcif3 : Bool? = nil,
      chtif3 : Bool? = nil,
      cteif3 : Bool? = nil,
      cdmeif3 : Bool? = nil,
      cfeif3 : Bool? = nil,
      ctcif2 : Bool? = nil,
      chtif2 : Bool? = nil,
      cteif2 : Bool? = nil,
      cdmeif2 : Bool? = nil,
      cfeif2 : Bool? = nil,
      ctcif1 : Bool? = nil,
      chtif1 : Bool? = nil,
      cteif1 : Bool? = nil,
      cdmeif1 : Bool? = nil,
      cfeif1 : Bool? = nil,
      ctcif0 : Bool? = nil,
      chtif0 : Bool? = nil,
      cteif0 : Bool? = nil,
      cdmeif0 : Bool? = nil,
      cfeif0 : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        ctcif3: ctcif3,
        chtif3: chtif3,
        cteif3: cteif3,
        cdmeif3: cdmeif3,
        cfeif3: cfeif3,
        ctcif2: ctcif2,
        chtif2: chtif2,
        cteif2: cteif2,
        cdmeif2: cdmeif2,
        cfeif2: cfeif2,
        ctcif1: ctcif1,
        chtif1: chtif1,
        cteif1: cteif1,
        cdmeif1: cdmeif1,
        cfeif1: cfeif1,
        ctcif0: ctcif0,
        chtif0: chtif0,
        cteif0: cteif0,
        cdmeif0: cdmeif0,
        cfeif0: cfeif0,
      )
    end
  end # struct

  # high interrupt flag clear          register
  struct HIFCR
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

    # Stream x clear transfer complete              interrupt flag (x = 7..4)
    def ctcif7 : Bool
      @value.bits_set?(0x8000000_u32)
    end

    # Stream x clear transfer complete              interrupt flag (x = 7..4)
    def self.ctcif7 : Bool
      value.ctcif7
    end

    # Stream x clear transfer complete              interrupt flag (x = 7..4)
    def self.ctcif7=(value : Bool) : Bool
      self.set(ctcif7: value)
      value
    end

    # Stream x clear half transfer interrupt              flag (x = 7..4)
    def chtif7 : Bool
      @value.bits_set?(0x4000000_u32)
    end

    # Stream x clear half transfer interrupt              flag (x = 7..4)
    def self.chtif7 : Bool
      value.chtif7
    end

    # Stream x clear half transfer interrupt              flag (x = 7..4)
    def self.chtif7=(value : Bool) : Bool
      self.set(chtif7: value)
      value
    end

    # Stream x clear transfer error interrupt              flag (x = 7..4)
    def cteif7 : Bool
      @value.bits_set?(0x2000000_u32)
    end

    # Stream x clear transfer error interrupt              flag (x = 7..4)
    def self.cteif7 : Bool
      value.cteif7
    end

    # Stream x clear transfer error interrupt              flag (x = 7..4)
    def self.cteif7=(value : Bool) : Bool
      self.set(cteif7: value)
      value
    end

    # Stream x clear direct mode error              interrupt flag (x = 7..4)
    def cdmeif7 : Bool
      @value.bits_set?(0x1000000_u32)
    end

    # Stream x clear direct mode error              interrupt flag (x = 7..4)
    def self.cdmeif7 : Bool
      value.cdmeif7
    end

    # Stream x clear direct mode error              interrupt flag (x = 7..4)
    def self.cdmeif7=(value : Bool) : Bool
      self.set(cdmeif7: value)
      value
    end

    # Stream x clear FIFO error interrupt flag              (x = 7..4)
    def cfeif7 : Bool
      @value.bits_set?(0x400000_u32)
    end

    # Stream x clear FIFO error interrupt flag              (x = 7..4)
    def self.cfeif7 : Bool
      value.cfeif7
    end

    # Stream x clear FIFO error interrupt flag              (x = 7..4)
    def self.cfeif7=(value : Bool) : Bool
      self.set(cfeif7: value)
      value
    end

    # Stream x clear transfer complete              interrupt flag (x = 7..4)
    def ctcif6 : Bool
      @value.bits_set?(0x200000_u32)
    end

    # Stream x clear transfer complete              interrupt flag (x = 7..4)
    def self.ctcif6 : Bool
      value.ctcif6
    end

    # Stream x clear transfer complete              interrupt flag (x = 7..4)
    def self.ctcif6=(value : Bool) : Bool
      self.set(ctcif6: value)
      value
    end

    # Stream x clear half transfer interrupt              flag (x = 7..4)
    def chtif6 : Bool
      @value.bits_set?(0x100000_u32)
    end

    # Stream x clear half transfer interrupt              flag (x = 7..4)
    def self.chtif6 : Bool
      value.chtif6
    end

    # Stream x clear half transfer interrupt              flag (x = 7..4)
    def self.chtif6=(value : Bool) : Bool
      self.set(chtif6: value)
      value
    end

    # Stream x clear transfer error interrupt              flag (x = 7..4)
    def cteif6 : Bool
      @value.bits_set?(0x80000_u32)
    end

    # Stream x clear transfer error interrupt              flag (x = 7..4)
    def self.cteif6 : Bool
      value.cteif6
    end

    # Stream x clear transfer error interrupt              flag (x = 7..4)
    def self.cteif6=(value : Bool) : Bool
      self.set(cteif6: value)
      value
    end

    # Stream x clear direct mode error              interrupt flag (x = 7..4)
    def cdmeif6 : Bool
      @value.bits_set?(0x40000_u32)
    end

    # Stream x clear direct mode error              interrupt flag (x = 7..4)
    def self.cdmeif6 : Bool
      value.cdmeif6
    end

    # Stream x clear direct mode error              interrupt flag (x = 7..4)
    def self.cdmeif6=(value : Bool) : Bool
      self.set(cdmeif6: value)
      value
    end

    # Stream x clear FIFO error interrupt flag              (x = 7..4)
    def cfeif6 : Bool
      @value.bits_set?(0x10000_u32)
    end

    # Stream x clear FIFO error interrupt flag              (x = 7..4)
    def self.cfeif6 : Bool
      value.cfeif6
    end

    # Stream x clear FIFO error interrupt flag              (x = 7..4)
    def self.cfeif6=(value : Bool) : Bool
      self.set(cfeif6: value)
      value
    end

    # Stream x clear transfer complete              interrupt flag (x = 7..4)
    def ctcif5 : Bool
      @value.bits_set?(0x800_u32)
    end

    # Stream x clear transfer complete              interrupt flag (x = 7..4)
    def self.ctcif5 : Bool
      value.ctcif5
    end

    # Stream x clear transfer complete              interrupt flag (x = 7..4)
    def self.ctcif5=(value : Bool) : Bool
      self.set(ctcif5: value)
      value
    end

    # Stream x clear half transfer interrupt              flag (x = 7..4)
    def chtif5 : Bool
      @value.bits_set?(0x400_u32)
    end

    # Stream x clear half transfer interrupt              flag (x = 7..4)
    def self.chtif5 : Bool
      value.chtif5
    end

    # Stream x clear half transfer interrupt              flag (x = 7..4)
    def self.chtif5=(value : Bool) : Bool
      self.set(chtif5: value)
      value
    end

    # Stream x clear transfer error interrupt              flag (x = 7..4)
    def cteif5 : Bool
      @value.bits_set?(0x200_u32)
    end

    # Stream x clear transfer error interrupt              flag (x = 7..4)
    def self.cteif5 : Bool
      value.cteif5
    end

    # Stream x clear transfer error interrupt              flag (x = 7..4)
    def self.cteif5=(value : Bool) : Bool
      self.set(cteif5: value)
      value
    end

    # Stream x clear direct mode error              interrupt flag (x = 7..4)
    def cdmeif5 : Bool
      @value.bits_set?(0x100_u32)
    end

    # Stream x clear direct mode error              interrupt flag (x = 7..4)
    def self.cdmeif5 : Bool
      value.cdmeif5
    end

    # Stream x clear direct mode error              interrupt flag (x = 7..4)
    def self.cdmeif5=(value : Bool) : Bool
      self.set(cdmeif5: value)
      value
    end

    # Stream x clear FIFO error interrupt flag              (x = 7..4)
    def cfeif5 : Bool
      @value.bits_set?(0x40_u32)
    end

    # Stream x clear FIFO error interrupt flag              (x = 7..4)
    def self.cfeif5 : Bool
      value.cfeif5
    end

    # Stream x clear FIFO error interrupt flag              (x = 7..4)
    def self.cfeif5=(value : Bool) : Bool
      self.set(cfeif5: value)
      value
    end

    # Stream x clear transfer complete              interrupt flag (x = 7..4)
    def ctcif4 : Bool
      @value.bits_set?(0x20_u32)
    end

    # Stream x clear transfer complete              interrupt flag (x = 7..4)
    def self.ctcif4 : Bool
      value.ctcif4
    end

    # Stream x clear transfer complete              interrupt flag (x = 7..4)
    def self.ctcif4=(value : Bool) : Bool
      self.set(ctcif4: value)
      value
    end

    # Stream x clear half transfer interrupt              flag (x = 7..4)
    def chtif4 : Bool
      @value.bits_set?(0x10_u32)
    end

    # Stream x clear half transfer interrupt              flag (x = 7..4)
    def self.chtif4 : Bool
      value.chtif4
    end

    # Stream x clear half transfer interrupt              flag (x = 7..4)
    def self.chtif4=(value : Bool) : Bool
      self.set(chtif4: value)
      value
    end

    # Stream x clear transfer error interrupt              flag (x = 7..4)
    def cteif4 : Bool
      @value.bits_set?(0x8_u32)
    end

    # Stream x clear transfer error interrupt              flag (x = 7..4)
    def self.cteif4 : Bool
      value.cteif4
    end

    # Stream x clear transfer error interrupt              flag (x = 7..4)
    def self.cteif4=(value : Bool) : Bool
      self.set(cteif4: value)
      value
    end

    # Stream x clear direct mode error              interrupt flag (x = 7..4)
    def cdmeif4 : Bool
      @value.bits_set?(0x4_u32)
    end

    # Stream x clear direct mode error              interrupt flag (x = 7..4)
    def self.cdmeif4 : Bool
      value.cdmeif4
    end

    # Stream x clear direct mode error              interrupt flag (x = 7..4)
    def self.cdmeif4=(value : Bool) : Bool
      self.set(cdmeif4: value)
      value
    end

    # Stream x clear FIFO error interrupt flag              (x = 7..4)
    def cfeif4 : Bool
      @value.bits_set?(0x1_u32)
    end

    # Stream x clear FIFO error interrupt flag              (x = 7..4)
    def self.cfeif4 : Bool
      value.cfeif4
    end

    # Stream x clear FIFO error interrupt flag              (x = 7..4)
    def self.cfeif4=(value : Bool) : Bool
      self.set(cfeif4: value)
      value
    end

    def copy_with(
      *,

      ctcif7 : Bool? = nil,

      chtif7 : Bool? = nil,

      cteif7 : Bool? = nil,

      cdmeif7 : Bool? = nil,

      cfeif7 : Bool? = nil,

      ctcif6 : Bool? = nil,

      chtif6 : Bool? = nil,

      cteif6 : Bool? = nil,

      cdmeif6 : Bool? = nil,

      cfeif6 : Bool? = nil,

      ctcif5 : Bool? = nil,

      chtif5 : Bool? = nil,

      cteif5 : Bool? = nil,

      cdmeif5 : Bool? = nil,

      cfeif5 : Bool? = nil,

      ctcif4 : Bool? = nil,

      chtif4 : Bool? = nil,

      cteif4 : Bool? = nil,

      cdmeif4 : Bool? = nil,

      cfeif4 : Bool? = nil
    ) : self
      value = @value

      unless ctcif7.nil?
        value = (value & 0xf7ffffff_u32) |
                UInt32.new!(ctcif7.to_int).&(0x1_u32) << 27
      end

      unless chtif7.nil?
        value = (value & 0xfbffffff_u32) |
                UInt32.new!(chtif7.to_int).&(0x1_u32) << 26
      end

      unless cteif7.nil?
        value = (value & 0xfdffffff_u32) |
                UInt32.new!(cteif7.to_int).&(0x1_u32) << 25
      end

      unless cdmeif7.nil?
        value = (value & 0xfeffffff_u32) |
                UInt32.new!(cdmeif7.to_int).&(0x1_u32) << 24
      end

      unless cfeif7.nil?
        value = (value & 0xffbfffff_u32) |
                UInt32.new!(cfeif7.to_int).&(0x1_u32) << 22
      end

      unless ctcif6.nil?
        value = (value & 0xffdfffff_u32) |
                UInt32.new!(ctcif6.to_int).&(0x1_u32) << 21
      end

      unless chtif6.nil?
        value = (value & 0xffefffff_u32) |
                UInt32.new!(chtif6.to_int).&(0x1_u32) << 20
      end

      unless cteif6.nil?
        value = (value & 0xfff7ffff_u32) |
                UInt32.new!(cteif6.to_int).&(0x1_u32) << 19
      end

      unless cdmeif6.nil?
        value = (value & 0xfffbffff_u32) |
                UInt32.new!(cdmeif6.to_int).&(0x1_u32) << 18
      end

      unless cfeif6.nil?
        value = (value & 0xfffeffff_u32) |
                UInt32.new!(cfeif6.to_int).&(0x1_u32) << 16
      end

      unless ctcif5.nil?
        value = (value & 0xfffff7ff_u32) |
                UInt32.new!(ctcif5.to_int).&(0x1_u32) << 11
      end

      unless chtif5.nil?
        value = (value & 0xfffffbff_u32) |
                UInt32.new!(chtif5.to_int).&(0x1_u32) << 10
      end

      unless cteif5.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(cteif5.to_int).&(0x1_u32) << 9
      end

      unless cdmeif5.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(cdmeif5.to_int).&(0x1_u32) << 8
      end

      unless cfeif5.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(cfeif5.to_int).&(0x1_u32) << 6
      end

      unless ctcif4.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(ctcif4.to_int).&(0x1_u32) << 5
      end

      unless chtif4.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(chtif4.to_int).&(0x1_u32) << 4
      end

      unless cteif4.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(cteif4.to_int).&(0x1_u32) << 3
      end

      unless cdmeif4.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(cdmeif4.to_int).&(0x1_u32) << 2
      end

      unless cfeif4.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(cfeif4.to_int).&(0x1_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      ctcif7 : Bool? = nil,
      chtif7 : Bool? = nil,
      cteif7 : Bool? = nil,
      cdmeif7 : Bool? = nil,
      cfeif7 : Bool? = nil,
      ctcif6 : Bool? = nil,
      chtif6 : Bool? = nil,
      cteif6 : Bool? = nil,
      cdmeif6 : Bool? = nil,
      cfeif6 : Bool? = nil,
      ctcif5 : Bool? = nil,
      chtif5 : Bool? = nil,
      cteif5 : Bool? = nil,
      cdmeif5 : Bool? = nil,
      cfeif5 : Bool? = nil,
      ctcif4 : Bool? = nil,
      chtif4 : Bool? = nil,
      cteif4 : Bool? = nil,
      cdmeif4 : Bool? = nil,
      cfeif4 : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        ctcif7: ctcif7,
        chtif7: chtif7,
        cteif7: cteif7,
        cdmeif7: cdmeif7,
        cfeif7: cfeif7,
        ctcif6: ctcif6,
        chtif6: chtif6,
        cteif6: cteif6,
        cdmeif6: cdmeif6,
        cfeif6: cfeif6,
        ctcif5: ctcif5,
        chtif5: chtif5,
        cteif5: cteif5,
        cdmeif5: cdmeif5,
        cfeif5: cfeif5,
        ctcif4: ctcif4,
        chtif4: chtif4,
        cteif4: cteif4,
        cdmeif4: cdmeif4,
        cfeif4: cfeif4,
      )
    end
  end # struct

  # stream x configuration          register
  struct S0CR
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

    # Channel selection
    def chsel : UInt8
      UInt8.new!((@value >> 25) & 0x7_u32)
    end

    # Channel selection
    def self.chsel : UInt8
      value.chsel
    end

    # Channel selection
    def self.chsel=(value : UInt8) : UInt8
      self.set(chsel: value)
      value
    end

    # Memory burst transfer              configuration
    def mburst : UInt8
      UInt8.new!((@value >> 23) & 0x3_u32)
    end

    # Memory burst transfer              configuration
    def self.mburst : UInt8
      value.mburst
    end

    # Memory burst transfer              configuration
    def self.mburst=(value : UInt8) : UInt8
      self.set(mburst: value)
      value
    end

    # Peripheral burst transfer              configuration
    def pburst : UInt8
      UInt8.new!((@value >> 21) & 0x3_u32)
    end

    # Peripheral burst transfer              configuration
    def self.pburst : UInt8
      value.pburst
    end

    # Peripheral burst transfer              configuration
    def self.pburst=(value : UInt8) : UInt8
      self.set(pburst: value)
      value
    end

    # Current target (only in double buffer              mode)
    def ct : Bool
      @value.bits_set?(0x80000_u32)
    end

    # Current target (only in double buffer              mode)
    def self.ct : Bool
      value.ct
    end

    # Current target (only in double buffer              mode)
    def self.ct=(value : Bool) : Bool
      self.set(ct: value)
      value
    end

    # Double buffer mode
    def dbm : Bool
      @value.bits_set?(0x40000_u32)
    end

    # Double buffer mode
    def self.dbm : Bool
      value.dbm
    end

    # Double buffer mode
    def self.dbm=(value : Bool) : Bool
      self.set(dbm: value)
      value
    end

    # Priority level
    def pl : UInt8
      UInt8.new!((@value >> 16) & 0x3_u32)
    end

    # Priority level
    def self.pl : UInt8
      value.pl
    end

    # Priority level
    def self.pl=(value : UInt8) : UInt8
      self.set(pl: value)
      value
    end

    # Peripheral increment offset              size
    def pincos : Bool
      @value.bits_set?(0x8000_u32)
    end

    # Peripheral increment offset              size
    def self.pincos : Bool
      value.pincos
    end

    # Peripheral increment offset              size
    def self.pincos=(value : Bool) : Bool
      self.set(pincos: value)
      value
    end

    # Memory data size
    def msize : UInt8
      UInt8.new!((@value >> 13) & 0x3_u32)
    end

    # Memory data size
    def self.msize : UInt8
      value.msize
    end

    # Memory data size
    def self.msize=(value : UInt8) : UInt8
      self.set(msize: value)
      value
    end

    # Peripheral data size
    def psize : UInt8
      UInt8.new!((@value >> 11) & 0x3_u32)
    end

    # Peripheral data size
    def self.psize : UInt8
      value.psize
    end

    # Peripheral data size
    def self.psize=(value : UInt8) : UInt8
      self.set(psize: value)
      value
    end

    # Memory increment mode
    def minc : Bool
      @value.bits_set?(0x400_u32)
    end

    # Memory increment mode
    def self.minc : Bool
      value.minc
    end

    # Memory increment mode
    def self.minc=(value : Bool) : Bool
      self.set(minc: value)
      value
    end

    # Peripheral increment mode
    def pinc : Bool
      @value.bits_set?(0x200_u32)
    end

    # Peripheral increment mode
    def self.pinc : Bool
      value.pinc
    end

    # Peripheral increment mode
    def self.pinc=(value : Bool) : Bool
      self.set(pinc: value)
      value
    end

    # Circular mode
    def circ : Bool
      @value.bits_set?(0x100_u32)
    end

    # Circular mode
    def self.circ : Bool
      value.circ
    end

    # Circular mode
    def self.circ=(value : Bool) : Bool
      self.set(circ: value)
      value
    end

    # Data transfer direction
    def dir : UInt8
      UInt8.new!((@value >> 6) & 0x3_u32)
    end

    # Data transfer direction
    def self.dir : UInt8
      value.dir
    end

    # Data transfer direction
    def self.dir=(value : UInt8) : UInt8
      self.set(dir: value)
      value
    end

    # Peripheral flow controller
    def pfctrl : Bool
      @value.bits_set?(0x20_u32)
    end

    # Peripheral flow controller
    def self.pfctrl : Bool
      value.pfctrl
    end

    # Peripheral flow controller
    def self.pfctrl=(value : Bool) : Bool
      self.set(pfctrl: value)
      value
    end

    # Transfer complete interrupt              enable
    def tcie : Bool
      @value.bits_set?(0x10_u32)
    end

    # Transfer complete interrupt              enable
    def self.tcie : Bool
      value.tcie
    end

    # Transfer complete interrupt              enable
    def self.tcie=(value : Bool) : Bool
      self.set(tcie: value)
      value
    end

    # Half transfer interrupt              enable
    def htie : Bool
      @value.bits_set?(0x8_u32)
    end

    # Half transfer interrupt              enable
    def self.htie : Bool
      value.htie
    end

    # Half transfer interrupt              enable
    def self.htie=(value : Bool) : Bool
      self.set(htie: value)
      value
    end

    # Transfer error interrupt              enable
    def teie : Bool
      @value.bits_set?(0x4_u32)
    end

    # Transfer error interrupt              enable
    def self.teie : Bool
      value.teie
    end

    # Transfer error interrupt              enable
    def self.teie=(value : Bool) : Bool
      self.set(teie: value)
      value
    end

    # Direct mode error interrupt              enable
    def dmeie : Bool
      @value.bits_set?(0x2_u32)
    end

    # Direct mode error interrupt              enable
    def self.dmeie : Bool
      value.dmeie
    end

    # Direct mode error interrupt              enable
    def self.dmeie=(value : Bool) : Bool
      self.set(dmeie: value)
      value
    end

    # Stream enable / flag stream ready when              read low
    def en : Bool
      @value.bits_set?(0x1_u32)
    end

    # Stream enable / flag stream ready when              read low
    def self.en : Bool
      value.en
    end

    # Stream enable / flag stream ready when              read low
    def self.en=(value : Bool) : Bool
      self.set(en: value)
      value
    end

    def copy_with(
      *,

      chsel : UInt8? = nil,

      mburst : UInt8? = nil,

      pburst : UInt8? = nil,

      ct : Bool? = nil,

      dbm : Bool? = nil,

      pl : UInt8? = nil,

      pincos : Bool? = nil,

      msize : UInt8? = nil,

      psize : UInt8? = nil,

      minc : Bool? = nil,

      pinc : Bool? = nil,

      circ : Bool? = nil,

      dir : UInt8? = nil,

      pfctrl : Bool? = nil,

      tcie : Bool? = nil,

      htie : Bool? = nil,

      teie : Bool? = nil,

      dmeie : Bool? = nil,

      en : Bool? = nil
    ) : self
      value = @value

      unless chsel.nil?
        value = (value & 0xf1ffffff_u32) |
                UInt32.new!(chsel.to_int).&(0x7_u32) << 25
      end

      unless mburst.nil?
        value = (value & 0xfe7fffff_u32) |
                UInt32.new!(mburst.to_int).&(0x3_u32) << 23
      end

      unless pburst.nil?
        value = (value & 0xff9fffff_u32) |
                UInt32.new!(pburst.to_int).&(0x3_u32) << 21
      end

      unless ct.nil?
        value = (value & 0xfff7ffff_u32) |
                UInt32.new!(ct.to_int).&(0x1_u32) << 19
      end

      unless dbm.nil?
        value = (value & 0xfffbffff_u32) |
                UInt32.new!(dbm.to_int).&(0x1_u32) << 18
      end

      unless pl.nil?
        value = (value & 0xfffcffff_u32) |
                UInt32.new!(pl.to_int).&(0x3_u32) << 16
      end

      unless pincos.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(pincos.to_int).&(0x1_u32) << 15
      end

      unless msize.nil?
        value = (value & 0xffff9fff_u32) |
                UInt32.new!(msize.to_int).&(0x3_u32) << 13
      end

      unless psize.nil?
        value = (value & 0xffffe7ff_u32) |
                UInt32.new!(psize.to_int).&(0x3_u32) << 11
      end

      unless minc.nil?
        value = (value & 0xfffffbff_u32) |
                UInt32.new!(minc.to_int).&(0x1_u32) << 10
      end

      unless pinc.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(pinc.to_int).&(0x1_u32) << 9
      end

      unless circ.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(circ.to_int).&(0x1_u32) << 8
      end

      unless dir.nil?
        value = (value & 0xffffff3f_u32) |
                UInt32.new!(dir.to_int).&(0x3_u32) << 6
      end

      unless pfctrl.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(pfctrl.to_int).&(0x1_u32) << 5
      end

      unless tcie.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(tcie.to_int).&(0x1_u32) << 4
      end

      unless htie.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(htie.to_int).&(0x1_u32) << 3
      end

      unless teie.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(teie.to_int).&(0x1_u32) << 2
      end

      unless dmeie.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(dmeie.to_int).&(0x1_u32) << 1
      end

      unless en.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(en.to_int).&(0x1_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      chsel : UInt8? = nil,
      mburst : UInt8? = nil,
      pburst : UInt8? = nil,
      ct : Bool? = nil,
      dbm : Bool? = nil,
      pl : UInt8? = nil,
      pincos : Bool? = nil,
      msize : UInt8? = nil,
      psize : UInt8? = nil,
      minc : Bool? = nil,
      pinc : Bool? = nil,
      circ : Bool? = nil,
      dir : UInt8? = nil,
      pfctrl : Bool? = nil,
      tcie : Bool? = nil,
      htie : Bool? = nil,
      teie : Bool? = nil,
      dmeie : Bool? = nil,
      en : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        chsel: chsel,
        mburst: mburst,
        pburst: pburst,
        ct: ct,
        dbm: dbm,
        pl: pl,
        pincos: pincos,
        msize: msize,
        psize: psize,
        minc: minc,
        pinc: pinc,
        circ: circ,
        dir: dir,
        pfctrl: pfctrl,
        tcie: tcie,
        htie: htie,
        teie: teie,
        dmeie: dmeie,
        en: en,
      )
    end
  end # struct

  # stream x number of data          register
  struct S0NDTR
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

    # Number of data items to              transfer
    def ndt : UInt16
      UInt16.new!((@value >> 0) & 0xffff_u32)
    end

    # Number of data items to              transfer
    def self.ndt : UInt16
      value.ndt
    end

    # Number of data items to              transfer
    def self.ndt=(value : UInt16) : UInt16
      self.set(ndt: value)
      value
    end

    def copy_with(
      *,

      ndt : UInt16? = nil
    ) : self
      value = @value

      unless ndt.nil?
        value = (value & 0xffff0000_u32) |
                UInt32.new!(ndt.to_int).&(0xffff_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      ndt : UInt16? = nil
    ) : Nil
      self.value = self.value.copy_with(
        ndt: ndt,
      )
    end
  end # struct

  # stream x peripheral address          register
  struct S0PAR
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

    # Peripheral address
    def pa : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # Peripheral address
    def self.pa : UInt32
      value.pa
    end

    # Peripheral address
    def self.pa=(value : UInt32) : UInt32
      self.set(pa: value)
      value
    end

    def copy_with(
      *,

      pa : UInt32? = nil
    ) : self
      value = @value

      unless pa.nil?
        value = (value & 0xffffffff_u32) |
                UInt32.new!(pa.to_int).&(0x0_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      pa : UInt32? = nil
    ) : Nil
      self.value = self.value.copy_with(
        pa: pa,
      )
    end
  end # struct

  # stream x memory 0 address          register
  struct S0M0AR
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

    # Memory 0 address
    def m0_a : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # Memory 0 address
    def self.m0_a : UInt32
      value.m0_a
    end

    # Memory 0 address
    def self.m0_a=(value : UInt32) : UInt32
      self.set(m0_a: value)
      value
    end

    def copy_with(
      *,

      m0_a : UInt32? = nil
    ) : self
      value = @value

      unless m0_a.nil?
        value = (value & 0xffffffff_u32) |
                UInt32.new!(m0_a.to_int).&(0x0_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      m0_a : UInt32? = nil
    ) : Nil
      self.value = self.value.copy_with(
        m0_a: m0_a,
      )
    end
  end # struct

  # stream x memory 1 address          register
  struct S0M1AR
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

    # Memory 1 address (used in case of Double              buffer mode)
    def m1_a : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # Memory 1 address (used in case of Double              buffer mode)
    def self.m1_a : UInt32
      value.m1_a
    end

    # Memory 1 address (used in case of Double              buffer mode)
    def self.m1_a=(value : UInt32) : UInt32
      self.set(m1_a: value)
      value
    end

    def copy_with(
      *,

      m1_a : UInt32? = nil
    ) : self
      value = @value

      unless m1_a.nil?
        value = (value & 0xffffffff_u32) |
                UInt32.new!(m1_a.to_int).&(0x0_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      m1_a : UInt32? = nil
    ) : Nil
      self.value = self.value.copy_with(
        m1_a: m1_a,
      )
    end
  end # struct

  # stream x FIFO control register
  struct S0FCR
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
      new(0x21_u64)
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

    # FIFO error interrupt              enable
    def feie : Bool
      @value.bits_set?(0x80_u32)
    end

    # FIFO error interrupt              enable
    def self.feie : Bool
      value.feie
    end

    # FIFO error interrupt              enable
    def self.feie=(value : Bool) : Bool
      self.set(feie: value)
      value
    end

    # FIFO status
    def fs : UInt8
      UInt8.new!((@value >> 3) & 0x7_u32)
    end

    # FIFO status
    def self.fs : UInt8
      value.fs
    end

    # Direct mode disable
    def dmdis : Bool
      @value.bits_set?(0x4_u32)
    end

    # Direct mode disable
    def self.dmdis : Bool
      value.dmdis
    end

    # Direct mode disable
    def self.dmdis=(value : Bool) : Bool
      self.set(dmdis: value)
      value
    end

    # FIFO threshold selection
    def fth : UInt8
      UInt8.new!((@value >> 0) & 0x3_u32)
    end

    # FIFO threshold selection
    def self.fth : UInt8
      value.fth
    end

    # FIFO threshold selection
    def self.fth=(value : UInt8) : UInt8
      self.set(fth: value)
      value
    end

    def copy_with(
      *,

      feie : Bool? = nil,

      dmdis : Bool? = nil,

      fth : UInt8? = nil
    ) : self
      value = @value

      unless feie.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(feie.to_int).&(0x1_u32) << 7
      end

      unless dmdis.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(dmdis.to_int).&(0x1_u32) << 2
      end

      unless fth.nil?
        value = (value & 0xfffffffc_u32) |
                UInt32.new!(fth.to_int).&(0x3_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      feie : Bool? = nil,
      dmdis : Bool? = nil,
      fth : UInt8? = nil
    ) : Nil
      self.value = self.value.copy_with(
        feie: feie,
        dmdis: dmdis,
        fth: fth,
      )
    end
  end # struct

  # stream x configuration          register
  struct S1CR
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

    # Channel selection
    def chsel : UInt8
      UInt8.new!((@value >> 25) & 0x7_u32)
    end

    # Channel selection
    def self.chsel : UInt8
      value.chsel
    end

    # Channel selection
    def self.chsel=(value : UInt8) : UInt8
      self.set(chsel: value)
      value
    end

    # Memory burst transfer              configuration
    def mburst : UInt8
      UInt8.new!((@value >> 23) & 0x3_u32)
    end

    # Memory burst transfer              configuration
    def self.mburst : UInt8
      value.mburst
    end

    # Memory burst transfer              configuration
    def self.mburst=(value : UInt8) : UInt8
      self.set(mburst: value)
      value
    end

    # Peripheral burst transfer              configuration
    def pburst : UInt8
      UInt8.new!((@value >> 21) & 0x3_u32)
    end

    # Peripheral burst transfer              configuration
    def self.pburst : UInt8
      value.pburst
    end

    # Peripheral burst transfer              configuration
    def self.pburst=(value : UInt8) : UInt8
      self.set(pburst: value)
      value
    end

    # ACK
    def ack : Bool
      @value.bits_set?(0x100000_u32)
    end

    # ACK
    def self.ack : Bool
      value.ack
    end

    # ACK
    def self.ack=(value : Bool) : Bool
      self.set(ack: value)
      value
    end

    # Current target (only in double buffer              mode)
    def ct : Bool
      @value.bits_set?(0x80000_u32)
    end

    # Current target (only in double buffer              mode)
    def self.ct : Bool
      value.ct
    end

    # Current target (only in double buffer              mode)
    def self.ct=(value : Bool) : Bool
      self.set(ct: value)
      value
    end

    # Double buffer mode
    def dbm : Bool
      @value.bits_set?(0x40000_u32)
    end

    # Double buffer mode
    def self.dbm : Bool
      value.dbm
    end

    # Double buffer mode
    def self.dbm=(value : Bool) : Bool
      self.set(dbm: value)
      value
    end

    # Priority level
    def pl : UInt8
      UInt8.new!((@value >> 16) & 0x3_u32)
    end

    # Priority level
    def self.pl : UInt8
      value.pl
    end

    # Priority level
    def self.pl=(value : UInt8) : UInt8
      self.set(pl: value)
      value
    end

    # Peripheral increment offset              size
    def pincos : Bool
      @value.bits_set?(0x8000_u32)
    end

    # Peripheral increment offset              size
    def self.pincos : Bool
      value.pincos
    end

    # Peripheral increment offset              size
    def self.pincos=(value : Bool) : Bool
      self.set(pincos: value)
      value
    end

    # Memory data size
    def msize : UInt8
      UInt8.new!((@value >> 13) & 0x3_u32)
    end

    # Memory data size
    def self.msize : UInt8
      value.msize
    end

    # Memory data size
    def self.msize=(value : UInt8) : UInt8
      self.set(msize: value)
      value
    end

    # Peripheral data size
    def psize : UInt8
      UInt8.new!((@value >> 11) & 0x3_u32)
    end

    # Peripheral data size
    def self.psize : UInt8
      value.psize
    end

    # Peripheral data size
    def self.psize=(value : UInt8) : UInt8
      self.set(psize: value)
      value
    end

    # Memory increment mode
    def minc : Bool
      @value.bits_set?(0x400_u32)
    end

    # Memory increment mode
    def self.minc : Bool
      value.minc
    end

    # Memory increment mode
    def self.minc=(value : Bool) : Bool
      self.set(minc: value)
      value
    end

    # Peripheral increment mode
    def pinc : Bool
      @value.bits_set?(0x200_u32)
    end

    # Peripheral increment mode
    def self.pinc : Bool
      value.pinc
    end

    # Peripheral increment mode
    def self.pinc=(value : Bool) : Bool
      self.set(pinc: value)
      value
    end

    # Circular mode
    def circ : Bool
      @value.bits_set?(0x100_u32)
    end

    # Circular mode
    def self.circ : Bool
      value.circ
    end

    # Circular mode
    def self.circ=(value : Bool) : Bool
      self.set(circ: value)
      value
    end

    # Data transfer direction
    def dir : UInt8
      UInt8.new!((@value >> 6) & 0x3_u32)
    end

    # Data transfer direction
    def self.dir : UInt8
      value.dir
    end

    # Data transfer direction
    def self.dir=(value : UInt8) : UInt8
      self.set(dir: value)
      value
    end

    # Peripheral flow controller
    def pfctrl : Bool
      @value.bits_set?(0x20_u32)
    end

    # Peripheral flow controller
    def self.pfctrl : Bool
      value.pfctrl
    end

    # Peripheral flow controller
    def self.pfctrl=(value : Bool) : Bool
      self.set(pfctrl: value)
      value
    end

    # Transfer complete interrupt              enable
    def tcie : Bool
      @value.bits_set?(0x10_u32)
    end

    # Transfer complete interrupt              enable
    def self.tcie : Bool
      value.tcie
    end

    # Transfer complete interrupt              enable
    def self.tcie=(value : Bool) : Bool
      self.set(tcie: value)
      value
    end

    # Half transfer interrupt              enable
    def htie : Bool
      @value.bits_set?(0x8_u32)
    end

    # Half transfer interrupt              enable
    def self.htie : Bool
      value.htie
    end

    # Half transfer interrupt              enable
    def self.htie=(value : Bool) : Bool
      self.set(htie: value)
      value
    end

    # Transfer error interrupt              enable
    def teie : Bool
      @value.bits_set?(0x4_u32)
    end

    # Transfer error interrupt              enable
    def self.teie : Bool
      value.teie
    end

    # Transfer error interrupt              enable
    def self.teie=(value : Bool) : Bool
      self.set(teie: value)
      value
    end

    # Direct mode error interrupt              enable
    def dmeie : Bool
      @value.bits_set?(0x2_u32)
    end

    # Direct mode error interrupt              enable
    def self.dmeie : Bool
      value.dmeie
    end

    # Direct mode error interrupt              enable
    def self.dmeie=(value : Bool) : Bool
      self.set(dmeie: value)
      value
    end

    # Stream enable / flag stream ready when              read low
    def en : Bool
      @value.bits_set?(0x1_u32)
    end

    # Stream enable / flag stream ready when              read low
    def self.en : Bool
      value.en
    end

    # Stream enable / flag stream ready when              read low
    def self.en=(value : Bool) : Bool
      self.set(en: value)
      value
    end

    def copy_with(
      *,

      chsel : UInt8? = nil,

      mburst : UInt8? = nil,

      pburst : UInt8? = nil,

      ack : Bool? = nil,

      ct : Bool? = nil,

      dbm : Bool? = nil,

      pl : UInt8? = nil,

      pincos : Bool? = nil,

      msize : UInt8? = nil,

      psize : UInt8? = nil,

      minc : Bool? = nil,

      pinc : Bool? = nil,

      circ : Bool? = nil,

      dir : UInt8? = nil,

      pfctrl : Bool? = nil,

      tcie : Bool? = nil,

      htie : Bool? = nil,

      teie : Bool? = nil,

      dmeie : Bool? = nil,

      en : Bool? = nil
    ) : self
      value = @value

      unless chsel.nil?
        value = (value & 0xf1ffffff_u32) |
                UInt32.new!(chsel.to_int).&(0x7_u32) << 25
      end

      unless mburst.nil?
        value = (value & 0xfe7fffff_u32) |
                UInt32.new!(mburst.to_int).&(0x3_u32) << 23
      end

      unless pburst.nil?
        value = (value & 0xff9fffff_u32) |
                UInt32.new!(pburst.to_int).&(0x3_u32) << 21
      end

      unless ack.nil?
        value = (value & 0xffefffff_u32) |
                UInt32.new!(ack.to_int).&(0x1_u32) << 20
      end

      unless ct.nil?
        value = (value & 0xfff7ffff_u32) |
                UInt32.new!(ct.to_int).&(0x1_u32) << 19
      end

      unless dbm.nil?
        value = (value & 0xfffbffff_u32) |
                UInt32.new!(dbm.to_int).&(0x1_u32) << 18
      end

      unless pl.nil?
        value = (value & 0xfffcffff_u32) |
                UInt32.new!(pl.to_int).&(0x3_u32) << 16
      end

      unless pincos.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(pincos.to_int).&(0x1_u32) << 15
      end

      unless msize.nil?
        value = (value & 0xffff9fff_u32) |
                UInt32.new!(msize.to_int).&(0x3_u32) << 13
      end

      unless psize.nil?
        value = (value & 0xffffe7ff_u32) |
                UInt32.new!(psize.to_int).&(0x3_u32) << 11
      end

      unless minc.nil?
        value = (value & 0xfffffbff_u32) |
                UInt32.new!(minc.to_int).&(0x1_u32) << 10
      end

      unless pinc.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(pinc.to_int).&(0x1_u32) << 9
      end

      unless circ.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(circ.to_int).&(0x1_u32) << 8
      end

      unless dir.nil?
        value = (value & 0xffffff3f_u32) |
                UInt32.new!(dir.to_int).&(0x3_u32) << 6
      end

      unless pfctrl.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(pfctrl.to_int).&(0x1_u32) << 5
      end

      unless tcie.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(tcie.to_int).&(0x1_u32) << 4
      end

      unless htie.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(htie.to_int).&(0x1_u32) << 3
      end

      unless teie.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(teie.to_int).&(0x1_u32) << 2
      end

      unless dmeie.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(dmeie.to_int).&(0x1_u32) << 1
      end

      unless en.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(en.to_int).&(0x1_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      chsel : UInt8? = nil,
      mburst : UInt8? = nil,
      pburst : UInt8? = nil,
      ack : Bool? = nil,
      ct : Bool? = nil,
      dbm : Bool? = nil,
      pl : UInt8? = nil,
      pincos : Bool? = nil,
      msize : UInt8? = nil,
      psize : UInt8? = nil,
      minc : Bool? = nil,
      pinc : Bool? = nil,
      circ : Bool? = nil,
      dir : UInt8? = nil,
      pfctrl : Bool? = nil,
      tcie : Bool? = nil,
      htie : Bool? = nil,
      teie : Bool? = nil,
      dmeie : Bool? = nil,
      en : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        chsel: chsel,
        mburst: mburst,
        pburst: pburst,
        ack: ack,
        ct: ct,
        dbm: dbm,
        pl: pl,
        pincos: pincos,
        msize: msize,
        psize: psize,
        minc: minc,
        pinc: pinc,
        circ: circ,
        dir: dir,
        pfctrl: pfctrl,
        tcie: tcie,
        htie: htie,
        teie: teie,
        dmeie: dmeie,
        en: en,
      )
    end
  end # struct

  # stream x number of data          register
  struct S1NDTR
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

    # Number of data items to              transfer
    def ndt : UInt16
      UInt16.new!((@value >> 0) & 0xffff_u32)
    end

    # Number of data items to              transfer
    def self.ndt : UInt16
      value.ndt
    end

    # Number of data items to              transfer
    def self.ndt=(value : UInt16) : UInt16
      self.set(ndt: value)
      value
    end

    def copy_with(
      *,

      ndt : UInt16? = nil
    ) : self
      value = @value

      unless ndt.nil?
        value = (value & 0xffff0000_u32) |
                UInt32.new!(ndt.to_int).&(0xffff_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      ndt : UInt16? = nil
    ) : Nil
      self.value = self.value.copy_with(
        ndt: ndt,
      )
    end
  end # struct

  # stream x peripheral address          register
  struct S1PAR
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

    # Peripheral address
    def pa : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # Peripheral address
    def self.pa : UInt32
      value.pa
    end

    # Peripheral address
    def self.pa=(value : UInt32) : UInt32
      self.set(pa: value)
      value
    end

    def copy_with(
      *,

      pa : UInt32? = nil
    ) : self
      value = @value

      unless pa.nil?
        value = (value & 0xffffffff_u32) |
                UInt32.new!(pa.to_int).&(0x0_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      pa : UInt32? = nil
    ) : Nil
      self.value = self.value.copy_with(
        pa: pa,
      )
    end
  end # struct

  # stream x memory 0 address          register
  struct S1M0AR
    ADDRESS = BASE_ADDRESS + 0x34_u64

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

    # Memory 0 address
    def m0_a : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # Memory 0 address
    def self.m0_a : UInt32
      value.m0_a
    end

    # Memory 0 address
    def self.m0_a=(value : UInt32) : UInt32
      self.set(m0_a: value)
      value
    end

    def copy_with(
      *,

      m0_a : UInt32? = nil
    ) : self
      value = @value

      unless m0_a.nil?
        value = (value & 0xffffffff_u32) |
                UInt32.new!(m0_a.to_int).&(0x0_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      m0_a : UInt32? = nil
    ) : Nil
      self.value = self.value.copy_with(
        m0_a: m0_a,
      )
    end
  end # struct

  # stream x memory 1 address          register
  struct S1M1AR
    ADDRESS = BASE_ADDRESS + 0x38_u64

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

    # Memory 1 address (used in case of Double              buffer mode)
    def m1_a : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # Memory 1 address (used in case of Double              buffer mode)
    def self.m1_a : UInt32
      value.m1_a
    end

    # Memory 1 address (used in case of Double              buffer mode)
    def self.m1_a=(value : UInt32) : UInt32
      self.set(m1_a: value)
      value
    end

    def copy_with(
      *,

      m1_a : UInt32? = nil
    ) : self
      value = @value

      unless m1_a.nil?
        value = (value & 0xffffffff_u32) |
                UInt32.new!(m1_a.to_int).&(0x0_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      m1_a : UInt32? = nil
    ) : Nil
      self.value = self.value.copy_with(
        m1_a: m1_a,
      )
    end
  end # struct

  # stream x FIFO control register
  struct S1FCR
    ADDRESS = BASE_ADDRESS + 0x3c_u64

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
      new(0x21_u64)
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

    # FIFO error interrupt              enable
    def feie : Bool
      @value.bits_set?(0x80_u32)
    end

    # FIFO error interrupt              enable
    def self.feie : Bool
      value.feie
    end

    # FIFO error interrupt              enable
    def self.feie=(value : Bool) : Bool
      self.set(feie: value)
      value
    end

    # FIFO status
    def fs : UInt8
      UInt8.new!((@value >> 3) & 0x7_u32)
    end

    # FIFO status
    def self.fs : UInt8
      value.fs
    end

    # Direct mode disable
    def dmdis : Bool
      @value.bits_set?(0x4_u32)
    end

    # Direct mode disable
    def self.dmdis : Bool
      value.dmdis
    end

    # Direct mode disable
    def self.dmdis=(value : Bool) : Bool
      self.set(dmdis: value)
      value
    end

    # FIFO threshold selection
    def fth : UInt8
      UInt8.new!((@value >> 0) & 0x3_u32)
    end

    # FIFO threshold selection
    def self.fth : UInt8
      value.fth
    end

    # FIFO threshold selection
    def self.fth=(value : UInt8) : UInt8
      self.set(fth: value)
      value
    end

    def copy_with(
      *,

      feie : Bool? = nil,

      dmdis : Bool? = nil,

      fth : UInt8? = nil
    ) : self
      value = @value

      unless feie.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(feie.to_int).&(0x1_u32) << 7
      end

      unless dmdis.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(dmdis.to_int).&(0x1_u32) << 2
      end

      unless fth.nil?
        value = (value & 0xfffffffc_u32) |
                UInt32.new!(fth.to_int).&(0x3_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      feie : Bool? = nil,
      dmdis : Bool? = nil,
      fth : UInt8? = nil
    ) : Nil
      self.value = self.value.copy_with(
        feie: feie,
        dmdis: dmdis,
        fth: fth,
      )
    end
  end # struct

  # stream x configuration          register
  struct S2CR
    ADDRESS = BASE_ADDRESS + 0x40_u64

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

    # Channel selection
    def chsel : UInt8
      UInt8.new!((@value >> 25) & 0x7_u32)
    end

    # Channel selection
    def self.chsel : UInt8
      value.chsel
    end

    # Channel selection
    def self.chsel=(value : UInt8) : UInt8
      self.set(chsel: value)
      value
    end

    # Memory burst transfer              configuration
    def mburst : UInt8
      UInt8.new!((@value >> 23) & 0x3_u32)
    end

    # Memory burst transfer              configuration
    def self.mburst : UInt8
      value.mburst
    end

    # Memory burst transfer              configuration
    def self.mburst=(value : UInt8) : UInt8
      self.set(mburst: value)
      value
    end

    # Peripheral burst transfer              configuration
    def pburst : UInt8
      UInt8.new!((@value >> 21) & 0x3_u32)
    end

    # Peripheral burst transfer              configuration
    def self.pburst : UInt8
      value.pburst
    end

    # Peripheral burst transfer              configuration
    def self.pburst=(value : UInt8) : UInt8
      self.set(pburst: value)
      value
    end

    # ACK
    def ack : Bool
      @value.bits_set?(0x100000_u32)
    end

    # ACK
    def self.ack : Bool
      value.ack
    end

    # ACK
    def self.ack=(value : Bool) : Bool
      self.set(ack: value)
      value
    end

    # Current target (only in double buffer              mode)
    def ct : Bool
      @value.bits_set?(0x80000_u32)
    end

    # Current target (only in double buffer              mode)
    def self.ct : Bool
      value.ct
    end

    # Current target (only in double buffer              mode)
    def self.ct=(value : Bool) : Bool
      self.set(ct: value)
      value
    end

    # Double buffer mode
    def dbm : Bool
      @value.bits_set?(0x40000_u32)
    end

    # Double buffer mode
    def self.dbm : Bool
      value.dbm
    end

    # Double buffer mode
    def self.dbm=(value : Bool) : Bool
      self.set(dbm: value)
      value
    end

    # Priority level
    def pl : UInt8
      UInt8.new!((@value >> 16) & 0x3_u32)
    end

    # Priority level
    def self.pl : UInt8
      value.pl
    end

    # Priority level
    def self.pl=(value : UInt8) : UInt8
      self.set(pl: value)
      value
    end

    # Peripheral increment offset              size
    def pincos : Bool
      @value.bits_set?(0x8000_u32)
    end

    # Peripheral increment offset              size
    def self.pincos : Bool
      value.pincos
    end

    # Peripheral increment offset              size
    def self.pincos=(value : Bool) : Bool
      self.set(pincos: value)
      value
    end

    # Memory data size
    def msize : UInt8
      UInt8.new!((@value >> 13) & 0x3_u32)
    end

    # Memory data size
    def self.msize : UInt8
      value.msize
    end

    # Memory data size
    def self.msize=(value : UInt8) : UInt8
      self.set(msize: value)
      value
    end

    # Peripheral data size
    def psize : UInt8
      UInt8.new!((@value >> 11) & 0x3_u32)
    end

    # Peripheral data size
    def self.psize : UInt8
      value.psize
    end

    # Peripheral data size
    def self.psize=(value : UInt8) : UInt8
      self.set(psize: value)
      value
    end

    # Memory increment mode
    def minc : Bool
      @value.bits_set?(0x400_u32)
    end

    # Memory increment mode
    def self.minc : Bool
      value.minc
    end

    # Memory increment mode
    def self.minc=(value : Bool) : Bool
      self.set(minc: value)
      value
    end

    # Peripheral increment mode
    def pinc : Bool
      @value.bits_set?(0x200_u32)
    end

    # Peripheral increment mode
    def self.pinc : Bool
      value.pinc
    end

    # Peripheral increment mode
    def self.pinc=(value : Bool) : Bool
      self.set(pinc: value)
      value
    end

    # Circular mode
    def circ : Bool
      @value.bits_set?(0x100_u32)
    end

    # Circular mode
    def self.circ : Bool
      value.circ
    end

    # Circular mode
    def self.circ=(value : Bool) : Bool
      self.set(circ: value)
      value
    end

    # Data transfer direction
    def dir : UInt8
      UInt8.new!((@value >> 6) & 0x3_u32)
    end

    # Data transfer direction
    def self.dir : UInt8
      value.dir
    end

    # Data transfer direction
    def self.dir=(value : UInt8) : UInt8
      self.set(dir: value)
      value
    end

    # Peripheral flow controller
    def pfctrl : Bool
      @value.bits_set?(0x20_u32)
    end

    # Peripheral flow controller
    def self.pfctrl : Bool
      value.pfctrl
    end

    # Peripheral flow controller
    def self.pfctrl=(value : Bool) : Bool
      self.set(pfctrl: value)
      value
    end

    # Transfer complete interrupt              enable
    def tcie : Bool
      @value.bits_set?(0x10_u32)
    end

    # Transfer complete interrupt              enable
    def self.tcie : Bool
      value.tcie
    end

    # Transfer complete interrupt              enable
    def self.tcie=(value : Bool) : Bool
      self.set(tcie: value)
      value
    end

    # Half transfer interrupt              enable
    def htie : Bool
      @value.bits_set?(0x8_u32)
    end

    # Half transfer interrupt              enable
    def self.htie : Bool
      value.htie
    end

    # Half transfer interrupt              enable
    def self.htie=(value : Bool) : Bool
      self.set(htie: value)
      value
    end

    # Transfer error interrupt              enable
    def teie : Bool
      @value.bits_set?(0x4_u32)
    end

    # Transfer error interrupt              enable
    def self.teie : Bool
      value.teie
    end

    # Transfer error interrupt              enable
    def self.teie=(value : Bool) : Bool
      self.set(teie: value)
      value
    end

    # Direct mode error interrupt              enable
    def dmeie : Bool
      @value.bits_set?(0x2_u32)
    end

    # Direct mode error interrupt              enable
    def self.dmeie : Bool
      value.dmeie
    end

    # Direct mode error interrupt              enable
    def self.dmeie=(value : Bool) : Bool
      self.set(dmeie: value)
      value
    end

    # Stream enable / flag stream ready when              read low
    def en : Bool
      @value.bits_set?(0x1_u32)
    end

    # Stream enable / flag stream ready when              read low
    def self.en : Bool
      value.en
    end

    # Stream enable / flag stream ready when              read low
    def self.en=(value : Bool) : Bool
      self.set(en: value)
      value
    end

    def copy_with(
      *,

      chsel : UInt8? = nil,

      mburst : UInt8? = nil,

      pburst : UInt8? = nil,

      ack : Bool? = nil,

      ct : Bool? = nil,

      dbm : Bool? = nil,

      pl : UInt8? = nil,

      pincos : Bool? = nil,

      msize : UInt8? = nil,

      psize : UInt8? = nil,

      minc : Bool? = nil,

      pinc : Bool? = nil,

      circ : Bool? = nil,

      dir : UInt8? = nil,

      pfctrl : Bool? = nil,

      tcie : Bool? = nil,

      htie : Bool? = nil,

      teie : Bool? = nil,

      dmeie : Bool? = nil,

      en : Bool? = nil
    ) : self
      value = @value

      unless chsel.nil?
        value = (value & 0xf1ffffff_u32) |
                UInt32.new!(chsel.to_int).&(0x7_u32) << 25
      end

      unless mburst.nil?
        value = (value & 0xfe7fffff_u32) |
                UInt32.new!(mburst.to_int).&(0x3_u32) << 23
      end

      unless pburst.nil?
        value = (value & 0xff9fffff_u32) |
                UInt32.new!(pburst.to_int).&(0x3_u32) << 21
      end

      unless ack.nil?
        value = (value & 0xffefffff_u32) |
                UInt32.new!(ack.to_int).&(0x1_u32) << 20
      end

      unless ct.nil?
        value = (value & 0xfff7ffff_u32) |
                UInt32.new!(ct.to_int).&(0x1_u32) << 19
      end

      unless dbm.nil?
        value = (value & 0xfffbffff_u32) |
                UInt32.new!(dbm.to_int).&(0x1_u32) << 18
      end

      unless pl.nil?
        value = (value & 0xfffcffff_u32) |
                UInt32.new!(pl.to_int).&(0x3_u32) << 16
      end

      unless pincos.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(pincos.to_int).&(0x1_u32) << 15
      end

      unless msize.nil?
        value = (value & 0xffff9fff_u32) |
                UInt32.new!(msize.to_int).&(0x3_u32) << 13
      end

      unless psize.nil?
        value = (value & 0xffffe7ff_u32) |
                UInt32.new!(psize.to_int).&(0x3_u32) << 11
      end

      unless minc.nil?
        value = (value & 0xfffffbff_u32) |
                UInt32.new!(minc.to_int).&(0x1_u32) << 10
      end

      unless pinc.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(pinc.to_int).&(0x1_u32) << 9
      end

      unless circ.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(circ.to_int).&(0x1_u32) << 8
      end

      unless dir.nil?
        value = (value & 0xffffff3f_u32) |
                UInt32.new!(dir.to_int).&(0x3_u32) << 6
      end

      unless pfctrl.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(pfctrl.to_int).&(0x1_u32) << 5
      end

      unless tcie.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(tcie.to_int).&(0x1_u32) << 4
      end

      unless htie.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(htie.to_int).&(0x1_u32) << 3
      end

      unless teie.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(teie.to_int).&(0x1_u32) << 2
      end

      unless dmeie.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(dmeie.to_int).&(0x1_u32) << 1
      end

      unless en.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(en.to_int).&(0x1_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      chsel : UInt8? = nil,
      mburst : UInt8? = nil,
      pburst : UInt8? = nil,
      ack : Bool? = nil,
      ct : Bool? = nil,
      dbm : Bool? = nil,
      pl : UInt8? = nil,
      pincos : Bool? = nil,
      msize : UInt8? = nil,
      psize : UInt8? = nil,
      minc : Bool? = nil,
      pinc : Bool? = nil,
      circ : Bool? = nil,
      dir : UInt8? = nil,
      pfctrl : Bool? = nil,
      tcie : Bool? = nil,
      htie : Bool? = nil,
      teie : Bool? = nil,
      dmeie : Bool? = nil,
      en : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        chsel: chsel,
        mburst: mburst,
        pburst: pburst,
        ack: ack,
        ct: ct,
        dbm: dbm,
        pl: pl,
        pincos: pincos,
        msize: msize,
        psize: psize,
        minc: minc,
        pinc: pinc,
        circ: circ,
        dir: dir,
        pfctrl: pfctrl,
        tcie: tcie,
        htie: htie,
        teie: teie,
        dmeie: dmeie,
        en: en,
      )
    end
  end # struct

  # stream x number of data          register
  struct S2NDTR
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

    # Number of data items to              transfer
    def ndt : UInt16
      UInt16.new!((@value >> 0) & 0xffff_u32)
    end

    # Number of data items to              transfer
    def self.ndt : UInt16
      value.ndt
    end

    # Number of data items to              transfer
    def self.ndt=(value : UInt16) : UInt16
      self.set(ndt: value)
      value
    end

    def copy_with(
      *,

      ndt : UInt16? = nil
    ) : self
      value = @value

      unless ndt.nil?
        value = (value & 0xffff0000_u32) |
                UInt32.new!(ndt.to_int).&(0xffff_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      ndt : UInt16? = nil
    ) : Nil
      self.value = self.value.copy_with(
        ndt: ndt,
      )
    end
  end # struct

  # stream x peripheral address          register
  struct S2PAR
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

    # Peripheral address
    def pa : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # Peripheral address
    def self.pa : UInt32
      value.pa
    end

    # Peripheral address
    def self.pa=(value : UInt32) : UInt32
      self.set(pa: value)
      value
    end

    def copy_with(
      *,

      pa : UInt32? = nil
    ) : self
      value = @value

      unless pa.nil?
        value = (value & 0xffffffff_u32) |
                UInt32.new!(pa.to_int).&(0x0_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      pa : UInt32? = nil
    ) : Nil
      self.value = self.value.copy_with(
        pa: pa,
      )
    end
  end # struct

  # stream x memory 0 address          register
  struct S2M0AR
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

    # Memory 0 address
    def m0_a : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # Memory 0 address
    def self.m0_a : UInt32
      value.m0_a
    end

    # Memory 0 address
    def self.m0_a=(value : UInt32) : UInt32
      self.set(m0_a: value)
      value
    end

    def copy_with(
      *,

      m0_a : UInt32? = nil
    ) : self
      value = @value

      unless m0_a.nil?
        value = (value & 0xffffffff_u32) |
                UInt32.new!(m0_a.to_int).&(0x0_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      m0_a : UInt32? = nil
    ) : Nil
      self.value = self.value.copy_with(
        m0_a: m0_a,
      )
    end
  end # struct

  # stream x memory 1 address          register
  struct S2M1AR
    ADDRESS = BASE_ADDRESS + 0x50_u64

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

    # Memory 1 address (used in case of Double              buffer mode)
    def m1_a : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # Memory 1 address (used in case of Double              buffer mode)
    def self.m1_a : UInt32
      value.m1_a
    end

    # Memory 1 address (used in case of Double              buffer mode)
    def self.m1_a=(value : UInt32) : UInt32
      self.set(m1_a: value)
      value
    end

    def copy_with(
      *,

      m1_a : UInt32? = nil
    ) : self
      value = @value

      unless m1_a.nil?
        value = (value & 0xffffffff_u32) |
                UInt32.new!(m1_a.to_int).&(0x0_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      m1_a : UInt32? = nil
    ) : Nil
      self.value = self.value.copy_with(
        m1_a: m1_a,
      )
    end
  end # struct

  # stream x FIFO control register
  struct S2FCR
    ADDRESS = BASE_ADDRESS + 0x54_u64

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
      new(0x21_u64)
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

    # FIFO error interrupt              enable
    def feie : Bool
      @value.bits_set?(0x80_u32)
    end

    # FIFO error interrupt              enable
    def self.feie : Bool
      value.feie
    end

    # FIFO error interrupt              enable
    def self.feie=(value : Bool) : Bool
      self.set(feie: value)
      value
    end

    # FIFO status
    def fs : UInt8
      UInt8.new!((@value >> 3) & 0x7_u32)
    end

    # FIFO status
    def self.fs : UInt8
      value.fs
    end

    # Direct mode disable
    def dmdis : Bool
      @value.bits_set?(0x4_u32)
    end

    # Direct mode disable
    def self.dmdis : Bool
      value.dmdis
    end

    # Direct mode disable
    def self.dmdis=(value : Bool) : Bool
      self.set(dmdis: value)
      value
    end

    # FIFO threshold selection
    def fth : UInt8
      UInt8.new!((@value >> 0) & 0x3_u32)
    end

    # FIFO threshold selection
    def self.fth : UInt8
      value.fth
    end

    # FIFO threshold selection
    def self.fth=(value : UInt8) : UInt8
      self.set(fth: value)
      value
    end

    def copy_with(
      *,

      feie : Bool? = nil,

      dmdis : Bool? = nil,

      fth : UInt8? = nil
    ) : self
      value = @value

      unless feie.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(feie.to_int).&(0x1_u32) << 7
      end

      unless dmdis.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(dmdis.to_int).&(0x1_u32) << 2
      end

      unless fth.nil?
        value = (value & 0xfffffffc_u32) |
                UInt32.new!(fth.to_int).&(0x3_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      feie : Bool? = nil,
      dmdis : Bool? = nil,
      fth : UInt8? = nil
    ) : Nil
      self.value = self.value.copy_with(
        feie: feie,
        dmdis: dmdis,
        fth: fth,
      )
    end
  end # struct

  # stream x configuration          register
  struct S3CR
    ADDRESS = BASE_ADDRESS + 0x58_u64

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

    # Channel selection
    def chsel : UInt8
      UInt8.new!((@value >> 25) & 0x7_u32)
    end

    # Channel selection
    def self.chsel : UInt8
      value.chsel
    end

    # Channel selection
    def self.chsel=(value : UInt8) : UInt8
      self.set(chsel: value)
      value
    end

    # Memory burst transfer              configuration
    def mburst : UInt8
      UInt8.new!((@value >> 23) & 0x3_u32)
    end

    # Memory burst transfer              configuration
    def self.mburst : UInt8
      value.mburst
    end

    # Memory burst transfer              configuration
    def self.mburst=(value : UInt8) : UInt8
      self.set(mburst: value)
      value
    end

    # Peripheral burst transfer              configuration
    def pburst : UInt8
      UInt8.new!((@value >> 21) & 0x3_u32)
    end

    # Peripheral burst transfer              configuration
    def self.pburst : UInt8
      value.pburst
    end

    # Peripheral burst transfer              configuration
    def self.pburst=(value : UInt8) : UInt8
      self.set(pburst: value)
      value
    end

    # ACK
    def ack : Bool
      @value.bits_set?(0x100000_u32)
    end

    # ACK
    def self.ack : Bool
      value.ack
    end

    # ACK
    def self.ack=(value : Bool) : Bool
      self.set(ack: value)
      value
    end

    # Current target (only in double buffer              mode)
    def ct : Bool
      @value.bits_set?(0x80000_u32)
    end

    # Current target (only in double buffer              mode)
    def self.ct : Bool
      value.ct
    end

    # Current target (only in double buffer              mode)
    def self.ct=(value : Bool) : Bool
      self.set(ct: value)
      value
    end

    # Double buffer mode
    def dbm : Bool
      @value.bits_set?(0x40000_u32)
    end

    # Double buffer mode
    def self.dbm : Bool
      value.dbm
    end

    # Double buffer mode
    def self.dbm=(value : Bool) : Bool
      self.set(dbm: value)
      value
    end

    # Priority level
    def pl : UInt8
      UInt8.new!((@value >> 16) & 0x3_u32)
    end

    # Priority level
    def self.pl : UInt8
      value.pl
    end

    # Priority level
    def self.pl=(value : UInt8) : UInt8
      self.set(pl: value)
      value
    end

    # Peripheral increment offset              size
    def pincos : Bool
      @value.bits_set?(0x8000_u32)
    end

    # Peripheral increment offset              size
    def self.pincos : Bool
      value.pincos
    end

    # Peripheral increment offset              size
    def self.pincos=(value : Bool) : Bool
      self.set(pincos: value)
      value
    end

    # Memory data size
    def msize : UInt8
      UInt8.new!((@value >> 13) & 0x3_u32)
    end

    # Memory data size
    def self.msize : UInt8
      value.msize
    end

    # Memory data size
    def self.msize=(value : UInt8) : UInt8
      self.set(msize: value)
      value
    end

    # Peripheral data size
    def psize : UInt8
      UInt8.new!((@value >> 11) & 0x3_u32)
    end

    # Peripheral data size
    def self.psize : UInt8
      value.psize
    end

    # Peripheral data size
    def self.psize=(value : UInt8) : UInt8
      self.set(psize: value)
      value
    end

    # Memory increment mode
    def minc : Bool
      @value.bits_set?(0x400_u32)
    end

    # Memory increment mode
    def self.minc : Bool
      value.minc
    end

    # Memory increment mode
    def self.minc=(value : Bool) : Bool
      self.set(minc: value)
      value
    end

    # Peripheral increment mode
    def pinc : Bool
      @value.bits_set?(0x200_u32)
    end

    # Peripheral increment mode
    def self.pinc : Bool
      value.pinc
    end

    # Peripheral increment mode
    def self.pinc=(value : Bool) : Bool
      self.set(pinc: value)
      value
    end

    # Circular mode
    def circ : Bool
      @value.bits_set?(0x100_u32)
    end

    # Circular mode
    def self.circ : Bool
      value.circ
    end

    # Circular mode
    def self.circ=(value : Bool) : Bool
      self.set(circ: value)
      value
    end

    # Data transfer direction
    def dir : UInt8
      UInt8.new!((@value >> 6) & 0x3_u32)
    end

    # Data transfer direction
    def self.dir : UInt8
      value.dir
    end

    # Data transfer direction
    def self.dir=(value : UInt8) : UInt8
      self.set(dir: value)
      value
    end

    # Peripheral flow controller
    def pfctrl : Bool
      @value.bits_set?(0x20_u32)
    end

    # Peripheral flow controller
    def self.pfctrl : Bool
      value.pfctrl
    end

    # Peripheral flow controller
    def self.pfctrl=(value : Bool) : Bool
      self.set(pfctrl: value)
      value
    end

    # Transfer complete interrupt              enable
    def tcie : Bool
      @value.bits_set?(0x10_u32)
    end

    # Transfer complete interrupt              enable
    def self.tcie : Bool
      value.tcie
    end

    # Transfer complete interrupt              enable
    def self.tcie=(value : Bool) : Bool
      self.set(tcie: value)
      value
    end

    # Half transfer interrupt              enable
    def htie : Bool
      @value.bits_set?(0x8_u32)
    end

    # Half transfer interrupt              enable
    def self.htie : Bool
      value.htie
    end

    # Half transfer interrupt              enable
    def self.htie=(value : Bool) : Bool
      self.set(htie: value)
      value
    end

    # Transfer error interrupt              enable
    def teie : Bool
      @value.bits_set?(0x4_u32)
    end

    # Transfer error interrupt              enable
    def self.teie : Bool
      value.teie
    end

    # Transfer error interrupt              enable
    def self.teie=(value : Bool) : Bool
      self.set(teie: value)
      value
    end

    # Direct mode error interrupt              enable
    def dmeie : Bool
      @value.bits_set?(0x2_u32)
    end

    # Direct mode error interrupt              enable
    def self.dmeie : Bool
      value.dmeie
    end

    # Direct mode error interrupt              enable
    def self.dmeie=(value : Bool) : Bool
      self.set(dmeie: value)
      value
    end

    # Stream enable / flag stream ready when              read low
    def en : Bool
      @value.bits_set?(0x1_u32)
    end

    # Stream enable / flag stream ready when              read low
    def self.en : Bool
      value.en
    end

    # Stream enable / flag stream ready when              read low
    def self.en=(value : Bool) : Bool
      self.set(en: value)
      value
    end

    def copy_with(
      *,

      chsel : UInt8? = nil,

      mburst : UInt8? = nil,

      pburst : UInt8? = nil,

      ack : Bool? = nil,

      ct : Bool? = nil,

      dbm : Bool? = nil,

      pl : UInt8? = nil,

      pincos : Bool? = nil,

      msize : UInt8? = nil,

      psize : UInt8? = nil,

      minc : Bool? = nil,

      pinc : Bool? = nil,

      circ : Bool? = nil,

      dir : UInt8? = nil,

      pfctrl : Bool? = nil,

      tcie : Bool? = nil,

      htie : Bool? = nil,

      teie : Bool? = nil,

      dmeie : Bool? = nil,

      en : Bool? = nil
    ) : self
      value = @value

      unless chsel.nil?
        value = (value & 0xf1ffffff_u32) |
                UInt32.new!(chsel.to_int).&(0x7_u32) << 25
      end

      unless mburst.nil?
        value = (value & 0xfe7fffff_u32) |
                UInt32.new!(mburst.to_int).&(0x3_u32) << 23
      end

      unless pburst.nil?
        value = (value & 0xff9fffff_u32) |
                UInt32.new!(pburst.to_int).&(0x3_u32) << 21
      end

      unless ack.nil?
        value = (value & 0xffefffff_u32) |
                UInt32.new!(ack.to_int).&(0x1_u32) << 20
      end

      unless ct.nil?
        value = (value & 0xfff7ffff_u32) |
                UInt32.new!(ct.to_int).&(0x1_u32) << 19
      end

      unless dbm.nil?
        value = (value & 0xfffbffff_u32) |
                UInt32.new!(dbm.to_int).&(0x1_u32) << 18
      end

      unless pl.nil?
        value = (value & 0xfffcffff_u32) |
                UInt32.new!(pl.to_int).&(0x3_u32) << 16
      end

      unless pincos.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(pincos.to_int).&(0x1_u32) << 15
      end

      unless msize.nil?
        value = (value & 0xffff9fff_u32) |
                UInt32.new!(msize.to_int).&(0x3_u32) << 13
      end

      unless psize.nil?
        value = (value & 0xffffe7ff_u32) |
                UInt32.new!(psize.to_int).&(0x3_u32) << 11
      end

      unless minc.nil?
        value = (value & 0xfffffbff_u32) |
                UInt32.new!(minc.to_int).&(0x1_u32) << 10
      end

      unless pinc.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(pinc.to_int).&(0x1_u32) << 9
      end

      unless circ.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(circ.to_int).&(0x1_u32) << 8
      end

      unless dir.nil?
        value = (value & 0xffffff3f_u32) |
                UInt32.new!(dir.to_int).&(0x3_u32) << 6
      end

      unless pfctrl.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(pfctrl.to_int).&(0x1_u32) << 5
      end

      unless tcie.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(tcie.to_int).&(0x1_u32) << 4
      end

      unless htie.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(htie.to_int).&(0x1_u32) << 3
      end

      unless teie.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(teie.to_int).&(0x1_u32) << 2
      end

      unless dmeie.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(dmeie.to_int).&(0x1_u32) << 1
      end

      unless en.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(en.to_int).&(0x1_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      chsel : UInt8? = nil,
      mburst : UInt8? = nil,
      pburst : UInt8? = nil,
      ack : Bool? = nil,
      ct : Bool? = nil,
      dbm : Bool? = nil,
      pl : UInt8? = nil,
      pincos : Bool? = nil,
      msize : UInt8? = nil,
      psize : UInt8? = nil,
      minc : Bool? = nil,
      pinc : Bool? = nil,
      circ : Bool? = nil,
      dir : UInt8? = nil,
      pfctrl : Bool? = nil,
      tcie : Bool? = nil,
      htie : Bool? = nil,
      teie : Bool? = nil,
      dmeie : Bool? = nil,
      en : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        chsel: chsel,
        mburst: mburst,
        pburst: pburst,
        ack: ack,
        ct: ct,
        dbm: dbm,
        pl: pl,
        pincos: pincos,
        msize: msize,
        psize: psize,
        minc: minc,
        pinc: pinc,
        circ: circ,
        dir: dir,
        pfctrl: pfctrl,
        tcie: tcie,
        htie: htie,
        teie: teie,
        dmeie: dmeie,
        en: en,
      )
    end
  end # struct

  # stream x number of data          register
  struct S3NDTR
    ADDRESS = BASE_ADDRESS + 0x5c_u64

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

    # Number of data items to              transfer
    def ndt : UInt16
      UInt16.new!((@value >> 0) & 0xffff_u32)
    end

    # Number of data items to              transfer
    def self.ndt : UInt16
      value.ndt
    end

    # Number of data items to              transfer
    def self.ndt=(value : UInt16) : UInt16
      self.set(ndt: value)
      value
    end

    def copy_with(
      *,

      ndt : UInt16? = nil
    ) : self
      value = @value

      unless ndt.nil?
        value = (value & 0xffff0000_u32) |
                UInt32.new!(ndt.to_int).&(0xffff_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      ndt : UInt16? = nil
    ) : Nil
      self.value = self.value.copy_with(
        ndt: ndt,
      )
    end
  end # struct

  # stream x peripheral address          register
  struct S3PAR
    ADDRESS = BASE_ADDRESS + 0x60_u64

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

    # Peripheral address
    def pa : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # Peripheral address
    def self.pa : UInt32
      value.pa
    end

    # Peripheral address
    def self.pa=(value : UInt32) : UInt32
      self.set(pa: value)
      value
    end

    def copy_with(
      *,

      pa : UInt32? = nil
    ) : self
      value = @value

      unless pa.nil?
        value = (value & 0xffffffff_u32) |
                UInt32.new!(pa.to_int).&(0x0_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      pa : UInt32? = nil
    ) : Nil
      self.value = self.value.copy_with(
        pa: pa,
      )
    end
  end # struct

  # stream x memory 0 address          register
  struct S3M0AR
    ADDRESS = BASE_ADDRESS + 0x64_u64

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

    # Memory 0 address
    def m0_a : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # Memory 0 address
    def self.m0_a : UInt32
      value.m0_a
    end

    # Memory 0 address
    def self.m0_a=(value : UInt32) : UInt32
      self.set(m0_a: value)
      value
    end

    def copy_with(
      *,

      m0_a : UInt32? = nil
    ) : self
      value = @value

      unless m0_a.nil?
        value = (value & 0xffffffff_u32) |
                UInt32.new!(m0_a.to_int).&(0x0_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      m0_a : UInt32? = nil
    ) : Nil
      self.value = self.value.copy_with(
        m0_a: m0_a,
      )
    end
  end # struct

  # stream x memory 1 address          register
  struct S3M1AR
    ADDRESS = BASE_ADDRESS + 0x68_u64

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

    # Memory 1 address (used in case of Double              buffer mode)
    def m1_a : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # Memory 1 address (used in case of Double              buffer mode)
    def self.m1_a : UInt32
      value.m1_a
    end

    # Memory 1 address (used in case of Double              buffer mode)
    def self.m1_a=(value : UInt32) : UInt32
      self.set(m1_a: value)
      value
    end

    def copy_with(
      *,

      m1_a : UInt32? = nil
    ) : self
      value = @value

      unless m1_a.nil?
        value = (value & 0xffffffff_u32) |
                UInt32.new!(m1_a.to_int).&(0x0_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      m1_a : UInt32? = nil
    ) : Nil
      self.value = self.value.copy_with(
        m1_a: m1_a,
      )
    end
  end # struct

  # stream x FIFO control register
  struct S3FCR
    ADDRESS = BASE_ADDRESS + 0x6c_u64

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
      new(0x21_u64)
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

    # FIFO error interrupt              enable
    def feie : Bool
      @value.bits_set?(0x80_u32)
    end

    # FIFO error interrupt              enable
    def self.feie : Bool
      value.feie
    end

    # FIFO error interrupt              enable
    def self.feie=(value : Bool) : Bool
      self.set(feie: value)
      value
    end

    # FIFO status
    def fs : UInt8
      UInt8.new!((@value >> 3) & 0x7_u32)
    end

    # FIFO status
    def self.fs : UInt8
      value.fs
    end

    # Direct mode disable
    def dmdis : Bool
      @value.bits_set?(0x4_u32)
    end

    # Direct mode disable
    def self.dmdis : Bool
      value.dmdis
    end

    # Direct mode disable
    def self.dmdis=(value : Bool) : Bool
      self.set(dmdis: value)
      value
    end

    # FIFO threshold selection
    def fth : UInt8
      UInt8.new!((@value >> 0) & 0x3_u32)
    end

    # FIFO threshold selection
    def self.fth : UInt8
      value.fth
    end

    # FIFO threshold selection
    def self.fth=(value : UInt8) : UInt8
      self.set(fth: value)
      value
    end

    def copy_with(
      *,

      feie : Bool? = nil,

      dmdis : Bool? = nil,

      fth : UInt8? = nil
    ) : self
      value = @value

      unless feie.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(feie.to_int).&(0x1_u32) << 7
      end

      unless dmdis.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(dmdis.to_int).&(0x1_u32) << 2
      end

      unless fth.nil?
        value = (value & 0xfffffffc_u32) |
                UInt32.new!(fth.to_int).&(0x3_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      feie : Bool? = nil,
      dmdis : Bool? = nil,
      fth : UInt8? = nil
    ) : Nil
      self.value = self.value.copy_with(
        feie: feie,
        dmdis: dmdis,
        fth: fth,
      )
    end
  end # struct

  # stream x configuration          register
  struct S4CR
    ADDRESS = BASE_ADDRESS + 0x70_u64

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

    # Channel selection
    def chsel : UInt8
      UInt8.new!((@value >> 25) & 0x7_u32)
    end

    # Channel selection
    def self.chsel : UInt8
      value.chsel
    end

    # Channel selection
    def self.chsel=(value : UInt8) : UInt8
      self.set(chsel: value)
      value
    end

    # Memory burst transfer              configuration
    def mburst : UInt8
      UInt8.new!((@value >> 23) & 0x3_u32)
    end

    # Memory burst transfer              configuration
    def self.mburst : UInt8
      value.mburst
    end

    # Memory burst transfer              configuration
    def self.mburst=(value : UInt8) : UInt8
      self.set(mburst: value)
      value
    end

    # Peripheral burst transfer              configuration
    def pburst : UInt8
      UInt8.new!((@value >> 21) & 0x3_u32)
    end

    # Peripheral burst transfer              configuration
    def self.pburst : UInt8
      value.pburst
    end

    # Peripheral burst transfer              configuration
    def self.pburst=(value : UInt8) : UInt8
      self.set(pburst: value)
      value
    end

    # ACK
    def ack : Bool
      @value.bits_set?(0x100000_u32)
    end

    # ACK
    def self.ack : Bool
      value.ack
    end

    # ACK
    def self.ack=(value : Bool) : Bool
      self.set(ack: value)
      value
    end

    # Current target (only in double buffer              mode)
    def ct : Bool
      @value.bits_set?(0x80000_u32)
    end

    # Current target (only in double buffer              mode)
    def self.ct : Bool
      value.ct
    end

    # Current target (only in double buffer              mode)
    def self.ct=(value : Bool) : Bool
      self.set(ct: value)
      value
    end

    # Double buffer mode
    def dbm : Bool
      @value.bits_set?(0x40000_u32)
    end

    # Double buffer mode
    def self.dbm : Bool
      value.dbm
    end

    # Double buffer mode
    def self.dbm=(value : Bool) : Bool
      self.set(dbm: value)
      value
    end

    # Priority level
    def pl : UInt8
      UInt8.new!((@value >> 16) & 0x3_u32)
    end

    # Priority level
    def self.pl : UInt8
      value.pl
    end

    # Priority level
    def self.pl=(value : UInt8) : UInt8
      self.set(pl: value)
      value
    end

    # Peripheral increment offset              size
    def pincos : Bool
      @value.bits_set?(0x8000_u32)
    end

    # Peripheral increment offset              size
    def self.pincos : Bool
      value.pincos
    end

    # Peripheral increment offset              size
    def self.pincos=(value : Bool) : Bool
      self.set(pincos: value)
      value
    end

    # Memory data size
    def msize : UInt8
      UInt8.new!((@value >> 13) & 0x3_u32)
    end

    # Memory data size
    def self.msize : UInt8
      value.msize
    end

    # Memory data size
    def self.msize=(value : UInt8) : UInt8
      self.set(msize: value)
      value
    end

    # Peripheral data size
    def psize : UInt8
      UInt8.new!((@value >> 11) & 0x3_u32)
    end

    # Peripheral data size
    def self.psize : UInt8
      value.psize
    end

    # Peripheral data size
    def self.psize=(value : UInt8) : UInt8
      self.set(psize: value)
      value
    end

    # Memory increment mode
    def minc : Bool
      @value.bits_set?(0x400_u32)
    end

    # Memory increment mode
    def self.minc : Bool
      value.minc
    end

    # Memory increment mode
    def self.minc=(value : Bool) : Bool
      self.set(minc: value)
      value
    end

    # Peripheral increment mode
    def pinc : Bool
      @value.bits_set?(0x200_u32)
    end

    # Peripheral increment mode
    def self.pinc : Bool
      value.pinc
    end

    # Peripheral increment mode
    def self.pinc=(value : Bool) : Bool
      self.set(pinc: value)
      value
    end

    # Circular mode
    def circ : Bool
      @value.bits_set?(0x100_u32)
    end

    # Circular mode
    def self.circ : Bool
      value.circ
    end

    # Circular mode
    def self.circ=(value : Bool) : Bool
      self.set(circ: value)
      value
    end

    # Data transfer direction
    def dir : UInt8
      UInt8.new!((@value >> 6) & 0x3_u32)
    end

    # Data transfer direction
    def self.dir : UInt8
      value.dir
    end

    # Data transfer direction
    def self.dir=(value : UInt8) : UInt8
      self.set(dir: value)
      value
    end

    # Peripheral flow controller
    def pfctrl : Bool
      @value.bits_set?(0x20_u32)
    end

    # Peripheral flow controller
    def self.pfctrl : Bool
      value.pfctrl
    end

    # Peripheral flow controller
    def self.pfctrl=(value : Bool) : Bool
      self.set(pfctrl: value)
      value
    end

    # Transfer complete interrupt              enable
    def tcie : Bool
      @value.bits_set?(0x10_u32)
    end

    # Transfer complete interrupt              enable
    def self.tcie : Bool
      value.tcie
    end

    # Transfer complete interrupt              enable
    def self.tcie=(value : Bool) : Bool
      self.set(tcie: value)
      value
    end

    # Half transfer interrupt              enable
    def htie : Bool
      @value.bits_set?(0x8_u32)
    end

    # Half transfer interrupt              enable
    def self.htie : Bool
      value.htie
    end

    # Half transfer interrupt              enable
    def self.htie=(value : Bool) : Bool
      self.set(htie: value)
      value
    end

    # Transfer error interrupt              enable
    def teie : Bool
      @value.bits_set?(0x4_u32)
    end

    # Transfer error interrupt              enable
    def self.teie : Bool
      value.teie
    end

    # Transfer error interrupt              enable
    def self.teie=(value : Bool) : Bool
      self.set(teie: value)
      value
    end

    # Direct mode error interrupt              enable
    def dmeie : Bool
      @value.bits_set?(0x2_u32)
    end

    # Direct mode error interrupt              enable
    def self.dmeie : Bool
      value.dmeie
    end

    # Direct mode error interrupt              enable
    def self.dmeie=(value : Bool) : Bool
      self.set(dmeie: value)
      value
    end

    # Stream enable / flag stream ready when              read low
    def en : Bool
      @value.bits_set?(0x1_u32)
    end

    # Stream enable / flag stream ready when              read low
    def self.en : Bool
      value.en
    end

    # Stream enable / flag stream ready when              read low
    def self.en=(value : Bool) : Bool
      self.set(en: value)
      value
    end

    def copy_with(
      *,

      chsel : UInt8? = nil,

      mburst : UInt8? = nil,

      pburst : UInt8? = nil,

      ack : Bool? = nil,

      ct : Bool? = nil,

      dbm : Bool? = nil,

      pl : UInt8? = nil,

      pincos : Bool? = nil,

      msize : UInt8? = nil,

      psize : UInt8? = nil,

      minc : Bool? = nil,

      pinc : Bool? = nil,

      circ : Bool? = nil,

      dir : UInt8? = nil,

      pfctrl : Bool? = nil,

      tcie : Bool? = nil,

      htie : Bool? = nil,

      teie : Bool? = nil,

      dmeie : Bool? = nil,

      en : Bool? = nil
    ) : self
      value = @value

      unless chsel.nil?
        value = (value & 0xf1ffffff_u32) |
                UInt32.new!(chsel.to_int).&(0x7_u32) << 25
      end

      unless mburst.nil?
        value = (value & 0xfe7fffff_u32) |
                UInt32.new!(mburst.to_int).&(0x3_u32) << 23
      end

      unless pburst.nil?
        value = (value & 0xff9fffff_u32) |
                UInt32.new!(pburst.to_int).&(0x3_u32) << 21
      end

      unless ack.nil?
        value = (value & 0xffefffff_u32) |
                UInt32.new!(ack.to_int).&(0x1_u32) << 20
      end

      unless ct.nil?
        value = (value & 0xfff7ffff_u32) |
                UInt32.new!(ct.to_int).&(0x1_u32) << 19
      end

      unless dbm.nil?
        value = (value & 0xfffbffff_u32) |
                UInt32.new!(dbm.to_int).&(0x1_u32) << 18
      end

      unless pl.nil?
        value = (value & 0xfffcffff_u32) |
                UInt32.new!(pl.to_int).&(0x3_u32) << 16
      end

      unless pincos.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(pincos.to_int).&(0x1_u32) << 15
      end

      unless msize.nil?
        value = (value & 0xffff9fff_u32) |
                UInt32.new!(msize.to_int).&(0x3_u32) << 13
      end

      unless psize.nil?
        value = (value & 0xffffe7ff_u32) |
                UInt32.new!(psize.to_int).&(0x3_u32) << 11
      end

      unless minc.nil?
        value = (value & 0xfffffbff_u32) |
                UInt32.new!(minc.to_int).&(0x1_u32) << 10
      end

      unless pinc.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(pinc.to_int).&(0x1_u32) << 9
      end

      unless circ.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(circ.to_int).&(0x1_u32) << 8
      end

      unless dir.nil?
        value = (value & 0xffffff3f_u32) |
                UInt32.new!(dir.to_int).&(0x3_u32) << 6
      end

      unless pfctrl.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(pfctrl.to_int).&(0x1_u32) << 5
      end

      unless tcie.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(tcie.to_int).&(0x1_u32) << 4
      end

      unless htie.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(htie.to_int).&(0x1_u32) << 3
      end

      unless teie.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(teie.to_int).&(0x1_u32) << 2
      end

      unless dmeie.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(dmeie.to_int).&(0x1_u32) << 1
      end

      unless en.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(en.to_int).&(0x1_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      chsel : UInt8? = nil,
      mburst : UInt8? = nil,
      pburst : UInt8? = nil,
      ack : Bool? = nil,
      ct : Bool? = nil,
      dbm : Bool? = nil,
      pl : UInt8? = nil,
      pincos : Bool? = nil,
      msize : UInt8? = nil,
      psize : UInt8? = nil,
      minc : Bool? = nil,
      pinc : Bool? = nil,
      circ : Bool? = nil,
      dir : UInt8? = nil,
      pfctrl : Bool? = nil,
      tcie : Bool? = nil,
      htie : Bool? = nil,
      teie : Bool? = nil,
      dmeie : Bool? = nil,
      en : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        chsel: chsel,
        mburst: mburst,
        pburst: pburst,
        ack: ack,
        ct: ct,
        dbm: dbm,
        pl: pl,
        pincos: pincos,
        msize: msize,
        psize: psize,
        minc: minc,
        pinc: pinc,
        circ: circ,
        dir: dir,
        pfctrl: pfctrl,
        tcie: tcie,
        htie: htie,
        teie: teie,
        dmeie: dmeie,
        en: en,
      )
    end
  end # struct

  # stream x number of data          register
  struct S4NDTR
    ADDRESS = BASE_ADDRESS + 0x74_u64

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

    # Number of data items to              transfer
    def ndt : UInt16
      UInt16.new!((@value >> 0) & 0xffff_u32)
    end

    # Number of data items to              transfer
    def self.ndt : UInt16
      value.ndt
    end

    # Number of data items to              transfer
    def self.ndt=(value : UInt16) : UInt16
      self.set(ndt: value)
      value
    end

    def copy_with(
      *,

      ndt : UInt16? = nil
    ) : self
      value = @value

      unless ndt.nil?
        value = (value & 0xffff0000_u32) |
                UInt32.new!(ndt.to_int).&(0xffff_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      ndt : UInt16? = nil
    ) : Nil
      self.value = self.value.copy_with(
        ndt: ndt,
      )
    end
  end # struct

  # stream x peripheral address          register
  struct S4PAR
    ADDRESS = BASE_ADDRESS + 0x78_u64

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

    # Peripheral address
    def pa : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # Peripheral address
    def self.pa : UInt32
      value.pa
    end

    # Peripheral address
    def self.pa=(value : UInt32) : UInt32
      self.set(pa: value)
      value
    end

    def copy_with(
      *,

      pa : UInt32? = nil
    ) : self
      value = @value

      unless pa.nil?
        value = (value & 0xffffffff_u32) |
                UInt32.new!(pa.to_int).&(0x0_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      pa : UInt32? = nil
    ) : Nil
      self.value = self.value.copy_with(
        pa: pa,
      )
    end
  end # struct

  # stream x memory 0 address          register
  struct S4M0AR
    ADDRESS = BASE_ADDRESS + 0x7c_u64

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

    # Memory 0 address
    def m0_a : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # Memory 0 address
    def self.m0_a : UInt32
      value.m0_a
    end

    # Memory 0 address
    def self.m0_a=(value : UInt32) : UInt32
      self.set(m0_a: value)
      value
    end

    def copy_with(
      *,

      m0_a : UInt32? = nil
    ) : self
      value = @value

      unless m0_a.nil?
        value = (value & 0xffffffff_u32) |
                UInt32.new!(m0_a.to_int).&(0x0_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      m0_a : UInt32? = nil
    ) : Nil
      self.value = self.value.copy_with(
        m0_a: m0_a,
      )
    end
  end # struct

  # stream x memory 1 address          register
  struct S4M1AR
    ADDRESS = BASE_ADDRESS + 0x80_u64

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

    # Memory 1 address (used in case of Double              buffer mode)
    def m1_a : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # Memory 1 address (used in case of Double              buffer mode)
    def self.m1_a : UInt32
      value.m1_a
    end

    # Memory 1 address (used in case of Double              buffer mode)
    def self.m1_a=(value : UInt32) : UInt32
      self.set(m1_a: value)
      value
    end

    def copy_with(
      *,

      m1_a : UInt32? = nil
    ) : self
      value = @value

      unless m1_a.nil?
        value = (value & 0xffffffff_u32) |
                UInt32.new!(m1_a.to_int).&(0x0_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      m1_a : UInt32? = nil
    ) : Nil
      self.value = self.value.copy_with(
        m1_a: m1_a,
      )
    end
  end # struct

  # stream x FIFO control register
  struct S4FCR
    ADDRESS = BASE_ADDRESS + 0x84_u64

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
      new(0x21_u64)
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

    # FIFO error interrupt              enable
    def feie : Bool
      @value.bits_set?(0x80_u32)
    end

    # FIFO error interrupt              enable
    def self.feie : Bool
      value.feie
    end

    # FIFO error interrupt              enable
    def self.feie=(value : Bool) : Bool
      self.set(feie: value)
      value
    end

    # FIFO status
    def fs : UInt8
      UInt8.new!((@value >> 3) & 0x7_u32)
    end

    # FIFO status
    def self.fs : UInt8
      value.fs
    end

    # Direct mode disable
    def dmdis : Bool
      @value.bits_set?(0x4_u32)
    end

    # Direct mode disable
    def self.dmdis : Bool
      value.dmdis
    end

    # Direct mode disable
    def self.dmdis=(value : Bool) : Bool
      self.set(dmdis: value)
      value
    end

    # FIFO threshold selection
    def fth : UInt8
      UInt8.new!((@value >> 0) & 0x3_u32)
    end

    # FIFO threshold selection
    def self.fth : UInt8
      value.fth
    end

    # FIFO threshold selection
    def self.fth=(value : UInt8) : UInt8
      self.set(fth: value)
      value
    end

    def copy_with(
      *,

      feie : Bool? = nil,

      dmdis : Bool? = nil,

      fth : UInt8? = nil
    ) : self
      value = @value

      unless feie.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(feie.to_int).&(0x1_u32) << 7
      end

      unless dmdis.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(dmdis.to_int).&(0x1_u32) << 2
      end

      unless fth.nil?
        value = (value & 0xfffffffc_u32) |
                UInt32.new!(fth.to_int).&(0x3_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      feie : Bool? = nil,
      dmdis : Bool? = nil,
      fth : UInt8? = nil
    ) : Nil
      self.value = self.value.copy_with(
        feie: feie,
        dmdis: dmdis,
        fth: fth,
      )
    end
  end # struct

  # stream x configuration          register
  struct S5CR
    ADDRESS = BASE_ADDRESS + 0x88_u64

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

    # Channel selection
    def chsel : UInt8
      UInt8.new!((@value >> 25) & 0x7_u32)
    end

    # Channel selection
    def self.chsel : UInt8
      value.chsel
    end

    # Channel selection
    def self.chsel=(value : UInt8) : UInt8
      self.set(chsel: value)
      value
    end

    # Memory burst transfer              configuration
    def mburst : UInt8
      UInt8.new!((@value >> 23) & 0x3_u32)
    end

    # Memory burst transfer              configuration
    def self.mburst : UInt8
      value.mburst
    end

    # Memory burst transfer              configuration
    def self.mburst=(value : UInt8) : UInt8
      self.set(mburst: value)
      value
    end

    # Peripheral burst transfer              configuration
    def pburst : UInt8
      UInt8.new!((@value >> 21) & 0x3_u32)
    end

    # Peripheral burst transfer              configuration
    def self.pburst : UInt8
      value.pburst
    end

    # Peripheral burst transfer              configuration
    def self.pburst=(value : UInt8) : UInt8
      self.set(pburst: value)
      value
    end

    # ACK
    def ack : Bool
      @value.bits_set?(0x100000_u32)
    end

    # ACK
    def self.ack : Bool
      value.ack
    end

    # ACK
    def self.ack=(value : Bool) : Bool
      self.set(ack: value)
      value
    end

    # Current target (only in double buffer              mode)
    def ct : Bool
      @value.bits_set?(0x80000_u32)
    end

    # Current target (only in double buffer              mode)
    def self.ct : Bool
      value.ct
    end

    # Current target (only in double buffer              mode)
    def self.ct=(value : Bool) : Bool
      self.set(ct: value)
      value
    end

    # Double buffer mode
    def dbm : Bool
      @value.bits_set?(0x40000_u32)
    end

    # Double buffer mode
    def self.dbm : Bool
      value.dbm
    end

    # Double buffer mode
    def self.dbm=(value : Bool) : Bool
      self.set(dbm: value)
      value
    end

    # Priority level
    def pl : UInt8
      UInt8.new!((@value >> 16) & 0x3_u32)
    end

    # Priority level
    def self.pl : UInt8
      value.pl
    end

    # Priority level
    def self.pl=(value : UInt8) : UInt8
      self.set(pl: value)
      value
    end

    # Peripheral increment offset              size
    def pincos : Bool
      @value.bits_set?(0x8000_u32)
    end

    # Peripheral increment offset              size
    def self.pincos : Bool
      value.pincos
    end

    # Peripheral increment offset              size
    def self.pincos=(value : Bool) : Bool
      self.set(pincos: value)
      value
    end

    # Memory data size
    def msize : UInt8
      UInt8.new!((@value >> 13) & 0x3_u32)
    end

    # Memory data size
    def self.msize : UInt8
      value.msize
    end

    # Memory data size
    def self.msize=(value : UInt8) : UInt8
      self.set(msize: value)
      value
    end

    # Peripheral data size
    def psize : UInt8
      UInt8.new!((@value >> 11) & 0x3_u32)
    end

    # Peripheral data size
    def self.psize : UInt8
      value.psize
    end

    # Peripheral data size
    def self.psize=(value : UInt8) : UInt8
      self.set(psize: value)
      value
    end

    # Memory increment mode
    def minc : Bool
      @value.bits_set?(0x400_u32)
    end

    # Memory increment mode
    def self.minc : Bool
      value.minc
    end

    # Memory increment mode
    def self.minc=(value : Bool) : Bool
      self.set(minc: value)
      value
    end

    # Peripheral increment mode
    def pinc : Bool
      @value.bits_set?(0x200_u32)
    end

    # Peripheral increment mode
    def self.pinc : Bool
      value.pinc
    end

    # Peripheral increment mode
    def self.pinc=(value : Bool) : Bool
      self.set(pinc: value)
      value
    end

    # Circular mode
    def circ : Bool
      @value.bits_set?(0x100_u32)
    end

    # Circular mode
    def self.circ : Bool
      value.circ
    end

    # Circular mode
    def self.circ=(value : Bool) : Bool
      self.set(circ: value)
      value
    end

    # Data transfer direction
    def dir : UInt8
      UInt8.new!((@value >> 6) & 0x3_u32)
    end

    # Data transfer direction
    def self.dir : UInt8
      value.dir
    end

    # Data transfer direction
    def self.dir=(value : UInt8) : UInt8
      self.set(dir: value)
      value
    end

    # Peripheral flow controller
    def pfctrl : Bool
      @value.bits_set?(0x20_u32)
    end

    # Peripheral flow controller
    def self.pfctrl : Bool
      value.pfctrl
    end

    # Peripheral flow controller
    def self.pfctrl=(value : Bool) : Bool
      self.set(pfctrl: value)
      value
    end

    # Transfer complete interrupt              enable
    def tcie : Bool
      @value.bits_set?(0x10_u32)
    end

    # Transfer complete interrupt              enable
    def self.tcie : Bool
      value.tcie
    end

    # Transfer complete interrupt              enable
    def self.tcie=(value : Bool) : Bool
      self.set(tcie: value)
      value
    end

    # Half transfer interrupt              enable
    def htie : Bool
      @value.bits_set?(0x8_u32)
    end

    # Half transfer interrupt              enable
    def self.htie : Bool
      value.htie
    end

    # Half transfer interrupt              enable
    def self.htie=(value : Bool) : Bool
      self.set(htie: value)
      value
    end

    # Transfer error interrupt              enable
    def teie : Bool
      @value.bits_set?(0x4_u32)
    end

    # Transfer error interrupt              enable
    def self.teie : Bool
      value.teie
    end

    # Transfer error interrupt              enable
    def self.teie=(value : Bool) : Bool
      self.set(teie: value)
      value
    end

    # Direct mode error interrupt              enable
    def dmeie : Bool
      @value.bits_set?(0x2_u32)
    end

    # Direct mode error interrupt              enable
    def self.dmeie : Bool
      value.dmeie
    end

    # Direct mode error interrupt              enable
    def self.dmeie=(value : Bool) : Bool
      self.set(dmeie: value)
      value
    end

    # Stream enable / flag stream ready when              read low
    def en : Bool
      @value.bits_set?(0x1_u32)
    end

    # Stream enable / flag stream ready when              read low
    def self.en : Bool
      value.en
    end

    # Stream enable / flag stream ready when              read low
    def self.en=(value : Bool) : Bool
      self.set(en: value)
      value
    end

    def copy_with(
      *,

      chsel : UInt8? = nil,

      mburst : UInt8? = nil,

      pburst : UInt8? = nil,

      ack : Bool? = nil,

      ct : Bool? = nil,

      dbm : Bool? = nil,

      pl : UInt8? = nil,

      pincos : Bool? = nil,

      msize : UInt8? = nil,

      psize : UInt8? = nil,

      minc : Bool? = nil,

      pinc : Bool? = nil,

      circ : Bool? = nil,

      dir : UInt8? = nil,

      pfctrl : Bool? = nil,

      tcie : Bool? = nil,

      htie : Bool? = nil,

      teie : Bool? = nil,

      dmeie : Bool? = nil,

      en : Bool? = nil
    ) : self
      value = @value

      unless chsel.nil?
        value = (value & 0xf1ffffff_u32) |
                UInt32.new!(chsel.to_int).&(0x7_u32) << 25
      end

      unless mburst.nil?
        value = (value & 0xfe7fffff_u32) |
                UInt32.new!(mburst.to_int).&(0x3_u32) << 23
      end

      unless pburst.nil?
        value = (value & 0xff9fffff_u32) |
                UInt32.new!(pburst.to_int).&(0x3_u32) << 21
      end

      unless ack.nil?
        value = (value & 0xffefffff_u32) |
                UInt32.new!(ack.to_int).&(0x1_u32) << 20
      end

      unless ct.nil?
        value = (value & 0xfff7ffff_u32) |
                UInt32.new!(ct.to_int).&(0x1_u32) << 19
      end

      unless dbm.nil?
        value = (value & 0xfffbffff_u32) |
                UInt32.new!(dbm.to_int).&(0x1_u32) << 18
      end

      unless pl.nil?
        value = (value & 0xfffcffff_u32) |
                UInt32.new!(pl.to_int).&(0x3_u32) << 16
      end

      unless pincos.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(pincos.to_int).&(0x1_u32) << 15
      end

      unless msize.nil?
        value = (value & 0xffff9fff_u32) |
                UInt32.new!(msize.to_int).&(0x3_u32) << 13
      end

      unless psize.nil?
        value = (value & 0xffffe7ff_u32) |
                UInt32.new!(psize.to_int).&(0x3_u32) << 11
      end

      unless minc.nil?
        value = (value & 0xfffffbff_u32) |
                UInt32.new!(minc.to_int).&(0x1_u32) << 10
      end

      unless pinc.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(pinc.to_int).&(0x1_u32) << 9
      end

      unless circ.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(circ.to_int).&(0x1_u32) << 8
      end

      unless dir.nil?
        value = (value & 0xffffff3f_u32) |
                UInt32.new!(dir.to_int).&(0x3_u32) << 6
      end

      unless pfctrl.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(pfctrl.to_int).&(0x1_u32) << 5
      end

      unless tcie.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(tcie.to_int).&(0x1_u32) << 4
      end

      unless htie.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(htie.to_int).&(0x1_u32) << 3
      end

      unless teie.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(teie.to_int).&(0x1_u32) << 2
      end

      unless dmeie.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(dmeie.to_int).&(0x1_u32) << 1
      end

      unless en.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(en.to_int).&(0x1_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      chsel : UInt8? = nil,
      mburst : UInt8? = nil,
      pburst : UInt8? = nil,
      ack : Bool? = nil,
      ct : Bool? = nil,
      dbm : Bool? = nil,
      pl : UInt8? = nil,
      pincos : Bool? = nil,
      msize : UInt8? = nil,
      psize : UInt8? = nil,
      minc : Bool? = nil,
      pinc : Bool? = nil,
      circ : Bool? = nil,
      dir : UInt8? = nil,
      pfctrl : Bool? = nil,
      tcie : Bool? = nil,
      htie : Bool? = nil,
      teie : Bool? = nil,
      dmeie : Bool? = nil,
      en : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        chsel: chsel,
        mburst: mburst,
        pburst: pburst,
        ack: ack,
        ct: ct,
        dbm: dbm,
        pl: pl,
        pincos: pincos,
        msize: msize,
        psize: psize,
        minc: minc,
        pinc: pinc,
        circ: circ,
        dir: dir,
        pfctrl: pfctrl,
        tcie: tcie,
        htie: htie,
        teie: teie,
        dmeie: dmeie,
        en: en,
      )
    end
  end # struct

  # stream x number of data          register
  struct S5NDTR
    ADDRESS = BASE_ADDRESS + 0x8c_u64

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

    # Number of data items to              transfer
    def ndt : UInt16
      UInt16.new!((@value >> 0) & 0xffff_u32)
    end

    # Number of data items to              transfer
    def self.ndt : UInt16
      value.ndt
    end

    # Number of data items to              transfer
    def self.ndt=(value : UInt16) : UInt16
      self.set(ndt: value)
      value
    end

    def copy_with(
      *,

      ndt : UInt16? = nil
    ) : self
      value = @value

      unless ndt.nil?
        value = (value & 0xffff0000_u32) |
                UInt32.new!(ndt.to_int).&(0xffff_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      ndt : UInt16? = nil
    ) : Nil
      self.value = self.value.copy_with(
        ndt: ndt,
      )
    end
  end # struct

  # stream x peripheral address          register
  struct S5PAR
    ADDRESS = BASE_ADDRESS + 0x90_u64

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

    # Peripheral address
    def pa : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # Peripheral address
    def self.pa : UInt32
      value.pa
    end

    # Peripheral address
    def self.pa=(value : UInt32) : UInt32
      self.set(pa: value)
      value
    end

    def copy_with(
      *,

      pa : UInt32? = nil
    ) : self
      value = @value

      unless pa.nil?
        value = (value & 0xffffffff_u32) |
                UInt32.new!(pa.to_int).&(0x0_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      pa : UInt32? = nil
    ) : Nil
      self.value = self.value.copy_with(
        pa: pa,
      )
    end
  end # struct

  # stream x memory 0 address          register
  struct S5M0AR
    ADDRESS = BASE_ADDRESS + 0x94_u64

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

    # Memory 0 address
    def m0_a : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # Memory 0 address
    def self.m0_a : UInt32
      value.m0_a
    end

    # Memory 0 address
    def self.m0_a=(value : UInt32) : UInt32
      self.set(m0_a: value)
      value
    end

    def copy_with(
      *,

      m0_a : UInt32? = nil
    ) : self
      value = @value

      unless m0_a.nil?
        value = (value & 0xffffffff_u32) |
                UInt32.new!(m0_a.to_int).&(0x0_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      m0_a : UInt32? = nil
    ) : Nil
      self.value = self.value.copy_with(
        m0_a: m0_a,
      )
    end
  end # struct

  # stream x memory 1 address          register
  struct S5M1AR
    ADDRESS = BASE_ADDRESS + 0x98_u64

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

    # Memory 1 address (used in case of Double              buffer mode)
    def m1_a : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # Memory 1 address (used in case of Double              buffer mode)
    def self.m1_a : UInt32
      value.m1_a
    end

    # Memory 1 address (used in case of Double              buffer mode)
    def self.m1_a=(value : UInt32) : UInt32
      self.set(m1_a: value)
      value
    end

    def copy_with(
      *,

      m1_a : UInt32? = nil
    ) : self
      value = @value

      unless m1_a.nil?
        value = (value & 0xffffffff_u32) |
                UInt32.new!(m1_a.to_int).&(0x0_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      m1_a : UInt32? = nil
    ) : Nil
      self.value = self.value.copy_with(
        m1_a: m1_a,
      )
    end
  end # struct

  # stream x FIFO control register
  struct S5FCR
    ADDRESS = BASE_ADDRESS + 0x9c_u64

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
      new(0x21_u64)
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

    # FIFO error interrupt              enable
    def feie : Bool
      @value.bits_set?(0x80_u32)
    end

    # FIFO error interrupt              enable
    def self.feie : Bool
      value.feie
    end

    # FIFO error interrupt              enable
    def self.feie=(value : Bool) : Bool
      self.set(feie: value)
      value
    end

    # FIFO status
    def fs : UInt8
      UInt8.new!((@value >> 3) & 0x7_u32)
    end

    # FIFO status
    def self.fs : UInt8
      value.fs
    end

    # Direct mode disable
    def dmdis : Bool
      @value.bits_set?(0x4_u32)
    end

    # Direct mode disable
    def self.dmdis : Bool
      value.dmdis
    end

    # Direct mode disable
    def self.dmdis=(value : Bool) : Bool
      self.set(dmdis: value)
      value
    end

    # FIFO threshold selection
    def fth : UInt8
      UInt8.new!((@value >> 0) & 0x3_u32)
    end

    # FIFO threshold selection
    def self.fth : UInt8
      value.fth
    end

    # FIFO threshold selection
    def self.fth=(value : UInt8) : UInt8
      self.set(fth: value)
      value
    end

    def copy_with(
      *,

      feie : Bool? = nil,

      dmdis : Bool? = nil,

      fth : UInt8? = nil
    ) : self
      value = @value

      unless feie.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(feie.to_int).&(0x1_u32) << 7
      end

      unless dmdis.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(dmdis.to_int).&(0x1_u32) << 2
      end

      unless fth.nil?
        value = (value & 0xfffffffc_u32) |
                UInt32.new!(fth.to_int).&(0x3_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      feie : Bool? = nil,
      dmdis : Bool? = nil,
      fth : UInt8? = nil
    ) : Nil
      self.value = self.value.copy_with(
        feie: feie,
        dmdis: dmdis,
        fth: fth,
      )
    end
  end # struct

  # stream x configuration          register
  struct S6CR
    ADDRESS = BASE_ADDRESS + 0xa0_u64

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

    # Channel selection
    def chsel : UInt8
      UInt8.new!((@value >> 25) & 0x7_u32)
    end

    # Channel selection
    def self.chsel : UInt8
      value.chsel
    end

    # Channel selection
    def self.chsel=(value : UInt8) : UInt8
      self.set(chsel: value)
      value
    end

    # Memory burst transfer              configuration
    def mburst : UInt8
      UInt8.new!((@value >> 23) & 0x3_u32)
    end

    # Memory burst transfer              configuration
    def self.mburst : UInt8
      value.mburst
    end

    # Memory burst transfer              configuration
    def self.mburst=(value : UInt8) : UInt8
      self.set(mburst: value)
      value
    end

    # Peripheral burst transfer              configuration
    def pburst : UInt8
      UInt8.new!((@value >> 21) & 0x3_u32)
    end

    # Peripheral burst transfer              configuration
    def self.pburst : UInt8
      value.pburst
    end

    # Peripheral burst transfer              configuration
    def self.pburst=(value : UInt8) : UInt8
      self.set(pburst: value)
      value
    end

    # ACK
    def ack : Bool
      @value.bits_set?(0x100000_u32)
    end

    # ACK
    def self.ack : Bool
      value.ack
    end

    # ACK
    def self.ack=(value : Bool) : Bool
      self.set(ack: value)
      value
    end

    # Current target (only in double buffer              mode)
    def ct : Bool
      @value.bits_set?(0x80000_u32)
    end

    # Current target (only in double buffer              mode)
    def self.ct : Bool
      value.ct
    end

    # Current target (only in double buffer              mode)
    def self.ct=(value : Bool) : Bool
      self.set(ct: value)
      value
    end

    # Double buffer mode
    def dbm : Bool
      @value.bits_set?(0x40000_u32)
    end

    # Double buffer mode
    def self.dbm : Bool
      value.dbm
    end

    # Double buffer mode
    def self.dbm=(value : Bool) : Bool
      self.set(dbm: value)
      value
    end

    # Priority level
    def pl : UInt8
      UInt8.new!((@value >> 16) & 0x3_u32)
    end

    # Priority level
    def self.pl : UInt8
      value.pl
    end

    # Priority level
    def self.pl=(value : UInt8) : UInt8
      self.set(pl: value)
      value
    end

    # Peripheral increment offset              size
    def pincos : Bool
      @value.bits_set?(0x8000_u32)
    end

    # Peripheral increment offset              size
    def self.pincos : Bool
      value.pincos
    end

    # Peripheral increment offset              size
    def self.pincos=(value : Bool) : Bool
      self.set(pincos: value)
      value
    end

    # Memory data size
    def msize : UInt8
      UInt8.new!((@value >> 13) & 0x3_u32)
    end

    # Memory data size
    def self.msize : UInt8
      value.msize
    end

    # Memory data size
    def self.msize=(value : UInt8) : UInt8
      self.set(msize: value)
      value
    end

    # Peripheral data size
    def psize : UInt8
      UInt8.new!((@value >> 11) & 0x3_u32)
    end

    # Peripheral data size
    def self.psize : UInt8
      value.psize
    end

    # Peripheral data size
    def self.psize=(value : UInt8) : UInt8
      self.set(psize: value)
      value
    end

    # Memory increment mode
    def minc : Bool
      @value.bits_set?(0x400_u32)
    end

    # Memory increment mode
    def self.minc : Bool
      value.minc
    end

    # Memory increment mode
    def self.minc=(value : Bool) : Bool
      self.set(minc: value)
      value
    end

    # Peripheral increment mode
    def pinc : Bool
      @value.bits_set?(0x200_u32)
    end

    # Peripheral increment mode
    def self.pinc : Bool
      value.pinc
    end

    # Peripheral increment mode
    def self.pinc=(value : Bool) : Bool
      self.set(pinc: value)
      value
    end

    # Circular mode
    def circ : Bool
      @value.bits_set?(0x100_u32)
    end

    # Circular mode
    def self.circ : Bool
      value.circ
    end

    # Circular mode
    def self.circ=(value : Bool) : Bool
      self.set(circ: value)
      value
    end

    # Data transfer direction
    def dir : UInt8
      UInt8.new!((@value >> 6) & 0x3_u32)
    end

    # Data transfer direction
    def self.dir : UInt8
      value.dir
    end

    # Data transfer direction
    def self.dir=(value : UInt8) : UInt8
      self.set(dir: value)
      value
    end

    # Peripheral flow controller
    def pfctrl : Bool
      @value.bits_set?(0x20_u32)
    end

    # Peripheral flow controller
    def self.pfctrl : Bool
      value.pfctrl
    end

    # Peripheral flow controller
    def self.pfctrl=(value : Bool) : Bool
      self.set(pfctrl: value)
      value
    end

    # Transfer complete interrupt              enable
    def tcie : Bool
      @value.bits_set?(0x10_u32)
    end

    # Transfer complete interrupt              enable
    def self.tcie : Bool
      value.tcie
    end

    # Transfer complete interrupt              enable
    def self.tcie=(value : Bool) : Bool
      self.set(tcie: value)
      value
    end

    # Half transfer interrupt              enable
    def htie : Bool
      @value.bits_set?(0x8_u32)
    end

    # Half transfer interrupt              enable
    def self.htie : Bool
      value.htie
    end

    # Half transfer interrupt              enable
    def self.htie=(value : Bool) : Bool
      self.set(htie: value)
      value
    end

    # Transfer error interrupt              enable
    def teie : Bool
      @value.bits_set?(0x4_u32)
    end

    # Transfer error interrupt              enable
    def self.teie : Bool
      value.teie
    end

    # Transfer error interrupt              enable
    def self.teie=(value : Bool) : Bool
      self.set(teie: value)
      value
    end

    # Direct mode error interrupt              enable
    def dmeie : Bool
      @value.bits_set?(0x2_u32)
    end

    # Direct mode error interrupt              enable
    def self.dmeie : Bool
      value.dmeie
    end

    # Direct mode error interrupt              enable
    def self.dmeie=(value : Bool) : Bool
      self.set(dmeie: value)
      value
    end

    # Stream enable / flag stream ready when              read low
    def en : Bool
      @value.bits_set?(0x1_u32)
    end

    # Stream enable / flag stream ready when              read low
    def self.en : Bool
      value.en
    end

    # Stream enable / flag stream ready when              read low
    def self.en=(value : Bool) : Bool
      self.set(en: value)
      value
    end

    def copy_with(
      *,

      chsel : UInt8? = nil,

      mburst : UInt8? = nil,

      pburst : UInt8? = nil,

      ack : Bool? = nil,

      ct : Bool? = nil,

      dbm : Bool? = nil,

      pl : UInt8? = nil,

      pincos : Bool? = nil,

      msize : UInt8? = nil,

      psize : UInt8? = nil,

      minc : Bool? = nil,

      pinc : Bool? = nil,

      circ : Bool? = nil,

      dir : UInt8? = nil,

      pfctrl : Bool? = nil,

      tcie : Bool? = nil,

      htie : Bool? = nil,

      teie : Bool? = nil,

      dmeie : Bool? = nil,

      en : Bool? = nil
    ) : self
      value = @value

      unless chsel.nil?
        value = (value & 0xf1ffffff_u32) |
                UInt32.new!(chsel.to_int).&(0x7_u32) << 25
      end

      unless mburst.nil?
        value = (value & 0xfe7fffff_u32) |
                UInt32.new!(mburst.to_int).&(0x3_u32) << 23
      end

      unless pburst.nil?
        value = (value & 0xff9fffff_u32) |
                UInt32.new!(pburst.to_int).&(0x3_u32) << 21
      end

      unless ack.nil?
        value = (value & 0xffefffff_u32) |
                UInt32.new!(ack.to_int).&(0x1_u32) << 20
      end

      unless ct.nil?
        value = (value & 0xfff7ffff_u32) |
                UInt32.new!(ct.to_int).&(0x1_u32) << 19
      end

      unless dbm.nil?
        value = (value & 0xfffbffff_u32) |
                UInt32.new!(dbm.to_int).&(0x1_u32) << 18
      end

      unless pl.nil?
        value = (value & 0xfffcffff_u32) |
                UInt32.new!(pl.to_int).&(0x3_u32) << 16
      end

      unless pincos.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(pincos.to_int).&(0x1_u32) << 15
      end

      unless msize.nil?
        value = (value & 0xffff9fff_u32) |
                UInt32.new!(msize.to_int).&(0x3_u32) << 13
      end

      unless psize.nil?
        value = (value & 0xffffe7ff_u32) |
                UInt32.new!(psize.to_int).&(0x3_u32) << 11
      end

      unless minc.nil?
        value = (value & 0xfffffbff_u32) |
                UInt32.new!(minc.to_int).&(0x1_u32) << 10
      end

      unless pinc.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(pinc.to_int).&(0x1_u32) << 9
      end

      unless circ.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(circ.to_int).&(0x1_u32) << 8
      end

      unless dir.nil?
        value = (value & 0xffffff3f_u32) |
                UInt32.new!(dir.to_int).&(0x3_u32) << 6
      end

      unless pfctrl.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(pfctrl.to_int).&(0x1_u32) << 5
      end

      unless tcie.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(tcie.to_int).&(0x1_u32) << 4
      end

      unless htie.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(htie.to_int).&(0x1_u32) << 3
      end

      unless teie.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(teie.to_int).&(0x1_u32) << 2
      end

      unless dmeie.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(dmeie.to_int).&(0x1_u32) << 1
      end

      unless en.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(en.to_int).&(0x1_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      chsel : UInt8? = nil,
      mburst : UInt8? = nil,
      pburst : UInt8? = nil,
      ack : Bool? = nil,
      ct : Bool? = nil,
      dbm : Bool? = nil,
      pl : UInt8? = nil,
      pincos : Bool? = nil,
      msize : UInt8? = nil,
      psize : UInt8? = nil,
      minc : Bool? = nil,
      pinc : Bool? = nil,
      circ : Bool? = nil,
      dir : UInt8? = nil,
      pfctrl : Bool? = nil,
      tcie : Bool? = nil,
      htie : Bool? = nil,
      teie : Bool? = nil,
      dmeie : Bool? = nil,
      en : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        chsel: chsel,
        mburst: mburst,
        pburst: pburst,
        ack: ack,
        ct: ct,
        dbm: dbm,
        pl: pl,
        pincos: pincos,
        msize: msize,
        psize: psize,
        minc: minc,
        pinc: pinc,
        circ: circ,
        dir: dir,
        pfctrl: pfctrl,
        tcie: tcie,
        htie: htie,
        teie: teie,
        dmeie: dmeie,
        en: en,
      )
    end
  end # struct

  # stream x number of data          register
  struct S6NDTR
    ADDRESS = BASE_ADDRESS + 0xa4_u64

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

    # Number of data items to              transfer
    def ndt : UInt16
      UInt16.new!((@value >> 0) & 0xffff_u32)
    end

    # Number of data items to              transfer
    def self.ndt : UInt16
      value.ndt
    end

    # Number of data items to              transfer
    def self.ndt=(value : UInt16) : UInt16
      self.set(ndt: value)
      value
    end

    def copy_with(
      *,

      ndt : UInt16? = nil
    ) : self
      value = @value

      unless ndt.nil?
        value = (value & 0xffff0000_u32) |
                UInt32.new!(ndt.to_int).&(0xffff_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      ndt : UInt16? = nil
    ) : Nil
      self.value = self.value.copy_with(
        ndt: ndt,
      )
    end
  end # struct

  # stream x peripheral address          register
  struct S6PAR
    ADDRESS = BASE_ADDRESS + 0xa8_u64

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

    # Peripheral address
    def pa : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # Peripheral address
    def self.pa : UInt32
      value.pa
    end

    # Peripheral address
    def self.pa=(value : UInt32) : UInt32
      self.set(pa: value)
      value
    end

    def copy_with(
      *,

      pa : UInt32? = nil
    ) : self
      value = @value

      unless pa.nil?
        value = (value & 0xffffffff_u32) |
                UInt32.new!(pa.to_int).&(0x0_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      pa : UInt32? = nil
    ) : Nil
      self.value = self.value.copy_with(
        pa: pa,
      )
    end
  end # struct

  # stream x memory 0 address          register
  struct S6M0AR
    ADDRESS = BASE_ADDRESS + 0xac_u64

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

    # Memory 0 address
    def m0_a : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # Memory 0 address
    def self.m0_a : UInt32
      value.m0_a
    end

    # Memory 0 address
    def self.m0_a=(value : UInt32) : UInt32
      self.set(m0_a: value)
      value
    end

    def copy_with(
      *,

      m0_a : UInt32? = nil
    ) : self
      value = @value

      unless m0_a.nil?
        value = (value & 0xffffffff_u32) |
                UInt32.new!(m0_a.to_int).&(0x0_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      m0_a : UInt32? = nil
    ) : Nil
      self.value = self.value.copy_with(
        m0_a: m0_a,
      )
    end
  end # struct

  # stream x memory 1 address          register
  struct S6M1AR
    ADDRESS = BASE_ADDRESS + 0xb0_u64

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

    # Memory 1 address (used in case of Double              buffer mode)
    def m1_a : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # Memory 1 address (used in case of Double              buffer mode)
    def self.m1_a : UInt32
      value.m1_a
    end

    # Memory 1 address (used in case of Double              buffer mode)
    def self.m1_a=(value : UInt32) : UInt32
      self.set(m1_a: value)
      value
    end

    def copy_with(
      *,

      m1_a : UInt32? = nil
    ) : self
      value = @value

      unless m1_a.nil?
        value = (value & 0xffffffff_u32) |
                UInt32.new!(m1_a.to_int).&(0x0_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      m1_a : UInt32? = nil
    ) : Nil
      self.value = self.value.copy_with(
        m1_a: m1_a,
      )
    end
  end # struct

  # stream x FIFO control register
  struct S6FCR
    ADDRESS = BASE_ADDRESS + 0xb4_u64

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
      new(0x21_u64)
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

    # FIFO error interrupt              enable
    def feie : Bool
      @value.bits_set?(0x80_u32)
    end

    # FIFO error interrupt              enable
    def self.feie : Bool
      value.feie
    end

    # FIFO error interrupt              enable
    def self.feie=(value : Bool) : Bool
      self.set(feie: value)
      value
    end

    # FIFO status
    def fs : UInt8
      UInt8.new!((@value >> 3) & 0x7_u32)
    end

    # FIFO status
    def self.fs : UInt8
      value.fs
    end

    # Direct mode disable
    def dmdis : Bool
      @value.bits_set?(0x4_u32)
    end

    # Direct mode disable
    def self.dmdis : Bool
      value.dmdis
    end

    # Direct mode disable
    def self.dmdis=(value : Bool) : Bool
      self.set(dmdis: value)
      value
    end

    # FIFO threshold selection
    def fth : UInt8
      UInt8.new!((@value >> 0) & 0x3_u32)
    end

    # FIFO threshold selection
    def self.fth : UInt8
      value.fth
    end

    # FIFO threshold selection
    def self.fth=(value : UInt8) : UInt8
      self.set(fth: value)
      value
    end

    def copy_with(
      *,

      feie : Bool? = nil,

      dmdis : Bool? = nil,

      fth : UInt8? = nil
    ) : self
      value = @value

      unless feie.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(feie.to_int).&(0x1_u32) << 7
      end

      unless dmdis.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(dmdis.to_int).&(0x1_u32) << 2
      end

      unless fth.nil?
        value = (value & 0xfffffffc_u32) |
                UInt32.new!(fth.to_int).&(0x3_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      feie : Bool? = nil,
      dmdis : Bool? = nil,
      fth : UInt8? = nil
    ) : Nil
      self.value = self.value.copy_with(
        feie: feie,
        dmdis: dmdis,
        fth: fth,
      )
    end
  end # struct

  # stream x configuration          register
  struct S7CR
    ADDRESS = BASE_ADDRESS + 0xb8_u64

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

    # Channel selection
    def chsel : UInt8
      UInt8.new!((@value >> 25) & 0x7_u32)
    end

    # Channel selection
    def self.chsel : UInt8
      value.chsel
    end

    # Channel selection
    def self.chsel=(value : UInt8) : UInt8
      self.set(chsel: value)
      value
    end

    # Memory burst transfer              configuration
    def mburst : UInt8
      UInt8.new!((@value >> 23) & 0x3_u32)
    end

    # Memory burst transfer              configuration
    def self.mburst : UInt8
      value.mburst
    end

    # Memory burst transfer              configuration
    def self.mburst=(value : UInt8) : UInt8
      self.set(mburst: value)
      value
    end

    # Peripheral burst transfer              configuration
    def pburst : UInt8
      UInt8.new!((@value >> 21) & 0x3_u32)
    end

    # Peripheral burst transfer              configuration
    def self.pburst : UInt8
      value.pburst
    end

    # Peripheral burst transfer              configuration
    def self.pburst=(value : UInt8) : UInt8
      self.set(pburst: value)
      value
    end

    # ACK
    def ack : Bool
      @value.bits_set?(0x100000_u32)
    end

    # ACK
    def self.ack : Bool
      value.ack
    end

    # ACK
    def self.ack=(value : Bool) : Bool
      self.set(ack: value)
      value
    end

    # Current target (only in double buffer              mode)
    def ct : Bool
      @value.bits_set?(0x80000_u32)
    end

    # Current target (only in double buffer              mode)
    def self.ct : Bool
      value.ct
    end

    # Current target (only in double buffer              mode)
    def self.ct=(value : Bool) : Bool
      self.set(ct: value)
      value
    end

    # Double buffer mode
    def dbm : Bool
      @value.bits_set?(0x40000_u32)
    end

    # Double buffer mode
    def self.dbm : Bool
      value.dbm
    end

    # Double buffer mode
    def self.dbm=(value : Bool) : Bool
      self.set(dbm: value)
      value
    end

    # Priority level
    def pl : UInt8
      UInt8.new!((@value >> 16) & 0x3_u32)
    end

    # Priority level
    def self.pl : UInt8
      value.pl
    end

    # Priority level
    def self.pl=(value : UInt8) : UInt8
      self.set(pl: value)
      value
    end

    # Peripheral increment offset              size
    def pincos : Bool
      @value.bits_set?(0x8000_u32)
    end

    # Peripheral increment offset              size
    def self.pincos : Bool
      value.pincos
    end

    # Peripheral increment offset              size
    def self.pincos=(value : Bool) : Bool
      self.set(pincos: value)
      value
    end

    # Memory data size
    def msize : UInt8
      UInt8.new!((@value >> 13) & 0x3_u32)
    end

    # Memory data size
    def self.msize : UInt8
      value.msize
    end

    # Memory data size
    def self.msize=(value : UInt8) : UInt8
      self.set(msize: value)
      value
    end

    # Peripheral data size
    def psize : UInt8
      UInt8.new!((@value >> 11) & 0x3_u32)
    end

    # Peripheral data size
    def self.psize : UInt8
      value.psize
    end

    # Peripheral data size
    def self.psize=(value : UInt8) : UInt8
      self.set(psize: value)
      value
    end

    # Memory increment mode
    def minc : Bool
      @value.bits_set?(0x400_u32)
    end

    # Memory increment mode
    def self.minc : Bool
      value.minc
    end

    # Memory increment mode
    def self.minc=(value : Bool) : Bool
      self.set(minc: value)
      value
    end

    # Peripheral increment mode
    def pinc : Bool
      @value.bits_set?(0x200_u32)
    end

    # Peripheral increment mode
    def self.pinc : Bool
      value.pinc
    end

    # Peripheral increment mode
    def self.pinc=(value : Bool) : Bool
      self.set(pinc: value)
      value
    end

    # Circular mode
    def circ : Bool
      @value.bits_set?(0x100_u32)
    end

    # Circular mode
    def self.circ : Bool
      value.circ
    end

    # Circular mode
    def self.circ=(value : Bool) : Bool
      self.set(circ: value)
      value
    end

    # Data transfer direction
    def dir : UInt8
      UInt8.new!((@value >> 6) & 0x3_u32)
    end

    # Data transfer direction
    def self.dir : UInt8
      value.dir
    end

    # Data transfer direction
    def self.dir=(value : UInt8) : UInt8
      self.set(dir: value)
      value
    end

    # Peripheral flow controller
    def pfctrl : Bool
      @value.bits_set?(0x20_u32)
    end

    # Peripheral flow controller
    def self.pfctrl : Bool
      value.pfctrl
    end

    # Peripheral flow controller
    def self.pfctrl=(value : Bool) : Bool
      self.set(pfctrl: value)
      value
    end

    # Transfer complete interrupt              enable
    def tcie : Bool
      @value.bits_set?(0x10_u32)
    end

    # Transfer complete interrupt              enable
    def self.tcie : Bool
      value.tcie
    end

    # Transfer complete interrupt              enable
    def self.tcie=(value : Bool) : Bool
      self.set(tcie: value)
      value
    end

    # Half transfer interrupt              enable
    def htie : Bool
      @value.bits_set?(0x8_u32)
    end

    # Half transfer interrupt              enable
    def self.htie : Bool
      value.htie
    end

    # Half transfer interrupt              enable
    def self.htie=(value : Bool) : Bool
      self.set(htie: value)
      value
    end

    # Transfer error interrupt              enable
    def teie : Bool
      @value.bits_set?(0x4_u32)
    end

    # Transfer error interrupt              enable
    def self.teie : Bool
      value.teie
    end

    # Transfer error interrupt              enable
    def self.teie=(value : Bool) : Bool
      self.set(teie: value)
      value
    end

    # Direct mode error interrupt              enable
    def dmeie : Bool
      @value.bits_set?(0x2_u32)
    end

    # Direct mode error interrupt              enable
    def self.dmeie : Bool
      value.dmeie
    end

    # Direct mode error interrupt              enable
    def self.dmeie=(value : Bool) : Bool
      self.set(dmeie: value)
      value
    end

    # Stream enable / flag stream ready when              read low
    def en : Bool
      @value.bits_set?(0x1_u32)
    end

    # Stream enable / flag stream ready when              read low
    def self.en : Bool
      value.en
    end

    # Stream enable / flag stream ready when              read low
    def self.en=(value : Bool) : Bool
      self.set(en: value)
      value
    end

    def copy_with(
      *,

      chsel : UInt8? = nil,

      mburst : UInt8? = nil,

      pburst : UInt8? = nil,

      ack : Bool? = nil,

      ct : Bool? = nil,

      dbm : Bool? = nil,

      pl : UInt8? = nil,

      pincos : Bool? = nil,

      msize : UInt8? = nil,

      psize : UInt8? = nil,

      minc : Bool? = nil,

      pinc : Bool? = nil,

      circ : Bool? = nil,

      dir : UInt8? = nil,

      pfctrl : Bool? = nil,

      tcie : Bool? = nil,

      htie : Bool? = nil,

      teie : Bool? = nil,

      dmeie : Bool? = nil,

      en : Bool? = nil
    ) : self
      value = @value

      unless chsel.nil?
        value = (value & 0xf1ffffff_u32) |
                UInt32.new!(chsel.to_int).&(0x7_u32) << 25
      end

      unless mburst.nil?
        value = (value & 0xfe7fffff_u32) |
                UInt32.new!(mburst.to_int).&(0x3_u32) << 23
      end

      unless pburst.nil?
        value = (value & 0xff9fffff_u32) |
                UInt32.new!(pburst.to_int).&(0x3_u32) << 21
      end

      unless ack.nil?
        value = (value & 0xffefffff_u32) |
                UInt32.new!(ack.to_int).&(0x1_u32) << 20
      end

      unless ct.nil?
        value = (value & 0xfff7ffff_u32) |
                UInt32.new!(ct.to_int).&(0x1_u32) << 19
      end

      unless dbm.nil?
        value = (value & 0xfffbffff_u32) |
                UInt32.new!(dbm.to_int).&(0x1_u32) << 18
      end

      unless pl.nil?
        value = (value & 0xfffcffff_u32) |
                UInt32.new!(pl.to_int).&(0x3_u32) << 16
      end

      unless pincos.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(pincos.to_int).&(0x1_u32) << 15
      end

      unless msize.nil?
        value = (value & 0xffff9fff_u32) |
                UInt32.new!(msize.to_int).&(0x3_u32) << 13
      end

      unless psize.nil?
        value = (value & 0xffffe7ff_u32) |
                UInt32.new!(psize.to_int).&(0x3_u32) << 11
      end

      unless minc.nil?
        value = (value & 0xfffffbff_u32) |
                UInt32.new!(minc.to_int).&(0x1_u32) << 10
      end

      unless pinc.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(pinc.to_int).&(0x1_u32) << 9
      end

      unless circ.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(circ.to_int).&(0x1_u32) << 8
      end

      unless dir.nil?
        value = (value & 0xffffff3f_u32) |
                UInt32.new!(dir.to_int).&(0x3_u32) << 6
      end

      unless pfctrl.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(pfctrl.to_int).&(0x1_u32) << 5
      end

      unless tcie.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(tcie.to_int).&(0x1_u32) << 4
      end

      unless htie.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(htie.to_int).&(0x1_u32) << 3
      end

      unless teie.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(teie.to_int).&(0x1_u32) << 2
      end

      unless dmeie.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(dmeie.to_int).&(0x1_u32) << 1
      end

      unless en.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(en.to_int).&(0x1_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      chsel : UInt8? = nil,
      mburst : UInt8? = nil,
      pburst : UInt8? = nil,
      ack : Bool? = nil,
      ct : Bool? = nil,
      dbm : Bool? = nil,
      pl : UInt8? = nil,
      pincos : Bool? = nil,
      msize : UInt8? = nil,
      psize : UInt8? = nil,
      minc : Bool? = nil,
      pinc : Bool? = nil,
      circ : Bool? = nil,
      dir : UInt8? = nil,
      pfctrl : Bool? = nil,
      tcie : Bool? = nil,
      htie : Bool? = nil,
      teie : Bool? = nil,
      dmeie : Bool? = nil,
      en : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        chsel: chsel,
        mburst: mburst,
        pburst: pburst,
        ack: ack,
        ct: ct,
        dbm: dbm,
        pl: pl,
        pincos: pincos,
        msize: msize,
        psize: psize,
        minc: minc,
        pinc: pinc,
        circ: circ,
        dir: dir,
        pfctrl: pfctrl,
        tcie: tcie,
        htie: htie,
        teie: teie,
        dmeie: dmeie,
        en: en,
      )
    end
  end # struct

  # stream x number of data          register
  struct S7NDTR
    ADDRESS = BASE_ADDRESS + 0xbc_u64

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

    # Number of data items to              transfer
    def ndt : UInt16
      UInt16.new!((@value >> 0) & 0xffff_u32)
    end

    # Number of data items to              transfer
    def self.ndt : UInt16
      value.ndt
    end

    # Number of data items to              transfer
    def self.ndt=(value : UInt16) : UInt16
      self.set(ndt: value)
      value
    end

    def copy_with(
      *,

      ndt : UInt16? = nil
    ) : self
      value = @value

      unless ndt.nil?
        value = (value & 0xffff0000_u32) |
                UInt32.new!(ndt.to_int).&(0xffff_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      ndt : UInt16? = nil
    ) : Nil
      self.value = self.value.copy_with(
        ndt: ndt,
      )
    end
  end # struct

  # stream x peripheral address          register
  struct S7PAR
    ADDRESS = BASE_ADDRESS + 0xc0_u64

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

    # Peripheral address
    def pa : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # Peripheral address
    def self.pa : UInt32
      value.pa
    end

    # Peripheral address
    def self.pa=(value : UInt32) : UInt32
      self.set(pa: value)
      value
    end

    def copy_with(
      *,

      pa : UInt32? = nil
    ) : self
      value = @value

      unless pa.nil?
        value = (value & 0xffffffff_u32) |
                UInt32.new!(pa.to_int).&(0x0_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      pa : UInt32? = nil
    ) : Nil
      self.value = self.value.copy_with(
        pa: pa,
      )
    end
  end # struct

  # stream x memory 0 address          register
  struct S7M0AR
    ADDRESS = BASE_ADDRESS + 0xc4_u64

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

    # Memory 0 address
    def m0_a : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # Memory 0 address
    def self.m0_a : UInt32
      value.m0_a
    end

    # Memory 0 address
    def self.m0_a=(value : UInt32) : UInt32
      self.set(m0_a: value)
      value
    end

    def copy_with(
      *,

      m0_a : UInt32? = nil
    ) : self
      value = @value

      unless m0_a.nil?
        value = (value & 0xffffffff_u32) |
                UInt32.new!(m0_a.to_int).&(0x0_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      m0_a : UInt32? = nil
    ) : Nil
      self.value = self.value.copy_with(
        m0_a: m0_a,
      )
    end
  end # struct

  # stream x memory 1 address          register
  struct S7M1AR
    ADDRESS = BASE_ADDRESS + 0xc8_u64

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

    # Memory 1 address (used in case of Double              buffer mode)
    def m1_a : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # Memory 1 address (used in case of Double              buffer mode)
    def self.m1_a : UInt32
      value.m1_a
    end

    # Memory 1 address (used in case of Double              buffer mode)
    def self.m1_a=(value : UInt32) : UInt32
      self.set(m1_a: value)
      value
    end

    def copy_with(
      *,

      m1_a : UInt32? = nil
    ) : self
      value = @value

      unless m1_a.nil?
        value = (value & 0xffffffff_u32) |
                UInt32.new!(m1_a.to_int).&(0x0_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      m1_a : UInt32? = nil
    ) : Nil
      self.value = self.value.copy_with(
        m1_a: m1_a,
      )
    end
  end # struct

  # stream x FIFO control register
  struct S7FCR
    ADDRESS = BASE_ADDRESS + 0xcc_u64

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
      new(0x21_u64)
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

    # FIFO error interrupt              enable
    def feie : Bool
      @value.bits_set?(0x80_u32)
    end

    # FIFO error interrupt              enable
    def self.feie : Bool
      value.feie
    end

    # FIFO error interrupt              enable
    def self.feie=(value : Bool) : Bool
      self.set(feie: value)
      value
    end

    # FIFO status
    def fs : UInt8
      UInt8.new!((@value >> 3) & 0x7_u32)
    end

    # FIFO status
    def self.fs : UInt8
      value.fs
    end

    # Direct mode disable
    def dmdis : Bool
      @value.bits_set?(0x4_u32)
    end

    # Direct mode disable
    def self.dmdis : Bool
      value.dmdis
    end

    # Direct mode disable
    def self.dmdis=(value : Bool) : Bool
      self.set(dmdis: value)
      value
    end

    # FIFO threshold selection
    def fth : UInt8
      UInt8.new!((@value >> 0) & 0x3_u32)
    end

    # FIFO threshold selection
    def self.fth : UInt8
      value.fth
    end

    # FIFO threshold selection
    def self.fth=(value : UInt8) : UInt8
      self.set(fth: value)
      value
    end

    def copy_with(
      *,

      feie : Bool? = nil,

      dmdis : Bool? = nil,

      fth : UInt8? = nil
    ) : self
      value = @value

      unless feie.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(feie.to_int).&(0x1_u32) << 7
      end

      unless dmdis.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(dmdis.to_int).&(0x1_u32) << 2
      end

      unless fth.nil?
        value = (value & 0xfffffffc_u32) |
                UInt32.new!(fth.to_int).&(0x3_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      feie : Bool? = nil,
      dmdis : Bool? = nil,
      fth : UInt8? = nil
    ) : Nil
      self.value = self.value.copy_with(
        feie: feie,
        dmdis: dmdis,
        fth: fth,
      )
    end
  end # struct

end
