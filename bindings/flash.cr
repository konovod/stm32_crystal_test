# FLASH
module FLASH
  VERSION      = nil
  BASE_ADDRESS = 0x40023c00_u64

  # Flash access control register
  struct ACR
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

    # Latency
    def latency : UInt8
      UInt8.new!((@value >> 0) & 0x7_u32)
    end

    # Latency
    def self.latency : UInt8
      value.latency
    end

    # Latency
    def self.latency=(value : UInt8) : UInt8
      self.set(latency: value)
      value
    end

    # Prefetch enable
    def prften : Bool
      @value.bits_set?(0x100_u32)
    end

    # Prefetch enable
    def self.prften : Bool
      value.prften
    end

    # Prefetch enable
    def self.prften=(value : Bool) : Bool
      self.set(prften: value)
      value
    end

    # Instruction cache enable
    def icen : Bool
      @value.bits_set?(0x200_u32)
    end

    # Instruction cache enable
    def self.icen : Bool
      value.icen
    end

    # Instruction cache enable
    def self.icen=(value : Bool) : Bool
      self.set(icen: value)
      value
    end

    # Data cache enable
    def dcen : Bool
      @value.bits_set?(0x400_u32)
    end

    # Data cache enable
    def self.dcen : Bool
      value.dcen
    end

    # Data cache enable
    def self.dcen=(value : Bool) : Bool
      self.set(dcen: value)
      value
    end

    # Instruction cache reset
    def self.icrst=(value : Bool) : Bool
      self.set(icrst: value)
      value
    end

    # Data cache reset
    def dcrst : Bool
      @value.bits_set?(0x1000_u32)
    end

    # Data cache reset
    def self.dcrst : Bool
      value.dcrst
    end

    # Data cache reset
    def self.dcrst=(value : Bool) : Bool
      self.set(dcrst: value)
      value
    end

    def copy_with(
      *,

      latency : UInt8? = nil,

      prften : Bool? = nil,

      icen : Bool? = nil,

      dcen : Bool? = nil,

      icrst : Bool? = nil,

      dcrst : Bool? = nil
    ) : self
      value = @value

      unless latency.nil?
        value = (value & 0xfffffff8_u32) |
                UInt32.new!(latency.to_int).&(0x7_u32) << 0
      end

      unless prften.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(prften.to_int).&(0x1_u32) << 8
      end

      unless icen.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(icen.to_int).&(0x1_u32) << 9
      end

      unless dcen.nil?
        value = (value & 0xfffffbff_u32) |
                UInt32.new!(dcen.to_int).&(0x1_u32) << 10
      end

      unless icrst.nil?
        value = (value & 0xfffff7ff_u32) |
                UInt32.new!(icrst.to_int).&(0x1_u32) << 11
      end

      unless dcrst.nil?
        value = (value & 0xffffefff_u32) |
                UInt32.new!(dcrst.to_int).&(0x1_u32) << 12
      end

      self.class.new(value)
    end

    def self.set(
      *,
      latency : UInt8? = nil,
      prften : Bool? = nil,
      icen : Bool? = nil,
      dcen : Bool? = nil,
      icrst : Bool? = nil,
      dcrst : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        latency: latency,
        prften: prften,
        icen: icen,
        dcen: dcen,
        icrst: icrst,
        dcrst: dcrst,
      )
    end
  end # struct

  # Flash key register
  struct KEYR
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

    # FPEC key
    def self.key=(value : UInt32) : UInt32
      self.set(key: value)
      value
    end

    def copy_with(
      *,

      key : UInt32? = nil
    ) : self
      value = @value

      unless key.nil?
        value = (value & 0xffffffff_u32) |
                UInt32.new!(key.to_int).&(0x0_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      key : UInt32? = nil
    ) : Nil
      self.value = self.value.copy_with(
        key: key,
      )
    end
  end # struct

  # Flash option key register
  struct OPTKEYR
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

    # Option byte key
    def self.optkey=(value : UInt32) : UInt32
      self.set(optkey: value)
      value
    end

    def copy_with(
      *,

      optkey : UInt32? = nil
    ) : self
      value = @value

      unless optkey.nil?
        value = (value & 0xffffffff_u32) |
                UInt32.new!(optkey.to_int).&(0x0_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      optkey : UInt32? = nil
    ) : Nil
      self.value = self.value.copy_with(
        optkey: optkey,
      )
    end
  end # struct

  # Status register
  struct SR
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

    # End of operation
    def eop : Bool
      @value.bits_set?(0x1_u32)
    end

    # End of operation
    def self.eop : Bool
      value.eop
    end

    # End of operation
    def self.eop=(value : Bool) : Bool
      self.set(eop: value)
      value
    end

    # Operation error
    def operr : Bool
      @value.bits_set?(0x2_u32)
    end

    # Operation error
    def self.operr : Bool
      value.operr
    end

    # Operation error
    def self.operr=(value : Bool) : Bool
      self.set(operr: value)
      value
    end

    # Write protection error
    def wrperr : Bool
      @value.bits_set?(0x10_u32)
    end

    # Write protection error
    def self.wrperr : Bool
      value.wrperr
    end

    # Write protection error
    def self.wrperr=(value : Bool) : Bool
      self.set(wrperr: value)
      value
    end

    # Programming alignment              error
    def pgaerr : Bool
      @value.bits_set?(0x20_u32)
    end

    # Programming alignment              error
    def self.pgaerr : Bool
      value.pgaerr
    end

    # Programming alignment              error
    def self.pgaerr=(value : Bool) : Bool
      self.set(pgaerr: value)
      value
    end

    # Programming parallelism              error
    def pgperr : Bool
      @value.bits_set?(0x40_u32)
    end

    # Programming parallelism              error
    def self.pgperr : Bool
      value.pgperr
    end

    # Programming parallelism              error
    def self.pgperr=(value : Bool) : Bool
      self.set(pgperr: value)
      value
    end

    # Programming sequence error
    def pgserr : Bool
      @value.bits_set?(0x80_u32)
    end

    # Programming sequence error
    def self.pgserr : Bool
      value.pgserr
    end

    # Programming sequence error
    def self.pgserr=(value : Bool) : Bool
      self.set(pgserr: value)
      value
    end

    # Busy
    def bsy : Bool
      @value.bits_set?(0x10000_u32)
    end

    # Busy
    def self.bsy : Bool
      value.bsy
    end

    def copy_with(
      *,

      eop : Bool? = nil,

      operr : Bool? = nil,

      wrperr : Bool? = nil,

      pgaerr : Bool? = nil,

      pgperr : Bool? = nil,

      pgserr : Bool? = nil
    ) : self
      value = @value

      unless eop.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(eop.to_int).&(0x1_u32) << 0
      end

      unless operr.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(operr.to_int).&(0x1_u32) << 1
      end

      unless wrperr.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(wrperr.to_int).&(0x1_u32) << 4
      end

      unless pgaerr.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(pgaerr.to_int).&(0x1_u32) << 5
      end

      unless pgperr.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(pgperr.to_int).&(0x1_u32) << 6
      end

      unless pgserr.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(pgserr.to_int).&(0x1_u32) << 7
      end

      self.class.new(value)
    end

    def self.set(
      *,
      eop : Bool? = nil,
      operr : Bool? = nil,
      wrperr : Bool? = nil,
      pgaerr : Bool? = nil,
      pgperr : Bool? = nil,
      pgserr : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        eop: eop,
        operr: operr,
        wrperr: wrperr,
        pgaerr: pgaerr,
        pgperr: pgperr,
        pgserr: pgserr,
      )
    end
  end # struct

  # Control register
  struct CR
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
      new(0x80000000_u64)
    end

    def self.pointer : Pointer(UInt32)
      Pointer(UInt32).new(self.address)
    end

    def self.value : self
      value = self.pointer.load(volatile: true)
      new(value)
    end

    def self.value=(value : self) : self
      self.pointer.store(value.to_int, volatile: true)
      value
    end

    # Programming
    def pg : Bool
      @value.bits_set?(0x1_u32)
    end

    # Programming
    def self.pg : Bool
      value.pg
    end

    # Programming
    def self.pg=(value : Bool) : Bool
      self.set(pg: value)
      value
    end

    # Sector Erase
    def ser : Bool
      @value.bits_set?(0x2_u32)
    end

    # Sector Erase
    def self.ser : Bool
      value.ser
    end

    # Sector Erase
    def self.ser=(value : Bool) : Bool
      self.set(ser: value)
      value
    end

    # Mass Erase of sectors 0 to              11
    def mer : Bool
      @value.bits_set?(0x4_u32)
    end

    # Mass Erase of sectors 0 to              11
    def self.mer : Bool
      value.mer
    end

    # Mass Erase of sectors 0 to              11
    def self.mer=(value : Bool) : Bool
      self.set(mer: value)
      value
    end

    # Sector number
    def snb : UInt8
      UInt8.new!((@value >> 3) & 0x1f_u32)
    end

    # Sector number
    def self.snb : UInt8
      value.snb
    end

    # Sector number
    def self.snb=(value : UInt8) : UInt8
      self.set(snb: value)
      value
    end

    # Program size
    def psize : UInt8
      UInt8.new!((@value >> 8) & 0x3_u32)
    end

    # Program size
    def self.psize : UInt8
      value.psize
    end

    # Program size
    def self.psize=(value : UInt8) : UInt8
      self.set(psize: value)
      value
    end

    # Mass Erase of sectors 12 to              23
    def mer1 : Bool
      @value.bits_set?(0x8000_u32)
    end

    # Mass Erase of sectors 12 to              23
    def self.mer1 : Bool
      value.mer1
    end

    # Mass Erase of sectors 12 to              23
    def self.mer1=(value : Bool) : Bool
      self.set(mer1: value)
      value
    end

    # Start
    def strt : Bool
      @value.bits_set?(0x10000_u32)
    end

    # Start
    def self.strt : Bool
      value.strt
    end

    # Start
    def self.strt=(value : Bool) : Bool
      self.set(strt: value)
      value
    end

    # End of operation interrupt              enable
    def eopie : Bool
      @value.bits_set?(0x1000000_u32)
    end

    # End of operation interrupt              enable
    def self.eopie : Bool
      value.eopie
    end

    # End of operation interrupt              enable
    def self.eopie=(value : Bool) : Bool
      self.set(eopie: value)
      value
    end

    # Error interrupt enable
    def errie : Bool
      @value.bits_set?(0x2000000_u32)
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

    # Lock
    def lock : Bool
      @value.bits_set?(0x80000000_u32)
    end

    # Lock
    def self.lock : Bool
      value.lock
    end

    # Lock
    def self.lock=(value : Bool) : Bool
      self.set(lock: value)
      value
    end

    def copy_with(
      *,

      pg : Bool? = nil,

      ser : Bool? = nil,

      mer : Bool? = nil,

      snb : UInt8? = nil,

      psize : UInt8? = nil,

      mer1 : Bool? = nil,

      strt : Bool? = nil,

      eopie : Bool? = nil,

      errie : Bool? = nil,

      lock : Bool? = nil
    ) : self
      value = @value

      unless pg.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(pg.to_int).&(0x1_u32) << 0
      end

      unless ser.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(ser.to_int).&(0x1_u32) << 1
      end

      unless mer.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(mer.to_int).&(0x1_u32) << 2
      end

      unless snb.nil?
        value = (value & 0xffffff07_u32) |
                UInt32.new!(snb.to_int).&(0x1f_u32) << 3
      end

      unless psize.nil?
        value = (value & 0xfffffcff_u32) |
                UInt32.new!(psize.to_int).&(0x3_u32) << 8
      end

      unless mer1.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(mer1.to_int).&(0x1_u32) << 15
      end

      unless strt.nil?
        value = (value & 0xfffeffff_u32) |
                UInt32.new!(strt.to_int).&(0x1_u32) << 16
      end

      unless eopie.nil?
        value = (value & 0xfeffffff_u32) |
                UInt32.new!(eopie.to_int).&(0x1_u32) << 24
      end

      unless errie.nil?
        value = (value & 0xfdffffff_u32) |
                UInt32.new!(errie.to_int).&(0x1_u32) << 25
      end

      unless lock.nil?
        value = (value & 0x7fffffff_u32) |
                UInt32.new!(lock.to_int).&(0x1_u32) << 31
      end

      self.class.new(value)
    end

    def self.set(
      *,
      pg : Bool? = nil,
      ser : Bool? = nil,
      mer : Bool? = nil,
      snb : UInt8? = nil,
      psize : UInt8? = nil,
      mer1 : Bool? = nil,
      strt : Bool? = nil,
      eopie : Bool? = nil,
      errie : Bool? = nil,
      lock : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        pg: pg,
        ser: ser,
        mer: mer,
        snb: snb,
        psize: psize,
        mer1: mer1,
        strt: strt,
        eopie: eopie,
        errie: errie,
        lock: lock,
      )
    end
  end # struct

  # Flash option control register
  struct OPTCR
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
      new(0xfffaaed_u64)
    end

    def self.pointer : Pointer(UInt32)
      Pointer(UInt32).new(self.address)
    end

    def self.value : self
      value = self.pointer.load(volatile: true)
      new(value)
    end

    def self.value=(value : self) : self
      self.pointer.store(value.to_int, volatile: true)
      value
    end

    # Option lock
    def optlock : Bool
      @value.bits_set?(0x1_u32)
    end

    # Option lock
    def self.optlock : Bool
      value.optlock
    end

    # Option lock
    def self.optlock=(value : Bool) : Bool
      self.set(optlock: value)
      value
    end

    # Option start
    def optstrt : Bool
      @value.bits_set?(0x2_u32)
    end

    # Option start
    def self.optstrt : Bool
      value.optstrt
    end

    # Option start
    def self.optstrt=(value : Bool) : Bool
      self.set(optstrt: value)
      value
    end

    # BOR reset Level
    def bor_lev : UInt8
      UInt8.new!((@value >> 2) & 0x3_u32)
    end

    # BOR reset Level
    def self.bor_lev : UInt8
      value.bor_lev
    end

    # BOR reset Level
    def self.bor_lev=(value : UInt8) : UInt8
      self.set(bor_lev: value)
      value
    end

    # WDG_SW User option bytes
    def wdg_sw : Bool
      @value.bits_set?(0x20_u32)
    end

    # WDG_SW User option bytes
    def self.wdg_sw : Bool
      value.wdg_sw
    end

    # WDG_SW User option bytes
    def self.wdg_sw=(value : Bool) : Bool
      self.set(wdg_sw: value)
      value
    end

    # nRST_STOP User option              bytes
    def n_rst_stop : Bool
      @value.bits_set?(0x40_u32)
    end

    # nRST_STOP User option              bytes
    def self.n_rst_stop : Bool
      value.n_rst_stop
    end

    # nRST_STOP User option              bytes
    def self.n_rst_stop=(value : Bool) : Bool
      self.set(n_rst_stop: value)
      value
    end

    # nRST_STDBY User option              bytes
    def n_rst_stdby : Bool
      @value.bits_set?(0x80_u32)
    end

    # nRST_STDBY User option              bytes
    def self.n_rst_stdby : Bool
      value.n_rst_stdby
    end

    # nRST_STDBY User option              bytes
    def self.n_rst_stdby=(value : Bool) : Bool
      self.set(n_rst_stdby: value)
      value
    end

    # Read protect
    def rdp : UInt8
      UInt8.new!((@value >> 8) & 0xff_u32)
    end

    # Read protect
    def self.rdp : UInt8
      value.rdp
    end

    # Read protect
    def self.rdp=(value : UInt8) : UInt8
      self.set(rdp: value)
      value
    end

    # Not write protect
    def n_wrp : UInt16
      UInt16.new!((@value >> 16) & 0xfff_u32)
    end

    # Not write protect
    def self.n_wrp : UInt16
      value.n_wrp
    end

    # Not write protect
    def self.n_wrp=(value : UInt16) : UInt16
      self.set(n_wrp: value)
      value
    end

    def copy_with(
      *,

      optlock : Bool? = nil,

      optstrt : Bool? = nil,

      bor_lev : UInt8? = nil,

      wdg_sw : Bool? = nil,

      n_rst_stop : Bool? = nil,

      n_rst_stdby : Bool? = nil,

      rdp : UInt8? = nil,

      n_wrp : UInt16? = nil
    ) : self
      value = @value

      unless optlock.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(optlock.to_int).&(0x1_u32) << 0
      end

      unless optstrt.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(optstrt.to_int).&(0x1_u32) << 1
      end

      unless bor_lev.nil?
        value = (value & 0xfffffff3_u32) |
                UInt32.new!(bor_lev.to_int).&(0x3_u32) << 2
      end

      unless wdg_sw.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(wdg_sw.to_int).&(0x1_u32) << 5
      end

      unless n_rst_stop.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(n_rst_stop.to_int).&(0x1_u32) << 6
      end

      unless n_rst_stdby.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(n_rst_stdby.to_int).&(0x1_u32) << 7
      end

      unless rdp.nil?
        value = (value & 0xffff00ff_u32) |
                UInt32.new!(rdp.to_int).&(0xff_u32) << 8
      end

      unless n_wrp.nil?
        value = (value & 0xf000ffff_u32) |
                UInt32.new!(n_wrp.to_int).&(0xfff_u32) << 16
      end

      self.class.new(value)
    end

    def self.set(
      *,
      optlock : Bool? = nil,
      optstrt : Bool? = nil,
      bor_lev : UInt8? = nil,
      wdg_sw : Bool? = nil,
      n_rst_stop : Bool? = nil,
      n_rst_stdby : Bool? = nil,
      rdp : UInt8? = nil,
      n_wrp : UInt16? = nil
    ) : Nil
      self.value = self.value.copy_with(
        optlock: optlock,
        optstrt: optstrt,
        bor_lev: bor_lev,
        wdg_sw: wdg_sw,
        n_rst_stop: n_rst_stop,
        n_rst_stdby: n_rst_stdby,
        rdp: rdp,
        n_wrp: n_wrp,
      )
    end
  end # struct

  # Flash option control register          1
  struct OPTCR1
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
      new(0xfff0000_u64)
    end

    def self.pointer : Pointer(UInt32)
      Pointer(UInt32).new(self.address)
    end

    def self.value : self
      value = self.pointer.load(volatile: true)
      new(value)
    end

    def self.value=(value : self) : self
      self.pointer.store(value.to_int, volatile: true)
      value
    end

    # Not write protect
    def n_wrp : UInt16
      UInt16.new!((@value >> 16) & 0xfff_u32)
    end

    # Not write protect
    def self.n_wrp : UInt16
      value.n_wrp
    end

    # Not write protect
    def self.n_wrp=(value : UInt16) : UInt16
      self.set(n_wrp: value)
      value
    end

    def copy_with(
      *,

      n_wrp : UInt16? = nil
    ) : self
      value = @value

      unless n_wrp.nil?
        value = (value & 0xf000ffff_u32) |
                UInt32.new!(n_wrp.to_int).&(0xfff_u32) << 16
      end

      self.class.new(value)
    end

    def self.set(
      *,
      n_wrp : UInt16? = nil
    ) : Nil
      self.value = self.value.copy_with(
        n_wrp: n_wrp,
      )
    end
  end # struct

end
