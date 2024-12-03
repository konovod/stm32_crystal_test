# Cryptographic processor
module CRYP
  VERSION      = nil
  BASE_ADDRESS = 0x50060000_u64

  # control register
  struct CR
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

    # Algorithm direction
    def algodir : Bool
      @value.bits_set?(0x4_u32)
    end

    # Algorithm direction
    def self.algodir : Bool
      value.algodir
    end

    # Algorithm direction
    def self.algodir=(value : Bool) : Bool
      self.set(algodir: value)
      value
    end

    # Algorithm mode
    def algomode0 : UInt8
      UInt8.new!((@value >> 3) & 0x7_u32)
    end

    # Algorithm mode
    def self.algomode0 : UInt8
      value.algomode0
    end

    # Algorithm mode
    def self.algomode0=(value : UInt8) : UInt8
      self.set(algomode0: value)
      value
    end

    # Data type selection
    def datatype : UInt8
      UInt8.new!((@value >> 6) & 0x3_u32)
    end

    # Data type selection
    def self.datatype : UInt8
      value.datatype
    end

    # Data type selection
    def self.datatype=(value : UInt8) : UInt8
      self.set(datatype: value)
      value
    end

    # Key size selection (AES mode              only)
    def keysize : UInt8
      UInt8.new!((@value >> 8) & 0x3_u32)
    end

    # Key size selection (AES mode              only)
    def self.keysize : UInt8
      value.keysize
    end

    # Key size selection (AES mode              only)
    def self.keysize=(value : UInt8) : UInt8
      self.set(keysize: value)
      value
    end

    # FIFO flush
    def self.fflush=(value : Bool) : Bool
      self.set(fflush: value)
      value
    end

    # Cryptographic processor              enable
    def en : Bool
      @value.bits_set?(0x8000_u32)
    end

    # Cryptographic processor              enable
    def self.en : Bool
      value.en
    end

    # Cryptographic processor              enable
    def self.en=(value : Bool) : Bool
      self.set(en: value)
      value
    end

    # GCM_CCMPH
    def gcm_ccmph : UInt8
      UInt8.new!((@value >> 16) & 0x3_u32)
    end

    # GCM_CCMPH
    def self.gcm_ccmph : UInt8
      value.gcm_ccmph
    end

    # GCM_CCMPH
    def self.gcm_ccmph=(value : UInt8) : UInt8
      self.set(gcm_ccmph: value)
      value
    end

    # ALGOMODE
    def algomode3 : Bool
      @value.bits_set?(0x80000_u32)
    end

    # ALGOMODE
    def self.algomode3 : Bool
      value.algomode3
    end

    # ALGOMODE
    def self.algomode3=(value : Bool) : Bool
      self.set(algomode3: value)
      value
    end

    def copy_with(
      *,

      algodir : Bool? = nil,

      algomode0 : UInt8? = nil,

      datatype : UInt8? = nil,

      keysize : UInt8? = nil,

      fflush : Bool? = nil,

      en : Bool? = nil,

      gcm_ccmph : UInt8? = nil,

      algomode3 : Bool? = nil
    ) : self
      value = @value

      unless algodir.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(algodir.to_int).&(0x1_u32) << 2
      end

      unless algomode0.nil?
        value = (value & 0xffffffc7_u32) |
                UInt32.new!(algomode0.to_int).&(0x7_u32) << 3
      end

      unless datatype.nil?
        value = (value & 0xffffff3f_u32) |
                UInt32.new!(datatype.to_int).&(0x3_u32) << 6
      end

      unless keysize.nil?
        value = (value & 0xfffffcff_u32) |
                UInt32.new!(keysize.to_int).&(0x3_u32) << 8
      end

      unless fflush.nil?
        value = (value & 0xffffbfff_u32) |
                UInt32.new!(fflush.to_int).&(0x1_u32) << 14
      end

      unless en.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(en.to_int).&(0x1_u32) << 15
      end

      unless gcm_ccmph.nil?
        value = (value & 0xfffcffff_u32) |
                UInt32.new!(gcm_ccmph.to_int).&(0x3_u32) << 16
      end

      unless algomode3.nil?
        value = (value & 0xfff7ffff_u32) |
                UInt32.new!(algomode3.to_int).&(0x1_u32) << 19
      end

      self.class.new(value)
    end

    def self.set(
      *,
      algodir : Bool? = nil,
      algomode0 : UInt8? = nil,
      datatype : UInt8? = nil,
      keysize : UInt8? = nil,
      fflush : Bool? = nil,
      en : Bool? = nil,
      gcm_ccmph : UInt8? = nil,
      algomode3 : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        algodir: algodir,
        algomode0: algomode0,
        datatype: datatype,
        keysize: keysize,
        fflush: fflush,
        en: en,
        gcm_ccmph: gcm_ccmph,
        algomode3: algomode3,
      )
    end
  end # struct

  # status register
  struct SR
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
      new(0x3_u64)
    end

    def self.pointer : Pointer(UInt32)
      Pointer(UInt32).new(self.address)
    end

    def self.value : self
      value = self.pointer.load(volatile: true)
      new(value)
    end

    def self.value=(value : self) : self
      self.pointer.store(value.to_int, volatile: true)
      value
    end

    # Busy bit
    def busy : Bool
      @value.bits_set?(0x10_u32)
    end

    # Busy bit
    def self.busy : Bool
      value.busy
    end

    # Output FIFO full
    def offu : Bool
      @value.bits_set?(0x8_u32)
    end

    # Output FIFO full
    def self.offu : Bool
      value.offu
    end

    # Output FIFO not empty
    def ofne : Bool
      @value.bits_set?(0x4_u32)
    end

    # Output FIFO not empty
    def self.ofne : Bool
      value.ofne
    end

    # Input FIFO not full
    def ifnf : Bool
      @value.bits_set?(0x2_u32)
    end

    # Input FIFO not full
    def self.ifnf : Bool
      value.ifnf
    end

    # Input FIFO empty
    def ifem : Bool
      @value.bits_set?(0x1_u32)
    end

    # Input FIFO empty
    def self.ifem : Bool
      value.ifem
    end
  end # struct

  # data input register
  struct DIN
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

    # Data input
    def datain : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # Data input
    def self.datain : UInt32
      value.datain
    end

    # Data input
    def self.datain=(value : UInt32) : UInt32
      self.set(datain: value)
      value
    end

    def copy_with(
      *,

      datain : UInt32? = nil
    ) : self
      value = @value

      unless datain.nil?
        value = (value & 0xffffffff_u32) |
                UInt32.new!(datain.to_int).&(0x0_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      datain : UInt32? = nil
    ) : Nil
      self.value = self.value.copy_with(
        datain: datain,
      )
    end
  end # struct

  # data output register
  struct DOUT
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

    # Data output
    def dataout : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # Data output
    def self.dataout : UInt32
      value.dataout
    end
  end # struct

  # DMA control register
  struct DMACR
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

    # DMA output enable
    def doen : Bool
      @value.bits_set?(0x2_u32)
    end

    # DMA output enable
    def self.doen : Bool
      value.doen
    end

    # DMA output enable
    def self.doen=(value : Bool) : Bool
      self.set(doen: value)
      value
    end

    # DMA input enable
    def dien : Bool
      @value.bits_set?(0x1_u32)
    end

    # DMA input enable
    def self.dien : Bool
      value.dien
    end

    # DMA input enable
    def self.dien=(value : Bool) : Bool
      self.set(dien: value)
      value
    end

    def copy_with(
      *,

      doen : Bool? = nil,

      dien : Bool? = nil
    ) : self
      value = @value

      unless doen.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(doen.to_int).&(0x1_u32) << 1
      end

      unless dien.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(dien.to_int).&(0x1_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      doen : Bool? = nil,
      dien : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        doen: doen,
        dien: dien,
      )
    end
  end # struct

  # interrupt mask set/clear          register
  struct IMSCR
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

    # Output FIFO service interrupt              mask
    def outim : Bool
      @value.bits_set?(0x2_u32)
    end

    # Output FIFO service interrupt              mask
    def self.outim : Bool
      value.outim
    end

    # Output FIFO service interrupt              mask
    def self.outim=(value : Bool) : Bool
      self.set(outim: value)
      value
    end

    # Input FIFO service interrupt              mask
    def inim : Bool
      @value.bits_set?(0x1_u32)
    end

    # Input FIFO service interrupt              mask
    def self.inim : Bool
      value.inim
    end

    # Input FIFO service interrupt              mask
    def self.inim=(value : Bool) : Bool
      self.set(inim: value)
      value
    end

    def copy_with(
      *,

      outim : Bool? = nil,

      inim : Bool? = nil
    ) : self
      value = @value

      unless outim.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(outim.to_int).&(0x1_u32) << 1
      end

      unless inim.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(inim.to_int).&(0x1_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      outim : Bool? = nil,
      inim : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        outim: outim,
        inim: inim,
      )
    end
  end # struct

  # raw interrupt status register
  struct RISR
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
      new(0x1_u64)
    end

    def self.pointer : Pointer(UInt32)
      Pointer(UInt32).new(self.address)
    end

    def self.value : self
      value = self.pointer.load(volatile: true)
      new(value)
    end

    def self.value=(value : self) : self
      self.pointer.store(value.to_int, volatile: true)
      value
    end

    # Output FIFO service raw interrupt              status
    def outris : Bool
      @value.bits_set?(0x2_u32)
    end

    # Output FIFO service raw interrupt              status
    def self.outris : Bool
      value.outris
    end

    # Input FIFO service raw interrupt              status
    def inris : Bool
      @value.bits_set?(0x1_u32)
    end

    # Input FIFO service raw interrupt              status
    def self.inris : Bool
      value.inris
    end
  end # struct

  # masked interrupt status          register
  struct MISR
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

    # Output FIFO service masked interrupt              status
    def outmis : Bool
      @value.bits_set?(0x2_u32)
    end

    # Output FIFO service masked interrupt              status
    def self.outmis : Bool
      value.outmis
    end

    # Input FIFO service masked interrupt              status
    def inmis : Bool
      @value.bits_set?(0x1_u32)
    end

    # Input FIFO service masked interrupt              status
    def self.inmis : Bool
      value.inmis
    end
  end # struct

  # key registers
  struct K0LR
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

    # b224
    def self.b224=(value : Bool) : Bool
      self.set(b224: value)
      value
    end

    # b225
    def self.b225=(value : Bool) : Bool
      self.set(b225: value)
      value
    end

    # b226
    def self.b226=(value : Bool) : Bool
      self.set(b226: value)
      value
    end

    # b227
    def self.b227=(value : Bool) : Bool
      self.set(b227: value)
      value
    end

    # b228
    def self.b228=(value : Bool) : Bool
      self.set(b228: value)
      value
    end

    # b229
    def self.b229=(value : Bool) : Bool
      self.set(b229: value)
      value
    end

    # b230
    def self.b230=(value : Bool) : Bool
      self.set(b230: value)
      value
    end

    # b231
    def self.b231=(value : Bool) : Bool
      self.set(b231: value)
      value
    end

    # b232
    def self.b232=(value : Bool) : Bool
      self.set(b232: value)
      value
    end

    # b233
    def self.b233=(value : Bool) : Bool
      self.set(b233: value)
      value
    end

    # b234
    def self.b234=(value : Bool) : Bool
      self.set(b234: value)
      value
    end

    # b235
    def self.b235=(value : Bool) : Bool
      self.set(b235: value)
      value
    end

    # b236
    def self.b236=(value : Bool) : Bool
      self.set(b236: value)
      value
    end

    # b237
    def self.b237=(value : Bool) : Bool
      self.set(b237: value)
      value
    end

    # b238
    def self.b238=(value : Bool) : Bool
      self.set(b238: value)
      value
    end

    # b239
    def self.b239=(value : Bool) : Bool
      self.set(b239: value)
      value
    end

    # b240
    def self.b240=(value : Bool) : Bool
      self.set(b240: value)
      value
    end

    # b241
    def self.b241=(value : Bool) : Bool
      self.set(b241: value)
      value
    end

    # b242
    def self.b242=(value : Bool) : Bool
      self.set(b242: value)
      value
    end

    # b243
    def self.b243=(value : Bool) : Bool
      self.set(b243: value)
      value
    end

    # b244
    def self.b244=(value : Bool) : Bool
      self.set(b244: value)
      value
    end

    # b245
    def self.b245=(value : Bool) : Bool
      self.set(b245: value)
      value
    end

    # b246
    def self.b246=(value : Bool) : Bool
      self.set(b246: value)
      value
    end

    # b247
    def self.b247=(value : Bool) : Bool
      self.set(b247: value)
      value
    end

    # b248
    def self.b248=(value : Bool) : Bool
      self.set(b248: value)
      value
    end

    # b249
    def self.b249=(value : Bool) : Bool
      self.set(b249: value)
      value
    end

    # b250
    def self.b250=(value : Bool) : Bool
      self.set(b250: value)
      value
    end

    # b251
    def self.b251=(value : Bool) : Bool
      self.set(b251: value)
      value
    end

    # b252
    def self.b252=(value : Bool) : Bool
      self.set(b252: value)
      value
    end

    # b253
    def self.b253=(value : Bool) : Bool
      self.set(b253: value)
      value
    end

    # b254
    def self.b254=(value : Bool) : Bool
      self.set(b254: value)
      value
    end

    # b255
    def self.b255=(value : Bool) : Bool
      self.set(b255: value)
      value
    end

    def copy_with(
      *,

      b224 : Bool? = nil,

      b225 : Bool? = nil,

      b226 : Bool? = nil,

      b227 : Bool? = nil,

      b228 : Bool? = nil,

      b229 : Bool? = nil,

      b230 : Bool? = nil,

      b231 : Bool? = nil,

      b232 : Bool? = nil,

      b233 : Bool? = nil,

      b234 : Bool? = nil,

      b235 : Bool? = nil,

      b236 : Bool? = nil,

      b237 : Bool? = nil,

      b238 : Bool? = nil,

      b239 : Bool? = nil,

      b240 : Bool? = nil,

      b241 : Bool? = nil,

      b242 : Bool? = nil,

      b243 : Bool? = nil,

      b244 : Bool? = nil,

      b245 : Bool? = nil,

      b246 : Bool? = nil,

      b247 : Bool? = nil,

      b248 : Bool? = nil,

      b249 : Bool? = nil,

      b250 : Bool? = nil,

      b251 : Bool? = nil,

      b252 : Bool? = nil,

      b253 : Bool? = nil,

      b254 : Bool? = nil,

      b255 : Bool? = nil
    ) : self
      value = @value

      unless b224.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(b224.to_int).&(0x1_u32) << 0
      end

      unless b225.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(b225.to_int).&(0x1_u32) << 1
      end

      unless b226.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(b226.to_int).&(0x1_u32) << 2
      end

      unless b227.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(b227.to_int).&(0x1_u32) << 3
      end

      unless b228.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(b228.to_int).&(0x1_u32) << 4
      end

      unless b229.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(b229.to_int).&(0x1_u32) << 5
      end

      unless b230.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(b230.to_int).&(0x1_u32) << 6
      end

      unless b231.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(b231.to_int).&(0x1_u32) << 7
      end

      unless b232.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(b232.to_int).&(0x1_u32) << 8
      end

      unless b233.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(b233.to_int).&(0x1_u32) << 9
      end

      unless b234.nil?
        value = (value & 0xfffffbff_u32) |
                UInt32.new!(b234.to_int).&(0x1_u32) << 10
      end

      unless b235.nil?
        value = (value & 0xfffff7ff_u32) |
                UInt32.new!(b235.to_int).&(0x1_u32) << 11
      end

      unless b236.nil?
        value = (value & 0xffffefff_u32) |
                UInt32.new!(b236.to_int).&(0x1_u32) << 12
      end

      unless b237.nil?
        value = (value & 0xffffdfff_u32) |
                UInt32.new!(b237.to_int).&(0x1_u32) << 13
      end

      unless b238.nil?
        value = (value & 0xffffbfff_u32) |
                UInt32.new!(b238.to_int).&(0x1_u32) << 14
      end

      unless b239.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(b239.to_int).&(0x1_u32) << 15
      end

      unless b240.nil?
        value = (value & 0xfffeffff_u32) |
                UInt32.new!(b240.to_int).&(0x1_u32) << 16
      end

      unless b241.nil?
        value = (value & 0xfffdffff_u32) |
                UInt32.new!(b241.to_int).&(0x1_u32) << 17
      end

      unless b242.nil?
        value = (value & 0xfffbffff_u32) |
                UInt32.new!(b242.to_int).&(0x1_u32) << 18
      end

      unless b243.nil?
        value = (value & 0xfff7ffff_u32) |
                UInt32.new!(b243.to_int).&(0x1_u32) << 19
      end

      unless b244.nil?
        value = (value & 0xffefffff_u32) |
                UInt32.new!(b244.to_int).&(0x1_u32) << 20
      end

      unless b245.nil?
        value = (value & 0xffdfffff_u32) |
                UInt32.new!(b245.to_int).&(0x1_u32) << 21
      end

      unless b246.nil?
        value = (value & 0xffbfffff_u32) |
                UInt32.new!(b246.to_int).&(0x1_u32) << 22
      end

      unless b247.nil?
        value = (value & 0xff7fffff_u32) |
                UInt32.new!(b247.to_int).&(0x1_u32) << 23
      end

      unless b248.nil?
        value = (value & 0xfeffffff_u32) |
                UInt32.new!(b248.to_int).&(0x1_u32) << 24
      end

      unless b249.nil?
        value = (value & 0xfdffffff_u32) |
                UInt32.new!(b249.to_int).&(0x1_u32) << 25
      end

      unless b250.nil?
        value = (value & 0xfbffffff_u32) |
                UInt32.new!(b250.to_int).&(0x1_u32) << 26
      end

      unless b251.nil?
        value = (value & 0xf7ffffff_u32) |
                UInt32.new!(b251.to_int).&(0x1_u32) << 27
      end

      unless b252.nil?
        value = (value & 0xefffffff_u32) |
                UInt32.new!(b252.to_int).&(0x1_u32) << 28
      end

      unless b253.nil?
        value = (value & 0xdfffffff_u32) |
                UInt32.new!(b253.to_int).&(0x1_u32) << 29
      end

      unless b254.nil?
        value = (value & 0xbfffffff_u32) |
                UInt32.new!(b254.to_int).&(0x1_u32) << 30
      end

      unless b255.nil?
        value = (value & 0x7fffffff_u32) |
                UInt32.new!(b255.to_int).&(0x1_u32) << 31
      end

      self.class.new(value)
    end

    def self.set(
      *,
      b224 : Bool? = nil,
      b225 : Bool? = nil,
      b226 : Bool? = nil,
      b227 : Bool? = nil,
      b228 : Bool? = nil,
      b229 : Bool? = nil,
      b230 : Bool? = nil,
      b231 : Bool? = nil,
      b232 : Bool? = nil,
      b233 : Bool? = nil,
      b234 : Bool? = nil,
      b235 : Bool? = nil,
      b236 : Bool? = nil,
      b237 : Bool? = nil,
      b238 : Bool? = nil,
      b239 : Bool? = nil,
      b240 : Bool? = nil,
      b241 : Bool? = nil,
      b242 : Bool? = nil,
      b243 : Bool? = nil,
      b244 : Bool? = nil,
      b245 : Bool? = nil,
      b246 : Bool? = nil,
      b247 : Bool? = nil,
      b248 : Bool? = nil,
      b249 : Bool? = nil,
      b250 : Bool? = nil,
      b251 : Bool? = nil,
      b252 : Bool? = nil,
      b253 : Bool? = nil,
      b254 : Bool? = nil,
      b255 : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        b224: b224,
        b225: b225,
        b226: b226,
        b227: b227,
        b228: b228,
        b229: b229,
        b230: b230,
        b231: b231,
        b232: b232,
        b233: b233,
        b234: b234,
        b235: b235,
        b236: b236,
        b237: b237,
        b238: b238,
        b239: b239,
        b240: b240,
        b241: b241,
        b242: b242,
        b243: b243,
        b244: b244,
        b245: b245,
        b246: b246,
        b247: b247,
        b248: b248,
        b249: b249,
        b250: b250,
        b251: b251,
        b252: b252,
        b253: b253,
        b254: b254,
        b255: b255,
      )
    end
  end # struct

  # key registers
  struct K0RR
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

    # b192
    def self.b192=(value : Bool) : Bool
      self.set(b192: value)
      value
    end

    # b193
    def self.b193=(value : Bool) : Bool
      self.set(b193: value)
      value
    end

    # b194
    def self.b194=(value : Bool) : Bool
      self.set(b194: value)
      value
    end

    # b195
    def self.b195=(value : Bool) : Bool
      self.set(b195: value)
      value
    end

    # b196
    def self.b196=(value : Bool) : Bool
      self.set(b196: value)
      value
    end

    # b197
    def self.b197=(value : Bool) : Bool
      self.set(b197: value)
      value
    end

    # b198
    def self.b198=(value : Bool) : Bool
      self.set(b198: value)
      value
    end

    # b199
    def self.b199=(value : Bool) : Bool
      self.set(b199: value)
      value
    end

    # b200
    def self.b200=(value : Bool) : Bool
      self.set(b200: value)
      value
    end

    # b201
    def self.b201=(value : Bool) : Bool
      self.set(b201: value)
      value
    end

    # b202
    def self.b202=(value : Bool) : Bool
      self.set(b202: value)
      value
    end

    # b203
    def self.b203=(value : Bool) : Bool
      self.set(b203: value)
      value
    end

    # b204
    def self.b204=(value : Bool) : Bool
      self.set(b204: value)
      value
    end

    # b205
    def self.b205=(value : Bool) : Bool
      self.set(b205: value)
      value
    end

    # b206
    def self.b206=(value : Bool) : Bool
      self.set(b206: value)
      value
    end

    # b207
    def self.b207=(value : Bool) : Bool
      self.set(b207: value)
      value
    end

    # b208
    def self.b208=(value : Bool) : Bool
      self.set(b208: value)
      value
    end

    # b209
    def self.b209=(value : Bool) : Bool
      self.set(b209: value)
      value
    end

    # b210
    def self.b210=(value : Bool) : Bool
      self.set(b210: value)
      value
    end

    # b211
    def self.b211=(value : Bool) : Bool
      self.set(b211: value)
      value
    end

    # b212
    def self.b212=(value : Bool) : Bool
      self.set(b212: value)
      value
    end

    # b213
    def self.b213=(value : Bool) : Bool
      self.set(b213: value)
      value
    end

    # b214
    def self.b214=(value : Bool) : Bool
      self.set(b214: value)
      value
    end

    # b215
    def self.b215=(value : Bool) : Bool
      self.set(b215: value)
      value
    end

    # b216
    def self.b216=(value : Bool) : Bool
      self.set(b216: value)
      value
    end

    # b217
    def self.b217=(value : Bool) : Bool
      self.set(b217: value)
      value
    end

    # b218
    def self.b218=(value : Bool) : Bool
      self.set(b218: value)
      value
    end

    # b219
    def self.b219=(value : Bool) : Bool
      self.set(b219: value)
      value
    end

    # b220
    def self.b220=(value : Bool) : Bool
      self.set(b220: value)
      value
    end

    # b221
    def self.b221=(value : Bool) : Bool
      self.set(b221: value)
      value
    end

    # b222
    def self.b222=(value : Bool) : Bool
      self.set(b222: value)
      value
    end

    # b223
    def self.b223=(value : Bool) : Bool
      self.set(b223: value)
      value
    end

    def copy_with(
      *,

      b192 : Bool? = nil,

      b193 : Bool? = nil,

      b194 : Bool? = nil,

      b195 : Bool? = nil,

      b196 : Bool? = nil,

      b197 : Bool? = nil,

      b198 : Bool? = nil,

      b199 : Bool? = nil,

      b200 : Bool? = nil,

      b201 : Bool? = nil,

      b202 : Bool? = nil,

      b203 : Bool? = nil,

      b204 : Bool? = nil,

      b205 : Bool? = nil,

      b206 : Bool? = nil,

      b207 : Bool? = nil,

      b208 : Bool? = nil,

      b209 : Bool? = nil,

      b210 : Bool? = nil,

      b211 : Bool? = nil,

      b212 : Bool? = nil,

      b213 : Bool? = nil,

      b214 : Bool? = nil,

      b215 : Bool? = nil,

      b216 : Bool? = nil,

      b217 : Bool? = nil,

      b218 : Bool? = nil,

      b219 : Bool? = nil,

      b220 : Bool? = nil,

      b221 : Bool? = nil,

      b222 : Bool? = nil,

      b223 : Bool? = nil
    ) : self
      value = @value

      unless b192.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(b192.to_int).&(0x1_u32) << 0
      end

      unless b193.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(b193.to_int).&(0x1_u32) << 1
      end

      unless b194.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(b194.to_int).&(0x1_u32) << 2
      end

      unless b195.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(b195.to_int).&(0x1_u32) << 3
      end

      unless b196.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(b196.to_int).&(0x1_u32) << 4
      end

      unless b197.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(b197.to_int).&(0x1_u32) << 5
      end

      unless b198.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(b198.to_int).&(0x1_u32) << 6
      end

      unless b199.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(b199.to_int).&(0x1_u32) << 7
      end

      unless b200.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(b200.to_int).&(0x1_u32) << 8
      end

      unless b201.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(b201.to_int).&(0x1_u32) << 9
      end

      unless b202.nil?
        value = (value & 0xfffffbff_u32) |
                UInt32.new!(b202.to_int).&(0x1_u32) << 10
      end

      unless b203.nil?
        value = (value & 0xfffff7ff_u32) |
                UInt32.new!(b203.to_int).&(0x1_u32) << 11
      end

      unless b204.nil?
        value = (value & 0xffffefff_u32) |
                UInt32.new!(b204.to_int).&(0x1_u32) << 12
      end

      unless b205.nil?
        value = (value & 0xffffdfff_u32) |
                UInt32.new!(b205.to_int).&(0x1_u32) << 13
      end

      unless b206.nil?
        value = (value & 0xffffbfff_u32) |
                UInt32.new!(b206.to_int).&(0x1_u32) << 14
      end

      unless b207.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(b207.to_int).&(0x1_u32) << 15
      end

      unless b208.nil?
        value = (value & 0xfffeffff_u32) |
                UInt32.new!(b208.to_int).&(0x1_u32) << 16
      end

      unless b209.nil?
        value = (value & 0xfffdffff_u32) |
                UInt32.new!(b209.to_int).&(0x1_u32) << 17
      end

      unless b210.nil?
        value = (value & 0xfffbffff_u32) |
                UInt32.new!(b210.to_int).&(0x1_u32) << 18
      end

      unless b211.nil?
        value = (value & 0xfff7ffff_u32) |
                UInt32.new!(b211.to_int).&(0x1_u32) << 19
      end

      unless b212.nil?
        value = (value & 0xffefffff_u32) |
                UInt32.new!(b212.to_int).&(0x1_u32) << 20
      end

      unless b213.nil?
        value = (value & 0xffdfffff_u32) |
                UInt32.new!(b213.to_int).&(0x1_u32) << 21
      end

      unless b214.nil?
        value = (value & 0xffbfffff_u32) |
                UInt32.new!(b214.to_int).&(0x1_u32) << 22
      end

      unless b215.nil?
        value = (value & 0xff7fffff_u32) |
                UInt32.new!(b215.to_int).&(0x1_u32) << 23
      end

      unless b216.nil?
        value = (value & 0xfeffffff_u32) |
                UInt32.new!(b216.to_int).&(0x1_u32) << 24
      end

      unless b217.nil?
        value = (value & 0xfdffffff_u32) |
                UInt32.new!(b217.to_int).&(0x1_u32) << 25
      end

      unless b218.nil?
        value = (value & 0xfbffffff_u32) |
                UInt32.new!(b218.to_int).&(0x1_u32) << 26
      end

      unless b219.nil?
        value = (value & 0xf7ffffff_u32) |
                UInt32.new!(b219.to_int).&(0x1_u32) << 27
      end

      unless b220.nil?
        value = (value & 0xefffffff_u32) |
                UInt32.new!(b220.to_int).&(0x1_u32) << 28
      end

      unless b221.nil?
        value = (value & 0xdfffffff_u32) |
                UInt32.new!(b221.to_int).&(0x1_u32) << 29
      end

      unless b222.nil?
        value = (value & 0xbfffffff_u32) |
                UInt32.new!(b222.to_int).&(0x1_u32) << 30
      end

      unless b223.nil?
        value = (value & 0x7fffffff_u32) |
                UInt32.new!(b223.to_int).&(0x1_u32) << 31
      end

      self.class.new(value)
    end

    def self.set(
      *,
      b192 : Bool? = nil,
      b193 : Bool? = nil,
      b194 : Bool? = nil,
      b195 : Bool? = nil,
      b196 : Bool? = nil,
      b197 : Bool? = nil,
      b198 : Bool? = nil,
      b199 : Bool? = nil,
      b200 : Bool? = nil,
      b201 : Bool? = nil,
      b202 : Bool? = nil,
      b203 : Bool? = nil,
      b204 : Bool? = nil,
      b205 : Bool? = nil,
      b206 : Bool? = nil,
      b207 : Bool? = nil,
      b208 : Bool? = nil,
      b209 : Bool? = nil,
      b210 : Bool? = nil,
      b211 : Bool? = nil,
      b212 : Bool? = nil,
      b213 : Bool? = nil,
      b214 : Bool? = nil,
      b215 : Bool? = nil,
      b216 : Bool? = nil,
      b217 : Bool? = nil,
      b218 : Bool? = nil,
      b219 : Bool? = nil,
      b220 : Bool? = nil,
      b221 : Bool? = nil,
      b222 : Bool? = nil,
      b223 : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        b192: b192,
        b193: b193,
        b194: b194,
        b195: b195,
        b196: b196,
        b197: b197,
        b198: b198,
        b199: b199,
        b200: b200,
        b201: b201,
        b202: b202,
        b203: b203,
        b204: b204,
        b205: b205,
        b206: b206,
        b207: b207,
        b208: b208,
        b209: b209,
        b210: b210,
        b211: b211,
        b212: b212,
        b213: b213,
        b214: b214,
        b215: b215,
        b216: b216,
        b217: b217,
        b218: b218,
        b219: b219,
        b220: b220,
        b221: b221,
        b222: b222,
        b223: b223,
      )
    end
  end # struct

  # key registers
  struct K1LR
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

    # b160
    def self.b160=(value : Bool) : Bool
      self.set(b160: value)
      value
    end

    # b161
    def self.b161=(value : Bool) : Bool
      self.set(b161: value)
      value
    end

    # b162
    def self.b162=(value : Bool) : Bool
      self.set(b162: value)
      value
    end

    # b163
    def self.b163=(value : Bool) : Bool
      self.set(b163: value)
      value
    end

    # b164
    def self.b164=(value : Bool) : Bool
      self.set(b164: value)
      value
    end

    # b165
    def self.b165=(value : Bool) : Bool
      self.set(b165: value)
      value
    end

    # b166
    def self.b166=(value : Bool) : Bool
      self.set(b166: value)
      value
    end

    # b167
    def self.b167=(value : Bool) : Bool
      self.set(b167: value)
      value
    end

    # b168
    def self.b168=(value : Bool) : Bool
      self.set(b168: value)
      value
    end

    # b169
    def self.b169=(value : Bool) : Bool
      self.set(b169: value)
      value
    end

    # b170
    def self.b170=(value : Bool) : Bool
      self.set(b170: value)
      value
    end

    # b171
    def self.b171=(value : Bool) : Bool
      self.set(b171: value)
      value
    end

    # b172
    def self.b172=(value : Bool) : Bool
      self.set(b172: value)
      value
    end

    # b173
    def self.b173=(value : Bool) : Bool
      self.set(b173: value)
      value
    end

    # b174
    def self.b174=(value : Bool) : Bool
      self.set(b174: value)
      value
    end

    # b175
    def self.b175=(value : Bool) : Bool
      self.set(b175: value)
      value
    end

    # b176
    def self.b176=(value : Bool) : Bool
      self.set(b176: value)
      value
    end

    # b177
    def self.b177=(value : Bool) : Bool
      self.set(b177: value)
      value
    end

    # b178
    def self.b178=(value : Bool) : Bool
      self.set(b178: value)
      value
    end

    # b179
    def self.b179=(value : Bool) : Bool
      self.set(b179: value)
      value
    end

    # b180
    def self.b180=(value : Bool) : Bool
      self.set(b180: value)
      value
    end

    # b181
    def self.b181=(value : Bool) : Bool
      self.set(b181: value)
      value
    end

    # b182
    def self.b182=(value : Bool) : Bool
      self.set(b182: value)
      value
    end

    # b183
    def self.b183=(value : Bool) : Bool
      self.set(b183: value)
      value
    end

    # b184
    def self.b184=(value : Bool) : Bool
      self.set(b184: value)
      value
    end

    # b185
    def self.b185=(value : Bool) : Bool
      self.set(b185: value)
      value
    end

    # b186
    def self.b186=(value : Bool) : Bool
      self.set(b186: value)
      value
    end

    # b187
    def self.b187=(value : Bool) : Bool
      self.set(b187: value)
      value
    end

    # b188
    def self.b188=(value : Bool) : Bool
      self.set(b188: value)
      value
    end

    # b189
    def self.b189=(value : Bool) : Bool
      self.set(b189: value)
      value
    end

    # b190
    def self.b190=(value : Bool) : Bool
      self.set(b190: value)
      value
    end

    # b191
    def self.b191=(value : Bool) : Bool
      self.set(b191: value)
      value
    end

    def copy_with(
      *,

      b160 : Bool? = nil,

      b161 : Bool? = nil,

      b162 : Bool? = nil,

      b163 : Bool? = nil,

      b164 : Bool? = nil,

      b165 : Bool? = nil,

      b166 : Bool? = nil,

      b167 : Bool? = nil,

      b168 : Bool? = nil,

      b169 : Bool? = nil,

      b170 : Bool? = nil,

      b171 : Bool? = nil,

      b172 : Bool? = nil,

      b173 : Bool? = nil,

      b174 : Bool? = nil,

      b175 : Bool? = nil,

      b176 : Bool? = nil,

      b177 : Bool? = nil,

      b178 : Bool? = nil,

      b179 : Bool? = nil,

      b180 : Bool? = nil,

      b181 : Bool? = nil,

      b182 : Bool? = nil,

      b183 : Bool? = nil,

      b184 : Bool? = nil,

      b185 : Bool? = nil,

      b186 : Bool? = nil,

      b187 : Bool? = nil,

      b188 : Bool? = nil,

      b189 : Bool? = nil,

      b190 : Bool? = nil,

      b191 : Bool? = nil
    ) : self
      value = @value

      unless b160.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(b160.to_int).&(0x1_u32) << 0
      end

      unless b161.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(b161.to_int).&(0x1_u32) << 1
      end

      unless b162.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(b162.to_int).&(0x1_u32) << 2
      end

      unless b163.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(b163.to_int).&(0x1_u32) << 3
      end

      unless b164.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(b164.to_int).&(0x1_u32) << 4
      end

      unless b165.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(b165.to_int).&(0x1_u32) << 5
      end

      unless b166.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(b166.to_int).&(0x1_u32) << 6
      end

      unless b167.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(b167.to_int).&(0x1_u32) << 7
      end

      unless b168.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(b168.to_int).&(0x1_u32) << 8
      end

      unless b169.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(b169.to_int).&(0x1_u32) << 9
      end

      unless b170.nil?
        value = (value & 0xfffffbff_u32) |
                UInt32.new!(b170.to_int).&(0x1_u32) << 10
      end

      unless b171.nil?
        value = (value & 0xfffff7ff_u32) |
                UInt32.new!(b171.to_int).&(0x1_u32) << 11
      end

      unless b172.nil?
        value = (value & 0xffffefff_u32) |
                UInt32.new!(b172.to_int).&(0x1_u32) << 12
      end

      unless b173.nil?
        value = (value & 0xffffdfff_u32) |
                UInt32.new!(b173.to_int).&(0x1_u32) << 13
      end

      unless b174.nil?
        value = (value & 0xffffbfff_u32) |
                UInt32.new!(b174.to_int).&(0x1_u32) << 14
      end

      unless b175.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(b175.to_int).&(0x1_u32) << 15
      end

      unless b176.nil?
        value = (value & 0xfffeffff_u32) |
                UInt32.new!(b176.to_int).&(0x1_u32) << 16
      end

      unless b177.nil?
        value = (value & 0xfffdffff_u32) |
                UInt32.new!(b177.to_int).&(0x1_u32) << 17
      end

      unless b178.nil?
        value = (value & 0xfffbffff_u32) |
                UInt32.new!(b178.to_int).&(0x1_u32) << 18
      end

      unless b179.nil?
        value = (value & 0xfff7ffff_u32) |
                UInt32.new!(b179.to_int).&(0x1_u32) << 19
      end

      unless b180.nil?
        value = (value & 0xffefffff_u32) |
                UInt32.new!(b180.to_int).&(0x1_u32) << 20
      end

      unless b181.nil?
        value = (value & 0xffdfffff_u32) |
                UInt32.new!(b181.to_int).&(0x1_u32) << 21
      end

      unless b182.nil?
        value = (value & 0xffbfffff_u32) |
                UInt32.new!(b182.to_int).&(0x1_u32) << 22
      end

      unless b183.nil?
        value = (value & 0xff7fffff_u32) |
                UInt32.new!(b183.to_int).&(0x1_u32) << 23
      end

      unless b184.nil?
        value = (value & 0xfeffffff_u32) |
                UInt32.new!(b184.to_int).&(0x1_u32) << 24
      end

      unless b185.nil?
        value = (value & 0xfdffffff_u32) |
                UInt32.new!(b185.to_int).&(0x1_u32) << 25
      end

      unless b186.nil?
        value = (value & 0xfbffffff_u32) |
                UInt32.new!(b186.to_int).&(0x1_u32) << 26
      end

      unless b187.nil?
        value = (value & 0xf7ffffff_u32) |
                UInt32.new!(b187.to_int).&(0x1_u32) << 27
      end

      unless b188.nil?
        value = (value & 0xefffffff_u32) |
                UInt32.new!(b188.to_int).&(0x1_u32) << 28
      end

      unless b189.nil?
        value = (value & 0xdfffffff_u32) |
                UInt32.new!(b189.to_int).&(0x1_u32) << 29
      end

      unless b190.nil?
        value = (value & 0xbfffffff_u32) |
                UInt32.new!(b190.to_int).&(0x1_u32) << 30
      end

      unless b191.nil?
        value = (value & 0x7fffffff_u32) |
                UInt32.new!(b191.to_int).&(0x1_u32) << 31
      end

      self.class.new(value)
    end

    def self.set(
      *,
      b160 : Bool? = nil,
      b161 : Bool? = nil,
      b162 : Bool? = nil,
      b163 : Bool? = nil,
      b164 : Bool? = nil,
      b165 : Bool? = nil,
      b166 : Bool? = nil,
      b167 : Bool? = nil,
      b168 : Bool? = nil,
      b169 : Bool? = nil,
      b170 : Bool? = nil,
      b171 : Bool? = nil,
      b172 : Bool? = nil,
      b173 : Bool? = nil,
      b174 : Bool? = nil,
      b175 : Bool? = nil,
      b176 : Bool? = nil,
      b177 : Bool? = nil,
      b178 : Bool? = nil,
      b179 : Bool? = nil,
      b180 : Bool? = nil,
      b181 : Bool? = nil,
      b182 : Bool? = nil,
      b183 : Bool? = nil,
      b184 : Bool? = nil,
      b185 : Bool? = nil,
      b186 : Bool? = nil,
      b187 : Bool? = nil,
      b188 : Bool? = nil,
      b189 : Bool? = nil,
      b190 : Bool? = nil,
      b191 : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        b160: b160,
        b161: b161,
        b162: b162,
        b163: b163,
        b164: b164,
        b165: b165,
        b166: b166,
        b167: b167,
        b168: b168,
        b169: b169,
        b170: b170,
        b171: b171,
        b172: b172,
        b173: b173,
        b174: b174,
        b175: b175,
        b176: b176,
        b177: b177,
        b178: b178,
        b179: b179,
        b180: b180,
        b181: b181,
        b182: b182,
        b183: b183,
        b184: b184,
        b185: b185,
        b186: b186,
        b187: b187,
        b188: b188,
        b189: b189,
        b190: b190,
        b191: b191,
      )
    end
  end # struct

  # key registers
  struct K1RR
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

    # b128
    def self.b128=(value : Bool) : Bool
      self.set(b128: value)
      value
    end

    # b129
    def self.b129=(value : Bool) : Bool
      self.set(b129: value)
      value
    end

    # b130
    def self.b130=(value : Bool) : Bool
      self.set(b130: value)
      value
    end

    # b131
    def self.b131=(value : Bool) : Bool
      self.set(b131: value)
      value
    end

    # b132
    def self.b132=(value : Bool) : Bool
      self.set(b132: value)
      value
    end

    # b133
    def self.b133=(value : Bool) : Bool
      self.set(b133: value)
      value
    end

    # b134
    def self.b134=(value : Bool) : Bool
      self.set(b134: value)
      value
    end

    # b135
    def self.b135=(value : Bool) : Bool
      self.set(b135: value)
      value
    end

    # b136
    def self.b136=(value : Bool) : Bool
      self.set(b136: value)
      value
    end

    # b137
    def self.b137=(value : Bool) : Bool
      self.set(b137: value)
      value
    end

    # b138
    def self.b138=(value : Bool) : Bool
      self.set(b138: value)
      value
    end

    # b139
    def self.b139=(value : Bool) : Bool
      self.set(b139: value)
      value
    end

    # b140
    def self.b140=(value : Bool) : Bool
      self.set(b140: value)
      value
    end

    # b141
    def self.b141=(value : Bool) : Bool
      self.set(b141: value)
      value
    end

    # b142
    def self.b142=(value : Bool) : Bool
      self.set(b142: value)
      value
    end

    # b143
    def self.b143=(value : Bool) : Bool
      self.set(b143: value)
      value
    end

    # b144
    def self.b144=(value : Bool) : Bool
      self.set(b144: value)
      value
    end

    # b145
    def self.b145=(value : Bool) : Bool
      self.set(b145: value)
      value
    end

    # b146
    def self.b146=(value : Bool) : Bool
      self.set(b146: value)
      value
    end

    # b147
    def self.b147=(value : Bool) : Bool
      self.set(b147: value)
      value
    end

    # b148
    def self.b148=(value : Bool) : Bool
      self.set(b148: value)
      value
    end

    # b149
    def self.b149=(value : Bool) : Bool
      self.set(b149: value)
      value
    end

    # b150
    def self.b150=(value : Bool) : Bool
      self.set(b150: value)
      value
    end

    # b151
    def self.b151=(value : Bool) : Bool
      self.set(b151: value)
      value
    end

    # b152
    def self.b152=(value : Bool) : Bool
      self.set(b152: value)
      value
    end

    # b153
    def self.b153=(value : Bool) : Bool
      self.set(b153: value)
      value
    end

    # b154
    def self.b154=(value : Bool) : Bool
      self.set(b154: value)
      value
    end

    # b155
    def self.b155=(value : Bool) : Bool
      self.set(b155: value)
      value
    end

    # b156
    def self.b156=(value : Bool) : Bool
      self.set(b156: value)
      value
    end

    # b157
    def self.b157=(value : Bool) : Bool
      self.set(b157: value)
      value
    end

    # b158
    def self.b158=(value : Bool) : Bool
      self.set(b158: value)
      value
    end

    # b159
    def self.b159=(value : Bool) : Bool
      self.set(b159: value)
      value
    end

    def copy_with(
      *,

      b128 : Bool? = nil,

      b129 : Bool? = nil,

      b130 : Bool? = nil,

      b131 : Bool? = nil,

      b132 : Bool? = nil,

      b133 : Bool? = nil,

      b134 : Bool? = nil,

      b135 : Bool? = nil,

      b136 : Bool? = nil,

      b137 : Bool? = nil,

      b138 : Bool? = nil,

      b139 : Bool? = nil,

      b140 : Bool? = nil,

      b141 : Bool? = nil,

      b142 : Bool? = nil,

      b143 : Bool? = nil,

      b144 : Bool? = nil,

      b145 : Bool? = nil,

      b146 : Bool? = nil,

      b147 : Bool? = nil,

      b148 : Bool? = nil,

      b149 : Bool? = nil,

      b150 : Bool? = nil,

      b151 : Bool? = nil,

      b152 : Bool? = nil,

      b153 : Bool? = nil,

      b154 : Bool? = nil,

      b155 : Bool? = nil,

      b156 : Bool? = nil,

      b157 : Bool? = nil,

      b158 : Bool? = nil,

      b159 : Bool? = nil
    ) : self
      value = @value

      unless b128.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(b128.to_int).&(0x1_u32) << 0
      end

      unless b129.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(b129.to_int).&(0x1_u32) << 1
      end

      unless b130.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(b130.to_int).&(0x1_u32) << 2
      end

      unless b131.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(b131.to_int).&(0x1_u32) << 3
      end

      unless b132.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(b132.to_int).&(0x1_u32) << 4
      end

      unless b133.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(b133.to_int).&(0x1_u32) << 5
      end

      unless b134.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(b134.to_int).&(0x1_u32) << 6
      end

      unless b135.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(b135.to_int).&(0x1_u32) << 7
      end

      unless b136.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(b136.to_int).&(0x1_u32) << 8
      end

      unless b137.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(b137.to_int).&(0x1_u32) << 9
      end

      unless b138.nil?
        value = (value & 0xfffffbff_u32) |
                UInt32.new!(b138.to_int).&(0x1_u32) << 10
      end

      unless b139.nil?
        value = (value & 0xfffff7ff_u32) |
                UInt32.new!(b139.to_int).&(0x1_u32) << 11
      end

      unless b140.nil?
        value = (value & 0xffffefff_u32) |
                UInt32.new!(b140.to_int).&(0x1_u32) << 12
      end

      unless b141.nil?
        value = (value & 0xffffdfff_u32) |
                UInt32.new!(b141.to_int).&(0x1_u32) << 13
      end

      unless b142.nil?
        value = (value & 0xffffbfff_u32) |
                UInt32.new!(b142.to_int).&(0x1_u32) << 14
      end

      unless b143.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(b143.to_int).&(0x1_u32) << 15
      end

      unless b144.nil?
        value = (value & 0xfffeffff_u32) |
                UInt32.new!(b144.to_int).&(0x1_u32) << 16
      end

      unless b145.nil?
        value = (value & 0xfffdffff_u32) |
                UInt32.new!(b145.to_int).&(0x1_u32) << 17
      end

      unless b146.nil?
        value = (value & 0xfffbffff_u32) |
                UInt32.new!(b146.to_int).&(0x1_u32) << 18
      end

      unless b147.nil?
        value = (value & 0xfff7ffff_u32) |
                UInt32.new!(b147.to_int).&(0x1_u32) << 19
      end

      unless b148.nil?
        value = (value & 0xffefffff_u32) |
                UInt32.new!(b148.to_int).&(0x1_u32) << 20
      end

      unless b149.nil?
        value = (value & 0xffdfffff_u32) |
                UInt32.new!(b149.to_int).&(0x1_u32) << 21
      end

      unless b150.nil?
        value = (value & 0xffbfffff_u32) |
                UInt32.new!(b150.to_int).&(0x1_u32) << 22
      end

      unless b151.nil?
        value = (value & 0xff7fffff_u32) |
                UInt32.new!(b151.to_int).&(0x1_u32) << 23
      end

      unless b152.nil?
        value = (value & 0xfeffffff_u32) |
                UInt32.new!(b152.to_int).&(0x1_u32) << 24
      end

      unless b153.nil?
        value = (value & 0xfdffffff_u32) |
                UInt32.new!(b153.to_int).&(0x1_u32) << 25
      end

      unless b154.nil?
        value = (value & 0xfbffffff_u32) |
                UInt32.new!(b154.to_int).&(0x1_u32) << 26
      end

      unless b155.nil?
        value = (value & 0xf7ffffff_u32) |
                UInt32.new!(b155.to_int).&(0x1_u32) << 27
      end

      unless b156.nil?
        value = (value & 0xefffffff_u32) |
                UInt32.new!(b156.to_int).&(0x1_u32) << 28
      end

      unless b157.nil?
        value = (value & 0xdfffffff_u32) |
                UInt32.new!(b157.to_int).&(0x1_u32) << 29
      end

      unless b158.nil?
        value = (value & 0xbfffffff_u32) |
                UInt32.new!(b158.to_int).&(0x1_u32) << 30
      end

      unless b159.nil?
        value = (value & 0x7fffffff_u32) |
                UInt32.new!(b159.to_int).&(0x1_u32) << 31
      end

      self.class.new(value)
    end

    def self.set(
      *,
      b128 : Bool? = nil,
      b129 : Bool? = nil,
      b130 : Bool? = nil,
      b131 : Bool? = nil,
      b132 : Bool? = nil,
      b133 : Bool? = nil,
      b134 : Bool? = nil,
      b135 : Bool? = nil,
      b136 : Bool? = nil,
      b137 : Bool? = nil,
      b138 : Bool? = nil,
      b139 : Bool? = nil,
      b140 : Bool? = nil,
      b141 : Bool? = nil,
      b142 : Bool? = nil,
      b143 : Bool? = nil,
      b144 : Bool? = nil,
      b145 : Bool? = nil,
      b146 : Bool? = nil,
      b147 : Bool? = nil,
      b148 : Bool? = nil,
      b149 : Bool? = nil,
      b150 : Bool? = nil,
      b151 : Bool? = nil,
      b152 : Bool? = nil,
      b153 : Bool? = nil,
      b154 : Bool? = nil,
      b155 : Bool? = nil,
      b156 : Bool? = nil,
      b157 : Bool? = nil,
      b158 : Bool? = nil,
      b159 : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        b128: b128,
        b129: b129,
        b130: b130,
        b131: b131,
        b132: b132,
        b133: b133,
        b134: b134,
        b135: b135,
        b136: b136,
        b137: b137,
        b138: b138,
        b139: b139,
        b140: b140,
        b141: b141,
        b142: b142,
        b143: b143,
        b144: b144,
        b145: b145,
        b146: b146,
        b147: b147,
        b148: b148,
        b149: b149,
        b150: b150,
        b151: b151,
        b152: b152,
        b153: b153,
        b154: b154,
        b155: b155,
        b156: b156,
        b157: b157,
        b158: b158,
        b159: b159,
      )
    end
  end # struct

  # key registers
  struct K2LR
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

    # b96
    def self.b96=(value : Bool) : Bool
      self.set(b96: value)
      value
    end

    # b97
    def self.b97=(value : Bool) : Bool
      self.set(b97: value)
      value
    end

    # b98
    def self.b98=(value : Bool) : Bool
      self.set(b98: value)
      value
    end

    # b99
    def self.b99=(value : Bool) : Bool
      self.set(b99: value)
      value
    end

    # b100
    def self.b100=(value : Bool) : Bool
      self.set(b100: value)
      value
    end

    # b101
    def self.b101=(value : Bool) : Bool
      self.set(b101: value)
      value
    end

    # b102
    def self.b102=(value : Bool) : Bool
      self.set(b102: value)
      value
    end

    # b103
    def self.b103=(value : Bool) : Bool
      self.set(b103: value)
      value
    end

    # b104
    def self.b104=(value : Bool) : Bool
      self.set(b104: value)
      value
    end

    # b105
    def self.b105=(value : Bool) : Bool
      self.set(b105: value)
      value
    end

    # b106
    def self.b106=(value : Bool) : Bool
      self.set(b106: value)
      value
    end

    # b107
    def self.b107=(value : Bool) : Bool
      self.set(b107: value)
      value
    end

    # b108
    def self.b108=(value : Bool) : Bool
      self.set(b108: value)
      value
    end

    # b109
    def self.b109=(value : Bool) : Bool
      self.set(b109: value)
      value
    end

    # b110
    def self.b110=(value : Bool) : Bool
      self.set(b110: value)
      value
    end

    # b111
    def self.b111=(value : Bool) : Bool
      self.set(b111: value)
      value
    end

    # b112
    def self.b112=(value : Bool) : Bool
      self.set(b112: value)
      value
    end

    # b113
    def self.b113=(value : Bool) : Bool
      self.set(b113: value)
      value
    end

    # b114
    def self.b114=(value : Bool) : Bool
      self.set(b114: value)
      value
    end

    # b115
    def self.b115=(value : Bool) : Bool
      self.set(b115: value)
      value
    end

    # b116
    def self.b116=(value : Bool) : Bool
      self.set(b116: value)
      value
    end

    # b117
    def self.b117=(value : Bool) : Bool
      self.set(b117: value)
      value
    end

    # b118
    def self.b118=(value : Bool) : Bool
      self.set(b118: value)
      value
    end

    # b119
    def self.b119=(value : Bool) : Bool
      self.set(b119: value)
      value
    end

    # b120
    def self.b120=(value : Bool) : Bool
      self.set(b120: value)
      value
    end

    # b121
    def self.b121=(value : Bool) : Bool
      self.set(b121: value)
      value
    end

    # b122
    def self.b122=(value : Bool) : Bool
      self.set(b122: value)
      value
    end

    # b123
    def self.b123=(value : Bool) : Bool
      self.set(b123: value)
      value
    end

    # b124
    def self.b124=(value : Bool) : Bool
      self.set(b124: value)
      value
    end

    # b125
    def self.b125=(value : Bool) : Bool
      self.set(b125: value)
      value
    end

    # b126
    def self.b126=(value : Bool) : Bool
      self.set(b126: value)
      value
    end

    # b127
    def self.b127=(value : Bool) : Bool
      self.set(b127: value)
      value
    end

    def copy_with(
      *,

      b96 : Bool? = nil,

      b97 : Bool? = nil,

      b98 : Bool? = nil,

      b99 : Bool? = nil,

      b100 : Bool? = nil,

      b101 : Bool? = nil,

      b102 : Bool? = nil,

      b103 : Bool? = nil,

      b104 : Bool? = nil,

      b105 : Bool? = nil,

      b106 : Bool? = nil,

      b107 : Bool? = nil,

      b108 : Bool? = nil,

      b109 : Bool? = nil,

      b110 : Bool? = nil,

      b111 : Bool? = nil,

      b112 : Bool? = nil,

      b113 : Bool? = nil,

      b114 : Bool? = nil,

      b115 : Bool? = nil,

      b116 : Bool? = nil,

      b117 : Bool? = nil,

      b118 : Bool? = nil,

      b119 : Bool? = nil,

      b120 : Bool? = nil,

      b121 : Bool? = nil,

      b122 : Bool? = nil,

      b123 : Bool? = nil,

      b124 : Bool? = nil,

      b125 : Bool? = nil,

      b126 : Bool? = nil,

      b127 : Bool? = nil
    ) : self
      value = @value

      unless b96.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(b96.to_int).&(0x1_u32) << 0
      end

      unless b97.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(b97.to_int).&(0x1_u32) << 1
      end

      unless b98.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(b98.to_int).&(0x1_u32) << 2
      end

      unless b99.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(b99.to_int).&(0x1_u32) << 3
      end

      unless b100.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(b100.to_int).&(0x1_u32) << 4
      end

      unless b101.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(b101.to_int).&(0x1_u32) << 5
      end

      unless b102.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(b102.to_int).&(0x1_u32) << 6
      end

      unless b103.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(b103.to_int).&(0x1_u32) << 7
      end

      unless b104.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(b104.to_int).&(0x1_u32) << 8
      end

      unless b105.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(b105.to_int).&(0x1_u32) << 9
      end

      unless b106.nil?
        value = (value & 0xfffffbff_u32) |
                UInt32.new!(b106.to_int).&(0x1_u32) << 10
      end

      unless b107.nil?
        value = (value & 0xfffff7ff_u32) |
                UInt32.new!(b107.to_int).&(0x1_u32) << 11
      end

      unless b108.nil?
        value = (value & 0xffffefff_u32) |
                UInt32.new!(b108.to_int).&(0x1_u32) << 12
      end

      unless b109.nil?
        value = (value & 0xffffdfff_u32) |
                UInt32.new!(b109.to_int).&(0x1_u32) << 13
      end

      unless b110.nil?
        value = (value & 0xffffbfff_u32) |
                UInt32.new!(b110.to_int).&(0x1_u32) << 14
      end

      unless b111.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(b111.to_int).&(0x1_u32) << 15
      end

      unless b112.nil?
        value = (value & 0xfffeffff_u32) |
                UInt32.new!(b112.to_int).&(0x1_u32) << 16
      end

      unless b113.nil?
        value = (value & 0xfffdffff_u32) |
                UInt32.new!(b113.to_int).&(0x1_u32) << 17
      end

      unless b114.nil?
        value = (value & 0xfffbffff_u32) |
                UInt32.new!(b114.to_int).&(0x1_u32) << 18
      end

      unless b115.nil?
        value = (value & 0xfff7ffff_u32) |
                UInt32.new!(b115.to_int).&(0x1_u32) << 19
      end

      unless b116.nil?
        value = (value & 0xffefffff_u32) |
                UInt32.new!(b116.to_int).&(0x1_u32) << 20
      end

      unless b117.nil?
        value = (value & 0xffdfffff_u32) |
                UInt32.new!(b117.to_int).&(0x1_u32) << 21
      end

      unless b118.nil?
        value = (value & 0xffbfffff_u32) |
                UInt32.new!(b118.to_int).&(0x1_u32) << 22
      end

      unless b119.nil?
        value = (value & 0xff7fffff_u32) |
                UInt32.new!(b119.to_int).&(0x1_u32) << 23
      end

      unless b120.nil?
        value = (value & 0xfeffffff_u32) |
                UInt32.new!(b120.to_int).&(0x1_u32) << 24
      end

      unless b121.nil?
        value = (value & 0xfdffffff_u32) |
                UInt32.new!(b121.to_int).&(0x1_u32) << 25
      end

      unless b122.nil?
        value = (value & 0xfbffffff_u32) |
                UInt32.new!(b122.to_int).&(0x1_u32) << 26
      end

      unless b123.nil?
        value = (value & 0xf7ffffff_u32) |
                UInt32.new!(b123.to_int).&(0x1_u32) << 27
      end

      unless b124.nil?
        value = (value & 0xefffffff_u32) |
                UInt32.new!(b124.to_int).&(0x1_u32) << 28
      end

      unless b125.nil?
        value = (value & 0xdfffffff_u32) |
                UInt32.new!(b125.to_int).&(0x1_u32) << 29
      end

      unless b126.nil?
        value = (value & 0xbfffffff_u32) |
                UInt32.new!(b126.to_int).&(0x1_u32) << 30
      end

      unless b127.nil?
        value = (value & 0x7fffffff_u32) |
                UInt32.new!(b127.to_int).&(0x1_u32) << 31
      end

      self.class.new(value)
    end

    def self.set(
      *,
      b96 : Bool? = nil,
      b97 : Bool? = nil,
      b98 : Bool? = nil,
      b99 : Bool? = nil,
      b100 : Bool? = nil,
      b101 : Bool? = nil,
      b102 : Bool? = nil,
      b103 : Bool? = nil,
      b104 : Bool? = nil,
      b105 : Bool? = nil,
      b106 : Bool? = nil,
      b107 : Bool? = nil,
      b108 : Bool? = nil,
      b109 : Bool? = nil,
      b110 : Bool? = nil,
      b111 : Bool? = nil,
      b112 : Bool? = nil,
      b113 : Bool? = nil,
      b114 : Bool? = nil,
      b115 : Bool? = nil,
      b116 : Bool? = nil,
      b117 : Bool? = nil,
      b118 : Bool? = nil,
      b119 : Bool? = nil,
      b120 : Bool? = nil,
      b121 : Bool? = nil,
      b122 : Bool? = nil,
      b123 : Bool? = nil,
      b124 : Bool? = nil,
      b125 : Bool? = nil,
      b126 : Bool? = nil,
      b127 : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        b96: b96,
        b97: b97,
        b98: b98,
        b99: b99,
        b100: b100,
        b101: b101,
        b102: b102,
        b103: b103,
        b104: b104,
        b105: b105,
        b106: b106,
        b107: b107,
        b108: b108,
        b109: b109,
        b110: b110,
        b111: b111,
        b112: b112,
        b113: b113,
        b114: b114,
        b115: b115,
        b116: b116,
        b117: b117,
        b118: b118,
        b119: b119,
        b120: b120,
        b121: b121,
        b122: b122,
        b123: b123,
        b124: b124,
        b125: b125,
        b126: b126,
        b127: b127,
      )
    end
  end # struct

  # key registers
  struct K2RR
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

    # b64
    def self.b64=(value : Bool) : Bool
      self.set(b64: value)
      value
    end

    # b65
    def self.b65=(value : Bool) : Bool
      self.set(b65: value)
      value
    end

    # b66
    def self.b66=(value : Bool) : Bool
      self.set(b66: value)
      value
    end

    # b67
    def self.b67=(value : Bool) : Bool
      self.set(b67: value)
      value
    end

    # b68
    def self.b68=(value : Bool) : Bool
      self.set(b68: value)
      value
    end

    # b69
    def self.b69=(value : Bool) : Bool
      self.set(b69: value)
      value
    end

    # b70
    def self.b70=(value : Bool) : Bool
      self.set(b70: value)
      value
    end

    # b71
    def self.b71=(value : Bool) : Bool
      self.set(b71: value)
      value
    end

    # b72
    def self.b72=(value : Bool) : Bool
      self.set(b72: value)
      value
    end

    # b73
    def self.b73=(value : Bool) : Bool
      self.set(b73: value)
      value
    end

    # b74
    def self.b74=(value : Bool) : Bool
      self.set(b74: value)
      value
    end

    # b75
    def self.b75=(value : Bool) : Bool
      self.set(b75: value)
      value
    end

    # b76
    def self.b76=(value : Bool) : Bool
      self.set(b76: value)
      value
    end

    # b77
    def self.b77=(value : Bool) : Bool
      self.set(b77: value)
      value
    end

    # b78
    def self.b78=(value : Bool) : Bool
      self.set(b78: value)
      value
    end

    # b79
    def self.b79=(value : Bool) : Bool
      self.set(b79: value)
      value
    end

    # b80
    def self.b80=(value : Bool) : Bool
      self.set(b80: value)
      value
    end

    # b81
    def self.b81=(value : Bool) : Bool
      self.set(b81: value)
      value
    end

    # b82
    def self.b82=(value : Bool) : Bool
      self.set(b82: value)
      value
    end

    # b83
    def self.b83=(value : Bool) : Bool
      self.set(b83: value)
      value
    end

    # b84
    def self.b84=(value : Bool) : Bool
      self.set(b84: value)
      value
    end

    # b85
    def self.b85=(value : Bool) : Bool
      self.set(b85: value)
      value
    end

    # b86
    def self.b86=(value : Bool) : Bool
      self.set(b86: value)
      value
    end

    # b87
    def self.b87=(value : Bool) : Bool
      self.set(b87: value)
      value
    end

    # b88
    def self.b88=(value : Bool) : Bool
      self.set(b88: value)
      value
    end

    # b89
    def self.b89=(value : Bool) : Bool
      self.set(b89: value)
      value
    end

    # b90
    def self.b90=(value : Bool) : Bool
      self.set(b90: value)
      value
    end

    # b91
    def self.b91=(value : Bool) : Bool
      self.set(b91: value)
      value
    end

    # b92
    def self.b92=(value : Bool) : Bool
      self.set(b92: value)
      value
    end

    # b93
    def self.b93=(value : Bool) : Bool
      self.set(b93: value)
      value
    end

    # b94
    def self.b94=(value : Bool) : Bool
      self.set(b94: value)
      value
    end

    # b95
    def self.b95=(value : Bool) : Bool
      self.set(b95: value)
      value
    end

    def copy_with(
      *,

      b64 : Bool? = nil,

      b65 : Bool? = nil,

      b66 : Bool? = nil,

      b67 : Bool? = nil,

      b68 : Bool? = nil,

      b69 : Bool? = nil,

      b70 : Bool? = nil,

      b71 : Bool? = nil,

      b72 : Bool? = nil,

      b73 : Bool? = nil,

      b74 : Bool? = nil,

      b75 : Bool? = nil,

      b76 : Bool? = nil,

      b77 : Bool? = nil,

      b78 : Bool? = nil,

      b79 : Bool? = nil,

      b80 : Bool? = nil,

      b81 : Bool? = nil,

      b82 : Bool? = nil,

      b83 : Bool? = nil,

      b84 : Bool? = nil,

      b85 : Bool? = nil,

      b86 : Bool? = nil,

      b87 : Bool? = nil,

      b88 : Bool? = nil,

      b89 : Bool? = nil,

      b90 : Bool? = nil,

      b91 : Bool? = nil,

      b92 : Bool? = nil,

      b93 : Bool? = nil,

      b94 : Bool? = nil,

      b95 : Bool? = nil
    ) : self
      value = @value

      unless b64.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(b64.to_int).&(0x1_u32) << 0
      end

      unless b65.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(b65.to_int).&(0x1_u32) << 1
      end

      unless b66.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(b66.to_int).&(0x1_u32) << 2
      end

      unless b67.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(b67.to_int).&(0x1_u32) << 3
      end

      unless b68.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(b68.to_int).&(0x1_u32) << 4
      end

      unless b69.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(b69.to_int).&(0x1_u32) << 5
      end

      unless b70.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(b70.to_int).&(0x1_u32) << 6
      end

      unless b71.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(b71.to_int).&(0x1_u32) << 7
      end

      unless b72.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(b72.to_int).&(0x1_u32) << 8
      end

      unless b73.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(b73.to_int).&(0x1_u32) << 9
      end

      unless b74.nil?
        value = (value & 0xfffffbff_u32) |
                UInt32.new!(b74.to_int).&(0x1_u32) << 10
      end

      unless b75.nil?
        value = (value & 0xfffff7ff_u32) |
                UInt32.new!(b75.to_int).&(0x1_u32) << 11
      end

      unless b76.nil?
        value = (value & 0xffffefff_u32) |
                UInt32.new!(b76.to_int).&(0x1_u32) << 12
      end

      unless b77.nil?
        value = (value & 0xffffdfff_u32) |
                UInt32.new!(b77.to_int).&(0x1_u32) << 13
      end

      unless b78.nil?
        value = (value & 0xffffbfff_u32) |
                UInt32.new!(b78.to_int).&(0x1_u32) << 14
      end

      unless b79.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(b79.to_int).&(0x1_u32) << 15
      end

      unless b80.nil?
        value = (value & 0xfffeffff_u32) |
                UInt32.new!(b80.to_int).&(0x1_u32) << 16
      end

      unless b81.nil?
        value = (value & 0xfffdffff_u32) |
                UInt32.new!(b81.to_int).&(0x1_u32) << 17
      end

      unless b82.nil?
        value = (value & 0xfffbffff_u32) |
                UInt32.new!(b82.to_int).&(0x1_u32) << 18
      end

      unless b83.nil?
        value = (value & 0xfff7ffff_u32) |
                UInt32.new!(b83.to_int).&(0x1_u32) << 19
      end

      unless b84.nil?
        value = (value & 0xffefffff_u32) |
                UInt32.new!(b84.to_int).&(0x1_u32) << 20
      end

      unless b85.nil?
        value = (value & 0xffdfffff_u32) |
                UInt32.new!(b85.to_int).&(0x1_u32) << 21
      end

      unless b86.nil?
        value = (value & 0xffbfffff_u32) |
                UInt32.new!(b86.to_int).&(0x1_u32) << 22
      end

      unless b87.nil?
        value = (value & 0xff7fffff_u32) |
                UInt32.new!(b87.to_int).&(0x1_u32) << 23
      end

      unless b88.nil?
        value = (value & 0xfeffffff_u32) |
                UInt32.new!(b88.to_int).&(0x1_u32) << 24
      end

      unless b89.nil?
        value = (value & 0xfdffffff_u32) |
                UInt32.new!(b89.to_int).&(0x1_u32) << 25
      end

      unless b90.nil?
        value = (value & 0xfbffffff_u32) |
                UInt32.new!(b90.to_int).&(0x1_u32) << 26
      end

      unless b91.nil?
        value = (value & 0xf7ffffff_u32) |
                UInt32.new!(b91.to_int).&(0x1_u32) << 27
      end

      unless b92.nil?
        value = (value & 0xefffffff_u32) |
                UInt32.new!(b92.to_int).&(0x1_u32) << 28
      end

      unless b93.nil?
        value = (value & 0xdfffffff_u32) |
                UInt32.new!(b93.to_int).&(0x1_u32) << 29
      end

      unless b94.nil?
        value = (value & 0xbfffffff_u32) |
                UInt32.new!(b94.to_int).&(0x1_u32) << 30
      end

      unless b95.nil?
        value = (value & 0x7fffffff_u32) |
                UInt32.new!(b95.to_int).&(0x1_u32) << 31
      end

      self.class.new(value)
    end

    def self.set(
      *,
      b64 : Bool? = nil,
      b65 : Bool? = nil,
      b66 : Bool? = nil,
      b67 : Bool? = nil,
      b68 : Bool? = nil,
      b69 : Bool? = nil,
      b70 : Bool? = nil,
      b71 : Bool? = nil,
      b72 : Bool? = nil,
      b73 : Bool? = nil,
      b74 : Bool? = nil,
      b75 : Bool? = nil,
      b76 : Bool? = nil,
      b77 : Bool? = nil,
      b78 : Bool? = nil,
      b79 : Bool? = nil,
      b80 : Bool? = nil,
      b81 : Bool? = nil,
      b82 : Bool? = nil,
      b83 : Bool? = nil,
      b84 : Bool? = nil,
      b85 : Bool? = nil,
      b86 : Bool? = nil,
      b87 : Bool? = nil,
      b88 : Bool? = nil,
      b89 : Bool? = nil,
      b90 : Bool? = nil,
      b91 : Bool? = nil,
      b92 : Bool? = nil,
      b93 : Bool? = nil,
      b94 : Bool? = nil,
      b95 : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        b64: b64,
        b65: b65,
        b66: b66,
        b67: b67,
        b68: b68,
        b69: b69,
        b70: b70,
        b71: b71,
        b72: b72,
        b73: b73,
        b74: b74,
        b75: b75,
        b76: b76,
        b77: b77,
        b78: b78,
        b79: b79,
        b80: b80,
        b81: b81,
        b82: b82,
        b83: b83,
        b84: b84,
        b85: b85,
        b86: b86,
        b87: b87,
        b88: b88,
        b89: b89,
        b90: b90,
        b91: b91,
        b92: b92,
        b93: b93,
        b94: b94,
        b95: b95,
      )
    end
  end # struct

  # key registers
  struct K3LR
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

    # b32
    def self.b32=(value : Bool) : Bool
      self.set(b32: value)
      value
    end

    # b33
    def self.b33=(value : Bool) : Bool
      self.set(b33: value)
      value
    end

    # b34
    def self.b34=(value : Bool) : Bool
      self.set(b34: value)
      value
    end

    # b35
    def self.b35=(value : Bool) : Bool
      self.set(b35: value)
      value
    end

    # b36
    def self.b36=(value : Bool) : Bool
      self.set(b36: value)
      value
    end

    # b37
    def self.b37=(value : Bool) : Bool
      self.set(b37: value)
      value
    end

    # b38
    def self.b38=(value : Bool) : Bool
      self.set(b38: value)
      value
    end

    # b39
    def self.b39=(value : Bool) : Bool
      self.set(b39: value)
      value
    end

    # b40
    def self.b40=(value : Bool) : Bool
      self.set(b40: value)
      value
    end

    # b41
    def self.b41=(value : Bool) : Bool
      self.set(b41: value)
      value
    end

    # b42
    def self.b42=(value : Bool) : Bool
      self.set(b42: value)
      value
    end

    # b43
    def self.b43=(value : Bool) : Bool
      self.set(b43: value)
      value
    end

    # b44
    def self.b44=(value : Bool) : Bool
      self.set(b44: value)
      value
    end

    # b45
    def self.b45=(value : Bool) : Bool
      self.set(b45: value)
      value
    end

    # b46
    def self.b46=(value : Bool) : Bool
      self.set(b46: value)
      value
    end

    # b47
    def self.b47=(value : Bool) : Bool
      self.set(b47: value)
      value
    end

    # b48
    def self.b48=(value : Bool) : Bool
      self.set(b48: value)
      value
    end

    # b49
    def self.b49=(value : Bool) : Bool
      self.set(b49: value)
      value
    end

    # b50
    def self.b50=(value : Bool) : Bool
      self.set(b50: value)
      value
    end

    # b51
    def self.b51=(value : Bool) : Bool
      self.set(b51: value)
      value
    end

    # b52
    def self.b52=(value : Bool) : Bool
      self.set(b52: value)
      value
    end

    # b53
    def self.b53=(value : Bool) : Bool
      self.set(b53: value)
      value
    end

    # b54
    def self.b54=(value : Bool) : Bool
      self.set(b54: value)
      value
    end

    # b55
    def self.b55=(value : Bool) : Bool
      self.set(b55: value)
      value
    end

    # b56
    def self.b56=(value : Bool) : Bool
      self.set(b56: value)
      value
    end

    # b57
    def self.b57=(value : Bool) : Bool
      self.set(b57: value)
      value
    end

    # b58
    def self.b58=(value : Bool) : Bool
      self.set(b58: value)
      value
    end

    # b59
    def self.b59=(value : Bool) : Bool
      self.set(b59: value)
      value
    end

    # b60
    def self.b60=(value : Bool) : Bool
      self.set(b60: value)
      value
    end

    # b61
    def self.b61=(value : Bool) : Bool
      self.set(b61: value)
      value
    end

    # b62
    def self.b62=(value : Bool) : Bool
      self.set(b62: value)
      value
    end

    # b63
    def self.b63=(value : Bool) : Bool
      self.set(b63: value)
      value
    end

    def copy_with(
      *,

      b32 : Bool? = nil,

      b33 : Bool? = nil,

      b34 : Bool? = nil,

      b35 : Bool? = nil,

      b36 : Bool? = nil,

      b37 : Bool? = nil,

      b38 : Bool? = nil,

      b39 : Bool? = nil,

      b40 : Bool? = nil,

      b41 : Bool? = nil,

      b42 : Bool? = nil,

      b43 : Bool? = nil,

      b44 : Bool? = nil,

      b45 : Bool? = nil,

      b46 : Bool? = nil,

      b47 : Bool? = nil,

      b48 : Bool? = nil,

      b49 : Bool? = nil,

      b50 : Bool? = nil,

      b51 : Bool? = nil,

      b52 : Bool? = nil,

      b53 : Bool? = nil,

      b54 : Bool? = nil,

      b55 : Bool? = nil,

      b56 : Bool? = nil,

      b57 : Bool? = nil,

      b58 : Bool? = nil,

      b59 : Bool? = nil,

      b60 : Bool? = nil,

      b61 : Bool? = nil,

      b62 : Bool? = nil,

      b63 : Bool? = nil
    ) : self
      value = @value

      unless b32.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(b32.to_int).&(0x1_u32) << 0
      end

      unless b33.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(b33.to_int).&(0x1_u32) << 1
      end

      unless b34.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(b34.to_int).&(0x1_u32) << 2
      end

      unless b35.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(b35.to_int).&(0x1_u32) << 3
      end

      unless b36.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(b36.to_int).&(0x1_u32) << 4
      end

      unless b37.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(b37.to_int).&(0x1_u32) << 5
      end

      unless b38.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(b38.to_int).&(0x1_u32) << 6
      end

      unless b39.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(b39.to_int).&(0x1_u32) << 7
      end

      unless b40.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(b40.to_int).&(0x1_u32) << 8
      end

      unless b41.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(b41.to_int).&(0x1_u32) << 9
      end

      unless b42.nil?
        value = (value & 0xfffffbff_u32) |
                UInt32.new!(b42.to_int).&(0x1_u32) << 10
      end

      unless b43.nil?
        value = (value & 0xfffff7ff_u32) |
                UInt32.new!(b43.to_int).&(0x1_u32) << 11
      end

      unless b44.nil?
        value = (value & 0xffffefff_u32) |
                UInt32.new!(b44.to_int).&(0x1_u32) << 12
      end

      unless b45.nil?
        value = (value & 0xffffdfff_u32) |
                UInt32.new!(b45.to_int).&(0x1_u32) << 13
      end

      unless b46.nil?
        value = (value & 0xffffbfff_u32) |
                UInt32.new!(b46.to_int).&(0x1_u32) << 14
      end

      unless b47.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(b47.to_int).&(0x1_u32) << 15
      end

      unless b48.nil?
        value = (value & 0xfffeffff_u32) |
                UInt32.new!(b48.to_int).&(0x1_u32) << 16
      end

      unless b49.nil?
        value = (value & 0xfffdffff_u32) |
                UInt32.new!(b49.to_int).&(0x1_u32) << 17
      end

      unless b50.nil?
        value = (value & 0xfffbffff_u32) |
                UInt32.new!(b50.to_int).&(0x1_u32) << 18
      end

      unless b51.nil?
        value = (value & 0xfff7ffff_u32) |
                UInt32.new!(b51.to_int).&(0x1_u32) << 19
      end

      unless b52.nil?
        value = (value & 0xffefffff_u32) |
                UInt32.new!(b52.to_int).&(0x1_u32) << 20
      end

      unless b53.nil?
        value = (value & 0xffdfffff_u32) |
                UInt32.new!(b53.to_int).&(0x1_u32) << 21
      end

      unless b54.nil?
        value = (value & 0xffbfffff_u32) |
                UInt32.new!(b54.to_int).&(0x1_u32) << 22
      end

      unless b55.nil?
        value = (value & 0xff7fffff_u32) |
                UInt32.new!(b55.to_int).&(0x1_u32) << 23
      end

      unless b56.nil?
        value = (value & 0xfeffffff_u32) |
                UInt32.new!(b56.to_int).&(0x1_u32) << 24
      end

      unless b57.nil?
        value = (value & 0xfdffffff_u32) |
                UInt32.new!(b57.to_int).&(0x1_u32) << 25
      end

      unless b58.nil?
        value = (value & 0xfbffffff_u32) |
                UInt32.new!(b58.to_int).&(0x1_u32) << 26
      end

      unless b59.nil?
        value = (value & 0xf7ffffff_u32) |
                UInt32.new!(b59.to_int).&(0x1_u32) << 27
      end

      unless b60.nil?
        value = (value & 0xefffffff_u32) |
                UInt32.new!(b60.to_int).&(0x1_u32) << 28
      end

      unless b61.nil?
        value = (value & 0xdfffffff_u32) |
                UInt32.new!(b61.to_int).&(0x1_u32) << 29
      end

      unless b62.nil?
        value = (value & 0xbfffffff_u32) |
                UInt32.new!(b62.to_int).&(0x1_u32) << 30
      end

      unless b63.nil?
        value = (value & 0x7fffffff_u32) |
                UInt32.new!(b63.to_int).&(0x1_u32) << 31
      end

      self.class.new(value)
    end

    def self.set(
      *,
      b32 : Bool? = nil,
      b33 : Bool? = nil,
      b34 : Bool? = nil,
      b35 : Bool? = nil,
      b36 : Bool? = nil,
      b37 : Bool? = nil,
      b38 : Bool? = nil,
      b39 : Bool? = nil,
      b40 : Bool? = nil,
      b41 : Bool? = nil,
      b42 : Bool? = nil,
      b43 : Bool? = nil,
      b44 : Bool? = nil,
      b45 : Bool? = nil,
      b46 : Bool? = nil,
      b47 : Bool? = nil,
      b48 : Bool? = nil,
      b49 : Bool? = nil,
      b50 : Bool? = nil,
      b51 : Bool? = nil,
      b52 : Bool? = nil,
      b53 : Bool? = nil,
      b54 : Bool? = nil,
      b55 : Bool? = nil,
      b56 : Bool? = nil,
      b57 : Bool? = nil,
      b58 : Bool? = nil,
      b59 : Bool? = nil,
      b60 : Bool? = nil,
      b61 : Bool? = nil,
      b62 : Bool? = nil,
      b63 : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        b32: b32,
        b33: b33,
        b34: b34,
        b35: b35,
        b36: b36,
        b37: b37,
        b38: b38,
        b39: b39,
        b40: b40,
        b41: b41,
        b42: b42,
        b43: b43,
        b44: b44,
        b45: b45,
        b46: b46,
        b47: b47,
        b48: b48,
        b49: b49,
        b50: b50,
        b51: b51,
        b52: b52,
        b53: b53,
        b54: b54,
        b55: b55,
        b56: b56,
        b57: b57,
        b58: b58,
        b59: b59,
        b60: b60,
        b61: b61,
        b62: b62,
        b63: b63,
      )
    end
  end # struct

  # key registers
  struct K3RR
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

    # b0
    def self.b0=(value : Bool) : Bool
      self.set(b0: value)
      value
    end

    # b1
    def self.b1=(value : Bool) : Bool
      self.set(b1: value)
      value
    end

    # b2
    def self.b2=(value : Bool) : Bool
      self.set(b2: value)
      value
    end

    # b3
    def self.b3=(value : Bool) : Bool
      self.set(b3: value)
      value
    end

    # b4
    def self.b4=(value : Bool) : Bool
      self.set(b4: value)
      value
    end

    # b5
    def self.b5=(value : Bool) : Bool
      self.set(b5: value)
      value
    end

    # b6
    def self.b6=(value : Bool) : Bool
      self.set(b6: value)
      value
    end

    # b7
    def self.b7=(value : Bool) : Bool
      self.set(b7: value)
      value
    end

    # b8
    def self.b8=(value : Bool) : Bool
      self.set(b8: value)
      value
    end

    # b9
    def self.b9=(value : Bool) : Bool
      self.set(b9: value)
      value
    end

    # b10
    def self.b10=(value : Bool) : Bool
      self.set(b10: value)
      value
    end

    # b11
    def self.b11=(value : Bool) : Bool
      self.set(b11: value)
      value
    end

    # b12
    def self.b12=(value : Bool) : Bool
      self.set(b12: value)
      value
    end

    # b13
    def self.b13=(value : Bool) : Bool
      self.set(b13: value)
      value
    end

    # b14
    def self.b14=(value : Bool) : Bool
      self.set(b14: value)
      value
    end

    # b15
    def self.b15=(value : Bool) : Bool
      self.set(b15: value)
      value
    end

    # b16
    def self.b16=(value : Bool) : Bool
      self.set(b16: value)
      value
    end

    # b17
    def self.b17=(value : Bool) : Bool
      self.set(b17: value)
      value
    end

    # b18
    def self.b18=(value : Bool) : Bool
      self.set(b18: value)
      value
    end

    # b19
    def self.b19=(value : Bool) : Bool
      self.set(b19: value)
      value
    end

    # b20
    def self.b20=(value : Bool) : Bool
      self.set(b20: value)
      value
    end

    # b21
    def self.b21=(value : Bool) : Bool
      self.set(b21: value)
      value
    end

    # b22
    def self.b22=(value : Bool) : Bool
      self.set(b22: value)
      value
    end

    # b23
    def self.b23=(value : Bool) : Bool
      self.set(b23: value)
      value
    end

    # b24
    def self.b24=(value : Bool) : Bool
      self.set(b24: value)
      value
    end

    # b25
    def self.b25=(value : Bool) : Bool
      self.set(b25: value)
      value
    end

    # b26
    def self.b26=(value : Bool) : Bool
      self.set(b26: value)
      value
    end

    # b27
    def self.b27=(value : Bool) : Bool
      self.set(b27: value)
      value
    end

    # b28
    def self.b28=(value : Bool) : Bool
      self.set(b28: value)
      value
    end

    # b29
    def self.b29=(value : Bool) : Bool
      self.set(b29: value)
      value
    end

    # b30
    def self.b30=(value : Bool) : Bool
      self.set(b30: value)
      value
    end

    # b31
    def self.b31=(value : Bool) : Bool
      self.set(b31: value)
      value
    end

    def copy_with(
      *,

      b0 : Bool? = nil,

      b1 : Bool? = nil,

      b2 : Bool? = nil,

      b3 : Bool? = nil,

      b4 : Bool? = nil,

      b5 : Bool? = nil,

      b6 : Bool? = nil,

      b7 : Bool? = nil,

      b8 : Bool? = nil,

      b9 : Bool? = nil,

      b10 : Bool? = nil,

      b11 : Bool? = nil,

      b12 : Bool? = nil,

      b13 : Bool? = nil,

      b14 : Bool? = nil,

      b15 : Bool? = nil,

      b16 : Bool? = nil,

      b17 : Bool? = nil,

      b18 : Bool? = nil,

      b19 : Bool? = nil,

      b20 : Bool? = nil,

      b21 : Bool? = nil,

      b22 : Bool? = nil,

      b23 : Bool? = nil,

      b24 : Bool? = nil,

      b25 : Bool? = nil,

      b26 : Bool? = nil,

      b27 : Bool? = nil,

      b28 : Bool? = nil,

      b29 : Bool? = nil,

      b30 : Bool? = nil,

      b31 : Bool? = nil
    ) : self
      value = @value

      unless b0.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(b0.to_int).&(0x1_u32) << 0
      end

      unless b1.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(b1.to_int).&(0x1_u32) << 1
      end

      unless b2.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(b2.to_int).&(0x1_u32) << 2
      end

      unless b3.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(b3.to_int).&(0x1_u32) << 3
      end

      unless b4.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(b4.to_int).&(0x1_u32) << 4
      end

      unless b5.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(b5.to_int).&(0x1_u32) << 5
      end

      unless b6.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(b6.to_int).&(0x1_u32) << 6
      end

      unless b7.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(b7.to_int).&(0x1_u32) << 7
      end

      unless b8.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(b8.to_int).&(0x1_u32) << 8
      end

      unless b9.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(b9.to_int).&(0x1_u32) << 9
      end

      unless b10.nil?
        value = (value & 0xfffffbff_u32) |
                UInt32.new!(b10.to_int).&(0x1_u32) << 10
      end

      unless b11.nil?
        value = (value & 0xfffff7ff_u32) |
                UInt32.new!(b11.to_int).&(0x1_u32) << 11
      end

      unless b12.nil?
        value = (value & 0xffffefff_u32) |
                UInt32.new!(b12.to_int).&(0x1_u32) << 12
      end

      unless b13.nil?
        value = (value & 0xffffdfff_u32) |
                UInt32.new!(b13.to_int).&(0x1_u32) << 13
      end

      unless b14.nil?
        value = (value & 0xffffbfff_u32) |
                UInt32.new!(b14.to_int).&(0x1_u32) << 14
      end

      unless b15.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(b15.to_int).&(0x1_u32) << 15
      end

      unless b16.nil?
        value = (value & 0xfffeffff_u32) |
                UInt32.new!(b16.to_int).&(0x1_u32) << 16
      end

      unless b17.nil?
        value = (value & 0xfffdffff_u32) |
                UInt32.new!(b17.to_int).&(0x1_u32) << 17
      end

      unless b18.nil?
        value = (value & 0xfffbffff_u32) |
                UInt32.new!(b18.to_int).&(0x1_u32) << 18
      end

      unless b19.nil?
        value = (value & 0xfff7ffff_u32) |
                UInt32.new!(b19.to_int).&(0x1_u32) << 19
      end

      unless b20.nil?
        value = (value & 0xffefffff_u32) |
                UInt32.new!(b20.to_int).&(0x1_u32) << 20
      end

      unless b21.nil?
        value = (value & 0xffdfffff_u32) |
                UInt32.new!(b21.to_int).&(0x1_u32) << 21
      end

      unless b22.nil?
        value = (value & 0xffbfffff_u32) |
                UInt32.new!(b22.to_int).&(0x1_u32) << 22
      end

      unless b23.nil?
        value = (value & 0xff7fffff_u32) |
                UInt32.new!(b23.to_int).&(0x1_u32) << 23
      end

      unless b24.nil?
        value = (value & 0xfeffffff_u32) |
                UInt32.new!(b24.to_int).&(0x1_u32) << 24
      end

      unless b25.nil?
        value = (value & 0xfdffffff_u32) |
                UInt32.new!(b25.to_int).&(0x1_u32) << 25
      end

      unless b26.nil?
        value = (value & 0xfbffffff_u32) |
                UInt32.new!(b26.to_int).&(0x1_u32) << 26
      end

      unless b27.nil?
        value = (value & 0xf7ffffff_u32) |
                UInt32.new!(b27.to_int).&(0x1_u32) << 27
      end

      unless b28.nil?
        value = (value & 0xefffffff_u32) |
                UInt32.new!(b28.to_int).&(0x1_u32) << 28
      end

      unless b29.nil?
        value = (value & 0xdfffffff_u32) |
                UInt32.new!(b29.to_int).&(0x1_u32) << 29
      end

      unless b30.nil?
        value = (value & 0xbfffffff_u32) |
                UInt32.new!(b30.to_int).&(0x1_u32) << 30
      end

      unless b31.nil?
        value = (value & 0x7fffffff_u32) |
                UInt32.new!(b31.to_int).&(0x1_u32) << 31
      end

      self.class.new(value)
    end

    def self.set(
      *,
      b0 : Bool? = nil,
      b1 : Bool? = nil,
      b2 : Bool? = nil,
      b3 : Bool? = nil,
      b4 : Bool? = nil,
      b5 : Bool? = nil,
      b6 : Bool? = nil,
      b7 : Bool? = nil,
      b8 : Bool? = nil,
      b9 : Bool? = nil,
      b10 : Bool? = nil,
      b11 : Bool? = nil,
      b12 : Bool? = nil,
      b13 : Bool? = nil,
      b14 : Bool? = nil,
      b15 : Bool? = nil,
      b16 : Bool? = nil,
      b17 : Bool? = nil,
      b18 : Bool? = nil,
      b19 : Bool? = nil,
      b20 : Bool? = nil,
      b21 : Bool? = nil,
      b22 : Bool? = nil,
      b23 : Bool? = nil,
      b24 : Bool? = nil,
      b25 : Bool? = nil,
      b26 : Bool? = nil,
      b27 : Bool? = nil,
      b28 : Bool? = nil,
      b29 : Bool? = nil,
      b30 : Bool? = nil,
      b31 : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        b0: b0,
        b1: b1,
        b2: b2,
        b3: b3,
        b4: b4,
        b5: b5,
        b6: b6,
        b7: b7,
        b8: b8,
        b9: b9,
        b10: b10,
        b11: b11,
        b12: b12,
        b13: b13,
        b14: b14,
        b15: b15,
        b16: b16,
        b17: b17,
        b18: b18,
        b19: b19,
        b20: b20,
        b21: b21,
        b22: b22,
        b23: b23,
        b24: b24,
        b25: b25,
        b26: b26,
        b27: b27,
        b28: b28,
        b29: b29,
        b30: b30,
        b31: b31,
      )
    end
  end # struct

  # initialization vector          registers
  struct IV0LR
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

    # IV31
    def iv31 : Bool
      @value.bits_set?(0x1_u32)
    end

    # IV31
    def self.iv31 : Bool
      value.iv31
    end

    # IV31
    def self.iv31=(value : Bool) : Bool
      self.set(iv31: value)
      value
    end

    # IV30
    def iv30 : Bool
      @value.bits_set?(0x2_u32)
    end

    # IV30
    def self.iv30 : Bool
      value.iv30
    end

    # IV30
    def self.iv30=(value : Bool) : Bool
      self.set(iv30: value)
      value
    end

    # IV29
    def iv29 : Bool
      @value.bits_set?(0x4_u32)
    end

    # IV29
    def self.iv29 : Bool
      value.iv29
    end

    # IV29
    def self.iv29=(value : Bool) : Bool
      self.set(iv29: value)
      value
    end

    # IV28
    def iv28 : Bool
      @value.bits_set?(0x8_u32)
    end

    # IV28
    def self.iv28 : Bool
      value.iv28
    end

    # IV28
    def self.iv28=(value : Bool) : Bool
      self.set(iv28: value)
      value
    end

    # IV27
    def iv27 : Bool
      @value.bits_set?(0x10_u32)
    end

    # IV27
    def self.iv27 : Bool
      value.iv27
    end

    # IV27
    def self.iv27=(value : Bool) : Bool
      self.set(iv27: value)
      value
    end

    # IV26
    def iv26 : Bool
      @value.bits_set?(0x20_u32)
    end

    # IV26
    def self.iv26 : Bool
      value.iv26
    end

    # IV26
    def self.iv26=(value : Bool) : Bool
      self.set(iv26: value)
      value
    end

    # IV25
    def iv25 : Bool
      @value.bits_set?(0x40_u32)
    end

    # IV25
    def self.iv25 : Bool
      value.iv25
    end

    # IV25
    def self.iv25=(value : Bool) : Bool
      self.set(iv25: value)
      value
    end

    # IV24
    def iv24 : Bool
      @value.bits_set?(0x80_u32)
    end

    # IV24
    def self.iv24 : Bool
      value.iv24
    end

    # IV24
    def self.iv24=(value : Bool) : Bool
      self.set(iv24: value)
      value
    end

    # IV23
    def iv23 : Bool
      @value.bits_set?(0x100_u32)
    end

    # IV23
    def self.iv23 : Bool
      value.iv23
    end

    # IV23
    def self.iv23=(value : Bool) : Bool
      self.set(iv23: value)
      value
    end

    # IV22
    def iv22 : Bool
      @value.bits_set?(0x200_u32)
    end

    # IV22
    def self.iv22 : Bool
      value.iv22
    end

    # IV22
    def self.iv22=(value : Bool) : Bool
      self.set(iv22: value)
      value
    end

    # IV21
    def iv21 : Bool
      @value.bits_set?(0x400_u32)
    end

    # IV21
    def self.iv21 : Bool
      value.iv21
    end

    # IV21
    def self.iv21=(value : Bool) : Bool
      self.set(iv21: value)
      value
    end

    # IV20
    def iv20 : Bool
      @value.bits_set?(0x800_u32)
    end

    # IV20
    def self.iv20 : Bool
      value.iv20
    end

    # IV20
    def self.iv20=(value : Bool) : Bool
      self.set(iv20: value)
      value
    end

    # IV19
    def iv19 : Bool
      @value.bits_set?(0x1000_u32)
    end

    # IV19
    def self.iv19 : Bool
      value.iv19
    end

    # IV19
    def self.iv19=(value : Bool) : Bool
      self.set(iv19: value)
      value
    end

    # IV18
    def iv18 : Bool
      @value.bits_set?(0x2000_u32)
    end

    # IV18
    def self.iv18 : Bool
      value.iv18
    end

    # IV18
    def self.iv18=(value : Bool) : Bool
      self.set(iv18: value)
      value
    end

    # IV17
    def iv17 : Bool
      @value.bits_set?(0x4000_u32)
    end

    # IV17
    def self.iv17 : Bool
      value.iv17
    end

    # IV17
    def self.iv17=(value : Bool) : Bool
      self.set(iv17: value)
      value
    end

    # IV16
    def iv16 : Bool
      @value.bits_set?(0x8000_u32)
    end

    # IV16
    def self.iv16 : Bool
      value.iv16
    end

    # IV16
    def self.iv16=(value : Bool) : Bool
      self.set(iv16: value)
      value
    end

    # IV15
    def iv15 : Bool
      @value.bits_set?(0x10000_u32)
    end

    # IV15
    def self.iv15 : Bool
      value.iv15
    end

    # IV15
    def self.iv15=(value : Bool) : Bool
      self.set(iv15: value)
      value
    end

    # IV14
    def iv14 : Bool
      @value.bits_set?(0x20000_u32)
    end

    # IV14
    def self.iv14 : Bool
      value.iv14
    end

    # IV14
    def self.iv14=(value : Bool) : Bool
      self.set(iv14: value)
      value
    end

    # IV13
    def iv13 : Bool
      @value.bits_set?(0x40000_u32)
    end

    # IV13
    def self.iv13 : Bool
      value.iv13
    end

    # IV13
    def self.iv13=(value : Bool) : Bool
      self.set(iv13: value)
      value
    end

    # IV12
    def iv12 : Bool
      @value.bits_set?(0x80000_u32)
    end

    # IV12
    def self.iv12 : Bool
      value.iv12
    end

    # IV12
    def self.iv12=(value : Bool) : Bool
      self.set(iv12: value)
      value
    end

    # IV11
    def iv11 : Bool
      @value.bits_set?(0x100000_u32)
    end

    # IV11
    def self.iv11 : Bool
      value.iv11
    end

    # IV11
    def self.iv11=(value : Bool) : Bool
      self.set(iv11: value)
      value
    end

    # IV10
    def iv10 : Bool
      @value.bits_set?(0x200000_u32)
    end

    # IV10
    def self.iv10 : Bool
      value.iv10
    end

    # IV10
    def self.iv10=(value : Bool) : Bool
      self.set(iv10: value)
      value
    end

    # IV9
    def iv9 : Bool
      @value.bits_set?(0x400000_u32)
    end

    # IV9
    def self.iv9 : Bool
      value.iv9
    end

    # IV9
    def self.iv9=(value : Bool) : Bool
      self.set(iv9: value)
      value
    end

    # IV8
    def iv8 : Bool
      @value.bits_set?(0x800000_u32)
    end

    # IV8
    def self.iv8 : Bool
      value.iv8
    end

    # IV8
    def self.iv8=(value : Bool) : Bool
      self.set(iv8: value)
      value
    end

    # IV7
    def iv7 : Bool
      @value.bits_set?(0x1000000_u32)
    end

    # IV7
    def self.iv7 : Bool
      value.iv7
    end

    # IV7
    def self.iv7=(value : Bool) : Bool
      self.set(iv7: value)
      value
    end

    # IV6
    def iv6 : Bool
      @value.bits_set?(0x2000000_u32)
    end

    # IV6
    def self.iv6 : Bool
      value.iv6
    end

    # IV6
    def self.iv6=(value : Bool) : Bool
      self.set(iv6: value)
      value
    end

    # IV5
    def iv5 : Bool
      @value.bits_set?(0x4000000_u32)
    end

    # IV5
    def self.iv5 : Bool
      value.iv5
    end

    # IV5
    def self.iv5=(value : Bool) : Bool
      self.set(iv5: value)
      value
    end

    # IV4
    def iv4 : Bool
      @value.bits_set?(0x8000000_u32)
    end

    # IV4
    def self.iv4 : Bool
      value.iv4
    end

    # IV4
    def self.iv4=(value : Bool) : Bool
      self.set(iv4: value)
      value
    end

    # IV3
    def iv3 : Bool
      @value.bits_set?(0x10000000_u32)
    end

    # IV3
    def self.iv3 : Bool
      value.iv3
    end

    # IV3
    def self.iv3=(value : Bool) : Bool
      self.set(iv3: value)
      value
    end

    # IV2
    def iv2 : Bool
      @value.bits_set?(0x20000000_u32)
    end

    # IV2
    def self.iv2 : Bool
      value.iv2
    end

    # IV2
    def self.iv2=(value : Bool) : Bool
      self.set(iv2: value)
      value
    end

    # IV1
    def iv1 : Bool
      @value.bits_set?(0x40000000_u32)
    end

    # IV1
    def self.iv1 : Bool
      value.iv1
    end

    # IV1
    def self.iv1=(value : Bool) : Bool
      self.set(iv1: value)
      value
    end

    # IV0
    def iv0 : Bool
      @value.bits_set?(0x80000000_u32)
    end

    # IV0
    def self.iv0 : Bool
      value.iv0
    end

    # IV0
    def self.iv0=(value : Bool) : Bool
      self.set(iv0: value)
      value
    end

    def copy_with(
      *,

      iv31 : Bool? = nil,

      iv30 : Bool? = nil,

      iv29 : Bool? = nil,

      iv28 : Bool? = nil,

      iv27 : Bool? = nil,

      iv26 : Bool? = nil,

      iv25 : Bool? = nil,

      iv24 : Bool? = nil,

      iv23 : Bool? = nil,

      iv22 : Bool? = nil,

      iv21 : Bool? = nil,

      iv20 : Bool? = nil,

      iv19 : Bool? = nil,

      iv18 : Bool? = nil,

      iv17 : Bool? = nil,

      iv16 : Bool? = nil,

      iv15 : Bool? = nil,

      iv14 : Bool? = nil,

      iv13 : Bool? = nil,

      iv12 : Bool? = nil,

      iv11 : Bool? = nil,

      iv10 : Bool? = nil,

      iv9 : Bool? = nil,

      iv8 : Bool? = nil,

      iv7 : Bool? = nil,

      iv6 : Bool? = nil,

      iv5 : Bool? = nil,

      iv4 : Bool? = nil,

      iv3 : Bool? = nil,

      iv2 : Bool? = nil,

      iv1 : Bool? = nil,

      iv0 : Bool? = nil
    ) : self
      value = @value

      unless iv31.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(iv31.to_int).&(0x1_u32) << 0
      end

      unless iv30.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(iv30.to_int).&(0x1_u32) << 1
      end

      unless iv29.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(iv29.to_int).&(0x1_u32) << 2
      end

      unless iv28.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(iv28.to_int).&(0x1_u32) << 3
      end

      unless iv27.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(iv27.to_int).&(0x1_u32) << 4
      end

      unless iv26.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(iv26.to_int).&(0x1_u32) << 5
      end

      unless iv25.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(iv25.to_int).&(0x1_u32) << 6
      end

      unless iv24.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(iv24.to_int).&(0x1_u32) << 7
      end

      unless iv23.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(iv23.to_int).&(0x1_u32) << 8
      end

      unless iv22.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(iv22.to_int).&(0x1_u32) << 9
      end

      unless iv21.nil?
        value = (value & 0xfffffbff_u32) |
                UInt32.new!(iv21.to_int).&(0x1_u32) << 10
      end

      unless iv20.nil?
        value = (value & 0xfffff7ff_u32) |
                UInt32.new!(iv20.to_int).&(0x1_u32) << 11
      end

      unless iv19.nil?
        value = (value & 0xffffefff_u32) |
                UInt32.new!(iv19.to_int).&(0x1_u32) << 12
      end

      unless iv18.nil?
        value = (value & 0xffffdfff_u32) |
                UInt32.new!(iv18.to_int).&(0x1_u32) << 13
      end

      unless iv17.nil?
        value = (value & 0xffffbfff_u32) |
                UInt32.new!(iv17.to_int).&(0x1_u32) << 14
      end

      unless iv16.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(iv16.to_int).&(0x1_u32) << 15
      end

      unless iv15.nil?
        value = (value & 0xfffeffff_u32) |
                UInt32.new!(iv15.to_int).&(0x1_u32) << 16
      end

      unless iv14.nil?
        value = (value & 0xfffdffff_u32) |
                UInt32.new!(iv14.to_int).&(0x1_u32) << 17
      end

      unless iv13.nil?
        value = (value & 0xfffbffff_u32) |
                UInt32.new!(iv13.to_int).&(0x1_u32) << 18
      end

      unless iv12.nil?
        value = (value & 0xfff7ffff_u32) |
                UInt32.new!(iv12.to_int).&(0x1_u32) << 19
      end

      unless iv11.nil?
        value = (value & 0xffefffff_u32) |
                UInt32.new!(iv11.to_int).&(0x1_u32) << 20
      end

      unless iv10.nil?
        value = (value & 0xffdfffff_u32) |
                UInt32.new!(iv10.to_int).&(0x1_u32) << 21
      end

      unless iv9.nil?
        value = (value & 0xffbfffff_u32) |
                UInt32.new!(iv9.to_int).&(0x1_u32) << 22
      end

      unless iv8.nil?
        value = (value & 0xff7fffff_u32) |
                UInt32.new!(iv8.to_int).&(0x1_u32) << 23
      end

      unless iv7.nil?
        value = (value & 0xfeffffff_u32) |
                UInt32.new!(iv7.to_int).&(0x1_u32) << 24
      end

      unless iv6.nil?
        value = (value & 0xfdffffff_u32) |
                UInt32.new!(iv6.to_int).&(0x1_u32) << 25
      end

      unless iv5.nil?
        value = (value & 0xfbffffff_u32) |
                UInt32.new!(iv5.to_int).&(0x1_u32) << 26
      end

      unless iv4.nil?
        value = (value & 0xf7ffffff_u32) |
                UInt32.new!(iv4.to_int).&(0x1_u32) << 27
      end

      unless iv3.nil?
        value = (value & 0xefffffff_u32) |
                UInt32.new!(iv3.to_int).&(0x1_u32) << 28
      end

      unless iv2.nil?
        value = (value & 0xdfffffff_u32) |
                UInt32.new!(iv2.to_int).&(0x1_u32) << 29
      end

      unless iv1.nil?
        value = (value & 0xbfffffff_u32) |
                UInt32.new!(iv1.to_int).&(0x1_u32) << 30
      end

      unless iv0.nil?
        value = (value & 0x7fffffff_u32) |
                UInt32.new!(iv0.to_int).&(0x1_u32) << 31
      end

      self.class.new(value)
    end

    def self.set(
      *,
      iv31 : Bool? = nil,
      iv30 : Bool? = nil,
      iv29 : Bool? = nil,
      iv28 : Bool? = nil,
      iv27 : Bool? = nil,
      iv26 : Bool? = nil,
      iv25 : Bool? = nil,
      iv24 : Bool? = nil,
      iv23 : Bool? = nil,
      iv22 : Bool? = nil,
      iv21 : Bool? = nil,
      iv20 : Bool? = nil,
      iv19 : Bool? = nil,
      iv18 : Bool? = nil,
      iv17 : Bool? = nil,
      iv16 : Bool? = nil,
      iv15 : Bool? = nil,
      iv14 : Bool? = nil,
      iv13 : Bool? = nil,
      iv12 : Bool? = nil,
      iv11 : Bool? = nil,
      iv10 : Bool? = nil,
      iv9 : Bool? = nil,
      iv8 : Bool? = nil,
      iv7 : Bool? = nil,
      iv6 : Bool? = nil,
      iv5 : Bool? = nil,
      iv4 : Bool? = nil,
      iv3 : Bool? = nil,
      iv2 : Bool? = nil,
      iv1 : Bool? = nil,
      iv0 : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        iv31: iv31,
        iv30: iv30,
        iv29: iv29,
        iv28: iv28,
        iv27: iv27,
        iv26: iv26,
        iv25: iv25,
        iv24: iv24,
        iv23: iv23,
        iv22: iv22,
        iv21: iv21,
        iv20: iv20,
        iv19: iv19,
        iv18: iv18,
        iv17: iv17,
        iv16: iv16,
        iv15: iv15,
        iv14: iv14,
        iv13: iv13,
        iv12: iv12,
        iv11: iv11,
        iv10: iv10,
        iv9: iv9,
        iv8: iv8,
        iv7: iv7,
        iv6: iv6,
        iv5: iv5,
        iv4: iv4,
        iv3: iv3,
        iv2: iv2,
        iv1: iv1,
        iv0: iv0,
      )
    end
  end # struct

  # initialization vector          registers
  struct IV0RR
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

    # IV63
    def iv63 : Bool
      @value.bits_set?(0x1_u32)
    end

    # IV63
    def self.iv63 : Bool
      value.iv63
    end

    # IV63
    def self.iv63=(value : Bool) : Bool
      self.set(iv63: value)
      value
    end

    # IV62
    def iv62 : Bool
      @value.bits_set?(0x2_u32)
    end

    # IV62
    def self.iv62 : Bool
      value.iv62
    end

    # IV62
    def self.iv62=(value : Bool) : Bool
      self.set(iv62: value)
      value
    end

    # IV61
    def iv61 : Bool
      @value.bits_set?(0x4_u32)
    end

    # IV61
    def self.iv61 : Bool
      value.iv61
    end

    # IV61
    def self.iv61=(value : Bool) : Bool
      self.set(iv61: value)
      value
    end

    # IV60
    def iv60 : Bool
      @value.bits_set?(0x8_u32)
    end

    # IV60
    def self.iv60 : Bool
      value.iv60
    end

    # IV60
    def self.iv60=(value : Bool) : Bool
      self.set(iv60: value)
      value
    end

    # IV59
    def iv59 : Bool
      @value.bits_set?(0x10_u32)
    end

    # IV59
    def self.iv59 : Bool
      value.iv59
    end

    # IV59
    def self.iv59=(value : Bool) : Bool
      self.set(iv59: value)
      value
    end

    # IV58
    def iv58 : Bool
      @value.bits_set?(0x20_u32)
    end

    # IV58
    def self.iv58 : Bool
      value.iv58
    end

    # IV58
    def self.iv58=(value : Bool) : Bool
      self.set(iv58: value)
      value
    end

    # IV57
    def iv57 : Bool
      @value.bits_set?(0x40_u32)
    end

    # IV57
    def self.iv57 : Bool
      value.iv57
    end

    # IV57
    def self.iv57=(value : Bool) : Bool
      self.set(iv57: value)
      value
    end

    # IV56
    def iv56 : Bool
      @value.bits_set?(0x80_u32)
    end

    # IV56
    def self.iv56 : Bool
      value.iv56
    end

    # IV56
    def self.iv56=(value : Bool) : Bool
      self.set(iv56: value)
      value
    end

    # IV55
    def iv55 : Bool
      @value.bits_set?(0x100_u32)
    end

    # IV55
    def self.iv55 : Bool
      value.iv55
    end

    # IV55
    def self.iv55=(value : Bool) : Bool
      self.set(iv55: value)
      value
    end

    # IV54
    def iv54 : Bool
      @value.bits_set?(0x200_u32)
    end

    # IV54
    def self.iv54 : Bool
      value.iv54
    end

    # IV54
    def self.iv54=(value : Bool) : Bool
      self.set(iv54: value)
      value
    end

    # IV53
    def iv53 : Bool
      @value.bits_set?(0x400_u32)
    end

    # IV53
    def self.iv53 : Bool
      value.iv53
    end

    # IV53
    def self.iv53=(value : Bool) : Bool
      self.set(iv53: value)
      value
    end

    # IV52
    def iv52 : Bool
      @value.bits_set?(0x800_u32)
    end

    # IV52
    def self.iv52 : Bool
      value.iv52
    end

    # IV52
    def self.iv52=(value : Bool) : Bool
      self.set(iv52: value)
      value
    end

    # IV51
    def iv51 : Bool
      @value.bits_set?(0x1000_u32)
    end

    # IV51
    def self.iv51 : Bool
      value.iv51
    end

    # IV51
    def self.iv51=(value : Bool) : Bool
      self.set(iv51: value)
      value
    end

    # IV50
    def iv50 : Bool
      @value.bits_set?(0x2000_u32)
    end

    # IV50
    def self.iv50 : Bool
      value.iv50
    end

    # IV50
    def self.iv50=(value : Bool) : Bool
      self.set(iv50: value)
      value
    end

    # IV49
    def iv49 : Bool
      @value.bits_set?(0x4000_u32)
    end

    # IV49
    def self.iv49 : Bool
      value.iv49
    end

    # IV49
    def self.iv49=(value : Bool) : Bool
      self.set(iv49: value)
      value
    end

    # IV48
    def iv48 : Bool
      @value.bits_set?(0x8000_u32)
    end

    # IV48
    def self.iv48 : Bool
      value.iv48
    end

    # IV48
    def self.iv48=(value : Bool) : Bool
      self.set(iv48: value)
      value
    end

    # IV47
    def iv47 : Bool
      @value.bits_set?(0x10000_u32)
    end

    # IV47
    def self.iv47 : Bool
      value.iv47
    end

    # IV47
    def self.iv47=(value : Bool) : Bool
      self.set(iv47: value)
      value
    end

    # IV46
    def iv46 : Bool
      @value.bits_set?(0x20000_u32)
    end

    # IV46
    def self.iv46 : Bool
      value.iv46
    end

    # IV46
    def self.iv46=(value : Bool) : Bool
      self.set(iv46: value)
      value
    end

    # IV45
    def iv45 : Bool
      @value.bits_set?(0x40000_u32)
    end

    # IV45
    def self.iv45 : Bool
      value.iv45
    end

    # IV45
    def self.iv45=(value : Bool) : Bool
      self.set(iv45: value)
      value
    end

    # IV44
    def iv44 : Bool
      @value.bits_set?(0x80000_u32)
    end

    # IV44
    def self.iv44 : Bool
      value.iv44
    end

    # IV44
    def self.iv44=(value : Bool) : Bool
      self.set(iv44: value)
      value
    end

    # IV43
    def iv43 : Bool
      @value.bits_set?(0x100000_u32)
    end

    # IV43
    def self.iv43 : Bool
      value.iv43
    end

    # IV43
    def self.iv43=(value : Bool) : Bool
      self.set(iv43: value)
      value
    end

    # IV42
    def iv42 : Bool
      @value.bits_set?(0x200000_u32)
    end

    # IV42
    def self.iv42 : Bool
      value.iv42
    end

    # IV42
    def self.iv42=(value : Bool) : Bool
      self.set(iv42: value)
      value
    end

    # IV41
    def iv41 : Bool
      @value.bits_set?(0x400000_u32)
    end

    # IV41
    def self.iv41 : Bool
      value.iv41
    end

    # IV41
    def self.iv41=(value : Bool) : Bool
      self.set(iv41: value)
      value
    end

    # IV40
    def iv40 : Bool
      @value.bits_set?(0x800000_u32)
    end

    # IV40
    def self.iv40 : Bool
      value.iv40
    end

    # IV40
    def self.iv40=(value : Bool) : Bool
      self.set(iv40: value)
      value
    end

    # IV39
    def iv39 : Bool
      @value.bits_set?(0x1000000_u32)
    end

    # IV39
    def self.iv39 : Bool
      value.iv39
    end

    # IV39
    def self.iv39=(value : Bool) : Bool
      self.set(iv39: value)
      value
    end

    # IV38
    def iv38 : Bool
      @value.bits_set?(0x2000000_u32)
    end

    # IV38
    def self.iv38 : Bool
      value.iv38
    end

    # IV38
    def self.iv38=(value : Bool) : Bool
      self.set(iv38: value)
      value
    end

    # IV37
    def iv37 : Bool
      @value.bits_set?(0x4000000_u32)
    end

    # IV37
    def self.iv37 : Bool
      value.iv37
    end

    # IV37
    def self.iv37=(value : Bool) : Bool
      self.set(iv37: value)
      value
    end

    # IV36
    def iv36 : Bool
      @value.bits_set?(0x8000000_u32)
    end

    # IV36
    def self.iv36 : Bool
      value.iv36
    end

    # IV36
    def self.iv36=(value : Bool) : Bool
      self.set(iv36: value)
      value
    end

    # IV35
    def iv35 : Bool
      @value.bits_set?(0x10000000_u32)
    end

    # IV35
    def self.iv35 : Bool
      value.iv35
    end

    # IV35
    def self.iv35=(value : Bool) : Bool
      self.set(iv35: value)
      value
    end

    # IV34
    def iv34 : Bool
      @value.bits_set?(0x20000000_u32)
    end

    # IV34
    def self.iv34 : Bool
      value.iv34
    end

    # IV34
    def self.iv34=(value : Bool) : Bool
      self.set(iv34: value)
      value
    end

    # IV33
    def iv33 : Bool
      @value.bits_set?(0x40000000_u32)
    end

    # IV33
    def self.iv33 : Bool
      value.iv33
    end

    # IV33
    def self.iv33=(value : Bool) : Bool
      self.set(iv33: value)
      value
    end

    # IV32
    def iv32 : Bool
      @value.bits_set?(0x80000000_u32)
    end

    # IV32
    def self.iv32 : Bool
      value.iv32
    end

    # IV32
    def self.iv32=(value : Bool) : Bool
      self.set(iv32: value)
      value
    end

    def copy_with(
      *,

      iv63 : Bool? = nil,

      iv62 : Bool? = nil,

      iv61 : Bool? = nil,

      iv60 : Bool? = nil,

      iv59 : Bool? = nil,

      iv58 : Bool? = nil,

      iv57 : Bool? = nil,

      iv56 : Bool? = nil,

      iv55 : Bool? = nil,

      iv54 : Bool? = nil,

      iv53 : Bool? = nil,

      iv52 : Bool? = nil,

      iv51 : Bool? = nil,

      iv50 : Bool? = nil,

      iv49 : Bool? = nil,

      iv48 : Bool? = nil,

      iv47 : Bool? = nil,

      iv46 : Bool? = nil,

      iv45 : Bool? = nil,

      iv44 : Bool? = nil,

      iv43 : Bool? = nil,

      iv42 : Bool? = nil,

      iv41 : Bool? = nil,

      iv40 : Bool? = nil,

      iv39 : Bool? = nil,

      iv38 : Bool? = nil,

      iv37 : Bool? = nil,

      iv36 : Bool? = nil,

      iv35 : Bool? = nil,

      iv34 : Bool? = nil,

      iv33 : Bool? = nil,

      iv32 : Bool? = nil
    ) : self
      value = @value

      unless iv63.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(iv63.to_int).&(0x1_u32) << 0
      end

      unless iv62.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(iv62.to_int).&(0x1_u32) << 1
      end

      unless iv61.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(iv61.to_int).&(0x1_u32) << 2
      end

      unless iv60.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(iv60.to_int).&(0x1_u32) << 3
      end

      unless iv59.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(iv59.to_int).&(0x1_u32) << 4
      end

      unless iv58.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(iv58.to_int).&(0x1_u32) << 5
      end

      unless iv57.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(iv57.to_int).&(0x1_u32) << 6
      end

      unless iv56.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(iv56.to_int).&(0x1_u32) << 7
      end

      unless iv55.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(iv55.to_int).&(0x1_u32) << 8
      end

      unless iv54.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(iv54.to_int).&(0x1_u32) << 9
      end

      unless iv53.nil?
        value = (value & 0xfffffbff_u32) |
                UInt32.new!(iv53.to_int).&(0x1_u32) << 10
      end

      unless iv52.nil?
        value = (value & 0xfffff7ff_u32) |
                UInt32.new!(iv52.to_int).&(0x1_u32) << 11
      end

      unless iv51.nil?
        value = (value & 0xffffefff_u32) |
                UInt32.new!(iv51.to_int).&(0x1_u32) << 12
      end

      unless iv50.nil?
        value = (value & 0xffffdfff_u32) |
                UInt32.new!(iv50.to_int).&(0x1_u32) << 13
      end

      unless iv49.nil?
        value = (value & 0xffffbfff_u32) |
                UInt32.new!(iv49.to_int).&(0x1_u32) << 14
      end

      unless iv48.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(iv48.to_int).&(0x1_u32) << 15
      end

      unless iv47.nil?
        value = (value & 0xfffeffff_u32) |
                UInt32.new!(iv47.to_int).&(0x1_u32) << 16
      end

      unless iv46.nil?
        value = (value & 0xfffdffff_u32) |
                UInt32.new!(iv46.to_int).&(0x1_u32) << 17
      end

      unless iv45.nil?
        value = (value & 0xfffbffff_u32) |
                UInt32.new!(iv45.to_int).&(0x1_u32) << 18
      end

      unless iv44.nil?
        value = (value & 0xfff7ffff_u32) |
                UInt32.new!(iv44.to_int).&(0x1_u32) << 19
      end

      unless iv43.nil?
        value = (value & 0xffefffff_u32) |
                UInt32.new!(iv43.to_int).&(0x1_u32) << 20
      end

      unless iv42.nil?
        value = (value & 0xffdfffff_u32) |
                UInt32.new!(iv42.to_int).&(0x1_u32) << 21
      end

      unless iv41.nil?
        value = (value & 0xffbfffff_u32) |
                UInt32.new!(iv41.to_int).&(0x1_u32) << 22
      end

      unless iv40.nil?
        value = (value & 0xff7fffff_u32) |
                UInt32.new!(iv40.to_int).&(0x1_u32) << 23
      end

      unless iv39.nil?
        value = (value & 0xfeffffff_u32) |
                UInt32.new!(iv39.to_int).&(0x1_u32) << 24
      end

      unless iv38.nil?
        value = (value & 0xfdffffff_u32) |
                UInt32.new!(iv38.to_int).&(0x1_u32) << 25
      end

      unless iv37.nil?
        value = (value & 0xfbffffff_u32) |
                UInt32.new!(iv37.to_int).&(0x1_u32) << 26
      end

      unless iv36.nil?
        value = (value & 0xf7ffffff_u32) |
                UInt32.new!(iv36.to_int).&(0x1_u32) << 27
      end

      unless iv35.nil?
        value = (value & 0xefffffff_u32) |
                UInt32.new!(iv35.to_int).&(0x1_u32) << 28
      end

      unless iv34.nil?
        value = (value & 0xdfffffff_u32) |
                UInt32.new!(iv34.to_int).&(0x1_u32) << 29
      end

      unless iv33.nil?
        value = (value & 0xbfffffff_u32) |
                UInt32.new!(iv33.to_int).&(0x1_u32) << 30
      end

      unless iv32.nil?
        value = (value & 0x7fffffff_u32) |
                UInt32.new!(iv32.to_int).&(0x1_u32) << 31
      end

      self.class.new(value)
    end

    def self.set(
      *,
      iv63 : Bool? = nil,
      iv62 : Bool? = nil,
      iv61 : Bool? = nil,
      iv60 : Bool? = nil,
      iv59 : Bool? = nil,
      iv58 : Bool? = nil,
      iv57 : Bool? = nil,
      iv56 : Bool? = nil,
      iv55 : Bool? = nil,
      iv54 : Bool? = nil,
      iv53 : Bool? = nil,
      iv52 : Bool? = nil,
      iv51 : Bool? = nil,
      iv50 : Bool? = nil,
      iv49 : Bool? = nil,
      iv48 : Bool? = nil,
      iv47 : Bool? = nil,
      iv46 : Bool? = nil,
      iv45 : Bool? = nil,
      iv44 : Bool? = nil,
      iv43 : Bool? = nil,
      iv42 : Bool? = nil,
      iv41 : Bool? = nil,
      iv40 : Bool? = nil,
      iv39 : Bool? = nil,
      iv38 : Bool? = nil,
      iv37 : Bool? = nil,
      iv36 : Bool? = nil,
      iv35 : Bool? = nil,
      iv34 : Bool? = nil,
      iv33 : Bool? = nil,
      iv32 : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        iv63: iv63,
        iv62: iv62,
        iv61: iv61,
        iv60: iv60,
        iv59: iv59,
        iv58: iv58,
        iv57: iv57,
        iv56: iv56,
        iv55: iv55,
        iv54: iv54,
        iv53: iv53,
        iv52: iv52,
        iv51: iv51,
        iv50: iv50,
        iv49: iv49,
        iv48: iv48,
        iv47: iv47,
        iv46: iv46,
        iv45: iv45,
        iv44: iv44,
        iv43: iv43,
        iv42: iv42,
        iv41: iv41,
        iv40: iv40,
        iv39: iv39,
        iv38: iv38,
        iv37: iv37,
        iv36: iv36,
        iv35: iv35,
        iv34: iv34,
        iv33: iv33,
        iv32: iv32,
      )
    end
  end # struct

  # initialization vector          registers
  struct IV1LR
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

    # IV95
    def iv95 : Bool
      @value.bits_set?(0x1_u32)
    end

    # IV95
    def self.iv95 : Bool
      value.iv95
    end

    # IV95
    def self.iv95=(value : Bool) : Bool
      self.set(iv95: value)
      value
    end

    # IV94
    def iv94 : Bool
      @value.bits_set?(0x2_u32)
    end

    # IV94
    def self.iv94 : Bool
      value.iv94
    end

    # IV94
    def self.iv94=(value : Bool) : Bool
      self.set(iv94: value)
      value
    end

    # IV93
    def iv93 : Bool
      @value.bits_set?(0x4_u32)
    end

    # IV93
    def self.iv93 : Bool
      value.iv93
    end

    # IV93
    def self.iv93=(value : Bool) : Bool
      self.set(iv93: value)
      value
    end

    # IV92
    def iv92 : Bool
      @value.bits_set?(0x8_u32)
    end

    # IV92
    def self.iv92 : Bool
      value.iv92
    end

    # IV92
    def self.iv92=(value : Bool) : Bool
      self.set(iv92: value)
      value
    end

    # IV91
    def iv91 : Bool
      @value.bits_set?(0x10_u32)
    end

    # IV91
    def self.iv91 : Bool
      value.iv91
    end

    # IV91
    def self.iv91=(value : Bool) : Bool
      self.set(iv91: value)
      value
    end

    # IV90
    def iv90 : Bool
      @value.bits_set?(0x20_u32)
    end

    # IV90
    def self.iv90 : Bool
      value.iv90
    end

    # IV90
    def self.iv90=(value : Bool) : Bool
      self.set(iv90: value)
      value
    end

    # IV89
    def iv89 : Bool
      @value.bits_set?(0x40_u32)
    end

    # IV89
    def self.iv89 : Bool
      value.iv89
    end

    # IV89
    def self.iv89=(value : Bool) : Bool
      self.set(iv89: value)
      value
    end

    # IV88
    def iv88 : Bool
      @value.bits_set?(0x80_u32)
    end

    # IV88
    def self.iv88 : Bool
      value.iv88
    end

    # IV88
    def self.iv88=(value : Bool) : Bool
      self.set(iv88: value)
      value
    end

    # IV87
    def iv87 : Bool
      @value.bits_set?(0x100_u32)
    end

    # IV87
    def self.iv87 : Bool
      value.iv87
    end

    # IV87
    def self.iv87=(value : Bool) : Bool
      self.set(iv87: value)
      value
    end

    # IV86
    def iv86 : Bool
      @value.bits_set?(0x200_u32)
    end

    # IV86
    def self.iv86 : Bool
      value.iv86
    end

    # IV86
    def self.iv86=(value : Bool) : Bool
      self.set(iv86: value)
      value
    end

    # IV85
    def iv85 : Bool
      @value.bits_set?(0x400_u32)
    end

    # IV85
    def self.iv85 : Bool
      value.iv85
    end

    # IV85
    def self.iv85=(value : Bool) : Bool
      self.set(iv85: value)
      value
    end

    # IV84
    def iv84 : Bool
      @value.bits_set?(0x800_u32)
    end

    # IV84
    def self.iv84 : Bool
      value.iv84
    end

    # IV84
    def self.iv84=(value : Bool) : Bool
      self.set(iv84: value)
      value
    end

    # IV83
    def iv83 : Bool
      @value.bits_set?(0x1000_u32)
    end

    # IV83
    def self.iv83 : Bool
      value.iv83
    end

    # IV83
    def self.iv83=(value : Bool) : Bool
      self.set(iv83: value)
      value
    end

    # IV82
    def iv82 : Bool
      @value.bits_set?(0x2000_u32)
    end

    # IV82
    def self.iv82 : Bool
      value.iv82
    end

    # IV82
    def self.iv82=(value : Bool) : Bool
      self.set(iv82: value)
      value
    end

    # IV81
    def iv81 : Bool
      @value.bits_set?(0x4000_u32)
    end

    # IV81
    def self.iv81 : Bool
      value.iv81
    end

    # IV81
    def self.iv81=(value : Bool) : Bool
      self.set(iv81: value)
      value
    end

    # IV80
    def iv80 : Bool
      @value.bits_set?(0x8000_u32)
    end

    # IV80
    def self.iv80 : Bool
      value.iv80
    end

    # IV80
    def self.iv80=(value : Bool) : Bool
      self.set(iv80: value)
      value
    end

    # IV79
    def iv79 : Bool
      @value.bits_set?(0x10000_u32)
    end

    # IV79
    def self.iv79 : Bool
      value.iv79
    end

    # IV79
    def self.iv79=(value : Bool) : Bool
      self.set(iv79: value)
      value
    end

    # IV78
    def iv78 : Bool
      @value.bits_set?(0x20000_u32)
    end

    # IV78
    def self.iv78 : Bool
      value.iv78
    end

    # IV78
    def self.iv78=(value : Bool) : Bool
      self.set(iv78: value)
      value
    end

    # IV77
    def iv77 : Bool
      @value.bits_set?(0x40000_u32)
    end

    # IV77
    def self.iv77 : Bool
      value.iv77
    end

    # IV77
    def self.iv77=(value : Bool) : Bool
      self.set(iv77: value)
      value
    end

    # IV76
    def iv76 : Bool
      @value.bits_set?(0x80000_u32)
    end

    # IV76
    def self.iv76 : Bool
      value.iv76
    end

    # IV76
    def self.iv76=(value : Bool) : Bool
      self.set(iv76: value)
      value
    end

    # IV75
    def iv75 : Bool
      @value.bits_set?(0x100000_u32)
    end

    # IV75
    def self.iv75 : Bool
      value.iv75
    end

    # IV75
    def self.iv75=(value : Bool) : Bool
      self.set(iv75: value)
      value
    end

    # IV74
    def iv74 : Bool
      @value.bits_set?(0x200000_u32)
    end

    # IV74
    def self.iv74 : Bool
      value.iv74
    end

    # IV74
    def self.iv74=(value : Bool) : Bool
      self.set(iv74: value)
      value
    end

    # IV73
    def iv73 : Bool
      @value.bits_set?(0x400000_u32)
    end

    # IV73
    def self.iv73 : Bool
      value.iv73
    end

    # IV73
    def self.iv73=(value : Bool) : Bool
      self.set(iv73: value)
      value
    end

    # IV72
    def iv72 : Bool
      @value.bits_set?(0x800000_u32)
    end

    # IV72
    def self.iv72 : Bool
      value.iv72
    end

    # IV72
    def self.iv72=(value : Bool) : Bool
      self.set(iv72: value)
      value
    end

    # IV71
    def iv71 : Bool
      @value.bits_set?(0x1000000_u32)
    end

    # IV71
    def self.iv71 : Bool
      value.iv71
    end

    # IV71
    def self.iv71=(value : Bool) : Bool
      self.set(iv71: value)
      value
    end

    # IV70
    def iv70 : Bool
      @value.bits_set?(0x2000000_u32)
    end

    # IV70
    def self.iv70 : Bool
      value.iv70
    end

    # IV70
    def self.iv70=(value : Bool) : Bool
      self.set(iv70: value)
      value
    end

    # IV69
    def iv69 : Bool
      @value.bits_set?(0x4000000_u32)
    end

    # IV69
    def self.iv69 : Bool
      value.iv69
    end

    # IV69
    def self.iv69=(value : Bool) : Bool
      self.set(iv69: value)
      value
    end

    # IV68
    def iv68 : Bool
      @value.bits_set?(0x8000000_u32)
    end

    # IV68
    def self.iv68 : Bool
      value.iv68
    end

    # IV68
    def self.iv68=(value : Bool) : Bool
      self.set(iv68: value)
      value
    end

    # IV67
    def iv67 : Bool
      @value.bits_set?(0x10000000_u32)
    end

    # IV67
    def self.iv67 : Bool
      value.iv67
    end

    # IV67
    def self.iv67=(value : Bool) : Bool
      self.set(iv67: value)
      value
    end

    # IV66
    def iv66 : Bool
      @value.bits_set?(0x20000000_u32)
    end

    # IV66
    def self.iv66 : Bool
      value.iv66
    end

    # IV66
    def self.iv66=(value : Bool) : Bool
      self.set(iv66: value)
      value
    end

    # IV65
    def iv65 : Bool
      @value.bits_set?(0x40000000_u32)
    end

    # IV65
    def self.iv65 : Bool
      value.iv65
    end

    # IV65
    def self.iv65=(value : Bool) : Bool
      self.set(iv65: value)
      value
    end

    # IV64
    def iv64 : Bool
      @value.bits_set?(0x80000000_u32)
    end

    # IV64
    def self.iv64 : Bool
      value.iv64
    end

    # IV64
    def self.iv64=(value : Bool) : Bool
      self.set(iv64: value)
      value
    end

    def copy_with(
      *,

      iv95 : Bool? = nil,

      iv94 : Bool? = nil,

      iv93 : Bool? = nil,

      iv92 : Bool? = nil,

      iv91 : Bool? = nil,

      iv90 : Bool? = nil,

      iv89 : Bool? = nil,

      iv88 : Bool? = nil,

      iv87 : Bool? = nil,

      iv86 : Bool? = nil,

      iv85 : Bool? = nil,

      iv84 : Bool? = nil,

      iv83 : Bool? = nil,

      iv82 : Bool? = nil,

      iv81 : Bool? = nil,

      iv80 : Bool? = nil,

      iv79 : Bool? = nil,

      iv78 : Bool? = nil,

      iv77 : Bool? = nil,

      iv76 : Bool? = nil,

      iv75 : Bool? = nil,

      iv74 : Bool? = nil,

      iv73 : Bool? = nil,

      iv72 : Bool? = nil,

      iv71 : Bool? = nil,

      iv70 : Bool? = nil,

      iv69 : Bool? = nil,

      iv68 : Bool? = nil,

      iv67 : Bool? = nil,

      iv66 : Bool? = nil,

      iv65 : Bool? = nil,

      iv64 : Bool? = nil
    ) : self
      value = @value

      unless iv95.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(iv95.to_int).&(0x1_u32) << 0
      end

      unless iv94.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(iv94.to_int).&(0x1_u32) << 1
      end

      unless iv93.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(iv93.to_int).&(0x1_u32) << 2
      end

      unless iv92.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(iv92.to_int).&(0x1_u32) << 3
      end

      unless iv91.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(iv91.to_int).&(0x1_u32) << 4
      end

      unless iv90.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(iv90.to_int).&(0x1_u32) << 5
      end

      unless iv89.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(iv89.to_int).&(0x1_u32) << 6
      end

      unless iv88.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(iv88.to_int).&(0x1_u32) << 7
      end

      unless iv87.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(iv87.to_int).&(0x1_u32) << 8
      end

      unless iv86.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(iv86.to_int).&(0x1_u32) << 9
      end

      unless iv85.nil?
        value = (value & 0xfffffbff_u32) |
                UInt32.new!(iv85.to_int).&(0x1_u32) << 10
      end

      unless iv84.nil?
        value = (value & 0xfffff7ff_u32) |
                UInt32.new!(iv84.to_int).&(0x1_u32) << 11
      end

      unless iv83.nil?
        value = (value & 0xffffefff_u32) |
                UInt32.new!(iv83.to_int).&(0x1_u32) << 12
      end

      unless iv82.nil?
        value = (value & 0xffffdfff_u32) |
                UInt32.new!(iv82.to_int).&(0x1_u32) << 13
      end

      unless iv81.nil?
        value = (value & 0xffffbfff_u32) |
                UInt32.new!(iv81.to_int).&(0x1_u32) << 14
      end

      unless iv80.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(iv80.to_int).&(0x1_u32) << 15
      end

      unless iv79.nil?
        value = (value & 0xfffeffff_u32) |
                UInt32.new!(iv79.to_int).&(0x1_u32) << 16
      end

      unless iv78.nil?
        value = (value & 0xfffdffff_u32) |
                UInt32.new!(iv78.to_int).&(0x1_u32) << 17
      end

      unless iv77.nil?
        value = (value & 0xfffbffff_u32) |
                UInt32.new!(iv77.to_int).&(0x1_u32) << 18
      end

      unless iv76.nil?
        value = (value & 0xfff7ffff_u32) |
                UInt32.new!(iv76.to_int).&(0x1_u32) << 19
      end

      unless iv75.nil?
        value = (value & 0xffefffff_u32) |
                UInt32.new!(iv75.to_int).&(0x1_u32) << 20
      end

      unless iv74.nil?
        value = (value & 0xffdfffff_u32) |
                UInt32.new!(iv74.to_int).&(0x1_u32) << 21
      end

      unless iv73.nil?
        value = (value & 0xffbfffff_u32) |
                UInt32.new!(iv73.to_int).&(0x1_u32) << 22
      end

      unless iv72.nil?
        value = (value & 0xff7fffff_u32) |
                UInt32.new!(iv72.to_int).&(0x1_u32) << 23
      end

      unless iv71.nil?
        value = (value & 0xfeffffff_u32) |
                UInt32.new!(iv71.to_int).&(0x1_u32) << 24
      end

      unless iv70.nil?
        value = (value & 0xfdffffff_u32) |
                UInt32.new!(iv70.to_int).&(0x1_u32) << 25
      end

      unless iv69.nil?
        value = (value & 0xfbffffff_u32) |
                UInt32.new!(iv69.to_int).&(0x1_u32) << 26
      end

      unless iv68.nil?
        value = (value & 0xf7ffffff_u32) |
                UInt32.new!(iv68.to_int).&(0x1_u32) << 27
      end

      unless iv67.nil?
        value = (value & 0xefffffff_u32) |
                UInt32.new!(iv67.to_int).&(0x1_u32) << 28
      end

      unless iv66.nil?
        value = (value & 0xdfffffff_u32) |
                UInt32.new!(iv66.to_int).&(0x1_u32) << 29
      end

      unless iv65.nil?
        value = (value & 0xbfffffff_u32) |
                UInt32.new!(iv65.to_int).&(0x1_u32) << 30
      end

      unless iv64.nil?
        value = (value & 0x7fffffff_u32) |
                UInt32.new!(iv64.to_int).&(0x1_u32) << 31
      end

      self.class.new(value)
    end

    def self.set(
      *,
      iv95 : Bool? = nil,
      iv94 : Bool? = nil,
      iv93 : Bool? = nil,
      iv92 : Bool? = nil,
      iv91 : Bool? = nil,
      iv90 : Bool? = nil,
      iv89 : Bool? = nil,
      iv88 : Bool? = nil,
      iv87 : Bool? = nil,
      iv86 : Bool? = nil,
      iv85 : Bool? = nil,
      iv84 : Bool? = nil,
      iv83 : Bool? = nil,
      iv82 : Bool? = nil,
      iv81 : Bool? = nil,
      iv80 : Bool? = nil,
      iv79 : Bool? = nil,
      iv78 : Bool? = nil,
      iv77 : Bool? = nil,
      iv76 : Bool? = nil,
      iv75 : Bool? = nil,
      iv74 : Bool? = nil,
      iv73 : Bool? = nil,
      iv72 : Bool? = nil,
      iv71 : Bool? = nil,
      iv70 : Bool? = nil,
      iv69 : Bool? = nil,
      iv68 : Bool? = nil,
      iv67 : Bool? = nil,
      iv66 : Bool? = nil,
      iv65 : Bool? = nil,
      iv64 : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        iv95: iv95,
        iv94: iv94,
        iv93: iv93,
        iv92: iv92,
        iv91: iv91,
        iv90: iv90,
        iv89: iv89,
        iv88: iv88,
        iv87: iv87,
        iv86: iv86,
        iv85: iv85,
        iv84: iv84,
        iv83: iv83,
        iv82: iv82,
        iv81: iv81,
        iv80: iv80,
        iv79: iv79,
        iv78: iv78,
        iv77: iv77,
        iv76: iv76,
        iv75: iv75,
        iv74: iv74,
        iv73: iv73,
        iv72: iv72,
        iv71: iv71,
        iv70: iv70,
        iv69: iv69,
        iv68: iv68,
        iv67: iv67,
        iv66: iv66,
        iv65: iv65,
        iv64: iv64,
      )
    end
  end # struct

  # initialization vector          registers
  struct IV1RR
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

    # IV127
    def iv127 : Bool
      @value.bits_set?(0x1_u32)
    end

    # IV127
    def self.iv127 : Bool
      value.iv127
    end

    # IV127
    def self.iv127=(value : Bool) : Bool
      self.set(iv127: value)
      value
    end

    # IV126
    def iv126 : Bool
      @value.bits_set?(0x2_u32)
    end

    # IV126
    def self.iv126 : Bool
      value.iv126
    end

    # IV126
    def self.iv126=(value : Bool) : Bool
      self.set(iv126: value)
      value
    end

    # IV125
    def iv125 : Bool
      @value.bits_set?(0x4_u32)
    end

    # IV125
    def self.iv125 : Bool
      value.iv125
    end

    # IV125
    def self.iv125=(value : Bool) : Bool
      self.set(iv125: value)
      value
    end

    # IV124
    def iv124 : Bool
      @value.bits_set?(0x8_u32)
    end

    # IV124
    def self.iv124 : Bool
      value.iv124
    end

    # IV124
    def self.iv124=(value : Bool) : Bool
      self.set(iv124: value)
      value
    end

    # IV123
    def iv123 : Bool
      @value.bits_set?(0x10_u32)
    end

    # IV123
    def self.iv123 : Bool
      value.iv123
    end

    # IV123
    def self.iv123=(value : Bool) : Bool
      self.set(iv123: value)
      value
    end

    # IV122
    def iv122 : Bool
      @value.bits_set?(0x20_u32)
    end

    # IV122
    def self.iv122 : Bool
      value.iv122
    end

    # IV122
    def self.iv122=(value : Bool) : Bool
      self.set(iv122: value)
      value
    end

    # IV121
    def iv121 : Bool
      @value.bits_set?(0x40_u32)
    end

    # IV121
    def self.iv121 : Bool
      value.iv121
    end

    # IV121
    def self.iv121=(value : Bool) : Bool
      self.set(iv121: value)
      value
    end

    # IV120
    def iv120 : Bool
      @value.bits_set?(0x80_u32)
    end

    # IV120
    def self.iv120 : Bool
      value.iv120
    end

    # IV120
    def self.iv120=(value : Bool) : Bool
      self.set(iv120: value)
      value
    end

    # IV119
    def iv119 : Bool
      @value.bits_set?(0x100_u32)
    end

    # IV119
    def self.iv119 : Bool
      value.iv119
    end

    # IV119
    def self.iv119=(value : Bool) : Bool
      self.set(iv119: value)
      value
    end

    # IV118
    def iv118 : Bool
      @value.bits_set?(0x200_u32)
    end

    # IV118
    def self.iv118 : Bool
      value.iv118
    end

    # IV118
    def self.iv118=(value : Bool) : Bool
      self.set(iv118: value)
      value
    end

    # IV117
    def iv117 : Bool
      @value.bits_set?(0x400_u32)
    end

    # IV117
    def self.iv117 : Bool
      value.iv117
    end

    # IV117
    def self.iv117=(value : Bool) : Bool
      self.set(iv117: value)
      value
    end

    # IV116
    def iv116 : Bool
      @value.bits_set?(0x800_u32)
    end

    # IV116
    def self.iv116 : Bool
      value.iv116
    end

    # IV116
    def self.iv116=(value : Bool) : Bool
      self.set(iv116: value)
      value
    end

    # IV115
    def iv115 : Bool
      @value.bits_set?(0x1000_u32)
    end

    # IV115
    def self.iv115 : Bool
      value.iv115
    end

    # IV115
    def self.iv115=(value : Bool) : Bool
      self.set(iv115: value)
      value
    end

    # IV114
    def iv114 : Bool
      @value.bits_set?(0x2000_u32)
    end

    # IV114
    def self.iv114 : Bool
      value.iv114
    end

    # IV114
    def self.iv114=(value : Bool) : Bool
      self.set(iv114: value)
      value
    end

    # IV113
    def iv113 : Bool
      @value.bits_set?(0x4000_u32)
    end

    # IV113
    def self.iv113 : Bool
      value.iv113
    end

    # IV113
    def self.iv113=(value : Bool) : Bool
      self.set(iv113: value)
      value
    end

    # IV112
    def iv112 : Bool
      @value.bits_set?(0x8000_u32)
    end

    # IV112
    def self.iv112 : Bool
      value.iv112
    end

    # IV112
    def self.iv112=(value : Bool) : Bool
      self.set(iv112: value)
      value
    end

    # IV111
    def iv111 : Bool
      @value.bits_set?(0x10000_u32)
    end

    # IV111
    def self.iv111 : Bool
      value.iv111
    end

    # IV111
    def self.iv111=(value : Bool) : Bool
      self.set(iv111: value)
      value
    end

    # IV110
    def iv110 : Bool
      @value.bits_set?(0x20000_u32)
    end

    # IV110
    def self.iv110 : Bool
      value.iv110
    end

    # IV110
    def self.iv110=(value : Bool) : Bool
      self.set(iv110: value)
      value
    end

    # IV109
    def iv109 : Bool
      @value.bits_set?(0x40000_u32)
    end

    # IV109
    def self.iv109 : Bool
      value.iv109
    end

    # IV109
    def self.iv109=(value : Bool) : Bool
      self.set(iv109: value)
      value
    end

    # IV108
    def iv108 : Bool
      @value.bits_set?(0x80000_u32)
    end

    # IV108
    def self.iv108 : Bool
      value.iv108
    end

    # IV108
    def self.iv108=(value : Bool) : Bool
      self.set(iv108: value)
      value
    end

    # IV107
    def iv107 : Bool
      @value.bits_set?(0x100000_u32)
    end

    # IV107
    def self.iv107 : Bool
      value.iv107
    end

    # IV107
    def self.iv107=(value : Bool) : Bool
      self.set(iv107: value)
      value
    end

    # IV106
    def iv106 : Bool
      @value.bits_set?(0x200000_u32)
    end

    # IV106
    def self.iv106 : Bool
      value.iv106
    end

    # IV106
    def self.iv106=(value : Bool) : Bool
      self.set(iv106: value)
      value
    end

    # IV105
    def iv105 : Bool
      @value.bits_set?(0x400000_u32)
    end

    # IV105
    def self.iv105 : Bool
      value.iv105
    end

    # IV105
    def self.iv105=(value : Bool) : Bool
      self.set(iv105: value)
      value
    end

    # IV104
    def iv104 : Bool
      @value.bits_set?(0x800000_u32)
    end

    # IV104
    def self.iv104 : Bool
      value.iv104
    end

    # IV104
    def self.iv104=(value : Bool) : Bool
      self.set(iv104: value)
      value
    end

    # IV103
    def iv103 : Bool
      @value.bits_set?(0x1000000_u32)
    end

    # IV103
    def self.iv103 : Bool
      value.iv103
    end

    # IV103
    def self.iv103=(value : Bool) : Bool
      self.set(iv103: value)
      value
    end

    # IV102
    def iv102 : Bool
      @value.bits_set?(0x2000000_u32)
    end

    # IV102
    def self.iv102 : Bool
      value.iv102
    end

    # IV102
    def self.iv102=(value : Bool) : Bool
      self.set(iv102: value)
      value
    end

    # IV101
    def iv101 : Bool
      @value.bits_set?(0x4000000_u32)
    end

    # IV101
    def self.iv101 : Bool
      value.iv101
    end

    # IV101
    def self.iv101=(value : Bool) : Bool
      self.set(iv101: value)
      value
    end

    # IV100
    def iv100 : Bool
      @value.bits_set?(0x8000000_u32)
    end

    # IV100
    def self.iv100 : Bool
      value.iv100
    end

    # IV100
    def self.iv100=(value : Bool) : Bool
      self.set(iv100: value)
      value
    end

    # IV99
    def iv99 : Bool
      @value.bits_set?(0x10000000_u32)
    end

    # IV99
    def self.iv99 : Bool
      value.iv99
    end

    # IV99
    def self.iv99=(value : Bool) : Bool
      self.set(iv99: value)
      value
    end

    # IV98
    def iv98 : Bool
      @value.bits_set?(0x20000000_u32)
    end

    # IV98
    def self.iv98 : Bool
      value.iv98
    end

    # IV98
    def self.iv98=(value : Bool) : Bool
      self.set(iv98: value)
      value
    end

    # IV97
    def iv97 : Bool
      @value.bits_set?(0x40000000_u32)
    end

    # IV97
    def self.iv97 : Bool
      value.iv97
    end

    # IV97
    def self.iv97=(value : Bool) : Bool
      self.set(iv97: value)
      value
    end

    # IV96
    def iv96 : Bool
      @value.bits_set?(0x80000000_u32)
    end

    # IV96
    def self.iv96 : Bool
      value.iv96
    end

    # IV96
    def self.iv96=(value : Bool) : Bool
      self.set(iv96: value)
      value
    end

    def copy_with(
      *,

      iv127 : Bool? = nil,

      iv126 : Bool? = nil,

      iv125 : Bool? = nil,

      iv124 : Bool? = nil,

      iv123 : Bool? = nil,

      iv122 : Bool? = nil,

      iv121 : Bool? = nil,

      iv120 : Bool? = nil,

      iv119 : Bool? = nil,

      iv118 : Bool? = nil,

      iv117 : Bool? = nil,

      iv116 : Bool? = nil,

      iv115 : Bool? = nil,

      iv114 : Bool? = nil,

      iv113 : Bool? = nil,

      iv112 : Bool? = nil,

      iv111 : Bool? = nil,

      iv110 : Bool? = nil,

      iv109 : Bool? = nil,

      iv108 : Bool? = nil,

      iv107 : Bool? = nil,

      iv106 : Bool? = nil,

      iv105 : Bool? = nil,

      iv104 : Bool? = nil,

      iv103 : Bool? = nil,

      iv102 : Bool? = nil,

      iv101 : Bool? = nil,

      iv100 : Bool? = nil,

      iv99 : Bool? = nil,

      iv98 : Bool? = nil,

      iv97 : Bool? = nil,

      iv96 : Bool? = nil
    ) : self
      value = @value

      unless iv127.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(iv127.to_int).&(0x1_u32) << 0
      end

      unless iv126.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(iv126.to_int).&(0x1_u32) << 1
      end

      unless iv125.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(iv125.to_int).&(0x1_u32) << 2
      end

      unless iv124.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(iv124.to_int).&(0x1_u32) << 3
      end

      unless iv123.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(iv123.to_int).&(0x1_u32) << 4
      end

      unless iv122.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(iv122.to_int).&(0x1_u32) << 5
      end

      unless iv121.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(iv121.to_int).&(0x1_u32) << 6
      end

      unless iv120.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(iv120.to_int).&(0x1_u32) << 7
      end

      unless iv119.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(iv119.to_int).&(0x1_u32) << 8
      end

      unless iv118.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(iv118.to_int).&(0x1_u32) << 9
      end

      unless iv117.nil?
        value = (value & 0xfffffbff_u32) |
                UInt32.new!(iv117.to_int).&(0x1_u32) << 10
      end

      unless iv116.nil?
        value = (value & 0xfffff7ff_u32) |
                UInt32.new!(iv116.to_int).&(0x1_u32) << 11
      end

      unless iv115.nil?
        value = (value & 0xffffefff_u32) |
                UInt32.new!(iv115.to_int).&(0x1_u32) << 12
      end

      unless iv114.nil?
        value = (value & 0xffffdfff_u32) |
                UInt32.new!(iv114.to_int).&(0x1_u32) << 13
      end

      unless iv113.nil?
        value = (value & 0xffffbfff_u32) |
                UInt32.new!(iv113.to_int).&(0x1_u32) << 14
      end

      unless iv112.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(iv112.to_int).&(0x1_u32) << 15
      end

      unless iv111.nil?
        value = (value & 0xfffeffff_u32) |
                UInt32.new!(iv111.to_int).&(0x1_u32) << 16
      end

      unless iv110.nil?
        value = (value & 0xfffdffff_u32) |
                UInt32.new!(iv110.to_int).&(0x1_u32) << 17
      end

      unless iv109.nil?
        value = (value & 0xfffbffff_u32) |
                UInt32.new!(iv109.to_int).&(0x1_u32) << 18
      end

      unless iv108.nil?
        value = (value & 0xfff7ffff_u32) |
                UInt32.new!(iv108.to_int).&(0x1_u32) << 19
      end

      unless iv107.nil?
        value = (value & 0xffefffff_u32) |
                UInt32.new!(iv107.to_int).&(0x1_u32) << 20
      end

      unless iv106.nil?
        value = (value & 0xffdfffff_u32) |
                UInt32.new!(iv106.to_int).&(0x1_u32) << 21
      end

      unless iv105.nil?
        value = (value & 0xffbfffff_u32) |
                UInt32.new!(iv105.to_int).&(0x1_u32) << 22
      end

      unless iv104.nil?
        value = (value & 0xff7fffff_u32) |
                UInt32.new!(iv104.to_int).&(0x1_u32) << 23
      end

      unless iv103.nil?
        value = (value & 0xfeffffff_u32) |
                UInt32.new!(iv103.to_int).&(0x1_u32) << 24
      end

      unless iv102.nil?
        value = (value & 0xfdffffff_u32) |
                UInt32.new!(iv102.to_int).&(0x1_u32) << 25
      end

      unless iv101.nil?
        value = (value & 0xfbffffff_u32) |
                UInt32.new!(iv101.to_int).&(0x1_u32) << 26
      end

      unless iv100.nil?
        value = (value & 0xf7ffffff_u32) |
                UInt32.new!(iv100.to_int).&(0x1_u32) << 27
      end

      unless iv99.nil?
        value = (value & 0xefffffff_u32) |
                UInt32.new!(iv99.to_int).&(0x1_u32) << 28
      end

      unless iv98.nil?
        value = (value & 0xdfffffff_u32) |
                UInt32.new!(iv98.to_int).&(0x1_u32) << 29
      end

      unless iv97.nil?
        value = (value & 0xbfffffff_u32) |
                UInt32.new!(iv97.to_int).&(0x1_u32) << 30
      end

      unless iv96.nil?
        value = (value & 0x7fffffff_u32) |
                UInt32.new!(iv96.to_int).&(0x1_u32) << 31
      end

      self.class.new(value)
    end

    def self.set(
      *,
      iv127 : Bool? = nil,
      iv126 : Bool? = nil,
      iv125 : Bool? = nil,
      iv124 : Bool? = nil,
      iv123 : Bool? = nil,
      iv122 : Bool? = nil,
      iv121 : Bool? = nil,
      iv120 : Bool? = nil,
      iv119 : Bool? = nil,
      iv118 : Bool? = nil,
      iv117 : Bool? = nil,
      iv116 : Bool? = nil,
      iv115 : Bool? = nil,
      iv114 : Bool? = nil,
      iv113 : Bool? = nil,
      iv112 : Bool? = nil,
      iv111 : Bool? = nil,
      iv110 : Bool? = nil,
      iv109 : Bool? = nil,
      iv108 : Bool? = nil,
      iv107 : Bool? = nil,
      iv106 : Bool? = nil,
      iv105 : Bool? = nil,
      iv104 : Bool? = nil,
      iv103 : Bool? = nil,
      iv102 : Bool? = nil,
      iv101 : Bool? = nil,
      iv100 : Bool? = nil,
      iv99 : Bool? = nil,
      iv98 : Bool? = nil,
      iv97 : Bool? = nil,
      iv96 : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        iv127: iv127,
        iv126: iv126,
        iv125: iv125,
        iv124: iv124,
        iv123: iv123,
        iv122: iv122,
        iv121: iv121,
        iv120: iv120,
        iv119: iv119,
        iv118: iv118,
        iv117: iv117,
        iv116: iv116,
        iv115: iv115,
        iv114: iv114,
        iv113: iv113,
        iv112: iv112,
        iv111: iv111,
        iv110: iv110,
        iv109: iv109,
        iv108: iv108,
        iv107: iv107,
        iv106: iv106,
        iv105: iv105,
        iv104: iv104,
        iv103: iv103,
        iv102: iv102,
        iv101: iv101,
        iv100: iv100,
        iv99: iv99,
        iv98: iv98,
        iv97: iv97,
        iv96: iv96,
      )
    end
  end # struct

  # context swap register
  struct CSGCMCCM0R
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

    # CSGCMCCM0R
    def csgcmccm0_r : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # CSGCMCCM0R
    def self.csgcmccm0_r : UInt32
      value.csgcmccm0_r
    end

    # CSGCMCCM0R
    def self.csgcmccm0_r=(value : UInt32) : UInt32
      self.set(csgcmccm0_r: value)
      value
    end

    def copy_with(
      *,

      csgcmccm0_r : UInt32? = nil
    ) : self
      value = @value

      unless csgcmccm0_r.nil?
        value = (value & 0xffffffff_u32) |
                UInt32.new!(csgcmccm0_r.to_int).&(0x0_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      csgcmccm0_r : UInt32? = nil
    ) : Nil
      self.value = self.value.copy_with(
        csgcmccm0_r: csgcmccm0_r,
      )
    end
  end # struct

  # context swap register
  struct CSGCMCCM1R
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

    # CSGCMCCM1R
    def csgcmccm1_r : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # CSGCMCCM1R
    def self.csgcmccm1_r : UInt32
      value.csgcmccm1_r
    end

    # CSGCMCCM1R
    def self.csgcmccm1_r=(value : UInt32) : UInt32
      self.set(csgcmccm1_r: value)
      value
    end

    def copy_with(
      *,

      csgcmccm1_r : UInt32? = nil
    ) : self
      value = @value

      unless csgcmccm1_r.nil?
        value = (value & 0xffffffff_u32) |
                UInt32.new!(csgcmccm1_r.to_int).&(0x0_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      csgcmccm1_r : UInt32? = nil
    ) : Nil
      self.value = self.value.copy_with(
        csgcmccm1_r: csgcmccm1_r,
      )
    end
  end # struct

  # context swap register
  struct CSGCMCCM2R
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

    # CSGCMCCM2R
    def csgcmccm2_r : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # CSGCMCCM2R
    def self.csgcmccm2_r : UInt32
      value.csgcmccm2_r
    end

    # CSGCMCCM2R
    def self.csgcmccm2_r=(value : UInt32) : UInt32
      self.set(csgcmccm2_r: value)
      value
    end

    def copy_with(
      *,

      csgcmccm2_r : UInt32? = nil
    ) : self
      value = @value

      unless csgcmccm2_r.nil?
        value = (value & 0xffffffff_u32) |
                UInt32.new!(csgcmccm2_r.to_int).&(0x0_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      csgcmccm2_r : UInt32? = nil
    ) : Nil
      self.value = self.value.copy_with(
        csgcmccm2_r: csgcmccm2_r,
      )
    end
  end # struct

  # context swap register
  struct CSGCMCCM3R
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

    # CSGCMCCM3R
    def csgcmccm3_r : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # CSGCMCCM3R
    def self.csgcmccm3_r : UInt32
      value.csgcmccm3_r
    end

    # CSGCMCCM3R
    def self.csgcmccm3_r=(value : UInt32) : UInt32
      self.set(csgcmccm3_r: value)
      value
    end

    def copy_with(
      *,

      csgcmccm3_r : UInt32? = nil
    ) : self
      value = @value

      unless csgcmccm3_r.nil?
        value = (value & 0xffffffff_u32) |
                UInt32.new!(csgcmccm3_r.to_int).&(0x0_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      csgcmccm3_r : UInt32? = nil
    ) : Nil
      self.value = self.value.copy_with(
        csgcmccm3_r: csgcmccm3_r,
      )
    end
  end # struct

  # context swap register
  struct CSGCMCCM4R
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

    # CSGCMCCM4R
    def csgcmccm4_r : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # CSGCMCCM4R
    def self.csgcmccm4_r : UInt32
      value.csgcmccm4_r
    end

    # CSGCMCCM4R
    def self.csgcmccm4_r=(value : UInt32) : UInt32
      self.set(csgcmccm4_r: value)
      value
    end

    def copy_with(
      *,

      csgcmccm4_r : UInt32? = nil
    ) : self
      value = @value

      unless csgcmccm4_r.nil?
        value = (value & 0xffffffff_u32) |
                UInt32.new!(csgcmccm4_r.to_int).&(0x0_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      csgcmccm4_r : UInt32? = nil
    ) : Nil
      self.value = self.value.copy_with(
        csgcmccm4_r: csgcmccm4_r,
      )
    end
  end # struct

  # context swap register
  struct CSGCMCCM5R
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

    # CSGCMCCM5R
    def csgcmccm5_r : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # CSGCMCCM5R
    def self.csgcmccm5_r : UInt32
      value.csgcmccm5_r
    end

    # CSGCMCCM5R
    def self.csgcmccm5_r=(value : UInt32) : UInt32
      self.set(csgcmccm5_r: value)
      value
    end

    def copy_with(
      *,

      csgcmccm5_r : UInt32? = nil
    ) : self
      value = @value

      unless csgcmccm5_r.nil?
        value = (value & 0xffffffff_u32) |
                UInt32.new!(csgcmccm5_r.to_int).&(0x0_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      csgcmccm5_r : UInt32? = nil
    ) : Nil
      self.value = self.value.copy_with(
        csgcmccm5_r: csgcmccm5_r,
      )
    end
  end # struct

  # context swap register
  struct CSGCMCCM6R
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

    # CSGCMCCM6R
    def csgcmccm6_r : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # CSGCMCCM6R
    def self.csgcmccm6_r : UInt32
      value.csgcmccm6_r
    end

    # CSGCMCCM6R
    def self.csgcmccm6_r=(value : UInt32) : UInt32
      self.set(csgcmccm6_r: value)
      value
    end

    def copy_with(
      *,

      csgcmccm6_r : UInt32? = nil
    ) : self
      value = @value

      unless csgcmccm6_r.nil?
        value = (value & 0xffffffff_u32) |
                UInt32.new!(csgcmccm6_r.to_int).&(0x0_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      csgcmccm6_r : UInt32? = nil
    ) : Nil
      self.value = self.value.copy_with(
        csgcmccm6_r: csgcmccm6_r,
      )
    end
  end # struct

  # context swap register
  struct CSGCMCCM7R
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

    # CSGCMCCM7R
    def csgcmccm7_r : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # CSGCMCCM7R
    def self.csgcmccm7_r : UInt32
      value.csgcmccm7_r
    end

    # CSGCMCCM7R
    def self.csgcmccm7_r=(value : UInt32) : UInt32
      self.set(csgcmccm7_r: value)
      value
    end

    def copy_with(
      *,

      csgcmccm7_r : UInt32? = nil
    ) : self
      value = @value

      unless csgcmccm7_r.nil?
        value = (value & 0xffffffff_u32) |
                UInt32.new!(csgcmccm7_r.to_int).&(0x0_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      csgcmccm7_r : UInt32? = nil
    ) : Nil
      self.value = self.value.copy_with(
        csgcmccm7_r: csgcmccm7_r,
      )
    end
  end # struct

  # context swap register
  struct CSGCM0R
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

    # CSGCM0R
    def csgcm0_r : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # CSGCM0R
    def self.csgcm0_r : UInt32
      value.csgcm0_r
    end

    # CSGCM0R
    def self.csgcm0_r=(value : UInt32) : UInt32
      self.set(csgcm0_r: value)
      value
    end

    def copy_with(
      *,

      csgcm0_r : UInt32? = nil
    ) : self
      value = @value

      unless csgcm0_r.nil?
        value = (value & 0xffffffff_u32) |
                UInt32.new!(csgcm0_r.to_int).&(0x0_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      csgcm0_r : UInt32? = nil
    ) : Nil
      self.value = self.value.copy_with(
        csgcm0_r: csgcm0_r,
      )
    end
  end # struct

  # context swap register
  struct CSGCM1R
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

    # CSGCM1R
    def csgcm1_r : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # CSGCM1R
    def self.csgcm1_r : UInt32
      value.csgcm1_r
    end

    # CSGCM1R
    def self.csgcm1_r=(value : UInt32) : UInt32
      self.set(csgcm1_r: value)
      value
    end

    def copy_with(
      *,

      csgcm1_r : UInt32? = nil
    ) : self
      value = @value

      unless csgcm1_r.nil?
        value = (value & 0xffffffff_u32) |
                UInt32.new!(csgcm1_r.to_int).&(0x0_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      csgcm1_r : UInt32? = nil
    ) : Nil
      self.value = self.value.copy_with(
        csgcm1_r: csgcm1_r,
      )
    end
  end # struct

  # context swap register
  struct CSGCM2R
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

    # CSGCM2R
    def csgcm2_r : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # CSGCM2R
    def self.csgcm2_r : UInt32
      value.csgcm2_r
    end

    # CSGCM2R
    def self.csgcm2_r=(value : UInt32) : UInt32
      self.set(csgcm2_r: value)
      value
    end

    def copy_with(
      *,

      csgcm2_r : UInt32? = nil
    ) : self
      value = @value

      unless csgcm2_r.nil?
        value = (value & 0xffffffff_u32) |
                UInt32.new!(csgcm2_r.to_int).&(0x0_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      csgcm2_r : UInt32? = nil
    ) : Nil
      self.value = self.value.copy_with(
        csgcm2_r: csgcm2_r,
      )
    end
  end # struct

  # context swap register
  struct CSGCM3R
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

    # CSGCM3R
    def csgcm3_r : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # CSGCM3R
    def self.csgcm3_r : UInt32
      value.csgcm3_r
    end

    # CSGCM3R
    def self.csgcm3_r=(value : UInt32) : UInt32
      self.set(csgcm3_r: value)
      value
    end

    def copy_with(
      *,

      csgcm3_r : UInt32? = nil
    ) : self
      value = @value

      unless csgcm3_r.nil?
        value = (value & 0xffffffff_u32) |
                UInt32.new!(csgcm3_r.to_int).&(0x0_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      csgcm3_r : UInt32? = nil
    ) : Nil
      self.value = self.value.copy_with(
        csgcm3_r: csgcm3_r,
      )
    end
  end # struct

  # context swap register
  struct CSGCM4R
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

    # CSGCM4R
    def csgcm4_r : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # CSGCM4R
    def self.csgcm4_r : UInt32
      value.csgcm4_r
    end

    # CSGCM4R
    def self.csgcm4_r=(value : UInt32) : UInt32
      self.set(csgcm4_r: value)
      value
    end

    def copy_with(
      *,

      csgcm4_r : UInt32? = nil
    ) : self
      value = @value

      unless csgcm4_r.nil?
        value = (value & 0xffffffff_u32) |
                UInt32.new!(csgcm4_r.to_int).&(0x0_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      csgcm4_r : UInt32? = nil
    ) : Nil
      self.value = self.value.copy_with(
        csgcm4_r: csgcm4_r,
      )
    end
  end # struct

  # context swap register
  struct CSGCM5R
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

    # CSGCM5R
    def csgcm5_r : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # CSGCM5R
    def self.csgcm5_r : UInt32
      value.csgcm5_r
    end

    # CSGCM5R
    def self.csgcm5_r=(value : UInt32) : UInt32
      self.set(csgcm5_r: value)
      value
    end

    def copy_with(
      *,

      csgcm5_r : UInt32? = nil
    ) : self
      value = @value

      unless csgcm5_r.nil?
        value = (value & 0xffffffff_u32) |
                UInt32.new!(csgcm5_r.to_int).&(0x0_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      csgcm5_r : UInt32? = nil
    ) : Nil
      self.value = self.value.copy_with(
        csgcm5_r: csgcm5_r,
      )
    end
  end # struct

  # context swap register
  struct CSGCM6R
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

    # CSGCM6R
    def csgcm6_r : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # CSGCM6R
    def self.csgcm6_r : UInt32
      value.csgcm6_r
    end

    # CSGCM6R
    def self.csgcm6_r=(value : UInt32) : UInt32
      self.set(csgcm6_r: value)
      value
    end

    def copy_with(
      *,

      csgcm6_r : UInt32? = nil
    ) : self
      value = @value

      unless csgcm6_r.nil?
        value = (value & 0xffffffff_u32) |
                UInt32.new!(csgcm6_r.to_int).&(0x0_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      csgcm6_r : UInt32? = nil
    ) : Nil
      self.value = self.value.copy_with(
        csgcm6_r: csgcm6_r,
      )
    end
  end # struct

  # context swap register
  struct CSGCM7R
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

    # CSGCM7R
    def csgcm7_r : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # CSGCM7R
    def self.csgcm7_r : UInt32
      value.csgcm7_r
    end

    # CSGCM7R
    def self.csgcm7_r=(value : UInt32) : UInt32
      self.set(csgcm7_r: value)
      value
    end

    def copy_with(
      *,

      csgcm7_r : UInt32? = nil
    ) : self
      value = @value

      unless csgcm7_r.nil?
        value = (value & 0xffffffff_u32) |
                UInt32.new!(csgcm7_r.to_int).&(0x0_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      csgcm7_r : UInt32? = nil
    ) : Nil
      self.value = self.value.copy_with(
        csgcm7_r: csgcm7_r,
      )
    end
  end # struct

end
