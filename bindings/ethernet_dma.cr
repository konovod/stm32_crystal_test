# Ethernet: DMA controller operation
module Ethernet_DMA
  VERSION      = nil
  BASE_ADDRESS = 0x40029000_u64

  # Ethernet DMA bus mode register
  struct DMABMR
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

    # SR
    def sr : Bool
      @value.bits_set?(0x1_u32)
    end

    # SR
    def self.sr : Bool
      value.sr
    end

    # SR
    def self.sr=(value : Bool) : Bool
      self.set(sr: value)
      value
    end

    # DA
    def da : Bool
      @value.bits_set?(0x2_u32)
    end

    # DA
    def self.da : Bool
      value.da
    end

    # DA
    def self.da=(value : Bool) : Bool
      self.set(da: value)
      value
    end

    # DSL
    def dsl : UInt8
      UInt8.new!((@value >> 2) & 0x1f_u32)
    end

    # DSL
    def self.dsl : UInt8
      value.dsl
    end

    # DSL
    def self.dsl=(value : UInt8) : UInt8
      self.set(dsl: value)
      value
    end

    # EDFE
    def edfe : Bool
      @value.bits_set?(0x80_u32)
    end

    # EDFE
    def self.edfe : Bool
      value.edfe
    end

    # EDFE
    def self.edfe=(value : Bool) : Bool
      self.set(edfe: value)
      value
    end

    # PBL
    def pbl : UInt8
      UInt8.new!((@value >> 8) & 0x3f_u32)
    end

    # PBL
    def self.pbl : UInt8
      value.pbl
    end

    # PBL
    def self.pbl=(value : UInt8) : UInt8
      self.set(pbl: value)
      value
    end

    # RTPR
    def rtpr : UInt8
      UInt8.new!((@value >> 14) & 0x3_u32)
    end

    # RTPR
    def self.rtpr : UInt8
      value.rtpr
    end

    # RTPR
    def self.rtpr=(value : UInt8) : UInt8
      self.set(rtpr: value)
      value
    end

    # FB
    def fb : Bool
      @value.bits_set?(0x10000_u32)
    end

    # FB
    def self.fb : Bool
      value.fb
    end

    # FB
    def self.fb=(value : Bool) : Bool
      self.set(fb: value)
      value
    end

    # RDP
    def rdp : UInt8
      UInt8.new!((@value >> 17) & 0x3f_u32)
    end

    # RDP
    def self.rdp : UInt8
      value.rdp
    end

    # RDP
    def self.rdp=(value : UInt8) : UInt8
      self.set(rdp: value)
      value
    end

    # USP
    def usp : Bool
      @value.bits_set?(0x800000_u32)
    end

    # USP
    def self.usp : Bool
      value.usp
    end

    # USP
    def self.usp=(value : Bool) : Bool
      self.set(usp: value)
      value
    end

    # FPM
    def fpm : Bool
      @value.bits_set?(0x1000000_u32)
    end

    # FPM
    def self.fpm : Bool
      value.fpm
    end

    # FPM
    def self.fpm=(value : Bool) : Bool
      self.set(fpm: value)
      value
    end

    # AAB
    def aab : Bool
      @value.bits_set?(0x2000000_u32)
    end

    # AAB
    def self.aab : Bool
      value.aab
    end

    # AAB
    def self.aab=(value : Bool) : Bool
      self.set(aab: value)
      value
    end

    # MB
    def mb : Bool
      @value.bits_set?(0x4000000_u32)
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

    def copy_with(
      *,

      sr : Bool? = nil,

      da : Bool? = nil,

      dsl : UInt8? = nil,

      edfe : Bool? = nil,

      pbl : UInt8? = nil,

      rtpr : UInt8? = nil,

      fb : Bool? = nil,

      rdp : UInt8? = nil,

      usp : Bool? = nil,

      fpm : Bool? = nil,

      aab : Bool? = nil,

      mb : Bool? = nil
    ) : self
      value = @value

      unless sr.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(sr.to_int).&(0x1_u32) << 0
      end

      unless da.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(da.to_int).&(0x1_u32) << 1
      end

      unless dsl.nil?
        value = (value & 0xffffff83_u32) |
                UInt32.new!(dsl.to_int).&(0x1f_u32) << 2
      end

      unless edfe.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(edfe.to_int).&(0x1_u32) << 7
      end

      unless pbl.nil?
        value = (value & 0xffffc0ff_u32) |
                UInt32.new!(pbl.to_int).&(0x3f_u32) << 8
      end

      unless rtpr.nil?
        value = (value & 0xffff3fff_u32) |
                UInt32.new!(rtpr.to_int).&(0x3_u32) << 14
      end

      unless fb.nil?
        value = (value & 0xfffeffff_u32) |
                UInt32.new!(fb.to_int).&(0x1_u32) << 16
      end

      unless rdp.nil?
        value = (value & 0xff81ffff_u32) |
                UInt32.new!(rdp.to_int).&(0x3f_u32) << 17
      end

      unless usp.nil?
        value = (value & 0xff7fffff_u32) |
                UInt32.new!(usp.to_int).&(0x1_u32) << 23
      end

      unless fpm.nil?
        value = (value & 0xfeffffff_u32) |
                UInt32.new!(fpm.to_int).&(0x1_u32) << 24
      end

      unless aab.nil?
        value = (value & 0xfdffffff_u32) |
                UInt32.new!(aab.to_int).&(0x1_u32) << 25
      end

      unless mb.nil?
        value = (value & 0xfbffffff_u32) |
                UInt32.new!(mb.to_int).&(0x1_u32) << 26
      end

      self.class.new(value)
    end

    def self.set(
      *,
      sr : Bool? = nil,
      da : Bool? = nil,
      dsl : UInt8? = nil,
      edfe : Bool? = nil,
      pbl : UInt8? = nil,
      rtpr : UInt8? = nil,
      fb : Bool? = nil,
      rdp : UInt8? = nil,
      usp : Bool? = nil,
      fpm : Bool? = nil,
      aab : Bool? = nil,
      mb : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        sr: sr,
        da: da,
        dsl: dsl,
        edfe: edfe,
        pbl: pbl,
        rtpr: rtpr,
        fb: fb,
        rdp: rdp,
        usp: usp,
        fpm: fpm,
        aab: aab,
        mb: mb,
      )
    end
  end # struct

  # Ethernet DMA transmit poll demand          register
  struct DMATPDR
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

    # TPD
    def tpd : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # TPD
    def self.tpd : UInt32
      value.tpd
    end

    # TPD
    def self.tpd=(value : UInt32) : UInt32
      self.set(tpd: value)
      value
    end

    def copy_with(
      *,

      tpd : UInt32? = nil
    ) : self
      value = @value

      unless tpd.nil?
        value = (value & 0xffffffff_u32) |
                UInt32.new!(tpd.to_int).&(0x0_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      tpd : UInt32? = nil
    ) : Nil
      self.value = self.value.copy_with(
        tpd: tpd,
      )
    end
  end # struct

  # EHERNET DMA receive poll demand          register
  struct DMARPDR
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

    # RPD
    def rpd : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # RPD
    def self.rpd : UInt32
      value.rpd
    end

    # RPD
    def self.rpd=(value : UInt32) : UInt32
      self.set(rpd: value)
      value
    end

    def copy_with(
      *,

      rpd : UInt32? = nil
    ) : self
      value = @value

      unless rpd.nil?
        value = (value & 0xffffffff_u32) |
                UInt32.new!(rpd.to_int).&(0x0_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      rpd : UInt32? = nil
    ) : Nil
      self.value = self.value.copy_with(
        rpd: rpd,
      )
    end
  end # struct

  # Ethernet DMA receive descriptor list address          register
  struct DMARDLAR
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

    # SRL
    def srl : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # SRL
    def self.srl : UInt32
      value.srl
    end

    # SRL
    def self.srl=(value : UInt32) : UInt32
      self.set(srl: value)
      value
    end

    def copy_with(
      *,

      srl : UInt32? = nil
    ) : self
      value = @value

      unless srl.nil?
        value = (value & 0xffffffff_u32) |
                UInt32.new!(srl.to_int).&(0x0_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      srl : UInt32? = nil
    ) : Nil
      self.value = self.value.copy_with(
        srl: srl,
      )
    end
  end # struct

  # Ethernet DMA transmit descriptor list          address register
  struct DMATDLAR
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

    # STL
    def stl : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # STL
    def self.stl : UInt32
      value.stl
    end

    # STL
    def self.stl=(value : UInt32) : UInt32
      self.set(stl: value)
      value
    end

    def copy_with(
      *,

      stl : UInt32? = nil
    ) : self
      value = @value

      unless stl.nil?
        value = (value & 0xffffffff_u32) |
                UInt32.new!(stl.to_int).&(0x0_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      stl : UInt32? = nil
    ) : Nil
      self.value = self.value.copy_with(
        stl: stl,
      )
    end
  end # struct

  # Ethernet DMA status register
  struct DMASR
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

    # TS
    def ts : Bool
      @value.bits_set?(0x1_u32)
    end

    # TS
    def self.ts : Bool
      value.ts
    end

    # TS
    def self.ts=(value : Bool) : Bool
      self.set(ts: value)
      value
    end

    # TPSS
    def tpss : Bool
      @value.bits_set?(0x2_u32)
    end

    # TPSS
    def self.tpss : Bool
      value.tpss
    end

    # TPSS
    def self.tpss=(value : Bool) : Bool
      self.set(tpss: value)
      value
    end

    # TBUS
    def tbus : Bool
      @value.bits_set?(0x4_u32)
    end

    # TBUS
    def self.tbus : Bool
      value.tbus
    end

    # TBUS
    def self.tbus=(value : Bool) : Bool
      self.set(tbus: value)
      value
    end

    # TJTS
    def tjts : Bool
      @value.bits_set?(0x8_u32)
    end

    # TJTS
    def self.tjts : Bool
      value.tjts
    end

    # TJTS
    def self.tjts=(value : Bool) : Bool
      self.set(tjts: value)
      value
    end

    # ROS
    def ros : Bool
      @value.bits_set?(0x10_u32)
    end

    # ROS
    def self.ros : Bool
      value.ros
    end

    # ROS
    def self.ros=(value : Bool) : Bool
      self.set(ros: value)
      value
    end

    # TUS
    def tus : Bool
      @value.bits_set?(0x20_u32)
    end

    # TUS
    def self.tus : Bool
      value.tus
    end

    # TUS
    def self.tus=(value : Bool) : Bool
      self.set(tus: value)
      value
    end

    # RS
    def rs : Bool
      @value.bits_set?(0x40_u32)
    end

    # RS
    def self.rs : Bool
      value.rs
    end

    # RS
    def self.rs=(value : Bool) : Bool
      self.set(rs: value)
      value
    end

    # RBUS
    def rbus : Bool
      @value.bits_set?(0x80_u32)
    end

    # RBUS
    def self.rbus : Bool
      value.rbus
    end

    # RBUS
    def self.rbus=(value : Bool) : Bool
      self.set(rbus: value)
      value
    end

    # RPSS
    def rpss : Bool
      @value.bits_set?(0x100_u32)
    end

    # RPSS
    def self.rpss : Bool
      value.rpss
    end

    # RPSS
    def self.rpss=(value : Bool) : Bool
      self.set(rpss: value)
      value
    end

    # PWTS
    def pwts : Bool
      @value.bits_set?(0x200_u32)
    end

    # PWTS
    def self.pwts : Bool
      value.pwts
    end

    # PWTS
    def self.pwts=(value : Bool) : Bool
      self.set(pwts: value)
      value
    end

    # ETS
    def ets : Bool
      @value.bits_set?(0x400_u32)
    end

    # ETS
    def self.ets : Bool
      value.ets
    end

    # ETS
    def self.ets=(value : Bool) : Bool
      self.set(ets: value)
      value
    end

    # FBES
    def fbes : Bool
      @value.bits_set?(0x2000_u32)
    end

    # FBES
    def self.fbes : Bool
      value.fbes
    end

    # FBES
    def self.fbes=(value : Bool) : Bool
      self.set(fbes: value)
      value
    end

    # ERS
    def ers : Bool
      @value.bits_set?(0x4000_u32)
    end

    # ERS
    def self.ers : Bool
      value.ers
    end

    # ERS
    def self.ers=(value : Bool) : Bool
      self.set(ers: value)
      value
    end

    # AIS
    def ais : Bool
      @value.bits_set?(0x8000_u32)
    end

    # AIS
    def self.ais : Bool
      value.ais
    end

    # AIS
    def self.ais=(value : Bool) : Bool
      self.set(ais: value)
      value
    end

    # NIS
    def nis : Bool
      @value.bits_set?(0x10000_u32)
    end

    # NIS
    def self.nis : Bool
      value.nis
    end

    # NIS
    def self.nis=(value : Bool) : Bool
      self.set(nis: value)
      value
    end

    # RPS
    def rps : UInt8
      UInt8.new!((@value >> 17) & 0x7_u32)
    end

    # RPS
    def self.rps : UInt8
      value.rps
    end

    # TPS
    def tps : UInt8
      UInt8.new!((@value >> 20) & 0x7_u32)
    end

    # TPS
    def self.tps : UInt8
      value.tps
    end

    # EBS
    def ebs : UInt8
      UInt8.new!((@value >> 23) & 0x7_u32)
    end

    # EBS
    def self.ebs : UInt8
      value.ebs
    end

    # MMCS
    def mmcs : Bool
      @value.bits_set?(0x8000000_u32)
    end

    # MMCS
    def self.mmcs : Bool
      value.mmcs
    end

    # PMTS
    def pmts : Bool
      @value.bits_set?(0x10000000_u32)
    end

    # PMTS
    def self.pmts : Bool
      value.pmts
    end

    # TSTS
    def tsts : Bool
      @value.bits_set?(0x20000000_u32)
    end

    # TSTS
    def self.tsts : Bool
      value.tsts
    end

    def copy_with(
      *,

      ts : Bool? = nil,

      tpss : Bool? = nil,

      tbus : Bool? = nil,

      tjts : Bool? = nil,

      ros : Bool? = nil,

      tus : Bool? = nil,

      rs : Bool? = nil,

      rbus : Bool? = nil,

      rpss : Bool? = nil,

      pwts : Bool? = nil,

      ets : Bool? = nil,

      fbes : Bool? = nil,

      ers : Bool? = nil,

      ais : Bool? = nil,

      nis : Bool? = nil
    ) : self
      value = @value

      unless ts.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(ts.to_int).&(0x1_u32) << 0
      end

      unless tpss.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(tpss.to_int).&(0x1_u32) << 1
      end

      unless tbus.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(tbus.to_int).&(0x1_u32) << 2
      end

      unless tjts.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(tjts.to_int).&(0x1_u32) << 3
      end

      unless ros.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(ros.to_int).&(0x1_u32) << 4
      end

      unless tus.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(tus.to_int).&(0x1_u32) << 5
      end

      unless rs.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(rs.to_int).&(0x1_u32) << 6
      end

      unless rbus.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(rbus.to_int).&(0x1_u32) << 7
      end

      unless rpss.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(rpss.to_int).&(0x1_u32) << 8
      end

      unless pwts.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(pwts.to_int).&(0x1_u32) << 9
      end

      unless ets.nil?
        value = (value & 0xfffffbff_u32) |
                UInt32.new!(ets.to_int).&(0x1_u32) << 10
      end

      unless fbes.nil?
        value = (value & 0xffffdfff_u32) |
                UInt32.new!(fbes.to_int).&(0x1_u32) << 13
      end

      unless ers.nil?
        value = (value & 0xffffbfff_u32) |
                UInt32.new!(ers.to_int).&(0x1_u32) << 14
      end

      unless ais.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(ais.to_int).&(0x1_u32) << 15
      end

      unless nis.nil?
        value = (value & 0xfffeffff_u32) |
                UInt32.new!(nis.to_int).&(0x1_u32) << 16
      end

      self.class.new(value)
    end

    def self.set(
      *,
      ts : Bool? = nil,
      tpss : Bool? = nil,
      tbus : Bool? = nil,
      tjts : Bool? = nil,
      ros : Bool? = nil,
      tus : Bool? = nil,
      rs : Bool? = nil,
      rbus : Bool? = nil,
      rpss : Bool? = nil,
      pwts : Bool? = nil,
      ets : Bool? = nil,
      fbes : Bool? = nil,
      ers : Bool? = nil,
      ais : Bool? = nil,
      nis : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        ts: ts,
        tpss: tpss,
        tbus: tbus,
        tjts: tjts,
        ros: ros,
        tus: tus,
        rs: rs,
        rbus: rbus,
        rpss: rpss,
        pwts: pwts,
        ets: ets,
        fbes: fbes,
        ers: ers,
        ais: ais,
        nis: nis,
      )
    end
  end # struct

  # Ethernet DMA operation mode          register
  struct DMAOMR
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

    # SR
    def sr : Bool
      @value.bits_set?(0x2_u32)
    end

    # SR
    def self.sr : Bool
      value.sr
    end

    # SR
    def self.sr=(value : Bool) : Bool
      self.set(sr: value)
      value
    end

    # OSF
    def osf : Bool
      @value.bits_set?(0x4_u32)
    end

    # OSF
    def self.osf : Bool
      value.osf
    end

    # OSF
    def self.osf=(value : Bool) : Bool
      self.set(osf: value)
      value
    end

    # RTC
    def rtc : UInt8
      UInt8.new!((@value >> 3) & 0x3_u32)
    end

    # RTC
    def self.rtc : UInt8
      value.rtc
    end

    # RTC
    def self.rtc=(value : UInt8) : UInt8
      self.set(rtc: value)
      value
    end

    # FUGF
    def fugf : Bool
      @value.bits_set?(0x40_u32)
    end

    # FUGF
    def self.fugf : Bool
      value.fugf
    end

    # FUGF
    def self.fugf=(value : Bool) : Bool
      self.set(fugf: value)
      value
    end

    # FEF
    def fef : Bool
      @value.bits_set?(0x80_u32)
    end

    # FEF
    def self.fef : Bool
      value.fef
    end

    # FEF
    def self.fef=(value : Bool) : Bool
      self.set(fef: value)
      value
    end

    # ST
    def st : Bool
      @value.bits_set?(0x2000_u32)
    end

    # ST
    def self.st : Bool
      value.st
    end

    # ST
    def self.st=(value : Bool) : Bool
      self.set(st: value)
      value
    end

    # TTC
    def ttc : UInt8
      UInt8.new!((@value >> 14) & 0x7_u32)
    end

    # TTC
    def self.ttc : UInt8
      value.ttc
    end

    # TTC
    def self.ttc=(value : UInt8) : UInt8
      self.set(ttc: value)
      value
    end

    # FTF
    def ftf : Bool
      @value.bits_set?(0x100000_u32)
    end

    # FTF
    def self.ftf : Bool
      value.ftf
    end

    # FTF
    def self.ftf=(value : Bool) : Bool
      self.set(ftf: value)
      value
    end

    # TSF
    def tsf : Bool
      @value.bits_set?(0x200000_u32)
    end

    # TSF
    def self.tsf : Bool
      value.tsf
    end

    # TSF
    def self.tsf=(value : Bool) : Bool
      self.set(tsf: value)
      value
    end

    # DFRF
    def dfrf : Bool
      @value.bits_set?(0x1000000_u32)
    end

    # DFRF
    def self.dfrf : Bool
      value.dfrf
    end

    # DFRF
    def self.dfrf=(value : Bool) : Bool
      self.set(dfrf: value)
      value
    end

    # RSF
    def rsf : Bool
      @value.bits_set?(0x2000000_u32)
    end

    # RSF
    def self.rsf : Bool
      value.rsf
    end

    # RSF
    def self.rsf=(value : Bool) : Bool
      self.set(rsf: value)
      value
    end

    # DTCEFD
    def dtcefd : Bool
      @value.bits_set?(0x4000000_u32)
    end

    # DTCEFD
    def self.dtcefd : Bool
      value.dtcefd
    end

    # DTCEFD
    def self.dtcefd=(value : Bool) : Bool
      self.set(dtcefd: value)
      value
    end

    def copy_with(
      *,

      sr : Bool? = nil,

      osf : Bool? = nil,

      rtc : UInt8? = nil,

      fugf : Bool? = nil,

      fef : Bool? = nil,

      st : Bool? = nil,

      ttc : UInt8? = nil,

      ftf : Bool? = nil,

      tsf : Bool? = nil,

      dfrf : Bool? = nil,

      rsf : Bool? = nil,

      dtcefd : Bool? = nil
    ) : self
      value = @value

      unless sr.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(sr.to_int).&(0x1_u32) << 1
      end

      unless osf.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(osf.to_int).&(0x1_u32) << 2
      end

      unless rtc.nil?
        value = (value & 0xffffffe7_u32) |
                UInt32.new!(rtc.to_int).&(0x3_u32) << 3
      end

      unless fugf.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(fugf.to_int).&(0x1_u32) << 6
      end

      unless fef.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(fef.to_int).&(0x1_u32) << 7
      end

      unless st.nil?
        value = (value & 0xffffdfff_u32) |
                UInt32.new!(st.to_int).&(0x1_u32) << 13
      end

      unless ttc.nil?
        value = (value & 0xfffe3fff_u32) |
                UInt32.new!(ttc.to_int).&(0x7_u32) << 14
      end

      unless ftf.nil?
        value = (value & 0xffefffff_u32) |
                UInt32.new!(ftf.to_int).&(0x1_u32) << 20
      end

      unless tsf.nil?
        value = (value & 0xffdfffff_u32) |
                UInt32.new!(tsf.to_int).&(0x1_u32) << 21
      end

      unless dfrf.nil?
        value = (value & 0xfeffffff_u32) |
                UInt32.new!(dfrf.to_int).&(0x1_u32) << 24
      end

      unless rsf.nil?
        value = (value & 0xfdffffff_u32) |
                UInt32.new!(rsf.to_int).&(0x1_u32) << 25
      end

      unless dtcefd.nil?
        value = (value & 0xfbffffff_u32) |
                UInt32.new!(dtcefd.to_int).&(0x1_u32) << 26
      end

      self.class.new(value)
    end

    def self.set(
      *,
      sr : Bool? = nil,
      osf : Bool? = nil,
      rtc : UInt8? = nil,
      fugf : Bool? = nil,
      fef : Bool? = nil,
      st : Bool? = nil,
      ttc : UInt8? = nil,
      ftf : Bool? = nil,
      tsf : Bool? = nil,
      dfrf : Bool? = nil,
      rsf : Bool? = nil,
      dtcefd : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        sr: sr,
        osf: osf,
        rtc: rtc,
        fugf: fugf,
        fef: fef,
        st: st,
        ttc: ttc,
        ftf: ftf,
        tsf: tsf,
        dfrf: dfrf,
        rsf: rsf,
        dtcefd: dtcefd,
      )
    end
  end # struct

  # Ethernet DMA interrupt enable          register
  struct DMAIER
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

    # TIE
    def tie : Bool
      @value.bits_set?(0x1_u32)
    end

    # TIE
    def self.tie : Bool
      value.tie
    end

    # TIE
    def self.tie=(value : Bool) : Bool
      self.set(tie: value)
      value
    end

    # TPSIE
    def tpsie : Bool
      @value.bits_set?(0x2_u32)
    end

    # TPSIE
    def self.tpsie : Bool
      value.tpsie
    end

    # TPSIE
    def self.tpsie=(value : Bool) : Bool
      self.set(tpsie: value)
      value
    end

    # TBUIE
    def tbuie : Bool
      @value.bits_set?(0x4_u32)
    end

    # TBUIE
    def self.tbuie : Bool
      value.tbuie
    end

    # TBUIE
    def self.tbuie=(value : Bool) : Bool
      self.set(tbuie: value)
      value
    end

    # TJTIE
    def tjtie : Bool
      @value.bits_set?(0x8_u32)
    end

    # TJTIE
    def self.tjtie : Bool
      value.tjtie
    end

    # TJTIE
    def self.tjtie=(value : Bool) : Bool
      self.set(tjtie: value)
      value
    end

    # ROIE
    def roie : Bool
      @value.bits_set?(0x10_u32)
    end

    # ROIE
    def self.roie : Bool
      value.roie
    end

    # ROIE
    def self.roie=(value : Bool) : Bool
      self.set(roie: value)
      value
    end

    # TUIE
    def tuie : Bool
      @value.bits_set?(0x20_u32)
    end

    # TUIE
    def self.tuie : Bool
      value.tuie
    end

    # TUIE
    def self.tuie=(value : Bool) : Bool
      self.set(tuie: value)
      value
    end

    # RIE
    def rie : Bool
      @value.bits_set?(0x40_u32)
    end

    # RIE
    def self.rie : Bool
      value.rie
    end

    # RIE
    def self.rie=(value : Bool) : Bool
      self.set(rie: value)
      value
    end

    # RBUIE
    def rbuie : Bool
      @value.bits_set?(0x80_u32)
    end

    # RBUIE
    def self.rbuie : Bool
      value.rbuie
    end

    # RBUIE
    def self.rbuie=(value : Bool) : Bool
      self.set(rbuie: value)
      value
    end

    # RPSIE
    def rpsie : Bool
      @value.bits_set?(0x100_u32)
    end

    # RPSIE
    def self.rpsie : Bool
      value.rpsie
    end

    # RPSIE
    def self.rpsie=(value : Bool) : Bool
      self.set(rpsie: value)
      value
    end

    # RWTIE
    def rwtie : Bool
      @value.bits_set?(0x200_u32)
    end

    # RWTIE
    def self.rwtie : Bool
      value.rwtie
    end

    # RWTIE
    def self.rwtie=(value : Bool) : Bool
      self.set(rwtie: value)
      value
    end

    # ETIE
    def etie : Bool
      @value.bits_set?(0x400_u32)
    end

    # ETIE
    def self.etie : Bool
      value.etie
    end

    # ETIE
    def self.etie=(value : Bool) : Bool
      self.set(etie: value)
      value
    end

    # FBEIE
    def fbeie : Bool
      @value.bits_set?(0x2000_u32)
    end

    # FBEIE
    def self.fbeie : Bool
      value.fbeie
    end

    # FBEIE
    def self.fbeie=(value : Bool) : Bool
      self.set(fbeie: value)
      value
    end

    # ERIE
    def erie : Bool
      @value.bits_set?(0x4000_u32)
    end

    # ERIE
    def self.erie : Bool
      value.erie
    end

    # ERIE
    def self.erie=(value : Bool) : Bool
      self.set(erie: value)
      value
    end

    # AISE
    def aise : Bool
      @value.bits_set?(0x8000_u32)
    end

    # AISE
    def self.aise : Bool
      value.aise
    end

    # AISE
    def self.aise=(value : Bool) : Bool
      self.set(aise: value)
      value
    end

    # NISE
    def nise : Bool
      @value.bits_set?(0x10000_u32)
    end

    # NISE
    def self.nise : Bool
      value.nise
    end

    # NISE
    def self.nise=(value : Bool) : Bool
      self.set(nise: value)
      value
    end

    def copy_with(
      *,

      tie : Bool? = nil,

      tpsie : Bool? = nil,

      tbuie : Bool? = nil,

      tjtie : Bool? = nil,

      roie : Bool? = nil,

      tuie : Bool? = nil,

      rie : Bool? = nil,

      rbuie : Bool? = nil,

      rpsie : Bool? = nil,

      rwtie : Bool? = nil,

      etie : Bool? = nil,

      fbeie : Bool? = nil,

      erie : Bool? = nil,

      aise : Bool? = nil,

      nise : Bool? = nil
    ) : self
      value = @value

      unless tie.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(tie.to_int).&(0x1_u32) << 0
      end

      unless tpsie.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(tpsie.to_int).&(0x1_u32) << 1
      end

      unless tbuie.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(tbuie.to_int).&(0x1_u32) << 2
      end

      unless tjtie.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(tjtie.to_int).&(0x1_u32) << 3
      end

      unless roie.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(roie.to_int).&(0x1_u32) << 4
      end

      unless tuie.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(tuie.to_int).&(0x1_u32) << 5
      end

      unless rie.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(rie.to_int).&(0x1_u32) << 6
      end

      unless rbuie.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(rbuie.to_int).&(0x1_u32) << 7
      end

      unless rpsie.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(rpsie.to_int).&(0x1_u32) << 8
      end

      unless rwtie.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(rwtie.to_int).&(0x1_u32) << 9
      end

      unless etie.nil?
        value = (value & 0xfffffbff_u32) |
                UInt32.new!(etie.to_int).&(0x1_u32) << 10
      end

      unless fbeie.nil?
        value = (value & 0xffffdfff_u32) |
                UInt32.new!(fbeie.to_int).&(0x1_u32) << 13
      end

      unless erie.nil?
        value = (value & 0xffffbfff_u32) |
                UInt32.new!(erie.to_int).&(0x1_u32) << 14
      end

      unless aise.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(aise.to_int).&(0x1_u32) << 15
      end

      unless nise.nil?
        value = (value & 0xfffeffff_u32) |
                UInt32.new!(nise.to_int).&(0x1_u32) << 16
      end

      self.class.new(value)
    end

    def self.set(
      *,
      tie : Bool? = nil,
      tpsie : Bool? = nil,
      tbuie : Bool? = nil,
      tjtie : Bool? = nil,
      roie : Bool? = nil,
      tuie : Bool? = nil,
      rie : Bool? = nil,
      rbuie : Bool? = nil,
      rpsie : Bool? = nil,
      rwtie : Bool? = nil,
      etie : Bool? = nil,
      fbeie : Bool? = nil,
      erie : Bool? = nil,
      aise : Bool? = nil,
      nise : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        tie: tie,
        tpsie: tpsie,
        tbuie: tbuie,
        tjtie: tjtie,
        roie: roie,
        tuie: tuie,
        rie: rie,
        rbuie: rbuie,
        rpsie: rpsie,
        rwtie: rwtie,
        etie: etie,
        fbeie: fbeie,
        erie: erie,
        aise: aise,
        nise: nise,
      )
    end
  end # struct

  # Ethernet DMA missed frame and buffer          overflow counter register
  struct DMAMFBOCR
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

    # MFC
    def mfc : UInt16
      UInt16.new!((@value >> 0) & 0xffff_u32)
    end

    # MFC
    def self.mfc : UInt16
      value.mfc
    end

    # MFC
    def self.mfc=(value : UInt16) : UInt16
      self.set(mfc: value)
      value
    end

    # OMFC
    def omfc : Bool
      @value.bits_set?(0x10000_u32)
    end

    # OMFC
    def self.omfc : Bool
      value.omfc
    end

    # OMFC
    def self.omfc=(value : Bool) : Bool
      self.set(omfc: value)
      value
    end

    # MFA
    def mfa : UInt16
      UInt16.new!((@value >> 17) & 0x7ff_u32)
    end

    # MFA
    def self.mfa : UInt16
      value.mfa
    end

    # MFA
    def self.mfa=(value : UInt16) : UInt16
      self.set(mfa: value)
      value
    end

    # OFOC
    def ofoc : Bool
      @value.bits_set?(0x10000000_u32)
    end

    # OFOC
    def self.ofoc : Bool
      value.ofoc
    end

    # OFOC
    def self.ofoc=(value : Bool) : Bool
      self.set(ofoc: value)
      value
    end

    def copy_with(
      *,

      mfc : UInt16? = nil,

      omfc : Bool? = nil,

      mfa : UInt16? = nil,

      ofoc : Bool? = nil
    ) : self
      value = @value

      unless mfc.nil?
        value = (value & 0xffff0000_u32) |
                UInt32.new!(mfc.to_int).&(0xffff_u32) << 0
      end

      unless omfc.nil?
        value = (value & 0xfffeffff_u32) |
                UInt32.new!(omfc.to_int).&(0x1_u32) << 16
      end

      unless mfa.nil?
        value = (value & 0xf001ffff_u32) |
                UInt32.new!(mfa.to_int).&(0x7ff_u32) << 17
      end

      unless ofoc.nil?
        value = (value & 0xefffffff_u32) |
                UInt32.new!(ofoc.to_int).&(0x1_u32) << 28
      end

      self.class.new(value)
    end

    def self.set(
      *,
      mfc : UInt16? = nil,
      omfc : Bool? = nil,
      mfa : UInt16? = nil,
      ofoc : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        mfc: mfc,
        omfc: omfc,
        mfa: mfa,
        ofoc: ofoc,
      )
    end
  end # struct

  # Ethernet DMA receive status watchdog timer          register
  struct DMARSWTR
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

    # RSWTC
    def rswtc : UInt8
      UInt8.new!((@value >> 0) & 0xff_u32)
    end

    # RSWTC
    def self.rswtc : UInt8
      value.rswtc
    end

    # RSWTC
    def self.rswtc=(value : UInt8) : UInt8
      self.set(rswtc: value)
      value
    end

    def copy_with(
      *,

      rswtc : UInt8? = nil
    ) : self
      value = @value

      unless rswtc.nil?
        value = (value & 0xffffff00_u32) |
                UInt32.new!(rswtc.to_int).&(0xff_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      rswtc : UInt8? = nil
    ) : Nil
      self.value = self.value.copy_with(
        rswtc: rswtc,
      )
    end
  end # struct

  # Ethernet DMA current host transmit          descriptor register
  struct DMACHTDR
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

    # HTDAP
    def htdap : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # HTDAP
    def self.htdap : UInt32
      value.htdap
    end
  end # struct

  # Ethernet DMA current host receive descriptor          register
  struct DMACHRDR
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
      new(0x0_u64)
    end

    def self.pointer : Pointer(UInt32)
      Pointer(UInt32).new(self.address)
    end

    def self.value : self
      value = self.pointer.load(volatile: true)
      new(value)
    end

    def self.value=(value : self) : self
      self.pointer.store(value.to_int, volatile: true)
      value
    end

    # HRDAP
    def hrdap : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # HRDAP
    def self.hrdap : UInt32
      value.hrdap
    end
  end # struct

  # Ethernet DMA current host transmit buffer          address register
  struct DMACHTBAR
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

    # HTBAP
    def htbap : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # HTBAP
    def self.htbap : UInt32
      value.htbap
    end
  end # struct

  # Ethernet DMA current host receive buffer          address register
  struct DMACHRBAR
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

    # HRBAP
    def hrbap : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # HRBAP
    def self.hrbap : UInt32
      value.hrbap
    end
  end # struct

end
