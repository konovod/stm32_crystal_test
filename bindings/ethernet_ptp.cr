# Ethernet: Precision time protocol
module Ethernet_PTP
  VERSION      = nil
  BASE_ADDRESS = 0x40028700_u64

  # Ethernet PTP time stamp control          register
  struct PTPTSCR
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
      new(0x2000_u64)
    end

    def self.pointer : Pointer(UInt32)
      Pointer(UInt32).new(self.address)
    end

    def self.value : self
      value = self.pointer.load(volatile: true)
      new(value)
    end

    def self.value=(value : self) : self
      self.pointer.store(value.to_int, volatile: true)
      value
    end

    # TSE
    def tse : Bool
      @value.bits_set?(0x1_u32)
    end

    # TSE
    def self.tse : Bool
      value.tse
    end

    # TSE
    def self.tse=(value : Bool) : Bool
      self.set(tse: value)
      value
    end

    # TSFCU
    def tsfcu : Bool
      @value.bits_set?(0x2_u32)
    end

    # TSFCU
    def self.tsfcu : Bool
      value.tsfcu
    end

    # TSFCU
    def self.tsfcu=(value : Bool) : Bool
      self.set(tsfcu: value)
      value
    end

    # TSPTPPSV2E
    def tsptppsv2_e : Bool
      @value.bits_set?(0x400_u32)
    end

    # TSPTPPSV2E
    def self.tsptppsv2_e : Bool
      value.tsptppsv2_e
    end

    # TSPTPPSV2E
    def self.tsptppsv2_e=(value : Bool) : Bool
      self.set(tsptppsv2_e: value)
      value
    end

    # TSSPTPOEFE
    def tssptpoefe : Bool
      @value.bits_set?(0x800_u32)
    end

    # TSSPTPOEFE
    def self.tssptpoefe : Bool
      value.tssptpoefe
    end

    # TSSPTPOEFE
    def self.tssptpoefe=(value : Bool) : Bool
      self.set(tssptpoefe: value)
      value
    end

    # TSSIPV6FE
    def tssipv6_fe : Bool
      @value.bits_set?(0x1000_u32)
    end

    # TSSIPV6FE
    def self.tssipv6_fe : Bool
      value.tssipv6_fe
    end

    # TSSIPV6FE
    def self.tssipv6_fe=(value : Bool) : Bool
      self.set(tssipv6_fe: value)
      value
    end

    # TSSIPV4FE
    def tssipv4_fe : Bool
      @value.bits_set?(0x2000_u32)
    end

    # TSSIPV4FE
    def self.tssipv4_fe : Bool
      value.tssipv4_fe
    end

    # TSSIPV4FE
    def self.tssipv4_fe=(value : Bool) : Bool
      self.set(tssipv4_fe: value)
      value
    end

    # TSSEME
    def tsseme : Bool
      @value.bits_set?(0x4000_u32)
    end

    # TSSEME
    def self.tsseme : Bool
      value.tsseme
    end

    # TSSEME
    def self.tsseme=(value : Bool) : Bool
      self.set(tsseme: value)
      value
    end

    # TSSMRME
    def tssmrme : Bool
      @value.bits_set?(0x8000_u32)
    end

    # TSSMRME
    def self.tssmrme : Bool
      value.tssmrme
    end

    # TSSMRME
    def self.tssmrme=(value : Bool) : Bool
      self.set(tssmrme: value)
      value
    end

    # TSCNT
    def tscnt : UInt8
      UInt8.new!((@value >> 16) & 0x3_u32)
    end

    # TSCNT
    def self.tscnt : UInt8
      value.tscnt
    end

    # TSCNT
    def self.tscnt=(value : UInt8) : UInt8
      self.set(tscnt: value)
      value
    end

    # TSPFFMAE
    def tspffmae : Bool
      @value.bits_set?(0x40000_u32)
    end

    # TSPFFMAE
    def self.tspffmae : Bool
      value.tspffmae
    end

    # TSPFFMAE
    def self.tspffmae=(value : Bool) : Bool
      self.set(tspffmae: value)
      value
    end

    # TSSTI
    def tssti : Bool
      @value.bits_set?(0x4_u32)
    end

    # TSSTI
    def self.tssti : Bool
      value.tssti
    end

    # TSSTI
    def self.tssti=(value : Bool) : Bool
      self.set(tssti: value)
      value
    end

    # TSSTU
    def tsstu : Bool
      @value.bits_set?(0x8_u32)
    end

    # TSSTU
    def self.tsstu : Bool
      value.tsstu
    end

    # TSSTU
    def self.tsstu=(value : Bool) : Bool
      self.set(tsstu: value)
      value
    end

    # TSITE
    def tsite : Bool
      @value.bits_set?(0x10_u32)
    end

    # TSITE
    def self.tsite : Bool
      value.tsite
    end

    # TSITE
    def self.tsite=(value : Bool) : Bool
      self.set(tsite: value)
      value
    end

    # TTSARU
    def ttsaru : Bool
      @value.bits_set?(0x20_u32)
    end

    # TTSARU
    def self.ttsaru : Bool
      value.ttsaru
    end

    # TTSARU
    def self.ttsaru=(value : Bool) : Bool
      self.set(ttsaru: value)
      value
    end

    # TSSARFE
    def tssarfe : Bool
      @value.bits_set?(0x100_u32)
    end

    # TSSARFE
    def self.tssarfe : Bool
      value.tssarfe
    end

    # TSSARFE
    def self.tssarfe=(value : Bool) : Bool
      self.set(tssarfe: value)
      value
    end

    # TSSSR
    def tsssr : Bool
      @value.bits_set?(0x200_u32)
    end

    # TSSSR
    def self.tsssr : Bool
      value.tsssr
    end

    # TSSSR
    def self.tsssr=(value : Bool) : Bool
      self.set(tsssr: value)
      value
    end

    def copy_with(
      *,

      tse : Bool? = nil,

      tsfcu : Bool? = nil,

      tsptppsv2_e : Bool? = nil,

      tssptpoefe : Bool? = nil,

      tssipv6_fe : Bool? = nil,

      tssipv4_fe : Bool? = nil,

      tsseme : Bool? = nil,

      tssmrme : Bool? = nil,

      tscnt : UInt8? = nil,

      tspffmae : Bool? = nil,

      tssti : Bool? = nil,

      tsstu : Bool? = nil,

      tsite : Bool? = nil,

      ttsaru : Bool? = nil,

      tssarfe : Bool? = nil,

      tsssr : Bool? = nil
    ) : self
      value = @value

      unless tse.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(tse.to_int).&(0x1_u32) << 0
      end

      unless tsfcu.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(tsfcu.to_int).&(0x1_u32) << 1
      end

      unless tsptppsv2_e.nil?
        value = (value & 0xfffffbff_u32) |
                UInt32.new!(tsptppsv2_e.to_int).&(0x1_u32) << 10
      end

      unless tssptpoefe.nil?
        value = (value & 0xfffff7ff_u32) |
                UInt32.new!(tssptpoefe.to_int).&(0x1_u32) << 11
      end

      unless tssipv6_fe.nil?
        value = (value & 0xffffefff_u32) |
                UInt32.new!(tssipv6_fe.to_int).&(0x1_u32) << 12
      end

      unless tssipv4_fe.nil?
        value = (value & 0xffffdfff_u32) |
                UInt32.new!(tssipv4_fe.to_int).&(0x1_u32) << 13
      end

      unless tsseme.nil?
        value = (value & 0xffffbfff_u32) |
                UInt32.new!(tsseme.to_int).&(0x1_u32) << 14
      end

      unless tssmrme.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(tssmrme.to_int).&(0x1_u32) << 15
      end

      unless tscnt.nil?
        value = (value & 0xfffcffff_u32) |
                UInt32.new!(tscnt.to_int).&(0x3_u32) << 16
      end

      unless tspffmae.nil?
        value = (value & 0xfffbffff_u32) |
                UInt32.new!(tspffmae.to_int).&(0x1_u32) << 18
      end

      unless tssti.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(tssti.to_int).&(0x1_u32) << 2
      end

      unless tsstu.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(tsstu.to_int).&(0x1_u32) << 3
      end

      unless tsite.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(tsite.to_int).&(0x1_u32) << 4
      end

      unless ttsaru.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(ttsaru.to_int).&(0x1_u32) << 5
      end

      unless tssarfe.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(tssarfe.to_int).&(0x1_u32) << 8
      end

      unless tsssr.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(tsssr.to_int).&(0x1_u32) << 9
      end

      self.class.new(value)
    end

    def self.set(
      *,
      tse : Bool? = nil,
      tsfcu : Bool? = nil,
      tsptppsv2_e : Bool? = nil,
      tssptpoefe : Bool? = nil,
      tssipv6_fe : Bool? = nil,
      tssipv4_fe : Bool? = nil,
      tsseme : Bool? = nil,
      tssmrme : Bool? = nil,
      tscnt : UInt8? = nil,
      tspffmae : Bool? = nil,
      tssti : Bool? = nil,
      tsstu : Bool? = nil,
      tsite : Bool? = nil,
      ttsaru : Bool? = nil,
      tssarfe : Bool? = nil,
      tsssr : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        tse: tse,
        tsfcu: tsfcu,
        tsptppsv2_e: tsptppsv2_e,
        tssptpoefe: tssptpoefe,
        tssipv6_fe: tssipv6_fe,
        tssipv4_fe: tssipv4_fe,
        tsseme: tsseme,
        tssmrme: tssmrme,
        tscnt: tscnt,
        tspffmae: tspffmae,
        tssti: tssti,
        tsstu: tsstu,
        tsite: tsite,
        ttsaru: ttsaru,
        tssarfe: tssarfe,
        tsssr: tsssr,
      )
    end
  end # struct

  # Ethernet PTP subsecond increment          register
  struct PTPSSIR
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

    # STSSI
    def stssi : UInt8
      UInt8.new!((@value >> 0) & 0xff_u32)
    end

    # STSSI
    def self.stssi : UInt8
      value.stssi
    end

    # STSSI
    def self.stssi=(value : UInt8) : UInt8
      self.set(stssi: value)
      value
    end

    def copy_with(
      *,

      stssi : UInt8? = nil
    ) : self
      value = @value

      unless stssi.nil?
        value = (value & 0xffffff00_u32) |
                UInt32.new!(stssi.to_int).&(0xff_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      stssi : UInt8? = nil
    ) : Nil
      self.value = self.value.copy_with(
        stssi: stssi,
      )
    end
  end # struct

  # Ethernet PTP time stamp high          register
  struct PTPTSHR
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

    # STS
    def sts : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # STS
    def self.sts : UInt32
      value.sts
    end
  end # struct

  # Ethernet PTP time stamp low          register
  struct PTPTSLR
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

    # STSS
    def stss : UInt32
      UInt32.new!((@value >> 0) & 0x7fffffff_u32)
    end

    # STSS
    def self.stss : UInt32
      value.stss
    end

    # STPNS
    def stpns : Bool
      @value.bits_set?(0x80000000_u32)
    end

    # STPNS
    def self.stpns : Bool
      value.stpns
    end
  end # struct

  # Ethernet PTP time stamp high update          register
  struct PTPTSHUR
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

    # TSUS
    def tsus : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # TSUS
    def self.tsus : UInt32
      value.tsus
    end

    # TSUS
    def self.tsus=(value : UInt32) : UInt32
      self.set(tsus: value)
      value
    end

    def copy_with(
      *,

      tsus : UInt32? = nil
    ) : self
      value = @value

      unless tsus.nil?
        value = (value & 0xffffffff_u32) |
                UInt32.new!(tsus.to_int).&(0x0_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      tsus : UInt32? = nil
    ) : Nil
      self.value = self.value.copy_with(
        tsus: tsus,
      )
    end
  end # struct

  # Ethernet PTP time stamp low update          register
  struct PTPTSLUR
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

    # TSUSS
    def tsuss : UInt32
      UInt32.new!((@value >> 0) & 0x7fffffff_u32)
    end

    # TSUSS
    def self.tsuss : UInt32
      value.tsuss
    end

    # TSUSS
    def self.tsuss=(value : UInt32) : UInt32
      self.set(tsuss: value)
      value
    end

    # TSUSS
    def tsupns : Bool
      @value.bits_set?(0x80000000_u32)
    end

    # TSUSS
    def self.tsupns : Bool
      value.tsupns
    end

    # TSUSS
    def self.tsupns=(value : Bool) : Bool
      self.set(tsupns: value)
      value
    end

    def copy_with(
      *,

      tsuss : UInt32? = nil,

      tsupns : Bool? = nil
    ) : self
      value = @value

      unless tsuss.nil?
        value = (value & 0x80000000_u32) |
                UInt32.new!(tsuss.to_int).&(0x7fffffff_u32) << 0
      end

      unless tsupns.nil?
        value = (value & 0x7fffffff_u32) |
                UInt32.new!(tsupns.to_int).&(0x1_u32) << 31
      end

      self.class.new(value)
    end

    def self.set(
      *,
      tsuss : UInt32? = nil,
      tsupns : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        tsuss: tsuss,
        tsupns: tsupns,
      )
    end
  end # struct

  # Ethernet PTP time stamp addend          register
  struct PTPTSAR
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

    # TSA
    def tsa : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # TSA
    def self.tsa : UInt32
      value.tsa
    end

    # TSA
    def self.tsa=(value : UInt32) : UInt32
      self.set(tsa: value)
      value
    end

    def copy_with(
      *,

      tsa : UInt32? = nil
    ) : self
      value = @value

      unless tsa.nil?
        value = (value & 0xffffffff_u32) |
                UInt32.new!(tsa.to_int).&(0x0_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      tsa : UInt32? = nil
    ) : Nil
      self.value = self.value.copy_with(
        tsa: tsa,
      )
    end
  end # struct

  # Ethernet PTP target time high          register
  struct PTPTTHR
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

    # 0
    def ttsh : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # 0
    def self.ttsh : UInt32
      value.ttsh
    end

    # 0
    def self.ttsh=(value : UInt32) : UInt32
      self.set(ttsh: value)
      value
    end

    def copy_with(
      *,

      ttsh : UInt32? = nil
    ) : self
      value = @value

      unless ttsh.nil?
        value = (value & 0xffffffff_u32) |
                UInt32.new!(ttsh.to_int).&(0x0_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      ttsh : UInt32? = nil
    ) : Nil
      self.value = self.value.copy_with(
        ttsh: ttsh,
      )
    end
  end # struct

  # Ethernet PTP target time low          register
  struct PTPTTLR
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

    # TTSL
    def ttsl : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # TTSL
    def self.ttsl : UInt32
      value.ttsl
    end

    # TTSL
    def self.ttsl=(value : UInt32) : UInt32
      self.set(ttsl: value)
      value
    end

    def copy_with(
      *,

      ttsl : UInt32? = nil
    ) : self
      value = @value

      unless ttsl.nil?
        value = (value & 0xffffffff_u32) |
                UInt32.new!(ttsl.to_int).&(0x0_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      ttsl : UInt32? = nil
    ) : Nil
      self.value = self.value.copy_with(
        ttsl: ttsl,
      )
    end
  end # struct

  # Ethernet PTP time stamp status          register
  struct PTPTSSR
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

    # TSSO
    def tsso : Bool
      @value.bits_set?(0x1_u32)
    end

    # TSSO
    def self.tsso : Bool
      value.tsso
    end

    # TSTTR
    def tsttr : Bool
      @value.bits_set?(0x2_u32)
    end

    # TSTTR
    def self.tsttr : Bool
      value.tsttr
    end
  end # struct

  # Ethernet PTP PPS control          register
  struct PTPPPSCR
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

    # TSSO
    def tsso : Bool
      @value.bits_set?(0x1_u32)
    end

    # TSSO
    def self.tsso : Bool
      value.tsso
    end

    # TSTTR
    def tsttr : Bool
      @value.bits_set?(0x2_u32)
    end

    # TSTTR
    def self.tsttr : Bool
      value.tsttr
    end
  end # struct

end
