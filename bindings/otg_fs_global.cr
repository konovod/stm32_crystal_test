# USB on the go full speed
module OTG_FS_GLOBAL
  VERSION      = nil
  BASE_ADDRESS = 0x50000000_u64

  # OTG_FS control and status register          (OTG_FS_GOTGCTL)
  struct FS_GOTGCTL
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
      new(0x800_u64)
    end

    def self.pointer : Pointer(UInt32)
      Pointer(UInt32).new(self.address)
    end

    def self.value : self
      value = self.pointer.load(volatile: true)
      new(value)
    end

    def self.value=(value : self) : self
      self.pointer.store(value.to_int, volatile: true)
      value
    end

    # Session request success
    def srqscs : Bool
      @value.bits_set?(0x1_u32)
    end

    # Session request success
    def self.srqscs : Bool
      value.srqscs
    end

    # Session request
    def srq : Bool
      @value.bits_set?(0x2_u32)
    end

    # Session request
    def self.srq : Bool
      value.srq
    end

    # Session request
    def self.srq=(value : Bool) : Bool
      self.set(srq: value)
      value
    end

    # Host negotiation success
    def hngscs : Bool
      @value.bits_set?(0x100_u32)
    end

    # Host negotiation success
    def self.hngscs : Bool
      value.hngscs
    end

    # HNP request
    def hnprq : Bool
      @value.bits_set?(0x200_u32)
    end

    # HNP request
    def self.hnprq : Bool
      value.hnprq
    end

    # HNP request
    def self.hnprq=(value : Bool) : Bool
      self.set(hnprq: value)
      value
    end

    # Host set HNP enable
    def hshnpen : Bool
      @value.bits_set?(0x400_u32)
    end

    # Host set HNP enable
    def self.hshnpen : Bool
      value.hshnpen
    end

    # Host set HNP enable
    def self.hshnpen=(value : Bool) : Bool
      self.set(hshnpen: value)
      value
    end

    # Device HNP enabled
    def dhnpen : Bool
      @value.bits_set?(0x800_u32)
    end

    # Device HNP enabled
    def self.dhnpen : Bool
      value.dhnpen
    end

    # Device HNP enabled
    def self.dhnpen=(value : Bool) : Bool
      self.set(dhnpen: value)
      value
    end

    # Connector ID status
    def cidsts : Bool
      @value.bits_set?(0x10000_u32)
    end

    # Connector ID status
    def self.cidsts : Bool
      value.cidsts
    end

    # Long/short debounce time
    def dbct : Bool
      @value.bits_set?(0x20000_u32)
    end

    # Long/short debounce time
    def self.dbct : Bool
      value.dbct
    end

    # A-session valid
    def asvld : Bool
      @value.bits_set?(0x40000_u32)
    end

    # A-session valid
    def self.asvld : Bool
      value.asvld
    end

    # B-session valid
    def bsvld : Bool
      @value.bits_set?(0x80000_u32)
    end

    # B-session valid
    def self.bsvld : Bool
      value.bsvld
    end

    def copy_with(
      *,

      srq : Bool? = nil,

      hnprq : Bool? = nil,

      hshnpen : Bool? = nil,

      dhnpen : Bool? = nil
    ) : self
      value = @value

      unless srq.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(srq.to_int).&(0x1_u32) << 1
      end

      unless hnprq.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(hnprq.to_int).&(0x1_u32) << 9
      end

      unless hshnpen.nil?
        value = (value & 0xfffffbff_u32) |
                UInt32.new!(hshnpen.to_int).&(0x1_u32) << 10
      end

      unless dhnpen.nil?
        value = (value & 0xfffff7ff_u32) |
                UInt32.new!(dhnpen.to_int).&(0x1_u32) << 11
      end

      self.class.new(value)
    end

    def self.set(
      *,
      srq : Bool? = nil,
      hnprq : Bool? = nil,
      hshnpen : Bool? = nil,
      dhnpen : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        srq: srq,
        hnprq: hnprq,
        hshnpen: hshnpen,
        dhnpen: dhnpen,
      )
    end
  end # struct

  # OTG_FS interrupt register          (OTG_FS_GOTGINT)
  struct FS_GOTGINT
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

    # Session end detected
    def sedet : Bool
      @value.bits_set?(0x4_u32)
    end

    # Session end detected
    def self.sedet : Bool
      value.sedet
    end

    # Session end detected
    def self.sedet=(value : Bool) : Bool
      self.set(sedet: value)
      value
    end

    # Session request success status              change
    def srsschg : Bool
      @value.bits_set?(0x100_u32)
    end

    # Session request success status              change
    def self.srsschg : Bool
      value.srsschg
    end

    # Session request success status              change
    def self.srsschg=(value : Bool) : Bool
      self.set(srsschg: value)
      value
    end

    # Host negotiation success status              change
    def hnsschg : Bool
      @value.bits_set?(0x200_u32)
    end

    # Host negotiation success status              change
    def self.hnsschg : Bool
      value.hnsschg
    end

    # Host negotiation success status              change
    def self.hnsschg=(value : Bool) : Bool
      self.set(hnsschg: value)
      value
    end

    # Host negotiation detected
    def hngdet : Bool
      @value.bits_set?(0x20000_u32)
    end

    # Host negotiation detected
    def self.hngdet : Bool
      value.hngdet
    end

    # Host negotiation detected
    def self.hngdet=(value : Bool) : Bool
      self.set(hngdet: value)
      value
    end

    # A-device timeout change
    def adtochg : Bool
      @value.bits_set?(0x40000_u32)
    end

    # A-device timeout change
    def self.adtochg : Bool
      value.adtochg
    end

    # A-device timeout change
    def self.adtochg=(value : Bool) : Bool
      self.set(adtochg: value)
      value
    end

    # Debounce done
    def dbcdne : Bool
      @value.bits_set?(0x80000_u32)
    end

    # Debounce done
    def self.dbcdne : Bool
      value.dbcdne
    end

    # Debounce done
    def self.dbcdne=(value : Bool) : Bool
      self.set(dbcdne: value)
      value
    end

    def copy_with(
      *,

      sedet : Bool? = nil,

      srsschg : Bool? = nil,

      hnsschg : Bool? = nil,

      hngdet : Bool? = nil,

      adtochg : Bool? = nil,

      dbcdne : Bool? = nil
    ) : self
      value = @value

      unless sedet.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(sedet.to_int).&(0x1_u32) << 2
      end

      unless srsschg.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(srsschg.to_int).&(0x1_u32) << 8
      end

      unless hnsschg.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(hnsschg.to_int).&(0x1_u32) << 9
      end

      unless hngdet.nil?
        value = (value & 0xfffdffff_u32) |
                UInt32.new!(hngdet.to_int).&(0x1_u32) << 17
      end

      unless adtochg.nil?
        value = (value & 0xfffbffff_u32) |
                UInt32.new!(adtochg.to_int).&(0x1_u32) << 18
      end

      unless dbcdne.nil?
        value = (value & 0xfff7ffff_u32) |
                UInt32.new!(dbcdne.to_int).&(0x1_u32) << 19
      end

      self.class.new(value)
    end

    def self.set(
      *,
      sedet : Bool? = nil,
      srsschg : Bool? = nil,
      hnsschg : Bool? = nil,
      hngdet : Bool? = nil,
      adtochg : Bool? = nil,
      dbcdne : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        sedet: sedet,
        srsschg: srsschg,
        hnsschg: hnsschg,
        hngdet: hngdet,
        adtochg: adtochg,
        dbcdne: dbcdne,
      )
    end
  end # struct

  # OTG_FS AHB configuration register          (OTG_FS_GAHBCFG)
  struct FS_GAHBCFG
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

    # Global interrupt mask
    def gint : Bool
      @value.bits_set?(0x1_u32)
    end

    # Global interrupt mask
    def self.gint : Bool
      value.gint
    end

    # Global interrupt mask
    def self.gint=(value : Bool) : Bool
      self.set(gint: value)
      value
    end

    # TxFIFO empty level
    def txfelvl : Bool
      @value.bits_set?(0x80_u32)
    end

    # TxFIFO empty level
    def self.txfelvl : Bool
      value.txfelvl
    end

    # TxFIFO empty level
    def self.txfelvl=(value : Bool) : Bool
      self.set(txfelvl: value)
      value
    end

    # Periodic TxFIFO empty              level
    def ptxfelvl : Bool
      @value.bits_set?(0x100_u32)
    end

    # Periodic TxFIFO empty              level
    def self.ptxfelvl : Bool
      value.ptxfelvl
    end

    # Periodic TxFIFO empty              level
    def self.ptxfelvl=(value : Bool) : Bool
      self.set(ptxfelvl: value)
      value
    end

    def copy_with(
      *,

      gint : Bool? = nil,

      txfelvl : Bool? = nil,

      ptxfelvl : Bool? = nil
    ) : self
      value = @value

      unless gint.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(gint.to_int).&(0x1_u32) << 0
      end

      unless txfelvl.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(txfelvl.to_int).&(0x1_u32) << 7
      end

      unless ptxfelvl.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(ptxfelvl.to_int).&(0x1_u32) << 8
      end

      self.class.new(value)
    end

    def self.set(
      *,
      gint : Bool? = nil,
      txfelvl : Bool? = nil,
      ptxfelvl : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        gint: gint,
        txfelvl: txfelvl,
        ptxfelvl: ptxfelvl,
      )
    end
  end # struct

  # OTG_FS USB configuration register          (OTG_FS_GUSBCFG)
  struct FS_GUSBCFG
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
      new(0xa00_u64)
    end

    def self.pointer : Pointer(UInt32)
      Pointer(UInt32).new(self.address)
    end

    def self.value : self
      value = self.pointer.load(volatile: true)
      new(value)
    end

    def self.value=(value : self) : self
      self.pointer.store(value.to_int, volatile: true)
      value
    end

    # FS timeout calibration
    def tocal : UInt8
      UInt8.new!((@value >> 0) & 0x7_u32)
    end

    # FS timeout calibration
    def self.tocal : UInt8
      value.tocal
    end

    # FS timeout calibration
    def self.tocal=(value : UInt8) : UInt8
      self.set(tocal: value)
      value
    end

    # Full Speed serial transceiver              select
    def self.physel=(value : Bool) : Bool
      self.set(physel: value)
      value
    end

    # SRP-capable
    def srpcap : Bool
      @value.bits_set?(0x100_u32)
    end

    # SRP-capable
    def self.srpcap : Bool
      value.srpcap
    end

    # SRP-capable
    def self.srpcap=(value : Bool) : Bool
      self.set(srpcap: value)
      value
    end

    # HNP-capable
    def hnpcap : Bool
      @value.bits_set?(0x200_u32)
    end

    # HNP-capable
    def self.hnpcap : Bool
      value.hnpcap
    end

    # HNP-capable
    def self.hnpcap=(value : Bool) : Bool
      self.set(hnpcap: value)
      value
    end

    # USB turnaround time
    def trdt : UInt8
      UInt8.new!((@value >> 10) & 0xf_u32)
    end

    # USB turnaround time
    def self.trdt : UInt8
      value.trdt
    end

    # USB turnaround time
    def self.trdt=(value : UInt8) : UInt8
      self.set(trdt: value)
      value
    end

    # Force host mode
    def fhmod : Bool
      @value.bits_set?(0x20000000_u32)
    end

    # Force host mode
    def self.fhmod : Bool
      value.fhmod
    end

    # Force host mode
    def self.fhmod=(value : Bool) : Bool
      self.set(fhmod: value)
      value
    end

    # Force device mode
    def fdmod : Bool
      @value.bits_set?(0x40000000_u32)
    end

    # Force device mode
    def self.fdmod : Bool
      value.fdmod
    end

    # Force device mode
    def self.fdmod=(value : Bool) : Bool
      self.set(fdmod: value)
      value
    end

    # Corrupt Tx packet
    def ctxpkt : Bool
      @value.bits_set?(0x80000000_u32)
    end

    # Corrupt Tx packet
    def self.ctxpkt : Bool
      value.ctxpkt
    end

    # Corrupt Tx packet
    def self.ctxpkt=(value : Bool) : Bool
      self.set(ctxpkt: value)
      value
    end

    def copy_with(
      *,

      tocal : UInt8? = nil,

      physel : Bool? = nil,

      srpcap : Bool? = nil,

      hnpcap : Bool? = nil,

      trdt : UInt8? = nil,

      fhmod : Bool? = nil,

      fdmod : Bool? = nil,

      ctxpkt : Bool? = nil
    ) : self
      value = @value

      unless tocal.nil?
        value = (value & 0xfffffff8_u32) |
                UInt32.new!(tocal.to_int).&(0x7_u32) << 0
      end

      unless physel.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(physel.to_int).&(0x1_u32) << 6
      end

      unless srpcap.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(srpcap.to_int).&(0x1_u32) << 8
      end

      unless hnpcap.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(hnpcap.to_int).&(0x1_u32) << 9
      end

      unless trdt.nil?
        value = (value & 0xffffc3ff_u32) |
                UInt32.new!(trdt.to_int).&(0xf_u32) << 10
      end

      unless fhmod.nil?
        value = (value & 0xdfffffff_u32) |
                UInt32.new!(fhmod.to_int).&(0x1_u32) << 29
      end

      unless fdmod.nil?
        value = (value & 0xbfffffff_u32) |
                UInt32.new!(fdmod.to_int).&(0x1_u32) << 30
      end

      unless ctxpkt.nil?
        value = (value & 0x7fffffff_u32) |
                UInt32.new!(ctxpkt.to_int).&(0x1_u32) << 31
      end

      self.class.new(value)
    end

    def self.set(
      *,
      tocal : UInt8? = nil,
      physel : Bool? = nil,
      srpcap : Bool? = nil,
      hnpcap : Bool? = nil,
      trdt : UInt8? = nil,
      fhmod : Bool? = nil,
      fdmod : Bool? = nil,
      ctxpkt : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        tocal: tocal,
        physel: physel,
        srpcap: srpcap,
        hnpcap: hnpcap,
        trdt: trdt,
        fhmod: fhmod,
        fdmod: fdmod,
        ctxpkt: ctxpkt,
      )
    end
  end # struct

  # OTG_FS reset register          (OTG_FS_GRSTCTL)
  struct FS_GRSTCTL
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
      new(0x20000000_u64)
    end

    def self.pointer : Pointer(UInt32)
      Pointer(UInt32).new(self.address)
    end

    def self.value : self
      value = self.pointer.load(volatile: true)
      new(value)
    end

    def self.value=(value : self) : self
      self.pointer.store(value.to_int, volatile: true)
      value
    end

    # Core soft reset
    def csrst : Bool
      @value.bits_set?(0x1_u32)
    end

    # Core soft reset
    def self.csrst : Bool
      value.csrst
    end

    # Core soft reset
    def self.csrst=(value : Bool) : Bool
      self.set(csrst: value)
      value
    end

    # HCLK soft reset
    def hsrst : Bool
      @value.bits_set?(0x2_u32)
    end

    # HCLK soft reset
    def self.hsrst : Bool
      value.hsrst
    end

    # HCLK soft reset
    def self.hsrst=(value : Bool) : Bool
      self.set(hsrst: value)
      value
    end

    # Host frame counter reset
    def fcrst : Bool
      @value.bits_set?(0x4_u32)
    end

    # Host frame counter reset
    def self.fcrst : Bool
      value.fcrst
    end

    # Host frame counter reset
    def self.fcrst=(value : Bool) : Bool
      self.set(fcrst: value)
      value
    end

    # RxFIFO flush
    def rxfflsh : Bool
      @value.bits_set?(0x10_u32)
    end

    # RxFIFO flush
    def self.rxfflsh : Bool
      value.rxfflsh
    end

    # RxFIFO flush
    def self.rxfflsh=(value : Bool) : Bool
      self.set(rxfflsh: value)
      value
    end

    # TxFIFO flush
    def txfflsh : Bool
      @value.bits_set?(0x20_u32)
    end

    # TxFIFO flush
    def self.txfflsh : Bool
      value.txfflsh
    end

    # TxFIFO flush
    def self.txfflsh=(value : Bool) : Bool
      self.set(txfflsh: value)
      value
    end

    # TxFIFO number
    def txfnum : UInt8
      UInt8.new!((@value >> 6) & 0x1f_u32)
    end

    # TxFIFO number
    def self.txfnum : UInt8
      value.txfnum
    end

    # TxFIFO number
    def self.txfnum=(value : UInt8) : UInt8
      self.set(txfnum: value)
      value
    end

    # AHB master idle
    def ahbidl : Bool
      @value.bits_set?(0x80000000_u32)
    end

    # AHB master idle
    def self.ahbidl : Bool
      value.ahbidl
    end

    def copy_with(
      *,

      csrst : Bool? = nil,

      hsrst : Bool? = nil,

      fcrst : Bool? = nil,

      rxfflsh : Bool? = nil,

      txfflsh : Bool? = nil,

      txfnum : UInt8? = nil
    ) : self
      value = @value

      unless csrst.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(csrst.to_int).&(0x1_u32) << 0
      end

      unless hsrst.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(hsrst.to_int).&(0x1_u32) << 1
      end

      unless fcrst.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(fcrst.to_int).&(0x1_u32) << 2
      end

      unless rxfflsh.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(rxfflsh.to_int).&(0x1_u32) << 4
      end

      unless txfflsh.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(txfflsh.to_int).&(0x1_u32) << 5
      end

      unless txfnum.nil?
        value = (value & 0xfffff83f_u32) |
                UInt32.new!(txfnum.to_int).&(0x1f_u32) << 6
      end

      self.class.new(value)
    end

    def self.set(
      *,
      csrst : Bool? = nil,
      hsrst : Bool? = nil,
      fcrst : Bool? = nil,
      rxfflsh : Bool? = nil,
      txfflsh : Bool? = nil,
      txfnum : UInt8? = nil
    ) : Nil
      self.value = self.value.copy_with(
        csrst: csrst,
        hsrst: hsrst,
        fcrst: fcrst,
        rxfflsh: rxfflsh,
        txfflsh: txfflsh,
        txfnum: txfnum,
      )
    end
  end # struct

  # OTG_FS core interrupt register          (OTG_FS_GINTSTS)
  struct FS_GINTSTS
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
      new(0x4000020_u64)
    end

    def self.pointer : Pointer(UInt32)
      Pointer(UInt32).new(self.address)
    end

    def self.value : self
      value = self.pointer.load(volatile: true)
      new(value)
    end

    def self.value=(value : self) : self
      self.pointer.store(value.to_int, volatile: true)
      value
    end

    # Current mode of operation
    def cmod : Bool
      @value.bits_set?(0x1_u32)
    end

    # Current mode of operation
    def self.cmod : Bool
      value.cmod
    end

    # Mode mismatch interrupt
    def mmis : Bool
      @value.bits_set?(0x2_u32)
    end

    # Mode mismatch interrupt
    def self.mmis : Bool
      value.mmis
    end

    # Mode mismatch interrupt
    def self.mmis=(value : Bool) : Bool
      self.set(mmis: value)
      value
    end

    # OTG interrupt
    def otgint : Bool
      @value.bits_set?(0x4_u32)
    end

    # OTG interrupt
    def self.otgint : Bool
      value.otgint
    end

    # Start of frame
    def sof : Bool
      @value.bits_set?(0x8_u32)
    end

    # Start of frame
    def self.sof : Bool
      value.sof
    end

    # Start of frame
    def self.sof=(value : Bool) : Bool
      self.set(sof: value)
      value
    end

    # RxFIFO non-empty
    def rxflvl : Bool
      @value.bits_set?(0x10_u32)
    end

    # RxFIFO non-empty
    def self.rxflvl : Bool
      value.rxflvl
    end

    # Non-periodic TxFIFO empty
    def nptxfe : Bool
      @value.bits_set?(0x20_u32)
    end

    # Non-periodic TxFIFO empty
    def self.nptxfe : Bool
      value.nptxfe
    end

    # Global IN non-periodic NAK              effective
    def ginakeff : Bool
      @value.bits_set?(0x40_u32)
    end

    # Global IN non-periodic NAK              effective
    def self.ginakeff : Bool
      value.ginakeff
    end

    # Global OUT NAK effective
    def goutnakeff : Bool
      @value.bits_set?(0x80_u32)
    end

    # Global OUT NAK effective
    def self.goutnakeff : Bool
      value.goutnakeff
    end

    # Early suspend
    def esusp : Bool
      @value.bits_set?(0x400_u32)
    end

    # Early suspend
    def self.esusp : Bool
      value.esusp
    end

    # Early suspend
    def self.esusp=(value : Bool) : Bool
      self.set(esusp: value)
      value
    end

    # USB suspend
    def usbsusp : Bool
      @value.bits_set?(0x800_u32)
    end

    # USB suspend
    def self.usbsusp : Bool
      value.usbsusp
    end

    # USB suspend
    def self.usbsusp=(value : Bool) : Bool
      self.set(usbsusp: value)
      value
    end

    # USB reset
    def usbrst : Bool
      @value.bits_set?(0x1000_u32)
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

    # Enumeration done
    def enumdne : Bool
      @value.bits_set?(0x2000_u32)
    end

    # Enumeration done
    def self.enumdne : Bool
      value.enumdne
    end

    # Enumeration done
    def self.enumdne=(value : Bool) : Bool
      self.set(enumdne: value)
      value
    end

    # Isochronous OUT packet dropped              interrupt
    def isoodrp : Bool
      @value.bits_set?(0x4000_u32)
    end

    # Isochronous OUT packet dropped              interrupt
    def self.isoodrp : Bool
      value.isoodrp
    end

    # Isochronous OUT packet dropped              interrupt
    def self.isoodrp=(value : Bool) : Bool
      self.set(isoodrp: value)
      value
    end

    # End of periodic frame              interrupt
    def eopf : Bool
      @value.bits_set?(0x8000_u32)
    end

    # End of periodic frame              interrupt
    def self.eopf : Bool
      value.eopf
    end

    # End of periodic frame              interrupt
    def self.eopf=(value : Bool) : Bool
      self.set(eopf: value)
      value
    end

    # IN endpoint interrupt
    def iepint : Bool
      @value.bits_set?(0x40000_u32)
    end

    # IN endpoint interrupt
    def self.iepint : Bool
      value.iepint
    end

    # OUT endpoint interrupt
    def oepint : Bool
      @value.bits_set?(0x80000_u32)
    end

    # OUT endpoint interrupt
    def self.oepint : Bool
      value.oepint
    end

    # Incomplete isochronous IN              transfer
    def iisoixfr : Bool
      @value.bits_set?(0x100000_u32)
    end

    # Incomplete isochronous IN              transfer
    def self.iisoixfr : Bool
      value.iisoixfr
    end

    # Incomplete isochronous IN              transfer
    def self.iisoixfr=(value : Bool) : Bool
      self.set(iisoixfr: value)
      value
    end

    # Incomplete periodic transfer(Host              mode)/Incomplete isochronous OUT transfer(Device              mode)
    def ipxfr_incompisoout : Bool
      @value.bits_set?(0x200000_u32)
    end

    # Incomplete periodic transfer(Host              mode)/Incomplete isochronous OUT transfer(Device              mode)
    def self.ipxfr_incompisoout : Bool
      value.ipxfr_incompisoout
    end

    # Incomplete periodic transfer(Host              mode)/Incomplete isochronous OUT transfer(Device              mode)
    def self.ipxfr_incompisoout=(value : Bool) : Bool
      self.set(ipxfr_incompisoout: value)
      value
    end

    # Host port interrupt
    def hprtint : Bool
      @value.bits_set?(0x1000000_u32)
    end

    # Host port interrupt
    def self.hprtint : Bool
      value.hprtint
    end

    # Host channels interrupt
    def hcint : Bool
      @value.bits_set?(0x2000000_u32)
    end

    # Host channels interrupt
    def self.hcint : Bool
      value.hcint
    end

    # Periodic TxFIFO empty
    def ptxfe : Bool
      @value.bits_set?(0x4000000_u32)
    end

    # Periodic TxFIFO empty
    def self.ptxfe : Bool
      value.ptxfe
    end

    # Connector ID status change
    def cidschg : Bool
      @value.bits_set?(0x10000000_u32)
    end

    # Connector ID status change
    def self.cidschg : Bool
      value.cidschg
    end

    # Connector ID status change
    def self.cidschg=(value : Bool) : Bool
      self.set(cidschg: value)
      value
    end

    # Disconnect detected              interrupt
    def discint : Bool
      @value.bits_set?(0x20000000_u32)
    end

    # Disconnect detected              interrupt
    def self.discint : Bool
      value.discint
    end

    # Disconnect detected              interrupt
    def self.discint=(value : Bool) : Bool
      self.set(discint: value)
      value
    end

    # Session request/new session detected              interrupt
    def srqint : Bool
      @value.bits_set?(0x40000000_u32)
    end

    # Session request/new session detected              interrupt
    def self.srqint : Bool
      value.srqint
    end

    # Session request/new session detected              interrupt
    def self.srqint=(value : Bool) : Bool
      self.set(srqint: value)
      value
    end

    # Resume/remote wakeup detected              interrupt
    def wkupint : Bool
      @value.bits_set?(0x80000000_u32)
    end

    # Resume/remote wakeup detected              interrupt
    def self.wkupint : Bool
      value.wkupint
    end

    # Resume/remote wakeup detected              interrupt
    def self.wkupint=(value : Bool) : Bool
      self.set(wkupint: value)
      value
    end

    def copy_with(
      *,

      mmis : Bool? = nil,

      sof : Bool? = nil,

      esusp : Bool? = nil,

      usbsusp : Bool? = nil,

      usbrst : Bool? = nil,

      enumdne : Bool? = nil,

      isoodrp : Bool? = nil,

      eopf : Bool? = nil,

      iisoixfr : Bool? = nil,

      ipxfr_incompisoout : Bool? = nil,

      cidschg : Bool? = nil,

      discint : Bool? = nil,

      srqint : Bool? = nil,

      wkupint : Bool? = nil
    ) : self
      value = @value

      unless mmis.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(mmis.to_int).&(0x1_u32) << 1
      end

      unless sof.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(sof.to_int).&(0x1_u32) << 3
      end

      unless esusp.nil?
        value = (value & 0xfffffbff_u32) |
                UInt32.new!(esusp.to_int).&(0x1_u32) << 10
      end

      unless usbsusp.nil?
        value = (value & 0xfffff7ff_u32) |
                UInt32.new!(usbsusp.to_int).&(0x1_u32) << 11
      end

      unless usbrst.nil?
        value = (value & 0xffffefff_u32) |
                UInt32.new!(usbrst.to_int).&(0x1_u32) << 12
      end

      unless enumdne.nil?
        value = (value & 0xffffdfff_u32) |
                UInt32.new!(enumdne.to_int).&(0x1_u32) << 13
      end

      unless isoodrp.nil?
        value = (value & 0xffffbfff_u32) |
                UInt32.new!(isoodrp.to_int).&(0x1_u32) << 14
      end

      unless eopf.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(eopf.to_int).&(0x1_u32) << 15
      end

      unless iisoixfr.nil?
        value = (value & 0xffefffff_u32) |
                UInt32.new!(iisoixfr.to_int).&(0x1_u32) << 20
      end

      unless ipxfr_incompisoout.nil?
        value = (value & 0xffdfffff_u32) |
                UInt32.new!(ipxfr_incompisoout.to_int).&(0x1_u32) << 21
      end

      unless cidschg.nil?
        value = (value & 0xefffffff_u32) |
                UInt32.new!(cidschg.to_int).&(0x1_u32) << 28
      end

      unless discint.nil?
        value = (value & 0xdfffffff_u32) |
                UInt32.new!(discint.to_int).&(0x1_u32) << 29
      end

      unless srqint.nil?
        value = (value & 0xbfffffff_u32) |
                UInt32.new!(srqint.to_int).&(0x1_u32) << 30
      end

      unless wkupint.nil?
        value = (value & 0x7fffffff_u32) |
                UInt32.new!(wkupint.to_int).&(0x1_u32) << 31
      end

      self.class.new(value)
    end

    def self.set(
      *,
      mmis : Bool? = nil,
      sof : Bool? = nil,
      esusp : Bool? = nil,
      usbsusp : Bool? = nil,
      usbrst : Bool? = nil,
      enumdne : Bool? = nil,
      isoodrp : Bool? = nil,
      eopf : Bool? = nil,
      iisoixfr : Bool? = nil,
      ipxfr_incompisoout : Bool? = nil,
      cidschg : Bool? = nil,
      discint : Bool? = nil,
      srqint : Bool? = nil,
      wkupint : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        mmis: mmis,
        sof: sof,
        esusp: esusp,
        usbsusp: usbsusp,
        usbrst: usbrst,
        enumdne: enumdne,
        isoodrp: isoodrp,
        eopf: eopf,
        iisoixfr: iisoixfr,
        ipxfr_incompisoout: ipxfr_incompisoout,
        cidschg: cidschg,
        discint: discint,
        srqint: srqint,
        wkupint: wkupint,
      )
    end
  end # struct

  # OTG_FS interrupt mask register          (OTG_FS_GINTMSK)
  struct FS_GINTMSK
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

    # Mode mismatch interrupt              mask
    def mmism : Bool
      @value.bits_set?(0x2_u32)
    end

    # Mode mismatch interrupt              mask
    def self.mmism : Bool
      value.mmism
    end

    # Mode mismatch interrupt              mask
    def self.mmism=(value : Bool) : Bool
      self.set(mmism: value)
      value
    end

    # OTG interrupt mask
    def otgint : Bool
      @value.bits_set?(0x4_u32)
    end

    # OTG interrupt mask
    def self.otgint : Bool
      value.otgint
    end

    # OTG interrupt mask
    def self.otgint=(value : Bool) : Bool
      self.set(otgint: value)
      value
    end

    # Start of frame mask
    def sofm : Bool
      @value.bits_set?(0x8_u32)
    end

    # Start of frame mask
    def self.sofm : Bool
      value.sofm
    end

    # Start of frame mask
    def self.sofm=(value : Bool) : Bool
      self.set(sofm: value)
      value
    end

    # Receive FIFO non-empty              mask
    def rxflvlm : Bool
      @value.bits_set?(0x10_u32)
    end

    # Receive FIFO non-empty              mask
    def self.rxflvlm : Bool
      value.rxflvlm
    end

    # Receive FIFO non-empty              mask
    def self.rxflvlm=(value : Bool) : Bool
      self.set(rxflvlm: value)
      value
    end

    # Non-periodic TxFIFO empty              mask
    def nptxfem : Bool
      @value.bits_set?(0x20_u32)
    end

    # Non-periodic TxFIFO empty              mask
    def self.nptxfem : Bool
      value.nptxfem
    end

    # Non-periodic TxFIFO empty              mask
    def self.nptxfem=(value : Bool) : Bool
      self.set(nptxfem: value)
      value
    end

    # Global non-periodic IN NAK effective              mask
    def ginakeffm : Bool
      @value.bits_set?(0x40_u32)
    end

    # Global non-periodic IN NAK effective              mask
    def self.ginakeffm : Bool
      value.ginakeffm
    end

    # Global non-periodic IN NAK effective              mask
    def self.ginakeffm=(value : Bool) : Bool
      self.set(ginakeffm: value)
      value
    end

    # Global OUT NAK effective              mask
    def gonakeffm : Bool
      @value.bits_set?(0x80_u32)
    end

    # Global OUT NAK effective              mask
    def self.gonakeffm : Bool
      value.gonakeffm
    end

    # Global OUT NAK effective              mask
    def self.gonakeffm=(value : Bool) : Bool
      self.set(gonakeffm: value)
      value
    end

    # Early suspend mask
    def esuspm : Bool
      @value.bits_set?(0x400_u32)
    end

    # Early suspend mask
    def self.esuspm : Bool
      value.esuspm
    end

    # Early suspend mask
    def self.esuspm=(value : Bool) : Bool
      self.set(esuspm: value)
      value
    end

    # USB suspend mask
    def usbsuspm : Bool
      @value.bits_set?(0x800_u32)
    end

    # USB suspend mask
    def self.usbsuspm : Bool
      value.usbsuspm
    end

    # USB suspend mask
    def self.usbsuspm=(value : Bool) : Bool
      self.set(usbsuspm: value)
      value
    end

    # USB reset mask
    def usbrst : Bool
      @value.bits_set?(0x1000_u32)
    end

    # USB reset mask
    def self.usbrst : Bool
      value.usbrst
    end

    # USB reset mask
    def self.usbrst=(value : Bool) : Bool
      self.set(usbrst: value)
      value
    end

    # Enumeration done mask
    def enumdnem : Bool
      @value.bits_set?(0x2000_u32)
    end

    # Enumeration done mask
    def self.enumdnem : Bool
      value.enumdnem
    end

    # Enumeration done mask
    def self.enumdnem=(value : Bool) : Bool
      self.set(enumdnem: value)
      value
    end

    # Isochronous OUT packet dropped interrupt              mask
    def isoodrpm : Bool
      @value.bits_set?(0x4000_u32)
    end

    # Isochronous OUT packet dropped interrupt              mask
    def self.isoodrpm : Bool
      value.isoodrpm
    end

    # Isochronous OUT packet dropped interrupt              mask
    def self.isoodrpm=(value : Bool) : Bool
      self.set(isoodrpm: value)
      value
    end

    # End of periodic frame interrupt              mask
    def eopfm : Bool
      @value.bits_set?(0x8000_u32)
    end

    # End of periodic frame interrupt              mask
    def self.eopfm : Bool
      value.eopfm
    end

    # End of periodic frame interrupt              mask
    def self.eopfm=(value : Bool) : Bool
      self.set(eopfm: value)
      value
    end

    # Endpoint mismatch interrupt              mask
    def epmism : Bool
      @value.bits_set?(0x20000_u32)
    end

    # Endpoint mismatch interrupt              mask
    def self.epmism : Bool
      value.epmism
    end

    # Endpoint mismatch interrupt              mask
    def self.epmism=(value : Bool) : Bool
      self.set(epmism: value)
      value
    end

    # IN endpoints interrupt              mask
    def iepint : Bool
      @value.bits_set?(0x40000_u32)
    end

    # IN endpoints interrupt              mask
    def self.iepint : Bool
      value.iepint
    end

    # IN endpoints interrupt              mask
    def self.iepint=(value : Bool) : Bool
      self.set(iepint: value)
      value
    end

    # OUT endpoints interrupt              mask
    def oepint : Bool
      @value.bits_set?(0x80000_u32)
    end

    # OUT endpoints interrupt              mask
    def self.oepint : Bool
      value.oepint
    end

    # OUT endpoints interrupt              mask
    def self.oepint=(value : Bool) : Bool
      self.set(oepint: value)
      value
    end

    # Incomplete isochronous IN transfer              mask
    def iisoixfrm : Bool
      @value.bits_set?(0x100000_u32)
    end

    # Incomplete isochronous IN transfer              mask
    def self.iisoixfrm : Bool
      value.iisoixfrm
    end

    # Incomplete isochronous IN transfer              mask
    def self.iisoixfrm=(value : Bool) : Bool
      self.set(iisoixfrm: value)
      value
    end

    # Incomplete periodic transfer mask(Host              mode)/Incomplete isochronous OUT transfer mask(Device              mode)
    def ipxfrm_iisooxfrm : Bool
      @value.bits_set?(0x200000_u32)
    end

    # Incomplete periodic transfer mask(Host              mode)/Incomplete isochronous OUT transfer mask(Device              mode)
    def self.ipxfrm_iisooxfrm : Bool
      value.ipxfrm_iisooxfrm
    end

    # Incomplete periodic transfer mask(Host              mode)/Incomplete isochronous OUT transfer mask(Device              mode)
    def self.ipxfrm_iisooxfrm=(value : Bool) : Bool
      self.set(ipxfrm_iisooxfrm: value)
      value
    end

    # Host port interrupt mask
    def prtim : Bool
      @value.bits_set?(0x1000000_u32)
    end

    # Host port interrupt mask
    def self.prtim : Bool
      value.prtim
    end

    # Host channels interrupt              mask
    def hcim : Bool
      @value.bits_set?(0x2000000_u32)
    end

    # Host channels interrupt              mask
    def self.hcim : Bool
      value.hcim
    end

    # Host channels interrupt              mask
    def self.hcim=(value : Bool) : Bool
      self.set(hcim: value)
      value
    end

    # Periodic TxFIFO empty mask
    def ptxfem : Bool
      @value.bits_set?(0x4000000_u32)
    end

    # Periodic TxFIFO empty mask
    def self.ptxfem : Bool
      value.ptxfem
    end

    # Periodic TxFIFO empty mask
    def self.ptxfem=(value : Bool) : Bool
      self.set(ptxfem: value)
      value
    end

    # Connector ID status change              mask
    def cidschgm : Bool
      @value.bits_set?(0x10000000_u32)
    end

    # Connector ID status change              mask
    def self.cidschgm : Bool
      value.cidschgm
    end

    # Connector ID status change              mask
    def self.cidschgm=(value : Bool) : Bool
      self.set(cidschgm: value)
      value
    end

    # Disconnect detected interrupt              mask
    def discint : Bool
      @value.bits_set?(0x20000000_u32)
    end

    # Disconnect detected interrupt              mask
    def self.discint : Bool
      value.discint
    end

    # Disconnect detected interrupt              mask
    def self.discint=(value : Bool) : Bool
      self.set(discint: value)
      value
    end

    # Session request/new session detected              interrupt mask
    def srqim : Bool
      @value.bits_set?(0x40000000_u32)
    end

    # Session request/new session detected              interrupt mask
    def self.srqim : Bool
      value.srqim
    end

    # Session request/new session detected              interrupt mask
    def self.srqim=(value : Bool) : Bool
      self.set(srqim: value)
      value
    end

    # Resume/remote wakeup detected interrupt              mask
    def wuim : Bool
      @value.bits_set?(0x80000000_u32)
    end

    # Resume/remote wakeup detected interrupt              mask
    def self.wuim : Bool
      value.wuim
    end

    # Resume/remote wakeup detected interrupt              mask
    def self.wuim=(value : Bool) : Bool
      self.set(wuim: value)
      value
    end

    def copy_with(
      *,

      mmism : Bool? = nil,

      otgint : Bool? = nil,

      sofm : Bool? = nil,

      rxflvlm : Bool? = nil,

      nptxfem : Bool? = nil,

      ginakeffm : Bool? = nil,

      gonakeffm : Bool? = nil,

      esuspm : Bool? = nil,

      usbsuspm : Bool? = nil,

      usbrst : Bool? = nil,

      enumdnem : Bool? = nil,

      isoodrpm : Bool? = nil,

      eopfm : Bool? = nil,

      epmism : Bool? = nil,

      iepint : Bool? = nil,

      oepint : Bool? = nil,

      iisoixfrm : Bool? = nil,

      ipxfrm_iisooxfrm : Bool? = nil,

      hcim : Bool? = nil,

      ptxfem : Bool? = nil,

      cidschgm : Bool? = nil,

      discint : Bool? = nil,

      srqim : Bool? = nil,

      wuim : Bool? = nil
    ) : self
      value = @value

      unless mmism.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(mmism.to_int).&(0x1_u32) << 1
      end

      unless otgint.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(otgint.to_int).&(0x1_u32) << 2
      end

      unless sofm.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(sofm.to_int).&(0x1_u32) << 3
      end

      unless rxflvlm.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(rxflvlm.to_int).&(0x1_u32) << 4
      end

      unless nptxfem.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(nptxfem.to_int).&(0x1_u32) << 5
      end

      unless ginakeffm.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(ginakeffm.to_int).&(0x1_u32) << 6
      end

      unless gonakeffm.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(gonakeffm.to_int).&(0x1_u32) << 7
      end

      unless esuspm.nil?
        value = (value & 0xfffffbff_u32) |
                UInt32.new!(esuspm.to_int).&(0x1_u32) << 10
      end

      unless usbsuspm.nil?
        value = (value & 0xfffff7ff_u32) |
                UInt32.new!(usbsuspm.to_int).&(0x1_u32) << 11
      end

      unless usbrst.nil?
        value = (value & 0xffffefff_u32) |
                UInt32.new!(usbrst.to_int).&(0x1_u32) << 12
      end

      unless enumdnem.nil?
        value = (value & 0xffffdfff_u32) |
                UInt32.new!(enumdnem.to_int).&(0x1_u32) << 13
      end

      unless isoodrpm.nil?
        value = (value & 0xffffbfff_u32) |
                UInt32.new!(isoodrpm.to_int).&(0x1_u32) << 14
      end

      unless eopfm.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(eopfm.to_int).&(0x1_u32) << 15
      end

      unless epmism.nil?
        value = (value & 0xfffdffff_u32) |
                UInt32.new!(epmism.to_int).&(0x1_u32) << 17
      end

      unless iepint.nil?
        value = (value & 0xfffbffff_u32) |
                UInt32.new!(iepint.to_int).&(0x1_u32) << 18
      end

      unless oepint.nil?
        value = (value & 0xfff7ffff_u32) |
                UInt32.new!(oepint.to_int).&(0x1_u32) << 19
      end

      unless iisoixfrm.nil?
        value = (value & 0xffefffff_u32) |
                UInt32.new!(iisoixfrm.to_int).&(0x1_u32) << 20
      end

      unless ipxfrm_iisooxfrm.nil?
        value = (value & 0xffdfffff_u32) |
                UInt32.new!(ipxfrm_iisooxfrm.to_int).&(0x1_u32) << 21
      end

      unless hcim.nil?
        value = (value & 0xfdffffff_u32) |
                UInt32.new!(hcim.to_int).&(0x1_u32) << 25
      end

      unless ptxfem.nil?
        value = (value & 0xfbffffff_u32) |
                UInt32.new!(ptxfem.to_int).&(0x1_u32) << 26
      end

      unless cidschgm.nil?
        value = (value & 0xefffffff_u32) |
                UInt32.new!(cidschgm.to_int).&(0x1_u32) << 28
      end

      unless discint.nil?
        value = (value & 0xdfffffff_u32) |
                UInt32.new!(discint.to_int).&(0x1_u32) << 29
      end

      unless srqim.nil?
        value = (value & 0xbfffffff_u32) |
                UInt32.new!(srqim.to_int).&(0x1_u32) << 30
      end

      unless wuim.nil?
        value = (value & 0x7fffffff_u32) |
                UInt32.new!(wuim.to_int).&(0x1_u32) << 31
      end

      self.class.new(value)
    end

    def self.set(
      *,
      mmism : Bool? = nil,
      otgint : Bool? = nil,
      sofm : Bool? = nil,
      rxflvlm : Bool? = nil,
      nptxfem : Bool? = nil,
      ginakeffm : Bool? = nil,
      gonakeffm : Bool? = nil,
      esuspm : Bool? = nil,
      usbsuspm : Bool? = nil,
      usbrst : Bool? = nil,
      enumdnem : Bool? = nil,
      isoodrpm : Bool? = nil,
      eopfm : Bool? = nil,
      epmism : Bool? = nil,
      iepint : Bool? = nil,
      oepint : Bool? = nil,
      iisoixfrm : Bool? = nil,
      ipxfrm_iisooxfrm : Bool? = nil,
      hcim : Bool? = nil,
      ptxfem : Bool? = nil,
      cidschgm : Bool? = nil,
      discint : Bool? = nil,
      srqim : Bool? = nil,
      wuim : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        mmism: mmism,
        otgint: otgint,
        sofm: sofm,
        rxflvlm: rxflvlm,
        nptxfem: nptxfem,
        ginakeffm: ginakeffm,
        gonakeffm: gonakeffm,
        esuspm: esuspm,
        usbsuspm: usbsuspm,
        usbrst: usbrst,
        enumdnem: enumdnem,
        isoodrpm: isoodrpm,
        eopfm: eopfm,
        epmism: epmism,
        iepint: iepint,
        oepint: oepint,
        iisoixfrm: iisoixfrm,
        ipxfrm_iisooxfrm: ipxfrm_iisooxfrm,
        hcim: hcim,
        ptxfem: ptxfem,
        cidschgm: cidschgm,
        discint: discint,
        srqim: srqim,
        wuim: wuim,
      )
    end
  end # struct

  # OTG_FS Receive status debug read(Device          mode)
  struct FS_GRXSTSR_Device
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

    # Endpoint number
    def epnum : UInt8
      UInt8.new!((@value >> 0) & 0xf_u32)
    end

    # Endpoint number
    def self.epnum : UInt8
      value.epnum
    end

    # Byte count
    def bcnt : UInt16
      UInt16.new!((@value >> 4) & 0x7ff_u32)
    end

    # Byte count
    def self.bcnt : UInt16
      value.bcnt
    end

    # Data PID
    def dpid : UInt8
      UInt8.new!((@value >> 15) & 0x3_u32)
    end

    # Data PID
    def self.dpid : UInt8
      value.dpid
    end

    # Packet status
    def pktsts : UInt8
      UInt8.new!((@value >> 17) & 0xf_u32)
    end

    # Packet status
    def self.pktsts : UInt8
      value.pktsts
    end

    # Frame number
    def frmnum : UInt8
      UInt8.new!((@value >> 21) & 0xf_u32)
    end

    # Frame number
    def self.frmnum : UInt8
      value.frmnum
    end
  end # struct

  # OTG_FS Receive status debug          read(Hostmode)
  struct FS_GRXSTSR_Host
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

    # Endpoint number
    def epnum : UInt8
      UInt8.new!((@value >> 0) & 0xf_u32)
    end

    # Endpoint number
    def self.epnum : UInt8
      value.epnum
    end

    # Byte count
    def bcnt : UInt16
      UInt16.new!((@value >> 4) & 0x7ff_u32)
    end

    # Byte count
    def self.bcnt : UInt16
      value.bcnt
    end

    # Data PID
    def dpid : UInt8
      UInt8.new!((@value >> 15) & 0x3_u32)
    end

    # Data PID
    def self.dpid : UInt8
      value.dpid
    end

    # Packet status
    def pktsts : UInt8
      UInt8.new!((@value >> 17) & 0xf_u32)
    end

    # Packet status
    def self.pktsts : UInt8
      value.pktsts
    end

    # Frame number
    def frmnum : UInt8
      UInt8.new!((@value >> 21) & 0xf_u32)
    end

    # Frame number
    def self.frmnum : UInt8
      value.frmnum
    end
  end # struct

  # OTG_FS Receive FIFO size register          (OTG_FS_GRXFSIZ)
  struct FS_GRXFSIZ
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
      new(0x200_u64)
    end

    def self.pointer : Pointer(UInt32)
      Pointer(UInt32).new(self.address)
    end

    def self.value : self
      value = self.pointer.load(volatile: true)
      new(value)
    end

    def self.value=(value : self) : self
      self.pointer.store(value.to_int, volatile: true)
      value
    end

    # RxFIFO depth
    def rxfd : UInt16
      UInt16.new!((@value >> 0) & 0xffff_u32)
    end

    # RxFIFO depth
    def self.rxfd : UInt16
      value.rxfd
    end

    # RxFIFO depth
    def self.rxfd=(value : UInt16) : UInt16
      self.set(rxfd: value)
      value
    end

    def copy_with(
      *,

      rxfd : UInt16? = nil
    ) : self
      value = @value

      unless rxfd.nil?
        value = (value & 0xffff0000_u32) |
                UInt32.new!(rxfd.to_int).&(0xffff_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      rxfd : UInt16? = nil
    ) : Nil
      self.value = self.value.copy_with(
        rxfd: rxfd,
      )
    end
  end # struct

  # OTG_FS non-periodic transmit FIFO size          register (Device mode)
  struct FS_GNPTXFSIZ_Device
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
      new(0x200_u64)
    end

    def self.pointer : Pointer(UInt32)
      Pointer(UInt32).new(self.address)
    end

    def self.value : self
      value = self.pointer.load(volatile: true)
      new(value)
    end

    def self.value=(value : self) : self
      self.pointer.store(value.to_int, volatile: true)
      value
    end

    # Endpoint 0 transmit RAM start              address
    def tx0_fsa : UInt16
      UInt16.new!((@value >> 0) & 0xffff_u32)
    end

    # Endpoint 0 transmit RAM start              address
    def self.tx0_fsa : UInt16
      value.tx0_fsa
    end

    # Endpoint 0 transmit RAM start              address
    def self.tx0_fsa=(value : UInt16) : UInt16
      self.set(tx0_fsa: value)
      value
    end

    # Endpoint 0 TxFIFO depth
    def tx0_fd : UInt16
      UInt16.new!((@value >> 16) & 0xffff_u32)
    end

    # Endpoint 0 TxFIFO depth
    def self.tx0_fd : UInt16
      value.tx0_fd
    end

    # Endpoint 0 TxFIFO depth
    def self.tx0_fd=(value : UInt16) : UInt16
      self.set(tx0_fd: value)
      value
    end

    def copy_with(
      *,

      tx0_fsa : UInt16? = nil,

      tx0_fd : UInt16? = nil
    ) : self
      value = @value

      unless tx0_fsa.nil?
        value = (value & 0xffff0000_u32) |
                UInt32.new!(tx0_fsa.to_int).&(0xffff_u32) << 0
      end

      unless tx0_fd.nil?
        value = (value & 0xffff_u32) |
                UInt32.new!(tx0_fd.to_int).&(0xffff_u32) << 16
      end

      self.class.new(value)
    end

    def self.set(
      *,
      tx0_fsa : UInt16? = nil,
      tx0_fd : UInt16? = nil
    ) : Nil
      self.value = self.value.copy_with(
        tx0_fsa: tx0_fsa,
        tx0_fd: tx0_fd,
      )
    end
  end # struct

  # OTG_FS non-periodic transmit FIFO size          register (Host mode)
  struct FS_GNPTXFSIZ_Host
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
      new(0x200_u64)
    end

    def self.pointer : Pointer(UInt32)
      Pointer(UInt32).new(self.address)
    end

    def self.value : self
      value = self.pointer.load(volatile: true)
      new(value)
    end

    def self.value=(value : self) : self
      self.pointer.store(value.to_int, volatile: true)
      value
    end

    # Non-periodic transmit RAM start              address
    def nptxfsa : UInt16
      UInt16.new!((@value >> 0) & 0xffff_u32)
    end

    # Non-periodic transmit RAM start              address
    def self.nptxfsa : UInt16
      value.nptxfsa
    end

    # Non-periodic transmit RAM start              address
    def self.nptxfsa=(value : UInt16) : UInt16
      self.set(nptxfsa: value)
      value
    end

    # Non-periodic TxFIFO depth
    def nptxfd : UInt16
      UInt16.new!((@value >> 16) & 0xffff_u32)
    end

    # Non-periodic TxFIFO depth
    def self.nptxfd : UInt16
      value.nptxfd
    end

    # Non-periodic TxFIFO depth
    def self.nptxfd=(value : UInt16) : UInt16
      self.set(nptxfd: value)
      value
    end

    def copy_with(
      *,

      nptxfsa : UInt16? = nil,

      nptxfd : UInt16? = nil
    ) : self
      value = @value

      unless nptxfsa.nil?
        value = (value & 0xffff0000_u32) |
                UInt32.new!(nptxfsa.to_int).&(0xffff_u32) << 0
      end

      unless nptxfd.nil?
        value = (value & 0xffff_u32) |
                UInt32.new!(nptxfd.to_int).&(0xffff_u32) << 16
      end

      self.class.new(value)
    end

    def self.set(
      *,
      nptxfsa : UInt16? = nil,
      nptxfd : UInt16? = nil
    ) : Nil
      self.value = self.value.copy_with(
        nptxfsa: nptxfsa,
        nptxfd: nptxfd,
      )
    end
  end # struct

  # OTG_FS non-periodic transmit FIFO/queue          status register (OTG_FS_GNPTXSTS)
  struct FS_GNPTXSTS
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
      new(0x80200_u64)
    end

    def self.pointer : Pointer(UInt32)
      Pointer(UInt32).new(self.address)
    end

    def self.value : self
      value = self.pointer.load(volatile: true)
      new(value)
    end

    def self.value=(value : self) : self
      self.pointer.store(value.to_int, volatile: true)
      value
    end

    # Non-periodic TxFIFO space              available
    def nptxfsav : UInt16
      UInt16.new!((@value >> 0) & 0xffff_u32)
    end

    # Non-periodic TxFIFO space              available
    def self.nptxfsav : UInt16
      value.nptxfsav
    end

    # Non-periodic transmit request queue              space available
    def nptqxsav : UInt8
      UInt8.new!((@value >> 16) & 0xff_u32)
    end

    # Non-periodic transmit request queue              space available
    def self.nptqxsav : UInt8
      value.nptqxsav
    end

    # Top of the non-periodic transmit request              queue
    def nptxqtop : UInt8
      UInt8.new!((@value >> 24) & 0x7f_u32)
    end

    # Top of the non-periodic transmit request              queue
    def self.nptxqtop : UInt8
      value.nptxqtop
    end
  end # struct

  # OTG_FS general core configuration register          (OTG_FS_GCCFG)
  struct FS_GCCFG
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

    # Power down
    def pwrdwn : Bool
      @value.bits_set?(0x10000_u32)
    end

    # Power down
    def self.pwrdwn : Bool
      value.pwrdwn
    end

    # Power down
    def self.pwrdwn=(value : Bool) : Bool
      self.set(pwrdwn: value)
      value
    end

    # Enable the VBUS sensing              device
    def vbusasen : Bool
      @value.bits_set?(0x40000_u32)
    end

    # Enable the VBUS sensing              device
    def self.vbusasen : Bool
      value.vbusasen
    end

    # Enable the VBUS sensing              device
    def self.vbusasen=(value : Bool) : Bool
      self.set(vbusasen: value)
      value
    end

    # Enable the VBUS sensing              device
    def vbusbsen : Bool
      @value.bits_set?(0x80000_u32)
    end

    # Enable the VBUS sensing              device
    def self.vbusbsen : Bool
      value.vbusbsen
    end

    # Enable the VBUS sensing              device
    def self.vbusbsen=(value : Bool) : Bool
      self.set(vbusbsen: value)
      value
    end

    # SOF output enable
    def sofouten : Bool
      @value.bits_set?(0x100000_u32)
    end

    # SOF output enable
    def self.sofouten : Bool
      value.sofouten
    end

    # SOF output enable
    def self.sofouten=(value : Bool) : Bool
      self.set(sofouten: value)
      value
    end

    def copy_with(
      *,

      pwrdwn : Bool? = nil,

      vbusasen : Bool? = nil,

      vbusbsen : Bool? = nil,

      sofouten : Bool? = nil
    ) : self
      value = @value

      unless pwrdwn.nil?
        value = (value & 0xfffeffff_u32) |
                UInt32.new!(pwrdwn.to_int).&(0x1_u32) << 16
      end

      unless vbusasen.nil?
        value = (value & 0xfffbffff_u32) |
                UInt32.new!(vbusasen.to_int).&(0x1_u32) << 18
      end

      unless vbusbsen.nil?
        value = (value & 0xfff7ffff_u32) |
                UInt32.new!(vbusbsen.to_int).&(0x1_u32) << 19
      end

      unless sofouten.nil?
        value = (value & 0xffefffff_u32) |
                UInt32.new!(sofouten.to_int).&(0x1_u32) << 20
      end

      self.class.new(value)
    end

    def self.set(
      *,
      pwrdwn : Bool? = nil,
      vbusasen : Bool? = nil,
      vbusbsen : Bool? = nil,
      sofouten : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        pwrdwn: pwrdwn,
        vbusasen: vbusasen,
        vbusbsen: vbusbsen,
        sofouten: sofouten,
      )
    end
  end # struct

  # core ID register
  struct FS_CID
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
      new(0x1000_u64)
    end

    def self.pointer : Pointer(UInt32)
      Pointer(UInt32).new(self.address)
    end

    def self.value : self
      value = self.pointer.load(volatile: true)
      new(value)
    end

    def self.value=(value : self) : self
      self.pointer.store(value.to_int, volatile: true)
      value
    end

    # Product ID field
    def product_id : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # Product ID field
    def self.product_id : UInt32
      value.product_id
    end

    # Product ID field
    def self.product_id=(value : UInt32) : UInt32
      self.set(product_id: value)
      value
    end

    def copy_with(
      *,

      product_id : UInt32? = nil
    ) : self
      value = @value

      unless product_id.nil?
        value = (value & 0xffffffff_u32) |
                UInt32.new!(product_id.to_int).&(0x0_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      product_id : UInt32? = nil
    ) : Nil
      self.value = self.value.copy_with(
        product_id: product_id,
      )
    end
  end # struct

  # OTG_FS Host periodic transmit FIFO size          register (OTG_FS_HPTXFSIZ)
  struct FS_HPTXFSIZ
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
      new(0x2000600_u64)
    end

    def self.pointer : Pointer(UInt32)
      Pointer(UInt32).new(self.address)
    end

    def self.value : self
      value = self.pointer.load(volatile: true)
      new(value)
    end

    def self.value=(value : self) : self
      self.pointer.store(value.to_int, volatile: true)
      value
    end

    # Host periodic TxFIFO start              address
    def ptxsa : UInt16
      UInt16.new!((@value >> 0) & 0xffff_u32)
    end

    # Host periodic TxFIFO start              address
    def self.ptxsa : UInt16
      value.ptxsa
    end

    # Host periodic TxFIFO start              address
    def self.ptxsa=(value : UInt16) : UInt16
      self.set(ptxsa: value)
      value
    end

    # Host periodic TxFIFO depth
    def ptxfsiz : UInt16
      UInt16.new!((@value >> 16) & 0xffff_u32)
    end

    # Host periodic TxFIFO depth
    def self.ptxfsiz : UInt16
      value.ptxfsiz
    end

    # Host periodic TxFIFO depth
    def self.ptxfsiz=(value : UInt16) : UInt16
      self.set(ptxfsiz: value)
      value
    end

    def copy_with(
      *,

      ptxsa : UInt16? = nil,

      ptxfsiz : UInt16? = nil
    ) : self
      value = @value

      unless ptxsa.nil?
        value = (value & 0xffff0000_u32) |
                UInt32.new!(ptxsa.to_int).&(0xffff_u32) << 0
      end

      unless ptxfsiz.nil?
        value = (value & 0xffff_u32) |
                UInt32.new!(ptxfsiz.to_int).&(0xffff_u32) << 16
      end

      self.class.new(value)
    end

    def self.set(
      *,
      ptxsa : UInt16? = nil,
      ptxfsiz : UInt16? = nil
    ) : Nil
      self.value = self.value.copy_with(
        ptxsa: ptxsa,
        ptxfsiz: ptxfsiz,
      )
    end
  end # struct

  # OTG_FS device IN endpoint transmit FIFO size          register (OTG_FS_DIEPTXF2)
  struct FS_DIEPTXF1
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
      new(0x2000400_u64)
    end

    def self.pointer : Pointer(UInt32)
      Pointer(UInt32).new(self.address)
    end

    def self.value : self
      value = self.pointer.load(volatile: true)
      new(value)
    end

    def self.value=(value : self) : self
      self.pointer.store(value.to_int, volatile: true)
      value
    end

    # IN endpoint FIFO2 transmit RAM start              address
    def ineptxsa : UInt16
      UInt16.new!((@value >> 0) & 0xffff_u32)
    end

    # IN endpoint FIFO2 transmit RAM start              address
    def self.ineptxsa : UInt16
      value.ineptxsa
    end

    # IN endpoint FIFO2 transmit RAM start              address
    def self.ineptxsa=(value : UInt16) : UInt16
      self.set(ineptxsa: value)
      value
    end

    # IN endpoint TxFIFO depth
    def ineptxfd : UInt16
      UInt16.new!((@value >> 16) & 0xffff_u32)
    end

    # IN endpoint TxFIFO depth
    def self.ineptxfd : UInt16
      value.ineptxfd
    end

    # IN endpoint TxFIFO depth
    def self.ineptxfd=(value : UInt16) : UInt16
      self.set(ineptxfd: value)
      value
    end

    def copy_with(
      *,

      ineptxsa : UInt16? = nil,

      ineptxfd : UInt16? = nil
    ) : self
      value = @value

      unless ineptxsa.nil?
        value = (value & 0xffff0000_u32) |
                UInt32.new!(ineptxsa.to_int).&(0xffff_u32) << 0
      end

      unless ineptxfd.nil?
        value = (value & 0xffff_u32) |
                UInt32.new!(ineptxfd.to_int).&(0xffff_u32) << 16
      end

      self.class.new(value)
    end

    def self.set(
      *,
      ineptxsa : UInt16? = nil,
      ineptxfd : UInt16? = nil
    ) : Nil
      self.value = self.value.copy_with(
        ineptxsa: ineptxsa,
        ineptxfd: ineptxfd,
      )
    end
  end # struct

  # OTG_FS device IN endpoint transmit FIFO size          register (OTG_FS_DIEPTXF3)
  struct FS_DIEPTXF2
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
      new(0x2000400_u64)
    end

    def self.pointer : Pointer(UInt32)
      Pointer(UInt32).new(self.address)
    end

    def self.value : self
      value = self.pointer.load(volatile: true)
      new(value)
    end

    def self.value=(value : self) : self
      self.pointer.store(value.to_int, volatile: true)
      value
    end

    # IN endpoint FIFO3 transmit RAM start              address
    def ineptxsa : UInt16
      UInt16.new!((@value >> 0) & 0xffff_u32)
    end

    # IN endpoint FIFO3 transmit RAM start              address
    def self.ineptxsa : UInt16
      value.ineptxsa
    end

    # IN endpoint FIFO3 transmit RAM start              address
    def self.ineptxsa=(value : UInt16) : UInt16
      self.set(ineptxsa: value)
      value
    end

    # IN endpoint TxFIFO depth
    def ineptxfd : UInt16
      UInt16.new!((@value >> 16) & 0xffff_u32)
    end

    # IN endpoint TxFIFO depth
    def self.ineptxfd : UInt16
      value.ineptxfd
    end

    # IN endpoint TxFIFO depth
    def self.ineptxfd=(value : UInt16) : UInt16
      self.set(ineptxfd: value)
      value
    end

    def copy_with(
      *,

      ineptxsa : UInt16? = nil,

      ineptxfd : UInt16? = nil
    ) : self
      value = @value

      unless ineptxsa.nil?
        value = (value & 0xffff0000_u32) |
                UInt32.new!(ineptxsa.to_int).&(0xffff_u32) << 0
      end

      unless ineptxfd.nil?
        value = (value & 0xffff_u32) |
                UInt32.new!(ineptxfd.to_int).&(0xffff_u32) << 16
      end

      self.class.new(value)
    end

    def self.set(
      *,
      ineptxsa : UInt16? = nil,
      ineptxfd : UInt16? = nil
    ) : Nil
      self.value = self.value.copy_with(
        ineptxsa: ineptxsa,
        ineptxfd: ineptxfd,
      )
    end
  end # struct

  # OTG_FS device IN endpoint transmit FIFO size          register (OTG_FS_DIEPTXF4)
  struct FS_DIEPTXF3
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
      new(0x2000400_u64)
    end

    def self.pointer : Pointer(UInt32)
      Pointer(UInt32).new(self.address)
    end

    def self.value : self
      value = self.pointer.load(volatile: true)
      new(value)
    end

    def self.value=(value : self) : self
      self.pointer.store(value.to_int, volatile: true)
      value
    end

    # IN endpoint FIFO4 transmit RAM start              address
    def ineptxsa : UInt16
      UInt16.new!((@value >> 0) & 0xffff_u32)
    end

    # IN endpoint FIFO4 transmit RAM start              address
    def self.ineptxsa : UInt16
      value.ineptxsa
    end

    # IN endpoint FIFO4 transmit RAM start              address
    def self.ineptxsa=(value : UInt16) : UInt16
      self.set(ineptxsa: value)
      value
    end

    # IN endpoint TxFIFO depth
    def ineptxfd : UInt16
      UInt16.new!((@value >> 16) & 0xffff_u32)
    end

    # IN endpoint TxFIFO depth
    def self.ineptxfd : UInt16
      value.ineptxfd
    end

    # IN endpoint TxFIFO depth
    def self.ineptxfd=(value : UInt16) : UInt16
      self.set(ineptxfd: value)
      value
    end

    def copy_with(
      *,

      ineptxsa : UInt16? = nil,

      ineptxfd : UInt16? = nil
    ) : self
      value = @value

      unless ineptxsa.nil?
        value = (value & 0xffff0000_u32) |
                UInt32.new!(ineptxsa.to_int).&(0xffff_u32) << 0
      end

      unless ineptxfd.nil?
        value = (value & 0xffff_u32) |
                UInt32.new!(ineptxfd.to_int).&(0xffff_u32) << 16
      end

      self.class.new(value)
    end

    def self.set(
      *,
      ineptxsa : UInt16? = nil,
      ineptxfd : UInt16? = nil
    ) : Nil
      self.value = self.value.copy_with(
        ineptxsa: ineptxsa,
        ineptxfd: ineptxfd,
      )
    end
  end # struct

end
