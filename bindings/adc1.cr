# Analog-to-digital converter
module ADC1
  VERSION      = nil
  BASE_ADDRESS = 0x40012000_u64

  # status register
  struct SR
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

    # Overrun
    def ovr : Bool
      @value.bits_set?(0x20_u32)
    end

    # Overrun
    def self.ovr : Bool
      value.ovr
    end

    # Overrun
    def self.ovr=(value : Bool) : Bool
      self.set(ovr: value)
      value
    end

    # Regular channel start flag
    def strt : Bool
      @value.bits_set?(0x10_u32)
    end

    # Regular channel start flag
    def self.strt : Bool
      value.strt
    end

    # Regular channel start flag
    def self.strt=(value : Bool) : Bool
      self.set(strt: value)
      value
    end

    # Injected channel start              flag
    def jstrt : Bool
      @value.bits_set?(0x8_u32)
    end

    # Injected channel start              flag
    def self.jstrt : Bool
      value.jstrt
    end

    # Injected channel start              flag
    def self.jstrt=(value : Bool) : Bool
      self.set(jstrt: value)
      value
    end

    # Injected channel end of              conversion
    def jeoc : Bool
      @value.bits_set?(0x4_u32)
    end

    # Injected channel end of              conversion
    def self.jeoc : Bool
      value.jeoc
    end

    # Injected channel end of              conversion
    def self.jeoc=(value : Bool) : Bool
      self.set(jeoc: value)
      value
    end

    # Regular channel end of              conversion
    def eoc : Bool
      @value.bits_set?(0x2_u32)
    end

    # Regular channel end of              conversion
    def self.eoc : Bool
      value.eoc
    end

    # Regular channel end of              conversion
    def self.eoc=(value : Bool) : Bool
      self.set(eoc: value)
      value
    end

    # Analog watchdog flag
    def awd : Bool
      @value.bits_set?(0x1_u32)
    end

    # Analog watchdog flag
    def self.awd : Bool
      value.awd
    end

    # Analog watchdog flag
    def self.awd=(value : Bool) : Bool
      self.set(awd: value)
      value
    end

    def copy_with(
      *,

      ovr : Bool? = nil,

      strt : Bool? = nil,

      jstrt : Bool? = nil,

      jeoc : Bool? = nil,

      eoc : Bool? = nil,

      awd : Bool? = nil
    ) : self
      value = @value

      unless ovr.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(ovr.to_int).&(0x1_u32) << 5
      end

      unless strt.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(strt.to_int).&(0x1_u32) << 4
      end

      unless jstrt.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(jstrt.to_int).&(0x1_u32) << 3
      end

      unless jeoc.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(jeoc.to_int).&(0x1_u32) << 2
      end

      unless eoc.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(eoc.to_int).&(0x1_u32) << 1
      end

      unless awd.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(awd.to_int).&(0x1_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      ovr : Bool? = nil,
      strt : Bool? = nil,
      jstrt : Bool? = nil,
      jeoc : Bool? = nil,
      eoc : Bool? = nil,
      awd : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        ovr: ovr,
        strt: strt,
        jstrt: jstrt,
        jeoc: jeoc,
        eoc: eoc,
        awd: awd,
      )
    end
  end # struct

  # control register 1
  struct CR1
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

    # Overrun interrupt enable
    def ovrie : Bool
      @value.bits_set?(0x4000000_u32)
    end

    # Overrun interrupt enable
    def self.ovrie : Bool
      value.ovrie
    end

    # Overrun interrupt enable
    def self.ovrie=(value : Bool) : Bool
      self.set(ovrie: value)
      value
    end

    # Resolution
    def res : UInt8
      UInt8.new!((@value >> 24) & 0x3_u32)
    end

    # Resolution
    def self.res : UInt8
      value.res
    end

    # Resolution
    def self.res=(value : UInt8) : UInt8
      self.set(res: value)
      value
    end

    # Analog watchdog enable on regular              channels
    def awden : Bool
      @value.bits_set?(0x800000_u32)
    end

    # Analog watchdog enable on regular              channels
    def self.awden : Bool
      value.awden
    end

    # Analog watchdog enable on regular              channels
    def self.awden=(value : Bool) : Bool
      self.set(awden: value)
      value
    end

    # Analog watchdog enable on injected              channels
    def jawden : Bool
      @value.bits_set?(0x400000_u32)
    end

    # Analog watchdog enable on injected              channels
    def self.jawden : Bool
      value.jawden
    end

    # Analog watchdog enable on injected              channels
    def self.jawden=(value : Bool) : Bool
      self.set(jawden: value)
      value
    end

    # Discontinuous mode channel              count
    def discnum : UInt8
      UInt8.new!((@value >> 13) & 0x7_u32)
    end

    # Discontinuous mode channel              count
    def self.discnum : UInt8
      value.discnum
    end

    # Discontinuous mode channel              count
    def self.discnum=(value : UInt8) : UInt8
      self.set(discnum: value)
      value
    end

    # Discontinuous mode on injected              channels
    def jdiscen : Bool
      @value.bits_set?(0x1000_u32)
    end

    # Discontinuous mode on injected              channels
    def self.jdiscen : Bool
      value.jdiscen
    end

    # Discontinuous mode on injected              channels
    def self.jdiscen=(value : Bool) : Bool
      self.set(jdiscen: value)
      value
    end

    # Discontinuous mode on regular              channels
    def discen : Bool
      @value.bits_set?(0x800_u32)
    end

    # Discontinuous mode on regular              channels
    def self.discen : Bool
      value.discen
    end

    # Discontinuous mode on regular              channels
    def self.discen=(value : Bool) : Bool
      self.set(discen: value)
      value
    end

    # Automatic injected group              conversion
    def jauto : Bool
      @value.bits_set?(0x400_u32)
    end

    # Automatic injected group              conversion
    def self.jauto : Bool
      value.jauto
    end

    # Automatic injected group              conversion
    def self.jauto=(value : Bool) : Bool
      self.set(jauto: value)
      value
    end

    # Enable the watchdog on a single channel              in scan mode
    def awdsgl : Bool
      @value.bits_set?(0x200_u32)
    end

    # Enable the watchdog on a single channel              in scan mode
    def self.awdsgl : Bool
      value.awdsgl
    end

    # Enable the watchdog on a single channel              in scan mode
    def self.awdsgl=(value : Bool) : Bool
      self.set(awdsgl: value)
      value
    end

    # Scan mode
    def scan : Bool
      @value.bits_set?(0x100_u32)
    end

    # Scan mode
    def self.scan : Bool
      value.scan
    end

    # Scan mode
    def self.scan=(value : Bool) : Bool
      self.set(scan: value)
      value
    end

    # Interrupt enable for injected              channels
    def jeocie : Bool
      @value.bits_set?(0x80_u32)
    end

    # Interrupt enable for injected              channels
    def self.jeocie : Bool
      value.jeocie
    end

    # Interrupt enable for injected              channels
    def self.jeocie=(value : Bool) : Bool
      self.set(jeocie: value)
      value
    end

    # Analog watchdog interrupt              enable
    def awdie : Bool
      @value.bits_set?(0x40_u32)
    end

    # Analog watchdog interrupt              enable
    def self.awdie : Bool
      value.awdie
    end

    # Analog watchdog interrupt              enable
    def self.awdie=(value : Bool) : Bool
      self.set(awdie: value)
      value
    end

    # Interrupt enable for EOC
    def eocie : Bool
      @value.bits_set?(0x20_u32)
    end

    # Interrupt enable for EOC
    def self.eocie : Bool
      value.eocie
    end

    # Interrupt enable for EOC
    def self.eocie=(value : Bool) : Bool
      self.set(eocie: value)
      value
    end

    # Analog watchdog channel select              bits
    def awdch : UInt8
      UInt8.new!((@value >> 0) & 0x1f_u32)
    end

    # Analog watchdog channel select              bits
    def self.awdch : UInt8
      value.awdch
    end

    # Analog watchdog channel select              bits
    def self.awdch=(value : UInt8) : UInt8
      self.set(awdch: value)
      value
    end

    def copy_with(
      *,

      ovrie : Bool? = nil,

      res : UInt8? = nil,

      awden : Bool? = nil,

      jawden : Bool? = nil,

      discnum : UInt8? = nil,

      jdiscen : Bool? = nil,

      discen : Bool? = nil,

      jauto : Bool? = nil,

      awdsgl : Bool? = nil,

      scan : Bool? = nil,

      jeocie : Bool? = nil,

      awdie : Bool? = nil,

      eocie : Bool? = nil,

      awdch : UInt8? = nil
    ) : self
      value = @value

      unless ovrie.nil?
        value = (value & 0xfbffffff_u32) |
                UInt32.new!(ovrie.to_int).&(0x1_u32) << 26
      end

      unless res.nil?
        value = (value & 0xfcffffff_u32) |
                UInt32.new!(res.to_int).&(0x3_u32) << 24
      end

      unless awden.nil?
        value = (value & 0xff7fffff_u32) |
                UInt32.new!(awden.to_int).&(0x1_u32) << 23
      end

      unless jawden.nil?
        value = (value & 0xffbfffff_u32) |
                UInt32.new!(jawden.to_int).&(0x1_u32) << 22
      end

      unless discnum.nil?
        value = (value & 0xffff1fff_u32) |
                UInt32.new!(discnum.to_int).&(0x7_u32) << 13
      end

      unless jdiscen.nil?
        value = (value & 0xffffefff_u32) |
                UInt32.new!(jdiscen.to_int).&(0x1_u32) << 12
      end

      unless discen.nil?
        value = (value & 0xfffff7ff_u32) |
                UInt32.new!(discen.to_int).&(0x1_u32) << 11
      end

      unless jauto.nil?
        value = (value & 0xfffffbff_u32) |
                UInt32.new!(jauto.to_int).&(0x1_u32) << 10
      end

      unless awdsgl.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(awdsgl.to_int).&(0x1_u32) << 9
      end

      unless scan.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(scan.to_int).&(0x1_u32) << 8
      end

      unless jeocie.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(jeocie.to_int).&(0x1_u32) << 7
      end

      unless awdie.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(awdie.to_int).&(0x1_u32) << 6
      end

      unless eocie.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(eocie.to_int).&(0x1_u32) << 5
      end

      unless awdch.nil?
        value = (value & 0xffffffe0_u32) |
                UInt32.new!(awdch.to_int).&(0x1f_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      ovrie : Bool? = nil,
      res : UInt8? = nil,
      awden : Bool? = nil,
      jawden : Bool? = nil,
      discnum : UInt8? = nil,
      jdiscen : Bool? = nil,
      discen : Bool? = nil,
      jauto : Bool? = nil,
      awdsgl : Bool? = nil,
      scan : Bool? = nil,
      jeocie : Bool? = nil,
      awdie : Bool? = nil,
      eocie : Bool? = nil,
      awdch : UInt8? = nil
    ) : Nil
      self.value = self.value.copy_with(
        ovrie: ovrie,
        res: res,
        awden: awden,
        jawden: jawden,
        discnum: discnum,
        jdiscen: jdiscen,
        discen: discen,
        jauto: jauto,
        awdsgl: awdsgl,
        scan: scan,
        jeocie: jeocie,
        awdie: awdie,
        eocie: eocie,
        awdch: awdch,
      )
    end
  end # struct

  # control register 2
  struct CR2
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

    # Start conversion of regular              channels
    def swstart : Bool
      @value.bits_set?(0x40000000_u32)
    end

    # Start conversion of regular              channels
    def self.swstart : Bool
      value.swstart
    end

    # Start conversion of regular              channels
    def self.swstart=(value : Bool) : Bool
      self.set(swstart: value)
      value
    end

    # External trigger enable for regular              channels
    def exten : UInt8
      UInt8.new!((@value >> 28) & 0x3_u32)
    end

    # External trigger enable for regular              channels
    def self.exten : UInt8
      value.exten
    end

    # External trigger enable for regular              channels
    def self.exten=(value : UInt8) : UInt8
      self.set(exten: value)
      value
    end

    # External event select for regular              group
    def extsel : UInt8
      UInt8.new!((@value >> 24) & 0xf_u32)
    end

    # External event select for regular              group
    def self.extsel : UInt8
      value.extsel
    end

    # External event select for regular              group
    def self.extsel=(value : UInt8) : UInt8
      self.set(extsel: value)
      value
    end

    # Start conversion of injected              channels
    def jswstart : Bool
      @value.bits_set?(0x400000_u32)
    end

    # Start conversion of injected              channels
    def self.jswstart : Bool
      value.jswstart
    end

    # Start conversion of injected              channels
    def self.jswstart=(value : Bool) : Bool
      self.set(jswstart: value)
      value
    end

    # External trigger enable for injected              channels
    def jexten : UInt8
      UInt8.new!((@value >> 20) & 0x3_u32)
    end

    # External trigger enable for injected              channels
    def self.jexten : UInt8
      value.jexten
    end

    # External trigger enable for injected              channels
    def self.jexten=(value : UInt8) : UInt8
      self.set(jexten: value)
      value
    end

    # External event select for injected              group
    def jextsel : UInt8
      UInt8.new!((@value >> 16) & 0xf_u32)
    end

    # External event select for injected              group
    def self.jextsel : UInt8
      value.jextsel
    end

    # External event select for injected              group
    def self.jextsel=(value : UInt8) : UInt8
      self.set(jextsel: value)
      value
    end

    # Data alignment
    def align : Bool
      @value.bits_set?(0x800_u32)
    end

    # Data alignment
    def self.align : Bool
      value.align
    end

    # Data alignment
    def self.align=(value : Bool) : Bool
      self.set(align: value)
      value
    end

    # End of conversion              selection
    def eocs : Bool
      @value.bits_set?(0x400_u32)
    end

    # End of conversion              selection
    def self.eocs : Bool
      value.eocs
    end

    # End of conversion              selection
    def self.eocs=(value : Bool) : Bool
      self.set(eocs: value)
      value
    end

    # DMA disable selection (for single ADC              mode)
    def dds : Bool
      @value.bits_set?(0x200_u32)
    end

    # DMA disable selection (for single ADC              mode)
    def self.dds : Bool
      value.dds
    end

    # DMA disable selection (for single ADC              mode)
    def self.dds=(value : Bool) : Bool
      self.set(dds: value)
      value
    end

    # Direct memory access mode (for single              ADC mode)
    def dma : Bool
      @value.bits_set?(0x100_u32)
    end

    # Direct memory access mode (for single              ADC mode)
    def self.dma : Bool
      value.dma
    end

    # Direct memory access mode (for single              ADC mode)
    def self.dma=(value : Bool) : Bool
      self.set(dma: value)
      value
    end

    # Continuous conversion
    def cont : Bool
      @value.bits_set?(0x2_u32)
    end

    # Continuous conversion
    def self.cont : Bool
      value.cont
    end

    # Continuous conversion
    def self.cont=(value : Bool) : Bool
      self.set(cont: value)
      value
    end

    # A/D Converter ON / OFF
    def adon : Bool
      @value.bits_set?(0x1_u32)
    end

    # A/D Converter ON / OFF
    def self.adon : Bool
      value.adon
    end

    # A/D Converter ON / OFF
    def self.adon=(value : Bool) : Bool
      self.set(adon: value)
      value
    end

    def copy_with(
      *,

      swstart : Bool? = nil,

      exten : UInt8? = nil,

      extsel : UInt8? = nil,

      jswstart : Bool? = nil,

      jexten : UInt8? = nil,

      jextsel : UInt8? = nil,

      align : Bool? = nil,

      eocs : Bool? = nil,

      dds : Bool? = nil,

      dma : Bool? = nil,

      cont : Bool? = nil,

      adon : Bool? = nil
    ) : self
      value = @value

      unless swstart.nil?
        value = (value & 0xbfffffff_u32) |
                UInt32.new!(swstart.to_int).&(0x1_u32) << 30
      end

      unless exten.nil?
        value = (value & 0xcfffffff_u32) |
                UInt32.new!(exten.to_int).&(0x3_u32) << 28
      end

      unless extsel.nil?
        value = (value & 0xf0ffffff_u32) |
                UInt32.new!(extsel.to_int).&(0xf_u32) << 24
      end

      unless jswstart.nil?
        value = (value & 0xffbfffff_u32) |
                UInt32.new!(jswstart.to_int).&(0x1_u32) << 22
      end

      unless jexten.nil?
        value = (value & 0xffcfffff_u32) |
                UInt32.new!(jexten.to_int).&(0x3_u32) << 20
      end

      unless jextsel.nil?
        value = (value & 0xfff0ffff_u32) |
                UInt32.new!(jextsel.to_int).&(0xf_u32) << 16
      end

      unless align.nil?
        value = (value & 0xfffff7ff_u32) |
                UInt32.new!(align.to_int).&(0x1_u32) << 11
      end

      unless eocs.nil?
        value = (value & 0xfffffbff_u32) |
                UInt32.new!(eocs.to_int).&(0x1_u32) << 10
      end

      unless dds.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(dds.to_int).&(0x1_u32) << 9
      end

      unless dma.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(dma.to_int).&(0x1_u32) << 8
      end

      unless cont.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(cont.to_int).&(0x1_u32) << 1
      end

      unless adon.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(adon.to_int).&(0x1_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      swstart : Bool? = nil,
      exten : UInt8? = nil,
      extsel : UInt8? = nil,
      jswstart : Bool? = nil,
      jexten : UInt8? = nil,
      jextsel : UInt8? = nil,
      align : Bool? = nil,
      eocs : Bool? = nil,
      dds : Bool? = nil,
      dma : Bool? = nil,
      cont : Bool? = nil,
      adon : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        swstart: swstart,
        exten: exten,
        extsel: extsel,
        jswstart: jswstart,
        jexten: jexten,
        jextsel: jextsel,
        align: align,
        eocs: eocs,
        dds: dds,
        dma: dma,
        cont: cont,
        adon: adon,
      )
    end
  end # struct

  # sample time register 1
  struct SMPR1
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

    # Sample time bits
    def sm_px_x : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # Sample time bits
    def self.sm_px_x : UInt32
      value.sm_px_x
    end

    # Sample time bits
    def self.sm_px_x=(value : UInt32) : UInt32
      self.set(sm_px_x: value)
      value
    end

    def copy_with(
      *,

      sm_px_x : UInt32? = nil
    ) : self
      value = @value

      unless sm_px_x.nil?
        value = (value & 0xffffffff_u32) |
                UInt32.new!(sm_px_x.to_int).&(0x0_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      sm_px_x : UInt32? = nil
    ) : Nil
      self.value = self.value.copy_with(
        sm_px_x: sm_px_x,
      )
    end
  end # struct

  # sample time register 2
  struct SMPR2
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

    # Sample time bits
    def sm_px_x : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # Sample time bits
    def self.sm_px_x : UInt32
      value.sm_px_x
    end

    # Sample time bits
    def self.sm_px_x=(value : UInt32) : UInt32
      self.set(sm_px_x: value)
      value
    end

    def copy_with(
      *,

      sm_px_x : UInt32? = nil
    ) : self
      value = @value

      unless sm_px_x.nil?
        value = (value & 0xffffffff_u32) |
                UInt32.new!(sm_px_x.to_int).&(0x0_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      sm_px_x : UInt32? = nil
    ) : Nil
      self.value = self.value.copy_with(
        sm_px_x: sm_px_x,
      )
    end
  end # struct

  # injected channel data offset register          x
  struct JOFR1
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

    # Data offset for injected channel              x
    def joffset1 : UInt16
      UInt16.new!((@value >> 0) & 0xfff_u32)
    end

    # Data offset for injected channel              x
    def self.joffset1 : UInt16
      value.joffset1
    end

    # Data offset for injected channel              x
    def self.joffset1=(value : UInt16) : UInt16
      self.set(joffset1: value)
      value
    end

    def copy_with(
      *,

      joffset1 : UInt16? = nil
    ) : self
      value = @value

      unless joffset1.nil?
        value = (value & 0xfffff000_u32) |
                UInt32.new!(joffset1.to_int).&(0xfff_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      joffset1 : UInt16? = nil
    ) : Nil
      self.value = self.value.copy_with(
        joffset1: joffset1,
      )
    end
  end # struct

  # injected channel data offset register          x
  struct JOFR2
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

    # Data offset for injected channel              x
    def joffset2 : UInt16
      UInt16.new!((@value >> 0) & 0xfff_u32)
    end

    # Data offset for injected channel              x
    def self.joffset2 : UInt16
      value.joffset2
    end

    # Data offset for injected channel              x
    def self.joffset2=(value : UInt16) : UInt16
      self.set(joffset2: value)
      value
    end

    def copy_with(
      *,

      joffset2 : UInt16? = nil
    ) : self
      value = @value

      unless joffset2.nil?
        value = (value & 0xfffff000_u32) |
                UInt32.new!(joffset2.to_int).&(0xfff_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      joffset2 : UInt16? = nil
    ) : Nil
      self.value = self.value.copy_with(
        joffset2: joffset2,
      )
    end
  end # struct

  # injected channel data offset register          x
  struct JOFR3
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

    # Data offset for injected channel              x
    def joffset3 : UInt16
      UInt16.new!((@value >> 0) & 0xfff_u32)
    end

    # Data offset for injected channel              x
    def self.joffset3 : UInt16
      value.joffset3
    end

    # Data offset for injected channel              x
    def self.joffset3=(value : UInt16) : UInt16
      self.set(joffset3: value)
      value
    end

    def copy_with(
      *,

      joffset3 : UInt16? = nil
    ) : self
      value = @value

      unless joffset3.nil?
        value = (value & 0xfffff000_u32) |
                UInt32.new!(joffset3.to_int).&(0xfff_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      joffset3 : UInt16? = nil
    ) : Nil
      self.value = self.value.copy_with(
        joffset3: joffset3,
      )
    end
  end # struct

  # injected channel data offset register          x
  struct JOFR4
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

    # Data offset for injected channel              x
    def joffset4 : UInt16
      UInt16.new!((@value >> 0) & 0xfff_u32)
    end

    # Data offset for injected channel              x
    def self.joffset4 : UInt16
      value.joffset4
    end

    # Data offset for injected channel              x
    def self.joffset4=(value : UInt16) : UInt16
      self.set(joffset4: value)
      value
    end

    def copy_with(
      *,

      joffset4 : UInt16? = nil
    ) : self
      value = @value

      unless joffset4.nil?
        value = (value & 0xfffff000_u32) |
                UInt32.new!(joffset4.to_int).&(0xfff_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      joffset4 : UInt16? = nil
    ) : Nil
      self.value = self.value.copy_with(
        joffset4: joffset4,
      )
    end
  end # struct

  # watchdog higher threshold          register
  struct HTR
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
      new(0xfff_u64)
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

    # Analog watchdog higher              threshold
    def ht : UInt16
      UInt16.new!((@value >> 0) & 0xfff_u32)
    end

    # Analog watchdog higher              threshold
    def self.ht : UInt16
      value.ht
    end

    # Analog watchdog higher              threshold
    def self.ht=(value : UInt16) : UInt16
      self.set(ht: value)
      value
    end

    def copy_with(
      *,

      ht : UInt16? = nil
    ) : self
      value = @value

      unless ht.nil?
        value = (value & 0xfffff000_u32) |
                UInt32.new!(ht.to_int).&(0xfff_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      ht : UInt16? = nil
    ) : Nil
      self.value = self.value.copy_with(
        ht: ht,
      )
    end
  end # struct

  # watchdog lower threshold          register
  struct LTR
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

    # Analog watchdog lower              threshold
    def lt : UInt16
      UInt16.new!((@value >> 0) & 0xfff_u32)
    end

    # Analog watchdog lower              threshold
    def self.lt : UInt16
      value.lt
    end

    # Analog watchdog lower              threshold
    def self.lt=(value : UInt16) : UInt16
      self.set(lt: value)
      value
    end

    def copy_with(
      *,

      lt : UInt16? = nil
    ) : self
      value = @value

      unless lt.nil?
        value = (value & 0xfffff000_u32) |
                UInt32.new!(lt.to_int).&(0xfff_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      lt : UInt16? = nil
    ) : Nil
      self.value = self.value.copy_with(
        lt: lt,
      )
    end
  end # struct

  # regular sequence register 1
  struct SQR1
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

    # Regular channel sequence              length
    def l : UInt8
      UInt8.new!((@value >> 20) & 0xf_u32)
    end

    # Regular channel sequence              length
    def self.l : UInt8
      value.l
    end

    # Regular channel sequence              length
    def self.l=(value : UInt8) : UInt8
      self.set(l: value)
      value
    end

    # 16th conversion in regular              sequence
    def sq16 : UInt8
      UInt8.new!((@value >> 15) & 0x1f_u32)
    end

    # 16th conversion in regular              sequence
    def self.sq16 : UInt8
      value.sq16
    end

    # 16th conversion in regular              sequence
    def self.sq16=(value : UInt8) : UInt8
      self.set(sq16: value)
      value
    end

    # 15th conversion in regular              sequence
    def sq15 : UInt8
      UInt8.new!((@value >> 10) & 0x1f_u32)
    end

    # 15th conversion in regular              sequence
    def self.sq15 : UInt8
      value.sq15
    end

    # 15th conversion in regular              sequence
    def self.sq15=(value : UInt8) : UInt8
      self.set(sq15: value)
      value
    end

    # 14th conversion in regular              sequence
    def sq14 : UInt8
      UInt8.new!((@value >> 5) & 0x1f_u32)
    end

    # 14th conversion in regular              sequence
    def self.sq14 : UInt8
      value.sq14
    end

    # 14th conversion in regular              sequence
    def self.sq14=(value : UInt8) : UInt8
      self.set(sq14: value)
      value
    end

    # 13th conversion in regular              sequence
    def sq13 : UInt8
      UInt8.new!((@value >> 0) & 0x1f_u32)
    end

    # 13th conversion in regular              sequence
    def self.sq13 : UInt8
      value.sq13
    end

    # 13th conversion in regular              sequence
    def self.sq13=(value : UInt8) : UInt8
      self.set(sq13: value)
      value
    end

    def copy_with(
      *,

      l : UInt8? = nil,

      sq16 : UInt8? = nil,

      sq15 : UInt8? = nil,

      sq14 : UInt8? = nil,

      sq13 : UInt8? = nil
    ) : self
      value = @value

      unless l.nil?
        value = (value & 0xff0fffff_u32) |
                UInt32.new!(l.to_int).&(0xf_u32) << 20
      end

      unless sq16.nil?
        value = (value & 0xfff07fff_u32) |
                UInt32.new!(sq16.to_int).&(0x1f_u32) << 15
      end

      unless sq15.nil?
        value = (value & 0xffff83ff_u32) |
                UInt32.new!(sq15.to_int).&(0x1f_u32) << 10
      end

      unless sq14.nil?
        value = (value & 0xfffffc1f_u32) |
                UInt32.new!(sq14.to_int).&(0x1f_u32) << 5
      end

      unless sq13.nil?
        value = (value & 0xffffffe0_u32) |
                UInt32.new!(sq13.to_int).&(0x1f_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      l : UInt8? = nil,
      sq16 : UInt8? = nil,
      sq15 : UInt8? = nil,
      sq14 : UInt8? = nil,
      sq13 : UInt8? = nil
    ) : Nil
      self.value = self.value.copy_with(
        l: l,
        sq16: sq16,
        sq15: sq15,
        sq14: sq14,
        sq13: sq13,
      )
    end
  end # struct

  # regular sequence register 2
  struct SQR2
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

    # 12th conversion in regular              sequence
    def sq12 : UInt8
      UInt8.new!((@value >> 25) & 0x1f_u32)
    end

    # 12th conversion in regular              sequence
    def self.sq12 : UInt8
      value.sq12
    end

    # 12th conversion in regular              sequence
    def self.sq12=(value : UInt8) : UInt8
      self.set(sq12: value)
      value
    end

    # 11th conversion in regular              sequence
    def sq11 : UInt8
      UInt8.new!((@value >> 20) & 0x1f_u32)
    end

    # 11th conversion in regular              sequence
    def self.sq11 : UInt8
      value.sq11
    end

    # 11th conversion in regular              sequence
    def self.sq11=(value : UInt8) : UInt8
      self.set(sq11: value)
      value
    end

    # 10th conversion in regular              sequence
    def sq10 : UInt8
      UInt8.new!((@value >> 15) & 0x1f_u32)
    end

    # 10th conversion in regular              sequence
    def self.sq10 : UInt8
      value.sq10
    end

    # 10th conversion in regular              sequence
    def self.sq10=(value : UInt8) : UInt8
      self.set(sq10: value)
      value
    end

    # 9th conversion in regular              sequence
    def sq9 : UInt8
      UInt8.new!((@value >> 10) & 0x1f_u32)
    end

    # 9th conversion in regular              sequence
    def self.sq9 : UInt8
      value.sq9
    end

    # 9th conversion in regular              sequence
    def self.sq9=(value : UInt8) : UInt8
      self.set(sq9: value)
      value
    end

    # 8th conversion in regular              sequence
    def sq8 : UInt8
      UInt8.new!((@value >> 5) & 0x1f_u32)
    end

    # 8th conversion in regular              sequence
    def self.sq8 : UInt8
      value.sq8
    end

    # 8th conversion in regular              sequence
    def self.sq8=(value : UInt8) : UInt8
      self.set(sq8: value)
      value
    end

    # 7th conversion in regular              sequence
    def sq7 : UInt8
      UInt8.new!((@value >> 0) & 0x1f_u32)
    end

    # 7th conversion in regular              sequence
    def self.sq7 : UInt8
      value.sq7
    end

    # 7th conversion in regular              sequence
    def self.sq7=(value : UInt8) : UInt8
      self.set(sq7: value)
      value
    end

    def copy_with(
      *,

      sq12 : UInt8? = nil,

      sq11 : UInt8? = nil,

      sq10 : UInt8? = nil,

      sq9 : UInt8? = nil,

      sq8 : UInt8? = nil,

      sq7 : UInt8? = nil
    ) : self
      value = @value

      unless sq12.nil?
        value = (value & 0xc1ffffff_u32) |
                UInt32.new!(sq12.to_int).&(0x1f_u32) << 25
      end

      unless sq11.nil?
        value = (value & 0xfe0fffff_u32) |
                UInt32.new!(sq11.to_int).&(0x1f_u32) << 20
      end

      unless sq10.nil?
        value = (value & 0xfff07fff_u32) |
                UInt32.new!(sq10.to_int).&(0x1f_u32) << 15
      end

      unless sq9.nil?
        value = (value & 0xffff83ff_u32) |
                UInt32.new!(sq9.to_int).&(0x1f_u32) << 10
      end

      unless sq8.nil?
        value = (value & 0xfffffc1f_u32) |
                UInt32.new!(sq8.to_int).&(0x1f_u32) << 5
      end

      unless sq7.nil?
        value = (value & 0xffffffe0_u32) |
                UInt32.new!(sq7.to_int).&(0x1f_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      sq12 : UInt8? = nil,
      sq11 : UInt8? = nil,
      sq10 : UInt8? = nil,
      sq9 : UInt8? = nil,
      sq8 : UInt8? = nil,
      sq7 : UInt8? = nil
    ) : Nil
      self.value = self.value.copy_with(
        sq12: sq12,
        sq11: sq11,
        sq10: sq10,
        sq9: sq9,
        sq8: sq8,
        sq7: sq7,
      )
    end
  end # struct

  # regular sequence register 3
  struct SQR3
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

    # 6th conversion in regular              sequence
    def sq6 : UInt8
      UInt8.new!((@value >> 25) & 0x1f_u32)
    end

    # 6th conversion in regular              sequence
    def self.sq6 : UInt8
      value.sq6
    end

    # 6th conversion in regular              sequence
    def self.sq6=(value : UInt8) : UInt8
      self.set(sq6: value)
      value
    end

    # 5th conversion in regular              sequence
    def sq5 : UInt8
      UInt8.new!((@value >> 20) & 0x1f_u32)
    end

    # 5th conversion in regular              sequence
    def self.sq5 : UInt8
      value.sq5
    end

    # 5th conversion in regular              sequence
    def self.sq5=(value : UInt8) : UInt8
      self.set(sq5: value)
      value
    end

    # 4th conversion in regular              sequence
    def sq4 : UInt8
      UInt8.new!((@value >> 15) & 0x1f_u32)
    end

    # 4th conversion in regular              sequence
    def self.sq4 : UInt8
      value.sq4
    end

    # 4th conversion in regular              sequence
    def self.sq4=(value : UInt8) : UInt8
      self.set(sq4: value)
      value
    end

    # 3rd conversion in regular              sequence
    def sq3 : UInt8
      UInt8.new!((@value >> 10) & 0x1f_u32)
    end

    # 3rd conversion in regular              sequence
    def self.sq3 : UInt8
      value.sq3
    end

    # 3rd conversion in regular              sequence
    def self.sq3=(value : UInt8) : UInt8
      self.set(sq3: value)
      value
    end

    # 2nd conversion in regular              sequence
    def sq2 : UInt8
      UInt8.new!((@value >> 5) & 0x1f_u32)
    end

    # 2nd conversion in regular              sequence
    def self.sq2 : UInt8
      value.sq2
    end

    # 2nd conversion in regular              sequence
    def self.sq2=(value : UInt8) : UInt8
      self.set(sq2: value)
      value
    end

    # 1st conversion in regular              sequence
    def sq1 : UInt8
      UInt8.new!((@value >> 0) & 0x1f_u32)
    end

    # 1st conversion in regular              sequence
    def self.sq1 : UInt8
      value.sq1
    end

    # 1st conversion in regular              sequence
    def self.sq1=(value : UInt8) : UInt8
      self.set(sq1: value)
      value
    end

    def copy_with(
      *,

      sq6 : UInt8? = nil,

      sq5 : UInt8? = nil,

      sq4 : UInt8? = nil,

      sq3 : UInt8? = nil,

      sq2 : UInt8? = nil,

      sq1 : UInt8? = nil
    ) : self
      value = @value

      unless sq6.nil?
        value = (value & 0xc1ffffff_u32) |
                UInt32.new!(sq6.to_int).&(0x1f_u32) << 25
      end

      unless sq5.nil?
        value = (value & 0xfe0fffff_u32) |
                UInt32.new!(sq5.to_int).&(0x1f_u32) << 20
      end

      unless sq4.nil?
        value = (value & 0xfff07fff_u32) |
                UInt32.new!(sq4.to_int).&(0x1f_u32) << 15
      end

      unless sq3.nil?
        value = (value & 0xffff83ff_u32) |
                UInt32.new!(sq3.to_int).&(0x1f_u32) << 10
      end

      unless sq2.nil?
        value = (value & 0xfffffc1f_u32) |
                UInt32.new!(sq2.to_int).&(0x1f_u32) << 5
      end

      unless sq1.nil?
        value = (value & 0xffffffe0_u32) |
                UInt32.new!(sq1.to_int).&(0x1f_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      sq6 : UInt8? = nil,
      sq5 : UInt8? = nil,
      sq4 : UInt8? = nil,
      sq3 : UInt8? = nil,
      sq2 : UInt8? = nil,
      sq1 : UInt8? = nil
    ) : Nil
      self.value = self.value.copy_with(
        sq6: sq6,
        sq5: sq5,
        sq4: sq4,
        sq3: sq3,
        sq2: sq2,
        sq1: sq1,
      )
    end
  end # struct

  # injected sequence register
  struct JSQR
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

    # Injected sequence length
    def jl : UInt8
      UInt8.new!((@value >> 20) & 0x3_u32)
    end

    # Injected sequence length
    def self.jl : UInt8
      value.jl
    end

    # Injected sequence length
    def self.jl=(value : UInt8) : UInt8
      self.set(jl: value)
      value
    end

    # 4th conversion in injected              sequence
    def jsq4 : UInt8
      UInt8.new!((@value >> 15) & 0x1f_u32)
    end

    # 4th conversion in injected              sequence
    def self.jsq4 : UInt8
      value.jsq4
    end

    # 4th conversion in injected              sequence
    def self.jsq4=(value : UInt8) : UInt8
      self.set(jsq4: value)
      value
    end

    # 3rd conversion in injected              sequence
    def jsq3 : UInt8
      UInt8.new!((@value >> 10) & 0x1f_u32)
    end

    # 3rd conversion in injected              sequence
    def self.jsq3 : UInt8
      value.jsq3
    end

    # 3rd conversion in injected              sequence
    def self.jsq3=(value : UInt8) : UInt8
      self.set(jsq3: value)
      value
    end

    # 2nd conversion in injected              sequence
    def jsq2 : UInt8
      UInt8.new!((@value >> 5) & 0x1f_u32)
    end

    # 2nd conversion in injected              sequence
    def self.jsq2 : UInt8
      value.jsq2
    end

    # 2nd conversion in injected              sequence
    def self.jsq2=(value : UInt8) : UInt8
      self.set(jsq2: value)
      value
    end

    # 1st conversion in injected              sequence
    def jsq1 : UInt8
      UInt8.new!((@value >> 0) & 0x1f_u32)
    end

    # 1st conversion in injected              sequence
    def self.jsq1 : UInt8
      value.jsq1
    end

    # 1st conversion in injected              sequence
    def self.jsq1=(value : UInt8) : UInt8
      self.set(jsq1: value)
      value
    end

    def copy_with(
      *,

      jl : UInt8? = nil,

      jsq4 : UInt8? = nil,

      jsq3 : UInt8? = nil,

      jsq2 : UInt8? = nil,

      jsq1 : UInt8? = nil
    ) : self
      value = @value

      unless jl.nil?
        value = (value & 0xffcfffff_u32) |
                UInt32.new!(jl.to_int).&(0x3_u32) << 20
      end

      unless jsq4.nil?
        value = (value & 0xfff07fff_u32) |
                UInt32.new!(jsq4.to_int).&(0x1f_u32) << 15
      end

      unless jsq3.nil?
        value = (value & 0xffff83ff_u32) |
                UInt32.new!(jsq3.to_int).&(0x1f_u32) << 10
      end

      unless jsq2.nil?
        value = (value & 0xfffffc1f_u32) |
                UInt32.new!(jsq2.to_int).&(0x1f_u32) << 5
      end

      unless jsq1.nil?
        value = (value & 0xffffffe0_u32) |
                UInt32.new!(jsq1.to_int).&(0x1f_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      jl : UInt8? = nil,
      jsq4 : UInt8? = nil,
      jsq3 : UInt8? = nil,
      jsq2 : UInt8? = nil,
      jsq1 : UInt8? = nil
    ) : Nil
      self.value = self.value.copy_with(
        jl: jl,
        jsq4: jsq4,
        jsq3: jsq3,
        jsq2: jsq2,
        jsq1: jsq1,
      )
    end
  end # struct

  # injected data register x
  struct JDR1
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

    # Injected data
    def jdata : UInt16
      UInt16.new!((@value >> 0) & 0xffff_u32)
    end

    # Injected data
    def self.jdata : UInt16
      value.jdata
    end
  end # struct

  # injected data register x
  struct JDR2
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

    # Injected data
    def jdata : UInt16
      UInt16.new!((@value >> 0) & 0xffff_u32)
    end

    # Injected data
    def self.jdata : UInt16
      value.jdata
    end
  end # struct

  # injected data register x
  struct JDR3
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

    # Injected data
    def jdata : UInt16
      UInt16.new!((@value >> 0) & 0xffff_u32)
    end

    # Injected data
    def self.jdata : UInt16
      value.jdata
    end
  end # struct

  # injected data register x
  struct JDR4
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

    # Injected data
    def jdata : UInt16
      UInt16.new!((@value >> 0) & 0xffff_u32)
    end

    # Injected data
    def self.jdata : UInt16
      value.jdata
    end
  end # struct

  # regular data register
  struct DR
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

    # Regular data
    def data : UInt16
      UInt16.new!((@value >> 0) & 0xffff_u32)
    end

    # Regular data
    def self.data : UInt16
      value.data
    end
  end # struct

end
