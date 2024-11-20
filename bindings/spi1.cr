# Serial peripheral interface/Inter-IC      sound
module SPI1
  VERSION      = nil
  BASE_ADDRESS = 0x40013000_u64

  # control register 1
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

    enum BIDIMODE : UInt8
      # 2-line unidirectional data mode selected
      UNIDIRECTIONAL = 0x0_u64

      # 1-line bidirectional data mode selected
      BIDIRECTIONAL = 0x1_u64

      def self.reset_value : BIDIMODE
        CR1.reset_value.bidimode
      end
    end

    # Bidirectional data mode              enable
    def bidimode : BIDIMODE
      BIDIMODE.new!((@value >> 15) & 0x1_u32)
    end

    # Bidirectional data mode              enable
    def self.bidimode : BIDIMODE
      value.bidimode
    end

    # Bidirectional data mode              enable
    def self.bidimode=(value : BIDIMODE) : BIDIMODE
      self.set(bidimode: value)
      value
    end

    enum BIDIOE : UInt8
      # Output disabled (receive-only mode)
      OUTPUTDISABLED = 0x0_u64

      # Output enabled (transmit-only mode)
      OUTPUTENABLED = 0x1_u64

      def self.reset_value : BIDIOE
        CR1.reset_value.bidioe
      end
    end

    # Output enable in bidirectional              mode
    def bidioe : BIDIOE
      BIDIOE.new!((@value >> 14) & 0x1_u32)
    end

    # Output enable in bidirectional              mode
    def self.bidioe : BIDIOE
      value.bidioe
    end

    # Output enable in bidirectional              mode
    def self.bidioe=(value : BIDIOE) : BIDIOE
      self.set(bidioe: value)
      value
    end

    enum CRCEN : UInt8
      # CRC calculation disabled
      DISABLED = 0x0_u64

      # CRC calculation enabled
      ENABLED = 0x1_u64

      def self.reset_value : CRCEN
        CR1.reset_value.crcen
      end
    end

    # Hardware CRC calculation              enable
    def crcen : CRCEN
      CRCEN.new!((@value >> 13) & 0x1_u32)
    end

    # Hardware CRC calculation              enable
    def self.crcen : CRCEN
      value.crcen
    end

    # Hardware CRC calculation              enable
    def self.crcen=(value : CRCEN) : CRCEN
      self.set(crcen: value)
      value
    end

    enum CRCNEXT : UInt8
      # Next transmit value is from Tx buffer
      TXBUFFER = 0x0_u64

      # Next transmit value is from Tx CRC register
      CRC = 0x1_u64

      def self.reset_value : CRCNEXT
        CR1.reset_value.crcnext
      end
    end

    # CRC transfer next
    def crcnext : CRCNEXT
      CRCNEXT.new!((@value >> 12) & 0x1_u32)
    end

    # CRC transfer next
    def self.crcnext : CRCNEXT
      value.crcnext
    end

    # CRC transfer next
    def self.crcnext=(value : CRCNEXT) : CRCNEXT
      self.set(crcnext: value)
      value
    end

    enum CRCL : UInt8
      # 8-bit CRC length
      EIGHTBIT = 0x0_u64

      # 16-bit CRC length
      SIXTEENBIT = 0x1_u64

      def self.reset_value : CRCL
        CR1.reset_value.crcl
      end
    end

    # CRC length
    def crcl : CRCL
      CRCL.new!((@value >> 11) & 0x1_u32)
    end

    # CRC length
    def self.crcl : CRCL
      value.crcl
    end

    # CRC length
    def self.crcl=(value : CRCL) : CRCL
      self.set(crcl: value)
      value
    end

    enum RXONLY : UInt8
      # Full duplex (Transmit and receive)
      FULLDUPLEX = 0x0_u64

      # Output disabled (Receive-only mode)
      OUTPUTDISABLED = 0x1_u64

      def self.reset_value : RXONLY
        CR1.reset_value.rxonly
      end
    end

    # Receive only
    def rxonly : RXONLY
      RXONLY.new!((@value >> 10) & 0x1_u32)
    end

    # Receive only
    def self.rxonly : RXONLY
      value.rxonly
    end

    # Receive only
    def self.rxonly=(value : RXONLY) : RXONLY
      self.set(rxonly: value)
      value
    end

    enum SSM : UInt8
      # Software slave management disabled
      DISABLED = 0x0_u64

      # Software slave management enabled
      ENABLED = 0x1_u64

      def self.reset_value : SSM
        CR1.reset_value.ssm
      end
    end

    # Software slave management
    def ssm : SSM
      SSM.new!((@value >> 9) & 0x1_u32)
    end

    # Software slave management
    def self.ssm : SSM
      value.ssm
    end

    # Software slave management
    def self.ssm=(value : SSM) : SSM
      self.set(ssm: value)
      value
    end

    enum SSI : UInt8
      # 0 is forced onto the NSS pin and the I/O value of the NSS pin is ignored
      SLAVESELECTED = 0x0_u64

      # 1 is forced onto the NSS pin and the I/O value of the NSS pin is ignored
      SLAVENOTSELECTED = 0x1_u64

      def self.reset_value : SSI
        CR1.reset_value.ssi
      end
    end

    # Internal slave select
    def ssi : SSI
      SSI.new!((@value >> 8) & 0x1_u32)
    end

    # Internal slave select
    def self.ssi : SSI
      value.ssi
    end

    # Internal slave select
    def self.ssi=(value : SSI) : SSI
      self.set(ssi: value)
      value
    end

    enum LSBFIRST : UInt8
      # Data is transmitted/received with the MSB first
      MSBFIRST = 0x0_u64

      # Data is transmitted/received with the LSB first
      LSBFIRST = 0x1_u64

      def self.reset_value : LSBFIRST
        CR1.reset_value.lsbfirst
      end
    end

    # Frame format
    def lsbfirst : LSBFIRST
      LSBFIRST.new!((@value >> 7) & 0x1_u32)
    end

    # Frame format
    def self.lsbfirst : LSBFIRST
      value.lsbfirst
    end

    # Frame format
    def self.lsbfirst=(value : LSBFIRST) : LSBFIRST
      self.set(lsbfirst: value)
      value
    end

    enum SPE : UInt8
      # Peripheral disabled
      DISABLED = 0x0_u64

      # Peripheral enabled
      ENABLED = 0x1_u64

      def self.reset_value : SPE
        CR1.reset_value.spe
      end
    end

    # SPI enable
    def spe : SPE
      SPE.new!((@value >> 6) & 0x1_u32)
    end

    # SPI enable
    def self.spe : SPE
      value.spe
    end

    # SPI enable
    def self.spe=(value : SPE) : SPE
      self.set(spe: value)
      value
    end

    enum BR : UInt8
      # f_PCLK / 2
      DIV2 = 0x0_u64

      # f_PCLK / 4
      DIV4 = 0x1_u64

      # f_PCLK / 8
      DIV8 = 0x2_u64

      # f_PCLK / 16
      DIV16 = 0x3_u64

      # f_PCLK / 32
      DIV32 = 0x4_u64

      # f_PCLK / 64
      DIV64 = 0x5_u64

      # f_PCLK / 128
      DIV128 = 0x6_u64

      # f_PCLK / 256
      DIV256 = 0x7_u64

      def self.reset_value : BR
        CR1.reset_value.br
      end
    end

    # Baud rate control
    def br : BR
      BR.new!((@value >> 3) & 0x7_u32)
    end

    # Baud rate control
    def self.br : BR
      value.br
    end

    # Baud rate control
    def self.br=(value : BR) : BR
      self.set(br: value)
      value
    end

    enum MSTR : UInt8
      # Slave configuration
      SLAVE = 0x0_u64

      # Master configuration
      MASTER = 0x1_u64

      def self.reset_value : MSTR
        CR1.reset_value.mstr
      end
    end

    # Master selection
    def mstr : MSTR
      MSTR.new!((@value >> 2) & 0x1_u32)
    end

    # Master selection
    def self.mstr : MSTR
      value.mstr
    end

    # Master selection
    def self.mstr=(value : MSTR) : MSTR
      self.set(mstr: value)
      value
    end

    enum CPOL : UInt8
      # CK to 0 when idle
      IDLELOW = 0x0_u64

      # CK to 1 when idle
      IDLEHIGH = 0x1_u64

      def self.reset_value : CPOL
        CR1.reset_value.cpol
      end
    end

    # Clock polarity
    def cpol : CPOL
      CPOL.new!((@value >> 1) & 0x1_u32)
    end

    # Clock polarity
    def self.cpol : CPOL
      value.cpol
    end

    # Clock polarity
    def self.cpol=(value : CPOL) : CPOL
      self.set(cpol: value)
      value
    end

    enum CPHA : UInt8
      # The first clock transition is the first data capture edge
      FIRSTEDGE = 0x0_u64

      # The second clock transition is the first data capture edge
      SECONDEDGE = 0x1_u64

      def self.reset_value : CPHA
        CR1.reset_value.cpha
      end
    end

    # Clock phase
    def cpha : CPHA
      CPHA.new!((@value >> 0) & 0x1_u32)
    end

    # Clock phase
    def self.cpha : CPHA
      value.cpha
    end

    # Clock phase
    def self.cpha=(value : CPHA) : CPHA
      self.set(cpha: value)
      value
    end

    def copy_with(
      *,

      bidimode : BIDIMODE? = nil,

      bidioe : BIDIOE? = nil,

      crcen : CRCEN? = nil,

      crcnext : CRCNEXT? = nil,

      crcl : CRCL? = nil,

      rxonly : RXONLY? = nil,

      ssm : SSM? = nil,

      ssi : SSI? = nil,

      lsbfirst : LSBFIRST? = nil,

      spe : SPE? = nil,

      br : BR? = nil,

      mstr : MSTR? = nil,

      cpol : CPOL? = nil,

      cpha : CPHA? = nil
    ) : self
      value = @value

      unless bidimode.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(bidimode.to_int).&(0x1_u32) << 15
      end

      unless bidioe.nil?
        value = (value & 0xffffbfff_u32) |
                UInt32.new!(bidioe.to_int).&(0x1_u32) << 14
      end

      unless crcen.nil?
        value = (value & 0xffffdfff_u32) |
                UInt32.new!(crcen.to_int).&(0x1_u32) << 13
      end

      unless crcnext.nil?
        value = (value & 0xffffefff_u32) |
                UInt32.new!(crcnext.to_int).&(0x1_u32) << 12
      end

      unless crcl.nil?
        value = (value & 0xfffff7ff_u32) |
                UInt32.new!(crcl.to_int).&(0x1_u32) << 11
      end

      unless rxonly.nil?
        value = (value & 0xfffffbff_u32) |
                UInt32.new!(rxonly.to_int).&(0x1_u32) << 10
      end

      unless ssm.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(ssm.to_int).&(0x1_u32) << 9
      end

      unless ssi.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(ssi.to_int).&(0x1_u32) << 8
      end

      unless lsbfirst.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(lsbfirst.to_int).&(0x1_u32) << 7
      end

      unless spe.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(spe.to_int).&(0x1_u32) << 6
      end

      unless br.nil?
        value = (value & 0xffffffc7_u32) |
                UInt32.new!(br.to_int).&(0x7_u32) << 3
      end

      unless mstr.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(mstr.to_int).&(0x1_u32) << 2
      end

      unless cpol.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(cpol.to_int).&(0x1_u32) << 1
      end

      unless cpha.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(cpha.to_int).&(0x1_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      bidimode : BIDIMODE? = nil,
      bidioe : BIDIOE? = nil,
      crcen : CRCEN? = nil,
      crcnext : CRCNEXT? = nil,
      crcl : CRCL? = nil,
      rxonly : RXONLY? = nil,
      ssm : SSM? = nil,
      ssi : SSI? = nil,
      lsbfirst : LSBFIRST? = nil,
      spe : SPE? = nil,
      br : BR? = nil,
      mstr : MSTR? = nil,
      cpol : CPOL? = nil,
      cpha : CPHA? = nil
    ) : Nil
      self.value = self.value.copy_with(
        bidimode: bidimode,
        bidioe: bidioe,
        crcen: crcen,
        crcnext: crcnext,
        crcl: crcl,
        rxonly: rxonly,
        ssm: ssm,
        ssi: ssi,
        lsbfirst: lsbfirst,
        spe: spe,
        br: br,
        mstr: mstr,
        cpol: cpol,
        cpha: cpha,
      )
    end
  end # struct

  # control register 2
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

    enum RXDMAEN : UInt8
      # Rx buffer DMA disabled
      DISABLED = 0x0_u64

      # Rx buffer DMA enabled
      ENABLED = 0x1_u64

      def self.reset_value : RXDMAEN
        CR2.reset_value.rxdmaen
      end
    end

    # Rx buffer DMA enable
    def rxdmaen : RXDMAEN
      RXDMAEN.new!((@value >> 0) & 0x1_u32)
    end

    # Rx buffer DMA enable
    def self.rxdmaen : RXDMAEN
      value.rxdmaen
    end

    # Rx buffer DMA enable
    def self.rxdmaen=(value : RXDMAEN) : RXDMAEN
      self.set(rxdmaen: value)
      value
    end

    enum TXDMAEN : UInt8
      # Tx buffer DMA disabled
      DISABLED = 0x0_u64

      # Tx buffer DMA enabled
      ENABLED = 0x1_u64

      def self.reset_value : TXDMAEN
        CR2.reset_value.txdmaen
      end
    end

    # Tx buffer DMA enable
    def txdmaen : TXDMAEN
      TXDMAEN.new!((@value >> 1) & 0x1_u32)
    end

    # Tx buffer DMA enable
    def self.txdmaen : TXDMAEN
      value.txdmaen
    end

    # Tx buffer DMA enable
    def self.txdmaen=(value : TXDMAEN) : TXDMAEN
      self.set(txdmaen: value)
      value
    end

    enum SSOE : UInt8
      # SS output is disabled in master mode
      DISABLED = 0x0_u64

      # SS output is enabled in master mode
      ENABLED = 0x1_u64

      def self.reset_value : SSOE
        CR2.reset_value.ssoe
      end
    end

    # SS output enable
    def ssoe : SSOE
      SSOE.new!((@value >> 2) & 0x1_u32)
    end

    # SS output enable
    def self.ssoe : SSOE
      value.ssoe
    end

    # SS output enable
    def self.ssoe=(value : SSOE) : SSOE
      self.set(ssoe: value)
      value
    end

    enum NSSP : UInt8
      # No NSS pulse
      NOPULSE = 0x0_u64

      # NSS pulse generated
      PULSEGENERATED = 0x1_u64

      def self.reset_value : NSSP
        CR2.reset_value.nssp
      end
    end

    # NSS pulse management
    def nssp : NSSP
      NSSP.new!((@value >> 3) & 0x1_u32)
    end

    # NSS pulse management
    def self.nssp : NSSP
      value.nssp
    end

    # NSS pulse management
    def self.nssp=(value : NSSP) : NSSP
      self.set(nssp: value)
      value
    end

    enum FRF : UInt8
      # SPI Motorola mode
      MOTOROLA = 0x0_u64

      # SPI TI mode
      TI = 0x1_u64

      def self.reset_value : FRF
        CR2.reset_value.frf
      end
    end

    # Frame format
    def frf : FRF
      FRF.new!((@value >> 4) & 0x1_u32)
    end

    # Frame format
    def self.frf : FRF
      value.frf
    end

    # Frame format
    def self.frf=(value : FRF) : FRF
      self.set(frf: value)
      value
    end

    enum ERRIE : UInt8
      # Error interrupt masked
      MASKED = 0x0_u64

      # Error interrupt not masked
      NOTMASKED = 0x1_u64

      def self.reset_value : ERRIE
        CR2.reset_value.errie
      end
    end

    # Error interrupt enable
    def errie : ERRIE
      ERRIE.new!((@value >> 5) & 0x1_u32)
    end

    # Error interrupt enable
    def self.errie : ERRIE
      value.errie
    end

    # Error interrupt enable
    def self.errie=(value : ERRIE) : ERRIE
      self.set(errie: value)
      value
    end

    enum RXNEIE : UInt8
      # RXE interrupt masked
      MASKED = 0x0_u64

      # RXE interrupt not masked
      NOTMASKED = 0x1_u64

      def self.reset_value : RXNEIE
        CR2.reset_value.rxneie
      end
    end

    # RX buffer not empty interrupt              enable
    def rxneie : RXNEIE
      RXNEIE.new!((@value >> 6) & 0x1_u32)
    end

    # RX buffer not empty interrupt              enable
    def self.rxneie : RXNEIE
      value.rxneie
    end

    # RX buffer not empty interrupt              enable
    def self.rxneie=(value : RXNEIE) : RXNEIE
      self.set(rxneie: value)
      value
    end

    enum TXEIE : UInt8
      # TXE interrupt masked
      MASKED = 0x0_u64

      # TXE interrupt not masked
      NOTMASKED = 0x1_u64

      def self.reset_value : TXEIE
        CR2.reset_value.txeie
      end
    end

    # Tx buffer empty interrupt              enable
    def txeie : TXEIE
      TXEIE.new!((@value >> 7) & 0x1_u32)
    end

    # Tx buffer empty interrupt              enable
    def self.txeie : TXEIE
      value.txeie
    end

    # Tx buffer empty interrupt              enable
    def self.txeie=(value : TXEIE) : TXEIE
      self.set(txeie: value)
      value
    end

    enum DS : UInt8
      # 4-bit
      FOURBIT = 0x3_u64

      # 5-bit
      FIVEBIT = 0x4_u64

      # 6-bit
      SIXBIT = 0x5_u64

      # 7-bit
      SEVENBIT = 0x6_u64

      # 8-bit
      EIGHTBIT = 0x7_u64

      # 9-bit
      NINEBIT = 0x8_u64

      # 10-bit
      TENBIT = 0x9_u64

      # 11-bit
      ELEVENBIT = 0xa_u64

      # 12-bit
      TWELVEBIT = 0xb_u64

      # 13-bit
      THIRTEENBIT = 0xc_u64

      # 14-bit
      FOURTEENBIT = 0xd_u64

      # 15-bit
      FIFTEENBIT = 0xe_u64

      # 16-bit
      SIXTEENBIT = 0xf_u64

      def self.reset_value : DS
        CR2.reset_value.ds
      end
    end

    # Data size
    def ds : DS
      DS.new!((@value >> 8) & 0xf_u32)
    end

    # Data size
    def self.ds : DS
      value.ds
    end

    # Data size
    def self.ds=(value : DS) : DS
      self.set(ds: value)
      value
    end

    enum FRXTH : UInt8
      # RXNE event is generated if the FIFO level is greater than or equal to 1/2 (16-bit)
      HALF = 0x0_u64

      # RXNE event is generated if the FIFO level is greater than or equal to 1/4 (8-bit)
      QUARTER = 0x1_u64

      def self.reset_value : FRXTH
        CR2.reset_value.frxth
      end
    end

    # FIFO reception threshold
    def frxth : FRXTH
      FRXTH.new!((@value >> 12) & 0x1_u32)
    end

    # FIFO reception threshold
    def self.frxth : FRXTH
      value.frxth
    end

    # FIFO reception threshold
    def self.frxth=(value : FRXTH) : FRXTH
      self.set(frxth: value)
      value
    end

    enum LDMA_RX : UInt8
      # Number of data to transfer for receive is even
      EVEN = 0x0_u64

      # Number of data to transfer for receive is odd
      ODD = 0x1_u64

      def self.reset_value : LDMA_RX
        CR2.reset_value.ldma_rx
      end
    end

    # Last DMA transfer for              reception
    def ldma_rx : LDMA_RX
      LDMA_RX.new!((@value >> 13) & 0x1_u32)
    end

    # Last DMA transfer for              reception
    def self.ldma_rx : LDMA_RX
      value.ldma_rx
    end

    # Last DMA transfer for              reception
    def self.ldma_rx=(value : LDMA_RX) : LDMA_RX
      self.set(ldma_rx: value)
      value
    end

    enum LDMA_TX : UInt8
      # Number of data to transfer for transmit is even
      EVEN = 0x0_u64

      # Number of data to transfer for transmit is odd
      ODD = 0x1_u64

      def self.reset_value : LDMA_TX
        CR2.reset_value.ldma_tx
      end
    end

    # Last DMA transfer for              transmission
    def ldma_tx : LDMA_TX
      LDMA_TX.new!((@value >> 14) & 0x1_u32)
    end

    # Last DMA transfer for              transmission
    def self.ldma_tx : LDMA_TX
      value.ldma_tx
    end

    # Last DMA transfer for              transmission
    def self.ldma_tx=(value : LDMA_TX) : LDMA_TX
      self.set(ldma_tx: value)
      value
    end

    def copy_with(
      *,

      rxdmaen : RXDMAEN? = nil,

      txdmaen : TXDMAEN? = nil,

      ssoe : SSOE? = nil,

      nssp : NSSP? = nil,

      frf : FRF? = nil,

      errie : ERRIE? = nil,

      rxneie : RXNEIE? = nil,

      txeie : TXEIE? = nil,

      ds : DS? = nil,

      frxth : FRXTH? = nil,

      ldma_rx : LDMA_RX? = nil,

      ldma_tx : LDMA_TX? = nil
    ) : self
      value = @value

      unless rxdmaen.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(rxdmaen.to_int).&(0x1_u32) << 0
      end

      unless txdmaen.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(txdmaen.to_int).&(0x1_u32) << 1
      end

      unless ssoe.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(ssoe.to_int).&(0x1_u32) << 2
      end

      unless nssp.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(nssp.to_int).&(0x1_u32) << 3
      end

      unless frf.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(frf.to_int).&(0x1_u32) << 4
      end

      unless errie.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(errie.to_int).&(0x1_u32) << 5
      end

      unless rxneie.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(rxneie.to_int).&(0x1_u32) << 6
      end

      unless txeie.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(txeie.to_int).&(0x1_u32) << 7
      end

      unless ds.nil?
        value = (value & 0xfffff0ff_u32) |
                UInt32.new!(ds.to_int).&(0xf_u32) << 8
      end

      unless frxth.nil?
        value = (value & 0xffffefff_u32) |
                UInt32.new!(frxth.to_int).&(0x1_u32) << 12
      end

      unless ldma_rx.nil?
        value = (value & 0xffffdfff_u32) |
                UInt32.new!(ldma_rx.to_int).&(0x1_u32) << 13
      end

      unless ldma_tx.nil?
        value = (value & 0xffffbfff_u32) |
                UInt32.new!(ldma_tx.to_int).&(0x1_u32) << 14
      end

      self.class.new(value)
    end

    def self.set(
      *,
      rxdmaen : RXDMAEN? = nil,
      txdmaen : TXDMAEN? = nil,
      ssoe : SSOE? = nil,
      nssp : NSSP? = nil,
      frf : FRF? = nil,
      errie : ERRIE? = nil,
      rxneie : RXNEIE? = nil,
      txeie : TXEIE? = nil,
      ds : DS? = nil,
      frxth : FRXTH? = nil,
      ldma_rx : LDMA_RX? = nil,
      ldma_tx : LDMA_TX? = nil
    ) : Nil
      self.value = self.value.copy_with(
        rxdmaen: rxdmaen,
        txdmaen: txdmaen,
        ssoe: ssoe,
        nssp: nssp,
        frf: frf,
        errie: errie,
        rxneie: rxneie,
        txeie: txeie,
        ds: ds,
        frxth: frxth,
        ldma_rx: ldma_rx,
        ldma_tx: ldma_tx,
      )
    end
  end # struct

  # status register
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
      new(0x2_u64)
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

    enum RXNE : UInt8
      # Rx buffer empty
      EMPTY = 0x0_u64

      # Rx buffer not empty
      NOTEMPTY = 0x1_u64

      def self.reset_value : RXNE
        SR.reset_value.rxne
      end
    end

    # Receive buffer not empty
    def rxne : RXNE
      RXNE.new!((@value >> 0) & 0x1_u32)
    end

    # Receive buffer not empty
    def self.rxne : RXNE
      value.rxne
    end

    enum TXE : UInt8
      # Tx buffer not empty
      NOTEMPTY = 0x0_u64

      # Tx buffer empty
      EMPTY = 0x1_u64

      def self.reset_value : TXE
        SR.reset_value.txe
      end
    end

    # Transmit buffer empty
    def txe : TXE
      TXE.new!((@value >> 1) & 0x1_u32)
    end

    # Transmit buffer empty
    def self.txe : TXE
      value.txe
    end

    enum CHSIDE : UInt8
      # Channel left has to be transmitted or has been received
      LEFT = 0x0_u64

      # Channel right has to be transmitted or has been received
      RIGHT = 0x1_u64

      def self.reset_value : CHSIDE
        SR.reset_value.chside
      end
    end

    # Channel side
    def chside : CHSIDE
      CHSIDE.new!((@value >> 2) & 0x1_u32)
    end

    # Channel side
    def self.chside : CHSIDE
      value.chside
    end

    enum UDR : UInt8
      # No underrun occurred
      NOUNDERRUN = 0x0_u64

      # Underrun occurred
      UNDERRUN = 0x1_u64

      def self.reset_value : UDR
        SR.reset_value.udr
      end
    end

    # Underrun flag
    def udr : UDR
      UDR.new!((@value >> 3) & 0x1_u32)
    end

    # Underrun flag
    def self.udr : UDR
      value.udr
    end

    enum CRCERR : UInt8
      # CRC value received matches the SPIx_RXCRCR value
      MATCH = 0x0_u64

      # CRC value received does not match the SPIx_RXCRCR value
      NOMATCH = 0x1_u64

      def self.reset_value : CRCERR
        SR.reset_value.crcerr
      end
    end

    # CRC error flag
    def crcerr : CRCERR
      CRCERR.new!((@value >> 4) & 0x1_u32)
    end

    # CRC error flag
    def self.crcerr : CRCERR
      value.crcerr
    end

    # CRC error flag
    def self.crcerr=(value : CRCERR) : CRCERR
      self.set(crcerr: value)
      value
    end

    enum MODF : UInt8
      # No mode fault occurred
      NOFAULT = 0x0_u64

      # Mode fault occurred
      FAULT = 0x1_u64

      def self.reset_value : MODF
        SR.reset_value.modf
      end
    end

    # Mode fault
    def modf : MODF
      MODF.new!((@value >> 5) & 0x1_u32)
    end

    # Mode fault
    def self.modf : MODF
      value.modf
    end

    enum OVR : UInt8
      # No overrun occurred
      NOOVERRUN = 0x0_u64

      # Overrun occurred
      OVERRUN = 0x1_u64

      def self.reset_value : OVR
        SR.reset_value.ovr
      end
    end

    # Overrun flag
    def ovr : OVR
      OVR.new!((@value >> 6) & 0x1_u32)
    end

    # Overrun flag
    def self.ovr : OVR
      value.ovr
    end

    enum BSY : UInt8
      # SPI not busy
      NOTBUSY = 0x0_u64

      # SPI busy
      BUSY = 0x1_u64

      def self.reset_value : BSY
        SR.reset_value.bsy
      end
    end

    # Busy flag
    def bsy : BSY
      BSY.new!((@value >> 7) & 0x1_u32)
    end

    # Busy flag
    def self.bsy : BSY
      value.bsy
    end

    enum FRE : UInt8
      # No frame format error
      NOERROR = 0x0_u64

      # A frame format error occurred
      ERROR = 0x1_u64

      def self.reset_value : FRE
        SR.reset_value.fre
      end
    end

    # TI frame format error
    def fre : FRE
      FRE.new!((@value >> 8) & 0x1_u32)
    end

    # TI frame format error
    def self.fre : FRE
      value.fre
    end

    enum FRLVL : UInt8
      # Rx FIFO Empty
      EMPTY = 0x0_u64

      # Rx 1/4 FIFO
      QUARTER = 0x1_u64

      # Rx 1/2 FIFO
      HALF = 0x2_u64

      # Rx FIFO full
      FULL = 0x3_u64

      def self.reset_value : FRLVL
        SR.reset_value.frlvl
      end
    end

    # FIFO reception level
    def frlvl : FRLVL
      FRLVL.new!((@value >> 9) & 0x3_u32)
    end

    # FIFO reception level
    def self.frlvl : FRLVL
      value.frlvl
    end

    enum FTLVL : UInt8
      # Tx FIFO Empty
      EMPTY = 0x0_u64

      # Tx 1/4 FIFO
      QUARTER = 0x1_u64

      # Tx 1/2 FIFO
      HALF = 0x2_u64

      # Tx FIFO full
      FULL = 0x3_u64

      def self.reset_value : FTLVL
        SR.reset_value.ftlvl
      end
    end

    # FIFO transmission level
    def ftlvl : FTLVL
      FTLVL.new!((@value >> 11) & 0x3_u32)
    end

    # FIFO transmission level
    def self.ftlvl : FTLVL
      value.ftlvl
    end

    def copy_with(
      *,

      crcerr : CRCERR? = nil
    ) : self
      value = @value

      unless crcerr.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(crcerr.to_int).&(0x1_u32) << 4
      end

      self.class.new(value)
    end

    def self.set(
      *,
      crcerr : CRCERR? = nil
    ) : Nil
      self.value = self.value.copy_with(
        crcerr: crcerr,
      )
    end
  end # struct

  # data register
  struct DR
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

    # Data register
    def dr : UInt16
      UInt16.new!((@value >> 0) & 0xffff_u32)
    end

    # Data register
    def self.dr : UInt16
      value.dr
    end

    # Data register
    def self.dr=(value : UInt16) : UInt16
      self.set(dr: value)
      value
    end

    def copy_with(
      *,

      dr : UInt16? = nil
    ) : self
      value = @value

      unless dr.nil?
        value = (value & 0xffff0000_u32) |
                UInt32.new!(dr.to_int).&(0xffff_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      dr : UInt16? = nil
    ) : Nil
      self.value = self.value.copy_with(
        dr: dr,
      )
    end
  end # struct

  # CRC polynomial register
  struct CRCPR
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
      new(0x7_u64)
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

    # CRC polynomial register
    def crcpoly : UInt16
      UInt16.new!((@value >> 0) & 0xffff_u32)
    end

    # CRC polynomial register
    def self.crcpoly : UInt16
      value.crcpoly
    end

    # CRC polynomial register
    def self.crcpoly=(value : UInt16) : UInt16
      self.set(crcpoly: value)
      value
    end

    def copy_with(
      *,

      crcpoly : UInt16? = nil
    ) : self
      value = @value

      unless crcpoly.nil?
        value = (value & 0xffff0000_u32) |
                UInt32.new!(crcpoly.to_int).&(0xffff_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      crcpoly : UInt16? = nil
    ) : Nil
      self.value = self.value.copy_with(
        crcpoly: crcpoly,
      )
    end
  end # struct

  # RX CRC register
  struct RXCRCR
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

    # Rx CRC register
    def rx_crc : UInt16
      UInt16.new!((@value >> 0) & 0xffff_u32)
    end

    # Rx CRC register
    def self.rx_crc : UInt16
      value.rx_crc
    end
  end # struct

  # TX CRC register
  struct TXCRCR
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

    # Tx CRC register
    def tx_crc : UInt16
      UInt16.new!((@value >> 0) & 0xffff_u32)
    end

    # Tx CRC register
    def self.tx_crc : UInt16
      value.tx_crc
    end
  end # struct

  # I2S configuration register
  struct I2SCFGR
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

    enum I2SMOD : UInt8
      # SPI mode is selected
      SPIMODE = 0x0_u64

      # I2S mode is selected
      I2SMODE = 0x1_u64

      def self.reset_value : I2SMOD
        I2SCFGR.reset_value.i2_smod
      end
    end

    # I2S mode selection
    def i2_smod : I2SMOD
      I2SMOD.new!((@value >> 11) & 0x1_u32)
    end

    # I2S mode selection
    def self.i2_smod : I2SMOD
      value.i2_smod
    end

    # I2S mode selection
    def self.i2_smod=(value : I2SMOD) : I2SMOD
      self.set(i2_smod: value)
      value
    end

    enum I2SE : UInt8
      # I2S peripheral is disabled
      DISABLED = 0x0_u64

      # I2S peripheral is enabled
      ENABLED = 0x1_u64

      def self.reset_value : I2SE
        I2SCFGR.reset_value.i2_se
      end
    end

    # I2S Enable
    def i2_se : I2SE
      I2SE.new!((@value >> 10) & 0x1_u32)
    end

    # I2S Enable
    def self.i2_se : I2SE
      value.i2_se
    end

    # I2S Enable
    def self.i2_se=(value : I2SE) : I2SE
      self.set(i2_se: value)
      value
    end

    enum I2SCFG : UInt8
      # Slave - transmit
      SLAVETX = 0x0_u64

      # Slave - receive
      SLAVERX = 0x1_u64

      # Master - transmit
      MASTERTX = 0x2_u64

      # Master - receive
      MASTERRX = 0x3_u64

      def self.reset_value : I2SCFG
        I2SCFGR.reset_value.i2_scfg
      end
    end

    # I2S configuration mode
    def i2_scfg : I2SCFG
      I2SCFG.new!((@value >> 8) & 0x3_u32)
    end

    # I2S configuration mode
    def self.i2_scfg : I2SCFG
      value.i2_scfg
    end

    # I2S configuration mode
    def self.i2_scfg=(value : I2SCFG) : I2SCFG
      self.set(i2_scfg: value)
      value
    end

    enum PCMSYNC : UInt8
      # Short frame synchronisation
      SHORT = 0x0_u64

      # Long frame synchronisation
      LONG = 0x1_u64

      def self.reset_value : PCMSYNC
        I2SCFGR.reset_value.pcmsync
      end
    end

    # PCM frame synchronization
    def pcmsync : PCMSYNC
      PCMSYNC.new!((@value >> 7) & 0x1_u32)
    end

    # PCM frame synchronization
    def self.pcmsync : PCMSYNC
      value.pcmsync
    end

    # PCM frame synchronization
    def self.pcmsync=(value : PCMSYNC) : PCMSYNC
      self.set(pcmsync: value)
      value
    end

    enum I2SSTD : UInt8
      # I2S Philips standard
      PHILIPS = 0x0_u64

      # MSB justified standard
      MSB = 0x1_u64

      # LSB justified standard
      LSB = 0x2_u64

      # PCM standard
      PCM = 0x3_u64

      def self.reset_value : I2SSTD
        I2SCFGR.reset_value.i2_sstd
      end
    end

    # I2S standard selection
    def i2_sstd : I2SSTD
      I2SSTD.new!((@value >> 4) & 0x3_u32)
    end

    # I2S standard selection
    def self.i2_sstd : I2SSTD
      value.i2_sstd
    end

    # I2S standard selection
    def self.i2_sstd=(value : I2SSTD) : I2SSTD
      self.set(i2_sstd: value)
      value
    end

    enum CKPOL : UInt8
      # I2S clock inactive state is low level
      IDLELOW = 0x0_u64

      # I2S clock inactive state is high level
      IDLEHIGH = 0x1_u64

      def self.reset_value : CKPOL
        I2SCFGR.reset_value.ckpol
      end
    end

    # Steady state clock              polarity
    def ckpol : CKPOL
      CKPOL.new!((@value >> 3) & 0x1_u32)
    end

    # Steady state clock              polarity
    def self.ckpol : CKPOL
      value.ckpol
    end

    # Steady state clock              polarity
    def self.ckpol=(value : CKPOL) : CKPOL
      self.set(ckpol: value)
      value
    end

    enum DATLEN : UInt8
      # 16-bit data length
      SIXTEENBIT = 0x0_u64

      # 24-bit data length
      TWENTYFOURBIT = 0x1_u64

      # 32-bit data length
      THIRTYTWOBIT = 0x2_u64

      def self.reset_value : DATLEN
        I2SCFGR.reset_value.datlen
      end
    end

    # Data length to be              transferred
    def datlen : DATLEN
      DATLEN.new!((@value >> 1) & 0x3_u32)
    end

    # Data length to be              transferred
    def self.datlen : DATLEN
      value.datlen
    end

    # Data length to be              transferred
    def self.datlen=(value : DATLEN) : DATLEN
      self.set(datlen: value)
      value
    end

    enum CHLEN : UInt8
      # 16-bit wide
      SIXTEENBIT = 0x0_u64

      # 32-bit wide
      THIRTYTWOBIT = 0x1_u64

      def self.reset_value : CHLEN
        I2SCFGR.reset_value.chlen
      end
    end

    # Channel length (number of bits per audio              channel)
    def chlen : CHLEN
      CHLEN.new!((@value >> 0) & 0x1_u32)
    end

    # Channel length (number of bits per audio              channel)
    def self.chlen : CHLEN
      value.chlen
    end

    # Channel length (number of bits per audio              channel)
    def self.chlen=(value : CHLEN) : CHLEN
      self.set(chlen: value)
      value
    end

    def copy_with(
      *,

      i2_smod : I2SMOD? = nil,

      i2_se : I2SE? = nil,

      i2_scfg : I2SCFG? = nil,

      pcmsync : PCMSYNC? = nil,

      i2_sstd : I2SSTD? = nil,

      ckpol : CKPOL? = nil,

      datlen : DATLEN? = nil,

      chlen : CHLEN? = nil
    ) : self
      value = @value

      unless i2_smod.nil?
        value = (value & 0xfffff7ff_u32) |
                UInt32.new!(i2_smod.to_int).&(0x1_u32) << 11
      end

      unless i2_se.nil?
        value = (value & 0xfffffbff_u32) |
                UInt32.new!(i2_se.to_int).&(0x1_u32) << 10
      end

      unless i2_scfg.nil?
        value = (value & 0xfffffcff_u32) |
                UInt32.new!(i2_scfg.to_int).&(0x3_u32) << 8
      end

      unless pcmsync.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(pcmsync.to_int).&(0x1_u32) << 7
      end

      unless i2_sstd.nil?
        value = (value & 0xffffffcf_u32) |
                UInt32.new!(i2_sstd.to_int).&(0x3_u32) << 4
      end

      unless ckpol.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(ckpol.to_int).&(0x1_u32) << 3
      end

      unless datlen.nil?
        value = (value & 0xfffffff9_u32) |
                UInt32.new!(datlen.to_int).&(0x3_u32) << 1
      end

      unless chlen.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(chlen.to_int).&(0x1_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      i2_smod : I2SMOD? = nil,
      i2_se : I2SE? = nil,
      i2_scfg : I2SCFG? = nil,
      pcmsync : PCMSYNC? = nil,
      i2_sstd : I2SSTD? = nil,
      ckpol : CKPOL? = nil,
      datlen : DATLEN? = nil,
      chlen : CHLEN? = nil
    ) : Nil
      self.value = self.value.copy_with(
        i2_smod: i2_smod,
        i2_se: i2_se,
        i2_scfg: i2_scfg,
        pcmsync: pcmsync,
        i2_sstd: i2_sstd,
        ckpol: ckpol,
        datlen: datlen,
        chlen: chlen,
      )
    end
  end # struct

  # I2S prescaler register
  struct I2SPR
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
      new(0x10_u64)
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

    enum MCKOE : UInt8
      # Master clock output is disabled
      DISABLED = 0x0_u64

      # Master clock output is enabled
      ENABLED = 0x1_u64

      def self.reset_value : MCKOE
        I2SPR.reset_value.mckoe
      end
    end

    # Master clock output enable
    def mckoe : MCKOE
      MCKOE.new!((@value >> 9) & 0x1_u32)
    end

    # Master clock output enable
    def self.mckoe : MCKOE
      value.mckoe
    end

    # Master clock output enable
    def self.mckoe=(value : MCKOE) : MCKOE
      self.set(mckoe: value)
      value
    end

    enum ODD : UInt8
      # Real divider value is I2SDIV * 2
      EVEN = 0x0_u64

      # Real divider value is (I2SDIV * 2) + 1
      ODD = 0x1_u64

      def self.reset_value : ODD
        I2SPR.reset_value.odd
      end
    end

    # Odd factor for the              prescaler
    def odd : ODD
      ODD.new!((@value >> 8) & 0x1_u32)
    end

    # Odd factor for the              prescaler
    def self.odd : ODD
      value.odd
    end

    # Odd factor for the              prescaler
    def self.odd=(value : ODD) : ODD
      self.set(odd: value)
      value
    end

    # I2S Linear prescaler
    def i2_sdiv : UInt8
      UInt8.new!((@value >> 0) & 0xff_u32)
    end

    # I2S Linear prescaler
    def self.i2_sdiv : UInt8
      value.i2_sdiv
    end

    # I2S Linear prescaler
    def self.i2_sdiv=(value : UInt8) : UInt8
      self.set(i2_sdiv: value)
      value
    end

    def copy_with(
      *,

      mckoe : MCKOE? = nil,

      odd : ODD? = nil,

      i2_sdiv : UInt8? = nil
    ) : self
      value = @value

      unless mckoe.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(mckoe.to_int).&(0x1_u32) << 9
      end

      unless odd.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(odd.to_int).&(0x1_u32) << 8
      end

      unless i2_sdiv.nil?
        value = (value & 0xffffff00_u32) |
                UInt32.new!(i2_sdiv.to_int).&(0xff_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      mckoe : MCKOE? = nil,
      odd : ODD? = nil,
      i2_sdiv : UInt8? = nil
    ) : Nil
      self.value = self.value.copy_with(
        mckoe: mckoe,
        odd: odd,
        i2_sdiv: i2_sdiv,
      )
    end
  end # struct

end
