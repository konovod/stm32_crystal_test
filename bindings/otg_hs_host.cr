# USB on the go high speed
module OTG_HS_HOST
  VERSION      = nil
  BASE_ADDRESS = 0x40040400_u64

  # OTG_HS host configuration          register
  struct OTG_HS_HCFG
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

    # FS/LS PHY clock select
    def fslspcs : UInt8
      UInt8.new!((@value >> 0) & 0x3_u32)
    end

    # FS/LS PHY clock select
    def self.fslspcs : UInt8
      value.fslspcs
    end

    # FS/LS PHY clock select
    def self.fslspcs=(value : UInt8) : UInt8
      self.set(fslspcs: value)
      value
    end

    # FS- and LS-only support
    def fslss : Bool
      @value.bits_set?(0x4_u32)
    end

    # FS- and LS-only support
    def self.fslss : Bool
      value.fslss
    end

    def copy_with(
      *,

      fslspcs : UInt8? = nil
    ) : self
      value = @value

      unless fslspcs.nil?
        value = (value & 0xfffffffc_u32) |
                UInt32.new!(fslspcs.to_int).&(0x3_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      fslspcs : UInt8? = nil
    ) : Nil
      self.value = self.value.copy_with(
        fslspcs: fslspcs,
      )
    end
  end # struct

  # OTG_HS Host frame interval          register
  struct OTG_HS_HFIR
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
      new(0xea60_u64)
    end

    def self.pointer : Pointer(UInt32)
      Pointer(UInt32).new(self.address)
    end

    def self.value : self
      value = self.pointer.load(volatile: true)
      new(value)
    end

    def self.value=(value : self) : self
      self.pointer.store(value.to_int, volatile: true)
      value
    end

    # Frame interval
    def frivl : UInt16
      UInt16.new!((@value >> 0) & 0xffff_u32)
    end

    # Frame interval
    def self.frivl : UInt16
      value.frivl
    end

    # Frame interval
    def self.frivl=(value : UInt16) : UInt16
      self.set(frivl: value)
      value
    end

    def copy_with(
      *,

      frivl : UInt16? = nil
    ) : self
      value = @value

      unless frivl.nil?
        value = (value & 0xffff0000_u32) |
                UInt32.new!(frivl.to_int).&(0xffff_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      frivl : UInt16? = nil
    ) : Nil
      self.value = self.value.copy_with(
        frivl: frivl,
      )
    end
  end # struct

  # OTG_HS host frame number/frame time          remaining register
  struct OTG_HS_HFNUM
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
      new(0x3fff_u64)
    end

    def self.pointer : Pointer(UInt32)
      Pointer(UInt32).new(self.address)
    end

    def self.value : self
      value = self.pointer.load(volatile: true)
      new(value)
    end

    def self.value=(value : self) : self
      self.pointer.store(value.to_int, volatile: true)
      value
    end

    # Frame number
    def frnum : UInt16
      UInt16.new!((@value >> 0) & 0xffff_u32)
    end

    # Frame number
    def self.frnum : UInt16
      value.frnum
    end

    # Frame time remaining
    def ftrem : UInt16
      UInt16.new!((@value >> 16) & 0xffff_u32)
    end

    # Frame time remaining
    def self.ftrem : UInt16
      value.ftrem
    end
  end # struct

  # OTG_HS_Host periodic transmit FIFO/queue          status register
  struct OTG_HS_HPTXSTS
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
      new(0x80100_u64)
    end

    def self.pointer : Pointer(UInt32)
      Pointer(UInt32).new(self.address)
    end

    def self.value : self
      value = self.pointer.load(volatile: true)
      new(value)
    end

    def self.value=(value : self) : self
      self.pointer.store(value.to_int, volatile: true)
      value
    end

    # Periodic transmit data FIFO space              available
    def ptxfsavl : UInt16
      UInt16.new!((@value >> 0) & 0xffff_u32)
    end

    # Periodic transmit data FIFO space              available
    def self.ptxfsavl : UInt16
      value.ptxfsavl
    end

    # Periodic transmit data FIFO space              available
    def self.ptxfsavl=(value : UInt16) : UInt16
      self.set(ptxfsavl: value)
      value
    end

    # Periodic transmit request queue space              available
    def ptxqsav : UInt8
      UInt8.new!((@value >> 16) & 0xff_u32)
    end

    # Periodic transmit request queue space              available
    def self.ptxqsav : UInt8
      value.ptxqsav
    end

    # Top of the periodic transmit request              queue
    def ptxqtop : UInt8
      UInt8.new!((@value >> 24) & 0xff_u32)
    end

    # Top of the periodic transmit request              queue
    def self.ptxqtop : UInt8
      value.ptxqtop
    end

    def copy_with(
      *,

      ptxfsavl : UInt16? = nil
    ) : self
      value = @value

      unless ptxfsavl.nil?
        value = (value & 0xffff0000_u32) |
                UInt32.new!(ptxfsavl.to_int).&(0xffff_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      ptxfsavl : UInt16? = nil
    ) : Nil
      self.value = self.value.copy_with(
        ptxfsavl: ptxfsavl,
      )
    end
  end # struct

  # OTG_HS Host all channels interrupt          register
  struct OTG_HS_HAINT
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

    # Channel interrupts
    def haint : UInt16
      UInt16.new!((@value >> 0) & 0xffff_u32)
    end

    # Channel interrupts
    def self.haint : UInt16
      value.haint
    end
  end # struct

  # OTG_HS host all channels interrupt mask          register
  struct OTG_HS_HAINTMSK
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

    # Channel interrupt mask
    def haintm : UInt16
      UInt16.new!((@value >> 0) & 0xffff_u32)
    end

    # Channel interrupt mask
    def self.haintm : UInt16
      value.haintm
    end

    # Channel interrupt mask
    def self.haintm=(value : UInt16) : UInt16
      self.set(haintm: value)
      value
    end

    def copy_with(
      *,

      haintm : UInt16? = nil
    ) : self
      value = @value

      unless haintm.nil?
        value = (value & 0xffff0000_u32) |
                UInt32.new!(haintm.to_int).&(0xffff_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      haintm : UInt16? = nil
    ) : Nil
      self.value = self.value.copy_with(
        haintm: haintm,
      )
    end
  end # struct

  # OTG_HS host port control and status          register
  struct OTG_HS_HPRT
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

    # Port connect status
    def pcsts : Bool
      @value.bits_set?(0x1_u32)
    end

    # Port connect status
    def self.pcsts : Bool
      value.pcsts
    end

    # Port connect detected
    def pcdet : Bool
      @value.bits_set?(0x2_u32)
    end

    # Port connect detected
    def self.pcdet : Bool
      value.pcdet
    end

    # Port connect detected
    def self.pcdet=(value : Bool) : Bool
      self.set(pcdet: value)
      value
    end

    # Port enable
    def pena : Bool
      @value.bits_set?(0x4_u32)
    end

    # Port enable
    def self.pena : Bool
      value.pena
    end

    # Port enable
    def self.pena=(value : Bool) : Bool
      self.set(pena: value)
      value
    end

    # Port enable/disable change
    def penchng : Bool
      @value.bits_set?(0x8_u32)
    end

    # Port enable/disable change
    def self.penchng : Bool
      value.penchng
    end

    # Port enable/disable change
    def self.penchng=(value : Bool) : Bool
      self.set(penchng: value)
      value
    end

    # Port overcurrent active
    def poca : Bool
      @value.bits_set?(0x10_u32)
    end

    # Port overcurrent active
    def self.poca : Bool
      value.poca
    end

    # Port overcurrent change
    def pocchng : Bool
      @value.bits_set?(0x20_u32)
    end

    # Port overcurrent change
    def self.pocchng : Bool
      value.pocchng
    end

    # Port overcurrent change
    def self.pocchng=(value : Bool) : Bool
      self.set(pocchng: value)
      value
    end

    # Port resume
    def pres : Bool
      @value.bits_set?(0x40_u32)
    end

    # Port resume
    def self.pres : Bool
      value.pres
    end

    # Port resume
    def self.pres=(value : Bool) : Bool
      self.set(pres: value)
      value
    end

    # Port suspend
    def psusp : Bool
      @value.bits_set?(0x80_u32)
    end

    # Port suspend
    def self.psusp : Bool
      value.psusp
    end

    # Port suspend
    def self.psusp=(value : Bool) : Bool
      self.set(psusp: value)
      value
    end

    # Port reset
    def prst : Bool
      @value.bits_set?(0x100_u32)
    end

    # Port reset
    def self.prst : Bool
      value.prst
    end

    # Port reset
    def self.prst=(value : Bool) : Bool
      self.set(prst: value)
      value
    end

    # Port line status
    def plsts : UInt8
      UInt8.new!((@value >> 10) & 0x3_u32)
    end

    # Port line status
    def self.plsts : UInt8
      value.plsts
    end

    # Port power
    def ppwr : Bool
      @value.bits_set?(0x1000_u32)
    end

    # Port power
    def self.ppwr : Bool
      value.ppwr
    end

    # Port power
    def self.ppwr=(value : Bool) : Bool
      self.set(ppwr: value)
      value
    end

    # Port test control
    def ptctl : UInt8
      UInt8.new!((@value >> 13) & 0xf_u32)
    end

    # Port test control
    def self.ptctl : UInt8
      value.ptctl
    end

    # Port test control
    def self.ptctl=(value : UInt8) : UInt8
      self.set(ptctl: value)
      value
    end

    # Port speed
    def pspd : UInt8
      UInt8.new!((@value >> 17) & 0x3_u32)
    end

    # Port speed
    def self.pspd : UInt8
      value.pspd
    end

    def copy_with(
      *,

      pcdet : Bool? = nil,

      pena : Bool? = nil,

      penchng : Bool? = nil,

      pocchng : Bool? = nil,

      pres : Bool? = nil,

      psusp : Bool? = nil,

      prst : Bool? = nil,

      ppwr : Bool? = nil,

      ptctl : UInt8? = nil
    ) : self
      value = @value

      unless pcdet.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(pcdet.to_int).&(0x1_u32) << 1
      end

      unless pena.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(pena.to_int).&(0x1_u32) << 2
      end

      unless penchng.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(penchng.to_int).&(0x1_u32) << 3
      end

      unless pocchng.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(pocchng.to_int).&(0x1_u32) << 5
      end

      unless pres.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(pres.to_int).&(0x1_u32) << 6
      end

      unless psusp.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(psusp.to_int).&(0x1_u32) << 7
      end

      unless prst.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(prst.to_int).&(0x1_u32) << 8
      end

      unless ppwr.nil?
        value = (value & 0xffffefff_u32) |
                UInt32.new!(ppwr.to_int).&(0x1_u32) << 12
      end

      unless ptctl.nil?
        value = (value & 0xfffe1fff_u32) |
                UInt32.new!(ptctl.to_int).&(0xf_u32) << 13
      end

      self.class.new(value)
    end

    def self.set(
      *,
      pcdet : Bool? = nil,
      pena : Bool? = nil,
      penchng : Bool? = nil,
      pocchng : Bool? = nil,
      pres : Bool? = nil,
      psusp : Bool? = nil,
      prst : Bool? = nil,
      ppwr : Bool? = nil,
      ptctl : UInt8? = nil
    ) : Nil
      self.value = self.value.copy_with(
        pcdet: pcdet,
        pena: pena,
        penchng: penchng,
        pocchng: pocchng,
        pres: pres,
        psusp: psusp,
        prst: prst,
        ppwr: ppwr,
        ptctl: ptctl,
      )
    end
  end # struct

  # OTG_HS host channel-0 characteristics          register
  struct OTG_HS_HCCHAR0
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

    # Maximum packet size
    def mpsiz : UInt16
      UInt16.new!((@value >> 0) & 0x7ff_u32)
    end

    # Maximum packet size
    def self.mpsiz : UInt16
      value.mpsiz
    end

    # Maximum packet size
    def self.mpsiz=(value : UInt16) : UInt16
      self.set(mpsiz: value)
      value
    end

    # Endpoint number
    def epnum : UInt8
      UInt8.new!((@value >> 11) & 0xf_u32)
    end

    # Endpoint number
    def self.epnum : UInt8
      value.epnum
    end

    # Endpoint number
    def self.epnum=(value : UInt8) : UInt8
      self.set(epnum: value)
      value
    end

    # Endpoint direction
    def epdir : Bool
      @value.bits_set?(0x8000_u32)
    end

    # Endpoint direction
    def self.epdir : Bool
      value.epdir
    end

    # Endpoint direction
    def self.epdir=(value : Bool) : Bool
      self.set(epdir: value)
      value
    end

    # Low-speed device
    def lsdev : Bool
      @value.bits_set?(0x20000_u32)
    end

    # Low-speed device
    def self.lsdev : Bool
      value.lsdev
    end

    # Low-speed device
    def self.lsdev=(value : Bool) : Bool
      self.set(lsdev: value)
      value
    end

    # Endpoint type
    def eptyp : UInt8
      UInt8.new!((@value >> 18) & 0x3_u32)
    end

    # Endpoint type
    def self.eptyp : UInt8
      value.eptyp
    end

    # Endpoint type
    def self.eptyp=(value : UInt8) : UInt8
      self.set(eptyp: value)
      value
    end

    # Multi Count (MC) / Error Count              (EC)
    def mc : UInt8
      UInt8.new!((@value >> 20) & 0x3_u32)
    end

    # Multi Count (MC) / Error Count              (EC)
    def self.mc : UInt8
      value.mc
    end

    # Multi Count (MC) / Error Count              (EC)
    def self.mc=(value : UInt8) : UInt8
      self.set(mc: value)
      value
    end

    # Device address
    def dad : UInt8
      UInt8.new!((@value >> 22) & 0x7f_u32)
    end

    # Device address
    def self.dad : UInt8
      value.dad
    end

    # Device address
    def self.dad=(value : UInt8) : UInt8
      self.set(dad: value)
      value
    end

    # Odd frame
    def oddfrm : Bool
      @value.bits_set?(0x20000000_u32)
    end

    # Odd frame
    def self.oddfrm : Bool
      value.oddfrm
    end

    # Odd frame
    def self.oddfrm=(value : Bool) : Bool
      self.set(oddfrm: value)
      value
    end

    # Channel disable
    def chdis : Bool
      @value.bits_set?(0x40000000_u32)
    end

    # Channel disable
    def self.chdis : Bool
      value.chdis
    end

    # Channel disable
    def self.chdis=(value : Bool) : Bool
      self.set(chdis: value)
      value
    end

    # Channel enable
    def chena : Bool
      @value.bits_set?(0x80000000_u32)
    end

    # Channel enable
    def self.chena : Bool
      value.chena
    end

    # Channel enable
    def self.chena=(value : Bool) : Bool
      self.set(chena: value)
      value
    end

    def copy_with(
      *,

      mpsiz : UInt16? = nil,

      epnum : UInt8? = nil,

      epdir : Bool? = nil,

      lsdev : Bool? = nil,

      eptyp : UInt8? = nil,

      mc : UInt8? = nil,

      dad : UInt8? = nil,

      oddfrm : Bool? = nil,

      chdis : Bool? = nil,

      chena : Bool? = nil
    ) : self
      value = @value

      unless mpsiz.nil?
        value = (value & 0xfffff800_u32) |
                UInt32.new!(mpsiz.to_int).&(0x7ff_u32) << 0
      end

      unless epnum.nil?
        value = (value & 0xffff87ff_u32) |
                UInt32.new!(epnum.to_int).&(0xf_u32) << 11
      end

      unless epdir.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(epdir.to_int).&(0x1_u32) << 15
      end

      unless lsdev.nil?
        value = (value & 0xfffdffff_u32) |
                UInt32.new!(lsdev.to_int).&(0x1_u32) << 17
      end

      unless eptyp.nil?
        value = (value & 0xfff3ffff_u32) |
                UInt32.new!(eptyp.to_int).&(0x3_u32) << 18
      end

      unless mc.nil?
        value = (value & 0xffcfffff_u32) |
                UInt32.new!(mc.to_int).&(0x3_u32) << 20
      end

      unless dad.nil?
        value = (value & 0xe03fffff_u32) |
                UInt32.new!(dad.to_int).&(0x7f_u32) << 22
      end

      unless oddfrm.nil?
        value = (value & 0xdfffffff_u32) |
                UInt32.new!(oddfrm.to_int).&(0x1_u32) << 29
      end

      unless chdis.nil?
        value = (value & 0xbfffffff_u32) |
                UInt32.new!(chdis.to_int).&(0x1_u32) << 30
      end

      unless chena.nil?
        value = (value & 0x7fffffff_u32) |
                UInt32.new!(chena.to_int).&(0x1_u32) << 31
      end

      self.class.new(value)
    end

    def self.set(
      *,
      mpsiz : UInt16? = nil,
      epnum : UInt8? = nil,
      epdir : Bool? = nil,
      lsdev : Bool? = nil,
      eptyp : UInt8? = nil,
      mc : UInt8? = nil,
      dad : UInt8? = nil,
      oddfrm : Bool? = nil,
      chdis : Bool? = nil,
      chena : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        mpsiz: mpsiz,
        epnum: epnum,
        epdir: epdir,
        lsdev: lsdev,
        eptyp: eptyp,
        mc: mc,
        dad: dad,
        oddfrm: oddfrm,
        chdis: chdis,
        chena: chena,
      )
    end
  end # struct

  # OTG_HS host channel-1 characteristics          register
  struct OTG_HS_HCCHAR1
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

    # Maximum packet size
    def mpsiz : UInt16
      UInt16.new!((@value >> 0) & 0x7ff_u32)
    end

    # Maximum packet size
    def self.mpsiz : UInt16
      value.mpsiz
    end

    # Maximum packet size
    def self.mpsiz=(value : UInt16) : UInt16
      self.set(mpsiz: value)
      value
    end

    # Endpoint number
    def epnum : UInt8
      UInt8.new!((@value >> 11) & 0xf_u32)
    end

    # Endpoint number
    def self.epnum : UInt8
      value.epnum
    end

    # Endpoint number
    def self.epnum=(value : UInt8) : UInt8
      self.set(epnum: value)
      value
    end

    # Endpoint direction
    def epdir : Bool
      @value.bits_set?(0x8000_u32)
    end

    # Endpoint direction
    def self.epdir : Bool
      value.epdir
    end

    # Endpoint direction
    def self.epdir=(value : Bool) : Bool
      self.set(epdir: value)
      value
    end

    # Low-speed device
    def lsdev : Bool
      @value.bits_set?(0x20000_u32)
    end

    # Low-speed device
    def self.lsdev : Bool
      value.lsdev
    end

    # Low-speed device
    def self.lsdev=(value : Bool) : Bool
      self.set(lsdev: value)
      value
    end

    # Endpoint type
    def eptyp : UInt8
      UInt8.new!((@value >> 18) & 0x3_u32)
    end

    # Endpoint type
    def self.eptyp : UInt8
      value.eptyp
    end

    # Endpoint type
    def self.eptyp=(value : UInt8) : UInt8
      self.set(eptyp: value)
      value
    end

    # Multi Count (MC) / Error Count              (EC)
    def mc : UInt8
      UInt8.new!((@value >> 20) & 0x3_u32)
    end

    # Multi Count (MC) / Error Count              (EC)
    def self.mc : UInt8
      value.mc
    end

    # Multi Count (MC) / Error Count              (EC)
    def self.mc=(value : UInt8) : UInt8
      self.set(mc: value)
      value
    end

    # Device address
    def dad : UInt8
      UInt8.new!((@value >> 22) & 0x7f_u32)
    end

    # Device address
    def self.dad : UInt8
      value.dad
    end

    # Device address
    def self.dad=(value : UInt8) : UInt8
      self.set(dad: value)
      value
    end

    # Odd frame
    def oddfrm : Bool
      @value.bits_set?(0x20000000_u32)
    end

    # Odd frame
    def self.oddfrm : Bool
      value.oddfrm
    end

    # Odd frame
    def self.oddfrm=(value : Bool) : Bool
      self.set(oddfrm: value)
      value
    end

    # Channel disable
    def chdis : Bool
      @value.bits_set?(0x40000000_u32)
    end

    # Channel disable
    def self.chdis : Bool
      value.chdis
    end

    # Channel disable
    def self.chdis=(value : Bool) : Bool
      self.set(chdis: value)
      value
    end

    # Channel enable
    def chena : Bool
      @value.bits_set?(0x80000000_u32)
    end

    # Channel enable
    def self.chena : Bool
      value.chena
    end

    # Channel enable
    def self.chena=(value : Bool) : Bool
      self.set(chena: value)
      value
    end

    def copy_with(
      *,

      mpsiz : UInt16? = nil,

      epnum : UInt8? = nil,

      epdir : Bool? = nil,

      lsdev : Bool? = nil,

      eptyp : UInt8? = nil,

      mc : UInt8? = nil,

      dad : UInt8? = nil,

      oddfrm : Bool? = nil,

      chdis : Bool? = nil,

      chena : Bool? = nil
    ) : self
      value = @value

      unless mpsiz.nil?
        value = (value & 0xfffff800_u32) |
                UInt32.new!(mpsiz.to_int).&(0x7ff_u32) << 0
      end

      unless epnum.nil?
        value = (value & 0xffff87ff_u32) |
                UInt32.new!(epnum.to_int).&(0xf_u32) << 11
      end

      unless epdir.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(epdir.to_int).&(0x1_u32) << 15
      end

      unless lsdev.nil?
        value = (value & 0xfffdffff_u32) |
                UInt32.new!(lsdev.to_int).&(0x1_u32) << 17
      end

      unless eptyp.nil?
        value = (value & 0xfff3ffff_u32) |
                UInt32.new!(eptyp.to_int).&(0x3_u32) << 18
      end

      unless mc.nil?
        value = (value & 0xffcfffff_u32) |
                UInt32.new!(mc.to_int).&(0x3_u32) << 20
      end

      unless dad.nil?
        value = (value & 0xe03fffff_u32) |
                UInt32.new!(dad.to_int).&(0x7f_u32) << 22
      end

      unless oddfrm.nil?
        value = (value & 0xdfffffff_u32) |
                UInt32.new!(oddfrm.to_int).&(0x1_u32) << 29
      end

      unless chdis.nil?
        value = (value & 0xbfffffff_u32) |
                UInt32.new!(chdis.to_int).&(0x1_u32) << 30
      end

      unless chena.nil?
        value = (value & 0x7fffffff_u32) |
                UInt32.new!(chena.to_int).&(0x1_u32) << 31
      end

      self.class.new(value)
    end

    def self.set(
      *,
      mpsiz : UInt16? = nil,
      epnum : UInt8? = nil,
      epdir : Bool? = nil,
      lsdev : Bool? = nil,
      eptyp : UInt8? = nil,
      mc : UInt8? = nil,
      dad : UInt8? = nil,
      oddfrm : Bool? = nil,
      chdis : Bool? = nil,
      chena : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        mpsiz: mpsiz,
        epnum: epnum,
        epdir: epdir,
        lsdev: lsdev,
        eptyp: eptyp,
        mc: mc,
        dad: dad,
        oddfrm: oddfrm,
        chdis: chdis,
        chena: chena,
      )
    end
  end # struct

  # OTG_HS host channel-2 characteristics          register
  struct OTG_HS_HCCHAR2
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

    # Maximum packet size
    def mpsiz : UInt16
      UInt16.new!((@value >> 0) & 0x7ff_u32)
    end

    # Maximum packet size
    def self.mpsiz : UInt16
      value.mpsiz
    end

    # Maximum packet size
    def self.mpsiz=(value : UInt16) : UInt16
      self.set(mpsiz: value)
      value
    end

    # Endpoint number
    def epnum : UInt8
      UInt8.new!((@value >> 11) & 0xf_u32)
    end

    # Endpoint number
    def self.epnum : UInt8
      value.epnum
    end

    # Endpoint number
    def self.epnum=(value : UInt8) : UInt8
      self.set(epnum: value)
      value
    end

    # Endpoint direction
    def epdir : Bool
      @value.bits_set?(0x8000_u32)
    end

    # Endpoint direction
    def self.epdir : Bool
      value.epdir
    end

    # Endpoint direction
    def self.epdir=(value : Bool) : Bool
      self.set(epdir: value)
      value
    end

    # Low-speed device
    def lsdev : Bool
      @value.bits_set?(0x20000_u32)
    end

    # Low-speed device
    def self.lsdev : Bool
      value.lsdev
    end

    # Low-speed device
    def self.lsdev=(value : Bool) : Bool
      self.set(lsdev: value)
      value
    end

    # Endpoint type
    def eptyp : UInt8
      UInt8.new!((@value >> 18) & 0x3_u32)
    end

    # Endpoint type
    def self.eptyp : UInt8
      value.eptyp
    end

    # Endpoint type
    def self.eptyp=(value : UInt8) : UInt8
      self.set(eptyp: value)
      value
    end

    # Multi Count (MC) / Error Count              (EC)
    def mc : UInt8
      UInt8.new!((@value >> 20) & 0x3_u32)
    end

    # Multi Count (MC) / Error Count              (EC)
    def self.mc : UInt8
      value.mc
    end

    # Multi Count (MC) / Error Count              (EC)
    def self.mc=(value : UInt8) : UInt8
      self.set(mc: value)
      value
    end

    # Device address
    def dad : UInt8
      UInt8.new!((@value >> 22) & 0x7f_u32)
    end

    # Device address
    def self.dad : UInt8
      value.dad
    end

    # Device address
    def self.dad=(value : UInt8) : UInt8
      self.set(dad: value)
      value
    end

    # Odd frame
    def oddfrm : Bool
      @value.bits_set?(0x20000000_u32)
    end

    # Odd frame
    def self.oddfrm : Bool
      value.oddfrm
    end

    # Odd frame
    def self.oddfrm=(value : Bool) : Bool
      self.set(oddfrm: value)
      value
    end

    # Channel disable
    def chdis : Bool
      @value.bits_set?(0x40000000_u32)
    end

    # Channel disable
    def self.chdis : Bool
      value.chdis
    end

    # Channel disable
    def self.chdis=(value : Bool) : Bool
      self.set(chdis: value)
      value
    end

    # Channel enable
    def chena : Bool
      @value.bits_set?(0x80000000_u32)
    end

    # Channel enable
    def self.chena : Bool
      value.chena
    end

    # Channel enable
    def self.chena=(value : Bool) : Bool
      self.set(chena: value)
      value
    end

    def copy_with(
      *,

      mpsiz : UInt16? = nil,

      epnum : UInt8? = nil,

      epdir : Bool? = nil,

      lsdev : Bool? = nil,

      eptyp : UInt8? = nil,

      mc : UInt8? = nil,

      dad : UInt8? = nil,

      oddfrm : Bool? = nil,

      chdis : Bool? = nil,

      chena : Bool? = nil
    ) : self
      value = @value

      unless mpsiz.nil?
        value = (value & 0xfffff800_u32) |
                UInt32.new!(mpsiz.to_int).&(0x7ff_u32) << 0
      end

      unless epnum.nil?
        value = (value & 0xffff87ff_u32) |
                UInt32.new!(epnum.to_int).&(0xf_u32) << 11
      end

      unless epdir.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(epdir.to_int).&(0x1_u32) << 15
      end

      unless lsdev.nil?
        value = (value & 0xfffdffff_u32) |
                UInt32.new!(lsdev.to_int).&(0x1_u32) << 17
      end

      unless eptyp.nil?
        value = (value & 0xfff3ffff_u32) |
                UInt32.new!(eptyp.to_int).&(0x3_u32) << 18
      end

      unless mc.nil?
        value = (value & 0xffcfffff_u32) |
                UInt32.new!(mc.to_int).&(0x3_u32) << 20
      end

      unless dad.nil?
        value = (value & 0xe03fffff_u32) |
                UInt32.new!(dad.to_int).&(0x7f_u32) << 22
      end

      unless oddfrm.nil?
        value = (value & 0xdfffffff_u32) |
                UInt32.new!(oddfrm.to_int).&(0x1_u32) << 29
      end

      unless chdis.nil?
        value = (value & 0xbfffffff_u32) |
                UInt32.new!(chdis.to_int).&(0x1_u32) << 30
      end

      unless chena.nil?
        value = (value & 0x7fffffff_u32) |
                UInt32.new!(chena.to_int).&(0x1_u32) << 31
      end

      self.class.new(value)
    end

    def self.set(
      *,
      mpsiz : UInt16? = nil,
      epnum : UInt8? = nil,
      epdir : Bool? = nil,
      lsdev : Bool? = nil,
      eptyp : UInt8? = nil,
      mc : UInt8? = nil,
      dad : UInt8? = nil,
      oddfrm : Bool? = nil,
      chdis : Bool? = nil,
      chena : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        mpsiz: mpsiz,
        epnum: epnum,
        epdir: epdir,
        lsdev: lsdev,
        eptyp: eptyp,
        mc: mc,
        dad: dad,
        oddfrm: oddfrm,
        chdis: chdis,
        chena: chena,
      )
    end
  end # struct

  # OTG_HS host channel-3 characteristics          register
  struct OTG_HS_HCCHAR3
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

    # Maximum packet size
    def mpsiz : UInt16
      UInt16.new!((@value >> 0) & 0x7ff_u32)
    end

    # Maximum packet size
    def self.mpsiz : UInt16
      value.mpsiz
    end

    # Maximum packet size
    def self.mpsiz=(value : UInt16) : UInt16
      self.set(mpsiz: value)
      value
    end

    # Endpoint number
    def epnum : UInt8
      UInt8.new!((@value >> 11) & 0xf_u32)
    end

    # Endpoint number
    def self.epnum : UInt8
      value.epnum
    end

    # Endpoint number
    def self.epnum=(value : UInt8) : UInt8
      self.set(epnum: value)
      value
    end

    # Endpoint direction
    def epdir : Bool
      @value.bits_set?(0x8000_u32)
    end

    # Endpoint direction
    def self.epdir : Bool
      value.epdir
    end

    # Endpoint direction
    def self.epdir=(value : Bool) : Bool
      self.set(epdir: value)
      value
    end

    # Low-speed device
    def lsdev : Bool
      @value.bits_set?(0x20000_u32)
    end

    # Low-speed device
    def self.lsdev : Bool
      value.lsdev
    end

    # Low-speed device
    def self.lsdev=(value : Bool) : Bool
      self.set(lsdev: value)
      value
    end

    # Endpoint type
    def eptyp : UInt8
      UInt8.new!((@value >> 18) & 0x3_u32)
    end

    # Endpoint type
    def self.eptyp : UInt8
      value.eptyp
    end

    # Endpoint type
    def self.eptyp=(value : UInt8) : UInt8
      self.set(eptyp: value)
      value
    end

    # Multi Count (MC) / Error Count              (EC)
    def mc : UInt8
      UInt8.new!((@value >> 20) & 0x3_u32)
    end

    # Multi Count (MC) / Error Count              (EC)
    def self.mc : UInt8
      value.mc
    end

    # Multi Count (MC) / Error Count              (EC)
    def self.mc=(value : UInt8) : UInt8
      self.set(mc: value)
      value
    end

    # Device address
    def dad : UInt8
      UInt8.new!((@value >> 22) & 0x7f_u32)
    end

    # Device address
    def self.dad : UInt8
      value.dad
    end

    # Device address
    def self.dad=(value : UInt8) : UInt8
      self.set(dad: value)
      value
    end

    # Odd frame
    def oddfrm : Bool
      @value.bits_set?(0x20000000_u32)
    end

    # Odd frame
    def self.oddfrm : Bool
      value.oddfrm
    end

    # Odd frame
    def self.oddfrm=(value : Bool) : Bool
      self.set(oddfrm: value)
      value
    end

    # Channel disable
    def chdis : Bool
      @value.bits_set?(0x40000000_u32)
    end

    # Channel disable
    def self.chdis : Bool
      value.chdis
    end

    # Channel disable
    def self.chdis=(value : Bool) : Bool
      self.set(chdis: value)
      value
    end

    # Channel enable
    def chena : Bool
      @value.bits_set?(0x80000000_u32)
    end

    # Channel enable
    def self.chena : Bool
      value.chena
    end

    # Channel enable
    def self.chena=(value : Bool) : Bool
      self.set(chena: value)
      value
    end

    def copy_with(
      *,

      mpsiz : UInt16? = nil,

      epnum : UInt8? = nil,

      epdir : Bool? = nil,

      lsdev : Bool? = nil,

      eptyp : UInt8? = nil,

      mc : UInt8? = nil,

      dad : UInt8? = nil,

      oddfrm : Bool? = nil,

      chdis : Bool? = nil,

      chena : Bool? = nil
    ) : self
      value = @value

      unless mpsiz.nil?
        value = (value & 0xfffff800_u32) |
                UInt32.new!(mpsiz.to_int).&(0x7ff_u32) << 0
      end

      unless epnum.nil?
        value = (value & 0xffff87ff_u32) |
                UInt32.new!(epnum.to_int).&(0xf_u32) << 11
      end

      unless epdir.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(epdir.to_int).&(0x1_u32) << 15
      end

      unless lsdev.nil?
        value = (value & 0xfffdffff_u32) |
                UInt32.new!(lsdev.to_int).&(0x1_u32) << 17
      end

      unless eptyp.nil?
        value = (value & 0xfff3ffff_u32) |
                UInt32.new!(eptyp.to_int).&(0x3_u32) << 18
      end

      unless mc.nil?
        value = (value & 0xffcfffff_u32) |
                UInt32.new!(mc.to_int).&(0x3_u32) << 20
      end

      unless dad.nil?
        value = (value & 0xe03fffff_u32) |
                UInt32.new!(dad.to_int).&(0x7f_u32) << 22
      end

      unless oddfrm.nil?
        value = (value & 0xdfffffff_u32) |
                UInt32.new!(oddfrm.to_int).&(0x1_u32) << 29
      end

      unless chdis.nil?
        value = (value & 0xbfffffff_u32) |
                UInt32.new!(chdis.to_int).&(0x1_u32) << 30
      end

      unless chena.nil?
        value = (value & 0x7fffffff_u32) |
                UInt32.new!(chena.to_int).&(0x1_u32) << 31
      end

      self.class.new(value)
    end

    def self.set(
      *,
      mpsiz : UInt16? = nil,
      epnum : UInt8? = nil,
      epdir : Bool? = nil,
      lsdev : Bool? = nil,
      eptyp : UInt8? = nil,
      mc : UInt8? = nil,
      dad : UInt8? = nil,
      oddfrm : Bool? = nil,
      chdis : Bool? = nil,
      chena : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        mpsiz: mpsiz,
        epnum: epnum,
        epdir: epdir,
        lsdev: lsdev,
        eptyp: eptyp,
        mc: mc,
        dad: dad,
        oddfrm: oddfrm,
        chdis: chdis,
        chena: chena,
      )
    end
  end # struct

  # OTG_HS host channel-4 characteristics          register
  struct OTG_HS_HCCHAR4
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

    # Maximum packet size
    def mpsiz : UInt16
      UInt16.new!((@value >> 0) & 0x7ff_u32)
    end

    # Maximum packet size
    def self.mpsiz : UInt16
      value.mpsiz
    end

    # Maximum packet size
    def self.mpsiz=(value : UInt16) : UInt16
      self.set(mpsiz: value)
      value
    end

    # Endpoint number
    def epnum : UInt8
      UInt8.new!((@value >> 11) & 0xf_u32)
    end

    # Endpoint number
    def self.epnum : UInt8
      value.epnum
    end

    # Endpoint number
    def self.epnum=(value : UInt8) : UInt8
      self.set(epnum: value)
      value
    end

    # Endpoint direction
    def epdir : Bool
      @value.bits_set?(0x8000_u32)
    end

    # Endpoint direction
    def self.epdir : Bool
      value.epdir
    end

    # Endpoint direction
    def self.epdir=(value : Bool) : Bool
      self.set(epdir: value)
      value
    end

    # Low-speed device
    def lsdev : Bool
      @value.bits_set?(0x20000_u32)
    end

    # Low-speed device
    def self.lsdev : Bool
      value.lsdev
    end

    # Low-speed device
    def self.lsdev=(value : Bool) : Bool
      self.set(lsdev: value)
      value
    end

    # Endpoint type
    def eptyp : UInt8
      UInt8.new!((@value >> 18) & 0x3_u32)
    end

    # Endpoint type
    def self.eptyp : UInt8
      value.eptyp
    end

    # Endpoint type
    def self.eptyp=(value : UInt8) : UInt8
      self.set(eptyp: value)
      value
    end

    # Multi Count (MC) / Error Count              (EC)
    def mc : UInt8
      UInt8.new!((@value >> 20) & 0x3_u32)
    end

    # Multi Count (MC) / Error Count              (EC)
    def self.mc : UInt8
      value.mc
    end

    # Multi Count (MC) / Error Count              (EC)
    def self.mc=(value : UInt8) : UInt8
      self.set(mc: value)
      value
    end

    # Device address
    def dad : UInt8
      UInt8.new!((@value >> 22) & 0x7f_u32)
    end

    # Device address
    def self.dad : UInt8
      value.dad
    end

    # Device address
    def self.dad=(value : UInt8) : UInt8
      self.set(dad: value)
      value
    end

    # Odd frame
    def oddfrm : Bool
      @value.bits_set?(0x20000000_u32)
    end

    # Odd frame
    def self.oddfrm : Bool
      value.oddfrm
    end

    # Odd frame
    def self.oddfrm=(value : Bool) : Bool
      self.set(oddfrm: value)
      value
    end

    # Channel disable
    def chdis : Bool
      @value.bits_set?(0x40000000_u32)
    end

    # Channel disable
    def self.chdis : Bool
      value.chdis
    end

    # Channel disable
    def self.chdis=(value : Bool) : Bool
      self.set(chdis: value)
      value
    end

    # Channel enable
    def chena : Bool
      @value.bits_set?(0x80000000_u32)
    end

    # Channel enable
    def self.chena : Bool
      value.chena
    end

    # Channel enable
    def self.chena=(value : Bool) : Bool
      self.set(chena: value)
      value
    end

    def copy_with(
      *,

      mpsiz : UInt16? = nil,

      epnum : UInt8? = nil,

      epdir : Bool? = nil,

      lsdev : Bool? = nil,

      eptyp : UInt8? = nil,

      mc : UInt8? = nil,

      dad : UInt8? = nil,

      oddfrm : Bool? = nil,

      chdis : Bool? = nil,

      chena : Bool? = nil
    ) : self
      value = @value

      unless mpsiz.nil?
        value = (value & 0xfffff800_u32) |
                UInt32.new!(mpsiz.to_int).&(0x7ff_u32) << 0
      end

      unless epnum.nil?
        value = (value & 0xffff87ff_u32) |
                UInt32.new!(epnum.to_int).&(0xf_u32) << 11
      end

      unless epdir.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(epdir.to_int).&(0x1_u32) << 15
      end

      unless lsdev.nil?
        value = (value & 0xfffdffff_u32) |
                UInt32.new!(lsdev.to_int).&(0x1_u32) << 17
      end

      unless eptyp.nil?
        value = (value & 0xfff3ffff_u32) |
                UInt32.new!(eptyp.to_int).&(0x3_u32) << 18
      end

      unless mc.nil?
        value = (value & 0xffcfffff_u32) |
                UInt32.new!(mc.to_int).&(0x3_u32) << 20
      end

      unless dad.nil?
        value = (value & 0xe03fffff_u32) |
                UInt32.new!(dad.to_int).&(0x7f_u32) << 22
      end

      unless oddfrm.nil?
        value = (value & 0xdfffffff_u32) |
                UInt32.new!(oddfrm.to_int).&(0x1_u32) << 29
      end

      unless chdis.nil?
        value = (value & 0xbfffffff_u32) |
                UInt32.new!(chdis.to_int).&(0x1_u32) << 30
      end

      unless chena.nil?
        value = (value & 0x7fffffff_u32) |
                UInt32.new!(chena.to_int).&(0x1_u32) << 31
      end

      self.class.new(value)
    end

    def self.set(
      *,
      mpsiz : UInt16? = nil,
      epnum : UInt8? = nil,
      epdir : Bool? = nil,
      lsdev : Bool? = nil,
      eptyp : UInt8? = nil,
      mc : UInt8? = nil,
      dad : UInt8? = nil,
      oddfrm : Bool? = nil,
      chdis : Bool? = nil,
      chena : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        mpsiz: mpsiz,
        epnum: epnum,
        epdir: epdir,
        lsdev: lsdev,
        eptyp: eptyp,
        mc: mc,
        dad: dad,
        oddfrm: oddfrm,
        chdis: chdis,
        chena: chena,
      )
    end
  end # struct

  # OTG_HS host channel-5 characteristics          register
  struct OTG_HS_HCCHAR5
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

    # Maximum packet size
    def mpsiz : UInt16
      UInt16.new!((@value >> 0) & 0x7ff_u32)
    end

    # Maximum packet size
    def self.mpsiz : UInt16
      value.mpsiz
    end

    # Maximum packet size
    def self.mpsiz=(value : UInt16) : UInt16
      self.set(mpsiz: value)
      value
    end

    # Endpoint number
    def epnum : UInt8
      UInt8.new!((@value >> 11) & 0xf_u32)
    end

    # Endpoint number
    def self.epnum : UInt8
      value.epnum
    end

    # Endpoint number
    def self.epnum=(value : UInt8) : UInt8
      self.set(epnum: value)
      value
    end

    # Endpoint direction
    def epdir : Bool
      @value.bits_set?(0x8000_u32)
    end

    # Endpoint direction
    def self.epdir : Bool
      value.epdir
    end

    # Endpoint direction
    def self.epdir=(value : Bool) : Bool
      self.set(epdir: value)
      value
    end

    # Low-speed device
    def lsdev : Bool
      @value.bits_set?(0x20000_u32)
    end

    # Low-speed device
    def self.lsdev : Bool
      value.lsdev
    end

    # Low-speed device
    def self.lsdev=(value : Bool) : Bool
      self.set(lsdev: value)
      value
    end

    # Endpoint type
    def eptyp : UInt8
      UInt8.new!((@value >> 18) & 0x3_u32)
    end

    # Endpoint type
    def self.eptyp : UInt8
      value.eptyp
    end

    # Endpoint type
    def self.eptyp=(value : UInt8) : UInt8
      self.set(eptyp: value)
      value
    end

    # Multi Count (MC) / Error Count              (EC)
    def mc : UInt8
      UInt8.new!((@value >> 20) & 0x3_u32)
    end

    # Multi Count (MC) / Error Count              (EC)
    def self.mc : UInt8
      value.mc
    end

    # Multi Count (MC) / Error Count              (EC)
    def self.mc=(value : UInt8) : UInt8
      self.set(mc: value)
      value
    end

    # Device address
    def dad : UInt8
      UInt8.new!((@value >> 22) & 0x7f_u32)
    end

    # Device address
    def self.dad : UInt8
      value.dad
    end

    # Device address
    def self.dad=(value : UInt8) : UInt8
      self.set(dad: value)
      value
    end

    # Odd frame
    def oddfrm : Bool
      @value.bits_set?(0x20000000_u32)
    end

    # Odd frame
    def self.oddfrm : Bool
      value.oddfrm
    end

    # Odd frame
    def self.oddfrm=(value : Bool) : Bool
      self.set(oddfrm: value)
      value
    end

    # Channel disable
    def chdis : Bool
      @value.bits_set?(0x40000000_u32)
    end

    # Channel disable
    def self.chdis : Bool
      value.chdis
    end

    # Channel disable
    def self.chdis=(value : Bool) : Bool
      self.set(chdis: value)
      value
    end

    # Channel enable
    def chena : Bool
      @value.bits_set?(0x80000000_u32)
    end

    # Channel enable
    def self.chena : Bool
      value.chena
    end

    # Channel enable
    def self.chena=(value : Bool) : Bool
      self.set(chena: value)
      value
    end

    def copy_with(
      *,

      mpsiz : UInt16? = nil,

      epnum : UInt8? = nil,

      epdir : Bool? = nil,

      lsdev : Bool? = nil,

      eptyp : UInt8? = nil,

      mc : UInt8? = nil,

      dad : UInt8? = nil,

      oddfrm : Bool? = nil,

      chdis : Bool? = nil,

      chena : Bool? = nil
    ) : self
      value = @value

      unless mpsiz.nil?
        value = (value & 0xfffff800_u32) |
                UInt32.new!(mpsiz.to_int).&(0x7ff_u32) << 0
      end

      unless epnum.nil?
        value = (value & 0xffff87ff_u32) |
                UInt32.new!(epnum.to_int).&(0xf_u32) << 11
      end

      unless epdir.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(epdir.to_int).&(0x1_u32) << 15
      end

      unless lsdev.nil?
        value = (value & 0xfffdffff_u32) |
                UInt32.new!(lsdev.to_int).&(0x1_u32) << 17
      end

      unless eptyp.nil?
        value = (value & 0xfff3ffff_u32) |
                UInt32.new!(eptyp.to_int).&(0x3_u32) << 18
      end

      unless mc.nil?
        value = (value & 0xffcfffff_u32) |
                UInt32.new!(mc.to_int).&(0x3_u32) << 20
      end

      unless dad.nil?
        value = (value & 0xe03fffff_u32) |
                UInt32.new!(dad.to_int).&(0x7f_u32) << 22
      end

      unless oddfrm.nil?
        value = (value & 0xdfffffff_u32) |
                UInt32.new!(oddfrm.to_int).&(0x1_u32) << 29
      end

      unless chdis.nil?
        value = (value & 0xbfffffff_u32) |
                UInt32.new!(chdis.to_int).&(0x1_u32) << 30
      end

      unless chena.nil?
        value = (value & 0x7fffffff_u32) |
                UInt32.new!(chena.to_int).&(0x1_u32) << 31
      end

      self.class.new(value)
    end

    def self.set(
      *,
      mpsiz : UInt16? = nil,
      epnum : UInt8? = nil,
      epdir : Bool? = nil,
      lsdev : Bool? = nil,
      eptyp : UInt8? = nil,
      mc : UInt8? = nil,
      dad : UInt8? = nil,
      oddfrm : Bool? = nil,
      chdis : Bool? = nil,
      chena : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        mpsiz: mpsiz,
        epnum: epnum,
        epdir: epdir,
        lsdev: lsdev,
        eptyp: eptyp,
        mc: mc,
        dad: dad,
        oddfrm: oddfrm,
        chdis: chdis,
        chena: chena,
      )
    end
  end # struct

  # OTG_HS host channel-6 characteristics          register
  struct OTG_HS_HCCHAR6
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

    # Maximum packet size
    def mpsiz : UInt16
      UInt16.new!((@value >> 0) & 0x7ff_u32)
    end

    # Maximum packet size
    def self.mpsiz : UInt16
      value.mpsiz
    end

    # Maximum packet size
    def self.mpsiz=(value : UInt16) : UInt16
      self.set(mpsiz: value)
      value
    end

    # Endpoint number
    def epnum : UInt8
      UInt8.new!((@value >> 11) & 0xf_u32)
    end

    # Endpoint number
    def self.epnum : UInt8
      value.epnum
    end

    # Endpoint number
    def self.epnum=(value : UInt8) : UInt8
      self.set(epnum: value)
      value
    end

    # Endpoint direction
    def epdir : Bool
      @value.bits_set?(0x8000_u32)
    end

    # Endpoint direction
    def self.epdir : Bool
      value.epdir
    end

    # Endpoint direction
    def self.epdir=(value : Bool) : Bool
      self.set(epdir: value)
      value
    end

    # Low-speed device
    def lsdev : Bool
      @value.bits_set?(0x20000_u32)
    end

    # Low-speed device
    def self.lsdev : Bool
      value.lsdev
    end

    # Low-speed device
    def self.lsdev=(value : Bool) : Bool
      self.set(lsdev: value)
      value
    end

    # Endpoint type
    def eptyp : UInt8
      UInt8.new!((@value >> 18) & 0x3_u32)
    end

    # Endpoint type
    def self.eptyp : UInt8
      value.eptyp
    end

    # Endpoint type
    def self.eptyp=(value : UInt8) : UInt8
      self.set(eptyp: value)
      value
    end

    # Multi Count (MC) / Error Count              (EC)
    def mc : UInt8
      UInt8.new!((@value >> 20) & 0x3_u32)
    end

    # Multi Count (MC) / Error Count              (EC)
    def self.mc : UInt8
      value.mc
    end

    # Multi Count (MC) / Error Count              (EC)
    def self.mc=(value : UInt8) : UInt8
      self.set(mc: value)
      value
    end

    # Device address
    def dad : UInt8
      UInt8.new!((@value >> 22) & 0x7f_u32)
    end

    # Device address
    def self.dad : UInt8
      value.dad
    end

    # Device address
    def self.dad=(value : UInt8) : UInt8
      self.set(dad: value)
      value
    end

    # Odd frame
    def oddfrm : Bool
      @value.bits_set?(0x20000000_u32)
    end

    # Odd frame
    def self.oddfrm : Bool
      value.oddfrm
    end

    # Odd frame
    def self.oddfrm=(value : Bool) : Bool
      self.set(oddfrm: value)
      value
    end

    # Channel disable
    def chdis : Bool
      @value.bits_set?(0x40000000_u32)
    end

    # Channel disable
    def self.chdis : Bool
      value.chdis
    end

    # Channel disable
    def self.chdis=(value : Bool) : Bool
      self.set(chdis: value)
      value
    end

    # Channel enable
    def chena : Bool
      @value.bits_set?(0x80000000_u32)
    end

    # Channel enable
    def self.chena : Bool
      value.chena
    end

    # Channel enable
    def self.chena=(value : Bool) : Bool
      self.set(chena: value)
      value
    end

    def copy_with(
      *,

      mpsiz : UInt16? = nil,

      epnum : UInt8? = nil,

      epdir : Bool? = nil,

      lsdev : Bool? = nil,

      eptyp : UInt8? = nil,

      mc : UInt8? = nil,

      dad : UInt8? = nil,

      oddfrm : Bool? = nil,

      chdis : Bool? = nil,

      chena : Bool? = nil
    ) : self
      value = @value

      unless mpsiz.nil?
        value = (value & 0xfffff800_u32) |
                UInt32.new!(mpsiz.to_int).&(0x7ff_u32) << 0
      end

      unless epnum.nil?
        value = (value & 0xffff87ff_u32) |
                UInt32.new!(epnum.to_int).&(0xf_u32) << 11
      end

      unless epdir.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(epdir.to_int).&(0x1_u32) << 15
      end

      unless lsdev.nil?
        value = (value & 0xfffdffff_u32) |
                UInt32.new!(lsdev.to_int).&(0x1_u32) << 17
      end

      unless eptyp.nil?
        value = (value & 0xfff3ffff_u32) |
                UInt32.new!(eptyp.to_int).&(0x3_u32) << 18
      end

      unless mc.nil?
        value = (value & 0xffcfffff_u32) |
                UInt32.new!(mc.to_int).&(0x3_u32) << 20
      end

      unless dad.nil?
        value = (value & 0xe03fffff_u32) |
                UInt32.new!(dad.to_int).&(0x7f_u32) << 22
      end

      unless oddfrm.nil?
        value = (value & 0xdfffffff_u32) |
                UInt32.new!(oddfrm.to_int).&(0x1_u32) << 29
      end

      unless chdis.nil?
        value = (value & 0xbfffffff_u32) |
                UInt32.new!(chdis.to_int).&(0x1_u32) << 30
      end

      unless chena.nil?
        value = (value & 0x7fffffff_u32) |
                UInt32.new!(chena.to_int).&(0x1_u32) << 31
      end

      self.class.new(value)
    end

    def self.set(
      *,
      mpsiz : UInt16? = nil,
      epnum : UInt8? = nil,
      epdir : Bool? = nil,
      lsdev : Bool? = nil,
      eptyp : UInt8? = nil,
      mc : UInt8? = nil,
      dad : UInt8? = nil,
      oddfrm : Bool? = nil,
      chdis : Bool? = nil,
      chena : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        mpsiz: mpsiz,
        epnum: epnum,
        epdir: epdir,
        lsdev: lsdev,
        eptyp: eptyp,
        mc: mc,
        dad: dad,
        oddfrm: oddfrm,
        chdis: chdis,
        chena: chena,
      )
    end
  end # struct

  # OTG_HS host channel-7 characteristics          register
  struct OTG_HS_HCCHAR7
    ADDRESS = BASE_ADDRESS + 0x1e0_u64

    protected def self.address : UInt64
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

    # Maximum packet size
    def mpsiz : UInt16
      UInt16.new!((@value >> 0) & 0x7ff_u32)
    end

    # Maximum packet size
    def self.mpsiz : UInt16
      value.mpsiz
    end

    # Maximum packet size
    def self.mpsiz=(value : UInt16) : UInt16
      self.set(mpsiz: value)
      value
    end

    # Endpoint number
    def epnum : UInt8
      UInt8.new!((@value >> 11) & 0xf_u32)
    end

    # Endpoint number
    def self.epnum : UInt8
      value.epnum
    end

    # Endpoint number
    def self.epnum=(value : UInt8) : UInt8
      self.set(epnum: value)
      value
    end

    # Endpoint direction
    def epdir : Bool
      @value.bits_set?(0x8000_u32)
    end

    # Endpoint direction
    def self.epdir : Bool
      value.epdir
    end

    # Endpoint direction
    def self.epdir=(value : Bool) : Bool
      self.set(epdir: value)
      value
    end

    # Low-speed device
    def lsdev : Bool
      @value.bits_set?(0x20000_u32)
    end

    # Low-speed device
    def self.lsdev : Bool
      value.lsdev
    end

    # Low-speed device
    def self.lsdev=(value : Bool) : Bool
      self.set(lsdev: value)
      value
    end

    # Endpoint type
    def eptyp : UInt8
      UInt8.new!((@value >> 18) & 0x3_u32)
    end

    # Endpoint type
    def self.eptyp : UInt8
      value.eptyp
    end

    # Endpoint type
    def self.eptyp=(value : UInt8) : UInt8
      self.set(eptyp: value)
      value
    end

    # Multi Count (MC) / Error Count              (EC)
    def mc : UInt8
      UInt8.new!((@value >> 20) & 0x3_u32)
    end

    # Multi Count (MC) / Error Count              (EC)
    def self.mc : UInt8
      value.mc
    end

    # Multi Count (MC) / Error Count              (EC)
    def self.mc=(value : UInt8) : UInt8
      self.set(mc: value)
      value
    end

    # Device address
    def dad : UInt8
      UInt8.new!((@value >> 22) & 0x7f_u32)
    end

    # Device address
    def self.dad : UInt8
      value.dad
    end

    # Device address
    def self.dad=(value : UInt8) : UInt8
      self.set(dad: value)
      value
    end

    # Odd frame
    def oddfrm : Bool
      @value.bits_set?(0x20000000_u32)
    end

    # Odd frame
    def self.oddfrm : Bool
      value.oddfrm
    end

    # Odd frame
    def self.oddfrm=(value : Bool) : Bool
      self.set(oddfrm: value)
      value
    end

    # Channel disable
    def chdis : Bool
      @value.bits_set?(0x40000000_u32)
    end

    # Channel disable
    def self.chdis : Bool
      value.chdis
    end

    # Channel disable
    def self.chdis=(value : Bool) : Bool
      self.set(chdis: value)
      value
    end

    # Channel enable
    def chena : Bool
      @value.bits_set?(0x80000000_u32)
    end

    # Channel enable
    def self.chena : Bool
      value.chena
    end

    # Channel enable
    def self.chena=(value : Bool) : Bool
      self.set(chena: value)
      value
    end

    def copy_with(
      *,

      mpsiz : UInt16? = nil,

      epnum : UInt8? = nil,

      epdir : Bool? = nil,

      lsdev : Bool? = nil,

      eptyp : UInt8? = nil,

      mc : UInt8? = nil,

      dad : UInt8? = nil,

      oddfrm : Bool? = nil,

      chdis : Bool? = nil,

      chena : Bool? = nil
    ) : self
      value = @value

      unless mpsiz.nil?
        value = (value & 0xfffff800_u32) |
                UInt32.new!(mpsiz.to_int).&(0x7ff_u32) << 0
      end

      unless epnum.nil?
        value = (value & 0xffff87ff_u32) |
                UInt32.new!(epnum.to_int).&(0xf_u32) << 11
      end

      unless epdir.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(epdir.to_int).&(0x1_u32) << 15
      end

      unless lsdev.nil?
        value = (value & 0xfffdffff_u32) |
                UInt32.new!(lsdev.to_int).&(0x1_u32) << 17
      end

      unless eptyp.nil?
        value = (value & 0xfff3ffff_u32) |
                UInt32.new!(eptyp.to_int).&(0x3_u32) << 18
      end

      unless mc.nil?
        value = (value & 0xffcfffff_u32) |
                UInt32.new!(mc.to_int).&(0x3_u32) << 20
      end

      unless dad.nil?
        value = (value & 0xe03fffff_u32) |
                UInt32.new!(dad.to_int).&(0x7f_u32) << 22
      end

      unless oddfrm.nil?
        value = (value & 0xdfffffff_u32) |
                UInt32.new!(oddfrm.to_int).&(0x1_u32) << 29
      end

      unless chdis.nil?
        value = (value & 0xbfffffff_u32) |
                UInt32.new!(chdis.to_int).&(0x1_u32) << 30
      end

      unless chena.nil?
        value = (value & 0x7fffffff_u32) |
                UInt32.new!(chena.to_int).&(0x1_u32) << 31
      end

      self.class.new(value)
    end

    def self.set(
      *,
      mpsiz : UInt16? = nil,
      epnum : UInt8? = nil,
      epdir : Bool? = nil,
      lsdev : Bool? = nil,
      eptyp : UInt8? = nil,
      mc : UInt8? = nil,
      dad : UInt8? = nil,
      oddfrm : Bool? = nil,
      chdis : Bool? = nil,
      chena : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        mpsiz: mpsiz,
        epnum: epnum,
        epdir: epdir,
        lsdev: lsdev,
        eptyp: eptyp,
        mc: mc,
        dad: dad,
        oddfrm: oddfrm,
        chdis: chdis,
        chena: chena,
      )
    end
  end # struct

  # OTG_HS host channel-8 characteristics          register
  struct OTG_HS_HCCHAR8
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

    # Maximum packet size
    def mpsiz : UInt16
      UInt16.new!((@value >> 0) & 0x7ff_u32)
    end

    # Maximum packet size
    def self.mpsiz : UInt16
      value.mpsiz
    end

    # Maximum packet size
    def self.mpsiz=(value : UInt16) : UInt16
      self.set(mpsiz: value)
      value
    end

    # Endpoint number
    def epnum : UInt8
      UInt8.new!((@value >> 11) & 0xf_u32)
    end

    # Endpoint number
    def self.epnum : UInt8
      value.epnum
    end

    # Endpoint number
    def self.epnum=(value : UInt8) : UInt8
      self.set(epnum: value)
      value
    end

    # Endpoint direction
    def epdir : Bool
      @value.bits_set?(0x8000_u32)
    end

    # Endpoint direction
    def self.epdir : Bool
      value.epdir
    end

    # Endpoint direction
    def self.epdir=(value : Bool) : Bool
      self.set(epdir: value)
      value
    end

    # Low-speed device
    def lsdev : Bool
      @value.bits_set?(0x20000_u32)
    end

    # Low-speed device
    def self.lsdev : Bool
      value.lsdev
    end

    # Low-speed device
    def self.lsdev=(value : Bool) : Bool
      self.set(lsdev: value)
      value
    end

    # Endpoint type
    def eptyp : UInt8
      UInt8.new!((@value >> 18) & 0x3_u32)
    end

    # Endpoint type
    def self.eptyp : UInt8
      value.eptyp
    end

    # Endpoint type
    def self.eptyp=(value : UInt8) : UInt8
      self.set(eptyp: value)
      value
    end

    # Multi Count (MC) / Error Count              (EC)
    def mc : UInt8
      UInt8.new!((@value >> 20) & 0x3_u32)
    end

    # Multi Count (MC) / Error Count              (EC)
    def self.mc : UInt8
      value.mc
    end

    # Multi Count (MC) / Error Count              (EC)
    def self.mc=(value : UInt8) : UInt8
      self.set(mc: value)
      value
    end

    # Device address
    def dad : UInt8
      UInt8.new!((@value >> 22) & 0x7f_u32)
    end

    # Device address
    def self.dad : UInt8
      value.dad
    end

    # Device address
    def self.dad=(value : UInt8) : UInt8
      self.set(dad: value)
      value
    end

    # Odd frame
    def oddfrm : Bool
      @value.bits_set?(0x20000000_u32)
    end

    # Odd frame
    def self.oddfrm : Bool
      value.oddfrm
    end

    # Odd frame
    def self.oddfrm=(value : Bool) : Bool
      self.set(oddfrm: value)
      value
    end

    # Channel disable
    def chdis : Bool
      @value.bits_set?(0x40000000_u32)
    end

    # Channel disable
    def self.chdis : Bool
      value.chdis
    end

    # Channel disable
    def self.chdis=(value : Bool) : Bool
      self.set(chdis: value)
      value
    end

    # Channel enable
    def chena : Bool
      @value.bits_set?(0x80000000_u32)
    end

    # Channel enable
    def self.chena : Bool
      value.chena
    end

    # Channel enable
    def self.chena=(value : Bool) : Bool
      self.set(chena: value)
      value
    end

    def copy_with(
      *,

      mpsiz : UInt16? = nil,

      epnum : UInt8? = nil,

      epdir : Bool? = nil,

      lsdev : Bool? = nil,

      eptyp : UInt8? = nil,

      mc : UInt8? = nil,

      dad : UInt8? = nil,

      oddfrm : Bool? = nil,

      chdis : Bool? = nil,

      chena : Bool? = nil
    ) : self
      value = @value

      unless mpsiz.nil?
        value = (value & 0xfffff800_u32) |
                UInt32.new!(mpsiz.to_int).&(0x7ff_u32) << 0
      end

      unless epnum.nil?
        value = (value & 0xffff87ff_u32) |
                UInt32.new!(epnum.to_int).&(0xf_u32) << 11
      end

      unless epdir.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(epdir.to_int).&(0x1_u32) << 15
      end

      unless lsdev.nil?
        value = (value & 0xfffdffff_u32) |
                UInt32.new!(lsdev.to_int).&(0x1_u32) << 17
      end

      unless eptyp.nil?
        value = (value & 0xfff3ffff_u32) |
                UInt32.new!(eptyp.to_int).&(0x3_u32) << 18
      end

      unless mc.nil?
        value = (value & 0xffcfffff_u32) |
                UInt32.new!(mc.to_int).&(0x3_u32) << 20
      end

      unless dad.nil?
        value = (value & 0xe03fffff_u32) |
                UInt32.new!(dad.to_int).&(0x7f_u32) << 22
      end

      unless oddfrm.nil?
        value = (value & 0xdfffffff_u32) |
                UInt32.new!(oddfrm.to_int).&(0x1_u32) << 29
      end

      unless chdis.nil?
        value = (value & 0xbfffffff_u32) |
                UInt32.new!(chdis.to_int).&(0x1_u32) << 30
      end

      unless chena.nil?
        value = (value & 0x7fffffff_u32) |
                UInt32.new!(chena.to_int).&(0x1_u32) << 31
      end

      self.class.new(value)
    end

    def self.set(
      *,
      mpsiz : UInt16? = nil,
      epnum : UInt8? = nil,
      epdir : Bool? = nil,
      lsdev : Bool? = nil,
      eptyp : UInt8? = nil,
      mc : UInt8? = nil,
      dad : UInt8? = nil,
      oddfrm : Bool? = nil,
      chdis : Bool? = nil,
      chena : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        mpsiz: mpsiz,
        epnum: epnum,
        epdir: epdir,
        lsdev: lsdev,
        eptyp: eptyp,
        mc: mc,
        dad: dad,
        oddfrm: oddfrm,
        chdis: chdis,
        chena: chena,
      )
    end
  end # struct

  # OTG_HS host channel-9 characteristics          register
  struct OTG_HS_HCCHAR9
    ADDRESS = BASE_ADDRESS + 0x220_u64

    protected def self.address : UInt64
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

    # Maximum packet size
    def mpsiz : UInt16
      UInt16.new!((@value >> 0) & 0x7ff_u32)
    end

    # Maximum packet size
    def self.mpsiz : UInt16
      value.mpsiz
    end

    # Maximum packet size
    def self.mpsiz=(value : UInt16) : UInt16
      self.set(mpsiz: value)
      value
    end

    # Endpoint number
    def epnum : UInt8
      UInt8.new!((@value >> 11) & 0xf_u32)
    end

    # Endpoint number
    def self.epnum : UInt8
      value.epnum
    end

    # Endpoint number
    def self.epnum=(value : UInt8) : UInt8
      self.set(epnum: value)
      value
    end

    # Endpoint direction
    def epdir : Bool
      @value.bits_set?(0x8000_u32)
    end

    # Endpoint direction
    def self.epdir : Bool
      value.epdir
    end

    # Endpoint direction
    def self.epdir=(value : Bool) : Bool
      self.set(epdir: value)
      value
    end

    # Low-speed device
    def lsdev : Bool
      @value.bits_set?(0x20000_u32)
    end

    # Low-speed device
    def self.lsdev : Bool
      value.lsdev
    end

    # Low-speed device
    def self.lsdev=(value : Bool) : Bool
      self.set(lsdev: value)
      value
    end

    # Endpoint type
    def eptyp : UInt8
      UInt8.new!((@value >> 18) & 0x3_u32)
    end

    # Endpoint type
    def self.eptyp : UInt8
      value.eptyp
    end

    # Endpoint type
    def self.eptyp=(value : UInt8) : UInt8
      self.set(eptyp: value)
      value
    end

    # Multi Count (MC) / Error Count              (EC)
    def mc : UInt8
      UInt8.new!((@value >> 20) & 0x3_u32)
    end

    # Multi Count (MC) / Error Count              (EC)
    def self.mc : UInt8
      value.mc
    end

    # Multi Count (MC) / Error Count              (EC)
    def self.mc=(value : UInt8) : UInt8
      self.set(mc: value)
      value
    end

    # Device address
    def dad : UInt8
      UInt8.new!((@value >> 22) & 0x7f_u32)
    end

    # Device address
    def self.dad : UInt8
      value.dad
    end

    # Device address
    def self.dad=(value : UInt8) : UInt8
      self.set(dad: value)
      value
    end

    # Odd frame
    def oddfrm : Bool
      @value.bits_set?(0x20000000_u32)
    end

    # Odd frame
    def self.oddfrm : Bool
      value.oddfrm
    end

    # Odd frame
    def self.oddfrm=(value : Bool) : Bool
      self.set(oddfrm: value)
      value
    end

    # Channel disable
    def chdis : Bool
      @value.bits_set?(0x40000000_u32)
    end

    # Channel disable
    def self.chdis : Bool
      value.chdis
    end

    # Channel disable
    def self.chdis=(value : Bool) : Bool
      self.set(chdis: value)
      value
    end

    # Channel enable
    def chena : Bool
      @value.bits_set?(0x80000000_u32)
    end

    # Channel enable
    def self.chena : Bool
      value.chena
    end

    # Channel enable
    def self.chena=(value : Bool) : Bool
      self.set(chena: value)
      value
    end

    def copy_with(
      *,

      mpsiz : UInt16? = nil,

      epnum : UInt8? = nil,

      epdir : Bool? = nil,

      lsdev : Bool? = nil,

      eptyp : UInt8? = nil,

      mc : UInt8? = nil,

      dad : UInt8? = nil,

      oddfrm : Bool? = nil,

      chdis : Bool? = nil,

      chena : Bool? = nil
    ) : self
      value = @value

      unless mpsiz.nil?
        value = (value & 0xfffff800_u32) |
                UInt32.new!(mpsiz.to_int).&(0x7ff_u32) << 0
      end

      unless epnum.nil?
        value = (value & 0xffff87ff_u32) |
                UInt32.new!(epnum.to_int).&(0xf_u32) << 11
      end

      unless epdir.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(epdir.to_int).&(0x1_u32) << 15
      end

      unless lsdev.nil?
        value = (value & 0xfffdffff_u32) |
                UInt32.new!(lsdev.to_int).&(0x1_u32) << 17
      end

      unless eptyp.nil?
        value = (value & 0xfff3ffff_u32) |
                UInt32.new!(eptyp.to_int).&(0x3_u32) << 18
      end

      unless mc.nil?
        value = (value & 0xffcfffff_u32) |
                UInt32.new!(mc.to_int).&(0x3_u32) << 20
      end

      unless dad.nil?
        value = (value & 0xe03fffff_u32) |
                UInt32.new!(dad.to_int).&(0x7f_u32) << 22
      end

      unless oddfrm.nil?
        value = (value & 0xdfffffff_u32) |
                UInt32.new!(oddfrm.to_int).&(0x1_u32) << 29
      end

      unless chdis.nil?
        value = (value & 0xbfffffff_u32) |
                UInt32.new!(chdis.to_int).&(0x1_u32) << 30
      end

      unless chena.nil?
        value = (value & 0x7fffffff_u32) |
                UInt32.new!(chena.to_int).&(0x1_u32) << 31
      end

      self.class.new(value)
    end

    def self.set(
      *,
      mpsiz : UInt16? = nil,
      epnum : UInt8? = nil,
      epdir : Bool? = nil,
      lsdev : Bool? = nil,
      eptyp : UInt8? = nil,
      mc : UInt8? = nil,
      dad : UInt8? = nil,
      oddfrm : Bool? = nil,
      chdis : Bool? = nil,
      chena : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        mpsiz: mpsiz,
        epnum: epnum,
        epdir: epdir,
        lsdev: lsdev,
        eptyp: eptyp,
        mc: mc,
        dad: dad,
        oddfrm: oddfrm,
        chdis: chdis,
        chena: chena,
      )
    end
  end # struct

  # OTG_HS host channel-10 characteristics          register
  struct OTG_HS_HCCHAR10
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

    # Maximum packet size
    def mpsiz : UInt16
      UInt16.new!((@value >> 0) & 0x7ff_u32)
    end

    # Maximum packet size
    def self.mpsiz : UInt16
      value.mpsiz
    end

    # Maximum packet size
    def self.mpsiz=(value : UInt16) : UInt16
      self.set(mpsiz: value)
      value
    end

    # Endpoint number
    def epnum : UInt8
      UInt8.new!((@value >> 11) & 0xf_u32)
    end

    # Endpoint number
    def self.epnum : UInt8
      value.epnum
    end

    # Endpoint number
    def self.epnum=(value : UInt8) : UInt8
      self.set(epnum: value)
      value
    end

    # Endpoint direction
    def epdir : Bool
      @value.bits_set?(0x8000_u32)
    end

    # Endpoint direction
    def self.epdir : Bool
      value.epdir
    end

    # Endpoint direction
    def self.epdir=(value : Bool) : Bool
      self.set(epdir: value)
      value
    end

    # Low-speed device
    def lsdev : Bool
      @value.bits_set?(0x20000_u32)
    end

    # Low-speed device
    def self.lsdev : Bool
      value.lsdev
    end

    # Low-speed device
    def self.lsdev=(value : Bool) : Bool
      self.set(lsdev: value)
      value
    end

    # Endpoint type
    def eptyp : UInt8
      UInt8.new!((@value >> 18) & 0x3_u32)
    end

    # Endpoint type
    def self.eptyp : UInt8
      value.eptyp
    end

    # Endpoint type
    def self.eptyp=(value : UInt8) : UInt8
      self.set(eptyp: value)
      value
    end

    # Multi Count (MC) / Error Count              (EC)
    def mc : UInt8
      UInt8.new!((@value >> 20) & 0x3_u32)
    end

    # Multi Count (MC) / Error Count              (EC)
    def self.mc : UInt8
      value.mc
    end

    # Multi Count (MC) / Error Count              (EC)
    def self.mc=(value : UInt8) : UInt8
      self.set(mc: value)
      value
    end

    # Device address
    def dad : UInt8
      UInt8.new!((@value >> 22) & 0x7f_u32)
    end

    # Device address
    def self.dad : UInt8
      value.dad
    end

    # Device address
    def self.dad=(value : UInt8) : UInt8
      self.set(dad: value)
      value
    end

    # Odd frame
    def oddfrm : Bool
      @value.bits_set?(0x20000000_u32)
    end

    # Odd frame
    def self.oddfrm : Bool
      value.oddfrm
    end

    # Odd frame
    def self.oddfrm=(value : Bool) : Bool
      self.set(oddfrm: value)
      value
    end

    # Channel disable
    def chdis : Bool
      @value.bits_set?(0x40000000_u32)
    end

    # Channel disable
    def self.chdis : Bool
      value.chdis
    end

    # Channel disable
    def self.chdis=(value : Bool) : Bool
      self.set(chdis: value)
      value
    end

    # Channel enable
    def chena : Bool
      @value.bits_set?(0x80000000_u32)
    end

    # Channel enable
    def self.chena : Bool
      value.chena
    end

    # Channel enable
    def self.chena=(value : Bool) : Bool
      self.set(chena: value)
      value
    end

    def copy_with(
      *,

      mpsiz : UInt16? = nil,

      epnum : UInt8? = nil,

      epdir : Bool? = nil,

      lsdev : Bool? = nil,

      eptyp : UInt8? = nil,

      mc : UInt8? = nil,

      dad : UInt8? = nil,

      oddfrm : Bool? = nil,

      chdis : Bool? = nil,

      chena : Bool? = nil
    ) : self
      value = @value

      unless mpsiz.nil?
        value = (value & 0xfffff800_u32) |
                UInt32.new!(mpsiz.to_int).&(0x7ff_u32) << 0
      end

      unless epnum.nil?
        value = (value & 0xffff87ff_u32) |
                UInt32.new!(epnum.to_int).&(0xf_u32) << 11
      end

      unless epdir.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(epdir.to_int).&(0x1_u32) << 15
      end

      unless lsdev.nil?
        value = (value & 0xfffdffff_u32) |
                UInt32.new!(lsdev.to_int).&(0x1_u32) << 17
      end

      unless eptyp.nil?
        value = (value & 0xfff3ffff_u32) |
                UInt32.new!(eptyp.to_int).&(0x3_u32) << 18
      end

      unless mc.nil?
        value = (value & 0xffcfffff_u32) |
                UInt32.new!(mc.to_int).&(0x3_u32) << 20
      end

      unless dad.nil?
        value = (value & 0xe03fffff_u32) |
                UInt32.new!(dad.to_int).&(0x7f_u32) << 22
      end

      unless oddfrm.nil?
        value = (value & 0xdfffffff_u32) |
                UInt32.new!(oddfrm.to_int).&(0x1_u32) << 29
      end

      unless chdis.nil?
        value = (value & 0xbfffffff_u32) |
                UInt32.new!(chdis.to_int).&(0x1_u32) << 30
      end

      unless chena.nil?
        value = (value & 0x7fffffff_u32) |
                UInt32.new!(chena.to_int).&(0x1_u32) << 31
      end

      self.class.new(value)
    end

    def self.set(
      *,
      mpsiz : UInt16? = nil,
      epnum : UInt8? = nil,
      epdir : Bool? = nil,
      lsdev : Bool? = nil,
      eptyp : UInt8? = nil,
      mc : UInt8? = nil,
      dad : UInt8? = nil,
      oddfrm : Bool? = nil,
      chdis : Bool? = nil,
      chena : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        mpsiz: mpsiz,
        epnum: epnum,
        epdir: epdir,
        lsdev: lsdev,
        eptyp: eptyp,
        mc: mc,
        dad: dad,
        oddfrm: oddfrm,
        chdis: chdis,
        chena: chena,
      )
    end
  end # struct

  # OTG_HS host channel-11 characteristics          register
  struct OTG_HS_HCCHAR11
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

    # Maximum packet size
    def mpsiz : UInt16
      UInt16.new!((@value >> 0) & 0x7ff_u32)
    end

    # Maximum packet size
    def self.mpsiz : UInt16
      value.mpsiz
    end

    # Maximum packet size
    def self.mpsiz=(value : UInt16) : UInt16
      self.set(mpsiz: value)
      value
    end

    # Endpoint number
    def epnum : UInt8
      UInt8.new!((@value >> 11) & 0xf_u32)
    end

    # Endpoint number
    def self.epnum : UInt8
      value.epnum
    end

    # Endpoint number
    def self.epnum=(value : UInt8) : UInt8
      self.set(epnum: value)
      value
    end

    # Endpoint direction
    def epdir : Bool
      @value.bits_set?(0x8000_u32)
    end

    # Endpoint direction
    def self.epdir : Bool
      value.epdir
    end

    # Endpoint direction
    def self.epdir=(value : Bool) : Bool
      self.set(epdir: value)
      value
    end

    # Low-speed device
    def lsdev : Bool
      @value.bits_set?(0x20000_u32)
    end

    # Low-speed device
    def self.lsdev : Bool
      value.lsdev
    end

    # Low-speed device
    def self.lsdev=(value : Bool) : Bool
      self.set(lsdev: value)
      value
    end

    # Endpoint type
    def eptyp : UInt8
      UInt8.new!((@value >> 18) & 0x3_u32)
    end

    # Endpoint type
    def self.eptyp : UInt8
      value.eptyp
    end

    # Endpoint type
    def self.eptyp=(value : UInt8) : UInt8
      self.set(eptyp: value)
      value
    end

    # Multi Count (MC) / Error Count              (EC)
    def mc : UInt8
      UInt8.new!((@value >> 20) & 0x3_u32)
    end

    # Multi Count (MC) / Error Count              (EC)
    def self.mc : UInt8
      value.mc
    end

    # Multi Count (MC) / Error Count              (EC)
    def self.mc=(value : UInt8) : UInt8
      self.set(mc: value)
      value
    end

    # Device address
    def dad : UInt8
      UInt8.new!((@value >> 22) & 0x7f_u32)
    end

    # Device address
    def self.dad : UInt8
      value.dad
    end

    # Device address
    def self.dad=(value : UInt8) : UInt8
      self.set(dad: value)
      value
    end

    # Odd frame
    def oddfrm : Bool
      @value.bits_set?(0x20000000_u32)
    end

    # Odd frame
    def self.oddfrm : Bool
      value.oddfrm
    end

    # Odd frame
    def self.oddfrm=(value : Bool) : Bool
      self.set(oddfrm: value)
      value
    end

    # Channel disable
    def chdis : Bool
      @value.bits_set?(0x40000000_u32)
    end

    # Channel disable
    def self.chdis : Bool
      value.chdis
    end

    # Channel disable
    def self.chdis=(value : Bool) : Bool
      self.set(chdis: value)
      value
    end

    # Channel enable
    def chena : Bool
      @value.bits_set?(0x80000000_u32)
    end

    # Channel enable
    def self.chena : Bool
      value.chena
    end

    # Channel enable
    def self.chena=(value : Bool) : Bool
      self.set(chena: value)
      value
    end

    def copy_with(
      *,

      mpsiz : UInt16? = nil,

      epnum : UInt8? = nil,

      epdir : Bool? = nil,

      lsdev : Bool? = nil,

      eptyp : UInt8? = nil,

      mc : UInt8? = nil,

      dad : UInt8? = nil,

      oddfrm : Bool? = nil,

      chdis : Bool? = nil,

      chena : Bool? = nil
    ) : self
      value = @value

      unless mpsiz.nil?
        value = (value & 0xfffff800_u32) |
                UInt32.new!(mpsiz.to_int).&(0x7ff_u32) << 0
      end

      unless epnum.nil?
        value = (value & 0xffff87ff_u32) |
                UInt32.new!(epnum.to_int).&(0xf_u32) << 11
      end

      unless epdir.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(epdir.to_int).&(0x1_u32) << 15
      end

      unless lsdev.nil?
        value = (value & 0xfffdffff_u32) |
                UInt32.new!(lsdev.to_int).&(0x1_u32) << 17
      end

      unless eptyp.nil?
        value = (value & 0xfff3ffff_u32) |
                UInt32.new!(eptyp.to_int).&(0x3_u32) << 18
      end

      unless mc.nil?
        value = (value & 0xffcfffff_u32) |
                UInt32.new!(mc.to_int).&(0x3_u32) << 20
      end

      unless dad.nil?
        value = (value & 0xe03fffff_u32) |
                UInt32.new!(dad.to_int).&(0x7f_u32) << 22
      end

      unless oddfrm.nil?
        value = (value & 0xdfffffff_u32) |
                UInt32.new!(oddfrm.to_int).&(0x1_u32) << 29
      end

      unless chdis.nil?
        value = (value & 0xbfffffff_u32) |
                UInt32.new!(chdis.to_int).&(0x1_u32) << 30
      end

      unless chena.nil?
        value = (value & 0x7fffffff_u32) |
                UInt32.new!(chena.to_int).&(0x1_u32) << 31
      end

      self.class.new(value)
    end

    def self.set(
      *,
      mpsiz : UInt16? = nil,
      epnum : UInt8? = nil,
      epdir : Bool? = nil,
      lsdev : Bool? = nil,
      eptyp : UInt8? = nil,
      mc : UInt8? = nil,
      dad : UInt8? = nil,
      oddfrm : Bool? = nil,
      chdis : Bool? = nil,
      chena : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        mpsiz: mpsiz,
        epnum: epnum,
        epdir: epdir,
        lsdev: lsdev,
        eptyp: eptyp,
        mc: mc,
        dad: dad,
        oddfrm: oddfrm,
        chdis: chdis,
        chena: chena,
      )
    end
  end # struct

  # OTG_HS host channel-0 split control          register
  struct OTG_HS_HCSPLT0
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

    # Port address
    def prtaddr : UInt8
      UInt8.new!((@value >> 0) & 0x7f_u32)
    end

    # Port address
    def self.prtaddr : UInt8
      value.prtaddr
    end

    # Port address
    def self.prtaddr=(value : UInt8) : UInt8
      self.set(prtaddr: value)
      value
    end

    # Hub address
    def hubaddr : UInt8
      UInt8.new!((@value >> 7) & 0x7f_u32)
    end

    # Hub address
    def self.hubaddr : UInt8
      value.hubaddr
    end

    # Hub address
    def self.hubaddr=(value : UInt8) : UInt8
      self.set(hubaddr: value)
      value
    end

    # XACTPOS
    def xactpos : UInt8
      UInt8.new!((@value >> 14) & 0x3_u32)
    end

    # XACTPOS
    def self.xactpos : UInt8
      value.xactpos
    end

    # XACTPOS
    def self.xactpos=(value : UInt8) : UInt8
      self.set(xactpos: value)
      value
    end

    # Do complete split
    def complsplt : Bool
      @value.bits_set?(0x10000_u32)
    end

    # Do complete split
    def self.complsplt : Bool
      value.complsplt
    end

    # Do complete split
    def self.complsplt=(value : Bool) : Bool
      self.set(complsplt: value)
      value
    end

    # Split enable
    def spliten : Bool
      @value.bits_set?(0x80000000_u32)
    end

    # Split enable
    def self.spliten : Bool
      value.spliten
    end

    # Split enable
    def self.spliten=(value : Bool) : Bool
      self.set(spliten: value)
      value
    end

    def copy_with(
      *,

      prtaddr : UInt8? = nil,

      hubaddr : UInt8? = nil,

      xactpos : UInt8? = nil,

      complsplt : Bool? = nil,

      spliten : Bool? = nil
    ) : self
      value = @value

      unless prtaddr.nil?
        value = (value & 0xffffff80_u32) |
                UInt32.new!(prtaddr.to_int).&(0x7f_u32) << 0
      end

      unless hubaddr.nil?
        value = (value & 0xffffc07f_u32) |
                UInt32.new!(hubaddr.to_int).&(0x7f_u32) << 7
      end

      unless xactpos.nil?
        value = (value & 0xffff3fff_u32) |
                UInt32.new!(xactpos.to_int).&(0x3_u32) << 14
      end

      unless complsplt.nil?
        value = (value & 0xfffeffff_u32) |
                UInt32.new!(complsplt.to_int).&(0x1_u32) << 16
      end

      unless spliten.nil?
        value = (value & 0x7fffffff_u32) |
                UInt32.new!(spliten.to_int).&(0x1_u32) << 31
      end

      self.class.new(value)
    end

    def self.set(
      *,
      prtaddr : UInt8? = nil,
      hubaddr : UInt8? = nil,
      xactpos : UInt8? = nil,
      complsplt : Bool? = nil,
      spliten : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        prtaddr: prtaddr,
        hubaddr: hubaddr,
        xactpos: xactpos,
        complsplt: complsplt,
        spliten: spliten,
      )
    end
  end # struct

  # OTG_HS host channel-1 split control          register
  struct OTG_HS_HCSPLT1
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

    # Port address
    def prtaddr : UInt8
      UInt8.new!((@value >> 0) & 0x7f_u32)
    end

    # Port address
    def self.prtaddr : UInt8
      value.prtaddr
    end

    # Port address
    def self.prtaddr=(value : UInt8) : UInt8
      self.set(prtaddr: value)
      value
    end

    # Hub address
    def hubaddr : UInt8
      UInt8.new!((@value >> 7) & 0x7f_u32)
    end

    # Hub address
    def self.hubaddr : UInt8
      value.hubaddr
    end

    # Hub address
    def self.hubaddr=(value : UInt8) : UInt8
      self.set(hubaddr: value)
      value
    end

    # XACTPOS
    def xactpos : UInt8
      UInt8.new!((@value >> 14) & 0x3_u32)
    end

    # XACTPOS
    def self.xactpos : UInt8
      value.xactpos
    end

    # XACTPOS
    def self.xactpos=(value : UInt8) : UInt8
      self.set(xactpos: value)
      value
    end

    # Do complete split
    def complsplt : Bool
      @value.bits_set?(0x10000_u32)
    end

    # Do complete split
    def self.complsplt : Bool
      value.complsplt
    end

    # Do complete split
    def self.complsplt=(value : Bool) : Bool
      self.set(complsplt: value)
      value
    end

    # Split enable
    def spliten : Bool
      @value.bits_set?(0x80000000_u32)
    end

    # Split enable
    def self.spliten : Bool
      value.spliten
    end

    # Split enable
    def self.spliten=(value : Bool) : Bool
      self.set(spliten: value)
      value
    end

    def copy_with(
      *,

      prtaddr : UInt8? = nil,

      hubaddr : UInt8? = nil,

      xactpos : UInt8? = nil,

      complsplt : Bool? = nil,

      spliten : Bool? = nil
    ) : self
      value = @value

      unless prtaddr.nil?
        value = (value & 0xffffff80_u32) |
                UInt32.new!(prtaddr.to_int).&(0x7f_u32) << 0
      end

      unless hubaddr.nil?
        value = (value & 0xffffc07f_u32) |
                UInt32.new!(hubaddr.to_int).&(0x7f_u32) << 7
      end

      unless xactpos.nil?
        value = (value & 0xffff3fff_u32) |
                UInt32.new!(xactpos.to_int).&(0x3_u32) << 14
      end

      unless complsplt.nil?
        value = (value & 0xfffeffff_u32) |
                UInt32.new!(complsplt.to_int).&(0x1_u32) << 16
      end

      unless spliten.nil?
        value = (value & 0x7fffffff_u32) |
                UInt32.new!(spliten.to_int).&(0x1_u32) << 31
      end

      self.class.new(value)
    end

    def self.set(
      *,
      prtaddr : UInt8? = nil,
      hubaddr : UInt8? = nil,
      xactpos : UInt8? = nil,
      complsplt : Bool? = nil,
      spliten : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        prtaddr: prtaddr,
        hubaddr: hubaddr,
        xactpos: xactpos,
        complsplt: complsplt,
        spliten: spliten,
      )
    end
  end # struct

  # OTG_HS host channel-2 split control          register
  struct OTG_HS_HCSPLT2
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

    # Port address
    def prtaddr : UInt8
      UInt8.new!((@value >> 0) & 0x7f_u32)
    end

    # Port address
    def self.prtaddr : UInt8
      value.prtaddr
    end

    # Port address
    def self.prtaddr=(value : UInt8) : UInt8
      self.set(prtaddr: value)
      value
    end

    # Hub address
    def hubaddr : UInt8
      UInt8.new!((@value >> 7) & 0x7f_u32)
    end

    # Hub address
    def self.hubaddr : UInt8
      value.hubaddr
    end

    # Hub address
    def self.hubaddr=(value : UInt8) : UInt8
      self.set(hubaddr: value)
      value
    end

    # XACTPOS
    def xactpos : UInt8
      UInt8.new!((@value >> 14) & 0x3_u32)
    end

    # XACTPOS
    def self.xactpos : UInt8
      value.xactpos
    end

    # XACTPOS
    def self.xactpos=(value : UInt8) : UInt8
      self.set(xactpos: value)
      value
    end

    # Do complete split
    def complsplt : Bool
      @value.bits_set?(0x10000_u32)
    end

    # Do complete split
    def self.complsplt : Bool
      value.complsplt
    end

    # Do complete split
    def self.complsplt=(value : Bool) : Bool
      self.set(complsplt: value)
      value
    end

    # Split enable
    def spliten : Bool
      @value.bits_set?(0x80000000_u32)
    end

    # Split enable
    def self.spliten : Bool
      value.spliten
    end

    # Split enable
    def self.spliten=(value : Bool) : Bool
      self.set(spliten: value)
      value
    end

    def copy_with(
      *,

      prtaddr : UInt8? = nil,

      hubaddr : UInt8? = nil,

      xactpos : UInt8? = nil,

      complsplt : Bool? = nil,

      spliten : Bool? = nil
    ) : self
      value = @value

      unless prtaddr.nil?
        value = (value & 0xffffff80_u32) |
                UInt32.new!(prtaddr.to_int).&(0x7f_u32) << 0
      end

      unless hubaddr.nil?
        value = (value & 0xffffc07f_u32) |
                UInt32.new!(hubaddr.to_int).&(0x7f_u32) << 7
      end

      unless xactpos.nil?
        value = (value & 0xffff3fff_u32) |
                UInt32.new!(xactpos.to_int).&(0x3_u32) << 14
      end

      unless complsplt.nil?
        value = (value & 0xfffeffff_u32) |
                UInt32.new!(complsplt.to_int).&(0x1_u32) << 16
      end

      unless spliten.nil?
        value = (value & 0x7fffffff_u32) |
                UInt32.new!(spliten.to_int).&(0x1_u32) << 31
      end

      self.class.new(value)
    end

    def self.set(
      *,
      prtaddr : UInt8? = nil,
      hubaddr : UInt8? = nil,
      xactpos : UInt8? = nil,
      complsplt : Bool? = nil,
      spliten : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        prtaddr: prtaddr,
        hubaddr: hubaddr,
        xactpos: xactpos,
        complsplt: complsplt,
        spliten: spliten,
      )
    end
  end # struct

  # OTG_HS host channel-3 split control          register
  struct OTG_HS_HCSPLT3
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

    # Port address
    def prtaddr : UInt8
      UInt8.new!((@value >> 0) & 0x7f_u32)
    end

    # Port address
    def self.prtaddr : UInt8
      value.prtaddr
    end

    # Port address
    def self.prtaddr=(value : UInt8) : UInt8
      self.set(prtaddr: value)
      value
    end

    # Hub address
    def hubaddr : UInt8
      UInt8.new!((@value >> 7) & 0x7f_u32)
    end

    # Hub address
    def self.hubaddr : UInt8
      value.hubaddr
    end

    # Hub address
    def self.hubaddr=(value : UInt8) : UInt8
      self.set(hubaddr: value)
      value
    end

    # XACTPOS
    def xactpos : UInt8
      UInt8.new!((@value >> 14) & 0x3_u32)
    end

    # XACTPOS
    def self.xactpos : UInt8
      value.xactpos
    end

    # XACTPOS
    def self.xactpos=(value : UInt8) : UInt8
      self.set(xactpos: value)
      value
    end

    # Do complete split
    def complsplt : Bool
      @value.bits_set?(0x10000_u32)
    end

    # Do complete split
    def self.complsplt : Bool
      value.complsplt
    end

    # Do complete split
    def self.complsplt=(value : Bool) : Bool
      self.set(complsplt: value)
      value
    end

    # Split enable
    def spliten : Bool
      @value.bits_set?(0x80000000_u32)
    end

    # Split enable
    def self.spliten : Bool
      value.spliten
    end

    # Split enable
    def self.spliten=(value : Bool) : Bool
      self.set(spliten: value)
      value
    end

    def copy_with(
      *,

      prtaddr : UInt8? = nil,

      hubaddr : UInt8? = nil,

      xactpos : UInt8? = nil,

      complsplt : Bool? = nil,

      spliten : Bool? = nil
    ) : self
      value = @value

      unless prtaddr.nil?
        value = (value & 0xffffff80_u32) |
                UInt32.new!(prtaddr.to_int).&(0x7f_u32) << 0
      end

      unless hubaddr.nil?
        value = (value & 0xffffc07f_u32) |
                UInt32.new!(hubaddr.to_int).&(0x7f_u32) << 7
      end

      unless xactpos.nil?
        value = (value & 0xffff3fff_u32) |
                UInt32.new!(xactpos.to_int).&(0x3_u32) << 14
      end

      unless complsplt.nil?
        value = (value & 0xfffeffff_u32) |
                UInt32.new!(complsplt.to_int).&(0x1_u32) << 16
      end

      unless spliten.nil?
        value = (value & 0x7fffffff_u32) |
                UInt32.new!(spliten.to_int).&(0x1_u32) << 31
      end

      self.class.new(value)
    end

    def self.set(
      *,
      prtaddr : UInt8? = nil,
      hubaddr : UInt8? = nil,
      xactpos : UInt8? = nil,
      complsplt : Bool? = nil,
      spliten : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        prtaddr: prtaddr,
        hubaddr: hubaddr,
        xactpos: xactpos,
        complsplt: complsplt,
        spliten: spliten,
      )
    end
  end # struct

  # OTG_HS host channel-4 split control          register
  struct OTG_HS_HCSPLT4
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

    # Port address
    def prtaddr : UInt8
      UInt8.new!((@value >> 0) & 0x7f_u32)
    end

    # Port address
    def self.prtaddr : UInt8
      value.prtaddr
    end

    # Port address
    def self.prtaddr=(value : UInt8) : UInt8
      self.set(prtaddr: value)
      value
    end

    # Hub address
    def hubaddr : UInt8
      UInt8.new!((@value >> 7) & 0x7f_u32)
    end

    # Hub address
    def self.hubaddr : UInt8
      value.hubaddr
    end

    # Hub address
    def self.hubaddr=(value : UInt8) : UInt8
      self.set(hubaddr: value)
      value
    end

    # XACTPOS
    def xactpos : UInt8
      UInt8.new!((@value >> 14) & 0x3_u32)
    end

    # XACTPOS
    def self.xactpos : UInt8
      value.xactpos
    end

    # XACTPOS
    def self.xactpos=(value : UInt8) : UInt8
      self.set(xactpos: value)
      value
    end

    # Do complete split
    def complsplt : Bool
      @value.bits_set?(0x10000_u32)
    end

    # Do complete split
    def self.complsplt : Bool
      value.complsplt
    end

    # Do complete split
    def self.complsplt=(value : Bool) : Bool
      self.set(complsplt: value)
      value
    end

    # Split enable
    def spliten : Bool
      @value.bits_set?(0x80000000_u32)
    end

    # Split enable
    def self.spliten : Bool
      value.spliten
    end

    # Split enable
    def self.spliten=(value : Bool) : Bool
      self.set(spliten: value)
      value
    end

    def copy_with(
      *,

      prtaddr : UInt8? = nil,

      hubaddr : UInt8? = nil,

      xactpos : UInt8? = nil,

      complsplt : Bool? = nil,

      spliten : Bool? = nil
    ) : self
      value = @value

      unless prtaddr.nil?
        value = (value & 0xffffff80_u32) |
                UInt32.new!(prtaddr.to_int).&(0x7f_u32) << 0
      end

      unless hubaddr.nil?
        value = (value & 0xffffc07f_u32) |
                UInt32.new!(hubaddr.to_int).&(0x7f_u32) << 7
      end

      unless xactpos.nil?
        value = (value & 0xffff3fff_u32) |
                UInt32.new!(xactpos.to_int).&(0x3_u32) << 14
      end

      unless complsplt.nil?
        value = (value & 0xfffeffff_u32) |
                UInt32.new!(complsplt.to_int).&(0x1_u32) << 16
      end

      unless spliten.nil?
        value = (value & 0x7fffffff_u32) |
                UInt32.new!(spliten.to_int).&(0x1_u32) << 31
      end

      self.class.new(value)
    end

    def self.set(
      *,
      prtaddr : UInt8? = nil,
      hubaddr : UInt8? = nil,
      xactpos : UInt8? = nil,
      complsplt : Bool? = nil,
      spliten : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        prtaddr: prtaddr,
        hubaddr: hubaddr,
        xactpos: xactpos,
        complsplt: complsplt,
        spliten: spliten,
      )
    end
  end # struct

  # OTG_HS host channel-5 split control          register
  struct OTG_HS_HCSPLT5
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

    # Port address
    def prtaddr : UInt8
      UInt8.new!((@value >> 0) & 0x7f_u32)
    end

    # Port address
    def self.prtaddr : UInt8
      value.prtaddr
    end

    # Port address
    def self.prtaddr=(value : UInt8) : UInt8
      self.set(prtaddr: value)
      value
    end

    # Hub address
    def hubaddr : UInt8
      UInt8.new!((@value >> 7) & 0x7f_u32)
    end

    # Hub address
    def self.hubaddr : UInt8
      value.hubaddr
    end

    # Hub address
    def self.hubaddr=(value : UInt8) : UInt8
      self.set(hubaddr: value)
      value
    end

    # XACTPOS
    def xactpos : UInt8
      UInt8.new!((@value >> 14) & 0x3_u32)
    end

    # XACTPOS
    def self.xactpos : UInt8
      value.xactpos
    end

    # XACTPOS
    def self.xactpos=(value : UInt8) : UInt8
      self.set(xactpos: value)
      value
    end

    # Do complete split
    def complsplt : Bool
      @value.bits_set?(0x10000_u32)
    end

    # Do complete split
    def self.complsplt : Bool
      value.complsplt
    end

    # Do complete split
    def self.complsplt=(value : Bool) : Bool
      self.set(complsplt: value)
      value
    end

    # Split enable
    def spliten : Bool
      @value.bits_set?(0x80000000_u32)
    end

    # Split enable
    def self.spliten : Bool
      value.spliten
    end

    # Split enable
    def self.spliten=(value : Bool) : Bool
      self.set(spliten: value)
      value
    end

    def copy_with(
      *,

      prtaddr : UInt8? = nil,

      hubaddr : UInt8? = nil,

      xactpos : UInt8? = nil,

      complsplt : Bool? = nil,

      spliten : Bool? = nil
    ) : self
      value = @value

      unless prtaddr.nil?
        value = (value & 0xffffff80_u32) |
                UInt32.new!(prtaddr.to_int).&(0x7f_u32) << 0
      end

      unless hubaddr.nil?
        value = (value & 0xffffc07f_u32) |
                UInt32.new!(hubaddr.to_int).&(0x7f_u32) << 7
      end

      unless xactpos.nil?
        value = (value & 0xffff3fff_u32) |
                UInt32.new!(xactpos.to_int).&(0x3_u32) << 14
      end

      unless complsplt.nil?
        value = (value & 0xfffeffff_u32) |
                UInt32.new!(complsplt.to_int).&(0x1_u32) << 16
      end

      unless spliten.nil?
        value = (value & 0x7fffffff_u32) |
                UInt32.new!(spliten.to_int).&(0x1_u32) << 31
      end

      self.class.new(value)
    end

    def self.set(
      *,
      prtaddr : UInt8? = nil,
      hubaddr : UInt8? = nil,
      xactpos : UInt8? = nil,
      complsplt : Bool? = nil,
      spliten : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        prtaddr: prtaddr,
        hubaddr: hubaddr,
        xactpos: xactpos,
        complsplt: complsplt,
        spliten: spliten,
      )
    end
  end # struct

  # OTG_HS host channel-6 split control          register
  struct OTG_HS_HCSPLT6
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

    # Port address
    def prtaddr : UInt8
      UInt8.new!((@value >> 0) & 0x7f_u32)
    end

    # Port address
    def self.prtaddr : UInt8
      value.prtaddr
    end

    # Port address
    def self.prtaddr=(value : UInt8) : UInt8
      self.set(prtaddr: value)
      value
    end

    # Hub address
    def hubaddr : UInt8
      UInt8.new!((@value >> 7) & 0x7f_u32)
    end

    # Hub address
    def self.hubaddr : UInt8
      value.hubaddr
    end

    # Hub address
    def self.hubaddr=(value : UInt8) : UInt8
      self.set(hubaddr: value)
      value
    end

    # XACTPOS
    def xactpos : UInt8
      UInt8.new!((@value >> 14) & 0x3_u32)
    end

    # XACTPOS
    def self.xactpos : UInt8
      value.xactpos
    end

    # XACTPOS
    def self.xactpos=(value : UInt8) : UInt8
      self.set(xactpos: value)
      value
    end

    # Do complete split
    def complsplt : Bool
      @value.bits_set?(0x10000_u32)
    end

    # Do complete split
    def self.complsplt : Bool
      value.complsplt
    end

    # Do complete split
    def self.complsplt=(value : Bool) : Bool
      self.set(complsplt: value)
      value
    end

    # Split enable
    def spliten : Bool
      @value.bits_set?(0x80000000_u32)
    end

    # Split enable
    def self.spliten : Bool
      value.spliten
    end

    # Split enable
    def self.spliten=(value : Bool) : Bool
      self.set(spliten: value)
      value
    end

    def copy_with(
      *,

      prtaddr : UInt8? = nil,

      hubaddr : UInt8? = nil,

      xactpos : UInt8? = nil,

      complsplt : Bool? = nil,

      spliten : Bool? = nil
    ) : self
      value = @value

      unless prtaddr.nil?
        value = (value & 0xffffff80_u32) |
                UInt32.new!(prtaddr.to_int).&(0x7f_u32) << 0
      end

      unless hubaddr.nil?
        value = (value & 0xffffc07f_u32) |
                UInt32.new!(hubaddr.to_int).&(0x7f_u32) << 7
      end

      unless xactpos.nil?
        value = (value & 0xffff3fff_u32) |
                UInt32.new!(xactpos.to_int).&(0x3_u32) << 14
      end

      unless complsplt.nil?
        value = (value & 0xfffeffff_u32) |
                UInt32.new!(complsplt.to_int).&(0x1_u32) << 16
      end

      unless spliten.nil?
        value = (value & 0x7fffffff_u32) |
                UInt32.new!(spliten.to_int).&(0x1_u32) << 31
      end

      self.class.new(value)
    end

    def self.set(
      *,
      prtaddr : UInt8? = nil,
      hubaddr : UInt8? = nil,
      xactpos : UInt8? = nil,
      complsplt : Bool? = nil,
      spliten : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        prtaddr: prtaddr,
        hubaddr: hubaddr,
        xactpos: xactpos,
        complsplt: complsplt,
        spliten: spliten,
      )
    end
  end # struct

  # OTG_HS host channel-7 split control          register
  struct OTG_HS_HCSPLT7
    ADDRESS = BASE_ADDRESS + 0x1e4_u64

    protected def self.address : UInt64
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

    # Port address
    def prtaddr : UInt8
      UInt8.new!((@value >> 0) & 0x7f_u32)
    end

    # Port address
    def self.prtaddr : UInt8
      value.prtaddr
    end

    # Port address
    def self.prtaddr=(value : UInt8) : UInt8
      self.set(prtaddr: value)
      value
    end

    # Hub address
    def hubaddr : UInt8
      UInt8.new!((@value >> 7) & 0x7f_u32)
    end

    # Hub address
    def self.hubaddr : UInt8
      value.hubaddr
    end

    # Hub address
    def self.hubaddr=(value : UInt8) : UInt8
      self.set(hubaddr: value)
      value
    end

    # XACTPOS
    def xactpos : UInt8
      UInt8.new!((@value >> 14) & 0x3_u32)
    end

    # XACTPOS
    def self.xactpos : UInt8
      value.xactpos
    end

    # XACTPOS
    def self.xactpos=(value : UInt8) : UInt8
      self.set(xactpos: value)
      value
    end

    # Do complete split
    def complsplt : Bool
      @value.bits_set?(0x10000_u32)
    end

    # Do complete split
    def self.complsplt : Bool
      value.complsplt
    end

    # Do complete split
    def self.complsplt=(value : Bool) : Bool
      self.set(complsplt: value)
      value
    end

    # Split enable
    def spliten : Bool
      @value.bits_set?(0x80000000_u32)
    end

    # Split enable
    def self.spliten : Bool
      value.spliten
    end

    # Split enable
    def self.spliten=(value : Bool) : Bool
      self.set(spliten: value)
      value
    end

    def copy_with(
      *,

      prtaddr : UInt8? = nil,

      hubaddr : UInt8? = nil,

      xactpos : UInt8? = nil,

      complsplt : Bool? = nil,

      spliten : Bool? = nil
    ) : self
      value = @value

      unless prtaddr.nil?
        value = (value & 0xffffff80_u32) |
                UInt32.new!(prtaddr.to_int).&(0x7f_u32) << 0
      end

      unless hubaddr.nil?
        value = (value & 0xffffc07f_u32) |
                UInt32.new!(hubaddr.to_int).&(0x7f_u32) << 7
      end

      unless xactpos.nil?
        value = (value & 0xffff3fff_u32) |
                UInt32.new!(xactpos.to_int).&(0x3_u32) << 14
      end

      unless complsplt.nil?
        value = (value & 0xfffeffff_u32) |
                UInt32.new!(complsplt.to_int).&(0x1_u32) << 16
      end

      unless spliten.nil?
        value = (value & 0x7fffffff_u32) |
                UInt32.new!(spliten.to_int).&(0x1_u32) << 31
      end

      self.class.new(value)
    end

    def self.set(
      *,
      prtaddr : UInt8? = nil,
      hubaddr : UInt8? = nil,
      xactpos : UInt8? = nil,
      complsplt : Bool? = nil,
      spliten : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        prtaddr: prtaddr,
        hubaddr: hubaddr,
        xactpos: xactpos,
        complsplt: complsplt,
        spliten: spliten,
      )
    end
  end # struct

  # OTG_HS host channel-8 split control          register
  struct OTG_HS_HCSPLT8
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

    # Port address
    def prtaddr : UInt8
      UInt8.new!((@value >> 0) & 0x7f_u32)
    end

    # Port address
    def self.prtaddr : UInt8
      value.prtaddr
    end

    # Port address
    def self.prtaddr=(value : UInt8) : UInt8
      self.set(prtaddr: value)
      value
    end

    # Hub address
    def hubaddr : UInt8
      UInt8.new!((@value >> 7) & 0x7f_u32)
    end

    # Hub address
    def self.hubaddr : UInt8
      value.hubaddr
    end

    # Hub address
    def self.hubaddr=(value : UInt8) : UInt8
      self.set(hubaddr: value)
      value
    end

    # XACTPOS
    def xactpos : UInt8
      UInt8.new!((@value >> 14) & 0x3_u32)
    end

    # XACTPOS
    def self.xactpos : UInt8
      value.xactpos
    end

    # XACTPOS
    def self.xactpos=(value : UInt8) : UInt8
      self.set(xactpos: value)
      value
    end

    # Do complete split
    def complsplt : Bool
      @value.bits_set?(0x10000_u32)
    end

    # Do complete split
    def self.complsplt : Bool
      value.complsplt
    end

    # Do complete split
    def self.complsplt=(value : Bool) : Bool
      self.set(complsplt: value)
      value
    end

    # Split enable
    def spliten : Bool
      @value.bits_set?(0x80000000_u32)
    end

    # Split enable
    def self.spliten : Bool
      value.spliten
    end

    # Split enable
    def self.spliten=(value : Bool) : Bool
      self.set(spliten: value)
      value
    end

    def copy_with(
      *,

      prtaddr : UInt8? = nil,

      hubaddr : UInt8? = nil,

      xactpos : UInt8? = nil,

      complsplt : Bool? = nil,

      spliten : Bool? = nil
    ) : self
      value = @value

      unless prtaddr.nil?
        value = (value & 0xffffff80_u32) |
                UInt32.new!(prtaddr.to_int).&(0x7f_u32) << 0
      end

      unless hubaddr.nil?
        value = (value & 0xffffc07f_u32) |
                UInt32.new!(hubaddr.to_int).&(0x7f_u32) << 7
      end

      unless xactpos.nil?
        value = (value & 0xffff3fff_u32) |
                UInt32.new!(xactpos.to_int).&(0x3_u32) << 14
      end

      unless complsplt.nil?
        value = (value & 0xfffeffff_u32) |
                UInt32.new!(complsplt.to_int).&(0x1_u32) << 16
      end

      unless spliten.nil?
        value = (value & 0x7fffffff_u32) |
                UInt32.new!(spliten.to_int).&(0x1_u32) << 31
      end

      self.class.new(value)
    end

    def self.set(
      *,
      prtaddr : UInt8? = nil,
      hubaddr : UInt8? = nil,
      xactpos : UInt8? = nil,
      complsplt : Bool? = nil,
      spliten : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        prtaddr: prtaddr,
        hubaddr: hubaddr,
        xactpos: xactpos,
        complsplt: complsplt,
        spliten: spliten,
      )
    end
  end # struct

  # OTG_HS host channel-9 split control          register
  struct OTG_HS_HCSPLT9
    ADDRESS = BASE_ADDRESS + 0x224_u64

    protected def self.address : UInt64
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

    # Port address
    def prtaddr : UInt8
      UInt8.new!((@value >> 0) & 0x7f_u32)
    end

    # Port address
    def self.prtaddr : UInt8
      value.prtaddr
    end

    # Port address
    def self.prtaddr=(value : UInt8) : UInt8
      self.set(prtaddr: value)
      value
    end

    # Hub address
    def hubaddr : UInt8
      UInt8.new!((@value >> 7) & 0x7f_u32)
    end

    # Hub address
    def self.hubaddr : UInt8
      value.hubaddr
    end

    # Hub address
    def self.hubaddr=(value : UInt8) : UInt8
      self.set(hubaddr: value)
      value
    end

    # XACTPOS
    def xactpos : UInt8
      UInt8.new!((@value >> 14) & 0x3_u32)
    end

    # XACTPOS
    def self.xactpos : UInt8
      value.xactpos
    end

    # XACTPOS
    def self.xactpos=(value : UInt8) : UInt8
      self.set(xactpos: value)
      value
    end

    # Do complete split
    def complsplt : Bool
      @value.bits_set?(0x10000_u32)
    end

    # Do complete split
    def self.complsplt : Bool
      value.complsplt
    end

    # Do complete split
    def self.complsplt=(value : Bool) : Bool
      self.set(complsplt: value)
      value
    end

    # Split enable
    def spliten : Bool
      @value.bits_set?(0x80000000_u32)
    end

    # Split enable
    def self.spliten : Bool
      value.spliten
    end

    # Split enable
    def self.spliten=(value : Bool) : Bool
      self.set(spliten: value)
      value
    end

    def copy_with(
      *,

      prtaddr : UInt8? = nil,

      hubaddr : UInt8? = nil,

      xactpos : UInt8? = nil,

      complsplt : Bool? = nil,

      spliten : Bool? = nil
    ) : self
      value = @value

      unless prtaddr.nil?
        value = (value & 0xffffff80_u32) |
                UInt32.new!(prtaddr.to_int).&(0x7f_u32) << 0
      end

      unless hubaddr.nil?
        value = (value & 0xffffc07f_u32) |
                UInt32.new!(hubaddr.to_int).&(0x7f_u32) << 7
      end

      unless xactpos.nil?
        value = (value & 0xffff3fff_u32) |
                UInt32.new!(xactpos.to_int).&(0x3_u32) << 14
      end

      unless complsplt.nil?
        value = (value & 0xfffeffff_u32) |
                UInt32.new!(complsplt.to_int).&(0x1_u32) << 16
      end

      unless spliten.nil?
        value = (value & 0x7fffffff_u32) |
                UInt32.new!(spliten.to_int).&(0x1_u32) << 31
      end

      self.class.new(value)
    end

    def self.set(
      *,
      prtaddr : UInt8? = nil,
      hubaddr : UInt8? = nil,
      xactpos : UInt8? = nil,
      complsplt : Bool? = nil,
      spliten : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        prtaddr: prtaddr,
        hubaddr: hubaddr,
        xactpos: xactpos,
        complsplt: complsplt,
        spliten: spliten,
      )
    end
  end # struct

  # OTG_HS host channel-10 split control          register
  struct OTG_HS_HCSPLT10
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

    # Port address
    def prtaddr : UInt8
      UInt8.new!((@value >> 0) & 0x7f_u32)
    end

    # Port address
    def self.prtaddr : UInt8
      value.prtaddr
    end

    # Port address
    def self.prtaddr=(value : UInt8) : UInt8
      self.set(prtaddr: value)
      value
    end

    # Hub address
    def hubaddr : UInt8
      UInt8.new!((@value >> 7) & 0x7f_u32)
    end

    # Hub address
    def self.hubaddr : UInt8
      value.hubaddr
    end

    # Hub address
    def self.hubaddr=(value : UInt8) : UInt8
      self.set(hubaddr: value)
      value
    end

    # XACTPOS
    def xactpos : UInt8
      UInt8.new!((@value >> 14) & 0x3_u32)
    end

    # XACTPOS
    def self.xactpos : UInt8
      value.xactpos
    end

    # XACTPOS
    def self.xactpos=(value : UInt8) : UInt8
      self.set(xactpos: value)
      value
    end

    # Do complete split
    def complsplt : Bool
      @value.bits_set?(0x10000_u32)
    end

    # Do complete split
    def self.complsplt : Bool
      value.complsplt
    end

    # Do complete split
    def self.complsplt=(value : Bool) : Bool
      self.set(complsplt: value)
      value
    end

    # Split enable
    def spliten : Bool
      @value.bits_set?(0x80000000_u32)
    end

    # Split enable
    def self.spliten : Bool
      value.spliten
    end

    # Split enable
    def self.spliten=(value : Bool) : Bool
      self.set(spliten: value)
      value
    end

    def copy_with(
      *,

      prtaddr : UInt8? = nil,

      hubaddr : UInt8? = nil,

      xactpos : UInt8? = nil,

      complsplt : Bool? = nil,

      spliten : Bool? = nil
    ) : self
      value = @value

      unless prtaddr.nil?
        value = (value & 0xffffff80_u32) |
                UInt32.new!(prtaddr.to_int).&(0x7f_u32) << 0
      end

      unless hubaddr.nil?
        value = (value & 0xffffc07f_u32) |
                UInt32.new!(hubaddr.to_int).&(0x7f_u32) << 7
      end

      unless xactpos.nil?
        value = (value & 0xffff3fff_u32) |
                UInt32.new!(xactpos.to_int).&(0x3_u32) << 14
      end

      unless complsplt.nil?
        value = (value & 0xfffeffff_u32) |
                UInt32.new!(complsplt.to_int).&(0x1_u32) << 16
      end

      unless spliten.nil?
        value = (value & 0x7fffffff_u32) |
                UInt32.new!(spliten.to_int).&(0x1_u32) << 31
      end

      self.class.new(value)
    end

    def self.set(
      *,
      prtaddr : UInt8? = nil,
      hubaddr : UInt8? = nil,
      xactpos : UInt8? = nil,
      complsplt : Bool? = nil,
      spliten : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        prtaddr: prtaddr,
        hubaddr: hubaddr,
        xactpos: xactpos,
        complsplt: complsplt,
        spliten: spliten,
      )
    end
  end # struct

  # OTG_HS host channel-11 split control          register
  struct OTG_HS_HCSPLT11
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

    # Port address
    def prtaddr : UInt8
      UInt8.new!((@value >> 0) & 0x7f_u32)
    end

    # Port address
    def self.prtaddr : UInt8
      value.prtaddr
    end

    # Port address
    def self.prtaddr=(value : UInt8) : UInt8
      self.set(prtaddr: value)
      value
    end

    # Hub address
    def hubaddr : UInt8
      UInt8.new!((@value >> 7) & 0x7f_u32)
    end

    # Hub address
    def self.hubaddr : UInt8
      value.hubaddr
    end

    # Hub address
    def self.hubaddr=(value : UInt8) : UInt8
      self.set(hubaddr: value)
      value
    end

    # XACTPOS
    def xactpos : UInt8
      UInt8.new!((@value >> 14) & 0x3_u32)
    end

    # XACTPOS
    def self.xactpos : UInt8
      value.xactpos
    end

    # XACTPOS
    def self.xactpos=(value : UInt8) : UInt8
      self.set(xactpos: value)
      value
    end

    # Do complete split
    def complsplt : Bool
      @value.bits_set?(0x10000_u32)
    end

    # Do complete split
    def self.complsplt : Bool
      value.complsplt
    end

    # Do complete split
    def self.complsplt=(value : Bool) : Bool
      self.set(complsplt: value)
      value
    end

    # Split enable
    def spliten : Bool
      @value.bits_set?(0x80000000_u32)
    end

    # Split enable
    def self.spliten : Bool
      value.spliten
    end

    # Split enable
    def self.spliten=(value : Bool) : Bool
      self.set(spliten: value)
      value
    end

    def copy_with(
      *,

      prtaddr : UInt8? = nil,

      hubaddr : UInt8? = nil,

      xactpos : UInt8? = nil,

      complsplt : Bool? = nil,

      spliten : Bool? = nil
    ) : self
      value = @value

      unless prtaddr.nil?
        value = (value & 0xffffff80_u32) |
                UInt32.new!(prtaddr.to_int).&(0x7f_u32) << 0
      end

      unless hubaddr.nil?
        value = (value & 0xffffc07f_u32) |
                UInt32.new!(hubaddr.to_int).&(0x7f_u32) << 7
      end

      unless xactpos.nil?
        value = (value & 0xffff3fff_u32) |
                UInt32.new!(xactpos.to_int).&(0x3_u32) << 14
      end

      unless complsplt.nil?
        value = (value & 0xfffeffff_u32) |
                UInt32.new!(complsplt.to_int).&(0x1_u32) << 16
      end

      unless spliten.nil?
        value = (value & 0x7fffffff_u32) |
                UInt32.new!(spliten.to_int).&(0x1_u32) << 31
      end

      self.class.new(value)
    end

    def self.set(
      *,
      prtaddr : UInt8? = nil,
      hubaddr : UInt8? = nil,
      xactpos : UInt8? = nil,
      complsplt : Bool? = nil,
      spliten : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        prtaddr: prtaddr,
        hubaddr: hubaddr,
        xactpos: xactpos,
        complsplt: complsplt,
        spliten: spliten,
      )
    end
  end # struct

  # OTG_HS host channel-11 interrupt          register
  struct OTG_HS_HCINT0
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

    # Transfer completed
    def xfrc : Bool
      @value.bits_set?(0x1_u32)
    end

    # Transfer completed
    def self.xfrc : Bool
      value.xfrc
    end

    # Transfer completed
    def self.xfrc=(value : Bool) : Bool
      self.set(xfrc: value)
      value
    end

    # Channel halted
    def chh : Bool
      @value.bits_set?(0x2_u32)
    end

    # Channel halted
    def self.chh : Bool
      value.chh
    end

    # Channel halted
    def self.chh=(value : Bool) : Bool
      self.set(chh: value)
      value
    end

    # AHB error
    def ahberr : Bool
      @value.bits_set?(0x4_u32)
    end

    # AHB error
    def self.ahberr : Bool
      value.ahberr
    end

    # AHB error
    def self.ahberr=(value : Bool) : Bool
      self.set(ahberr: value)
      value
    end

    # STALL response received              interrupt
    def stall : Bool
      @value.bits_set?(0x8_u32)
    end

    # STALL response received              interrupt
    def self.stall : Bool
      value.stall
    end

    # STALL response received              interrupt
    def self.stall=(value : Bool) : Bool
      self.set(stall: value)
      value
    end

    # NAK response received              interrupt
    def nak : Bool
      @value.bits_set?(0x10_u32)
    end

    # NAK response received              interrupt
    def self.nak : Bool
      value.nak
    end

    # NAK response received              interrupt
    def self.nak=(value : Bool) : Bool
      self.set(nak: value)
      value
    end

    # ACK response received/transmitted              interrupt
    def ack : Bool
      @value.bits_set?(0x20_u32)
    end

    # ACK response received/transmitted              interrupt
    def self.ack : Bool
      value.ack
    end

    # ACK response received/transmitted              interrupt
    def self.ack=(value : Bool) : Bool
      self.set(ack: value)
      value
    end

    # Response received              interrupt
    def nyet : Bool
      @value.bits_set?(0x40_u32)
    end

    # Response received              interrupt
    def self.nyet : Bool
      value.nyet
    end

    # Response received              interrupt
    def self.nyet=(value : Bool) : Bool
      self.set(nyet: value)
      value
    end

    # Transaction error
    def txerr : Bool
      @value.bits_set?(0x80_u32)
    end

    # Transaction error
    def self.txerr : Bool
      value.txerr
    end

    # Transaction error
    def self.txerr=(value : Bool) : Bool
      self.set(txerr: value)
      value
    end

    # Babble error
    def bberr : Bool
      @value.bits_set?(0x100_u32)
    end

    # Babble error
    def self.bberr : Bool
      value.bberr
    end

    # Babble error
    def self.bberr=(value : Bool) : Bool
      self.set(bberr: value)
      value
    end

    # Frame overrun
    def frmor : Bool
      @value.bits_set?(0x200_u32)
    end

    # Frame overrun
    def self.frmor : Bool
      value.frmor
    end

    # Frame overrun
    def self.frmor=(value : Bool) : Bool
      self.set(frmor: value)
      value
    end

    # Data toggle error
    def dterr : Bool
      @value.bits_set?(0x400_u32)
    end

    # Data toggle error
    def self.dterr : Bool
      value.dterr
    end

    # Data toggle error
    def self.dterr=(value : Bool) : Bool
      self.set(dterr: value)
      value
    end

    def copy_with(
      *,

      xfrc : Bool? = nil,

      chh : Bool? = nil,

      ahberr : Bool? = nil,

      stall : Bool? = nil,

      nak : Bool? = nil,

      ack : Bool? = nil,

      nyet : Bool? = nil,

      txerr : Bool? = nil,

      bberr : Bool? = nil,

      frmor : Bool? = nil,

      dterr : Bool? = nil
    ) : self
      value = @value

      unless xfrc.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(xfrc.to_int).&(0x1_u32) << 0
      end

      unless chh.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(chh.to_int).&(0x1_u32) << 1
      end

      unless ahberr.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(ahberr.to_int).&(0x1_u32) << 2
      end

      unless stall.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(stall.to_int).&(0x1_u32) << 3
      end

      unless nak.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(nak.to_int).&(0x1_u32) << 4
      end

      unless ack.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(ack.to_int).&(0x1_u32) << 5
      end

      unless nyet.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(nyet.to_int).&(0x1_u32) << 6
      end

      unless txerr.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(txerr.to_int).&(0x1_u32) << 7
      end

      unless bberr.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(bberr.to_int).&(0x1_u32) << 8
      end

      unless frmor.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(frmor.to_int).&(0x1_u32) << 9
      end

      unless dterr.nil?
        value = (value & 0xfffffbff_u32) |
                UInt32.new!(dterr.to_int).&(0x1_u32) << 10
      end

      self.class.new(value)
    end

    def self.set(
      *,
      xfrc : Bool? = nil,
      chh : Bool? = nil,
      ahberr : Bool? = nil,
      stall : Bool? = nil,
      nak : Bool? = nil,
      ack : Bool? = nil,
      nyet : Bool? = nil,
      txerr : Bool? = nil,
      bberr : Bool? = nil,
      frmor : Bool? = nil,
      dterr : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        xfrc: xfrc,
        chh: chh,
        ahberr: ahberr,
        stall: stall,
        nak: nak,
        ack: ack,
        nyet: nyet,
        txerr: txerr,
        bberr: bberr,
        frmor: frmor,
        dterr: dterr,
      )
    end
  end # struct

  # OTG_HS host channel-1 interrupt          register
  struct OTG_HS_HCINT1
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

    # Transfer completed
    def xfrc : Bool
      @value.bits_set?(0x1_u32)
    end

    # Transfer completed
    def self.xfrc : Bool
      value.xfrc
    end

    # Transfer completed
    def self.xfrc=(value : Bool) : Bool
      self.set(xfrc: value)
      value
    end

    # Channel halted
    def chh : Bool
      @value.bits_set?(0x2_u32)
    end

    # Channel halted
    def self.chh : Bool
      value.chh
    end

    # Channel halted
    def self.chh=(value : Bool) : Bool
      self.set(chh: value)
      value
    end

    # AHB error
    def ahberr : Bool
      @value.bits_set?(0x4_u32)
    end

    # AHB error
    def self.ahberr : Bool
      value.ahberr
    end

    # AHB error
    def self.ahberr=(value : Bool) : Bool
      self.set(ahberr: value)
      value
    end

    # STALL response received              interrupt
    def stall : Bool
      @value.bits_set?(0x8_u32)
    end

    # STALL response received              interrupt
    def self.stall : Bool
      value.stall
    end

    # STALL response received              interrupt
    def self.stall=(value : Bool) : Bool
      self.set(stall: value)
      value
    end

    # NAK response received              interrupt
    def nak : Bool
      @value.bits_set?(0x10_u32)
    end

    # NAK response received              interrupt
    def self.nak : Bool
      value.nak
    end

    # NAK response received              interrupt
    def self.nak=(value : Bool) : Bool
      self.set(nak: value)
      value
    end

    # ACK response received/transmitted              interrupt
    def ack : Bool
      @value.bits_set?(0x20_u32)
    end

    # ACK response received/transmitted              interrupt
    def self.ack : Bool
      value.ack
    end

    # ACK response received/transmitted              interrupt
    def self.ack=(value : Bool) : Bool
      self.set(ack: value)
      value
    end

    # Response received              interrupt
    def nyet : Bool
      @value.bits_set?(0x40_u32)
    end

    # Response received              interrupt
    def self.nyet : Bool
      value.nyet
    end

    # Response received              interrupt
    def self.nyet=(value : Bool) : Bool
      self.set(nyet: value)
      value
    end

    # Transaction error
    def txerr : Bool
      @value.bits_set?(0x80_u32)
    end

    # Transaction error
    def self.txerr : Bool
      value.txerr
    end

    # Transaction error
    def self.txerr=(value : Bool) : Bool
      self.set(txerr: value)
      value
    end

    # Babble error
    def bberr : Bool
      @value.bits_set?(0x100_u32)
    end

    # Babble error
    def self.bberr : Bool
      value.bberr
    end

    # Babble error
    def self.bberr=(value : Bool) : Bool
      self.set(bberr: value)
      value
    end

    # Frame overrun
    def frmor : Bool
      @value.bits_set?(0x200_u32)
    end

    # Frame overrun
    def self.frmor : Bool
      value.frmor
    end

    # Frame overrun
    def self.frmor=(value : Bool) : Bool
      self.set(frmor: value)
      value
    end

    # Data toggle error
    def dterr : Bool
      @value.bits_set?(0x400_u32)
    end

    # Data toggle error
    def self.dterr : Bool
      value.dterr
    end

    # Data toggle error
    def self.dterr=(value : Bool) : Bool
      self.set(dterr: value)
      value
    end

    def copy_with(
      *,

      xfrc : Bool? = nil,

      chh : Bool? = nil,

      ahberr : Bool? = nil,

      stall : Bool? = nil,

      nak : Bool? = nil,

      ack : Bool? = nil,

      nyet : Bool? = nil,

      txerr : Bool? = nil,

      bberr : Bool? = nil,

      frmor : Bool? = nil,

      dterr : Bool? = nil
    ) : self
      value = @value

      unless xfrc.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(xfrc.to_int).&(0x1_u32) << 0
      end

      unless chh.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(chh.to_int).&(0x1_u32) << 1
      end

      unless ahberr.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(ahberr.to_int).&(0x1_u32) << 2
      end

      unless stall.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(stall.to_int).&(0x1_u32) << 3
      end

      unless nak.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(nak.to_int).&(0x1_u32) << 4
      end

      unless ack.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(ack.to_int).&(0x1_u32) << 5
      end

      unless nyet.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(nyet.to_int).&(0x1_u32) << 6
      end

      unless txerr.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(txerr.to_int).&(0x1_u32) << 7
      end

      unless bberr.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(bberr.to_int).&(0x1_u32) << 8
      end

      unless frmor.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(frmor.to_int).&(0x1_u32) << 9
      end

      unless dterr.nil?
        value = (value & 0xfffffbff_u32) |
                UInt32.new!(dterr.to_int).&(0x1_u32) << 10
      end

      self.class.new(value)
    end

    def self.set(
      *,
      xfrc : Bool? = nil,
      chh : Bool? = nil,
      ahberr : Bool? = nil,
      stall : Bool? = nil,
      nak : Bool? = nil,
      ack : Bool? = nil,
      nyet : Bool? = nil,
      txerr : Bool? = nil,
      bberr : Bool? = nil,
      frmor : Bool? = nil,
      dterr : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        xfrc: xfrc,
        chh: chh,
        ahberr: ahberr,
        stall: stall,
        nak: nak,
        ack: ack,
        nyet: nyet,
        txerr: txerr,
        bberr: bberr,
        frmor: frmor,
        dterr: dterr,
      )
    end
  end # struct

  # OTG_HS host channel-2 interrupt          register
  struct OTG_HS_HCINT2
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

    # Transfer completed
    def xfrc : Bool
      @value.bits_set?(0x1_u32)
    end

    # Transfer completed
    def self.xfrc : Bool
      value.xfrc
    end

    # Transfer completed
    def self.xfrc=(value : Bool) : Bool
      self.set(xfrc: value)
      value
    end

    # Channel halted
    def chh : Bool
      @value.bits_set?(0x2_u32)
    end

    # Channel halted
    def self.chh : Bool
      value.chh
    end

    # Channel halted
    def self.chh=(value : Bool) : Bool
      self.set(chh: value)
      value
    end

    # AHB error
    def ahberr : Bool
      @value.bits_set?(0x4_u32)
    end

    # AHB error
    def self.ahberr : Bool
      value.ahberr
    end

    # AHB error
    def self.ahberr=(value : Bool) : Bool
      self.set(ahberr: value)
      value
    end

    # STALL response received              interrupt
    def stall : Bool
      @value.bits_set?(0x8_u32)
    end

    # STALL response received              interrupt
    def self.stall : Bool
      value.stall
    end

    # STALL response received              interrupt
    def self.stall=(value : Bool) : Bool
      self.set(stall: value)
      value
    end

    # NAK response received              interrupt
    def nak : Bool
      @value.bits_set?(0x10_u32)
    end

    # NAK response received              interrupt
    def self.nak : Bool
      value.nak
    end

    # NAK response received              interrupt
    def self.nak=(value : Bool) : Bool
      self.set(nak: value)
      value
    end

    # ACK response received/transmitted              interrupt
    def ack : Bool
      @value.bits_set?(0x20_u32)
    end

    # ACK response received/transmitted              interrupt
    def self.ack : Bool
      value.ack
    end

    # ACK response received/transmitted              interrupt
    def self.ack=(value : Bool) : Bool
      self.set(ack: value)
      value
    end

    # Response received              interrupt
    def nyet : Bool
      @value.bits_set?(0x40_u32)
    end

    # Response received              interrupt
    def self.nyet : Bool
      value.nyet
    end

    # Response received              interrupt
    def self.nyet=(value : Bool) : Bool
      self.set(nyet: value)
      value
    end

    # Transaction error
    def txerr : Bool
      @value.bits_set?(0x80_u32)
    end

    # Transaction error
    def self.txerr : Bool
      value.txerr
    end

    # Transaction error
    def self.txerr=(value : Bool) : Bool
      self.set(txerr: value)
      value
    end

    # Babble error
    def bberr : Bool
      @value.bits_set?(0x100_u32)
    end

    # Babble error
    def self.bberr : Bool
      value.bberr
    end

    # Babble error
    def self.bberr=(value : Bool) : Bool
      self.set(bberr: value)
      value
    end

    # Frame overrun
    def frmor : Bool
      @value.bits_set?(0x200_u32)
    end

    # Frame overrun
    def self.frmor : Bool
      value.frmor
    end

    # Frame overrun
    def self.frmor=(value : Bool) : Bool
      self.set(frmor: value)
      value
    end

    # Data toggle error
    def dterr : Bool
      @value.bits_set?(0x400_u32)
    end

    # Data toggle error
    def self.dterr : Bool
      value.dterr
    end

    # Data toggle error
    def self.dterr=(value : Bool) : Bool
      self.set(dterr: value)
      value
    end

    def copy_with(
      *,

      xfrc : Bool? = nil,

      chh : Bool? = nil,

      ahberr : Bool? = nil,

      stall : Bool? = nil,

      nak : Bool? = nil,

      ack : Bool? = nil,

      nyet : Bool? = nil,

      txerr : Bool? = nil,

      bberr : Bool? = nil,

      frmor : Bool? = nil,

      dterr : Bool? = nil
    ) : self
      value = @value

      unless xfrc.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(xfrc.to_int).&(0x1_u32) << 0
      end

      unless chh.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(chh.to_int).&(0x1_u32) << 1
      end

      unless ahberr.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(ahberr.to_int).&(0x1_u32) << 2
      end

      unless stall.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(stall.to_int).&(0x1_u32) << 3
      end

      unless nak.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(nak.to_int).&(0x1_u32) << 4
      end

      unless ack.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(ack.to_int).&(0x1_u32) << 5
      end

      unless nyet.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(nyet.to_int).&(0x1_u32) << 6
      end

      unless txerr.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(txerr.to_int).&(0x1_u32) << 7
      end

      unless bberr.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(bberr.to_int).&(0x1_u32) << 8
      end

      unless frmor.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(frmor.to_int).&(0x1_u32) << 9
      end

      unless dterr.nil?
        value = (value & 0xfffffbff_u32) |
                UInt32.new!(dterr.to_int).&(0x1_u32) << 10
      end

      self.class.new(value)
    end

    def self.set(
      *,
      xfrc : Bool? = nil,
      chh : Bool? = nil,
      ahberr : Bool? = nil,
      stall : Bool? = nil,
      nak : Bool? = nil,
      ack : Bool? = nil,
      nyet : Bool? = nil,
      txerr : Bool? = nil,
      bberr : Bool? = nil,
      frmor : Bool? = nil,
      dterr : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        xfrc: xfrc,
        chh: chh,
        ahberr: ahberr,
        stall: stall,
        nak: nak,
        ack: ack,
        nyet: nyet,
        txerr: txerr,
        bberr: bberr,
        frmor: frmor,
        dterr: dterr,
      )
    end
  end # struct

  # OTG_HS host channel-3 interrupt          register
  struct OTG_HS_HCINT3
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

    # Transfer completed
    def xfrc : Bool
      @value.bits_set?(0x1_u32)
    end

    # Transfer completed
    def self.xfrc : Bool
      value.xfrc
    end

    # Transfer completed
    def self.xfrc=(value : Bool) : Bool
      self.set(xfrc: value)
      value
    end

    # Channel halted
    def chh : Bool
      @value.bits_set?(0x2_u32)
    end

    # Channel halted
    def self.chh : Bool
      value.chh
    end

    # Channel halted
    def self.chh=(value : Bool) : Bool
      self.set(chh: value)
      value
    end

    # AHB error
    def ahberr : Bool
      @value.bits_set?(0x4_u32)
    end

    # AHB error
    def self.ahberr : Bool
      value.ahberr
    end

    # AHB error
    def self.ahberr=(value : Bool) : Bool
      self.set(ahberr: value)
      value
    end

    # STALL response received              interrupt
    def stall : Bool
      @value.bits_set?(0x8_u32)
    end

    # STALL response received              interrupt
    def self.stall : Bool
      value.stall
    end

    # STALL response received              interrupt
    def self.stall=(value : Bool) : Bool
      self.set(stall: value)
      value
    end

    # NAK response received              interrupt
    def nak : Bool
      @value.bits_set?(0x10_u32)
    end

    # NAK response received              interrupt
    def self.nak : Bool
      value.nak
    end

    # NAK response received              interrupt
    def self.nak=(value : Bool) : Bool
      self.set(nak: value)
      value
    end

    # ACK response received/transmitted              interrupt
    def ack : Bool
      @value.bits_set?(0x20_u32)
    end

    # ACK response received/transmitted              interrupt
    def self.ack : Bool
      value.ack
    end

    # ACK response received/transmitted              interrupt
    def self.ack=(value : Bool) : Bool
      self.set(ack: value)
      value
    end

    # Response received              interrupt
    def nyet : Bool
      @value.bits_set?(0x40_u32)
    end

    # Response received              interrupt
    def self.nyet : Bool
      value.nyet
    end

    # Response received              interrupt
    def self.nyet=(value : Bool) : Bool
      self.set(nyet: value)
      value
    end

    # Transaction error
    def txerr : Bool
      @value.bits_set?(0x80_u32)
    end

    # Transaction error
    def self.txerr : Bool
      value.txerr
    end

    # Transaction error
    def self.txerr=(value : Bool) : Bool
      self.set(txerr: value)
      value
    end

    # Babble error
    def bberr : Bool
      @value.bits_set?(0x100_u32)
    end

    # Babble error
    def self.bberr : Bool
      value.bberr
    end

    # Babble error
    def self.bberr=(value : Bool) : Bool
      self.set(bberr: value)
      value
    end

    # Frame overrun
    def frmor : Bool
      @value.bits_set?(0x200_u32)
    end

    # Frame overrun
    def self.frmor : Bool
      value.frmor
    end

    # Frame overrun
    def self.frmor=(value : Bool) : Bool
      self.set(frmor: value)
      value
    end

    # Data toggle error
    def dterr : Bool
      @value.bits_set?(0x400_u32)
    end

    # Data toggle error
    def self.dterr : Bool
      value.dterr
    end

    # Data toggle error
    def self.dterr=(value : Bool) : Bool
      self.set(dterr: value)
      value
    end

    def copy_with(
      *,

      xfrc : Bool? = nil,

      chh : Bool? = nil,

      ahberr : Bool? = nil,

      stall : Bool? = nil,

      nak : Bool? = nil,

      ack : Bool? = nil,

      nyet : Bool? = nil,

      txerr : Bool? = nil,

      bberr : Bool? = nil,

      frmor : Bool? = nil,

      dterr : Bool? = nil
    ) : self
      value = @value

      unless xfrc.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(xfrc.to_int).&(0x1_u32) << 0
      end

      unless chh.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(chh.to_int).&(0x1_u32) << 1
      end

      unless ahberr.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(ahberr.to_int).&(0x1_u32) << 2
      end

      unless stall.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(stall.to_int).&(0x1_u32) << 3
      end

      unless nak.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(nak.to_int).&(0x1_u32) << 4
      end

      unless ack.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(ack.to_int).&(0x1_u32) << 5
      end

      unless nyet.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(nyet.to_int).&(0x1_u32) << 6
      end

      unless txerr.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(txerr.to_int).&(0x1_u32) << 7
      end

      unless bberr.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(bberr.to_int).&(0x1_u32) << 8
      end

      unless frmor.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(frmor.to_int).&(0x1_u32) << 9
      end

      unless dterr.nil?
        value = (value & 0xfffffbff_u32) |
                UInt32.new!(dterr.to_int).&(0x1_u32) << 10
      end

      self.class.new(value)
    end

    def self.set(
      *,
      xfrc : Bool? = nil,
      chh : Bool? = nil,
      ahberr : Bool? = nil,
      stall : Bool? = nil,
      nak : Bool? = nil,
      ack : Bool? = nil,
      nyet : Bool? = nil,
      txerr : Bool? = nil,
      bberr : Bool? = nil,
      frmor : Bool? = nil,
      dterr : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        xfrc: xfrc,
        chh: chh,
        ahberr: ahberr,
        stall: stall,
        nak: nak,
        ack: ack,
        nyet: nyet,
        txerr: txerr,
        bberr: bberr,
        frmor: frmor,
        dterr: dterr,
      )
    end
  end # struct

  # OTG_HS host channel-4 interrupt          register
  struct OTG_HS_HCINT4
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

    # Transfer completed
    def xfrc : Bool
      @value.bits_set?(0x1_u32)
    end

    # Transfer completed
    def self.xfrc : Bool
      value.xfrc
    end

    # Transfer completed
    def self.xfrc=(value : Bool) : Bool
      self.set(xfrc: value)
      value
    end

    # Channel halted
    def chh : Bool
      @value.bits_set?(0x2_u32)
    end

    # Channel halted
    def self.chh : Bool
      value.chh
    end

    # Channel halted
    def self.chh=(value : Bool) : Bool
      self.set(chh: value)
      value
    end

    # AHB error
    def ahberr : Bool
      @value.bits_set?(0x4_u32)
    end

    # AHB error
    def self.ahberr : Bool
      value.ahberr
    end

    # AHB error
    def self.ahberr=(value : Bool) : Bool
      self.set(ahberr: value)
      value
    end

    # STALL response received              interrupt
    def stall : Bool
      @value.bits_set?(0x8_u32)
    end

    # STALL response received              interrupt
    def self.stall : Bool
      value.stall
    end

    # STALL response received              interrupt
    def self.stall=(value : Bool) : Bool
      self.set(stall: value)
      value
    end

    # NAK response received              interrupt
    def nak : Bool
      @value.bits_set?(0x10_u32)
    end

    # NAK response received              interrupt
    def self.nak : Bool
      value.nak
    end

    # NAK response received              interrupt
    def self.nak=(value : Bool) : Bool
      self.set(nak: value)
      value
    end

    # ACK response received/transmitted              interrupt
    def ack : Bool
      @value.bits_set?(0x20_u32)
    end

    # ACK response received/transmitted              interrupt
    def self.ack : Bool
      value.ack
    end

    # ACK response received/transmitted              interrupt
    def self.ack=(value : Bool) : Bool
      self.set(ack: value)
      value
    end

    # Response received              interrupt
    def nyet : Bool
      @value.bits_set?(0x40_u32)
    end

    # Response received              interrupt
    def self.nyet : Bool
      value.nyet
    end

    # Response received              interrupt
    def self.nyet=(value : Bool) : Bool
      self.set(nyet: value)
      value
    end

    # Transaction error
    def txerr : Bool
      @value.bits_set?(0x80_u32)
    end

    # Transaction error
    def self.txerr : Bool
      value.txerr
    end

    # Transaction error
    def self.txerr=(value : Bool) : Bool
      self.set(txerr: value)
      value
    end

    # Babble error
    def bberr : Bool
      @value.bits_set?(0x100_u32)
    end

    # Babble error
    def self.bberr : Bool
      value.bberr
    end

    # Babble error
    def self.bberr=(value : Bool) : Bool
      self.set(bberr: value)
      value
    end

    # Frame overrun
    def frmor : Bool
      @value.bits_set?(0x200_u32)
    end

    # Frame overrun
    def self.frmor : Bool
      value.frmor
    end

    # Frame overrun
    def self.frmor=(value : Bool) : Bool
      self.set(frmor: value)
      value
    end

    # Data toggle error
    def dterr : Bool
      @value.bits_set?(0x400_u32)
    end

    # Data toggle error
    def self.dterr : Bool
      value.dterr
    end

    # Data toggle error
    def self.dterr=(value : Bool) : Bool
      self.set(dterr: value)
      value
    end

    def copy_with(
      *,

      xfrc : Bool? = nil,

      chh : Bool? = nil,

      ahberr : Bool? = nil,

      stall : Bool? = nil,

      nak : Bool? = nil,

      ack : Bool? = nil,

      nyet : Bool? = nil,

      txerr : Bool? = nil,

      bberr : Bool? = nil,

      frmor : Bool? = nil,

      dterr : Bool? = nil
    ) : self
      value = @value

      unless xfrc.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(xfrc.to_int).&(0x1_u32) << 0
      end

      unless chh.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(chh.to_int).&(0x1_u32) << 1
      end

      unless ahberr.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(ahberr.to_int).&(0x1_u32) << 2
      end

      unless stall.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(stall.to_int).&(0x1_u32) << 3
      end

      unless nak.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(nak.to_int).&(0x1_u32) << 4
      end

      unless ack.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(ack.to_int).&(0x1_u32) << 5
      end

      unless nyet.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(nyet.to_int).&(0x1_u32) << 6
      end

      unless txerr.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(txerr.to_int).&(0x1_u32) << 7
      end

      unless bberr.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(bberr.to_int).&(0x1_u32) << 8
      end

      unless frmor.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(frmor.to_int).&(0x1_u32) << 9
      end

      unless dterr.nil?
        value = (value & 0xfffffbff_u32) |
                UInt32.new!(dterr.to_int).&(0x1_u32) << 10
      end

      self.class.new(value)
    end

    def self.set(
      *,
      xfrc : Bool? = nil,
      chh : Bool? = nil,
      ahberr : Bool? = nil,
      stall : Bool? = nil,
      nak : Bool? = nil,
      ack : Bool? = nil,
      nyet : Bool? = nil,
      txerr : Bool? = nil,
      bberr : Bool? = nil,
      frmor : Bool? = nil,
      dterr : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        xfrc: xfrc,
        chh: chh,
        ahberr: ahberr,
        stall: stall,
        nak: nak,
        ack: ack,
        nyet: nyet,
        txerr: txerr,
        bberr: bberr,
        frmor: frmor,
        dterr: dterr,
      )
    end
  end # struct

  # OTG_HS host channel-5 interrupt          register
  struct OTG_HS_HCINT5
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

    # Transfer completed
    def xfrc : Bool
      @value.bits_set?(0x1_u32)
    end

    # Transfer completed
    def self.xfrc : Bool
      value.xfrc
    end

    # Transfer completed
    def self.xfrc=(value : Bool) : Bool
      self.set(xfrc: value)
      value
    end

    # Channel halted
    def chh : Bool
      @value.bits_set?(0x2_u32)
    end

    # Channel halted
    def self.chh : Bool
      value.chh
    end

    # Channel halted
    def self.chh=(value : Bool) : Bool
      self.set(chh: value)
      value
    end

    # AHB error
    def ahberr : Bool
      @value.bits_set?(0x4_u32)
    end

    # AHB error
    def self.ahberr : Bool
      value.ahberr
    end

    # AHB error
    def self.ahberr=(value : Bool) : Bool
      self.set(ahberr: value)
      value
    end

    # STALL response received              interrupt
    def stall : Bool
      @value.bits_set?(0x8_u32)
    end

    # STALL response received              interrupt
    def self.stall : Bool
      value.stall
    end

    # STALL response received              interrupt
    def self.stall=(value : Bool) : Bool
      self.set(stall: value)
      value
    end

    # NAK response received              interrupt
    def nak : Bool
      @value.bits_set?(0x10_u32)
    end

    # NAK response received              interrupt
    def self.nak : Bool
      value.nak
    end

    # NAK response received              interrupt
    def self.nak=(value : Bool) : Bool
      self.set(nak: value)
      value
    end

    # ACK response received/transmitted              interrupt
    def ack : Bool
      @value.bits_set?(0x20_u32)
    end

    # ACK response received/transmitted              interrupt
    def self.ack : Bool
      value.ack
    end

    # ACK response received/transmitted              interrupt
    def self.ack=(value : Bool) : Bool
      self.set(ack: value)
      value
    end

    # Response received              interrupt
    def nyet : Bool
      @value.bits_set?(0x40_u32)
    end

    # Response received              interrupt
    def self.nyet : Bool
      value.nyet
    end

    # Response received              interrupt
    def self.nyet=(value : Bool) : Bool
      self.set(nyet: value)
      value
    end

    # Transaction error
    def txerr : Bool
      @value.bits_set?(0x80_u32)
    end

    # Transaction error
    def self.txerr : Bool
      value.txerr
    end

    # Transaction error
    def self.txerr=(value : Bool) : Bool
      self.set(txerr: value)
      value
    end

    # Babble error
    def bberr : Bool
      @value.bits_set?(0x100_u32)
    end

    # Babble error
    def self.bberr : Bool
      value.bberr
    end

    # Babble error
    def self.bberr=(value : Bool) : Bool
      self.set(bberr: value)
      value
    end

    # Frame overrun
    def frmor : Bool
      @value.bits_set?(0x200_u32)
    end

    # Frame overrun
    def self.frmor : Bool
      value.frmor
    end

    # Frame overrun
    def self.frmor=(value : Bool) : Bool
      self.set(frmor: value)
      value
    end

    # Data toggle error
    def dterr : Bool
      @value.bits_set?(0x400_u32)
    end

    # Data toggle error
    def self.dterr : Bool
      value.dterr
    end

    # Data toggle error
    def self.dterr=(value : Bool) : Bool
      self.set(dterr: value)
      value
    end

    def copy_with(
      *,

      xfrc : Bool? = nil,

      chh : Bool? = nil,

      ahberr : Bool? = nil,

      stall : Bool? = nil,

      nak : Bool? = nil,

      ack : Bool? = nil,

      nyet : Bool? = nil,

      txerr : Bool? = nil,

      bberr : Bool? = nil,

      frmor : Bool? = nil,

      dterr : Bool? = nil
    ) : self
      value = @value

      unless xfrc.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(xfrc.to_int).&(0x1_u32) << 0
      end

      unless chh.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(chh.to_int).&(0x1_u32) << 1
      end

      unless ahberr.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(ahberr.to_int).&(0x1_u32) << 2
      end

      unless stall.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(stall.to_int).&(0x1_u32) << 3
      end

      unless nak.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(nak.to_int).&(0x1_u32) << 4
      end

      unless ack.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(ack.to_int).&(0x1_u32) << 5
      end

      unless nyet.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(nyet.to_int).&(0x1_u32) << 6
      end

      unless txerr.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(txerr.to_int).&(0x1_u32) << 7
      end

      unless bberr.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(bberr.to_int).&(0x1_u32) << 8
      end

      unless frmor.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(frmor.to_int).&(0x1_u32) << 9
      end

      unless dterr.nil?
        value = (value & 0xfffffbff_u32) |
                UInt32.new!(dterr.to_int).&(0x1_u32) << 10
      end

      self.class.new(value)
    end

    def self.set(
      *,
      xfrc : Bool? = nil,
      chh : Bool? = nil,
      ahberr : Bool? = nil,
      stall : Bool? = nil,
      nak : Bool? = nil,
      ack : Bool? = nil,
      nyet : Bool? = nil,
      txerr : Bool? = nil,
      bberr : Bool? = nil,
      frmor : Bool? = nil,
      dterr : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        xfrc: xfrc,
        chh: chh,
        ahberr: ahberr,
        stall: stall,
        nak: nak,
        ack: ack,
        nyet: nyet,
        txerr: txerr,
        bberr: bberr,
        frmor: frmor,
        dterr: dterr,
      )
    end
  end # struct

  # OTG_HS host channel-6 interrupt          register
  struct OTG_HS_HCINT6
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

    # Transfer completed
    def xfrc : Bool
      @value.bits_set?(0x1_u32)
    end

    # Transfer completed
    def self.xfrc : Bool
      value.xfrc
    end

    # Transfer completed
    def self.xfrc=(value : Bool) : Bool
      self.set(xfrc: value)
      value
    end

    # Channel halted
    def chh : Bool
      @value.bits_set?(0x2_u32)
    end

    # Channel halted
    def self.chh : Bool
      value.chh
    end

    # Channel halted
    def self.chh=(value : Bool) : Bool
      self.set(chh: value)
      value
    end

    # AHB error
    def ahberr : Bool
      @value.bits_set?(0x4_u32)
    end

    # AHB error
    def self.ahberr : Bool
      value.ahberr
    end

    # AHB error
    def self.ahberr=(value : Bool) : Bool
      self.set(ahberr: value)
      value
    end

    # STALL response received              interrupt
    def stall : Bool
      @value.bits_set?(0x8_u32)
    end

    # STALL response received              interrupt
    def self.stall : Bool
      value.stall
    end

    # STALL response received              interrupt
    def self.stall=(value : Bool) : Bool
      self.set(stall: value)
      value
    end

    # NAK response received              interrupt
    def nak : Bool
      @value.bits_set?(0x10_u32)
    end

    # NAK response received              interrupt
    def self.nak : Bool
      value.nak
    end

    # NAK response received              interrupt
    def self.nak=(value : Bool) : Bool
      self.set(nak: value)
      value
    end

    # ACK response received/transmitted              interrupt
    def ack : Bool
      @value.bits_set?(0x20_u32)
    end

    # ACK response received/transmitted              interrupt
    def self.ack : Bool
      value.ack
    end

    # ACK response received/transmitted              interrupt
    def self.ack=(value : Bool) : Bool
      self.set(ack: value)
      value
    end

    # Response received              interrupt
    def nyet : Bool
      @value.bits_set?(0x40_u32)
    end

    # Response received              interrupt
    def self.nyet : Bool
      value.nyet
    end

    # Response received              interrupt
    def self.nyet=(value : Bool) : Bool
      self.set(nyet: value)
      value
    end

    # Transaction error
    def txerr : Bool
      @value.bits_set?(0x80_u32)
    end

    # Transaction error
    def self.txerr : Bool
      value.txerr
    end

    # Transaction error
    def self.txerr=(value : Bool) : Bool
      self.set(txerr: value)
      value
    end

    # Babble error
    def bberr : Bool
      @value.bits_set?(0x100_u32)
    end

    # Babble error
    def self.bberr : Bool
      value.bberr
    end

    # Babble error
    def self.bberr=(value : Bool) : Bool
      self.set(bberr: value)
      value
    end

    # Frame overrun
    def frmor : Bool
      @value.bits_set?(0x200_u32)
    end

    # Frame overrun
    def self.frmor : Bool
      value.frmor
    end

    # Frame overrun
    def self.frmor=(value : Bool) : Bool
      self.set(frmor: value)
      value
    end

    # Data toggle error
    def dterr : Bool
      @value.bits_set?(0x400_u32)
    end

    # Data toggle error
    def self.dterr : Bool
      value.dterr
    end

    # Data toggle error
    def self.dterr=(value : Bool) : Bool
      self.set(dterr: value)
      value
    end

    def copy_with(
      *,

      xfrc : Bool? = nil,

      chh : Bool? = nil,

      ahberr : Bool? = nil,

      stall : Bool? = nil,

      nak : Bool? = nil,

      ack : Bool? = nil,

      nyet : Bool? = nil,

      txerr : Bool? = nil,

      bberr : Bool? = nil,

      frmor : Bool? = nil,

      dterr : Bool? = nil
    ) : self
      value = @value

      unless xfrc.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(xfrc.to_int).&(0x1_u32) << 0
      end

      unless chh.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(chh.to_int).&(0x1_u32) << 1
      end

      unless ahberr.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(ahberr.to_int).&(0x1_u32) << 2
      end

      unless stall.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(stall.to_int).&(0x1_u32) << 3
      end

      unless nak.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(nak.to_int).&(0x1_u32) << 4
      end

      unless ack.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(ack.to_int).&(0x1_u32) << 5
      end

      unless nyet.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(nyet.to_int).&(0x1_u32) << 6
      end

      unless txerr.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(txerr.to_int).&(0x1_u32) << 7
      end

      unless bberr.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(bberr.to_int).&(0x1_u32) << 8
      end

      unless frmor.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(frmor.to_int).&(0x1_u32) << 9
      end

      unless dterr.nil?
        value = (value & 0xfffffbff_u32) |
                UInt32.new!(dterr.to_int).&(0x1_u32) << 10
      end

      self.class.new(value)
    end

    def self.set(
      *,
      xfrc : Bool? = nil,
      chh : Bool? = nil,
      ahberr : Bool? = nil,
      stall : Bool? = nil,
      nak : Bool? = nil,
      ack : Bool? = nil,
      nyet : Bool? = nil,
      txerr : Bool? = nil,
      bberr : Bool? = nil,
      frmor : Bool? = nil,
      dterr : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        xfrc: xfrc,
        chh: chh,
        ahberr: ahberr,
        stall: stall,
        nak: nak,
        ack: ack,
        nyet: nyet,
        txerr: txerr,
        bberr: bberr,
        frmor: frmor,
        dterr: dterr,
      )
    end
  end # struct

  # OTG_HS host channel-7 interrupt          register
  struct OTG_HS_HCINT7
    ADDRESS = BASE_ADDRESS + 0x1e8_u64

    protected def self.address : UInt64
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

    # Transfer completed
    def xfrc : Bool
      @value.bits_set?(0x1_u32)
    end

    # Transfer completed
    def self.xfrc : Bool
      value.xfrc
    end

    # Transfer completed
    def self.xfrc=(value : Bool) : Bool
      self.set(xfrc: value)
      value
    end

    # Channel halted
    def chh : Bool
      @value.bits_set?(0x2_u32)
    end

    # Channel halted
    def self.chh : Bool
      value.chh
    end

    # Channel halted
    def self.chh=(value : Bool) : Bool
      self.set(chh: value)
      value
    end

    # AHB error
    def ahberr : Bool
      @value.bits_set?(0x4_u32)
    end

    # AHB error
    def self.ahberr : Bool
      value.ahberr
    end

    # AHB error
    def self.ahberr=(value : Bool) : Bool
      self.set(ahberr: value)
      value
    end

    # STALL response received              interrupt
    def stall : Bool
      @value.bits_set?(0x8_u32)
    end

    # STALL response received              interrupt
    def self.stall : Bool
      value.stall
    end

    # STALL response received              interrupt
    def self.stall=(value : Bool) : Bool
      self.set(stall: value)
      value
    end

    # NAK response received              interrupt
    def nak : Bool
      @value.bits_set?(0x10_u32)
    end

    # NAK response received              interrupt
    def self.nak : Bool
      value.nak
    end

    # NAK response received              interrupt
    def self.nak=(value : Bool) : Bool
      self.set(nak: value)
      value
    end

    # ACK response received/transmitted              interrupt
    def ack : Bool
      @value.bits_set?(0x20_u32)
    end

    # ACK response received/transmitted              interrupt
    def self.ack : Bool
      value.ack
    end

    # ACK response received/transmitted              interrupt
    def self.ack=(value : Bool) : Bool
      self.set(ack: value)
      value
    end

    # Response received              interrupt
    def nyet : Bool
      @value.bits_set?(0x40_u32)
    end

    # Response received              interrupt
    def self.nyet : Bool
      value.nyet
    end

    # Response received              interrupt
    def self.nyet=(value : Bool) : Bool
      self.set(nyet: value)
      value
    end

    # Transaction error
    def txerr : Bool
      @value.bits_set?(0x80_u32)
    end

    # Transaction error
    def self.txerr : Bool
      value.txerr
    end

    # Transaction error
    def self.txerr=(value : Bool) : Bool
      self.set(txerr: value)
      value
    end

    # Babble error
    def bberr : Bool
      @value.bits_set?(0x100_u32)
    end

    # Babble error
    def self.bberr : Bool
      value.bberr
    end

    # Babble error
    def self.bberr=(value : Bool) : Bool
      self.set(bberr: value)
      value
    end

    # Frame overrun
    def frmor : Bool
      @value.bits_set?(0x200_u32)
    end

    # Frame overrun
    def self.frmor : Bool
      value.frmor
    end

    # Frame overrun
    def self.frmor=(value : Bool) : Bool
      self.set(frmor: value)
      value
    end

    # Data toggle error
    def dterr : Bool
      @value.bits_set?(0x400_u32)
    end

    # Data toggle error
    def self.dterr : Bool
      value.dterr
    end

    # Data toggle error
    def self.dterr=(value : Bool) : Bool
      self.set(dterr: value)
      value
    end

    def copy_with(
      *,

      xfrc : Bool? = nil,

      chh : Bool? = nil,

      ahberr : Bool? = nil,

      stall : Bool? = nil,

      nak : Bool? = nil,

      ack : Bool? = nil,

      nyet : Bool? = nil,

      txerr : Bool? = nil,

      bberr : Bool? = nil,

      frmor : Bool? = nil,

      dterr : Bool? = nil
    ) : self
      value = @value

      unless xfrc.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(xfrc.to_int).&(0x1_u32) << 0
      end

      unless chh.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(chh.to_int).&(0x1_u32) << 1
      end

      unless ahberr.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(ahberr.to_int).&(0x1_u32) << 2
      end

      unless stall.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(stall.to_int).&(0x1_u32) << 3
      end

      unless nak.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(nak.to_int).&(0x1_u32) << 4
      end

      unless ack.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(ack.to_int).&(0x1_u32) << 5
      end

      unless nyet.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(nyet.to_int).&(0x1_u32) << 6
      end

      unless txerr.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(txerr.to_int).&(0x1_u32) << 7
      end

      unless bberr.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(bberr.to_int).&(0x1_u32) << 8
      end

      unless frmor.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(frmor.to_int).&(0x1_u32) << 9
      end

      unless dterr.nil?
        value = (value & 0xfffffbff_u32) |
                UInt32.new!(dterr.to_int).&(0x1_u32) << 10
      end

      self.class.new(value)
    end

    def self.set(
      *,
      xfrc : Bool? = nil,
      chh : Bool? = nil,
      ahberr : Bool? = nil,
      stall : Bool? = nil,
      nak : Bool? = nil,
      ack : Bool? = nil,
      nyet : Bool? = nil,
      txerr : Bool? = nil,
      bberr : Bool? = nil,
      frmor : Bool? = nil,
      dterr : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        xfrc: xfrc,
        chh: chh,
        ahberr: ahberr,
        stall: stall,
        nak: nak,
        ack: ack,
        nyet: nyet,
        txerr: txerr,
        bberr: bberr,
        frmor: frmor,
        dterr: dterr,
      )
    end
  end # struct

  # OTG_HS host channel-8 interrupt          register
  struct OTG_HS_HCINT8
    ADDRESS = BASE_ADDRESS + 0x208_u64

    protected def self.address : UInt64
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

    # Transfer completed
    def xfrc : Bool
      @value.bits_set?(0x1_u32)
    end

    # Transfer completed
    def self.xfrc : Bool
      value.xfrc
    end

    # Transfer completed
    def self.xfrc=(value : Bool) : Bool
      self.set(xfrc: value)
      value
    end

    # Channel halted
    def chh : Bool
      @value.bits_set?(0x2_u32)
    end

    # Channel halted
    def self.chh : Bool
      value.chh
    end

    # Channel halted
    def self.chh=(value : Bool) : Bool
      self.set(chh: value)
      value
    end

    # AHB error
    def ahberr : Bool
      @value.bits_set?(0x4_u32)
    end

    # AHB error
    def self.ahberr : Bool
      value.ahberr
    end

    # AHB error
    def self.ahberr=(value : Bool) : Bool
      self.set(ahberr: value)
      value
    end

    # STALL response received              interrupt
    def stall : Bool
      @value.bits_set?(0x8_u32)
    end

    # STALL response received              interrupt
    def self.stall : Bool
      value.stall
    end

    # STALL response received              interrupt
    def self.stall=(value : Bool) : Bool
      self.set(stall: value)
      value
    end

    # NAK response received              interrupt
    def nak : Bool
      @value.bits_set?(0x10_u32)
    end

    # NAK response received              interrupt
    def self.nak : Bool
      value.nak
    end

    # NAK response received              interrupt
    def self.nak=(value : Bool) : Bool
      self.set(nak: value)
      value
    end

    # ACK response received/transmitted              interrupt
    def ack : Bool
      @value.bits_set?(0x20_u32)
    end

    # ACK response received/transmitted              interrupt
    def self.ack : Bool
      value.ack
    end

    # ACK response received/transmitted              interrupt
    def self.ack=(value : Bool) : Bool
      self.set(ack: value)
      value
    end

    # Response received              interrupt
    def nyet : Bool
      @value.bits_set?(0x40_u32)
    end

    # Response received              interrupt
    def self.nyet : Bool
      value.nyet
    end

    # Response received              interrupt
    def self.nyet=(value : Bool) : Bool
      self.set(nyet: value)
      value
    end

    # Transaction error
    def txerr : Bool
      @value.bits_set?(0x80_u32)
    end

    # Transaction error
    def self.txerr : Bool
      value.txerr
    end

    # Transaction error
    def self.txerr=(value : Bool) : Bool
      self.set(txerr: value)
      value
    end

    # Babble error
    def bberr : Bool
      @value.bits_set?(0x100_u32)
    end

    # Babble error
    def self.bberr : Bool
      value.bberr
    end

    # Babble error
    def self.bberr=(value : Bool) : Bool
      self.set(bberr: value)
      value
    end

    # Frame overrun
    def frmor : Bool
      @value.bits_set?(0x200_u32)
    end

    # Frame overrun
    def self.frmor : Bool
      value.frmor
    end

    # Frame overrun
    def self.frmor=(value : Bool) : Bool
      self.set(frmor: value)
      value
    end

    # Data toggle error
    def dterr : Bool
      @value.bits_set?(0x400_u32)
    end

    # Data toggle error
    def self.dterr : Bool
      value.dterr
    end

    # Data toggle error
    def self.dterr=(value : Bool) : Bool
      self.set(dterr: value)
      value
    end

    def copy_with(
      *,

      xfrc : Bool? = nil,

      chh : Bool? = nil,

      ahberr : Bool? = nil,

      stall : Bool? = nil,

      nak : Bool? = nil,

      ack : Bool? = nil,

      nyet : Bool? = nil,

      txerr : Bool? = nil,

      bberr : Bool? = nil,

      frmor : Bool? = nil,

      dterr : Bool? = nil
    ) : self
      value = @value

      unless xfrc.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(xfrc.to_int).&(0x1_u32) << 0
      end

      unless chh.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(chh.to_int).&(0x1_u32) << 1
      end

      unless ahberr.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(ahberr.to_int).&(0x1_u32) << 2
      end

      unless stall.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(stall.to_int).&(0x1_u32) << 3
      end

      unless nak.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(nak.to_int).&(0x1_u32) << 4
      end

      unless ack.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(ack.to_int).&(0x1_u32) << 5
      end

      unless nyet.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(nyet.to_int).&(0x1_u32) << 6
      end

      unless txerr.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(txerr.to_int).&(0x1_u32) << 7
      end

      unless bberr.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(bberr.to_int).&(0x1_u32) << 8
      end

      unless frmor.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(frmor.to_int).&(0x1_u32) << 9
      end

      unless dterr.nil?
        value = (value & 0xfffffbff_u32) |
                UInt32.new!(dterr.to_int).&(0x1_u32) << 10
      end

      self.class.new(value)
    end

    def self.set(
      *,
      xfrc : Bool? = nil,
      chh : Bool? = nil,
      ahberr : Bool? = nil,
      stall : Bool? = nil,
      nak : Bool? = nil,
      ack : Bool? = nil,
      nyet : Bool? = nil,
      txerr : Bool? = nil,
      bberr : Bool? = nil,
      frmor : Bool? = nil,
      dterr : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        xfrc: xfrc,
        chh: chh,
        ahberr: ahberr,
        stall: stall,
        nak: nak,
        ack: ack,
        nyet: nyet,
        txerr: txerr,
        bberr: bberr,
        frmor: frmor,
        dterr: dterr,
      )
    end
  end # struct

  # OTG_HS host channel-9 interrupt          register
  struct OTG_HS_HCINT9
    ADDRESS = BASE_ADDRESS + 0x228_u64

    protected def self.address : UInt64
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

    # Transfer completed
    def xfrc : Bool
      @value.bits_set?(0x1_u32)
    end

    # Transfer completed
    def self.xfrc : Bool
      value.xfrc
    end

    # Transfer completed
    def self.xfrc=(value : Bool) : Bool
      self.set(xfrc: value)
      value
    end

    # Channel halted
    def chh : Bool
      @value.bits_set?(0x2_u32)
    end

    # Channel halted
    def self.chh : Bool
      value.chh
    end

    # Channel halted
    def self.chh=(value : Bool) : Bool
      self.set(chh: value)
      value
    end

    # AHB error
    def ahberr : Bool
      @value.bits_set?(0x4_u32)
    end

    # AHB error
    def self.ahberr : Bool
      value.ahberr
    end

    # AHB error
    def self.ahberr=(value : Bool) : Bool
      self.set(ahberr: value)
      value
    end

    # STALL response received              interrupt
    def stall : Bool
      @value.bits_set?(0x8_u32)
    end

    # STALL response received              interrupt
    def self.stall : Bool
      value.stall
    end

    # STALL response received              interrupt
    def self.stall=(value : Bool) : Bool
      self.set(stall: value)
      value
    end

    # NAK response received              interrupt
    def nak : Bool
      @value.bits_set?(0x10_u32)
    end

    # NAK response received              interrupt
    def self.nak : Bool
      value.nak
    end

    # NAK response received              interrupt
    def self.nak=(value : Bool) : Bool
      self.set(nak: value)
      value
    end

    # ACK response received/transmitted              interrupt
    def ack : Bool
      @value.bits_set?(0x20_u32)
    end

    # ACK response received/transmitted              interrupt
    def self.ack : Bool
      value.ack
    end

    # ACK response received/transmitted              interrupt
    def self.ack=(value : Bool) : Bool
      self.set(ack: value)
      value
    end

    # Response received              interrupt
    def nyet : Bool
      @value.bits_set?(0x40_u32)
    end

    # Response received              interrupt
    def self.nyet : Bool
      value.nyet
    end

    # Response received              interrupt
    def self.nyet=(value : Bool) : Bool
      self.set(nyet: value)
      value
    end

    # Transaction error
    def txerr : Bool
      @value.bits_set?(0x80_u32)
    end

    # Transaction error
    def self.txerr : Bool
      value.txerr
    end

    # Transaction error
    def self.txerr=(value : Bool) : Bool
      self.set(txerr: value)
      value
    end

    # Babble error
    def bberr : Bool
      @value.bits_set?(0x100_u32)
    end

    # Babble error
    def self.bberr : Bool
      value.bberr
    end

    # Babble error
    def self.bberr=(value : Bool) : Bool
      self.set(bberr: value)
      value
    end

    # Frame overrun
    def frmor : Bool
      @value.bits_set?(0x200_u32)
    end

    # Frame overrun
    def self.frmor : Bool
      value.frmor
    end

    # Frame overrun
    def self.frmor=(value : Bool) : Bool
      self.set(frmor: value)
      value
    end

    # Data toggle error
    def dterr : Bool
      @value.bits_set?(0x400_u32)
    end

    # Data toggle error
    def self.dterr : Bool
      value.dterr
    end

    # Data toggle error
    def self.dterr=(value : Bool) : Bool
      self.set(dterr: value)
      value
    end

    def copy_with(
      *,

      xfrc : Bool? = nil,

      chh : Bool? = nil,

      ahberr : Bool? = nil,

      stall : Bool? = nil,

      nak : Bool? = nil,

      ack : Bool? = nil,

      nyet : Bool? = nil,

      txerr : Bool? = nil,

      bberr : Bool? = nil,

      frmor : Bool? = nil,

      dterr : Bool? = nil
    ) : self
      value = @value

      unless xfrc.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(xfrc.to_int).&(0x1_u32) << 0
      end

      unless chh.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(chh.to_int).&(0x1_u32) << 1
      end

      unless ahberr.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(ahberr.to_int).&(0x1_u32) << 2
      end

      unless stall.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(stall.to_int).&(0x1_u32) << 3
      end

      unless nak.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(nak.to_int).&(0x1_u32) << 4
      end

      unless ack.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(ack.to_int).&(0x1_u32) << 5
      end

      unless nyet.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(nyet.to_int).&(0x1_u32) << 6
      end

      unless txerr.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(txerr.to_int).&(0x1_u32) << 7
      end

      unless bberr.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(bberr.to_int).&(0x1_u32) << 8
      end

      unless frmor.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(frmor.to_int).&(0x1_u32) << 9
      end

      unless dterr.nil?
        value = (value & 0xfffffbff_u32) |
                UInt32.new!(dterr.to_int).&(0x1_u32) << 10
      end

      self.class.new(value)
    end

    def self.set(
      *,
      xfrc : Bool? = nil,
      chh : Bool? = nil,
      ahberr : Bool? = nil,
      stall : Bool? = nil,
      nak : Bool? = nil,
      ack : Bool? = nil,
      nyet : Bool? = nil,
      txerr : Bool? = nil,
      bberr : Bool? = nil,
      frmor : Bool? = nil,
      dterr : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        xfrc: xfrc,
        chh: chh,
        ahberr: ahberr,
        stall: stall,
        nak: nak,
        ack: ack,
        nyet: nyet,
        txerr: txerr,
        bberr: bberr,
        frmor: frmor,
        dterr: dterr,
      )
    end
  end # struct

  # OTG_HS host channel-10 interrupt          register
  struct OTG_HS_HCINT10
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

    # Transfer completed
    def xfrc : Bool
      @value.bits_set?(0x1_u32)
    end

    # Transfer completed
    def self.xfrc : Bool
      value.xfrc
    end

    # Transfer completed
    def self.xfrc=(value : Bool) : Bool
      self.set(xfrc: value)
      value
    end

    # Channel halted
    def chh : Bool
      @value.bits_set?(0x2_u32)
    end

    # Channel halted
    def self.chh : Bool
      value.chh
    end

    # Channel halted
    def self.chh=(value : Bool) : Bool
      self.set(chh: value)
      value
    end

    # AHB error
    def ahberr : Bool
      @value.bits_set?(0x4_u32)
    end

    # AHB error
    def self.ahberr : Bool
      value.ahberr
    end

    # AHB error
    def self.ahberr=(value : Bool) : Bool
      self.set(ahberr: value)
      value
    end

    # STALL response received              interrupt
    def stall : Bool
      @value.bits_set?(0x8_u32)
    end

    # STALL response received              interrupt
    def self.stall : Bool
      value.stall
    end

    # STALL response received              interrupt
    def self.stall=(value : Bool) : Bool
      self.set(stall: value)
      value
    end

    # NAK response received              interrupt
    def nak : Bool
      @value.bits_set?(0x10_u32)
    end

    # NAK response received              interrupt
    def self.nak : Bool
      value.nak
    end

    # NAK response received              interrupt
    def self.nak=(value : Bool) : Bool
      self.set(nak: value)
      value
    end

    # ACK response received/transmitted              interrupt
    def ack : Bool
      @value.bits_set?(0x20_u32)
    end

    # ACK response received/transmitted              interrupt
    def self.ack : Bool
      value.ack
    end

    # ACK response received/transmitted              interrupt
    def self.ack=(value : Bool) : Bool
      self.set(ack: value)
      value
    end

    # Response received              interrupt
    def nyet : Bool
      @value.bits_set?(0x40_u32)
    end

    # Response received              interrupt
    def self.nyet : Bool
      value.nyet
    end

    # Response received              interrupt
    def self.nyet=(value : Bool) : Bool
      self.set(nyet: value)
      value
    end

    # Transaction error
    def txerr : Bool
      @value.bits_set?(0x80_u32)
    end

    # Transaction error
    def self.txerr : Bool
      value.txerr
    end

    # Transaction error
    def self.txerr=(value : Bool) : Bool
      self.set(txerr: value)
      value
    end

    # Babble error
    def bberr : Bool
      @value.bits_set?(0x100_u32)
    end

    # Babble error
    def self.bberr : Bool
      value.bberr
    end

    # Babble error
    def self.bberr=(value : Bool) : Bool
      self.set(bberr: value)
      value
    end

    # Frame overrun
    def frmor : Bool
      @value.bits_set?(0x200_u32)
    end

    # Frame overrun
    def self.frmor : Bool
      value.frmor
    end

    # Frame overrun
    def self.frmor=(value : Bool) : Bool
      self.set(frmor: value)
      value
    end

    # Data toggle error
    def dterr : Bool
      @value.bits_set?(0x400_u32)
    end

    # Data toggle error
    def self.dterr : Bool
      value.dterr
    end

    # Data toggle error
    def self.dterr=(value : Bool) : Bool
      self.set(dterr: value)
      value
    end

    def copy_with(
      *,

      xfrc : Bool? = nil,

      chh : Bool? = nil,

      ahberr : Bool? = nil,

      stall : Bool? = nil,

      nak : Bool? = nil,

      ack : Bool? = nil,

      nyet : Bool? = nil,

      txerr : Bool? = nil,

      bberr : Bool? = nil,

      frmor : Bool? = nil,

      dterr : Bool? = nil
    ) : self
      value = @value

      unless xfrc.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(xfrc.to_int).&(0x1_u32) << 0
      end

      unless chh.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(chh.to_int).&(0x1_u32) << 1
      end

      unless ahberr.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(ahberr.to_int).&(0x1_u32) << 2
      end

      unless stall.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(stall.to_int).&(0x1_u32) << 3
      end

      unless nak.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(nak.to_int).&(0x1_u32) << 4
      end

      unless ack.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(ack.to_int).&(0x1_u32) << 5
      end

      unless nyet.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(nyet.to_int).&(0x1_u32) << 6
      end

      unless txerr.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(txerr.to_int).&(0x1_u32) << 7
      end

      unless bberr.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(bberr.to_int).&(0x1_u32) << 8
      end

      unless frmor.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(frmor.to_int).&(0x1_u32) << 9
      end

      unless dterr.nil?
        value = (value & 0xfffffbff_u32) |
                UInt32.new!(dterr.to_int).&(0x1_u32) << 10
      end

      self.class.new(value)
    end

    def self.set(
      *,
      xfrc : Bool? = nil,
      chh : Bool? = nil,
      ahberr : Bool? = nil,
      stall : Bool? = nil,
      nak : Bool? = nil,
      ack : Bool? = nil,
      nyet : Bool? = nil,
      txerr : Bool? = nil,
      bberr : Bool? = nil,
      frmor : Bool? = nil,
      dterr : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        xfrc: xfrc,
        chh: chh,
        ahberr: ahberr,
        stall: stall,
        nak: nak,
        ack: ack,
        nyet: nyet,
        txerr: txerr,
        bberr: bberr,
        frmor: frmor,
        dterr: dterr,
      )
    end
  end # struct

  # OTG_HS host channel-11 interrupt          register
  struct OTG_HS_HCINT11
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

    # Transfer completed
    def xfrc : Bool
      @value.bits_set?(0x1_u32)
    end

    # Transfer completed
    def self.xfrc : Bool
      value.xfrc
    end

    # Transfer completed
    def self.xfrc=(value : Bool) : Bool
      self.set(xfrc: value)
      value
    end

    # Channel halted
    def chh : Bool
      @value.bits_set?(0x2_u32)
    end

    # Channel halted
    def self.chh : Bool
      value.chh
    end

    # Channel halted
    def self.chh=(value : Bool) : Bool
      self.set(chh: value)
      value
    end

    # AHB error
    def ahberr : Bool
      @value.bits_set?(0x4_u32)
    end

    # AHB error
    def self.ahberr : Bool
      value.ahberr
    end

    # AHB error
    def self.ahberr=(value : Bool) : Bool
      self.set(ahberr: value)
      value
    end

    # STALL response received              interrupt
    def stall : Bool
      @value.bits_set?(0x8_u32)
    end

    # STALL response received              interrupt
    def self.stall : Bool
      value.stall
    end

    # STALL response received              interrupt
    def self.stall=(value : Bool) : Bool
      self.set(stall: value)
      value
    end

    # NAK response received              interrupt
    def nak : Bool
      @value.bits_set?(0x10_u32)
    end

    # NAK response received              interrupt
    def self.nak : Bool
      value.nak
    end

    # NAK response received              interrupt
    def self.nak=(value : Bool) : Bool
      self.set(nak: value)
      value
    end

    # ACK response received/transmitted              interrupt
    def ack : Bool
      @value.bits_set?(0x20_u32)
    end

    # ACK response received/transmitted              interrupt
    def self.ack : Bool
      value.ack
    end

    # ACK response received/transmitted              interrupt
    def self.ack=(value : Bool) : Bool
      self.set(ack: value)
      value
    end

    # Response received              interrupt
    def nyet : Bool
      @value.bits_set?(0x40_u32)
    end

    # Response received              interrupt
    def self.nyet : Bool
      value.nyet
    end

    # Response received              interrupt
    def self.nyet=(value : Bool) : Bool
      self.set(nyet: value)
      value
    end

    # Transaction error
    def txerr : Bool
      @value.bits_set?(0x80_u32)
    end

    # Transaction error
    def self.txerr : Bool
      value.txerr
    end

    # Transaction error
    def self.txerr=(value : Bool) : Bool
      self.set(txerr: value)
      value
    end

    # Babble error
    def bberr : Bool
      @value.bits_set?(0x100_u32)
    end

    # Babble error
    def self.bberr : Bool
      value.bberr
    end

    # Babble error
    def self.bberr=(value : Bool) : Bool
      self.set(bberr: value)
      value
    end

    # Frame overrun
    def frmor : Bool
      @value.bits_set?(0x200_u32)
    end

    # Frame overrun
    def self.frmor : Bool
      value.frmor
    end

    # Frame overrun
    def self.frmor=(value : Bool) : Bool
      self.set(frmor: value)
      value
    end

    # Data toggle error
    def dterr : Bool
      @value.bits_set?(0x400_u32)
    end

    # Data toggle error
    def self.dterr : Bool
      value.dterr
    end

    # Data toggle error
    def self.dterr=(value : Bool) : Bool
      self.set(dterr: value)
      value
    end

    def copy_with(
      *,

      xfrc : Bool? = nil,

      chh : Bool? = nil,

      ahberr : Bool? = nil,

      stall : Bool? = nil,

      nak : Bool? = nil,

      ack : Bool? = nil,

      nyet : Bool? = nil,

      txerr : Bool? = nil,

      bberr : Bool? = nil,

      frmor : Bool? = nil,

      dterr : Bool? = nil
    ) : self
      value = @value

      unless xfrc.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(xfrc.to_int).&(0x1_u32) << 0
      end

      unless chh.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(chh.to_int).&(0x1_u32) << 1
      end

      unless ahberr.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(ahberr.to_int).&(0x1_u32) << 2
      end

      unless stall.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(stall.to_int).&(0x1_u32) << 3
      end

      unless nak.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(nak.to_int).&(0x1_u32) << 4
      end

      unless ack.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(ack.to_int).&(0x1_u32) << 5
      end

      unless nyet.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(nyet.to_int).&(0x1_u32) << 6
      end

      unless txerr.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(txerr.to_int).&(0x1_u32) << 7
      end

      unless bberr.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(bberr.to_int).&(0x1_u32) << 8
      end

      unless frmor.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(frmor.to_int).&(0x1_u32) << 9
      end

      unless dterr.nil?
        value = (value & 0xfffffbff_u32) |
                UInt32.new!(dterr.to_int).&(0x1_u32) << 10
      end

      self.class.new(value)
    end

    def self.set(
      *,
      xfrc : Bool? = nil,
      chh : Bool? = nil,
      ahberr : Bool? = nil,
      stall : Bool? = nil,
      nak : Bool? = nil,
      ack : Bool? = nil,
      nyet : Bool? = nil,
      txerr : Bool? = nil,
      bberr : Bool? = nil,
      frmor : Bool? = nil,
      dterr : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        xfrc: xfrc,
        chh: chh,
        ahberr: ahberr,
        stall: stall,
        nak: nak,
        ack: ack,
        nyet: nyet,
        txerr: txerr,
        bberr: bberr,
        frmor: frmor,
        dterr: dterr,
      )
    end
  end # struct

  # OTG_HS host channel-11 interrupt mask          register
  struct OTG_HS_HCINTMSK0
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

    # Transfer completed mask
    def xfrcm : Bool
      @value.bits_set?(0x1_u32)
    end

    # Transfer completed mask
    def self.xfrcm : Bool
      value.xfrcm
    end

    # Transfer completed mask
    def self.xfrcm=(value : Bool) : Bool
      self.set(xfrcm: value)
      value
    end

    # Channel halted mask
    def chhm : Bool
      @value.bits_set?(0x2_u32)
    end

    # Channel halted mask
    def self.chhm : Bool
      value.chhm
    end

    # Channel halted mask
    def self.chhm=(value : Bool) : Bool
      self.set(chhm: value)
      value
    end

    # AHB error
    def ahberr : Bool
      @value.bits_set?(0x4_u32)
    end

    # AHB error
    def self.ahberr : Bool
      value.ahberr
    end

    # AHB error
    def self.ahberr=(value : Bool) : Bool
      self.set(ahberr: value)
      value
    end

    # STALL response received interrupt              mask
    def stallm : Bool
      @value.bits_set?(0x8_u32)
    end

    # STALL response received interrupt              mask
    def self.stallm : Bool
      value.stallm
    end

    # STALL response received interrupt              mask
    def self.stallm=(value : Bool) : Bool
      self.set(stallm: value)
      value
    end

    # NAK response received interrupt              mask
    def nakm : Bool
      @value.bits_set?(0x10_u32)
    end

    # NAK response received interrupt              mask
    def self.nakm : Bool
      value.nakm
    end

    # NAK response received interrupt              mask
    def self.nakm=(value : Bool) : Bool
      self.set(nakm: value)
      value
    end

    # ACK response received/transmitted              interrupt mask
    def ackm : Bool
      @value.bits_set?(0x20_u32)
    end

    # ACK response received/transmitted              interrupt mask
    def self.ackm : Bool
      value.ackm
    end

    # ACK response received/transmitted              interrupt mask
    def self.ackm=(value : Bool) : Bool
      self.set(ackm: value)
      value
    end

    # response received interrupt              mask
    def nyet : Bool
      @value.bits_set?(0x40_u32)
    end

    # response received interrupt              mask
    def self.nyet : Bool
      value.nyet
    end

    # response received interrupt              mask
    def self.nyet=(value : Bool) : Bool
      self.set(nyet: value)
      value
    end

    # Transaction error mask
    def txerrm : Bool
      @value.bits_set?(0x80_u32)
    end

    # Transaction error mask
    def self.txerrm : Bool
      value.txerrm
    end

    # Transaction error mask
    def self.txerrm=(value : Bool) : Bool
      self.set(txerrm: value)
      value
    end

    # Babble error mask
    def bberrm : Bool
      @value.bits_set?(0x100_u32)
    end

    # Babble error mask
    def self.bberrm : Bool
      value.bberrm
    end

    # Babble error mask
    def self.bberrm=(value : Bool) : Bool
      self.set(bberrm: value)
      value
    end

    # Frame overrun mask
    def frmorm : Bool
      @value.bits_set?(0x200_u32)
    end

    # Frame overrun mask
    def self.frmorm : Bool
      value.frmorm
    end

    # Frame overrun mask
    def self.frmorm=(value : Bool) : Bool
      self.set(frmorm: value)
      value
    end

    # Data toggle error mask
    def dterrm : Bool
      @value.bits_set?(0x400_u32)
    end

    # Data toggle error mask
    def self.dterrm : Bool
      value.dterrm
    end

    # Data toggle error mask
    def self.dterrm=(value : Bool) : Bool
      self.set(dterrm: value)
      value
    end

    def copy_with(
      *,

      xfrcm : Bool? = nil,

      chhm : Bool? = nil,

      ahberr : Bool? = nil,

      stallm : Bool? = nil,

      nakm : Bool? = nil,

      ackm : Bool? = nil,

      nyet : Bool? = nil,

      txerrm : Bool? = nil,

      bberrm : Bool? = nil,

      frmorm : Bool? = nil,

      dterrm : Bool? = nil
    ) : self
      value = @value

      unless xfrcm.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(xfrcm.to_int).&(0x1_u32) << 0
      end

      unless chhm.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(chhm.to_int).&(0x1_u32) << 1
      end

      unless ahberr.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(ahberr.to_int).&(0x1_u32) << 2
      end

      unless stallm.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(stallm.to_int).&(0x1_u32) << 3
      end

      unless nakm.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(nakm.to_int).&(0x1_u32) << 4
      end

      unless ackm.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(ackm.to_int).&(0x1_u32) << 5
      end

      unless nyet.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(nyet.to_int).&(0x1_u32) << 6
      end

      unless txerrm.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(txerrm.to_int).&(0x1_u32) << 7
      end

      unless bberrm.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(bberrm.to_int).&(0x1_u32) << 8
      end

      unless frmorm.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(frmorm.to_int).&(0x1_u32) << 9
      end

      unless dterrm.nil?
        value = (value & 0xfffffbff_u32) |
                UInt32.new!(dterrm.to_int).&(0x1_u32) << 10
      end

      self.class.new(value)
    end

    def self.set(
      *,
      xfrcm : Bool? = nil,
      chhm : Bool? = nil,
      ahberr : Bool? = nil,
      stallm : Bool? = nil,
      nakm : Bool? = nil,
      ackm : Bool? = nil,
      nyet : Bool? = nil,
      txerrm : Bool? = nil,
      bberrm : Bool? = nil,
      frmorm : Bool? = nil,
      dterrm : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        xfrcm: xfrcm,
        chhm: chhm,
        ahberr: ahberr,
        stallm: stallm,
        nakm: nakm,
        ackm: ackm,
        nyet: nyet,
        txerrm: txerrm,
        bberrm: bberrm,
        frmorm: frmorm,
        dterrm: dterrm,
      )
    end
  end # struct

  # OTG_HS host channel-1 interrupt mask          register
  struct OTG_HS_HCINTMSK1
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

    # Transfer completed mask
    def xfrcm : Bool
      @value.bits_set?(0x1_u32)
    end

    # Transfer completed mask
    def self.xfrcm : Bool
      value.xfrcm
    end

    # Transfer completed mask
    def self.xfrcm=(value : Bool) : Bool
      self.set(xfrcm: value)
      value
    end

    # Channel halted mask
    def chhm : Bool
      @value.bits_set?(0x2_u32)
    end

    # Channel halted mask
    def self.chhm : Bool
      value.chhm
    end

    # Channel halted mask
    def self.chhm=(value : Bool) : Bool
      self.set(chhm: value)
      value
    end

    # AHB error
    def ahberr : Bool
      @value.bits_set?(0x4_u32)
    end

    # AHB error
    def self.ahberr : Bool
      value.ahberr
    end

    # AHB error
    def self.ahberr=(value : Bool) : Bool
      self.set(ahberr: value)
      value
    end

    # STALL response received interrupt              mask
    def stallm : Bool
      @value.bits_set?(0x8_u32)
    end

    # STALL response received interrupt              mask
    def self.stallm : Bool
      value.stallm
    end

    # STALL response received interrupt              mask
    def self.stallm=(value : Bool) : Bool
      self.set(stallm: value)
      value
    end

    # NAK response received interrupt              mask
    def nakm : Bool
      @value.bits_set?(0x10_u32)
    end

    # NAK response received interrupt              mask
    def self.nakm : Bool
      value.nakm
    end

    # NAK response received interrupt              mask
    def self.nakm=(value : Bool) : Bool
      self.set(nakm: value)
      value
    end

    # ACK response received/transmitted              interrupt mask
    def ackm : Bool
      @value.bits_set?(0x20_u32)
    end

    # ACK response received/transmitted              interrupt mask
    def self.ackm : Bool
      value.ackm
    end

    # ACK response received/transmitted              interrupt mask
    def self.ackm=(value : Bool) : Bool
      self.set(ackm: value)
      value
    end

    # response received interrupt              mask
    def nyet : Bool
      @value.bits_set?(0x40_u32)
    end

    # response received interrupt              mask
    def self.nyet : Bool
      value.nyet
    end

    # response received interrupt              mask
    def self.nyet=(value : Bool) : Bool
      self.set(nyet: value)
      value
    end

    # Transaction error mask
    def txerrm : Bool
      @value.bits_set?(0x80_u32)
    end

    # Transaction error mask
    def self.txerrm : Bool
      value.txerrm
    end

    # Transaction error mask
    def self.txerrm=(value : Bool) : Bool
      self.set(txerrm: value)
      value
    end

    # Babble error mask
    def bberrm : Bool
      @value.bits_set?(0x100_u32)
    end

    # Babble error mask
    def self.bberrm : Bool
      value.bberrm
    end

    # Babble error mask
    def self.bberrm=(value : Bool) : Bool
      self.set(bberrm: value)
      value
    end

    # Frame overrun mask
    def frmorm : Bool
      @value.bits_set?(0x200_u32)
    end

    # Frame overrun mask
    def self.frmorm : Bool
      value.frmorm
    end

    # Frame overrun mask
    def self.frmorm=(value : Bool) : Bool
      self.set(frmorm: value)
      value
    end

    # Data toggle error mask
    def dterrm : Bool
      @value.bits_set?(0x400_u32)
    end

    # Data toggle error mask
    def self.dterrm : Bool
      value.dterrm
    end

    # Data toggle error mask
    def self.dterrm=(value : Bool) : Bool
      self.set(dterrm: value)
      value
    end

    def copy_with(
      *,

      xfrcm : Bool? = nil,

      chhm : Bool? = nil,

      ahberr : Bool? = nil,

      stallm : Bool? = nil,

      nakm : Bool? = nil,

      ackm : Bool? = nil,

      nyet : Bool? = nil,

      txerrm : Bool? = nil,

      bberrm : Bool? = nil,

      frmorm : Bool? = nil,

      dterrm : Bool? = nil
    ) : self
      value = @value

      unless xfrcm.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(xfrcm.to_int).&(0x1_u32) << 0
      end

      unless chhm.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(chhm.to_int).&(0x1_u32) << 1
      end

      unless ahberr.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(ahberr.to_int).&(0x1_u32) << 2
      end

      unless stallm.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(stallm.to_int).&(0x1_u32) << 3
      end

      unless nakm.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(nakm.to_int).&(0x1_u32) << 4
      end

      unless ackm.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(ackm.to_int).&(0x1_u32) << 5
      end

      unless nyet.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(nyet.to_int).&(0x1_u32) << 6
      end

      unless txerrm.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(txerrm.to_int).&(0x1_u32) << 7
      end

      unless bberrm.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(bberrm.to_int).&(0x1_u32) << 8
      end

      unless frmorm.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(frmorm.to_int).&(0x1_u32) << 9
      end

      unless dterrm.nil?
        value = (value & 0xfffffbff_u32) |
                UInt32.new!(dterrm.to_int).&(0x1_u32) << 10
      end

      self.class.new(value)
    end

    def self.set(
      *,
      xfrcm : Bool? = nil,
      chhm : Bool? = nil,
      ahberr : Bool? = nil,
      stallm : Bool? = nil,
      nakm : Bool? = nil,
      ackm : Bool? = nil,
      nyet : Bool? = nil,
      txerrm : Bool? = nil,
      bberrm : Bool? = nil,
      frmorm : Bool? = nil,
      dterrm : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        xfrcm: xfrcm,
        chhm: chhm,
        ahberr: ahberr,
        stallm: stallm,
        nakm: nakm,
        ackm: ackm,
        nyet: nyet,
        txerrm: txerrm,
        bberrm: bberrm,
        frmorm: frmorm,
        dterrm: dterrm,
      )
    end
  end # struct

  # OTG_HS host channel-2 interrupt mask          register
  struct OTG_HS_HCINTMSK2
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

    # Transfer completed mask
    def xfrcm : Bool
      @value.bits_set?(0x1_u32)
    end

    # Transfer completed mask
    def self.xfrcm : Bool
      value.xfrcm
    end

    # Transfer completed mask
    def self.xfrcm=(value : Bool) : Bool
      self.set(xfrcm: value)
      value
    end

    # Channel halted mask
    def chhm : Bool
      @value.bits_set?(0x2_u32)
    end

    # Channel halted mask
    def self.chhm : Bool
      value.chhm
    end

    # Channel halted mask
    def self.chhm=(value : Bool) : Bool
      self.set(chhm: value)
      value
    end

    # AHB error
    def ahberr : Bool
      @value.bits_set?(0x4_u32)
    end

    # AHB error
    def self.ahberr : Bool
      value.ahberr
    end

    # AHB error
    def self.ahberr=(value : Bool) : Bool
      self.set(ahberr: value)
      value
    end

    # STALL response received interrupt              mask
    def stallm : Bool
      @value.bits_set?(0x8_u32)
    end

    # STALL response received interrupt              mask
    def self.stallm : Bool
      value.stallm
    end

    # STALL response received interrupt              mask
    def self.stallm=(value : Bool) : Bool
      self.set(stallm: value)
      value
    end

    # NAK response received interrupt              mask
    def nakm : Bool
      @value.bits_set?(0x10_u32)
    end

    # NAK response received interrupt              mask
    def self.nakm : Bool
      value.nakm
    end

    # NAK response received interrupt              mask
    def self.nakm=(value : Bool) : Bool
      self.set(nakm: value)
      value
    end

    # ACK response received/transmitted              interrupt mask
    def ackm : Bool
      @value.bits_set?(0x20_u32)
    end

    # ACK response received/transmitted              interrupt mask
    def self.ackm : Bool
      value.ackm
    end

    # ACK response received/transmitted              interrupt mask
    def self.ackm=(value : Bool) : Bool
      self.set(ackm: value)
      value
    end

    # response received interrupt              mask
    def nyet : Bool
      @value.bits_set?(0x40_u32)
    end

    # response received interrupt              mask
    def self.nyet : Bool
      value.nyet
    end

    # response received interrupt              mask
    def self.nyet=(value : Bool) : Bool
      self.set(nyet: value)
      value
    end

    # Transaction error mask
    def txerrm : Bool
      @value.bits_set?(0x80_u32)
    end

    # Transaction error mask
    def self.txerrm : Bool
      value.txerrm
    end

    # Transaction error mask
    def self.txerrm=(value : Bool) : Bool
      self.set(txerrm: value)
      value
    end

    # Babble error mask
    def bberrm : Bool
      @value.bits_set?(0x100_u32)
    end

    # Babble error mask
    def self.bberrm : Bool
      value.bberrm
    end

    # Babble error mask
    def self.bberrm=(value : Bool) : Bool
      self.set(bberrm: value)
      value
    end

    # Frame overrun mask
    def frmorm : Bool
      @value.bits_set?(0x200_u32)
    end

    # Frame overrun mask
    def self.frmorm : Bool
      value.frmorm
    end

    # Frame overrun mask
    def self.frmorm=(value : Bool) : Bool
      self.set(frmorm: value)
      value
    end

    # Data toggle error mask
    def dterrm : Bool
      @value.bits_set?(0x400_u32)
    end

    # Data toggle error mask
    def self.dterrm : Bool
      value.dterrm
    end

    # Data toggle error mask
    def self.dterrm=(value : Bool) : Bool
      self.set(dterrm: value)
      value
    end

    def copy_with(
      *,

      xfrcm : Bool? = nil,

      chhm : Bool? = nil,

      ahberr : Bool? = nil,

      stallm : Bool? = nil,

      nakm : Bool? = nil,

      ackm : Bool? = nil,

      nyet : Bool? = nil,

      txerrm : Bool? = nil,

      bberrm : Bool? = nil,

      frmorm : Bool? = nil,

      dterrm : Bool? = nil
    ) : self
      value = @value

      unless xfrcm.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(xfrcm.to_int).&(0x1_u32) << 0
      end

      unless chhm.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(chhm.to_int).&(0x1_u32) << 1
      end

      unless ahberr.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(ahberr.to_int).&(0x1_u32) << 2
      end

      unless stallm.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(stallm.to_int).&(0x1_u32) << 3
      end

      unless nakm.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(nakm.to_int).&(0x1_u32) << 4
      end

      unless ackm.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(ackm.to_int).&(0x1_u32) << 5
      end

      unless nyet.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(nyet.to_int).&(0x1_u32) << 6
      end

      unless txerrm.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(txerrm.to_int).&(0x1_u32) << 7
      end

      unless bberrm.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(bberrm.to_int).&(0x1_u32) << 8
      end

      unless frmorm.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(frmorm.to_int).&(0x1_u32) << 9
      end

      unless dterrm.nil?
        value = (value & 0xfffffbff_u32) |
                UInt32.new!(dterrm.to_int).&(0x1_u32) << 10
      end

      self.class.new(value)
    end

    def self.set(
      *,
      xfrcm : Bool? = nil,
      chhm : Bool? = nil,
      ahberr : Bool? = nil,
      stallm : Bool? = nil,
      nakm : Bool? = nil,
      ackm : Bool? = nil,
      nyet : Bool? = nil,
      txerrm : Bool? = nil,
      bberrm : Bool? = nil,
      frmorm : Bool? = nil,
      dterrm : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        xfrcm: xfrcm,
        chhm: chhm,
        ahberr: ahberr,
        stallm: stallm,
        nakm: nakm,
        ackm: ackm,
        nyet: nyet,
        txerrm: txerrm,
        bberrm: bberrm,
        frmorm: frmorm,
        dterrm: dterrm,
      )
    end
  end # struct

  # OTG_HS host channel-3 interrupt mask          register
  struct OTG_HS_HCINTMSK3
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

    # Transfer completed mask
    def xfrcm : Bool
      @value.bits_set?(0x1_u32)
    end

    # Transfer completed mask
    def self.xfrcm : Bool
      value.xfrcm
    end

    # Transfer completed mask
    def self.xfrcm=(value : Bool) : Bool
      self.set(xfrcm: value)
      value
    end

    # Channel halted mask
    def chhm : Bool
      @value.bits_set?(0x2_u32)
    end

    # Channel halted mask
    def self.chhm : Bool
      value.chhm
    end

    # Channel halted mask
    def self.chhm=(value : Bool) : Bool
      self.set(chhm: value)
      value
    end

    # AHB error
    def ahberr : Bool
      @value.bits_set?(0x4_u32)
    end

    # AHB error
    def self.ahberr : Bool
      value.ahberr
    end

    # AHB error
    def self.ahberr=(value : Bool) : Bool
      self.set(ahberr: value)
      value
    end

    # STALL response received interrupt              mask
    def stallm : Bool
      @value.bits_set?(0x8_u32)
    end

    # STALL response received interrupt              mask
    def self.stallm : Bool
      value.stallm
    end

    # STALL response received interrupt              mask
    def self.stallm=(value : Bool) : Bool
      self.set(stallm: value)
      value
    end

    # NAK response received interrupt              mask
    def nakm : Bool
      @value.bits_set?(0x10_u32)
    end

    # NAK response received interrupt              mask
    def self.nakm : Bool
      value.nakm
    end

    # NAK response received interrupt              mask
    def self.nakm=(value : Bool) : Bool
      self.set(nakm: value)
      value
    end

    # ACK response received/transmitted              interrupt mask
    def ackm : Bool
      @value.bits_set?(0x20_u32)
    end

    # ACK response received/transmitted              interrupt mask
    def self.ackm : Bool
      value.ackm
    end

    # ACK response received/transmitted              interrupt mask
    def self.ackm=(value : Bool) : Bool
      self.set(ackm: value)
      value
    end

    # response received interrupt              mask
    def nyet : Bool
      @value.bits_set?(0x40_u32)
    end

    # response received interrupt              mask
    def self.nyet : Bool
      value.nyet
    end

    # response received interrupt              mask
    def self.nyet=(value : Bool) : Bool
      self.set(nyet: value)
      value
    end

    # Transaction error mask
    def txerrm : Bool
      @value.bits_set?(0x80_u32)
    end

    # Transaction error mask
    def self.txerrm : Bool
      value.txerrm
    end

    # Transaction error mask
    def self.txerrm=(value : Bool) : Bool
      self.set(txerrm: value)
      value
    end

    # Babble error mask
    def bberrm : Bool
      @value.bits_set?(0x100_u32)
    end

    # Babble error mask
    def self.bberrm : Bool
      value.bberrm
    end

    # Babble error mask
    def self.bberrm=(value : Bool) : Bool
      self.set(bberrm: value)
      value
    end

    # Frame overrun mask
    def frmorm : Bool
      @value.bits_set?(0x200_u32)
    end

    # Frame overrun mask
    def self.frmorm : Bool
      value.frmorm
    end

    # Frame overrun mask
    def self.frmorm=(value : Bool) : Bool
      self.set(frmorm: value)
      value
    end

    # Data toggle error mask
    def dterrm : Bool
      @value.bits_set?(0x400_u32)
    end

    # Data toggle error mask
    def self.dterrm : Bool
      value.dterrm
    end

    # Data toggle error mask
    def self.dterrm=(value : Bool) : Bool
      self.set(dterrm: value)
      value
    end

    def copy_with(
      *,

      xfrcm : Bool? = nil,

      chhm : Bool? = nil,

      ahberr : Bool? = nil,

      stallm : Bool? = nil,

      nakm : Bool? = nil,

      ackm : Bool? = nil,

      nyet : Bool? = nil,

      txerrm : Bool? = nil,

      bberrm : Bool? = nil,

      frmorm : Bool? = nil,

      dterrm : Bool? = nil
    ) : self
      value = @value

      unless xfrcm.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(xfrcm.to_int).&(0x1_u32) << 0
      end

      unless chhm.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(chhm.to_int).&(0x1_u32) << 1
      end

      unless ahberr.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(ahberr.to_int).&(0x1_u32) << 2
      end

      unless stallm.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(stallm.to_int).&(0x1_u32) << 3
      end

      unless nakm.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(nakm.to_int).&(0x1_u32) << 4
      end

      unless ackm.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(ackm.to_int).&(0x1_u32) << 5
      end

      unless nyet.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(nyet.to_int).&(0x1_u32) << 6
      end

      unless txerrm.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(txerrm.to_int).&(0x1_u32) << 7
      end

      unless bberrm.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(bberrm.to_int).&(0x1_u32) << 8
      end

      unless frmorm.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(frmorm.to_int).&(0x1_u32) << 9
      end

      unless dterrm.nil?
        value = (value & 0xfffffbff_u32) |
                UInt32.new!(dterrm.to_int).&(0x1_u32) << 10
      end

      self.class.new(value)
    end

    def self.set(
      *,
      xfrcm : Bool? = nil,
      chhm : Bool? = nil,
      ahberr : Bool? = nil,
      stallm : Bool? = nil,
      nakm : Bool? = nil,
      ackm : Bool? = nil,
      nyet : Bool? = nil,
      txerrm : Bool? = nil,
      bberrm : Bool? = nil,
      frmorm : Bool? = nil,
      dterrm : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        xfrcm: xfrcm,
        chhm: chhm,
        ahberr: ahberr,
        stallm: stallm,
        nakm: nakm,
        ackm: ackm,
        nyet: nyet,
        txerrm: txerrm,
        bberrm: bberrm,
        frmorm: frmorm,
        dterrm: dterrm,
      )
    end
  end # struct

  # OTG_HS host channel-4 interrupt mask          register
  struct OTG_HS_HCINTMSK4
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

    # Transfer completed mask
    def xfrcm : Bool
      @value.bits_set?(0x1_u32)
    end

    # Transfer completed mask
    def self.xfrcm : Bool
      value.xfrcm
    end

    # Transfer completed mask
    def self.xfrcm=(value : Bool) : Bool
      self.set(xfrcm: value)
      value
    end

    # Channel halted mask
    def chhm : Bool
      @value.bits_set?(0x2_u32)
    end

    # Channel halted mask
    def self.chhm : Bool
      value.chhm
    end

    # Channel halted mask
    def self.chhm=(value : Bool) : Bool
      self.set(chhm: value)
      value
    end

    # AHB error
    def ahberr : Bool
      @value.bits_set?(0x4_u32)
    end

    # AHB error
    def self.ahberr : Bool
      value.ahberr
    end

    # AHB error
    def self.ahberr=(value : Bool) : Bool
      self.set(ahberr: value)
      value
    end

    # STALL response received interrupt              mask
    def stallm : Bool
      @value.bits_set?(0x8_u32)
    end

    # STALL response received interrupt              mask
    def self.stallm : Bool
      value.stallm
    end

    # STALL response received interrupt              mask
    def self.stallm=(value : Bool) : Bool
      self.set(stallm: value)
      value
    end

    # NAK response received interrupt              mask
    def nakm : Bool
      @value.bits_set?(0x10_u32)
    end

    # NAK response received interrupt              mask
    def self.nakm : Bool
      value.nakm
    end

    # NAK response received interrupt              mask
    def self.nakm=(value : Bool) : Bool
      self.set(nakm: value)
      value
    end

    # ACK response received/transmitted              interrupt mask
    def ackm : Bool
      @value.bits_set?(0x20_u32)
    end

    # ACK response received/transmitted              interrupt mask
    def self.ackm : Bool
      value.ackm
    end

    # ACK response received/transmitted              interrupt mask
    def self.ackm=(value : Bool) : Bool
      self.set(ackm: value)
      value
    end

    # response received interrupt              mask
    def nyet : Bool
      @value.bits_set?(0x40_u32)
    end

    # response received interrupt              mask
    def self.nyet : Bool
      value.nyet
    end

    # response received interrupt              mask
    def self.nyet=(value : Bool) : Bool
      self.set(nyet: value)
      value
    end

    # Transaction error mask
    def txerrm : Bool
      @value.bits_set?(0x80_u32)
    end

    # Transaction error mask
    def self.txerrm : Bool
      value.txerrm
    end

    # Transaction error mask
    def self.txerrm=(value : Bool) : Bool
      self.set(txerrm: value)
      value
    end

    # Babble error mask
    def bberrm : Bool
      @value.bits_set?(0x100_u32)
    end

    # Babble error mask
    def self.bberrm : Bool
      value.bberrm
    end

    # Babble error mask
    def self.bberrm=(value : Bool) : Bool
      self.set(bberrm: value)
      value
    end

    # Frame overrun mask
    def frmorm : Bool
      @value.bits_set?(0x200_u32)
    end

    # Frame overrun mask
    def self.frmorm : Bool
      value.frmorm
    end

    # Frame overrun mask
    def self.frmorm=(value : Bool) : Bool
      self.set(frmorm: value)
      value
    end

    # Data toggle error mask
    def dterrm : Bool
      @value.bits_set?(0x400_u32)
    end

    # Data toggle error mask
    def self.dterrm : Bool
      value.dterrm
    end

    # Data toggle error mask
    def self.dterrm=(value : Bool) : Bool
      self.set(dterrm: value)
      value
    end

    def copy_with(
      *,

      xfrcm : Bool? = nil,

      chhm : Bool? = nil,

      ahberr : Bool? = nil,

      stallm : Bool? = nil,

      nakm : Bool? = nil,

      ackm : Bool? = nil,

      nyet : Bool? = nil,

      txerrm : Bool? = nil,

      bberrm : Bool? = nil,

      frmorm : Bool? = nil,

      dterrm : Bool? = nil
    ) : self
      value = @value

      unless xfrcm.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(xfrcm.to_int).&(0x1_u32) << 0
      end

      unless chhm.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(chhm.to_int).&(0x1_u32) << 1
      end

      unless ahberr.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(ahberr.to_int).&(0x1_u32) << 2
      end

      unless stallm.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(stallm.to_int).&(0x1_u32) << 3
      end

      unless nakm.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(nakm.to_int).&(0x1_u32) << 4
      end

      unless ackm.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(ackm.to_int).&(0x1_u32) << 5
      end

      unless nyet.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(nyet.to_int).&(0x1_u32) << 6
      end

      unless txerrm.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(txerrm.to_int).&(0x1_u32) << 7
      end

      unless bberrm.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(bberrm.to_int).&(0x1_u32) << 8
      end

      unless frmorm.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(frmorm.to_int).&(0x1_u32) << 9
      end

      unless dterrm.nil?
        value = (value & 0xfffffbff_u32) |
                UInt32.new!(dterrm.to_int).&(0x1_u32) << 10
      end

      self.class.new(value)
    end

    def self.set(
      *,
      xfrcm : Bool? = nil,
      chhm : Bool? = nil,
      ahberr : Bool? = nil,
      stallm : Bool? = nil,
      nakm : Bool? = nil,
      ackm : Bool? = nil,
      nyet : Bool? = nil,
      txerrm : Bool? = nil,
      bberrm : Bool? = nil,
      frmorm : Bool? = nil,
      dterrm : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        xfrcm: xfrcm,
        chhm: chhm,
        ahberr: ahberr,
        stallm: stallm,
        nakm: nakm,
        ackm: ackm,
        nyet: nyet,
        txerrm: txerrm,
        bberrm: bberrm,
        frmorm: frmorm,
        dterrm: dterrm,
      )
    end
  end # struct

  # OTG_HS host channel-5 interrupt mask          register
  struct OTG_HS_HCINTMSK5
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

    # Transfer completed mask
    def xfrcm : Bool
      @value.bits_set?(0x1_u32)
    end

    # Transfer completed mask
    def self.xfrcm : Bool
      value.xfrcm
    end

    # Transfer completed mask
    def self.xfrcm=(value : Bool) : Bool
      self.set(xfrcm: value)
      value
    end

    # Channel halted mask
    def chhm : Bool
      @value.bits_set?(0x2_u32)
    end

    # Channel halted mask
    def self.chhm : Bool
      value.chhm
    end

    # Channel halted mask
    def self.chhm=(value : Bool) : Bool
      self.set(chhm: value)
      value
    end

    # AHB error
    def ahberr : Bool
      @value.bits_set?(0x4_u32)
    end

    # AHB error
    def self.ahberr : Bool
      value.ahberr
    end

    # AHB error
    def self.ahberr=(value : Bool) : Bool
      self.set(ahberr: value)
      value
    end

    # STALL response received interrupt              mask
    def stallm : Bool
      @value.bits_set?(0x8_u32)
    end

    # STALL response received interrupt              mask
    def self.stallm : Bool
      value.stallm
    end

    # STALL response received interrupt              mask
    def self.stallm=(value : Bool) : Bool
      self.set(stallm: value)
      value
    end

    # NAK response received interrupt              mask
    def nakm : Bool
      @value.bits_set?(0x10_u32)
    end

    # NAK response received interrupt              mask
    def self.nakm : Bool
      value.nakm
    end

    # NAK response received interrupt              mask
    def self.nakm=(value : Bool) : Bool
      self.set(nakm: value)
      value
    end

    # ACK response received/transmitted              interrupt mask
    def ackm : Bool
      @value.bits_set?(0x20_u32)
    end

    # ACK response received/transmitted              interrupt mask
    def self.ackm : Bool
      value.ackm
    end

    # ACK response received/transmitted              interrupt mask
    def self.ackm=(value : Bool) : Bool
      self.set(ackm: value)
      value
    end

    # response received interrupt              mask
    def nyet : Bool
      @value.bits_set?(0x40_u32)
    end

    # response received interrupt              mask
    def self.nyet : Bool
      value.nyet
    end

    # response received interrupt              mask
    def self.nyet=(value : Bool) : Bool
      self.set(nyet: value)
      value
    end

    # Transaction error mask
    def txerrm : Bool
      @value.bits_set?(0x80_u32)
    end

    # Transaction error mask
    def self.txerrm : Bool
      value.txerrm
    end

    # Transaction error mask
    def self.txerrm=(value : Bool) : Bool
      self.set(txerrm: value)
      value
    end

    # Babble error mask
    def bberrm : Bool
      @value.bits_set?(0x100_u32)
    end

    # Babble error mask
    def self.bberrm : Bool
      value.bberrm
    end

    # Babble error mask
    def self.bberrm=(value : Bool) : Bool
      self.set(bberrm: value)
      value
    end

    # Frame overrun mask
    def frmorm : Bool
      @value.bits_set?(0x200_u32)
    end

    # Frame overrun mask
    def self.frmorm : Bool
      value.frmorm
    end

    # Frame overrun mask
    def self.frmorm=(value : Bool) : Bool
      self.set(frmorm: value)
      value
    end

    # Data toggle error mask
    def dterrm : Bool
      @value.bits_set?(0x400_u32)
    end

    # Data toggle error mask
    def self.dterrm : Bool
      value.dterrm
    end

    # Data toggle error mask
    def self.dterrm=(value : Bool) : Bool
      self.set(dterrm: value)
      value
    end

    def copy_with(
      *,

      xfrcm : Bool? = nil,

      chhm : Bool? = nil,

      ahberr : Bool? = nil,

      stallm : Bool? = nil,

      nakm : Bool? = nil,

      ackm : Bool? = nil,

      nyet : Bool? = nil,

      txerrm : Bool? = nil,

      bberrm : Bool? = nil,

      frmorm : Bool? = nil,

      dterrm : Bool? = nil
    ) : self
      value = @value

      unless xfrcm.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(xfrcm.to_int).&(0x1_u32) << 0
      end

      unless chhm.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(chhm.to_int).&(0x1_u32) << 1
      end

      unless ahberr.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(ahberr.to_int).&(0x1_u32) << 2
      end

      unless stallm.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(stallm.to_int).&(0x1_u32) << 3
      end

      unless nakm.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(nakm.to_int).&(0x1_u32) << 4
      end

      unless ackm.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(ackm.to_int).&(0x1_u32) << 5
      end

      unless nyet.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(nyet.to_int).&(0x1_u32) << 6
      end

      unless txerrm.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(txerrm.to_int).&(0x1_u32) << 7
      end

      unless bberrm.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(bberrm.to_int).&(0x1_u32) << 8
      end

      unless frmorm.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(frmorm.to_int).&(0x1_u32) << 9
      end

      unless dterrm.nil?
        value = (value & 0xfffffbff_u32) |
                UInt32.new!(dterrm.to_int).&(0x1_u32) << 10
      end

      self.class.new(value)
    end

    def self.set(
      *,
      xfrcm : Bool? = nil,
      chhm : Bool? = nil,
      ahberr : Bool? = nil,
      stallm : Bool? = nil,
      nakm : Bool? = nil,
      ackm : Bool? = nil,
      nyet : Bool? = nil,
      txerrm : Bool? = nil,
      bberrm : Bool? = nil,
      frmorm : Bool? = nil,
      dterrm : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        xfrcm: xfrcm,
        chhm: chhm,
        ahberr: ahberr,
        stallm: stallm,
        nakm: nakm,
        ackm: ackm,
        nyet: nyet,
        txerrm: txerrm,
        bberrm: bberrm,
        frmorm: frmorm,
        dterrm: dterrm,
      )
    end
  end # struct

  # OTG_HS host channel-6 interrupt mask          register
  struct OTG_HS_HCINTMSK6
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

    # Transfer completed mask
    def xfrcm : Bool
      @value.bits_set?(0x1_u32)
    end

    # Transfer completed mask
    def self.xfrcm : Bool
      value.xfrcm
    end

    # Transfer completed mask
    def self.xfrcm=(value : Bool) : Bool
      self.set(xfrcm: value)
      value
    end

    # Channel halted mask
    def chhm : Bool
      @value.bits_set?(0x2_u32)
    end

    # Channel halted mask
    def self.chhm : Bool
      value.chhm
    end

    # Channel halted mask
    def self.chhm=(value : Bool) : Bool
      self.set(chhm: value)
      value
    end

    # AHB error
    def ahberr : Bool
      @value.bits_set?(0x4_u32)
    end

    # AHB error
    def self.ahberr : Bool
      value.ahberr
    end

    # AHB error
    def self.ahberr=(value : Bool) : Bool
      self.set(ahberr: value)
      value
    end

    # STALL response received interrupt              mask
    def stallm : Bool
      @value.bits_set?(0x8_u32)
    end

    # STALL response received interrupt              mask
    def self.stallm : Bool
      value.stallm
    end

    # STALL response received interrupt              mask
    def self.stallm=(value : Bool) : Bool
      self.set(stallm: value)
      value
    end

    # NAK response received interrupt              mask
    def nakm : Bool
      @value.bits_set?(0x10_u32)
    end

    # NAK response received interrupt              mask
    def self.nakm : Bool
      value.nakm
    end

    # NAK response received interrupt              mask
    def self.nakm=(value : Bool) : Bool
      self.set(nakm: value)
      value
    end

    # ACK response received/transmitted              interrupt mask
    def ackm : Bool
      @value.bits_set?(0x20_u32)
    end

    # ACK response received/transmitted              interrupt mask
    def self.ackm : Bool
      value.ackm
    end

    # ACK response received/transmitted              interrupt mask
    def self.ackm=(value : Bool) : Bool
      self.set(ackm: value)
      value
    end

    # response received interrupt              mask
    def nyet : Bool
      @value.bits_set?(0x40_u32)
    end

    # response received interrupt              mask
    def self.nyet : Bool
      value.nyet
    end

    # response received interrupt              mask
    def self.nyet=(value : Bool) : Bool
      self.set(nyet: value)
      value
    end

    # Transaction error mask
    def txerrm : Bool
      @value.bits_set?(0x80_u32)
    end

    # Transaction error mask
    def self.txerrm : Bool
      value.txerrm
    end

    # Transaction error mask
    def self.txerrm=(value : Bool) : Bool
      self.set(txerrm: value)
      value
    end

    # Babble error mask
    def bberrm : Bool
      @value.bits_set?(0x100_u32)
    end

    # Babble error mask
    def self.bberrm : Bool
      value.bberrm
    end

    # Babble error mask
    def self.bberrm=(value : Bool) : Bool
      self.set(bberrm: value)
      value
    end

    # Frame overrun mask
    def frmorm : Bool
      @value.bits_set?(0x200_u32)
    end

    # Frame overrun mask
    def self.frmorm : Bool
      value.frmorm
    end

    # Frame overrun mask
    def self.frmorm=(value : Bool) : Bool
      self.set(frmorm: value)
      value
    end

    # Data toggle error mask
    def dterrm : Bool
      @value.bits_set?(0x400_u32)
    end

    # Data toggle error mask
    def self.dterrm : Bool
      value.dterrm
    end

    # Data toggle error mask
    def self.dterrm=(value : Bool) : Bool
      self.set(dterrm: value)
      value
    end

    def copy_with(
      *,

      xfrcm : Bool? = nil,

      chhm : Bool? = nil,

      ahberr : Bool? = nil,

      stallm : Bool? = nil,

      nakm : Bool? = nil,

      ackm : Bool? = nil,

      nyet : Bool? = nil,

      txerrm : Bool? = nil,

      bberrm : Bool? = nil,

      frmorm : Bool? = nil,

      dterrm : Bool? = nil
    ) : self
      value = @value

      unless xfrcm.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(xfrcm.to_int).&(0x1_u32) << 0
      end

      unless chhm.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(chhm.to_int).&(0x1_u32) << 1
      end

      unless ahberr.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(ahberr.to_int).&(0x1_u32) << 2
      end

      unless stallm.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(stallm.to_int).&(0x1_u32) << 3
      end

      unless nakm.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(nakm.to_int).&(0x1_u32) << 4
      end

      unless ackm.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(ackm.to_int).&(0x1_u32) << 5
      end

      unless nyet.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(nyet.to_int).&(0x1_u32) << 6
      end

      unless txerrm.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(txerrm.to_int).&(0x1_u32) << 7
      end

      unless bberrm.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(bberrm.to_int).&(0x1_u32) << 8
      end

      unless frmorm.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(frmorm.to_int).&(0x1_u32) << 9
      end

      unless dterrm.nil?
        value = (value & 0xfffffbff_u32) |
                UInt32.new!(dterrm.to_int).&(0x1_u32) << 10
      end

      self.class.new(value)
    end

    def self.set(
      *,
      xfrcm : Bool? = nil,
      chhm : Bool? = nil,
      ahberr : Bool? = nil,
      stallm : Bool? = nil,
      nakm : Bool? = nil,
      ackm : Bool? = nil,
      nyet : Bool? = nil,
      txerrm : Bool? = nil,
      bberrm : Bool? = nil,
      frmorm : Bool? = nil,
      dterrm : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        xfrcm: xfrcm,
        chhm: chhm,
        ahberr: ahberr,
        stallm: stallm,
        nakm: nakm,
        ackm: ackm,
        nyet: nyet,
        txerrm: txerrm,
        bberrm: bberrm,
        frmorm: frmorm,
        dterrm: dterrm,
      )
    end
  end # struct

  # OTG_HS host channel-7 interrupt mask          register
  struct OTG_HS_HCINTMSK7
    ADDRESS = BASE_ADDRESS + 0x1ec_u64

    protected def self.address : UInt64
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

    # Transfer completed mask
    def xfrcm : Bool
      @value.bits_set?(0x1_u32)
    end

    # Transfer completed mask
    def self.xfrcm : Bool
      value.xfrcm
    end

    # Transfer completed mask
    def self.xfrcm=(value : Bool) : Bool
      self.set(xfrcm: value)
      value
    end

    # Channel halted mask
    def chhm : Bool
      @value.bits_set?(0x2_u32)
    end

    # Channel halted mask
    def self.chhm : Bool
      value.chhm
    end

    # Channel halted mask
    def self.chhm=(value : Bool) : Bool
      self.set(chhm: value)
      value
    end

    # AHB error
    def ahberr : Bool
      @value.bits_set?(0x4_u32)
    end

    # AHB error
    def self.ahberr : Bool
      value.ahberr
    end

    # AHB error
    def self.ahberr=(value : Bool) : Bool
      self.set(ahberr: value)
      value
    end

    # STALL response received interrupt              mask
    def stallm : Bool
      @value.bits_set?(0x8_u32)
    end

    # STALL response received interrupt              mask
    def self.stallm : Bool
      value.stallm
    end

    # STALL response received interrupt              mask
    def self.stallm=(value : Bool) : Bool
      self.set(stallm: value)
      value
    end

    # NAK response received interrupt              mask
    def nakm : Bool
      @value.bits_set?(0x10_u32)
    end

    # NAK response received interrupt              mask
    def self.nakm : Bool
      value.nakm
    end

    # NAK response received interrupt              mask
    def self.nakm=(value : Bool) : Bool
      self.set(nakm: value)
      value
    end

    # ACK response received/transmitted              interrupt mask
    def ackm : Bool
      @value.bits_set?(0x20_u32)
    end

    # ACK response received/transmitted              interrupt mask
    def self.ackm : Bool
      value.ackm
    end

    # ACK response received/transmitted              interrupt mask
    def self.ackm=(value : Bool) : Bool
      self.set(ackm: value)
      value
    end

    # response received interrupt              mask
    def nyet : Bool
      @value.bits_set?(0x40_u32)
    end

    # response received interrupt              mask
    def self.nyet : Bool
      value.nyet
    end

    # response received interrupt              mask
    def self.nyet=(value : Bool) : Bool
      self.set(nyet: value)
      value
    end

    # Transaction error mask
    def txerrm : Bool
      @value.bits_set?(0x80_u32)
    end

    # Transaction error mask
    def self.txerrm : Bool
      value.txerrm
    end

    # Transaction error mask
    def self.txerrm=(value : Bool) : Bool
      self.set(txerrm: value)
      value
    end

    # Babble error mask
    def bberrm : Bool
      @value.bits_set?(0x100_u32)
    end

    # Babble error mask
    def self.bberrm : Bool
      value.bberrm
    end

    # Babble error mask
    def self.bberrm=(value : Bool) : Bool
      self.set(bberrm: value)
      value
    end

    # Frame overrun mask
    def frmorm : Bool
      @value.bits_set?(0x200_u32)
    end

    # Frame overrun mask
    def self.frmorm : Bool
      value.frmorm
    end

    # Frame overrun mask
    def self.frmorm=(value : Bool) : Bool
      self.set(frmorm: value)
      value
    end

    # Data toggle error mask
    def dterrm : Bool
      @value.bits_set?(0x400_u32)
    end

    # Data toggle error mask
    def self.dterrm : Bool
      value.dterrm
    end

    # Data toggle error mask
    def self.dterrm=(value : Bool) : Bool
      self.set(dterrm: value)
      value
    end

    def copy_with(
      *,

      xfrcm : Bool? = nil,

      chhm : Bool? = nil,

      ahberr : Bool? = nil,

      stallm : Bool? = nil,

      nakm : Bool? = nil,

      ackm : Bool? = nil,

      nyet : Bool? = nil,

      txerrm : Bool? = nil,

      bberrm : Bool? = nil,

      frmorm : Bool? = nil,

      dterrm : Bool? = nil
    ) : self
      value = @value

      unless xfrcm.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(xfrcm.to_int).&(0x1_u32) << 0
      end

      unless chhm.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(chhm.to_int).&(0x1_u32) << 1
      end

      unless ahberr.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(ahberr.to_int).&(0x1_u32) << 2
      end

      unless stallm.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(stallm.to_int).&(0x1_u32) << 3
      end

      unless nakm.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(nakm.to_int).&(0x1_u32) << 4
      end

      unless ackm.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(ackm.to_int).&(0x1_u32) << 5
      end

      unless nyet.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(nyet.to_int).&(0x1_u32) << 6
      end

      unless txerrm.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(txerrm.to_int).&(0x1_u32) << 7
      end

      unless bberrm.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(bberrm.to_int).&(0x1_u32) << 8
      end

      unless frmorm.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(frmorm.to_int).&(0x1_u32) << 9
      end

      unless dterrm.nil?
        value = (value & 0xfffffbff_u32) |
                UInt32.new!(dterrm.to_int).&(0x1_u32) << 10
      end

      self.class.new(value)
    end

    def self.set(
      *,
      xfrcm : Bool? = nil,
      chhm : Bool? = nil,
      ahberr : Bool? = nil,
      stallm : Bool? = nil,
      nakm : Bool? = nil,
      ackm : Bool? = nil,
      nyet : Bool? = nil,
      txerrm : Bool? = nil,
      bberrm : Bool? = nil,
      frmorm : Bool? = nil,
      dterrm : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        xfrcm: xfrcm,
        chhm: chhm,
        ahberr: ahberr,
        stallm: stallm,
        nakm: nakm,
        ackm: ackm,
        nyet: nyet,
        txerrm: txerrm,
        bberrm: bberrm,
        frmorm: frmorm,
        dterrm: dterrm,
      )
    end
  end # struct

  # OTG_HS host channel-8 interrupt mask          register
  struct OTG_HS_HCINTMSK8
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

    # Transfer completed mask
    def xfrcm : Bool
      @value.bits_set?(0x1_u32)
    end

    # Transfer completed mask
    def self.xfrcm : Bool
      value.xfrcm
    end

    # Transfer completed mask
    def self.xfrcm=(value : Bool) : Bool
      self.set(xfrcm: value)
      value
    end

    # Channel halted mask
    def chhm : Bool
      @value.bits_set?(0x2_u32)
    end

    # Channel halted mask
    def self.chhm : Bool
      value.chhm
    end

    # Channel halted mask
    def self.chhm=(value : Bool) : Bool
      self.set(chhm: value)
      value
    end

    # AHB error
    def ahberr : Bool
      @value.bits_set?(0x4_u32)
    end

    # AHB error
    def self.ahberr : Bool
      value.ahberr
    end

    # AHB error
    def self.ahberr=(value : Bool) : Bool
      self.set(ahberr: value)
      value
    end

    # STALL response received interrupt              mask
    def stallm : Bool
      @value.bits_set?(0x8_u32)
    end

    # STALL response received interrupt              mask
    def self.stallm : Bool
      value.stallm
    end

    # STALL response received interrupt              mask
    def self.stallm=(value : Bool) : Bool
      self.set(stallm: value)
      value
    end

    # NAK response received interrupt              mask
    def nakm : Bool
      @value.bits_set?(0x10_u32)
    end

    # NAK response received interrupt              mask
    def self.nakm : Bool
      value.nakm
    end

    # NAK response received interrupt              mask
    def self.nakm=(value : Bool) : Bool
      self.set(nakm: value)
      value
    end

    # ACK response received/transmitted              interrupt mask
    def ackm : Bool
      @value.bits_set?(0x20_u32)
    end

    # ACK response received/transmitted              interrupt mask
    def self.ackm : Bool
      value.ackm
    end

    # ACK response received/transmitted              interrupt mask
    def self.ackm=(value : Bool) : Bool
      self.set(ackm: value)
      value
    end

    # response received interrupt              mask
    def nyet : Bool
      @value.bits_set?(0x40_u32)
    end

    # response received interrupt              mask
    def self.nyet : Bool
      value.nyet
    end

    # response received interrupt              mask
    def self.nyet=(value : Bool) : Bool
      self.set(nyet: value)
      value
    end

    # Transaction error mask
    def txerrm : Bool
      @value.bits_set?(0x80_u32)
    end

    # Transaction error mask
    def self.txerrm : Bool
      value.txerrm
    end

    # Transaction error mask
    def self.txerrm=(value : Bool) : Bool
      self.set(txerrm: value)
      value
    end

    # Babble error mask
    def bberrm : Bool
      @value.bits_set?(0x100_u32)
    end

    # Babble error mask
    def self.bberrm : Bool
      value.bberrm
    end

    # Babble error mask
    def self.bberrm=(value : Bool) : Bool
      self.set(bberrm: value)
      value
    end

    # Frame overrun mask
    def frmorm : Bool
      @value.bits_set?(0x200_u32)
    end

    # Frame overrun mask
    def self.frmorm : Bool
      value.frmorm
    end

    # Frame overrun mask
    def self.frmorm=(value : Bool) : Bool
      self.set(frmorm: value)
      value
    end

    # Data toggle error mask
    def dterrm : Bool
      @value.bits_set?(0x400_u32)
    end

    # Data toggle error mask
    def self.dterrm : Bool
      value.dterrm
    end

    # Data toggle error mask
    def self.dterrm=(value : Bool) : Bool
      self.set(dterrm: value)
      value
    end

    def copy_with(
      *,

      xfrcm : Bool? = nil,

      chhm : Bool? = nil,

      ahberr : Bool? = nil,

      stallm : Bool? = nil,

      nakm : Bool? = nil,

      ackm : Bool? = nil,

      nyet : Bool? = nil,

      txerrm : Bool? = nil,

      bberrm : Bool? = nil,

      frmorm : Bool? = nil,

      dterrm : Bool? = nil
    ) : self
      value = @value

      unless xfrcm.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(xfrcm.to_int).&(0x1_u32) << 0
      end

      unless chhm.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(chhm.to_int).&(0x1_u32) << 1
      end

      unless ahberr.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(ahberr.to_int).&(0x1_u32) << 2
      end

      unless stallm.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(stallm.to_int).&(0x1_u32) << 3
      end

      unless nakm.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(nakm.to_int).&(0x1_u32) << 4
      end

      unless ackm.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(ackm.to_int).&(0x1_u32) << 5
      end

      unless nyet.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(nyet.to_int).&(0x1_u32) << 6
      end

      unless txerrm.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(txerrm.to_int).&(0x1_u32) << 7
      end

      unless bberrm.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(bberrm.to_int).&(0x1_u32) << 8
      end

      unless frmorm.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(frmorm.to_int).&(0x1_u32) << 9
      end

      unless dterrm.nil?
        value = (value & 0xfffffbff_u32) |
                UInt32.new!(dterrm.to_int).&(0x1_u32) << 10
      end

      self.class.new(value)
    end

    def self.set(
      *,
      xfrcm : Bool? = nil,
      chhm : Bool? = nil,
      ahberr : Bool? = nil,
      stallm : Bool? = nil,
      nakm : Bool? = nil,
      ackm : Bool? = nil,
      nyet : Bool? = nil,
      txerrm : Bool? = nil,
      bberrm : Bool? = nil,
      frmorm : Bool? = nil,
      dterrm : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        xfrcm: xfrcm,
        chhm: chhm,
        ahberr: ahberr,
        stallm: stallm,
        nakm: nakm,
        ackm: ackm,
        nyet: nyet,
        txerrm: txerrm,
        bberrm: bberrm,
        frmorm: frmorm,
        dterrm: dterrm,
      )
    end
  end # struct

  # OTG_HS host channel-9 interrupt mask          register
  struct OTG_HS_HCINTMSK9
    ADDRESS = BASE_ADDRESS + 0x22c_u64

    protected def self.address : UInt64
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

    # Transfer completed mask
    def xfrcm : Bool
      @value.bits_set?(0x1_u32)
    end

    # Transfer completed mask
    def self.xfrcm : Bool
      value.xfrcm
    end

    # Transfer completed mask
    def self.xfrcm=(value : Bool) : Bool
      self.set(xfrcm: value)
      value
    end

    # Channel halted mask
    def chhm : Bool
      @value.bits_set?(0x2_u32)
    end

    # Channel halted mask
    def self.chhm : Bool
      value.chhm
    end

    # Channel halted mask
    def self.chhm=(value : Bool) : Bool
      self.set(chhm: value)
      value
    end

    # AHB error
    def ahberr : Bool
      @value.bits_set?(0x4_u32)
    end

    # AHB error
    def self.ahberr : Bool
      value.ahberr
    end

    # AHB error
    def self.ahberr=(value : Bool) : Bool
      self.set(ahberr: value)
      value
    end

    # STALL response received interrupt              mask
    def stallm : Bool
      @value.bits_set?(0x8_u32)
    end

    # STALL response received interrupt              mask
    def self.stallm : Bool
      value.stallm
    end

    # STALL response received interrupt              mask
    def self.stallm=(value : Bool) : Bool
      self.set(stallm: value)
      value
    end

    # NAK response received interrupt              mask
    def nakm : Bool
      @value.bits_set?(0x10_u32)
    end

    # NAK response received interrupt              mask
    def self.nakm : Bool
      value.nakm
    end

    # NAK response received interrupt              mask
    def self.nakm=(value : Bool) : Bool
      self.set(nakm: value)
      value
    end

    # ACK response received/transmitted              interrupt mask
    def ackm : Bool
      @value.bits_set?(0x20_u32)
    end

    # ACK response received/transmitted              interrupt mask
    def self.ackm : Bool
      value.ackm
    end

    # ACK response received/transmitted              interrupt mask
    def self.ackm=(value : Bool) : Bool
      self.set(ackm: value)
      value
    end

    # response received interrupt              mask
    def nyet : Bool
      @value.bits_set?(0x40_u32)
    end

    # response received interrupt              mask
    def self.nyet : Bool
      value.nyet
    end

    # response received interrupt              mask
    def self.nyet=(value : Bool) : Bool
      self.set(nyet: value)
      value
    end

    # Transaction error mask
    def txerrm : Bool
      @value.bits_set?(0x80_u32)
    end

    # Transaction error mask
    def self.txerrm : Bool
      value.txerrm
    end

    # Transaction error mask
    def self.txerrm=(value : Bool) : Bool
      self.set(txerrm: value)
      value
    end

    # Babble error mask
    def bberrm : Bool
      @value.bits_set?(0x100_u32)
    end

    # Babble error mask
    def self.bberrm : Bool
      value.bberrm
    end

    # Babble error mask
    def self.bberrm=(value : Bool) : Bool
      self.set(bberrm: value)
      value
    end

    # Frame overrun mask
    def frmorm : Bool
      @value.bits_set?(0x200_u32)
    end

    # Frame overrun mask
    def self.frmorm : Bool
      value.frmorm
    end

    # Frame overrun mask
    def self.frmorm=(value : Bool) : Bool
      self.set(frmorm: value)
      value
    end

    # Data toggle error mask
    def dterrm : Bool
      @value.bits_set?(0x400_u32)
    end

    # Data toggle error mask
    def self.dterrm : Bool
      value.dterrm
    end

    # Data toggle error mask
    def self.dterrm=(value : Bool) : Bool
      self.set(dterrm: value)
      value
    end

    def copy_with(
      *,

      xfrcm : Bool? = nil,

      chhm : Bool? = nil,

      ahberr : Bool? = nil,

      stallm : Bool? = nil,

      nakm : Bool? = nil,

      ackm : Bool? = nil,

      nyet : Bool? = nil,

      txerrm : Bool? = nil,

      bberrm : Bool? = nil,

      frmorm : Bool? = nil,

      dterrm : Bool? = nil
    ) : self
      value = @value

      unless xfrcm.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(xfrcm.to_int).&(0x1_u32) << 0
      end

      unless chhm.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(chhm.to_int).&(0x1_u32) << 1
      end

      unless ahberr.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(ahberr.to_int).&(0x1_u32) << 2
      end

      unless stallm.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(stallm.to_int).&(0x1_u32) << 3
      end

      unless nakm.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(nakm.to_int).&(0x1_u32) << 4
      end

      unless ackm.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(ackm.to_int).&(0x1_u32) << 5
      end

      unless nyet.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(nyet.to_int).&(0x1_u32) << 6
      end

      unless txerrm.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(txerrm.to_int).&(0x1_u32) << 7
      end

      unless bberrm.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(bberrm.to_int).&(0x1_u32) << 8
      end

      unless frmorm.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(frmorm.to_int).&(0x1_u32) << 9
      end

      unless dterrm.nil?
        value = (value & 0xfffffbff_u32) |
                UInt32.new!(dterrm.to_int).&(0x1_u32) << 10
      end

      self.class.new(value)
    end

    def self.set(
      *,
      xfrcm : Bool? = nil,
      chhm : Bool? = nil,
      ahberr : Bool? = nil,
      stallm : Bool? = nil,
      nakm : Bool? = nil,
      ackm : Bool? = nil,
      nyet : Bool? = nil,
      txerrm : Bool? = nil,
      bberrm : Bool? = nil,
      frmorm : Bool? = nil,
      dterrm : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        xfrcm: xfrcm,
        chhm: chhm,
        ahberr: ahberr,
        stallm: stallm,
        nakm: nakm,
        ackm: ackm,
        nyet: nyet,
        txerrm: txerrm,
        bberrm: bberrm,
        frmorm: frmorm,
        dterrm: dterrm,
      )
    end
  end # struct

  # OTG_HS host channel-10 interrupt mask          register
  struct OTG_HS_HCINTMSK10
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

    # Transfer completed mask
    def xfrcm : Bool
      @value.bits_set?(0x1_u32)
    end

    # Transfer completed mask
    def self.xfrcm : Bool
      value.xfrcm
    end

    # Transfer completed mask
    def self.xfrcm=(value : Bool) : Bool
      self.set(xfrcm: value)
      value
    end

    # Channel halted mask
    def chhm : Bool
      @value.bits_set?(0x2_u32)
    end

    # Channel halted mask
    def self.chhm : Bool
      value.chhm
    end

    # Channel halted mask
    def self.chhm=(value : Bool) : Bool
      self.set(chhm: value)
      value
    end

    # AHB error
    def ahberr : Bool
      @value.bits_set?(0x4_u32)
    end

    # AHB error
    def self.ahberr : Bool
      value.ahberr
    end

    # AHB error
    def self.ahberr=(value : Bool) : Bool
      self.set(ahberr: value)
      value
    end

    # STALL response received interrupt              mask
    def stallm : Bool
      @value.bits_set?(0x8_u32)
    end

    # STALL response received interrupt              mask
    def self.stallm : Bool
      value.stallm
    end

    # STALL response received interrupt              mask
    def self.stallm=(value : Bool) : Bool
      self.set(stallm: value)
      value
    end

    # NAK response received interrupt              mask
    def nakm : Bool
      @value.bits_set?(0x10_u32)
    end

    # NAK response received interrupt              mask
    def self.nakm : Bool
      value.nakm
    end

    # NAK response received interrupt              mask
    def self.nakm=(value : Bool) : Bool
      self.set(nakm: value)
      value
    end

    # ACK response received/transmitted              interrupt mask
    def ackm : Bool
      @value.bits_set?(0x20_u32)
    end

    # ACK response received/transmitted              interrupt mask
    def self.ackm : Bool
      value.ackm
    end

    # ACK response received/transmitted              interrupt mask
    def self.ackm=(value : Bool) : Bool
      self.set(ackm: value)
      value
    end

    # response received interrupt              mask
    def nyet : Bool
      @value.bits_set?(0x40_u32)
    end

    # response received interrupt              mask
    def self.nyet : Bool
      value.nyet
    end

    # response received interrupt              mask
    def self.nyet=(value : Bool) : Bool
      self.set(nyet: value)
      value
    end

    # Transaction error mask
    def txerrm : Bool
      @value.bits_set?(0x80_u32)
    end

    # Transaction error mask
    def self.txerrm : Bool
      value.txerrm
    end

    # Transaction error mask
    def self.txerrm=(value : Bool) : Bool
      self.set(txerrm: value)
      value
    end

    # Babble error mask
    def bberrm : Bool
      @value.bits_set?(0x100_u32)
    end

    # Babble error mask
    def self.bberrm : Bool
      value.bberrm
    end

    # Babble error mask
    def self.bberrm=(value : Bool) : Bool
      self.set(bberrm: value)
      value
    end

    # Frame overrun mask
    def frmorm : Bool
      @value.bits_set?(0x200_u32)
    end

    # Frame overrun mask
    def self.frmorm : Bool
      value.frmorm
    end

    # Frame overrun mask
    def self.frmorm=(value : Bool) : Bool
      self.set(frmorm: value)
      value
    end

    # Data toggle error mask
    def dterrm : Bool
      @value.bits_set?(0x400_u32)
    end

    # Data toggle error mask
    def self.dterrm : Bool
      value.dterrm
    end

    # Data toggle error mask
    def self.dterrm=(value : Bool) : Bool
      self.set(dterrm: value)
      value
    end

    def copy_with(
      *,

      xfrcm : Bool? = nil,

      chhm : Bool? = nil,

      ahberr : Bool? = nil,

      stallm : Bool? = nil,

      nakm : Bool? = nil,

      ackm : Bool? = nil,

      nyet : Bool? = nil,

      txerrm : Bool? = nil,

      bberrm : Bool? = nil,

      frmorm : Bool? = nil,

      dterrm : Bool? = nil
    ) : self
      value = @value

      unless xfrcm.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(xfrcm.to_int).&(0x1_u32) << 0
      end

      unless chhm.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(chhm.to_int).&(0x1_u32) << 1
      end

      unless ahberr.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(ahberr.to_int).&(0x1_u32) << 2
      end

      unless stallm.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(stallm.to_int).&(0x1_u32) << 3
      end

      unless nakm.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(nakm.to_int).&(0x1_u32) << 4
      end

      unless ackm.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(ackm.to_int).&(0x1_u32) << 5
      end

      unless nyet.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(nyet.to_int).&(0x1_u32) << 6
      end

      unless txerrm.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(txerrm.to_int).&(0x1_u32) << 7
      end

      unless bberrm.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(bberrm.to_int).&(0x1_u32) << 8
      end

      unless frmorm.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(frmorm.to_int).&(0x1_u32) << 9
      end

      unless dterrm.nil?
        value = (value & 0xfffffbff_u32) |
                UInt32.new!(dterrm.to_int).&(0x1_u32) << 10
      end

      self.class.new(value)
    end

    def self.set(
      *,
      xfrcm : Bool? = nil,
      chhm : Bool? = nil,
      ahberr : Bool? = nil,
      stallm : Bool? = nil,
      nakm : Bool? = nil,
      ackm : Bool? = nil,
      nyet : Bool? = nil,
      txerrm : Bool? = nil,
      bberrm : Bool? = nil,
      frmorm : Bool? = nil,
      dterrm : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        xfrcm: xfrcm,
        chhm: chhm,
        ahberr: ahberr,
        stallm: stallm,
        nakm: nakm,
        ackm: ackm,
        nyet: nyet,
        txerrm: txerrm,
        bberrm: bberrm,
        frmorm: frmorm,
        dterrm: dterrm,
      )
    end
  end # struct

  # OTG_HS host channel-11 interrupt mask          register
  struct OTG_HS_HCINTMSK11
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

    # Transfer completed mask
    def xfrcm : Bool
      @value.bits_set?(0x1_u32)
    end

    # Transfer completed mask
    def self.xfrcm : Bool
      value.xfrcm
    end

    # Transfer completed mask
    def self.xfrcm=(value : Bool) : Bool
      self.set(xfrcm: value)
      value
    end

    # Channel halted mask
    def chhm : Bool
      @value.bits_set?(0x2_u32)
    end

    # Channel halted mask
    def self.chhm : Bool
      value.chhm
    end

    # Channel halted mask
    def self.chhm=(value : Bool) : Bool
      self.set(chhm: value)
      value
    end

    # AHB error
    def ahberr : Bool
      @value.bits_set?(0x4_u32)
    end

    # AHB error
    def self.ahberr : Bool
      value.ahberr
    end

    # AHB error
    def self.ahberr=(value : Bool) : Bool
      self.set(ahberr: value)
      value
    end

    # STALL response received interrupt              mask
    def stallm : Bool
      @value.bits_set?(0x8_u32)
    end

    # STALL response received interrupt              mask
    def self.stallm : Bool
      value.stallm
    end

    # STALL response received interrupt              mask
    def self.stallm=(value : Bool) : Bool
      self.set(stallm: value)
      value
    end

    # NAK response received interrupt              mask
    def nakm : Bool
      @value.bits_set?(0x10_u32)
    end

    # NAK response received interrupt              mask
    def self.nakm : Bool
      value.nakm
    end

    # NAK response received interrupt              mask
    def self.nakm=(value : Bool) : Bool
      self.set(nakm: value)
      value
    end

    # ACK response received/transmitted              interrupt mask
    def ackm : Bool
      @value.bits_set?(0x20_u32)
    end

    # ACK response received/transmitted              interrupt mask
    def self.ackm : Bool
      value.ackm
    end

    # ACK response received/transmitted              interrupt mask
    def self.ackm=(value : Bool) : Bool
      self.set(ackm: value)
      value
    end

    # response received interrupt              mask
    def nyet : Bool
      @value.bits_set?(0x40_u32)
    end

    # response received interrupt              mask
    def self.nyet : Bool
      value.nyet
    end

    # response received interrupt              mask
    def self.nyet=(value : Bool) : Bool
      self.set(nyet: value)
      value
    end

    # Transaction error mask
    def txerrm : Bool
      @value.bits_set?(0x80_u32)
    end

    # Transaction error mask
    def self.txerrm : Bool
      value.txerrm
    end

    # Transaction error mask
    def self.txerrm=(value : Bool) : Bool
      self.set(txerrm: value)
      value
    end

    # Babble error mask
    def bberrm : Bool
      @value.bits_set?(0x100_u32)
    end

    # Babble error mask
    def self.bberrm : Bool
      value.bberrm
    end

    # Babble error mask
    def self.bberrm=(value : Bool) : Bool
      self.set(bberrm: value)
      value
    end

    # Frame overrun mask
    def frmorm : Bool
      @value.bits_set?(0x200_u32)
    end

    # Frame overrun mask
    def self.frmorm : Bool
      value.frmorm
    end

    # Frame overrun mask
    def self.frmorm=(value : Bool) : Bool
      self.set(frmorm: value)
      value
    end

    # Data toggle error mask
    def dterrm : Bool
      @value.bits_set?(0x400_u32)
    end

    # Data toggle error mask
    def self.dterrm : Bool
      value.dterrm
    end

    # Data toggle error mask
    def self.dterrm=(value : Bool) : Bool
      self.set(dterrm: value)
      value
    end

    def copy_with(
      *,

      xfrcm : Bool? = nil,

      chhm : Bool? = nil,

      ahberr : Bool? = nil,

      stallm : Bool? = nil,

      nakm : Bool? = nil,

      ackm : Bool? = nil,

      nyet : Bool? = nil,

      txerrm : Bool? = nil,

      bberrm : Bool? = nil,

      frmorm : Bool? = nil,

      dterrm : Bool? = nil
    ) : self
      value = @value

      unless xfrcm.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(xfrcm.to_int).&(0x1_u32) << 0
      end

      unless chhm.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(chhm.to_int).&(0x1_u32) << 1
      end

      unless ahberr.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(ahberr.to_int).&(0x1_u32) << 2
      end

      unless stallm.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(stallm.to_int).&(0x1_u32) << 3
      end

      unless nakm.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(nakm.to_int).&(0x1_u32) << 4
      end

      unless ackm.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(ackm.to_int).&(0x1_u32) << 5
      end

      unless nyet.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(nyet.to_int).&(0x1_u32) << 6
      end

      unless txerrm.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(txerrm.to_int).&(0x1_u32) << 7
      end

      unless bberrm.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(bberrm.to_int).&(0x1_u32) << 8
      end

      unless frmorm.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(frmorm.to_int).&(0x1_u32) << 9
      end

      unless dterrm.nil?
        value = (value & 0xfffffbff_u32) |
                UInt32.new!(dterrm.to_int).&(0x1_u32) << 10
      end

      self.class.new(value)
    end

    def self.set(
      *,
      xfrcm : Bool? = nil,
      chhm : Bool? = nil,
      ahberr : Bool? = nil,
      stallm : Bool? = nil,
      nakm : Bool? = nil,
      ackm : Bool? = nil,
      nyet : Bool? = nil,
      txerrm : Bool? = nil,
      bberrm : Bool? = nil,
      frmorm : Bool? = nil,
      dterrm : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        xfrcm: xfrcm,
        chhm: chhm,
        ahberr: ahberr,
        stallm: stallm,
        nakm: nakm,
        ackm: ackm,
        nyet: nyet,
        txerrm: txerrm,
        bberrm: bberrm,
        frmorm: frmorm,
        dterrm: dterrm,
      )
    end
  end # struct

  # OTG_HS host channel-11 transfer size          register
  struct OTG_HS_HCTSIZ0
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

    # Transfer size
    def xfrsiz : UInt32
      UInt32.new!((@value >> 0) & 0x7ffff_u32)
    end

    # Transfer size
    def self.xfrsiz : UInt32
      value.xfrsiz
    end

    # Transfer size
    def self.xfrsiz=(value : UInt32) : UInt32
      self.set(xfrsiz: value)
      value
    end

    # Packet count
    def pktcnt : UInt16
      UInt16.new!((@value >> 19) & 0x3ff_u32)
    end

    # Packet count
    def self.pktcnt : UInt16
      value.pktcnt
    end

    # Packet count
    def self.pktcnt=(value : UInt16) : UInt16
      self.set(pktcnt: value)
      value
    end

    # Data PID
    def dpid : UInt8
      UInt8.new!((@value >> 29) & 0x3_u32)
    end

    # Data PID
    def self.dpid : UInt8
      value.dpid
    end

    # Data PID
    def self.dpid=(value : UInt8) : UInt8
      self.set(dpid: value)
      value
    end

    def copy_with(
      *,

      xfrsiz : UInt32? = nil,

      pktcnt : UInt16? = nil,

      dpid : UInt8? = nil
    ) : self
      value = @value

      unless xfrsiz.nil?
        value = (value & 0xfff80000_u32) |
                UInt32.new!(xfrsiz.to_int).&(0x7ffff_u32) << 0
      end

      unless pktcnt.nil?
        value = (value & 0xe007ffff_u32) |
                UInt32.new!(pktcnt.to_int).&(0x3ff_u32) << 19
      end

      unless dpid.nil?
        value = (value & 0x9fffffff_u32) |
                UInt32.new!(dpid.to_int).&(0x3_u32) << 29
      end

      self.class.new(value)
    end

    def self.set(
      *,
      xfrsiz : UInt32? = nil,
      pktcnt : UInt16? = nil,
      dpid : UInt8? = nil
    ) : Nil
      self.value = self.value.copy_with(
        xfrsiz: xfrsiz,
        pktcnt: pktcnt,
        dpid: dpid,
      )
    end
  end # struct

  # OTG_HS host channel-1 transfer size          register
  struct OTG_HS_HCTSIZ1
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

    # Transfer size
    def xfrsiz : UInt32
      UInt32.new!((@value >> 0) & 0x7ffff_u32)
    end

    # Transfer size
    def self.xfrsiz : UInt32
      value.xfrsiz
    end

    # Transfer size
    def self.xfrsiz=(value : UInt32) : UInt32
      self.set(xfrsiz: value)
      value
    end

    # Packet count
    def pktcnt : UInt16
      UInt16.new!((@value >> 19) & 0x3ff_u32)
    end

    # Packet count
    def self.pktcnt : UInt16
      value.pktcnt
    end

    # Packet count
    def self.pktcnt=(value : UInt16) : UInt16
      self.set(pktcnt: value)
      value
    end

    # Data PID
    def dpid : UInt8
      UInt8.new!((@value >> 29) & 0x3_u32)
    end

    # Data PID
    def self.dpid : UInt8
      value.dpid
    end

    # Data PID
    def self.dpid=(value : UInt8) : UInt8
      self.set(dpid: value)
      value
    end

    def copy_with(
      *,

      xfrsiz : UInt32? = nil,

      pktcnt : UInt16? = nil,

      dpid : UInt8? = nil
    ) : self
      value = @value

      unless xfrsiz.nil?
        value = (value & 0xfff80000_u32) |
                UInt32.new!(xfrsiz.to_int).&(0x7ffff_u32) << 0
      end

      unless pktcnt.nil?
        value = (value & 0xe007ffff_u32) |
                UInt32.new!(pktcnt.to_int).&(0x3ff_u32) << 19
      end

      unless dpid.nil?
        value = (value & 0x9fffffff_u32) |
                UInt32.new!(dpid.to_int).&(0x3_u32) << 29
      end

      self.class.new(value)
    end

    def self.set(
      *,
      xfrsiz : UInt32? = nil,
      pktcnt : UInt16? = nil,
      dpid : UInt8? = nil
    ) : Nil
      self.value = self.value.copy_with(
        xfrsiz: xfrsiz,
        pktcnt: pktcnt,
        dpid: dpid,
      )
    end
  end # struct

  # OTG_HS host channel-2 transfer size          register
  struct OTG_HS_HCTSIZ2
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

    # Transfer size
    def xfrsiz : UInt32
      UInt32.new!((@value >> 0) & 0x7ffff_u32)
    end

    # Transfer size
    def self.xfrsiz : UInt32
      value.xfrsiz
    end

    # Transfer size
    def self.xfrsiz=(value : UInt32) : UInt32
      self.set(xfrsiz: value)
      value
    end

    # Packet count
    def pktcnt : UInt16
      UInt16.new!((@value >> 19) & 0x3ff_u32)
    end

    # Packet count
    def self.pktcnt : UInt16
      value.pktcnt
    end

    # Packet count
    def self.pktcnt=(value : UInt16) : UInt16
      self.set(pktcnt: value)
      value
    end

    # Data PID
    def dpid : UInt8
      UInt8.new!((@value >> 29) & 0x3_u32)
    end

    # Data PID
    def self.dpid : UInt8
      value.dpid
    end

    # Data PID
    def self.dpid=(value : UInt8) : UInt8
      self.set(dpid: value)
      value
    end

    def copy_with(
      *,

      xfrsiz : UInt32? = nil,

      pktcnt : UInt16? = nil,

      dpid : UInt8? = nil
    ) : self
      value = @value

      unless xfrsiz.nil?
        value = (value & 0xfff80000_u32) |
                UInt32.new!(xfrsiz.to_int).&(0x7ffff_u32) << 0
      end

      unless pktcnt.nil?
        value = (value & 0xe007ffff_u32) |
                UInt32.new!(pktcnt.to_int).&(0x3ff_u32) << 19
      end

      unless dpid.nil?
        value = (value & 0x9fffffff_u32) |
                UInt32.new!(dpid.to_int).&(0x3_u32) << 29
      end

      self.class.new(value)
    end

    def self.set(
      *,
      xfrsiz : UInt32? = nil,
      pktcnt : UInt16? = nil,
      dpid : UInt8? = nil
    ) : Nil
      self.value = self.value.copy_with(
        xfrsiz: xfrsiz,
        pktcnt: pktcnt,
        dpid: dpid,
      )
    end
  end # struct

  # OTG_HS host channel-3 transfer size          register
  struct OTG_HS_HCTSIZ3
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

    # Transfer size
    def xfrsiz : UInt32
      UInt32.new!((@value >> 0) & 0x7ffff_u32)
    end

    # Transfer size
    def self.xfrsiz : UInt32
      value.xfrsiz
    end

    # Transfer size
    def self.xfrsiz=(value : UInt32) : UInt32
      self.set(xfrsiz: value)
      value
    end

    # Packet count
    def pktcnt : UInt16
      UInt16.new!((@value >> 19) & 0x3ff_u32)
    end

    # Packet count
    def self.pktcnt : UInt16
      value.pktcnt
    end

    # Packet count
    def self.pktcnt=(value : UInt16) : UInt16
      self.set(pktcnt: value)
      value
    end

    # Data PID
    def dpid : UInt8
      UInt8.new!((@value >> 29) & 0x3_u32)
    end

    # Data PID
    def self.dpid : UInt8
      value.dpid
    end

    # Data PID
    def self.dpid=(value : UInt8) : UInt8
      self.set(dpid: value)
      value
    end

    def copy_with(
      *,

      xfrsiz : UInt32? = nil,

      pktcnt : UInt16? = nil,

      dpid : UInt8? = nil
    ) : self
      value = @value

      unless xfrsiz.nil?
        value = (value & 0xfff80000_u32) |
                UInt32.new!(xfrsiz.to_int).&(0x7ffff_u32) << 0
      end

      unless pktcnt.nil?
        value = (value & 0xe007ffff_u32) |
                UInt32.new!(pktcnt.to_int).&(0x3ff_u32) << 19
      end

      unless dpid.nil?
        value = (value & 0x9fffffff_u32) |
                UInt32.new!(dpid.to_int).&(0x3_u32) << 29
      end

      self.class.new(value)
    end

    def self.set(
      *,
      xfrsiz : UInt32? = nil,
      pktcnt : UInt16? = nil,
      dpid : UInt8? = nil
    ) : Nil
      self.value = self.value.copy_with(
        xfrsiz: xfrsiz,
        pktcnt: pktcnt,
        dpid: dpid,
      )
    end
  end # struct

  # OTG_HS host channel-4 transfer size          register
  struct OTG_HS_HCTSIZ4
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

    # Transfer size
    def xfrsiz : UInt32
      UInt32.new!((@value >> 0) & 0x7ffff_u32)
    end

    # Transfer size
    def self.xfrsiz : UInt32
      value.xfrsiz
    end

    # Transfer size
    def self.xfrsiz=(value : UInt32) : UInt32
      self.set(xfrsiz: value)
      value
    end

    # Packet count
    def pktcnt : UInt16
      UInt16.new!((@value >> 19) & 0x3ff_u32)
    end

    # Packet count
    def self.pktcnt : UInt16
      value.pktcnt
    end

    # Packet count
    def self.pktcnt=(value : UInt16) : UInt16
      self.set(pktcnt: value)
      value
    end

    # Data PID
    def dpid : UInt8
      UInt8.new!((@value >> 29) & 0x3_u32)
    end

    # Data PID
    def self.dpid : UInt8
      value.dpid
    end

    # Data PID
    def self.dpid=(value : UInt8) : UInt8
      self.set(dpid: value)
      value
    end

    def copy_with(
      *,

      xfrsiz : UInt32? = nil,

      pktcnt : UInt16? = nil,

      dpid : UInt8? = nil
    ) : self
      value = @value

      unless xfrsiz.nil?
        value = (value & 0xfff80000_u32) |
                UInt32.new!(xfrsiz.to_int).&(0x7ffff_u32) << 0
      end

      unless pktcnt.nil?
        value = (value & 0xe007ffff_u32) |
                UInt32.new!(pktcnt.to_int).&(0x3ff_u32) << 19
      end

      unless dpid.nil?
        value = (value & 0x9fffffff_u32) |
                UInt32.new!(dpid.to_int).&(0x3_u32) << 29
      end

      self.class.new(value)
    end

    def self.set(
      *,
      xfrsiz : UInt32? = nil,
      pktcnt : UInt16? = nil,
      dpid : UInt8? = nil
    ) : Nil
      self.value = self.value.copy_with(
        xfrsiz: xfrsiz,
        pktcnt: pktcnt,
        dpid: dpid,
      )
    end
  end # struct

  # OTG_HS host channel-5 transfer size          register
  struct OTG_HS_HCTSIZ5
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

    # Transfer size
    def xfrsiz : UInt32
      UInt32.new!((@value >> 0) & 0x7ffff_u32)
    end

    # Transfer size
    def self.xfrsiz : UInt32
      value.xfrsiz
    end

    # Transfer size
    def self.xfrsiz=(value : UInt32) : UInt32
      self.set(xfrsiz: value)
      value
    end

    # Packet count
    def pktcnt : UInt16
      UInt16.new!((@value >> 19) & 0x3ff_u32)
    end

    # Packet count
    def self.pktcnt : UInt16
      value.pktcnt
    end

    # Packet count
    def self.pktcnt=(value : UInt16) : UInt16
      self.set(pktcnt: value)
      value
    end

    # Data PID
    def dpid : UInt8
      UInt8.new!((@value >> 29) & 0x3_u32)
    end

    # Data PID
    def self.dpid : UInt8
      value.dpid
    end

    # Data PID
    def self.dpid=(value : UInt8) : UInt8
      self.set(dpid: value)
      value
    end

    def copy_with(
      *,

      xfrsiz : UInt32? = nil,

      pktcnt : UInt16? = nil,

      dpid : UInt8? = nil
    ) : self
      value = @value

      unless xfrsiz.nil?
        value = (value & 0xfff80000_u32) |
                UInt32.new!(xfrsiz.to_int).&(0x7ffff_u32) << 0
      end

      unless pktcnt.nil?
        value = (value & 0xe007ffff_u32) |
                UInt32.new!(pktcnt.to_int).&(0x3ff_u32) << 19
      end

      unless dpid.nil?
        value = (value & 0x9fffffff_u32) |
                UInt32.new!(dpid.to_int).&(0x3_u32) << 29
      end

      self.class.new(value)
    end

    def self.set(
      *,
      xfrsiz : UInt32? = nil,
      pktcnt : UInt16? = nil,
      dpid : UInt8? = nil
    ) : Nil
      self.value = self.value.copy_with(
        xfrsiz: xfrsiz,
        pktcnt: pktcnt,
        dpid: dpid,
      )
    end
  end # struct

  # OTG_HS host channel-6 transfer size          register
  struct OTG_HS_HCTSIZ6
    ADDRESS = BASE_ADDRESS + 0x1d0_u64

    protected def self.address : UInt64
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

    # Transfer size
    def xfrsiz : UInt32
      UInt32.new!((@value >> 0) & 0x7ffff_u32)
    end

    # Transfer size
    def self.xfrsiz : UInt32
      value.xfrsiz
    end

    # Transfer size
    def self.xfrsiz=(value : UInt32) : UInt32
      self.set(xfrsiz: value)
      value
    end

    # Packet count
    def pktcnt : UInt16
      UInt16.new!((@value >> 19) & 0x3ff_u32)
    end

    # Packet count
    def self.pktcnt : UInt16
      value.pktcnt
    end

    # Packet count
    def self.pktcnt=(value : UInt16) : UInt16
      self.set(pktcnt: value)
      value
    end

    # Data PID
    def dpid : UInt8
      UInt8.new!((@value >> 29) & 0x3_u32)
    end

    # Data PID
    def self.dpid : UInt8
      value.dpid
    end

    # Data PID
    def self.dpid=(value : UInt8) : UInt8
      self.set(dpid: value)
      value
    end

    def copy_with(
      *,

      xfrsiz : UInt32? = nil,

      pktcnt : UInt16? = nil,

      dpid : UInt8? = nil
    ) : self
      value = @value

      unless xfrsiz.nil?
        value = (value & 0xfff80000_u32) |
                UInt32.new!(xfrsiz.to_int).&(0x7ffff_u32) << 0
      end

      unless pktcnt.nil?
        value = (value & 0xe007ffff_u32) |
                UInt32.new!(pktcnt.to_int).&(0x3ff_u32) << 19
      end

      unless dpid.nil?
        value = (value & 0x9fffffff_u32) |
                UInt32.new!(dpid.to_int).&(0x3_u32) << 29
      end

      self.class.new(value)
    end

    def self.set(
      *,
      xfrsiz : UInt32? = nil,
      pktcnt : UInt16? = nil,
      dpid : UInt8? = nil
    ) : Nil
      self.value = self.value.copy_with(
        xfrsiz: xfrsiz,
        pktcnt: pktcnt,
        dpid: dpid,
      )
    end
  end # struct

  # OTG_HS host channel-7 transfer size          register
  struct OTG_HS_HCTSIZ7
    ADDRESS = BASE_ADDRESS + 0x1f0_u64

    protected def self.address : UInt64
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

    # Transfer size
    def xfrsiz : UInt32
      UInt32.new!((@value >> 0) & 0x7ffff_u32)
    end

    # Transfer size
    def self.xfrsiz : UInt32
      value.xfrsiz
    end

    # Transfer size
    def self.xfrsiz=(value : UInt32) : UInt32
      self.set(xfrsiz: value)
      value
    end

    # Packet count
    def pktcnt : UInt16
      UInt16.new!((@value >> 19) & 0x3ff_u32)
    end

    # Packet count
    def self.pktcnt : UInt16
      value.pktcnt
    end

    # Packet count
    def self.pktcnt=(value : UInt16) : UInt16
      self.set(pktcnt: value)
      value
    end

    # Data PID
    def dpid : UInt8
      UInt8.new!((@value >> 29) & 0x3_u32)
    end

    # Data PID
    def self.dpid : UInt8
      value.dpid
    end

    # Data PID
    def self.dpid=(value : UInt8) : UInt8
      self.set(dpid: value)
      value
    end

    def copy_with(
      *,

      xfrsiz : UInt32? = nil,

      pktcnt : UInt16? = nil,

      dpid : UInt8? = nil
    ) : self
      value = @value

      unless xfrsiz.nil?
        value = (value & 0xfff80000_u32) |
                UInt32.new!(xfrsiz.to_int).&(0x7ffff_u32) << 0
      end

      unless pktcnt.nil?
        value = (value & 0xe007ffff_u32) |
                UInt32.new!(pktcnt.to_int).&(0x3ff_u32) << 19
      end

      unless dpid.nil?
        value = (value & 0x9fffffff_u32) |
                UInt32.new!(dpid.to_int).&(0x3_u32) << 29
      end

      self.class.new(value)
    end

    def self.set(
      *,
      xfrsiz : UInt32? = nil,
      pktcnt : UInt16? = nil,
      dpid : UInt8? = nil
    ) : Nil
      self.value = self.value.copy_with(
        xfrsiz: xfrsiz,
        pktcnt: pktcnt,
        dpid: dpid,
      )
    end
  end # struct

  # OTG_HS host channel-8 transfer size          register
  struct OTG_HS_HCTSIZ8
    ADDRESS = BASE_ADDRESS + 0x210_u64

    protected def self.address : UInt64
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

    # Transfer size
    def xfrsiz : UInt32
      UInt32.new!((@value >> 0) & 0x7ffff_u32)
    end

    # Transfer size
    def self.xfrsiz : UInt32
      value.xfrsiz
    end

    # Transfer size
    def self.xfrsiz=(value : UInt32) : UInt32
      self.set(xfrsiz: value)
      value
    end

    # Packet count
    def pktcnt : UInt16
      UInt16.new!((@value >> 19) & 0x3ff_u32)
    end

    # Packet count
    def self.pktcnt : UInt16
      value.pktcnt
    end

    # Packet count
    def self.pktcnt=(value : UInt16) : UInt16
      self.set(pktcnt: value)
      value
    end

    # Data PID
    def dpid : UInt8
      UInt8.new!((@value >> 29) & 0x3_u32)
    end

    # Data PID
    def self.dpid : UInt8
      value.dpid
    end

    # Data PID
    def self.dpid=(value : UInt8) : UInt8
      self.set(dpid: value)
      value
    end

    def copy_with(
      *,

      xfrsiz : UInt32? = nil,

      pktcnt : UInt16? = nil,

      dpid : UInt8? = nil
    ) : self
      value = @value

      unless xfrsiz.nil?
        value = (value & 0xfff80000_u32) |
                UInt32.new!(xfrsiz.to_int).&(0x7ffff_u32) << 0
      end

      unless pktcnt.nil?
        value = (value & 0xe007ffff_u32) |
                UInt32.new!(pktcnt.to_int).&(0x3ff_u32) << 19
      end

      unless dpid.nil?
        value = (value & 0x9fffffff_u32) |
                UInt32.new!(dpid.to_int).&(0x3_u32) << 29
      end

      self.class.new(value)
    end

    def self.set(
      *,
      xfrsiz : UInt32? = nil,
      pktcnt : UInt16? = nil,
      dpid : UInt8? = nil
    ) : Nil
      self.value = self.value.copy_with(
        xfrsiz: xfrsiz,
        pktcnt: pktcnt,
        dpid: dpid,
      )
    end
  end # struct

  # OTG_HS host channel-9 transfer size          register
  struct OTG_HS_HCTSIZ9
    ADDRESS = BASE_ADDRESS + 0x230_u64

    protected def self.address : UInt64
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

    # Transfer size
    def xfrsiz : UInt32
      UInt32.new!((@value >> 0) & 0x7ffff_u32)
    end

    # Transfer size
    def self.xfrsiz : UInt32
      value.xfrsiz
    end

    # Transfer size
    def self.xfrsiz=(value : UInt32) : UInt32
      self.set(xfrsiz: value)
      value
    end

    # Packet count
    def pktcnt : UInt16
      UInt16.new!((@value >> 19) & 0x3ff_u32)
    end

    # Packet count
    def self.pktcnt : UInt16
      value.pktcnt
    end

    # Packet count
    def self.pktcnt=(value : UInt16) : UInt16
      self.set(pktcnt: value)
      value
    end

    # Data PID
    def dpid : UInt8
      UInt8.new!((@value >> 29) & 0x3_u32)
    end

    # Data PID
    def self.dpid : UInt8
      value.dpid
    end

    # Data PID
    def self.dpid=(value : UInt8) : UInt8
      self.set(dpid: value)
      value
    end

    def copy_with(
      *,

      xfrsiz : UInt32? = nil,

      pktcnt : UInt16? = nil,

      dpid : UInt8? = nil
    ) : self
      value = @value

      unless xfrsiz.nil?
        value = (value & 0xfff80000_u32) |
                UInt32.new!(xfrsiz.to_int).&(0x7ffff_u32) << 0
      end

      unless pktcnt.nil?
        value = (value & 0xe007ffff_u32) |
                UInt32.new!(pktcnt.to_int).&(0x3ff_u32) << 19
      end

      unless dpid.nil?
        value = (value & 0x9fffffff_u32) |
                UInt32.new!(dpid.to_int).&(0x3_u32) << 29
      end

      self.class.new(value)
    end

    def self.set(
      *,
      xfrsiz : UInt32? = nil,
      pktcnt : UInt16? = nil,
      dpid : UInt8? = nil
    ) : Nil
      self.value = self.value.copy_with(
        xfrsiz: xfrsiz,
        pktcnt: pktcnt,
        dpid: dpid,
      )
    end
  end # struct

  # OTG_HS host channel-10 transfer size          register
  struct OTG_HS_HCTSIZ10
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

    # Transfer size
    def xfrsiz : UInt32
      UInt32.new!((@value >> 0) & 0x7ffff_u32)
    end

    # Transfer size
    def self.xfrsiz : UInt32
      value.xfrsiz
    end

    # Transfer size
    def self.xfrsiz=(value : UInt32) : UInt32
      self.set(xfrsiz: value)
      value
    end

    # Packet count
    def pktcnt : UInt16
      UInt16.new!((@value >> 19) & 0x3ff_u32)
    end

    # Packet count
    def self.pktcnt : UInt16
      value.pktcnt
    end

    # Packet count
    def self.pktcnt=(value : UInt16) : UInt16
      self.set(pktcnt: value)
      value
    end

    # Data PID
    def dpid : UInt8
      UInt8.new!((@value >> 29) & 0x3_u32)
    end

    # Data PID
    def self.dpid : UInt8
      value.dpid
    end

    # Data PID
    def self.dpid=(value : UInt8) : UInt8
      self.set(dpid: value)
      value
    end

    def copy_with(
      *,

      xfrsiz : UInt32? = nil,

      pktcnt : UInt16? = nil,

      dpid : UInt8? = nil
    ) : self
      value = @value

      unless xfrsiz.nil?
        value = (value & 0xfff80000_u32) |
                UInt32.new!(xfrsiz.to_int).&(0x7ffff_u32) << 0
      end

      unless pktcnt.nil?
        value = (value & 0xe007ffff_u32) |
                UInt32.new!(pktcnt.to_int).&(0x3ff_u32) << 19
      end

      unless dpid.nil?
        value = (value & 0x9fffffff_u32) |
                UInt32.new!(dpid.to_int).&(0x3_u32) << 29
      end

      self.class.new(value)
    end

    def self.set(
      *,
      xfrsiz : UInt32? = nil,
      pktcnt : UInt16? = nil,
      dpid : UInt8? = nil
    ) : Nil
      self.value = self.value.copy_with(
        xfrsiz: xfrsiz,
        pktcnt: pktcnt,
        dpid: dpid,
      )
    end
  end # struct

  # OTG_HS host channel-11 transfer size          register
  struct OTG_HS_HCTSIZ11
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

    # Transfer size
    def xfrsiz : UInt32
      UInt32.new!((@value >> 0) & 0x7ffff_u32)
    end

    # Transfer size
    def self.xfrsiz : UInt32
      value.xfrsiz
    end

    # Transfer size
    def self.xfrsiz=(value : UInt32) : UInt32
      self.set(xfrsiz: value)
      value
    end

    # Packet count
    def pktcnt : UInt16
      UInt16.new!((@value >> 19) & 0x3ff_u32)
    end

    # Packet count
    def self.pktcnt : UInt16
      value.pktcnt
    end

    # Packet count
    def self.pktcnt=(value : UInt16) : UInt16
      self.set(pktcnt: value)
      value
    end

    # Data PID
    def dpid : UInt8
      UInt8.new!((@value >> 29) & 0x3_u32)
    end

    # Data PID
    def self.dpid : UInt8
      value.dpid
    end

    # Data PID
    def self.dpid=(value : UInt8) : UInt8
      self.set(dpid: value)
      value
    end

    def copy_with(
      *,

      xfrsiz : UInt32? = nil,

      pktcnt : UInt16? = nil,

      dpid : UInt8? = nil
    ) : self
      value = @value

      unless xfrsiz.nil?
        value = (value & 0xfff80000_u32) |
                UInt32.new!(xfrsiz.to_int).&(0x7ffff_u32) << 0
      end

      unless pktcnt.nil?
        value = (value & 0xe007ffff_u32) |
                UInt32.new!(pktcnt.to_int).&(0x3ff_u32) << 19
      end

      unless dpid.nil?
        value = (value & 0x9fffffff_u32) |
                UInt32.new!(dpid.to_int).&(0x3_u32) << 29
      end

      self.class.new(value)
    end

    def self.set(
      *,
      xfrsiz : UInt32? = nil,
      pktcnt : UInt16? = nil,
      dpid : UInt8? = nil
    ) : Nil
      self.value = self.value.copy_with(
        xfrsiz: xfrsiz,
        pktcnt: pktcnt,
        dpid: dpid,
      )
    end
  end # struct

  # OTG_HS host channel-0 DMA address          register
  struct OTG_HS_HCDMA0
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

    # DMA address
    def dmaaddr : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # DMA address
    def self.dmaaddr : UInt32
      value.dmaaddr
    end

    # DMA address
    def self.dmaaddr=(value : UInt32) : UInt32
      self.set(dmaaddr: value)
      value
    end

    def copy_with(
      *,

      dmaaddr : UInt32? = nil
    ) : self
      value = @value

      unless dmaaddr.nil?
        value = (value & 0xffffffff_u32) |
                UInt32.new!(dmaaddr.to_int).&(0x0_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      dmaaddr : UInt32? = nil
    ) : Nil
      self.value = self.value.copy_with(
        dmaaddr: dmaaddr,
      )
    end
  end # struct

  # OTG_HS host channel-1 DMA address          register
  struct OTG_HS_HCDMA1
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

    # DMA address
    def dmaaddr : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # DMA address
    def self.dmaaddr : UInt32
      value.dmaaddr
    end

    # DMA address
    def self.dmaaddr=(value : UInt32) : UInt32
      self.set(dmaaddr: value)
      value
    end

    def copy_with(
      *,

      dmaaddr : UInt32? = nil
    ) : self
      value = @value

      unless dmaaddr.nil?
        value = (value & 0xffffffff_u32) |
                UInt32.new!(dmaaddr.to_int).&(0x0_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      dmaaddr : UInt32? = nil
    ) : Nil
      self.value = self.value.copy_with(
        dmaaddr: dmaaddr,
      )
    end
  end # struct

  # OTG_HS host channel-2 DMA address          register
  struct OTG_HS_HCDMA2
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

    # DMA address
    def dmaaddr : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # DMA address
    def self.dmaaddr : UInt32
      value.dmaaddr
    end

    # DMA address
    def self.dmaaddr=(value : UInt32) : UInt32
      self.set(dmaaddr: value)
      value
    end

    def copy_with(
      *,

      dmaaddr : UInt32? = nil
    ) : self
      value = @value

      unless dmaaddr.nil?
        value = (value & 0xffffffff_u32) |
                UInt32.new!(dmaaddr.to_int).&(0x0_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      dmaaddr : UInt32? = nil
    ) : Nil
      self.value = self.value.copy_with(
        dmaaddr: dmaaddr,
      )
    end
  end # struct

  # OTG_HS host channel-3 DMA address          register
  struct OTG_HS_HCDMA3
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

    # DMA address
    def dmaaddr : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # DMA address
    def self.dmaaddr : UInt32
      value.dmaaddr
    end

    # DMA address
    def self.dmaaddr=(value : UInt32) : UInt32
      self.set(dmaaddr: value)
      value
    end

    def copy_with(
      *,

      dmaaddr : UInt32? = nil
    ) : self
      value = @value

      unless dmaaddr.nil?
        value = (value & 0xffffffff_u32) |
                UInt32.new!(dmaaddr.to_int).&(0x0_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      dmaaddr : UInt32? = nil
    ) : Nil
      self.value = self.value.copy_with(
        dmaaddr: dmaaddr,
      )
    end
  end # struct

  # OTG_HS host channel-4 DMA address          register
  struct OTG_HS_HCDMA4
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

    # DMA address
    def dmaaddr : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # DMA address
    def self.dmaaddr : UInt32
      value.dmaaddr
    end

    # DMA address
    def self.dmaaddr=(value : UInt32) : UInt32
      self.set(dmaaddr: value)
      value
    end

    def copy_with(
      *,

      dmaaddr : UInt32? = nil
    ) : self
      value = @value

      unless dmaaddr.nil?
        value = (value & 0xffffffff_u32) |
                UInt32.new!(dmaaddr.to_int).&(0x0_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      dmaaddr : UInt32? = nil
    ) : Nil
      self.value = self.value.copy_with(
        dmaaddr: dmaaddr,
      )
    end
  end # struct

  # OTG_HS host channel-5 DMA address          register
  struct OTG_HS_HCDMA5
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

    # DMA address
    def dmaaddr : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # DMA address
    def self.dmaaddr : UInt32
      value.dmaaddr
    end

    # DMA address
    def self.dmaaddr=(value : UInt32) : UInt32
      self.set(dmaaddr: value)
      value
    end

    def copy_with(
      *,

      dmaaddr : UInt32? = nil
    ) : self
      value = @value

      unless dmaaddr.nil?
        value = (value & 0xffffffff_u32) |
                UInt32.new!(dmaaddr.to_int).&(0x0_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      dmaaddr : UInt32? = nil
    ) : Nil
      self.value = self.value.copy_with(
        dmaaddr: dmaaddr,
      )
    end
  end # struct

  # OTG_HS host channel-6 DMA address          register
  struct OTG_HS_HCDMA6
    ADDRESS = BASE_ADDRESS + 0x1d4_u64

    protected def self.address : UInt64
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

    # DMA address
    def dmaaddr : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # DMA address
    def self.dmaaddr : UInt32
      value.dmaaddr
    end

    # DMA address
    def self.dmaaddr=(value : UInt32) : UInt32
      self.set(dmaaddr: value)
      value
    end

    def copy_with(
      *,

      dmaaddr : UInt32? = nil
    ) : self
      value = @value

      unless dmaaddr.nil?
        value = (value & 0xffffffff_u32) |
                UInt32.new!(dmaaddr.to_int).&(0x0_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      dmaaddr : UInt32? = nil
    ) : Nil
      self.value = self.value.copy_with(
        dmaaddr: dmaaddr,
      )
    end
  end # struct

  # OTG_HS host channel-7 DMA address          register
  struct OTG_HS_HCDMA7
    ADDRESS = BASE_ADDRESS + 0x1f4_u64

    protected def self.address : UInt64
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

    # DMA address
    def dmaaddr : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # DMA address
    def self.dmaaddr : UInt32
      value.dmaaddr
    end

    # DMA address
    def self.dmaaddr=(value : UInt32) : UInt32
      self.set(dmaaddr: value)
      value
    end

    def copy_with(
      *,

      dmaaddr : UInt32? = nil
    ) : self
      value = @value

      unless dmaaddr.nil?
        value = (value & 0xffffffff_u32) |
                UInt32.new!(dmaaddr.to_int).&(0x0_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      dmaaddr : UInt32? = nil
    ) : Nil
      self.value = self.value.copy_with(
        dmaaddr: dmaaddr,
      )
    end
  end # struct

  # OTG_HS host channel-8 DMA address          register
  struct OTG_HS_HCDMA8
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

    # DMA address
    def dmaaddr : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # DMA address
    def self.dmaaddr : UInt32
      value.dmaaddr
    end

    # DMA address
    def self.dmaaddr=(value : UInt32) : UInt32
      self.set(dmaaddr: value)
      value
    end

    def copy_with(
      *,

      dmaaddr : UInt32? = nil
    ) : self
      value = @value

      unless dmaaddr.nil?
        value = (value & 0xffffffff_u32) |
                UInt32.new!(dmaaddr.to_int).&(0x0_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      dmaaddr : UInt32? = nil
    ) : Nil
      self.value = self.value.copy_with(
        dmaaddr: dmaaddr,
      )
    end
  end # struct

  # OTG_HS host channel-9 DMA address          register
  struct OTG_HS_HCDMA9
    ADDRESS = BASE_ADDRESS + 0x234_u64

    protected def self.address : UInt64
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

    # DMA address
    def dmaaddr : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # DMA address
    def self.dmaaddr : UInt32
      value.dmaaddr
    end

    # DMA address
    def self.dmaaddr=(value : UInt32) : UInt32
      self.set(dmaaddr: value)
      value
    end

    def copy_with(
      *,

      dmaaddr : UInt32? = nil
    ) : self
      value = @value

      unless dmaaddr.nil?
        value = (value & 0xffffffff_u32) |
                UInt32.new!(dmaaddr.to_int).&(0x0_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      dmaaddr : UInt32? = nil
    ) : Nil
      self.value = self.value.copy_with(
        dmaaddr: dmaaddr,
      )
    end
  end # struct

  # OTG_HS host channel-10 DMA address          register
  struct OTG_HS_HCDMA10
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

    # DMA address
    def dmaaddr : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # DMA address
    def self.dmaaddr : UInt32
      value.dmaaddr
    end

    # DMA address
    def self.dmaaddr=(value : UInt32) : UInt32
      self.set(dmaaddr: value)
      value
    end

    def copy_with(
      *,

      dmaaddr : UInt32? = nil
    ) : self
      value = @value

      unless dmaaddr.nil?
        value = (value & 0xffffffff_u32) |
                UInt32.new!(dmaaddr.to_int).&(0x0_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      dmaaddr : UInt32? = nil
    ) : Nil
      self.value = self.value.copy_with(
        dmaaddr: dmaaddr,
      )
    end
  end # struct

  # OTG_HS host channel-11 DMA address          register
  struct OTG_HS_HCDMA11
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

    # DMA address
    def dmaaddr : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # DMA address
    def self.dmaaddr : UInt32
      value.dmaaddr
    end

    # DMA address
    def self.dmaaddr=(value : UInt32) : UInt32
      self.set(dmaaddr: value)
      value
    end

    def copy_with(
      *,

      dmaaddr : UInt32? = nil
    ) : self
      value = @value

      unless dmaaddr.nil?
        value = (value & 0xffffffff_u32) |
                UInt32.new!(dmaaddr.to_int).&(0x0_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      dmaaddr : UInt32? = nil
    ) : Nil
      self.value = self.value.copy_with(
        dmaaddr: dmaaddr,
      )
    end
  end # struct

end
