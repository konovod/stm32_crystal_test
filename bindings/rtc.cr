# Real-time clock
module RTC
  VERSION      = nil
  BASE_ADDRESS = 0x40002800_u64

  # time register
  struct TR
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

    # AM/PM notation
    def pm : Bool
      @value.bits_set?(0x400000_u32)
    end

    # AM/PM notation
    def self.pm : Bool
      value.pm
    end

    # AM/PM notation
    def self.pm=(value : Bool) : Bool
      self.set(pm: value)
      value
    end

    # Hour tens in BCD format
    def ht : UInt8
      UInt8.new!((@value >> 20) & 0x3_u32)
    end

    # Hour tens in BCD format
    def self.ht : UInt8
      value.ht
    end

    # Hour tens in BCD format
    def self.ht=(value : UInt8) : UInt8
      self.set(ht: value)
      value
    end

    # Hour units in BCD format
    def hu : UInt8
      UInt8.new!((@value >> 16) & 0xf_u32)
    end

    # Hour units in BCD format
    def self.hu : UInt8
      value.hu
    end

    # Hour units in BCD format
    def self.hu=(value : UInt8) : UInt8
      self.set(hu: value)
      value
    end

    # Minute tens in BCD format
    def mnt : UInt8
      UInt8.new!((@value >> 12) & 0x7_u32)
    end

    # Minute tens in BCD format
    def self.mnt : UInt8
      value.mnt
    end

    # Minute tens in BCD format
    def self.mnt=(value : UInt8) : UInt8
      self.set(mnt: value)
      value
    end

    # Minute units in BCD format
    def mnu : UInt8
      UInt8.new!((@value >> 8) & 0xf_u32)
    end

    # Minute units in BCD format
    def self.mnu : UInt8
      value.mnu
    end

    # Minute units in BCD format
    def self.mnu=(value : UInt8) : UInt8
      self.set(mnu: value)
      value
    end

    # Second tens in BCD format
    def st : UInt8
      UInt8.new!((@value >> 4) & 0x7_u32)
    end

    # Second tens in BCD format
    def self.st : UInt8
      value.st
    end

    # Second tens in BCD format
    def self.st=(value : UInt8) : UInt8
      self.set(st: value)
      value
    end

    # Second units in BCD format
    def su : UInt8
      UInt8.new!((@value >> 0) & 0xf_u32)
    end

    # Second units in BCD format
    def self.su : UInt8
      value.su
    end

    # Second units in BCD format
    def self.su=(value : UInt8) : UInt8
      self.set(su: value)
      value
    end

    def copy_with(
      *,

      pm : Bool? = nil,

      ht : UInt8? = nil,

      hu : UInt8? = nil,

      mnt : UInt8? = nil,

      mnu : UInt8? = nil,

      st : UInt8? = nil,

      su : UInt8? = nil
    ) : self
      value = @value

      unless pm.nil?
        value = (value & 0xffbfffff_u32) |
                UInt32.new!(pm.to_int).&(0x1_u32) << 22
      end

      unless ht.nil?
        value = (value & 0xffcfffff_u32) |
                UInt32.new!(ht.to_int).&(0x3_u32) << 20
      end

      unless hu.nil?
        value = (value & 0xfff0ffff_u32) |
                UInt32.new!(hu.to_int).&(0xf_u32) << 16
      end

      unless mnt.nil?
        value = (value & 0xffff8fff_u32) |
                UInt32.new!(mnt.to_int).&(0x7_u32) << 12
      end

      unless mnu.nil?
        value = (value & 0xfffff0ff_u32) |
                UInt32.new!(mnu.to_int).&(0xf_u32) << 8
      end

      unless st.nil?
        value = (value & 0xffffff8f_u32) |
                UInt32.new!(st.to_int).&(0x7_u32) << 4
      end

      unless su.nil?
        value = (value & 0xfffffff0_u32) |
                UInt32.new!(su.to_int).&(0xf_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      pm : Bool? = nil,
      ht : UInt8? = nil,
      hu : UInt8? = nil,
      mnt : UInt8? = nil,
      mnu : UInt8? = nil,
      st : UInt8? = nil,
      su : UInt8? = nil
    ) : Nil
      self.value = self.value.copy_with(
        pm: pm,
        ht: ht,
        hu: hu,
        mnt: mnt,
        mnu: mnu,
        st: st,
        su: su,
      )
    end
  end # struct

  # date register
  struct DR
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
      new(0x2101_u64)
    end

    def self.pointer : Pointer(UInt32)
      Pointer(UInt32).new(self.address)
    end

    def self.value : self
      value = self.pointer.load(volatile: true)
      new(value)
    end

    def self.value=(value : self) : self
      self.pointer.store(value.to_int, volatile: true)
      value
    end

    # Year tens in BCD format
    def yt : UInt8
      UInt8.new!((@value >> 20) & 0xf_u32)
    end

    # Year tens in BCD format
    def self.yt : UInt8
      value.yt
    end

    # Year tens in BCD format
    def self.yt=(value : UInt8) : UInt8
      self.set(yt: value)
      value
    end

    # Year units in BCD format
    def yu : UInt8
      UInt8.new!((@value >> 16) & 0xf_u32)
    end

    # Year units in BCD format
    def self.yu : UInt8
      value.yu
    end

    # Year units in BCD format
    def self.yu=(value : UInt8) : UInt8
      self.set(yu: value)
      value
    end

    # Week day units
    def wdu : UInt8
      UInt8.new!((@value >> 13) & 0x7_u32)
    end

    # Week day units
    def self.wdu : UInt8
      value.wdu
    end

    # Week day units
    def self.wdu=(value : UInt8) : UInt8
      self.set(wdu: value)
      value
    end

    # Month tens in BCD format
    def mt : Bool
      @value.bits_set?(0x1000_u32)
    end

    # Month tens in BCD format
    def self.mt : Bool
      value.mt
    end

    # Month tens in BCD format
    def self.mt=(value : Bool) : Bool
      self.set(mt: value)
      value
    end

    # Month units in BCD format
    def mu : UInt8
      UInt8.new!((@value >> 8) & 0xf_u32)
    end

    # Month units in BCD format
    def self.mu : UInt8
      value.mu
    end

    # Month units in BCD format
    def self.mu=(value : UInt8) : UInt8
      self.set(mu: value)
      value
    end

    # Date tens in BCD format
    def dt : UInt8
      UInt8.new!((@value >> 4) & 0x3_u32)
    end

    # Date tens in BCD format
    def self.dt : UInt8
      value.dt
    end

    # Date tens in BCD format
    def self.dt=(value : UInt8) : UInt8
      self.set(dt: value)
      value
    end

    # Date units in BCD format
    def du : UInt8
      UInt8.new!((@value >> 0) & 0xf_u32)
    end

    # Date units in BCD format
    def self.du : UInt8
      value.du
    end

    # Date units in BCD format
    def self.du=(value : UInt8) : UInt8
      self.set(du: value)
      value
    end

    def copy_with(
      *,

      yt : UInt8? = nil,

      yu : UInt8? = nil,

      wdu : UInt8? = nil,

      mt : Bool? = nil,

      mu : UInt8? = nil,

      dt : UInt8? = nil,

      du : UInt8? = nil
    ) : self
      value = @value

      unless yt.nil?
        value = (value & 0xff0fffff_u32) |
                UInt32.new!(yt.to_int).&(0xf_u32) << 20
      end

      unless yu.nil?
        value = (value & 0xfff0ffff_u32) |
                UInt32.new!(yu.to_int).&(0xf_u32) << 16
      end

      unless wdu.nil?
        value = (value & 0xffff1fff_u32) |
                UInt32.new!(wdu.to_int).&(0x7_u32) << 13
      end

      unless mt.nil?
        value = (value & 0xffffefff_u32) |
                UInt32.new!(mt.to_int).&(0x1_u32) << 12
      end

      unless mu.nil?
        value = (value & 0xfffff0ff_u32) |
                UInt32.new!(mu.to_int).&(0xf_u32) << 8
      end

      unless dt.nil?
        value = (value & 0xffffffcf_u32) |
                UInt32.new!(dt.to_int).&(0x3_u32) << 4
      end

      unless du.nil?
        value = (value & 0xfffffff0_u32) |
                UInt32.new!(du.to_int).&(0xf_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      yt : UInt8? = nil,
      yu : UInt8? = nil,
      wdu : UInt8? = nil,
      mt : Bool? = nil,
      mu : UInt8? = nil,
      dt : UInt8? = nil,
      du : UInt8? = nil
    ) : Nil
      self.value = self.value.copy_with(
        yt: yt,
        yu: yu,
        wdu: wdu,
        mt: mt,
        mu: mu,
        dt: dt,
        du: du,
      )
    end
  end # struct

  # control register
  struct CR
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

    # Calibration output enable
    def coe : Bool
      @value.bits_set?(0x800000_u32)
    end

    # Calibration output enable
    def self.coe : Bool
      value.coe
    end

    # Calibration output enable
    def self.coe=(value : Bool) : Bool
      self.set(coe: value)
      value
    end

    # Output selection
    def osel : UInt8
      UInt8.new!((@value >> 21) & 0x3_u32)
    end

    # Output selection
    def self.osel : UInt8
      value.osel
    end

    # Output selection
    def self.osel=(value : UInt8) : UInt8
      self.set(osel: value)
      value
    end

    # Output polarity
    def pol : Bool
      @value.bits_set?(0x100000_u32)
    end

    # Output polarity
    def self.pol : Bool
      value.pol
    end

    # Output polarity
    def self.pol=(value : Bool) : Bool
      self.set(pol: value)
      value
    end

    # Backup
    def bkp : Bool
      @value.bits_set?(0x40000_u32)
    end

    # Backup
    def self.bkp : Bool
      value.bkp
    end

    # Backup
    def self.bkp=(value : Bool) : Bool
      self.set(bkp: value)
      value
    end

    # Subtract 1 hour (winter time              change)
    def sub1_h : Bool
      @value.bits_set?(0x20000_u32)
    end

    # Subtract 1 hour (winter time              change)
    def self.sub1_h : Bool
      value.sub1_h
    end

    # Subtract 1 hour (winter time              change)
    def self.sub1_h=(value : Bool) : Bool
      self.set(sub1_h: value)
      value
    end

    # Add 1 hour (summer time              change)
    def add1_h : Bool
      @value.bits_set?(0x10000_u32)
    end

    # Add 1 hour (summer time              change)
    def self.add1_h : Bool
      value.add1_h
    end

    # Add 1 hour (summer time              change)
    def self.add1_h=(value : Bool) : Bool
      self.set(add1_h: value)
      value
    end

    # Time-stamp interrupt              enable
    def tsie : Bool
      @value.bits_set?(0x8000_u32)
    end

    # Time-stamp interrupt              enable
    def self.tsie : Bool
      value.tsie
    end

    # Time-stamp interrupt              enable
    def self.tsie=(value : Bool) : Bool
      self.set(tsie: value)
      value
    end

    # Wakeup timer interrupt              enable
    def wutie : Bool
      @value.bits_set?(0x4000_u32)
    end

    # Wakeup timer interrupt              enable
    def self.wutie : Bool
      value.wutie
    end

    # Wakeup timer interrupt              enable
    def self.wutie=(value : Bool) : Bool
      self.set(wutie: value)
      value
    end

    # Alarm B interrupt enable
    def alrbie : Bool
      @value.bits_set?(0x2000_u32)
    end

    # Alarm B interrupt enable
    def self.alrbie : Bool
      value.alrbie
    end

    # Alarm B interrupt enable
    def self.alrbie=(value : Bool) : Bool
      self.set(alrbie: value)
      value
    end

    # Alarm A interrupt enable
    def alraie : Bool
      @value.bits_set?(0x1000_u32)
    end

    # Alarm A interrupt enable
    def self.alraie : Bool
      value.alraie
    end

    # Alarm A interrupt enable
    def self.alraie=(value : Bool) : Bool
      self.set(alraie: value)
      value
    end

    # Time stamp enable
    def tse : Bool
      @value.bits_set?(0x800_u32)
    end

    # Time stamp enable
    def self.tse : Bool
      value.tse
    end

    # Time stamp enable
    def self.tse=(value : Bool) : Bool
      self.set(tse: value)
      value
    end

    # Wakeup timer enable
    def wute : Bool
      @value.bits_set?(0x400_u32)
    end

    # Wakeup timer enable
    def self.wute : Bool
      value.wute
    end

    # Wakeup timer enable
    def self.wute=(value : Bool) : Bool
      self.set(wute: value)
      value
    end

    # Alarm B enable
    def alrbe : Bool
      @value.bits_set?(0x200_u32)
    end

    # Alarm B enable
    def self.alrbe : Bool
      value.alrbe
    end

    # Alarm B enable
    def self.alrbe=(value : Bool) : Bool
      self.set(alrbe: value)
      value
    end

    # Alarm A enable
    def alrae : Bool
      @value.bits_set?(0x100_u32)
    end

    # Alarm A enable
    def self.alrae : Bool
      value.alrae
    end

    # Alarm A enable
    def self.alrae=(value : Bool) : Bool
      self.set(alrae: value)
      value
    end

    # Coarse digital calibration              enable
    def dce : Bool
      @value.bits_set?(0x80_u32)
    end

    # Coarse digital calibration              enable
    def self.dce : Bool
      value.dce
    end

    # Coarse digital calibration              enable
    def self.dce=(value : Bool) : Bool
      self.set(dce: value)
      value
    end

    # Hour format
    def fmt : Bool
      @value.bits_set?(0x40_u32)
    end

    # Hour format
    def self.fmt : Bool
      value.fmt
    end

    # Hour format
    def self.fmt=(value : Bool) : Bool
      self.set(fmt: value)
      value
    end

    # Reference clock detection enable (50 or              60 Hz)
    def refckon : Bool
      @value.bits_set?(0x10_u32)
    end

    # Reference clock detection enable (50 or              60 Hz)
    def self.refckon : Bool
      value.refckon
    end

    # Reference clock detection enable (50 or              60 Hz)
    def self.refckon=(value : Bool) : Bool
      self.set(refckon: value)
      value
    end

    # Time-stamp event active              edge
    def tsedge : Bool
      @value.bits_set?(0x8_u32)
    end

    # Time-stamp event active              edge
    def self.tsedge : Bool
      value.tsedge
    end

    # Time-stamp event active              edge
    def self.tsedge=(value : Bool) : Bool
      self.set(tsedge: value)
      value
    end

    # Wakeup clock selection
    def wcksel : UInt8
      UInt8.new!((@value >> 0) & 0x7_u32)
    end

    # Wakeup clock selection
    def self.wcksel : UInt8
      value.wcksel
    end

    # Wakeup clock selection
    def self.wcksel=(value : UInt8) : UInt8
      self.set(wcksel: value)
      value
    end

    def copy_with(
      *,

      coe : Bool? = nil,

      osel : UInt8? = nil,

      pol : Bool? = nil,

      bkp : Bool? = nil,

      sub1_h : Bool? = nil,

      add1_h : Bool? = nil,

      tsie : Bool? = nil,

      wutie : Bool? = nil,

      alrbie : Bool? = nil,

      alraie : Bool? = nil,

      tse : Bool? = nil,

      wute : Bool? = nil,

      alrbe : Bool? = nil,

      alrae : Bool? = nil,

      dce : Bool? = nil,

      fmt : Bool? = nil,

      refckon : Bool? = nil,

      tsedge : Bool? = nil,

      wcksel : UInt8? = nil
    ) : self
      value = @value

      unless coe.nil?
        value = (value & 0xff7fffff_u32) |
                UInt32.new!(coe.to_int).&(0x1_u32) << 23
      end

      unless osel.nil?
        value = (value & 0xff9fffff_u32) |
                UInt32.new!(osel.to_int).&(0x3_u32) << 21
      end

      unless pol.nil?
        value = (value & 0xffefffff_u32) |
                UInt32.new!(pol.to_int).&(0x1_u32) << 20
      end

      unless bkp.nil?
        value = (value & 0xfffbffff_u32) |
                UInt32.new!(bkp.to_int).&(0x1_u32) << 18
      end

      unless sub1_h.nil?
        value = (value & 0xfffdffff_u32) |
                UInt32.new!(sub1_h.to_int).&(0x1_u32) << 17
      end

      unless add1_h.nil?
        value = (value & 0xfffeffff_u32) |
                UInt32.new!(add1_h.to_int).&(0x1_u32) << 16
      end

      unless tsie.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(tsie.to_int).&(0x1_u32) << 15
      end

      unless wutie.nil?
        value = (value & 0xffffbfff_u32) |
                UInt32.new!(wutie.to_int).&(0x1_u32) << 14
      end

      unless alrbie.nil?
        value = (value & 0xffffdfff_u32) |
                UInt32.new!(alrbie.to_int).&(0x1_u32) << 13
      end

      unless alraie.nil?
        value = (value & 0xffffefff_u32) |
                UInt32.new!(alraie.to_int).&(0x1_u32) << 12
      end

      unless tse.nil?
        value = (value & 0xfffff7ff_u32) |
                UInt32.new!(tse.to_int).&(0x1_u32) << 11
      end

      unless wute.nil?
        value = (value & 0xfffffbff_u32) |
                UInt32.new!(wute.to_int).&(0x1_u32) << 10
      end

      unless alrbe.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(alrbe.to_int).&(0x1_u32) << 9
      end

      unless alrae.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(alrae.to_int).&(0x1_u32) << 8
      end

      unless dce.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(dce.to_int).&(0x1_u32) << 7
      end

      unless fmt.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(fmt.to_int).&(0x1_u32) << 6
      end

      unless refckon.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(refckon.to_int).&(0x1_u32) << 4
      end

      unless tsedge.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(tsedge.to_int).&(0x1_u32) << 3
      end

      unless wcksel.nil?
        value = (value & 0xfffffff8_u32) |
                UInt32.new!(wcksel.to_int).&(0x7_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      coe : Bool? = nil,
      osel : UInt8? = nil,
      pol : Bool? = nil,
      bkp : Bool? = nil,
      sub1_h : Bool? = nil,
      add1_h : Bool? = nil,
      tsie : Bool? = nil,
      wutie : Bool? = nil,
      alrbie : Bool? = nil,
      alraie : Bool? = nil,
      tse : Bool? = nil,
      wute : Bool? = nil,
      alrbe : Bool? = nil,
      alrae : Bool? = nil,
      dce : Bool? = nil,
      fmt : Bool? = nil,
      refckon : Bool? = nil,
      tsedge : Bool? = nil,
      wcksel : UInt8? = nil
    ) : Nil
      self.value = self.value.copy_with(
        coe: coe,
        osel: osel,
        pol: pol,
        bkp: bkp,
        sub1_h: sub1_h,
        add1_h: add1_h,
        tsie: tsie,
        wutie: wutie,
        alrbie: alrbie,
        alraie: alraie,
        tse: tse,
        wute: wute,
        alrbe: alrbe,
        alrae: alrae,
        dce: dce,
        fmt: fmt,
        refckon: refckon,
        tsedge: tsedge,
        wcksel: wcksel,
      )
    end
  end # struct

  # initialization and status          register
  struct ISR
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

    # Alarm A write flag
    def alrawf : Bool
      @value.bits_set?(0x1_u32)
    end

    # Alarm A write flag
    def self.alrawf : Bool
      value.alrawf
    end

    # Alarm B write flag
    def alrbwf : Bool
      @value.bits_set?(0x2_u32)
    end

    # Alarm B write flag
    def self.alrbwf : Bool
      value.alrbwf
    end

    # Wakeup timer write flag
    def wutwf : Bool
      @value.bits_set?(0x4_u32)
    end

    # Wakeup timer write flag
    def self.wutwf : Bool
      value.wutwf
    end

    # Shift operation pending
    def shpf : Bool
      @value.bits_set?(0x8_u32)
    end

    # Shift operation pending
    def self.shpf : Bool
      value.shpf
    end

    # Shift operation pending
    def self.shpf=(value : Bool) : Bool
      self.set(shpf: value)
      value
    end

    # Initialization status flag
    def inits : Bool
      @value.bits_set?(0x10_u32)
    end

    # Initialization status flag
    def self.inits : Bool
      value.inits
    end

    # Registers synchronization              flag
    def rsf : Bool
      @value.bits_set?(0x20_u32)
    end

    # Registers synchronization              flag
    def self.rsf : Bool
      value.rsf
    end

    # Registers synchronization              flag
    def self.rsf=(value : Bool) : Bool
      self.set(rsf: value)
      value
    end

    # Initialization flag
    def initf : Bool
      @value.bits_set?(0x40_u32)
    end

    # Initialization flag
    def self.initf : Bool
      value.initf
    end

    # Initialization mode
    def init : Bool
      @value.bits_set?(0x80_u32)
    end

    # Initialization mode
    def self.init : Bool
      value.init
    end

    # Initialization mode
    def self.init=(value : Bool) : Bool
      self.set(init: value)
      value
    end

    # Alarm A flag
    def alraf : Bool
      @value.bits_set?(0x100_u32)
    end

    # Alarm A flag
    def self.alraf : Bool
      value.alraf
    end

    # Alarm A flag
    def self.alraf=(value : Bool) : Bool
      self.set(alraf: value)
      value
    end

    # Alarm B flag
    def alrbf : Bool
      @value.bits_set?(0x200_u32)
    end

    # Alarm B flag
    def self.alrbf : Bool
      value.alrbf
    end

    # Alarm B flag
    def self.alrbf=(value : Bool) : Bool
      self.set(alrbf: value)
      value
    end

    # Wakeup timer flag
    def wutf : Bool
      @value.bits_set?(0x400_u32)
    end

    # Wakeup timer flag
    def self.wutf : Bool
      value.wutf
    end

    # Wakeup timer flag
    def self.wutf=(value : Bool) : Bool
      self.set(wutf: value)
      value
    end

    # Time-stamp flag
    def tsf : Bool
      @value.bits_set?(0x800_u32)
    end

    # Time-stamp flag
    def self.tsf : Bool
      value.tsf
    end

    # Time-stamp flag
    def self.tsf=(value : Bool) : Bool
      self.set(tsf: value)
      value
    end

    # Time-stamp overflow flag
    def tsovf : Bool
      @value.bits_set?(0x1000_u32)
    end

    # Time-stamp overflow flag
    def self.tsovf : Bool
      value.tsovf
    end

    # Time-stamp overflow flag
    def self.tsovf=(value : Bool) : Bool
      self.set(tsovf: value)
      value
    end

    # Tamper detection flag
    def tamp1_f : Bool
      @value.bits_set?(0x2000_u32)
    end

    # Tamper detection flag
    def self.tamp1_f : Bool
      value.tamp1_f
    end

    # Tamper detection flag
    def self.tamp1_f=(value : Bool) : Bool
      self.set(tamp1_f: value)
      value
    end

    # TAMPER2 detection flag
    def tamp2_f : Bool
      @value.bits_set?(0x4000_u32)
    end

    # TAMPER2 detection flag
    def self.tamp2_f : Bool
      value.tamp2_f
    end

    # TAMPER2 detection flag
    def self.tamp2_f=(value : Bool) : Bool
      self.set(tamp2_f: value)
      value
    end

    # Recalibration pending Flag
    def recalpf : Bool
      @value.bits_set?(0x10000_u32)
    end

    # Recalibration pending Flag
    def self.recalpf : Bool
      value.recalpf
    end

    def copy_with(
      *,

      shpf : Bool? = nil,

      rsf : Bool? = nil,

      init : Bool? = nil,

      alraf : Bool? = nil,

      alrbf : Bool? = nil,

      wutf : Bool? = nil,

      tsf : Bool? = nil,

      tsovf : Bool? = nil,

      tamp1_f : Bool? = nil,

      tamp2_f : Bool? = nil
    ) : self
      value = @value

      unless shpf.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(shpf.to_int).&(0x1_u32) << 3
      end

      unless rsf.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(rsf.to_int).&(0x1_u32) << 5
      end

      unless init.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(init.to_int).&(0x1_u32) << 7
      end

      unless alraf.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(alraf.to_int).&(0x1_u32) << 8
      end

      unless alrbf.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(alrbf.to_int).&(0x1_u32) << 9
      end

      unless wutf.nil?
        value = (value & 0xfffffbff_u32) |
                UInt32.new!(wutf.to_int).&(0x1_u32) << 10
      end

      unless tsf.nil?
        value = (value & 0xfffff7ff_u32) |
                UInt32.new!(tsf.to_int).&(0x1_u32) << 11
      end

      unless tsovf.nil?
        value = (value & 0xffffefff_u32) |
                UInt32.new!(tsovf.to_int).&(0x1_u32) << 12
      end

      unless tamp1_f.nil?
        value = (value & 0xffffdfff_u32) |
                UInt32.new!(tamp1_f.to_int).&(0x1_u32) << 13
      end

      unless tamp2_f.nil?
        value = (value & 0xffffbfff_u32) |
                UInt32.new!(tamp2_f.to_int).&(0x1_u32) << 14
      end

      self.class.new(value)
    end

    def self.set(
      *,
      shpf : Bool? = nil,
      rsf : Bool? = nil,
      init : Bool? = nil,
      alraf : Bool? = nil,
      alrbf : Bool? = nil,
      wutf : Bool? = nil,
      tsf : Bool? = nil,
      tsovf : Bool? = nil,
      tamp1_f : Bool? = nil,
      tamp2_f : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        shpf: shpf,
        rsf: rsf,
        init: init,
        alraf: alraf,
        alrbf: alrbf,
        wutf: wutf,
        tsf: tsf,
        tsovf: tsovf,
        tamp1_f: tamp1_f,
        tamp2_f: tamp2_f,
      )
    end
  end # struct

  # prescaler register
  struct PRER
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
      new(0x7f00ff_u64)
    end

    def self.pointer : Pointer(UInt32)
      Pointer(UInt32).new(self.address)
    end

    def self.value : self
      value = self.pointer.load(volatile: true)
      new(value)
    end

    def self.value=(value : self) : self
      self.pointer.store(value.to_int, volatile: true)
      value
    end

    # Asynchronous prescaler              factor
    def prediv_a : UInt8
      UInt8.new!((@value >> 16) & 0x7f_u32)
    end

    # Asynchronous prescaler              factor
    def self.prediv_a : UInt8
      value.prediv_a
    end

    # Asynchronous prescaler              factor
    def self.prediv_a=(value : UInt8) : UInt8
      self.set(prediv_a: value)
      value
    end

    # Synchronous prescaler              factor
    def prediv_s : UInt16
      UInt16.new!((@value >> 0) & 0x7fff_u32)
    end

    # Synchronous prescaler              factor
    def self.prediv_s : UInt16
      value.prediv_s
    end

    # Synchronous prescaler              factor
    def self.prediv_s=(value : UInt16) : UInt16
      self.set(prediv_s: value)
      value
    end

    def copy_with(
      *,

      prediv_a : UInt8? = nil,

      prediv_s : UInt16? = nil
    ) : self
      value = @value

      unless prediv_a.nil?
        value = (value & 0xff80ffff_u32) |
                UInt32.new!(prediv_a.to_int).&(0x7f_u32) << 16
      end

      unless prediv_s.nil?
        value = (value & 0xffff8000_u32) |
                UInt32.new!(prediv_s.to_int).&(0x7fff_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      prediv_a : UInt8? = nil,
      prediv_s : UInt16? = nil
    ) : Nil
      self.value = self.value.copy_with(
        prediv_a: prediv_a,
        prediv_s: prediv_s,
      )
    end
  end # struct

  # wakeup timer register
  struct WUTR
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

    # Wakeup auto-reload value              bits
    def wut : UInt16
      UInt16.new!((@value >> 0) & 0xffff_u32)
    end

    # Wakeup auto-reload value              bits
    def self.wut : UInt16
      value.wut
    end

    # Wakeup auto-reload value              bits
    def self.wut=(value : UInt16) : UInt16
      self.set(wut: value)
      value
    end

    def copy_with(
      *,

      wut : UInt16? = nil
    ) : self
      value = @value

      unless wut.nil?
        value = (value & 0xffff0000_u32) |
                UInt32.new!(wut.to_int).&(0xffff_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      wut : UInt16? = nil
    ) : Nil
      self.value = self.value.copy_with(
        wut: wut,
      )
    end
  end # struct

  # calibration register
  struct CALIBR
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

    # Digital calibration sign
    def dcs : Bool
      @value.bits_set?(0x80_u32)
    end

    # Digital calibration sign
    def self.dcs : Bool
      value.dcs
    end

    # Digital calibration sign
    def self.dcs=(value : Bool) : Bool
      self.set(dcs: value)
      value
    end

    # Digital calibration
    def dc : UInt8
      UInt8.new!((@value >> 0) & 0x1f_u32)
    end

    # Digital calibration
    def self.dc : UInt8
      value.dc
    end

    # Digital calibration
    def self.dc=(value : UInt8) : UInt8
      self.set(dc: value)
      value
    end

    def copy_with(
      *,

      dcs : Bool? = nil,

      dc : UInt8? = nil
    ) : self
      value = @value

      unless dcs.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(dcs.to_int).&(0x1_u32) << 7
      end

      unless dc.nil?
        value = (value & 0xffffffe0_u32) |
                UInt32.new!(dc.to_int).&(0x1f_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      dcs : Bool? = nil,
      dc : UInt8? = nil
    ) : Nil
      self.value = self.value.copy_with(
        dcs: dcs,
        dc: dc,
      )
    end
  end # struct

  # alarm A register
  struct ALRMAR
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

    # Alarm A date mask
    def msk4 : Bool
      @value.bits_set?(0x80000000_u32)
    end

    # Alarm A date mask
    def self.msk4 : Bool
      value.msk4
    end

    # Alarm A date mask
    def self.msk4=(value : Bool) : Bool
      self.set(msk4: value)
      value
    end

    # Week day selection
    def wdsel : Bool
      @value.bits_set?(0x40000000_u32)
    end

    # Week day selection
    def self.wdsel : Bool
      value.wdsel
    end

    # Week day selection
    def self.wdsel=(value : Bool) : Bool
      self.set(wdsel: value)
      value
    end

    # Date tens in BCD format
    def dt : UInt8
      UInt8.new!((@value >> 28) & 0x3_u32)
    end

    # Date tens in BCD format
    def self.dt : UInt8
      value.dt
    end

    # Date tens in BCD format
    def self.dt=(value : UInt8) : UInt8
      self.set(dt: value)
      value
    end

    # Date units or day in BCD              format
    def du : UInt8
      UInt8.new!((@value >> 24) & 0xf_u32)
    end

    # Date units or day in BCD              format
    def self.du : UInt8
      value.du
    end

    # Date units or day in BCD              format
    def self.du=(value : UInt8) : UInt8
      self.set(du: value)
      value
    end

    # Alarm A hours mask
    def msk3 : Bool
      @value.bits_set?(0x800000_u32)
    end

    # Alarm A hours mask
    def self.msk3 : Bool
      value.msk3
    end

    # Alarm A hours mask
    def self.msk3=(value : Bool) : Bool
      self.set(msk3: value)
      value
    end

    # AM/PM notation
    def pm : Bool
      @value.bits_set?(0x400000_u32)
    end

    # AM/PM notation
    def self.pm : Bool
      value.pm
    end

    # AM/PM notation
    def self.pm=(value : Bool) : Bool
      self.set(pm: value)
      value
    end

    # Hour tens in BCD format
    def ht : UInt8
      UInt8.new!((@value >> 20) & 0x3_u32)
    end

    # Hour tens in BCD format
    def self.ht : UInt8
      value.ht
    end

    # Hour tens in BCD format
    def self.ht=(value : UInt8) : UInt8
      self.set(ht: value)
      value
    end

    # Hour units in BCD format
    def hu : UInt8
      UInt8.new!((@value >> 16) & 0xf_u32)
    end

    # Hour units in BCD format
    def self.hu : UInt8
      value.hu
    end

    # Hour units in BCD format
    def self.hu=(value : UInt8) : UInt8
      self.set(hu: value)
      value
    end

    # Alarm A minutes mask
    def msk2 : Bool
      @value.bits_set?(0x8000_u32)
    end

    # Alarm A minutes mask
    def self.msk2 : Bool
      value.msk2
    end

    # Alarm A minutes mask
    def self.msk2=(value : Bool) : Bool
      self.set(msk2: value)
      value
    end

    # Minute tens in BCD format
    def mnt : UInt8
      UInt8.new!((@value >> 12) & 0x7_u32)
    end

    # Minute tens in BCD format
    def self.mnt : UInt8
      value.mnt
    end

    # Minute tens in BCD format
    def self.mnt=(value : UInt8) : UInt8
      self.set(mnt: value)
      value
    end

    # Minute units in BCD format
    def mnu : UInt8
      UInt8.new!((@value >> 8) & 0xf_u32)
    end

    # Minute units in BCD format
    def self.mnu : UInt8
      value.mnu
    end

    # Minute units in BCD format
    def self.mnu=(value : UInt8) : UInt8
      self.set(mnu: value)
      value
    end

    # Alarm A seconds mask
    def msk1 : Bool
      @value.bits_set?(0x80_u32)
    end

    # Alarm A seconds mask
    def self.msk1 : Bool
      value.msk1
    end

    # Alarm A seconds mask
    def self.msk1=(value : Bool) : Bool
      self.set(msk1: value)
      value
    end

    # Second tens in BCD format
    def st : UInt8
      UInt8.new!((@value >> 4) & 0x7_u32)
    end

    # Second tens in BCD format
    def self.st : UInt8
      value.st
    end

    # Second tens in BCD format
    def self.st=(value : UInt8) : UInt8
      self.set(st: value)
      value
    end

    # Second units in BCD format
    def su : UInt8
      UInt8.new!((@value >> 0) & 0xf_u32)
    end

    # Second units in BCD format
    def self.su : UInt8
      value.su
    end

    # Second units in BCD format
    def self.su=(value : UInt8) : UInt8
      self.set(su: value)
      value
    end

    def copy_with(
      *,

      msk4 : Bool? = nil,

      wdsel : Bool? = nil,

      dt : UInt8? = nil,

      du : UInt8? = nil,

      msk3 : Bool? = nil,

      pm : Bool? = nil,

      ht : UInt8? = nil,

      hu : UInt8? = nil,

      msk2 : Bool? = nil,

      mnt : UInt8? = nil,

      mnu : UInt8? = nil,

      msk1 : Bool? = nil,

      st : UInt8? = nil,

      su : UInt8? = nil
    ) : self
      value = @value

      unless msk4.nil?
        value = (value & 0x7fffffff_u32) |
                UInt32.new!(msk4.to_int).&(0x1_u32) << 31
      end

      unless wdsel.nil?
        value = (value & 0xbfffffff_u32) |
                UInt32.new!(wdsel.to_int).&(0x1_u32) << 30
      end

      unless dt.nil?
        value = (value & 0xcfffffff_u32) |
                UInt32.new!(dt.to_int).&(0x3_u32) << 28
      end

      unless du.nil?
        value = (value & 0xf0ffffff_u32) |
                UInt32.new!(du.to_int).&(0xf_u32) << 24
      end

      unless msk3.nil?
        value = (value & 0xff7fffff_u32) |
                UInt32.new!(msk3.to_int).&(0x1_u32) << 23
      end

      unless pm.nil?
        value = (value & 0xffbfffff_u32) |
                UInt32.new!(pm.to_int).&(0x1_u32) << 22
      end

      unless ht.nil?
        value = (value & 0xffcfffff_u32) |
                UInt32.new!(ht.to_int).&(0x3_u32) << 20
      end

      unless hu.nil?
        value = (value & 0xfff0ffff_u32) |
                UInt32.new!(hu.to_int).&(0xf_u32) << 16
      end

      unless msk2.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(msk2.to_int).&(0x1_u32) << 15
      end

      unless mnt.nil?
        value = (value & 0xffff8fff_u32) |
                UInt32.new!(mnt.to_int).&(0x7_u32) << 12
      end

      unless mnu.nil?
        value = (value & 0xfffff0ff_u32) |
                UInt32.new!(mnu.to_int).&(0xf_u32) << 8
      end

      unless msk1.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(msk1.to_int).&(0x1_u32) << 7
      end

      unless st.nil?
        value = (value & 0xffffff8f_u32) |
                UInt32.new!(st.to_int).&(0x7_u32) << 4
      end

      unless su.nil?
        value = (value & 0xfffffff0_u32) |
                UInt32.new!(su.to_int).&(0xf_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      msk4 : Bool? = nil,
      wdsel : Bool? = nil,
      dt : UInt8? = nil,
      du : UInt8? = nil,
      msk3 : Bool? = nil,
      pm : Bool? = nil,
      ht : UInt8? = nil,
      hu : UInt8? = nil,
      msk2 : Bool? = nil,
      mnt : UInt8? = nil,
      mnu : UInt8? = nil,
      msk1 : Bool? = nil,
      st : UInt8? = nil,
      su : UInt8? = nil
    ) : Nil
      self.value = self.value.copy_with(
        msk4: msk4,
        wdsel: wdsel,
        dt: dt,
        du: du,
        msk3: msk3,
        pm: pm,
        ht: ht,
        hu: hu,
        msk2: msk2,
        mnt: mnt,
        mnu: mnu,
        msk1: msk1,
        st: st,
        su: su,
      )
    end
  end # struct

  # alarm B register
  struct ALRMBR
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

    # Alarm B date mask
    def msk4 : Bool
      @value.bits_set?(0x80000000_u32)
    end

    # Alarm B date mask
    def self.msk4 : Bool
      value.msk4
    end

    # Alarm B date mask
    def self.msk4=(value : Bool) : Bool
      self.set(msk4: value)
      value
    end

    # Week day selection
    def wdsel : Bool
      @value.bits_set?(0x40000000_u32)
    end

    # Week day selection
    def self.wdsel : Bool
      value.wdsel
    end

    # Week day selection
    def self.wdsel=(value : Bool) : Bool
      self.set(wdsel: value)
      value
    end

    # Date tens in BCD format
    def dt : UInt8
      UInt8.new!((@value >> 28) & 0x3_u32)
    end

    # Date tens in BCD format
    def self.dt : UInt8
      value.dt
    end

    # Date tens in BCD format
    def self.dt=(value : UInt8) : UInt8
      self.set(dt: value)
      value
    end

    # Date units or day in BCD              format
    def du : UInt8
      UInt8.new!((@value >> 24) & 0xf_u32)
    end

    # Date units or day in BCD              format
    def self.du : UInt8
      value.du
    end

    # Date units or day in BCD              format
    def self.du=(value : UInt8) : UInt8
      self.set(du: value)
      value
    end

    # Alarm B hours mask
    def msk3 : Bool
      @value.bits_set?(0x800000_u32)
    end

    # Alarm B hours mask
    def self.msk3 : Bool
      value.msk3
    end

    # Alarm B hours mask
    def self.msk3=(value : Bool) : Bool
      self.set(msk3: value)
      value
    end

    # AM/PM notation
    def pm : Bool
      @value.bits_set?(0x400000_u32)
    end

    # AM/PM notation
    def self.pm : Bool
      value.pm
    end

    # AM/PM notation
    def self.pm=(value : Bool) : Bool
      self.set(pm: value)
      value
    end

    # Hour tens in BCD format
    def ht : UInt8
      UInt8.new!((@value >> 20) & 0x3_u32)
    end

    # Hour tens in BCD format
    def self.ht : UInt8
      value.ht
    end

    # Hour tens in BCD format
    def self.ht=(value : UInt8) : UInt8
      self.set(ht: value)
      value
    end

    # Hour units in BCD format
    def hu : UInt8
      UInt8.new!((@value >> 16) & 0xf_u32)
    end

    # Hour units in BCD format
    def self.hu : UInt8
      value.hu
    end

    # Hour units in BCD format
    def self.hu=(value : UInt8) : UInt8
      self.set(hu: value)
      value
    end

    # Alarm B minutes mask
    def msk2 : Bool
      @value.bits_set?(0x8000_u32)
    end

    # Alarm B minutes mask
    def self.msk2 : Bool
      value.msk2
    end

    # Alarm B minutes mask
    def self.msk2=(value : Bool) : Bool
      self.set(msk2: value)
      value
    end

    # Minute tens in BCD format
    def mnt : UInt8
      UInt8.new!((@value >> 12) & 0x7_u32)
    end

    # Minute tens in BCD format
    def self.mnt : UInt8
      value.mnt
    end

    # Minute tens in BCD format
    def self.mnt=(value : UInt8) : UInt8
      self.set(mnt: value)
      value
    end

    # Minute units in BCD format
    def mnu : UInt8
      UInt8.new!((@value >> 8) & 0xf_u32)
    end

    # Minute units in BCD format
    def self.mnu : UInt8
      value.mnu
    end

    # Minute units in BCD format
    def self.mnu=(value : UInt8) : UInt8
      self.set(mnu: value)
      value
    end

    # Alarm B seconds mask
    def msk1 : Bool
      @value.bits_set?(0x80_u32)
    end

    # Alarm B seconds mask
    def self.msk1 : Bool
      value.msk1
    end

    # Alarm B seconds mask
    def self.msk1=(value : Bool) : Bool
      self.set(msk1: value)
      value
    end

    # Second tens in BCD format
    def st : UInt8
      UInt8.new!((@value >> 4) & 0x7_u32)
    end

    # Second tens in BCD format
    def self.st : UInt8
      value.st
    end

    # Second tens in BCD format
    def self.st=(value : UInt8) : UInt8
      self.set(st: value)
      value
    end

    # Second units in BCD format
    def su : UInt8
      UInt8.new!((@value >> 0) & 0xf_u32)
    end

    # Second units in BCD format
    def self.su : UInt8
      value.su
    end

    # Second units in BCD format
    def self.su=(value : UInt8) : UInt8
      self.set(su: value)
      value
    end

    def copy_with(
      *,

      msk4 : Bool? = nil,

      wdsel : Bool? = nil,

      dt : UInt8? = nil,

      du : UInt8? = nil,

      msk3 : Bool? = nil,

      pm : Bool? = nil,

      ht : UInt8? = nil,

      hu : UInt8? = nil,

      msk2 : Bool? = nil,

      mnt : UInt8? = nil,

      mnu : UInt8? = nil,

      msk1 : Bool? = nil,

      st : UInt8? = nil,

      su : UInt8? = nil
    ) : self
      value = @value

      unless msk4.nil?
        value = (value & 0x7fffffff_u32) |
                UInt32.new!(msk4.to_int).&(0x1_u32) << 31
      end

      unless wdsel.nil?
        value = (value & 0xbfffffff_u32) |
                UInt32.new!(wdsel.to_int).&(0x1_u32) << 30
      end

      unless dt.nil?
        value = (value & 0xcfffffff_u32) |
                UInt32.new!(dt.to_int).&(0x3_u32) << 28
      end

      unless du.nil?
        value = (value & 0xf0ffffff_u32) |
                UInt32.new!(du.to_int).&(0xf_u32) << 24
      end

      unless msk3.nil?
        value = (value & 0xff7fffff_u32) |
                UInt32.new!(msk3.to_int).&(0x1_u32) << 23
      end

      unless pm.nil?
        value = (value & 0xffbfffff_u32) |
                UInt32.new!(pm.to_int).&(0x1_u32) << 22
      end

      unless ht.nil?
        value = (value & 0xffcfffff_u32) |
                UInt32.new!(ht.to_int).&(0x3_u32) << 20
      end

      unless hu.nil?
        value = (value & 0xfff0ffff_u32) |
                UInt32.new!(hu.to_int).&(0xf_u32) << 16
      end

      unless msk2.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(msk2.to_int).&(0x1_u32) << 15
      end

      unless mnt.nil?
        value = (value & 0xffff8fff_u32) |
                UInt32.new!(mnt.to_int).&(0x7_u32) << 12
      end

      unless mnu.nil?
        value = (value & 0xfffff0ff_u32) |
                UInt32.new!(mnu.to_int).&(0xf_u32) << 8
      end

      unless msk1.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(msk1.to_int).&(0x1_u32) << 7
      end

      unless st.nil?
        value = (value & 0xffffff8f_u32) |
                UInt32.new!(st.to_int).&(0x7_u32) << 4
      end

      unless su.nil?
        value = (value & 0xfffffff0_u32) |
                UInt32.new!(su.to_int).&(0xf_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      msk4 : Bool? = nil,
      wdsel : Bool? = nil,
      dt : UInt8? = nil,
      du : UInt8? = nil,
      msk3 : Bool? = nil,
      pm : Bool? = nil,
      ht : UInt8? = nil,
      hu : UInt8? = nil,
      msk2 : Bool? = nil,
      mnt : UInt8? = nil,
      mnu : UInt8? = nil,
      msk1 : Bool? = nil,
      st : UInt8? = nil,
      su : UInt8? = nil
    ) : Nil
      self.value = self.value.copy_with(
        msk4: msk4,
        wdsel: wdsel,
        dt: dt,
        du: du,
        msk3: msk3,
        pm: pm,
        ht: ht,
        hu: hu,
        msk2: msk2,
        mnt: mnt,
        mnu: mnu,
        msk1: msk1,
        st: st,
        su: su,
      )
    end
  end # struct

  # write protection register
  struct WPR
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
      new(0x0_u64)
    end

    def self.pointer : Pointer(UInt32)
      Pointer(UInt32).new(self.address)
    end

    def self.value : self
      value = self.pointer.load(volatile: true)
      new(value)
    end

    def self.value=(value : self) : self
      self.pointer.store(value.to_int, volatile: true)
      value
    end

    # Write protection key
    def self.key=(value : UInt8) : UInt8
      self.set(key: value)
      value
    end

    def copy_with(
      *,

      key : UInt8? = nil
    ) : self
      value = @value

      unless key.nil?
        value = (value & 0xffffff00_u32) |
                UInt32.new!(key.to_int).&(0xff_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      key : UInt8? = nil
    ) : Nil
      self.value = self.value.copy_with(
        key: key,
      )
    end
  end # struct

  # sub second register
  struct SSR
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
      new(0x0_u64)
    end

    def self.pointer : Pointer(UInt32)
      Pointer(UInt32).new(self.address)
    end

    def self.value : self
      value = self.pointer.load(volatile: true)
      new(value)
    end

    def self.value=(value : self) : self
      self.pointer.store(value.to_int, volatile: true)
      value
    end

    # Sub second value
    def ss : UInt16
      UInt16.new!((@value >> 0) & 0xffff_u32)
    end

    # Sub second value
    def self.ss : UInt16
      value.ss
    end
  end # struct

  # shift control register
  struct SHIFTR
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

    # Add one second
    def self.add1_s=(value : Bool) : Bool
      self.set(add1_s: value)
      value
    end

    # Subtract a fraction of a              second
    def self.subfs=(value : UInt16) : UInt16
      self.set(subfs: value)
      value
    end

    def copy_with(
      *,

      add1_s : Bool? = nil,

      subfs : UInt16? = nil
    ) : self
      value = @value

      unless add1_s.nil?
        value = (value & 0x7fffffff_u32) |
                UInt32.new!(add1_s.to_int).&(0x1_u32) << 31
      end

      unless subfs.nil?
        value = (value & 0xffff8000_u32) |
                UInt32.new!(subfs.to_int).&(0x7fff_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      add1_s : Bool? = nil,
      subfs : UInt16? = nil
    ) : Nil
      self.value = self.value.copy_with(
        add1_s: add1_s,
        subfs: subfs,
      )
    end
  end # struct

  # time stamp time register
  struct TSTR
    ADDRESS = BASE_ADDRESS + 0x30_u64

    protected def self.address : UInt64
      ADDRESS
    end

    @value : UInt32

    def initialize(@value : UInt32)
    end

    def to_int : UInt32
      @value
    end

    def self.reset_value : self
      new(0x0_u64)
    end

    def self.pointer : Pointer(UInt32)
      Pointer(UInt32).new(self.address)
    end

    def self.value : self
      value = self.pointer.load(volatile: true)
      new(value)
    end

    def self.value=(value : self) : self
      self.pointer.store(value.to_int, volatile: true)
      value
    end

    # AFO_ALARM output type
    def alarmouttype : Bool
      @value.bits_set?(0x40000_u32)
    end

    # AFO_ALARM output type
    def self.alarmouttype : Bool
      value.alarmouttype
    end

    # TIMESTAMP mapping
    def tsinsel : Bool
      @value.bits_set?(0x20000_u32)
    end

    # TIMESTAMP mapping
    def self.tsinsel : Bool
      value.tsinsel
    end

    # TAMPER1 mapping
    def tamp1_insel : Bool
      @value.bits_set?(0x10000_u32)
    end

    # TAMPER1 mapping
    def self.tamp1_insel : Bool
      value.tamp1_insel
    end

    # Tamper interrupt enable
    def tampie : Bool
      @value.bits_set?(0x4_u32)
    end

    # Tamper interrupt enable
    def self.tampie : Bool
      value.tampie
    end

    # Active level for tamper 1
    def tamp1_trg : Bool
      @value.bits_set?(0x2_u32)
    end

    # Active level for tamper 1
    def self.tamp1_trg : Bool
      value.tamp1_trg
    end

    # Tamper 1 detection enable
    def tamp1_e : Bool
      @value.bits_set?(0x1_u32)
    end

    # Tamper 1 detection enable
    def self.tamp1_e : Bool
      value.tamp1_e
    end
  end # struct

  # time stamp date register
  struct TSDR
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

    # Week day units
    def wdu : UInt8
      UInt8.new!((@value >> 13) & 0x7_u32)
    end

    # Week day units
    def self.wdu : UInt8
      value.wdu
    end

    # Month tens in BCD format
    def mt : Bool
      @value.bits_set?(0x1000_u32)
    end

    # Month tens in BCD format
    def self.mt : Bool
      value.mt
    end

    # Month units in BCD format
    def mu : UInt8
      UInt8.new!((@value >> 8) & 0xf_u32)
    end

    # Month units in BCD format
    def self.mu : UInt8
      value.mu
    end

    # Date tens in BCD format
    def dt : UInt8
      UInt8.new!((@value >> 4) & 0x3_u32)
    end

    # Date tens in BCD format
    def self.dt : UInt8
      value.dt
    end

    # Date units in BCD format
    def du : UInt8
      UInt8.new!((@value >> 0) & 0xf_u32)
    end

    # Date units in BCD format
    def self.du : UInt8
      value.du
    end
  end # struct

  # timestamp sub second register
  struct TSSSR
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

    # Sub second value
    def ss : UInt16
      UInt16.new!((@value >> 0) & 0xffff_u32)
    end

    # Sub second value
    def self.ss : UInt16
      value.ss
    end
  end # struct

  # calibration register
  struct CALR
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

    # Increase frequency of RTC by 488.5              ppm
    def calp : Bool
      @value.bits_set?(0x8000_u32)
    end

    # Increase frequency of RTC by 488.5              ppm
    def self.calp : Bool
      value.calp
    end

    # Increase frequency of RTC by 488.5              ppm
    def self.calp=(value : Bool) : Bool
      self.set(calp: value)
      value
    end

    # Use an 8-second calibration cycle              period
    def calw8 : Bool
      @value.bits_set?(0x4000_u32)
    end

    # Use an 8-second calibration cycle              period
    def self.calw8 : Bool
      value.calw8
    end

    # Use an 8-second calibration cycle              period
    def self.calw8=(value : Bool) : Bool
      self.set(calw8: value)
      value
    end

    # Use a 16-second calibration cycle              period
    def calw16 : Bool
      @value.bits_set?(0x2000_u32)
    end

    # Use a 16-second calibration cycle              period
    def self.calw16 : Bool
      value.calw16
    end

    # Use a 16-second calibration cycle              period
    def self.calw16=(value : Bool) : Bool
      self.set(calw16: value)
      value
    end

    # Calibration minus
    def calm : UInt16
      UInt16.new!((@value >> 0) & 0x1ff_u32)
    end

    # Calibration minus
    def self.calm : UInt16
      value.calm
    end

    # Calibration minus
    def self.calm=(value : UInt16) : UInt16
      self.set(calm: value)
      value
    end

    def copy_with(
      *,

      calp : Bool? = nil,

      calw8 : Bool? = nil,

      calw16 : Bool? = nil,

      calm : UInt16? = nil
    ) : self
      value = @value

      unless calp.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(calp.to_int).&(0x1_u32) << 15
      end

      unless calw8.nil?
        value = (value & 0xffffbfff_u32) |
                UInt32.new!(calw8.to_int).&(0x1_u32) << 14
      end

      unless calw16.nil?
        value = (value & 0xffffdfff_u32) |
                UInt32.new!(calw16.to_int).&(0x1_u32) << 13
      end

      unless calm.nil?
        value = (value & 0xfffffe00_u32) |
                UInt32.new!(calm.to_int).&(0x1ff_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      calp : Bool? = nil,
      calw8 : Bool? = nil,
      calw16 : Bool? = nil,
      calm : UInt16? = nil
    ) : Nil
      self.value = self.value.copy_with(
        calp: calp,
        calw8: calw8,
        calw16: calw16,
        calm: calm,
      )
    end
  end # struct

  # tamper and alternate function configuration          register
  struct TAFCR
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

    # AFO_ALARM output type
    def alarmouttype : Bool
      @value.bits_set?(0x40000_u32)
    end

    # AFO_ALARM output type
    def self.alarmouttype : Bool
      value.alarmouttype
    end

    # AFO_ALARM output type
    def self.alarmouttype=(value : Bool) : Bool
      self.set(alarmouttype: value)
      value
    end

    # TIMESTAMP mapping
    def tsinsel : Bool
      @value.bits_set?(0x20000_u32)
    end

    # TIMESTAMP mapping
    def self.tsinsel : Bool
      value.tsinsel
    end

    # TIMESTAMP mapping
    def self.tsinsel=(value : Bool) : Bool
      self.set(tsinsel: value)
      value
    end

    # TAMPER1 mapping
    def tamp1_insel : Bool
      @value.bits_set?(0x10000_u32)
    end

    # TAMPER1 mapping
    def self.tamp1_insel : Bool
      value.tamp1_insel
    end

    # TAMPER1 mapping
    def self.tamp1_insel=(value : Bool) : Bool
      self.set(tamp1_insel: value)
      value
    end

    # TAMPER pull-up disable
    def tamppudis : Bool
      @value.bits_set?(0x8000_u32)
    end

    # TAMPER pull-up disable
    def self.tamppudis : Bool
      value.tamppudis
    end

    # TAMPER pull-up disable
    def self.tamppudis=(value : Bool) : Bool
      self.set(tamppudis: value)
      value
    end

    # Tamper precharge duration
    def tampprch : UInt8
      UInt8.new!((@value >> 13) & 0x3_u32)
    end

    # Tamper precharge duration
    def self.tampprch : UInt8
      value.tampprch
    end

    # Tamper precharge duration
    def self.tampprch=(value : UInt8) : UInt8
      self.set(tampprch: value)
      value
    end

    # Tamper filter count
    def tampflt : UInt8
      UInt8.new!((@value >> 11) & 0x3_u32)
    end

    # Tamper filter count
    def self.tampflt : UInt8
      value.tampflt
    end

    # Tamper filter count
    def self.tampflt=(value : UInt8) : UInt8
      self.set(tampflt: value)
      value
    end

    # Tamper sampling frequency
    def tampfreq : UInt8
      UInt8.new!((@value >> 8) & 0x7_u32)
    end

    # Tamper sampling frequency
    def self.tampfreq : UInt8
      value.tampfreq
    end

    # Tamper sampling frequency
    def self.tampfreq=(value : UInt8) : UInt8
      self.set(tampfreq: value)
      value
    end

    # Activate timestamp on tamper detection              event
    def tampts : Bool
      @value.bits_set?(0x80_u32)
    end

    # Activate timestamp on tamper detection              event
    def self.tampts : Bool
      value.tampts
    end

    # Activate timestamp on tamper detection              event
    def self.tampts=(value : Bool) : Bool
      self.set(tampts: value)
      value
    end

    # Active level for tamper 2
    def tamp2_trg : Bool
      @value.bits_set?(0x10_u32)
    end

    # Active level for tamper 2
    def self.tamp2_trg : Bool
      value.tamp2_trg
    end

    # Active level for tamper 2
    def self.tamp2_trg=(value : Bool) : Bool
      self.set(tamp2_trg: value)
      value
    end

    # Tamper 2 detection enable
    def tamp2_e : Bool
      @value.bits_set?(0x8_u32)
    end

    # Tamper 2 detection enable
    def self.tamp2_e : Bool
      value.tamp2_e
    end

    # Tamper 2 detection enable
    def self.tamp2_e=(value : Bool) : Bool
      self.set(tamp2_e: value)
      value
    end

    # Tamper interrupt enable
    def tampie : Bool
      @value.bits_set?(0x4_u32)
    end

    # Tamper interrupt enable
    def self.tampie : Bool
      value.tampie
    end

    # Tamper interrupt enable
    def self.tampie=(value : Bool) : Bool
      self.set(tampie: value)
      value
    end

    # Active level for tamper 1
    def tamp1_trg : Bool
      @value.bits_set?(0x2_u32)
    end

    # Active level for tamper 1
    def self.tamp1_trg : Bool
      value.tamp1_trg
    end

    # Active level for tamper 1
    def self.tamp1_trg=(value : Bool) : Bool
      self.set(tamp1_trg: value)
      value
    end

    # Tamper 1 detection enable
    def tamp1_e : Bool
      @value.bits_set?(0x1_u32)
    end

    # Tamper 1 detection enable
    def self.tamp1_e : Bool
      value.tamp1_e
    end

    # Tamper 1 detection enable
    def self.tamp1_e=(value : Bool) : Bool
      self.set(tamp1_e: value)
      value
    end

    def copy_with(
      *,

      alarmouttype : Bool? = nil,

      tsinsel : Bool? = nil,

      tamp1_insel : Bool? = nil,

      tamppudis : Bool? = nil,

      tampprch : UInt8? = nil,

      tampflt : UInt8? = nil,

      tampfreq : UInt8? = nil,

      tampts : Bool? = nil,

      tamp2_trg : Bool? = nil,

      tamp2_e : Bool? = nil,

      tampie : Bool? = nil,

      tamp1_trg : Bool? = nil,

      tamp1_e : Bool? = nil
    ) : self
      value = @value

      unless alarmouttype.nil?
        value = (value & 0xfffbffff_u32) |
                UInt32.new!(alarmouttype.to_int).&(0x1_u32) << 18
      end

      unless tsinsel.nil?
        value = (value & 0xfffdffff_u32) |
                UInt32.new!(tsinsel.to_int).&(0x1_u32) << 17
      end

      unless tamp1_insel.nil?
        value = (value & 0xfffeffff_u32) |
                UInt32.new!(tamp1_insel.to_int).&(0x1_u32) << 16
      end

      unless tamppudis.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(tamppudis.to_int).&(0x1_u32) << 15
      end

      unless tampprch.nil?
        value = (value & 0xffff9fff_u32) |
                UInt32.new!(tampprch.to_int).&(0x3_u32) << 13
      end

      unless tampflt.nil?
        value = (value & 0xffffe7ff_u32) |
                UInt32.new!(tampflt.to_int).&(0x3_u32) << 11
      end

      unless tampfreq.nil?
        value = (value & 0xfffff8ff_u32) |
                UInt32.new!(tampfreq.to_int).&(0x7_u32) << 8
      end

      unless tampts.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(tampts.to_int).&(0x1_u32) << 7
      end

      unless tamp2_trg.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(tamp2_trg.to_int).&(0x1_u32) << 4
      end

      unless tamp2_e.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(tamp2_e.to_int).&(0x1_u32) << 3
      end

      unless tampie.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(tampie.to_int).&(0x1_u32) << 2
      end

      unless tamp1_trg.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(tamp1_trg.to_int).&(0x1_u32) << 1
      end

      unless tamp1_e.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(tamp1_e.to_int).&(0x1_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      alarmouttype : Bool? = nil,
      tsinsel : Bool? = nil,
      tamp1_insel : Bool? = nil,
      tamppudis : Bool? = nil,
      tampprch : UInt8? = nil,
      tampflt : UInt8? = nil,
      tampfreq : UInt8? = nil,
      tampts : Bool? = nil,
      tamp2_trg : Bool? = nil,
      tamp2_e : Bool? = nil,
      tampie : Bool? = nil,
      tamp1_trg : Bool? = nil,
      tamp1_e : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        alarmouttype: alarmouttype,
        tsinsel: tsinsel,
        tamp1_insel: tamp1_insel,
        tamppudis: tamppudis,
        tampprch: tampprch,
        tampflt: tampflt,
        tampfreq: tampfreq,
        tampts: tampts,
        tamp2_trg: tamp2_trg,
        tamp2_e: tamp2_e,
        tampie: tampie,
        tamp1_trg: tamp1_trg,
        tamp1_e: tamp1_e,
      )
    end
  end # struct

  # alarm A sub second register
  struct ALRMASSR
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
      new(0x0_u64)
    end

    def self.pointer : Pointer(UInt32)
      Pointer(UInt32).new(self.address)
    end

    def self.value : self
      value = self.pointer.load(volatile: true)
      new(value)
    end

    def self.value=(value : self) : self
      self.pointer.store(value.to_int, volatile: true)
      value
    end

    # Mask the most-significant bits starting              at this bit
    def maskss : UInt8
      UInt8.new!((@value >> 24) & 0xf_u32)
    end

    # Mask the most-significant bits starting              at this bit
    def self.maskss : UInt8
      value.maskss
    end

    # Mask the most-significant bits starting              at this bit
    def self.maskss=(value : UInt8) : UInt8
      self.set(maskss: value)
      value
    end

    # Sub seconds value
    def ss : UInt16
      UInt16.new!((@value >> 0) & 0x7fff_u32)
    end

    # Sub seconds value
    def self.ss : UInt16
      value.ss
    end

    # Sub seconds value
    def self.ss=(value : UInt16) : UInt16
      self.set(ss: value)
      value
    end

    def copy_with(
      *,

      maskss : UInt8? = nil,

      ss : UInt16? = nil
    ) : self
      value = @value

      unless maskss.nil?
        value = (value & 0xf0ffffff_u32) |
                UInt32.new!(maskss.to_int).&(0xf_u32) << 24
      end

      unless ss.nil?
        value = (value & 0xffff8000_u32) |
                UInt32.new!(ss.to_int).&(0x7fff_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      maskss : UInt8? = nil,
      ss : UInt16? = nil
    ) : Nil
      self.value = self.value.copy_with(
        maskss: maskss,
        ss: ss,
      )
    end
  end # struct

  # alarm B sub second register
  struct ALRMBSSR
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
      new(0x0_u64)
    end

    def self.pointer : Pointer(UInt32)
      Pointer(UInt32).new(self.address)
    end

    def self.value : self
      value = self.pointer.load(volatile: true)
      new(value)
    end

    def self.value=(value : self) : self
      self.pointer.store(value.to_int, volatile: true)
      value
    end

    # Mask the most-significant bits starting              at this bit
    def maskss : UInt8
      UInt8.new!((@value >> 24) & 0xf_u32)
    end

    # Mask the most-significant bits starting              at this bit
    def self.maskss : UInt8
      value.maskss
    end

    # Mask the most-significant bits starting              at this bit
    def self.maskss=(value : UInt8) : UInt8
      self.set(maskss: value)
      value
    end

    # Sub seconds value
    def ss : UInt16
      UInt16.new!((@value >> 0) & 0x7fff_u32)
    end

    # Sub seconds value
    def self.ss : UInt16
      value.ss
    end

    # Sub seconds value
    def self.ss=(value : UInt16) : UInt16
      self.set(ss: value)
      value
    end

    def copy_with(
      *,

      maskss : UInt8? = nil,

      ss : UInt16? = nil
    ) : self
      value = @value

      unless maskss.nil?
        value = (value & 0xf0ffffff_u32) |
                UInt32.new!(maskss.to_int).&(0xf_u32) << 24
      end

      unless ss.nil?
        value = (value & 0xffff8000_u32) |
                UInt32.new!(ss.to_int).&(0x7fff_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      maskss : UInt8? = nil,
      ss : UInt16? = nil
    ) : Nil
      self.value = self.value.copy_with(
        maskss: maskss,
        ss: ss,
      )
    end
  end # struct

  # backup register
  struct BKP0R
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
      new(0x0_u64)
    end

    def self.pointer : Pointer(UInt32)
      Pointer(UInt32).new(self.address)
    end

    def self.value : self
      value = self.pointer.load(volatile: true)
      new(value)
    end

    def self.value=(value : self) : self
      self.pointer.store(value.to_int, volatile: true)
      value
    end

    # BKP
    def bkp : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # BKP
    def self.bkp : UInt32
      value.bkp
    end

    # BKP
    def self.bkp=(value : UInt32) : UInt32
      self.set(bkp: value)
      value
    end

    def copy_with(
      *,

      bkp : UInt32? = nil
    ) : self
      value = @value

      unless bkp.nil?
        value = (value & 0xffffffff_u32) |
                UInt32.new!(bkp.to_int).&(0x0_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      bkp : UInt32? = nil
    ) : Nil
      self.value = self.value.copy_with(
        bkp: bkp,
      )
    end
  end # struct

  # backup register
  struct BKP1R
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
      new(0x0_u64)
    end

    def self.pointer : Pointer(UInt32)
      Pointer(UInt32).new(self.address)
    end

    def self.value : self
      value = self.pointer.load(volatile: true)
      new(value)
    end

    def self.value=(value : self) : self
      self.pointer.store(value.to_int, volatile: true)
      value
    end

    # BKP
    def bkp : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # BKP
    def self.bkp : UInt32
      value.bkp
    end

    # BKP
    def self.bkp=(value : UInt32) : UInt32
      self.set(bkp: value)
      value
    end

    def copy_with(
      *,

      bkp : UInt32? = nil
    ) : self
      value = @value

      unless bkp.nil?
        value = (value & 0xffffffff_u32) |
                UInt32.new!(bkp.to_int).&(0x0_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      bkp : UInt32? = nil
    ) : Nil
      self.value = self.value.copy_with(
        bkp: bkp,
      )
    end
  end # struct

  # backup register
  struct BKP2R
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
      new(0x0_u64)
    end

    def self.pointer : Pointer(UInt32)
      Pointer(UInt32).new(self.address)
    end

    def self.value : self
      value = self.pointer.load(volatile: true)
      new(value)
    end

    def self.value=(value : self) : self
      self.pointer.store(value.to_int, volatile: true)
      value
    end

    # BKP
    def bkp : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # BKP
    def self.bkp : UInt32
      value.bkp
    end

    # BKP
    def self.bkp=(value : UInt32) : UInt32
      self.set(bkp: value)
      value
    end

    def copy_with(
      *,

      bkp : UInt32? = nil
    ) : self
      value = @value

      unless bkp.nil?
        value = (value & 0xffffffff_u32) |
                UInt32.new!(bkp.to_int).&(0x0_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      bkp : UInt32? = nil
    ) : Nil
      self.value = self.value.copy_with(
        bkp: bkp,
      )
    end
  end # struct

  # backup register
  struct BKP3R
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
      new(0x0_u64)
    end

    def self.pointer : Pointer(UInt32)
      Pointer(UInt32).new(self.address)
    end

    def self.value : self
      value = self.pointer.load(volatile: true)
      new(value)
    end

    def self.value=(value : self) : self
      self.pointer.store(value.to_int, volatile: true)
      value
    end

    # BKP
    def bkp : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # BKP
    def self.bkp : UInt32
      value.bkp
    end

    # BKP
    def self.bkp=(value : UInt32) : UInt32
      self.set(bkp: value)
      value
    end

    def copy_with(
      *,

      bkp : UInt32? = nil
    ) : self
      value = @value

      unless bkp.nil?
        value = (value & 0xffffffff_u32) |
                UInt32.new!(bkp.to_int).&(0x0_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      bkp : UInt32? = nil
    ) : Nil
      self.value = self.value.copy_with(
        bkp: bkp,
      )
    end
  end # struct

  # backup register
  struct BKP4R
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
      new(0x0_u64)
    end

    def self.pointer : Pointer(UInt32)
      Pointer(UInt32).new(self.address)
    end

    def self.value : self
      value = self.pointer.load(volatile: true)
      new(value)
    end

    def self.value=(value : self) : self
      self.pointer.store(value.to_int, volatile: true)
      value
    end

    # BKP
    def bkp : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # BKP
    def self.bkp : UInt32
      value.bkp
    end

    # BKP
    def self.bkp=(value : UInt32) : UInt32
      self.set(bkp: value)
      value
    end

    def copy_with(
      *,

      bkp : UInt32? = nil
    ) : self
      value = @value

      unless bkp.nil?
        value = (value & 0xffffffff_u32) |
                UInt32.new!(bkp.to_int).&(0x0_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      bkp : UInt32? = nil
    ) : Nil
      self.value = self.value.copy_with(
        bkp: bkp,
      )
    end
  end # struct

  # backup register
  struct BKP5R
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
      new(0x0_u64)
    end

    def self.pointer : Pointer(UInt32)
      Pointer(UInt32).new(self.address)
    end

    def self.value : self
      value = self.pointer.load(volatile: true)
      new(value)
    end

    def self.value=(value : self) : self
      self.pointer.store(value.to_int, volatile: true)
      value
    end

    # BKP
    def bkp : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # BKP
    def self.bkp : UInt32
      value.bkp
    end

    # BKP
    def self.bkp=(value : UInt32) : UInt32
      self.set(bkp: value)
      value
    end

    def copy_with(
      *,

      bkp : UInt32? = nil
    ) : self
      value = @value

      unless bkp.nil?
        value = (value & 0xffffffff_u32) |
                UInt32.new!(bkp.to_int).&(0x0_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      bkp : UInt32? = nil
    ) : Nil
      self.value = self.value.copy_with(
        bkp: bkp,
      )
    end
  end # struct

  # backup register
  struct BKP6R
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
      new(0x0_u64)
    end

    def self.pointer : Pointer(UInt32)
      Pointer(UInt32).new(self.address)
    end

    def self.value : self
      value = self.pointer.load(volatile: true)
      new(value)
    end

    def self.value=(value : self) : self
      self.pointer.store(value.to_int, volatile: true)
      value
    end

    # BKP
    def bkp : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # BKP
    def self.bkp : UInt32
      value.bkp
    end

    # BKP
    def self.bkp=(value : UInt32) : UInt32
      self.set(bkp: value)
      value
    end

    def copy_with(
      *,

      bkp : UInt32? = nil
    ) : self
      value = @value

      unless bkp.nil?
        value = (value & 0xffffffff_u32) |
                UInt32.new!(bkp.to_int).&(0x0_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      bkp : UInt32? = nil
    ) : Nil
      self.value = self.value.copy_with(
        bkp: bkp,
      )
    end
  end # struct

  # backup register
  struct BKP7R
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
      new(0x0_u64)
    end

    def self.pointer : Pointer(UInt32)
      Pointer(UInt32).new(self.address)
    end

    def self.value : self
      value = self.pointer.load(volatile: true)
      new(value)
    end

    def self.value=(value : self) : self
      self.pointer.store(value.to_int, volatile: true)
      value
    end

    # BKP
    def bkp : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # BKP
    def self.bkp : UInt32
      value.bkp
    end

    # BKP
    def self.bkp=(value : UInt32) : UInt32
      self.set(bkp: value)
      value
    end

    def copy_with(
      *,

      bkp : UInt32? = nil
    ) : self
      value = @value

      unless bkp.nil?
        value = (value & 0xffffffff_u32) |
                UInt32.new!(bkp.to_int).&(0x0_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      bkp : UInt32? = nil
    ) : Nil
      self.value = self.value.copy_with(
        bkp: bkp,
      )
    end
  end # struct

  # backup register
  struct BKP8R
    ADDRESS = BASE_ADDRESS + 0x70_u64

    protected def self.address : UInt64
      ADDRESS
    end

    @value : UInt32

    def initialize(@value : UInt32)
    end

    def to_int : UInt32
      @value
    end

    def self.reset_value : self
      new(0x0_u64)
    end

    def self.pointer : Pointer(UInt32)
      Pointer(UInt32).new(self.address)
    end

    def self.value : self
      value = self.pointer.load(volatile: true)
      new(value)
    end

    def self.value=(value : self) : self
      self.pointer.store(value.to_int, volatile: true)
      value
    end

    # BKP
    def bkp : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # BKP
    def self.bkp : UInt32
      value.bkp
    end

    # BKP
    def self.bkp=(value : UInt32) : UInt32
      self.set(bkp: value)
      value
    end

    def copy_with(
      *,

      bkp : UInt32? = nil
    ) : self
      value = @value

      unless bkp.nil?
        value = (value & 0xffffffff_u32) |
                UInt32.new!(bkp.to_int).&(0x0_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      bkp : UInt32? = nil
    ) : Nil
      self.value = self.value.copy_with(
        bkp: bkp,
      )
    end
  end # struct

  # backup register
  struct BKP9R
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

    # BKP
    def bkp : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # BKP
    def self.bkp : UInt32
      value.bkp
    end

    # BKP
    def self.bkp=(value : UInt32) : UInt32
      self.set(bkp: value)
      value
    end

    def copy_with(
      *,

      bkp : UInt32? = nil
    ) : self
      value = @value

      unless bkp.nil?
        value = (value & 0xffffffff_u32) |
                UInt32.new!(bkp.to_int).&(0x0_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      bkp : UInt32? = nil
    ) : Nil
      self.value = self.value.copy_with(
        bkp: bkp,
      )
    end
  end # struct

  # backup register
  struct BKP10R
    ADDRESS = BASE_ADDRESS + 0x78_u64

    protected def self.address : UInt64
      ADDRESS
    end

    @value : UInt32

    def initialize(@value : UInt32)
    end

    def to_int : UInt32
      @value
    end

    def self.reset_value : self
      new(0x0_u64)
    end

    def self.pointer : Pointer(UInt32)
      Pointer(UInt32).new(self.address)
    end

    def self.value : self
      value = self.pointer.load(volatile: true)
      new(value)
    end

    def self.value=(value : self) : self
      self.pointer.store(value.to_int, volatile: true)
      value
    end

    # BKP
    def bkp : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # BKP
    def self.bkp : UInt32
      value.bkp
    end

    # BKP
    def self.bkp=(value : UInt32) : UInt32
      self.set(bkp: value)
      value
    end

    def copy_with(
      *,

      bkp : UInt32? = nil
    ) : self
      value = @value

      unless bkp.nil?
        value = (value & 0xffffffff_u32) |
                UInt32.new!(bkp.to_int).&(0x0_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      bkp : UInt32? = nil
    ) : Nil
      self.value = self.value.copy_with(
        bkp: bkp,
      )
    end
  end # struct

  # backup register
  struct BKP11R
    ADDRESS = BASE_ADDRESS + 0x7c_u64

    protected def self.address : UInt64
      ADDRESS
    end

    @value : UInt32

    def initialize(@value : UInt32)
    end

    def to_int : UInt32
      @value
    end

    def self.reset_value : self
      new(0x0_u64)
    end

    def self.pointer : Pointer(UInt32)
      Pointer(UInt32).new(self.address)
    end

    def self.value : self
      value = self.pointer.load(volatile: true)
      new(value)
    end

    def self.value=(value : self) : self
      self.pointer.store(value.to_int, volatile: true)
      value
    end

    # BKP
    def bkp : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # BKP
    def self.bkp : UInt32
      value.bkp
    end

    # BKP
    def self.bkp=(value : UInt32) : UInt32
      self.set(bkp: value)
      value
    end

    def copy_with(
      *,

      bkp : UInt32? = nil
    ) : self
      value = @value

      unless bkp.nil?
        value = (value & 0xffffffff_u32) |
                UInt32.new!(bkp.to_int).&(0x0_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      bkp : UInt32? = nil
    ) : Nil
      self.value = self.value.copy_with(
        bkp: bkp,
      )
    end
  end # struct

  # backup register
  struct BKP12R
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
      new(0x0_u64)
    end

    def self.pointer : Pointer(UInt32)
      Pointer(UInt32).new(self.address)
    end

    def self.value : self
      value = self.pointer.load(volatile: true)
      new(value)
    end

    def self.value=(value : self) : self
      self.pointer.store(value.to_int, volatile: true)
      value
    end

    # BKP
    def bkp : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # BKP
    def self.bkp : UInt32
      value.bkp
    end

    # BKP
    def self.bkp=(value : UInt32) : UInt32
      self.set(bkp: value)
      value
    end

    def copy_with(
      *,

      bkp : UInt32? = nil
    ) : self
      value = @value

      unless bkp.nil?
        value = (value & 0xffffffff_u32) |
                UInt32.new!(bkp.to_int).&(0x0_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      bkp : UInt32? = nil
    ) : Nil
      self.value = self.value.copy_with(
        bkp: bkp,
      )
    end
  end # struct

  # backup register
  struct BKP13R
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
      new(0x0_u64)
    end

    def self.pointer : Pointer(UInt32)
      Pointer(UInt32).new(self.address)
    end

    def self.value : self
      value = self.pointer.load(volatile: true)
      new(value)
    end

    def self.value=(value : self) : self
      self.pointer.store(value.to_int, volatile: true)
      value
    end

    # BKP
    def bkp : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # BKP
    def self.bkp : UInt32
      value.bkp
    end

    # BKP
    def self.bkp=(value : UInt32) : UInt32
      self.set(bkp: value)
      value
    end

    def copy_with(
      *,

      bkp : UInt32? = nil
    ) : self
      value = @value

      unless bkp.nil?
        value = (value & 0xffffffff_u32) |
                UInt32.new!(bkp.to_int).&(0x0_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      bkp : UInt32? = nil
    ) : Nil
      self.value = self.value.copy_with(
        bkp: bkp,
      )
    end
  end # struct

  # backup register
  struct BKP14R
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
      new(0x0_u64)
    end

    def self.pointer : Pointer(UInt32)
      Pointer(UInt32).new(self.address)
    end

    def self.value : self
      value = self.pointer.load(volatile: true)
      new(value)
    end

    def self.value=(value : self) : self
      self.pointer.store(value.to_int, volatile: true)
      value
    end

    # BKP
    def bkp : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # BKP
    def self.bkp : UInt32
      value.bkp
    end

    # BKP
    def self.bkp=(value : UInt32) : UInt32
      self.set(bkp: value)
      value
    end

    def copy_with(
      *,

      bkp : UInt32? = nil
    ) : self
      value = @value

      unless bkp.nil?
        value = (value & 0xffffffff_u32) |
                UInt32.new!(bkp.to_int).&(0x0_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      bkp : UInt32? = nil
    ) : Nil
      self.value = self.value.copy_with(
        bkp: bkp,
      )
    end
  end # struct

  # backup register
  struct BKP15R
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
      new(0x0_u64)
    end

    def self.pointer : Pointer(UInt32)
      Pointer(UInt32).new(self.address)
    end

    def self.value : self
      value = self.pointer.load(volatile: true)
      new(value)
    end

    def self.value=(value : self) : self
      self.pointer.store(value.to_int, volatile: true)
      value
    end

    # BKP
    def bkp : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # BKP
    def self.bkp : UInt32
      value.bkp
    end

    # BKP
    def self.bkp=(value : UInt32) : UInt32
      self.set(bkp: value)
      value
    end

    def copy_with(
      *,

      bkp : UInt32? = nil
    ) : self
      value = @value

      unless bkp.nil?
        value = (value & 0xffffffff_u32) |
                UInt32.new!(bkp.to_int).&(0x0_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      bkp : UInt32? = nil
    ) : Nil
      self.value = self.value.copy_with(
        bkp: bkp,
      )
    end
  end # struct

  # backup register
  struct BKP16R
    ADDRESS = BASE_ADDRESS + 0x90_u64

    protected def self.address : UInt64
      ADDRESS
    end

    @value : UInt32

    def initialize(@value : UInt32)
    end

    def to_int : UInt32
      @value
    end

    def self.reset_value : self
      new(0x0_u64)
    end

    def self.pointer : Pointer(UInt32)
      Pointer(UInt32).new(self.address)
    end

    def self.value : self
      value = self.pointer.load(volatile: true)
      new(value)
    end

    def self.value=(value : self) : self
      self.pointer.store(value.to_int, volatile: true)
      value
    end

    # BKP
    def bkp : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # BKP
    def self.bkp : UInt32
      value.bkp
    end

    # BKP
    def self.bkp=(value : UInt32) : UInt32
      self.set(bkp: value)
      value
    end

    def copy_with(
      *,

      bkp : UInt32? = nil
    ) : self
      value = @value

      unless bkp.nil?
        value = (value & 0xffffffff_u32) |
                UInt32.new!(bkp.to_int).&(0x0_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      bkp : UInt32? = nil
    ) : Nil
      self.value = self.value.copy_with(
        bkp: bkp,
      )
    end
  end # struct

  # backup register
  struct BKP17R
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

    # BKP
    def bkp : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # BKP
    def self.bkp : UInt32
      value.bkp
    end

    # BKP
    def self.bkp=(value : UInt32) : UInt32
      self.set(bkp: value)
      value
    end

    def copy_with(
      *,

      bkp : UInt32? = nil
    ) : self
      value = @value

      unless bkp.nil?
        value = (value & 0xffffffff_u32) |
                UInt32.new!(bkp.to_int).&(0x0_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      bkp : UInt32? = nil
    ) : Nil
      self.value = self.value.copy_with(
        bkp: bkp,
      )
    end
  end # struct

  # backup register
  struct BKP18R
    ADDRESS = BASE_ADDRESS + 0x98_u64

    protected def self.address : UInt64
      ADDRESS
    end

    @value : UInt32

    def initialize(@value : UInt32)
    end

    def to_int : UInt32
      @value
    end

    def self.reset_value : self
      new(0x0_u64)
    end

    def self.pointer : Pointer(UInt32)
      Pointer(UInt32).new(self.address)
    end

    def self.value : self
      value = self.pointer.load(volatile: true)
      new(value)
    end

    def self.value=(value : self) : self
      self.pointer.store(value.to_int, volatile: true)
      value
    end

    # BKP
    def bkp : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # BKP
    def self.bkp : UInt32
      value.bkp
    end

    # BKP
    def self.bkp=(value : UInt32) : UInt32
      self.set(bkp: value)
      value
    end

    def copy_with(
      *,

      bkp : UInt32? = nil
    ) : self
      value = @value

      unless bkp.nil?
        value = (value & 0xffffffff_u32) |
                UInt32.new!(bkp.to_int).&(0x0_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      bkp : UInt32? = nil
    ) : Nil
      self.value = self.value.copy_with(
        bkp: bkp,
      )
    end
  end # struct

  # backup register
  struct BKP19R
    ADDRESS = BASE_ADDRESS + 0x9c_u64

    protected def self.address : UInt64
      ADDRESS
    end

    @value : UInt32

    def initialize(@value : UInt32)
    end

    def to_int : UInt32
      @value
    end

    def self.reset_value : self
      new(0x0_u64)
    end

    def self.pointer : Pointer(UInt32)
      Pointer(UInt32).new(self.address)
    end

    def self.value : self
      value = self.pointer.load(volatile: true)
      new(value)
    end

    def self.value=(value : self) : self
      self.pointer.store(value.to_int, volatile: true)
      value
    end

    # BKP
    def bkp : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # BKP
    def self.bkp : UInt32
      value.bkp
    end

    # BKP
    def self.bkp=(value : UInt32) : UInt32
      self.set(bkp: value)
      value
    end

    def copy_with(
      *,

      bkp : UInt32? = nil
    ) : self
      value = @value

      unless bkp.nil?
        value = (value & 0xffffffff_u32) |
                UInt32.new!(bkp.to_int).&(0x0_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      bkp : UInt32? = nil
    ) : Nil
      self.value = self.value.copy_with(
        bkp: bkp,
      )
    end
  end # struct

end
