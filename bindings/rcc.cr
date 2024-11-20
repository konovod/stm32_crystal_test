# Reset and clock control
module RCC
  VERSION      = nil
  BASE_ADDRESS = 0x40021000_u64

  # Clock control register
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

    enum HSION : UInt8
      # Clock Off
      OFF = 0x0_u64

      # Clock On
      ON = 0x1_u64

      def self.reset_value : HSION
        CR.reset_value.hsion
      end
    end

    # Internal High Speed clock              enable
    def hsion : HSION
      HSION.new!((@value >> 0) & 0x1_u32)
    end

    # Internal High Speed clock              enable
    def self.hsion : HSION
      value.hsion
    end

    # Internal High Speed clock              enable
    def self.hsion=(value : HSION) : HSION
      self.set(hsion: value)
      value
    end

    enum HSIRDY : UInt8
      # Clock not ready
      NOTREADY = 0x0_u64

      # Clock ready
      READY = 0x1_u64

      def self.reset_value : HSIRDY
        CR.reset_value.hsirdy
      end
    end

    # Internal High Speed clock ready              flag
    def hsirdy : HSIRDY
      HSIRDY.new!((@value >> 1) & 0x1_u32)
    end

    # Internal High Speed clock ready              flag
    def self.hsirdy : HSIRDY
      value.hsirdy
    end

    # Internal High Speed clock              trimming
    def hsitrim : UInt8
      UInt8.new!((@value >> 3) & 0x1f_u32)
    end

    # Internal High Speed clock              trimming
    def self.hsitrim : UInt8
      value.hsitrim
    end

    # Internal High Speed clock              trimming
    def self.hsitrim=(value : UInt8) : UInt8
      self.set(hsitrim: value)
      value
    end

    # Internal High Speed clock              Calibration
    def hsical : UInt8
      UInt8.new!((@value >> 8) & 0xff_u32)
    end

    # Internal High Speed clock              Calibration
    def self.hsical : UInt8
      value.hsical
    end

    # External High Speed clock              enable
    def hseon : Bool
      @value.bits_set?(0x10000_u32)
    end

    # External High Speed clock              enable
    def self.hseon : Bool
      value.hseon
    end

    # External High Speed clock              enable
    def self.hseon=(value : Bool) : Bool
      self.set(hseon: value)
      value
    end

    # External High Speed clock ready              flag
    def hserdy : Bool
      @value.bits_set?(0x20000_u32)
    end

    # External High Speed clock ready              flag
    def self.hserdy : Bool
      value.hserdy
    end

    enum HSEBYP : UInt8
      # HSE crystal oscillator not bypassed
      NOTBYPASSED = 0x0_u64

      # HSE crystal oscillator bypassed with external clock
      BYPASSED = 0x1_u64

      def self.reset_value : HSEBYP
        CR.reset_value.hsebyp
      end
    end

    # External High Speed clock              Bypass
    def hsebyp : HSEBYP
      HSEBYP.new!((@value >> 18) & 0x1_u32)
    end

    # External High Speed clock              Bypass
    def self.hsebyp : HSEBYP
      value.hsebyp
    end

    # External High Speed clock              Bypass
    def self.hsebyp=(value : HSEBYP) : HSEBYP
      self.set(hsebyp: value)
      value
    end

    enum CSSON : UInt8
      # Clock security system disabled (clock detector OFF)
      OFF = 0x0_u64

      # Clock security system enable (clock detector ON if the HSE is ready, OFF if not)
      ON = 0x1_u64

      def self.reset_value : CSSON
        CR.reset_value.csson
      end
    end

    # Clock Security System              enable
    def csson : CSSON
      CSSON.new!((@value >> 19) & 0x1_u32)
    end

    # Clock Security System              enable
    def self.csson : CSSON
      value.csson
    end

    # Clock Security System              enable
    def self.csson=(value : CSSON) : CSSON
      self.set(csson: value)
      value
    end

    # PLL enable
    def pllon : Bool
      @value.bits_set?(0x1000000_u32)
    end

    # PLL enable
    def self.pllon : Bool
      value.pllon
    end

    # PLL enable
    def self.pllon=(value : Bool) : Bool
      self.set(pllon: value)
      value
    end

    # PLL clock ready flag
    def pllrdy : Bool
      @value.bits_set?(0x2000000_u32)
    end

    # PLL clock ready flag
    def self.pllrdy : Bool
      value.pllrdy
    end

    def copy_with(
      *,

      hsion : HSION? = nil,

      hsitrim : UInt8? = nil,

      hseon : Bool? = nil,

      hsebyp : HSEBYP? = nil,

      csson : CSSON? = nil,

      pllon : Bool? = nil
    ) : self
      value = @value

      unless hsion.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(hsion.to_int).&(0x1_u32) << 0
      end

      unless hsitrim.nil?
        value = (value & 0xffffff07_u32) |
                UInt32.new!(hsitrim.to_int).&(0x1f_u32) << 3
      end

      unless hseon.nil?
        value = (value & 0xfffeffff_u32) |
                UInt32.new!(hseon.to_int).&(0x1_u32) << 16
      end

      unless hsebyp.nil?
        value = (value & 0xfffbffff_u32) |
                UInt32.new!(hsebyp.to_int).&(0x1_u32) << 18
      end

      unless csson.nil?
        value = (value & 0xfff7ffff_u32) |
                UInt32.new!(csson.to_int).&(0x1_u32) << 19
      end

      unless pllon.nil?
        value = (value & 0xfeffffff_u32) |
                UInt32.new!(pllon.to_int).&(0x1_u32) << 24
      end

      self.class.new(value)
    end

    def self.set(
      *,
      hsion : HSION? = nil,
      hsitrim : UInt8? = nil,
      hseon : Bool? = nil,
      hsebyp : HSEBYP? = nil,
      csson : CSSON? = nil,
      pllon : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        hsion: hsion,
        hsitrim: hsitrim,
        hseon: hseon,
        hsebyp: hsebyp,
        csson: csson,
        pllon: pllon,
      )
    end
  end # struct

  # Clock configuration register          (RCC_CFGR)
  struct CFGR
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

    enum SW : UInt8
      # HSI selected as system clock
      HSI = 0x0_u64

      # HSE selected as system clock
      HSE = 0x1_u64

      # PLL selected as system clock
      PLL = 0x2_u64

      def self.reset_value : SW
        CFGR.reset_value.sw
      end
    end

    # System clock Switch
    def sw : SW
      SW.new!((@value >> 0) & 0x3_u32)
    end

    # System clock Switch
    def self.sw : SW
      value.sw
    end

    # System clock Switch
    def self.sw=(value : SW) : SW
      self.set(sw: value)
      value
    end

    enum SWS : UInt8
      # HSI oscillator used as system clock
      HSI = 0x0_u64

      # HSE oscillator used as system clock
      HSE = 0x1_u64

      # PLL used as system clock
      PLL = 0x2_u64

      def self.reset_value : SWS
        CFGR.reset_value.sws
      end
    end

    # System Clock Switch Status
    def sws : SWS
      SWS.new!((@value >> 2) & 0x3_u32)
    end

    # System Clock Switch Status
    def self.sws : SWS
      value.sws
    end

    enum HPRE : UInt8
      # SYSCLK not divided
      DIV1 = 0x0_u64

      # SYSCLK divided by 2
      DIV2 = 0x8_u64

      # SYSCLK divided by 4
      DIV4 = 0x9_u64

      # SYSCLK divided by 8
      DIV8 = 0xa_u64

      # SYSCLK divided by 16
      DIV16 = 0xb_u64

      # SYSCLK divided by 64
      DIV64 = 0xc_u64

      # SYSCLK divided by 128
      DIV128 = 0xd_u64

      # SYSCLK divided by 256
      DIV256 = 0xe_u64

      # SYSCLK divided by 512
      DIV512 = 0xf_u64

      def self.reset_value : HPRE
        CFGR.reset_value.hpre
      end
    end

    # AHB prescaler
    def hpre : HPRE
      HPRE.new!((@value >> 4) & 0xf_u32)
    end

    # AHB prescaler
    def self.hpre : HPRE
      value.hpre
    end

    # AHB prescaler
    def self.hpre=(value : HPRE) : HPRE
      self.set(hpre: value)
      value
    end

    enum PPRE1 : UInt8
      # HCLK not divided
      DIV1 = 0x0_u64

      # HCLK divided by 2
      DIV2 = 0x4_u64

      # HCLK divided by 4
      DIV4 = 0x5_u64

      # HCLK divided by 8
      DIV8 = 0x6_u64

      # HCLK divided by 16
      DIV16 = 0x7_u64

      def self.reset_value : PPRE1
        CFGR.reset_value.ppre1
      end
    end

    # APB Low speed prescaler              (APB1)
    def ppre1 : PPRE1
      PPRE1.new!((@value >> 8) & 0x7_u32)
    end

    # APB Low speed prescaler              (APB1)
    def self.ppre1 : PPRE1
      value.ppre1
    end

    # APB Low speed prescaler              (APB1)
    def self.ppre1=(value : PPRE1) : PPRE1
      self.set(ppre1: value)
      value
    end

    # APB high speed prescaler              (APB2)
    def ppre2 : UInt8
      UInt8.new!((@value >> 11) & 0x7_u32)
    end

    # APB high speed prescaler              (APB2)
    def self.ppre2 : UInt8
      value.ppre2
    end

    # APB high speed prescaler              (APB2)
    def self.ppre2=(value : UInt8) : UInt8
      self.set(ppre2: value)
      value
    end

    enum PLLSRC : UInt8
      # HSI divided by 2 selected as PLL input clock
      HSI_DIV2 = 0x0_u64

      # HSI divided by PREDIV selected as PLL input clock
      HSI_DIV_PREDIV = 0x1_u64

      # HSE divided by PREDIV selected as PLL input clock
      HSE_DIV_PREDIV = 0x2_u64

      def self.reset_value : PLLSRC
        CFGR.reset_value.pllsrc
      end
    end

    # PLL entry clock source
    def pllsrc : PLLSRC
      PLLSRC.new!((@value >> 15) & 0x3_u32)
    end

    # PLL entry clock source
    def self.pllsrc : PLLSRC
      value.pllsrc
    end

    # PLL entry clock source
    def self.pllsrc=(value : PLLSRC) : PLLSRC
      self.set(pllsrc: value)
      value
    end

    enum PLLXTPRE : UInt8
      # HSE clock not divided
      DIV1 = 0x0_u64

      # HSE clock divided by 2
      DIV2 = 0x1_u64

      def self.reset_value : PLLXTPRE
        CFGR.reset_value.pllxtpre
      end
    end

    # HSE divider for PLL entry
    def pllxtpre : PLLXTPRE
      PLLXTPRE.new!((@value >> 17) & 0x1_u32)
    end

    # HSE divider for PLL entry
    def self.pllxtpre : PLLXTPRE
      value.pllxtpre
    end

    # HSE divider for PLL entry
    def self.pllxtpre=(value : PLLXTPRE) : PLLXTPRE
      self.set(pllxtpre: value)
      value
    end

    enum PLLMUL : UInt8
      # PLL input clock x2
      MUL2 = 0x0_u64

      # PLL input clock x3
      MUL3 = 0x1_u64

      # PLL input clock x4
      MUL4 = 0x2_u64

      # PLL input clock x5
      MUL5 = 0x3_u64

      # PLL input clock x6
      MUL6 = 0x4_u64

      # PLL input clock x7
      MUL7 = 0x5_u64

      # PLL input clock x8
      MUL8 = 0x6_u64

      # PLL input clock x9
      MUL9 = 0x7_u64

      # PLL input clock x10
      MUL10 = 0x8_u64

      # PLL input clock x11
      MUL11 = 0x9_u64

      # PLL input clock x12
      MUL12 = 0xa_u64

      # PLL input clock x13
      MUL13 = 0xb_u64

      # PLL input clock x14
      MUL14 = 0xc_u64

      # PLL input clock x15
      MUL15 = 0xd_u64

      # PLL input clock x16
      MUL16 = 0xe_u64

      # PLL input clock x16
      MUL16X = 0xf_u64

      def self.reset_value : PLLMUL
        CFGR.reset_value.pllmul
      end
    end

    # PLL Multiplication Factor
    def pllmul : PLLMUL
      PLLMUL.new!((@value >> 18) & 0xf_u32)
    end

    # PLL Multiplication Factor
    def self.pllmul : PLLMUL
      value.pllmul
    end

    # PLL Multiplication Factor
    def self.pllmul=(value : PLLMUL) : PLLMUL
      self.set(pllmul: value)
      value
    end

    enum USBPRE : UInt8
      # PLL clock is divided by 1.5
      DIV1_5 = 0x0_u64

      # PLL clock is not divided
      DIV1 = 0x1_u64

      def self.reset_value : USBPRE
        CFGR.reset_value.usbpre
      end
    end

    # USB prescaler
    def usbpre : USBPRE
      USBPRE.new!((@value >> 22) & 0x1_u32)
    end

    # USB prescaler
    def self.usbpre : USBPRE
      value.usbpre
    end

    # USB prescaler
    def self.usbpre=(value : USBPRE) : USBPRE
      self.set(usbpre: value)
      value
    end

    enum MCO : UInt8
      # MCO output disabled, no clock on MCO
      NOMCO = 0x0_u64

      # Internal low speed (LSI) oscillator clock selected
      LSI = 0x2_u64

      # External low speed (LSE) oscillator clock selected
      LSE = 0x3_u64

      # System clock selected
      SYSCLK = 0x4_u64

      # Internal RC 8 MHz (HSI) oscillator clock selected
      HSI = 0x5_u64

      # External 4-32 MHz (HSE) oscillator clock selected
      HSE = 0x6_u64

      # PLL clock selected (divided by 1 or 2, depending en PLLNODIV)
      PLL = 0x7_u64

      def self.reset_value : MCO
        CFGR.reset_value.mco
      end
    end

    # Microcontroller clock              output
    def mco : MCO
      MCO.new!((@value >> 24) & 0x7_u32)
    end

    # Microcontroller clock              output
    def self.mco : MCO
      value.mco
    end

    # Microcontroller clock              output
    def self.mco=(value : MCO) : MCO
      self.set(mco: value)
      value
    end

    enum I2SSRC : UInt8
      # System clock used as I2S clock source
      SYSCLK = 0x0_u64

      # External clock mapped on the I2S_CKIN pin used as I2S clock source
      CKIN = 0x1_u64

      def self.reset_value : I2SSRC
        CFGR.reset_value.i2_ssrc
      end
    end

    # I2S external clock source              selection
    def i2_ssrc : I2SSRC
      I2SSRC.new!((@value >> 23) & 0x1_u32)
    end

    # I2S external clock source              selection
    def self.i2_ssrc : I2SSRC
      value.i2_ssrc
    end

    # I2S external clock source              selection
    def self.i2_ssrc=(value : I2SSRC) : I2SSRC
      self.set(i2_ssrc: value)
      value
    end

    enum MCOPRE : UInt8
      # MCO is divided by 1
      DIV1 = 0x0_u64

      # MCO is divided by 2
      DIV2 = 0x1_u64

      # MCO is divided by 4
      DIV4 = 0x2_u64

      # MCO is divided by 8
      DIV8 = 0x3_u64

      # MCO is divided by 16
      DIV16 = 0x4_u64

      # MCO is divided by 32
      DIV32 = 0x5_u64

      # MCO is divided by 64
      DIV64 = 0x6_u64

      # MCO is divided by 128
      DIV128 = 0x7_u64

      def self.reset_value : MCOPRE
        CFGR.reset_value.mcopre
      end
    end

    # Microcontroller Clock Output Prescaler
    def mcopre : MCOPRE
      MCOPRE.new!((@value >> 28) & 0x7_u32)
    end

    # Microcontroller Clock Output Prescaler
    def self.mcopre : MCOPRE
      value.mcopre
    end

    enum PLLNODIV : UInt8
      # PLL is divided by 2 for MCO
      DIV2 = 0x0_u64

      # PLL is not divided for MCO
      DIV1 = 0x1_u64

      def self.reset_value : PLLNODIV
        CFGR.reset_value.pllnodiv
      end
    end

    # Do not divide PLL to MCO
    def pllnodiv : PLLNODIV
      PLLNODIV.new!((@value >> 31) & 0x1_u32)
    end

    # Do not divide PLL to MCO
    def self.pllnodiv : PLLNODIV
      value.pllnodiv
    end

    def copy_with(
      *,

      sw : SW? = nil,

      hpre : HPRE? = nil,

      ppre1 : PPRE1? = nil,

      ppre2 : UInt8? = nil,

      pllsrc : PLLSRC? = nil,

      pllxtpre : PLLXTPRE? = nil,

      pllmul : PLLMUL? = nil,

      usbpre : USBPRE? = nil,

      mco : MCO? = nil,

      i2_ssrc : I2SSRC? = nil
    ) : self
      value = @value

      unless sw.nil?
        value = (value & 0xfffffffc_u32) |
                UInt32.new!(sw.to_int).&(0x3_u32) << 0
      end

      unless hpre.nil?
        value = (value & 0xffffff0f_u32) |
                UInt32.new!(hpre.to_int).&(0xf_u32) << 4
      end

      unless ppre1.nil?
        value = (value & 0xfffff8ff_u32) |
                UInt32.new!(ppre1.to_int).&(0x7_u32) << 8
      end

      unless ppre2.nil?
        value = (value & 0xffffc7ff_u32) |
                UInt32.new!(ppre2.to_int).&(0x7_u32) << 11
      end

      unless pllsrc.nil?
        value = (value & 0xfffe7fff_u32) |
                UInt32.new!(pllsrc.to_int).&(0x3_u32) << 15
      end

      unless pllxtpre.nil?
        value = (value & 0xfffdffff_u32) |
                UInt32.new!(pllxtpre.to_int).&(0x1_u32) << 17
      end

      unless pllmul.nil?
        value = (value & 0xffc3ffff_u32) |
                UInt32.new!(pllmul.to_int).&(0xf_u32) << 18
      end

      unless usbpre.nil?
        value = (value & 0xffbfffff_u32) |
                UInt32.new!(usbpre.to_int).&(0x1_u32) << 22
      end

      unless mco.nil?
        value = (value & 0xf8ffffff_u32) |
                UInt32.new!(mco.to_int).&(0x7_u32) << 24
      end

      unless i2_ssrc.nil?
        value = (value & 0xff7fffff_u32) |
                UInt32.new!(i2_ssrc.to_int).&(0x1_u32) << 23
      end

      self.class.new(value)
    end

    def self.set(
      *,
      sw : SW? = nil,
      hpre : HPRE? = nil,
      ppre1 : PPRE1? = nil,
      ppre2 : UInt8? = nil,
      pllsrc : PLLSRC? = nil,
      pllxtpre : PLLXTPRE? = nil,
      pllmul : PLLMUL? = nil,
      usbpre : USBPRE? = nil,
      mco : MCO? = nil,
      i2_ssrc : I2SSRC? = nil
    ) : Nil
      self.value = self.value.copy_with(
        sw: sw,
        hpre: hpre,
        ppre1: ppre1,
        ppre2: ppre2,
        pllsrc: pllsrc,
        pllxtpre: pllxtpre,
        pllmul: pllmul,
        usbpre: usbpre,
        mco: mco,
        i2_ssrc: i2_ssrc,
      )
    end
  end # struct

  # Clock interrupt register          (RCC_CIR)
  struct CIR
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

    enum LSIRDYF : UInt8
      # No clock ready interrupt
      NOTINTERRUPTED = 0x0_u64

      # Clock ready interrupt
      INTERRUPTED = 0x1_u64

      def self.reset_value : LSIRDYF
        CIR.reset_value.lsirdyf
      end
    end

    # LSI Ready Interrupt flag
    def lsirdyf : LSIRDYF
      LSIRDYF.new!((@value >> 0) & 0x1_u32)
    end

    # LSI Ready Interrupt flag
    def self.lsirdyf : LSIRDYF
      value.lsirdyf
    end

    # LSE Ready Interrupt flag
    def lserdyf : Bool
      @value.bits_set?(0x2_u32)
    end

    # LSE Ready Interrupt flag
    def self.lserdyf : Bool
      value.lserdyf
    end

    # HSI Ready Interrupt flag
    def hsirdyf : Bool
      @value.bits_set?(0x4_u32)
    end

    # HSI Ready Interrupt flag
    def self.hsirdyf : Bool
      value.hsirdyf
    end

    # HSE Ready Interrupt flag
    def hserdyf : Bool
      @value.bits_set?(0x8_u32)
    end

    # HSE Ready Interrupt flag
    def self.hserdyf : Bool
      value.hserdyf
    end

    # PLL Ready Interrupt flag
    def pllrdyf : Bool
      @value.bits_set?(0x10_u32)
    end

    # PLL Ready Interrupt flag
    def self.pllrdyf : Bool
      value.pllrdyf
    end

    enum CSSF : UInt8
      # No clock security interrupt caused by HSE clock failure
      NOTINTERRUPTED = 0x0_u64

      # Clock security interrupt caused by HSE clock failure
      INTERRUPTED = 0x1_u64

      def self.reset_value : CSSF
        CIR.reset_value.cssf
      end
    end

    # Clock Security System Interrupt              flag
    def cssf : CSSF
      CSSF.new!((@value >> 7) & 0x1_u32)
    end

    # Clock Security System Interrupt              flag
    def self.cssf : CSSF
      value.cssf
    end

    enum LSIRDYIE : UInt8
      # Interrupt disabled
      DISABLED = 0x0_u64

      # Interrupt enabled
      ENABLED = 0x1_u64

      def self.reset_value : LSIRDYIE
        CIR.reset_value.lsirdyie
      end
    end

    # LSI Ready Interrupt Enable
    def lsirdyie : LSIRDYIE
      LSIRDYIE.new!((@value >> 8) & 0x1_u32)
    end

    # LSI Ready Interrupt Enable
    def self.lsirdyie : LSIRDYIE
      value.lsirdyie
    end

    # LSI Ready Interrupt Enable
    def self.lsirdyie=(value : LSIRDYIE) : LSIRDYIE
      self.set(lsirdyie: value)
      value
    end

    # LSE Ready Interrupt Enable
    def lserdyie : Bool
      @value.bits_set?(0x200_u32)
    end

    # LSE Ready Interrupt Enable
    def self.lserdyie : Bool
      value.lserdyie
    end

    # LSE Ready Interrupt Enable
    def self.lserdyie=(value : Bool) : Bool
      self.set(lserdyie: value)
      value
    end

    # HSI Ready Interrupt Enable
    def hsirdyie : Bool
      @value.bits_set?(0x400_u32)
    end

    # HSI Ready Interrupt Enable
    def self.hsirdyie : Bool
      value.hsirdyie
    end

    # HSI Ready Interrupt Enable
    def self.hsirdyie=(value : Bool) : Bool
      self.set(hsirdyie: value)
      value
    end

    # HSE Ready Interrupt Enable
    def hserdyie : Bool
      @value.bits_set?(0x800_u32)
    end

    # HSE Ready Interrupt Enable
    def self.hserdyie : Bool
      value.hserdyie
    end

    # HSE Ready Interrupt Enable
    def self.hserdyie=(value : Bool) : Bool
      self.set(hserdyie: value)
      value
    end

    # PLL Ready Interrupt Enable
    def pllrdyie : Bool
      @value.bits_set?(0x1000_u32)
    end

    # PLL Ready Interrupt Enable
    def self.pllrdyie : Bool
      value.pllrdyie
    end

    # PLL Ready Interrupt Enable
    def self.pllrdyie=(value : Bool) : Bool
      self.set(pllrdyie: value)
      value
    end

    enum LSIRDYC : UInt8
      # Clear interrupt flag
      CLEAR = 0x1_u64

      def self.reset_value : LSIRDYC
        CIR.reset_value.lsirdyc
      end
    end

    # LSI Ready Interrupt Clear
    def self.lsirdyc=(value : LSIRDYC) : LSIRDYC
      self.set(lsirdyc: value)
      value
    end

    # LSE Ready Interrupt Clear
    def self.lserdyc=(value : Bool) : Bool
      self.set(lserdyc: value)
      value
    end

    # HSI Ready Interrupt Clear
    def self.hsirdyc=(value : Bool) : Bool
      self.set(hsirdyc: value)
      value
    end

    # HSE Ready Interrupt Clear
    def self.hserdyc=(value : Bool) : Bool
      self.set(hserdyc: value)
      value
    end

    # PLL Ready Interrupt Clear
    def self.pllrdyc=(value : Bool) : Bool
      self.set(pllrdyc: value)
      value
    end

    enum CSSC : UInt8
      # Clear CSSF flag
      CLEAR = 0x1_u64

      def self.reset_value : CSSC
        CIR.reset_value.cssc
      end
    end

    # Clock security system interrupt              clear
    def self.cssc=(value : CSSC) : CSSC
      self.set(cssc: value)
      value
    end

    def copy_with(
      *,

      lsirdyie : LSIRDYIE? = nil,

      lserdyie : Bool? = nil,

      hsirdyie : Bool? = nil,

      hserdyie : Bool? = nil,

      pllrdyie : Bool? = nil,

      lsirdyc : LSIRDYC? = nil,

      lserdyc : Bool? = nil,

      hsirdyc : Bool? = nil,

      hserdyc : Bool? = nil,

      pllrdyc : Bool? = nil,

      cssc : CSSC? = nil
    ) : self
      value = @value

      unless lsirdyie.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(lsirdyie.to_int).&(0x1_u32) << 8
      end

      unless lserdyie.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(lserdyie.to_int).&(0x1_u32) << 9
      end

      unless hsirdyie.nil?
        value = (value & 0xfffffbff_u32) |
                UInt32.new!(hsirdyie.to_int).&(0x1_u32) << 10
      end

      unless hserdyie.nil?
        value = (value & 0xfffff7ff_u32) |
                UInt32.new!(hserdyie.to_int).&(0x1_u32) << 11
      end

      unless pllrdyie.nil?
        value = (value & 0xffffefff_u32) |
                UInt32.new!(pllrdyie.to_int).&(0x1_u32) << 12
      end

      unless lsirdyc.nil?
        value = (value & 0xfffeffff_u32) |
                UInt32.new!(lsirdyc.to_int).&(0x1_u32) << 16
      end

      unless lserdyc.nil?
        value = (value & 0xfffdffff_u32) |
                UInt32.new!(lserdyc.to_int).&(0x1_u32) << 17
      end

      unless hsirdyc.nil?
        value = (value & 0xfffbffff_u32) |
                UInt32.new!(hsirdyc.to_int).&(0x1_u32) << 18
      end

      unless hserdyc.nil?
        value = (value & 0xfff7ffff_u32) |
                UInt32.new!(hserdyc.to_int).&(0x1_u32) << 19
      end

      unless pllrdyc.nil?
        value = (value & 0xffefffff_u32) |
                UInt32.new!(pllrdyc.to_int).&(0x1_u32) << 20
      end

      unless cssc.nil?
        value = (value & 0xff7fffff_u32) |
                UInt32.new!(cssc.to_int).&(0x1_u32) << 23
      end

      self.class.new(value)
    end

    def self.set(
      *,
      lsirdyie : LSIRDYIE? = nil,
      lserdyie : Bool? = nil,
      hsirdyie : Bool? = nil,
      hserdyie : Bool? = nil,
      pllrdyie : Bool? = nil,
      lsirdyc : LSIRDYC? = nil,
      lserdyc : Bool? = nil,
      hsirdyc : Bool? = nil,
      hserdyc : Bool? = nil,
      pllrdyc : Bool? = nil,
      cssc : CSSC? = nil
    ) : Nil
      self.value = self.value.copy_with(
        lsirdyie: lsirdyie,
        lserdyie: lserdyie,
        hsirdyie: hsirdyie,
        hserdyie: hserdyie,
        pllrdyie: pllrdyie,
        lsirdyc: lsirdyc,
        lserdyc: lserdyc,
        hsirdyc: hsirdyc,
        hserdyc: hserdyc,
        pllrdyc: pllrdyc,
        cssc: cssc,
      )
    end
  end # struct

  # APB2 peripheral reset register          (RCC_APB2RSTR)
  struct APB2RSTR
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

    enum SYSCFGRST : UInt8
      # Reset the selected module
      RESET = 0x1_u64

      def self.reset_value : SYSCFGRST
        APB2RSTR.reset_value.syscfgrst
      end
    end

    # SYSCFG and COMP reset
    def syscfgrst : SYSCFGRST
      SYSCFGRST.new!((@value >> 0) & 0x1_u32)
    end

    # SYSCFG and COMP reset
    def self.syscfgrst : SYSCFGRST
      value.syscfgrst
    end

    # SYSCFG and COMP reset
    def self.syscfgrst=(value : SYSCFGRST) : SYSCFGRST
      self.set(syscfgrst: value)
      value
    end

    # TIM1 timer reset
    def tim1_rst : Bool
      @value.bits_set?(0x800_u32)
    end

    # TIM1 timer reset
    def self.tim1_rst : Bool
      value.tim1_rst
    end

    # TIM1 timer reset
    def self.tim1_rst=(value : Bool) : Bool
      self.set(tim1_rst: value)
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

    # TIM8 timer reset
    def tim8_rst : Bool
      @value.bits_set?(0x2000_u32)
    end

    # TIM8 timer reset
    def self.tim8_rst : Bool
      value.tim8_rst
    end

    # TIM8 timer reset
    def self.tim8_rst=(value : Bool) : Bool
      self.set(tim8_rst: value)
      value
    end

    # USART1 reset
    def usart1_rst : Bool
      @value.bits_set?(0x4000_u32)
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

    # TIM15 timer reset
    def tim15_rst : Bool
      @value.bits_set?(0x10000_u32)
    end

    # TIM15 timer reset
    def self.tim15_rst : Bool
      value.tim15_rst
    end

    # TIM15 timer reset
    def self.tim15_rst=(value : Bool) : Bool
      self.set(tim15_rst: value)
      value
    end

    # TIM16 timer reset
    def tim16_rst : Bool
      @value.bits_set?(0x20000_u32)
    end

    # TIM16 timer reset
    def self.tim16_rst : Bool
      value.tim16_rst
    end

    # TIM16 timer reset
    def self.tim16_rst=(value : Bool) : Bool
      self.set(tim16_rst: value)
      value
    end

    # TIM17 timer reset
    def tim17_rst : Bool
      @value.bits_set?(0x40000_u32)
    end

    # TIM17 timer reset
    def self.tim17_rst : Bool
      value.tim17_rst
    end

    # TIM17 timer reset
    def self.tim17_rst=(value : Bool) : Bool
      self.set(tim17_rst: value)
      value
    end

    # SPI4 reset
    def spi4_rst : Bool
      @value.bits_set?(0x8000_u32)
    end

    # SPI4 reset
    def self.spi4_rst : Bool
      value.spi4_rst
    end

    # SPI4 reset
    def self.spi4_rst=(value : Bool) : Bool
      self.set(spi4_rst: value)
      value
    end

    # TIM20 timer reset
    def tim20_rst : Bool
      @value.bits_set?(0x100000_u32)
    end

    # TIM20 timer reset
    def self.tim20_rst : Bool
      value.tim20_rst
    end

    # TIM20 timer reset
    def self.tim20_rst=(value : Bool) : Bool
      self.set(tim20_rst: value)
      value
    end

    def copy_with(
      *,

      syscfgrst : SYSCFGRST? = nil,

      tim1_rst : Bool? = nil,

      spi1_rst : Bool? = nil,

      tim8_rst : Bool? = nil,

      usart1_rst : Bool? = nil,

      tim15_rst : Bool? = nil,

      tim16_rst : Bool? = nil,

      tim17_rst : Bool? = nil,

      spi4_rst : Bool? = nil,

      tim20_rst : Bool? = nil
    ) : self
      value = @value

      unless syscfgrst.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(syscfgrst.to_int).&(0x1_u32) << 0
      end

      unless tim1_rst.nil?
        value = (value & 0xfffff7ff_u32) |
                UInt32.new!(tim1_rst.to_int).&(0x1_u32) << 11
      end

      unless spi1_rst.nil?
        value = (value & 0xffffefff_u32) |
                UInt32.new!(spi1_rst.to_int).&(0x1_u32) << 12
      end

      unless tim8_rst.nil?
        value = (value & 0xffffdfff_u32) |
                UInt32.new!(tim8_rst.to_int).&(0x1_u32) << 13
      end

      unless usart1_rst.nil?
        value = (value & 0xffffbfff_u32) |
                UInt32.new!(usart1_rst.to_int).&(0x1_u32) << 14
      end

      unless tim15_rst.nil?
        value = (value & 0xfffeffff_u32) |
                UInt32.new!(tim15_rst.to_int).&(0x1_u32) << 16
      end

      unless tim16_rst.nil?
        value = (value & 0xfffdffff_u32) |
                UInt32.new!(tim16_rst.to_int).&(0x1_u32) << 17
      end

      unless tim17_rst.nil?
        value = (value & 0xfffbffff_u32) |
                UInt32.new!(tim17_rst.to_int).&(0x1_u32) << 18
      end

      unless spi4_rst.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(spi4_rst.to_int).&(0x1_u32) << 15
      end

      unless tim20_rst.nil?
        value = (value & 0xffefffff_u32) |
                UInt32.new!(tim20_rst.to_int).&(0x1_u32) << 20
      end

      self.class.new(value)
    end

    def self.set(
      *,
      syscfgrst : SYSCFGRST? = nil,
      tim1_rst : Bool? = nil,
      spi1_rst : Bool? = nil,
      tim8_rst : Bool? = nil,
      usart1_rst : Bool? = nil,
      tim15_rst : Bool? = nil,
      tim16_rst : Bool? = nil,
      tim17_rst : Bool? = nil,
      spi4_rst : Bool? = nil,
      tim20_rst : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        syscfgrst: syscfgrst,
        tim1_rst: tim1_rst,
        spi1_rst: spi1_rst,
        tim8_rst: tim8_rst,
        usart1_rst: usart1_rst,
        tim15_rst: tim15_rst,
        tim16_rst: tim16_rst,
        tim17_rst: tim17_rst,
        spi4_rst: spi4_rst,
        tim20_rst: tim20_rst,
      )
    end
  end # struct

  # APB1 peripheral reset register          (RCC_APB1RSTR)
  struct APB1RSTR
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

    enum TIM2RST : UInt8
      # Reset the selected module
      RESET = 0x1_u64

      def self.reset_value : TIM2RST
        APB1RSTR.reset_value.tim2_rst
      end
    end

    # Timer 2 reset
    def tim2_rst : TIM2RST
      TIM2RST.new!((@value >> 0) & 0x1_u32)
    end

    # Timer 2 reset
    def self.tim2_rst : TIM2RST
      value.tim2_rst
    end

    # Timer 2 reset
    def self.tim2_rst=(value : TIM2RST) : TIM2RST
      self.set(tim2_rst: value)
      value
    end

    # Timer 3 reset
    def tim3_rst : Bool
      @value.bits_set?(0x2_u32)
    end

    # Timer 3 reset
    def self.tim3_rst : Bool
      value.tim3_rst
    end

    # Timer 3 reset
    def self.tim3_rst=(value : Bool) : Bool
      self.set(tim3_rst: value)
      value
    end

    # Timer 14 reset
    def tim4_rst : Bool
      @value.bits_set?(0x4_u32)
    end

    # Timer 14 reset
    def self.tim4_rst : Bool
      value.tim4_rst
    end

    # Timer 14 reset
    def self.tim4_rst=(value : Bool) : Bool
      self.set(tim4_rst: value)
      value
    end

    # Timer 6 reset
    def tim6_rst : Bool
      @value.bits_set?(0x10_u32)
    end

    # Timer 6 reset
    def self.tim6_rst : Bool
      value.tim6_rst
    end

    # Timer 6 reset
    def self.tim6_rst=(value : Bool) : Bool
      self.set(tim6_rst: value)
      value
    end

    # Timer 7 reset
    def tim7_rst : Bool
      @value.bits_set?(0x20_u32)
    end

    # Timer 7 reset
    def self.tim7_rst : Bool
      value.tim7_rst
    end

    # Timer 7 reset
    def self.tim7_rst=(value : Bool) : Bool
      self.set(tim7_rst: value)
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

    # SPI2 reset
    def spi2_rst : Bool
      @value.bits_set?(0x4000_u32)
    end

    # SPI2 reset
    def self.spi2_rst : Bool
      value.spi2_rst
    end

    # SPI2 reset
    def self.spi2_rst=(value : Bool) : Bool
      self.set(spi2_rst: value)
      value
    end

    # SPI3 reset
    def spi3_rst : Bool
      @value.bits_set?(0x8000_u32)
    end

    # SPI3 reset
    def self.spi3_rst : Bool
      value.spi3_rst
    end

    # SPI3 reset
    def self.spi3_rst=(value : Bool) : Bool
      self.set(spi3_rst: value)
      value
    end

    # USART 2 reset
    def usart2_rst : Bool
      @value.bits_set?(0x20000_u32)
    end

    # USART 2 reset
    def self.usart2_rst : Bool
      value.usart2_rst
    end

    # USART 2 reset
    def self.usart2_rst=(value : Bool) : Bool
      self.set(usart2_rst: value)
      value
    end

    # USART3 reset
    def usart3_rst : Bool
      @value.bits_set?(0x40000_u32)
    end

    # USART3 reset
    def self.usart3_rst : Bool
      value.usart3_rst
    end

    # USART3 reset
    def self.usart3_rst=(value : Bool) : Bool
      self.set(usart3_rst: value)
      value
    end

    # UART 4 reset
    def uart4_rst : Bool
      @value.bits_set?(0x80000_u32)
    end

    # UART 4 reset
    def self.uart4_rst : Bool
      value.uart4_rst
    end

    # UART 4 reset
    def self.uart4_rst=(value : Bool) : Bool
      self.set(uart4_rst: value)
      value
    end

    # UART 5 reset
    def uart5_rst : Bool
      @value.bits_set?(0x100000_u32)
    end

    # UART 5 reset
    def self.uart5_rst : Bool
      value.uart5_rst
    end

    # UART 5 reset
    def self.uart5_rst=(value : Bool) : Bool
      self.set(uart5_rst: value)
      value
    end

    # I2C1 reset
    def i2_c1_rst : Bool
      @value.bits_set?(0x200000_u32)
    end

    # I2C1 reset
    def self.i2_c1_rst : Bool
      value.i2_c1_rst
    end

    # I2C1 reset
    def self.i2_c1_rst=(value : Bool) : Bool
      self.set(i2_c1_rst: value)
      value
    end

    # I2C2 reset
    def i2_c2_rst : Bool
      @value.bits_set?(0x400000_u32)
    end

    # I2C2 reset
    def self.i2_c2_rst : Bool
      value.i2_c2_rst
    end

    # I2C2 reset
    def self.i2_c2_rst=(value : Bool) : Bool
      self.set(i2_c2_rst: value)
      value
    end

    # USB reset
    def usbrst : Bool
      @value.bits_set?(0x800000_u32)
    end

    # USB reset
    def self.usbrst : Bool
      value.usbrst
    end

    # USB reset
    def self.usbrst=(value : Bool) : Bool
      self.set(usbrst: value)
      value
    end

    # CAN reset
    def canrst : Bool
      @value.bits_set?(0x2000000_u32)
    end

    # CAN reset
    def self.canrst : Bool
      value.canrst
    end

    # CAN reset
    def self.canrst=(value : Bool) : Bool
      self.set(canrst: value)
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

    # DAC interface reset
    def dac1_rst : Bool
      @value.bits_set?(0x20000000_u32)
    end

    # DAC interface reset
    def self.dac1_rst : Bool
      value.dac1_rst
    end

    # DAC interface reset
    def self.dac1_rst=(value : Bool) : Bool
      self.set(dac1_rst: value)
      value
    end

    # I2C3 reset
    def i2_c3_rst : Bool
      @value.bits_set?(0x40000000_u32)
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

    # DAC2 interface reset
    def dac2_rst : Bool
      @value.bits_set?(0x4000000_u32)
    end

    # DAC2 interface reset
    def self.dac2_rst : Bool
      value.dac2_rst
    end

    # DAC2 interface reset
    def self.dac2_rst=(value : Bool) : Bool
      self.set(dac2_rst: value)
      value
    end

    def copy_with(
      *,

      tim2_rst : TIM2RST? = nil,

      tim3_rst : Bool? = nil,

      tim4_rst : Bool? = nil,

      tim6_rst : Bool? = nil,

      tim7_rst : Bool? = nil,

      wwdgrst : Bool? = nil,

      spi2_rst : Bool? = nil,

      spi3_rst : Bool? = nil,

      usart2_rst : Bool? = nil,

      usart3_rst : Bool? = nil,

      uart4_rst : Bool? = nil,

      uart5_rst : Bool? = nil,

      i2_c1_rst : Bool? = nil,

      i2_c2_rst : Bool? = nil,

      usbrst : Bool? = nil,

      canrst : Bool? = nil,

      pwrrst : Bool? = nil,

      dac1_rst : Bool? = nil,

      i2_c3_rst : Bool? = nil,

      dac2_rst : Bool? = nil
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

      unless tim6_rst.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(tim6_rst.to_int).&(0x1_u32) << 4
      end

      unless tim7_rst.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(tim7_rst.to_int).&(0x1_u32) << 5
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

      unless usart2_rst.nil?
        value = (value & 0xfffdffff_u32) |
                UInt32.new!(usart2_rst.to_int).&(0x1_u32) << 17
      end

      unless usart3_rst.nil?
        value = (value & 0xfffbffff_u32) |
                UInt32.new!(usart3_rst.to_int).&(0x1_u32) << 18
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

      unless usbrst.nil?
        value = (value & 0xff7fffff_u32) |
                UInt32.new!(usbrst.to_int).&(0x1_u32) << 23
      end

      unless canrst.nil?
        value = (value & 0xfdffffff_u32) |
                UInt32.new!(canrst.to_int).&(0x1_u32) << 25
      end

      unless pwrrst.nil?
        value = (value & 0xefffffff_u32) |
                UInt32.new!(pwrrst.to_int).&(0x1_u32) << 28
      end

      unless dac1_rst.nil?
        value = (value & 0xdfffffff_u32) |
                UInt32.new!(dac1_rst.to_int).&(0x1_u32) << 29
      end

      unless i2_c3_rst.nil?
        value = (value & 0xbfffffff_u32) |
                UInt32.new!(i2_c3_rst.to_int).&(0x1_u32) << 30
      end

      unless dac2_rst.nil?
        value = (value & 0xfbffffff_u32) |
                UInt32.new!(dac2_rst.to_int).&(0x1_u32) << 26
      end

      self.class.new(value)
    end

    def self.set(
      *,
      tim2_rst : TIM2RST? = nil,
      tim3_rst : Bool? = nil,
      tim4_rst : Bool? = nil,
      tim6_rst : Bool? = nil,
      tim7_rst : Bool? = nil,
      wwdgrst : Bool? = nil,
      spi2_rst : Bool? = nil,
      spi3_rst : Bool? = nil,
      usart2_rst : Bool? = nil,
      usart3_rst : Bool? = nil,
      uart4_rst : Bool? = nil,
      uart5_rst : Bool? = nil,
      i2_c1_rst : Bool? = nil,
      i2_c2_rst : Bool? = nil,
      usbrst : Bool? = nil,
      canrst : Bool? = nil,
      pwrrst : Bool? = nil,
      dac1_rst : Bool? = nil,
      i2_c3_rst : Bool? = nil,
      dac2_rst : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        tim2_rst: tim2_rst,
        tim3_rst: tim3_rst,
        tim4_rst: tim4_rst,
        tim6_rst: tim6_rst,
        tim7_rst: tim7_rst,
        wwdgrst: wwdgrst,
        spi2_rst: spi2_rst,
        spi3_rst: spi3_rst,
        usart2_rst: usart2_rst,
        usart3_rst: usart3_rst,
        uart4_rst: uart4_rst,
        uart5_rst: uart5_rst,
        i2_c1_rst: i2_c1_rst,
        i2_c2_rst: i2_c2_rst,
        usbrst: usbrst,
        canrst: canrst,
        pwrrst: pwrrst,
        dac1_rst: dac1_rst,
        i2_c3_rst: i2_c3_rst,
        dac2_rst: dac2_rst,
      )
    end
  end # struct

  # AHB Peripheral Clock enable register          (RCC_AHBENR)
  struct AHBENR
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
      new(0x14_u64)
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

    enum DMA1EN : UInt8
      # The selected clock is disabled
      DISABLED = 0x0_u64

      # The selected clock is enabled
      ENABLED = 0x1_u64

      def self.reset_value : DMA1EN
        AHBENR.reset_value.dma1_en
      end
    end

    # DMA1 clock enable
    def dma1_en : DMA1EN
      DMA1EN.new!((@value >> 0) & 0x1_u32)
    end

    # DMA1 clock enable
    def self.dma1_en : DMA1EN
      value.dma1_en
    end

    # DMA1 clock enable
    def self.dma1_en=(value : DMA1EN) : DMA1EN
      self.set(dma1_en: value)
      value
    end

    # DMA2 clock enable
    def dma2_en : Bool
      @value.bits_set?(0x2_u32)
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

    # SRAM interface clock              enable
    def sramen : Bool
      @value.bits_set?(0x4_u32)
    end

    # SRAM interface clock              enable
    def self.sramen : Bool
      value.sramen
    end

    # SRAM interface clock              enable
    def self.sramen=(value : Bool) : Bool
      self.set(sramen: value)
      value
    end

    # FLITF clock enable
    def flitfen : Bool
      @value.bits_set?(0x10_u32)
    end

    # FLITF clock enable
    def self.flitfen : Bool
      value.flitfen
    end

    # FLITF clock enable
    def self.flitfen=(value : Bool) : Bool
      self.set(flitfen: value)
      value
    end

    # FMC clock enable
    def fmcen : Bool
      @value.bits_set?(0x20_u32)
    end

    # FMC clock enable
    def self.fmcen : Bool
      value.fmcen
    end

    # FMC clock enable
    def self.fmcen=(value : Bool) : Bool
      self.set(fmcen: value)
      value
    end

    # CRC clock enable
    def crcen : Bool
      @value.bits_set?(0x40_u32)
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

    # IO port H clock enable
    def iophen : Bool
      @value.bits_set?(0x10000_u32)
    end

    # IO port H clock enable
    def self.iophen : Bool
      value.iophen
    end

    # IO port H clock enable
    def self.iophen=(value : Bool) : Bool
      self.set(iophen: value)
      value
    end

    # I/O port A clock enable
    def iopaen : Bool
      @value.bits_set?(0x20000_u32)
    end

    # I/O port A clock enable
    def self.iopaen : Bool
      value.iopaen
    end

    # I/O port A clock enable
    def self.iopaen=(value : Bool) : Bool
      self.set(iopaen: value)
      value
    end

    # I/O port B clock enable
    def iopben : Bool
      @value.bits_set?(0x40000_u32)
    end

    # I/O port B clock enable
    def self.iopben : Bool
      value.iopben
    end

    # I/O port B clock enable
    def self.iopben=(value : Bool) : Bool
      self.set(iopben: value)
      value
    end

    # I/O port C clock enable
    def iopcen : Bool
      @value.bits_set?(0x80000_u32)
    end

    # I/O port C clock enable
    def self.iopcen : Bool
      value.iopcen
    end

    # I/O port C clock enable
    def self.iopcen=(value : Bool) : Bool
      self.set(iopcen: value)
      value
    end

    # I/O port D clock enable
    def iopden : Bool
      @value.bits_set?(0x100000_u32)
    end

    # I/O port D clock enable
    def self.iopden : Bool
      value.iopden
    end

    # I/O port D clock enable
    def self.iopden=(value : Bool) : Bool
      self.set(iopden: value)
      value
    end

    # I/O port E clock enable
    def iopeen : Bool
      @value.bits_set?(0x200000_u32)
    end

    # I/O port E clock enable
    def self.iopeen : Bool
      value.iopeen
    end

    # I/O port E clock enable
    def self.iopeen=(value : Bool) : Bool
      self.set(iopeen: value)
      value
    end

    # I/O port F clock enable
    def iopfen : Bool
      @value.bits_set?(0x400000_u32)
    end

    # I/O port F clock enable
    def self.iopfen : Bool
      value.iopfen
    end

    # I/O port F clock enable
    def self.iopfen=(value : Bool) : Bool
      self.set(iopfen: value)
      value
    end

    # I/O port G clock enable
    def iopgen : Bool
      @value.bits_set?(0x800000_u32)
    end

    # I/O port G clock enable
    def self.iopgen : Bool
      value.iopgen
    end

    # I/O port G clock enable
    def self.iopgen=(value : Bool) : Bool
      self.set(iopgen: value)
      value
    end

    # Touch sensing controller clock              enable
    def tscen : Bool
      @value.bits_set?(0x1000000_u32)
    end

    # Touch sensing controller clock              enable
    def self.tscen : Bool
      value.tscen
    end

    # Touch sensing controller clock              enable
    def self.tscen=(value : Bool) : Bool
      self.set(tscen: value)
      value
    end

    # ADC1 and ADC2 clock enable
    def adc12_en : Bool
      @value.bits_set?(0x10000000_u32)
    end

    # ADC1 and ADC2 clock enable
    def self.adc12_en : Bool
      value.adc12_en
    end

    # ADC1 and ADC2 clock enable
    def self.adc12_en=(value : Bool) : Bool
      self.set(adc12_en: value)
      value
    end

    # ADC3 and ADC4 clock enable
    def adc34_en : Bool
      @value.bits_set?(0x20000000_u32)
    end

    # ADC3 and ADC4 clock enable
    def self.adc34_en : Bool
      value.adc34_en
    end

    # ADC3 and ADC4 clock enable
    def self.adc34_en=(value : Bool) : Bool
      self.set(adc34_en: value)
      value
    end

    def copy_with(
      *,

      dma1_en : DMA1EN? = nil,

      dma2_en : Bool? = nil,

      sramen : Bool? = nil,

      flitfen : Bool? = nil,

      fmcen : Bool? = nil,

      crcen : Bool? = nil,

      iophen : Bool? = nil,

      iopaen : Bool? = nil,

      iopben : Bool? = nil,

      iopcen : Bool? = nil,

      iopden : Bool? = nil,

      iopeen : Bool? = nil,

      iopfen : Bool? = nil,

      iopgen : Bool? = nil,

      tscen : Bool? = nil,

      adc12_en : Bool? = nil,

      adc34_en : Bool? = nil
    ) : self
      value = @value

      unless dma1_en.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(dma1_en.to_int).&(0x1_u32) << 0
      end

      unless dma2_en.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(dma2_en.to_int).&(0x1_u32) << 1
      end

      unless sramen.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(sramen.to_int).&(0x1_u32) << 2
      end

      unless flitfen.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(flitfen.to_int).&(0x1_u32) << 4
      end

      unless fmcen.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(fmcen.to_int).&(0x1_u32) << 5
      end

      unless crcen.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(crcen.to_int).&(0x1_u32) << 6
      end

      unless iophen.nil?
        value = (value & 0xfffeffff_u32) |
                UInt32.new!(iophen.to_int).&(0x1_u32) << 16
      end

      unless iopaen.nil?
        value = (value & 0xfffdffff_u32) |
                UInt32.new!(iopaen.to_int).&(0x1_u32) << 17
      end

      unless iopben.nil?
        value = (value & 0xfffbffff_u32) |
                UInt32.new!(iopben.to_int).&(0x1_u32) << 18
      end

      unless iopcen.nil?
        value = (value & 0xfff7ffff_u32) |
                UInt32.new!(iopcen.to_int).&(0x1_u32) << 19
      end

      unless iopden.nil?
        value = (value & 0xffefffff_u32) |
                UInt32.new!(iopden.to_int).&(0x1_u32) << 20
      end

      unless iopeen.nil?
        value = (value & 0xffdfffff_u32) |
                UInt32.new!(iopeen.to_int).&(0x1_u32) << 21
      end

      unless iopfen.nil?
        value = (value & 0xffbfffff_u32) |
                UInt32.new!(iopfen.to_int).&(0x1_u32) << 22
      end

      unless iopgen.nil?
        value = (value & 0xff7fffff_u32) |
                UInt32.new!(iopgen.to_int).&(0x1_u32) << 23
      end

      unless tscen.nil?
        value = (value & 0xfeffffff_u32) |
                UInt32.new!(tscen.to_int).&(0x1_u32) << 24
      end

      unless adc12_en.nil?
        value = (value & 0xefffffff_u32) |
                UInt32.new!(adc12_en.to_int).&(0x1_u32) << 28
      end

      unless adc34_en.nil?
        value = (value & 0xdfffffff_u32) |
                UInt32.new!(adc34_en.to_int).&(0x1_u32) << 29
      end

      self.class.new(value)
    end

    def self.set(
      *,
      dma1_en : DMA1EN? = nil,
      dma2_en : Bool? = nil,
      sramen : Bool? = nil,
      flitfen : Bool? = nil,
      fmcen : Bool? = nil,
      crcen : Bool? = nil,
      iophen : Bool? = nil,
      iopaen : Bool? = nil,
      iopben : Bool? = nil,
      iopcen : Bool? = nil,
      iopden : Bool? = nil,
      iopeen : Bool? = nil,
      iopfen : Bool? = nil,
      iopgen : Bool? = nil,
      tscen : Bool? = nil,
      adc12_en : Bool? = nil,
      adc34_en : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        dma1_en: dma1_en,
        dma2_en: dma2_en,
        sramen: sramen,
        flitfen: flitfen,
        fmcen: fmcen,
        crcen: crcen,
        iophen: iophen,
        iopaen: iopaen,
        iopben: iopben,
        iopcen: iopcen,
        iopden: iopden,
        iopeen: iopeen,
        iopfen: iopfen,
        iopgen: iopgen,
        tscen: tscen,
        adc12_en: adc12_en,
        adc34_en: adc34_en,
      )
    end
  end # struct

  # APB2 peripheral clock enable register          (RCC_APB2ENR)
  struct APB2ENR
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

    enum SYSCFGEN : UInt8
      # The selected clock is disabled
      DISABLED = 0x0_u64

      # The selected clock is enabled
      ENABLED = 0x1_u64

      def self.reset_value : SYSCFGEN
        APB2ENR.reset_value.syscfgen
      end
    end

    # SYSCFG clock enable
    def syscfgen : SYSCFGEN
      SYSCFGEN.new!((@value >> 0) & 0x1_u32)
    end

    # SYSCFG clock enable
    def self.syscfgen : SYSCFGEN
      value.syscfgen
    end

    # SYSCFG clock enable
    def self.syscfgen=(value : SYSCFGEN) : SYSCFGEN
      self.set(syscfgen: value)
      value
    end

    # TIM1 Timer clock enable
    def tim1_en : Bool
      @value.bits_set?(0x800_u32)
    end

    # TIM1 Timer clock enable
    def self.tim1_en : Bool
      value.tim1_en
    end

    # TIM1 Timer clock enable
    def self.tim1_en=(value : Bool) : Bool
      self.set(tim1_en: value)
      value
    end

    # SPI 1 clock enable
    def spi1_en : Bool
      @value.bits_set?(0x1000_u32)
    end

    # SPI 1 clock enable
    def self.spi1_en : Bool
      value.spi1_en
    end

    # SPI 1 clock enable
    def self.spi1_en=(value : Bool) : Bool
      self.set(spi1_en: value)
      value
    end

    # TIM8 Timer clock enable
    def tim8_en : Bool
      @value.bits_set?(0x2000_u32)
    end

    # TIM8 Timer clock enable
    def self.tim8_en : Bool
      value.tim8_en
    end

    # TIM8 Timer clock enable
    def self.tim8_en=(value : Bool) : Bool
      self.set(tim8_en: value)
      value
    end

    # USART1 clock enable
    def usart1_en : Bool
      @value.bits_set?(0x4000_u32)
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

    # TIM15 timer clock enable
    def tim15_en : Bool
      @value.bits_set?(0x10000_u32)
    end

    # TIM15 timer clock enable
    def self.tim15_en : Bool
      value.tim15_en
    end

    # TIM15 timer clock enable
    def self.tim15_en=(value : Bool) : Bool
      self.set(tim15_en: value)
      value
    end

    # TIM16 timer clock enable
    def tim16_en : Bool
      @value.bits_set?(0x20000_u32)
    end

    # TIM16 timer clock enable
    def self.tim16_en : Bool
      value.tim16_en
    end

    # TIM16 timer clock enable
    def self.tim16_en=(value : Bool) : Bool
      self.set(tim16_en: value)
      value
    end

    # TIM17 timer clock enable
    def tim17_en : Bool
      @value.bits_set?(0x40000_u32)
    end

    # TIM17 timer clock enable
    def self.tim17_en : Bool
      value.tim17_en
    end

    # TIM17 timer clock enable
    def self.tim17_en=(value : Bool) : Bool
      self.set(tim17_en: value)
      value
    end

    # SPI4 clock enable
    def spi4_en : Bool
      @value.bits_set?(0x8000_u32)
    end

    # SPI4 clock enable
    def self.spi4_en : Bool
      value.spi4_en
    end

    # SPI4 clock enable
    def self.spi4_en=(value : Bool) : Bool
      self.set(spi4_en: value)
      value
    end

    # TIM20 timer clock enable
    def tim20_en : Bool
      @value.bits_set?(0x100000_u32)
    end

    # TIM20 timer clock enable
    def self.tim20_en : Bool
      value.tim20_en
    end

    # TIM20 timer clock enable
    def self.tim20_en=(value : Bool) : Bool
      self.set(tim20_en: value)
      value
    end

    def copy_with(
      *,

      syscfgen : SYSCFGEN? = nil,

      tim1_en : Bool? = nil,

      spi1_en : Bool? = nil,

      tim8_en : Bool? = nil,

      usart1_en : Bool? = nil,

      tim15_en : Bool? = nil,

      tim16_en : Bool? = nil,

      tim17_en : Bool? = nil,

      spi4_en : Bool? = nil,

      tim20_en : Bool? = nil
    ) : self
      value = @value

      unless syscfgen.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(syscfgen.to_int).&(0x1_u32) << 0
      end

      unless tim1_en.nil?
        value = (value & 0xfffff7ff_u32) |
                UInt32.new!(tim1_en.to_int).&(0x1_u32) << 11
      end

      unless spi1_en.nil?
        value = (value & 0xffffefff_u32) |
                UInt32.new!(spi1_en.to_int).&(0x1_u32) << 12
      end

      unless tim8_en.nil?
        value = (value & 0xffffdfff_u32) |
                UInt32.new!(tim8_en.to_int).&(0x1_u32) << 13
      end

      unless usart1_en.nil?
        value = (value & 0xffffbfff_u32) |
                UInt32.new!(usart1_en.to_int).&(0x1_u32) << 14
      end

      unless tim15_en.nil?
        value = (value & 0xfffeffff_u32) |
                UInt32.new!(tim15_en.to_int).&(0x1_u32) << 16
      end

      unless tim16_en.nil?
        value = (value & 0xfffdffff_u32) |
                UInt32.new!(tim16_en.to_int).&(0x1_u32) << 17
      end

      unless tim17_en.nil?
        value = (value & 0xfffbffff_u32) |
                UInt32.new!(tim17_en.to_int).&(0x1_u32) << 18
      end

      unless spi4_en.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(spi4_en.to_int).&(0x1_u32) << 15
      end

      unless tim20_en.nil?
        value = (value & 0xffefffff_u32) |
                UInt32.new!(tim20_en.to_int).&(0x1_u32) << 20
      end

      self.class.new(value)
    end

    def self.set(
      *,
      syscfgen : SYSCFGEN? = nil,
      tim1_en : Bool? = nil,
      spi1_en : Bool? = nil,
      tim8_en : Bool? = nil,
      usart1_en : Bool? = nil,
      tim15_en : Bool? = nil,
      tim16_en : Bool? = nil,
      tim17_en : Bool? = nil,
      spi4_en : Bool? = nil,
      tim20_en : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        syscfgen: syscfgen,
        tim1_en: tim1_en,
        spi1_en: spi1_en,
        tim8_en: tim8_en,
        usart1_en: usart1_en,
        tim15_en: tim15_en,
        tim16_en: tim16_en,
        tim17_en: tim17_en,
        spi4_en: spi4_en,
        tim20_en: tim20_en,
      )
    end
  end # struct

  # APB1 peripheral clock enable register          (RCC_APB1ENR)
  struct APB1ENR
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

    enum TIM2EN : UInt8
      # The selected clock is disabled
      DISABLED = 0x0_u64

      # The selected clock is enabled
      ENABLED = 0x1_u64

      def self.reset_value : TIM2EN
        APB1ENR.reset_value.tim2_en
      end
    end

    # Timer 2 clock enable
    def tim2_en : TIM2EN
      TIM2EN.new!((@value >> 0) & 0x1_u32)
    end

    # Timer 2 clock enable
    def self.tim2_en : TIM2EN
      value.tim2_en
    end

    # Timer 2 clock enable
    def self.tim2_en=(value : TIM2EN) : TIM2EN
      self.set(tim2_en: value)
      value
    end

    # Timer 3 clock enable
    def tim3_en : Bool
      @value.bits_set?(0x2_u32)
    end

    # Timer 3 clock enable
    def self.tim3_en : Bool
      value.tim3_en
    end

    # Timer 3 clock enable
    def self.tim3_en=(value : Bool) : Bool
      self.set(tim3_en: value)
      value
    end

    # Timer 4 clock enable
    def tim4_en : Bool
      @value.bits_set?(0x4_u32)
    end

    # Timer 4 clock enable
    def self.tim4_en : Bool
      value.tim4_en
    end

    # Timer 4 clock enable
    def self.tim4_en=(value : Bool) : Bool
      self.set(tim4_en: value)
      value
    end

    # Timer 6 clock enable
    def tim6_en : Bool
      @value.bits_set?(0x10_u32)
    end

    # Timer 6 clock enable
    def self.tim6_en : Bool
      value.tim6_en
    end

    # Timer 6 clock enable
    def self.tim6_en=(value : Bool) : Bool
      self.set(tim6_en: value)
      value
    end

    # Timer 7 clock enable
    def tim7_en : Bool
      @value.bits_set?(0x20_u32)
    end

    # Timer 7 clock enable
    def self.tim7_en : Bool
      value.tim7_en
    end

    # Timer 7 clock enable
    def self.tim7_en=(value : Bool) : Bool
      self.set(tim7_en: value)
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

    # SPI 2 clock enable
    def spi2_en : Bool
      @value.bits_set?(0x4000_u32)
    end

    # SPI 2 clock enable
    def self.spi2_en : Bool
      value.spi2_en
    end

    # SPI 2 clock enable
    def self.spi2_en=(value : Bool) : Bool
      self.set(spi2_en: value)
      value
    end

    # SPI 3 clock enable
    def spi3_en : Bool
      @value.bits_set?(0x8000_u32)
    end

    # SPI 3 clock enable
    def self.spi3_en : Bool
      value.spi3_en
    end

    # SPI 3 clock enable
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

    # USART 3 clock enable
    def usart3_en : Bool
      @value.bits_set?(0x40000_u32)
    end

    # USART 3 clock enable
    def self.usart3_en : Bool
      value.usart3_en
    end

    # USART 3 clock enable
    def self.usart3_en=(value : Bool) : Bool
      self.set(usart3_en: value)
      value
    end

    # USART 4 clock enable
    def uart4_en : Bool
      @value.bits_set?(0x80000_u32)
    end

    # USART 4 clock enable
    def self.uart4_en : Bool
      value.uart4_en
    end

    # USART 4 clock enable
    def self.uart4_en=(value : Bool) : Bool
      self.set(uart4_en: value)
      value
    end

    # USART 5 clock enable
    def uart5_en : Bool
      @value.bits_set?(0x100000_u32)
    end

    # USART 5 clock enable
    def self.uart5_en : Bool
      value.uart5_en
    end

    # USART 5 clock enable
    def self.uart5_en=(value : Bool) : Bool
      self.set(uart5_en: value)
      value
    end

    # I2C 1 clock enable
    def i2_c1_en : Bool
      @value.bits_set?(0x200000_u32)
    end

    # I2C 1 clock enable
    def self.i2_c1_en : Bool
      value.i2_c1_en
    end

    # I2C 1 clock enable
    def self.i2_c1_en=(value : Bool) : Bool
      self.set(i2_c1_en: value)
      value
    end

    # I2C 2 clock enable
    def i2_c2_en : Bool
      @value.bits_set?(0x400000_u32)
    end

    # I2C 2 clock enable
    def self.i2_c2_en : Bool
      value.i2_c2_en
    end

    # I2C 2 clock enable
    def self.i2_c2_en=(value : Bool) : Bool
      self.set(i2_c2_en: value)
      value
    end

    # USB clock enable
    def usben : Bool
      @value.bits_set?(0x800000_u32)
    end

    # USB clock enable
    def self.usben : Bool
      value.usben
    end

    # USB clock enable
    def self.usben=(value : Bool) : Bool
      self.set(usben: value)
      value
    end

    # CAN clock enable
    def canen : Bool
      @value.bits_set?(0x2000000_u32)
    end

    # CAN clock enable
    def self.canen : Bool
      value.canen
    end

    # CAN clock enable
    def self.canen=(value : Bool) : Bool
      self.set(canen: value)
      value
    end

    # DAC2 interface clock              enable
    def dac2_en : Bool
      @value.bits_set?(0x4000000_u32)
    end

    # DAC2 interface clock              enable
    def self.dac2_en : Bool
      value.dac2_en
    end

    # DAC2 interface clock              enable
    def self.dac2_en=(value : Bool) : Bool
      self.set(dac2_en: value)
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
    def dac1_en : Bool
      @value.bits_set?(0x20000000_u32)
    end

    # DAC interface clock enable
    def self.dac1_en : Bool
      value.dac1_en
    end

    # DAC interface clock enable
    def self.dac1_en=(value : Bool) : Bool
      self.set(dac1_en: value)
      value
    end

    # I2C3 clock enable
    def i2_c3_en : Bool
      @value.bits_set?(0x40000000_u32)
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

    def copy_with(
      *,

      tim2_en : TIM2EN? = nil,

      tim3_en : Bool? = nil,

      tim4_en : Bool? = nil,

      tim6_en : Bool? = nil,

      tim7_en : Bool? = nil,

      wwdgen : Bool? = nil,

      spi2_en : Bool? = nil,

      spi3_en : Bool? = nil,

      usart2_en : Bool? = nil,

      usart3_en : Bool? = nil,

      uart4_en : Bool? = nil,

      uart5_en : Bool? = nil,

      i2_c1_en : Bool? = nil,

      i2_c2_en : Bool? = nil,

      usben : Bool? = nil,

      canen : Bool? = nil,

      dac2_en : Bool? = nil,

      pwren : Bool? = nil,

      dac1_en : Bool? = nil,

      i2_c3_en : Bool? = nil
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

      unless tim6_en.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(tim6_en.to_int).&(0x1_u32) << 4
      end

      unless tim7_en.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(tim7_en.to_int).&(0x1_u32) << 5
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

      unless usben.nil?
        value = (value & 0xff7fffff_u32) |
                UInt32.new!(usben.to_int).&(0x1_u32) << 23
      end

      unless canen.nil?
        value = (value & 0xfdffffff_u32) |
                UInt32.new!(canen.to_int).&(0x1_u32) << 25
      end

      unless dac2_en.nil?
        value = (value & 0xfbffffff_u32) |
                UInt32.new!(dac2_en.to_int).&(0x1_u32) << 26
      end

      unless pwren.nil?
        value = (value & 0xefffffff_u32) |
                UInt32.new!(pwren.to_int).&(0x1_u32) << 28
      end

      unless dac1_en.nil?
        value = (value & 0xdfffffff_u32) |
                UInt32.new!(dac1_en.to_int).&(0x1_u32) << 29
      end

      unless i2_c3_en.nil?
        value = (value & 0xbfffffff_u32) |
                UInt32.new!(i2_c3_en.to_int).&(0x1_u32) << 30
      end

      self.class.new(value)
    end

    def self.set(
      *,
      tim2_en : TIM2EN? = nil,
      tim3_en : Bool? = nil,
      tim4_en : Bool? = nil,
      tim6_en : Bool? = nil,
      tim7_en : Bool? = nil,
      wwdgen : Bool? = nil,
      spi2_en : Bool? = nil,
      spi3_en : Bool? = nil,
      usart2_en : Bool? = nil,
      usart3_en : Bool? = nil,
      uart4_en : Bool? = nil,
      uart5_en : Bool? = nil,
      i2_c1_en : Bool? = nil,
      i2_c2_en : Bool? = nil,
      usben : Bool? = nil,
      canen : Bool? = nil,
      dac2_en : Bool? = nil,
      pwren : Bool? = nil,
      dac1_en : Bool? = nil,
      i2_c3_en : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        tim2_en: tim2_en,
        tim3_en: tim3_en,
        tim4_en: tim4_en,
        tim6_en: tim6_en,
        tim7_en: tim7_en,
        wwdgen: wwdgen,
        spi2_en: spi2_en,
        spi3_en: spi3_en,
        usart2_en: usart2_en,
        usart3_en: usart3_en,
        uart4_en: uart4_en,
        uart5_en: uart5_en,
        i2_c1_en: i2_c1_en,
        i2_c2_en: i2_c2_en,
        usben: usben,
        canen: canen,
        dac2_en: dac2_en,
        pwren: pwren,
        dac1_en: dac1_en,
        i2_c3_en: i2_c3_en,
      )
    end
  end # struct

  # Backup domain control register          (RCC_BDCR)
  struct BDCR
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

    enum LSEON : UInt8
      # LSE oscillator Off
      OFF = 0x0_u64

      # LSE oscillator On
      ON = 0x1_u64

      def self.reset_value : LSEON
        BDCR.reset_value.lseon
      end
    end

    # External Low Speed oscillator              enable
    def lseon : LSEON
      LSEON.new!((@value >> 0) & 0x1_u32)
    end

    # External Low Speed oscillator              enable
    def self.lseon : LSEON
      value.lseon
    end

    # External Low Speed oscillator              enable
    def self.lseon=(value : LSEON) : LSEON
      self.set(lseon: value)
      value
    end

    enum LSERDY : UInt8
      # LSE oscillator not ready
      NOTREADY = 0x0_u64

      # LSE oscillator ready
      READY = 0x1_u64

      def self.reset_value : LSERDY
        BDCR.reset_value.lserdy
      end
    end

    # External Low Speed oscillator              ready
    def lserdy : LSERDY
      LSERDY.new!((@value >> 1) & 0x1_u32)
    end

    # External Low Speed oscillator              ready
    def self.lserdy : LSERDY
      value.lserdy
    end

    enum LSEBYP : UInt8
      # LSE crystal oscillator not bypassed
      NOTBYPASSED = 0x0_u64

      # LSE crystal oscillator bypassed with external clock
      BYPASSED = 0x1_u64

      def self.reset_value : LSEBYP
        BDCR.reset_value.lsebyp
      end
    end

    # External Low Speed oscillator              bypass
    def lsebyp : LSEBYP
      LSEBYP.new!((@value >> 2) & 0x1_u32)
    end

    # External Low Speed oscillator              bypass
    def self.lsebyp : LSEBYP
      value.lsebyp
    end

    # External Low Speed oscillator              bypass
    def self.lsebyp=(value : LSEBYP) : LSEBYP
      self.set(lsebyp: value)
      value
    end

    enum LSEDRV : UInt8
      # Low drive capacity
      LOW = 0x0_u64

      # Medium-high drive capacity
      MEDIUMHIGH = 0x1_u64

      # Medium-low drive capacity
      MEDIUMLOW = 0x2_u64

      # High drive capacity
      HIGH = 0x3_u64

      def self.reset_value : LSEDRV
        BDCR.reset_value.lsedrv
      end
    end

    # LSE oscillator drive              capability
    def lsedrv : LSEDRV
      LSEDRV.new!((@value >> 3) & 0x3_u32)
    end

    # LSE oscillator drive              capability
    def self.lsedrv : LSEDRV
      value.lsedrv
    end

    # LSE oscillator drive              capability
    def self.lsedrv=(value : LSEDRV) : LSEDRV
      self.set(lsedrv: value)
      value
    end

    enum RTCSEL : UInt8
      # No clock
      NOCLOCK = 0x0_u64

      # LSE oscillator clock used as RTC clock
      LSE = 0x1_u64

      # LSI oscillator clock used as RTC clock
      LSI = 0x2_u64

      # HSE oscillator clock divided by a prescaler used as RTC clock
      HSE = 0x3_u64

      def self.reset_value : RTCSEL
        BDCR.reset_value.rtcsel
      end
    end

    # RTC clock source selection
    def rtcsel : RTCSEL
      RTCSEL.new!((@value >> 8) & 0x3_u32)
    end

    # RTC clock source selection
    def self.rtcsel : RTCSEL
      value.rtcsel
    end

    # RTC clock source selection
    def self.rtcsel=(value : RTCSEL) : RTCSEL
      self.set(rtcsel: value)
      value
    end

    enum RTCEN : UInt8
      # RTC clock disabled
      DISABLED = 0x0_u64

      # RTC clock enabled
      ENABLED = 0x1_u64

      def self.reset_value : RTCEN
        BDCR.reset_value.rtcen
      end
    end

    # RTC clock enable
    def rtcen : RTCEN
      RTCEN.new!((@value >> 15) & 0x1_u32)
    end

    # RTC clock enable
    def self.rtcen : RTCEN
      value.rtcen
    end

    # RTC clock enable
    def self.rtcen=(value : RTCEN) : RTCEN
      self.set(rtcen: value)
      value
    end

    enum BDRST : UInt8
      # Reset not activated
      DISABLED = 0x0_u64

      # Reset the entire RTC domain
      ENABLED = 0x1_u64

      def self.reset_value : BDRST
        BDCR.reset_value.bdrst
      end
    end

    # Backup domain software              reset
    def bdrst : BDRST
      BDRST.new!((@value >> 16) & 0x1_u32)
    end

    # Backup domain software              reset
    def self.bdrst : BDRST
      value.bdrst
    end

    # Backup domain software              reset
    def self.bdrst=(value : BDRST) : BDRST
      self.set(bdrst: value)
      value
    end

    def copy_with(
      *,

      lseon : LSEON? = nil,

      lsebyp : LSEBYP? = nil,

      lsedrv : LSEDRV? = nil,

      rtcsel : RTCSEL? = nil,

      rtcen : RTCEN? = nil,

      bdrst : BDRST? = nil
    ) : self
      value = @value

      unless lseon.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(lseon.to_int).&(0x1_u32) << 0
      end

      unless lsebyp.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(lsebyp.to_int).&(0x1_u32) << 2
      end

      unless lsedrv.nil?
        value = (value & 0xffffffe7_u32) |
                UInt32.new!(lsedrv.to_int).&(0x3_u32) << 3
      end

      unless rtcsel.nil?
        value = (value & 0xfffffcff_u32) |
                UInt32.new!(rtcsel.to_int).&(0x3_u32) << 8
      end

      unless rtcen.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(rtcen.to_int).&(0x1_u32) << 15
      end

      unless bdrst.nil?
        value = (value & 0xfffeffff_u32) |
                UInt32.new!(bdrst.to_int).&(0x1_u32) << 16
      end

      self.class.new(value)
    end

    def self.set(
      *,
      lseon : LSEON? = nil,
      lsebyp : LSEBYP? = nil,
      lsedrv : LSEDRV? = nil,
      rtcsel : RTCSEL? = nil,
      rtcen : RTCEN? = nil,
      bdrst : BDRST? = nil
    ) : Nil
      self.value = self.value.copy_with(
        lseon: lseon,
        lsebyp: lsebyp,
        lsedrv: lsedrv,
        rtcsel: rtcsel,
        rtcen: rtcen,
        bdrst: bdrst,
      )
    end
  end # struct

  # Control/status register          (RCC_CSR)
  struct CSR
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
      new(0xc000000_u64)
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

    enum LSION : UInt8
      # LSI oscillator Off
      OFF = 0x0_u64

      # LSI oscillator On
      ON = 0x1_u64

      def self.reset_value : LSION
        CSR.reset_value.lsion
      end
    end

    # Internal low speed oscillator              enable
    def lsion : LSION
      LSION.new!((@value >> 0) & 0x1_u32)
    end

    # Internal low speed oscillator              enable
    def self.lsion : LSION
      value.lsion
    end

    # Internal low speed oscillator              enable
    def self.lsion=(value : LSION) : LSION
      self.set(lsion: value)
      value
    end

    enum LSIRDY : UInt8
      # LSI oscillator not ready
      NOTREADY = 0x0_u64

      # LSI oscillator ready
      READY = 0x1_u64

      def self.reset_value : LSIRDY
        CSR.reset_value.lsirdy
      end
    end

    # Internal low speed oscillator              ready
    def lsirdy : LSIRDY
      LSIRDY.new!((@value >> 1) & 0x1_u32)
    end

    # Internal low speed oscillator              ready
    def self.lsirdy : LSIRDY
      value.lsirdy
    end

    enum RMVF : UInt8
      # Clears the reset flag
      CLEAR = 0x1_u64

      def self.reset_value : RMVF
        CSR.reset_value.rmvf
      end
    end

    # Remove reset flag
    def rmvf : RMVF
      RMVF.new!((@value >> 24) & 0x1_u32)
    end

    # Remove reset flag
    def self.rmvf : RMVF
      value.rmvf
    end

    # Remove reset flag
    def self.rmvf=(value : RMVF) : RMVF
      self.set(rmvf: value)
      value
    end

    # Option byte loader reset              flag
    def oblrstf : Bool
      @value.bits_set?(0x2000000_u32)
    end

    # Option byte loader reset              flag
    def self.oblrstf : Bool
      value.oblrstf
    end

    # Option byte loader reset              flag
    def self.oblrstf=(value : Bool) : Bool
      self.set(oblrstf: value)
      value
    end

    # PIN reset flag
    def pinrstf : Bool
      @value.bits_set?(0x4000000_u32)
    end

    # PIN reset flag
    def self.pinrstf : Bool
      value.pinrstf
    end

    # PIN reset flag
    def self.pinrstf=(value : Bool) : Bool
      self.set(pinrstf: value)
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

    # Independent watchdog reset              flag
    def iwdgrstf : Bool
      @value.bits_set?(0x20000000_u32)
    end

    # Independent watchdog reset              flag
    def self.iwdgrstf : Bool
      value.iwdgrstf
    end

    # Independent watchdog reset              flag
    def self.iwdgrstf=(value : Bool) : Bool
      self.set(iwdgrstf: value)
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

    enum V18PWRRSTF : UInt8
      # No reset has occured
      NORESET = 0x0_u64

      # A reset has occured
      RESET = 0x1_u64

      def self.reset_value : V18PWRRSTF
        CSR.reset_value.v18_pwrrstf
      end
    end

    # Reset flag of the 1.8 V domain
    def v18_pwrrstf : V18PWRRSTF
      V18PWRRSTF.new!((@value >> 23) & 0x1_u32)
    end

    # Reset flag of the 1.8 V domain
    def self.v18_pwrrstf : V18PWRRSTF
      value.v18_pwrrstf
    end

    def copy_with(
      *,

      lsion : LSION? = nil,

      rmvf : RMVF? = nil,

      oblrstf : Bool? = nil,

      pinrstf : Bool? = nil,

      porrstf : Bool? = nil,

      sftrstf : Bool? = nil,

      iwdgrstf : Bool? = nil,

      wwdgrstf : Bool? = nil,

      lpwrrstf : Bool? = nil
    ) : self
      value = @value

      unless lsion.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(lsion.to_int).&(0x1_u32) << 0
      end

      unless rmvf.nil?
        value = (value & 0xfeffffff_u32) |
                UInt32.new!(rmvf.to_int).&(0x1_u32) << 24
      end

      unless oblrstf.nil?
        value = (value & 0xfdffffff_u32) |
                UInt32.new!(oblrstf.to_int).&(0x1_u32) << 25
      end

      unless pinrstf.nil?
        value = (value & 0xfbffffff_u32) |
                UInt32.new!(pinrstf.to_int).&(0x1_u32) << 26
      end

      unless porrstf.nil?
        value = (value & 0xf7ffffff_u32) |
                UInt32.new!(porrstf.to_int).&(0x1_u32) << 27
      end

      unless sftrstf.nil?
        value = (value & 0xefffffff_u32) |
                UInt32.new!(sftrstf.to_int).&(0x1_u32) << 28
      end

      unless iwdgrstf.nil?
        value = (value & 0xdfffffff_u32) |
                UInt32.new!(iwdgrstf.to_int).&(0x1_u32) << 29
      end

      unless wwdgrstf.nil?
        value = (value & 0xbfffffff_u32) |
                UInt32.new!(wwdgrstf.to_int).&(0x1_u32) << 30
      end

      unless lpwrrstf.nil?
        value = (value & 0x7fffffff_u32) |
                UInt32.new!(lpwrrstf.to_int).&(0x1_u32) << 31
      end

      self.class.new(value)
    end

    def self.set(
      *,
      lsion : LSION? = nil,
      rmvf : RMVF? = nil,
      oblrstf : Bool? = nil,
      pinrstf : Bool? = nil,
      porrstf : Bool? = nil,
      sftrstf : Bool? = nil,
      iwdgrstf : Bool? = nil,
      wwdgrstf : Bool? = nil,
      lpwrrstf : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        lsion: lsion,
        rmvf: rmvf,
        oblrstf: oblrstf,
        pinrstf: pinrstf,
        porrstf: porrstf,
        sftrstf: sftrstf,
        iwdgrstf: iwdgrstf,
        wwdgrstf: wwdgrstf,
        lpwrrstf: lpwrrstf,
      )
    end
  end # struct

  # AHB peripheral reset register
  struct AHBRSTR
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

    enum FMCRST : UInt8
      # Reset the selected module
      RESET = 0x1_u64

      def self.reset_value : FMCRST
        AHBRSTR.reset_value.fmcrst
      end
    end

    # FMC reset
    def fmcrst : FMCRST
      FMCRST.new!((@value >> 5) & 0x1_u32)
    end

    # FMC reset
    def self.fmcrst : FMCRST
      value.fmcrst
    end

    # FMC reset
    def self.fmcrst=(value : FMCRST) : FMCRST
      self.set(fmcrst: value)
      value
    end

    # I/O port H reset
    def iophrst : Bool
      @value.bits_set?(0x10000_u32)
    end

    # I/O port H reset
    def self.iophrst : Bool
      value.iophrst
    end

    # I/O port H reset
    def self.iophrst=(value : Bool) : Bool
      self.set(iophrst: value)
      value
    end

    # I/O port A reset
    def ioparst : Bool
      @value.bits_set?(0x20000_u32)
    end

    # I/O port A reset
    def self.ioparst : Bool
      value.ioparst
    end

    # I/O port A reset
    def self.ioparst=(value : Bool) : Bool
      self.set(ioparst: value)
      value
    end

    # I/O port B reset
    def iopbrst : Bool
      @value.bits_set?(0x40000_u32)
    end

    # I/O port B reset
    def self.iopbrst : Bool
      value.iopbrst
    end

    # I/O port B reset
    def self.iopbrst=(value : Bool) : Bool
      self.set(iopbrst: value)
      value
    end

    # I/O port C reset
    def iopcrst : Bool
      @value.bits_set?(0x80000_u32)
    end

    # I/O port C reset
    def self.iopcrst : Bool
      value.iopcrst
    end

    # I/O port C reset
    def self.iopcrst=(value : Bool) : Bool
      self.set(iopcrst: value)
      value
    end

    # I/O port D reset
    def iopdrst : Bool
      @value.bits_set?(0x100000_u32)
    end

    # I/O port D reset
    def self.iopdrst : Bool
      value.iopdrst
    end

    # I/O port D reset
    def self.iopdrst=(value : Bool) : Bool
      self.set(iopdrst: value)
      value
    end

    # I/O port E reset
    def ioperst : Bool
      @value.bits_set?(0x200000_u32)
    end

    # I/O port E reset
    def self.ioperst : Bool
      value.ioperst
    end

    # I/O port E reset
    def self.ioperst=(value : Bool) : Bool
      self.set(ioperst: value)
      value
    end

    # I/O port F reset
    def iopfrst : Bool
      @value.bits_set?(0x400000_u32)
    end

    # I/O port F reset
    def self.iopfrst : Bool
      value.iopfrst
    end

    # I/O port F reset
    def self.iopfrst=(value : Bool) : Bool
      self.set(iopfrst: value)
      value
    end

    # Touch sensing controller              reset
    def iopgrst : Bool
      @value.bits_set?(0x800000_u32)
    end

    # Touch sensing controller              reset
    def self.iopgrst : Bool
      value.iopgrst
    end

    # Touch sensing controller              reset
    def self.iopgrst=(value : Bool) : Bool
      self.set(iopgrst: value)
      value
    end

    # Touch sensing controller              reset
    def tscrst : Bool
      @value.bits_set?(0x1000000_u32)
    end

    # Touch sensing controller              reset
    def self.tscrst : Bool
      value.tscrst
    end

    # Touch sensing controller              reset
    def self.tscrst=(value : Bool) : Bool
      self.set(tscrst: value)
      value
    end

    # ADC1 and ADC2 reset
    def adc12_rst : Bool
      @value.bits_set?(0x10000000_u32)
    end

    # ADC1 and ADC2 reset
    def self.adc12_rst : Bool
      value.adc12_rst
    end

    # ADC1 and ADC2 reset
    def self.adc12_rst=(value : Bool) : Bool
      self.set(adc12_rst: value)
      value
    end

    # ADC3 and ADC4 reset
    def adc34_rst : Bool
      @value.bits_set?(0x20000000_u32)
    end

    # ADC3 and ADC4 reset
    def self.adc34_rst : Bool
      value.adc34_rst
    end

    # ADC3 and ADC4 reset
    def self.adc34_rst=(value : Bool) : Bool
      self.set(adc34_rst: value)
      value
    end

    def copy_with(
      *,

      fmcrst : FMCRST? = nil,

      iophrst : Bool? = nil,

      ioparst : Bool? = nil,

      iopbrst : Bool? = nil,

      iopcrst : Bool? = nil,

      iopdrst : Bool? = nil,

      ioperst : Bool? = nil,

      iopfrst : Bool? = nil,

      iopgrst : Bool? = nil,

      tscrst : Bool? = nil,

      adc12_rst : Bool? = nil,

      adc34_rst : Bool? = nil
    ) : self
      value = @value

      unless fmcrst.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(fmcrst.to_int).&(0x1_u32) << 5
      end

      unless iophrst.nil?
        value = (value & 0xfffeffff_u32) |
                UInt32.new!(iophrst.to_int).&(0x1_u32) << 16
      end

      unless ioparst.nil?
        value = (value & 0xfffdffff_u32) |
                UInt32.new!(ioparst.to_int).&(0x1_u32) << 17
      end

      unless iopbrst.nil?
        value = (value & 0xfffbffff_u32) |
                UInt32.new!(iopbrst.to_int).&(0x1_u32) << 18
      end

      unless iopcrst.nil?
        value = (value & 0xfff7ffff_u32) |
                UInt32.new!(iopcrst.to_int).&(0x1_u32) << 19
      end

      unless iopdrst.nil?
        value = (value & 0xffefffff_u32) |
                UInt32.new!(iopdrst.to_int).&(0x1_u32) << 20
      end

      unless ioperst.nil?
        value = (value & 0xffdfffff_u32) |
                UInt32.new!(ioperst.to_int).&(0x1_u32) << 21
      end

      unless iopfrst.nil?
        value = (value & 0xffbfffff_u32) |
                UInt32.new!(iopfrst.to_int).&(0x1_u32) << 22
      end

      unless iopgrst.nil?
        value = (value & 0xff7fffff_u32) |
                UInt32.new!(iopgrst.to_int).&(0x1_u32) << 23
      end

      unless tscrst.nil?
        value = (value & 0xfeffffff_u32) |
                UInt32.new!(tscrst.to_int).&(0x1_u32) << 24
      end

      unless adc12_rst.nil?
        value = (value & 0xefffffff_u32) |
                UInt32.new!(adc12_rst.to_int).&(0x1_u32) << 28
      end

      unless adc34_rst.nil?
        value = (value & 0xdfffffff_u32) |
                UInt32.new!(adc34_rst.to_int).&(0x1_u32) << 29
      end

      self.class.new(value)
    end

    def self.set(
      *,
      fmcrst : FMCRST? = nil,
      iophrst : Bool? = nil,
      ioparst : Bool? = nil,
      iopbrst : Bool? = nil,
      iopcrst : Bool? = nil,
      iopdrst : Bool? = nil,
      ioperst : Bool? = nil,
      iopfrst : Bool? = nil,
      iopgrst : Bool? = nil,
      tscrst : Bool? = nil,
      adc12_rst : Bool? = nil,
      adc34_rst : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        fmcrst: fmcrst,
        iophrst: iophrst,
        ioparst: ioparst,
        iopbrst: iopbrst,
        iopcrst: iopcrst,
        iopdrst: iopdrst,
        ioperst: ioperst,
        iopfrst: iopfrst,
        iopgrst: iopgrst,
        tscrst: tscrst,
        adc12_rst: adc12_rst,
        adc34_rst: adc34_rst,
      )
    end
  end # struct

  # Clock configuration register 2
  struct CFGR2
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

    enum PREDIV : UInt8
      # PREDIV input clock not divided
      DIV1 = 0x0_u64

      # PREDIV input clock divided by 2
      DIV2 = 0x1_u64

      # PREDIV input clock divided by 3
      DIV3 = 0x2_u64

      # PREDIV input clock divided by 4
      DIV4 = 0x3_u64

      # PREDIV input clock divided by 5
      DIV5 = 0x4_u64

      # PREDIV input clock divided by 6
      DIV6 = 0x5_u64

      # PREDIV input clock divided by 7
      DIV7 = 0x6_u64

      # PREDIV input clock divided by 8
      DIV8 = 0x7_u64

      # PREDIV input clock divided by 9
      DIV9 = 0x8_u64

      # PREDIV input clock divided by 10
      DIV10 = 0x9_u64

      # PREDIV input clock divided by 11
      DIV11 = 0xa_u64

      # PREDIV input clock divided by 12
      DIV12 = 0xb_u64

      # PREDIV input clock divided by 13
      DIV13 = 0xc_u64

      # PREDIV input clock divided by 14
      DIV14 = 0xd_u64

      # PREDIV input clock divided by 15
      DIV15 = 0xe_u64

      # PREDIV input clock divided by 16
      DIV16 = 0xf_u64

      def self.reset_value : PREDIV
        CFGR2.reset_value.prediv
      end
    end

    # PREDIV division factor
    def prediv : PREDIV
      PREDIV.new!((@value >> 0) & 0xf_u32)
    end

    # PREDIV division factor
    def self.prediv : PREDIV
      value.prediv
    end

    # PREDIV division factor
    def self.prediv=(value : PREDIV) : PREDIV
      self.set(prediv: value)
      value
    end

    enum ADC12PRES : UInt8
      # No clock
      NOCLOCK = 0x0_u64

      # PLL clock not divided
      DIV1 = 0x10_u64

      # PLL clock divided by 2
      DIV2 = 0x11_u64

      # PLL clock divided by 4
      DIV4 = 0x12_u64

      # PLL clock divided by 6
      DIV6 = 0x13_u64

      # PLL clock divided by 8
      DIV8 = 0x14_u64

      # PLL clock divided by 10
      DIV10 = 0x15_u64

      # PLL clock divided by 12
      DIV12 = 0x16_u64

      # PLL clock divided by 16
      DIV16 = 0x17_u64

      # PLL clock divided by 32
      DIV32 = 0x18_u64

      # PLL clock divided by 64
      DIV64 = 0x19_u64

      # PLL clock divided by 128
      DIV128 = 0x1a_u64

      # PLL clock divided by 256
      DIV256 = 0x1b_u64

      def self.reset_value : ADC12PRES
        CFGR2.reset_value.adc12_pres
      end
    end

    # ADC1 and ADC2 prescaler
    def adc12_pres : ADC12PRES
      ADC12PRES.new!((@value >> 4) & 0x1f_u32)
    end

    # ADC1 and ADC2 prescaler
    def self.adc12_pres : ADC12PRES
      value.adc12_pres
    end

    # ADC1 and ADC2 prescaler
    def self.adc12_pres=(value : ADC12PRES) : ADC12PRES
      self.set(adc12_pres: value)
      value
    end

    # ADC3 and ADC4 prescaler
    def adc34_pres : UInt8
      UInt8.new!((@value >> 9) & 0x1f_u32)
    end

    # ADC3 and ADC4 prescaler
    def self.adc34_pres : UInt8
      value.adc34_pres
    end

    # ADC3 and ADC4 prescaler
    def self.adc34_pres=(value : UInt8) : UInt8
      self.set(adc34_pres: value)
      value
    end

    def copy_with(
      *,

      prediv : PREDIV? = nil,

      adc12_pres : ADC12PRES? = nil,

      adc34_pres : UInt8? = nil
    ) : self
      value = @value

      unless prediv.nil?
        value = (value & 0xfffffff0_u32) |
                UInt32.new!(prediv.to_int).&(0xf_u32) << 0
      end

      unless adc12_pres.nil?
        value = (value & 0xfffffe0f_u32) |
                UInt32.new!(adc12_pres.to_int).&(0x1f_u32) << 4
      end

      unless adc34_pres.nil?
        value = (value & 0xffffc1ff_u32) |
                UInt32.new!(adc34_pres.to_int).&(0x1f_u32) << 9
      end

      self.class.new(value)
    end

    def self.set(
      *,
      prediv : PREDIV? = nil,
      adc12_pres : ADC12PRES? = nil,
      adc34_pres : UInt8? = nil
    ) : Nil
      self.value = self.value.copy_with(
        prediv: prediv,
        adc12_pres: adc12_pres,
        adc34_pres: adc34_pres,
      )
    end
  end # struct

  # Clock configuration register 3
  struct CFGR3
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

    enum USART1SW : UInt8
      # PCLK selected as USART clock source
      PCLK = 0x0_u64

      # SYSCLK selected as USART clock source
      SYSCLK = 0x1_u64

      # LSE selected as USART clock source
      LSE = 0x2_u64

      # HSI selected as USART clock source
      HSI = 0x3_u64

      def self.reset_value : USART1SW
        CFGR3.reset_value.usart1_sw
      end
    end

    # USART1 clock source              selection
    def usart1_sw : USART1SW
      USART1SW.new!((@value >> 0) & 0x3_u32)
    end

    # USART1 clock source              selection
    def self.usart1_sw : USART1SW
      value.usart1_sw
    end

    # USART1 clock source              selection
    def self.usart1_sw=(value : USART1SW) : USART1SW
      self.set(usart1_sw: value)
      value
    end

    enum I2C1SW : UInt8
      # HSI clock selected as I2C clock source
      HSI = 0x0_u64

      # SYSCLK clock selected as I2C clock source
      SYSCLK = 0x1_u64

      def self.reset_value : I2C1SW
        CFGR3.reset_value.i2_c1_sw
      end
    end

    # I2C1 clock source              selection
    def i2_c1_sw : I2C1SW
      I2C1SW.new!((@value >> 4) & 0x1_u32)
    end

    # I2C1 clock source              selection
    def self.i2_c1_sw : I2C1SW
      value.i2_c1_sw
    end

    # I2C1 clock source              selection
    def self.i2_c1_sw=(value : I2C1SW) : I2C1SW
      self.set(i2_c1_sw: value)
      value
    end

    # I2C2 clock source              selection
    def i2_c2_sw : Bool
      @value.bits_set?(0x20_u32)
    end

    # I2C2 clock source              selection
    def self.i2_c2_sw : Bool
      value.i2_c2_sw
    end

    # I2C2 clock source              selection
    def self.i2_c2_sw=(value : Bool) : Bool
      self.set(i2_c2_sw: value)
      value
    end

    # I2C3 clock source              selection
    def i2_c3_sw : Bool
      @value.bits_set?(0x40_u32)
    end

    # I2C3 clock source              selection
    def self.i2_c3_sw : Bool
      value.i2_c3_sw
    end

    # I2C3 clock source              selection
    def self.i2_c3_sw=(value : Bool) : Bool
      self.set(i2_c3_sw: value)
      value
    end

    # USART2 clock source              selection
    def usart2_sw : UInt8
      UInt8.new!((@value >> 16) & 0x3_u32)
    end

    # USART2 clock source              selection
    def self.usart2_sw : UInt8
      value.usart2_sw
    end

    # USART2 clock source              selection
    def self.usart2_sw=(value : UInt8) : UInt8
      self.set(usart2_sw: value)
      value
    end

    # USART3 clock source              selection
    def usart3_sw : UInt8
      UInt8.new!((@value >> 18) & 0x3_u32)
    end

    # USART3 clock source              selection
    def self.usart3_sw : UInt8
      value.usart3_sw
    end

    # USART3 clock source              selection
    def self.usart3_sw=(value : UInt8) : UInt8
      self.set(usart3_sw: value)
      value
    end

    enum TIM1SW : UInt8
      # PCLK2 clock (doubled frequency when prescaled)
      PCLK2 = 0x0_u64

      # PLL vco output (running up to 144 MHz)
      PLL = 0x1_u64

      def self.reset_value : TIM1SW
        CFGR3.reset_value.tim1_sw
      end
    end

    # Timer1 clock source              selection
    def tim1_sw : TIM1SW
      TIM1SW.new!((@value >> 8) & 0x1_u32)
    end

    # Timer1 clock source              selection
    def self.tim1_sw : TIM1SW
      value.tim1_sw
    end

    # Timer1 clock source              selection
    def self.tim1_sw=(value : TIM1SW) : TIM1SW
      self.set(tim1_sw: value)
      value
    end

    # Timer8 clock source              selection
    def tim8_sw : Bool
      @value.bits_set?(0x200_u32)
    end

    # Timer8 clock source              selection
    def self.tim8_sw : Bool
      value.tim8_sw
    end

    # Timer8 clock source              selection
    def self.tim8_sw=(value : Bool) : Bool
      self.set(tim8_sw: value)
      value
    end

    # UART4 clock source              selection
    def uart4_sw : UInt8
      UInt8.new!((@value >> 20) & 0x3_u32)
    end

    # UART4 clock source              selection
    def self.uart4_sw : UInt8
      value.uart4_sw
    end

    # UART4 clock source              selection
    def self.uart4_sw=(value : UInt8) : UInt8
      self.set(uart4_sw: value)
      value
    end

    # UART5 clock source              selection
    def uart5_sw : UInt8
      UInt8.new!((@value >> 22) & 0x3_u32)
    end

    # UART5 clock source              selection
    def self.uart5_sw : UInt8
      value.uart5_sw
    end

    # UART5 clock source              selection
    def self.uart5_sw=(value : UInt8) : UInt8
      self.set(uart5_sw: value)
      value
    end

    # Timer20 clock source selection
    def tim20_sw : Bool
      @value.bits_set?(0x8000_u32)
    end

    # Timer20 clock source selection
    def self.tim20_sw : Bool
      value.tim20_sw
    end

    # Timer20 clock source selection
    def self.tim20_sw=(value : Bool) : Bool
      self.set(tim20_sw: value)
      value
    end

    # Timer15 clock source selection
    def tim15_sw : Bool
      @value.bits_set?(0x400_u32)
    end

    # Timer15 clock source selection
    def self.tim15_sw : Bool
      value.tim15_sw
    end

    # Timer15 clock source selection
    def self.tim15_sw=(value : Bool) : Bool
      self.set(tim15_sw: value)
      value
    end

    # Timer16 clock source selection
    def tim16_sw : Bool
      @value.bits_set?(0x800_u32)
    end

    # Timer16 clock source selection
    def self.tim16_sw : Bool
      value.tim16_sw
    end

    # Timer16 clock source selection
    def self.tim16_sw=(value : Bool) : Bool
      self.set(tim16_sw: value)
      value
    end

    # Timer17 clock source selection
    def tim17_sw : Bool
      @value.bits_set?(0x2000_u32)
    end

    # Timer17 clock source selection
    def self.tim17_sw : Bool
      value.tim17_sw
    end

    # Timer17 clock source selection
    def self.tim17_sw=(value : Bool) : Bool
      self.set(tim17_sw: value)
      value
    end

    # Timer2 clock source selection
    def tim2_sw : Bool
      @value.bits_set?(0x1000000_u32)
    end

    # Timer2 clock source selection
    def self.tim2_sw : Bool
      value.tim2_sw
    end

    # Timer2 clock source selection
    def self.tim2_sw=(value : Bool) : Bool
      self.set(tim2_sw: value)
      value
    end

    # Timer34 clock source selection
    def tim34_sw : Bool
      @value.bits_set?(0x2000000_u32)
    end

    # Timer34 clock source selection
    def self.tim34_sw : Bool
      value.tim34_sw
    end

    # Timer34 clock source selection
    def self.tim34_sw=(value : Bool) : Bool
      self.set(tim34_sw: value)
      value
    end

    def copy_with(
      *,

      usart1_sw : USART1SW? = nil,

      i2_c1_sw : I2C1SW? = nil,

      i2_c2_sw : Bool? = nil,

      i2_c3_sw : Bool? = nil,

      usart2_sw : UInt8? = nil,

      usart3_sw : UInt8? = nil,

      tim1_sw : TIM1SW? = nil,

      tim8_sw : Bool? = nil,

      uart4_sw : UInt8? = nil,

      uart5_sw : UInt8? = nil,

      tim20_sw : Bool? = nil,

      tim15_sw : Bool? = nil,

      tim16_sw : Bool? = nil,

      tim17_sw : Bool? = nil,

      tim2_sw : Bool? = nil,

      tim34_sw : Bool? = nil
    ) : self
      value = @value

      unless usart1_sw.nil?
        value = (value & 0xfffffffc_u32) |
                UInt32.new!(usart1_sw.to_int).&(0x3_u32) << 0
      end

      unless i2_c1_sw.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(i2_c1_sw.to_int).&(0x1_u32) << 4
      end

      unless i2_c2_sw.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(i2_c2_sw.to_int).&(0x1_u32) << 5
      end

      unless i2_c3_sw.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(i2_c3_sw.to_int).&(0x1_u32) << 6
      end

      unless usart2_sw.nil?
        value = (value & 0xfffcffff_u32) |
                UInt32.new!(usart2_sw.to_int).&(0x3_u32) << 16
      end

      unless usart3_sw.nil?
        value = (value & 0xfff3ffff_u32) |
                UInt32.new!(usart3_sw.to_int).&(0x3_u32) << 18
      end

      unless tim1_sw.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(tim1_sw.to_int).&(0x1_u32) << 8
      end

      unless tim8_sw.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(tim8_sw.to_int).&(0x1_u32) << 9
      end

      unless uart4_sw.nil?
        value = (value & 0xffcfffff_u32) |
                UInt32.new!(uart4_sw.to_int).&(0x3_u32) << 20
      end

      unless uart5_sw.nil?
        value = (value & 0xff3fffff_u32) |
                UInt32.new!(uart5_sw.to_int).&(0x3_u32) << 22
      end

      unless tim20_sw.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(tim20_sw.to_int).&(0x1_u32) << 15
      end

      unless tim15_sw.nil?
        value = (value & 0xfffffbff_u32) |
                UInt32.new!(tim15_sw.to_int).&(0x1_u32) << 10
      end

      unless tim16_sw.nil?
        value = (value & 0xfffff7ff_u32) |
                UInt32.new!(tim16_sw.to_int).&(0x1_u32) << 11
      end

      unless tim17_sw.nil?
        value = (value & 0xffffdfff_u32) |
                UInt32.new!(tim17_sw.to_int).&(0x1_u32) << 13
      end

      unless tim2_sw.nil?
        value = (value & 0xfeffffff_u32) |
                UInt32.new!(tim2_sw.to_int).&(0x1_u32) << 24
      end

      unless tim34_sw.nil?
        value = (value & 0xfdffffff_u32) |
                UInt32.new!(tim34_sw.to_int).&(0x1_u32) << 25
      end

      self.class.new(value)
    end

    def self.set(
      *,
      usart1_sw : USART1SW? = nil,
      i2_c1_sw : I2C1SW? = nil,
      i2_c2_sw : Bool? = nil,
      i2_c3_sw : Bool? = nil,
      usart2_sw : UInt8? = nil,
      usart3_sw : UInt8? = nil,
      tim1_sw : TIM1SW? = nil,
      tim8_sw : Bool? = nil,
      uart4_sw : UInt8? = nil,
      uart5_sw : UInt8? = nil,
      tim20_sw : Bool? = nil,
      tim15_sw : Bool? = nil,
      tim16_sw : Bool? = nil,
      tim17_sw : Bool? = nil,
      tim2_sw : Bool? = nil,
      tim34_sw : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        usart1_sw: usart1_sw,
        i2_c1_sw: i2_c1_sw,
        i2_c2_sw: i2_c2_sw,
        i2_c3_sw: i2_c3_sw,
        usart2_sw: usart2_sw,
        usart3_sw: usart3_sw,
        tim1_sw: tim1_sw,
        tim8_sw: tim8_sw,
        uart4_sw: uart4_sw,
        uart5_sw: uart5_sw,
        tim20_sw: tim20_sw,
        tim15_sw: tim15_sw,
        tim16_sw: tim16_sw,
        tim17_sw: tim17_sw,
        tim2_sw: tim2_sw,
        tim34_sw: tim34_sw,
      )
    end
  end # struct

end
