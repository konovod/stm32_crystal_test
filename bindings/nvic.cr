# Nested Vectored Interrupt      Controller
module NVIC
  VERSION      = nil
  BASE_ADDRESS = 0xe000e100_u64

  # Interrupt Set-Enable Register
  struct ISER0
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

    # SETENA
    def setena : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # SETENA
    def self.setena : UInt32
      value.setena
    end

    # SETENA
    def self.setena=(value : UInt32) : UInt32
      self.set(setena: value)
      value
    end

    def copy_with(
      *,

      setena : UInt32? = nil
    ) : self
      value = @value

      unless setena.nil?
        value = (value & 0xffffffff_u32) |
                UInt32.new!(setena.to_int).&(0x0_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      setena : UInt32? = nil
    ) : Nil
      self.value = self.value.copy_with(
        setena: setena,
      )
    end
  end # struct

  # Interrupt Set-Enable Register
  struct ISER1
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

    # SETENA
    def setena : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # SETENA
    def self.setena : UInt32
      value.setena
    end

    # SETENA
    def self.setena=(value : UInt32) : UInt32
      self.set(setena: value)
      value
    end

    def copy_with(
      *,

      setena : UInt32? = nil
    ) : self
      value = @value

      unless setena.nil?
        value = (value & 0xffffffff_u32) |
                UInt32.new!(setena.to_int).&(0x0_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      setena : UInt32? = nil
    ) : Nil
      self.value = self.value.copy_with(
        setena: setena,
      )
    end
  end # struct

  # Interrupt Set-Enable Register
  struct ISER2
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

    # SETENA
    def setena : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # SETENA
    def self.setena : UInt32
      value.setena
    end

    # SETENA
    def self.setena=(value : UInt32) : UInt32
      self.set(setena: value)
      value
    end

    def copy_with(
      *,

      setena : UInt32? = nil
    ) : self
      value = @value

      unless setena.nil?
        value = (value & 0xffffffff_u32) |
                UInt32.new!(setena.to_int).&(0x0_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      setena : UInt32? = nil
    ) : Nil
      self.value = self.value.copy_with(
        setena: setena,
      )
    end
  end # struct

  # Interrupt Clear-Enable          Register
  struct ICER0
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

    # CLRENA
    def clrena : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # CLRENA
    def self.clrena : UInt32
      value.clrena
    end

    # CLRENA
    def self.clrena=(value : UInt32) : UInt32
      self.set(clrena: value)
      value
    end

    def copy_with(
      *,

      clrena : UInt32? = nil
    ) : self
      value = @value

      unless clrena.nil?
        value = (value & 0xffffffff_u32) |
                UInt32.new!(clrena.to_int).&(0x0_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      clrena : UInt32? = nil
    ) : Nil
      self.value = self.value.copy_with(
        clrena: clrena,
      )
    end
  end # struct

  # Interrupt Clear-Enable          Register
  struct ICER1
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

    # CLRENA
    def clrena : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # CLRENA
    def self.clrena : UInt32
      value.clrena
    end

    # CLRENA
    def self.clrena=(value : UInt32) : UInt32
      self.set(clrena: value)
      value
    end

    def copy_with(
      *,

      clrena : UInt32? = nil
    ) : self
      value = @value

      unless clrena.nil?
        value = (value & 0xffffffff_u32) |
                UInt32.new!(clrena.to_int).&(0x0_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      clrena : UInt32? = nil
    ) : Nil
      self.value = self.value.copy_with(
        clrena: clrena,
      )
    end
  end # struct

  # Interrupt Clear-Enable          Register
  struct ICER2
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

    # CLRENA
    def clrena : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # CLRENA
    def self.clrena : UInt32
      value.clrena
    end

    # CLRENA
    def self.clrena=(value : UInt32) : UInt32
      self.set(clrena: value)
      value
    end

    def copy_with(
      *,

      clrena : UInt32? = nil
    ) : self
      value = @value

      unless clrena.nil?
        value = (value & 0xffffffff_u32) |
                UInt32.new!(clrena.to_int).&(0x0_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      clrena : UInt32? = nil
    ) : Nil
      self.value = self.value.copy_with(
        clrena: clrena,
      )
    end
  end # struct

  # Interrupt Set-Pending Register
  struct ISPR0
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

    # SETPEND
    def setpend : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # SETPEND
    def self.setpend : UInt32
      value.setpend
    end

    # SETPEND
    def self.setpend=(value : UInt32) : UInt32
      self.set(setpend: value)
      value
    end

    def copy_with(
      *,

      setpend : UInt32? = nil
    ) : self
      value = @value

      unless setpend.nil?
        value = (value & 0xffffffff_u32) |
                UInt32.new!(setpend.to_int).&(0x0_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      setpend : UInt32? = nil
    ) : Nil
      self.value = self.value.copy_with(
        setpend: setpend,
      )
    end
  end # struct

  # Interrupt Set-Pending Register
  struct ISPR1
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

    # SETPEND
    def setpend : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # SETPEND
    def self.setpend : UInt32
      value.setpend
    end

    # SETPEND
    def self.setpend=(value : UInt32) : UInt32
      self.set(setpend: value)
      value
    end

    def copy_with(
      *,

      setpend : UInt32? = nil
    ) : self
      value = @value

      unless setpend.nil?
        value = (value & 0xffffffff_u32) |
                UInt32.new!(setpend.to_int).&(0x0_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      setpend : UInt32? = nil
    ) : Nil
      self.value = self.value.copy_with(
        setpend: setpend,
      )
    end
  end # struct

  # Interrupt Set-Pending Register
  struct ISPR2
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

    # SETPEND
    def setpend : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # SETPEND
    def self.setpend : UInt32
      value.setpend
    end

    # SETPEND
    def self.setpend=(value : UInt32) : UInt32
      self.set(setpend: value)
      value
    end

    def copy_with(
      *,

      setpend : UInt32? = nil
    ) : self
      value = @value

      unless setpend.nil?
        value = (value & 0xffffffff_u32) |
                UInt32.new!(setpend.to_int).&(0x0_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      setpend : UInt32? = nil
    ) : Nil
      self.value = self.value.copy_with(
        setpend: setpend,
      )
    end
  end # struct

  # Interrupt Clear-Pending          Register
  struct ICPR0
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

    # CLRPEND
    def clrpend : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # CLRPEND
    def self.clrpend : UInt32
      value.clrpend
    end

    # CLRPEND
    def self.clrpend=(value : UInt32) : UInt32
      self.set(clrpend: value)
      value
    end

    def copy_with(
      *,

      clrpend : UInt32? = nil
    ) : self
      value = @value

      unless clrpend.nil?
        value = (value & 0xffffffff_u32) |
                UInt32.new!(clrpend.to_int).&(0x0_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      clrpend : UInt32? = nil
    ) : Nil
      self.value = self.value.copy_with(
        clrpend: clrpend,
      )
    end
  end # struct

  # Interrupt Clear-Pending          Register
  struct ICPR1
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

    # CLRPEND
    def clrpend : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # CLRPEND
    def self.clrpend : UInt32
      value.clrpend
    end

    # CLRPEND
    def self.clrpend=(value : UInt32) : UInt32
      self.set(clrpend: value)
      value
    end

    def copy_with(
      *,

      clrpend : UInt32? = nil
    ) : self
      value = @value

      unless clrpend.nil?
        value = (value & 0xffffffff_u32) |
                UInt32.new!(clrpend.to_int).&(0x0_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      clrpend : UInt32? = nil
    ) : Nil
      self.value = self.value.copy_with(
        clrpend: clrpend,
      )
    end
  end # struct

  # Interrupt Clear-Pending          Register
  struct ICPR2
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

    # CLRPEND
    def clrpend : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # CLRPEND
    def self.clrpend : UInt32
      value.clrpend
    end

    # CLRPEND
    def self.clrpend=(value : UInt32) : UInt32
      self.set(clrpend: value)
      value
    end

    def copy_with(
      *,

      clrpend : UInt32? = nil
    ) : self
      value = @value

      unless clrpend.nil?
        value = (value & 0xffffffff_u32) |
                UInt32.new!(clrpend.to_int).&(0x0_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      clrpend : UInt32? = nil
    ) : Nil
      self.value = self.value.copy_with(
        clrpend: clrpend,
      )
    end
  end # struct

  # Interrupt Active Bit Register
  struct IABR0
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

    # ACTIVE
    def active : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # ACTIVE
    def self.active : UInt32
      value.active
    end
  end # struct

  # Interrupt Active Bit Register
  struct IABR1
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

    # ACTIVE
    def active : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # ACTIVE
    def self.active : UInt32
      value.active
    end
  end # struct

  # Interrupt Active Bit Register
  struct IABR2
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

    # ACTIVE
    def active : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # ACTIVE
    def self.active : UInt32
      value.active
    end
  end # struct

  # Interrupt Priority Register
  struct IPR0
    ADDRESS = BASE_ADDRESS + 0x300_u64

    protected def self.address : UInt64
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

    # IPR_N0
    def ipr_n0 : UInt8
      UInt8.new!((@value >> 0) & 0xff_u32)
    end

    # IPR_N0
    def self.ipr_n0 : UInt8
      value.ipr_n0
    end

    # IPR_N0
    def self.ipr_n0=(value : UInt8) : UInt8
      self.set(ipr_n0: value)
      value
    end

    # IPR_N1
    def ipr_n1 : UInt8
      UInt8.new!((@value >> 8) & 0xff_u32)
    end

    # IPR_N1
    def self.ipr_n1 : UInt8
      value.ipr_n1
    end

    # IPR_N1
    def self.ipr_n1=(value : UInt8) : UInt8
      self.set(ipr_n1: value)
      value
    end

    # IPR_N2
    def ipr_n2 : UInt8
      UInt8.new!((@value >> 16) & 0xff_u32)
    end

    # IPR_N2
    def self.ipr_n2 : UInt8
      value.ipr_n2
    end

    # IPR_N2
    def self.ipr_n2=(value : UInt8) : UInt8
      self.set(ipr_n2: value)
      value
    end

    # IPR_N3
    def ipr_n3 : UInt8
      UInt8.new!((@value >> 24) & 0xff_u32)
    end

    # IPR_N3
    def self.ipr_n3 : UInt8
      value.ipr_n3
    end

    # IPR_N3
    def self.ipr_n3=(value : UInt8) : UInt8
      self.set(ipr_n3: value)
      value
    end

    def copy_with(
      *,

      ipr_n0 : UInt8? = nil,

      ipr_n1 : UInt8? = nil,

      ipr_n2 : UInt8? = nil,

      ipr_n3 : UInt8? = nil
    ) : self
      value = @value

      unless ipr_n0.nil?
        value = (value & 0xffffff00_u32) |
                UInt32.new!(ipr_n0.to_int).&(0xff_u32) << 0
      end

      unless ipr_n1.nil?
        value = (value & 0xffff00ff_u32) |
                UInt32.new!(ipr_n1.to_int).&(0xff_u32) << 8
      end

      unless ipr_n2.nil?
        value = (value & 0xff00ffff_u32) |
                UInt32.new!(ipr_n2.to_int).&(0xff_u32) << 16
      end

      unless ipr_n3.nil?
        value = (value & 0xffffff_u32) |
                UInt32.new!(ipr_n3.to_int).&(0xff_u32) << 24
      end

      self.class.new(value)
    end

    def self.set(
      *,
      ipr_n0 : UInt8? = nil,
      ipr_n1 : UInt8? = nil,
      ipr_n2 : UInt8? = nil,
      ipr_n3 : UInt8? = nil
    ) : Nil
      self.value = self.value.copy_with(
        ipr_n0: ipr_n0,
        ipr_n1: ipr_n1,
        ipr_n2: ipr_n2,
        ipr_n3: ipr_n3,
      )
    end
  end # struct

  # Interrupt Priority Register
  struct IPR1
    ADDRESS = BASE_ADDRESS + 0x304_u64

    protected def self.address : UInt64
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

    # IPR_N0
    def ipr_n0 : UInt8
      UInt8.new!((@value >> 0) & 0xff_u32)
    end

    # IPR_N0
    def self.ipr_n0 : UInt8
      value.ipr_n0
    end

    # IPR_N0
    def self.ipr_n0=(value : UInt8) : UInt8
      self.set(ipr_n0: value)
      value
    end

    # IPR_N1
    def ipr_n1 : UInt8
      UInt8.new!((@value >> 8) & 0xff_u32)
    end

    # IPR_N1
    def self.ipr_n1 : UInt8
      value.ipr_n1
    end

    # IPR_N1
    def self.ipr_n1=(value : UInt8) : UInt8
      self.set(ipr_n1: value)
      value
    end

    # IPR_N2
    def ipr_n2 : UInt8
      UInt8.new!((@value >> 16) & 0xff_u32)
    end

    # IPR_N2
    def self.ipr_n2 : UInt8
      value.ipr_n2
    end

    # IPR_N2
    def self.ipr_n2=(value : UInt8) : UInt8
      self.set(ipr_n2: value)
      value
    end

    # IPR_N3
    def ipr_n3 : UInt8
      UInt8.new!((@value >> 24) & 0xff_u32)
    end

    # IPR_N3
    def self.ipr_n3 : UInt8
      value.ipr_n3
    end

    # IPR_N3
    def self.ipr_n3=(value : UInt8) : UInt8
      self.set(ipr_n3: value)
      value
    end

    def copy_with(
      *,

      ipr_n0 : UInt8? = nil,

      ipr_n1 : UInt8? = nil,

      ipr_n2 : UInt8? = nil,

      ipr_n3 : UInt8? = nil
    ) : self
      value = @value

      unless ipr_n0.nil?
        value = (value & 0xffffff00_u32) |
                UInt32.new!(ipr_n0.to_int).&(0xff_u32) << 0
      end

      unless ipr_n1.nil?
        value = (value & 0xffff00ff_u32) |
                UInt32.new!(ipr_n1.to_int).&(0xff_u32) << 8
      end

      unless ipr_n2.nil?
        value = (value & 0xff00ffff_u32) |
                UInt32.new!(ipr_n2.to_int).&(0xff_u32) << 16
      end

      unless ipr_n3.nil?
        value = (value & 0xffffff_u32) |
                UInt32.new!(ipr_n3.to_int).&(0xff_u32) << 24
      end

      self.class.new(value)
    end

    def self.set(
      *,
      ipr_n0 : UInt8? = nil,
      ipr_n1 : UInt8? = nil,
      ipr_n2 : UInt8? = nil,
      ipr_n3 : UInt8? = nil
    ) : Nil
      self.value = self.value.copy_with(
        ipr_n0: ipr_n0,
        ipr_n1: ipr_n1,
        ipr_n2: ipr_n2,
        ipr_n3: ipr_n3,
      )
    end
  end # struct

  # Interrupt Priority Register
  struct IPR2
    ADDRESS = BASE_ADDRESS + 0x308_u64

    protected def self.address : UInt64
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

    # IPR_N0
    def ipr_n0 : UInt8
      UInt8.new!((@value >> 0) & 0xff_u32)
    end

    # IPR_N0
    def self.ipr_n0 : UInt8
      value.ipr_n0
    end

    # IPR_N0
    def self.ipr_n0=(value : UInt8) : UInt8
      self.set(ipr_n0: value)
      value
    end

    # IPR_N1
    def ipr_n1 : UInt8
      UInt8.new!((@value >> 8) & 0xff_u32)
    end

    # IPR_N1
    def self.ipr_n1 : UInt8
      value.ipr_n1
    end

    # IPR_N1
    def self.ipr_n1=(value : UInt8) : UInt8
      self.set(ipr_n1: value)
      value
    end

    # IPR_N2
    def ipr_n2 : UInt8
      UInt8.new!((@value >> 16) & 0xff_u32)
    end

    # IPR_N2
    def self.ipr_n2 : UInt8
      value.ipr_n2
    end

    # IPR_N2
    def self.ipr_n2=(value : UInt8) : UInt8
      self.set(ipr_n2: value)
      value
    end

    # IPR_N3
    def ipr_n3 : UInt8
      UInt8.new!((@value >> 24) & 0xff_u32)
    end

    # IPR_N3
    def self.ipr_n3 : UInt8
      value.ipr_n3
    end

    # IPR_N3
    def self.ipr_n3=(value : UInt8) : UInt8
      self.set(ipr_n3: value)
      value
    end

    def copy_with(
      *,

      ipr_n0 : UInt8? = nil,

      ipr_n1 : UInt8? = nil,

      ipr_n2 : UInt8? = nil,

      ipr_n3 : UInt8? = nil
    ) : self
      value = @value

      unless ipr_n0.nil?
        value = (value & 0xffffff00_u32) |
                UInt32.new!(ipr_n0.to_int).&(0xff_u32) << 0
      end

      unless ipr_n1.nil?
        value = (value & 0xffff00ff_u32) |
                UInt32.new!(ipr_n1.to_int).&(0xff_u32) << 8
      end

      unless ipr_n2.nil?
        value = (value & 0xff00ffff_u32) |
                UInt32.new!(ipr_n2.to_int).&(0xff_u32) << 16
      end

      unless ipr_n3.nil?
        value = (value & 0xffffff_u32) |
                UInt32.new!(ipr_n3.to_int).&(0xff_u32) << 24
      end

      self.class.new(value)
    end

    def self.set(
      *,
      ipr_n0 : UInt8? = nil,
      ipr_n1 : UInt8? = nil,
      ipr_n2 : UInt8? = nil,
      ipr_n3 : UInt8? = nil
    ) : Nil
      self.value = self.value.copy_with(
        ipr_n0: ipr_n0,
        ipr_n1: ipr_n1,
        ipr_n2: ipr_n2,
        ipr_n3: ipr_n3,
      )
    end
  end # struct

  # Interrupt Priority Register
  struct IPR3
    ADDRESS = BASE_ADDRESS + 0x30c_u64

    protected def self.address : UInt64
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

    # IPR_N0
    def ipr_n0 : UInt8
      UInt8.new!((@value >> 0) & 0xff_u32)
    end

    # IPR_N0
    def self.ipr_n0 : UInt8
      value.ipr_n0
    end

    # IPR_N0
    def self.ipr_n0=(value : UInt8) : UInt8
      self.set(ipr_n0: value)
      value
    end

    # IPR_N1
    def ipr_n1 : UInt8
      UInt8.new!((@value >> 8) & 0xff_u32)
    end

    # IPR_N1
    def self.ipr_n1 : UInt8
      value.ipr_n1
    end

    # IPR_N1
    def self.ipr_n1=(value : UInt8) : UInt8
      self.set(ipr_n1: value)
      value
    end

    # IPR_N2
    def ipr_n2 : UInt8
      UInt8.new!((@value >> 16) & 0xff_u32)
    end

    # IPR_N2
    def self.ipr_n2 : UInt8
      value.ipr_n2
    end

    # IPR_N2
    def self.ipr_n2=(value : UInt8) : UInt8
      self.set(ipr_n2: value)
      value
    end

    # IPR_N3
    def ipr_n3 : UInt8
      UInt8.new!((@value >> 24) & 0xff_u32)
    end

    # IPR_N3
    def self.ipr_n3 : UInt8
      value.ipr_n3
    end

    # IPR_N3
    def self.ipr_n3=(value : UInt8) : UInt8
      self.set(ipr_n3: value)
      value
    end

    def copy_with(
      *,

      ipr_n0 : UInt8? = nil,

      ipr_n1 : UInt8? = nil,

      ipr_n2 : UInt8? = nil,

      ipr_n3 : UInt8? = nil
    ) : self
      value = @value

      unless ipr_n0.nil?
        value = (value & 0xffffff00_u32) |
                UInt32.new!(ipr_n0.to_int).&(0xff_u32) << 0
      end

      unless ipr_n1.nil?
        value = (value & 0xffff00ff_u32) |
                UInt32.new!(ipr_n1.to_int).&(0xff_u32) << 8
      end

      unless ipr_n2.nil?
        value = (value & 0xff00ffff_u32) |
                UInt32.new!(ipr_n2.to_int).&(0xff_u32) << 16
      end

      unless ipr_n3.nil?
        value = (value & 0xffffff_u32) |
                UInt32.new!(ipr_n3.to_int).&(0xff_u32) << 24
      end

      self.class.new(value)
    end

    def self.set(
      *,
      ipr_n0 : UInt8? = nil,
      ipr_n1 : UInt8? = nil,
      ipr_n2 : UInt8? = nil,
      ipr_n3 : UInt8? = nil
    ) : Nil
      self.value = self.value.copy_with(
        ipr_n0: ipr_n0,
        ipr_n1: ipr_n1,
        ipr_n2: ipr_n2,
        ipr_n3: ipr_n3,
      )
    end
  end # struct

  # Interrupt Priority Register
  struct IPR4
    ADDRESS = BASE_ADDRESS + 0x310_u64

    protected def self.address : UInt64
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

    # IPR_N0
    def ipr_n0 : UInt8
      UInt8.new!((@value >> 0) & 0xff_u32)
    end

    # IPR_N0
    def self.ipr_n0 : UInt8
      value.ipr_n0
    end

    # IPR_N0
    def self.ipr_n0=(value : UInt8) : UInt8
      self.set(ipr_n0: value)
      value
    end

    # IPR_N1
    def ipr_n1 : UInt8
      UInt8.new!((@value >> 8) & 0xff_u32)
    end

    # IPR_N1
    def self.ipr_n1 : UInt8
      value.ipr_n1
    end

    # IPR_N1
    def self.ipr_n1=(value : UInt8) : UInt8
      self.set(ipr_n1: value)
      value
    end

    # IPR_N2
    def ipr_n2 : UInt8
      UInt8.new!((@value >> 16) & 0xff_u32)
    end

    # IPR_N2
    def self.ipr_n2 : UInt8
      value.ipr_n2
    end

    # IPR_N2
    def self.ipr_n2=(value : UInt8) : UInt8
      self.set(ipr_n2: value)
      value
    end

    # IPR_N3
    def ipr_n3 : UInt8
      UInt8.new!((@value >> 24) & 0xff_u32)
    end

    # IPR_N3
    def self.ipr_n3 : UInt8
      value.ipr_n3
    end

    # IPR_N3
    def self.ipr_n3=(value : UInt8) : UInt8
      self.set(ipr_n3: value)
      value
    end

    def copy_with(
      *,

      ipr_n0 : UInt8? = nil,

      ipr_n1 : UInt8? = nil,

      ipr_n2 : UInt8? = nil,

      ipr_n3 : UInt8? = nil
    ) : self
      value = @value

      unless ipr_n0.nil?
        value = (value & 0xffffff00_u32) |
                UInt32.new!(ipr_n0.to_int).&(0xff_u32) << 0
      end

      unless ipr_n1.nil?
        value = (value & 0xffff00ff_u32) |
                UInt32.new!(ipr_n1.to_int).&(0xff_u32) << 8
      end

      unless ipr_n2.nil?
        value = (value & 0xff00ffff_u32) |
                UInt32.new!(ipr_n2.to_int).&(0xff_u32) << 16
      end

      unless ipr_n3.nil?
        value = (value & 0xffffff_u32) |
                UInt32.new!(ipr_n3.to_int).&(0xff_u32) << 24
      end

      self.class.new(value)
    end

    def self.set(
      *,
      ipr_n0 : UInt8? = nil,
      ipr_n1 : UInt8? = nil,
      ipr_n2 : UInt8? = nil,
      ipr_n3 : UInt8? = nil
    ) : Nil
      self.value = self.value.copy_with(
        ipr_n0: ipr_n0,
        ipr_n1: ipr_n1,
        ipr_n2: ipr_n2,
        ipr_n3: ipr_n3,
      )
    end
  end # struct

  # Interrupt Priority Register
  struct IPR5
    ADDRESS = BASE_ADDRESS + 0x314_u64

    protected def self.address : UInt64
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

    # IPR_N0
    def ipr_n0 : UInt8
      UInt8.new!((@value >> 0) & 0xff_u32)
    end

    # IPR_N0
    def self.ipr_n0 : UInt8
      value.ipr_n0
    end

    # IPR_N0
    def self.ipr_n0=(value : UInt8) : UInt8
      self.set(ipr_n0: value)
      value
    end

    # IPR_N1
    def ipr_n1 : UInt8
      UInt8.new!((@value >> 8) & 0xff_u32)
    end

    # IPR_N1
    def self.ipr_n1 : UInt8
      value.ipr_n1
    end

    # IPR_N1
    def self.ipr_n1=(value : UInt8) : UInt8
      self.set(ipr_n1: value)
      value
    end

    # IPR_N2
    def ipr_n2 : UInt8
      UInt8.new!((@value >> 16) & 0xff_u32)
    end

    # IPR_N2
    def self.ipr_n2 : UInt8
      value.ipr_n2
    end

    # IPR_N2
    def self.ipr_n2=(value : UInt8) : UInt8
      self.set(ipr_n2: value)
      value
    end

    # IPR_N3
    def ipr_n3 : UInt8
      UInt8.new!((@value >> 24) & 0xff_u32)
    end

    # IPR_N3
    def self.ipr_n3 : UInt8
      value.ipr_n3
    end

    # IPR_N3
    def self.ipr_n3=(value : UInt8) : UInt8
      self.set(ipr_n3: value)
      value
    end

    def copy_with(
      *,

      ipr_n0 : UInt8? = nil,

      ipr_n1 : UInt8? = nil,

      ipr_n2 : UInt8? = nil,

      ipr_n3 : UInt8? = nil
    ) : self
      value = @value

      unless ipr_n0.nil?
        value = (value & 0xffffff00_u32) |
                UInt32.new!(ipr_n0.to_int).&(0xff_u32) << 0
      end

      unless ipr_n1.nil?
        value = (value & 0xffff00ff_u32) |
                UInt32.new!(ipr_n1.to_int).&(0xff_u32) << 8
      end

      unless ipr_n2.nil?
        value = (value & 0xff00ffff_u32) |
                UInt32.new!(ipr_n2.to_int).&(0xff_u32) << 16
      end

      unless ipr_n3.nil?
        value = (value & 0xffffff_u32) |
                UInt32.new!(ipr_n3.to_int).&(0xff_u32) << 24
      end

      self.class.new(value)
    end

    def self.set(
      *,
      ipr_n0 : UInt8? = nil,
      ipr_n1 : UInt8? = nil,
      ipr_n2 : UInt8? = nil,
      ipr_n3 : UInt8? = nil
    ) : Nil
      self.value = self.value.copy_with(
        ipr_n0: ipr_n0,
        ipr_n1: ipr_n1,
        ipr_n2: ipr_n2,
        ipr_n3: ipr_n3,
      )
    end
  end # struct

  # Interrupt Priority Register
  struct IPR6
    ADDRESS = BASE_ADDRESS + 0x318_u64

    protected def self.address : UInt64
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

    # IPR_N0
    def ipr_n0 : UInt8
      UInt8.new!((@value >> 0) & 0xff_u32)
    end

    # IPR_N0
    def self.ipr_n0 : UInt8
      value.ipr_n0
    end

    # IPR_N0
    def self.ipr_n0=(value : UInt8) : UInt8
      self.set(ipr_n0: value)
      value
    end

    # IPR_N1
    def ipr_n1 : UInt8
      UInt8.new!((@value >> 8) & 0xff_u32)
    end

    # IPR_N1
    def self.ipr_n1 : UInt8
      value.ipr_n1
    end

    # IPR_N1
    def self.ipr_n1=(value : UInt8) : UInt8
      self.set(ipr_n1: value)
      value
    end

    # IPR_N2
    def ipr_n2 : UInt8
      UInt8.new!((@value >> 16) & 0xff_u32)
    end

    # IPR_N2
    def self.ipr_n2 : UInt8
      value.ipr_n2
    end

    # IPR_N2
    def self.ipr_n2=(value : UInt8) : UInt8
      self.set(ipr_n2: value)
      value
    end

    # IPR_N3
    def ipr_n3 : UInt8
      UInt8.new!((@value >> 24) & 0xff_u32)
    end

    # IPR_N3
    def self.ipr_n3 : UInt8
      value.ipr_n3
    end

    # IPR_N3
    def self.ipr_n3=(value : UInt8) : UInt8
      self.set(ipr_n3: value)
      value
    end

    def copy_with(
      *,

      ipr_n0 : UInt8? = nil,

      ipr_n1 : UInt8? = nil,

      ipr_n2 : UInt8? = nil,

      ipr_n3 : UInt8? = nil
    ) : self
      value = @value

      unless ipr_n0.nil?
        value = (value & 0xffffff00_u32) |
                UInt32.new!(ipr_n0.to_int).&(0xff_u32) << 0
      end

      unless ipr_n1.nil?
        value = (value & 0xffff00ff_u32) |
                UInt32.new!(ipr_n1.to_int).&(0xff_u32) << 8
      end

      unless ipr_n2.nil?
        value = (value & 0xff00ffff_u32) |
                UInt32.new!(ipr_n2.to_int).&(0xff_u32) << 16
      end

      unless ipr_n3.nil?
        value = (value & 0xffffff_u32) |
                UInt32.new!(ipr_n3.to_int).&(0xff_u32) << 24
      end

      self.class.new(value)
    end

    def self.set(
      *,
      ipr_n0 : UInt8? = nil,
      ipr_n1 : UInt8? = nil,
      ipr_n2 : UInt8? = nil,
      ipr_n3 : UInt8? = nil
    ) : Nil
      self.value = self.value.copy_with(
        ipr_n0: ipr_n0,
        ipr_n1: ipr_n1,
        ipr_n2: ipr_n2,
        ipr_n3: ipr_n3,
      )
    end
  end # struct

  # Interrupt Priority Register
  struct IPR7
    ADDRESS = BASE_ADDRESS + 0x31c_u64

    protected def self.address : UInt64
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

    # IPR_N0
    def ipr_n0 : UInt8
      UInt8.new!((@value >> 0) & 0xff_u32)
    end

    # IPR_N0
    def self.ipr_n0 : UInt8
      value.ipr_n0
    end

    # IPR_N0
    def self.ipr_n0=(value : UInt8) : UInt8
      self.set(ipr_n0: value)
      value
    end

    # IPR_N1
    def ipr_n1 : UInt8
      UInt8.new!((@value >> 8) & 0xff_u32)
    end

    # IPR_N1
    def self.ipr_n1 : UInt8
      value.ipr_n1
    end

    # IPR_N1
    def self.ipr_n1=(value : UInt8) : UInt8
      self.set(ipr_n1: value)
      value
    end

    # IPR_N2
    def ipr_n2 : UInt8
      UInt8.new!((@value >> 16) & 0xff_u32)
    end

    # IPR_N2
    def self.ipr_n2 : UInt8
      value.ipr_n2
    end

    # IPR_N2
    def self.ipr_n2=(value : UInt8) : UInt8
      self.set(ipr_n2: value)
      value
    end

    # IPR_N3
    def ipr_n3 : UInt8
      UInt8.new!((@value >> 24) & 0xff_u32)
    end

    # IPR_N3
    def self.ipr_n3 : UInt8
      value.ipr_n3
    end

    # IPR_N3
    def self.ipr_n3=(value : UInt8) : UInt8
      self.set(ipr_n3: value)
      value
    end

    def copy_with(
      *,

      ipr_n0 : UInt8? = nil,

      ipr_n1 : UInt8? = nil,

      ipr_n2 : UInt8? = nil,

      ipr_n3 : UInt8? = nil
    ) : self
      value = @value

      unless ipr_n0.nil?
        value = (value & 0xffffff00_u32) |
                UInt32.new!(ipr_n0.to_int).&(0xff_u32) << 0
      end

      unless ipr_n1.nil?
        value = (value & 0xffff00ff_u32) |
                UInt32.new!(ipr_n1.to_int).&(0xff_u32) << 8
      end

      unless ipr_n2.nil?
        value = (value & 0xff00ffff_u32) |
                UInt32.new!(ipr_n2.to_int).&(0xff_u32) << 16
      end

      unless ipr_n3.nil?
        value = (value & 0xffffff_u32) |
                UInt32.new!(ipr_n3.to_int).&(0xff_u32) << 24
      end

      self.class.new(value)
    end

    def self.set(
      *,
      ipr_n0 : UInt8? = nil,
      ipr_n1 : UInt8? = nil,
      ipr_n2 : UInt8? = nil,
      ipr_n3 : UInt8? = nil
    ) : Nil
      self.value = self.value.copy_with(
        ipr_n0: ipr_n0,
        ipr_n1: ipr_n1,
        ipr_n2: ipr_n2,
        ipr_n3: ipr_n3,
      )
    end
  end # struct

  # Interrupt Priority Register
  struct IPR8
    ADDRESS = BASE_ADDRESS + 0x320_u64

    protected def self.address : UInt64
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

    # IPR_N0
    def ipr_n0 : UInt8
      UInt8.new!((@value >> 0) & 0xff_u32)
    end

    # IPR_N0
    def self.ipr_n0 : UInt8
      value.ipr_n0
    end

    # IPR_N0
    def self.ipr_n0=(value : UInt8) : UInt8
      self.set(ipr_n0: value)
      value
    end

    # IPR_N1
    def ipr_n1 : UInt8
      UInt8.new!((@value >> 8) & 0xff_u32)
    end

    # IPR_N1
    def self.ipr_n1 : UInt8
      value.ipr_n1
    end

    # IPR_N1
    def self.ipr_n1=(value : UInt8) : UInt8
      self.set(ipr_n1: value)
      value
    end

    # IPR_N2
    def ipr_n2 : UInt8
      UInt8.new!((@value >> 16) & 0xff_u32)
    end

    # IPR_N2
    def self.ipr_n2 : UInt8
      value.ipr_n2
    end

    # IPR_N2
    def self.ipr_n2=(value : UInt8) : UInt8
      self.set(ipr_n2: value)
      value
    end

    # IPR_N3
    def ipr_n3 : UInt8
      UInt8.new!((@value >> 24) & 0xff_u32)
    end

    # IPR_N3
    def self.ipr_n3 : UInt8
      value.ipr_n3
    end

    # IPR_N3
    def self.ipr_n3=(value : UInt8) : UInt8
      self.set(ipr_n3: value)
      value
    end

    def copy_with(
      *,

      ipr_n0 : UInt8? = nil,

      ipr_n1 : UInt8? = nil,

      ipr_n2 : UInt8? = nil,

      ipr_n3 : UInt8? = nil
    ) : self
      value = @value

      unless ipr_n0.nil?
        value = (value & 0xffffff00_u32) |
                UInt32.new!(ipr_n0.to_int).&(0xff_u32) << 0
      end

      unless ipr_n1.nil?
        value = (value & 0xffff00ff_u32) |
                UInt32.new!(ipr_n1.to_int).&(0xff_u32) << 8
      end

      unless ipr_n2.nil?
        value = (value & 0xff00ffff_u32) |
                UInt32.new!(ipr_n2.to_int).&(0xff_u32) << 16
      end

      unless ipr_n3.nil?
        value = (value & 0xffffff_u32) |
                UInt32.new!(ipr_n3.to_int).&(0xff_u32) << 24
      end

      self.class.new(value)
    end

    def self.set(
      *,
      ipr_n0 : UInt8? = nil,
      ipr_n1 : UInt8? = nil,
      ipr_n2 : UInt8? = nil,
      ipr_n3 : UInt8? = nil
    ) : Nil
      self.value = self.value.copy_with(
        ipr_n0: ipr_n0,
        ipr_n1: ipr_n1,
        ipr_n2: ipr_n2,
        ipr_n3: ipr_n3,
      )
    end
  end # struct

  # Interrupt Priority Register
  struct IPR9
    ADDRESS = BASE_ADDRESS + 0x324_u64

    protected def self.address : UInt64
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

    # IPR_N0
    def ipr_n0 : UInt8
      UInt8.new!((@value >> 0) & 0xff_u32)
    end

    # IPR_N0
    def self.ipr_n0 : UInt8
      value.ipr_n0
    end

    # IPR_N0
    def self.ipr_n0=(value : UInt8) : UInt8
      self.set(ipr_n0: value)
      value
    end

    # IPR_N1
    def ipr_n1 : UInt8
      UInt8.new!((@value >> 8) & 0xff_u32)
    end

    # IPR_N1
    def self.ipr_n1 : UInt8
      value.ipr_n1
    end

    # IPR_N1
    def self.ipr_n1=(value : UInt8) : UInt8
      self.set(ipr_n1: value)
      value
    end

    # IPR_N2
    def ipr_n2 : UInt8
      UInt8.new!((@value >> 16) & 0xff_u32)
    end

    # IPR_N2
    def self.ipr_n2 : UInt8
      value.ipr_n2
    end

    # IPR_N2
    def self.ipr_n2=(value : UInt8) : UInt8
      self.set(ipr_n2: value)
      value
    end

    # IPR_N3
    def ipr_n3 : UInt8
      UInt8.new!((@value >> 24) & 0xff_u32)
    end

    # IPR_N3
    def self.ipr_n3 : UInt8
      value.ipr_n3
    end

    # IPR_N3
    def self.ipr_n3=(value : UInt8) : UInt8
      self.set(ipr_n3: value)
      value
    end

    def copy_with(
      *,

      ipr_n0 : UInt8? = nil,

      ipr_n1 : UInt8? = nil,

      ipr_n2 : UInt8? = nil,

      ipr_n3 : UInt8? = nil
    ) : self
      value = @value

      unless ipr_n0.nil?
        value = (value & 0xffffff00_u32) |
                UInt32.new!(ipr_n0.to_int).&(0xff_u32) << 0
      end

      unless ipr_n1.nil?
        value = (value & 0xffff00ff_u32) |
                UInt32.new!(ipr_n1.to_int).&(0xff_u32) << 8
      end

      unless ipr_n2.nil?
        value = (value & 0xff00ffff_u32) |
                UInt32.new!(ipr_n2.to_int).&(0xff_u32) << 16
      end

      unless ipr_n3.nil?
        value = (value & 0xffffff_u32) |
                UInt32.new!(ipr_n3.to_int).&(0xff_u32) << 24
      end

      self.class.new(value)
    end

    def self.set(
      *,
      ipr_n0 : UInt8? = nil,
      ipr_n1 : UInt8? = nil,
      ipr_n2 : UInt8? = nil,
      ipr_n3 : UInt8? = nil
    ) : Nil
      self.value = self.value.copy_with(
        ipr_n0: ipr_n0,
        ipr_n1: ipr_n1,
        ipr_n2: ipr_n2,
        ipr_n3: ipr_n3,
      )
    end
  end # struct

  # Interrupt Priority Register
  struct IPR10
    ADDRESS = BASE_ADDRESS + 0x328_u64

    protected def self.address : UInt64
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

    # IPR_N0
    def ipr_n0 : UInt8
      UInt8.new!((@value >> 0) & 0xff_u32)
    end

    # IPR_N0
    def self.ipr_n0 : UInt8
      value.ipr_n0
    end

    # IPR_N0
    def self.ipr_n0=(value : UInt8) : UInt8
      self.set(ipr_n0: value)
      value
    end

    # IPR_N1
    def ipr_n1 : UInt8
      UInt8.new!((@value >> 8) & 0xff_u32)
    end

    # IPR_N1
    def self.ipr_n1 : UInt8
      value.ipr_n1
    end

    # IPR_N1
    def self.ipr_n1=(value : UInt8) : UInt8
      self.set(ipr_n1: value)
      value
    end

    # IPR_N2
    def ipr_n2 : UInt8
      UInt8.new!((@value >> 16) & 0xff_u32)
    end

    # IPR_N2
    def self.ipr_n2 : UInt8
      value.ipr_n2
    end

    # IPR_N2
    def self.ipr_n2=(value : UInt8) : UInt8
      self.set(ipr_n2: value)
      value
    end

    # IPR_N3
    def ipr_n3 : UInt8
      UInt8.new!((@value >> 24) & 0xff_u32)
    end

    # IPR_N3
    def self.ipr_n3 : UInt8
      value.ipr_n3
    end

    # IPR_N3
    def self.ipr_n3=(value : UInt8) : UInt8
      self.set(ipr_n3: value)
      value
    end

    def copy_with(
      *,

      ipr_n0 : UInt8? = nil,

      ipr_n1 : UInt8? = nil,

      ipr_n2 : UInt8? = nil,

      ipr_n3 : UInt8? = nil
    ) : self
      value = @value

      unless ipr_n0.nil?
        value = (value & 0xffffff00_u32) |
                UInt32.new!(ipr_n0.to_int).&(0xff_u32) << 0
      end

      unless ipr_n1.nil?
        value = (value & 0xffff00ff_u32) |
                UInt32.new!(ipr_n1.to_int).&(0xff_u32) << 8
      end

      unless ipr_n2.nil?
        value = (value & 0xff00ffff_u32) |
                UInt32.new!(ipr_n2.to_int).&(0xff_u32) << 16
      end

      unless ipr_n3.nil?
        value = (value & 0xffffff_u32) |
                UInt32.new!(ipr_n3.to_int).&(0xff_u32) << 24
      end

      self.class.new(value)
    end

    def self.set(
      *,
      ipr_n0 : UInt8? = nil,
      ipr_n1 : UInt8? = nil,
      ipr_n2 : UInt8? = nil,
      ipr_n3 : UInt8? = nil
    ) : Nil
      self.value = self.value.copy_with(
        ipr_n0: ipr_n0,
        ipr_n1: ipr_n1,
        ipr_n2: ipr_n2,
        ipr_n3: ipr_n3,
      )
    end
  end # struct

  # Interrupt Priority Register
  struct IPR11
    ADDRESS = BASE_ADDRESS + 0x32c_u64

    protected def self.address : UInt64
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

    # IPR_N0
    def ipr_n0 : UInt8
      UInt8.new!((@value >> 0) & 0xff_u32)
    end

    # IPR_N0
    def self.ipr_n0 : UInt8
      value.ipr_n0
    end

    # IPR_N0
    def self.ipr_n0=(value : UInt8) : UInt8
      self.set(ipr_n0: value)
      value
    end

    # IPR_N1
    def ipr_n1 : UInt8
      UInt8.new!((@value >> 8) & 0xff_u32)
    end

    # IPR_N1
    def self.ipr_n1 : UInt8
      value.ipr_n1
    end

    # IPR_N1
    def self.ipr_n1=(value : UInt8) : UInt8
      self.set(ipr_n1: value)
      value
    end

    # IPR_N2
    def ipr_n2 : UInt8
      UInt8.new!((@value >> 16) & 0xff_u32)
    end

    # IPR_N2
    def self.ipr_n2 : UInt8
      value.ipr_n2
    end

    # IPR_N2
    def self.ipr_n2=(value : UInt8) : UInt8
      self.set(ipr_n2: value)
      value
    end

    # IPR_N3
    def ipr_n3 : UInt8
      UInt8.new!((@value >> 24) & 0xff_u32)
    end

    # IPR_N3
    def self.ipr_n3 : UInt8
      value.ipr_n3
    end

    # IPR_N3
    def self.ipr_n3=(value : UInt8) : UInt8
      self.set(ipr_n3: value)
      value
    end

    def copy_with(
      *,

      ipr_n0 : UInt8? = nil,

      ipr_n1 : UInt8? = nil,

      ipr_n2 : UInt8? = nil,

      ipr_n3 : UInt8? = nil
    ) : self
      value = @value

      unless ipr_n0.nil?
        value = (value & 0xffffff00_u32) |
                UInt32.new!(ipr_n0.to_int).&(0xff_u32) << 0
      end

      unless ipr_n1.nil?
        value = (value & 0xffff00ff_u32) |
                UInt32.new!(ipr_n1.to_int).&(0xff_u32) << 8
      end

      unless ipr_n2.nil?
        value = (value & 0xff00ffff_u32) |
                UInt32.new!(ipr_n2.to_int).&(0xff_u32) << 16
      end

      unless ipr_n3.nil?
        value = (value & 0xffffff_u32) |
                UInt32.new!(ipr_n3.to_int).&(0xff_u32) << 24
      end

      self.class.new(value)
    end

    def self.set(
      *,
      ipr_n0 : UInt8? = nil,
      ipr_n1 : UInt8? = nil,
      ipr_n2 : UInt8? = nil,
      ipr_n3 : UInt8? = nil
    ) : Nil
      self.value = self.value.copy_with(
        ipr_n0: ipr_n0,
        ipr_n1: ipr_n1,
        ipr_n2: ipr_n2,
        ipr_n3: ipr_n3,
      )
    end
  end # struct

  # Interrupt Priority Register
  struct IPR12
    ADDRESS = BASE_ADDRESS + 0x330_u64

    protected def self.address : UInt64
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

    # IPR_N0
    def ipr_n0 : UInt8
      UInt8.new!((@value >> 0) & 0xff_u32)
    end

    # IPR_N0
    def self.ipr_n0 : UInt8
      value.ipr_n0
    end

    # IPR_N0
    def self.ipr_n0=(value : UInt8) : UInt8
      self.set(ipr_n0: value)
      value
    end

    # IPR_N1
    def ipr_n1 : UInt8
      UInt8.new!((@value >> 8) & 0xff_u32)
    end

    # IPR_N1
    def self.ipr_n1 : UInt8
      value.ipr_n1
    end

    # IPR_N1
    def self.ipr_n1=(value : UInt8) : UInt8
      self.set(ipr_n1: value)
      value
    end

    # IPR_N2
    def ipr_n2 : UInt8
      UInt8.new!((@value >> 16) & 0xff_u32)
    end

    # IPR_N2
    def self.ipr_n2 : UInt8
      value.ipr_n2
    end

    # IPR_N2
    def self.ipr_n2=(value : UInt8) : UInt8
      self.set(ipr_n2: value)
      value
    end

    # IPR_N3
    def ipr_n3 : UInt8
      UInt8.new!((@value >> 24) & 0xff_u32)
    end

    # IPR_N3
    def self.ipr_n3 : UInt8
      value.ipr_n3
    end

    # IPR_N3
    def self.ipr_n3=(value : UInt8) : UInt8
      self.set(ipr_n3: value)
      value
    end

    def copy_with(
      *,

      ipr_n0 : UInt8? = nil,

      ipr_n1 : UInt8? = nil,

      ipr_n2 : UInt8? = nil,

      ipr_n3 : UInt8? = nil
    ) : self
      value = @value

      unless ipr_n0.nil?
        value = (value & 0xffffff00_u32) |
                UInt32.new!(ipr_n0.to_int).&(0xff_u32) << 0
      end

      unless ipr_n1.nil?
        value = (value & 0xffff00ff_u32) |
                UInt32.new!(ipr_n1.to_int).&(0xff_u32) << 8
      end

      unless ipr_n2.nil?
        value = (value & 0xff00ffff_u32) |
                UInt32.new!(ipr_n2.to_int).&(0xff_u32) << 16
      end

      unless ipr_n3.nil?
        value = (value & 0xffffff_u32) |
                UInt32.new!(ipr_n3.to_int).&(0xff_u32) << 24
      end

      self.class.new(value)
    end

    def self.set(
      *,
      ipr_n0 : UInt8? = nil,
      ipr_n1 : UInt8? = nil,
      ipr_n2 : UInt8? = nil,
      ipr_n3 : UInt8? = nil
    ) : Nil
      self.value = self.value.copy_with(
        ipr_n0: ipr_n0,
        ipr_n1: ipr_n1,
        ipr_n2: ipr_n2,
        ipr_n3: ipr_n3,
      )
    end
  end # struct

  # Interrupt Priority Register
  struct IPR13
    ADDRESS = BASE_ADDRESS + 0x334_u64

    protected def self.address : UInt64
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

    # IPR_N0
    def ipr_n0 : UInt8
      UInt8.new!((@value >> 0) & 0xff_u32)
    end

    # IPR_N0
    def self.ipr_n0 : UInt8
      value.ipr_n0
    end

    # IPR_N0
    def self.ipr_n0=(value : UInt8) : UInt8
      self.set(ipr_n0: value)
      value
    end

    # IPR_N1
    def ipr_n1 : UInt8
      UInt8.new!((@value >> 8) & 0xff_u32)
    end

    # IPR_N1
    def self.ipr_n1 : UInt8
      value.ipr_n1
    end

    # IPR_N1
    def self.ipr_n1=(value : UInt8) : UInt8
      self.set(ipr_n1: value)
      value
    end

    # IPR_N2
    def ipr_n2 : UInt8
      UInt8.new!((@value >> 16) & 0xff_u32)
    end

    # IPR_N2
    def self.ipr_n2 : UInt8
      value.ipr_n2
    end

    # IPR_N2
    def self.ipr_n2=(value : UInt8) : UInt8
      self.set(ipr_n2: value)
      value
    end

    # IPR_N3
    def ipr_n3 : UInt8
      UInt8.new!((@value >> 24) & 0xff_u32)
    end

    # IPR_N3
    def self.ipr_n3 : UInt8
      value.ipr_n3
    end

    # IPR_N3
    def self.ipr_n3=(value : UInt8) : UInt8
      self.set(ipr_n3: value)
      value
    end

    def copy_with(
      *,

      ipr_n0 : UInt8? = nil,

      ipr_n1 : UInt8? = nil,

      ipr_n2 : UInt8? = nil,

      ipr_n3 : UInt8? = nil
    ) : self
      value = @value

      unless ipr_n0.nil?
        value = (value & 0xffffff00_u32) |
                UInt32.new!(ipr_n0.to_int).&(0xff_u32) << 0
      end

      unless ipr_n1.nil?
        value = (value & 0xffff00ff_u32) |
                UInt32.new!(ipr_n1.to_int).&(0xff_u32) << 8
      end

      unless ipr_n2.nil?
        value = (value & 0xff00ffff_u32) |
                UInt32.new!(ipr_n2.to_int).&(0xff_u32) << 16
      end

      unless ipr_n3.nil?
        value = (value & 0xffffff_u32) |
                UInt32.new!(ipr_n3.to_int).&(0xff_u32) << 24
      end

      self.class.new(value)
    end

    def self.set(
      *,
      ipr_n0 : UInt8? = nil,
      ipr_n1 : UInt8? = nil,
      ipr_n2 : UInt8? = nil,
      ipr_n3 : UInt8? = nil
    ) : Nil
      self.value = self.value.copy_with(
        ipr_n0: ipr_n0,
        ipr_n1: ipr_n1,
        ipr_n2: ipr_n2,
        ipr_n3: ipr_n3,
      )
    end
  end # struct

  # Interrupt Priority Register
  struct IPR14
    ADDRESS = BASE_ADDRESS + 0x338_u64

    protected def self.address : UInt64
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

    # IPR_N0
    def ipr_n0 : UInt8
      UInt8.new!((@value >> 0) & 0xff_u32)
    end

    # IPR_N0
    def self.ipr_n0 : UInt8
      value.ipr_n0
    end

    # IPR_N0
    def self.ipr_n0=(value : UInt8) : UInt8
      self.set(ipr_n0: value)
      value
    end

    # IPR_N1
    def ipr_n1 : UInt8
      UInt8.new!((@value >> 8) & 0xff_u32)
    end

    # IPR_N1
    def self.ipr_n1 : UInt8
      value.ipr_n1
    end

    # IPR_N1
    def self.ipr_n1=(value : UInt8) : UInt8
      self.set(ipr_n1: value)
      value
    end

    # IPR_N2
    def ipr_n2 : UInt8
      UInt8.new!((@value >> 16) & 0xff_u32)
    end

    # IPR_N2
    def self.ipr_n2 : UInt8
      value.ipr_n2
    end

    # IPR_N2
    def self.ipr_n2=(value : UInt8) : UInt8
      self.set(ipr_n2: value)
      value
    end

    # IPR_N3
    def ipr_n3 : UInt8
      UInt8.new!((@value >> 24) & 0xff_u32)
    end

    # IPR_N3
    def self.ipr_n3 : UInt8
      value.ipr_n3
    end

    # IPR_N3
    def self.ipr_n3=(value : UInt8) : UInt8
      self.set(ipr_n3: value)
      value
    end

    def copy_with(
      *,

      ipr_n0 : UInt8? = nil,

      ipr_n1 : UInt8? = nil,

      ipr_n2 : UInt8? = nil,

      ipr_n3 : UInt8? = nil
    ) : self
      value = @value

      unless ipr_n0.nil?
        value = (value & 0xffffff00_u32) |
                UInt32.new!(ipr_n0.to_int).&(0xff_u32) << 0
      end

      unless ipr_n1.nil?
        value = (value & 0xffff00ff_u32) |
                UInt32.new!(ipr_n1.to_int).&(0xff_u32) << 8
      end

      unless ipr_n2.nil?
        value = (value & 0xff00ffff_u32) |
                UInt32.new!(ipr_n2.to_int).&(0xff_u32) << 16
      end

      unless ipr_n3.nil?
        value = (value & 0xffffff_u32) |
                UInt32.new!(ipr_n3.to_int).&(0xff_u32) << 24
      end

      self.class.new(value)
    end

    def self.set(
      *,
      ipr_n0 : UInt8? = nil,
      ipr_n1 : UInt8? = nil,
      ipr_n2 : UInt8? = nil,
      ipr_n3 : UInt8? = nil
    ) : Nil
      self.value = self.value.copy_with(
        ipr_n0: ipr_n0,
        ipr_n1: ipr_n1,
        ipr_n2: ipr_n2,
        ipr_n3: ipr_n3,
      )
    end
  end # struct

  # Interrupt Priority Register
  struct IPR15
    ADDRESS = BASE_ADDRESS + 0x33c_u64

    protected def self.address : UInt64
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

    # IPR_N0
    def ipr_n0 : UInt8
      UInt8.new!((@value >> 0) & 0xff_u32)
    end

    # IPR_N0
    def self.ipr_n0 : UInt8
      value.ipr_n0
    end

    # IPR_N0
    def self.ipr_n0=(value : UInt8) : UInt8
      self.set(ipr_n0: value)
      value
    end

    # IPR_N1
    def ipr_n1 : UInt8
      UInt8.new!((@value >> 8) & 0xff_u32)
    end

    # IPR_N1
    def self.ipr_n1 : UInt8
      value.ipr_n1
    end

    # IPR_N1
    def self.ipr_n1=(value : UInt8) : UInt8
      self.set(ipr_n1: value)
      value
    end

    # IPR_N2
    def ipr_n2 : UInt8
      UInt8.new!((@value >> 16) & 0xff_u32)
    end

    # IPR_N2
    def self.ipr_n2 : UInt8
      value.ipr_n2
    end

    # IPR_N2
    def self.ipr_n2=(value : UInt8) : UInt8
      self.set(ipr_n2: value)
      value
    end

    # IPR_N3
    def ipr_n3 : UInt8
      UInt8.new!((@value >> 24) & 0xff_u32)
    end

    # IPR_N3
    def self.ipr_n3 : UInt8
      value.ipr_n3
    end

    # IPR_N3
    def self.ipr_n3=(value : UInt8) : UInt8
      self.set(ipr_n3: value)
      value
    end

    def copy_with(
      *,

      ipr_n0 : UInt8? = nil,

      ipr_n1 : UInt8? = nil,

      ipr_n2 : UInt8? = nil,

      ipr_n3 : UInt8? = nil
    ) : self
      value = @value

      unless ipr_n0.nil?
        value = (value & 0xffffff00_u32) |
                UInt32.new!(ipr_n0.to_int).&(0xff_u32) << 0
      end

      unless ipr_n1.nil?
        value = (value & 0xffff00ff_u32) |
                UInt32.new!(ipr_n1.to_int).&(0xff_u32) << 8
      end

      unless ipr_n2.nil?
        value = (value & 0xff00ffff_u32) |
                UInt32.new!(ipr_n2.to_int).&(0xff_u32) << 16
      end

      unless ipr_n3.nil?
        value = (value & 0xffffff_u32) |
                UInt32.new!(ipr_n3.to_int).&(0xff_u32) << 24
      end

      self.class.new(value)
    end

    def self.set(
      *,
      ipr_n0 : UInt8? = nil,
      ipr_n1 : UInt8? = nil,
      ipr_n2 : UInt8? = nil,
      ipr_n3 : UInt8? = nil
    ) : Nil
      self.value = self.value.copy_with(
        ipr_n0: ipr_n0,
        ipr_n1: ipr_n1,
        ipr_n2: ipr_n2,
        ipr_n3: ipr_n3,
      )
    end
  end # struct

  # Interrupt Priority Register
  struct IPR16
    ADDRESS = BASE_ADDRESS + 0x340_u64

    protected def self.address : UInt64
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

    # IPR_N0
    def ipr_n0 : UInt8
      UInt8.new!((@value >> 0) & 0xff_u32)
    end

    # IPR_N0
    def self.ipr_n0 : UInt8
      value.ipr_n0
    end

    # IPR_N0
    def self.ipr_n0=(value : UInt8) : UInt8
      self.set(ipr_n0: value)
      value
    end

    # IPR_N1
    def ipr_n1 : UInt8
      UInt8.new!((@value >> 8) & 0xff_u32)
    end

    # IPR_N1
    def self.ipr_n1 : UInt8
      value.ipr_n1
    end

    # IPR_N1
    def self.ipr_n1=(value : UInt8) : UInt8
      self.set(ipr_n1: value)
      value
    end

    # IPR_N2
    def ipr_n2 : UInt8
      UInt8.new!((@value >> 16) & 0xff_u32)
    end

    # IPR_N2
    def self.ipr_n2 : UInt8
      value.ipr_n2
    end

    # IPR_N2
    def self.ipr_n2=(value : UInt8) : UInt8
      self.set(ipr_n2: value)
      value
    end

    # IPR_N3
    def ipr_n3 : UInt8
      UInt8.new!((@value >> 24) & 0xff_u32)
    end

    # IPR_N3
    def self.ipr_n3 : UInt8
      value.ipr_n3
    end

    # IPR_N3
    def self.ipr_n3=(value : UInt8) : UInt8
      self.set(ipr_n3: value)
      value
    end

    def copy_with(
      *,

      ipr_n0 : UInt8? = nil,

      ipr_n1 : UInt8? = nil,

      ipr_n2 : UInt8? = nil,

      ipr_n3 : UInt8? = nil
    ) : self
      value = @value

      unless ipr_n0.nil?
        value = (value & 0xffffff00_u32) |
                UInt32.new!(ipr_n0.to_int).&(0xff_u32) << 0
      end

      unless ipr_n1.nil?
        value = (value & 0xffff00ff_u32) |
                UInt32.new!(ipr_n1.to_int).&(0xff_u32) << 8
      end

      unless ipr_n2.nil?
        value = (value & 0xff00ffff_u32) |
                UInt32.new!(ipr_n2.to_int).&(0xff_u32) << 16
      end

      unless ipr_n3.nil?
        value = (value & 0xffffff_u32) |
                UInt32.new!(ipr_n3.to_int).&(0xff_u32) << 24
      end

      self.class.new(value)
    end

    def self.set(
      *,
      ipr_n0 : UInt8? = nil,
      ipr_n1 : UInt8? = nil,
      ipr_n2 : UInt8? = nil,
      ipr_n3 : UInt8? = nil
    ) : Nil
      self.value = self.value.copy_with(
        ipr_n0: ipr_n0,
        ipr_n1: ipr_n1,
        ipr_n2: ipr_n2,
        ipr_n3: ipr_n3,
      )
    end
  end # struct

  # Interrupt Priority Register
  struct IPR17
    ADDRESS = BASE_ADDRESS + 0x344_u64

    protected def self.address : UInt64
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

    # IPR_N0
    def ipr_n0 : UInt8
      UInt8.new!((@value >> 0) & 0xff_u32)
    end

    # IPR_N0
    def self.ipr_n0 : UInt8
      value.ipr_n0
    end

    # IPR_N0
    def self.ipr_n0=(value : UInt8) : UInt8
      self.set(ipr_n0: value)
      value
    end

    # IPR_N1
    def ipr_n1 : UInt8
      UInt8.new!((@value >> 8) & 0xff_u32)
    end

    # IPR_N1
    def self.ipr_n1 : UInt8
      value.ipr_n1
    end

    # IPR_N1
    def self.ipr_n1=(value : UInt8) : UInt8
      self.set(ipr_n1: value)
      value
    end

    # IPR_N2
    def ipr_n2 : UInt8
      UInt8.new!((@value >> 16) & 0xff_u32)
    end

    # IPR_N2
    def self.ipr_n2 : UInt8
      value.ipr_n2
    end

    # IPR_N2
    def self.ipr_n2=(value : UInt8) : UInt8
      self.set(ipr_n2: value)
      value
    end

    # IPR_N3
    def ipr_n3 : UInt8
      UInt8.new!((@value >> 24) & 0xff_u32)
    end

    # IPR_N3
    def self.ipr_n3 : UInt8
      value.ipr_n3
    end

    # IPR_N3
    def self.ipr_n3=(value : UInt8) : UInt8
      self.set(ipr_n3: value)
      value
    end

    def copy_with(
      *,

      ipr_n0 : UInt8? = nil,

      ipr_n1 : UInt8? = nil,

      ipr_n2 : UInt8? = nil,

      ipr_n3 : UInt8? = nil
    ) : self
      value = @value

      unless ipr_n0.nil?
        value = (value & 0xffffff00_u32) |
                UInt32.new!(ipr_n0.to_int).&(0xff_u32) << 0
      end

      unless ipr_n1.nil?
        value = (value & 0xffff00ff_u32) |
                UInt32.new!(ipr_n1.to_int).&(0xff_u32) << 8
      end

      unless ipr_n2.nil?
        value = (value & 0xff00ffff_u32) |
                UInt32.new!(ipr_n2.to_int).&(0xff_u32) << 16
      end

      unless ipr_n3.nil?
        value = (value & 0xffffff_u32) |
                UInt32.new!(ipr_n3.to_int).&(0xff_u32) << 24
      end

      self.class.new(value)
    end

    def self.set(
      *,
      ipr_n0 : UInt8? = nil,
      ipr_n1 : UInt8? = nil,
      ipr_n2 : UInt8? = nil,
      ipr_n3 : UInt8? = nil
    ) : Nil
      self.value = self.value.copy_with(
        ipr_n0: ipr_n0,
        ipr_n1: ipr_n1,
        ipr_n2: ipr_n2,
        ipr_n3: ipr_n3,
      )
    end
  end # struct

  # Interrupt Priority Register
  struct IPR18
    ADDRESS = BASE_ADDRESS + 0x348_u64

    protected def self.address : UInt64
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

    # IPR_N0
    def ipr_n0 : UInt8
      UInt8.new!((@value >> 0) & 0xff_u32)
    end

    # IPR_N0
    def self.ipr_n0 : UInt8
      value.ipr_n0
    end

    # IPR_N0
    def self.ipr_n0=(value : UInt8) : UInt8
      self.set(ipr_n0: value)
      value
    end

    # IPR_N1
    def ipr_n1 : UInt8
      UInt8.new!((@value >> 8) & 0xff_u32)
    end

    # IPR_N1
    def self.ipr_n1 : UInt8
      value.ipr_n1
    end

    # IPR_N1
    def self.ipr_n1=(value : UInt8) : UInt8
      self.set(ipr_n1: value)
      value
    end

    # IPR_N2
    def ipr_n2 : UInt8
      UInt8.new!((@value >> 16) & 0xff_u32)
    end

    # IPR_N2
    def self.ipr_n2 : UInt8
      value.ipr_n2
    end

    # IPR_N2
    def self.ipr_n2=(value : UInt8) : UInt8
      self.set(ipr_n2: value)
      value
    end

    # IPR_N3
    def ipr_n3 : UInt8
      UInt8.new!((@value >> 24) & 0xff_u32)
    end

    # IPR_N3
    def self.ipr_n3 : UInt8
      value.ipr_n3
    end

    # IPR_N3
    def self.ipr_n3=(value : UInt8) : UInt8
      self.set(ipr_n3: value)
      value
    end

    def copy_with(
      *,

      ipr_n0 : UInt8? = nil,

      ipr_n1 : UInt8? = nil,

      ipr_n2 : UInt8? = nil,

      ipr_n3 : UInt8? = nil
    ) : self
      value = @value

      unless ipr_n0.nil?
        value = (value & 0xffffff00_u32) |
                UInt32.new!(ipr_n0.to_int).&(0xff_u32) << 0
      end

      unless ipr_n1.nil?
        value = (value & 0xffff00ff_u32) |
                UInt32.new!(ipr_n1.to_int).&(0xff_u32) << 8
      end

      unless ipr_n2.nil?
        value = (value & 0xff00ffff_u32) |
                UInt32.new!(ipr_n2.to_int).&(0xff_u32) << 16
      end

      unless ipr_n3.nil?
        value = (value & 0xffffff_u32) |
                UInt32.new!(ipr_n3.to_int).&(0xff_u32) << 24
      end

      self.class.new(value)
    end

    def self.set(
      *,
      ipr_n0 : UInt8? = nil,
      ipr_n1 : UInt8? = nil,
      ipr_n2 : UInt8? = nil,
      ipr_n3 : UInt8? = nil
    ) : Nil
      self.value = self.value.copy_with(
        ipr_n0: ipr_n0,
        ipr_n1: ipr_n1,
        ipr_n2: ipr_n2,
        ipr_n3: ipr_n3,
      )
    end
  end # struct

  # Interrupt Priority Register
  struct IPR19
    ADDRESS = BASE_ADDRESS + 0x34c_u64

    protected def self.address : UInt64
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

    # IPR_N0
    def ipr_n0 : UInt8
      UInt8.new!((@value >> 0) & 0xff_u32)
    end

    # IPR_N0
    def self.ipr_n0 : UInt8
      value.ipr_n0
    end

    # IPR_N0
    def self.ipr_n0=(value : UInt8) : UInt8
      self.set(ipr_n0: value)
      value
    end

    # IPR_N1
    def ipr_n1 : UInt8
      UInt8.new!((@value >> 8) & 0xff_u32)
    end

    # IPR_N1
    def self.ipr_n1 : UInt8
      value.ipr_n1
    end

    # IPR_N1
    def self.ipr_n1=(value : UInt8) : UInt8
      self.set(ipr_n1: value)
      value
    end

    # IPR_N2
    def ipr_n2 : UInt8
      UInt8.new!((@value >> 16) & 0xff_u32)
    end

    # IPR_N2
    def self.ipr_n2 : UInt8
      value.ipr_n2
    end

    # IPR_N2
    def self.ipr_n2=(value : UInt8) : UInt8
      self.set(ipr_n2: value)
      value
    end

    # IPR_N3
    def ipr_n3 : UInt8
      UInt8.new!((@value >> 24) & 0xff_u32)
    end

    # IPR_N3
    def self.ipr_n3 : UInt8
      value.ipr_n3
    end

    # IPR_N3
    def self.ipr_n3=(value : UInt8) : UInt8
      self.set(ipr_n3: value)
      value
    end

    def copy_with(
      *,

      ipr_n0 : UInt8? = nil,

      ipr_n1 : UInt8? = nil,

      ipr_n2 : UInt8? = nil,

      ipr_n3 : UInt8? = nil
    ) : self
      value = @value

      unless ipr_n0.nil?
        value = (value & 0xffffff00_u32) |
                UInt32.new!(ipr_n0.to_int).&(0xff_u32) << 0
      end

      unless ipr_n1.nil?
        value = (value & 0xffff00ff_u32) |
                UInt32.new!(ipr_n1.to_int).&(0xff_u32) << 8
      end

      unless ipr_n2.nil?
        value = (value & 0xff00ffff_u32) |
                UInt32.new!(ipr_n2.to_int).&(0xff_u32) << 16
      end

      unless ipr_n3.nil?
        value = (value & 0xffffff_u32) |
                UInt32.new!(ipr_n3.to_int).&(0xff_u32) << 24
      end

      self.class.new(value)
    end

    def self.set(
      *,
      ipr_n0 : UInt8? = nil,
      ipr_n1 : UInt8? = nil,
      ipr_n2 : UInt8? = nil,
      ipr_n3 : UInt8? = nil
    ) : Nil
      self.value = self.value.copy_with(
        ipr_n0: ipr_n0,
        ipr_n1: ipr_n1,
        ipr_n2: ipr_n2,
        ipr_n3: ipr_n3,
      )
    end
  end # struct

  # Interrupt Priority Register
  struct IPR20
    ADDRESS = BASE_ADDRESS + 0x350_u64

    protected def self.address : UInt64
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

    # IPR_N0
    def ipr_n0 : UInt8
      UInt8.new!((@value >> 0) & 0xff_u32)
    end

    # IPR_N0
    def self.ipr_n0 : UInt8
      value.ipr_n0
    end

    # IPR_N0
    def self.ipr_n0=(value : UInt8) : UInt8
      self.set(ipr_n0: value)
      value
    end

    # IPR_N1
    def ipr_n1 : UInt8
      UInt8.new!((@value >> 8) & 0xff_u32)
    end

    # IPR_N1
    def self.ipr_n1 : UInt8
      value.ipr_n1
    end

    # IPR_N1
    def self.ipr_n1=(value : UInt8) : UInt8
      self.set(ipr_n1: value)
      value
    end

    # IPR_N2
    def ipr_n2 : UInt8
      UInt8.new!((@value >> 16) & 0xff_u32)
    end

    # IPR_N2
    def self.ipr_n2 : UInt8
      value.ipr_n2
    end

    # IPR_N2
    def self.ipr_n2=(value : UInt8) : UInt8
      self.set(ipr_n2: value)
      value
    end

    # IPR_N3
    def ipr_n3 : UInt8
      UInt8.new!((@value >> 24) & 0xff_u32)
    end

    # IPR_N3
    def self.ipr_n3 : UInt8
      value.ipr_n3
    end

    # IPR_N3
    def self.ipr_n3=(value : UInt8) : UInt8
      self.set(ipr_n3: value)
      value
    end

    def copy_with(
      *,

      ipr_n0 : UInt8? = nil,

      ipr_n1 : UInt8? = nil,

      ipr_n2 : UInt8? = nil,

      ipr_n3 : UInt8? = nil
    ) : self
      value = @value

      unless ipr_n0.nil?
        value = (value & 0xffffff00_u32) |
                UInt32.new!(ipr_n0.to_int).&(0xff_u32) << 0
      end

      unless ipr_n1.nil?
        value = (value & 0xffff00ff_u32) |
                UInt32.new!(ipr_n1.to_int).&(0xff_u32) << 8
      end

      unless ipr_n2.nil?
        value = (value & 0xff00ffff_u32) |
                UInt32.new!(ipr_n2.to_int).&(0xff_u32) << 16
      end

      unless ipr_n3.nil?
        value = (value & 0xffffff_u32) |
                UInt32.new!(ipr_n3.to_int).&(0xff_u32) << 24
      end

      self.class.new(value)
    end

    def self.set(
      *,
      ipr_n0 : UInt8? = nil,
      ipr_n1 : UInt8? = nil,
      ipr_n2 : UInt8? = nil,
      ipr_n3 : UInt8? = nil
    ) : Nil
      self.value = self.value.copy_with(
        ipr_n0: ipr_n0,
        ipr_n1: ipr_n1,
        ipr_n2: ipr_n2,
        ipr_n3: ipr_n3,
      )
    end
  end # struct

end
