# Analog-to-Digital Converter
module ADC1
  VERSION      = nil
  BASE_ADDRESS = 0x50000000_u64

  # interrupt and status register
  struct ISR
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

    enum JQOVF : UInt8
      # No injected context queue overflow has occurred
      NOOVERFLOW = 0x0_u64

      # Injected context queue overflow has occurred
      OVERFLOW = 0x1_u64

      def self.reset_value : JQOVF
        ISR.reset_value.jqovf
      end
    end

    # JQOVF
    def jqovf : JQOVF
      JQOVF.new!((@value >> 10) & 0x1_u32)
    end

    # JQOVF
    def self.jqovf : JQOVF
      value.jqovf
    end

    # JQOVF
    def self.jqovf=(value : JQOVF) : JQOVF
      self.set(jqovf: value)
      value
    end

    # AWD3
    def awd3 : Bool
      @value.bits_set?(0x200_u32)
    end

    # AWD3
    def self.awd3 : Bool
      value.awd3
    end

    # AWD3
    def self.awd3=(value : Bool) : Bool
      self.set(awd3: value)
      value
    end

    # AWD2
    def awd2 : Bool
      @value.bits_set?(0x100_u32)
    end

    # AWD2
    def self.awd2 : Bool
      value.awd2
    end

    # AWD2
    def self.awd2=(value : Bool) : Bool
      self.set(awd2: value)
      value
    end

    enum AWD1 : UInt8
      # No analog watchdog event occurred
      NOEVENT = 0x0_u64

      # Analog watchdog event occurred
      EVENT = 0x1_u64

      def self.reset_value : AWD1
        ISR.reset_value.awd1
      end
    end

    # AWD1
    def awd1 : AWD1
      AWD1.new!((@value >> 7) & 0x1_u32)
    end

    # AWD1
    def self.awd1 : AWD1
      value.awd1
    end

    # AWD1
    def self.awd1=(value : AWD1) : AWD1
      self.set(awd1: value)
      value
    end

    enum JEOS : UInt8
      # Injected sequence is not complete
      NOTCOMPLETE = 0x0_u64

      # Injected sequence complete
      COMPLETE = 0x1_u64

      def self.reset_value : JEOS
        ISR.reset_value.jeos
      end
    end

    # JEOS
    def jeos : JEOS
      JEOS.new!((@value >> 6) & 0x1_u32)
    end

    # JEOS
    def self.jeos : JEOS
      value.jeos
    end

    # JEOS
    def self.jeos=(value : JEOS) : JEOS
      self.set(jeos: value)
      value
    end

    enum JEOC : UInt8
      # Injected conversion is not complete
      NOTCOMPLETE = 0x0_u64

      # Injected conversion complete
      COMPLETE = 0x1_u64

      def self.reset_value : JEOC
        ISR.reset_value.jeoc
      end
    end

    # JEOC
    def jeoc : JEOC
      JEOC.new!((@value >> 5) & 0x1_u32)
    end

    # JEOC
    def self.jeoc : JEOC
      value.jeoc
    end

    # JEOC
    def self.jeoc=(value : JEOC) : JEOC
      self.set(jeoc: value)
      value
    end

    enum OVR : UInt8
      # No overrun occurred
      NOOVERRUN = 0x0_u64

      # Overrun occurred
      OVERRUN = 0x1_u64

      def self.reset_value : OVR
        ISR.reset_value.ovr
      end
    end

    # OVR
    def ovr : OVR
      OVR.new!((@value >> 4) & 0x1_u32)
    end

    # OVR
    def self.ovr : OVR
      value.ovr
    end

    # OVR
    def self.ovr=(value : OVR) : OVR
      self.set(ovr: value)
      value
    end

    enum EOS : UInt8
      # Regular sequence is not complete
      NOTCOMPLETE = 0x0_u64

      # Regular sequence complete
      COMPLETE = 0x1_u64

      def self.reset_value : EOS
        ISR.reset_value.eos
      end
    end

    # EOS
    def eos : EOS
      EOS.new!((@value >> 3) & 0x1_u32)
    end

    # EOS
    def self.eos : EOS
      value.eos
    end

    # EOS
    def self.eos=(value : EOS) : EOS
      self.set(eos: value)
      value
    end

    enum EOC : UInt8
      # Regular conversion is not complete
      NOTCOMPLETE = 0x0_u64

      # Regular conversion complete
      COMPLETE = 0x1_u64

      def self.reset_value : EOC
        ISR.reset_value.eoc
      end
    end

    # EOC
    def eoc : EOC
      EOC.new!((@value >> 2) & 0x1_u32)
    end

    # EOC
    def self.eoc : EOC
      value.eoc
    end

    # EOC
    def self.eoc=(value : EOC) : EOC
      self.set(eoc: value)
      value
    end

    enum EOSMP : UInt8
      # End of sampling phase no yet reached
      NOTENDED = 0x0_u64

      # End of sampling phase reached
      ENDED = 0x1_u64

      def self.reset_value : EOSMP
        ISR.reset_value.eosmp
      end
    end

    # EOSMP
    def eosmp : EOSMP
      EOSMP.new!((@value >> 1) & 0x1_u32)
    end

    # EOSMP
    def self.eosmp : EOSMP
      value.eosmp
    end

    # EOSMP
    def self.eosmp=(value : EOSMP) : EOSMP
      self.set(eosmp: value)
      value
    end

    enum ADRDY : UInt8
      # ADC is not ready to start conversion
      NOTREADY = 0x0_u64

      # ADC is ready to start conversion
      READY = 0x1_u64

      def self.reset_value : ADRDY
        ISR.reset_value.adrdy
      end
    end

    # ADRDY
    def adrdy : ADRDY
      ADRDY.new!((@value >> 0) & 0x1_u32)
    end

    # ADRDY
    def self.adrdy : ADRDY
      value.adrdy
    end

    # ADRDY
    def self.adrdy=(value : ADRDY) : ADRDY
      self.set(adrdy: value)
      value
    end

    def copy_with(
      *,

      jqovf : JQOVF? = nil,

      awd3 : Bool? = nil,

      awd2 : Bool? = nil,

      awd1 : AWD1? = nil,

      jeos : JEOS? = nil,

      jeoc : JEOC? = nil,

      ovr : OVR? = nil,

      eos : EOS? = nil,

      eoc : EOC? = nil,

      eosmp : EOSMP? = nil,

      adrdy : ADRDY? = nil
    ) : self
      value = @value

      unless jqovf.nil?
        value = (value & 0xfffffbff_u32) |
                UInt32.new!(jqovf.to_int).&(0x1_u32) << 10
      end

      unless awd3.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(awd3.to_int).&(0x1_u32) << 9
      end

      unless awd2.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(awd2.to_int).&(0x1_u32) << 8
      end

      unless awd1.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(awd1.to_int).&(0x1_u32) << 7
      end

      unless jeos.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(jeos.to_int).&(0x1_u32) << 6
      end

      unless jeoc.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(jeoc.to_int).&(0x1_u32) << 5
      end

      unless ovr.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(ovr.to_int).&(0x1_u32) << 4
      end

      unless eos.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(eos.to_int).&(0x1_u32) << 3
      end

      unless eoc.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(eoc.to_int).&(0x1_u32) << 2
      end

      unless eosmp.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(eosmp.to_int).&(0x1_u32) << 1
      end

      unless adrdy.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(adrdy.to_int).&(0x1_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      jqovf : JQOVF? = nil,
      awd3 : Bool? = nil,
      awd2 : Bool? = nil,
      awd1 : AWD1? = nil,
      jeos : JEOS? = nil,
      jeoc : JEOC? = nil,
      ovr : OVR? = nil,
      eos : EOS? = nil,
      eoc : EOC? = nil,
      eosmp : EOSMP? = nil,
      adrdy : ADRDY? = nil
    ) : Nil
      self.value = self.value.copy_with(
        jqovf: jqovf,
        awd3: awd3,
        awd2: awd2,
        awd1: awd1,
        jeos: jeos,
        jeoc: jeoc,
        ovr: ovr,
        eos: eos,
        eoc: eoc,
        eosmp: eosmp,
        adrdy: adrdy,
      )
    end
  end # struct

  # interrupt enable register
  struct IER
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

    enum JQOVFIE : UInt8
      # Injected context queue overflow interrupt disabled
      DISABLED = 0x0_u64

      # Injected context queue overflow interrupt enabled
      ENABLED = 0x1_u64

      def self.reset_value : JQOVFIE
        IER.reset_value.jqovfie
      end
    end

    # JQOVFIE
    def jqovfie : JQOVFIE
      JQOVFIE.new!((@value >> 10) & 0x1_u32)
    end

    # JQOVFIE
    def self.jqovfie : JQOVFIE
      value.jqovfie
    end

    # JQOVFIE
    def self.jqovfie=(value : JQOVFIE) : JQOVFIE
      self.set(jqovfie: value)
      value
    end

    # AWD3IE
    def awd3_ie : Bool
      @value.bits_set?(0x200_u32)
    end

    # AWD3IE
    def self.awd3_ie : Bool
      value.awd3_ie
    end

    # AWD3IE
    def self.awd3_ie=(value : Bool) : Bool
      self.set(awd3_ie: value)
      value
    end

    # AWD2IE
    def awd2_ie : Bool
      @value.bits_set?(0x100_u32)
    end

    # AWD2IE
    def self.awd2_ie : Bool
      value.awd2_ie
    end

    # AWD2IE
    def self.awd2_ie=(value : Bool) : Bool
      self.set(awd2_ie: value)
      value
    end

    enum AWD1IE : UInt8
      # Analog watchdog interrupt disabled
      DISABLED = 0x0_u64

      # Analog watchdog interrupt enabled
      ENABLED = 0x1_u64

      def self.reset_value : AWD1IE
        IER.reset_value.awd1_ie
      end
    end

    # AWD1IE
    def awd1_ie : AWD1IE
      AWD1IE.new!((@value >> 7) & 0x1_u32)
    end

    # AWD1IE
    def self.awd1_ie : AWD1IE
      value.awd1_ie
    end

    # AWD1IE
    def self.awd1_ie=(value : AWD1IE) : AWD1IE
      self.set(awd1_ie: value)
      value
    end

    enum JEOSIE : UInt8
      # End of injected sequence interrupt disabled
      DISABLED = 0x0_u64

      # End of injected sequence interrupt enabled
      ENABLED = 0x1_u64

      def self.reset_value : JEOSIE
        IER.reset_value.jeosie
      end
    end

    # JEOSIE
    def jeosie : JEOSIE
      JEOSIE.new!((@value >> 6) & 0x1_u32)
    end

    # JEOSIE
    def self.jeosie : JEOSIE
      value.jeosie
    end

    # JEOSIE
    def self.jeosie=(value : JEOSIE) : JEOSIE
      self.set(jeosie: value)
      value
    end

    enum JEOCIE : UInt8
      # End of injected conversion interrupt disabled
      DISABLED = 0x0_u64

      # End of injected conversion interrupt enabled
      ENABLED = 0x1_u64

      def self.reset_value : JEOCIE
        IER.reset_value.jeocie
      end
    end

    # JEOCIE
    def jeocie : JEOCIE
      JEOCIE.new!((@value >> 5) & 0x1_u32)
    end

    # JEOCIE
    def self.jeocie : JEOCIE
      value.jeocie
    end

    # JEOCIE
    def self.jeocie=(value : JEOCIE) : JEOCIE
      self.set(jeocie: value)
      value
    end

    enum OVRIE : UInt8
      # Overrun interrupt disabled
      DISABLED = 0x0_u64

      # Overrun interrupt enabled
      ENABLED = 0x1_u64

      def self.reset_value : OVRIE
        IER.reset_value.ovrie
      end
    end

    # OVRIE
    def ovrie : OVRIE
      OVRIE.new!((@value >> 4) & 0x1_u32)
    end

    # OVRIE
    def self.ovrie : OVRIE
      value.ovrie
    end

    # OVRIE
    def self.ovrie=(value : OVRIE) : OVRIE
      self.set(ovrie: value)
      value
    end

    enum EOSIE : UInt8
      # End of regular sequence interrupt disabled
      DISABLED = 0x0_u64

      # End of regular sequence interrupt enabled
      ENABLED = 0x1_u64

      def self.reset_value : EOSIE
        IER.reset_value.eosie
      end
    end

    # EOSIE
    def eosie : EOSIE
      EOSIE.new!((@value >> 3) & 0x1_u32)
    end

    # EOSIE
    def self.eosie : EOSIE
      value.eosie
    end

    # EOSIE
    def self.eosie=(value : EOSIE) : EOSIE
      self.set(eosie: value)
      value
    end

    enum EOCIE : UInt8
      # End of regular conversion interrupt disabled
      DISABLED = 0x0_u64

      # End of regular conversion interrupt enabled
      ENABLED = 0x1_u64

      def self.reset_value : EOCIE
        IER.reset_value.eocie
      end
    end

    # EOCIE
    def eocie : EOCIE
      EOCIE.new!((@value >> 2) & 0x1_u32)
    end

    # EOCIE
    def self.eocie : EOCIE
      value.eocie
    end

    # EOCIE
    def self.eocie=(value : EOCIE) : EOCIE
      self.set(eocie: value)
      value
    end

    enum EOSMPIE : UInt8
      # End of regular conversion sampling phase interrupt disabled
      DISABLED = 0x0_u64

      # End of regular conversion sampling phase interrupt enabled
      ENABLED = 0x1_u64

      def self.reset_value : EOSMPIE
        IER.reset_value.eosmpie
      end
    end

    # EOSMPIE
    def eosmpie : EOSMPIE
      EOSMPIE.new!((@value >> 1) & 0x1_u32)
    end

    # EOSMPIE
    def self.eosmpie : EOSMPIE
      value.eosmpie
    end

    # EOSMPIE
    def self.eosmpie=(value : EOSMPIE) : EOSMPIE
      self.set(eosmpie: value)
      value
    end

    enum ADRDYIE : UInt8
      # ADC ready interrupt disabled
      DISABLED = 0x0_u64

      # ADC ready interrupt enabled
      ENABLED = 0x1_u64

      def self.reset_value : ADRDYIE
        IER.reset_value.adrdyie
      end
    end

    # ADRDYIE
    def adrdyie : ADRDYIE
      ADRDYIE.new!((@value >> 0) & 0x1_u32)
    end

    # ADRDYIE
    def self.adrdyie : ADRDYIE
      value.adrdyie
    end

    # ADRDYIE
    def self.adrdyie=(value : ADRDYIE) : ADRDYIE
      self.set(adrdyie: value)
      value
    end

    def copy_with(
      *,

      jqovfie : JQOVFIE? = nil,

      awd3_ie : Bool? = nil,

      awd2_ie : Bool? = nil,

      awd1_ie : AWD1IE? = nil,

      jeosie : JEOSIE? = nil,

      jeocie : JEOCIE? = nil,

      ovrie : OVRIE? = nil,

      eosie : EOSIE? = nil,

      eocie : EOCIE? = nil,

      eosmpie : EOSMPIE? = nil,

      adrdyie : ADRDYIE? = nil
    ) : self
      value = @value

      unless jqovfie.nil?
        value = (value & 0xfffffbff_u32) |
                UInt32.new!(jqovfie.to_int).&(0x1_u32) << 10
      end

      unless awd3_ie.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(awd3_ie.to_int).&(0x1_u32) << 9
      end

      unless awd2_ie.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(awd2_ie.to_int).&(0x1_u32) << 8
      end

      unless awd1_ie.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(awd1_ie.to_int).&(0x1_u32) << 7
      end

      unless jeosie.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(jeosie.to_int).&(0x1_u32) << 6
      end

      unless jeocie.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(jeocie.to_int).&(0x1_u32) << 5
      end

      unless ovrie.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(ovrie.to_int).&(0x1_u32) << 4
      end

      unless eosie.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(eosie.to_int).&(0x1_u32) << 3
      end

      unless eocie.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(eocie.to_int).&(0x1_u32) << 2
      end

      unless eosmpie.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(eosmpie.to_int).&(0x1_u32) << 1
      end

      unless adrdyie.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(adrdyie.to_int).&(0x1_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      jqovfie : JQOVFIE? = nil,
      awd3_ie : Bool? = nil,
      awd2_ie : Bool? = nil,
      awd1_ie : AWD1IE? = nil,
      jeosie : JEOSIE? = nil,
      jeocie : JEOCIE? = nil,
      ovrie : OVRIE? = nil,
      eosie : EOSIE? = nil,
      eocie : EOCIE? = nil,
      eosmpie : EOSMPIE? = nil,
      adrdyie : ADRDYIE? = nil
    ) : Nil
      self.value = self.value.copy_with(
        jqovfie: jqovfie,
        awd3_ie: awd3_ie,
        awd2_ie: awd2_ie,
        awd1_ie: awd1_ie,
        jeosie: jeosie,
        jeocie: jeocie,
        ovrie: ovrie,
        eosie: eosie,
        eocie: eocie,
        eosmpie: eosmpie,
        adrdyie: adrdyie,
      )
    end
  end # struct

  # control register
  struct CR
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

    enum ADCAL : UInt8
      # Calibration complete
      COMPLETE = 0x0_u64

      # Start the calibration of the ADC
      CALIBRATION = 0x1_u64

      def self.reset_value : ADCAL
        CR.reset_value.adcal
      end
    end

    # ADCAL
    def adcal : ADCAL
      ADCAL.new!((@value >> 31) & 0x1_u32)
    end

    # ADCAL
    def self.adcal : ADCAL
      value.adcal
    end

    # ADCAL
    def self.adcal=(value : ADCAL) : ADCAL
      self.set(adcal: value)
      value
    end

    enum ADCALDIF : UInt8
      # Calibration for single-ended mode
      SINGLEENDED = 0x0_u64

      # Calibration for differential mode
      DIFFERENTIAL = 0x1_u64

      def self.reset_value : ADCALDIF
        CR.reset_value.adcaldif
      end
    end

    # ADCALDIF
    def adcaldif : ADCALDIF
      ADCALDIF.new!((@value >> 30) & 0x1_u32)
    end

    # ADCALDIF
    def self.adcaldif : ADCALDIF
      value.adcaldif
    end

    # ADCALDIF
    def self.adcaldif=(value : ADCALDIF) : ADCALDIF
      self.set(adcaldif: value)
      value
    end

    enum ADVREGEN : UInt8
      # Intermediate state required when moving the ADC voltage regulator between states
      INTERMEDIATE = 0x0_u64

      # ADC voltage regulator enabled
      ENABLED = 0x1_u64

      # ADC voltage regulator disabled
      DISABLED = 0x2_u64

      def self.reset_value : ADVREGEN
        CR.reset_value.advregen
      end
    end

    # ADVREGEN
    def advregen : ADVREGEN
      ADVREGEN.new!((@value >> 28) & 0x3_u32)
    end

    # ADVREGEN
    def self.advregen : ADVREGEN
      value.advregen
    end

    # ADVREGEN
    def self.advregen=(value : ADVREGEN) : ADVREGEN
      self.set(advregen: value)
      value
    end

    # JADSTP
    def jadstp : Bool
      @value.bits_set?(0x20_u32)
    end

    # JADSTP
    def self.jadstp : Bool
      value.jadstp
    end

    # JADSTP
    def self.jadstp=(value : Bool) : Bool
      self.set(jadstp: value)
      value
    end

    enum ADSTP : UInt8
      # Stop conversion of channel
      STOP = 0x1_u64

      def self.reset_value : ADSTP
        CR.reset_value.adstp
      end
    end

    # ADSTP
    def adstp : ADSTP
      ADSTP.new!((@value >> 4) & 0x1_u32)
    end

    # ADSTP
    def self.adstp : ADSTP
      value.adstp
    end

    # ADSTP
    def self.adstp=(value : ADSTP) : ADSTP
      self.set(adstp: value)
      value
    end

    # JADSTART
    def jadstart : Bool
      @value.bits_set?(0x8_u32)
    end

    # JADSTART
    def self.jadstart : Bool
      value.jadstart
    end

    # JADSTART
    def self.jadstart=(value : Bool) : Bool
      self.set(jadstart: value)
      value
    end

    enum ADSTART : UInt8
      # Starts conversion of channel
      START = 0x1_u64

      def self.reset_value : ADSTART
        CR.reset_value.adstart
      end
    end

    # ADSTART
    def adstart : ADSTART
      ADSTART.new!((@value >> 2) & 0x1_u32)
    end

    # ADSTART
    def self.adstart : ADSTART
      value.adstart
    end

    # ADSTART
    def self.adstart=(value : ADSTART) : ADSTART
      self.set(adstart: value)
      value
    end

    enum ADDIS : UInt8
      # Disable ADC conversion and go to power down mode
      DISABLE = 0x0_u64

      def self.reset_value : ADDIS
        CR.reset_value.addis
      end
    end

    # ADDIS
    def addis : ADDIS
      ADDIS.new!((@value >> 1) & 0x1_u32)
    end

    # ADDIS
    def self.addis : ADDIS
      value.addis
    end

    # ADDIS
    def self.addis=(value : ADDIS) : ADDIS
      self.set(addis: value)
      value
    end

    enum ADEN : UInt8
      # Enable ADC
      ENABLE = 0x1_u64

      def self.reset_value : ADEN
        CR.reset_value.aden
      end
    end

    # ADEN
    def aden : ADEN
      ADEN.new!((@value >> 0) & 0x1_u32)
    end

    # ADEN
    def self.aden : ADEN
      value.aden
    end

    # ADEN
    def self.aden=(value : ADEN) : ADEN
      self.set(aden: value)
      value
    end

    def copy_with(
      *,

      adcal : ADCAL? = nil,

      adcaldif : ADCALDIF? = nil,

      advregen : ADVREGEN? = nil,

      jadstp : Bool? = nil,

      adstp : ADSTP? = nil,

      jadstart : Bool? = nil,

      adstart : ADSTART? = nil,

      addis : ADDIS? = nil,

      aden : ADEN? = nil
    ) : self
      value = @value

      unless adcal.nil?
        value = (value & 0x7fffffff_u32) |
                UInt32.new!(adcal.to_int).&(0x1_u32) << 31
      end

      unless adcaldif.nil?
        value = (value & 0xbfffffff_u32) |
                UInt32.new!(adcaldif.to_int).&(0x1_u32) << 30
      end

      unless advregen.nil?
        value = (value & 0xcfffffff_u32) |
                UInt32.new!(advregen.to_int).&(0x3_u32) << 28
      end

      unless jadstp.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(jadstp.to_int).&(0x1_u32) << 5
      end

      unless adstp.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(adstp.to_int).&(0x1_u32) << 4
      end

      unless jadstart.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(jadstart.to_int).&(0x1_u32) << 3
      end

      unless adstart.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(adstart.to_int).&(0x1_u32) << 2
      end

      unless addis.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(addis.to_int).&(0x1_u32) << 1
      end

      unless aden.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(aden.to_int).&(0x1_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      adcal : ADCAL? = nil,
      adcaldif : ADCALDIF? = nil,
      advregen : ADVREGEN? = nil,
      jadstp : Bool? = nil,
      adstp : ADSTP? = nil,
      jadstart : Bool? = nil,
      adstart : ADSTART? = nil,
      addis : ADDIS? = nil,
      aden : ADEN? = nil
    ) : Nil
      self.value = self.value.copy_with(
        adcal: adcal,
        adcaldif: adcaldif,
        advregen: advregen,
        jadstp: jadstp,
        adstp: adstp,
        jadstart: jadstart,
        adstart: adstart,
        addis: addis,
        aden: aden,
      )
    end
  end # struct

  # configuration register
  struct CFGR
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

    # AWDCH1CH
    def awd1_ch : UInt8
      UInt8.new!((@value >> 26) & 0x1f_u32)
    end

    # AWDCH1CH
    def self.awd1_ch : UInt8
      value.awd1_ch
    end

    # AWDCH1CH
    def self.awd1_ch=(value : UInt8) : UInt8
      self.set(awd1_ch: value)
      value
    end

    enum JAUTO : UInt8
      # Automatic injected group conversion disabled
      DISABLED = 0x0_u64

      # Automatic injected group conversion enabled
      ENABLED = 0x1_u64

      def self.reset_value : JAUTO
        CFGR.reset_value.jauto
      end
    end

    # JAUTO
    def jauto : JAUTO
      JAUTO.new!((@value >> 25) & 0x1_u32)
    end

    # JAUTO
    def self.jauto : JAUTO
      value.jauto
    end

    # JAUTO
    def self.jauto=(value : JAUTO) : JAUTO
      self.set(jauto: value)
      value
    end

    enum JAWD1EN : UInt8
      # Analog watchdog 1 disabled on injected channels
      DISABLED = 0x0_u64

      # Analog watchdog 1 enabled on injected channels
      ENABLED = 0x1_u64

      def self.reset_value : JAWD1EN
        CFGR.reset_value.jawd1_en
      end
    end

    # JAWD1EN
    def jawd1_en : JAWD1EN
      JAWD1EN.new!((@value >> 24) & 0x1_u32)
    end

    # JAWD1EN
    def self.jawd1_en : JAWD1EN
      value.jawd1_en
    end

    # JAWD1EN
    def self.jawd1_en=(value : JAWD1EN) : JAWD1EN
      self.set(jawd1_en: value)
      value
    end

    enum AWD1EN : UInt8
      # Analog watchdog 1 disabled on regular channels
      DISABLED = 0x0_u64

      # Analog watchdog 1 enabled on regular channels
      ENABLED = 0x1_u64

      def self.reset_value : AWD1EN
        CFGR.reset_value.awd1_en
      end
    end

    # AWD1EN
    def awd1_en : AWD1EN
      AWD1EN.new!((@value >> 23) & 0x1_u32)
    end

    # AWD1EN
    def self.awd1_en : AWD1EN
      value.awd1_en
    end

    # AWD1EN
    def self.awd1_en=(value : AWD1EN) : AWD1EN
      self.set(awd1_en: value)
      value
    end

    enum AWD1SGL : UInt8
      # Analog watchdog 1 enabled on all channels
      ALL = 0x0_u64

      # Analog watchdog 1 enabled on single channel selected in AWD1CH
      SINGLE = 0x1_u64

      def self.reset_value : AWD1SGL
        CFGR.reset_value.awd1_sgl
      end
    end

    # AWD1SGL
    def awd1_sgl : AWD1SGL
      AWD1SGL.new!((@value >> 22) & 0x1_u32)
    end

    # AWD1SGL
    def self.awd1_sgl : AWD1SGL
      value.awd1_sgl
    end

    # AWD1SGL
    def self.awd1_sgl=(value : AWD1SGL) : AWD1SGL
      self.set(awd1_sgl: value)
      value
    end

    enum JQM : UInt8
      # JSQR Mode 0: Queue maintains the last written configuration into JSQR
      MODE0 = 0x0_u64

      # JSQR Mode 1: An empty queue disables software and hardware triggers of the injected sequence
      MODE1 = 0x1_u64

      def self.reset_value : JQM
        CFGR.reset_value.jqm
      end
    end

    # JQM
    def jqm : JQM
      JQM.new!((@value >> 21) & 0x1_u32)
    end

    # JQM
    def self.jqm : JQM
      value.jqm
    end

    # JQM
    def self.jqm=(value : JQM) : JQM
      self.set(jqm: value)
      value
    end

    enum JDISCEN : UInt8
      # Discontinuous mode on injected channels disabled
      DISABLED = 0x0_u64

      # Discontinuous mode on injected channels enabled
      ENABLED = 0x1_u64

      def self.reset_value : JDISCEN
        CFGR.reset_value.jdiscen
      end
    end

    # JDISCEN
    def jdiscen : JDISCEN
      JDISCEN.new!((@value >> 20) & 0x1_u32)
    end

    # JDISCEN
    def self.jdiscen : JDISCEN
      value.jdiscen
    end

    # JDISCEN
    def self.jdiscen=(value : JDISCEN) : JDISCEN
      self.set(jdiscen: value)
      value
    end

    # DISCNUM
    def discnum : UInt8
      UInt8.new!((@value >> 17) & 0x7_u32)
    end

    # DISCNUM
    def self.discnum : UInt8
      value.discnum
    end

    # DISCNUM
    def self.discnum=(value : UInt8) : UInt8
      self.set(discnum: value)
      value
    end

    enum DISCEN : UInt8
      # Discontinuous mode on regular channels disabled
      DISABLED = 0x0_u64

      # Discontinuous mode on regular channels enabled
      ENABLED = 0x1_u64

      def self.reset_value : DISCEN
        CFGR.reset_value.discen
      end
    end

    # DISCEN
    def discen : DISCEN
      DISCEN.new!((@value >> 16) & 0x1_u32)
    end

    # DISCEN
    def self.discen : DISCEN
      value.discen
    end

    # DISCEN
    def self.discen=(value : DISCEN) : DISCEN
      self.set(discen: value)
      value
    end

    enum AUTDLY : UInt8
      # Auto delayed conversion mode off
      OFF = 0x0_u64

      # Auto delayed conversion mode on
      ON = 0x1_u64

      def self.reset_value : AUTDLY
        CFGR.reset_value.autdly
      end
    end

    # AUTDLY
    def autdly : AUTDLY
      AUTDLY.new!((@value >> 14) & 0x1_u32)
    end

    # AUTDLY
    def self.autdly : AUTDLY
      value.autdly
    end

    # AUTDLY
    def self.autdly=(value : AUTDLY) : AUTDLY
      self.set(autdly: value)
      value
    end

    enum CONT : UInt8
      # Single conversion mode
      SINGLE = 0x0_u64

      # Continuous conversion mode
      CONTINUOUS = 0x1_u64

      def self.reset_value : CONT
        CFGR.reset_value.cont
      end
    end

    # CONT
    def cont : CONT
      CONT.new!((@value >> 13) & 0x1_u32)
    end

    # CONT
    def self.cont : CONT
      value.cont
    end

    # CONT
    def self.cont=(value : CONT) : CONT
      self.set(cont: value)
      value
    end

    enum OVRMOD : UInt8
      # Preserve DR register when an overrun is detected
      PRESERVE = 0x0_u64

      # Overwrite DR register when an overrun is detected
      OVERWRITE = 0x1_u64

      def self.reset_value : OVRMOD
        CFGR.reset_value.ovrmod
      end
    end

    # OVRMOD
    def ovrmod : OVRMOD
      OVRMOD.new!((@value >> 12) & 0x1_u32)
    end

    # OVRMOD
    def self.ovrmod : OVRMOD
      value.ovrmod
    end

    # OVRMOD
    def self.ovrmod=(value : OVRMOD) : OVRMOD
      self.set(ovrmod: value)
      value
    end

    enum EXTEN : UInt8
      # Trigger detection disabled
      DISABLED = 0x0_u64

      # Trigger detection on the rising edge
      RISINGEDGE = 0x1_u64

      # Trigger detection on the falling edge
      FALLINGEDGE = 0x2_u64

      # Trigger detection on both the rising and falling edges
      BOTHEDGES = 0x3_u64

      def self.reset_value : EXTEN
        CFGR.reset_value.exten
      end
    end

    # EXTEN
    def exten : EXTEN
      EXTEN.new!((@value >> 10) & 0x3_u32)
    end

    # EXTEN
    def self.exten : EXTEN
      value.exten
    end

    # EXTEN
    def self.exten=(value : EXTEN) : EXTEN
      self.set(exten: value)
      value
    end

    enum EXTSEL : UInt8
      # HRTIM_ADCTRG1 event
      HRTIM_ADCTRG1 = 0x7_u64

      # HRTIM_ADCTRG3 event
      HRTIM_ADCTRG3 = 0x8_u64

      # Timer 1 CC1 event
      TIM1_CC1 = 0x0_u64

      # Timer 1 CC2 event
      TIM1_CC2 = 0x1_u64

      # Timer 1 CC3 event
      TIM1_CC3 = 0x2_u64

      # Timer 2 CC2 event
      TIM2_CC2 = 0x3_u64

      # Timer 3 TRGO event
      TIM3_TRGO = 0x4_u64

      # EXTI line 11
      EXTI11 = 0x6_u64

      # Timer 1 TRGO event
      TIM1_TRGO = 0x9_u64

      # Timer 1 TRGO2 event
      TIM1_TRGO2 = 0xa_u64

      # Timer 2 TRGO event
      TIM2_TRGO = 0xb_u64

      # Timer 6 TRGO event
      TIM6_TRGO = 0xd_u64

      # Timer 15 TRGO event
      TIM15_TRGO = 0xe_u64

      # Timer 3 CC4 event
      TIM3_CC4 = 0xf_u64

      def self.reset_value : EXTSEL
        CFGR.reset_value.extsel
      end
    end

    # EXTSEL
    def extsel : EXTSEL
      EXTSEL.new!((@value >> 6) & 0xf_u32)
    end

    # EXTSEL
    def self.extsel : EXTSEL
      value.extsel
    end

    # EXTSEL
    def self.extsel=(value : EXTSEL) : EXTSEL
      self.set(extsel: value)
      value
    end

    enum ALIGN : UInt8
      # Right alignment
      RIGHT = 0x0_u64

      # Left alignment
      LEFT = 0x1_u64

      def self.reset_value : ALIGN
        CFGR.reset_value.align
      end
    end

    # ALIGN
    def align : ALIGN
      ALIGN.new!((@value >> 5) & 0x1_u32)
    end

    # ALIGN
    def self.align : ALIGN
      value.align
    end

    # ALIGN
    def self.align=(value : ALIGN) : ALIGN
      self.set(align: value)
      value
    end

    enum RES : UInt8
      # 12-bit
      BITS12 = 0x0_u64

      # 10-bit
      BITS10 = 0x1_u64

      # 8-bit
      BITS8 = 0x2_u64

      # 6-bit
      BITS6 = 0x3_u64

      def self.reset_value : RES
        CFGR.reset_value.res
      end
    end

    # RES
    def res : RES
      RES.new!((@value >> 3) & 0x3_u32)
    end

    # RES
    def self.res : RES
      value.res
    end

    # RES
    def self.res=(value : RES) : RES
      self.set(res: value)
      value
    end

    enum DMACFG : UInt8
      # DMA One Shot Mode selected
      ONESHOT = 0x0_u64

      # DMA circular mode selected
      CIRCULAR = 0x1_u64

      def self.reset_value : DMACFG
        CFGR.reset_value.dmacfg
      end
    end

    # DMACFG
    def dmacfg : DMACFG
      DMACFG.new!((@value >> 1) & 0x1_u32)
    end

    # DMACFG
    def self.dmacfg : DMACFG
      value.dmacfg
    end

    # DMACFG
    def self.dmacfg=(value : DMACFG) : DMACFG
      self.set(dmacfg: value)
      value
    end

    enum DMAEN : UInt8
      # DMA disabled
      DISABLED = 0x0_u64

      # DMA enabled
      ENABLED = 0x1_u64

      def self.reset_value : DMAEN
        CFGR.reset_value.dmaen
      end
    end

    # DMAEN
    def dmaen : DMAEN
      DMAEN.new!((@value >> 0) & 0x1_u32)
    end

    # DMAEN
    def self.dmaen : DMAEN
      value.dmaen
    end

    # DMAEN
    def self.dmaen=(value : DMAEN) : DMAEN
      self.set(dmaen: value)
      value
    end

    def copy_with(
      *,

      awd1_ch : UInt8? = nil,

      jauto : JAUTO? = nil,

      jawd1_en : JAWD1EN? = nil,

      awd1_en : AWD1EN? = nil,

      awd1_sgl : AWD1SGL? = nil,

      jqm : JQM? = nil,

      jdiscen : JDISCEN? = nil,

      discnum : UInt8? = nil,

      discen : DISCEN? = nil,

      autdly : AUTDLY? = nil,

      cont : CONT? = nil,

      ovrmod : OVRMOD? = nil,

      exten : EXTEN? = nil,

      extsel : EXTSEL? = nil,

      align : ALIGN? = nil,

      res : RES? = nil,

      dmacfg : DMACFG? = nil,

      dmaen : DMAEN? = nil
    ) : self
      value = @value

      unless awd1_ch.nil?
        value = (value & 0x83ffffff_u32) |
                UInt32.new!(awd1_ch.to_int).&(0x1f_u32) << 26
      end

      unless jauto.nil?
        value = (value & 0xfdffffff_u32) |
                UInt32.new!(jauto.to_int).&(0x1_u32) << 25
      end

      unless jawd1_en.nil?
        value = (value & 0xfeffffff_u32) |
                UInt32.new!(jawd1_en.to_int).&(0x1_u32) << 24
      end

      unless awd1_en.nil?
        value = (value & 0xff7fffff_u32) |
                UInt32.new!(awd1_en.to_int).&(0x1_u32) << 23
      end

      unless awd1_sgl.nil?
        value = (value & 0xffbfffff_u32) |
                UInt32.new!(awd1_sgl.to_int).&(0x1_u32) << 22
      end

      unless jqm.nil?
        value = (value & 0xffdfffff_u32) |
                UInt32.new!(jqm.to_int).&(0x1_u32) << 21
      end

      unless jdiscen.nil?
        value = (value & 0xffefffff_u32) |
                UInt32.new!(jdiscen.to_int).&(0x1_u32) << 20
      end

      unless discnum.nil?
        value = (value & 0xfff1ffff_u32) |
                UInt32.new!(discnum.to_int).&(0x7_u32) << 17
      end

      unless discen.nil?
        value = (value & 0xfffeffff_u32) |
                UInt32.new!(discen.to_int).&(0x1_u32) << 16
      end

      unless autdly.nil?
        value = (value & 0xffffbfff_u32) |
                UInt32.new!(autdly.to_int).&(0x1_u32) << 14
      end

      unless cont.nil?
        value = (value & 0xffffdfff_u32) |
                UInt32.new!(cont.to_int).&(0x1_u32) << 13
      end

      unless ovrmod.nil?
        value = (value & 0xffffefff_u32) |
                UInt32.new!(ovrmod.to_int).&(0x1_u32) << 12
      end

      unless exten.nil?
        value = (value & 0xfffff3ff_u32) |
                UInt32.new!(exten.to_int).&(0x3_u32) << 10
      end

      unless extsel.nil?
        value = (value & 0xfffffc3f_u32) |
                UInt32.new!(extsel.to_int).&(0xf_u32) << 6
      end

      unless align.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(align.to_int).&(0x1_u32) << 5
      end

      unless res.nil?
        value = (value & 0xffffffe7_u32) |
                UInt32.new!(res.to_int).&(0x3_u32) << 3
      end

      unless dmacfg.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(dmacfg.to_int).&(0x1_u32) << 1
      end

      unless dmaen.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(dmaen.to_int).&(0x1_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      awd1_ch : UInt8? = nil,
      jauto : JAUTO? = nil,
      jawd1_en : JAWD1EN? = nil,
      awd1_en : AWD1EN? = nil,
      awd1_sgl : AWD1SGL? = nil,
      jqm : JQM? = nil,
      jdiscen : JDISCEN? = nil,
      discnum : UInt8? = nil,
      discen : DISCEN? = nil,
      autdly : AUTDLY? = nil,
      cont : CONT? = nil,
      ovrmod : OVRMOD? = nil,
      exten : EXTEN? = nil,
      extsel : EXTSEL? = nil,
      align : ALIGN? = nil,
      res : RES? = nil,
      dmacfg : DMACFG? = nil,
      dmaen : DMAEN? = nil
    ) : Nil
      self.value = self.value.copy_with(
        awd1_ch: awd1_ch,
        jauto: jauto,
        jawd1_en: jawd1_en,
        awd1_en: awd1_en,
        awd1_sgl: awd1_sgl,
        jqm: jqm,
        jdiscen: jdiscen,
        discnum: discnum,
        discen: discen,
        autdly: autdly,
        cont: cont,
        ovrmod: ovrmod,
        exten: exten,
        extsel: extsel,
        align: align,
        res: res,
        dmacfg: dmacfg,
        dmaen: dmaen,
      )
    end
  end # struct

  # sample time register 1
  struct SMPR1
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

    # SMP9
    def smp9 : UInt8
      UInt8.new!((@value >> 27) & 0x7_u32)
    end

    # SMP9
    def self.smp9 : UInt8
      value.smp9
    end

    # SMP9
    def self.smp9=(value : UInt8) : UInt8
      self.set(smp9: value)
      value
    end

    # SMP8
    def smp8 : UInt8
      UInt8.new!((@value >> 24) & 0x7_u32)
    end

    # SMP8
    def self.smp8 : UInt8
      value.smp8
    end

    # SMP8
    def self.smp8=(value : UInt8) : UInt8
      self.set(smp8: value)
      value
    end

    # SMP7
    def smp7 : UInt8
      UInt8.new!((@value >> 21) & 0x7_u32)
    end

    # SMP7
    def self.smp7 : UInt8
      value.smp7
    end

    # SMP7
    def self.smp7=(value : UInt8) : UInt8
      self.set(smp7: value)
      value
    end

    # SMP6
    def smp6 : UInt8
      UInt8.new!((@value >> 18) & 0x7_u32)
    end

    # SMP6
    def self.smp6 : UInt8
      value.smp6
    end

    # SMP6
    def self.smp6=(value : UInt8) : UInt8
      self.set(smp6: value)
      value
    end

    # SMP5
    def smp5 : UInt8
      UInt8.new!((@value >> 15) & 0x7_u32)
    end

    # SMP5
    def self.smp5 : UInt8
      value.smp5
    end

    # SMP5
    def self.smp5=(value : UInt8) : UInt8
      self.set(smp5: value)
      value
    end

    # SMP4
    def smp4 : UInt8
      UInt8.new!((@value >> 12) & 0x7_u32)
    end

    # SMP4
    def self.smp4 : UInt8
      value.smp4
    end

    # SMP4
    def self.smp4=(value : UInt8) : UInt8
      self.set(smp4: value)
      value
    end

    # SMP3
    def smp3 : UInt8
      UInt8.new!((@value >> 9) & 0x7_u32)
    end

    # SMP3
    def self.smp3 : UInt8
      value.smp3
    end

    # SMP3
    def self.smp3=(value : UInt8) : UInt8
      self.set(smp3: value)
      value
    end

    # SMP2
    def smp2 : UInt8
      UInt8.new!((@value >> 6) & 0x7_u32)
    end

    # SMP2
    def self.smp2 : UInt8
      value.smp2
    end

    # SMP2
    def self.smp2=(value : UInt8) : UInt8
      self.set(smp2: value)
      value
    end

    enum SMP1 : UInt8
      # 1.5 ADC clock cycles
      CYCLES1_5 = 0x0_u64

      # 2.5 ADC clock cycles
      CYCLES2_5 = 0x1_u64

      # 4.5 ADC clock cycles
      CYCLES4_5 = 0x2_u64

      # 7.5 ADC clock cycles
      CYCLES7_5 = 0x3_u64

      # 19.5 ADC clock cycles
      CYCLES19_5 = 0x4_u64

      # 61.5 ADC clock cycles
      CYCLES61_5 = 0x5_u64

      # 181.5 ADC clock cycles
      CYCLES181_5 = 0x6_u64

      # 601.5 ADC clock cycles
      CYCLES601_5 = 0x7_u64

      def self.reset_value : SMP1
        SMPR1.reset_value.smp1
      end
    end

    # SMP1
    def smp1 : SMP1
      SMP1.new!((@value >> 3) & 0x7_u32)
    end

    # SMP1
    def self.smp1 : SMP1
      value.smp1
    end

    # SMP1
    def self.smp1=(value : SMP1) : SMP1
      self.set(smp1: value)
      value
    end

    def copy_with(
      *,

      smp9 : UInt8? = nil,

      smp8 : UInt8? = nil,

      smp7 : UInt8? = nil,

      smp6 : UInt8? = nil,

      smp5 : UInt8? = nil,

      smp4 : UInt8? = nil,

      smp3 : UInt8? = nil,

      smp2 : UInt8? = nil,

      smp1 : SMP1? = nil
    ) : self
      value = @value

      unless smp9.nil?
        value = (value & 0xc7ffffff_u32) |
                UInt32.new!(smp9.to_int).&(0x7_u32) << 27
      end

      unless smp8.nil?
        value = (value & 0xf8ffffff_u32) |
                UInt32.new!(smp8.to_int).&(0x7_u32) << 24
      end

      unless smp7.nil?
        value = (value & 0xff1fffff_u32) |
                UInt32.new!(smp7.to_int).&(0x7_u32) << 21
      end

      unless smp6.nil?
        value = (value & 0xffe3ffff_u32) |
                UInt32.new!(smp6.to_int).&(0x7_u32) << 18
      end

      unless smp5.nil?
        value = (value & 0xfffc7fff_u32) |
                UInt32.new!(smp5.to_int).&(0x7_u32) << 15
      end

      unless smp4.nil?
        value = (value & 0xffff8fff_u32) |
                UInt32.new!(smp4.to_int).&(0x7_u32) << 12
      end

      unless smp3.nil?
        value = (value & 0xfffff1ff_u32) |
                UInt32.new!(smp3.to_int).&(0x7_u32) << 9
      end

      unless smp2.nil?
        value = (value & 0xfffffe3f_u32) |
                UInt32.new!(smp2.to_int).&(0x7_u32) << 6
      end

      unless smp1.nil?
        value = (value & 0xffffffc7_u32) |
                UInt32.new!(smp1.to_int).&(0x7_u32) << 3
      end

      self.class.new(value)
    end

    def self.set(
      *,
      smp9 : UInt8? = nil,
      smp8 : UInt8? = nil,
      smp7 : UInt8? = nil,
      smp6 : UInt8? = nil,
      smp5 : UInt8? = nil,
      smp4 : UInt8? = nil,
      smp3 : UInt8? = nil,
      smp2 : UInt8? = nil,
      smp1 : SMP1? = nil
    ) : Nil
      self.value = self.value.copy_with(
        smp9: smp9,
        smp8: smp8,
        smp7: smp7,
        smp6: smp6,
        smp5: smp5,
        smp4: smp4,
        smp3: smp3,
        smp2: smp2,
        smp1: smp1,
      )
    end
  end # struct

  # sample time register 2
  struct SMPR2
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

    # SMP18
    def smp18 : UInt8
      UInt8.new!((@value >> 24) & 0x7_u32)
    end

    # SMP18
    def self.smp18 : UInt8
      value.smp18
    end

    # SMP18
    def self.smp18=(value : UInt8) : UInt8
      self.set(smp18: value)
      value
    end

    # SMP17
    def smp17 : UInt8
      UInt8.new!((@value >> 21) & 0x7_u32)
    end

    # SMP17
    def self.smp17 : UInt8
      value.smp17
    end

    # SMP17
    def self.smp17=(value : UInt8) : UInt8
      self.set(smp17: value)
      value
    end

    # SMP16
    def smp16 : UInt8
      UInt8.new!((@value >> 18) & 0x7_u32)
    end

    # SMP16
    def self.smp16 : UInt8
      value.smp16
    end

    # SMP16
    def self.smp16=(value : UInt8) : UInt8
      self.set(smp16: value)
      value
    end

    # SMP15
    def smp15 : UInt8
      UInt8.new!((@value >> 15) & 0x7_u32)
    end

    # SMP15
    def self.smp15 : UInt8
      value.smp15
    end

    # SMP15
    def self.smp15=(value : UInt8) : UInt8
      self.set(smp15: value)
      value
    end

    # SMP14
    def smp14 : UInt8
      UInt8.new!((@value >> 12) & 0x7_u32)
    end

    # SMP14
    def self.smp14 : UInt8
      value.smp14
    end

    # SMP14
    def self.smp14=(value : UInt8) : UInt8
      self.set(smp14: value)
      value
    end

    # SMP13
    def smp13 : UInt8
      UInt8.new!((@value >> 9) & 0x7_u32)
    end

    # SMP13
    def self.smp13 : UInt8
      value.smp13
    end

    # SMP13
    def self.smp13=(value : UInt8) : UInt8
      self.set(smp13: value)
      value
    end

    # SMP12
    def smp12 : UInt8
      UInt8.new!((@value >> 6) & 0x7_u32)
    end

    # SMP12
    def self.smp12 : UInt8
      value.smp12
    end

    # SMP12
    def self.smp12=(value : UInt8) : UInt8
      self.set(smp12: value)
      value
    end

    # SMP11
    def smp11 : UInt8
      UInt8.new!((@value >> 3) & 0x7_u32)
    end

    # SMP11
    def self.smp11 : UInt8
      value.smp11
    end

    # SMP11
    def self.smp11=(value : UInt8) : UInt8
      self.set(smp11: value)
      value
    end

    enum SMP10 : UInt8
      # 1.5 ADC clock cycles
      CYCLES1_5 = 0x0_u64

      # 2.5 ADC clock cycles
      CYCLES2_5 = 0x1_u64

      # 4.5 ADC clock cycles
      CYCLES4_5 = 0x2_u64

      # 7.5 ADC clock cycles
      CYCLES7_5 = 0x3_u64

      # 19.5 ADC clock cycles
      CYCLES19_5 = 0x4_u64

      # 61.5 ADC clock cycles
      CYCLES61_5 = 0x5_u64

      # 181.5 ADC clock cycles
      CYCLES181_5 = 0x6_u64

      # 601.5 ADC clock cycles
      CYCLES601_5 = 0x7_u64

      def self.reset_value : SMP10
        SMPR2.reset_value.smp10
      end
    end

    # SMP10
    def smp10 : SMP10
      SMP10.new!((@value >> 0) & 0x7_u32)
    end

    # SMP10
    def self.smp10 : SMP10
      value.smp10
    end

    # SMP10
    def self.smp10=(value : SMP10) : SMP10
      self.set(smp10: value)
      value
    end

    def copy_with(
      *,

      smp18 : UInt8? = nil,

      smp17 : UInt8? = nil,

      smp16 : UInt8? = nil,

      smp15 : UInt8? = nil,

      smp14 : UInt8? = nil,

      smp13 : UInt8? = nil,

      smp12 : UInt8? = nil,

      smp11 : UInt8? = nil,

      smp10 : SMP10? = nil
    ) : self
      value = @value

      unless smp18.nil?
        value = (value & 0xf8ffffff_u32) |
                UInt32.new!(smp18.to_int).&(0x7_u32) << 24
      end

      unless smp17.nil?
        value = (value & 0xff1fffff_u32) |
                UInt32.new!(smp17.to_int).&(0x7_u32) << 21
      end

      unless smp16.nil?
        value = (value & 0xffe3ffff_u32) |
                UInt32.new!(smp16.to_int).&(0x7_u32) << 18
      end

      unless smp15.nil?
        value = (value & 0xfffc7fff_u32) |
                UInt32.new!(smp15.to_int).&(0x7_u32) << 15
      end

      unless smp14.nil?
        value = (value & 0xffff8fff_u32) |
                UInt32.new!(smp14.to_int).&(0x7_u32) << 12
      end

      unless smp13.nil?
        value = (value & 0xfffff1ff_u32) |
                UInt32.new!(smp13.to_int).&(0x7_u32) << 9
      end

      unless smp12.nil?
        value = (value & 0xfffffe3f_u32) |
                UInt32.new!(smp12.to_int).&(0x7_u32) << 6
      end

      unless smp11.nil?
        value = (value & 0xffffffc7_u32) |
                UInt32.new!(smp11.to_int).&(0x7_u32) << 3
      end

      unless smp10.nil?
        value = (value & 0xfffffff8_u32) |
                UInt32.new!(smp10.to_int).&(0x7_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      smp18 : UInt8? = nil,
      smp17 : UInt8? = nil,
      smp16 : UInt8? = nil,
      smp15 : UInt8? = nil,
      smp14 : UInt8? = nil,
      smp13 : UInt8? = nil,
      smp12 : UInt8? = nil,
      smp11 : UInt8? = nil,
      smp10 : SMP10? = nil
    ) : Nil
      self.value = self.value.copy_with(
        smp18: smp18,
        smp17: smp17,
        smp16: smp16,
        smp15: smp15,
        smp14: smp14,
        smp13: smp13,
        smp12: smp12,
        smp11: smp11,
        smp10: smp10,
      )
    end
  end # struct

  # watchdog threshold register 1
  struct TR1
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
      new(0xfff0000_u64)
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

    # HT1
    def ht1 : UInt16
      UInt16.new!((@value >> 16) & 0xfff_u32)
    end

    # HT1
    def self.ht1 : UInt16
      value.ht1
    end

    # HT1
    def self.ht1=(value : UInt16) : UInt16
      self.set(ht1: value)
      value
    end

    # LT1
    def lt1 : UInt16
      UInt16.new!((@value >> 0) & 0xfff_u32)
    end

    # LT1
    def self.lt1 : UInt16
      value.lt1
    end

    # LT1
    def self.lt1=(value : UInt16) : UInt16
      self.set(lt1: value)
      value
    end

    def copy_with(
      *,

      ht1 : UInt16? = nil,

      lt1 : UInt16? = nil
    ) : self
      value = @value

      unless ht1.nil?
        value = (value & 0xf000ffff_u32) |
                UInt32.new!(ht1.to_int).&(0xfff_u32) << 16
      end

      unless lt1.nil?
        value = (value & 0xfffff000_u32) |
                UInt32.new!(lt1.to_int).&(0xfff_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      ht1 : UInt16? = nil,
      lt1 : UInt16? = nil
    ) : Nil
      self.value = self.value.copy_with(
        ht1: ht1,
        lt1: lt1,
      )
    end
  end # struct

  # watchdog threshold register
  struct TR2
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
      new(0xfff0000_u64)
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

    # HT2
    def ht2 : UInt8
      UInt8.new!((@value >> 16) & 0xff_u32)
    end

    # HT2
    def self.ht2 : UInt8
      value.ht2
    end

    # HT2
    def self.ht2=(value : UInt8) : UInt8
      self.set(ht2: value)
      value
    end

    # LT2
    def lt2 : UInt8
      UInt8.new!((@value >> 0) & 0xff_u32)
    end

    # LT2
    def self.lt2 : UInt8
      value.lt2
    end

    # LT2
    def self.lt2=(value : UInt8) : UInt8
      self.set(lt2: value)
      value
    end

    def copy_with(
      *,

      ht2 : UInt8? = nil,

      lt2 : UInt8? = nil
    ) : self
      value = @value

      unless ht2.nil?
        value = (value & 0xff00ffff_u32) |
                UInt32.new!(ht2.to_int).&(0xff_u32) << 16
      end

      unless lt2.nil?
        value = (value & 0xffffff00_u32) |
                UInt32.new!(lt2.to_int).&(0xff_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      ht2 : UInt8? = nil,
      lt2 : UInt8? = nil
    ) : Nil
      self.value = self.value.copy_with(
        ht2: ht2,
        lt2: lt2,
      )
    end
  end # struct

  # watchdog threshold register 3
  struct TR3
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
      new(0xfff0000_u64)
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

    # HT3
    def ht3 : UInt8
      UInt8.new!((@value >> 16) & 0xff_u32)
    end

    # HT3
    def self.ht3 : UInt8
      value.ht3
    end

    # HT3
    def self.ht3=(value : UInt8) : UInt8
      self.set(ht3: value)
      value
    end

    # LT3
    def lt3 : UInt8
      UInt8.new!((@value >> 0) & 0xff_u32)
    end

    # LT3
    def self.lt3 : UInt8
      value.lt3
    end

    # LT3
    def self.lt3=(value : UInt8) : UInt8
      self.set(lt3: value)
      value
    end

    def copy_with(
      *,

      ht3 : UInt8? = nil,

      lt3 : UInt8? = nil
    ) : self
      value = @value

      unless ht3.nil?
        value = (value & 0xff00ffff_u32) |
                UInt32.new!(ht3.to_int).&(0xff_u32) << 16
      end

      unless lt3.nil?
        value = (value & 0xffffff00_u32) |
                UInt32.new!(lt3.to_int).&(0xff_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      ht3 : UInt8? = nil,
      lt3 : UInt8? = nil
    ) : Nil
      self.value = self.value.copy_with(
        ht3: ht3,
        lt3: lt3,
      )
    end
  end # struct

  # regular sequence register 1
  struct SQR1
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

    # SQ4
    def sq4 : UInt8
      UInt8.new!((@value >> 24) & 0x1f_u32)
    end

    # SQ4
    def self.sq4 : UInt8
      value.sq4
    end

    # SQ4
    def self.sq4=(value : UInt8) : UInt8
      self.set(sq4: value)
      value
    end

    # SQ3
    def sq3 : UInt8
      UInt8.new!((@value >> 18) & 0x1f_u32)
    end

    # SQ3
    def self.sq3 : UInt8
      value.sq3
    end

    # SQ3
    def self.sq3=(value : UInt8) : UInt8
      self.set(sq3: value)
      value
    end

    # SQ2
    def sq2 : UInt8
      UInt8.new!((@value >> 12) & 0x1f_u32)
    end

    # SQ2
    def self.sq2 : UInt8
      value.sq2
    end

    # SQ2
    def self.sq2=(value : UInt8) : UInt8
      self.set(sq2: value)
      value
    end

    # SQ1
    def sq1 : UInt8
      UInt8.new!((@value >> 6) & 0x1f_u32)
    end

    # SQ1
    def self.sq1 : UInt8
      value.sq1
    end

    # SQ1
    def self.sq1=(value : UInt8) : UInt8
      self.set(sq1: value)
      value
    end

    # L3
    def l : UInt8
      UInt8.new!((@value >> 0) & 0xf_u32)
    end

    # L3
    def self.l : UInt8
      value.l
    end

    # L3
    def self.l=(value : UInt8) : UInt8
      self.set(l: value)
      value
    end

    def copy_with(
      *,

      sq4 : UInt8? = nil,

      sq3 : UInt8? = nil,

      sq2 : UInt8? = nil,

      sq1 : UInt8? = nil,

      l : UInt8? = nil
    ) : self
      value = @value

      unless sq4.nil?
        value = (value & 0xe0ffffff_u32) |
                UInt32.new!(sq4.to_int).&(0x1f_u32) << 24
      end

      unless sq3.nil?
        value = (value & 0xff83ffff_u32) |
                UInt32.new!(sq3.to_int).&(0x1f_u32) << 18
      end

      unless sq2.nil?
        value = (value & 0xfffe0fff_u32) |
                UInt32.new!(sq2.to_int).&(0x1f_u32) << 12
      end

      unless sq1.nil?
        value = (value & 0xfffff83f_u32) |
                UInt32.new!(sq1.to_int).&(0x1f_u32) << 6
      end

      unless l.nil?
        value = (value & 0xfffffff0_u32) |
                UInt32.new!(l.to_int).&(0xf_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      sq4 : UInt8? = nil,
      sq3 : UInt8? = nil,
      sq2 : UInt8? = nil,
      sq1 : UInt8? = nil,
      l : UInt8? = nil
    ) : Nil
      self.value = self.value.copy_with(
        sq4: sq4,
        sq3: sq3,
        sq2: sq2,
        sq1: sq1,
        l: l,
      )
    end
  end # struct

  # regular sequence register 2
  struct SQR2
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

    # SQ9
    def sq9 : UInt8
      UInt8.new!((@value >> 24) & 0x1f_u32)
    end

    # SQ9
    def self.sq9 : UInt8
      value.sq9
    end

    # SQ9
    def self.sq9=(value : UInt8) : UInt8
      self.set(sq9: value)
      value
    end

    # SQ8
    def sq8 : UInt8
      UInt8.new!((@value >> 18) & 0x1f_u32)
    end

    # SQ8
    def self.sq8 : UInt8
      value.sq8
    end

    # SQ8
    def self.sq8=(value : UInt8) : UInt8
      self.set(sq8: value)
      value
    end

    # SQ7
    def sq7 : UInt8
      UInt8.new!((@value >> 12) & 0x1f_u32)
    end

    # SQ7
    def self.sq7 : UInt8
      value.sq7
    end

    # SQ7
    def self.sq7=(value : UInt8) : UInt8
      self.set(sq7: value)
      value
    end

    # SQ6
    def sq6 : UInt8
      UInt8.new!((@value >> 6) & 0x1f_u32)
    end

    # SQ6
    def self.sq6 : UInt8
      value.sq6
    end

    # SQ6
    def self.sq6=(value : UInt8) : UInt8
      self.set(sq6: value)
      value
    end

    # SQ5
    def sq5 : UInt8
      UInt8.new!((@value >> 0) & 0x1f_u32)
    end

    # SQ5
    def self.sq5 : UInt8
      value.sq5
    end

    # SQ5
    def self.sq5=(value : UInt8) : UInt8
      self.set(sq5: value)
      value
    end

    def copy_with(
      *,

      sq9 : UInt8? = nil,

      sq8 : UInt8? = nil,

      sq7 : UInt8? = nil,

      sq6 : UInt8? = nil,

      sq5 : UInt8? = nil
    ) : self
      value = @value

      unless sq9.nil?
        value = (value & 0xe0ffffff_u32) |
                UInt32.new!(sq9.to_int).&(0x1f_u32) << 24
      end

      unless sq8.nil?
        value = (value & 0xff83ffff_u32) |
                UInt32.new!(sq8.to_int).&(0x1f_u32) << 18
      end

      unless sq7.nil?
        value = (value & 0xfffe0fff_u32) |
                UInt32.new!(sq7.to_int).&(0x1f_u32) << 12
      end

      unless sq6.nil?
        value = (value & 0xfffff83f_u32) |
                UInt32.new!(sq6.to_int).&(0x1f_u32) << 6
      end

      unless sq5.nil?
        value = (value & 0xffffffe0_u32) |
                UInt32.new!(sq5.to_int).&(0x1f_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      sq9 : UInt8? = nil,
      sq8 : UInt8? = nil,
      sq7 : UInt8? = nil,
      sq6 : UInt8? = nil,
      sq5 : UInt8? = nil
    ) : Nil
      self.value = self.value.copy_with(
        sq9: sq9,
        sq8: sq8,
        sq7: sq7,
        sq6: sq6,
        sq5: sq5,
      )
    end
  end # struct

  # regular sequence register 3
  struct SQR3
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

    # SQ14
    def sq14 : UInt8
      UInt8.new!((@value >> 24) & 0x1f_u32)
    end

    # SQ14
    def self.sq14 : UInt8
      value.sq14
    end

    # SQ14
    def self.sq14=(value : UInt8) : UInt8
      self.set(sq14: value)
      value
    end

    # SQ13
    def sq13 : UInt8
      UInt8.new!((@value >> 18) & 0x1f_u32)
    end

    # SQ13
    def self.sq13 : UInt8
      value.sq13
    end

    # SQ13
    def self.sq13=(value : UInt8) : UInt8
      self.set(sq13: value)
      value
    end

    # SQ12
    def sq12 : UInt8
      UInt8.new!((@value >> 12) & 0x1f_u32)
    end

    # SQ12
    def self.sq12 : UInt8
      value.sq12
    end

    # SQ12
    def self.sq12=(value : UInt8) : UInt8
      self.set(sq12: value)
      value
    end

    # SQ11
    def sq11 : UInt8
      UInt8.new!((@value >> 6) & 0x1f_u32)
    end

    # SQ11
    def self.sq11 : UInt8
      value.sq11
    end

    # SQ11
    def self.sq11=(value : UInt8) : UInt8
      self.set(sq11: value)
      value
    end

    # SQ10
    def sq10 : UInt8
      UInt8.new!((@value >> 0) & 0x1f_u32)
    end

    # SQ10
    def self.sq10 : UInt8
      value.sq10
    end

    # SQ10
    def self.sq10=(value : UInt8) : UInt8
      self.set(sq10: value)
      value
    end

    def copy_with(
      *,

      sq14 : UInt8? = nil,

      sq13 : UInt8? = nil,

      sq12 : UInt8? = nil,

      sq11 : UInt8? = nil,

      sq10 : UInt8? = nil
    ) : self
      value = @value

      unless sq14.nil?
        value = (value & 0xe0ffffff_u32) |
                UInt32.new!(sq14.to_int).&(0x1f_u32) << 24
      end

      unless sq13.nil?
        value = (value & 0xff83ffff_u32) |
                UInt32.new!(sq13.to_int).&(0x1f_u32) << 18
      end

      unless sq12.nil?
        value = (value & 0xfffe0fff_u32) |
                UInt32.new!(sq12.to_int).&(0x1f_u32) << 12
      end

      unless sq11.nil?
        value = (value & 0xfffff83f_u32) |
                UInt32.new!(sq11.to_int).&(0x1f_u32) << 6
      end

      unless sq10.nil?
        value = (value & 0xffffffe0_u32) |
                UInt32.new!(sq10.to_int).&(0x1f_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      sq14 : UInt8? = nil,
      sq13 : UInt8? = nil,
      sq12 : UInt8? = nil,
      sq11 : UInt8? = nil,
      sq10 : UInt8? = nil
    ) : Nil
      self.value = self.value.copy_with(
        sq14: sq14,
        sq13: sq13,
        sq12: sq12,
        sq11: sq11,
        sq10: sq10,
      )
    end
  end # struct

  # regular sequence register 4
  struct SQR4
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

    # SQ16
    def sq16 : UInt8
      UInt8.new!((@value >> 6) & 0x1f_u32)
    end

    # SQ16
    def self.sq16 : UInt8
      value.sq16
    end

    # SQ16
    def self.sq16=(value : UInt8) : UInt8
      self.set(sq16: value)
      value
    end

    # SQ15
    def sq15 : UInt8
      UInt8.new!((@value >> 0) & 0x1f_u32)
    end

    # SQ15
    def self.sq15 : UInt8
      value.sq15
    end

    # SQ15
    def self.sq15=(value : UInt8) : UInt8
      self.set(sq15: value)
      value
    end

    def copy_with(
      *,

      sq16 : UInt8? = nil,

      sq15 : UInt8? = nil
    ) : self
      value = @value

      unless sq16.nil?
        value = (value & 0xfffff83f_u32) |
                UInt32.new!(sq16.to_int).&(0x1f_u32) << 6
      end

      unless sq15.nil?
        value = (value & 0xffffffe0_u32) |
                UInt32.new!(sq15.to_int).&(0x1f_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      sq16 : UInt8? = nil,
      sq15 : UInt8? = nil
    ) : Nil
      self.value = self.value.copy_with(
        sq16: sq16,
        sq15: sq15,
      )
    end
  end # struct

  # regular Data Register
  struct DR
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

    # regularDATA
    def rdata : UInt16
      UInt16.new!((@value >> 0) & 0xffff_u32)
    end

    # regularDATA
    def self.rdata : UInt16
      value.rdata
    end
  end # struct

  # injected sequence register
  struct JSQR
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

    # JSQ4
    def jsq4 : UInt8
      UInt8.new!((@value >> 26) & 0x1f_u32)
    end

    # JSQ4
    def self.jsq4 : UInt8
      value.jsq4
    end

    # JSQ4
    def self.jsq4=(value : UInt8) : UInt8
      self.set(jsq4: value)
      value
    end

    # JSQ3
    def jsq3 : UInt8
      UInt8.new!((@value >> 20) & 0x1f_u32)
    end

    # JSQ3
    def self.jsq3 : UInt8
      value.jsq3
    end

    # JSQ3
    def self.jsq3=(value : UInt8) : UInt8
      self.set(jsq3: value)
      value
    end

    # JSQ2
    def jsq2 : UInt8
      UInt8.new!((@value >> 14) & 0x1f_u32)
    end

    # JSQ2
    def self.jsq2 : UInt8
      value.jsq2
    end

    # JSQ2
    def self.jsq2=(value : UInt8) : UInt8
      self.set(jsq2: value)
      value
    end

    # JSQ1
    def jsq1 : UInt8
      UInt8.new!((@value >> 8) & 0x1f_u32)
    end

    # JSQ1
    def self.jsq1 : UInt8
      value.jsq1
    end

    # JSQ1
    def self.jsq1=(value : UInt8) : UInt8
      self.set(jsq1: value)
      value
    end

    enum JEXTEN : UInt8
      # Trigger detection disabled
      DISABLED = 0x0_u64

      # Trigger detection on the rising edge
      RISINGEDGE = 0x1_u64

      # Trigger detection on the falling edge
      FALLINGEDGE = 0x2_u64

      # Trigger detection on both the rising and falling edges
      BOTHEDGES = 0x3_u64

      def self.reset_value : JEXTEN
        JSQR.reset_value.jexten
      end
    end

    # JEXTEN
    def jexten : JEXTEN
      JEXTEN.new!((@value >> 6) & 0x3_u32)
    end

    # JEXTEN
    def self.jexten : JEXTEN
      value.jexten
    end

    # JEXTEN
    def self.jexten=(value : JEXTEN) : JEXTEN
      self.set(jexten: value)
      value
    end

    enum JEXTSEL : UInt8
      # HRTIM_ADCTRG2 event
      HRTIM_ADCTRG2 = 0x9_u64

      # HRTIM_ADCTRG4 event
      HRTIM_ADCTRG4 = 0xa_u64

      # Timer 1 TRGO event
      TIM1_TRGO = 0x0_u64

      # Timer 1 CC4 event
      TIM1_CC4 = 0x1_u64

      # Timer 2 TRGO event
      TIM2_TRGO = 0x2_u64

      # Timer 2 CC1 event
      TIM2_CC1 = 0x3_u64

      # Timer 3 CC4 event
      TIM3_CC4 = 0x4_u64

      # EXTI line 15
      EXTI15 = 0x6_u64

      # Timer 1 TRGO2 event
      TIM1_TRGO2 = 0x8_u64

      # Timer 3 CC3 event
      TIM3_CC3 = 0xb_u64

      # Timer 3 TRGO event
      TIM3_TRGO = 0xc_u64

      # Timer 3 CC1 event
      TIM3_CC1 = 0xd_u64

      # Timer 6 TRGO event
      TIM6_TRGO = 0xe_u64

      # Timer 15 TRGO event
      TIM15_TRGO = 0xf_u64

      def self.reset_value : JEXTSEL
        JSQR.reset_value.jextsel
      end
    end

    # JEXTSEL
    def jextsel : JEXTSEL
      JEXTSEL.new!((@value >> 2) & 0xf_u32)
    end

    # JEXTSEL
    def self.jextsel : JEXTSEL
      value.jextsel
    end

    # JEXTSEL
    def self.jextsel=(value : JEXTSEL) : JEXTSEL
      self.set(jextsel: value)
      value
    end

    # JL
    def jl : UInt8
      UInt8.new!((@value >> 0) & 0x3_u32)
    end

    # JL
    def self.jl : UInt8
      value.jl
    end

    # JL
    def self.jl=(value : UInt8) : UInt8
      self.set(jl: value)
      value
    end

    def copy_with(
      *,

      jsq4 : UInt8? = nil,

      jsq3 : UInt8? = nil,

      jsq2 : UInt8? = nil,

      jsq1 : UInt8? = nil,

      jexten : JEXTEN? = nil,

      jextsel : JEXTSEL? = nil,

      jl : UInt8? = nil
    ) : self
      value = @value

      unless jsq4.nil?
        value = (value & 0x83ffffff_u32) |
                UInt32.new!(jsq4.to_int).&(0x1f_u32) << 26
      end

      unless jsq3.nil?
        value = (value & 0xfe0fffff_u32) |
                UInt32.new!(jsq3.to_int).&(0x1f_u32) << 20
      end

      unless jsq2.nil?
        value = (value & 0xfff83fff_u32) |
                UInt32.new!(jsq2.to_int).&(0x1f_u32) << 14
      end

      unless jsq1.nil?
        value = (value & 0xffffe0ff_u32) |
                UInt32.new!(jsq1.to_int).&(0x1f_u32) << 8
      end

      unless jexten.nil?
        value = (value & 0xffffff3f_u32) |
                UInt32.new!(jexten.to_int).&(0x3_u32) << 6
      end

      unless jextsel.nil?
        value = (value & 0xffffffc3_u32) |
                UInt32.new!(jextsel.to_int).&(0xf_u32) << 2
      end

      unless jl.nil?
        value = (value & 0xfffffffc_u32) |
                UInt32.new!(jl.to_int).&(0x3_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      jsq4 : UInt8? = nil,
      jsq3 : UInt8? = nil,
      jsq2 : UInt8? = nil,
      jsq1 : UInt8? = nil,
      jexten : JEXTEN? = nil,
      jextsel : JEXTSEL? = nil,
      jl : UInt8? = nil
    ) : Nil
      self.value = self.value.copy_with(
        jsq4: jsq4,
        jsq3: jsq3,
        jsq2: jsq2,
        jsq1: jsq1,
        jexten: jexten,
        jextsel: jextsel,
        jl: jl,
      )
    end
  end # struct

  # offset register 1
  struct OFR1
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

    enum OFFSET1_EN : UInt8
      # Offset disabled
      DISABLED = 0x0_u64

      # Offset enabled
      ENABLED = 0x1_u64

      def self.reset_value : OFFSET1_EN
        OFR1.reset_value.offset1_en
      end
    end

    # OFFSET1_EN
    def offset1_en : OFFSET1_EN
      OFFSET1_EN.new!((@value >> 31) & 0x1_u32)
    end

    # OFFSET1_EN
    def self.offset1_en : OFFSET1_EN
      value.offset1_en
    end

    # OFFSET1_EN
    def self.offset1_en=(value : OFFSET1_EN) : OFFSET1_EN
      self.set(offset1_en: value)
      value
    end

    # OFFSET1_CH
    def offset1_ch : UInt8
      UInt8.new!((@value >> 26) & 0x1f_u32)
    end

    # OFFSET1_CH
    def self.offset1_ch : UInt8
      value.offset1_ch
    end

    # OFFSET1_CH
    def self.offset1_ch=(value : UInt8) : UInt8
      self.set(offset1_ch: value)
      value
    end

    # OFFSET1
    def offset1 : UInt16
      UInt16.new!((@value >> 0) & 0xfff_u32)
    end

    # OFFSET1
    def self.offset1 : UInt16
      value.offset1
    end

    # OFFSET1
    def self.offset1=(value : UInt16) : UInt16
      self.set(offset1: value)
      value
    end

    def copy_with(
      *,

      offset1_en : OFFSET1_EN? = nil,

      offset1_ch : UInt8? = nil,

      offset1 : UInt16? = nil
    ) : self
      value = @value

      unless offset1_en.nil?
        value = (value & 0x7fffffff_u32) |
                UInt32.new!(offset1_en.to_int).&(0x1_u32) << 31
      end

      unless offset1_ch.nil?
        value = (value & 0x83ffffff_u32) |
                UInt32.new!(offset1_ch.to_int).&(0x1f_u32) << 26
      end

      unless offset1.nil?
        value = (value & 0xfffff000_u32) |
                UInt32.new!(offset1.to_int).&(0xfff_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      offset1_en : OFFSET1_EN? = nil,
      offset1_ch : UInt8? = nil,
      offset1 : UInt16? = nil
    ) : Nil
      self.value = self.value.copy_with(
        offset1_en: offset1_en,
        offset1_ch: offset1_ch,
        offset1: offset1,
      )
    end
  end # struct

  # offset register 2
  struct OFR2
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

    enum OFFSET2_EN : UInt8
      # Offset disabled
      DISABLED = 0x0_u64

      # Offset enabled
      ENABLED = 0x1_u64

      def self.reset_value : OFFSET2_EN
        OFR2.reset_value.offset2_en
      end
    end

    # OFFSET2_EN
    def offset2_en : OFFSET2_EN
      OFFSET2_EN.new!((@value >> 31) & 0x1_u32)
    end

    # OFFSET2_EN
    def self.offset2_en : OFFSET2_EN
      value.offset2_en
    end

    # OFFSET2_EN
    def self.offset2_en=(value : OFFSET2_EN) : OFFSET2_EN
      self.set(offset2_en: value)
      value
    end

    # OFFSET2_CH
    def offset2_ch : UInt8
      UInt8.new!((@value >> 26) & 0x1f_u32)
    end

    # OFFSET2_CH
    def self.offset2_ch : UInt8
      value.offset2_ch
    end

    # OFFSET2_CH
    def self.offset2_ch=(value : UInt8) : UInt8
      self.set(offset2_ch: value)
      value
    end

    # OFFSET2
    def offset2 : UInt16
      UInt16.new!((@value >> 0) & 0xfff_u32)
    end

    # OFFSET2
    def self.offset2 : UInt16
      value.offset2
    end

    # OFFSET2
    def self.offset2=(value : UInt16) : UInt16
      self.set(offset2: value)
      value
    end

    def copy_with(
      *,

      offset2_en : OFFSET2_EN? = nil,

      offset2_ch : UInt8? = nil,

      offset2 : UInt16? = nil
    ) : self
      value = @value

      unless offset2_en.nil?
        value = (value & 0x7fffffff_u32) |
                UInt32.new!(offset2_en.to_int).&(0x1_u32) << 31
      end

      unless offset2_ch.nil?
        value = (value & 0x83ffffff_u32) |
                UInt32.new!(offset2_ch.to_int).&(0x1f_u32) << 26
      end

      unless offset2.nil?
        value = (value & 0xfffff000_u32) |
                UInt32.new!(offset2.to_int).&(0xfff_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      offset2_en : OFFSET2_EN? = nil,
      offset2_ch : UInt8? = nil,
      offset2 : UInt16? = nil
    ) : Nil
      self.value = self.value.copy_with(
        offset2_en: offset2_en,
        offset2_ch: offset2_ch,
        offset2: offset2,
      )
    end
  end # struct

  # offset register 3
  struct OFR3
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

    enum OFFSET3_EN : UInt8
      # Offset disabled
      DISABLED = 0x0_u64

      # Offset enabled
      ENABLED = 0x1_u64

      def self.reset_value : OFFSET3_EN
        OFR3.reset_value.offset3_en
      end
    end

    # OFFSET3_EN
    def offset3_en : OFFSET3_EN
      OFFSET3_EN.new!((@value >> 31) & 0x1_u32)
    end

    # OFFSET3_EN
    def self.offset3_en : OFFSET3_EN
      value.offset3_en
    end

    # OFFSET3_EN
    def self.offset3_en=(value : OFFSET3_EN) : OFFSET3_EN
      self.set(offset3_en: value)
      value
    end

    # OFFSET3_CH
    def offset3_ch : UInt8
      UInt8.new!((@value >> 26) & 0x1f_u32)
    end

    # OFFSET3_CH
    def self.offset3_ch : UInt8
      value.offset3_ch
    end

    # OFFSET3_CH
    def self.offset3_ch=(value : UInt8) : UInt8
      self.set(offset3_ch: value)
      value
    end

    # OFFSET3
    def offset3 : UInt16
      UInt16.new!((@value >> 0) & 0xfff_u32)
    end

    # OFFSET3
    def self.offset3 : UInt16
      value.offset3
    end

    # OFFSET3
    def self.offset3=(value : UInt16) : UInt16
      self.set(offset3: value)
      value
    end

    def copy_with(
      *,

      offset3_en : OFFSET3_EN? = nil,

      offset3_ch : UInt8? = nil,

      offset3 : UInt16? = nil
    ) : self
      value = @value

      unless offset3_en.nil?
        value = (value & 0x7fffffff_u32) |
                UInt32.new!(offset3_en.to_int).&(0x1_u32) << 31
      end

      unless offset3_ch.nil?
        value = (value & 0x83ffffff_u32) |
                UInt32.new!(offset3_ch.to_int).&(0x1f_u32) << 26
      end

      unless offset3.nil?
        value = (value & 0xfffff000_u32) |
                UInt32.new!(offset3.to_int).&(0xfff_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      offset3_en : OFFSET3_EN? = nil,
      offset3_ch : UInt8? = nil,
      offset3 : UInt16? = nil
    ) : Nil
      self.value = self.value.copy_with(
        offset3_en: offset3_en,
        offset3_ch: offset3_ch,
        offset3: offset3,
      )
    end
  end # struct

  # offset register 4
  struct OFR4
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

    enum OFFSET4_EN : UInt8
      # Offset disabled
      DISABLED = 0x0_u64

      # Offset enabled
      ENABLED = 0x1_u64

      def self.reset_value : OFFSET4_EN
        OFR4.reset_value.offset4_en
      end
    end

    # OFFSET4_EN
    def offset4_en : OFFSET4_EN
      OFFSET4_EN.new!((@value >> 31) & 0x1_u32)
    end

    # OFFSET4_EN
    def self.offset4_en : OFFSET4_EN
      value.offset4_en
    end

    # OFFSET4_EN
    def self.offset4_en=(value : OFFSET4_EN) : OFFSET4_EN
      self.set(offset4_en: value)
      value
    end

    # OFFSET4_CH
    def offset4_ch : UInt8
      UInt8.new!((@value >> 26) & 0x1f_u32)
    end

    # OFFSET4_CH
    def self.offset4_ch : UInt8
      value.offset4_ch
    end

    # OFFSET4_CH
    def self.offset4_ch=(value : UInt8) : UInt8
      self.set(offset4_ch: value)
      value
    end

    # OFFSET4
    def offset4 : UInt16
      UInt16.new!((@value >> 0) & 0xfff_u32)
    end

    # OFFSET4
    def self.offset4 : UInt16
      value.offset4
    end

    # OFFSET4
    def self.offset4=(value : UInt16) : UInt16
      self.set(offset4: value)
      value
    end

    def copy_with(
      *,

      offset4_en : OFFSET4_EN? = nil,

      offset4_ch : UInt8? = nil,

      offset4 : UInt16? = nil
    ) : self
      value = @value

      unless offset4_en.nil?
        value = (value & 0x7fffffff_u32) |
                UInt32.new!(offset4_en.to_int).&(0x1_u32) << 31
      end

      unless offset4_ch.nil?
        value = (value & 0x83ffffff_u32) |
                UInt32.new!(offset4_ch.to_int).&(0x1f_u32) << 26
      end

      unless offset4.nil?
        value = (value & 0xfffff000_u32) |
                UInt32.new!(offset4.to_int).&(0xfff_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      offset4_en : OFFSET4_EN? = nil,
      offset4_ch : UInt8? = nil,
      offset4 : UInt16? = nil
    ) : Nil
      self.value = self.value.copy_with(
        offset4_en: offset4_en,
        offset4_ch: offset4_ch,
        offset4: offset4,
      )
    end
  end # struct

  # injected data register 1
  struct JDR1
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

    # JDATA1
    def jdata1 : UInt16
      UInt16.new!((@value >> 0) & 0xffff_u32)
    end

    # JDATA1
    def self.jdata1 : UInt16
      value.jdata1
    end
  end # struct

  # injected data register 2
  struct JDR2
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

    # JDATA2
    def jdata2 : UInt16
      UInt16.new!((@value >> 0) & 0xffff_u32)
    end

    # JDATA2
    def self.jdata2 : UInt16
      value.jdata2
    end
  end # struct

  # injected data register 3
  struct JDR3
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

    # JDATA3
    def jdata3 : UInt16
      UInt16.new!((@value >> 0) & 0xffff_u32)
    end

    # JDATA3
    def self.jdata3 : UInt16
      value.jdata3
    end
  end # struct

  # injected data register 4
  struct JDR4
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

    # JDATA4
    def jdata4 : UInt16
      UInt16.new!((@value >> 0) & 0xffff_u32)
    end

    # JDATA4
    def self.jdata4 : UInt16
      value.jdata4
    end
  end # struct

  # Analog Watchdog 2 Configuration          Register
  struct AWD2CR
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

    enum AWD2CH0 : UInt8
      # Input channel not monitored by AWDx
      NOTMONITORED = 0x0_u64

      # Input channel monitored by AWDx
      MONITORED = 0x1_u64

      def self.reset_value : AWD2CH0
        AWD2CR.reset_value.awd2_ch0
      end
    end

    # AWD2CH
    def awd2_ch0 : AWD2CH0
      AWD2CH0.new!((@value >> 1) & 0x1_u32)
    end

    # AWD2CH
    def self.awd2_ch0 : AWD2CH0
      value.awd2_ch0
    end

    # AWD2CH
    def self.awd2_ch0=(value : AWD2CH0) : AWD2CH0
      self.set(awd2_ch0: value)
      value
    end

    # AWD2CH
    def awd2_ch1 : Bool
      @value.bits_set?(0x4_u32)
    end

    # AWD2CH
    def self.awd2_ch1 : Bool
      value.awd2_ch1
    end

    # AWD2CH
    def self.awd2_ch1=(value : Bool) : Bool
      self.set(awd2_ch1: value)
      value
    end

    # AWD2CH
    def awd2_ch2 : Bool
      @value.bits_set?(0x8_u32)
    end

    # AWD2CH
    def self.awd2_ch2 : Bool
      value.awd2_ch2
    end

    # AWD2CH
    def self.awd2_ch2=(value : Bool) : Bool
      self.set(awd2_ch2: value)
      value
    end

    # AWD2CH
    def awd2_ch3 : Bool
      @value.bits_set?(0x10_u32)
    end

    # AWD2CH
    def self.awd2_ch3 : Bool
      value.awd2_ch3
    end

    # AWD2CH
    def self.awd2_ch3=(value : Bool) : Bool
      self.set(awd2_ch3: value)
      value
    end

    # AWD2CH
    def awd2_ch4 : Bool
      @value.bits_set?(0x20_u32)
    end

    # AWD2CH
    def self.awd2_ch4 : Bool
      value.awd2_ch4
    end

    # AWD2CH
    def self.awd2_ch4=(value : Bool) : Bool
      self.set(awd2_ch4: value)
      value
    end

    # AWD2CH
    def awd2_ch5 : Bool
      @value.bits_set?(0x40_u32)
    end

    # AWD2CH
    def self.awd2_ch5 : Bool
      value.awd2_ch5
    end

    # AWD2CH
    def self.awd2_ch5=(value : Bool) : Bool
      self.set(awd2_ch5: value)
      value
    end

    # AWD2CH
    def awd2_ch6 : Bool
      @value.bits_set?(0x80_u32)
    end

    # AWD2CH
    def self.awd2_ch6 : Bool
      value.awd2_ch6
    end

    # AWD2CH
    def self.awd2_ch6=(value : Bool) : Bool
      self.set(awd2_ch6: value)
      value
    end

    # AWD2CH
    def awd2_ch7 : Bool
      @value.bits_set?(0x100_u32)
    end

    # AWD2CH
    def self.awd2_ch7 : Bool
      value.awd2_ch7
    end

    # AWD2CH
    def self.awd2_ch7=(value : Bool) : Bool
      self.set(awd2_ch7: value)
      value
    end

    # AWD2CH
    def awd2_ch8 : Bool
      @value.bits_set?(0x200_u32)
    end

    # AWD2CH
    def self.awd2_ch8 : Bool
      value.awd2_ch8
    end

    # AWD2CH
    def self.awd2_ch8=(value : Bool) : Bool
      self.set(awd2_ch8: value)
      value
    end

    # AWD2CH
    def awd2_ch9 : Bool
      @value.bits_set?(0x400_u32)
    end

    # AWD2CH
    def self.awd2_ch9 : Bool
      value.awd2_ch9
    end

    # AWD2CH
    def self.awd2_ch9=(value : Bool) : Bool
      self.set(awd2_ch9: value)
      value
    end

    # AWD2CH
    def awd2_ch10 : Bool
      @value.bits_set?(0x800_u32)
    end

    # AWD2CH
    def self.awd2_ch10 : Bool
      value.awd2_ch10
    end

    # AWD2CH
    def self.awd2_ch10=(value : Bool) : Bool
      self.set(awd2_ch10: value)
      value
    end

    # AWD2CH
    def awd2_ch11 : Bool
      @value.bits_set?(0x1000_u32)
    end

    # AWD2CH
    def self.awd2_ch11 : Bool
      value.awd2_ch11
    end

    # AWD2CH
    def self.awd2_ch11=(value : Bool) : Bool
      self.set(awd2_ch11: value)
      value
    end

    # AWD2CH
    def awd2_ch12 : Bool
      @value.bits_set?(0x2000_u32)
    end

    # AWD2CH
    def self.awd2_ch12 : Bool
      value.awd2_ch12
    end

    # AWD2CH
    def self.awd2_ch12=(value : Bool) : Bool
      self.set(awd2_ch12: value)
      value
    end

    # AWD2CH
    def awd2_ch13 : Bool
      @value.bits_set?(0x4000_u32)
    end

    # AWD2CH
    def self.awd2_ch13 : Bool
      value.awd2_ch13
    end

    # AWD2CH
    def self.awd2_ch13=(value : Bool) : Bool
      self.set(awd2_ch13: value)
      value
    end

    # AWD2CH
    def awd2_ch14 : Bool
      @value.bits_set?(0x8000_u32)
    end

    # AWD2CH
    def self.awd2_ch14 : Bool
      value.awd2_ch14
    end

    # AWD2CH
    def self.awd2_ch14=(value : Bool) : Bool
      self.set(awd2_ch14: value)
      value
    end

    # AWD2CH
    def awd2_ch15 : Bool
      @value.bits_set?(0x10000_u32)
    end

    # AWD2CH
    def self.awd2_ch15 : Bool
      value.awd2_ch15
    end

    # AWD2CH
    def self.awd2_ch15=(value : Bool) : Bool
      self.set(awd2_ch15: value)
      value
    end

    # AWD2CH
    def awd2_ch16 : Bool
      @value.bits_set?(0x20000_u32)
    end

    # AWD2CH
    def self.awd2_ch16 : Bool
      value.awd2_ch16
    end

    # AWD2CH
    def self.awd2_ch16=(value : Bool) : Bool
      self.set(awd2_ch16: value)
      value
    end

    # AWD2CH
    def awd2_ch17 : Bool
      @value.bits_set?(0x40000_u32)
    end

    # AWD2CH
    def self.awd2_ch17 : Bool
      value.awd2_ch17
    end

    # AWD2CH
    def self.awd2_ch17=(value : Bool) : Bool
      self.set(awd2_ch17: value)
      value
    end

    def copy_with(
      *,

      awd2_ch0 : AWD2CH0? = nil,

      awd2_ch1 : Bool? = nil,

      awd2_ch2 : Bool? = nil,

      awd2_ch3 : Bool? = nil,

      awd2_ch4 : Bool? = nil,

      awd2_ch5 : Bool? = nil,

      awd2_ch6 : Bool? = nil,

      awd2_ch7 : Bool? = nil,

      awd2_ch8 : Bool? = nil,

      awd2_ch9 : Bool? = nil,

      awd2_ch10 : Bool? = nil,

      awd2_ch11 : Bool? = nil,

      awd2_ch12 : Bool? = nil,

      awd2_ch13 : Bool? = nil,

      awd2_ch14 : Bool? = nil,

      awd2_ch15 : Bool? = nil,

      awd2_ch16 : Bool? = nil,

      awd2_ch17 : Bool? = nil
    ) : self
      value = @value

      unless awd2_ch0.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(awd2_ch0.to_int).&(0x1_u32) << 1
      end

      unless awd2_ch1.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(awd2_ch1.to_int).&(0x1_u32) << 2
      end

      unless awd2_ch2.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(awd2_ch2.to_int).&(0x1_u32) << 3
      end

      unless awd2_ch3.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(awd2_ch3.to_int).&(0x1_u32) << 4
      end

      unless awd2_ch4.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(awd2_ch4.to_int).&(0x1_u32) << 5
      end

      unless awd2_ch5.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(awd2_ch5.to_int).&(0x1_u32) << 6
      end

      unless awd2_ch6.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(awd2_ch6.to_int).&(0x1_u32) << 7
      end

      unless awd2_ch7.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(awd2_ch7.to_int).&(0x1_u32) << 8
      end

      unless awd2_ch8.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(awd2_ch8.to_int).&(0x1_u32) << 9
      end

      unless awd2_ch9.nil?
        value = (value & 0xfffffbff_u32) |
                UInt32.new!(awd2_ch9.to_int).&(0x1_u32) << 10
      end

      unless awd2_ch10.nil?
        value = (value & 0xfffff7ff_u32) |
                UInt32.new!(awd2_ch10.to_int).&(0x1_u32) << 11
      end

      unless awd2_ch11.nil?
        value = (value & 0xffffefff_u32) |
                UInt32.new!(awd2_ch11.to_int).&(0x1_u32) << 12
      end

      unless awd2_ch12.nil?
        value = (value & 0xffffdfff_u32) |
                UInt32.new!(awd2_ch12.to_int).&(0x1_u32) << 13
      end

      unless awd2_ch13.nil?
        value = (value & 0xffffbfff_u32) |
                UInt32.new!(awd2_ch13.to_int).&(0x1_u32) << 14
      end

      unless awd2_ch14.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(awd2_ch14.to_int).&(0x1_u32) << 15
      end

      unless awd2_ch15.nil?
        value = (value & 0xfffeffff_u32) |
                UInt32.new!(awd2_ch15.to_int).&(0x1_u32) << 16
      end

      unless awd2_ch16.nil?
        value = (value & 0xfffdffff_u32) |
                UInt32.new!(awd2_ch16.to_int).&(0x1_u32) << 17
      end

      unless awd2_ch17.nil?
        value = (value & 0xfffbffff_u32) |
                UInt32.new!(awd2_ch17.to_int).&(0x1_u32) << 18
      end

      self.class.new(value)
    end

    def self.set(
      *,
      awd2_ch0 : AWD2CH0? = nil,
      awd2_ch1 : Bool? = nil,
      awd2_ch2 : Bool? = nil,
      awd2_ch3 : Bool? = nil,
      awd2_ch4 : Bool? = nil,
      awd2_ch5 : Bool? = nil,
      awd2_ch6 : Bool? = nil,
      awd2_ch7 : Bool? = nil,
      awd2_ch8 : Bool? = nil,
      awd2_ch9 : Bool? = nil,
      awd2_ch10 : Bool? = nil,
      awd2_ch11 : Bool? = nil,
      awd2_ch12 : Bool? = nil,
      awd2_ch13 : Bool? = nil,
      awd2_ch14 : Bool? = nil,
      awd2_ch15 : Bool? = nil,
      awd2_ch16 : Bool? = nil,
      awd2_ch17 : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        awd2_ch0: awd2_ch0,
        awd2_ch1: awd2_ch1,
        awd2_ch2: awd2_ch2,
        awd2_ch3: awd2_ch3,
        awd2_ch4: awd2_ch4,
        awd2_ch5: awd2_ch5,
        awd2_ch6: awd2_ch6,
        awd2_ch7: awd2_ch7,
        awd2_ch8: awd2_ch8,
        awd2_ch9: awd2_ch9,
        awd2_ch10: awd2_ch10,
        awd2_ch11: awd2_ch11,
        awd2_ch12: awd2_ch12,
        awd2_ch13: awd2_ch13,
        awd2_ch14: awd2_ch14,
        awd2_ch15: awd2_ch15,
        awd2_ch16: awd2_ch16,
        awd2_ch17: awd2_ch17,
      )
    end
  end # struct

  # Analog Watchdog 3 Configuration          Register
  struct AWD3CR
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

    enum AWD3CH0 : UInt8
      # Input channel not monitored by AWDx
      NOTMONITORED = 0x0_u64

      # Input channel monitored by AWDx
      MONITORED = 0x1_u64

      def self.reset_value : AWD3CH0
        AWD3CR.reset_value.awd3_ch0
      end
    end

    # AWD3CH
    def awd3_ch0 : AWD3CH0
      AWD3CH0.new!((@value >> 1) & 0x1_u32)
    end

    # AWD3CH
    def self.awd3_ch0 : AWD3CH0
      value.awd3_ch0
    end

    # AWD3CH
    def self.awd3_ch0=(value : AWD3CH0) : AWD3CH0
      self.set(awd3_ch0: value)
      value
    end

    # AWD3CH
    def awd3_ch1 : Bool
      @value.bits_set?(0x4_u32)
    end

    # AWD3CH
    def self.awd3_ch1 : Bool
      value.awd3_ch1
    end

    # AWD3CH
    def self.awd3_ch1=(value : Bool) : Bool
      self.set(awd3_ch1: value)
      value
    end

    # AWD3CH
    def awd3_ch2 : Bool
      @value.bits_set?(0x8_u32)
    end

    # AWD3CH
    def self.awd3_ch2 : Bool
      value.awd3_ch2
    end

    # AWD3CH
    def self.awd3_ch2=(value : Bool) : Bool
      self.set(awd3_ch2: value)
      value
    end

    # AWD3CH
    def awd3_ch3 : Bool
      @value.bits_set?(0x10_u32)
    end

    # AWD3CH
    def self.awd3_ch3 : Bool
      value.awd3_ch3
    end

    # AWD3CH
    def self.awd3_ch3=(value : Bool) : Bool
      self.set(awd3_ch3: value)
      value
    end

    # AWD3CH
    def awd3_ch4 : Bool
      @value.bits_set?(0x20_u32)
    end

    # AWD3CH
    def self.awd3_ch4 : Bool
      value.awd3_ch4
    end

    # AWD3CH
    def self.awd3_ch4=(value : Bool) : Bool
      self.set(awd3_ch4: value)
      value
    end

    # AWD3CH
    def awd3_ch5 : Bool
      @value.bits_set?(0x40_u32)
    end

    # AWD3CH
    def self.awd3_ch5 : Bool
      value.awd3_ch5
    end

    # AWD3CH
    def self.awd3_ch5=(value : Bool) : Bool
      self.set(awd3_ch5: value)
      value
    end

    # AWD3CH
    def awd3_ch6 : Bool
      @value.bits_set?(0x80_u32)
    end

    # AWD3CH
    def self.awd3_ch6 : Bool
      value.awd3_ch6
    end

    # AWD3CH
    def self.awd3_ch6=(value : Bool) : Bool
      self.set(awd3_ch6: value)
      value
    end

    # AWD3CH
    def awd3_ch7 : Bool
      @value.bits_set?(0x100_u32)
    end

    # AWD3CH
    def self.awd3_ch7 : Bool
      value.awd3_ch7
    end

    # AWD3CH
    def self.awd3_ch7=(value : Bool) : Bool
      self.set(awd3_ch7: value)
      value
    end

    # AWD3CH
    def awd3_ch8 : Bool
      @value.bits_set?(0x200_u32)
    end

    # AWD3CH
    def self.awd3_ch8 : Bool
      value.awd3_ch8
    end

    # AWD3CH
    def self.awd3_ch8=(value : Bool) : Bool
      self.set(awd3_ch8: value)
      value
    end

    # AWD3CH
    def awd3_ch9 : Bool
      @value.bits_set?(0x400_u32)
    end

    # AWD3CH
    def self.awd3_ch9 : Bool
      value.awd3_ch9
    end

    # AWD3CH
    def self.awd3_ch9=(value : Bool) : Bool
      self.set(awd3_ch9: value)
      value
    end

    # AWD3CH
    def awd3_ch10 : Bool
      @value.bits_set?(0x800_u32)
    end

    # AWD3CH
    def self.awd3_ch10 : Bool
      value.awd3_ch10
    end

    # AWD3CH
    def self.awd3_ch10=(value : Bool) : Bool
      self.set(awd3_ch10: value)
      value
    end

    # AWD3CH
    def awd3_ch11 : Bool
      @value.bits_set?(0x1000_u32)
    end

    # AWD3CH
    def self.awd3_ch11 : Bool
      value.awd3_ch11
    end

    # AWD3CH
    def self.awd3_ch11=(value : Bool) : Bool
      self.set(awd3_ch11: value)
      value
    end

    # AWD3CH
    def awd3_ch12 : Bool
      @value.bits_set?(0x2000_u32)
    end

    # AWD3CH
    def self.awd3_ch12 : Bool
      value.awd3_ch12
    end

    # AWD3CH
    def self.awd3_ch12=(value : Bool) : Bool
      self.set(awd3_ch12: value)
      value
    end

    # AWD3CH
    def awd3_ch13 : Bool
      @value.bits_set?(0x4000_u32)
    end

    # AWD3CH
    def self.awd3_ch13 : Bool
      value.awd3_ch13
    end

    # AWD3CH
    def self.awd3_ch13=(value : Bool) : Bool
      self.set(awd3_ch13: value)
      value
    end

    # AWD3CH
    def awd3_ch14 : Bool
      @value.bits_set?(0x8000_u32)
    end

    # AWD3CH
    def self.awd3_ch14 : Bool
      value.awd3_ch14
    end

    # AWD3CH
    def self.awd3_ch14=(value : Bool) : Bool
      self.set(awd3_ch14: value)
      value
    end

    # AWD3CH
    def awd3_ch15 : Bool
      @value.bits_set?(0x10000_u32)
    end

    # AWD3CH
    def self.awd3_ch15 : Bool
      value.awd3_ch15
    end

    # AWD3CH
    def self.awd3_ch15=(value : Bool) : Bool
      self.set(awd3_ch15: value)
      value
    end

    # AWD3CH
    def awd3_ch16 : Bool
      @value.bits_set?(0x20000_u32)
    end

    # AWD3CH
    def self.awd3_ch16 : Bool
      value.awd3_ch16
    end

    # AWD3CH
    def self.awd3_ch16=(value : Bool) : Bool
      self.set(awd3_ch16: value)
      value
    end

    # AWD3CH
    def awd3_ch17 : Bool
      @value.bits_set?(0x40000_u32)
    end

    # AWD3CH
    def self.awd3_ch17 : Bool
      value.awd3_ch17
    end

    # AWD3CH
    def self.awd3_ch17=(value : Bool) : Bool
      self.set(awd3_ch17: value)
      value
    end

    def copy_with(
      *,

      awd3_ch0 : AWD3CH0? = nil,

      awd3_ch1 : Bool? = nil,

      awd3_ch2 : Bool? = nil,

      awd3_ch3 : Bool? = nil,

      awd3_ch4 : Bool? = nil,

      awd3_ch5 : Bool? = nil,

      awd3_ch6 : Bool? = nil,

      awd3_ch7 : Bool? = nil,

      awd3_ch8 : Bool? = nil,

      awd3_ch9 : Bool? = nil,

      awd3_ch10 : Bool? = nil,

      awd3_ch11 : Bool? = nil,

      awd3_ch12 : Bool? = nil,

      awd3_ch13 : Bool? = nil,

      awd3_ch14 : Bool? = nil,

      awd3_ch15 : Bool? = nil,

      awd3_ch16 : Bool? = nil,

      awd3_ch17 : Bool? = nil
    ) : self
      value = @value

      unless awd3_ch0.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(awd3_ch0.to_int).&(0x1_u32) << 1
      end

      unless awd3_ch1.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(awd3_ch1.to_int).&(0x1_u32) << 2
      end

      unless awd3_ch2.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(awd3_ch2.to_int).&(0x1_u32) << 3
      end

      unless awd3_ch3.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(awd3_ch3.to_int).&(0x1_u32) << 4
      end

      unless awd3_ch4.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(awd3_ch4.to_int).&(0x1_u32) << 5
      end

      unless awd3_ch5.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(awd3_ch5.to_int).&(0x1_u32) << 6
      end

      unless awd3_ch6.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(awd3_ch6.to_int).&(0x1_u32) << 7
      end

      unless awd3_ch7.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(awd3_ch7.to_int).&(0x1_u32) << 8
      end

      unless awd3_ch8.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(awd3_ch8.to_int).&(0x1_u32) << 9
      end

      unless awd3_ch9.nil?
        value = (value & 0xfffffbff_u32) |
                UInt32.new!(awd3_ch9.to_int).&(0x1_u32) << 10
      end

      unless awd3_ch10.nil?
        value = (value & 0xfffff7ff_u32) |
                UInt32.new!(awd3_ch10.to_int).&(0x1_u32) << 11
      end

      unless awd3_ch11.nil?
        value = (value & 0xffffefff_u32) |
                UInt32.new!(awd3_ch11.to_int).&(0x1_u32) << 12
      end

      unless awd3_ch12.nil?
        value = (value & 0xffffdfff_u32) |
                UInt32.new!(awd3_ch12.to_int).&(0x1_u32) << 13
      end

      unless awd3_ch13.nil?
        value = (value & 0xffffbfff_u32) |
                UInt32.new!(awd3_ch13.to_int).&(0x1_u32) << 14
      end

      unless awd3_ch14.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(awd3_ch14.to_int).&(0x1_u32) << 15
      end

      unless awd3_ch15.nil?
        value = (value & 0xfffeffff_u32) |
                UInt32.new!(awd3_ch15.to_int).&(0x1_u32) << 16
      end

      unless awd3_ch16.nil?
        value = (value & 0xfffdffff_u32) |
                UInt32.new!(awd3_ch16.to_int).&(0x1_u32) << 17
      end

      unless awd3_ch17.nil?
        value = (value & 0xfffbffff_u32) |
                UInt32.new!(awd3_ch17.to_int).&(0x1_u32) << 18
      end

      self.class.new(value)
    end

    def self.set(
      *,
      awd3_ch0 : AWD3CH0? = nil,
      awd3_ch1 : Bool? = nil,
      awd3_ch2 : Bool? = nil,
      awd3_ch3 : Bool? = nil,
      awd3_ch4 : Bool? = nil,
      awd3_ch5 : Bool? = nil,
      awd3_ch6 : Bool? = nil,
      awd3_ch7 : Bool? = nil,
      awd3_ch8 : Bool? = nil,
      awd3_ch9 : Bool? = nil,
      awd3_ch10 : Bool? = nil,
      awd3_ch11 : Bool? = nil,
      awd3_ch12 : Bool? = nil,
      awd3_ch13 : Bool? = nil,
      awd3_ch14 : Bool? = nil,
      awd3_ch15 : Bool? = nil,
      awd3_ch16 : Bool? = nil,
      awd3_ch17 : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        awd3_ch0: awd3_ch0,
        awd3_ch1: awd3_ch1,
        awd3_ch2: awd3_ch2,
        awd3_ch3: awd3_ch3,
        awd3_ch4: awd3_ch4,
        awd3_ch5: awd3_ch5,
        awd3_ch6: awd3_ch6,
        awd3_ch7: awd3_ch7,
        awd3_ch8: awd3_ch8,
        awd3_ch9: awd3_ch9,
        awd3_ch10: awd3_ch10,
        awd3_ch11: awd3_ch11,
        awd3_ch12: awd3_ch12,
        awd3_ch13: awd3_ch13,
        awd3_ch14: awd3_ch14,
        awd3_ch15: awd3_ch15,
        awd3_ch16: awd3_ch16,
        awd3_ch17: awd3_ch17,
      )
    end
  end # struct

  # Differential Mode Selection Register          2
  struct DIFSEL
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

    enum N10 : UInt8
      # Input channel is configured in single-ended mode
      SINGLEENDED = 0x0_u64

      # Input channel is configured in differential mode
      DIFFERENTIAL = 0x1_u64

      def self.reset_value : N10
        DIFSEL.reset_value._10
      end
    end

    # Differential mode for channels 15 to              1
    def _10 : N10
      N10.new!((@value >> 1) & 0x1_u32)
    end

    # Differential mode for channels 15 to              1
    def self._10 : N10
      value._10
    end

    # Differential mode for channels 15 to              1
    def _11 : Bool
      @value.bits_set?(0x4_u32)
    end

    # Differential mode for channels 15 to              1
    def self._11 : Bool
      value._11
    end

    # Differential mode for channels 15 to              1
    def _12 : Bool
      @value.bits_set?(0x8_u32)
    end

    # Differential mode for channels 15 to              1
    def self._12 : Bool
      value._12
    end

    # Differential mode for channels 15 to              1
    def _13 : Bool
      @value.bits_set?(0x10_u32)
    end

    # Differential mode for channels 15 to              1
    def self._13 : Bool
      value._13
    end

    # Differential mode for channels 15 to              1
    def _14 : Bool
      @value.bits_set?(0x20_u32)
    end

    # Differential mode for channels 15 to              1
    def self._14 : Bool
      value._14
    end

    # Differential mode for channels 15 to              1
    def _15 : Bool
      @value.bits_set?(0x40_u32)
    end

    # Differential mode for channels 15 to              1
    def self._15 : Bool
      value._15
    end

    # Differential mode for channels 15 to              1
    def _16 : Bool
      @value.bits_set?(0x80_u32)
    end

    # Differential mode for channels 15 to              1
    def self._16 : Bool
      value._16
    end

    # Differential mode for channels 15 to              1
    def _17 : Bool
      @value.bits_set?(0x100_u32)
    end

    # Differential mode for channels 15 to              1
    def self._17 : Bool
      value._17
    end

    # Differential mode for channels 15 to              1
    def _18 : Bool
      @value.bits_set?(0x200_u32)
    end

    # Differential mode for channels 15 to              1
    def self._18 : Bool
      value._18
    end

    # Differential mode for channels 15 to              1
    def _19 : Bool
      @value.bits_set?(0x400_u32)
    end

    # Differential mode for channels 15 to              1
    def self._19 : Bool
      value._19
    end

    # Differential mode for channels 15 to              1
    def _110 : Bool
      @value.bits_set?(0x800_u32)
    end

    # Differential mode for channels 15 to              1
    def self._110 : Bool
      value._110
    end

    # Differential mode for channels 15 to              1
    def _111 : Bool
      @value.bits_set?(0x1000_u32)
    end

    # Differential mode for channels 15 to              1
    def self._111 : Bool
      value._111
    end

    # Differential mode for channels 15 to              1
    def _112 : Bool
      @value.bits_set?(0x2000_u32)
    end

    # Differential mode for channels 15 to              1
    def self._112 : Bool
      value._112
    end

    # Differential mode for channels 15 to              1
    def _113 : Bool
      @value.bits_set?(0x4000_u32)
    end

    # Differential mode for channels 15 to              1
    def self._113 : Bool
      value._113
    end

    # Differential mode for channels 15 to              1
    def _114 : Bool
      @value.bits_set?(0x8000_u32)
    end

    # Differential mode for channels 15 to              1
    def self._114 : Bool
      value._114
    end

    # Differential mode for channels 15 to              1
    def _115 : Bool
      @value.bits_set?(0x10000_u32)
    end

    # Differential mode for channels 15 to              1
    def self._115 : Bool
      value._115
    end

    # Differential mode for channels 15 to              1
    def _116 : Bool
      @value.bits_set?(0x20000_u32)
    end

    # Differential mode for channels 15 to              1
    def self._116 : Bool
      value._116
    end

    # Differential mode for channels 15 to              1
    def _117 : Bool
      @value.bits_set?(0x40000_u32)
    end

    # Differential mode for channels 15 to              1
    def self._117 : Bool
      value._117
    end
  end # struct

  # Calibration Factors
  struct CALFACT
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

    # CALFACT_D
    def d : UInt8
      UInt8.new!((@value >> 16) & 0x7f_u32)
    end

    # CALFACT_D
    def self.d : UInt8
      value.d
    end

    # CALFACT_D
    def self.d=(value : UInt8) : UInt8
      self.set(d: value)
      value
    end

    # CALFACT_S
    def s : UInt8
      UInt8.new!((@value >> 0) & 0x7f_u32)
    end

    # CALFACT_S
    def self.s : UInt8
      value.s
    end

    # CALFACT_S
    def self.s=(value : UInt8) : UInt8
      self.set(s: value)
      value
    end

    def copy_with(
      *,

      d : UInt8? = nil,

      s : UInt8? = nil
    ) : self
      value = @value

      unless d.nil?
        value = (value & 0xff80ffff_u32) |
                UInt32.new!(d.to_int).&(0x7f_u32) << 16
      end

      unless s.nil?
        value = (value & 0xffffff80_u32) |
                UInt32.new!(s.to_int).&(0x7f_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      d : UInt8? = nil,
      s : UInt8? = nil
    ) : Nil
      self.value = self.value.copy_with(
        d: d,
        s: s,
      )
    end
  end # struct

end
