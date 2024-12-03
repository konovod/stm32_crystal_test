# Controller area network
module CAN1
  VERSION      = nil
  BASE_ADDRESS = 0x40006400_u64

  # master control register
  struct MCR
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
      new(0x10002_u64)
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

    # DBF
    def dbf : Bool
      @value.bits_set?(0x10000_u32)
    end

    # DBF
    def self.dbf : Bool
      value.dbf
    end

    # DBF
    def self.dbf=(value : Bool) : Bool
      self.set(dbf: value)
      value
    end

    # RESET
    def reset : Bool
      @value.bits_set?(0x8000_u32)
    end

    # RESET
    def self.reset : Bool
      value.reset
    end

    # RESET
    def self.reset=(value : Bool) : Bool
      self.set(reset: value)
      value
    end

    # TTCM
    def ttcm : Bool
      @value.bits_set?(0x80_u32)
    end

    # TTCM
    def self.ttcm : Bool
      value.ttcm
    end

    # TTCM
    def self.ttcm=(value : Bool) : Bool
      self.set(ttcm: value)
      value
    end

    # ABOM
    def abom : Bool
      @value.bits_set?(0x40_u32)
    end

    # ABOM
    def self.abom : Bool
      value.abom
    end

    # ABOM
    def self.abom=(value : Bool) : Bool
      self.set(abom: value)
      value
    end

    # AWUM
    def awum : Bool
      @value.bits_set?(0x20_u32)
    end

    # AWUM
    def self.awum : Bool
      value.awum
    end

    # AWUM
    def self.awum=(value : Bool) : Bool
      self.set(awum: value)
      value
    end

    # NART
    def nart : Bool
      @value.bits_set?(0x10_u32)
    end

    # NART
    def self.nart : Bool
      value.nart
    end

    # NART
    def self.nart=(value : Bool) : Bool
      self.set(nart: value)
      value
    end

    # RFLM
    def rflm : Bool
      @value.bits_set?(0x8_u32)
    end

    # RFLM
    def self.rflm : Bool
      value.rflm
    end

    # RFLM
    def self.rflm=(value : Bool) : Bool
      self.set(rflm: value)
      value
    end

    # TXFP
    def txfp : Bool
      @value.bits_set?(0x4_u32)
    end

    # TXFP
    def self.txfp : Bool
      value.txfp
    end

    # TXFP
    def self.txfp=(value : Bool) : Bool
      self.set(txfp: value)
      value
    end

    # SLEEP
    def sleep : Bool
      @value.bits_set?(0x2_u32)
    end

    # SLEEP
    def self.sleep : Bool
      value.sleep
    end

    # SLEEP
    def self.sleep=(value : Bool) : Bool
      self.set(sleep: value)
      value
    end

    # INRQ
    def inrq : Bool
      @value.bits_set?(0x1_u32)
    end

    # INRQ
    def self.inrq : Bool
      value.inrq
    end

    # INRQ
    def self.inrq=(value : Bool) : Bool
      self.set(inrq: value)
      value
    end

    def copy_with(
      *,

      dbf : Bool? = nil,

      reset : Bool? = nil,

      ttcm : Bool? = nil,

      abom : Bool? = nil,

      awum : Bool? = nil,

      nart : Bool? = nil,

      rflm : Bool? = nil,

      txfp : Bool? = nil,

      sleep : Bool? = nil,

      inrq : Bool? = nil
    ) : self
      value = @value

      unless dbf.nil?
        value = (value & 0xfffeffff_u32) |
                UInt32.new!(dbf.to_int).&(0x1_u32) << 16
      end

      unless reset.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(reset.to_int).&(0x1_u32) << 15
      end

      unless ttcm.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(ttcm.to_int).&(0x1_u32) << 7
      end

      unless abom.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(abom.to_int).&(0x1_u32) << 6
      end

      unless awum.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(awum.to_int).&(0x1_u32) << 5
      end

      unless nart.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(nart.to_int).&(0x1_u32) << 4
      end

      unless rflm.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(rflm.to_int).&(0x1_u32) << 3
      end

      unless txfp.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(txfp.to_int).&(0x1_u32) << 2
      end

      unless sleep.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(sleep.to_int).&(0x1_u32) << 1
      end

      unless inrq.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(inrq.to_int).&(0x1_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      dbf : Bool? = nil,
      reset : Bool? = nil,
      ttcm : Bool? = nil,
      abom : Bool? = nil,
      awum : Bool? = nil,
      nart : Bool? = nil,
      rflm : Bool? = nil,
      txfp : Bool? = nil,
      sleep : Bool? = nil,
      inrq : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        dbf: dbf,
        reset: reset,
        ttcm: ttcm,
        abom: abom,
        awum: awum,
        nart: nart,
        rflm: rflm,
        txfp: txfp,
        sleep: sleep,
        inrq: inrq,
      )
    end
  end # struct

  # master status register
  struct MSR
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
      new(0xc02_u64)
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

    # RX
    def rx : Bool
      @value.bits_set?(0x800_u32)
    end

    # RX
    def self.rx : Bool
      value.rx
    end

    # SAMP
    def samp : Bool
      @value.bits_set?(0x400_u32)
    end

    # SAMP
    def self.samp : Bool
      value.samp
    end

    # RXM
    def rxm : Bool
      @value.bits_set?(0x200_u32)
    end

    # RXM
    def self.rxm : Bool
      value.rxm
    end

    # TXM
    def txm : Bool
      @value.bits_set?(0x100_u32)
    end

    # TXM
    def self.txm : Bool
      value.txm
    end

    # SLAKI
    def slaki : Bool
      @value.bits_set?(0x10_u32)
    end

    # SLAKI
    def self.slaki : Bool
      value.slaki
    end

    # SLAKI
    def self.slaki=(value : Bool) : Bool
      self.set(slaki: value)
      value
    end

    # WKUI
    def wkui : Bool
      @value.bits_set?(0x8_u32)
    end

    # WKUI
    def self.wkui : Bool
      value.wkui
    end

    # WKUI
    def self.wkui=(value : Bool) : Bool
      self.set(wkui: value)
      value
    end

    # ERRI
    def erri : Bool
      @value.bits_set?(0x4_u32)
    end

    # ERRI
    def self.erri : Bool
      value.erri
    end

    # ERRI
    def self.erri=(value : Bool) : Bool
      self.set(erri: value)
      value
    end

    # SLAK
    def slak : Bool
      @value.bits_set?(0x2_u32)
    end

    # SLAK
    def self.slak : Bool
      value.slak
    end

    # INAK
    def inak : Bool
      @value.bits_set?(0x1_u32)
    end

    # INAK
    def self.inak : Bool
      value.inak
    end

    def copy_with(
      *,

      slaki : Bool? = nil,

      wkui : Bool? = nil,

      erri : Bool? = nil
    ) : self
      value = @value

      unless slaki.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(slaki.to_int).&(0x1_u32) << 4
      end

      unless wkui.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(wkui.to_int).&(0x1_u32) << 3
      end

      unless erri.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(erri.to_int).&(0x1_u32) << 2
      end

      self.class.new(value)
    end

    def self.set(
      *,
      slaki : Bool? = nil,
      wkui : Bool? = nil,
      erri : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        slaki: slaki,
        wkui: wkui,
        erri: erri,
      )
    end
  end # struct

  # transmit status register
  struct TSR
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
      new(0x1c000000_u64)
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

    # Lowest priority flag for mailbox              2
    def low2 : Bool
      @value.bits_set?(0x80000000_u32)
    end

    # Lowest priority flag for mailbox              2
    def self.low2 : Bool
      value.low2
    end

    # Lowest priority flag for mailbox              1
    def low1 : Bool
      @value.bits_set?(0x40000000_u32)
    end

    # Lowest priority flag for mailbox              1
    def self.low1 : Bool
      value.low1
    end

    # Lowest priority flag for mailbox              0
    def low0 : Bool
      @value.bits_set?(0x20000000_u32)
    end

    # Lowest priority flag for mailbox              0
    def self.low0 : Bool
      value.low0
    end

    # Lowest priority flag for mailbox              2
    def tme2 : Bool
      @value.bits_set?(0x10000000_u32)
    end

    # Lowest priority flag for mailbox              2
    def self.tme2 : Bool
      value.tme2
    end

    # Lowest priority flag for mailbox              1
    def tme1 : Bool
      @value.bits_set?(0x8000000_u32)
    end

    # Lowest priority flag for mailbox              1
    def self.tme1 : Bool
      value.tme1
    end

    # Lowest priority flag for mailbox              0
    def tme0 : Bool
      @value.bits_set?(0x4000000_u32)
    end

    # Lowest priority flag for mailbox              0
    def self.tme0 : Bool
      value.tme0
    end

    # CODE
    def code : UInt8
      UInt8.new!((@value >> 24) & 0x3_u32)
    end

    # CODE
    def self.code : UInt8
      value.code
    end

    # ABRQ2
    def abrq2 : Bool
      @value.bits_set?(0x800000_u32)
    end

    # ABRQ2
    def self.abrq2 : Bool
      value.abrq2
    end

    # ABRQ2
    def self.abrq2=(value : Bool) : Bool
      self.set(abrq2: value)
      value
    end

    # TERR2
    def terr2 : Bool
      @value.bits_set?(0x80000_u32)
    end

    # TERR2
    def self.terr2 : Bool
      value.terr2
    end

    # TERR2
    def self.terr2=(value : Bool) : Bool
      self.set(terr2: value)
      value
    end

    # ALST2
    def alst2 : Bool
      @value.bits_set?(0x40000_u32)
    end

    # ALST2
    def self.alst2 : Bool
      value.alst2
    end

    # ALST2
    def self.alst2=(value : Bool) : Bool
      self.set(alst2: value)
      value
    end

    # TXOK2
    def txok2 : Bool
      @value.bits_set?(0x20000_u32)
    end

    # TXOK2
    def self.txok2 : Bool
      value.txok2
    end

    # TXOK2
    def self.txok2=(value : Bool) : Bool
      self.set(txok2: value)
      value
    end

    # RQCP2
    def rqcp2 : Bool
      @value.bits_set?(0x10000_u32)
    end

    # RQCP2
    def self.rqcp2 : Bool
      value.rqcp2
    end

    # RQCP2
    def self.rqcp2=(value : Bool) : Bool
      self.set(rqcp2: value)
      value
    end

    # ABRQ1
    def abrq1 : Bool
      @value.bits_set?(0x8000_u32)
    end

    # ABRQ1
    def self.abrq1 : Bool
      value.abrq1
    end

    # ABRQ1
    def self.abrq1=(value : Bool) : Bool
      self.set(abrq1: value)
      value
    end

    # TERR1
    def terr1 : Bool
      @value.bits_set?(0x800_u32)
    end

    # TERR1
    def self.terr1 : Bool
      value.terr1
    end

    # TERR1
    def self.terr1=(value : Bool) : Bool
      self.set(terr1: value)
      value
    end

    # ALST1
    def alst1 : Bool
      @value.bits_set?(0x400_u32)
    end

    # ALST1
    def self.alst1 : Bool
      value.alst1
    end

    # ALST1
    def self.alst1=(value : Bool) : Bool
      self.set(alst1: value)
      value
    end

    # TXOK1
    def txok1 : Bool
      @value.bits_set?(0x200_u32)
    end

    # TXOK1
    def self.txok1 : Bool
      value.txok1
    end

    # TXOK1
    def self.txok1=(value : Bool) : Bool
      self.set(txok1: value)
      value
    end

    # RQCP1
    def rqcp1 : Bool
      @value.bits_set?(0x100_u32)
    end

    # RQCP1
    def self.rqcp1 : Bool
      value.rqcp1
    end

    # RQCP1
    def self.rqcp1=(value : Bool) : Bool
      self.set(rqcp1: value)
      value
    end

    # ABRQ0
    def abrq0 : Bool
      @value.bits_set?(0x80_u32)
    end

    # ABRQ0
    def self.abrq0 : Bool
      value.abrq0
    end

    # ABRQ0
    def self.abrq0=(value : Bool) : Bool
      self.set(abrq0: value)
      value
    end

    # TERR0
    def terr0 : Bool
      @value.bits_set?(0x8_u32)
    end

    # TERR0
    def self.terr0 : Bool
      value.terr0
    end

    # TERR0
    def self.terr0=(value : Bool) : Bool
      self.set(terr0: value)
      value
    end

    # ALST0
    def alst0 : Bool
      @value.bits_set?(0x4_u32)
    end

    # ALST0
    def self.alst0 : Bool
      value.alst0
    end

    # ALST0
    def self.alst0=(value : Bool) : Bool
      self.set(alst0: value)
      value
    end

    # TXOK0
    def txok0 : Bool
      @value.bits_set?(0x2_u32)
    end

    # TXOK0
    def self.txok0 : Bool
      value.txok0
    end

    # TXOK0
    def self.txok0=(value : Bool) : Bool
      self.set(txok0: value)
      value
    end

    # RQCP0
    def rqcp0 : Bool
      @value.bits_set?(0x1_u32)
    end

    # RQCP0
    def self.rqcp0 : Bool
      value.rqcp0
    end

    # RQCP0
    def self.rqcp0=(value : Bool) : Bool
      self.set(rqcp0: value)
      value
    end

    def copy_with(
      *,

      abrq2 : Bool? = nil,

      terr2 : Bool? = nil,

      alst2 : Bool? = nil,

      txok2 : Bool? = nil,

      rqcp2 : Bool? = nil,

      abrq1 : Bool? = nil,

      terr1 : Bool? = nil,

      alst1 : Bool? = nil,

      txok1 : Bool? = nil,

      rqcp1 : Bool? = nil,

      abrq0 : Bool? = nil,

      terr0 : Bool? = nil,

      alst0 : Bool? = nil,

      txok0 : Bool? = nil,

      rqcp0 : Bool? = nil
    ) : self
      value = @value

      unless abrq2.nil?
        value = (value & 0xff7fffff_u32) |
                UInt32.new!(abrq2.to_int).&(0x1_u32) << 23
      end

      unless terr2.nil?
        value = (value & 0xfff7ffff_u32) |
                UInt32.new!(terr2.to_int).&(0x1_u32) << 19
      end

      unless alst2.nil?
        value = (value & 0xfffbffff_u32) |
                UInt32.new!(alst2.to_int).&(0x1_u32) << 18
      end

      unless txok2.nil?
        value = (value & 0xfffdffff_u32) |
                UInt32.new!(txok2.to_int).&(0x1_u32) << 17
      end

      unless rqcp2.nil?
        value = (value & 0xfffeffff_u32) |
                UInt32.new!(rqcp2.to_int).&(0x1_u32) << 16
      end

      unless abrq1.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(abrq1.to_int).&(0x1_u32) << 15
      end

      unless terr1.nil?
        value = (value & 0xfffff7ff_u32) |
                UInt32.new!(terr1.to_int).&(0x1_u32) << 11
      end

      unless alst1.nil?
        value = (value & 0xfffffbff_u32) |
                UInt32.new!(alst1.to_int).&(0x1_u32) << 10
      end

      unless txok1.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(txok1.to_int).&(0x1_u32) << 9
      end

      unless rqcp1.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(rqcp1.to_int).&(0x1_u32) << 8
      end

      unless abrq0.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(abrq0.to_int).&(0x1_u32) << 7
      end

      unless terr0.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(terr0.to_int).&(0x1_u32) << 3
      end

      unless alst0.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(alst0.to_int).&(0x1_u32) << 2
      end

      unless txok0.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(txok0.to_int).&(0x1_u32) << 1
      end

      unless rqcp0.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(rqcp0.to_int).&(0x1_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      abrq2 : Bool? = nil,
      terr2 : Bool? = nil,
      alst2 : Bool? = nil,
      txok2 : Bool? = nil,
      rqcp2 : Bool? = nil,
      abrq1 : Bool? = nil,
      terr1 : Bool? = nil,
      alst1 : Bool? = nil,
      txok1 : Bool? = nil,
      rqcp1 : Bool? = nil,
      abrq0 : Bool? = nil,
      terr0 : Bool? = nil,
      alst0 : Bool? = nil,
      txok0 : Bool? = nil,
      rqcp0 : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        abrq2: abrq2,
        terr2: terr2,
        alst2: alst2,
        txok2: txok2,
        rqcp2: rqcp2,
        abrq1: abrq1,
        terr1: terr1,
        alst1: alst1,
        txok1: txok1,
        rqcp1: rqcp1,
        abrq0: abrq0,
        terr0: terr0,
        alst0: alst0,
        txok0: txok0,
        rqcp0: rqcp0,
      )
    end
  end # struct

  # receive FIFO 0 register
  struct RF0R
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

    # RFOM0
    def rfom0 : Bool
      @value.bits_set?(0x20_u32)
    end

    # RFOM0
    def self.rfom0 : Bool
      value.rfom0
    end

    # RFOM0
    def self.rfom0=(value : Bool) : Bool
      self.set(rfom0: value)
      value
    end

    # FOVR0
    def fovr0 : Bool
      @value.bits_set?(0x10_u32)
    end

    # FOVR0
    def self.fovr0 : Bool
      value.fovr0
    end

    # FOVR0
    def self.fovr0=(value : Bool) : Bool
      self.set(fovr0: value)
      value
    end

    # FULL0
    def full0 : Bool
      @value.bits_set?(0x8_u32)
    end

    # FULL0
    def self.full0 : Bool
      value.full0
    end

    # FULL0
    def self.full0=(value : Bool) : Bool
      self.set(full0: value)
      value
    end

    # FMP0
    def fmp0 : UInt8
      UInt8.new!((@value >> 0) & 0x3_u32)
    end

    # FMP0
    def self.fmp0 : UInt8
      value.fmp0
    end

    def copy_with(
      *,

      rfom0 : Bool? = nil,

      fovr0 : Bool? = nil,

      full0 : Bool? = nil
    ) : self
      value = @value

      unless rfom0.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(rfom0.to_int).&(0x1_u32) << 5
      end

      unless fovr0.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(fovr0.to_int).&(0x1_u32) << 4
      end

      unless full0.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(full0.to_int).&(0x1_u32) << 3
      end

      self.class.new(value)
    end

    def self.set(
      *,
      rfom0 : Bool? = nil,
      fovr0 : Bool? = nil,
      full0 : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        rfom0: rfom0,
        fovr0: fovr0,
        full0: full0,
      )
    end
  end # struct

  # receive FIFO 1 register
  struct RF1R
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

    # RFOM1
    def rfom1 : Bool
      @value.bits_set?(0x20_u32)
    end

    # RFOM1
    def self.rfom1 : Bool
      value.rfom1
    end

    # RFOM1
    def self.rfom1=(value : Bool) : Bool
      self.set(rfom1: value)
      value
    end

    # FOVR1
    def fovr1 : Bool
      @value.bits_set?(0x10_u32)
    end

    # FOVR1
    def self.fovr1 : Bool
      value.fovr1
    end

    # FOVR1
    def self.fovr1=(value : Bool) : Bool
      self.set(fovr1: value)
      value
    end

    # FULL1
    def full1 : Bool
      @value.bits_set?(0x8_u32)
    end

    # FULL1
    def self.full1 : Bool
      value.full1
    end

    # FULL1
    def self.full1=(value : Bool) : Bool
      self.set(full1: value)
      value
    end

    # FMP1
    def fmp1 : UInt8
      UInt8.new!((@value >> 0) & 0x3_u32)
    end

    # FMP1
    def self.fmp1 : UInt8
      value.fmp1
    end

    def copy_with(
      *,

      rfom1 : Bool? = nil,

      fovr1 : Bool? = nil,

      full1 : Bool? = nil
    ) : self
      value = @value

      unless rfom1.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(rfom1.to_int).&(0x1_u32) << 5
      end

      unless fovr1.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(fovr1.to_int).&(0x1_u32) << 4
      end

      unless full1.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(full1.to_int).&(0x1_u32) << 3
      end

      self.class.new(value)
    end

    def self.set(
      *,
      rfom1 : Bool? = nil,
      fovr1 : Bool? = nil,
      full1 : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        rfom1: rfom1,
        fovr1: fovr1,
        full1: full1,
      )
    end
  end # struct

  # interrupt enable register
  struct IER
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

    # SLKIE
    def slkie : Bool
      @value.bits_set?(0x20000_u32)
    end

    # SLKIE
    def self.slkie : Bool
      value.slkie
    end

    # SLKIE
    def self.slkie=(value : Bool) : Bool
      self.set(slkie: value)
      value
    end

    # WKUIE
    def wkuie : Bool
      @value.bits_set?(0x10000_u32)
    end

    # WKUIE
    def self.wkuie : Bool
      value.wkuie
    end

    # WKUIE
    def self.wkuie=(value : Bool) : Bool
      self.set(wkuie: value)
      value
    end

    # ERRIE
    def errie : Bool
      @value.bits_set?(0x8000_u32)
    end

    # ERRIE
    def self.errie : Bool
      value.errie
    end

    # ERRIE
    def self.errie=(value : Bool) : Bool
      self.set(errie: value)
      value
    end

    # LECIE
    def lecie : Bool
      @value.bits_set?(0x800_u32)
    end

    # LECIE
    def self.lecie : Bool
      value.lecie
    end

    # LECIE
    def self.lecie=(value : Bool) : Bool
      self.set(lecie: value)
      value
    end

    # BOFIE
    def bofie : Bool
      @value.bits_set?(0x400_u32)
    end

    # BOFIE
    def self.bofie : Bool
      value.bofie
    end

    # BOFIE
    def self.bofie=(value : Bool) : Bool
      self.set(bofie: value)
      value
    end

    # EPVIE
    def epvie : Bool
      @value.bits_set?(0x200_u32)
    end

    # EPVIE
    def self.epvie : Bool
      value.epvie
    end

    # EPVIE
    def self.epvie=(value : Bool) : Bool
      self.set(epvie: value)
      value
    end

    # EWGIE
    def ewgie : Bool
      @value.bits_set?(0x100_u32)
    end

    # EWGIE
    def self.ewgie : Bool
      value.ewgie
    end

    # EWGIE
    def self.ewgie=(value : Bool) : Bool
      self.set(ewgie: value)
      value
    end

    # FOVIE1
    def fovie1 : Bool
      @value.bits_set?(0x40_u32)
    end

    # FOVIE1
    def self.fovie1 : Bool
      value.fovie1
    end

    # FOVIE1
    def self.fovie1=(value : Bool) : Bool
      self.set(fovie1: value)
      value
    end

    # FFIE1
    def ffie1 : Bool
      @value.bits_set?(0x20_u32)
    end

    # FFIE1
    def self.ffie1 : Bool
      value.ffie1
    end

    # FFIE1
    def self.ffie1=(value : Bool) : Bool
      self.set(ffie1: value)
      value
    end

    # FMPIE1
    def fmpie1 : Bool
      @value.bits_set?(0x10_u32)
    end

    # FMPIE1
    def self.fmpie1 : Bool
      value.fmpie1
    end

    # FMPIE1
    def self.fmpie1=(value : Bool) : Bool
      self.set(fmpie1: value)
      value
    end

    # FOVIE0
    def fovie0 : Bool
      @value.bits_set?(0x8_u32)
    end

    # FOVIE0
    def self.fovie0 : Bool
      value.fovie0
    end

    # FOVIE0
    def self.fovie0=(value : Bool) : Bool
      self.set(fovie0: value)
      value
    end

    # FFIE0
    def ffie0 : Bool
      @value.bits_set?(0x4_u32)
    end

    # FFIE0
    def self.ffie0 : Bool
      value.ffie0
    end

    # FFIE0
    def self.ffie0=(value : Bool) : Bool
      self.set(ffie0: value)
      value
    end

    # FMPIE0
    def fmpie0 : Bool
      @value.bits_set?(0x2_u32)
    end

    # FMPIE0
    def self.fmpie0 : Bool
      value.fmpie0
    end

    # FMPIE0
    def self.fmpie0=(value : Bool) : Bool
      self.set(fmpie0: value)
      value
    end

    # TMEIE
    def tmeie : Bool
      @value.bits_set?(0x1_u32)
    end

    # TMEIE
    def self.tmeie : Bool
      value.tmeie
    end

    # TMEIE
    def self.tmeie=(value : Bool) : Bool
      self.set(tmeie: value)
      value
    end

    def copy_with(
      *,

      slkie : Bool? = nil,

      wkuie : Bool? = nil,

      errie : Bool? = nil,

      lecie : Bool? = nil,

      bofie : Bool? = nil,

      epvie : Bool? = nil,

      ewgie : Bool? = nil,

      fovie1 : Bool? = nil,

      ffie1 : Bool? = nil,

      fmpie1 : Bool? = nil,

      fovie0 : Bool? = nil,

      ffie0 : Bool? = nil,

      fmpie0 : Bool? = nil,

      tmeie : Bool? = nil
    ) : self
      value = @value

      unless slkie.nil?
        value = (value & 0xfffdffff_u32) |
                UInt32.new!(slkie.to_int).&(0x1_u32) << 17
      end

      unless wkuie.nil?
        value = (value & 0xfffeffff_u32) |
                UInt32.new!(wkuie.to_int).&(0x1_u32) << 16
      end

      unless errie.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(errie.to_int).&(0x1_u32) << 15
      end

      unless lecie.nil?
        value = (value & 0xfffff7ff_u32) |
                UInt32.new!(lecie.to_int).&(0x1_u32) << 11
      end

      unless bofie.nil?
        value = (value & 0xfffffbff_u32) |
                UInt32.new!(bofie.to_int).&(0x1_u32) << 10
      end

      unless epvie.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(epvie.to_int).&(0x1_u32) << 9
      end

      unless ewgie.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(ewgie.to_int).&(0x1_u32) << 8
      end

      unless fovie1.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(fovie1.to_int).&(0x1_u32) << 6
      end

      unless ffie1.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(ffie1.to_int).&(0x1_u32) << 5
      end

      unless fmpie1.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(fmpie1.to_int).&(0x1_u32) << 4
      end

      unless fovie0.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(fovie0.to_int).&(0x1_u32) << 3
      end

      unless ffie0.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(ffie0.to_int).&(0x1_u32) << 2
      end

      unless fmpie0.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(fmpie0.to_int).&(0x1_u32) << 1
      end

      unless tmeie.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(tmeie.to_int).&(0x1_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      slkie : Bool? = nil,
      wkuie : Bool? = nil,
      errie : Bool? = nil,
      lecie : Bool? = nil,
      bofie : Bool? = nil,
      epvie : Bool? = nil,
      ewgie : Bool? = nil,
      fovie1 : Bool? = nil,
      ffie1 : Bool? = nil,
      fmpie1 : Bool? = nil,
      fovie0 : Bool? = nil,
      ffie0 : Bool? = nil,
      fmpie0 : Bool? = nil,
      tmeie : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        slkie: slkie,
        wkuie: wkuie,
        errie: errie,
        lecie: lecie,
        bofie: bofie,
        epvie: epvie,
        ewgie: ewgie,
        fovie1: fovie1,
        ffie1: ffie1,
        fmpie1: fmpie1,
        fovie0: fovie0,
        ffie0: ffie0,
        fmpie0: fmpie0,
        tmeie: tmeie,
      )
    end
  end # struct

  # interrupt enable register
  struct ESR
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

    # REC
    def rec : UInt8
      UInt8.new!((@value >> 24) & 0xff_u32)
    end

    # REC
    def self.rec : UInt8
      value.rec
    end

    # TEC
    def tec : UInt8
      UInt8.new!((@value >> 16) & 0xff_u32)
    end

    # TEC
    def self.tec : UInt8
      value.tec
    end

    # LEC
    def lec : UInt8
      UInt8.new!((@value >> 4) & 0x7_u32)
    end

    # LEC
    def self.lec : UInt8
      value.lec
    end

    # LEC
    def self.lec=(value : UInt8) : UInt8
      self.set(lec: value)
      value
    end

    # BOFF
    def boff : Bool
      @value.bits_set?(0x4_u32)
    end

    # BOFF
    def self.boff : Bool
      value.boff
    end

    # EPVF
    def epvf : Bool
      @value.bits_set?(0x2_u32)
    end

    # EPVF
    def self.epvf : Bool
      value.epvf
    end

    # EWGF
    def ewgf : Bool
      @value.bits_set?(0x1_u32)
    end

    # EWGF
    def self.ewgf : Bool
      value.ewgf
    end

    def copy_with(
      *,

      lec : UInt8? = nil
    ) : self
      value = @value

      unless lec.nil?
        value = (value & 0xffffff8f_u32) |
                UInt32.new!(lec.to_int).&(0x7_u32) << 4
      end

      self.class.new(value)
    end

    def self.set(
      *,
      lec : UInt8? = nil
    ) : Nil
      self.value = self.value.copy_with(
        lec: lec,
      )
    end
  end # struct

  # bit timing register
  struct BTR
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

    # SILM
    def silm : Bool
      @value.bits_set?(0x80000000_u32)
    end

    # SILM
    def self.silm : Bool
      value.silm
    end

    # SILM
    def self.silm=(value : Bool) : Bool
      self.set(silm: value)
      value
    end

    # LBKM
    def lbkm : Bool
      @value.bits_set?(0x40000000_u32)
    end

    # LBKM
    def self.lbkm : Bool
      value.lbkm
    end

    # LBKM
    def self.lbkm=(value : Bool) : Bool
      self.set(lbkm: value)
      value
    end

    # SJW
    def sjw : UInt8
      UInt8.new!((@value >> 24) & 0x3_u32)
    end

    # SJW
    def self.sjw : UInt8
      value.sjw
    end

    # SJW
    def self.sjw=(value : UInt8) : UInt8
      self.set(sjw: value)
      value
    end

    # TS2
    def ts2 : UInt8
      UInt8.new!((@value >> 20) & 0x7_u32)
    end

    # TS2
    def self.ts2 : UInt8
      value.ts2
    end

    # TS2
    def self.ts2=(value : UInt8) : UInt8
      self.set(ts2: value)
      value
    end

    # TS1
    def ts1 : UInt8
      UInt8.new!((@value >> 16) & 0xf_u32)
    end

    # TS1
    def self.ts1 : UInt8
      value.ts1
    end

    # TS1
    def self.ts1=(value : UInt8) : UInt8
      self.set(ts1: value)
      value
    end

    # BRP
    def brp : UInt16
      UInt16.new!((@value >> 0) & 0x3ff_u32)
    end

    # BRP
    def self.brp : UInt16
      value.brp
    end

    # BRP
    def self.brp=(value : UInt16) : UInt16
      self.set(brp: value)
      value
    end

    def copy_with(
      *,

      silm : Bool? = nil,

      lbkm : Bool? = nil,

      sjw : UInt8? = nil,

      ts2 : UInt8? = nil,

      ts1 : UInt8? = nil,

      brp : UInt16? = nil
    ) : self
      value = @value

      unless silm.nil?
        value = (value & 0x7fffffff_u32) |
                UInt32.new!(silm.to_int).&(0x1_u32) << 31
      end

      unless lbkm.nil?
        value = (value & 0xbfffffff_u32) |
                UInt32.new!(lbkm.to_int).&(0x1_u32) << 30
      end

      unless sjw.nil?
        value = (value & 0xfcffffff_u32) |
                UInt32.new!(sjw.to_int).&(0x3_u32) << 24
      end

      unless ts2.nil?
        value = (value & 0xff8fffff_u32) |
                UInt32.new!(ts2.to_int).&(0x7_u32) << 20
      end

      unless ts1.nil?
        value = (value & 0xfff0ffff_u32) |
                UInt32.new!(ts1.to_int).&(0xf_u32) << 16
      end

      unless brp.nil?
        value = (value & 0xfffffc00_u32) |
                UInt32.new!(brp.to_int).&(0x3ff_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      silm : Bool? = nil,
      lbkm : Bool? = nil,
      sjw : UInt8? = nil,
      ts2 : UInt8? = nil,
      ts1 : UInt8? = nil,
      brp : UInt16? = nil
    ) : Nil
      self.value = self.value.copy_with(
        silm: silm,
        lbkm: lbkm,
        sjw: sjw,
        ts2: ts2,
        ts1: ts1,
        brp: brp,
      )
    end
  end # struct

  # TX mailbox identifier register
  struct TI0R
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

    # STID
    def stid : UInt16
      UInt16.new!((@value >> 21) & 0x7ff_u32)
    end

    # STID
    def self.stid : UInt16
      value.stid
    end

    # STID
    def self.stid=(value : UInt16) : UInt16
      self.set(stid: value)
      value
    end

    # EXID
    def exid : UInt32
      UInt32.new!((@value >> 3) & 0x3ffff_u32)
    end

    # EXID
    def self.exid : UInt32
      value.exid
    end

    # EXID
    def self.exid=(value : UInt32) : UInt32
      self.set(exid: value)
      value
    end

    # IDE
    def ide : Bool
      @value.bits_set?(0x4_u32)
    end

    # IDE
    def self.ide : Bool
      value.ide
    end

    # IDE
    def self.ide=(value : Bool) : Bool
      self.set(ide: value)
      value
    end

    # RTR
    def rtr : Bool
      @value.bits_set?(0x2_u32)
    end

    # RTR
    def self.rtr : Bool
      value.rtr
    end

    # RTR
    def self.rtr=(value : Bool) : Bool
      self.set(rtr: value)
      value
    end

    # TXRQ
    def txrq : Bool
      @value.bits_set?(0x1_u32)
    end

    # TXRQ
    def self.txrq : Bool
      value.txrq
    end

    # TXRQ
    def self.txrq=(value : Bool) : Bool
      self.set(txrq: value)
      value
    end

    def copy_with(
      *,

      stid : UInt16? = nil,

      exid : UInt32? = nil,

      ide : Bool? = nil,

      rtr : Bool? = nil,

      txrq : Bool? = nil
    ) : self
      value = @value

      unless stid.nil?
        value = (value & 0x1fffff_u32) |
                UInt32.new!(stid.to_int).&(0x7ff_u32) << 21
      end

      unless exid.nil?
        value = (value & 0xffe00007_u32) |
                UInt32.new!(exid.to_int).&(0x3ffff_u32) << 3
      end

      unless ide.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(ide.to_int).&(0x1_u32) << 2
      end

      unless rtr.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(rtr.to_int).&(0x1_u32) << 1
      end

      unless txrq.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(txrq.to_int).&(0x1_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      stid : UInt16? = nil,
      exid : UInt32? = nil,
      ide : Bool? = nil,
      rtr : Bool? = nil,
      txrq : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        stid: stid,
        exid: exid,
        ide: ide,
        rtr: rtr,
        txrq: txrq,
      )
    end
  end # struct

  # mailbox data length control and time stamp          register
  struct TDT0R
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

    # TIME
    def time : UInt16
      UInt16.new!((@value >> 16) & 0xffff_u32)
    end

    # TIME
    def self.time : UInt16
      value.time
    end

    # TIME
    def self.time=(value : UInt16) : UInt16
      self.set(time: value)
      value
    end

    # TGT
    def tgt : Bool
      @value.bits_set?(0x100_u32)
    end

    # TGT
    def self.tgt : Bool
      value.tgt
    end

    # TGT
    def self.tgt=(value : Bool) : Bool
      self.set(tgt: value)
      value
    end

    # DLC
    def dlc : UInt8
      UInt8.new!((@value >> 0) & 0xf_u32)
    end

    # DLC
    def self.dlc : UInt8
      value.dlc
    end

    # DLC
    def self.dlc=(value : UInt8) : UInt8
      self.set(dlc: value)
      value
    end

    def copy_with(
      *,

      time : UInt16? = nil,

      tgt : Bool? = nil,

      dlc : UInt8? = nil
    ) : self
      value = @value

      unless time.nil?
        value = (value & 0xffff_u32) |
                UInt32.new!(time.to_int).&(0xffff_u32) << 16
      end

      unless tgt.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(tgt.to_int).&(0x1_u32) << 8
      end

      unless dlc.nil?
        value = (value & 0xfffffff0_u32) |
                UInt32.new!(dlc.to_int).&(0xf_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      time : UInt16? = nil,
      tgt : Bool? = nil,
      dlc : UInt8? = nil
    ) : Nil
      self.value = self.value.copy_with(
        time: time,
        tgt: tgt,
        dlc: dlc,
      )
    end
  end # struct

  # mailbox data low register
  struct TDL0R
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

    # DATA3
    def data3 : UInt8
      UInt8.new!((@value >> 24) & 0xff_u32)
    end

    # DATA3
    def self.data3 : UInt8
      value.data3
    end

    # DATA3
    def self.data3=(value : UInt8) : UInt8
      self.set(data3: value)
      value
    end

    # DATA2
    def data2 : UInt8
      UInt8.new!((@value >> 16) & 0xff_u32)
    end

    # DATA2
    def self.data2 : UInt8
      value.data2
    end

    # DATA2
    def self.data2=(value : UInt8) : UInt8
      self.set(data2: value)
      value
    end

    # DATA1
    def data1 : UInt8
      UInt8.new!((@value >> 8) & 0xff_u32)
    end

    # DATA1
    def self.data1 : UInt8
      value.data1
    end

    # DATA1
    def self.data1=(value : UInt8) : UInt8
      self.set(data1: value)
      value
    end

    # DATA0
    def data0 : UInt8
      UInt8.new!((@value >> 0) & 0xff_u32)
    end

    # DATA0
    def self.data0 : UInt8
      value.data0
    end

    # DATA0
    def self.data0=(value : UInt8) : UInt8
      self.set(data0: value)
      value
    end

    def copy_with(
      *,

      data3 : UInt8? = nil,

      data2 : UInt8? = nil,

      data1 : UInt8? = nil,

      data0 : UInt8? = nil
    ) : self
      value = @value

      unless data3.nil?
        value = (value & 0xffffff_u32) |
                UInt32.new!(data3.to_int).&(0xff_u32) << 24
      end

      unless data2.nil?
        value = (value & 0xff00ffff_u32) |
                UInt32.new!(data2.to_int).&(0xff_u32) << 16
      end

      unless data1.nil?
        value = (value & 0xffff00ff_u32) |
                UInt32.new!(data1.to_int).&(0xff_u32) << 8
      end

      unless data0.nil?
        value = (value & 0xffffff00_u32) |
                UInt32.new!(data0.to_int).&(0xff_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      data3 : UInt8? = nil,
      data2 : UInt8? = nil,
      data1 : UInt8? = nil,
      data0 : UInt8? = nil
    ) : Nil
      self.value = self.value.copy_with(
        data3: data3,
        data2: data2,
        data1: data1,
        data0: data0,
      )
    end
  end # struct

  # mailbox data high register
  struct TDH0R
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

    # DATA7
    def data7 : UInt8
      UInt8.new!((@value >> 24) & 0xff_u32)
    end

    # DATA7
    def self.data7 : UInt8
      value.data7
    end

    # DATA7
    def self.data7=(value : UInt8) : UInt8
      self.set(data7: value)
      value
    end

    # DATA6
    def data6 : UInt8
      UInt8.new!((@value >> 16) & 0xff_u32)
    end

    # DATA6
    def self.data6 : UInt8
      value.data6
    end

    # DATA6
    def self.data6=(value : UInt8) : UInt8
      self.set(data6: value)
      value
    end

    # DATA5
    def data5 : UInt8
      UInt8.new!((@value >> 8) & 0xff_u32)
    end

    # DATA5
    def self.data5 : UInt8
      value.data5
    end

    # DATA5
    def self.data5=(value : UInt8) : UInt8
      self.set(data5: value)
      value
    end

    # DATA4
    def data4 : UInt8
      UInt8.new!((@value >> 0) & 0xff_u32)
    end

    # DATA4
    def self.data4 : UInt8
      value.data4
    end

    # DATA4
    def self.data4=(value : UInt8) : UInt8
      self.set(data4: value)
      value
    end

    def copy_with(
      *,

      data7 : UInt8? = nil,

      data6 : UInt8? = nil,

      data5 : UInt8? = nil,

      data4 : UInt8? = nil
    ) : self
      value = @value

      unless data7.nil?
        value = (value & 0xffffff_u32) |
                UInt32.new!(data7.to_int).&(0xff_u32) << 24
      end

      unless data6.nil?
        value = (value & 0xff00ffff_u32) |
                UInt32.new!(data6.to_int).&(0xff_u32) << 16
      end

      unless data5.nil?
        value = (value & 0xffff00ff_u32) |
                UInt32.new!(data5.to_int).&(0xff_u32) << 8
      end

      unless data4.nil?
        value = (value & 0xffffff00_u32) |
                UInt32.new!(data4.to_int).&(0xff_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      data7 : UInt8? = nil,
      data6 : UInt8? = nil,
      data5 : UInt8? = nil,
      data4 : UInt8? = nil
    ) : Nil
      self.value = self.value.copy_with(
        data7: data7,
        data6: data6,
        data5: data5,
        data4: data4,
      )
    end
  end # struct

  # mailbox identifier register
  struct TI1R
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

    # STID
    def stid : UInt16
      UInt16.new!((@value >> 21) & 0x7ff_u32)
    end

    # STID
    def self.stid : UInt16
      value.stid
    end

    # STID
    def self.stid=(value : UInt16) : UInt16
      self.set(stid: value)
      value
    end

    # EXID
    def exid : UInt32
      UInt32.new!((@value >> 3) & 0x3ffff_u32)
    end

    # EXID
    def self.exid : UInt32
      value.exid
    end

    # EXID
    def self.exid=(value : UInt32) : UInt32
      self.set(exid: value)
      value
    end

    # IDE
    def ide : Bool
      @value.bits_set?(0x4_u32)
    end

    # IDE
    def self.ide : Bool
      value.ide
    end

    # IDE
    def self.ide=(value : Bool) : Bool
      self.set(ide: value)
      value
    end

    # RTR
    def rtr : Bool
      @value.bits_set?(0x2_u32)
    end

    # RTR
    def self.rtr : Bool
      value.rtr
    end

    # RTR
    def self.rtr=(value : Bool) : Bool
      self.set(rtr: value)
      value
    end

    # TXRQ
    def txrq : Bool
      @value.bits_set?(0x1_u32)
    end

    # TXRQ
    def self.txrq : Bool
      value.txrq
    end

    # TXRQ
    def self.txrq=(value : Bool) : Bool
      self.set(txrq: value)
      value
    end

    def copy_with(
      *,

      stid : UInt16? = nil,

      exid : UInt32? = nil,

      ide : Bool? = nil,

      rtr : Bool? = nil,

      txrq : Bool? = nil
    ) : self
      value = @value

      unless stid.nil?
        value = (value & 0x1fffff_u32) |
                UInt32.new!(stid.to_int).&(0x7ff_u32) << 21
      end

      unless exid.nil?
        value = (value & 0xffe00007_u32) |
                UInt32.new!(exid.to_int).&(0x3ffff_u32) << 3
      end

      unless ide.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(ide.to_int).&(0x1_u32) << 2
      end

      unless rtr.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(rtr.to_int).&(0x1_u32) << 1
      end

      unless txrq.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(txrq.to_int).&(0x1_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      stid : UInt16? = nil,
      exid : UInt32? = nil,
      ide : Bool? = nil,
      rtr : Bool? = nil,
      txrq : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        stid: stid,
        exid: exid,
        ide: ide,
        rtr: rtr,
        txrq: txrq,
      )
    end
  end # struct

  # mailbox data length control and time stamp          register
  struct TDT1R
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

    # TIME
    def time : UInt16
      UInt16.new!((@value >> 16) & 0xffff_u32)
    end

    # TIME
    def self.time : UInt16
      value.time
    end

    # TIME
    def self.time=(value : UInt16) : UInt16
      self.set(time: value)
      value
    end

    # TGT
    def tgt : Bool
      @value.bits_set?(0x100_u32)
    end

    # TGT
    def self.tgt : Bool
      value.tgt
    end

    # TGT
    def self.tgt=(value : Bool) : Bool
      self.set(tgt: value)
      value
    end

    # DLC
    def dlc : UInt8
      UInt8.new!((@value >> 0) & 0xf_u32)
    end

    # DLC
    def self.dlc : UInt8
      value.dlc
    end

    # DLC
    def self.dlc=(value : UInt8) : UInt8
      self.set(dlc: value)
      value
    end

    def copy_with(
      *,

      time : UInt16? = nil,

      tgt : Bool? = nil,

      dlc : UInt8? = nil
    ) : self
      value = @value

      unless time.nil?
        value = (value & 0xffff_u32) |
                UInt32.new!(time.to_int).&(0xffff_u32) << 16
      end

      unless tgt.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(tgt.to_int).&(0x1_u32) << 8
      end

      unless dlc.nil?
        value = (value & 0xfffffff0_u32) |
                UInt32.new!(dlc.to_int).&(0xf_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      time : UInt16? = nil,
      tgt : Bool? = nil,
      dlc : UInt8? = nil
    ) : Nil
      self.value = self.value.copy_with(
        time: time,
        tgt: tgt,
        dlc: dlc,
      )
    end
  end # struct

  # mailbox data low register
  struct TDL1R
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

    # DATA3
    def data3 : UInt8
      UInt8.new!((@value >> 24) & 0xff_u32)
    end

    # DATA3
    def self.data3 : UInt8
      value.data3
    end

    # DATA3
    def self.data3=(value : UInt8) : UInt8
      self.set(data3: value)
      value
    end

    # DATA2
    def data2 : UInt8
      UInt8.new!((@value >> 16) & 0xff_u32)
    end

    # DATA2
    def self.data2 : UInt8
      value.data2
    end

    # DATA2
    def self.data2=(value : UInt8) : UInt8
      self.set(data2: value)
      value
    end

    # DATA1
    def data1 : UInt8
      UInt8.new!((@value >> 8) & 0xff_u32)
    end

    # DATA1
    def self.data1 : UInt8
      value.data1
    end

    # DATA1
    def self.data1=(value : UInt8) : UInt8
      self.set(data1: value)
      value
    end

    # DATA0
    def data0 : UInt8
      UInt8.new!((@value >> 0) & 0xff_u32)
    end

    # DATA0
    def self.data0 : UInt8
      value.data0
    end

    # DATA0
    def self.data0=(value : UInt8) : UInt8
      self.set(data0: value)
      value
    end

    def copy_with(
      *,

      data3 : UInt8? = nil,

      data2 : UInt8? = nil,

      data1 : UInt8? = nil,

      data0 : UInt8? = nil
    ) : self
      value = @value

      unless data3.nil?
        value = (value & 0xffffff_u32) |
                UInt32.new!(data3.to_int).&(0xff_u32) << 24
      end

      unless data2.nil?
        value = (value & 0xff00ffff_u32) |
                UInt32.new!(data2.to_int).&(0xff_u32) << 16
      end

      unless data1.nil?
        value = (value & 0xffff00ff_u32) |
                UInt32.new!(data1.to_int).&(0xff_u32) << 8
      end

      unless data0.nil?
        value = (value & 0xffffff00_u32) |
                UInt32.new!(data0.to_int).&(0xff_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      data3 : UInt8? = nil,
      data2 : UInt8? = nil,
      data1 : UInt8? = nil,
      data0 : UInt8? = nil
    ) : Nil
      self.value = self.value.copy_with(
        data3: data3,
        data2: data2,
        data1: data1,
        data0: data0,
      )
    end
  end # struct

  # mailbox data high register
  struct TDH1R
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

    # DATA7
    def data7 : UInt8
      UInt8.new!((@value >> 24) & 0xff_u32)
    end

    # DATA7
    def self.data7 : UInt8
      value.data7
    end

    # DATA7
    def self.data7=(value : UInt8) : UInt8
      self.set(data7: value)
      value
    end

    # DATA6
    def data6 : UInt8
      UInt8.new!((@value >> 16) & 0xff_u32)
    end

    # DATA6
    def self.data6 : UInt8
      value.data6
    end

    # DATA6
    def self.data6=(value : UInt8) : UInt8
      self.set(data6: value)
      value
    end

    # DATA5
    def data5 : UInt8
      UInt8.new!((@value >> 8) & 0xff_u32)
    end

    # DATA5
    def self.data5 : UInt8
      value.data5
    end

    # DATA5
    def self.data5=(value : UInt8) : UInt8
      self.set(data5: value)
      value
    end

    # DATA4
    def data4 : UInt8
      UInt8.new!((@value >> 0) & 0xff_u32)
    end

    # DATA4
    def self.data4 : UInt8
      value.data4
    end

    # DATA4
    def self.data4=(value : UInt8) : UInt8
      self.set(data4: value)
      value
    end

    def copy_with(
      *,

      data7 : UInt8? = nil,

      data6 : UInt8? = nil,

      data5 : UInt8? = nil,

      data4 : UInt8? = nil
    ) : self
      value = @value

      unless data7.nil?
        value = (value & 0xffffff_u32) |
                UInt32.new!(data7.to_int).&(0xff_u32) << 24
      end

      unless data6.nil?
        value = (value & 0xff00ffff_u32) |
                UInt32.new!(data6.to_int).&(0xff_u32) << 16
      end

      unless data5.nil?
        value = (value & 0xffff00ff_u32) |
                UInt32.new!(data5.to_int).&(0xff_u32) << 8
      end

      unless data4.nil?
        value = (value & 0xffffff00_u32) |
                UInt32.new!(data4.to_int).&(0xff_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      data7 : UInt8? = nil,
      data6 : UInt8? = nil,
      data5 : UInt8? = nil,
      data4 : UInt8? = nil
    ) : Nil
      self.value = self.value.copy_with(
        data7: data7,
        data6: data6,
        data5: data5,
        data4: data4,
      )
    end
  end # struct

  # mailbox identifier register
  struct TI2R
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

    # STID
    def stid : UInt16
      UInt16.new!((@value >> 21) & 0x7ff_u32)
    end

    # STID
    def self.stid : UInt16
      value.stid
    end

    # STID
    def self.stid=(value : UInt16) : UInt16
      self.set(stid: value)
      value
    end

    # EXID
    def exid : UInt32
      UInt32.new!((@value >> 3) & 0x3ffff_u32)
    end

    # EXID
    def self.exid : UInt32
      value.exid
    end

    # EXID
    def self.exid=(value : UInt32) : UInt32
      self.set(exid: value)
      value
    end

    # IDE
    def ide : Bool
      @value.bits_set?(0x4_u32)
    end

    # IDE
    def self.ide : Bool
      value.ide
    end

    # IDE
    def self.ide=(value : Bool) : Bool
      self.set(ide: value)
      value
    end

    # RTR
    def rtr : Bool
      @value.bits_set?(0x2_u32)
    end

    # RTR
    def self.rtr : Bool
      value.rtr
    end

    # RTR
    def self.rtr=(value : Bool) : Bool
      self.set(rtr: value)
      value
    end

    # TXRQ
    def txrq : Bool
      @value.bits_set?(0x1_u32)
    end

    # TXRQ
    def self.txrq : Bool
      value.txrq
    end

    # TXRQ
    def self.txrq=(value : Bool) : Bool
      self.set(txrq: value)
      value
    end

    def copy_with(
      *,

      stid : UInt16? = nil,

      exid : UInt32? = nil,

      ide : Bool? = nil,

      rtr : Bool? = nil,

      txrq : Bool? = nil
    ) : self
      value = @value

      unless stid.nil?
        value = (value & 0x1fffff_u32) |
                UInt32.new!(stid.to_int).&(0x7ff_u32) << 21
      end

      unless exid.nil?
        value = (value & 0xffe00007_u32) |
                UInt32.new!(exid.to_int).&(0x3ffff_u32) << 3
      end

      unless ide.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(ide.to_int).&(0x1_u32) << 2
      end

      unless rtr.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(rtr.to_int).&(0x1_u32) << 1
      end

      unless txrq.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(txrq.to_int).&(0x1_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      stid : UInt16? = nil,
      exid : UInt32? = nil,
      ide : Bool? = nil,
      rtr : Bool? = nil,
      txrq : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        stid: stid,
        exid: exid,
        ide: ide,
        rtr: rtr,
        txrq: txrq,
      )
    end
  end # struct

  # mailbox data length control and time stamp          register
  struct TDT2R
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

    # TIME
    def time : UInt16
      UInt16.new!((@value >> 16) & 0xffff_u32)
    end

    # TIME
    def self.time : UInt16
      value.time
    end

    # TIME
    def self.time=(value : UInt16) : UInt16
      self.set(time: value)
      value
    end

    # TGT
    def tgt : Bool
      @value.bits_set?(0x100_u32)
    end

    # TGT
    def self.tgt : Bool
      value.tgt
    end

    # TGT
    def self.tgt=(value : Bool) : Bool
      self.set(tgt: value)
      value
    end

    # DLC
    def dlc : UInt8
      UInt8.new!((@value >> 0) & 0xf_u32)
    end

    # DLC
    def self.dlc : UInt8
      value.dlc
    end

    # DLC
    def self.dlc=(value : UInt8) : UInt8
      self.set(dlc: value)
      value
    end

    def copy_with(
      *,

      time : UInt16? = nil,

      tgt : Bool? = nil,

      dlc : UInt8? = nil
    ) : self
      value = @value

      unless time.nil?
        value = (value & 0xffff_u32) |
                UInt32.new!(time.to_int).&(0xffff_u32) << 16
      end

      unless tgt.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(tgt.to_int).&(0x1_u32) << 8
      end

      unless dlc.nil?
        value = (value & 0xfffffff0_u32) |
                UInt32.new!(dlc.to_int).&(0xf_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      time : UInt16? = nil,
      tgt : Bool? = nil,
      dlc : UInt8? = nil
    ) : Nil
      self.value = self.value.copy_with(
        time: time,
        tgt: tgt,
        dlc: dlc,
      )
    end
  end # struct

  # mailbox data low register
  struct TDL2R
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

    # DATA3
    def data3 : UInt8
      UInt8.new!((@value >> 24) & 0xff_u32)
    end

    # DATA3
    def self.data3 : UInt8
      value.data3
    end

    # DATA3
    def self.data3=(value : UInt8) : UInt8
      self.set(data3: value)
      value
    end

    # DATA2
    def data2 : UInt8
      UInt8.new!((@value >> 16) & 0xff_u32)
    end

    # DATA2
    def self.data2 : UInt8
      value.data2
    end

    # DATA2
    def self.data2=(value : UInt8) : UInt8
      self.set(data2: value)
      value
    end

    # DATA1
    def data1 : UInt8
      UInt8.new!((@value >> 8) & 0xff_u32)
    end

    # DATA1
    def self.data1 : UInt8
      value.data1
    end

    # DATA1
    def self.data1=(value : UInt8) : UInt8
      self.set(data1: value)
      value
    end

    # DATA0
    def data0 : UInt8
      UInt8.new!((@value >> 0) & 0xff_u32)
    end

    # DATA0
    def self.data0 : UInt8
      value.data0
    end

    # DATA0
    def self.data0=(value : UInt8) : UInt8
      self.set(data0: value)
      value
    end

    def copy_with(
      *,

      data3 : UInt8? = nil,

      data2 : UInt8? = nil,

      data1 : UInt8? = nil,

      data0 : UInt8? = nil
    ) : self
      value = @value

      unless data3.nil?
        value = (value & 0xffffff_u32) |
                UInt32.new!(data3.to_int).&(0xff_u32) << 24
      end

      unless data2.nil?
        value = (value & 0xff00ffff_u32) |
                UInt32.new!(data2.to_int).&(0xff_u32) << 16
      end

      unless data1.nil?
        value = (value & 0xffff00ff_u32) |
                UInt32.new!(data1.to_int).&(0xff_u32) << 8
      end

      unless data0.nil?
        value = (value & 0xffffff00_u32) |
                UInt32.new!(data0.to_int).&(0xff_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      data3 : UInt8? = nil,
      data2 : UInt8? = nil,
      data1 : UInt8? = nil,
      data0 : UInt8? = nil
    ) : Nil
      self.value = self.value.copy_with(
        data3: data3,
        data2: data2,
        data1: data1,
        data0: data0,
      )
    end
  end # struct

  # mailbox data high register
  struct TDH2R
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

    # DATA7
    def data7 : UInt8
      UInt8.new!((@value >> 24) & 0xff_u32)
    end

    # DATA7
    def self.data7 : UInt8
      value.data7
    end

    # DATA7
    def self.data7=(value : UInt8) : UInt8
      self.set(data7: value)
      value
    end

    # DATA6
    def data6 : UInt8
      UInt8.new!((@value >> 16) & 0xff_u32)
    end

    # DATA6
    def self.data6 : UInt8
      value.data6
    end

    # DATA6
    def self.data6=(value : UInt8) : UInt8
      self.set(data6: value)
      value
    end

    # DATA5
    def data5 : UInt8
      UInt8.new!((@value >> 8) & 0xff_u32)
    end

    # DATA5
    def self.data5 : UInt8
      value.data5
    end

    # DATA5
    def self.data5=(value : UInt8) : UInt8
      self.set(data5: value)
      value
    end

    # DATA4
    def data4 : UInt8
      UInt8.new!((@value >> 0) & 0xff_u32)
    end

    # DATA4
    def self.data4 : UInt8
      value.data4
    end

    # DATA4
    def self.data4=(value : UInt8) : UInt8
      self.set(data4: value)
      value
    end

    def copy_with(
      *,

      data7 : UInt8? = nil,

      data6 : UInt8? = nil,

      data5 : UInt8? = nil,

      data4 : UInt8? = nil
    ) : self
      value = @value

      unless data7.nil?
        value = (value & 0xffffff_u32) |
                UInt32.new!(data7.to_int).&(0xff_u32) << 24
      end

      unless data6.nil?
        value = (value & 0xff00ffff_u32) |
                UInt32.new!(data6.to_int).&(0xff_u32) << 16
      end

      unless data5.nil?
        value = (value & 0xffff00ff_u32) |
                UInt32.new!(data5.to_int).&(0xff_u32) << 8
      end

      unless data4.nil?
        value = (value & 0xffffff00_u32) |
                UInt32.new!(data4.to_int).&(0xff_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      data7 : UInt8? = nil,
      data6 : UInt8? = nil,
      data5 : UInt8? = nil,
      data4 : UInt8? = nil
    ) : Nil
      self.value = self.value.copy_with(
        data7: data7,
        data6: data6,
        data5: data5,
        data4: data4,
      )
    end
  end # struct

  # receive FIFO mailbox identifier          register
  struct RI0R
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

    # STID
    def stid : UInt16
      UInt16.new!((@value >> 21) & 0x7ff_u32)
    end

    # STID
    def self.stid : UInt16
      value.stid
    end

    # EXID
    def exid : UInt32
      UInt32.new!((@value >> 3) & 0x3ffff_u32)
    end

    # EXID
    def self.exid : UInt32
      value.exid
    end

    # IDE
    def ide : Bool
      @value.bits_set?(0x4_u32)
    end

    # IDE
    def self.ide : Bool
      value.ide
    end

    # RTR
    def rtr : Bool
      @value.bits_set?(0x2_u32)
    end

    # RTR
    def self.rtr : Bool
      value.rtr
    end
  end # struct

  # mailbox data high register
  struct RDT0R
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

    # TIME
    def time : UInt16
      UInt16.new!((@value >> 16) & 0xffff_u32)
    end

    # TIME
    def self.time : UInt16
      value.time
    end

    # FMI
    def fmi : UInt8
      UInt8.new!((@value >> 8) & 0xff_u32)
    end

    # FMI
    def self.fmi : UInt8
      value.fmi
    end

    # DLC
    def dlc : UInt8
      UInt8.new!((@value >> 0) & 0xf_u32)
    end

    # DLC
    def self.dlc : UInt8
      value.dlc
    end
  end # struct

  # mailbox data high register
  struct RDL0R
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

    # DATA3
    def data3 : UInt8
      UInt8.new!((@value >> 24) & 0xff_u32)
    end

    # DATA3
    def self.data3 : UInt8
      value.data3
    end

    # DATA2
    def data2 : UInt8
      UInt8.new!((@value >> 16) & 0xff_u32)
    end

    # DATA2
    def self.data2 : UInt8
      value.data2
    end

    # DATA1
    def data1 : UInt8
      UInt8.new!((@value >> 8) & 0xff_u32)
    end

    # DATA1
    def self.data1 : UInt8
      value.data1
    end

    # DATA0
    def data0 : UInt8
      UInt8.new!((@value >> 0) & 0xff_u32)
    end

    # DATA0
    def self.data0 : UInt8
      value.data0
    end
  end # struct

  # receive FIFO mailbox data high          register
  struct RDH0R
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

    # DATA7
    def data7 : UInt8
      UInt8.new!((@value >> 24) & 0xff_u32)
    end

    # DATA7
    def self.data7 : UInt8
      value.data7
    end

    # DATA6
    def data6 : UInt8
      UInt8.new!((@value >> 16) & 0xff_u32)
    end

    # DATA6
    def self.data6 : UInt8
      value.data6
    end

    # DATA5
    def data5 : UInt8
      UInt8.new!((@value >> 8) & 0xff_u32)
    end

    # DATA5
    def self.data5 : UInt8
      value.data5
    end

    # DATA4
    def data4 : UInt8
      UInt8.new!((@value >> 0) & 0xff_u32)
    end

    # DATA4
    def self.data4 : UInt8
      value.data4
    end
  end # struct

  # mailbox data high register
  struct RI1R
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

    # STID
    def stid : UInt16
      UInt16.new!((@value >> 21) & 0x7ff_u32)
    end

    # STID
    def self.stid : UInt16
      value.stid
    end

    # EXID
    def exid : UInt32
      UInt32.new!((@value >> 3) & 0x3ffff_u32)
    end

    # EXID
    def self.exid : UInt32
      value.exid
    end

    # IDE
    def ide : Bool
      @value.bits_set?(0x4_u32)
    end

    # IDE
    def self.ide : Bool
      value.ide
    end

    # RTR
    def rtr : Bool
      @value.bits_set?(0x2_u32)
    end

    # RTR
    def self.rtr : Bool
      value.rtr
    end
  end # struct

  # mailbox data high register
  struct RDT1R
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

    # TIME
    def time : UInt16
      UInt16.new!((@value >> 16) & 0xffff_u32)
    end

    # TIME
    def self.time : UInt16
      value.time
    end

    # FMI
    def fmi : UInt8
      UInt8.new!((@value >> 8) & 0xff_u32)
    end

    # FMI
    def self.fmi : UInt8
      value.fmi
    end

    # DLC
    def dlc : UInt8
      UInt8.new!((@value >> 0) & 0xf_u32)
    end

    # DLC
    def self.dlc : UInt8
      value.dlc
    end
  end # struct

  # mailbox data high register
  struct RDL1R
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

    # DATA3
    def data3 : UInt8
      UInt8.new!((@value >> 24) & 0xff_u32)
    end

    # DATA3
    def self.data3 : UInt8
      value.data3
    end

    # DATA2
    def data2 : UInt8
      UInt8.new!((@value >> 16) & 0xff_u32)
    end

    # DATA2
    def self.data2 : UInt8
      value.data2
    end

    # DATA1
    def data1 : UInt8
      UInt8.new!((@value >> 8) & 0xff_u32)
    end

    # DATA1
    def self.data1 : UInt8
      value.data1
    end

    # DATA0
    def data0 : UInt8
      UInt8.new!((@value >> 0) & 0xff_u32)
    end

    # DATA0
    def self.data0 : UInt8
      value.data0
    end
  end # struct

  # mailbox data high register
  struct RDH1R
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

    # DATA7
    def data7 : UInt8
      UInt8.new!((@value >> 24) & 0xff_u32)
    end

    # DATA7
    def self.data7 : UInt8
      value.data7
    end

    # DATA6
    def data6 : UInt8
      UInt8.new!((@value >> 16) & 0xff_u32)
    end

    # DATA6
    def self.data6 : UInt8
      value.data6
    end

    # DATA5
    def data5 : UInt8
      UInt8.new!((@value >> 8) & 0xff_u32)
    end

    # DATA5
    def self.data5 : UInt8
      value.data5
    end

    # DATA4
    def data4 : UInt8
      UInt8.new!((@value >> 0) & 0xff_u32)
    end

    # DATA4
    def self.data4 : UInt8
      value.data4
    end
  end # struct

  # filter master register
  struct FMR
    ADDRESS = BASE_ADDRESS + 0x200_u64

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
      new(0x2a1c0e01_u64)
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

    # CAN2SB
    def can2_sb : UInt8
      UInt8.new!((@value >> 8) & 0x3f_u32)
    end

    # CAN2SB
    def self.can2_sb : UInt8
      value.can2_sb
    end

    # CAN2SB
    def self.can2_sb=(value : UInt8) : UInt8
      self.set(can2_sb: value)
      value
    end

    # FINIT
    def finit : Bool
      @value.bits_set?(0x1_u32)
    end

    # FINIT
    def self.finit : Bool
      value.finit
    end

    # FINIT
    def self.finit=(value : Bool) : Bool
      self.set(finit: value)
      value
    end

    def copy_with(
      *,

      can2_sb : UInt8? = nil,

      finit : Bool? = nil
    ) : self
      value = @value

      unless can2_sb.nil?
        value = (value & 0xffffc0ff_u32) |
                UInt32.new!(can2_sb.to_int).&(0x3f_u32) << 8
      end

      unless finit.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(finit.to_int).&(0x1_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      can2_sb : UInt8? = nil,
      finit : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        can2_sb: can2_sb,
        finit: finit,
      )
    end
  end # struct

  # filter mode register
  struct FM1R
    ADDRESS = BASE_ADDRESS + 0x204_u64

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

    # Filter mode
    def fbm0 : Bool
      @value.bits_set?(0x1_u32)
    end

    # Filter mode
    def self.fbm0 : Bool
      value.fbm0
    end

    # Filter mode
    def self.fbm0=(value : Bool) : Bool
      self.set(fbm0: value)
      value
    end

    # Filter mode
    def fbm1 : Bool
      @value.bits_set?(0x2_u32)
    end

    # Filter mode
    def self.fbm1 : Bool
      value.fbm1
    end

    # Filter mode
    def self.fbm1=(value : Bool) : Bool
      self.set(fbm1: value)
      value
    end

    # Filter mode
    def fbm2 : Bool
      @value.bits_set?(0x4_u32)
    end

    # Filter mode
    def self.fbm2 : Bool
      value.fbm2
    end

    # Filter mode
    def self.fbm2=(value : Bool) : Bool
      self.set(fbm2: value)
      value
    end

    # Filter mode
    def fbm3 : Bool
      @value.bits_set?(0x8_u32)
    end

    # Filter mode
    def self.fbm3 : Bool
      value.fbm3
    end

    # Filter mode
    def self.fbm3=(value : Bool) : Bool
      self.set(fbm3: value)
      value
    end

    # Filter mode
    def fbm4 : Bool
      @value.bits_set?(0x10_u32)
    end

    # Filter mode
    def self.fbm4 : Bool
      value.fbm4
    end

    # Filter mode
    def self.fbm4=(value : Bool) : Bool
      self.set(fbm4: value)
      value
    end

    # Filter mode
    def fbm5 : Bool
      @value.bits_set?(0x20_u32)
    end

    # Filter mode
    def self.fbm5 : Bool
      value.fbm5
    end

    # Filter mode
    def self.fbm5=(value : Bool) : Bool
      self.set(fbm5: value)
      value
    end

    # Filter mode
    def fbm6 : Bool
      @value.bits_set?(0x40_u32)
    end

    # Filter mode
    def self.fbm6 : Bool
      value.fbm6
    end

    # Filter mode
    def self.fbm6=(value : Bool) : Bool
      self.set(fbm6: value)
      value
    end

    # Filter mode
    def fbm7 : Bool
      @value.bits_set?(0x80_u32)
    end

    # Filter mode
    def self.fbm7 : Bool
      value.fbm7
    end

    # Filter mode
    def self.fbm7=(value : Bool) : Bool
      self.set(fbm7: value)
      value
    end

    # Filter mode
    def fbm8 : Bool
      @value.bits_set?(0x100_u32)
    end

    # Filter mode
    def self.fbm8 : Bool
      value.fbm8
    end

    # Filter mode
    def self.fbm8=(value : Bool) : Bool
      self.set(fbm8: value)
      value
    end

    # Filter mode
    def fbm9 : Bool
      @value.bits_set?(0x200_u32)
    end

    # Filter mode
    def self.fbm9 : Bool
      value.fbm9
    end

    # Filter mode
    def self.fbm9=(value : Bool) : Bool
      self.set(fbm9: value)
      value
    end

    # Filter mode
    def fbm10 : Bool
      @value.bits_set?(0x400_u32)
    end

    # Filter mode
    def self.fbm10 : Bool
      value.fbm10
    end

    # Filter mode
    def self.fbm10=(value : Bool) : Bool
      self.set(fbm10: value)
      value
    end

    # Filter mode
    def fbm11 : Bool
      @value.bits_set?(0x800_u32)
    end

    # Filter mode
    def self.fbm11 : Bool
      value.fbm11
    end

    # Filter mode
    def self.fbm11=(value : Bool) : Bool
      self.set(fbm11: value)
      value
    end

    # Filter mode
    def fbm12 : Bool
      @value.bits_set?(0x1000_u32)
    end

    # Filter mode
    def self.fbm12 : Bool
      value.fbm12
    end

    # Filter mode
    def self.fbm12=(value : Bool) : Bool
      self.set(fbm12: value)
      value
    end

    # Filter mode
    def fbm13 : Bool
      @value.bits_set?(0x2000_u32)
    end

    # Filter mode
    def self.fbm13 : Bool
      value.fbm13
    end

    # Filter mode
    def self.fbm13=(value : Bool) : Bool
      self.set(fbm13: value)
      value
    end

    # Filter mode
    def fbm14 : Bool
      @value.bits_set?(0x4000_u32)
    end

    # Filter mode
    def self.fbm14 : Bool
      value.fbm14
    end

    # Filter mode
    def self.fbm14=(value : Bool) : Bool
      self.set(fbm14: value)
      value
    end

    # Filter mode
    def fbm15 : Bool
      @value.bits_set?(0x8000_u32)
    end

    # Filter mode
    def self.fbm15 : Bool
      value.fbm15
    end

    # Filter mode
    def self.fbm15=(value : Bool) : Bool
      self.set(fbm15: value)
      value
    end

    # Filter mode
    def fbm16 : Bool
      @value.bits_set?(0x10000_u32)
    end

    # Filter mode
    def self.fbm16 : Bool
      value.fbm16
    end

    # Filter mode
    def self.fbm16=(value : Bool) : Bool
      self.set(fbm16: value)
      value
    end

    # Filter mode
    def fbm17 : Bool
      @value.bits_set?(0x20000_u32)
    end

    # Filter mode
    def self.fbm17 : Bool
      value.fbm17
    end

    # Filter mode
    def self.fbm17=(value : Bool) : Bool
      self.set(fbm17: value)
      value
    end

    # Filter mode
    def fbm18 : Bool
      @value.bits_set?(0x40000_u32)
    end

    # Filter mode
    def self.fbm18 : Bool
      value.fbm18
    end

    # Filter mode
    def self.fbm18=(value : Bool) : Bool
      self.set(fbm18: value)
      value
    end

    # Filter mode
    def fbm19 : Bool
      @value.bits_set?(0x80000_u32)
    end

    # Filter mode
    def self.fbm19 : Bool
      value.fbm19
    end

    # Filter mode
    def self.fbm19=(value : Bool) : Bool
      self.set(fbm19: value)
      value
    end

    # Filter mode
    def fbm20 : Bool
      @value.bits_set?(0x100000_u32)
    end

    # Filter mode
    def self.fbm20 : Bool
      value.fbm20
    end

    # Filter mode
    def self.fbm20=(value : Bool) : Bool
      self.set(fbm20: value)
      value
    end

    # Filter mode
    def fbm21 : Bool
      @value.bits_set?(0x200000_u32)
    end

    # Filter mode
    def self.fbm21 : Bool
      value.fbm21
    end

    # Filter mode
    def self.fbm21=(value : Bool) : Bool
      self.set(fbm21: value)
      value
    end

    # Filter mode
    def fbm22 : Bool
      @value.bits_set?(0x400000_u32)
    end

    # Filter mode
    def self.fbm22 : Bool
      value.fbm22
    end

    # Filter mode
    def self.fbm22=(value : Bool) : Bool
      self.set(fbm22: value)
      value
    end

    # Filter mode
    def fbm23 : Bool
      @value.bits_set?(0x800000_u32)
    end

    # Filter mode
    def self.fbm23 : Bool
      value.fbm23
    end

    # Filter mode
    def self.fbm23=(value : Bool) : Bool
      self.set(fbm23: value)
      value
    end

    # Filter mode
    def fbm24 : Bool
      @value.bits_set?(0x1000000_u32)
    end

    # Filter mode
    def self.fbm24 : Bool
      value.fbm24
    end

    # Filter mode
    def self.fbm24=(value : Bool) : Bool
      self.set(fbm24: value)
      value
    end

    # Filter mode
    def fbm25 : Bool
      @value.bits_set?(0x2000000_u32)
    end

    # Filter mode
    def self.fbm25 : Bool
      value.fbm25
    end

    # Filter mode
    def self.fbm25=(value : Bool) : Bool
      self.set(fbm25: value)
      value
    end

    # Filter mode
    def fbm26 : Bool
      @value.bits_set?(0x4000000_u32)
    end

    # Filter mode
    def self.fbm26 : Bool
      value.fbm26
    end

    # Filter mode
    def self.fbm26=(value : Bool) : Bool
      self.set(fbm26: value)
      value
    end

    # Filter mode
    def fbm27 : Bool
      @value.bits_set?(0x8000000_u32)
    end

    # Filter mode
    def self.fbm27 : Bool
      value.fbm27
    end

    # Filter mode
    def self.fbm27=(value : Bool) : Bool
      self.set(fbm27: value)
      value
    end

    def copy_with(
      *,

      fbm0 : Bool? = nil,

      fbm1 : Bool? = nil,

      fbm2 : Bool? = nil,

      fbm3 : Bool? = nil,

      fbm4 : Bool? = nil,

      fbm5 : Bool? = nil,

      fbm6 : Bool? = nil,

      fbm7 : Bool? = nil,

      fbm8 : Bool? = nil,

      fbm9 : Bool? = nil,

      fbm10 : Bool? = nil,

      fbm11 : Bool? = nil,

      fbm12 : Bool? = nil,

      fbm13 : Bool? = nil,

      fbm14 : Bool? = nil,

      fbm15 : Bool? = nil,

      fbm16 : Bool? = nil,

      fbm17 : Bool? = nil,

      fbm18 : Bool? = nil,

      fbm19 : Bool? = nil,

      fbm20 : Bool? = nil,

      fbm21 : Bool? = nil,

      fbm22 : Bool? = nil,

      fbm23 : Bool? = nil,

      fbm24 : Bool? = nil,

      fbm25 : Bool? = nil,

      fbm26 : Bool? = nil,

      fbm27 : Bool? = nil
    ) : self
      value = @value

      unless fbm0.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(fbm0.to_int).&(0x1_u32) << 0
      end

      unless fbm1.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(fbm1.to_int).&(0x1_u32) << 1
      end

      unless fbm2.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(fbm2.to_int).&(0x1_u32) << 2
      end

      unless fbm3.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(fbm3.to_int).&(0x1_u32) << 3
      end

      unless fbm4.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(fbm4.to_int).&(0x1_u32) << 4
      end

      unless fbm5.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(fbm5.to_int).&(0x1_u32) << 5
      end

      unless fbm6.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(fbm6.to_int).&(0x1_u32) << 6
      end

      unless fbm7.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(fbm7.to_int).&(0x1_u32) << 7
      end

      unless fbm8.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(fbm8.to_int).&(0x1_u32) << 8
      end

      unless fbm9.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(fbm9.to_int).&(0x1_u32) << 9
      end

      unless fbm10.nil?
        value = (value & 0xfffffbff_u32) |
                UInt32.new!(fbm10.to_int).&(0x1_u32) << 10
      end

      unless fbm11.nil?
        value = (value & 0xfffff7ff_u32) |
                UInt32.new!(fbm11.to_int).&(0x1_u32) << 11
      end

      unless fbm12.nil?
        value = (value & 0xffffefff_u32) |
                UInt32.new!(fbm12.to_int).&(0x1_u32) << 12
      end

      unless fbm13.nil?
        value = (value & 0xffffdfff_u32) |
                UInt32.new!(fbm13.to_int).&(0x1_u32) << 13
      end

      unless fbm14.nil?
        value = (value & 0xffffbfff_u32) |
                UInt32.new!(fbm14.to_int).&(0x1_u32) << 14
      end

      unless fbm15.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(fbm15.to_int).&(0x1_u32) << 15
      end

      unless fbm16.nil?
        value = (value & 0xfffeffff_u32) |
                UInt32.new!(fbm16.to_int).&(0x1_u32) << 16
      end

      unless fbm17.nil?
        value = (value & 0xfffdffff_u32) |
                UInt32.new!(fbm17.to_int).&(0x1_u32) << 17
      end

      unless fbm18.nil?
        value = (value & 0xfffbffff_u32) |
                UInt32.new!(fbm18.to_int).&(0x1_u32) << 18
      end

      unless fbm19.nil?
        value = (value & 0xfff7ffff_u32) |
                UInt32.new!(fbm19.to_int).&(0x1_u32) << 19
      end

      unless fbm20.nil?
        value = (value & 0xffefffff_u32) |
                UInt32.new!(fbm20.to_int).&(0x1_u32) << 20
      end

      unless fbm21.nil?
        value = (value & 0xffdfffff_u32) |
                UInt32.new!(fbm21.to_int).&(0x1_u32) << 21
      end

      unless fbm22.nil?
        value = (value & 0xffbfffff_u32) |
                UInt32.new!(fbm22.to_int).&(0x1_u32) << 22
      end

      unless fbm23.nil?
        value = (value & 0xff7fffff_u32) |
                UInt32.new!(fbm23.to_int).&(0x1_u32) << 23
      end

      unless fbm24.nil?
        value = (value & 0xfeffffff_u32) |
                UInt32.new!(fbm24.to_int).&(0x1_u32) << 24
      end

      unless fbm25.nil?
        value = (value & 0xfdffffff_u32) |
                UInt32.new!(fbm25.to_int).&(0x1_u32) << 25
      end

      unless fbm26.nil?
        value = (value & 0xfbffffff_u32) |
                UInt32.new!(fbm26.to_int).&(0x1_u32) << 26
      end

      unless fbm27.nil?
        value = (value & 0xf7ffffff_u32) |
                UInt32.new!(fbm27.to_int).&(0x1_u32) << 27
      end

      self.class.new(value)
    end

    def self.set(
      *,
      fbm0 : Bool? = nil,
      fbm1 : Bool? = nil,
      fbm2 : Bool? = nil,
      fbm3 : Bool? = nil,
      fbm4 : Bool? = nil,
      fbm5 : Bool? = nil,
      fbm6 : Bool? = nil,
      fbm7 : Bool? = nil,
      fbm8 : Bool? = nil,
      fbm9 : Bool? = nil,
      fbm10 : Bool? = nil,
      fbm11 : Bool? = nil,
      fbm12 : Bool? = nil,
      fbm13 : Bool? = nil,
      fbm14 : Bool? = nil,
      fbm15 : Bool? = nil,
      fbm16 : Bool? = nil,
      fbm17 : Bool? = nil,
      fbm18 : Bool? = nil,
      fbm19 : Bool? = nil,
      fbm20 : Bool? = nil,
      fbm21 : Bool? = nil,
      fbm22 : Bool? = nil,
      fbm23 : Bool? = nil,
      fbm24 : Bool? = nil,
      fbm25 : Bool? = nil,
      fbm26 : Bool? = nil,
      fbm27 : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        fbm0: fbm0,
        fbm1: fbm1,
        fbm2: fbm2,
        fbm3: fbm3,
        fbm4: fbm4,
        fbm5: fbm5,
        fbm6: fbm6,
        fbm7: fbm7,
        fbm8: fbm8,
        fbm9: fbm9,
        fbm10: fbm10,
        fbm11: fbm11,
        fbm12: fbm12,
        fbm13: fbm13,
        fbm14: fbm14,
        fbm15: fbm15,
        fbm16: fbm16,
        fbm17: fbm17,
        fbm18: fbm18,
        fbm19: fbm19,
        fbm20: fbm20,
        fbm21: fbm21,
        fbm22: fbm22,
        fbm23: fbm23,
        fbm24: fbm24,
        fbm25: fbm25,
        fbm26: fbm26,
        fbm27: fbm27,
      )
    end
  end # struct

  # filter scale register
  struct FS1R
    ADDRESS = BASE_ADDRESS + 0x20c_u64

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

    # Filter scale configuration
    def fsc0 : Bool
      @value.bits_set?(0x1_u32)
    end

    # Filter scale configuration
    def self.fsc0 : Bool
      value.fsc0
    end

    # Filter scale configuration
    def self.fsc0=(value : Bool) : Bool
      self.set(fsc0: value)
      value
    end

    # Filter scale configuration
    def fsc1 : Bool
      @value.bits_set?(0x2_u32)
    end

    # Filter scale configuration
    def self.fsc1 : Bool
      value.fsc1
    end

    # Filter scale configuration
    def self.fsc1=(value : Bool) : Bool
      self.set(fsc1: value)
      value
    end

    # Filter scale configuration
    def fsc2 : Bool
      @value.bits_set?(0x4_u32)
    end

    # Filter scale configuration
    def self.fsc2 : Bool
      value.fsc2
    end

    # Filter scale configuration
    def self.fsc2=(value : Bool) : Bool
      self.set(fsc2: value)
      value
    end

    # Filter scale configuration
    def fsc3 : Bool
      @value.bits_set?(0x8_u32)
    end

    # Filter scale configuration
    def self.fsc3 : Bool
      value.fsc3
    end

    # Filter scale configuration
    def self.fsc3=(value : Bool) : Bool
      self.set(fsc3: value)
      value
    end

    # Filter scale configuration
    def fsc4 : Bool
      @value.bits_set?(0x10_u32)
    end

    # Filter scale configuration
    def self.fsc4 : Bool
      value.fsc4
    end

    # Filter scale configuration
    def self.fsc4=(value : Bool) : Bool
      self.set(fsc4: value)
      value
    end

    # Filter scale configuration
    def fsc5 : Bool
      @value.bits_set?(0x20_u32)
    end

    # Filter scale configuration
    def self.fsc5 : Bool
      value.fsc5
    end

    # Filter scale configuration
    def self.fsc5=(value : Bool) : Bool
      self.set(fsc5: value)
      value
    end

    # Filter scale configuration
    def fsc6 : Bool
      @value.bits_set?(0x40_u32)
    end

    # Filter scale configuration
    def self.fsc6 : Bool
      value.fsc6
    end

    # Filter scale configuration
    def self.fsc6=(value : Bool) : Bool
      self.set(fsc6: value)
      value
    end

    # Filter scale configuration
    def fsc7 : Bool
      @value.bits_set?(0x80_u32)
    end

    # Filter scale configuration
    def self.fsc7 : Bool
      value.fsc7
    end

    # Filter scale configuration
    def self.fsc7=(value : Bool) : Bool
      self.set(fsc7: value)
      value
    end

    # Filter scale configuration
    def fsc8 : Bool
      @value.bits_set?(0x100_u32)
    end

    # Filter scale configuration
    def self.fsc8 : Bool
      value.fsc8
    end

    # Filter scale configuration
    def self.fsc8=(value : Bool) : Bool
      self.set(fsc8: value)
      value
    end

    # Filter scale configuration
    def fsc9 : Bool
      @value.bits_set?(0x200_u32)
    end

    # Filter scale configuration
    def self.fsc9 : Bool
      value.fsc9
    end

    # Filter scale configuration
    def self.fsc9=(value : Bool) : Bool
      self.set(fsc9: value)
      value
    end

    # Filter scale configuration
    def fsc10 : Bool
      @value.bits_set?(0x400_u32)
    end

    # Filter scale configuration
    def self.fsc10 : Bool
      value.fsc10
    end

    # Filter scale configuration
    def self.fsc10=(value : Bool) : Bool
      self.set(fsc10: value)
      value
    end

    # Filter scale configuration
    def fsc11 : Bool
      @value.bits_set?(0x800_u32)
    end

    # Filter scale configuration
    def self.fsc11 : Bool
      value.fsc11
    end

    # Filter scale configuration
    def self.fsc11=(value : Bool) : Bool
      self.set(fsc11: value)
      value
    end

    # Filter scale configuration
    def fsc12 : Bool
      @value.bits_set?(0x1000_u32)
    end

    # Filter scale configuration
    def self.fsc12 : Bool
      value.fsc12
    end

    # Filter scale configuration
    def self.fsc12=(value : Bool) : Bool
      self.set(fsc12: value)
      value
    end

    # Filter scale configuration
    def fsc13 : Bool
      @value.bits_set?(0x2000_u32)
    end

    # Filter scale configuration
    def self.fsc13 : Bool
      value.fsc13
    end

    # Filter scale configuration
    def self.fsc13=(value : Bool) : Bool
      self.set(fsc13: value)
      value
    end

    # Filter scale configuration
    def fsc14 : Bool
      @value.bits_set?(0x4000_u32)
    end

    # Filter scale configuration
    def self.fsc14 : Bool
      value.fsc14
    end

    # Filter scale configuration
    def self.fsc14=(value : Bool) : Bool
      self.set(fsc14: value)
      value
    end

    # Filter scale configuration
    def fsc15 : Bool
      @value.bits_set?(0x8000_u32)
    end

    # Filter scale configuration
    def self.fsc15 : Bool
      value.fsc15
    end

    # Filter scale configuration
    def self.fsc15=(value : Bool) : Bool
      self.set(fsc15: value)
      value
    end

    # Filter scale configuration
    def fsc16 : Bool
      @value.bits_set?(0x10000_u32)
    end

    # Filter scale configuration
    def self.fsc16 : Bool
      value.fsc16
    end

    # Filter scale configuration
    def self.fsc16=(value : Bool) : Bool
      self.set(fsc16: value)
      value
    end

    # Filter scale configuration
    def fsc17 : Bool
      @value.bits_set?(0x20000_u32)
    end

    # Filter scale configuration
    def self.fsc17 : Bool
      value.fsc17
    end

    # Filter scale configuration
    def self.fsc17=(value : Bool) : Bool
      self.set(fsc17: value)
      value
    end

    # Filter scale configuration
    def fsc18 : Bool
      @value.bits_set?(0x40000_u32)
    end

    # Filter scale configuration
    def self.fsc18 : Bool
      value.fsc18
    end

    # Filter scale configuration
    def self.fsc18=(value : Bool) : Bool
      self.set(fsc18: value)
      value
    end

    # Filter scale configuration
    def fsc19 : Bool
      @value.bits_set?(0x80000_u32)
    end

    # Filter scale configuration
    def self.fsc19 : Bool
      value.fsc19
    end

    # Filter scale configuration
    def self.fsc19=(value : Bool) : Bool
      self.set(fsc19: value)
      value
    end

    # Filter scale configuration
    def fsc20 : Bool
      @value.bits_set?(0x100000_u32)
    end

    # Filter scale configuration
    def self.fsc20 : Bool
      value.fsc20
    end

    # Filter scale configuration
    def self.fsc20=(value : Bool) : Bool
      self.set(fsc20: value)
      value
    end

    # Filter scale configuration
    def fsc21 : Bool
      @value.bits_set?(0x200000_u32)
    end

    # Filter scale configuration
    def self.fsc21 : Bool
      value.fsc21
    end

    # Filter scale configuration
    def self.fsc21=(value : Bool) : Bool
      self.set(fsc21: value)
      value
    end

    # Filter scale configuration
    def fsc22 : Bool
      @value.bits_set?(0x400000_u32)
    end

    # Filter scale configuration
    def self.fsc22 : Bool
      value.fsc22
    end

    # Filter scale configuration
    def self.fsc22=(value : Bool) : Bool
      self.set(fsc22: value)
      value
    end

    # Filter scale configuration
    def fsc23 : Bool
      @value.bits_set?(0x800000_u32)
    end

    # Filter scale configuration
    def self.fsc23 : Bool
      value.fsc23
    end

    # Filter scale configuration
    def self.fsc23=(value : Bool) : Bool
      self.set(fsc23: value)
      value
    end

    # Filter scale configuration
    def fsc24 : Bool
      @value.bits_set?(0x1000000_u32)
    end

    # Filter scale configuration
    def self.fsc24 : Bool
      value.fsc24
    end

    # Filter scale configuration
    def self.fsc24=(value : Bool) : Bool
      self.set(fsc24: value)
      value
    end

    # Filter scale configuration
    def fsc25 : Bool
      @value.bits_set?(0x2000000_u32)
    end

    # Filter scale configuration
    def self.fsc25 : Bool
      value.fsc25
    end

    # Filter scale configuration
    def self.fsc25=(value : Bool) : Bool
      self.set(fsc25: value)
      value
    end

    # Filter scale configuration
    def fsc26 : Bool
      @value.bits_set?(0x4000000_u32)
    end

    # Filter scale configuration
    def self.fsc26 : Bool
      value.fsc26
    end

    # Filter scale configuration
    def self.fsc26=(value : Bool) : Bool
      self.set(fsc26: value)
      value
    end

    # Filter scale configuration
    def fsc27 : Bool
      @value.bits_set?(0x8000000_u32)
    end

    # Filter scale configuration
    def self.fsc27 : Bool
      value.fsc27
    end

    # Filter scale configuration
    def self.fsc27=(value : Bool) : Bool
      self.set(fsc27: value)
      value
    end

    def copy_with(
      *,

      fsc0 : Bool? = nil,

      fsc1 : Bool? = nil,

      fsc2 : Bool? = nil,

      fsc3 : Bool? = nil,

      fsc4 : Bool? = nil,

      fsc5 : Bool? = nil,

      fsc6 : Bool? = nil,

      fsc7 : Bool? = nil,

      fsc8 : Bool? = nil,

      fsc9 : Bool? = nil,

      fsc10 : Bool? = nil,

      fsc11 : Bool? = nil,

      fsc12 : Bool? = nil,

      fsc13 : Bool? = nil,

      fsc14 : Bool? = nil,

      fsc15 : Bool? = nil,

      fsc16 : Bool? = nil,

      fsc17 : Bool? = nil,

      fsc18 : Bool? = nil,

      fsc19 : Bool? = nil,

      fsc20 : Bool? = nil,

      fsc21 : Bool? = nil,

      fsc22 : Bool? = nil,

      fsc23 : Bool? = nil,

      fsc24 : Bool? = nil,

      fsc25 : Bool? = nil,

      fsc26 : Bool? = nil,

      fsc27 : Bool? = nil
    ) : self
      value = @value

      unless fsc0.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(fsc0.to_int).&(0x1_u32) << 0
      end

      unless fsc1.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(fsc1.to_int).&(0x1_u32) << 1
      end

      unless fsc2.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(fsc2.to_int).&(0x1_u32) << 2
      end

      unless fsc3.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(fsc3.to_int).&(0x1_u32) << 3
      end

      unless fsc4.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(fsc4.to_int).&(0x1_u32) << 4
      end

      unless fsc5.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(fsc5.to_int).&(0x1_u32) << 5
      end

      unless fsc6.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(fsc6.to_int).&(0x1_u32) << 6
      end

      unless fsc7.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(fsc7.to_int).&(0x1_u32) << 7
      end

      unless fsc8.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(fsc8.to_int).&(0x1_u32) << 8
      end

      unless fsc9.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(fsc9.to_int).&(0x1_u32) << 9
      end

      unless fsc10.nil?
        value = (value & 0xfffffbff_u32) |
                UInt32.new!(fsc10.to_int).&(0x1_u32) << 10
      end

      unless fsc11.nil?
        value = (value & 0xfffff7ff_u32) |
                UInt32.new!(fsc11.to_int).&(0x1_u32) << 11
      end

      unless fsc12.nil?
        value = (value & 0xffffefff_u32) |
                UInt32.new!(fsc12.to_int).&(0x1_u32) << 12
      end

      unless fsc13.nil?
        value = (value & 0xffffdfff_u32) |
                UInt32.new!(fsc13.to_int).&(0x1_u32) << 13
      end

      unless fsc14.nil?
        value = (value & 0xffffbfff_u32) |
                UInt32.new!(fsc14.to_int).&(0x1_u32) << 14
      end

      unless fsc15.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(fsc15.to_int).&(0x1_u32) << 15
      end

      unless fsc16.nil?
        value = (value & 0xfffeffff_u32) |
                UInt32.new!(fsc16.to_int).&(0x1_u32) << 16
      end

      unless fsc17.nil?
        value = (value & 0xfffdffff_u32) |
                UInt32.new!(fsc17.to_int).&(0x1_u32) << 17
      end

      unless fsc18.nil?
        value = (value & 0xfffbffff_u32) |
                UInt32.new!(fsc18.to_int).&(0x1_u32) << 18
      end

      unless fsc19.nil?
        value = (value & 0xfff7ffff_u32) |
                UInt32.new!(fsc19.to_int).&(0x1_u32) << 19
      end

      unless fsc20.nil?
        value = (value & 0xffefffff_u32) |
                UInt32.new!(fsc20.to_int).&(0x1_u32) << 20
      end

      unless fsc21.nil?
        value = (value & 0xffdfffff_u32) |
                UInt32.new!(fsc21.to_int).&(0x1_u32) << 21
      end

      unless fsc22.nil?
        value = (value & 0xffbfffff_u32) |
                UInt32.new!(fsc22.to_int).&(0x1_u32) << 22
      end

      unless fsc23.nil?
        value = (value & 0xff7fffff_u32) |
                UInt32.new!(fsc23.to_int).&(0x1_u32) << 23
      end

      unless fsc24.nil?
        value = (value & 0xfeffffff_u32) |
                UInt32.new!(fsc24.to_int).&(0x1_u32) << 24
      end

      unless fsc25.nil?
        value = (value & 0xfdffffff_u32) |
                UInt32.new!(fsc25.to_int).&(0x1_u32) << 25
      end

      unless fsc26.nil?
        value = (value & 0xfbffffff_u32) |
                UInt32.new!(fsc26.to_int).&(0x1_u32) << 26
      end

      unless fsc27.nil?
        value = (value & 0xf7ffffff_u32) |
                UInt32.new!(fsc27.to_int).&(0x1_u32) << 27
      end

      self.class.new(value)
    end

    def self.set(
      *,
      fsc0 : Bool? = nil,
      fsc1 : Bool? = nil,
      fsc2 : Bool? = nil,
      fsc3 : Bool? = nil,
      fsc4 : Bool? = nil,
      fsc5 : Bool? = nil,
      fsc6 : Bool? = nil,
      fsc7 : Bool? = nil,
      fsc8 : Bool? = nil,
      fsc9 : Bool? = nil,
      fsc10 : Bool? = nil,
      fsc11 : Bool? = nil,
      fsc12 : Bool? = nil,
      fsc13 : Bool? = nil,
      fsc14 : Bool? = nil,
      fsc15 : Bool? = nil,
      fsc16 : Bool? = nil,
      fsc17 : Bool? = nil,
      fsc18 : Bool? = nil,
      fsc19 : Bool? = nil,
      fsc20 : Bool? = nil,
      fsc21 : Bool? = nil,
      fsc22 : Bool? = nil,
      fsc23 : Bool? = nil,
      fsc24 : Bool? = nil,
      fsc25 : Bool? = nil,
      fsc26 : Bool? = nil,
      fsc27 : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        fsc0: fsc0,
        fsc1: fsc1,
        fsc2: fsc2,
        fsc3: fsc3,
        fsc4: fsc4,
        fsc5: fsc5,
        fsc6: fsc6,
        fsc7: fsc7,
        fsc8: fsc8,
        fsc9: fsc9,
        fsc10: fsc10,
        fsc11: fsc11,
        fsc12: fsc12,
        fsc13: fsc13,
        fsc14: fsc14,
        fsc15: fsc15,
        fsc16: fsc16,
        fsc17: fsc17,
        fsc18: fsc18,
        fsc19: fsc19,
        fsc20: fsc20,
        fsc21: fsc21,
        fsc22: fsc22,
        fsc23: fsc23,
        fsc24: fsc24,
        fsc25: fsc25,
        fsc26: fsc26,
        fsc27: fsc27,
      )
    end
  end # struct

  # filter FIFO assignment          register
  struct FFA1R
    ADDRESS = BASE_ADDRESS + 0x214_u64

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

    # Filter FIFO assignment for filter              0
    def ffa0 : Bool
      @value.bits_set?(0x1_u32)
    end

    # Filter FIFO assignment for filter              0
    def self.ffa0 : Bool
      value.ffa0
    end

    # Filter FIFO assignment for filter              0
    def self.ffa0=(value : Bool) : Bool
      self.set(ffa0: value)
      value
    end

    # Filter FIFO assignment for filter              1
    def ffa1 : Bool
      @value.bits_set?(0x2_u32)
    end

    # Filter FIFO assignment for filter              1
    def self.ffa1 : Bool
      value.ffa1
    end

    # Filter FIFO assignment for filter              1
    def self.ffa1=(value : Bool) : Bool
      self.set(ffa1: value)
      value
    end

    # Filter FIFO assignment for filter              2
    def ffa2 : Bool
      @value.bits_set?(0x4_u32)
    end

    # Filter FIFO assignment for filter              2
    def self.ffa2 : Bool
      value.ffa2
    end

    # Filter FIFO assignment for filter              2
    def self.ffa2=(value : Bool) : Bool
      self.set(ffa2: value)
      value
    end

    # Filter FIFO assignment for filter              3
    def ffa3 : Bool
      @value.bits_set?(0x8_u32)
    end

    # Filter FIFO assignment for filter              3
    def self.ffa3 : Bool
      value.ffa3
    end

    # Filter FIFO assignment for filter              3
    def self.ffa3=(value : Bool) : Bool
      self.set(ffa3: value)
      value
    end

    # Filter FIFO assignment for filter              4
    def ffa4 : Bool
      @value.bits_set?(0x10_u32)
    end

    # Filter FIFO assignment for filter              4
    def self.ffa4 : Bool
      value.ffa4
    end

    # Filter FIFO assignment for filter              4
    def self.ffa4=(value : Bool) : Bool
      self.set(ffa4: value)
      value
    end

    # Filter FIFO assignment for filter              5
    def ffa5 : Bool
      @value.bits_set?(0x20_u32)
    end

    # Filter FIFO assignment for filter              5
    def self.ffa5 : Bool
      value.ffa5
    end

    # Filter FIFO assignment for filter              5
    def self.ffa5=(value : Bool) : Bool
      self.set(ffa5: value)
      value
    end

    # Filter FIFO assignment for filter              6
    def ffa6 : Bool
      @value.bits_set?(0x40_u32)
    end

    # Filter FIFO assignment for filter              6
    def self.ffa6 : Bool
      value.ffa6
    end

    # Filter FIFO assignment for filter              6
    def self.ffa6=(value : Bool) : Bool
      self.set(ffa6: value)
      value
    end

    # Filter FIFO assignment for filter              7
    def ffa7 : Bool
      @value.bits_set?(0x80_u32)
    end

    # Filter FIFO assignment for filter              7
    def self.ffa7 : Bool
      value.ffa7
    end

    # Filter FIFO assignment for filter              7
    def self.ffa7=(value : Bool) : Bool
      self.set(ffa7: value)
      value
    end

    # Filter FIFO assignment for filter              8
    def ffa8 : Bool
      @value.bits_set?(0x100_u32)
    end

    # Filter FIFO assignment for filter              8
    def self.ffa8 : Bool
      value.ffa8
    end

    # Filter FIFO assignment for filter              8
    def self.ffa8=(value : Bool) : Bool
      self.set(ffa8: value)
      value
    end

    # Filter FIFO assignment for filter              9
    def ffa9 : Bool
      @value.bits_set?(0x200_u32)
    end

    # Filter FIFO assignment for filter              9
    def self.ffa9 : Bool
      value.ffa9
    end

    # Filter FIFO assignment for filter              9
    def self.ffa9=(value : Bool) : Bool
      self.set(ffa9: value)
      value
    end

    # Filter FIFO assignment for filter              10
    def ffa10 : Bool
      @value.bits_set?(0x400_u32)
    end

    # Filter FIFO assignment for filter              10
    def self.ffa10 : Bool
      value.ffa10
    end

    # Filter FIFO assignment for filter              10
    def self.ffa10=(value : Bool) : Bool
      self.set(ffa10: value)
      value
    end

    # Filter FIFO assignment for filter              11
    def ffa11 : Bool
      @value.bits_set?(0x800_u32)
    end

    # Filter FIFO assignment for filter              11
    def self.ffa11 : Bool
      value.ffa11
    end

    # Filter FIFO assignment for filter              11
    def self.ffa11=(value : Bool) : Bool
      self.set(ffa11: value)
      value
    end

    # Filter FIFO assignment for filter              12
    def ffa12 : Bool
      @value.bits_set?(0x1000_u32)
    end

    # Filter FIFO assignment for filter              12
    def self.ffa12 : Bool
      value.ffa12
    end

    # Filter FIFO assignment for filter              12
    def self.ffa12=(value : Bool) : Bool
      self.set(ffa12: value)
      value
    end

    # Filter FIFO assignment for filter              13
    def ffa13 : Bool
      @value.bits_set?(0x2000_u32)
    end

    # Filter FIFO assignment for filter              13
    def self.ffa13 : Bool
      value.ffa13
    end

    # Filter FIFO assignment for filter              13
    def self.ffa13=(value : Bool) : Bool
      self.set(ffa13: value)
      value
    end

    # Filter FIFO assignment for filter              14
    def ffa14 : Bool
      @value.bits_set?(0x4000_u32)
    end

    # Filter FIFO assignment for filter              14
    def self.ffa14 : Bool
      value.ffa14
    end

    # Filter FIFO assignment for filter              14
    def self.ffa14=(value : Bool) : Bool
      self.set(ffa14: value)
      value
    end

    # Filter FIFO assignment for filter              15
    def ffa15 : Bool
      @value.bits_set?(0x8000_u32)
    end

    # Filter FIFO assignment for filter              15
    def self.ffa15 : Bool
      value.ffa15
    end

    # Filter FIFO assignment for filter              15
    def self.ffa15=(value : Bool) : Bool
      self.set(ffa15: value)
      value
    end

    # Filter FIFO assignment for filter              16
    def ffa16 : Bool
      @value.bits_set?(0x10000_u32)
    end

    # Filter FIFO assignment for filter              16
    def self.ffa16 : Bool
      value.ffa16
    end

    # Filter FIFO assignment for filter              16
    def self.ffa16=(value : Bool) : Bool
      self.set(ffa16: value)
      value
    end

    # Filter FIFO assignment for filter              17
    def ffa17 : Bool
      @value.bits_set?(0x20000_u32)
    end

    # Filter FIFO assignment for filter              17
    def self.ffa17 : Bool
      value.ffa17
    end

    # Filter FIFO assignment for filter              17
    def self.ffa17=(value : Bool) : Bool
      self.set(ffa17: value)
      value
    end

    # Filter FIFO assignment for filter              18
    def ffa18 : Bool
      @value.bits_set?(0x40000_u32)
    end

    # Filter FIFO assignment for filter              18
    def self.ffa18 : Bool
      value.ffa18
    end

    # Filter FIFO assignment for filter              18
    def self.ffa18=(value : Bool) : Bool
      self.set(ffa18: value)
      value
    end

    # Filter FIFO assignment for filter              19
    def ffa19 : Bool
      @value.bits_set?(0x80000_u32)
    end

    # Filter FIFO assignment for filter              19
    def self.ffa19 : Bool
      value.ffa19
    end

    # Filter FIFO assignment for filter              19
    def self.ffa19=(value : Bool) : Bool
      self.set(ffa19: value)
      value
    end

    # Filter FIFO assignment for filter              20
    def ffa20 : Bool
      @value.bits_set?(0x100000_u32)
    end

    # Filter FIFO assignment for filter              20
    def self.ffa20 : Bool
      value.ffa20
    end

    # Filter FIFO assignment for filter              20
    def self.ffa20=(value : Bool) : Bool
      self.set(ffa20: value)
      value
    end

    # Filter FIFO assignment for filter              21
    def ffa21 : Bool
      @value.bits_set?(0x200000_u32)
    end

    # Filter FIFO assignment for filter              21
    def self.ffa21 : Bool
      value.ffa21
    end

    # Filter FIFO assignment for filter              21
    def self.ffa21=(value : Bool) : Bool
      self.set(ffa21: value)
      value
    end

    # Filter FIFO assignment for filter              22
    def ffa22 : Bool
      @value.bits_set?(0x400000_u32)
    end

    # Filter FIFO assignment for filter              22
    def self.ffa22 : Bool
      value.ffa22
    end

    # Filter FIFO assignment for filter              22
    def self.ffa22=(value : Bool) : Bool
      self.set(ffa22: value)
      value
    end

    # Filter FIFO assignment for filter              23
    def ffa23 : Bool
      @value.bits_set?(0x800000_u32)
    end

    # Filter FIFO assignment for filter              23
    def self.ffa23 : Bool
      value.ffa23
    end

    # Filter FIFO assignment for filter              23
    def self.ffa23=(value : Bool) : Bool
      self.set(ffa23: value)
      value
    end

    # Filter FIFO assignment for filter              24
    def ffa24 : Bool
      @value.bits_set?(0x1000000_u32)
    end

    # Filter FIFO assignment for filter              24
    def self.ffa24 : Bool
      value.ffa24
    end

    # Filter FIFO assignment for filter              24
    def self.ffa24=(value : Bool) : Bool
      self.set(ffa24: value)
      value
    end

    # Filter FIFO assignment for filter              25
    def ffa25 : Bool
      @value.bits_set?(0x2000000_u32)
    end

    # Filter FIFO assignment for filter              25
    def self.ffa25 : Bool
      value.ffa25
    end

    # Filter FIFO assignment for filter              25
    def self.ffa25=(value : Bool) : Bool
      self.set(ffa25: value)
      value
    end

    # Filter FIFO assignment for filter              26
    def ffa26 : Bool
      @value.bits_set?(0x4000000_u32)
    end

    # Filter FIFO assignment for filter              26
    def self.ffa26 : Bool
      value.ffa26
    end

    # Filter FIFO assignment for filter              26
    def self.ffa26=(value : Bool) : Bool
      self.set(ffa26: value)
      value
    end

    # Filter FIFO assignment for filter              27
    def ffa27 : Bool
      @value.bits_set?(0x8000000_u32)
    end

    # Filter FIFO assignment for filter              27
    def self.ffa27 : Bool
      value.ffa27
    end

    # Filter FIFO assignment for filter              27
    def self.ffa27=(value : Bool) : Bool
      self.set(ffa27: value)
      value
    end

    def copy_with(
      *,

      ffa0 : Bool? = nil,

      ffa1 : Bool? = nil,

      ffa2 : Bool? = nil,

      ffa3 : Bool? = nil,

      ffa4 : Bool? = nil,

      ffa5 : Bool? = nil,

      ffa6 : Bool? = nil,

      ffa7 : Bool? = nil,

      ffa8 : Bool? = nil,

      ffa9 : Bool? = nil,

      ffa10 : Bool? = nil,

      ffa11 : Bool? = nil,

      ffa12 : Bool? = nil,

      ffa13 : Bool? = nil,

      ffa14 : Bool? = nil,

      ffa15 : Bool? = nil,

      ffa16 : Bool? = nil,

      ffa17 : Bool? = nil,

      ffa18 : Bool? = nil,

      ffa19 : Bool? = nil,

      ffa20 : Bool? = nil,

      ffa21 : Bool? = nil,

      ffa22 : Bool? = nil,

      ffa23 : Bool? = nil,

      ffa24 : Bool? = nil,

      ffa25 : Bool? = nil,

      ffa26 : Bool? = nil,

      ffa27 : Bool? = nil
    ) : self
      value = @value

      unless ffa0.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(ffa0.to_int).&(0x1_u32) << 0
      end

      unless ffa1.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(ffa1.to_int).&(0x1_u32) << 1
      end

      unless ffa2.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(ffa2.to_int).&(0x1_u32) << 2
      end

      unless ffa3.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(ffa3.to_int).&(0x1_u32) << 3
      end

      unless ffa4.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(ffa4.to_int).&(0x1_u32) << 4
      end

      unless ffa5.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(ffa5.to_int).&(0x1_u32) << 5
      end

      unless ffa6.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(ffa6.to_int).&(0x1_u32) << 6
      end

      unless ffa7.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(ffa7.to_int).&(0x1_u32) << 7
      end

      unless ffa8.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(ffa8.to_int).&(0x1_u32) << 8
      end

      unless ffa9.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(ffa9.to_int).&(0x1_u32) << 9
      end

      unless ffa10.nil?
        value = (value & 0xfffffbff_u32) |
                UInt32.new!(ffa10.to_int).&(0x1_u32) << 10
      end

      unless ffa11.nil?
        value = (value & 0xfffff7ff_u32) |
                UInt32.new!(ffa11.to_int).&(0x1_u32) << 11
      end

      unless ffa12.nil?
        value = (value & 0xffffefff_u32) |
                UInt32.new!(ffa12.to_int).&(0x1_u32) << 12
      end

      unless ffa13.nil?
        value = (value & 0xffffdfff_u32) |
                UInt32.new!(ffa13.to_int).&(0x1_u32) << 13
      end

      unless ffa14.nil?
        value = (value & 0xffffbfff_u32) |
                UInt32.new!(ffa14.to_int).&(0x1_u32) << 14
      end

      unless ffa15.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(ffa15.to_int).&(0x1_u32) << 15
      end

      unless ffa16.nil?
        value = (value & 0xfffeffff_u32) |
                UInt32.new!(ffa16.to_int).&(0x1_u32) << 16
      end

      unless ffa17.nil?
        value = (value & 0xfffdffff_u32) |
                UInt32.new!(ffa17.to_int).&(0x1_u32) << 17
      end

      unless ffa18.nil?
        value = (value & 0xfffbffff_u32) |
                UInt32.new!(ffa18.to_int).&(0x1_u32) << 18
      end

      unless ffa19.nil?
        value = (value & 0xfff7ffff_u32) |
                UInt32.new!(ffa19.to_int).&(0x1_u32) << 19
      end

      unless ffa20.nil?
        value = (value & 0xffefffff_u32) |
                UInt32.new!(ffa20.to_int).&(0x1_u32) << 20
      end

      unless ffa21.nil?
        value = (value & 0xffdfffff_u32) |
                UInt32.new!(ffa21.to_int).&(0x1_u32) << 21
      end

      unless ffa22.nil?
        value = (value & 0xffbfffff_u32) |
                UInt32.new!(ffa22.to_int).&(0x1_u32) << 22
      end

      unless ffa23.nil?
        value = (value & 0xff7fffff_u32) |
                UInt32.new!(ffa23.to_int).&(0x1_u32) << 23
      end

      unless ffa24.nil?
        value = (value & 0xfeffffff_u32) |
                UInt32.new!(ffa24.to_int).&(0x1_u32) << 24
      end

      unless ffa25.nil?
        value = (value & 0xfdffffff_u32) |
                UInt32.new!(ffa25.to_int).&(0x1_u32) << 25
      end

      unless ffa26.nil?
        value = (value & 0xfbffffff_u32) |
                UInt32.new!(ffa26.to_int).&(0x1_u32) << 26
      end

      unless ffa27.nil?
        value = (value & 0xf7ffffff_u32) |
                UInt32.new!(ffa27.to_int).&(0x1_u32) << 27
      end

      self.class.new(value)
    end

    def self.set(
      *,
      ffa0 : Bool? = nil,
      ffa1 : Bool? = nil,
      ffa2 : Bool? = nil,
      ffa3 : Bool? = nil,
      ffa4 : Bool? = nil,
      ffa5 : Bool? = nil,
      ffa6 : Bool? = nil,
      ffa7 : Bool? = nil,
      ffa8 : Bool? = nil,
      ffa9 : Bool? = nil,
      ffa10 : Bool? = nil,
      ffa11 : Bool? = nil,
      ffa12 : Bool? = nil,
      ffa13 : Bool? = nil,
      ffa14 : Bool? = nil,
      ffa15 : Bool? = nil,
      ffa16 : Bool? = nil,
      ffa17 : Bool? = nil,
      ffa18 : Bool? = nil,
      ffa19 : Bool? = nil,
      ffa20 : Bool? = nil,
      ffa21 : Bool? = nil,
      ffa22 : Bool? = nil,
      ffa23 : Bool? = nil,
      ffa24 : Bool? = nil,
      ffa25 : Bool? = nil,
      ffa26 : Bool? = nil,
      ffa27 : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        ffa0: ffa0,
        ffa1: ffa1,
        ffa2: ffa2,
        ffa3: ffa3,
        ffa4: ffa4,
        ffa5: ffa5,
        ffa6: ffa6,
        ffa7: ffa7,
        ffa8: ffa8,
        ffa9: ffa9,
        ffa10: ffa10,
        ffa11: ffa11,
        ffa12: ffa12,
        ffa13: ffa13,
        ffa14: ffa14,
        ffa15: ffa15,
        ffa16: ffa16,
        ffa17: ffa17,
        ffa18: ffa18,
        ffa19: ffa19,
        ffa20: ffa20,
        ffa21: ffa21,
        ffa22: ffa22,
        ffa23: ffa23,
        ffa24: ffa24,
        ffa25: ffa25,
        ffa26: ffa26,
        ffa27: ffa27,
      )
    end
  end # struct

  # filter activation register
  struct FA1R
    ADDRESS = BASE_ADDRESS + 0x21c_u64

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

    # Filter active
    def fact0 : Bool
      @value.bits_set?(0x1_u32)
    end

    # Filter active
    def self.fact0 : Bool
      value.fact0
    end

    # Filter active
    def self.fact0=(value : Bool) : Bool
      self.set(fact0: value)
      value
    end

    # Filter active
    def fact1 : Bool
      @value.bits_set?(0x2_u32)
    end

    # Filter active
    def self.fact1 : Bool
      value.fact1
    end

    # Filter active
    def self.fact1=(value : Bool) : Bool
      self.set(fact1: value)
      value
    end

    # Filter active
    def fact2 : Bool
      @value.bits_set?(0x4_u32)
    end

    # Filter active
    def self.fact2 : Bool
      value.fact2
    end

    # Filter active
    def self.fact2=(value : Bool) : Bool
      self.set(fact2: value)
      value
    end

    # Filter active
    def fact3 : Bool
      @value.bits_set?(0x8_u32)
    end

    # Filter active
    def self.fact3 : Bool
      value.fact3
    end

    # Filter active
    def self.fact3=(value : Bool) : Bool
      self.set(fact3: value)
      value
    end

    # Filter active
    def fact4 : Bool
      @value.bits_set?(0x10_u32)
    end

    # Filter active
    def self.fact4 : Bool
      value.fact4
    end

    # Filter active
    def self.fact4=(value : Bool) : Bool
      self.set(fact4: value)
      value
    end

    # Filter active
    def fact5 : Bool
      @value.bits_set?(0x20_u32)
    end

    # Filter active
    def self.fact5 : Bool
      value.fact5
    end

    # Filter active
    def self.fact5=(value : Bool) : Bool
      self.set(fact5: value)
      value
    end

    # Filter active
    def fact6 : Bool
      @value.bits_set?(0x40_u32)
    end

    # Filter active
    def self.fact6 : Bool
      value.fact6
    end

    # Filter active
    def self.fact6=(value : Bool) : Bool
      self.set(fact6: value)
      value
    end

    # Filter active
    def fact7 : Bool
      @value.bits_set?(0x80_u32)
    end

    # Filter active
    def self.fact7 : Bool
      value.fact7
    end

    # Filter active
    def self.fact7=(value : Bool) : Bool
      self.set(fact7: value)
      value
    end

    # Filter active
    def fact8 : Bool
      @value.bits_set?(0x100_u32)
    end

    # Filter active
    def self.fact8 : Bool
      value.fact8
    end

    # Filter active
    def self.fact8=(value : Bool) : Bool
      self.set(fact8: value)
      value
    end

    # Filter active
    def fact9 : Bool
      @value.bits_set?(0x200_u32)
    end

    # Filter active
    def self.fact9 : Bool
      value.fact9
    end

    # Filter active
    def self.fact9=(value : Bool) : Bool
      self.set(fact9: value)
      value
    end

    # Filter active
    def fact10 : Bool
      @value.bits_set?(0x400_u32)
    end

    # Filter active
    def self.fact10 : Bool
      value.fact10
    end

    # Filter active
    def self.fact10=(value : Bool) : Bool
      self.set(fact10: value)
      value
    end

    # Filter active
    def fact11 : Bool
      @value.bits_set?(0x800_u32)
    end

    # Filter active
    def self.fact11 : Bool
      value.fact11
    end

    # Filter active
    def self.fact11=(value : Bool) : Bool
      self.set(fact11: value)
      value
    end

    # Filter active
    def fact12 : Bool
      @value.bits_set?(0x1000_u32)
    end

    # Filter active
    def self.fact12 : Bool
      value.fact12
    end

    # Filter active
    def self.fact12=(value : Bool) : Bool
      self.set(fact12: value)
      value
    end

    # Filter active
    def fact13 : Bool
      @value.bits_set?(0x2000_u32)
    end

    # Filter active
    def self.fact13 : Bool
      value.fact13
    end

    # Filter active
    def self.fact13=(value : Bool) : Bool
      self.set(fact13: value)
      value
    end

    # Filter active
    def fact14 : Bool
      @value.bits_set?(0x4000_u32)
    end

    # Filter active
    def self.fact14 : Bool
      value.fact14
    end

    # Filter active
    def self.fact14=(value : Bool) : Bool
      self.set(fact14: value)
      value
    end

    # Filter active
    def fact15 : Bool
      @value.bits_set?(0x8000_u32)
    end

    # Filter active
    def self.fact15 : Bool
      value.fact15
    end

    # Filter active
    def self.fact15=(value : Bool) : Bool
      self.set(fact15: value)
      value
    end

    # Filter active
    def fact16 : Bool
      @value.bits_set?(0x10000_u32)
    end

    # Filter active
    def self.fact16 : Bool
      value.fact16
    end

    # Filter active
    def self.fact16=(value : Bool) : Bool
      self.set(fact16: value)
      value
    end

    # Filter active
    def fact17 : Bool
      @value.bits_set?(0x20000_u32)
    end

    # Filter active
    def self.fact17 : Bool
      value.fact17
    end

    # Filter active
    def self.fact17=(value : Bool) : Bool
      self.set(fact17: value)
      value
    end

    # Filter active
    def fact18 : Bool
      @value.bits_set?(0x40000_u32)
    end

    # Filter active
    def self.fact18 : Bool
      value.fact18
    end

    # Filter active
    def self.fact18=(value : Bool) : Bool
      self.set(fact18: value)
      value
    end

    # Filter active
    def fact19 : Bool
      @value.bits_set?(0x80000_u32)
    end

    # Filter active
    def self.fact19 : Bool
      value.fact19
    end

    # Filter active
    def self.fact19=(value : Bool) : Bool
      self.set(fact19: value)
      value
    end

    # Filter active
    def fact20 : Bool
      @value.bits_set?(0x100000_u32)
    end

    # Filter active
    def self.fact20 : Bool
      value.fact20
    end

    # Filter active
    def self.fact20=(value : Bool) : Bool
      self.set(fact20: value)
      value
    end

    # Filter active
    def fact21 : Bool
      @value.bits_set?(0x200000_u32)
    end

    # Filter active
    def self.fact21 : Bool
      value.fact21
    end

    # Filter active
    def self.fact21=(value : Bool) : Bool
      self.set(fact21: value)
      value
    end

    # Filter active
    def fact22 : Bool
      @value.bits_set?(0x400000_u32)
    end

    # Filter active
    def self.fact22 : Bool
      value.fact22
    end

    # Filter active
    def self.fact22=(value : Bool) : Bool
      self.set(fact22: value)
      value
    end

    # Filter active
    def fact23 : Bool
      @value.bits_set?(0x800000_u32)
    end

    # Filter active
    def self.fact23 : Bool
      value.fact23
    end

    # Filter active
    def self.fact23=(value : Bool) : Bool
      self.set(fact23: value)
      value
    end

    # Filter active
    def fact24 : Bool
      @value.bits_set?(0x1000000_u32)
    end

    # Filter active
    def self.fact24 : Bool
      value.fact24
    end

    # Filter active
    def self.fact24=(value : Bool) : Bool
      self.set(fact24: value)
      value
    end

    # Filter active
    def fact25 : Bool
      @value.bits_set?(0x2000000_u32)
    end

    # Filter active
    def self.fact25 : Bool
      value.fact25
    end

    # Filter active
    def self.fact25=(value : Bool) : Bool
      self.set(fact25: value)
      value
    end

    # Filter active
    def fact26 : Bool
      @value.bits_set?(0x4000000_u32)
    end

    # Filter active
    def self.fact26 : Bool
      value.fact26
    end

    # Filter active
    def self.fact26=(value : Bool) : Bool
      self.set(fact26: value)
      value
    end

    # Filter active
    def fact27 : Bool
      @value.bits_set?(0x8000000_u32)
    end

    # Filter active
    def self.fact27 : Bool
      value.fact27
    end

    # Filter active
    def self.fact27=(value : Bool) : Bool
      self.set(fact27: value)
      value
    end

    def copy_with(
      *,

      fact0 : Bool? = nil,

      fact1 : Bool? = nil,

      fact2 : Bool? = nil,

      fact3 : Bool? = nil,

      fact4 : Bool? = nil,

      fact5 : Bool? = nil,

      fact6 : Bool? = nil,

      fact7 : Bool? = nil,

      fact8 : Bool? = nil,

      fact9 : Bool? = nil,

      fact10 : Bool? = nil,

      fact11 : Bool? = nil,

      fact12 : Bool? = nil,

      fact13 : Bool? = nil,

      fact14 : Bool? = nil,

      fact15 : Bool? = nil,

      fact16 : Bool? = nil,

      fact17 : Bool? = nil,

      fact18 : Bool? = nil,

      fact19 : Bool? = nil,

      fact20 : Bool? = nil,

      fact21 : Bool? = nil,

      fact22 : Bool? = nil,

      fact23 : Bool? = nil,

      fact24 : Bool? = nil,

      fact25 : Bool? = nil,

      fact26 : Bool? = nil,

      fact27 : Bool? = nil
    ) : self
      value = @value

      unless fact0.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(fact0.to_int).&(0x1_u32) << 0
      end

      unless fact1.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(fact1.to_int).&(0x1_u32) << 1
      end

      unless fact2.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(fact2.to_int).&(0x1_u32) << 2
      end

      unless fact3.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(fact3.to_int).&(0x1_u32) << 3
      end

      unless fact4.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(fact4.to_int).&(0x1_u32) << 4
      end

      unless fact5.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(fact5.to_int).&(0x1_u32) << 5
      end

      unless fact6.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(fact6.to_int).&(0x1_u32) << 6
      end

      unless fact7.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(fact7.to_int).&(0x1_u32) << 7
      end

      unless fact8.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(fact8.to_int).&(0x1_u32) << 8
      end

      unless fact9.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(fact9.to_int).&(0x1_u32) << 9
      end

      unless fact10.nil?
        value = (value & 0xfffffbff_u32) |
                UInt32.new!(fact10.to_int).&(0x1_u32) << 10
      end

      unless fact11.nil?
        value = (value & 0xfffff7ff_u32) |
                UInt32.new!(fact11.to_int).&(0x1_u32) << 11
      end

      unless fact12.nil?
        value = (value & 0xffffefff_u32) |
                UInt32.new!(fact12.to_int).&(0x1_u32) << 12
      end

      unless fact13.nil?
        value = (value & 0xffffdfff_u32) |
                UInt32.new!(fact13.to_int).&(0x1_u32) << 13
      end

      unless fact14.nil?
        value = (value & 0xffffbfff_u32) |
                UInt32.new!(fact14.to_int).&(0x1_u32) << 14
      end

      unless fact15.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(fact15.to_int).&(0x1_u32) << 15
      end

      unless fact16.nil?
        value = (value & 0xfffeffff_u32) |
                UInt32.new!(fact16.to_int).&(0x1_u32) << 16
      end

      unless fact17.nil?
        value = (value & 0xfffdffff_u32) |
                UInt32.new!(fact17.to_int).&(0x1_u32) << 17
      end

      unless fact18.nil?
        value = (value & 0xfffbffff_u32) |
                UInt32.new!(fact18.to_int).&(0x1_u32) << 18
      end

      unless fact19.nil?
        value = (value & 0xfff7ffff_u32) |
                UInt32.new!(fact19.to_int).&(0x1_u32) << 19
      end

      unless fact20.nil?
        value = (value & 0xffefffff_u32) |
                UInt32.new!(fact20.to_int).&(0x1_u32) << 20
      end

      unless fact21.nil?
        value = (value & 0xffdfffff_u32) |
                UInt32.new!(fact21.to_int).&(0x1_u32) << 21
      end

      unless fact22.nil?
        value = (value & 0xffbfffff_u32) |
                UInt32.new!(fact22.to_int).&(0x1_u32) << 22
      end

      unless fact23.nil?
        value = (value & 0xff7fffff_u32) |
                UInt32.new!(fact23.to_int).&(0x1_u32) << 23
      end

      unless fact24.nil?
        value = (value & 0xfeffffff_u32) |
                UInt32.new!(fact24.to_int).&(0x1_u32) << 24
      end

      unless fact25.nil?
        value = (value & 0xfdffffff_u32) |
                UInt32.new!(fact25.to_int).&(0x1_u32) << 25
      end

      unless fact26.nil?
        value = (value & 0xfbffffff_u32) |
                UInt32.new!(fact26.to_int).&(0x1_u32) << 26
      end

      unless fact27.nil?
        value = (value & 0xf7ffffff_u32) |
                UInt32.new!(fact27.to_int).&(0x1_u32) << 27
      end

      self.class.new(value)
    end

    def self.set(
      *,
      fact0 : Bool? = nil,
      fact1 : Bool? = nil,
      fact2 : Bool? = nil,
      fact3 : Bool? = nil,
      fact4 : Bool? = nil,
      fact5 : Bool? = nil,
      fact6 : Bool? = nil,
      fact7 : Bool? = nil,
      fact8 : Bool? = nil,
      fact9 : Bool? = nil,
      fact10 : Bool? = nil,
      fact11 : Bool? = nil,
      fact12 : Bool? = nil,
      fact13 : Bool? = nil,
      fact14 : Bool? = nil,
      fact15 : Bool? = nil,
      fact16 : Bool? = nil,
      fact17 : Bool? = nil,
      fact18 : Bool? = nil,
      fact19 : Bool? = nil,
      fact20 : Bool? = nil,
      fact21 : Bool? = nil,
      fact22 : Bool? = nil,
      fact23 : Bool? = nil,
      fact24 : Bool? = nil,
      fact25 : Bool? = nil,
      fact26 : Bool? = nil,
      fact27 : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        fact0: fact0,
        fact1: fact1,
        fact2: fact2,
        fact3: fact3,
        fact4: fact4,
        fact5: fact5,
        fact6: fact6,
        fact7: fact7,
        fact8: fact8,
        fact9: fact9,
        fact10: fact10,
        fact11: fact11,
        fact12: fact12,
        fact13: fact13,
        fact14: fact14,
        fact15: fact15,
        fact16: fact16,
        fact17: fact17,
        fact18: fact18,
        fact19: fact19,
        fact20: fact20,
        fact21: fact21,
        fact22: fact22,
        fact23: fact23,
        fact24: fact24,
        fact25: fact25,
        fact26: fact26,
        fact27: fact27,
      )
    end
  end # struct

  # Filter bank 0 register 1
  struct F0R1
    ADDRESS = BASE_ADDRESS + 0x240_u64

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

    # Filter bits
    def fb0 : Bool
      @value.bits_set?(0x1_u32)
    end

    # Filter bits
    def self.fb0 : Bool
      value.fb0
    end

    # Filter bits
    def self.fb0=(value : Bool) : Bool
      self.set(fb0: value)
      value
    end

    # Filter bits
    def fb1 : Bool
      @value.bits_set?(0x2_u32)
    end

    # Filter bits
    def self.fb1 : Bool
      value.fb1
    end

    # Filter bits
    def self.fb1=(value : Bool) : Bool
      self.set(fb1: value)
      value
    end

    # Filter bits
    def fb2 : Bool
      @value.bits_set?(0x4_u32)
    end

    # Filter bits
    def self.fb2 : Bool
      value.fb2
    end

    # Filter bits
    def self.fb2=(value : Bool) : Bool
      self.set(fb2: value)
      value
    end

    # Filter bits
    def fb3 : Bool
      @value.bits_set?(0x8_u32)
    end

    # Filter bits
    def self.fb3 : Bool
      value.fb3
    end

    # Filter bits
    def self.fb3=(value : Bool) : Bool
      self.set(fb3: value)
      value
    end

    # Filter bits
    def fb4 : Bool
      @value.bits_set?(0x10_u32)
    end

    # Filter bits
    def self.fb4 : Bool
      value.fb4
    end

    # Filter bits
    def self.fb4=(value : Bool) : Bool
      self.set(fb4: value)
      value
    end

    # Filter bits
    def fb5 : Bool
      @value.bits_set?(0x20_u32)
    end

    # Filter bits
    def self.fb5 : Bool
      value.fb5
    end

    # Filter bits
    def self.fb5=(value : Bool) : Bool
      self.set(fb5: value)
      value
    end

    # Filter bits
    def fb6 : Bool
      @value.bits_set?(0x40_u32)
    end

    # Filter bits
    def self.fb6 : Bool
      value.fb6
    end

    # Filter bits
    def self.fb6=(value : Bool) : Bool
      self.set(fb6: value)
      value
    end

    # Filter bits
    def fb7 : Bool
      @value.bits_set?(0x80_u32)
    end

    # Filter bits
    def self.fb7 : Bool
      value.fb7
    end

    # Filter bits
    def self.fb7=(value : Bool) : Bool
      self.set(fb7: value)
      value
    end

    # Filter bits
    def fb8 : Bool
      @value.bits_set?(0x100_u32)
    end

    # Filter bits
    def self.fb8 : Bool
      value.fb8
    end

    # Filter bits
    def self.fb8=(value : Bool) : Bool
      self.set(fb8: value)
      value
    end

    # Filter bits
    def fb9 : Bool
      @value.bits_set?(0x200_u32)
    end

    # Filter bits
    def self.fb9 : Bool
      value.fb9
    end

    # Filter bits
    def self.fb9=(value : Bool) : Bool
      self.set(fb9: value)
      value
    end

    # Filter bits
    def fb10 : Bool
      @value.bits_set?(0x400_u32)
    end

    # Filter bits
    def self.fb10 : Bool
      value.fb10
    end

    # Filter bits
    def self.fb10=(value : Bool) : Bool
      self.set(fb10: value)
      value
    end

    # Filter bits
    def fb11 : Bool
      @value.bits_set?(0x800_u32)
    end

    # Filter bits
    def self.fb11 : Bool
      value.fb11
    end

    # Filter bits
    def self.fb11=(value : Bool) : Bool
      self.set(fb11: value)
      value
    end

    # Filter bits
    def fb12 : Bool
      @value.bits_set?(0x1000_u32)
    end

    # Filter bits
    def self.fb12 : Bool
      value.fb12
    end

    # Filter bits
    def self.fb12=(value : Bool) : Bool
      self.set(fb12: value)
      value
    end

    # Filter bits
    def fb13 : Bool
      @value.bits_set?(0x2000_u32)
    end

    # Filter bits
    def self.fb13 : Bool
      value.fb13
    end

    # Filter bits
    def self.fb13=(value : Bool) : Bool
      self.set(fb13: value)
      value
    end

    # Filter bits
    def fb14 : Bool
      @value.bits_set?(0x4000_u32)
    end

    # Filter bits
    def self.fb14 : Bool
      value.fb14
    end

    # Filter bits
    def self.fb14=(value : Bool) : Bool
      self.set(fb14: value)
      value
    end

    # Filter bits
    def fb15 : Bool
      @value.bits_set?(0x8000_u32)
    end

    # Filter bits
    def self.fb15 : Bool
      value.fb15
    end

    # Filter bits
    def self.fb15=(value : Bool) : Bool
      self.set(fb15: value)
      value
    end

    # Filter bits
    def fb16 : Bool
      @value.bits_set?(0x10000_u32)
    end

    # Filter bits
    def self.fb16 : Bool
      value.fb16
    end

    # Filter bits
    def self.fb16=(value : Bool) : Bool
      self.set(fb16: value)
      value
    end

    # Filter bits
    def fb17 : Bool
      @value.bits_set?(0x20000_u32)
    end

    # Filter bits
    def self.fb17 : Bool
      value.fb17
    end

    # Filter bits
    def self.fb17=(value : Bool) : Bool
      self.set(fb17: value)
      value
    end

    # Filter bits
    def fb18 : Bool
      @value.bits_set?(0x40000_u32)
    end

    # Filter bits
    def self.fb18 : Bool
      value.fb18
    end

    # Filter bits
    def self.fb18=(value : Bool) : Bool
      self.set(fb18: value)
      value
    end

    # Filter bits
    def fb19 : Bool
      @value.bits_set?(0x80000_u32)
    end

    # Filter bits
    def self.fb19 : Bool
      value.fb19
    end

    # Filter bits
    def self.fb19=(value : Bool) : Bool
      self.set(fb19: value)
      value
    end

    # Filter bits
    def fb20 : Bool
      @value.bits_set?(0x100000_u32)
    end

    # Filter bits
    def self.fb20 : Bool
      value.fb20
    end

    # Filter bits
    def self.fb20=(value : Bool) : Bool
      self.set(fb20: value)
      value
    end

    # Filter bits
    def fb21 : Bool
      @value.bits_set?(0x200000_u32)
    end

    # Filter bits
    def self.fb21 : Bool
      value.fb21
    end

    # Filter bits
    def self.fb21=(value : Bool) : Bool
      self.set(fb21: value)
      value
    end

    # Filter bits
    def fb22 : Bool
      @value.bits_set?(0x400000_u32)
    end

    # Filter bits
    def self.fb22 : Bool
      value.fb22
    end

    # Filter bits
    def self.fb22=(value : Bool) : Bool
      self.set(fb22: value)
      value
    end

    # Filter bits
    def fb23 : Bool
      @value.bits_set?(0x800000_u32)
    end

    # Filter bits
    def self.fb23 : Bool
      value.fb23
    end

    # Filter bits
    def self.fb23=(value : Bool) : Bool
      self.set(fb23: value)
      value
    end

    # Filter bits
    def fb24 : Bool
      @value.bits_set?(0x1000000_u32)
    end

    # Filter bits
    def self.fb24 : Bool
      value.fb24
    end

    # Filter bits
    def self.fb24=(value : Bool) : Bool
      self.set(fb24: value)
      value
    end

    # Filter bits
    def fb25 : Bool
      @value.bits_set?(0x2000000_u32)
    end

    # Filter bits
    def self.fb25 : Bool
      value.fb25
    end

    # Filter bits
    def self.fb25=(value : Bool) : Bool
      self.set(fb25: value)
      value
    end

    # Filter bits
    def fb26 : Bool
      @value.bits_set?(0x4000000_u32)
    end

    # Filter bits
    def self.fb26 : Bool
      value.fb26
    end

    # Filter bits
    def self.fb26=(value : Bool) : Bool
      self.set(fb26: value)
      value
    end

    # Filter bits
    def fb27 : Bool
      @value.bits_set?(0x8000000_u32)
    end

    # Filter bits
    def self.fb27 : Bool
      value.fb27
    end

    # Filter bits
    def self.fb27=(value : Bool) : Bool
      self.set(fb27: value)
      value
    end

    # Filter bits
    def fb28 : Bool
      @value.bits_set?(0x10000000_u32)
    end

    # Filter bits
    def self.fb28 : Bool
      value.fb28
    end

    # Filter bits
    def self.fb28=(value : Bool) : Bool
      self.set(fb28: value)
      value
    end

    # Filter bits
    def fb29 : Bool
      @value.bits_set?(0x20000000_u32)
    end

    # Filter bits
    def self.fb29 : Bool
      value.fb29
    end

    # Filter bits
    def self.fb29=(value : Bool) : Bool
      self.set(fb29: value)
      value
    end

    # Filter bits
    def fb30 : Bool
      @value.bits_set?(0x40000000_u32)
    end

    # Filter bits
    def self.fb30 : Bool
      value.fb30
    end

    # Filter bits
    def self.fb30=(value : Bool) : Bool
      self.set(fb30: value)
      value
    end

    # Filter bits
    def fb31 : Bool
      @value.bits_set?(0x80000000_u32)
    end

    # Filter bits
    def self.fb31 : Bool
      value.fb31
    end

    # Filter bits
    def self.fb31=(value : Bool) : Bool
      self.set(fb31: value)
      value
    end

    def copy_with(
      *,

      fb0 : Bool? = nil,

      fb1 : Bool? = nil,

      fb2 : Bool? = nil,

      fb3 : Bool? = nil,

      fb4 : Bool? = nil,

      fb5 : Bool? = nil,

      fb6 : Bool? = nil,

      fb7 : Bool? = nil,

      fb8 : Bool? = nil,

      fb9 : Bool? = nil,

      fb10 : Bool? = nil,

      fb11 : Bool? = nil,

      fb12 : Bool? = nil,

      fb13 : Bool? = nil,

      fb14 : Bool? = nil,

      fb15 : Bool? = nil,

      fb16 : Bool? = nil,

      fb17 : Bool? = nil,

      fb18 : Bool? = nil,

      fb19 : Bool? = nil,

      fb20 : Bool? = nil,

      fb21 : Bool? = nil,

      fb22 : Bool? = nil,

      fb23 : Bool? = nil,

      fb24 : Bool? = nil,

      fb25 : Bool? = nil,

      fb26 : Bool? = nil,

      fb27 : Bool? = nil,

      fb28 : Bool? = nil,

      fb29 : Bool? = nil,

      fb30 : Bool? = nil,

      fb31 : Bool? = nil
    ) : self
      value = @value

      unless fb0.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(fb0.to_int).&(0x1_u32) << 0
      end

      unless fb1.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(fb1.to_int).&(0x1_u32) << 1
      end

      unless fb2.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(fb2.to_int).&(0x1_u32) << 2
      end

      unless fb3.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(fb3.to_int).&(0x1_u32) << 3
      end

      unless fb4.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(fb4.to_int).&(0x1_u32) << 4
      end

      unless fb5.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(fb5.to_int).&(0x1_u32) << 5
      end

      unless fb6.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(fb6.to_int).&(0x1_u32) << 6
      end

      unless fb7.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(fb7.to_int).&(0x1_u32) << 7
      end

      unless fb8.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(fb8.to_int).&(0x1_u32) << 8
      end

      unless fb9.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(fb9.to_int).&(0x1_u32) << 9
      end

      unless fb10.nil?
        value = (value & 0xfffffbff_u32) |
                UInt32.new!(fb10.to_int).&(0x1_u32) << 10
      end

      unless fb11.nil?
        value = (value & 0xfffff7ff_u32) |
                UInt32.new!(fb11.to_int).&(0x1_u32) << 11
      end

      unless fb12.nil?
        value = (value & 0xffffefff_u32) |
                UInt32.new!(fb12.to_int).&(0x1_u32) << 12
      end

      unless fb13.nil?
        value = (value & 0xffffdfff_u32) |
                UInt32.new!(fb13.to_int).&(0x1_u32) << 13
      end

      unless fb14.nil?
        value = (value & 0xffffbfff_u32) |
                UInt32.new!(fb14.to_int).&(0x1_u32) << 14
      end

      unless fb15.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(fb15.to_int).&(0x1_u32) << 15
      end

      unless fb16.nil?
        value = (value & 0xfffeffff_u32) |
                UInt32.new!(fb16.to_int).&(0x1_u32) << 16
      end

      unless fb17.nil?
        value = (value & 0xfffdffff_u32) |
                UInt32.new!(fb17.to_int).&(0x1_u32) << 17
      end

      unless fb18.nil?
        value = (value & 0xfffbffff_u32) |
                UInt32.new!(fb18.to_int).&(0x1_u32) << 18
      end

      unless fb19.nil?
        value = (value & 0xfff7ffff_u32) |
                UInt32.new!(fb19.to_int).&(0x1_u32) << 19
      end

      unless fb20.nil?
        value = (value & 0xffefffff_u32) |
                UInt32.new!(fb20.to_int).&(0x1_u32) << 20
      end

      unless fb21.nil?
        value = (value & 0xffdfffff_u32) |
                UInt32.new!(fb21.to_int).&(0x1_u32) << 21
      end

      unless fb22.nil?
        value = (value & 0xffbfffff_u32) |
                UInt32.new!(fb22.to_int).&(0x1_u32) << 22
      end

      unless fb23.nil?
        value = (value & 0xff7fffff_u32) |
                UInt32.new!(fb23.to_int).&(0x1_u32) << 23
      end

      unless fb24.nil?
        value = (value & 0xfeffffff_u32) |
                UInt32.new!(fb24.to_int).&(0x1_u32) << 24
      end

      unless fb25.nil?
        value = (value & 0xfdffffff_u32) |
                UInt32.new!(fb25.to_int).&(0x1_u32) << 25
      end

      unless fb26.nil?
        value = (value & 0xfbffffff_u32) |
                UInt32.new!(fb26.to_int).&(0x1_u32) << 26
      end

      unless fb27.nil?
        value = (value & 0xf7ffffff_u32) |
                UInt32.new!(fb27.to_int).&(0x1_u32) << 27
      end

      unless fb28.nil?
        value = (value & 0xefffffff_u32) |
                UInt32.new!(fb28.to_int).&(0x1_u32) << 28
      end

      unless fb29.nil?
        value = (value & 0xdfffffff_u32) |
                UInt32.new!(fb29.to_int).&(0x1_u32) << 29
      end

      unless fb30.nil?
        value = (value & 0xbfffffff_u32) |
                UInt32.new!(fb30.to_int).&(0x1_u32) << 30
      end

      unless fb31.nil?
        value = (value & 0x7fffffff_u32) |
                UInt32.new!(fb31.to_int).&(0x1_u32) << 31
      end

      self.class.new(value)
    end

    def self.set(
      *,
      fb0 : Bool? = nil,
      fb1 : Bool? = nil,
      fb2 : Bool? = nil,
      fb3 : Bool? = nil,
      fb4 : Bool? = nil,
      fb5 : Bool? = nil,
      fb6 : Bool? = nil,
      fb7 : Bool? = nil,
      fb8 : Bool? = nil,
      fb9 : Bool? = nil,
      fb10 : Bool? = nil,
      fb11 : Bool? = nil,
      fb12 : Bool? = nil,
      fb13 : Bool? = nil,
      fb14 : Bool? = nil,
      fb15 : Bool? = nil,
      fb16 : Bool? = nil,
      fb17 : Bool? = nil,
      fb18 : Bool? = nil,
      fb19 : Bool? = nil,
      fb20 : Bool? = nil,
      fb21 : Bool? = nil,
      fb22 : Bool? = nil,
      fb23 : Bool? = nil,
      fb24 : Bool? = nil,
      fb25 : Bool? = nil,
      fb26 : Bool? = nil,
      fb27 : Bool? = nil,
      fb28 : Bool? = nil,
      fb29 : Bool? = nil,
      fb30 : Bool? = nil,
      fb31 : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        fb0: fb0,
        fb1: fb1,
        fb2: fb2,
        fb3: fb3,
        fb4: fb4,
        fb5: fb5,
        fb6: fb6,
        fb7: fb7,
        fb8: fb8,
        fb9: fb9,
        fb10: fb10,
        fb11: fb11,
        fb12: fb12,
        fb13: fb13,
        fb14: fb14,
        fb15: fb15,
        fb16: fb16,
        fb17: fb17,
        fb18: fb18,
        fb19: fb19,
        fb20: fb20,
        fb21: fb21,
        fb22: fb22,
        fb23: fb23,
        fb24: fb24,
        fb25: fb25,
        fb26: fb26,
        fb27: fb27,
        fb28: fb28,
        fb29: fb29,
        fb30: fb30,
        fb31: fb31,
      )
    end
  end # struct

  # Filter bank 0 register 2
  struct F0R2
    ADDRESS = BASE_ADDRESS + 0x244_u64

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

    # Filter bits
    def fb0 : Bool
      @value.bits_set?(0x1_u32)
    end

    # Filter bits
    def self.fb0 : Bool
      value.fb0
    end

    # Filter bits
    def self.fb0=(value : Bool) : Bool
      self.set(fb0: value)
      value
    end

    # Filter bits
    def fb1 : Bool
      @value.bits_set?(0x2_u32)
    end

    # Filter bits
    def self.fb1 : Bool
      value.fb1
    end

    # Filter bits
    def self.fb1=(value : Bool) : Bool
      self.set(fb1: value)
      value
    end

    # Filter bits
    def fb2 : Bool
      @value.bits_set?(0x4_u32)
    end

    # Filter bits
    def self.fb2 : Bool
      value.fb2
    end

    # Filter bits
    def self.fb2=(value : Bool) : Bool
      self.set(fb2: value)
      value
    end

    # Filter bits
    def fb3 : Bool
      @value.bits_set?(0x8_u32)
    end

    # Filter bits
    def self.fb3 : Bool
      value.fb3
    end

    # Filter bits
    def self.fb3=(value : Bool) : Bool
      self.set(fb3: value)
      value
    end

    # Filter bits
    def fb4 : Bool
      @value.bits_set?(0x10_u32)
    end

    # Filter bits
    def self.fb4 : Bool
      value.fb4
    end

    # Filter bits
    def self.fb4=(value : Bool) : Bool
      self.set(fb4: value)
      value
    end

    # Filter bits
    def fb5 : Bool
      @value.bits_set?(0x20_u32)
    end

    # Filter bits
    def self.fb5 : Bool
      value.fb5
    end

    # Filter bits
    def self.fb5=(value : Bool) : Bool
      self.set(fb5: value)
      value
    end

    # Filter bits
    def fb6 : Bool
      @value.bits_set?(0x40_u32)
    end

    # Filter bits
    def self.fb6 : Bool
      value.fb6
    end

    # Filter bits
    def self.fb6=(value : Bool) : Bool
      self.set(fb6: value)
      value
    end

    # Filter bits
    def fb7 : Bool
      @value.bits_set?(0x80_u32)
    end

    # Filter bits
    def self.fb7 : Bool
      value.fb7
    end

    # Filter bits
    def self.fb7=(value : Bool) : Bool
      self.set(fb7: value)
      value
    end

    # Filter bits
    def fb8 : Bool
      @value.bits_set?(0x100_u32)
    end

    # Filter bits
    def self.fb8 : Bool
      value.fb8
    end

    # Filter bits
    def self.fb8=(value : Bool) : Bool
      self.set(fb8: value)
      value
    end

    # Filter bits
    def fb9 : Bool
      @value.bits_set?(0x200_u32)
    end

    # Filter bits
    def self.fb9 : Bool
      value.fb9
    end

    # Filter bits
    def self.fb9=(value : Bool) : Bool
      self.set(fb9: value)
      value
    end

    # Filter bits
    def fb10 : Bool
      @value.bits_set?(0x400_u32)
    end

    # Filter bits
    def self.fb10 : Bool
      value.fb10
    end

    # Filter bits
    def self.fb10=(value : Bool) : Bool
      self.set(fb10: value)
      value
    end

    # Filter bits
    def fb11 : Bool
      @value.bits_set?(0x800_u32)
    end

    # Filter bits
    def self.fb11 : Bool
      value.fb11
    end

    # Filter bits
    def self.fb11=(value : Bool) : Bool
      self.set(fb11: value)
      value
    end

    # Filter bits
    def fb12 : Bool
      @value.bits_set?(0x1000_u32)
    end

    # Filter bits
    def self.fb12 : Bool
      value.fb12
    end

    # Filter bits
    def self.fb12=(value : Bool) : Bool
      self.set(fb12: value)
      value
    end

    # Filter bits
    def fb13 : Bool
      @value.bits_set?(0x2000_u32)
    end

    # Filter bits
    def self.fb13 : Bool
      value.fb13
    end

    # Filter bits
    def self.fb13=(value : Bool) : Bool
      self.set(fb13: value)
      value
    end

    # Filter bits
    def fb14 : Bool
      @value.bits_set?(0x4000_u32)
    end

    # Filter bits
    def self.fb14 : Bool
      value.fb14
    end

    # Filter bits
    def self.fb14=(value : Bool) : Bool
      self.set(fb14: value)
      value
    end

    # Filter bits
    def fb15 : Bool
      @value.bits_set?(0x8000_u32)
    end

    # Filter bits
    def self.fb15 : Bool
      value.fb15
    end

    # Filter bits
    def self.fb15=(value : Bool) : Bool
      self.set(fb15: value)
      value
    end

    # Filter bits
    def fb16 : Bool
      @value.bits_set?(0x10000_u32)
    end

    # Filter bits
    def self.fb16 : Bool
      value.fb16
    end

    # Filter bits
    def self.fb16=(value : Bool) : Bool
      self.set(fb16: value)
      value
    end

    # Filter bits
    def fb17 : Bool
      @value.bits_set?(0x20000_u32)
    end

    # Filter bits
    def self.fb17 : Bool
      value.fb17
    end

    # Filter bits
    def self.fb17=(value : Bool) : Bool
      self.set(fb17: value)
      value
    end

    # Filter bits
    def fb18 : Bool
      @value.bits_set?(0x40000_u32)
    end

    # Filter bits
    def self.fb18 : Bool
      value.fb18
    end

    # Filter bits
    def self.fb18=(value : Bool) : Bool
      self.set(fb18: value)
      value
    end

    # Filter bits
    def fb19 : Bool
      @value.bits_set?(0x80000_u32)
    end

    # Filter bits
    def self.fb19 : Bool
      value.fb19
    end

    # Filter bits
    def self.fb19=(value : Bool) : Bool
      self.set(fb19: value)
      value
    end

    # Filter bits
    def fb20 : Bool
      @value.bits_set?(0x100000_u32)
    end

    # Filter bits
    def self.fb20 : Bool
      value.fb20
    end

    # Filter bits
    def self.fb20=(value : Bool) : Bool
      self.set(fb20: value)
      value
    end

    # Filter bits
    def fb21 : Bool
      @value.bits_set?(0x200000_u32)
    end

    # Filter bits
    def self.fb21 : Bool
      value.fb21
    end

    # Filter bits
    def self.fb21=(value : Bool) : Bool
      self.set(fb21: value)
      value
    end

    # Filter bits
    def fb22 : Bool
      @value.bits_set?(0x400000_u32)
    end

    # Filter bits
    def self.fb22 : Bool
      value.fb22
    end

    # Filter bits
    def self.fb22=(value : Bool) : Bool
      self.set(fb22: value)
      value
    end

    # Filter bits
    def fb23 : Bool
      @value.bits_set?(0x800000_u32)
    end

    # Filter bits
    def self.fb23 : Bool
      value.fb23
    end

    # Filter bits
    def self.fb23=(value : Bool) : Bool
      self.set(fb23: value)
      value
    end

    # Filter bits
    def fb24 : Bool
      @value.bits_set?(0x1000000_u32)
    end

    # Filter bits
    def self.fb24 : Bool
      value.fb24
    end

    # Filter bits
    def self.fb24=(value : Bool) : Bool
      self.set(fb24: value)
      value
    end

    # Filter bits
    def fb25 : Bool
      @value.bits_set?(0x2000000_u32)
    end

    # Filter bits
    def self.fb25 : Bool
      value.fb25
    end

    # Filter bits
    def self.fb25=(value : Bool) : Bool
      self.set(fb25: value)
      value
    end

    # Filter bits
    def fb26 : Bool
      @value.bits_set?(0x4000000_u32)
    end

    # Filter bits
    def self.fb26 : Bool
      value.fb26
    end

    # Filter bits
    def self.fb26=(value : Bool) : Bool
      self.set(fb26: value)
      value
    end

    # Filter bits
    def fb27 : Bool
      @value.bits_set?(0x8000000_u32)
    end

    # Filter bits
    def self.fb27 : Bool
      value.fb27
    end

    # Filter bits
    def self.fb27=(value : Bool) : Bool
      self.set(fb27: value)
      value
    end

    # Filter bits
    def fb28 : Bool
      @value.bits_set?(0x10000000_u32)
    end

    # Filter bits
    def self.fb28 : Bool
      value.fb28
    end

    # Filter bits
    def self.fb28=(value : Bool) : Bool
      self.set(fb28: value)
      value
    end

    # Filter bits
    def fb29 : Bool
      @value.bits_set?(0x20000000_u32)
    end

    # Filter bits
    def self.fb29 : Bool
      value.fb29
    end

    # Filter bits
    def self.fb29=(value : Bool) : Bool
      self.set(fb29: value)
      value
    end

    # Filter bits
    def fb30 : Bool
      @value.bits_set?(0x40000000_u32)
    end

    # Filter bits
    def self.fb30 : Bool
      value.fb30
    end

    # Filter bits
    def self.fb30=(value : Bool) : Bool
      self.set(fb30: value)
      value
    end

    # Filter bits
    def fb31 : Bool
      @value.bits_set?(0x80000000_u32)
    end

    # Filter bits
    def self.fb31 : Bool
      value.fb31
    end

    # Filter bits
    def self.fb31=(value : Bool) : Bool
      self.set(fb31: value)
      value
    end

    def copy_with(
      *,

      fb0 : Bool? = nil,

      fb1 : Bool? = nil,

      fb2 : Bool? = nil,

      fb3 : Bool? = nil,

      fb4 : Bool? = nil,

      fb5 : Bool? = nil,

      fb6 : Bool? = nil,

      fb7 : Bool? = nil,

      fb8 : Bool? = nil,

      fb9 : Bool? = nil,

      fb10 : Bool? = nil,

      fb11 : Bool? = nil,

      fb12 : Bool? = nil,

      fb13 : Bool? = nil,

      fb14 : Bool? = nil,

      fb15 : Bool? = nil,

      fb16 : Bool? = nil,

      fb17 : Bool? = nil,

      fb18 : Bool? = nil,

      fb19 : Bool? = nil,

      fb20 : Bool? = nil,

      fb21 : Bool? = nil,

      fb22 : Bool? = nil,

      fb23 : Bool? = nil,

      fb24 : Bool? = nil,

      fb25 : Bool? = nil,

      fb26 : Bool? = nil,

      fb27 : Bool? = nil,

      fb28 : Bool? = nil,

      fb29 : Bool? = nil,

      fb30 : Bool? = nil,

      fb31 : Bool? = nil
    ) : self
      value = @value

      unless fb0.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(fb0.to_int).&(0x1_u32) << 0
      end

      unless fb1.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(fb1.to_int).&(0x1_u32) << 1
      end

      unless fb2.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(fb2.to_int).&(0x1_u32) << 2
      end

      unless fb3.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(fb3.to_int).&(0x1_u32) << 3
      end

      unless fb4.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(fb4.to_int).&(0x1_u32) << 4
      end

      unless fb5.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(fb5.to_int).&(0x1_u32) << 5
      end

      unless fb6.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(fb6.to_int).&(0x1_u32) << 6
      end

      unless fb7.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(fb7.to_int).&(0x1_u32) << 7
      end

      unless fb8.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(fb8.to_int).&(0x1_u32) << 8
      end

      unless fb9.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(fb9.to_int).&(0x1_u32) << 9
      end

      unless fb10.nil?
        value = (value & 0xfffffbff_u32) |
                UInt32.new!(fb10.to_int).&(0x1_u32) << 10
      end

      unless fb11.nil?
        value = (value & 0xfffff7ff_u32) |
                UInt32.new!(fb11.to_int).&(0x1_u32) << 11
      end

      unless fb12.nil?
        value = (value & 0xffffefff_u32) |
                UInt32.new!(fb12.to_int).&(0x1_u32) << 12
      end

      unless fb13.nil?
        value = (value & 0xffffdfff_u32) |
                UInt32.new!(fb13.to_int).&(0x1_u32) << 13
      end

      unless fb14.nil?
        value = (value & 0xffffbfff_u32) |
                UInt32.new!(fb14.to_int).&(0x1_u32) << 14
      end

      unless fb15.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(fb15.to_int).&(0x1_u32) << 15
      end

      unless fb16.nil?
        value = (value & 0xfffeffff_u32) |
                UInt32.new!(fb16.to_int).&(0x1_u32) << 16
      end

      unless fb17.nil?
        value = (value & 0xfffdffff_u32) |
                UInt32.new!(fb17.to_int).&(0x1_u32) << 17
      end

      unless fb18.nil?
        value = (value & 0xfffbffff_u32) |
                UInt32.new!(fb18.to_int).&(0x1_u32) << 18
      end

      unless fb19.nil?
        value = (value & 0xfff7ffff_u32) |
                UInt32.new!(fb19.to_int).&(0x1_u32) << 19
      end

      unless fb20.nil?
        value = (value & 0xffefffff_u32) |
                UInt32.new!(fb20.to_int).&(0x1_u32) << 20
      end

      unless fb21.nil?
        value = (value & 0xffdfffff_u32) |
                UInt32.new!(fb21.to_int).&(0x1_u32) << 21
      end

      unless fb22.nil?
        value = (value & 0xffbfffff_u32) |
                UInt32.new!(fb22.to_int).&(0x1_u32) << 22
      end

      unless fb23.nil?
        value = (value & 0xff7fffff_u32) |
                UInt32.new!(fb23.to_int).&(0x1_u32) << 23
      end

      unless fb24.nil?
        value = (value & 0xfeffffff_u32) |
                UInt32.new!(fb24.to_int).&(0x1_u32) << 24
      end

      unless fb25.nil?
        value = (value & 0xfdffffff_u32) |
                UInt32.new!(fb25.to_int).&(0x1_u32) << 25
      end

      unless fb26.nil?
        value = (value & 0xfbffffff_u32) |
                UInt32.new!(fb26.to_int).&(0x1_u32) << 26
      end

      unless fb27.nil?
        value = (value & 0xf7ffffff_u32) |
                UInt32.new!(fb27.to_int).&(0x1_u32) << 27
      end

      unless fb28.nil?
        value = (value & 0xefffffff_u32) |
                UInt32.new!(fb28.to_int).&(0x1_u32) << 28
      end

      unless fb29.nil?
        value = (value & 0xdfffffff_u32) |
                UInt32.new!(fb29.to_int).&(0x1_u32) << 29
      end

      unless fb30.nil?
        value = (value & 0xbfffffff_u32) |
                UInt32.new!(fb30.to_int).&(0x1_u32) << 30
      end

      unless fb31.nil?
        value = (value & 0x7fffffff_u32) |
                UInt32.new!(fb31.to_int).&(0x1_u32) << 31
      end

      self.class.new(value)
    end

    def self.set(
      *,
      fb0 : Bool? = nil,
      fb1 : Bool? = nil,
      fb2 : Bool? = nil,
      fb3 : Bool? = nil,
      fb4 : Bool? = nil,
      fb5 : Bool? = nil,
      fb6 : Bool? = nil,
      fb7 : Bool? = nil,
      fb8 : Bool? = nil,
      fb9 : Bool? = nil,
      fb10 : Bool? = nil,
      fb11 : Bool? = nil,
      fb12 : Bool? = nil,
      fb13 : Bool? = nil,
      fb14 : Bool? = nil,
      fb15 : Bool? = nil,
      fb16 : Bool? = nil,
      fb17 : Bool? = nil,
      fb18 : Bool? = nil,
      fb19 : Bool? = nil,
      fb20 : Bool? = nil,
      fb21 : Bool? = nil,
      fb22 : Bool? = nil,
      fb23 : Bool? = nil,
      fb24 : Bool? = nil,
      fb25 : Bool? = nil,
      fb26 : Bool? = nil,
      fb27 : Bool? = nil,
      fb28 : Bool? = nil,
      fb29 : Bool? = nil,
      fb30 : Bool? = nil,
      fb31 : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        fb0: fb0,
        fb1: fb1,
        fb2: fb2,
        fb3: fb3,
        fb4: fb4,
        fb5: fb5,
        fb6: fb6,
        fb7: fb7,
        fb8: fb8,
        fb9: fb9,
        fb10: fb10,
        fb11: fb11,
        fb12: fb12,
        fb13: fb13,
        fb14: fb14,
        fb15: fb15,
        fb16: fb16,
        fb17: fb17,
        fb18: fb18,
        fb19: fb19,
        fb20: fb20,
        fb21: fb21,
        fb22: fb22,
        fb23: fb23,
        fb24: fb24,
        fb25: fb25,
        fb26: fb26,
        fb27: fb27,
        fb28: fb28,
        fb29: fb29,
        fb30: fb30,
        fb31: fb31,
      )
    end
  end # struct

  # Filter bank 1 register 1
  struct F1R1
    ADDRESS = BASE_ADDRESS + 0x248_u64

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

    # Filter bits
    def fb0 : Bool
      @value.bits_set?(0x1_u32)
    end

    # Filter bits
    def self.fb0 : Bool
      value.fb0
    end

    # Filter bits
    def self.fb0=(value : Bool) : Bool
      self.set(fb0: value)
      value
    end

    # Filter bits
    def fb1 : Bool
      @value.bits_set?(0x2_u32)
    end

    # Filter bits
    def self.fb1 : Bool
      value.fb1
    end

    # Filter bits
    def self.fb1=(value : Bool) : Bool
      self.set(fb1: value)
      value
    end

    # Filter bits
    def fb2 : Bool
      @value.bits_set?(0x4_u32)
    end

    # Filter bits
    def self.fb2 : Bool
      value.fb2
    end

    # Filter bits
    def self.fb2=(value : Bool) : Bool
      self.set(fb2: value)
      value
    end

    # Filter bits
    def fb3 : Bool
      @value.bits_set?(0x8_u32)
    end

    # Filter bits
    def self.fb3 : Bool
      value.fb3
    end

    # Filter bits
    def self.fb3=(value : Bool) : Bool
      self.set(fb3: value)
      value
    end

    # Filter bits
    def fb4 : Bool
      @value.bits_set?(0x10_u32)
    end

    # Filter bits
    def self.fb4 : Bool
      value.fb4
    end

    # Filter bits
    def self.fb4=(value : Bool) : Bool
      self.set(fb4: value)
      value
    end

    # Filter bits
    def fb5 : Bool
      @value.bits_set?(0x20_u32)
    end

    # Filter bits
    def self.fb5 : Bool
      value.fb5
    end

    # Filter bits
    def self.fb5=(value : Bool) : Bool
      self.set(fb5: value)
      value
    end

    # Filter bits
    def fb6 : Bool
      @value.bits_set?(0x40_u32)
    end

    # Filter bits
    def self.fb6 : Bool
      value.fb6
    end

    # Filter bits
    def self.fb6=(value : Bool) : Bool
      self.set(fb6: value)
      value
    end

    # Filter bits
    def fb7 : Bool
      @value.bits_set?(0x80_u32)
    end

    # Filter bits
    def self.fb7 : Bool
      value.fb7
    end

    # Filter bits
    def self.fb7=(value : Bool) : Bool
      self.set(fb7: value)
      value
    end

    # Filter bits
    def fb8 : Bool
      @value.bits_set?(0x100_u32)
    end

    # Filter bits
    def self.fb8 : Bool
      value.fb8
    end

    # Filter bits
    def self.fb8=(value : Bool) : Bool
      self.set(fb8: value)
      value
    end

    # Filter bits
    def fb9 : Bool
      @value.bits_set?(0x200_u32)
    end

    # Filter bits
    def self.fb9 : Bool
      value.fb9
    end

    # Filter bits
    def self.fb9=(value : Bool) : Bool
      self.set(fb9: value)
      value
    end

    # Filter bits
    def fb10 : Bool
      @value.bits_set?(0x400_u32)
    end

    # Filter bits
    def self.fb10 : Bool
      value.fb10
    end

    # Filter bits
    def self.fb10=(value : Bool) : Bool
      self.set(fb10: value)
      value
    end

    # Filter bits
    def fb11 : Bool
      @value.bits_set?(0x800_u32)
    end

    # Filter bits
    def self.fb11 : Bool
      value.fb11
    end

    # Filter bits
    def self.fb11=(value : Bool) : Bool
      self.set(fb11: value)
      value
    end

    # Filter bits
    def fb12 : Bool
      @value.bits_set?(0x1000_u32)
    end

    # Filter bits
    def self.fb12 : Bool
      value.fb12
    end

    # Filter bits
    def self.fb12=(value : Bool) : Bool
      self.set(fb12: value)
      value
    end

    # Filter bits
    def fb13 : Bool
      @value.bits_set?(0x2000_u32)
    end

    # Filter bits
    def self.fb13 : Bool
      value.fb13
    end

    # Filter bits
    def self.fb13=(value : Bool) : Bool
      self.set(fb13: value)
      value
    end

    # Filter bits
    def fb14 : Bool
      @value.bits_set?(0x4000_u32)
    end

    # Filter bits
    def self.fb14 : Bool
      value.fb14
    end

    # Filter bits
    def self.fb14=(value : Bool) : Bool
      self.set(fb14: value)
      value
    end

    # Filter bits
    def fb15 : Bool
      @value.bits_set?(0x8000_u32)
    end

    # Filter bits
    def self.fb15 : Bool
      value.fb15
    end

    # Filter bits
    def self.fb15=(value : Bool) : Bool
      self.set(fb15: value)
      value
    end

    # Filter bits
    def fb16 : Bool
      @value.bits_set?(0x10000_u32)
    end

    # Filter bits
    def self.fb16 : Bool
      value.fb16
    end

    # Filter bits
    def self.fb16=(value : Bool) : Bool
      self.set(fb16: value)
      value
    end

    # Filter bits
    def fb17 : Bool
      @value.bits_set?(0x20000_u32)
    end

    # Filter bits
    def self.fb17 : Bool
      value.fb17
    end

    # Filter bits
    def self.fb17=(value : Bool) : Bool
      self.set(fb17: value)
      value
    end

    # Filter bits
    def fb18 : Bool
      @value.bits_set?(0x40000_u32)
    end

    # Filter bits
    def self.fb18 : Bool
      value.fb18
    end

    # Filter bits
    def self.fb18=(value : Bool) : Bool
      self.set(fb18: value)
      value
    end

    # Filter bits
    def fb19 : Bool
      @value.bits_set?(0x80000_u32)
    end

    # Filter bits
    def self.fb19 : Bool
      value.fb19
    end

    # Filter bits
    def self.fb19=(value : Bool) : Bool
      self.set(fb19: value)
      value
    end

    # Filter bits
    def fb20 : Bool
      @value.bits_set?(0x100000_u32)
    end

    # Filter bits
    def self.fb20 : Bool
      value.fb20
    end

    # Filter bits
    def self.fb20=(value : Bool) : Bool
      self.set(fb20: value)
      value
    end

    # Filter bits
    def fb21 : Bool
      @value.bits_set?(0x200000_u32)
    end

    # Filter bits
    def self.fb21 : Bool
      value.fb21
    end

    # Filter bits
    def self.fb21=(value : Bool) : Bool
      self.set(fb21: value)
      value
    end

    # Filter bits
    def fb22 : Bool
      @value.bits_set?(0x400000_u32)
    end

    # Filter bits
    def self.fb22 : Bool
      value.fb22
    end

    # Filter bits
    def self.fb22=(value : Bool) : Bool
      self.set(fb22: value)
      value
    end

    # Filter bits
    def fb23 : Bool
      @value.bits_set?(0x800000_u32)
    end

    # Filter bits
    def self.fb23 : Bool
      value.fb23
    end

    # Filter bits
    def self.fb23=(value : Bool) : Bool
      self.set(fb23: value)
      value
    end

    # Filter bits
    def fb24 : Bool
      @value.bits_set?(0x1000000_u32)
    end

    # Filter bits
    def self.fb24 : Bool
      value.fb24
    end

    # Filter bits
    def self.fb24=(value : Bool) : Bool
      self.set(fb24: value)
      value
    end

    # Filter bits
    def fb25 : Bool
      @value.bits_set?(0x2000000_u32)
    end

    # Filter bits
    def self.fb25 : Bool
      value.fb25
    end

    # Filter bits
    def self.fb25=(value : Bool) : Bool
      self.set(fb25: value)
      value
    end

    # Filter bits
    def fb26 : Bool
      @value.bits_set?(0x4000000_u32)
    end

    # Filter bits
    def self.fb26 : Bool
      value.fb26
    end

    # Filter bits
    def self.fb26=(value : Bool) : Bool
      self.set(fb26: value)
      value
    end

    # Filter bits
    def fb27 : Bool
      @value.bits_set?(0x8000000_u32)
    end

    # Filter bits
    def self.fb27 : Bool
      value.fb27
    end

    # Filter bits
    def self.fb27=(value : Bool) : Bool
      self.set(fb27: value)
      value
    end

    # Filter bits
    def fb28 : Bool
      @value.bits_set?(0x10000000_u32)
    end

    # Filter bits
    def self.fb28 : Bool
      value.fb28
    end

    # Filter bits
    def self.fb28=(value : Bool) : Bool
      self.set(fb28: value)
      value
    end

    # Filter bits
    def fb29 : Bool
      @value.bits_set?(0x20000000_u32)
    end

    # Filter bits
    def self.fb29 : Bool
      value.fb29
    end

    # Filter bits
    def self.fb29=(value : Bool) : Bool
      self.set(fb29: value)
      value
    end

    # Filter bits
    def fb30 : Bool
      @value.bits_set?(0x40000000_u32)
    end

    # Filter bits
    def self.fb30 : Bool
      value.fb30
    end

    # Filter bits
    def self.fb30=(value : Bool) : Bool
      self.set(fb30: value)
      value
    end

    # Filter bits
    def fb31 : Bool
      @value.bits_set?(0x80000000_u32)
    end

    # Filter bits
    def self.fb31 : Bool
      value.fb31
    end

    # Filter bits
    def self.fb31=(value : Bool) : Bool
      self.set(fb31: value)
      value
    end

    def copy_with(
      *,

      fb0 : Bool? = nil,

      fb1 : Bool? = nil,

      fb2 : Bool? = nil,

      fb3 : Bool? = nil,

      fb4 : Bool? = nil,

      fb5 : Bool? = nil,

      fb6 : Bool? = nil,

      fb7 : Bool? = nil,

      fb8 : Bool? = nil,

      fb9 : Bool? = nil,

      fb10 : Bool? = nil,

      fb11 : Bool? = nil,

      fb12 : Bool? = nil,

      fb13 : Bool? = nil,

      fb14 : Bool? = nil,

      fb15 : Bool? = nil,

      fb16 : Bool? = nil,

      fb17 : Bool? = nil,

      fb18 : Bool? = nil,

      fb19 : Bool? = nil,

      fb20 : Bool? = nil,

      fb21 : Bool? = nil,

      fb22 : Bool? = nil,

      fb23 : Bool? = nil,

      fb24 : Bool? = nil,

      fb25 : Bool? = nil,

      fb26 : Bool? = nil,

      fb27 : Bool? = nil,

      fb28 : Bool? = nil,

      fb29 : Bool? = nil,

      fb30 : Bool? = nil,

      fb31 : Bool? = nil
    ) : self
      value = @value

      unless fb0.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(fb0.to_int).&(0x1_u32) << 0
      end

      unless fb1.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(fb1.to_int).&(0x1_u32) << 1
      end

      unless fb2.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(fb2.to_int).&(0x1_u32) << 2
      end

      unless fb3.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(fb3.to_int).&(0x1_u32) << 3
      end

      unless fb4.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(fb4.to_int).&(0x1_u32) << 4
      end

      unless fb5.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(fb5.to_int).&(0x1_u32) << 5
      end

      unless fb6.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(fb6.to_int).&(0x1_u32) << 6
      end

      unless fb7.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(fb7.to_int).&(0x1_u32) << 7
      end

      unless fb8.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(fb8.to_int).&(0x1_u32) << 8
      end

      unless fb9.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(fb9.to_int).&(0x1_u32) << 9
      end

      unless fb10.nil?
        value = (value & 0xfffffbff_u32) |
                UInt32.new!(fb10.to_int).&(0x1_u32) << 10
      end

      unless fb11.nil?
        value = (value & 0xfffff7ff_u32) |
                UInt32.new!(fb11.to_int).&(0x1_u32) << 11
      end

      unless fb12.nil?
        value = (value & 0xffffefff_u32) |
                UInt32.new!(fb12.to_int).&(0x1_u32) << 12
      end

      unless fb13.nil?
        value = (value & 0xffffdfff_u32) |
                UInt32.new!(fb13.to_int).&(0x1_u32) << 13
      end

      unless fb14.nil?
        value = (value & 0xffffbfff_u32) |
                UInt32.new!(fb14.to_int).&(0x1_u32) << 14
      end

      unless fb15.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(fb15.to_int).&(0x1_u32) << 15
      end

      unless fb16.nil?
        value = (value & 0xfffeffff_u32) |
                UInt32.new!(fb16.to_int).&(0x1_u32) << 16
      end

      unless fb17.nil?
        value = (value & 0xfffdffff_u32) |
                UInt32.new!(fb17.to_int).&(0x1_u32) << 17
      end

      unless fb18.nil?
        value = (value & 0xfffbffff_u32) |
                UInt32.new!(fb18.to_int).&(0x1_u32) << 18
      end

      unless fb19.nil?
        value = (value & 0xfff7ffff_u32) |
                UInt32.new!(fb19.to_int).&(0x1_u32) << 19
      end

      unless fb20.nil?
        value = (value & 0xffefffff_u32) |
                UInt32.new!(fb20.to_int).&(0x1_u32) << 20
      end

      unless fb21.nil?
        value = (value & 0xffdfffff_u32) |
                UInt32.new!(fb21.to_int).&(0x1_u32) << 21
      end

      unless fb22.nil?
        value = (value & 0xffbfffff_u32) |
                UInt32.new!(fb22.to_int).&(0x1_u32) << 22
      end

      unless fb23.nil?
        value = (value & 0xff7fffff_u32) |
                UInt32.new!(fb23.to_int).&(0x1_u32) << 23
      end

      unless fb24.nil?
        value = (value & 0xfeffffff_u32) |
                UInt32.new!(fb24.to_int).&(0x1_u32) << 24
      end

      unless fb25.nil?
        value = (value & 0xfdffffff_u32) |
                UInt32.new!(fb25.to_int).&(0x1_u32) << 25
      end

      unless fb26.nil?
        value = (value & 0xfbffffff_u32) |
                UInt32.new!(fb26.to_int).&(0x1_u32) << 26
      end

      unless fb27.nil?
        value = (value & 0xf7ffffff_u32) |
                UInt32.new!(fb27.to_int).&(0x1_u32) << 27
      end

      unless fb28.nil?
        value = (value & 0xefffffff_u32) |
                UInt32.new!(fb28.to_int).&(0x1_u32) << 28
      end

      unless fb29.nil?
        value = (value & 0xdfffffff_u32) |
                UInt32.new!(fb29.to_int).&(0x1_u32) << 29
      end

      unless fb30.nil?
        value = (value & 0xbfffffff_u32) |
                UInt32.new!(fb30.to_int).&(0x1_u32) << 30
      end

      unless fb31.nil?
        value = (value & 0x7fffffff_u32) |
                UInt32.new!(fb31.to_int).&(0x1_u32) << 31
      end

      self.class.new(value)
    end

    def self.set(
      *,
      fb0 : Bool? = nil,
      fb1 : Bool? = nil,
      fb2 : Bool? = nil,
      fb3 : Bool? = nil,
      fb4 : Bool? = nil,
      fb5 : Bool? = nil,
      fb6 : Bool? = nil,
      fb7 : Bool? = nil,
      fb8 : Bool? = nil,
      fb9 : Bool? = nil,
      fb10 : Bool? = nil,
      fb11 : Bool? = nil,
      fb12 : Bool? = nil,
      fb13 : Bool? = nil,
      fb14 : Bool? = nil,
      fb15 : Bool? = nil,
      fb16 : Bool? = nil,
      fb17 : Bool? = nil,
      fb18 : Bool? = nil,
      fb19 : Bool? = nil,
      fb20 : Bool? = nil,
      fb21 : Bool? = nil,
      fb22 : Bool? = nil,
      fb23 : Bool? = nil,
      fb24 : Bool? = nil,
      fb25 : Bool? = nil,
      fb26 : Bool? = nil,
      fb27 : Bool? = nil,
      fb28 : Bool? = nil,
      fb29 : Bool? = nil,
      fb30 : Bool? = nil,
      fb31 : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        fb0: fb0,
        fb1: fb1,
        fb2: fb2,
        fb3: fb3,
        fb4: fb4,
        fb5: fb5,
        fb6: fb6,
        fb7: fb7,
        fb8: fb8,
        fb9: fb9,
        fb10: fb10,
        fb11: fb11,
        fb12: fb12,
        fb13: fb13,
        fb14: fb14,
        fb15: fb15,
        fb16: fb16,
        fb17: fb17,
        fb18: fb18,
        fb19: fb19,
        fb20: fb20,
        fb21: fb21,
        fb22: fb22,
        fb23: fb23,
        fb24: fb24,
        fb25: fb25,
        fb26: fb26,
        fb27: fb27,
        fb28: fb28,
        fb29: fb29,
        fb30: fb30,
        fb31: fb31,
      )
    end
  end # struct

  # Filter bank 1 register 2
  struct F1R2
    ADDRESS = BASE_ADDRESS + 0x24c_u64

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

    # Filter bits
    def fb0 : Bool
      @value.bits_set?(0x1_u32)
    end

    # Filter bits
    def self.fb0 : Bool
      value.fb0
    end

    # Filter bits
    def self.fb0=(value : Bool) : Bool
      self.set(fb0: value)
      value
    end

    # Filter bits
    def fb1 : Bool
      @value.bits_set?(0x2_u32)
    end

    # Filter bits
    def self.fb1 : Bool
      value.fb1
    end

    # Filter bits
    def self.fb1=(value : Bool) : Bool
      self.set(fb1: value)
      value
    end

    # Filter bits
    def fb2 : Bool
      @value.bits_set?(0x4_u32)
    end

    # Filter bits
    def self.fb2 : Bool
      value.fb2
    end

    # Filter bits
    def self.fb2=(value : Bool) : Bool
      self.set(fb2: value)
      value
    end

    # Filter bits
    def fb3 : Bool
      @value.bits_set?(0x8_u32)
    end

    # Filter bits
    def self.fb3 : Bool
      value.fb3
    end

    # Filter bits
    def self.fb3=(value : Bool) : Bool
      self.set(fb3: value)
      value
    end

    # Filter bits
    def fb4 : Bool
      @value.bits_set?(0x10_u32)
    end

    # Filter bits
    def self.fb4 : Bool
      value.fb4
    end

    # Filter bits
    def self.fb4=(value : Bool) : Bool
      self.set(fb4: value)
      value
    end

    # Filter bits
    def fb5 : Bool
      @value.bits_set?(0x20_u32)
    end

    # Filter bits
    def self.fb5 : Bool
      value.fb5
    end

    # Filter bits
    def self.fb5=(value : Bool) : Bool
      self.set(fb5: value)
      value
    end

    # Filter bits
    def fb6 : Bool
      @value.bits_set?(0x40_u32)
    end

    # Filter bits
    def self.fb6 : Bool
      value.fb6
    end

    # Filter bits
    def self.fb6=(value : Bool) : Bool
      self.set(fb6: value)
      value
    end

    # Filter bits
    def fb7 : Bool
      @value.bits_set?(0x80_u32)
    end

    # Filter bits
    def self.fb7 : Bool
      value.fb7
    end

    # Filter bits
    def self.fb7=(value : Bool) : Bool
      self.set(fb7: value)
      value
    end

    # Filter bits
    def fb8 : Bool
      @value.bits_set?(0x100_u32)
    end

    # Filter bits
    def self.fb8 : Bool
      value.fb8
    end

    # Filter bits
    def self.fb8=(value : Bool) : Bool
      self.set(fb8: value)
      value
    end

    # Filter bits
    def fb9 : Bool
      @value.bits_set?(0x200_u32)
    end

    # Filter bits
    def self.fb9 : Bool
      value.fb9
    end

    # Filter bits
    def self.fb9=(value : Bool) : Bool
      self.set(fb9: value)
      value
    end

    # Filter bits
    def fb10 : Bool
      @value.bits_set?(0x400_u32)
    end

    # Filter bits
    def self.fb10 : Bool
      value.fb10
    end

    # Filter bits
    def self.fb10=(value : Bool) : Bool
      self.set(fb10: value)
      value
    end

    # Filter bits
    def fb11 : Bool
      @value.bits_set?(0x800_u32)
    end

    # Filter bits
    def self.fb11 : Bool
      value.fb11
    end

    # Filter bits
    def self.fb11=(value : Bool) : Bool
      self.set(fb11: value)
      value
    end

    # Filter bits
    def fb12 : Bool
      @value.bits_set?(0x1000_u32)
    end

    # Filter bits
    def self.fb12 : Bool
      value.fb12
    end

    # Filter bits
    def self.fb12=(value : Bool) : Bool
      self.set(fb12: value)
      value
    end

    # Filter bits
    def fb13 : Bool
      @value.bits_set?(0x2000_u32)
    end

    # Filter bits
    def self.fb13 : Bool
      value.fb13
    end

    # Filter bits
    def self.fb13=(value : Bool) : Bool
      self.set(fb13: value)
      value
    end

    # Filter bits
    def fb14 : Bool
      @value.bits_set?(0x4000_u32)
    end

    # Filter bits
    def self.fb14 : Bool
      value.fb14
    end

    # Filter bits
    def self.fb14=(value : Bool) : Bool
      self.set(fb14: value)
      value
    end

    # Filter bits
    def fb15 : Bool
      @value.bits_set?(0x8000_u32)
    end

    # Filter bits
    def self.fb15 : Bool
      value.fb15
    end

    # Filter bits
    def self.fb15=(value : Bool) : Bool
      self.set(fb15: value)
      value
    end

    # Filter bits
    def fb16 : Bool
      @value.bits_set?(0x10000_u32)
    end

    # Filter bits
    def self.fb16 : Bool
      value.fb16
    end

    # Filter bits
    def self.fb16=(value : Bool) : Bool
      self.set(fb16: value)
      value
    end

    # Filter bits
    def fb17 : Bool
      @value.bits_set?(0x20000_u32)
    end

    # Filter bits
    def self.fb17 : Bool
      value.fb17
    end

    # Filter bits
    def self.fb17=(value : Bool) : Bool
      self.set(fb17: value)
      value
    end

    # Filter bits
    def fb18 : Bool
      @value.bits_set?(0x40000_u32)
    end

    # Filter bits
    def self.fb18 : Bool
      value.fb18
    end

    # Filter bits
    def self.fb18=(value : Bool) : Bool
      self.set(fb18: value)
      value
    end

    # Filter bits
    def fb19 : Bool
      @value.bits_set?(0x80000_u32)
    end

    # Filter bits
    def self.fb19 : Bool
      value.fb19
    end

    # Filter bits
    def self.fb19=(value : Bool) : Bool
      self.set(fb19: value)
      value
    end

    # Filter bits
    def fb20 : Bool
      @value.bits_set?(0x100000_u32)
    end

    # Filter bits
    def self.fb20 : Bool
      value.fb20
    end

    # Filter bits
    def self.fb20=(value : Bool) : Bool
      self.set(fb20: value)
      value
    end

    # Filter bits
    def fb21 : Bool
      @value.bits_set?(0x200000_u32)
    end

    # Filter bits
    def self.fb21 : Bool
      value.fb21
    end

    # Filter bits
    def self.fb21=(value : Bool) : Bool
      self.set(fb21: value)
      value
    end

    # Filter bits
    def fb22 : Bool
      @value.bits_set?(0x400000_u32)
    end

    # Filter bits
    def self.fb22 : Bool
      value.fb22
    end

    # Filter bits
    def self.fb22=(value : Bool) : Bool
      self.set(fb22: value)
      value
    end

    # Filter bits
    def fb23 : Bool
      @value.bits_set?(0x800000_u32)
    end

    # Filter bits
    def self.fb23 : Bool
      value.fb23
    end

    # Filter bits
    def self.fb23=(value : Bool) : Bool
      self.set(fb23: value)
      value
    end

    # Filter bits
    def fb24 : Bool
      @value.bits_set?(0x1000000_u32)
    end

    # Filter bits
    def self.fb24 : Bool
      value.fb24
    end

    # Filter bits
    def self.fb24=(value : Bool) : Bool
      self.set(fb24: value)
      value
    end

    # Filter bits
    def fb25 : Bool
      @value.bits_set?(0x2000000_u32)
    end

    # Filter bits
    def self.fb25 : Bool
      value.fb25
    end

    # Filter bits
    def self.fb25=(value : Bool) : Bool
      self.set(fb25: value)
      value
    end

    # Filter bits
    def fb26 : Bool
      @value.bits_set?(0x4000000_u32)
    end

    # Filter bits
    def self.fb26 : Bool
      value.fb26
    end

    # Filter bits
    def self.fb26=(value : Bool) : Bool
      self.set(fb26: value)
      value
    end

    # Filter bits
    def fb27 : Bool
      @value.bits_set?(0x8000000_u32)
    end

    # Filter bits
    def self.fb27 : Bool
      value.fb27
    end

    # Filter bits
    def self.fb27=(value : Bool) : Bool
      self.set(fb27: value)
      value
    end

    # Filter bits
    def fb28 : Bool
      @value.bits_set?(0x10000000_u32)
    end

    # Filter bits
    def self.fb28 : Bool
      value.fb28
    end

    # Filter bits
    def self.fb28=(value : Bool) : Bool
      self.set(fb28: value)
      value
    end

    # Filter bits
    def fb29 : Bool
      @value.bits_set?(0x20000000_u32)
    end

    # Filter bits
    def self.fb29 : Bool
      value.fb29
    end

    # Filter bits
    def self.fb29=(value : Bool) : Bool
      self.set(fb29: value)
      value
    end

    # Filter bits
    def fb30 : Bool
      @value.bits_set?(0x40000000_u32)
    end

    # Filter bits
    def self.fb30 : Bool
      value.fb30
    end

    # Filter bits
    def self.fb30=(value : Bool) : Bool
      self.set(fb30: value)
      value
    end

    # Filter bits
    def fb31 : Bool
      @value.bits_set?(0x80000000_u32)
    end

    # Filter bits
    def self.fb31 : Bool
      value.fb31
    end

    # Filter bits
    def self.fb31=(value : Bool) : Bool
      self.set(fb31: value)
      value
    end

    def copy_with(
      *,

      fb0 : Bool? = nil,

      fb1 : Bool? = nil,

      fb2 : Bool? = nil,

      fb3 : Bool? = nil,

      fb4 : Bool? = nil,

      fb5 : Bool? = nil,

      fb6 : Bool? = nil,

      fb7 : Bool? = nil,

      fb8 : Bool? = nil,

      fb9 : Bool? = nil,

      fb10 : Bool? = nil,

      fb11 : Bool? = nil,

      fb12 : Bool? = nil,

      fb13 : Bool? = nil,

      fb14 : Bool? = nil,

      fb15 : Bool? = nil,

      fb16 : Bool? = nil,

      fb17 : Bool? = nil,

      fb18 : Bool? = nil,

      fb19 : Bool? = nil,

      fb20 : Bool? = nil,

      fb21 : Bool? = nil,

      fb22 : Bool? = nil,

      fb23 : Bool? = nil,

      fb24 : Bool? = nil,

      fb25 : Bool? = nil,

      fb26 : Bool? = nil,

      fb27 : Bool? = nil,

      fb28 : Bool? = nil,

      fb29 : Bool? = nil,

      fb30 : Bool? = nil,

      fb31 : Bool? = nil
    ) : self
      value = @value

      unless fb0.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(fb0.to_int).&(0x1_u32) << 0
      end

      unless fb1.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(fb1.to_int).&(0x1_u32) << 1
      end

      unless fb2.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(fb2.to_int).&(0x1_u32) << 2
      end

      unless fb3.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(fb3.to_int).&(0x1_u32) << 3
      end

      unless fb4.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(fb4.to_int).&(0x1_u32) << 4
      end

      unless fb5.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(fb5.to_int).&(0x1_u32) << 5
      end

      unless fb6.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(fb6.to_int).&(0x1_u32) << 6
      end

      unless fb7.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(fb7.to_int).&(0x1_u32) << 7
      end

      unless fb8.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(fb8.to_int).&(0x1_u32) << 8
      end

      unless fb9.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(fb9.to_int).&(0x1_u32) << 9
      end

      unless fb10.nil?
        value = (value & 0xfffffbff_u32) |
                UInt32.new!(fb10.to_int).&(0x1_u32) << 10
      end

      unless fb11.nil?
        value = (value & 0xfffff7ff_u32) |
                UInt32.new!(fb11.to_int).&(0x1_u32) << 11
      end

      unless fb12.nil?
        value = (value & 0xffffefff_u32) |
                UInt32.new!(fb12.to_int).&(0x1_u32) << 12
      end

      unless fb13.nil?
        value = (value & 0xffffdfff_u32) |
                UInt32.new!(fb13.to_int).&(0x1_u32) << 13
      end

      unless fb14.nil?
        value = (value & 0xffffbfff_u32) |
                UInt32.new!(fb14.to_int).&(0x1_u32) << 14
      end

      unless fb15.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(fb15.to_int).&(0x1_u32) << 15
      end

      unless fb16.nil?
        value = (value & 0xfffeffff_u32) |
                UInt32.new!(fb16.to_int).&(0x1_u32) << 16
      end

      unless fb17.nil?
        value = (value & 0xfffdffff_u32) |
                UInt32.new!(fb17.to_int).&(0x1_u32) << 17
      end

      unless fb18.nil?
        value = (value & 0xfffbffff_u32) |
                UInt32.new!(fb18.to_int).&(0x1_u32) << 18
      end

      unless fb19.nil?
        value = (value & 0xfff7ffff_u32) |
                UInt32.new!(fb19.to_int).&(0x1_u32) << 19
      end

      unless fb20.nil?
        value = (value & 0xffefffff_u32) |
                UInt32.new!(fb20.to_int).&(0x1_u32) << 20
      end

      unless fb21.nil?
        value = (value & 0xffdfffff_u32) |
                UInt32.new!(fb21.to_int).&(0x1_u32) << 21
      end

      unless fb22.nil?
        value = (value & 0xffbfffff_u32) |
                UInt32.new!(fb22.to_int).&(0x1_u32) << 22
      end

      unless fb23.nil?
        value = (value & 0xff7fffff_u32) |
                UInt32.new!(fb23.to_int).&(0x1_u32) << 23
      end

      unless fb24.nil?
        value = (value & 0xfeffffff_u32) |
                UInt32.new!(fb24.to_int).&(0x1_u32) << 24
      end

      unless fb25.nil?
        value = (value & 0xfdffffff_u32) |
                UInt32.new!(fb25.to_int).&(0x1_u32) << 25
      end

      unless fb26.nil?
        value = (value & 0xfbffffff_u32) |
                UInt32.new!(fb26.to_int).&(0x1_u32) << 26
      end

      unless fb27.nil?
        value = (value & 0xf7ffffff_u32) |
                UInt32.new!(fb27.to_int).&(0x1_u32) << 27
      end

      unless fb28.nil?
        value = (value & 0xefffffff_u32) |
                UInt32.new!(fb28.to_int).&(0x1_u32) << 28
      end

      unless fb29.nil?
        value = (value & 0xdfffffff_u32) |
                UInt32.new!(fb29.to_int).&(0x1_u32) << 29
      end

      unless fb30.nil?
        value = (value & 0xbfffffff_u32) |
                UInt32.new!(fb30.to_int).&(0x1_u32) << 30
      end

      unless fb31.nil?
        value = (value & 0x7fffffff_u32) |
                UInt32.new!(fb31.to_int).&(0x1_u32) << 31
      end

      self.class.new(value)
    end

    def self.set(
      *,
      fb0 : Bool? = nil,
      fb1 : Bool? = nil,
      fb2 : Bool? = nil,
      fb3 : Bool? = nil,
      fb4 : Bool? = nil,
      fb5 : Bool? = nil,
      fb6 : Bool? = nil,
      fb7 : Bool? = nil,
      fb8 : Bool? = nil,
      fb9 : Bool? = nil,
      fb10 : Bool? = nil,
      fb11 : Bool? = nil,
      fb12 : Bool? = nil,
      fb13 : Bool? = nil,
      fb14 : Bool? = nil,
      fb15 : Bool? = nil,
      fb16 : Bool? = nil,
      fb17 : Bool? = nil,
      fb18 : Bool? = nil,
      fb19 : Bool? = nil,
      fb20 : Bool? = nil,
      fb21 : Bool? = nil,
      fb22 : Bool? = nil,
      fb23 : Bool? = nil,
      fb24 : Bool? = nil,
      fb25 : Bool? = nil,
      fb26 : Bool? = nil,
      fb27 : Bool? = nil,
      fb28 : Bool? = nil,
      fb29 : Bool? = nil,
      fb30 : Bool? = nil,
      fb31 : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        fb0: fb0,
        fb1: fb1,
        fb2: fb2,
        fb3: fb3,
        fb4: fb4,
        fb5: fb5,
        fb6: fb6,
        fb7: fb7,
        fb8: fb8,
        fb9: fb9,
        fb10: fb10,
        fb11: fb11,
        fb12: fb12,
        fb13: fb13,
        fb14: fb14,
        fb15: fb15,
        fb16: fb16,
        fb17: fb17,
        fb18: fb18,
        fb19: fb19,
        fb20: fb20,
        fb21: fb21,
        fb22: fb22,
        fb23: fb23,
        fb24: fb24,
        fb25: fb25,
        fb26: fb26,
        fb27: fb27,
        fb28: fb28,
        fb29: fb29,
        fb30: fb30,
        fb31: fb31,
      )
    end
  end # struct

  # Filter bank 2 register 1
  struct F2R1
    ADDRESS = BASE_ADDRESS + 0x250_u64

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

    # Filter bits
    def fb0 : Bool
      @value.bits_set?(0x1_u32)
    end

    # Filter bits
    def self.fb0 : Bool
      value.fb0
    end

    # Filter bits
    def self.fb0=(value : Bool) : Bool
      self.set(fb0: value)
      value
    end

    # Filter bits
    def fb1 : Bool
      @value.bits_set?(0x2_u32)
    end

    # Filter bits
    def self.fb1 : Bool
      value.fb1
    end

    # Filter bits
    def self.fb1=(value : Bool) : Bool
      self.set(fb1: value)
      value
    end

    # Filter bits
    def fb2 : Bool
      @value.bits_set?(0x4_u32)
    end

    # Filter bits
    def self.fb2 : Bool
      value.fb2
    end

    # Filter bits
    def self.fb2=(value : Bool) : Bool
      self.set(fb2: value)
      value
    end

    # Filter bits
    def fb3 : Bool
      @value.bits_set?(0x8_u32)
    end

    # Filter bits
    def self.fb3 : Bool
      value.fb3
    end

    # Filter bits
    def self.fb3=(value : Bool) : Bool
      self.set(fb3: value)
      value
    end

    # Filter bits
    def fb4 : Bool
      @value.bits_set?(0x10_u32)
    end

    # Filter bits
    def self.fb4 : Bool
      value.fb4
    end

    # Filter bits
    def self.fb4=(value : Bool) : Bool
      self.set(fb4: value)
      value
    end

    # Filter bits
    def fb5 : Bool
      @value.bits_set?(0x20_u32)
    end

    # Filter bits
    def self.fb5 : Bool
      value.fb5
    end

    # Filter bits
    def self.fb5=(value : Bool) : Bool
      self.set(fb5: value)
      value
    end

    # Filter bits
    def fb6 : Bool
      @value.bits_set?(0x40_u32)
    end

    # Filter bits
    def self.fb6 : Bool
      value.fb6
    end

    # Filter bits
    def self.fb6=(value : Bool) : Bool
      self.set(fb6: value)
      value
    end

    # Filter bits
    def fb7 : Bool
      @value.bits_set?(0x80_u32)
    end

    # Filter bits
    def self.fb7 : Bool
      value.fb7
    end

    # Filter bits
    def self.fb7=(value : Bool) : Bool
      self.set(fb7: value)
      value
    end

    # Filter bits
    def fb8 : Bool
      @value.bits_set?(0x100_u32)
    end

    # Filter bits
    def self.fb8 : Bool
      value.fb8
    end

    # Filter bits
    def self.fb8=(value : Bool) : Bool
      self.set(fb8: value)
      value
    end

    # Filter bits
    def fb9 : Bool
      @value.bits_set?(0x200_u32)
    end

    # Filter bits
    def self.fb9 : Bool
      value.fb9
    end

    # Filter bits
    def self.fb9=(value : Bool) : Bool
      self.set(fb9: value)
      value
    end

    # Filter bits
    def fb10 : Bool
      @value.bits_set?(0x400_u32)
    end

    # Filter bits
    def self.fb10 : Bool
      value.fb10
    end

    # Filter bits
    def self.fb10=(value : Bool) : Bool
      self.set(fb10: value)
      value
    end

    # Filter bits
    def fb11 : Bool
      @value.bits_set?(0x800_u32)
    end

    # Filter bits
    def self.fb11 : Bool
      value.fb11
    end

    # Filter bits
    def self.fb11=(value : Bool) : Bool
      self.set(fb11: value)
      value
    end

    # Filter bits
    def fb12 : Bool
      @value.bits_set?(0x1000_u32)
    end

    # Filter bits
    def self.fb12 : Bool
      value.fb12
    end

    # Filter bits
    def self.fb12=(value : Bool) : Bool
      self.set(fb12: value)
      value
    end

    # Filter bits
    def fb13 : Bool
      @value.bits_set?(0x2000_u32)
    end

    # Filter bits
    def self.fb13 : Bool
      value.fb13
    end

    # Filter bits
    def self.fb13=(value : Bool) : Bool
      self.set(fb13: value)
      value
    end

    # Filter bits
    def fb14 : Bool
      @value.bits_set?(0x4000_u32)
    end

    # Filter bits
    def self.fb14 : Bool
      value.fb14
    end

    # Filter bits
    def self.fb14=(value : Bool) : Bool
      self.set(fb14: value)
      value
    end

    # Filter bits
    def fb15 : Bool
      @value.bits_set?(0x8000_u32)
    end

    # Filter bits
    def self.fb15 : Bool
      value.fb15
    end

    # Filter bits
    def self.fb15=(value : Bool) : Bool
      self.set(fb15: value)
      value
    end

    # Filter bits
    def fb16 : Bool
      @value.bits_set?(0x10000_u32)
    end

    # Filter bits
    def self.fb16 : Bool
      value.fb16
    end

    # Filter bits
    def self.fb16=(value : Bool) : Bool
      self.set(fb16: value)
      value
    end

    # Filter bits
    def fb17 : Bool
      @value.bits_set?(0x20000_u32)
    end

    # Filter bits
    def self.fb17 : Bool
      value.fb17
    end

    # Filter bits
    def self.fb17=(value : Bool) : Bool
      self.set(fb17: value)
      value
    end

    # Filter bits
    def fb18 : Bool
      @value.bits_set?(0x40000_u32)
    end

    # Filter bits
    def self.fb18 : Bool
      value.fb18
    end

    # Filter bits
    def self.fb18=(value : Bool) : Bool
      self.set(fb18: value)
      value
    end

    # Filter bits
    def fb19 : Bool
      @value.bits_set?(0x80000_u32)
    end

    # Filter bits
    def self.fb19 : Bool
      value.fb19
    end

    # Filter bits
    def self.fb19=(value : Bool) : Bool
      self.set(fb19: value)
      value
    end

    # Filter bits
    def fb20 : Bool
      @value.bits_set?(0x100000_u32)
    end

    # Filter bits
    def self.fb20 : Bool
      value.fb20
    end

    # Filter bits
    def self.fb20=(value : Bool) : Bool
      self.set(fb20: value)
      value
    end

    # Filter bits
    def fb21 : Bool
      @value.bits_set?(0x200000_u32)
    end

    # Filter bits
    def self.fb21 : Bool
      value.fb21
    end

    # Filter bits
    def self.fb21=(value : Bool) : Bool
      self.set(fb21: value)
      value
    end

    # Filter bits
    def fb22 : Bool
      @value.bits_set?(0x400000_u32)
    end

    # Filter bits
    def self.fb22 : Bool
      value.fb22
    end

    # Filter bits
    def self.fb22=(value : Bool) : Bool
      self.set(fb22: value)
      value
    end

    # Filter bits
    def fb23 : Bool
      @value.bits_set?(0x800000_u32)
    end

    # Filter bits
    def self.fb23 : Bool
      value.fb23
    end

    # Filter bits
    def self.fb23=(value : Bool) : Bool
      self.set(fb23: value)
      value
    end

    # Filter bits
    def fb24 : Bool
      @value.bits_set?(0x1000000_u32)
    end

    # Filter bits
    def self.fb24 : Bool
      value.fb24
    end

    # Filter bits
    def self.fb24=(value : Bool) : Bool
      self.set(fb24: value)
      value
    end

    # Filter bits
    def fb25 : Bool
      @value.bits_set?(0x2000000_u32)
    end

    # Filter bits
    def self.fb25 : Bool
      value.fb25
    end

    # Filter bits
    def self.fb25=(value : Bool) : Bool
      self.set(fb25: value)
      value
    end

    # Filter bits
    def fb26 : Bool
      @value.bits_set?(0x4000000_u32)
    end

    # Filter bits
    def self.fb26 : Bool
      value.fb26
    end

    # Filter bits
    def self.fb26=(value : Bool) : Bool
      self.set(fb26: value)
      value
    end

    # Filter bits
    def fb27 : Bool
      @value.bits_set?(0x8000000_u32)
    end

    # Filter bits
    def self.fb27 : Bool
      value.fb27
    end

    # Filter bits
    def self.fb27=(value : Bool) : Bool
      self.set(fb27: value)
      value
    end

    # Filter bits
    def fb28 : Bool
      @value.bits_set?(0x10000000_u32)
    end

    # Filter bits
    def self.fb28 : Bool
      value.fb28
    end

    # Filter bits
    def self.fb28=(value : Bool) : Bool
      self.set(fb28: value)
      value
    end

    # Filter bits
    def fb29 : Bool
      @value.bits_set?(0x20000000_u32)
    end

    # Filter bits
    def self.fb29 : Bool
      value.fb29
    end

    # Filter bits
    def self.fb29=(value : Bool) : Bool
      self.set(fb29: value)
      value
    end

    # Filter bits
    def fb30 : Bool
      @value.bits_set?(0x40000000_u32)
    end

    # Filter bits
    def self.fb30 : Bool
      value.fb30
    end

    # Filter bits
    def self.fb30=(value : Bool) : Bool
      self.set(fb30: value)
      value
    end

    # Filter bits
    def fb31 : Bool
      @value.bits_set?(0x80000000_u32)
    end

    # Filter bits
    def self.fb31 : Bool
      value.fb31
    end

    # Filter bits
    def self.fb31=(value : Bool) : Bool
      self.set(fb31: value)
      value
    end

    def copy_with(
      *,

      fb0 : Bool? = nil,

      fb1 : Bool? = nil,

      fb2 : Bool? = nil,

      fb3 : Bool? = nil,

      fb4 : Bool? = nil,

      fb5 : Bool? = nil,

      fb6 : Bool? = nil,

      fb7 : Bool? = nil,

      fb8 : Bool? = nil,

      fb9 : Bool? = nil,

      fb10 : Bool? = nil,

      fb11 : Bool? = nil,

      fb12 : Bool? = nil,

      fb13 : Bool? = nil,

      fb14 : Bool? = nil,

      fb15 : Bool? = nil,

      fb16 : Bool? = nil,

      fb17 : Bool? = nil,

      fb18 : Bool? = nil,

      fb19 : Bool? = nil,

      fb20 : Bool? = nil,

      fb21 : Bool? = nil,

      fb22 : Bool? = nil,

      fb23 : Bool? = nil,

      fb24 : Bool? = nil,

      fb25 : Bool? = nil,

      fb26 : Bool? = nil,

      fb27 : Bool? = nil,

      fb28 : Bool? = nil,

      fb29 : Bool? = nil,

      fb30 : Bool? = nil,

      fb31 : Bool? = nil
    ) : self
      value = @value

      unless fb0.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(fb0.to_int).&(0x1_u32) << 0
      end

      unless fb1.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(fb1.to_int).&(0x1_u32) << 1
      end

      unless fb2.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(fb2.to_int).&(0x1_u32) << 2
      end

      unless fb3.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(fb3.to_int).&(0x1_u32) << 3
      end

      unless fb4.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(fb4.to_int).&(0x1_u32) << 4
      end

      unless fb5.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(fb5.to_int).&(0x1_u32) << 5
      end

      unless fb6.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(fb6.to_int).&(0x1_u32) << 6
      end

      unless fb7.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(fb7.to_int).&(0x1_u32) << 7
      end

      unless fb8.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(fb8.to_int).&(0x1_u32) << 8
      end

      unless fb9.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(fb9.to_int).&(0x1_u32) << 9
      end

      unless fb10.nil?
        value = (value & 0xfffffbff_u32) |
                UInt32.new!(fb10.to_int).&(0x1_u32) << 10
      end

      unless fb11.nil?
        value = (value & 0xfffff7ff_u32) |
                UInt32.new!(fb11.to_int).&(0x1_u32) << 11
      end

      unless fb12.nil?
        value = (value & 0xffffefff_u32) |
                UInt32.new!(fb12.to_int).&(0x1_u32) << 12
      end

      unless fb13.nil?
        value = (value & 0xffffdfff_u32) |
                UInt32.new!(fb13.to_int).&(0x1_u32) << 13
      end

      unless fb14.nil?
        value = (value & 0xffffbfff_u32) |
                UInt32.new!(fb14.to_int).&(0x1_u32) << 14
      end

      unless fb15.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(fb15.to_int).&(0x1_u32) << 15
      end

      unless fb16.nil?
        value = (value & 0xfffeffff_u32) |
                UInt32.new!(fb16.to_int).&(0x1_u32) << 16
      end

      unless fb17.nil?
        value = (value & 0xfffdffff_u32) |
                UInt32.new!(fb17.to_int).&(0x1_u32) << 17
      end

      unless fb18.nil?
        value = (value & 0xfffbffff_u32) |
                UInt32.new!(fb18.to_int).&(0x1_u32) << 18
      end

      unless fb19.nil?
        value = (value & 0xfff7ffff_u32) |
                UInt32.new!(fb19.to_int).&(0x1_u32) << 19
      end

      unless fb20.nil?
        value = (value & 0xffefffff_u32) |
                UInt32.new!(fb20.to_int).&(0x1_u32) << 20
      end

      unless fb21.nil?
        value = (value & 0xffdfffff_u32) |
                UInt32.new!(fb21.to_int).&(0x1_u32) << 21
      end

      unless fb22.nil?
        value = (value & 0xffbfffff_u32) |
                UInt32.new!(fb22.to_int).&(0x1_u32) << 22
      end

      unless fb23.nil?
        value = (value & 0xff7fffff_u32) |
                UInt32.new!(fb23.to_int).&(0x1_u32) << 23
      end

      unless fb24.nil?
        value = (value & 0xfeffffff_u32) |
                UInt32.new!(fb24.to_int).&(0x1_u32) << 24
      end

      unless fb25.nil?
        value = (value & 0xfdffffff_u32) |
                UInt32.new!(fb25.to_int).&(0x1_u32) << 25
      end

      unless fb26.nil?
        value = (value & 0xfbffffff_u32) |
                UInt32.new!(fb26.to_int).&(0x1_u32) << 26
      end

      unless fb27.nil?
        value = (value & 0xf7ffffff_u32) |
                UInt32.new!(fb27.to_int).&(0x1_u32) << 27
      end

      unless fb28.nil?
        value = (value & 0xefffffff_u32) |
                UInt32.new!(fb28.to_int).&(0x1_u32) << 28
      end

      unless fb29.nil?
        value = (value & 0xdfffffff_u32) |
                UInt32.new!(fb29.to_int).&(0x1_u32) << 29
      end

      unless fb30.nil?
        value = (value & 0xbfffffff_u32) |
                UInt32.new!(fb30.to_int).&(0x1_u32) << 30
      end

      unless fb31.nil?
        value = (value & 0x7fffffff_u32) |
                UInt32.new!(fb31.to_int).&(0x1_u32) << 31
      end

      self.class.new(value)
    end

    def self.set(
      *,
      fb0 : Bool? = nil,
      fb1 : Bool? = nil,
      fb2 : Bool? = nil,
      fb3 : Bool? = nil,
      fb4 : Bool? = nil,
      fb5 : Bool? = nil,
      fb6 : Bool? = nil,
      fb7 : Bool? = nil,
      fb8 : Bool? = nil,
      fb9 : Bool? = nil,
      fb10 : Bool? = nil,
      fb11 : Bool? = nil,
      fb12 : Bool? = nil,
      fb13 : Bool? = nil,
      fb14 : Bool? = nil,
      fb15 : Bool? = nil,
      fb16 : Bool? = nil,
      fb17 : Bool? = nil,
      fb18 : Bool? = nil,
      fb19 : Bool? = nil,
      fb20 : Bool? = nil,
      fb21 : Bool? = nil,
      fb22 : Bool? = nil,
      fb23 : Bool? = nil,
      fb24 : Bool? = nil,
      fb25 : Bool? = nil,
      fb26 : Bool? = nil,
      fb27 : Bool? = nil,
      fb28 : Bool? = nil,
      fb29 : Bool? = nil,
      fb30 : Bool? = nil,
      fb31 : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        fb0: fb0,
        fb1: fb1,
        fb2: fb2,
        fb3: fb3,
        fb4: fb4,
        fb5: fb5,
        fb6: fb6,
        fb7: fb7,
        fb8: fb8,
        fb9: fb9,
        fb10: fb10,
        fb11: fb11,
        fb12: fb12,
        fb13: fb13,
        fb14: fb14,
        fb15: fb15,
        fb16: fb16,
        fb17: fb17,
        fb18: fb18,
        fb19: fb19,
        fb20: fb20,
        fb21: fb21,
        fb22: fb22,
        fb23: fb23,
        fb24: fb24,
        fb25: fb25,
        fb26: fb26,
        fb27: fb27,
        fb28: fb28,
        fb29: fb29,
        fb30: fb30,
        fb31: fb31,
      )
    end
  end # struct

  # Filter bank 2 register 2
  struct F2R2
    ADDRESS = BASE_ADDRESS + 0x254_u64

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

    # Filter bits
    def fb0 : Bool
      @value.bits_set?(0x1_u32)
    end

    # Filter bits
    def self.fb0 : Bool
      value.fb0
    end

    # Filter bits
    def self.fb0=(value : Bool) : Bool
      self.set(fb0: value)
      value
    end

    # Filter bits
    def fb1 : Bool
      @value.bits_set?(0x2_u32)
    end

    # Filter bits
    def self.fb1 : Bool
      value.fb1
    end

    # Filter bits
    def self.fb1=(value : Bool) : Bool
      self.set(fb1: value)
      value
    end

    # Filter bits
    def fb2 : Bool
      @value.bits_set?(0x4_u32)
    end

    # Filter bits
    def self.fb2 : Bool
      value.fb2
    end

    # Filter bits
    def self.fb2=(value : Bool) : Bool
      self.set(fb2: value)
      value
    end

    # Filter bits
    def fb3 : Bool
      @value.bits_set?(0x8_u32)
    end

    # Filter bits
    def self.fb3 : Bool
      value.fb3
    end

    # Filter bits
    def self.fb3=(value : Bool) : Bool
      self.set(fb3: value)
      value
    end

    # Filter bits
    def fb4 : Bool
      @value.bits_set?(0x10_u32)
    end

    # Filter bits
    def self.fb4 : Bool
      value.fb4
    end

    # Filter bits
    def self.fb4=(value : Bool) : Bool
      self.set(fb4: value)
      value
    end

    # Filter bits
    def fb5 : Bool
      @value.bits_set?(0x20_u32)
    end

    # Filter bits
    def self.fb5 : Bool
      value.fb5
    end

    # Filter bits
    def self.fb5=(value : Bool) : Bool
      self.set(fb5: value)
      value
    end

    # Filter bits
    def fb6 : Bool
      @value.bits_set?(0x40_u32)
    end

    # Filter bits
    def self.fb6 : Bool
      value.fb6
    end

    # Filter bits
    def self.fb6=(value : Bool) : Bool
      self.set(fb6: value)
      value
    end

    # Filter bits
    def fb7 : Bool
      @value.bits_set?(0x80_u32)
    end

    # Filter bits
    def self.fb7 : Bool
      value.fb7
    end

    # Filter bits
    def self.fb7=(value : Bool) : Bool
      self.set(fb7: value)
      value
    end

    # Filter bits
    def fb8 : Bool
      @value.bits_set?(0x100_u32)
    end

    # Filter bits
    def self.fb8 : Bool
      value.fb8
    end

    # Filter bits
    def self.fb8=(value : Bool) : Bool
      self.set(fb8: value)
      value
    end

    # Filter bits
    def fb9 : Bool
      @value.bits_set?(0x200_u32)
    end

    # Filter bits
    def self.fb9 : Bool
      value.fb9
    end

    # Filter bits
    def self.fb9=(value : Bool) : Bool
      self.set(fb9: value)
      value
    end

    # Filter bits
    def fb10 : Bool
      @value.bits_set?(0x400_u32)
    end

    # Filter bits
    def self.fb10 : Bool
      value.fb10
    end

    # Filter bits
    def self.fb10=(value : Bool) : Bool
      self.set(fb10: value)
      value
    end

    # Filter bits
    def fb11 : Bool
      @value.bits_set?(0x800_u32)
    end

    # Filter bits
    def self.fb11 : Bool
      value.fb11
    end

    # Filter bits
    def self.fb11=(value : Bool) : Bool
      self.set(fb11: value)
      value
    end

    # Filter bits
    def fb12 : Bool
      @value.bits_set?(0x1000_u32)
    end

    # Filter bits
    def self.fb12 : Bool
      value.fb12
    end

    # Filter bits
    def self.fb12=(value : Bool) : Bool
      self.set(fb12: value)
      value
    end

    # Filter bits
    def fb13 : Bool
      @value.bits_set?(0x2000_u32)
    end

    # Filter bits
    def self.fb13 : Bool
      value.fb13
    end

    # Filter bits
    def self.fb13=(value : Bool) : Bool
      self.set(fb13: value)
      value
    end

    # Filter bits
    def fb14 : Bool
      @value.bits_set?(0x4000_u32)
    end

    # Filter bits
    def self.fb14 : Bool
      value.fb14
    end

    # Filter bits
    def self.fb14=(value : Bool) : Bool
      self.set(fb14: value)
      value
    end

    # Filter bits
    def fb15 : Bool
      @value.bits_set?(0x8000_u32)
    end

    # Filter bits
    def self.fb15 : Bool
      value.fb15
    end

    # Filter bits
    def self.fb15=(value : Bool) : Bool
      self.set(fb15: value)
      value
    end

    # Filter bits
    def fb16 : Bool
      @value.bits_set?(0x10000_u32)
    end

    # Filter bits
    def self.fb16 : Bool
      value.fb16
    end

    # Filter bits
    def self.fb16=(value : Bool) : Bool
      self.set(fb16: value)
      value
    end

    # Filter bits
    def fb17 : Bool
      @value.bits_set?(0x20000_u32)
    end

    # Filter bits
    def self.fb17 : Bool
      value.fb17
    end

    # Filter bits
    def self.fb17=(value : Bool) : Bool
      self.set(fb17: value)
      value
    end

    # Filter bits
    def fb18 : Bool
      @value.bits_set?(0x40000_u32)
    end

    # Filter bits
    def self.fb18 : Bool
      value.fb18
    end

    # Filter bits
    def self.fb18=(value : Bool) : Bool
      self.set(fb18: value)
      value
    end

    # Filter bits
    def fb19 : Bool
      @value.bits_set?(0x80000_u32)
    end

    # Filter bits
    def self.fb19 : Bool
      value.fb19
    end

    # Filter bits
    def self.fb19=(value : Bool) : Bool
      self.set(fb19: value)
      value
    end

    # Filter bits
    def fb20 : Bool
      @value.bits_set?(0x100000_u32)
    end

    # Filter bits
    def self.fb20 : Bool
      value.fb20
    end

    # Filter bits
    def self.fb20=(value : Bool) : Bool
      self.set(fb20: value)
      value
    end

    # Filter bits
    def fb21 : Bool
      @value.bits_set?(0x200000_u32)
    end

    # Filter bits
    def self.fb21 : Bool
      value.fb21
    end

    # Filter bits
    def self.fb21=(value : Bool) : Bool
      self.set(fb21: value)
      value
    end

    # Filter bits
    def fb22 : Bool
      @value.bits_set?(0x400000_u32)
    end

    # Filter bits
    def self.fb22 : Bool
      value.fb22
    end

    # Filter bits
    def self.fb22=(value : Bool) : Bool
      self.set(fb22: value)
      value
    end

    # Filter bits
    def fb23 : Bool
      @value.bits_set?(0x800000_u32)
    end

    # Filter bits
    def self.fb23 : Bool
      value.fb23
    end

    # Filter bits
    def self.fb23=(value : Bool) : Bool
      self.set(fb23: value)
      value
    end

    # Filter bits
    def fb24 : Bool
      @value.bits_set?(0x1000000_u32)
    end

    # Filter bits
    def self.fb24 : Bool
      value.fb24
    end

    # Filter bits
    def self.fb24=(value : Bool) : Bool
      self.set(fb24: value)
      value
    end

    # Filter bits
    def fb25 : Bool
      @value.bits_set?(0x2000000_u32)
    end

    # Filter bits
    def self.fb25 : Bool
      value.fb25
    end

    # Filter bits
    def self.fb25=(value : Bool) : Bool
      self.set(fb25: value)
      value
    end

    # Filter bits
    def fb26 : Bool
      @value.bits_set?(0x4000000_u32)
    end

    # Filter bits
    def self.fb26 : Bool
      value.fb26
    end

    # Filter bits
    def self.fb26=(value : Bool) : Bool
      self.set(fb26: value)
      value
    end

    # Filter bits
    def fb27 : Bool
      @value.bits_set?(0x8000000_u32)
    end

    # Filter bits
    def self.fb27 : Bool
      value.fb27
    end

    # Filter bits
    def self.fb27=(value : Bool) : Bool
      self.set(fb27: value)
      value
    end

    # Filter bits
    def fb28 : Bool
      @value.bits_set?(0x10000000_u32)
    end

    # Filter bits
    def self.fb28 : Bool
      value.fb28
    end

    # Filter bits
    def self.fb28=(value : Bool) : Bool
      self.set(fb28: value)
      value
    end

    # Filter bits
    def fb29 : Bool
      @value.bits_set?(0x20000000_u32)
    end

    # Filter bits
    def self.fb29 : Bool
      value.fb29
    end

    # Filter bits
    def self.fb29=(value : Bool) : Bool
      self.set(fb29: value)
      value
    end

    # Filter bits
    def fb30 : Bool
      @value.bits_set?(0x40000000_u32)
    end

    # Filter bits
    def self.fb30 : Bool
      value.fb30
    end

    # Filter bits
    def self.fb30=(value : Bool) : Bool
      self.set(fb30: value)
      value
    end

    # Filter bits
    def fb31 : Bool
      @value.bits_set?(0x80000000_u32)
    end

    # Filter bits
    def self.fb31 : Bool
      value.fb31
    end

    # Filter bits
    def self.fb31=(value : Bool) : Bool
      self.set(fb31: value)
      value
    end

    def copy_with(
      *,

      fb0 : Bool? = nil,

      fb1 : Bool? = nil,

      fb2 : Bool? = nil,

      fb3 : Bool? = nil,

      fb4 : Bool? = nil,

      fb5 : Bool? = nil,

      fb6 : Bool? = nil,

      fb7 : Bool? = nil,

      fb8 : Bool? = nil,

      fb9 : Bool? = nil,

      fb10 : Bool? = nil,

      fb11 : Bool? = nil,

      fb12 : Bool? = nil,

      fb13 : Bool? = nil,

      fb14 : Bool? = nil,

      fb15 : Bool? = nil,

      fb16 : Bool? = nil,

      fb17 : Bool? = nil,

      fb18 : Bool? = nil,

      fb19 : Bool? = nil,

      fb20 : Bool? = nil,

      fb21 : Bool? = nil,

      fb22 : Bool? = nil,

      fb23 : Bool? = nil,

      fb24 : Bool? = nil,

      fb25 : Bool? = nil,

      fb26 : Bool? = nil,

      fb27 : Bool? = nil,

      fb28 : Bool? = nil,

      fb29 : Bool? = nil,

      fb30 : Bool? = nil,

      fb31 : Bool? = nil
    ) : self
      value = @value

      unless fb0.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(fb0.to_int).&(0x1_u32) << 0
      end

      unless fb1.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(fb1.to_int).&(0x1_u32) << 1
      end

      unless fb2.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(fb2.to_int).&(0x1_u32) << 2
      end

      unless fb3.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(fb3.to_int).&(0x1_u32) << 3
      end

      unless fb4.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(fb4.to_int).&(0x1_u32) << 4
      end

      unless fb5.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(fb5.to_int).&(0x1_u32) << 5
      end

      unless fb6.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(fb6.to_int).&(0x1_u32) << 6
      end

      unless fb7.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(fb7.to_int).&(0x1_u32) << 7
      end

      unless fb8.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(fb8.to_int).&(0x1_u32) << 8
      end

      unless fb9.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(fb9.to_int).&(0x1_u32) << 9
      end

      unless fb10.nil?
        value = (value & 0xfffffbff_u32) |
                UInt32.new!(fb10.to_int).&(0x1_u32) << 10
      end

      unless fb11.nil?
        value = (value & 0xfffff7ff_u32) |
                UInt32.new!(fb11.to_int).&(0x1_u32) << 11
      end

      unless fb12.nil?
        value = (value & 0xffffefff_u32) |
                UInt32.new!(fb12.to_int).&(0x1_u32) << 12
      end

      unless fb13.nil?
        value = (value & 0xffffdfff_u32) |
                UInt32.new!(fb13.to_int).&(0x1_u32) << 13
      end

      unless fb14.nil?
        value = (value & 0xffffbfff_u32) |
                UInt32.new!(fb14.to_int).&(0x1_u32) << 14
      end

      unless fb15.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(fb15.to_int).&(0x1_u32) << 15
      end

      unless fb16.nil?
        value = (value & 0xfffeffff_u32) |
                UInt32.new!(fb16.to_int).&(0x1_u32) << 16
      end

      unless fb17.nil?
        value = (value & 0xfffdffff_u32) |
                UInt32.new!(fb17.to_int).&(0x1_u32) << 17
      end

      unless fb18.nil?
        value = (value & 0xfffbffff_u32) |
                UInt32.new!(fb18.to_int).&(0x1_u32) << 18
      end

      unless fb19.nil?
        value = (value & 0xfff7ffff_u32) |
                UInt32.new!(fb19.to_int).&(0x1_u32) << 19
      end

      unless fb20.nil?
        value = (value & 0xffefffff_u32) |
                UInt32.new!(fb20.to_int).&(0x1_u32) << 20
      end

      unless fb21.nil?
        value = (value & 0xffdfffff_u32) |
                UInt32.new!(fb21.to_int).&(0x1_u32) << 21
      end

      unless fb22.nil?
        value = (value & 0xffbfffff_u32) |
                UInt32.new!(fb22.to_int).&(0x1_u32) << 22
      end

      unless fb23.nil?
        value = (value & 0xff7fffff_u32) |
                UInt32.new!(fb23.to_int).&(0x1_u32) << 23
      end

      unless fb24.nil?
        value = (value & 0xfeffffff_u32) |
                UInt32.new!(fb24.to_int).&(0x1_u32) << 24
      end

      unless fb25.nil?
        value = (value & 0xfdffffff_u32) |
                UInt32.new!(fb25.to_int).&(0x1_u32) << 25
      end

      unless fb26.nil?
        value = (value & 0xfbffffff_u32) |
                UInt32.new!(fb26.to_int).&(0x1_u32) << 26
      end

      unless fb27.nil?
        value = (value & 0xf7ffffff_u32) |
                UInt32.new!(fb27.to_int).&(0x1_u32) << 27
      end

      unless fb28.nil?
        value = (value & 0xefffffff_u32) |
                UInt32.new!(fb28.to_int).&(0x1_u32) << 28
      end

      unless fb29.nil?
        value = (value & 0xdfffffff_u32) |
                UInt32.new!(fb29.to_int).&(0x1_u32) << 29
      end

      unless fb30.nil?
        value = (value & 0xbfffffff_u32) |
                UInt32.new!(fb30.to_int).&(0x1_u32) << 30
      end

      unless fb31.nil?
        value = (value & 0x7fffffff_u32) |
                UInt32.new!(fb31.to_int).&(0x1_u32) << 31
      end

      self.class.new(value)
    end

    def self.set(
      *,
      fb0 : Bool? = nil,
      fb1 : Bool? = nil,
      fb2 : Bool? = nil,
      fb3 : Bool? = nil,
      fb4 : Bool? = nil,
      fb5 : Bool? = nil,
      fb6 : Bool? = nil,
      fb7 : Bool? = nil,
      fb8 : Bool? = nil,
      fb9 : Bool? = nil,
      fb10 : Bool? = nil,
      fb11 : Bool? = nil,
      fb12 : Bool? = nil,
      fb13 : Bool? = nil,
      fb14 : Bool? = nil,
      fb15 : Bool? = nil,
      fb16 : Bool? = nil,
      fb17 : Bool? = nil,
      fb18 : Bool? = nil,
      fb19 : Bool? = nil,
      fb20 : Bool? = nil,
      fb21 : Bool? = nil,
      fb22 : Bool? = nil,
      fb23 : Bool? = nil,
      fb24 : Bool? = nil,
      fb25 : Bool? = nil,
      fb26 : Bool? = nil,
      fb27 : Bool? = nil,
      fb28 : Bool? = nil,
      fb29 : Bool? = nil,
      fb30 : Bool? = nil,
      fb31 : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        fb0: fb0,
        fb1: fb1,
        fb2: fb2,
        fb3: fb3,
        fb4: fb4,
        fb5: fb5,
        fb6: fb6,
        fb7: fb7,
        fb8: fb8,
        fb9: fb9,
        fb10: fb10,
        fb11: fb11,
        fb12: fb12,
        fb13: fb13,
        fb14: fb14,
        fb15: fb15,
        fb16: fb16,
        fb17: fb17,
        fb18: fb18,
        fb19: fb19,
        fb20: fb20,
        fb21: fb21,
        fb22: fb22,
        fb23: fb23,
        fb24: fb24,
        fb25: fb25,
        fb26: fb26,
        fb27: fb27,
        fb28: fb28,
        fb29: fb29,
        fb30: fb30,
        fb31: fb31,
      )
    end
  end # struct

  # Filter bank 3 register 1
  struct F3R1
    ADDRESS = BASE_ADDRESS + 0x258_u64

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

    # Filter bits
    def fb0 : Bool
      @value.bits_set?(0x1_u32)
    end

    # Filter bits
    def self.fb0 : Bool
      value.fb0
    end

    # Filter bits
    def self.fb0=(value : Bool) : Bool
      self.set(fb0: value)
      value
    end

    # Filter bits
    def fb1 : Bool
      @value.bits_set?(0x2_u32)
    end

    # Filter bits
    def self.fb1 : Bool
      value.fb1
    end

    # Filter bits
    def self.fb1=(value : Bool) : Bool
      self.set(fb1: value)
      value
    end

    # Filter bits
    def fb2 : Bool
      @value.bits_set?(0x4_u32)
    end

    # Filter bits
    def self.fb2 : Bool
      value.fb2
    end

    # Filter bits
    def self.fb2=(value : Bool) : Bool
      self.set(fb2: value)
      value
    end

    # Filter bits
    def fb3 : Bool
      @value.bits_set?(0x8_u32)
    end

    # Filter bits
    def self.fb3 : Bool
      value.fb3
    end

    # Filter bits
    def self.fb3=(value : Bool) : Bool
      self.set(fb3: value)
      value
    end

    # Filter bits
    def fb4 : Bool
      @value.bits_set?(0x10_u32)
    end

    # Filter bits
    def self.fb4 : Bool
      value.fb4
    end

    # Filter bits
    def self.fb4=(value : Bool) : Bool
      self.set(fb4: value)
      value
    end

    # Filter bits
    def fb5 : Bool
      @value.bits_set?(0x20_u32)
    end

    # Filter bits
    def self.fb5 : Bool
      value.fb5
    end

    # Filter bits
    def self.fb5=(value : Bool) : Bool
      self.set(fb5: value)
      value
    end

    # Filter bits
    def fb6 : Bool
      @value.bits_set?(0x40_u32)
    end

    # Filter bits
    def self.fb6 : Bool
      value.fb6
    end

    # Filter bits
    def self.fb6=(value : Bool) : Bool
      self.set(fb6: value)
      value
    end

    # Filter bits
    def fb7 : Bool
      @value.bits_set?(0x80_u32)
    end

    # Filter bits
    def self.fb7 : Bool
      value.fb7
    end

    # Filter bits
    def self.fb7=(value : Bool) : Bool
      self.set(fb7: value)
      value
    end

    # Filter bits
    def fb8 : Bool
      @value.bits_set?(0x100_u32)
    end

    # Filter bits
    def self.fb8 : Bool
      value.fb8
    end

    # Filter bits
    def self.fb8=(value : Bool) : Bool
      self.set(fb8: value)
      value
    end

    # Filter bits
    def fb9 : Bool
      @value.bits_set?(0x200_u32)
    end

    # Filter bits
    def self.fb9 : Bool
      value.fb9
    end

    # Filter bits
    def self.fb9=(value : Bool) : Bool
      self.set(fb9: value)
      value
    end

    # Filter bits
    def fb10 : Bool
      @value.bits_set?(0x400_u32)
    end

    # Filter bits
    def self.fb10 : Bool
      value.fb10
    end

    # Filter bits
    def self.fb10=(value : Bool) : Bool
      self.set(fb10: value)
      value
    end

    # Filter bits
    def fb11 : Bool
      @value.bits_set?(0x800_u32)
    end

    # Filter bits
    def self.fb11 : Bool
      value.fb11
    end

    # Filter bits
    def self.fb11=(value : Bool) : Bool
      self.set(fb11: value)
      value
    end

    # Filter bits
    def fb12 : Bool
      @value.bits_set?(0x1000_u32)
    end

    # Filter bits
    def self.fb12 : Bool
      value.fb12
    end

    # Filter bits
    def self.fb12=(value : Bool) : Bool
      self.set(fb12: value)
      value
    end

    # Filter bits
    def fb13 : Bool
      @value.bits_set?(0x2000_u32)
    end

    # Filter bits
    def self.fb13 : Bool
      value.fb13
    end

    # Filter bits
    def self.fb13=(value : Bool) : Bool
      self.set(fb13: value)
      value
    end

    # Filter bits
    def fb14 : Bool
      @value.bits_set?(0x4000_u32)
    end

    # Filter bits
    def self.fb14 : Bool
      value.fb14
    end

    # Filter bits
    def self.fb14=(value : Bool) : Bool
      self.set(fb14: value)
      value
    end

    # Filter bits
    def fb15 : Bool
      @value.bits_set?(0x8000_u32)
    end

    # Filter bits
    def self.fb15 : Bool
      value.fb15
    end

    # Filter bits
    def self.fb15=(value : Bool) : Bool
      self.set(fb15: value)
      value
    end

    # Filter bits
    def fb16 : Bool
      @value.bits_set?(0x10000_u32)
    end

    # Filter bits
    def self.fb16 : Bool
      value.fb16
    end

    # Filter bits
    def self.fb16=(value : Bool) : Bool
      self.set(fb16: value)
      value
    end

    # Filter bits
    def fb17 : Bool
      @value.bits_set?(0x20000_u32)
    end

    # Filter bits
    def self.fb17 : Bool
      value.fb17
    end

    # Filter bits
    def self.fb17=(value : Bool) : Bool
      self.set(fb17: value)
      value
    end

    # Filter bits
    def fb18 : Bool
      @value.bits_set?(0x40000_u32)
    end

    # Filter bits
    def self.fb18 : Bool
      value.fb18
    end

    # Filter bits
    def self.fb18=(value : Bool) : Bool
      self.set(fb18: value)
      value
    end

    # Filter bits
    def fb19 : Bool
      @value.bits_set?(0x80000_u32)
    end

    # Filter bits
    def self.fb19 : Bool
      value.fb19
    end

    # Filter bits
    def self.fb19=(value : Bool) : Bool
      self.set(fb19: value)
      value
    end

    # Filter bits
    def fb20 : Bool
      @value.bits_set?(0x100000_u32)
    end

    # Filter bits
    def self.fb20 : Bool
      value.fb20
    end

    # Filter bits
    def self.fb20=(value : Bool) : Bool
      self.set(fb20: value)
      value
    end

    # Filter bits
    def fb21 : Bool
      @value.bits_set?(0x200000_u32)
    end

    # Filter bits
    def self.fb21 : Bool
      value.fb21
    end

    # Filter bits
    def self.fb21=(value : Bool) : Bool
      self.set(fb21: value)
      value
    end

    # Filter bits
    def fb22 : Bool
      @value.bits_set?(0x400000_u32)
    end

    # Filter bits
    def self.fb22 : Bool
      value.fb22
    end

    # Filter bits
    def self.fb22=(value : Bool) : Bool
      self.set(fb22: value)
      value
    end

    # Filter bits
    def fb23 : Bool
      @value.bits_set?(0x800000_u32)
    end

    # Filter bits
    def self.fb23 : Bool
      value.fb23
    end

    # Filter bits
    def self.fb23=(value : Bool) : Bool
      self.set(fb23: value)
      value
    end

    # Filter bits
    def fb24 : Bool
      @value.bits_set?(0x1000000_u32)
    end

    # Filter bits
    def self.fb24 : Bool
      value.fb24
    end

    # Filter bits
    def self.fb24=(value : Bool) : Bool
      self.set(fb24: value)
      value
    end

    # Filter bits
    def fb25 : Bool
      @value.bits_set?(0x2000000_u32)
    end

    # Filter bits
    def self.fb25 : Bool
      value.fb25
    end

    # Filter bits
    def self.fb25=(value : Bool) : Bool
      self.set(fb25: value)
      value
    end

    # Filter bits
    def fb26 : Bool
      @value.bits_set?(0x4000000_u32)
    end

    # Filter bits
    def self.fb26 : Bool
      value.fb26
    end

    # Filter bits
    def self.fb26=(value : Bool) : Bool
      self.set(fb26: value)
      value
    end

    # Filter bits
    def fb27 : Bool
      @value.bits_set?(0x8000000_u32)
    end

    # Filter bits
    def self.fb27 : Bool
      value.fb27
    end

    # Filter bits
    def self.fb27=(value : Bool) : Bool
      self.set(fb27: value)
      value
    end

    # Filter bits
    def fb28 : Bool
      @value.bits_set?(0x10000000_u32)
    end

    # Filter bits
    def self.fb28 : Bool
      value.fb28
    end

    # Filter bits
    def self.fb28=(value : Bool) : Bool
      self.set(fb28: value)
      value
    end

    # Filter bits
    def fb29 : Bool
      @value.bits_set?(0x20000000_u32)
    end

    # Filter bits
    def self.fb29 : Bool
      value.fb29
    end

    # Filter bits
    def self.fb29=(value : Bool) : Bool
      self.set(fb29: value)
      value
    end

    # Filter bits
    def fb30 : Bool
      @value.bits_set?(0x40000000_u32)
    end

    # Filter bits
    def self.fb30 : Bool
      value.fb30
    end

    # Filter bits
    def self.fb30=(value : Bool) : Bool
      self.set(fb30: value)
      value
    end

    # Filter bits
    def fb31 : Bool
      @value.bits_set?(0x80000000_u32)
    end

    # Filter bits
    def self.fb31 : Bool
      value.fb31
    end

    # Filter bits
    def self.fb31=(value : Bool) : Bool
      self.set(fb31: value)
      value
    end

    def copy_with(
      *,

      fb0 : Bool? = nil,

      fb1 : Bool? = nil,

      fb2 : Bool? = nil,

      fb3 : Bool? = nil,

      fb4 : Bool? = nil,

      fb5 : Bool? = nil,

      fb6 : Bool? = nil,

      fb7 : Bool? = nil,

      fb8 : Bool? = nil,

      fb9 : Bool? = nil,

      fb10 : Bool? = nil,

      fb11 : Bool? = nil,

      fb12 : Bool? = nil,

      fb13 : Bool? = nil,

      fb14 : Bool? = nil,

      fb15 : Bool? = nil,

      fb16 : Bool? = nil,

      fb17 : Bool? = nil,

      fb18 : Bool? = nil,

      fb19 : Bool? = nil,

      fb20 : Bool? = nil,

      fb21 : Bool? = nil,

      fb22 : Bool? = nil,

      fb23 : Bool? = nil,

      fb24 : Bool? = nil,

      fb25 : Bool? = nil,

      fb26 : Bool? = nil,

      fb27 : Bool? = nil,

      fb28 : Bool? = nil,

      fb29 : Bool? = nil,

      fb30 : Bool? = nil,

      fb31 : Bool? = nil
    ) : self
      value = @value

      unless fb0.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(fb0.to_int).&(0x1_u32) << 0
      end

      unless fb1.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(fb1.to_int).&(0x1_u32) << 1
      end

      unless fb2.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(fb2.to_int).&(0x1_u32) << 2
      end

      unless fb3.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(fb3.to_int).&(0x1_u32) << 3
      end

      unless fb4.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(fb4.to_int).&(0x1_u32) << 4
      end

      unless fb5.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(fb5.to_int).&(0x1_u32) << 5
      end

      unless fb6.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(fb6.to_int).&(0x1_u32) << 6
      end

      unless fb7.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(fb7.to_int).&(0x1_u32) << 7
      end

      unless fb8.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(fb8.to_int).&(0x1_u32) << 8
      end

      unless fb9.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(fb9.to_int).&(0x1_u32) << 9
      end

      unless fb10.nil?
        value = (value & 0xfffffbff_u32) |
                UInt32.new!(fb10.to_int).&(0x1_u32) << 10
      end

      unless fb11.nil?
        value = (value & 0xfffff7ff_u32) |
                UInt32.new!(fb11.to_int).&(0x1_u32) << 11
      end

      unless fb12.nil?
        value = (value & 0xffffefff_u32) |
                UInt32.new!(fb12.to_int).&(0x1_u32) << 12
      end

      unless fb13.nil?
        value = (value & 0xffffdfff_u32) |
                UInt32.new!(fb13.to_int).&(0x1_u32) << 13
      end

      unless fb14.nil?
        value = (value & 0xffffbfff_u32) |
                UInt32.new!(fb14.to_int).&(0x1_u32) << 14
      end

      unless fb15.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(fb15.to_int).&(0x1_u32) << 15
      end

      unless fb16.nil?
        value = (value & 0xfffeffff_u32) |
                UInt32.new!(fb16.to_int).&(0x1_u32) << 16
      end

      unless fb17.nil?
        value = (value & 0xfffdffff_u32) |
                UInt32.new!(fb17.to_int).&(0x1_u32) << 17
      end

      unless fb18.nil?
        value = (value & 0xfffbffff_u32) |
                UInt32.new!(fb18.to_int).&(0x1_u32) << 18
      end

      unless fb19.nil?
        value = (value & 0xfff7ffff_u32) |
                UInt32.new!(fb19.to_int).&(0x1_u32) << 19
      end

      unless fb20.nil?
        value = (value & 0xffefffff_u32) |
                UInt32.new!(fb20.to_int).&(0x1_u32) << 20
      end

      unless fb21.nil?
        value = (value & 0xffdfffff_u32) |
                UInt32.new!(fb21.to_int).&(0x1_u32) << 21
      end

      unless fb22.nil?
        value = (value & 0xffbfffff_u32) |
                UInt32.new!(fb22.to_int).&(0x1_u32) << 22
      end

      unless fb23.nil?
        value = (value & 0xff7fffff_u32) |
                UInt32.new!(fb23.to_int).&(0x1_u32) << 23
      end

      unless fb24.nil?
        value = (value & 0xfeffffff_u32) |
                UInt32.new!(fb24.to_int).&(0x1_u32) << 24
      end

      unless fb25.nil?
        value = (value & 0xfdffffff_u32) |
                UInt32.new!(fb25.to_int).&(0x1_u32) << 25
      end

      unless fb26.nil?
        value = (value & 0xfbffffff_u32) |
                UInt32.new!(fb26.to_int).&(0x1_u32) << 26
      end

      unless fb27.nil?
        value = (value & 0xf7ffffff_u32) |
                UInt32.new!(fb27.to_int).&(0x1_u32) << 27
      end

      unless fb28.nil?
        value = (value & 0xefffffff_u32) |
                UInt32.new!(fb28.to_int).&(0x1_u32) << 28
      end

      unless fb29.nil?
        value = (value & 0xdfffffff_u32) |
                UInt32.new!(fb29.to_int).&(0x1_u32) << 29
      end

      unless fb30.nil?
        value = (value & 0xbfffffff_u32) |
                UInt32.new!(fb30.to_int).&(0x1_u32) << 30
      end

      unless fb31.nil?
        value = (value & 0x7fffffff_u32) |
                UInt32.new!(fb31.to_int).&(0x1_u32) << 31
      end

      self.class.new(value)
    end

    def self.set(
      *,
      fb0 : Bool? = nil,
      fb1 : Bool? = nil,
      fb2 : Bool? = nil,
      fb3 : Bool? = nil,
      fb4 : Bool? = nil,
      fb5 : Bool? = nil,
      fb6 : Bool? = nil,
      fb7 : Bool? = nil,
      fb8 : Bool? = nil,
      fb9 : Bool? = nil,
      fb10 : Bool? = nil,
      fb11 : Bool? = nil,
      fb12 : Bool? = nil,
      fb13 : Bool? = nil,
      fb14 : Bool? = nil,
      fb15 : Bool? = nil,
      fb16 : Bool? = nil,
      fb17 : Bool? = nil,
      fb18 : Bool? = nil,
      fb19 : Bool? = nil,
      fb20 : Bool? = nil,
      fb21 : Bool? = nil,
      fb22 : Bool? = nil,
      fb23 : Bool? = nil,
      fb24 : Bool? = nil,
      fb25 : Bool? = nil,
      fb26 : Bool? = nil,
      fb27 : Bool? = nil,
      fb28 : Bool? = nil,
      fb29 : Bool? = nil,
      fb30 : Bool? = nil,
      fb31 : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        fb0: fb0,
        fb1: fb1,
        fb2: fb2,
        fb3: fb3,
        fb4: fb4,
        fb5: fb5,
        fb6: fb6,
        fb7: fb7,
        fb8: fb8,
        fb9: fb9,
        fb10: fb10,
        fb11: fb11,
        fb12: fb12,
        fb13: fb13,
        fb14: fb14,
        fb15: fb15,
        fb16: fb16,
        fb17: fb17,
        fb18: fb18,
        fb19: fb19,
        fb20: fb20,
        fb21: fb21,
        fb22: fb22,
        fb23: fb23,
        fb24: fb24,
        fb25: fb25,
        fb26: fb26,
        fb27: fb27,
        fb28: fb28,
        fb29: fb29,
        fb30: fb30,
        fb31: fb31,
      )
    end
  end # struct

  # Filter bank 3 register 2
  struct F3R2
    ADDRESS = BASE_ADDRESS + 0x25c_u64

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

    # Filter bits
    def fb0 : Bool
      @value.bits_set?(0x1_u32)
    end

    # Filter bits
    def self.fb0 : Bool
      value.fb0
    end

    # Filter bits
    def self.fb0=(value : Bool) : Bool
      self.set(fb0: value)
      value
    end

    # Filter bits
    def fb1 : Bool
      @value.bits_set?(0x2_u32)
    end

    # Filter bits
    def self.fb1 : Bool
      value.fb1
    end

    # Filter bits
    def self.fb1=(value : Bool) : Bool
      self.set(fb1: value)
      value
    end

    # Filter bits
    def fb2 : Bool
      @value.bits_set?(0x4_u32)
    end

    # Filter bits
    def self.fb2 : Bool
      value.fb2
    end

    # Filter bits
    def self.fb2=(value : Bool) : Bool
      self.set(fb2: value)
      value
    end

    # Filter bits
    def fb3 : Bool
      @value.bits_set?(0x8_u32)
    end

    # Filter bits
    def self.fb3 : Bool
      value.fb3
    end

    # Filter bits
    def self.fb3=(value : Bool) : Bool
      self.set(fb3: value)
      value
    end

    # Filter bits
    def fb4 : Bool
      @value.bits_set?(0x10_u32)
    end

    # Filter bits
    def self.fb4 : Bool
      value.fb4
    end

    # Filter bits
    def self.fb4=(value : Bool) : Bool
      self.set(fb4: value)
      value
    end

    # Filter bits
    def fb5 : Bool
      @value.bits_set?(0x20_u32)
    end

    # Filter bits
    def self.fb5 : Bool
      value.fb5
    end

    # Filter bits
    def self.fb5=(value : Bool) : Bool
      self.set(fb5: value)
      value
    end

    # Filter bits
    def fb6 : Bool
      @value.bits_set?(0x40_u32)
    end

    # Filter bits
    def self.fb6 : Bool
      value.fb6
    end

    # Filter bits
    def self.fb6=(value : Bool) : Bool
      self.set(fb6: value)
      value
    end

    # Filter bits
    def fb7 : Bool
      @value.bits_set?(0x80_u32)
    end

    # Filter bits
    def self.fb7 : Bool
      value.fb7
    end

    # Filter bits
    def self.fb7=(value : Bool) : Bool
      self.set(fb7: value)
      value
    end

    # Filter bits
    def fb8 : Bool
      @value.bits_set?(0x100_u32)
    end

    # Filter bits
    def self.fb8 : Bool
      value.fb8
    end

    # Filter bits
    def self.fb8=(value : Bool) : Bool
      self.set(fb8: value)
      value
    end

    # Filter bits
    def fb9 : Bool
      @value.bits_set?(0x200_u32)
    end

    # Filter bits
    def self.fb9 : Bool
      value.fb9
    end

    # Filter bits
    def self.fb9=(value : Bool) : Bool
      self.set(fb9: value)
      value
    end

    # Filter bits
    def fb10 : Bool
      @value.bits_set?(0x400_u32)
    end

    # Filter bits
    def self.fb10 : Bool
      value.fb10
    end

    # Filter bits
    def self.fb10=(value : Bool) : Bool
      self.set(fb10: value)
      value
    end

    # Filter bits
    def fb11 : Bool
      @value.bits_set?(0x800_u32)
    end

    # Filter bits
    def self.fb11 : Bool
      value.fb11
    end

    # Filter bits
    def self.fb11=(value : Bool) : Bool
      self.set(fb11: value)
      value
    end

    # Filter bits
    def fb12 : Bool
      @value.bits_set?(0x1000_u32)
    end

    # Filter bits
    def self.fb12 : Bool
      value.fb12
    end

    # Filter bits
    def self.fb12=(value : Bool) : Bool
      self.set(fb12: value)
      value
    end

    # Filter bits
    def fb13 : Bool
      @value.bits_set?(0x2000_u32)
    end

    # Filter bits
    def self.fb13 : Bool
      value.fb13
    end

    # Filter bits
    def self.fb13=(value : Bool) : Bool
      self.set(fb13: value)
      value
    end

    # Filter bits
    def fb14 : Bool
      @value.bits_set?(0x4000_u32)
    end

    # Filter bits
    def self.fb14 : Bool
      value.fb14
    end

    # Filter bits
    def self.fb14=(value : Bool) : Bool
      self.set(fb14: value)
      value
    end

    # Filter bits
    def fb15 : Bool
      @value.bits_set?(0x8000_u32)
    end

    # Filter bits
    def self.fb15 : Bool
      value.fb15
    end

    # Filter bits
    def self.fb15=(value : Bool) : Bool
      self.set(fb15: value)
      value
    end

    # Filter bits
    def fb16 : Bool
      @value.bits_set?(0x10000_u32)
    end

    # Filter bits
    def self.fb16 : Bool
      value.fb16
    end

    # Filter bits
    def self.fb16=(value : Bool) : Bool
      self.set(fb16: value)
      value
    end

    # Filter bits
    def fb17 : Bool
      @value.bits_set?(0x20000_u32)
    end

    # Filter bits
    def self.fb17 : Bool
      value.fb17
    end

    # Filter bits
    def self.fb17=(value : Bool) : Bool
      self.set(fb17: value)
      value
    end

    # Filter bits
    def fb18 : Bool
      @value.bits_set?(0x40000_u32)
    end

    # Filter bits
    def self.fb18 : Bool
      value.fb18
    end

    # Filter bits
    def self.fb18=(value : Bool) : Bool
      self.set(fb18: value)
      value
    end

    # Filter bits
    def fb19 : Bool
      @value.bits_set?(0x80000_u32)
    end

    # Filter bits
    def self.fb19 : Bool
      value.fb19
    end

    # Filter bits
    def self.fb19=(value : Bool) : Bool
      self.set(fb19: value)
      value
    end

    # Filter bits
    def fb20 : Bool
      @value.bits_set?(0x100000_u32)
    end

    # Filter bits
    def self.fb20 : Bool
      value.fb20
    end

    # Filter bits
    def self.fb20=(value : Bool) : Bool
      self.set(fb20: value)
      value
    end

    # Filter bits
    def fb21 : Bool
      @value.bits_set?(0x200000_u32)
    end

    # Filter bits
    def self.fb21 : Bool
      value.fb21
    end

    # Filter bits
    def self.fb21=(value : Bool) : Bool
      self.set(fb21: value)
      value
    end

    # Filter bits
    def fb22 : Bool
      @value.bits_set?(0x400000_u32)
    end

    # Filter bits
    def self.fb22 : Bool
      value.fb22
    end

    # Filter bits
    def self.fb22=(value : Bool) : Bool
      self.set(fb22: value)
      value
    end

    # Filter bits
    def fb23 : Bool
      @value.bits_set?(0x800000_u32)
    end

    # Filter bits
    def self.fb23 : Bool
      value.fb23
    end

    # Filter bits
    def self.fb23=(value : Bool) : Bool
      self.set(fb23: value)
      value
    end

    # Filter bits
    def fb24 : Bool
      @value.bits_set?(0x1000000_u32)
    end

    # Filter bits
    def self.fb24 : Bool
      value.fb24
    end

    # Filter bits
    def self.fb24=(value : Bool) : Bool
      self.set(fb24: value)
      value
    end

    # Filter bits
    def fb25 : Bool
      @value.bits_set?(0x2000000_u32)
    end

    # Filter bits
    def self.fb25 : Bool
      value.fb25
    end

    # Filter bits
    def self.fb25=(value : Bool) : Bool
      self.set(fb25: value)
      value
    end

    # Filter bits
    def fb26 : Bool
      @value.bits_set?(0x4000000_u32)
    end

    # Filter bits
    def self.fb26 : Bool
      value.fb26
    end

    # Filter bits
    def self.fb26=(value : Bool) : Bool
      self.set(fb26: value)
      value
    end

    # Filter bits
    def fb27 : Bool
      @value.bits_set?(0x8000000_u32)
    end

    # Filter bits
    def self.fb27 : Bool
      value.fb27
    end

    # Filter bits
    def self.fb27=(value : Bool) : Bool
      self.set(fb27: value)
      value
    end

    # Filter bits
    def fb28 : Bool
      @value.bits_set?(0x10000000_u32)
    end

    # Filter bits
    def self.fb28 : Bool
      value.fb28
    end

    # Filter bits
    def self.fb28=(value : Bool) : Bool
      self.set(fb28: value)
      value
    end

    # Filter bits
    def fb29 : Bool
      @value.bits_set?(0x20000000_u32)
    end

    # Filter bits
    def self.fb29 : Bool
      value.fb29
    end

    # Filter bits
    def self.fb29=(value : Bool) : Bool
      self.set(fb29: value)
      value
    end

    # Filter bits
    def fb30 : Bool
      @value.bits_set?(0x40000000_u32)
    end

    # Filter bits
    def self.fb30 : Bool
      value.fb30
    end

    # Filter bits
    def self.fb30=(value : Bool) : Bool
      self.set(fb30: value)
      value
    end

    # Filter bits
    def fb31 : Bool
      @value.bits_set?(0x80000000_u32)
    end

    # Filter bits
    def self.fb31 : Bool
      value.fb31
    end

    # Filter bits
    def self.fb31=(value : Bool) : Bool
      self.set(fb31: value)
      value
    end

    def copy_with(
      *,

      fb0 : Bool? = nil,

      fb1 : Bool? = nil,

      fb2 : Bool? = nil,

      fb3 : Bool? = nil,

      fb4 : Bool? = nil,

      fb5 : Bool? = nil,

      fb6 : Bool? = nil,

      fb7 : Bool? = nil,

      fb8 : Bool? = nil,

      fb9 : Bool? = nil,

      fb10 : Bool? = nil,

      fb11 : Bool? = nil,

      fb12 : Bool? = nil,

      fb13 : Bool? = nil,

      fb14 : Bool? = nil,

      fb15 : Bool? = nil,

      fb16 : Bool? = nil,

      fb17 : Bool? = nil,

      fb18 : Bool? = nil,

      fb19 : Bool? = nil,

      fb20 : Bool? = nil,

      fb21 : Bool? = nil,

      fb22 : Bool? = nil,

      fb23 : Bool? = nil,

      fb24 : Bool? = nil,

      fb25 : Bool? = nil,

      fb26 : Bool? = nil,

      fb27 : Bool? = nil,

      fb28 : Bool? = nil,

      fb29 : Bool? = nil,

      fb30 : Bool? = nil,

      fb31 : Bool? = nil
    ) : self
      value = @value

      unless fb0.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(fb0.to_int).&(0x1_u32) << 0
      end

      unless fb1.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(fb1.to_int).&(0x1_u32) << 1
      end

      unless fb2.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(fb2.to_int).&(0x1_u32) << 2
      end

      unless fb3.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(fb3.to_int).&(0x1_u32) << 3
      end

      unless fb4.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(fb4.to_int).&(0x1_u32) << 4
      end

      unless fb5.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(fb5.to_int).&(0x1_u32) << 5
      end

      unless fb6.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(fb6.to_int).&(0x1_u32) << 6
      end

      unless fb7.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(fb7.to_int).&(0x1_u32) << 7
      end

      unless fb8.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(fb8.to_int).&(0x1_u32) << 8
      end

      unless fb9.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(fb9.to_int).&(0x1_u32) << 9
      end

      unless fb10.nil?
        value = (value & 0xfffffbff_u32) |
                UInt32.new!(fb10.to_int).&(0x1_u32) << 10
      end

      unless fb11.nil?
        value = (value & 0xfffff7ff_u32) |
                UInt32.new!(fb11.to_int).&(0x1_u32) << 11
      end

      unless fb12.nil?
        value = (value & 0xffffefff_u32) |
                UInt32.new!(fb12.to_int).&(0x1_u32) << 12
      end

      unless fb13.nil?
        value = (value & 0xffffdfff_u32) |
                UInt32.new!(fb13.to_int).&(0x1_u32) << 13
      end

      unless fb14.nil?
        value = (value & 0xffffbfff_u32) |
                UInt32.new!(fb14.to_int).&(0x1_u32) << 14
      end

      unless fb15.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(fb15.to_int).&(0x1_u32) << 15
      end

      unless fb16.nil?
        value = (value & 0xfffeffff_u32) |
                UInt32.new!(fb16.to_int).&(0x1_u32) << 16
      end

      unless fb17.nil?
        value = (value & 0xfffdffff_u32) |
                UInt32.new!(fb17.to_int).&(0x1_u32) << 17
      end

      unless fb18.nil?
        value = (value & 0xfffbffff_u32) |
                UInt32.new!(fb18.to_int).&(0x1_u32) << 18
      end

      unless fb19.nil?
        value = (value & 0xfff7ffff_u32) |
                UInt32.new!(fb19.to_int).&(0x1_u32) << 19
      end

      unless fb20.nil?
        value = (value & 0xffefffff_u32) |
                UInt32.new!(fb20.to_int).&(0x1_u32) << 20
      end

      unless fb21.nil?
        value = (value & 0xffdfffff_u32) |
                UInt32.new!(fb21.to_int).&(0x1_u32) << 21
      end

      unless fb22.nil?
        value = (value & 0xffbfffff_u32) |
                UInt32.new!(fb22.to_int).&(0x1_u32) << 22
      end

      unless fb23.nil?
        value = (value & 0xff7fffff_u32) |
                UInt32.new!(fb23.to_int).&(0x1_u32) << 23
      end

      unless fb24.nil?
        value = (value & 0xfeffffff_u32) |
                UInt32.new!(fb24.to_int).&(0x1_u32) << 24
      end

      unless fb25.nil?
        value = (value & 0xfdffffff_u32) |
                UInt32.new!(fb25.to_int).&(0x1_u32) << 25
      end

      unless fb26.nil?
        value = (value & 0xfbffffff_u32) |
                UInt32.new!(fb26.to_int).&(0x1_u32) << 26
      end

      unless fb27.nil?
        value = (value & 0xf7ffffff_u32) |
                UInt32.new!(fb27.to_int).&(0x1_u32) << 27
      end

      unless fb28.nil?
        value = (value & 0xefffffff_u32) |
                UInt32.new!(fb28.to_int).&(0x1_u32) << 28
      end

      unless fb29.nil?
        value = (value & 0xdfffffff_u32) |
                UInt32.new!(fb29.to_int).&(0x1_u32) << 29
      end

      unless fb30.nil?
        value = (value & 0xbfffffff_u32) |
                UInt32.new!(fb30.to_int).&(0x1_u32) << 30
      end

      unless fb31.nil?
        value = (value & 0x7fffffff_u32) |
                UInt32.new!(fb31.to_int).&(0x1_u32) << 31
      end

      self.class.new(value)
    end

    def self.set(
      *,
      fb0 : Bool? = nil,
      fb1 : Bool? = nil,
      fb2 : Bool? = nil,
      fb3 : Bool? = nil,
      fb4 : Bool? = nil,
      fb5 : Bool? = nil,
      fb6 : Bool? = nil,
      fb7 : Bool? = nil,
      fb8 : Bool? = nil,
      fb9 : Bool? = nil,
      fb10 : Bool? = nil,
      fb11 : Bool? = nil,
      fb12 : Bool? = nil,
      fb13 : Bool? = nil,
      fb14 : Bool? = nil,
      fb15 : Bool? = nil,
      fb16 : Bool? = nil,
      fb17 : Bool? = nil,
      fb18 : Bool? = nil,
      fb19 : Bool? = nil,
      fb20 : Bool? = nil,
      fb21 : Bool? = nil,
      fb22 : Bool? = nil,
      fb23 : Bool? = nil,
      fb24 : Bool? = nil,
      fb25 : Bool? = nil,
      fb26 : Bool? = nil,
      fb27 : Bool? = nil,
      fb28 : Bool? = nil,
      fb29 : Bool? = nil,
      fb30 : Bool? = nil,
      fb31 : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        fb0: fb0,
        fb1: fb1,
        fb2: fb2,
        fb3: fb3,
        fb4: fb4,
        fb5: fb5,
        fb6: fb6,
        fb7: fb7,
        fb8: fb8,
        fb9: fb9,
        fb10: fb10,
        fb11: fb11,
        fb12: fb12,
        fb13: fb13,
        fb14: fb14,
        fb15: fb15,
        fb16: fb16,
        fb17: fb17,
        fb18: fb18,
        fb19: fb19,
        fb20: fb20,
        fb21: fb21,
        fb22: fb22,
        fb23: fb23,
        fb24: fb24,
        fb25: fb25,
        fb26: fb26,
        fb27: fb27,
        fb28: fb28,
        fb29: fb29,
        fb30: fb30,
        fb31: fb31,
      )
    end
  end # struct

  # Filter bank 4 register 1
  struct F4R1
    ADDRESS = BASE_ADDRESS + 0x260_u64

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

    # Filter bits
    def fb0 : Bool
      @value.bits_set?(0x1_u32)
    end

    # Filter bits
    def self.fb0 : Bool
      value.fb0
    end

    # Filter bits
    def self.fb0=(value : Bool) : Bool
      self.set(fb0: value)
      value
    end

    # Filter bits
    def fb1 : Bool
      @value.bits_set?(0x2_u32)
    end

    # Filter bits
    def self.fb1 : Bool
      value.fb1
    end

    # Filter bits
    def self.fb1=(value : Bool) : Bool
      self.set(fb1: value)
      value
    end

    # Filter bits
    def fb2 : Bool
      @value.bits_set?(0x4_u32)
    end

    # Filter bits
    def self.fb2 : Bool
      value.fb2
    end

    # Filter bits
    def self.fb2=(value : Bool) : Bool
      self.set(fb2: value)
      value
    end

    # Filter bits
    def fb3 : Bool
      @value.bits_set?(0x8_u32)
    end

    # Filter bits
    def self.fb3 : Bool
      value.fb3
    end

    # Filter bits
    def self.fb3=(value : Bool) : Bool
      self.set(fb3: value)
      value
    end

    # Filter bits
    def fb4 : Bool
      @value.bits_set?(0x10_u32)
    end

    # Filter bits
    def self.fb4 : Bool
      value.fb4
    end

    # Filter bits
    def self.fb4=(value : Bool) : Bool
      self.set(fb4: value)
      value
    end

    # Filter bits
    def fb5 : Bool
      @value.bits_set?(0x20_u32)
    end

    # Filter bits
    def self.fb5 : Bool
      value.fb5
    end

    # Filter bits
    def self.fb5=(value : Bool) : Bool
      self.set(fb5: value)
      value
    end

    # Filter bits
    def fb6 : Bool
      @value.bits_set?(0x40_u32)
    end

    # Filter bits
    def self.fb6 : Bool
      value.fb6
    end

    # Filter bits
    def self.fb6=(value : Bool) : Bool
      self.set(fb6: value)
      value
    end

    # Filter bits
    def fb7 : Bool
      @value.bits_set?(0x80_u32)
    end

    # Filter bits
    def self.fb7 : Bool
      value.fb7
    end

    # Filter bits
    def self.fb7=(value : Bool) : Bool
      self.set(fb7: value)
      value
    end

    # Filter bits
    def fb8 : Bool
      @value.bits_set?(0x100_u32)
    end

    # Filter bits
    def self.fb8 : Bool
      value.fb8
    end

    # Filter bits
    def self.fb8=(value : Bool) : Bool
      self.set(fb8: value)
      value
    end

    # Filter bits
    def fb9 : Bool
      @value.bits_set?(0x200_u32)
    end

    # Filter bits
    def self.fb9 : Bool
      value.fb9
    end

    # Filter bits
    def self.fb9=(value : Bool) : Bool
      self.set(fb9: value)
      value
    end

    # Filter bits
    def fb10 : Bool
      @value.bits_set?(0x400_u32)
    end

    # Filter bits
    def self.fb10 : Bool
      value.fb10
    end

    # Filter bits
    def self.fb10=(value : Bool) : Bool
      self.set(fb10: value)
      value
    end

    # Filter bits
    def fb11 : Bool
      @value.bits_set?(0x800_u32)
    end

    # Filter bits
    def self.fb11 : Bool
      value.fb11
    end

    # Filter bits
    def self.fb11=(value : Bool) : Bool
      self.set(fb11: value)
      value
    end

    # Filter bits
    def fb12 : Bool
      @value.bits_set?(0x1000_u32)
    end

    # Filter bits
    def self.fb12 : Bool
      value.fb12
    end

    # Filter bits
    def self.fb12=(value : Bool) : Bool
      self.set(fb12: value)
      value
    end

    # Filter bits
    def fb13 : Bool
      @value.bits_set?(0x2000_u32)
    end

    # Filter bits
    def self.fb13 : Bool
      value.fb13
    end

    # Filter bits
    def self.fb13=(value : Bool) : Bool
      self.set(fb13: value)
      value
    end

    # Filter bits
    def fb14 : Bool
      @value.bits_set?(0x4000_u32)
    end

    # Filter bits
    def self.fb14 : Bool
      value.fb14
    end

    # Filter bits
    def self.fb14=(value : Bool) : Bool
      self.set(fb14: value)
      value
    end

    # Filter bits
    def fb15 : Bool
      @value.bits_set?(0x8000_u32)
    end

    # Filter bits
    def self.fb15 : Bool
      value.fb15
    end

    # Filter bits
    def self.fb15=(value : Bool) : Bool
      self.set(fb15: value)
      value
    end

    # Filter bits
    def fb16 : Bool
      @value.bits_set?(0x10000_u32)
    end

    # Filter bits
    def self.fb16 : Bool
      value.fb16
    end

    # Filter bits
    def self.fb16=(value : Bool) : Bool
      self.set(fb16: value)
      value
    end

    # Filter bits
    def fb17 : Bool
      @value.bits_set?(0x20000_u32)
    end

    # Filter bits
    def self.fb17 : Bool
      value.fb17
    end

    # Filter bits
    def self.fb17=(value : Bool) : Bool
      self.set(fb17: value)
      value
    end

    # Filter bits
    def fb18 : Bool
      @value.bits_set?(0x40000_u32)
    end

    # Filter bits
    def self.fb18 : Bool
      value.fb18
    end

    # Filter bits
    def self.fb18=(value : Bool) : Bool
      self.set(fb18: value)
      value
    end

    # Filter bits
    def fb19 : Bool
      @value.bits_set?(0x80000_u32)
    end

    # Filter bits
    def self.fb19 : Bool
      value.fb19
    end

    # Filter bits
    def self.fb19=(value : Bool) : Bool
      self.set(fb19: value)
      value
    end

    # Filter bits
    def fb20 : Bool
      @value.bits_set?(0x100000_u32)
    end

    # Filter bits
    def self.fb20 : Bool
      value.fb20
    end

    # Filter bits
    def self.fb20=(value : Bool) : Bool
      self.set(fb20: value)
      value
    end

    # Filter bits
    def fb21 : Bool
      @value.bits_set?(0x200000_u32)
    end

    # Filter bits
    def self.fb21 : Bool
      value.fb21
    end

    # Filter bits
    def self.fb21=(value : Bool) : Bool
      self.set(fb21: value)
      value
    end

    # Filter bits
    def fb22 : Bool
      @value.bits_set?(0x400000_u32)
    end

    # Filter bits
    def self.fb22 : Bool
      value.fb22
    end

    # Filter bits
    def self.fb22=(value : Bool) : Bool
      self.set(fb22: value)
      value
    end

    # Filter bits
    def fb23 : Bool
      @value.bits_set?(0x800000_u32)
    end

    # Filter bits
    def self.fb23 : Bool
      value.fb23
    end

    # Filter bits
    def self.fb23=(value : Bool) : Bool
      self.set(fb23: value)
      value
    end

    # Filter bits
    def fb24 : Bool
      @value.bits_set?(0x1000000_u32)
    end

    # Filter bits
    def self.fb24 : Bool
      value.fb24
    end

    # Filter bits
    def self.fb24=(value : Bool) : Bool
      self.set(fb24: value)
      value
    end

    # Filter bits
    def fb25 : Bool
      @value.bits_set?(0x2000000_u32)
    end

    # Filter bits
    def self.fb25 : Bool
      value.fb25
    end

    # Filter bits
    def self.fb25=(value : Bool) : Bool
      self.set(fb25: value)
      value
    end

    # Filter bits
    def fb26 : Bool
      @value.bits_set?(0x4000000_u32)
    end

    # Filter bits
    def self.fb26 : Bool
      value.fb26
    end

    # Filter bits
    def self.fb26=(value : Bool) : Bool
      self.set(fb26: value)
      value
    end

    # Filter bits
    def fb27 : Bool
      @value.bits_set?(0x8000000_u32)
    end

    # Filter bits
    def self.fb27 : Bool
      value.fb27
    end

    # Filter bits
    def self.fb27=(value : Bool) : Bool
      self.set(fb27: value)
      value
    end

    # Filter bits
    def fb28 : Bool
      @value.bits_set?(0x10000000_u32)
    end

    # Filter bits
    def self.fb28 : Bool
      value.fb28
    end

    # Filter bits
    def self.fb28=(value : Bool) : Bool
      self.set(fb28: value)
      value
    end

    # Filter bits
    def fb29 : Bool
      @value.bits_set?(0x20000000_u32)
    end

    # Filter bits
    def self.fb29 : Bool
      value.fb29
    end

    # Filter bits
    def self.fb29=(value : Bool) : Bool
      self.set(fb29: value)
      value
    end

    # Filter bits
    def fb30 : Bool
      @value.bits_set?(0x40000000_u32)
    end

    # Filter bits
    def self.fb30 : Bool
      value.fb30
    end

    # Filter bits
    def self.fb30=(value : Bool) : Bool
      self.set(fb30: value)
      value
    end

    # Filter bits
    def fb31 : Bool
      @value.bits_set?(0x80000000_u32)
    end

    # Filter bits
    def self.fb31 : Bool
      value.fb31
    end

    # Filter bits
    def self.fb31=(value : Bool) : Bool
      self.set(fb31: value)
      value
    end

    def copy_with(
      *,

      fb0 : Bool? = nil,

      fb1 : Bool? = nil,

      fb2 : Bool? = nil,

      fb3 : Bool? = nil,

      fb4 : Bool? = nil,

      fb5 : Bool? = nil,

      fb6 : Bool? = nil,

      fb7 : Bool? = nil,

      fb8 : Bool? = nil,

      fb9 : Bool? = nil,

      fb10 : Bool? = nil,

      fb11 : Bool? = nil,

      fb12 : Bool? = nil,

      fb13 : Bool? = nil,

      fb14 : Bool? = nil,

      fb15 : Bool? = nil,

      fb16 : Bool? = nil,

      fb17 : Bool? = nil,

      fb18 : Bool? = nil,

      fb19 : Bool? = nil,

      fb20 : Bool? = nil,

      fb21 : Bool? = nil,

      fb22 : Bool? = nil,

      fb23 : Bool? = nil,

      fb24 : Bool? = nil,

      fb25 : Bool? = nil,

      fb26 : Bool? = nil,

      fb27 : Bool? = nil,

      fb28 : Bool? = nil,

      fb29 : Bool? = nil,

      fb30 : Bool? = nil,

      fb31 : Bool? = nil
    ) : self
      value = @value

      unless fb0.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(fb0.to_int).&(0x1_u32) << 0
      end

      unless fb1.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(fb1.to_int).&(0x1_u32) << 1
      end

      unless fb2.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(fb2.to_int).&(0x1_u32) << 2
      end

      unless fb3.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(fb3.to_int).&(0x1_u32) << 3
      end

      unless fb4.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(fb4.to_int).&(0x1_u32) << 4
      end

      unless fb5.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(fb5.to_int).&(0x1_u32) << 5
      end

      unless fb6.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(fb6.to_int).&(0x1_u32) << 6
      end

      unless fb7.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(fb7.to_int).&(0x1_u32) << 7
      end

      unless fb8.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(fb8.to_int).&(0x1_u32) << 8
      end

      unless fb9.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(fb9.to_int).&(0x1_u32) << 9
      end

      unless fb10.nil?
        value = (value & 0xfffffbff_u32) |
                UInt32.new!(fb10.to_int).&(0x1_u32) << 10
      end

      unless fb11.nil?
        value = (value & 0xfffff7ff_u32) |
                UInt32.new!(fb11.to_int).&(0x1_u32) << 11
      end

      unless fb12.nil?
        value = (value & 0xffffefff_u32) |
                UInt32.new!(fb12.to_int).&(0x1_u32) << 12
      end

      unless fb13.nil?
        value = (value & 0xffffdfff_u32) |
                UInt32.new!(fb13.to_int).&(0x1_u32) << 13
      end

      unless fb14.nil?
        value = (value & 0xffffbfff_u32) |
                UInt32.new!(fb14.to_int).&(0x1_u32) << 14
      end

      unless fb15.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(fb15.to_int).&(0x1_u32) << 15
      end

      unless fb16.nil?
        value = (value & 0xfffeffff_u32) |
                UInt32.new!(fb16.to_int).&(0x1_u32) << 16
      end

      unless fb17.nil?
        value = (value & 0xfffdffff_u32) |
                UInt32.new!(fb17.to_int).&(0x1_u32) << 17
      end

      unless fb18.nil?
        value = (value & 0xfffbffff_u32) |
                UInt32.new!(fb18.to_int).&(0x1_u32) << 18
      end

      unless fb19.nil?
        value = (value & 0xfff7ffff_u32) |
                UInt32.new!(fb19.to_int).&(0x1_u32) << 19
      end

      unless fb20.nil?
        value = (value & 0xffefffff_u32) |
                UInt32.new!(fb20.to_int).&(0x1_u32) << 20
      end

      unless fb21.nil?
        value = (value & 0xffdfffff_u32) |
                UInt32.new!(fb21.to_int).&(0x1_u32) << 21
      end

      unless fb22.nil?
        value = (value & 0xffbfffff_u32) |
                UInt32.new!(fb22.to_int).&(0x1_u32) << 22
      end

      unless fb23.nil?
        value = (value & 0xff7fffff_u32) |
                UInt32.new!(fb23.to_int).&(0x1_u32) << 23
      end

      unless fb24.nil?
        value = (value & 0xfeffffff_u32) |
                UInt32.new!(fb24.to_int).&(0x1_u32) << 24
      end

      unless fb25.nil?
        value = (value & 0xfdffffff_u32) |
                UInt32.new!(fb25.to_int).&(0x1_u32) << 25
      end

      unless fb26.nil?
        value = (value & 0xfbffffff_u32) |
                UInt32.new!(fb26.to_int).&(0x1_u32) << 26
      end

      unless fb27.nil?
        value = (value & 0xf7ffffff_u32) |
                UInt32.new!(fb27.to_int).&(0x1_u32) << 27
      end

      unless fb28.nil?
        value = (value & 0xefffffff_u32) |
                UInt32.new!(fb28.to_int).&(0x1_u32) << 28
      end

      unless fb29.nil?
        value = (value & 0xdfffffff_u32) |
                UInt32.new!(fb29.to_int).&(0x1_u32) << 29
      end

      unless fb30.nil?
        value = (value & 0xbfffffff_u32) |
                UInt32.new!(fb30.to_int).&(0x1_u32) << 30
      end

      unless fb31.nil?
        value = (value & 0x7fffffff_u32) |
                UInt32.new!(fb31.to_int).&(0x1_u32) << 31
      end

      self.class.new(value)
    end

    def self.set(
      *,
      fb0 : Bool? = nil,
      fb1 : Bool? = nil,
      fb2 : Bool? = nil,
      fb3 : Bool? = nil,
      fb4 : Bool? = nil,
      fb5 : Bool? = nil,
      fb6 : Bool? = nil,
      fb7 : Bool? = nil,
      fb8 : Bool? = nil,
      fb9 : Bool? = nil,
      fb10 : Bool? = nil,
      fb11 : Bool? = nil,
      fb12 : Bool? = nil,
      fb13 : Bool? = nil,
      fb14 : Bool? = nil,
      fb15 : Bool? = nil,
      fb16 : Bool? = nil,
      fb17 : Bool? = nil,
      fb18 : Bool? = nil,
      fb19 : Bool? = nil,
      fb20 : Bool? = nil,
      fb21 : Bool? = nil,
      fb22 : Bool? = nil,
      fb23 : Bool? = nil,
      fb24 : Bool? = nil,
      fb25 : Bool? = nil,
      fb26 : Bool? = nil,
      fb27 : Bool? = nil,
      fb28 : Bool? = nil,
      fb29 : Bool? = nil,
      fb30 : Bool? = nil,
      fb31 : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        fb0: fb0,
        fb1: fb1,
        fb2: fb2,
        fb3: fb3,
        fb4: fb4,
        fb5: fb5,
        fb6: fb6,
        fb7: fb7,
        fb8: fb8,
        fb9: fb9,
        fb10: fb10,
        fb11: fb11,
        fb12: fb12,
        fb13: fb13,
        fb14: fb14,
        fb15: fb15,
        fb16: fb16,
        fb17: fb17,
        fb18: fb18,
        fb19: fb19,
        fb20: fb20,
        fb21: fb21,
        fb22: fb22,
        fb23: fb23,
        fb24: fb24,
        fb25: fb25,
        fb26: fb26,
        fb27: fb27,
        fb28: fb28,
        fb29: fb29,
        fb30: fb30,
        fb31: fb31,
      )
    end
  end # struct

  # Filter bank 4 register 2
  struct F4R2
    ADDRESS = BASE_ADDRESS + 0x264_u64

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

    # Filter bits
    def fb0 : Bool
      @value.bits_set?(0x1_u32)
    end

    # Filter bits
    def self.fb0 : Bool
      value.fb0
    end

    # Filter bits
    def self.fb0=(value : Bool) : Bool
      self.set(fb0: value)
      value
    end

    # Filter bits
    def fb1 : Bool
      @value.bits_set?(0x2_u32)
    end

    # Filter bits
    def self.fb1 : Bool
      value.fb1
    end

    # Filter bits
    def self.fb1=(value : Bool) : Bool
      self.set(fb1: value)
      value
    end

    # Filter bits
    def fb2 : Bool
      @value.bits_set?(0x4_u32)
    end

    # Filter bits
    def self.fb2 : Bool
      value.fb2
    end

    # Filter bits
    def self.fb2=(value : Bool) : Bool
      self.set(fb2: value)
      value
    end

    # Filter bits
    def fb3 : Bool
      @value.bits_set?(0x8_u32)
    end

    # Filter bits
    def self.fb3 : Bool
      value.fb3
    end

    # Filter bits
    def self.fb3=(value : Bool) : Bool
      self.set(fb3: value)
      value
    end

    # Filter bits
    def fb4 : Bool
      @value.bits_set?(0x10_u32)
    end

    # Filter bits
    def self.fb4 : Bool
      value.fb4
    end

    # Filter bits
    def self.fb4=(value : Bool) : Bool
      self.set(fb4: value)
      value
    end

    # Filter bits
    def fb5 : Bool
      @value.bits_set?(0x20_u32)
    end

    # Filter bits
    def self.fb5 : Bool
      value.fb5
    end

    # Filter bits
    def self.fb5=(value : Bool) : Bool
      self.set(fb5: value)
      value
    end

    # Filter bits
    def fb6 : Bool
      @value.bits_set?(0x40_u32)
    end

    # Filter bits
    def self.fb6 : Bool
      value.fb6
    end

    # Filter bits
    def self.fb6=(value : Bool) : Bool
      self.set(fb6: value)
      value
    end

    # Filter bits
    def fb7 : Bool
      @value.bits_set?(0x80_u32)
    end

    # Filter bits
    def self.fb7 : Bool
      value.fb7
    end

    # Filter bits
    def self.fb7=(value : Bool) : Bool
      self.set(fb7: value)
      value
    end

    # Filter bits
    def fb8 : Bool
      @value.bits_set?(0x100_u32)
    end

    # Filter bits
    def self.fb8 : Bool
      value.fb8
    end

    # Filter bits
    def self.fb8=(value : Bool) : Bool
      self.set(fb8: value)
      value
    end

    # Filter bits
    def fb9 : Bool
      @value.bits_set?(0x200_u32)
    end

    # Filter bits
    def self.fb9 : Bool
      value.fb9
    end

    # Filter bits
    def self.fb9=(value : Bool) : Bool
      self.set(fb9: value)
      value
    end

    # Filter bits
    def fb10 : Bool
      @value.bits_set?(0x400_u32)
    end

    # Filter bits
    def self.fb10 : Bool
      value.fb10
    end

    # Filter bits
    def self.fb10=(value : Bool) : Bool
      self.set(fb10: value)
      value
    end

    # Filter bits
    def fb11 : Bool
      @value.bits_set?(0x800_u32)
    end

    # Filter bits
    def self.fb11 : Bool
      value.fb11
    end

    # Filter bits
    def self.fb11=(value : Bool) : Bool
      self.set(fb11: value)
      value
    end

    # Filter bits
    def fb12 : Bool
      @value.bits_set?(0x1000_u32)
    end

    # Filter bits
    def self.fb12 : Bool
      value.fb12
    end

    # Filter bits
    def self.fb12=(value : Bool) : Bool
      self.set(fb12: value)
      value
    end

    # Filter bits
    def fb13 : Bool
      @value.bits_set?(0x2000_u32)
    end

    # Filter bits
    def self.fb13 : Bool
      value.fb13
    end

    # Filter bits
    def self.fb13=(value : Bool) : Bool
      self.set(fb13: value)
      value
    end

    # Filter bits
    def fb14 : Bool
      @value.bits_set?(0x4000_u32)
    end

    # Filter bits
    def self.fb14 : Bool
      value.fb14
    end

    # Filter bits
    def self.fb14=(value : Bool) : Bool
      self.set(fb14: value)
      value
    end

    # Filter bits
    def fb15 : Bool
      @value.bits_set?(0x8000_u32)
    end

    # Filter bits
    def self.fb15 : Bool
      value.fb15
    end

    # Filter bits
    def self.fb15=(value : Bool) : Bool
      self.set(fb15: value)
      value
    end

    # Filter bits
    def fb16 : Bool
      @value.bits_set?(0x10000_u32)
    end

    # Filter bits
    def self.fb16 : Bool
      value.fb16
    end

    # Filter bits
    def self.fb16=(value : Bool) : Bool
      self.set(fb16: value)
      value
    end

    # Filter bits
    def fb17 : Bool
      @value.bits_set?(0x20000_u32)
    end

    # Filter bits
    def self.fb17 : Bool
      value.fb17
    end

    # Filter bits
    def self.fb17=(value : Bool) : Bool
      self.set(fb17: value)
      value
    end

    # Filter bits
    def fb18 : Bool
      @value.bits_set?(0x40000_u32)
    end

    # Filter bits
    def self.fb18 : Bool
      value.fb18
    end

    # Filter bits
    def self.fb18=(value : Bool) : Bool
      self.set(fb18: value)
      value
    end

    # Filter bits
    def fb19 : Bool
      @value.bits_set?(0x80000_u32)
    end

    # Filter bits
    def self.fb19 : Bool
      value.fb19
    end

    # Filter bits
    def self.fb19=(value : Bool) : Bool
      self.set(fb19: value)
      value
    end

    # Filter bits
    def fb20 : Bool
      @value.bits_set?(0x100000_u32)
    end

    # Filter bits
    def self.fb20 : Bool
      value.fb20
    end

    # Filter bits
    def self.fb20=(value : Bool) : Bool
      self.set(fb20: value)
      value
    end

    # Filter bits
    def fb21 : Bool
      @value.bits_set?(0x200000_u32)
    end

    # Filter bits
    def self.fb21 : Bool
      value.fb21
    end

    # Filter bits
    def self.fb21=(value : Bool) : Bool
      self.set(fb21: value)
      value
    end

    # Filter bits
    def fb22 : Bool
      @value.bits_set?(0x400000_u32)
    end

    # Filter bits
    def self.fb22 : Bool
      value.fb22
    end

    # Filter bits
    def self.fb22=(value : Bool) : Bool
      self.set(fb22: value)
      value
    end

    # Filter bits
    def fb23 : Bool
      @value.bits_set?(0x800000_u32)
    end

    # Filter bits
    def self.fb23 : Bool
      value.fb23
    end

    # Filter bits
    def self.fb23=(value : Bool) : Bool
      self.set(fb23: value)
      value
    end

    # Filter bits
    def fb24 : Bool
      @value.bits_set?(0x1000000_u32)
    end

    # Filter bits
    def self.fb24 : Bool
      value.fb24
    end

    # Filter bits
    def self.fb24=(value : Bool) : Bool
      self.set(fb24: value)
      value
    end

    # Filter bits
    def fb25 : Bool
      @value.bits_set?(0x2000000_u32)
    end

    # Filter bits
    def self.fb25 : Bool
      value.fb25
    end

    # Filter bits
    def self.fb25=(value : Bool) : Bool
      self.set(fb25: value)
      value
    end

    # Filter bits
    def fb26 : Bool
      @value.bits_set?(0x4000000_u32)
    end

    # Filter bits
    def self.fb26 : Bool
      value.fb26
    end

    # Filter bits
    def self.fb26=(value : Bool) : Bool
      self.set(fb26: value)
      value
    end

    # Filter bits
    def fb27 : Bool
      @value.bits_set?(0x8000000_u32)
    end

    # Filter bits
    def self.fb27 : Bool
      value.fb27
    end

    # Filter bits
    def self.fb27=(value : Bool) : Bool
      self.set(fb27: value)
      value
    end

    # Filter bits
    def fb28 : Bool
      @value.bits_set?(0x10000000_u32)
    end

    # Filter bits
    def self.fb28 : Bool
      value.fb28
    end

    # Filter bits
    def self.fb28=(value : Bool) : Bool
      self.set(fb28: value)
      value
    end

    # Filter bits
    def fb29 : Bool
      @value.bits_set?(0x20000000_u32)
    end

    # Filter bits
    def self.fb29 : Bool
      value.fb29
    end

    # Filter bits
    def self.fb29=(value : Bool) : Bool
      self.set(fb29: value)
      value
    end

    # Filter bits
    def fb30 : Bool
      @value.bits_set?(0x40000000_u32)
    end

    # Filter bits
    def self.fb30 : Bool
      value.fb30
    end

    # Filter bits
    def self.fb30=(value : Bool) : Bool
      self.set(fb30: value)
      value
    end

    # Filter bits
    def fb31 : Bool
      @value.bits_set?(0x80000000_u32)
    end

    # Filter bits
    def self.fb31 : Bool
      value.fb31
    end

    # Filter bits
    def self.fb31=(value : Bool) : Bool
      self.set(fb31: value)
      value
    end

    def copy_with(
      *,

      fb0 : Bool? = nil,

      fb1 : Bool? = nil,

      fb2 : Bool? = nil,

      fb3 : Bool? = nil,

      fb4 : Bool? = nil,

      fb5 : Bool? = nil,

      fb6 : Bool? = nil,

      fb7 : Bool? = nil,

      fb8 : Bool? = nil,

      fb9 : Bool? = nil,

      fb10 : Bool? = nil,

      fb11 : Bool? = nil,

      fb12 : Bool? = nil,

      fb13 : Bool? = nil,

      fb14 : Bool? = nil,

      fb15 : Bool? = nil,

      fb16 : Bool? = nil,

      fb17 : Bool? = nil,

      fb18 : Bool? = nil,

      fb19 : Bool? = nil,

      fb20 : Bool? = nil,

      fb21 : Bool? = nil,

      fb22 : Bool? = nil,

      fb23 : Bool? = nil,

      fb24 : Bool? = nil,

      fb25 : Bool? = nil,

      fb26 : Bool? = nil,

      fb27 : Bool? = nil,

      fb28 : Bool? = nil,

      fb29 : Bool? = nil,

      fb30 : Bool? = nil,

      fb31 : Bool? = nil
    ) : self
      value = @value

      unless fb0.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(fb0.to_int).&(0x1_u32) << 0
      end

      unless fb1.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(fb1.to_int).&(0x1_u32) << 1
      end

      unless fb2.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(fb2.to_int).&(0x1_u32) << 2
      end

      unless fb3.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(fb3.to_int).&(0x1_u32) << 3
      end

      unless fb4.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(fb4.to_int).&(0x1_u32) << 4
      end

      unless fb5.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(fb5.to_int).&(0x1_u32) << 5
      end

      unless fb6.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(fb6.to_int).&(0x1_u32) << 6
      end

      unless fb7.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(fb7.to_int).&(0x1_u32) << 7
      end

      unless fb8.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(fb8.to_int).&(0x1_u32) << 8
      end

      unless fb9.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(fb9.to_int).&(0x1_u32) << 9
      end

      unless fb10.nil?
        value = (value & 0xfffffbff_u32) |
                UInt32.new!(fb10.to_int).&(0x1_u32) << 10
      end

      unless fb11.nil?
        value = (value & 0xfffff7ff_u32) |
                UInt32.new!(fb11.to_int).&(0x1_u32) << 11
      end

      unless fb12.nil?
        value = (value & 0xffffefff_u32) |
                UInt32.new!(fb12.to_int).&(0x1_u32) << 12
      end

      unless fb13.nil?
        value = (value & 0xffffdfff_u32) |
                UInt32.new!(fb13.to_int).&(0x1_u32) << 13
      end

      unless fb14.nil?
        value = (value & 0xffffbfff_u32) |
                UInt32.new!(fb14.to_int).&(0x1_u32) << 14
      end

      unless fb15.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(fb15.to_int).&(0x1_u32) << 15
      end

      unless fb16.nil?
        value = (value & 0xfffeffff_u32) |
                UInt32.new!(fb16.to_int).&(0x1_u32) << 16
      end

      unless fb17.nil?
        value = (value & 0xfffdffff_u32) |
                UInt32.new!(fb17.to_int).&(0x1_u32) << 17
      end

      unless fb18.nil?
        value = (value & 0xfffbffff_u32) |
                UInt32.new!(fb18.to_int).&(0x1_u32) << 18
      end

      unless fb19.nil?
        value = (value & 0xfff7ffff_u32) |
                UInt32.new!(fb19.to_int).&(0x1_u32) << 19
      end

      unless fb20.nil?
        value = (value & 0xffefffff_u32) |
                UInt32.new!(fb20.to_int).&(0x1_u32) << 20
      end

      unless fb21.nil?
        value = (value & 0xffdfffff_u32) |
                UInt32.new!(fb21.to_int).&(0x1_u32) << 21
      end

      unless fb22.nil?
        value = (value & 0xffbfffff_u32) |
                UInt32.new!(fb22.to_int).&(0x1_u32) << 22
      end

      unless fb23.nil?
        value = (value & 0xff7fffff_u32) |
                UInt32.new!(fb23.to_int).&(0x1_u32) << 23
      end

      unless fb24.nil?
        value = (value & 0xfeffffff_u32) |
                UInt32.new!(fb24.to_int).&(0x1_u32) << 24
      end

      unless fb25.nil?
        value = (value & 0xfdffffff_u32) |
                UInt32.new!(fb25.to_int).&(0x1_u32) << 25
      end

      unless fb26.nil?
        value = (value & 0xfbffffff_u32) |
                UInt32.new!(fb26.to_int).&(0x1_u32) << 26
      end

      unless fb27.nil?
        value = (value & 0xf7ffffff_u32) |
                UInt32.new!(fb27.to_int).&(0x1_u32) << 27
      end

      unless fb28.nil?
        value = (value & 0xefffffff_u32) |
                UInt32.new!(fb28.to_int).&(0x1_u32) << 28
      end

      unless fb29.nil?
        value = (value & 0xdfffffff_u32) |
                UInt32.new!(fb29.to_int).&(0x1_u32) << 29
      end

      unless fb30.nil?
        value = (value & 0xbfffffff_u32) |
                UInt32.new!(fb30.to_int).&(0x1_u32) << 30
      end

      unless fb31.nil?
        value = (value & 0x7fffffff_u32) |
                UInt32.new!(fb31.to_int).&(0x1_u32) << 31
      end

      self.class.new(value)
    end

    def self.set(
      *,
      fb0 : Bool? = nil,
      fb1 : Bool? = nil,
      fb2 : Bool? = nil,
      fb3 : Bool? = nil,
      fb4 : Bool? = nil,
      fb5 : Bool? = nil,
      fb6 : Bool? = nil,
      fb7 : Bool? = nil,
      fb8 : Bool? = nil,
      fb9 : Bool? = nil,
      fb10 : Bool? = nil,
      fb11 : Bool? = nil,
      fb12 : Bool? = nil,
      fb13 : Bool? = nil,
      fb14 : Bool? = nil,
      fb15 : Bool? = nil,
      fb16 : Bool? = nil,
      fb17 : Bool? = nil,
      fb18 : Bool? = nil,
      fb19 : Bool? = nil,
      fb20 : Bool? = nil,
      fb21 : Bool? = nil,
      fb22 : Bool? = nil,
      fb23 : Bool? = nil,
      fb24 : Bool? = nil,
      fb25 : Bool? = nil,
      fb26 : Bool? = nil,
      fb27 : Bool? = nil,
      fb28 : Bool? = nil,
      fb29 : Bool? = nil,
      fb30 : Bool? = nil,
      fb31 : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        fb0: fb0,
        fb1: fb1,
        fb2: fb2,
        fb3: fb3,
        fb4: fb4,
        fb5: fb5,
        fb6: fb6,
        fb7: fb7,
        fb8: fb8,
        fb9: fb9,
        fb10: fb10,
        fb11: fb11,
        fb12: fb12,
        fb13: fb13,
        fb14: fb14,
        fb15: fb15,
        fb16: fb16,
        fb17: fb17,
        fb18: fb18,
        fb19: fb19,
        fb20: fb20,
        fb21: fb21,
        fb22: fb22,
        fb23: fb23,
        fb24: fb24,
        fb25: fb25,
        fb26: fb26,
        fb27: fb27,
        fb28: fb28,
        fb29: fb29,
        fb30: fb30,
        fb31: fb31,
      )
    end
  end # struct

  # Filter bank 5 register 1
  struct F5R1
    ADDRESS = BASE_ADDRESS + 0x268_u64

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

    # Filter bits
    def fb0 : Bool
      @value.bits_set?(0x1_u32)
    end

    # Filter bits
    def self.fb0 : Bool
      value.fb0
    end

    # Filter bits
    def self.fb0=(value : Bool) : Bool
      self.set(fb0: value)
      value
    end

    # Filter bits
    def fb1 : Bool
      @value.bits_set?(0x2_u32)
    end

    # Filter bits
    def self.fb1 : Bool
      value.fb1
    end

    # Filter bits
    def self.fb1=(value : Bool) : Bool
      self.set(fb1: value)
      value
    end

    # Filter bits
    def fb2 : Bool
      @value.bits_set?(0x4_u32)
    end

    # Filter bits
    def self.fb2 : Bool
      value.fb2
    end

    # Filter bits
    def self.fb2=(value : Bool) : Bool
      self.set(fb2: value)
      value
    end

    # Filter bits
    def fb3 : Bool
      @value.bits_set?(0x8_u32)
    end

    # Filter bits
    def self.fb3 : Bool
      value.fb3
    end

    # Filter bits
    def self.fb3=(value : Bool) : Bool
      self.set(fb3: value)
      value
    end

    # Filter bits
    def fb4 : Bool
      @value.bits_set?(0x10_u32)
    end

    # Filter bits
    def self.fb4 : Bool
      value.fb4
    end

    # Filter bits
    def self.fb4=(value : Bool) : Bool
      self.set(fb4: value)
      value
    end

    # Filter bits
    def fb5 : Bool
      @value.bits_set?(0x20_u32)
    end

    # Filter bits
    def self.fb5 : Bool
      value.fb5
    end

    # Filter bits
    def self.fb5=(value : Bool) : Bool
      self.set(fb5: value)
      value
    end

    # Filter bits
    def fb6 : Bool
      @value.bits_set?(0x40_u32)
    end

    # Filter bits
    def self.fb6 : Bool
      value.fb6
    end

    # Filter bits
    def self.fb6=(value : Bool) : Bool
      self.set(fb6: value)
      value
    end

    # Filter bits
    def fb7 : Bool
      @value.bits_set?(0x80_u32)
    end

    # Filter bits
    def self.fb7 : Bool
      value.fb7
    end

    # Filter bits
    def self.fb7=(value : Bool) : Bool
      self.set(fb7: value)
      value
    end

    # Filter bits
    def fb8 : Bool
      @value.bits_set?(0x100_u32)
    end

    # Filter bits
    def self.fb8 : Bool
      value.fb8
    end

    # Filter bits
    def self.fb8=(value : Bool) : Bool
      self.set(fb8: value)
      value
    end

    # Filter bits
    def fb9 : Bool
      @value.bits_set?(0x200_u32)
    end

    # Filter bits
    def self.fb9 : Bool
      value.fb9
    end

    # Filter bits
    def self.fb9=(value : Bool) : Bool
      self.set(fb9: value)
      value
    end

    # Filter bits
    def fb10 : Bool
      @value.bits_set?(0x400_u32)
    end

    # Filter bits
    def self.fb10 : Bool
      value.fb10
    end

    # Filter bits
    def self.fb10=(value : Bool) : Bool
      self.set(fb10: value)
      value
    end

    # Filter bits
    def fb11 : Bool
      @value.bits_set?(0x800_u32)
    end

    # Filter bits
    def self.fb11 : Bool
      value.fb11
    end

    # Filter bits
    def self.fb11=(value : Bool) : Bool
      self.set(fb11: value)
      value
    end

    # Filter bits
    def fb12 : Bool
      @value.bits_set?(0x1000_u32)
    end

    # Filter bits
    def self.fb12 : Bool
      value.fb12
    end

    # Filter bits
    def self.fb12=(value : Bool) : Bool
      self.set(fb12: value)
      value
    end

    # Filter bits
    def fb13 : Bool
      @value.bits_set?(0x2000_u32)
    end

    # Filter bits
    def self.fb13 : Bool
      value.fb13
    end

    # Filter bits
    def self.fb13=(value : Bool) : Bool
      self.set(fb13: value)
      value
    end

    # Filter bits
    def fb14 : Bool
      @value.bits_set?(0x4000_u32)
    end

    # Filter bits
    def self.fb14 : Bool
      value.fb14
    end

    # Filter bits
    def self.fb14=(value : Bool) : Bool
      self.set(fb14: value)
      value
    end

    # Filter bits
    def fb15 : Bool
      @value.bits_set?(0x8000_u32)
    end

    # Filter bits
    def self.fb15 : Bool
      value.fb15
    end

    # Filter bits
    def self.fb15=(value : Bool) : Bool
      self.set(fb15: value)
      value
    end

    # Filter bits
    def fb16 : Bool
      @value.bits_set?(0x10000_u32)
    end

    # Filter bits
    def self.fb16 : Bool
      value.fb16
    end

    # Filter bits
    def self.fb16=(value : Bool) : Bool
      self.set(fb16: value)
      value
    end

    # Filter bits
    def fb17 : Bool
      @value.bits_set?(0x20000_u32)
    end

    # Filter bits
    def self.fb17 : Bool
      value.fb17
    end

    # Filter bits
    def self.fb17=(value : Bool) : Bool
      self.set(fb17: value)
      value
    end

    # Filter bits
    def fb18 : Bool
      @value.bits_set?(0x40000_u32)
    end

    # Filter bits
    def self.fb18 : Bool
      value.fb18
    end

    # Filter bits
    def self.fb18=(value : Bool) : Bool
      self.set(fb18: value)
      value
    end

    # Filter bits
    def fb19 : Bool
      @value.bits_set?(0x80000_u32)
    end

    # Filter bits
    def self.fb19 : Bool
      value.fb19
    end

    # Filter bits
    def self.fb19=(value : Bool) : Bool
      self.set(fb19: value)
      value
    end

    # Filter bits
    def fb20 : Bool
      @value.bits_set?(0x100000_u32)
    end

    # Filter bits
    def self.fb20 : Bool
      value.fb20
    end

    # Filter bits
    def self.fb20=(value : Bool) : Bool
      self.set(fb20: value)
      value
    end

    # Filter bits
    def fb21 : Bool
      @value.bits_set?(0x200000_u32)
    end

    # Filter bits
    def self.fb21 : Bool
      value.fb21
    end

    # Filter bits
    def self.fb21=(value : Bool) : Bool
      self.set(fb21: value)
      value
    end

    # Filter bits
    def fb22 : Bool
      @value.bits_set?(0x400000_u32)
    end

    # Filter bits
    def self.fb22 : Bool
      value.fb22
    end

    # Filter bits
    def self.fb22=(value : Bool) : Bool
      self.set(fb22: value)
      value
    end

    # Filter bits
    def fb23 : Bool
      @value.bits_set?(0x800000_u32)
    end

    # Filter bits
    def self.fb23 : Bool
      value.fb23
    end

    # Filter bits
    def self.fb23=(value : Bool) : Bool
      self.set(fb23: value)
      value
    end

    # Filter bits
    def fb24 : Bool
      @value.bits_set?(0x1000000_u32)
    end

    # Filter bits
    def self.fb24 : Bool
      value.fb24
    end

    # Filter bits
    def self.fb24=(value : Bool) : Bool
      self.set(fb24: value)
      value
    end

    # Filter bits
    def fb25 : Bool
      @value.bits_set?(0x2000000_u32)
    end

    # Filter bits
    def self.fb25 : Bool
      value.fb25
    end

    # Filter bits
    def self.fb25=(value : Bool) : Bool
      self.set(fb25: value)
      value
    end

    # Filter bits
    def fb26 : Bool
      @value.bits_set?(0x4000000_u32)
    end

    # Filter bits
    def self.fb26 : Bool
      value.fb26
    end

    # Filter bits
    def self.fb26=(value : Bool) : Bool
      self.set(fb26: value)
      value
    end

    # Filter bits
    def fb27 : Bool
      @value.bits_set?(0x8000000_u32)
    end

    # Filter bits
    def self.fb27 : Bool
      value.fb27
    end

    # Filter bits
    def self.fb27=(value : Bool) : Bool
      self.set(fb27: value)
      value
    end

    # Filter bits
    def fb28 : Bool
      @value.bits_set?(0x10000000_u32)
    end

    # Filter bits
    def self.fb28 : Bool
      value.fb28
    end

    # Filter bits
    def self.fb28=(value : Bool) : Bool
      self.set(fb28: value)
      value
    end

    # Filter bits
    def fb29 : Bool
      @value.bits_set?(0x20000000_u32)
    end

    # Filter bits
    def self.fb29 : Bool
      value.fb29
    end

    # Filter bits
    def self.fb29=(value : Bool) : Bool
      self.set(fb29: value)
      value
    end

    # Filter bits
    def fb30 : Bool
      @value.bits_set?(0x40000000_u32)
    end

    # Filter bits
    def self.fb30 : Bool
      value.fb30
    end

    # Filter bits
    def self.fb30=(value : Bool) : Bool
      self.set(fb30: value)
      value
    end

    # Filter bits
    def fb31 : Bool
      @value.bits_set?(0x80000000_u32)
    end

    # Filter bits
    def self.fb31 : Bool
      value.fb31
    end

    # Filter bits
    def self.fb31=(value : Bool) : Bool
      self.set(fb31: value)
      value
    end

    def copy_with(
      *,

      fb0 : Bool? = nil,

      fb1 : Bool? = nil,

      fb2 : Bool? = nil,

      fb3 : Bool? = nil,

      fb4 : Bool? = nil,

      fb5 : Bool? = nil,

      fb6 : Bool? = nil,

      fb7 : Bool? = nil,

      fb8 : Bool? = nil,

      fb9 : Bool? = nil,

      fb10 : Bool? = nil,

      fb11 : Bool? = nil,

      fb12 : Bool? = nil,

      fb13 : Bool? = nil,

      fb14 : Bool? = nil,

      fb15 : Bool? = nil,

      fb16 : Bool? = nil,

      fb17 : Bool? = nil,

      fb18 : Bool? = nil,

      fb19 : Bool? = nil,

      fb20 : Bool? = nil,

      fb21 : Bool? = nil,

      fb22 : Bool? = nil,

      fb23 : Bool? = nil,

      fb24 : Bool? = nil,

      fb25 : Bool? = nil,

      fb26 : Bool? = nil,

      fb27 : Bool? = nil,

      fb28 : Bool? = nil,

      fb29 : Bool? = nil,

      fb30 : Bool? = nil,

      fb31 : Bool? = nil
    ) : self
      value = @value

      unless fb0.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(fb0.to_int).&(0x1_u32) << 0
      end

      unless fb1.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(fb1.to_int).&(0x1_u32) << 1
      end

      unless fb2.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(fb2.to_int).&(0x1_u32) << 2
      end

      unless fb3.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(fb3.to_int).&(0x1_u32) << 3
      end

      unless fb4.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(fb4.to_int).&(0x1_u32) << 4
      end

      unless fb5.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(fb5.to_int).&(0x1_u32) << 5
      end

      unless fb6.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(fb6.to_int).&(0x1_u32) << 6
      end

      unless fb7.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(fb7.to_int).&(0x1_u32) << 7
      end

      unless fb8.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(fb8.to_int).&(0x1_u32) << 8
      end

      unless fb9.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(fb9.to_int).&(0x1_u32) << 9
      end

      unless fb10.nil?
        value = (value & 0xfffffbff_u32) |
                UInt32.new!(fb10.to_int).&(0x1_u32) << 10
      end

      unless fb11.nil?
        value = (value & 0xfffff7ff_u32) |
                UInt32.new!(fb11.to_int).&(0x1_u32) << 11
      end

      unless fb12.nil?
        value = (value & 0xffffefff_u32) |
                UInt32.new!(fb12.to_int).&(0x1_u32) << 12
      end

      unless fb13.nil?
        value = (value & 0xffffdfff_u32) |
                UInt32.new!(fb13.to_int).&(0x1_u32) << 13
      end

      unless fb14.nil?
        value = (value & 0xffffbfff_u32) |
                UInt32.new!(fb14.to_int).&(0x1_u32) << 14
      end

      unless fb15.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(fb15.to_int).&(0x1_u32) << 15
      end

      unless fb16.nil?
        value = (value & 0xfffeffff_u32) |
                UInt32.new!(fb16.to_int).&(0x1_u32) << 16
      end

      unless fb17.nil?
        value = (value & 0xfffdffff_u32) |
                UInt32.new!(fb17.to_int).&(0x1_u32) << 17
      end

      unless fb18.nil?
        value = (value & 0xfffbffff_u32) |
                UInt32.new!(fb18.to_int).&(0x1_u32) << 18
      end

      unless fb19.nil?
        value = (value & 0xfff7ffff_u32) |
                UInt32.new!(fb19.to_int).&(0x1_u32) << 19
      end

      unless fb20.nil?
        value = (value & 0xffefffff_u32) |
                UInt32.new!(fb20.to_int).&(0x1_u32) << 20
      end

      unless fb21.nil?
        value = (value & 0xffdfffff_u32) |
                UInt32.new!(fb21.to_int).&(0x1_u32) << 21
      end

      unless fb22.nil?
        value = (value & 0xffbfffff_u32) |
                UInt32.new!(fb22.to_int).&(0x1_u32) << 22
      end

      unless fb23.nil?
        value = (value & 0xff7fffff_u32) |
                UInt32.new!(fb23.to_int).&(0x1_u32) << 23
      end

      unless fb24.nil?
        value = (value & 0xfeffffff_u32) |
                UInt32.new!(fb24.to_int).&(0x1_u32) << 24
      end

      unless fb25.nil?
        value = (value & 0xfdffffff_u32) |
                UInt32.new!(fb25.to_int).&(0x1_u32) << 25
      end

      unless fb26.nil?
        value = (value & 0xfbffffff_u32) |
                UInt32.new!(fb26.to_int).&(0x1_u32) << 26
      end

      unless fb27.nil?
        value = (value & 0xf7ffffff_u32) |
                UInt32.new!(fb27.to_int).&(0x1_u32) << 27
      end

      unless fb28.nil?
        value = (value & 0xefffffff_u32) |
                UInt32.new!(fb28.to_int).&(0x1_u32) << 28
      end

      unless fb29.nil?
        value = (value & 0xdfffffff_u32) |
                UInt32.new!(fb29.to_int).&(0x1_u32) << 29
      end

      unless fb30.nil?
        value = (value & 0xbfffffff_u32) |
                UInt32.new!(fb30.to_int).&(0x1_u32) << 30
      end

      unless fb31.nil?
        value = (value & 0x7fffffff_u32) |
                UInt32.new!(fb31.to_int).&(0x1_u32) << 31
      end

      self.class.new(value)
    end

    def self.set(
      *,
      fb0 : Bool? = nil,
      fb1 : Bool? = nil,
      fb2 : Bool? = nil,
      fb3 : Bool? = nil,
      fb4 : Bool? = nil,
      fb5 : Bool? = nil,
      fb6 : Bool? = nil,
      fb7 : Bool? = nil,
      fb8 : Bool? = nil,
      fb9 : Bool? = nil,
      fb10 : Bool? = nil,
      fb11 : Bool? = nil,
      fb12 : Bool? = nil,
      fb13 : Bool? = nil,
      fb14 : Bool? = nil,
      fb15 : Bool? = nil,
      fb16 : Bool? = nil,
      fb17 : Bool? = nil,
      fb18 : Bool? = nil,
      fb19 : Bool? = nil,
      fb20 : Bool? = nil,
      fb21 : Bool? = nil,
      fb22 : Bool? = nil,
      fb23 : Bool? = nil,
      fb24 : Bool? = nil,
      fb25 : Bool? = nil,
      fb26 : Bool? = nil,
      fb27 : Bool? = nil,
      fb28 : Bool? = nil,
      fb29 : Bool? = nil,
      fb30 : Bool? = nil,
      fb31 : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        fb0: fb0,
        fb1: fb1,
        fb2: fb2,
        fb3: fb3,
        fb4: fb4,
        fb5: fb5,
        fb6: fb6,
        fb7: fb7,
        fb8: fb8,
        fb9: fb9,
        fb10: fb10,
        fb11: fb11,
        fb12: fb12,
        fb13: fb13,
        fb14: fb14,
        fb15: fb15,
        fb16: fb16,
        fb17: fb17,
        fb18: fb18,
        fb19: fb19,
        fb20: fb20,
        fb21: fb21,
        fb22: fb22,
        fb23: fb23,
        fb24: fb24,
        fb25: fb25,
        fb26: fb26,
        fb27: fb27,
        fb28: fb28,
        fb29: fb29,
        fb30: fb30,
        fb31: fb31,
      )
    end
  end # struct

  # Filter bank 5 register 2
  struct F5R2
    ADDRESS = BASE_ADDRESS + 0x26c_u64

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

    # Filter bits
    def fb0 : Bool
      @value.bits_set?(0x1_u32)
    end

    # Filter bits
    def self.fb0 : Bool
      value.fb0
    end

    # Filter bits
    def self.fb0=(value : Bool) : Bool
      self.set(fb0: value)
      value
    end

    # Filter bits
    def fb1 : Bool
      @value.bits_set?(0x2_u32)
    end

    # Filter bits
    def self.fb1 : Bool
      value.fb1
    end

    # Filter bits
    def self.fb1=(value : Bool) : Bool
      self.set(fb1: value)
      value
    end

    # Filter bits
    def fb2 : Bool
      @value.bits_set?(0x4_u32)
    end

    # Filter bits
    def self.fb2 : Bool
      value.fb2
    end

    # Filter bits
    def self.fb2=(value : Bool) : Bool
      self.set(fb2: value)
      value
    end

    # Filter bits
    def fb3 : Bool
      @value.bits_set?(0x8_u32)
    end

    # Filter bits
    def self.fb3 : Bool
      value.fb3
    end

    # Filter bits
    def self.fb3=(value : Bool) : Bool
      self.set(fb3: value)
      value
    end

    # Filter bits
    def fb4 : Bool
      @value.bits_set?(0x10_u32)
    end

    # Filter bits
    def self.fb4 : Bool
      value.fb4
    end

    # Filter bits
    def self.fb4=(value : Bool) : Bool
      self.set(fb4: value)
      value
    end

    # Filter bits
    def fb5 : Bool
      @value.bits_set?(0x20_u32)
    end

    # Filter bits
    def self.fb5 : Bool
      value.fb5
    end

    # Filter bits
    def self.fb5=(value : Bool) : Bool
      self.set(fb5: value)
      value
    end

    # Filter bits
    def fb6 : Bool
      @value.bits_set?(0x40_u32)
    end

    # Filter bits
    def self.fb6 : Bool
      value.fb6
    end

    # Filter bits
    def self.fb6=(value : Bool) : Bool
      self.set(fb6: value)
      value
    end

    # Filter bits
    def fb7 : Bool
      @value.bits_set?(0x80_u32)
    end

    # Filter bits
    def self.fb7 : Bool
      value.fb7
    end

    # Filter bits
    def self.fb7=(value : Bool) : Bool
      self.set(fb7: value)
      value
    end

    # Filter bits
    def fb8 : Bool
      @value.bits_set?(0x100_u32)
    end

    # Filter bits
    def self.fb8 : Bool
      value.fb8
    end

    # Filter bits
    def self.fb8=(value : Bool) : Bool
      self.set(fb8: value)
      value
    end

    # Filter bits
    def fb9 : Bool
      @value.bits_set?(0x200_u32)
    end

    # Filter bits
    def self.fb9 : Bool
      value.fb9
    end

    # Filter bits
    def self.fb9=(value : Bool) : Bool
      self.set(fb9: value)
      value
    end

    # Filter bits
    def fb10 : Bool
      @value.bits_set?(0x400_u32)
    end

    # Filter bits
    def self.fb10 : Bool
      value.fb10
    end

    # Filter bits
    def self.fb10=(value : Bool) : Bool
      self.set(fb10: value)
      value
    end

    # Filter bits
    def fb11 : Bool
      @value.bits_set?(0x800_u32)
    end

    # Filter bits
    def self.fb11 : Bool
      value.fb11
    end

    # Filter bits
    def self.fb11=(value : Bool) : Bool
      self.set(fb11: value)
      value
    end

    # Filter bits
    def fb12 : Bool
      @value.bits_set?(0x1000_u32)
    end

    # Filter bits
    def self.fb12 : Bool
      value.fb12
    end

    # Filter bits
    def self.fb12=(value : Bool) : Bool
      self.set(fb12: value)
      value
    end

    # Filter bits
    def fb13 : Bool
      @value.bits_set?(0x2000_u32)
    end

    # Filter bits
    def self.fb13 : Bool
      value.fb13
    end

    # Filter bits
    def self.fb13=(value : Bool) : Bool
      self.set(fb13: value)
      value
    end

    # Filter bits
    def fb14 : Bool
      @value.bits_set?(0x4000_u32)
    end

    # Filter bits
    def self.fb14 : Bool
      value.fb14
    end

    # Filter bits
    def self.fb14=(value : Bool) : Bool
      self.set(fb14: value)
      value
    end

    # Filter bits
    def fb15 : Bool
      @value.bits_set?(0x8000_u32)
    end

    # Filter bits
    def self.fb15 : Bool
      value.fb15
    end

    # Filter bits
    def self.fb15=(value : Bool) : Bool
      self.set(fb15: value)
      value
    end

    # Filter bits
    def fb16 : Bool
      @value.bits_set?(0x10000_u32)
    end

    # Filter bits
    def self.fb16 : Bool
      value.fb16
    end

    # Filter bits
    def self.fb16=(value : Bool) : Bool
      self.set(fb16: value)
      value
    end

    # Filter bits
    def fb17 : Bool
      @value.bits_set?(0x20000_u32)
    end

    # Filter bits
    def self.fb17 : Bool
      value.fb17
    end

    # Filter bits
    def self.fb17=(value : Bool) : Bool
      self.set(fb17: value)
      value
    end

    # Filter bits
    def fb18 : Bool
      @value.bits_set?(0x40000_u32)
    end

    # Filter bits
    def self.fb18 : Bool
      value.fb18
    end

    # Filter bits
    def self.fb18=(value : Bool) : Bool
      self.set(fb18: value)
      value
    end

    # Filter bits
    def fb19 : Bool
      @value.bits_set?(0x80000_u32)
    end

    # Filter bits
    def self.fb19 : Bool
      value.fb19
    end

    # Filter bits
    def self.fb19=(value : Bool) : Bool
      self.set(fb19: value)
      value
    end

    # Filter bits
    def fb20 : Bool
      @value.bits_set?(0x100000_u32)
    end

    # Filter bits
    def self.fb20 : Bool
      value.fb20
    end

    # Filter bits
    def self.fb20=(value : Bool) : Bool
      self.set(fb20: value)
      value
    end

    # Filter bits
    def fb21 : Bool
      @value.bits_set?(0x200000_u32)
    end

    # Filter bits
    def self.fb21 : Bool
      value.fb21
    end

    # Filter bits
    def self.fb21=(value : Bool) : Bool
      self.set(fb21: value)
      value
    end

    # Filter bits
    def fb22 : Bool
      @value.bits_set?(0x400000_u32)
    end

    # Filter bits
    def self.fb22 : Bool
      value.fb22
    end

    # Filter bits
    def self.fb22=(value : Bool) : Bool
      self.set(fb22: value)
      value
    end

    # Filter bits
    def fb23 : Bool
      @value.bits_set?(0x800000_u32)
    end

    # Filter bits
    def self.fb23 : Bool
      value.fb23
    end

    # Filter bits
    def self.fb23=(value : Bool) : Bool
      self.set(fb23: value)
      value
    end

    # Filter bits
    def fb24 : Bool
      @value.bits_set?(0x1000000_u32)
    end

    # Filter bits
    def self.fb24 : Bool
      value.fb24
    end

    # Filter bits
    def self.fb24=(value : Bool) : Bool
      self.set(fb24: value)
      value
    end

    # Filter bits
    def fb25 : Bool
      @value.bits_set?(0x2000000_u32)
    end

    # Filter bits
    def self.fb25 : Bool
      value.fb25
    end

    # Filter bits
    def self.fb25=(value : Bool) : Bool
      self.set(fb25: value)
      value
    end

    # Filter bits
    def fb26 : Bool
      @value.bits_set?(0x4000000_u32)
    end

    # Filter bits
    def self.fb26 : Bool
      value.fb26
    end

    # Filter bits
    def self.fb26=(value : Bool) : Bool
      self.set(fb26: value)
      value
    end

    # Filter bits
    def fb27 : Bool
      @value.bits_set?(0x8000000_u32)
    end

    # Filter bits
    def self.fb27 : Bool
      value.fb27
    end

    # Filter bits
    def self.fb27=(value : Bool) : Bool
      self.set(fb27: value)
      value
    end

    # Filter bits
    def fb28 : Bool
      @value.bits_set?(0x10000000_u32)
    end

    # Filter bits
    def self.fb28 : Bool
      value.fb28
    end

    # Filter bits
    def self.fb28=(value : Bool) : Bool
      self.set(fb28: value)
      value
    end

    # Filter bits
    def fb29 : Bool
      @value.bits_set?(0x20000000_u32)
    end

    # Filter bits
    def self.fb29 : Bool
      value.fb29
    end

    # Filter bits
    def self.fb29=(value : Bool) : Bool
      self.set(fb29: value)
      value
    end

    # Filter bits
    def fb30 : Bool
      @value.bits_set?(0x40000000_u32)
    end

    # Filter bits
    def self.fb30 : Bool
      value.fb30
    end

    # Filter bits
    def self.fb30=(value : Bool) : Bool
      self.set(fb30: value)
      value
    end

    # Filter bits
    def fb31 : Bool
      @value.bits_set?(0x80000000_u32)
    end

    # Filter bits
    def self.fb31 : Bool
      value.fb31
    end

    # Filter bits
    def self.fb31=(value : Bool) : Bool
      self.set(fb31: value)
      value
    end

    def copy_with(
      *,

      fb0 : Bool? = nil,

      fb1 : Bool? = nil,

      fb2 : Bool? = nil,

      fb3 : Bool? = nil,

      fb4 : Bool? = nil,

      fb5 : Bool? = nil,

      fb6 : Bool? = nil,

      fb7 : Bool? = nil,

      fb8 : Bool? = nil,

      fb9 : Bool? = nil,

      fb10 : Bool? = nil,

      fb11 : Bool? = nil,

      fb12 : Bool? = nil,

      fb13 : Bool? = nil,

      fb14 : Bool? = nil,

      fb15 : Bool? = nil,

      fb16 : Bool? = nil,

      fb17 : Bool? = nil,

      fb18 : Bool? = nil,

      fb19 : Bool? = nil,

      fb20 : Bool? = nil,

      fb21 : Bool? = nil,

      fb22 : Bool? = nil,

      fb23 : Bool? = nil,

      fb24 : Bool? = nil,

      fb25 : Bool? = nil,

      fb26 : Bool? = nil,

      fb27 : Bool? = nil,

      fb28 : Bool? = nil,

      fb29 : Bool? = nil,

      fb30 : Bool? = nil,

      fb31 : Bool? = nil
    ) : self
      value = @value

      unless fb0.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(fb0.to_int).&(0x1_u32) << 0
      end

      unless fb1.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(fb1.to_int).&(0x1_u32) << 1
      end

      unless fb2.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(fb2.to_int).&(0x1_u32) << 2
      end

      unless fb3.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(fb3.to_int).&(0x1_u32) << 3
      end

      unless fb4.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(fb4.to_int).&(0x1_u32) << 4
      end

      unless fb5.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(fb5.to_int).&(0x1_u32) << 5
      end

      unless fb6.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(fb6.to_int).&(0x1_u32) << 6
      end

      unless fb7.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(fb7.to_int).&(0x1_u32) << 7
      end

      unless fb8.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(fb8.to_int).&(0x1_u32) << 8
      end

      unless fb9.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(fb9.to_int).&(0x1_u32) << 9
      end

      unless fb10.nil?
        value = (value & 0xfffffbff_u32) |
                UInt32.new!(fb10.to_int).&(0x1_u32) << 10
      end

      unless fb11.nil?
        value = (value & 0xfffff7ff_u32) |
                UInt32.new!(fb11.to_int).&(0x1_u32) << 11
      end

      unless fb12.nil?
        value = (value & 0xffffefff_u32) |
                UInt32.new!(fb12.to_int).&(0x1_u32) << 12
      end

      unless fb13.nil?
        value = (value & 0xffffdfff_u32) |
                UInt32.new!(fb13.to_int).&(0x1_u32) << 13
      end

      unless fb14.nil?
        value = (value & 0xffffbfff_u32) |
                UInt32.new!(fb14.to_int).&(0x1_u32) << 14
      end

      unless fb15.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(fb15.to_int).&(0x1_u32) << 15
      end

      unless fb16.nil?
        value = (value & 0xfffeffff_u32) |
                UInt32.new!(fb16.to_int).&(0x1_u32) << 16
      end

      unless fb17.nil?
        value = (value & 0xfffdffff_u32) |
                UInt32.new!(fb17.to_int).&(0x1_u32) << 17
      end

      unless fb18.nil?
        value = (value & 0xfffbffff_u32) |
                UInt32.new!(fb18.to_int).&(0x1_u32) << 18
      end

      unless fb19.nil?
        value = (value & 0xfff7ffff_u32) |
                UInt32.new!(fb19.to_int).&(0x1_u32) << 19
      end

      unless fb20.nil?
        value = (value & 0xffefffff_u32) |
                UInt32.new!(fb20.to_int).&(0x1_u32) << 20
      end

      unless fb21.nil?
        value = (value & 0xffdfffff_u32) |
                UInt32.new!(fb21.to_int).&(0x1_u32) << 21
      end

      unless fb22.nil?
        value = (value & 0xffbfffff_u32) |
                UInt32.new!(fb22.to_int).&(0x1_u32) << 22
      end

      unless fb23.nil?
        value = (value & 0xff7fffff_u32) |
                UInt32.new!(fb23.to_int).&(0x1_u32) << 23
      end

      unless fb24.nil?
        value = (value & 0xfeffffff_u32) |
                UInt32.new!(fb24.to_int).&(0x1_u32) << 24
      end

      unless fb25.nil?
        value = (value & 0xfdffffff_u32) |
                UInt32.new!(fb25.to_int).&(0x1_u32) << 25
      end

      unless fb26.nil?
        value = (value & 0xfbffffff_u32) |
                UInt32.new!(fb26.to_int).&(0x1_u32) << 26
      end

      unless fb27.nil?
        value = (value & 0xf7ffffff_u32) |
                UInt32.new!(fb27.to_int).&(0x1_u32) << 27
      end

      unless fb28.nil?
        value = (value & 0xefffffff_u32) |
                UInt32.new!(fb28.to_int).&(0x1_u32) << 28
      end

      unless fb29.nil?
        value = (value & 0xdfffffff_u32) |
                UInt32.new!(fb29.to_int).&(0x1_u32) << 29
      end

      unless fb30.nil?
        value = (value & 0xbfffffff_u32) |
                UInt32.new!(fb30.to_int).&(0x1_u32) << 30
      end

      unless fb31.nil?
        value = (value & 0x7fffffff_u32) |
                UInt32.new!(fb31.to_int).&(0x1_u32) << 31
      end

      self.class.new(value)
    end

    def self.set(
      *,
      fb0 : Bool? = nil,
      fb1 : Bool? = nil,
      fb2 : Bool? = nil,
      fb3 : Bool? = nil,
      fb4 : Bool? = nil,
      fb5 : Bool? = nil,
      fb6 : Bool? = nil,
      fb7 : Bool? = nil,
      fb8 : Bool? = nil,
      fb9 : Bool? = nil,
      fb10 : Bool? = nil,
      fb11 : Bool? = nil,
      fb12 : Bool? = nil,
      fb13 : Bool? = nil,
      fb14 : Bool? = nil,
      fb15 : Bool? = nil,
      fb16 : Bool? = nil,
      fb17 : Bool? = nil,
      fb18 : Bool? = nil,
      fb19 : Bool? = nil,
      fb20 : Bool? = nil,
      fb21 : Bool? = nil,
      fb22 : Bool? = nil,
      fb23 : Bool? = nil,
      fb24 : Bool? = nil,
      fb25 : Bool? = nil,
      fb26 : Bool? = nil,
      fb27 : Bool? = nil,
      fb28 : Bool? = nil,
      fb29 : Bool? = nil,
      fb30 : Bool? = nil,
      fb31 : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        fb0: fb0,
        fb1: fb1,
        fb2: fb2,
        fb3: fb3,
        fb4: fb4,
        fb5: fb5,
        fb6: fb6,
        fb7: fb7,
        fb8: fb8,
        fb9: fb9,
        fb10: fb10,
        fb11: fb11,
        fb12: fb12,
        fb13: fb13,
        fb14: fb14,
        fb15: fb15,
        fb16: fb16,
        fb17: fb17,
        fb18: fb18,
        fb19: fb19,
        fb20: fb20,
        fb21: fb21,
        fb22: fb22,
        fb23: fb23,
        fb24: fb24,
        fb25: fb25,
        fb26: fb26,
        fb27: fb27,
        fb28: fb28,
        fb29: fb29,
        fb30: fb30,
        fb31: fb31,
      )
    end
  end # struct

  # Filter bank 6 register 1
  struct F6R1
    ADDRESS = BASE_ADDRESS + 0x270_u64

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

    # Filter bits
    def fb0 : Bool
      @value.bits_set?(0x1_u32)
    end

    # Filter bits
    def self.fb0 : Bool
      value.fb0
    end

    # Filter bits
    def self.fb0=(value : Bool) : Bool
      self.set(fb0: value)
      value
    end

    # Filter bits
    def fb1 : Bool
      @value.bits_set?(0x2_u32)
    end

    # Filter bits
    def self.fb1 : Bool
      value.fb1
    end

    # Filter bits
    def self.fb1=(value : Bool) : Bool
      self.set(fb1: value)
      value
    end

    # Filter bits
    def fb2 : Bool
      @value.bits_set?(0x4_u32)
    end

    # Filter bits
    def self.fb2 : Bool
      value.fb2
    end

    # Filter bits
    def self.fb2=(value : Bool) : Bool
      self.set(fb2: value)
      value
    end

    # Filter bits
    def fb3 : Bool
      @value.bits_set?(0x8_u32)
    end

    # Filter bits
    def self.fb3 : Bool
      value.fb3
    end

    # Filter bits
    def self.fb3=(value : Bool) : Bool
      self.set(fb3: value)
      value
    end

    # Filter bits
    def fb4 : Bool
      @value.bits_set?(0x10_u32)
    end

    # Filter bits
    def self.fb4 : Bool
      value.fb4
    end

    # Filter bits
    def self.fb4=(value : Bool) : Bool
      self.set(fb4: value)
      value
    end

    # Filter bits
    def fb5 : Bool
      @value.bits_set?(0x20_u32)
    end

    # Filter bits
    def self.fb5 : Bool
      value.fb5
    end

    # Filter bits
    def self.fb5=(value : Bool) : Bool
      self.set(fb5: value)
      value
    end

    # Filter bits
    def fb6 : Bool
      @value.bits_set?(0x40_u32)
    end

    # Filter bits
    def self.fb6 : Bool
      value.fb6
    end

    # Filter bits
    def self.fb6=(value : Bool) : Bool
      self.set(fb6: value)
      value
    end

    # Filter bits
    def fb7 : Bool
      @value.bits_set?(0x80_u32)
    end

    # Filter bits
    def self.fb7 : Bool
      value.fb7
    end

    # Filter bits
    def self.fb7=(value : Bool) : Bool
      self.set(fb7: value)
      value
    end

    # Filter bits
    def fb8 : Bool
      @value.bits_set?(0x100_u32)
    end

    # Filter bits
    def self.fb8 : Bool
      value.fb8
    end

    # Filter bits
    def self.fb8=(value : Bool) : Bool
      self.set(fb8: value)
      value
    end

    # Filter bits
    def fb9 : Bool
      @value.bits_set?(0x200_u32)
    end

    # Filter bits
    def self.fb9 : Bool
      value.fb9
    end

    # Filter bits
    def self.fb9=(value : Bool) : Bool
      self.set(fb9: value)
      value
    end

    # Filter bits
    def fb10 : Bool
      @value.bits_set?(0x400_u32)
    end

    # Filter bits
    def self.fb10 : Bool
      value.fb10
    end

    # Filter bits
    def self.fb10=(value : Bool) : Bool
      self.set(fb10: value)
      value
    end

    # Filter bits
    def fb11 : Bool
      @value.bits_set?(0x800_u32)
    end

    # Filter bits
    def self.fb11 : Bool
      value.fb11
    end

    # Filter bits
    def self.fb11=(value : Bool) : Bool
      self.set(fb11: value)
      value
    end

    # Filter bits
    def fb12 : Bool
      @value.bits_set?(0x1000_u32)
    end

    # Filter bits
    def self.fb12 : Bool
      value.fb12
    end

    # Filter bits
    def self.fb12=(value : Bool) : Bool
      self.set(fb12: value)
      value
    end

    # Filter bits
    def fb13 : Bool
      @value.bits_set?(0x2000_u32)
    end

    # Filter bits
    def self.fb13 : Bool
      value.fb13
    end

    # Filter bits
    def self.fb13=(value : Bool) : Bool
      self.set(fb13: value)
      value
    end

    # Filter bits
    def fb14 : Bool
      @value.bits_set?(0x4000_u32)
    end

    # Filter bits
    def self.fb14 : Bool
      value.fb14
    end

    # Filter bits
    def self.fb14=(value : Bool) : Bool
      self.set(fb14: value)
      value
    end

    # Filter bits
    def fb15 : Bool
      @value.bits_set?(0x8000_u32)
    end

    # Filter bits
    def self.fb15 : Bool
      value.fb15
    end

    # Filter bits
    def self.fb15=(value : Bool) : Bool
      self.set(fb15: value)
      value
    end

    # Filter bits
    def fb16 : Bool
      @value.bits_set?(0x10000_u32)
    end

    # Filter bits
    def self.fb16 : Bool
      value.fb16
    end

    # Filter bits
    def self.fb16=(value : Bool) : Bool
      self.set(fb16: value)
      value
    end

    # Filter bits
    def fb17 : Bool
      @value.bits_set?(0x20000_u32)
    end

    # Filter bits
    def self.fb17 : Bool
      value.fb17
    end

    # Filter bits
    def self.fb17=(value : Bool) : Bool
      self.set(fb17: value)
      value
    end

    # Filter bits
    def fb18 : Bool
      @value.bits_set?(0x40000_u32)
    end

    # Filter bits
    def self.fb18 : Bool
      value.fb18
    end

    # Filter bits
    def self.fb18=(value : Bool) : Bool
      self.set(fb18: value)
      value
    end

    # Filter bits
    def fb19 : Bool
      @value.bits_set?(0x80000_u32)
    end

    # Filter bits
    def self.fb19 : Bool
      value.fb19
    end

    # Filter bits
    def self.fb19=(value : Bool) : Bool
      self.set(fb19: value)
      value
    end

    # Filter bits
    def fb20 : Bool
      @value.bits_set?(0x100000_u32)
    end

    # Filter bits
    def self.fb20 : Bool
      value.fb20
    end

    # Filter bits
    def self.fb20=(value : Bool) : Bool
      self.set(fb20: value)
      value
    end

    # Filter bits
    def fb21 : Bool
      @value.bits_set?(0x200000_u32)
    end

    # Filter bits
    def self.fb21 : Bool
      value.fb21
    end

    # Filter bits
    def self.fb21=(value : Bool) : Bool
      self.set(fb21: value)
      value
    end

    # Filter bits
    def fb22 : Bool
      @value.bits_set?(0x400000_u32)
    end

    # Filter bits
    def self.fb22 : Bool
      value.fb22
    end

    # Filter bits
    def self.fb22=(value : Bool) : Bool
      self.set(fb22: value)
      value
    end

    # Filter bits
    def fb23 : Bool
      @value.bits_set?(0x800000_u32)
    end

    # Filter bits
    def self.fb23 : Bool
      value.fb23
    end

    # Filter bits
    def self.fb23=(value : Bool) : Bool
      self.set(fb23: value)
      value
    end

    # Filter bits
    def fb24 : Bool
      @value.bits_set?(0x1000000_u32)
    end

    # Filter bits
    def self.fb24 : Bool
      value.fb24
    end

    # Filter bits
    def self.fb24=(value : Bool) : Bool
      self.set(fb24: value)
      value
    end

    # Filter bits
    def fb25 : Bool
      @value.bits_set?(0x2000000_u32)
    end

    # Filter bits
    def self.fb25 : Bool
      value.fb25
    end

    # Filter bits
    def self.fb25=(value : Bool) : Bool
      self.set(fb25: value)
      value
    end

    # Filter bits
    def fb26 : Bool
      @value.bits_set?(0x4000000_u32)
    end

    # Filter bits
    def self.fb26 : Bool
      value.fb26
    end

    # Filter bits
    def self.fb26=(value : Bool) : Bool
      self.set(fb26: value)
      value
    end

    # Filter bits
    def fb27 : Bool
      @value.bits_set?(0x8000000_u32)
    end

    # Filter bits
    def self.fb27 : Bool
      value.fb27
    end

    # Filter bits
    def self.fb27=(value : Bool) : Bool
      self.set(fb27: value)
      value
    end

    # Filter bits
    def fb28 : Bool
      @value.bits_set?(0x10000000_u32)
    end

    # Filter bits
    def self.fb28 : Bool
      value.fb28
    end

    # Filter bits
    def self.fb28=(value : Bool) : Bool
      self.set(fb28: value)
      value
    end

    # Filter bits
    def fb29 : Bool
      @value.bits_set?(0x20000000_u32)
    end

    # Filter bits
    def self.fb29 : Bool
      value.fb29
    end

    # Filter bits
    def self.fb29=(value : Bool) : Bool
      self.set(fb29: value)
      value
    end

    # Filter bits
    def fb30 : Bool
      @value.bits_set?(0x40000000_u32)
    end

    # Filter bits
    def self.fb30 : Bool
      value.fb30
    end

    # Filter bits
    def self.fb30=(value : Bool) : Bool
      self.set(fb30: value)
      value
    end

    # Filter bits
    def fb31 : Bool
      @value.bits_set?(0x80000000_u32)
    end

    # Filter bits
    def self.fb31 : Bool
      value.fb31
    end

    # Filter bits
    def self.fb31=(value : Bool) : Bool
      self.set(fb31: value)
      value
    end

    def copy_with(
      *,

      fb0 : Bool? = nil,

      fb1 : Bool? = nil,

      fb2 : Bool? = nil,

      fb3 : Bool? = nil,

      fb4 : Bool? = nil,

      fb5 : Bool? = nil,

      fb6 : Bool? = nil,

      fb7 : Bool? = nil,

      fb8 : Bool? = nil,

      fb9 : Bool? = nil,

      fb10 : Bool? = nil,

      fb11 : Bool? = nil,

      fb12 : Bool? = nil,

      fb13 : Bool? = nil,

      fb14 : Bool? = nil,

      fb15 : Bool? = nil,

      fb16 : Bool? = nil,

      fb17 : Bool? = nil,

      fb18 : Bool? = nil,

      fb19 : Bool? = nil,

      fb20 : Bool? = nil,

      fb21 : Bool? = nil,

      fb22 : Bool? = nil,

      fb23 : Bool? = nil,

      fb24 : Bool? = nil,

      fb25 : Bool? = nil,

      fb26 : Bool? = nil,

      fb27 : Bool? = nil,

      fb28 : Bool? = nil,

      fb29 : Bool? = nil,

      fb30 : Bool? = nil,

      fb31 : Bool? = nil
    ) : self
      value = @value

      unless fb0.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(fb0.to_int).&(0x1_u32) << 0
      end

      unless fb1.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(fb1.to_int).&(0x1_u32) << 1
      end

      unless fb2.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(fb2.to_int).&(0x1_u32) << 2
      end

      unless fb3.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(fb3.to_int).&(0x1_u32) << 3
      end

      unless fb4.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(fb4.to_int).&(0x1_u32) << 4
      end

      unless fb5.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(fb5.to_int).&(0x1_u32) << 5
      end

      unless fb6.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(fb6.to_int).&(0x1_u32) << 6
      end

      unless fb7.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(fb7.to_int).&(0x1_u32) << 7
      end

      unless fb8.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(fb8.to_int).&(0x1_u32) << 8
      end

      unless fb9.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(fb9.to_int).&(0x1_u32) << 9
      end

      unless fb10.nil?
        value = (value & 0xfffffbff_u32) |
                UInt32.new!(fb10.to_int).&(0x1_u32) << 10
      end

      unless fb11.nil?
        value = (value & 0xfffff7ff_u32) |
                UInt32.new!(fb11.to_int).&(0x1_u32) << 11
      end

      unless fb12.nil?
        value = (value & 0xffffefff_u32) |
                UInt32.new!(fb12.to_int).&(0x1_u32) << 12
      end

      unless fb13.nil?
        value = (value & 0xffffdfff_u32) |
                UInt32.new!(fb13.to_int).&(0x1_u32) << 13
      end

      unless fb14.nil?
        value = (value & 0xffffbfff_u32) |
                UInt32.new!(fb14.to_int).&(0x1_u32) << 14
      end

      unless fb15.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(fb15.to_int).&(0x1_u32) << 15
      end

      unless fb16.nil?
        value = (value & 0xfffeffff_u32) |
                UInt32.new!(fb16.to_int).&(0x1_u32) << 16
      end

      unless fb17.nil?
        value = (value & 0xfffdffff_u32) |
                UInt32.new!(fb17.to_int).&(0x1_u32) << 17
      end

      unless fb18.nil?
        value = (value & 0xfffbffff_u32) |
                UInt32.new!(fb18.to_int).&(0x1_u32) << 18
      end

      unless fb19.nil?
        value = (value & 0xfff7ffff_u32) |
                UInt32.new!(fb19.to_int).&(0x1_u32) << 19
      end

      unless fb20.nil?
        value = (value & 0xffefffff_u32) |
                UInt32.new!(fb20.to_int).&(0x1_u32) << 20
      end

      unless fb21.nil?
        value = (value & 0xffdfffff_u32) |
                UInt32.new!(fb21.to_int).&(0x1_u32) << 21
      end

      unless fb22.nil?
        value = (value & 0xffbfffff_u32) |
                UInt32.new!(fb22.to_int).&(0x1_u32) << 22
      end

      unless fb23.nil?
        value = (value & 0xff7fffff_u32) |
                UInt32.new!(fb23.to_int).&(0x1_u32) << 23
      end

      unless fb24.nil?
        value = (value & 0xfeffffff_u32) |
                UInt32.new!(fb24.to_int).&(0x1_u32) << 24
      end

      unless fb25.nil?
        value = (value & 0xfdffffff_u32) |
                UInt32.new!(fb25.to_int).&(0x1_u32) << 25
      end

      unless fb26.nil?
        value = (value & 0xfbffffff_u32) |
                UInt32.new!(fb26.to_int).&(0x1_u32) << 26
      end

      unless fb27.nil?
        value = (value & 0xf7ffffff_u32) |
                UInt32.new!(fb27.to_int).&(0x1_u32) << 27
      end

      unless fb28.nil?
        value = (value & 0xefffffff_u32) |
                UInt32.new!(fb28.to_int).&(0x1_u32) << 28
      end

      unless fb29.nil?
        value = (value & 0xdfffffff_u32) |
                UInt32.new!(fb29.to_int).&(0x1_u32) << 29
      end

      unless fb30.nil?
        value = (value & 0xbfffffff_u32) |
                UInt32.new!(fb30.to_int).&(0x1_u32) << 30
      end

      unless fb31.nil?
        value = (value & 0x7fffffff_u32) |
                UInt32.new!(fb31.to_int).&(0x1_u32) << 31
      end

      self.class.new(value)
    end

    def self.set(
      *,
      fb0 : Bool? = nil,
      fb1 : Bool? = nil,
      fb2 : Bool? = nil,
      fb3 : Bool? = nil,
      fb4 : Bool? = nil,
      fb5 : Bool? = nil,
      fb6 : Bool? = nil,
      fb7 : Bool? = nil,
      fb8 : Bool? = nil,
      fb9 : Bool? = nil,
      fb10 : Bool? = nil,
      fb11 : Bool? = nil,
      fb12 : Bool? = nil,
      fb13 : Bool? = nil,
      fb14 : Bool? = nil,
      fb15 : Bool? = nil,
      fb16 : Bool? = nil,
      fb17 : Bool? = nil,
      fb18 : Bool? = nil,
      fb19 : Bool? = nil,
      fb20 : Bool? = nil,
      fb21 : Bool? = nil,
      fb22 : Bool? = nil,
      fb23 : Bool? = nil,
      fb24 : Bool? = nil,
      fb25 : Bool? = nil,
      fb26 : Bool? = nil,
      fb27 : Bool? = nil,
      fb28 : Bool? = nil,
      fb29 : Bool? = nil,
      fb30 : Bool? = nil,
      fb31 : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        fb0: fb0,
        fb1: fb1,
        fb2: fb2,
        fb3: fb3,
        fb4: fb4,
        fb5: fb5,
        fb6: fb6,
        fb7: fb7,
        fb8: fb8,
        fb9: fb9,
        fb10: fb10,
        fb11: fb11,
        fb12: fb12,
        fb13: fb13,
        fb14: fb14,
        fb15: fb15,
        fb16: fb16,
        fb17: fb17,
        fb18: fb18,
        fb19: fb19,
        fb20: fb20,
        fb21: fb21,
        fb22: fb22,
        fb23: fb23,
        fb24: fb24,
        fb25: fb25,
        fb26: fb26,
        fb27: fb27,
        fb28: fb28,
        fb29: fb29,
        fb30: fb30,
        fb31: fb31,
      )
    end
  end # struct

  # Filter bank 6 register 2
  struct F6R2
    ADDRESS = BASE_ADDRESS + 0x274_u64

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

    # Filter bits
    def fb0 : Bool
      @value.bits_set?(0x1_u32)
    end

    # Filter bits
    def self.fb0 : Bool
      value.fb0
    end

    # Filter bits
    def self.fb0=(value : Bool) : Bool
      self.set(fb0: value)
      value
    end

    # Filter bits
    def fb1 : Bool
      @value.bits_set?(0x2_u32)
    end

    # Filter bits
    def self.fb1 : Bool
      value.fb1
    end

    # Filter bits
    def self.fb1=(value : Bool) : Bool
      self.set(fb1: value)
      value
    end

    # Filter bits
    def fb2 : Bool
      @value.bits_set?(0x4_u32)
    end

    # Filter bits
    def self.fb2 : Bool
      value.fb2
    end

    # Filter bits
    def self.fb2=(value : Bool) : Bool
      self.set(fb2: value)
      value
    end

    # Filter bits
    def fb3 : Bool
      @value.bits_set?(0x8_u32)
    end

    # Filter bits
    def self.fb3 : Bool
      value.fb3
    end

    # Filter bits
    def self.fb3=(value : Bool) : Bool
      self.set(fb3: value)
      value
    end

    # Filter bits
    def fb4 : Bool
      @value.bits_set?(0x10_u32)
    end

    # Filter bits
    def self.fb4 : Bool
      value.fb4
    end

    # Filter bits
    def self.fb4=(value : Bool) : Bool
      self.set(fb4: value)
      value
    end

    # Filter bits
    def fb5 : Bool
      @value.bits_set?(0x20_u32)
    end

    # Filter bits
    def self.fb5 : Bool
      value.fb5
    end

    # Filter bits
    def self.fb5=(value : Bool) : Bool
      self.set(fb5: value)
      value
    end

    # Filter bits
    def fb6 : Bool
      @value.bits_set?(0x40_u32)
    end

    # Filter bits
    def self.fb6 : Bool
      value.fb6
    end

    # Filter bits
    def self.fb6=(value : Bool) : Bool
      self.set(fb6: value)
      value
    end

    # Filter bits
    def fb7 : Bool
      @value.bits_set?(0x80_u32)
    end

    # Filter bits
    def self.fb7 : Bool
      value.fb7
    end

    # Filter bits
    def self.fb7=(value : Bool) : Bool
      self.set(fb7: value)
      value
    end

    # Filter bits
    def fb8 : Bool
      @value.bits_set?(0x100_u32)
    end

    # Filter bits
    def self.fb8 : Bool
      value.fb8
    end

    # Filter bits
    def self.fb8=(value : Bool) : Bool
      self.set(fb8: value)
      value
    end

    # Filter bits
    def fb9 : Bool
      @value.bits_set?(0x200_u32)
    end

    # Filter bits
    def self.fb9 : Bool
      value.fb9
    end

    # Filter bits
    def self.fb9=(value : Bool) : Bool
      self.set(fb9: value)
      value
    end

    # Filter bits
    def fb10 : Bool
      @value.bits_set?(0x400_u32)
    end

    # Filter bits
    def self.fb10 : Bool
      value.fb10
    end

    # Filter bits
    def self.fb10=(value : Bool) : Bool
      self.set(fb10: value)
      value
    end

    # Filter bits
    def fb11 : Bool
      @value.bits_set?(0x800_u32)
    end

    # Filter bits
    def self.fb11 : Bool
      value.fb11
    end

    # Filter bits
    def self.fb11=(value : Bool) : Bool
      self.set(fb11: value)
      value
    end

    # Filter bits
    def fb12 : Bool
      @value.bits_set?(0x1000_u32)
    end

    # Filter bits
    def self.fb12 : Bool
      value.fb12
    end

    # Filter bits
    def self.fb12=(value : Bool) : Bool
      self.set(fb12: value)
      value
    end

    # Filter bits
    def fb13 : Bool
      @value.bits_set?(0x2000_u32)
    end

    # Filter bits
    def self.fb13 : Bool
      value.fb13
    end

    # Filter bits
    def self.fb13=(value : Bool) : Bool
      self.set(fb13: value)
      value
    end

    # Filter bits
    def fb14 : Bool
      @value.bits_set?(0x4000_u32)
    end

    # Filter bits
    def self.fb14 : Bool
      value.fb14
    end

    # Filter bits
    def self.fb14=(value : Bool) : Bool
      self.set(fb14: value)
      value
    end

    # Filter bits
    def fb15 : Bool
      @value.bits_set?(0x8000_u32)
    end

    # Filter bits
    def self.fb15 : Bool
      value.fb15
    end

    # Filter bits
    def self.fb15=(value : Bool) : Bool
      self.set(fb15: value)
      value
    end

    # Filter bits
    def fb16 : Bool
      @value.bits_set?(0x10000_u32)
    end

    # Filter bits
    def self.fb16 : Bool
      value.fb16
    end

    # Filter bits
    def self.fb16=(value : Bool) : Bool
      self.set(fb16: value)
      value
    end

    # Filter bits
    def fb17 : Bool
      @value.bits_set?(0x20000_u32)
    end

    # Filter bits
    def self.fb17 : Bool
      value.fb17
    end

    # Filter bits
    def self.fb17=(value : Bool) : Bool
      self.set(fb17: value)
      value
    end

    # Filter bits
    def fb18 : Bool
      @value.bits_set?(0x40000_u32)
    end

    # Filter bits
    def self.fb18 : Bool
      value.fb18
    end

    # Filter bits
    def self.fb18=(value : Bool) : Bool
      self.set(fb18: value)
      value
    end

    # Filter bits
    def fb19 : Bool
      @value.bits_set?(0x80000_u32)
    end

    # Filter bits
    def self.fb19 : Bool
      value.fb19
    end

    # Filter bits
    def self.fb19=(value : Bool) : Bool
      self.set(fb19: value)
      value
    end

    # Filter bits
    def fb20 : Bool
      @value.bits_set?(0x100000_u32)
    end

    # Filter bits
    def self.fb20 : Bool
      value.fb20
    end

    # Filter bits
    def self.fb20=(value : Bool) : Bool
      self.set(fb20: value)
      value
    end

    # Filter bits
    def fb21 : Bool
      @value.bits_set?(0x200000_u32)
    end

    # Filter bits
    def self.fb21 : Bool
      value.fb21
    end

    # Filter bits
    def self.fb21=(value : Bool) : Bool
      self.set(fb21: value)
      value
    end

    # Filter bits
    def fb22 : Bool
      @value.bits_set?(0x400000_u32)
    end

    # Filter bits
    def self.fb22 : Bool
      value.fb22
    end

    # Filter bits
    def self.fb22=(value : Bool) : Bool
      self.set(fb22: value)
      value
    end

    # Filter bits
    def fb23 : Bool
      @value.bits_set?(0x800000_u32)
    end

    # Filter bits
    def self.fb23 : Bool
      value.fb23
    end

    # Filter bits
    def self.fb23=(value : Bool) : Bool
      self.set(fb23: value)
      value
    end

    # Filter bits
    def fb24 : Bool
      @value.bits_set?(0x1000000_u32)
    end

    # Filter bits
    def self.fb24 : Bool
      value.fb24
    end

    # Filter bits
    def self.fb24=(value : Bool) : Bool
      self.set(fb24: value)
      value
    end

    # Filter bits
    def fb25 : Bool
      @value.bits_set?(0x2000000_u32)
    end

    # Filter bits
    def self.fb25 : Bool
      value.fb25
    end

    # Filter bits
    def self.fb25=(value : Bool) : Bool
      self.set(fb25: value)
      value
    end

    # Filter bits
    def fb26 : Bool
      @value.bits_set?(0x4000000_u32)
    end

    # Filter bits
    def self.fb26 : Bool
      value.fb26
    end

    # Filter bits
    def self.fb26=(value : Bool) : Bool
      self.set(fb26: value)
      value
    end

    # Filter bits
    def fb27 : Bool
      @value.bits_set?(0x8000000_u32)
    end

    # Filter bits
    def self.fb27 : Bool
      value.fb27
    end

    # Filter bits
    def self.fb27=(value : Bool) : Bool
      self.set(fb27: value)
      value
    end

    # Filter bits
    def fb28 : Bool
      @value.bits_set?(0x10000000_u32)
    end

    # Filter bits
    def self.fb28 : Bool
      value.fb28
    end

    # Filter bits
    def self.fb28=(value : Bool) : Bool
      self.set(fb28: value)
      value
    end

    # Filter bits
    def fb29 : Bool
      @value.bits_set?(0x20000000_u32)
    end

    # Filter bits
    def self.fb29 : Bool
      value.fb29
    end

    # Filter bits
    def self.fb29=(value : Bool) : Bool
      self.set(fb29: value)
      value
    end

    # Filter bits
    def fb30 : Bool
      @value.bits_set?(0x40000000_u32)
    end

    # Filter bits
    def self.fb30 : Bool
      value.fb30
    end

    # Filter bits
    def self.fb30=(value : Bool) : Bool
      self.set(fb30: value)
      value
    end

    # Filter bits
    def fb31 : Bool
      @value.bits_set?(0x80000000_u32)
    end

    # Filter bits
    def self.fb31 : Bool
      value.fb31
    end

    # Filter bits
    def self.fb31=(value : Bool) : Bool
      self.set(fb31: value)
      value
    end

    def copy_with(
      *,

      fb0 : Bool? = nil,

      fb1 : Bool? = nil,

      fb2 : Bool? = nil,

      fb3 : Bool? = nil,

      fb4 : Bool? = nil,

      fb5 : Bool? = nil,

      fb6 : Bool? = nil,

      fb7 : Bool? = nil,

      fb8 : Bool? = nil,

      fb9 : Bool? = nil,

      fb10 : Bool? = nil,

      fb11 : Bool? = nil,

      fb12 : Bool? = nil,

      fb13 : Bool? = nil,

      fb14 : Bool? = nil,

      fb15 : Bool? = nil,

      fb16 : Bool? = nil,

      fb17 : Bool? = nil,

      fb18 : Bool? = nil,

      fb19 : Bool? = nil,

      fb20 : Bool? = nil,

      fb21 : Bool? = nil,

      fb22 : Bool? = nil,

      fb23 : Bool? = nil,

      fb24 : Bool? = nil,

      fb25 : Bool? = nil,

      fb26 : Bool? = nil,

      fb27 : Bool? = nil,

      fb28 : Bool? = nil,

      fb29 : Bool? = nil,

      fb30 : Bool? = nil,

      fb31 : Bool? = nil
    ) : self
      value = @value

      unless fb0.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(fb0.to_int).&(0x1_u32) << 0
      end

      unless fb1.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(fb1.to_int).&(0x1_u32) << 1
      end

      unless fb2.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(fb2.to_int).&(0x1_u32) << 2
      end

      unless fb3.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(fb3.to_int).&(0x1_u32) << 3
      end

      unless fb4.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(fb4.to_int).&(0x1_u32) << 4
      end

      unless fb5.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(fb5.to_int).&(0x1_u32) << 5
      end

      unless fb6.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(fb6.to_int).&(0x1_u32) << 6
      end

      unless fb7.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(fb7.to_int).&(0x1_u32) << 7
      end

      unless fb8.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(fb8.to_int).&(0x1_u32) << 8
      end

      unless fb9.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(fb9.to_int).&(0x1_u32) << 9
      end

      unless fb10.nil?
        value = (value & 0xfffffbff_u32) |
                UInt32.new!(fb10.to_int).&(0x1_u32) << 10
      end

      unless fb11.nil?
        value = (value & 0xfffff7ff_u32) |
                UInt32.new!(fb11.to_int).&(0x1_u32) << 11
      end

      unless fb12.nil?
        value = (value & 0xffffefff_u32) |
                UInt32.new!(fb12.to_int).&(0x1_u32) << 12
      end

      unless fb13.nil?
        value = (value & 0xffffdfff_u32) |
                UInt32.new!(fb13.to_int).&(0x1_u32) << 13
      end

      unless fb14.nil?
        value = (value & 0xffffbfff_u32) |
                UInt32.new!(fb14.to_int).&(0x1_u32) << 14
      end

      unless fb15.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(fb15.to_int).&(0x1_u32) << 15
      end

      unless fb16.nil?
        value = (value & 0xfffeffff_u32) |
                UInt32.new!(fb16.to_int).&(0x1_u32) << 16
      end

      unless fb17.nil?
        value = (value & 0xfffdffff_u32) |
                UInt32.new!(fb17.to_int).&(0x1_u32) << 17
      end

      unless fb18.nil?
        value = (value & 0xfffbffff_u32) |
                UInt32.new!(fb18.to_int).&(0x1_u32) << 18
      end

      unless fb19.nil?
        value = (value & 0xfff7ffff_u32) |
                UInt32.new!(fb19.to_int).&(0x1_u32) << 19
      end

      unless fb20.nil?
        value = (value & 0xffefffff_u32) |
                UInt32.new!(fb20.to_int).&(0x1_u32) << 20
      end

      unless fb21.nil?
        value = (value & 0xffdfffff_u32) |
                UInt32.new!(fb21.to_int).&(0x1_u32) << 21
      end

      unless fb22.nil?
        value = (value & 0xffbfffff_u32) |
                UInt32.new!(fb22.to_int).&(0x1_u32) << 22
      end

      unless fb23.nil?
        value = (value & 0xff7fffff_u32) |
                UInt32.new!(fb23.to_int).&(0x1_u32) << 23
      end

      unless fb24.nil?
        value = (value & 0xfeffffff_u32) |
                UInt32.new!(fb24.to_int).&(0x1_u32) << 24
      end

      unless fb25.nil?
        value = (value & 0xfdffffff_u32) |
                UInt32.new!(fb25.to_int).&(0x1_u32) << 25
      end

      unless fb26.nil?
        value = (value & 0xfbffffff_u32) |
                UInt32.new!(fb26.to_int).&(0x1_u32) << 26
      end

      unless fb27.nil?
        value = (value & 0xf7ffffff_u32) |
                UInt32.new!(fb27.to_int).&(0x1_u32) << 27
      end

      unless fb28.nil?
        value = (value & 0xefffffff_u32) |
                UInt32.new!(fb28.to_int).&(0x1_u32) << 28
      end

      unless fb29.nil?
        value = (value & 0xdfffffff_u32) |
                UInt32.new!(fb29.to_int).&(0x1_u32) << 29
      end

      unless fb30.nil?
        value = (value & 0xbfffffff_u32) |
                UInt32.new!(fb30.to_int).&(0x1_u32) << 30
      end

      unless fb31.nil?
        value = (value & 0x7fffffff_u32) |
                UInt32.new!(fb31.to_int).&(0x1_u32) << 31
      end

      self.class.new(value)
    end

    def self.set(
      *,
      fb0 : Bool? = nil,
      fb1 : Bool? = nil,
      fb2 : Bool? = nil,
      fb3 : Bool? = nil,
      fb4 : Bool? = nil,
      fb5 : Bool? = nil,
      fb6 : Bool? = nil,
      fb7 : Bool? = nil,
      fb8 : Bool? = nil,
      fb9 : Bool? = nil,
      fb10 : Bool? = nil,
      fb11 : Bool? = nil,
      fb12 : Bool? = nil,
      fb13 : Bool? = nil,
      fb14 : Bool? = nil,
      fb15 : Bool? = nil,
      fb16 : Bool? = nil,
      fb17 : Bool? = nil,
      fb18 : Bool? = nil,
      fb19 : Bool? = nil,
      fb20 : Bool? = nil,
      fb21 : Bool? = nil,
      fb22 : Bool? = nil,
      fb23 : Bool? = nil,
      fb24 : Bool? = nil,
      fb25 : Bool? = nil,
      fb26 : Bool? = nil,
      fb27 : Bool? = nil,
      fb28 : Bool? = nil,
      fb29 : Bool? = nil,
      fb30 : Bool? = nil,
      fb31 : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        fb0: fb0,
        fb1: fb1,
        fb2: fb2,
        fb3: fb3,
        fb4: fb4,
        fb5: fb5,
        fb6: fb6,
        fb7: fb7,
        fb8: fb8,
        fb9: fb9,
        fb10: fb10,
        fb11: fb11,
        fb12: fb12,
        fb13: fb13,
        fb14: fb14,
        fb15: fb15,
        fb16: fb16,
        fb17: fb17,
        fb18: fb18,
        fb19: fb19,
        fb20: fb20,
        fb21: fb21,
        fb22: fb22,
        fb23: fb23,
        fb24: fb24,
        fb25: fb25,
        fb26: fb26,
        fb27: fb27,
        fb28: fb28,
        fb29: fb29,
        fb30: fb30,
        fb31: fb31,
      )
    end
  end # struct

  # Filter bank 7 register 1
  struct F7R1
    ADDRESS = BASE_ADDRESS + 0x278_u64

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

    # Filter bits
    def fb0 : Bool
      @value.bits_set?(0x1_u32)
    end

    # Filter bits
    def self.fb0 : Bool
      value.fb0
    end

    # Filter bits
    def self.fb0=(value : Bool) : Bool
      self.set(fb0: value)
      value
    end

    # Filter bits
    def fb1 : Bool
      @value.bits_set?(0x2_u32)
    end

    # Filter bits
    def self.fb1 : Bool
      value.fb1
    end

    # Filter bits
    def self.fb1=(value : Bool) : Bool
      self.set(fb1: value)
      value
    end

    # Filter bits
    def fb2 : Bool
      @value.bits_set?(0x4_u32)
    end

    # Filter bits
    def self.fb2 : Bool
      value.fb2
    end

    # Filter bits
    def self.fb2=(value : Bool) : Bool
      self.set(fb2: value)
      value
    end

    # Filter bits
    def fb3 : Bool
      @value.bits_set?(0x8_u32)
    end

    # Filter bits
    def self.fb3 : Bool
      value.fb3
    end

    # Filter bits
    def self.fb3=(value : Bool) : Bool
      self.set(fb3: value)
      value
    end

    # Filter bits
    def fb4 : Bool
      @value.bits_set?(0x10_u32)
    end

    # Filter bits
    def self.fb4 : Bool
      value.fb4
    end

    # Filter bits
    def self.fb4=(value : Bool) : Bool
      self.set(fb4: value)
      value
    end

    # Filter bits
    def fb5 : Bool
      @value.bits_set?(0x20_u32)
    end

    # Filter bits
    def self.fb5 : Bool
      value.fb5
    end

    # Filter bits
    def self.fb5=(value : Bool) : Bool
      self.set(fb5: value)
      value
    end

    # Filter bits
    def fb6 : Bool
      @value.bits_set?(0x40_u32)
    end

    # Filter bits
    def self.fb6 : Bool
      value.fb6
    end

    # Filter bits
    def self.fb6=(value : Bool) : Bool
      self.set(fb6: value)
      value
    end

    # Filter bits
    def fb7 : Bool
      @value.bits_set?(0x80_u32)
    end

    # Filter bits
    def self.fb7 : Bool
      value.fb7
    end

    # Filter bits
    def self.fb7=(value : Bool) : Bool
      self.set(fb7: value)
      value
    end

    # Filter bits
    def fb8 : Bool
      @value.bits_set?(0x100_u32)
    end

    # Filter bits
    def self.fb8 : Bool
      value.fb8
    end

    # Filter bits
    def self.fb8=(value : Bool) : Bool
      self.set(fb8: value)
      value
    end

    # Filter bits
    def fb9 : Bool
      @value.bits_set?(0x200_u32)
    end

    # Filter bits
    def self.fb9 : Bool
      value.fb9
    end

    # Filter bits
    def self.fb9=(value : Bool) : Bool
      self.set(fb9: value)
      value
    end

    # Filter bits
    def fb10 : Bool
      @value.bits_set?(0x400_u32)
    end

    # Filter bits
    def self.fb10 : Bool
      value.fb10
    end

    # Filter bits
    def self.fb10=(value : Bool) : Bool
      self.set(fb10: value)
      value
    end

    # Filter bits
    def fb11 : Bool
      @value.bits_set?(0x800_u32)
    end

    # Filter bits
    def self.fb11 : Bool
      value.fb11
    end

    # Filter bits
    def self.fb11=(value : Bool) : Bool
      self.set(fb11: value)
      value
    end

    # Filter bits
    def fb12 : Bool
      @value.bits_set?(0x1000_u32)
    end

    # Filter bits
    def self.fb12 : Bool
      value.fb12
    end

    # Filter bits
    def self.fb12=(value : Bool) : Bool
      self.set(fb12: value)
      value
    end

    # Filter bits
    def fb13 : Bool
      @value.bits_set?(0x2000_u32)
    end

    # Filter bits
    def self.fb13 : Bool
      value.fb13
    end

    # Filter bits
    def self.fb13=(value : Bool) : Bool
      self.set(fb13: value)
      value
    end

    # Filter bits
    def fb14 : Bool
      @value.bits_set?(0x4000_u32)
    end

    # Filter bits
    def self.fb14 : Bool
      value.fb14
    end

    # Filter bits
    def self.fb14=(value : Bool) : Bool
      self.set(fb14: value)
      value
    end

    # Filter bits
    def fb15 : Bool
      @value.bits_set?(0x8000_u32)
    end

    # Filter bits
    def self.fb15 : Bool
      value.fb15
    end

    # Filter bits
    def self.fb15=(value : Bool) : Bool
      self.set(fb15: value)
      value
    end

    # Filter bits
    def fb16 : Bool
      @value.bits_set?(0x10000_u32)
    end

    # Filter bits
    def self.fb16 : Bool
      value.fb16
    end

    # Filter bits
    def self.fb16=(value : Bool) : Bool
      self.set(fb16: value)
      value
    end

    # Filter bits
    def fb17 : Bool
      @value.bits_set?(0x20000_u32)
    end

    # Filter bits
    def self.fb17 : Bool
      value.fb17
    end

    # Filter bits
    def self.fb17=(value : Bool) : Bool
      self.set(fb17: value)
      value
    end

    # Filter bits
    def fb18 : Bool
      @value.bits_set?(0x40000_u32)
    end

    # Filter bits
    def self.fb18 : Bool
      value.fb18
    end

    # Filter bits
    def self.fb18=(value : Bool) : Bool
      self.set(fb18: value)
      value
    end

    # Filter bits
    def fb19 : Bool
      @value.bits_set?(0x80000_u32)
    end

    # Filter bits
    def self.fb19 : Bool
      value.fb19
    end

    # Filter bits
    def self.fb19=(value : Bool) : Bool
      self.set(fb19: value)
      value
    end

    # Filter bits
    def fb20 : Bool
      @value.bits_set?(0x100000_u32)
    end

    # Filter bits
    def self.fb20 : Bool
      value.fb20
    end

    # Filter bits
    def self.fb20=(value : Bool) : Bool
      self.set(fb20: value)
      value
    end

    # Filter bits
    def fb21 : Bool
      @value.bits_set?(0x200000_u32)
    end

    # Filter bits
    def self.fb21 : Bool
      value.fb21
    end

    # Filter bits
    def self.fb21=(value : Bool) : Bool
      self.set(fb21: value)
      value
    end

    # Filter bits
    def fb22 : Bool
      @value.bits_set?(0x400000_u32)
    end

    # Filter bits
    def self.fb22 : Bool
      value.fb22
    end

    # Filter bits
    def self.fb22=(value : Bool) : Bool
      self.set(fb22: value)
      value
    end

    # Filter bits
    def fb23 : Bool
      @value.bits_set?(0x800000_u32)
    end

    # Filter bits
    def self.fb23 : Bool
      value.fb23
    end

    # Filter bits
    def self.fb23=(value : Bool) : Bool
      self.set(fb23: value)
      value
    end

    # Filter bits
    def fb24 : Bool
      @value.bits_set?(0x1000000_u32)
    end

    # Filter bits
    def self.fb24 : Bool
      value.fb24
    end

    # Filter bits
    def self.fb24=(value : Bool) : Bool
      self.set(fb24: value)
      value
    end

    # Filter bits
    def fb25 : Bool
      @value.bits_set?(0x2000000_u32)
    end

    # Filter bits
    def self.fb25 : Bool
      value.fb25
    end

    # Filter bits
    def self.fb25=(value : Bool) : Bool
      self.set(fb25: value)
      value
    end

    # Filter bits
    def fb26 : Bool
      @value.bits_set?(0x4000000_u32)
    end

    # Filter bits
    def self.fb26 : Bool
      value.fb26
    end

    # Filter bits
    def self.fb26=(value : Bool) : Bool
      self.set(fb26: value)
      value
    end

    # Filter bits
    def fb27 : Bool
      @value.bits_set?(0x8000000_u32)
    end

    # Filter bits
    def self.fb27 : Bool
      value.fb27
    end

    # Filter bits
    def self.fb27=(value : Bool) : Bool
      self.set(fb27: value)
      value
    end

    # Filter bits
    def fb28 : Bool
      @value.bits_set?(0x10000000_u32)
    end

    # Filter bits
    def self.fb28 : Bool
      value.fb28
    end

    # Filter bits
    def self.fb28=(value : Bool) : Bool
      self.set(fb28: value)
      value
    end

    # Filter bits
    def fb29 : Bool
      @value.bits_set?(0x20000000_u32)
    end

    # Filter bits
    def self.fb29 : Bool
      value.fb29
    end

    # Filter bits
    def self.fb29=(value : Bool) : Bool
      self.set(fb29: value)
      value
    end

    # Filter bits
    def fb30 : Bool
      @value.bits_set?(0x40000000_u32)
    end

    # Filter bits
    def self.fb30 : Bool
      value.fb30
    end

    # Filter bits
    def self.fb30=(value : Bool) : Bool
      self.set(fb30: value)
      value
    end

    # Filter bits
    def fb31 : Bool
      @value.bits_set?(0x80000000_u32)
    end

    # Filter bits
    def self.fb31 : Bool
      value.fb31
    end

    # Filter bits
    def self.fb31=(value : Bool) : Bool
      self.set(fb31: value)
      value
    end

    def copy_with(
      *,

      fb0 : Bool? = nil,

      fb1 : Bool? = nil,

      fb2 : Bool? = nil,

      fb3 : Bool? = nil,

      fb4 : Bool? = nil,

      fb5 : Bool? = nil,

      fb6 : Bool? = nil,

      fb7 : Bool? = nil,

      fb8 : Bool? = nil,

      fb9 : Bool? = nil,

      fb10 : Bool? = nil,

      fb11 : Bool? = nil,

      fb12 : Bool? = nil,

      fb13 : Bool? = nil,

      fb14 : Bool? = nil,

      fb15 : Bool? = nil,

      fb16 : Bool? = nil,

      fb17 : Bool? = nil,

      fb18 : Bool? = nil,

      fb19 : Bool? = nil,

      fb20 : Bool? = nil,

      fb21 : Bool? = nil,

      fb22 : Bool? = nil,

      fb23 : Bool? = nil,

      fb24 : Bool? = nil,

      fb25 : Bool? = nil,

      fb26 : Bool? = nil,

      fb27 : Bool? = nil,

      fb28 : Bool? = nil,

      fb29 : Bool? = nil,

      fb30 : Bool? = nil,

      fb31 : Bool? = nil
    ) : self
      value = @value

      unless fb0.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(fb0.to_int).&(0x1_u32) << 0
      end

      unless fb1.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(fb1.to_int).&(0x1_u32) << 1
      end

      unless fb2.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(fb2.to_int).&(0x1_u32) << 2
      end

      unless fb3.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(fb3.to_int).&(0x1_u32) << 3
      end

      unless fb4.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(fb4.to_int).&(0x1_u32) << 4
      end

      unless fb5.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(fb5.to_int).&(0x1_u32) << 5
      end

      unless fb6.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(fb6.to_int).&(0x1_u32) << 6
      end

      unless fb7.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(fb7.to_int).&(0x1_u32) << 7
      end

      unless fb8.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(fb8.to_int).&(0x1_u32) << 8
      end

      unless fb9.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(fb9.to_int).&(0x1_u32) << 9
      end

      unless fb10.nil?
        value = (value & 0xfffffbff_u32) |
                UInt32.new!(fb10.to_int).&(0x1_u32) << 10
      end

      unless fb11.nil?
        value = (value & 0xfffff7ff_u32) |
                UInt32.new!(fb11.to_int).&(0x1_u32) << 11
      end

      unless fb12.nil?
        value = (value & 0xffffefff_u32) |
                UInt32.new!(fb12.to_int).&(0x1_u32) << 12
      end

      unless fb13.nil?
        value = (value & 0xffffdfff_u32) |
                UInt32.new!(fb13.to_int).&(0x1_u32) << 13
      end

      unless fb14.nil?
        value = (value & 0xffffbfff_u32) |
                UInt32.new!(fb14.to_int).&(0x1_u32) << 14
      end

      unless fb15.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(fb15.to_int).&(0x1_u32) << 15
      end

      unless fb16.nil?
        value = (value & 0xfffeffff_u32) |
                UInt32.new!(fb16.to_int).&(0x1_u32) << 16
      end

      unless fb17.nil?
        value = (value & 0xfffdffff_u32) |
                UInt32.new!(fb17.to_int).&(0x1_u32) << 17
      end

      unless fb18.nil?
        value = (value & 0xfffbffff_u32) |
                UInt32.new!(fb18.to_int).&(0x1_u32) << 18
      end

      unless fb19.nil?
        value = (value & 0xfff7ffff_u32) |
                UInt32.new!(fb19.to_int).&(0x1_u32) << 19
      end

      unless fb20.nil?
        value = (value & 0xffefffff_u32) |
                UInt32.new!(fb20.to_int).&(0x1_u32) << 20
      end

      unless fb21.nil?
        value = (value & 0xffdfffff_u32) |
                UInt32.new!(fb21.to_int).&(0x1_u32) << 21
      end

      unless fb22.nil?
        value = (value & 0xffbfffff_u32) |
                UInt32.new!(fb22.to_int).&(0x1_u32) << 22
      end

      unless fb23.nil?
        value = (value & 0xff7fffff_u32) |
                UInt32.new!(fb23.to_int).&(0x1_u32) << 23
      end

      unless fb24.nil?
        value = (value & 0xfeffffff_u32) |
                UInt32.new!(fb24.to_int).&(0x1_u32) << 24
      end

      unless fb25.nil?
        value = (value & 0xfdffffff_u32) |
                UInt32.new!(fb25.to_int).&(0x1_u32) << 25
      end

      unless fb26.nil?
        value = (value & 0xfbffffff_u32) |
                UInt32.new!(fb26.to_int).&(0x1_u32) << 26
      end

      unless fb27.nil?
        value = (value & 0xf7ffffff_u32) |
                UInt32.new!(fb27.to_int).&(0x1_u32) << 27
      end

      unless fb28.nil?
        value = (value & 0xefffffff_u32) |
                UInt32.new!(fb28.to_int).&(0x1_u32) << 28
      end

      unless fb29.nil?
        value = (value & 0xdfffffff_u32) |
                UInt32.new!(fb29.to_int).&(0x1_u32) << 29
      end

      unless fb30.nil?
        value = (value & 0xbfffffff_u32) |
                UInt32.new!(fb30.to_int).&(0x1_u32) << 30
      end

      unless fb31.nil?
        value = (value & 0x7fffffff_u32) |
                UInt32.new!(fb31.to_int).&(0x1_u32) << 31
      end

      self.class.new(value)
    end

    def self.set(
      *,
      fb0 : Bool? = nil,
      fb1 : Bool? = nil,
      fb2 : Bool? = nil,
      fb3 : Bool? = nil,
      fb4 : Bool? = nil,
      fb5 : Bool? = nil,
      fb6 : Bool? = nil,
      fb7 : Bool? = nil,
      fb8 : Bool? = nil,
      fb9 : Bool? = nil,
      fb10 : Bool? = nil,
      fb11 : Bool? = nil,
      fb12 : Bool? = nil,
      fb13 : Bool? = nil,
      fb14 : Bool? = nil,
      fb15 : Bool? = nil,
      fb16 : Bool? = nil,
      fb17 : Bool? = nil,
      fb18 : Bool? = nil,
      fb19 : Bool? = nil,
      fb20 : Bool? = nil,
      fb21 : Bool? = nil,
      fb22 : Bool? = nil,
      fb23 : Bool? = nil,
      fb24 : Bool? = nil,
      fb25 : Bool? = nil,
      fb26 : Bool? = nil,
      fb27 : Bool? = nil,
      fb28 : Bool? = nil,
      fb29 : Bool? = nil,
      fb30 : Bool? = nil,
      fb31 : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        fb0: fb0,
        fb1: fb1,
        fb2: fb2,
        fb3: fb3,
        fb4: fb4,
        fb5: fb5,
        fb6: fb6,
        fb7: fb7,
        fb8: fb8,
        fb9: fb9,
        fb10: fb10,
        fb11: fb11,
        fb12: fb12,
        fb13: fb13,
        fb14: fb14,
        fb15: fb15,
        fb16: fb16,
        fb17: fb17,
        fb18: fb18,
        fb19: fb19,
        fb20: fb20,
        fb21: fb21,
        fb22: fb22,
        fb23: fb23,
        fb24: fb24,
        fb25: fb25,
        fb26: fb26,
        fb27: fb27,
        fb28: fb28,
        fb29: fb29,
        fb30: fb30,
        fb31: fb31,
      )
    end
  end # struct

  # Filter bank 7 register 2
  struct F7R2
    ADDRESS = BASE_ADDRESS + 0x27c_u64

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

    # Filter bits
    def fb0 : Bool
      @value.bits_set?(0x1_u32)
    end

    # Filter bits
    def self.fb0 : Bool
      value.fb0
    end

    # Filter bits
    def self.fb0=(value : Bool) : Bool
      self.set(fb0: value)
      value
    end

    # Filter bits
    def fb1 : Bool
      @value.bits_set?(0x2_u32)
    end

    # Filter bits
    def self.fb1 : Bool
      value.fb1
    end

    # Filter bits
    def self.fb1=(value : Bool) : Bool
      self.set(fb1: value)
      value
    end

    # Filter bits
    def fb2 : Bool
      @value.bits_set?(0x4_u32)
    end

    # Filter bits
    def self.fb2 : Bool
      value.fb2
    end

    # Filter bits
    def self.fb2=(value : Bool) : Bool
      self.set(fb2: value)
      value
    end

    # Filter bits
    def fb3 : Bool
      @value.bits_set?(0x8_u32)
    end

    # Filter bits
    def self.fb3 : Bool
      value.fb3
    end

    # Filter bits
    def self.fb3=(value : Bool) : Bool
      self.set(fb3: value)
      value
    end

    # Filter bits
    def fb4 : Bool
      @value.bits_set?(0x10_u32)
    end

    # Filter bits
    def self.fb4 : Bool
      value.fb4
    end

    # Filter bits
    def self.fb4=(value : Bool) : Bool
      self.set(fb4: value)
      value
    end

    # Filter bits
    def fb5 : Bool
      @value.bits_set?(0x20_u32)
    end

    # Filter bits
    def self.fb5 : Bool
      value.fb5
    end

    # Filter bits
    def self.fb5=(value : Bool) : Bool
      self.set(fb5: value)
      value
    end

    # Filter bits
    def fb6 : Bool
      @value.bits_set?(0x40_u32)
    end

    # Filter bits
    def self.fb6 : Bool
      value.fb6
    end

    # Filter bits
    def self.fb6=(value : Bool) : Bool
      self.set(fb6: value)
      value
    end

    # Filter bits
    def fb7 : Bool
      @value.bits_set?(0x80_u32)
    end

    # Filter bits
    def self.fb7 : Bool
      value.fb7
    end

    # Filter bits
    def self.fb7=(value : Bool) : Bool
      self.set(fb7: value)
      value
    end

    # Filter bits
    def fb8 : Bool
      @value.bits_set?(0x100_u32)
    end

    # Filter bits
    def self.fb8 : Bool
      value.fb8
    end

    # Filter bits
    def self.fb8=(value : Bool) : Bool
      self.set(fb8: value)
      value
    end

    # Filter bits
    def fb9 : Bool
      @value.bits_set?(0x200_u32)
    end

    # Filter bits
    def self.fb9 : Bool
      value.fb9
    end

    # Filter bits
    def self.fb9=(value : Bool) : Bool
      self.set(fb9: value)
      value
    end

    # Filter bits
    def fb10 : Bool
      @value.bits_set?(0x400_u32)
    end

    # Filter bits
    def self.fb10 : Bool
      value.fb10
    end

    # Filter bits
    def self.fb10=(value : Bool) : Bool
      self.set(fb10: value)
      value
    end

    # Filter bits
    def fb11 : Bool
      @value.bits_set?(0x800_u32)
    end

    # Filter bits
    def self.fb11 : Bool
      value.fb11
    end

    # Filter bits
    def self.fb11=(value : Bool) : Bool
      self.set(fb11: value)
      value
    end

    # Filter bits
    def fb12 : Bool
      @value.bits_set?(0x1000_u32)
    end

    # Filter bits
    def self.fb12 : Bool
      value.fb12
    end

    # Filter bits
    def self.fb12=(value : Bool) : Bool
      self.set(fb12: value)
      value
    end

    # Filter bits
    def fb13 : Bool
      @value.bits_set?(0x2000_u32)
    end

    # Filter bits
    def self.fb13 : Bool
      value.fb13
    end

    # Filter bits
    def self.fb13=(value : Bool) : Bool
      self.set(fb13: value)
      value
    end

    # Filter bits
    def fb14 : Bool
      @value.bits_set?(0x4000_u32)
    end

    # Filter bits
    def self.fb14 : Bool
      value.fb14
    end

    # Filter bits
    def self.fb14=(value : Bool) : Bool
      self.set(fb14: value)
      value
    end

    # Filter bits
    def fb15 : Bool
      @value.bits_set?(0x8000_u32)
    end

    # Filter bits
    def self.fb15 : Bool
      value.fb15
    end

    # Filter bits
    def self.fb15=(value : Bool) : Bool
      self.set(fb15: value)
      value
    end

    # Filter bits
    def fb16 : Bool
      @value.bits_set?(0x10000_u32)
    end

    # Filter bits
    def self.fb16 : Bool
      value.fb16
    end

    # Filter bits
    def self.fb16=(value : Bool) : Bool
      self.set(fb16: value)
      value
    end

    # Filter bits
    def fb17 : Bool
      @value.bits_set?(0x20000_u32)
    end

    # Filter bits
    def self.fb17 : Bool
      value.fb17
    end

    # Filter bits
    def self.fb17=(value : Bool) : Bool
      self.set(fb17: value)
      value
    end

    # Filter bits
    def fb18 : Bool
      @value.bits_set?(0x40000_u32)
    end

    # Filter bits
    def self.fb18 : Bool
      value.fb18
    end

    # Filter bits
    def self.fb18=(value : Bool) : Bool
      self.set(fb18: value)
      value
    end

    # Filter bits
    def fb19 : Bool
      @value.bits_set?(0x80000_u32)
    end

    # Filter bits
    def self.fb19 : Bool
      value.fb19
    end

    # Filter bits
    def self.fb19=(value : Bool) : Bool
      self.set(fb19: value)
      value
    end

    # Filter bits
    def fb20 : Bool
      @value.bits_set?(0x100000_u32)
    end

    # Filter bits
    def self.fb20 : Bool
      value.fb20
    end

    # Filter bits
    def self.fb20=(value : Bool) : Bool
      self.set(fb20: value)
      value
    end

    # Filter bits
    def fb21 : Bool
      @value.bits_set?(0x200000_u32)
    end

    # Filter bits
    def self.fb21 : Bool
      value.fb21
    end

    # Filter bits
    def self.fb21=(value : Bool) : Bool
      self.set(fb21: value)
      value
    end

    # Filter bits
    def fb22 : Bool
      @value.bits_set?(0x400000_u32)
    end

    # Filter bits
    def self.fb22 : Bool
      value.fb22
    end

    # Filter bits
    def self.fb22=(value : Bool) : Bool
      self.set(fb22: value)
      value
    end

    # Filter bits
    def fb23 : Bool
      @value.bits_set?(0x800000_u32)
    end

    # Filter bits
    def self.fb23 : Bool
      value.fb23
    end

    # Filter bits
    def self.fb23=(value : Bool) : Bool
      self.set(fb23: value)
      value
    end

    # Filter bits
    def fb24 : Bool
      @value.bits_set?(0x1000000_u32)
    end

    # Filter bits
    def self.fb24 : Bool
      value.fb24
    end

    # Filter bits
    def self.fb24=(value : Bool) : Bool
      self.set(fb24: value)
      value
    end

    # Filter bits
    def fb25 : Bool
      @value.bits_set?(0x2000000_u32)
    end

    # Filter bits
    def self.fb25 : Bool
      value.fb25
    end

    # Filter bits
    def self.fb25=(value : Bool) : Bool
      self.set(fb25: value)
      value
    end

    # Filter bits
    def fb26 : Bool
      @value.bits_set?(0x4000000_u32)
    end

    # Filter bits
    def self.fb26 : Bool
      value.fb26
    end

    # Filter bits
    def self.fb26=(value : Bool) : Bool
      self.set(fb26: value)
      value
    end

    # Filter bits
    def fb27 : Bool
      @value.bits_set?(0x8000000_u32)
    end

    # Filter bits
    def self.fb27 : Bool
      value.fb27
    end

    # Filter bits
    def self.fb27=(value : Bool) : Bool
      self.set(fb27: value)
      value
    end

    # Filter bits
    def fb28 : Bool
      @value.bits_set?(0x10000000_u32)
    end

    # Filter bits
    def self.fb28 : Bool
      value.fb28
    end

    # Filter bits
    def self.fb28=(value : Bool) : Bool
      self.set(fb28: value)
      value
    end

    # Filter bits
    def fb29 : Bool
      @value.bits_set?(0x20000000_u32)
    end

    # Filter bits
    def self.fb29 : Bool
      value.fb29
    end

    # Filter bits
    def self.fb29=(value : Bool) : Bool
      self.set(fb29: value)
      value
    end

    # Filter bits
    def fb30 : Bool
      @value.bits_set?(0x40000000_u32)
    end

    # Filter bits
    def self.fb30 : Bool
      value.fb30
    end

    # Filter bits
    def self.fb30=(value : Bool) : Bool
      self.set(fb30: value)
      value
    end

    # Filter bits
    def fb31 : Bool
      @value.bits_set?(0x80000000_u32)
    end

    # Filter bits
    def self.fb31 : Bool
      value.fb31
    end

    # Filter bits
    def self.fb31=(value : Bool) : Bool
      self.set(fb31: value)
      value
    end

    def copy_with(
      *,

      fb0 : Bool? = nil,

      fb1 : Bool? = nil,

      fb2 : Bool? = nil,

      fb3 : Bool? = nil,

      fb4 : Bool? = nil,

      fb5 : Bool? = nil,

      fb6 : Bool? = nil,

      fb7 : Bool? = nil,

      fb8 : Bool? = nil,

      fb9 : Bool? = nil,

      fb10 : Bool? = nil,

      fb11 : Bool? = nil,

      fb12 : Bool? = nil,

      fb13 : Bool? = nil,

      fb14 : Bool? = nil,

      fb15 : Bool? = nil,

      fb16 : Bool? = nil,

      fb17 : Bool? = nil,

      fb18 : Bool? = nil,

      fb19 : Bool? = nil,

      fb20 : Bool? = nil,

      fb21 : Bool? = nil,

      fb22 : Bool? = nil,

      fb23 : Bool? = nil,

      fb24 : Bool? = nil,

      fb25 : Bool? = nil,

      fb26 : Bool? = nil,

      fb27 : Bool? = nil,

      fb28 : Bool? = nil,

      fb29 : Bool? = nil,

      fb30 : Bool? = nil,

      fb31 : Bool? = nil
    ) : self
      value = @value

      unless fb0.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(fb0.to_int).&(0x1_u32) << 0
      end

      unless fb1.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(fb1.to_int).&(0x1_u32) << 1
      end

      unless fb2.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(fb2.to_int).&(0x1_u32) << 2
      end

      unless fb3.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(fb3.to_int).&(0x1_u32) << 3
      end

      unless fb4.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(fb4.to_int).&(0x1_u32) << 4
      end

      unless fb5.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(fb5.to_int).&(0x1_u32) << 5
      end

      unless fb6.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(fb6.to_int).&(0x1_u32) << 6
      end

      unless fb7.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(fb7.to_int).&(0x1_u32) << 7
      end

      unless fb8.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(fb8.to_int).&(0x1_u32) << 8
      end

      unless fb9.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(fb9.to_int).&(0x1_u32) << 9
      end

      unless fb10.nil?
        value = (value & 0xfffffbff_u32) |
                UInt32.new!(fb10.to_int).&(0x1_u32) << 10
      end

      unless fb11.nil?
        value = (value & 0xfffff7ff_u32) |
                UInt32.new!(fb11.to_int).&(0x1_u32) << 11
      end

      unless fb12.nil?
        value = (value & 0xffffefff_u32) |
                UInt32.new!(fb12.to_int).&(0x1_u32) << 12
      end

      unless fb13.nil?
        value = (value & 0xffffdfff_u32) |
                UInt32.new!(fb13.to_int).&(0x1_u32) << 13
      end

      unless fb14.nil?
        value = (value & 0xffffbfff_u32) |
                UInt32.new!(fb14.to_int).&(0x1_u32) << 14
      end

      unless fb15.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(fb15.to_int).&(0x1_u32) << 15
      end

      unless fb16.nil?
        value = (value & 0xfffeffff_u32) |
                UInt32.new!(fb16.to_int).&(0x1_u32) << 16
      end

      unless fb17.nil?
        value = (value & 0xfffdffff_u32) |
                UInt32.new!(fb17.to_int).&(0x1_u32) << 17
      end

      unless fb18.nil?
        value = (value & 0xfffbffff_u32) |
                UInt32.new!(fb18.to_int).&(0x1_u32) << 18
      end

      unless fb19.nil?
        value = (value & 0xfff7ffff_u32) |
                UInt32.new!(fb19.to_int).&(0x1_u32) << 19
      end

      unless fb20.nil?
        value = (value & 0xffefffff_u32) |
                UInt32.new!(fb20.to_int).&(0x1_u32) << 20
      end

      unless fb21.nil?
        value = (value & 0xffdfffff_u32) |
                UInt32.new!(fb21.to_int).&(0x1_u32) << 21
      end

      unless fb22.nil?
        value = (value & 0xffbfffff_u32) |
                UInt32.new!(fb22.to_int).&(0x1_u32) << 22
      end

      unless fb23.nil?
        value = (value & 0xff7fffff_u32) |
                UInt32.new!(fb23.to_int).&(0x1_u32) << 23
      end

      unless fb24.nil?
        value = (value & 0xfeffffff_u32) |
                UInt32.new!(fb24.to_int).&(0x1_u32) << 24
      end

      unless fb25.nil?
        value = (value & 0xfdffffff_u32) |
                UInt32.new!(fb25.to_int).&(0x1_u32) << 25
      end

      unless fb26.nil?
        value = (value & 0xfbffffff_u32) |
                UInt32.new!(fb26.to_int).&(0x1_u32) << 26
      end

      unless fb27.nil?
        value = (value & 0xf7ffffff_u32) |
                UInt32.new!(fb27.to_int).&(0x1_u32) << 27
      end

      unless fb28.nil?
        value = (value & 0xefffffff_u32) |
                UInt32.new!(fb28.to_int).&(0x1_u32) << 28
      end

      unless fb29.nil?
        value = (value & 0xdfffffff_u32) |
                UInt32.new!(fb29.to_int).&(0x1_u32) << 29
      end

      unless fb30.nil?
        value = (value & 0xbfffffff_u32) |
                UInt32.new!(fb30.to_int).&(0x1_u32) << 30
      end

      unless fb31.nil?
        value = (value & 0x7fffffff_u32) |
                UInt32.new!(fb31.to_int).&(0x1_u32) << 31
      end

      self.class.new(value)
    end

    def self.set(
      *,
      fb0 : Bool? = nil,
      fb1 : Bool? = nil,
      fb2 : Bool? = nil,
      fb3 : Bool? = nil,
      fb4 : Bool? = nil,
      fb5 : Bool? = nil,
      fb6 : Bool? = nil,
      fb7 : Bool? = nil,
      fb8 : Bool? = nil,
      fb9 : Bool? = nil,
      fb10 : Bool? = nil,
      fb11 : Bool? = nil,
      fb12 : Bool? = nil,
      fb13 : Bool? = nil,
      fb14 : Bool? = nil,
      fb15 : Bool? = nil,
      fb16 : Bool? = nil,
      fb17 : Bool? = nil,
      fb18 : Bool? = nil,
      fb19 : Bool? = nil,
      fb20 : Bool? = nil,
      fb21 : Bool? = nil,
      fb22 : Bool? = nil,
      fb23 : Bool? = nil,
      fb24 : Bool? = nil,
      fb25 : Bool? = nil,
      fb26 : Bool? = nil,
      fb27 : Bool? = nil,
      fb28 : Bool? = nil,
      fb29 : Bool? = nil,
      fb30 : Bool? = nil,
      fb31 : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        fb0: fb0,
        fb1: fb1,
        fb2: fb2,
        fb3: fb3,
        fb4: fb4,
        fb5: fb5,
        fb6: fb6,
        fb7: fb7,
        fb8: fb8,
        fb9: fb9,
        fb10: fb10,
        fb11: fb11,
        fb12: fb12,
        fb13: fb13,
        fb14: fb14,
        fb15: fb15,
        fb16: fb16,
        fb17: fb17,
        fb18: fb18,
        fb19: fb19,
        fb20: fb20,
        fb21: fb21,
        fb22: fb22,
        fb23: fb23,
        fb24: fb24,
        fb25: fb25,
        fb26: fb26,
        fb27: fb27,
        fb28: fb28,
        fb29: fb29,
        fb30: fb30,
        fb31: fb31,
      )
    end
  end # struct

  # Filter bank 8 register 1
  struct F8R1
    ADDRESS = BASE_ADDRESS + 0x280_u64

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

    # Filter bits
    def fb0 : Bool
      @value.bits_set?(0x1_u32)
    end

    # Filter bits
    def self.fb0 : Bool
      value.fb0
    end

    # Filter bits
    def self.fb0=(value : Bool) : Bool
      self.set(fb0: value)
      value
    end

    # Filter bits
    def fb1 : Bool
      @value.bits_set?(0x2_u32)
    end

    # Filter bits
    def self.fb1 : Bool
      value.fb1
    end

    # Filter bits
    def self.fb1=(value : Bool) : Bool
      self.set(fb1: value)
      value
    end

    # Filter bits
    def fb2 : Bool
      @value.bits_set?(0x4_u32)
    end

    # Filter bits
    def self.fb2 : Bool
      value.fb2
    end

    # Filter bits
    def self.fb2=(value : Bool) : Bool
      self.set(fb2: value)
      value
    end

    # Filter bits
    def fb3 : Bool
      @value.bits_set?(0x8_u32)
    end

    # Filter bits
    def self.fb3 : Bool
      value.fb3
    end

    # Filter bits
    def self.fb3=(value : Bool) : Bool
      self.set(fb3: value)
      value
    end

    # Filter bits
    def fb4 : Bool
      @value.bits_set?(0x10_u32)
    end

    # Filter bits
    def self.fb4 : Bool
      value.fb4
    end

    # Filter bits
    def self.fb4=(value : Bool) : Bool
      self.set(fb4: value)
      value
    end

    # Filter bits
    def fb5 : Bool
      @value.bits_set?(0x20_u32)
    end

    # Filter bits
    def self.fb5 : Bool
      value.fb5
    end

    # Filter bits
    def self.fb5=(value : Bool) : Bool
      self.set(fb5: value)
      value
    end

    # Filter bits
    def fb6 : Bool
      @value.bits_set?(0x40_u32)
    end

    # Filter bits
    def self.fb6 : Bool
      value.fb6
    end

    # Filter bits
    def self.fb6=(value : Bool) : Bool
      self.set(fb6: value)
      value
    end

    # Filter bits
    def fb7 : Bool
      @value.bits_set?(0x80_u32)
    end

    # Filter bits
    def self.fb7 : Bool
      value.fb7
    end

    # Filter bits
    def self.fb7=(value : Bool) : Bool
      self.set(fb7: value)
      value
    end

    # Filter bits
    def fb8 : Bool
      @value.bits_set?(0x100_u32)
    end

    # Filter bits
    def self.fb8 : Bool
      value.fb8
    end

    # Filter bits
    def self.fb8=(value : Bool) : Bool
      self.set(fb8: value)
      value
    end

    # Filter bits
    def fb9 : Bool
      @value.bits_set?(0x200_u32)
    end

    # Filter bits
    def self.fb9 : Bool
      value.fb9
    end

    # Filter bits
    def self.fb9=(value : Bool) : Bool
      self.set(fb9: value)
      value
    end

    # Filter bits
    def fb10 : Bool
      @value.bits_set?(0x400_u32)
    end

    # Filter bits
    def self.fb10 : Bool
      value.fb10
    end

    # Filter bits
    def self.fb10=(value : Bool) : Bool
      self.set(fb10: value)
      value
    end

    # Filter bits
    def fb11 : Bool
      @value.bits_set?(0x800_u32)
    end

    # Filter bits
    def self.fb11 : Bool
      value.fb11
    end

    # Filter bits
    def self.fb11=(value : Bool) : Bool
      self.set(fb11: value)
      value
    end

    # Filter bits
    def fb12 : Bool
      @value.bits_set?(0x1000_u32)
    end

    # Filter bits
    def self.fb12 : Bool
      value.fb12
    end

    # Filter bits
    def self.fb12=(value : Bool) : Bool
      self.set(fb12: value)
      value
    end

    # Filter bits
    def fb13 : Bool
      @value.bits_set?(0x2000_u32)
    end

    # Filter bits
    def self.fb13 : Bool
      value.fb13
    end

    # Filter bits
    def self.fb13=(value : Bool) : Bool
      self.set(fb13: value)
      value
    end

    # Filter bits
    def fb14 : Bool
      @value.bits_set?(0x4000_u32)
    end

    # Filter bits
    def self.fb14 : Bool
      value.fb14
    end

    # Filter bits
    def self.fb14=(value : Bool) : Bool
      self.set(fb14: value)
      value
    end

    # Filter bits
    def fb15 : Bool
      @value.bits_set?(0x8000_u32)
    end

    # Filter bits
    def self.fb15 : Bool
      value.fb15
    end

    # Filter bits
    def self.fb15=(value : Bool) : Bool
      self.set(fb15: value)
      value
    end

    # Filter bits
    def fb16 : Bool
      @value.bits_set?(0x10000_u32)
    end

    # Filter bits
    def self.fb16 : Bool
      value.fb16
    end

    # Filter bits
    def self.fb16=(value : Bool) : Bool
      self.set(fb16: value)
      value
    end

    # Filter bits
    def fb17 : Bool
      @value.bits_set?(0x20000_u32)
    end

    # Filter bits
    def self.fb17 : Bool
      value.fb17
    end

    # Filter bits
    def self.fb17=(value : Bool) : Bool
      self.set(fb17: value)
      value
    end

    # Filter bits
    def fb18 : Bool
      @value.bits_set?(0x40000_u32)
    end

    # Filter bits
    def self.fb18 : Bool
      value.fb18
    end

    # Filter bits
    def self.fb18=(value : Bool) : Bool
      self.set(fb18: value)
      value
    end

    # Filter bits
    def fb19 : Bool
      @value.bits_set?(0x80000_u32)
    end

    # Filter bits
    def self.fb19 : Bool
      value.fb19
    end

    # Filter bits
    def self.fb19=(value : Bool) : Bool
      self.set(fb19: value)
      value
    end

    # Filter bits
    def fb20 : Bool
      @value.bits_set?(0x100000_u32)
    end

    # Filter bits
    def self.fb20 : Bool
      value.fb20
    end

    # Filter bits
    def self.fb20=(value : Bool) : Bool
      self.set(fb20: value)
      value
    end

    # Filter bits
    def fb21 : Bool
      @value.bits_set?(0x200000_u32)
    end

    # Filter bits
    def self.fb21 : Bool
      value.fb21
    end

    # Filter bits
    def self.fb21=(value : Bool) : Bool
      self.set(fb21: value)
      value
    end

    # Filter bits
    def fb22 : Bool
      @value.bits_set?(0x400000_u32)
    end

    # Filter bits
    def self.fb22 : Bool
      value.fb22
    end

    # Filter bits
    def self.fb22=(value : Bool) : Bool
      self.set(fb22: value)
      value
    end

    # Filter bits
    def fb23 : Bool
      @value.bits_set?(0x800000_u32)
    end

    # Filter bits
    def self.fb23 : Bool
      value.fb23
    end

    # Filter bits
    def self.fb23=(value : Bool) : Bool
      self.set(fb23: value)
      value
    end

    # Filter bits
    def fb24 : Bool
      @value.bits_set?(0x1000000_u32)
    end

    # Filter bits
    def self.fb24 : Bool
      value.fb24
    end

    # Filter bits
    def self.fb24=(value : Bool) : Bool
      self.set(fb24: value)
      value
    end

    # Filter bits
    def fb25 : Bool
      @value.bits_set?(0x2000000_u32)
    end

    # Filter bits
    def self.fb25 : Bool
      value.fb25
    end

    # Filter bits
    def self.fb25=(value : Bool) : Bool
      self.set(fb25: value)
      value
    end

    # Filter bits
    def fb26 : Bool
      @value.bits_set?(0x4000000_u32)
    end

    # Filter bits
    def self.fb26 : Bool
      value.fb26
    end

    # Filter bits
    def self.fb26=(value : Bool) : Bool
      self.set(fb26: value)
      value
    end

    # Filter bits
    def fb27 : Bool
      @value.bits_set?(0x8000000_u32)
    end

    # Filter bits
    def self.fb27 : Bool
      value.fb27
    end

    # Filter bits
    def self.fb27=(value : Bool) : Bool
      self.set(fb27: value)
      value
    end

    # Filter bits
    def fb28 : Bool
      @value.bits_set?(0x10000000_u32)
    end

    # Filter bits
    def self.fb28 : Bool
      value.fb28
    end

    # Filter bits
    def self.fb28=(value : Bool) : Bool
      self.set(fb28: value)
      value
    end

    # Filter bits
    def fb29 : Bool
      @value.bits_set?(0x20000000_u32)
    end

    # Filter bits
    def self.fb29 : Bool
      value.fb29
    end

    # Filter bits
    def self.fb29=(value : Bool) : Bool
      self.set(fb29: value)
      value
    end

    # Filter bits
    def fb30 : Bool
      @value.bits_set?(0x40000000_u32)
    end

    # Filter bits
    def self.fb30 : Bool
      value.fb30
    end

    # Filter bits
    def self.fb30=(value : Bool) : Bool
      self.set(fb30: value)
      value
    end

    # Filter bits
    def fb31 : Bool
      @value.bits_set?(0x80000000_u32)
    end

    # Filter bits
    def self.fb31 : Bool
      value.fb31
    end

    # Filter bits
    def self.fb31=(value : Bool) : Bool
      self.set(fb31: value)
      value
    end

    def copy_with(
      *,

      fb0 : Bool? = nil,

      fb1 : Bool? = nil,

      fb2 : Bool? = nil,

      fb3 : Bool? = nil,

      fb4 : Bool? = nil,

      fb5 : Bool? = nil,

      fb6 : Bool? = nil,

      fb7 : Bool? = nil,

      fb8 : Bool? = nil,

      fb9 : Bool? = nil,

      fb10 : Bool? = nil,

      fb11 : Bool? = nil,

      fb12 : Bool? = nil,

      fb13 : Bool? = nil,

      fb14 : Bool? = nil,

      fb15 : Bool? = nil,

      fb16 : Bool? = nil,

      fb17 : Bool? = nil,

      fb18 : Bool? = nil,

      fb19 : Bool? = nil,

      fb20 : Bool? = nil,

      fb21 : Bool? = nil,

      fb22 : Bool? = nil,

      fb23 : Bool? = nil,

      fb24 : Bool? = nil,

      fb25 : Bool? = nil,

      fb26 : Bool? = nil,

      fb27 : Bool? = nil,

      fb28 : Bool? = nil,

      fb29 : Bool? = nil,

      fb30 : Bool? = nil,

      fb31 : Bool? = nil
    ) : self
      value = @value

      unless fb0.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(fb0.to_int).&(0x1_u32) << 0
      end

      unless fb1.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(fb1.to_int).&(0x1_u32) << 1
      end

      unless fb2.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(fb2.to_int).&(0x1_u32) << 2
      end

      unless fb3.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(fb3.to_int).&(0x1_u32) << 3
      end

      unless fb4.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(fb4.to_int).&(0x1_u32) << 4
      end

      unless fb5.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(fb5.to_int).&(0x1_u32) << 5
      end

      unless fb6.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(fb6.to_int).&(0x1_u32) << 6
      end

      unless fb7.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(fb7.to_int).&(0x1_u32) << 7
      end

      unless fb8.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(fb8.to_int).&(0x1_u32) << 8
      end

      unless fb9.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(fb9.to_int).&(0x1_u32) << 9
      end

      unless fb10.nil?
        value = (value & 0xfffffbff_u32) |
                UInt32.new!(fb10.to_int).&(0x1_u32) << 10
      end

      unless fb11.nil?
        value = (value & 0xfffff7ff_u32) |
                UInt32.new!(fb11.to_int).&(0x1_u32) << 11
      end

      unless fb12.nil?
        value = (value & 0xffffefff_u32) |
                UInt32.new!(fb12.to_int).&(0x1_u32) << 12
      end

      unless fb13.nil?
        value = (value & 0xffffdfff_u32) |
                UInt32.new!(fb13.to_int).&(0x1_u32) << 13
      end

      unless fb14.nil?
        value = (value & 0xffffbfff_u32) |
                UInt32.new!(fb14.to_int).&(0x1_u32) << 14
      end

      unless fb15.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(fb15.to_int).&(0x1_u32) << 15
      end

      unless fb16.nil?
        value = (value & 0xfffeffff_u32) |
                UInt32.new!(fb16.to_int).&(0x1_u32) << 16
      end

      unless fb17.nil?
        value = (value & 0xfffdffff_u32) |
                UInt32.new!(fb17.to_int).&(0x1_u32) << 17
      end

      unless fb18.nil?
        value = (value & 0xfffbffff_u32) |
                UInt32.new!(fb18.to_int).&(0x1_u32) << 18
      end

      unless fb19.nil?
        value = (value & 0xfff7ffff_u32) |
                UInt32.new!(fb19.to_int).&(0x1_u32) << 19
      end

      unless fb20.nil?
        value = (value & 0xffefffff_u32) |
                UInt32.new!(fb20.to_int).&(0x1_u32) << 20
      end

      unless fb21.nil?
        value = (value & 0xffdfffff_u32) |
                UInt32.new!(fb21.to_int).&(0x1_u32) << 21
      end

      unless fb22.nil?
        value = (value & 0xffbfffff_u32) |
                UInt32.new!(fb22.to_int).&(0x1_u32) << 22
      end

      unless fb23.nil?
        value = (value & 0xff7fffff_u32) |
                UInt32.new!(fb23.to_int).&(0x1_u32) << 23
      end

      unless fb24.nil?
        value = (value & 0xfeffffff_u32) |
                UInt32.new!(fb24.to_int).&(0x1_u32) << 24
      end

      unless fb25.nil?
        value = (value & 0xfdffffff_u32) |
                UInt32.new!(fb25.to_int).&(0x1_u32) << 25
      end

      unless fb26.nil?
        value = (value & 0xfbffffff_u32) |
                UInt32.new!(fb26.to_int).&(0x1_u32) << 26
      end

      unless fb27.nil?
        value = (value & 0xf7ffffff_u32) |
                UInt32.new!(fb27.to_int).&(0x1_u32) << 27
      end

      unless fb28.nil?
        value = (value & 0xefffffff_u32) |
                UInt32.new!(fb28.to_int).&(0x1_u32) << 28
      end

      unless fb29.nil?
        value = (value & 0xdfffffff_u32) |
                UInt32.new!(fb29.to_int).&(0x1_u32) << 29
      end

      unless fb30.nil?
        value = (value & 0xbfffffff_u32) |
                UInt32.new!(fb30.to_int).&(0x1_u32) << 30
      end

      unless fb31.nil?
        value = (value & 0x7fffffff_u32) |
                UInt32.new!(fb31.to_int).&(0x1_u32) << 31
      end

      self.class.new(value)
    end

    def self.set(
      *,
      fb0 : Bool? = nil,
      fb1 : Bool? = nil,
      fb2 : Bool? = nil,
      fb3 : Bool? = nil,
      fb4 : Bool? = nil,
      fb5 : Bool? = nil,
      fb6 : Bool? = nil,
      fb7 : Bool? = nil,
      fb8 : Bool? = nil,
      fb9 : Bool? = nil,
      fb10 : Bool? = nil,
      fb11 : Bool? = nil,
      fb12 : Bool? = nil,
      fb13 : Bool? = nil,
      fb14 : Bool? = nil,
      fb15 : Bool? = nil,
      fb16 : Bool? = nil,
      fb17 : Bool? = nil,
      fb18 : Bool? = nil,
      fb19 : Bool? = nil,
      fb20 : Bool? = nil,
      fb21 : Bool? = nil,
      fb22 : Bool? = nil,
      fb23 : Bool? = nil,
      fb24 : Bool? = nil,
      fb25 : Bool? = nil,
      fb26 : Bool? = nil,
      fb27 : Bool? = nil,
      fb28 : Bool? = nil,
      fb29 : Bool? = nil,
      fb30 : Bool? = nil,
      fb31 : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        fb0: fb0,
        fb1: fb1,
        fb2: fb2,
        fb3: fb3,
        fb4: fb4,
        fb5: fb5,
        fb6: fb6,
        fb7: fb7,
        fb8: fb8,
        fb9: fb9,
        fb10: fb10,
        fb11: fb11,
        fb12: fb12,
        fb13: fb13,
        fb14: fb14,
        fb15: fb15,
        fb16: fb16,
        fb17: fb17,
        fb18: fb18,
        fb19: fb19,
        fb20: fb20,
        fb21: fb21,
        fb22: fb22,
        fb23: fb23,
        fb24: fb24,
        fb25: fb25,
        fb26: fb26,
        fb27: fb27,
        fb28: fb28,
        fb29: fb29,
        fb30: fb30,
        fb31: fb31,
      )
    end
  end # struct

  # Filter bank 8 register 2
  struct F8R2
    ADDRESS = BASE_ADDRESS + 0x284_u64

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

    # Filter bits
    def fb0 : Bool
      @value.bits_set?(0x1_u32)
    end

    # Filter bits
    def self.fb0 : Bool
      value.fb0
    end

    # Filter bits
    def self.fb0=(value : Bool) : Bool
      self.set(fb0: value)
      value
    end

    # Filter bits
    def fb1 : Bool
      @value.bits_set?(0x2_u32)
    end

    # Filter bits
    def self.fb1 : Bool
      value.fb1
    end

    # Filter bits
    def self.fb1=(value : Bool) : Bool
      self.set(fb1: value)
      value
    end

    # Filter bits
    def fb2 : Bool
      @value.bits_set?(0x4_u32)
    end

    # Filter bits
    def self.fb2 : Bool
      value.fb2
    end

    # Filter bits
    def self.fb2=(value : Bool) : Bool
      self.set(fb2: value)
      value
    end

    # Filter bits
    def fb3 : Bool
      @value.bits_set?(0x8_u32)
    end

    # Filter bits
    def self.fb3 : Bool
      value.fb3
    end

    # Filter bits
    def self.fb3=(value : Bool) : Bool
      self.set(fb3: value)
      value
    end

    # Filter bits
    def fb4 : Bool
      @value.bits_set?(0x10_u32)
    end

    # Filter bits
    def self.fb4 : Bool
      value.fb4
    end

    # Filter bits
    def self.fb4=(value : Bool) : Bool
      self.set(fb4: value)
      value
    end

    # Filter bits
    def fb5 : Bool
      @value.bits_set?(0x20_u32)
    end

    # Filter bits
    def self.fb5 : Bool
      value.fb5
    end

    # Filter bits
    def self.fb5=(value : Bool) : Bool
      self.set(fb5: value)
      value
    end

    # Filter bits
    def fb6 : Bool
      @value.bits_set?(0x40_u32)
    end

    # Filter bits
    def self.fb6 : Bool
      value.fb6
    end

    # Filter bits
    def self.fb6=(value : Bool) : Bool
      self.set(fb6: value)
      value
    end

    # Filter bits
    def fb7 : Bool
      @value.bits_set?(0x80_u32)
    end

    # Filter bits
    def self.fb7 : Bool
      value.fb7
    end

    # Filter bits
    def self.fb7=(value : Bool) : Bool
      self.set(fb7: value)
      value
    end

    # Filter bits
    def fb8 : Bool
      @value.bits_set?(0x100_u32)
    end

    # Filter bits
    def self.fb8 : Bool
      value.fb8
    end

    # Filter bits
    def self.fb8=(value : Bool) : Bool
      self.set(fb8: value)
      value
    end

    # Filter bits
    def fb9 : Bool
      @value.bits_set?(0x200_u32)
    end

    # Filter bits
    def self.fb9 : Bool
      value.fb9
    end

    # Filter bits
    def self.fb9=(value : Bool) : Bool
      self.set(fb9: value)
      value
    end

    # Filter bits
    def fb10 : Bool
      @value.bits_set?(0x400_u32)
    end

    # Filter bits
    def self.fb10 : Bool
      value.fb10
    end

    # Filter bits
    def self.fb10=(value : Bool) : Bool
      self.set(fb10: value)
      value
    end

    # Filter bits
    def fb11 : Bool
      @value.bits_set?(0x800_u32)
    end

    # Filter bits
    def self.fb11 : Bool
      value.fb11
    end

    # Filter bits
    def self.fb11=(value : Bool) : Bool
      self.set(fb11: value)
      value
    end

    # Filter bits
    def fb12 : Bool
      @value.bits_set?(0x1000_u32)
    end

    # Filter bits
    def self.fb12 : Bool
      value.fb12
    end

    # Filter bits
    def self.fb12=(value : Bool) : Bool
      self.set(fb12: value)
      value
    end

    # Filter bits
    def fb13 : Bool
      @value.bits_set?(0x2000_u32)
    end

    # Filter bits
    def self.fb13 : Bool
      value.fb13
    end

    # Filter bits
    def self.fb13=(value : Bool) : Bool
      self.set(fb13: value)
      value
    end

    # Filter bits
    def fb14 : Bool
      @value.bits_set?(0x4000_u32)
    end

    # Filter bits
    def self.fb14 : Bool
      value.fb14
    end

    # Filter bits
    def self.fb14=(value : Bool) : Bool
      self.set(fb14: value)
      value
    end

    # Filter bits
    def fb15 : Bool
      @value.bits_set?(0x8000_u32)
    end

    # Filter bits
    def self.fb15 : Bool
      value.fb15
    end

    # Filter bits
    def self.fb15=(value : Bool) : Bool
      self.set(fb15: value)
      value
    end

    # Filter bits
    def fb16 : Bool
      @value.bits_set?(0x10000_u32)
    end

    # Filter bits
    def self.fb16 : Bool
      value.fb16
    end

    # Filter bits
    def self.fb16=(value : Bool) : Bool
      self.set(fb16: value)
      value
    end

    # Filter bits
    def fb17 : Bool
      @value.bits_set?(0x20000_u32)
    end

    # Filter bits
    def self.fb17 : Bool
      value.fb17
    end

    # Filter bits
    def self.fb17=(value : Bool) : Bool
      self.set(fb17: value)
      value
    end

    # Filter bits
    def fb18 : Bool
      @value.bits_set?(0x40000_u32)
    end

    # Filter bits
    def self.fb18 : Bool
      value.fb18
    end

    # Filter bits
    def self.fb18=(value : Bool) : Bool
      self.set(fb18: value)
      value
    end

    # Filter bits
    def fb19 : Bool
      @value.bits_set?(0x80000_u32)
    end

    # Filter bits
    def self.fb19 : Bool
      value.fb19
    end

    # Filter bits
    def self.fb19=(value : Bool) : Bool
      self.set(fb19: value)
      value
    end

    # Filter bits
    def fb20 : Bool
      @value.bits_set?(0x100000_u32)
    end

    # Filter bits
    def self.fb20 : Bool
      value.fb20
    end

    # Filter bits
    def self.fb20=(value : Bool) : Bool
      self.set(fb20: value)
      value
    end

    # Filter bits
    def fb21 : Bool
      @value.bits_set?(0x200000_u32)
    end

    # Filter bits
    def self.fb21 : Bool
      value.fb21
    end

    # Filter bits
    def self.fb21=(value : Bool) : Bool
      self.set(fb21: value)
      value
    end

    # Filter bits
    def fb22 : Bool
      @value.bits_set?(0x400000_u32)
    end

    # Filter bits
    def self.fb22 : Bool
      value.fb22
    end

    # Filter bits
    def self.fb22=(value : Bool) : Bool
      self.set(fb22: value)
      value
    end

    # Filter bits
    def fb23 : Bool
      @value.bits_set?(0x800000_u32)
    end

    # Filter bits
    def self.fb23 : Bool
      value.fb23
    end

    # Filter bits
    def self.fb23=(value : Bool) : Bool
      self.set(fb23: value)
      value
    end

    # Filter bits
    def fb24 : Bool
      @value.bits_set?(0x1000000_u32)
    end

    # Filter bits
    def self.fb24 : Bool
      value.fb24
    end

    # Filter bits
    def self.fb24=(value : Bool) : Bool
      self.set(fb24: value)
      value
    end

    # Filter bits
    def fb25 : Bool
      @value.bits_set?(0x2000000_u32)
    end

    # Filter bits
    def self.fb25 : Bool
      value.fb25
    end

    # Filter bits
    def self.fb25=(value : Bool) : Bool
      self.set(fb25: value)
      value
    end

    # Filter bits
    def fb26 : Bool
      @value.bits_set?(0x4000000_u32)
    end

    # Filter bits
    def self.fb26 : Bool
      value.fb26
    end

    # Filter bits
    def self.fb26=(value : Bool) : Bool
      self.set(fb26: value)
      value
    end

    # Filter bits
    def fb27 : Bool
      @value.bits_set?(0x8000000_u32)
    end

    # Filter bits
    def self.fb27 : Bool
      value.fb27
    end

    # Filter bits
    def self.fb27=(value : Bool) : Bool
      self.set(fb27: value)
      value
    end

    # Filter bits
    def fb28 : Bool
      @value.bits_set?(0x10000000_u32)
    end

    # Filter bits
    def self.fb28 : Bool
      value.fb28
    end

    # Filter bits
    def self.fb28=(value : Bool) : Bool
      self.set(fb28: value)
      value
    end

    # Filter bits
    def fb29 : Bool
      @value.bits_set?(0x20000000_u32)
    end

    # Filter bits
    def self.fb29 : Bool
      value.fb29
    end

    # Filter bits
    def self.fb29=(value : Bool) : Bool
      self.set(fb29: value)
      value
    end

    # Filter bits
    def fb30 : Bool
      @value.bits_set?(0x40000000_u32)
    end

    # Filter bits
    def self.fb30 : Bool
      value.fb30
    end

    # Filter bits
    def self.fb30=(value : Bool) : Bool
      self.set(fb30: value)
      value
    end

    # Filter bits
    def fb31 : Bool
      @value.bits_set?(0x80000000_u32)
    end

    # Filter bits
    def self.fb31 : Bool
      value.fb31
    end

    # Filter bits
    def self.fb31=(value : Bool) : Bool
      self.set(fb31: value)
      value
    end

    def copy_with(
      *,

      fb0 : Bool? = nil,

      fb1 : Bool? = nil,

      fb2 : Bool? = nil,

      fb3 : Bool? = nil,

      fb4 : Bool? = nil,

      fb5 : Bool? = nil,

      fb6 : Bool? = nil,

      fb7 : Bool? = nil,

      fb8 : Bool? = nil,

      fb9 : Bool? = nil,

      fb10 : Bool? = nil,

      fb11 : Bool? = nil,

      fb12 : Bool? = nil,

      fb13 : Bool? = nil,

      fb14 : Bool? = nil,

      fb15 : Bool? = nil,

      fb16 : Bool? = nil,

      fb17 : Bool? = nil,

      fb18 : Bool? = nil,

      fb19 : Bool? = nil,

      fb20 : Bool? = nil,

      fb21 : Bool? = nil,

      fb22 : Bool? = nil,

      fb23 : Bool? = nil,

      fb24 : Bool? = nil,

      fb25 : Bool? = nil,

      fb26 : Bool? = nil,

      fb27 : Bool? = nil,

      fb28 : Bool? = nil,

      fb29 : Bool? = nil,

      fb30 : Bool? = nil,

      fb31 : Bool? = nil
    ) : self
      value = @value

      unless fb0.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(fb0.to_int).&(0x1_u32) << 0
      end

      unless fb1.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(fb1.to_int).&(0x1_u32) << 1
      end

      unless fb2.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(fb2.to_int).&(0x1_u32) << 2
      end

      unless fb3.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(fb3.to_int).&(0x1_u32) << 3
      end

      unless fb4.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(fb4.to_int).&(0x1_u32) << 4
      end

      unless fb5.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(fb5.to_int).&(0x1_u32) << 5
      end

      unless fb6.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(fb6.to_int).&(0x1_u32) << 6
      end

      unless fb7.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(fb7.to_int).&(0x1_u32) << 7
      end

      unless fb8.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(fb8.to_int).&(0x1_u32) << 8
      end

      unless fb9.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(fb9.to_int).&(0x1_u32) << 9
      end

      unless fb10.nil?
        value = (value & 0xfffffbff_u32) |
                UInt32.new!(fb10.to_int).&(0x1_u32) << 10
      end

      unless fb11.nil?
        value = (value & 0xfffff7ff_u32) |
                UInt32.new!(fb11.to_int).&(0x1_u32) << 11
      end

      unless fb12.nil?
        value = (value & 0xffffefff_u32) |
                UInt32.new!(fb12.to_int).&(0x1_u32) << 12
      end

      unless fb13.nil?
        value = (value & 0xffffdfff_u32) |
                UInt32.new!(fb13.to_int).&(0x1_u32) << 13
      end

      unless fb14.nil?
        value = (value & 0xffffbfff_u32) |
                UInt32.new!(fb14.to_int).&(0x1_u32) << 14
      end

      unless fb15.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(fb15.to_int).&(0x1_u32) << 15
      end

      unless fb16.nil?
        value = (value & 0xfffeffff_u32) |
                UInt32.new!(fb16.to_int).&(0x1_u32) << 16
      end

      unless fb17.nil?
        value = (value & 0xfffdffff_u32) |
                UInt32.new!(fb17.to_int).&(0x1_u32) << 17
      end

      unless fb18.nil?
        value = (value & 0xfffbffff_u32) |
                UInt32.new!(fb18.to_int).&(0x1_u32) << 18
      end

      unless fb19.nil?
        value = (value & 0xfff7ffff_u32) |
                UInt32.new!(fb19.to_int).&(0x1_u32) << 19
      end

      unless fb20.nil?
        value = (value & 0xffefffff_u32) |
                UInt32.new!(fb20.to_int).&(0x1_u32) << 20
      end

      unless fb21.nil?
        value = (value & 0xffdfffff_u32) |
                UInt32.new!(fb21.to_int).&(0x1_u32) << 21
      end

      unless fb22.nil?
        value = (value & 0xffbfffff_u32) |
                UInt32.new!(fb22.to_int).&(0x1_u32) << 22
      end

      unless fb23.nil?
        value = (value & 0xff7fffff_u32) |
                UInt32.new!(fb23.to_int).&(0x1_u32) << 23
      end

      unless fb24.nil?
        value = (value & 0xfeffffff_u32) |
                UInt32.new!(fb24.to_int).&(0x1_u32) << 24
      end

      unless fb25.nil?
        value = (value & 0xfdffffff_u32) |
                UInt32.new!(fb25.to_int).&(0x1_u32) << 25
      end

      unless fb26.nil?
        value = (value & 0xfbffffff_u32) |
                UInt32.new!(fb26.to_int).&(0x1_u32) << 26
      end

      unless fb27.nil?
        value = (value & 0xf7ffffff_u32) |
                UInt32.new!(fb27.to_int).&(0x1_u32) << 27
      end

      unless fb28.nil?
        value = (value & 0xefffffff_u32) |
                UInt32.new!(fb28.to_int).&(0x1_u32) << 28
      end

      unless fb29.nil?
        value = (value & 0xdfffffff_u32) |
                UInt32.new!(fb29.to_int).&(0x1_u32) << 29
      end

      unless fb30.nil?
        value = (value & 0xbfffffff_u32) |
                UInt32.new!(fb30.to_int).&(0x1_u32) << 30
      end

      unless fb31.nil?
        value = (value & 0x7fffffff_u32) |
                UInt32.new!(fb31.to_int).&(0x1_u32) << 31
      end

      self.class.new(value)
    end

    def self.set(
      *,
      fb0 : Bool? = nil,
      fb1 : Bool? = nil,
      fb2 : Bool? = nil,
      fb3 : Bool? = nil,
      fb4 : Bool? = nil,
      fb5 : Bool? = nil,
      fb6 : Bool? = nil,
      fb7 : Bool? = nil,
      fb8 : Bool? = nil,
      fb9 : Bool? = nil,
      fb10 : Bool? = nil,
      fb11 : Bool? = nil,
      fb12 : Bool? = nil,
      fb13 : Bool? = nil,
      fb14 : Bool? = nil,
      fb15 : Bool? = nil,
      fb16 : Bool? = nil,
      fb17 : Bool? = nil,
      fb18 : Bool? = nil,
      fb19 : Bool? = nil,
      fb20 : Bool? = nil,
      fb21 : Bool? = nil,
      fb22 : Bool? = nil,
      fb23 : Bool? = nil,
      fb24 : Bool? = nil,
      fb25 : Bool? = nil,
      fb26 : Bool? = nil,
      fb27 : Bool? = nil,
      fb28 : Bool? = nil,
      fb29 : Bool? = nil,
      fb30 : Bool? = nil,
      fb31 : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        fb0: fb0,
        fb1: fb1,
        fb2: fb2,
        fb3: fb3,
        fb4: fb4,
        fb5: fb5,
        fb6: fb6,
        fb7: fb7,
        fb8: fb8,
        fb9: fb9,
        fb10: fb10,
        fb11: fb11,
        fb12: fb12,
        fb13: fb13,
        fb14: fb14,
        fb15: fb15,
        fb16: fb16,
        fb17: fb17,
        fb18: fb18,
        fb19: fb19,
        fb20: fb20,
        fb21: fb21,
        fb22: fb22,
        fb23: fb23,
        fb24: fb24,
        fb25: fb25,
        fb26: fb26,
        fb27: fb27,
        fb28: fb28,
        fb29: fb29,
        fb30: fb30,
        fb31: fb31,
      )
    end
  end # struct

  # Filter bank 9 register 1
  struct F9R1
    ADDRESS = BASE_ADDRESS + 0x288_u64

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

    # Filter bits
    def fb0 : Bool
      @value.bits_set?(0x1_u32)
    end

    # Filter bits
    def self.fb0 : Bool
      value.fb0
    end

    # Filter bits
    def self.fb0=(value : Bool) : Bool
      self.set(fb0: value)
      value
    end

    # Filter bits
    def fb1 : Bool
      @value.bits_set?(0x2_u32)
    end

    # Filter bits
    def self.fb1 : Bool
      value.fb1
    end

    # Filter bits
    def self.fb1=(value : Bool) : Bool
      self.set(fb1: value)
      value
    end

    # Filter bits
    def fb2 : Bool
      @value.bits_set?(0x4_u32)
    end

    # Filter bits
    def self.fb2 : Bool
      value.fb2
    end

    # Filter bits
    def self.fb2=(value : Bool) : Bool
      self.set(fb2: value)
      value
    end

    # Filter bits
    def fb3 : Bool
      @value.bits_set?(0x8_u32)
    end

    # Filter bits
    def self.fb3 : Bool
      value.fb3
    end

    # Filter bits
    def self.fb3=(value : Bool) : Bool
      self.set(fb3: value)
      value
    end

    # Filter bits
    def fb4 : Bool
      @value.bits_set?(0x10_u32)
    end

    # Filter bits
    def self.fb4 : Bool
      value.fb4
    end

    # Filter bits
    def self.fb4=(value : Bool) : Bool
      self.set(fb4: value)
      value
    end

    # Filter bits
    def fb5 : Bool
      @value.bits_set?(0x20_u32)
    end

    # Filter bits
    def self.fb5 : Bool
      value.fb5
    end

    # Filter bits
    def self.fb5=(value : Bool) : Bool
      self.set(fb5: value)
      value
    end

    # Filter bits
    def fb6 : Bool
      @value.bits_set?(0x40_u32)
    end

    # Filter bits
    def self.fb6 : Bool
      value.fb6
    end

    # Filter bits
    def self.fb6=(value : Bool) : Bool
      self.set(fb6: value)
      value
    end

    # Filter bits
    def fb7 : Bool
      @value.bits_set?(0x80_u32)
    end

    # Filter bits
    def self.fb7 : Bool
      value.fb7
    end

    # Filter bits
    def self.fb7=(value : Bool) : Bool
      self.set(fb7: value)
      value
    end

    # Filter bits
    def fb8 : Bool
      @value.bits_set?(0x100_u32)
    end

    # Filter bits
    def self.fb8 : Bool
      value.fb8
    end

    # Filter bits
    def self.fb8=(value : Bool) : Bool
      self.set(fb8: value)
      value
    end

    # Filter bits
    def fb9 : Bool
      @value.bits_set?(0x200_u32)
    end

    # Filter bits
    def self.fb9 : Bool
      value.fb9
    end

    # Filter bits
    def self.fb9=(value : Bool) : Bool
      self.set(fb9: value)
      value
    end

    # Filter bits
    def fb10 : Bool
      @value.bits_set?(0x400_u32)
    end

    # Filter bits
    def self.fb10 : Bool
      value.fb10
    end

    # Filter bits
    def self.fb10=(value : Bool) : Bool
      self.set(fb10: value)
      value
    end

    # Filter bits
    def fb11 : Bool
      @value.bits_set?(0x800_u32)
    end

    # Filter bits
    def self.fb11 : Bool
      value.fb11
    end

    # Filter bits
    def self.fb11=(value : Bool) : Bool
      self.set(fb11: value)
      value
    end

    # Filter bits
    def fb12 : Bool
      @value.bits_set?(0x1000_u32)
    end

    # Filter bits
    def self.fb12 : Bool
      value.fb12
    end

    # Filter bits
    def self.fb12=(value : Bool) : Bool
      self.set(fb12: value)
      value
    end

    # Filter bits
    def fb13 : Bool
      @value.bits_set?(0x2000_u32)
    end

    # Filter bits
    def self.fb13 : Bool
      value.fb13
    end

    # Filter bits
    def self.fb13=(value : Bool) : Bool
      self.set(fb13: value)
      value
    end

    # Filter bits
    def fb14 : Bool
      @value.bits_set?(0x4000_u32)
    end

    # Filter bits
    def self.fb14 : Bool
      value.fb14
    end

    # Filter bits
    def self.fb14=(value : Bool) : Bool
      self.set(fb14: value)
      value
    end

    # Filter bits
    def fb15 : Bool
      @value.bits_set?(0x8000_u32)
    end

    # Filter bits
    def self.fb15 : Bool
      value.fb15
    end

    # Filter bits
    def self.fb15=(value : Bool) : Bool
      self.set(fb15: value)
      value
    end

    # Filter bits
    def fb16 : Bool
      @value.bits_set?(0x10000_u32)
    end

    # Filter bits
    def self.fb16 : Bool
      value.fb16
    end

    # Filter bits
    def self.fb16=(value : Bool) : Bool
      self.set(fb16: value)
      value
    end

    # Filter bits
    def fb17 : Bool
      @value.bits_set?(0x20000_u32)
    end

    # Filter bits
    def self.fb17 : Bool
      value.fb17
    end

    # Filter bits
    def self.fb17=(value : Bool) : Bool
      self.set(fb17: value)
      value
    end

    # Filter bits
    def fb18 : Bool
      @value.bits_set?(0x40000_u32)
    end

    # Filter bits
    def self.fb18 : Bool
      value.fb18
    end

    # Filter bits
    def self.fb18=(value : Bool) : Bool
      self.set(fb18: value)
      value
    end

    # Filter bits
    def fb19 : Bool
      @value.bits_set?(0x80000_u32)
    end

    # Filter bits
    def self.fb19 : Bool
      value.fb19
    end

    # Filter bits
    def self.fb19=(value : Bool) : Bool
      self.set(fb19: value)
      value
    end

    # Filter bits
    def fb20 : Bool
      @value.bits_set?(0x100000_u32)
    end

    # Filter bits
    def self.fb20 : Bool
      value.fb20
    end

    # Filter bits
    def self.fb20=(value : Bool) : Bool
      self.set(fb20: value)
      value
    end

    # Filter bits
    def fb21 : Bool
      @value.bits_set?(0x200000_u32)
    end

    # Filter bits
    def self.fb21 : Bool
      value.fb21
    end

    # Filter bits
    def self.fb21=(value : Bool) : Bool
      self.set(fb21: value)
      value
    end

    # Filter bits
    def fb22 : Bool
      @value.bits_set?(0x400000_u32)
    end

    # Filter bits
    def self.fb22 : Bool
      value.fb22
    end

    # Filter bits
    def self.fb22=(value : Bool) : Bool
      self.set(fb22: value)
      value
    end

    # Filter bits
    def fb23 : Bool
      @value.bits_set?(0x800000_u32)
    end

    # Filter bits
    def self.fb23 : Bool
      value.fb23
    end

    # Filter bits
    def self.fb23=(value : Bool) : Bool
      self.set(fb23: value)
      value
    end

    # Filter bits
    def fb24 : Bool
      @value.bits_set?(0x1000000_u32)
    end

    # Filter bits
    def self.fb24 : Bool
      value.fb24
    end

    # Filter bits
    def self.fb24=(value : Bool) : Bool
      self.set(fb24: value)
      value
    end

    # Filter bits
    def fb25 : Bool
      @value.bits_set?(0x2000000_u32)
    end

    # Filter bits
    def self.fb25 : Bool
      value.fb25
    end

    # Filter bits
    def self.fb25=(value : Bool) : Bool
      self.set(fb25: value)
      value
    end

    # Filter bits
    def fb26 : Bool
      @value.bits_set?(0x4000000_u32)
    end

    # Filter bits
    def self.fb26 : Bool
      value.fb26
    end

    # Filter bits
    def self.fb26=(value : Bool) : Bool
      self.set(fb26: value)
      value
    end

    # Filter bits
    def fb27 : Bool
      @value.bits_set?(0x8000000_u32)
    end

    # Filter bits
    def self.fb27 : Bool
      value.fb27
    end

    # Filter bits
    def self.fb27=(value : Bool) : Bool
      self.set(fb27: value)
      value
    end

    # Filter bits
    def fb28 : Bool
      @value.bits_set?(0x10000000_u32)
    end

    # Filter bits
    def self.fb28 : Bool
      value.fb28
    end

    # Filter bits
    def self.fb28=(value : Bool) : Bool
      self.set(fb28: value)
      value
    end

    # Filter bits
    def fb29 : Bool
      @value.bits_set?(0x20000000_u32)
    end

    # Filter bits
    def self.fb29 : Bool
      value.fb29
    end

    # Filter bits
    def self.fb29=(value : Bool) : Bool
      self.set(fb29: value)
      value
    end

    # Filter bits
    def fb30 : Bool
      @value.bits_set?(0x40000000_u32)
    end

    # Filter bits
    def self.fb30 : Bool
      value.fb30
    end

    # Filter bits
    def self.fb30=(value : Bool) : Bool
      self.set(fb30: value)
      value
    end

    # Filter bits
    def fb31 : Bool
      @value.bits_set?(0x80000000_u32)
    end

    # Filter bits
    def self.fb31 : Bool
      value.fb31
    end

    # Filter bits
    def self.fb31=(value : Bool) : Bool
      self.set(fb31: value)
      value
    end

    def copy_with(
      *,

      fb0 : Bool? = nil,

      fb1 : Bool? = nil,

      fb2 : Bool? = nil,

      fb3 : Bool? = nil,

      fb4 : Bool? = nil,

      fb5 : Bool? = nil,

      fb6 : Bool? = nil,

      fb7 : Bool? = nil,

      fb8 : Bool? = nil,

      fb9 : Bool? = nil,

      fb10 : Bool? = nil,

      fb11 : Bool? = nil,

      fb12 : Bool? = nil,

      fb13 : Bool? = nil,

      fb14 : Bool? = nil,

      fb15 : Bool? = nil,

      fb16 : Bool? = nil,

      fb17 : Bool? = nil,

      fb18 : Bool? = nil,

      fb19 : Bool? = nil,

      fb20 : Bool? = nil,

      fb21 : Bool? = nil,

      fb22 : Bool? = nil,

      fb23 : Bool? = nil,

      fb24 : Bool? = nil,

      fb25 : Bool? = nil,

      fb26 : Bool? = nil,

      fb27 : Bool? = nil,

      fb28 : Bool? = nil,

      fb29 : Bool? = nil,

      fb30 : Bool? = nil,

      fb31 : Bool? = nil
    ) : self
      value = @value

      unless fb0.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(fb0.to_int).&(0x1_u32) << 0
      end

      unless fb1.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(fb1.to_int).&(0x1_u32) << 1
      end

      unless fb2.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(fb2.to_int).&(0x1_u32) << 2
      end

      unless fb3.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(fb3.to_int).&(0x1_u32) << 3
      end

      unless fb4.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(fb4.to_int).&(0x1_u32) << 4
      end

      unless fb5.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(fb5.to_int).&(0x1_u32) << 5
      end

      unless fb6.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(fb6.to_int).&(0x1_u32) << 6
      end

      unless fb7.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(fb7.to_int).&(0x1_u32) << 7
      end

      unless fb8.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(fb8.to_int).&(0x1_u32) << 8
      end

      unless fb9.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(fb9.to_int).&(0x1_u32) << 9
      end

      unless fb10.nil?
        value = (value & 0xfffffbff_u32) |
                UInt32.new!(fb10.to_int).&(0x1_u32) << 10
      end

      unless fb11.nil?
        value = (value & 0xfffff7ff_u32) |
                UInt32.new!(fb11.to_int).&(0x1_u32) << 11
      end

      unless fb12.nil?
        value = (value & 0xffffefff_u32) |
                UInt32.new!(fb12.to_int).&(0x1_u32) << 12
      end

      unless fb13.nil?
        value = (value & 0xffffdfff_u32) |
                UInt32.new!(fb13.to_int).&(0x1_u32) << 13
      end

      unless fb14.nil?
        value = (value & 0xffffbfff_u32) |
                UInt32.new!(fb14.to_int).&(0x1_u32) << 14
      end

      unless fb15.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(fb15.to_int).&(0x1_u32) << 15
      end

      unless fb16.nil?
        value = (value & 0xfffeffff_u32) |
                UInt32.new!(fb16.to_int).&(0x1_u32) << 16
      end

      unless fb17.nil?
        value = (value & 0xfffdffff_u32) |
                UInt32.new!(fb17.to_int).&(0x1_u32) << 17
      end

      unless fb18.nil?
        value = (value & 0xfffbffff_u32) |
                UInt32.new!(fb18.to_int).&(0x1_u32) << 18
      end

      unless fb19.nil?
        value = (value & 0xfff7ffff_u32) |
                UInt32.new!(fb19.to_int).&(0x1_u32) << 19
      end

      unless fb20.nil?
        value = (value & 0xffefffff_u32) |
                UInt32.new!(fb20.to_int).&(0x1_u32) << 20
      end

      unless fb21.nil?
        value = (value & 0xffdfffff_u32) |
                UInt32.new!(fb21.to_int).&(0x1_u32) << 21
      end

      unless fb22.nil?
        value = (value & 0xffbfffff_u32) |
                UInt32.new!(fb22.to_int).&(0x1_u32) << 22
      end

      unless fb23.nil?
        value = (value & 0xff7fffff_u32) |
                UInt32.new!(fb23.to_int).&(0x1_u32) << 23
      end

      unless fb24.nil?
        value = (value & 0xfeffffff_u32) |
                UInt32.new!(fb24.to_int).&(0x1_u32) << 24
      end

      unless fb25.nil?
        value = (value & 0xfdffffff_u32) |
                UInt32.new!(fb25.to_int).&(0x1_u32) << 25
      end

      unless fb26.nil?
        value = (value & 0xfbffffff_u32) |
                UInt32.new!(fb26.to_int).&(0x1_u32) << 26
      end

      unless fb27.nil?
        value = (value & 0xf7ffffff_u32) |
                UInt32.new!(fb27.to_int).&(0x1_u32) << 27
      end

      unless fb28.nil?
        value = (value & 0xefffffff_u32) |
                UInt32.new!(fb28.to_int).&(0x1_u32) << 28
      end

      unless fb29.nil?
        value = (value & 0xdfffffff_u32) |
                UInt32.new!(fb29.to_int).&(0x1_u32) << 29
      end

      unless fb30.nil?
        value = (value & 0xbfffffff_u32) |
                UInt32.new!(fb30.to_int).&(0x1_u32) << 30
      end

      unless fb31.nil?
        value = (value & 0x7fffffff_u32) |
                UInt32.new!(fb31.to_int).&(0x1_u32) << 31
      end

      self.class.new(value)
    end

    def self.set(
      *,
      fb0 : Bool? = nil,
      fb1 : Bool? = nil,
      fb2 : Bool? = nil,
      fb3 : Bool? = nil,
      fb4 : Bool? = nil,
      fb5 : Bool? = nil,
      fb6 : Bool? = nil,
      fb7 : Bool? = nil,
      fb8 : Bool? = nil,
      fb9 : Bool? = nil,
      fb10 : Bool? = nil,
      fb11 : Bool? = nil,
      fb12 : Bool? = nil,
      fb13 : Bool? = nil,
      fb14 : Bool? = nil,
      fb15 : Bool? = nil,
      fb16 : Bool? = nil,
      fb17 : Bool? = nil,
      fb18 : Bool? = nil,
      fb19 : Bool? = nil,
      fb20 : Bool? = nil,
      fb21 : Bool? = nil,
      fb22 : Bool? = nil,
      fb23 : Bool? = nil,
      fb24 : Bool? = nil,
      fb25 : Bool? = nil,
      fb26 : Bool? = nil,
      fb27 : Bool? = nil,
      fb28 : Bool? = nil,
      fb29 : Bool? = nil,
      fb30 : Bool? = nil,
      fb31 : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        fb0: fb0,
        fb1: fb1,
        fb2: fb2,
        fb3: fb3,
        fb4: fb4,
        fb5: fb5,
        fb6: fb6,
        fb7: fb7,
        fb8: fb8,
        fb9: fb9,
        fb10: fb10,
        fb11: fb11,
        fb12: fb12,
        fb13: fb13,
        fb14: fb14,
        fb15: fb15,
        fb16: fb16,
        fb17: fb17,
        fb18: fb18,
        fb19: fb19,
        fb20: fb20,
        fb21: fb21,
        fb22: fb22,
        fb23: fb23,
        fb24: fb24,
        fb25: fb25,
        fb26: fb26,
        fb27: fb27,
        fb28: fb28,
        fb29: fb29,
        fb30: fb30,
        fb31: fb31,
      )
    end
  end # struct

  # Filter bank 9 register 2
  struct F9R2
    ADDRESS = BASE_ADDRESS + 0x28c_u64

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

    # Filter bits
    def fb0 : Bool
      @value.bits_set?(0x1_u32)
    end

    # Filter bits
    def self.fb0 : Bool
      value.fb0
    end

    # Filter bits
    def self.fb0=(value : Bool) : Bool
      self.set(fb0: value)
      value
    end

    # Filter bits
    def fb1 : Bool
      @value.bits_set?(0x2_u32)
    end

    # Filter bits
    def self.fb1 : Bool
      value.fb1
    end

    # Filter bits
    def self.fb1=(value : Bool) : Bool
      self.set(fb1: value)
      value
    end

    # Filter bits
    def fb2 : Bool
      @value.bits_set?(0x4_u32)
    end

    # Filter bits
    def self.fb2 : Bool
      value.fb2
    end

    # Filter bits
    def self.fb2=(value : Bool) : Bool
      self.set(fb2: value)
      value
    end

    # Filter bits
    def fb3 : Bool
      @value.bits_set?(0x8_u32)
    end

    # Filter bits
    def self.fb3 : Bool
      value.fb3
    end

    # Filter bits
    def self.fb3=(value : Bool) : Bool
      self.set(fb3: value)
      value
    end

    # Filter bits
    def fb4 : Bool
      @value.bits_set?(0x10_u32)
    end

    # Filter bits
    def self.fb4 : Bool
      value.fb4
    end

    # Filter bits
    def self.fb4=(value : Bool) : Bool
      self.set(fb4: value)
      value
    end

    # Filter bits
    def fb5 : Bool
      @value.bits_set?(0x20_u32)
    end

    # Filter bits
    def self.fb5 : Bool
      value.fb5
    end

    # Filter bits
    def self.fb5=(value : Bool) : Bool
      self.set(fb5: value)
      value
    end

    # Filter bits
    def fb6 : Bool
      @value.bits_set?(0x40_u32)
    end

    # Filter bits
    def self.fb6 : Bool
      value.fb6
    end

    # Filter bits
    def self.fb6=(value : Bool) : Bool
      self.set(fb6: value)
      value
    end

    # Filter bits
    def fb7 : Bool
      @value.bits_set?(0x80_u32)
    end

    # Filter bits
    def self.fb7 : Bool
      value.fb7
    end

    # Filter bits
    def self.fb7=(value : Bool) : Bool
      self.set(fb7: value)
      value
    end

    # Filter bits
    def fb8 : Bool
      @value.bits_set?(0x100_u32)
    end

    # Filter bits
    def self.fb8 : Bool
      value.fb8
    end

    # Filter bits
    def self.fb8=(value : Bool) : Bool
      self.set(fb8: value)
      value
    end

    # Filter bits
    def fb9 : Bool
      @value.bits_set?(0x200_u32)
    end

    # Filter bits
    def self.fb9 : Bool
      value.fb9
    end

    # Filter bits
    def self.fb9=(value : Bool) : Bool
      self.set(fb9: value)
      value
    end

    # Filter bits
    def fb10 : Bool
      @value.bits_set?(0x400_u32)
    end

    # Filter bits
    def self.fb10 : Bool
      value.fb10
    end

    # Filter bits
    def self.fb10=(value : Bool) : Bool
      self.set(fb10: value)
      value
    end

    # Filter bits
    def fb11 : Bool
      @value.bits_set?(0x800_u32)
    end

    # Filter bits
    def self.fb11 : Bool
      value.fb11
    end

    # Filter bits
    def self.fb11=(value : Bool) : Bool
      self.set(fb11: value)
      value
    end

    # Filter bits
    def fb12 : Bool
      @value.bits_set?(0x1000_u32)
    end

    # Filter bits
    def self.fb12 : Bool
      value.fb12
    end

    # Filter bits
    def self.fb12=(value : Bool) : Bool
      self.set(fb12: value)
      value
    end

    # Filter bits
    def fb13 : Bool
      @value.bits_set?(0x2000_u32)
    end

    # Filter bits
    def self.fb13 : Bool
      value.fb13
    end

    # Filter bits
    def self.fb13=(value : Bool) : Bool
      self.set(fb13: value)
      value
    end

    # Filter bits
    def fb14 : Bool
      @value.bits_set?(0x4000_u32)
    end

    # Filter bits
    def self.fb14 : Bool
      value.fb14
    end

    # Filter bits
    def self.fb14=(value : Bool) : Bool
      self.set(fb14: value)
      value
    end

    # Filter bits
    def fb15 : Bool
      @value.bits_set?(0x8000_u32)
    end

    # Filter bits
    def self.fb15 : Bool
      value.fb15
    end

    # Filter bits
    def self.fb15=(value : Bool) : Bool
      self.set(fb15: value)
      value
    end

    # Filter bits
    def fb16 : Bool
      @value.bits_set?(0x10000_u32)
    end

    # Filter bits
    def self.fb16 : Bool
      value.fb16
    end

    # Filter bits
    def self.fb16=(value : Bool) : Bool
      self.set(fb16: value)
      value
    end

    # Filter bits
    def fb17 : Bool
      @value.bits_set?(0x20000_u32)
    end

    # Filter bits
    def self.fb17 : Bool
      value.fb17
    end

    # Filter bits
    def self.fb17=(value : Bool) : Bool
      self.set(fb17: value)
      value
    end

    # Filter bits
    def fb18 : Bool
      @value.bits_set?(0x40000_u32)
    end

    # Filter bits
    def self.fb18 : Bool
      value.fb18
    end

    # Filter bits
    def self.fb18=(value : Bool) : Bool
      self.set(fb18: value)
      value
    end

    # Filter bits
    def fb19 : Bool
      @value.bits_set?(0x80000_u32)
    end

    # Filter bits
    def self.fb19 : Bool
      value.fb19
    end

    # Filter bits
    def self.fb19=(value : Bool) : Bool
      self.set(fb19: value)
      value
    end

    # Filter bits
    def fb20 : Bool
      @value.bits_set?(0x100000_u32)
    end

    # Filter bits
    def self.fb20 : Bool
      value.fb20
    end

    # Filter bits
    def self.fb20=(value : Bool) : Bool
      self.set(fb20: value)
      value
    end

    # Filter bits
    def fb21 : Bool
      @value.bits_set?(0x200000_u32)
    end

    # Filter bits
    def self.fb21 : Bool
      value.fb21
    end

    # Filter bits
    def self.fb21=(value : Bool) : Bool
      self.set(fb21: value)
      value
    end

    # Filter bits
    def fb22 : Bool
      @value.bits_set?(0x400000_u32)
    end

    # Filter bits
    def self.fb22 : Bool
      value.fb22
    end

    # Filter bits
    def self.fb22=(value : Bool) : Bool
      self.set(fb22: value)
      value
    end

    # Filter bits
    def fb23 : Bool
      @value.bits_set?(0x800000_u32)
    end

    # Filter bits
    def self.fb23 : Bool
      value.fb23
    end

    # Filter bits
    def self.fb23=(value : Bool) : Bool
      self.set(fb23: value)
      value
    end

    # Filter bits
    def fb24 : Bool
      @value.bits_set?(0x1000000_u32)
    end

    # Filter bits
    def self.fb24 : Bool
      value.fb24
    end

    # Filter bits
    def self.fb24=(value : Bool) : Bool
      self.set(fb24: value)
      value
    end

    # Filter bits
    def fb25 : Bool
      @value.bits_set?(0x2000000_u32)
    end

    # Filter bits
    def self.fb25 : Bool
      value.fb25
    end

    # Filter bits
    def self.fb25=(value : Bool) : Bool
      self.set(fb25: value)
      value
    end

    # Filter bits
    def fb26 : Bool
      @value.bits_set?(0x4000000_u32)
    end

    # Filter bits
    def self.fb26 : Bool
      value.fb26
    end

    # Filter bits
    def self.fb26=(value : Bool) : Bool
      self.set(fb26: value)
      value
    end

    # Filter bits
    def fb27 : Bool
      @value.bits_set?(0x8000000_u32)
    end

    # Filter bits
    def self.fb27 : Bool
      value.fb27
    end

    # Filter bits
    def self.fb27=(value : Bool) : Bool
      self.set(fb27: value)
      value
    end

    # Filter bits
    def fb28 : Bool
      @value.bits_set?(0x10000000_u32)
    end

    # Filter bits
    def self.fb28 : Bool
      value.fb28
    end

    # Filter bits
    def self.fb28=(value : Bool) : Bool
      self.set(fb28: value)
      value
    end

    # Filter bits
    def fb29 : Bool
      @value.bits_set?(0x20000000_u32)
    end

    # Filter bits
    def self.fb29 : Bool
      value.fb29
    end

    # Filter bits
    def self.fb29=(value : Bool) : Bool
      self.set(fb29: value)
      value
    end

    # Filter bits
    def fb30 : Bool
      @value.bits_set?(0x40000000_u32)
    end

    # Filter bits
    def self.fb30 : Bool
      value.fb30
    end

    # Filter bits
    def self.fb30=(value : Bool) : Bool
      self.set(fb30: value)
      value
    end

    # Filter bits
    def fb31 : Bool
      @value.bits_set?(0x80000000_u32)
    end

    # Filter bits
    def self.fb31 : Bool
      value.fb31
    end

    # Filter bits
    def self.fb31=(value : Bool) : Bool
      self.set(fb31: value)
      value
    end

    def copy_with(
      *,

      fb0 : Bool? = nil,

      fb1 : Bool? = nil,

      fb2 : Bool? = nil,

      fb3 : Bool? = nil,

      fb4 : Bool? = nil,

      fb5 : Bool? = nil,

      fb6 : Bool? = nil,

      fb7 : Bool? = nil,

      fb8 : Bool? = nil,

      fb9 : Bool? = nil,

      fb10 : Bool? = nil,

      fb11 : Bool? = nil,

      fb12 : Bool? = nil,

      fb13 : Bool? = nil,

      fb14 : Bool? = nil,

      fb15 : Bool? = nil,

      fb16 : Bool? = nil,

      fb17 : Bool? = nil,

      fb18 : Bool? = nil,

      fb19 : Bool? = nil,

      fb20 : Bool? = nil,

      fb21 : Bool? = nil,

      fb22 : Bool? = nil,

      fb23 : Bool? = nil,

      fb24 : Bool? = nil,

      fb25 : Bool? = nil,

      fb26 : Bool? = nil,

      fb27 : Bool? = nil,

      fb28 : Bool? = nil,

      fb29 : Bool? = nil,

      fb30 : Bool? = nil,

      fb31 : Bool? = nil
    ) : self
      value = @value

      unless fb0.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(fb0.to_int).&(0x1_u32) << 0
      end

      unless fb1.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(fb1.to_int).&(0x1_u32) << 1
      end

      unless fb2.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(fb2.to_int).&(0x1_u32) << 2
      end

      unless fb3.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(fb3.to_int).&(0x1_u32) << 3
      end

      unless fb4.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(fb4.to_int).&(0x1_u32) << 4
      end

      unless fb5.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(fb5.to_int).&(0x1_u32) << 5
      end

      unless fb6.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(fb6.to_int).&(0x1_u32) << 6
      end

      unless fb7.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(fb7.to_int).&(0x1_u32) << 7
      end

      unless fb8.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(fb8.to_int).&(0x1_u32) << 8
      end

      unless fb9.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(fb9.to_int).&(0x1_u32) << 9
      end

      unless fb10.nil?
        value = (value & 0xfffffbff_u32) |
                UInt32.new!(fb10.to_int).&(0x1_u32) << 10
      end

      unless fb11.nil?
        value = (value & 0xfffff7ff_u32) |
                UInt32.new!(fb11.to_int).&(0x1_u32) << 11
      end

      unless fb12.nil?
        value = (value & 0xffffefff_u32) |
                UInt32.new!(fb12.to_int).&(0x1_u32) << 12
      end

      unless fb13.nil?
        value = (value & 0xffffdfff_u32) |
                UInt32.new!(fb13.to_int).&(0x1_u32) << 13
      end

      unless fb14.nil?
        value = (value & 0xffffbfff_u32) |
                UInt32.new!(fb14.to_int).&(0x1_u32) << 14
      end

      unless fb15.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(fb15.to_int).&(0x1_u32) << 15
      end

      unless fb16.nil?
        value = (value & 0xfffeffff_u32) |
                UInt32.new!(fb16.to_int).&(0x1_u32) << 16
      end

      unless fb17.nil?
        value = (value & 0xfffdffff_u32) |
                UInt32.new!(fb17.to_int).&(0x1_u32) << 17
      end

      unless fb18.nil?
        value = (value & 0xfffbffff_u32) |
                UInt32.new!(fb18.to_int).&(0x1_u32) << 18
      end

      unless fb19.nil?
        value = (value & 0xfff7ffff_u32) |
                UInt32.new!(fb19.to_int).&(0x1_u32) << 19
      end

      unless fb20.nil?
        value = (value & 0xffefffff_u32) |
                UInt32.new!(fb20.to_int).&(0x1_u32) << 20
      end

      unless fb21.nil?
        value = (value & 0xffdfffff_u32) |
                UInt32.new!(fb21.to_int).&(0x1_u32) << 21
      end

      unless fb22.nil?
        value = (value & 0xffbfffff_u32) |
                UInt32.new!(fb22.to_int).&(0x1_u32) << 22
      end

      unless fb23.nil?
        value = (value & 0xff7fffff_u32) |
                UInt32.new!(fb23.to_int).&(0x1_u32) << 23
      end

      unless fb24.nil?
        value = (value & 0xfeffffff_u32) |
                UInt32.new!(fb24.to_int).&(0x1_u32) << 24
      end

      unless fb25.nil?
        value = (value & 0xfdffffff_u32) |
                UInt32.new!(fb25.to_int).&(0x1_u32) << 25
      end

      unless fb26.nil?
        value = (value & 0xfbffffff_u32) |
                UInt32.new!(fb26.to_int).&(0x1_u32) << 26
      end

      unless fb27.nil?
        value = (value & 0xf7ffffff_u32) |
                UInt32.new!(fb27.to_int).&(0x1_u32) << 27
      end

      unless fb28.nil?
        value = (value & 0xefffffff_u32) |
                UInt32.new!(fb28.to_int).&(0x1_u32) << 28
      end

      unless fb29.nil?
        value = (value & 0xdfffffff_u32) |
                UInt32.new!(fb29.to_int).&(0x1_u32) << 29
      end

      unless fb30.nil?
        value = (value & 0xbfffffff_u32) |
                UInt32.new!(fb30.to_int).&(0x1_u32) << 30
      end

      unless fb31.nil?
        value = (value & 0x7fffffff_u32) |
                UInt32.new!(fb31.to_int).&(0x1_u32) << 31
      end

      self.class.new(value)
    end

    def self.set(
      *,
      fb0 : Bool? = nil,
      fb1 : Bool? = nil,
      fb2 : Bool? = nil,
      fb3 : Bool? = nil,
      fb4 : Bool? = nil,
      fb5 : Bool? = nil,
      fb6 : Bool? = nil,
      fb7 : Bool? = nil,
      fb8 : Bool? = nil,
      fb9 : Bool? = nil,
      fb10 : Bool? = nil,
      fb11 : Bool? = nil,
      fb12 : Bool? = nil,
      fb13 : Bool? = nil,
      fb14 : Bool? = nil,
      fb15 : Bool? = nil,
      fb16 : Bool? = nil,
      fb17 : Bool? = nil,
      fb18 : Bool? = nil,
      fb19 : Bool? = nil,
      fb20 : Bool? = nil,
      fb21 : Bool? = nil,
      fb22 : Bool? = nil,
      fb23 : Bool? = nil,
      fb24 : Bool? = nil,
      fb25 : Bool? = nil,
      fb26 : Bool? = nil,
      fb27 : Bool? = nil,
      fb28 : Bool? = nil,
      fb29 : Bool? = nil,
      fb30 : Bool? = nil,
      fb31 : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        fb0: fb0,
        fb1: fb1,
        fb2: fb2,
        fb3: fb3,
        fb4: fb4,
        fb5: fb5,
        fb6: fb6,
        fb7: fb7,
        fb8: fb8,
        fb9: fb9,
        fb10: fb10,
        fb11: fb11,
        fb12: fb12,
        fb13: fb13,
        fb14: fb14,
        fb15: fb15,
        fb16: fb16,
        fb17: fb17,
        fb18: fb18,
        fb19: fb19,
        fb20: fb20,
        fb21: fb21,
        fb22: fb22,
        fb23: fb23,
        fb24: fb24,
        fb25: fb25,
        fb26: fb26,
        fb27: fb27,
        fb28: fb28,
        fb29: fb29,
        fb30: fb30,
        fb31: fb31,
      )
    end
  end # struct

  # Filter bank 10 register 1
  struct F10R1
    ADDRESS = BASE_ADDRESS + 0x290_u64

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

    # Filter bits
    def fb0 : Bool
      @value.bits_set?(0x1_u32)
    end

    # Filter bits
    def self.fb0 : Bool
      value.fb0
    end

    # Filter bits
    def self.fb0=(value : Bool) : Bool
      self.set(fb0: value)
      value
    end

    # Filter bits
    def fb1 : Bool
      @value.bits_set?(0x2_u32)
    end

    # Filter bits
    def self.fb1 : Bool
      value.fb1
    end

    # Filter bits
    def self.fb1=(value : Bool) : Bool
      self.set(fb1: value)
      value
    end

    # Filter bits
    def fb2 : Bool
      @value.bits_set?(0x4_u32)
    end

    # Filter bits
    def self.fb2 : Bool
      value.fb2
    end

    # Filter bits
    def self.fb2=(value : Bool) : Bool
      self.set(fb2: value)
      value
    end

    # Filter bits
    def fb3 : Bool
      @value.bits_set?(0x8_u32)
    end

    # Filter bits
    def self.fb3 : Bool
      value.fb3
    end

    # Filter bits
    def self.fb3=(value : Bool) : Bool
      self.set(fb3: value)
      value
    end

    # Filter bits
    def fb4 : Bool
      @value.bits_set?(0x10_u32)
    end

    # Filter bits
    def self.fb4 : Bool
      value.fb4
    end

    # Filter bits
    def self.fb4=(value : Bool) : Bool
      self.set(fb4: value)
      value
    end

    # Filter bits
    def fb5 : Bool
      @value.bits_set?(0x20_u32)
    end

    # Filter bits
    def self.fb5 : Bool
      value.fb5
    end

    # Filter bits
    def self.fb5=(value : Bool) : Bool
      self.set(fb5: value)
      value
    end

    # Filter bits
    def fb6 : Bool
      @value.bits_set?(0x40_u32)
    end

    # Filter bits
    def self.fb6 : Bool
      value.fb6
    end

    # Filter bits
    def self.fb6=(value : Bool) : Bool
      self.set(fb6: value)
      value
    end

    # Filter bits
    def fb7 : Bool
      @value.bits_set?(0x80_u32)
    end

    # Filter bits
    def self.fb7 : Bool
      value.fb7
    end

    # Filter bits
    def self.fb7=(value : Bool) : Bool
      self.set(fb7: value)
      value
    end

    # Filter bits
    def fb8 : Bool
      @value.bits_set?(0x100_u32)
    end

    # Filter bits
    def self.fb8 : Bool
      value.fb8
    end

    # Filter bits
    def self.fb8=(value : Bool) : Bool
      self.set(fb8: value)
      value
    end

    # Filter bits
    def fb9 : Bool
      @value.bits_set?(0x200_u32)
    end

    # Filter bits
    def self.fb9 : Bool
      value.fb9
    end

    # Filter bits
    def self.fb9=(value : Bool) : Bool
      self.set(fb9: value)
      value
    end

    # Filter bits
    def fb10 : Bool
      @value.bits_set?(0x400_u32)
    end

    # Filter bits
    def self.fb10 : Bool
      value.fb10
    end

    # Filter bits
    def self.fb10=(value : Bool) : Bool
      self.set(fb10: value)
      value
    end

    # Filter bits
    def fb11 : Bool
      @value.bits_set?(0x800_u32)
    end

    # Filter bits
    def self.fb11 : Bool
      value.fb11
    end

    # Filter bits
    def self.fb11=(value : Bool) : Bool
      self.set(fb11: value)
      value
    end

    # Filter bits
    def fb12 : Bool
      @value.bits_set?(0x1000_u32)
    end

    # Filter bits
    def self.fb12 : Bool
      value.fb12
    end

    # Filter bits
    def self.fb12=(value : Bool) : Bool
      self.set(fb12: value)
      value
    end

    # Filter bits
    def fb13 : Bool
      @value.bits_set?(0x2000_u32)
    end

    # Filter bits
    def self.fb13 : Bool
      value.fb13
    end

    # Filter bits
    def self.fb13=(value : Bool) : Bool
      self.set(fb13: value)
      value
    end

    # Filter bits
    def fb14 : Bool
      @value.bits_set?(0x4000_u32)
    end

    # Filter bits
    def self.fb14 : Bool
      value.fb14
    end

    # Filter bits
    def self.fb14=(value : Bool) : Bool
      self.set(fb14: value)
      value
    end

    # Filter bits
    def fb15 : Bool
      @value.bits_set?(0x8000_u32)
    end

    # Filter bits
    def self.fb15 : Bool
      value.fb15
    end

    # Filter bits
    def self.fb15=(value : Bool) : Bool
      self.set(fb15: value)
      value
    end

    # Filter bits
    def fb16 : Bool
      @value.bits_set?(0x10000_u32)
    end

    # Filter bits
    def self.fb16 : Bool
      value.fb16
    end

    # Filter bits
    def self.fb16=(value : Bool) : Bool
      self.set(fb16: value)
      value
    end

    # Filter bits
    def fb17 : Bool
      @value.bits_set?(0x20000_u32)
    end

    # Filter bits
    def self.fb17 : Bool
      value.fb17
    end

    # Filter bits
    def self.fb17=(value : Bool) : Bool
      self.set(fb17: value)
      value
    end

    # Filter bits
    def fb18 : Bool
      @value.bits_set?(0x40000_u32)
    end

    # Filter bits
    def self.fb18 : Bool
      value.fb18
    end

    # Filter bits
    def self.fb18=(value : Bool) : Bool
      self.set(fb18: value)
      value
    end

    # Filter bits
    def fb19 : Bool
      @value.bits_set?(0x80000_u32)
    end

    # Filter bits
    def self.fb19 : Bool
      value.fb19
    end

    # Filter bits
    def self.fb19=(value : Bool) : Bool
      self.set(fb19: value)
      value
    end

    # Filter bits
    def fb20 : Bool
      @value.bits_set?(0x100000_u32)
    end

    # Filter bits
    def self.fb20 : Bool
      value.fb20
    end

    # Filter bits
    def self.fb20=(value : Bool) : Bool
      self.set(fb20: value)
      value
    end

    # Filter bits
    def fb21 : Bool
      @value.bits_set?(0x200000_u32)
    end

    # Filter bits
    def self.fb21 : Bool
      value.fb21
    end

    # Filter bits
    def self.fb21=(value : Bool) : Bool
      self.set(fb21: value)
      value
    end

    # Filter bits
    def fb22 : Bool
      @value.bits_set?(0x400000_u32)
    end

    # Filter bits
    def self.fb22 : Bool
      value.fb22
    end

    # Filter bits
    def self.fb22=(value : Bool) : Bool
      self.set(fb22: value)
      value
    end

    # Filter bits
    def fb23 : Bool
      @value.bits_set?(0x800000_u32)
    end

    # Filter bits
    def self.fb23 : Bool
      value.fb23
    end

    # Filter bits
    def self.fb23=(value : Bool) : Bool
      self.set(fb23: value)
      value
    end

    # Filter bits
    def fb24 : Bool
      @value.bits_set?(0x1000000_u32)
    end

    # Filter bits
    def self.fb24 : Bool
      value.fb24
    end

    # Filter bits
    def self.fb24=(value : Bool) : Bool
      self.set(fb24: value)
      value
    end

    # Filter bits
    def fb25 : Bool
      @value.bits_set?(0x2000000_u32)
    end

    # Filter bits
    def self.fb25 : Bool
      value.fb25
    end

    # Filter bits
    def self.fb25=(value : Bool) : Bool
      self.set(fb25: value)
      value
    end

    # Filter bits
    def fb26 : Bool
      @value.bits_set?(0x4000000_u32)
    end

    # Filter bits
    def self.fb26 : Bool
      value.fb26
    end

    # Filter bits
    def self.fb26=(value : Bool) : Bool
      self.set(fb26: value)
      value
    end

    # Filter bits
    def fb27 : Bool
      @value.bits_set?(0x8000000_u32)
    end

    # Filter bits
    def self.fb27 : Bool
      value.fb27
    end

    # Filter bits
    def self.fb27=(value : Bool) : Bool
      self.set(fb27: value)
      value
    end

    # Filter bits
    def fb28 : Bool
      @value.bits_set?(0x10000000_u32)
    end

    # Filter bits
    def self.fb28 : Bool
      value.fb28
    end

    # Filter bits
    def self.fb28=(value : Bool) : Bool
      self.set(fb28: value)
      value
    end

    # Filter bits
    def fb29 : Bool
      @value.bits_set?(0x20000000_u32)
    end

    # Filter bits
    def self.fb29 : Bool
      value.fb29
    end

    # Filter bits
    def self.fb29=(value : Bool) : Bool
      self.set(fb29: value)
      value
    end

    # Filter bits
    def fb30 : Bool
      @value.bits_set?(0x40000000_u32)
    end

    # Filter bits
    def self.fb30 : Bool
      value.fb30
    end

    # Filter bits
    def self.fb30=(value : Bool) : Bool
      self.set(fb30: value)
      value
    end

    # Filter bits
    def fb31 : Bool
      @value.bits_set?(0x80000000_u32)
    end

    # Filter bits
    def self.fb31 : Bool
      value.fb31
    end

    # Filter bits
    def self.fb31=(value : Bool) : Bool
      self.set(fb31: value)
      value
    end

    def copy_with(
      *,

      fb0 : Bool? = nil,

      fb1 : Bool? = nil,

      fb2 : Bool? = nil,

      fb3 : Bool? = nil,

      fb4 : Bool? = nil,

      fb5 : Bool? = nil,

      fb6 : Bool? = nil,

      fb7 : Bool? = nil,

      fb8 : Bool? = nil,

      fb9 : Bool? = nil,

      fb10 : Bool? = nil,

      fb11 : Bool? = nil,

      fb12 : Bool? = nil,

      fb13 : Bool? = nil,

      fb14 : Bool? = nil,

      fb15 : Bool? = nil,

      fb16 : Bool? = nil,

      fb17 : Bool? = nil,

      fb18 : Bool? = nil,

      fb19 : Bool? = nil,

      fb20 : Bool? = nil,

      fb21 : Bool? = nil,

      fb22 : Bool? = nil,

      fb23 : Bool? = nil,

      fb24 : Bool? = nil,

      fb25 : Bool? = nil,

      fb26 : Bool? = nil,

      fb27 : Bool? = nil,

      fb28 : Bool? = nil,

      fb29 : Bool? = nil,

      fb30 : Bool? = nil,

      fb31 : Bool? = nil
    ) : self
      value = @value

      unless fb0.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(fb0.to_int).&(0x1_u32) << 0
      end

      unless fb1.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(fb1.to_int).&(0x1_u32) << 1
      end

      unless fb2.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(fb2.to_int).&(0x1_u32) << 2
      end

      unless fb3.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(fb3.to_int).&(0x1_u32) << 3
      end

      unless fb4.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(fb4.to_int).&(0x1_u32) << 4
      end

      unless fb5.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(fb5.to_int).&(0x1_u32) << 5
      end

      unless fb6.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(fb6.to_int).&(0x1_u32) << 6
      end

      unless fb7.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(fb7.to_int).&(0x1_u32) << 7
      end

      unless fb8.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(fb8.to_int).&(0x1_u32) << 8
      end

      unless fb9.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(fb9.to_int).&(0x1_u32) << 9
      end

      unless fb10.nil?
        value = (value & 0xfffffbff_u32) |
                UInt32.new!(fb10.to_int).&(0x1_u32) << 10
      end

      unless fb11.nil?
        value = (value & 0xfffff7ff_u32) |
                UInt32.new!(fb11.to_int).&(0x1_u32) << 11
      end

      unless fb12.nil?
        value = (value & 0xffffefff_u32) |
                UInt32.new!(fb12.to_int).&(0x1_u32) << 12
      end

      unless fb13.nil?
        value = (value & 0xffffdfff_u32) |
                UInt32.new!(fb13.to_int).&(0x1_u32) << 13
      end

      unless fb14.nil?
        value = (value & 0xffffbfff_u32) |
                UInt32.new!(fb14.to_int).&(0x1_u32) << 14
      end

      unless fb15.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(fb15.to_int).&(0x1_u32) << 15
      end

      unless fb16.nil?
        value = (value & 0xfffeffff_u32) |
                UInt32.new!(fb16.to_int).&(0x1_u32) << 16
      end

      unless fb17.nil?
        value = (value & 0xfffdffff_u32) |
                UInt32.new!(fb17.to_int).&(0x1_u32) << 17
      end

      unless fb18.nil?
        value = (value & 0xfffbffff_u32) |
                UInt32.new!(fb18.to_int).&(0x1_u32) << 18
      end

      unless fb19.nil?
        value = (value & 0xfff7ffff_u32) |
                UInt32.new!(fb19.to_int).&(0x1_u32) << 19
      end

      unless fb20.nil?
        value = (value & 0xffefffff_u32) |
                UInt32.new!(fb20.to_int).&(0x1_u32) << 20
      end

      unless fb21.nil?
        value = (value & 0xffdfffff_u32) |
                UInt32.new!(fb21.to_int).&(0x1_u32) << 21
      end

      unless fb22.nil?
        value = (value & 0xffbfffff_u32) |
                UInt32.new!(fb22.to_int).&(0x1_u32) << 22
      end

      unless fb23.nil?
        value = (value & 0xff7fffff_u32) |
                UInt32.new!(fb23.to_int).&(0x1_u32) << 23
      end

      unless fb24.nil?
        value = (value & 0xfeffffff_u32) |
                UInt32.new!(fb24.to_int).&(0x1_u32) << 24
      end

      unless fb25.nil?
        value = (value & 0xfdffffff_u32) |
                UInt32.new!(fb25.to_int).&(0x1_u32) << 25
      end

      unless fb26.nil?
        value = (value & 0xfbffffff_u32) |
                UInt32.new!(fb26.to_int).&(0x1_u32) << 26
      end

      unless fb27.nil?
        value = (value & 0xf7ffffff_u32) |
                UInt32.new!(fb27.to_int).&(0x1_u32) << 27
      end

      unless fb28.nil?
        value = (value & 0xefffffff_u32) |
                UInt32.new!(fb28.to_int).&(0x1_u32) << 28
      end

      unless fb29.nil?
        value = (value & 0xdfffffff_u32) |
                UInt32.new!(fb29.to_int).&(0x1_u32) << 29
      end

      unless fb30.nil?
        value = (value & 0xbfffffff_u32) |
                UInt32.new!(fb30.to_int).&(0x1_u32) << 30
      end

      unless fb31.nil?
        value = (value & 0x7fffffff_u32) |
                UInt32.new!(fb31.to_int).&(0x1_u32) << 31
      end

      self.class.new(value)
    end

    def self.set(
      *,
      fb0 : Bool? = nil,
      fb1 : Bool? = nil,
      fb2 : Bool? = nil,
      fb3 : Bool? = nil,
      fb4 : Bool? = nil,
      fb5 : Bool? = nil,
      fb6 : Bool? = nil,
      fb7 : Bool? = nil,
      fb8 : Bool? = nil,
      fb9 : Bool? = nil,
      fb10 : Bool? = nil,
      fb11 : Bool? = nil,
      fb12 : Bool? = nil,
      fb13 : Bool? = nil,
      fb14 : Bool? = nil,
      fb15 : Bool? = nil,
      fb16 : Bool? = nil,
      fb17 : Bool? = nil,
      fb18 : Bool? = nil,
      fb19 : Bool? = nil,
      fb20 : Bool? = nil,
      fb21 : Bool? = nil,
      fb22 : Bool? = nil,
      fb23 : Bool? = nil,
      fb24 : Bool? = nil,
      fb25 : Bool? = nil,
      fb26 : Bool? = nil,
      fb27 : Bool? = nil,
      fb28 : Bool? = nil,
      fb29 : Bool? = nil,
      fb30 : Bool? = nil,
      fb31 : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        fb0: fb0,
        fb1: fb1,
        fb2: fb2,
        fb3: fb3,
        fb4: fb4,
        fb5: fb5,
        fb6: fb6,
        fb7: fb7,
        fb8: fb8,
        fb9: fb9,
        fb10: fb10,
        fb11: fb11,
        fb12: fb12,
        fb13: fb13,
        fb14: fb14,
        fb15: fb15,
        fb16: fb16,
        fb17: fb17,
        fb18: fb18,
        fb19: fb19,
        fb20: fb20,
        fb21: fb21,
        fb22: fb22,
        fb23: fb23,
        fb24: fb24,
        fb25: fb25,
        fb26: fb26,
        fb27: fb27,
        fb28: fb28,
        fb29: fb29,
        fb30: fb30,
        fb31: fb31,
      )
    end
  end # struct

  # Filter bank 10 register 2
  struct F10R2
    ADDRESS = BASE_ADDRESS + 0x294_u64

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

    # Filter bits
    def fb0 : Bool
      @value.bits_set?(0x1_u32)
    end

    # Filter bits
    def self.fb0 : Bool
      value.fb0
    end

    # Filter bits
    def self.fb0=(value : Bool) : Bool
      self.set(fb0: value)
      value
    end

    # Filter bits
    def fb1 : Bool
      @value.bits_set?(0x2_u32)
    end

    # Filter bits
    def self.fb1 : Bool
      value.fb1
    end

    # Filter bits
    def self.fb1=(value : Bool) : Bool
      self.set(fb1: value)
      value
    end

    # Filter bits
    def fb2 : Bool
      @value.bits_set?(0x4_u32)
    end

    # Filter bits
    def self.fb2 : Bool
      value.fb2
    end

    # Filter bits
    def self.fb2=(value : Bool) : Bool
      self.set(fb2: value)
      value
    end

    # Filter bits
    def fb3 : Bool
      @value.bits_set?(0x8_u32)
    end

    # Filter bits
    def self.fb3 : Bool
      value.fb3
    end

    # Filter bits
    def self.fb3=(value : Bool) : Bool
      self.set(fb3: value)
      value
    end

    # Filter bits
    def fb4 : Bool
      @value.bits_set?(0x10_u32)
    end

    # Filter bits
    def self.fb4 : Bool
      value.fb4
    end

    # Filter bits
    def self.fb4=(value : Bool) : Bool
      self.set(fb4: value)
      value
    end

    # Filter bits
    def fb5 : Bool
      @value.bits_set?(0x20_u32)
    end

    # Filter bits
    def self.fb5 : Bool
      value.fb5
    end

    # Filter bits
    def self.fb5=(value : Bool) : Bool
      self.set(fb5: value)
      value
    end

    # Filter bits
    def fb6 : Bool
      @value.bits_set?(0x40_u32)
    end

    # Filter bits
    def self.fb6 : Bool
      value.fb6
    end

    # Filter bits
    def self.fb6=(value : Bool) : Bool
      self.set(fb6: value)
      value
    end

    # Filter bits
    def fb7 : Bool
      @value.bits_set?(0x80_u32)
    end

    # Filter bits
    def self.fb7 : Bool
      value.fb7
    end

    # Filter bits
    def self.fb7=(value : Bool) : Bool
      self.set(fb7: value)
      value
    end

    # Filter bits
    def fb8 : Bool
      @value.bits_set?(0x100_u32)
    end

    # Filter bits
    def self.fb8 : Bool
      value.fb8
    end

    # Filter bits
    def self.fb8=(value : Bool) : Bool
      self.set(fb8: value)
      value
    end

    # Filter bits
    def fb9 : Bool
      @value.bits_set?(0x200_u32)
    end

    # Filter bits
    def self.fb9 : Bool
      value.fb9
    end

    # Filter bits
    def self.fb9=(value : Bool) : Bool
      self.set(fb9: value)
      value
    end

    # Filter bits
    def fb10 : Bool
      @value.bits_set?(0x400_u32)
    end

    # Filter bits
    def self.fb10 : Bool
      value.fb10
    end

    # Filter bits
    def self.fb10=(value : Bool) : Bool
      self.set(fb10: value)
      value
    end

    # Filter bits
    def fb11 : Bool
      @value.bits_set?(0x800_u32)
    end

    # Filter bits
    def self.fb11 : Bool
      value.fb11
    end

    # Filter bits
    def self.fb11=(value : Bool) : Bool
      self.set(fb11: value)
      value
    end

    # Filter bits
    def fb12 : Bool
      @value.bits_set?(0x1000_u32)
    end

    # Filter bits
    def self.fb12 : Bool
      value.fb12
    end

    # Filter bits
    def self.fb12=(value : Bool) : Bool
      self.set(fb12: value)
      value
    end

    # Filter bits
    def fb13 : Bool
      @value.bits_set?(0x2000_u32)
    end

    # Filter bits
    def self.fb13 : Bool
      value.fb13
    end

    # Filter bits
    def self.fb13=(value : Bool) : Bool
      self.set(fb13: value)
      value
    end

    # Filter bits
    def fb14 : Bool
      @value.bits_set?(0x4000_u32)
    end

    # Filter bits
    def self.fb14 : Bool
      value.fb14
    end

    # Filter bits
    def self.fb14=(value : Bool) : Bool
      self.set(fb14: value)
      value
    end

    # Filter bits
    def fb15 : Bool
      @value.bits_set?(0x8000_u32)
    end

    # Filter bits
    def self.fb15 : Bool
      value.fb15
    end

    # Filter bits
    def self.fb15=(value : Bool) : Bool
      self.set(fb15: value)
      value
    end

    # Filter bits
    def fb16 : Bool
      @value.bits_set?(0x10000_u32)
    end

    # Filter bits
    def self.fb16 : Bool
      value.fb16
    end

    # Filter bits
    def self.fb16=(value : Bool) : Bool
      self.set(fb16: value)
      value
    end

    # Filter bits
    def fb17 : Bool
      @value.bits_set?(0x20000_u32)
    end

    # Filter bits
    def self.fb17 : Bool
      value.fb17
    end

    # Filter bits
    def self.fb17=(value : Bool) : Bool
      self.set(fb17: value)
      value
    end

    # Filter bits
    def fb18 : Bool
      @value.bits_set?(0x40000_u32)
    end

    # Filter bits
    def self.fb18 : Bool
      value.fb18
    end

    # Filter bits
    def self.fb18=(value : Bool) : Bool
      self.set(fb18: value)
      value
    end

    # Filter bits
    def fb19 : Bool
      @value.bits_set?(0x80000_u32)
    end

    # Filter bits
    def self.fb19 : Bool
      value.fb19
    end

    # Filter bits
    def self.fb19=(value : Bool) : Bool
      self.set(fb19: value)
      value
    end

    # Filter bits
    def fb20 : Bool
      @value.bits_set?(0x100000_u32)
    end

    # Filter bits
    def self.fb20 : Bool
      value.fb20
    end

    # Filter bits
    def self.fb20=(value : Bool) : Bool
      self.set(fb20: value)
      value
    end

    # Filter bits
    def fb21 : Bool
      @value.bits_set?(0x200000_u32)
    end

    # Filter bits
    def self.fb21 : Bool
      value.fb21
    end

    # Filter bits
    def self.fb21=(value : Bool) : Bool
      self.set(fb21: value)
      value
    end

    # Filter bits
    def fb22 : Bool
      @value.bits_set?(0x400000_u32)
    end

    # Filter bits
    def self.fb22 : Bool
      value.fb22
    end

    # Filter bits
    def self.fb22=(value : Bool) : Bool
      self.set(fb22: value)
      value
    end

    # Filter bits
    def fb23 : Bool
      @value.bits_set?(0x800000_u32)
    end

    # Filter bits
    def self.fb23 : Bool
      value.fb23
    end

    # Filter bits
    def self.fb23=(value : Bool) : Bool
      self.set(fb23: value)
      value
    end

    # Filter bits
    def fb24 : Bool
      @value.bits_set?(0x1000000_u32)
    end

    # Filter bits
    def self.fb24 : Bool
      value.fb24
    end

    # Filter bits
    def self.fb24=(value : Bool) : Bool
      self.set(fb24: value)
      value
    end

    # Filter bits
    def fb25 : Bool
      @value.bits_set?(0x2000000_u32)
    end

    # Filter bits
    def self.fb25 : Bool
      value.fb25
    end

    # Filter bits
    def self.fb25=(value : Bool) : Bool
      self.set(fb25: value)
      value
    end

    # Filter bits
    def fb26 : Bool
      @value.bits_set?(0x4000000_u32)
    end

    # Filter bits
    def self.fb26 : Bool
      value.fb26
    end

    # Filter bits
    def self.fb26=(value : Bool) : Bool
      self.set(fb26: value)
      value
    end

    # Filter bits
    def fb27 : Bool
      @value.bits_set?(0x8000000_u32)
    end

    # Filter bits
    def self.fb27 : Bool
      value.fb27
    end

    # Filter bits
    def self.fb27=(value : Bool) : Bool
      self.set(fb27: value)
      value
    end

    # Filter bits
    def fb28 : Bool
      @value.bits_set?(0x10000000_u32)
    end

    # Filter bits
    def self.fb28 : Bool
      value.fb28
    end

    # Filter bits
    def self.fb28=(value : Bool) : Bool
      self.set(fb28: value)
      value
    end

    # Filter bits
    def fb29 : Bool
      @value.bits_set?(0x20000000_u32)
    end

    # Filter bits
    def self.fb29 : Bool
      value.fb29
    end

    # Filter bits
    def self.fb29=(value : Bool) : Bool
      self.set(fb29: value)
      value
    end

    # Filter bits
    def fb30 : Bool
      @value.bits_set?(0x40000000_u32)
    end

    # Filter bits
    def self.fb30 : Bool
      value.fb30
    end

    # Filter bits
    def self.fb30=(value : Bool) : Bool
      self.set(fb30: value)
      value
    end

    # Filter bits
    def fb31 : Bool
      @value.bits_set?(0x80000000_u32)
    end

    # Filter bits
    def self.fb31 : Bool
      value.fb31
    end

    # Filter bits
    def self.fb31=(value : Bool) : Bool
      self.set(fb31: value)
      value
    end

    def copy_with(
      *,

      fb0 : Bool? = nil,

      fb1 : Bool? = nil,

      fb2 : Bool? = nil,

      fb3 : Bool? = nil,

      fb4 : Bool? = nil,

      fb5 : Bool? = nil,

      fb6 : Bool? = nil,

      fb7 : Bool? = nil,

      fb8 : Bool? = nil,

      fb9 : Bool? = nil,

      fb10 : Bool? = nil,

      fb11 : Bool? = nil,

      fb12 : Bool? = nil,

      fb13 : Bool? = nil,

      fb14 : Bool? = nil,

      fb15 : Bool? = nil,

      fb16 : Bool? = nil,

      fb17 : Bool? = nil,

      fb18 : Bool? = nil,

      fb19 : Bool? = nil,

      fb20 : Bool? = nil,

      fb21 : Bool? = nil,

      fb22 : Bool? = nil,

      fb23 : Bool? = nil,

      fb24 : Bool? = nil,

      fb25 : Bool? = nil,

      fb26 : Bool? = nil,

      fb27 : Bool? = nil,

      fb28 : Bool? = nil,

      fb29 : Bool? = nil,

      fb30 : Bool? = nil,

      fb31 : Bool? = nil
    ) : self
      value = @value

      unless fb0.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(fb0.to_int).&(0x1_u32) << 0
      end

      unless fb1.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(fb1.to_int).&(0x1_u32) << 1
      end

      unless fb2.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(fb2.to_int).&(0x1_u32) << 2
      end

      unless fb3.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(fb3.to_int).&(0x1_u32) << 3
      end

      unless fb4.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(fb4.to_int).&(0x1_u32) << 4
      end

      unless fb5.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(fb5.to_int).&(0x1_u32) << 5
      end

      unless fb6.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(fb6.to_int).&(0x1_u32) << 6
      end

      unless fb7.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(fb7.to_int).&(0x1_u32) << 7
      end

      unless fb8.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(fb8.to_int).&(0x1_u32) << 8
      end

      unless fb9.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(fb9.to_int).&(0x1_u32) << 9
      end

      unless fb10.nil?
        value = (value & 0xfffffbff_u32) |
                UInt32.new!(fb10.to_int).&(0x1_u32) << 10
      end

      unless fb11.nil?
        value = (value & 0xfffff7ff_u32) |
                UInt32.new!(fb11.to_int).&(0x1_u32) << 11
      end

      unless fb12.nil?
        value = (value & 0xffffefff_u32) |
                UInt32.new!(fb12.to_int).&(0x1_u32) << 12
      end

      unless fb13.nil?
        value = (value & 0xffffdfff_u32) |
                UInt32.new!(fb13.to_int).&(0x1_u32) << 13
      end

      unless fb14.nil?
        value = (value & 0xffffbfff_u32) |
                UInt32.new!(fb14.to_int).&(0x1_u32) << 14
      end

      unless fb15.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(fb15.to_int).&(0x1_u32) << 15
      end

      unless fb16.nil?
        value = (value & 0xfffeffff_u32) |
                UInt32.new!(fb16.to_int).&(0x1_u32) << 16
      end

      unless fb17.nil?
        value = (value & 0xfffdffff_u32) |
                UInt32.new!(fb17.to_int).&(0x1_u32) << 17
      end

      unless fb18.nil?
        value = (value & 0xfffbffff_u32) |
                UInt32.new!(fb18.to_int).&(0x1_u32) << 18
      end

      unless fb19.nil?
        value = (value & 0xfff7ffff_u32) |
                UInt32.new!(fb19.to_int).&(0x1_u32) << 19
      end

      unless fb20.nil?
        value = (value & 0xffefffff_u32) |
                UInt32.new!(fb20.to_int).&(0x1_u32) << 20
      end

      unless fb21.nil?
        value = (value & 0xffdfffff_u32) |
                UInt32.new!(fb21.to_int).&(0x1_u32) << 21
      end

      unless fb22.nil?
        value = (value & 0xffbfffff_u32) |
                UInt32.new!(fb22.to_int).&(0x1_u32) << 22
      end

      unless fb23.nil?
        value = (value & 0xff7fffff_u32) |
                UInt32.new!(fb23.to_int).&(0x1_u32) << 23
      end

      unless fb24.nil?
        value = (value & 0xfeffffff_u32) |
                UInt32.new!(fb24.to_int).&(0x1_u32) << 24
      end

      unless fb25.nil?
        value = (value & 0xfdffffff_u32) |
                UInt32.new!(fb25.to_int).&(0x1_u32) << 25
      end

      unless fb26.nil?
        value = (value & 0xfbffffff_u32) |
                UInt32.new!(fb26.to_int).&(0x1_u32) << 26
      end

      unless fb27.nil?
        value = (value & 0xf7ffffff_u32) |
                UInt32.new!(fb27.to_int).&(0x1_u32) << 27
      end

      unless fb28.nil?
        value = (value & 0xefffffff_u32) |
                UInt32.new!(fb28.to_int).&(0x1_u32) << 28
      end

      unless fb29.nil?
        value = (value & 0xdfffffff_u32) |
                UInt32.new!(fb29.to_int).&(0x1_u32) << 29
      end

      unless fb30.nil?
        value = (value & 0xbfffffff_u32) |
                UInt32.new!(fb30.to_int).&(0x1_u32) << 30
      end

      unless fb31.nil?
        value = (value & 0x7fffffff_u32) |
                UInt32.new!(fb31.to_int).&(0x1_u32) << 31
      end

      self.class.new(value)
    end

    def self.set(
      *,
      fb0 : Bool? = nil,
      fb1 : Bool? = nil,
      fb2 : Bool? = nil,
      fb3 : Bool? = nil,
      fb4 : Bool? = nil,
      fb5 : Bool? = nil,
      fb6 : Bool? = nil,
      fb7 : Bool? = nil,
      fb8 : Bool? = nil,
      fb9 : Bool? = nil,
      fb10 : Bool? = nil,
      fb11 : Bool? = nil,
      fb12 : Bool? = nil,
      fb13 : Bool? = nil,
      fb14 : Bool? = nil,
      fb15 : Bool? = nil,
      fb16 : Bool? = nil,
      fb17 : Bool? = nil,
      fb18 : Bool? = nil,
      fb19 : Bool? = nil,
      fb20 : Bool? = nil,
      fb21 : Bool? = nil,
      fb22 : Bool? = nil,
      fb23 : Bool? = nil,
      fb24 : Bool? = nil,
      fb25 : Bool? = nil,
      fb26 : Bool? = nil,
      fb27 : Bool? = nil,
      fb28 : Bool? = nil,
      fb29 : Bool? = nil,
      fb30 : Bool? = nil,
      fb31 : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        fb0: fb0,
        fb1: fb1,
        fb2: fb2,
        fb3: fb3,
        fb4: fb4,
        fb5: fb5,
        fb6: fb6,
        fb7: fb7,
        fb8: fb8,
        fb9: fb9,
        fb10: fb10,
        fb11: fb11,
        fb12: fb12,
        fb13: fb13,
        fb14: fb14,
        fb15: fb15,
        fb16: fb16,
        fb17: fb17,
        fb18: fb18,
        fb19: fb19,
        fb20: fb20,
        fb21: fb21,
        fb22: fb22,
        fb23: fb23,
        fb24: fb24,
        fb25: fb25,
        fb26: fb26,
        fb27: fb27,
        fb28: fb28,
        fb29: fb29,
        fb30: fb30,
        fb31: fb31,
      )
    end
  end # struct

  # Filter bank 11 register 1
  struct F11R1
    ADDRESS = BASE_ADDRESS + 0x298_u64

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

    # Filter bits
    def fb0 : Bool
      @value.bits_set?(0x1_u32)
    end

    # Filter bits
    def self.fb0 : Bool
      value.fb0
    end

    # Filter bits
    def self.fb0=(value : Bool) : Bool
      self.set(fb0: value)
      value
    end

    # Filter bits
    def fb1 : Bool
      @value.bits_set?(0x2_u32)
    end

    # Filter bits
    def self.fb1 : Bool
      value.fb1
    end

    # Filter bits
    def self.fb1=(value : Bool) : Bool
      self.set(fb1: value)
      value
    end

    # Filter bits
    def fb2 : Bool
      @value.bits_set?(0x4_u32)
    end

    # Filter bits
    def self.fb2 : Bool
      value.fb2
    end

    # Filter bits
    def self.fb2=(value : Bool) : Bool
      self.set(fb2: value)
      value
    end

    # Filter bits
    def fb3 : Bool
      @value.bits_set?(0x8_u32)
    end

    # Filter bits
    def self.fb3 : Bool
      value.fb3
    end

    # Filter bits
    def self.fb3=(value : Bool) : Bool
      self.set(fb3: value)
      value
    end

    # Filter bits
    def fb4 : Bool
      @value.bits_set?(0x10_u32)
    end

    # Filter bits
    def self.fb4 : Bool
      value.fb4
    end

    # Filter bits
    def self.fb4=(value : Bool) : Bool
      self.set(fb4: value)
      value
    end

    # Filter bits
    def fb5 : Bool
      @value.bits_set?(0x20_u32)
    end

    # Filter bits
    def self.fb5 : Bool
      value.fb5
    end

    # Filter bits
    def self.fb5=(value : Bool) : Bool
      self.set(fb5: value)
      value
    end

    # Filter bits
    def fb6 : Bool
      @value.bits_set?(0x40_u32)
    end

    # Filter bits
    def self.fb6 : Bool
      value.fb6
    end

    # Filter bits
    def self.fb6=(value : Bool) : Bool
      self.set(fb6: value)
      value
    end

    # Filter bits
    def fb7 : Bool
      @value.bits_set?(0x80_u32)
    end

    # Filter bits
    def self.fb7 : Bool
      value.fb7
    end

    # Filter bits
    def self.fb7=(value : Bool) : Bool
      self.set(fb7: value)
      value
    end

    # Filter bits
    def fb8 : Bool
      @value.bits_set?(0x100_u32)
    end

    # Filter bits
    def self.fb8 : Bool
      value.fb8
    end

    # Filter bits
    def self.fb8=(value : Bool) : Bool
      self.set(fb8: value)
      value
    end

    # Filter bits
    def fb9 : Bool
      @value.bits_set?(0x200_u32)
    end

    # Filter bits
    def self.fb9 : Bool
      value.fb9
    end

    # Filter bits
    def self.fb9=(value : Bool) : Bool
      self.set(fb9: value)
      value
    end

    # Filter bits
    def fb10 : Bool
      @value.bits_set?(0x400_u32)
    end

    # Filter bits
    def self.fb10 : Bool
      value.fb10
    end

    # Filter bits
    def self.fb10=(value : Bool) : Bool
      self.set(fb10: value)
      value
    end

    # Filter bits
    def fb11 : Bool
      @value.bits_set?(0x800_u32)
    end

    # Filter bits
    def self.fb11 : Bool
      value.fb11
    end

    # Filter bits
    def self.fb11=(value : Bool) : Bool
      self.set(fb11: value)
      value
    end

    # Filter bits
    def fb12 : Bool
      @value.bits_set?(0x1000_u32)
    end

    # Filter bits
    def self.fb12 : Bool
      value.fb12
    end

    # Filter bits
    def self.fb12=(value : Bool) : Bool
      self.set(fb12: value)
      value
    end

    # Filter bits
    def fb13 : Bool
      @value.bits_set?(0x2000_u32)
    end

    # Filter bits
    def self.fb13 : Bool
      value.fb13
    end

    # Filter bits
    def self.fb13=(value : Bool) : Bool
      self.set(fb13: value)
      value
    end

    # Filter bits
    def fb14 : Bool
      @value.bits_set?(0x4000_u32)
    end

    # Filter bits
    def self.fb14 : Bool
      value.fb14
    end

    # Filter bits
    def self.fb14=(value : Bool) : Bool
      self.set(fb14: value)
      value
    end

    # Filter bits
    def fb15 : Bool
      @value.bits_set?(0x8000_u32)
    end

    # Filter bits
    def self.fb15 : Bool
      value.fb15
    end

    # Filter bits
    def self.fb15=(value : Bool) : Bool
      self.set(fb15: value)
      value
    end

    # Filter bits
    def fb16 : Bool
      @value.bits_set?(0x10000_u32)
    end

    # Filter bits
    def self.fb16 : Bool
      value.fb16
    end

    # Filter bits
    def self.fb16=(value : Bool) : Bool
      self.set(fb16: value)
      value
    end

    # Filter bits
    def fb17 : Bool
      @value.bits_set?(0x20000_u32)
    end

    # Filter bits
    def self.fb17 : Bool
      value.fb17
    end

    # Filter bits
    def self.fb17=(value : Bool) : Bool
      self.set(fb17: value)
      value
    end

    # Filter bits
    def fb18 : Bool
      @value.bits_set?(0x40000_u32)
    end

    # Filter bits
    def self.fb18 : Bool
      value.fb18
    end

    # Filter bits
    def self.fb18=(value : Bool) : Bool
      self.set(fb18: value)
      value
    end

    # Filter bits
    def fb19 : Bool
      @value.bits_set?(0x80000_u32)
    end

    # Filter bits
    def self.fb19 : Bool
      value.fb19
    end

    # Filter bits
    def self.fb19=(value : Bool) : Bool
      self.set(fb19: value)
      value
    end

    # Filter bits
    def fb20 : Bool
      @value.bits_set?(0x100000_u32)
    end

    # Filter bits
    def self.fb20 : Bool
      value.fb20
    end

    # Filter bits
    def self.fb20=(value : Bool) : Bool
      self.set(fb20: value)
      value
    end

    # Filter bits
    def fb21 : Bool
      @value.bits_set?(0x200000_u32)
    end

    # Filter bits
    def self.fb21 : Bool
      value.fb21
    end

    # Filter bits
    def self.fb21=(value : Bool) : Bool
      self.set(fb21: value)
      value
    end

    # Filter bits
    def fb22 : Bool
      @value.bits_set?(0x400000_u32)
    end

    # Filter bits
    def self.fb22 : Bool
      value.fb22
    end

    # Filter bits
    def self.fb22=(value : Bool) : Bool
      self.set(fb22: value)
      value
    end

    # Filter bits
    def fb23 : Bool
      @value.bits_set?(0x800000_u32)
    end

    # Filter bits
    def self.fb23 : Bool
      value.fb23
    end

    # Filter bits
    def self.fb23=(value : Bool) : Bool
      self.set(fb23: value)
      value
    end

    # Filter bits
    def fb24 : Bool
      @value.bits_set?(0x1000000_u32)
    end

    # Filter bits
    def self.fb24 : Bool
      value.fb24
    end

    # Filter bits
    def self.fb24=(value : Bool) : Bool
      self.set(fb24: value)
      value
    end

    # Filter bits
    def fb25 : Bool
      @value.bits_set?(0x2000000_u32)
    end

    # Filter bits
    def self.fb25 : Bool
      value.fb25
    end

    # Filter bits
    def self.fb25=(value : Bool) : Bool
      self.set(fb25: value)
      value
    end

    # Filter bits
    def fb26 : Bool
      @value.bits_set?(0x4000000_u32)
    end

    # Filter bits
    def self.fb26 : Bool
      value.fb26
    end

    # Filter bits
    def self.fb26=(value : Bool) : Bool
      self.set(fb26: value)
      value
    end

    # Filter bits
    def fb27 : Bool
      @value.bits_set?(0x8000000_u32)
    end

    # Filter bits
    def self.fb27 : Bool
      value.fb27
    end

    # Filter bits
    def self.fb27=(value : Bool) : Bool
      self.set(fb27: value)
      value
    end

    # Filter bits
    def fb28 : Bool
      @value.bits_set?(0x10000000_u32)
    end

    # Filter bits
    def self.fb28 : Bool
      value.fb28
    end

    # Filter bits
    def self.fb28=(value : Bool) : Bool
      self.set(fb28: value)
      value
    end

    # Filter bits
    def fb29 : Bool
      @value.bits_set?(0x20000000_u32)
    end

    # Filter bits
    def self.fb29 : Bool
      value.fb29
    end

    # Filter bits
    def self.fb29=(value : Bool) : Bool
      self.set(fb29: value)
      value
    end

    # Filter bits
    def fb30 : Bool
      @value.bits_set?(0x40000000_u32)
    end

    # Filter bits
    def self.fb30 : Bool
      value.fb30
    end

    # Filter bits
    def self.fb30=(value : Bool) : Bool
      self.set(fb30: value)
      value
    end

    # Filter bits
    def fb31 : Bool
      @value.bits_set?(0x80000000_u32)
    end

    # Filter bits
    def self.fb31 : Bool
      value.fb31
    end

    # Filter bits
    def self.fb31=(value : Bool) : Bool
      self.set(fb31: value)
      value
    end

    def copy_with(
      *,

      fb0 : Bool? = nil,

      fb1 : Bool? = nil,

      fb2 : Bool? = nil,

      fb3 : Bool? = nil,

      fb4 : Bool? = nil,

      fb5 : Bool? = nil,

      fb6 : Bool? = nil,

      fb7 : Bool? = nil,

      fb8 : Bool? = nil,

      fb9 : Bool? = nil,

      fb10 : Bool? = nil,

      fb11 : Bool? = nil,

      fb12 : Bool? = nil,

      fb13 : Bool? = nil,

      fb14 : Bool? = nil,

      fb15 : Bool? = nil,

      fb16 : Bool? = nil,

      fb17 : Bool? = nil,

      fb18 : Bool? = nil,

      fb19 : Bool? = nil,

      fb20 : Bool? = nil,

      fb21 : Bool? = nil,

      fb22 : Bool? = nil,

      fb23 : Bool? = nil,

      fb24 : Bool? = nil,

      fb25 : Bool? = nil,

      fb26 : Bool? = nil,

      fb27 : Bool? = nil,

      fb28 : Bool? = nil,

      fb29 : Bool? = nil,

      fb30 : Bool? = nil,

      fb31 : Bool? = nil
    ) : self
      value = @value

      unless fb0.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(fb0.to_int).&(0x1_u32) << 0
      end

      unless fb1.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(fb1.to_int).&(0x1_u32) << 1
      end

      unless fb2.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(fb2.to_int).&(0x1_u32) << 2
      end

      unless fb3.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(fb3.to_int).&(0x1_u32) << 3
      end

      unless fb4.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(fb4.to_int).&(0x1_u32) << 4
      end

      unless fb5.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(fb5.to_int).&(0x1_u32) << 5
      end

      unless fb6.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(fb6.to_int).&(0x1_u32) << 6
      end

      unless fb7.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(fb7.to_int).&(0x1_u32) << 7
      end

      unless fb8.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(fb8.to_int).&(0x1_u32) << 8
      end

      unless fb9.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(fb9.to_int).&(0x1_u32) << 9
      end

      unless fb10.nil?
        value = (value & 0xfffffbff_u32) |
                UInt32.new!(fb10.to_int).&(0x1_u32) << 10
      end

      unless fb11.nil?
        value = (value & 0xfffff7ff_u32) |
                UInt32.new!(fb11.to_int).&(0x1_u32) << 11
      end

      unless fb12.nil?
        value = (value & 0xffffefff_u32) |
                UInt32.new!(fb12.to_int).&(0x1_u32) << 12
      end

      unless fb13.nil?
        value = (value & 0xffffdfff_u32) |
                UInt32.new!(fb13.to_int).&(0x1_u32) << 13
      end

      unless fb14.nil?
        value = (value & 0xffffbfff_u32) |
                UInt32.new!(fb14.to_int).&(0x1_u32) << 14
      end

      unless fb15.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(fb15.to_int).&(0x1_u32) << 15
      end

      unless fb16.nil?
        value = (value & 0xfffeffff_u32) |
                UInt32.new!(fb16.to_int).&(0x1_u32) << 16
      end

      unless fb17.nil?
        value = (value & 0xfffdffff_u32) |
                UInt32.new!(fb17.to_int).&(0x1_u32) << 17
      end

      unless fb18.nil?
        value = (value & 0xfffbffff_u32) |
                UInt32.new!(fb18.to_int).&(0x1_u32) << 18
      end

      unless fb19.nil?
        value = (value & 0xfff7ffff_u32) |
                UInt32.new!(fb19.to_int).&(0x1_u32) << 19
      end

      unless fb20.nil?
        value = (value & 0xffefffff_u32) |
                UInt32.new!(fb20.to_int).&(0x1_u32) << 20
      end

      unless fb21.nil?
        value = (value & 0xffdfffff_u32) |
                UInt32.new!(fb21.to_int).&(0x1_u32) << 21
      end

      unless fb22.nil?
        value = (value & 0xffbfffff_u32) |
                UInt32.new!(fb22.to_int).&(0x1_u32) << 22
      end

      unless fb23.nil?
        value = (value & 0xff7fffff_u32) |
                UInt32.new!(fb23.to_int).&(0x1_u32) << 23
      end

      unless fb24.nil?
        value = (value & 0xfeffffff_u32) |
                UInt32.new!(fb24.to_int).&(0x1_u32) << 24
      end

      unless fb25.nil?
        value = (value & 0xfdffffff_u32) |
                UInt32.new!(fb25.to_int).&(0x1_u32) << 25
      end

      unless fb26.nil?
        value = (value & 0xfbffffff_u32) |
                UInt32.new!(fb26.to_int).&(0x1_u32) << 26
      end

      unless fb27.nil?
        value = (value & 0xf7ffffff_u32) |
                UInt32.new!(fb27.to_int).&(0x1_u32) << 27
      end

      unless fb28.nil?
        value = (value & 0xefffffff_u32) |
                UInt32.new!(fb28.to_int).&(0x1_u32) << 28
      end

      unless fb29.nil?
        value = (value & 0xdfffffff_u32) |
                UInt32.new!(fb29.to_int).&(0x1_u32) << 29
      end

      unless fb30.nil?
        value = (value & 0xbfffffff_u32) |
                UInt32.new!(fb30.to_int).&(0x1_u32) << 30
      end

      unless fb31.nil?
        value = (value & 0x7fffffff_u32) |
                UInt32.new!(fb31.to_int).&(0x1_u32) << 31
      end

      self.class.new(value)
    end

    def self.set(
      *,
      fb0 : Bool? = nil,
      fb1 : Bool? = nil,
      fb2 : Bool? = nil,
      fb3 : Bool? = nil,
      fb4 : Bool? = nil,
      fb5 : Bool? = nil,
      fb6 : Bool? = nil,
      fb7 : Bool? = nil,
      fb8 : Bool? = nil,
      fb9 : Bool? = nil,
      fb10 : Bool? = nil,
      fb11 : Bool? = nil,
      fb12 : Bool? = nil,
      fb13 : Bool? = nil,
      fb14 : Bool? = nil,
      fb15 : Bool? = nil,
      fb16 : Bool? = nil,
      fb17 : Bool? = nil,
      fb18 : Bool? = nil,
      fb19 : Bool? = nil,
      fb20 : Bool? = nil,
      fb21 : Bool? = nil,
      fb22 : Bool? = nil,
      fb23 : Bool? = nil,
      fb24 : Bool? = nil,
      fb25 : Bool? = nil,
      fb26 : Bool? = nil,
      fb27 : Bool? = nil,
      fb28 : Bool? = nil,
      fb29 : Bool? = nil,
      fb30 : Bool? = nil,
      fb31 : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        fb0: fb0,
        fb1: fb1,
        fb2: fb2,
        fb3: fb3,
        fb4: fb4,
        fb5: fb5,
        fb6: fb6,
        fb7: fb7,
        fb8: fb8,
        fb9: fb9,
        fb10: fb10,
        fb11: fb11,
        fb12: fb12,
        fb13: fb13,
        fb14: fb14,
        fb15: fb15,
        fb16: fb16,
        fb17: fb17,
        fb18: fb18,
        fb19: fb19,
        fb20: fb20,
        fb21: fb21,
        fb22: fb22,
        fb23: fb23,
        fb24: fb24,
        fb25: fb25,
        fb26: fb26,
        fb27: fb27,
        fb28: fb28,
        fb29: fb29,
        fb30: fb30,
        fb31: fb31,
      )
    end
  end # struct

  # Filter bank 11 register 2
  struct F11R2
    ADDRESS = BASE_ADDRESS + 0x29c_u64

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

    # Filter bits
    def fb0 : Bool
      @value.bits_set?(0x1_u32)
    end

    # Filter bits
    def self.fb0 : Bool
      value.fb0
    end

    # Filter bits
    def self.fb0=(value : Bool) : Bool
      self.set(fb0: value)
      value
    end

    # Filter bits
    def fb1 : Bool
      @value.bits_set?(0x2_u32)
    end

    # Filter bits
    def self.fb1 : Bool
      value.fb1
    end

    # Filter bits
    def self.fb1=(value : Bool) : Bool
      self.set(fb1: value)
      value
    end

    # Filter bits
    def fb2 : Bool
      @value.bits_set?(0x4_u32)
    end

    # Filter bits
    def self.fb2 : Bool
      value.fb2
    end

    # Filter bits
    def self.fb2=(value : Bool) : Bool
      self.set(fb2: value)
      value
    end

    # Filter bits
    def fb3 : Bool
      @value.bits_set?(0x8_u32)
    end

    # Filter bits
    def self.fb3 : Bool
      value.fb3
    end

    # Filter bits
    def self.fb3=(value : Bool) : Bool
      self.set(fb3: value)
      value
    end

    # Filter bits
    def fb4 : Bool
      @value.bits_set?(0x10_u32)
    end

    # Filter bits
    def self.fb4 : Bool
      value.fb4
    end

    # Filter bits
    def self.fb4=(value : Bool) : Bool
      self.set(fb4: value)
      value
    end

    # Filter bits
    def fb5 : Bool
      @value.bits_set?(0x20_u32)
    end

    # Filter bits
    def self.fb5 : Bool
      value.fb5
    end

    # Filter bits
    def self.fb5=(value : Bool) : Bool
      self.set(fb5: value)
      value
    end

    # Filter bits
    def fb6 : Bool
      @value.bits_set?(0x40_u32)
    end

    # Filter bits
    def self.fb6 : Bool
      value.fb6
    end

    # Filter bits
    def self.fb6=(value : Bool) : Bool
      self.set(fb6: value)
      value
    end

    # Filter bits
    def fb7 : Bool
      @value.bits_set?(0x80_u32)
    end

    # Filter bits
    def self.fb7 : Bool
      value.fb7
    end

    # Filter bits
    def self.fb7=(value : Bool) : Bool
      self.set(fb7: value)
      value
    end

    # Filter bits
    def fb8 : Bool
      @value.bits_set?(0x100_u32)
    end

    # Filter bits
    def self.fb8 : Bool
      value.fb8
    end

    # Filter bits
    def self.fb8=(value : Bool) : Bool
      self.set(fb8: value)
      value
    end

    # Filter bits
    def fb9 : Bool
      @value.bits_set?(0x200_u32)
    end

    # Filter bits
    def self.fb9 : Bool
      value.fb9
    end

    # Filter bits
    def self.fb9=(value : Bool) : Bool
      self.set(fb9: value)
      value
    end

    # Filter bits
    def fb10 : Bool
      @value.bits_set?(0x400_u32)
    end

    # Filter bits
    def self.fb10 : Bool
      value.fb10
    end

    # Filter bits
    def self.fb10=(value : Bool) : Bool
      self.set(fb10: value)
      value
    end

    # Filter bits
    def fb11 : Bool
      @value.bits_set?(0x800_u32)
    end

    # Filter bits
    def self.fb11 : Bool
      value.fb11
    end

    # Filter bits
    def self.fb11=(value : Bool) : Bool
      self.set(fb11: value)
      value
    end

    # Filter bits
    def fb12 : Bool
      @value.bits_set?(0x1000_u32)
    end

    # Filter bits
    def self.fb12 : Bool
      value.fb12
    end

    # Filter bits
    def self.fb12=(value : Bool) : Bool
      self.set(fb12: value)
      value
    end

    # Filter bits
    def fb13 : Bool
      @value.bits_set?(0x2000_u32)
    end

    # Filter bits
    def self.fb13 : Bool
      value.fb13
    end

    # Filter bits
    def self.fb13=(value : Bool) : Bool
      self.set(fb13: value)
      value
    end

    # Filter bits
    def fb14 : Bool
      @value.bits_set?(0x4000_u32)
    end

    # Filter bits
    def self.fb14 : Bool
      value.fb14
    end

    # Filter bits
    def self.fb14=(value : Bool) : Bool
      self.set(fb14: value)
      value
    end

    # Filter bits
    def fb15 : Bool
      @value.bits_set?(0x8000_u32)
    end

    # Filter bits
    def self.fb15 : Bool
      value.fb15
    end

    # Filter bits
    def self.fb15=(value : Bool) : Bool
      self.set(fb15: value)
      value
    end

    # Filter bits
    def fb16 : Bool
      @value.bits_set?(0x10000_u32)
    end

    # Filter bits
    def self.fb16 : Bool
      value.fb16
    end

    # Filter bits
    def self.fb16=(value : Bool) : Bool
      self.set(fb16: value)
      value
    end

    # Filter bits
    def fb17 : Bool
      @value.bits_set?(0x20000_u32)
    end

    # Filter bits
    def self.fb17 : Bool
      value.fb17
    end

    # Filter bits
    def self.fb17=(value : Bool) : Bool
      self.set(fb17: value)
      value
    end

    # Filter bits
    def fb18 : Bool
      @value.bits_set?(0x40000_u32)
    end

    # Filter bits
    def self.fb18 : Bool
      value.fb18
    end

    # Filter bits
    def self.fb18=(value : Bool) : Bool
      self.set(fb18: value)
      value
    end

    # Filter bits
    def fb19 : Bool
      @value.bits_set?(0x80000_u32)
    end

    # Filter bits
    def self.fb19 : Bool
      value.fb19
    end

    # Filter bits
    def self.fb19=(value : Bool) : Bool
      self.set(fb19: value)
      value
    end

    # Filter bits
    def fb20 : Bool
      @value.bits_set?(0x100000_u32)
    end

    # Filter bits
    def self.fb20 : Bool
      value.fb20
    end

    # Filter bits
    def self.fb20=(value : Bool) : Bool
      self.set(fb20: value)
      value
    end

    # Filter bits
    def fb21 : Bool
      @value.bits_set?(0x200000_u32)
    end

    # Filter bits
    def self.fb21 : Bool
      value.fb21
    end

    # Filter bits
    def self.fb21=(value : Bool) : Bool
      self.set(fb21: value)
      value
    end

    # Filter bits
    def fb22 : Bool
      @value.bits_set?(0x400000_u32)
    end

    # Filter bits
    def self.fb22 : Bool
      value.fb22
    end

    # Filter bits
    def self.fb22=(value : Bool) : Bool
      self.set(fb22: value)
      value
    end

    # Filter bits
    def fb23 : Bool
      @value.bits_set?(0x800000_u32)
    end

    # Filter bits
    def self.fb23 : Bool
      value.fb23
    end

    # Filter bits
    def self.fb23=(value : Bool) : Bool
      self.set(fb23: value)
      value
    end

    # Filter bits
    def fb24 : Bool
      @value.bits_set?(0x1000000_u32)
    end

    # Filter bits
    def self.fb24 : Bool
      value.fb24
    end

    # Filter bits
    def self.fb24=(value : Bool) : Bool
      self.set(fb24: value)
      value
    end

    # Filter bits
    def fb25 : Bool
      @value.bits_set?(0x2000000_u32)
    end

    # Filter bits
    def self.fb25 : Bool
      value.fb25
    end

    # Filter bits
    def self.fb25=(value : Bool) : Bool
      self.set(fb25: value)
      value
    end

    # Filter bits
    def fb26 : Bool
      @value.bits_set?(0x4000000_u32)
    end

    # Filter bits
    def self.fb26 : Bool
      value.fb26
    end

    # Filter bits
    def self.fb26=(value : Bool) : Bool
      self.set(fb26: value)
      value
    end

    # Filter bits
    def fb27 : Bool
      @value.bits_set?(0x8000000_u32)
    end

    # Filter bits
    def self.fb27 : Bool
      value.fb27
    end

    # Filter bits
    def self.fb27=(value : Bool) : Bool
      self.set(fb27: value)
      value
    end

    # Filter bits
    def fb28 : Bool
      @value.bits_set?(0x10000000_u32)
    end

    # Filter bits
    def self.fb28 : Bool
      value.fb28
    end

    # Filter bits
    def self.fb28=(value : Bool) : Bool
      self.set(fb28: value)
      value
    end

    # Filter bits
    def fb29 : Bool
      @value.bits_set?(0x20000000_u32)
    end

    # Filter bits
    def self.fb29 : Bool
      value.fb29
    end

    # Filter bits
    def self.fb29=(value : Bool) : Bool
      self.set(fb29: value)
      value
    end

    # Filter bits
    def fb30 : Bool
      @value.bits_set?(0x40000000_u32)
    end

    # Filter bits
    def self.fb30 : Bool
      value.fb30
    end

    # Filter bits
    def self.fb30=(value : Bool) : Bool
      self.set(fb30: value)
      value
    end

    # Filter bits
    def fb31 : Bool
      @value.bits_set?(0x80000000_u32)
    end

    # Filter bits
    def self.fb31 : Bool
      value.fb31
    end

    # Filter bits
    def self.fb31=(value : Bool) : Bool
      self.set(fb31: value)
      value
    end

    def copy_with(
      *,

      fb0 : Bool? = nil,

      fb1 : Bool? = nil,

      fb2 : Bool? = nil,

      fb3 : Bool? = nil,

      fb4 : Bool? = nil,

      fb5 : Bool? = nil,

      fb6 : Bool? = nil,

      fb7 : Bool? = nil,

      fb8 : Bool? = nil,

      fb9 : Bool? = nil,

      fb10 : Bool? = nil,

      fb11 : Bool? = nil,

      fb12 : Bool? = nil,

      fb13 : Bool? = nil,

      fb14 : Bool? = nil,

      fb15 : Bool? = nil,

      fb16 : Bool? = nil,

      fb17 : Bool? = nil,

      fb18 : Bool? = nil,

      fb19 : Bool? = nil,

      fb20 : Bool? = nil,

      fb21 : Bool? = nil,

      fb22 : Bool? = nil,

      fb23 : Bool? = nil,

      fb24 : Bool? = nil,

      fb25 : Bool? = nil,

      fb26 : Bool? = nil,

      fb27 : Bool? = nil,

      fb28 : Bool? = nil,

      fb29 : Bool? = nil,

      fb30 : Bool? = nil,

      fb31 : Bool? = nil
    ) : self
      value = @value

      unless fb0.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(fb0.to_int).&(0x1_u32) << 0
      end

      unless fb1.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(fb1.to_int).&(0x1_u32) << 1
      end

      unless fb2.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(fb2.to_int).&(0x1_u32) << 2
      end

      unless fb3.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(fb3.to_int).&(0x1_u32) << 3
      end

      unless fb4.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(fb4.to_int).&(0x1_u32) << 4
      end

      unless fb5.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(fb5.to_int).&(0x1_u32) << 5
      end

      unless fb6.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(fb6.to_int).&(0x1_u32) << 6
      end

      unless fb7.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(fb7.to_int).&(0x1_u32) << 7
      end

      unless fb8.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(fb8.to_int).&(0x1_u32) << 8
      end

      unless fb9.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(fb9.to_int).&(0x1_u32) << 9
      end

      unless fb10.nil?
        value = (value & 0xfffffbff_u32) |
                UInt32.new!(fb10.to_int).&(0x1_u32) << 10
      end

      unless fb11.nil?
        value = (value & 0xfffff7ff_u32) |
                UInt32.new!(fb11.to_int).&(0x1_u32) << 11
      end

      unless fb12.nil?
        value = (value & 0xffffefff_u32) |
                UInt32.new!(fb12.to_int).&(0x1_u32) << 12
      end

      unless fb13.nil?
        value = (value & 0xffffdfff_u32) |
                UInt32.new!(fb13.to_int).&(0x1_u32) << 13
      end

      unless fb14.nil?
        value = (value & 0xffffbfff_u32) |
                UInt32.new!(fb14.to_int).&(0x1_u32) << 14
      end

      unless fb15.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(fb15.to_int).&(0x1_u32) << 15
      end

      unless fb16.nil?
        value = (value & 0xfffeffff_u32) |
                UInt32.new!(fb16.to_int).&(0x1_u32) << 16
      end

      unless fb17.nil?
        value = (value & 0xfffdffff_u32) |
                UInt32.new!(fb17.to_int).&(0x1_u32) << 17
      end

      unless fb18.nil?
        value = (value & 0xfffbffff_u32) |
                UInt32.new!(fb18.to_int).&(0x1_u32) << 18
      end

      unless fb19.nil?
        value = (value & 0xfff7ffff_u32) |
                UInt32.new!(fb19.to_int).&(0x1_u32) << 19
      end

      unless fb20.nil?
        value = (value & 0xffefffff_u32) |
                UInt32.new!(fb20.to_int).&(0x1_u32) << 20
      end

      unless fb21.nil?
        value = (value & 0xffdfffff_u32) |
                UInt32.new!(fb21.to_int).&(0x1_u32) << 21
      end

      unless fb22.nil?
        value = (value & 0xffbfffff_u32) |
                UInt32.new!(fb22.to_int).&(0x1_u32) << 22
      end

      unless fb23.nil?
        value = (value & 0xff7fffff_u32) |
                UInt32.new!(fb23.to_int).&(0x1_u32) << 23
      end

      unless fb24.nil?
        value = (value & 0xfeffffff_u32) |
                UInt32.new!(fb24.to_int).&(0x1_u32) << 24
      end

      unless fb25.nil?
        value = (value & 0xfdffffff_u32) |
                UInt32.new!(fb25.to_int).&(0x1_u32) << 25
      end

      unless fb26.nil?
        value = (value & 0xfbffffff_u32) |
                UInt32.new!(fb26.to_int).&(0x1_u32) << 26
      end

      unless fb27.nil?
        value = (value & 0xf7ffffff_u32) |
                UInt32.new!(fb27.to_int).&(0x1_u32) << 27
      end

      unless fb28.nil?
        value = (value & 0xefffffff_u32) |
                UInt32.new!(fb28.to_int).&(0x1_u32) << 28
      end

      unless fb29.nil?
        value = (value & 0xdfffffff_u32) |
                UInt32.new!(fb29.to_int).&(0x1_u32) << 29
      end

      unless fb30.nil?
        value = (value & 0xbfffffff_u32) |
                UInt32.new!(fb30.to_int).&(0x1_u32) << 30
      end

      unless fb31.nil?
        value = (value & 0x7fffffff_u32) |
                UInt32.new!(fb31.to_int).&(0x1_u32) << 31
      end

      self.class.new(value)
    end

    def self.set(
      *,
      fb0 : Bool? = nil,
      fb1 : Bool? = nil,
      fb2 : Bool? = nil,
      fb3 : Bool? = nil,
      fb4 : Bool? = nil,
      fb5 : Bool? = nil,
      fb6 : Bool? = nil,
      fb7 : Bool? = nil,
      fb8 : Bool? = nil,
      fb9 : Bool? = nil,
      fb10 : Bool? = nil,
      fb11 : Bool? = nil,
      fb12 : Bool? = nil,
      fb13 : Bool? = nil,
      fb14 : Bool? = nil,
      fb15 : Bool? = nil,
      fb16 : Bool? = nil,
      fb17 : Bool? = nil,
      fb18 : Bool? = nil,
      fb19 : Bool? = nil,
      fb20 : Bool? = nil,
      fb21 : Bool? = nil,
      fb22 : Bool? = nil,
      fb23 : Bool? = nil,
      fb24 : Bool? = nil,
      fb25 : Bool? = nil,
      fb26 : Bool? = nil,
      fb27 : Bool? = nil,
      fb28 : Bool? = nil,
      fb29 : Bool? = nil,
      fb30 : Bool? = nil,
      fb31 : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        fb0: fb0,
        fb1: fb1,
        fb2: fb2,
        fb3: fb3,
        fb4: fb4,
        fb5: fb5,
        fb6: fb6,
        fb7: fb7,
        fb8: fb8,
        fb9: fb9,
        fb10: fb10,
        fb11: fb11,
        fb12: fb12,
        fb13: fb13,
        fb14: fb14,
        fb15: fb15,
        fb16: fb16,
        fb17: fb17,
        fb18: fb18,
        fb19: fb19,
        fb20: fb20,
        fb21: fb21,
        fb22: fb22,
        fb23: fb23,
        fb24: fb24,
        fb25: fb25,
        fb26: fb26,
        fb27: fb27,
        fb28: fb28,
        fb29: fb29,
        fb30: fb30,
        fb31: fb31,
      )
    end
  end # struct

  # Filter bank 4 register 1
  struct F12R1
    ADDRESS = BASE_ADDRESS + 0x2a0_u64

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

    # Filter bits
    def fb0 : Bool
      @value.bits_set?(0x1_u32)
    end

    # Filter bits
    def self.fb0 : Bool
      value.fb0
    end

    # Filter bits
    def self.fb0=(value : Bool) : Bool
      self.set(fb0: value)
      value
    end

    # Filter bits
    def fb1 : Bool
      @value.bits_set?(0x2_u32)
    end

    # Filter bits
    def self.fb1 : Bool
      value.fb1
    end

    # Filter bits
    def self.fb1=(value : Bool) : Bool
      self.set(fb1: value)
      value
    end

    # Filter bits
    def fb2 : Bool
      @value.bits_set?(0x4_u32)
    end

    # Filter bits
    def self.fb2 : Bool
      value.fb2
    end

    # Filter bits
    def self.fb2=(value : Bool) : Bool
      self.set(fb2: value)
      value
    end

    # Filter bits
    def fb3 : Bool
      @value.bits_set?(0x8_u32)
    end

    # Filter bits
    def self.fb3 : Bool
      value.fb3
    end

    # Filter bits
    def self.fb3=(value : Bool) : Bool
      self.set(fb3: value)
      value
    end

    # Filter bits
    def fb4 : Bool
      @value.bits_set?(0x10_u32)
    end

    # Filter bits
    def self.fb4 : Bool
      value.fb4
    end

    # Filter bits
    def self.fb4=(value : Bool) : Bool
      self.set(fb4: value)
      value
    end

    # Filter bits
    def fb5 : Bool
      @value.bits_set?(0x20_u32)
    end

    # Filter bits
    def self.fb5 : Bool
      value.fb5
    end

    # Filter bits
    def self.fb5=(value : Bool) : Bool
      self.set(fb5: value)
      value
    end

    # Filter bits
    def fb6 : Bool
      @value.bits_set?(0x40_u32)
    end

    # Filter bits
    def self.fb6 : Bool
      value.fb6
    end

    # Filter bits
    def self.fb6=(value : Bool) : Bool
      self.set(fb6: value)
      value
    end

    # Filter bits
    def fb7 : Bool
      @value.bits_set?(0x80_u32)
    end

    # Filter bits
    def self.fb7 : Bool
      value.fb7
    end

    # Filter bits
    def self.fb7=(value : Bool) : Bool
      self.set(fb7: value)
      value
    end

    # Filter bits
    def fb8 : Bool
      @value.bits_set?(0x100_u32)
    end

    # Filter bits
    def self.fb8 : Bool
      value.fb8
    end

    # Filter bits
    def self.fb8=(value : Bool) : Bool
      self.set(fb8: value)
      value
    end

    # Filter bits
    def fb9 : Bool
      @value.bits_set?(0x200_u32)
    end

    # Filter bits
    def self.fb9 : Bool
      value.fb9
    end

    # Filter bits
    def self.fb9=(value : Bool) : Bool
      self.set(fb9: value)
      value
    end

    # Filter bits
    def fb10 : Bool
      @value.bits_set?(0x400_u32)
    end

    # Filter bits
    def self.fb10 : Bool
      value.fb10
    end

    # Filter bits
    def self.fb10=(value : Bool) : Bool
      self.set(fb10: value)
      value
    end

    # Filter bits
    def fb11 : Bool
      @value.bits_set?(0x800_u32)
    end

    # Filter bits
    def self.fb11 : Bool
      value.fb11
    end

    # Filter bits
    def self.fb11=(value : Bool) : Bool
      self.set(fb11: value)
      value
    end

    # Filter bits
    def fb12 : Bool
      @value.bits_set?(0x1000_u32)
    end

    # Filter bits
    def self.fb12 : Bool
      value.fb12
    end

    # Filter bits
    def self.fb12=(value : Bool) : Bool
      self.set(fb12: value)
      value
    end

    # Filter bits
    def fb13 : Bool
      @value.bits_set?(0x2000_u32)
    end

    # Filter bits
    def self.fb13 : Bool
      value.fb13
    end

    # Filter bits
    def self.fb13=(value : Bool) : Bool
      self.set(fb13: value)
      value
    end

    # Filter bits
    def fb14 : Bool
      @value.bits_set?(0x4000_u32)
    end

    # Filter bits
    def self.fb14 : Bool
      value.fb14
    end

    # Filter bits
    def self.fb14=(value : Bool) : Bool
      self.set(fb14: value)
      value
    end

    # Filter bits
    def fb15 : Bool
      @value.bits_set?(0x8000_u32)
    end

    # Filter bits
    def self.fb15 : Bool
      value.fb15
    end

    # Filter bits
    def self.fb15=(value : Bool) : Bool
      self.set(fb15: value)
      value
    end

    # Filter bits
    def fb16 : Bool
      @value.bits_set?(0x10000_u32)
    end

    # Filter bits
    def self.fb16 : Bool
      value.fb16
    end

    # Filter bits
    def self.fb16=(value : Bool) : Bool
      self.set(fb16: value)
      value
    end

    # Filter bits
    def fb17 : Bool
      @value.bits_set?(0x20000_u32)
    end

    # Filter bits
    def self.fb17 : Bool
      value.fb17
    end

    # Filter bits
    def self.fb17=(value : Bool) : Bool
      self.set(fb17: value)
      value
    end

    # Filter bits
    def fb18 : Bool
      @value.bits_set?(0x40000_u32)
    end

    # Filter bits
    def self.fb18 : Bool
      value.fb18
    end

    # Filter bits
    def self.fb18=(value : Bool) : Bool
      self.set(fb18: value)
      value
    end

    # Filter bits
    def fb19 : Bool
      @value.bits_set?(0x80000_u32)
    end

    # Filter bits
    def self.fb19 : Bool
      value.fb19
    end

    # Filter bits
    def self.fb19=(value : Bool) : Bool
      self.set(fb19: value)
      value
    end

    # Filter bits
    def fb20 : Bool
      @value.bits_set?(0x100000_u32)
    end

    # Filter bits
    def self.fb20 : Bool
      value.fb20
    end

    # Filter bits
    def self.fb20=(value : Bool) : Bool
      self.set(fb20: value)
      value
    end

    # Filter bits
    def fb21 : Bool
      @value.bits_set?(0x200000_u32)
    end

    # Filter bits
    def self.fb21 : Bool
      value.fb21
    end

    # Filter bits
    def self.fb21=(value : Bool) : Bool
      self.set(fb21: value)
      value
    end

    # Filter bits
    def fb22 : Bool
      @value.bits_set?(0x400000_u32)
    end

    # Filter bits
    def self.fb22 : Bool
      value.fb22
    end

    # Filter bits
    def self.fb22=(value : Bool) : Bool
      self.set(fb22: value)
      value
    end

    # Filter bits
    def fb23 : Bool
      @value.bits_set?(0x800000_u32)
    end

    # Filter bits
    def self.fb23 : Bool
      value.fb23
    end

    # Filter bits
    def self.fb23=(value : Bool) : Bool
      self.set(fb23: value)
      value
    end

    # Filter bits
    def fb24 : Bool
      @value.bits_set?(0x1000000_u32)
    end

    # Filter bits
    def self.fb24 : Bool
      value.fb24
    end

    # Filter bits
    def self.fb24=(value : Bool) : Bool
      self.set(fb24: value)
      value
    end

    # Filter bits
    def fb25 : Bool
      @value.bits_set?(0x2000000_u32)
    end

    # Filter bits
    def self.fb25 : Bool
      value.fb25
    end

    # Filter bits
    def self.fb25=(value : Bool) : Bool
      self.set(fb25: value)
      value
    end

    # Filter bits
    def fb26 : Bool
      @value.bits_set?(0x4000000_u32)
    end

    # Filter bits
    def self.fb26 : Bool
      value.fb26
    end

    # Filter bits
    def self.fb26=(value : Bool) : Bool
      self.set(fb26: value)
      value
    end

    # Filter bits
    def fb27 : Bool
      @value.bits_set?(0x8000000_u32)
    end

    # Filter bits
    def self.fb27 : Bool
      value.fb27
    end

    # Filter bits
    def self.fb27=(value : Bool) : Bool
      self.set(fb27: value)
      value
    end

    # Filter bits
    def fb28 : Bool
      @value.bits_set?(0x10000000_u32)
    end

    # Filter bits
    def self.fb28 : Bool
      value.fb28
    end

    # Filter bits
    def self.fb28=(value : Bool) : Bool
      self.set(fb28: value)
      value
    end

    # Filter bits
    def fb29 : Bool
      @value.bits_set?(0x20000000_u32)
    end

    # Filter bits
    def self.fb29 : Bool
      value.fb29
    end

    # Filter bits
    def self.fb29=(value : Bool) : Bool
      self.set(fb29: value)
      value
    end

    # Filter bits
    def fb30 : Bool
      @value.bits_set?(0x40000000_u32)
    end

    # Filter bits
    def self.fb30 : Bool
      value.fb30
    end

    # Filter bits
    def self.fb30=(value : Bool) : Bool
      self.set(fb30: value)
      value
    end

    # Filter bits
    def fb31 : Bool
      @value.bits_set?(0x80000000_u32)
    end

    # Filter bits
    def self.fb31 : Bool
      value.fb31
    end

    # Filter bits
    def self.fb31=(value : Bool) : Bool
      self.set(fb31: value)
      value
    end

    def copy_with(
      *,

      fb0 : Bool? = nil,

      fb1 : Bool? = nil,

      fb2 : Bool? = nil,

      fb3 : Bool? = nil,

      fb4 : Bool? = nil,

      fb5 : Bool? = nil,

      fb6 : Bool? = nil,

      fb7 : Bool? = nil,

      fb8 : Bool? = nil,

      fb9 : Bool? = nil,

      fb10 : Bool? = nil,

      fb11 : Bool? = nil,

      fb12 : Bool? = nil,

      fb13 : Bool? = nil,

      fb14 : Bool? = nil,

      fb15 : Bool? = nil,

      fb16 : Bool? = nil,

      fb17 : Bool? = nil,

      fb18 : Bool? = nil,

      fb19 : Bool? = nil,

      fb20 : Bool? = nil,

      fb21 : Bool? = nil,

      fb22 : Bool? = nil,

      fb23 : Bool? = nil,

      fb24 : Bool? = nil,

      fb25 : Bool? = nil,

      fb26 : Bool? = nil,

      fb27 : Bool? = nil,

      fb28 : Bool? = nil,

      fb29 : Bool? = nil,

      fb30 : Bool? = nil,

      fb31 : Bool? = nil
    ) : self
      value = @value

      unless fb0.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(fb0.to_int).&(0x1_u32) << 0
      end

      unless fb1.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(fb1.to_int).&(0x1_u32) << 1
      end

      unless fb2.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(fb2.to_int).&(0x1_u32) << 2
      end

      unless fb3.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(fb3.to_int).&(0x1_u32) << 3
      end

      unless fb4.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(fb4.to_int).&(0x1_u32) << 4
      end

      unless fb5.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(fb5.to_int).&(0x1_u32) << 5
      end

      unless fb6.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(fb6.to_int).&(0x1_u32) << 6
      end

      unless fb7.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(fb7.to_int).&(0x1_u32) << 7
      end

      unless fb8.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(fb8.to_int).&(0x1_u32) << 8
      end

      unless fb9.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(fb9.to_int).&(0x1_u32) << 9
      end

      unless fb10.nil?
        value = (value & 0xfffffbff_u32) |
                UInt32.new!(fb10.to_int).&(0x1_u32) << 10
      end

      unless fb11.nil?
        value = (value & 0xfffff7ff_u32) |
                UInt32.new!(fb11.to_int).&(0x1_u32) << 11
      end

      unless fb12.nil?
        value = (value & 0xffffefff_u32) |
                UInt32.new!(fb12.to_int).&(0x1_u32) << 12
      end

      unless fb13.nil?
        value = (value & 0xffffdfff_u32) |
                UInt32.new!(fb13.to_int).&(0x1_u32) << 13
      end

      unless fb14.nil?
        value = (value & 0xffffbfff_u32) |
                UInt32.new!(fb14.to_int).&(0x1_u32) << 14
      end

      unless fb15.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(fb15.to_int).&(0x1_u32) << 15
      end

      unless fb16.nil?
        value = (value & 0xfffeffff_u32) |
                UInt32.new!(fb16.to_int).&(0x1_u32) << 16
      end

      unless fb17.nil?
        value = (value & 0xfffdffff_u32) |
                UInt32.new!(fb17.to_int).&(0x1_u32) << 17
      end

      unless fb18.nil?
        value = (value & 0xfffbffff_u32) |
                UInt32.new!(fb18.to_int).&(0x1_u32) << 18
      end

      unless fb19.nil?
        value = (value & 0xfff7ffff_u32) |
                UInt32.new!(fb19.to_int).&(0x1_u32) << 19
      end

      unless fb20.nil?
        value = (value & 0xffefffff_u32) |
                UInt32.new!(fb20.to_int).&(0x1_u32) << 20
      end

      unless fb21.nil?
        value = (value & 0xffdfffff_u32) |
                UInt32.new!(fb21.to_int).&(0x1_u32) << 21
      end

      unless fb22.nil?
        value = (value & 0xffbfffff_u32) |
                UInt32.new!(fb22.to_int).&(0x1_u32) << 22
      end

      unless fb23.nil?
        value = (value & 0xff7fffff_u32) |
                UInt32.new!(fb23.to_int).&(0x1_u32) << 23
      end

      unless fb24.nil?
        value = (value & 0xfeffffff_u32) |
                UInt32.new!(fb24.to_int).&(0x1_u32) << 24
      end

      unless fb25.nil?
        value = (value & 0xfdffffff_u32) |
                UInt32.new!(fb25.to_int).&(0x1_u32) << 25
      end

      unless fb26.nil?
        value = (value & 0xfbffffff_u32) |
                UInt32.new!(fb26.to_int).&(0x1_u32) << 26
      end

      unless fb27.nil?
        value = (value & 0xf7ffffff_u32) |
                UInt32.new!(fb27.to_int).&(0x1_u32) << 27
      end

      unless fb28.nil?
        value = (value & 0xefffffff_u32) |
                UInt32.new!(fb28.to_int).&(0x1_u32) << 28
      end

      unless fb29.nil?
        value = (value & 0xdfffffff_u32) |
                UInt32.new!(fb29.to_int).&(0x1_u32) << 29
      end

      unless fb30.nil?
        value = (value & 0xbfffffff_u32) |
                UInt32.new!(fb30.to_int).&(0x1_u32) << 30
      end

      unless fb31.nil?
        value = (value & 0x7fffffff_u32) |
                UInt32.new!(fb31.to_int).&(0x1_u32) << 31
      end

      self.class.new(value)
    end

    def self.set(
      *,
      fb0 : Bool? = nil,
      fb1 : Bool? = nil,
      fb2 : Bool? = nil,
      fb3 : Bool? = nil,
      fb4 : Bool? = nil,
      fb5 : Bool? = nil,
      fb6 : Bool? = nil,
      fb7 : Bool? = nil,
      fb8 : Bool? = nil,
      fb9 : Bool? = nil,
      fb10 : Bool? = nil,
      fb11 : Bool? = nil,
      fb12 : Bool? = nil,
      fb13 : Bool? = nil,
      fb14 : Bool? = nil,
      fb15 : Bool? = nil,
      fb16 : Bool? = nil,
      fb17 : Bool? = nil,
      fb18 : Bool? = nil,
      fb19 : Bool? = nil,
      fb20 : Bool? = nil,
      fb21 : Bool? = nil,
      fb22 : Bool? = nil,
      fb23 : Bool? = nil,
      fb24 : Bool? = nil,
      fb25 : Bool? = nil,
      fb26 : Bool? = nil,
      fb27 : Bool? = nil,
      fb28 : Bool? = nil,
      fb29 : Bool? = nil,
      fb30 : Bool? = nil,
      fb31 : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        fb0: fb0,
        fb1: fb1,
        fb2: fb2,
        fb3: fb3,
        fb4: fb4,
        fb5: fb5,
        fb6: fb6,
        fb7: fb7,
        fb8: fb8,
        fb9: fb9,
        fb10: fb10,
        fb11: fb11,
        fb12: fb12,
        fb13: fb13,
        fb14: fb14,
        fb15: fb15,
        fb16: fb16,
        fb17: fb17,
        fb18: fb18,
        fb19: fb19,
        fb20: fb20,
        fb21: fb21,
        fb22: fb22,
        fb23: fb23,
        fb24: fb24,
        fb25: fb25,
        fb26: fb26,
        fb27: fb27,
        fb28: fb28,
        fb29: fb29,
        fb30: fb30,
        fb31: fb31,
      )
    end
  end # struct

  # Filter bank 12 register 2
  struct F12R2
    ADDRESS = BASE_ADDRESS + 0x2a4_u64

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

    # Filter bits
    def fb0 : Bool
      @value.bits_set?(0x1_u32)
    end

    # Filter bits
    def self.fb0 : Bool
      value.fb0
    end

    # Filter bits
    def self.fb0=(value : Bool) : Bool
      self.set(fb0: value)
      value
    end

    # Filter bits
    def fb1 : Bool
      @value.bits_set?(0x2_u32)
    end

    # Filter bits
    def self.fb1 : Bool
      value.fb1
    end

    # Filter bits
    def self.fb1=(value : Bool) : Bool
      self.set(fb1: value)
      value
    end

    # Filter bits
    def fb2 : Bool
      @value.bits_set?(0x4_u32)
    end

    # Filter bits
    def self.fb2 : Bool
      value.fb2
    end

    # Filter bits
    def self.fb2=(value : Bool) : Bool
      self.set(fb2: value)
      value
    end

    # Filter bits
    def fb3 : Bool
      @value.bits_set?(0x8_u32)
    end

    # Filter bits
    def self.fb3 : Bool
      value.fb3
    end

    # Filter bits
    def self.fb3=(value : Bool) : Bool
      self.set(fb3: value)
      value
    end

    # Filter bits
    def fb4 : Bool
      @value.bits_set?(0x10_u32)
    end

    # Filter bits
    def self.fb4 : Bool
      value.fb4
    end

    # Filter bits
    def self.fb4=(value : Bool) : Bool
      self.set(fb4: value)
      value
    end

    # Filter bits
    def fb5 : Bool
      @value.bits_set?(0x20_u32)
    end

    # Filter bits
    def self.fb5 : Bool
      value.fb5
    end

    # Filter bits
    def self.fb5=(value : Bool) : Bool
      self.set(fb5: value)
      value
    end

    # Filter bits
    def fb6 : Bool
      @value.bits_set?(0x40_u32)
    end

    # Filter bits
    def self.fb6 : Bool
      value.fb6
    end

    # Filter bits
    def self.fb6=(value : Bool) : Bool
      self.set(fb6: value)
      value
    end

    # Filter bits
    def fb7 : Bool
      @value.bits_set?(0x80_u32)
    end

    # Filter bits
    def self.fb7 : Bool
      value.fb7
    end

    # Filter bits
    def self.fb7=(value : Bool) : Bool
      self.set(fb7: value)
      value
    end

    # Filter bits
    def fb8 : Bool
      @value.bits_set?(0x100_u32)
    end

    # Filter bits
    def self.fb8 : Bool
      value.fb8
    end

    # Filter bits
    def self.fb8=(value : Bool) : Bool
      self.set(fb8: value)
      value
    end

    # Filter bits
    def fb9 : Bool
      @value.bits_set?(0x200_u32)
    end

    # Filter bits
    def self.fb9 : Bool
      value.fb9
    end

    # Filter bits
    def self.fb9=(value : Bool) : Bool
      self.set(fb9: value)
      value
    end

    # Filter bits
    def fb10 : Bool
      @value.bits_set?(0x400_u32)
    end

    # Filter bits
    def self.fb10 : Bool
      value.fb10
    end

    # Filter bits
    def self.fb10=(value : Bool) : Bool
      self.set(fb10: value)
      value
    end

    # Filter bits
    def fb11 : Bool
      @value.bits_set?(0x800_u32)
    end

    # Filter bits
    def self.fb11 : Bool
      value.fb11
    end

    # Filter bits
    def self.fb11=(value : Bool) : Bool
      self.set(fb11: value)
      value
    end

    # Filter bits
    def fb12 : Bool
      @value.bits_set?(0x1000_u32)
    end

    # Filter bits
    def self.fb12 : Bool
      value.fb12
    end

    # Filter bits
    def self.fb12=(value : Bool) : Bool
      self.set(fb12: value)
      value
    end

    # Filter bits
    def fb13 : Bool
      @value.bits_set?(0x2000_u32)
    end

    # Filter bits
    def self.fb13 : Bool
      value.fb13
    end

    # Filter bits
    def self.fb13=(value : Bool) : Bool
      self.set(fb13: value)
      value
    end

    # Filter bits
    def fb14 : Bool
      @value.bits_set?(0x4000_u32)
    end

    # Filter bits
    def self.fb14 : Bool
      value.fb14
    end

    # Filter bits
    def self.fb14=(value : Bool) : Bool
      self.set(fb14: value)
      value
    end

    # Filter bits
    def fb15 : Bool
      @value.bits_set?(0x8000_u32)
    end

    # Filter bits
    def self.fb15 : Bool
      value.fb15
    end

    # Filter bits
    def self.fb15=(value : Bool) : Bool
      self.set(fb15: value)
      value
    end

    # Filter bits
    def fb16 : Bool
      @value.bits_set?(0x10000_u32)
    end

    # Filter bits
    def self.fb16 : Bool
      value.fb16
    end

    # Filter bits
    def self.fb16=(value : Bool) : Bool
      self.set(fb16: value)
      value
    end

    # Filter bits
    def fb17 : Bool
      @value.bits_set?(0x20000_u32)
    end

    # Filter bits
    def self.fb17 : Bool
      value.fb17
    end

    # Filter bits
    def self.fb17=(value : Bool) : Bool
      self.set(fb17: value)
      value
    end

    # Filter bits
    def fb18 : Bool
      @value.bits_set?(0x40000_u32)
    end

    # Filter bits
    def self.fb18 : Bool
      value.fb18
    end

    # Filter bits
    def self.fb18=(value : Bool) : Bool
      self.set(fb18: value)
      value
    end

    # Filter bits
    def fb19 : Bool
      @value.bits_set?(0x80000_u32)
    end

    # Filter bits
    def self.fb19 : Bool
      value.fb19
    end

    # Filter bits
    def self.fb19=(value : Bool) : Bool
      self.set(fb19: value)
      value
    end

    # Filter bits
    def fb20 : Bool
      @value.bits_set?(0x100000_u32)
    end

    # Filter bits
    def self.fb20 : Bool
      value.fb20
    end

    # Filter bits
    def self.fb20=(value : Bool) : Bool
      self.set(fb20: value)
      value
    end

    # Filter bits
    def fb21 : Bool
      @value.bits_set?(0x200000_u32)
    end

    # Filter bits
    def self.fb21 : Bool
      value.fb21
    end

    # Filter bits
    def self.fb21=(value : Bool) : Bool
      self.set(fb21: value)
      value
    end

    # Filter bits
    def fb22 : Bool
      @value.bits_set?(0x400000_u32)
    end

    # Filter bits
    def self.fb22 : Bool
      value.fb22
    end

    # Filter bits
    def self.fb22=(value : Bool) : Bool
      self.set(fb22: value)
      value
    end

    # Filter bits
    def fb23 : Bool
      @value.bits_set?(0x800000_u32)
    end

    # Filter bits
    def self.fb23 : Bool
      value.fb23
    end

    # Filter bits
    def self.fb23=(value : Bool) : Bool
      self.set(fb23: value)
      value
    end

    # Filter bits
    def fb24 : Bool
      @value.bits_set?(0x1000000_u32)
    end

    # Filter bits
    def self.fb24 : Bool
      value.fb24
    end

    # Filter bits
    def self.fb24=(value : Bool) : Bool
      self.set(fb24: value)
      value
    end

    # Filter bits
    def fb25 : Bool
      @value.bits_set?(0x2000000_u32)
    end

    # Filter bits
    def self.fb25 : Bool
      value.fb25
    end

    # Filter bits
    def self.fb25=(value : Bool) : Bool
      self.set(fb25: value)
      value
    end

    # Filter bits
    def fb26 : Bool
      @value.bits_set?(0x4000000_u32)
    end

    # Filter bits
    def self.fb26 : Bool
      value.fb26
    end

    # Filter bits
    def self.fb26=(value : Bool) : Bool
      self.set(fb26: value)
      value
    end

    # Filter bits
    def fb27 : Bool
      @value.bits_set?(0x8000000_u32)
    end

    # Filter bits
    def self.fb27 : Bool
      value.fb27
    end

    # Filter bits
    def self.fb27=(value : Bool) : Bool
      self.set(fb27: value)
      value
    end

    # Filter bits
    def fb28 : Bool
      @value.bits_set?(0x10000000_u32)
    end

    # Filter bits
    def self.fb28 : Bool
      value.fb28
    end

    # Filter bits
    def self.fb28=(value : Bool) : Bool
      self.set(fb28: value)
      value
    end

    # Filter bits
    def fb29 : Bool
      @value.bits_set?(0x20000000_u32)
    end

    # Filter bits
    def self.fb29 : Bool
      value.fb29
    end

    # Filter bits
    def self.fb29=(value : Bool) : Bool
      self.set(fb29: value)
      value
    end

    # Filter bits
    def fb30 : Bool
      @value.bits_set?(0x40000000_u32)
    end

    # Filter bits
    def self.fb30 : Bool
      value.fb30
    end

    # Filter bits
    def self.fb30=(value : Bool) : Bool
      self.set(fb30: value)
      value
    end

    # Filter bits
    def fb31 : Bool
      @value.bits_set?(0x80000000_u32)
    end

    # Filter bits
    def self.fb31 : Bool
      value.fb31
    end

    # Filter bits
    def self.fb31=(value : Bool) : Bool
      self.set(fb31: value)
      value
    end

    def copy_with(
      *,

      fb0 : Bool? = nil,

      fb1 : Bool? = nil,

      fb2 : Bool? = nil,

      fb3 : Bool? = nil,

      fb4 : Bool? = nil,

      fb5 : Bool? = nil,

      fb6 : Bool? = nil,

      fb7 : Bool? = nil,

      fb8 : Bool? = nil,

      fb9 : Bool? = nil,

      fb10 : Bool? = nil,

      fb11 : Bool? = nil,

      fb12 : Bool? = nil,

      fb13 : Bool? = nil,

      fb14 : Bool? = nil,

      fb15 : Bool? = nil,

      fb16 : Bool? = nil,

      fb17 : Bool? = nil,

      fb18 : Bool? = nil,

      fb19 : Bool? = nil,

      fb20 : Bool? = nil,

      fb21 : Bool? = nil,

      fb22 : Bool? = nil,

      fb23 : Bool? = nil,

      fb24 : Bool? = nil,

      fb25 : Bool? = nil,

      fb26 : Bool? = nil,

      fb27 : Bool? = nil,

      fb28 : Bool? = nil,

      fb29 : Bool? = nil,

      fb30 : Bool? = nil,

      fb31 : Bool? = nil
    ) : self
      value = @value

      unless fb0.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(fb0.to_int).&(0x1_u32) << 0
      end

      unless fb1.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(fb1.to_int).&(0x1_u32) << 1
      end

      unless fb2.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(fb2.to_int).&(0x1_u32) << 2
      end

      unless fb3.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(fb3.to_int).&(0x1_u32) << 3
      end

      unless fb4.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(fb4.to_int).&(0x1_u32) << 4
      end

      unless fb5.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(fb5.to_int).&(0x1_u32) << 5
      end

      unless fb6.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(fb6.to_int).&(0x1_u32) << 6
      end

      unless fb7.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(fb7.to_int).&(0x1_u32) << 7
      end

      unless fb8.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(fb8.to_int).&(0x1_u32) << 8
      end

      unless fb9.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(fb9.to_int).&(0x1_u32) << 9
      end

      unless fb10.nil?
        value = (value & 0xfffffbff_u32) |
                UInt32.new!(fb10.to_int).&(0x1_u32) << 10
      end

      unless fb11.nil?
        value = (value & 0xfffff7ff_u32) |
                UInt32.new!(fb11.to_int).&(0x1_u32) << 11
      end

      unless fb12.nil?
        value = (value & 0xffffefff_u32) |
                UInt32.new!(fb12.to_int).&(0x1_u32) << 12
      end

      unless fb13.nil?
        value = (value & 0xffffdfff_u32) |
                UInt32.new!(fb13.to_int).&(0x1_u32) << 13
      end

      unless fb14.nil?
        value = (value & 0xffffbfff_u32) |
                UInt32.new!(fb14.to_int).&(0x1_u32) << 14
      end

      unless fb15.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(fb15.to_int).&(0x1_u32) << 15
      end

      unless fb16.nil?
        value = (value & 0xfffeffff_u32) |
                UInt32.new!(fb16.to_int).&(0x1_u32) << 16
      end

      unless fb17.nil?
        value = (value & 0xfffdffff_u32) |
                UInt32.new!(fb17.to_int).&(0x1_u32) << 17
      end

      unless fb18.nil?
        value = (value & 0xfffbffff_u32) |
                UInt32.new!(fb18.to_int).&(0x1_u32) << 18
      end

      unless fb19.nil?
        value = (value & 0xfff7ffff_u32) |
                UInt32.new!(fb19.to_int).&(0x1_u32) << 19
      end

      unless fb20.nil?
        value = (value & 0xffefffff_u32) |
                UInt32.new!(fb20.to_int).&(0x1_u32) << 20
      end

      unless fb21.nil?
        value = (value & 0xffdfffff_u32) |
                UInt32.new!(fb21.to_int).&(0x1_u32) << 21
      end

      unless fb22.nil?
        value = (value & 0xffbfffff_u32) |
                UInt32.new!(fb22.to_int).&(0x1_u32) << 22
      end

      unless fb23.nil?
        value = (value & 0xff7fffff_u32) |
                UInt32.new!(fb23.to_int).&(0x1_u32) << 23
      end

      unless fb24.nil?
        value = (value & 0xfeffffff_u32) |
                UInt32.new!(fb24.to_int).&(0x1_u32) << 24
      end

      unless fb25.nil?
        value = (value & 0xfdffffff_u32) |
                UInt32.new!(fb25.to_int).&(0x1_u32) << 25
      end

      unless fb26.nil?
        value = (value & 0xfbffffff_u32) |
                UInt32.new!(fb26.to_int).&(0x1_u32) << 26
      end

      unless fb27.nil?
        value = (value & 0xf7ffffff_u32) |
                UInt32.new!(fb27.to_int).&(0x1_u32) << 27
      end

      unless fb28.nil?
        value = (value & 0xefffffff_u32) |
                UInt32.new!(fb28.to_int).&(0x1_u32) << 28
      end

      unless fb29.nil?
        value = (value & 0xdfffffff_u32) |
                UInt32.new!(fb29.to_int).&(0x1_u32) << 29
      end

      unless fb30.nil?
        value = (value & 0xbfffffff_u32) |
                UInt32.new!(fb30.to_int).&(0x1_u32) << 30
      end

      unless fb31.nil?
        value = (value & 0x7fffffff_u32) |
                UInt32.new!(fb31.to_int).&(0x1_u32) << 31
      end

      self.class.new(value)
    end

    def self.set(
      *,
      fb0 : Bool? = nil,
      fb1 : Bool? = nil,
      fb2 : Bool? = nil,
      fb3 : Bool? = nil,
      fb4 : Bool? = nil,
      fb5 : Bool? = nil,
      fb6 : Bool? = nil,
      fb7 : Bool? = nil,
      fb8 : Bool? = nil,
      fb9 : Bool? = nil,
      fb10 : Bool? = nil,
      fb11 : Bool? = nil,
      fb12 : Bool? = nil,
      fb13 : Bool? = nil,
      fb14 : Bool? = nil,
      fb15 : Bool? = nil,
      fb16 : Bool? = nil,
      fb17 : Bool? = nil,
      fb18 : Bool? = nil,
      fb19 : Bool? = nil,
      fb20 : Bool? = nil,
      fb21 : Bool? = nil,
      fb22 : Bool? = nil,
      fb23 : Bool? = nil,
      fb24 : Bool? = nil,
      fb25 : Bool? = nil,
      fb26 : Bool? = nil,
      fb27 : Bool? = nil,
      fb28 : Bool? = nil,
      fb29 : Bool? = nil,
      fb30 : Bool? = nil,
      fb31 : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        fb0: fb0,
        fb1: fb1,
        fb2: fb2,
        fb3: fb3,
        fb4: fb4,
        fb5: fb5,
        fb6: fb6,
        fb7: fb7,
        fb8: fb8,
        fb9: fb9,
        fb10: fb10,
        fb11: fb11,
        fb12: fb12,
        fb13: fb13,
        fb14: fb14,
        fb15: fb15,
        fb16: fb16,
        fb17: fb17,
        fb18: fb18,
        fb19: fb19,
        fb20: fb20,
        fb21: fb21,
        fb22: fb22,
        fb23: fb23,
        fb24: fb24,
        fb25: fb25,
        fb26: fb26,
        fb27: fb27,
        fb28: fb28,
        fb29: fb29,
        fb30: fb30,
        fb31: fb31,
      )
    end
  end # struct

  # Filter bank 13 register 1
  struct F13R1
    ADDRESS = BASE_ADDRESS + 0x2a8_u64

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

    # Filter bits
    def fb0 : Bool
      @value.bits_set?(0x1_u32)
    end

    # Filter bits
    def self.fb0 : Bool
      value.fb0
    end

    # Filter bits
    def self.fb0=(value : Bool) : Bool
      self.set(fb0: value)
      value
    end

    # Filter bits
    def fb1 : Bool
      @value.bits_set?(0x2_u32)
    end

    # Filter bits
    def self.fb1 : Bool
      value.fb1
    end

    # Filter bits
    def self.fb1=(value : Bool) : Bool
      self.set(fb1: value)
      value
    end

    # Filter bits
    def fb2 : Bool
      @value.bits_set?(0x4_u32)
    end

    # Filter bits
    def self.fb2 : Bool
      value.fb2
    end

    # Filter bits
    def self.fb2=(value : Bool) : Bool
      self.set(fb2: value)
      value
    end

    # Filter bits
    def fb3 : Bool
      @value.bits_set?(0x8_u32)
    end

    # Filter bits
    def self.fb3 : Bool
      value.fb3
    end

    # Filter bits
    def self.fb3=(value : Bool) : Bool
      self.set(fb3: value)
      value
    end

    # Filter bits
    def fb4 : Bool
      @value.bits_set?(0x10_u32)
    end

    # Filter bits
    def self.fb4 : Bool
      value.fb4
    end

    # Filter bits
    def self.fb4=(value : Bool) : Bool
      self.set(fb4: value)
      value
    end

    # Filter bits
    def fb5 : Bool
      @value.bits_set?(0x20_u32)
    end

    # Filter bits
    def self.fb5 : Bool
      value.fb5
    end

    # Filter bits
    def self.fb5=(value : Bool) : Bool
      self.set(fb5: value)
      value
    end

    # Filter bits
    def fb6 : Bool
      @value.bits_set?(0x40_u32)
    end

    # Filter bits
    def self.fb6 : Bool
      value.fb6
    end

    # Filter bits
    def self.fb6=(value : Bool) : Bool
      self.set(fb6: value)
      value
    end

    # Filter bits
    def fb7 : Bool
      @value.bits_set?(0x80_u32)
    end

    # Filter bits
    def self.fb7 : Bool
      value.fb7
    end

    # Filter bits
    def self.fb7=(value : Bool) : Bool
      self.set(fb7: value)
      value
    end

    # Filter bits
    def fb8 : Bool
      @value.bits_set?(0x100_u32)
    end

    # Filter bits
    def self.fb8 : Bool
      value.fb8
    end

    # Filter bits
    def self.fb8=(value : Bool) : Bool
      self.set(fb8: value)
      value
    end

    # Filter bits
    def fb9 : Bool
      @value.bits_set?(0x200_u32)
    end

    # Filter bits
    def self.fb9 : Bool
      value.fb9
    end

    # Filter bits
    def self.fb9=(value : Bool) : Bool
      self.set(fb9: value)
      value
    end

    # Filter bits
    def fb10 : Bool
      @value.bits_set?(0x400_u32)
    end

    # Filter bits
    def self.fb10 : Bool
      value.fb10
    end

    # Filter bits
    def self.fb10=(value : Bool) : Bool
      self.set(fb10: value)
      value
    end

    # Filter bits
    def fb11 : Bool
      @value.bits_set?(0x800_u32)
    end

    # Filter bits
    def self.fb11 : Bool
      value.fb11
    end

    # Filter bits
    def self.fb11=(value : Bool) : Bool
      self.set(fb11: value)
      value
    end

    # Filter bits
    def fb12 : Bool
      @value.bits_set?(0x1000_u32)
    end

    # Filter bits
    def self.fb12 : Bool
      value.fb12
    end

    # Filter bits
    def self.fb12=(value : Bool) : Bool
      self.set(fb12: value)
      value
    end

    # Filter bits
    def fb13 : Bool
      @value.bits_set?(0x2000_u32)
    end

    # Filter bits
    def self.fb13 : Bool
      value.fb13
    end

    # Filter bits
    def self.fb13=(value : Bool) : Bool
      self.set(fb13: value)
      value
    end

    # Filter bits
    def fb14 : Bool
      @value.bits_set?(0x4000_u32)
    end

    # Filter bits
    def self.fb14 : Bool
      value.fb14
    end

    # Filter bits
    def self.fb14=(value : Bool) : Bool
      self.set(fb14: value)
      value
    end

    # Filter bits
    def fb15 : Bool
      @value.bits_set?(0x8000_u32)
    end

    # Filter bits
    def self.fb15 : Bool
      value.fb15
    end

    # Filter bits
    def self.fb15=(value : Bool) : Bool
      self.set(fb15: value)
      value
    end

    # Filter bits
    def fb16 : Bool
      @value.bits_set?(0x10000_u32)
    end

    # Filter bits
    def self.fb16 : Bool
      value.fb16
    end

    # Filter bits
    def self.fb16=(value : Bool) : Bool
      self.set(fb16: value)
      value
    end

    # Filter bits
    def fb17 : Bool
      @value.bits_set?(0x20000_u32)
    end

    # Filter bits
    def self.fb17 : Bool
      value.fb17
    end

    # Filter bits
    def self.fb17=(value : Bool) : Bool
      self.set(fb17: value)
      value
    end

    # Filter bits
    def fb18 : Bool
      @value.bits_set?(0x40000_u32)
    end

    # Filter bits
    def self.fb18 : Bool
      value.fb18
    end

    # Filter bits
    def self.fb18=(value : Bool) : Bool
      self.set(fb18: value)
      value
    end

    # Filter bits
    def fb19 : Bool
      @value.bits_set?(0x80000_u32)
    end

    # Filter bits
    def self.fb19 : Bool
      value.fb19
    end

    # Filter bits
    def self.fb19=(value : Bool) : Bool
      self.set(fb19: value)
      value
    end

    # Filter bits
    def fb20 : Bool
      @value.bits_set?(0x100000_u32)
    end

    # Filter bits
    def self.fb20 : Bool
      value.fb20
    end

    # Filter bits
    def self.fb20=(value : Bool) : Bool
      self.set(fb20: value)
      value
    end

    # Filter bits
    def fb21 : Bool
      @value.bits_set?(0x200000_u32)
    end

    # Filter bits
    def self.fb21 : Bool
      value.fb21
    end

    # Filter bits
    def self.fb21=(value : Bool) : Bool
      self.set(fb21: value)
      value
    end

    # Filter bits
    def fb22 : Bool
      @value.bits_set?(0x400000_u32)
    end

    # Filter bits
    def self.fb22 : Bool
      value.fb22
    end

    # Filter bits
    def self.fb22=(value : Bool) : Bool
      self.set(fb22: value)
      value
    end

    # Filter bits
    def fb23 : Bool
      @value.bits_set?(0x800000_u32)
    end

    # Filter bits
    def self.fb23 : Bool
      value.fb23
    end

    # Filter bits
    def self.fb23=(value : Bool) : Bool
      self.set(fb23: value)
      value
    end

    # Filter bits
    def fb24 : Bool
      @value.bits_set?(0x1000000_u32)
    end

    # Filter bits
    def self.fb24 : Bool
      value.fb24
    end

    # Filter bits
    def self.fb24=(value : Bool) : Bool
      self.set(fb24: value)
      value
    end

    # Filter bits
    def fb25 : Bool
      @value.bits_set?(0x2000000_u32)
    end

    # Filter bits
    def self.fb25 : Bool
      value.fb25
    end

    # Filter bits
    def self.fb25=(value : Bool) : Bool
      self.set(fb25: value)
      value
    end

    # Filter bits
    def fb26 : Bool
      @value.bits_set?(0x4000000_u32)
    end

    # Filter bits
    def self.fb26 : Bool
      value.fb26
    end

    # Filter bits
    def self.fb26=(value : Bool) : Bool
      self.set(fb26: value)
      value
    end

    # Filter bits
    def fb27 : Bool
      @value.bits_set?(0x8000000_u32)
    end

    # Filter bits
    def self.fb27 : Bool
      value.fb27
    end

    # Filter bits
    def self.fb27=(value : Bool) : Bool
      self.set(fb27: value)
      value
    end

    # Filter bits
    def fb28 : Bool
      @value.bits_set?(0x10000000_u32)
    end

    # Filter bits
    def self.fb28 : Bool
      value.fb28
    end

    # Filter bits
    def self.fb28=(value : Bool) : Bool
      self.set(fb28: value)
      value
    end

    # Filter bits
    def fb29 : Bool
      @value.bits_set?(0x20000000_u32)
    end

    # Filter bits
    def self.fb29 : Bool
      value.fb29
    end

    # Filter bits
    def self.fb29=(value : Bool) : Bool
      self.set(fb29: value)
      value
    end

    # Filter bits
    def fb30 : Bool
      @value.bits_set?(0x40000000_u32)
    end

    # Filter bits
    def self.fb30 : Bool
      value.fb30
    end

    # Filter bits
    def self.fb30=(value : Bool) : Bool
      self.set(fb30: value)
      value
    end

    # Filter bits
    def fb31 : Bool
      @value.bits_set?(0x80000000_u32)
    end

    # Filter bits
    def self.fb31 : Bool
      value.fb31
    end

    # Filter bits
    def self.fb31=(value : Bool) : Bool
      self.set(fb31: value)
      value
    end

    def copy_with(
      *,

      fb0 : Bool? = nil,

      fb1 : Bool? = nil,

      fb2 : Bool? = nil,

      fb3 : Bool? = nil,

      fb4 : Bool? = nil,

      fb5 : Bool? = nil,

      fb6 : Bool? = nil,

      fb7 : Bool? = nil,

      fb8 : Bool? = nil,

      fb9 : Bool? = nil,

      fb10 : Bool? = nil,

      fb11 : Bool? = nil,

      fb12 : Bool? = nil,

      fb13 : Bool? = nil,

      fb14 : Bool? = nil,

      fb15 : Bool? = nil,

      fb16 : Bool? = nil,

      fb17 : Bool? = nil,

      fb18 : Bool? = nil,

      fb19 : Bool? = nil,

      fb20 : Bool? = nil,

      fb21 : Bool? = nil,

      fb22 : Bool? = nil,

      fb23 : Bool? = nil,

      fb24 : Bool? = nil,

      fb25 : Bool? = nil,

      fb26 : Bool? = nil,

      fb27 : Bool? = nil,

      fb28 : Bool? = nil,

      fb29 : Bool? = nil,

      fb30 : Bool? = nil,

      fb31 : Bool? = nil
    ) : self
      value = @value

      unless fb0.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(fb0.to_int).&(0x1_u32) << 0
      end

      unless fb1.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(fb1.to_int).&(0x1_u32) << 1
      end

      unless fb2.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(fb2.to_int).&(0x1_u32) << 2
      end

      unless fb3.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(fb3.to_int).&(0x1_u32) << 3
      end

      unless fb4.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(fb4.to_int).&(0x1_u32) << 4
      end

      unless fb5.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(fb5.to_int).&(0x1_u32) << 5
      end

      unless fb6.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(fb6.to_int).&(0x1_u32) << 6
      end

      unless fb7.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(fb7.to_int).&(0x1_u32) << 7
      end

      unless fb8.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(fb8.to_int).&(0x1_u32) << 8
      end

      unless fb9.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(fb9.to_int).&(0x1_u32) << 9
      end

      unless fb10.nil?
        value = (value & 0xfffffbff_u32) |
                UInt32.new!(fb10.to_int).&(0x1_u32) << 10
      end

      unless fb11.nil?
        value = (value & 0xfffff7ff_u32) |
                UInt32.new!(fb11.to_int).&(0x1_u32) << 11
      end

      unless fb12.nil?
        value = (value & 0xffffefff_u32) |
                UInt32.new!(fb12.to_int).&(0x1_u32) << 12
      end

      unless fb13.nil?
        value = (value & 0xffffdfff_u32) |
                UInt32.new!(fb13.to_int).&(0x1_u32) << 13
      end

      unless fb14.nil?
        value = (value & 0xffffbfff_u32) |
                UInt32.new!(fb14.to_int).&(0x1_u32) << 14
      end

      unless fb15.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(fb15.to_int).&(0x1_u32) << 15
      end

      unless fb16.nil?
        value = (value & 0xfffeffff_u32) |
                UInt32.new!(fb16.to_int).&(0x1_u32) << 16
      end

      unless fb17.nil?
        value = (value & 0xfffdffff_u32) |
                UInt32.new!(fb17.to_int).&(0x1_u32) << 17
      end

      unless fb18.nil?
        value = (value & 0xfffbffff_u32) |
                UInt32.new!(fb18.to_int).&(0x1_u32) << 18
      end

      unless fb19.nil?
        value = (value & 0xfff7ffff_u32) |
                UInt32.new!(fb19.to_int).&(0x1_u32) << 19
      end

      unless fb20.nil?
        value = (value & 0xffefffff_u32) |
                UInt32.new!(fb20.to_int).&(0x1_u32) << 20
      end

      unless fb21.nil?
        value = (value & 0xffdfffff_u32) |
                UInt32.new!(fb21.to_int).&(0x1_u32) << 21
      end

      unless fb22.nil?
        value = (value & 0xffbfffff_u32) |
                UInt32.new!(fb22.to_int).&(0x1_u32) << 22
      end

      unless fb23.nil?
        value = (value & 0xff7fffff_u32) |
                UInt32.new!(fb23.to_int).&(0x1_u32) << 23
      end

      unless fb24.nil?
        value = (value & 0xfeffffff_u32) |
                UInt32.new!(fb24.to_int).&(0x1_u32) << 24
      end

      unless fb25.nil?
        value = (value & 0xfdffffff_u32) |
                UInt32.new!(fb25.to_int).&(0x1_u32) << 25
      end

      unless fb26.nil?
        value = (value & 0xfbffffff_u32) |
                UInt32.new!(fb26.to_int).&(0x1_u32) << 26
      end

      unless fb27.nil?
        value = (value & 0xf7ffffff_u32) |
                UInt32.new!(fb27.to_int).&(0x1_u32) << 27
      end

      unless fb28.nil?
        value = (value & 0xefffffff_u32) |
                UInt32.new!(fb28.to_int).&(0x1_u32) << 28
      end

      unless fb29.nil?
        value = (value & 0xdfffffff_u32) |
                UInt32.new!(fb29.to_int).&(0x1_u32) << 29
      end

      unless fb30.nil?
        value = (value & 0xbfffffff_u32) |
                UInt32.new!(fb30.to_int).&(0x1_u32) << 30
      end

      unless fb31.nil?
        value = (value & 0x7fffffff_u32) |
                UInt32.new!(fb31.to_int).&(0x1_u32) << 31
      end

      self.class.new(value)
    end

    def self.set(
      *,
      fb0 : Bool? = nil,
      fb1 : Bool? = nil,
      fb2 : Bool? = nil,
      fb3 : Bool? = nil,
      fb4 : Bool? = nil,
      fb5 : Bool? = nil,
      fb6 : Bool? = nil,
      fb7 : Bool? = nil,
      fb8 : Bool? = nil,
      fb9 : Bool? = nil,
      fb10 : Bool? = nil,
      fb11 : Bool? = nil,
      fb12 : Bool? = nil,
      fb13 : Bool? = nil,
      fb14 : Bool? = nil,
      fb15 : Bool? = nil,
      fb16 : Bool? = nil,
      fb17 : Bool? = nil,
      fb18 : Bool? = nil,
      fb19 : Bool? = nil,
      fb20 : Bool? = nil,
      fb21 : Bool? = nil,
      fb22 : Bool? = nil,
      fb23 : Bool? = nil,
      fb24 : Bool? = nil,
      fb25 : Bool? = nil,
      fb26 : Bool? = nil,
      fb27 : Bool? = nil,
      fb28 : Bool? = nil,
      fb29 : Bool? = nil,
      fb30 : Bool? = nil,
      fb31 : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        fb0: fb0,
        fb1: fb1,
        fb2: fb2,
        fb3: fb3,
        fb4: fb4,
        fb5: fb5,
        fb6: fb6,
        fb7: fb7,
        fb8: fb8,
        fb9: fb9,
        fb10: fb10,
        fb11: fb11,
        fb12: fb12,
        fb13: fb13,
        fb14: fb14,
        fb15: fb15,
        fb16: fb16,
        fb17: fb17,
        fb18: fb18,
        fb19: fb19,
        fb20: fb20,
        fb21: fb21,
        fb22: fb22,
        fb23: fb23,
        fb24: fb24,
        fb25: fb25,
        fb26: fb26,
        fb27: fb27,
        fb28: fb28,
        fb29: fb29,
        fb30: fb30,
        fb31: fb31,
      )
    end
  end # struct

  # Filter bank 13 register 2
  struct F13R2
    ADDRESS = BASE_ADDRESS + 0x2ac_u64

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

    # Filter bits
    def fb0 : Bool
      @value.bits_set?(0x1_u32)
    end

    # Filter bits
    def self.fb0 : Bool
      value.fb0
    end

    # Filter bits
    def self.fb0=(value : Bool) : Bool
      self.set(fb0: value)
      value
    end

    # Filter bits
    def fb1 : Bool
      @value.bits_set?(0x2_u32)
    end

    # Filter bits
    def self.fb1 : Bool
      value.fb1
    end

    # Filter bits
    def self.fb1=(value : Bool) : Bool
      self.set(fb1: value)
      value
    end

    # Filter bits
    def fb2 : Bool
      @value.bits_set?(0x4_u32)
    end

    # Filter bits
    def self.fb2 : Bool
      value.fb2
    end

    # Filter bits
    def self.fb2=(value : Bool) : Bool
      self.set(fb2: value)
      value
    end

    # Filter bits
    def fb3 : Bool
      @value.bits_set?(0x8_u32)
    end

    # Filter bits
    def self.fb3 : Bool
      value.fb3
    end

    # Filter bits
    def self.fb3=(value : Bool) : Bool
      self.set(fb3: value)
      value
    end

    # Filter bits
    def fb4 : Bool
      @value.bits_set?(0x10_u32)
    end

    # Filter bits
    def self.fb4 : Bool
      value.fb4
    end

    # Filter bits
    def self.fb4=(value : Bool) : Bool
      self.set(fb4: value)
      value
    end

    # Filter bits
    def fb5 : Bool
      @value.bits_set?(0x20_u32)
    end

    # Filter bits
    def self.fb5 : Bool
      value.fb5
    end

    # Filter bits
    def self.fb5=(value : Bool) : Bool
      self.set(fb5: value)
      value
    end

    # Filter bits
    def fb6 : Bool
      @value.bits_set?(0x40_u32)
    end

    # Filter bits
    def self.fb6 : Bool
      value.fb6
    end

    # Filter bits
    def self.fb6=(value : Bool) : Bool
      self.set(fb6: value)
      value
    end

    # Filter bits
    def fb7 : Bool
      @value.bits_set?(0x80_u32)
    end

    # Filter bits
    def self.fb7 : Bool
      value.fb7
    end

    # Filter bits
    def self.fb7=(value : Bool) : Bool
      self.set(fb7: value)
      value
    end

    # Filter bits
    def fb8 : Bool
      @value.bits_set?(0x100_u32)
    end

    # Filter bits
    def self.fb8 : Bool
      value.fb8
    end

    # Filter bits
    def self.fb8=(value : Bool) : Bool
      self.set(fb8: value)
      value
    end

    # Filter bits
    def fb9 : Bool
      @value.bits_set?(0x200_u32)
    end

    # Filter bits
    def self.fb9 : Bool
      value.fb9
    end

    # Filter bits
    def self.fb9=(value : Bool) : Bool
      self.set(fb9: value)
      value
    end

    # Filter bits
    def fb10 : Bool
      @value.bits_set?(0x400_u32)
    end

    # Filter bits
    def self.fb10 : Bool
      value.fb10
    end

    # Filter bits
    def self.fb10=(value : Bool) : Bool
      self.set(fb10: value)
      value
    end

    # Filter bits
    def fb11 : Bool
      @value.bits_set?(0x800_u32)
    end

    # Filter bits
    def self.fb11 : Bool
      value.fb11
    end

    # Filter bits
    def self.fb11=(value : Bool) : Bool
      self.set(fb11: value)
      value
    end

    # Filter bits
    def fb12 : Bool
      @value.bits_set?(0x1000_u32)
    end

    # Filter bits
    def self.fb12 : Bool
      value.fb12
    end

    # Filter bits
    def self.fb12=(value : Bool) : Bool
      self.set(fb12: value)
      value
    end

    # Filter bits
    def fb13 : Bool
      @value.bits_set?(0x2000_u32)
    end

    # Filter bits
    def self.fb13 : Bool
      value.fb13
    end

    # Filter bits
    def self.fb13=(value : Bool) : Bool
      self.set(fb13: value)
      value
    end

    # Filter bits
    def fb14 : Bool
      @value.bits_set?(0x4000_u32)
    end

    # Filter bits
    def self.fb14 : Bool
      value.fb14
    end

    # Filter bits
    def self.fb14=(value : Bool) : Bool
      self.set(fb14: value)
      value
    end

    # Filter bits
    def fb15 : Bool
      @value.bits_set?(0x8000_u32)
    end

    # Filter bits
    def self.fb15 : Bool
      value.fb15
    end

    # Filter bits
    def self.fb15=(value : Bool) : Bool
      self.set(fb15: value)
      value
    end

    # Filter bits
    def fb16 : Bool
      @value.bits_set?(0x10000_u32)
    end

    # Filter bits
    def self.fb16 : Bool
      value.fb16
    end

    # Filter bits
    def self.fb16=(value : Bool) : Bool
      self.set(fb16: value)
      value
    end

    # Filter bits
    def fb17 : Bool
      @value.bits_set?(0x20000_u32)
    end

    # Filter bits
    def self.fb17 : Bool
      value.fb17
    end

    # Filter bits
    def self.fb17=(value : Bool) : Bool
      self.set(fb17: value)
      value
    end

    # Filter bits
    def fb18 : Bool
      @value.bits_set?(0x40000_u32)
    end

    # Filter bits
    def self.fb18 : Bool
      value.fb18
    end

    # Filter bits
    def self.fb18=(value : Bool) : Bool
      self.set(fb18: value)
      value
    end

    # Filter bits
    def fb19 : Bool
      @value.bits_set?(0x80000_u32)
    end

    # Filter bits
    def self.fb19 : Bool
      value.fb19
    end

    # Filter bits
    def self.fb19=(value : Bool) : Bool
      self.set(fb19: value)
      value
    end

    # Filter bits
    def fb20 : Bool
      @value.bits_set?(0x100000_u32)
    end

    # Filter bits
    def self.fb20 : Bool
      value.fb20
    end

    # Filter bits
    def self.fb20=(value : Bool) : Bool
      self.set(fb20: value)
      value
    end

    # Filter bits
    def fb21 : Bool
      @value.bits_set?(0x200000_u32)
    end

    # Filter bits
    def self.fb21 : Bool
      value.fb21
    end

    # Filter bits
    def self.fb21=(value : Bool) : Bool
      self.set(fb21: value)
      value
    end

    # Filter bits
    def fb22 : Bool
      @value.bits_set?(0x400000_u32)
    end

    # Filter bits
    def self.fb22 : Bool
      value.fb22
    end

    # Filter bits
    def self.fb22=(value : Bool) : Bool
      self.set(fb22: value)
      value
    end

    # Filter bits
    def fb23 : Bool
      @value.bits_set?(0x800000_u32)
    end

    # Filter bits
    def self.fb23 : Bool
      value.fb23
    end

    # Filter bits
    def self.fb23=(value : Bool) : Bool
      self.set(fb23: value)
      value
    end

    # Filter bits
    def fb24 : Bool
      @value.bits_set?(0x1000000_u32)
    end

    # Filter bits
    def self.fb24 : Bool
      value.fb24
    end

    # Filter bits
    def self.fb24=(value : Bool) : Bool
      self.set(fb24: value)
      value
    end

    # Filter bits
    def fb25 : Bool
      @value.bits_set?(0x2000000_u32)
    end

    # Filter bits
    def self.fb25 : Bool
      value.fb25
    end

    # Filter bits
    def self.fb25=(value : Bool) : Bool
      self.set(fb25: value)
      value
    end

    # Filter bits
    def fb26 : Bool
      @value.bits_set?(0x4000000_u32)
    end

    # Filter bits
    def self.fb26 : Bool
      value.fb26
    end

    # Filter bits
    def self.fb26=(value : Bool) : Bool
      self.set(fb26: value)
      value
    end

    # Filter bits
    def fb27 : Bool
      @value.bits_set?(0x8000000_u32)
    end

    # Filter bits
    def self.fb27 : Bool
      value.fb27
    end

    # Filter bits
    def self.fb27=(value : Bool) : Bool
      self.set(fb27: value)
      value
    end

    # Filter bits
    def fb28 : Bool
      @value.bits_set?(0x10000000_u32)
    end

    # Filter bits
    def self.fb28 : Bool
      value.fb28
    end

    # Filter bits
    def self.fb28=(value : Bool) : Bool
      self.set(fb28: value)
      value
    end

    # Filter bits
    def fb29 : Bool
      @value.bits_set?(0x20000000_u32)
    end

    # Filter bits
    def self.fb29 : Bool
      value.fb29
    end

    # Filter bits
    def self.fb29=(value : Bool) : Bool
      self.set(fb29: value)
      value
    end

    # Filter bits
    def fb30 : Bool
      @value.bits_set?(0x40000000_u32)
    end

    # Filter bits
    def self.fb30 : Bool
      value.fb30
    end

    # Filter bits
    def self.fb30=(value : Bool) : Bool
      self.set(fb30: value)
      value
    end

    # Filter bits
    def fb31 : Bool
      @value.bits_set?(0x80000000_u32)
    end

    # Filter bits
    def self.fb31 : Bool
      value.fb31
    end

    # Filter bits
    def self.fb31=(value : Bool) : Bool
      self.set(fb31: value)
      value
    end

    def copy_with(
      *,

      fb0 : Bool? = nil,

      fb1 : Bool? = nil,

      fb2 : Bool? = nil,

      fb3 : Bool? = nil,

      fb4 : Bool? = nil,

      fb5 : Bool? = nil,

      fb6 : Bool? = nil,

      fb7 : Bool? = nil,

      fb8 : Bool? = nil,

      fb9 : Bool? = nil,

      fb10 : Bool? = nil,

      fb11 : Bool? = nil,

      fb12 : Bool? = nil,

      fb13 : Bool? = nil,

      fb14 : Bool? = nil,

      fb15 : Bool? = nil,

      fb16 : Bool? = nil,

      fb17 : Bool? = nil,

      fb18 : Bool? = nil,

      fb19 : Bool? = nil,

      fb20 : Bool? = nil,

      fb21 : Bool? = nil,

      fb22 : Bool? = nil,

      fb23 : Bool? = nil,

      fb24 : Bool? = nil,

      fb25 : Bool? = nil,

      fb26 : Bool? = nil,

      fb27 : Bool? = nil,

      fb28 : Bool? = nil,

      fb29 : Bool? = nil,

      fb30 : Bool? = nil,

      fb31 : Bool? = nil
    ) : self
      value = @value

      unless fb0.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(fb0.to_int).&(0x1_u32) << 0
      end

      unless fb1.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(fb1.to_int).&(0x1_u32) << 1
      end

      unless fb2.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(fb2.to_int).&(0x1_u32) << 2
      end

      unless fb3.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(fb3.to_int).&(0x1_u32) << 3
      end

      unless fb4.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(fb4.to_int).&(0x1_u32) << 4
      end

      unless fb5.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(fb5.to_int).&(0x1_u32) << 5
      end

      unless fb6.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(fb6.to_int).&(0x1_u32) << 6
      end

      unless fb7.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(fb7.to_int).&(0x1_u32) << 7
      end

      unless fb8.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(fb8.to_int).&(0x1_u32) << 8
      end

      unless fb9.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(fb9.to_int).&(0x1_u32) << 9
      end

      unless fb10.nil?
        value = (value & 0xfffffbff_u32) |
                UInt32.new!(fb10.to_int).&(0x1_u32) << 10
      end

      unless fb11.nil?
        value = (value & 0xfffff7ff_u32) |
                UInt32.new!(fb11.to_int).&(0x1_u32) << 11
      end

      unless fb12.nil?
        value = (value & 0xffffefff_u32) |
                UInt32.new!(fb12.to_int).&(0x1_u32) << 12
      end

      unless fb13.nil?
        value = (value & 0xffffdfff_u32) |
                UInt32.new!(fb13.to_int).&(0x1_u32) << 13
      end

      unless fb14.nil?
        value = (value & 0xffffbfff_u32) |
                UInt32.new!(fb14.to_int).&(0x1_u32) << 14
      end

      unless fb15.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(fb15.to_int).&(0x1_u32) << 15
      end

      unless fb16.nil?
        value = (value & 0xfffeffff_u32) |
                UInt32.new!(fb16.to_int).&(0x1_u32) << 16
      end

      unless fb17.nil?
        value = (value & 0xfffdffff_u32) |
                UInt32.new!(fb17.to_int).&(0x1_u32) << 17
      end

      unless fb18.nil?
        value = (value & 0xfffbffff_u32) |
                UInt32.new!(fb18.to_int).&(0x1_u32) << 18
      end

      unless fb19.nil?
        value = (value & 0xfff7ffff_u32) |
                UInt32.new!(fb19.to_int).&(0x1_u32) << 19
      end

      unless fb20.nil?
        value = (value & 0xffefffff_u32) |
                UInt32.new!(fb20.to_int).&(0x1_u32) << 20
      end

      unless fb21.nil?
        value = (value & 0xffdfffff_u32) |
                UInt32.new!(fb21.to_int).&(0x1_u32) << 21
      end

      unless fb22.nil?
        value = (value & 0xffbfffff_u32) |
                UInt32.new!(fb22.to_int).&(0x1_u32) << 22
      end

      unless fb23.nil?
        value = (value & 0xff7fffff_u32) |
                UInt32.new!(fb23.to_int).&(0x1_u32) << 23
      end

      unless fb24.nil?
        value = (value & 0xfeffffff_u32) |
                UInt32.new!(fb24.to_int).&(0x1_u32) << 24
      end

      unless fb25.nil?
        value = (value & 0xfdffffff_u32) |
                UInt32.new!(fb25.to_int).&(0x1_u32) << 25
      end

      unless fb26.nil?
        value = (value & 0xfbffffff_u32) |
                UInt32.new!(fb26.to_int).&(0x1_u32) << 26
      end

      unless fb27.nil?
        value = (value & 0xf7ffffff_u32) |
                UInt32.new!(fb27.to_int).&(0x1_u32) << 27
      end

      unless fb28.nil?
        value = (value & 0xefffffff_u32) |
                UInt32.new!(fb28.to_int).&(0x1_u32) << 28
      end

      unless fb29.nil?
        value = (value & 0xdfffffff_u32) |
                UInt32.new!(fb29.to_int).&(0x1_u32) << 29
      end

      unless fb30.nil?
        value = (value & 0xbfffffff_u32) |
                UInt32.new!(fb30.to_int).&(0x1_u32) << 30
      end

      unless fb31.nil?
        value = (value & 0x7fffffff_u32) |
                UInt32.new!(fb31.to_int).&(0x1_u32) << 31
      end

      self.class.new(value)
    end

    def self.set(
      *,
      fb0 : Bool? = nil,
      fb1 : Bool? = nil,
      fb2 : Bool? = nil,
      fb3 : Bool? = nil,
      fb4 : Bool? = nil,
      fb5 : Bool? = nil,
      fb6 : Bool? = nil,
      fb7 : Bool? = nil,
      fb8 : Bool? = nil,
      fb9 : Bool? = nil,
      fb10 : Bool? = nil,
      fb11 : Bool? = nil,
      fb12 : Bool? = nil,
      fb13 : Bool? = nil,
      fb14 : Bool? = nil,
      fb15 : Bool? = nil,
      fb16 : Bool? = nil,
      fb17 : Bool? = nil,
      fb18 : Bool? = nil,
      fb19 : Bool? = nil,
      fb20 : Bool? = nil,
      fb21 : Bool? = nil,
      fb22 : Bool? = nil,
      fb23 : Bool? = nil,
      fb24 : Bool? = nil,
      fb25 : Bool? = nil,
      fb26 : Bool? = nil,
      fb27 : Bool? = nil,
      fb28 : Bool? = nil,
      fb29 : Bool? = nil,
      fb30 : Bool? = nil,
      fb31 : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        fb0: fb0,
        fb1: fb1,
        fb2: fb2,
        fb3: fb3,
        fb4: fb4,
        fb5: fb5,
        fb6: fb6,
        fb7: fb7,
        fb8: fb8,
        fb9: fb9,
        fb10: fb10,
        fb11: fb11,
        fb12: fb12,
        fb13: fb13,
        fb14: fb14,
        fb15: fb15,
        fb16: fb16,
        fb17: fb17,
        fb18: fb18,
        fb19: fb19,
        fb20: fb20,
        fb21: fb21,
        fb22: fb22,
        fb23: fb23,
        fb24: fb24,
        fb25: fb25,
        fb26: fb26,
        fb27: fb27,
        fb28: fb28,
        fb29: fb29,
        fb30: fb30,
        fb31: fb31,
      )
    end
  end # struct

  # Filter bank 14 register 1
  struct F14R1
    ADDRESS = BASE_ADDRESS + 0x2b0_u64

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

    # Filter bits
    def fb0 : Bool
      @value.bits_set?(0x1_u32)
    end

    # Filter bits
    def self.fb0 : Bool
      value.fb0
    end

    # Filter bits
    def self.fb0=(value : Bool) : Bool
      self.set(fb0: value)
      value
    end

    # Filter bits
    def fb1 : Bool
      @value.bits_set?(0x2_u32)
    end

    # Filter bits
    def self.fb1 : Bool
      value.fb1
    end

    # Filter bits
    def self.fb1=(value : Bool) : Bool
      self.set(fb1: value)
      value
    end

    # Filter bits
    def fb2 : Bool
      @value.bits_set?(0x4_u32)
    end

    # Filter bits
    def self.fb2 : Bool
      value.fb2
    end

    # Filter bits
    def self.fb2=(value : Bool) : Bool
      self.set(fb2: value)
      value
    end

    # Filter bits
    def fb3 : Bool
      @value.bits_set?(0x8_u32)
    end

    # Filter bits
    def self.fb3 : Bool
      value.fb3
    end

    # Filter bits
    def self.fb3=(value : Bool) : Bool
      self.set(fb3: value)
      value
    end

    # Filter bits
    def fb4 : Bool
      @value.bits_set?(0x10_u32)
    end

    # Filter bits
    def self.fb4 : Bool
      value.fb4
    end

    # Filter bits
    def self.fb4=(value : Bool) : Bool
      self.set(fb4: value)
      value
    end

    # Filter bits
    def fb5 : Bool
      @value.bits_set?(0x20_u32)
    end

    # Filter bits
    def self.fb5 : Bool
      value.fb5
    end

    # Filter bits
    def self.fb5=(value : Bool) : Bool
      self.set(fb5: value)
      value
    end

    # Filter bits
    def fb6 : Bool
      @value.bits_set?(0x40_u32)
    end

    # Filter bits
    def self.fb6 : Bool
      value.fb6
    end

    # Filter bits
    def self.fb6=(value : Bool) : Bool
      self.set(fb6: value)
      value
    end

    # Filter bits
    def fb7 : Bool
      @value.bits_set?(0x80_u32)
    end

    # Filter bits
    def self.fb7 : Bool
      value.fb7
    end

    # Filter bits
    def self.fb7=(value : Bool) : Bool
      self.set(fb7: value)
      value
    end

    # Filter bits
    def fb8 : Bool
      @value.bits_set?(0x100_u32)
    end

    # Filter bits
    def self.fb8 : Bool
      value.fb8
    end

    # Filter bits
    def self.fb8=(value : Bool) : Bool
      self.set(fb8: value)
      value
    end

    # Filter bits
    def fb9 : Bool
      @value.bits_set?(0x200_u32)
    end

    # Filter bits
    def self.fb9 : Bool
      value.fb9
    end

    # Filter bits
    def self.fb9=(value : Bool) : Bool
      self.set(fb9: value)
      value
    end

    # Filter bits
    def fb10 : Bool
      @value.bits_set?(0x400_u32)
    end

    # Filter bits
    def self.fb10 : Bool
      value.fb10
    end

    # Filter bits
    def self.fb10=(value : Bool) : Bool
      self.set(fb10: value)
      value
    end

    # Filter bits
    def fb11 : Bool
      @value.bits_set?(0x800_u32)
    end

    # Filter bits
    def self.fb11 : Bool
      value.fb11
    end

    # Filter bits
    def self.fb11=(value : Bool) : Bool
      self.set(fb11: value)
      value
    end

    # Filter bits
    def fb12 : Bool
      @value.bits_set?(0x1000_u32)
    end

    # Filter bits
    def self.fb12 : Bool
      value.fb12
    end

    # Filter bits
    def self.fb12=(value : Bool) : Bool
      self.set(fb12: value)
      value
    end

    # Filter bits
    def fb13 : Bool
      @value.bits_set?(0x2000_u32)
    end

    # Filter bits
    def self.fb13 : Bool
      value.fb13
    end

    # Filter bits
    def self.fb13=(value : Bool) : Bool
      self.set(fb13: value)
      value
    end

    # Filter bits
    def fb14 : Bool
      @value.bits_set?(0x4000_u32)
    end

    # Filter bits
    def self.fb14 : Bool
      value.fb14
    end

    # Filter bits
    def self.fb14=(value : Bool) : Bool
      self.set(fb14: value)
      value
    end

    # Filter bits
    def fb15 : Bool
      @value.bits_set?(0x8000_u32)
    end

    # Filter bits
    def self.fb15 : Bool
      value.fb15
    end

    # Filter bits
    def self.fb15=(value : Bool) : Bool
      self.set(fb15: value)
      value
    end

    # Filter bits
    def fb16 : Bool
      @value.bits_set?(0x10000_u32)
    end

    # Filter bits
    def self.fb16 : Bool
      value.fb16
    end

    # Filter bits
    def self.fb16=(value : Bool) : Bool
      self.set(fb16: value)
      value
    end

    # Filter bits
    def fb17 : Bool
      @value.bits_set?(0x20000_u32)
    end

    # Filter bits
    def self.fb17 : Bool
      value.fb17
    end

    # Filter bits
    def self.fb17=(value : Bool) : Bool
      self.set(fb17: value)
      value
    end

    # Filter bits
    def fb18 : Bool
      @value.bits_set?(0x40000_u32)
    end

    # Filter bits
    def self.fb18 : Bool
      value.fb18
    end

    # Filter bits
    def self.fb18=(value : Bool) : Bool
      self.set(fb18: value)
      value
    end

    # Filter bits
    def fb19 : Bool
      @value.bits_set?(0x80000_u32)
    end

    # Filter bits
    def self.fb19 : Bool
      value.fb19
    end

    # Filter bits
    def self.fb19=(value : Bool) : Bool
      self.set(fb19: value)
      value
    end

    # Filter bits
    def fb20 : Bool
      @value.bits_set?(0x100000_u32)
    end

    # Filter bits
    def self.fb20 : Bool
      value.fb20
    end

    # Filter bits
    def self.fb20=(value : Bool) : Bool
      self.set(fb20: value)
      value
    end

    # Filter bits
    def fb21 : Bool
      @value.bits_set?(0x200000_u32)
    end

    # Filter bits
    def self.fb21 : Bool
      value.fb21
    end

    # Filter bits
    def self.fb21=(value : Bool) : Bool
      self.set(fb21: value)
      value
    end

    # Filter bits
    def fb22 : Bool
      @value.bits_set?(0x400000_u32)
    end

    # Filter bits
    def self.fb22 : Bool
      value.fb22
    end

    # Filter bits
    def self.fb22=(value : Bool) : Bool
      self.set(fb22: value)
      value
    end

    # Filter bits
    def fb23 : Bool
      @value.bits_set?(0x800000_u32)
    end

    # Filter bits
    def self.fb23 : Bool
      value.fb23
    end

    # Filter bits
    def self.fb23=(value : Bool) : Bool
      self.set(fb23: value)
      value
    end

    # Filter bits
    def fb24 : Bool
      @value.bits_set?(0x1000000_u32)
    end

    # Filter bits
    def self.fb24 : Bool
      value.fb24
    end

    # Filter bits
    def self.fb24=(value : Bool) : Bool
      self.set(fb24: value)
      value
    end

    # Filter bits
    def fb25 : Bool
      @value.bits_set?(0x2000000_u32)
    end

    # Filter bits
    def self.fb25 : Bool
      value.fb25
    end

    # Filter bits
    def self.fb25=(value : Bool) : Bool
      self.set(fb25: value)
      value
    end

    # Filter bits
    def fb26 : Bool
      @value.bits_set?(0x4000000_u32)
    end

    # Filter bits
    def self.fb26 : Bool
      value.fb26
    end

    # Filter bits
    def self.fb26=(value : Bool) : Bool
      self.set(fb26: value)
      value
    end

    # Filter bits
    def fb27 : Bool
      @value.bits_set?(0x8000000_u32)
    end

    # Filter bits
    def self.fb27 : Bool
      value.fb27
    end

    # Filter bits
    def self.fb27=(value : Bool) : Bool
      self.set(fb27: value)
      value
    end

    # Filter bits
    def fb28 : Bool
      @value.bits_set?(0x10000000_u32)
    end

    # Filter bits
    def self.fb28 : Bool
      value.fb28
    end

    # Filter bits
    def self.fb28=(value : Bool) : Bool
      self.set(fb28: value)
      value
    end

    # Filter bits
    def fb29 : Bool
      @value.bits_set?(0x20000000_u32)
    end

    # Filter bits
    def self.fb29 : Bool
      value.fb29
    end

    # Filter bits
    def self.fb29=(value : Bool) : Bool
      self.set(fb29: value)
      value
    end

    # Filter bits
    def fb30 : Bool
      @value.bits_set?(0x40000000_u32)
    end

    # Filter bits
    def self.fb30 : Bool
      value.fb30
    end

    # Filter bits
    def self.fb30=(value : Bool) : Bool
      self.set(fb30: value)
      value
    end

    # Filter bits
    def fb31 : Bool
      @value.bits_set?(0x80000000_u32)
    end

    # Filter bits
    def self.fb31 : Bool
      value.fb31
    end

    # Filter bits
    def self.fb31=(value : Bool) : Bool
      self.set(fb31: value)
      value
    end

    def copy_with(
      *,

      fb0 : Bool? = nil,

      fb1 : Bool? = nil,

      fb2 : Bool? = nil,

      fb3 : Bool? = nil,

      fb4 : Bool? = nil,

      fb5 : Bool? = nil,

      fb6 : Bool? = nil,

      fb7 : Bool? = nil,

      fb8 : Bool? = nil,

      fb9 : Bool? = nil,

      fb10 : Bool? = nil,

      fb11 : Bool? = nil,

      fb12 : Bool? = nil,

      fb13 : Bool? = nil,

      fb14 : Bool? = nil,

      fb15 : Bool? = nil,

      fb16 : Bool? = nil,

      fb17 : Bool? = nil,

      fb18 : Bool? = nil,

      fb19 : Bool? = nil,

      fb20 : Bool? = nil,

      fb21 : Bool? = nil,

      fb22 : Bool? = nil,

      fb23 : Bool? = nil,

      fb24 : Bool? = nil,

      fb25 : Bool? = nil,

      fb26 : Bool? = nil,

      fb27 : Bool? = nil,

      fb28 : Bool? = nil,

      fb29 : Bool? = nil,

      fb30 : Bool? = nil,

      fb31 : Bool? = nil
    ) : self
      value = @value

      unless fb0.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(fb0.to_int).&(0x1_u32) << 0
      end

      unless fb1.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(fb1.to_int).&(0x1_u32) << 1
      end

      unless fb2.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(fb2.to_int).&(0x1_u32) << 2
      end

      unless fb3.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(fb3.to_int).&(0x1_u32) << 3
      end

      unless fb4.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(fb4.to_int).&(0x1_u32) << 4
      end

      unless fb5.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(fb5.to_int).&(0x1_u32) << 5
      end

      unless fb6.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(fb6.to_int).&(0x1_u32) << 6
      end

      unless fb7.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(fb7.to_int).&(0x1_u32) << 7
      end

      unless fb8.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(fb8.to_int).&(0x1_u32) << 8
      end

      unless fb9.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(fb9.to_int).&(0x1_u32) << 9
      end

      unless fb10.nil?
        value = (value & 0xfffffbff_u32) |
                UInt32.new!(fb10.to_int).&(0x1_u32) << 10
      end

      unless fb11.nil?
        value = (value & 0xfffff7ff_u32) |
                UInt32.new!(fb11.to_int).&(0x1_u32) << 11
      end

      unless fb12.nil?
        value = (value & 0xffffefff_u32) |
                UInt32.new!(fb12.to_int).&(0x1_u32) << 12
      end

      unless fb13.nil?
        value = (value & 0xffffdfff_u32) |
                UInt32.new!(fb13.to_int).&(0x1_u32) << 13
      end

      unless fb14.nil?
        value = (value & 0xffffbfff_u32) |
                UInt32.new!(fb14.to_int).&(0x1_u32) << 14
      end

      unless fb15.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(fb15.to_int).&(0x1_u32) << 15
      end

      unless fb16.nil?
        value = (value & 0xfffeffff_u32) |
                UInt32.new!(fb16.to_int).&(0x1_u32) << 16
      end

      unless fb17.nil?
        value = (value & 0xfffdffff_u32) |
                UInt32.new!(fb17.to_int).&(0x1_u32) << 17
      end

      unless fb18.nil?
        value = (value & 0xfffbffff_u32) |
                UInt32.new!(fb18.to_int).&(0x1_u32) << 18
      end

      unless fb19.nil?
        value = (value & 0xfff7ffff_u32) |
                UInt32.new!(fb19.to_int).&(0x1_u32) << 19
      end

      unless fb20.nil?
        value = (value & 0xffefffff_u32) |
                UInt32.new!(fb20.to_int).&(0x1_u32) << 20
      end

      unless fb21.nil?
        value = (value & 0xffdfffff_u32) |
                UInt32.new!(fb21.to_int).&(0x1_u32) << 21
      end

      unless fb22.nil?
        value = (value & 0xffbfffff_u32) |
                UInt32.new!(fb22.to_int).&(0x1_u32) << 22
      end

      unless fb23.nil?
        value = (value & 0xff7fffff_u32) |
                UInt32.new!(fb23.to_int).&(0x1_u32) << 23
      end

      unless fb24.nil?
        value = (value & 0xfeffffff_u32) |
                UInt32.new!(fb24.to_int).&(0x1_u32) << 24
      end

      unless fb25.nil?
        value = (value & 0xfdffffff_u32) |
                UInt32.new!(fb25.to_int).&(0x1_u32) << 25
      end

      unless fb26.nil?
        value = (value & 0xfbffffff_u32) |
                UInt32.new!(fb26.to_int).&(0x1_u32) << 26
      end

      unless fb27.nil?
        value = (value & 0xf7ffffff_u32) |
                UInt32.new!(fb27.to_int).&(0x1_u32) << 27
      end

      unless fb28.nil?
        value = (value & 0xefffffff_u32) |
                UInt32.new!(fb28.to_int).&(0x1_u32) << 28
      end

      unless fb29.nil?
        value = (value & 0xdfffffff_u32) |
                UInt32.new!(fb29.to_int).&(0x1_u32) << 29
      end

      unless fb30.nil?
        value = (value & 0xbfffffff_u32) |
                UInt32.new!(fb30.to_int).&(0x1_u32) << 30
      end

      unless fb31.nil?
        value = (value & 0x7fffffff_u32) |
                UInt32.new!(fb31.to_int).&(0x1_u32) << 31
      end

      self.class.new(value)
    end

    def self.set(
      *,
      fb0 : Bool? = nil,
      fb1 : Bool? = nil,
      fb2 : Bool? = nil,
      fb3 : Bool? = nil,
      fb4 : Bool? = nil,
      fb5 : Bool? = nil,
      fb6 : Bool? = nil,
      fb7 : Bool? = nil,
      fb8 : Bool? = nil,
      fb9 : Bool? = nil,
      fb10 : Bool? = nil,
      fb11 : Bool? = nil,
      fb12 : Bool? = nil,
      fb13 : Bool? = nil,
      fb14 : Bool? = nil,
      fb15 : Bool? = nil,
      fb16 : Bool? = nil,
      fb17 : Bool? = nil,
      fb18 : Bool? = nil,
      fb19 : Bool? = nil,
      fb20 : Bool? = nil,
      fb21 : Bool? = nil,
      fb22 : Bool? = nil,
      fb23 : Bool? = nil,
      fb24 : Bool? = nil,
      fb25 : Bool? = nil,
      fb26 : Bool? = nil,
      fb27 : Bool? = nil,
      fb28 : Bool? = nil,
      fb29 : Bool? = nil,
      fb30 : Bool? = nil,
      fb31 : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        fb0: fb0,
        fb1: fb1,
        fb2: fb2,
        fb3: fb3,
        fb4: fb4,
        fb5: fb5,
        fb6: fb6,
        fb7: fb7,
        fb8: fb8,
        fb9: fb9,
        fb10: fb10,
        fb11: fb11,
        fb12: fb12,
        fb13: fb13,
        fb14: fb14,
        fb15: fb15,
        fb16: fb16,
        fb17: fb17,
        fb18: fb18,
        fb19: fb19,
        fb20: fb20,
        fb21: fb21,
        fb22: fb22,
        fb23: fb23,
        fb24: fb24,
        fb25: fb25,
        fb26: fb26,
        fb27: fb27,
        fb28: fb28,
        fb29: fb29,
        fb30: fb30,
        fb31: fb31,
      )
    end
  end # struct

  # Filter bank 14 register 2
  struct F14R2
    ADDRESS = BASE_ADDRESS + 0x2b4_u64

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

    # Filter bits
    def fb0 : Bool
      @value.bits_set?(0x1_u32)
    end

    # Filter bits
    def self.fb0 : Bool
      value.fb0
    end

    # Filter bits
    def self.fb0=(value : Bool) : Bool
      self.set(fb0: value)
      value
    end

    # Filter bits
    def fb1 : Bool
      @value.bits_set?(0x2_u32)
    end

    # Filter bits
    def self.fb1 : Bool
      value.fb1
    end

    # Filter bits
    def self.fb1=(value : Bool) : Bool
      self.set(fb1: value)
      value
    end

    # Filter bits
    def fb2 : Bool
      @value.bits_set?(0x4_u32)
    end

    # Filter bits
    def self.fb2 : Bool
      value.fb2
    end

    # Filter bits
    def self.fb2=(value : Bool) : Bool
      self.set(fb2: value)
      value
    end

    # Filter bits
    def fb3 : Bool
      @value.bits_set?(0x8_u32)
    end

    # Filter bits
    def self.fb3 : Bool
      value.fb3
    end

    # Filter bits
    def self.fb3=(value : Bool) : Bool
      self.set(fb3: value)
      value
    end

    # Filter bits
    def fb4 : Bool
      @value.bits_set?(0x10_u32)
    end

    # Filter bits
    def self.fb4 : Bool
      value.fb4
    end

    # Filter bits
    def self.fb4=(value : Bool) : Bool
      self.set(fb4: value)
      value
    end

    # Filter bits
    def fb5 : Bool
      @value.bits_set?(0x20_u32)
    end

    # Filter bits
    def self.fb5 : Bool
      value.fb5
    end

    # Filter bits
    def self.fb5=(value : Bool) : Bool
      self.set(fb5: value)
      value
    end

    # Filter bits
    def fb6 : Bool
      @value.bits_set?(0x40_u32)
    end

    # Filter bits
    def self.fb6 : Bool
      value.fb6
    end

    # Filter bits
    def self.fb6=(value : Bool) : Bool
      self.set(fb6: value)
      value
    end

    # Filter bits
    def fb7 : Bool
      @value.bits_set?(0x80_u32)
    end

    # Filter bits
    def self.fb7 : Bool
      value.fb7
    end

    # Filter bits
    def self.fb7=(value : Bool) : Bool
      self.set(fb7: value)
      value
    end

    # Filter bits
    def fb8 : Bool
      @value.bits_set?(0x100_u32)
    end

    # Filter bits
    def self.fb8 : Bool
      value.fb8
    end

    # Filter bits
    def self.fb8=(value : Bool) : Bool
      self.set(fb8: value)
      value
    end

    # Filter bits
    def fb9 : Bool
      @value.bits_set?(0x200_u32)
    end

    # Filter bits
    def self.fb9 : Bool
      value.fb9
    end

    # Filter bits
    def self.fb9=(value : Bool) : Bool
      self.set(fb9: value)
      value
    end

    # Filter bits
    def fb10 : Bool
      @value.bits_set?(0x400_u32)
    end

    # Filter bits
    def self.fb10 : Bool
      value.fb10
    end

    # Filter bits
    def self.fb10=(value : Bool) : Bool
      self.set(fb10: value)
      value
    end

    # Filter bits
    def fb11 : Bool
      @value.bits_set?(0x800_u32)
    end

    # Filter bits
    def self.fb11 : Bool
      value.fb11
    end

    # Filter bits
    def self.fb11=(value : Bool) : Bool
      self.set(fb11: value)
      value
    end

    # Filter bits
    def fb12 : Bool
      @value.bits_set?(0x1000_u32)
    end

    # Filter bits
    def self.fb12 : Bool
      value.fb12
    end

    # Filter bits
    def self.fb12=(value : Bool) : Bool
      self.set(fb12: value)
      value
    end

    # Filter bits
    def fb13 : Bool
      @value.bits_set?(0x2000_u32)
    end

    # Filter bits
    def self.fb13 : Bool
      value.fb13
    end

    # Filter bits
    def self.fb13=(value : Bool) : Bool
      self.set(fb13: value)
      value
    end

    # Filter bits
    def fb14 : Bool
      @value.bits_set?(0x4000_u32)
    end

    # Filter bits
    def self.fb14 : Bool
      value.fb14
    end

    # Filter bits
    def self.fb14=(value : Bool) : Bool
      self.set(fb14: value)
      value
    end

    # Filter bits
    def fb15 : Bool
      @value.bits_set?(0x8000_u32)
    end

    # Filter bits
    def self.fb15 : Bool
      value.fb15
    end

    # Filter bits
    def self.fb15=(value : Bool) : Bool
      self.set(fb15: value)
      value
    end

    # Filter bits
    def fb16 : Bool
      @value.bits_set?(0x10000_u32)
    end

    # Filter bits
    def self.fb16 : Bool
      value.fb16
    end

    # Filter bits
    def self.fb16=(value : Bool) : Bool
      self.set(fb16: value)
      value
    end

    # Filter bits
    def fb17 : Bool
      @value.bits_set?(0x20000_u32)
    end

    # Filter bits
    def self.fb17 : Bool
      value.fb17
    end

    # Filter bits
    def self.fb17=(value : Bool) : Bool
      self.set(fb17: value)
      value
    end

    # Filter bits
    def fb18 : Bool
      @value.bits_set?(0x40000_u32)
    end

    # Filter bits
    def self.fb18 : Bool
      value.fb18
    end

    # Filter bits
    def self.fb18=(value : Bool) : Bool
      self.set(fb18: value)
      value
    end

    # Filter bits
    def fb19 : Bool
      @value.bits_set?(0x80000_u32)
    end

    # Filter bits
    def self.fb19 : Bool
      value.fb19
    end

    # Filter bits
    def self.fb19=(value : Bool) : Bool
      self.set(fb19: value)
      value
    end

    # Filter bits
    def fb20 : Bool
      @value.bits_set?(0x100000_u32)
    end

    # Filter bits
    def self.fb20 : Bool
      value.fb20
    end

    # Filter bits
    def self.fb20=(value : Bool) : Bool
      self.set(fb20: value)
      value
    end

    # Filter bits
    def fb21 : Bool
      @value.bits_set?(0x200000_u32)
    end

    # Filter bits
    def self.fb21 : Bool
      value.fb21
    end

    # Filter bits
    def self.fb21=(value : Bool) : Bool
      self.set(fb21: value)
      value
    end

    # Filter bits
    def fb22 : Bool
      @value.bits_set?(0x400000_u32)
    end

    # Filter bits
    def self.fb22 : Bool
      value.fb22
    end

    # Filter bits
    def self.fb22=(value : Bool) : Bool
      self.set(fb22: value)
      value
    end

    # Filter bits
    def fb23 : Bool
      @value.bits_set?(0x800000_u32)
    end

    # Filter bits
    def self.fb23 : Bool
      value.fb23
    end

    # Filter bits
    def self.fb23=(value : Bool) : Bool
      self.set(fb23: value)
      value
    end

    # Filter bits
    def fb24 : Bool
      @value.bits_set?(0x1000000_u32)
    end

    # Filter bits
    def self.fb24 : Bool
      value.fb24
    end

    # Filter bits
    def self.fb24=(value : Bool) : Bool
      self.set(fb24: value)
      value
    end

    # Filter bits
    def fb25 : Bool
      @value.bits_set?(0x2000000_u32)
    end

    # Filter bits
    def self.fb25 : Bool
      value.fb25
    end

    # Filter bits
    def self.fb25=(value : Bool) : Bool
      self.set(fb25: value)
      value
    end

    # Filter bits
    def fb26 : Bool
      @value.bits_set?(0x4000000_u32)
    end

    # Filter bits
    def self.fb26 : Bool
      value.fb26
    end

    # Filter bits
    def self.fb26=(value : Bool) : Bool
      self.set(fb26: value)
      value
    end

    # Filter bits
    def fb27 : Bool
      @value.bits_set?(0x8000000_u32)
    end

    # Filter bits
    def self.fb27 : Bool
      value.fb27
    end

    # Filter bits
    def self.fb27=(value : Bool) : Bool
      self.set(fb27: value)
      value
    end

    # Filter bits
    def fb28 : Bool
      @value.bits_set?(0x10000000_u32)
    end

    # Filter bits
    def self.fb28 : Bool
      value.fb28
    end

    # Filter bits
    def self.fb28=(value : Bool) : Bool
      self.set(fb28: value)
      value
    end

    # Filter bits
    def fb29 : Bool
      @value.bits_set?(0x20000000_u32)
    end

    # Filter bits
    def self.fb29 : Bool
      value.fb29
    end

    # Filter bits
    def self.fb29=(value : Bool) : Bool
      self.set(fb29: value)
      value
    end

    # Filter bits
    def fb30 : Bool
      @value.bits_set?(0x40000000_u32)
    end

    # Filter bits
    def self.fb30 : Bool
      value.fb30
    end

    # Filter bits
    def self.fb30=(value : Bool) : Bool
      self.set(fb30: value)
      value
    end

    # Filter bits
    def fb31 : Bool
      @value.bits_set?(0x80000000_u32)
    end

    # Filter bits
    def self.fb31 : Bool
      value.fb31
    end

    # Filter bits
    def self.fb31=(value : Bool) : Bool
      self.set(fb31: value)
      value
    end

    def copy_with(
      *,

      fb0 : Bool? = nil,

      fb1 : Bool? = nil,

      fb2 : Bool? = nil,

      fb3 : Bool? = nil,

      fb4 : Bool? = nil,

      fb5 : Bool? = nil,

      fb6 : Bool? = nil,

      fb7 : Bool? = nil,

      fb8 : Bool? = nil,

      fb9 : Bool? = nil,

      fb10 : Bool? = nil,

      fb11 : Bool? = nil,

      fb12 : Bool? = nil,

      fb13 : Bool? = nil,

      fb14 : Bool? = nil,

      fb15 : Bool? = nil,

      fb16 : Bool? = nil,

      fb17 : Bool? = nil,

      fb18 : Bool? = nil,

      fb19 : Bool? = nil,

      fb20 : Bool? = nil,

      fb21 : Bool? = nil,

      fb22 : Bool? = nil,

      fb23 : Bool? = nil,

      fb24 : Bool? = nil,

      fb25 : Bool? = nil,

      fb26 : Bool? = nil,

      fb27 : Bool? = nil,

      fb28 : Bool? = nil,

      fb29 : Bool? = nil,

      fb30 : Bool? = nil,

      fb31 : Bool? = nil
    ) : self
      value = @value

      unless fb0.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(fb0.to_int).&(0x1_u32) << 0
      end

      unless fb1.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(fb1.to_int).&(0x1_u32) << 1
      end

      unless fb2.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(fb2.to_int).&(0x1_u32) << 2
      end

      unless fb3.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(fb3.to_int).&(0x1_u32) << 3
      end

      unless fb4.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(fb4.to_int).&(0x1_u32) << 4
      end

      unless fb5.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(fb5.to_int).&(0x1_u32) << 5
      end

      unless fb6.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(fb6.to_int).&(0x1_u32) << 6
      end

      unless fb7.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(fb7.to_int).&(0x1_u32) << 7
      end

      unless fb8.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(fb8.to_int).&(0x1_u32) << 8
      end

      unless fb9.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(fb9.to_int).&(0x1_u32) << 9
      end

      unless fb10.nil?
        value = (value & 0xfffffbff_u32) |
                UInt32.new!(fb10.to_int).&(0x1_u32) << 10
      end

      unless fb11.nil?
        value = (value & 0xfffff7ff_u32) |
                UInt32.new!(fb11.to_int).&(0x1_u32) << 11
      end

      unless fb12.nil?
        value = (value & 0xffffefff_u32) |
                UInt32.new!(fb12.to_int).&(0x1_u32) << 12
      end

      unless fb13.nil?
        value = (value & 0xffffdfff_u32) |
                UInt32.new!(fb13.to_int).&(0x1_u32) << 13
      end

      unless fb14.nil?
        value = (value & 0xffffbfff_u32) |
                UInt32.new!(fb14.to_int).&(0x1_u32) << 14
      end

      unless fb15.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(fb15.to_int).&(0x1_u32) << 15
      end

      unless fb16.nil?
        value = (value & 0xfffeffff_u32) |
                UInt32.new!(fb16.to_int).&(0x1_u32) << 16
      end

      unless fb17.nil?
        value = (value & 0xfffdffff_u32) |
                UInt32.new!(fb17.to_int).&(0x1_u32) << 17
      end

      unless fb18.nil?
        value = (value & 0xfffbffff_u32) |
                UInt32.new!(fb18.to_int).&(0x1_u32) << 18
      end

      unless fb19.nil?
        value = (value & 0xfff7ffff_u32) |
                UInt32.new!(fb19.to_int).&(0x1_u32) << 19
      end

      unless fb20.nil?
        value = (value & 0xffefffff_u32) |
                UInt32.new!(fb20.to_int).&(0x1_u32) << 20
      end

      unless fb21.nil?
        value = (value & 0xffdfffff_u32) |
                UInt32.new!(fb21.to_int).&(0x1_u32) << 21
      end

      unless fb22.nil?
        value = (value & 0xffbfffff_u32) |
                UInt32.new!(fb22.to_int).&(0x1_u32) << 22
      end

      unless fb23.nil?
        value = (value & 0xff7fffff_u32) |
                UInt32.new!(fb23.to_int).&(0x1_u32) << 23
      end

      unless fb24.nil?
        value = (value & 0xfeffffff_u32) |
                UInt32.new!(fb24.to_int).&(0x1_u32) << 24
      end

      unless fb25.nil?
        value = (value & 0xfdffffff_u32) |
                UInt32.new!(fb25.to_int).&(0x1_u32) << 25
      end

      unless fb26.nil?
        value = (value & 0xfbffffff_u32) |
                UInt32.new!(fb26.to_int).&(0x1_u32) << 26
      end

      unless fb27.nil?
        value = (value & 0xf7ffffff_u32) |
                UInt32.new!(fb27.to_int).&(0x1_u32) << 27
      end

      unless fb28.nil?
        value = (value & 0xefffffff_u32) |
                UInt32.new!(fb28.to_int).&(0x1_u32) << 28
      end

      unless fb29.nil?
        value = (value & 0xdfffffff_u32) |
                UInt32.new!(fb29.to_int).&(0x1_u32) << 29
      end

      unless fb30.nil?
        value = (value & 0xbfffffff_u32) |
                UInt32.new!(fb30.to_int).&(0x1_u32) << 30
      end

      unless fb31.nil?
        value = (value & 0x7fffffff_u32) |
                UInt32.new!(fb31.to_int).&(0x1_u32) << 31
      end

      self.class.new(value)
    end

    def self.set(
      *,
      fb0 : Bool? = nil,
      fb1 : Bool? = nil,
      fb2 : Bool? = nil,
      fb3 : Bool? = nil,
      fb4 : Bool? = nil,
      fb5 : Bool? = nil,
      fb6 : Bool? = nil,
      fb7 : Bool? = nil,
      fb8 : Bool? = nil,
      fb9 : Bool? = nil,
      fb10 : Bool? = nil,
      fb11 : Bool? = nil,
      fb12 : Bool? = nil,
      fb13 : Bool? = nil,
      fb14 : Bool? = nil,
      fb15 : Bool? = nil,
      fb16 : Bool? = nil,
      fb17 : Bool? = nil,
      fb18 : Bool? = nil,
      fb19 : Bool? = nil,
      fb20 : Bool? = nil,
      fb21 : Bool? = nil,
      fb22 : Bool? = nil,
      fb23 : Bool? = nil,
      fb24 : Bool? = nil,
      fb25 : Bool? = nil,
      fb26 : Bool? = nil,
      fb27 : Bool? = nil,
      fb28 : Bool? = nil,
      fb29 : Bool? = nil,
      fb30 : Bool? = nil,
      fb31 : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        fb0: fb0,
        fb1: fb1,
        fb2: fb2,
        fb3: fb3,
        fb4: fb4,
        fb5: fb5,
        fb6: fb6,
        fb7: fb7,
        fb8: fb8,
        fb9: fb9,
        fb10: fb10,
        fb11: fb11,
        fb12: fb12,
        fb13: fb13,
        fb14: fb14,
        fb15: fb15,
        fb16: fb16,
        fb17: fb17,
        fb18: fb18,
        fb19: fb19,
        fb20: fb20,
        fb21: fb21,
        fb22: fb22,
        fb23: fb23,
        fb24: fb24,
        fb25: fb25,
        fb26: fb26,
        fb27: fb27,
        fb28: fb28,
        fb29: fb29,
        fb30: fb30,
        fb31: fb31,
      )
    end
  end # struct

  # Filter bank 15 register 1
  struct F15R1
    ADDRESS = BASE_ADDRESS + 0x2b8_u64

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

    # Filter bits
    def fb0 : Bool
      @value.bits_set?(0x1_u32)
    end

    # Filter bits
    def self.fb0 : Bool
      value.fb0
    end

    # Filter bits
    def self.fb0=(value : Bool) : Bool
      self.set(fb0: value)
      value
    end

    # Filter bits
    def fb1 : Bool
      @value.bits_set?(0x2_u32)
    end

    # Filter bits
    def self.fb1 : Bool
      value.fb1
    end

    # Filter bits
    def self.fb1=(value : Bool) : Bool
      self.set(fb1: value)
      value
    end

    # Filter bits
    def fb2 : Bool
      @value.bits_set?(0x4_u32)
    end

    # Filter bits
    def self.fb2 : Bool
      value.fb2
    end

    # Filter bits
    def self.fb2=(value : Bool) : Bool
      self.set(fb2: value)
      value
    end

    # Filter bits
    def fb3 : Bool
      @value.bits_set?(0x8_u32)
    end

    # Filter bits
    def self.fb3 : Bool
      value.fb3
    end

    # Filter bits
    def self.fb3=(value : Bool) : Bool
      self.set(fb3: value)
      value
    end

    # Filter bits
    def fb4 : Bool
      @value.bits_set?(0x10_u32)
    end

    # Filter bits
    def self.fb4 : Bool
      value.fb4
    end

    # Filter bits
    def self.fb4=(value : Bool) : Bool
      self.set(fb4: value)
      value
    end

    # Filter bits
    def fb5 : Bool
      @value.bits_set?(0x20_u32)
    end

    # Filter bits
    def self.fb5 : Bool
      value.fb5
    end

    # Filter bits
    def self.fb5=(value : Bool) : Bool
      self.set(fb5: value)
      value
    end

    # Filter bits
    def fb6 : Bool
      @value.bits_set?(0x40_u32)
    end

    # Filter bits
    def self.fb6 : Bool
      value.fb6
    end

    # Filter bits
    def self.fb6=(value : Bool) : Bool
      self.set(fb6: value)
      value
    end

    # Filter bits
    def fb7 : Bool
      @value.bits_set?(0x80_u32)
    end

    # Filter bits
    def self.fb7 : Bool
      value.fb7
    end

    # Filter bits
    def self.fb7=(value : Bool) : Bool
      self.set(fb7: value)
      value
    end

    # Filter bits
    def fb8 : Bool
      @value.bits_set?(0x100_u32)
    end

    # Filter bits
    def self.fb8 : Bool
      value.fb8
    end

    # Filter bits
    def self.fb8=(value : Bool) : Bool
      self.set(fb8: value)
      value
    end

    # Filter bits
    def fb9 : Bool
      @value.bits_set?(0x200_u32)
    end

    # Filter bits
    def self.fb9 : Bool
      value.fb9
    end

    # Filter bits
    def self.fb9=(value : Bool) : Bool
      self.set(fb9: value)
      value
    end

    # Filter bits
    def fb10 : Bool
      @value.bits_set?(0x400_u32)
    end

    # Filter bits
    def self.fb10 : Bool
      value.fb10
    end

    # Filter bits
    def self.fb10=(value : Bool) : Bool
      self.set(fb10: value)
      value
    end

    # Filter bits
    def fb11 : Bool
      @value.bits_set?(0x800_u32)
    end

    # Filter bits
    def self.fb11 : Bool
      value.fb11
    end

    # Filter bits
    def self.fb11=(value : Bool) : Bool
      self.set(fb11: value)
      value
    end

    # Filter bits
    def fb12 : Bool
      @value.bits_set?(0x1000_u32)
    end

    # Filter bits
    def self.fb12 : Bool
      value.fb12
    end

    # Filter bits
    def self.fb12=(value : Bool) : Bool
      self.set(fb12: value)
      value
    end

    # Filter bits
    def fb13 : Bool
      @value.bits_set?(0x2000_u32)
    end

    # Filter bits
    def self.fb13 : Bool
      value.fb13
    end

    # Filter bits
    def self.fb13=(value : Bool) : Bool
      self.set(fb13: value)
      value
    end

    # Filter bits
    def fb14 : Bool
      @value.bits_set?(0x4000_u32)
    end

    # Filter bits
    def self.fb14 : Bool
      value.fb14
    end

    # Filter bits
    def self.fb14=(value : Bool) : Bool
      self.set(fb14: value)
      value
    end

    # Filter bits
    def fb15 : Bool
      @value.bits_set?(0x8000_u32)
    end

    # Filter bits
    def self.fb15 : Bool
      value.fb15
    end

    # Filter bits
    def self.fb15=(value : Bool) : Bool
      self.set(fb15: value)
      value
    end

    # Filter bits
    def fb16 : Bool
      @value.bits_set?(0x10000_u32)
    end

    # Filter bits
    def self.fb16 : Bool
      value.fb16
    end

    # Filter bits
    def self.fb16=(value : Bool) : Bool
      self.set(fb16: value)
      value
    end

    # Filter bits
    def fb17 : Bool
      @value.bits_set?(0x20000_u32)
    end

    # Filter bits
    def self.fb17 : Bool
      value.fb17
    end

    # Filter bits
    def self.fb17=(value : Bool) : Bool
      self.set(fb17: value)
      value
    end

    # Filter bits
    def fb18 : Bool
      @value.bits_set?(0x40000_u32)
    end

    # Filter bits
    def self.fb18 : Bool
      value.fb18
    end

    # Filter bits
    def self.fb18=(value : Bool) : Bool
      self.set(fb18: value)
      value
    end

    # Filter bits
    def fb19 : Bool
      @value.bits_set?(0x80000_u32)
    end

    # Filter bits
    def self.fb19 : Bool
      value.fb19
    end

    # Filter bits
    def self.fb19=(value : Bool) : Bool
      self.set(fb19: value)
      value
    end

    # Filter bits
    def fb20 : Bool
      @value.bits_set?(0x100000_u32)
    end

    # Filter bits
    def self.fb20 : Bool
      value.fb20
    end

    # Filter bits
    def self.fb20=(value : Bool) : Bool
      self.set(fb20: value)
      value
    end

    # Filter bits
    def fb21 : Bool
      @value.bits_set?(0x200000_u32)
    end

    # Filter bits
    def self.fb21 : Bool
      value.fb21
    end

    # Filter bits
    def self.fb21=(value : Bool) : Bool
      self.set(fb21: value)
      value
    end

    # Filter bits
    def fb22 : Bool
      @value.bits_set?(0x400000_u32)
    end

    # Filter bits
    def self.fb22 : Bool
      value.fb22
    end

    # Filter bits
    def self.fb22=(value : Bool) : Bool
      self.set(fb22: value)
      value
    end

    # Filter bits
    def fb23 : Bool
      @value.bits_set?(0x800000_u32)
    end

    # Filter bits
    def self.fb23 : Bool
      value.fb23
    end

    # Filter bits
    def self.fb23=(value : Bool) : Bool
      self.set(fb23: value)
      value
    end

    # Filter bits
    def fb24 : Bool
      @value.bits_set?(0x1000000_u32)
    end

    # Filter bits
    def self.fb24 : Bool
      value.fb24
    end

    # Filter bits
    def self.fb24=(value : Bool) : Bool
      self.set(fb24: value)
      value
    end

    # Filter bits
    def fb25 : Bool
      @value.bits_set?(0x2000000_u32)
    end

    # Filter bits
    def self.fb25 : Bool
      value.fb25
    end

    # Filter bits
    def self.fb25=(value : Bool) : Bool
      self.set(fb25: value)
      value
    end

    # Filter bits
    def fb26 : Bool
      @value.bits_set?(0x4000000_u32)
    end

    # Filter bits
    def self.fb26 : Bool
      value.fb26
    end

    # Filter bits
    def self.fb26=(value : Bool) : Bool
      self.set(fb26: value)
      value
    end

    # Filter bits
    def fb27 : Bool
      @value.bits_set?(0x8000000_u32)
    end

    # Filter bits
    def self.fb27 : Bool
      value.fb27
    end

    # Filter bits
    def self.fb27=(value : Bool) : Bool
      self.set(fb27: value)
      value
    end

    # Filter bits
    def fb28 : Bool
      @value.bits_set?(0x10000000_u32)
    end

    # Filter bits
    def self.fb28 : Bool
      value.fb28
    end

    # Filter bits
    def self.fb28=(value : Bool) : Bool
      self.set(fb28: value)
      value
    end

    # Filter bits
    def fb29 : Bool
      @value.bits_set?(0x20000000_u32)
    end

    # Filter bits
    def self.fb29 : Bool
      value.fb29
    end

    # Filter bits
    def self.fb29=(value : Bool) : Bool
      self.set(fb29: value)
      value
    end

    # Filter bits
    def fb30 : Bool
      @value.bits_set?(0x40000000_u32)
    end

    # Filter bits
    def self.fb30 : Bool
      value.fb30
    end

    # Filter bits
    def self.fb30=(value : Bool) : Bool
      self.set(fb30: value)
      value
    end

    # Filter bits
    def fb31 : Bool
      @value.bits_set?(0x80000000_u32)
    end

    # Filter bits
    def self.fb31 : Bool
      value.fb31
    end

    # Filter bits
    def self.fb31=(value : Bool) : Bool
      self.set(fb31: value)
      value
    end

    def copy_with(
      *,

      fb0 : Bool? = nil,

      fb1 : Bool? = nil,

      fb2 : Bool? = nil,

      fb3 : Bool? = nil,

      fb4 : Bool? = nil,

      fb5 : Bool? = nil,

      fb6 : Bool? = nil,

      fb7 : Bool? = nil,

      fb8 : Bool? = nil,

      fb9 : Bool? = nil,

      fb10 : Bool? = nil,

      fb11 : Bool? = nil,

      fb12 : Bool? = nil,

      fb13 : Bool? = nil,

      fb14 : Bool? = nil,

      fb15 : Bool? = nil,

      fb16 : Bool? = nil,

      fb17 : Bool? = nil,

      fb18 : Bool? = nil,

      fb19 : Bool? = nil,

      fb20 : Bool? = nil,

      fb21 : Bool? = nil,

      fb22 : Bool? = nil,

      fb23 : Bool? = nil,

      fb24 : Bool? = nil,

      fb25 : Bool? = nil,

      fb26 : Bool? = nil,

      fb27 : Bool? = nil,

      fb28 : Bool? = nil,

      fb29 : Bool? = nil,

      fb30 : Bool? = nil,

      fb31 : Bool? = nil
    ) : self
      value = @value

      unless fb0.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(fb0.to_int).&(0x1_u32) << 0
      end

      unless fb1.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(fb1.to_int).&(0x1_u32) << 1
      end

      unless fb2.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(fb2.to_int).&(0x1_u32) << 2
      end

      unless fb3.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(fb3.to_int).&(0x1_u32) << 3
      end

      unless fb4.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(fb4.to_int).&(0x1_u32) << 4
      end

      unless fb5.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(fb5.to_int).&(0x1_u32) << 5
      end

      unless fb6.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(fb6.to_int).&(0x1_u32) << 6
      end

      unless fb7.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(fb7.to_int).&(0x1_u32) << 7
      end

      unless fb8.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(fb8.to_int).&(0x1_u32) << 8
      end

      unless fb9.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(fb9.to_int).&(0x1_u32) << 9
      end

      unless fb10.nil?
        value = (value & 0xfffffbff_u32) |
                UInt32.new!(fb10.to_int).&(0x1_u32) << 10
      end

      unless fb11.nil?
        value = (value & 0xfffff7ff_u32) |
                UInt32.new!(fb11.to_int).&(0x1_u32) << 11
      end

      unless fb12.nil?
        value = (value & 0xffffefff_u32) |
                UInt32.new!(fb12.to_int).&(0x1_u32) << 12
      end

      unless fb13.nil?
        value = (value & 0xffffdfff_u32) |
                UInt32.new!(fb13.to_int).&(0x1_u32) << 13
      end

      unless fb14.nil?
        value = (value & 0xffffbfff_u32) |
                UInt32.new!(fb14.to_int).&(0x1_u32) << 14
      end

      unless fb15.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(fb15.to_int).&(0x1_u32) << 15
      end

      unless fb16.nil?
        value = (value & 0xfffeffff_u32) |
                UInt32.new!(fb16.to_int).&(0x1_u32) << 16
      end

      unless fb17.nil?
        value = (value & 0xfffdffff_u32) |
                UInt32.new!(fb17.to_int).&(0x1_u32) << 17
      end

      unless fb18.nil?
        value = (value & 0xfffbffff_u32) |
                UInt32.new!(fb18.to_int).&(0x1_u32) << 18
      end

      unless fb19.nil?
        value = (value & 0xfff7ffff_u32) |
                UInt32.new!(fb19.to_int).&(0x1_u32) << 19
      end

      unless fb20.nil?
        value = (value & 0xffefffff_u32) |
                UInt32.new!(fb20.to_int).&(0x1_u32) << 20
      end

      unless fb21.nil?
        value = (value & 0xffdfffff_u32) |
                UInt32.new!(fb21.to_int).&(0x1_u32) << 21
      end

      unless fb22.nil?
        value = (value & 0xffbfffff_u32) |
                UInt32.new!(fb22.to_int).&(0x1_u32) << 22
      end

      unless fb23.nil?
        value = (value & 0xff7fffff_u32) |
                UInt32.new!(fb23.to_int).&(0x1_u32) << 23
      end

      unless fb24.nil?
        value = (value & 0xfeffffff_u32) |
                UInt32.new!(fb24.to_int).&(0x1_u32) << 24
      end

      unless fb25.nil?
        value = (value & 0xfdffffff_u32) |
                UInt32.new!(fb25.to_int).&(0x1_u32) << 25
      end

      unless fb26.nil?
        value = (value & 0xfbffffff_u32) |
                UInt32.new!(fb26.to_int).&(0x1_u32) << 26
      end

      unless fb27.nil?
        value = (value & 0xf7ffffff_u32) |
                UInt32.new!(fb27.to_int).&(0x1_u32) << 27
      end

      unless fb28.nil?
        value = (value & 0xefffffff_u32) |
                UInt32.new!(fb28.to_int).&(0x1_u32) << 28
      end

      unless fb29.nil?
        value = (value & 0xdfffffff_u32) |
                UInt32.new!(fb29.to_int).&(0x1_u32) << 29
      end

      unless fb30.nil?
        value = (value & 0xbfffffff_u32) |
                UInt32.new!(fb30.to_int).&(0x1_u32) << 30
      end

      unless fb31.nil?
        value = (value & 0x7fffffff_u32) |
                UInt32.new!(fb31.to_int).&(0x1_u32) << 31
      end

      self.class.new(value)
    end

    def self.set(
      *,
      fb0 : Bool? = nil,
      fb1 : Bool? = nil,
      fb2 : Bool? = nil,
      fb3 : Bool? = nil,
      fb4 : Bool? = nil,
      fb5 : Bool? = nil,
      fb6 : Bool? = nil,
      fb7 : Bool? = nil,
      fb8 : Bool? = nil,
      fb9 : Bool? = nil,
      fb10 : Bool? = nil,
      fb11 : Bool? = nil,
      fb12 : Bool? = nil,
      fb13 : Bool? = nil,
      fb14 : Bool? = nil,
      fb15 : Bool? = nil,
      fb16 : Bool? = nil,
      fb17 : Bool? = nil,
      fb18 : Bool? = nil,
      fb19 : Bool? = nil,
      fb20 : Bool? = nil,
      fb21 : Bool? = nil,
      fb22 : Bool? = nil,
      fb23 : Bool? = nil,
      fb24 : Bool? = nil,
      fb25 : Bool? = nil,
      fb26 : Bool? = nil,
      fb27 : Bool? = nil,
      fb28 : Bool? = nil,
      fb29 : Bool? = nil,
      fb30 : Bool? = nil,
      fb31 : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        fb0: fb0,
        fb1: fb1,
        fb2: fb2,
        fb3: fb3,
        fb4: fb4,
        fb5: fb5,
        fb6: fb6,
        fb7: fb7,
        fb8: fb8,
        fb9: fb9,
        fb10: fb10,
        fb11: fb11,
        fb12: fb12,
        fb13: fb13,
        fb14: fb14,
        fb15: fb15,
        fb16: fb16,
        fb17: fb17,
        fb18: fb18,
        fb19: fb19,
        fb20: fb20,
        fb21: fb21,
        fb22: fb22,
        fb23: fb23,
        fb24: fb24,
        fb25: fb25,
        fb26: fb26,
        fb27: fb27,
        fb28: fb28,
        fb29: fb29,
        fb30: fb30,
        fb31: fb31,
      )
    end
  end # struct

  # Filter bank 15 register 2
  struct F15R2
    ADDRESS = BASE_ADDRESS + 0x2bc_u64

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

    # Filter bits
    def fb0 : Bool
      @value.bits_set?(0x1_u32)
    end

    # Filter bits
    def self.fb0 : Bool
      value.fb0
    end

    # Filter bits
    def self.fb0=(value : Bool) : Bool
      self.set(fb0: value)
      value
    end

    # Filter bits
    def fb1 : Bool
      @value.bits_set?(0x2_u32)
    end

    # Filter bits
    def self.fb1 : Bool
      value.fb1
    end

    # Filter bits
    def self.fb1=(value : Bool) : Bool
      self.set(fb1: value)
      value
    end

    # Filter bits
    def fb2 : Bool
      @value.bits_set?(0x4_u32)
    end

    # Filter bits
    def self.fb2 : Bool
      value.fb2
    end

    # Filter bits
    def self.fb2=(value : Bool) : Bool
      self.set(fb2: value)
      value
    end

    # Filter bits
    def fb3 : Bool
      @value.bits_set?(0x8_u32)
    end

    # Filter bits
    def self.fb3 : Bool
      value.fb3
    end

    # Filter bits
    def self.fb3=(value : Bool) : Bool
      self.set(fb3: value)
      value
    end

    # Filter bits
    def fb4 : Bool
      @value.bits_set?(0x10_u32)
    end

    # Filter bits
    def self.fb4 : Bool
      value.fb4
    end

    # Filter bits
    def self.fb4=(value : Bool) : Bool
      self.set(fb4: value)
      value
    end

    # Filter bits
    def fb5 : Bool
      @value.bits_set?(0x20_u32)
    end

    # Filter bits
    def self.fb5 : Bool
      value.fb5
    end

    # Filter bits
    def self.fb5=(value : Bool) : Bool
      self.set(fb5: value)
      value
    end

    # Filter bits
    def fb6 : Bool
      @value.bits_set?(0x40_u32)
    end

    # Filter bits
    def self.fb6 : Bool
      value.fb6
    end

    # Filter bits
    def self.fb6=(value : Bool) : Bool
      self.set(fb6: value)
      value
    end

    # Filter bits
    def fb7 : Bool
      @value.bits_set?(0x80_u32)
    end

    # Filter bits
    def self.fb7 : Bool
      value.fb7
    end

    # Filter bits
    def self.fb7=(value : Bool) : Bool
      self.set(fb7: value)
      value
    end

    # Filter bits
    def fb8 : Bool
      @value.bits_set?(0x100_u32)
    end

    # Filter bits
    def self.fb8 : Bool
      value.fb8
    end

    # Filter bits
    def self.fb8=(value : Bool) : Bool
      self.set(fb8: value)
      value
    end

    # Filter bits
    def fb9 : Bool
      @value.bits_set?(0x200_u32)
    end

    # Filter bits
    def self.fb9 : Bool
      value.fb9
    end

    # Filter bits
    def self.fb9=(value : Bool) : Bool
      self.set(fb9: value)
      value
    end

    # Filter bits
    def fb10 : Bool
      @value.bits_set?(0x400_u32)
    end

    # Filter bits
    def self.fb10 : Bool
      value.fb10
    end

    # Filter bits
    def self.fb10=(value : Bool) : Bool
      self.set(fb10: value)
      value
    end

    # Filter bits
    def fb11 : Bool
      @value.bits_set?(0x800_u32)
    end

    # Filter bits
    def self.fb11 : Bool
      value.fb11
    end

    # Filter bits
    def self.fb11=(value : Bool) : Bool
      self.set(fb11: value)
      value
    end

    # Filter bits
    def fb12 : Bool
      @value.bits_set?(0x1000_u32)
    end

    # Filter bits
    def self.fb12 : Bool
      value.fb12
    end

    # Filter bits
    def self.fb12=(value : Bool) : Bool
      self.set(fb12: value)
      value
    end

    # Filter bits
    def fb13 : Bool
      @value.bits_set?(0x2000_u32)
    end

    # Filter bits
    def self.fb13 : Bool
      value.fb13
    end

    # Filter bits
    def self.fb13=(value : Bool) : Bool
      self.set(fb13: value)
      value
    end

    # Filter bits
    def fb14 : Bool
      @value.bits_set?(0x4000_u32)
    end

    # Filter bits
    def self.fb14 : Bool
      value.fb14
    end

    # Filter bits
    def self.fb14=(value : Bool) : Bool
      self.set(fb14: value)
      value
    end

    # Filter bits
    def fb15 : Bool
      @value.bits_set?(0x8000_u32)
    end

    # Filter bits
    def self.fb15 : Bool
      value.fb15
    end

    # Filter bits
    def self.fb15=(value : Bool) : Bool
      self.set(fb15: value)
      value
    end

    # Filter bits
    def fb16 : Bool
      @value.bits_set?(0x10000_u32)
    end

    # Filter bits
    def self.fb16 : Bool
      value.fb16
    end

    # Filter bits
    def self.fb16=(value : Bool) : Bool
      self.set(fb16: value)
      value
    end

    # Filter bits
    def fb17 : Bool
      @value.bits_set?(0x20000_u32)
    end

    # Filter bits
    def self.fb17 : Bool
      value.fb17
    end

    # Filter bits
    def self.fb17=(value : Bool) : Bool
      self.set(fb17: value)
      value
    end

    # Filter bits
    def fb18 : Bool
      @value.bits_set?(0x40000_u32)
    end

    # Filter bits
    def self.fb18 : Bool
      value.fb18
    end

    # Filter bits
    def self.fb18=(value : Bool) : Bool
      self.set(fb18: value)
      value
    end

    # Filter bits
    def fb19 : Bool
      @value.bits_set?(0x80000_u32)
    end

    # Filter bits
    def self.fb19 : Bool
      value.fb19
    end

    # Filter bits
    def self.fb19=(value : Bool) : Bool
      self.set(fb19: value)
      value
    end

    # Filter bits
    def fb20 : Bool
      @value.bits_set?(0x100000_u32)
    end

    # Filter bits
    def self.fb20 : Bool
      value.fb20
    end

    # Filter bits
    def self.fb20=(value : Bool) : Bool
      self.set(fb20: value)
      value
    end

    # Filter bits
    def fb21 : Bool
      @value.bits_set?(0x200000_u32)
    end

    # Filter bits
    def self.fb21 : Bool
      value.fb21
    end

    # Filter bits
    def self.fb21=(value : Bool) : Bool
      self.set(fb21: value)
      value
    end

    # Filter bits
    def fb22 : Bool
      @value.bits_set?(0x400000_u32)
    end

    # Filter bits
    def self.fb22 : Bool
      value.fb22
    end

    # Filter bits
    def self.fb22=(value : Bool) : Bool
      self.set(fb22: value)
      value
    end

    # Filter bits
    def fb23 : Bool
      @value.bits_set?(0x800000_u32)
    end

    # Filter bits
    def self.fb23 : Bool
      value.fb23
    end

    # Filter bits
    def self.fb23=(value : Bool) : Bool
      self.set(fb23: value)
      value
    end

    # Filter bits
    def fb24 : Bool
      @value.bits_set?(0x1000000_u32)
    end

    # Filter bits
    def self.fb24 : Bool
      value.fb24
    end

    # Filter bits
    def self.fb24=(value : Bool) : Bool
      self.set(fb24: value)
      value
    end

    # Filter bits
    def fb25 : Bool
      @value.bits_set?(0x2000000_u32)
    end

    # Filter bits
    def self.fb25 : Bool
      value.fb25
    end

    # Filter bits
    def self.fb25=(value : Bool) : Bool
      self.set(fb25: value)
      value
    end

    # Filter bits
    def fb26 : Bool
      @value.bits_set?(0x4000000_u32)
    end

    # Filter bits
    def self.fb26 : Bool
      value.fb26
    end

    # Filter bits
    def self.fb26=(value : Bool) : Bool
      self.set(fb26: value)
      value
    end

    # Filter bits
    def fb27 : Bool
      @value.bits_set?(0x8000000_u32)
    end

    # Filter bits
    def self.fb27 : Bool
      value.fb27
    end

    # Filter bits
    def self.fb27=(value : Bool) : Bool
      self.set(fb27: value)
      value
    end

    # Filter bits
    def fb28 : Bool
      @value.bits_set?(0x10000000_u32)
    end

    # Filter bits
    def self.fb28 : Bool
      value.fb28
    end

    # Filter bits
    def self.fb28=(value : Bool) : Bool
      self.set(fb28: value)
      value
    end

    # Filter bits
    def fb29 : Bool
      @value.bits_set?(0x20000000_u32)
    end

    # Filter bits
    def self.fb29 : Bool
      value.fb29
    end

    # Filter bits
    def self.fb29=(value : Bool) : Bool
      self.set(fb29: value)
      value
    end

    # Filter bits
    def fb30 : Bool
      @value.bits_set?(0x40000000_u32)
    end

    # Filter bits
    def self.fb30 : Bool
      value.fb30
    end

    # Filter bits
    def self.fb30=(value : Bool) : Bool
      self.set(fb30: value)
      value
    end

    # Filter bits
    def fb31 : Bool
      @value.bits_set?(0x80000000_u32)
    end

    # Filter bits
    def self.fb31 : Bool
      value.fb31
    end

    # Filter bits
    def self.fb31=(value : Bool) : Bool
      self.set(fb31: value)
      value
    end

    def copy_with(
      *,

      fb0 : Bool? = nil,

      fb1 : Bool? = nil,

      fb2 : Bool? = nil,

      fb3 : Bool? = nil,

      fb4 : Bool? = nil,

      fb5 : Bool? = nil,

      fb6 : Bool? = nil,

      fb7 : Bool? = nil,

      fb8 : Bool? = nil,

      fb9 : Bool? = nil,

      fb10 : Bool? = nil,

      fb11 : Bool? = nil,

      fb12 : Bool? = nil,

      fb13 : Bool? = nil,

      fb14 : Bool? = nil,

      fb15 : Bool? = nil,

      fb16 : Bool? = nil,

      fb17 : Bool? = nil,

      fb18 : Bool? = nil,

      fb19 : Bool? = nil,

      fb20 : Bool? = nil,

      fb21 : Bool? = nil,

      fb22 : Bool? = nil,

      fb23 : Bool? = nil,

      fb24 : Bool? = nil,

      fb25 : Bool? = nil,

      fb26 : Bool? = nil,

      fb27 : Bool? = nil,

      fb28 : Bool? = nil,

      fb29 : Bool? = nil,

      fb30 : Bool? = nil,

      fb31 : Bool? = nil
    ) : self
      value = @value

      unless fb0.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(fb0.to_int).&(0x1_u32) << 0
      end

      unless fb1.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(fb1.to_int).&(0x1_u32) << 1
      end

      unless fb2.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(fb2.to_int).&(0x1_u32) << 2
      end

      unless fb3.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(fb3.to_int).&(0x1_u32) << 3
      end

      unless fb4.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(fb4.to_int).&(0x1_u32) << 4
      end

      unless fb5.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(fb5.to_int).&(0x1_u32) << 5
      end

      unless fb6.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(fb6.to_int).&(0x1_u32) << 6
      end

      unless fb7.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(fb7.to_int).&(0x1_u32) << 7
      end

      unless fb8.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(fb8.to_int).&(0x1_u32) << 8
      end

      unless fb9.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(fb9.to_int).&(0x1_u32) << 9
      end

      unless fb10.nil?
        value = (value & 0xfffffbff_u32) |
                UInt32.new!(fb10.to_int).&(0x1_u32) << 10
      end

      unless fb11.nil?
        value = (value & 0xfffff7ff_u32) |
                UInt32.new!(fb11.to_int).&(0x1_u32) << 11
      end

      unless fb12.nil?
        value = (value & 0xffffefff_u32) |
                UInt32.new!(fb12.to_int).&(0x1_u32) << 12
      end

      unless fb13.nil?
        value = (value & 0xffffdfff_u32) |
                UInt32.new!(fb13.to_int).&(0x1_u32) << 13
      end

      unless fb14.nil?
        value = (value & 0xffffbfff_u32) |
                UInt32.new!(fb14.to_int).&(0x1_u32) << 14
      end

      unless fb15.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(fb15.to_int).&(0x1_u32) << 15
      end

      unless fb16.nil?
        value = (value & 0xfffeffff_u32) |
                UInt32.new!(fb16.to_int).&(0x1_u32) << 16
      end

      unless fb17.nil?
        value = (value & 0xfffdffff_u32) |
                UInt32.new!(fb17.to_int).&(0x1_u32) << 17
      end

      unless fb18.nil?
        value = (value & 0xfffbffff_u32) |
                UInt32.new!(fb18.to_int).&(0x1_u32) << 18
      end

      unless fb19.nil?
        value = (value & 0xfff7ffff_u32) |
                UInt32.new!(fb19.to_int).&(0x1_u32) << 19
      end

      unless fb20.nil?
        value = (value & 0xffefffff_u32) |
                UInt32.new!(fb20.to_int).&(0x1_u32) << 20
      end

      unless fb21.nil?
        value = (value & 0xffdfffff_u32) |
                UInt32.new!(fb21.to_int).&(0x1_u32) << 21
      end

      unless fb22.nil?
        value = (value & 0xffbfffff_u32) |
                UInt32.new!(fb22.to_int).&(0x1_u32) << 22
      end

      unless fb23.nil?
        value = (value & 0xff7fffff_u32) |
                UInt32.new!(fb23.to_int).&(0x1_u32) << 23
      end

      unless fb24.nil?
        value = (value & 0xfeffffff_u32) |
                UInt32.new!(fb24.to_int).&(0x1_u32) << 24
      end

      unless fb25.nil?
        value = (value & 0xfdffffff_u32) |
                UInt32.new!(fb25.to_int).&(0x1_u32) << 25
      end

      unless fb26.nil?
        value = (value & 0xfbffffff_u32) |
                UInt32.new!(fb26.to_int).&(0x1_u32) << 26
      end

      unless fb27.nil?
        value = (value & 0xf7ffffff_u32) |
                UInt32.new!(fb27.to_int).&(0x1_u32) << 27
      end

      unless fb28.nil?
        value = (value & 0xefffffff_u32) |
                UInt32.new!(fb28.to_int).&(0x1_u32) << 28
      end

      unless fb29.nil?
        value = (value & 0xdfffffff_u32) |
                UInt32.new!(fb29.to_int).&(0x1_u32) << 29
      end

      unless fb30.nil?
        value = (value & 0xbfffffff_u32) |
                UInt32.new!(fb30.to_int).&(0x1_u32) << 30
      end

      unless fb31.nil?
        value = (value & 0x7fffffff_u32) |
                UInt32.new!(fb31.to_int).&(0x1_u32) << 31
      end

      self.class.new(value)
    end

    def self.set(
      *,
      fb0 : Bool? = nil,
      fb1 : Bool? = nil,
      fb2 : Bool? = nil,
      fb3 : Bool? = nil,
      fb4 : Bool? = nil,
      fb5 : Bool? = nil,
      fb6 : Bool? = nil,
      fb7 : Bool? = nil,
      fb8 : Bool? = nil,
      fb9 : Bool? = nil,
      fb10 : Bool? = nil,
      fb11 : Bool? = nil,
      fb12 : Bool? = nil,
      fb13 : Bool? = nil,
      fb14 : Bool? = nil,
      fb15 : Bool? = nil,
      fb16 : Bool? = nil,
      fb17 : Bool? = nil,
      fb18 : Bool? = nil,
      fb19 : Bool? = nil,
      fb20 : Bool? = nil,
      fb21 : Bool? = nil,
      fb22 : Bool? = nil,
      fb23 : Bool? = nil,
      fb24 : Bool? = nil,
      fb25 : Bool? = nil,
      fb26 : Bool? = nil,
      fb27 : Bool? = nil,
      fb28 : Bool? = nil,
      fb29 : Bool? = nil,
      fb30 : Bool? = nil,
      fb31 : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        fb0: fb0,
        fb1: fb1,
        fb2: fb2,
        fb3: fb3,
        fb4: fb4,
        fb5: fb5,
        fb6: fb6,
        fb7: fb7,
        fb8: fb8,
        fb9: fb9,
        fb10: fb10,
        fb11: fb11,
        fb12: fb12,
        fb13: fb13,
        fb14: fb14,
        fb15: fb15,
        fb16: fb16,
        fb17: fb17,
        fb18: fb18,
        fb19: fb19,
        fb20: fb20,
        fb21: fb21,
        fb22: fb22,
        fb23: fb23,
        fb24: fb24,
        fb25: fb25,
        fb26: fb26,
        fb27: fb27,
        fb28: fb28,
        fb29: fb29,
        fb30: fb30,
        fb31: fb31,
      )
    end
  end # struct

  # Filter bank 16 register 1
  struct F16R1
    ADDRESS = BASE_ADDRESS + 0x2c0_u64

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

    # Filter bits
    def fb0 : Bool
      @value.bits_set?(0x1_u32)
    end

    # Filter bits
    def self.fb0 : Bool
      value.fb0
    end

    # Filter bits
    def self.fb0=(value : Bool) : Bool
      self.set(fb0: value)
      value
    end

    # Filter bits
    def fb1 : Bool
      @value.bits_set?(0x2_u32)
    end

    # Filter bits
    def self.fb1 : Bool
      value.fb1
    end

    # Filter bits
    def self.fb1=(value : Bool) : Bool
      self.set(fb1: value)
      value
    end

    # Filter bits
    def fb2 : Bool
      @value.bits_set?(0x4_u32)
    end

    # Filter bits
    def self.fb2 : Bool
      value.fb2
    end

    # Filter bits
    def self.fb2=(value : Bool) : Bool
      self.set(fb2: value)
      value
    end

    # Filter bits
    def fb3 : Bool
      @value.bits_set?(0x8_u32)
    end

    # Filter bits
    def self.fb3 : Bool
      value.fb3
    end

    # Filter bits
    def self.fb3=(value : Bool) : Bool
      self.set(fb3: value)
      value
    end

    # Filter bits
    def fb4 : Bool
      @value.bits_set?(0x10_u32)
    end

    # Filter bits
    def self.fb4 : Bool
      value.fb4
    end

    # Filter bits
    def self.fb4=(value : Bool) : Bool
      self.set(fb4: value)
      value
    end

    # Filter bits
    def fb5 : Bool
      @value.bits_set?(0x20_u32)
    end

    # Filter bits
    def self.fb5 : Bool
      value.fb5
    end

    # Filter bits
    def self.fb5=(value : Bool) : Bool
      self.set(fb5: value)
      value
    end

    # Filter bits
    def fb6 : Bool
      @value.bits_set?(0x40_u32)
    end

    # Filter bits
    def self.fb6 : Bool
      value.fb6
    end

    # Filter bits
    def self.fb6=(value : Bool) : Bool
      self.set(fb6: value)
      value
    end

    # Filter bits
    def fb7 : Bool
      @value.bits_set?(0x80_u32)
    end

    # Filter bits
    def self.fb7 : Bool
      value.fb7
    end

    # Filter bits
    def self.fb7=(value : Bool) : Bool
      self.set(fb7: value)
      value
    end

    # Filter bits
    def fb8 : Bool
      @value.bits_set?(0x100_u32)
    end

    # Filter bits
    def self.fb8 : Bool
      value.fb8
    end

    # Filter bits
    def self.fb8=(value : Bool) : Bool
      self.set(fb8: value)
      value
    end

    # Filter bits
    def fb9 : Bool
      @value.bits_set?(0x200_u32)
    end

    # Filter bits
    def self.fb9 : Bool
      value.fb9
    end

    # Filter bits
    def self.fb9=(value : Bool) : Bool
      self.set(fb9: value)
      value
    end

    # Filter bits
    def fb10 : Bool
      @value.bits_set?(0x400_u32)
    end

    # Filter bits
    def self.fb10 : Bool
      value.fb10
    end

    # Filter bits
    def self.fb10=(value : Bool) : Bool
      self.set(fb10: value)
      value
    end

    # Filter bits
    def fb11 : Bool
      @value.bits_set?(0x800_u32)
    end

    # Filter bits
    def self.fb11 : Bool
      value.fb11
    end

    # Filter bits
    def self.fb11=(value : Bool) : Bool
      self.set(fb11: value)
      value
    end

    # Filter bits
    def fb12 : Bool
      @value.bits_set?(0x1000_u32)
    end

    # Filter bits
    def self.fb12 : Bool
      value.fb12
    end

    # Filter bits
    def self.fb12=(value : Bool) : Bool
      self.set(fb12: value)
      value
    end

    # Filter bits
    def fb13 : Bool
      @value.bits_set?(0x2000_u32)
    end

    # Filter bits
    def self.fb13 : Bool
      value.fb13
    end

    # Filter bits
    def self.fb13=(value : Bool) : Bool
      self.set(fb13: value)
      value
    end

    # Filter bits
    def fb14 : Bool
      @value.bits_set?(0x4000_u32)
    end

    # Filter bits
    def self.fb14 : Bool
      value.fb14
    end

    # Filter bits
    def self.fb14=(value : Bool) : Bool
      self.set(fb14: value)
      value
    end

    # Filter bits
    def fb15 : Bool
      @value.bits_set?(0x8000_u32)
    end

    # Filter bits
    def self.fb15 : Bool
      value.fb15
    end

    # Filter bits
    def self.fb15=(value : Bool) : Bool
      self.set(fb15: value)
      value
    end

    # Filter bits
    def fb16 : Bool
      @value.bits_set?(0x10000_u32)
    end

    # Filter bits
    def self.fb16 : Bool
      value.fb16
    end

    # Filter bits
    def self.fb16=(value : Bool) : Bool
      self.set(fb16: value)
      value
    end

    # Filter bits
    def fb17 : Bool
      @value.bits_set?(0x20000_u32)
    end

    # Filter bits
    def self.fb17 : Bool
      value.fb17
    end

    # Filter bits
    def self.fb17=(value : Bool) : Bool
      self.set(fb17: value)
      value
    end

    # Filter bits
    def fb18 : Bool
      @value.bits_set?(0x40000_u32)
    end

    # Filter bits
    def self.fb18 : Bool
      value.fb18
    end

    # Filter bits
    def self.fb18=(value : Bool) : Bool
      self.set(fb18: value)
      value
    end

    # Filter bits
    def fb19 : Bool
      @value.bits_set?(0x80000_u32)
    end

    # Filter bits
    def self.fb19 : Bool
      value.fb19
    end

    # Filter bits
    def self.fb19=(value : Bool) : Bool
      self.set(fb19: value)
      value
    end

    # Filter bits
    def fb20 : Bool
      @value.bits_set?(0x100000_u32)
    end

    # Filter bits
    def self.fb20 : Bool
      value.fb20
    end

    # Filter bits
    def self.fb20=(value : Bool) : Bool
      self.set(fb20: value)
      value
    end

    # Filter bits
    def fb21 : Bool
      @value.bits_set?(0x200000_u32)
    end

    # Filter bits
    def self.fb21 : Bool
      value.fb21
    end

    # Filter bits
    def self.fb21=(value : Bool) : Bool
      self.set(fb21: value)
      value
    end

    # Filter bits
    def fb22 : Bool
      @value.bits_set?(0x400000_u32)
    end

    # Filter bits
    def self.fb22 : Bool
      value.fb22
    end

    # Filter bits
    def self.fb22=(value : Bool) : Bool
      self.set(fb22: value)
      value
    end

    # Filter bits
    def fb23 : Bool
      @value.bits_set?(0x800000_u32)
    end

    # Filter bits
    def self.fb23 : Bool
      value.fb23
    end

    # Filter bits
    def self.fb23=(value : Bool) : Bool
      self.set(fb23: value)
      value
    end

    # Filter bits
    def fb24 : Bool
      @value.bits_set?(0x1000000_u32)
    end

    # Filter bits
    def self.fb24 : Bool
      value.fb24
    end

    # Filter bits
    def self.fb24=(value : Bool) : Bool
      self.set(fb24: value)
      value
    end

    # Filter bits
    def fb25 : Bool
      @value.bits_set?(0x2000000_u32)
    end

    # Filter bits
    def self.fb25 : Bool
      value.fb25
    end

    # Filter bits
    def self.fb25=(value : Bool) : Bool
      self.set(fb25: value)
      value
    end

    # Filter bits
    def fb26 : Bool
      @value.bits_set?(0x4000000_u32)
    end

    # Filter bits
    def self.fb26 : Bool
      value.fb26
    end

    # Filter bits
    def self.fb26=(value : Bool) : Bool
      self.set(fb26: value)
      value
    end

    # Filter bits
    def fb27 : Bool
      @value.bits_set?(0x8000000_u32)
    end

    # Filter bits
    def self.fb27 : Bool
      value.fb27
    end

    # Filter bits
    def self.fb27=(value : Bool) : Bool
      self.set(fb27: value)
      value
    end

    # Filter bits
    def fb28 : Bool
      @value.bits_set?(0x10000000_u32)
    end

    # Filter bits
    def self.fb28 : Bool
      value.fb28
    end

    # Filter bits
    def self.fb28=(value : Bool) : Bool
      self.set(fb28: value)
      value
    end

    # Filter bits
    def fb29 : Bool
      @value.bits_set?(0x20000000_u32)
    end

    # Filter bits
    def self.fb29 : Bool
      value.fb29
    end

    # Filter bits
    def self.fb29=(value : Bool) : Bool
      self.set(fb29: value)
      value
    end

    # Filter bits
    def fb30 : Bool
      @value.bits_set?(0x40000000_u32)
    end

    # Filter bits
    def self.fb30 : Bool
      value.fb30
    end

    # Filter bits
    def self.fb30=(value : Bool) : Bool
      self.set(fb30: value)
      value
    end

    # Filter bits
    def fb31 : Bool
      @value.bits_set?(0x80000000_u32)
    end

    # Filter bits
    def self.fb31 : Bool
      value.fb31
    end

    # Filter bits
    def self.fb31=(value : Bool) : Bool
      self.set(fb31: value)
      value
    end

    def copy_with(
      *,

      fb0 : Bool? = nil,

      fb1 : Bool? = nil,

      fb2 : Bool? = nil,

      fb3 : Bool? = nil,

      fb4 : Bool? = nil,

      fb5 : Bool? = nil,

      fb6 : Bool? = nil,

      fb7 : Bool? = nil,

      fb8 : Bool? = nil,

      fb9 : Bool? = nil,

      fb10 : Bool? = nil,

      fb11 : Bool? = nil,

      fb12 : Bool? = nil,

      fb13 : Bool? = nil,

      fb14 : Bool? = nil,

      fb15 : Bool? = nil,

      fb16 : Bool? = nil,

      fb17 : Bool? = nil,

      fb18 : Bool? = nil,

      fb19 : Bool? = nil,

      fb20 : Bool? = nil,

      fb21 : Bool? = nil,

      fb22 : Bool? = nil,

      fb23 : Bool? = nil,

      fb24 : Bool? = nil,

      fb25 : Bool? = nil,

      fb26 : Bool? = nil,

      fb27 : Bool? = nil,

      fb28 : Bool? = nil,

      fb29 : Bool? = nil,

      fb30 : Bool? = nil,

      fb31 : Bool? = nil
    ) : self
      value = @value

      unless fb0.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(fb0.to_int).&(0x1_u32) << 0
      end

      unless fb1.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(fb1.to_int).&(0x1_u32) << 1
      end

      unless fb2.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(fb2.to_int).&(0x1_u32) << 2
      end

      unless fb3.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(fb3.to_int).&(0x1_u32) << 3
      end

      unless fb4.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(fb4.to_int).&(0x1_u32) << 4
      end

      unless fb5.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(fb5.to_int).&(0x1_u32) << 5
      end

      unless fb6.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(fb6.to_int).&(0x1_u32) << 6
      end

      unless fb7.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(fb7.to_int).&(0x1_u32) << 7
      end

      unless fb8.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(fb8.to_int).&(0x1_u32) << 8
      end

      unless fb9.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(fb9.to_int).&(0x1_u32) << 9
      end

      unless fb10.nil?
        value = (value & 0xfffffbff_u32) |
                UInt32.new!(fb10.to_int).&(0x1_u32) << 10
      end

      unless fb11.nil?
        value = (value & 0xfffff7ff_u32) |
                UInt32.new!(fb11.to_int).&(0x1_u32) << 11
      end

      unless fb12.nil?
        value = (value & 0xffffefff_u32) |
                UInt32.new!(fb12.to_int).&(0x1_u32) << 12
      end

      unless fb13.nil?
        value = (value & 0xffffdfff_u32) |
                UInt32.new!(fb13.to_int).&(0x1_u32) << 13
      end

      unless fb14.nil?
        value = (value & 0xffffbfff_u32) |
                UInt32.new!(fb14.to_int).&(0x1_u32) << 14
      end

      unless fb15.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(fb15.to_int).&(0x1_u32) << 15
      end

      unless fb16.nil?
        value = (value & 0xfffeffff_u32) |
                UInt32.new!(fb16.to_int).&(0x1_u32) << 16
      end

      unless fb17.nil?
        value = (value & 0xfffdffff_u32) |
                UInt32.new!(fb17.to_int).&(0x1_u32) << 17
      end

      unless fb18.nil?
        value = (value & 0xfffbffff_u32) |
                UInt32.new!(fb18.to_int).&(0x1_u32) << 18
      end

      unless fb19.nil?
        value = (value & 0xfff7ffff_u32) |
                UInt32.new!(fb19.to_int).&(0x1_u32) << 19
      end

      unless fb20.nil?
        value = (value & 0xffefffff_u32) |
                UInt32.new!(fb20.to_int).&(0x1_u32) << 20
      end

      unless fb21.nil?
        value = (value & 0xffdfffff_u32) |
                UInt32.new!(fb21.to_int).&(0x1_u32) << 21
      end

      unless fb22.nil?
        value = (value & 0xffbfffff_u32) |
                UInt32.new!(fb22.to_int).&(0x1_u32) << 22
      end

      unless fb23.nil?
        value = (value & 0xff7fffff_u32) |
                UInt32.new!(fb23.to_int).&(0x1_u32) << 23
      end

      unless fb24.nil?
        value = (value & 0xfeffffff_u32) |
                UInt32.new!(fb24.to_int).&(0x1_u32) << 24
      end

      unless fb25.nil?
        value = (value & 0xfdffffff_u32) |
                UInt32.new!(fb25.to_int).&(0x1_u32) << 25
      end

      unless fb26.nil?
        value = (value & 0xfbffffff_u32) |
                UInt32.new!(fb26.to_int).&(0x1_u32) << 26
      end

      unless fb27.nil?
        value = (value & 0xf7ffffff_u32) |
                UInt32.new!(fb27.to_int).&(0x1_u32) << 27
      end

      unless fb28.nil?
        value = (value & 0xefffffff_u32) |
                UInt32.new!(fb28.to_int).&(0x1_u32) << 28
      end

      unless fb29.nil?
        value = (value & 0xdfffffff_u32) |
                UInt32.new!(fb29.to_int).&(0x1_u32) << 29
      end

      unless fb30.nil?
        value = (value & 0xbfffffff_u32) |
                UInt32.new!(fb30.to_int).&(0x1_u32) << 30
      end

      unless fb31.nil?
        value = (value & 0x7fffffff_u32) |
                UInt32.new!(fb31.to_int).&(0x1_u32) << 31
      end

      self.class.new(value)
    end

    def self.set(
      *,
      fb0 : Bool? = nil,
      fb1 : Bool? = nil,
      fb2 : Bool? = nil,
      fb3 : Bool? = nil,
      fb4 : Bool? = nil,
      fb5 : Bool? = nil,
      fb6 : Bool? = nil,
      fb7 : Bool? = nil,
      fb8 : Bool? = nil,
      fb9 : Bool? = nil,
      fb10 : Bool? = nil,
      fb11 : Bool? = nil,
      fb12 : Bool? = nil,
      fb13 : Bool? = nil,
      fb14 : Bool? = nil,
      fb15 : Bool? = nil,
      fb16 : Bool? = nil,
      fb17 : Bool? = nil,
      fb18 : Bool? = nil,
      fb19 : Bool? = nil,
      fb20 : Bool? = nil,
      fb21 : Bool? = nil,
      fb22 : Bool? = nil,
      fb23 : Bool? = nil,
      fb24 : Bool? = nil,
      fb25 : Bool? = nil,
      fb26 : Bool? = nil,
      fb27 : Bool? = nil,
      fb28 : Bool? = nil,
      fb29 : Bool? = nil,
      fb30 : Bool? = nil,
      fb31 : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        fb0: fb0,
        fb1: fb1,
        fb2: fb2,
        fb3: fb3,
        fb4: fb4,
        fb5: fb5,
        fb6: fb6,
        fb7: fb7,
        fb8: fb8,
        fb9: fb9,
        fb10: fb10,
        fb11: fb11,
        fb12: fb12,
        fb13: fb13,
        fb14: fb14,
        fb15: fb15,
        fb16: fb16,
        fb17: fb17,
        fb18: fb18,
        fb19: fb19,
        fb20: fb20,
        fb21: fb21,
        fb22: fb22,
        fb23: fb23,
        fb24: fb24,
        fb25: fb25,
        fb26: fb26,
        fb27: fb27,
        fb28: fb28,
        fb29: fb29,
        fb30: fb30,
        fb31: fb31,
      )
    end
  end # struct

  # Filter bank 16 register 2
  struct F16R2
    ADDRESS = BASE_ADDRESS + 0x2c4_u64

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

    # Filter bits
    def fb0 : Bool
      @value.bits_set?(0x1_u32)
    end

    # Filter bits
    def self.fb0 : Bool
      value.fb0
    end

    # Filter bits
    def self.fb0=(value : Bool) : Bool
      self.set(fb0: value)
      value
    end

    # Filter bits
    def fb1 : Bool
      @value.bits_set?(0x2_u32)
    end

    # Filter bits
    def self.fb1 : Bool
      value.fb1
    end

    # Filter bits
    def self.fb1=(value : Bool) : Bool
      self.set(fb1: value)
      value
    end

    # Filter bits
    def fb2 : Bool
      @value.bits_set?(0x4_u32)
    end

    # Filter bits
    def self.fb2 : Bool
      value.fb2
    end

    # Filter bits
    def self.fb2=(value : Bool) : Bool
      self.set(fb2: value)
      value
    end

    # Filter bits
    def fb3 : Bool
      @value.bits_set?(0x8_u32)
    end

    # Filter bits
    def self.fb3 : Bool
      value.fb3
    end

    # Filter bits
    def self.fb3=(value : Bool) : Bool
      self.set(fb3: value)
      value
    end

    # Filter bits
    def fb4 : Bool
      @value.bits_set?(0x10_u32)
    end

    # Filter bits
    def self.fb4 : Bool
      value.fb4
    end

    # Filter bits
    def self.fb4=(value : Bool) : Bool
      self.set(fb4: value)
      value
    end

    # Filter bits
    def fb5 : Bool
      @value.bits_set?(0x20_u32)
    end

    # Filter bits
    def self.fb5 : Bool
      value.fb5
    end

    # Filter bits
    def self.fb5=(value : Bool) : Bool
      self.set(fb5: value)
      value
    end

    # Filter bits
    def fb6 : Bool
      @value.bits_set?(0x40_u32)
    end

    # Filter bits
    def self.fb6 : Bool
      value.fb6
    end

    # Filter bits
    def self.fb6=(value : Bool) : Bool
      self.set(fb6: value)
      value
    end

    # Filter bits
    def fb7 : Bool
      @value.bits_set?(0x80_u32)
    end

    # Filter bits
    def self.fb7 : Bool
      value.fb7
    end

    # Filter bits
    def self.fb7=(value : Bool) : Bool
      self.set(fb7: value)
      value
    end

    # Filter bits
    def fb8 : Bool
      @value.bits_set?(0x100_u32)
    end

    # Filter bits
    def self.fb8 : Bool
      value.fb8
    end

    # Filter bits
    def self.fb8=(value : Bool) : Bool
      self.set(fb8: value)
      value
    end

    # Filter bits
    def fb9 : Bool
      @value.bits_set?(0x200_u32)
    end

    # Filter bits
    def self.fb9 : Bool
      value.fb9
    end

    # Filter bits
    def self.fb9=(value : Bool) : Bool
      self.set(fb9: value)
      value
    end

    # Filter bits
    def fb10 : Bool
      @value.bits_set?(0x400_u32)
    end

    # Filter bits
    def self.fb10 : Bool
      value.fb10
    end

    # Filter bits
    def self.fb10=(value : Bool) : Bool
      self.set(fb10: value)
      value
    end

    # Filter bits
    def fb11 : Bool
      @value.bits_set?(0x800_u32)
    end

    # Filter bits
    def self.fb11 : Bool
      value.fb11
    end

    # Filter bits
    def self.fb11=(value : Bool) : Bool
      self.set(fb11: value)
      value
    end

    # Filter bits
    def fb12 : Bool
      @value.bits_set?(0x1000_u32)
    end

    # Filter bits
    def self.fb12 : Bool
      value.fb12
    end

    # Filter bits
    def self.fb12=(value : Bool) : Bool
      self.set(fb12: value)
      value
    end

    # Filter bits
    def fb13 : Bool
      @value.bits_set?(0x2000_u32)
    end

    # Filter bits
    def self.fb13 : Bool
      value.fb13
    end

    # Filter bits
    def self.fb13=(value : Bool) : Bool
      self.set(fb13: value)
      value
    end

    # Filter bits
    def fb14 : Bool
      @value.bits_set?(0x4000_u32)
    end

    # Filter bits
    def self.fb14 : Bool
      value.fb14
    end

    # Filter bits
    def self.fb14=(value : Bool) : Bool
      self.set(fb14: value)
      value
    end

    # Filter bits
    def fb15 : Bool
      @value.bits_set?(0x8000_u32)
    end

    # Filter bits
    def self.fb15 : Bool
      value.fb15
    end

    # Filter bits
    def self.fb15=(value : Bool) : Bool
      self.set(fb15: value)
      value
    end

    # Filter bits
    def fb16 : Bool
      @value.bits_set?(0x10000_u32)
    end

    # Filter bits
    def self.fb16 : Bool
      value.fb16
    end

    # Filter bits
    def self.fb16=(value : Bool) : Bool
      self.set(fb16: value)
      value
    end

    # Filter bits
    def fb17 : Bool
      @value.bits_set?(0x20000_u32)
    end

    # Filter bits
    def self.fb17 : Bool
      value.fb17
    end

    # Filter bits
    def self.fb17=(value : Bool) : Bool
      self.set(fb17: value)
      value
    end

    # Filter bits
    def fb18 : Bool
      @value.bits_set?(0x40000_u32)
    end

    # Filter bits
    def self.fb18 : Bool
      value.fb18
    end

    # Filter bits
    def self.fb18=(value : Bool) : Bool
      self.set(fb18: value)
      value
    end

    # Filter bits
    def fb19 : Bool
      @value.bits_set?(0x80000_u32)
    end

    # Filter bits
    def self.fb19 : Bool
      value.fb19
    end

    # Filter bits
    def self.fb19=(value : Bool) : Bool
      self.set(fb19: value)
      value
    end

    # Filter bits
    def fb20 : Bool
      @value.bits_set?(0x100000_u32)
    end

    # Filter bits
    def self.fb20 : Bool
      value.fb20
    end

    # Filter bits
    def self.fb20=(value : Bool) : Bool
      self.set(fb20: value)
      value
    end

    # Filter bits
    def fb21 : Bool
      @value.bits_set?(0x200000_u32)
    end

    # Filter bits
    def self.fb21 : Bool
      value.fb21
    end

    # Filter bits
    def self.fb21=(value : Bool) : Bool
      self.set(fb21: value)
      value
    end

    # Filter bits
    def fb22 : Bool
      @value.bits_set?(0x400000_u32)
    end

    # Filter bits
    def self.fb22 : Bool
      value.fb22
    end

    # Filter bits
    def self.fb22=(value : Bool) : Bool
      self.set(fb22: value)
      value
    end

    # Filter bits
    def fb23 : Bool
      @value.bits_set?(0x800000_u32)
    end

    # Filter bits
    def self.fb23 : Bool
      value.fb23
    end

    # Filter bits
    def self.fb23=(value : Bool) : Bool
      self.set(fb23: value)
      value
    end

    # Filter bits
    def fb24 : Bool
      @value.bits_set?(0x1000000_u32)
    end

    # Filter bits
    def self.fb24 : Bool
      value.fb24
    end

    # Filter bits
    def self.fb24=(value : Bool) : Bool
      self.set(fb24: value)
      value
    end

    # Filter bits
    def fb25 : Bool
      @value.bits_set?(0x2000000_u32)
    end

    # Filter bits
    def self.fb25 : Bool
      value.fb25
    end

    # Filter bits
    def self.fb25=(value : Bool) : Bool
      self.set(fb25: value)
      value
    end

    # Filter bits
    def fb26 : Bool
      @value.bits_set?(0x4000000_u32)
    end

    # Filter bits
    def self.fb26 : Bool
      value.fb26
    end

    # Filter bits
    def self.fb26=(value : Bool) : Bool
      self.set(fb26: value)
      value
    end

    # Filter bits
    def fb27 : Bool
      @value.bits_set?(0x8000000_u32)
    end

    # Filter bits
    def self.fb27 : Bool
      value.fb27
    end

    # Filter bits
    def self.fb27=(value : Bool) : Bool
      self.set(fb27: value)
      value
    end

    # Filter bits
    def fb28 : Bool
      @value.bits_set?(0x10000000_u32)
    end

    # Filter bits
    def self.fb28 : Bool
      value.fb28
    end

    # Filter bits
    def self.fb28=(value : Bool) : Bool
      self.set(fb28: value)
      value
    end

    # Filter bits
    def fb29 : Bool
      @value.bits_set?(0x20000000_u32)
    end

    # Filter bits
    def self.fb29 : Bool
      value.fb29
    end

    # Filter bits
    def self.fb29=(value : Bool) : Bool
      self.set(fb29: value)
      value
    end

    # Filter bits
    def fb30 : Bool
      @value.bits_set?(0x40000000_u32)
    end

    # Filter bits
    def self.fb30 : Bool
      value.fb30
    end

    # Filter bits
    def self.fb30=(value : Bool) : Bool
      self.set(fb30: value)
      value
    end

    # Filter bits
    def fb31 : Bool
      @value.bits_set?(0x80000000_u32)
    end

    # Filter bits
    def self.fb31 : Bool
      value.fb31
    end

    # Filter bits
    def self.fb31=(value : Bool) : Bool
      self.set(fb31: value)
      value
    end

    def copy_with(
      *,

      fb0 : Bool? = nil,

      fb1 : Bool? = nil,

      fb2 : Bool? = nil,

      fb3 : Bool? = nil,

      fb4 : Bool? = nil,

      fb5 : Bool? = nil,

      fb6 : Bool? = nil,

      fb7 : Bool? = nil,

      fb8 : Bool? = nil,

      fb9 : Bool? = nil,

      fb10 : Bool? = nil,

      fb11 : Bool? = nil,

      fb12 : Bool? = nil,

      fb13 : Bool? = nil,

      fb14 : Bool? = nil,

      fb15 : Bool? = nil,

      fb16 : Bool? = nil,

      fb17 : Bool? = nil,

      fb18 : Bool? = nil,

      fb19 : Bool? = nil,

      fb20 : Bool? = nil,

      fb21 : Bool? = nil,

      fb22 : Bool? = nil,

      fb23 : Bool? = nil,

      fb24 : Bool? = nil,

      fb25 : Bool? = nil,

      fb26 : Bool? = nil,

      fb27 : Bool? = nil,

      fb28 : Bool? = nil,

      fb29 : Bool? = nil,

      fb30 : Bool? = nil,

      fb31 : Bool? = nil
    ) : self
      value = @value

      unless fb0.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(fb0.to_int).&(0x1_u32) << 0
      end

      unless fb1.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(fb1.to_int).&(0x1_u32) << 1
      end

      unless fb2.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(fb2.to_int).&(0x1_u32) << 2
      end

      unless fb3.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(fb3.to_int).&(0x1_u32) << 3
      end

      unless fb4.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(fb4.to_int).&(0x1_u32) << 4
      end

      unless fb5.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(fb5.to_int).&(0x1_u32) << 5
      end

      unless fb6.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(fb6.to_int).&(0x1_u32) << 6
      end

      unless fb7.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(fb7.to_int).&(0x1_u32) << 7
      end

      unless fb8.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(fb8.to_int).&(0x1_u32) << 8
      end

      unless fb9.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(fb9.to_int).&(0x1_u32) << 9
      end

      unless fb10.nil?
        value = (value & 0xfffffbff_u32) |
                UInt32.new!(fb10.to_int).&(0x1_u32) << 10
      end

      unless fb11.nil?
        value = (value & 0xfffff7ff_u32) |
                UInt32.new!(fb11.to_int).&(0x1_u32) << 11
      end

      unless fb12.nil?
        value = (value & 0xffffefff_u32) |
                UInt32.new!(fb12.to_int).&(0x1_u32) << 12
      end

      unless fb13.nil?
        value = (value & 0xffffdfff_u32) |
                UInt32.new!(fb13.to_int).&(0x1_u32) << 13
      end

      unless fb14.nil?
        value = (value & 0xffffbfff_u32) |
                UInt32.new!(fb14.to_int).&(0x1_u32) << 14
      end

      unless fb15.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(fb15.to_int).&(0x1_u32) << 15
      end

      unless fb16.nil?
        value = (value & 0xfffeffff_u32) |
                UInt32.new!(fb16.to_int).&(0x1_u32) << 16
      end

      unless fb17.nil?
        value = (value & 0xfffdffff_u32) |
                UInt32.new!(fb17.to_int).&(0x1_u32) << 17
      end

      unless fb18.nil?
        value = (value & 0xfffbffff_u32) |
                UInt32.new!(fb18.to_int).&(0x1_u32) << 18
      end

      unless fb19.nil?
        value = (value & 0xfff7ffff_u32) |
                UInt32.new!(fb19.to_int).&(0x1_u32) << 19
      end

      unless fb20.nil?
        value = (value & 0xffefffff_u32) |
                UInt32.new!(fb20.to_int).&(0x1_u32) << 20
      end

      unless fb21.nil?
        value = (value & 0xffdfffff_u32) |
                UInt32.new!(fb21.to_int).&(0x1_u32) << 21
      end

      unless fb22.nil?
        value = (value & 0xffbfffff_u32) |
                UInt32.new!(fb22.to_int).&(0x1_u32) << 22
      end

      unless fb23.nil?
        value = (value & 0xff7fffff_u32) |
                UInt32.new!(fb23.to_int).&(0x1_u32) << 23
      end

      unless fb24.nil?
        value = (value & 0xfeffffff_u32) |
                UInt32.new!(fb24.to_int).&(0x1_u32) << 24
      end

      unless fb25.nil?
        value = (value & 0xfdffffff_u32) |
                UInt32.new!(fb25.to_int).&(0x1_u32) << 25
      end

      unless fb26.nil?
        value = (value & 0xfbffffff_u32) |
                UInt32.new!(fb26.to_int).&(0x1_u32) << 26
      end

      unless fb27.nil?
        value = (value & 0xf7ffffff_u32) |
                UInt32.new!(fb27.to_int).&(0x1_u32) << 27
      end

      unless fb28.nil?
        value = (value & 0xefffffff_u32) |
                UInt32.new!(fb28.to_int).&(0x1_u32) << 28
      end

      unless fb29.nil?
        value = (value & 0xdfffffff_u32) |
                UInt32.new!(fb29.to_int).&(0x1_u32) << 29
      end

      unless fb30.nil?
        value = (value & 0xbfffffff_u32) |
                UInt32.new!(fb30.to_int).&(0x1_u32) << 30
      end

      unless fb31.nil?
        value = (value & 0x7fffffff_u32) |
                UInt32.new!(fb31.to_int).&(0x1_u32) << 31
      end

      self.class.new(value)
    end

    def self.set(
      *,
      fb0 : Bool? = nil,
      fb1 : Bool? = nil,
      fb2 : Bool? = nil,
      fb3 : Bool? = nil,
      fb4 : Bool? = nil,
      fb5 : Bool? = nil,
      fb6 : Bool? = nil,
      fb7 : Bool? = nil,
      fb8 : Bool? = nil,
      fb9 : Bool? = nil,
      fb10 : Bool? = nil,
      fb11 : Bool? = nil,
      fb12 : Bool? = nil,
      fb13 : Bool? = nil,
      fb14 : Bool? = nil,
      fb15 : Bool? = nil,
      fb16 : Bool? = nil,
      fb17 : Bool? = nil,
      fb18 : Bool? = nil,
      fb19 : Bool? = nil,
      fb20 : Bool? = nil,
      fb21 : Bool? = nil,
      fb22 : Bool? = nil,
      fb23 : Bool? = nil,
      fb24 : Bool? = nil,
      fb25 : Bool? = nil,
      fb26 : Bool? = nil,
      fb27 : Bool? = nil,
      fb28 : Bool? = nil,
      fb29 : Bool? = nil,
      fb30 : Bool? = nil,
      fb31 : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        fb0: fb0,
        fb1: fb1,
        fb2: fb2,
        fb3: fb3,
        fb4: fb4,
        fb5: fb5,
        fb6: fb6,
        fb7: fb7,
        fb8: fb8,
        fb9: fb9,
        fb10: fb10,
        fb11: fb11,
        fb12: fb12,
        fb13: fb13,
        fb14: fb14,
        fb15: fb15,
        fb16: fb16,
        fb17: fb17,
        fb18: fb18,
        fb19: fb19,
        fb20: fb20,
        fb21: fb21,
        fb22: fb22,
        fb23: fb23,
        fb24: fb24,
        fb25: fb25,
        fb26: fb26,
        fb27: fb27,
        fb28: fb28,
        fb29: fb29,
        fb30: fb30,
        fb31: fb31,
      )
    end
  end # struct

  # Filter bank 17 register 1
  struct F17R1
    ADDRESS = BASE_ADDRESS + 0x2c8_u64

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

    # Filter bits
    def fb0 : Bool
      @value.bits_set?(0x1_u32)
    end

    # Filter bits
    def self.fb0 : Bool
      value.fb0
    end

    # Filter bits
    def self.fb0=(value : Bool) : Bool
      self.set(fb0: value)
      value
    end

    # Filter bits
    def fb1 : Bool
      @value.bits_set?(0x2_u32)
    end

    # Filter bits
    def self.fb1 : Bool
      value.fb1
    end

    # Filter bits
    def self.fb1=(value : Bool) : Bool
      self.set(fb1: value)
      value
    end

    # Filter bits
    def fb2 : Bool
      @value.bits_set?(0x4_u32)
    end

    # Filter bits
    def self.fb2 : Bool
      value.fb2
    end

    # Filter bits
    def self.fb2=(value : Bool) : Bool
      self.set(fb2: value)
      value
    end

    # Filter bits
    def fb3 : Bool
      @value.bits_set?(0x8_u32)
    end

    # Filter bits
    def self.fb3 : Bool
      value.fb3
    end

    # Filter bits
    def self.fb3=(value : Bool) : Bool
      self.set(fb3: value)
      value
    end

    # Filter bits
    def fb4 : Bool
      @value.bits_set?(0x10_u32)
    end

    # Filter bits
    def self.fb4 : Bool
      value.fb4
    end

    # Filter bits
    def self.fb4=(value : Bool) : Bool
      self.set(fb4: value)
      value
    end

    # Filter bits
    def fb5 : Bool
      @value.bits_set?(0x20_u32)
    end

    # Filter bits
    def self.fb5 : Bool
      value.fb5
    end

    # Filter bits
    def self.fb5=(value : Bool) : Bool
      self.set(fb5: value)
      value
    end

    # Filter bits
    def fb6 : Bool
      @value.bits_set?(0x40_u32)
    end

    # Filter bits
    def self.fb6 : Bool
      value.fb6
    end

    # Filter bits
    def self.fb6=(value : Bool) : Bool
      self.set(fb6: value)
      value
    end

    # Filter bits
    def fb7 : Bool
      @value.bits_set?(0x80_u32)
    end

    # Filter bits
    def self.fb7 : Bool
      value.fb7
    end

    # Filter bits
    def self.fb7=(value : Bool) : Bool
      self.set(fb7: value)
      value
    end

    # Filter bits
    def fb8 : Bool
      @value.bits_set?(0x100_u32)
    end

    # Filter bits
    def self.fb8 : Bool
      value.fb8
    end

    # Filter bits
    def self.fb8=(value : Bool) : Bool
      self.set(fb8: value)
      value
    end

    # Filter bits
    def fb9 : Bool
      @value.bits_set?(0x200_u32)
    end

    # Filter bits
    def self.fb9 : Bool
      value.fb9
    end

    # Filter bits
    def self.fb9=(value : Bool) : Bool
      self.set(fb9: value)
      value
    end

    # Filter bits
    def fb10 : Bool
      @value.bits_set?(0x400_u32)
    end

    # Filter bits
    def self.fb10 : Bool
      value.fb10
    end

    # Filter bits
    def self.fb10=(value : Bool) : Bool
      self.set(fb10: value)
      value
    end

    # Filter bits
    def fb11 : Bool
      @value.bits_set?(0x800_u32)
    end

    # Filter bits
    def self.fb11 : Bool
      value.fb11
    end

    # Filter bits
    def self.fb11=(value : Bool) : Bool
      self.set(fb11: value)
      value
    end

    # Filter bits
    def fb12 : Bool
      @value.bits_set?(0x1000_u32)
    end

    # Filter bits
    def self.fb12 : Bool
      value.fb12
    end

    # Filter bits
    def self.fb12=(value : Bool) : Bool
      self.set(fb12: value)
      value
    end

    # Filter bits
    def fb13 : Bool
      @value.bits_set?(0x2000_u32)
    end

    # Filter bits
    def self.fb13 : Bool
      value.fb13
    end

    # Filter bits
    def self.fb13=(value : Bool) : Bool
      self.set(fb13: value)
      value
    end

    # Filter bits
    def fb14 : Bool
      @value.bits_set?(0x4000_u32)
    end

    # Filter bits
    def self.fb14 : Bool
      value.fb14
    end

    # Filter bits
    def self.fb14=(value : Bool) : Bool
      self.set(fb14: value)
      value
    end

    # Filter bits
    def fb15 : Bool
      @value.bits_set?(0x8000_u32)
    end

    # Filter bits
    def self.fb15 : Bool
      value.fb15
    end

    # Filter bits
    def self.fb15=(value : Bool) : Bool
      self.set(fb15: value)
      value
    end

    # Filter bits
    def fb16 : Bool
      @value.bits_set?(0x10000_u32)
    end

    # Filter bits
    def self.fb16 : Bool
      value.fb16
    end

    # Filter bits
    def self.fb16=(value : Bool) : Bool
      self.set(fb16: value)
      value
    end

    # Filter bits
    def fb17 : Bool
      @value.bits_set?(0x20000_u32)
    end

    # Filter bits
    def self.fb17 : Bool
      value.fb17
    end

    # Filter bits
    def self.fb17=(value : Bool) : Bool
      self.set(fb17: value)
      value
    end

    # Filter bits
    def fb18 : Bool
      @value.bits_set?(0x40000_u32)
    end

    # Filter bits
    def self.fb18 : Bool
      value.fb18
    end

    # Filter bits
    def self.fb18=(value : Bool) : Bool
      self.set(fb18: value)
      value
    end

    # Filter bits
    def fb19 : Bool
      @value.bits_set?(0x80000_u32)
    end

    # Filter bits
    def self.fb19 : Bool
      value.fb19
    end

    # Filter bits
    def self.fb19=(value : Bool) : Bool
      self.set(fb19: value)
      value
    end

    # Filter bits
    def fb20 : Bool
      @value.bits_set?(0x100000_u32)
    end

    # Filter bits
    def self.fb20 : Bool
      value.fb20
    end

    # Filter bits
    def self.fb20=(value : Bool) : Bool
      self.set(fb20: value)
      value
    end

    # Filter bits
    def fb21 : Bool
      @value.bits_set?(0x200000_u32)
    end

    # Filter bits
    def self.fb21 : Bool
      value.fb21
    end

    # Filter bits
    def self.fb21=(value : Bool) : Bool
      self.set(fb21: value)
      value
    end

    # Filter bits
    def fb22 : Bool
      @value.bits_set?(0x400000_u32)
    end

    # Filter bits
    def self.fb22 : Bool
      value.fb22
    end

    # Filter bits
    def self.fb22=(value : Bool) : Bool
      self.set(fb22: value)
      value
    end

    # Filter bits
    def fb23 : Bool
      @value.bits_set?(0x800000_u32)
    end

    # Filter bits
    def self.fb23 : Bool
      value.fb23
    end

    # Filter bits
    def self.fb23=(value : Bool) : Bool
      self.set(fb23: value)
      value
    end

    # Filter bits
    def fb24 : Bool
      @value.bits_set?(0x1000000_u32)
    end

    # Filter bits
    def self.fb24 : Bool
      value.fb24
    end

    # Filter bits
    def self.fb24=(value : Bool) : Bool
      self.set(fb24: value)
      value
    end

    # Filter bits
    def fb25 : Bool
      @value.bits_set?(0x2000000_u32)
    end

    # Filter bits
    def self.fb25 : Bool
      value.fb25
    end

    # Filter bits
    def self.fb25=(value : Bool) : Bool
      self.set(fb25: value)
      value
    end

    # Filter bits
    def fb26 : Bool
      @value.bits_set?(0x4000000_u32)
    end

    # Filter bits
    def self.fb26 : Bool
      value.fb26
    end

    # Filter bits
    def self.fb26=(value : Bool) : Bool
      self.set(fb26: value)
      value
    end

    # Filter bits
    def fb27 : Bool
      @value.bits_set?(0x8000000_u32)
    end

    # Filter bits
    def self.fb27 : Bool
      value.fb27
    end

    # Filter bits
    def self.fb27=(value : Bool) : Bool
      self.set(fb27: value)
      value
    end

    # Filter bits
    def fb28 : Bool
      @value.bits_set?(0x10000000_u32)
    end

    # Filter bits
    def self.fb28 : Bool
      value.fb28
    end

    # Filter bits
    def self.fb28=(value : Bool) : Bool
      self.set(fb28: value)
      value
    end

    # Filter bits
    def fb29 : Bool
      @value.bits_set?(0x20000000_u32)
    end

    # Filter bits
    def self.fb29 : Bool
      value.fb29
    end

    # Filter bits
    def self.fb29=(value : Bool) : Bool
      self.set(fb29: value)
      value
    end

    # Filter bits
    def fb30 : Bool
      @value.bits_set?(0x40000000_u32)
    end

    # Filter bits
    def self.fb30 : Bool
      value.fb30
    end

    # Filter bits
    def self.fb30=(value : Bool) : Bool
      self.set(fb30: value)
      value
    end

    # Filter bits
    def fb31 : Bool
      @value.bits_set?(0x80000000_u32)
    end

    # Filter bits
    def self.fb31 : Bool
      value.fb31
    end

    # Filter bits
    def self.fb31=(value : Bool) : Bool
      self.set(fb31: value)
      value
    end

    def copy_with(
      *,

      fb0 : Bool? = nil,

      fb1 : Bool? = nil,

      fb2 : Bool? = nil,

      fb3 : Bool? = nil,

      fb4 : Bool? = nil,

      fb5 : Bool? = nil,

      fb6 : Bool? = nil,

      fb7 : Bool? = nil,

      fb8 : Bool? = nil,

      fb9 : Bool? = nil,

      fb10 : Bool? = nil,

      fb11 : Bool? = nil,

      fb12 : Bool? = nil,

      fb13 : Bool? = nil,

      fb14 : Bool? = nil,

      fb15 : Bool? = nil,

      fb16 : Bool? = nil,

      fb17 : Bool? = nil,

      fb18 : Bool? = nil,

      fb19 : Bool? = nil,

      fb20 : Bool? = nil,

      fb21 : Bool? = nil,

      fb22 : Bool? = nil,

      fb23 : Bool? = nil,

      fb24 : Bool? = nil,

      fb25 : Bool? = nil,

      fb26 : Bool? = nil,

      fb27 : Bool? = nil,

      fb28 : Bool? = nil,

      fb29 : Bool? = nil,

      fb30 : Bool? = nil,

      fb31 : Bool? = nil
    ) : self
      value = @value

      unless fb0.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(fb0.to_int).&(0x1_u32) << 0
      end

      unless fb1.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(fb1.to_int).&(0x1_u32) << 1
      end

      unless fb2.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(fb2.to_int).&(0x1_u32) << 2
      end

      unless fb3.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(fb3.to_int).&(0x1_u32) << 3
      end

      unless fb4.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(fb4.to_int).&(0x1_u32) << 4
      end

      unless fb5.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(fb5.to_int).&(0x1_u32) << 5
      end

      unless fb6.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(fb6.to_int).&(0x1_u32) << 6
      end

      unless fb7.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(fb7.to_int).&(0x1_u32) << 7
      end

      unless fb8.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(fb8.to_int).&(0x1_u32) << 8
      end

      unless fb9.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(fb9.to_int).&(0x1_u32) << 9
      end

      unless fb10.nil?
        value = (value & 0xfffffbff_u32) |
                UInt32.new!(fb10.to_int).&(0x1_u32) << 10
      end

      unless fb11.nil?
        value = (value & 0xfffff7ff_u32) |
                UInt32.new!(fb11.to_int).&(0x1_u32) << 11
      end

      unless fb12.nil?
        value = (value & 0xffffefff_u32) |
                UInt32.new!(fb12.to_int).&(0x1_u32) << 12
      end

      unless fb13.nil?
        value = (value & 0xffffdfff_u32) |
                UInt32.new!(fb13.to_int).&(0x1_u32) << 13
      end

      unless fb14.nil?
        value = (value & 0xffffbfff_u32) |
                UInt32.new!(fb14.to_int).&(0x1_u32) << 14
      end

      unless fb15.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(fb15.to_int).&(0x1_u32) << 15
      end

      unless fb16.nil?
        value = (value & 0xfffeffff_u32) |
                UInt32.new!(fb16.to_int).&(0x1_u32) << 16
      end

      unless fb17.nil?
        value = (value & 0xfffdffff_u32) |
                UInt32.new!(fb17.to_int).&(0x1_u32) << 17
      end

      unless fb18.nil?
        value = (value & 0xfffbffff_u32) |
                UInt32.new!(fb18.to_int).&(0x1_u32) << 18
      end

      unless fb19.nil?
        value = (value & 0xfff7ffff_u32) |
                UInt32.new!(fb19.to_int).&(0x1_u32) << 19
      end

      unless fb20.nil?
        value = (value & 0xffefffff_u32) |
                UInt32.new!(fb20.to_int).&(0x1_u32) << 20
      end

      unless fb21.nil?
        value = (value & 0xffdfffff_u32) |
                UInt32.new!(fb21.to_int).&(0x1_u32) << 21
      end

      unless fb22.nil?
        value = (value & 0xffbfffff_u32) |
                UInt32.new!(fb22.to_int).&(0x1_u32) << 22
      end

      unless fb23.nil?
        value = (value & 0xff7fffff_u32) |
                UInt32.new!(fb23.to_int).&(0x1_u32) << 23
      end

      unless fb24.nil?
        value = (value & 0xfeffffff_u32) |
                UInt32.new!(fb24.to_int).&(0x1_u32) << 24
      end

      unless fb25.nil?
        value = (value & 0xfdffffff_u32) |
                UInt32.new!(fb25.to_int).&(0x1_u32) << 25
      end

      unless fb26.nil?
        value = (value & 0xfbffffff_u32) |
                UInt32.new!(fb26.to_int).&(0x1_u32) << 26
      end

      unless fb27.nil?
        value = (value & 0xf7ffffff_u32) |
                UInt32.new!(fb27.to_int).&(0x1_u32) << 27
      end

      unless fb28.nil?
        value = (value & 0xefffffff_u32) |
                UInt32.new!(fb28.to_int).&(0x1_u32) << 28
      end

      unless fb29.nil?
        value = (value & 0xdfffffff_u32) |
                UInt32.new!(fb29.to_int).&(0x1_u32) << 29
      end

      unless fb30.nil?
        value = (value & 0xbfffffff_u32) |
                UInt32.new!(fb30.to_int).&(0x1_u32) << 30
      end

      unless fb31.nil?
        value = (value & 0x7fffffff_u32) |
                UInt32.new!(fb31.to_int).&(0x1_u32) << 31
      end

      self.class.new(value)
    end

    def self.set(
      *,
      fb0 : Bool? = nil,
      fb1 : Bool? = nil,
      fb2 : Bool? = nil,
      fb3 : Bool? = nil,
      fb4 : Bool? = nil,
      fb5 : Bool? = nil,
      fb6 : Bool? = nil,
      fb7 : Bool? = nil,
      fb8 : Bool? = nil,
      fb9 : Bool? = nil,
      fb10 : Bool? = nil,
      fb11 : Bool? = nil,
      fb12 : Bool? = nil,
      fb13 : Bool? = nil,
      fb14 : Bool? = nil,
      fb15 : Bool? = nil,
      fb16 : Bool? = nil,
      fb17 : Bool? = nil,
      fb18 : Bool? = nil,
      fb19 : Bool? = nil,
      fb20 : Bool? = nil,
      fb21 : Bool? = nil,
      fb22 : Bool? = nil,
      fb23 : Bool? = nil,
      fb24 : Bool? = nil,
      fb25 : Bool? = nil,
      fb26 : Bool? = nil,
      fb27 : Bool? = nil,
      fb28 : Bool? = nil,
      fb29 : Bool? = nil,
      fb30 : Bool? = nil,
      fb31 : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        fb0: fb0,
        fb1: fb1,
        fb2: fb2,
        fb3: fb3,
        fb4: fb4,
        fb5: fb5,
        fb6: fb6,
        fb7: fb7,
        fb8: fb8,
        fb9: fb9,
        fb10: fb10,
        fb11: fb11,
        fb12: fb12,
        fb13: fb13,
        fb14: fb14,
        fb15: fb15,
        fb16: fb16,
        fb17: fb17,
        fb18: fb18,
        fb19: fb19,
        fb20: fb20,
        fb21: fb21,
        fb22: fb22,
        fb23: fb23,
        fb24: fb24,
        fb25: fb25,
        fb26: fb26,
        fb27: fb27,
        fb28: fb28,
        fb29: fb29,
        fb30: fb30,
        fb31: fb31,
      )
    end
  end # struct

  # Filter bank 17 register 2
  struct F17R2
    ADDRESS = BASE_ADDRESS + 0x2cc_u64

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

    # Filter bits
    def fb0 : Bool
      @value.bits_set?(0x1_u32)
    end

    # Filter bits
    def self.fb0 : Bool
      value.fb0
    end

    # Filter bits
    def self.fb0=(value : Bool) : Bool
      self.set(fb0: value)
      value
    end

    # Filter bits
    def fb1 : Bool
      @value.bits_set?(0x2_u32)
    end

    # Filter bits
    def self.fb1 : Bool
      value.fb1
    end

    # Filter bits
    def self.fb1=(value : Bool) : Bool
      self.set(fb1: value)
      value
    end

    # Filter bits
    def fb2 : Bool
      @value.bits_set?(0x4_u32)
    end

    # Filter bits
    def self.fb2 : Bool
      value.fb2
    end

    # Filter bits
    def self.fb2=(value : Bool) : Bool
      self.set(fb2: value)
      value
    end

    # Filter bits
    def fb3 : Bool
      @value.bits_set?(0x8_u32)
    end

    # Filter bits
    def self.fb3 : Bool
      value.fb3
    end

    # Filter bits
    def self.fb3=(value : Bool) : Bool
      self.set(fb3: value)
      value
    end

    # Filter bits
    def fb4 : Bool
      @value.bits_set?(0x10_u32)
    end

    # Filter bits
    def self.fb4 : Bool
      value.fb4
    end

    # Filter bits
    def self.fb4=(value : Bool) : Bool
      self.set(fb4: value)
      value
    end

    # Filter bits
    def fb5 : Bool
      @value.bits_set?(0x20_u32)
    end

    # Filter bits
    def self.fb5 : Bool
      value.fb5
    end

    # Filter bits
    def self.fb5=(value : Bool) : Bool
      self.set(fb5: value)
      value
    end

    # Filter bits
    def fb6 : Bool
      @value.bits_set?(0x40_u32)
    end

    # Filter bits
    def self.fb6 : Bool
      value.fb6
    end

    # Filter bits
    def self.fb6=(value : Bool) : Bool
      self.set(fb6: value)
      value
    end

    # Filter bits
    def fb7 : Bool
      @value.bits_set?(0x80_u32)
    end

    # Filter bits
    def self.fb7 : Bool
      value.fb7
    end

    # Filter bits
    def self.fb7=(value : Bool) : Bool
      self.set(fb7: value)
      value
    end

    # Filter bits
    def fb8 : Bool
      @value.bits_set?(0x100_u32)
    end

    # Filter bits
    def self.fb8 : Bool
      value.fb8
    end

    # Filter bits
    def self.fb8=(value : Bool) : Bool
      self.set(fb8: value)
      value
    end

    # Filter bits
    def fb9 : Bool
      @value.bits_set?(0x200_u32)
    end

    # Filter bits
    def self.fb9 : Bool
      value.fb9
    end

    # Filter bits
    def self.fb9=(value : Bool) : Bool
      self.set(fb9: value)
      value
    end

    # Filter bits
    def fb10 : Bool
      @value.bits_set?(0x400_u32)
    end

    # Filter bits
    def self.fb10 : Bool
      value.fb10
    end

    # Filter bits
    def self.fb10=(value : Bool) : Bool
      self.set(fb10: value)
      value
    end

    # Filter bits
    def fb11 : Bool
      @value.bits_set?(0x800_u32)
    end

    # Filter bits
    def self.fb11 : Bool
      value.fb11
    end

    # Filter bits
    def self.fb11=(value : Bool) : Bool
      self.set(fb11: value)
      value
    end

    # Filter bits
    def fb12 : Bool
      @value.bits_set?(0x1000_u32)
    end

    # Filter bits
    def self.fb12 : Bool
      value.fb12
    end

    # Filter bits
    def self.fb12=(value : Bool) : Bool
      self.set(fb12: value)
      value
    end

    # Filter bits
    def fb13 : Bool
      @value.bits_set?(0x2000_u32)
    end

    # Filter bits
    def self.fb13 : Bool
      value.fb13
    end

    # Filter bits
    def self.fb13=(value : Bool) : Bool
      self.set(fb13: value)
      value
    end

    # Filter bits
    def fb14 : Bool
      @value.bits_set?(0x4000_u32)
    end

    # Filter bits
    def self.fb14 : Bool
      value.fb14
    end

    # Filter bits
    def self.fb14=(value : Bool) : Bool
      self.set(fb14: value)
      value
    end

    # Filter bits
    def fb15 : Bool
      @value.bits_set?(0x8000_u32)
    end

    # Filter bits
    def self.fb15 : Bool
      value.fb15
    end

    # Filter bits
    def self.fb15=(value : Bool) : Bool
      self.set(fb15: value)
      value
    end

    # Filter bits
    def fb16 : Bool
      @value.bits_set?(0x10000_u32)
    end

    # Filter bits
    def self.fb16 : Bool
      value.fb16
    end

    # Filter bits
    def self.fb16=(value : Bool) : Bool
      self.set(fb16: value)
      value
    end

    # Filter bits
    def fb17 : Bool
      @value.bits_set?(0x20000_u32)
    end

    # Filter bits
    def self.fb17 : Bool
      value.fb17
    end

    # Filter bits
    def self.fb17=(value : Bool) : Bool
      self.set(fb17: value)
      value
    end

    # Filter bits
    def fb18 : Bool
      @value.bits_set?(0x40000_u32)
    end

    # Filter bits
    def self.fb18 : Bool
      value.fb18
    end

    # Filter bits
    def self.fb18=(value : Bool) : Bool
      self.set(fb18: value)
      value
    end

    # Filter bits
    def fb19 : Bool
      @value.bits_set?(0x80000_u32)
    end

    # Filter bits
    def self.fb19 : Bool
      value.fb19
    end

    # Filter bits
    def self.fb19=(value : Bool) : Bool
      self.set(fb19: value)
      value
    end

    # Filter bits
    def fb20 : Bool
      @value.bits_set?(0x100000_u32)
    end

    # Filter bits
    def self.fb20 : Bool
      value.fb20
    end

    # Filter bits
    def self.fb20=(value : Bool) : Bool
      self.set(fb20: value)
      value
    end

    # Filter bits
    def fb21 : Bool
      @value.bits_set?(0x200000_u32)
    end

    # Filter bits
    def self.fb21 : Bool
      value.fb21
    end

    # Filter bits
    def self.fb21=(value : Bool) : Bool
      self.set(fb21: value)
      value
    end

    # Filter bits
    def fb22 : Bool
      @value.bits_set?(0x400000_u32)
    end

    # Filter bits
    def self.fb22 : Bool
      value.fb22
    end

    # Filter bits
    def self.fb22=(value : Bool) : Bool
      self.set(fb22: value)
      value
    end

    # Filter bits
    def fb23 : Bool
      @value.bits_set?(0x800000_u32)
    end

    # Filter bits
    def self.fb23 : Bool
      value.fb23
    end

    # Filter bits
    def self.fb23=(value : Bool) : Bool
      self.set(fb23: value)
      value
    end

    # Filter bits
    def fb24 : Bool
      @value.bits_set?(0x1000000_u32)
    end

    # Filter bits
    def self.fb24 : Bool
      value.fb24
    end

    # Filter bits
    def self.fb24=(value : Bool) : Bool
      self.set(fb24: value)
      value
    end

    # Filter bits
    def fb25 : Bool
      @value.bits_set?(0x2000000_u32)
    end

    # Filter bits
    def self.fb25 : Bool
      value.fb25
    end

    # Filter bits
    def self.fb25=(value : Bool) : Bool
      self.set(fb25: value)
      value
    end

    # Filter bits
    def fb26 : Bool
      @value.bits_set?(0x4000000_u32)
    end

    # Filter bits
    def self.fb26 : Bool
      value.fb26
    end

    # Filter bits
    def self.fb26=(value : Bool) : Bool
      self.set(fb26: value)
      value
    end

    # Filter bits
    def fb27 : Bool
      @value.bits_set?(0x8000000_u32)
    end

    # Filter bits
    def self.fb27 : Bool
      value.fb27
    end

    # Filter bits
    def self.fb27=(value : Bool) : Bool
      self.set(fb27: value)
      value
    end

    # Filter bits
    def fb28 : Bool
      @value.bits_set?(0x10000000_u32)
    end

    # Filter bits
    def self.fb28 : Bool
      value.fb28
    end

    # Filter bits
    def self.fb28=(value : Bool) : Bool
      self.set(fb28: value)
      value
    end

    # Filter bits
    def fb29 : Bool
      @value.bits_set?(0x20000000_u32)
    end

    # Filter bits
    def self.fb29 : Bool
      value.fb29
    end

    # Filter bits
    def self.fb29=(value : Bool) : Bool
      self.set(fb29: value)
      value
    end

    # Filter bits
    def fb30 : Bool
      @value.bits_set?(0x40000000_u32)
    end

    # Filter bits
    def self.fb30 : Bool
      value.fb30
    end

    # Filter bits
    def self.fb30=(value : Bool) : Bool
      self.set(fb30: value)
      value
    end

    # Filter bits
    def fb31 : Bool
      @value.bits_set?(0x80000000_u32)
    end

    # Filter bits
    def self.fb31 : Bool
      value.fb31
    end

    # Filter bits
    def self.fb31=(value : Bool) : Bool
      self.set(fb31: value)
      value
    end

    def copy_with(
      *,

      fb0 : Bool? = nil,

      fb1 : Bool? = nil,

      fb2 : Bool? = nil,

      fb3 : Bool? = nil,

      fb4 : Bool? = nil,

      fb5 : Bool? = nil,

      fb6 : Bool? = nil,

      fb7 : Bool? = nil,

      fb8 : Bool? = nil,

      fb9 : Bool? = nil,

      fb10 : Bool? = nil,

      fb11 : Bool? = nil,

      fb12 : Bool? = nil,

      fb13 : Bool? = nil,

      fb14 : Bool? = nil,

      fb15 : Bool? = nil,

      fb16 : Bool? = nil,

      fb17 : Bool? = nil,

      fb18 : Bool? = nil,

      fb19 : Bool? = nil,

      fb20 : Bool? = nil,

      fb21 : Bool? = nil,

      fb22 : Bool? = nil,

      fb23 : Bool? = nil,

      fb24 : Bool? = nil,

      fb25 : Bool? = nil,

      fb26 : Bool? = nil,

      fb27 : Bool? = nil,

      fb28 : Bool? = nil,

      fb29 : Bool? = nil,

      fb30 : Bool? = nil,

      fb31 : Bool? = nil
    ) : self
      value = @value

      unless fb0.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(fb0.to_int).&(0x1_u32) << 0
      end

      unless fb1.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(fb1.to_int).&(0x1_u32) << 1
      end

      unless fb2.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(fb2.to_int).&(0x1_u32) << 2
      end

      unless fb3.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(fb3.to_int).&(0x1_u32) << 3
      end

      unless fb4.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(fb4.to_int).&(0x1_u32) << 4
      end

      unless fb5.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(fb5.to_int).&(0x1_u32) << 5
      end

      unless fb6.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(fb6.to_int).&(0x1_u32) << 6
      end

      unless fb7.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(fb7.to_int).&(0x1_u32) << 7
      end

      unless fb8.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(fb8.to_int).&(0x1_u32) << 8
      end

      unless fb9.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(fb9.to_int).&(0x1_u32) << 9
      end

      unless fb10.nil?
        value = (value & 0xfffffbff_u32) |
                UInt32.new!(fb10.to_int).&(0x1_u32) << 10
      end

      unless fb11.nil?
        value = (value & 0xfffff7ff_u32) |
                UInt32.new!(fb11.to_int).&(0x1_u32) << 11
      end

      unless fb12.nil?
        value = (value & 0xffffefff_u32) |
                UInt32.new!(fb12.to_int).&(0x1_u32) << 12
      end

      unless fb13.nil?
        value = (value & 0xffffdfff_u32) |
                UInt32.new!(fb13.to_int).&(0x1_u32) << 13
      end

      unless fb14.nil?
        value = (value & 0xffffbfff_u32) |
                UInt32.new!(fb14.to_int).&(0x1_u32) << 14
      end

      unless fb15.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(fb15.to_int).&(0x1_u32) << 15
      end

      unless fb16.nil?
        value = (value & 0xfffeffff_u32) |
                UInt32.new!(fb16.to_int).&(0x1_u32) << 16
      end

      unless fb17.nil?
        value = (value & 0xfffdffff_u32) |
                UInt32.new!(fb17.to_int).&(0x1_u32) << 17
      end

      unless fb18.nil?
        value = (value & 0xfffbffff_u32) |
                UInt32.new!(fb18.to_int).&(0x1_u32) << 18
      end

      unless fb19.nil?
        value = (value & 0xfff7ffff_u32) |
                UInt32.new!(fb19.to_int).&(0x1_u32) << 19
      end

      unless fb20.nil?
        value = (value & 0xffefffff_u32) |
                UInt32.new!(fb20.to_int).&(0x1_u32) << 20
      end

      unless fb21.nil?
        value = (value & 0xffdfffff_u32) |
                UInt32.new!(fb21.to_int).&(0x1_u32) << 21
      end

      unless fb22.nil?
        value = (value & 0xffbfffff_u32) |
                UInt32.new!(fb22.to_int).&(0x1_u32) << 22
      end

      unless fb23.nil?
        value = (value & 0xff7fffff_u32) |
                UInt32.new!(fb23.to_int).&(0x1_u32) << 23
      end

      unless fb24.nil?
        value = (value & 0xfeffffff_u32) |
                UInt32.new!(fb24.to_int).&(0x1_u32) << 24
      end

      unless fb25.nil?
        value = (value & 0xfdffffff_u32) |
                UInt32.new!(fb25.to_int).&(0x1_u32) << 25
      end

      unless fb26.nil?
        value = (value & 0xfbffffff_u32) |
                UInt32.new!(fb26.to_int).&(0x1_u32) << 26
      end

      unless fb27.nil?
        value = (value & 0xf7ffffff_u32) |
                UInt32.new!(fb27.to_int).&(0x1_u32) << 27
      end

      unless fb28.nil?
        value = (value & 0xefffffff_u32) |
                UInt32.new!(fb28.to_int).&(0x1_u32) << 28
      end

      unless fb29.nil?
        value = (value & 0xdfffffff_u32) |
                UInt32.new!(fb29.to_int).&(0x1_u32) << 29
      end

      unless fb30.nil?
        value = (value & 0xbfffffff_u32) |
                UInt32.new!(fb30.to_int).&(0x1_u32) << 30
      end

      unless fb31.nil?
        value = (value & 0x7fffffff_u32) |
                UInt32.new!(fb31.to_int).&(0x1_u32) << 31
      end

      self.class.new(value)
    end

    def self.set(
      *,
      fb0 : Bool? = nil,
      fb1 : Bool? = nil,
      fb2 : Bool? = nil,
      fb3 : Bool? = nil,
      fb4 : Bool? = nil,
      fb5 : Bool? = nil,
      fb6 : Bool? = nil,
      fb7 : Bool? = nil,
      fb8 : Bool? = nil,
      fb9 : Bool? = nil,
      fb10 : Bool? = nil,
      fb11 : Bool? = nil,
      fb12 : Bool? = nil,
      fb13 : Bool? = nil,
      fb14 : Bool? = nil,
      fb15 : Bool? = nil,
      fb16 : Bool? = nil,
      fb17 : Bool? = nil,
      fb18 : Bool? = nil,
      fb19 : Bool? = nil,
      fb20 : Bool? = nil,
      fb21 : Bool? = nil,
      fb22 : Bool? = nil,
      fb23 : Bool? = nil,
      fb24 : Bool? = nil,
      fb25 : Bool? = nil,
      fb26 : Bool? = nil,
      fb27 : Bool? = nil,
      fb28 : Bool? = nil,
      fb29 : Bool? = nil,
      fb30 : Bool? = nil,
      fb31 : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        fb0: fb0,
        fb1: fb1,
        fb2: fb2,
        fb3: fb3,
        fb4: fb4,
        fb5: fb5,
        fb6: fb6,
        fb7: fb7,
        fb8: fb8,
        fb9: fb9,
        fb10: fb10,
        fb11: fb11,
        fb12: fb12,
        fb13: fb13,
        fb14: fb14,
        fb15: fb15,
        fb16: fb16,
        fb17: fb17,
        fb18: fb18,
        fb19: fb19,
        fb20: fb20,
        fb21: fb21,
        fb22: fb22,
        fb23: fb23,
        fb24: fb24,
        fb25: fb25,
        fb26: fb26,
        fb27: fb27,
        fb28: fb28,
        fb29: fb29,
        fb30: fb30,
        fb31: fb31,
      )
    end
  end # struct

  # Filter bank 18 register 1
  struct F18R1
    ADDRESS = BASE_ADDRESS + 0x2d0_u64

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

    # Filter bits
    def fb0 : Bool
      @value.bits_set?(0x1_u32)
    end

    # Filter bits
    def self.fb0 : Bool
      value.fb0
    end

    # Filter bits
    def self.fb0=(value : Bool) : Bool
      self.set(fb0: value)
      value
    end

    # Filter bits
    def fb1 : Bool
      @value.bits_set?(0x2_u32)
    end

    # Filter bits
    def self.fb1 : Bool
      value.fb1
    end

    # Filter bits
    def self.fb1=(value : Bool) : Bool
      self.set(fb1: value)
      value
    end

    # Filter bits
    def fb2 : Bool
      @value.bits_set?(0x4_u32)
    end

    # Filter bits
    def self.fb2 : Bool
      value.fb2
    end

    # Filter bits
    def self.fb2=(value : Bool) : Bool
      self.set(fb2: value)
      value
    end

    # Filter bits
    def fb3 : Bool
      @value.bits_set?(0x8_u32)
    end

    # Filter bits
    def self.fb3 : Bool
      value.fb3
    end

    # Filter bits
    def self.fb3=(value : Bool) : Bool
      self.set(fb3: value)
      value
    end

    # Filter bits
    def fb4 : Bool
      @value.bits_set?(0x10_u32)
    end

    # Filter bits
    def self.fb4 : Bool
      value.fb4
    end

    # Filter bits
    def self.fb4=(value : Bool) : Bool
      self.set(fb4: value)
      value
    end

    # Filter bits
    def fb5 : Bool
      @value.bits_set?(0x20_u32)
    end

    # Filter bits
    def self.fb5 : Bool
      value.fb5
    end

    # Filter bits
    def self.fb5=(value : Bool) : Bool
      self.set(fb5: value)
      value
    end

    # Filter bits
    def fb6 : Bool
      @value.bits_set?(0x40_u32)
    end

    # Filter bits
    def self.fb6 : Bool
      value.fb6
    end

    # Filter bits
    def self.fb6=(value : Bool) : Bool
      self.set(fb6: value)
      value
    end

    # Filter bits
    def fb7 : Bool
      @value.bits_set?(0x80_u32)
    end

    # Filter bits
    def self.fb7 : Bool
      value.fb7
    end

    # Filter bits
    def self.fb7=(value : Bool) : Bool
      self.set(fb7: value)
      value
    end

    # Filter bits
    def fb8 : Bool
      @value.bits_set?(0x100_u32)
    end

    # Filter bits
    def self.fb8 : Bool
      value.fb8
    end

    # Filter bits
    def self.fb8=(value : Bool) : Bool
      self.set(fb8: value)
      value
    end

    # Filter bits
    def fb9 : Bool
      @value.bits_set?(0x200_u32)
    end

    # Filter bits
    def self.fb9 : Bool
      value.fb9
    end

    # Filter bits
    def self.fb9=(value : Bool) : Bool
      self.set(fb9: value)
      value
    end

    # Filter bits
    def fb10 : Bool
      @value.bits_set?(0x400_u32)
    end

    # Filter bits
    def self.fb10 : Bool
      value.fb10
    end

    # Filter bits
    def self.fb10=(value : Bool) : Bool
      self.set(fb10: value)
      value
    end

    # Filter bits
    def fb11 : Bool
      @value.bits_set?(0x800_u32)
    end

    # Filter bits
    def self.fb11 : Bool
      value.fb11
    end

    # Filter bits
    def self.fb11=(value : Bool) : Bool
      self.set(fb11: value)
      value
    end

    # Filter bits
    def fb12 : Bool
      @value.bits_set?(0x1000_u32)
    end

    # Filter bits
    def self.fb12 : Bool
      value.fb12
    end

    # Filter bits
    def self.fb12=(value : Bool) : Bool
      self.set(fb12: value)
      value
    end

    # Filter bits
    def fb13 : Bool
      @value.bits_set?(0x2000_u32)
    end

    # Filter bits
    def self.fb13 : Bool
      value.fb13
    end

    # Filter bits
    def self.fb13=(value : Bool) : Bool
      self.set(fb13: value)
      value
    end

    # Filter bits
    def fb14 : Bool
      @value.bits_set?(0x4000_u32)
    end

    # Filter bits
    def self.fb14 : Bool
      value.fb14
    end

    # Filter bits
    def self.fb14=(value : Bool) : Bool
      self.set(fb14: value)
      value
    end

    # Filter bits
    def fb15 : Bool
      @value.bits_set?(0x8000_u32)
    end

    # Filter bits
    def self.fb15 : Bool
      value.fb15
    end

    # Filter bits
    def self.fb15=(value : Bool) : Bool
      self.set(fb15: value)
      value
    end

    # Filter bits
    def fb16 : Bool
      @value.bits_set?(0x10000_u32)
    end

    # Filter bits
    def self.fb16 : Bool
      value.fb16
    end

    # Filter bits
    def self.fb16=(value : Bool) : Bool
      self.set(fb16: value)
      value
    end

    # Filter bits
    def fb17 : Bool
      @value.bits_set?(0x20000_u32)
    end

    # Filter bits
    def self.fb17 : Bool
      value.fb17
    end

    # Filter bits
    def self.fb17=(value : Bool) : Bool
      self.set(fb17: value)
      value
    end

    # Filter bits
    def fb18 : Bool
      @value.bits_set?(0x40000_u32)
    end

    # Filter bits
    def self.fb18 : Bool
      value.fb18
    end

    # Filter bits
    def self.fb18=(value : Bool) : Bool
      self.set(fb18: value)
      value
    end

    # Filter bits
    def fb19 : Bool
      @value.bits_set?(0x80000_u32)
    end

    # Filter bits
    def self.fb19 : Bool
      value.fb19
    end

    # Filter bits
    def self.fb19=(value : Bool) : Bool
      self.set(fb19: value)
      value
    end

    # Filter bits
    def fb20 : Bool
      @value.bits_set?(0x100000_u32)
    end

    # Filter bits
    def self.fb20 : Bool
      value.fb20
    end

    # Filter bits
    def self.fb20=(value : Bool) : Bool
      self.set(fb20: value)
      value
    end

    # Filter bits
    def fb21 : Bool
      @value.bits_set?(0x200000_u32)
    end

    # Filter bits
    def self.fb21 : Bool
      value.fb21
    end

    # Filter bits
    def self.fb21=(value : Bool) : Bool
      self.set(fb21: value)
      value
    end

    # Filter bits
    def fb22 : Bool
      @value.bits_set?(0x400000_u32)
    end

    # Filter bits
    def self.fb22 : Bool
      value.fb22
    end

    # Filter bits
    def self.fb22=(value : Bool) : Bool
      self.set(fb22: value)
      value
    end

    # Filter bits
    def fb23 : Bool
      @value.bits_set?(0x800000_u32)
    end

    # Filter bits
    def self.fb23 : Bool
      value.fb23
    end

    # Filter bits
    def self.fb23=(value : Bool) : Bool
      self.set(fb23: value)
      value
    end

    # Filter bits
    def fb24 : Bool
      @value.bits_set?(0x1000000_u32)
    end

    # Filter bits
    def self.fb24 : Bool
      value.fb24
    end

    # Filter bits
    def self.fb24=(value : Bool) : Bool
      self.set(fb24: value)
      value
    end

    # Filter bits
    def fb25 : Bool
      @value.bits_set?(0x2000000_u32)
    end

    # Filter bits
    def self.fb25 : Bool
      value.fb25
    end

    # Filter bits
    def self.fb25=(value : Bool) : Bool
      self.set(fb25: value)
      value
    end

    # Filter bits
    def fb26 : Bool
      @value.bits_set?(0x4000000_u32)
    end

    # Filter bits
    def self.fb26 : Bool
      value.fb26
    end

    # Filter bits
    def self.fb26=(value : Bool) : Bool
      self.set(fb26: value)
      value
    end

    # Filter bits
    def fb27 : Bool
      @value.bits_set?(0x8000000_u32)
    end

    # Filter bits
    def self.fb27 : Bool
      value.fb27
    end

    # Filter bits
    def self.fb27=(value : Bool) : Bool
      self.set(fb27: value)
      value
    end

    # Filter bits
    def fb28 : Bool
      @value.bits_set?(0x10000000_u32)
    end

    # Filter bits
    def self.fb28 : Bool
      value.fb28
    end

    # Filter bits
    def self.fb28=(value : Bool) : Bool
      self.set(fb28: value)
      value
    end

    # Filter bits
    def fb29 : Bool
      @value.bits_set?(0x20000000_u32)
    end

    # Filter bits
    def self.fb29 : Bool
      value.fb29
    end

    # Filter bits
    def self.fb29=(value : Bool) : Bool
      self.set(fb29: value)
      value
    end

    # Filter bits
    def fb30 : Bool
      @value.bits_set?(0x40000000_u32)
    end

    # Filter bits
    def self.fb30 : Bool
      value.fb30
    end

    # Filter bits
    def self.fb30=(value : Bool) : Bool
      self.set(fb30: value)
      value
    end

    # Filter bits
    def fb31 : Bool
      @value.bits_set?(0x80000000_u32)
    end

    # Filter bits
    def self.fb31 : Bool
      value.fb31
    end

    # Filter bits
    def self.fb31=(value : Bool) : Bool
      self.set(fb31: value)
      value
    end

    def copy_with(
      *,

      fb0 : Bool? = nil,

      fb1 : Bool? = nil,

      fb2 : Bool? = nil,

      fb3 : Bool? = nil,

      fb4 : Bool? = nil,

      fb5 : Bool? = nil,

      fb6 : Bool? = nil,

      fb7 : Bool? = nil,

      fb8 : Bool? = nil,

      fb9 : Bool? = nil,

      fb10 : Bool? = nil,

      fb11 : Bool? = nil,

      fb12 : Bool? = nil,

      fb13 : Bool? = nil,

      fb14 : Bool? = nil,

      fb15 : Bool? = nil,

      fb16 : Bool? = nil,

      fb17 : Bool? = nil,

      fb18 : Bool? = nil,

      fb19 : Bool? = nil,

      fb20 : Bool? = nil,

      fb21 : Bool? = nil,

      fb22 : Bool? = nil,

      fb23 : Bool? = nil,

      fb24 : Bool? = nil,

      fb25 : Bool? = nil,

      fb26 : Bool? = nil,

      fb27 : Bool? = nil,

      fb28 : Bool? = nil,

      fb29 : Bool? = nil,

      fb30 : Bool? = nil,

      fb31 : Bool? = nil
    ) : self
      value = @value

      unless fb0.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(fb0.to_int).&(0x1_u32) << 0
      end

      unless fb1.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(fb1.to_int).&(0x1_u32) << 1
      end

      unless fb2.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(fb2.to_int).&(0x1_u32) << 2
      end

      unless fb3.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(fb3.to_int).&(0x1_u32) << 3
      end

      unless fb4.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(fb4.to_int).&(0x1_u32) << 4
      end

      unless fb5.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(fb5.to_int).&(0x1_u32) << 5
      end

      unless fb6.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(fb6.to_int).&(0x1_u32) << 6
      end

      unless fb7.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(fb7.to_int).&(0x1_u32) << 7
      end

      unless fb8.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(fb8.to_int).&(0x1_u32) << 8
      end

      unless fb9.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(fb9.to_int).&(0x1_u32) << 9
      end

      unless fb10.nil?
        value = (value & 0xfffffbff_u32) |
                UInt32.new!(fb10.to_int).&(0x1_u32) << 10
      end

      unless fb11.nil?
        value = (value & 0xfffff7ff_u32) |
                UInt32.new!(fb11.to_int).&(0x1_u32) << 11
      end

      unless fb12.nil?
        value = (value & 0xffffefff_u32) |
                UInt32.new!(fb12.to_int).&(0x1_u32) << 12
      end

      unless fb13.nil?
        value = (value & 0xffffdfff_u32) |
                UInt32.new!(fb13.to_int).&(0x1_u32) << 13
      end

      unless fb14.nil?
        value = (value & 0xffffbfff_u32) |
                UInt32.new!(fb14.to_int).&(0x1_u32) << 14
      end

      unless fb15.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(fb15.to_int).&(0x1_u32) << 15
      end

      unless fb16.nil?
        value = (value & 0xfffeffff_u32) |
                UInt32.new!(fb16.to_int).&(0x1_u32) << 16
      end

      unless fb17.nil?
        value = (value & 0xfffdffff_u32) |
                UInt32.new!(fb17.to_int).&(0x1_u32) << 17
      end

      unless fb18.nil?
        value = (value & 0xfffbffff_u32) |
                UInt32.new!(fb18.to_int).&(0x1_u32) << 18
      end

      unless fb19.nil?
        value = (value & 0xfff7ffff_u32) |
                UInt32.new!(fb19.to_int).&(0x1_u32) << 19
      end

      unless fb20.nil?
        value = (value & 0xffefffff_u32) |
                UInt32.new!(fb20.to_int).&(0x1_u32) << 20
      end

      unless fb21.nil?
        value = (value & 0xffdfffff_u32) |
                UInt32.new!(fb21.to_int).&(0x1_u32) << 21
      end

      unless fb22.nil?
        value = (value & 0xffbfffff_u32) |
                UInt32.new!(fb22.to_int).&(0x1_u32) << 22
      end

      unless fb23.nil?
        value = (value & 0xff7fffff_u32) |
                UInt32.new!(fb23.to_int).&(0x1_u32) << 23
      end

      unless fb24.nil?
        value = (value & 0xfeffffff_u32) |
                UInt32.new!(fb24.to_int).&(0x1_u32) << 24
      end

      unless fb25.nil?
        value = (value & 0xfdffffff_u32) |
                UInt32.new!(fb25.to_int).&(0x1_u32) << 25
      end

      unless fb26.nil?
        value = (value & 0xfbffffff_u32) |
                UInt32.new!(fb26.to_int).&(0x1_u32) << 26
      end

      unless fb27.nil?
        value = (value & 0xf7ffffff_u32) |
                UInt32.new!(fb27.to_int).&(0x1_u32) << 27
      end

      unless fb28.nil?
        value = (value & 0xefffffff_u32) |
                UInt32.new!(fb28.to_int).&(0x1_u32) << 28
      end

      unless fb29.nil?
        value = (value & 0xdfffffff_u32) |
                UInt32.new!(fb29.to_int).&(0x1_u32) << 29
      end

      unless fb30.nil?
        value = (value & 0xbfffffff_u32) |
                UInt32.new!(fb30.to_int).&(0x1_u32) << 30
      end

      unless fb31.nil?
        value = (value & 0x7fffffff_u32) |
                UInt32.new!(fb31.to_int).&(0x1_u32) << 31
      end

      self.class.new(value)
    end

    def self.set(
      *,
      fb0 : Bool? = nil,
      fb1 : Bool? = nil,
      fb2 : Bool? = nil,
      fb3 : Bool? = nil,
      fb4 : Bool? = nil,
      fb5 : Bool? = nil,
      fb6 : Bool? = nil,
      fb7 : Bool? = nil,
      fb8 : Bool? = nil,
      fb9 : Bool? = nil,
      fb10 : Bool? = nil,
      fb11 : Bool? = nil,
      fb12 : Bool? = nil,
      fb13 : Bool? = nil,
      fb14 : Bool? = nil,
      fb15 : Bool? = nil,
      fb16 : Bool? = nil,
      fb17 : Bool? = nil,
      fb18 : Bool? = nil,
      fb19 : Bool? = nil,
      fb20 : Bool? = nil,
      fb21 : Bool? = nil,
      fb22 : Bool? = nil,
      fb23 : Bool? = nil,
      fb24 : Bool? = nil,
      fb25 : Bool? = nil,
      fb26 : Bool? = nil,
      fb27 : Bool? = nil,
      fb28 : Bool? = nil,
      fb29 : Bool? = nil,
      fb30 : Bool? = nil,
      fb31 : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        fb0: fb0,
        fb1: fb1,
        fb2: fb2,
        fb3: fb3,
        fb4: fb4,
        fb5: fb5,
        fb6: fb6,
        fb7: fb7,
        fb8: fb8,
        fb9: fb9,
        fb10: fb10,
        fb11: fb11,
        fb12: fb12,
        fb13: fb13,
        fb14: fb14,
        fb15: fb15,
        fb16: fb16,
        fb17: fb17,
        fb18: fb18,
        fb19: fb19,
        fb20: fb20,
        fb21: fb21,
        fb22: fb22,
        fb23: fb23,
        fb24: fb24,
        fb25: fb25,
        fb26: fb26,
        fb27: fb27,
        fb28: fb28,
        fb29: fb29,
        fb30: fb30,
        fb31: fb31,
      )
    end
  end # struct

  # Filter bank 18 register 2
  struct F18R2
    ADDRESS = BASE_ADDRESS + 0x2d4_u64

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

    # Filter bits
    def fb0 : Bool
      @value.bits_set?(0x1_u32)
    end

    # Filter bits
    def self.fb0 : Bool
      value.fb0
    end

    # Filter bits
    def self.fb0=(value : Bool) : Bool
      self.set(fb0: value)
      value
    end

    # Filter bits
    def fb1 : Bool
      @value.bits_set?(0x2_u32)
    end

    # Filter bits
    def self.fb1 : Bool
      value.fb1
    end

    # Filter bits
    def self.fb1=(value : Bool) : Bool
      self.set(fb1: value)
      value
    end

    # Filter bits
    def fb2 : Bool
      @value.bits_set?(0x4_u32)
    end

    # Filter bits
    def self.fb2 : Bool
      value.fb2
    end

    # Filter bits
    def self.fb2=(value : Bool) : Bool
      self.set(fb2: value)
      value
    end

    # Filter bits
    def fb3 : Bool
      @value.bits_set?(0x8_u32)
    end

    # Filter bits
    def self.fb3 : Bool
      value.fb3
    end

    # Filter bits
    def self.fb3=(value : Bool) : Bool
      self.set(fb3: value)
      value
    end

    # Filter bits
    def fb4 : Bool
      @value.bits_set?(0x10_u32)
    end

    # Filter bits
    def self.fb4 : Bool
      value.fb4
    end

    # Filter bits
    def self.fb4=(value : Bool) : Bool
      self.set(fb4: value)
      value
    end

    # Filter bits
    def fb5 : Bool
      @value.bits_set?(0x20_u32)
    end

    # Filter bits
    def self.fb5 : Bool
      value.fb5
    end

    # Filter bits
    def self.fb5=(value : Bool) : Bool
      self.set(fb5: value)
      value
    end

    # Filter bits
    def fb6 : Bool
      @value.bits_set?(0x40_u32)
    end

    # Filter bits
    def self.fb6 : Bool
      value.fb6
    end

    # Filter bits
    def self.fb6=(value : Bool) : Bool
      self.set(fb6: value)
      value
    end

    # Filter bits
    def fb7 : Bool
      @value.bits_set?(0x80_u32)
    end

    # Filter bits
    def self.fb7 : Bool
      value.fb7
    end

    # Filter bits
    def self.fb7=(value : Bool) : Bool
      self.set(fb7: value)
      value
    end

    # Filter bits
    def fb8 : Bool
      @value.bits_set?(0x100_u32)
    end

    # Filter bits
    def self.fb8 : Bool
      value.fb8
    end

    # Filter bits
    def self.fb8=(value : Bool) : Bool
      self.set(fb8: value)
      value
    end

    # Filter bits
    def fb9 : Bool
      @value.bits_set?(0x200_u32)
    end

    # Filter bits
    def self.fb9 : Bool
      value.fb9
    end

    # Filter bits
    def self.fb9=(value : Bool) : Bool
      self.set(fb9: value)
      value
    end

    # Filter bits
    def fb10 : Bool
      @value.bits_set?(0x400_u32)
    end

    # Filter bits
    def self.fb10 : Bool
      value.fb10
    end

    # Filter bits
    def self.fb10=(value : Bool) : Bool
      self.set(fb10: value)
      value
    end

    # Filter bits
    def fb11 : Bool
      @value.bits_set?(0x800_u32)
    end

    # Filter bits
    def self.fb11 : Bool
      value.fb11
    end

    # Filter bits
    def self.fb11=(value : Bool) : Bool
      self.set(fb11: value)
      value
    end

    # Filter bits
    def fb12 : Bool
      @value.bits_set?(0x1000_u32)
    end

    # Filter bits
    def self.fb12 : Bool
      value.fb12
    end

    # Filter bits
    def self.fb12=(value : Bool) : Bool
      self.set(fb12: value)
      value
    end

    # Filter bits
    def fb13 : Bool
      @value.bits_set?(0x2000_u32)
    end

    # Filter bits
    def self.fb13 : Bool
      value.fb13
    end

    # Filter bits
    def self.fb13=(value : Bool) : Bool
      self.set(fb13: value)
      value
    end

    # Filter bits
    def fb14 : Bool
      @value.bits_set?(0x4000_u32)
    end

    # Filter bits
    def self.fb14 : Bool
      value.fb14
    end

    # Filter bits
    def self.fb14=(value : Bool) : Bool
      self.set(fb14: value)
      value
    end

    # Filter bits
    def fb15 : Bool
      @value.bits_set?(0x8000_u32)
    end

    # Filter bits
    def self.fb15 : Bool
      value.fb15
    end

    # Filter bits
    def self.fb15=(value : Bool) : Bool
      self.set(fb15: value)
      value
    end

    # Filter bits
    def fb16 : Bool
      @value.bits_set?(0x10000_u32)
    end

    # Filter bits
    def self.fb16 : Bool
      value.fb16
    end

    # Filter bits
    def self.fb16=(value : Bool) : Bool
      self.set(fb16: value)
      value
    end

    # Filter bits
    def fb17 : Bool
      @value.bits_set?(0x20000_u32)
    end

    # Filter bits
    def self.fb17 : Bool
      value.fb17
    end

    # Filter bits
    def self.fb17=(value : Bool) : Bool
      self.set(fb17: value)
      value
    end

    # Filter bits
    def fb18 : Bool
      @value.bits_set?(0x40000_u32)
    end

    # Filter bits
    def self.fb18 : Bool
      value.fb18
    end

    # Filter bits
    def self.fb18=(value : Bool) : Bool
      self.set(fb18: value)
      value
    end

    # Filter bits
    def fb19 : Bool
      @value.bits_set?(0x80000_u32)
    end

    # Filter bits
    def self.fb19 : Bool
      value.fb19
    end

    # Filter bits
    def self.fb19=(value : Bool) : Bool
      self.set(fb19: value)
      value
    end

    # Filter bits
    def fb20 : Bool
      @value.bits_set?(0x100000_u32)
    end

    # Filter bits
    def self.fb20 : Bool
      value.fb20
    end

    # Filter bits
    def self.fb20=(value : Bool) : Bool
      self.set(fb20: value)
      value
    end

    # Filter bits
    def fb21 : Bool
      @value.bits_set?(0x200000_u32)
    end

    # Filter bits
    def self.fb21 : Bool
      value.fb21
    end

    # Filter bits
    def self.fb21=(value : Bool) : Bool
      self.set(fb21: value)
      value
    end

    # Filter bits
    def fb22 : Bool
      @value.bits_set?(0x400000_u32)
    end

    # Filter bits
    def self.fb22 : Bool
      value.fb22
    end

    # Filter bits
    def self.fb22=(value : Bool) : Bool
      self.set(fb22: value)
      value
    end

    # Filter bits
    def fb23 : Bool
      @value.bits_set?(0x800000_u32)
    end

    # Filter bits
    def self.fb23 : Bool
      value.fb23
    end

    # Filter bits
    def self.fb23=(value : Bool) : Bool
      self.set(fb23: value)
      value
    end

    # Filter bits
    def fb24 : Bool
      @value.bits_set?(0x1000000_u32)
    end

    # Filter bits
    def self.fb24 : Bool
      value.fb24
    end

    # Filter bits
    def self.fb24=(value : Bool) : Bool
      self.set(fb24: value)
      value
    end

    # Filter bits
    def fb25 : Bool
      @value.bits_set?(0x2000000_u32)
    end

    # Filter bits
    def self.fb25 : Bool
      value.fb25
    end

    # Filter bits
    def self.fb25=(value : Bool) : Bool
      self.set(fb25: value)
      value
    end

    # Filter bits
    def fb26 : Bool
      @value.bits_set?(0x4000000_u32)
    end

    # Filter bits
    def self.fb26 : Bool
      value.fb26
    end

    # Filter bits
    def self.fb26=(value : Bool) : Bool
      self.set(fb26: value)
      value
    end

    # Filter bits
    def fb27 : Bool
      @value.bits_set?(0x8000000_u32)
    end

    # Filter bits
    def self.fb27 : Bool
      value.fb27
    end

    # Filter bits
    def self.fb27=(value : Bool) : Bool
      self.set(fb27: value)
      value
    end

    # Filter bits
    def fb28 : Bool
      @value.bits_set?(0x10000000_u32)
    end

    # Filter bits
    def self.fb28 : Bool
      value.fb28
    end

    # Filter bits
    def self.fb28=(value : Bool) : Bool
      self.set(fb28: value)
      value
    end

    # Filter bits
    def fb29 : Bool
      @value.bits_set?(0x20000000_u32)
    end

    # Filter bits
    def self.fb29 : Bool
      value.fb29
    end

    # Filter bits
    def self.fb29=(value : Bool) : Bool
      self.set(fb29: value)
      value
    end

    # Filter bits
    def fb30 : Bool
      @value.bits_set?(0x40000000_u32)
    end

    # Filter bits
    def self.fb30 : Bool
      value.fb30
    end

    # Filter bits
    def self.fb30=(value : Bool) : Bool
      self.set(fb30: value)
      value
    end

    # Filter bits
    def fb31 : Bool
      @value.bits_set?(0x80000000_u32)
    end

    # Filter bits
    def self.fb31 : Bool
      value.fb31
    end

    # Filter bits
    def self.fb31=(value : Bool) : Bool
      self.set(fb31: value)
      value
    end

    def copy_with(
      *,

      fb0 : Bool? = nil,

      fb1 : Bool? = nil,

      fb2 : Bool? = nil,

      fb3 : Bool? = nil,

      fb4 : Bool? = nil,

      fb5 : Bool? = nil,

      fb6 : Bool? = nil,

      fb7 : Bool? = nil,

      fb8 : Bool? = nil,

      fb9 : Bool? = nil,

      fb10 : Bool? = nil,

      fb11 : Bool? = nil,

      fb12 : Bool? = nil,

      fb13 : Bool? = nil,

      fb14 : Bool? = nil,

      fb15 : Bool? = nil,

      fb16 : Bool? = nil,

      fb17 : Bool? = nil,

      fb18 : Bool? = nil,

      fb19 : Bool? = nil,

      fb20 : Bool? = nil,

      fb21 : Bool? = nil,

      fb22 : Bool? = nil,

      fb23 : Bool? = nil,

      fb24 : Bool? = nil,

      fb25 : Bool? = nil,

      fb26 : Bool? = nil,

      fb27 : Bool? = nil,

      fb28 : Bool? = nil,

      fb29 : Bool? = nil,

      fb30 : Bool? = nil,

      fb31 : Bool? = nil
    ) : self
      value = @value

      unless fb0.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(fb0.to_int).&(0x1_u32) << 0
      end

      unless fb1.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(fb1.to_int).&(0x1_u32) << 1
      end

      unless fb2.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(fb2.to_int).&(0x1_u32) << 2
      end

      unless fb3.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(fb3.to_int).&(0x1_u32) << 3
      end

      unless fb4.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(fb4.to_int).&(0x1_u32) << 4
      end

      unless fb5.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(fb5.to_int).&(0x1_u32) << 5
      end

      unless fb6.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(fb6.to_int).&(0x1_u32) << 6
      end

      unless fb7.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(fb7.to_int).&(0x1_u32) << 7
      end

      unless fb8.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(fb8.to_int).&(0x1_u32) << 8
      end

      unless fb9.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(fb9.to_int).&(0x1_u32) << 9
      end

      unless fb10.nil?
        value = (value & 0xfffffbff_u32) |
                UInt32.new!(fb10.to_int).&(0x1_u32) << 10
      end

      unless fb11.nil?
        value = (value & 0xfffff7ff_u32) |
                UInt32.new!(fb11.to_int).&(0x1_u32) << 11
      end

      unless fb12.nil?
        value = (value & 0xffffefff_u32) |
                UInt32.new!(fb12.to_int).&(0x1_u32) << 12
      end

      unless fb13.nil?
        value = (value & 0xffffdfff_u32) |
                UInt32.new!(fb13.to_int).&(0x1_u32) << 13
      end

      unless fb14.nil?
        value = (value & 0xffffbfff_u32) |
                UInt32.new!(fb14.to_int).&(0x1_u32) << 14
      end

      unless fb15.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(fb15.to_int).&(0x1_u32) << 15
      end

      unless fb16.nil?
        value = (value & 0xfffeffff_u32) |
                UInt32.new!(fb16.to_int).&(0x1_u32) << 16
      end

      unless fb17.nil?
        value = (value & 0xfffdffff_u32) |
                UInt32.new!(fb17.to_int).&(0x1_u32) << 17
      end

      unless fb18.nil?
        value = (value & 0xfffbffff_u32) |
                UInt32.new!(fb18.to_int).&(0x1_u32) << 18
      end

      unless fb19.nil?
        value = (value & 0xfff7ffff_u32) |
                UInt32.new!(fb19.to_int).&(0x1_u32) << 19
      end

      unless fb20.nil?
        value = (value & 0xffefffff_u32) |
                UInt32.new!(fb20.to_int).&(0x1_u32) << 20
      end

      unless fb21.nil?
        value = (value & 0xffdfffff_u32) |
                UInt32.new!(fb21.to_int).&(0x1_u32) << 21
      end

      unless fb22.nil?
        value = (value & 0xffbfffff_u32) |
                UInt32.new!(fb22.to_int).&(0x1_u32) << 22
      end

      unless fb23.nil?
        value = (value & 0xff7fffff_u32) |
                UInt32.new!(fb23.to_int).&(0x1_u32) << 23
      end

      unless fb24.nil?
        value = (value & 0xfeffffff_u32) |
                UInt32.new!(fb24.to_int).&(0x1_u32) << 24
      end

      unless fb25.nil?
        value = (value & 0xfdffffff_u32) |
                UInt32.new!(fb25.to_int).&(0x1_u32) << 25
      end

      unless fb26.nil?
        value = (value & 0xfbffffff_u32) |
                UInt32.new!(fb26.to_int).&(0x1_u32) << 26
      end

      unless fb27.nil?
        value = (value & 0xf7ffffff_u32) |
                UInt32.new!(fb27.to_int).&(0x1_u32) << 27
      end

      unless fb28.nil?
        value = (value & 0xefffffff_u32) |
                UInt32.new!(fb28.to_int).&(0x1_u32) << 28
      end

      unless fb29.nil?
        value = (value & 0xdfffffff_u32) |
                UInt32.new!(fb29.to_int).&(0x1_u32) << 29
      end

      unless fb30.nil?
        value = (value & 0xbfffffff_u32) |
                UInt32.new!(fb30.to_int).&(0x1_u32) << 30
      end

      unless fb31.nil?
        value = (value & 0x7fffffff_u32) |
                UInt32.new!(fb31.to_int).&(0x1_u32) << 31
      end

      self.class.new(value)
    end

    def self.set(
      *,
      fb0 : Bool? = nil,
      fb1 : Bool? = nil,
      fb2 : Bool? = nil,
      fb3 : Bool? = nil,
      fb4 : Bool? = nil,
      fb5 : Bool? = nil,
      fb6 : Bool? = nil,
      fb7 : Bool? = nil,
      fb8 : Bool? = nil,
      fb9 : Bool? = nil,
      fb10 : Bool? = nil,
      fb11 : Bool? = nil,
      fb12 : Bool? = nil,
      fb13 : Bool? = nil,
      fb14 : Bool? = nil,
      fb15 : Bool? = nil,
      fb16 : Bool? = nil,
      fb17 : Bool? = nil,
      fb18 : Bool? = nil,
      fb19 : Bool? = nil,
      fb20 : Bool? = nil,
      fb21 : Bool? = nil,
      fb22 : Bool? = nil,
      fb23 : Bool? = nil,
      fb24 : Bool? = nil,
      fb25 : Bool? = nil,
      fb26 : Bool? = nil,
      fb27 : Bool? = nil,
      fb28 : Bool? = nil,
      fb29 : Bool? = nil,
      fb30 : Bool? = nil,
      fb31 : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        fb0: fb0,
        fb1: fb1,
        fb2: fb2,
        fb3: fb3,
        fb4: fb4,
        fb5: fb5,
        fb6: fb6,
        fb7: fb7,
        fb8: fb8,
        fb9: fb9,
        fb10: fb10,
        fb11: fb11,
        fb12: fb12,
        fb13: fb13,
        fb14: fb14,
        fb15: fb15,
        fb16: fb16,
        fb17: fb17,
        fb18: fb18,
        fb19: fb19,
        fb20: fb20,
        fb21: fb21,
        fb22: fb22,
        fb23: fb23,
        fb24: fb24,
        fb25: fb25,
        fb26: fb26,
        fb27: fb27,
        fb28: fb28,
        fb29: fb29,
        fb30: fb30,
        fb31: fb31,
      )
    end
  end # struct

  # Filter bank 19 register 1
  struct F19R1
    ADDRESS = BASE_ADDRESS + 0x2d8_u64

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

    # Filter bits
    def fb0 : Bool
      @value.bits_set?(0x1_u32)
    end

    # Filter bits
    def self.fb0 : Bool
      value.fb0
    end

    # Filter bits
    def self.fb0=(value : Bool) : Bool
      self.set(fb0: value)
      value
    end

    # Filter bits
    def fb1 : Bool
      @value.bits_set?(0x2_u32)
    end

    # Filter bits
    def self.fb1 : Bool
      value.fb1
    end

    # Filter bits
    def self.fb1=(value : Bool) : Bool
      self.set(fb1: value)
      value
    end

    # Filter bits
    def fb2 : Bool
      @value.bits_set?(0x4_u32)
    end

    # Filter bits
    def self.fb2 : Bool
      value.fb2
    end

    # Filter bits
    def self.fb2=(value : Bool) : Bool
      self.set(fb2: value)
      value
    end

    # Filter bits
    def fb3 : Bool
      @value.bits_set?(0x8_u32)
    end

    # Filter bits
    def self.fb3 : Bool
      value.fb3
    end

    # Filter bits
    def self.fb3=(value : Bool) : Bool
      self.set(fb3: value)
      value
    end

    # Filter bits
    def fb4 : Bool
      @value.bits_set?(0x10_u32)
    end

    # Filter bits
    def self.fb4 : Bool
      value.fb4
    end

    # Filter bits
    def self.fb4=(value : Bool) : Bool
      self.set(fb4: value)
      value
    end

    # Filter bits
    def fb5 : Bool
      @value.bits_set?(0x20_u32)
    end

    # Filter bits
    def self.fb5 : Bool
      value.fb5
    end

    # Filter bits
    def self.fb5=(value : Bool) : Bool
      self.set(fb5: value)
      value
    end

    # Filter bits
    def fb6 : Bool
      @value.bits_set?(0x40_u32)
    end

    # Filter bits
    def self.fb6 : Bool
      value.fb6
    end

    # Filter bits
    def self.fb6=(value : Bool) : Bool
      self.set(fb6: value)
      value
    end

    # Filter bits
    def fb7 : Bool
      @value.bits_set?(0x80_u32)
    end

    # Filter bits
    def self.fb7 : Bool
      value.fb7
    end

    # Filter bits
    def self.fb7=(value : Bool) : Bool
      self.set(fb7: value)
      value
    end

    # Filter bits
    def fb8 : Bool
      @value.bits_set?(0x100_u32)
    end

    # Filter bits
    def self.fb8 : Bool
      value.fb8
    end

    # Filter bits
    def self.fb8=(value : Bool) : Bool
      self.set(fb8: value)
      value
    end

    # Filter bits
    def fb9 : Bool
      @value.bits_set?(0x200_u32)
    end

    # Filter bits
    def self.fb9 : Bool
      value.fb9
    end

    # Filter bits
    def self.fb9=(value : Bool) : Bool
      self.set(fb9: value)
      value
    end

    # Filter bits
    def fb10 : Bool
      @value.bits_set?(0x400_u32)
    end

    # Filter bits
    def self.fb10 : Bool
      value.fb10
    end

    # Filter bits
    def self.fb10=(value : Bool) : Bool
      self.set(fb10: value)
      value
    end

    # Filter bits
    def fb11 : Bool
      @value.bits_set?(0x800_u32)
    end

    # Filter bits
    def self.fb11 : Bool
      value.fb11
    end

    # Filter bits
    def self.fb11=(value : Bool) : Bool
      self.set(fb11: value)
      value
    end

    # Filter bits
    def fb12 : Bool
      @value.bits_set?(0x1000_u32)
    end

    # Filter bits
    def self.fb12 : Bool
      value.fb12
    end

    # Filter bits
    def self.fb12=(value : Bool) : Bool
      self.set(fb12: value)
      value
    end

    # Filter bits
    def fb13 : Bool
      @value.bits_set?(0x2000_u32)
    end

    # Filter bits
    def self.fb13 : Bool
      value.fb13
    end

    # Filter bits
    def self.fb13=(value : Bool) : Bool
      self.set(fb13: value)
      value
    end

    # Filter bits
    def fb14 : Bool
      @value.bits_set?(0x4000_u32)
    end

    # Filter bits
    def self.fb14 : Bool
      value.fb14
    end

    # Filter bits
    def self.fb14=(value : Bool) : Bool
      self.set(fb14: value)
      value
    end

    # Filter bits
    def fb15 : Bool
      @value.bits_set?(0x8000_u32)
    end

    # Filter bits
    def self.fb15 : Bool
      value.fb15
    end

    # Filter bits
    def self.fb15=(value : Bool) : Bool
      self.set(fb15: value)
      value
    end

    # Filter bits
    def fb16 : Bool
      @value.bits_set?(0x10000_u32)
    end

    # Filter bits
    def self.fb16 : Bool
      value.fb16
    end

    # Filter bits
    def self.fb16=(value : Bool) : Bool
      self.set(fb16: value)
      value
    end

    # Filter bits
    def fb17 : Bool
      @value.bits_set?(0x20000_u32)
    end

    # Filter bits
    def self.fb17 : Bool
      value.fb17
    end

    # Filter bits
    def self.fb17=(value : Bool) : Bool
      self.set(fb17: value)
      value
    end

    # Filter bits
    def fb18 : Bool
      @value.bits_set?(0x40000_u32)
    end

    # Filter bits
    def self.fb18 : Bool
      value.fb18
    end

    # Filter bits
    def self.fb18=(value : Bool) : Bool
      self.set(fb18: value)
      value
    end

    # Filter bits
    def fb19 : Bool
      @value.bits_set?(0x80000_u32)
    end

    # Filter bits
    def self.fb19 : Bool
      value.fb19
    end

    # Filter bits
    def self.fb19=(value : Bool) : Bool
      self.set(fb19: value)
      value
    end

    # Filter bits
    def fb20 : Bool
      @value.bits_set?(0x100000_u32)
    end

    # Filter bits
    def self.fb20 : Bool
      value.fb20
    end

    # Filter bits
    def self.fb20=(value : Bool) : Bool
      self.set(fb20: value)
      value
    end

    # Filter bits
    def fb21 : Bool
      @value.bits_set?(0x200000_u32)
    end

    # Filter bits
    def self.fb21 : Bool
      value.fb21
    end

    # Filter bits
    def self.fb21=(value : Bool) : Bool
      self.set(fb21: value)
      value
    end

    # Filter bits
    def fb22 : Bool
      @value.bits_set?(0x400000_u32)
    end

    # Filter bits
    def self.fb22 : Bool
      value.fb22
    end

    # Filter bits
    def self.fb22=(value : Bool) : Bool
      self.set(fb22: value)
      value
    end

    # Filter bits
    def fb23 : Bool
      @value.bits_set?(0x800000_u32)
    end

    # Filter bits
    def self.fb23 : Bool
      value.fb23
    end

    # Filter bits
    def self.fb23=(value : Bool) : Bool
      self.set(fb23: value)
      value
    end

    # Filter bits
    def fb24 : Bool
      @value.bits_set?(0x1000000_u32)
    end

    # Filter bits
    def self.fb24 : Bool
      value.fb24
    end

    # Filter bits
    def self.fb24=(value : Bool) : Bool
      self.set(fb24: value)
      value
    end

    # Filter bits
    def fb25 : Bool
      @value.bits_set?(0x2000000_u32)
    end

    # Filter bits
    def self.fb25 : Bool
      value.fb25
    end

    # Filter bits
    def self.fb25=(value : Bool) : Bool
      self.set(fb25: value)
      value
    end

    # Filter bits
    def fb26 : Bool
      @value.bits_set?(0x4000000_u32)
    end

    # Filter bits
    def self.fb26 : Bool
      value.fb26
    end

    # Filter bits
    def self.fb26=(value : Bool) : Bool
      self.set(fb26: value)
      value
    end

    # Filter bits
    def fb27 : Bool
      @value.bits_set?(0x8000000_u32)
    end

    # Filter bits
    def self.fb27 : Bool
      value.fb27
    end

    # Filter bits
    def self.fb27=(value : Bool) : Bool
      self.set(fb27: value)
      value
    end

    # Filter bits
    def fb28 : Bool
      @value.bits_set?(0x10000000_u32)
    end

    # Filter bits
    def self.fb28 : Bool
      value.fb28
    end

    # Filter bits
    def self.fb28=(value : Bool) : Bool
      self.set(fb28: value)
      value
    end

    # Filter bits
    def fb29 : Bool
      @value.bits_set?(0x20000000_u32)
    end

    # Filter bits
    def self.fb29 : Bool
      value.fb29
    end

    # Filter bits
    def self.fb29=(value : Bool) : Bool
      self.set(fb29: value)
      value
    end

    # Filter bits
    def fb30 : Bool
      @value.bits_set?(0x40000000_u32)
    end

    # Filter bits
    def self.fb30 : Bool
      value.fb30
    end

    # Filter bits
    def self.fb30=(value : Bool) : Bool
      self.set(fb30: value)
      value
    end

    # Filter bits
    def fb31 : Bool
      @value.bits_set?(0x80000000_u32)
    end

    # Filter bits
    def self.fb31 : Bool
      value.fb31
    end

    # Filter bits
    def self.fb31=(value : Bool) : Bool
      self.set(fb31: value)
      value
    end

    def copy_with(
      *,

      fb0 : Bool? = nil,

      fb1 : Bool? = nil,

      fb2 : Bool? = nil,

      fb3 : Bool? = nil,

      fb4 : Bool? = nil,

      fb5 : Bool? = nil,

      fb6 : Bool? = nil,

      fb7 : Bool? = nil,

      fb8 : Bool? = nil,

      fb9 : Bool? = nil,

      fb10 : Bool? = nil,

      fb11 : Bool? = nil,

      fb12 : Bool? = nil,

      fb13 : Bool? = nil,

      fb14 : Bool? = nil,

      fb15 : Bool? = nil,

      fb16 : Bool? = nil,

      fb17 : Bool? = nil,

      fb18 : Bool? = nil,

      fb19 : Bool? = nil,

      fb20 : Bool? = nil,

      fb21 : Bool? = nil,

      fb22 : Bool? = nil,

      fb23 : Bool? = nil,

      fb24 : Bool? = nil,

      fb25 : Bool? = nil,

      fb26 : Bool? = nil,

      fb27 : Bool? = nil,

      fb28 : Bool? = nil,

      fb29 : Bool? = nil,

      fb30 : Bool? = nil,

      fb31 : Bool? = nil
    ) : self
      value = @value

      unless fb0.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(fb0.to_int).&(0x1_u32) << 0
      end

      unless fb1.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(fb1.to_int).&(0x1_u32) << 1
      end

      unless fb2.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(fb2.to_int).&(0x1_u32) << 2
      end

      unless fb3.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(fb3.to_int).&(0x1_u32) << 3
      end

      unless fb4.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(fb4.to_int).&(0x1_u32) << 4
      end

      unless fb5.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(fb5.to_int).&(0x1_u32) << 5
      end

      unless fb6.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(fb6.to_int).&(0x1_u32) << 6
      end

      unless fb7.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(fb7.to_int).&(0x1_u32) << 7
      end

      unless fb8.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(fb8.to_int).&(0x1_u32) << 8
      end

      unless fb9.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(fb9.to_int).&(0x1_u32) << 9
      end

      unless fb10.nil?
        value = (value & 0xfffffbff_u32) |
                UInt32.new!(fb10.to_int).&(0x1_u32) << 10
      end

      unless fb11.nil?
        value = (value & 0xfffff7ff_u32) |
                UInt32.new!(fb11.to_int).&(0x1_u32) << 11
      end

      unless fb12.nil?
        value = (value & 0xffffefff_u32) |
                UInt32.new!(fb12.to_int).&(0x1_u32) << 12
      end

      unless fb13.nil?
        value = (value & 0xffffdfff_u32) |
                UInt32.new!(fb13.to_int).&(0x1_u32) << 13
      end

      unless fb14.nil?
        value = (value & 0xffffbfff_u32) |
                UInt32.new!(fb14.to_int).&(0x1_u32) << 14
      end

      unless fb15.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(fb15.to_int).&(0x1_u32) << 15
      end

      unless fb16.nil?
        value = (value & 0xfffeffff_u32) |
                UInt32.new!(fb16.to_int).&(0x1_u32) << 16
      end

      unless fb17.nil?
        value = (value & 0xfffdffff_u32) |
                UInt32.new!(fb17.to_int).&(0x1_u32) << 17
      end

      unless fb18.nil?
        value = (value & 0xfffbffff_u32) |
                UInt32.new!(fb18.to_int).&(0x1_u32) << 18
      end

      unless fb19.nil?
        value = (value & 0xfff7ffff_u32) |
                UInt32.new!(fb19.to_int).&(0x1_u32) << 19
      end

      unless fb20.nil?
        value = (value & 0xffefffff_u32) |
                UInt32.new!(fb20.to_int).&(0x1_u32) << 20
      end

      unless fb21.nil?
        value = (value & 0xffdfffff_u32) |
                UInt32.new!(fb21.to_int).&(0x1_u32) << 21
      end

      unless fb22.nil?
        value = (value & 0xffbfffff_u32) |
                UInt32.new!(fb22.to_int).&(0x1_u32) << 22
      end

      unless fb23.nil?
        value = (value & 0xff7fffff_u32) |
                UInt32.new!(fb23.to_int).&(0x1_u32) << 23
      end

      unless fb24.nil?
        value = (value & 0xfeffffff_u32) |
                UInt32.new!(fb24.to_int).&(0x1_u32) << 24
      end

      unless fb25.nil?
        value = (value & 0xfdffffff_u32) |
                UInt32.new!(fb25.to_int).&(0x1_u32) << 25
      end

      unless fb26.nil?
        value = (value & 0xfbffffff_u32) |
                UInt32.new!(fb26.to_int).&(0x1_u32) << 26
      end

      unless fb27.nil?
        value = (value & 0xf7ffffff_u32) |
                UInt32.new!(fb27.to_int).&(0x1_u32) << 27
      end

      unless fb28.nil?
        value = (value & 0xefffffff_u32) |
                UInt32.new!(fb28.to_int).&(0x1_u32) << 28
      end

      unless fb29.nil?
        value = (value & 0xdfffffff_u32) |
                UInt32.new!(fb29.to_int).&(0x1_u32) << 29
      end

      unless fb30.nil?
        value = (value & 0xbfffffff_u32) |
                UInt32.new!(fb30.to_int).&(0x1_u32) << 30
      end

      unless fb31.nil?
        value = (value & 0x7fffffff_u32) |
                UInt32.new!(fb31.to_int).&(0x1_u32) << 31
      end

      self.class.new(value)
    end

    def self.set(
      *,
      fb0 : Bool? = nil,
      fb1 : Bool? = nil,
      fb2 : Bool? = nil,
      fb3 : Bool? = nil,
      fb4 : Bool? = nil,
      fb5 : Bool? = nil,
      fb6 : Bool? = nil,
      fb7 : Bool? = nil,
      fb8 : Bool? = nil,
      fb9 : Bool? = nil,
      fb10 : Bool? = nil,
      fb11 : Bool? = nil,
      fb12 : Bool? = nil,
      fb13 : Bool? = nil,
      fb14 : Bool? = nil,
      fb15 : Bool? = nil,
      fb16 : Bool? = nil,
      fb17 : Bool? = nil,
      fb18 : Bool? = nil,
      fb19 : Bool? = nil,
      fb20 : Bool? = nil,
      fb21 : Bool? = nil,
      fb22 : Bool? = nil,
      fb23 : Bool? = nil,
      fb24 : Bool? = nil,
      fb25 : Bool? = nil,
      fb26 : Bool? = nil,
      fb27 : Bool? = nil,
      fb28 : Bool? = nil,
      fb29 : Bool? = nil,
      fb30 : Bool? = nil,
      fb31 : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        fb0: fb0,
        fb1: fb1,
        fb2: fb2,
        fb3: fb3,
        fb4: fb4,
        fb5: fb5,
        fb6: fb6,
        fb7: fb7,
        fb8: fb8,
        fb9: fb9,
        fb10: fb10,
        fb11: fb11,
        fb12: fb12,
        fb13: fb13,
        fb14: fb14,
        fb15: fb15,
        fb16: fb16,
        fb17: fb17,
        fb18: fb18,
        fb19: fb19,
        fb20: fb20,
        fb21: fb21,
        fb22: fb22,
        fb23: fb23,
        fb24: fb24,
        fb25: fb25,
        fb26: fb26,
        fb27: fb27,
        fb28: fb28,
        fb29: fb29,
        fb30: fb30,
        fb31: fb31,
      )
    end
  end # struct

  # Filter bank 19 register 2
  struct F19R2
    ADDRESS = BASE_ADDRESS + 0x2dc_u64

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

    # Filter bits
    def fb0 : Bool
      @value.bits_set?(0x1_u32)
    end

    # Filter bits
    def self.fb0 : Bool
      value.fb0
    end

    # Filter bits
    def self.fb0=(value : Bool) : Bool
      self.set(fb0: value)
      value
    end

    # Filter bits
    def fb1 : Bool
      @value.bits_set?(0x2_u32)
    end

    # Filter bits
    def self.fb1 : Bool
      value.fb1
    end

    # Filter bits
    def self.fb1=(value : Bool) : Bool
      self.set(fb1: value)
      value
    end

    # Filter bits
    def fb2 : Bool
      @value.bits_set?(0x4_u32)
    end

    # Filter bits
    def self.fb2 : Bool
      value.fb2
    end

    # Filter bits
    def self.fb2=(value : Bool) : Bool
      self.set(fb2: value)
      value
    end

    # Filter bits
    def fb3 : Bool
      @value.bits_set?(0x8_u32)
    end

    # Filter bits
    def self.fb3 : Bool
      value.fb3
    end

    # Filter bits
    def self.fb3=(value : Bool) : Bool
      self.set(fb3: value)
      value
    end

    # Filter bits
    def fb4 : Bool
      @value.bits_set?(0x10_u32)
    end

    # Filter bits
    def self.fb4 : Bool
      value.fb4
    end

    # Filter bits
    def self.fb4=(value : Bool) : Bool
      self.set(fb4: value)
      value
    end

    # Filter bits
    def fb5 : Bool
      @value.bits_set?(0x20_u32)
    end

    # Filter bits
    def self.fb5 : Bool
      value.fb5
    end

    # Filter bits
    def self.fb5=(value : Bool) : Bool
      self.set(fb5: value)
      value
    end

    # Filter bits
    def fb6 : Bool
      @value.bits_set?(0x40_u32)
    end

    # Filter bits
    def self.fb6 : Bool
      value.fb6
    end

    # Filter bits
    def self.fb6=(value : Bool) : Bool
      self.set(fb6: value)
      value
    end

    # Filter bits
    def fb7 : Bool
      @value.bits_set?(0x80_u32)
    end

    # Filter bits
    def self.fb7 : Bool
      value.fb7
    end

    # Filter bits
    def self.fb7=(value : Bool) : Bool
      self.set(fb7: value)
      value
    end

    # Filter bits
    def fb8 : Bool
      @value.bits_set?(0x100_u32)
    end

    # Filter bits
    def self.fb8 : Bool
      value.fb8
    end

    # Filter bits
    def self.fb8=(value : Bool) : Bool
      self.set(fb8: value)
      value
    end

    # Filter bits
    def fb9 : Bool
      @value.bits_set?(0x200_u32)
    end

    # Filter bits
    def self.fb9 : Bool
      value.fb9
    end

    # Filter bits
    def self.fb9=(value : Bool) : Bool
      self.set(fb9: value)
      value
    end

    # Filter bits
    def fb10 : Bool
      @value.bits_set?(0x400_u32)
    end

    # Filter bits
    def self.fb10 : Bool
      value.fb10
    end

    # Filter bits
    def self.fb10=(value : Bool) : Bool
      self.set(fb10: value)
      value
    end

    # Filter bits
    def fb11 : Bool
      @value.bits_set?(0x800_u32)
    end

    # Filter bits
    def self.fb11 : Bool
      value.fb11
    end

    # Filter bits
    def self.fb11=(value : Bool) : Bool
      self.set(fb11: value)
      value
    end

    # Filter bits
    def fb12 : Bool
      @value.bits_set?(0x1000_u32)
    end

    # Filter bits
    def self.fb12 : Bool
      value.fb12
    end

    # Filter bits
    def self.fb12=(value : Bool) : Bool
      self.set(fb12: value)
      value
    end

    # Filter bits
    def fb13 : Bool
      @value.bits_set?(0x2000_u32)
    end

    # Filter bits
    def self.fb13 : Bool
      value.fb13
    end

    # Filter bits
    def self.fb13=(value : Bool) : Bool
      self.set(fb13: value)
      value
    end

    # Filter bits
    def fb14 : Bool
      @value.bits_set?(0x4000_u32)
    end

    # Filter bits
    def self.fb14 : Bool
      value.fb14
    end

    # Filter bits
    def self.fb14=(value : Bool) : Bool
      self.set(fb14: value)
      value
    end

    # Filter bits
    def fb15 : Bool
      @value.bits_set?(0x8000_u32)
    end

    # Filter bits
    def self.fb15 : Bool
      value.fb15
    end

    # Filter bits
    def self.fb15=(value : Bool) : Bool
      self.set(fb15: value)
      value
    end

    # Filter bits
    def fb16 : Bool
      @value.bits_set?(0x10000_u32)
    end

    # Filter bits
    def self.fb16 : Bool
      value.fb16
    end

    # Filter bits
    def self.fb16=(value : Bool) : Bool
      self.set(fb16: value)
      value
    end

    # Filter bits
    def fb17 : Bool
      @value.bits_set?(0x20000_u32)
    end

    # Filter bits
    def self.fb17 : Bool
      value.fb17
    end

    # Filter bits
    def self.fb17=(value : Bool) : Bool
      self.set(fb17: value)
      value
    end

    # Filter bits
    def fb18 : Bool
      @value.bits_set?(0x40000_u32)
    end

    # Filter bits
    def self.fb18 : Bool
      value.fb18
    end

    # Filter bits
    def self.fb18=(value : Bool) : Bool
      self.set(fb18: value)
      value
    end

    # Filter bits
    def fb19 : Bool
      @value.bits_set?(0x80000_u32)
    end

    # Filter bits
    def self.fb19 : Bool
      value.fb19
    end

    # Filter bits
    def self.fb19=(value : Bool) : Bool
      self.set(fb19: value)
      value
    end

    # Filter bits
    def fb20 : Bool
      @value.bits_set?(0x100000_u32)
    end

    # Filter bits
    def self.fb20 : Bool
      value.fb20
    end

    # Filter bits
    def self.fb20=(value : Bool) : Bool
      self.set(fb20: value)
      value
    end

    # Filter bits
    def fb21 : Bool
      @value.bits_set?(0x200000_u32)
    end

    # Filter bits
    def self.fb21 : Bool
      value.fb21
    end

    # Filter bits
    def self.fb21=(value : Bool) : Bool
      self.set(fb21: value)
      value
    end

    # Filter bits
    def fb22 : Bool
      @value.bits_set?(0x400000_u32)
    end

    # Filter bits
    def self.fb22 : Bool
      value.fb22
    end

    # Filter bits
    def self.fb22=(value : Bool) : Bool
      self.set(fb22: value)
      value
    end

    # Filter bits
    def fb23 : Bool
      @value.bits_set?(0x800000_u32)
    end

    # Filter bits
    def self.fb23 : Bool
      value.fb23
    end

    # Filter bits
    def self.fb23=(value : Bool) : Bool
      self.set(fb23: value)
      value
    end

    # Filter bits
    def fb24 : Bool
      @value.bits_set?(0x1000000_u32)
    end

    # Filter bits
    def self.fb24 : Bool
      value.fb24
    end

    # Filter bits
    def self.fb24=(value : Bool) : Bool
      self.set(fb24: value)
      value
    end

    # Filter bits
    def fb25 : Bool
      @value.bits_set?(0x2000000_u32)
    end

    # Filter bits
    def self.fb25 : Bool
      value.fb25
    end

    # Filter bits
    def self.fb25=(value : Bool) : Bool
      self.set(fb25: value)
      value
    end

    # Filter bits
    def fb26 : Bool
      @value.bits_set?(0x4000000_u32)
    end

    # Filter bits
    def self.fb26 : Bool
      value.fb26
    end

    # Filter bits
    def self.fb26=(value : Bool) : Bool
      self.set(fb26: value)
      value
    end

    # Filter bits
    def fb27 : Bool
      @value.bits_set?(0x8000000_u32)
    end

    # Filter bits
    def self.fb27 : Bool
      value.fb27
    end

    # Filter bits
    def self.fb27=(value : Bool) : Bool
      self.set(fb27: value)
      value
    end

    # Filter bits
    def fb28 : Bool
      @value.bits_set?(0x10000000_u32)
    end

    # Filter bits
    def self.fb28 : Bool
      value.fb28
    end

    # Filter bits
    def self.fb28=(value : Bool) : Bool
      self.set(fb28: value)
      value
    end

    # Filter bits
    def fb29 : Bool
      @value.bits_set?(0x20000000_u32)
    end

    # Filter bits
    def self.fb29 : Bool
      value.fb29
    end

    # Filter bits
    def self.fb29=(value : Bool) : Bool
      self.set(fb29: value)
      value
    end

    # Filter bits
    def fb30 : Bool
      @value.bits_set?(0x40000000_u32)
    end

    # Filter bits
    def self.fb30 : Bool
      value.fb30
    end

    # Filter bits
    def self.fb30=(value : Bool) : Bool
      self.set(fb30: value)
      value
    end

    # Filter bits
    def fb31 : Bool
      @value.bits_set?(0x80000000_u32)
    end

    # Filter bits
    def self.fb31 : Bool
      value.fb31
    end

    # Filter bits
    def self.fb31=(value : Bool) : Bool
      self.set(fb31: value)
      value
    end

    def copy_with(
      *,

      fb0 : Bool? = nil,

      fb1 : Bool? = nil,

      fb2 : Bool? = nil,

      fb3 : Bool? = nil,

      fb4 : Bool? = nil,

      fb5 : Bool? = nil,

      fb6 : Bool? = nil,

      fb7 : Bool? = nil,

      fb8 : Bool? = nil,

      fb9 : Bool? = nil,

      fb10 : Bool? = nil,

      fb11 : Bool? = nil,

      fb12 : Bool? = nil,

      fb13 : Bool? = nil,

      fb14 : Bool? = nil,

      fb15 : Bool? = nil,

      fb16 : Bool? = nil,

      fb17 : Bool? = nil,

      fb18 : Bool? = nil,

      fb19 : Bool? = nil,

      fb20 : Bool? = nil,

      fb21 : Bool? = nil,

      fb22 : Bool? = nil,

      fb23 : Bool? = nil,

      fb24 : Bool? = nil,

      fb25 : Bool? = nil,

      fb26 : Bool? = nil,

      fb27 : Bool? = nil,

      fb28 : Bool? = nil,

      fb29 : Bool? = nil,

      fb30 : Bool? = nil,

      fb31 : Bool? = nil
    ) : self
      value = @value

      unless fb0.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(fb0.to_int).&(0x1_u32) << 0
      end

      unless fb1.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(fb1.to_int).&(0x1_u32) << 1
      end

      unless fb2.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(fb2.to_int).&(0x1_u32) << 2
      end

      unless fb3.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(fb3.to_int).&(0x1_u32) << 3
      end

      unless fb4.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(fb4.to_int).&(0x1_u32) << 4
      end

      unless fb5.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(fb5.to_int).&(0x1_u32) << 5
      end

      unless fb6.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(fb6.to_int).&(0x1_u32) << 6
      end

      unless fb7.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(fb7.to_int).&(0x1_u32) << 7
      end

      unless fb8.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(fb8.to_int).&(0x1_u32) << 8
      end

      unless fb9.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(fb9.to_int).&(0x1_u32) << 9
      end

      unless fb10.nil?
        value = (value & 0xfffffbff_u32) |
                UInt32.new!(fb10.to_int).&(0x1_u32) << 10
      end

      unless fb11.nil?
        value = (value & 0xfffff7ff_u32) |
                UInt32.new!(fb11.to_int).&(0x1_u32) << 11
      end

      unless fb12.nil?
        value = (value & 0xffffefff_u32) |
                UInt32.new!(fb12.to_int).&(0x1_u32) << 12
      end

      unless fb13.nil?
        value = (value & 0xffffdfff_u32) |
                UInt32.new!(fb13.to_int).&(0x1_u32) << 13
      end

      unless fb14.nil?
        value = (value & 0xffffbfff_u32) |
                UInt32.new!(fb14.to_int).&(0x1_u32) << 14
      end

      unless fb15.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(fb15.to_int).&(0x1_u32) << 15
      end

      unless fb16.nil?
        value = (value & 0xfffeffff_u32) |
                UInt32.new!(fb16.to_int).&(0x1_u32) << 16
      end

      unless fb17.nil?
        value = (value & 0xfffdffff_u32) |
                UInt32.new!(fb17.to_int).&(0x1_u32) << 17
      end

      unless fb18.nil?
        value = (value & 0xfffbffff_u32) |
                UInt32.new!(fb18.to_int).&(0x1_u32) << 18
      end

      unless fb19.nil?
        value = (value & 0xfff7ffff_u32) |
                UInt32.new!(fb19.to_int).&(0x1_u32) << 19
      end

      unless fb20.nil?
        value = (value & 0xffefffff_u32) |
                UInt32.new!(fb20.to_int).&(0x1_u32) << 20
      end

      unless fb21.nil?
        value = (value & 0xffdfffff_u32) |
                UInt32.new!(fb21.to_int).&(0x1_u32) << 21
      end

      unless fb22.nil?
        value = (value & 0xffbfffff_u32) |
                UInt32.new!(fb22.to_int).&(0x1_u32) << 22
      end

      unless fb23.nil?
        value = (value & 0xff7fffff_u32) |
                UInt32.new!(fb23.to_int).&(0x1_u32) << 23
      end

      unless fb24.nil?
        value = (value & 0xfeffffff_u32) |
                UInt32.new!(fb24.to_int).&(0x1_u32) << 24
      end

      unless fb25.nil?
        value = (value & 0xfdffffff_u32) |
                UInt32.new!(fb25.to_int).&(0x1_u32) << 25
      end

      unless fb26.nil?
        value = (value & 0xfbffffff_u32) |
                UInt32.new!(fb26.to_int).&(0x1_u32) << 26
      end

      unless fb27.nil?
        value = (value & 0xf7ffffff_u32) |
                UInt32.new!(fb27.to_int).&(0x1_u32) << 27
      end

      unless fb28.nil?
        value = (value & 0xefffffff_u32) |
                UInt32.new!(fb28.to_int).&(0x1_u32) << 28
      end

      unless fb29.nil?
        value = (value & 0xdfffffff_u32) |
                UInt32.new!(fb29.to_int).&(0x1_u32) << 29
      end

      unless fb30.nil?
        value = (value & 0xbfffffff_u32) |
                UInt32.new!(fb30.to_int).&(0x1_u32) << 30
      end

      unless fb31.nil?
        value = (value & 0x7fffffff_u32) |
                UInt32.new!(fb31.to_int).&(0x1_u32) << 31
      end

      self.class.new(value)
    end

    def self.set(
      *,
      fb0 : Bool? = nil,
      fb1 : Bool? = nil,
      fb2 : Bool? = nil,
      fb3 : Bool? = nil,
      fb4 : Bool? = nil,
      fb5 : Bool? = nil,
      fb6 : Bool? = nil,
      fb7 : Bool? = nil,
      fb8 : Bool? = nil,
      fb9 : Bool? = nil,
      fb10 : Bool? = nil,
      fb11 : Bool? = nil,
      fb12 : Bool? = nil,
      fb13 : Bool? = nil,
      fb14 : Bool? = nil,
      fb15 : Bool? = nil,
      fb16 : Bool? = nil,
      fb17 : Bool? = nil,
      fb18 : Bool? = nil,
      fb19 : Bool? = nil,
      fb20 : Bool? = nil,
      fb21 : Bool? = nil,
      fb22 : Bool? = nil,
      fb23 : Bool? = nil,
      fb24 : Bool? = nil,
      fb25 : Bool? = nil,
      fb26 : Bool? = nil,
      fb27 : Bool? = nil,
      fb28 : Bool? = nil,
      fb29 : Bool? = nil,
      fb30 : Bool? = nil,
      fb31 : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        fb0: fb0,
        fb1: fb1,
        fb2: fb2,
        fb3: fb3,
        fb4: fb4,
        fb5: fb5,
        fb6: fb6,
        fb7: fb7,
        fb8: fb8,
        fb9: fb9,
        fb10: fb10,
        fb11: fb11,
        fb12: fb12,
        fb13: fb13,
        fb14: fb14,
        fb15: fb15,
        fb16: fb16,
        fb17: fb17,
        fb18: fb18,
        fb19: fb19,
        fb20: fb20,
        fb21: fb21,
        fb22: fb22,
        fb23: fb23,
        fb24: fb24,
        fb25: fb25,
        fb26: fb26,
        fb27: fb27,
        fb28: fb28,
        fb29: fb29,
        fb30: fb30,
        fb31: fb31,
      )
    end
  end # struct

  # Filter bank 20 register 1
  struct F20R1
    ADDRESS = BASE_ADDRESS + 0x2e0_u64

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

    # Filter bits
    def fb0 : Bool
      @value.bits_set?(0x1_u32)
    end

    # Filter bits
    def self.fb0 : Bool
      value.fb0
    end

    # Filter bits
    def self.fb0=(value : Bool) : Bool
      self.set(fb0: value)
      value
    end

    # Filter bits
    def fb1 : Bool
      @value.bits_set?(0x2_u32)
    end

    # Filter bits
    def self.fb1 : Bool
      value.fb1
    end

    # Filter bits
    def self.fb1=(value : Bool) : Bool
      self.set(fb1: value)
      value
    end

    # Filter bits
    def fb2 : Bool
      @value.bits_set?(0x4_u32)
    end

    # Filter bits
    def self.fb2 : Bool
      value.fb2
    end

    # Filter bits
    def self.fb2=(value : Bool) : Bool
      self.set(fb2: value)
      value
    end

    # Filter bits
    def fb3 : Bool
      @value.bits_set?(0x8_u32)
    end

    # Filter bits
    def self.fb3 : Bool
      value.fb3
    end

    # Filter bits
    def self.fb3=(value : Bool) : Bool
      self.set(fb3: value)
      value
    end

    # Filter bits
    def fb4 : Bool
      @value.bits_set?(0x10_u32)
    end

    # Filter bits
    def self.fb4 : Bool
      value.fb4
    end

    # Filter bits
    def self.fb4=(value : Bool) : Bool
      self.set(fb4: value)
      value
    end

    # Filter bits
    def fb5 : Bool
      @value.bits_set?(0x20_u32)
    end

    # Filter bits
    def self.fb5 : Bool
      value.fb5
    end

    # Filter bits
    def self.fb5=(value : Bool) : Bool
      self.set(fb5: value)
      value
    end

    # Filter bits
    def fb6 : Bool
      @value.bits_set?(0x40_u32)
    end

    # Filter bits
    def self.fb6 : Bool
      value.fb6
    end

    # Filter bits
    def self.fb6=(value : Bool) : Bool
      self.set(fb6: value)
      value
    end

    # Filter bits
    def fb7 : Bool
      @value.bits_set?(0x80_u32)
    end

    # Filter bits
    def self.fb7 : Bool
      value.fb7
    end

    # Filter bits
    def self.fb7=(value : Bool) : Bool
      self.set(fb7: value)
      value
    end

    # Filter bits
    def fb8 : Bool
      @value.bits_set?(0x100_u32)
    end

    # Filter bits
    def self.fb8 : Bool
      value.fb8
    end

    # Filter bits
    def self.fb8=(value : Bool) : Bool
      self.set(fb8: value)
      value
    end

    # Filter bits
    def fb9 : Bool
      @value.bits_set?(0x200_u32)
    end

    # Filter bits
    def self.fb9 : Bool
      value.fb9
    end

    # Filter bits
    def self.fb9=(value : Bool) : Bool
      self.set(fb9: value)
      value
    end

    # Filter bits
    def fb10 : Bool
      @value.bits_set?(0x400_u32)
    end

    # Filter bits
    def self.fb10 : Bool
      value.fb10
    end

    # Filter bits
    def self.fb10=(value : Bool) : Bool
      self.set(fb10: value)
      value
    end

    # Filter bits
    def fb11 : Bool
      @value.bits_set?(0x800_u32)
    end

    # Filter bits
    def self.fb11 : Bool
      value.fb11
    end

    # Filter bits
    def self.fb11=(value : Bool) : Bool
      self.set(fb11: value)
      value
    end

    # Filter bits
    def fb12 : Bool
      @value.bits_set?(0x1000_u32)
    end

    # Filter bits
    def self.fb12 : Bool
      value.fb12
    end

    # Filter bits
    def self.fb12=(value : Bool) : Bool
      self.set(fb12: value)
      value
    end

    # Filter bits
    def fb13 : Bool
      @value.bits_set?(0x2000_u32)
    end

    # Filter bits
    def self.fb13 : Bool
      value.fb13
    end

    # Filter bits
    def self.fb13=(value : Bool) : Bool
      self.set(fb13: value)
      value
    end

    # Filter bits
    def fb14 : Bool
      @value.bits_set?(0x4000_u32)
    end

    # Filter bits
    def self.fb14 : Bool
      value.fb14
    end

    # Filter bits
    def self.fb14=(value : Bool) : Bool
      self.set(fb14: value)
      value
    end

    # Filter bits
    def fb15 : Bool
      @value.bits_set?(0x8000_u32)
    end

    # Filter bits
    def self.fb15 : Bool
      value.fb15
    end

    # Filter bits
    def self.fb15=(value : Bool) : Bool
      self.set(fb15: value)
      value
    end

    # Filter bits
    def fb16 : Bool
      @value.bits_set?(0x10000_u32)
    end

    # Filter bits
    def self.fb16 : Bool
      value.fb16
    end

    # Filter bits
    def self.fb16=(value : Bool) : Bool
      self.set(fb16: value)
      value
    end

    # Filter bits
    def fb17 : Bool
      @value.bits_set?(0x20000_u32)
    end

    # Filter bits
    def self.fb17 : Bool
      value.fb17
    end

    # Filter bits
    def self.fb17=(value : Bool) : Bool
      self.set(fb17: value)
      value
    end

    # Filter bits
    def fb18 : Bool
      @value.bits_set?(0x40000_u32)
    end

    # Filter bits
    def self.fb18 : Bool
      value.fb18
    end

    # Filter bits
    def self.fb18=(value : Bool) : Bool
      self.set(fb18: value)
      value
    end

    # Filter bits
    def fb19 : Bool
      @value.bits_set?(0x80000_u32)
    end

    # Filter bits
    def self.fb19 : Bool
      value.fb19
    end

    # Filter bits
    def self.fb19=(value : Bool) : Bool
      self.set(fb19: value)
      value
    end

    # Filter bits
    def fb20 : Bool
      @value.bits_set?(0x100000_u32)
    end

    # Filter bits
    def self.fb20 : Bool
      value.fb20
    end

    # Filter bits
    def self.fb20=(value : Bool) : Bool
      self.set(fb20: value)
      value
    end

    # Filter bits
    def fb21 : Bool
      @value.bits_set?(0x200000_u32)
    end

    # Filter bits
    def self.fb21 : Bool
      value.fb21
    end

    # Filter bits
    def self.fb21=(value : Bool) : Bool
      self.set(fb21: value)
      value
    end

    # Filter bits
    def fb22 : Bool
      @value.bits_set?(0x400000_u32)
    end

    # Filter bits
    def self.fb22 : Bool
      value.fb22
    end

    # Filter bits
    def self.fb22=(value : Bool) : Bool
      self.set(fb22: value)
      value
    end

    # Filter bits
    def fb23 : Bool
      @value.bits_set?(0x800000_u32)
    end

    # Filter bits
    def self.fb23 : Bool
      value.fb23
    end

    # Filter bits
    def self.fb23=(value : Bool) : Bool
      self.set(fb23: value)
      value
    end

    # Filter bits
    def fb24 : Bool
      @value.bits_set?(0x1000000_u32)
    end

    # Filter bits
    def self.fb24 : Bool
      value.fb24
    end

    # Filter bits
    def self.fb24=(value : Bool) : Bool
      self.set(fb24: value)
      value
    end

    # Filter bits
    def fb25 : Bool
      @value.bits_set?(0x2000000_u32)
    end

    # Filter bits
    def self.fb25 : Bool
      value.fb25
    end

    # Filter bits
    def self.fb25=(value : Bool) : Bool
      self.set(fb25: value)
      value
    end

    # Filter bits
    def fb26 : Bool
      @value.bits_set?(0x4000000_u32)
    end

    # Filter bits
    def self.fb26 : Bool
      value.fb26
    end

    # Filter bits
    def self.fb26=(value : Bool) : Bool
      self.set(fb26: value)
      value
    end

    # Filter bits
    def fb27 : Bool
      @value.bits_set?(0x8000000_u32)
    end

    # Filter bits
    def self.fb27 : Bool
      value.fb27
    end

    # Filter bits
    def self.fb27=(value : Bool) : Bool
      self.set(fb27: value)
      value
    end

    # Filter bits
    def fb28 : Bool
      @value.bits_set?(0x10000000_u32)
    end

    # Filter bits
    def self.fb28 : Bool
      value.fb28
    end

    # Filter bits
    def self.fb28=(value : Bool) : Bool
      self.set(fb28: value)
      value
    end

    # Filter bits
    def fb29 : Bool
      @value.bits_set?(0x20000000_u32)
    end

    # Filter bits
    def self.fb29 : Bool
      value.fb29
    end

    # Filter bits
    def self.fb29=(value : Bool) : Bool
      self.set(fb29: value)
      value
    end

    # Filter bits
    def fb30 : Bool
      @value.bits_set?(0x40000000_u32)
    end

    # Filter bits
    def self.fb30 : Bool
      value.fb30
    end

    # Filter bits
    def self.fb30=(value : Bool) : Bool
      self.set(fb30: value)
      value
    end

    # Filter bits
    def fb31 : Bool
      @value.bits_set?(0x80000000_u32)
    end

    # Filter bits
    def self.fb31 : Bool
      value.fb31
    end

    # Filter bits
    def self.fb31=(value : Bool) : Bool
      self.set(fb31: value)
      value
    end

    def copy_with(
      *,

      fb0 : Bool? = nil,

      fb1 : Bool? = nil,

      fb2 : Bool? = nil,

      fb3 : Bool? = nil,

      fb4 : Bool? = nil,

      fb5 : Bool? = nil,

      fb6 : Bool? = nil,

      fb7 : Bool? = nil,

      fb8 : Bool? = nil,

      fb9 : Bool? = nil,

      fb10 : Bool? = nil,

      fb11 : Bool? = nil,

      fb12 : Bool? = nil,

      fb13 : Bool? = nil,

      fb14 : Bool? = nil,

      fb15 : Bool? = nil,

      fb16 : Bool? = nil,

      fb17 : Bool? = nil,

      fb18 : Bool? = nil,

      fb19 : Bool? = nil,

      fb20 : Bool? = nil,

      fb21 : Bool? = nil,

      fb22 : Bool? = nil,

      fb23 : Bool? = nil,

      fb24 : Bool? = nil,

      fb25 : Bool? = nil,

      fb26 : Bool? = nil,

      fb27 : Bool? = nil,

      fb28 : Bool? = nil,

      fb29 : Bool? = nil,

      fb30 : Bool? = nil,

      fb31 : Bool? = nil
    ) : self
      value = @value

      unless fb0.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(fb0.to_int).&(0x1_u32) << 0
      end

      unless fb1.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(fb1.to_int).&(0x1_u32) << 1
      end

      unless fb2.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(fb2.to_int).&(0x1_u32) << 2
      end

      unless fb3.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(fb3.to_int).&(0x1_u32) << 3
      end

      unless fb4.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(fb4.to_int).&(0x1_u32) << 4
      end

      unless fb5.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(fb5.to_int).&(0x1_u32) << 5
      end

      unless fb6.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(fb6.to_int).&(0x1_u32) << 6
      end

      unless fb7.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(fb7.to_int).&(0x1_u32) << 7
      end

      unless fb8.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(fb8.to_int).&(0x1_u32) << 8
      end

      unless fb9.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(fb9.to_int).&(0x1_u32) << 9
      end

      unless fb10.nil?
        value = (value & 0xfffffbff_u32) |
                UInt32.new!(fb10.to_int).&(0x1_u32) << 10
      end

      unless fb11.nil?
        value = (value & 0xfffff7ff_u32) |
                UInt32.new!(fb11.to_int).&(0x1_u32) << 11
      end

      unless fb12.nil?
        value = (value & 0xffffefff_u32) |
                UInt32.new!(fb12.to_int).&(0x1_u32) << 12
      end

      unless fb13.nil?
        value = (value & 0xffffdfff_u32) |
                UInt32.new!(fb13.to_int).&(0x1_u32) << 13
      end

      unless fb14.nil?
        value = (value & 0xffffbfff_u32) |
                UInt32.new!(fb14.to_int).&(0x1_u32) << 14
      end

      unless fb15.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(fb15.to_int).&(0x1_u32) << 15
      end

      unless fb16.nil?
        value = (value & 0xfffeffff_u32) |
                UInt32.new!(fb16.to_int).&(0x1_u32) << 16
      end

      unless fb17.nil?
        value = (value & 0xfffdffff_u32) |
                UInt32.new!(fb17.to_int).&(0x1_u32) << 17
      end

      unless fb18.nil?
        value = (value & 0xfffbffff_u32) |
                UInt32.new!(fb18.to_int).&(0x1_u32) << 18
      end

      unless fb19.nil?
        value = (value & 0xfff7ffff_u32) |
                UInt32.new!(fb19.to_int).&(0x1_u32) << 19
      end

      unless fb20.nil?
        value = (value & 0xffefffff_u32) |
                UInt32.new!(fb20.to_int).&(0x1_u32) << 20
      end

      unless fb21.nil?
        value = (value & 0xffdfffff_u32) |
                UInt32.new!(fb21.to_int).&(0x1_u32) << 21
      end

      unless fb22.nil?
        value = (value & 0xffbfffff_u32) |
                UInt32.new!(fb22.to_int).&(0x1_u32) << 22
      end

      unless fb23.nil?
        value = (value & 0xff7fffff_u32) |
                UInt32.new!(fb23.to_int).&(0x1_u32) << 23
      end

      unless fb24.nil?
        value = (value & 0xfeffffff_u32) |
                UInt32.new!(fb24.to_int).&(0x1_u32) << 24
      end

      unless fb25.nil?
        value = (value & 0xfdffffff_u32) |
                UInt32.new!(fb25.to_int).&(0x1_u32) << 25
      end

      unless fb26.nil?
        value = (value & 0xfbffffff_u32) |
                UInt32.new!(fb26.to_int).&(0x1_u32) << 26
      end

      unless fb27.nil?
        value = (value & 0xf7ffffff_u32) |
                UInt32.new!(fb27.to_int).&(0x1_u32) << 27
      end

      unless fb28.nil?
        value = (value & 0xefffffff_u32) |
                UInt32.new!(fb28.to_int).&(0x1_u32) << 28
      end

      unless fb29.nil?
        value = (value & 0xdfffffff_u32) |
                UInt32.new!(fb29.to_int).&(0x1_u32) << 29
      end

      unless fb30.nil?
        value = (value & 0xbfffffff_u32) |
                UInt32.new!(fb30.to_int).&(0x1_u32) << 30
      end

      unless fb31.nil?
        value = (value & 0x7fffffff_u32) |
                UInt32.new!(fb31.to_int).&(0x1_u32) << 31
      end

      self.class.new(value)
    end

    def self.set(
      *,
      fb0 : Bool? = nil,
      fb1 : Bool? = nil,
      fb2 : Bool? = nil,
      fb3 : Bool? = nil,
      fb4 : Bool? = nil,
      fb5 : Bool? = nil,
      fb6 : Bool? = nil,
      fb7 : Bool? = nil,
      fb8 : Bool? = nil,
      fb9 : Bool? = nil,
      fb10 : Bool? = nil,
      fb11 : Bool? = nil,
      fb12 : Bool? = nil,
      fb13 : Bool? = nil,
      fb14 : Bool? = nil,
      fb15 : Bool? = nil,
      fb16 : Bool? = nil,
      fb17 : Bool? = nil,
      fb18 : Bool? = nil,
      fb19 : Bool? = nil,
      fb20 : Bool? = nil,
      fb21 : Bool? = nil,
      fb22 : Bool? = nil,
      fb23 : Bool? = nil,
      fb24 : Bool? = nil,
      fb25 : Bool? = nil,
      fb26 : Bool? = nil,
      fb27 : Bool? = nil,
      fb28 : Bool? = nil,
      fb29 : Bool? = nil,
      fb30 : Bool? = nil,
      fb31 : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        fb0: fb0,
        fb1: fb1,
        fb2: fb2,
        fb3: fb3,
        fb4: fb4,
        fb5: fb5,
        fb6: fb6,
        fb7: fb7,
        fb8: fb8,
        fb9: fb9,
        fb10: fb10,
        fb11: fb11,
        fb12: fb12,
        fb13: fb13,
        fb14: fb14,
        fb15: fb15,
        fb16: fb16,
        fb17: fb17,
        fb18: fb18,
        fb19: fb19,
        fb20: fb20,
        fb21: fb21,
        fb22: fb22,
        fb23: fb23,
        fb24: fb24,
        fb25: fb25,
        fb26: fb26,
        fb27: fb27,
        fb28: fb28,
        fb29: fb29,
        fb30: fb30,
        fb31: fb31,
      )
    end
  end # struct

  # Filter bank 20 register 2
  struct F20R2
    ADDRESS = BASE_ADDRESS + 0x2e4_u64

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

    # Filter bits
    def fb0 : Bool
      @value.bits_set?(0x1_u32)
    end

    # Filter bits
    def self.fb0 : Bool
      value.fb0
    end

    # Filter bits
    def self.fb0=(value : Bool) : Bool
      self.set(fb0: value)
      value
    end

    # Filter bits
    def fb1 : Bool
      @value.bits_set?(0x2_u32)
    end

    # Filter bits
    def self.fb1 : Bool
      value.fb1
    end

    # Filter bits
    def self.fb1=(value : Bool) : Bool
      self.set(fb1: value)
      value
    end

    # Filter bits
    def fb2 : Bool
      @value.bits_set?(0x4_u32)
    end

    # Filter bits
    def self.fb2 : Bool
      value.fb2
    end

    # Filter bits
    def self.fb2=(value : Bool) : Bool
      self.set(fb2: value)
      value
    end

    # Filter bits
    def fb3 : Bool
      @value.bits_set?(0x8_u32)
    end

    # Filter bits
    def self.fb3 : Bool
      value.fb3
    end

    # Filter bits
    def self.fb3=(value : Bool) : Bool
      self.set(fb3: value)
      value
    end

    # Filter bits
    def fb4 : Bool
      @value.bits_set?(0x10_u32)
    end

    # Filter bits
    def self.fb4 : Bool
      value.fb4
    end

    # Filter bits
    def self.fb4=(value : Bool) : Bool
      self.set(fb4: value)
      value
    end

    # Filter bits
    def fb5 : Bool
      @value.bits_set?(0x20_u32)
    end

    # Filter bits
    def self.fb5 : Bool
      value.fb5
    end

    # Filter bits
    def self.fb5=(value : Bool) : Bool
      self.set(fb5: value)
      value
    end

    # Filter bits
    def fb6 : Bool
      @value.bits_set?(0x40_u32)
    end

    # Filter bits
    def self.fb6 : Bool
      value.fb6
    end

    # Filter bits
    def self.fb6=(value : Bool) : Bool
      self.set(fb6: value)
      value
    end

    # Filter bits
    def fb7 : Bool
      @value.bits_set?(0x80_u32)
    end

    # Filter bits
    def self.fb7 : Bool
      value.fb7
    end

    # Filter bits
    def self.fb7=(value : Bool) : Bool
      self.set(fb7: value)
      value
    end

    # Filter bits
    def fb8 : Bool
      @value.bits_set?(0x100_u32)
    end

    # Filter bits
    def self.fb8 : Bool
      value.fb8
    end

    # Filter bits
    def self.fb8=(value : Bool) : Bool
      self.set(fb8: value)
      value
    end

    # Filter bits
    def fb9 : Bool
      @value.bits_set?(0x200_u32)
    end

    # Filter bits
    def self.fb9 : Bool
      value.fb9
    end

    # Filter bits
    def self.fb9=(value : Bool) : Bool
      self.set(fb9: value)
      value
    end

    # Filter bits
    def fb10 : Bool
      @value.bits_set?(0x400_u32)
    end

    # Filter bits
    def self.fb10 : Bool
      value.fb10
    end

    # Filter bits
    def self.fb10=(value : Bool) : Bool
      self.set(fb10: value)
      value
    end

    # Filter bits
    def fb11 : Bool
      @value.bits_set?(0x800_u32)
    end

    # Filter bits
    def self.fb11 : Bool
      value.fb11
    end

    # Filter bits
    def self.fb11=(value : Bool) : Bool
      self.set(fb11: value)
      value
    end

    # Filter bits
    def fb12 : Bool
      @value.bits_set?(0x1000_u32)
    end

    # Filter bits
    def self.fb12 : Bool
      value.fb12
    end

    # Filter bits
    def self.fb12=(value : Bool) : Bool
      self.set(fb12: value)
      value
    end

    # Filter bits
    def fb13 : Bool
      @value.bits_set?(0x2000_u32)
    end

    # Filter bits
    def self.fb13 : Bool
      value.fb13
    end

    # Filter bits
    def self.fb13=(value : Bool) : Bool
      self.set(fb13: value)
      value
    end

    # Filter bits
    def fb14 : Bool
      @value.bits_set?(0x4000_u32)
    end

    # Filter bits
    def self.fb14 : Bool
      value.fb14
    end

    # Filter bits
    def self.fb14=(value : Bool) : Bool
      self.set(fb14: value)
      value
    end

    # Filter bits
    def fb15 : Bool
      @value.bits_set?(0x8000_u32)
    end

    # Filter bits
    def self.fb15 : Bool
      value.fb15
    end

    # Filter bits
    def self.fb15=(value : Bool) : Bool
      self.set(fb15: value)
      value
    end

    # Filter bits
    def fb16 : Bool
      @value.bits_set?(0x10000_u32)
    end

    # Filter bits
    def self.fb16 : Bool
      value.fb16
    end

    # Filter bits
    def self.fb16=(value : Bool) : Bool
      self.set(fb16: value)
      value
    end

    # Filter bits
    def fb17 : Bool
      @value.bits_set?(0x20000_u32)
    end

    # Filter bits
    def self.fb17 : Bool
      value.fb17
    end

    # Filter bits
    def self.fb17=(value : Bool) : Bool
      self.set(fb17: value)
      value
    end

    # Filter bits
    def fb18 : Bool
      @value.bits_set?(0x40000_u32)
    end

    # Filter bits
    def self.fb18 : Bool
      value.fb18
    end

    # Filter bits
    def self.fb18=(value : Bool) : Bool
      self.set(fb18: value)
      value
    end

    # Filter bits
    def fb19 : Bool
      @value.bits_set?(0x80000_u32)
    end

    # Filter bits
    def self.fb19 : Bool
      value.fb19
    end

    # Filter bits
    def self.fb19=(value : Bool) : Bool
      self.set(fb19: value)
      value
    end

    # Filter bits
    def fb20 : Bool
      @value.bits_set?(0x100000_u32)
    end

    # Filter bits
    def self.fb20 : Bool
      value.fb20
    end

    # Filter bits
    def self.fb20=(value : Bool) : Bool
      self.set(fb20: value)
      value
    end

    # Filter bits
    def fb21 : Bool
      @value.bits_set?(0x200000_u32)
    end

    # Filter bits
    def self.fb21 : Bool
      value.fb21
    end

    # Filter bits
    def self.fb21=(value : Bool) : Bool
      self.set(fb21: value)
      value
    end

    # Filter bits
    def fb22 : Bool
      @value.bits_set?(0x400000_u32)
    end

    # Filter bits
    def self.fb22 : Bool
      value.fb22
    end

    # Filter bits
    def self.fb22=(value : Bool) : Bool
      self.set(fb22: value)
      value
    end

    # Filter bits
    def fb23 : Bool
      @value.bits_set?(0x800000_u32)
    end

    # Filter bits
    def self.fb23 : Bool
      value.fb23
    end

    # Filter bits
    def self.fb23=(value : Bool) : Bool
      self.set(fb23: value)
      value
    end

    # Filter bits
    def fb24 : Bool
      @value.bits_set?(0x1000000_u32)
    end

    # Filter bits
    def self.fb24 : Bool
      value.fb24
    end

    # Filter bits
    def self.fb24=(value : Bool) : Bool
      self.set(fb24: value)
      value
    end

    # Filter bits
    def fb25 : Bool
      @value.bits_set?(0x2000000_u32)
    end

    # Filter bits
    def self.fb25 : Bool
      value.fb25
    end

    # Filter bits
    def self.fb25=(value : Bool) : Bool
      self.set(fb25: value)
      value
    end

    # Filter bits
    def fb26 : Bool
      @value.bits_set?(0x4000000_u32)
    end

    # Filter bits
    def self.fb26 : Bool
      value.fb26
    end

    # Filter bits
    def self.fb26=(value : Bool) : Bool
      self.set(fb26: value)
      value
    end

    # Filter bits
    def fb27 : Bool
      @value.bits_set?(0x8000000_u32)
    end

    # Filter bits
    def self.fb27 : Bool
      value.fb27
    end

    # Filter bits
    def self.fb27=(value : Bool) : Bool
      self.set(fb27: value)
      value
    end

    # Filter bits
    def fb28 : Bool
      @value.bits_set?(0x10000000_u32)
    end

    # Filter bits
    def self.fb28 : Bool
      value.fb28
    end

    # Filter bits
    def self.fb28=(value : Bool) : Bool
      self.set(fb28: value)
      value
    end

    # Filter bits
    def fb29 : Bool
      @value.bits_set?(0x20000000_u32)
    end

    # Filter bits
    def self.fb29 : Bool
      value.fb29
    end

    # Filter bits
    def self.fb29=(value : Bool) : Bool
      self.set(fb29: value)
      value
    end

    # Filter bits
    def fb30 : Bool
      @value.bits_set?(0x40000000_u32)
    end

    # Filter bits
    def self.fb30 : Bool
      value.fb30
    end

    # Filter bits
    def self.fb30=(value : Bool) : Bool
      self.set(fb30: value)
      value
    end

    # Filter bits
    def fb31 : Bool
      @value.bits_set?(0x80000000_u32)
    end

    # Filter bits
    def self.fb31 : Bool
      value.fb31
    end

    # Filter bits
    def self.fb31=(value : Bool) : Bool
      self.set(fb31: value)
      value
    end

    def copy_with(
      *,

      fb0 : Bool? = nil,

      fb1 : Bool? = nil,

      fb2 : Bool? = nil,

      fb3 : Bool? = nil,

      fb4 : Bool? = nil,

      fb5 : Bool? = nil,

      fb6 : Bool? = nil,

      fb7 : Bool? = nil,

      fb8 : Bool? = nil,

      fb9 : Bool? = nil,

      fb10 : Bool? = nil,

      fb11 : Bool? = nil,

      fb12 : Bool? = nil,

      fb13 : Bool? = nil,

      fb14 : Bool? = nil,

      fb15 : Bool? = nil,

      fb16 : Bool? = nil,

      fb17 : Bool? = nil,

      fb18 : Bool? = nil,

      fb19 : Bool? = nil,

      fb20 : Bool? = nil,

      fb21 : Bool? = nil,

      fb22 : Bool? = nil,

      fb23 : Bool? = nil,

      fb24 : Bool? = nil,

      fb25 : Bool? = nil,

      fb26 : Bool? = nil,

      fb27 : Bool? = nil,

      fb28 : Bool? = nil,

      fb29 : Bool? = nil,

      fb30 : Bool? = nil,

      fb31 : Bool? = nil
    ) : self
      value = @value

      unless fb0.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(fb0.to_int).&(0x1_u32) << 0
      end

      unless fb1.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(fb1.to_int).&(0x1_u32) << 1
      end

      unless fb2.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(fb2.to_int).&(0x1_u32) << 2
      end

      unless fb3.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(fb3.to_int).&(0x1_u32) << 3
      end

      unless fb4.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(fb4.to_int).&(0x1_u32) << 4
      end

      unless fb5.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(fb5.to_int).&(0x1_u32) << 5
      end

      unless fb6.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(fb6.to_int).&(0x1_u32) << 6
      end

      unless fb7.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(fb7.to_int).&(0x1_u32) << 7
      end

      unless fb8.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(fb8.to_int).&(0x1_u32) << 8
      end

      unless fb9.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(fb9.to_int).&(0x1_u32) << 9
      end

      unless fb10.nil?
        value = (value & 0xfffffbff_u32) |
                UInt32.new!(fb10.to_int).&(0x1_u32) << 10
      end

      unless fb11.nil?
        value = (value & 0xfffff7ff_u32) |
                UInt32.new!(fb11.to_int).&(0x1_u32) << 11
      end

      unless fb12.nil?
        value = (value & 0xffffefff_u32) |
                UInt32.new!(fb12.to_int).&(0x1_u32) << 12
      end

      unless fb13.nil?
        value = (value & 0xffffdfff_u32) |
                UInt32.new!(fb13.to_int).&(0x1_u32) << 13
      end

      unless fb14.nil?
        value = (value & 0xffffbfff_u32) |
                UInt32.new!(fb14.to_int).&(0x1_u32) << 14
      end

      unless fb15.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(fb15.to_int).&(0x1_u32) << 15
      end

      unless fb16.nil?
        value = (value & 0xfffeffff_u32) |
                UInt32.new!(fb16.to_int).&(0x1_u32) << 16
      end

      unless fb17.nil?
        value = (value & 0xfffdffff_u32) |
                UInt32.new!(fb17.to_int).&(0x1_u32) << 17
      end

      unless fb18.nil?
        value = (value & 0xfffbffff_u32) |
                UInt32.new!(fb18.to_int).&(0x1_u32) << 18
      end

      unless fb19.nil?
        value = (value & 0xfff7ffff_u32) |
                UInt32.new!(fb19.to_int).&(0x1_u32) << 19
      end

      unless fb20.nil?
        value = (value & 0xffefffff_u32) |
                UInt32.new!(fb20.to_int).&(0x1_u32) << 20
      end

      unless fb21.nil?
        value = (value & 0xffdfffff_u32) |
                UInt32.new!(fb21.to_int).&(0x1_u32) << 21
      end

      unless fb22.nil?
        value = (value & 0xffbfffff_u32) |
                UInt32.new!(fb22.to_int).&(0x1_u32) << 22
      end

      unless fb23.nil?
        value = (value & 0xff7fffff_u32) |
                UInt32.new!(fb23.to_int).&(0x1_u32) << 23
      end

      unless fb24.nil?
        value = (value & 0xfeffffff_u32) |
                UInt32.new!(fb24.to_int).&(0x1_u32) << 24
      end

      unless fb25.nil?
        value = (value & 0xfdffffff_u32) |
                UInt32.new!(fb25.to_int).&(0x1_u32) << 25
      end

      unless fb26.nil?
        value = (value & 0xfbffffff_u32) |
                UInt32.new!(fb26.to_int).&(0x1_u32) << 26
      end

      unless fb27.nil?
        value = (value & 0xf7ffffff_u32) |
                UInt32.new!(fb27.to_int).&(0x1_u32) << 27
      end

      unless fb28.nil?
        value = (value & 0xefffffff_u32) |
                UInt32.new!(fb28.to_int).&(0x1_u32) << 28
      end

      unless fb29.nil?
        value = (value & 0xdfffffff_u32) |
                UInt32.new!(fb29.to_int).&(0x1_u32) << 29
      end

      unless fb30.nil?
        value = (value & 0xbfffffff_u32) |
                UInt32.new!(fb30.to_int).&(0x1_u32) << 30
      end

      unless fb31.nil?
        value = (value & 0x7fffffff_u32) |
                UInt32.new!(fb31.to_int).&(0x1_u32) << 31
      end

      self.class.new(value)
    end

    def self.set(
      *,
      fb0 : Bool? = nil,
      fb1 : Bool? = nil,
      fb2 : Bool? = nil,
      fb3 : Bool? = nil,
      fb4 : Bool? = nil,
      fb5 : Bool? = nil,
      fb6 : Bool? = nil,
      fb7 : Bool? = nil,
      fb8 : Bool? = nil,
      fb9 : Bool? = nil,
      fb10 : Bool? = nil,
      fb11 : Bool? = nil,
      fb12 : Bool? = nil,
      fb13 : Bool? = nil,
      fb14 : Bool? = nil,
      fb15 : Bool? = nil,
      fb16 : Bool? = nil,
      fb17 : Bool? = nil,
      fb18 : Bool? = nil,
      fb19 : Bool? = nil,
      fb20 : Bool? = nil,
      fb21 : Bool? = nil,
      fb22 : Bool? = nil,
      fb23 : Bool? = nil,
      fb24 : Bool? = nil,
      fb25 : Bool? = nil,
      fb26 : Bool? = nil,
      fb27 : Bool? = nil,
      fb28 : Bool? = nil,
      fb29 : Bool? = nil,
      fb30 : Bool? = nil,
      fb31 : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        fb0: fb0,
        fb1: fb1,
        fb2: fb2,
        fb3: fb3,
        fb4: fb4,
        fb5: fb5,
        fb6: fb6,
        fb7: fb7,
        fb8: fb8,
        fb9: fb9,
        fb10: fb10,
        fb11: fb11,
        fb12: fb12,
        fb13: fb13,
        fb14: fb14,
        fb15: fb15,
        fb16: fb16,
        fb17: fb17,
        fb18: fb18,
        fb19: fb19,
        fb20: fb20,
        fb21: fb21,
        fb22: fb22,
        fb23: fb23,
        fb24: fb24,
        fb25: fb25,
        fb26: fb26,
        fb27: fb27,
        fb28: fb28,
        fb29: fb29,
        fb30: fb30,
        fb31: fb31,
      )
    end
  end # struct

  # Filter bank 21 register 1
  struct F21R1
    ADDRESS = BASE_ADDRESS + 0x2e8_u64

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

    # Filter bits
    def fb0 : Bool
      @value.bits_set?(0x1_u32)
    end

    # Filter bits
    def self.fb0 : Bool
      value.fb0
    end

    # Filter bits
    def self.fb0=(value : Bool) : Bool
      self.set(fb0: value)
      value
    end

    # Filter bits
    def fb1 : Bool
      @value.bits_set?(0x2_u32)
    end

    # Filter bits
    def self.fb1 : Bool
      value.fb1
    end

    # Filter bits
    def self.fb1=(value : Bool) : Bool
      self.set(fb1: value)
      value
    end

    # Filter bits
    def fb2 : Bool
      @value.bits_set?(0x4_u32)
    end

    # Filter bits
    def self.fb2 : Bool
      value.fb2
    end

    # Filter bits
    def self.fb2=(value : Bool) : Bool
      self.set(fb2: value)
      value
    end

    # Filter bits
    def fb3 : Bool
      @value.bits_set?(0x8_u32)
    end

    # Filter bits
    def self.fb3 : Bool
      value.fb3
    end

    # Filter bits
    def self.fb3=(value : Bool) : Bool
      self.set(fb3: value)
      value
    end

    # Filter bits
    def fb4 : Bool
      @value.bits_set?(0x10_u32)
    end

    # Filter bits
    def self.fb4 : Bool
      value.fb4
    end

    # Filter bits
    def self.fb4=(value : Bool) : Bool
      self.set(fb4: value)
      value
    end

    # Filter bits
    def fb5 : Bool
      @value.bits_set?(0x20_u32)
    end

    # Filter bits
    def self.fb5 : Bool
      value.fb5
    end

    # Filter bits
    def self.fb5=(value : Bool) : Bool
      self.set(fb5: value)
      value
    end

    # Filter bits
    def fb6 : Bool
      @value.bits_set?(0x40_u32)
    end

    # Filter bits
    def self.fb6 : Bool
      value.fb6
    end

    # Filter bits
    def self.fb6=(value : Bool) : Bool
      self.set(fb6: value)
      value
    end

    # Filter bits
    def fb7 : Bool
      @value.bits_set?(0x80_u32)
    end

    # Filter bits
    def self.fb7 : Bool
      value.fb7
    end

    # Filter bits
    def self.fb7=(value : Bool) : Bool
      self.set(fb7: value)
      value
    end

    # Filter bits
    def fb8 : Bool
      @value.bits_set?(0x100_u32)
    end

    # Filter bits
    def self.fb8 : Bool
      value.fb8
    end

    # Filter bits
    def self.fb8=(value : Bool) : Bool
      self.set(fb8: value)
      value
    end

    # Filter bits
    def fb9 : Bool
      @value.bits_set?(0x200_u32)
    end

    # Filter bits
    def self.fb9 : Bool
      value.fb9
    end

    # Filter bits
    def self.fb9=(value : Bool) : Bool
      self.set(fb9: value)
      value
    end

    # Filter bits
    def fb10 : Bool
      @value.bits_set?(0x400_u32)
    end

    # Filter bits
    def self.fb10 : Bool
      value.fb10
    end

    # Filter bits
    def self.fb10=(value : Bool) : Bool
      self.set(fb10: value)
      value
    end

    # Filter bits
    def fb11 : Bool
      @value.bits_set?(0x800_u32)
    end

    # Filter bits
    def self.fb11 : Bool
      value.fb11
    end

    # Filter bits
    def self.fb11=(value : Bool) : Bool
      self.set(fb11: value)
      value
    end

    # Filter bits
    def fb12 : Bool
      @value.bits_set?(0x1000_u32)
    end

    # Filter bits
    def self.fb12 : Bool
      value.fb12
    end

    # Filter bits
    def self.fb12=(value : Bool) : Bool
      self.set(fb12: value)
      value
    end

    # Filter bits
    def fb13 : Bool
      @value.bits_set?(0x2000_u32)
    end

    # Filter bits
    def self.fb13 : Bool
      value.fb13
    end

    # Filter bits
    def self.fb13=(value : Bool) : Bool
      self.set(fb13: value)
      value
    end

    # Filter bits
    def fb14 : Bool
      @value.bits_set?(0x4000_u32)
    end

    # Filter bits
    def self.fb14 : Bool
      value.fb14
    end

    # Filter bits
    def self.fb14=(value : Bool) : Bool
      self.set(fb14: value)
      value
    end

    # Filter bits
    def fb15 : Bool
      @value.bits_set?(0x8000_u32)
    end

    # Filter bits
    def self.fb15 : Bool
      value.fb15
    end

    # Filter bits
    def self.fb15=(value : Bool) : Bool
      self.set(fb15: value)
      value
    end

    # Filter bits
    def fb16 : Bool
      @value.bits_set?(0x10000_u32)
    end

    # Filter bits
    def self.fb16 : Bool
      value.fb16
    end

    # Filter bits
    def self.fb16=(value : Bool) : Bool
      self.set(fb16: value)
      value
    end

    # Filter bits
    def fb17 : Bool
      @value.bits_set?(0x20000_u32)
    end

    # Filter bits
    def self.fb17 : Bool
      value.fb17
    end

    # Filter bits
    def self.fb17=(value : Bool) : Bool
      self.set(fb17: value)
      value
    end

    # Filter bits
    def fb18 : Bool
      @value.bits_set?(0x40000_u32)
    end

    # Filter bits
    def self.fb18 : Bool
      value.fb18
    end

    # Filter bits
    def self.fb18=(value : Bool) : Bool
      self.set(fb18: value)
      value
    end

    # Filter bits
    def fb19 : Bool
      @value.bits_set?(0x80000_u32)
    end

    # Filter bits
    def self.fb19 : Bool
      value.fb19
    end

    # Filter bits
    def self.fb19=(value : Bool) : Bool
      self.set(fb19: value)
      value
    end

    # Filter bits
    def fb20 : Bool
      @value.bits_set?(0x100000_u32)
    end

    # Filter bits
    def self.fb20 : Bool
      value.fb20
    end

    # Filter bits
    def self.fb20=(value : Bool) : Bool
      self.set(fb20: value)
      value
    end

    # Filter bits
    def fb21 : Bool
      @value.bits_set?(0x200000_u32)
    end

    # Filter bits
    def self.fb21 : Bool
      value.fb21
    end

    # Filter bits
    def self.fb21=(value : Bool) : Bool
      self.set(fb21: value)
      value
    end

    # Filter bits
    def fb22 : Bool
      @value.bits_set?(0x400000_u32)
    end

    # Filter bits
    def self.fb22 : Bool
      value.fb22
    end

    # Filter bits
    def self.fb22=(value : Bool) : Bool
      self.set(fb22: value)
      value
    end

    # Filter bits
    def fb23 : Bool
      @value.bits_set?(0x800000_u32)
    end

    # Filter bits
    def self.fb23 : Bool
      value.fb23
    end

    # Filter bits
    def self.fb23=(value : Bool) : Bool
      self.set(fb23: value)
      value
    end

    # Filter bits
    def fb24 : Bool
      @value.bits_set?(0x1000000_u32)
    end

    # Filter bits
    def self.fb24 : Bool
      value.fb24
    end

    # Filter bits
    def self.fb24=(value : Bool) : Bool
      self.set(fb24: value)
      value
    end

    # Filter bits
    def fb25 : Bool
      @value.bits_set?(0x2000000_u32)
    end

    # Filter bits
    def self.fb25 : Bool
      value.fb25
    end

    # Filter bits
    def self.fb25=(value : Bool) : Bool
      self.set(fb25: value)
      value
    end

    # Filter bits
    def fb26 : Bool
      @value.bits_set?(0x4000000_u32)
    end

    # Filter bits
    def self.fb26 : Bool
      value.fb26
    end

    # Filter bits
    def self.fb26=(value : Bool) : Bool
      self.set(fb26: value)
      value
    end

    # Filter bits
    def fb27 : Bool
      @value.bits_set?(0x8000000_u32)
    end

    # Filter bits
    def self.fb27 : Bool
      value.fb27
    end

    # Filter bits
    def self.fb27=(value : Bool) : Bool
      self.set(fb27: value)
      value
    end

    # Filter bits
    def fb28 : Bool
      @value.bits_set?(0x10000000_u32)
    end

    # Filter bits
    def self.fb28 : Bool
      value.fb28
    end

    # Filter bits
    def self.fb28=(value : Bool) : Bool
      self.set(fb28: value)
      value
    end

    # Filter bits
    def fb29 : Bool
      @value.bits_set?(0x20000000_u32)
    end

    # Filter bits
    def self.fb29 : Bool
      value.fb29
    end

    # Filter bits
    def self.fb29=(value : Bool) : Bool
      self.set(fb29: value)
      value
    end

    # Filter bits
    def fb30 : Bool
      @value.bits_set?(0x40000000_u32)
    end

    # Filter bits
    def self.fb30 : Bool
      value.fb30
    end

    # Filter bits
    def self.fb30=(value : Bool) : Bool
      self.set(fb30: value)
      value
    end

    # Filter bits
    def fb31 : Bool
      @value.bits_set?(0x80000000_u32)
    end

    # Filter bits
    def self.fb31 : Bool
      value.fb31
    end

    # Filter bits
    def self.fb31=(value : Bool) : Bool
      self.set(fb31: value)
      value
    end

    def copy_with(
      *,

      fb0 : Bool? = nil,

      fb1 : Bool? = nil,

      fb2 : Bool? = nil,

      fb3 : Bool? = nil,

      fb4 : Bool? = nil,

      fb5 : Bool? = nil,

      fb6 : Bool? = nil,

      fb7 : Bool? = nil,

      fb8 : Bool? = nil,

      fb9 : Bool? = nil,

      fb10 : Bool? = nil,

      fb11 : Bool? = nil,

      fb12 : Bool? = nil,

      fb13 : Bool? = nil,

      fb14 : Bool? = nil,

      fb15 : Bool? = nil,

      fb16 : Bool? = nil,

      fb17 : Bool? = nil,

      fb18 : Bool? = nil,

      fb19 : Bool? = nil,

      fb20 : Bool? = nil,

      fb21 : Bool? = nil,

      fb22 : Bool? = nil,

      fb23 : Bool? = nil,

      fb24 : Bool? = nil,

      fb25 : Bool? = nil,

      fb26 : Bool? = nil,

      fb27 : Bool? = nil,

      fb28 : Bool? = nil,

      fb29 : Bool? = nil,

      fb30 : Bool? = nil,

      fb31 : Bool? = nil
    ) : self
      value = @value

      unless fb0.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(fb0.to_int).&(0x1_u32) << 0
      end

      unless fb1.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(fb1.to_int).&(0x1_u32) << 1
      end

      unless fb2.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(fb2.to_int).&(0x1_u32) << 2
      end

      unless fb3.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(fb3.to_int).&(0x1_u32) << 3
      end

      unless fb4.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(fb4.to_int).&(0x1_u32) << 4
      end

      unless fb5.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(fb5.to_int).&(0x1_u32) << 5
      end

      unless fb6.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(fb6.to_int).&(0x1_u32) << 6
      end

      unless fb7.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(fb7.to_int).&(0x1_u32) << 7
      end

      unless fb8.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(fb8.to_int).&(0x1_u32) << 8
      end

      unless fb9.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(fb9.to_int).&(0x1_u32) << 9
      end

      unless fb10.nil?
        value = (value & 0xfffffbff_u32) |
                UInt32.new!(fb10.to_int).&(0x1_u32) << 10
      end

      unless fb11.nil?
        value = (value & 0xfffff7ff_u32) |
                UInt32.new!(fb11.to_int).&(0x1_u32) << 11
      end

      unless fb12.nil?
        value = (value & 0xffffefff_u32) |
                UInt32.new!(fb12.to_int).&(0x1_u32) << 12
      end

      unless fb13.nil?
        value = (value & 0xffffdfff_u32) |
                UInt32.new!(fb13.to_int).&(0x1_u32) << 13
      end

      unless fb14.nil?
        value = (value & 0xffffbfff_u32) |
                UInt32.new!(fb14.to_int).&(0x1_u32) << 14
      end

      unless fb15.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(fb15.to_int).&(0x1_u32) << 15
      end

      unless fb16.nil?
        value = (value & 0xfffeffff_u32) |
                UInt32.new!(fb16.to_int).&(0x1_u32) << 16
      end

      unless fb17.nil?
        value = (value & 0xfffdffff_u32) |
                UInt32.new!(fb17.to_int).&(0x1_u32) << 17
      end

      unless fb18.nil?
        value = (value & 0xfffbffff_u32) |
                UInt32.new!(fb18.to_int).&(0x1_u32) << 18
      end

      unless fb19.nil?
        value = (value & 0xfff7ffff_u32) |
                UInt32.new!(fb19.to_int).&(0x1_u32) << 19
      end

      unless fb20.nil?
        value = (value & 0xffefffff_u32) |
                UInt32.new!(fb20.to_int).&(0x1_u32) << 20
      end

      unless fb21.nil?
        value = (value & 0xffdfffff_u32) |
                UInt32.new!(fb21.to_int).&(0x1_u32) << 21
      end

      unless fb22.nil?
        value = (value & 0xffbfffff_u32) |
                UInt32.new!(fb22.to_int).&(0x1_u32) << 22
      end

      unless fb23.nil?
        value = (value & 0xff7fffff_u32) |
                UInt32.new!(fb23.to_int).&(0x1_u32) << 23
      end

      unless fb24.nil?
        value = (value & 0xfeffffff_u32) |
                UInt32.new!(fb24.to_int).&(0x1_u32) << 24
      end

      unless fb25.nil?
        value = (value & 0xfdffffff_u32) |
                UInt32.new!(fb25.to_int).&(0x1_u32) << 25
      end

      unless fb26.nil?
        value = (value & 0xfbffffff_u32) |
                UInt32.new!(fb26.to_int).&(0x1_u32) << 26
      end

      unless fb27.nil?
        value = (value & 0xf7ffffff_u32) |
                UInt32.new!(fb27.to_int).&(0x1_u32) << 27
      end

      unless fb28.nil?
        value = (value & 0xefffffff_u32) |
                UInt32.new!(fb28.to_int).&(0x1_u32) << 28
      end

      unless fb29.nil?
        value = (value & 0xdfffffff_u32) |
                UInt32.new!(fb29.to_int).&(0x1_u32) << 29
      end

      unless fb30.nil?
        value = (value & 0xbfffffff_u32) |
                UInt32.new!(fb30.to_int).&(0x1_u32) << 30
      end

      unless fb31.nil?
        value = (value & 0x7fffffff_u32) |
                UInt32.new!(fb31.to_int).&(0x1_u32) << 31
      end

      self.class.new(value)
    end

    def self.set(
      *,
      fb0 : Bool? = nil,
      fb1 : Bool? = nil,
      fb2 : Bool? = nil,
      fb3 : Bool? = nil,
      fb4 : Bool? = nil,
      fb5 : Bool? = nil,
      fb6 : Bool? = nil,
      fb7 : Bool? = nil,
      fb8 : Bool? = nil,
      fb9 : Bool? = nil,
      fb10 : Bool? = nil,
      fb11 : Bool? = nil,
      fb12 : Bool? = nil,
      fb13 : Bool? = nil,
      fb14 : Bool? = nil,
      fb15 : Bool? = nil,
      fb16 : Bool? = nil,
      fb17 : Bool? = nil,
      fb18 : Bool? = nil,
      fb19 : Bool? = nil,
      fb20 : Bool? = nil,
      fb21 : Bool? = nil,
      fb22 : Bool? = nil,
      fb23 : Bool? = nil,
      fb24 : Bool? = nil,
      fb25 : Bool? = nil,
      fb26 : Bool? = nil,
      fb27 : Bool? = nil,
      fb28 : Bool? = nil,
      fb29 : Bool? = nil,
      fb30 : Bool? = nil,
      fb31 : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        fb0: fb0,
        fb1: fb1,
        fb2: fb2,
        fb3: fb3,
        fb4: fb4,
        fb5: fb5,
        fb6: fb6,
        fb7: fb7,
        fb8: fb8,
        fb9: fb9,
        fb10: fb10,
        fb11: fb11,
        fb12: fb12,
        fb13: fb13,
        fb14: fb14,
        fb15: fb15,
        fb16: fb16,
        fb17: fb17,
        fb18: fb18,
        fb19: fb19,
        fb20: fb20,
        fb21: fb21,
        fb22: fb22,
        fb23: fb23,
        fb24: fb24,
        fb25: fb25,
        fb26: fb26,
        fb27: fb27,
        fb28: fb28,
        fb29: fb29,
        fb30: fb30,
        fb31: fb31,
      )
    end
  end # struct

  # Filter bank 21 register 2
  struct F21R2
    ADDRESS = BASE_ADDRESS + 0x2ec_u64

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

    # Filter bits
    def fb0 : Bool
      @value.bits_set?(0x1_u32)
    end

    # Filter bits
    def self.fb0 : Bool
      value.fb0
    end

    # Filter bits
    def self.fb0=(value : Bool) : Bool
      self.set(fb0: value)
      value
    end

    # Filter bits
    def fb1 : Bool
      @value.bits_set?(0x2_u32)
    end

    # Filter bits
    def self.fb1 : Bool
      value.fb1
    end

    # Filter bits
    def self.fb1=(value : Bool) : Bool
      self.set(fb1: value)
      value
    end

    # Filter bits
    def fb2 : Bool
      @value.bits_set?(0x4_u32)
    end

    # Filter bits
    def self.fb2 : Bool
      value.fb2
    end

    # Filter bits
    def self.fb2=(value : Bool) : Bool
      self.set(fb2: value)
      value
    end

    # Filter bits
    def fb3 : Bool
      @value.bits_set?(0x8_u32)
    end

    # Filter bits
    def self.fb3 : Bool
      value.fb3
    end

    # Filter bits
    def self.fb3=(value : Bool) : Bool
      self.set(fb3: value)
      value
    end

    # Filter bits
    def fb4 : Bool
      @value.bits_set?(0x10_u32)
    end

    # Filter bits
    def self.fb4 : Bool
      value.fb4
    end

    # Filter bits
    def self.fb4=(value : Bool) : Bool
      self.set(fb4: value)
      value
    end

    # Filter bits
    def fb5 : Bool
      @value.bits_set?(0x20_u32)
    end

    # Filter bits
    def self.fb5 : Bool
      value.fb5
    end

    # Filter bits
    def self.fb5=(value : Bool) : Bool
      self.set(fb5: value)
      value
    end

    # Filter bits
    def fb6 : Bool
      @value.bits_set?(0x40_u32)
    end

    # Filter bits
    def self.fb6 : Bool
      value.fb6
    end

    # Filter bits
    def self.fb6=(value : Bool) : Bool
      self.set(fb6: value)
      value
    end

    # Filter bits
    def fb7 : Bool
      @value.bits_set?(0x80_u32)
    end

    # Filter bits
    def self.fb7 : Bool
      value.fb7
    end

    # Filter bits
    def self.fb7=(value : Bool) : Bool
      self.set(fb7: value)
      value
    end

    # Filter bits
    def fb8 : Bool
      @value.bits_set?(0x100_u32)
    end

    # Filter bits
    def self.fb8 : Bool
      value.fb8
    end

    # Filter bits
    def self.fb8=(value : Bool) : Bool
      self.set(fb8: value)
      value
    end

    # Filter bits
    def fb9 : Bool
      @value.bits_set?(0x200_u32)
    end

    # Filter bits
    def self.fb9 : Bool
      value.fb9
    end

    # Filter bits
    def self.fb9=(value : Bool) : Bool
      self.set(fb9: value)
      value
    end

    # Filter bits
    def fb10 : Bool
      @value.bits_set?(0x400_u32)
    end

    # Filter bits
    def self.fb10 : Bool
      value.fb10
    end

    # Filter bits
    def self.fb10=(value : Bool) : Bool
      self.set(fb10: value)
      value
    end

    # Filter bits
    def fb11 : Bool
      @value.bits_set?(0x800_u32)
    end

    # Filter bits
    def self.fb11 : Bool
      value.fb11
    end

    # Filter bits
    def self.fb11=(value : Bool) : Bool
      self.set(fb11: value)
      value
    end

    # Filter bits
    def fb12 : Bool
      @value.bits_set?(0x1000_u32)
    end

    # Filter bits
    def self.fb12 : Bool
      value.fb12
    end

    # Filter bits
    def self.fb12=(value : Bool) : Bool
      self.set(fb12: value)
      value
    end

    # Filter bits
    def fb13 : Bool
      @value.bits_set?(0x2000_u32)
    end

    # Filter bits
    def self.fb13 : Bool
      value.fb13
    end

    # Filter bits
    def self.fb13=(value : Bool) : Bool
      self.set(fb13: value)
      value
    end

    # Filter bits
    def fb14 : Bool
      @value.bits_set?(0x4000_u32)
    end

    # Filter bits
    def self.fb14 : Bool
      value.fb14
    end

    # Filter bits
    def self.fb14=(value : Bool) : Bool
      self.set(fb14: value)
      value
    end

    # Filter bits
    def fb15 : Bool
      @value.bits_set?(0x8000_u32)
    end

    # Filter bits
    def self.fb15 : Bool
      value.fb15
    end

    # Filter bits
    def self.fb15=(value : Bool) : Bool
      self.set(fb15: value)
      value
    end

    # Filter bits
    def fb16 : Bool
      @value.bits_set?(0x10000_u32)
    end

    # Filter bits
    def self.fb16 : Bool
      value.fb16
    end

    # Filter bits
    def self.fb16=(value : Bool) : Bool
      self.set(fb16: value)
      value
    end

    # Filter bits
    def fb17 : Bool
      @value.bits_set?(0x20000_u32)
    end

    # Filter bits
    def self.fb17 : Bool
      value.fb17
    end

    # Filter bits
    def self.fb17=(value : Bool) : Bool
      self.set(fb17: value)
      value
    end

    # Filter bits
    def fb18 : Bool
      @value.bits_set?(0x40000_u32)
    end

    # Filter bits
    def self.fb18 : Bool
      value.fb18
    end

    # Filter bits
    def self.fb18=(value : Bool) : Bool
      self.set(fb18: value)
      value
    end

    # Filter bits
    def fb19 : Bool
      @value.bits_set?(0x80000_u32)
    end

    # Filter bits
    def self.fb19 : Bool
      value.fb19
    end

    # Filter bits
    def self.fb19=(value : Bool) : Bool
      self.set(fb19: value)
      value
    end

    # Filter bits
    def fb20 : Bool
      @value.bits_set?(0x100000_u32)
    end

    # Filter bits
    def self.fb20 : Bool
      value.fb20
    end

    # Filter bits
    def self.fb20=(value : Bool) : Bool
      self.set(fb20: value)
      value
    end

    # Filter bits
    def fb21 : Bool
      @value.bits_set?(0x200000_u32)
    end

    # Filter bits
    def self.fb21 : Bool
      value.fb21
    end

    # Filter bits
    def self.fb21=(value : Bool) : Bool
      self.set(fb21: value)
      value
    end

    # Filter bits
    def fb22 : Bool
      @value.bits_set?(0x400000_u32)
    end

    # Filter bits
    def self.fb22 : Bool
      value.fb22
    end

    # Filter bits
    def self.fb22=(value : Bool) : Bool
      self.set(fb22: value)
      value
    end

    # Filter bits
    def fb23 : Bool
      @value.bits_set?(0x800000_u32)
    end

    # Filter bits
    def self.fb23 : Bool
      value.fb23
    end

    # Filter bits
    def self.fb23=(value : Bool) : Bool
      self.set(fb23: value)
      value
    end

    # Filter bits
    def fb24 : Bool
      @value.bits_set?(0x1000000_u32)
    end

    # Filter bits
    def self.fb24 : Bool
      value.fb24
    end

    # Filter bits
    def self.fb24=(value : Bool) : Bool
      self.set(fb24: value)
      value
    end

    # Filter bits
    def fb25 : Bool
      @value.bits_set?(0x2000000_u32)
    end

    # Filter bits
    def self.fb25 : Bool
      value.fb25
    end

    # Filter bits
    def self.fb25=(value : Bool) : Bool
      self.set(fb25: value)
      value
    end

    # Filter bits
    def fb26 : Bool
      @value.bits_set?(0x4000000_u32)
    end

    # Filter bits
    def self.fb26 : Bool
      value.fb26
    end

    # Filter bits
    def self.fb26=(value : Bool) : Bool
      self.set(fb26: value)
      value
    end

    # Filter bits
    def fb27 : Bool
      @value.bits_set?(0x8000000_u32)
    end

    # Filter bits
    def self.fb27 : Bool
      value.fb27
    end

    # Filter bits
    def self.fb27=(value : Bool) : Bool
      self.set(fb27: value)
      value
    end

    # Filter bits
    def fb28 : Bool
      @value.bits_set?(0x10000000_u32)
    end

    # Filter bits
    def self.fb28 : Bool
      value.fb28
    end

    # Filter bits
    def self.fb28=(value : Bool) : Bool
      self.set(fb28: value)
      value
    end

    # Filter bits
    def fb29 : Bool
      @value.bits_set?(0x20000000_u32)
    end

    # Filter bits
    def self.fb29 : Bool
      value.fb29
    end

    # Filter bits
    def self.fb29=(value : Bool) : Bool
      self.set(fb29: value)
      value
    end

    # Filter bits
    def fb30 : Bool
      @value.bits_set?(0x40000000_u32)
    end

    # Filter bits
    def self.fb30 : Bool
      value.fb30
    end

    # Filter bits
    def self.fb30=(value : Bool) : Bool
      self.set(fb30: value)
      value
    end

    # Filter bits
    def fb31 : Bool
      @value.bits_set?(0x80000000_u32)
    end

    # Filter bits
    def self.fb31 : Bool
      value.fb31
    end

    # Filter bits
    def self.fb31=(value : Bool) : Bool
      self.set(fb31: value)
      value
    end

    def copy_with(
      *,

      fb0 : Bool? = nil,

      fb1 : Bool? = nil,

      fb2 : Bool? = nil,

      fb3 : Bool? = nil,

      fb4 : Bool? = nil,

      fb5 : Bool? = nil,

      fb6 : Bool? = nil,

      fb7 : Bool? = nil,

      fb8 : Bool? = nil,

      fb9 : Bool? = nil,

      fb10 : Bool? = nil,

      fb11 : Bool? = nil,

      fb12 : Bool? = nil,

      fb13 : Bool? = nil,

      fb14 : Bool? = nil,

      fb15 : Bool? = nil,

      fb16 : Bool? = nil,

      fb17 : Bool? = nil,

      fb18 : Bool? = nil,

      fb19 : Bool? = nil,

      fb20 : Bool? = nil,

      fb21 : Bool? = nil,

      fb22 : Bool? = nil,

      fb23 : Bool? = nil,

      fb24 : Bool? = nil,

      fb25 : Bool? = nil,

      fb26 : Bool? = nil,

      fb27 : Bool? = nil,

      fb28 : Bool? = nil,

      fb29 : Bool? = nil,

      fb30 : Bool? = nil,

      fb31 : Bool? = nil
    ) : self
      value = @value

      unless fb0.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(fb0.to_int).&(0x1_u32) << 0
      end

      unless fb1.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(fb1.to_int).&(0x1_u32) << 1
      end

      unless fb2.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(fb2.to_int).&(0x1_u32) << 2
      end

      unless fb3.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(fb3.to_int).&(0x1_u32) << 3
      end

      unless fb4.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(fb4.to_int).&(0x1_u32) << 4
      end

      unless fb5.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(fb5.to_int).&(0x1_u32) << 5
      end

      unless fb6.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(fb6.to_int).&(0x1_u32) << 6
      end

      unless fb7.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(fb7.to_int).&(0x1_u32) << 7
      end

      unless fb8.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(fb8.to_int).&(0x1_u32) << 8
      end

      unless fb9.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(fb9.to_int).&(0x1_u32) << 9
      end

      unless fb10.nil?
        value = (value & 0xfffffbff_u32) |
                UInt32.new!(fb10.to_int).&(0x1_u32) << 10
      end

      unless fb11.nil?
        value = (value & 0xfffff7ff_u32) |
                UInt32.new!(fb11.to_int).&(0x1_u32) << 11
      end

      unless fb12.nil?
        value = (value & 0xffffefff_u32) |
                UInt32.new!(fb12.to_int).&(0x1_u32) << 12
      end

      unless fb13.nil?
        value = (value & 0xffffdfff_u32) |
                UInt32.new!(fb13.to_int).&(0x1_u32) << 13
      end

      unless fb14.nil?
        value = (value & 0xffffbfff_u32) |
                UInt32.new!(fb14.to_int).&(0x1_u32) << 14
      end

      unless fb15.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(fb15.to_int).&(0x1_u32) << 15
      end

      unless fb16.nil?
        value = (value & 0xfffeffff_u32) |
                UInt32.new!(fb16.to_int).&(0x1_u32) << 16
      end

      unless fb17.nil?
        value = (value & 0xfffdffff_u32) |
                UInt32.new!(fb17.to_int).&(0x1_u32) << 17
      end

      unless fb18.nil?
        value = (value & 0xfffbffff_u32) |
                UInt32.new!(fb18.to_int).&(0x1_u32) << 18
      end

      unless fb19.nil?
        value = (value & 0xfff7ffff_u32) |
                UInt32.new!(fb19.to_int).&(0x1_u32) << 19
      end

      unless fb20.nil?
        value = (value & 0xffefffff_u32) |
                UInt32.new!(fb20.to_int).&(0x1_u32) << 20
      end

      unless fb21.nil?
        value = (value & 0xffdfffff_u32) |
                UInt32.new!(fb21.to_int).&(0x1_u32) << 21
      end

      unless fb22.nil?
        value = (value & 0xffbfffff_u32) |
                UInt32.new!(fb22.to_int).&(0x1_u32) << 22
      end

      unless fb23.nil?
        value = (value & 0xff7fffff_u32) |
                UInt32.new!(fb23.to_int).&(0x1_u32) << 23
      end

      unless fb24.nil?
        value = (value & 0xfeffffff_u32) |
                UInt32.new!(fb24.to_int).&(0x1_u32) << 24
      end

      unless fb25.nil?
        value = (value & 0xfdffffff_u32) |
                UInt32.new!(fb25.to_int).&(0x1_u32) << 25
      end

      unless fb26.nil?
        value = (value & 0xfbffffff_u32) |
                UInt32.new!(fb26.to_int).&(0x1_u32) << 26
      end

      unless fb27.nil?
        value = (value & 0xf7ffffff_u32) |
                UInt32.new!(fb27.to_int).&(0x1_u32) << 27
      end

      unless fb28.nil?
        value = (value & 0xefffffff_u32) |
                UInt32.new!(fb28.to_int).&(0x1_u32) << 28
      end

      unless fb29.nil?
        value = (value & 0xdfffffff_u32) |
                UInt32.new!(fb29.to_int).&(0x1_u32) << 29
      end

      unless fb30.nil?
        value = (value & 0xbfffffff_u32) |
                UInt32.new!(fb30.to_int).&(0x1_u32) << 30
      end

      unless fb31.nil?
        value = (value & 0x7fffffff_u32) |
                UInt32.new!(fb31.to_int).&(0x1_u32) << 31
      end

      self.class.new(value)
    end

    def self.set(
      *,
      fb0 : Bool? = nil,
      fb1 : Bool? = nil,
      fb2 : Bool? = nil,
      fb3 : Bool? = nil,
      fb4 : Bool? = nil,
      fb5 : Bool? = nil,
      fb6 : Bool? = nil,
      fb7 : Bool? = nil,
      fb8 : Bool? = nil,
      fb9 : Bool? = nil,
      fb10 : Bool? = nil,
      fb11 : Bool? = nil,
      fb12 : Bool? = nil,
      fb13 : Bool? = nil,
      fb14 : Bool? = nil,
      fb15 : Bool? = nil,
      fb16 : Bool? = nil,
      fb17 : Bool? = nil,
      fb18 : Bool? = nil,
      fb19 : Bool? = nil,
      fb20 : Bool? = nil,
      fb21 : Bool? = nil,
      fb22 : Bool? = nil,
      fb23 : Bool? = nil,
      fb24 : Bool? = nil,
      fb25 : Bool? = nil,
      fb26 : Bool? = nil,
      fb27 : Bool? = nil,
      fb28 : Bool? = nil,
      fb29 : Bool? = nil,
      fb30 : Bool? = nil,
      fb31 : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        fb0: fb0,
        fb1: fb1,
        fb2: fb2,
        fb3: fb3,
        fb4: fb4,
        fb5: fb5,
        fb6: fb6,
        fb7: fb7,
        fb8: fb8,
        fb9: fb9,
        fb10: fb10,
        fb11: fb11,
        fb12: fb12,
        fb13: fb13,
        fb14: fb14,
        fb15: fb15,
        fb16: fb16,
        fb17: fb17,
        fb18: fb18,
        fb19: fb19,
        fb20: fb20,
        fb21: fb21,
        fb22: fb22,
        fb23: fb23,
        fb24: fb24,
        fb25: fb25,
        fb26: fb26,
        fb27: fb27,
        fb28: fb28,
        fb29: fb29,
        fb30: fb30,
        fb31: fb31,
      )
    end
  end # struct

  # Filter bank 22 register 1
  struct F22R1
    ADDRESS = BASE_ADDRESS + 0x2f0_u64

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

    # Filter bits
    def fb0 : Bool
      @value.bits_set?(0x1_u32)
    end

    # Filter bits
    def self.fb0 : Bool
      value.fb0
    end

    # Filter bits
    def self.fb0=(value : Bool) : Bool
      self.set(fb0: value)
      value
    end

    # Filter bits
    def fb1 : Bool
      @value.bits_set?(0x2_u32)
    end

    # Filter bits
    def self.fb1 : Bool
      value.fb1
    end

    # Filter bits
    def self.fb1=(value : Bool) : Bool
      self.set(fb1: value)
      value
    end

    # Filter bits
    def fb2 : Bool
      @value.bits_set?(0x4_u32)
    end

    # Filter bits
    def self.fb2 : Bool
      value.fb2
    end

    # Filter bits
    def self.fb2=(value : Bool) : Bool
      self.set(fb2: value)
      value
    end

    # Filter bits
    def fb3 : Bool
      @value.bits_set?(0x8_u32)
    end

    # Filter bits
    def self.fb3 : Bool
      value.fb3
    end

    # Filter bits
    def self.fb3=(value : Bool) : Bool
      self.set(fb3: value)
      value
    end

    # Filter bits
    def fb4 : Bool
      @value.bits_set?(0x10_u32)
    end

    # Filter bits
    def self.fb4 : Bool
      value.fb4
    end

    # Filter bits
    def self.fb4=(value : Bool) : Bool
      self.set(fb4: value)
      value
    end

    # Filter bits
    def fb5 : Bool
      @value.bits_set?(0x20_u32)
    end

    # Filter bits
    def self.fb5 : Bool
      value.fb5
    end

    # Filter bits
    def self.fb5=(value : Bool) : Bool
      self.set(fb5: value)
      value
    end

    # Filter bits
    def fb6 : Bool
      @value.bits_set?(0x40_u32)
    end

    # Filter bits
    def self.fb6 : Bool
      value.fb6
    end

    # Filter bits
    def self.fb6=(value : Bool) : Bool
      self.set(fb6: value)
      value
    end

    # Filter bits
    def fb7 : Bool
      @value.bits_set?(0x80_u32)
    end

    # Filter bits
    def self.fb7 : Bool
      value.fb7
    end

    # Filter bits
    def self.fb7=(value : Bool) : Bool
      self.set(fb7: value)
      value
    end

    # Filter bits
    def fb8 : Bool
      @value.bits_set?(0x100_u32)
    end

    # Filter bits
    def self.fb8 : Bool
      value.fb8
    end

    # Filter bits
    def self.fb8=(value : Bool) : Bool
      self.set(fb8: value)
      value
    end

    # Filter bits
    def fb9 : Bool
      @value.bits_set?(0x200_u32)
    end

    # Filter bits
    def self.fb9 : Bool
      value.fb9
    end

    # Filter bits
    def self.fb9=(value : Bool) : Bool
      self.set(fb9: value)
      value
    end

    # Filter bits
    def fb10 : Bool
      @value.bits_set?(0x400_u32)
    end

    # Filter bits
    def self.fb10 : Bool
      value.fb10
    end

    # Filter bits
    def self.fb10=(value : Bool) : Bool
      self.set(fb10: value)
      value
    end

    # Filter bits
    def fb11 : Bool
      @value.bits_set?(0x800_u32)
    end

    # Filter bits
    def self.fb11 : Bool
      value.fb11
    end

    # Filter bits
    def self.fb11=(value : Bool) : Bool
      self.set(fb11: value)
      value
    end

    # Filter bits
    def fb12 : Bool
      @value.bits_set?(0x1000_u32)
    end

    # Filter bits
    def self.fb12 : Bool
      value.fb12
    end

    # Filter bits
    def self.fb12=(value : Bool) : Bool
      self.set(fb12: value)
      value
    end

    # Filter bits
    def fb13 : Bool
      @value.bits_set?(0x2000_u32)
    end

    # Filter bits
    def self.fb13 : Bool
      value.fb13
    end

    # Filter bits
    def self.fb13=(value : Bool) : Bool
      self.set(fb13: value)
      value
    end

    # Filter bits
    def fb14 : Bool
      @value.bits_set?(0x4000_u32)
    end

    # Filter bits
    def self.fb14 : Bool
      value.fb14
    end

    # Filter bits
    def self.fb14=(value : Bool) : Bool
      self.set(fb14: value)
      value
    end

    # Filter bits
    def fb15 : Bool
      @value.bits_set?(0x8000_u32)
    end

    # Filter bits
    def self.fb15 : Bool
      value.fb15
    end

    # Filter bits
    def self.fb15=(value : Bool) : Bool
      self.set(fb15: value)
      value
    end

    # Filter bits
    def fb16 : Bool
      @value.bits_set?(0x10000_u32)
    end

    # Filter bits
    def self.fb16 : Bool
      value.fb16
    end

    # Filter bits
    def self.fb16=(value : Bool) : Bool
      self.set(fb16: value)
      value
    end

    # Filter bits
    def fb17 : Bool
      @value.bits_set?(0x20000_u32)
    end

    # Filter bits
    def self.fb17 : Bool
      value.fb17
    end

    # Filter bits
    def self.fb17=(value : Bool) : Bool
      self.set(fb17: value)
      value
    end

    # Filter bits
    def fb18 : Bool
      @value.bits_set?(0x40000_u32)
    end

    # Filter bits
    def self.fb18 : Bool
      value.fb18
    end

    # Filter bits
    def self.fb18=(value : Bool) : Bool
      self.set(fb18: value)
      value
    end

    # Filter bits
    def fb19 : Bool
      @value.bits_set?(0x80000_u32)
    end

    # Filter bits
    def self.fb19 : Bool
      value.fb19
    end

    # Filter bits
    def self.fb19=(value : Bool) : Bool
      self.set(fb19: value)
      value
    end

    # Filter bits
    def fb20 : Bool
      @value.bits_set?(0x100000_u32)
    end

    # Filter bits
    def self.fb20 : Bool
      value.fb20
    end

    # Filter bits
    def self.fb20=(value : Bool) : Bool
      self.set(fb20: value)
      value
    end

    # Filter bits
    def fb21 : Bool
      @value.bits_set?(0x200000_u32)
    end

    # Filter bits
    def self.fb21 : Bool
      value.fb21
    end

    # Filter bits
    def self.fb21=(value : Bool) : Bool
      self.set(fb21: value)
      value
    end

    # Filter bits
    def fb22 : Bool
      @value.bits_set?(0x400000_u32)
    end

    # Filter bits
    def self.fb22 : Bool
      value.fb22
    end

    # Filter bits
    def self.fb22=(value : Bool) : Bool
      self.set(fb22: value)
      value
    end

    # Filter bits
    def fb23 : Bool
      @value.bits_set?(0x800000_u32)
    end

    # Filter bits
    def self.fb23 : Bool
      value.fb23
    end

    # Filter bits
    def self.fb23=(value : Bool) : Bool
      self.set(fb23: value)
      value
    end

    # Filter bits
    def fb24 : Bool
      @value.bits_set?(0x1000000_u32)
    end

    # Filter bits
    def self.fb24 : Bool
      value.fb24
    end

    # Filter bits
    def self.fb24=(value : Bool) : Bool
      self.set(fb24: value)
      value
    end

    # Filter bits
    def fb25 : Bool
      @value.bits_set?(0x2000000_u32)
    end

    # Filter bits
    def self.fb25 : Bool
      value.fb25
    end

    # Filter bits
    def self.fb25=(value : Bool) : Bool
      self.set(fb25: value)
      value
    end

    # Filter bits
    def fb26 : Bool
      @value.bits_set?(0x4000000_u32)
    end

    # Filter bits
    def self.fb26 : Bool
      value.fb26
    end

    # Filter bits
    def self.fb26=(value : Bool) : Bool
      self.set(fb26: value)
      value
    end

    # Filter bits
    def fb27 : Bool
      @value.bits_set?(0x8000000_u32)
    end

    # Filter bits
    def self.fb27 : Bool
      value.fb27
    end

    # Filter bits
    def self.fb27=(value : Bool) : Bool
      self.set(fb27: value)
      value
    end

    # Filter bits
    def fb28 : Bool
      @value.bits_set?(0x10000000_u32)
    end

    # Filter bits
    def self.fb28 : Bool
      value.fb28
    end

    # Filter bits
    def self.fb28=(value : Bool) : Bool
      self.set(fb28: value)
      value
    end

    # Filter bits
    def fb29 : Bool
      @value.bits_set?(0x20000000_u32)
    end

    # Filter bits
    def self.fb29 : Bool
      value.fb29
    end

    # Filter bits
    def self.fb29=(value : Bool) : Bool
      self.set(fb29: value)
      value
    end

    # Filter bits
    def fb30 : Bool
      @value.bits_set?(0x40000000_u32)
    end

    # Filter bits
    def self.fb30 : Bool
      value.fb30
    end

    # Filter bits
    def self.fb30=(value : Bool) : Bool
      self.set(fb30: value)
      value
    end

    # Filter bits
    def fb31 : Bool
      @value.bits_set?(0x80000000_u32)
    end

    # Filter bits
    def self.fb31 : Bool
      value.fb31
    end

    # Filter bits
    def self.fb31=(value : Bool) : Bool
      self.set(fb31: value)
      value
    end

    def copy_with(
      *,

      fb0 : Bool? = nil,

      fb1 : Bool? = nil,

      fb2 : Bool? = nil,

      fb3 : Bool? = nil,

      fb4 : Bool? = nil,

      fb5 : Bool? = nil,

      fb6 : Bool? = nil,

      fb7 : Bool? = nil,

      fb8 : Bool? = nil,

      fb9 : Bool? = nil,

      fb10 : Bool? = nil,

      fb11 : Bool? = nil,

      fb12 : Bool? = nil,

      fb13 : Bool? = nil,

      fb14 : Bool? = nil,

      fb15 : Bool? = nil,

      fb16 : Bool? = nil,

      fb17 : Bool? = nil,

      fb18 : Bool? = nil,

      fb19 : Bool? = nil,

      fb20 : Bool? = nil,

      fb21 : Bool? = nil,

      fb22 : Bool? = nil,

      fb23 : Bool? = nil,

      fb24 : Bool? = nil,

      fb25 : Bool? = nil,

      fb26 : Bool? = nil,

      fb27 : Bool? = nil,

      fb28 : Bool? = nil,

      fb29 : Bool? = nil,

      fb30 : Bool? = nil,

      fb31 : Bool? = nil
    ) : self
      value = @value

      unless fb0.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(fb0.to_int).&(0x1_u32) << 0
      end

      unless fb1.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(fb1.to_int).&(0x1_u32) << 1
      end

      unless fb2.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(fb2.to_int).&(0x1_u32) << 2
      end

      unless fb3.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(fb3.to_int).&(0x1_u32) << 3
      end

      unless fb4.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(fb4.to_int).&(0x1_u32) << 4
      end

      unless fb5.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(fb5.to_int).&(0x1_u32) << 5
      end

      unless fb6.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(fb6.to_int).&(0x1_u32) << 6
      end

      unless fb7.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(fb7.to_int).&(0x1_u32) << 7
      end

      unless fb8.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(fb8.to_int).&(0x1_u32) << 8
      end

      unless fb9.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(fb9.to_int).&(0x1_u32) << 9
      end

      unless fb10.nil?
        value = (value & 0xfffffbff_u32) |
                UInt32.new!(fb10.to_int).&(0x1_u32) << 10
      end

      unless fb11.nil?
        value = (value & 0xfffff7ff_u32) |
                UInt32.new!(fb11.to_int).&(0x1_u32) << 11
      end

      unless fb12.nil?
        value = (value & 0xffffefff_u32) |
                UInt32.new!(fb12.to_int).&(0x1_u32) << 12
      end

      unless fb13.nil?
        value = (value & 0xffffdfff_u32) |
                UInt32.new!(fb13.to_int).&(0x1_u32) << 13
      end

      unless fb14.nil?
        value = (value & 0xffffbfff_u32) |
                UInt32.new!(fb14.to_int).&(0x1_u32) << 14
      end

      unless fb15.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(fb15.to_int).&(0x1_u32) << 15
      end

      unless fb16.nil?
        value = (value & 0xfffeffff_u32) |
                UInt32.new!(fb16.to_int).&(0x1_u32) << 16
      end

      unless fb17.nil?
        value = (value & 0xfffdffff_u32) |
                UInt32.new!(fb17.to_int).&(0x1_u32) << 17
      end

      unless fb18.nil?
        value = (value & 0xfffbffff_u32) |
                UInt32.new!(fb18.to_int).&(0x1_u32) << 18
      end

      unless fb19.nil?
        value = (value & 0xfff7ffff_u32) |
                UInt32.new!(fb19.to_int).&(0x1_u32) << 19
      end

      unless fb20.nil?
        value = (value & 0xffefffff_u32) |
                UInt32.new!(fb20.to_int).&(0x1_u32) << 20
      end

      unless fb21.nil?
        value = (value & 0xffdfffff_u32) |
                UInt32.new!(fb21.to_int).&(0x1_u32) << 21
      end

      unless fb22.nil?
        value = (value & 0xffbfffff_u32) |
                UInt32.new!(fb22.to_int).&(0x1_u32) << 22
      end

      unless fb23.nil?
        value = (value & 0xff7fffff_u32) |
                UInt32.new!(fb23.to_int).&(0x1_u32) << 23
      end

      unless fb24.nil?
        value = (value & 0xfeffffff_u32) |
                UInt32.new!(fb24.to_int).&(0x1_u32) << 24
      end

      unless fb25.nil?
        value = (value & 0xfdffffff_u32) |
                UInt32.new!(fb25.to_int).&(0x1_u32) << 25
      end

      unless fb26.nil?
        value = (value & 0xfbffffff_u32) |
                UInt32.new!(fb26.to_int).&(0x1_u32) << 26
      end

      unless fb27.nil?
        value = (value & 0xf7ffffff_u32) |
                UInt32.new!(fb27.to_int).&(0x1_u32) << 27
      end

      unless fb28.nil?
        value = (value & 0xefffffff_u32) |
                UInt32.new!(fb28.to_int).&(0x1_u32) << 28
      end

      unless fb29.nil?
        value = (value & 0xdfffffff_u32) |
                UInt32.new!(fb29.to_int).&(0x1_u32) << 29
      end

      unless fb30.nil?
        value = (value & 0xbfffffff_u32) |
                UInt32.new!(fb30.to_int).&(0x1_u32) << 30
      end

      unless fb31.nil?
        value = (value & 0x7fffffff_u32) |
                UInt32.new!(fb31.to_int).&(0x1_u32) << 31
      end

      self.class.new(value)
    end

    def self.set(
      *,
      fb0 : Bool? = nil,
      fb1 : Bool? = nil,
      fb2 : Bool? = nil,
      fb3 : Bool? = nil,
      fb4 : Bool? = nil,
      fb5 : Bool? = nil,
      fb6 : Bool? = nil,
      fb7 : Bool? = nil,
      fb8 : Bool? = nil,
      fb9 : Bool? = nil,
      fb10 : Bool? = nil,
      fb11 : Bool? = nil,
      fb12 : Bool? = nil,
      fb13 : Bool? = nil,
      fb14 : Bool? = nil,
      fb15 : Bool? = nil,
      fb16 : Bool? = nil,
      fb17 : Bool? = nil,
      fb18 : Bool? = nil,
      fb19 : Bool? = nil,
      fb20 : Bool? = nil,
      fb21 : Bool? = nil,
      fb22 : Bool? = nil,
      fb23 : Bool? = nil,
      fb24 : Bool? = nil,
      fb25 : Bool? = nil,
      fb26 : Bool? = nil,
      fb27 : Bool? = nil,
      fb28 : Bool? = nil,
      fb29 : Bool? = nil,
      fb30 : Bool? = nil,
      fb31 : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        fb0: fb0,
        fb1: fb1,
        fb2: fb2,
        fb3: fb3,
        fb4: fb4,
        fb5: fb5,
        fb6: fb6,
        fb7: fb7,
        fb8: fb8,
        fb9: fb9,
        fb10: fb10,
        fb11: fb11,
        fb12: fb12,
        fb13: fb13,
        fb14: fb14,
        fb15: fb15,
        fb16: fb16,
        fb17: fb17,
        fb18: fb18,
        fb19: fb19,
        fb20: fb20,
        fb21: fb21,
        fb22: fb22,
        fb23: fb23,
        fb24: fb24,
        fb25: fb25,
        fb26: fb26,
        fb27: fb27,
        fb28: fb28,
        fb29: fb29,
        fb30: fb30,
        fb31: fb31,
      )
    end
  end # struct

  # Filter bank 22 register 2
  struct F22R2
    ADDRESS = BASE_ADDRESS + 0x2f4_u64

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

    # Filter bits
    def fb0 : Bool
      @value.bits_set?(0x1_u32)
    end

    # Filter bits
    def self.fb0 : Bool
      value.fb0
    end

    # Filter bits
    def self.fb0=(value : Bool) : Bool
      self.set(fb0: value)
      value
    end

    # Filter bits
    def fb1 : Bool
      @value.bits_set?(0x2_u32)
    end

    # Filter bits
    def self.fb1 : Bool
      value.fb1
    end

    # Filter bits
    def self.fb1=(value : Bool) : Bool
      self.set(fb1: value)
      value
    end

    # Filter bits
    def fb2 : Bool
      @value.bits_set?(0x4_u32)
    end

    # Filter bits
    def self.fb2 : Bool
      value.fb2
    end

    # Filter bits
    def self.fb2=(value : Bool) : Bool
      self.set(fb2: value)
      value
    end

    # Filter bits
    def fb3 : Bool
      @value.bits_set?(0x8_u32)
    end

    # Filter bits
    def self.fb3 : Bool
      value.fb3
    end

    # Filter bits
    def self.fb3=(value : Bool) : Bool
      self.set(fb3: value)
      value
    end

    # Filter bits
    def fb4 : Bool
      @value.bits_set?(0x10_u32)
    end

    # Filter bits
    def self.fb4 : Bool
      value.fb4
    end

    # Filter bits
    def self.fb4=(value : Bool) : Bool
      self.set(fb4: value)
      value
    end

    # Filter bits
    def fb5 : Bool
      @value.bits_set?(0x20_u32)
    end

    # Filter bits
    def self.fb5 : Bool
      value.fb5
    end

    # Filter bits
    def self.fb5=(value : Bool) : Bool
      self.set(fb5: value)
      value
    end

    # Filter bits
    def fb6 : Bool
      @value.bits_set?(0x40_u32)
    end

    # Filter bits
    def self.fb6 : Bool
      value.fb6
    end

    # Filter bits
    def self.fb6=(value : Bool) : Bool
      self.set(fb6: value)
      value
    end

    # Filter bits
    def fb7 : Bool
      @value.bits_set?(0x80_u32)
    end

    # Filter bits
    def self.fb7 : Bool
      value.fb7
    end

    # Filter bits
    def self.fb7=(value : Bool) : Bool
      self.set(fb7: value)
      value
    end

    # Filter bits
    def fb8 : Bool
      @value.bits_set?(0x100_u32)
    end

    # Filter bits
    def self.fb8 : Bool
      value.fb8
    end

    # Filter bits
    def self.fb8=(value : Bool) : Bool
      self.set(fb8: value)
      value
    end

    # Filter bits
    def fb9 : Bool
      @value.bits_set?(0x200_u32)
    end

    # Filter bits
    def self.fb9 : Bool
      value.fb9
    end

    # Filter bits
    def self.fb9=(value : Bool) : Bool
      self.set(fb9: value)
      value
    end

    # Filter bits
    def fb10 : Bool
      @value.bits_set?(0x400_u32)
    end

    # Filter bits
    def self.fb10 : Bool
      value.fb10
    end

    # Filter bits
    def self.fb10=(value : Bool) : Bool
      self.set(fb10: value)
      value
    end

    # Filter bits
    def fb11 : Bool
      @value.bits_set?(0x800_u32)
    end

    # Filter bits
    def self.fb11 : Bool
      value.fb11
    end

    # Filter bits
    def self.fb11=(value : Bool) : Bool
      self.set(fb11: value)
      value
    end

    # Filter bits
    def fb12 : Bool
      @value.bits_set?(0x1000_u32)
    end

    # Filter bits
    def self.fb12 : Bool
      value.fb12
    end

    # Filter bits
    def self.fb12=(value : Bool) : Bool
      self.set(fb12: value)
      value
    end

    # Filter bits
    def fb13 : Bool
      @value.bits_set?(0x2000_u32)
    end

    # Filter bits
    def self.fb13 : Bool
      value.fb13
    end

    # Filter bits
    def self.fb13=(value : Bool) : Bool
      self.set(fb13: value)
      value
    end

    # Filter bits
    def fb14 : Bool
      @value.bits_set?(0x4000_u32)
    end

    # Filter bits
    def self.fb14 : Bool
      value.fb14
    end

    # Filter bits
    def self.fb14=(value : Bool) : Bool
      self.set(fb14: value)
      value
    end

    # Filter bits
    def fb15 : Bool
      @value.bits_set?(0x8000_u32)
    end

    # Filter bits
    def self.fb15 : Bool
      value.fb15
    end

    # Filter bits
    def self.fb15=(value : Bool) : Bool
      self.set(fb15: value)
      value
    end

    # Filter bits
    def fb16 : Bool
      @value.bits_set?(0x10000_u32)
    end

    # Filter bits
    def self.fb16 : Bool
      value.fb16
    end

    # Filter bits
    def self.fb16=(value : Bool) : Bool
      self.set(fb16: value)
      value
    end

    # Filter bits
    def fb17 : Bool
      @value.bits_set?(0x20000_u32)
    end

    # Filter bits
    def self.fb17 : Bool
      value.fb17
    end

    # Filter bits
    def self.fb17=(value : Bool) : Bool
      self.set(fb17: value)
      value
    end

    # Filter bits
    def fb18 : Bool
      @value.bits_set?(0x40000_u32)
    end

    # Filter bits
    def self.fb18 : Bool
      value.fb18
    end

    # Filter bits
    def self.fb18=(value : Bool) : Bool
      self.set(fb18: value)
      value
    end

    # Filter bits
    def fb19 : Bool
      @value.bits_set?(0x80000_u32)
    end

    # Filter bits
    def self.fb19 : Bool
      value.fb19
    end

    # Filter bits
    def self.fb19=(value : Bool) : Bool
      self.set(fb19: value)
      value
    end

    # Filter bits
    def fb20 : Bool
      @value.bits_set?(0x100000_u32)
    end

    # Filter bits
    def self.fb20 : Bool
      value.fb20
    end

    # Filter bits
    def self.fb20=(value : Bool) : Bool
      self.set(fb20: value)
      value
    end

    # Filter bits
    def fb21 : Bool
      @value.bits_set?(0x200000_u32)
    end

    # Filter bits
    def self.fb21 : Bool
      value.fb21
    end

    # Filter bits
    def self.fb21=(value : Bool) : Bool
      self.set(fb21: value)
      value
    end

    # Filter bits
    def fb22 : Bool
      @value.bits_set?(0x400000_u32)
    end

    # Filter bits
    def self.fb22 : Bool
      value.fb22
    end

    # Filter bits
    def self.fb22=(value : Bool) : Bool
      self.set(fb22: value)
      value
    end

    # Filter bits
    def fb23 : Bool
      @value.bits_set?(0x800000_u32)
    end

    # Filter bits
    def self.fb23 : Bool
      value.fb23
    end

    # Filter bits
    def self.fb23=(value : Bool) : Bool
      self.set(fb23: value)
      value
    end

    # Filter bits
    def fb24 : Bool
      @value.bits_set?(0x1000000_u32)
    end

    # Filter bits
    def self.fb24 : Bool
      value.fb24
    end

    # Filter bits
    def self.fb24=(value : Bool) : Bool
      self.set(fb24: value)
      value
    end

    # Filter bits
    def fb25 : Bool
      @value.bits_set?(0x2000000_u32)
    end

    # Filter bits
    def self.fb25 : Bool
      value.fb25
    end

    # Filter bits
    def self.fb25=(value : Bool) : Bool
      self.set(fb25: value)
      value
    end

    # Filter bits
    def fb26 : Bool
      @value.bits_set?(0x4000000_u32)
    end

    # Filter bits
    def self.fb26 : Bool
      value.fb26
    end

    # Filter bits
    def self.fb26=(value : Bool) : Bool
      self.set(fb26: value)
      value
    end

    # Filter bits
    def fb27 : Bool
      @value.bits_set?(0x8000000_u32)
    end

    # Filter bits
    def self.fb27 : Bool
      value.fb27
    end

    # Filter bits
    def self.fb27=(value : Bool) : Bool
      self.set(fb27: value)
      value
    end

    # Filter bits
    def fb28 : Bool
      @value.bits_set?(0x10000000_u32)
    end

    # Filter bits
    def self.fb28 : Bool
      value.fb28
    end

    # Filter bits
    def self.fb28=(value : Bool) : Bool
      self.set(fb28: value)
      value
    end

    # Filter bits
    def fb29 : Bool
      @value.bits_set?(0x20000000_u32)
    end

    # Filter bits
    def self.fb29 : Bool
      value.fb29
    end

    # Filter bits
    def self.fb29=(value : Bool) : Bool
      self.set(fb29: value)
      value
    end

    # Filter bits
    def fb30 : Bool
      @value.bits_set?(0x40000000_u32)
    end

    # Filter bits
    def self.fb30 : Bool
      value.fb30
    end

    # Filter bits
    def self.fb30=(value : Bool) : Bool
      self.set(fb30: value)
      value
    end

    # Filter bits
    def fb31 : Bool
      @value.bits_set?(0x80000000_u32)
    end

    # Filter bits
    def self.fb31 : Bool
      value.fb31
    end

    # Filter bits
    def self.fb31=(value : Bool) : Bool
      self.set(fb31: value)
      value
    end

    def copy_with(
      *,

      fb0 : Bool? = nil,

      fb1 : Bool? = nil,

      fb2 : Bool? = nil,

      fb3 : Bool? = nil,

      fb4 : Bool? = nil,

      fb5 : Bool? = nil,

      fb6 : Bool? = nil,

      fb7 : Bool? = nil,

      fb8 : Bool? = nil,

      fb9 : Bool? = nil,

      fb10 : Bool? = nil,

      fb11 : Bool? = nil,

      fb12 : Bool? = nil,

      fb13 : Bool? = nil,

      fb14 : Bool? = nil,

      fb15 : Bool? = nil,

      fb16 : Bool? = nil,

      fb17 : Bool? = nil,

      fb18 : Bool? = nil,

      fb19 : Bool? = nil,

      fb20 : Bool? = nil,

      fb21 : Bool? = nil,

      fb22 : Bool? = nil,

      fb23 : Bool? = nil,

      fb24 : Bool? = nil,

      fb25 : Bool? = nil,

      fb26 : Bool? = nil,

      fb27 : Bool? = nil,

      fb28 : Bool? = nil,

      fb29 : Bool? = nil,

      fb30 : Bool? = nil,

      fb31 : Bool? = nil
    ) : self
      value = @value

      unless fb0.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(fb0.to_int).&(0x1_u32) << 0
      end

      unless fb1.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(fb1.to_int).&(0x1_u32) << 1
      end

      unless fb2.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(fb2.to_int).&(0x1_u32) << 2
      end

      unless fb3.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(fb3.to_int).&(0x1_u32) << 3
      end

      unless fb4.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(fb4.to_int).&(0x1_u32) << 4
      end

      unless fb5.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(fb5.to_int).&(0x1_u32) << 5
      end

      unless fb6.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(fb6.to_int).&(0x1_u32) << 6
      end

      unless fb7.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(fb7.to_int).&(0x1_u32) << 7
      end

      unless fb8.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(fb8.to_int).&(0x1_u32) << 8
      end

      unless fb9.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(fb9.to_int).&(0x1_u32) << 9
      end

      unless fb10.nil?
        value = (value & 0xfffffbff_u32) |
                UInt32.new!(fb10.to_int).&(0x1_u32) << 10
      end

      unless fb11.nil?
        value = (value & 0xfffff7ff_u32) |
                UInt32.new!(fb11.to_int).&(0x1_u32) << 11
      end

      unless fb12.nil?
        value = (value & 0xffffefff_u32) |
                UInt32.new!(fb12.to_int).&(0x1_u32) << 12
      end

      unless fb13.nil?
        value = (value & 0xffffdfff_u32) |
                UInt32.new!(fb13.to_int).&(0x1_u32) << 13
      end

      unless fb14.nil?
        value = (value & 0xffffbfff_u32) |
                UInt32.new!(fb14.to_int).&(0x1_u32) << 14
      end

      unless fb15.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(fb15.to_int).&(0x1_u32) << 15
      end

      unless fb16.nil?
        value = (value & 0xfffeffff_u32) |
                UInt32.new!(fb16.to_int).&(0x1_u32) << 16
      end

      unless fb17.nil?
        value = (value & 0xfffdffff_u32) |
                UInt32.new!(fb17.to_int).&(0x1_u32) << 17
      end

      unless fb18.nil?
        value = (value & 0xfffbffff_u32) |
                UInt32.new!(fb18.to_int).&(0x1_u32) << 18
      end

      unless fb19.nil?
        value = (value & 0xfff7ffff_u32) |
                UInt32.new!(fb19.to_int).&(0x1_u32) << 19
      end

      unless fb20.nil?
        value = (value & 0xffefffff_u32) |
                UInt32.new!(fb20.to_int).&(0x1_u32) << 20
      end

      unless fb21.nil?
        value = (value & 0xffdfffff_u32) |
                UInt32.new!(fb21.to_int).&(0x1_u32) << 21
      end

      unless fb22.nil?
        value = (value & 0xffbfffff_u32) |
                UInt32.new!(fb22.to_int).&(0x1_u32) << 22
      end

      unless fb23.nil?
        value = (value & 0xff7fffff_u32) |
                UInt32.new!(fb23.to_int).&(0x1_u32) << 23
      end

      unless fb24.nil?
        value = (value & 0xfeffffff_u32) |
                UInt32.new!(fb24.to_int).&(0x1_u32) << 24
      end

      unless fb25.nil?
        value = (value & 0xfdffffff_u32) |
                UInt32.new!(fb25.to_int).&(0x1_u32) << 25
      end

      unless fb26.nil?
        value = (value & 0xfbffffff_u32) |
                UInt32.new!(fb26.to_int).&(0x1_u32) << 26
      end

      unless fb27.nil?
        value = (value & 0xf7ffffff_u32) |
                UInt32.new!(fb27.to_int).&(0x1_u32) << 27
      end

      unless fb28.nil?
        value = (value & 0xefffffff_u32) |
                UInt32.new!(fb28.to_int).&(0x1_u32) << 28
      end

      unless fb29.nil?
        value = (value & 0xdfffffff_u32) |
                UInt32.new!(fb29.to_int).&(0x1_u32) << 29
      end

      unless fb30.nil?
        value = (value & 0xbfffffff_u32) |
                UInt32.new!(fb30.to_int).&(0x1_u32) << 30
      end

      unless fb31.nil?
        value = (value & 0x7fffffff_u32) |
                UInt32.new!(fb31.to_int).&(0x1_u32) << 31
      end

      self.class.new(value)
    end

    def self.set(
      *,
      fb0 : Bool? = nil,
      fb1 : Bool? = nil,
      fb2 : Bool? = nil,
      fb3 : Bool? = nil,
      fb4 : Bool? = nil,
      fb5 : Bool? = nil,
      fb6 : Bool? = nil,
      fb7 : Bool? = nil,
      fb8 : Bool? = nil,
      fb9 : Bool? = nil,
      fb10 : Bool? = nil,
      fb11 : Bool? = nil,
      fb12 : Bool? = nil,
      fb13 : Bool? = nil,
      fb14 : Bool? = nil,
      fb15 : Bool? = nil,
      fb16 : Bool? = nil,
      fb17 : Bool? = nil,
      fb18 : Bool? = nil,
      fb19 : Bool? = nil,
      fb20 : Bool? = nil,
      fb21 : Bool? = nil,
      fb22 : Bool? = nil,
      fb23 : Bool? = nil,
      fb24 : Bool? = nil,
      fb25 : Bool? = nil,
      fb26 : Bool? = nil,
      fb27 : Bool? = nil,
      fb28 : Bool? = nil,
      fb29 : Bool? = nil,
      fb30 : Bool? = nil,
      fb31 : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        fb0: fb0,
        fb1: fb1,
        fb2: fb2,
        fb3: fb3,
        fb4: fb4,
        fb5: fb5,
        fb6: fb6,
        fb7: fb7,
        fb8: fb8,
        fb9: fb9,
        fb10: fb10,
        fb11: fb11,
        fb12: fb12,
        fb13: fb13,
        fb14: fb14,
        fb15: fb15,
        fb16: fb16,
        fb17: fb17,
        fb18: fb18,
        fb19: fb19,
        fb20: fb20,
        fb21: fb21,
        fb22: fb22,
        fb23: fb23,
        fb24: fb24,
        fb25: fb25,
        fb26: fb26,
        fb27: fb27,
        fb28: fb28,
        fb29: fb29,
        fb30: fb30,
        fb31: fb31,
      )
    end
  end # struct

  # Filter bank 23 register 1
  struct F23R1
    ADDRESS = BASE_ADDRESS + 0x2f8_u64

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

    # Filter bits
    def fb0 : Bool
      @value.bits_set?(0x1_u32)
    end

    # Filter bits
    def self.fb0 : Bool
      value.fb0
    end

    # Filter bits
    def self.fb0=(value : Bool) : Bool
      self.set(fb0: value)
      value
    end

    # Filter bits
    def fb1 : Bool
      @value.bits_set?(0x2_u32)
    end

    # Filter bits
    def self.fb1 : Bool
      value.fb1
    end

    # Filter bits
    def self.fb1=(value : Bool) : Bool
      self.set(fb1: value)
      value
    end

    # Filter bits
    def fb2 : Bool
      @value.bits_set?(0x4_u32)
    end

    # Filter bits
    def self.fb2 : Bool
      value.fb2
    end

    # Filter bits
    def self.fb2=(value : Bool) : Bool
      self.set(fb2: value)
      value
    end

    # Filter bits
    def fb3 : Bool
      @value.bits_set?(0x8_u32)
    end

    # Filter bits
    def self.fb3 : Bool
      value.fb3
    end

    # Filter bits
    def self.fb3=(value : Bool) : Bool
      self.set(fb3: value)
      value
    end

    # Filter bits
    def fb4 : Bool
      @value.bits_set?(0x10_u32)
    end

    # Filter bits
    def self.fb4 : Bool
      value.fb4
    end

    # Filter bits
    def self.fb4=(value : Bool) : Bool
      self.set(fb4: value)
      value
    end

    # Filter bits
    def fb5 : Bool
      @value.bits_set?(0x20_u32)
    end

    # Filter bits
    def self.fb5 : Bool
      value.fb5
    end

    # Filter bits
    def self.fb5=(value : Bool) : Bool
      self.set(fb5: value)
      value
    end

    # Filter bits
    def fb6 : Bool
      @value.bits_set?(0x40_u32)
    end

    # Filter bits
    def self.fb6 : Bool
      value.fb6
    end

    # Filter bits
    def self.fb6=(value : Bool) : Bool
      self.set(fb6: value)
      value
    end

    # Filter bits
    def fb7 : Bool
      @value.bits_set?(0x80_u32)
    end

    # Filter bits
    def self.fb7 : Bool
      value.fb7
    end

    # Filter bits
    def self.fb7=(value : Bool) : Bool
      self.set(fb7: value)
      value
    end

    # Filter bits
    def fb8 : Bool
      @value.bits_set?(0x100_u32)
    end

    # Filter bits
    def self.fb8 : Bool
      value.fb8
    end

    # Filter bits
    def self.fb8=(value : Bool) : Bool
      self.set(fb8: value)
      value
    end

    # Filter bits
    def fb9 : Bool
      @value.bits_set?(0x200_u32)
    end

    # Filter bits
    def self.fb9 : Bool
      value.fb9
    end

    # Filter bits
    def self.fb9=(value : Bool) : Bool
      self.set(fb9: value)
      value
    end

    # Filter bits
    def fb10 : Bool
      @value.bits_set?(0x400_u32)
    end

    # Filter bits
    def self.fb10 : Bool
      value.fb10
    end

    # Filter bits
    def self.fb10=(value : Bool) : Bool
      self.set(fb10: value)
      value
    end

    # Filter bits
    def fb11 : Bool
      @value.bits_set?(0x800_u32)
    end

    # Filter bits
    def self.fb11 : Bool
      value.fb11
    end

    # Filter bits
    def self.fb11=(value : Bool) : Bool
      self.set(fb11: value)
      value
    end

    # Filter bits
    def fb12 : Bool
      @value.bits_set?(0x1000_u32)
    end

    # Filter bits
    def self.fb12 : Bool
      value.fb12
    end

    # Filter bits
    def self.fb12=(value : Bool) : Bool
      self.set(fb12: value)
      value
    end

    # Filter bits
    def fb13 : Bool
      @value.bits_set?(0x2000_u32)
    end

    # Filter bits
    def self.fb13 : Bool
      value.fb13
    end

    # Filter bits
    def self.fb13=(value : Bool) : Bool
      self.set(fb13: value)
      value
    end

    # Filter bits
    def fb14 : Bool
      @value.bits_set?(0x4000_u32)
    end

    # Filter bits
    def self.fb14 : Bool
      value.fb14
    end

    # Filter bits
    def self.fb14=(value : Bool) : Bool
      self.set(fb14: value)
      value
    end

    # Filter bits
    def fb15 : Bool
      @value.bits_set?(0x8000_u32)
    end

    # Filter bits
    def self.fb15 : Bool
      value.fb15
    end

    # Filter bits
    def self.fb15=(value : Bool) : Bool
      self.set(fb15: value)
      value
    end

    # Filter bits
    def fb16 : Bool
      @value.bits_set?(0x10000_u32)
    end

    # Filter bits
    def self.fb16 : Bool
      value.fb16
    end

    # Filter bits
    def self.fb16=(value : Bool) : Bool
      self.set(fb16: value)
      value
    end

    # Filter bits
    def fb17 : Bool
      @value.bits_set?(0x20000_u32)
    end

    # Filter bits
    def self.fb17 : Bool
      value.fb17
    end

    # Filter bits
    def self.fb17=(value : Bool) : Bool
      self.set(fb17: value)
      value
    end

    # Filter bits
    def fb18 : Bool
      @value.bits_set?(0x40000_u32)
    end

    # Filter bits
    def self.fb18 : Bool
      value.fb18
    end

    # Filter bits
    def self.fb18=(value : Bool) : Bool
      self.set(fb18: value)
      value
    end

    # Filter bits
    def fb19 : Bool
      @value.bits_set?(0x80000_u32)
    end

    # Filter bits
    def self.fb19 : Bool
      value.fb19
    end

    # Filter bits
    def self.fb19=(value : Bool) : Bool
      self.set(fb19: value)
      value
    end

    # Filter bits
    def fb20 : Bool
      @value.bits_set?(0x100000_u32)
    end

    # Filter bits
    def self.fb20 : Bool
      value.fb20
    end

    # Filter bits
    def self.fb20=(value : Bool) : Bool
      self.set(fb20: value)
      value
    end

    # Filter bits
    def fb21 : Bool
      @value.bits_set?(0x200000_u32)
    end

    # Filter bits
    def self.fb21 : Bool
      value.fb21
    end

    # Filter bits
    def self.fb21=(value : Bool) : Bool
      self.set(fb21: value)
      value
    end

    # Filter bits
    def fb22 : Bool
      @value.bits_set?(0x400000_u32)
    end

    # Filter bits
    def self.fb22 : Bool
      value.fb22
    end

    # Filter bits
    def self.fb22=(value : Bool) : Bool
      self.set(fb22: value)
      value
    end

    # Filter bits
    def fb23 : Bool
      @value.bits_set?(0x800000_u32)
    end

    # Filter bits
    def self.fb23 : Bool
      value.fb23
    end

    # Filter bits
    def self.fb23=(value : Bool) : Bool
      self.set(fb23: value)
      value
    end

    # Filter bits
    def fb24 : Bool
      @value.bits_set?(0x1000000_u32)
    end

    # Filter bits
    def self.fb24 : Bool
      value.fb24
    end

    # Filter bits
    def self.fb24=(value : Bool) : Bool
      self.set(fb24: value)
      value
    end

    # Filter bits
    def fb25 : Bool
      @value.bits_set?(0x2000000_u32)
    end

    # Filter bits
    def self.fb25 : Bool
      value.fb25
    end

    # Filter bits
    def self.fb25=(value : Bool) : Bool
      self.set(fb25: value)
      value
    end

    # Filter bits
    def fb26 : Bool
      @value.bits_set?(0x4000000_u32)
    end

    # Filter bits
    def self.fb26 : Bool
      value.fb26
    end

    # Filter bits
    def self.fb26=(value : Bool) : Bool
      self.set(fb26: value)
      value
    end

    # Filter bits
    def fb27 : Bool
      @value.bits_set?(0x8000000_u32)
    end

    # Filter bits
    def self.fb27 : Bool
      value.fb27
    end

    # Filter bits
    def self.fb27=(value : Bool) : Bool
      self.set(fb27: value)
      value
    end

    # Filter bits
    def fb28 : Bool
      @value.bits_set?(0x10000000_u32)
    end

    # Filter bits
    def self.fb28 : Bool
      value.fb28
    end

    # Filter bits
    def self.fb28=(value : Bool) : Bool
      self.set(fb28: value)
      value
    end

    # Filter bits
    def fb29 : Bool
      @value.bits_set?(0x20000000_u32)
    end

    # Filter bits
    def self.fb29 : Bool
      value.fb29
    end

    # Filter bits
    def self.fb29=(value : Bool) : Bool
      self.set(fb29: value)
      value
    end

    # Filter bits
    def fb30 : Bool
      @value.bits_set?(0x40000000_u32)
    end

    # Filter bits
    def self.fb30 : Bool
      value.fb30
    end

    # Filter bits
    def self.fb30=(value : Bool) : Bool
      self.set(fb30: value)
      value
    end

    # Filter bits
    def fb31 : Bool
      @value.bits_set?(0x80000000_u32)
    end

    # Filter bits
    def self.fb31 : Bool
      value.fb31
    end

    # Filter bits
    def self.fb31=(value : Bool) : Bool
      self.set(fb31: value)
      value
    end

    def copy_with(
      *,

      fb0 : Bool? = nil,

      fb1 : Bool? = nil,

      fb2 : Bool? = nil,

      fb3 : Bool? = nil,

      fb4 : Bool? = nil,

      fb5 : Bool? = nil,

      fb6 : Bool? = nil,

      fb7 : Bool? = nil,

      fb8 : Bool? = nil,

      fb9 : Bool? = nil,

      fb10 : Bool? = nil,

      fb11 : Bool? = nil,

      fb12 : Bool? = nil,

      fb13 : Bool? = nil,

      fb14 : Bool? = nil,

      fb15 : Bool? = nil,

      fb16 : Bool? = nil,

      fb17 : Bool? = nil,

      fb18 : Bool? = nil,

      fb19 : Bool? = nil,

      fb20 : Bool? = nil,

      fb21 : Bool? = nil,

      fb22 : Bool? = nil,

      fb23 : Bool? = nil,

      fb24 : Bool? = nil,

      fb25 : Bool? = nil,

      fb26 : Bool? = nil,

      fb27 : Bool? = nil,

      fb28 : Bool? = nil,

      fb29 : Bool? = nil,

      fb30 : Bool? = nil,

      fb31 : Bool? = nil
    ) : self
      value = @value

      unless fb0.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(fb0.to_int).&(0x1_u32) << 0
      end

      unless fb1.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(fb1.to_int).&(0x1_u32) << 1
      end

      unless fb2.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(fb2.to_int).&(0x1_u32) << 2
      end

      unless fb3.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(fb3.to_int).&(0x1_u32) << 3
      end

      unless fb4.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(fb4.to_int).&(0x1_u32) << 4
      end

      unless fb5.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(fb5.to_int).&(0x1_u32) << 5
      end

      unless fb6.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(fb6.to_int).&(0x1_u32) << 6
      end

      unless fb7.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(fb7.to_int).&(0x1_u32) << 7
      end

      unless fb8.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(fb8.to_int).&(0x1_u32) << 8
      end

      unless fb9.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(fb9.to_int).&(0x1_u32) << 9
      end

      unless fb10.nil?
        value = (value & 0xfffffbff_u32) |
                UInt32.new!(fb10.to_int).&(0x1_u32) << 10
      end

      unless fb11.nil?
        value = (value & 0xfffff7ff_u32) |
                UInt32.new!(fb11.to_int).&(0x1_u32) << 11
      end

      unless fb12.nil?
        value = (value & 0xffffefff_u32) |
                UInt32.new!(fb12.to_int).&(0x1_u32) << 12
      end

      unless fb13.nil?
        value = (value & 0xffffdfff_u32) |
                UInt32.new!(fb13.to_int).&(0x1_u32) << 13
      end

      unless fb14.nil?
        value = (value & 0xffffbfff_u32) |
                UInt32.new!(fb14.to_int).&(0x1_u32) << 14
      end

      unless fb15.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(fb15.to_int).&(0x1_u32) << 15
      end

      unless fb16.nil?
        value = (value & 0xfffeffff_u32) |
                UInt32.new!(fb16.to_int).&(0x1_u32) << 16
      end

      unless fb17.nil?
        value = (value & 0xfffdffff_u32) |
                UInt32.new!(fb17.to_int).&(0x1_u32) << 17
      end

      unless fb18.nil?
        value = (value & 0xfffbffff_u32) |
                UInt32.new!(fb18.to_int).&(0x1_u32) << 18
      end

      unless fb19.nil?
        value = (value & 0xfff7ffff_u32) |
                UInt32.new!(fb19.to_int).&(0x1_u32) << 19
      end

      unless fb20.nil?
        value = (value & 0xffefffff_u32) |
                UInt32.new!(fb20.to_int).&(0x1_u32) << 20
      end

      unless fb21.nil?
        value = (value & 0xffdfffff_u32) |
                UInt32.new!(fb21.to_int).&(0x1_u32) << 21
      end

      unless fb22.nil?
        value = (value & 0xffbfffff_u32) |
                UInt32.new!(fb22.to_int).&(0x1_u32) << 22
      end

      unless fb23.nil?
        value = (value & 0xff7fffff_u32) |
                UInt32.new!(fb23.to_int).&(0x1_u32) << 23
      end

      unless fb24.nil?
        value = (value & 0xfeffffff_u32) |
                UInt32.new!(fb24.to_int).&(0x1_u32) << 24
      end

      unless fb25.nil?
        value = (value & 0xfdffffff_u32) |
                UInt32.new!(fb25.to_int).&(0x1_u32) << 25
      end

      unless fb26.nil?
        value = (value & 0xfbffffff_u32) |
                UInt32.new!(fb26.to_int).&(0x1_u32) << 26
      end

      unless fb27.nil?
        value = (value & 0xf7ffffff_u32) |
                UInt32.new!(fb27.to_int).&(0x1_u32) << 27
      end

      unless fb28.nil?
        value = (value & 0xefffffff_u32) |
                UInt32.new!(fb28.to_int).&(0x1_u32) << 28
      end

      unless fb29.nil?
        value = (value & 0xdfffffff_u32) |
                UInt32.new!(fb29.to_int).&(0x1_u32) << 29
      end

      unless fb30.nil?
        value = (value & 0xbfffffff_u32) |
                UInt32.new!(fb30.to_int).&(0x1_u32) << 30
      end

      unless fb31.nil?
        value = (value & 0x7fffffff_u32) |
                UInt32.new!(fb31.to_int).&(0x1_u32) << 31
      end

      self.class.new(value)
    end

    def self.set(
      *,
      fb0 : Bool? = nil,
      fb1 : Bool? = nil,
      fb2 : Bool? = nil,
      fb3 : Bool? = nil,
      fb4 : Bool? = nil,
      fb5 : Bool? = nil,
      fb6 : Bool? = nil,
      fb7 : Bool? = nil,
      fb8 : Bool? = nil,
      fb9 : Bool? = nil,
      fb10 : Bool? = nil,
      fb11 : Bool? = nil,
      fb12 : Bool? = nil,
      fb13 : Bool? = nil,
      fb14 : Bool? = nil,
      fb15 : Bool? = nil,
      fb16 : Bool? = nil,
      fb17 : Bool? = nil,
      fb18 : Bool? = nil,
      fb19 : Bool? = nil,
      fb20 : Bool? = nil,
      fb21 : Bool? = nil,
      fb22 : Bool? = nil,
      fb23 : Bool? = nil,
      fb24 : Bool? = nil,
      fb25 : Bool? = nil,
      fb26 : Bool? = nil,
      fb27 : Bool? = nil,
      fb28 : Bool? = nil,
      fb29 : Bool? = nil,
      fb30 : Bool? = nil,
      fb31 : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        fb0: fb0,
        fb1: fb1,
        fb2: fb2,
        fb3: fb3,
        fb4: fb4,
        fb5: fb5,
        fb6: fb6,
        fb7: fb7,
        fb8: fb8,
        fb9: fb9,
        fb10: fb10,
        fb11: fb11,
        fb12: fb12,
        fb13: fb13,
        fb14: fb14,
        fb15: fb15,
        fb16: fb16,
        fb17: fb17,
        fb18: fb18,
        fb19: fb19,
        fb20: fb20,
        fb21: fb21,
        fb22: fb22,
        fb23: fb23,
        fb24: fb24,
        fb25: fb25,
        fb26: fb26,
        fb27: fb27,
        fb28: fb28,
        fb29: fb29,
        fb30: fb30,
        fb31: fb31,
      )
    end
  end # struct

  # Filter bank 23 register 2
  struct F23R2
    ADDRESS = BASE_ADDRESS + 0x2fc_u64

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

    # Filter bits
    def fb0 : Bool
      @value.bits_set?(0x1_u32)
    end

    # Filter bits
    def self.fb0 : Bool
      value.fb0
    end

    # Filter bits
    def self.fb0=(value : Bool) : Bool
      self.set(fb0: value)
      value
    end

    # Filter bits
    def fb1 : Bool
      @value.bits_set?(0x2_u32)
    end

    # Filter bits
    def self.fb1 : Bool
      value.fb1
    end

    # Filter bits
    def self.fb1=(value : Bool) : Bool
      self.set(fb1: value)
      value
    end

    # Filter bits
    def fb2 : Bool
      @value.bits_set?(0x4_u32)
    end

    # Filter bits
    def self.fb2 : Bool
      value.fb2
    end

    # Filter bits
    def self.fb2=(value : Bool) : Bool
      self.set(fb2: value)
      value
    end

    # Filter bits
    def fb3 : Bool
      @value.bits_set?(0x8_u32)
    end

    # Filter bits
    def self.fb3 : Bool
      value.fb3
    end

    # Filter bits
    def self.fb3=(value : Bool) : Bool
      self.set(fb3: value)
      value
    end

    # Filter bits
    def fb4 : Bool
      @value.bits_set?(0x10_u32)
    end

    # Filter bits
    def self.fb4 : Bool
      value.fb4
    end

    # Filter bits
    def self.fb4=(value : Bool) : Bool
      self.set(fb4: value)
      value
    end

    # Filter bits
    def fb5 : Bool
      @value.bits_set?(0x20_u32)
    end

    # Filter bits
    def self.fb5 : Bool
      value.fb5
    end

    # Filter bits
    def self.fb5=(value : Bool) : Bool
      self.set(fb5: value)
      value
    end

    # Filter bits
    def fb6 : Bool
      @value.bits_set?(0x40_u32)
    end

    # Filter bits
    def self.fb6 : Bool
      value.fb6
    end

    # Filter bits
    def self.fb6=(value : Bool) : Bool
      self.set(fb6: value)
      value
    end

    # Filter bits
    def fb7 : Bool
      @value.bits_set?(0x80_u32)
    end

    # Filter bits
    def self.fb7 : Bool
      value.fb7
    end

    # Filter bits
    def self.fb7=(value : Bool) : Bool
      self.set(fb7: value)
      value
    end

    # Filter bits
    def fb8 : Bool
      @value.bits_set?(0x100_u32)
    end

    # Filter bits
    def self.fb8 : Bool
      value.fb8
    end

    # Filter bits
    def self.fb8=(value : Bool) : Bool
      self.set(fb8: value)
      value
    end

    # Filter bits
    def fb9 : Bool
      @value.bits_set?(0x200_u32)
    end

    # Filter bits
    def self.fb9 : Bool
      value.fb9
    end

    # Filter bits
    def self.fb9=(value : Bool) : Bool
      self.set(fb9: value)
      value
    end

    # Filter bits
    def fb10 : Bool
      @value.bits_set?(0x400_u32)
    end

    # Filter bits
    def self.fb10 : Bool
      value.fb10
    end

    # Filter bits
    def self.fb10=(value : Bool) : Bool
      self.set(fb10: value)
      value
    end

    # Filter bits
    def fb11 : Bool
      @value.bits_set?(0x800_u32)
    end

    # Filter bits
    def self.fb11 : Bool
      value.fb11
    end

    # Filter bits
    def self.fb11=(value : Bool) : Bool
      self.set(fb11: value)
      value
    end

    # Filter bits
    def fb12 : Bool
      @value.bits_set?(0x1000_u32)
    end

    # Filter bits
    def self.fb12 : Bool
      value.fb12
    end

    # Filter bits
    def self.fb12=(value : Bool) : Bool
      self.set(fb12: value)
      value
    end

    # Filter bits
    def fb13 : Bool
      @value.bits_set?(0x2000_u32)
    end

    # Filter bits
    def self.fb13 : Bool
      value.fb13
    end

    # Filter bits
    def self.fb13=(value : Bool) : Bool
      self.set(fb13: value)
      value
    end

    # Filter bits
    def fb14 : Bool
      @value.bits_set?(0x4000_u32)
    end

    # Filter bits
    def self.fb14 : Bool
      value.fb14
    end

    # Filter bits
    def self.fb14=(value : Bool) : Bool
      self.set(fb14: value)
      value
    end

    # Filter bits
    def fb15 : Bool
      @value.bits_set?(0x8000_u32)
    end

    # Filter bits
    def self.fb15 : Bool
      value.fb15
    end

    # Filter bits
    def self.fb15=(value : Bool) : Bool
      self.set(fb15: value)
      value
    end

    # Filter bits
    def fb16 : Bool
      @value.bits_set?(0x10000_u32)
    end

    # Filter bits
    def self.fb16 : Bool
      value.fb16
    end

    # Filter bits
    def self.fb16=(value : Bool) : Bool
      self.set(fb16: value)
      value
    end

    # Filter bits
    def fb17 : Bool
      @value.bits_set?(0x20000_u32)
    end

    # Filter bits
    def self.fb17 : Bool
      value.fb17
    end

    # Filter bits
    def self.fb17=(value : Bool) : Bool
      self.set(fb17: value)
      value
    end

    # Filter bits
    def fb18 : Bool
      @value.bits_set?(0x40000_u32)
    end

    # Filter bits
    def self.fb18 : Bool
      value.fb18
    end

    # Filter bits
    def self.fb18=(value : Bool) : Bool
      self.set(fb18: value)
      value
    end

    # Filter bits
    def fb19 : Bool
      @value.bits_set?(0x80000_u32)
    end

    # Filter bits
    def self.fb19 : Bool
      value.fb19
    end

    # Filter bits
    def self.fb19=(value : Bool) : Bool
      self.set(fb19: value)
      value
    end

    # Filter bits
    def fb20 : Bool
      @value.bits_set?(0x100000_u32)
    end

    # Filter bits
    def self.fb20 : Bool
      value.fb20
    end

    # Filter bits
    def self.fb20=(value : Bool) : Bool
      self.set(fb20: value)
      value
    end

    # Filter bits
    def fb21 : Bool
      @value.bits_set?(0x200000_u32)
    end

    # Filter bits
    def self.fb21 : Bool
      value.fb21
    end

    # Filter bits
    def self.fb21=(value : Bool) : Bool
      self.set(fb21: value)
      value
    end

    # Filter bits
    def fb22 : Bool
      @value.bits_set?(0x400000_u32)
    end

    # Filter bits
    def self.fb22 : Bool
      value.fb22
    end

    # Filter bits
    def self.fb22=(value : Bool) : Bool
      self.set(fb22: value)
      value
    end

    # Filter bits
    def fb23 : Bool
      @value.bits_set?(0x800000_u32)
    end

    # Filter bits
    def self.fb23 : Bool
      value.fb23
    end

    # Filter bits
    def self.fb23=(value : Bool) : Bool
      self.set(fb23: value)
      value
    end

    # Filter bits
    def fb24 : Bool
      @value.bits_set?(0x1000000_u32)
    end

    # Filter bits
    def self.fb24 : Bool
      value.fb24
    end

    # Filter bits
    def self.fb24=(value : Bool) : Bool
      self.set(fb24: value)
      value
    end

    # Filter bits
    def fb25 : Bool
      @value.bits_set?(0x2000000_u32)
    end

    # Filter bits
    def self.fb25 : Bool
      value.fb25
    end

    # Filter bits
    def self.fb25=(value : Bool) : Bool
      self.set(fb25: value)
      value
    end

    # Filter bits
    def fb26 : Bool
      @value.bits_set?(0x4000000_u32)
    end

    # Filter bits
    def self.fb26 : Bool
      value.fb26
    end

    # Filter bits
    def self.fb26=(value : Bool) : Bool
      self.set(fb26: value)
      value
    end

    # Filter bits
    def fb27 : Bool
      @value.bits_set?(0x8000000_u32)
    end

    # Filter bits
    def self.fb27 : Bool
      value.fb27
    end

    # Filter bits
    def self.fb27=(value : Bool) : Bool
      self.set(fb27: value)
      value
    end

    # Filter bits
    def fb28 : Bool
      @value.bits_set?(0x10000000_u32)
    end

    # Filter bits
    def self.fb28 : Bool
      value.fb28
    end

    # Filter bits
    def self.fb28=(value : Bool) : Bool
      self.set(fb28: value)
      value
    end

    # Filter bits
    def fb29 : Bool
      @value.bits_set?(0x20000000_u32)
    end

    # Filter bits
    def self.fb29 : Bool
      value.fb29
    end

    # Filter bits
    def self.fb29=(value : Bool) : Bool
      self.set(fb29: value)
      value
    end

    # Filter bits
    def fb30 : Bool
      @value.bits_set?(0x40000000_u32)
    end

    # Filter bits
    def self.fb30 : Bool
      value.fb30
    end

    # Filter bits
    def self.fb30=(value : Bool) : Bool
      self.set(fb30: value)
      value
    end

    # Filter bits
    def fb31 : Bool
      @value.bits_set?(0x80000000_u32)
    end

    # Filter bits
    def self.fb31 : Bool
      value.fb31
    end

    # Filter bits
    def self.fb31=(value : Bool) : Bool
      self.set(fb31: value)
      value
    end

    def copy_with(
      *,

      fb0 : Bool? = nil,

      fb1 : Bool? = nil,

      fb2 : Bool? = nil,

      fb3 : Bool? = nil,

      fb4 : Bool? = nil,

      fb5 : Bool? = nil,

      fb6 : Bool? = nil,

      fb7 : Bool? = nil,

      fb8 : Bool? = nil,

      fb9 : Bool? = nil,

      fb10 : Bool? = nil,

      fb11 : Bool? = nil,

      fb12 : Bool? = nil,

      fb13 : Bool? = nil,

      fb14 : Bool? = nil,

      fb15 : Bool? = nil,

      fb16 : Bool? = nil,

      fb17 : Bool? = nil,

      fb18 : Bool? = nil,

      fb19 : Bool? = nil,

      fb20 : Bool? = nil,

      fb21 : Bool? = nil,

      fb22 : Bool? = nil,

      fb23 : Bool? = nil,

      fb24 : Bool? = nil,

      fb25 : Bool? = nil,

      fb26 : Bool? = nil,

      fb27 : Bool? = nil,

      fb28 : Bool? = nil,

      fb29 : Bool? = nil,

      fb30 : Bool? = nil,

      fb31 : Bool? = nil
    ) : self
      value = @value

      unless fb0.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(fb0.to_int).&(0x1_u32) << 0
      end

      unless fb1.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(fb1.to_int).&(0x1_u32) << 1
      end

      unless fb2.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(fb2.to_int).&(0x1_u32) << 2
      end

      unless fb3.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(fb3.to_int).&(0x1_u32) << 3
      end

      unless fb4.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(fb4.to_int).&(0x1_u32) << 4
      end

      unless fb5.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(fb5.to_int).&(0x1_u32) << 5
      end

      unless fb6.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(fb6.to_int).&(0x1_u32) << 6
      end

      unless fb7.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(fb7.to_int).&(0x1_u32) << 7
      end

      unless fb8.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(fb8.to_int).&(0x1_u32) << 8
      end

      unless fb9.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(fb9.to_int).&(0x1_u32) << 9
      end

      unless fb10.nil?
        value = (value & 0xfffffbff_u32) |
                UInt32.new!(fb10.to_int).&(0x1_u32) << 10
      end

      unless fb11.nil?
        value = (value & 0xfffff7ff_u32) |
                UInt32.new!(fb11.to_int).&(0x1_u32) << 11
      end

      unless fb12.nil?
        value = (value & 0xffffefff_u32) |
                UInt32.new!(fb12.to_int).&(0x1_u32) << 12
      end

      unless fb13.nil?
        value = (value & 0xffffdfff_u32) |
                UInt32.new!(fb13.to_int).&(0x1_u32) << 13
      end

      unless fb14.nil?
        value = (value & 0xffffbfff_u32) |
                UInt32.new!(fb14.to_int).&(0x1_u32) << 14
      end

      unless fb15.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(fb15.to_int).&(0x1_u32) << 15
      end

      unless fb16.nil?
        value = (value & 0xfffeffff_u32) |
                UInt32.new!(fb16.to_int).&(0x1_u32) << 16
      end

      unless fb17.nil?
        value = (value & 0xfffdffff_u32) |
                UInt32.new!(fb17.to_int).&(0x1_u32) << 17
      end

      unless fb18.nil?
        value = (value & 0xfffbffff_u32) |
                UInt32.new!(fb18.to_int).&(0x1_u32) << 18
      end

      unless fb19.nil?
        value = (value & 0xfff7ffff_u32) |
                UInt32.new!(fb19.to_int).&(0x1_u32) << 19
      end

      unless fb20.nil?
        value = (value & 0xffefffff_u32) |
                UInt32.new!(fb20.to_int).&(0x1_u32) << 20
      end

      unless fb21.nil?
        value = (value & 0xffdfffff_u32) |
                UInt32.new!(fb21.to_int).&(0x1_u32) << 21
      end

      unless fb22.nil?
        value = (value & 0xffbfffff_u32) |
                UInt32.new!(fb22.to_int).&(0x1_u32) << 22
      end

      unless fb23.nil?
        value = (value & 0xff7fffff_u32) |
                UInt32.new!(fb23.to_int).&(0x1_u32) << 23
      end

      unless fb24.nil?
        value = (value & 0xfeffffff_u32) |
                UInt32.new!(fb24.to_int).&(0x1_u32) << 24
      end

      unless fb25.nil?
        value = (value & 0xfdffffff_u32) |
                UInt32.new!(fb25.to_int).&(0x1_u32) << 25
      end

      unless fb26.nil?
        value = (value & 0xfbffffff_u32) |
                UInt32.new!(fb26.to_int).&(0x1_u32) << 26
      end

      unless fb27.nil?
        value = (value & 0xf7ffffff_u32) |
                UInt32.new!(fb27.to_int).&(0x1_u32) << 27
      end

      unless fb28.nil?
        value = (value & 0xefffffff_u32) |
                UInt32.new!(fb28.to_int).&(0x1_u32) << 28
      end

      unless fb29.nil?
        value = (value & 0xdfffffff_u32) |
                UInt32.new!(fb29.to_int).&(0x1_u32) << 29
      end

      unless fb30.nil?
        value = (value & 0xbfffffff_u32) |
                UInt32.new!(fb30.to_int).&(0x1_u32) << 30
      end

      unless fb31.nil?
        value = (value & 0x7fffffff_u32) |
                UInt32.new!(fb31.to_int).&(0x1_u32) << 31
      end

      self.class.new(value)
    end

    def self.set(
      *,
      fb0 : Bool? = nil,
      fb1 : Bool? = nil,
      fb2 : Bool? = nil,
      fb3 : Bool? = nil,
      fb4 : Bool? = nil,
      fb5 : Bool? = nil,
      fb6 : Bool? = nil,
      fb7 : Bool? = nil,
      fb8 : Bool? = nil,
      fb9 : Bool? = nil,
      fb10 : Bool? = nil,
      fb11 : Bool? = nil,
      fb12 : Bool? = nil,
      fb13 : Bool? = nil,
      fb14 : Bool? = nil,
      fb15 : Bool? = nil,
      fb16 : Bool? = nil,
      fb17 : Bool? = nil,
      fb18 : Bool? = nil,
      fb19 : Bool? = nil,
      fb20 : Bool? = nil,
      fb21 : Bool? = nil,
      fb22 : Bool? = nil,
      fb23 : Bool? = nil,
      fb24 : Bool? = nil,
      fb25 : Bool? = nil,
      fb26 : Bool? = nil,
      fb27 : Bool? = nil,
      fb28 : Bool? = nil,
      fb29 : Bool? = nil,
      fb30 : Bool? = nil,
      fb31 : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        fb0: fb0,
        fb1: fb1,
        fb2: fb2,
        fb3: fb3,
        fb4: fb4,
        fb5: fb5,
        fb6: fb6,
        fb7: fb7,
        fb8: fb8,
        fb9: fb9,
        fb10: fb10,
        fb11: fb11,
        fb12: fb12,
        fb13: fb13,
        fb14: fb14,
        fb15: fb15,
        fb16: fb16,
        fb17: fb17,
        fb18: fb18,
        fb19: fb19,
        fb20: fb20,
        fb21: fb21,
        fb22: fb22,
        fb23: fb23,
        fb24: fb24,
        fb25: fb25,
        fb26: fb26,
        fb27: fb27,
        fb28: fb28,
        fb29: fb29,
        fb30: fb30,
        fb31: fb31,
      )
    end
  end # struct

  # Filter bank 24 register 1
  struct F24R1
    ADDRESS = BASE_ADDRESS + 0x300_u64

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

    # Filter bits
    def fb0 : Bool
      @value.bits_set?(0x1_u32)
    end

    # Filter bits
    def self.fb0 : Bool
      value.fb0
    end

    # Filter bits
    def self.fb0=(value : Bool) : Bool
      self.set(fb0: value)
      value
    end

    # Filter bits
    def fb1 : Bool
      @value.bits_set?(0x2_u32)
    end

    # Filter bits
    def self.fb1 : Bool
      value.fb1
    end

    # Filter bits
    def self.fb1=(value : Bool) : Bool
      self.set(fb1: value)
      value
    end

    # Filter bits
    def fb2 : Bool
      @value.bits_set?(0x4_u32)
    end

    # Filter bits
    def self.fb2 : Bool
      value.fb2
    end

    # Filter bits
    def self.fb2=(value : Bool) : Bool
      self.set(fb2: value)
      value
    end

    # Filter bits
    def fb3 : Bool
      @value.bits_set?(0x8_u32)
    end

    # Filter bits
    def self.fb3 : Bool
      value.fb3
    end

    # Filter bits
    def self.fb3=(value : Bool) : Bool
      self.set(fb3: value)
      value
    end

    # Filter bits
    def fb4 : Bool
      @value.bits_set?(0x10_u32)
    end

    # Filter bits
    def self.fb4 : Bool
      value.fb4
    end

    # Filter bits
    def self.fb4=(value : Bool) : Bool
      self.set(fb4: value)
      value
    end

    # Filter bits
    def fb5 : Bool
      @value.bits_set?(0x20_u32)
    end

    # Filter bits
    def self.fb5 : Bool
      value.fb5
    end

    # Filter bits
    def self.fb5=(value : Bool) : Bool
      self.set(fb5: value)
      value
    end

    # Filter bits
    def fb6 : Bool
      @value.bits_set?(0x40_u32)
    end

    # Filter bits
    def self.fb6 : Bool
      value.fb6
    end

    # Filter bits
    def self.fb6=(value : Bool) : Bool
      self.set(fb6: value)
      value
    end

    # Filter bits
    def fb7 : Bool
      @value.bits_set?(0x80_u32)
    end

    # Filter bits
    def self.fb7 : Bool
      value.fb7
    end

    # Filter bits
    def self.fb7=(value : Bool) : Bool
      self.set(fb7: value)
      value
    end

    # Filter bits
    def fb8 : Bool
      @value.bits_set?(0x100_u32)
    end

    # Filter bits
    def self.fb8 : Bool
      value.fb8
    end

    # Filter bits
    def self.fb8=(value : Bool) : Bool
      self.set(fb8: value)
      value
    end

    # Filter bits
    def fb9 : Bool
      @value.bits_set?(0x200_u32)
    end

    # Filter bits
    def self.fb9 : Bool
      value.fb9
    end

    # Filter bits
    def self.fb9=(value : Bool) : Bool
      self.set(fb9: value)
      value
    end

    # Filter bits
    def fb10 : Bool
      @value.bits_set?(0x400_u32)
    end

    # Filter bits
    def self.fb10 : Bool
      value.fb10
    end

    # Filter bits
    def self.fb10=(value : Bool) : Bool
      self.set(fb10: value)
      value
    end

    # Filter bits
    def fb11 : Bool
      @value.bits_set?(0x800_u32)
    end

    # Filter bits
    def self.fb11 : Bool
      value.fb11
    end

    # Filter bits
    def self.fb11=(value : Bool) : Bool
      self.set(fb11: value)
      value
    end

    # Filter bits
    def fb12 : Bool
      @value.bits_set?(0x1000_u32)
    end

    # Filter bits
    def self.fb12 : Bool
      value.fb12
    end

    # Filter bits
    def self.fb12=(value : Bool) : Bool
      self.set(fb12: value)
      value
    end

    # Filter bits
    def fb13 : Bool
      @value.bits_set?(0x2000_u32)
    end

    # Filter bits
    def self.fb13 : Bool
      value.fb13
    end

    # Filter bits
    def self.fb13=(value : Bool) : Bool
      self.set(fb13: value)
      value
    end

    # Filter bits
    def fb14 : Bool
      @value.bits_set?(0x4000_u32)
    end

    # Filter bits
    def self.fb14 : Bool
      value.fb14
    end

    # Filter bits
    def self.fb14=(value : Bool) : Bool
      self.set(fb14: value)
      value
    end

    # Filter bits
    def fb15 : Bool
      @value.bits_set?(0x8000_u32)
    end

    # Filter bits
    def self.fb15 : Bool
      value.fb15
    end

    # Filter bits
    def self.fb15=(value : Bool) : Bool
      self.set(fb15: value)
      value
    end

    # Filter bits
    def fb16 : Bool
      @value.bits_set?(0x10000_u32)
    end

    # Filter bits
    def self.fb16 : Bool
      value.fb16
    end

    # Filter bits
    def self.fb16=(value : Bool) : Bool
      self.set(fb16: value)
      value
    end

    # Filter bits
    def fb17 : Bool
      @value.bits_set?(0x20000_u32)
    end

    # Filter bits
    def self.fb17 : Bool
      value.fb17
    end

    # Filter bits
    def self.fb17=(value : Bool) : Bool
      self.set(fb17: value)
      value
    end

    # Filter bits
    def fb18 : Bool
      @value.bits_set?(0x40000_u32)
    end

    # Filter bits
    def self.fb18 : Bool
      value.fb18
    end

    # Filter bits
    def self.fb18=(value : Bool) : Bool
      self.set(fb18: value)
      value
    end

    # Filter bits
    def fb19 : Bool
      @value.bits_set?(0x80000_u32)
    end

    # Filter bits
    def self.fb19 : Bool
      value.fb19
    end

    # Filter bits
    def self.fb19=(value : Bool) : Bool
      self.set(fb19: value)
      value
    end

    # Filter bits
    def fb20 : Bool
      @value.bits_set?(0x100000_u32)
    end

    # Filter bits
    def self.fb20 : Bool
      value.fb20
    end

    # Filter bits
    def self.fb20=(value : Bool) : Bool
      self.set(fb20: value)
      value
    end

    # Filter bits
    def fb21 : Bool
      @value.bits_set?(0x200000_u32)
    end

    # Filter bits
    def self.fb21 : Bool
      value.fb21
    end

    # Filter bits
    def self.fb21=(value : Bool) : Bool
      self.set(fb21: value)
      value
    end

    # Filter bits
    def fb22 : Bool
      @value.bits_set?(0x400000_u32)
    end

    # Filter bits
    def self.fb22 : Bool
      value.fb22
    end

    # Filter bits
    def self.fb22=(value : Bool) : Bool
      self.set(fb22: value)
      value
    end

    # Filter bits
    def fb23 : Bool
      @value.bits_set?(0x800000_u32)
    end

    # Filter bits
    def self.fb23 : Bool
      value.fb23
    end

    # Filter bits
    def self.fb23=(value : Bool) : Bool
      self.set(fb23: value)
      value
    end

    # Filter bits
    def fb24 : Bool
      @value.bits_set?(0x1000000_u32)
    end

    # Filter bits
    def self.fb24 : Bool
      value.fb24
    end

    # Filter bits
    def self.fb24=(value : Bool) : Bool
      self.set(fb24: value)
      value
    end

    # Filter bits
    def fb25 : Bool
      @value.bits_set?(0x2000000_u32)
    end

    # Filter bits
    def self.fb25 : Bool
      value.fb25
    end

    # Filter bits
    def self.fb25=(value : Bool) : Bool
      self.set(fb25: value)
      value
    end

    # Filter bits
    def fb26 : Bool
      @value.bits_set?(0x4000000_u32)
    end

    # Filter bits
    def self.fb26 : Bool
      value.fb26
    end

    # Filter bits
    def self.fb26=(value : Bool) : Bool
      self.set(fb26: value)
      value
    end

    # Filter bits
    def fb27 : Bool
      @value.bits_set?(0x8000000_u32)
    end

    # Filter bits
    def self.fb27 : Bool
      value.fb27
    end

    # Filter bits
    def self.fb27=(value : Bool) : Bool
      self.set(fb27: value)
      value
    end

    # Filter bits
    def fb28 : Bool
      @value.bits_set?(0x10000000_u32)
    end

    # Filter bits
    def self.fb28 : Bool
      value.fb28
    end

    # Filter bits
    def self.fb28=(value : Bool) : Bool
      self.set(fb28: value)
      value
    end

    # Filter bits
    def fb29 : Bool
      @value.bits_set?(0x20000000_u32)
    end

    # Filter bits
    def self.fb29 : Bool
      value.fb29
    end

    # Filter bits
    def self.fb29=(value : Bool) : Bool
      self.set(fb29: value)
      value
    end

    # Filter bits
    def fb30 : Bool
      @value.bits_set?(0x40000000_u32)
    end

    # Filter bits
    def self.fb30 : Bool
      value.fb30
    end

    # Filter bits
    def self.fb30=(value : Bool) : Bool
      self.set(fb30: value)
      value
    end

    # Filter bits
    def fb31 : Bool
      @value.bits_set?(0x80000000_u32)
    end

    # Filter bits
    def self.fb31 : Bool
      value.fb31
    end

    # Filter bits
    def self.fb31=(value : Bool) : Bool
      self.set(fb31: value)
      value
    end

    def copy_with(
      *,

      fb0 : Bool? = nil,

      fb1 : Bool? = nil,

      fb2 : Bool? = nil,

      fb3 : Bool? = nil,

      fb4 : Bool? = nil,

      fb5 : Bool? = nil,

      fb6 : Bool? = nil,

      fb7 : Bool? = nil,

      fb8 : Bool? = nil,

      fb9 : Bool? = nil,

      fb10 : Bool? = nil,

      fb11 : Bool? = nil,

      fb12 : Bool? = nil,

      fb13 : Bool? = nil,

      fb14 : Bool? = nil,

      fb15 : Bool? = nil,

      fb16 : Bool? = nil,

      fb17 : Bool? = nil,

      fb18 : Bool? = nil,

      fb19 : Bool? = nil,

      fb20 : Bool? = nil,

      fb21 : Bool? = nil,

      fb22 : Bool? = nil,

      fb23 : Bool? = nil,

      fb24 : Bool? = nil,

      fb25 : Bool? = nil,

      fb26 : Bool? = nil,

      fb27 : Bool? = nil,

      fb28 : Bool? = nil,

      fb29 : Bool? = nil,

      fb30 : Bool? = nil,

      fb31 : Bool? = nil
    ) : self
      value = @value

      unless fb0.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(fb0.to_int).&(0x1_u32) << 0
      end

      unless fb1.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(fb1.to_int).&(0x1_u32) << 1
      end

      unless fb2.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(fb2.to_int).&(0x1_u32) << 2
      end

      unless fb3.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(fb3.to_int).&(0x1_u32) << 3
      end

      unless fb4.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(fb4.to_int).&(0x1_u32) << 4
      end

      unless fb5.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(fb5.to_int).&(0x1_u32) << 5
      end

      unless fb6.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(fb6.to_int).&(0x1_u32) << 6
      end

      unless fb7.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(fb7.to_int).&(0x1_u32) << 7
      end

      unless fb8.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(fb8.to_int).&(0x1_u32) << 8
      end

      unless fb9.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(fb9.to_int).&(0x1_u32) << 9
      end

      unless fb10.nil?
        value = (value & 0xfffffbff_u32) |
                UInt32.new!(fb10.to_int).&(0x1_u32) << 10
      end

      unless fb11.nil?
        value = (value & 0xfffff7ff_u32) |
                UInt32.new!(fb11.to_int).&(0x1_u32) << 11
      end

      unless fb12.nil?
        value = (value & 0xffffefff_u32) |
                UInt32.new!(fb12.to_int).&(0x1_u32) << 12
      end

      unless fb13.nil?
        value = (value & 0xffffdfff_u32) |
                UInt32.new!(fb13.to_int).&(0x1_u32) << 13
      end

      unless fb14.nil?
        value = (value & 0xffffbfff_u32) |
                UInt32.new!(fb14.to_int).&(0x1_u32) << 14
      end

      unless fb15.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(fb15.to_int).&(0x1_u32) << 15
      end

      unless fb16.nil?
        value = (value & 0xfffeffff_u32) |
                UInt32.new!(fb16.to_int).&(0x1_u32) << 16
      end

      unless fb17.nil?
        value = (value & 0xfffdffff_u32) |
                UInt32.new!(fb17.to_int).&(0x1_u32) << 17
      end

      unless fb18.nil?
        value = (value & 0xfffbffff_u32) |
                UInt32.new!(fb18.to_int).&(0x1_u32) << 18
      end

      unless fb19.nil?
        value = (value & 0xfff7ffff_u32) |
                UInt32.new!(fb19.to_int).&(0x1_u32) << 19
      end

      unless fb20.nil?
        value = (value & 0xffefffff_u32) |
                UInt32.new!(fb20.to_int).&(0x1_u32) << 20
      end

      unless fb21.nil?
        value = (value & 0xffdfffff_u32) |
                UInt32.new!(fb21.to_int).&(0x1_u32) << 21
      end

      unless fb22.nil?
        value = (value & 0xffbfffff_u32) |
                UInt32.new!(fb22.to_int).&(0x1_u32) << 22
      end

      unless fb23.nil?
        value = (value & 0xff7fffff_u32) |
                UInt32.new!(fb23.to_int).&(0x1_u32) << 23
      end

      unless fb24.nil?
        value = (value & 0xfeffffff_u32) |
                UInt32.new!(fb24.to_int).&(0x1_u32) << 24
      end

      unless fb25.nil?
        value = (value & 0xfdffffff_u32) |
                UInt32.new!(fb25.to_int).&(0x1_u32) << 25
      end

      unless fb26.nil?
        value = (value & 0xfbffffff_u32) |
                UInt32.new!(fb26.to_int).&(0x1_u32) << 26
      end

      unless fb27.nil?
        value = (value & 0xf7ffffff_u32) |
                UInt32.new!(fb27.to_int).&(0x1_u32) << 27
      end

      unless fb28.nil?
        value = (value & 0xefffffff_u32) |
                UInt32.new!(fb28.to_int).&(0x1_u32) << 28
      end

      unless fb29.nil?
        value = (value & 0xdfffffff_u32) |
                UInt32.new!(fb29.to_int).&(0x1_u32) << 29
      end

      unless fb30.nil?
        value = (value & 0xbfffffff_u32) |
                UInt32.new!(fb30.to_int).&(0x1_u32) << 30
      end

      unless fb31.nil?
        value = (value & 0x7fffffff_u32) |
                UInt32.new!(fb31.to_int).&(0x1_u32) << 31
      end

      self.class.new(value)
    end

    def self.set(
      *,
      fb0 : Bool? = nil,
      fb1 : Bool? = nil,
      fb2 : Bool? = nil,
      fb3 : Bool? = nil,
      fb4 : Bool? = nil,
      fb5 : Bool? = nil,
      fb6 : Bool? = nil,
      fb7 : Bool? = nil,
      fb8 : Bool? = nil,
      fb9 : Bool? = nil,
      fb10 : Bool? = nil,
      fb11 : Bool? = nil,
      fb12 : Bool? = nil,
      fb13 : Bool? = nil,
      fb14 : Bool? = nil,
      fb15 : Bool? = nil,
      fb16 : Bool? = nil,
      fb17 : Bool? = nil,
      fb18 : Bool? = nil,
      fb19 : Bool? = nil,
      fb20 : Bool? = nil,
      fb21 : Bool? = nil,
      fb22 : Bool? = nil,
      fb23 : Bool? = nil,
      fb24 : Bool? = nil,
      fb25 : Bool? = nil,
      fb26 : Bool? = nil,
      fb27 : Bool? = nil,
      fb28 : Bool? = nil,
      fb29 : Bool? = nil,
      fb30 : Bool? = nil,
      fb31 : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        fb0: fb0,
        fb1: fb1,
        fb2: fb2,
        fb3: fb3,
        fb4: fb4,
        fb5: fb5,
        fb6: fb6,
        fb7: fb7,
        fb8: fb8,
        fb9: fb9,
        fb10: fb10,
        fb11: fb11,
        fb12: fb12,
        fb13: fb13,
        fb14: fb14,
        fb15: fb15,
        fb16: fb16,
        fb17: fb17,
        fb18: fb18,
        fb19: fb19,
        fb20: fb20,
        fb21: fb21,
        fb22: fb22,
        fb23: fb23,
        fb24: fb24,
        fb25: fb25,
        fb26: fb26,
        fb27: fb27,
        fb28: fb28,
        fb29: fb29,
        fb30: fb30,
        fb31: fb31,
      )
    end
  end # struct

  # Filter bank 24 register 2
  struct F24R2
    ADDRESS = BASE_ADDRESS + 0x304_u64

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

    # Filter bits
    def fb0 : Bool
      @value.bits_set?(0x1_u32)
    end

    # Filter bits
    def self.fb0 : Bool
      value.fb0
    end

    # Filter bits
    def self.fb0=(value : Bool) : Bool
      self.set(fb0: value)
      value
    end

    # Filter bits
    def fb1 : Bool
      @value.bits_set?(0x2_u32)
    end

    # Filter bits
    def self.fb1 : Bool
      value.fb1
    end

    # Filter bits
    def self.fb1=(value : Bool) : Bool
      self.set(fb1: value)
      value
    end

    # Filter bits
    def fb2 : Bool
      @value.bits_set?(0x4_u32)
    end

    # Filter bits
    def self.fb2 : Bool
      value.fb2
    end

    # Filter bits
    def self.fb2=(value : Bool) : Bool
      self.set(fb2: value)
      value
    end

    # Filter bits
    def fb3 : Bool
      @value.bits_set?(0x8_u32)
    end

    # Filter bits
    def self.fb3 : Bool
      value.fb3
    end

    # Filter bits
    def self.fb3=(value : Bool) : Bool
      self.set(fb3: value)
      value
    end

    # Filter bits
    def fb4 : Bool
      @value.bits_set?(0x10_u32)
    end

    # Filter bits
    def self.fb4 : Bool
      value.fb4
    end

    # Filter bits
    def self.fb4=(value : Bool) : Bool
      self.set(fb4: value)
      value
    end

    # Filter bits
    def fb5 : Bool
      @value.bits_set?(0x20_u32)
    end

    # Filter bits
    def self.fb5 : Bool
      value.fb5
    end

    # Filter bits
    def self.fb5=(value : Bool) : Bool
      self.set(fb5: value)
      value
    end

    # Filter bits
    def fb6 : Bool
      @value.bits_set?(0x40_u32)
    end

    # Filter bits
    def self.fb6 : Bool
      value.fb6
    end

    # Filter bits
    def self.fb6=(value : Bool) : Bool
      self.set(fb6: value)
      value
    end

    # Filter bits
    def fb7 : Bool
      @value.bits_set?(0x80_u32)
    end

    # Filter bits
    def self.fb7 : Bool
      value.fb7
    end

    # Filter bits
    def self.fb7=(value : Bool) : Bool
      self.set(fb7: value)
      value
    end

    # Filter bits
    def fb8 : Bool
      @value.bits_set?(0x100_u32)
    end

    # Filter bits
    def self.fb8 : Bool
      value.fb8
    end

    # Filter bits
    def self.fb8=(value : Bool) : Bool
      self.set(fb8: value)
      value
    end

    # Filter bits
    def fb9 : Bool
      @value.bits_set?(0x200_u32)
    end

    # Filter bits
    def self.fb9 : Bool
      value.fb9
    end

    # Filter bits
    def self.fb9=(value : Bool) : Bool
      self.set(fb9: value)
      value
    end

    # Filter bits
    def fb10 : Bool
      @value.bits_set?(0x400_u32)
    end

    # Filter bits
    def self.fb10 : Bool
      value.fb10
    end

    # Filter bits
    def self.fb10=(value : Bool) : Bool
      self.set(fb10: value)
      value
    end

    # Filter bits
    def fb11 : Bool
      @value.bits_set?(0x800_u32)
    end

    # Filter bits
    def self.fb11 : Bool
      value.fb11
    end

    # Filter bits
    def self.fb11=(value : Bool) : Bool
      self.set(fb11: value)
      value
    end

    # Filter bits
    def fb12 : Bool
      @value.bits_set?(0x1000_u32)
    end

    # Filter bits
    def self.fb12 : Bool
      value.fb12
    end

    # Filter bits
    def self.fb12=(value : Bool) : Bool
      self.set(fb12: value)
      value
    end

    # Filter bits
    def fb13 : Bool
      @value.bits_set?(0x2000_u32)
    end

    # Filter bits
    def self.fb13 : Bool
      value.fb13
    end

    # Filter bits
    def self.fb13=(value : Bool) : Bool
      self.set(fb13: value)
      value
    end

    # Filter bits
    def fb14 : Bool
      @value.bits_set?(0x4000_u32)
    end

    # Filter bits
    def self.fb14 : Bool
      value.fb14
    end

    # Filter bits
    def self.fb14=(value : Bool) : Bool
      self.set(fb14: value)
      value
    end

    # Filter bits
    def fb15 : Bool
      @value.bits_set?(0x8000_u32)
    end

    # Filter bits
    def self.fb15 : Bool
      value.fb15
    end

    # Filter bits
    def self.fb15=(value : Bool) : Bool
      self.set(fb15: value)
      value
    end

    # Filter bits
    def fb16 : Bool
      @value.bits_set?(0x10000_u32)
    end

    # Filter bits
    def self.fb16 : Bool
      value.fb16
    end

    # Filter bits
    def self.fb16=(value : Bool) : Bool
      self.set(fb16: value)
      value
    end

    # Filter bits
    def fb17 : Bool
      @value.bits_set?(0x20000_u32)
    end

    # Filter bits
    def self.fb17 : Bool
      value.fb17
    end

    # Filter bits
    def self.fb17=(value : Bool) : Bool
      self.set(fb17: value)
      value
    end

    # Filter bits
    def fb18 : Bool
      @value.bits_set?(0x40000_u32)
    end

    # Filter bits
    def self.fb18 : Bool
      value.fb18
    end

    # Filter bits
    def self.fb18=(value : Bool) : Bool
      self.set(fb18: value)
      value
    end

    # Filter bits
    def fb19 : Bool
      @value.bits_set?(0x80000_u32)
    end

    # Filter bits
    def self.fb19 : Bool
      value.fb19
    end

    # Filter bits
    def self.fb19=(value : Bool) : Bool
      self.set(fb19: value)
      value
    end

    # Filter bits
    def fb20 : Bool
      @value.bits_set?(0x100000_u32)
    end

    # Filter bits
    def self.fb20 : Bool
      value.fb20
    end

    # Filter bits
    def self.fb20=(value : Bool) : Bool
      self.set(fb20: value)
      value
    end

    # Filter bits
    def fb21 : Bool
      @value.bits_set?(0x200000_u32)
    end

    # Filter bits
    def self.fb21 : Bool
      value.fb21
    end

    # Filter bits
    def self.fb21=(value : Bool) : Bool
      self.set(fb21: value)
      value
    end

    # Filter bits
    def fb22 : Bool
      @value.bits_set?(0x400000_u32)
    end

    # Filter bits
    def self.fb22 : Bool
      value.fb22
    end

    # Filter bits
    def self.fb22=(value : Bool) : Bool
      self.set(fb22: value)
      value
    end

    # Filter bits
    def fb23 : Bool
      @value.bits_set?(0x800000_u32)
    end

    # Filter bits
    def self.fb23 : Bool
      value.fb23
    end

    # Filter bits
    def self.fb23=(value : Bool) : Bool
      self.set(fb23: value)
      value
    end

    # Filter bits
    def fb24 : Bool
      @value.bits_set?(0x1000000_u32)
    end

    # Filter bits
    def self.fb24 : Bool
      value.fb24
    end

    # Filter bits
    def self.fb24=(value : Bool) : Bool
      self.set(fb24: value)
      value
    end

    # Filter bits
    def fb25 : Bool
      @value.bits_set?(0x2000000_u32)
    end

    # Filter bits
    def self.fb25 : Bool
      value.fb25
    end

    # Filter bits
    def self.fb25=(value : Bool) : Bool
      self.set(fb25: value)
      value
    end

    # Filter bits
    def fb26 : Bool
      @value.bits_set?(0x4000000_u32)
    end

    # Filter bits
    def self.fb26 : Bool
      value.fb26
    end

    # Filter bits
    def self.fb26=(value : Bool) : Bool
      self.set(fb26: value)
      value
    end

    # Filter bits
    def fb27 : Bool
      @value.bits_set?(0x8000000_u32)
    end

    # Filter bits
    def self.fb27 : Bool
      value.fb27
    end

    # Filter bits
    def self.fb27=(value : Bool) : Bool
      self.set(fb27: value)
      value
    end

    # Filter bits
    def fb28 : Bool
      @value.bits_set?(0x10000000_u32)
    end

    # Filter bits
    def self.fb28 : Bool
      value.fb28
    end

    # Filter bits
    def self.fb28=(value : Bool) : Bool
      self.set(fb28: value)
      value
    end

    # Filter bits
    def fb29 : Bool
      @value.bits_set?(0x20000000_u32)
    end

    # Filter bits
    def self.fb29 : Bool
      value.fb29
    end

    # Filter bits
    def self.fb29=(value : Bool) : Bool
      self.set(fb29: value)
      value
    end

    # Filter bits
    def fb30 : Bool
      @value.bits_set?(0x40000000_u32)
    end

    # Filter bits
    def self.fb30 : Bool
      value.fb30
    end

    # Filter bits
    def self.fb30=(value : Bool) : Bool
      self.set(fb30: value)
      value
    end

    # Filter bits
    def fb31 : Bool
      @value.bits_set?(0x80000000_u32)
    end

    # Filter bits
    def self.fb31 : Bool
      value.fb31
    end

    # Filter bits
    def self.fb31=(value : Bool) : Bool
      self.set(fb31: value)
      value
    end

    def copy_with(
      *,

      fb0 : Bool? = nil,

      fb1 : Bool? = nil,

      fb2 : Bool? = nil,

      fb3 : Bool? = nil,

      fb4 : Bool? = nil,

      fb5 : Bool? = nil,

      fb6 : Bool? = nil,

      fb7 : Bool? = nil,

      fb8 : Bool? = nil,

      fb9 : Bool? = nil,

      fb10 : Bool? = nil,

      fb11 : Bool? = nil,

      fb12 : Bool? = nil,

      fb13 : Bool? = nil,

      fb14 : Bool? = nil,

      fb15 : Bool? = nil,

      fb16 : Bool? = nil,

      fb17 : Bool? = nil,

      fb18 : Bool? = nil,

      fb19 : Bool? = nil,

      fb20 : Bool? = nil,

      fb21 : Bool? = nil,

      fb22 : Bool? = nil,

      fb23 : Bool? = nil,

      fb24 : Bool? = nil,

      fb25 : Bool? = nil,

      fb26 : Bool? = nil,

      fb27 : Bool? = nil,

      fb28 : Bool? = nil,

      fb29 : Bool? = nil,

      fb30 : Bool? = nil,

      fb31 : Bool? = nil
    ) : self
      value = @value

      unless fb0.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(fb0.to_int).&(0x1_u32) << 0
      end

      unless fb1.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(fb1.to_int).&(0x1_u32) << 1
      end

      unless fb2.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(fb2.to_int).&(0x1_u32) << 2
      end

      unless fb3.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(fb3.to_int).&(0x1_u32) << 3
      end

      unless fb4.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(fb4.to_int).&(0x1_u32) << 4
      end

      unless fb5.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(fb5.to_int).&(0x1_u32) << 5
      end

      unless fb6.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(fb6.to_int).&(0x1_u32) << 6
      end

      unless fb7.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(fb7.to_int).&(0x1_u32) << 7
      end

      unless fb8.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(fb8.to_int).&(0x1_u32) << 8
      end

      unless fb9.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(fb9.to_int).&(0x1_u32) << 9
      end

      unless fb10.nil?
        value = (value & 0xfffffbff_u32) |
                UInt32.new!(fb10.to_int).&(0x1_u32) << 10
      end

      unless fb11.nil?
        value = (value & 0xfffff7ff_u32) |
                UInt32.new!(fb11.to_int).&(0x1_u32) << 11
      end

      unless fb12.nil?
        value = (value & 0xffffefff_u32) |
                UInt32.new!(fb12.to_int).&(0x1_u32) << 12
      end

      unless fb13.nil?
        value = (value & 0xffffdfff_u32) |
                UInt32.new!(fb13.to_int).&(0x1_u32) << 13
      end

      unless fb14.nil?
        value = (value & 0xffffbfff_u32) |
                UInt32.new!(fb14.to_int).&(0x1_u32) << 14
      end

      unless fb15.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(fb15.to_int).&(0x1_u32) << 15
      end

      unless fb16.nil?
        value = (value & 0xfffeffff_u32) |
                UInt32.new!(fb16.to_int).&(0x1_u32) << 16
      end

      unless fb17.nil?
        value = (value & 0xfffdffff_u32) |
                UInt32.new!(fb17.to_int).&(0x1_u32) << 17
      end

      unless fb18.nil?
        value = (value & 0xfffbffff_u32) |
                UInt32.new!(fb18.to_int).&(0x1_u32) << 18
      end

      unless fb19.nil?
        value = (value & 0xfff7ffff_u32) |
                UInt32.new!(fb19.to_int).&(0x1_u32) << 19
      end

      unless fb20.nil?
        value = (value & 0xffefffff_u32) |
                UInt32.new!(fb20.to_int).&(0x1_u32) << 20
      end

      unless fb21.nil?
        value = (value & 0xffdfffff_u32) |
                UInt32.new!(fb21.to_int).&(0x1_u32) << 21
      end

      unless fb22.nil?
        value = (value & 0xffbfffff_u32) |
                UInt32.new!(fb22.to_int).&(0x1_u32) << 22
      end

      unless fb23.nil?
        value = (value & 0xff7fffff_u32) |
                UInt32.new!(fb23.to_int).&(0x1_u32) << 23
      end

      unless fb24.nil?
        value = (value & 0xfeffffff_u32) |
                UInt32.new!(fb24.to_int).&(0x1_u32) << 24
      end

      unless fb25.nil?
        value = (value & 0xfdffffff_u32) |
                UInt32.new!(fb25.to_int).&(0x1_u32) << 25
      end

      unless fb26.nil?
        value = (value & 0xfbffffff_u32) |
                UInt32.new!(fb26.to_int).&(0x1_u32) << 26
      end

      unless fb27.nil?
        value = (value & 0xf7ffffff_u32) |
                UInt32.new!(fb27.to_int).&(0x1_u32) << 27
      end

      unless fb28.nil?
        value = (value & 0xefffffff_u32) |
                UInt32.new!(fb28.to_int).&(0x1_u32) << 28
      end

      unless fb29.nil?
        value = (value & 0xdfffffff_u32) |
                UInt32.new!(fb29.to_int).&(0x1_u32) << 29
      end

      unless fb30.nil?
        value = (value & 0xbfffffff_u32) |
                UInt32.new!(fb30.to_int).&(0x1_u32) << 30
      end

      unless fb31.nil?
        value = (value & 0x7fffffff_u32) |
                UInt32.new!(fb31.to_int).&(0x1_u32) << 31
      end

      self.class.new(value)
    end

    def self.set(
      *,
      fb0 : Bool? = nil,
      fb1 : Bool? = nil,
      fb2 : Bool? = nil,
      fb3 : Bool? = nil,
      fb4 : Bool? = nil,
      fb5 : Bool? = nil,
      fb6 : Bool? = nil,
      fb7 : Bool? = nil,
      fb8 : Bool? = nil,
      fb9 : Bool? = nil,
      fb10 : Bool? = nil,
      fb11 : Bool? = nil,
      fb12 : Bool? = nil,
      fb13 : Bool? = nil,
      fb14 : Bool? = nil,
      fb15 : Bool? = nil,
      fb16 : Bool? = nil,
      fb17 : Bool? = nil,
      fb18 : Bool? = nil,
      fb19 : Bool? = nil,
      fb20 : Bool? = nil,
      fb21 : Bool? = nil,
      fb22 : Bool? = nil,
      fb23 : Bool? = nil,
      fb24 : Bool? = nil,
      fb25 : Bool? = nil,
      fb26 : Bool? = nil,
      fb27 : Bool? = nil,
      fb28 : Bool? = nil,
      fb29 : Bool? = nil,
      fb30 : Bool? = nil,
      fb31 : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        fb0: fb0,
        fb1: fb1,
        fb2: fb2,
        fb3: fb3,
        fb4: fb4,
        fb5: fb5,
        fb6: fb6,
        fb7: fb7,
        fb8: fb8,
        fb9: fb9,
        fb10: fb10,
        fb11: fb11,
        fb12: fb12,
        fb13: fb13,
        fb14: fb14,
        fb15: fb15,
        fb16: fb16,
        fb17: fb17,
        fb18: fb18,
        fb19: fb19,
        fb20: fb20,
        fb21: fb21,
        fb22: fb22,
        fb23: fb23,
        fb24: fb24,
        fb25: fb25,
        fb26: fb26,
        fb27: fb27,
        fb28: fb28,
        fb29: fb29,
        fb30: fb30,
        fb31: fb31,
      )
    end
  end # struct

  # Filter bank 25 register 1
  struct F25R1
    ADDRESS = BASE_ADDRESS + 0x308_u64

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

    # Filter bits
    def fb0 : Bool
      @value.bits_set?(0x1_u32)
    end

    # Filter bits
    def self.fb0 : Bool
      value.fb0
    end

    # Filter bits
    def self.fb0=(value : Bool) : Bool
      self.set(fb0: value)
      value
    end

    # Filter bits
    def fb1 : Bool
      @value.bits_set?(0x2_u32)
    end

    # Filter bits
    def self.fb1 : Bool
      value.fb1
    end

    # Filter bits
    def self.fb1=(value : Bool) : Bool
      self.set(fb1: value)
      value
    end

    # Filter bits
    def fb2 : Bool
      @value.bits_set?(0x4_u32)
    end

    # Filter bits
    def self.fb2 : Bool
      value.fb2
    end

    # Filter bits
    def self.fb2=(value : Bool) : Bool
      self.set(fb2: value)
      value
    end

    # Filter bits
    def fb3 : Bool
      @value.bits_set?(0x8_u32)
    end

    # Filter bits
    def self.fb3 : Bool
      value.fb3
    end

    # Filter bits
    def self.fb3=(value : Bool) : Bool
      self.set(fb3: value)
      value
    end

    # Filter bits
    def fb4 : Bool
      @value.bits_set?(0x10_u32)
    end

    # Filter bits
    def self.fb4 : Bool
      value.fb4
    end

    # Filter bits
    def self.fb4=(value : Bool) : Bool
      self.set(fb4: value)
      value
    end

    # Filter bits
    def fb5 : Bool
      @value.bits_set?(0x20_u32)
    end

    # Filter bits
    def self.fb5 : Bool
      value.fb5
    end

    # Filter bits
    def self.fb5=(value : Bool) : Bool
      self.set(fb5: value)
      value
    end

    # Filter bits
    def fb6 : Bool
      @value.bits_set?(0x40_u32)
    end

    # Filter bits
    def self.fb6 : Bool
      value.fb6
    end

    # Filter bits
    def self.fb6=(value : Bool) : Bool
      self.set(fb6: value)
      value
    end

    # Filter bits
    def fb7 : Bool
      @value.bits_set?(0x80_u32)
    end

    # Filter bits
    def self.fb7 : Bool
      value.fb7
    end

    # Filter bits
    def self.fb7=(value : Bool) : Bool
      self.set(fb7: value)
      value
    end

    # Filter bits
    def fb8 : Bool
      @value.bits_set?(0x100_u32)
    end

    # Filter bits
    def self.fb8 : Bool
      value.fb8
    end

    # Filter bits
    def self.fb8=(value : Bool) : Bool
      self.set(fb8: value)
      value
    end

    # Filter bits
    def fb9 : Bool
      @value.bits_set?(0x200_u32)
    end

    # Filter bits
    def self.fb9 : Bool
      value.fb9
    end

    # Filter bits
    def self.fb9=(value : Bool) : Bool
      self.set(fb9: value)
      value
    end

    # Filter bits
    def fb10 : Bool
      @value.bits_set?(0x400_u32)
    end

    # Filter bits
    def self.fb10 : Bool
      value.fb10
    end

    # Filter bits
    def self.fb10=(value : Bool) : Bool
      self.set(fb10: value)
      value
    end

    # Filter bits
    def fb11 : Bool
      @value.bits_set?(0x800_u32)
    end

    # Filter bits
    def self.fb11 : Bool
      value.fb11
    end

    # Filter bits
    def self.fb11=(value : Bool) : Bool
      self.set(fb11: value)
      value
    end

    # Filter bits
    def fb12 : Bool
      @value.bits_set?(0x1000_u32)
    end

    # Filter bits
    def self.fb12 : Bool
      value.fb12
    end

    # Filter bits
    def self.fb12=(value : Bool) : Bool
      self.set(fb12: value)
      value
    end

    # Filter bits
    def fb13 : Bool
      @value.bits_set?(0x2000_u32)
    end

    # Filter bits
    def self.fb13 : Bool
      value.fb13
    end

    # Filter bits
    def self.fb13=(value : Bool) : Bool
      self.set(fb13: value)
      value
    end

    # Filter bits
    def fb14 : Bool
      @value.bits_set?(0x4000_u32)
    end

    # Filter bits
    def self.fb14 : Bool
      value.fb14
    end

    # Filter bits
    def self.fb14=(value : Bool) : Bool
      self.set(fb14: value)
      value
    end

    # Filter bits
    def fb15 : Bool
      @value.bits_set?(0x8000_u32)
    end

    # Filter bits
    def self.fb15 : Bool
      value.fb15
    end

    # Filter bits
    def self.fb15=(value : Bool) : Bool
      self.set(fb15: value)
      value
    end

    # Filter bits
    def fb16 : Bool
      @value.bits_set?(0x10000_u32)
    end

    # Filter bits
    def self.fb16 : Bool
      value.fb16
    end

    # Filter bits
    def self.fb16=(value : Bool) : Bool
      self.set(fb16: value)
      value
    end

    # Filter bits
    def fb17 : Bool
      @value.bits_set?(0x20000_u32)
    end

    # Filter bits
    def self.fb17 : Bool
      value.fb17
    end

    # Filter bits
    def self.fb17=(value : Bool) : Bool
      self.set(fb17: value)
      value
    end

    # Filter bits
    def fb18 : Bool
      @value.bits_set?(0x40000_u32)
    end

    # Filter bits
    def self.fb18 : Bool
      value.fb18
    end

    # Filter bits
    def self.fb18=(value : Bool) : Bool
      self.set(fb18: value)
      value
    end

    # Filter bits
    def fb19 : Bool
      @value.bits_set?(0x80000_u32)
    end

    # Filter bits
    def self.fb19 : Bool
      value.fb19
    end

    # Filter bits
    def self.fb19=(value : Bool) : Bool
      self.set(fb19: value)
      value
    end

    # Filter bits
    def fb20 : Bool
      @value.bits_set?(0x100000_u32)
    end

    # Filter bits
    def self.fb20 : Bool
      value.fb20
    end

    # Filter bits
    def self.fb20=(value : Bool) : Bool
      self.set(fb20: value)
      value
    end

    # Filter bits
    def fb21 : Bool
      @value.bits_set?(0x200000_u32)
    end

    # Filter bits
    def self.fb21 : Bool
      value.fb21
    end

    # Filter bits
    def self.fb21=(value : Bool) : Bool
      self.set(fb21: value)
      value
    end

    # Filter bits
    def fb22 : Bool
      @value.bits_set?(0x400000_u32)
    end

    # Filter bits
    def self.fb22 : Bool
      value.fb22
    end

    # Filter bits
    def self.fb22=(value : Bool) : Bool
      self.set(fb22: value)
      value
    end

    # Filter bits
    def fb23 : Bool
      @value.bits_set?(0x800000_u32)
    end

    # Filter bits
    def self.fb23 : Bool
      value.fb23
    end

    # Filter bits
    def self.fb23=(value : Bool) : Bool
      self.set(fb23: value)
      value
    end

    # Filter bits
    def fb24 : Bool
      @value.bits_set?(0x1000000_u32)
    end

    # Filter bits
    def self.fb24 : Bool
      value.fb24
    end

    # Filter bits
    def self.fb24=(value : Bool) : Bool
      self.set(fb24: value)
      value
    end

    # Filter bits
    def fb25 : Bool
      @value.bits_set?(0x2000000_u32)
    end

    # Filter bits
    def self.fb25 : Bool
      value.fb25
    end

    # Filter bits
    def self.fb25=(value : Bool) : Bool
      self.set(fb25: value)
      value
    end

    # Filter bits
    def fb26 : Bool
      @value.bits_set?(0x4000000_u32)
    end

    # Filter bits
    def self.fb26 : Bool
      value.fb26
    end

    # Filter bits
    def self.fb26=(value : Bool) : Bool
      self.set(fb26: value)
      value
    end

    # Filter bits
    def fb27 : Bool
      @value.bits_set?(0x8000000_u32)
    end

    # Filter bits
    def self.fb27 : Bool
      value.fb27
    end

    # Filter bits
    def self.fb27=(value : Bool) : Bool
      self.set(fb27: value)
      value
    end

    # Filter bits
    def fb28 : Bool
      @value.bits_set?(0x10000000_u32)
    end

    # Filter bits
    def self.fb28 : Bool
      value.fb28
    end

    # Filter bits
    def self.fb28=(value : Bool) : Bool
      self.set(fb28: value)
      value
    end

    # Filter bits
    def fb29 : Bool
      @value.bits_set?(0x20000000_u32)
    end

    # Filter bits
    def self.fb29 : Bool
      value.fb29
    end

    # Filter bits
    def self.fb29=(value : Bool) : Bool
      self.set(fb29: value)
      value
    end

    # Filter bits
    def fb30 : Bool
      @value.bits_set?(0x40000000_u32)
    end

    # Filter bits
    def self.fb30 : Bool
      value.fb30
    end

    # Filter bits
    def self.fb30=(value : Bool) : Bool
      self.set(fb30: value)
      value
    end

    # Filter bits
    def fb31 : Bool
      @value.bits_set?(0x80000000_u32)
    end

    # Filter bits
    def self.fb31 : Bool
      value.fb31
    end

    # Filter bits
    def self.fb31=(value : Bool) : Bool
      self.set(fb31: value)
      value
    end

    def copy_with(
      *,

      fb0 : Bool? = nil,

      fb1 : Bool? = nil,

      fb2 : Bool? = nil,

      fb3 : Bool? = nil,

      fb4 : Bool? = nil,

      fb5 : Bool? = nil,

      fb6 : Bool? = nil,

      fb7 : Bool? = nil,

      fb8 : Bool? = nil,

      fb9 : Bool? = nil,

      fb10 : Bool? = nil,

      fb11 : Bool? = nil,

      fb12 : Bool? = nil,

      fb13 : Bool? = nil,

      fb14 : Bool? = nil,

      fb15 : Bool? = nil,

      fb16 : Bool? = nil,

      fb17 : Bool? = nil,

      fb18 : Bool? = nil,

      fb19 : Bool? = nil,

      fb20 : Bool? = nil,

      fb21 : Bool? = nil,

      fb22 : Bool? = nil,

      fb23 : Bool? = nil,

      fb24 : Bool? = nil,

      fb25 : Bool? = nil,

      fb26 : Bool? = nil,

      fb27 : Bool? = nil,

      fb28 : Bool? = nil,

      fb29 : Bool? = nil,

      fb30 : Bool? = nil,

      fb31 : Bool? = nil
    ) : self
      value = @value

      unless fb0.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(fb0.to_int).&(0x1_u32) << 0
      end

      unless fb1.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(fb1.to_int).&(0x1_u32) << 1
      end

      unless fb2.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(fb2.to_int).&(0x1_u32) << 2
      end

      unless fb3.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(fb3.to_int).&(0x1_u32) << 3
      end

      unless fb4.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(fb4.to_int).&(0x1_u32) << 4
      end

      unless fb5.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(fb5.to_int).&(0x1_u32) << 5
      end

      unless fb6.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(fb6.to_int).&(0x1_u32) << 6
      end

      unless fb7.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(fb7.to_int).&(0x1_u32) << 7
      end

      unless fb8.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(fb8.to_int).&(0x1_u32) << 8
      end

      unless fb9.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(fb9.to_int).&(0x1_u32) << 9
      end

      unless fb10.nil?
        value = (value & 0xfffffbff_u32) |
                UInt32.new!(fb10.to_int).&(0x1_u32) << 10
      end

      unless fb11.nil?
        value = (value & 0xfffff7ff_u32) |
                UInt32.new!(fb11.to_int).&(0x1_u32) << 11
      end

      unless fb12.nil?
        value = (value & 0xffffefff_u32) |
                UInt32.new!(fb12.to_int).&(0x1_u32) << 12
      end

      unless fb13.nil?
        value = (value & 0xffffdfff_u32) |
                UInt32.new!(fb13.to_int).&(0x1_u32) << 13
      end

      unless fb14.nil?
        value = (value & 0xffffbfff_u32) |
                UInt32.new!(fb14.to_int).&(0x1_u32) << 14
      end

      unless fb15.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(fb15.to_int).&(0x1_u32) << 15
      end

      unless fb16.nil?
        value = (value & 0xfffeffff_u32) |
                UInt32.new!(fb16.to_int).&(0x1_u32) << 16
      end

      unless fb17.nil?
        value = (value & 0xfffdffff_u32) |
                UInt32.new!(fb17.to_int).&(0x1_u32) << 17
      end

      unless fb18.nil?
        value = (value & 0xfffbffff_u32) |
                UInt32.new!(fb18.to_int).&(0x1_u32) << 18
      end

      unless fb19.nil?
        value = (value & 0xfff7ffff_u32) |
                UInt32.new!(fb19.to_int).&(0x1_u32) << 19
      end

      unless fb20.nil?
        value = (value & 0xffefffff_u32) |
                UInt32.new!(fb20.to_int).&(0x1_u32) << 20
      end

      unless fb21.nil?
        value = (value & 0xffdfffff_u32) |
                UInt32.new!(fb21.to_int).&(0x1_u32) << 21
      end

      unless fb22.nil?
        value = (value & 0xffbfffff_u32) |
                UInt32.new!(fb22.to_int).&(0x1_u32) << 22
      end

      unless fb23.nil?
        value = (value & 0xff7fffff_u32) |
                UInt32.new!(fb23.to_int).&(0x1_u32) << 23
      end

      unless fb24.nil?
        value = (value & 0xfeffffff_u32) |
                UInt32.new!(fb24.to_int).&(0x1_u32) << 24
      end

      unless fb25.nil?
        value = (value & 0xfdffffff_u32) |
                UInt32.new!(fb25.to_int).&(0x1_u32) << 25
      end

      unless fb26.nil?
        value = (value & 0xfbffffff_u32) |
                UInt32.new!(fb26.to_int).&(0x1_u32) << 26
      end

      unless fb27.nil?
        value = (value & 0xf7ffffff_u32) |
                UInt32.new!(fb27.to_int).&(0x1_u32) << 27
      end

      unless fb28.nil?
        value = (value & 0xefffffff_u32) |
                UInt32.new!(fb28.to_int).&(0x1_u32) << 28
      end

      unless fb29.nil?
        value = (value & 0xdfffffff_u32) |
                UInt32.new!(fb29.to_int).&(0x1_u32) << 29
      end

      unless fb30.nil?
        value = (value & 0xbfffffff_u32) |
                UInt32.new!(fb30.to_int).&(0x1_u32) << 30
      end

      unless fb31.nil?
        value = (value & 0x7fffffff_u32) |
                UInt32.new!(fb31.to_int).&(0x1_u32) << 31
      end

      self.class.new(value)
    end

    def self.set(
      *,
      fb0 : Bool? = nil,
      fb1 : Bool? = nil,
      fb2 : Bool? = nil,
      fb3 : Bool? = nil,
      fb4 : Bool? = nil,
      fb5 : Bool? = nil,
      fb6 : Bool? = nil,
      fb7 : Bool? = nil,
      fb8 : Bool? = nil,
      fb9 : Bool? = nil,
      fb10 : Bool? = nil,
      fb11 : Bool? = nil,
      fb12 : Bool? = nil,
      fb13 : Bool? = nil,
      fb14 : Bool? = nil,
      fb15 : Bool? = nil,
      fb16 : Bool? = nil,
      fb17 : Bool? = nil,
      fb18 : Bool? = nil,
      fb19 : Bool? = nil,
      fb20 : Bool? = nil,
      fb21 : Bool? = nil,
      fb22 : Bool? = nil,
      fb23 : Bool? = nil,
      fb24 : Bool? = nil,
      fb25 : Bool? = nil,
      fb26 : Bool? = nil,
      fb27 : Bool? = nil,
      fb28 : Bool? = nil,
      fb29 : Bool? = nil,
      fb30 : Bool? = nil,
      fb31 : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        fb0: fb0,
        fb1: fb1,
        fb2: fb2,
        fb3: fb3,
        fb4: fb4,
        fb5: fb5,
        fb6: fb6,
        fb7: fb7,
        fb8: fb8,
        fb9: fb9,
        fb10: fb10,
        fb11: fb11,
        fb12: fb12,
        fb13: fb13,
        fb14: fb14,
        fb15: fb15,
        fb16: fb16,
        fb17: fb17,
        fb18: fb18,
        fb19: fb19,
        fb20: fb20,
        fb21: fb21,
        fb22: fb22,
        fb23: fb23,
        fb24: fb24,
        fb25: fb25,
        fb26: fb26,
        fb27: fb27,
        fb28: fb28,
        fb29: fb29,
        fb30: fb30,
        fb31: fb31,
      )
    end
  end # struct

  # Filter bank 25 register 2
  struct F25R2
    ADDRESS = BASE_ADDRESS + 0x30c_u64

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

    # Filter bits
    def fb0 : Bool
      @value.bits_set?(0x1_u32)
    end

    # Filter bits
    def self.fb0 : Bool
      value.fb0
    end

    # Filter bits
    def self.fb0=(value : Bool) : Bool
      self.set(fb0: value)
      value
    end

    # Filter bits
    def fb1 : Bool
      @value.bits_set?(0x2_u32)
    end

    # Filter bits
    def self.fb1 : Bool
      value.fb1
    end

    # Filter bits
    def self.fb1=(value : Bool) : Bool
      self.set(fb1: value)
      value
    end

    # Filter bits
    def fb2 : Bool
      @value.bits_set?(0x4_u32)
    end

    # Filter bits
    def self.fb2 : Bool
      value.fb2
    end

    # Filter bits
    def self.fb2=(value : Bool) : Bool
      self.set(fb2: value)
      value
    end

    # Filter bits
    def fb3 : Bool
      @value.bits_set?(0x8_u32)
    end

    # Filter bits
    def self.fb3 : Bool
      value.fb3
    end

    # Filter bits
    def self.fb3=(value : Bool) : Bool
      self.set(fb3: value)
      value
    end

    # Filter bits
    def fb4 : Bool
      @value.bits_set?(0x10_u32)
    end

    # Filter bits
    def self.fb4 : Bool
      value.fb4
    end

    # Filter bits
    def self.fb4=(value : Bool) : Bool
      self.set(fb4: value)
      value
    end

    # Filter bits
    def fb5 : Bool
      @value.bits_set?(0x20_u32)
    end

    # Filter bits
    def self.fb5 : Bool
      value.fb5
    end

    # Filter bits
    def self.fb5=(value : Bool) : Bool
      self.set(fb5: value)
      value
    end

    # Filter bits
    def fb6 : Bool
      @value.bits_set?(0x40_u32)
    end

    # Filter bits
    def self.fb6 : Bool
      value.fb6
    end

    # Filter bits
    def self.fb6=(value : Bool) : Bool
      self.set(fb6: value)
      value
    end

    # Filter bits
    def fb7 : Bool
      @value.bits_set?(0x80_u32)
    end

    # Filter bits
    def self.fb7 : Bool
      value.fb7
    end

    # Filter bits
    def self.fb7=(value : Bool) : Bool
      self.set(fb7: value)
      value
    end

    # Filter bits
    def fb8 : Bool
      @value.bits_set?(0x100_u32)
    end

    # Filter bits
    def self.fb8 : Bool
      value.fb8
    end

    # Filter bits
    def self.fb8=(value : Bool) : Bool
      self.set(fb8: value)
      value
    end

    # Filter bits
    def fb9 : Bool
      @value.bits_set?(0x200_u32)
    end

    # Filter bits
    def self.fb9 : Bool
      value.fb9
    end

    # Filter bits
    def self.fb9=(value : Bool) : Bool
      self.set(fb9: value)
      value
    end

    # Filter bits
    def fb10 : Bool
      @value.bits_set?(0x400_u32)
    end

    # Filter bits
    def self.fb10 : Bool
      value.fb10
    end

    # Filter bits
    def self.fb10=(value : Bool) : Bool
      self.set(fb10: value)
      value
    end

    # Filter bits
    def fb11 : Bool
      @value.bits_set?(0x800_u32)
    end

    # Filter bits
    def self.fb11 : Bool
      value.fb11
    end

    # Filter bits
    def self.fb11=(value : Bool) : Bool
      self.set(fb11: value)
      value
    end

    # Filter bits
    def fb12 : Bool
      @value.bits_set?(0x1000_u32)
    end

    # Filter bits
    def self.fb12 : Bool
      value.fb12
    end

    # Filter bits
    def self.fb12=(value : Bool) : Bool
      self.set(fb12: value)
      value
    end

    # Filter bits
    def fb13 : Bool
      @value.bits_set?(0x2000_u32)
    end

    # Filter bits
    def self.fb13 : Bool
      value.fb13
    end

    # Filter bits
    def self.fb13=(value : Bool) : Bool
      self.set(fb13: value)
      value
    end

    # Filter bits
    def fb14 : Bool
      @value.bits_set?(0x4000_u32)
    end

    # Filter bits
    def self.fb14 : Bool
      value.fb14
    end

    # Filter bits
    def self.fb14=(value : Bool) : Bool
      self.set(fb14: value)
      value
    end

    # Filter bits
    def fb15 : Bool
      @value.bits_set?(0x8000_u32)
    end

    # Filter bits
    def self.fb15 : Bool
      value.fb15
    end

    # Filter bits
    def self.fb15=(value : Bool) : Bool
      self.set(fb15: value)
      value
    end

    # Filter bits
    def fb16 : Bool
      @value.bits_set?(0x10000_u32)
    end

    # Filter bits
    def self.fb16 : Bool
      value.fb16
    end

    # Filter bits
    def self.fb16=(value : Bool) : Bool
      self.set(fb16: value)
      value
    end

    # Filter bits
    def fb17 : Bool
      @value.bits_set?(0x20000_u32)
    end

    # Filter bits
    def self.fb17 : Bool
      value.fb17
    end

    # Filter bits
    def self.fb17=(value : Bool) : Bool
      self.set(fb17: value)
      value
    end

    # Filter bits
    def fb18 : Bool
      @value.bits_set?(0x40000_u32)
    end

    # Filter bits
    def self.fb18 : Bool
      value.fb18
    end

    # Filter bits
    def self.fb18=(value : Bool) : Bool
      self.set(fb18: value)
      value
    end

    # Filter bits
    def fb19 : Bool
      @value.bits_set?(0x80000_u32)
    end

    # Filter bits
    def self.fb19 : Bool
      value.fb19
    end

    # Filter bits
    def self.fb19=(value : Bool) : Bool
      self.set(fb19: value)
      value
    end

    # Filter bits
    def fb20 : Bool
      @value.bits_set?(0x100000_u32)
    end

    # Filter bits
    def self.fb20 : Bool
      value.fb20
    end

    # Filter bits
    def self.fb20=(value : Bool) : Bool
      self.set(fb20: value)
      value
    end

    # Filter bits
    def fb21 : Bool
      @value.bits_set?(0x200000_u32)
    end

    # Filter bits
    def self.fb21 : Bool
      value.fb21
    end

    # Filter bits
    def self.fb21=(value : Bool) : Bool
      self.set(fb21: value)
      value
    end

    # Filter bits
    def fb22 : Bool
      @value.bits_set?(0x400000_u32)
    end

    # Filter bits
    def self.fb22 : Bool
      value.fb22
    end

    # Filter bits
    def self.fb22=(value : Bool) : Bool
      self.set(fb22: value)
      value
    end

    # Filter bits
    def fb23 : Bool
      @value.bits_set?(0x800000_u32)
    end

    # Filter bits
    def self.fb23 : Bool
      value.fb23
    end

    # Filter bits
    def self.fb23=(value : Bool) : Bool
      self.set(fb23: value)
      value
    end

    # Filter bits
    def fb24 : Bool
      @value.bits_set?(0x1000000_u32)
    end

    # Filter bits
    def self.fb24 : Bool
      value.fb24
    end

    # Filter bits
    def self.fb24=(value : Bool) : Bool
      self.set(fb24: value)
      value
    end

    # Filter bits
    def fb25 : Bool
      @value.bits_set?(0x2000000_u32)
    end

    # Filter bits
    def self.fb25 : Bool
      value.fb25
    end

    # Filter bits
    def self.fb25=(value : Bool) : Bool
      self.set(fb25: value)
      value
    end

    # Filter bits
    def fb26 : Bool
      @value.bits_set?(0x4000000_u32)
    end

    # Filter bits
    def self.fb26 : Bool
      value.fb26
    end

    # Filter bits
    def self.fb26=(value : Bool) : Bool
      self.set(fb26: value)
      value
    end

    # Filter bits
    def fb27 : Bool
      @value.bits_set?(0x8000000_u32)
    end

    # Filter bits
    def self.fb27 : Bool
      value.fb27
    end

    # Filter bits
    def self.fb27=(value : Bool) : Bool
      self.set(fb27: value)
      value
    end

    # Filter bits
    def fb28 : Bool
      @value.bits_set?(0x10000000_u32)
    end

    # Filter bits
    def self.fb28 : Bool
      value.fb28
    end

    # Filter bits
    def self.fb28=(value : Bool) : Bool
      self.set(fb28: value)
      value
    end

    # Filter bits
    def fb29 : Bool
      @value.bits_set?(0x20000000_u32)
    end

    # Filter bits
    def self.fb29 : Bool
      value.fb29
    end

    # Filter bits
    def self.fb29=(value : Bool) : Bool
      self.set(fb29: value)
      value
    end

    # Filter bits
    def fb30 : Bool
      @value.bits_set?(0x40000000_u32)
    end

    # Filter bits
    def self.fb30 : Bool
      value.fb30
    end

    # Filter bits
    def self.fb30=(value : Bool) : Bool
      self.set(fb30: value)
      value
    end

    # Filter bits
    def fb31 : Bool
      @value.bits_set?(0x80000000_u32)
    end

    # Filter bits
    def self.fb31 : Bool
      value.fb31
    end

    # Filter bits
    def self.fb31=(value : Bool) : Bool
      self.set(fb31: value)
      value
    end

    def copy_with(
      *,

      fb0 : Bool? = nil,

      fb1 : Bool? = nil,

      fb2 : Bool? = nil,

      fb3 : Bool? = nil,

      fb4 : Bool? = nil,

      fb5 : Bool? = nil,

      fb6 : Bool? = nil,

      fb7 : Bool? = nil,

      fb8 : Bool? = nil,

      fb9 : Bool? = nil,

      fb10 : Bool? = nil,

      fb11 : Bool? = nil,

      fb12 : Bool? = nil,

      fb13 : Bool? = nil,

      fb14 : Bool? = nil,

      fb15 : Bool? = nil,

      fb16 : Bool? = nil,

      fb17 : Bool? = nil,

      fb18 : Bool? = nil,

      fb19 : Bool? = nil,

      fb20 : Bool? = nil,

      fb21 : Bool? = nil,

      fb22 : Bool? = nil,

      fb23 : Bool? = nil,

      fb24 : Bool? = nil,

      fb25 : Bool? = nil,

      fb26 : Bool? = nil,

      fb27 : Bool? = nil,

      fb28 : Bool? = nil,

      fb29 : Bool? = nil,

      fb30 : Bool? = nil,

      fb31 : Bool? = nil
    ) : self
      value = @value

      unless fb0.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(fb0.to_int).&(0x1_u32) << 0
      end

      unless fb1.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(fb1.to_int).&(0x1_u32) << 1
      end

      unless fb2.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(fb2.to_int).&(0x1_u32) << 2
      end

      unless fb3.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(fb3.to_int).&(0x1_u32) << 3
      end

      unless fb4.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(fb4.to_int).&(0x1_u32) << 4
      end

      unless fb5.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(fb5.to_int).&(0x1_u32) << 5
      end

      unless fb6.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(fb6.to_int).&(0x1_u32) << 6
      end

      unless fb7.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(fb7.to_int).&(0x1_u32) << 7
      end

      unless fb8.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(fb8.to_int).&(0x1_u32) << 8
      end

      unless fb9.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(fb9.to_int).&(0x1_u32) << 9
      end

      unless fb10.nil?
        value = (value & 0xfffffbff_u32) |
                UInt32.new!(fb10.to_int).&(0x1_u32) << 10
      end

      unless fb11.nil?
        value = (value & 0xfffff7ff_u32) |
                UInt32.new!(fb11.to_int).&(0x1_u32) << 11
      end

      unless fb12.nil?
        value = (value & 0xffffefff_u32) |
                UInt32.new!(fb12.to_int).&(0x1_u32) << 12
      end

      unless fb13.nil?
        value = (value & 0xffffdfff_u32) |
                UInt32.new!(fb13.to_int).&(0x1_u32) << 13
      end

      unless fb14.nil?
        value = (value & 0xffffbfff_u32) |
                UInt32.new!(fb14.to_int).&(0x1_u32) << 14
      end

      unless fb15.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(fb15.to_int).&(0x1_u32) << 15
      end

      unless fb16.nil?
        value = (value & 0xfffeffff_u32) |
                UInt32.new!(fb16.to_int).&(0x1_u32) << 16
      end

      unless fb17.nil?
        value = (value & 0xfffdffff_u32) |
                UInt32.new!(fb17.to_int).&(0x1_u32) << 17
      end

      unless fb18.nil?
        value = (value & 0xfffbffff_u32) |
                UInt32.new!(fb18.to_int).&(0x1_u32) << 18
      end

      unless fb19.nil?
        value = (value & 0xfff7ffff_u32) |
                UInt32.new!(fb19.to_int).&(0x1_u32) << 19
      end

      unless fb20.nil?
        value = (value & 0xffefffff_u32) |
                UInt32.new!(fb20.to_int).&(0x1_u32) << 20
      end

      unless fb21.nil?
        value = (value & 0xffdfffff_u32) |
                UInt32.new!(fb21.to_int).&(0x1_u32) << 21
      end

      unless fb22.nil?
        value = (value & 0xffbfffff_u32) |
                UInt32.new!(fb22.to_int).&(0x1_u32) << 22
      end

      unless fb23.nil?
        value = (value & 0xff7fffff_u32) |
                UInt32.new!(fb23.to_int).&(0x1_u32) << 23
      end

      unless fb24.nil?
        value = (value & 0xfeffffff_u32) |
                UInt32.new!(fb24.to_int).&(0x1_u32) << 24
      end

      unless fb25.nil?
        value = (value & 0xfdffffff_u32) |
                UInt32.new!(fb25.to_int).&(0x1_u32) << 25
      end

      unless fb26.nil?
        value = (value & 0xfbffffff_u32) |
                UInt32.new!(fb26.to_int).&(0x1_u32) << 26
      end

      unless fb27.nil?
        value = (value & 0xf7ffffff_u32) |
                UInt32.new!(fb27.to_int).&(0x1_u32) << 27
      end

      unless fb28.nil?
        value = (value & 0xefffffff_u32) |
                UInt32.new!(fb28.to_int).&(0x1_u32) << 28
      end

      unless fb29.nil?
        value = (value & 0xdfffffff_u32) |
                UInt32.new!(fb29.to_int).&(0x1_u32) << 29
      end

      unless fb30.nil?
        value = (value & 0xbfffffff_u32) |
                UInt32.new!(fb30.to_int).&(0x1_u32) << 30
      end

      unless fb31.nil?
        value = (value & 0x7fffffff_u32) |
                UInt32.new!(fb31.to_int).&(0x1_u32) << 31
      end

      self.class.new(value)
    end

    def self.set(
      *,
      fb0 : Bool? = nil,
      fb1 : Bool? = nil,
      fb2 : Bool? = nil,
      fb3 : Bool? = nil,
      fb4 : Bool? = nil,
      fb5 : Bool? = nil,
      fb6 : Bool? = nil,
      fb7 : Bool? = nil,
      fb8 : Bool? = nil,
      fb9 : Bool? = nil,
      fb10 : Bool? = nil,
      fb11 : Bool? = nil,
      fb12 : Bool? = nil,
      fb13 : Bool? = nil,
      fb14 : Bool? = nil,
      fb15 : Bool? = nil,
      fb16 : Bool? = nil,
      fb17 : Bool? = nil,
      fb18 : Bool? = nil,
      fb19 : Bool? = nil,
      fb20 : Bool? = nil,
      fb21 : Bool? = nil,
      fb22 : Bool? = nil,
      fb23 : Bool? = nil,
      fb24 : Bool? = nil,
      fb25 : Bool? = nil,
      fb26 : Bool? = nil,
      fb27 : Bool? = nil,
      fb28 : Bool? = nil,
      fb29 : Bool? = nil,
      fb30 : Bool? = nil,
      fb31 : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        fb0: fb0,
        fb1: fb1,
        fb2: fb2,
        fb3: fb3,
        fb4: fb4,
        fb5: fb5,
        fb6: fb6,
        fb7: fb7,
        fb8: fb8,
        fb9: fb9,
        fb10: fb10,
        fb11: fb11,
        fb12: fb12,
        fb13: fb13,
        fb14: fb14,
        fb15: fb15,
        fb16: fb16,
        fb17: fb17,
        fb18: fb18,
        fb19: fb19,
        fb20: fb20,
        fb21: fb21,
        fb22: fb22,
        fb23: fb23,
        fb24: fb24,
        fb25: fb25,
        fb26: fb26,
        fb27: fb27,
        fb28: fb28,
        fb29: fb29,
        fb30: fb30,
        fb31: fb31,
      )
    end
  end # struct

  # Filter bank 26 register 1
  struct F26R1
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

    # Filter bits
    def fb0 : Bool
      @value.bits_set?(0x1_u32)
    end

    # Filter bits
    def self.fb0 : Bool
      value.fb0
    end

    # Filter bits
    def self.fb0=(value : Bool) : Bool
      self.set(fb0: value)
      value
    end

    # Filter bits
    def fb1 : Bool
      @value.bits_set?(0x2_u32)
    end

    # Filter bits
    def self.fb1 : Bool
      value.fb1
    end

    # Filter bits
    def self.fb1=(value : Bool) : Bool
      self.set(fb1: value)
      value
    end

    # Filter bits
    def fb2 : Bool
      @value.bits_set?(0x4_u32)
    end

    # Filter bits
    def self.fb2 : Bool
      value.fb2
    end

    # Filter bits
    def self.fb2=(value : Bool) : Bool
      self.set(fb2: value)
      value
    end

    # Filter bits
    def fb3 : Bool
      @value.bits_set?(0x8_u32)
    end

    # Filter bits
    def self.fb3 : Bool
      value.fb3
    end

    # Filter bits
    def self.fb3=(value : Bool) : Bool
      self.set(fb3: value)
      value
    end

    # Filter bits
    def fb4 : Bool
      @value.bits_set?(0x10_u32)
    end

    # Filter bits
    def self.fb4 : Bool
      value.fb4
    end

    # Filter bits
    def self.fb4=(value : Bool) : Bool
      self.set(fb4: value)
      value
    end

    # Filter bits
    def fb5 : Bool
      @value.bits_set?(0x20_u32)
    end

    # Filter bits
    def self.fb5 : Bool
      value.fb5
    end

    # Filter bits
    def self.fb5=(value : Bool) : Bool
      self.set(fb5: value)
      value
    end

    # Filter bits
    def fb6 : Bool
      @value.bits_set?(0x40_u32)
    end

    # Filter bits
    def self.fb6 : Bool
      value.fb6
    end

    # Filter bits
    def self.fb6=(value : Bool) : Bool
      self.set(fb6: value)
      value
    end

    # Filter bits
    def fb7 : Bool
      @value.bits_set?(0x80_u32)
    end

    # Filter bits
    def self.fb7 : Bool
      value.fb7
    end

    # Filter bits
    def self.fb7=(value : Bool) : Bool
      self.set(fb7: value)
      value
    end

    # Filter bits
    def fb8 : Bool
      @value.bits_set?(0x100_u32)
    end

    # Filter bits
    def self.fb8 : Bool
      value.fb8
    end

    # Filter bits
    def self.fb8=(value : Bool) : Bool
      self.set(fb8: value)
      value
    end

    # Filter bits
    def fb9 : Bool
      @value.bits_set?(0x200_u32)
    end

    # Filter bits
    def self.fb9 : Bool
      value.fb9
    end

    # Filter bits
    def self.fb9=(value : Bool) : Bool
      self.set(fb9: value)
      value
    end

    # Filter bits
    def fb10 : Bool
      @value.bits_set?(0x400_u32)
    end

    # Filter bits
    def self.fb10 : Bool
      value.fb10
    end

    # Filter bits
    def self.fb10=(value : Bool) : Bool
      self.set(fb10: value)
      value
    end

    # Filter bits
    def fb11 : Bool
      @value.bits_set?(0x800_u32)
    end

    # Filter bits
    def self.fb11 : Bool
      value.fb11
    end

    # Filter bits
    def self.fb11=(value : Bool) : Bool
      self.set(fb11: value)
      value
    end

    # Filter bits
    def fb12 : Bool
      @value.bits_set?(0x1000_u32)
    end

    # Filter bits
    def self.fb12 : Bool
      value.fb12
    end

    # Filter bits
    def self.fb12=(value : Bool) : Bool
      self.set(fb12: value)
      value
    end

    # Filter bits
    def fb13 : Bool
      @value.bits_set?(0x2000_u32)
    end

    # Filter bits
    def self.fb13 : Bool
      value.fb13
    end

    # Filter bits
    def self.fb13=(value : Bool) : Bool
      self.set(fb13: value)
      value
    end

    # Filter bits
    def fb14 : Bool
      @value.bits_set?(0x4000_u32)
    end

    # Filter bits
    def self.fb14 : Bool
      value.fb14
    end

    # Filter bits
    def self.fb14=(value : Bool) : Bool
      self.set(fb14: value)
      value
    end

    # Filter bits
    def fb15 : Bool
      @value.bits_set?(0x8000_u32)
    end

    # Filter bits
    def self.fb15 : Bool
      value.fb15
    end

    # Filter bits
    def self.fb15=(value : Bool) : Bool
      self.set(fb15: value)
      value
    end

    # Filter bits
    def fb16 : Bool
      @value.bits_set?(0x10000_u32)
    end

    # Filter bits
    def self.fb16 : Bool
      value.fb16
    end

    # Filter bits
    def self.fb16=(value : Bool) : Bool
      self.set(fb16: value)
      value
    end

    # Filter bits
    def fb17 : Bool
      @value.bits_set?(0x20000_u32)
    end

    # Filter bits
    def self.fb17 : Bool
      value.fb17
    end

    # Filter bits
    def self.fb17=(value : Bool) : Bool
      self.set(fb17: value)
      value
    end

    # Filter bits
    def fb18 : Bool
      @value.bits_set?(0x40000_u32)
    end

    # Filter bits
    def self.fb18 : Bool
      value.fb18
    end

    # Filter bits
    def self.fb18=(value : Bool) : Bool
      self.set(fb18: value)
      value
    end

    # Filter bits
    def fb19 : Bool
      @value.bits_set?(0x80000_u32)
    end

    # Filter bits
    def self.fb19 : Bool
      value.fb19
    end

    # Filter bits
    def self.fb19=(value : Bool) : Bool
      self.set(fb19: value)
      value
    end

    # Filter bits
    def fb20 : Bool
      @value.bits_set?(0x100000_u32)
    end

    # Filter bits
    def self.fb20 : Bool
      value.fb20
    end

    # Filter bits
    def self.fb20=(value : Bool) : Bool
      self.set(fb20: value)
      value
    end

    # Filter bits
    def fb21 : Bool
      @value.bits_set?(0x200000_u32)
    end

    # Filter bits
    def self.fb21 : Bool
      value.fb21
    end

    # Filter bits
    def self.fb21=(value : Bool) : Bool
      self.set(fb21: value)
      value
    end

    # Filter bits
    def fb22 : Bool
      @value.bits_set?(0x400000_u32)
    end

    # Filter bits
    def self.fb22 : Bool
      value.fb22
    end

    # Filter bits
    def self.fb22=(value : Bool) : Bool
      self.set(fb22: value)
      value
    end

    # Filter bits
    def fb23 : Bool
      @value.bits_set?(0x800000_u32)
    end

    # Filter bits
    def self.fb23 : Bool
      value.fb23
    end

    # Filter bits
    def self.fb23=(value : Bool) : Bool
      self.set(fb23: value)
      value
    end

    # Filter bits
    def fb24 : Bool
      @value.bits_set?(0x1000000_u32)
    end

    # Filter bits
    def self.fb24 : Bool
      value.fb24
    end

    # Filter bits
    def self.fb24=(value : Bool) : Bool
      self.set(fb24: value)
      value
    end

    # Filter bits
    def fb25 : Bool
      @value.bits_set?(0x2000000_u32)
    end

    # Filter bits
    def self.fb25 : Bool
      value.fb25
    end

    # Filter bits
    def self.fb25=(value : Bool) : Bool
      self.set(fb25: value)
      value
    end

    # Filter bits
    def fb26 : Bool
      @value.bits_set?(0x4000000_u32)
    end

    # Filter bits
    def self.fb26 : Bool
      value.fb26
    end

    # Filter bits
    def self.fb26=(value : Bool) : Bool
      self.set(fb26: value)
      value
    end

    # Filter bits
    def fb27 : Bool
      @value.bits_set?(0x8000000_u32)
    end

    # Filter bits
    def self.fb27 : Bool
      value.fb27
    end

    # Filter bits
    def self.fb27=(value : Bool) : Bool
      self.set(fb27: value)
      value
    end

    # Filter bits
    def fb28 : Bool
      @value.bits_set?(0x10000000_u32)
    end

    # Filter bits
    def self.fb28 : Bool
      value.fb28
    end

    # Filter bits
    def self.fb28=(value : Bool) : Bool
      self.set(fb28: value)
      value
    end

    # Filter bits
    def fb29 : Bool
      @value.bits_set?(0x20000000_u32)
    end

    # Filter bits
    def self.fb29 : Bool
      value.fb29
    end

    # Filter bits
    def self.fb29=(value : Bool) : Bool
      self.set(fb29: value)
      value
    end

    # Filter bits
    def fb30 : Bool
      @value.bits_set?(0x40000000_u32)
    end

    # Filter bits
    def self.fb30 : Bool
      value.fb30
    end

    # Filter bits
    def self.fb30=(value : Bool) : Bool
      self.set(fb30: value)
      value
    end

    # Filter bits
    def fb31 : Bool
      @value.bits_set?(0x80000000_u32)
    end

    # Filter bits
    def self.fb31 : Bool
      value.fb31
    end

    # Filter bits
    def self.fb31=(value : Bool) : Bool
      self.set(fb31: value)
      value
    end

    def copy_with(
      *,

      fb0 : Bool? = nil,

      fb1 : Bool? = nil,

      fb2 : Bool? = nil,

      fb3 : Bool? = nil,

      fb4 : Bool? = nil,

      fb5 : Bool? = nil,

      fb6 : Bool? = nil,

      fb7 : Bool? = nil,

      fb8 : Bool? = nil,

      fb9 : Bool? = nil,

      fb10 : Bool? = nil,

      fb11 : Bool? = nil,

      fb12 : Bool? = nil,

      fb13 : Bool? = nil,

      fb14 : Bool? = nil,

      fb15 : Bool? = nil,

      fb16 : Bool? = nil,

      fb17 : Bool? = nil,

      fb18 : Bool? = nil,

      fb19 : Bool? = nil,

      fb20 : Bool? = nil,

      fb21 : Bool? = nil,

      fb22 : Bool? = nil,

      fb23 : Bool? = nil,

      fb24 : Bool? = nil,

      fb25 : Bool? = nil,

      fb26 : Bool? = nil,

      fb27 : Bool? = nil,

      fb28 : Bool? = nil,

      fb29 : Bool? = nil,

      fb30 : Bool? = nil,

      fb31 : Bool? = nil
    ) : self
      value = @value

      unless fb0.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(fb0.to_int).&(0x1_u32) << 0
      end

      unless fb1.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(fb1.to_int).&(0x1_u32) << 1
      end

      unless fb2.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(fb2.to_int).&(0x1_u32) << 2
      end

      unless fb3.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(fb3.to_int).&(0x1_u32) << 3
      end

      unless fb4.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(fb4.to_int).&(0x1_u32) << 4
      end

      unless fb5.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(fb5.to_int).&(0x1_u32) << 5
      end

      unless fb6.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(fb6.to_int).&(0x1_u32) << 6
      end

      unless fb7.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(fb7.to_int).&(0x1_u32) << 7
      end

      unless fb8.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(fb8.to_int).&(0x1_u32) << 8
      end

      unless fb9.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(fb9.to_int).&(0x1_u32) << 9
      end

      unless fb10.nil?
        value = (value & 0xfffffbff_u32) |
                UInt32.new!(fb10.to_int).&(0x1_u32) << 10
      end

      unless fb11.nil?
        value = (value & 0xfffff7ff_u32) |
                UInt32.new!(fb11.to_int).&(0x1_u32) << 11
      end

      unless fb12.nil?
        value = (value & 0xffffefff_u32) |
                UInt32.new!(fb12.to_int).&(0x1_u32) << 12
      end

      unless fb13.nil?
        value = (value & 0xffffdfff_u32) |
                UInt32.new!(fb13.to_int).&(0x1_u32) << 13
      end

      unless fb14.nil?
        value = (value & 0xffffbfff_u32) |
                UInt32.new!(fb14.to_int).&(0x1_u32) << 14
      end

      unless fb15.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(fb15.to_int).&(0x1_u32) << 15
      end

      unless fb16.nil?
        value = (value & 0xfffeffff_u32) |
                UInt32.new!(fb16.to_int).&(0x1_u32) << 16
      end

      unless fb17.nil?
        value = (value & 0xfffdffff_u32) |
                UInt32.new!(fb17.to_int).&(0x1_u32) << 17
      end

      unless fb18.nil?
        value = (value & 0xfffbffff_u32) |
                UInt32.new!(fb18.to_int).&(0x1_u32) << 18
      end

      unless fb19.nil?
        value = (value & 0xfff7ffff_u32) |
                UInt32.new!(fb19.to_int).&(0x1_u32) << 19
      end

      unless fb20.nil?
        value = (value & 0xffefffff_u32) |
                UInt32.new!(fb20.to_int).&(0x1_u32) << 20
      end

      unless fb21.nil?
        value = (value & 0xffdfffff_u32) |
                UInt32.new!(fb21.to_int).&(0x1_u32) << 21
      end

      unless fb22.nil?
        value = (value & 0xffbfffff_u32) |
                UInt32.new!(fb22.to_int).&(0x1_u32) << 22
      end

      unless fb23.nil?
        value = (value & 0xff7fffff_u32) |
                UInt32.new!(fb23.to_int).&(0x1_u32) << 23
      end

      unless fb24.nil?
        value = (value & 0xfeffffff_u32) |
                UInt32.new!(fb24.to_int).&(0x1_u32) << 24
      end

      unless fb25.nil?
        value = (value & 0xfdffffff_u32) |
                UInt32.new!(fb25.to_int).&(0x1_u32) << 25
      end

      unless fb26.nil?
        value = (value & 0xfbffffff_u32) |
                UInt32.new!(fb26.to_int).&(0x1_u32) << 26
      end

      unless fb27.nil?
        value = (value & 0xf7ffffff_u32) |
                UInt32.new!(fb27.to_int).&(0x1_u32) << 27
      end

      unless fb28.nil?
        value = (value & 0xefffffff_u32) |
                UInt32.new!(fb28.to_int).&(0x1_u32) << 28
      end

      unless fb29.nil?
        value = (value & 0xdfffffff_u32) |
                UInt32.new!(fb29.to_int).&(0x1_u32) << 29
      end

      unless fb30.nil?
        value = (value & 0xbfffffff_u32) |
                UInt32.new!(fb30.to_int).&(0x1_u32) << 30
      end

      unless fb31.nil?
        value = (value & 0x7fffffff_u32) |
                UInt32.new!(fb31.to_int).&(0x1_u32) << 31
      end

      self.class.new(value)
    end

    def self.set(
      *,
      fb0 : Bool? = nil,
      fb1 : Bool? = nil,
      fb2 : Bool? = nil,
      fb3 : Bool? = nil,
      fb4 : Bool? = nil,
      fb5 : Bool? = nil,
      fb6 : Bool? = nil,
      fb7 : Bool? = nil,
      fb8 : Bool? = nil,
      fb9 : Bool? = nil,
      fb10 : Bool? = nil,
      fb11 : Bool? = nil,
      fb12 : Bool? = nil,
      fb13 : Bool? = nil,
      fb14 : Bool? = nil,
      fb15 : Bool? = nil,
      fb16 : Bool? = nil,
      fb17 : Bool? = nil,
      fb18 : Bool? = nil,
      fb19 : Bool? = nil,
      fb20 : Bool? = nil,
      fb21 : Bool? = nil,
      fb22 : Bool? = nil,
      fb23 : Bool? = nil,
      fb24 : Bool? = nil,
      fb25 : Bool? = nil,
      fb26 : Bool? = nil,
      fb27 : Bool? = nil,
      fb28 : Bool? = nil,
      fb29 : Bool? = nil,
      fb30 : Bool? = nil,
      fb31 : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        fb0: fb0,
        fb1: fb1,
        fb2: fb2,
        fb3: fb3,
        fb4: fb4,
        fb5: fb5,
        fb6: fb6,
        fb7: fb7,
        fb8: fb8,
        fb9: fb9,
        fb10: fb10,
        fb11: fb11,
        fb12: fb12,
        fb13: fb13,
        fb14: fb14,
        fb15: fb15,
        fb16: fb16,
        fb17: fb17,
        fb18: fb18,
        fb19: fb19,
        fb20: fb20,
        fb21: fb21,
        fb22: fb22,
        fb23: fb23,
        fb24: fb24,
        fb25: fb25,
        fb26: fb26,
        fb27: fb27,
        fb28: fb28,
        fb29: fb29,
        fb30: fb30,
        fb31: fb31,
      )
    end
  end # struct

  # Filter bank 26 register 2
  struct F26R2
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

    # Filter bits
    def fb0 : Bool
      @value.bits_set?(0x1_u32)
    end

    # Filter bits
    def self.fb0 : Bool
      value.fb0
    end

    # Filter bits
    def self.fb0=(value : Bool) : Bool
      self.set(fb0: value)
      value
    end

    # Filter bits
    def fb1 : Bool
      @value.bits_set?(0x2_u32)
    end

    # Filter bits
    def self.fb1 : Bool
      value.fb1
    end

    # Filter bits
    def self.fb1=(value : Bool) : Bool
      self.set(fb1: value)
      value
    end

    # Filter bits
    def fb2 : Bool
      @value.bits_set?(0x4_u32)
    end

    # Filter bits
    def self.fb2 : Bool
      value.fb2
    end

    # Filter bits
    def self.fb2=(value : Bool) : Bool
      self.set(fb2: value)
      value
    end

    # Filter bits
    def fb3 : Bool
      @value.bits_set?(0x8_u32)
    end

    # Filter bits
    def self.fb3 : Bool
      value.fb3
    end

    # Filter bits
    def self.fb3=(value : Bool) : Bool
      self.set(fb3: value)
      value
    end

    # Filter bits
    def fb4 : Bool
      @value.bits_set?(0x10_u32)
    end

    # Filter bits
    def self.fb4 : Bool
      value.fb4
    end

    # Filter bits
    def self.fb4=(value : Bool) : Bool
      self.set(fb4: value)
      value
    end

    # Filter bits
    def fb5 : Bool
      @value.bits_set?(0x20_u32)
    end

    # Filter bits
    def self.fb5 : Bool
      value.fb5
    end

    # Filter bits
    def self.fb5=(value : Bool) : Bool
      self.set(fb5: value)
      value
    end

    # Filter bits
    def fb6 : Bool
      @value.bits_set?(0x40_u32)
    end

    # Filter bits
    def self.fb6 : Bool
      value.fb6
    end

    # Filter bits
    def self.fb6=(value : Bool) : Bool
      self.set(fb6: value)
      value
    end

    # Filter bits
    def fb7 : Bool
      @value.bits_set?(0x80_u32)
    end

    # Filter bits
    def self.fb7 : Bool
      value.fb7
    end

    # Filter bits
    def self.fb7=(value : Bool) : Bool
      self.set(fb7: value)
      value
    end

    # Filter bits
    def fb8 : Bool
      @value.bits_set?(0x100_u32)
    end

    # Filter bits
    def self.fb8 : Bool
      value.fb8
    end

    # Filter bits
    def self.fb8=(value : Bool) : Bool
      self.set(fb8: value)
      value
    end

    # Filter bits
    def fb9 : Bool
      @value.bits_set?(0x200_u32)
    end

    # Filter bits
    def self.fb9 : Bool
      value.fb9
    end

    # Filter bits
    def self.fb9=(value : Bool) : Bool
      self.set(fb9: value)
      value
    end

    # Filter bits
    def fb10 : Bool
      @value.bits_set?(0x400_u32)
    end

    # Filter bits
    def self.fb10 : Bool
      value.fb10
    end

    # Filter bits
    def self.fb10=(value : Bool) : Bool
      self.set(fb10: value)
      value
    end

    # Filter bits
    def fb11 : Bool
      @value.bits_set?(0x800_u32)
    end

    # Filter bits
    def self.fb11 : Bool
      value.fb11
    end

    # Filter bits
    def self.fb11=(value : Bool) : Bool
      self.set(fb11: value)
      value
    end

    # Filter bits
    def fb12 : Bool
      @value.bits_set?(0x1000_u32)
    end

    # Filter bits
    def self.fb12 : Bool
      value.fb12
    end

    # Filter bits
    def self.fb12=(value : Bool) : Bool
      self.set(fb12: value)
      value
    end

    # Filter bits
    def fb13 : Bool
      @value.bits_set?(0x2000_u32)
    end

    # Filter bits
    def self.fb13 : Bool
      value.fb13
    end

    # Filter bits
    def self.fb13=(value : Bool) : Bool
      self.set(fb13: value)
      value
    end

    # Filter bits
    def fb14 : Bool
      @value.bits_set?(0x4000_u32)
    end

    # Filter bits
    def self.fb14 : Bool
      value.fb14
    end

    # Filter bits
    def self.fb14=(value : Bool) : Bool
      self.set(fb14: value)
      value
    end

    # Filter bits
    def fb15 : Bool
      @value.bits_set?(0x8000_u32)
    end

    # Filter bits
    def self.fb15 : Bool
      value.fb15
    end

    # Filter bits
    def self.fb15=(value : Bool) : Bool
      self.set(fb15: value)
      value
    end

    # Filter bits
    def fb16 : Bool
      @value.bits_set?(0x10000_u32)
    end

    # Filter bits
    def self.fb16 : Bool
      value.fb16
    end

    # Filter bits
    def self.fb16=(value : Bool) : Bool
      self.set(fb16: value)
      value
    end

    # Filter bits
    def fb17 : Bool
      @value.bits_set?(0x20000_u32)
    end

    # Filter bits
    def self.fb17 : Bool
      value.fb17
    end

    # Filter bits
    def self.fb17=(value : Bool) : Bool
      self.set(fb17: value)
      value
    end

    # Filter bits
    def fb18 : Bool
      @value.bits_set?(0x40000_u32)
    end

    # Filter bits
    def self.fb18 : Bool
      value.fb18
    end

    # Filter bits
    def self.fb18=(value : Bool) : Bool
      self.set(fb18: value)
      value
    end

    # Filter bits
    def fb19 : Bool
      @value.bits_set?(0x80000_u32)
    end

    # Filter bits
    def self.fb19 : Bool
      value.fb19
    end

    # Filter bits
    def self.fb19=(value : Bool) : Bool
      self.set(fb19: value)
      value
    end

    # Filter bits
    def fb20 : Bool
      @value.bits_set?(0x100000_u32)
    end

    # Filter bits
    def self.fb20 : Bool
      value.fb20
    end

    # Filter bits
    def self.fb20=(value : Bool) : Bool
      self.set(fb20: value)
      value
    end

    # Filter bits
    def fb21 : Bool
      @value.bits_set?(0x200000_u32)
    end

    # Filter bits
    def self.fb21 : Bool
      value.fb21
    end

    # Filter bits
    def self.fb21=(value : Bool) : Bool
      self.set(fb21: value)
      value
    end

    # Filter bits
    def fb22 : Bool
      @value.bits_set?(0x400000_u32)
    end

    # Filter bits
    def self.fb22 : Bool
      value.fb22
    end

    # Filter bits
    def self.fb22=(value : Bool) : Bool
      self.set(fb22: value)
      value
    end

    # Filter bits
    def fb23 : Bool
      @value.bits_set?(0x800000_u32)
    end

    # Filter bits
    def self.fb23 : Bool
      value.fb23
    end

    # Filter bits
    def self.fb23=(value : Bool) : Bool
      self.set(fb23: value)
      value
    end

    # Filter bits
    def fb24 : Bool
      @value.bits_set?(0x1000000_u32)
    end

    # Filter bits
    def self.fb24 : Bool
      value.fb24
    end

    # Filter bits
    def self.fb24=(value : Bool) : Bool
      self.set(fb24: value)
      value
    end

    # Filter bits
    def fb25 : Bool
      @value.bits_set?(0x2000000_u32)
    end

    # Filter bits
    def self.fb25 : Bool
      value.fb25
    end

    # Filter bits
    def self.fb25=(value : Bool) : Bool
      self.set(fb25: value)
      value
    end

    # Filter bits
    def fb26 : Bool
      @value.bits_set?(0x4000000_u32)
    end

    # Filter bits
    def self.fb26 : Bool
      value.fb26
    end

    # Filter bits
    def self.fb26=(value : Bool) : Bool
      self.set(fb26: value)
      value
    end

    # Filter bits
    def fb27 : Bool
      @value.bits_set?(0x8000000_u32)
    end

    # Filter bits
    def self.fb27 : Bool
      value.fb27
    end

    # Filter bits
    def self.fb27=(value : Bool) : Bool
      self.set(fb27: value)
      value
    end

    # Filter bits
    def fb28 : Bool
      @value.bits_set?(0x10000000_u32)
    end

    # Filter bits
    def self.fb28 : Bool
      value.fb28
    end

    # Filter bits
    def self.fb28=(value : Bool) : Bool
      self.set(fb28: value)
      value
    end

    # Filter bits
    def fb29 : Bool
      @value.bits_set?(0x20000000_u32)
    end

    # Filter bits
    def self.fb29 : Bool
      value.fb29
    end

    # Filter bits
    def self.fb29=(value : Bool) : Bool
      self.set(fb29: value)
      value
    end

    # Filter bits
    def fb30 : Bool
      @value.bits_set?(0x40000000_u32)
    end

    # Filter bits
    def self.fb30 : Bool
      value.fb30
    end

    # Filter bits
    def self.fb30=(value : Bool) : Bool
      self.set(fb30: value)
      value
    end

    # Filter bits
    def fb31 : Bool
      @value.bits_set?(0x80000000_u32)
    end

    # Filter bits
    def self.fb31 : Bool
      value.fb31
    end

    # Filter bits
    def self.fb31=(value : Bool) : Bool
      self.set(fb31: value)
      value
    end

    def copy_with(
      *,

      fb0 : Bool? = nil,

      fb1 : Bool? = nil,

      fb2 : Bool? = nil,

      fb3 : Bool? = nil,

      fb4 : Bool? = nil,

      fb5 : Bool? = nil,

      fb6 : Bool? = nil,

      fb7 : Bool? = nil,

      fb8 : Bool? = nil,

      fb9 : Bool? = nil,

      fb10 : Bool? = nil,

      fb11 : Bool? = nil,

      fb12 : Bool? = nil,

      fb13 : Bool? = nil,

      fb14 : Bool? = nil,

      fb15 : Bool? = nil,

      fb16 : Bool? = nil,

      fb17 : Bool? = nil,

      fb18 : Bool? = nil,

      fb19 : Bool? = nil,

      fb20 : Bool? = nil,

      fb21 : Bool? = nil,

      fb22 : Bool? = nil,

      fb23 : Bool? = nil,

      fb24 : Bool? = nil,

      fb25 : Bool? = nil,

      fb26 : Bool? = nil,

      fb27 : Bool? = nil,

      fb28 : Bool? = nil,

      fb29 : Bool? = nil,

      fb30 : Bool? = nil,

      fb31 : Bool? = nil
    ) : self
      value = @value

      unless fb0.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(fb0.to_int).&(0x1_u32) << 0
      end

      unless fb1.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(fb1.to_int).&(0x1_u32) << 1
      end

      unless fb2.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(fb2.to_int).&(0x1_u32) << 2
      end

      unless fb3.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(fb3.to_int).&(0x1_u32) << 3
      end

      unless fb4.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(fb4.to_int).&(0x1_u32) << 4
      end

      unless fb5.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(fb5.to_int).&(0x1_u32) << 5
      end

      unless fb6.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(fb6.to_int).&(0x1_u32) << 6
      end

      unless fb7.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(fb7.to_int).&(0x1_u32) << 7
      end

      unless fb8.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(fb8.to_int).&(0x1_u32) << 8
      end

      unless fb9.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(fb9.to_int).&(0x1_u32) << 9
      end

      unless fb10.nil?
        value = (value & 0xfffffbff_u32) |
                UInt32.new!(fb10.to_int).&(0x1_u32) << 10
      end

      unless fb11.nil?
        value = (value & 0xfffff7ff_u32) |
                UInt32.new!(fb11.to_int).&(0x1_u32) << 11
      end

      unless fb12.nil?
        value = (value & 0xffffefff_u32) |
                UInt32.new!(fb12.to_int).&(0x1_u32) << 12
      end

      unless fb13.nil?
        value = (value & 0xffffdfff_u32) |
                UInt32.new!(fb13.to_int).&(0x1_u32) << 13
      end

      unless fb14.nil?
        value = (value & 0xffffbfff_u32) |
                UInt32.new!(fb14.to_int).&(0x1_u32) << 14
      end

      unless fb15.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(fb15.to_int).&(0x1_u32) << 15
      end

      unless fb16.nil?
        value = (value & 0xfffeffff_u32) |
                UInt32.new!(fb16.to_int).&(0x1_u32) << 16
      end

      unless fb17.nil?
        value = (value & 0xfffdffff_u32) |
                UInt32.new!(fb17.to_int).&(0x1_u32) << 17
      end

      unless fb18.nil?
        value = (value & 0xfffbffff_u32) |
                UInt32.new!(fb18.to_int).&(0x1_u32) << 18
      end

      unless fb19.nil?
        value = (value & 0xfff7ffff_u32) |
                UInt32.new!(fb19.to_int).&(0x1_u32) << 19
      end

      unless fb20.nil?
        value = (value & 0xffefffff_u32) |
                UInt32.new!(fb20.to_int).&(0x1_u32) << 20
      end

      unless fb21.nil?
        value = (value & 0xffdfffff_u32) |
                UInt32.new!(fb21.to_int).&(0x1_u32) << 21
      end

      unless fb22.nil?
        value = (value & 0xffbfffff_u32) |
                UInt32.new!(fb22.to_int).&(0x1_u32) << 22
      end

      unless fb23.nil?
        value = (value & 0xff7fffff_u32) |
                UInt32.new!(fb23.to_int).&(0x1_u32) << 23
      end

      unless fb24.nil?
        value = (value & 0xfeffffff_u32) |
                UInt32.new!(fb24.to_int).&(0x1_u32) << 24
      end

      unless fb25.nil?
        value = (value & 0xfdffffff_u32) |
                UInt32.new!(fb25.to_int).&(0x1_u32) << 25
      end

      unless fb26.nil?
        value = (value & 0xfbffffff_u32) |
                UInt32.new!(fb26.to_int).&(0x1_u32) << 26
      end

      unless fb27.nil?
        value = (value & 0xf7ffffff_u32) |
                UInt32.new!(fb27.to_int).&(0x1_u32) << 27
      end

      unless fb28.nil?
        value = (value & 0xefffffff_u32) |
                UInt32.new!(fb28.to_int).&(0x1_u32) << 28
      end

      unless fb29.nil?
        value = (value & 0xdfffffff_u32) |
                UInt32.new!(fb29.to_int).&(0x1_u32) << 29
      end

      unless fb30.nil?
        value = (value & 0xbfffffff_u32) |
                UInt32.new!(fb30.to_int).&(0x1_u32) << 30
      end

      unless fb31.nil?
        value = (value & 0x7fffffff_u32) |
                UInt32.new!(fb31.to_int).&(0x1_u32) << 31
      end

      self.class.new(value)
    end

    def self.set(
      *,
      fb0 : Bool? = nil,
      fb1 : Bool? = nil,
      fb2 : Bool? = nil,
      fb3 : Bool? = nil,
      fb4 : Bool? = nil,
      fb5 : Bool? = nil,
      fb6 : Bool? = nil,
      fb7 : Bool? = nil,
      fb8 : Bool? = nil,
      fb9 : Bool? = nil,
      fb10 : Bool? = nil,
      fb11 : Bool? = nil,
      fb12 : Bool? = nil,
      fb13 : Bool? = nil,
      fb14 : Bool? = nil,
      fb15 : Bool? = nil,
      fb16 : Bool? = nil,
      fb17 : Bool? = nil,
      fb18 : Bool? = nil,
      fb19 : Bool? = nil,
      fb20 : Bool? = nil,
      fb21 : Bool? = nil,
      fb22 : Bool? = nil,
      fb23 : Bool? = nil,
      fb24 : Bool? = nil,
      fb25 : Bool? = nil,
      fb26 : Bool? = nil,
      fb27 : Bool? = nil,
      fb28 : Bool? = nil,
      fb29 : Bool? = nil,
      fb30 : Bool? = nil,
      fb31 : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        fb0: fb0,
        fb1: fb1,
        fb2: fb2,
        fb3: fb3,
        fb4: fb4,
        fb5: fb5,
        fb6: fb6,
        fb7: fb7,
        fb8: fb8,
        fb9: fb9,
        fb10: fb10,
        fb11: fb11,
        fb12: fb12,
        fb13: fb13,
        fb14: fb14,
        fb15: fb15,
        fb16: fb16,
        fb17: fb17,
        fb18: fb18,
        fb19: fb19,
        fb20: fb20,
        fb21: fb21,
        fb22: fb22,
        fb23: fb23,
        fb24: fb24,
        fb25: fb25,
        fb26: fb26,
        fb27: fb27,
        fb28: fb28,
        fb29: fb29,
        fb30: fb30,
        fb31: fb31,
      )
    end
  end # struct

  # Filter bank 27 register 1
  struct F27R1
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

    # Filter bits
    def fb0 : Bool
      @value.bits_set?(0x1_u32)
    end

    # Filter bits
    def self.fb0 : Bool
      value.fb0
    end

    # Filter bits
    def self.fb0=(value : Bool) : Bool
      self.set(fb0: value)
      value
    end

    # Filter bits
    def fb1 : Bool
      @value.bits_set?(0x2_u32)
    end

    # Filter bits
    def self.fb1 : Bool
      value.fb1
    end

    # Filter bits
    def self.fb1=(value : Bool) : Bool
      self.set(fb1: value)
      value
    end

    # Filter bits
    def fb2 : Bool
      @value.bits_set?(0x4_u32)
    end

    # Filter bits
    def self.fb2 : Bool
      value.fb2
    end

    # Filter bits
    def self.fb2=(value : Bool) : Bool
      self.set(fb2: value)
      value
    end

    # Filter bits
    def fb3 : Bool
      @value.bits_set?(0x8_u32)
    end

    # Filter bits
    def self.fb3 : Bool
      value.fb3
    end

    # Filter bits
    def self.fb3=(value : Bool) : Bool
      self.set(fb3: value)
      value
    end

    # Filter bits
    def fb4 : Bool
      @value.bits_set?(0x10_u32)
    end

    # Filter bits
    def self.fb4 : Bool
      value.fb4
    end

    # Filter bits
    def self.fb4=(value : Bool) : Bool
      self.set(fb4: value)
      value
    end

    # Filter bits
    def fb5 : Bool
      @value.bits_set?(0x20_u32)
    end

    # Filter bits
    def self.fb5 : Bool
      value.fb5
    end

    # Filter bits
    def self.fb5=(value : Bool) : Bool
      self.set(fb5: value)
      value
    end

    # Filter bits
    def fb6 : Bool
      @value.bits_set?(0x40_u32)
    end

    # Filter bits
    def self.fb6 : Bool
      value.fb6
    end

    # Filter bits
    def self.fb6=(value : Bool) : Bool
      self.set(fb6: value)
      value
    end

    # Filter bits
    def fb7 : Bool
      @value.bits_set?(0x80_u32)
    end

    # Filter bits
    def self.fb7 : Bool
      value.fb7
    end

    # Filter bits
    def self.fb7=(value : Bool) : Bool
      self.set(fb7: value)
      value
    end

    # Filter bits
    def fb8 : Bool
      @value.bits_set?(0x100_u32)
    end

    # Filter bits
    def self.fb8 : Bool
      value.fb8
    end

    # Filter bits
    def self.fb8=(value : Bool) : Bool
      self.set(fb8: value)
      value
    end

    # Filter bits
    def fb9 : Bool
      @value.bits_set?(0x200_u32)
    end

    # Filter bits
    def self.fb9 : Bool
      value.fb9
    end

    # Filter bits
    def self.fb9=(value : Bool) : Bool
      self.set(fb9: value)
      value
    end

    # Filter bits
    def fb10 : Bool
      @value.bits_set?(0x400_u32)
    end

    # Filter bits
    def self.fb10 : Bool
      value.fb10
    end

    # Filter bits
    def self.fb10=(value : Bool) : Bool
      self.set(fb10: value)
      value
    end

    # Filter bits
    def fb11 : Bool
      @value.bits_set?(0x800_u32)
    end

    # Filter bits
    def self.fb11 : Bool
      value.fb11
    end

    # Filter bits
    def self.fb11=(value : Bool) : Bool
      self.set(fb11: value)
      value
    end

    # Filter bits
    def fb12 : Bool
      @value.bits_set?(0x1000_u32)
    end

    # Filter bits
    def self.fb12 : Bool
      value.fb12
    end

    # Filter bits
    def self.fb12=(value : Bool) : Bool
      self.set(fb12: value)
      value
    end

    # Filter bits
    def fb13 : Bool
      @value.bits_set?(0x2000_u32)
    end

    # Filter bits
    def self.fb13 : Bool
      value.fb13
    end

    # Filter bits
    def self.fb13=(value : Bool) : Bool
      self.set(fb13: value)
      value
    end

    # Filter bits
    def fb14 : Bool
      @value.bits_set?(0x4000_u32)
    end

    # Filter bits
    def self.fb14 : Bool
      value.fb14
    end

    # Filter bits
    def self.fb14=(value : Bool) : Bool
      self.set(fb14: value)
      value
    end

    # Filter bits
    def fb15 : Bool
      @value.bits_set?(0x8000_u32)
    end

    # Filter bits
    def self.fb15 : Bool
      value.fb15
    end

    # Filter bits
    def self.fb15=(value : Bool) : Bool
      self.set(fb15: value)
      value
    end

    # Filter bits
    def fb16 : Bool
      @value.bits_set?(0x10000_u32)
    end

    # Filter bits
    def self.fb16 : Bool
      value.fb16
    end

    # Filter bits
    def self.fb16=(value : Bool) : Bool
      self.set(fb16: value)
      value
    end

    # Filter bits
    def fb17 : Bool
      @value.bits_set?(0x20000_u32)
    end

    # Filter bits
    def self.fb17 : Bool
      value.fb17
    end

    # Filter bits
    def self.fb17=(value : Bool) : Bool
      self.set(fb17: value)
      value
    end

    # Filter bits
    def fb18 : Bool
      @value.bits_set?(0x40000_u32)
    end

    # Filter bits
    def self.fb18 : Bool
      value.fb18
    end

    # Filter bits
    def self.fb18=(value : Bool) : Bool
      self.set(fb18: value)
      value
    end

    # Filter bits
    def fb19 : Bool
      @value.bits_set?(0x80000_u32)
    end

    # Filter bits
    def self.fb19 : Bool
      value.fb19
    end

    # Filter bits
    def self.fb19=(value : Bool) : Bool
      self.set(fb19: value)
      value
    end

    # Filter bits
    def fb20 : Bool
      @value.bits_set?(0x100000_u32)
    end

    # Filter bits
    def self.fb20 : Bool
      value.fb20
    end

    # Filter bits
    def self.fb20=(value : Bool) : Bool
      self.set(fb20: value)
      value
    end

    # Filter bits
    def fb21 : Bool
      @value.bits_set?(0x200000_u32)
    end

    # Filter bits
    def self.fb21 : Bool
      value.fb21
    end

    # Filter bits
    def self.fb21=(value : Bool) : Bool
      self.set(fb21: value)
      value
    end

    # Filter bits
    def fb22 : Bool
      @value.bits_set?(0x400000_u32)
    end

    # Filter bits
    def self.fb22 : Bool
      value.fb22
    end

    # Filter bits
    def self.fb22=(value : Bool) : Bool
      self.set(fb22: value)
      value
    end

    # Filter bits
    def fb23 : Bool
      @value.bits_set?(0x800000_u32)
    end

    # Filter bits
    def self.fb23 : Bool
      value.fb23
    end

    # Filter bits
    def self.fb23=(value : Bool) : Bool
      self.set(fb23: value)
      value
    end

    # Filter bits
    def fb24 : Bool
      @value.bits_set?(0x1000000_u32)
    end

    # Filter bits
    def self.fb24 : Bool
      value.fb24
    end

    # Filter bits
    def self.fb24=(value : Bool) : Bool
      self.set(fb24: value)
      value
    end

    # Filter bits
    def fb25 : Bool
      @value.bits_set?(0x2000000_u32)
    end

    # Filter bits
    def self.fb25 : Bool
      value.fb25
    end

    # Filter bits
    def self.fb25=(value : Bool) : Bool
      self.set(fb25: value)
      value
    end

    # Filter bits
    def fb26 : Bool
      @value.bits_set?(0x4000000_u32)
    end

    # Filter bits
    def self.fb26 : Bool
      value.fb26
    end

    # Filter bits
    def self.fb26=(value : Bool) : Bool
      self.set(fb26: value)
      value
    end

    # Filter bits
    def fb27 : Bool
      @value.bits_set?(0x8000000_u32)
    end

    # Filter bits
    def self.fb27 : Bool
      value.fb27
    end

    # Filter bits
    def self.fb27=(value : Bool) : Bool
      self.set(fb27: value)
      value
    end

    # Filter bits
    def fb28 : Bool
      @value.bits_set?(0x10000000_u32)
    end

    # Filter bits
    def self.fb28 : Bool
      value.fb28
    end

    # Filter bits
    def self.fb28=(value : Bool) : Bool
      self.set(fb28: value)
      value
    end

    # Filter bits
    def fb29 : Bool
      @value.bits_set?(0x20000000_u32)
    end

    # Filter bits
    def self.fb29 : Bool
      value.fb29
    end

    # Filter bits
    def self.fb29=(value : Bool) : Bool
      self.set(fb29: value)
      value
    end

    # Filter bits
    def fb30 : Bool
      @value.bits_set?(0x40000000_u32)
    end

    # Filter bits
    def self.fb30 : Bool
      value.fb30
    end

    # Filter bits
    def self.fb30=(value : Bool) : Bool
      self.set(fb30: value)
      value
    end

    # Filter bits
    def fb31 : Bool
      @value.bits_set?(0x80000000_u32)
    end

    # Filter bits
    def self.fb31 : Bool
      value.fb31
    end

    # Filter bits
    def self.fb31=(value : Bool) : Bool
      self.set(fb31: value)
      value
    end

    def copy_with(
      *,

      fb0 : Bool? = nil,

      fb1 : Bool? = nil,

      fb2 : Bool? = nil,

      fb3 : Bool? = nil,

      fb4 : Bool? = nil,

      fb5 : Bool? = nil,

      fb6 : Bool? = nil,

      fb7 : Bool? = nil,

      fb8 : Bool? = nil,

      fb9 : Bool? = nil,

      fb10 : Bool? = nil,

      fb11 : Bool? = nil,

      fb12 : Bool? = nil,

      fb13 : Bool? = nil,

      fb14 : Bool? = nil,

      fb15 : Bool? = nil,

      fb16 : Bool? = nil,

      fb17 : Bool? = nil,

      fb18 : Bool? = nil,

      fb19 : Bool? = nil,

      fb20 : Bool? = nil,

      fb21 : Bool? = nil,

      fb22 : Bool? = nil,

      fb23 : Bool? = nil,

      fb24 : Bool? = nil,

      fb25 : Bool? = nil,

      fb26 : Bool? = nil,

      fb27 : Bool? = nil,

      fb28 : Bool? = nil,

      fb29 : Bool? = nil,

      fb30 : Bool? = nil,

      fb31 : Bool? = nil
    ) : self
      value = @value

      unless fb0.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(fb0.to_int).&(0x1_u32) << 0


