# Memory protection unit
module MPU
  VERSION      = nil
  BASE_ADDRESS = 0xe000ed90_u64

  # MPU type register
  struct TYPER
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

    # Separate flag
    def separate : Bool
      @value.bits_set?(0x1_u32)
    end

    # Separate flag
    def self.separate : Bool
      value.separate
    end

    # Number of MPU data regions
    def dregion : UInt8
      UInt8.new!((@value >> 8) & 0xff_u32)
    end

    # Number of MPU data regions
    def self.dregion : UInt8
      value.dregion
    end

    # Number of MPU instruction              regions
    def iregion : UInt8
      UInt8.new!((@value >> 16) & 0xff_u32)
    end

    # Number of MPU instruction              regions
    def self.iregion : UInt8
      value.iregion
    end
  end # struct

  # MPU control register
  struct CTRL
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

    # Enables the MPU
    def enable : Bool
      @value.bits_set?(0x1_u32)
    end

    # Enables the MPU
    def self.enable : Bool
      value.enable
    end

    # Enables the operation of MPU during hard              fault
    def hfnmiena : Bool
      @value.bits_set?(0x2_u32)
    end

    # Enables the operation of MPU during hard              fault
    def self.hfnmiena : Bool
      value.hfnmiena
    end

    # Enable priviliged software access to              default memory map
    def privdefena : Bool
      @value.bits_set?(0x4_u32)
    end

    # Enable priviliged software access to              default memory map
    def self.privdefena : Bool
      value.privdefena
    end
  end # struct

  # MPU region number register
  struct RNR
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

    # MPU region
    def region : UInt8
      UInt8.new!((@value >> 0) & 0xff_u32)
    end

    # MPU region
    def self.region : UInt8
      value.region
    end

    # MPU region
    def self.region=(value : UInt8) : UInt8
      self.set(region: value)
      value
    end

    def copy_with(
      *,

      region : UInt8? = nil
    ) : self
      value = @value

      unless region.nil?
        value = (value & 0xffffff00_u32) |
                UInt32.new!(region.to_int).&(0xff_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      region : UInt8? = nil
    ) : Nil
      self.value = self.value.copy_with(
        region: region,
      )
    end
  end # struct

  # MPU region base address          register
  struct RBAR
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

    # MPU region field
    def region : UInt8
      UInt8.new!((@value >> 0) & 0xf_u32)
    end

    # MPU region field
    def self.region : UInt8
      value.region
    end

    # MPU region field
    def self.region=(value : UInt8) : UInt8
      self.set(region: value)
      value
    end

    # MPU region number valid
    def valid : Bool
      @value.bits_set?(0x10_u32)
    end

    # MPU region number valid
    def self.valid : Bool
      value.valid
    end

    # MPU region number valid
    def self.valid=(value : Bool) : Bool
      self.set(valid: value)
      value
    end

    # Region base address field
    def addr : UInt32
      UInt32.new!((@value >> 5) & 0x7ffffff_u32)
    end

    # Region base address field
    def self.addr : UInt32
      value.addr
    end

    # Region base address field
    def self.addr=(value : UInt32) : UInt32
      self.set(addr: value)
      value
    end

    def copy_with(
      *,

      region : UInt8? = nil,

      valid : Bool? = nil,

      addr : UInt32? = nil
    ) : self
      value = @value

      unless region.nil?
        value = (value & 0xfffffff0_u32) |
                UInt32.new!(region.to_int).&(0xf_u32) << 0
      end

      unless valid.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(valid.to_int).&(0x1_u32) << 4
      end

      unless addr.nil?
        value = (value & 0x1f_u32) |
                UInt32.new!(addr.to_int).&(0x7ffffff_u32) << 5
      end

      self.class.new(value)
    end

    def self.set(
      *,
      region : UInt8? = nil,
      valid : Bool? = nil,
      addr : UInt32? = nil
    ) : Nil
      self.value = self.value.copy_with(
        region: region,
        valid: valid,
        addr: addr,
      )
    end
  end # struct

  # MPU region attribute and size          register
  struct RASR
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

    # Region enable bit.
    def enable : Bool
      @value.bits_set?(0x1_u32)
    end

    # Region enable bit.
    def self.enable : Bool
      value.enable
    end

    # Region enable bit.
    def self.enable=(value : Bool) : Bool
      self.set(enable: value)
      value
    end

    # Size of the MPU protection              region
    def size : UInt8
      UInt8.new!((@value >> 1) & 0x1f_u32)
    end

    # Size of the MPU protection              region
    def self.size : UInt8
      value.size
    end

    # Size of the MPU protection              region
    def self.size=(value : UInt8) : UInt8
      self.set(size: value)
      value
    end

    # Subregion disable bits
    def srd : UInt8
      UInt8.new!((@value >> 8) & 0xff_u32)
    end

    # Subregion disable bits
    def self.srd : UInt8
      value.srd
    end

    # Subregion disable bits
    def self.srd=(value : UInt8) : UInt8
      self.set(srd: value)
      value
    end

    # memory attribute
    def b : Bool
      @value.bits_set?(0x10000_u32)
    end

    # memory attribute
    def self.b : Bool
      value.b
    end

    # memory attribute
    def self.b=(value : Bool) : Bool
      self.set(b: value)
      value
    end

    # memory attribute
    def c : Bool
      @value.bits_set?(0x20000_u32)
    end

    # memory attribute
    def self.c : Bool
      value.c
    end

    # memory attribute
    def self.c=(value : Bool) : Bool
      self.set(c: value)
      value
    end

    # Shareable memory attribute
    def s : Bool
      @value.bits_set?(0x40000_u32)
    end

    # Shareable memory attribute
    def self.s : Bool
      value.s
    end

    # Shareable memory attribute
    def self.s=(value : Bool) : Bool
      self.set(s: value)
      value
    end

    # memory attribute
    def tex : UInt8
      UInt8.new!((@value >> 19) & 0x7_u32)
    end

    # memory attribute
    def self.tex : UInt8
      value.tex
    end

    # memory attribute
    def self.tex=(value : UInt8) : UInt8
      self.set(tex: value)
      value
    end

    # Access permission
    def ap : UInt8
      UInt8.new!((@value >> 24) & 0x7_u32)
    end

    # Access permission
    def self.ap : UInt8
      value.ap
    end

    # Access permission
    def self.ap=(value : UInt8) : UInt8
      self.set(ap: value)
      value
    end

    # Instruction access disable              bit
    def xn : Bool
      @value.bits_set?(0x10000000_u32)
    end

    # Instruction access disable              bit
    def self.xn : Bool
      value.xn
    end

    # Instruction access disable              bit
    def self.xn=(value : Bool) : Bool
      self.set(xn: value)
      value
    end

    def copy_with(
      *,

      enable : Bool? = nil,

      size : UInt8? = nil,

      srd : UInt8? = nil,

      b : Bool? = nil,

      c : Bool? = nil,

      s : Bool? = nil,

      tex : UInt8? = nil,

      ap : UInt8? = nil,

      xn : Bool? = nil
    ) : self
      value = @value

      unless enable.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(enable.to_int).&(0x1_u32) << 0
      end

      unless size.nil?
        value = (value & 0xffffffc1_u32) |
                UInt32.new!(size.to_int).&(0x1f_u32) << 1
      end

      unless srd.nil?
        value = (value & 0xffff00ff_u32) |
                UInt32.new!(srd.to_int).&(0xff_u32) << 8
      end

      unless b.nil?
        value = (value & 0xfffeffff_u32) |
                UInt32.new!(b.to_int).&(0x1_u32) << 16
      end

      unless c.nil?
        value = (value & 0xfffdffff_u32) |
                UInt32.new!(c.to_int).&(0x1_u32) << 17
      end

      unless s.nil?
        value = (value & 0xfffbffff_u32) |
                UInt32.new!(s.to_int).&(0x1_u32) << 18
      end

      unless tex.nil?
        value = (value & 0xffc7ffff_u32) |
                UInt32.new!(tex.to_int).&(0x7_u32) << 19
      end

      unless ap.nil?
        value = (value & 0xf8ffffff_u32) |
                UInt32.new!(ap.to_int).&(0x7_u32) << 24
      end

      unless xn.nil?
        value = (value & 0xefffffff_u32) |
                UInt32.new!(xn.to_int).&(0x1_u32) << 28
      end

      self.class.new(value)
    end

    def self.set(
      *,
      enable : Bool? = nil,
      size : UInt8? = nil,
      srd : UInt8? = nil,
      b : Bool? = nil,
      c : Bool? = nil,
      s : Bool? = nil,
      tex : UInt8? = nil,
      ap : UInt8? = nil,
      xn : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        enable: enable,
        size: size,
        srd: srd,
        b: b,
        c: c,
        s: s,
        tex: tex,
        ap: ap,
        xn: xn,
      )
    end
  end # struct

end
