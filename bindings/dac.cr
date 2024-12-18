# Digital-to-analog converter
module DAC
  VERSION      = nil
  BASE_ADDRESS = 0x40007400_u64

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

    # DAC channel2 DMA underrun interrupt              enable
    def dmaudrie2 : Bool
      @value.bits_set?(0x20000000_u32)
    end

    # DAC channel2 DMA underrun interrupt              enable
    def self.dmaudrie2 : Bool
      value.dmaudrie2
    end

    # DAC channel2 DMA underrun interrupt              enable
    def self.dmaudrie2=(value : Bool) : Bool
      self.set(dmaudrie2: value)
      value
    end

    # DAC channel2 DMA enable
    def dmaen2 : Bool
      @value.bits_set?(0x10000000_u32)
    end

    # DAC channel2 DMA enable
    def self.dmaen2 : Bool
      value.dmaen2
    end

    # DAC channel2 DMA enable
    def self.dmaen2=(value : Bool) : Bool
      self.set(dmaen2: value)
      value
    end

    # DAC channel2 mask/amplitude              selector
    def mamp2 : UInt8
      UInt8.new!((@value >> 24) & 0xf_u32)
    end

    # DAC channel2 mask/amplitude              selector
    def self.mamp2 : UInt8
      value.mamp2
    end

    # DAC channel2 mask/amplitude              selector
    def self.mamp2=(value : UInt8) : UInt8
      self.set(mamp2: value)
      value
    end

    # DAC channel2 noise/triangle wave              generation enable
    def wave2 : UInt8
      UInt8.new!((@value >> 22) & 0x3_u32)
    end

    # DAC channel2 noise/triangle wave              generation enable
    def self.wave2 : UInt8
      value.wave2
    end

    # DAC channel2 noise/triangle wave              generation enable
    def self.wave2=(value : UInt8) : UInt8
      self.set(wave2: value)
      value
    end

    # DAC channel2 trigger              selection
    def tsel2 : UInt8
      UInt8.new!((@value >> 19) & 0x7_u32)
    end

    # DAC channel2 trigger              selection
    def self.tsel2 : UInt8
      value.tsel2
    end

    # DAC channel2 trigger              selection
    def self.tsel2=(value : UInt8) : UInt8
      self.set(tsel2: value)
      value
    end

    # DAC channel2 trigger              enable
    def ten2 : Bool
      @value.bits_set?(0x40000_u32)
    end

    # DAC channel2 trigger              enable
    def self.ten2 : Bool
      value.ten2
    end

    # DAC channel2 trigger              enable
    def self.ten2=(value : Bool) : Bool
      self.set(ten2: value)
      value
    end

    # DAC channel2 output buffer              disable
    def boff2 : Bool
      @value.bits_set?(0x20000_u32)
    end

    # DAC channel2 output buffer              disable
    def self.boff2 : Bool
      value.boff2
    end

    # DAC channel2 output buffer              disable
    def self.boff2=(value : Bool) : Bool
      self.set(boff2: value)
      value
    end

    # DAC channel2 enable
    def en2 : Bool
      @value.bits_set?(0x10000_u32)
    end

    # DAC channel2 enable
    def self.en2 : Bool
      value.en2
    end

    # DAC channel2 enable
    def self.en2=(value : Bool) : Bool
      self.set(en2: value)
      value
    end

    # DAC channel1 DMA Underrun Interrupt              enable
    def dmaudrie1 : Bool
      @value.bits_set?(0x2000_u32)
    end

    # DAC channel1 DMA Underrun Interrupt              enable
    def self.dmaudrie1 : Bool
      value.dmaudrie1
    end

    # DAC channel1 DMA Underrun Interrupt              enable
    def self.dmaudrie1=(value : Bool) : Bool
      self.set(dmaudrie1: value)
      value
    end

    # DAC channel1 DMA enable
    def dmaen1 : Bool
      @value.bits_set?(0x1000_u32)
    end

    # DAC channel1 DMA enable
    def self.dmaen1 : Bool
      value.dmaen1
    end

    # DAC channel1 DMA enable
    def self.dmaen1=(value : Bool) : Bool
      self.set(dmaen1: value)
      value
    end

    # DAC channel1 mask/amplitude              selector
    def mamp1 : UInt8
      UInt8.new!((@value >> 8) & 0xf_u32)
    end

    # DAC channel1 mask/amplitude              selector
    def self.mamp1 : UInt8
      value.mamp1
    end

    # DAC channel1 mask/amplitude              selector
    def self.mamp1=(value : UInt8) : UInt8
      self.set(mamp1: value)
      value
    end

    # DAC channel1 noise/triangle wave              generation enable
    def wave1 : UInt8
      UInt8.new!((@value >> 6) & 0x3_u32)
    end

    # DAC channel1 noise/triangle wave              generation enable
    def self.wave1 : UInt8
      value.wave1
    end

    # DAC channel1 noise/triangle wave              generation enable
    def self.wave1=(value : UInt8) : UInt8
      self.set(wave1: value)
      value
    end

    # DAC channel1 trigger              selection
    def tsel1 : UInt8
      UInt8.new!((@value >> 3) & 0x7_u32)
    end

    # DAC channel1 trigger              selection
    def self.tsel1 : UInt8
      value.tsel1
    end

    # DAC channel1 trigger              selection
    def self.tsel1=(value : UInt8) : UInt8
      self.set(tsel1: value)
      value
    end

    # DAC channel1 trigger              enable
    def ten1 : Bool
      @value.bits_set?(0x4_u32)
    end

    # DAC channel1 trigger              enable
    def self.ten1 : Bool
      value.ten1
    end

    # DAC channel1 trigger              enable
    def self.ten1=(value : Bool) : Bool
      self.set(ten1: value)
      value
    end

    # DAC channel1 output buffer              disable
    def boff1 : Bool
      @value.bits_set?(0x2_u32)
    end

    # DAC channel1 output buffer              disable
    def self.boff1 : Bool
      value.boff1
    end

    # DAC channel1 output buffer              disable
    def self.boff1=(value : Bool) : Bool
      self.set(boff1: value)
      value
    end

    # DAC channel1 enable
    def en1 : Bool
      @value.bits_set?(0x1_u32)
    end

    # DAC channel1 enable
    def self.en1 : Bool
      value.en1
    end

    # DAC channel1 enable
    def self.en1=(value : Bool) : Bool
      self.set(en1: value)
      value
    end

    def copy_with(
      *,

      dmaudrie2 : Bool? = nil,

      dmaen2 : Bool? = nil,

      mamp2 : UInt8? = nil,

      wave2 : UInt8? = nil,

      tsel2 : UInt8? = nil,

      ten2 : Bool? = nil,

      boff2 : Bool? = nil,

      en2 : Bool? = nil,

      dmaudrie1 : Bool? = nil,

      dmaen1 : Bool? = nil,

      mamp1 : UInt8? = nil,

      wave1 : UInt8? = nil,

      tsel1 : UInt8? = nil,

      ten1 : Bool? = nil,

      boff1 : Bool? = nil,

      en1 : Bool? = nil
    ) : self
      value = @value

      unless dmaudrie2.nil?
        value = (value & 0xdfffffff_u32) |
                UInt32.new!(dmaudrie2.to_int).&(0x1_u32) << 29
      end

      unless dmaen2.nil?
        value = (value & 0xefffffff_u32) |
                UInt32.new!(dmaen2.to_int).&(0x1_u32) << 28
      end

      unless mamp2.nil?
        value = (value & 0xf0ffffff_u32) |
                UInt32.new!(mamp2.to_int).&(0xf_u32) << 24
      end

      unless wave2.nil?
        value = (value & 0xff3fffff_u32) |
                UInt32.new!(wave2.to_int).&(0x3_u32) << 22
      end

      unless tsel2.nil?
        value = (value & 0xffc7ffff_u32) |
                UInt32.new!(tsel2.to_int).&(0x7_u32) << 19
      end

      unless ten2.nil?
        value = (value & 0xfffbffff_u32) |
                UInt32.new!(ten2.to_int).&(0x1_u32) << 18
      end

      unless boff2.nil?
        value = (value & 0xfffdffff_u32) |
                UInt32.new!(boff2.to_int).&(0x1_u32) << 17
      end

      unless en2.nil?
        value = (value & 0xfffeffff_u32) |
                UInt32.new!(en2.to_int).&(0x1_u32) << 16
      end

      unless dmaudrie1.nil?
        value = (value & 0xffffdfff_u32) |
                UInt32.new!(dmaudrie1.to_int).&(0x1_u32) << 13
      end

      unless dmaen1.nil?
        value = (value & 0xffffefff_u32) |
                UInt32.new!(dmaen1.to_int).&(0x1_u32) << 12
      end

      unless mamp1.nil?
        value = (value & 0xfffff0ff_u32) |
                UInt32.new!(mamp1.to_int).&(0xf_u32) << 8
      end

      unless wave1.nil?
        value = (value & 0xffffff3f_u32) |
                UInt32.new!(wave1.to_int).&(0x3_u32) << 6
      end

      unless tsel1.nil?
        value = (value & 0xffffffc7_u32) |
                UInt32.new!(tsel1.to_int).&(0x7_u32) << 3
      end

      unless ten1.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(ten1.to_int).&(0x1_u32) << 2
      end

      unless boff1.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(boff1.to_int).&(0x1_u32) << 1
      end

      unless en1.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(en1.to_int).&(0x1_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      dmaudrie2 : Bool? = nil,
      dmaen2 : Bool? = nil,
      mamp2 : UInt8? = nil,
      wave2 : UInt8? = nil,
      tsel2 : UInt8? = nil,
      ten2 : Bool? = nil,
      boff2 : Bool? = nil,
      en2 : Bool? = nil,
      dmaudrie1 : Bool? = nil,
      dmaen1 : Bool? = nil,
      mamp1 : UInt8? = nil,
      wave1 : UInt8? = nil,
      tsel1 : UInt8? = nil,
      ten1 : Bool? = nil,
      boff1 : Bool? = nil,
      en1 : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        dmaudrie2: dmaudrie2,
        dmaen2: dmaen2,
        mamp2: mamp2,
        wave2: wave2,
        tsel2: tsel2,
        ten2: ten2,
        boff2: boff2,
        en2: en2,
        dmaudrie1: dmaudrie1,
        dmaen1: dmaen1,
        mamp1: mamp1,
        wave1: wave1,
        tsel1: tsel1,
        ten1: ten1,
        boff1: boff1,
        en1: en1,
      )
    end
  end # struct

  # software trigger register
  struct SWTRIGR
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

    # DAC channel2 software              trigger
    def self.swtrig2=(value : Bool) : Bool
      self.set(swtrig2: value)
      value
    end

    # DAC channel1 software              trigger
    def self.swtrig1=(value : Bool) : Bool
      self.set(swtrig1: value)
      value
    end

    def copy_with(
      *,

      swtrig2 : Bool? = nil,

      swtrig1 : Bool? = nil
    ) : self
      value = @value

      unless swtrig2.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(swtrig2.to_int).&(0x1_u32) << 1
      end

      unless swtrig1.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(swtrig1.to_int).&(0x1_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      swtrig2 : Bool? = nil,
      swtrig1 : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        swtrig2: swtrig2,
        swtrig1: swtrig1,
      )
    end
  end # struct

  # channel1 12-bit right-aligned data holding          register
  struct DHR12R1
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

    # DAC channel1 12-bit right-aligned              data
    def c1_dhr : UInt16
      UInt16.new!((@value >> 0) & 0xfff_u32)
    end

    # DAC channel1 12-bit right-aligned              data
    def self.c1_dhr : UInt16
      value.c1_dhr
    end

    # DAC channel1 12-bit right-aligned              data
    def self.c1_dhr=(value : UInt16) : UInt16
      self.set(c1_dhr: value)
      value
    end

    def copy_with(
      *,

      c1_dhr : UInt16? = nil
    ) : self
      value = @value

      unless c1_dhr.nil?
        value = (value & 0xfffff000_u32) |
                UInt32.new!(c1_dhr.to_int).&(0xfff_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      c1_dhr : UInt16? = nil
    ) : Nil
      self.value = self.value.copy_with(
        c1_dhr: c1_dhr,
      )
    end
  end # struct

  # channel1 12-bit left aligned data holding          register
  struct DHR12L1
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

    # DAC channel1 12-bit left-aligned              data
    def c1_dhr : UInt16
      UInt16.new!((@value >> 4) & 0xfff_u32)
    end

    # DAC channel1 12-bit left-aligned              data
    def self.c1_dhr : UInt16
      value.c1_dhr
    end

    # DAC channel1 12-bit left-aligned              data
    def self.c1_dhr=(value : UInt16) : UInt16
      self.set(c1_dhr: value)
      value
    end

    def copy_with(
      *,

      c1_dhr : UInt16? = nil
    ) : self
      value = @value

      unless c1_dhr.nil?
        value = (value & 0xffff000f_u32) |
                UInt32.new!(c1_dhr.to_int).&(0xfff_u32) << 4
      end

      self.class.new(value)
    end

    def self.set(
      *,
      c1_dhr : UInt16? = nil
    ) : Nil
      self.value = self.value.copy_with(
        c1_dhr: c1_dhr,
      )
    end
  end # struct

  # channel1 8-bit right aligned data holding          register
  struct DHR8R1
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

    # DAC channel1 8-bit right-aligned              data
    def c1_dhr : UInt8
      UInt8.new!((@value >> 0) & 0xff_u32)
    end

    # DAC channel1 8-bit right-aligned              data
    def self.c1_dhr : UInt8
      value.c1_dhr
    end

    # DAC channel1 8-bit right-aligned              data
    def self.c1_dhr=(value : UInt8) : UInt8
      self.set(c1_dhr: value)
      value
    end

    def copy_with(
      *,

      c1_dhr : UInt8? = nil
    ) : self
      value = @value

      unless c1_dhr.nil?
        value = (value & 0xffffff00_u32) |
                UInt32.new!(c1_dhr.to_int).&(0xff_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      c1_dhr : UInt8? = nil
    ) : Nil
      self.value = self.value.copy_with(
        c1_dhr: c1_dhr,
      )
    end
  end # struct

  # channel2 12-bit right aligned data holding          register
  struct DHR12R2
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

    # DAC channel2 12-bit right-aligned              data
    def c2_dhr : UInt16
      UInt16.new!((@value >> 0) & 0xfff_u32)
    end

    # DAC channel2 12-bit right-aligned              data
    def self.c2_dhr : UInt16
      value.c2_dhr
    end

    # DAC channel2 12-bit right-aligned              data
    def self.c2_dhr=(value : UInt16) : UInt16
      self.set(c2_dhr: value)
      value
    end

    def copy_with(
      *,

      c2_dhr : UInt16? = nil
    ) : self
      value = @value

      unless c2_dhr.nil?
        value = (value & 0xfffff000_u32) |
                UInt32.new!(c2_dhr.to_int).&(0xfff_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      c2_dhr : UInt16? = nil
    ) : Nil
      self.value = self.value.copy_with(
        c2_dhr: c2_dhr,
      )
    end
  end # struct

  # channel2 12-bit left aligned data holding          register
  struct DHR12L2
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

    # DAC channel2 12-bit left-aligned              data
    def c2_dhr : UInt16
      UInt16.new!((@value >> 4) & 0xfff_u32)
    end

    # DAC channel2 12-bit left-aligned              data
    def self.c2_dhr : UInt16
      value.c2_dhr
    end

    # DAC channel2 12-bit left-aligned              data
    def self.c2_dhr=(value : UInt16) : UInt16
      self.set(c2_dhr: value)
      value
    end

    def copy_with(
      *,

      c2_dhr : UInt16? = nil
    ) : self
      value = @value

      unless c2_dhr.nil?
        value = (value & 0xffff000f_u32) |
                UInt32.new!(c2_dhr.to_int).&(0xfff_u32) << 4
      end

      self.class.new(value)
    end

    def self.set(
      *,
      c2_dhr : UInt16? = nil
    ) : Nil
      self.value = self.value.copy_with(
        c2_dhr: c2_dhr,
      )
    end
  end # struct

  # channel2 8-bit right-aligned data holding          register
  struct DHR8R2
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

    # DAC channel2 8-bit right-aligned              data
    def c2_dhr : UInt8
      UInt8.new!((@value >> 0) & 0xff_u32)
    end

    # DAC channel2 8-bit right-aligned              data
    def self.c2_dhr : UInt8
      value.c2_dhr
    end

    # DAC channel2 8-bit right-aligned              data
    def self.c2_dhr=(value : UInt8) : UInt8
      self.set(c2_dhr: value)
      value
    end

    def copy_with(
      *,

      c2_dhr : UInt8? = nil
    ) : self
      value = @value

      unless c2_dhr.nil?
        value = (value & 0xffffff00_u32) |
                UInt32.new!(c2_dhr.to_int).&(0xff_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      c2_dhr : UInt8? = nil
    ) : Nil
      self.value = self.value.copy_with(
        c2_dhr: c2_dhr,
      )
    end
  end # struct

  # Dual DAC 12-bit right-aligned data holding          register
  struct DHR12RD
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

    # DAC channel2 12-bit right-aligned              data
    def c2_dhr : UInt16
      UInt16.new!((@value >> 16) & 0xfff_u32)
    end

    # DAC channel2 12-bit right-aligned              data
    def self.c2_dhr : UInt16
      value.c2_dhr
    end

    # DAC channel2 12-bit right-aligned              data
    def self.c2_dhr=(value : UInt16) : UInt16
      self.set(c2_dhr: value)
      value
    end

    # DAC channel1 12-bit right-aligned              data
    def c1_dhr : UInt16
      UInt16.new!((@value >> 0) & 0xfff_u32)
    end

    # DAC channel1 12-bit right-aligned              data
    def self.c1_dhr : UInt16
      value.c1_dhr
    end

    # DAC channel1 12-bit right-aligned              data
    def self.c1_dhr=(value : UInt16) : UInt16
      self.set(c1_dhr: value)
      value
    end

    def copy_with(
      *,

      c2_dhr : UInt16? = nil,

      c1_dhr : UInt16? = nil
    ) : self
      value = @value

      unless c2_dhr.nil?
        value = (value & 0xf000ffff_u32) |
                UInt32.new!(c2_dhr.to_int).&(0xfff_u32) << 16
      end

      unless c1_dhr.nil?
        value = (value & 0xfffff000_u32) |
                UInt32.new!(c1_dhr.to_int).&(0xfff_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      c2_dhr : UInt16? = nil,
      c1_dhr : UInt16? = nil
    ) : Nil
      self.value = self.value.copy_with(
        c2_dhr: c2_dhr,
        c1_dhr: c1_dhr,
      )
    end
  end # struct

  # DUAL DAC 12-bit left aligned data holding          register
  struct DHR12LD
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

    # DAC channel2 12-bit left-aligned              data
    def c2_dhr : UInt16
      UInt16.new!((@value >> 20) & 0xfff_u32)
    end

    # DAC channel2 12-bit left-aligned              data
    def self.c2_dhr : UInt16
      value.c2_dhr
    end

    # DAC channel2 12-bit left-aligned              data
    def self.c2_dhr=(value : UInt16) : UInt16
      self.set(c2_dhr: value)
      value
    end

    # DAC channel1 12-bit left-aligned              data
    def c1_dhr : UInt16
      UInt16.new!((@value >> 4) & 0xfff_u32)
    end

    # DAC channel1 12-bit left-aligned              data
    def self.c1_dhr : UInt16
      value.c1_dhr
    end

    # DAC channel1 12-bit left-aligned              data
    def self.c1_dhr=(value : UInt16) : UInt16
      self.set(c1_dhr: value)
      value
    end

    def copy_with(
      *,

      c2_dhr : UInt16? = nil,

      c1_dhr : UInt16? = nil
    ) : self
      value = @value

      unless c2_dhr.nil?
        value = (value & 0xfffff_u32) |
                UInt32.new!(c2_dhr.to_int).&(0xfff_u32) << 20
      end

      unless c1_dhr.nil?
        value = (value & 0xffff000f_u32) |
                UInt32.new!(c1_dhr.to_int).&(0xfff_u32) << 4
      end

      self.class.new(value)
    end

    def self.set(
      *,
      c2_dhr : UInt16? = nil,
      c1_dhr : UInt16? = nil
    ) : Nil
      self.value = self.value.copy_with(
        c2_dhr: c2_dhr,
        c1_dhr: c1_dhr,
      )
    end
  end # struct

  # DUAL DAC 8-bit right aligned data holding          register
  struct DHR8RD
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

    # DAC channel2 8-bit right-aligned              data
    def c2_dhr : UInt8
      UInt8.new!((@value >> 8) & 0xff_u32)
    end

    # DAC channel2 8-bit right-aligned              data
    def self.c2_dhr : UInt8
      value.c2_dhr
    end

    # DAC channel2 8-bit right-aligned              data
    def self.c2_dhr=(value : UInt8) : UInt8
      self.set(c2_dhr: value)
      value
    end

    # DAC channel1 8-bit right-aligned              data
    def c1_dhr : UInt8
      UInt8.new!((@value >> 0) & 0xff_u32)
    end

    # DAC channel1 8-bit right-aligned              data
    def self.c1_dhr : UInt8
      value.c1_dhr
    end

    # DAC channel1 8-bit right-aligned              data
    def self.c1_dhr=(value : UInt8) : UInt8
      self.set(c1_dhr: value)
      value
    end

    def copy_with(
      *,

      c2_dhr : UInt8? = nil,

      c1_dhr : UInt8? = nil
    ) : self
      value = @value

      unless c2_dhr.nil?
        value = (value & 0xffff00ff_u32) |
                UInt32.new!(c2_dhr.to_int).&(0xff_u32) << 8
      end

      unless c1_dhr.nil?
        value = (value & 0xffffff00_u32) |
                UInt32.new!(c1_dhr.to_int).&(0xff_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      c2_dhr : UInt8? = nil,
      c1_dhr : UInt8? = nil
    ) : Nil
      self.value = self.value.copy_with(
        c2_dhr: c2_dhr,
        c1_dhr: c1_dhr,
      )
    end
  end # struct

  # channel1 data output register
  struct DOR1
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

    # DAC channel1 data output
    def c1_dor : UInt16
      UInt16.new!((@value >> 0) & 0xfff_u32)
    end

    # DAC channel1 data output
    def self.c1_dor : UInt16
      value.c1_dor
    end
  end # struct

  # channel2 data output register
  struct DOR2
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

    # DAC channel2 data output
    def c2_dor : UInt16
      UInt16.new!((@value >> 0) & 0xfff_u32)
    end

    # DAC channel2 data output
    def self.c2_dor : UInt16
      value.c2_dor
    end
  end # struct

  # status register
  struct SR
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

    # DAC channel2 DMA underrun              flag
    def dmaudr2 : Bool
      @value.bits_set?(0x20000000_u32)
    end

    # DAC channel2 DMA underrun              flag
    def self.dmaudr2 : Bool
      value.dmaudr2
    end

    # DAC channel2 DMA underrun              flag
    def self.dmaudr2=(value : Bool) : Bool
      self.set(dmaudr2: value)
      value
    end

    # DAC channel1 DMA underrun              flag
    def dmaudr1 : Bool
      @value.bits_set?(0x2000_u32)
    end

    # DAC channel1 DMA underrun              flag
    def self.dmaudr1 : Bool
      value.dmaudr1
    end

    # DAC channel1 DMA underrun              flag
    def self.dmaudr1=(value : Bool) : Bool
      self.set(dmaudr1: value)
      value
    end

    def copy_with(
      *,

      dmaudr2 : Bool? = nil,

      dmaudr1 : Bool? = nil
    ) : self
      value = @value

      unless dmaudr2.nil?
        value = (value & 0xdfffffff_u32) |
                UInt32.new!(dmaudr2.to_int).&(0x1_u32) << 29
      end

      unless dmaudr1.nil?
        value = (value & 0xffffdfff_u32) |
                UInt32.new!(dmaudr1.to_int).&(0x1_u32) << 13
      end

      self.class.new(value)
    end

    def self.set(
      *,
      dmaudr2 : Bool? = nil,
      dmaudr1 : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        dmaudr2: dmaudr2,
        dmaudr1: dmaudr1,
      )
    end
  end # struct

end
