# Analog-to-Digital Converter
module ADC1_2
  VERSION      = nil
  BASE_ADDRESS = 0x50000300_u64

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

    # ADDRDY_MST
    def addrdy_mst : Bool
      @value.bits_set?(0x1_u32)
    end

    # ADDRDY_MST
    def self.addrdy_mst : Bool
      value.addrdy_mst
    end

    enum EOSMP_MST : UInt8
      # End of sampling phase no yet reached
      NOTENDED = 0x0_u64

      # End of sampling phase reached
      ENDED = 0x1_u64

      def self.reset_value : EOSMP_MST
        CSR.reset_value.eosmp_mst
      end
    end

    # EOSMP_MST
    def eosmp_mst : EOSMP_MST
      EOSMP_MST.new!((@value >> 1) & 0x1_u32)
    end

    # EOSMP_MST
    def self.eosmp_mst : EOSMP_MST
      value.eosmp_mst
    end

    enum EOC_MST : UInt8
      # Regular conversion is not complete
      NOTCOMPLETE = 0x0_u64

      # Regular conversion complete
      COMPLETE = 0x1_u64

      def self.reset_value : EOC_MST
        CSR.reset_value.eoc_mst
      end
    end

    # EOC_MST
    def eoc_mst : EOC_MST
      EOC_MST.new!((@value >> 2) & 0x1_u32)
    end

    # EOC_MST
    def self.eoc_mst : EOC_MST
      value.eoc_mst
    end

    enum EOS_MST : UInt8
      # Regular sequence is not complete
      NOTCOMPLETE = 0x0_u64

      # Regular sequence complete
      COMPLETE = 0x1_u64

      def self.reset_value : EOS_MST
        CSR.reset_value.eos_mst
      end
    end

    # EOS_MST
    def eos_mst : EOS_MST
      EOS_MST.new!((@value >> 3) & 0x1_u32)
    end

    # EOS_MST
    def self.eos_mst : EOS_MST
      value.eos_mst
    end

    enum OVR_MST : UInt8
      # No overrun occurred
      NOOVERRUN = 0x0_u64

      # Overrun occurred
      OVERRUN = 0x1_u64

      def self.reset_value : OVR_MST
        CSR.reset_value.ovr_mst
      end
    end

    # OVR_MST
    def ovr_mst : OVR_MST
      OVR_MST.new!((@value >> 4) & 0x1_u32)
    end

    # OVR_MST
    def self.ovr_mst : OVR_MST
      value.ovr_mst
    end

    enum JEOC_MST : UInt8
      # Injected conversion is not complete
      NOTCOMPLETE = 0x0_u64

      # Injected conversion complete
      COMPLETE = 0x1_u64

      def self.reset_value : JEOC_MST
        CSR.reset_value.jeoc_mst
      end
    end

    # JEOC_MST
    def jeoc_mst : JEOC_MST
      JEOC_MST.new!((@value >> 5) & 0x1_u32)
    end

    # JEOC_MST
    def self.jeoc_mst : JEOC_MST
      value.jeoc_mst
    end

    enum JEOS_MST : UInt8
      # Injected sequence is not complete
      NOTCOMPLETE = 0x0_u64

      # Injected sequence complete
      COMPLETE = 0x1_u64

      def self.reset_value : JEOS_MST
        CSR.reset_value.jeos_mst
      end
    end

    # JEOS_MST
    def jeos_mst : JEOS_MST
      JEOS_MST.new!((@value >> 6) & 0x1_u32)
    end

    # JEOS_MST
    def self.jeos_mst : JEOS_MST
      value.jeos_mst
    end

    enum AWD1_MST : UInt8
      # No analog watchdog event occurred
      NOEVENT = 0x0_u64

      # Analog watchdog event occurred
      EVENT = 0x1_u64

      def self.reset_value : AWD1_MST
        CSR.reset_value.awd1_mst
      end
    end

    # AWD1_MST
    def awd1_mst : AWD1_MST
      AWD1_MST.new!((@value >> 7) & 0x1_u32)
    end

    # AWD1_MST
    def self.awd1_mst : AWD1_MST
      value.awd1_mst
    end

    # AWD2_MST
    def awd2_mst : Bool
      @value.bits_set?(0x100_u32)
    end

    # AWD2_MST
    def self.awd2_mst : Bool
      value.awd2_mst
    end

    # AWD3_MST
    def awd3_mst : Bool
      @value.bits_set?(0x200_u32)
    end

    # AWD3_MST
    def self.awd3_mst : Bool
      value.awd3_mst
    end

    enum JQOVF_MST : UInt8
      # No injected context queue overflow has occurred
      NOOVERFLOW = 0x0_u64

      # Injected context queue overflow has occurred
      OVERFLOW = 0x1_u64

      def self.reset_value : JQOVF_MST
        CSR.reset_value.jqovf_mst
      end
    end

    # JQOVF_MST
    def jqovf_mst : JQOVF_MST
      JQOVF_MST.new!((@value >> 10) & 0x1_u32)
    end

    # JQOVF_MST
    def self.jqovf_mst : JQOVF_MST
      value.jqovf_mst
    end

    enum ADRDY_SLV : UInt8
      # ADC is not ready to start conversion
      NOTREADY = 0x0_u64

      # ADC is ready to start conversion
      READY = 0x1_u64

      def self.reset_value : ADRDY_SLV
        CSR.reset_value.adrdy_slv
      end
    end

    # ADRDY_SLV
    def adrdy_slv : ADRDY_SLV
      ADRDY_SLV.new!((@value >> 16) & 0x1_u32)
    end

    # ADRDY_SLV
    def self.adrdy_slv : ADRDY_SLV
      value.adrdy_slv
    end

    # EOSMP_SLV
    def eosmp_slv : Bool
      @value.bits_set?(0x20000_u32)
    end

    # EOSMP_SLV
    def self.eosmp_slv : Bool
      value.eosmp_slv
    end

    # End of regular conversion of the slave              ADC
    def eoc_slv : Bool
      @value.bits_set?(0x40000_u32)
    end

    # End of regular conversion of the slave              ADC
    def self.eoc_slv : Bool
      value.eoc_slv
    end

    # End of regular sequence flag of the              slave ADC
    def eos_slv : Bool
      @value.bits_set?(0x80000_u32)
    end

    # End of regular sequence flag of the              slave ADC
    def self.eos_slv : Bool
      value.eos_slv
    end

    # Overrun flag of the slave              ADC
    def ovr_slv : Bool
      @value.bits_set?(0x100000_u32)
    end

    # Overrun flag of the slave              ADC
    def self.ovr_slv : Bool
      value.ovr_slv
    end

    # End of injected conversion flag of the              slave ADC
    def jeoc_slv : Bool
      @value.bits_set?(0x200000_u32)
    end

    # End of injected conversion flag of the              slave ADC
    def self.jeoc_slv : Bool
      value.jeoc_slv
    end

    # End of injected sequence flag of the              slave ADC
    def jeos_slv : Bool
      @value.bits_set?(0x400000_u32)
    end

    # End of injected sequence flag of the              slave ADC
    def self.jeos_slv : Bool
      value.jeos_slv
    end

    # Analog watchdog 1 flag of the slave              ADC
    def awd1_slv : Bool
      @value.bits_set?(0x800000_u32)
    end

    # Analog watchdog 1 flag of the slave              ADC
    def self.awd1_slv : Bool
      value.awd1_slv
    end

    # Analog watchdog 2 flag of the slave              ADC
    def awd2_slv : Bool
      @value.bits_set?(0x1000000_u32)
    end

    # Analog watchdog 2 flag of the slave              ADC
    def self.awd2_slv : Bool
      value.awd2_slv
    end

    # Analog watchdog 3 flag of the slave              ADC
    def awd3_slv : Bool
      @value.bits_set?(0x2000000_u32)
    end

    # Analog watchdog 3 flag of the slave              ADC
    def self.awd3_slv : Bool
      value.awd3_slv
    end

    # Injected Context Queue Overflow flag of              the slave ADC
    def jqovf_slv : Bool
      @value.bits_set?(0x4000000_u32)
    end

    # Injected Context Queue Overflow flag of              the slave ADC
    def self.jqovf_slv : Bool
      value.jqovf_slv
    end
  end # struct

  # ADC common control register
  struct CCR
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

    enum DUAL : UInt8
      # Independent mode
      INDEPENDENT = 0x0_u64

      # Dual, combined regular simultaneous + injected simultaneous mode
      DUALRJ = 0x1_u64

      # Dual, combined regular simultaneous + alternate trigger mode
      DUALRA = 0x2_u64

      # Dual, combined interleaved mode + injected simultaneous mode
      DUALIJ = 0x3_u64

      # Dual, injected simultaneous mode only
      DUALJ = 0x5_u64

      # Dual, regular simultaneous mode only
      DUALR = 0x6_u64

      # Dual, interleaved mode only
      DUALI = 0x7_u64

      # Dual, alternate trigger mode only
      DUALA = 0x9_u64

      def self.reset_value : DUAL
        CCR.reset_value.dual
      end
    end

    # Dual ADC mode selection
    def dual : DUAL
      DUAL.new!((@value >> 0) & 0x1f_u32)
    end

    # Dual ADC mode selection
    def self.dual : DUAL
      value.dual
    end

    # Dual ADC mode selection
    def self.dual=(value : DUAL) : DUAL
      self.set(dual: value)
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

    enum DMACFG : UInt8
      # DMA one shot mode selected
      ONESHOT = 0x0_u64

      # DMA circular mode selected
      CIRCULATOR = 0x1_u64

      def self.reset_value : DMACFG
        CCR.reset_value.dmacfg
      end
    end

    # DMA configuration (for multi-ADC              mode)
    def dmacfg : DMACFG
      DMACFG.new!((@value >> 13) & 0x1_u32)
    end

    # DMA configuration (for multi-ADC              mode)
    def self.dmacfg : DMACFG
      value.dmacfg
    end

    # DMA configuration (for multi-ADC              mode)
    def self.dmacfg=(value : DMACFG) : DMACFG
      self.set(dmacfg: value)
      value
    end

    enum MDMA : UInt8
      # MDMA mode disabled
      DISABLED = 0x0_u64

      # MDMA mode enabled for 12 and 10-bit resolution
      BITS12_10 = 0x2_u64

      # MDMA mode enabled for 8 and 6-bit resolution
      BITS8_6 = 0x3_u64

      def self.reset_value : MDMA
        CCR.reset_value.mdma
      end
    end

    # Direct memory access mode for multi ADC              mode
    def mdma : MDMA
      MDMA.new!((@value >> 14) & 0x3_u32)
    end

    # Direct memory access mode for multi ADC              mode
    def self.mdma : MDMA
      value.mdma
    end

    # Direct memory access mode for multi ADC              mode
    def self.mdma=(value : MDMA) : MDMA
      self.set(mdma: value)
      value
    end

    enum CKMODE : UInt8
      # Use Kernel Clock adc_ker_ck_input divided by PRESC. Asynchronous to AHB clock
      ASYNCHRONOUS = 0x0_u64

      # Use AHB clock rcc_hclk3. In this case rcc_hclk must equal sys_d1cpre_ck
      SYNCDIV1 = 0x1_u64

      # Use AHB clock rcc_hclk3 divided by 2
      SYNCDIV2 = 0x2_u64

      # Use AHB clock rcc_hclk3 divided by 4
      SYNCDIV4 = 0x3_u64

      def self.reset_value : CKMODE
        CCR.reset_value.ckmode
      end
    end

    # ADC clock mode
    def ckmode : CKMODE
      CKMODE.new!((@value >> 16) & 0x3_u32)
    end

    # ADC clock mode
    def self.ckmode : CKMODE
      value.ckmode
    end

    # ADC clock mode
    def self.ckmode=(value : CKMODE) : CKMODE
      self.set(ckmode: value)
      value
    end

    enum VREFEN : UInt8
      # V_REFINT channel disabled
      DISABLED = 0x0_u64

      # V_REFINT channel enabled
      ENABLED = 0x1_u64

      def self.reset_value : VREFEN
        CCR.reset_value.vrefen
      end
    end

    # VREFINT enable
    def vrefen : VREFEN
      VREFEN.new!((@value >> 22) & 0x1_u32)
    end

    # VREFINT enable
    def self.vrefen : VREFEN
      value.vrefen
    end

    # VREFINT enable
    def self.vrefen=(value : VREFEN) : VREFEN
      self.set(vrefen: value)
      value
    end

    enum TSEN : UInt8
      # Temperature sensor channel disabled
      DISABLED = 0x0_u64

      # Temperature sensor channel enabled
      ENABLED = 0x1_u64

      def self.reset_value : TSEN
        CCR.reset_value.tsen
      end
    end

    # Temperature sensor enable
    def tsen : TSEN
      TSEN.new!((@value >> 23) & 0x1_u32)
    end

    # Temperature sensor enable
    def self.tsen : TSEN
      value.tsen
    end

    # Temperature sensor enable
    def self.tsen=(value : TSEN) : TSEN
      self.set(tsen: value)
      value
    end

    enum VBATEN : UInt8
      # V_BAT channel disabled
      DISABLED = 0x0_u64

      # V_BAT channel enabled
      ENABLED = 0x1_u64

      def self.reset_value : VBATEN
        CCR.reset_value.vbaten
      end
    end

    # VBAT enable
    def vbaten : VBATEN
      VBATEN.new!((@value >> 24) & 0x1_u32)
    end

    # VBAT enable
    def self.vbaten : VBATEN
      value.vbaten
    end

    # VBAT enable
    def self.vbaten=(value : VBATEN) : VBATEN
      self.set(vbaten: value)
      value
    end

    def copy_with(
      *,

      dual : DUAL? = nil,

      delay : UInt8? = nil,

      dmacfg : DMACFG? = nil,

      mdma : MDMA? = nil,

      ckmode : CKMODE? = nil,

      vrefen : VREFEN? = nil,

      tsen : TSEN? = nil,

      vbaten : VBATEN? = nil
    ) : self
      value = @value

      unless dual.nil?
        value = (value & 0xffffffe0_u32) |
                UInt32.new!(dual.to_int).&(0x1f_u32) << 0
      end

      unless delay.nil?
        value = (value & 0xfffff0ff_u32) |
                UInt32.new!(delay.to_int).&(0xf_u32) << 8
      end

      unless dmacfg.nil?
        value = (value & 0xffffdfff_u32) |
                UInt32.new!(dmacfg.to_int).&(0x1_u32) << 13
      end

      unless mdma.nil?
        value = (value & 0xffff3fff_u32) |
                UInt32.new!(mdma.to_int).&(0x3_u32) << 14
      end

      unless ckmode.nil?
        value = (value & 0xfffcffff_u32) |
                UInt32.new!(ckmode.to_int).&(0x3_u32) << 16
      end

      unless vrefen.nil?
        value = (value & 0xffbfffff_u32) |
                UInt32.new!(vrefen.to_int).&(0x1_u32) << 22
      end

      unless tsen.nil?
        value = (value & 0xff7fffff_u32) |
                UInt32.new!(tsen.to_int).&(0x1_u32) << 23
      end

      unless vbaten.nil?
        value = (value & 0xfeffffff_u32) |
                UInt32.new!(vbaten.to_int).&(0x1_u32) << 24
      end

      self.class.new(value)
    end

    def self.set(
      *,
      dual : DUAL? = nil,
      delay : UInt8? = nil,
      dmacfg : DMACFG? = nil,
      mdma : MDMA? = nil,
      ckmode : CKMODE? = nil,
      vrefen : VREFEN? = nil,
      tsen : TSEN? = nil,
      vbaten : VBATEN? = nil
    ) : Nil
      self.value = self.value.copy_with(
        dual: dual,
        delay: delay,
        dmacfg: dmacfg,
        mdma: mdma,
        ckmode: ckmode,
        vrefen: vrefen,
        tsen: tsen,
        vbaten: vbaten,
      )
    end
  end # struct

  # ADC common regular data register for dual          and triple modes
  struct CDR
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

    # Regular data of the slave              ADC
    def rdata_slv : UInt16
      UInt16.new!((@value >> 16) & 0xffff_u32)
    end

    # Regular data of the slave              ADC
    def self.rdata_slv : UInt16
      value.rdata_slv
    end

    # Regular data of the master              ADC
    def rdata_mst : UInt16
      UInt16.new!((@value >> 0) & 0xffff_u32)
    end

    # Regular data of the master              ADC
    def self.rdata_mst : UInt16
      value.rdata_mst
    end
  end # struct

end
