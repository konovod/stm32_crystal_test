# Ethernet: media access control      (MAC)
module Ethernet_MAC
  VERSION      = nil
  BASE_ADDRESS = 0x40028000_u64

  # Ethernet MAC configuration          register
  struct MACCR
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
      new(0x8000_u64)
    end

    def self.pointer : Pointer(UInt32)
      Pointer(UInt32).new(self.address)
    end

    def self.value : self
      value = self.pointer.load(volatile: true)
      new(value)
    end

    def self.value=(value : self) : self
      self.pointer.store(value.to_int, volatile: true)
      value
    end

    # RE
    def re : Bool
      @value.bits_set?(0x4_u32)
    end

    # RE
    def self.re : Bool
      value.re
    end

    # RE
    def self.re=(value : Bool) : Bool
      self.set(re: value)
      value
    end

    # TE
    def te : Bool
      @value.bits_set?(0x8_u32)
    end

    # TE
    def self.te : Bool
      value.te
    end

    # TE
    def self.te=(value : Bool) : Bool
      self.set(te: value)
      value
    end

    # DC
    def dc : Bool
      @value.bits_set?(0x10_u32)
    end

    # DC
    def self.dc : Bool
      value.dc
    end

    # DC
    def self.dc=(value : Bool) : Bool
      self.set(dc: value)
      value
    end

    # BL
    def bl : UInt8
      UInt8.new!((@value >> 5) & 0x3_u32)
    end

    # BL
    def self.bl : UInt8
      value.bl
    end

    # BL
    def self.bl=(value : UInt8) : UInt8
      self.set(bl: value)
      value
    end

    # APCS
    def apcs : Bool
      @value.bits_set?(0x80_u32)
    end

    # APCS
    def self.apcs : Bool
      value.apcs
    end

    # APCS
    def self.apcs=(value : Bool) : Bool
      self.set(apcs: value)
      value
    end

    # RD
    def rd : Bool
      @value.bits_set?(0x200_u32)
    end

    # RD
    def self.rd : Bool
      value.rd
    end

    # RD
    def self.rd=(value : Bool) : Bool
      self.set(rd: value)
      value
    end

    # IPCO
    def ipco : Bool
      @value.bits_set?(0x400_u32)
    end

    # IPCO
    def self.ipco : Bool
      value.ipco
    end

    # IPCO
    def self.ipco=(value : Bool) : Bool
      self.set(ipco: value)
      value
    end

    # DM
    def dm : Bool
      @value.bits_set?(0x800_u32)
    end

    # DM
    def self.dm : Bool
      value.dm
    end

    # DM
    def self.dm=(value : Bool) : Bool
      self.set(dm: value)
      value
    end

    # LM
    def lm : Bool
      @value.bits_set?(0x1000_u32)
    end

    # LM
    def self.lm : Bool
      value.lm
    end

    # LM
    def self.lm=(value : Bool) : Bool
      self.set(lm: value)
      value
    end

    # ROD
    def rod : Bool
      @value.bits_set?(0x2000_u32)
    end

    # ROD
    def self.rod : Bool
      value.rod
    end

    # ROD
    def self.rod=(value : Bool) : Bool
      self.set(rod: value)
      value
    end

    # FES
    def fes : Bool
      @value.bits_set?(0x4000_u32)
    end

    # FES
    def self.fes : Bool
      value.fes
    end

    # FES
    def self.fes=(value : Bool) : Bool
      self.set(fes: value)
      value
    end

    # CSD
    def csd : Bool
      @value.bits_set?(0x10000_u32)
    end

    # CSD
    def self.csd : Bool
      value.csd
    end

    # CSD
    def self.csd=(value : Bool) : Bool
      self.set(csd: value)
      value
    end

    # IFG
    def ifg : UInt8
      UInt8.new!((@value >> 17) & 0x7_u32)
    end

    # IFG
    def self.ifg : UInt8
      value.ifg
    end

    # IFG
    def self.ifg=(value : UInt8) : UInt8
      self.set(ifg: value)
      value
    end

    # JD
    def jd : Bool
      @value.bits_set?(0x400000_u32)
    end

    # JD
    def self.jd : Bool
      value.jd
    end

    # JD
    def self.jd=(value : Bool) : Bool
      self.set(jd: value)
      value
    end

    # WD
    def wd : Bool
      @value.bits_set?(0x800000_u32)
    end

    # WD
    def self.wd : Bool
      value.wd
    end

    # WD
    def self.wd=(value : Bool) : Bool
      self.set(wd: value)
      value
    end

    # CSTF
    def cstf : Bool
      @value.bits_set?(0x2000000_u32)
    end

    # CSTF
    def self.cstf : Bool
      value.cstf
    end

    # CSTF
    def self.cstf=(value : Bool) : Bool
      self.set(cstf: value)
      value
    end

    def copy_with(
      *,

      re : Bool? = nil,

      te : Bool? = nil,

      dc : Bool? = nil,

      bl : UInt8? = nil,

      apcs : Bool? = nil,

      rd : Bool? = nil,

      ipco : Bool? = nil,

      dm : Bool? = nil,

      lm : Bool? = nil,

      rod : Bool? = nil,

      fes : Bool? = nil,

      csd : Bool? = nil,

      ifg : UInt8? = nil,

      jd : Bool? = nil,

      wd : Bool? = nil,

      cstf : Bool? = nil
    ) : self
      value = @value

      unless re.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(re.to_int).&(0x1_u32) << 2
      end

      unless te.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(te.to_int).&(0x1_u32) << 3
      end

      unless dc.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(dc.to_int).&(0x1_u32) << 4
      end

      unless bl.nil?
        value = (value & 0xffffff9f_u32) |
                UInt32.new!(bl.to_int).&(0x3_u32) << 5
      end

      unless apcs.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(apcs.to_int).&(0x1_u32) << 7
      end

      unless rd.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(rd.to_int).&(0x1_u32) << 9
      end

      unless ipco.nil?
        value = (value & 0xfffffbff_u32) |
                UInt32.new!(ipco.to_int).&(0x1_u32) << 10
      end

      unless dm.nil?
        value = (value & 0xfffff7ff_u32) |
                UInt32.new!(dm.to_int).&(0x1_u32) << 11
      end

      unless lm.nil?
        value = (value & 0xffffefff_u32) |
                UInt32.new!(lm.to_int).&(0x1_u32) << 12
      end

      unless rod.nil?
        value = (value & 0xffffdfff_u32) |
                UInt32.new!(rod.to_int).&(0x1_u32) << 13
      end

      unless fes.nil?
        value = (value & 0xffffbfff_u32) |
                UInt32.new!(fes.to_int).&(0x1_u32) << 14
      end

      unless csd.nil?
        value = (value & 0xfffeffff_u32) |
                UInt32.new!(csd.to_int).&(0x1_u32) << 16
      end

      unless ifg.nil?
        value = (value & 0xfff1ffff_u32) |
                UInt32.new!(ifg.to_int).&(0x7_u32) << 17
      end

      unless jd.nil?
        value = (value & 0xffbfffff_u32) |
                UInt32.new!(jd.to_int).&(0x1_u32) << 22
      end

      unless wd.nil?
        value = (value & 0xff7fffff_u32) |
                UInt32.new!(wd.to_int).&(0x1_u32) << 23
      end

      unless cstf.nil?
        value = (value & 0xfdffffff_u32) |
                UInt32.new!(cstf.to_int).&(0x1_u32) << 25
      end

      self.class.new(value)
    end

    def self.set(
      *,
      re : Bool? = nil,
      te : Bool? = nil,
      dc : Bool? = nil,
      bl : UInt8? = nil,
      apcs : Bool? = nil,
      rd : Bool? = nil,
      ipco : Bool? = nil,
      dm : Bool? = nil,
      lm : Bool? = nil,
      rod : Bool? = nil,
      fes : Bool? = nil,
      csd : Bool? = nil,
      ifg : UInt8? = nil,
      jd : Bool? = nil,
      wd : Bool? = nil,
      cstf : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        re: re,
        te: te,
        dc: dc,
        bl: bl,
        apcs: apcs,
        rd: rd,
        ipco: ipco,
        dm: dm,
        lm: lm,
        rod: rod,
        fes: fes,
        csd: csd,
        ifg: ifg,
        jd: jd,
        wd: wd,
        cstf: cstf,
      )
    end
  end # struct

  # Ethernet MAC frame filter          register
  struct MACFFR
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

    # PM
    def pm : Bool
      @value.bits_set?(0x1_u32)
    end

    # PM
    def self.pm : Bool
      value.pm
    end

    # PM
    def self.pm=(value : Bool) : Bool
      self.set(pm: value)
      value
    end

    # HU
    def hu : Bool
      @value.bits_set?(0x2_u32)
    end

    # HU
    def self.hu : Bool
      value.hu
    end

    # HU
    def self.hu=(value : Bool) : Bool
      self.set(hu: value)
      value
    end

    # HM
    def hm : Bool
      @value.bits_set?(0x4_u32)
    end

    # HM
    def self.hm : Bool
      value.hm
    end

    # HM
    def self.hm=(value : Bool) : Bool
      self.set(hm: value)
      value
    end

    # DAIF
    def daif : Bool
      @value.bits_set?(0x8_u32)
    end

    # DAIF
    def self.daif : Bool
      value.daif
    end

    # DAIF
    def self.daif=(value : Bool) : Bool
      self.set(daif: value)
      value
    end

    # RAM
    def ram : Bool
      @value.bits_set?(0x10_u32)
    end

    # RAM
    def self.ram : Bool
      value.ram
    end

    # RAM
    def self.ram=(value : Bool) : Bool
      self.set(ram: value)
      value
    end

    # BFD
    def bfd : Bool
      @value.bits_set?(0x20_u32)
    end

    # BFD
    def self.bfd : Bool
      value.bfd
    end

    # BFD
    def self.bfd=(value : Bool) : Bool
      self.set(bfd: value)
      value
    end

    # PCF
    def pcf : Bool
      @value.bits_set?(0x40_u32)
    end

    # PCF
    def self.pcf : Bool
      value.pcf
    end

    # PCF
    def self.pcf=(value : Bool) : Bool
      self.set(pcf: value)
      value
    end

    # SAIF
    def saif : Bool
      @value.bits_set?(0x80_u32)
    end

    # SAIF
    def self.saif : Bool
      value.saif
    end

    # SAIF
    def self.saif=(value : Bool) : Bool
      self.set(saif: value)
      value
    end

    # SAF
    def saf : Bool
      @value.bits_set?(0x100_u32)
    end

    # SAF
    def self.saf : Bool
      value.saf
    end

    # SAF
    def self.saf=(value : Bool) : Bool
      self.set(saf: value)
      value
    end

    # HPF
    def hpf : Bool
      @value.bits_set?(0x200_u32)
    end

    # HPF
    def self.hpf : Bool
      value.hpf
    end

    # HPF
    def self.hpf=(value : Bool) : Bool
      self.set(hpf: value)
      value
    end

    # RA
    def ra : Bool
      @value.bits_set?(0x80000000_u32)
    end

    # RA
    def self.ra : Bool
      value.ra
    end

    # RA
    def self.ra=(value : Bool) : Bool
      self.set(ra: value)
      value
    end

    def copy_with(
      *,

      pm : Bool? = nil,

      hu : Bool? = nil,

      hm : Bool? = nil,

      daif : Bool? = nil,

      ram : Bool? = nil,

      bfd : Bool? = nil,

      pcf : Bool? = nil,

      saif : Bool? = nil,

      saf : Bool? = nil,

      hpf : Bool? = nil,

      ra : Bool? = nil
    ) : self
      value = @value

      unless pm.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(pm.to_int).&(0x1_u32) << 0
      end

      unless hu.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(hu.to_int).&(0x1_u32) << 1
      end

      unless hm.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(hm.to_int).&(0x1_u32) << 2
      end

      unless daif.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(daif.to_int).&(0x1_u32) << 3
      end

      unless ram.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(ram.to_int).&(0x1_u32) << 4
      end

      unless bfd.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(bfd.to_int).&(0x1_u32) << 5
      end

      unless pcf.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(pcf.to_int).&(0x1_u32) << 6
      end

      unless saif.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(saif.to_int).&(0x1_u32) << 7
      end

      unless saf.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(saf.to_int).&(0x1_u32) << 8
      end

      unless hpf.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(hpf.to_int).&(0x1_u32) << 9
      end

      unless ra.nil?
        value = (value & 0x7fffffff_u32) |
                UInt32.new!(ra.to_int).&(0x1_u32) << 31
      end

      self.class.new(value)
    end

    def self.set(
      *,
      pm : Bool? = nil,
      hu : Bool? = nil,
      hm : Bool? = nil,
      daif : Bool? = nil,
      ram : Bool? = nil,
      bfd : Bool? = nil,
      pcf : Bool? = nil,
      saif : Bool? = nil,
      saf : Bool? = nil,
      hpf : Bool? = nil,
      ra : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        pm: pm,
        hu: hu,
        hm: hm,
        daif: daif,
        ram: ram,
        bfd: bfd,
        pcf: pcf,
        saif: saif,
        saf: saf,
        hpf: hpf,
        ra: ra,
      )
    end
  end # struct

  # Ethernet MAC hash table high          register
  struct MACHTHR
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

    # HTH
    def hth : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # HTH
    def self.hth : UInt32
      value.hth
    end

    # HTH
    def self.hth=(value : UInt32) : UInt32
      self.set(hth: value)
      value
    end

    def copy_with(
      *,

      hth : UInt32? = nil
    ) : self
      value = @value

      unless hth.nil?
        value = (value & 0xffffffff_u32) |
                UInt32.new!(hth.to_int).&(0x0_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      hth : UInt32? = nil
    ) : Nil
      self.value = self.value.copy_with(
        hth: hth,
      )
    end
  end # struct

  # Ethernet MAC hash table low          register
  struct MACHTLR
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

    # HTL
    def htl : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # HTL
    def self.htl : UInt32
      value.htl
    end

    # HTL
    def self.htl=(value : UInt32) : UInt32
      self.set(htl: value)
      value
    end

    def copy_with(
      *,

      htl : UInt32? = nil
    ) : self
      value = @value

      unless htl.nil?
        value = (value & 0xffffffff_u32) |
                UInt32.new!(htl.to_int).&(0x0_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      htl : UInt32? = nil
    ) : Nil
      self.value = self.value.copy_with(
        htl: htl,
      )
    end
  end # struct

  # Ethernet MAC MII address          register
  struct MACMIIAR
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

    # MB
    def mb : Bool
      @value.bits_set?(0x1_u32)
    end

    # MB
    def self.mb : Bool
      value.mb
    end

    # MB
    def self.mb=(value : Bool) : Bool
      self.set(mb: value)
      value
    end

    # MW
    def mw : Bool
      @value.bits_set?(0x2_u32)
    end

    # MW
    def self.mw : Bool
      value.mw
    end

    # MW
    def self.mw=(value : Bool) : Bool
      self.set(mw: value)
      value
    end

    # CR
    def cr : UInt8
      UInt8.new!((@value >> 2) & 0x7_u32)
    end

    # CR
    def self.cr : UInt8
      value.cr
    end

    # CR
    def self.cr=(value : UInt8) : UInt8
      self.set(cr: value)
      value
    end

    # MR
    def mr : UInt8
      UInt8.new!((@value >> 6) & 0x1f_u32)
    end

    # MR
    def self.mr : UInt8
      value.mr
    end

    # MR
    def self.mr=(value : UInt8) : UInt8
      self.set(mr: value)
      value
    end

    # PA
    def pa : UInt8
      UInt8.new!((@value >> 11) & 0x1f_u32)
    end

    # PA
    def self.pa : UInt8
      value.pa
    end

    # PA
    def self.pa=(value : UInt8) : UInt8
      self.set(pa: value)
      value
    end

    def copy_with(
      *,

      mb : Bool? = nil,

      mw : Bool? = nil,

      cr : UInt8? = nil,

      mr : UInt8? = nil,

      pa : UInt8? = nil
    ) : self
      value = @value

      unless mb.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(mb.to_int).&(0x1_u32) << 0
      end

      unless mw.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(mw.to_int).&(0x1_u32) << 1
      end

      unless cr.nil?
        value = (value & 0xffffffe3_u32) |
                UInt32.new!(cr.to_int).&(0x7_u32) << 2
      end

      unless mr.nil?
        value = (value & 0xfffff83f_u32) |
                UInt32.new!(mr.to_int).&(0x1f_u32) << 6
      end

      unless pa.nil?
        value = (value & 0xffff07ff_u32) |
                UInt32.new!(pa.to_int).&(0x1f_u32) << 11
      end

      self.class.new(value)
    end

    def self.set(
      *,
      mb : Bool? = nil,
      mw : Bool? = nil,
      cr : UInt8? = nil,
      mr : UInt8? = nil,
      pa : UInt8? = nil
    ) : Nil
      self.value = self.value.copy_with(
        mb: mb,
        mw: mw,
        cr: cr,
        mr: mr,
        pa: pa,
      )
    end
  end # struct

  # Ethernet MAC MII data register
  struct MACMIIDR
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

    # TD
    def td : UInt16
      UInt16.new!((@value >> 0) & 0xffff_u32)
    end

    # TD
    def self.td : UInt16
      value.td
    end

    # TD
    def self.td=(value : UInt16) : UInt16
      self.set(td: value)
      value
    end

    def copy_with(
      *,

      td : UInt16? = nil
    ) : self
      value = @value

      unless td.nil?
        value = (value & 0xffff0000_u32) |
                UInt32.new!(td.to_int).&(0xffff_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      td : UInt16? = nil
    ) : Nil
      self.value = self.value.copy_with(
        td: td,
      )
    end
  end # struct

  # Ethernet MAC flow control          register
  struct MACFCR
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

    # FCB
    def fcb : Bool
      @value.bits_set?(0x1_u32)
    end

    # FCB
    def self.fcb : Bool
      value.fcb
    end

    # FCB
    def self.fcb=(value : Bool) : Bool
      self.set(fcb: value)
      value
    end

    # TFCE
    def tfce : Bool
      @value.bits_set?(0x2_u32)
    end

    # TFCE
    def self.tfce : Bool
      value.tfce
    end

    # TFCE
    def self.tfce=(value : Bool) : Bool
      self.set(tfce: value)
      value
    end

    # RFCE
    def rfce : Bool
      @value.bits_set?(0x4_u32)
    end

    # RFCE
    def self.rfce : Bool
      value.rfce
    end

    # RFCE
    def self.rfce=(value : Bool) : Bool
      self.set(rfce: value)
      value
    end

    # UPFD
    def upfd : Bool
      @value.bits_set?(0x8_u32)
    end

    # UPFD
    def self.upfd : Bool
      value.upfd
    end

    # UPFD
    def self.upfd=(value : Bool) : Bool
      self.set(upfd: value)
      value
    end

    # PLT
    def plt : UInt8
      UInt8.new!((@value >> 4) & 0x3_u32)
    end

    # PLT
    def self.plt : UInt8
      value.plt
    end

    # PLT
    def self.plt=(value : UInt8) : UInt8
      self.set(plt: value)
      value
    end

    # ZQPD
    def zqpd : Bool
      @value.bits_set?(0x80_u32)
    end

    # ZQPD
    def self.zqpd : Bool
      value.zqpd
    end

    # ZQPD
    def self.zqpd=(value : Bool) : Bool
      self.set(zqpd: value)
      value
    end

    # PT
    def pt : UInt16
      UInt16.new!((@value >> 16) & 0xffff_u32)
    end

    # PT
    def self.pt : UInt16
      value.pt
    end

    # PT
    def self.pt=(value : UInt16) : UInt16
      self.set(pt: value)
      value
    end

    def copy_with(
      *,

      fcb : Bool? = nil,

      tfce : Bool? = nil,

      rfce : Bool? = nil,

      upfd : Bool? = nil,

      plt : UInt8? = nil,

      zqpd : Bool? = nil,

      pt : UInt16? = nil
    ) : self
      value = @value

      unless fcb.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(fcb.to_int).&(0x1_u32) << 0
      end

      unless tfce.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(tfce.to_int).&(0x1_u32) << 1
      end

      unless rfce.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(rfce.to_int).&(0x1_u32) << 2
      end

      unless upfd.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(upfd.to_int).&(0x1_u32) << 3
      end

      unless plt.nil?
        value = (value & 0xffffffcf_u32) |
                UInt32.new!(plt.to_int).&(0x3_u32) << 4
      end

      unless zqpd.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(zqpd.to_int).&(0x1_u32) << 7
      end

      unless pt.nil?
        value = (value & 0xffff_u32) |
                UInt32.new!(pt.to_int).&(0xffff_u32) << 16
      end

      self.class.new(value)
    end

    def self.set(
      *,
      fcb : Bool? = nil,
      tfce : Bool? = nil,
      rfce : Bool? = nil,
      upfd : Bool? = nil,
      plt : UInt8? = nil,
      zqpd : Bool? = nil,
      pt : UInt16? = nil
    ) : Nil
      self.value = self.value.copy_with(
        fcb: fcb,
        tfce: tfce,
        rfce: rfce,
        upfd: upfd,
        plt: plt,
        zqpd: zqpd,
        pt: pt,
      )
    end
  end # struct

  # Ethernet MAC VLAN tag register
  struct MACVLANTR
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

    # VLANTI
    def vlanti : UInt16
      UInt16.new!((@value >> 0) & 0xffff_u32)
    end

    # VLANTI
    def self.vlanti : UInt16
      value.vlanti
    end

    # VLANTI
    def self.vlanti=(value : UInt16) : UInt16
      self.set(vlanti: value)
      value
    end

    # VLANTC
    def vlantc : Bool
      @value.bits_set?(0x10000_u32)
    end

    # VLANTC
    def self.vlantc : Bool
      value.vlantc
    end

    # VLANTC
    def self.vlantc=(value : Bool) : Bool
      self.set(vlantc: value)
      value
    end

    def copy_with(
      *,

      vlanti : UInt16? = nil,

      vlantc : Bool? = nil
    ) : self
      value = @value

      unless vlanti.nil?
        value = (value & 0xffff0000_u32) |
                UInt32.new!(vlanti.to_int).&(0xffff_u32) << 0
      end

      unless vlantc.nil?
        value = (value & 0xfffeffff_u32) |
                UInt32.new!(vlantc.to_int).&(0x1_u32) << 16
      end

      self.class.new(value)
    end

    def self.set(
      *,
      vlanti : UInt16? = nil,
      vlantc : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        vlanti: vlanti,
        vlantc: vlantc,
      )
    end
  end # struct

  # Ethernet MAC PMT control and status          register
  struct MACPMTCSR
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
      new(0x0_u64)
    end

    def self.pointer : Pointer(UInt32)
      Pointer(UInt32).new(self.address)
    end

    def self.value : self
      value = self.pointer.load(volatile: true)
      new(value)
    end

    def self.value=(value : self) : self
      self.pointer.store(value.to_int, volatile: true)
      value
    end

    # PD
    def pd : Bool
      @value.bits_set?(0x1_u32)
    end

    # PD
    def self.pd : Bool
      value.pd
    end

    # PD
    def self.pd=(value : Bool) : Bool
      self.set(pd: value)
      value
    end

    # MPE
    def mpe : Bool
      @value.bits_set?(0x2_u32)
    end

    # MPE
    def self.mpe : Bool
      value.mpe
    end

    # MPE
    def self.mpe=(value : Bool) : Bool
      self.set(mpe: value)
      value
    end

    # WFE
    def wfe : Bool
      @value.bits_set?(0x4_u32)
    end

    # WFE
    def self.wfe : Bool
      value.wfe
    end

    # WFE
    def self.wfe=(value : Bool) : Bool
      self.set(wfe: value)
      value
    end

    # MPR
    def mpr : Bool
      @value.bits_set?(0x20_u32)
    end

    # MPR
    def self.mpr : Bool
      value.mpr
    end

    # MPR
    def self.mpr=(value : Bool) : Bool
      self.set(mpr: value)
      value
    end

    # WFR
    def wfr : Bool
      @value.bits_set?(0x40_u32)
    end

    # WFR
    def self.wfr : Bool
      value.wfr
    end

    # WFR
    def self.wfr=(value : Bool) : Bool
      self.set(wfr: value)
      value
    end

    # GU
    def gu : Bool
      @value.bits_set?(0x200_u32)
    end

    # GU
    def self.gu : Bool
      value.gu
    end

    # GU
    def self.gu=(value : Bool) : Bool
      self.set(gu: value)
      value
    end

    # WFFRPR
    def wffrpr : Bool
      @value.bits_set?(0x80000000_u32)
    end

    # WFFRPR
    def self.wffrpr : Bool
      value.wffrpr
    end

    # WFFRPR
    def self.wffrpr=(value : Bool) : Bool
      self.set(wffrpr: value)
      value
    end

    def copy_with(
      *,

      pd : Bool? = nil,

      mpe : Bool? = nil,

      wfe : Bool? = nil,

      mpr : Bool? = nil,

      wfr : Bool? = nil,

      gu : Bool? = nil,

      wffrpr : Bool? = nil
    ) : self
      value = @value

      unless pd.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(pd.to_int).&(0x1_u32) << 0
      end

      unless mpe.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(mpe.to_int).&(0x1_u32) << 1
      end

      unless wfe.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(wfe.to_int).&(0x1_u32) << 2
      end

      unless mpr.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(mpr.to_int).&(0x1_u32) << 5
      end

      unless wfr.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(wfr.to_int).&(0x1_u32) << 6
      end

      unless gu.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(gu.to_int).&(0x1_u32) << 9
      end

      unless wffrpr.nil?
        value = (value & 0x7fffffff_u32) |
                UInt32.new!(wffrpr.to_int).&(0x1_u32) << 31
      end

      self.class.new(value)
    end

    def self.set(
      *,
      pd : Bool? = nil,
      mpe : Bool? = nil,
      wfe : Bool? = nil,
      mpr : Bool? = nil,
      wfr : Bool? = nil,
      gu : Bool? = nil,
      wffrpr : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        pd: pd,
        mpe: mpe,
        wfe: wfe,
        mpr: mpr,
        wfr: wfr,
        gu: gu,
        wffrpr: wffrpr,
      )
    end
  end # struct

  # Ethernet MAC debug register
  struct MACDBGR
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

    # CR
    def cr : Bool
      @value.bits_set?(0x1_u32)
    end

    # CR
    def self.cr : Bool
      value.cr
    end

    # CSR
    def csr : Bool
      @value.bits_set?(0x2_u32)
    end

    # CSR
    def self.csr : Bool
      value.csr
    end

    # ROR
    def ror : Bool
      @value.bits_set?(0x4_u32)
    end

    # ROR
    def self.ror : Bool
      value.ror
    end

    # MCF
    def mcf : Bool
      @value.bits_set?(0x8_u32)
    end

    # MCF
    def self.mcf : Bool
      value.mcf
    end

    # MCP
    def mcp : Bool
      @value.bits_set?(0x10_u32)
    end

    # MCP
    def self.mcp : Bool
      value.mcp
    end

    # MCFHP
    def mcfhp : Bool
      @value.bits_set?(0x20_u32)
    end

    # MCFHP
    def self.mcfhp : Bool
      value.mcfhp
    end
  end # struct

  # Ethernet MAC interrupt status          register
  struct MACSR
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

    # PMTS
    def pmts : Bool
      @value.bits_set?(0x8_u32)
    end

    # PMTS
    def self.pmts : Bool
      value.pmts
    end

    # MMCS
    def mmcs : Bool
      @value.bits_set?(0x10_u32)
    end

    # MMCS
    def self.mmcs : Bool
      value.mmcs
    end

    # MMCRS
    def mmcrs : Bool
      @value.bits_set?(0x20_u32)
    end

    # MMCRS
    def self.mmcrs : Bool
      value.mmcrs
    end

    # MMCTS
    def mmcts : Bool
      @value.bits_set?(0x40_u32)
    end

    # MMCTS
    def self.mmcts : Bool
      value.mmcts
    end

    # TSTS
    def tsts : Bool
      @value.bits_set?(0x200_u32)
    end

    # TSTS
    def self.tsts : Bool
      value.tsts
    end

    # TSTS
    def self.tsts=(value : Bool) : Bool
      self.set(tsts: value)
      value
    end

    def copy_with(
      *,

      tsts : Bool? = nil
    ) : self
      value = @value

      unless tsts.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(tsts.to_int).&(0x1_u32) << 9
      end

      self.class.new(value)
    end

    def self.set(
      *,
      tsts : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        tsts: tsts,
      )
    end
  end # struct

  # Ethernet MAC interrupt mask          register
  struct MACIMR
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

    # PMTIM
    def pmtim : Bool
      @value.bits_set?(0x8_u32)
    end

    # PMTIM
    def self.pmtim : Bool
      value.pmtim
    end

    # PMTIM
    def self.pmtim=(value : Bool) : Bool
      self.set(pmtim: value)
      value
    end

    # TSTIM
    def tstim : Bool
      @value.bits_set?(0x200_u32)
    end

    # TSTIM
    def self.tstim : Bool
      value.tstim
    end

    # TSTIM
    def self.tstim=(value : Bool) : Bool
      self.set(tstim: value)
      value
    end

    def copy_with(
      *,

      pmtim : Bool? = nil,

      tstim : Bool? = nil
    ) : self
      value = @value

      unless pmtim.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(pmtim.to_int).&(0x1_u32) << 3
      end

      unless tstim.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(tstim.to_int).&(0x1_u32) << 9
      end

      self.class.new(value)
    end

    def self.set(
      *,
      pmtim : Bool? = nil,
      tstim : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        pmtim: pmtim,
        tstim: tstim,
      )
    end
  end # struct

  # Ethernet MAC address 0 high          register
  struct MACA0HR
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
      new(0x10ffff_u64)
    end

    def self.pointer : Pointer(UInt32)
      Pointer(UInt32).new(self.address)
    end

    def self.value : self
      value = self.pointer.load(volatile: true)
      new(value)
    end

    def self.value=(value : self) : self
      self.pointer.store(value.to_int, volatile: true)
      value
    end

    # MAC address0 high
    def maca0_h : UInt16
      UInt16.new!((@value >> 0) & 0xffff_u32)
    end

    # MAC address0 high
    def self.maca0_h : UInt16
      value.maca0_h
    end

    # MAC address0 high
    def self.maca0_h=(value : UInt16) : UInt16
      self.set(maca0_h: value)
      value
    end

    # Always 1
    def mo : Bool
      @value.bits_set?(0x80000000_u32)
    end

    # Always 1
    def self.mo : Bool
      value.mo
    end

    def copy_with(
      *,

      maca0_h : UInt16? = nil
    ) : self
      value = @value

      unless maca0_h.nil?
        value = (value & 0xffff0000_u32) |
                UInt32.new!(maca0_h.to_int).&(0xffff_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      maca0_h : UInt16? = nil
    ) : Nil
      self.value = self.value.copy_with(
        maca0_h: maca0_h,
      )
    end
  end # struct

  # Ethernet MAC address 0 low          register
  struct MACA0LR
    ADDRESS = BASE_ADDRESS + 0x44_u64

    protected def self.address : UInt64
      ADDRESS
    end

    @value : UInt32

    def initialize(@value : UInt32)
    end

    def to_int : UInt32
      @value
    end

    def self.reset_value : self
      new(0xffffffff_u64)
    end

    def self.pointer : Pointer(UInt32)
      Pointer(UInt32).new(self.address)
    end

    def self.value : self
      value = self.pointer.load(volatile: true)
      new(value)
    end

    def self.value=(value : self) : self
      self.pointer.store(value.to_int, volatile: true)
      value
    end

    # 0
    def maca0_l : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # 0
    def self.maca0_l : UInt32
      value.maca0_l
    end

    # 0
    def self.maca0_l=(value : UInt32) : UInt32
      self.set(maca0_l: value)
      value
    end

    def copy_with(
      *,

      maca0_l : UInt32? = nil
    ) : self
      value = @value

      unless maca0_l.nil?
        value = (value & 0xffffffff_u32) |
                UInt32.new!(maca0_l.to_int).&(0x0_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      maca0_l : UInt32? = nil
    ) : Nil
      self.value = self.value.copy_with(
        maca0_l: maca0_l,
      )
    end
  end # struct

  # Ethernet MAC address 1 high          register
  struct MACA1HR
    ADDRESS = BASE_ADDRESS + 0x48_u64

    protected def self.address : UInt64
      ADDRESS
    end

    @value : UInt32

    def initialize(@value : UInt32)
    end

    def to_int : UInt32
      @value
    end

    def self.reset_value : self
      new(0xffff_u64)
    end

    def self.pointer : Pointer(UInt32)
      Pointer(UInt32).new(self.address)
    end

    def self.value : self
      value = self.pointer.load(volatile: true)
      new(value)
    end

    def self.value=(value : self) : self
      self.pointer.store(value.to_int, volatile: true)
      value
    end

    # MACA1H
    def maca1_h : UInt16
      UInt16.new!((@value >> 0) & 0xffff_u32)
    end

    # MACA1H
    def self.maca1_h : UInt16
      value.maca1_h
    end

    # MACA1H
    def self.maca1_h=(value : UInt16) : UInt16
      self.set(maca1_h: value)
      value
    end

    # MBC
    def mbc : UInt8
      UInt8.new!((@value >> 24) & 0x3f_u32)
    end

    # MBC
    def self.mbc : UInt8
      value.mbc
    end

    # MBC
    def self.mbc=(value : UInt8) : UInt8
      self.set(mbc: value)
      value
    end

    # SA
    def sa : Bool
      @value.bits_set?(0x40000000_u32)
    end

    # SA
    def self.sa : Bool
      value.sa
    end

    # SA
    def self.sa=(value : Bool) : Bool
      self.set(sa: value)
      value
    end

    # AE
    def ae : Bool
      @value.bits_set?(0x80000000_u32)
    end

    # AE
    def self.ae : Bool
      value.ae
    end

    # AE
    def self.ae=(value : Bool) : Bool
      self.set(ae: value)
      value
    end

    def copy_with(
      *,

      maca1_h : UInt16? = nil,

      mbc : UInt8? = nil,

      sa : Bool? = nil,

      ae : Bool? = nil
    ) : self
      value = @value

      unless maca1_h.nil?
        value = (value & 0xffff0000_u32) |
                UInt32.new!(maca1_h.to_int).&(0xffff_u32) << 0
      end

      unless mbc.nil?
        value = (value & 0xc0ffffff_u32) |
                UInt32.new!(mbc.to_int).&(0x3f_u32) << 24
      end

      unless sa.nil?
        value = (value & 0xbfffffff_u32) |
                UInt32.new!(sa.to_int).&(0x1_u32) << 30
      end

      unless ae.nil?
        value = (value & 0x7fffffff_u32) |
                UInt32.new!(ae.to_int).&(0x1_u32) << 31
      end

      self.class.new(value)
    end

    def self.set(
      *,
      maca1_h : UInt16? = nil,
      mbc : UInt8? = nil,
      sa : Bool? = nil,
      ae : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        maca1_h: maca1_h,
        mbc: mbc,
        sa: sa,
        ae: ae,
      )
    end
  end # struct

  # Ethernet MAC address1 low          register
  struct MACA1LR
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
      new(0xffffffff_u64)
    end

    def self.pointer : Pointer(UInt32)
      Pointer(UInt32).new(self.address)
    end

    def self.value : self
      value = self.pointer.load(volatile: true)
      new(value)
    end

    def self.value=(value : self) : self
      self.pointer.store(value.to_int, volatile: true)
      value
    end

    # MACA1LR
    def maca1_lr : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # MACA1LR
    def self.maca1_lr : UInt32
      value.maca1_lr
    end

    # MACA1LR
    def self.maca1_lr=(value : UInt32) : UInt32
      self.set(maca1_lr: value)
      value
    end

    def copy_with(
      *,

      maca1_lr : UInt32? = nil
    ) : self
      value = @value

      unless maca1_lr.nil?
        value = (value & 0xffffffff_u32) |
                UInt32.new!(maca1_lr.to_int).&(0x0_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      maca1_lr : UInt32? = nil
    ) : Nil
      self.value = self.value.copy_with(
        maca1_lr: maca1_lr,
      )
    end
  end # struct

  # Ethernet MAC address 2 high          register
  struct MACA2HR
    ADDRESS = BASE_ADDRESS + 0x50_u64

    protected def self.address : UInt64
      ADDRESS
    end

    @value : UInt32

    def initialize(@value : UInt32)
    end

    def to_int : UInt32
      @value
    end

    def self.reset_value : self
      new(0xffff_u64)
    end

    def self.pointer : Pointer(UInt32)
      Pointer(UInt32).new(self.address)
    end

    def self.value : self
      value = self.pointer.load(volatile: true)
      new(value)
    end

    def self.value=(value : self) : self
      self.pointer.store(value.to_int, volatile: true)
      value
    end

    # MAC2AH
    def mac2_ah : UInt16
      UInt16.new!((@value >> 0) & 0xffff_u32)
    end

    # MAC2AH
    def self.mac2_ah : UInt16
      value.mac2_ah
    end

    # MAC2AH
    def self.mac2_ah=(value : UInt16) : UInt16
      self.set(mac2_ah: value)
      value
    end

    # MBC
    def mbc : UInt8
      UInt8.new!((@value >> 24) & 0x3f_u32)
    end

    # MBC
    def self.mbc : UInt8
      value.mbc
    end

    # MBC
    def self.mbc=(value : UInt8) : UInt8
      self.set(mbc: value)
      value
    end

    # SA
    def sa : Bool
      @value.bits_set?(0x40000000_u32)
    end

    # SA
    def self.sa : Bool
      value.sa
    end

    # SA
    def self.sa=(value : Bool) : Bool
      self.set(sa: value)
      value
    end

    # AE
    def ae : Bool
      @value.bits_set?(0x80000000_u32)
    end

    # AE
    def self.ae : Bool
      value.ae
    end

    # AE
    def self.ae=(value : Bool) : Bool
      self.set(ae: value)
      value
    end

    def copy_with(
      *,

      mac2_ah : UInt16? = nil,

      mbc : UInt8? = nil,

      sa : Bool? = nil,

      ae : Bool? = nil
    ) : self
      value = @value

      unless mac2_ah.nil?
        value = (value & 0xffff0000_u32) |
                UInt32.new!(mac2_ah.to_int).&(0xffff_u32) << 0
      end

      unless mbc.nil?
        value = (value & 0xc0ffffff_u32) |
                UInt32.new!(mbc.to_int).&(0x3f_u32) << 24
      end

      unless sa.nil?
        value = (value & 0xbfffffff_u32) |
                UInt32.new!(sa.to_int).&(0x1_u32) << 30
      end

      unless ae.nil?
        value = (value & 0x7fffffff_u32) |
                UInt32.new!(ae.to_int).&(0x1_u32) << 31
      end

      self.class.new(value)
    end

    def self.set(
      *,
      mac2_ah : UInt16? = nil,
      mbc : UInt8? = nil,
      sa : Bool? = nil,
      ae : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        mac2_ah: mac2_ah,
        mbc: mbc,
        sa: sa,
        ae: ae,
      )
    end
  end # struct

  # Ethernet MAC address 2 low          register
  struct MACA2LR
    ADDRESS = BASE_ADDRESS + 0x54_u64

    protected def self.address : UInt64
      ADDRESS
    end

    @value : UInt32

    def initialize(@value : UInt32)
    end

    def to_int : UInt32
      @value
    end

    def self.reset_value : self
      new(0xffffffff_u64)
    end

    def self.pointer : Pointer(UInt32)
      Pointer(UInt32).new(self.address)
    end

    def self.value : self
      value = self.pointer.load(volatile: true)
      new(value)
    end

    def self.value=(value : self) : self
      self.pointer.store(value.to_int, volatile: true)
      value
    end

    # MACA2L
    def maca2_l : UInt32
      UInt32.new!((@value >> 0) & 0x7fffffff_u32)
    end

    # MACA2L
    def self.maca2_l : UInt32
      value.maca2_l
    end

    # MACA2L
    def self.maca2_l=(value : UInt32) : UInt32
      self.set(maca2_l: value)
      value
    end

    def copy_with(
      *,

      maca2_l : UInt32? = nil
    ) : self
      value = @value

      unless maca2_l.nil?
        value = (value & 0x80000000_u32) |
                UInt32.new!(maca2_l.to_int).&(0x7fffffff_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      maca2_l : UInt32? = nil
    ) : Nil
      self.value = self.value.copy_with(
        maca2_l: maca2_l,
      )
    end
  end # struct

  # Ethernet MAC address 3 high          register
  struct MACA3HR
    ADDRESS = BASE_ADDRESS + 0x58_u64

    protected def self.address : UInt64
      ADDRESS
    end

    @value : UInt32

    def initialize(@value : UInt32)
    end

    def to_int : UInt32
      @value
    end

    def self.reset_value : self
      new(0xffff_u64)
    end

    def self.pointer : Pointer(UInt32)
      Pointer(UInt32).new(self.address)
    end

    def self.value : self
      value = self.pointer.load(volatile: true)
      new(value)
    end

    def self.value=(value : self) : self
      self.pointer.store(value.to_int, volatile: true)
      value
    end

    # MACA3H
    def maca3_h : UInt16
      UInt16.new!((@value >> 0) & 0xffff_u32)
    end

    # MACA3H
    def self.maca3_h : UInt16
      value.maca3_h
    end

    # MACA3H
    def self.maca3_h=(value : UInt16) : UInt16
      self.set(maca3_h: value)
      value
    end

    # MBC
    def mbc : UInt8
      UInt8.new!((@value >> 24) & 0x3f_u32)
    end

    # MBC
    def self.mbc : UInt8
      value.mbc
    end

    # MBC
    def self.mbc=(value : UInt8) : UInt8
      self.set(mbc: value)
      value
    end

    # SA
    def sa : Bool
      @value.bits_set?(0x40000000_u32)
    end

    # SA
    def self.sa : Bool
      value.sa
    end

    # SA
    def self.sa=(value : Bool) : Bool
      self.set(sa: value)
      value
    end

    # AE
    def ae : Bool
      @value.bits_set?(0x80000000_u32)
    end

    # AE
    def self.ae : Bool
      value.ae
    end

    # AE
    def self.ae=(value : Bool) : Bool
      self.set(ae: value)
      value
    end

    def copy_with(
      *,

      maca3_h : UInt16? = nil,

      mbc : UInt8? = nil,

      sa : Bool? = nil,

      ae : Bool? = nil
    ) : self
      value = @value

      unless maca3_h.nil?
        value = (value & 0xffff0000_u32) |
                UInt32.new!(maca3_h.to_int).&(0xffff_u32) << 0
      end

      unless mbc.nil?
        value = (value & 0xc0ffffff_u32) |
                UInt32.new!(mbc.to_int).&(0x3f_u32) << 24
      end

      unless sa.nil?
        value = (value & 0xbfffffff_u32) |
                UInt32.new!(sa.to_int).&(0x1_u32) << 30
      end

      unless ae.nil?
        value = (value & 0x7fffffff_u32) |
                UInt32.new!(ae.to_int).&(0x1_u32) << 31
      end

      self.class.new(value)
    end

    def self.set(
      *,
      maca3_h : UInt16? = nil,
      mbc : UInt8? = nil,
      sa : Bool? = nil,
      ae : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        maca3_h: maca3_h,
        mbc: mbc,
        sa: sa,
        ae: ae,
      )
    end
  end # struct

  # Ethernet MAC address 3 low          register
  struct MACA3LR
    ADDRESS = BASE_ADDRESS + 0x5c_u64

    protected def self.address : UInt64
      ADDRESS
    end

    @value : UInt32

    def initialize(@value : UInt32)
    end

    def to_int : UInt32
      @value
    end

    def self.reset_value : self
      new(0xffffffff_u64)
    end

    def self.pointer : Pointer(UInt32)
      Pointer(UInt32).new(self.address)
    end

    def self.value : self
      value = self.pointer.load(volatile: true)
      new(value)
    end

    def self.value=(value : self) : self
      self.pointer.store(value.to_int, volatile: true)
      value
    end

    # MBCA3L
    def mbca3_l : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # MBCA3L
    def self.mbca3_l : UInt32
      value.mbca3_l
    end

    # MBCA3L
    def self.mbca3_l=(value : UInt32) : UInt32
      self.set(mbca3_l: value)
      value
    end

    def copy_with(
      *,

      mbca3_l : UInt32? = nil
    ) : self
      value = @value

      unless mbca3_l.nil?
        value = (value & 0xffffffff_u32) |
                UInt32.new!(mbca3_l.to_int).&(0x0_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      mbca3_l : UInt32? = nil
    ) : Nil
      self.value = self.value.copy_with(
        mbca3_l: mbca3_l,
      )
    end
  end # struct

end
