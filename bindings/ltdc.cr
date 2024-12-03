# LCD-TFT Controller
module LTDC
  VERSION      = nil
  BASE_ADDRESS = 0x40016800_u64

  # Synchronization Size Configuration          Register
  struct SSCR
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

    # Horizontal Synchronization Width (in              units of pixel clock period)
    def hsw : UInt16
      UInt16.new!((@value >> 16) & 0x3ff_u32)
    end

    # Horizontal Synchronization Width (in              units of pixel clock period)
    def self.hsw : UInt16
      value.hsw
    end

    # Horizontal Synchronization Width (in              units of pixel clock period)
    def self.hsw=(value : UInt16) : UInt16
      self.set(hsw: value)
      value
    end

    # Vertical Synchronization Height (in              units of horizontal scan line)
    def vsh : UInt16
      UInt16.new!((@value >> 0) & 0x7ff_u32)
    end

    # Vertical Synchronization Height (in              units of horizontal scan line)
    def self.vsh : UInt16
      value.vsh
    end

    # Vertical Synchronization Height (in              units of horizontal scan line)
    def self.vsh=(value : UInt16) : UInt16
      self.set(vsh: value)
      value
    end

    def copy_with(
      *,

      hsw : UInt16? = nil,

      vsh : UInt16? = nil
    ) : self
      value = @value

      unless hsw.nil?
        value = (value & 0xfc00ffff_u32) |
                UInt32.new!(hsw.to_int).&(0x3ff_u32) << 16
      end

      unless vsh.nil?
        value = (value & 0xfffff800_u32) |
                UInt32.new!(vsh.to_int).&(0x7ff_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      hsw : UInt16? = nil,
      vsh : UInt16? = nil
    ) : Nil
      self.value = self.value.copy_with(
        hsw: hsw,
        vsh: vsh,
      )
    end
  end # struct

  # Back Porch Configuration          Register
  struct BPCR
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

    # Accumulated Horizontal back porch (in              units of pixel clock period)
    def ahbp : UInt16
      UInt16.new!((@value >> 16) & 0x3ff_u32)
    end

    # Accumulated Horizontal back porch (in              units of pixel clock period)
    def self.ahbp : UInt16
      value.ahbp
    end

    # Accumulated Horizontal back porch (in              units of pixel clock period)
    def self.ahbp=(value : UInt16) : UInt16
      self.set(ahbp: value)
      value
    end

    # Accumulated Vertical back porch (in              units of horizontal scan line)
    def avbp : UInt16
      UInt16.new!((@value >> 0) & 0x7ff_u32)
    end

    # Accumulated Vertical back porch (in              units of horizontal scan line)
    def self.avbp : UInt16
      value.avbp
    end

    # Accumulated Vertical back porch (in              units of horizontal scan line)
    def self.avbp=(value : UInt16) : UInt16
      self.set(avbp: value)
      value
    end

    def copy_with(
      *,

      ahbp : UInt16? = nil,

      avbp : UInt16? = nil
    ) : self
      value = @value

      unless ahbp.nil?
        value = (value & 0xfc00ffff_u32) |
                UInt32.new!(ahbp.to_int).&(0x3ff_u32) << 16
      end

      unless avbp.nil?
        value = (value & 0xfffff800_u32) |
                UInt32.new!(avbp.to_int).&(0x7ff_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      ahbp : UInt16? = nil,
      avbp : UInt16? = nil
    ) : Nil
      self.value = self.value.copy_with(
        ahbp: ahbp,
        avbp: avbp,
      )
    end
  end # struct

  # Active Width Configuration          Register
  struct AWCR
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

    # AAV
    def aav : UInt16
      UInt16.new!((@value >> 16) & 0x3ff_u32)
    end

    # AAV
    def self.aav : UInt16
      value.aav
    end

    # AAV
    def self.aav=(value : UInt16) : UInt16
      self.set(aav: value)
      value
    end

    # Accumulated Active Height (in units of              horizontal scan line)
    def aah : UInt16
      UInt16.new!((@value >> 0) & 0x7ff_u32)
    end

    # Accumulated Active Height (in units of              horizontal scan line)
    def self.aah : UInt16
      value.aah
    end

    # Accumulated Active Height (in units of              horizontal scan line)
    def self.aah=(value : UInt16) : UInt16
      self.set(aah: value)
      value
    end

    def copy_with(
      *,

      aav : UInt16? = nil,

      aah : UInt16? = nil
    ) : self
      value = @value

      unless aav.nil?
        value = (value & 0xfc00ffff_u32) |
                UInt32.new!(aav.to_int).&(0x3ff_u32) << 16
      end

      unless aah.nil?
        value = (value & 0xfffff800_u32) |
                UInt32.new!(aah.to_int).&(0x7ff_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      aav : UInt16? = nil,
      aah : UInt16? = nil
    ) : Nil
      self.value = self.value.copy_with(
        aav: aav,
        aah: aah,
      )
    end
  end # struct

  # Total Width Configuration          Register
  struct TWCR
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

    # Total Width (in units of pixel clock              period)
    def totalw : UInt16
      UInt16.new!((@value >> 16) & 0x3ff_u32)
    end

    # Total Width (in units of pixel clock              period)
    def self.totalw : UInt16
      value.totalw
    end

    # Total Width (in units of pixel clock              period)
    def self.totalw=(value : UInt16) : UInt16
      self.set(totalw: value)
      value
    end

    # Total Height (in units of horizontal              scan line)
    def totalh : UInt16
      UInt16.new!((@value >> 0) & 0x7ff_u32)
    end

    # Total Height (in units of horizontal              scan line)
    def self.totalh : UInt16
      value.totalh
    end

    # Total Height (in units of horizontal              scan line)
    def self.totalh=(value : UInt16) : UInt16
      self.set(totalh: value)
      value
    end

    def copy_with(
      *,

      totalw : UInt16? = nil,

      totalh : UInt16? = nil
    ) : self
      value = @value

      unless totalw.nil?
        value = (value & 0xfc00ffff_u32) |
                UInt32.new!(totalw.to_int).&(0x3ff_u32) << 16
      end

      unless totalh.nil?
        value = (value & 0xfffff800_u32) |
                UInt32.new!(totalh.to_int).&(0x7ff_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      totalw : UInt16? = nil,
      totalh : UInt16? = nil
    ) : Nil
      self.value = self.value.copy_with(
        totalw: totalw,
        totalh: totalh,
      )
    end
  end # struct

  # Global Control Register
  struct GCR
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
      new(0x2220_u64)
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

    # Horizontal Synchronization              Polarity
    def hspol : Bool
      @value.bits_set?(0x80000000_u32)
    end

    # Horizontal Synchronization              Polarity
    def self.hspol : Bool
      value.hspol
    end

    # Horizontal Synchronization              Polarity
    def self.hspol=(value : Bool) : Bool
      self.set(hspol: value)
      value
    end

    # Vertical Synchronization              Polarity
    def vspol : Bool
      @value.bits_set?(0x40000000_u32)
    end

    # Vertical Synchronization              Polarity
    def self.vspol : Bool
      value.vspol
    end

    # Vertical Synchronization              Polarity
    def self.vspol=(value : Bool) : Bool
      self.set(vspol: value)
      value
    end

    # Data Enable Polarity
    def depol : Bool
      @value.bits_set?(0x20000000_u32)
    end

    # Data Enable Polarity
    def self.depol : Bool
      value.depol
    end

    # Data Enable Polarity
    def self.depol=(value : Bool) : Bool
      self.set(depol: value)
      value
    end

    # Pixel Clock Polarity
    def pcpol : Bool
      @value.bits_set?(0x10000000_u32)
    end

    # Pixel Clock Polarity
    def self.pcpol : Bool
      value.pcpol
    end

    # Pixel Clock Polarity
    def self.pcpol=(value : Bool) : Bool
      self.set(pcpol: value)
      value
    end

    # Dither Enable
    def den : Bool
      @value.bits_set?(0x10000_u32)
    end

    # Dither Enable
    def self.den : Bool
      value.den
    end

    # Dither Enable
    def self.den=(value : Bool) : Bool
      self.set(den: value)
      value
    end

    # Dither Red Width
    def drw : UInt8
      UInt8.new!((@value >> 12) & 0x7_u32)
    end

    # Dither Red Width
    def self.drw : UInt8
      value.drw
    end

    # Dither Green Width
    def dgw : UInt8
      UInt8.new!((@value >> 8) & 0x7_u32)
    end

    # Dither Green Width
    def self.dgw : UInt8
      value.dgw
    end

    # Dither Blue Width
    def dbw : UInt8
      UInt8.new!((@value >> 4) & 0x7_u32)
    end

    # Dither Blue Width
    def self.dbw : UInt8
      value.dbw
    end

    # LCD-TFT controller enable              bit
    def en : Bool
      @value.bits_set?(0x1_u32)
    end

    # LCD-TFT controller enable              bit
    def self.en : Bool
      value.en
    end

    # LCD-TFT controller enable              bit
    def self.en=(value : Bool) : Bool
      self.set(en: value)
      value
    end

    def copy_with(
      *,

      hspol : Bool? = nil,

      vspol : Bool? = nil,

      depol : Bool? = nil,

      pcpol : Bool? = nil,

      den : Bool? = nil,

      en : Bool? = nil
    ) : self
      value = @value

      unless hspol.nil?
        value = (value & 0x7fffffff_u32) |
                UInt32.new!(hspol.to_int).&(0x1_u32) << 31
      end

      unless vspol.nil?
        value = (value & 0xbfffffff_u32) |
                UInt32.new!(vspol.to_int).&(0x1_u32) << 30
      end

      unless depol.nil?
        value = (value & 0xdfffffff_u32) |
                UInt32.new!(depol.to_int).&(0x1_u32) << 29
      end

      unless pcpol.nil?
        value = (value & 0xefffffff_u32) |
                UInt32.new!(pcpol.to_int).&(0x1_u32) << 28
      end

      unless den.nil?
        value = (value & 0xfffeffff_u32) |
                UInt32.new!(den.to_int).&(0x1_u32) << 16
      end

      unless en.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(en.to_int).&(0x1_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      hspol : Bool? = nil,
      vspol : Bool? = nil,
      depol : Bool? = nil,
      pcpol : Bool? = nil,
      den : Bool? = nil,
      en : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        hspol: hspol,
        vspol: vspol,
        depol: depol,
        pcpol: pcpol,
        den: den,
        en: en,
      )
    end
  end # struct

  # Shadow Reload Configuration          Register
  struct SRCR
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

    # Vertical Blanking Reload
    def vbr : Bool
      @value.bits_set?(0x2_u32)
    end

    # Vertical Blanking Reload
    def self.vbr : Bool
      value.vbr
    end

    # Vertical Blanking Reload
    def self.vbr=(value : Bool) : Bool
      self.set(vbr: value)
      value
    end

    # Immediate Reload
    def imr : Bool
      @value.bits_set?(0x1_u32)
    end

    # Immediate Reload
    def self.imr : Bool
      value.imr
    end

    # Immediate Reload
    def self.imr=(value : Bool) : Bool
      self.set(imr: value)
      value
    end

    def copy_with(
      *,

      vbr : Bool? = nil,

      imr : Bool? = nil
    ) : self
      value = @value

      unless vbr.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(vbr.to_int).&(0x1_u32) << 1
      end

      unless imr.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(imr.to_int).&(0x1_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      vbr : Bool? = nil,
      imr : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        vbr: vbr,
        imr: imr,
      )
    end
  end # struct

  # Background Color Configuration          Register
  struct BCCR
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

    # Background Color Red value
    def bc : UInt32
      UInt32.new!((@value >> 0) & 0xffffff_u32)
    end

    # Background Color Red value
    def self.bc : UInt32
      value.bc
    end

    # Background Color Red value
    def self.bc=(value : UInt32) : UInt32
      self.set(bc: value)
      value
    end

    def copy_with(
      *,

      bc : UInt32? = nil
    ) : self
      value = @value

      unless bc.nil?
        value = (value & 0xff000000_u32) |
                UInt32.new!(bc.to_int).&(0xffffff_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      bc : UInt32? = nil
    ) : Nil
      self.value = self.value.copy_with(
        bc: bc,
      )
    end
  end # struct

  # Interrupt Enable Register
  struct IER
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

    # Register Reload interrupt              enable
    def rrie : Bool
      @value.bits_set?(0x8_u32)
    end

    # Register Reload interrupt              enable
    def self.rrie : Bool
      value.rrie
    end

    # Register Reload interrupt              enable
    def self.rrie=(value : Bool) : Bool
      self.set(rrie: value)
      value
    end

    # Transfer Error Interrupt              Enable
    def terrie : Bool
      @value.bits_set?(0x4_u32)
    end

    # Transfer Error Interrupt              Enable
    def self.terrie : Bool
      value.terrie
    end

    # Transfer Error Interrupt              Enable
    def self.terrie=(value : Bool) : Bool
      self.set(terrie: value)
      value
    end

    # FIFO Underrun Interrupt              Enable
    def fuie : Bool
      @value.bits_set?(0x2_u32)
    end

    # FIFO Underrun Interrupt              Enable
    def self.fuie : Bool
      value.fuie
    end

    # FIFO Underrun Interrupt              Enable
    def self.fuie=(value : Bool) : Bool
      self.set(fuie: value)
      value
    end

    # Line Interrupt Enable
    def lie : Bool
      @value.bits_set?(0x1_u32)
    end

    # Line Interrupt Enable
    def self.lie : Bool
      value.lie
    end

    # Line Interrupt Enable
    def self.lie=(value : Bool) : Bool
      self.set(lie: value)
      value
    end

    def copy_with(
      *,

      rrie : Bool? = nil,

      terrie : Bool? = nil,

      fuie : Bool? = nil,

      lie : Bool? = nil
    ) : self
      value = @value

      unless rrie.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(rrie.to_int).&(0x1_u32) << 3
      end

      unless terrie.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(terrie.to_int).&(0x1_u32) << 2
      end

      unless fuie.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(fuie.to_int).&(0x1_u32) << 1
      end

      unless lie.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(lie.to_int).&(0x1_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      rrie : Bool? = nil,
      terrie : Bool? = nil,
      fuie : Bool? = nil,
      lie : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        rrie: rrie,
        terrie: terrie,
        fuie: fuie,
        lie: lie,
      )
    end
  end # struct

  # Interrupt Status Register
  struct ISR
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

    # Register Reload Interrupt              Flag
    def rrif : Bool
      @value.bits_set?(0x8_u32)
    end

    # Register Reload Interrupt              Flag
    def self.rrif : Bool
      value.rrif
    end

    # Transfer Error interrupt              flag
    def terrif : Bool
      @value.bits_set?(0x4_u32)
    end

    # Transfer Error interrupt              flag
    def self.terrif : Bool
      value.terrif
    end

    # FIFO Underrun Interrupt              flag
    def fuif : Bool
      @value.bits_set?(0x2_u32)
    end

    # FIFO Underrun Interrupt              flag
    def self.fuif : Bool
      value.fuif
    end

    # Line Interrupt flag
    def lif : Bool
      @value.bits_set?(0x1_u32)
    end

    # Line Interrupt flag
    def self.lif : Bool
      value.lif
    end
  end # struct

  # Interrupt Clear Register
  struct ICR
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

    # Clears Register Reload Interrupt              Flag
    def self.crrif=(value : Bool) : Bool
      self.set(crrif: value)
      value
    end

    # Clears the Transfer Error Interrupt              Flag
    def self.cterrif=(value : Bool) : Bool
      self.set(cterrif: value)
      value
    end

    # Clears the FIFO Underrun Interrupt              flag
    def self.cfuif=(value : Bool) : Bool
      self.set(cfuif: value)
      value
    end

    # Clears the Line Interrupt              Flag
    def self.clif=(value : Bool) : Bool
      self.set(clif: value)
      value
    end

    def copy_with(
      *,

      crrif : Bool? = nil,

      cterrif : Bool? = nil,

      cfuif : Bool? = nil,

      clif : Bool? = nil
    ) : self
      value = @value

      unless crrif.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(crrif.to_int).&(0x1_u32) << 3
      end

      unless cterrif.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(cterrif.to_int).&(0x1_u32) << 2
      end

      unless cfuif.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(cfuif.to_int).&(0x1_u32) << 1
      end

      unless clif.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(clif.to_int).&(0x1_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      crrif : Bool? = nil,
      cterrif : Bool? = nil,
      cfuif : Bool? = nil,
      clif : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        crrif: crrif,
        cterrif: cterrif,
        cfuif: cfuif,
        clif: clif,
      )
    end
  end # struct

  # Line Interrupt Position Configuration          Register
  struct LIPCR
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

    # Line Interrupt Position
    def lipos : UInt16
      UInt16.new!((@value >> 0) & 0x7ff_u32)
    end

    # Line Interrupt Position
    def self.lipos : UInt16
      value.lipos
    end

    # Line Interrupt Position
    def self.lipos=(value : UInt16) : UInt16
      self.set(lipos: value)
      value
    end

    def copy_with(
      *,

      lipos : UInt16? = nil
    ) : self
      value = @value

      unless lipos.nil?
        value = (value & 0xfffff800_u32) |
                UInt32.new!(lipos.to_int).&(0x7ff_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      lipos : UInt16? = nil
    ) : Nil
      self.value = self.value.copy_with(
        lipos: lipos,
      )
    end
  end # struct

  # Current Position Status          Register
  struct CPSR
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

    # Current X Position
    def cxpos : UInt16
      UInt16.new!((@value >> 16) & 0xffff_u32)
    end

    # Current X Position
    def self.cxpos : UInt16
      value.cxpos
    end

    # Current Y Position
    def cypos : UInt16
      UInt16.new!((@value >> 0) & 0xffff_u32)
    end

    # Current Y Position
    def self.cypos : UInt16
      value.cypos
    end
  end # struct

  # Current Display Status          Register
  struct CDSR
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
      new(0xf_u64)
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

    # Horizontal Synchronization display              Status
    def hsyncs : Bool
      @value.bits_set?(0x8_u32)
    end

    # Horizontal Synchronization display              Status
    def self.hsyncs : Bool
      value.hsyncs
    end

    # Vertical Synchronization display              Status
    def vsyncs : Bool
      @value.bits_set?(0x4_u32)
    end

    # Vertical Synchronization display              Status
    def self.vsyncs : Bool
      value.vsyncs
    end

    # Horizontal Data Enable display              Status
    def hdes : Bool
      @value.bits_set?(0x2_u32)
    end

    # Horizontal Data Enable display              Status
    def self.hdes : Bool
      value.hdes
    end

    # Vertical Data Enable display              Status
    def vdes : Bool
      @value.bits_set?(0x1_u32)
    end

    # Vertical Data Enable display              Status
    def self.vdes : Bool
      value.vdes
    end
  end # struct

  # Layerx Control Register
  struct L1CR
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

    # Color Look-Up Table Enable
    def cluten : Bool
      @value.bits_set?(0x10_u32)
    end

    # Color Look-Up Table Enable
    def self.cluten : Bool
      value.cluten
    end

    # Color Look-Up Table Enable
    def self.cluten=(value : Bool) : Bool
      self.set(cluten: value)
      value
    end

    # Color Keying Enable
    def colken : Bool
      @value.bits_set?(0x2_u32)
    end

    # Color Keying Enable
    def self.colken : Bool
      value.colken
    end

    # Color Keying Enable
    def self.colken=(value : Bool) : Bool
      self.set(colken: value)
      value
    end

    # Layer Enable
    def len : Bool
      @value.bits_set?(0x1_u32)
    end

    # Layer Enable
    def self.len : Bool
      value.len
    end

    # Layer Enable
    def self.len=(value : Bool) : Bool
      self.set(len: value)
      value
    end

    def copy_with(
      *,

      cluten : Bool? = nil,

      colken : Bool? = nil,

      len : Bool? = nil
    ) : self
      value = @value

      unless cluten.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(cluten.to_int).&(0x1_u32) << 4
      end

      unless colken.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(colken.to_int).&(0x1_u32) << 1
      end

      unless len.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(len.to_int).&(0x1_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      cluten : Bool? = nil,
      colken : Bool? = nil,
      len : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        cluten: cluten,
        colken: colken,
        len: len,
      )
    end
  end # struct

  # Layerx Window Horizontal Position          Configuration Register
  struct L1WHPCR
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

    # Window Horizontal Stop              Position
    def whsppos : UInt16
      UInt16.new!((@value >> 16) & 0xfff_u32)
    end

    # Window Horizontal Stop              Position
    def self.whsppos : UInt16
      value.whsppos
    end

    # Window Horizontal Stop              Position
    def self.whsppos=(value : UInt16) : UInt16
      self.set(whsppos: value)
      value
    end

    # Window Horizontal Start              Position
    def whstpos : UInt16
      UInt16.new!((@value >> 0) & 0xfff_u32)
    end

    # Window Horizontal Start              Position
    def self.whstpos : UInt16
      value.whstpos
    end

    # Window Horizontal Start              Position
    def self.whstpos=(value : UInt16) : UInt16
      self.set(whstpos: value)
      value
    end

    def copy_with(
      *,

      whsppos : UInt16? = nil,

      whstpos : UInt16? = nil
    ) : self
      value = @value

      unless whsppos.nil?
        value = (value & 0xf000ffff_u32) |
                UInt32.new!(whsppos.to_int).&(0xfff_u32) << 16
      end

      unless whstpos.nil?
        value = (value & 0xfffff000_u32) |
                UInt32.new!(whstpos.to_int).&(0xfff_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      whsppos : UInt16? = nil,
      whstpos : UInt16? = nil
    ) : Nil
      self.value = self.value.copy_with(
        whsppos: whsppos,
        whstpos: whstpos,
      )
    end
  end # struct

  # Layerx Window Vertical Position          Configuration Register
  struct L1WVPCR
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

    # Window Vertical Stop              Position
    def wvsppos : UInt16
      UInt16.new!((@value >> 16) & 0x7ff_u32)
    end

    # Window Vertical Stop              Position
    def self.wvsppos : UInt16
      value.wvsppos
    end

    # Window Vertical Stop              Position
    def self.wvsppos=(value : UInt16) : UInt16
      self.set(wvsppos: value)
      value
    end

    # Window Vertical Start              Position
    def wvstpos : UInt16
      UInt16.new!((@value >> 0) & 0x7ff_u32)
    end

    # Window Vertical Start              Position
    def self.wvstpos : UInt16
      value.wvstpos
    end

    # Window Vertical Start              Position
    def self.wvstpos=(value : UInt16) : UInt16
      self.set(wvstpos: value)
      value
    end

    def copy_with(
      *,

      wvsppos : UInt16? = nil,

      wvstpos : UInt16? = nil
    ) : self
      value = @value

      unless wvsppos.nil?
        value = (value & 0xf800ffff_u32) |
                UInt32.new!(wvsppos.to_int).&(0x7ff_u32) << 16
      end

      unless wvstpos.nil?
        value = (value & 0xfffff800_u32) |
                UInt32.new!(wvstpos.to_int).&(0x7ff_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      wvsppos : UInt16? = nil,
      wvstpos : UInt16? = nil
    ) : Nil
      self.value = self.value.copy_with(
        wvsppos: wvsppos,
        wvstpos: wvstpos,
      )
    end
  end # struct

  # Layerx Color Keying Configuration          Register
  struct L1CKCR
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

    # Color Key Red value
    def ckred : UInt8
      UInt8.new!((@value >> 16) & 0xff_u32)
    end

    # Color Key Red value
    def self.ckred : UInt8
      value.ckred
    end

    # Color Key Red value
    def self.ckred=(value : UInt8) : UInt8
      self.set(ckred: value)
      value
    end

    # Color Key Green value
    def ckgreen : UInt8
      UInt8.new!((@value >> 8) & 0xff_u32)
    end

    # Color Key Green value
    def self.ckgreen : UInt8
      value.ckgreen
    end

    # Color Key Green value
    def self.ckgreen=(value : UInt8) : UInt8
      self.set(ckgreen: value)
      value
    end

    # Color Key Blue value
    def ckblue : UInt8
      UInt8.new!((@value >> 0) & 0xff_u32)
    end

    # Color Key Blue value
    def self.ckblue : UInt8
      value.ckblue
    end

    # Color Key Blue value
    def self.ckblue=(value : UInt8) : UInt8
      self.set(ckblue: value)
      value
    end

    def copy_with(
      *,

      ckred : UInt8? = nil,

      ckgreen : UInt8? = nil,

      ckblue : UInt8? = nil
    ) : self
      value = @value

      unless ckred.nil?
        value = (value & 0xff00ffff_u32) |
                UInt32.new!(ckred.to_int).&(0xff_u32) << 16
      end

      unless ckgreen.nil?
        value = (value & 0xffff00ff_u32) |
                UInt32.new!(ckgreen.to_int).&(0xff_u32) << 8
      end

      unless ckblue.nil?
        value = (value & 0xffffff00_u32) |
                UInt32.new!(ckblue.to_int).&(0xff_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      ckred : UInt8? = nil,
      ckgreen : UInt8? = nil,
      ckblue : UInt8? = nil
    ) : Nil
      self.value = self.value.copy_with(
        ckred: ckred,
        ckgreen: ckgreen,
        ckblue: ckblue,
      )
    end
  end # struct

  # Layerx Pixel Format Configuration          Register
  struct L1PFCR
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

    # Pixel Format
    def pf : UInt8
      UInt8.new!((@value >> 0) & 0x7_u32)
    end

    # Pixel Format
    def self.pf : UInt8
      value.pf
    end

    # Pixel Format
    def self.pf=(value : UInt8) : UInt8
      self.set(pf: value)
      value
    end

    def copy_with(
      *,

      pf : UInt8? = nil
    ) : self
      value = @value

      unless pf.nil?
        value = (value & 0xfffffff8_u32) |
                UInt32.new!(pf.to_int).&(0x7_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      pf : UInt8? = nil
    ) : Nil
      self.value = self.value.copy_with(
        pf: pf,
      )
    end
  end # struct

  # Layerx Constant Alpha Configuration          Register
  struct L1CACR
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

    # Constant Alpha
    def consta : UInt8
      UInt8.new!((@value >> 0) & 0xff_u32)
    end

    # Constant Alpha
    def self.consta : UInt8
      value.consta
    end

    # Constant Alpha
    def self.consta=(value : UInt8) : UInt8
      self.set(consta: value)
      value
    end

    def copy_with(
      *,

      consta : UInt8? = nil
    ) : self
      value = @value

      unless consta.nil?
        value = (value & 0xffffff00_u32) |
                UInt32.new!(consta.to_int).&(0xff_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      consta : UInt8? = nil
    ) : Nil
      self.value = self.value.copy_with(
        consta: consta,
      )
    end
  end # struct

  # Layerx Default Color Configuration          Register
  struct L1DCCR
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

    # Default Color Alpha
    def dcalpha : UInt8
      UInt8.new!((@value >> 24) & 0xff_u32)
    end

    # Default Color Alpha
    def self.dcalpha : UInt8
      value.dcalpha
    end

    # Default Color Alpha
    def self.dcalpha=(value : UInt8) : UInt8
      self.set(dcalpha: value)
      value
    end

    # Default Color Red
    def dcred : UInt8
      UInt8.new!((@value >> 16) & 0xff_u32)
    end

    # Default Color Red
    def self.dcred : UInt8
      value.dcred
    end

    # Default Color Red
    def self.dcred=(value : UInt8) : UInt8
      self.set(dcred: value)
      value
    end

    # Default Color Green
    def dcgreen : UInt8
      UInt8.new!((@value >> 8) & 0xff_u32)
    end

    # Default Color Green
    def self.dcgreen : UInt8
      value.dcgreen
    end

    # Default Color Green
    def self.dcgreen=(value : UInt8) : UInt8
      self.set(dcgreen: value)
      value
    end

    # Default Color Blue
    def dcblue : UInt8
      UInt8.new!((@value >> 0) & 0xff_u32)
    end

    # Default Color Blue
    def self.dcblue : UInt8
      value.dcblue
    end

    # Default Color Blue
    def self.dcblue=(value : UInt8) : UInt8
      self.set(dcblue: value)
      value
    end

    def copy_with(
      *,

      dcalpha : UInt8? = nil,

      dcred : UInt8? = nil,

      dcgreen : UInt8? = nil,

      dcblue : UInt8? = nil
    ) : self
      value = @value

      unless dcalpha.nil?
        value = (value & 0xffffff_u32) |
                UInt32.new!(dcalpha.to_int).&(0xff_u32) << 24
      end

      unless dcred.nil?
        value = (value & 0xff00ffff_u32) |
                UInt32.new!(dcred.to_int).&(0xff_u32) << 16
      end

      unless dcgreen.nil?
        value = (value & 0xffff00ff_u32) |
                UInt32.new!(dcgreen.to_int).&(0xff_u32) << 8
      end

      unless dcblue.nil?
        value = (value & 0xffffff00_u32) |
                UInt32.new!(dcblue.to_int).&(0xff_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      dcalpha : UInt8? = nil,
      dcred : UInt8? = nil,
      dcgreen : UInt8? = nil,
      dcblue : UInt8? = nil
    ) : Nil
      self.value = self.value.copy_with(
        dcalpha: dcalpha,
        dcred: dcred,
        dcgreen: dcgreen,
        dcblue: dcblue,
      )
    end
  end # struct

  # Layerx Blending Factors Configuration          Register
  struct L1BFCR
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
      new(0x607_u64)
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

    # Blending Factor 1
    def bf1 : UInt8
      UInt8.new!((@value >> 8) & 0x7_u32)
    end

    # Blending Factor 1
    def self.bf1 : UInt8
      value.bf1
    end

    # Blending Factor 1
    def self.bf1=(value : UInt8) : UInt8
      self.set(bf1: value)
      value
    end

    # Blending Factor 2
    def bf2 : UInt8
      UInt8.new!((@value >> 0) & 0x7_u32)
    end

    # Blending Factor 2
    def self.bf2 : UInt8
      value.bf2
    end

    # Blending Factor 2
    def self.bf2=(value : UInt8) : UInt8
      self.set(bf2: value)
      value
    end

    def copy_with(
      *,

      bf1 : UInt8? = nil,

      bf2 : UInt8? = nil
    ) : self
      value = @value

      unless bf1.nil?
        value = (value & 0xfffff8ff_u32) |
                UInt32.new!(bf1.to_int).&(0x7_u32) << 8
      end

      unless bf2.nil?
        value = (value & 0xfffffff8_u32) |
                UInt32.new!(bf2.to_int).&(0x7_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      bf1 : UInt8? = nil,
      bf2 : UInt8? = nil
    ) : Nil
      self.value = self.value.copy_with(
        bf1: bf1,
        bf2: bf2,
      )
    end
  end # struct

  # Layerx Color Frame Buffer Address          Register
  struct L1CFBAR
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

    # Color Frame Buffer Start              Address
    def cfbadd : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # Color Frame Buffer Start              Address
    def self.cfbadd : UInt32
      value.cfbadd
    end

    # Color Frame Buffer Start              Address
    def self.cfbadd=(value : UInt32) : UInt32
      self.set(cfbadd: value)
      value
    end

    def copy_with(
      *,

      cfbadd : UInt32? = nil
    ) : self
      value = @value

      unless cfbadd.nil?
        value = (value & 0xffffffff_u32) |
                UInt32.new!(cfbadd.to_int).&(0x0_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      cfbadd : UInt32? = nil
    ) : Nil
      self.value = self.value.copy_with(
        cfbadd: cfbadd,
      )
    end
  end # struct

  # Layerx Color Frame Buffer Length          Register
  struct L1CFBLR
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

    # Color Frame Buffer Pitch in              bytes
    def cfbp : UInt16
      UInt16.new!((@value >> 16) & 0x1fff_u32)
    end

    # Color Frame Buffer Pitch in              bytes
    def self.cfbp : UInt16
      value.cfbp
    end

    # Color Frame Buffer Pitch in              bytes
    def self.cfbp=(value : UInt16) : UInt16
      self.set(cfbp: value)
      value
    end

    # Color Frame Buffer Line              Length
    def cfbll : UInt16
      UInt16.new!((@value >> 0) & 0x1fff_u32)
    end

    # Color Frame Buffer Line              Length
    def self.cfbll : UInt16
      value.cfbll
    end

    # Color Frame Buffer Line              Length
    def self.cfbll=(value : UInt16) : UInt16
      self.set(cfbll: value)
      value
    end

    def copy_with(
      *,

      cfbp : UInt16? = nil,

      cfbll : UInt16? = nil
    ) : self
      value = @value

      unless cfbp.nil?
        value = (value & 0xe000ffff_u32) |
                UInt32.new!(cfbp.to_int).&(0x1fff_u32) << 16
      end

      unless cfbll.nil?
        value = (value & 0xffffe000_u32) |
                UInt32.new!(cfbll.to_int).&(0x1fff_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      cfbp : UInt16? = nil,
      cfbll : UInt16? = nil
    ) : Nil
      self.value = self.value.copy_with(
        cfbp: cfbp,
        cfbll: cfbll,
      )
    end
  end # struct

  # Layerx ColorFrame Buffer Line Number          Register
  struct L1CFBLNR
    ADDRESS = BASE_ADDRESS + 0xb4_u64

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

    # Frame Buffer Line Number
    def cfblnbr : UInt16
      UInt16.new!((@value >> 0) & 0x7ff_u32)
    end

    # Frame Buffer Line Number
    def self.cfblnbr : UInt16
      value.cfblnbr
    end

    # Frame Buffer Line Number
    def self.cfblnbr=(value : UInt16) : UInt16
      self.set(cfblnbr: value)
      value
    end

    def copy_with(
      *,

      cfblnbr : UInt16? = nil
    ) : self
      value = @value

      unless cfblnbr.nil?
        value = (value & 0xfffff800_u32) |
                UInt32.new!(cfblnbr.to_int).&(0x7ff_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      cfblnbr : UInt16? = nil
    ) : Nil
      self.value = self.value.copy_with(
        cfblnbr: cfblnbr,
      )
    end
  end # struct

  # Layerx CLUT Write Register
  struct L1CLUTWR
    ADDRESS = BASE_ADDRESS + 0xc4_u64

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

    # CLUT Address
    def self.clutadd=(value : UInt8) : UInt8
      self.set(clutadd: value)
      value
    end

    # Red value
    def self.red=(value : UInt8) : UInt8
      self.set(red: value)
      value
    end

    # Green value
    def self.green=(value : UInt8) : UInt8
      self.set(green: value)
      value
    end

    # Blue value
    def self.blue=(value : UInt8) : UInt8
      self.set(blue: value)
      value
    end

    def copy_with(
      *,

      clutadd : UInt8? = nil,

      red : UInt8? = nil,

      green : UInt8? = nil,

      blue : UInt8? = nil
    ) : self
      value = @value

      unless clutadd.nil?
        value = (value & 0xffffff_u32) |
                UInt32.new!(clutadd.to_int).&(0xff_u32) << 24
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
      clutadd : UInt8? = nil,
      red : UInt8? = nil,
      green : UInt8? = nil,
      blue : UInt8? = nil
    ) : Nil
      self.value = self.value.copy_with(
        clutadd: clutadd,
        red: red,
        green: green,
        blue: blue,
      )
    end
  end # struct

  # Layerx Control Register
  struct L2CR
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

    # Color Look-Up Table Enable
    def cluten : Bool
      @value.bits_set?(0x10_u32)
    end

    # Color Look-Up Table Enable
    def self.cluten : Bool
      value.cluten
    end

    # Color Look-Up Table Enable
    def self.cluten=(value : Bool) : Bool
      self.set(cluten: value)
      value
    end

    # Color Keying Enable
    def colken : Bool
      @value.bits_set?(0x2_u32)
    end

    # Color Keying Enable
    def self.colken : Bool
      value.colken
    end

    # Color Keying Enable
    def self.colken=(value : Bool) : Bool
      self.set(colken: value)
      value
    end

    # Layer Enable
    def len : Bool
      @value.bits_set?(0x1_u32)
    end

    # Layer Enable
    def self.len : Bool
      value.len
    end

    # Layer Enable
    def self.len=(value : Bool) : Bool
      self.set(len: value)
      value
    end

    def copy_with(
      *,

      cluten : Bool? = nil,

      colken : Bool? = nil,

      len : Bool? = nil
    ) : self
      value = @value

      unless cluten.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(cluten.to_int).&(0x1_u32) << 4
      end

      unless colken.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(colken.to_int).&(0x1_u32) << 1
      end

      unless len.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(len.to_int).&(0x1_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      cluten : Bool? = nil,
      colken : Bool? = nil,
      len : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        cluten: cluten,
        colken: colken,
        len: len,
      )
    end
  end # struct

  # Layerx Window Horizontal Position          Configuration Register
  struct L2WHPCR
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

    # Window Horizontal Stop              Position
    def whsppos : UInt16
      UInt16.new!((@value >> 16) & 0xfff_u32)
    end

    # Window Horizontal Stop              Position
    def self.whsppos : UInt16
      value.whsppos
    end

    # Window Horizontal Stop              Position
    def self.whsppos=(value : UInt16) : UInt16
      self.set(whsppos: value)
      value
    end

    # Window Horizontal Start              Position
    def whstpos : UInt16
      UInt16.new!((@value >> 0) & 0xfff_u32)
    end

    # Window Horizontal Start              Position
    def self.whstpos : UInt16
      value.whstpos
    end

    # Window Horizontal Start              Position
    def self.whstpos=(value : UInt16) : UInt16
      self.set(whstpos: value)
      value
    end

    def copy_with(
      *,

      whsppos : UInt16? = nil,

      whstpos : UInt16? = nil
    ) : self
      value = @value

      unless whsppos.nil?
        value = (value & 0xf000ffff_u32) |
                UInt32.new!(whsppos.to_int).&(0xfff_u32) << 16
      end

      unless whstpos.nil?
        value = (value & 0xfffff000_u32) |
                UInt32.new!(whstpos.to_int).&(0xfff_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      whsppos : UInt16? = nil,
      whstpos : UInt16? = nil
    ) : Nil
      self.value = self.value.copy_with(
        whsppos: whsppos,
        whstpos: whstpos,
      )
    end
  end # struct

  # Layerx Window Vertical Position          Configuration Register
  struct L2WVPCR
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

    # Window Vertical Stop              Position
    def wvsppos : UInt16
      UInt16.new!((@value >> 16) & 0x7ff_u32)
    end

    # Window Vertical Stop              Position
    def self.wvsppos : UInt16
      value.wvsppos
    end

    # Window Vertical Stop              Position
    def self.wvsppos=(value : UInt16) : UInt16
      self.set(wvsppos: value)
      value
    end

    # Window Vertical Start              Position
    def wvstpos : UInt16
      UInt16.new!((@value >> 0) & 0x7ff_u32)
    end

    # Window Vertical Start              Position
    def self.wvstpos : UInt16
      value.wvstpos
    end

    # Window Vertical Start              Position
    def self.wvstpos=(value : UInt16) : UInt16
      self.set(wvstpos: value)
      value
    end

    def copy_with(
      *,

      wvsppos : UInt16? = nil,

      wvstpos : UInt16? = nil
    ) : self
      value = @value

      unless wvsppos.nil?
        value = (value & 0xf800ffff_u32) |
                UInt32.new!(wvsppos.to_int).&(0x7ff_u32) << 16
      end

      unless wvstpos.nil?
        value = (value & 0xfffff800_u32) |
                UInt32.new!(wvstpos.to_int).&(0x7ff_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      wvsppos : UInt16? = nil,
      wvstpos : UInt16? = nil
    ) : Nil
      self.value = self.value.copy_with(
        wvsppos: wvsppos,
        wvstpos: wvstpos,
      )
    end
  end # struct

  # Layerx Color Keying Configuration          Register
  struct L2CKCR
    ADDRESS = BASE_ADDRESS + 0x110_u64

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

    # Color Key Red value
    def ckred : UInt16
      UInt16.new!((@value >> 15) & 0x1ff_u32)
    end

    # Color Key Red value
    def self.ckred : UInt16
      value.ckred
    end

    # Color Key Red value
    def self.ckred=(value : UInt16) : UInt16
      self.set(ckred: value)
      value
    end

    # Color Key Green value
    def ckgreen : UInt8
      UInt8.new!((@value >> 8) & 0x7f_u32)
    end

    # Color Key Green value
    def self.ckgreen : UInt8
      value.ckgreen
    end

    # Color Key Green value
    def self.ckgreen=(value : UInt8) : UInt8
      self.set(ckgreen: value)
      value
    end

    # Color Key Blue value
    def ckblue : UInt8
      UInt8.new!((@value >> 0) & 0xff_u32)
    end

    # Color Key Blue value
    def self.ckblue : UInt8
      value.ckblue
    end

    # Color Key Blue value
    def self.ckblue=(value : UInt8) : UInt8
      self.set(ckblue: value)
      value
    end

    def copy_with(
      *,

      ckred : UInt16? = nil,

      ckgreen : UInt8? = nil,

      ckblue : UInt8? = nil
    ) : self
      value = @value

      unless ckred.nil?
        value = (value & 0xff007fff_u32) |
                UInt32.new!(ckred.to_int).&(0x1ff_u32) << 15
      end

      unless ckgreen.nil?
        value = (value & 0xffff80ff_u32) |
                UInt32.new!(ckgreen.to_int).&(0x7f_u32) << 8
      end

      unless ckblue.nil?
        value = (value & 0xffffff00_u32) |
                UInt32.new!(ckblue.to_int).&(0xff_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      ckred : UInt16? = nil,
      ckgreen : UInt8? = nil,
      ckblue : UInt8? = nil
    ) : Nil
      self.value = self.value.copy_with(
        ckred: ckred,
        ckgreen: ckgreen,
        ckblue: ckblue,
      )
    end
  end # struct

  # Layerx Pixel Format Configuration          Register
  struct L2PFCR
    ADDRESS = BASE_ADDRESS + 0x114_u64

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

    # Pixel Format
    def pf : UInt8
      UInt8.new!((@value >> 0) & 0x7_u32)
    end

    # Pixel Format
    def self.pf : UInt8
      value.pf
    end

    # Pixel Format
    def self.pf=(value : UInt8) : UInt8
      self.set(pf: value)
      value
    end

    def copy_with(
      *,

      pf : UInt8? = nil
    ) : self
      value = @value

      unless pf.nil?
        value = (value & 0xfffffff8_u32) |
                UInt32.new!(pf.to_int).&(0x7_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      pf : UInt8? = nil
    ) : Nil
      self.value = self.value.copy_with(
        pf: pf,
      )
    end
  end # struct

  # Layerx Constant Alpha Configuration          Register
  struct L2CACR
    ADDRESS = BASE_ADDRESS + 0x118_u64

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

    # Constant Alpha
    def consta : UInt8
      UInt8.new!((@value >> 0) & 0xff_u32)
    end

    # Constant Alpha
    def self.consta : UInt8
      value.consta
    end

    # Constant Alpha
    def self.consta=(value : UInt8) : UInt8
      self.set(consta: value)
      value
    end

    def copy_with(
      *,

      consta : UInt8? = nil
    ) : self
      value = @value

      unless consta.nil?
        value = (value & 0xffffff00_u32) |
                UInt32.new!(consta.to_int).&(0xff_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      consta : UInt8? = nil
    ) : Nil
      self.value = self.value.copy_with(
        consta: consta,
      )
    end
  end # struct

  # Layerx Default Color Configuration          Register
  struct L2DCCR
    ADDRESS = BASE_ADDRESS + 0x11c_u64

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

    # Default Color Alpha
    def dcalpha : UInt8
      UInt8.new!((@value >> 24) & 0xff_u32)
    end

    # Default Color Alpha
    def self.dcalpha : UInt8
      value.dcalpha
    end

    # Default Color Alpha
    def self.dcalpha=(value : UInt8) : UInt8
      self.set(dcalpha: value)
      value
    end

    # Default Color Red
    def dcred : UInt8
      UInt8.new!((@value >> 16) & 0xff_u32)
    end

    # Default Color Red
    def self.dcred : UInt8
      value.dcred
    end

    # Default Color Red
    def self.dcred=(value : UInt8) : UInt8
      self.set(dcred: value)
      value
    end

    # Default Color Green
    def dcgreen : UInt8
      UInt8.new!((@value >> 8) & 0xff_u32)
    end

    # Default Color Green
    def self.dcgreen : UInt8
      value.dcgreen
    end

    # Default Color Green
    def self.dcgreen=(value : UInt8) : UInt8
      self.set(dcgreen: value)
      value
    end

    # Default Color Blue
    def dcblue : UInt8
      UInt8.new!((@value >> 0) & 0xff_u32)
    end

    # Default Color Blue
    def self.dcblue : UInt8
      value.dcblue
    end

    # Default Color Blue
    def self.dcblue=(value : UInt8) : UInt8
      self.set(dcblue: value)
      value
    end

    def copy_with(
      *,

      dcalpha : UInt8? = nil,

      dcred : UInt8? = nil,

      dcgreen : UInt8? = nil,

      dcblue : UInt8? = nil
    ) : self
      value = @value

      unless dcalpha.nil?
        value = (value & 0xffffff_u32) |
                UInt32.new!(dcalpha.to_int).&(0xff_u32) << 24
      end

      unless dcred.nil?
        value = (value & 0xff00ffff_u32) |
                UInt32.new!(dcred.to_int).&(0xff_u32) << 16
      end

      unless dcgreen.nil?
        value = (value & 0xffff00ff_u32) |
                UInt32.new!(dcgreen.to_int).&(0xff_u32) << 8
      end

      unless dcblue.nil?
        value = (value & 0xffffff00_u32) |
                UInt32.new!(dcblue.to_int).&(0xff_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      dcalpha : UInt8? = nil,
      dcred : UInt8? = nil,
      dcgreen : UInt8? = nil,
      dcblue : UInt8? = nil
    ) : Nil
      self.value = self.value.copy_with(
        dcalpha: dcalpha,
        dcred: dcred,
        dcgreen: dcgreen,
        dcblue: dcblue,
      )
    end
  end # struct

  # Layerx Blending Factors Configuration          Register
  struct L2BFCR
    ADDRESS = BASE_ADDRESS + 0x120_u64

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
      new(0x607_u64)
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

    # Blending Factor 1
    def bf1 : UInt8
      UInt8.new!((@value >> 8) & 0x7_u32)
    end

    # Blending Factor 1
    def self.bf1 : UInt8
      value.bf1
    end

    # Blending Factor 1
    def self.bf1=(value : UInt8) : UInt8
      self.set(bf1: value)
      value
    end

    # Blending Factor 2
    def bf2 : UInt8
      UInt8.new!((@value >> 0) & 0x7_u32)
    end

    # Blending Factor 2
    def self.bf2 : UInt8
      value.bf2
    end

    # Blending Factor 2
    def self.bf2=(value : UInt8) : UInt8
      self.set(bf2: value)
      value
    end

    def copy_with(
      *,

      bf1 : UInt8? = nil,

      bf2 : UInt8? = nil
    ) : self
      value = @value

      unless bf1.nil?
        value = (value & 0xfffff8ff_u32) |
                UInt32.new!(bf1.to_int).&(0x7_u32) << 8
      end

      unless bf2.nil?
        value = (value & 0xfffffff8_u32) |
                UInt32.new!(bf2.to_int).&(0x7_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      bf1 : UInt8? = nil,
      bf2 : UInt8? = nil
    ) : Nil
      self.value = self.value.copy_with(
        bf1: bf1,
        bf2: bf2,
      )
    end
  end # struct

  # Layerx Color Frame Buffer Address          Register
  struct L2CFBAR
    ADDRESS = BASE_ADDRESS + 0x12c_u64

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

    # Color Frame Buffer Start              Address
    def cfbadd : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # Color Frame Buffer Start              Address
    def self.cfbadd : UInt32
      value.cfbadd
    end

    # Color Frame Buffer Start              Address
    def self.cfbadd=(value : UInt32) : UInt32
      self.set(cfbadd: value)
      value
    end

    def copy_with(
      *,

      cfbadd : UInt32? = nil
    ) : self
      value = @value

      unless cfbadd.nil?
        value = (value & 0xffffffff_u32) |
                UInt32.new!(cfbadd.to_int).&(0x0_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      cfbadd : UInt32? = nil
    ) : Nil
      self.value = self.value.copy_with(
        cfbadd: cfbadd,
      )
    end
  end # struct

  # Layerx Color Frame Buffer Length          Register
  struct L2CFBLR
    ADDRESS = BASE_ADDRESS + 0x130_u64

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

    # Color Frame Buffer Pitch in              bytes
    def cfbp : UInt16
      UInt16.new!((@value >> 16) & 0x1fff_u32)
    end

    # Color Frame Buffer Pitch in              bytes
    def self.cfbp : UInt16
      value.cfbp
    end

    # Color Frame Buffer Pitch in              bytes
    def self.cfbp=(value : UInt16) : UInt16
      self.set(cfbp: value)
      value
    end

    # Color Frame Buffer Line              Length
    def cfbll : UInt16
      UInt16.new!((@value >> 0) & 0x1fff_u32)
    end

    # Color Frame Buffer Line              Length
    def self.cfbll : UInt16
      value.cfbll
    end

    # Color Frame Buffer Line              Length
    def self.cfbll=(value : UInt16) : UInt16
      self.set(cfbll: value)
      value
    end

    def copy_with(
      *,

      cfbp : UInt16? = nil,

      cfbll : UInt16? = nil
    ) : self
      value = @value

      unless cfbp.nil?
        value = (value & 0xe000ffff_u32) |
                UInt32.new!(cfbp.to_int).&(0x1fff_u32) << 16
      end

      unless cfbll.nil?
        value = (value & 0xffffe000_u32) |
                UInt32.new!(cfbll.to_int).&(0x1fff_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      cfbp : UInt16? = nil,
      cfbll : UInt16? = nil
    ) : Nil
      self.value = self.value.copy_with(
        cfbp: cfbp,
        cfbll: cfbll,
      )
    end
  end # struct

  # Layerx ColorFrame Buffer Line Number          Register
  struct L2CFBLNR
    ADDRESS = BASE_ADDRESS + 0x134_u64

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

    # Frame Buffer Line Number
    def cfblnbr : UInt16
      UInt16.new!((@value >> 0) & 0x7ff_u32)
    end

    # Frame Buffer Line Number
    def self.cfblnbr : UInt16
      value.cfblnbr
    end

    # Frame Buffer Line Number
    def self.cfblnbr=(value : UInt16) : UInt16
      self.set(cfblnbr: value)
      value
    end

    def copy_with(
      *,

      cfblnbr : UInt16? = nil
    ) : self
      value = @value

      unless cfblnbr.nil?
        value = (value & 0xfffff800_u32) |
                UInt32.new!(cfblnbr.to_int).&(0x7ff_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      cfblnbr : UInt16? = nil
    ) : Nil
      self.value = self.value.copy_with(
        cfblnbr: cfblnbr,
      )
    end
  end # struct

  # Layerx CLUT Write Register
  struct L2CLUTWR
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

    # CLUT Address
    def self.clutadd=(value : UInt8) : UInt8
      self.set(clutadd: value)
      value
    end

    # Red value
    def self.red=(value : UInt8) : UInt8
      self.set(red: value)
      value
    end

    # Green value
    def self.green=(value : UInt8) : UInt8
      self.set(green: value)
      value
    end

    # Blue value
    def self.blue=(value : UInt8) : UInt8
      self.set(blue: value)
      value
    end

    def copy_with(
      *,

      clutadd : UInt8? = nil,

      red : UInt8? = nil,

      green : UInt8? = nil,

      blue : UInt8? = nil
    ) : self
      value = @value

      unless clutadd.nil?
        value = (value & 0xffffff_u32) |
                UInt32.new!(clutadd.to_int).&(0xff_u32) << 24
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
      clutadd : UInt8? = nil,
      red : UInt8? = nil,
      green : UInt8? = nil,
      blue : UInt8? = nil
    ) : Nil
      self.value = self.value.copy_with(
        clutadd: clutadd,
        red: red,
        green: green,
        blue: blue,
      )
    end
  end # struct

end
