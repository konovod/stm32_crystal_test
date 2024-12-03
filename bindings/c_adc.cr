# Common ADC registers
module C_ADC
  VERSION      = nil
  BASE_ADDRESS = 0x40012300_u64

  # ADC Common status register
  struct CSR
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

    # Overrun flag of ADC3
    def ovr3 : Bool
      @value.bits_set?(0x200000_u32)
    end

    # Overrun flag of ADC3
    def self.ovr3 : Bool
      value.ovr3
    end

    # Regular channel Start flag of ADC              3
    def strt3 : Bool
      @value.bits_set?(0x100000_u32)
    end

    # Regular channel Start flag of ADC              3
    def self.strt3 : Bool
      value.strt3
    end

    # Injected channel Start flag of ADC              3
    def jstrt3 : Bool
      @value.bits_set?(0x80000_u32)
    end

    # Injected channel Start flag of ADC              3
    def self.jstrt3 : Bool
      value.jstrt3
    end

    # Injected channel end of conversion of              ADC 3
    def jeoc3 : Bool
      @value.bits_set?(0x40000_u32)
    end

    # Injected channel end of conversion of              ADC 3
    def self.jeoc3 : Bool
      value.jeoc3
    end

    # End of conversion of ADC 3
    def eoc3 : Bool
      @value.bits_set?(0x20000_u32)
    end

    # End of conversion of ADC 3
    def self.eoc3 : Bool
      value.eoc3
    end

    # Analog watchdog flag of ADC              3
    def awd3 : Bool
      @value.bits_set?(0x10000_u32)
    end

    # Analog watchdog flag of ADC              3
    def self.awd3 : Bool
      value.awd3
    end

    # Overrun flag of ADC 2
    def ovr2 : Bool
      @value.bits_set?(0x2000_u32)
    end

    # Overrun flag of ADC 2
    def self.ovr2 : Bool
      value.ovr2
    end

    # Regular channel Start flag of ADC              2
    def strt2 : Bool
      @value.bits_set?(0x1000_u32)
    end

    # Regular channel Start flag of ADC              2
    def self.strt2 : Bool
      value.strt2
    end

    # Injected channel Start flag of ADC              2
    def jstrt2 : Bool
      @value.bits_set?(0x800_u32)
    end

    # Injected channel Start flag of ADC              2
    def self.jstrt2 : Bool
      value.jstrt2
    end

    # Injected channel end of conversion of              ADC 2
    def jeoc2 : Bool
      @value.bits_set?(0x400_u32)
    end

    # Injected channel end of conversion of              ADC 2
    def self.jeoc2 : Bool
      value.jeoc2
    end

    # End of conversion of ADC 2
    def eoc2 : Bool
      @value.bits_set?(0x200_u32)
    end

    # End of conversion of ADC 2
    def self.eoc2 : Bool
      value.eoc2
    end

    # Analog watchdog flag of ADC              2
    def awd2 : Bool
      @value.bits_set?(0x100_u32)
    end

    # Analog watchdog flag of ADC              2
    def self.awd2 : Bool
      value.awd2
    end

    # Overrun flag of ADC 1
    def ovr1 : Bool
      @value.bits_set?(0x20_u32)
    end

    # Overrun flag of ADC 1
    def self.ovr1 : Bool
      value.ovr1
    end

    # Regular channel Start flag of ADC              1
    def strt1 : Bool
      @value.bits_set?(0x10_u32)
    end

    # Regular channel Start flag of ADC              1
    def self.strt1 : Bool
      value.strt1
    end

    # Injected channel Start flag of ADC              1
    def jstrt1 : Bool
      @value.bits_set?(0x8_u32)
    end

    # Injected channel Start flag of ADC              1
    def self.jstrt1 : Bool
      value.jstrt1
    end

    # Injected channel end of conversion of              ADC 1
    def jeoc1 : Bool
      @value.bits_set?(0x4_u32)
    end

    # Injected channel end of conversion of              ADC 1
    def self.jeoc1 : Bool
      value.jeoc1
    end

    # End of conversion of ADC 1
    def eoc1 : Bool
      @value.bits_set?(0x2_u32)
    end

    # End of conversion of ADC 1
    def self.eoc1 : Bool
      value.eoc1
    end

    # Analog watchdog flag of ADC              1
    def awd1 : Bool
      @value.bits_set?(0x1_u32)
    end

    # Analog watchdog flag of ADC              1
    def self.awd1 : Bool
      value.awd1
    end
  end # struct

  # ADC common control register
  struct CCR
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

    # Temperature sensor and VREFINT              enable
    def tsvrefe : Bool
      @value.bits_set?(0x800000_u32)
    end

    # Temperature sensor and VREFINT              enable
    def self.tsvrefe : Bool
      value.tsvrefe
    end

    # Temperature sensor and VREFINT              enable
    def self.tsvrefe=(value : Bool) : Bool
      self.set(tsvrefe: value)
      value
    end

    # VBAT enable
    def vbate : Bool
      @value.bits_set?(0x400000_u32)
    end

    # VBAT enable
    def self.vbate : Bool
      value.vbate
    end

    # VBAT enable
    def self.vbate=(value : Bool) : Bool
      self.set(vbate: value)
      value
    end

    # ADC prescaler
    def adcpre : UInt8
      UInt8.new!((@value >> 16) & 0x3_u32)
    end

    # ADC prescaler
    def self.adcpre : UInt8
      value.adcpre
    end

    # ADC prescaler
    def self.adcpre=(value : UInt8) : UInt8
      self.set(adcpre: value)
      value
    end

    # Direct memory access mode for multi ADC              mode
    def dma : UInt8
      UInt8.new!((@value >> 14) & 0x3_u32)
    end

    # Direct memory access mode for multi ADC              mode
    def self.dma : UInt8
      value.dma
    end

    # Direct memory access mode for multi ADC              mode
    def self.dma=(value : UInt8) : UInt8
      self.set(dma: value)
      value
    end

    # DMA disable selection for multi-ADC              mode
    def dds : Bool
      @value.bits_set?(0x2000_u32)
    end

    # DMA disable selection for multi-ADC              mode
    def self.dds : Bool
      value.dds
    end

    # DMA disable selection for multi-ADC              mode
    def self.dds=(value : Bool) : Bool
      self.set(dds: value)
      value
    end

    # Delay between 2 sampling              phases
    def delay : UInt8
      UInt8.new!((@value >> 8) & 0xf_u32)
    end

    # Delay between 2 sampling              phases
    def self.delay : UInt8
      value.delay
    end

    # Delay between 2 sampling              phases
    def self.delay=(value : UInt8) : UInt8
      self.set(delay: value)
      value
    end

    # Multi ADC mode selection
    def mult : UInt8
      UInt8.new!((@value >> 0) & 0x1f_u32)
    end

    # Multi ADC mode selection
    def self.mult : UInt8
      value.mult
    end

    # Multi ADC mode selection
    def self.mult=(value : UInt8) : UInt8
      self.set(mult: value)
      value
    end

    def copy_with(
      *,

      tsvrefe : Bool? = nil,

      vbate : Bool? = nil,

      adcpre : UInt8? = nil,

      dma : UInt8? = nil,

      dds : Bool? = nil,

      delay : UInt8? = nil,

      mult : UInt8? = nil
    ) : self
      value = @value

      unless tsvrefe.nil?
        value = (value & 0xff7fffff_u32) |
                UInt32.new!(tsvrefe.to_int).&(0x1_u32) << 23
      end

      unless vbate.nil?
        value = (value & 0xffbfffff_u32) |
                UInt32.new!(vbate.to_int).&(0x1_u32) << 22
      end

      unless adcpre.nil?
        value = (value & 0xfffcffff_u32) |
                UInt32.new!(adcpre.to_int).&(0x3_u32) << 16
      end

      unless dma.nil?
        value = (value & 0xffff3fff_u32) |
                UInt32.new!(dma.to_int).&(0x3_u32) << 14
      end

      unless dds.nil?
        value = (value & 0xffffdfff_u32) |
                UInt32.new!(dds.to_int).&(0x1_u32) << 13
      end

      unless delay.nil?
        value = (value & 0xfffff0ff_u32) |
                UInt32.new!(delay.to_int).&(0xf_u32) << 8
      end

      unless mult.nil?
        value = (value & 0xffffffe0_u32) |
                UInt32.new!(mult.to_int).&(0x1f_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      tsvrefe : Bool? = nil,
      vbate : Bool? = nil,
      adcpre : UInt8? = nil,
      dma : UInt8? = nil,
      dds : Bool? = nil,
      delay : UInt8? = nil,
      mult : UInt8? = nil
    ) : Nil
      self.value = self.value.copy_with(
        tsvrefe: tsvrefe,
        vbate: vbate,
        adcpre: adcpre,
        dma: dma,
        dds: dds,
        delay: delay,
        mult: mult,
      )
    end
  end # struct

  # ADC common regular data register for dual          and triple modes
  struct CDR
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

    # 2nd data item of a pair of regular              conversions
    def data2 : UInt16
      UInt16.new!((@value >> 16) & 0xffff_u32)
    end

    # 2nd data item of a pair of regular              conversions
    def self.data2 : UInt16
      value.data2
    end

    # 1st data item of a pair of regular              conversions
    def data1 : UInt16
      UInt16.new!((@value >> 0) & 0xffff_u32)
    end

    # 1st data item of a pair of regular              conversions
    def self.data1 : UInt16
      value.data1
    end
  end # struct

end
