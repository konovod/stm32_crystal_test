# Reset and clock control
module RCC
  VERSION      = nil
  BASE_ADDRESS = 0x40023800_u64

  # clock control register
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
      new(0x83_u64)
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

    # PLLI2S clock ready flag
    def plli2_srdy : Bool
      @value.bits_set?(0x8000000_u32)
    end

    # PLLI2S clock ready flag
    def self.plli2_srdy : Bool
      value.plli2_srdy
    end

    # PLLI2S enable
    def plli2_son : Bool
      @value.bits_set?(0x4000000_u32)
    end

    # PLLI2S enable
    def self.plli2_son : Bool
      value.plli2_son
    end

    # PLLI2S enable
    def self.plli2_son=(value : Bool) : Bool
      self.set(plli2_son: value)
      value
    end

    # Main PLL (PLL) clock ready              flag
    def pllrdy : Bool
      @value.bits_set?(0x2000000_u32)
    end

    # Main PLL (PLL) clock ready              flag
    def self.pllrdy : Bool
      value.pllrdy
    end

    # Main PLL (PLL) enable
    def pllon : Bool
      @value.bits_set?(0x1000000_u32)
    end

    # Main PLL (PLL) enable
    def self.pllon : Bool
      value.pllon
    end

    # Main PLL (PLL) enable
    def self.pllon=(value : Bool) : Bool
      self.set(pllon: value)
      value
    end

    # Clock security system              enable
    def csson : Bool
      @value.bits_set?(0x80000_u32)
    end

    # Clock security system              enable
    def self.csson : Bool
      value.csson
    end

    # Clock security system              enable
    def self.csson=(value : Bool) : Bool
      self.set(csson: value)
      value
    end

    # HSE clock bypass
    def hsebyp : Bool
      @value.bits_set?(0x40000_u32)
    end

    # HSE clock bypass
    def self.hsebyp : Bool
      value.hsebyp
    end

    # HSE clock bypass
    def self.hsebyp=(value : Bool) : Bool
      self.set(hsebyp: value)
      value
    end

    # HSE clock ready flag
    def hserdy : Bool
      @value.bits_set?(0x20000_u32)
    end

    # HSE clock ready flag
    def self.hserdy : Bool
      value.hserdy
    end

    # HSE clock enable
    def hseon : Bool
      @value.bits_set?(0x10000_u32)
    end

    # HSE clock enable
    def self.hseon : Bool
      value.hseon
    end

    # HSE clock enable
    def self.hseon=(value : Bool) : Bool
      self.set(hseon: value)
      value
    end

    # Internal high-speed clock              calibration
    def hsical : UInt8
      UInt8.new!((@value >> 8) & 0xff_u32)
    end

    # Internal high-speed clock              calibration
    def self.hsical : UInt8
      value.hsical
    end

    # Internal high-speed clock              trimming
    def hsitrim : UInt8
      UInt8.new!((@value >> 3) & 0x1f_u32)
    end

    # Internal high-speed clock              trimming
    def self.hsitrim : UInt8
      value.hsitrim
    end

    # Internal high-speed clock              trimming
    def self.hsitrim=(value : UInt8) : UInt8
      self.set(hsitrim: value)
      value
    end

    # Internal high-speed clock ready              flag
    def hsirdy : Bool
      @value.bits_set?(0x2_u32)
    end

    # Internal high-speed clock ready              flag
    def self.hsirdy : Bool
      value.hsirdy
    end

    # Internal high-speed clock              enable
    def hsion : Bool
      @value.bits_set?(0x1_u32)
    end

    # Internal high-speed clock              enable
    def self.hsion : Bool
      value.hsion
    end

    # Internal high-speed clock              enable
    def self.hsion=(value : Bool) : Bool
      self.set(hsion: value)
      value
    end

    def copy_with(
      *,

      plli2_son : Bool? = nil,

      pllon : Bool? = nil,

      csson : Bool? = nil,

      hsebyp : Bool? = nil,

      hseon : Bool? = nil,

      hsitrim : UInt8? = nil,

      hsion : Bool? = nil
    ) : self
      value = @value

      unless plli2_son.nil?
        value = (value & 0xfbffffff_u32) |
                UInt32.new!(plli2_son.to_int).&(0x1_u32) << 26
      end

      unless pllon.nil?
        value = (value & 0xfeffffff_u32) |
                UInt32.new!(pllon.to_int).&(0x1_u32) << 24
      end

      unless csson.nil?
        value = (value & 0xfff7ffff_u32) |
                UInt32.new!(csson.to_int).&(0x1_u32) << 19
      end

      unless hsebyp.nil?
        value = (value & 0xfffbffff_u32) |
                UInt32.new!(hsebyp.to_int).&(0x1_u32) << 18
      end

      unless hseon.nil?
        value = (value & 0xfffeffff_u32) |
                UInt32.new!(hseon.to_int).&(0x1_u32) << 16
      end

      unless hsitrim.nil?
        value = (value & 0xffffff07_u32) |
                UInt32.new!(hsitrim.to_int).&(0x1f_u32) << 3
      end

      unless hsion.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(hsion.to_int).&(0x1_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      plli2_son : Bool? = nil,
      pllon : Bool? = nil,
      csson : Bool? = nil,
      hsebyp : Bool? = nil,
      hseon : Bool? = nil,
      hsitrim : UInt8? = nil,
      hsion : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        plli2_son: plli2_son,
        pllon: pllon,
        csson: csson,
        hsebyp: hsebyp,
        hseon: hseon,
        hsitrim: hsitrim,
        hsion: hsion,
      )
    end
  end # struct

  # PLL configuration register
  struct PLLCFGR
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
      new(0x24003010_u64)
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

    # Main PLL (PLL) division factor for USB              OTG FS, SDIO and random number generator              clocks
    def pllq3 : Bool
      @value.bits_set?(0x8000000_u32)
    end

    # Main PLL (PLL) division factor for USB              OTG FS, SDIO and random number generator              clocks
    def self.pllq3 : Bool
      value.pllq3
    end

    # Main PLL (PLL) division factor for USB              OTG FS, SDIO and random number generator              clocks
    def self.pllq3=(value : Bool) : Bool
      self.set(pllq3: value)
      value
    end

    # Main PLL (PLL) division factor for USB              OTG FS, SDIO and random number generator              clocks
    def pllq2 : Bool
      @value.bits_set?(0x4000000_u32)
    end

    # Main PLL (PLL) division factor for USB              OTG FS, SDIO and random number generator              clocks
    def self.pllq2 : Bool
      value.pllq2
    end

    # Main PLL (PLL) division factor for USB              OTG FS, SDIO and random number generator              clocks
    def self.pllq2=(value : Bool) : Bool
      self.set(pllq2: value)
      value
    end

    # Main PLL (PLL) division factor for USB              OTG FS, SDIO and random number generator              clocks
    def pllq1 : Bool
      @value.bits_set?(0x2000000_u32)
    end

    # Main PLL (PLL) division factor for USB              OTG FS, SDIO and random number generator              clocks
    def self.pllq1 : Bool
      value.pllq1
    end

    # Main PLL (PLL) division factor for USB              OTG FS, SDIO and random number generator              clocks
    def self.pllq1=(value : Bool) : Bool
      self.set(pllq1: value)
      value
    end

    # Main PLL (PLL) division factor for USB              OTG FS, SDIO and random number generator              clocks
    def pllq0 : Bool
      @value.bits_set?(0x1000000_u32)
    end

    # Main PLL (PLL) division factor for USB              OTG FS, SDIO and random number generator              clocks
    def self.pllq0 : Bool
      value.pllq0
    end

    # Main PLL (PLL) division factor for USB              OTG FS, SDIO and random number generator              clocks
    def self.pllq0=(value : Bool) : Bool
      self.set(pllq0: value)
      value
    end

    # Main PLL(PLL) and audio PLL (PLLI2S)              entry clock source
    def pllsrc : Bool
      @value.bits_set?(0x400000_u32)
    end

    # Main PLL(PLL) and audio PLL (PLLI2S)              entry clock source
    def self.pllsrc : Bool
      value.pllsrc
    end

    # Main PLL(PLL) and audio PLL (PLLI2S)              entry clock source
    def self.pllsrc=(value : Bool) : Bool
      self.set(pllsrc: value)
      value
    end

    # Main PLL (PLL) division factor for main              system clock
    def pllp1 : Bool
      @value.bits_set?(0x20000_u32)
    end

    # Main PLL (PLL) division factor for main              system clock
    def self.pllp1 : Bool
      value.pllp1
    end

    # Main PLL (PLL) division factor for main              system clock
    def self.pllp1=(value : Bool) : Bool
      self.set(pllp1: value)
      value
    end

    # Main PLL (PLL) division factor for main              system clock
    def pllp0 : Bool
      @value.bits_set?(0x10000_u32)
    end

    # Main PLL (PLL) division factor for main              system clock
    def self.pllp0 : Bool
      value.pllp0
    end

    # Main PLL (PLL) division factor for main              system clock
    def self.pllp0=(value : Bool) : Bool
      self.set(pllp0: value)
      value
    end

    # Main PLL (PLL) multiplication factor for              VCO
    def plln8 : Bool
      @value.bits_set?(0x4000_u32)
    end

    # Main PLL (PLL) multiplication factor for              VCO
    def self.plln8 : Bool
      value.plln8
    end

    # Main PLL (PLL) multiplication factor for              VCO
    def self.plln8=(value : Bool) : Bool
      self.set(plln8: value)
      value
    end

    # Main PLL (PLL) multiplication factor for              VCO
    def plln7 : Bool
      @value.bits_set?(0x2000_u32)
    end

    # Main PLL (PLL) multiplication factor for              VCO
    def self.plln7 : Bool
      value.plln7
    end

    # Main PLL (PLL) multiplication factor for              VCO
    def self.plln7=(value : Bool) : Bool
      self.set(plln7: value)
      value
    end

    # Main PLL (PLL) multiplication factor for              VCO
    def plln6 : Bool
      @value.bits_set?(0x1000_u32)
    end

    # Main PLL (PLL) multiplication factor for              VCO
    def self.plln6 : Bool
      value.plln6
    end

    # Main PLL (PLL) multiplication factor for              VCO
    def self.plln6=(value : Bool) : Bool
      self.set(plln6: value)
      value
    end

    # Main PLL (PLL) multiplication factor for              VCO
    def plln5 : Bool
      @value.bits_set?(0x800_u32)
    end

    # Main PLL (PLL) multiplication factor for              VCO
    def self.plln5 : Bool
      value.plln5
    end

    # Main PLL (PLL) multiplication factor for              VCO
    def self.plln5=(value : Bool) : Bool
      self.set(plln5: value)
      value
    end

    # Main PLL (PLL) multiplication factor for              VCO
    def plln4 : Bool
      @value.bits_set?(0x400_u32)
    end

    # Main PLL (PLL) multiplication factor for              VCO
    def self.plln4 : Bool
      value.plln4
    end

    # Main PLL (PLL) multiplication factor for              VCO
    def self.plln4=(value : Bool) : Bool
      self.set(plln4: value)
      value
    end

    # Main PLL (PLL) multiplication factor for              VCO
    def plln3 : Bool
      @value.bits_set?(0x200_u32)
    end

    # Main PLL (PLL) multiplication factor for              VCO
    def self.plln3 : Bool
      value.plln3
    end

    # Main PLL (PLL) multiplication factor for              VCO
    def self.plln3=(value : Bool) : Bool
      self.set(plln3: value)
      value
    end

    # Main PLL (PLL) multiplication factor for              VCO
    def plln2 : Bool
      @value.bits_set?(0x100_u32)
    end

    # Main PLL (PLL) multiplication factor for              VCO
    def self.plln2 : Bool
      value.plln2
    end

    # Main PLL (PLL) multiplication factor for              VCO
    def self.plln2=(value : Bool) : Bool
      self.set(plln2: value)
      value
    end

    # Main PLL (PLL) multiplication factor for              VCO
    def plln1 : Bool
      @value.bits_set?(0x80_u32)
    end

    # Main PLL (PLL) multiplication factor for              VCO
    def self.plln1 : Bool
      value.plln1
    end

    # Main PLL (PLL) multiplication factor for              VCO
    def self.plln1=(value : Bool) : Bool
      self.set(plln1: value)
      value
    end

    # Main PLL (PLL) multiplication factor for              VCO
    def plln0 : Bool
      @value.bits_set?(0x40_u32)
    end

    # Main PLL (PLL) multiplication factor for              VCO
    def self.plln0 : Bool
      value.plln0
    end

    # Main PLL (PLL) multiplication factor for              VCO
    def self.plln0=(value : Bool) : Bool
      self.set(plln0: value)
      value
    end

    # Division factor for the main PLL (PLL)              and audio PLL (PLLI2S) input clock
    def pllm5 : Bool
      @value.bits_set?(0x20_u32)
    end

    # Division factor for the main PLL (PLL)              and audio PLL (PLLI2S) input clock
    def self.pllm5 : Bool
      value.pllm5
    end

    # Division factor for the main PLL (PLL)              and audio PLL (PLLI2S) input clock
    def self.pllm5=(value : Bool) : Bool
      self.set(pllm5: value)
      value
    end

    # Division factor for the main PLL (PLL)              and audio PLL (PLLI2S) input clock
    def pllm4 : Bool
      @value.bits_set?(0x10_u32)
    end

    # Division factor for the main PLL (PLL)              and audio PLL (PLLI2S) input clock
    def self.pllm4 : Bool
      value.pllm4
    end

    # Division factor for the main PLL (PLL)              and audio PLL (PLLI2S) input clock
    def self.pllm4=(value : Bool) : Bool
      self.set(pllm4: value)
      value
    end

    # Division factor for the main PLL (PLL)              and audio PLL (PLLI2S) input clock
    def pllm3 : Bool
      @value.bits_set?(0x8_u32)
    end

    # Division factor for the main PLL (PLL)              and audio PLL (PLLI2S) input clock
    def self.pllm3 : Bool
      value.pllm3
    end

    # Division factor for the main PLL (PLL)              and audio PLL (PLLI2S) input clock
    def self.pllm3=(value : Bool) : Bool
      self.set(pllm3: value)
      value
    end

    # Division factor for the main PLL (PLL)              and audio PLL (PLLI2S) input clock
    def pllm2 : Bool
      @value.bits_set?(0x4_u32)
    end

    # Division factor for the main PLL (PLL)              and audio PLL (PLLI2S) input clock
    def self.pllm2 : Bool
      value.pllm2
    end

    # Division factor for the main PLL (PLL)              and audio PLL (PLLI2S) input clock
    def self.pllm2=(value : Bool) : Bool
      self.set(pllm2: value)
      value
    end

    # Division factor for the main PLL (PLL)              and audio PLL (PLLI2S) input clock
    def pllm1 : Bool
      @value.bits_set?(0x2_u32)
    end

    # Division factor for the main PLL (PLL)              and audio PLL (PLLI2S) input clock
    def self.pllm1 : Bool
      value.pllm1
    end

    # Division factor for the main PLL (PLL)              and audio PLL (PLLI2S) input clock
    def self.pllm1=(value : Bool) : Bool
      self.set(pllm1: value)
      value
    end

    # Division factor for the main PLL (PLL)              and audio PLL (PLLI2S) input clock
    def pllm0 : Bool
      @value.bits_set?(0x1_u32)
    end

    # Division factor for the main PLL (PLL)              and audio PLL (PLLI2S) input clock
    def self.pllm0 : Bool
      value.pllm0
    end

    # Division factor for the main PLL (PLL)              and audio PLL (PLLI2S) input clock
    def self.pllm0=(value : Bool) : Bool
      self.set(pllm0: value)
      value
    end

    def copy_with(
      *,

      pllq3 : Bool? = nil,

      pllq2 : Bool? = nil,

      pllq1 : Bool? = nil,

      pllq0 : Bool? = nil,

      pllsrc : Bool? = nil,

      pllp1 : Bool? = nil,

      pllp0 : Bool? = nil,

      plln8 : Bool? = nil,

      plln7 : Bool? = nil,

      plln6 : Bool? = nil,

      plln5 : Bool? = nil,

      plln4 : Bool? = nil,

      plln3 : Bool? = nil,

      plln2 : Bool? = nil,

      plln1 : Bool? = nil,

      plln0 : Bool? = nil,

      pllm5 : Bool? = nil,

      pllm4 : Bool? = nil,

      pllm3 : Bool? = nil,

      pllm2 : Bool? = nil,

      pllm1 : Bool? = nil,

      pllm0 : Bool? = nil
    ) : self
      value = @value

      unless pllq3.nil?
        value = (value & 0xf7ffffff_u32) |
                UInt32.new!(pllq3.to_int).&(0x1_u32) << 27
      end

      unless pllq2.nil?
        value = (value & 0xfbffffff_u32) |
                UInt32.new!(pllq2.to_int).&(0x1_u32) << 26
      end

      unless pllq1.nil?
        value = (value & 0xfdffffff_u32) |
                UInt32.new!(pllq1.to_int).&(0x1_u32) << 25
      end

      unless pllq0.nil?
        value = (value & 0xfeffffff_u32) |
                UInt32.new!(pllq0.to_int).&(0x1_u32) << 24
      end

      unless pllsrc.nil?
        value = (value & 0xffbfffff_u32) |
                UInt32.new!(pllsrc.to_int).&(0x1_u32) << 22
      end

      unless pllp1.nil?
        value = (value & 0xfffdffff_u32) |
                UInt32.new!(pllp1.to_int).&(0x1_u32) << 17
      end

      unless pllp0.nil?
        value = (value & 0xfffeffff_u32) |
                UInt32.new!(pllp0.to_int).&(0x1_u32) << 16
      end

      unless plln8.nil?
        value = (value & 0xffffbfff_u32) |
                UInt32.new!(plln8.to_int).&(0x1_u32) << 14
      end

      unless plln7.nil?
        value = (value & 0xffffdfff_u32) |
                UInt32.new!(plln7.to_int).&(0x1_u32) << 13
      end

      unless plln6.nil?
        value = (value & 0xffffefff_u32) |
                UInt32.new!(plln6.to_int).&(0x1_u32) << 12
      end

      unless plln5.nil?
        value = (value & 0xfffff7ff_u32) |
                UInt32.new!(plln5.to_int).&(0x1_u32) << 11
      end

      unless plln4.nil?
        value = (value & 0xfffffbff_u32) |
                UInt32.new!(plln4.to_int).&(0x1_u32) << 10
      end

      unless plln3.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(plln3.to_int).&(0x1_u32) << 9
      end

      unless plln2.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(plln2.to_int).&(0x1_u32) << 8
      end

      unless plln1.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(plln1.to_int).&(0x1_u32) << 7
      end

      unless plln0.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(plln0.to_int).&(0x1_u32) << 6
      end

      unless pllm5.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(pllm5.to_int).&(0x1_u32) << 5
      end

      unless pllm4.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(pllm4.to_int).&(0x1_u32) << 4
      end

      unless pllm3.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(pllm3.to_int).&(0x1_u32) << 3
      end

      unless pllm2.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(pllm2.to_int).&(0x1_u32) << 2
      end

      unless pllm1.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(pllm1.to_int).&(0x1_u32) << 1
      end

      unless pllm0.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(pllm0.to_int).&(0x1_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      pllq3 : Bool? = nil,
      pllq2 : Bool? = nil,
      pllq1 : Bool? = nil,
      pllq0 : Bool? = nil,
      pllsrc : Bool? = nil,
      pllp1 : Bool? = nil,
      pllp0 : Bool? = nil,
      plln8 : Bool? = nil,
      plln7 : Bool? = nil,
      plln6 : Bool? = nil,
      plln5 : Bool? = nil,
      plln4 : Bool? = nil,
      plln3 : Bool? = nil,
      plln2 : Bool? = nil,
      plln1 : Bool? = nil,
      plln0 : Bool? = nil,
      pllm5 : Bool? = nil,
      pllm4 : Bool? = nil,
      pllm3 : Bool? = nil,
      pllm2 : Bool? = nil,
      pllm1 : Bool? = nil,
      pllm0 : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        pllq3: pllq3,
        pllq2: pllq2,
        pllq1: pllq1,
        pllq0: pllq0,
        pllsrc: pllsrc,
        pllp1: pllp1,
        pllp0: pllp0,
        plln8: plln8,
        plln7: plln7,
        plln6: plln6,
        plln5: plln5,
        plln4: plln4,
        plln3: plln3,
        plln2: plln2,
        plln1: plln1,
        plln0: plln0,
        pllm5: pllm5,
        pllm4: pllm4,
        pllm3: pllm3,
        pllm2: pllm2,
        pllm1: pllm1,
        pllm0: pllm0,
      )
    end
  end # struct

  # clock configuration register
  struct CFGR
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

    # Microcontroller clock output              2
    def mco2 : UInt8
      UInt8.new!((@value >> 30) & 0x3_u32)
    end

    # Microcontroller clock output              2
    def self.mco2 : UInt8
      value.mco2
    end

    # Microcontroller clock output              2
    def self.mco2=(value : UInt8) : UInt8
      self.set(mco2: value)
      value
    end

    # MCO2 prescaler
    def mco2_pre : UInt8
      UInt8.new!((@value >> 27) & 0x7_u32)
    end

    # MCO2 prescaler
    def self.mco2_pre : UInt8
      value.mco2_pre
    end

    # MCO2 prescaler
    def self.mco2_pre=(value : UInt8) : UInt8
      self.set(mco2_pre: value)
      value
    end

    # MCO1 prescaler
    def mco1_pre : UInt8
      UInt8.new!((@value >> 24) & 0x7_u32)
    end

    # MCO1 prescaler
    def self.mco1_pre : UInt8
      value.mco1_pre
    end

    # MCO1 prescaler
    def self.mco1_pre=(value : UInt8) : UInt8
      self.set(mco1_pre: value)
      value
    end

    # I2S clock selection
    def i2_ssrc : Bool
      @value.bits_set?(0x800000_u32)
    end

    # I2S clock selection
    def self.i2_ssrc : Bool
      value.i2_ssrc
    end

    # I2S clock selection
    def self.i2_ssrc=(value : Bool) : Bool
      self.set(i2_ssrc: value)
      value
    end

    # Microcontroller clock output              1
    def mco1 : UInt8
      UInt8.new!((@value >> 21) & 0x3_u32)
    end

    # Microcontroller clock output              1
    def self.mco1 : UInt8
      value.mco1
    end

    # Microcontroller clock output              1
    def self.mco1=(value : UInt8) : UInt8
      self.set(mco1: value)
      value
    end

    # HSE division factor for RTC              clock
    def rtcpre : UInt8
      UInt8.new!((@value >> 16) & 0x1f_u32)
    end

    # HSE division factor for RTC              clock
    def self.rtcpre : UInt8
      value.rtcpre
    end

    # HSE division factor for RTC              clock
    def self.rtcpre=(value : UInt8) : UInt8
      self.set(rtcpre: value)
      value
    end

    # APB high-speed prescaler              (APB2)
    def ppre2 : UInt8
      UInt8.new!((@value >> 13) & 0x7_u32)
    end

    # APB high-speed prescaler              (APB2)
    def self.ppre2 : UInt8
      value.ppre2
    end

    # APB high-speed prescaler              (APB2)
    def self.ppre2=(value : UInt8) : UInt8
      self.set(ppre2: value)
      value
    end

    # APB Low speed prescaler              (APB1)
    def ppre1 : UInt8
      UInt8.new!((@value >> 10) & 0x7_u32)
    end

    # APB Low speed prescaler              (APB1)
    def self.ppre1 : UInt8
      value.ppre1
    end

    # APB Low speed prescaler              (APB1)
    def self.ppre1=(value : UInt8) : UInt8
      self.set(ppre1: value)
      value
    end

    # AHB prescaler
    def hpre : UInt8
      UInt8.new!((@value >> 4) & 0xf_u32)
    end

    # AHB prescaler
    def self.hpre : UInt8
      value.hpre
    end

    # AHB prescaler
    def self.hpre=(value : UInt8) : UInt8
      self.set(hpre: value)
      value
    end

    # System clock switch status
    def sws1 : Bool
      @value.bits_set?(0x8_u32)
    end

    # System clock switch status
    def self.sws1 : Bool
      value.sws1
    end

    # System clock switch status
    def sws0 : Bool
      @value.bits_set?(0x4_u32)
    end

    # System clock switch status
    def self.sws0 : Bool
      value.sws0
    end

    # System clock switch
    def sw1 : Bool
      @value.bits_set?(0x2_u32)
    end

    # System clock switch
    def self.sw1 : Bool
      value.sw1
    end

    # System clock switch
    def self.sw1=(value : Bool) : Bool
      self.set(sw1: value)
      value
    end

    # System clock switch
    def sw0 : Bool
      @value.bits_set?(0x1_u32)
    end

    # System clock switch
    def self.sw0 : Bool
      value.sw0
    end

    # System clock switch
    def self.sw0=(value : Bool) : Bool
      self.set(sw0: value)
      value
    end

    def copy_with(
      *,

      mco2 : UInt8? = nil,

      mco2_pre : UInt8? = nil,

      mco1_pre : UInt8? = nil,

      i2_ssrc : Bool? = nil,

      mco1 : UInt8? = nil,

      rtcpre : UInt8? = nil,

      ppre2 : UInt8? = nil,

      ppre1 : UInt8? = nil,

      hpre : UInt8? = nil,

      sw1 : Bool? = nil,

      sw0 : Bool? = nil
    ) : self
      value = @value

      unless mco2.nil?
        value = (value & 0x3fffffff_u32) |
                UInt32.new!(mco2.to_int).&(0x3_u32) << 30
      end

      unless mco2_pre.nil?
        value = (value & 0xc7ffffff_u32) |
                UInt32.new!(mco2_pre.to_int).&(0x7_u32) << 27
      end

      unless mco1_pre.nil?
        value = (value & 0xf8ffffff_u32) |
                UInt32.new!(mco1_pre.to_int).&(0x7_u32) << 24
      end

      unless i2_ssrc.nil?
        value = (value & 0xff7fffff_u32) |
                UInt32.new!(i2_ssrc.to_int).&(0x1_u32) << 23
      end

      unless mco1.nil?
        value = (value & 0xff9fffff_u32) |
                UInt32.new!(mco1.to_int).&(0x3_u32) << 21
      end

      unless rtcpre.nil?
        value = (value & 0xffe0ffff_u32) |
                UInt32.new!(rtcpre.to_int).&(0x1f_u32) << 16
      end

      unless ppre2.nil?
        value = (value & 0xffff1fff_u32) |
                UInt32.new!(ppre2.to_int).&(0x7_u32) << 13
      end

      unless ppre1.nil?
        value = (value & 0xffffe3ff_u32) |
                UInt32.new!(ppre1.to_int).&(0x7_u32) << 10
      end

      unless hpre.nil?
        value = (value & 0xffffff0f_u32) |
                UInt32.new!(hpre.to_int).&(0xf_u32) << 4
      end

      unless sw1.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(sw1.to_int).&(0x1_u32) << 1
      end

      unless sw0.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(sw0.to_int).&(0x1_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      mco2 : UInt8? = nil,
      mco2_pre : UInt8? = nil,
      mco1_pre : UInt8? = nil,
      i2_ssrc : Bool? = nil,
      mco1 : UInt8? = nil,
      rtcpre : UInt8? = nil,
      ppre2 : UInt8? = nil,
      ppre1 : UInt8? = nil,
      hpre : UInt8? = nil,
      sw1 : Bool? = nil,
      sw0 : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        mco2: mco2,
        mco2_pre: mco2_pre,
        mco1_pre: mco1_pre,
        i2_ssrc: i2_ssrc,
        mco1: mco1,
        rtcpre: rtcpre,
        ppre2: ppre2,
        ppre1: ppre1,
        hpre: hpre,
        sw1: sw1,
        sw0: sw0,
      )
    end
  end # struct

  # clock interrupt register
  struct CIR
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

    # Clock security system interrupt              clear
    def self.cssc=(value : Bool) : Bool
      self.set(cssc: value)
      value
    end

    # PLLI2S ready interrupt              clear
    def self.plli2_srdyc=(value : Bool) : Bool
      self.set(plli2_srdyc: value)
      value
    end

    # Main PLL(PLL) ready interrupt              clear
    def self.pllrdyc=(value : Bool) : Bool
      self.set(pllrdyc: value)
      value
    end

    # HSE ready interrupt clear
    def self.hserdyc=(value : Bool) : Bool
      self.set(hserdyc: value)
      value
    end

    # HSI ready interrupt clear
    def self.hsirdyc=(value : Bool) : Bool
      self.set(hsirdyc: value)
      value
    end

    # LSE ready interrupt clear
    def self.lserdyc=(value : Bool) : Bool
      self.set(lserdyc: value)
      value
    end

    # LSI ready interrupt clear
    def self.lsirdyc=(value : Bool) : Bool
      self.set(lsirdyc: value)
      value
    end

    # PLLI2S ready interrupt              enable
    def plli2_srdyie : Bool
      @value.bits_set?(0x2000_u32)
    end

    # PLLI2S ready interrupt              enable
    def self.plli2_srdyie : Bool
      value.plli2_srdyie
    end

    # PLLI2S ready interrupt              enable
    def self.plli2_srdyie=(value : Bool) : Bool
      self.set(plli2_srdyie: value)
      value
    end

    # Main PLL (PLL) ready interrupt              enable
    def pllrdyie : Bool
      @value.bits_set?(0x1000_u32)
    end

    # Main PLL (PLL) ready interrupt              enable
    def self.pllrdyie : Bool
      value.pllrdyie
    end

    # Main PLL (PLL) ready interrupt              enable
    def self.pllrdyie=(value : Bool) : Bool
      self.set(pllrdyie: value)
      value
    end

    # HSE ready interrupt enable
    def hserdyie : Bool
      @value.bits_set?(0x800_u32)
    end

    # HSE ready interrupt enable
    def self.hserdyie : Bool
      value.hserdyie
    end

    # HSE ready interrupt enable
    def self.hserdyie=(value : Bool) : Bool
      self.set(hserdyie: value)
      value
    end

    # HSI ready interrupt enable
    def hsirdyie : Bool
      @value.bits_set?(0x400_u32)
    end

    # HSI ready interrupt enable
    def self.hsirdyie : Bool
      value.hsirdyie
    end

    # HSI ready interrupt enable
    def self.hsirdyie=(value : Bool) : Bool
      self.set(hsirdyie: value)
      value
    end

    # LSE ready interrupt enable
    def lserdyie : Bool
      @value.bits_set?(0x200_u32)
    end

    # LSE ready interrupt enable
    def self.lserdyie : Bool
      value.lserdyie
    end

    # LSE ready interrupt enable
    def self.lserdyie=(value : Bool) : Bool
      self.set(lserdyie: value)
      value
    end

    # LSI ready interrupt enable
    def lsirdyie : Bool
      @value.bits_set?(0x100_u32)
    end

    # LSI ready interrupt enable
    def self.lsirdyie : Bool
      value.lsirdyie
    end

    # LSI ready interrupt enable
    def self.lsirdyie=(value : Bool) : Bool
      self.set(lsirdyie: value)
      value
    end

    # Clock security system interrupt              flag
    def cssf : Bool
      @value.bits_set?(0x80_u32)
    end

    # Clock security system interrupt              flag
    def self.cssf : Bool
      value.cssf
    end

    # PLLI2S ready interrupt              flag
    def plli2_srdyf : Bool
      @value.bits_set?(0x20_u32)
    end

    # PLLI2S ready interrupt              flag
    def self.plli2_srdyf : Bool
      value.plli2_srdyf
    end

    # Main PLL (PLL) ready interrupt              flag
    def pllrdyf : Bool
      @value.bits_set?(0x10_u32)
    end

    # Main PLL (PLL) ready interrupt              flag
    def self.pllrdyf : Bool
      value.pllrdyf
    end

    # HSE ready interrupt flag
    def hserdyf : Bool
      @value.bits_set?(0x8_u32)
    end

    # HSE ready interrupt flag
    def self.hserdyf : Bool
      value.hserdyf
    end

    # HSI ready interrupt flag
    def hsirdyf : Bool
      @value.bits_set?(0x4_u32)
    end

    # HSI ready interrupt flag
    def self.hsirdyf : Bool
      value.hsirdyf
    end

    # LSE ready interrupt flag
    def lserdyf : Bool
      @value.bits_set?(0x2_u32)
    end

    # LSE ready interrupt flag
    def self.lserdyf : Bool
      value.lserdyf
    end

    # LSI ready interrupt flag
    def lsirdyf : Bool
      @value.bits_set?(0x1_u32)
    end

    # LSI ready interrupt flag
    def self.lsirdyf : Bool
      value.lsirdyf
    end

    def copy_with(
      *,

      cssc : Bool? = nil,

      plli2_srdyc : Bool? = nil,

      pllrdyc : Bool? = nil,

      hserdyc : Bool? = nil,

      hsirdyc : Bool? = nil,

      lserdyc : Bool? = nil,

      lsirdyc : Bool? = nil,

      plli2_srdyie : Bool? = nil,

      pllrdyie : Bool? = nil,

      hserdyie : Bool? = nil,

      hsirdyie : Bool? = nil,

      lserdyie : Bool? = nil,

      lsirdyie : Bool? = nil
    ) : self
      value = @value

      unless cssc.nil?
        value = (value & 0xff7fffff_u32) |
                UInt32.new!(cssc.to_int).&(0x1_u32) << 23
      end

      unless plli2_srdyc.nil?
        value = (value & 0xffdfffff_u32) |
                UInt32.new!(plli2_srdyc.to_int).&(0x1_u32) << 21
      end

      unless pllrdyc.nil?
        value = (value & 0xffefffff_u32) |
                UInt32.new!(pllrdyc.to_int).&(0x1_u32) << 20
      end

      unless hserdyc.nil?
        value = (value & 0xfff7ffff_u32) |
                UInt32.new!(hserdyc.to_int).&(0x1_u32) << 19
      end

      unless hsirdyc.nil?
        value = (value & 0xfffbffff_u32) |
                UInt32.new!(hsirdyc.to_int).&(0x1_u32) << 18
      end

      unless lserdyc.nil?
        value = (value & 0xfffdffff_u32) |
                UInt32.new!(lserdyc.to_int).&(0x1_u32) << 17
      end

      unless lsirdyc.nil?
        value = (value & 0xfffeffff_u32) |
                UInt32.new!(lsirdyc.to_int).&(0x1_u32) << 16
      end

      unless plli2_srdyie.nil?
        value = (value & 0xffffdfff_u32) |
                UInt32.new!(plli2_srdyie.to_int).&(0x1_u32) << 13
      end

      unless pllrdyie.nil?
        value = (value & 0xffffefff_u32) |
                UInt32.new!(pllrdyie.to_int).&(0x1_u32) << 12
      end

      unless hserdyie.nil?
        value = (value & 0xfffff7ff_u32) |
                UInt32.new!(hserdyie.to_int).&(0x1_u32) << 11
      end

      unless hsirdyie.nil?
        value = (value & 0xfffffbff_u32) |
                UInt32.new!(hsirdyie.to_int).&(0x1_u32) << 10
      end

      unless lserdyie.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(lserdyie.to_int).&(0x1_u32) << 9
      end

      unless lsirdyie.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(lsirdyie.to_int).&(0x1_u32) << 8
      end

      self.class.new(value)
    end

    def self.set(
      *,
      cssc : Bool? = nil,
      plli2_srdyc : Bool? = nil,
      pllrdyc : Bool? = nil,
      hserdyc : Bool? = nil,
      hsirdyc : Bool? = nil,
      lserdyc : Bool? = nil,
      lsirdyc : Bool? = nil,
      plli2_srdyie : Bool? = nil,
      pllrdyie : Bool? = nil,
      hserdyie : Bool? = nil,
      hsirdyie : Bool? = nil,
      lserdyie : Bool? = nil,
      lsirdyie : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        cssc: cssc,
        plli2_srdyc: plli2_srdyc,
        pllrdyc: pllrdyc,
        hserdyc: hserdyc,
        hsirdyc: hsirdyc,
        lserdyc: lserdyc,
        lsirdyc: lsirdyc,
        plli2_srdyie: plli2_srdyie,
        pllrdyie: pllrdyie,
        hserdyie: hserdyie,
        hsirdyie: hsirdyie,
        lserdyie: lserdyie,
        lsirdyie: lsirdyie,
      )
    end
  end # struct

  # AHB1 peripheral reset register
  struct AHB1RSTR
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

    # USB OTG HS module reset
    def otghsrst : Bool
      @value.bits_set?(0x20000000_u32)
    end

    # USB OTG HS module reset
    def self.otghsrst : Bool
      value.otghsrst
    end

    # USB OTG HS module reset
    def self.otghsrst=(value : Bool) : Bool
      self.set(otghsrst: value)
      value
    end

    # Ethernet MAC reset
    def ethmacrst : Bool
      @value.bits_set?(0x2000000_u32)
    end

    # Ethernet MAC reset
    def self.ethmacrst : Bool
      value.ethmacrst
    end

    # Ethernet MAC reset
    def self.ethmacrst=(value : Bool) : Bool
      self.set(ethmacrst: value)
      value
    end

    # DMA2 reset
    def dma2_rst : Bool
      @value.bits_set?(0x400000_u32)
    end

    # DMA2 reset
    def self.dma2_rst : Bool
      value.dma2_rst
    end

    # DMA2 reset
    def self.dma2_rst=(value : Bool) : Bool
      self.set(dma2_rst: value)
      value
    end

    # DMA2 reset
    def dma1_rst : Bool
      @value.bits_set?(0x200000_u32)
    end

    # DMA2 reset
    def self.dma1_rst : Bool
      value.dma1_rst
    end

    # DMA2 reset
    def self.dma1_rst=(value : Bool) : Bool
      self.set(dma1_rst: value)
      value
    end

    # CRC reset
    def crcrst : Bool
      @value.bits_set?(0x1000_u32)
    end

    # CRC reset
    def self.crcrst : Bool
      value.crcrst
    end

    # CRC reset
    def self.crcrst=(value : Bool) : Bool
      self.set(crcrst: value)
      value
    end

    # IO port I reset
    def gpioirst : Bool
      @value.bits_set?(0x100_u32)
    end

    # IO port I reset
    def self.gpioirst : Bool
      value.gpioirst
    end

    # IO port I reset
    def self.gpioirst=(value : Bool) : Bool
      self.set(gpioirst: value)
      value
    end

    # IO port H reset
    def gpiohrst : Bool
      @value.bits_set?(0x80_u32)
    end

    # IO port H reset
    def self.gpiohrst : Bool
      value.gpiohrst
    end

    # IO port H reset
    def self.gpiohrst=(value : Bool) : Bool
      self.set(gpiohrst: value)
      value
    end

    # IO port G reset
    def gpiogrst : Bool
      @value.bits_set?(0x40_u32)
    end

    # IO port G reset
    def self.gpiogrst : Bool
      value.gpiogrst
    end

    # IO port G reset
    def self.gpiogrst=(value : Bool) : Bool
      self.set(gpiogrst: value)
      value
    end

    # IO port F reset
    def gpiofrst : Bool
      @value.bits_set?(0x20_u32)
    end

    # IO port F reset
    def self.gpiofrst : Bool
      value.gpiofrst
    end

    # IO port F reset
    def self.gpiofrst=(value : Bool) : Bool
      self.set(gpiofrst: value)
      value
    end

    # IO port E reset
    def gpioerst : Bool
      @value.bits_set?(0x10_u32)
    end

    # IO port E reset
    def self.gpioerst : Bool
      value.gpioerst
    end

    # IO port E reset
    def self.gpioerst=(value : Bool) : Bool
      self.set(gpioerst: value)
      value
    end

    # IO port D reset
    def gpiodrst : Bool
      @value.bits_set?(0x8_u32)
    end

    # IO port D reset
    def self.gpiodrst : Bool
      value.gpiodrst
    end

    # IO port D reset
    def self.gpiodrst=(value : Bool) : Bool
      self.set(gpiodrst: value)
      value
    end

    # IO port C reset
    def gpiocrst : Bool
      @value.bits_set?(0x4_u32)
    end

    # IO port C reset
    def self.gpiocrst : Bool
      value.gpiocrst
    end

    # IO port C reset
    def self.gpiocrst=(value : Bool) : Bool
      self.set(gpiocrst: value)
      value
    end

    # IO port B reset
    def gpiobrst : Bool
      @value.bits_set?(0x2_u32)
    end

    # IO port B reset
    def self.gpiobrst : Bool
      value.gpiobrst
    end

    # IO port B reset
    def self.gpiobrst=(value : Bool) : Bool
      self.set(gpiobrst: value)
      value
    end

    # IO port A reset
    def gpioarst : Bool
      @value.bits_set?(0x1_u32)
    end

    # IO port A reset
    def self.gpioarst : Bool
      value.gpioarst
    end

    # IO port A reset
    def self.gpioarst=(value : Bool) : Bool
      self.set(gpioarst: value)
      value
    end

    def copy_with(
      *,

      otghsrst : Bool? = nil,

      ethmacrst : Bool? = nil,

      dma2_rst : Bool? = nil,

      dma1_rst : Bool? = nil,

      crcrst : Bool? = nil,

      gpioirst : Bool? = nil,

      gpiohrst : Bool? = nil,

      gpiogrst : Bool? = nil,

      gpiofrst : Bool? = nil,

      gpioerst : Bool? = nil,

      gpiodrst : Bool? = nil,

      gpiocrst : Bool? = nil,

      gpiobrst : Bool? = nil,

      gpioarst : Bool? = nil
    ) : self
      value = @value

      unless otghsrst.nil?
        value = (value & 0xdfffffff_u32) |
                UInt32.new!(otghsrst.to_int).&(0x1_u32) << 29
      end

      unless ethmacrst.nil?
        value = (value & 0xfdffffff_u32) |
                UInt32.new!(ethmacrst.to_int).&(0x1_u32) << 25
      end

      unless dma2_rst.nil?
        value = (value & 0xffbfffff_u32) |
                UInt32.new!(dma2_rst.to_int).&(0x1_u32) << 22
      end

      unless dma1_rst.nil?
        value = (value & 0xffdfffff_u32) |
                UInt32.new!(dma1_rst.to_int).&(0x1_u32) << 21
      end

      unless crcrst.nil?
        value = (value & 0xffffefff_u32) |
                UInt32.new!(crcrst.to_int).&(0x1_u32) << 12
      end

      unless gpioirst.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(gpioirst.to_int).&(0x1_u32) << 8
      end

      unless gpiohrst.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(gpiohrst.to_int).&(0x1_u32) << 7
      end

      unless gpiogrst.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(gpiogrst.to_int).&(0x1_u32) << 6
      end

      unless gpiofrst.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(gpiofrst.to_int).&(0x1_u32) << 5
      end

      unless gpioerst.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(gpioerst.to_int).&(0x1_u32) << 4
      end

      unless gpiodrst.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(gpiodrst.to_int).&(0x1_u32) << 3
      end

      unless gpiocrst.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(gpiocrst.to_int).&(0x1_u32) << 2
      end

      unless gpiobrst.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(gpiobrst.to_int).&(0x1_u32) << 1
      end

      unless gpioarst.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(gpioarst.to_int).&(0x1_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      otghsrst : Bool? = nil,
      ethmacrst : Bool? = nil,
      dma2_rst : Bool? = nil,
      dma1_rst : Bool? = nil,
      crcrst : Bool? = nil,
      gpioirst : Bool? = nil,
      gpiohrst : Bool? = nil,
      gpiogrst : Bool? = nil,
      gpiofrst : Bool? = nil,
      gpioerst : Bool? = nil,
      gpiodrst : Bool? = nil,
      gpiocrst : Bool? = nil,
      gpiobrst : Bool? = nil,
      gpioarst : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        otghsrst: otghsrst,
        ethmacrst: ethmacrst,
        dma2_rst: dma2_rst,
        dma1_rst: dma1_rst,
        crcrst: crcrst,
        gpioirst: gpioirst,
        gpiohrst: gpiohrst,
        gpiogrst: gpiogrst,
        gpiofrst: gpiofrst,
        gpioerst: gpioerst,
        gpiodrst: gpiodrst,
        gpiocrst: gpiocrst,
        gpiobrst: gpiobrst,
        gpioarst: gpioarst,
      )
    end
  end # struct

  # AHB2 peripheral reset register
  struct AHB2RSTR
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

    # USB OTG FS module reset
    def otgfsrst : Bool
      @value.bits_set?(0x80_u32)
    end

    # USB OTG FS module reset
    def self.otgfsrst : Bool
      value.otgfsrst
    end

    # USB OTG FS module reset
    def self.otgfsrst=(value : Bool) : Bool
      self.set(otgfsrst: value)
      value
    end

    # Random number generator module              reset
    def rngrst : Bool
      @value.bits_set?(0x40_u32)
    end

    # Random number generator module              reset
    def self.rngrst : Bool
      value.rngrst
    end

    # Random number generator module              reset
    def self.rngrst=(value : Bool) : Bool
      self.set(rngrst: value)
      value
    end

    # Hash module reset
    def hsahrst : Bool
      @value.bits_set?(0x20_u32)
    end

    # Hash module reset
    def self.hsahrst : Bool
      value.hsahrst
    end

    # Hash module reset
    def self.hsahrst=(value : Bool) : Bool
      self.set(hsahrst: value)
      value
    end

    # Cryptographic module reset
    def cryprst : Bool
      @value.bits_set?(0x10_u32)
    end

    # Cryptographic module reset
    def self.cryprst : Bool
      value.cryprst
    end

    # Cryptographic module reset
    def self.cryprst=(value : Bool) : Bool
      self.set(cryprst: value)
      value
    end

    # Camera interface reset
    def dcmirst : Bool
      @value.bits_set?(0x1_u32)
    end

    # Camera interface reset
    def self.dcmirst : Bool
      value.dcmirst
    end

    # Camera interface reset
    def self.dcmirst=(value : Bool) : Bool
      self.set(dcmirst: value)
      value
    end

    def copy_with(
      *,

      otgfsrst : Bool? = nil,

      rngrst : Bool? = nil,

      hsahrst : Bool? = nil,

      cryprst : Bool? = nil,

      dcmirst : Bool? = nil
    ) : self
      value = @value

      unless otgfsrst.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(otgfsrst.to_int).&(0x1_u32) << 7
      end

      unless rngrst.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(rngrst.to_int).&(0x1_u32) << 6
      end

      unless hsahrst.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(hsahrst.to_int).&(0x1_u32) << 5
      end

      unless cryprst.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(cryprst.to_int).&(0x1_u32) << 4
      end

      unless dcmirst.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(dcmirst.to_int).&(0x1_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      otgfsrst : Bool? = nil,
      rngrst : Bool? = nil,
      hsahrst : Bool? = nil,
      cryprst : Bool? = nil,
      dcmirst : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        otgfsrst: otgfsrst,
        rngrst: rngrst,
        hsahrst: hsahrst,
        cryprst: cryprst,
        dcmirst: dcmirst,
      )
    end
  end # struct

  # AHB3 peripheral reset register
  struct AHB3RSTR
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

    # Flexible memory controller module              reset
    def fmcrst : Bool
      @value.bits_set?(0x1_u32)
    end

    # Flexible memory controller module              reset
    def self.fmcrst : Bool
      value.fmcrst
    end

    # Flexible memory controller module              reset
    def self.fmcrst=(value : Bool) : Bool
      self.set(fmcrst: value)
      value
    end

    def copy_with(
      *,

      fmcrst : Bool? = nil
    ) : self
      value = @value

      unless fmcrst.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(fmcrst.to_int).&(0x1_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      fmcrst : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        fmcrst: fmcrst,
      )
    end
  end # struct

  # APB1 peripheral reset register
  struct APB1RSTR
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

    # TIM2 reset
    def tim2_rst : Bool
      @value.bits_set?(0x1_u32)
    end

    # TIM2 reset
    def self.tim2_rst : Bool
      value.tim2_rst
    end

    # TIM2 reset
    def self.tim2_rst=(value : Bool) : Bool
      self.set(tim2_rst: value)
      value
    end

    # TIM3 reset
    def tim3_rst : Bool
      @value.bits_set?(0x2_u32)
    end

    # TIM3 reset
    def self.tim3_rst : Bool
      value.tim3_rst
    end

    # TIM3 reset
    def self.tim3_rst=(value : Bool) : Bool
      self.set(tim3_rst: value)
      value
    end

    # TIM4 reset
    def tim4_rst : Bool
      @value.bits_set?(0x4_u32)
    end

    # TIM4 reset
    def self.tim4_rst : Bool
      value.tim4_rst
    end

    # TIM4 reset
    def self.tim4_rst=(value : Bool) : Bool
      self.set(tim4_rst: value)
      value
    end

    # TIM5 reset
    def tim5_rst : Bool
      @value.bits_set?(0x8_u32)
    end

    # TIM5 reset
    def self.tim5_rst : Bool
      value.tim5_rst
    end

    # TIM5 reset
    def self.tim5_rst=(value : Bool) : Bool
      self.set(tim5_rst: value)
      value
    end

    # TIM6 reset
    def tim6_rst : Bool
      @value.bits_set?(0x10_u32)
    end

    # TIM6 reset
    def self.tim6_rst : Bool
      value.tim6_rst
    end

    # TIM6 reset
    def self.tim6_rst=(value : Bool) : Bool
      self.set(tim6_rst: value)
      value
    end

    # TIM7 reset
    def tim7_rst : Bool
      @value.bits_set?(0x20_u32)
    end

    # TIM7 reset
    def self.tim7_rst : Bool
      value.tim7_rst
    end

    # TIM7 reset
    def self.tim7_rst=(value : Bool) : Bool
      self.set(tim7_rst: value)
      value
    end

    # TIM12 reset
    def tim12_rst : Bool
      @value.bits_set?(0x40_u32)
    end

    # TIM12 reset
    def self.tim12_rst : Bool
      value.tim12_rst
    end

    # TIM12 reset
    def self.tim12_rst=(value : Bool) : Bool
      self.set(tim12_rst: value)
      value
    end

    # TIM13 reset
    def tim13_rst : Bool
      @value.bits_set?(0x80_u32)
    end

    # TIM13 reset
    def self.tim13_rst : Bool
      value.tim13_rst
    end

    # TIM13 reset
    def self.tim13_rst=(value : Bool) : Bool
      self.set(tim13_rst: value)
      value
    end

    # TIM14 reset
    def tim14_rst : Bool
      @value.bits_set?(0x100_u32)
    end

    # TIM14 reset
    def self.tim14_rst : Bool
      value.tim14_rst
    end

    # TIM14 reset
    def self.tim14_rst=(value : Bool) : Bool
      self.set(tim14_rst: value)
      value
    end

    # Window watchdog reset
    def wwdgrst : Bool
      @value.bits_set?(0x800_u32)
    end

    # Window watchdog reset
    def self.wwdgrst : Bool
      value.wwdgrst
    end

    # Window watchdog reset
    def self.wwdgrst=(value : Bool) : Bool
      self.set(wwdgrst: value)
      value
    end

    # SPI 2 reset
    def spi2_rst : Bool
      @value.bits_set?(0x4000_u32)
    end

    # SPI 2 reset
    def self.spi2_rst : Bool
      value.spi2_rst
    end

    # SPI 2 reset
    def self.spi2_rst=(value : Bool) : Bool
      self.set(spi2_rst: value)
      value
    end

    # SPI 3 reset
    def spi3_rst : Bool
      @value.bits_set?(0x8000_u32)
    end

    # SPI 3 reset
    def self.spi3_rst : Bool
      value.spi3_rst
    end

    # SPI 3 reset
    def self.spi3_rst=(value : Bool) : Bool
      self.set(spi3_rst: value)
      value
    end

    # USART 2 reset
    def uart2_rst : Bool
      @value.bits_set?(0x20000_u32)
    end

    # USART 2 reset
    def self.uart2_rst : Bool
      value.uart2_rst
    end

    # USART 2 reset
    def self.uart2_rst=(value : Bool) : Bool
      self.set(uart2_rst: value)
      value
    end

    # USART 3 reset
    def uart3_rst : Bool
      @value.bits_set?(0x40000_u32)
    end

    # USART 3 reset
    def self.uart3_rst : Bool
      value.uart3_rst
    end

    # USART 3 reset
    def self.uart3_rst=(value : Bool) : Bool
      self.set(uart3_rst: value)
      value
    end

    # USART 4 reset
    def uart4_rst : Bool
      @value.bits_set?(0x80000_u32)
    end

    # USART 4 reset
    def self.uart4_rst : Bool
      value.uart4_rst
    end

    # USART 4 reset
    def self.uart4_rst=(value : Bool) : Bool
      self.set(uart4_rst: value)
      value
    end

    # USART 5 reset
    def uart5_rst : Bool
      @value.bits_set?(0x100000_u32)
    end

    # USART 5 reset
    def self.uart5_rst : Bool
      value.uart5_rst
    end

    # USART 5 reset
    def self.uart5_rst=(value : Bool) : Bool
      self.set(uart5_rst: value)
      value
    end

    # I2C 1 reset
    def i2_c1_rst : Bool
      @value.bits_set?(0x200000_u32)
    end

    # I2C 1 reset
    def self.i2_c1_rst : Bool
      value.i2_c1_rst
    end

    # I2C 1 reset
    def self.i2_c1_rst=(value : Bool) : Bool
      self.set(i2_c1_rst: value)
      value
    end

    # I2C 2 reset
    def i2_c2_rst : Bool
      @value.bits_set?(0x400000_u32)
    end

    # I2C 2 reset
    def self.i2_c2_rst : Bool
      value.i2_c2_rst
    end

    # I2C 2 reset
    def self.i2_c2_rst=(value : Bool) : Bool
      self.set(i2_c2_rst: value)
      value
    end

    # I2C3 reset
    def i2_c3_rst : Bool
      @value.bits_set?(0x800000_u32)
    end

    # I2C3 reset
    def self.i2_c3_rst : Bool
      value.i2_c3_rst
    end

    # I2C3 reset
    def self.i2_c3_rst=(value : Bool) : Bool
      self.set(i2_c3_rst: value)
      value
    end

    # CAN1 reset
    def can1_rst : Bool
      @value.bits_set?(0x2000000_u32)
    end

    # CAN1 reset
    def self.can1_rst : Bool
      value.can1_rst
    end

    # CAN1 reset
    def self.can1_rst=(value : Bool) : Bool
      self.set(can1_rst: value)
      value
    end

    # CAN2 reset
    def can2_rst : Bool
      @value.bits_set?(0x4000000_u32)
    end

    # CAN2 reset
    def self.can2_rst : Bool
      value.can2_rst
    end

    # CAN2 reset
    def self.can2_rst=(value : Bool) : Bool
      self.set(can2_rst: value)
      value
    end

    # Power interface reset
    def pwrrst : Bool
      @value.bits_set?(0x10000000_u32)
    end

    # Power interface reset
    def self.pwrrst : Bool
      value.pwrrst
    end

    # Power interface reset
    def self.pwrrst=(value : Bool) : Bool
      self.set(pwrrst: value)
      value
    end

    # DAC reset
    def dacrst : Bool
      @value.bits_set?(0x20000000_u32)
    end

    # DAC reset
    def self.dacrst : Bool
      value.dacrst
    end

    # DAC reset
    def self.dacrst=(value : Bool) : Bool
      self.set(dacrst: value)
      value
    end

    def copy_with(
      *,

      tim2_rst : Bool? = nil,

      tim3_rst : Bool? = nil,

      tim4_rst : Bool? = nil,

      tim5_rst : Bool? = nil,

      tim6_rst : Bool? = nil,

      tim7_rst : Bool? = nil,

      tim12_rst : Bool? = nil,

      tim13_rst : Bool? = nil,

      tim14_rst : Bool? = nil,

      wwdgrst : Bool? = nil,

      spi2_rst : Bool? = nil,

      spi3_rst : Bool? = nil,

      uart2_rst : Bool? = nil,

      uart3_rst : Bool? = nil,

      uart4_rst : Bool? = nil,

      uart5_rst : Bool? = nil,

      i2_c1_rst : Bool? = nil,

      i2_c2_rst : Bool? = nil,

      i2_c3_rst : Bool? = nil,

      can1_rst : Bool? = nil,

      can2_rst : Bool? = nil,

      pwrrst : Bool? = nil,

      dacrst : Bool? = nil
    ) : self
      value = @value

      unless tim2_rst.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(tim2_rst.to_int).&(0x1_u32) << 0
      end

      unless tim3_rst.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(tim3_rst.to_int).&(0x1_u32) << 1
      end

      unless tim4_rst.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(tim4_rst.to_int).&(0x1_u32) << 2
      end

      unless tim5_rst.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(tim5_rst.to_int).&(0x1_u32) << 3
      end

      unless tim6_rst.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(tim6_rst.to_int).&(0x1_u32) << 4
      end

      unless tim7_rst.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(tim7_rst.to_int).&(0x1_u32) << 5
      end

      unless tim12_rst.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(tim12_rst.to_int).&(0x1_u32) << 6
      end

      unless tim13_rst.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(tim13_rst.to_int).&(0x1_u32) << 7
      end

      unless tim14_rst.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(tim14_rst.to_int).&(0x1_u32) << 8
      end

      unless wwdgrst.nil?
        value = (value & 0xfffff7ff_u32) |
                UInt32.new!(wwdgrst.to_int).&(0x1_u32) << 11
      end

      unless spi2_rst.nil?
        value = (value & 0xffffbfff_u32) |
                UInt32.new!(spi2_rst.to_int).&(0x1_u32) << 14
      end

      unless spi3_rst.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(spi3_rst.to_int).&(0x1_u32) << 15
      end

      unless uart2_rst.nil?
        value = (value & 0xfffdffff_u32) |
                UInt32.new!(uart2_rst.to_int).&(0x1_u32) << 17
      end

      unless uart3_rst.nil?
        value = (value & 0xfffbffff_u32) |
                UInt32.new!(uart3_rst.to_int).&(0x1_u32) << 18
      end

      unless uart4_rst.nil?
        value = (value & 0xfff7ffff_u32) |
                UInt32.new!(uart4_rst.to_int).&(0x1_u32) << 19
      end

      unless uart5_rst.nil?
        value = (value & 0xffefffff_u32) |
                UInt32.new!(uart5_rst.to_int).&(0x1_u32) << 20
      end

      unless i2_c1_rst.nil?
        value = (value & 0xffdfffff_u32) |
                UInt32.new!(i2_c1_rst.to_int).&(0x1_u32) << 21
      end

      unless i2_c2_rst.nil?
        value = (value & 0xffbfffff_u32) |
                UInt32.new!(i2_c2_rst.to_int).&(0x1_u32) << 22
      end

      unless i2_c3_rst.nil?
        value = (value & 0xff7fffff_u32) |
                UInt32.new!(i2_c3_rst.to_int).&(0x1_u32) << 23
      end

      unless can1_rst.nil?
        value = (value & 0xfdffffff_u32) |
                UInt32.new!(can1_rst.to_int).&(0x1_u32) << 25
      end

      unless can2_rst.nil?
        value = (value & 0xfbffffff_u32) |
                UInt32.new!(can2_rst.to_int).&(0x1_u32) << 26
      end

      unless pwrrst.nil?
        value = (value & 0xefffffff_u32) |
                UInt32.new!(pwrrst.to_int).&(0x1_u32) << 28
      end

      unless dacrst.nil?
        value = (value & 0xdfffffff_u32) |
                UInt32.new!(dacrst.to_int).&(0x1_u32) << 29
      end

      self.class.new(value)
    end

    def self.set(
      *,
      tim2_rst : Bool? = nil,
      tim3_rst : Bool? = nil,
      tim4_rst : Bool? = nil,
      tim5_rst : Bool? = nil,
      tim6_rst : Bool? = nil,
      tim7_rst : Bool? = nil,
      tim12_rst : Bool? = nil,
      tim13_rst : Bool? = nil,
      tim14_rst : Bool? = nil,
      wwdgrst : Bool? = nil,
      spi2_rst : Bool? = nil,
      spi3_rst : Bool? = nil,
      uart2_rst : Bool? = nil,
      uart3_rst : Bool? = nil,
      uart4_rst : Bool? = nil,
      uart5_rst : Bool? = nil,
      i2_c1_rst : Bool? = nil,
      i2_c2_rst : Bool? = nil,
      i2_c3_rst : Bool? = nil,
      can1_rst : Bool? = nil,
      can2_rst : Bool? = nil,
      pwrrst : Bool? = nil,
      dacrst : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        tim2_rst: tim2_rst,
        tim3_rst: tim3_rst,
        tim4_rst: tim4_rst,
        tim5_rst: tim5_rst,
        tim6_rst: tim6_rst,
        tim7_rst: tim7_rst,
        tim12_rst: tim12_rst,
        tim13_rst: tim13_rst,
        tim14_rst: tim14_rst,
        wwdgrst: wwdgrst,
        spi2_rst: spi2_rst,
        spi3_rst: spi3_rst,
        uart2_rst: uart2_rst,
        uart3_rst: uart3_rst,
        uart4_rst: uart4_rst,
        uart5_rst: uart5_rst,
        i2_c1_rst: i2_c1_rst,
        i2_c2_rst: i2_c2_rst,
        i2_c3_rst: i2_c3_rst,
        can1_rst: can1_rst,
        can2_rst: can2_rst,
        pwrrst: pwrrst,
        dacrst: dacrst,
      )
    end
  end # struct

  # APB2 peripheral reset register
  struct APB2RSTR
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

    # TIM1 reset
    def tim1_rst : Bool
      @value.bits_set?(0x1_u32)
    end

    # TIM1 reset
    def self.tim1_rst : Bool
      value.tim1_rst
    end

    # TIM1 reset
    def self.tim1_rst=(value : Bool) : Bool
      self.set(tim1_rst: value)
      value
    end

    # TIM8 reset
    def tim8_rst : Bool
      @value.bits_set?(0x2_u32)
    end

    # TIM8 reset
    def self.tim8_rst : Bool
      value.tim8_rst
    end

    # TIM8 reset
    def self.tim8_rst=(value : Bool) : Bool
      self.set(tim8_rst: value)
      value
    end

    # USART1 reset
    def usart1_rst : Bool
      @value.bits_set?(0x10_u32)
    end

    # USART1 reset
    def self.usart1_rst : Bool
      value.usart1_rst
    end

    # USART1 reset
    def self.usart1_rst=(value : Bool) : Bool
      self.set(usart1_rst: value)
      value
    end

    # USART6 reset
    def usart6_rst : Bool
      @value.bits_set?(0x20_u32)
    end

    # USART6 reset
    def self.usart6_rst : Bool
      value.usart6_rst
    end

    # USART6 reset
    def self.usart6_rst=(value : Bool) : Bool
      self.set(usart6_rst: value)
      value
    end

    # ADC interface reset (common to all              ADCs)
    def adcrst : Bool
      @value.bits_set?(0x100_u32)
    end

    # ADC interface reset (common to all              ADCs)
    def self.adcrst : Bool
      value.adcrst
    end

    # ADC interface reset (common to all              ADCs)
    def self.adcrst=(value : Bool) : Bool
      self.set(adcrst: value)
      value
    end

    # SDIO reset
    def sdiorst : Bool
      @value.bits_set?(0x800_u32)
    end

    # SDIO reset
    def self.sdiorst : Bool
      value.sdiorst
    end

    # SDIO reset
    def self.sdiorst=(value : Bool) : Bool
      self.set(sdiorst: value)
      value
    end

    # SPI 1 reset
    def spi1_rst : Bool
      @value.bits_set?(0x1000_u32)
    end

    # SPI 1 reset
    def self.spi1_rst : Bool
      value.spi1_rst
    end

    # SPI 1 reset
    def self.spi1_rst=(value : Bool) : Bool
      self.set(spi1_rst: value)
      value
    end

    # System configuration controller              reset
    def syscfgrst : Bool
      @value.bits_set?(0x4000_u32)
    end

    # System configuration controller              reset
    def self.syscfgrst : Bool
      value.syscfgrst
    end

    # System configuration controller              reset
    def self.syscfgrst=(value : Bool) : Bool
      self.set(syscfgrst: value)
      value
    end

    # TIM9 reset
    def tim9_rst : Bool
      @value.bits_set?(0x10000_u32)
    end

    # TIM9 reset
    def self.tim9_rst : Bool
      value.tim9_rst
    end

    # TIM9 reset
    def self.tim9_rst=(value : Bool) : Bool
      self.set(tim9_rst: value)
      value
    end

    # TIM10 reset
    def tim10_rst : Bool
      @value.bits_set?(0x20000_u32)
    end

    # TIM10 reset
    def self.tim10_rst : Bool
      value.tim10_rst
    end

    # TIM10 reset
    def self.tim10_rst=(value : Bool) : Bool
      self.set(tim10_rst: value)
      value
    end

    # TIM11 reset
    def tim11_rst : Bool
      @value.bits_set?(0x40000_u32)
    end

    # TIM11 reset
    def self.tim11_rst : Bool
      value.tim11_rst
    end

    # TIM11 reset
    def self.tim11_rst=(value : Bool) : Bool
      self.set(tim11_rst: value)
      value
    end

    def copy_with(
      *,

      tim1_rst : Bool? = nil,

      tim8_rst : Bool? = nil,

      usart1_rst : Bool? = nil,

      usart6_rst : Bool? = nil,

      adcrst : Bool? = nil,

      sdiorst : Bool? = nil,

      spi1_rst : Bool? = nil,

      syscfgrst : Bool? = nil,

      tim9_rst : Bool? = nil,

      tim10_rst : Bool? = nil,

      tim11_rst : Bool? = nil
    ) : self
      value = @value

      unless tim1_rst.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(tim1_rst.to_int).&(0x1_u32) << 0
      end

      unless tim8_rst.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(tim8_rst.to_int).&(0x1_u32) << 1
      end

      unless usart1_rst.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(usart1_rst.to_int).&(0x1_u32) << 4
      end

      unless usart6_rst.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(usart6_rst.to_int).&(0x1_u32) << 5
      end

      unless adcrst.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(adcrst.to_int).&(0x1_u32) << 8
      end

      unless sdiorst.nil?
        value = (value & 0xfffff7ff_u32) |
                UInt32.new!(sdiorst.to_int).&(0x1_u32) << 11
      end

      unless spi1_rst.nil?
        value = (value & 0xffffefff_u32) |
                UInt32.new!(spi1_rst.to_int).&(0x1_u32) << 12
      end

      unless syscfgrst.nil?
        value = (value & 0xffffbfff_u32) |
                UInt32.new!(syscfgrst.to_int).&(0x1_u32) << 14
      end

      unless tim9_rst.nil?
        value = (value & 0xfffeffff_u32) |
                UInt32.new!(tim9_rst.to_int).&(0x1_u32) << 16
      end

      unless tim10_rst.nil?
        value = (value & 0xfffdffff_u32) |
                UInt32.new!(tim10_rst.to_int).&(0x1_u32) << 17
      end

      unless tim11_rst.nil?
        value = (value & 0xfffbffff_u32) |
                UInt32.new!(tim11_rst.to_int).&(0x1_u32) << 18
      end

      self.class.new(value)
    end

    def self.set(
      *,
      tim1_rst : Bool? = nil,
      tim8_rst : Bool? = nil,
      usart1_rst : Bool? = nil,
      usart6_rst : Bool? = nil,
      adcrst : Bool? = nil,
      sdiorst : Bool? = nil,
      spi1_rst : Bool? = nil,
      syscfgrst : Bool? = nil,
      tim9_rst : Bool? = nil,
      tim10_rst : Bool? = nil,
      tim11_rst : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        tim1_rst: tim1_rst,
        tim8_rst: tim8_rst,
        usart1_rst: usart1_rst,
        usart6_rst: usart6_rst,
        adcrst: adcrst,
        sdiorst: sdiorst,
        spi1_rst: spi1_rst,
        syscfgrst: syscfgrst,
        tim9_rst: tim9_rst,
        tim10_rst: tim10_rst,
        tim11_rst: tim11_rst,
      )
    end
  end # struct

  # AHB1 peripheral clock register
  struct AHB1ENR
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
      new(0x100000_u64)
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

    # USB OTG HSULPI clock              enable
    def otghsulpien : Bool
      @value.bits_set?(0x40000000_u32)
    end

    # USB OTG HSULPI clock              enable
    def self.otghsulpien : Bool
      value.otghsulpien
    end

    # USB OTG HSULPI clock              enable
    def self.otghsulpien=(value : Bool) : Bool
      self.set(otghsulpien: value)
      value
    end

    # USB OTG HS clock enable
    def otghsen : Bool
      @value.bits_set?(0x20000000_u32)
    end

    # USB OTG HS clock enable
    def self.otghsen : Bool
      value.otghsen
    end

    # USB OTG HS clock enable
    def self.otghsen=(value : Bool) : Bool
      self.set(otghsen: value)
      value
    end

    # Ethernet PTP clock enable
    def ethmacptpen : Bool
      @value.bits_set?(0x10000000_u32)
    end

    # Ethernet PTP clock enable
    def self.ethmacptpen : Bool
      value.ethmacptpen
    end

    # Ethernet PTP clock enable
    def self.ethmacptpen=(value : Bool) : Bool
      self.set(ethmacptpen: value)
      value
    end

    # Ethernet Reception clock              enable
    def ethmacrxen : Bool
      @value.bits_set?(0x8000000_u32)
    end

    # Ethernet Reception clock              enable
    def self.ethmacrxen : Bool
      value.ethmacrxen
    end

    # Ethernet Reception clock              enable
    def self.ethmacrxen=(value : Bool) : Bool
      self.set(ethmacrxen: value)
      value
    end

    # Ethernet Transmission clock              enable
    def ethmactxen : Bool
      @value.bits_set?(0x4000000_u32)
    end

    # Ethernet Transmission clock              enable
    def self.ethmactxen : Bool
      value.ethmactxen
    end

    # Ethernet Transmission clock              enable
    def self.ethmactxen=(value : Bool) : Bool
      self.set(ethmactxen: value)
      value
    end

    # Ethernet MAC clock enable
    def ethmacen : Bool
      @value.bits_set?(0x2000000_u32)
    end

    # Ethernet MAC clock enable
    def self.ethmacen : Bool
      value.ethmacen
    end

    # Ethernet MAC clock enable
    def self.ethmacen=(value : Bool) : Bool
      self.set(ethmacen: value)
      value
    end

    # DMA2 clock enable
    def dma2_en : Bool
      @value.bits_set?(0x400000_u32)
    end

    # DMA2 clock enable
    def self.dma2_en : Bool
      value.dma2_en
    end

    # DMA2 clock enable
    def self.dma2_en=(value : Bool) : Bool
      self.set(dma2_en: value)
      value
    end

    # DMA1 clock enable
    def dma1_en : Bool
      @value.bits_set?(0x200000_u32)
    end

    # DMA1 clock enable
    def self.dma1_en : Bool
      value.dma1_en
    end

    # DMA1 clock enable
    def self.dma1_en=(value : Bool) : Bool
      self.set(dma1_en: value)
      value
    end

    # CCM data RAM clock enable
    def ccmdataramen : Bool
      @value.bits_set?(0x100000_u32)
    end

    # CCM data RAM clock enable
    def self.ccmdataramen : Bool
      value.ccmdataramen
    end

    # CCM data RAM clock enable
    def self.ccmdataramen=(value : Bool) : Bool
      self.set(ccmdataramen: value)
      value
    end

    # Backup SRAM interface clock              enable
    def bkpsramen : Bool
      @value.bits_set?(0x40000_u32)
    end

    # Backup SRAM interface clock              enable
    def self.bkpsramen : Bool
      value.bkpsramen
    end

    # Backup SRAM interface clock              enable
    def self.bkpsramen=(value : Bool) : Bool
      self.set(bkpsramen: value)
      value
    end

    # CRC clock enable
    def crcen : Bool
      @value.bits_set?(0x1000_u32)
    end

    # CRC clock enable
    def self.crcen : Bool
      value.crcen
    end

    # CRC clock enable
    def self.crcen=(value : Bool) : Bool
      self.set(crcen: value)
      value
    end

    # IO port I clock enable
    def gpioien : Bool
      @value.bits_set?(0x100_u32)
    end

    # IO port I clock enable
    def self.gpioien : Bool
      value.gpioien
    end

    # IO port I clock enable
    def self.gpioien=(value : Bool) : Bool
      self.set(gpioien: value)
      value
    end

    # IO port H clock enable
    def gpiohen : Bool
      @value.bits_set?(0x80_u32)
    end

    # IO port H clock enable
    def self.gpiohen : Bool
      value.gpiohen
    end

    # IO port H clock enable
    def self.gpiohen=(value : Bool) : Bool
      self.set(gpiohen: value)
      value
    end

    # IO port G clock enable
    def gpiogen : Bool
      @value.bits_set?(0x40_u32)
    end

    # IO port G clock enable
    def self.gpiogen : Bool
      value.gpiogen
    end

    # IO port G clock enable
    def self.gpiogen=(value : Bool) : Bool
      self.set(gpiogen: value)
      value
    end

    # IO port F clock enable
    def gpiofen : Bool
      @value.bits_set?(0x20_u32)
    end

    # IO port F clock enable
    def self.gpiofen : Bool
      value.gpiofen
    end

    # IO port F clock enable
    def self.gpiofen=(value : Bool) : Bool
      self.set(gpiofen: value)
      value
    end

    # IO port E clock enable
    def gpioeen : Bool
      @value.bits_set?(0x10_u32)
    end

    # IO port E clock enable
    def self.gpioeen : Bool
      value.gpioeen
    end

    # IO port E clock enable
    def self.gpioeen=(value : Bool) : Bool
      self.set(gpioeen: value)
      value
    end

    # IO port D clock enable
    def gpioden : Bool
      @value.bits_set?(0x8_u32)
    end

    # IO port D clock enable
    def self.gpioden : Bool
      value.gpioden
    end

    # IO port D clock enable
    def self.gpioden=(value : Bool) : Bool
      self.set(gpioden: value)
      value
    end

    # IO port C clock enable
    def gpiocen : Bool
      @value.bits_set?(0x4_u32)
    end

    # IO port C clock enable
    def self.gpiocen : Bool
      value.gpiocen
    end

    # IO port C clock enable
    def self.gpiocen=(value : Bool) : Bool
      self.set(gpiocen: value)
      value
    end

    # IO port B clock enable
    def gpioben : Bool
      @value.bits_set?(0x2_u32)
    end

    # IO port B clock enable
    def self.gpioben : Bool
      value.gpioben
    end

    # IO port B clock enable
    def self.gpioben=(value : Bool) : Bool
      self.set(gpioben: value)
      value
    end

    # IO port A clock enable
    def gpioaen : Bool
      @value.bits_set?(0x1_u32)
    end

    # IO port A clock enable
    def self.gpioaen : Bool
      value.gpioaen
    end

    # IO port A clock enable
    def self.gpioaen=(value : Bool) : Bool
      self.set(gpioaen: value)
      value
    end

    def copy_with(
      *,

      otghsulpien : Bool? = nil,

      otghsen : Bool? = nil,

      ethmacptpen : Bool? = nil,

      ethmacrxen : Bool? = nil,

      ethmactxen : Bool? = nil,

      ethmacen : Bool? = nil,

      dma2_en : Bool? = nil,

      dma1_en : Bool? = nil,

      ccmdataramen : Bool? = nil,

      bkpsramen : Bool? = nil,

      crcen : Bool? = nil,

      gpioien : Bool? = nil,

      gpiohen : Bool? = nil,

      gpiogen : Bool? = nil,

      gpiofen : Bool? = nil,

      gpioeen : Bool? = nil,

      gpioden : Bool? = nil,

      gpiocen : Bool? = nil,

      gpioben : Bool? = nil,

      gpioaen : Bool? = nil
    ) : self
      value = @value

      unless otghsulpien.nil?
        value = (value & 0xbfffffff_u32) |
                UInt32.new!(otghsulpien.to_int).&(0x1_u32) << 30
      end

      unless otghsen.nil?
        value = (value & 0xdfffffff_u32) |
                UInt32.new!(otghsen.to_int).&(0x1_u32) << 29
      end

      unless ethmacptpen.nil?
        value = (value & 0xefffffff_u32) |
                UInt32.new!(ethmacptpen.to_int).&(0x1_u32) << 28
      end

      unless ethmacrxen.nil?
        value = (value & 0xf7ffffff_u32) |
                UInt32.new!(ethmacrxen.to_int).&(0x1_u32) << 27
      end

      unless ethmactxen.nil?
        value = (value & 0xfbffffff_u32) |
                UInt32.new!(ethmactxen.to_int).&(0x1_u32) << 26
      end

      unless ethmacen.nil?
        value = (value & 0xfdffffff_u32) |
                UInt32.new!(ethmacen.to_int).&(0x1_u32) << 25
      end

      unless dma2_en.nil?
        value = (value & 0xffbfffff_u32) |
                UInt32.new!(dma2_en.to_int).&(0x1_u32) << 22
      end

      unless dma1_en.nil?
        value = (value & 0xffdfffff_u32) |
                UInt32.new!(dma1_en.to_int).&(0x1_u32) << 21
      end

      unless ccmdataramen.nil?
        value = (value & 0xffefffff_u32) |
                UInt32.new!(ccmdataramen.to_int).&(0x1_u32) << 20
      end

      unless bkpsramen.nil?
        value = (value & 0xfffbffff_u32) |
                UInt32.new!(bkpsramen.to_int).&(0x1_u32) << 18
      end

      unless crcen.nil?
        value = (value & 0xffffefff_u32) |
                UInt32.new!(crcen.to_int).&(0x1_u32) << 12
      end

      unless gpioien.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(gpioien.to_int).&(0x1_u32) << 8
      end

      unless gpiohen.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(gpiohen.to_int).&(0x1_u32) << 7
      end

      unless gpiogen.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(gpiogen.to_int).&(0x1_u32) << 6
      end

      unless gpiofen.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(gpiofen.to_int).&(0x1_u32) << 5
      end

      unless gpioeen.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(gpioeen.to_int).&(0x1_u32) << 4
      end

      unless gpioden.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(gpioden.to_int).&(0x1_u32) << 3
      end

      unless gpiocen.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(gpiocen.to_int).&(0x1_u32) << 2
      end

      unless gpioben.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(gpioben.to_int).&(0x1_u32) << 1
      end

      unless gpioaen.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(gpioaen.to_int).&(0x1_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      otghsulpien : Bool? = nil,
      otghsen : Bool? = nil,
      ethmacptpen : Bool? = nil,
      ethmacrxen : Bool? = nil,
      ethmactxen : Bool? = nil,
      ethmacen : Bool? = nil,
      dma2_en : Bool? = nil,
      dma1_en : Bool? = nil,
      ccmdataramen : Bool? = nil,
      bkpsramen : Bool? = nil,
      crcen : Bool? = nil,
      gpioien : Bool? = nil,
      gpiohen : Bool? = nil,
      gpiogen : Bool? = nil,
      gpiofen : Bool? = nil,
      gpioeen : Bool? = nil,
      gpioden : Bool? = nil,
      gpiocen : Bool? = nil,
      gpioben : Bool? = nil,
      gpioaen : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        otghsulpien: otghsulpien,
        otghsen: otghsen,
        ethmacptpen: ethmacptpen,
        ethmacrxen: ethmacrxen,
        ethmactxen: ethmactxen,
        ethmacen: ethmacen,
        dma2_en: dma2_en,
        dma1_en: dma1_en,
        ccmdataramen: ccmdataramen,
        bkpsramen: bkpsramen,
        crcen: crcen,
        gpioien: gpioien,
        gpiohen: gpiohen,
        gpiogen: gpiogen,
        gpiofen: gpiofen,
        gpioeen: gpioeen,
        gpioden: gpioden,
        gpiocen: gpiocen,
        gpioben: gpioben,
        gpioaen: gpioaen,
      )
    end
  end # struct

  # AHB2 peripheral clock enable          register
  struct AHB2ENR
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

    # USB OTG FS clock enable
    def otgfsen : Bool
      @value.bits_set?(0x80_u32)
    end

    # USB OTG FS clock enable
    def self.otgfsen : Bool
      value.otgfsen
    end

    # USB OTG FS clock enable
    def self.otgfsen=(value : Bool) : Bool
      self.set(otgfsen: value)
      value
    end

    # Random number generator clock              enable
    def rngen : Bool
      @value.bits_set?(0x40_u32)
    end

    # Random number generator clock              enable
    def self.rngen : Bool
      value.rngen
    end

    # Random number generator clock              enable
    def self.rngen=(value : Bool) : Bool
      self.set(rngen: value)
      value
    end

    # Hash modules clock enable
    def hashen : Bool
      @value.bits_set?(0x20_u32)
    end

    # Hash modules clock enable
    def self.hashen : Bool
      value.hashen
    end

    # Hash modules clock enable
    def self.hashen=(value : Bool) : Bool
      self.set(hashen: value)
      value
    end

    # Cryptographic modules clock              enable
    def crypen : Bool
      @value.bits_set?(0x10_u32)
    end

    # Cryptographic modules clock              enable
    def self.crypen : Bool
      value.crypen
    end

    # Cryptographic modules clock              enable
    def self.crypen=(value : Bool) : Bool
      self.set(crypen: value)
      value
    end

    # Camera interface enable
    def dcmien : Bool
      @value.bits_set?(0x1_u32)
    end

    # Camera interface enable
    def self.dcmien : Bool
      value.dcmien
    end

    # Camera interface enable
    def self.dcmien=(value : Bool) : Bool
      self.set(dcmien: value)
      value
    end

    def copy_with(
      *,

      otgfsen : Bool? = nil,

      rngen : Bool? = nil,

      hashen : Bool? = nil,

      crypen : Bool? = nil,

      dcmien : Bool? = nil
    ) : self
      value = @value

      unless otgfsen.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(otgfsen.to_int).&(0x1_u32) << 7
      end

      unless rngen.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(rngen.to_int).&(0x1_u32) << 6
      end

      unless hashen.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(hashen.to_int).&(0x1_u32) << 5
      end

      unless crypen.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(crypen.to_int).&(0x1_u32) << 4
      end

      unless dcmien.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(dcmien.to_int).&(0x1_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      otgfsen : Bool? = nil,
      rngen : Bool? = nil,
      hashen : Bool? = nil,
      crypen : Bool? = nil,
      dcmien : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        otgfsen: otgfsen,
        rngen: rngen,
        hashen: hashen,
        crypen: crypen,
        dcmien: dcmien,
      )
    end
  end # struct

  # AHB3 peripheral clock enable          register
  struct AHB3ENR
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

    # Flexible memory controller module clock              enable
    def fmcen : Bool
      @value.bits_set?(0x1_u32)
    end

    # Flexible memory controller module clock              enable
    def self.fmcen : Bool
      value.fmcen
    end

    # Flexible memory controller module clock              enable
    def self.fmcen=(value : Bool) : Bool
      self.set(fmcen: value)
      value
    end

    def copy_with(
      *,

      fmcen : Bool? = nil
    ) : self
      value = @value

      unless fmcen.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(fmcen.to_int).&(0x1_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      fmcen : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        fmcen: fmcen,
      )
    end
  end # struct

  # APB1 peripheral clock enable          register
  struct APB1ENR
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

    # TIM2 clock enable
    def tim2_en : Bool
      @value.bits_set?(0x1_u32)
    end

    # TIM2 clock enable
    def self.tim2_en : Bool
      value.tim2_en
    end

    # TIM2 clock enable
    def self.tim2_en=(value : Bool) : Bool
      self.set(tim2_en: value)
      value
    end

    # TIM3 clock enable
    def tim3_en : Bool
      @value.bits_set?(0x2_u32)
    end

    # TIM3 clock enable
    def self.tim3_en : Bool
      value.tim3_en
    end

    # TIM3 clock enable
    def self.tim3_en=(value : Bool) : Bool
      self.set(tim3_en: value)
      value
    end

    # TIM4 clock enable
    def tim4_en : Bool
      @value.bits_set?(0x4_u32)
    end

    # TIM4 clock enable
    def self.tim4_en : Bool
      value.tim4_en
    end

    # TIM4 clock enable
    def self.tim4_en=(value : Bool) : Bool
      self.set(tim4_en: value)
      value
    end

    # TIM5 clock enable
    def tim5_en : Bool
      @value.bits_set?(0x8_u32)
    end

    # TIM5 clock enable
    def self.tim5_en : Bool
      value.tim5_en
    end

    # TIM5 clock enable
    def self.tim5_en=(value : Bool) : Bool
      self.set(tim5_en: value)
      value
    end

    # TIM6 clock enable
    def tim6_en : Bool
      @value.bits_set?(0x10_u32)
    end

    # TIM6 clock enable
    def self.tim6_en : Bool
      value.tim6_en
    end

    # TIM6 clock enable
    def self.tim6_en=(value : Bool) : Bool
      self.set(tim6_en: value)
      value
    end

    # TIM7 clock enable
    def tim7_en : Bool
      @value.bits_set?(0x20_u32)
    end

    # TIM7 clock enable
    def self.tim7_en : Bool
      value.tim7_en
    end

    # TIM7 clock enable
    def self.tim7_en=(value : Bool) : Bool
      self.set(tim7_en: value)
      value
    end

    # TIM12 clock enable
    def tim12_en : Bool
      @value.bits_set?(0x40_u32)
    end

    # TIM12 clock enable
    def self.tim12_en : Bool
      value.tim12_en
    end

    # TIM12 clock enable
    def self.tim12_en=(value : Bool) : Bool
      self.set(tim12_en: value)
      value
    end

    # TIM13 clock enable
    def tim13_en : Bool
      @value.bits_set?(0x80_u32)
    end

    # TIM13 clock enable
    def self.tim13_en : Bool
      value.tim13_en
    end

    # TIM13 clock enable
    def self.tim13_en=(value : Bool) : Bool
      self.set(tim13_en: value)
      value
    end

    # TIM14 clock enable
    def tim14_en : Bool
      @value.bits_set?(0x100_u32)
    end

    # TIM14 clock enable
    def self.tim14_en : Bool
      value.tim14_en
    end

    # TIM14 clock enable
    def self.tim14_en=(value : Bool) : Bool
      self.set(tim14_en: value)
      value
    end

    # Window watchdog clock              enable
    def wwdgen : Bool
      @value.bits_set?(0x800_u32)
    end

    # Window watchdog clock              enable
    def self.wwdgen : Bool
      value.wwdgen
    end

    # Window watchdog clock              enable
    def self.wwdgen=(value : Bool) : Bool
      self.set(wwdgen: value)
      value
    end

    # SPI2 clock enable
    def spi2_en : Bool
      @value.bits_set?(0x4000_u32)
    end

    # SPI2 clock enable
    def self.spi2_en : Bool
      value.spi2_en
    end

    # SPI2 clock enable
    def self.spi2_en=(value : Bool) : Bool
      self.set(spi2_en: value)
      value
    end

    # SPI3 clock enable
    def spi3_en : Bool
      @value.bits_set?(0x8000_u32)
    end

    # SPI3 clock enable
    def self.spi3_en : Bool
      value.spi3_en
    end

    # SPI3 clock enable
    def self.spi3_en=(value : Bool) : Bool
      self.set(spi3_en: value)
      value
    end

    # USART 2 clock enable
    def usart2_en : Bool
      @value.bits_set?(0x20000_u32)
    end

    # USART 2 clock enable
    def self.usart2_en : Bool
      value.usart2_en
    end

    # USART 2 clock enable
    def self.usart2_en=(value : Bool) : Bool
      self.set(usart2_en: value)
      value
    end

    # USART3 clock enable
    def usart3_en : Bool
      @value.bits_set?(0x40000_u32)
    end

    # USART3 clock enable
    def self.usart3_en : Bool
      value.usart3_en
    end

    # USART3 clock enable
    def self.usart3_en=(value : Bool) : Bool
      self.set(usart3_en: value)
      value
    end

    # UART4 clock enable
    def uart4_en : Bool
      @value.bits_set?(0x80000_u32)
    end

    # UART4 clock enable
    def self.uart4_en : Bool
      value.uart4_en
    end

    # UART4 clock enable
    def self.uart4_en=(value : Bool) : Bool
      self.set(uart4_en: value)
      value
    end

    # UART5 clock enable
    def uart5_en : Bool
      @value.bits_set?(0x100000_u32)
    end

    # UART5 clock enable
    def self.uart5_en : Bool
      value.uart5_en
    end

    # UART5 clock enable
    def self.uart5_en=(value : Bool) : Bool
      self.set(uart5_en: value)
      value
    end

    # I2C1 clock enable
    def i2_c1_en : Bool
      @value.bits_set?(0x200000_u32)
    end

    # I2C1 clock enable
    def self.i2_c1_en : Bool
      value.i2_c1_en
    end

    # I2C1 clock enable
    def self.i2_c1_en=(value : Bool) : Bool
      self.set(i2_c1_en: value)
      value
    end

    # I2C2 clock enable
    def i2_c2_en : Bool
      @value.bits_set?(0x400000_u32)
    end

    # I2C2 clock enable
    def self.i2_c2_en : Bool
      value.i2_c2_en
    end

    # I2C2 clock enable
    def self.i2_c2_en=(value : Bool) : Bool
      self.set(i2_c2_en: value)
      value
    end

    # I2C3 clock enable
    def i2_c3_en : Bool
      @value.bits_set?(0x800000_u32)
    end

    # I2C3 clock enable
    def self.i2_c3_en : Bool
      value.i2_c3_en
    end

    # I2C3 clock enable
    def self.i2_c3_en=(value : Bool) : Bool
      self.set(i2_c3_en: value)
      value
    end

    # CAN 1 clock enable
    def can1_en : Bool
      @value.bits_set?(0x2000000_u32)
    end

    # CAN 1 clock enable
    def self.can1_en : Bool
      value.can1_en
    end

    # CAN 1 clock enable
    def self.can1_en=(value : Bool) : Bool
      self.set(can1_en: value)
      value
    end

    # CAN 2 clock enable
    def can2_en : Bool
      @value.bits_set?(0x4000000_u32)
    end

    # CAN 2 clock enable
    def self.can2_en : Bool
      value.can2_en
    end

    # CAN 2 clock enable
    def self.can2_en=(value : Bool) : Bool
      self.set(can2_en: value)
      value
    end

    # Power interface clock              enable
    def pwren : Bool
      @value.bits_set?(0x10000000_u32)
    end

    # Power interface clock              enable
    def self.pwren : Bool
      value.pwren
    end

    # Power interface clock              enable
    def self.pwren=(value : Bool) : Bool
      self.set(pwren: value)
      value
    end

    # DAC interface clock enable
    def dacen : Bool
      @value.bits_set?(0x20000000_u32)
    end

    # DAC interface clock enable
    def self.dacen : Bool
      value.dacen
    end

    # DAC interface clock enable
    def self.dacen=(value : Bool) : Bool
      self.set(dacen: value)
      value
    end

    def copy_with(
      *,

      tim2_en : Bool? = nil,

      tim3_en : Bool? = nil,

      tim4_en : Bool? = nil,

      tim5_en : Bool? = nil,

      tim6_en : Bool? = nil,

      tim7_en : Bool? = nil,

      tim12_en : Bool? = nil,

      tim13_en : Bool? = nil,

      tim14_en : Bool? = nil,

      wwdgen : Bool? = nil,

      spi2_en : Bool? = nil,

      spi3_en : Bool? = nil,

      usart2_en : Bool? = nil,

      usart3_en : Bool? = nil,

      uart4_en : Bool? = nil,

      uart5_en : Bool? = nil,

      i2_c1_en : Bool? = nil,

      i2_c2_en : Bool? = nil,

      i2_c3_en : Bool? = nil,

      can1_en : Bool? = nil,

      can2_en : Bool? = nil,

      pwren : Bool? = nil,

      dacen : Bool? = nil
    ) : self
      value = @value

      unless tim2_en.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(tim2_en.to_int).&(0x1_u32) << 0
      end

      unless tim3_en.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(tim3_en.to_int).&(0x1_u32) << 1
      end

      unless tim4_en.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(tim4_en.to_int).&(0x1_u32) << 2
      end

      unless tim5_en.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(tim5_en.to_int).&(0x1_u32) << 3
      end

      unless tim6_en.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(tim6_en.to_int).&(0x1_u32) << 4
      end

      unless tim7_en.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(tim7_en.to_int).&(0x1_u32) << 5
      end

      unless tim12_en.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(tim12_en.to_int).&(0x1_u32) << 6
      end

      unless tim13_en.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(tim13_en.to_int).&(0x1_u32) << 7
      end

      unless tim14_en.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(tim14_en.to_int).&(0x1_u32) << 8
      end

      unless wwdgen.nil?
        value = (value & 0xfffff7ff_u32) |
                UInt32.new!(wwdgen.to_int).&(0x1_u32) << 11
      end

      unless spi2_en.nil?
        value = (value & 0xffffbfff_u32) |
                UInt32.new!(spi2_en.to_int).&(0x1_u32) << 14
      end

      unless spi3_en.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(spi3_en.to_int).&(0x1_u32) << 15
      end

      unless usart2_en.nil?
        value = (value & 0xfffdffff_u32) |
                UInt32.new!(usart2_en.to_int).&(0x1_u32) << 17
      end

      unless usart3_en.nil?
        value = (value & 0xfffbffff_u32) |
                UInt32.new!(usart3_en.to_int).&(0x1_u32) << 18
      end

      unless uart4_en.nil?
        value = (value & 0xfff7ffff_u32) |
                UInt32.new!(uart4_en.to_int).&(0x1_u32) << 19
      end

      unless uart5_en.nil?
        value = (value & 0xffefffff_u32) |
                UInt32.new!(uart5_en.to_int).&(0x1_u32) << 20
      end

      unless i2_c1_en.nil?
        value = (value & 0xffdfffff_u32) |
                UInt32.new!(i2_c1_en.to_int).&(0x1_u32) << 21
      end

      unless i2_c2_en.nil?
        value = (value & 0xffbfffff_u32) |
                UInt32.new!(i2_c2_en.to_int).&(0x1_u32) << 22
      end

      unless i2_c3_en.nil?
        value = (value & 0xff7fffff_u32) |
                UInt32.new!(i2_c3_en.to_int).&(0x1_u32) << 23
      end

      unless can1_en.nil?
        value = (value & 0xfdffffff_u32) |
                UInt32.new!(can1_en.to_int).&(0x1_u32) << 25
      end

      unless can2_en.nil?
        value = (value & 0xfbffffff_u32) |
                UInt32.new!(can2_en.to_int).&(0x1_u32) << 26
      end

      unless pwren.nil?
        value = (value & 0xefffffff_u32) |
                UInt32.new!(pwren.to_int).&(0x1_u32) << 28
      end

      unless dacen.nil?
        value = (value & 0xdfffffff_u32) |
                UInt32.new!(dacen.to_int).&(0x1_u32) << 29
      end

      self.class.new(value)
    end

    def self.set(
      *,
      tim2_en : Bool? = nil,
      tim3_en : Bool? = nil,
      tim4_en : Bool? = nil,
      tim5_en : Bool? = nil,
      tim6_en : Bool? = nil,
      tim7_en : Bool? = nil,
      tim12_en : Bool? = nil,
      tim13_en : Bool? = nil,
      tim14_en : Bool? = nil,
      wwdgen : Bool? = nil,
      spi2_en : Bool? = nil,
      spi3_en : Bool? = nil,
      usart2_en : Bool? = nil,
      usart3_en : Bool? = nil,
      uart4_en : Bool? = nil,
      uart5_en : Bool? = nil,
      i2_c1_en : Bool? = nil,
      i2_c2_en : Bool? = nil,
      i2_c3_en : Bool? = nil,
      can1_en : Bool? = nil,
      can2_en : Bool? = nil,
      pwren : Bool? = nil,
      dacen : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        tim2_en: tim2_en,
        tim3_en: tim3_en,
        tim4_en: tim4_en,
        tim5_en: tim5_en,
        tim6_en: tim6_en,
        tim7_en: tim7_en,
        tim12_en: tim12_en,
        tim13_en: tim13_en,
        tim14_en: tim14_en,
        wwdgen: wwdgen,
        spi2_en: spi2_en,
        spi3_en: spi3_en,
        usart2_en: usart2_en,
        usart3_en: usart3_en,
        uart4_en: uart4_en,
        uart5_en: uart5_en,
        i2_c1_en: i2_c1_en,
        i2_c2_en: i2_c2_en,
        i2_c3_en: i2_c3_en,
        can1_en: can1_en,
        can2_en: can2_en,
        pwren: pwren,
        dacen: dacen,
      )
    end
  end # struct

  # APB2 peripheral clock enable          register
  struct APB2ENR
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

    # TIM1 clock enable
    def tim1_en : Bool
      @value.bits_set?(0x1_u32)
    end

    # TIM1 clock enable
    def self.tim1_en : Bool
      value.tim1_en
    end

    # TIM1 clock enable
    def self.tim1_en=(value : Bool) : Bool
      self.set(tim1_en: value)
      value
    end

    # TIM8 clock enable
    def tim8_en : Bool
      @value.bits_set?(0x2_u32)
    end

    # TIM8 clock enable
    def self.tim8_en : Bool
      value.tim8_en
    end

    # TIM8 clock enable
    def self.tim8_en=(value : Bool) : Bool
      self.set(tim8_en: value)
      value
    end

    # USART1 clock enable
    def usart1_en : Bool
      @value.bits_set?(0x10_u32)
    end

    # USART1 clock enable
    def self.usart1_en : Bool
      value.usart1_en
    end

    # USART1 clock enable
    def self.usart1_en=(value : Bool) : Bool
      self.set(usart1_en: value)
      value
    end

    # USART6 clock enable
    def usart6_en : Bool
      @value.bits_set?(0x20_u32)
    end

    # USART6 clock enable
    def self.usart6_en : Bool
      value.usart6_en
    end

    # USART6 clock enable
    def self.usart6_en=(value : Bool) : Bool
      self.set(usart6_en: value)
      value
    end

    # ADC1 clock enable
    def adc1_en : Bool
      @value.bits_set?(0x100_u32)
    end

    # ADC1 clock enable
    def self.adc1_en : Bool
      value.adc1_en
    end

    # ADC1 clock enable
    def self.adc1_en=(value : Bool) : Bool
      self.set(adc1_en: value)
      value
    end

    # ADC2 clock enable
    def adc2_en : Bool
      @value.bits_set?(0x200_u32)
    end

    # ADC2 clock enable
    def self.adc2_en : Bool
      value.adc2_en
    end

    # ADC2 clock enable
    def self.adc2_en=(value : Bool) : Bool
      self.set(adc2_en: value)
      value
    end

    # ADC3 clock enable
    def adc3_en : Bool
      @value.bits_set?(0x400_u32)
    end

    # ADC3 clock enable
    def self.adc3_en : Bool
      value.adc3_en
    end

    # ADC3 clock enable
    def self.adc3_en=(value : Bool) : Bool
      self.set(adc3_en: value)
      value
    end

    # SDIO clock enable
    def sdioen : Bool
      @value.bits_set?(0x800_u32)
    end

    # SDIO clock enable
    def self.sdioen : Bool
      value.sdioen
    end

    # SDIO clock enable
    def self.sdioen=(value : Bool) : Bool
      self.set(sdioen: value)
      value
    end

    # SPI1 clock enable
    def spi1_en : Bool
      @value.bits_set?(0x1000_u32)
    end

    # SPI1 clock enable
    def self.spi1_en : Bool
      value.spi1_en
    end

    # SPI1 clock enable
    def self.spi1_en=(value : Bool) : Bool
      self.set(spi1_en: value)
      value
    end

    # System configuration controller clock              enable
    def syscfgen : Bool
      @value.bits_set?(0x4000_u32)
    end

    # System configuration controller clock              enable
    def self.syscfgen : Bool
      value.syscfgen
    end

    # System configuration controller clock              enable
    def self.syscfgen=(value : Bool) : Bool
      self.set(syscfgen: value)
      value
    end

    # TIM9 clock enable
    def tim9_en : Bool
      @value.bits_set?(0x10000_u32)
    end

    # TIM9 clock enable
    def self.tim9_en : Bool
      value.tim9_en
    end

    # TIM9 clock enable
    def self.tim9_en=(value : Bool) : Bool
      self.set(tim9_en: value)
      value
    end

    # TIM10 clock enable
    def tim10_en : Bool
      @value.bits_set?(0x20000_u32)
    end

    # TIM10 clock enable
    def self.tim10_en : Bool
      value.tim10_en
    end

    # TIM10 clock enable
    def self.tim10_en=(value : Bool) : Bool
      self.set(tim10_en: value)
      value
    end

    # TIM11 clock enable
    def tim11_en : Bool
      @value.bits_set?(0x40000_u32)
    end

    # TIM11 clock enable
    def self.tim11_en : Bool
      value.tim11_en
    end

    # TIM11 clock enable
    def self.tim11_en=(value : Bool) : Bool
      self.set(tim11_en: value)
      value
    end

    def copy_with(
      *,

      tim1_en : Bool? = nil,

      tim8_en : Bool? = nil,

      usart1_en : Bool? = nil,

      usart6_en : Bool? = nil,

      adc1_en : Bool? = nil,

      adc2_en : Bool? = nil,

      adc3_en : Bool? = nil,

      sdioen : Bool? = nil,

      spi1_en : Bool? = nil,

      syscfgen : Bool? = nil,

      tim9_en : Bool? = nil,

      tim10_en : Bool? = nil,

      tim11_en : Bool? = nil
    ) : self
      value = @value

      unless tim1_en.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(tim1_en.to_int).&(0x1_u32) << 0
      end

      unless tim8_en.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(tim8_en.to_int).&(0x1_u32) << 1
      end

      unless usart1_en.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(usart1_en.to_int).&(0x1_u32) << 4
      end

      unless usart6_en.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(usart6_en.to_int).&(0x1_u32) << 5
      end

      unless adc1_en.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(adc1_en.to_int).&(0x1_u32) << 8
      end

      unless adc2_en.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(adc2_en.to_int).&(0x1_u32) << 9
      end

      unless adc3_en.nil?
        value = (value & 0xfffffbff_u32) |
                UInt32.new!(adc3_en.to_int).&(0x1_u32) << 10
      end

      unless sdioen.nil?
        value = (value & 0xfffff7ff_u32) |
                UInt32.new!(sdioen.to_int).&(0x1_u32) << 11
      end

      unless spi1_en.nil?
        value = (value & 0xffffefff_u32) |
                UInt32.new!(spi1_en.to_int).&(0x1_u32) << 12
      end

      unless syscfgen.nil?
        value = (value & 0xffffbfff_u32) |
                UInt32.new!(syscfgen.to_int).&(0x1_u32) << 14
      end

      unless tim9_en.nil?
        value = (value & 0xfffeffff_u32) |
                UInt32.new!(tim9_en.to_int).&(0x1_u32) << 16
      end

      unless tim10_en.nil?
        value = (value & 0xfffdffff_u32) |
                UInt32.new!(tim10_en.to_int).&(0x1_u32) << 17
      end

      unless tim11_en.nil?
        value = (value & 0xfffbffff_u32) |
                UInt32.new!(tim11_en.to_int).&(0x1_u32) << 18
      end

      self.class.new(value)
    end

    def self.set(
      *,
      tim1_en : Bool? = nil,
      tim8_en : Bool? = nil,
      usart1_en : Bool? = nil,
      usart6_en : Bool? = nil,
      adc1_en : Bool? = nil,
      adc2_en : Bool? = nil,
      adc3_en : Bool? = nil,
      sdioen : Bool? = nil,
      spi1_en : Bool? = nil,
      syscfgen : Bool? = nil,
      tim9_en : Bool? = nil,
      tim10_en : Bool? = nil,
      tim11_en : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        tim1_en: tim1_en,
        tim8_en: tim8_en,
        usart1_en: usart1_en,
        usart6_en: usart6_en,
        adc1_en: adc1_en,
        adc2_en: adc2_en,
        adc3_en: adc3_en,
        sdioen: sdioen,
        spi1_en: spi1_en,
        syscfgen: syscfgen,
        tim9_en: tim9_en,
        tim10_en: tim10_en,
        tim11_en: tim11_en,
      )
    end
  end # struct

  # AHB1 peripheral clock enable in low power          mode register
  struct AHB1LPENR
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
      new(0x7e6791ff_u64)
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

    # IO port A clock enable during sleep              mode
    def gpioalpen : Bool
      @value.bits_set?(0x1_u32)
    end

    # IO port A clock enable during sleep              mode
    def self.gpioalpen : Bool
      value.gpioalpen
    end

    # IO port A clock enable during sleep              mode
    def self.gpioalpen=(value : Bool) : Bool
      self.set(gpioalpen: value)
      value
    end

    # IO port B clock enable during Sleep              mode
    def gpioblpen : Bool
      @value.bits_set?(0x2_u32)
    end

    # IO port B clock enable during Sleep              mode
    def self.gpioblpen : Bool
      value.gpioblpen
    end

    # IO port B clock enable during Sleep              mode
    def self.gpioblpen=(value : Bool) : Bool
      self.set(gpioblpen: value)
      value
    end

    # IO port C clock enable during Sleep              mode
    def gpioclpen : Bool
      @value.bits_set?(0x4_u32)
    end

    # IO port C clock enable during Sleep              mode
    def self.gpioclpen : Bool
      value.gpioclpen
    end

    # IO port C clock enable during Sleep              mode
    def self.gpioclpen=(value : Bool) : Bool
      self.set(gpioclpen: value)
      value
    end

    # IO port D clock enable during Sleep              mode
    def gpiodlpen : Bool
      @value.bits_set?(0x8_u32)
    end

    # IO port D clock enable during Sleep              mode
    def self.gpiodlpen : Bool
      value.gpiodlpen
    end

    # IO port D clock enable during Sleep              mode
    def self.gpiodlpen=(value : Bool) : Bool
      self.set(gpiodlpen: value)
      value
    end

    # IO port E clock enable during Sleep              mode
    def gpioelpen : Bool
      @value.bits_set?(0x10_u32)
    end

    # IO port E clock enable during Sleep              mode
    def self.gpioelpen : Bool
      value.gpioelpen
    end

    # IO port E clock enable during Sleep              mode
    def self.gpioelpen=(value : Bool) : Bool
      self.set(gpioelpen: value)
      value
    end

    # IO port F clock enable during Sleep              mode
    def gpioflpen : Bool
      @value.bits_set?(0x20_u32)
    end

    # IO port F clock enable during Sleep              mode
    def self.gpioflpen : Bool
      value.gpioflpen
    end

    # IO port F clock enable during Sleep              mode
    def self.gpioflpen=(value : Bool) : Bool
      self.set(gpioflpen: value)
      value
    end

    # IO port G clock enable during Sleep              mode
    def gpioglpen : Bool
      @value.bits_set?(0x40_u32)
    end

    # IO port G clock enable during Sleep              mode
    def self.gpioglpen : Bool
      value.gpioglpen
    end

    # IO port G clock enable during Sleep              mode
    def self.gpioglpen=(value : Bool) : Bool
      self.set(gpioglpen: value)
      value
    end

    # IO port H clock enable during Sleep              mode
    def gpiohlpen : Bool
      @value.bits_set?(0x80_u32)
    end

    # IO port H clock enable during Sleep              mode
    def self.gpiohlpen : Bool
      value.gpiohlpen
    end

    # IO port H clock enable during Sleep              mode
    def self.gpiohlpen=(value : Bool) : Bool
      self.set(gpiohlpen: value)
      value
    end

    # IO port I clock enable during Sleep              mode
    def gpioilpen : Bool
      @value.bits_set?(0x100_u32)
    end

    # IO port I clock enable during Sleep              mode
    def self.gpioilpen : Bool
      value.gpioilpen
    end

    # IO port I clock enable during Sleep              mode
    def self.gpioilpen=(value : Bool) : Bool
      self.set(gpioilpen: value)
      value
    end

    # CRC clock enable during Sleep              mode
    def crclpen : Bool
      @value.bits_set?(0x1000_u32)
    end

    # CRC clock enable during Sleep              mode
    def self.crclpen : Bool
      value.crclpen
    end

    # CRC clock enable during Sleep              mode
    def self.crclpen=(value : Bool) : Bool
      self.set(crclpen: value)
      value
    end

    # Flash interface clock enable during              Sleep mode
    def flitflpen : Bool
      @value.bits_set?(0x8000_u32)
    end

    # Flash interface clock enable during              Sleep mode
    def self.flitflpen : Bool
      value.flitflpen
    end

    # Flash interface clock enable during              Sleep mode
    def self.flitflpen=(value : Bool) : Bool
      self.set(flitflpen: value)
      value
    end

    # SRAM 1interface clock enable during              Sleep mode
    def sram1_lpen : Bool
      @value.bits_set?(0x10000_u32)
    end

    # SRAM 1interface clock enable during              Sleep mode
    def self.sram1_lpen : Bool
      value.sram1_lpen
    end

    # SRAM 1interface clock enable during              Sleep mode
    def self.sram1_lpen=(value : Bool) : Bool
      self.set(sram1_lpen: value)
      value
    end

    # SRAM 2 interface clock enable during              Sleep mode
    def sram2_lpen : Bool
      @value.bits_set?(0x20000_u32)
    end

    # SRAM 2 interface clock enable during              Sleep mode
    def self.sram2_lpen : Bool
      value.sram2_lpen
    end

    # SRAM 2 interface clock enable during              Sleep mode
    def self.sram2_lpen=(value : Bool) : Bool
      self.set(sram2_lpen: value)
      value
    end

    # Backup SRAM interface clock enable              during Sleep mode
    def bkpsramlpen : Bool
      @value.bits_set?(0x40000_u32)
    end

    # Backup SRAM interface clock enable              during Sleep mode
    def self.bkpsramlpen : Bool
      value.bkpsramlpen
    end

    # Backup SRAM interface clock enable              during Sleep mode
    def self.bkpsramlpen=(value : Bool) : Bool
      self.set(bkpsramlpen: value)
      value
    end

    # DMA1 clock enable during Sleep              mode
    def dma1_lpen : Bool
      @value.bits_set?(0x200000_u32)
    end

    # DMA1 clock enable during Sleep              mode
    def self.dma1_lpen : Bool
      value.dma1_lpen
    end

    # DMA1 clock enable during Sleep              mode
    def self.dma1_lpen=(value : Bool) : Bool
      self.set(dma1_lpen: value)
      value
    end

    # DMA2 clock enable during Sleep              mode
    def dma2_lpen : Bool
      @value.bits_set?(0x400000_u32)
    end

    # DMA2 clock enable during Sleep              mode
    def self.dma2_lpen : Bool
      value.dma2_lpen
    end

    # DMA2 clock enable during Sleep              mode
    def self.dma2_lpen=(value : Bool) : Bool
      self.set(dma2_lpen: value)
      value
    end

    # Ethernet MAC clock enable during Sleep              mode
    def ethmaclpen : Bool
      @value.bits_set?(0x2000000_u32)
    end

    # Ethernet MAC clock enable during Sleep              mode
    def self.ethmaclpen : Bool
      value.ethmaclpen
    end

    # Ethernet MAC clock enable during Sleep              mode
    def self.ethmaclpen=(value : Bool) : Bool
      self.set(ethmaclpen: value)
      value
    end

    # Ethernet transmission clock enable              during Sleep mode
    def ethmactxlpen : Bool
      @value.bits_set?(0x4000000_u32)
    end

    # Ethernet transmission clock enable              during Sleep mode
    def self.ethmactxlpen : Bool
      value.ethmactxlpen
    end

    # Ethernet transmission clock enable              during Sleep mode
    def self.ethmactxlpen=(value : Bool) : Bool
      self.set(ethmactxlpen: value)
      value
    end

    # Ethernet reception clock enable during              Sleep mode
    def ethmacrxlpen : Bool
      @value.bits_set?(0x8000000_u32)
    end

    # Ethernet reception clock enable during              Sleep mode
    def self.ethmacrxlpen : Bool
      value.ethmacrxlpen
    end

    # Ethernet reception clock enable during              Sleep mode
    def self.ethmacrxlpen=(value : Bool) : Bool
      self.set(ethmacrxlpen: value)
      value
    end

    # Ethernet PTP clock enable during Sleep              mode
    def ethmacptplpen : Bool
      @value.bits_set?(0x10000000_u32)
    end

    # Ethernet PTP clock enable during Sleep              mode
    def self.ethmacptplpen : Bool
      value.ethmacptplpen
    end

    # Ethernet PTP clock enable during Sleep              mode
    def self.ethmacptplpen=(value : Bool) : Bool
      self.set(ethmacptplpen: value)
      value
    end

    # USB OTG HS clock enable during Sleep              mode
    def otghslpen : Bool
      @value.bits_set?(0x20000000_u32)
    end

    # USB OTG HS clock enable during Sleep              mode
    def self.otghslpen : Bool
      value.otghslpen
    end

    # USB OTG HS clock enable during Sleep              mode
    def self.otghslpen=(value : Bool) : Bool
      self.set(otghslpen: value)
      value
    end

    # USB OTG HS ULPI clock enable during              Sleep mode
    def otghsulpilpen : Bool
      @value.bits_set?(0x40000000_u32)
    end

    # USB OTG HS ULPI clock enable during              Sleep mode
    def self.otghsulpilpen : Bool
      value.otghsulpilpen
    end

    # USB OTG HS ULPI clock enable during              Sleep mode
    def self.otghsulpilpen=(value : Bool) : Bool
      self.set(otghsulpilpen: value)
      value
    end

    def copy_with(
      *,

      gpioalpen : Bool? = nil,

      gpioblpen : Bool? = nil,

      gpioclpen : Bool? = nil,

      gpiodlpen : Bool? = nil,

      gpioelpen : Bool? = nil,

      gpioflpen : Bool? = nil,

      gpioglpen : Bool? = nil,

      gpiohlpen : Bool? = nil,

      gpioilpen : Bool? = nil,

      crclpen : Bool? = nil,

      flitflpen : Bool? = nil,

      sram1_lpen : Bool? = nil,

      sram2_lpen : Bool? = nil,

      bkpsramlpen : Bool? = nil,

      dma1_lpen : Bool? = nil,

      dma2_lpen : Bool? = nil,

      ethmaclpen : Bool? = nil,

      ethmactxlpen : Bool? = nil,

      ethmacrxlpen : Bool? = nil,

      ethmacptplpen : Bool? = nil,

      otghslpen : Bool? = nil,

      otghsulpilpen : Bool? = nil
    ) : self
      value = @value

      unless gpioalpen.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(gpioalpen.to_int).&(0x1_u32) << 0
      end

      unless gpioblpen.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(gpioblpen.to_int).&(0x1_u32) << 1
      end

      unless gpioclpen.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(gpioclpen.to_int).&(0x1_u32) << 2
      end

      unless gpiodlpen.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(gpiodlpen.to_int).&(0x1_u32) << 3
      end

      unless gpioelpen.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(gpioelpen.to_int).&(0x1_u32) << 4
      end

      unless gpioflpen.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(gpioflpen.to_int).&(0x1_u32) << 5
      end

      unless gpioglpen.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(gpioglpen.to_int).&(0x1_u32) << 6
      end

      unless gpiohlpen.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(gpiohlpen.to_int).&(0x1_u32) << 7
      end

      unless gpioilpen.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(gpioilpen.to_int).&(0x1_u32) << 8
      end

      unless crclpen.nil?
        value = (value & 0xffffefff_u32) |
                UInt32.new!(crclpen.to_int).&(0x1_u32) << 12
      end

      unless flitflpen.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(flitflpen.to_int).&(0x1_u32) << 15
      end

      unless sram1_lpen.nil?
        value = (value & 0xfffeffff_u32) |
                UInt32.new!(sram1_lpen.to_int).&(0x1_u32) << 16
      end

      unless sram2_lpen.nil?
        value = (value & 0xfffdffff_u32) |
                UInt32.new!(sram2_lpen.to_int).&(0x1_u32) << 17
      end

      unless bkpsramlpen.nil?
        value = (value & 0xfffbffff_u32) |
                UInt32.new!(bkpsramlpen.to_int).&(0x1_u32) << 18
      end

      unless dma1_lpen.nil?
        value = (value & 0xffdfffff_u32) |
                UInt32.new!(dma1_lpen.to_int).&(0x1_u32) << 21
      end

      unless dma2_lpen.nil?
        value = (value & 0xffbfffff_u32) |
                UInt32.new!(dma2_lpen.to_int).&(0x1_u32) << 22
      end

      unless ethmaclpen.nil?
        value = (value & 0xfdffffff_u32) |
                UInt32.new!(ethmaclpen.to_int).&(0x1_u32) << 25
      end

      unless ethmactxlpen.nil?
        value = (value & 0xfbffffff_u32) |
                UInt32.new!(ethmactxlpen.to_int).&(0x1_u32) << 26
      end

      unless ethmacrxlpen.nil?
        value = (value & 0xf7ffffff_u32) |
                UInt32.new!(ethmacrxlpen.to_int).&(0x1_u32) << 27
      end

      unless ethmacptplpen.nil?
        value = (value & 0xefffffff_u32) |
                UInt32.new!(ethmacptplpen.to_int).&(0x1_u32) << 28
      end

      unless otghslpen.nil?
        value = (value & 0xdfffffff_u32) |
                UInt32.new!(otghslpen.to_int).&(0x1_u32) << 29
      end

      unless otghsulpilpen.nil?
        value = (value & 0xbfffffff_u32) |
                UInt32.new!(otghsulpilpen.to_int).&(0x1_u32) << 30
      end

      self.class.new(value)
    end

    def self.set(
      *,
      gpioalpen : Bool? = nil,
      gpioblpen : Bool? = nil,
      gpioclpen : Bool? = nil,
      gpiodlpen : Bool? = nil,
      gpioelpen : Bool? = nil,
      gpioflpen : Bool? = nil,
      gpioglpen : Bool? = nil,
      gpiohlpen : Bool? = nil,
      gpioilpen : Bool? = nil,
      crclpen : Bool? = nil,
      flitflpen : Bool? = nil,
      sram1_lpen : Bool? = nil,
      sram2_lpen : Bool? = nil,
      bkpsramlpen : Bool? = nil,
      dma1_lpen : Bool? = nil,
      dma2_lpen : Bool? = nil,
      ethmaclpen : Bool? = nil,
      ethmactxlpen : Bool? = nil,
      ethmacrxlpen : Bool? = nil,
      ethmacptplpen : Bool? = nil,
      otghslpen : Bool? = nil,
      otghsulpilpen : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        gpioalpen: gpioalpen,
        gpioblpen: gpioblpen,
        gpioclpen: gpioclpen,
        gpiodlpen: gpiodlpen,
        gpioelpen: gpioelpen,
        gpioflpen: gpioflpen,
        gpioglpen: gpioglpen,
        gpiohlpen: gpiohlpen,
        gpioilpen: gpioilpen,
        crclpen: crclpen,
        flitflpen: flitflpen,
        sram1_lpen: sram1_lpen,
        sram2_lpen: sram2_lpen,
        bkpsramlpen: bkpsramlpen,
        dma1_lpen: dma1_lpen,
        dma2_lpen: dma2_lpen,
        ethmaclpen: ethmaclpen,
        ethmactxlpen: ethmactxlpen,
        ethmacrxlpen: ethmacrxlpen,
        ethmacptplpen: ethmacptplpen,
        otghslpen: otghslpen,
        otghsulpilpen: otghsulpilpen,
      )
    end
  end # struct

  # AHB2 peripheral clock enable in low power          mode register
  struct AHB2LPENR
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
      new(0xf1_u64)
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

    # USB OTG FS clock enable during Sleep              mode
    def otgfslpen : Bool
      @value.bits_set?(0x80_u32)
    end

    # USB OTG FS clock enable during Sleep              mode
    def self.otgfslpen : Bool
      value.otgfslpen
    end

    # USB OTG FS clock enable during Sleep              mode
    def self.otgfslpen=(value : Bool) : Bool
      self.set(otgfslpen: value)
      value
    end

    # Random number generator clock enable              during Sleep mode
    def rnglpen : Bool
      @value.bits_set?(0x40_u32)
    end

    # Random number generator clock enable              during Sleep mode
    def self.rnglpen : Bool
      value.rnglpen
    end

    # Random number generator clock enable              during Sleep mode
    def self.rnglpen=(value : Bool) : Bool
      self.set(rnglpen: value)
      value
    end

    # Hash modules clock enable during Sleep              mode
    def hashlpen : Bool
      @value.bits_set?(0x20_u32)
    end

    # Hash modules clock enable during Sleep              mode
    def self.hashlpen : Bool
      value.hashlpen
    end

    # Hash modules clock enable during Sleep              mode
    def self.hashlpen=(value : Bool) : Bool
      self.set(hashlpen: value)
      value
    end

    # Cryptography modules clock enable during              Sleep mode
    def cryplpen : Bool
      @value.bits_set?(0x10_u32)
    end

    # Cryptography modules clock enable during              Sleep mode
    def self.cryplpen : Bool
      value.cryplpen
    end

    # Cryptography modules clock enable during              Sleep mode
    def self.cryplpen=(value : Bool) : Bool
      self.set(cryplpen: value)
      value
    end

    # Camera interface enable during Sleep              mode
    def dcmilpen : Bool
      @value.bits_set?(0x1_u32)
    end

    # Camera interface enable during Sleep              mode
    def self.dcmilpen : Bool
      value.dcmilpen
    end

    # Camera interface enable during Sleep              mode
    def self.dcmilpen=(value : Bool) : Bool
      self.set(dcmilpen: value)
      value
    end

    def copy_with(
      *,

      otgfslpen : Bool? = nil,

      rnglpen : Bool? = nil,

      hashlpen : Bool? = nil,

      cryplpen : Bool? = nil,

      dcmilpen : Bool? = nil
    ) : self
      value = @value

      unless otgfslpen.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(otgfslpen.to_int).&(0x1_u32) << 7
      end

      unless rnglpen.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(rnglpen.to_int).&(0x1_u32) << 6
      end

      unless hashlpen.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(hashlpen.to_int).&(0x1_u32) << 5
      end

      unless cryplpen.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(cryplpen.to_int).&(0x1_u32) << 4
      end

      unless dcmilpen.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(dcmilpen.to_int).&(0x1_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      otgfslpen : Bool? = nil,
      rnglpen : Bool? = nil,
      hashlpen : Bool? = nil,
      cryplpen : Bool? = nil,
      dcmilpen : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        otgfslpen: otgfslpen,
        rnglpen: rnglpen,
        hashlpen: hashlpen,
        cryplpen: cryplpen,
        dcmilpen: dcmilpen,
      )
    end
  end # struct

  # AHB3 peripheral clock enable in low power          mode register
  struct AHB3LPENR
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
      new(0x1_u64)
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

    # Flexible memory controller module clock              enable during Sleep mode
    def fmclpen : Bool
      @value.bits_set?(0x1_u32)
    end

    # Flexible memory controller module clock              enable during Sleep mode
    def self.fmclpen : Bool
      value.fmclpen
    end

    # Flexible memory controller module clock              enable during Sleep mode
    def self.fmclpen=(value : Bool) : Bool
      self.set(fmclpen: value)
      value
    end

    def copy_with(
      *,

      fmclpen : Bool? = nil
    ) : self
      value = @value

      unless fmclpen.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(fmclpen.to_int).&(0x1_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      fmclpen : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        fmclpen: fmclpen,
      )
    end
  end # struct

  # APB1 peripheral clock enable in low power          mode register
  struct APB1LPENR
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
      new(0x36fec9ff_u64)
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

    # TIM2 clock enable during Sleep              mode
    def tim2_lpen : Bool
      @value.bits_set?(0x1_u32)
    end

    # TIM2 clock enable during Sleep              mode
    def self.tim2_lpen : Bool
      value.tim2_lpen
    end

    # TIM2 clock enable during Sleep              mode
    def self.tim2_lpen=(value : Bool) : Bool
      self.set(tim2_lpen: value)
      value
    end

    # TIM3 clock enable during Sleep              mode
    def tim3_lpen : Bool
      @value.bits_set?(0x2_u32)
    end

    # TIM3 clock enable during Sleep              mode
    def self.tim3_lpen : Bool
      value.tim3_lpen
    end

    # TIM3 clock enable during Sleep              mode
    def self.tim3_lpen=(value : Bool) : Bool
      self.set(tim3_lpen: value)
      value
    end

    # TIM4 clock enable during Sleep              mode
    def tim4_lpen : Bool
      @value.bits_set?(0x4_u32)
    end

    # TIM4 clock enable during Sleep              mode
    def self.tim4_lpen : Bool
      value.tim4_lpen
    end

    # TIM4 clock enable during Sleep              mode
    def self.tim4_lpen=(value : Bool) : Bool
      self.set(tim4_lpen: value)
      value
    end

    # TIM5 clock enable during Sleep              mode
    def tim5_lpen : Bool
      @value.bits_set?(0x8_u32)
    end

    # TIM5 clock enable during Sleep              mode
    def self.tim5_lpen : Bool
      value.tim5_lpen
    end

    # TIM5 clock enable during Sleep              mode
    def self.tim5_lpen=(value : Bool) : Bool
      self.set(tim5_lpen: value)
      value
    end

    # TIM6 clock enable during Sleep              mode
    def tim6_lpen : Bool
      @value.bits_set?(0x10_u32)
    end

    # TIM6 clock enable during Sleep              mode
    def self.tim6_lpen : Bool
      value.tim6_lpen
    end

    # TIM6 clock enable during Sleep              mode
    def self.tim6_lpen=(value : Bool) : Bool
      self.set(tim6_lpen: value)
      value
    end

    # TIM7 clock enable during Sleep              mode
    def tim7_lpen : Bool
      @value.bits_set?(0x20_u32)
    end

    # TIM7 clock enable during Sleep              mode
    def self.tim7_lpen : Bool
      value.tim7_lpen
    end

    # TIM7 clock enable during Sleep              mode
    def self.tim7_lpen=(value : Bool) : Bool
      self.set(tim7_lpen: value)
      value
    end

    # TIM12 clock enable during Sleep              mode
    def tim12_lpen : Bool
      @value.bits_set?(0x40_u32)
    end

    # TIM12 clock enable during Sleep              mode
    def self.tim12_lpen : Bool
      value.tim12_lpen
    end

    # TIM12 clock enable during Sleep              mode
    def self.tim12_lpen=(value : Bool) : Bool
      self.set(tim12_lpen: value)
      value
    end

    # TIM13 clock enable during Sleep              mode
    def tim13_lpen : Bool
      @value.bits_set?(0x80_u32)
    end

    # TIM13 clock enable during Sleep              mode
    def self.tim13_lpen : Bool
      value.tim13_lpen
    end

    # TIM13 clock enable during Sleep              mode
    def self.tim13_lpen=(value : Bool) : Bool
      self.set(tim13_lpen: value)
      value
    end

    # TIM14 clock enable during Sleep              mode
    def tim14_lpen : Bool
      @value.bits_set?(0x100_u32)
    end

    # TIM14 clock enable during Sleep              mode
    def self.tim14_lpen : Bool
      value.tim14_lpen
    end

    # TIM14 clock enable during Sleep              mode
    def self.tim14_lpen=(value : Bool) : Bool
      self.set(tim14_lpen: value)
      value
    end

    # Window watchdog clock enable during              Sleep mode
    def wwdglpen : Bool
      @value.bits_set?(0x800_u32)
    end

    # Window watchdog clock enable during              Sleep mode
    def self.wwdglpen : Bool
      value.wwdglpen
    end

    # Window watchdog clock enable during              Sleep mode
    def self.wwdglpen=(value : Bool) : Bool
      self.set(wwdglpen: value)
      value
    end

    # SPI2 clock enable during Sleep              mode
    def spi2_lpen : Bool
      @value.bits_set?(0x4000_u32)
    end

    # SPI2 clock enable during Sleep              mode
    def self.spi2_lpen : Bool
      value.spi2_lpen
    end

    # SPI2 clock enable during Sleep              mode
    def self.spi2_lpen=(value : Bool) : Bool
      self.set(spi2_lpen: value)
      value
    end

    # SPI3 clock enable during Sleep              mode
    def spi3_lpen : Bool
      @value.bits_set?(0x8000_u32)
    end

    # SPI3 clock enable during Sleep              mode
    def self.spi3_lpen : Bool
      value.spi3_lpen
    end

    # SPI3 clock enable during Sleep              mode
    def self.spi3_lpen=(value : Bool) : Bool
      self.set(spi3_lpen: value)
      value
    end

    # USART2 clock enable during Sleep              mode
    def usart2_lpen : Bool
      @value.bits_set?(0x20000_u32)
    end

    # USART2 clock enable during Sleep              mode
    def self.usart2_lpen : Bool
      value.usart2_lpen
    end

    # USART2 clock enable during Sleep              mode
    def self.usart2_lpen=(value : Bool) : Bool
      self.set(usart2_lpen: value)
      value
    end

    # USART3 clock enable during Sleep              mode
    def usart3_lpen : Bool
      @value.bits_set?(0x40000_u32)
    end

    # USART3 clock enable during Sleep              mode
    def self.usart3_lpen : Bool
      value.usart3_lpen
    end

    # USART3 clock enable during Sleep              mode
    def self.usart3_lpen=(value : Bool) : Bool
      self.set(usart3_lpen: value)
      value
    end

    # UART4 clock enable during Sleep              mode
    def uart4_lpen : Bool
      @value.bits_set?(0x80000_u32)
    end

    # UART4 clock enable during Sleep              mode
    def self.uart4_lpen : Bool
      value.uart4_lpen
    end

    # UART4 clock enable during Sleep              mode
    def self.uart4_lpen=(value : Bool) : Bool
      self.set(uart4_lpen: value)
      value
    end

    # UART5 clock enable during Sleep              mode
    def uart5_lpen : Bool
      @value.bits_set?(0x100000_u32)
    end

    # UART5 clock enable during Sleep              mode
    def self.uart5_lpen : Bool
      value.uart5_lpen
    end

    # UART5 clock enable during Sleep              mode
    def self.uart5_lpen=(value : Bool) : Bool
      self.set(uart5_lpen: value)
      value
    end

    # I2C1 clock enable during Sleep              mode
    def i2_c1_lpen : Bool
      @value.bits_set?(0x200000_u32)
    end

    # I2C1 clock enable during Sleep              mode
    def self.i2_c1_lpen : Bool
      value.i2_c1_lpen
    end

    # I2C1 clock enable during Sleep              mode
    def self.i2_c1_lpen=(value : Bool) : Bool
      self.set(i2_c1_lpen: value)
      value
    end

    # I2C2 clock enable during Sleep              mode
    def i2_c2_lpen : Bool
      @value.bits_set?(0x400000_u32)
    end

    # I2C2 clock enable during Sleep              mode
    def self.i2_c2_lpen : Bool
      value.i2_c2_lpen
    end

    # I2C2 clock enable during Sleep              mode
    def self.i2_c2_lpen=(value : Bool) : Bool
      self.set(i2_c2_lpen: value)
      value
    end

    # I2C3 clock enable during Sleep              mode
    def i2_c3_lpen : Bool
      @value.bits_set?(0x800000_u32)
    end

    # I2C3 clock enable during Sleep              mode
    def self.i2_c3_lpen : Bool
      value.i2_c3_lpen
    end

    # I2C3 clock enable during Sleep              mode
    def self.i2_c3_lpen=(value : Bool) : Bool
      self.set(i2_c3_lpen: value)
      value
    end

    # CAN 1 clock enable during Sleep              mode
    def can1_lpen : Bool
      @value.bits_set?(0x2000000_u32)
    end

    # CAN 1 clock enable during Sleep              mode
    def self.can1_lpen : Bool
      value.can1_lpen
    end

    # CAN 1 clock enable during Sleep              mode
    def self.can1_lpen=(value : Bool) : Bool
      self.set(can1_lpen: value)
      value
    end

    # CAN 2 clock enable during Sleep              mode
    def can2_lpen : Bool
      @value.bits_set?(0x4000000_u32)
    end

    # CAN 2 clock enable during Sleep              mode
    def self.can2_lpen : Bool
      value.can2_lpen
    end

    # CAN 2 clock enable during Sleep              mode
    def self.can2_lpen=(value : Bool) : Bool
      self.set(can2_lpen: value)
      value
    end

    # Power interface clock enable during              Sleep mode
    def pwrlpen : Bool
      @value.bits_set?(0x10000000_u32)
    end

    # Power interface clock enable during              Sleep mode
    def self.pwrlpen : Bool
      value.pwrlpen
    end

    # Power interface clock enable during              Sleep mode
    def self.pwrlpen=(value : Bool) : Bool
      self.set(pwrlpen: value)
      value
    end

    # DAC interface clock enable during Sleep              mode
    def daclpen : Bool
      @value.bits_set?(0x20000000_u32)
    end

    # DAC interface clock enable during Sleep              mode
    def self.daclpen : Bool
      value.daclpen
    end

    # DAC interface clock enable during Sleep              mode
    def self.daclpen=(value : Bool) : Bool
      self.set(daclpen: value)
      value
    end

    def copy_with(
      *,

      tim2_lpen : Bool? = nil,

      tim3_lpen : Bool? = nil,

      tim4_lpen : Bool? = nil,

      tim5_lpen : Bool? = nil,

      tim6_lpen : Bool? = nil,

      tim7_lpen : Bool? = nil,

      tim12_lpen : Bool? = nil,

      tim13_lpen : Bool? = nil,

      tim14_lpen : Bool? = nil,

      wwdglpen : Bool? = nil,

      spi2_lpen : Bool? = nil,

      spi3_lpen : Bool? = nil,

      usart2_lpen : Bool? = nil,

      usart3_lpen : Bool? = nil,

      uart4_lpen : Bool? = nil,

      uart5_lpen : Bool? = nil,

      i2_c1_lpen : Bool? = nil,

      i2_c2_lpen : Bool? = nil,

      i2_c3_lpen : Bool? = nil,

      can1_lpen : Bool? = nil,

      can2_lpen : Bool? = nil,

      pwrlpen : Bool? = nil,

      daclpen : Bool? = nil
    ) : self
      value = @value

      unless tim2_lpen.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(tim2_lpen.to_int).&(0x1_u32) << 0
      end

      unless tim3_lpen.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(tim3_lpen.to_int).&(0x1_u32) << 1
      end

      unless tim4_lpen.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(tim4_lpen.to_int).&(0x1_u32) << 2
      end

      unless tim5_lpen.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(tim5_lpen.to_int).&(0x1_u32) << 3
      end

      unless tim6_lpen.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(tim6_lpen.to_int).&(0x1_u32) << 4
      end

      unless tim7_lpen.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(tim7_lpen.to_int).&(0x1_u32) << 5
      end

      unless tim12_lpen.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(tim12_lpen.to_int).&(0x1_u32) << 6
      end

      unless tim13_lpen.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(tim13_lpen.to_int).&(0x1_u32) << 7
      end

      unless tim14_lpen.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(tim14_lpen.to_int).&(0x1_u32) << 8
      end

      unless wwdglpen.nil?
        value = (value & 0xfffff7ff_u32) |
                UInt32.new!(wwdglpen.to_int).&(0x1_u32) << 11
      end

      unless spi2_lpen.nil?
        value = (value & 0xffffbfff_u32) |
                UInt32.new!(spi2_lpen.to_int).&(0x1_u32) << 14
      end

      unless spi3_lpen.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(spi3_lpen.to_int).&(0x1_u32) << 15
      end

      unless usart2_lpen.nil?
        value = (value & 0xfffdffff_u32) |
                UInt32.new!(usart2_lpen.to_int).&(0x1_u32) << 17
      end

      unless usart3_lpen.nil?
        value = (value & 0xfffbffff_u32) |
                UInt32.new!(usart3_lpen.to_int).&(0x1_u32) << 18
      end

      unless uart4_lpen.nil?
        value = (value & 0xfff7ffff_u32) |
                UInt32.new!(uart4_lpen.to_int).&(0x1_u32) << 19
      end

      unless uart5_lpen.nil?
        value = (value & 0xffefffff_u32) |
                UInt32.new!(uart5_lpen.to_int).&(0x1_u32) << 20
      end

      unless i2_c1_lpen.nil?
        value = (value & 0xffdfffff_u32) |
                UInt32.new!(i2_c1_lpen.to_int).&(0x1_u32) << 21
      end

      unless i2_c2_lpen.nil?
        value = (value & 0xffbfffff_u32) |
                UInt32.new!(i2_c2_lpen.to_int).&(0x1_u32) << 22
      end

      unless i2_c3_lpen.nil?
        value = (value & 0xff7fffff_u32) |
                UInt32.new!(i2_c3_lpen.to_int).&(0x1_u32) << 23
      end

      unless can1_lpen.nil?
        value = (value & 0xfdffffff_u32) |
                UInt32.new!(can1_lpen.to_int).&(0x1_u32) << 25
      end

      unless can2_lpen.nil?
        value = (value & 0xfbffffff_u32) |
                UInt32.new!(can2_lpen.to_int).&(0x1_u32) << 26
      end

      unless pwrlpen.nil?
        value = (value & 0xefffffff_u32) |
                UInt32.new!(pwrlpen.to_int).&(0x1_u32) << 28
      end

      unless daclpen.nil?
        value = (value & 0xdfffffff_u32) |
                UInt32.new!(daclpen.to_int).&(0x1_u32) << 29
      end

      self.class.new(value)
    end

    def self.set(
      *,
      tim2_lpen : Bool? = nil,
      tim3_lpen : Bool? = nil,
      tim4_lpen : Bool? = nil,
      tim5_lpen : Bool? = nil,
      tim6_lpen : Bool? = nil,
      tim7_lpen : Bool? = nil,
      tim12_lpen : Bool? = nil,
      tim13_lpen : Bool? = nil,
      tim14_lpen : Bool? = nil,
      wwdglpen : Bool? = nil,
      spi2_lpen : Bool? = nil,
      spi3_lpen : Bool? = nil,
      usart2_lpen : Bool? = nil,
      usart3_lpen : Bool? = nil,
      uart4_lpen : Bool? = nil,
      uart5_lpen : Bool? = nil,
      i2_c1_lpen : Bool? = nil,
      i2_c2_lpen : Bool? = nil,
      i2_c3_lpen : Bool? = nil,
      can1_lpen : Bool? = nil,
      can2_lpen : Bool? = nil,
      pwrlpen : Bool? = nil,
      daclpen : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        tim2_lpen: tim2_lpen,
        tim3_lpen: tim3_lpen,
        tim4_lpen: tim4_lpen,
        tim5_lpen: tim5_lpen,
        tim6_lpen: tim6_lpen,
        tim7_lpen: tim7_lpen,
        tim12_lpen: tim12_lpen,
        tim13_lpen: tim13_lpen,
        tim14_lpen: tim14_lpen,
        wwdglpen: wwdglpen,
        spi2_lpen: spi2_lpen,
        spi3_lpen: spi3_lpen,
        usart2_lpen: usart2_lpen,
        usart3_lpen: usart3_lpen,
        uart4_lpen: uart4_lpen,
        uart5_lpen: uart5_lpen,
        i2_c1_lpen: i2_c1_lpen,
        i2_c2_lpen: i2_c2_lpen,
        i2_c3_lpen: i2_c3_lpen,
        can1_lpen: can1_lpen,
        can2_lpen: can2_lpen,
        pwrlpen: pwrlpen,
        daclpen: daclpen,
      )
    end
  end # struct

  # APB2 peripheral clock enabled in low power          mode register
  struct APB2LPENR
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
      new(0x75f33_u64)
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

    # TIM1 clock enable during Sleep              mode
    def tim1_lpen : Bool
      @value.bits_set?(0x1_u32)
    end

    # TIM1 clock enable during Sleep              mode
    def self.tim1_lpen : Bool
      value.tim1_lpen
    end

    # TIM1 clock enable during Sleep              mode
    def self.tim1_lpen=(value : Bool) : Bool
      self.set(tim1_lpen: value)
      value
    end

    # TIM8 clock enable during Sleep              mode
    def tim8_lpen : Bool
      @value.bits_set?(0x2_u32)
    end

    # TIM8 clock enable during Sleep              mode
    def self.tim8_lpen : Bool
      value.tim8_lpen
    end

    # TIM8 clock enable during Sleep              mode
    def self.tim8_lpen=(value : Bool) : Bool
      self.set(tim8_lpen: value)
      value
    end

    # USART1 clock enable during Sleep              mode
    def usart1_lpen : Bool
      @value.bits_set?(0x10_u32)
    end

    # USART1 clock enable during Sleep              mode
    def self.usart1_lpen : Bool
      value.usart1_lpen
    end

    # USART1 clock enable during Sleep              mode
    def self.usart1_lpen=(value : Bool) : Bool
      self.set(usart1_lpen: value)
      value
    end

    # USART6 clock enable during Sleep              mode
    def usart6_lpen : Bool
      @value.bits_set?(0x20_u32)
    end

    # USART6 clock enable during Sleep              mode
    def self.usart6_lpen : Bool
      value.usart6_lpen
    end

    # USART6 clock enable during Sleep              mode
    def self.usart6_lpen=(value : Bool) : Bool
      self.set(usart6_lpen: value)
      value
    end

    # ADC1 clock enable during Sleep              mode
    def adc1_lpen : Bool
      @value.bits_set?(0x100_u32)
    end

    # ADC1 clock enable during Sleep              mode
    def self.adc1_lpen : Bool
      value.adc1_lpen
    end

    # ADC1 clock enable during Sleep              mode
    def self.adc1_lpen=(value : Bool) : Bool
      self.set(adc1_lpen: value)
      value
    end

    # ADC2 clock enable during Sleep              mode
    def adc2_lpen : Bool
      @value.bits_set?(0x200_u32)
    end

    # ADC2 clock enable during Sleep              mode
    def self.adc2_lpen : Bool
      value.adc2_lpen
    end

    # ADC2 clock enable during Sleep              mode
    def self.adc2_lpen=(value : Bool) : Bool
      self.set(adc2_lpen: value)
      value
    end

    # ADC 3 clock enable during Sleep              mode
    def adc3_lpen : Bool
      @value.bits_set?(0x400_u32)
    end

    # ADC 3 clock enable during Sleep              mode
    def self.adc3_lpen : Bool
      value.adc3_lpen
    end

    # ADC 3 clock enable during Sleep              mode
    def self.adc3_lpen=(value : Bool) : Bool
      self.set(adc3_lpen: value)
      value
    end

    # SDIO clock enable during Sleep              mode
    def sdiolpen : Bool
      @value.bits_set?(0x800_u32)
    end

    # SDIO clock enable during Sleep              mode
    def self.sdiolpen : Bool
      value.sdiolpen
    end

    # SDIO clock enable during Sleep              mode
    def self.sdiolpen=(value : Bool) : Bool
      self.set(sdiolpen: value)
      value
    end

    # SPI 1 clock enable during Sleep              mode
    def spi1_lpen : Bool
      @value.bits_set?(0x1000_u32)
    end

    # SPI 1 clock enable during Sleep              mode
    def self.spi1_lpen : Bool
      value.spi1_lpen
    end

    # SPI 1 clock enable during Sleep              mode
    def self.spi1_lpen=(value : Bool) : Bool
      self.set(spi1_lpen: value)
      value
    end

    # System configuration controller clock              enable during Sleep mode
    def syscfglpen : Bool
      @value.bits_set?(0x4000_u32)
    end

    # System configuration controller clock              enable during Sleep mode
    def self.syscfglpen : Bool
      value.syscfglpen
    end

    # System configuration controller clock              enable during Sleep mode
    def self.syscfglpen=(value : Bool) : Bool
      self.set(syscfglpen: value)
      value
    end

    # TIM9 clock enable during sleep              mode
    def tim9_lpen : Bool
      @value.bits_set?(0x10000_u32)
    end

    # TIM9 clock enable during sleep              mode
    def self.tim9_lpen : Bool
      value.tim9_lpen
    end

    # TIM9 clock enable during sleep              mode
    def self.tim9_lpen=(value : Bool) : Bool
      self.set(tim9_lpen: value)
      value
    end

    # TIM10 clock enable during Sleep              mode
    def tim10_lpen : Bool
      @value.bits_set?(0x20000_u32)
    end

    # TIM10 clock enable during Sleep              mode
    def self.tim10_lpen : Bool
      value.tim10_lpen
    end

    # TIM10 clock enable during Sleep              mode
    def self.tim10_lpen=(value : Bool) : Bool
      self.set(tim10_lpen: value)
      value
    end

    # TIM11 clock enable during Sleep              mode
    def tim11_lpen : Bool
      @value.bits_set?(0x40000_u32)
    end

    # TIM11 clock enable during Sleep              mode
    def self.tim11_lpen : Bool
      value.tim11_lpen
    end

    # TIM11 clock enable during Sleep              mode
    def self.tim11_lpen=(value : Bool) : Bool
      self.set(tim11_lpen: value)
      value
    end

    def copy_with(
      *,

      tim1_lpen : Bool? = nil,

      tim8_lpen : Bool? = nil,

      usart1_lpen : Bool? = nil,

      usart6_lpen : Bool? = nil,

      adc1_lpen : Bool? = nil,

      adc2_lpen : Bool? = nil,

      adc3_lpen : Bool? = nil,

      sdiolpen : Bool? = nil,

      spi1_lpen : Bool? = nil,

      syscfglpen : Bool? = nil,

      tim9_lpen : Bool? = nil,

      tim10_lpen : Bool? = nil,

      tim11_lpen : Bool? = nil
    ) : self
      value = @value

      unless tim1_lpen.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(tim1_lpen.to_int).&(0x1_u32) << 0
      end

      unless tim8_lpen.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(tim8_lpen.to_int).&(0x1_u32) << 1
      end

      unless usart1_lpen.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(usart1_lpen.to_int).&(0x1_u32) << 4
      end

      unless usart6_lpen.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(usart6_lpen.to_int).&(0x1_u32) << 5
      end

      unless adc1_lpen.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(adc1_lpen.to_int).&(0x1_u32) << 8
      end

      unless adc2_lpen.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(adc2_lpen.to_int).&(0x1_u32) << 9
      end

      unless adc3_lpen.nil?
        value = (value & 0xfffffbff_u32) |
                UInt32.new!(adc3_lpen.to_int).&(0x1_u32) << 10
      end

      unless sdiolpen.nil?
        value = (value & 0xfffff7ff_u32) |
                UInt32.new!(sdiolpen.to_int).&(0x1_u32) << 11
      end

      unless spi1_lpen.nil?
        value = (value & 0xffffefff_u32) |
                UInt32.new!(spi1_lpen.to_int).&(0x1_u32) << 12
      end

      unless syscfglpen.nil?
        value = (value & 0xffffbfff_u32) |
                UInt32.new!(syscfglpen.to_int).&(0x1_u32) << 14
      end

      unless tim9_lpen.nil?
        value = (value & 0xfffeffff_u32) |
                UInt32.new!(tim9_lpen.to_int).&(0x1_u32) << 16
      end

      unless tim10_lpen.nil?
        value = (value & 0xfffdffff_u32) |
                UInt32.new!(tim10_lpen.to_int).&(0x1_u32) << 17
      end

      unless tim11_lpen.nil?
        value = (value & 0xfffbffff_u32) |
                UInt32.new!(tim11_lpen.to_int).&(0x1_u32) << 18
      end

      self.class.new(value)
    end

    def self.set(
      *,
      tim1_lpen : Bool? = nil,
      tim8_lpen : Bool? = nil,
      usart1_lpen : Bool? = nil,
      usart6_lpen : Bool? = nil,
      adc1_lpen : Bool? = nil,
      adc2_lpen : Bool? = nil,
      adc3_lpen : Bool? = nil,
      sdiolpen : Bool? = nil,
      spi1_lpen : Bool? = nil,
      syscfglpen : Bool? = nil,
      tim9_lpen : Bool? = nil,
      tim10_lpen : Bool? = nil,
      tim11_lpen : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        tim1_lpen: tim1_lpen,
        tim8_lpen: tim8_lpen,
        usart1_lpen: usart1_lpen,
        usart6_lpen: usart6_lpen,
        adc1_lpen: adc1_lpen,
        adc2_lpen: adc2_lpen,
        adc3_lpen: adc3_lpen,
        sdiolpen: sdiolpen,
        spi1_lpen: spi1_lpen,
        syscfglpen: syscfglpen,
        tim9_lpen: tim9_lpen,
        tim10_lpen: tim10_lpen,
        tim11_lpen: tim11_lpen,
      )
    end
  end # struct

  # Backup domain control register
  struct BDCR
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

    # Backup domain software              reset
    def bdrst : Bool
      @value.bits_set?(0x10000_u32)
    end

    # Backup domain software              reset
    def self.bdrst : Bool
      value.bdrst
    end

    # Backup domain software              reset
    def self.bdrst=(value : Bool) : Bool
      self.set(bdrst: value)
      value
    end

    # RTC clock enable
    def rtcen : Bool
      @value.bits_set?(0x8000_u32)
    end

    # RTC clock enable
    def self.rtcen : Bool
      value.rtcen
    end

    # RTC clock enable
    def self.rtcen=(value : Bool) : Bool
      self.set(rtcen: value)
      value
    end

    # RTC clock source selection
    def rtcsel1 : Bool
      @value.bits_set?(0x200_u32)
    end

    # RTC clock source selection
    def self.rtcsel1 : Bool
      value.rtcsel1
    end

    # RTC clock source selection
    def self.rtcsel1=(value : Bool) : Bool
      self.set(rtcsel1: value)
      value
    end

    # RTC clock source selection
    def rtcsel0 : Bool
      @value.bits_set?(0x100_u32)
    end

    # RTC clock source selection
    def self.rtcsel0 : Bool
      value.rtcsel0
    end

    # RTC clock source selection
    def self.rtcsel0=(value : Bool) : Bool
      self.set(rtcsel0: value)
      value
    end

    # External low-speed oscillator              bypass
    def lsebyp : Bool
      @value.bits_set?(0x4_u32)
    end

    # External low-speed oscillator              bypass
    def self.lsebyp : Bool
      value.lsebyp
    end

    # External low-speed oscillator              bypass
    def self.lsebyp=(value : Bool) : Bool
      self.set(lsebyp: value)
      value
    end

    # External low-speed oscillator              ready
    def lserdy : Bool
      @value.bits_set?(0x2_u32)
    end

    # External low-speed oscillator              ready
    def self.lserdy : Bool
      value.lserdy
    end

    # External low-speed oscillator              enable
    def lseon : Bool
      @value.bits_set?(0x1_u32)
    end

    # External low-speed oscillator              enable
    def self.lseon : Bool
      value.lseon
    end

    # External low-speed oscillator              enable
    def self.lseon=(value : Bool) : Bool
      self.set(lseon: value)
      value
    end

    def copy_with(
      *,

      bdrst : Bool? = nil,

      rtcen : Bool? = nil,

      rtcsel1 : Bool? = nil,

      rtcsel0 : Bool? = nil,

      lsebyp : Bool? = nil,

      lseon : Bool? = nil
    ) : self
      value = @value

      unless bdrst.nil?
        value = (value & 0xfffeffff_u32) |
                UInt32.new!(bdrst.to_int).&(0x1_u32) << 16
      end

      unless rtcen.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(rtcen.to_int).&(0x1_u32) << 15
      end

      unless rtcsel1.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(rtcsel1.to_int).&(0x1_u32) << 9
      end

      unless rtcsel0.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(rtcsel0.to_int).&(0x1_u32) << 8
      end

      unless lsebyp.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(lsebyp.to_int).&(0x1_u32) << 2
      end

      unless lseon.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(lseon.to_int).&(0x1_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      bdrst : Bool? = nil,
      rtcen : Bool? = nil,
      rtcsel1 : Bool? = nil,
      rtcsel0 : Bool? = nil,
      lsebyp : Bool? = nil,
      lseon : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        bdrst: bdrst,
        rtcen: rtcen,
        rtcsel1: rtcsel1,
        rtcsel0: rtcsel0,
        lsebyp: lsebyp,
        lseon: lseon,
      )
    end
  end # struct

  # clock control & status          register
  struct CSR
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
      new(0xe000000_u64)
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

    # Low-power reset flag
    def lpwrrstf : Bool
      @value.bits_set?(0x80000000_u32)
    end

    # Low-power reset flag
    def self.lpwrrstf : Bool
      value.lpwrrstf
    end

    # Low-power reset flag
    def self.lpwrrstf=(value : Bool) : Bool
      self.set(lpwrrstf: value)
      value
    end

    # Window watchdog reset flag
    def wwdgrstf : Bool
      @value.bits_set?(0x40000000_u32)
    end

    # Window watchdog reset flag
    def self.wwdgrstf : Bool
      value.wwdgrstf
    end

    # Window watchdog reset flag
    def self.wwdgrstf=(value : Bool) : Bool
      self.set(wwdgrstf: value)
      value
    end

    # Independent watchdog reset              flag
    def wdgrstf : Bool
      @value.bits_set?(0x20000000_u32)
    end

    # Independent watchdog reset              flag
    def self.wdgrstf : Bool
      value.wdgrstf
    end

    # Independent watchdog reset              flag
    def self.wdgrstf=(value : Bool) : Bool
      self.set(wdgrstf: value)
      value
    end

    # Software reset flag
    def sftrstf : Bool
      @value.bits_set?(0x10000000_u32)
    end

    # Software reset flag
    def self.sftrstf : Bool
      value.sftrstf
    end

    # Software reset flag
    def self.sftrstf=(value : Bool) : Bool
      self.set(sftrstf: value)
      value
    end

    # POR/PDR reset flag
    def porrstf : Bool
      @value.bits_set?(0x8000000_u32)
    end

    # POR/PDR reset flag
    def self.porrstf : Bool
      value.porrstf
    end

    # POR/PDR reset flag
    def self.porrstf=(value : Bool) : Bool
      self.set(porrstf: value)
      value
    end

    # PIN reset flag
    def padrstf : Bool
      @value.bits_set?(0x4000000_u32)
    end

    # PIN reset flag
    def self.padrstf : Bool
      value.padrstf
    end

    # PIN reset flag
    def self.padrstf=(value : Bool) : Bool
      self.set(padrstf: value)
      value
    end

    # BOR reset flag
    def borrstf : Bool
      @value.bits_set?(0x2000000_u32)
    end

    # BOR reset flag
    def self.borrstf : Bool
      value.borrstf
    end

    # BOR reset flag
    def self.borrstf=(value : Bool) : Bool
      self.set(borrstf: value)
      value
    end

    # Remove reset flag
    def rmvf : Bool
      @value.bits_set?(0x1000000_u32)
    end

    # Remove reset flag
    def self.rmvf : Bool
      value.rmvf
    end

    # Remove reset flag
    def self.rmvf=(value : Bool) : Bool
      self.set(rmvf: value)
      value
    end

    # Internal low-speed oscillator              ready
    def lsirdy : Bool
      @value.bits_set?(0x2_u32)
    end

    # Internal low-speed oscillator              ready
    def self.lsirdy : Bool
      value.lsirdy
    end

    # Internal low-speed oscillator              enable
    def lsion : Bool
      @value.bits_set?(0x1_u32)
    end

    # Internal low-speed oscillator              enable
    def self.lsion : Bool
      value.lsion
    end

    # Internal low-speed oscillator              enable
    def self.lsion=(value : Bool) : Bool
      self.set(lsion: value)
      value
    end

    def copy_with(
      *,

      lpwrrstf : Bool? = nil,

      wwdgrstf : Bool? = nil,

      wdgrstf : Bool? = nil,

      sftrstf : Bool? = nil,

      porrstf : Bool? = nil,

      padrstf : Bool? = nil,

      borrstf : Bool? = nil,

      rmvf : Bool? = nil,

      lsion : Bool? = nil
    ) : self
      value = @value

      unless lpwrrstf.nil?
        value = (value & 0x7fffffff_u32) |
                UInt32.new!(lpwrrstf.to_int).&(0x1_u32) << 31
      end

      unless wwdgrstf.nil?
        value = (value & 0xbfffffff_u32) |
                UInt32.new!(wwdgrstf.to_int).&(0x1_u32) << 30
      end

      unless wdgrstf.nil?
        value = (value & 0xdfffffff_u32) |
                UInt32.new!(wdgrstf.to_int).&(0x1_u32) << 29
      end

      unless sftrstf.nil?
        value = (value & 0xefffffff_u32) |
                UInt32.new!(sftrstf.to_int).&(0x1_u32) << 28
      end

      unless porrstf.nil?
        value = (value & 0xf7ffffff_u32) |
                UInt32.new!(porrstf.to_int).&(0x1_u32) << 27
      end

      unless padrstf.nil?
        value = (value & 0xfbffffff_u32) |
                UInt32.new!(padrstf.to_int).&(0x1_u32) << 26
      end

      unless borrstf.nil?
        value = (value & 0xfdffffff_u32) |
                UInt32.new!(borrstf.to_int).&(0x1_u32) << 25
      end

      unless rmvf.nil?
        value = (value & 0xfeffffff_u32) |
                UInt32.new!(rmvf.to_int).&(0x1_u32) << 24
      end

      unless lsion.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(lsion.to_int).&(0x1_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      lpwrrstf : Bool? = nil,
      wwdgrstf : Bool? = nil,
      wdgrstf : Bool? = nil,
      sftrstf : Bool? = nil,
      porrstf : Bool? = nil,
      padrstf : Bool? = nil,
      borrstf : Bool? = nil,
      rmvf : Bool? = nil,
      lsion : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        lpwrrstf: lpwrrstf,
        wwdgrstf: wwdgrstf,
        wdgrstf: wdgrstf,
        sftrstf: sftrstf,
        porrstf: porrstf,
        padrstf: padrstf,
        borrstf: borrstf,
        rmvf: rmvf,
        lsion: lsion,
      )
    end
  end # struct

  # spread spectrum clock generation          register
  struct SSCGR
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

    # Spread spectrum modulation              enable
    def sscgen : Bool
      @value.bits_set?(0x80000000_u32)
    end

    # Spread spectrum modulation              enable
    def self.sscgen : Bool
      value.sscgen
    end

    # Spread spectrum modulation              enable
    def self.sscgen=(value : Bool) : Bool
      self.set(sscgen: value)
      value
    end

    # Spread Select
    def spreadsel : Bool
      @value.bits_set?(0x40000000_u32)
    end

    # Spread Select
    def self.spreadsel : Bool
      value.spreadsel
    end

    # Spread Select
    def self.spreadsel=(value : Bool) : Bool
      self.set(spreadsel: value)
      value
    end

    # Incrementation step
    def incstep : UInt16
      UInt16.new!((@value >> 13) & 0x7fff_u32)
    end

    # Incrementation step
    def self.incstep : UInt16
      value.incstep
    end

    # Incrementation step
    def self.incstep=(value : UInt16) : UInt16
      self.set(incstep: value)
      value
    end

    # Modulation period
    def modper : UInt16
      UInt16.new!((@value >> 0) & 0x1fff_u32)
    end

    # Modulation period
    def self.modper : UInt16
      value.modper
    end

    # Modulation period
    def self.modper=(value : UInt16) : UInt16
      self.set(modper: value)
      value
    end

    def copy_with(
      *,

      sscgen : Bool? = nil,

      spreadsel : Bool? = nil,

      incstep : UInt16? = nil,

      modper : UInt16? = nil
    ) : self
      value = @value

      unless sscgen.nil?
        value = (value & 0x7fffffff_u32) |
                UInt32.new!(sscgen.to_int).&(0x1_u32) << 31
      end

      unless spreadsel.nil?
        value = (value & 0xbfffffff_u32) |
                UInt32.new!(spreadsel.to_int).&(0x1_u32) << 30
      end

      unless incstep.nil?
        value = (value & 0xf0001fff_u32) |
                UInt32.new!(incstep.to_int).&(0x7fff_u32) << 13
      end

      unless modper.nil?
        value = (value & 0xffffe000_u32) |
                UInt32.new!(modper.to_int).&(0x1fff_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      sscgen : Bool? = nil,
      spreadsel : Bool? = nil,
      incstep : UInt16? = nil,
      modper : UInt16? = nil
    ) : Nil
      self.value = self.value.copy_with(
        sscgen: sscgen,
        spreadsel: spreadsel,
        incstep: incstep,
        modper: modper,
      )
    end
  end # struct

  # PLLI2S configuration register
  struct PLLI2SCFGR
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
      new(0x20003000_u64)
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

    # PLLI2S division factor for I2S              clocks
    def plli2_sr : UInt8
      UInt8.new!((@value >> 28) & 0x7_u32)
    end

    # PLLI2S division factor for I2S              clocks
    def self.plli2_sr : UInt8
      value.plli2_sr
    end

    # PLLI2S division factor for I2S              clocks
    def self.plli2_sr=(value : UInt8) : UInt8
      self.set(plli2_sr: value)
      value
    end

    # PLLI2S division factor for SAI1              clock
    def plli2_sq : UInt8
      UInt8.new!((@value >> 24) & 0xf_u32)
    end

    # PLLI2S division factor for SAI1              clock
    def self.plli2_sq : UInt8
      value.plli2_sq
    end

    # PLLI2S division factor for SAI1              clock
    def self.plli2_sq=(value : UInt8) : UInt8
      self.set(plli2_sq: value)
      value
    end

    # PLLI2S multiplication factor for              VCO
    def plli2_sn : UInt16
      UInt16.new!((@value >> 6) & 0x1ff_u32)
    end

    # PLLI2S multiplication factor for              VCO
    def self.plli2_sn : UInt16
      value.plli2_sn
    end

    # PLLI2S multiplication factor for              VCO
    def self.plli2_sn=(value : UInt16) : UInt16
      self.set(plli2_sn: value)
      value
    end

    def copy_with(
      *,

      plli2_sr : UInt8? = nil,

      plli2_sq : UInt8? = nil,

      plli2_sn : UInt16? = nil
    ) : self
      value = @value

      unless plli2_sr.nil?
        value = (value & 0x8fffffff_u32) |
                UInt32.new!(plli2_sr.to_int).&(0x7_u32) << 28
      end

      unless plli2_sq.nil?
        value = (value & 0xf0ffffff_u32) |
                UInt32.new!(plli2_sq.to_int).&(0xf_u32) << 24
      end

      unless plli2_sn.nil?
        value = (value & 0xffff803f_u32) |
                UInt32.new!(plli2_sn.to_int).&(0x1ff_u32) << 6
      end

      self.class.new(value)
    end

    def self.set(
      *,
      plli2_sr : UInt8? = nil,
      plli2_sq : UInt8? = nil,
      plli2_sn : UInt16? = nil
    ) : Nil
      self.value = self.value.copy_with(
        plli2_sr: plli2_sr,
        plli2_sq: plli2_sq,
        plli2_sn: plli2_sn,
      )
    end
  end # struct

  # RCC Dedicated Clock Configuration          Register
  struct DCKCFGR
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

    # PLLI2S division factor for SAI1              clock
    def plli2_sdivq : UInt8
      UInt8.new!((@value >> 0) & 0x1f_u32)
    end

    # PLLI2S division factor for SAI1              clock
    def self.plli2_sdivq : UInt8
      value.plli2_sdivq
    end

    # PLLI2S division factor for SAI1              clock
    def self.plli2_sdivq=(value : UInt8) : UInt8
      self.set(plli2_sdivq: value)
      value
    end

    # PLLSAI division factor for SAI1              clock
    def pllsaidivq : UInt8
      UInt8.new!((@value >> 8) & 0x1f_u32)
    end

    # PLLSAI division factor for SAI1              clock
    def self.pllsaidivq : UInt8
      value.pllsaidivq
    end

    # PLLSAI division factor for SAI1              clock
    def self.pllsaidivq=(value : UInt8) : UInt8
      self.set(pllsaidivq: value)
      value
    end

    # division factor for              LCD_CLK
    def pllsaidivr : UInt8
      UInt8.new!((@value >> 16) & 0x3_u32)
    end

    # division factor for              LCD_CLK
    def self.pllsaidivr : UInt8
      value.pllsaidivr
    end

    # division factor for              LCD_CLK
    def self.pllsaidivr=(value : UInt8) : UInt8
      self.set(pllsaidivr: value)
      value
    end

    # SAI1-A clock source              selection
    def sai1_asrc : UInt8
      UInt8.new!((@value >> 20) & 0x3_u32)
    end

    # SAI1-A clock source              selection
    def self.sai1_asrc : UInt8
      value.sai1_asrc
    end

    # SAI1-A clock source              selection
    def self.sai1_asrc=(value : UInt8) : UInt8
      self.set(sai1_asrc: value)
      value
    end

    # SAI1-B clock source              selection
    def sai1_bsrc : UInt8
      UInt8.new!((@value >> 22) & 0x3_u32)
    end

    # SAI1-B clock source              selection
    def self.sai1_bsrc : UInt8
      value.sai1_bsrc
    end

    # SAI1-B clock source              selection
    def self.sai1_bsrc=(value : UInt8) : UInt8
      self.set(sai1_bsrc: value)
      value
    end

    # Timers clocks prescalers              selection
    def timpre : Bool
      @value.bits_set?(0x1000000_u32)
    end

    # Timers clocks prescalers              selection
    def self.timpre : Bool
      value.timpre
    end

    # Timers clocks prescalers              selection
    def self.timpre=(value : Bool) : Bool
      self.set(timpre: value)
      value
    end

    def copy_with(
      *,

      plli2_sdivq : UInt8? = nil,

      pllsaidivq : UInt8? = nil,

      pllsaidivr : UInt8? = nil,

      sai1_asrc : UInt8? = nil,

      sai1_bsrc : UInt8? = nil,

      timpre : Bool? = nil
    ) : self
      value = @value

      unless plli2_sdivq.nil?
        value = (value & 0xffffffe0_u32) |
                UInt32.new!(plli2_sdivq.to_int).&(0x1f_u32) << 0
      end

      unless pllsaidivq.nil?
        value = (value & 0xffffe0ff_u32) |
                UInt32.new!(pllsaidivq.to_int).&(0x1f_u32) << 8
      end

      unless pllsaidivr.nil?
        value = (value & 0xfffcffff_u32) |
                UInt32.new!(pllsaidivr.to_int).&(0x3_u32) << 16
      end

      unless sai1_asrc.nil?
        value = (value & 0xffcfffff_u32) |
                UInt32.new!(sai1_asrc.to_int).&(0x3_u32) << 20
      end

      unless sai1_bsrc.nil?
        value = (value & 0xff3fffff_u32) |
                UInt32.new!(sai1_bsrc.to_int).&(0x3_u32) << 22
      end

      unless timpre.nil?
        value = (value & 0xfeffffff_u32) |
                UInt32.new!(timpre.to_int).&(0x1_u32) << 24
      end

      self.class.new(value)
    end

    def self.set(
      *,
      plli2_sdivq : UInt8? = nil,
      pllsaidivq : UInt8? = nil,
      pllsaidivr : UInt8? = nil,
      sai1_asrc : UInt8? = nil,
      sai1_bsrc : UInt8? = nil,
      timpre : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        plli2_sdivq: plli2_sdivq,
        pllsaidivq: pllsaidivq,
        pllsaidivr: pllsaidivr,
        sai1_asrc: sai1_asrc,
        sai1_bsrc: sai1_bsrc,
        timpre: timpre,
      )
    end
  end # struct

  # RCC PLL configuration register
  struct PLLSAICFGR
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
      new(0x24003000_u64)
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

    # PLLSAI division factor for LCD              clock
    def pllsair : UInt8
      UInt8.new!((@value >> 28) & 0x7_u32)
    end

    # PLLSAI division factor for LCD              clock
    def self.pllsair : UInt8
      value.pllsair
    end

    # PLLSAI division factor for LCD              clock
    def self.pllsair=(value : UInt8) : UInt8
      self.set(pllsair: value)
      value
    end

    # PLLSAI division factor for SAI1              clock
    def pllsaiq : UInt8
      UInt8.new!((@value >> 24) & 0xf_u32)
    end

    # PLLSAI division factor for SAI1              clock
    def self.pllsaiq : UInt8
      value.pllsaiq
    end

    # PLLSAI division factor for SAI1              clock
    def self.pllsaiq=(value : UInt8) : UInt8
      self.set(pllsaiq: value)
      value
    end

    # PLLSAI division factor for              VCO
    def pllsain : UInt16
      UInt16.new!((@value >> 6) & 0x1ff_u32)
    end

    # PLLSAI division factor for              VCO
    def self.pllsain : UInt16
      value.pllsain
    end

    # PLLSAI division factor for              VCO
    def self.pllsain=(value : UInt16) : UInt16
      self.set(pllsain: value)
      value
    end

    def copy_with(
      *,

      pllsair : UInt8? = nil,

      pllsaiq : UInt8? = nil,

      pllsain : UInt16? = nil
    ) : self
      value = @value

      unless pllsair.nil?
        value = (value & 0x8fffffff_u32) |
                UInt32.new!(pllsair.to_int).&(0x7_u32) << 28
      end

      unless pllsaiq.nil?
        value = (value & 0xf0ffffff_u32) |
                UInt32.new!(pllsaiq.to_int).&(0xf_u32) << 24
      end

      unless pllsain.nil?
        value = (value & 0xffff803f_u32) |
                UInt32.new!(pllsain.to_int).&(0x1ff_u32) << 6
      end

      self.class.new(value)
    end

    def self.set(
      *,
      pllsair : UInt8? = nil,
      pllsaiq : UInt8? = nil,
      pllsain : UInt16? = nil
    ) : Nil
      self.value = self.value.copy_with(
        pllsair: pllsair,
        pllsaiq: pllsaiq,
        pllsain: pllsain,
      )
    end
  end # struct

end
