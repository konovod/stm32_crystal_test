# Hash processor
module HASH
  VERSION      = nil
  BASE_ADDRESS = 0x50060400_u64

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

    # Initialize message digest              calculation
    def self.init=(value : Bool) : Bool
      self.set(init: value)
      value
    end

    # DMA enable
    def dmae : Bool
      @value.bits_set?(0x8_u32)
    end

    # DMA enable
    def self.dmae : Bool
      value.dmae
    end

    # DMA enable
    def self.dmae=(value : Bool) : Bool
      self.set(dmae: value)
      value
    end

    # Data type selection
    def datatype : UInt8
      UInt8.new!((@value >> 4) & 0x3_u32)
    end

    # Data type selection
    def self.datatype : UInt8
      value.datatype
    end

    # Data type selection
    def self.datatype=(value : UInt8) : UInt8
      self.set(datatype: value)
      value
    end

    # Mode selection
    def mode : Bool
      @value.bits_set?(0x40_u32)
    end

    # Mode selection
    def self.mode : Bool
      value.mode
    end

    # Mode selection
    def self.mode=(value : Bool) : Bool
      self.set(mode: value)
      value
    end

    # Algorithm selection
    def algo0 : Bool
      @value.bits_set?(0x80_u32)
    end

    # Algorithm selection
    def self.algo0 : Bool
      value.algo0
    end

    # Algorithm selection
    def self.algo0=(value : Bool) : Bool
      self.set(algo0: value)
      value
    end

    # Number of words already              pushed
    def nbw : UInt8
      UInt8.new!((@value >> 8) & 0xf_u32)
    end

    # Number of words already              pushed
    def self.nbw : UInt8
      value.nbw
    end

    # DIN not empty
    def dinne : Bool
      @value.bits_set?(0x1000_u32)
    end

    # DIN not empty
    def self.dinne : Bool
      value.dinne
    end

    # Multiple DMA Transfers
    def mdmat : Bool
      @value.bits_set?(0x2000_u32)
    end

    # Multiple DMA Transfers
    def self.mdmat : Bool
      value.mdmat
    end

    # Multiple DMA Transfers
    def self.mdmat=(value : Bool) : Bool
      self.set(mdmat: value)
      value
    end

    # Long key selection
    def lkey : Bool
      @value.bits_set?(0x10000_u32)
    end

    # Long key selection
    def self.lkey : Bool
      value.lkey
    end

    # Long key selection
    def self.lkey=(value : Bool) : Bool
      self.set(lkey: value)
      value
    end

    # ALGO
    def algo1 : Bool
      @value.bits_set?(0x40000_u32)
    end

    # ALGO
    def self.algo1 : Bool
      value.algo1
    end

    # ALGO
    def self.algo1=(value : Bool) : Bool
      self.set(algo1: value)
      value
    end

    def copy_with(
      *,

      init : Bool? = nil,

      dmae : Bool? = nil,

      datatype : UInt8? = nil,

      mode : Bool? = nil,

      algo0 : Bool? = nil,

      mdmat : Bool? = nil,

      lkey : Bool? = nil,

      algo1 : Bool? = nil
    ) : self
      value = @value

      unless init.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(init.to_int).&(0x1_u32) << 2
      end

      unless dmae.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(dmae.to_int).&(0x1_u32) << 3
      end

      unless datatype.nil?
        value = (value & 0xffffffcf_u32) |
                UInt32.new!(datatype.to_int).&(0x3_u32) << 4
      end

      unless mode.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(mode.to_int).&(0x1_u32) << 6
      end

      unless algo0.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(algo0.to_int).&(0x1_u32) << 7
      end

      unless mdmat.nil?
        value = (value & 0xffffdfff_u32) |
                UInt32.new!(mdmat.to_int).&(0x1_u32) << 13
      end

      unless lkey.nil?
        value = (value & 0xfffeffff_u32) |
                UInt32.new!(lkey.to_int).&(0x1_u32) << 16
      end

      unless algo1.nil?
        value = (value & 0xfffbffff_u32) |
                UInt32.new!(algo1.to_int).&(0x1_u32) << 18
      end

      self.class.new(value)
    end

    def self.set(
      *,
      init : Bool? = nil,
      dmae : Bool? = nil,
      datatype : UInt8? = nil,
      mode : Bool? = nil,
      algo0 : Bool? = nil,
      mdmat : Bool? = nil,
      lkey : Bool? = nil,
      algo1 : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        init: init,
        dmae: dmae,
        datatype: datatype,
        mode: mode,
        algo0: algo0,
        mdmat: mdmat,
        lkey: lkey,
        algo1: algo1,
      )
    end
  end # struct

  # data input register
  struct DIN
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

    # Data input
    def datain : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # Data input
    def self.datain : UInt32
      value.datain
    end

    # Data input
    def self.datain=(value : UInt32) : UInt32
      self.set(datain: value)
      value
    end

    def copy_with(
      *,

      datain : UInt32? = nil
    ) : self
      value = @value

      unless datain.nil?
        value = (value & 0xffffffff_u32) |
                UInt32.new!(datain.to_int).&(0x0_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      datain : UInt32? = nil
    ) : Nil
      self.value = self.value.copy_with(
        datain: datain,
      )
    end
  end # struct

  # start register
  struct STR
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

    # Digest calculation
    def self.dcal=(value : Bool) : Bool
      self.set(dcal: value)
      value
    end

    # Number of valid bits in the last word of              the message
    def nblw : UInt8
      UInt8.new!((@value >> 0) & 0x1f_u32)
    end

    # Number of valid bits in the last word of              the message
    def self.nblw : UInt8
      value.nblw
    end

    # Number of valid bits in the last word of              the message
    def self.nblw=(value : UInt8) : UInt8
      self.set(nblw: value)
      value
    end

    def copy_with(
      *,

      dcal : Bool? = nil,

      nblw : UInt8? = nil
    ) : self
      value = @value

      unless dcal.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(dcal.to_int).&(0x1_u32) << 8
      end

      unless nblw.nil?
        value = (value & 0xffffffe0_u32) |
                UInt32.new!(nblw.to_int).&(0x1f_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      dcal : Bool? = nil,
      nblw : UInt8? = nil
    ) : Nil
      self.value = self.value.copy_with(
        dcal: dcal,
        nblw: nblw,
      )
    end
  end # struct

  # digest registers
  struct HR0
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

    # H0
    def h0 : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # H0
    def self.h0 : UInt32
      value.h0
    end
  end # struct

  # digest registers
  struct HR1
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

    # H1
    def h1 : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # H1
    def self.h1 : UInt32
      value.h1
    end
  end # struct

  # digest registers
  struct HR2
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

    # H2
    def h2 : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # H2
    def self.h2 : UInt32
      value.h2
    end
  end # struct

  # digest registers
  struct HR3
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

    # H3
    def h3 : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # H3
    def self.h3 : UInt32
      value.h3
    end
  end # struct

  # digest registers
  struct HR4
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

    # H4
    def h4 : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # H4
    def self.h4 : UInt32
      value.h4
    end
  end # struct

  # interrupt enable register
  struct IMR
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

    # Digest calculation completion interrupt              enable
    def dcie : Bool
      @value.bits_set?(0x2_u32)
    end

    # Digest calculation completion interrupt              enable
    def self.dcie : Bool
      value.dcie
    end

    # Digest calculation completion interrupt              enable
    def self.dcie=(value : Bool) : Bool
      self.set(dcie: value)
      value
    end

    # Data input interrupt              enable
    def dinie : Bool
      @value.bits_set?(0x1_u32)
    end

    # Data input interrupt              enable
    def self.dinie : Bool
      value.dinie
    end

    # Data input interrupt              enable
    def self.dinie=(value : Bool) : Bool
      self.set(dinie: value)
      value
    end

    def copy_with(
      *,

      dcie : Bool? = nil,

      dinie : Bool? = nil
    ) : self
      value = @value

      unless dcie.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(dcie.to_int).&(0x1_u32) << 1
      end

      unless dinie.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(dinie.to_int).&(0x1_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      dcie : Bool? = nil,
      dinie : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        dcie: dcie,
        dinie: dinie,
      )
    end
  end # struct

  # status register
  struct SR
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

    # Busy bit
    def busy : Bool
      @value.bits_set?(0x8_u32)
    end

    # Busy bit
    def self.busy : Bool
      value.busy
    end

    # DMA Status
    def dmas : Bool
      @value.bits_set?(0x4_u32)
    end

    # DMA Status
    def self.dmas : Bool
      value.dmas
    end

    # Digest calculation completion interrupt              status
    def dcis : Bool
      @value.bits_set?(0x2_u32)
    end

    # Digest calculation completion interrupt              status
    def self.dcis : Bool
      value.dcis
    end

    # Digest calculation completion interrupt              status
    def self.dcis=(value : Bool) : Bool
      self.set(dcis: value)
      value
    end

    # Data input interrupt              status
    def dinis : Bool
      @value.bits_set?(0x1_u32)
    end

    # Data input interrupt              status
    def self.dinis : Bool
      value.dinis
    end

    # Data input interrupt              status
    def self.dinis=(value : Bool) : Bool
      self.set(dinis: value)
      value
    end

    def copy_with(
      *,

      dcis : Bool? = nil,

      dinis : Bool? = nil
    ) : self
      value = @value

      unless dcis.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(dcis.to_int).&(0x1_u32) << 1
      end

      unless dinis.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(dinis.to_int).&(0x1_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      dcis : Bool? = nil,
      dinis : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        dcis: dcis,
        dinis: dinis,
      )
    end
  end # struct

  # context swap registers
  struct CSR0
    ADDRESS = BASE_ADDRESS + 0xf8_u64

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

    # CSR0
    def csr0 : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # CSR0
    def self.csr0 : UInt32
      value.csr0
    end

    # CSR0
    def self.csr0=(value : UInt32) : UInt32
      self.set(csr0: value)
      value
    end

    def copy_with(
      *,

      csr0 : UInt32? = nil
    ) : self
      value = @value

      unless csr0.nil?
        value = (value & 0xffffffff_u32) |
                UInt32.new!(csr0.to_int).&(0x0_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      csr0 : UInt32? = nil
    ) : Nil
      self.value = self.value.copy_with(
        csr0: csr0,
      )
    end
  end # struct

  # context swap registers
  struct CSR1
    ADDRESS = BASE_ADDRESS + 0xfc_u64

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

    # CSR1
    def csr1 : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # CSR1
    def self.csr1 : UInt32
      value.csr1
    end

    # CSR1
    def self.csr1=(value : UInt32) : UInt32
      self.set(csr1: value)
      value
    end

    def copy_with(
      *,

      csr1 : UInt32? = nil
    ) : self
      value = @value

      unless csr1.nil?
        value = (value & 0xffffffff_u32) |
                UInt32.new!(csr1.to_int).&(0x0_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      csr1 : UInt32? = nil
    ) : Nil
      self.value = self.value.copy_with(
        csr1: csr1,
      )
    end
  end # struct

  # context swap registers
  struct CSR2
    ADDRESS = BASE_ADDRESS + 0x100_u64

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

    # CSR2
    def csr2 : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # CSR2
    def self.csr2 : UInt32
      value.csr2
    end

    # CSR2
    def self.csr2=(value : UInt32) : UInt32
      self.set(csr2: value)
      value
    end

    def copy_with(
      *,

      csr2 : UInt32? = nil
    ) : self
      value = @value

      unless csr2.nil?
        value = (value & 0xffffffff_u32) |
                UInt32.new!(csr2.to_int).&(0x0_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      csr2 : UInt32? = nil
    ) : Nil
      self.value = self.value.copy_with(
        csr2: csr2,
      )
    end
  end # struct

  # context swap registers
  struct CSR3
    ADDRESS = BASE_ADDRESS + 0x104_u64

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

    # CSR3
    def csr3 : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # CSR3
    def self.csr3 : UInt32
      value.csr3
    end

    # CSR3
    def self.csr3=(value : UInt32) : UInt32
      self.set(csr3: value)
      value
    end

    def copy_with(
      *,

      csr3 : UInt32? = nil
    ) : self
      value = @value

      unless csr3.nil?
        value = (value & 0xffffffff_u32) |
                UInt32.new!(csr3.to_int).&(0x0_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      csr3 : UInt32? = nil
    ) : Nil
      self.value = self.value.copy_with(
        csr3: csr3,
      )
    end
  end # struct

  # context swap registers
  struct CSR4
    ADDRESS = BASE_ADDRESS + 0x108_u64

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

    # CSR4
    def csr4 : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # CSR4
    def self.csr4 : UInt32
      value.csr4
    end

    # CSR4
    def self.csr4=(value : UInt32) : UInt32
      self.set(csr4: value)
      value
    end

    def copy_with(
      *,

      csr4 : UInt32? = nil
    ) : self
      value = @value

      unless csr4.nil?
        value = (value & 0xffffffff_u32) |
                UInt32.new!(csr4.to_int).&(0x0_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      csr4 : UInt32? = nil
    ) : Nil
      self.value = self.value.copy_with(
        csr4: csr4,
      )
    end
  end # struct

  # context swap registers
  struct CSR5
    ADDRESS = BASE_ADDRESS + 0x10c_u64

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

    # CSR5
    def csr5 : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # CSR5
    def self.csr5 : UInt32
      value.csr5
    end

    # CSR5
    def self.csr5=(value : UInt32) : UInt32
      self.set(csr5: value)
      value
    end

    def copy_with(
      *,

      csr5 : UInt32? = nil
    ) : self
      value = @value

      unless csr5.nil?
        value = (value & 0xffffffff_u32) |
                UInt32.new!(csr5.to_int).&(0x0_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      csr5 : UInt32? = nil
    ) : Nil
      self.value = self.value.copy_with(
        csr5: csr5,
      )
    end
  end # struct

  # context swap registers
  struct CSR6
    ADDRESS = BASE_ADDRESS + 0x110_u64

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

    # CSR6
    def csr6 : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # CSR6
    def self.csr6 : UInt32
      value.csr6
    end

    # CSR6
    def self.csr6=(value : UInt32) : UInt32
      self.set(csr6: value)
      value
    end

    def copy_with(
      *,

      csr6 : UInt32? = nil
    ) : self
      value = @value

      unless csr6.nil?
        value = (value & 0xffffffff_u32) |
                UInt32.new!(csr6.to_int).&(0x0_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      csr6 : UInt32? = nil
    ) : Nil
      self.value = self.value.copy_with(
        csr6: csr6,
      )
    end
  end # struct

  # context swap registers
  struct CSR7
    ADDRESS = BASE_ADDRESS + 0x114_u64

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

    # CSR7
    def csr7 : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # CSR7
    def self.csr7 : UInt32
      value.csr7
    end

    # CSR7
    def self.csr7=(value : UInt32) : UInt32
      self.set(csr7: value)
      value
    end

    def copy_with(
      *,

      csr7 : UInt32? = nil
    ) : self
      value = @value

      unless csr7.nil?
        value = (value & 0xffffffff_u32) |
                UInt32.new!(csr7.to_int).&(0x0_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      csr7 : UInt32? = nil
    ) : Nil
      self.value = self.value.copy_with(
        csr7: csr7,
      )
    end
  end # struct

  # context swap registers
  struct CSR8
    ADDRESS = BASE_ADDRESS + 0x118_u64

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

    # CSR8
    def csr8 : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # CSR8
    def self.csr8 : UInt32
      value.csr8
    end

    # CSR8
    def self.csr8=(value : UInt32) : UInt32
      self.set(csr8: value)
      value
    end

    def copy_with(
      *,

      csr8 : UInt32? = nil
    ) : self
      value = @value

      unless csr8.nil?
        value = (value & 0xffffffff_u32) |
                UInt32.new!(csr8.to_int).&(0x0_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      csr8 : UInt32? = nil
    ) : Nil
      self.value = self.value.copy_with(
        csr8: csr8,
      )
    end
  end # struct

  # context swap registers
  struct CSR9
    ADDRESS = BASE_ADDRESS + 0x11c_u64

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

    # CSR9
    def csr9 : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # CSR9
    def self.csr9 : UInt32
      value.csr9
    end

    # CSR9
    def self.csr9=(value : UInt32) : UInt32
      self.set(csr9: value)
      value
    end

    def copy_with(
      *,

      csr9 : UInt32? = nil
    ) : self
      value = @value

      unless csr9.nil?
        value = (value & 0xffffffff_u32) |
                UInt32.new!(csr9.to_int).&(0x0_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      csr9 : UInt32? = nil
    ) : Nil
      self.value = self.value.copy_with(
        csr9: csr9,
      )
    end
  end # struct

  # context swap registers
  struct CSR10
    ADDRESS = BASE_ADDRESS + 0x120_u64

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

    # CSR10
    def csr10 : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # CSR10
    def self.csr10 : UInt32
      value.csr10
    end

    # CSR10
    def self.csr10=(value : UInt32) : UInt32
      self.set(csr10: value)
      value
    end

    def copy_with(
      *,

      csr10 : UInt32? = nil
    ) : self
      value = @value

      unless csr10.nil?
        value = (value & 0xffffffff_u32) |
                UInt32.new!(csr10.to_int).&(0x0_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      csr10 : UInt32? = nil
    ) : Nil
      self.value = self.value.copy_with(
        csr10: csr10,
      )
    end
  end # struct

  # context swap registers
  struct CSR11
    ADDRESS = BASE_ADDRESS + 0x124_u64

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

    # CSR11
    def csr11 : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # CSR11
    def self.csr11 : UInt32
      value.csr11
    end

    # CSR11
    def self.csr11=(value : UInt32) : UInt32
      self.set(csr11: value)
      value
    end

    def copy_with(
      *,

      csr11 : UInt32? = nil
    ) : self
      value = @value

      unless csr11.nil?
        value = (value & 0xffffffff_u32) |
                UInt32.new!(csr11.to_int).&(0x0_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      csr11 : UInt32? = nil
    ) : Nil
      self.value = self.value.copy_with(
        csr11: csr11,
      )
    end
  end # struct

  # context swap registers
  struct CSR12
    ADDRESS = BASE_ADDRESS + 0x128_u64

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

    # CSR12
    def csr12 : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # CSR12
    def self.csr12 : UInt32
      value.csr12
    end

    # CSR12
    def self.csr12=(value : UInt32) : UInt32
      self.set(csr12: value)
      value
    end

    def copy_with(
      *,

      csr12 : UInt32? = nil
    ) : self
      value = @value

      unless csr12.nil?
        value = (value & 0xffffffff_u32) |
                UInt32.new!(csr12.to_int).&(0x0_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      csr12 : UInt32? = nil
    ) : Nil
      self.value = self.value.copy_with(
        csr12: csr12,
      )
    end
  end # struct

  # context swap registers
  struct CSR13
    ADDRESS = BASE_ADDRESS + 0x12c_u64

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

    # CSR13
    def csr13 : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # CSR13
    def self.csr13 : UInt32
      value.csr13
    end

    # CSR13
    def self.csr13=(value : UInt32) : UInt32
      self.set(csr13: value)
      value
    end

    def copy_with(
      *,

      csr13 : UInt32? = nil
    ) : self
      value = @value

      unless csr13.nil?
        value = (value & 0xffffffff_u32) |
                UInt32.new!(csr13.to_int).&(0x0_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      csr13 : UInt32? = nil
    ) : Nil
      self.value = self.value.copy_with(
        csr13: csr13,
      )
    end
  end # struct

  # context swap registers
  struct CSR14
    ADDRESS = BASE_ADDRESS + 0x130_u64

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

    # CSR14
    def csr14 : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # CSR14
    def self.csr14 : UInt32
      value.csr14
    end

    # CSR14
    def self.csr14=(value : UInt32) : UInt32
      self.set(csr14: value)
      value
    end

    def copy_with(
      *,

      csr14 : UInt32? = nil
    ) : self
      value = @value

      unless csr14.nil?
        value = (value & 0xffffffff_u32) |
                UInt32.new!(csr14.to_int).&(0x0_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      csr14 : UInt32? = nil
    ) : Nil
      self.value = self.value.copy_with(
        csr14: csr14,
      )
    end
  end # struct

  # context swap registers
  struct CSR15
    ADDRESS = BASE_ADDRESS + 0x134_u64

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

    # CSR15
    def csr15 : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # CSR15
    def self.csr15 : UInt32
      value.csr15
    end

    # CSR15
    def self.csr15=(value : UInt32) : UInt32
      self.set(csr15: value)
      value
    end

    def copy_with(
      *,

      csr15 : UInt32? = nil
    ) : self
      value = @value

      unless csr15.nil?
        value = (value & 0xffffffff_u32) |
                UInt32.new!(csr15.to_int).&(0x0_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      csr15 : UInt32? = nil
    ) : Nil
      self.value = self.value.copy_with(
        csr15: csr15,
      )
    end
  end # struct

  # context swap registers
  struct CSR16
    ADDRESS = BASE_ADDRESS + 0x138_u64

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

    # CSR16
    def csr16 : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # CSR16
    def self.csr16 : UInt32
      value.csr16
    end

    # CSR16
    def self.csr16=(value : UInt32) : UInt32
      self.set(csr16: value)
      value
    end

    def copy_with(
      *,

      csr16 : UInt32? = nil
    ) : self
      value = @value

      unless csr16.nil?
        value = (value & 0xffffffff_u32) |
                UInt32.new!(csr16.to_int).&(0x0_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      csr16 : UInt32? = nil
    ) : Nil
      self.value = self.value.copy_with(
        csr16: csr16,
      )
    end
  end # struct

  # context swap registers
  struct CSR17
    ADDRESS = BASE_ADDRESS + 0x13c_u64

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

    # CSR17
    def csr17 : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # CSR17
    def self.csr17 : UInt32
      value.csr17
    end

    # CSR17
    def self.csr17=(value : UInt32) : UInt32
      self.set(csr17: value)
      value
    end

    def copy_with(
      *,

      csr17 : UInt32? = nil
    ) : self
      value = @value

      unless csr17.nil?
        value = (value & 0xffffffff_u32) |
                UInt32.new!(csr17.to_int).&(0x0_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      csr17 : UInt32? = nil
    ) : Nil
      self.value = self.value.copy_with(
        csr17: csr17,
      )
    end
  end # struct

  # context swap registers
  struct CSR18
    ADDRESS = BASE_ADDRESS + 0x140_u64

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

    # CSR18
    def csr18 : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # CSR18
    def self.csr18 : UInt32
      value.csr18
    end

    # CSR18
    def self.csr18=(value : UInt32) : UInt32
      self.set(csr18: value)
      value
    end

    def copy_with(
      *,

      csr18 : UInt32? = nil
    ) : self
      value = @value

      unless csr18.nil?
        value = (value & 0xffffffff_u32) |
                UInt32.new!(csr18.to_int).&(0x0_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      csr18 : UInt32? = nil
    ) : Nil
      self.value = self.value.copy_with(
        csr18: csr18,
      )
    end
  end # struct

  # context swap registers
  struct CSR19
    ADDRESS = BASE_ADDRESS + 0x144_u64

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

    # CSR19
    def csr19 : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # CSR19
    def self.csr19 : UInt32
      value.csr19
    end

    # CSR19
    def self.csr19=(value : UInt32) : UInt32
      self.set(csr19: value)
      value
    end

    def copy_with(
      *,

      csr19 : UInt32? = nil
    ) : self
      value = @value

      unless csr19.nil?
        value = (value & 0xffffffff_u32) |
                UInt32.new!(csr19.to_int).&(0x0_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      csr19 : UInt32? = nil
    ) : Nil
      self.value = self.value.copy_with(
        csr19: csr19,
      )
    end
  end # struct

  # context swap registers
  struct CSR20
    ADDRESS = BASE_ADDRESS + 0x148_u64

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

    # CSR20
    def csr20 : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # CSR20
    def self.csr20 : UInt32
      value.csr20
    end

    # CSR20
    def self.csr20=(value : UInt32) : UInt32
      self.set(csr20: value)
      value
    end

    def copy_with(
      *,

      csr20 : UInt32? = nil
    ) : self
      value = @value

      unless csr20.nil?
        value = (value & 0xffffffff_u32) |
                UInt32.new!(csr20.to_int).&(0x0_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      csr20 : UInt32? = nil
    ) : Nil
      self.value = self.value.copy_with(
        csr20: csr20,
      )
    end
  end # struct

  # context swap registers
  struct CSR21
    ADDRESS = BASE_ADDRESS + 0x14c_u64

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

    # CSR21
    def csr21 : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # CSR21
    def self.csr21 : UInt32
      value.csr21
    end

    # CSR21
    def self.csr21=(value : UInt32) : UInt32
      self.set(csr21: value)
      value
    end

    def copy_with(
      *,

      csr21 : UInt32? = nil
    ) : self
      value = @value

      unless csr21.nil?
        value = (value & 0xffffffff_u32) |
                UInt32.new!(csr21.to_int).&(0x0_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      csr21 : UInt32? = nil
    ) : Nil
      self.value = self.value.copy_with(
        csr21: csr21,
      )
    end
  end # struct

  # context swap registers
  struct CSR22
    ADDRESS = BASE_ADDRESS + 0x150_u64

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

    # CSR22
    def csr22 : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # CSR22
    def self.csr22 : UInt32
      value.csr22
    end

    # CSR22
    def self.csr22=(value : UInt32) : UInt32
      self.set(csr22: value)
      value
    end

    def copy_with(
      *,

      csr22 : UInt32? = nil
    ) : self
      value = @value

      unless csr22.nil?
        value = (value & 0xffffffff_u32) |
                UInt32.new!(csr22.to_int).&(0x0_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      csr22 : UInt32? = nil
    ) : Nil
      self.value = self.value.copy_with(
        csr22: csr22,
      )
    end
  end # struct

  # context swap registers
  struct CSR23
    ADDRESS = BASE_ADDRESS + 0x154_u64

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

    # CSR23
    def csr23 : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # CSR23
    def self.csr23 : UInt32
      value.csr23
    end

    # CSR23
    def self.csr23=(value : UInt32) : UInt32
      self.set(csr23: value)
      value
    end

    def copy_with(
      *,

      csr23 : UInt32? = nil
    ) : self
      value = @value

      unless csr23.nil?
        value = (value & 0xffffffff_u32) |
                UInt32.new!(csr23.to_int).&(0x0_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      csr23 : UInt32? = nil
    ) : Nil
      self.value = self.value.copy_with(
        csr23: csr23,
      )
    end
  end # struct

  # context swap registers
  struct CSR24
    ADDRESS = BASE_ADDRESS + 0x158_u64

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

    # CSR24
    def csr24 : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # CSR24
    def self.csr24 : UInt32
      value.csr24
    end

    # CSR24
    def self.csr24=(value : UInt32) : UInt32
      self.set(csr24: value)
      value
    end

    def copy_with(
      *,

      csr24 : UInt32? = nil
    ) : self
      value = @value

      unless csr24.nil?
        value = (value & 0xffffffff_u32) |
                UInt32.new!(csr24.to_int).&(0x0_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      csr24 : UInt32? = nil
    ) : Nil
      self.value = self.value.copy_with(
        csr24: csr24,
      )
    end
  end # struct

  # context swap registers
  struct CSR25
    ADDRESS = BASE_ADDRESS + 0x15c_u64

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

    # CSR25
    def csr25 : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # CSR25
    def self.csr25 : UInt32
      value.csr25
    end

    # CSR25
    def self.csr25=(value : UInt32) : UInt32
      self.set(csr25: value)
      value
    end

    def copy_with(
      *,

      csr25 : UInt32? = nil
    ) : self
      value = @value

      unless csr25.nil?
        value = (value & 0xffffffff_u32) |
                UInt32.new!(csr25.to_int).&(0x0_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      csr25 : UInt32? = nil
    ) : Nil
      self.value = self.value.copy_with(
        csr25: csr25,
      )
    end
  end # struct

  # context swap registers
  struct CSR26
    ADDRESS = BASE_ADDRESS + 0x160_u64

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

    # CSR26
    def csr26 : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # CSR26
    def self.csr26 : UInt32
      value.csr26
    end

    # CSR26
    def self.csr26=(value : UInt32) : UInt32
      self.set(csr26: value)
      value
    end

    def copy_with(
      *,

      csr26 : UInt32? = nil
    ) : self
      value = @value

      unless csr26.nil?
        value = (value & 0xffffffff_u32) |
                UInt32.new!(csr26.to_int).&(0x0_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      csr26 : UInt32? = nil
    ) : Nil
      self.value = self.value.copy_with(
        csr26: csr26,
      )
    end
  end # struct

  # context swap registers
  struct CSR27
    ADDRESS = BASE_ADDRESS + 0x164_u64

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

    # CSR27
    def csr27 : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # CSR27
    def self.csr27 : UInt32
      value.csr27
    end

    # CSR27
    def self.csr27=(value : UInt32) : UInt32
      self.set(csr27: value)
      value
    end

    def copy_with(
      *,

      csr27 : UInt32? = nil
    ) : self
      value = @value

      unless csr27.nil?
        value = (value & 0xffffffff_u32) |
                UInt32.new!(csr27.to_int).&(0x0_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      csr27 : UInt32? = nil
    ) : Nil
      self.value = self.value.copy_with(
        csr27: csr27,
      )
    end
  end # struct

  # context swap registers
  struct CSR28
    ADDRESS = BASE_ADDRESS + 0x168_u64

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

    # CSR28
    def csr28 : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # CSR28
    def self.csr28 : UInt32
      value.csr28
    end

    # CSR28
    def self.csr28=(value : UInt32) : UInt32
      self.set(csr28: value)
      value
    end

    def copy_with(
      *,

      csr28 : UInt32? = nil
    ) : self
      value = @value

      unless csr28.nil?
        value = (value & 0xffffffff_u32) |
                UInt32.new!(csr28.to_int).&(0x0_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      csr28 : UInt32? = nil
    ) : Nil
      self.value = self.value.copy_with(
        csr28: csr28,
      )
    end
  end # struct

  # context swap registers
  struct CSR29
    ADDRESS = BASE_ADDRESS + 0x16c_u64

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

    # CSR29
    def csr29 : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # CSR29
    def self.csr29 : UInt32
      value.csr29
    end

    # CSR29
    def self.csr29=(value : UInt32) : UInt32
      self.set(csr29: value)
      value
    end

    def copy_with(
      *,

      csr29 : UInt32? = nil
    ) : self
      value = @value

      unless csr29.nil?
        value = (value & 0xffffffff_u32) |
                UInt32.new!(csr29.to_int).&(0x0_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      csr29 : UInt32? = nil
    ) : Nil
      self.value = self.value.copy_with(
        csr29: csr29,
      )
    end
  end # struct

  # context swap registers
  struct CSR30
    ADDRESS = BASE_ADDRESS + 0x170_u64

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

    # CSR30
    def csr30 : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # CSR30
    def self.csr30 : UInt32
      value.csr30
    end

    # CSR30
    def self.csr30=(value : UInt32) : UInt32
      self.set(csr30: value)
      value
    end

    def copy_with(
      *,

      csr30 : UInt32? = nil
    ) : self
      value = @value

      unless csr30.nil?
        value = (value & 0xffffffff_u32) |
                UInt32.new!(csr30.to_int).&(0x0_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      csr30 : UInt32? = nil
    ) : Nil
      self.value = self.value.copy_with(
        csr30: csr30,
      )
    end
  end # struct

  # context swap registers
  struct CSR31
    ADDRESS = BASE_ADDRESS + 0x174_u64

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

    # CSR31
    def csr31 : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # CSR31
    def self.csr31 : UInt32
      value.csr31
    end

    # CSR31
    def self.csr31=(value : UInt32) : UInt32
      self.set(csr31: value)
      value
    end

    def copy_with(
      *,

      csr31 : UInt32? = nil
    ) : self
      value = @value

      unless csr31.nil?
        value = (value & 0xffffffff_u32) |
                UInt32.new!(csr31.to_int).&(0x0_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      csr31 : UInt32? = nil
    ) : Nil
      self.value = self.value.copy_with(
        csr31: csr31,
      )
    end
  end # struct

  # context swap registers
  struct CSR32
    ADDRESS = BASE_ADDRESS + 0x178_u64

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

    # CSR32
    def csr32 : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # CSR32
    def self.csr32 : UInt32
      value.csr32
    end

    # CSR32
    def self.csr32=(value : UInt32) : UInt32
      self.set(csr32: value)
      value
    end

    def copy_with(
      *,

      csr32 : UInt32? = nil
    ) : self
      value = @value

      unless csr32.nil?
        value = (value & 0xffffffff_u32) |
                UInt32.new!(csr32.to_int).&(0x0_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      csr32 : UInt32? = nil
    ) : Nil
      self.value = self.value.copy_with(
        csr32: csr32,
      )
    end
  end # struct

  # context swap registers
  struct CSR33
    ADDRESS = BASE_ADDRESS + 0x17c_u64

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

    # CSR33
    def csr33 : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # CSR33
    def self.csr33 : UInt32
      value.csr33
    end

    # CSR33
    def self.csr33=(value : UInt32) : UInt32
      self.set(csr33: value)
      value
    end

    def copy_with(
      *,

      csr33 : UInt32? = nil
    ) : self
      value = @value

      unless csr33.nil?
        value = (value & 0xffffffff_u32) |
                UInt32.new!(csr33.to_int).&(0x0_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      csr33 : UInt32? = nil
    ) : Nil
      self.value = self.value.copy_with(
        csr33: csr33,
      )
    end
  end # struct

  # context swap registers
  struct CSR34
    ADDRESS = BASE_ADDRESS + 0x180_u64

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

    # CSR34
    def csr34 : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # CSR34
    def self.csr34 : UInt32
      value.csr34
    end

    # CSR34
    def self.csr34=(value : UInt32) : UInt32
      self.set(csr34: value)
      value
    end

    def copy_with(
      *,

      csr34 : UInt32? = nil
    ) : self
      value = @value

      unless csr34.nil?
        value = (value & 0xffffffff_u32) |
                UInt32.new!(csr34.to_int).&(0x0_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      csr34 : UInt32? = nil
    ) : Nil
      self.value = self.value.copy_with(
        csr34: csr34,
      )
    end
  end # struct

  # context swap registers
  struct CSR35
    ADDRESS = BASE_ADDRESS + 0x184_u64

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

    # CSR35
    def csr35 : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # CSR35
    def self.csr35 : UInt32
      value.csr35
    end

    # CSR35
    def self.csr35=(value : UInt32) : UInt32
      self.set(csr35: value)
      value
    end

    def copy_with(
      *,

      csr35 : UInt32? = nil
    ) : self
      value = @value

      unless csr35.nil?
        value = (value & 0xffffffff_u32) |
                UInt32.new!(csr35.to_int).&(0x0_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      csr35 : UInt32? = nil
    ) : Nil
      self.value = self.value.copy_with(
        csr35: csr35,
      )
    end
  end # struct

  # context swap registers
  struct CSR36
    ADDRESS = BASE_ADDRESS + 0x188_u64

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

    # CSR36
    def csr36 : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # CSR36
    def self.csr36 : UInt32
      value.csr36
    end

    # CSR36
    def self.csr36=(value : UInt32) : UInt32
      self.set(csr36: value)
      value
    end

    def copy_with(
      *,

      csr36 : UInt32? = nil
    ) : self
      value = @value

      unless csr36.nil?
        value = (value & 0xffffffff_u32) |
                UInt32.new!(csr36.to_int).&(0x0_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      csr36 : UInt32? = nil
    ) : Nil
      self.value = self.value.copy_with(
        csr36: csr36,
      )
    end
  end # struct

  # context swap registers
  struct CSR37
    ADDRESS = BASE_ADDRESS + 0x18c_u64

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

    # CSR37
    def csr37 : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # CSR37
    def self.csr37 : UInt32
      value.csr37
    end

    # CSR37
    def self.csr37=(value : UInt32) : UInt32
      self.set(csr37: value)
      value
    end

    def copy_with(
      *,

      csr37 : UInt32? = nil
    ) : self
      value = @value

      unless csr37.nil?
        value = (value & 0xffffffff_u32) |
                UInt32.new!(csr37.to_int).&(0x0_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      csr37 : UInt32? = nil
    ) : Nil
      self.value = self.value.copy_with(
        csr37: csr37,
      )
    end
  end # struct

  # context swap registers
  struct CSR38
    ADDRESS = BASE_ADDRESS + 0x190_u64

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

    # CSR38
    def csr38 : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # CSR38
    def self.csr38 : UInt32
      value.csr38
    end

    # CSR38
    def self.csr38=(value : UInt32) : UInt32
      self.set(csr38: value)
      value
    end

    def copy_with(
      *,

      csr38 : UInt32? = nil
    ) : self
      value = @value

      unless csr38.nil?
        value = (value & 0xffffffff_u32) |
                UInt32.new!(csr38.to_int).&(0x0_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      csr38 : UInt32? = nil
    ) : Nil
      self.value = self.value.copy_with(
        csr38: csr38,
      )
    end
  end # struct

  # context swap registers
  struct CSR39
    ADDRESS = BASE_ADDRESS + 0x194_u64

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

    # CSR39
    def csr39 : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # CSR39
    def self.csr39 : UInt32
      value.csr39
    end

    # CSR39
    def self.csr39=(value : UInt32) : UInt32
      self.set(csr39: value)
      value
    end

    def copy_with(
      *,

      csr39 : UInt32? = nil
    ) : self
      value = @value

      unless csr39.nil?
        value = (value & 0xffffffff_u32) |
                UInt32.new!(csr39.to_int).&(0x0_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      csr39 : UInt32? = nil
    ) : Nil
      self.value = self.value.copy_with(
        csr39: csr39,
      )
    end
  end # struct

  # context swap registers
  struct CSR40
    ADDRESS = BASE_ADDRESS + 0x198_u64

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

    # CSR40
    def csr40 : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # CSR40
    def self.csr40 : UInt32
      value.csr40
    end

    # CSR40
    def self.csr40=(value : UInt32) : UInt32
      self.set(csr40: value)
      value
    end

    def copy_with(
      *,

      csr40 : UInt32? = nil
    ) : self
      value = @value

      unless csr40.nil?
        value = (value & 0xffffffff_u32) |
                UInt32.new!(csr40.to_int).&(0x0_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      csr40 : UInt32? = nil
    ) : Nil
      self.value = self.value.copy_with(
        csr40: csr40,
      )
    end
  end # struct

  # context swap registers
  struct CSR41
    ADDRESS = BASE_ADDRESS + 0x19c_u64

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

    # CSR41
    def csr41 : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # CSR41
    def self.csr41 : UInt32
      value.csr41
    end

    # CSR41
    def self.csr41=(value : UInt32) : UInt32
      self.set(csr41: value)
      value
    end

    def copy_with(
      *,

      csr41 : UInt32? = nil
    ) : self
      value = @value

      unless csr41.nil?
        value = (value & 0xffffffff_u32) |
                UInt32.new!(csr41.to_int).&(0x0_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      csr41 : UInt32? = nil
    ) : Nil
      self.value = self.value.copy_with(
        csr41: csr41,
      )
    end
  end # struct

  # context swap registers
  struct CSR42
    ADDRESS = BASE_ADDRESS + 0x1a0_u64

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

    # CSR42
    def csr42 : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # CSR42
    def self.csr42 : UInt32
      value.csr42
    end

    # CSR42
    def self.csr42=(value : UInt32) : UInt32
      self.set(csr42: value)
      value
    end

    def copy_with(
      *,

      csr42 : UInt32? = nil
    ) : self
      value = @value

      unless csr42.nil?
        value = (value & 0xffffffff_u32) |
                UInt32.new!(csr42.to_int).&(0x0_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      csr42 : UInt32? = nil
    ) : Nil
      self.value = self.value.copy_with(
        csr42: csr42,
      )
    end
  end # struct

  # context swap registers
  struct CSR43
    ADDRESS = BASE_ADDRESS + 0x1a4_u64

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

    # CSR43
    def csr43 : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # CSR43
    def self.csr43 : UInt32
      value.csr43
    end

    # CSR43
    def self.csr43=(value : UInt32) : UInt32
      self.set(csr43: value)
      value
    end

    def copy_with(
      *,

      csr43 : UInt32? = nil
    ) : self
      value = @value

      unless csr43.nil?
        value = (value & 0xffffffff_u32) |
                UInt32.new!(csr43.to_int).&(0x0_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      csr43 : UInt32? = nil
    ) : Nil
      self.value = self.value.copy_with(
        csr43: csr43,
      )
    end
  end # struct

  # context swap registers
  struct CSR44
    ADDRESS = BASE_ADDRESS + 0x1a8_u64

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

    # CSR44
    def csr44 : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # CSR44
    def self.csr44 : UInt32
      value.csr44
    end

    # CSR44
    def self.csr44=(value : UInt32) : UInt32
      self.set(csr44: value)
      value
    end

    def copy_with(
      *,

      csr44 : UInt32? = nil
    ) : self
      value = @value

      unless csr44.nil?
        value = (value & 0xffffffff_u32) |
                UInt32.new!(csr44.to_int).&(0x0_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      csr44 : UInt32? = nil
    ) : Nil
      self.value = self.value.copy_with(
        csr44: csr44,
      )
    end
  end # struct

  # context swap registers
  struct CSR45
    ADDRESS = BASE_ADDRESS + 0x1ac_u64

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

    # CSR45
    def csr45 : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # CSR45
    def self.csr45 : UInt32
      value.csr45
    end

    # CSR45
    def self.csr45=(value : UInt32) : UInt32
      self.set(csr45: value)
      value
    end

    def copy_with(
      *,

      csr45 : UInt32? = nil
    ) : self
      value = @value

      unless csr45.nil?
        value = (value & 0xffffffff_u32) |
                UInt32.new!(csr45.to_int).&(0x0_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      csr45 : UInt32? = nil
    ) : Nil
      self.value = self.value.copy_with(
        csr45: csr45,
      )
    end
  end # struct

  # context swap registers
  struct CSR46
    ADDRESS = BASE_ADDRESS + 0x1b0_u64

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

    # CSR46
    def csr46 : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # CSR46
    def self.csr46 : UInt32
      value.csr46
    end

    # CSR46
    def self.csr46=(value : UInt32) : UInt32
      self.set(csr46: value)
      value
    end

    def copy_with(
      *,

      csr46 : UInt32? = nil
    ) : self
      value = @value

      unless csr46.nil?
        value = (value & 0xffffffff_u32) |
                UInt32.new!(csr46.to_int).&(0x0_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      csr46 : UInt32? = nil
    ) : Nil
      self.value = self.value.copy_with(
        csr46: csr46,
      )
    end
  end # struct

  # context swap registers
  struct CSR47
    ADDRESS = BASE_ADDRESS + 0x1b4_u64

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

    # CSR47
    def csr47 : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # CSR47
    def self.csr47 : UInt32
      value.csr47
    end

    # CSR47
    def self.csr47=(value : UInt32) : UInt32
      self.set(csr47: value)
      value
    end

    def copy_with(
      *,

      csr47 : UInt32? = nil
    ) : self
      value = @value

      unless csr47.nil?
        value = (value & 0xffffffff_u32) |
                UInt32.new!(csr47.to_int).&(0x0_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      csr47 : UInt32? = nil
    ) : Nil
      self.value = self.value.copy_with(
        csr47: csr47,
      )
    end
  end # struct

  # context swap registers
  struct CSR48
    ADDRESS = BASE_ADDRESS + 0x1b8_u64

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

    # CSR48
    def csr48 : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # CSR48
    def self.csr48 : UInt32
      value.csr48
    end

    # CSR48
    def self.csr48=(value : UInt32) : UInt32
      self.set(csr48: value)
      value
    end

    def copy_with(
      *,

      csr48 : UInt32? = nil
    ) : self
      value = @value

      unless csr48.nil?
        value = (value & 0xffffffff_u32) |
                UInt32.new!(csr48.to_int).&(0x0_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      csr48 : UInt32? = nil
    ) : Nil
      self.value = self.value.copy_with(
        csr48: csr48,
      )
    end
  end # struct

  # context swap registers
  struct CSR49
    ADDRESS = BASE_ADDRESS + 0x1bc_u64

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

    # CSR49
    def csr49 : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # CSR49
    def self.csr49 : UInt32
      value.csr49
    end

    # CSR49
    def self.csr49=(value : UInt32) : UInt32
      self.set(csr49: value)
      value
    end

    def copy_with(
      *,

      csr49 : UInt32? = nil
    ) : self
      value = @value

      unless csr49.nil?
        value = (value & 0xffffffff_u32) |
                UInt32.new!(csr49.to_int).&(0x0_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      csr49 : UInt32? = nil
    ) : Nil
      self.value = self.value.copy_with(
        csr49: csr49,
      )
    end
  end # struct

  # context swap registers
  struct CSR50
    ADDRESS = BASE_ADDRESS + 0x1c0_u64

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

    # CSR50
    def csr50 : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # CSR50
    def self.csr50 : UInt32
      value.csr50
    end

    # CSR50
    def self.csr50=(value : UInt32) : UInt32
      self.set(csr50: value)
      value
    end

    def copy_with(
      *,

      csr50 : UInt32? = nil
    ) : self
      value = @value

      unless csr50.nil?
        value = (value & 0xffffffff_u32) |
                UInt32.new!(csr50.to_int).&(0x0_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      csr50 : UInt32? = nil
    ) : Nil
      self.value = self.value.copy_with(
        csr50: csr50,
      )
    end
  end # struct

  # context swap registers
  struct CSR51
    ADDRESS = BASE_ADDRESS + 0x1c4_u64

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

    # CSR51
    def csr51 : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # CSR51
    def self.csr51 : UInt32
      value.csr51
    end

    # CSR51
    def self.csr51=(value : UInt32) : UInt32
      self.set(csr51: value)
      value
    end

    def copy_with(
      *,

      csr51 : UInt32? = nil
    ) : self
      value = @value

      unless csr51.nil?
        value = (value & 0xffffffff_u32) |
                UInt32.new!(csr51.to_int).&(0x0_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      csr51 : UInt32? = nil
    ) : Nil
      self.value = self.value.copy_with(
        csr51: csr51,
      )
    end
  end # struct

  # context swap registers
  struct CSR52
    ADDRESS = BASE_ADDRESS + 0x1c8_u64

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

    # CSR52
    def csr52 : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # CSR52
    def self.csr52 : UInt32
      value.csr52
    end

    # CSR52
    def self.csr52=(value : UInt32) : UInt32
      self.set(csr52: value)
      value
    end

    def copy_with(
      *,

      csr52 : UInt32? = nil
    ) : self
      value = @value

      unless csr52.nil?
        value = (value & 0xffffffff_u32) |
                UInt32.new!(csr52.to_int).&(0x0_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      csr52 : UInt32? = nil
    ) : Nil
      self.value = self.value.copy_with(
        csr52: csr52,
      )
    end
  end # struct

  # context swap registers
  struct CSR53
    ADDRESS = BASE_ADDRESS + 0x1cc_u64

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

    # CSR53
    def csr53 : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # CSR53
    def self.csr53 : UInt32
      value.csr53
    end

    # CSR53
    def self.csr53=(value : UInt32) : UInt32
      self.set(csr53: value)
      value
    end

    def copy_with(
      *,

      csr53 : UInt32? = nil
    ) : self
      value = @value

      unless csr53.nil?
        value = (value & 0xffffffff_u32) |
                UInt32.new!(csr53.to_int).&(0x0_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      csr53 : UInt32? = nil
    ) : Nil
      self.value = self.value.copy_with(
        csr53: csr53,
      )
    end
  end # struct

  # HASH digest register
  struct HD0
    ADDRESS = BASE_ADDRESS + 0x310_u64

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

    # H0
    def h0 : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # H0
    def self.h0 : UInt32
      value.h0
    end
  end # struct

  # read-only
  struct HD1
    ADDRESS = BASE_ADDRESS + 0x314_u64

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

    # H1
    def h1 : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # H1
    def self.h1 : UInt32
      value.h1
    end
  end # struct

  # read-only
  struct HD2
    ADDRESS = BASE_ADDRESS + 0x318_u64

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

    # H2
    def h2 : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # H2
    def self.h2 : UInt32
      value.h2
    end
  end # struct

  # read-only
  struct HD3
    ADDRESS = BASE_ADDRESS + 0x31c_u64

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

    # H3
    def h3 : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # H3
    def self.h3 : UInt32
      value.h3
    end
  end # struct

  # read-only
  struct HD4
    ADDRESS = BASE_ADDRESS + 0x320_u64

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

    # H4
    def h4 : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # H4
    def self.h4 : UInt32
      value.h4
    end
  end # struct

  # read-only
  struct HD5
    ADDRESS = BASE_ADDRESS + 0x324_u64

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

    # H5
    def h5 : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # H5
    def self.h5 : UInt32
      value.h5
    end
  end # struct

  # read-only
  struct HD6
    ADDRESS = BASE_ADDRESS + 0x328_u64

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

    # H6
    def h6 : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # H6
    def self.h6 : UInt32
      value.h6
    end
  end # struct

  # read-only
  struct HD7
    ADDRESS = BASE_ADDRESS + 0x32c_u64

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

    # H7
    def h7 : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # H7
    def self.h7 : UInt32
      value.h7
    end
  end # struct

end
