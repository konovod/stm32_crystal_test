# Flexible memory controller
module FMC
  VERSION      = nil
  BASE_ADDRESS = 0xa0000000_u64

  # SRAM/NOR-Flash chip-select control register          1
  struct BCR1
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
      new(0x30d0_u64)
    end

    def self.pointer : Pointer(UInt32)
      Pointer(UInt32).new(self.address)
    end

    def self.value : self
      value = self.pointer.load(volatile: true)
      new(value)
    end

    def self.value=(value : self) : self
      self.pointer.store(value.to_int, volatile: true)
      value
    end

    # CCLKEN
    def cclken : Bool
      @value.bits_set?(0x100000_u32)
    end

    # CCLKEN
    def self.cclken : Bool
      value.cclken
    end

    # CCLKEN
    def self.cclken=(value : Bool) : Bool
      self.set(cclken: value)
      value
    end

    # CBURSTRW
    def cburstrw : Bool
      @value.bits_set?(0x80000_u32)
    end

    # CBURSTRW
    def self.cburstrw : Bool
      value.cburstrw
    end

    # CBURSTRW
    def self.cburstrw=(value : Bool) : Bool
      self.set(cburstrw: value)
      value
    end

    # ASYNCWAIT
    def asyncwait : Bool
      @value.bits_set?(0x8000_u32)
    end

    # ASYNCWAIT
    def self.asyncwait : Bool
      value.asyncwait
    end

    # ASYNCWAIT
    def self.asyncwait=(value : Bool) : Bool
      self.set(asyncwait: value)
      value
    end

    # EXTMOD
    def extmod : Bool
      @value.bits_set?(0x4000_u32)
    end

    # EXTMOD
    def self.extmod : Bool
      value.extmod
    end

    # EXTMOD
    def self.extmod=(value : Bool) : Bool
      self.set(extmod: value)
      value
    end

    # WAITEN
    def waiten : Bool
      @value.bits_set?(0x2000_u32)
    end

    # WAITEN
    def self.waiten : Bool
      value.waiten
    end

    # WAITEN
    def self.waiten=(value : Bool) : Bool
      self.set(waiten: value)
      value
    end

    # WREN
    def wren : Bool
      @value.bits_set?(0x1000_u32)
    end

    # WREN
    def self.wren : Bool
      value.wren
    end

    # WREN
    def self.wren=(value : Bool) : Bool
      self.set(wren: value)
      value
    end

    # WAITCFG
    def waitcfg : Bool
      @value.bits_set?(0x800_u32)
    end

    # WAITCFG
    def self.waitcfg : Bool
      value.waitcfg
    end

    # WAITCFG
    def self.waitcfg=(value : Bool) : Bool
      self.set(waitcfg: value)
      value
    end

    # WAITPOL
    def waitpol : Bool
      @value.bits_set?(0x200_u32)
    end

    # WAITPOL
    def self.waitpol : Bool
      value.waitpol
    end

    # WAITPOL
    def self.waitpol=(value : Bool) : Bool
      self.set(waitpol: value)
      value
    end

    # BURSTEN
    def bursten : Bool
      @value.bits_set?(0x100_u32)
    end

    # BURSTEN
    def self.bursten : Bool
      value.bursten
    end

    # BURSTEN
    def self.bursten=(value : Bool) : Bool
      self.set(bursten: value)
      value
    end

    # FACCEN
    def faccen : Bool
      @value.bits_set?(0x40_u32)
    end

    # FACCEN
    def self.faccen : Bool
      value.faccen
    end

    # FACCEN
    def self.faccen=(value : Bool) : Bool
      self.set(faccen: value)
      value
    end

    # MWID
    def mwid : UInt8
      UInt8.new!((@value >> 4) & 0x3_u32)
    end

    # MWID
    def self.mwid : UInt8
      value.mwid
    end

    # MWID
    def self.mwid=(value : UInt8) : UInt8
      self.set(mwid: value)
      value
    end

    # MTYP
    def mtyp : UInt8
      UInt8.new!((@value >> 2) & 0x3_u32)
    end

    # MTYP
    def self.mtyp : UInt8
      value.mtyp
    end

    # MTYP
    def self.mtyp=(value : UInt8) : UInt8
      self.set(mtyp: value)
      value
    end

    # MUXEN
    def muxen : Bool
      @value.bits_set?(0x2_u32)
    end

    # MUXEN
    def self.muxen : Bool
      value.muxen
    end

    # MUXEN
    def self.muxen=(value : Bool) : Bool
      self.set(muxen: value)
      value
    end

    # MBKEN
    def mbken : Bool
      @value.bits_set?(0x1_u32)
    end

    # MBKEN
    def self.mbken : Bool
      value.mbken
    end

    # MBKEN
    def self.mbken=(value : Bool) : Bool
      self.set(mbken: value)
      value
    end

    def copy_with(
      *,

      cclken : Bool? = nil,

      cburstrw : Bool? = nil,

      asyncwait : Bool? = nil,

      extmod : Bool? = nil,

      waiten : Bool? = nil,

      wren : Bool? = nil,

      waitcfg : Bool? = nil,

      waitpol : Bool? = nil,

      bursten : Bool? = nil,

      faccen : Bool? = nil,

      mwid : UInt8? = nil,

      mtyp : UInt8? = nil,

      muxen : Bool? = nil,

      mbken : Bool? = nil
    ) : self
      value = @value

      unless cclken.nil?
        value = (value & 0xffefffff_u32) |
                UInt32.new!(cclken.to_int).&(0x1_u32) << 20
      end

      unless cburstrw.nil?
        value = (value & 0xfff7ffff_u32) |
                UInt32.new!(cburstrw.to_int).&(0x1_u32) << 19
      end

      unless asyncwait.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(asyncwait.to_int).&(0x1_u32) << 15
      end

      unless extmod.nil?
        value = (value & 0xffffbfff_u32) |
                UInt32.new!(extmod.to_int).&(0x1_u32) << 14
      end

      unless waiten.nil?
        value = (value & 0xffffdfff_u32) |
                UInt32.new!(waiten.to_int).&(0x1_u32) << 13
      end

      unless wren.nil?
        value = (value & 0xffffefff_u32) |
                UInt32.new!(wren.to_int).&(0x1_u32) << 12
      end

      unless waitcfg.nil?
        value = (value & 0xfffff7ff_u32) |
                UInt32.new!(waitcfg.to_int).&(0x1_u32) << 11
      end

      unless waitpol.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(waitpol.to_int).&(0x1_u32) << 9
      end

      unless bursten.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(bursten.to_int).&(0x1_u32) << 8
      end

      unless faccen.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(faccen.to_int).&(0x1_u32) << 6
      end

      unless mwid.nil?
        value = (value & 0xffffffcf_u32) |
                UInt32.new!(mwid.to_int).&(0x3_u32) << 4
      end

      unless mtyp.nil?
        value = (value & 0xfffffff3_u32) |
                UInt32.new!(mtyp.to_int).&(0x3_u32) << 2
      end

      unless muxen.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(muxen.to_int).&(0x1_u32) << 1
      end

      unless mbken.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(mbken.to_int).&(0x1_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      cclken : Bool? = nil,
      cburstrw : Bool? = nil,
      asyncwait : Bool? = nil,
      extmod : Bool? = nil,
      waiten : Bool? = nil,
      wren : Bool? = nil,
      waitcfg : Bool? = nil,
      waitpol : Bool? = nil,
      bursten : Bool? = nil,
      faccen : Bool? = nil,
      mwid : UInt8? = nil,
      mtyp : UInt8? = nil,
      muxen : Bool? = nil,
      mbken : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        cclken: cclken,
        cburstrw: cburstrw,
        asyncwait: asyncwait,
        extmod: extmod,
        waiten: waiten,
        wren: wren,
        waitcfg: waitcfg,
        waitpol: waitpol,
        bursten: bursten,
        faccen: faccen,
        mwid: mwid,
        mtyp: mtyp,
        muxen: muxen,
        mbken: mbken,
      )
    end
  end # struct

  # SRAM/NOR-Flash chip-select timing register          1
  struct BTR1
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

    # ACCMOD
    def accmod : UInt8
      UInt8.new!((@value >> 28) & 0x3_u32)
    end

    # ACCMOD
    def self.accmod : UInt8
      value.accmod
    end

    # ACCMOD
    def self.accmod=(value : UInt8) : UInt8
      self.set(accmod: value)
      value
    end

    # DATLAT
    def datlat : UInt8
      UInt8.new!((@value >> 24) & 0xf_u32)
    end

    # DATLAT
    def self.datlat : UInt8
      value.datlat
    end

    # DATLAT
    def self.datlat=(value : UInt8) : UInt8
      self.set(datlat: value)
      value
    end

    # CLKDIV
    def clkdiv : UInt8
      UInt8.new!((@value >> 20) & 0xf_u32)
    end

    # CLKDIV
    def self.clkdiv : UInt8
      value.clkdiv
    end

    # CLKDIV
    def self.clkdiv=(value : UInt8) : UInt8
      self.set(clkdiv: value)
      value
    end

    # BUSTURN
    def busturn : UInt8
      UInt8.new!((@value >> 16) & 0xf_u32)
    end

    # BUSTURN
    def self.busturn : UInt8
      value.busturn
    end

    # BUSTURN
    def self.busturn=(value : UInt8) : UInt8
      self.set(busturn: value)
      value
    end

    # DATAST
    def datast : UInt8
      UInt8.new!((@value >> 8) & 0xff_u32)
    end

    # DATAST
    def self.datast : UInt8
      value.datast
    end

    # DATAST
    def self.datast=(value : UInt8) : UInt8
      self.set(datast: value)
      value
    end

    # ADDHLD
    def addhld : UInt8
      UInt8.new!((@value >> 4) & 0xf_u32)
    end

    # ADDHLD
    def self.addhld : UInt8
      value.addhld
    end

    # ADDHLD
    def self.addhld=(value : UInt8) : UInt8
      self.set(addhld: value)
      value
    end

    # ADDSET
    def addset : UInt8
      UInt8.new!((@value >> 0) & 0xf_u32)
    end

    # ADDSET
    def self.addset : UInt8
      value.addset
    end

    # ADDSET
    def self.addset=(value : UInt8) : UInt8
      self.set(addset: value)
      value
    end

    def copy_with(
      *,

      accmod : UInt8? = nil,

      datlat : UInt8? = nil,

      clkdiv : UInt8? = nil,

      busturn : UInt8? = nil,

      datast : UInt8? = nil,

      addhld : UInt8? = nil,

      addset : UInt8? = nil
    ) : self
      value = @value

      unless accmod.nil?
        value = (value & 0xcfffffff_u32) |
                UInt32.new!(accmod.to_int).&(0x3_u32) << 28
      end

      unless datlat.nil?
        value = (value & 0xf0ffffff_u32) |
                UInt32.new!(datlat.to_int).&(0xf_u32) << 24
      end

      unless clkdiv.nil?
        value = (value & 0xff0fffff_u32) |
                UInt32.new!(clkdiv.to_int).&(0xf_u32) << 20
      end

      unless busturn.nil?
        value = (value & 0xfff0ffff_u32) |
                UInt32.new!(busturn.to_int).&(0xf_u32) << 16
      end

      unless datast.nil?
        value = (value & 0xffff00ff_u32) |
                UInt32.new!(datast.to_int).&(0xff_u32) << 8
      end

      unless addhld.nil?
        value = (value & 0xffffff0f_u32) |
                UInt32.new!(addhld.to_int).&(0xf_u32) << 4
      end

      unless addset.nil?
        value = (value & 0xfffffff0_u32) |
                UInt32.new!(addset.to_int).&(0xf_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      accmod : UInt8? = nil,
      datlat : UInt8? = nil,
      clkdiv : UInt8? = nil,
      busturn : UInt8? = nil,
      datast : UInt8? = nil,
      addhld : UInt8? = nil,
      addset : UInt8? = nil
    ) : Nil
      self.value = self.value.copy_with(
        accmod: accmod,
        datlat: datlat,
        clkdiv: clkdiv,
        busturn: busturn,
        datast: datast,
        addhld: addhld,
        addset: addset,
      )
    end
  end # struct

  # SRAM/NOR-Flash chip-select control register          2
  struct BCR2
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
      new(0x30d0_u64)
    end

    def self.pointer : Pointer(UInt32)
      Pointer(UInt32).new(self.address)
    end

    def self.value : self
      value = self.pointer.load(volatile: true)
      new(value)
    end

    def self.value=(value : self) : self
      self.pointer.store(value.to_int, volatile: true)
      value
    end

    # CBURSTRW
    def cburstrw : Bool
      @value.bits_set?(0x80000_u32)
    end

    # CBURSTRW
    def self.cburstrw : Bool
      value.cburstrw
    end

    # CBURSTRW
    def self.cburstrw=(value : Bool) : Bool
      self.set(cburstrw: value)
      value
    end

    # ASYNCWAIT
    def asyncwait : Bool
      @value.bits_set?(0x8000_u32)
    end

    # ASYNCWAIT
    def self.asyncwait : Bool
      value.asyncwait
    end

    # ASYNCWAIT
    def self.asyncwait=(value : Bool) : Bool
      self.set(asyncwait: value)
      value
    end

    # EXTMOD
    def extmod : Bool
      @value.bits_set?(0x4000_u32)
    end

    # EXTMOD
    def self.extmod : Bool
      value.extmod
    end

    # EXTMOD
    def self.extmod=(value : Bool) : Bool
      self.set(extmod: value)
      value
    end

    # WAITEN
    def waiten : Bool
      @value.bits_set?(0x2000_u32)
    end

    # WAITEN
    def self.waiten : Bool
      value.waiten
    end

    # WAITEN
    def self.waiten=(value : Bool) : Bool
      self.set(waiten: value)
      value
    end

    # WREN
    def wren : Bool
      @value.bits_set?(0x1000_u32)
    end

    # WREN
    def self.wren : Bool
      value.wren
    end

    # WREN
    def self.wren=(value : Bool) : Bool
      self.set(wren: value)
      value
    end

    # WAITCFG
    def waitcfg : Bool
      @value.bits_set?(0x800_u32)
    end

    # WAITCFG
    def self.waitcfg : Bool
      value.waitcfg
    end

    # WAITCFG
    def self.waitcfg=(value : Bool) : Bool
      self.set(waitcfg: value)
      value
    end

    # WRAPMOD
    def wrapmod : Bool
      @value.bits_set?(0x400_u32)
    end

    # WRAPMOD
    def self.wrapmod : Bool
      value.wrapmod
    end

    # WRAPMOD
    def self.wrapmod=(value : Bool) : Bool
      self.set(wrapmod: value)
      value
    end

    # WAITPOL
    def waitpol : Bool
      @value.bits_set?(0x200_u32)
    end

    # WAITPOL
    def self.waitpol : Bool
      value.waitpol
    end

    # WAITPOL
    def self.waitpol=(value : Bool) : Bool
      self.set(waitpol: value)
      value
    end

    # BURSTEN
    def bursten : Bool
      @value.bits_set?(0x100_u32)
    end

    # BURSTEN
    def self.bursten : Bool
      value.bursten
    end

    # BURSTEN
    def self.bursten=(value : Bool) : Bool
      self.set(bursten: value)
      value
    end

    # FACCEN
    def faccen : Bool
      @value.bits_set?(0x40_u32)
    end

    # FACCEN
    def self.faccen : Bool
      value.faccen
    end

    # FACCEN
    def self.faccen=(value : Bool) : Bool
      self.set(faccen: value)
      value
    end

    # MWID
    def mwid : UInt8
      UInt8.new!((@value >> 4) & 0x3_u32)
    end

    # MWID
    def self.mwid : UInt8
      value.mwid
    end

    # MWID
    def self.mwid=(value : UInt8) : UInt8
      self.set(mwid: value)
      value
    end

    # MTYP
    def mtyp : UInt8
      UInt8.new!((@value >> 2) & 0x3_u32)
    end

    # MTYP
    def self.mtyp : UInt8
      value.mtyp
    end

    # MTYP
    def self.mtyp=(value : UInt8) : UInt8
      self.set(mtyp: value)
      value
    end

    # MUXEN
    def muxen : Bool
      @value.bits_set?(0x2_u32)
    end

    # MUXEN
    def self.muxen : Bool
      value.muxen
    end

    # MUXEN
    def self.muxen=(value : Bool) : Bool
      self.set(muxen: value)
      value
    end

    # MBKEN
    def mbken : Bool
      @value.bits_set?(0x1_u32)
    end

    # MBKEN
    def self.mbken : Bool
      value.mbken
    end

    # MBKEN
    def self.mbken=(value : Bool) : Bool
      self.set(mbken: value)
      value
    end

    def copy_with(
      *,

      cburstrw : Bool? = nil,

      asyncwait : Bool? = nil,

      extmod : Bool? = nil,

      waiten : Bool? = nil,

      wren : Bool? = nil,

      waitcfg : Bool? = nil,

      wrapmod : Bool? = nil,

      waitpol : Bool? = nil,

      bursten : Bool? = nil,

      faccen : Bool? = nil,

      mwid : UInt8? = nil,

      mtyp : UInt8? = nil,

      muxen : Bool? = nil,

      mbken : Bool? = nil
    ) : self
      value = @value

      unless cburstrw.nil?
        value = (value & 0xfff7ffff_u32) |
                UInt32.new!(cburstrw.to_int).&(0x1_u32) << 19
      end

      unless asyncwait.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(asyncwait.to_int).&(0x1_u32) << 15
      end

      unless extmod.nil?
        value = (value & 0xffffbfff_u32) |
                UInt32.new!(extmod.to_int).&(0x1_u32) << 14
      end

      unless waiten.nil?
        value = (value & 0xffffdfff_u32) |
                UInt32.new!(waiten.to_int).&(0x1_u32) << 13
      end

      unless wren.nil?
        value = (value & 0xffffefff_u32) |
                UInt32.new!(wren.to_int).&(0x1_u32) << 12
      end

      unless waitcfg.nil?
        value = (value & 0xfffff7ff_u32) |
                UInt32.new!(waitcfg.to_int).&(0x1_u32) << 11
      end

      unless wrapmod.nil?
        value = (value & 0xfffffbff_u32) |
                UInt32.new!(wrapmod.to_int).&(0x1_u32) << 10
      end

      unless waitpol.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(waitpol.to_int).&(0x1_u32) << 9
      end

      unless bursten.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(bursten.to_int).&(0x1_u32) << 8
      end

      unless faccen.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(faccen.to_int).&(0x1_u32) << 6
      end

      unless mwid.nil?
        value = (value & 0xffffffcf_u32) |
                UInt32.new!(mwid.to_int).&(0x3_u32) << 4
      end

      unless mtyp.nil?
        value = (value & 0xfffffff3_u32) |
                UInt32.new!(mtyp.to_int).&(0x3_u32) << 2
      end

      unless muxen.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(muxen.to_int).&(0x1_u32) << 1
      end

      unless mbken.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(mbken.to_int).&(0x1_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      cburstrw : Bool? = nil,
      asyncwait : Bool? = nil,
      extmod : Bool? = nil,
      waiten : Bool? = nil,
      wren : Bool? = nil,
      waitcfg : Bool? = nil,
      wrapmod : Bool? = nil,
      waitpol : Bool? = nil,
      bursten : Bool? = nil,
      faccen : Bool? = nil,
      mwid : UInt8? = nil,
      mtyp : UInt8? = nil,
      muxen : Bool? = nil,
      mbken : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        cburstrw: cburstrw,
        asyncwait: asyncwait,
        extmod: extmod,
        waiten: waiten,
        wren: wren,
        waitcfg: waitcfg,
        wrapmod: wrapmod,
        waitpol: waitpol,
        bursten: bursten,
        faccen: faccen,
        mwid: mwid,
        mtyp: mtyp,
        muxen: muxen,
        mbken: mbken,
      )
    end
  end # struct

  # SRAM/NOR-Flash chip-select timing register          2
  struct BTR2
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

    # ACCMOD
    def accmod : UInt8
      UInt8.new!((@value >> 28) & 0x3_u32)
    end

    # ACCMOD
    def self.accmod : UInt8
      value.accmod
    end

    # ACCMOD
    def self.accmod=(value : UInt8) : UInt8
      self.set(accmod: value)
      value
    end

    # DATLAT
    def datlat : UInt8
      UInt8.new!((@value >> 24) & 0xf_u32)
    end

    # DATLAT
    def self.datlat : UInt8
      value.datlat
    end

    # DATLAT
    def self.datlat=(value : UInt8) : UInt8
      self.set(datlat: value)
      value
    end

    # CLKDIV
    def clkdiv : UInt8
      UInt8.new!((@value >> 20) & 0xf_u32)
    end

    # CLKDIV
    def self.clkdiv : UInt8
      value.clkdiv
    end

    # CLKDIV
    def self.clkdiv=(value : UInt8) : UInt8
      self.set(clkdiv: value)
      value
    end

    # BUSTURN
    def busturn : UInt8
      UInt8.new!((@value >> 16) & 0xf_u32)
    end

    # BUSTURN
    def self.busturn : UInt8
      value.busturn
    end

    # BUSTURN
    def self.busturn=(value : UInt8) : UInt8
      self.set(busturn: value)
      value
    end

    # DATAST
    def datast : UInt8
      UInt8.new!((@value >> 8) & 0xff_u32)
    end

    # DATAST
    def self.datast : UInt8
      value.datast
    end

    # DATAST
    def self.datast=(value : UInt8) : UInt8
      self.set(datast: value)
      value
    end

    # ADDHLD
    def addhld : UInt8
      UInt8.new!((@value >> 4) & 0xf_u32)
    end

    # ADDHLD
    def self.addhld : UInt8
      value.addhld
    end

    # ADDHLD
    def self.addhld=(value : UInt8) : UInt8
      self.set(addhld: value)
      value
    end

    # ADDSET
    def addset : UInt8
      UInt8.new!((@value >> 0) & 0xf_u32)
    end

    # ADDSET
    def self.addset : UInt8
      value.addset
    end

    # ADDSET
    def self.addset=(value : UInt8) : UInt8
      self.set(addset: value)
      value
    end

    def copy_with(
      *,

      accmod : UInt8? = nil,

      datlat : UInt8? = nil,

      clkdiv : UInt8? = nil,

      busturn : UInt8? = nil,

      datast : UInt8? = nil,

      addhld : UInt8? = nil,

      addset : UInt8? = nil
    ) : self
      value = @value

      unless accmod.nil?
        value = (value & 0xcfffffff_u32) |
                UInt32.new!(accmod.to_int).&(0x3_u32) << 28
      end

      unless datlat.nil?
        value = (value & 0xf0ffffff_u32) |
                UInt32.new!(datlat.to_int).&(0xf_u32) << 24
      end

      unless clkdiv.nil?
        value = (value & 0xff0fffff_u32) |
                UInt32.new!(clkdiv.to_int).&(0xf_u32) << 20
      end

      unless busturn.nil?
        value = (value & 0xfff0ffff_u32) |
                UInt32.new!(busturn.to_int).&(0xf_u32) << 16
      end

      unless datast.nil?
        value = (value & 0xffff00ff_u32) |
                UInt32.new!(datast.to_int).&(0xff_u32) << 8
      end

      unless addhld.nil?
        value = (value & 0xffffff0f_u32) |
                UInt32.new!(addhld.to_int).&(0xf_u32) << 4
      end

      unless addset.nil?
        value = (value & 0xfffffff0_u32) |
                UInt32.new!(addset.to_int).&(0xf_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      accmod : UInt8? = nil,
      datlat : UInt8? = nil,
      clkdiv : UInt8? = nil,
      busturn : UInt8? = nil,
      datast : UInt8? = nil,
      addhld : UInt8? = nil,
      addset : UInt8? = nil
    ) : Nil
      self.value = self.value.copy_with(
        accmod: accmod,
        datlat: datlat,
        clkdiv: clkdiv,
        busturn: busturn,
        datast: datast,
        addhld: addhld,
        addset: addset,
      )
    end
  end # struct

  # SRAM/NOR-Flash chip-select control register          3
  struct BCR3
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
      new(0x30d0_u64)
    end

    def self.pointer : Pointer(UInt32)
      Pointer(UInt32).new(self.address)
    end

    def self.value : self
      value = self.pointer.load(volatile: true)
      new(value)
    end

    def self.value=(value : self) : self
      self.pointer.store(value.to_int, volatile: true)
      value
    end

    # CBURSTRW
    def cburstrw : Bool
      @value.bits_set?(0x80000_u32)
    end

    # CBURSTRW
    def self.cburstrw : Bool
      value.cburstrw
    end

    # CBURSTRW
    def self.cburstrw=(value : Bool) : Bool
      self.set(cburstrw: value)
      value
    end

    # ASYNCWAIT
    def asyncwait : Bool
      @value.bits_set?(0x8000_u32)
    end

    # ASYNCWAIT
    def self.asyncwait : Bool
      value.asyncwait
    end

    # ASYNCWAIT
    def self.asyncwait=(value : Bool) : Bool
      self.set(asyncwait: value)
      value
    end

    # EXTMOD
    def extmod : Bool
      @value.bits_set?(0x4000_u32)
    end

    # EXTMOD
    def self.extmod : Bool
      value.extmod
    end

    # EXTMOD
    def self.extmod=(value : Bool) : Bool
      self.set(extmod: value)
      value
    end

    # WAITEN
    def waiten : Bool
      @value.bits_set?(0x2000_u32)
    end

    # WAITEN
    def self.waiten : Bool
      value.waiten
    end

    # WAITEN
    def self.waiten=(value : Bool) : Bool
      self.set(waiten: value)
      value
    end

    # WREN
    def wren : Bool
      @value.bits_set?(0x1000_u32)
    end

    # WREN
    def self.wren : Bool
      value.wren
    end

    # WREN
    def self.wren=(value : Bool) : Bool
      self.set(wren: value)
      value
    end

    # WAITCFG
    def waitcfg : Bool
      @value.bits_set?(0x800_u32)
    end

    # WAITCFG
    def self.waitcfg : Bool
      value.waitcfg
    end

    # WAITCFG
    def self.waitcfg=(value : Bool) : Bool
      self.set(waitcfg: value)
      value
    end

    # WRAPMOD
    def wrapmod : Bool
      @value.bits_set?(0x400_u32)
    end

    # WRAPMOD
    def self.wrapmod : Bool
      value.wrapmod
    end

    # WRAPMOD
    def self.wrapmod=(value : Bool) : Bool
      self.set(wrapmod: value)
      value
    end

    # WAITPOL
    def waitpol : Bool
      @value.bits_set?(0x200_u32)
    end

    # WAITPOL
    def self.waitpol : Bool
      value.waitpol
    end

    # WAITPOL
    def self.waitpol=(value : Bool) : Bool
      self.set(waitpol: value)
      value
    end

    # BURSTEN
    def bursten : Bool
      @value.bits_set?(0x100_u32)
    end

    # BURSTEN
    def self.bursten : Bool
      value.bursten
    end

    # BURSTEN
    def self.bursten=(value : Bool) : Bool
      self.set(bursten: value)
      value
    end

    # FACCEN
    def faccen : Bool
      @value.bits_set?(0x40_u32)
    end

    # FACCEN
    def self.faccen : Bool
      value.faccen
    end

    # FACCEN
    def self.faccen=(value : Bool) : Bool
      self.set(faccen: value)
      value
    end

    # MWID
    def mwid : UInt8
      UInt8.new!((@value >> 4) & 0x3_u32)
    end

    # MWID
    def self.mwid : UInt8
      value.mwid
    end

    # MWID
    def self.mwid=(value : UInt8) : UInt8
      self.set(mwid: value)
      value
    end

    # MTYP
    def mtyp : UInt8
      UInt8.new!((@value >> 2) & 0x3_u32)
    end

    # MTYP
    def self.mtyp : UInt8
      value.mtyp
    end

    # MTYP
    def self.mtyp=(value : UInt8) : UInt8
      self.set(mtyp: value)
      value
    end

    # MUXEN
    def muxen : Bool
      @value.bits_set?(0x2_u32)
    end

    # MUXEN
    def self.muxen : Bool
      value.muxen
    end

    # MUXEN
    def self.muxen=(value : Bool) : Bool
      self.set(muxen: value)
      value
    end

    # MBKEN
    def mbken : Bool
      @value.bits_set?(0x1_u32)
    end

    # MBKEN
    def self.mbken : Bool
      value.mbken
    end

    # MBKEN
    def self.mbken=(value : Bool) : Bool
      self.set(mbken: value)
      value
    end

    def copy_with(
      *,

      cburstrw : Bool? = nil,

      asyncwait : Bool? = nil,

      extmod : Bool? = nil,

      waiten : Bool? = nil,

      wren : Bool? = nil,

      waitcfg : Bool? = nil,

      wrapmod : Bool? = nil,

      waitpol : Bool? = nil,

      bursten : Bool? = nil,

      faccen : Bool? = nil,

      mwid : UInt8? = nil,

      mtyp : UInt8? = nil,

      muxen : Bool? = nil,

      mbken : Bool? = nil
    ) : self
      value = @value

      unless cburstrw.nil?
        value = (value & 0xfff7ffff_u32) |
                UInt32.new!(cburstrw.to_int).&(0x1_u32) << 19
      end

      unless asyncwait.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(asyncwait.to_int).&(0x1_u32) << 15
      end

      unless extmod.nil?
        value = (value & 0xffffbfff_u32) |
                UInt32.new!(extmod.to_int).&(0x1_u32) << 14
      end

      unless waiten.nil?
        value = (value & 0xffffdfff_u32) |
                UInt32.new!(waiten.to_int).&(0x1_u32) << 13
      end

      unless wren.nil?
        value = (value & 0xffffefff_u32) |
                UInt32.new!(wren.to_int).&(0x1_u32) << 12
      end

      unless waitcfg.nil?
        value = (value & 0xfffff7ff_u32) |
                UInt32.new!(waitcfg.to_int).&(0x1_u32) << 11
      end

      unless wrapmod.nil?
        value = (value & 0xfffffbff_u32) |
                UInt32.new!(wrapmod.to_int).&(0x1_u32) << 10
      end

      unless waitpol.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(waitpol.to_int).&(0x1_u32) << 9
      end

      unless bursten.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(bursten.to_int).&(0x1_u32) << 8
      end

      unless faccen.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(faccen.to_int).&(0x1_u32) << 6
      end

      unless mwid.nil?
        value = (value & 0xffffffcf_u32) |
                UInt32.new!(mwid.to_int).&(0x3_u32) << 4
      end

      unless mtyp.nil?
        value = (value & 0xfffffff3_u32) |
                UInt32.new!(mtyp.to_int).&(0x3_u32) << 2
      end

      unless muxen.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(muxen.to_int).&(0x1_u32) << 1
      end

      unless mbken.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(mbken.to_int).&(0x1_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      cburstrw : Bool? = nil,
      asyncwait : Bool? = nil,
      extmod : Bool? = nil,
      waiten : Bool? = nil,
      wren : Bool? = nil,
      waitcfg : Bool? = nil,
      wrapmod : Bool? = nil,
      waitpol : Bool? = nil,
      bursten : Bool? = nil,
      faccen : Bool? = nil,
      mwid : UInt8? = nil,
      mtyp : UInt8? = nil,
      muxen : Bool? = nil,
      mbken : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        cburstrw: cburstrw,
        asyncwait: asyncwait,
        extmod: extmod,
        waiten: waiten,
        wren: wren,
        waitcfg: waitcfg,
        wrapmod: wrapmod,
        waitpol: waitpol,
        bursten: bursten,
        faccen: faccen,
        mwid: mwid,
        mtyp: mtyp,
        muxen: muxen,
        mbken: mbken,
      )
    end
  end # struct

  # SRAM/NOR-Flash chip-select timing register          3
  struct BTR3
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

    # ACCMOD
    def accmod : UInt8
      UInt8.new!((@value >> 28) & 0x3_u32)
    end

    # ACCMOD
    def self.accmod : UInt8
      value.accmod
    end

    # ACCMOD
    def self.accmod=(value : UInt8) : UInt8
      self.set(accmod: value)
      value
    end

    # DATLAT
    def datlat : UInt8
      UInt8.new!((@value >> 24) & 0xf_u32)
    end

    # DATLAT
    def self.datlat : UInt8
      value.datlat
    end

    # DATLAT
    def self.datlat=(value : UInt8) : UInt8
      self.set(datlat: value)
      value
    end

    # CLKDIV
    def clkdiv : UInt8
      UInt8.new!((@value >> 20) & 0xf_u32)
    end

    # CLKDIV
    def self.clkdiv : UInt8
      value.clkdiv
    end

    # CLKDIV
    def self.clkdiv=(value : UInt8) : UInt8
      self.set(clkdiv: value)
      value
    end

    # BUSTURN
    def busturn : UInt8
      UInt8.new!((@value >> 16) & 0xf_u32)
    end

    # BUSTURN
    def self.busturn : UInt8
      value.busturn
    end

    # BUSTURN
    def self.busturn=(value : UInt8) : UInt8
      self.set(busturn: value)
      value
    end

    # DATAST
    def datast : UInt8
      UInt8.new!((@value >> 8) & 0xff_u32)
    end

    # DATAST
    def self.datast : UInt8
      value.datast
    end

    # DATAST
    def self.datast=(value : UInt8) : UInt8
      self.set(datast: value)
      value
    end

    # ADDHLD
    def addhld : UInt8
      UInt8.new!((@value >> 4) & 0xf_u32)
    end

    # ADDHLD
    def self.addhld : UInt8
      value.addhld
    end

    # ADDHLD
    def self.addhld=(value : UInt8) : UInt8
      self.set(addhld: value)
      value
    end

    # ADDSET
    def addset : UInt8
      UInt8.new!((@value >> 0) & 0xf_u32)
    end

    # ADDSET
    def self.addset : UInt8
      value.addset
    end

    # ADDSET
    def self.addset=(value : UInt8) : UInt8
      self.set(addset: value)
      value
    end

    def copy_with(
      *,

      accmod : UInt8? = nil,

      datlat : UInt8? = nil,

      clkdiv : UInt8? = nil,

      busturn : UInt8? = nil,

      datast : UInt8? = nil,

      addhld : UInt8? = nil,

      addset : UInt8? = nil
    ) : self
      value = @value

      unless accmod.nil?
        value = (value & 0xcfffffff_u32) |
                UInt32.new!(accmod.to_int).&(0x3_u32) << 28
      end

      unless datlat.nil?
        value = (value & 0xf0ffffff_u32) |
                UInt32.new!(datlat.to_int).&(0xf_u32) << 24
      end

      unless clkdiv.nil?
        value = (value & 0xff0fffff_u32) |
                UInt32.new!(clkdiv.to_int).&(0xf_u32) << 20
      end

      unless busturn.nil?
        value = (value & 0xfff0ffff_u32) |
                UInt32.new!(busturn.to_int).&(0xf_u32) << 16
      end

      unless datast.nil?
        value = (value & 0xffff00ff_u32) |
                UInt32.new!(datast.to_int).&(0xff_u32) << 8
      end

      unless addhld.nil?
        value = (value & 0xffffff0f_u32) |
                UInt32.new!(addhld.to_int).&(0xf_u32) << 4
      end

      unless addset.nil?
        value = (value & 0xfffffff0_u32) |
                UInt32.new!(addset.to_int).&(0xf_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      accmod : UInt8? = nil,
      datlat : UInt8? = nil,
      clkdiv : UInt8? = nil,
      busturn : UInt8? = nil,
      datast : UInt8? = nil,
      addhld : UInt8? = nil,
      addset : UInt8? = nil
    ) : Nil
      self.value = self.value.copy_with(
        accmod: accmod,
        datlat: datlat,
        clkdiv: clkdiv,
        busturn: busturn,
        datast: datast,
        addhld: addhld,
        addset: addset,
      )
    end
  end # struct

  # SRAM/NOR-Flash chip-select control register          4
  struct BCR4
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
      new(0x30d0_u64)
    end

    def self.pointer : Pointer(UInt32)
      Pointer(UInt32).new(self.address)
    end

    def self.value : self
      value = self.pointer.load(volatile: true)
      new(value)
    end

    def self.value=(value : self) : self
      self.pointer.store(value.to_int, volatile: true)
      value
    end

    # CBURSTRW
    def cburstrw : Bool
      @value.bits_set?(0x80000_u32)
    end

    # CBURSTRW
    def self.cburstrw : Bool
      value.cburstrw
    end

    # CBURSTRW
    def self.cburstrw=(value : Bool) : Bool
      self.set(cburstrw: value)
      value
    end

    # ASYNCWAIT
    def asyncwait : Bool
      @value.bits_set?(0x8000_u32)
    end

    # ASYNCWAIT
    def self.asyncwait : Bool
      value.asyncwait
    end

    # ASYNCWAIT
    def self.asyncwait=(value : Bool) : Bool
      self.set(asyncwait: value)
      value
    end

    # EXTMOD
    def extmod : Bool
      @value.bits_set?(0x4000_u32)
    end

    # EXTMOD
    def self.extmod : Bool
      value.extmod
    end

    # EXTMOD
    def self.extmod=(value : Bool) : Bool
      self.set(extmod: value)
      value
    end

    # WAITEN
    def waiten : Bool
      @value.bits_set?(0x2000_u32)
    end

    # WAITEN
    def self.waiten : Bool
      value.waiten
    end

    # WAITEN
    def self.waiten=(value : Bool) : Bool
      self.set(waiten: value)
      value
    end

    # WREN
    def wren : Bool
      @value.bits_set?(0x1000_u32)
    end

    # WREN
    def self.wren : Bool
      value.wren
    end

    # WREN
    def self.wren=(value : Bool) : Bool
      self.set(wren: value)
      value
    end

    # WAITCFG
    def waitcfg : Bool
      @value.bits_set?(0x800_u32)
    end

    # WAITCFG
    def self.waitcfg : Bool
      value.waitcfg
    end

    # WAITCFG
    def self.waitcfg=(value : Bool) : Bool
      self.set(waitcfg: value)
      value
    end

    # WRAPMOD
    def wrapmod : Bool
      @value.bits_set?(0x400_u32)
    end

    # WRAPMOD
    def self.wrapmod : Bool
      value.wrapmod
    end

    # WRAPMOD
    def self.wrapmod=(value : Bool) : Bool
      self.set(wrapmod: value)
      value
    end

    # WAITPOL
    def waitpol : Bool
      @value.bits_set?(0x200_u32)
    end

    # WAITPOL
    def self.waitpol : Bool
      value.waitpol
    end

    # WAITPOL
    def self.waitpol=(value : Bool) : Bool
      self.set(waitpol: value)
      value
    end

    # BURSTEN
    def bursten : Bool
      @value.bits_set?(0x100_u32)
    end

    # BURSTEN
    def self.bursten : Bool
      value.bursten
    end

    # BURSTEN
    def self.bursten=(value : Bool) : Bool
      self.set(bursten: value)
      value
    end

    # FACCEN
    def faccen : Bool
      @value.bits_set?(0x40_u32)
    end

    # FACCEN
    def self.faccen : Bool
      value.faccen
    end

    # FACCEN
    def self.faccen=(value : Bool) : Bool
      self.set(faccen: value)
      value
    end

    # MWID
    def mwid : UInt8
      UInt8.new!((@value >> 4) & 0x3_u32)
    end

    # MWID
    def self.mwid : UInt8
      value.mwid
    end

    # MWID
    def self.mwid=(value : UInt8) : UInt8
      self.set(mwid: value)
      value
    end

    # MTYP
    def mtyp : UInt8
      UInt8.new!((@value >> 2) & 0x3_u32)
    end

    # MTYP
    def self.mtyp : UInt8
      value.mtyp
    end

    # MTYP
    def self.mtyp=(value : UInt8) : UInt8
      self.set(mtyp: value)
      value
    end

    # MUXEN
    def muxen : Bool
      @value.bits_set?(0x2_u32)
    end

    # MUXEN
    def self.muxen : Bool
      value.muxen
    end

    # MUXEN
    def self.muxen=(value : Bool) : Bool
      self.set(muxen: value)
      value
    end

    # MBKEN
    def mbken : Bool
      @value.bits_set?(0x1_u32)
    end

    # MBKEN
    def self.mbken : Bool
      value.mbken
    end

    # MBKEN
    def self.mbken=(value : Bool) : Bool
      self.set(mbken: value)
      value
    end

    def copy_with(
      *,

      cburstrw : Bool? = nil,

      asyncwait : Bool? = nil,

      extmod : Bool? = nil,

      waiten : Bool? = nil,

      wren : Bool? = nil,

      waitcfg : Bool? = nil,

      wrapmod : Bool? = nil,

      waitpol : Bool? = nil,

      bursten : Bool? = nil,

      faccen : Bool? = nil,

      mwid : UInt8? = nil,

      mtyp : UInt8? = nil,

      muxen : Bool? = nil,

      mbken : Bool? = nil
    ) : self
      value = @value

      unless cburstrw.nil?
        value = (value & 0xfff7ffff_u32) |
                UInt32.new!(cburstrw.to_int).&(0x1_u32) << 19
      end

      unless asyncwait.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(asyncwait.to_int).&(0x1_u32) << 15
      end

      unless extmod.nil?
        value = (value & 0xffffbfff_u32) |
                UInt32.new!(extmod.to_int).&(0x1_u32) << 14
      end

      unless waiten.nil?
        value = (value & 0xffffdfff_u32) |
                UInt32.new!(waiten.to_int).&(0x1_u32) << 13
      end

      unless wren.nil?
        value = (value & 0xffffefff_u32) |
                UInt32.new!(wren.to_int).&(0x1_u32) << 12
      end

      unless waitcfg.nil?
        value = (value & 0xfffff7ff_u32) |
                UInt32.new!(waitcfg.to_int).&(0x1_u32) << 11
      end

      unless wrapmod.nil?
        value = (value & 0xfffffbff_u32) |
                UInt32.new!(wrapmod.to_int).&(0x1_u32) << 10
      end

      unless waitpol.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(waitpol.to_int).&(0x1_u32) << 9
      end

      unless bursten.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(bursten.to_int).&(0x1_u32) << 8
      end

      unless faccen.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(faccen.to_int).&(0x1_u32) << 6
      end

      unless mwid.nil?
        value = (value & 0xffffffcf_u32) |
                UInt32.new!(mwid.to_int).&(0x3_u32) << 4
      end

      unless mtyp.nil?
        value = (value & 0xfffffff3_u32) |
                UInt32.new!(mtyp.to_int).&(0x3_u32) << 2
      end

      unless muxen.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(muxen.to_int).&(0x1_u32) << 1
      end

      unless mbken.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(mbken.to_int).&(0x1_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      cburstrw : Bool? = nil,
      asyncwait : Bool? = nil,
      extmod : Bool? = nil,
      waiten : Bool? = nil,
      wren : Bool? = nil,
      waitcfg : Bool? = nil,
      wrapmod : Bool? = nil,
      waitpol : Bool? = nil,
      bursten : Bool? = nil,
      faccen : Bool? = nil,
      mwid : UInt8? = nil,
      mtyp : UInt8? = nil,
      muxen : Bool? = nil,
      mbken : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        cburstrw: cburstrw,
        asyncwait: asyncwait,
        extmod: extmod,
        waiten: waiten,
        wren: wren,
        waitcfg: waitcfg,
        wrapmod: wrapmod,
        waitpol: waitpol,
        bursten: bursten,
        faccen: faccen,
        mwid: mwid,
        mtyp: mtyp,
        muxen: muxen,
        mbken: mbken,
      )
    end
  end # struct

  # SRAM/NOR-Flash chip-select timing register          4
  struct BTR4
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

    # ACCMOD
    def accmod : UInt8
      UInt8.new!((@value >> 28) & 0x3_u32)
    end

    # ACCMOD
    def self.accmod : UInt8
      value.accmod
    end

    # ACCMOD
    def self.accmod=(value : UInt8) : UInt8
      self.set(accmod: value)
      value
    end

    # DATLAT
    def datlat : UInt8
      UInt8.new!((@value >> 24) & 0xf_u32)
    end

    # DATLAT
    def self.datlat : UInt8
      value.datlat
    end

    # DATLAT
    def self.datlat=(value : UInt8) : UInt8
      self.set(datlat: value)
      value
    end

    # CLKDIV
    def clkdiv : UInt8
      UInt8.new!((@value >> 20) & 0xf_u32)
    end

    # CLKDIV
    def self.clkdiv : UInt8
      value.clkdiv
    end

    # CLKDIV
    def self.clkdiv=(value : UInt8) : UInt8
      self.set(clkdiv: value)
      value
    end

    # BUSTURN
    def busturn : UInt8
      UInt8.new!((@value >> 16) & 0xf_u32)
    end

    # BUSTURN
    def self.busturn : UInt8
      value.busturn
    end

    # BUSTURN
    def self.busturn=(value : UInt8) : UInt8
      self.set(busturn: value)
      value
    end

    # DATAST
    def datast : UInt8
      UInt8.new!((@value >> 8) & 0xff_u32)
    end

    # DATAST
    def self.datast : UInt8
      value.datast
    end

    # DATAST
    def self.datast=(value : UInt8) : UInt8
      self.set(datast: value)
      value
    end

    # ADDHLD
    def addhld : UInt8
      UInt8.new!((@value >> 4) & 0xf_u32)
    end

    # ADDHLD
    def self.addhld : UInt8
      value.addhld
    end

    # ADDHLD
    def self.addhld=(value : UInt8) : UInt8
      self.set(addhld: value)
      value
    end

    # ADDSET
    def addset : UInt8
      UInt8.new!((@value >> 0) & 0xf_u32)
    end

    # ADDSET
    def self.addset : UInt8
      value.addset
    end

    # ADDSET
    def self.addset=(value : UInt8) : UInt8
      self.set(addset: value)
      value
    end

    def copy_with(
      *,

      accmod : UInt8? = nil,

      datlat : UInt8? = nil,

      clkdiv : UInt8? = nil,

      busturn : UInt8? = nil,

      datast : UInt8? = nil,

      addhld : UInt8? = nil,

      addset : UInt8? = nil
    ) : self
      value = @value

      unless accmod.nil?
        value = (value & 0xcfffffff_u32) |
                UInt32.new!(accmod.to_int).&(0x3_u32) << 28
      end

      unless datlat.nil?
        value = (value & 0xf0ffffff_u32) |
                UInt32.new!(datlat.to_int).&(0xf_u32) << 24
      end

      unless clkdiv.nil?
        value = (value & 0xff0fffff_u32) |
                UInt32.new!(clkdiv.to_int).&(0xf_u32) << 20
      end

      unless busturn.nil?
        value = (value & 0xfff0ffff_u32) |
                UInt32.new!(busturn.to_int).&(0xf_u32) << 16
      end

      unless datast.nil?
        value = (value & 0xffff00ff_u32) |
                UInt32.new!(datast.to_int).&(0xff_u32) << 8
      end

      unless addhld.nil?
        value = (value & 0xffffff0f_u32) |
                UInt32.new!(addhld.to_int).&(0xf_u32) << 4
      end

      unless addset.nil?
        value = (value & 0xfffffff0_u32) |
                UInt32.new!(addset.to_int).&(0xf_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      accmod : UInt8? = nil,
      datlat : UInt8? = nil,
      clkdiv : UInt8? = nil,
      busturn : UInt8? = nil,
      datast : UInt8? = nil,
      addhld : UInt8? = nil,
      addset : UInt8? = nil
    ) : Nil
      self.value = self.value.copy_with(
        accmod: accmod,
        datlat: datlat,
        clkdiv: clkdiv,
        busturn: busturn,
        datast: datast,
        addhld: addhld,
        addset: addset,
      )
    end
  end # struct

  # PC Card/NAND Flash control register          2
  struct PCR2
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
      new(0x18_u64)
    end

    def self.pointer : Pointer(UInt32)
      Pointer(UInt32).new(self.address)
    end

    def self.value : self
      value = self.pointer.load(volatile: true)
      new(value)
    end

    def self.value=(value : self) : self
      self.pointer.store(value.to_int, volatile: true)
      value
    end

    # ECCPS
    def eccps : UInt8
      UInt8.new!((@value >> 17) & 0x7_u32)
    end

    # ECCPS
    def self.eccps : UInt8
      value.eccps
    end

    # ECCPS
    def self.eccps=(value : UInt8) : UInt8
      self.set(eccps: value)
      value
    end

    # TAR
    def tar : UInt8
      UInt8.new!((@value >> 13) & 0xf_u32)
    end

    # TAR
    def self.tar : UInt8
      value.tar
    end

    # TAR
    def self.tar=(value : UInt8) : UInt8
      self.set(tar: value)
      value
    end

    # TCLR
    def tclr : UInt8
      UInt8.new!((@value >> 9) & 0xf_u32)
    end

    # TCLR
    def self.tclr : UInt8
      value.tclr
    end

    # TCLR
    def self.tclr=(value : UInt8) : UInt8
      self.set(tclr: value)
      value
    end

    # ECCEN
    def eccen : Bool
      @value.bits_set?(0x40_u32)
    end

    # ECCEN
    def self.eccen : Bool
      value.eccen
    end

    # ECCEN
    def self.eccen=(value : Bool) : Bool
      self.set(eccen: value)
      value
    end

    # PWID
    def pwid : UInt8
      UInt8.new!((@value >> 4) & 0x3_u32)
    end

    # PWID
    def self.pwid : UInt8
      value.pwid
    end

    # PWID
    def self.pwid=(value : UInt8) : UInt8
      self.set(pwid: value)
      value
    end

    # PTYP
    def ptyp : Bool
      @value.bits_set?(0x8_u32)
    end

    # PTYP
    def self.ptyp : Bool
      value.ptyp
    end

    # PTYP
    def self.ptyp=(value : Bool) : Bool
      self.set(ptyp: value)
      value
    end

    # PBKEN
    def pbken : Bool
      @value.bits_set?(0x4_u32)
    end

    # PBKEN
    def self.pbken : Bool
      value.pbken
    end

    # PBKEN
    def self.pbken=(value : Bool) : Bool
      self.set(pbken: value)
      value
    end

    # PWAITEN
    def pwaiten : Bool
      @value.bits_set?(0x2_u32)
    end

    # PWAITEN
    def self.pwaiten : Bool
      value.pwaiten
    end

    # PWAITEN
    def self.pwaiten=(value : Bool) : Bool
      self.set(pwaiten: value)
      value
    end

    def copy_with(
      *,

      eccps : UInt8? = nil,

      tar : UInt8? = nil,

      tclr : UInt8? = nil,

      eccen : Bool? = nil,

      pwid : UInt8? = nil,

      ptyp : Bool? = nil,

      pbken : Bool? = nil,

      pwaiten : Bool? = nil
    ) : self
      value = @value

      unless eccps.nil?
        value = (value & 0xfff1ffff_u32) |
                UInt32.new!(eccps.to_int).&(0x7_u32) << 17
      end

      unless tar.nil?
        value = (value & 0xfffe1fff_u32) |
                UInt32.new!(tar.to_int).&(0xf_u32) << 13
      end

      unless tclr.nil?
        value = (value & 0xffffe1ff_u32) |
                UInt32.new!(tclr.to_int).&(0xf_u32) << 9
      end

      unless eccen.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(eccen.to_int).&(0x1_u32) << 6
      end

      unless pwid.nil?
        value = (value & 0xffffffcf_u32) |
                UInt32.new!(pwid.to_int).&(0x3_u32) << 4
      end

      unless ptyp.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(ptyp.to_int).&(0x1_u32) << 3
      end

      unless pbken.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(pbken.to_int).&(0x1_u32) << 2
      end

      unless pwaiten.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(pwaiten.to_int).&(0x1_u32) << 1
      end

      self.class.new(value)
    end

    def self.set(
      *,
      eccps : UInt8? = nil,
      tar : UInt8? = nil,
      tclr : UInt8? = nil,
      eccen : Bool? = nil,
      pwid : UInt8? = nil,
      ptyp : Bool? = nil,
      pbken : Bool? = nil,
      pwaiten : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        eccps: eccps,
        tar: tar,
        tclr: tclr,
        eccen: eccen,
        pwid: pwid,
        ptyp: ptyp,
        pbken: pbken,
        pwaiten: pwaiten,
      )
    end
  end # struct

  # FIFO status and interrupt register          2
  struct SR2
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
      new(0x40_u64)
    end

    def self.pointer : Pointer(UInt32)
      Pointer(UInt32).new(self.address)
    end

    def self.value : self
      value = self.pointer.load(volatile: true)
      new(value)
    end

    def self.value=(value : self) : self
      self.pointer.store(value.to_int, volatile: true)
      value
    end

    # FEMPT
    def fempt : Bool
      @value.bits_set?(0x40_u32)
    end

    # FEMPT
    def self.fempt : Bool
      value.fempt
    end

    # IFEN
    def ifen : Bool
      @value.bits_set?(0x20_u32)
    end

    # IFEN
    def self.ifen : Bool
      value.ifen
    end

    # IFEN
    def self.ifen=(value : Bool) : Bool
      self.set(ifen: value)
      value
    end

    # ILEN
    def ilen : Bool
      @value.bits_set?(0x10_u32)
    end

    # ILEN
    def self.ilen : Bool
      value.ilen
    end

    # ILEN
    def self.ilen=(value : Bool) : Bool
      self.set(ilen: value)
      value
    end

    # IREN
    def iren : Bool
      @value.bits_set?(0x8_u32)
    end

    # IREN
    def self.iren : Bool
      value.iren
    end

    # IREN
    def self.iren=(value : Bool) : Bool
      self.set(iren: value)
      value
    end

    # IFS
    def ifs : Bool
      @value.bits_set?(0x4_u32)
    end

    # IFS
    def self.ifs : Bool
      value.ifs
    end

    # IFS
    def self.ifs=(value : Bool) : Bool
      self.set(ifs: value)
      value
    end

    # ILS
    def ils : Bool
      @value.bits_set?(0x2_u32)
    end

    # ILS
    def self.ils : Bool
      value.ils
    end

    # ILS
    def self.ils=(value : Bool) : Bool
      self.set(ils: value)
      value
    end

    # IRS
    def irs : Bool
      @value.bits_set?(0x1_u32)
    end

    # IRS
    def self.irs : Bool
      value.irs
    end

    # IRS
    def self.irs=(value : Bool) : Bool
      self.set(irs: value)
      value
    end

    def copy_with(
      *,

      ifen : Bool? = nil,

      ilen : Bool? = nil,

      iren : Bool? = nil,

      ifs : Bool? = nil,

      ils : Bool? = nil,

      irs : Bool? = nil
    ) : self
      value = @value

      unless ifen.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(ifen.to_int).&(0x1_u32) << 5
      end

      unless ilen.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(ilen.to_int).&(0x1_u32) << 4
      end

      unless iren.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(iren.to_int).&(0x1_u32) << 3
      end

      unless ifs.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(ifs.to_int).&(0x1_u32) << 2
      end

      unless ils.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(ils.to_int).&(0x1_u32) << 1
      end

      unless irs.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(irs.to_int).&(0x1_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      ifen : Bool? = nil,
      ilen : Bool? = nil,
      iren : Bool? = nil,
      ifs : Bool? = nil,
      ils : Bool? = nil,
      irs : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        ifen: ifen,
        ilen: ilen,
        iren: iren,
        ifs: ifs,
        ils: ils,
        irs: irs,
      )
    end
  end # struct

  # Common memory space timing register          2
  struct PMEM2
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
      new(0xfcfcfcfc_u64)
    end

    def self.pointer : Pointer(UInt32)
      Pointer(UInt32).new(self.address)
    end

    def self.value : self
      value = self.pointer.load(volatile: true)
      new(value)
    end

    def self.value=(value : self) : self
      self.pointer.store(value.to_int, volatile: true)
      value
    end

    # MEMHIZx
    def memhi_zx : UInt8
      UInt8.new!((@value >> 24) & 0xff_u32)
    end

    # MEMHIZx
    def self.memhi_zx : UInt8
      value.memhi_zx
    end

    # MEMHIZx
    def self.memhi_zx=(value : UInt8) : UInt8
      self.set(memhi_zx: value)
      value
    end

    # MEMHOLDx
    def memhol_dx : UInt8
      UInt8.new!((@value >> 16) & 0xff_u32)
    end

    # MEMHOLDx
    def self.memhol_dx : UInt8
      value.memhol_dx
    end

    # MEMHOLDx
    def self.memhol_dx=(value : UInt8) : UInt8
      self.set(memhol_dx: value)
      value
    end

    # MEMWAITx
    def memwai_tx : UInt8
      UInt8.new!((@value >> 8) & 0xff_u32)
    end

    # MEMWAITx
    def self.memwai_tx : UInt8
      value.memwai_tx
    end

    # MEMWAITx
    def self.memwai_tx=(value : UInt8) : UInt8
      self.set(memwai_tx: value)
      value
    end

    # MEMSETx
    def memse_tx : UInt8
      UInt8.new!((@value >> 0) & 0xff_u32)
    end

    # MEMSETx
    def self.memse_tx : UInt8
      value.memse_tx
    end

    # MEMSETx
    def self.memse_tx=(value : UInt8) : UInt8
      self.set(memse_tx: value)
      value
    end

    def copy_with(
      *,

      memhi_zx : UInt8? = nil,

      memhol_dx : UInt8? = nil,

      memwai_tx : UInt8? = nil,

      memse_tx : UInt8? = nil
    ) : self
      value = @value

      unless memhi_zx.nil?
        value = (value & 0xffffff_u32) |
                UInt32.new!(memhi_zx.to_int).&(0xff_u32) << 24
      end

      unless memhol_dx.nil?
        value = (value & 0xff00ffff_u32) |
                UInt32.new!(memhol_dx.to_int).&(0xff_u32) << 16
      end

      unless memwai_tx.nil?
        value = (value & 0xffff00ff_u32) |
                UInt32.new!(memwai_tx.to_int).&(0xff_u32) << 8
      end

      unless memse_tx.nil?
        value = (value & 0xffffff00_u32) |
                UInt32.new!(memse_tx.to_int).&(0xff_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      memhi_zx : UInt8? = nil,
      memhol_dx : UInt8? = nil,
      memwai_tx : UInt8? = nil,
      memse_tx : UInt8? = nil
    ) : Nil
      self.value = self.value.copy_with(
        memhi_zx: memhi_zx,
        memhol_dx: memhol_dx,
        memwai_tx: memwai_tx,
        memse_tx: memse_tx,
      )
    end
  end # struct

  # Attribute memory space timing register          2
  struct PATT2
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
      new(0xfcfcfcfc_u64)
    end

    def self.pointer : Pointer(UInt32)
      Pointer(UInt32).new(self.address)
    end

    def self.value : self
      value = self.pointer.load(volatile: true)
      new(value)
    end

    def self.value=(value : self) : self
      self.pointer.store(value.to_int, volatile: true)
      value
    end

    # ATTHIZx
    def atthi_zx : UInt8
      UInt8.new!((@value >> 24) & 0xff_u32)
    end

    # ATTHIZx
    def self.atthi_zx : UInt8
      value.atthi_zx
    end

    # ATTHIZx
    def self.atthi_zx=(value : UInt8) : UInt8
      self.set(atthi_zx: value)
      value
    end

    # ATTHOLDx
    def atthol_dx : UInt8
      UInt8.new!((@value >> 16) & 0xff_u32)
    end

    # ATTHOLDx
    def self.atthol_dx : UInt8
      value.atthol_dx
    end

    # ATTHOLDx
    def self.atthol_dx=(value : UInt8) : UInt8
      self.set(atthol_dx: value)
      value
    end

    # ATTWAITx
    def attwai_tx : UInt8
      UInt8.new!((@value >> 8) & 0xff_u32)
    end

    # ATTWAITx
    def self.attwai_tx : UInt8
      value.attwai_tx
    end

    # ATTWAITx
    def self.attwai_tx=(value : UInt8) : UInt8
      self.set(attwai_tx: value)
      value
    end

    # ATTSETx
    def attse_tx : UInt8
      UInt8.new!((@value >> 0) & 0xff_u32)
    end

    # ATTSETx
    def self.attse_tx : UInt8
      value.attse_tx
    end

    # ATTSETx
    def self.attse_tx=(value : UInt8) : UInt8
      self.set(attse_tx: value)
      value
    end

    def copy_with(
      *,

      atthi_zx : UInt8? = nil,

      atthol_dx : UInt8? = nil,

      attwai_tx : UInt8? = nil,

      attse_tx : UInt8? = nil
    ) : self
      value = @value

      unless atthi_zx.nil?
        value = (value & 0xffffff_u32) |
                UInt32.new!(atthi_zx.to_int).&(0xff_u32) << 24
      end

      unless atthol_dx.nil?
        value = (value & 0xff00ffff_u32) |
                UInt32.new!(atthol_dx.to_int).&(0xff_u32) << 16
      end

      unless attwai_tx.nil?
        value = (value & 0xffff00ff_u32) |
                UInt32.new!(attwai_tx.to_int).&(0xff_u32) << 8
      end

      unless attse_tx.nil?
        value = (value & 0xffffff00_u32) |
                UInt32.new!(attse_tx.to_int).&(0xff_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      atthi_zx : UInt8? = nil,
      atthol_dx : UInt8? = nil,
      attwai_tx : UInt8? = nil,
      attse_tx : UInt8? = nil
    ) : Nil
      self.value = self.value.copy_with(
        atthi_zx: atthi_zx,
        atthol_dx: atthol_dx,
        attwai_tx: attwai_tx,
        attse_tx: attse_tx,
      )
    end
  end # struct

  # ECC result register 2
  struct ECCR2
    ADDRESS = BASE_ADDRESS + 0x74_u64

    protected def self.address : UInt64
      ADDRESS
    end

    @value : UInt32

    def initialize(@value : UInt32)
    end

    def to_int : UInt32
      @value
    end

    def self.reset_value : self
      new(0x0_u64)
    end

    def self.pointer : Pointer(UInt32)
      Pointer(UInt32).new(self.address)
    end

    def self.value : self
      value = self.pointer.load(volatile: true)
      new(value)
    end

    def self.value=(value : self) : self
      self.pointer.store(value.to_int, volatile: true)
      value
    end

    # ECCx
    def ec_cx : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # ECCx
    def self.ec_cx : UInt32
      value.ec_cx
    end
  end # struct

  # PC Card/NAND Flash control register          3
  struct PCR3
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
      new(0x18_u64)
    end

    def self.pointer : Pointer(UInt32)
      Pointer(UInt32).new(self.address)
    end

    def self.value : self
      value = self.pointer.load(volatile: true)
      new(value)
    end

    def self.value=(value : self) : self
      self.pointer.store(value.to_int, volatile: true)
      value
    end

    # ECCPS
    def eccps : UInt8
      UInt8.new!((@value >> 17) & 0x7_u32)
    end

    # ECCPS
    def self.eccps : UInt8
      value.eccps
    end

    # ECCPS
    def self.eccps=(value : UInt8) : UInt8
      self.set(eccps: value)
      value
    end

    # TAR
    def tar : UInt8
      UInt8.new!((@value >> 13) & 0xf_u32)
    end

    # TAR
    def self.tar : UInt8
      value.tar
    end

    # TAR
    def self.tar=(value : UInt8) : UInt8
      self.set(tar: value)
      value
    end

    # TCLR
    def tclr : UInt8
      UInt8.new!((@value >> 9) & 0xf_u32)
    end

    # TCLR
    def self.tclr : UInt8
      value.tclr
    end

    # TCLR
    def self.tclr=(value : UInt8) : UInt8
      self.set(tclr: value)
      value
    end

    # ECCEN
    def eccen : Bool
      @value.bits_set?(0x40_u32)
    end

    # ECCEN
    def self.eccen : Bool
      value.eccen
    end

    # ECCEN
    def self.eccen=(value : Bool) : Bool
      self.set(eccen: value)
      value
    end

    # PWID
    def pwid : UInt8
      UInt8.new!((@value >> 4) & 0x3_u32)
    end

    # PWID
    def self.pwid : UInt8
      value.pwid
    end

    # PWID
    def self.pwid=(value : UInt8) : UInt8
      self.set(pwid: value)
      value
    end

    # PTYP
    def ptyp : Bool
      @value.bits_set?(0x8_u32)
    end

    # PTYP
    def self.ptyp : Bool
      value.ptyp
    end

    # PTYP
    def self.ptyp=(value : Bool) : Bool
      self.set(ptyp: value)
      value
    end

    # PBKEN
    def pbken : Bool
      @value.bits_set?(0x4_u32)
    end

    # PBKEN
    def self.pbken : Bool
      value.pbken
    end

    # PBKEN
    def self.pbken=(value : Bool) : Bool
      self.set(pbken: value)
      value
    end

    # PWAITEN
    def pwaiten : Bool
      @value.bits_set?(0x2_u32)
    end

    # PWAITEN
    def self.pwaiten : Bool
      value.pwaiten
    end

    # PWAITEN
    def self.pwaiten=(value : Bool) : Bool
      self.set(pwaiten: value)
      value
    end

    def copy_with(
      *,

      eccps : UInt8? = nil,

      tar : UInt8? = nil,

      tclr : UInt8? = nil,

      eccen : Bool? = nil,

      pwid : UInt8? = nil,

      ptyp : Bool? = nil,

      pbken : Bool? = nil,

      pwaiten : Bool? = nil
    ) : self
      value = @value

      unless eccps.nil?
        value = (value & 0xfff1ffff_u32) |
                UInt32.new!(eccps.to_int).&(0x7_u32) << 17
      end

      unless tar.nil?
        value = (value & 0xfffe1fff_u32) |
                UInt32.new!(tar.to_int).&(0xf_u32) << 13
      end

      unless tclr.nil?
        value = (value & 0xffffe1ff_u32) |
                UInt32.new!(tclr.to_int).&(0xf_u32) << 9
      end

      unless eccen.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(eccen.to_int).&(0x1_u32) << 6
      end

      unless pwid.nil?
        value = (value & 0xffffffcf_u32) |
                UInt32.new!(pwid.to_int).&(0x3_u32) << 4
      end

      unless ptyp.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(ptyp.to_int).&(0x1_u32) << 3
      end

      unless pbken.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(pbken.to_int).&(0x1_u32) << 2
      end

      unless pwaiten.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(pwaiten.to_int).&(0x1_u32) << 1
      end

      self.class.new(value)
    end

    def self.set(
      *,
      eccps : UInt8? = nil,
      tar : UInt8? = nil,
      tclr : UInt8? = nil,
      eccen : Bool? = nil,
      pwid : UInt8? = nil,
      ptyp : Bool? = nil,
      pbken : Bool? = nil,
      pwaiten : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        eccps: eccps,
        tar: tar,
        tclr: tclr,
        eccen: eccen,
        pwid: pwid,
        ptyp: ptyp,
        pbken: pbken,
        pwaiten: pwaiten,
      )
    end
  end # struct

  # FIFO status and interrupt register          3
  struct SR3
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
      new(0x40_u64)
    end

    def self.pointer : Pointer(UInt32)
      Pointer(UInt32).new(self.address)
    end

    def self.value : self
      value = self.pointer.load(volatile: true)
      new(value)
    end

    def self.value=(value : self) : self
      self.pointer.store(value.to_int, volatile: true)
      value
    end

    # FEMPT
    def fempt : Bool
      @value.bits_set?(0x40_u32)
    end

    # FEMPT
    def self.fempt : Bool
      value.fempt
    end

    # IFEN
    def ifen : Bool
      @value.bits_set?(0x20_u32)
    end

    # IFEN
    def self.ifen : Bool
      value.ifen
    end

    # IFEN
    def self.ifen=(value : Bool) : Bool
      self.set(ifen: value)
      value
    end

    # ILEN
    def ilen : Bool
      @value.bits_set?(0x10_u32)
    end

    # ILEN
    def self.ilen : Bool
      value.ilen
    end

    # ILEN
    def self.ilen=(value : Bool) : Bool
      self.set(ilen: value)
      value
    end

    # IREN
    def iren : Bool
      @value.bits_set?(0x8_u32)
    end

    # IREN
    def self.iren : Bool
      value.iren
    end

    # IREN
    def self.iren=(value : Bool) : Bool
      self.set(iren: value)
      value
    end

    # IFS
    def ifs : Bool
      @value.bits_set?(0x4_u32)
    end

    # IFS
    def self.ifs : Bool
      value.ifs
    end

    # IFS
    def self.ifs=(value : Bool) : Bool
      self.set(ifs: value)
      value
    end

    # ILS
    def ils : Bool
      @value.bits_set?(0x2_u32)
    end

    # ILS
    def self.ils : Bool
      value.ils
    end

    # ILS
    def self.ils=(value : Bool) : Bool
      self.set(ils: value)
      value
    end

    # IRS
    def irs : Bool
      @value.bits_set?(0x1_u32)
    end

    # IRS
    def self.irs : Bool
      value.irs
    end

    # IRS
    def self.irs=(value : Bool) : Bool
      self.set(irs: value)
      value
    end

    def copy_with(
      *,

      ifen : Bool? = nil,

      ilen : Bool? = nil,

      iren : Bool? = nil,

      ifs : Bool? = nil,

      ils : Bool? = nil,

      irs : Bool? = nil
    ) : self
      value = @value

      unless ifen.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(ifen.to_int).&(0x1_u32) << 5
      end

      unless ilen.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(ilen.to_int).&(0x1_u32) << 4
      end

      unless iren.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(iren.to_int).&(0x1_u32) << 3
      end

      unless ifs.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(ifs.to_int).&(0x1_u32) << 2
      end

      unless ils.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(ils.to_int).&(0x1_u32) << 1
      end

      unless irs.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(irs.to_int).&(0x1_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      ifen : Bool? = nil,
      ilen : Bool? = nil,
      iren : Bool? = nil,
      ifs : Bool? = nil,
      ils : Bool? = nil,
      irs : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        ifen: ifen,
        ilen: ilen,
        iren: iren,
        ifs: ifs,
        ils: ils,
        irs: irs,
      )
    end
  end # struct

  # Common memory space timing register          3
  struct PMEM3
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
      new(0xfcfcfcfc_u64)
    end

    def self.pointer : Pointer(UInt32)
      Pointer(UInt32).new(self.address)
    end

    def self.value : self
      value = self.pointer.load(volatile: true)
      new(value)
    end

    def self.value=(value : self) : self
      self.pointer.store(value.to_int, volatile: true)
      value
    end

    # MEMHIZx
    def memhi_zx : UInt8
      UInt8.new!((@value >> 24) & 0xff_u32)
    end

    # MEMHIZx
    def self.memhi_zx : UInt8
      value.memhi_zx
    end

    # MEMHIZx
    def self.memhi_zx=(value : UInt8) : UInt8
      self.set(memhi_zx: value)
      value
    end

    # MEMHOLDx
    def memhol_dx : UInt8
      UInt8.new!((@value >> 16) & 0xff_u32)
    end

    # MEMHOLDx
    def self.memhol_dx : UInt8
      value.memhol_dx
    end

    # MEMHOLDx
    def self.memhol_dx=(value : UInt8) : UInt8
      self.set(memhol_dx: value)
      value
    end

    # MEMWAITx
    def memwai_tx : UInt8
      UInt8.new!((@value >> 8) & 0xff_u32)
    end

    # MEMWAITx
    def self.memwai_tx : UInt8
      value.memwai_tx
    end

    # MEMWAITx
    def self.memwai_tx=(value : UInt8) : UInt8
      self.set(memwai_tx: value)
      value
    end

    # MEMSETx
    def memse_tx : UInt8
      UInt8.new!((@value >> 0) & 0xff_u32)
    end

    # MEMSETx
    def self.memse_tx : UInt8
      value.memse_tx
    end

    # MEMSETx
    def self.memse_tx=(value : UInt8) : UInt8
      self.set(memse_tx: value)
      value
    end

    def copy_with(
      *,

      memhi_zx : UInt8? = nil,

      memhol_dx : UInt8? = nil,

      memwai_tx : UInt8? = nil,

      memse_tx : UInt8? = nil
    ) : self
      value = @value

      unless memhi_zx.nil?
        value = (value & 0xffffff_u32) |
                UInt32.new!(memhi_zx.to_int).&(0xff_u32) << 24
      end

      unless memhol_dx.nil?
        value = (value & 0xff00ffff_u32) |
                UInt32.new!(memhol_dx.to_int).&(0xff_u32) << 16
      end

      unless memwai_tx.nil?
        value = (value & 0xffff00ff_u32) |
                UInt32.new!(memwai_tx.to_int).&(0xff_u32) << 8
      end

      unless memse_tx.nil?
        value = (value & 0xffffff00_u32) |
                UInt32.new!(memse_tx.to_int).&(0xff_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      memhi_zx : UInt8? = nil,
      memhol_dx : UInt8? = nil,
      memwai_tx : UInt8? = nil,
      memse_tx : UInt8? = nil
    ) : Nil
      self.value = self.value.copy_with(
        memhi_zx: memhi_zx,
        memhol_dx: memhol_dx,
        memwai_tx: memwai_tx,
        memse_tx: memse_tx,
      )
    end
  end # struct

  # Attribute memory space timing register          3
  struct PATT3
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
      new(0xfcfcfcfc_u64)
    end

    def self.pointer : Pointer(UInt32)
      Pointer(UInt32).new(self.address)
    end

    def self.value : self
      value = self.pointer.load(volatile: true)
      new(value)
    end

    def self.value=(value : self) : self
      self.pointer.store(value.to_int, volatile: true)
      value
    end

    # ATTHIZx
    def atthi_zx : UInt8
      UInt8.new!((@value >> 24) & 0xff_u32)
    end

    # ATTHIZx
    def self.atthi_zx : UInt8
      value.atthi_zx
    end

    # ATTHIZx
    def self.atthi_zx=(value : UInt8) : UInt8
      self.set(atthi_zx: value)
      value
    end

    # ATTHOLDx
    def atthol_dx : UInt8
      UInt8.new!((@value >> 16) & 0xff_u32)
    end

    # ATTHOLDx
    def self.atthol_dx : UInt8
      value.atthol_dx
    end

    # ATTHOLDx
    def self.atthol_dx=(value : UInt8) : UInt8
      self.set(atthol_dx: value)
      value
    end

    # ATTWAITx
    def attwai_tx : UInt8
      UInt8.new!((@value >> 8) & 0xff_u32)
    end

    # ATTWAITx
    def self.attwai_tx : UInt8
      value.attwai_tx
    end

    # ATTWAITx
    def self.attwai_tx=(value : UInt8) : UInt8
      self.set(attwai_tx: value)
      value
    end

    # ATTSETx
    def attse_tx : UInt8
      UInt8.new!((@value >> 0) & 0xff_u32)
    end

    # ATTSETx
    def self.attse_tx : UInt8
      value.attse_tx
    end

    # ATTSETx
    def self.attse_tx=(value : UInt8) : UInt8
      self.set(attse_tx: value)
      value
    end

    def copy_with(
      *,

      atthi_zx : UInt8? = nil,

      atthol_dx : UInt8? = nil,

      attwai_tx : UInt8? = nil,

      attse_tx : UInt8? = nil
    ) : self
      value = @value

      unless atthi_zx.nil?
        value = (value & 0xffffff_u32) |
                UInt32.new!(atthi_zx.to_int).&(0xff_u32) << 24
      end

      unless atthol_dx.nil?
        value = (value & 0xff00ffff_u32) |
                UInt32.new!(atthol_dx.to_int).&(0xff_u32) << 16
      end

      unless attwai_tx.nil?
        value = (value & 0xffff00ff_u32) |
                UInt32.new!(attwai_tx.to_int).&(0xff_u32) << 8
      end

      unless attse_tx.nil?
        value = (value & 0xffffff00_u32) |
                UInt32.new!(attse_tx.to_int).&(0xff_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      atthi_zx : UInt8? = nil,
      atthol_dx : UInt8? = nil,
      attwai_tx : UInt8? = nil,
      attse_tx : UInt8? = nil
    ) : Nil
      self.value = self.value.copy_with(
        atthi_zx: atthi_zx,
        atthol_dx: atthol_dx,
        attwai_tx: attwai_tx,
        attse_tx: attse_tx,
      )
    end
  end # struct

  # ECC result register 3
  struct ECCR3
    ADDRESS = BASE_ADDRESS + 0x94_u64

    protected def self.address : UInt64
      ADDRESS
    end

    @value : UInt32

    def initialize(@value : UInt32)
    end

    def to_int : UInt32
      @value
    end

    def self.reset_value : self
      new(0x0_u64)
    end

    def self.pointer : Pointer(UInt32)
      Pointer(UInt32).new(self.address)
    end

    def self.value : self
      value = self.pointer.load(volatile: true)
      new(value)
    end

    def self.value=(value : self) : self
      self.pointer.store(value.to_int, volatile: true)
      value
    end

    # ECCx
    def ec_cx : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # ECCx
    def self.ec_cx : UInt32
      value.ec_cx
    end
  end # struct

  # PC Card/NAND Flash control register          4
  struct PCR4
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
      new(0x18_u64)
    end

    def self.pointer : Pointer(UInt32)
      Pointer(UInt32).new(self.address)
    end

    def self.value : self
      value = self.pointer.load(volatile: true)
      new(value)
    end

    def self.value=(value : self) : self
      self.pointer.store(value.to_int, volatile: true)
      value
    end

    # ECCPS
    def eccps : UInt8
      UInt8.new!((@value >> 17) & 0x7_u32)
    end

    # ECCPS
    def self.eccps : UInt8
      value.eccps
    end

    # ECCPS
    def self.eccps=(value : UInt8) : UInt8
      self.set(eccps: value)
      value
    end

    # TAR
    def tar : UInt8
      UInt8.new!((@value >> 13) & 0xf_u32)
    end

    # TAR
    def self.tar : UInt8
      value.tar
    end

    # TAR
    def self.tar=(value : UInt8) : UInt8
      self.set(tar: value)
      value
    end

    # TCLR
    def tclr : UInt8
      UInt8.new!((@value >> 9) & 0xf_u32)
    end

    # TCLR
    def self.tclr : UInt8
      value.tclr
    end

    # TCLR
    def self.tclr=(value : UInt8) : UInt8
      self.set(tclr: value)
      value
    end

    # ECCEN
    def eccen : Bool
      @value.bits_set?(0x40_u32)
    end

    # ECCEN
    def self.eccen : Bool
      value.eccen
    end

    # ECCEN
    def self.eccen=(value : Bool) : Bool
      self.set(eccen: value)
      value
    end

    # PWID
    def pwid : UInt8
      UInt8.new!((@value >> 4) & 0x3_u32)
    end

    # PWID
    def self.pwid : UInt8
      value.pwid
    end

    # PWID
    def self.pwid=(value : UInt8) : UInt8
      self.set(pwid: value)
      value
    end

    # PTYP
    def ptyp : Bool
      @value.bits_set?(0x8_u32)
    end

    # PTYP
    def self.ptyp : Bool
      value.ptyp
    end

    # PTYP
    def self.ptyp=(value : Bool) : Bool
      self.set(ptyp: value)
      value
    end

    # PBKEN
    def pbken : Bool
      @value.bits_set?(0x4_u32)
    end

    # PBKEN
    def self.pbken : Bool
      value.pbken
    end

    # PBKEN
    def self.pbken=(value : Bool) : Bool
      self.set(pbken: value)
      value
    end

    # PWAITEN
    def pwaiten : Bool
      @value.bits_set?(0x2_u32)
    end

    # PWAITEN
    def self.pwaiten : Bool
      value.pwaiten
    end

    # PWAITEN
    def self.pwaiten=(value : Bool) : Bool
      self.set(pwaiten: value)
      value
    end

    def copy_with(
      *,

      eccps : UInt8? = nil,

      tar : UInt8? = nil,

      tclr : UInt8? = nil,

      eccen : Bool? = nil,

      pwid : UInt8? = nil,

      ptyp : Bool? = nil,

      pbken : Bool? = nil,

      pwaiten : Bool? = nil
    ) : self
      value = @value

      unless eccps.nil?
        value = (value & 0xfff1ffff_u32) |
                UInt32.new!(eccps.to_int).&(0x7_u32) << 17
      end

      unless tar.nil?
        value = (value & 0xfffe1fff_u32) |
                UInt32.new!(tar.to_int).&(0xf_u32) << 13
      end

      unless tclr.nil?
        value = (value & 0xffffe1ff_u32) |
                UInt32.new!(tclr.to_int).&(0xf_u32) << 9
      end

      unless eccen.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(eccen.to_int).&(0x1_u32) << 6
      end

      unless pwid.nil?
        value = (value & 0xffffffcf_u32) |
                UInt32.new!(pwid.to_int).&(0x3_u32) << 4
      end

      unless ptyp.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(ptyp.to_int).&(0x1_u32) << 3
      end

      unless pbken.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(pbken.to_int).&(0x1_u32) << 2
      end

      unless pwaiten.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(pwaiten.to_int).&(0x1_u32) << 1
      end

      self.class.new(value)
    end

    def self.set(
      *,
      eccps : UInt8? = nil,
      tar : UInt8? = nil,
      tclr : UInt8? = nil,
      eccen : Bool? = nil,
      pwid : UInt8? = nil,
      ptyp : Bool? = nil,
      pbken : Bool? = nil,
      pwaiten : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        eccps: eccps,
        tar: tar,
        tclr: tclr,
        eccen: eccen,
        pwid: pwid,
        ptyp: ptyp,
        pbken: pbken,
        pwaiten: pwaiten,
      )
    end
  end # struct

  # FIFO status and interrupt register          4
  struct SR4
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
      new(0x40_u64)
    end

    def self.pointer : Pointer(UInt32)
      Pointer(UInt32).new(self.address)
    end

    def self.value : self
      value = self.pointer.load(volatile: true)
      new(value)
    end

    def self.value=(value : self) : self
      self.pointer.store(value.to_int, volatile: true)
      value
    end

    # FEMPT
    def fempt : Bool
      @value.bits_set?(0x40_u32)
    end

    # FEMPT
    def self.fempt : Bool
      value.fempt
    end

    # IFEN
    def ifen : Bool
      @value.bits_set?(0x20_u32)
    end

    # IFEN
    def self.ifen : Bool
      value.ifen
    end

    # IFEN
    def self.ifen=(value : Bool) : Bool
      self.set(ifen: value)
      value
    end

    # ILEN
    def ilen : Bool
      @value.bits_set?(0x10_u32)
    end

    # ILEN
    def self.ilen : Bool
      value.ilen
    end

    # ILEN
    def self.ilen=(value : Bool) : Bool
      self.set(ilen: value)
      value
    end

    # IREN
    def iren : Bool
      @value.bits_set?(0x8_u32)
    end

    # IREN
    def self.iren : Bool
      value.iren
    end

    # IREN
    def self.iren=(value : Bool) : Bool
      self.set(iren: value)
      value
    end

    # IFS
    def ifs : Bool
      @value.bits_set?(0x4_u32)
    end

    # IFS
    def self.ifs : Bool
      value.ifs
    end

    # IFS
    def self.ifs=(value : Bool) : Bool
      self.set(ifs: value)
      value
    end

    # ILS
    def ils : Bool
      @value.bits_set?(0x2_u32)
    end

    # ILS
    def self.ils : Bool
      value.ils
    end

    # ILS
    def self.ils=(value : Bool) : Bool
      self.set(ils: value)
      value
    end

    # IRS
    def irs : Bool
      @value.bits_set?(0x1_u32)
    end

    # IRS
    def self.irs : Bool
      value.irs
    end

    # IRS
    def self.irs=(value : Bool) : Bool
      self.set(irs: value)
      value
    end

    def copy_with(
      *,

      ifen : Bool? = nil,

      ilen : Bool? = nil,

      iren : Bool? = nil,

      ifs : Bool? = nil,

      ils : Bool? = nil,

      irs : Bool? = nil
    ) : self
      value = @value

      unless ifen.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(ifen.to_int).&(0x1_u32) << 5
      end

      unless ilen.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(ilen.to_int).&(0x1_u32) << 4
      end

      unless iren.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(iren.to_int).&(0x1_u32) << 3
      end

      unless ifs.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(ifs.to_int).&(0x1_u32) << 2
      end

      unless ils.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(ils.to_int).&(0x1_u32) << 1
      end

      unless irs.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(irs.to_int).&(0x1_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      ifen : Bool? = nil,
      ilen : Bool? = nil,
      iren : Bool? = nil,
      ifs : Bool? = nil,
      ils : Bool? = nil,
      irs : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        ifen: ifen,
        ilen: ilen,
        iren: iren,
        ifs: ifs,
        ils: ils,
        irs: irs,
      )
    end
  end # struct

  # Common memory space timing register          4
  struct PMEM4
    ADDRESS = BASE_ADDRESS + 0xa8_u64

    protected def self.address : UInt64
      ADDRESS
    end

    @value : UInt32

    def initialize(@value : UInt32)
    end

    def to_int : UInt32
      @value
    end

    def self.reset_value : self
      new(0xfcfcfcfc_u64)
    end

    def self.pointer : Pointer(UInt32)
      Pointer(UInt32).new(self.address)
    end

    def self.value : self
      value = self.pointer.load(volatile: true)
      new(value)
    end

    def self.value=(value : self) : self
      self.pointer.store(value.to_int, volatile: true)
      value
    end

    # MEMHIZx
    def memhi_zx : UInt8
      UInt8.new!((@value >> 24) & 0xff_u32)
    end

    # MEMHIZx
    def self.memhi_zx : UInt8
      value.memhi_zx
    end

    # MEMHIZx
    def self.memhi_zx=(value : UInt8) : UInt8
      self.set(memhi_zx: value)
      value
    end

    # MEMHOLDx
    def memhol_dx : UInt8
      UInt8.new!((@value >> 16) & 0xff_u32)
    end

    # MEMHOLDx
    def self.memhol_dx : UInt8
      value.memhol_dx
    end

    # MEMHOLDx
    def self.memhol_dx=(value : UInt8) : UInt8
      self.set(memhol_dx: value)
      value
    end

    # MEMWAITx
    def memwai_tx : UInt8
      UInt8.new!((@value >> 8) & 0xff_u32)
    end

    # MEMWAITx
    def self.memwai_tx : UInt8
      value.memwai_tx
    end

    # MEMWAITx
    def self.memwai_tx=(value : UInt8) : UInt8
      self.set(memwai_tx: value)
      value
    end

    # MEMSETx
    def memse_tx : UInt8
      UInt8.new!((@value >> 0) & 0xff_u32)
    end

    # MEMSETx
    def self.memse_tx : UInt8
      value.memse_tx
    end

    # MEMSETx
    def self.memse_tx=(value : UInt8) : UInt8
      self.set(memse_tx: value)
      value
    end

    def copy_with(
      *,

      memhi_zx : UInt8? = nil,

      memhol_dx : UInt8? = nil,

      memwai_tx : UInt8? = nil,

      memse_tx : UInt8? = nil
    ) : self
      value = @value

      unless memhi_zx.nil?
        value = (value & 0xffffff_u32) |
                UInt32.new!(memhi_zx.to_int).&(0xff_u32) << 24
      end

      unless memhol_dx.nil?
        value = (value & 0xff00ffff_u32) |
                UInt32.new!(memhol_dx.to_int).&(0xff_u32) << 16
      end

      unless memwai_tx.nil?
        value = (value & 0xffff00ff_u32) |
                UInt32.new!(memwai_tx.to_int).&(0xff_u32) << 8
      end

      unless memse_tx.nil?
        value = (value & 0xffffff00_u32) |
                UInt32.new!(memse_tx.to_int).&(0xff_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      memhi_zx : UInt8? = nil,
      memhol_dx : UInt8? = nil,
      memwai_tx : UInt8? = nil,
      memse_tx : UInt8? = nil
    ) : Nil
      self.value = self.value.copy_with(
        memhi_zx: memhi_zx,
        memhol_dx: memhol_dx,
        memwai_tx: memwai_tx,
        memse_tx: memse_tx,
      )
    end
  end # struct

  # Attribute memory space timing register          4
  struct PATT4
    ADDRESS = BASE_ADDRESS + 0xac_u64

    protected def self.address : UInt64
      ADDRESS
    end

    @value : UInt32

    def initialize(@value : UInt32)
    end

    def to_int : UInt32
      @value
    end

    def self.reset_value : self
      new(0xfcfcfcfc_u64)
    end

    def self.pointer : Pointer(UInt32)
      Pointer(UInt32).new(self.address)
    end

    def self.value : self
      value = self.pointer.load(volatile: true)
      new(value)
    end

    def self.value=(value : self) : self
      self.pointer.store(value.to_int, volatile: true)
      value
    end

    # ATTHIZx
    def atthi_zx : UInt8
      UInt8.new!((@value >> 24) & 0xff_u32)
    end

    # ATTHIZx
    def self.atthi_zx : UInt8
      value.atthi_zx
    end

    # ATTHIZx
    def self.atthi_zx=(value : UInt8) : UInt8
      self.set(atthi_zx: value)
      value
    end

    # ATTHOLDx
    def atthol_dx : UInt8
      UInt8.new!((@value >> 16) & 0xff_u32)
    end

    # ATTHOLDx
    def self.atthol_dx : UInt8
      value.atthol_dx
    end

    # ATTHOLDx
    def self.atthol_dx=(value : UInt8) : UInt8
      self.set(atthol_dx: value)
      value
    end

    # ATTWAITx
    def attwai_tx : UInt8
      UInt8.new!((@value >> 8) & 0xff_u32)
    end

    # ATTWAITx
    def self.attwai_tx : UInt8
      value.attwai_tx
    end

    # ATTWAITx
    def self.attwai_tx=(value : UInt8) : UInt8
      self.set(attwai_tx: value)
      value
    end

    # ATTSETx
    def attse_tx : UInt8
      UInt8.new!((@value >> 0) & 0xff_u32)
    end

    # ATTSETx
    def self.attse_tx : UInt8
      value.attse_tx
    end

    # ATTSETx
    def self.attse_tx=(value : UInt8) : UInt8
      self.set(attse_tx: value)
      value
    end

    def copy_with(
      *,

      atthi_zx : UInt8? = nil,

      atthol_dx : UInt8? = nil,

      attwai_tx : UInt8? = nil,

      attse_tx : UInt8? = nil
    ) : self
      value = @value

      unless atthi_zx.nil?
        value = (value & 0xffffff_u32) |
                UInt32.new!(atthi_zx.to_int).&(0xff_u32) << 24
      end

      unless atthol_dx.nil?
        value = (value & 0xff00ffff_u32) |
                UInt32.new!(atthol_dx.to_int).&(0xff_u32) << 16
      end

      unless attwai_tx.nil?
        value = (value & 0xffff00ff_u32) |
                UInt32.new!(attwai_tx.to_int).&(0xff_u32) << 8
      end

      unless attse_tx.nil?
        value = (value & 0xffffff00_u32) |
                UInt32.new!(attse_tx.to_int).&(0xff_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      atthi_zx : UInt8? = nil,
      atthol_dx : UInt8? = nil,
      attwai_tx : UInt8? = nil,
      attse_tx : UInt8? = nil
    ) : Nil
      self.value = self.value.copy_with(
        atthi_zx: atthi_zx,
        atthol_dx: atthol_dx,
        attwai_tx: attwai_tx,
        attse_tx: attse_tx,
      )
    end
  end # struct

  # I/O space timing register 4
  struct PIO4
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
      new(0xfcfcfcfc_u64)
    end

    def self.pointer : Pointer(UInt32)
      Pointer(UInt32).new(self.address)
    end

    def self.value : self
      value = self.pointer.load(volatile: true)
      new(value)
    end

    def self.value=(value : self) : self
      self.pointer.store(value.to_int, volatile: true)
      value
    end

    # IOHIZx
    def iohi_zx : UInt8
      UInt8.new!((@value >> 24) & 0xff_u32)
    end

    # IOHIZx
    def self.iohi_zx : UInt8
      value.iohi_zx
    end

    # IOHIZx
    def self.iohi_zx=(value : UInt8) : UInt8
      self.set(iohi_zx: value)
      value
    end

    # IOHOLDx
    def iohol_dx : UInt8
      UInt8.new!((@value >> 16) & 0xff_u32)
    end

    # IOHOLDx
    def self.iohol_dx : UInt8
      value.iohol_dx
    end

    # IOHOLDx
    def self.iohol_dx=(value : UInt8) : UInt8
      self.set(iohol_dx: value)
      value
    end

    # IOWAITx
    def iowai_tx : UInt8
      UInt8.new!((@value >> 8) & 0xff_u32)
    end

    # IOWAITx
    def self.iowai_tx : UInt8
      value.iowai_tx
    end

    # IOWAITx
    def self.iowai_tx=(value : UInt8) : UInt8
      self.set(iowai_tx: value)
      value
    end

    # IOSETx
    def iose_tx : UInt8
      UInt8.new!((@value >> 0) & 0xff_u32)
    end

    # IOSETx
    def self.iose_tx : UInt8
      value.iose_tx
    end

    # IOSETx
    def self.iose_tx=(value : UInt8) : UInt8
      self.set(iose_tx: value)
      value
    end

    def copy_with(
      *,

      iohi_zx : UInt8? = nil,

      iohol_dx : UInt8? = nil,

      iowai_tx : UInt8? = nil,

      iose_tx : UInt8? = nil
    ) : self
      value = @value

      unless iohi_zx.nil?
        value = (value & 0xffffff_u32) |
                UInt32.new!(iohi_zx.to_int).&(0xff_u32) << 24
      end

      unless iohol_dx.nil?
        value = (value & 0xff00ffff_u32) |
                UInt32.new!(iohol_dx.to_int).&(0xff_u32) << 16
      end

      unless iowai_tx.nil?
        value = (value & 0xffff00ff_u32) |
                UInt32.new!(iowai_tx.to_int).&(0xff_u32) << 8
      end

      unless iose_tx.nil?
        value = (value & 0xffffff00_u32) |
                UInt32.new!(iose_tx.to_int).&(0xff_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      iohi_zx : UInt8? = nil,
      iohol_dx : UInt8? = nil,
      iowai_tx : UInt8? = nil,
      iose_tx : UInt8? = nil
    ) : Nil
      self.value = self.value.copy_with(
        iohi_zx: iohi_zx,
        iohol_dx: iohol_dx,
        iowai_tx: iowai_tx,
        iose_tx: iose_tx,
      )
    end
  end # struct

  # SRAM/NOR-Flash write timing registers          1
  struct BWTR1
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
      new(0xfffffff_u64)
    end

    def self.pointer : Pointer(UInt32)
      Pointer(UInt32).new(self.address)
    end

    def self.value : self
      value = self.pointer.load(volatile: true)
      new(value)
    end

    def self.value=(value : self) : self
      self.pointer.store(value.to_int, volatile: true)
      value
    end

    # ACCMOD
    def accmod : UInt8
      UInt8.new!((@value >> 28) & 0x3_u32)
    end

    # ACCMOD
    def self.accmod : UInt8
      value.accmod
    end

    # ACCMOD
    def self.accmod=(value : UInt8) : UInt8
      self.set(accmod: value)
      value
    end

    # DATLAT
    def datlat : UInt8
      UInt8.new!((@value >> 24) & 0xf_u32)
    end

    # DATLAT
    def self.datlat : UInt8
      value.datlat
    end

    # DATLAT
    def self.datlat=(value : UInt8) : UInt8
      self.set(datlat: value)
      value
    end

    # CLKDIV
    def clkdiv : UInt8
      UInt8.new!((@value >> 20) & 0xf_u32)
    end

    # CLKDIV
    def self.clkdiv : UInt8
      value.clkdiv
    end

    # CLKDIV
    def self.clkdiv=(value : UInt8) : UInt8
      self.set(clkdiv: value)
      value
    end

    # DATAST
    def datast : UInt8
      UInt8.new!((@value >> 8) & 0xff_u32)
    end

    # DATAST
    def self.datast : UInt8
      value.datast
    end

    # DATAST
    def self.datast=(value : UInt8) : UInt8
      self.set(datast: value)
      value
    end

    # ADDHLD
    def addhld : UInt8
      UInt8.new!((@value >> 4) & 0xf_u32)
    end

    # ADDHLD
    def self.addhld : UInt8
      value.addhld
    end

    # ADDHLD
    def self.addhld=(value : UInt8) : UInt8
      self.set(addhld: value)
      value
    end

    # ADDSET
    def addset : UInt8
      UInt8.new!((@value >> 0) & 0xf_u32)
    end

    # ADDSET
    def self.addset : UInt8
      value.addset
    end

    # ADDSET
    def self.addset=(value : UInt8) : UInt8
      self.set(addset: value)
      value
    end

    def copy_with(
      *,

      accmod : UInt8? = nil,

      datlat : UInt8? = nil,

      clkdiv : UInt8? = nil,

      datast : UInt8? = nil,

      addhld : UInt8? = nil,

      addset : UInt8? = nil
    ) : self
      value = @value

      unless accmod.nil?
        value = (value & 0xcfffffff_u32) |
                UInt32.new!(accmod.to_int).&(0x3_u32) << 28
      end

      unless datlat.nil?
        value = (value & 0xf0ffffff_u32) |
                UInt32.new!(datlat.to_int).&(0xf_u32) << 24
      end

      unless clkdiv.nil?
        value = (value & 0xff0fffff_u32) |
                UInt32.new!(clkdiv.to_int).&(0xf_u32) << 20
      end

      unless datast.nil?
        value = (value & 0xffff00ff_u32) |
                UInt32.new!(datast.to_int).&(0xff_u32) << 8
      end

      unless addhld.nil?
        value = (value & 0xffffff0f_u32) |
                UInt32.new!(addhld.to_int).&(0xf_u32) << 4
      end

      unless addset.nil?
        value = (value & 0xfffffff0_u32) |
                UInt32.new!(addset.to_int).&(0xf_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      accmod : UInt8? = nil,
      datlat : UInt8? = nil,
      clkdiv : UInt8? = nil,
      datast : UInt8? = nil,
      addhld : UInt8? = nil,
      addset : UInt8? = nil
    ) : Nil
      self.value = self.value.copy_with(
        accmod: accmod,
        datlat: datlat,
        clkdiv: clkdiv,
        datast: datast,
        addhld: addhld,
        addset: addset,
      )
    end
  end # struct

  # SRAM/NOR-Flash write timing registers          2
  struct BWTR2
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
      new(0xfffffff_u64)
    end

    def self.pointer : Pointer(UInt32)
      Pointer(UInt32).new(self.address)
    end

    def self.value : self
      value = self.pointer.load(volatile: true)
      new(value)
    end

    def self.value=(value : self) : self
      self.pointer.store(value.to_int, volatile: true)
      value
    end

    # ACCMOD
    def accmod : UInt8
      UInt8.new!((@value >> 28) & 0x3_u32)
    end

    # ACCMOD
    def self.accmod : UInt8
      value.accmod
    end

    # ACCMOD
    def self.accmod=(value : UInt8) : UInt8
      self.set(accmod: value)
      value
    end

    # DATLAT
    def datlat : UInt8
      UInt8.new!((@value >> 24) & 0xf_u32)
    end

    # DATLAT
    def self.datlat : UInt8
      value.datlat
    end

    # DATLAT
    def self.datlat=(value : UInt8) : UInt8
      self.set(datlat: value)
      value
    end

    # CLKDIV
    def clkdiv : UInt8
      UInt8.new!((@value >> 20) & 0xf_u32)
    end

    # CLKDIV
    def self.clkdiv : UInt8
      value.clkdiv
    end

    # CLKDIV
    def self.clkdiv=(value : UInt8) : UInt8
      self.set(clkdiv: value)
      value
    end

    # DATAST
    def datast : UInt8
      UInt8.new!((@value >> 8) & 0xff_u32)
    end

    # DATAST
    def self.datast : UInt8
      value.datast
    end

    # DATAST
    def self.datast=(value : UInt8) : UInt8
      self.set(datast: value)
      value
    end

    # ADDHLD
    def addhld : UInt8
      UInt8.new!((@value >> 4) & 0xf_u32)
    end

    # ADDHLD
    def self.addhld : UInt8
      value.addhld
    end

    # ADDHLD
    def self.addhld=(value : UInt8) : UInt8
      self.set(addhld: value)
      value
    end

    # ADDSET
    def addset : UInt8
      UInt8.new!((@value >> 0) & 0xf_u32)
    end

    # ADDSET
    def self.addset : UInt8
      value.addset
    end

    # ADDSET
    def self.addset=(value : UInt8) : UInt8
      self.set(addset: value)
      value
    end

    def copy_with(
      *,

      accmod : UInt8? = nil,

      datlat : UInt8? = nil,

      clkdiv : UInt8? = nil,

      datast : UInt8? = nil,

      addhld : UInt8? = nil,

      addset : UInt8? = nil
    ) : self
      value = @value

      unless accmod.nil?
        value = (value & 0xcfffffff_u32) |
                UInt32.new!(accmod.to_int).&(0x3_u32) << 28
      end

      unless datlat.nil?
        value = (value & 0xf0ffffff_u32) |
                UInt32.new!(datlat.to_int).&(0xf_u32) << 24
      end

      unless clkdiv.nil?
        value = (value & 0xff0fffff_u32) |
                UInt32.new!(clkdiv.to_int).&(0xf_u32) << 20
      end

      unless datast.nil?
        value = (value & 0xffff00ff_u32) |
                UInt32.new!(datast.to_int).&(0xff_u32) << 8
      end

      unless addhld.nil?
        value = (value & 0xffffff0f_u32) |
                UInt32.new!(addhld.to_int).&(0xf_u32) << 4
      end

      unless addset.nil?
        value = (value & 0xfffffff0_u32) |
                UInt32.new!(addset.to_int).&(0xf_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      accmod : UInt8? = nil,
      datlat : UInt8? = nil,
      clkdiv : UInt8? = nil,
      datast : UInt8? = nil,
      addhld : UInt8? = nil,
      addset : UInt8? = nil
    ) : Nil
      self.value = self.value.copy_with(
        accmod: accmod,
        datlat: datlat,
        clkdiv: clkdiv,
        datast: datast,
        addhld: addhld,
        addset: addset,
      )
    end
  end # struct

  # SRAM/NOR-Flash write timing registers          3
  struct BWTR3
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
      new(0xfffffff_u64)
    end

    def self.pointer : Pointer(UInt32)
      Pointer(UInt32).new(self.address)
    end

    def self.value : self
      value = self.pointer.load(volatile: true)
      new(value)
    end

    def self.value=(value : self) : self
      self.pointer.store(value.to_int, volatile: true)
      value
    end

    # ACCMOD
    def accmod : UInt8
      UInt8.new!((@value >> 28) & 0x3_u32)
    end

    # ACCMOD
    def self.accmod : UInt8
      value.accmod
    end

    # ACCMOD
    def self.accmod=(value : UInt8) : UInt8
      self.set(accmod: value)
      value
    end

    # DATLAT
    def datlat : UInt8
      UInt8.new!((@value >> 24) & 0xf_u32)
    end

    # DATLAT
    def self.datlat : UInt8
      value.datlat
    end

    # DATLAT
    def self.datlat=(value : UInt8) : UInt8
      self.set(datlat: value)
      value
    end

    # CLKDIV
    def clkdiv : UInt8
      UInt8.new!((@value >> 20) & 0xf_u32)
    end

    # CLKDIV
    def self.clkdiv : UInt8
      value.clkdiv
    end

    # CLKDIV
    def self.clkdiv=(value : UInt8) : UInt8
      self.set(clkdiv: value)
      value
    end

    # DATAST
    def datast : UInt8
      UInt8.new!((@value >> 8) & 0xff_u32)
    end

    # DATAST
    def self.datast : UInt8
      value.datast
    end

    # DATAST
    def self.datast=(value : UInt8) : UInt8
      self.set(datast: value)
      value
    end

    # ADDHLD
    def addhld : UInt8
      UInt8.new!((@value >> 4) & 0xf_u32)
    end

    # ADDHLD
    def self.addhld : UInt8
      value.addhld
    end

    # ADDHLD
    def self.addhld=(value : UInt8) : UInt8
      self.set(addhld: value)
      value
    end

    # ADDSET
    def addset : UInt8
      UInt8.new!((@value >> 0) & 0xf_u32)
    end

    # ADDSET
    def self.addset : UInt8
      value.addset
    end

    # ADDSET
    def self.addset=(value : UInt8) : UInt8
      self.set(addset: value)
      value
    end

    def copy_with(
      *,

      accmod : UInt8? = nil,

      datlat : UInt8? = nil,

      clkdiv : UInt8? = nil,

      datast : UInt8? = nil,

      addhld : UInt8? = nil,

      addset : UInt8? = nil
    ) : self
      value = @value

      unless accmod.nil?
        value = (value & 0xcfffffff_u32) |
                UInt32.new!(accmod.to_int).&(0x3_u32) << 28
      end

      unless datlat.nil?
        value = (value & 0xf0ffffff_u32) |
                UInt32.new!(datlat.to_int).&(0xf_u32) << 24
      end

      unless clkdiv.nil?
        value = (value & 0xff0fffff_u32) |
                UInt32.new!(clkdiv.to_int).&(0xf_u32) << 20
      end

      unless datast.nil?
        value = (value & 0xffff00ff_u32) |
                UInt32.new!(datast.to_int).&(0xff_u32) << 8
      end

      unless addhld.nil?
        value = (value & 0xffffff0f_u32) |
                UInt32.new!(addhld.to_int).&(0xf_u32) << 4
      end

      unless addset.nil?
        value = (value & 0xfffffff0_u32) |
                UInt32.new!(addset.to_int).&(0xf_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      accmod : UInt8? = nil,
      datlat : UInt8? = nil,
      clkdiv : UInt8? = nil,
      datast : UInt8? = nil,
      addhld : UInt8? = nil,
      addset : UInt8? = nil
    ) : Nil
      self.value = self.value.copy_with(
        accmod: accmod,
        datlat: datlat,
        clkdiv: clkdiv,
        datast: datast,
        addhld: addhld,
        addset: addset,
      )
    end
  end # struct

  # SRAM/NOR-Flash write timing registers          4
  struct BWTR4
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
      new(0xfffffff_u64)
    end

    def self.pointer : Pointer(UInt32)
      Pointer(UInt32).new(self.address)
    end

    def self.value : self
      value = self.pointer.load(volatile: true)
      new(value)
    end

    def self.value=(value : self) : self
      self.pointer.store(value.to_int, volatile: true)
      value
    end

    # ACCMOD
    def accmod : UInt8
      UInt8.new!((@value >> 28) & 0x3_u32)
    end

    # ACCMOD
    def self.accmod : UInt8
      value.accmod
    end

    # ACCMOD
    def self.accmod=(value : UInt8) : UInt8
      self.set(accmod: value)
      value
    end

    # DATLAT
    def datlat : UInt8
      UInt8.new!((@value >> 24) & 0xf_u32)
    end

    # DATLAT
    def self.datlat : UInt8
      value.datlat
    end

    # DATLAT
    def self.datlat=(value : UInt8) : UInt8
      self.set(datlat: value)
      value
    end

    # CLKDIV
    def clkdiv : UInt8
      UInt8.new!((@value >> 20) & 0xf_u32)
    end

    # CLKDIV
    def self.clkdiv : UInt8
      value.clkdiv
    end

    # CLKDIV
    def self.clkdiv=(value : UInt8) : UInt8
      self.set(clkdiv: value)
      value
    end

    # DATAST
    def datast : UInt8
      UInt8.new!((@value >> 8) & 0xff_u32)
    end

    # DATAST
    def self.datast : UInt8
      value.datast
    end

    # DATAST
    def self.datast=(value : UInt8) : UInt8
      self.set(datast: value)
      value
    end

    # ADDHLD
    def addhld : UInt8
      UInt8.new!((@value >> 4) & 0xf_u32)
    end

    # ADDHLD
    def self.addhld : UInt8
      value.addhld
    end

    # ADDHLD
    def self.addhld=(value : UInt8) : UInt8
      self.set(addhld: value)
      value
    end

    # ADDSET
    def addset : UInt8
      UInt8.new!((@value >> 0) & 0xf_u32)
    end

    # ADDSET
    def self.addset : UInt8
      value.addset
    end

    # ADDSET
    def self.addset=(value : UInt8) : UInt8
      self.set(addset: value)
      value
    end

    def copy_with(
      *,

      accmod : UInt8? = nil,

      datlat : UInt8? = nil,

      clkdiv : UInt8? = nil,

      datast : UInt8? = nil,

      addhld : UInt8? = nil,

      addset : UInt8? = nil
    ) : self
      value = @value

      unless accmod.nil?
        value = (value & 0xcfffffff_u32) |
                UInt32.new!(accmod.to_int).&(0x3_u32) << 28
      end

      unless datlat.nil?
        value = (value & 0xf0ffffff_u32) |
                UInt32.new!(datlat.to_int).&(0xf_u32) << 24
      end

      unless clkdiv.nil?
        value = (value & 0xff0fffff_u32) |
                UInt32.new!(clkdiv.to_int).&(0xf_u32) << 20
      end

      unless datast.nil?
        value = (value & 0xffff00ff_u32) |
                UInt32.new!(datast.to_int).&(0xff_u32) << 8
      end

      unless addhld.nil?
        value = (value & 0xffffff0f_u32) |
                UInt32.new!(addhld.to_int).&(0xf_u32) << 4
      end

      unless addset.nil?
        value = (value & 0xfffffff0_u32) |
                UInt32.new!(addset.to_int).&(0xf_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      accmod : UInt8? = nil,
      datlat : UInt8? = nil,
      clkdiv : UInt8? = nil,
      datast : UInt8? = nil,
      addhld : UInt8? = nil,
      addset : UInt8? = nil
    ) : Nil
      self.value = self.value.copy_with(
        accmod: accmod,
        datlat: datlat,
        clkdiv: clkdiv,
        datast: datast,
        addhld: addhld,
        addset: addset,
      )
    end
  end # struct

  # SDRAM Control Register 1
  struct SDCR1
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
      new(0x2d0_u64)
    end

    def self.pointer : Pointer(UInt32)
      Pointer(UInt32).new(self.address)
    end

    def self.value : self
      value = self.pointer.load(volatile: true)
      new(value)
    end

    def self.value=(value : self) : self
      self.pointer.store(value.to_int, volatile: true)
      value
    end

    # Number of column address              bits
    def nc : UInt8
      UInt8.new!((@value >> 0) & 0x3_u32)
    end

    # Number of column address              bits
    def self.nc : UInt8
      value.nc
    end

    # Number of column address              bits
    def self.nc=(value : UInt8) : UInt8
      self.set(nc: value)
      value
    end

    # Number of row address bits
    def nr : UInt8
      UInt8.new!((@value >> 2) & 0x3_u32)
    end

    # Number of row address bits
    def self.nr : UInt8
      value.nr
    end

    # Number of row address bits
    def self.nr=(value : UInt8) : UInt8
      self.set(nr: value)
      value
    end

    # Memory data bus width
    def mwid : UInt8
      UInt8.new!((@value >> 4) & 0x3_u32)
    end

    # Memory data bus width
    def self.mwid : UInt8
      value.mwid
    end

    # Memory data bus width
    def self.mwid=(value : UInt8) : UInt8
      self.set(mwid: value)
      value
    end

    # Number of internal banks
    def nb : Bool
      @value.bits_set?(0x40_u32)
    end

    # Number of internal banks
    def self.nb : Bool
      value.nb
    end

    # Number of internal banks
    def self.nb=(value : Bool) : Bool
      self.set(nb: value)
      value
    end

    # CAS latency
    def cas : UInt8
      UInt8.new!((@value >> 7) & 0x3_u32)
    end

    # CAS latency
    def self.cas : UInt8
      value.cas
    end

    # CAS latency
    def self.cas=(value : UInt8) : UInt8
      self.set(cas: value)
      value
    end

    # Write protection
    def wp : Bool
      @value.bits_set?(0x200_u32)
    end

    # Write protection
    def self.wp : Bool
      value.wp
    end

    # Write protection
    def self.wp=(value : Bool) : Bool
      self.set(wp: value)
      value
    end

    # SDRAM clock configuration
    def sdclk : UInt8
      UInt8.new!((@value >> 10) & 0x3_u32)
    end

    # SDRAM clock configuration
    def self.sdclk : UInt8
      value.sdclk
    end

    # SDRAM clock configuration
    def self.sdclk=(value : UInt8) : UInt8
      self.set(sdclk: value)
      value
    end

    # Burst read
    def rburst : Bool
      @value.bits_set?(0x1000_u32)
    end

    # Burst read
    def self.rburst : Bool
      value.rburst
    end

    # Burst read
    def self.rburst=(value : Bool) : Bool
      self.set(rburst: value)
      value
    end

    # Read pipe
    def rpipe : UInt8
      UInt8.new!((@value >> 13) & 0x3_u32)
    end

    # Read pipe
    def self.rpipe : UInt8
      value.rpipe
    end

    # Read pipe
    def self.rpipe=(value : UInt8) : UInt8
      self.set(rpipe: value)
      value
    end

    def copy_with(
      *,

      nc : UInt8? = nil,

      nr : UInt8? = nil,

      mwid : UInt8? = nil,

      nb : Bool? = nil,

      cas : UInt8? = nil,

      wp : Bool? = nil,

      sdclk : UInt8? = nil,

      rburst : Bool? = nil,

      rpipe : UInt8? = nil
    ) : self
      value = @value

      unless nc.nil?
        value = (value & 0xfffffffc_u32) |
                UInt32.new!(nc.to_int).&(0x3_u32) << 0
      end

      unless nr.nil?
        value = (value & 0xfffffff3_u32) |
                UInt32.new!(nr.to_int).&(0x3_u32) << 2
      end

      unless mwid.nil?
        value = (value & 0xffffffcf_u32) |
                UInt32.new!(mwid.to_int).&(0x3_u32) << 4
      end

      unless nb.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(nb.to_int).&(0x1_u32) << 6
      end

      unless cas.nil?
        value = (value & 0xfffffe7f_u32) |
                UInt32.new!(cas.to_int).&(0x3_u32) << 7
      end

      unless wp.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(wp.to_int).&(0x1_u32) << 9
      end

      unless sdclk.nil?
        value = (value & 0xfffff3ff_u32) |
                UInt32.new!(sdclk.to_int).&(0x3_u32) << 10
      end

      unless rburst.nil?
        value = (value & 0xffffefff_u32) |
                UInt32.new!(rburst.to_int).&(0x1_u32) << 12
      end

      unless rpipe.nil?
        value = (value & 0xffff9fff_u32) |
                UInt32.new!(rpipe.to_int).&(0x3_u32) << 13
      end

      self.class.new(value)
    end

    def self.set(
      *,
      nc : UInt8? = nil,
      nr : UInt8? = nil,
      mwid : UInt8? = nil,
      nb : Bool? = nil,
      cas : UInt8? = nil,
      wp : Bool? = nil,
      sdclk : UInt8? = nil,
      rburst : Bool? = nil,
      rpipe : UInt8? = nil
    ) : Nil
      self.value = self.value.copy_with(
        nc: nc,
        nr: nr,
        mwid: mwid,
        nb: nb,
        cas: cas,
        wp: wp,
        sdclk: sdclk,
        rburst: rburst,
        rpipe: rpipe,
      )
    end
  end # struct

  # SDRAM Control Register 2
  struct SDCR2
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
      new(0x2d0_u64)
    end

    def self.pointer : Pointer(UInt32)
      Pointer(UInt32).new(self.address)
    end

    def self.value : self
      value = self.pointer.load(volatile: true)
      new(value)
    end

    def self.value=(value : self) : self
      self.pointer.store(value.to_int, volatile: true)
      value
    end

    # Number of column address              bits
    def nc : UInt8
      UInt8.new!((@value >> 0) & 0x3_u32)
    end

    # Number of column address              bits
    def self.nc : UInt8
      value.nc
    end

    # Number of column address              bits
    def self.nc=(value : UInt8) : UInt8
      self.set(nc: value)
      value
    end

    # Number of row address bits
    def nr : UInt8
      UInt8.new!((@value >> 2) & 0x3_u32)
    end

    # Number of row address bits
    def self.nr : UInt8
      value.nr
    end

    # Number of row address bits
    def self.nr=(value : UInt8) : UInt8
      self.set(nr: value)
      value
    end

    # Memory data bus width
    def mwid : UInt8
      UInt8.new!((@value >> 4) & 0x3_u32)
    end

    # Memory data bus width
    def self.mwid : UInt8
      value.mwid
    end

    # Memory data bus width
    def self.mwid=(value : UInt8) : UInt8
      self.set(mwid: value)
      value
    end

    # Number of internal banks
    def nb : Bool
      @value.bits_set?(0x40_u32)
    end

    # Number of internal banks
    def self.nb : Bool
      value.nb
    end

    # Number of internal banks
    def self.nb=(value : Bool) : Bool
      self.set(nb: value)
      value
    end

    # CAS latency
    def cas : UInt8
      UInt8.new!((@value >> 7) & 0x3_u32)
    end

    # CAS latency
    def self.cas : UInt8
      value.cas
    end

    # CAS latency
    def self.cas=(value : UInt8) : UInt8
      self.set(cas: value)
      value
    end

    # Write protection
    def wp : Bool
      @value.bits_set?(0x200_u32)
    end

    # Write protection
    def self.wp : Bool
      value.wp
    end

    # Write protection
    def self.wp=(value : Bool) : Bool
      self.set(wp: value)
      value
    end

    # SDRAM clock configuration
    def sdclk : UInt8
      UInt8.new!((@value >> 10) & 0x3_u32)
    end

    # SDRAM clock configuration
    def self.sdclk : UInt8
      value.sdclk
    end

    # SDRAM clock configuration
    def self.sdclk=(value : UInt8) : UInt8
      self.set(sdclk: value)
      value
    end

    # Burst read
    def rburst : Bool
      @value.bits_set?(0x1000_u32)
    end

    # Burst read
    def self.rburst : Bool
      value.rburst
    end

    # Burst read
    def self.rburst=(value : Bool) : Bool
      self.set(rburst: value)
      value
    end

    # Read pipe
    def rpipe : UInt8
      UInt8.new!((@value >> 13) & 0x3_u32)
    end

    # Read pipe
    def self.rpipe : UInt8
      value.rpipe
    end

    # Read pipe
    def self.rpipe=(value : UInt8) : UInt8
      self.set(rpipe: value)
      value
    end

    def copy_with(
      *,

      nc : UInt8? = nil,

      nr : UInt8? = nil,

      mwid : UInt8? = nil,

      nb : Bool? = nil,

      cas : UInt8? = nil,

      wp : Bool? = nil,

      sdclk : UInt8? = nil,

      rburst : Bool? = nil,

      rpipe : UInt8? = nil
    ) : self
      value = @value

      unless nc.nil?
        value = (value & 0xfffffffc_u32) |
                UInt32.new!(nc.to_int).&(0x3_u32) << 0
      end

      unless nr.nil?
        value = (value & 0xfffffff3_u32) |
                UInt32.new!(nr.to_int).&(0x3_u32) << 2
      end

      unless mwid.nil?
        value = (value & 0xffffffcf_u32) |
                UInt32.new!(mwid.to_int).&(0x3_u32) << 4
      end

      unless nb.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(nb.to_int).&(0x1_u32) << 6
      end

      unless cas.nil?
        value = (value & 0xfffffe7f_u32) |
                UInt32.new!(cas.to_int).&(0x3_u32) << 7
      end

      unless wp.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(wp.to_int).&(0x1_u32) << 9
      end

      unless sdclk.nil?
        value = (value & 0xfffff3ff_u32) |
                UInt32.new!(sdclk.to_int).&(0x3_u32) << 10
      end

      unless rburst.nil?
        value = (value & 0xffffefff_u32) |
                UInt32.new!(rburst.to_int).&(0x1_u32) << 12
      end

      unless rpipe.nil?
        value = (value & 0xffff9fff_u32) |
                UInt32.new!(rpipe.to_int).&(0x3_u32) << 13
      end

      self.class.new(value)
    end

    def self.set(
      *,
      nc : UInt8? = nil,
      nr : UInt8? = nil,
      mwid : UInt8? = nil,
      nb : Bool? = nil,
      cas : UInt8? = nil,
      wp : Bool? = nil,
      sdclk : UInt8? = nil,
      rburst : Bool? = nil,
      rpipe : UInt8? = nil
    ) : Nil
      self.value = self.value.copy_with(
        nc: nc,
        nr: nr,
        mwid: mwid,
        nb: nb,
        cas: cas,
        wp: wp,
        sdclk: sdclk,
        rburst: rburst,
        rpipe: rpipe,
      )
    end
  end # struct

  # SDRAM Timing register 1
  struct SDTR1
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
      new(0xfffffff_u64)
    end

    def self.pointer : Pointer(UInt32)
      Pointer(UInt32).new(self.address)
    end

    def self.value : self
      value = self.pointer.load(volatile: true)
      new(value)
    end

    def self.value=(value : self) : self
      self.pointer.store(value.to_int, volatile: true)
      value
    end

    # Load Mode Register to              Active
    def tmrd : UInt8
      UInt8.new!((@value >> 0) & 0xf_u32)
    end

    # Load Mode Register to              Active
    def self.tmrd : UInt8
      value.tmrd
    end

    # Load Mode Register to              Active
    def self.tmrd=(value : UInt8) : UInt8
      self.set(tmrd: value)
      value
    end

    # Exit self-refresh delay
    def txsr : UInt8
      UInt8.new!((@value >> 4) & 0xf_u32)
    end

    # Exit self-refresh delay
    def self.txsr : UInt8
      value.txsr
    end

    # Exit self-refresh delay
    def self.txsr=(value : UInt8) : UInt8
      self.set(txsr: value)
      value
    end

    # Self refresh time
    def tras : UInt8
      UInt8.new!((@value >> 8) & 0xf_u32)
    end

    # Self refresh time
    def self.tras : UInt8
      value.tras
    end

    # Self refresh time
    def self.tras=(value : UInt8) : UInt8
      self.set(tras: value)
      value
    end

    # Row cycle delay
    def trc : UInt8
      UInt8.new!((@value >> 12) & 0xf_u32)
    end

    # Row cycle delay
    def self.trc : UInt8
      value.trc
    end

    # Row cycle delay
    def self.trc=(value : UInt8) : UInt8
      self.set(trc: value)
      value
    end

    # Recovery delay
    def twr : UInt8
      UInt8.new!((@value >> 16) & 0xf_u32)
    end

    # Recovery delay
    def self.twr : UInt8
      value.twr
    end

    # Recovery delay
    def self.twr=(value : UInt8) : UInt8
      self.set(twr: value)
      value
    end

    # Row precharge delay
    def trp : UInt8
      UInt8.new!((@value >> 20) & 0xf_u32)
    end

    # Row precharge delay
    def self.trp : UInt8
      value.trp
    end

    # Row precharge delay
    def self.trp=(value : UInt8) : UInt8
      self.set(trp: value)
      value
    end

    # Row to column delay
    def trcd : UInt8
      UInt8.new!((@value >> 24) & 0xf_u32)
    end

    # Row to column delay
    def self.trcd : UInt8
      value.trcd
    end

    # Row to column delay
    def self.trcd=(value : UInt8) : UInt8
      self.set(trcd: value)
      value
    end

    def copy_with(
      *,

      tmrd : UInt8? = nil,

      txsr : UInt8? = nil,

      tras : UInt8? = nil,

      trc : UInt8? = nil,

      twr : UInt8? = nil,

      trp : UInt8? = nil,

      trcd : UInt8? = nil
    ) : self
      value = @value

      unless tmrd.nil?
        value = (value & 0xfffffff0_u32) |
                UInt32.new!(tmrd.to_int).&(0xf_u32) << 0
      end

      unless txsr.nil?
        value = (value & 0xffffff0f_u32) |
                UInt32.new!(txsr.to_int).&(0xf_u32) << 4
      end

      unless tras.nil?
        value = (value & 0xfffff0ff_u32) |
                UInt32.new!(tras.to_int).&(0xf_u32) << 8
      end

      unless trc.nil?
        value = (value & 0xffff0fff_u32) |
                UInt32.new!(trc.to_int).&(0xf_u32) << 12
      end

      unless twr.nil?
        value = (value & 0xfff0ffff_u32) |
                UInt32.new!(twr.to_int).&(0xf_u32) << 16
      end

      unless trp.nil?
        value = (value & 0xff0fffff_u32) |
                UInt32.new!(trp.to_int).&(0xf_u32) << 20
      end

      unless trcd.nil?
        value = (value & 0xf0ffffff_u32) |
                UInt32.new!(trcd.to_int).&(0xf_u32) << 24
      end

      self.class.new(value)
    end

    def self.set(
      *,
      tmrd : UInt8? = nil,
      txsr : UInt8? = nil,
      tras : UInt8? = nil,
      trc : UInt8? = nil,
      twr : UInt8? = nil,
      trp : UInt8? = nil,
      trcd : UInt8? = nil
    ) : Nil
      self.value = self.value.copy_with(
        tmrd: tmrd,
        txsr: txsr,
        tras: tras,
        trc: trc,
        twr: twr,
        trp: trp,
        trcd: trcd,
      )
    end
  end # struct

  # SDRAM Timing register 2
  struct SDTR2
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
      new(0xfffffff_u64)
    end

    def self.pointer : Pointer(UInt32)
      Pointer(UInt32).new(self.address)
    end

    def self.value : self
      value = self.pointer.load(volatile: true)
      new(value)
    end

    def self.value=(value : self) : self
      self.pointer.store(value.to_int, volatile: true)
      value
    end

    # Load Mode Register to              Active
    def tmrd : UInt8
      UInt8.new!((@value >> 0) & 0xf_u32)
    end

    # Load Mode Register to              Active
    def self.tmrd : UInt8
      value.tmrd
    end

    # Load Mode Register to              Active
    def self.tmrd=(value : UInt8) : UInt8
      self.set(tmrd: value)
      value
    end

    # Exit self-refresh delay
    def txsr : UInt8
      UInt8.new!((@value >> 4) & 0xf_u32)
    end

    # Exit self-refresh delay
    def self.txsr : UInt8
      value.txsr
    end

    # Exit self-refresh delay
    def self.txsr=(value : UInt8) : UInt8
      self.set(txsr: value)
      value
    end

    # Self refresh time
    def tras : UInt8
      UInt8.new!((@value >> 8) & 0xf_u32)
    end

    # Self refresh time
    def self.tras : UInt8
      value.tras
    end

    # Self refresh time
    def self.tras=(value : UInt8) : UInt8
      self.set(tras: value)
      value
    end

    # Row cycle delay
    def trc : UInt8
      UInt8.new!((@value >> 12) & 0xf_u32)
    end

    # Row cycle delay
    def self.trc : UInt8
      value.trc
    end

    # Row cycle delay
    def self.trc=(value : UInt8) : UInt8
      self.set(trc: value)
      value
    end

    # Recovery delay
    def twr : UInt8
      UInt8.new!((@value >> 16) & 0xf_u32)
    end

    # Recovery delay
    def self.twr : UInt8
      value.twr
    end

    # Recovery delay
    def self.twr=(value : UInt8) : UInt8
      self.set(twr: value)
      value
    end

    # Row precharge delay
    def trp : UInt8
      UInt8.new!((@value >> 20) & 0xf_u32)
    end

    # Row precharge delay
    def self.trp : UInt8
      value.trp
    end

    # Row precharge delay
    def self.trp=(value : UInt8) : UInt8
      self.set(trp: value)
      value
    end

    # Row to column delay
    def trcd : UInt8
      UInt8.new!((@value >> 24) & 0xf_u32)
    end

    # Row to column delay
    def self.trcd : UInt8
      value.trcd
    end

    # Row to column delay
    def self.trcd=(value : UInt8) : UInt8
      self.set(trcd: value)
      value
    end

    def copy_with(
      *,

      tmrd : UInt8? = nil,

      txsr : UInt8? = nil,

      tras : UInt8? = nil,

      trc : UInt8? = nil,

      twr : UInt8? = nil,

      trp : UInt8? = nil,

      trcd : UInt8? = nil
    ) : self
      value = @value

      unless tmrd.nil?
        value = (value & 0xfffffff0_u32) |
                UInt32.new!(tmrd.to_int).&(0xf_u32) << 0
      end

      unless txsr.nil?
        value = (value & 0xffffff0f_u32) |
                UInt32.new!(txsr.to_int).&(0xf_u32) << 4
      end

      unless tras.nil?
        value = (value & 0xfffff0ff_u32) |
                UInt32.new!(tras.to_int).&(0xf_u32) << 8
      end

      unless trc.nil?
        value = (value & 0xffff0fff_u32) |
                UInt32.new!(trc.to_int).&(0xf_u32) << 12
      end

      unless twr.nil?
        value = (value & 0xfff0ffff_u32) |
                UInt32.new!(twr.to_int).&(0xf_u32) << 16
      end

      unless trp.nil?
        value = (value & 0xff0fffff_u32) |
                UInt32.new!(trp.to_int).&(0xf_u32) << 20
      end

      unless trcd.nil?
        value = (value & 0xf0ffffff_u32) |
                UInt32.new!(trcd.to_int).&(0xf_u32) << 24
      end

      self.class.new(value)
    end

    def self.set(
      *,
      tmrd : UInt8? = nil,
      txsr : UInt8? = nil,
      tras : UInt8? = nil,
      trc : UInt8? = nil,
      twr : UInt8? = nil,
      trp : UInt8? = nil,
      trcd : UInt8? = nil
    ) : Nil
      self.value = self.value.copy_with(
        tmrd: tmrd,
        txsr: txsr,
        tras: tras,
        trc: trc,
        twr: twr,
        trp: trp,
        trcd: trcd,
      )
    end
  end # struct

  # SDRAM Command Mode register
  struct SDCMR
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

    # Command mode
    def self.mode=(value : UInt8) : UInt8
      self.set(mode: value)
      value
    end

    # Command target bank 2
    def self.ctb2=(value : Bool) : Bool
      self.set(ctb2: value)
      value
    end

    # Command target bank 1
    def self.ctb1=(value : Bool) : Bool
      self.set(ctb1: value)
      value
    end

    # Number of Auto-refresh
    def nrfs : UInt8
      UInt8.new!((@value >> 5) & 0xf_u32)
    end

    # Number of Auto-refresh
    def self.nrfs : UInt8
      value.nrfs
    end

    # Number of Auto-refresh
    def self.nrfs=(value : UInt8) : UInt8
      self.set(nrfs: value)
      value
    end

    # Mode Register definition
    def mrd : UInt16
      UInt16.new!((@value >> 9) & 0x1fff_u32)
    end

    # Mode Register definition
    def self.mrd : UInt16
      value.mrd
    end

    # Mode Register definition
    def self.mrd=(value : UInt16) : UInt16
      self.set(mrd: value)
      value
    end

    def copy_with(
      *,

      mode : UInt8? = nil,

      ctb2 : Bool? = nil,

      ctb1 : Bool? = nil,

      nrfs : UInt8? = nil,

      mrd : UInt16? = nil
    ) : self
      value = @value

      unless mode.nil?
        value = (value & 0xfffffff8_u32) |
                UInt32.new!(mode.to_int).&(0x7_u32) << 0
      end

      unless ctb2.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(ctb2.to_int).&(0x1_u32) << 3
      end

      unless ctb1.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(ctb1.to_int).&(0x1_u32) << 4
      end

      unless nrfs.nil?
        value = (value & 0xfffffe1f_u32) |
                UInt32.new!(nrfs.to_int).&(0xf_u32) << 5
      end

      unless mrd.nil?
        value = (value & 0xffc001ff_u32) |
                UInt32.new!(mrd.to_int).&(0x1fff_u32) << 9
      end

      self.class.new(value)
    end

    def self.set(
      *,
      mode : UInt8? = nil,
      ctb2 : Bool? = nil,
      ctb1 : Bool? = nil,
      nrfs : UInt8? = nil,
      mrd : UInt16? = nil
    ) : Nil
      self.value = self.value.copy_with(
        mode: mode,
        ctb2: ctb2,
        ctb1: ctb1,
        nrfs: nrfs,
        mrd: mrd,
      )
    end
  end # struct

  # SDRAM Refresh Timer register
  struct SDRTR
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

    # Clear Refresh error flag
    def self.cre=(value : Bool) : Bool
      self.set(cre: value)
      value
    end

    # Refresh Timer Count
    def count : UInt16
      UInt16.new!((@value >> 1) & 0x1fff_u32)
    end

    # Refresh Timer Count
    def self.count : UInt16
      value.count
    end

    # Refresh Timer Count
    def self.count=(value : UInt16) : UInt16
      self.set(count: value)
      value
    end

    # RES Interrupt Enable
    def reie : Bool
      @value.bits_set?(0x4000_u32)
    end

    # RES Interrupt Enable
    def self.reie : Bool
      value.reie
    end

    # RES Interrupt Enable
    def self.reie=(value : Bool) : Bool
      self.set(reie: value)
      value
    end

    def copy_with(
      *,

      cre : Bool? = nil,

      count : UInt16? = nil,

      reie : Bool? = nil
    ) : self
      value = @value

      unless cre.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(cre.to_int).&(0x1_u32) << 0
      end

      unless count.nil?
        value = (value & 0xffffc001_u32) |
                UInt32.new!(count.to_int).&(0x1fff_u32) << 1
      end

      unless reie.nil?
        value = (value & 0xffffbfff_u32) |
                UInt32.new!(reie.to_int).&(0x1_u32) << 14
      end

      self.class.new(value)
    end

    def self.set(
      *,
      cre : Bool? = nil,
      count : UInt16? = nil,
      reie : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        cre: cre,
        count: count,
        reie: reie,
      )
    end
  end # struct

  # SDRAM Status register
  struct SDSR
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

    # Refresh error flag
    def re : Bool
      @value.bits_set?(0x1_u32)
    end

    # Refresh error flag
    def self.re : Bool
      value.re
    end

    # Status Mode for Bank 1
    def modes1 : UInt8
      UInt8.new!((@value >> 1) & 0x3_u32)
    end

    # Status Mode for Bank 1
    def self.modes1 : UInt8
      value.modes1
    end

    # Status Mode for Bank 2
    def modes2 : UInt8
      UInt8.new!((@value >> 3) & 0x3_u32)
    end

    # Status Mode for Bank 2
    def self.modes2 : UInt8
      value.modes2
    end

    # Busy status
    def busy : Bool
      @value.bits_set?(0x20_u32)
    end

    # Busy status
    def self.busy : Bool
      value.busy
    end
  end # struct

end
