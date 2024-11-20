# Inter-integrated circuit
module I2C1
  VERSION      = nil
  BASE_ADDRESS = 0x40005400_u64

  # Control register 1
  struct CR1
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

    enum PE : UInt8
      # Peripheral disabled
      DISABLED = 0x0_u64

      # Peripheral enabled
      ENABLED = 0x1_u64

      def self.reset_value : PE
        CR1.reset_value.pe
      end
    end

    # Peripheral enable
    def pe : PE
      PE.new!((@value >> 0) & 0x1_u32)
    end

    # Peripheral enable
    def self.pe : PE
      value.pe
    end

    # Peripheral enable
    def self.pe=(value : PE) : PE
      self.set(pe: value)
      value
    end

    enum TXIE : UInt8
      # Transmit (TXIS) interrupt disabled
      DISABLED = 0x0_u64

      # Transmit (TXIS) interrupt enabled
      ENABLED = 0x1_u64

      def self.reset_value : TXIE
        CR1.reset_value.txie
      end
    end

    # TX Interrupt enable
    def txie : TXIE
      TXIE.new!((@value >> 1) & 0x1_u32)
    end

    # TX Interrupt enable
    def self.txie : TXIE
      value.txie
    end

    # TX Interrupt enable
    def self.txie=(value : TXIE) : TXIE
      self.set(txie: value)
      value
    end

    enum RXIE : UInt8
      # Receive (RXNE) interrupt disabled
      DISABLED = 0x0_u64

      # Receive (RXNE) interrupt enabled
      ENABLED = 0x1_u64

      def self.reset_value : RXIE
        CR1.reset_value.rxie
      end
    end

    # RX Interrupt enable
    def rxie : RXIE
      RXIE.new!((@value >> 2) & 0x1_u32)
    end

    # RX Interrupt enable
    def self.rxie : RXIE
      value.rxie
    end

    # RX Interrupt enable
    def self.rxie=(value : RXIE) : RXIE
      self.set(rxie: value)
      value
    end

    enum ADDRIE : UInt8
      # Address match (ADDR) interrupts disabled
      DISABLED = 0x0_u64

      # Address match (ADDR) interrupts enabled
      ENABLED = 0x1_u64

      def self.reset_value : ADDRIE
        CR1.reset_value.addrie
      end
    end

    # Address match interrupt enable (slave              only)
    def addrie : ADDRIE
      ADDRIE.new!((@value >> 3) & 0x1_u32)
    end

    # Address match interrupt enable (slave              only)
    def self.addrie : ADDRIE
      value.addrie
    end

    # Address match interrupt enable (slave              only)
    def self.addrie=(value : ADDRIE) : ADDRIE
      self.set(addrie: value)
      value
    end

    enum NACKIE : UInt8
      # Not acknowledge (NACKF) received interrupts disabled
      DISABLED = 0x0_u64

      # Not acknowledge (NACKF) received interrupts enabled
      ENABLED = 0x1_u64

      def self.reset_value : NACKIE
        CR1.reset_value.nackie
      end
    end

    # Not acknowledge received interrupt              enable
    def nackie : NACKIE
      NACKIE.new!((@value >> 4) & 0x1_u32)
    end

    # Not acknowledge received interrupt              enable
    def self.nackie : NACKIE
      value.nackie
    end

    # Not acknowledge received interrupt              enable
    def self.nackie=(value : NACKIE) : NACKIE
      self.set(nackie: value)
      value
    end

    enum STOPIE : UInt8
      # Stop detection (STOPF) interrupt disabled
      DISABLED = 0x0_u64

      # Stop detection (STOPF) interrupt enabled
      ENABLED = 0x1_u64

      def self.reset_value : STOPIE
        CR1.reset_value.stopie
      end
    end

    # STOP detection Interrupt              enable
    def stopie : STOPIE
      STOPIE.new!((@value >> 5) & 0x1_u32)
    end

    # STOP detection Interrupt              enable
    def self.stopie : STOPIE
      value.stopie
    end

    # STOP detection Interrupt              enable
    def self.stopie=(value : STOPIE) : STOPIE
      self.set(stopie: value)
      value
    end

    enum TCIE : UInt8
      # Transfer Complete interrupt disabled
      DISABLED = 0x0_u64

      # Transfer Complete interrupt enabled
      ENABLED = 0x1_u64

      def self.reset_value : TCIE
        CR1.reset_value.tcie
      end
    end

    # Transfer Complete interrupt              enable
    def tcie : TCIE
      TCIE.new!((@value >> 6) & 0x1_u32)
    end

    # Transfer Complete interrupt              enable
    def self.tcie : TCIE
      value.tcie
    end

    # Transfer Complete interrupt              enable
    def self.tcie=(value : TCIE) : TCIE
      self.set(tcie: value)
      value
    end

    enum ERRIE : UInt8
      # Error detection interrupts disabled
      DISABLED = 0x0_u64

      # Error detection interrupts enabled
      ENABLED = 0x1_u64

      def self.reset_value : ERRIE
        CR1.reset_value.errie
      end
    end

    # Error interrupts enable
    def errie : ERRIE
      ERRIE.new!((@value >> 7) & 0x1_u32)
    end

    # Error interrupts enable
    def self.errie : ERRIE
      value.errie
    end

    # Error interrupts enable
    def self.errie=(value : ERRIE) : ERRIE
      self.set(errie: value)
      value
    end

    enum DNF : UInt8
      # Digital filter disabled
      NOFILTER = 0x0_u64

      # Digital filter enabled and filtering capability up to 1 tI2CCLK
      FILTER1 = 0x1_u64

      # Digital filter enabled and filtering capability up to 2 tI2CCLK
      FILTER2 = 0x2_u64

      # Digital filter enabled and filtering capability up to 3 tI2CCLK
      FILTER3 = 0x3_u64

      # Digital filter enabled and filtering capability up to 4 tI2CCLK
      FILTER4 = 0x4_u64

      # Digital filter enabled and filtering capability up to 5 tI2CCLK
      FILTER5 = 0x5_u64

      # Digital filter enabled and filtering capability up to 6 tI2CCLK
      FILTER6 = 0x6_u64

      # Digital filter enabled and filtering capability up to 7 tI2CCLK
      FILTER7 = 0x7_u64

      # Digital filter enabled and filtering capability up to 8 tI2CCLK
      FILTER8 = 0x8_u64

      # Digital filter enabled and filtering capability up to 9 tI2CCLK
      FILTER9 = 0x9_u64

      # Digital filter enabled and filtering capability up to 10 tI2CCLK
      FILTER10 = 0xa_u64

      # Digital filter enabled and filtering capability up to 11 tI2CCLK
      FILTER11 = 0xb_u64

      # Digital filter enabled and filtering capability up to 12 tI2CCLK
      FILTER12 = 0xc_u64

      # Digital filter enabled and filtering capability up to 13 tI2CCLK
      FILTER13 = 0xd_u64

      # Digital filter enabled and filtering capability up to 14 tI2CCLK
      FILTER14 = 0xe_u64

      # Digital filter enabled and filtering capability up to 15 tI2CCLK
      FILTER15 = 0xf_u64

      def self.reset_value : DNF
        CR1.reset_value.dnf
      end
    end

    # Digital noise filter
    def dnf : DNF
      DNF.new!((@value >> 8) & 0xf_u32)
    end

    # Digital noise filter
    def self.dnf : DNF
      value.dnf
    end

    # Digital noise filter
    def self.dnf=(value : DNF) : DNF
      self.set(dnf: value)
      value
    end

    enum ANFOFF : UInt8
      # Analog noise filter enabled
      ENABLED = 0x0_u64

      # Analog noise filter disabled
      DISABLED = 0x1_u64

      def self.reset_value : ANFOFF
        CR1.reset_value.anfoff
      end
    end

    # Analog noise filter OFF
    def anfoff : ANFOFF
      ANFOFF.new!((@value >> 12) & 0x1_u32)
    end

    # Analog noise filter OFF
    def self.anfoff : ANFOFF
      value.anfoff
    end

    # Analog noise filter OFF
    def self.anfoff=(value : ANFOFF) : ANFOFF
      self.set(anfoff: value)
      value
    end

    # Software reset
    def self.swrst=(value : Bool) : Bool
      self.set(swrst: value)
      value
    end

    enum TXDMAEN : UInt8
      # DMA mode disabled for transmission
      DISABLED = 0x0_u64

      # DMA mode enabled for transmission
      ENABLED = 0x1_u64

      def self.reset_value : TXDMAEN
        CR1.reset_value.txdmaen
      end
    end

    # DMA transmission requests              enable
    def txdmaen : TXDMAEN
      TXDMAEN.new!((@value >> 14) & 0x1_u32)
    end

    # DMA transmission requests              enable
    def self.txdmaen : TXDMAEN
      value.txdmaen
    end

    # DMA transmission requests              enable
    def self.txdmaen=(value : TXDMAEN) : TXDMAEN
      self.set(txdmaen: value)
      value
    end

    enum RXDMAEN : UInt8
      # DMA mode disabled for reception
      DISABLED = 0x0_u64

      # DMA mode enabled for reception
      ENABLED = 0x1_u64

      def self.reset_value : RXDMAEN
        CR1.reset_value.rxdmaen
      end
    end

    # DMA reception requests              enable
    def rxdmaen : RXDMAEN
      RXDMAEN.new!((@value >> 15) & 0x1_u32)
    end

    # DMA reception requests              enable
    def self.rxdmaen : RXDMAEN
      value.rxdmaen
    end

    # DMA reception requests              enable
    def self.rxdmaen=(value : RXDMAEN) : RXDMAEN
      self.set(rxdmaen: value)
      value
    end

    enum SBC : UInt8
      # Slave byte control disabled
      DISABLED = 0x0_u64

      # Slave byte control enabled
      ENABLED = 0x1_u64

      def self.reset_value : SBC
        CR1.reset_value.sbc
      end
    end

    # Slave byte control
    def sbc : SBC
      SBC.new!((@value >> 16) & 0x1_u32)
    end

    # Slave byte control
    def self.sbc : SBC
      value.sbc
    end

    # Slave byte control
    def self.sbc=(value : SBC) : SBC
      self.set(sbc: value)
      value
    end

    enum NOSTRETCH : UInt8
      # Clock stretching enabled
      ENABLED = 0x0_u64

      # Clock stretching disabled
      DISABLED = 0x1_u64

      def self.reset_value : NOSTRETCH
        CR1.reset_value.nostretch
      end
    end

    # Clock stretching disable
    def nostretch : NOSTRETCH
      NOSTRETCH.new!((@value >> 17) & 0x1_u32)
    end

    # Clock stretching disable
    def self.nostretch : NOSTRETCH
      value.nostretch
    end

    # Clock stretching disable
    def self.nostretch=(value : NOSTRETCH) : NOSTRETCH
      self.set(nostretch: value)
      value
    end

    enum WUPEN : UInt8
      # Wakeup from Stop mode disabled
      DISABLED = 0x0_u64

      # Wakeup from Stop mode enabled
      ENABLED = 0x1_u64

      def self.reset_value : WUPEN
        CR1.reset_value.wupen
      end
    end

    # Wakeup from STOP enable
    def wupen : WUPEN
      WUPEN.new!((@value >> 18) & 0x1_u32)
    end

    # Wakeup from STOP enable
    def self.wupen : WUPEN
      value.wupen
    end

    # Wakeup from STOP enable
    def self.wupen=(value : WUPEN) : WUPEN
      self.set(wupen: value)
      value
    end

    enum GCEN : UInt8
      # General call disabled. Address 0b00000000 is NACKed
      DISABLED = 0x0_u64

      # General call enabled. Address 0b00000000 is ACKed
      ENABLED = 0x1_u64

      def self.reset_value : GCEN
        CR1.reset_value.gcen
      end
    end

    # General call enable
    def gcen : GCEN
      GCEN.new!((@value >> 19) & 0x1_u32)
    end

    # General call enable
    def self.gcen : GCEN
      value.gcen
    end

    # General call enable
    def self.gcen=(value : GCEN) : GCEN
      self.set(gcen: value)
      value
    end

    enum SMBHEN : UInt8
      # Host address disabled. Address 0b0001000x is NACKed
      DISABLED = 0x0_u64

      # Host address enabled. Address 0b0001000x is ACKed
      ENABLED = 0x1_u64

      def self.reset_value : SMBHEN
        CR1.reset_value.smbhen
      end
    end

    # SMBus Host address enable
    def smbhen : SMBHEN
      SMBHEN.new!((@value >> 20) & 0x1_u32)
    end

    # SMBus Host address enable
    def self.smbhen : SMBHEN
      value.smbhen
    end

    # SMBus Host address enable
    def self.smbhen=(value : SMBHEN) : SMBHEN
      self.set(smbhen: value)
      value
    end

    enum SMBDEN : UInt8
      # Device default address disabled. Address 0b1100001x is NACKed
      DISABLED = 0x0_u64

      # Device default address enabled. Address 0b1100001x is ACKed
      ENABLED = 0x1_u64

      def self.reset_value : SMBDEN
        CR1.reset_value.smbden
      end
    end

    # SMBus Device Default address              enable
    def smbden : SMBDEN
      SMBDEN.new!((@value >> 21) & 0x1_u32)
    end

    # SMBus Device Default address              enable
    def self.smbden : SMBDEN
      value.smbden
    end

    # SMBus Device Default address              enable
    def self.smbden=(value : SMBDEN) : SMBDEN
      self.set(smbden: value)
      value
    end

    enum ALERTEN : UInt8
      # In device mode (SMBHEN=Disabled) Releases SMBA pin high and Alert Response Address Header disabled (0001100x) followed by NACK. In host mode (SMBHEN=Enabled) SMBus Alert pin (SMBA) not supported
      DISABLED = 0x0_u64

      # In device mode (SMBHEN=Disabled) Drives SMBA pin low and Alert Response Address Header enabled (0001100x) followed by ACK.In host mode (SMBHEN=Enabled) SMBus Alert pin (SMBA) supported
      ENABLED = 0x1_u64

      def self.reset_value : ALERTEN
        CR1.reset_value.alerten
      end
    end

    # SMBUS alert enable
    def alerten : ALERTEN
      ALERTEN.new!((@value >> 22) & 0x1_u32)
    end

    # SMBUS alert enable
    def self.alerten : ALERTEN
      value.alerten
    end

    # SMBUS alert enable
    def self.alerten=(value : ALERTEN) : ALERTEN
      self.set(alerten: value)
      value
    end

    enum PECEN : UInt8
      # PEC calculation disabled
      DISABLED = 0x0_u64

      # PEC calculation enabled
      ENABLED = 0x1_u64

      def self.reset_value : PECEN
        CR1.reset_value.pecen
      end
    end

    # PEC enable
    def pecen : PECEN
      PECEN.new!((@value >> 23) & 0x1_u32)
    end

    # PEC enable
    def self.pecen : PECEN
      value.pecen
    end

    # PEC enable
    def self.pecen=(value : PECEN) : PECEN
      self.set(pecen: value)
      value
    end

    def copy_with(
      *,

      pe : PE? = nil,

      txie : TXIE? = nil,

      rxie : RXIE? = nil,

      addrie : ADDRIE? = nil,

      nackie : NACKIE? = nil,

      stopie : STOPIE? = nil,

      tcie : TCIE? = nil,

      errie : ERRIE? = nil,

      dnf : DNF? = nil,

      anfoff : ANFOFF? = nil,

      swrst : Bool? = nil,

      txdmaen : TXDMAEN? = nil,

      rxdmaen : RXDMAEN? = nil,

      sbc : SBC? = nil,

      nostretch : NOSTRETCH? = nil,

      wupen : WUPEN? = nil,

      gcen : GCEN? = nil,

      smbhen : SMBHEN? = nil,

      smbden : SMBDEN? = nil,

      alerten : ALERTEN? = nil,

      pecen : PECEN? = nil
    ) : self
      value = @value

      unless pe.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(pe.to_int).&(0x1_u32) << 0
      end

      unless txie.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(txie.to_int).&(0x1_u32) << 1
      end

      unless rxie.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(rxie.to_int).&(0x1_u32) << 2
      end

      unless addrie.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(addrie.to_int).&(0x1_u32) << 3
      end

      unless nackie.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(nackie.to_int).&(0x1_u32) << 4
      end

      unless stopie.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(stopie.to_int).&(0x1_u32) << 5
      end

      unless tcie.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(tcie.to_int).&(0x1_u32) << 6
      end

      unless errie.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(errie.to_int).&(0x1_u32) << 7
      end

      unless dnf.nil?
        value = (value & 0xfffff0ff_u32) |
                UInt32.new!(dnf.to_int).&(0xf_u32) << 8
      end

      unless anfoff.nil?
        value = (value & 0xffffefff_u32) |
                UInt32.new!(anfoff.to_int).&(0x1_u32) << 12
      end

      unless swrst.nil?
        value = (value & 0xffffdfff_u32) |
                UInt32.new!(swrst.to_int).&(0x1_u32) << 13
      end

      unless txdmaen.nil?
        value = (value & 0xffffbfff_u32) |
                UInt32.new!(txdmaen.to_int).&(0x1_u32) << 14
      end

      unless rxdmaen.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(rxdmaen.to_int).&(0x1_u32) << 15
      end

      unless sbc.nil?
        value = (value & 0xfffeffff_u32) |
                UInt32.new!(sbc.to_int).&(0x1_u32) << 16
      end

      unless nostretch.nil?
        value = (value & 0xfffdffff_u32) |
                UInt32.new!(nostretch.to_int).&(0x1_u32) << 17
      end

      unless wupen.nil?
        value = (value & 0xfffbffff_u32) |
                UInt32.new!(wupen.to_int).&(0x1_u32) << 18
      end

      unless gcen.nil?
        value = (value & 0xfff7ffff_u32) |
                UInt32.new!(gcen.to_int).&(0x1_u32) << 19
      end

      unless smbhen.nil?
        value = (value & 0xffefffff_u32) |
                UInt32.new!(smbhen.to_int).&(0x1_u32) << 20
      end

      unless smbden.nil?
        value = (value & 0xffdfffff_u32) |
                UInt32.new!(smbden.to_int).&(0x1_u32) << 21
      end

      unless alerten.nil?
        value = (value & 0xffbfffff_u32) |
                UInt32.new!(alerten.to_int).&(0x1_u32) << 22
      end

      unless pecen.nil?
        value = (value & 0xff7fffff_u32) |
                UInt32.new!(pecen.to_int).&(0x1_u32) << 23
      end

      self.class.new(value)
    end

    def self.set(
      *,
      pe : PE? = nil,
      txie : TXIE? = nil,
      rxie : RXIE? = nil,
      addrie : ADDRIE? = nil,
      nackie : NACKIE? = nil,
      stopie : STOPIE? = nil,
      tcie : TCIE? = nil,
      errie : ERRIE? = nil,
      dnf : DNF? = nil,
      anfoff : ANFOFF? = nil,
      swrst : Bool? = nil,
      txdmaen : TXDMAEN? = nil,
      rxdmaen : RXDMAEN? = nil,
      sbc : SBC? = nil,
      nostretch : NOSTRETCH? = nil,
      wupen : WUPEN? = nil,
      gcen : GCEN? = nil,
      smbhen : SMBHEN? = nil,
      smbden : SMBDEN? = nil,
      alerten : ALERTEN? = nil,
      pecen : PECEN? = nil
    ) : Nil
      self.value = self.value.copy_with(
        pe: pe,
        txie: txie,
        rxie: rxie,
        addrie: addrie,
        nackie: nackie,
        stopie: stopie,
        tcie: tcie,
        errie: errie,
        dnf: dnf,
        anfoff: anfoff,
        swrst: swrst,
        txdmaen: txdmaen,
        rxdmaen: rxdmaen,
        sbc: sbc,
        nostretch: nostretch,
        wupen: wupen,
        gcen: gcen,
        smbhen: smbhen,
        smbden: smbden,
        alerten: alerten,
        pecen: pecen,
      )
    end
  end # struct

  # Control register 2
  struct CR2
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

    enum PECBYTE : UInt8
      # No PEC transfer
      NOPEC = 0x0_u64

      # PEC transmission/reception is requested
      PEC = 0x1_u64

      def self.reset_value : PECBYTE
        CR2.reset_value.pecbyte
      end
    end

    # Packet error checking byte
    def pecbyte : PECBYTE
      PECBYTE.new!((@value >> 26) & 0x1_u32)
    end

    # Packet error checking byte
    def self.pecbyte : PECBYTE
      value.pecbyte
    end

    # Packet error checking byte
    def self.pecbyte=(value : PECBYTE) : PECBYTE
      self.set(pecbyte: value)
      value
    end

    enum AUTOEND : UInt8
      # Software end mode: TC flag is set when NBYTES data are transferred, stretching SCL low
      SOFTWARE = 0x0_u64

      # Automatic end mode: a STOP condition is automatically sent when NBYTES data are transferred
      AUTOMATIC = 0x1_u64

      def self.reset_value : AUTOEND
        CR2.reset_value.autoend
      end
    end

    # Automatic end mode (master              mode)
    def autoend : AUTOEND
      AUTOEND.new!((@value >> 25) & 0x1_u32)
    end

    # Automatic end mode (master              mode)
    def self.autoend : AUTOEND
      value.autoend
    end

    # Automatic end mode (master              mode)
    def self.autoend=(value : AUTOEND) : AUTOEND
      self.set(autoend: value)
      value
    end

    enum RELOAD : UInt8
      # The transfer is completed after the NBYTES data transfer (STOP or RESTART will follow)
      COMPLETED = 0x0_u64

      # The transfer is not completed after the NBYTES data transfer (NBYTES will be reloaded)
      NOTCOMPLETED = 0x1_u64

      def self.reset_value : RELOAD
        CR2.reset_value.reload
      end
    end

    # NBYTES reload mode
    def reload : RELOAD
      RELOAD.new!((@value >> 24) & 0x1_u32)
    end

    # NBYTES reload mode
    def self.reload : RELOAD
      value.reload
    end

    # NBYTES reload mode
    def self.reload=(value : RELOAD) : RELOAD
      self.set(reload: value)
      value
    end

    # Number of bytes
    def nbytes : UInt8
      UInt8.new!((@value >> 16) & 0xff_u32)
    end

    # Number of bytes
    def self.nbytes : UInt8
      value.nbytes
    end

    # Number of bytes
    def self.nbytes=(value : UInt8) : UInt8
      self.set(nbytes: value)
      value
    end

    enum NACK : UInt8
      # an ACK is sent after current received byte
      ACK = 0x0_u64

      # a NACK is sent after current received byte
      NACK = 0x1_u64

      def self.reset_value : NACK
        CR2.reset_value.nack
      end
    end

    # NACK generation (slave              mode)
    def nack : NACK
      NACK.new!((@value >> 15) & 0x1_u32)
    end

    # NACK generation (slave              mode)
    def self.nack : NACK
      value.nack
    end

    # NACK generation (slave              mode)
    def self.nack=(value : NACK) : NACK
      self.set(nack: value)
      value
    end

    enum STOP : UInt8
      # No Stop generation
      NOSTOP = 0x0_u64

      # Stop generation after current byte transfer
      STOP = 0x1_u64

      def self.reset_value : STOP
        CR2.reset_value.stop
      end
    end

    # Stop generation (master              mode)
    def stop : STOP
      STOP.new!((@value >> 14) & 0x1_u32)
    end

    # Stop generation (master              mode)
    def self.stop : STOP
      value.stop
    end

    # Stop generation (master              mode)
    def self.stop=(value : STOP) : STOP
      self.set(stop: value)
      value
    end

    enum START : UInt8
      # No Start generation
      NOSTART = 0x0_u64

      # Restart/Start generation
      START = 0x1_u64

      def self.reset_value : START
        CR2.reset_value.start
      end
    end

    # Start generation
    def start : START
      START.new!((@value >> 13) & 0x1_u32)
    end

    # Start generation
    def self.start : START
      value.start
    end

    # Start generation
    def self.start=(value : START) : START
      self.set(start: value)
      value
    end

    enum HEAD10R : UInt8
      # The master sends the complete 10 bit slave address read sequence
      COMPLETE = 0x0_u64

      # The master only sends the 1st 7 bits of the 10 bit address, followed by Read direction
      PARTIAL = 0x1_u64

      def self.reset_value : HEAD10R
        CR2.reset_value.head10_r
      end
    end

    # 10-bit address header only read              direction (master receiver mode)
    def head10_r : HEAD10R
      HEAD10R.new!((@value >> 12) & 0x1_u32)
    end

    # 10-bit address header only read              direction (master receiver mode)
    def self.head10_r : HEAD10R
      value.head10_r
    end

    # 10-bit address header only read              direction (master receiver mode)
    def self.head10_r=(value : HEAD10R) : HEAD10R
      self.set(head10_r: value)
      value
    end

    enum ADD10 : UInt8
      # The master operates in 7-bit addressing mode
      BIT7 = 0x0_u64

      # The master operates in 10-bit addressing mode
      BIT10 = 0x1_u64

      def self.reset_value : ADD10
        CR2.reset_value.add10
      end
    end

    # 10-bit addressing mode (master              mode)
    def add10 : ADD10
      ADD10.new!((@value >> 11) & 0x1_u32)
    end

    # 10-bit addressing mode (master              mode)
    def self.add10 : ADD10
      value.add10
    end

    # 10-bit addressing mode (master              mode)
    def self.add10=(value : ADD10) : ADD10
      self.set(add10: value)
      value
    end

    enum RD_WRN : UInt8
      # Master requests a write transfer
      WRITE = 0x0_u64

      # Master requests a read transfer
      READ = 0x1_u64

      def self.reset_value : RD_WRN
        CR2.reset_value.rd_wrn
      end
    end

    # Transfer direction (master              mode)
    def rd_wrn : RD_WRN
      RD_WRN.new!((@value >> 10) & 0x1_u32)
    end

    # Transfer direction (master              mode)
    def self.rd_wrn : RD_WRN
      value.rd_wrn
    end

    # Transfer direction (master              mode)
    def self.rd_wrn=(value : RD_WRN) : RD_WRN
      self.set(rd_wrn: value)
      value
    end

    # Slave address bit 9:8 (master              mode)
    def sadd : UInt16
      UInt16.new!((@value >> 0) & 0x3ff_u32)
    end

    # Slave address bit 9:8 (master              mode)
    def self.sadd : UInt16
      value.sadd
    end

    # Slave address bit 9:8 (master              mode)
    def self.sadd=(value : UInt16) : UInt16
      self.set(sadd: value)
      value
    end

    def copy_with(
      *,

      pecbyte : PECBYTE? = nil,

      autoend : AUTOEND? = nil,

      reload : RELOAD? = nil,

      nbytes : UInt8? = nil,

      nack : NACK? = nil,

      stop : STOP? = nil,

      start : START? = nil,

      head10_r : HEAD10R? = nil,

      add10 : ADD10? = nil,

      rd_wrn : RD_WRN? = nil,

      sadd : UInt16? = nil
    ) : self
      value = @value

      unless pecbyte.nil?
        value = (value & 0xfbffffff_u32) |
                UInt32.new!(pecbyte.to_int).&(0x1_u32) << 26
      end

      unless autoend.nil?
        value = (value & 0xfdffffff_u32) |
                UInt32.new!(autoend.to_int).&(0x1_u32) << 25
      end

      unless reload.nil?
        value = (value & 0xfeffffff_u32) |
                UInt32.new!(reload.to_int).&(0x1_u32) << 24
      end

      unless nbytes.nil?
        value = (value & 0xff00ffff_u32) |
                UInt32.new!(nbytes.to_int).&(0xff_u32) << 16
      end

      unless nack.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(nack.to_int).&(0x1_u32) << 15
      end

      unless stop.nil?
        value = (value & 0xffffbfff_u32) |
                UInt32.new!(stop.to_int).&(0x1_u32) << 14
      end

      unless start.nil?
        value = (value & 0xffffdfff_u32) |
                UInt32.new!(start.to_int).&(0x1_u32) << 13
      end

      unless head10_r.nil?
        value = (value & 0xffffefff_u32) |
                UInt32.new!(head10_r.to_int).&(0x1_u32) << 12
      end

      unless add10.nil?
        value = (value & 0xfffff7ff_u32) |
                UInt32.new!(add10.to_int).&(0x1_u32) << 11
      end

      unless rd_wrn.nil?
        value = (value & 0xfffffbff_u32) |
                UInt32.new!(rd_wrn.to_int).&(0x1_u32) << 10
      end

      unless sadd.nil?
        value = (value & 0xfffffc00_u32) |
                UInt32.new!(sadd.to_int).&(0x3ff_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      pecbyte : PECBYTE? = nil,
      autoend : AUTOEND? = nil,
      reload : RELOAD? = nil,
      nbytes : UInt8? = nil,
      nack : NACK? = nil,
      stop : STOP? = nil,
      start : START? = nil,
      head10_r : HEAD10R? = nil,
      add10 : ADD10? = nil,
      rd_wrn : RD_WRN? = nil,
      sadd : UInt16? = nil
    ) : Nil
      self.value = self.value.copy_with(
        pecbyte: pecbyte,
        autoend: autoend,
        reload: reload,
        nbytes: nbytes,
        nack: nack,
        stop: stop,
        start: start,
        head10_r: head10_r,
        add10: add10,
        rd_wrn: rd_wrn,
        sadd: sadd,
      )
    end
  end # struct

  # Own address register 1
  struct OAR1
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

    enum OA1MODE : UInt8
      # Own address 1 is a 7-bit address
      BIT7 = 0x0_u64

      # Own address 1 is a 10-bit address
      BIT10 = 0x1_u64

      def self.reset_value : OA1MODE
        OAR1.reset_value.oa1_mode
      end
    end

    # Own Address 1 10-bit mode
    def oa1_mode : OA1MODE
      OA1MODE.new!((@value >> 10) & 0x1_u32)
    end

    # Own Address 1 10-bit mode
    def self.oa1_mode : OA1MODE
      value.oa1_mode
    end

    # Own Address 1 10-bit mode
    def self.oa1_mode=(value : OA1MODE) : OA1MODE
      self.set(oa1_mode: value)
      value
    end

    enum OA1EN : UInt8
      # Own address 1 disabled. The received slave address OA1 is NACKed
      DISABLED = 0x0_u64

      # Own address 1 enabled. The received slave address OA1 is ACKed
      ENABLED = 0x1_u64

      def self.reset_value : OA1EN
        OAR1.reset_value.oa1_en
      end
    end

    # Own Address 1 enable
    def oa1_en : OA1EN
      OA1EN.new!((@value >> 15) & 0x1_u32)
    end

    # Own Address 1 enable
    def self.oa1_en : OA1EN
      value.oa1_en
    end

    # Own Address 1 enable
    def self.oa1_en=(value : OA1EN) : OA1EN
      self.set(oa1_en: value)
      value
    end

    # Interface address
    def oa1 : UInt16
      UInt16.new!((@value >> 0) & 0x3ff_u32)
    end

    # Interface address
    def self.oa1 : UInt16
      value.oa1
    end

    # Interface address
    def self.oa1=(value : UInt16) : UInt16
      self.set(oa1: value)
      value
    end

    def copy_with(
      *,

      oa1_mode : OA1MODE? = nil,

      oa1_en : OA1EN? = nil,

      oa1 : UInt16? = nil
    ) : self
      value = @value

      unless oa1_mode.nil?
        value = (value & 0xfffffbff_u32) |
                UInt32.new!(oa1_mode.to_int).&(0x1_u32) << 10
      end

      unless oa1_en.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(oa1_en.to_int).&(0x1_u32) << 15
      end

      unless oa1.nil?
        value = (value & 0xfffffc00_u32) |
                UInt32.new!(oa1.to_int).&(0x3ff_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      oa1_mode : OA1MODE? = nil,
      oa1_en : OA1EN? = nil,
      oa1 : UInt16? = nil
    ) : Nil
      self.value = self.value.copy_with(
        oa1_mode: oa1_mode,
        oa1_en: oa1_en,
        oa1: oa1,
      )
    end
  end # struct

  # Own address register 2
  struct OAR2
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

    # Interface address
    def oa2 : UInt8
      UInt8.new!((@value >> 1) & 0x7f_u32)
    end

    # Interface address
    def self.oa2 : UInt8
      value.oa2
    end

    # Interface address
    def self.oa2=(value : UInt8) : UInt8
      self.set(oa2: value)
      value
    end

    enum OA2MSK : UInt8
      # No mask
      NOMASK = 0x0_u64

      # OA2[1] is masked and don’t care. Only OA2[7:2] are compared
      MASK1 = 0x1_u64

      # OA2[2:1] are masked and don’t care. Only OA2[7:3] are compared
      MASK2 = 0x2_u64

      # OA2[3:1] are masked and don’t care. Only OA2[7:4] are compared
      MASK3 = 0x3_u64

      # OA2[4:1] are masked and don’t care. Only OA2[7:5] are compared
      MASK4 = 0x4_u64

      # OA2[5:1] are masked and don’t care. Only OA2[7:6] are compared
      MASK5 = 0x5_u64

      # OA2[6:1] are masked and don’t care. Only OA2[7] is compared.
      MASK6 = 0x6_u64

      # OA2[7:1] are masked and don’t care. No comparison is done, and all (except reserved) 7-bit received addresses are acknowledged
      MASK7 = 0x7_u64

      def self.reset_value : OA2MSK
        OAR2.reset_value.oa2_msk
      end
    end

    # Own Address 2 masks
    def oa2_msk : OA2MSK
      OA2MSK.new!((@value >> 8) & 0x7_u32)
    end

    # Own Address 2 masks
    def self.oa2_msk : OA2MSK
      value.oa2_msk
    end

    # Own Address 2 masks
    def self.oa2_msk=(value : OA2MSK) : OA2MSK
      self.set(oa2_msk: value)
      value
    end

    enum OA2EN : UInt8
      # Own address 2 disabled. The received slave address OA2 is NACKed
      DISABLED = 0x0_u64

      # Own address 2 enabled. The received slave address OA2 is ACKed
      ENABLED = 0x1_u64

      def self.reset_value : OA2EN
        OAR2.reset_value.oa2_en
      end
    end

    # Own Address 2 enable
    def oa2_en : OA2EN
      OA2EN.new!((@value >> 15) & 0x1_u32)
    end

    # Own Address 2 enable
    def self.oa2_en : OA2EN
      value.oa2_en
    end

    # Own Address 2 enable
    def self.oa2_en=(value : OA2EN) : OA2EN
      self.set(oa2_en: value)
      value
    end

    def copy_with(
      *,

      oa2 : UInt8? = nil,

      oa2_msk : OA2MSK? = nil,

      oa2_en : OA2EN? = nil
    ) : self
      value = @value

      unless oa2.nil?
        value = (value & 0xffffff01_u32) |
                UInt32.new!(oa2.to_int).&(0x7f_u32) << 1
      end

      unless oa2_msk.nil?
        value = (value & 0xfffff8ff_u32) |
                UInt32.new!(oa2_msk.to_int).&(0x7_u32) << 8
      end

      unless oa2_en.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(oa2_en.to_int).&(0x1_u32) << 15
      end

      self.class.new(value)
    end

    def self.set(
      *,
      oa2 : UInt8? = nil,
      oa2_msk : OA2MSK? = nil,
      oa2_en : OA2EN? = nil
    ) : Nil
      self.value = self.value.copy_with(
        oa2: oa2,
        oa2_msk: oa2_msk,
        oa2_en: oa2_en,
      )
    end
  end # struct

  # Timing register
  struct TIMINGR
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

    # SCL low period (master              mode)
    def scll : UInt8
      UInt8.new!((@value >> 0) & 0xff_u32)
    end

    # SCL low period (master              mode)
    def self.scll : UInt8
      value.scll
    end

    # SCL low period (master              mode)
    def self.scll=(value : UInt8) : UInt8
      self.set(scll: value)
      value
    end

    # SCL high period (master              mode)
    def sclh : UInt8
      UInt8.new!((@value >> 8) & 0xff_u32)
    end

    # SCL high period (master              mode)
    def self.sclh : UInt8
      value.sclh
    end

    # SCL high period (master              mode)
    def self.sclh=(value : UInt8) : UInt8
      self.set(sclh: value)
      value
    end

    # Data hold time
    def sdadel : UInt8
      UInt8.new!((@value >> 16) & 0xf_u32)
    end

    # Data hold time
    def self.sdadel : UInt8
      value.sdadel
    end

    # Data hold time
    def self.sdadel=(value : UInt8) : UInt8
      self.set(sdadel: value)
      value
    end

    # Data setup time
    def scldel : UInt8
      UInt8.new!((@value >> 20) & 0xf_u32)
    end

    # Data setup time
    def self.scldel : UInt8
      value.scldel
    end

    # Data setup time
    def self.scldel=(value : UInt8) : UInt8
      self.set(scldel: value)
      value
    end

    # Timing prescaler
    def presc : UInt8
      UInt8.new!((@value >> 28) & 0xf_u32)
    end

    # Timing prescaler
    def self.presc : UInt8
      value.presc
    end

    # Timing prescaler
    def self.presc=(value : UInt8) : UInt8
      self.set(presc: value)
      value
    end

    def copy_with(
      *,

      scll : UInt8? = nil,

      sclh : UInt8? = nil,

      sdadel : UInt8? = nil,

      scldel : UInt8? = nil,

      presc : UInt8? = nil
    ) : self
      value = @value

      unless scll.nil?
        value = (value & 0xffffff00_u32) |
                UInt32.new!(scll.to_int).&(0xff_u32) << 0
      end

      unless sclh.nil?
        value = (value & 0xffff00ff_u32) |
                UInt32.new!(sclh.to_int).&(0xff_u32) << 8
      end

      unless sdadel.nil?
        value = (value & 0xfff0ffff_u32) |
                UInt32.new!(sdadel.to_int).&(0xf_u32) << 16
      end

      unless scldel.nil?
        value = (value & 0xff0fffff_u32) |
                UInt32.new!(scldel.to_int).&(0xf_u32) << 20
      end

      unless presc.nil?
        value = (value & 0xfffffff_u32) |
                UInt32.new!(presc.to_int).&(0xf_u32) << 28
      end

      self.class.new(value)
    end

    def self.set(
      *,
      scll : UInt8? = nil,
      sclh : UInt8? = nil,
      sdadel : UInt8? = nil,
      scldel : UInt8? = nil,
      presc : UInt8? = nil
    ) : Nil
      self.value = self.value.copy_with(
        scll: scll,
        sclh: sclh,
        sdadel: sdadel,
        scldel: scldel,
        presc: presc,
      )
    end
  end # struct

  # Status register 1
  struct TIMEOUTR
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

    # Bus timeout A
    def timeouta : UInt16
      UInt16.new!((@value >> 0) & 0xfff_u32)
    end

    # Bus timeout A
    def self.timeouta : UInt16
      value.timeouta
    end

    # Bus timeout A
    def self.timeouta=(value : UInt16) : UInt16
      self.set(timeouta: value)
      value
    end

    enum TIDLE : UInt8
      # TIMEOUTA is used to detect SCL low timeout
      DISABLED = 0x0_u64

      # TIMEOUTA is used to detect both SCL and SDA high timeout (bus idle condition)
      ENABLED = 0x1_u64

      def self.reset_value : TIDLE
        TIMEOUTR.reset_value.tidle
      end
    end

    # Idle clock timeout              detection
    def tidle : TIDLE
      TIDLE.new!((@value >> 12) & 0x1_u32)
    end

    # Idle clock timeout              detection
    def self.tidle : TIDLE
      value.tidle
    end

    # Idle clock timeout              detection
    def self.tidle=(value : TIDLE) : TIDLE
      self.set(tidle: value)
      value
    end

    enum TIMOUTEN : UInt8
      # SCL timeout detection is disabled
      DISABLED = 0x0_u64

      # SCL timeout detection is enabled
      ENABLED = 0x1_u64

      def self.reset_value : TIMOUTEN
        TIMEOUTR.reset_value.timouten
      end
    end

    # Clock timeout enable
    def timouten : TIMOUTEN
      TIMOUTEN.new!((@value >> 15) & 0x1_u32)
    end

    # Clock timeout enable
    def self.timouten : TIMOUTEN
      value.timouten
    end

    # Clock timeout enable
    def self.timouten=(value : TIMOUTEN) : TIMOUTEN
      self.set(timouten: value)
      value
    end

    # Bus timeout B
    def timeoutb : UInt16
      UInt16.new!((@value >> 16) & 0xfff_u32)
    end

    # Bus timeout B
    def self.timeoutb : UInt16
      value.timeoutb
    end

    # Bus timeout B
    def self.timeoutb=(value : UInt16) : UInt16
      self.set(timeoutb: value)
      value
    end

    enum TEXTEN : UInt8
      # Extended clock timeout detection is disabled
      DISABLED = 0x0_u64

      # Extended clock timeout detection is enabled
      ENABLED = 0x1_u64

      def self.reset_value : TEXTEN
        TIMEOUTR.reset_value.texten
      end
    end

    # Extended clock timeout              enable
    def texten : TEXTEN
      TEXTEN.new!((@value >> 31) & 0x1_u32)
    end

    # Extended clock timeout              enable
    def self.texten : TEXTEN
      value.texten
    end

    # Extended clock timeout              enable
    def self.texten=(value : TEXTEN) : TEXTEN
      self.set(texten: value)
      value
    end

    def copy_with(
      *,

      timeouta : UInt16? = nil,

      tidle : TIDLE? = nil,

      timouten : TIMOUTEN? = nil,

      timeoutb : UInt16? = nil,

      texten : TEXTEN? = nil
    ) : self
      value = @value

      unless timeouta.nil?
        value = (value & 0xfffff000_u32) |
                UInt32.new!(timeouta.to_int).&(0xfff_u32) << 0
      end

      unless tidle.nil?
        value = (value & 0xffffefff_u32) |
                UInt32.new!(tidle.to_int).&(0x1_u32) << 12
      end

      unless timouten.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(timouten.to_int).&(0x1_u32) << 15
      end

      unless timeoutb.nil?
        value = (value & 0xf000ffff_u32) |
                UInt32.new!(timeoutb.to_int).&(0xfff_u32) << 16
      end

      unless texten.nil?
        value = (value & 0x7fffffff_u32) |
                UInt32.new!(texten.to_int).&(0x1_u32) << 31
      end

      self.class.new(value)
    end

    def self.set(
      *,
      timeouta : UInt16? = nil,
      tidle : TIDLE? = nil,
      timouten : TIMOUTEN? = nil,
      timeoutb : UInt16? = nil,
      texten : TEXTEN? = nil
    ) : Nil
      self.value = self.value.copy_with(
        timeouta: timeouta,
        tidle: tidle,
        timouten: timouten,
        timeoutb: timeoutb,
        texten: texten,
      )
    end
  end # struct

  # Interrupt and Status register
  struct ISR
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

    # Address match code (Slave              mode)
    def addcode : UInt8
      UInt8.new!((@value >> 17) & 0x7f_u32)
    end

    # Address match code (Slave              mode)
    def self.addcode : UInt8
      value.addcode
    end

    enum DIR : UInt8
      # Write transfer, slave enters receiver mode
      WRITE = 0x0_u64

      # Read transfer, slave enters transmitter mode
      READ = 0x1_u64

      def self.reset_value : DIR
        ISR.reset_value.dir
      end
    end

    # Transfer direction (Slave              mode)
    def dir : DIR
      DIR.new!((@value >> 16) & 0x1_u32)
    end

    # Transfer direction (Slave              mode)
    def self.dir : DIR
      value.dir
    end

    enum BUSY : UInt8
      # No communication is in progress on the bus
      NOTBUSY = 0x0_u64

      # A communication is in progress on the bus
      BUSY = 0x1_u64

      def self.reset_value : BUSY
        ISR.reset_value.busy
      end
    end

    # Bus busy
    def busy : BUSY
      BUSY.new!((@value >> 15) & 0x1_u32)
    end

    # Bus busy
    def self.busy : BUSY
      value.busy
    end

    enum ALERT : UInt8
      # SMBA alert is not detected
      NOALERT = 0x0_u64

      # SMBA alert event is detected on SMBA pin
      ALERT = 0x1_u64

      def self.reset_value : ALERT
        ISR.reset_value.alert
      end
    end

    # SMBus alert
    def alert : ALERT
      ALERT.new!((@value >> 13) & 0x1_u32)
    end

    # SMBus alert
    def self.alert : ALERT
      value.alert
    end

    enum TIMEOUT : UInt8
      # No timeout occured
      NOTIMEOUT = 0x0_u64

      # Timeout occured
      TIMEOUT = 0x1_u64

      def self.reset_value : TIMEOUT
        ISR.reset_value.timeout
      end
    end

    # Timeout or t_low detection              flag
    def timeout : TIMEOUT
      TIMEOUT.new!((@value >> 12) & 0x1_u32)
    end

    # Timeout or t_low detection              flag
    def self.timeout : TIMEOUT
      value.timeout
    end

    enum PECERR : UInt8
      # Received PEC does match with PEC register
      MATCH = 0x0_u64

      # Received PEC does not match with PEC register
      NOMATCH = 0x1_u64

      def self.reset_value : PECERR
        ISR.reset_value.pecerr
      end
    end

    # PEC Error in reception
    def pecerr : PECERR
      PECERR.new!((@value >> 11) & 0x1_u32)
    end

    # PEC Error in reception
    def self.pecerr : PECERR
      value.pecerr
    end

    enum OVR : UInt8
      # No overrun/underrun error occurs
      NOOVERRUN = 0x0_u64

      # slave mode with NOSTRETCH=1, when an overrun/underrun error occurs
      OVERRUN = 0x1_u64

      def self.reset_value : OVR
        ISR.reset_value.ovr
      end
    end

    # Overrun/Underrun (slave              mode)
    def ovr : OVR
      OVR.new!((@value >> 10) & 0x1_u32)
    end

    # Overrun/Underrun (slave              mode)
    def self.ovr : OVR
      value.ovr
    end

    enum ARLO : UInt8
      # No arbitration lost
      NOTLOST = 0x0_u64

      # Arbitration lost
      LOST = 0x1_u64

      def self.reset_value : ARLO
        ISR.reset_value.arlo
      end
    end

    # Arbitration lost
    def arlo : ARLO
      ARLO.new!((@value >> 9) & 0x1_u32)
    end

    # Arbitration lost
    def self.arlo : ARLO
      value.arlo
    end

    enum BERR : UInt8
      # No bus error
      NOERROR = 0x0_u64

      # Misplaced Start and Stop condition is detected
      ERROR = 0x1_u64

      def self.reset_value : BERR
        ISR.reset_value.berr
      end
    end

    # Bus error
    def berr : BERR
      BERR.new!((@value >> 8) & 0x1_u32)
    end

    # Bus error
    def self.berr : BERR
      value.berr
    end

    enum TCR : UInt8
      # Transfer is not complete
      NOTCOMPLETE = 0x0_u64

      # NBYTES has been transfered
      COMPLETE = 0x1_u64

      def self.reset_value : TCR
        ISR.reset_value.tcr
      end
    end

    # Transfer Complete Reload
    def tcr : TCR
      TCR.new!((@value >> 7) & 0x1_u32)
    end

    # Transfer Complete Reload
    def self.tcr : TCR
      value.tcr
    end

    enum TC : UInt8
      # Transfer is not complete
      NOTCOMPLETE = 0x0_u64

      # NBYTES has been transfered
      COMPLETE = 0x1_u64

      def self.reset_value : TC
        ISR.reset_value.tc
      end
    end

    # Transfer Complete (master              mode)
    def tc : TC
      TC.new!((@value >> 6) & 0x1_u32)
    end

    # Transfer Complete (master              mode)
    def self.tc : TC
      value.tc
    end

    enum STOPF : UInt8
      # No Stop condition detected
      NOSTOP = 0x0_u64

      # Stop condition detected
      STOP = 0x1_u64

      def self.reset_value : STOPF
        ISR.reset_value.stopf
      end
    end

    # Stop detection flag
    def stopf : STOPF
      STOPF.new!((@value >> 5) & 0x1_u32)
    end

    # Stop detection flag
    def self.stopf : STOPF
      value.stopf
    end

    enum NACKF : UInt8
      # No NACK has been received
      NONACK = 0x0_u64

      # NACK has been received
      NACK = 0x1_u64

      def self.reset_value : NACKF
        ISR.reset_value.nackf
      end
    end

    # Not acknowledge received              flag
    def nackf : NACKF
      NACKF.new!((@value >> 4) & 0x1_u32)
    end

    # Not acknowledge received              flag
    def self.nackf : NACKF
      value.nackf
    end

    enum ADDR : UInt8
      # Adress mismatched or not received
      NOTMATCH = 0x0_u64

      # Received slave address matched with one of the enabled slave addresses
      MATCH = 0x1_u64

      def self.reset_value : ADDR
        ISR.reset_value.addr
      end
    end

    # Address matched (slave              mode)
    def addr : ADDR
      ADDR.new!((@value >> 3) & 0x1_u32)
    end

    # Address matched (slave              mode)
    def self.addr : ADDR
      value.addr
    end

    enum RXNE : UInt8
      # The RXDR register is empty
      EMPTY = 0x0_u64

      # Received data is copied into the RXDR register, and is ready to be read
      NOTEMPTY = 0x1_u64

      def self.reset_value : RXNE
        ISR.reset_value.rxne
      end
    end

    # Receive data register not empty              (receivers)
    def rxne : RXNE
      RXNE.new!((@value >> 2) & 0x1_u32)
    end

    # Receive data register not empty              (receivers)
    def self.rxne : RXNE
      value.rxne
    end

    enum TXIS : UInt8
      # The TXDR register is not empty
      NOTEMPTY = 0x0_u64

      # The TXDR register is empty and the data to be transmitted must be written in the TXDR register
      EMPTY = 0x1_u64

      def self.reset_value : TXIS
        ISR.reset_value.txis
      end
    end

    # Transmit interrupt status              (transmitters)
    def txis : TXIS
      TXIS.new!((@value >> 1) & 0x1_u32)
    end

    # Transmit interrupt status              (transmitters)
    def self.txis : TXIS
      value.txis
    end

    # Transmit interrupt status              (transmitters)
    def self.txis=(value : TXIS) : TXIS
      self.set(txis: value)
      value
    end

    enum TXE : UInt8
      # TXDR register not empty
      NOTEMPTY = 0x0_u64

      # TXDR register empty
      EMPTY = 0x1_u64

      def self.reset_value : TXE
        ISR.reset_value.txe
      end
    end

    # Transmit data register empty              (transmitters)
    def txe : TXE
      TXE.new!((@value >> 0) & 0x1_u32)
    end

    # Transmit data register empty              (transmitters)
    def self.txe : TXE
      value.txe
    end

    # Transmit data register empty              (transmitters)
    def self.txe=(value : TXE) : TXE
      self.set(txe: value)
      value
    end

    def copy_with(
      *,

      txis : TXIS? = nil,

      txe : TXE? = nil
    ) : self
      value = @value

      unless txis.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(txis.to_int).&(0x1_u32) << 1
      end

      unless txe.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(txe.to_int).&(0x1_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      txis : TXIS? = nil,
      txe : TXE? = nil
    ) : Nil
      self.value = self.value.copy_with(
        txis: txis,
        txe: txe,
      )
    end
  end # struct

  # Interrupt clear register
  struct ICR
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

    enum ALERTCF : UInt8
      # Clears the ALERT flag in ISR register
      CLEAR = 0x1_u64

      def self.reset_value : ALERTCF
        ICR.reset_value.alertcf
      end
    end

    # Alert flag clear
    def self.alertcf=(value : ALERTCF) : ALERTCF
      self.set(alertcf: value)
      value
    end

    enum TIMOUTCF : UInt8
      # Clears the TIMOUT flag in ISR register
      CLEAR = 0x1_u64

      def self.reset_value : TIMOUTCF
        ICR.reset_value.timoutcf
      end
    end

    # Timeout detection flag              clear
    def self.timoutcf=(value : TIMOUTCF) : TIMOUTCF
      self.set(timoutcf: value)
      value
    end

    enum PECCF : UInt8
      # Clears the PEC flag in ISR register
      CLEAR = 0x1_u64

      def self.reset_value : PECCF
        ICR.reset_value.peccf
      end
    end

    # PEC Error flag clear
    def self.peccf=(value : PECCF) : PECCF
      self.set(peccf: value)
      value
    end

    enum OVRCF : UInt8
      # Clears the OVR flag in ISR register
      CLEAR = 0x1_u64

      def self.reset_value : OVRCF
        ICR.reset_value.ovrcf
      end
    end

    # Overrun/Underrun flag              clear
    def self.ovrcf=(value : OVRCF) : OVRCF
      self.set(ovrcf: value)
      value
    end

    enum ARLOCF : UInt8
      # Clears the ARLO flag in ISR register
      CLEAR = 0x1_u64

      def self.reset_value : ARLOCF
        ICR.reset_value.arlocf
      end
    end

    # Arbitration lost flag              clear
    def self.arlocf=(value : ARLOCF) : ARLOCF
      self.set(arlocf: value)
      value
    end

    enum BERRCF : UInt8
      # Clears the BERR flag in ISR register
      CLEAR = 0x1_u64

      def self.reset_value : BERRCF
        ICR.reset_value.berrcf
      end
    end

    # Bus error flag clear
    def self.berrcf=(value : BERRCF) : BERRCF
      self.set(berrcf: value)
      value
    end

    enum STOPCF : UInt8
      # Clears the STOP flag in ISR register
      CLEAR = 0x1_u64

      def self.reset_value : STOPCF
        ICR.reset_value.stopcf
      end
    end

    # Stop detection flag clear
    def self.stopcf=(value : STOPCF) : STOPCF
      self.set(stopcf: value)
      value
    end

    enum NACKCF : UInt8
      # Clears the NACK flag in ISR register
      CLEAR = 0x1_u64

      def self.reset_value : NACKCF
        ICR.reset_value.nackcf
      end
    end

    # Not Acknowledge flag clear
    def self.nackcf=(value : NACKCF) : NACKCF
      self.set(nackcf: value)
      value
    end

    enum ADDRCF : UInt8
      # Clears the ADDR flag in ISR register
      CLEAR = 0x1_u64

      def self.reset_value : ADDRCF
        ICR.reset_value.addrcf
      end
    end

    # Address Matched flag clear
    def self.addrcf=(value : ADDRCF) : ADDRCF
      self.set(addrcf: value)
      value
    end

    def copy_with(
      *,

      alertcf : ALERTCF? = nil,

      timoutcf : TIMOUTCF? = nil,

      peccf : PECCF? = nil,

      ovrcf : OVRCF? = nil,

      arlocf : ARLOCF? = nil,

      berrcf : BERRCF? = nil,

      stopcf : STOPCF? = nil,

      nackcf : NACKCF? = nil,

      addrcf : ADDRCF? = nil
    ) : self
      value = @value

      unless alertcf.nil?
        value = (value & 0xffffdfff_u32) |
                UInt32.new!(alertcf.to_int).&(0x1_u32) << 13
      end

      unless timoutcf.nil?
        value = (value & 0xffffefff_u32) |
                UInt32.new!(timoutcf.to_int).&(0x1_u32) << 12
      end

      unless peccf.nil?
        value = (value & 0xfffff7ff_u32) |
                UInt32.new!(peccf.to_int).&(0x1_u32) << 11
      end

      unless ovrcf.nil?
        value = (value & 0xfffffbff_u32) |
                UInt32.new!(ovrcf.to_int).&(0x1_u32) << 10
      end

      unless arlocf.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(arlocf.to_int).&(0x1_u32) << 9
      end

      unless berrcf.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(berrcf.to_int).&(0x1_u32) << 8
      end

      unless stopcf.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(stopcf.to_int).&(0x1_u32) << 5
      end

      unless nackcf.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(nackcf.to_int).&(0x1_u32) << 4
      end

      unless addrcf.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(addrcf.to_int).&(0x1_u32) << 3
      end

      self.class.new(value)
    end

    def self.set(
      *,
      alertcf : ALERTCF? = nil,
      timoutcf : TIMOUTCF? = nil,
      peccf : PECCF? = nil,
      ovrcf : OVRCF? = nil,
      arlocf : ARLOCF? = nil,
      berrcf : BERRCF? = nil,
      stopcf : STOPCF? = nil,
      nackcf : NACKCF? = nil,
      addrcf : ADDRCF? = nil
    ) : Nil
      self.value = self.value.copy_with(
        alertcf: alertcf,
        timoutcf: timoutcf,
        peccf: peccf,
        ovrcf: ovrcf,
        arlocf: arlocf,
        berrcf: berrcf,
        stopcf: stopcf,
        nackcf: nackcf,
        addrcf: addrcf,
      )
    end
  end # struct

  # PEC register
  struct PECR
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

    # Packet error checking              register
    def pec : UInt8
      UInt8.new!((@value >> 0) & 0xff_u32)
    end

    # Packet error checking              register
    def self.pec : UInt8
      value.pec
    end
  end # struct

  # Receive data register
  struct RXDR
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

    # 8-bit receive data
    def rxdata : UInt8
      UInt8.new!((@value >> 0) & 0xff_u32)
    end

    # 8-bit receive data
    def self.rxdata : UInt8
      value.rxdata
    end
  end # struct

  # Transmit data register
  struct TXDR
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

    # 8-bit transmit data
    def txdata : UInt8
      UInt8.new!((@value >> 0) & 0xff_u32)
    end

    # 8-bit transmit data
    def self.txdata : UInt8
      value.txdata
    end

    # 8-bit transmit data
    def self.txdata=(value : UInt8) : UInt8
      self.set(txdata: value)
      value
    end

    def copy_with(
      *,

      txdata : UInt8? = nil
    ) : self
      value = @value

      unless txdata.nil?
        value = (value & 0xffffff00_u32) |
                UInt32.new!(txdata.to_int).&(0xff_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      txdata : UInt8? = nil
    ) : Nil
      self.value = self.value.copy_with(
        txdata: txdata,
      )
    end
  end # struct

end
