# DMA2D controller
module DMA2D
  VERSION      = nil
  BASE_ADDRESS = 0x4002b000_u64

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

    # DMA2D mode
    def mode : UInt8
      UInt8.new!((@value >> 16) & 0x3_u32)
    end

    # DMA2D mode
    def self.mode : UInt8
      value.mode
    end

    # DMA2D mode
    def self.mode=(value : UInt8) : UInt8
      self.set(mode: value)
      value
    end

    # Configuration Error Interrupt              Enable
    def ceie : Bool
      @value.bits_set?(0x2000_u32)
    end

    # Configuration Error Interrupt              Enable
    def self.ceie : Bool
      value.ceie
    end

    # Configuration Error Interrupt              Enable
    def self.ceie=(value : Bool) : Bool
      self.set(ceie: value)
      value
    end

    # CLUT transfer complete interrupt              enable
    def ctcie : Bool
      @value.bits_set?(0x1000_u32)
    end

    # CLUT transfer complete interrupt              enable
    def self.ctcie : Bool
      value.ctcie
    end

    # CLUT transfer complete interrupt              enable
    def self.ctcie=(value : Bool) : Bool
      self.set(ctcie: value)
      value
    end

    # CLUT access error interrupt              enable
    def caeie : Bool
      @value.bits_set?(0x800_u32)
    end

    # CLUT access error interrupt              enable
    def self.caeie : Bool
      value.caeie
    end

    # CLUT access error interrupt              enable
    def self.caeie=(value : Bool) : Bool
      self.set(caeie: value)
      value
    end

    # Transfer watermark interrupt              enable
    def twie : Bool
      @value.bits_set?(0x400_u32)
    end

    # Transfer watermark interrupt              enable
    def self.twie : Bool
      value.twie
    end

    # Transfer watermark interrupt              enable
    def self.twie=(value : Bool) : Bool
      self.set(twie: value)
      value
    end

    # Transfer complete interrupt              enable
    def tcie : Bool
      @value.bits_set?(0x200_u32)
    end

    # Transfer complete interrupt              enable
    def self.tcie : Bool
      value.tcie
    end

    # Transfer complete interrupt              enable
    def self.tcie=(value : Bool) : Bool
      self.set(tcie: value)
      value
    end

    # Transfer error interrupt              enable
    def teie : Bool
      @value.bits_set?(0x100_u32)
    end

    # Transfer error interrupt              enable
    def self.teie : Bool
      value.teie
    end

    # Transfer error interrupt              enable
    def self.teie=(value : Bool) : Bool
      self.set(teie: value)
      value
    end

    # Abort
    def abort : Bool
      @value.bits_set?(0x4_u32)
    end

    # Abort
    def self.abort : Bool
      value.abort
    end

    # Abort
    def self.abort=(value : Bool) : Bool
      self.set(abort: value)
      value
    end

    # Suspend
    def susp : Bool
      @value.bits_set?(0x2_u32)
    end

    # Suspend
    def self.susp : Bool
      value.susp
    end

    # Suspend
    def self.susp=(value : Bool) : Bool
      self.set(susp: value)
      value
    end

    # Start
    def start : Bool
      @value.bits_set?(0x1_u32)
    end

    # Start
    def self.start : Bool
      value.start
    end

    # Start
    def self.start=(value : Bool) : Bool
      self.set(start: value)
      value
    end

    def copy_with(
      *,

      mode : UInt8? = nil,

      ceie : Bool? = nil,

      ctcie : Bool? = nil,

      caeie : Bool? = nil,

      twie : Bool? = nil,

      tcie : Bool? = nil,

      teie : Bool? = nil,

      abort : Bool? = nil,

      susp : Bool? = nil,

      start : Bool? = nil
    ) : self
      value = @value

      unless mode.nil?
        value = (value & 0xfffcffff_u32) |
                UInt32.new!(mode.to_int).&(0x3_u32) << 16
      end

      unless ceie.nil?
        value = (value & 0xffffdfff_u32) |
                UInt32.new!(ceie.to_int).&(0x1_u32) << 13
      end

      unless ctcie.nil?
        value = (value & 0xffffefff_u32) |
                UInt32.new!(ctcie.to_int).&(0x1_u32) << 12
      end

      unless caeie.nil?
        value = (value & 0xfffff7ff_u32) |
                UInt32.new!(caeie.to_int).&(0x1_u32) << 11
      end

      unless twie.nil?
        value = (value & 0xfffffbff_u32) |
                UInt32.new!(twie.to_int).&(0x1_u32) << 10
      end

      unless tcie.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(tcie.to_int).&(0x1_u32) << 9
      end

      unless teie.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(teie.to_int).&(0x1_u32) << 8
      end

      unless abort.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(abort.to_int).&(0x1_u32) << 2
      end

      unless susp.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(susp.to_int).&(0x1_u32) << 1
      end

      unless start.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(start.to_int).&(0x1_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      mode : UInt8? = nil,
      ceie : Bool? = nil,
      ctcie : Bool? = nil,
      caeie : Bool? = nil,
      twie : Bool? = nil,
      tcie : Bool? = nil,
      teie : Bool? = nil,
      abort : Bool? = nil,
      susp : Bool? = nil,
      start : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        mode: mode,
        ceie: ceie,
        ctcie: ctcie,
        caeie: caeie,
        twie: twie,
        tcie: tcie,
        teie: teie,
        abort: abort,
        susp: susp,
        start: start,
      )
    end
  end # struct

  # Interrupt Status Register
  struct ISR
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

    # Configuration error interrupt              flag
    def ceif : Bool
      @value.bits_set?(0x20_u32)
    end

    # Configuration error interrupt              flag
    def self.ceif : Bool
      value.ceif
    end

    # CLUT transfer complete interrupt              flag
    def ctcif : Bool
      @value.bits_set?(0x10_u32)
    end

    # CLUT transfer complete interrupt              flag
    def self.ctcif : Bool
      value.ctcif
    end

    # CLUT access error interrupt              flag
    def caeif : Bool
      @value.bits_set?(0x8_u32)
    end

    # CLUT access error interrupt              flag
    def self.caeif : Bool
      value.caeif
    end

    # Transfer watermark interrupt              flag
    def twif : Bool
      @value.bits_set?(0x4_u32)
    end

    # Transfer watermark interrupt              flag
    def self.twif : Bool
      value.twif
    end

    # Transfer complete interrupt              flag
    def tcif : Bool
      @value.bits_set?(0x2_u32)
    end

    # Transfer complete interrupt              flag
    def self.tcif : Bool
      value.tcif
    end

    # Transfer error interrupt              flag
    def teif : Bool
      @value.bits_set?(0x1_u32)
    end

    # Transfer error interrupt              flag
    def self.teif : Bool
      value.teif
    end
  end # struct

  # interrupt flag clear register
  struct IFCR
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

    # Clear configuration error interrupt              flag
    def cceif : Bool
      @value.bits_set?(0x20_u32)
    end

    # Clear configuration error interrupt              flag
    def self.cceif : Bool
      value.cceif
    end

    # Clear configuration error interrupt              flag
    def self.cceif=(value : Bool) : Bool
      self.set(cceif: value)
      value
    end

    # Clear CLUT transfer complete interrupt              flag
    def cctcif : Bool
      @value.bits_set?(0x10_u32)
    end

    # Clear CLUT transfer complete interrupt              flag
    def self.cctcif : Bool
      value.cctcif
    end

    # Clear CLUT transfer complete interrupt              flag
    def self.cctcif=(value : Bool) : Bool
      self.set(cctcif: value)
      value
    end

    # Clear CLUT access error interrupt              flag
    def caecif : Bool
      @value.bits_set?(0x8_u32)
    end

    # Clear CLUT access error interrupt              flag
    def self.caecif : Bool
      value.caecif
    end

    # Clear CLUT access error interrupt              flag
    def self.caecif=(value : Bool) : Bool
      self.set(caecif: value)
      value
    end

    # Clear transfer watermark interrupt              flag
    def ctwif : Bool
      @value.bits_set?(0x4_u32)
    end

    # Clear transfer watermark interrupt              flag
    def self.ctwif : Bool
      value.ctwif
    end

    # Clear transfer watermark interrupt              flag
    def self.ctwif=(value : Bool) : Bool
      self.set(ctwif: value)
      value
    end

    # Clear transfer complete interrupt              flag
    def ctcif : Bool
      @value.bits_set?(0x2_u32)
    end

    # Clear transfer complete interrupt              flag
    def self.ctcif : Bool
      value.ctcif
    end

    # Clear transfer complete interrupt              flag
    def self.ctcif=(value : Bool) : Bool
      self.set(ctcif: value)
      value
    end

    # Clear Transfer error interrupt              flag
    def cteif : Bool
      @value.bits_set?(0x1_u32)
    end

    # Clear Transfer error interrupt              flag
    def self.cteif : Bool
      value.cteif
    end

    # Clear Transfer error interrupt              flag
    def self.cteif=(value : Bool) : Bool
      self.set(cteif: value)
      value
    end

    def copy_with(
      *,

      cceif : Bool? = nil,

      cctcif : Bool? = nil,

      caecif : Bool? = nil,

      ctwif : Bool? = nil,

      ctcif : Bool? = nil,

      cteif : Bool? = nil
    ) : self
      value = @value

      unless cceif.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(cceif.to_int).&(0x1_u32) << 5
      end

      unless cctcif.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(cctcif.to_int).&(0x1_u32) << 4
      end

      unless caecif.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(caecif.to_int).&(0x1_u32) << 3
      end

      unless ctwif.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(ctwif.to_int).&(0x1_u32) << 2
      end

      unless ctcif.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(ctcif.to_int).&(0x1_u32) << 1
      end

      unless cteif.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(cteif.to_int).&(0x1_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      cceif : Bool? = nil,
      cctcif : Bool? = nil,
      caecif : Bool? = nil,
      ctwif : Bool? = nil,
      ctcif : Bool? = nil,
      cteif : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        cceif: cceif,
        cctcif: cctcif,
        caecif: caecif,
        ctwif: ctwif,
        ctcif: ctcif,
        cteif: cteif,
      )
    end
  end # struct

  # foreground memory address          register
  struct FGMAR
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

    # Memory address
    def ma : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # Memory address
    def self.ma : UInt32
      value.ma
    end

    # Memory address
    def self.ma=(value : UInt32) : UInt32
      self.set(ma: value)
      value
    end

    def copy_with(
      *,

      ma : UInt32? = nil
    ) : self
      value = @value

      unless ma.nil?
        value = (value & 0xffffffff_u32) |
                UInt32.new!(ma.to_int).&(0x0_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      ma : UInt32? = nil
    ) : Nil
      self.value = self.value.copy_with(
        ma: ma,
      )
    end
  end # struct

  # foreground offset register
  struct FGOR
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

    # Line offset
    def lo : UInt16
      UInt16.new!((@value >> 0) & 0x3fff_u32)
    end

    # Line offset
    def self.lo : UInt16
      value.lo
    end

    # Line offset
    def self.lo=(value : UInt16) : UInt16
      self.set(lo: value)
      value
    end

    def copy_with(
      *,

      lo : UInt16? = nil
    ) : self
      value = @value

      unless lo.nil?
        value = (value & 0xffffc000_u32) |
                UInt32.new!(lo.to_int).&(0x3fff_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      lo : UInt16? = nil
    ) : Nil
      self.value = self.value.copy_with(
        lo: lo,
      )
    end
  end # struct

  # background memory address          register
  struct BGMAR
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

    # Memory address
    def ma : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # Memory address
    def self.ma : UInt32
      value.ma
    end

    # Memory address
    def self.ma=(value : UInt32) : UInt32
      self.set(ma: value)
      value
    end

    def copy_with(
      *,

      ma : UInt32? = nil
    ) : self
      value = @value

      unless ma.nil?
        value = (value & 0xffffffff_u32) |
                UInt32.new!(ma.to_int).&(0x0_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      ma : UInt32? = nil
    ) : Nil
      self.value = self.value.copy_with(
        ma: ma,
      )
    end
  end # struct

  # background offset register
  struct BGOR
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

    # Line offset
    def lo : UInt16
      UInt16.new!((@value >> 0) & 0x3fff_u32)
    end

    # Line offset
    def self.lo : UInt16
      value.lo
    end

    # Line offset
    def self.lo=(value : UInt16) : UInt16
      self.set(lo: value)
      value
    end

    def copy_with(
      *,

      lo : UInt16? = nil
    ) : self
      value = @value

      unless lo.nil?
        value = (value & 0xffffc000_u32) |
                UInt32.new!(lo.to_int).&(0x3fff_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      lo : UInt16? = nil
    ) : Nil
      self.value = self.value.copy_with(
        lo: lo,
      )
    end
  end # struct

  # foreground PFC control          register
  struct FGPFCCR
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

    # Alpha value
    def alpha : UInt8
      UInt8.new!((@value >> 24) & 0xff_u32)
    end

    # Alpha value
    def self.alpha : UInt8
      value.alpha
    end

    # Alpha value
    def self.alpha=(value : UInt8) : UInt8
      self.set(alpha: value)
      value
    end

    # Alpha mode
    def am : UInt8
      UInt8.new!((@value >> 16) & 0x3_u32)
    end

    # Alpha mode
    def self.am : UInt8
      value.am
    end

    # Alpha mode
    def self.am=(value : UInt8) : UInt8
      self.set(am: value)
      value
    end

    # CLUT size
    def cs : UInt8
      UInt8.new!((@value >> 8) & 0xff_u32)
    end

    # CLUT size
    def self.cs : UInt8
      value.cs
    end

    # CLUT size
    def self.cs=(value : UInt8) : UInt8
      self.set(cs: value)
      value
    end

    # Start
    def start : Bool
      @value.bits_set?(0x20_u32)
    end

    # Start
    def self.start : Bool
      value.start
    end

    # Start
    def self.start=(value : Bool) : Bool
      self.set(start: value)
      value
    end

    # CLUT color mode
    def ccm : Bool
      @value.bits_set?(0x10_u32)
    end

    # CLUT color mode
    def self.ccm : Bool
      value.ccm
    end

    # CLUT color mode
    def self.ccm=(value : Bool) : Bool
      self.set(ccm: value)
      value
    end

    # Color mode
    def cm : UInt8
      UInt8.new!((@value >> 0) & 0xf_u32)
    end

    # Color mode
    def self.cm : UInt8
      value.cm
    end

    # Color mode
    def self.cm=(value : UInt8) : UInt8
      self.set(cm: value)
      value
    end

    def copy_with(
      *,

      alpha : UInt8? = nil,

      am : UInt8? = nil,

      cs : UInt8? = nil,

      start : Bool? = nil,

      ccm : Bool? = nil,

      cm : UInt8? = nil
    ) : self
      value = @value

      unless alpha.nil?
        value = (value & 0xffffff_u32) |
                UInt32.new!(alpha.to_int).&(0xff_u32) << 24
      end

      unless am.nil?
        value = (value & 0xfffcffff_u32) |
                UInt32.new!(am.to_int).&(0x3_u32) << 16
      end

      unless cs.nil?
        value = (value & 0xffff00ff_u32) |
                UInt32.new!(cs.to_int).&(0xff_u32) << 8
      end

      unless start.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(start.to_int).&(0x1_u32) << 5
      end

      unless ccm.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(ccm.to_int).&(0x1_u32) << 4
      end

      unless cm.nil?
        value = (value & 0xfffffff0_u32) |
                UInt32.new!(cm.to_int).&(0xf_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      alpha : UInt8? = nil,
      am : UInt8? = nil,
      cs : UInt8? = nil,
      start : Bool? = nil,
      ccm : Bool? = nil,
      cm : UInt8? = nil
    ) : Nil
      self.value = self.value.copy_with(
        alpha: alpha,
        am: am,
        cs: cs,
        start: start,
        ccm: ccm,
        cm: cm,
      )
    end
  end # struct

  # foreground color register
  struct FGCOLR
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

    # Red Value
    def red : UInt8
      UInt8.new!((@value >> 16) & 0xff_u32)
    end

    # Red Value
    def self.red : UInt8
      value.red
    end

    # Red Value
    def self.red=(value : UInt8) : UInt8
      self.set(red: value)
      value
    end

    # Green Value
    def green : UInt8
      UInt8.new!((@value >> 8) & 0xff_u32)
    end

    # Green Value
    def self.green : UInt8
      value.green
    end

    # Green Value
    def self.green=(value : UInt8) : UInt8
      self.set(green: value)
      value
    end

    # Blue Value
    def blue : UInt8
      UInt8.new!((@value >> 0) & 0xff_u32)
    end

    # Blue Value
    def self.blue : UInt8
      value.blue
    end

    # Blue Value
    def self.blue=(value : UInt8) : UInt8
      self.set(blue: value)
      value
    end

    def copy_with(
      *,

      red : UInt8? = nil,

      green : UInt8? = nil,

      blue : UInt8? = nil
    ) : self
      value = @value

      unless red.nil?
        value = (value & 0xff00ffff_u32) |
                UInt32.new!(red.to_int).&(0xff_u32) << 16
      end

      unless green.nil?
        value = (value & 0xffff00ff_u32) |
                UInt32.new!(green.to_int).&(0xff_u32) << 8
      end

      unless blue.nil?
        value = (value & 0xffffff00_u32) |
                UInt32.new!(blue.to_int).&(0xff_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      red : UInt8? = nil,
      green : UInt8? = nil,
      blue : UInt8? = nil
    ) : Nil
      self.value = self.value.copy_with(
        red: red,
        green: green,
        blue: blue,
      )
    end
  end # struct

  # background PFC control          register
  struct BGPFCCR
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

    # Alpha value
    def alpha : UInt8
      UInt8.new!((@value >> 24) & 0xff_u32)
    end

    # Alpha value
    def self.alpha : UInt8
      value.alpha
    end

    # Alpha value
    def self.alpha=(value : UInt8) : UInt8
      self.set(alpha: value)
      value
    end

    # Alpha mode
    def am : UInt8
      UInt8.new!((@value >> 16) & 0x3_u32)
    end

    # Alpha mode
    def self.am : UInt8
      value.am
    end

    # Alpha mode
    def self.am=(value : UInt8) : UInt8
      self.set(am: value)
      value
    end

    # CLUT size
    def cs : UInt8
      UInt8.new!((@value >> 8) & 0xff_u32)
    end

    # CLUT size
    def self.cs : UInt8
      value.cs
    end

    # CLUT size
    def self.cs=(value : UInt8) : UInt8
      self.set(cs: value)
      value
    end

    # Start
    def start : Bool
      @value.bits_set?(0x20_u32)
    end

    # Start
    def self.start : Bool
      value.start
    end

    # Start
    def self.start=(value : Bool) : Bool
      self.set(start: value)
      value
    end

    # CLUT Color mode
    def ccm : Bool
      @value.bits_set?(0x10_u32)
    end

    # CLUT Color mode
    def self.ccm : Bool
      value.ccm
    end

    # CLUT Color mode
    def self.ccm=(value : Bool) : Bool
      self.set(ccm: value)
      value
    end

    # Color mode
    def cm : UInt8
      UInt8.new!((@value >> 0) & 0xf_u32)
    end

    # Color mode
    def self.cm : UInt8
      value.cm
    end

    # Color mode
    def self.cm=(value : UInt8) : UInt8
      self.set(cm: value)
      value
    end

    def copy_with(
      *,

      alpha : UInt8? = nil,

      am : UInt8? = nil,

      cs : UInt8? = nil,

      start : Bool? = nil,

      ccm : Bool? = nil,

      cm : UInt8? = nil
    ) : self
      value = @value

      unless alpha.nil?
        value = (value & 0xffffff_u32) |
                UInt32.new!(alpha.to_int).&(0xff_u32) << 24
      end

      unless am.nil?
        value = (value & 0xfffcffff_u32) |
                UInt32.new!(am.to_int).&(0x3_u32) << 16
      end

      unless cs.nil?
        value = (value & 0xffff00ff_u32) |
                UInt32.new!(cs.to_int).&(0xff_u32) << 8
      end

      unless start.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(start.to_int).&(0x1_u32) << 5
      end

      unless ccm.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(ccm.to_int).&(0x1_u32) << 4
      end

      unless cm.nil?
        value = (value & 0xfffffff0_u32) |
                UInt32.new!(cm.to_int).&(0xf_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      alpha : UInt8? = nil,
      am : UInt8? = nil,
      cs : UInt8? = nil,
      start : Bool? = nil,
      ccm : Bool? = nil,
      cm : UInt8? = nil
    ) : Nil
      self.value = self.value.copy_with(
        alpha: alpha,
        am: am,
        cs: cs,
        start: start,
        ccm: ccm,
        cm: cm,
      )
    end
  end # struct

  # background color register
  struct BGCOLR
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

    # Red Value
    def red : UInt8
      UInt8.new!((@value >> 16) & 0xff_u32)
    end

    # Red Value
    def self.red : UInt8
      value.red
    end

    # Red Value
    def self.red=(value : UInt8) : UInt8
      self.set(red: value)
      value
    end

    # Green Value
    def green : UInt8
      UInt8.new!((@value >> 8) & 0xff_u32)
    end

    # Green Value
    def self.green : UInt8
      value.green
    end

    # Green Value
    def self.green=(value : UInt8) : UInt8
      self.set(green: value)
      value
    end

    # Blue Value
    def blue : UInt8
      UInt8.new!((@value >> 0) & 0xff_u32)
    end

    # Blue Value
    def self.blue : UInt8
      value.blue
    end

    # Blue Value
    def self.blue=(value : UInt8) : UInt8
      self.set(blue: value)
      value
    end

    def copy_with(
      *,

      red : UInt8? = nil,

      green : UInt8? = nil,

      blue : UInt8? = nil
    ) : self
      value = @value

      unless red.nil?
        value = (value & 0xff00ffff_u32) |
                UInt32.new!(red.to_int).&(0xff_u32) << 16
      end

      unless green.nil?
        value = (value & 0xffff00ff_u32) |
                UInt32.new!(green.to_int).&(0xff_u32) << 8
      end

      unless blue.nil?
        value = (value & 0xffffff00_u32) |
                UInt32.new!(blue.to_int).&(0xff_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      red : UInt8? = nil,
      green : UInt8? = nil,
      blue : UInt8? = nil
    ) : Nil
      self.value = self.value.copy_with(
        red: red,
        green: green,
        blue: blue,
      )
    end
  end # struct

  # foreground CLUT memory address          register
  struct FGCMAR
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

    # Memory Address
    def ma : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # Memory Address
    def self.ma : UInt32
      value.ma
    end

    # Memory Address
    def self.ma=(value : UInt32) : UInt32
      self.set(ma: value)
      value
    end

    def copy_with(
      *,

      ma : UInt32? = nil
    ) : self
      value = @value

      unless ma.nil?
        value = (value & 0xffffffff_u32) |
                UInt32.new!(ma.to_int).&(0x0_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      ma : UInt32? = nil
    ) : Nil
      self.value = self.value.copy_with(
        ma: ma,
      )
    end
  end # struct

  # background CLUT memory address          register
  struct BGCMAR
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

    # Memory address
    def ma : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # Memory address
    def self.ma : UInt32
      value.ma
    end

    # Memory address
    def self.ma=(value : UInt32) : UInt32
      self.set(ma: value)
      value
    end

    def copy_with(
      *,

      ma : UInt32? = nil
    ) : self
      value = @value

      unless ma.nil?
        value = (value & 0xffffffff_u32) |
                UInt32.new!(ma.to_int).&(0x0_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      ma : UInt32? = nil
    ) : Nil
      self.value = self.value.copy_with(
        ma: ma,
      )
    end
  end # struct

  # output PFC control register
  struct OPFCCR
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

    # Color mode
    def cm : UInt8
      UInt8.new!((@value >> 0) & 0x7_u32)
    end

    # Color mode
    def self.cm : UInt8
      value.cm
    end

    # Color mode
    def self.cm=(value : UInt8) : UInt8
      self.set(cm: value)
      value
    end

    def copy_with(
      *,

      cm : UInt8? = nil
    ) : self
      value = @value

      unless cm.nil?
        value = (value & 0xfffffff8_u32) |
                UInt32.new!(cm.to_int).&(0x7_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      cm : UInt8? = nil
    ) : Nil
      self.value = self.value.copy_with(
        cm: cm,
      )
    end
  end # struct

  # output color register
  struct OCOLR
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

    # Alpha Channel Value
    def aplha : UInt8
      UInt8.new!((@value >> 24) & 0xff_u32)
    end

    # Alpha Channel Value
    def self.aplha : UInt8
      value.aplha
    end

    # Alpha Channel Value
    def self.aplha=(value : UInt8) : UInt8
      self.set(aplha: value)
      value
    end

    # Red Value
    def red : UInt8
      UInt8.new!((@value >> 16) & 0xff_u32)
    end

    # Red Value
    def self.red : UInt8
      value.red
    end

    # Red Value
    def self.red=(value : UInt8) : UInt8
      self.set(red: value)
      value
    end

    # Green Value
    def green : UInt8
      UInt8.new!((@value >> 8) & 0xff_u32)
    end

    # Green Value
    def self.green : UInt8
      value.green
    end

    # Green Value
    def self.green=(value : UInt8) : UInt8
      self.set(green: value)
      value
    end

    # Blue Value
    def blue : UInt8
      UInt8.new!((@value >> 0) & 0xff_u32)
    end

    # Blue Value
    def self.blue : UInt8
      value.blue
    end

    # Blue Value
    def self.blue=(value : UInt8) : UInt8
      self.set(blue: value)
      value
    end

    def copy_with(
      *,

      aplha : UInt8? = nil,

      red : UInt8? = nil,

      green : UInt8? = nil,

      blue : UInt8? = nil
    ) : self
      value = @value

      unless aplha.nil?
        value = (value & 0xffffff_u32) |
                UInt32.new!(aplha.to_int).&(0xff_u32) << 24
      end

      unless red.nil?
        value = (value & 0xff00ffff_u32) |
                UInt32.new!(red.to_int).&(0xff_u32) << 16
      end

      unless green.nil?
        value = (value & 0xffff00ff_u32) |
                UInt32.new!(green.to_int).&(0xff_u32) << 8
      end

      unless blue.nil?
        value = (value & 0xffffff00_u32) |
                UInt32.new!(blue.to_int).&(0xff_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      aplha : UInt8? = nil,
      red : UInt8? = nil,
      green : UInt8? = nil,
      blue : UInt8? = nil
    ) : Nil
      self.value = self.value.copy_with(
        aplha: aplha,
        red: red,
        green: green,
        blue: blue,
      )
    end
  end # struct

  # output memory address register
  struct OMAR
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

    # Memory Address
    def ma : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # Memory Address
    def self.ma : UInt32
      value.ma
    end

    # Memory Address
    def self.ma=(value : UInt32) : UInt32
      self.set(ma: value)
      value
    end

    def copy_with(
      *,

      ma : UInt32? = nil
    ) : self
      value = @value

      unless ma.nil?
        value = (value & 0xffffffff_u32) |
                UInt32.new!(ma.to_int).&(0x0_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      ma : UInt32? = nil
    ) : Nil
      self.value = self.value.copy_with(
        ma: ma,
      )
    end
  end # struct

  # output offset register
  struct OOR
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

    # Line Offset
    def lo : UInt16
      UInt16.new!((@value >> 0) & 0x3fff_u32)
    end

    # Line Offset
    def self.lo : UInt16
      value.lo
    end

    # Line Offset
    def self.lo=(value : UInt16) : UInt16
      self.set(lo: value)
      value
    end

    def copy_with(
      *,

      lo : UInt16? = nil
    ) : self
      value = @value

      unless lo.nil?
        value = (value & 0xffffc000_u32) |
                UInt32.new!(lo.to_int).&(0x3fff_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      lo : UInt16? = nil
    ) : Nil
      self.value = self.value.copy_with(
        lo: lo,
      )
    end
  end # struct

  # number of line register
  struct NLR
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

    # Pixel per lines
    def pl : UInt16
      UInt16.new!((@value >> 16) & 0x3fff_u32)
    end

    # Pixel per lines
    def self.pl : UInt16
      value.pl
    end

    # Pixel per lines
    def self.pl=(value : UInt16) : UInt16
      self.set(pl: value)
      value
    end

    # Number of lines
    def nl : UInt16
      UInt16.new!((@value >> 0) & 0xffff_u32)
    end

    # Number of lines
    def self.nl : UInt16
      value.nl
    end

    # Number of lines
    def self.nl=(value : UInt16) : UInt16
      self.set(nl: value)
      value
    end

    def copy_with(
      *,

      pl : UInt16? = nil,

      nl : UInt16? = nil
    ) : self
      value = @value

      unless pl.nil?
        value = (value & 0xc000ffff_u32) |
                UInt32.new!(pl.to_int).&(0x3fff_u32) << 16
      end

      unless nl.nil?
        value = (value & 0xffff0000_u32) |
                UInt32.new!(nl.to_int).&(0xffff_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      pl : UInt16? = nil,
      nl : UInt16? = nil
    ) : Nil
      self.value = self.value.copy_with(
        pl: pl,
        nl: nl,
      )
    end
  end # struct

  # line watermark register
  struct LWR
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

    # Line watermark
    def lw : UInt16
      UInt16.new!((@value >> 0) & 0xffff_u32)
    end

    # Line watermark
    def self.lw : UInt16
      value.lw
    end

    # Line watermark
    def self.lw=(value : UInt16) : UInt16
      self.set(lw: value)
      value
    end

    def copy_with(
      *,

      lw : UInt16? = nil
    ) : self
      value = @value

      unless lw.nil?
        value = (value & 0xffff0000_u32) |
                UInt32.new!(lw.to_int).&(0xffff_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      lw : UInt16? = nil
    ) : Nil
      self.value = self.value.copy_with(
        lw: lw,
      )
    end
  end # struct

  # AHB master timer configuration          register
  struct AMTCR
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

    # Dead Time
    def dt : UInt8
      UInt8.new!((@value >> 8) & 0xff_u32)
    end

    # Dead Time
    def self.dt : UInt8
      value.dt
    end

    # Dead Time
    def self.dt=(value : UInt8) : UInt8
      self.set(dt: value)
      value
    end

    # Enable
    def en : Bool
      @value.bits_set?(0x1_u32)
    end

    # Enable
    def self.en : Bool
      value.en
    end

    # Enable
    def self.en=(value : Bool) : Bool
      self.set(en: value)
      value
    end

    def copy_with(
      *,

      dt : UInt8? = nil,

      en : Bool? = nil
    ) : self
      value = @value

      unless dt.nil?
        value = (value & 0xffff00ff_u32) |
                UInt32.new!(dt.to_int).&(0xff_u32) << 8
      end

      unless en.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(en.to_int).&(0x1_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      dt : UInt8? = nil,
      en : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        dt: dt,
        en: en,
      )
    end
  end # struct

  # FGCLUT
  struct FGCLUT
    ADDRESS = BASE_ADDRESS + 0x400_u64

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

    # APLHA
    def aplha : UInt8
      UInt8.new!((@value >> 24) & 0xff_u32)
    end

    # APLHA
    def self.aplha : UInt8
      value.aplha
    end

    # APLHA
    def self.aplha=(value : UInt8) : UInt8
      self.set(aplha: value)
      value
    end

    # RED
    def red : UInt8
      UInt8.new!((@value >> 16) & 0xff_u32)
    end

    # RED
    def self.red : UInt8
      value.red
    end

    # RED
    def self.red=(value : UInt8) : UInt8
      self.set(red: value)
      value
    end

    # GREEN
    def green : UInt8
      UInt8.new!((@value >> 8) & 0xff_u32)
    end

    # GREEN
    def self.green : UInt8
      value.green
    end

    # GREEN
    def self.green=(value : UInt8) : UInt8
      self.set(green: value)
      value
    end

    # BLUE
    def blue : UInt8
      UInt8.new!((@value >> 0) & 0xff_u32)
    end

    # BLUE
    def self.blue : UInt8
      value.blue
    end

    # BLUE
    def self.blue=(value : UInt8) : UInt8
      self.set(blue: value)
      value
    end

    def copy_with(
      *,

      aplha : UInt8? = nil,

      red : UInt8? = nil,

      green : UInt8? = nil,

      blue : UInt8? = nil
    ) : self
      value = @value

      unless aplha.nil?
        value = (value & 0xffffff_u32) |
                UInt32.new!(aplha.to_int).&(0xff_u32) << 24
      end

      unless red.nil?
        value = (value & 0xff00ffff_u32) |
                UInt32.new!(red.to_int).&(0xff_u32) << 16
      end

      unless green.nil?
        value = (value & 0xffff00ff_u32) |
                UInt32.new!(green.to_int).&(0xff_u32) << 8
      end

      unless blue.nil?
        value = (value & 0xffffff00_u32) |
                UInt32.new!(blue.to_int).&(0xff_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      aplha : UInt8? = nil,
      red : UInt8? = nil,
      green : UInt8? = nil,
      blue : UInt8? = nil
    ) : Nil
      self.value = self.value.copy_with(
        aplha: aplha,
        red: red,
        green: green,
        blue: blue,
      )
    end
  end # struct

  # BGCLUT
  struct BGCLUT
    ADDRESS = BASE_ADDRESS + 0x800_u64

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

    # APLHA
    def aplha : UInt8
      UInt8.new!((@value >> 24) & 0xff_u32)
    end

    # APLHA
    def self.aplha : UInt8
      value.aplha
    end

    # APLHA
    def self.aplha=(value : UInt8) : UInt8
      self.set(aplha: value)
      value
    end

    # RED
    def red : UInt8
      UInt8.new!((@value >> 16) & 0xff_u32)
    end

    # RED
    def self.red : UInt8
      value.red
    end

    # RED
    def self.red=(value : UInt8) : UInt8
      self.set(red: value)
      value
    end

    # GREEN
    def green : UInt8
      UInt8.new!((@value >> 8) & 0xff_u32)
    end

    # GREEN
    def self.green : UInt8
      value.green
    end

    # GREEN
    def self.green=(value : UInt8) : UInt8
      self.set(green: value)
      value
    end

    # BLUE
    def blue : UInt8
      UInt8.new!((@value >> 0) & 0xff_u32)
    end

    # BLUE
    def self.blue : UInt8
      value.blue
    end

    # BLUE
    def self.blue=(value : UInt8) : UInt8
      self.set(blue: value)
      value
    end

    def copy_with(
      *,

      aplha : UInt8? = nil,

      red : UInt8? = nil,

      green : UInt8? = nil,

      blue : UInt8? = nil
    ) : self
      value = @value

      unless aplha.nil?
        value = (value & 0xffffff_u32) |
                UInt32.new!(aplha.to_int).&(0xff_u32) << 24
      end

      unless red.nil?
        value = (value & 0xff00ffff_u32) |
                UInt32.new!(red.to_int).&(0xff_u32) << 16
      end

      unless green.nil?
        value = (value & 0xffff00ff_u32) |
                UInt32.new!(green.to_int).&(0xff_u32) << 8
      end

      unless blue.nil?
        value = (value & 0xffffff00_u32) |
                UInt32.new!(blue.to_int).&(0xff_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      aplha : UInt8? = nil,
      red : UInt8? = nil,
      green : UInt8? = nil,
      blue : UInt8? = nil
    ) : Nil
      self.value = self.value.copy_with(
        aplha: aplha,
        red: red,
        green: green,
        blue: blue,
      )
    end
  end # struct

end
