# USB on the go full speed
module OTG_FS_HOST
  VERSION      = nil
  BASE_ADDRESS = 0x50000400_u64

  # OTG_FS host configuration register          (OTG_FS_HCFG)
  struct FS_HCFG
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

  # OTG_FS Host frame interval          register
  struct HFIR
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

  # OTG_FS host frame number/frame time          remaining register (OTG_FS_HFNUM)
  struct FS_HFNUM
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

  # OTG_FS_Host periodic transmit FIFO/queue          status register (OTG_FS_HPTXSTS)
  struct FS_HPTXSTS
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

  # OTG_FS Host all channels interrupt          register
  struct HAINT
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

  # OTG_FS host all channels interrupt mask          register
  struct HAINTMSK
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

  # OTG_FS host port control and status register          (OTG_FS_HPRT)
  struct FS_HPRT
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

  # OTG_FS host channel-0 characteristics          register (OTG_FS_HCCHAR0)
  struct FS_HCCHAR0
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

    # Multicount
    def mcnt : UInt8
      UInt8.new!((@value >> 20) & 0x3_u32)
    end

    # Multicount
    def self.mcnt : UInt8
      value.mcnt
    end

    # Multicount
    def self.mcnt=(value : UInt8) : UInt8
      self.set(mcnt: value)
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

      mcnt : UInt8? = nil,

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

      unless mcnt.nil?
        value = (value & 0xffcfffff_u32) |
                UInt32.new!(mcnt.to_int).&(0x3_u32) << 20
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
      mcnt : UInt8? = nil,
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
        mcnt: mcnt,
        dad: dad,
        oddfrm: oddfrm,
        chdis: chdis,
        chena: chena,
      )
    end
  end # struct

  # OTG_FS host channel-1 characteristics          register (OTG_FS_HCCHAR1)
  struct FS_HCCHAR1
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

    # Multicount
    def mcnt : UInt8
      UInt8.new!((@value >> 20) & 0x3_u32)
    end

    # Multicount
    def self.mcnt : UInt8
      value.mcnt
    end

    # Multicount
    def self.mcnt=(value : UInt8) : UInt8
      self.set(mcnt: value)
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

      mcnt : UInt8? = nil,

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

      unless mcnt.nil?
        value = (value & 0xffcfffff_u32) |
                UInt32.new!(mcnt.to_int).&(0x3_u32) << 20
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
      mcnt : UInt8? = nil,
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
        mcnt: mcnt,
        dad: dad,
        oddfrm: oddfrm,
        chdis: chdis,
        chena: chena,
      )
    end
  end # struct

  # OTG_FS host channel-2 characteristics          register (OTG_FS_HCCHAR2)
  struct FS_HCCHAR2
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

    # Multicount
    def mcnt : UInt8
      UInt8.new!((@value >> 20) & 0x3_u32)
    end

    # Multicount
    def self.mcnt : UInt8
      value.mcnt
    end

    # Multicount
    def self.mcnt=(value : UInt8) : UInt8
      self.set(mcnt: value)
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

      mcnt : UInt8? = nil,

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

      unless mcnt.nil?
        value = (value & 0xffcfffff_u32) |
                UInt32.new!(mcnt.to_int).&(0x3_u32) << 20
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
      mcnt : UInt8? = nil,
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
        mcnt: mcnt,
        dad: dad,
        oddfrm: oddfrm,
        chdis: chdis,
        chena: chena,
      )
    end
  end # struct

  # OTG_FS host channel-3 characteristics          register (OTG_FS_HCCHAR3)
  struct FS_HCCHAR3
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

    # Multicount
    def mcnt : UInt8
      UInt8.new!((@value >> 20) & 0x3_u32)
    end

    # Multicount
    def self.mcnt : UInt8
      value.mcnt
    end

    # Multicount
    def self.mcnt=(value : UInt8) : UInt8
      self.set(mcnt: value)
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

      mcnt : UInt8? = nil,

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

      unless mcnt.nil?
        value = (value & 0xffcfffff_u32) |
                UInt32.new!(mcnt.to_int).&(0x3_u32) << 20
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
      mcnt : UInt8? = nil,
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
        mcnt: mcnt,
        dad: dad,
        oddfrm: oddfrm,
        chdis: chdis,
        chena: chena,
      )
    end
  end # struct

  # OTG_FS host channel-4 characteristics          register (OTG_FS_HCCHAR4)
  struct FS_HCCHAR4
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

    # Multicount
    def mcnt : UInt8
      UInt8.new!((@value >> 20) & 0x3_u32)
    end

    # Multicount
    def self.mcnt : UInt8
      value.mcnt
    end

    # Multicount
    def self.mcnt=(value : UInt8) : UInt8
      self.set(mcnt: value)
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

      mcnt : UInt8? = nil,

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

      unless mcnt.nil?
        value = (value & 0xffcfffff_u32) |
                UInt32.new!(mcnt.to_int).&(0x3_u32) << 20
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
      mcnt : UInt8? = nil,
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
        mcnt: mcnt,
        dad: dad,
        oddfrm: oddfrm,
        chdis: chdis,
        chena: chena,
      )
    end
  end # struct

  # OTG_FS host channel-5 characteristics          register (OTG_FS_HCCHAR5)
  struct FS_HCCHAR5
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

    # Multicount
    def mcnt : UInt8
      UInt8.new!((@value >> 20) & 0x3_u32)
    end

    # Multicount
    def self.mcnt : UInt8
      value.mcnt
    end

    # Multicount
    def self.mcnt=(value : UInt8) : UInt8
      self.set(mcnt: value)
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

      mcnt : UInt8? = nil,

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

      unless mcnt.nil?
        value = (value & 0xffcfffff_u32) |
                UInt32.new!(mcnt.to_int).&(0x3_u32) << 20
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
      mcnt : UInt8? = nil,
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
        mcnt: mcnt,
        dad: dad,
        oddfrm: oddfrm,
        chdis: chdis,
        chena: chena,
      )
    end
  end # struct

  # OTG_FS host channel-6 characteristics          register (OTG_FS_HCCHAR6)
  struct FS_HCCHAR6
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

    # Multicount
    def mcnt : UInt8
      UInt8.new!((@value >> 20) & 0x3_u32)
    end

    # Multicount
    def self.mcnt : UInt8
      value.mcnt
    end

    # Multicount
    def self.mcnt=(value : UInt8) : UInt8
      self.set(mcnt: value)
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

      mcnt : UInt8? = nil,

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

      unless mcnt.nil?
        value = (value & 0xffcfffff_u32) |
                UInt32.new!(mcnt.to_int).&(0x3_u32) << 20
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
      mcnt : UInt8? = nil,
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
        mcnt: mcnt,
        dad: dad,
        oddfrm: oddfrm,
        chdis: chdis,
        chena: chena,
      )
    end
  end # struct

  # OTG_FS host channel-7 characteristics          register (OTG_FS_HCCHAR7)
  struct FS_HCCHAR7
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

    # Multicount
    def mcnt : UInt8
      UInt8.new!((@value >> 20) & 0x3_u32)
    end

    # Multicount
    def self.mcnt : UInt8
      value.mcnt
    end

    # Multicount
    def self.mcnt=(value : UInt8) : UInt8
      self.set(mcnt: value)
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

      mcnt : UInt8? = nil,

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

      unless mcnt.nil?
        value = (value & 0xffcfffff_u32) |
                UInt32.new!(mcnt.to_int).&(0x3_u32) << 20
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
      mcnt : UInt8? = nil,
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
        mcnt: mcnt,
        dad: dad,
        oddfrm: oddfrm,
        chdis: chdis,
        chena: chena,
      )
    end
  end # struct

  # OTG_FS host channel-0 interrupt register          (OTG_FS_HCINT0)
  struct FS_HCINT0
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

      stall : Bool? = nil,

      nak : Bool? = nil,

      ack : Bool? = nil,

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
      stall : Bool? = nil,
      nak : Bool? = nil,
      ack : Bool? = nil,
      txerr : Bool? = nil,
      bberr : Bool? = nil,
      frmor : Bool? = nil,
      dterr : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        xfrc: xfrc,
        chh: chh,
        stall: stall,
        nak: nak,
        ack: ack,
        txerr: txerr,
        bberr: bberr,
        frmor: frmor,
        dterr: dterr,
      )
    end
  end # struct

  # OTG_FS host channel-1 interrupt register          (OTG_FS_HCINT1)
  struct FS_HCINT1
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

      stall : Bool? = nil,

      nak : Bool? = nil,

      ack : Bool? = nil,

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
      stall : Bool? = nil,
      nak : Bool? = nil,
      ack : Bool? = nil,
      txerr : Bool? = nil,
      bberr : Bool? = nil,
      frmor : Bool? = nil,
      dterr : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        xfrc: xfrc,
        chh: chh,
        stall: stall,
        nak: nak,
        ack: ack,
        txerr: txerr,
        bberr: bberr,
        frmor: frmor,
        dterr: dterr,
      )
    end
  end # struct

  # OTG_FS host channel-2 interrupt register          (OTG_FS_HCINT2)
  struct FS_HCINT2
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

      stall : Bool? = nil,

      nak : Bool? = nil,

      ack : Bool? = nil,

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
      stall : Bool? = nil,
      nak : Bool? = nil,
      ack : Bool? = nil,
      txerr : Bool? = nil,
      bberr : Bool? = nil,
      frmor : Bool? = nil,
      dterr : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        xfrc: xfrc,
        chh: chh,
        stall: stall,
        nak: nak,
        ack: ack,
        txerr: txerr,
        bberr: bberr,
        frmor: frmor,
        dterr: dterr,
      )
    end
  end # struct

  # OTG_FS host channel-3 interrupt register          (OTG_FS_HCINT3)
  struct FS_HCINT3
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

      stall : Bool? = nil,

      nak : Bool? = nil,

      ack : Bool? = nil,

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
      stall : Bool? = nil,
      nak : Bool? = nil,
      ack : Bool? = nil,
      txerr : Bool? = nil,
      bberr : Bool? = nil,
      frmor : Bool? = nil,
      dterr : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        xfrc: xfrc,
        chh: chh,
        stall: stall,
        nak: nak,
        ack: ack,
        txerr: txerr,
        bberr: bberr,
        frmor: frmor,
        dterr: dterr,
      )
    end
  end # struct

  # OTG_FS host channel-4 interrupt register          (OTG_FS_HCINT4)
  struct FS_HCINT4
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

      stall : Bool? = nil,

      nak : Bool? = nil,

      ack : Bool? = nil,

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
      stall : Bool? = nil,
      nak : Bool? = nil,
      ack : Bool? = nil,
      txerr : Bool? = nil,
      bberr : Bool? = nil,
      frmor : Bool? = nil,
      dterr : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        xfrc: xfrc,
        chh: chh,
        stall: stall,
        nak: nak,
        ack: ack,
        txerr: txerr,
        bberr: bberr,
        frmor: frmor,
        dterr: dterr,
      )
    end
  end # struct

  # OTG_FS host channel-5 interrupt register          (OTG_FS_HCINT5)
  struct FS_HCINT5
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

      stall : Bool? = nil,

      nak : Bool? = nil,

      ack : Bool? = nil,

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
      stall : Bool? = nil,
      nak : Bool? = nil,
      ack : Bool? = nil,
      txerr : Bool? = nil,
      bberr : Bool? = nil,
      frmor : Bool? = nil,
      dterr : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        xfrc: xfrc,
        chh: chh,
        stall: stall,
        nak: nak,
        ack: ack,
        txerr: txerr,
        bberr: bberr,
        frmor: frmor,
        dterr: dterr,
      )
    end
  end # struct

  # OTG_FS host channel-6 interrupt register          (OTG_FS_HCINT6)
  struct FS_HCINT6
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

      stall : Bool? = nil,

      nak : Bool? = nil,

      ack : Bool? = nil,

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
      stall : Bool? = nil,
      nak : Bool? = nil,
      ack : Bool? = nil,
      txerr : Bool? = nil,
      bberr : Bool? = nil,
      frmor : Bool? = nil,
      dterr : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        xfrc: xfrc,
        chh: chh,
        stall: stall,
        nak: nak,
        ack: ack,
        txerr: txerr,
        bberr: bberr,
        frmor: frmor,
        dterr: dterr,
      )
    end
  end # struct

  # OTG_FS host channel-7 interrupt register          (OTG_FS_HCINT7)
  struct FS_HCINT7
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

      stall : Bool? = nil,

      nak : Bool? = nil,

      ack : Bool? = nil,

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
      stall : Bool? = nil,
      nak : Bool? = nil,
      ack : Bool? = nil,
      txerr : Bool? = nil,
      bberr : Bool? = nil,
      frmor : Bool? = nil,
      dterr : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        xfrc: xfrc,
        chh: chh,
        stall: stall,
        nak: nak,
        ack: ack,
        txerr: txerr,
        bberr: bberr,
        frmor: frmor,
        dterr: dterr,
      )
    end
  end # struct

  # OTG_FS host channel-0 mask register          (OTG_FS_HCINTMSK0)
  struct FS_HCINTMSK0
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

  # OTG_FS host channel-1 mask register          (OTG_FS_HCINTMSK1)
  struct FS_HCINTMSK1
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

  # OTG_FS host channel-2 mask register          (OTG_FS_HCINTMSK2)
  struct FS_HCINTMSK2
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

  # OTG_FS host channel-3 mask register          (OTG_FS_HCINTMSK3)
  struct FS_HCINTMSK3
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

  # OTG_FS host channel-4 mask register          (OTG_FS_HCINTMSK4)
  struct FS_HCINTMSK4
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

  # OTG_FS host channel-5 mask register          (OTG_FS_HCINTMSK5)
  struct FS_HCINTMSK5
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

  # OTG_FS host channel-6 mask register          (OTG_FS_HCINTMSK6)
  struct FS_HCINTMSK6
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

  # OTG_FS host channel-7 mask register          (OTG_FS_HCINTMSK7)
  struct FS_HCINTMSK7
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

  # OTG_FS host channel-0 transfer size          register
  struct FS_HCTSIZ0
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

  # OTG_FS host channel-1 transfer size          register
  struct FS_HCTSIZ1
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

  # OTG_FS host channel-2 transfer size          register
  struct FS_HCTSIZ2
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

  # OTG_FS host channel-3 transfer size          register
  struct FS_HCTSIZ3
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

  # OTG_FS host channel-x transfer size          register
  struct FS_HCTSIZ4
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

  # OTG_FS host channel-5 transfer size          register
  struct FS_HCTSIZ5
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

  # OTG_FS host channel-6 transfer size          register
  struct FS_HCTSIZ6
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

  # OTG_FS host channel-7 transfer size          register
  struct FS_HCTSIZ7
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

end
