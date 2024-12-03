# Serial peripheral interface
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

    # Bidirectional data mode              enable
    def bidimode : Bool
      @value.bits_set?(0x8000_u32)
    end

    # Bidirectional data mode              enable
    def self.bidimode : Bool
      value.bidimode
    end

    # Bidirectional data mode              enable
    def self.bidimode=(value : Bool) : Bool
      self.set(bidimode: value)
      value
    end

    # Output enable in bidirectional              mode
    def bidioe : Bool
      @value.bits_set?(0x4000_u32)
    end

    # Output enable in bidirectional              mode
    def self.bidioe : Bool
      value.bidioe
    end

    # Output enable in bidirectional              mode
    def self.bidioe=(value : Bool) : Bool
      self.set(bidioe: value)
      value
    end

    # Hardware CRC calculation              enable
    def crcen : Bool
      @value.bits_set?(0x2000_u32)
    end

    # Hardware CRC calculation              enable
    def self.crcen : Bool
      value.crcen
    end

    # Hardware CRC calculation              enable
    def self.crcen=(value : Bool) : Bool
      self.set(crcen: value)
      value
    end

    # CRC transfer next
    def crcnext : Bool
      @value.bits_set?(0x1000_u32)
    end

    # CRC transfer next
    def self.crcnext : Bool
      value.crcnext
    end

    # CRC transfer next
    def self.crcnext=(value : Bool) : Bool
      self.set(crcnext: value)
      value
    end

    # Data frame format
    def dff : Bool
      @value.bits_set?(0x800_u32)
    end

    # Data frame format
    def self.dff : Bool
      value.dff
    end

    # Data frame format
    def self.dff=(value : Bool) : Bool
      self.set(dff: value)
      value
    end

    # Receive only
    def rxonly : Bool
      @value.bits_set?(0x400_u32)
    end

    # Receive only
    def self.rxonly : Bool
      value.rxonly
    end

    # Receive only
    def self.rxonly=(value : Bool) : Bool
      self.set(rxonly: value)
      value
    end

    # Software slave management
    def ssm : Bool
      @value.bits_set?(0x200_u32)
    end

    # Software slave management
    def self.ssm : Bool
      value.ssm
    end

    # Software slave management
    def self.ssm=(value : Bool) : Bool
      self.set(ssm: value)
      value
    end

    # Internal slave select
    def ssi : Bool
      @value.bits_set?(0x100_u32)
    end

    # Internal slave select
    def self.ssi : Bool
      value.ssi
    end

    # Internal slave select
    def self.ssi=(value : Bool) : Bool
      self.set(ssi: value)
      value
    end

    # Frame format
    def lsbfirst : Bool
      @value.bits_set?(0x80_u32)
    end

    # Frame format
    def self.lsbfirst : Bool
      value.lsbfirst
    end

    # Frame format
    def self.lsbfirst=(value : Bool) : Bool
      self.set(lsbfirst: value)
      value
    end

    # SPI enable
    def spe : Bool
      @value.bits_set?(0x40_u32)
    end

    # SPI enable
    def self.spe : Bool
      value.spe
    end

    # SPI enable
    def self.spe=(value : Bool) : Bool
      self.set(spe: value)
      value
    end

    # Baud rate control
    def br : UInt8
      UInt8.new!((@value >> 3) & 0x7_u32)
    end

    # Baud rate control
    def self.br : UInt8
      value.br
    end

    # Baud rate control
    def self.br=(value : UInt8) : UInt8
      self.set(br: value)
      value
    end

    # Master selection
    def mstr : Bool
      @value.bits_set?(0x4_u32)
    end

    # Master selection
    def self.mstr : Bool
      value.mstr
    end

    # Master selection
    def self.mstr=(value : Bool) : Bool
      self.set(mstr: value)
      value
    end

    # Clock polarity
    def cpol : Bool
      @value.bits_set?(0x2_u32)
    end

    # Clock polarity
    def self.cpol : Bool
      value.cpol
    end

    # Clock polarity
    def self.cpol=(value : Bool) : Bool
      self.set(cpol: value)
      value
    end

    # Clock phase
    def cpha : Bool
      @value.bits_set?(0x1_u32)
    end

    # Clock phase
    def self.cpha : Bool
      value.cpha
    end

    # Clock phase
    def self.cpha=(value : Bool) : Bool
      self.set(cpha: value)
      value
    end

    def copy_with(
      *,

      bidimode : Bool? = nil,

      bidioe : Bool? = nil,

      crcen : Bool? = nil,

      crcnext : Bool? = nil,

      dff : Bool? = nil,

      rxonly : Bool? = nil,

      ssm : Bool? = nil,

      ssi : Bool? = nil,

      lsbfirst : Bool? = nil,

      spe : Bool? = nil,

      br : UInt8? = nil,

      mstr : Bool? = nil,

      cpol : Bool? = nil,

      cpha : Bool? = nil
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

      unless dff.nil?
        value = (value & 0xfffff7ff_u32) |
                UInt32.new!(dff.to_int).&(0x1_u32) << 11
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
      bidimode : Bool? = nil,
      bidioe : Bool? = nil,
      crcen : Bool? = nil,
      crcnext : Bool? = nil,
      dff : Bool? = nil,
      rxonly : Bool? = nil,
      ssm : Bool? = nil,
      ssi : Bool? = nil,
      lsbfirst : Bool? = nil,
      spe : Bool? = nil,
      br : UInt8? = nil,
      mstr : Bool? = nil,
      cpol : Bool? = nil,
      cpha : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        bidimode: bidimode,
        bidioe: bidioe,
        crcen: crcen,
        crcnext: crcnext,
        dff: dff,
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

    # Tx buffer empty interrupt              enable
    def txeie : Bool
      @value.bits_set?(0x80_u32)
    end

    # Tx buffer empty interrupt              enable
    def self.txeie : Bool
      value.txeie
    end

    # Tx buffer empty interrupt              enable
    def self.txeie=(value : Bool) : Bool
      self.set(txeie: value)
      value
    end

    # RX buffer not empty interrupt              enable
    def rxneie : Bool
      @value.bits_set?(0x40_u32)
    end

    # RX buffer not empty interrupt              enable
    def self.rxneie : Bool
      value.rxneie
    end

    # RX buffer not empty interrupt              enable
    def self.rxneie=(value : Bool) : Bool
      self.set(rxneie: value)
      value
    end

    # Error interrupt enable
    def errie : Bool
      @value.bits_set?(0x20_u32)
    end

    # Error interrupt enable
    def self.errie : Bool
      value.errie
    end

    # Error interrupt enable
    def self.errie=(value : Bool) : Bool
      self.set(errie: value)
      value
    end

    # Frame format
    def frf : Bool
      @value.bits_set?(0x10_u32)
    end

    # Frame format
    def self.frf : Bool
      value.frf
    end

    # Frame format
    def self.frf=(value : Bool) : Bool
      self.set(frf: value)
      value
    end

    # SS output enable
    def ssoe : Bool
      @value.bits_set?(0x4_u32)
    end

    # SS output enable
    def self.ssoe : Bool
      value.ssoe
    end

    # SS output enable
    def self.ssoe=(value : Bool) : Bool
      self.set(ssoe: value)
      value
    end

    # Tx buffer DMA enable
    def txdmaen : Bool
      @value.bits_set?(0x2_u32)
    end

    # Tx buffer DMA enable
    def self.txdmaen : Bool
      value.txdmaen
    end

    # Tx buffer DMA enable
    def self.txdmaen=(value : Bool) : Bool
      self.set(txdmaen: value)
      value
    end

    # Rx buffer DMA enable
    def rxdmaen : Bool
      @value.bits_set?(0x1_u32)
    end

    # Rx buffer DMA enable
    def self.rxdmaen : Bool
      value.rxdmaen
    end

    # Rx buffer DMA enable
    def self.rxdmaen=(value : Bool) : Bool
      self.set(rxdmaen: value)
      value
    end

    def copy_with(
      *,

      txeie : Bool? = nil,

      rxneie : Bool? = nil,

      errie : Bool? = nil,

      frf : Bool? = nil,

      ssoe : Bool? = nil,

      txdmaen : Bool? = nil,

      rxdmaen : Bool? = nil
    ) : self
      value = @value

      unless txeie.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(txeie.to_int).&(0x1_u32) << 7
      end

      unless rxneie.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(rxneie.to_int).&(0x1_u32) << 6
      end

      unless errie.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(errie.to_int).&(0x1_u32) << 5
      end

      unless frf.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(frf.to_int).&(0x1_u32) << 4
      end

      unless ssoe.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(ssoe.to_int).&(0x1_u32) << 2
      end

      unless txdmaen.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(txdmaen.to_int).&(0x1_u32) << 1
      end

      unless rxdmaen.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(rxdmaen.to_int).&(0x1_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      txeie : Bool? = nil,
      rxneie : Bool? = nil,
      errie : Bool? = nil,
      frf : Bool? = nil,
      ssoe : Bool? = nil,
      txdmaen : Bool? = nil,
      rxdmaen : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        txeie: txeie,
        rxneie: rxneie,
        errie: errie,
        frf: frf,
        ssoe: ssoe,
        txdmaen: txdmaen,
        rxdmaen: rxdmaen,
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

    # TI frame format error
    def tifrfe : Bool
      @value.bits_set?(0x100_u32)
    end

    # TI frame format error
    def self.tifrfe : Bool
      value.tifrfe
    end

    # Busy flag
    def bsy : Bool
      @value.bits_set?(0x80_u32)
    end

    # Busy flag
    def self.bsy : Bool
      value.bsy
    end

    # Overrun flag
    def ovr : Bool
      @value.bits_set?(0x40_u32)
    end

    # Overrun flag
    def self.ovr : Bool
      value.ovr
    end

    # Mode fault
    def modf : Bool
      @value.bits_set?(0x20_u32)
    end

    # Mode fault
    def self.modf : Bool
      value.modf
    end

    # CRC error flag
    def crcerr : Bool
      @value.bits_set?(0x10_u32)
    end

    # CRC error flag
    def self.crcerr : Bool
      value.crcerr
    end

    # CRC error flag
    def self.crcerr=(value : Bool) : Bool
      self.set(crcerr: value)
      value
    end

    # Underrun flag
    def udr : Bool
      @value.bits_set?(0x8_u32)
    end

    # Underrun flag
    def self.udr : Bool
      value.udr
    end

    # Channel side
    def chside : Bool
      @value.bits_set?(0x4_u32)
    end

    # Channel side
    def self.chside : Bool
      value.chside
    end

    # Transmit buffer empty
    def txe : Bool
      @value.bits_set?(0x2_u32)
    end

    # Transmit buffer empty
    def self.txe : Bool
      value.txe
    end

    # Receive buffer not empty
    def rxne : Bool
      @value.bits_set?(0x1_u32)
    end

    # Receive buffer not empty
    def self.rxne : Bool
      value.rxne
    end

    def copy_with(
      *,

      crcerr : Bool? = nil
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
      crcerr : Bool? = nil
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

    # I2S mode selection
    def i2_smod : Bool
      @value.bits_set?(0x800_u32)
    end

    # I2S mode selection
    def self.i2_smod : Bool
      value.i2_smod
    end

    # I2S mode selection
    def self.i2_smod=(value : Bool) : Bool
      self.set(i2_smod: value)
      value
    end

    # I2S Enable
    def i2_se : Bool
      @value.bits_set?(0x400_u32)
    end

    # I2S Enable
    def self.i2_se : Bool
      value.i2_se
    end

    # I2S Enable
    def self.i2_se=(value : Bool) : Bool
      self.set(i2_se: value)
      value
    end

    # I2S configuration mode
    def i2_scfg : UInt8
      UInt8.new!((@value >> 8) & 0x3_u32)
    end

    # I2S configuration mode
    def self.i2_scfg : UInt8
      value.i2_scfg
    end

    # I2S configuration mode
    def self.i2_scfg=(value : UInt8) : UInt8
      self.set(i2_scfg: value)
      value
    end

    # PCM frame synchronization
    def pcmsync : Bool
      @value.bits_set?(0x80_u32)
    end

    # PCM frame synchronization
    def self.pcmsync : Bool
      value.pcmsync
    end

    # PCM frame synchronization
    def self.pcmsync=(value : Bool) : Bool
      self.set(pcmsync: value)
      value
    end

    # I2S standard selection
    def i2_sstd : UInt8
      UInt8.new!((@value >> 4) & 0x3_u32)
    end

    # I2S standard selection
    def self.i2_sstd : UInt8
      value.i2_sstd
    end

    # I2S standard selection
    def self.i2_sstd=(value : UInt8) : UInt8
      self.set(i2_sstd: value)
      value
    end

    # Steady state clock              polarity
    def ckpol : Bool
      @value.bits_set?(0x8_u32)
    end

    # Steady state clock              polarity
    def self.ckpol : Bool
      value.ckpol
    end

    # Steady state clock              polarity
    def self.ckpol=(value : Bool) : Bool
      self.set(ckpol: value)
      value
    end

    # Data length to be              transferred
    def datlen : UInt8
      UInt8.new!((@value >> 1) & 0x3_u32)
    end

    # Data length to be              transferred
    def self.datlen : UInt8
      value.datlen
    end

    # Data length to be              transferred
    def self.datlen=(value : UInt8) : UInt8
      self.set(datlen: value)
      value
    end

    # Channel length (number of bits per audio              channel)
    def chlen : Bool
      @value.bits_set?(0x1_u32)
    end

    # Channel length (number of bits per audio              channel)
    def self.chlen : Bool
      value.chlen
    end

    # Channel length (number of bits per audio              channel)
    def self.chlen=(value : Bool) : Bool
      self.set(chlen: value)
      value
    end

    def copy_with(
      *,

      i2_smod : Bool? = nil,

      i2_se : Bool? = nil,

      i2_scfg : UInt8? = nil,

      pcmsync : Bool? = nil,

      i2_sstd : UInt8? = nil,

      ckpol : Bool? = nil,

      datlen : UInt8? = nil,

      chlen : Bool? = nil
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
      i2_smod : Bool? = nil,
      i2_se : Bool? = nil,
      i2_scfg : UInt8? = nil,
      pcmsync : Bool? = nil,
      i2_sstd : UInt8? = nil,
      ckpol : Bool? = nil,
      datlen : UInt8? = nil,
      chlen : Bool? = nil
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
      new(0xa_u64)
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

    # Master clock output enable
    def mckoe : Bool
      @value.bits_set?(0x200_u32)
    end

    # Master clock output enable
    def self.mckoe : Bool
      value.mckoe
    end

    # Master clock output enable
    def self.mckoe=(value : Bool) : Bool
      self.set(mckoe: value)
      value
    end

    # Odd factor for the              prescaler
    def odd : Bool
      @value.bits_set?(0x100_u32)
    end

    # Odd factor for the              prescaler
    def self.odd : Bool
      value.odd
    end

    # Odd factor for the              prescaler
    def self.odd=(value : Bool) : Bool
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

      mckoe : Bool? = nil,

      odd : Bool? = nil,

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
      mckoe : Bool? = nil,
      odd : Bool? = nil,
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
