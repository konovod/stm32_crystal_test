# Touch sensing controller
module TSC
  VERSION      = nil
  BASE_ADDRESS = 0x40024000_u64

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

    # Charge transfer pulse high
    def ctph : UInt8
      UInt8.new!((@value >> 28) & 0xf_u32)
    end

    # Charge transfer pulse high
    def self.ctph : UInt8
      value.ctph
    end

    # Charge transfer pulse high
    def self.ctph=(value : UInt8) : UInt8
      self.set(ctph: value)
      value
    end

    # Charge transfer pulse low
    def ctpl : UInt8
      UInt8.new!((@value >> 24) & 0xf_u32)
    end

    # Charge transfer pulse low
    def self.ctpl : UInt8
      value.ctpl
    end

    # Charge transfer pulse low
    def self.ctpl=(value : UInt8) : UInt8
      self.set(ctpl: value)
      value
    end

    # Spread spectrum deviation
    def ssd : UInt8
      UInt8.new!((@value >> 17) & 0x7f_u32)
    end

    # Spread spectrum deviation
    def self.ssd : UInt8
      value.ssd
    end

    # Spread spectrum deviation
    def self.ssd=(value : UInt8) : UInt8
      self.set(ssd: value)
      value
    end

    # Spread spectrum enable
    def sse : Bool
      @value.bits_set?(0x10000_u32)
    end

    # Spread spectrum enable
    def self.sse : Bool
      value.sse
    end

    # Spread spectrum enable
    def self.sse=(value : Bool) : Bool
      self.set(sse: value)
      value
    end

    # Spread spectrum prescaler
    def sspsc : Bool
      @value.bits_set?(0x8000_u32)
    end

    # Spread spectrum prescaler
    def self.sspsc : Bool
      value.sspsc
    end

    # Spread spectrum prescaler
    def self.sspsc=(value : Bool) : Bool
      self.set(sspsc: value)
      value
    end

    # pulse generator prescaler
    def pgpsc : UInt8
      UInt8.new!((@value >> 12) & 0x7_u32)
    end

    # pulse generator prescaler
    def self.pgpsc : UInt8
      value.pgpsc
    end

    # pulse generator prescaler
    def self.pgpsc=(value : UInt8) : UInt8
      self.set(pgpsc: value)
      value
    end

    # Max count value
    def mcv : UInt8
      UInt8.new!((@value >> 5) & 0x7_u32)
    end

    # Max count value
    def self.mcv : UInt8
      value.mcv
    end

    # Max count value
    def self.mcv=(value : UInt8) : UInt8
      self.set(mcv: value)
      value
    end

    # I/O Default mode
    def iodef : Bool
      @value.bits_set?(0x10_u32)
    end

    # I/O Default mode
    def self.iodef : Bool
      value.iodef
    end

    # I/O Default mode
    def self.iodef=(value : Bool) : Bool
      self.set(iodef: value)
      value
    end

    # Synchronization pin              polarity
    def syncpol : Bool
      @value.bits_set?(0x8_u32)
    end

    # Synchronization pin              polarity
    def self.syncpol : Bool
      value.syncpol
    end

    # Synchronization pin              polarity
    def self.syncpol=(value : Bool) : Bool
      self.set(syncpol: value)
      value
    end

    # Acquisition mode
    def am : Bool
      @value.bits_set?(0x4_u32)
    end

    # Acquisition mode
    def self.am : Bool
      value.am
    end

    # Acquisition mode
    def self.am=(value : Bool) : Bool
      self.set(am: value)
      value
    end

    # Start a new acquisition
    def start : Bool
      @value.bits_set?(0x2_u32)
    end

    # Start a new acquisition
    def self.start : Bool
      value.start
    end

    # Start a new acquisition
    def self.start=(value : Bool) : Bool
      self.set(start: value)
      value
    end

    # Touch sensing controller              enable
    def e : Bool
      @value.bits_set?(0x1_u32)
    end

    # Touch sensing controller              enable
    def self.e : Bool
      value.e
    end

    # Touch sensing controller              enable
    def self.e=(value : Bool) : Bool
      self.set(e: value)
      value
    end

    def copy_with(
      *,

      ctph : UInt8? = nil,

      ctpl : UInt8? = nil,

      ssd : UInt8? = nil,

      sse : Bool? = nil,

      sspsc : Bool? = nil,

      pgpsc : UInt8? = nil,

      mcv : UInt8? = nil,

      iodef : Bool? = nil,

      syncpol : Bool? = nil,

      am : Bool? = nil,

      start : Bool? = nil,

      e : Bool? = nil
    ) : self
      value = @value

      unless ctph.nil?
        value = (value & 0xfffffff_u32) |
                UInt32.new!(ctph.to_int).&(0xf_u32) << 28
      end

      unless ctpl.nil?
        value = (value & 0xf0ffffff_u32) |
                UInt32.new!(ctpl.to_int).&(0xf_u32) << 24
      end

      unless ssd.nil?
        value = (value & 0xff01ffff_u32) |
                UInt32.new!(ssd.to_int).&(0x7f_u32) << 17
      end

      unless sse.nil?
        value = (value & 0xfffeffff_u32) |
                UInt32.new!(sse.to_int).&(0x1_u32) << 16
      end

      unless sspsc.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(sspsc.to_int).&(0x1_u32) << 15
      end

      unless pgpsc.nil?
        value = (value & 0xffff8fff_u32) |
                UInt32.new!(pgpsc.to_int).&(0x7_u32) << 12
      end

      unless mcv.nil?
        value = (value & 0xffffff1f_u32) |
                UInt32.new!(mcv.to_int).&(0x7_u32) << 5
      end

      unless iodef.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(iodef.to_int).&(0x1_u32) << 4
      end

      unless syncpol.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(syncpol.to_int).&(0x1_u32) << 3
      end

      unless am.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(am.to_int).&(0x1_u32) << 2
      end

      unless start.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(start.to_int).&(0x1_u32) << 1
      end

      unless e.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(e.to_int).&(0x1_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      ctph : UInt8? = nil,
      ctpl : UInt8? = nil,
      ssd : UInt8? = nil,
      sse : Bool? = nil,
      sspsc : Bool? = nil,
      pgpsc : UInt8? = nil,
      mcv : UInt8? = nil,
      iodef : Bool? = nil,
      syncpol : Bool? = nil,
      am : Bool? = nil,
      start : Bool? = nil,
      e : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        ctph: ctph,
        ctpl: ctpl,
        ssd: ssd,
        sse: sse,
        sspsc: sspsc,
        pgpsc: pgpsc,
        mcv: mcv,
        iodef: iodef,
        syncpol: syncpol,
        am: am,
        start: start,
        e: e,
      )
    end
  end # struct

  # interrupt enable register
  struct IER
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

    # Max count error interrupt              enable
    def mceie : Bool
      @value.bits_set?(0x2_u32)
    end

    # Max count error interrupt              enable
    def self.mceie : Bool
      value.mceie
    end

    # Max count error interrupt              enable
    def self.mceie=(value : Bool) : Bool
      self.set(mceie: value)
      value
    end

    # End of acquisition interrupt              enable
    def eoaie : Bool
      @value.bits_set?(0x1_u32)
    end

    # End of acquisition interrupt              enable
    def self.eoaie : Bool
      value.eoaie
    end

    # End of acquisition interrupt              enable
    def self.eoaie=(value : Bool) : Bool
      self.set(eoaie: value)
      value
    end

    def copy_with(
      *,

      mceie : Bool? = nil,

      eoaie : Bool? = nil
    ) : self
      value = @value

      unless mceie.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(mceie.to_int).&(0x1_u32) << 1
      end

      unless eoaie.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(eoaie.to_int).&(0x1_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      mceie : Bool? = nil,
      eoaie : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        mceie: mceie,
        eoaie: eoaie,
      )
    end
  end # struct

  # interrupt clear register
  struct ICR
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

    # Max count error interrupt              clear
    def mceic : Bool
      @value.bits_set?(0x2_u32)
    end

    # Max count error interrupt              clear
    def self.mceic : Bool
      value.mceic
    end

    # Max count error interrupt              clear
    def self.mceic=(value : Bool) : Bool
      self.set(mceic: value)
      value
    end

    # End of acquisition interrupt              clear
    def eoaic : Bool
      @value.bits_set?(0x1_u32)
    end

    # End of acquisition interrupt              clear
    def self.eoaic : Bool
      value.eoaic
    end

    # End of acquisition interrupt              clear
    def self.eoaic=(value : Bool) : Bool
      self.set(eoaic: value)
      value
    end

    def copy_with(
      *,

      mceic : Bool? = nil,

      eoaic : Bool? = nil
    ) : self
      value = @value

      unless mceic.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(mceic.to_int).&(0x1_u32) << 1
      end

      unless eoaic.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(eoaic.to_int).&(0x1_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      mceic : Bool? = nil,
      eoaic : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        mceic: mceic,
        eoaic: eoaic,
      )
    end
  end # struct

  # interrupt status register
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

    # Max count error flag
    def mcef : Bool
      @value.bits_set?(0x2_u32)
    end

    # Max count error flag
    def self.mcef : Bool
      value.mcef
    end

    # Max count error flag
    def self.mcef=(value : Bool) : Bool
      self.set(mcef: value)
      value
    end

    # End of acquisition flag
    def eoaf : Bool
      @value.bits_set?(0x1_u32)
    end

    # End of acquisition flag
    def self.eoaf : Bool
      value.eoaf
    end

    # End of acquisition flag
    def self.eoaf=(value : Bool) : Bool
      self.set(eoaf: value)
      value
    end

    def copy_with(
      *,

      mcef : Bool? = nil,

      eoaf : Bool? = nil
    ) : self
      value = @value

      unless mcef.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(mcef.to_int).&(0x1_u32) << 1
      end

      unless eoaf.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(eoaf.to_int).&(0x1_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      mcef : Bool? = nil,
      eoaf : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        mcef: mcef,
        eoaf: eoaf,
      )
    end
  end # struct

  # I/O hysteresis control          register
  struct IOHCR
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

    # G1_IO1 Schmitt trigger hysteresis              mode
    def g1_io1 : Bool
      @value.bits_set?(0x1_u32)
    end

    # G1_IO1 Schmitt trigger hysteresis              mode
    def self.g1_io1 : Bool
      value.g1_io1
    end

    # G1_IO1 Schmitt trigger hysteresis              mode
    def self.g1_io1=(value : Bool) : Bool
      self.set(g1_io1: value)
      value
    end

    # G1_IO2 Schmitt trigger hysteresis              mode
    def g1_io2 : Bool
      @value.bits_set?(0x2_u32)
    end

    # G1_IO2 Schmitt trigger hysteresis              mode
    def self.g1_io2 : Bool
      value.g1_io2
    end

    # G1_IO2 Schmitt trigger hysteresis              mode
    def self.g1_io2=(value : Bool) : Bool
      self.set(g1_io2: value)
      value
    end

    # G1_IO3 Schmitt trigger hysteresis              mode
    def g1_io3 : Bool
      @value.bits_set?(0x4_u32)
    end

    # G1_IO3 Schmitt trigger hysteresis              mode
    def self.g1_io3 : Bool
      value.g1_io3
    end

    # G1_IO3 Schmitt trigger hysteresis              mode
    def self.g1_io3=(value : Bool) : Bool
      self.set(g1_io3: value)
      value
    end

    # G1_IO4 Schmitt trigger hysteresis              mode
    def g1_io4 : Bool
      @value.bits_set?(0x8_u32)
    end

    # G1_IO4 Schmitt trigger hysteresis              mode
    def self.g1_io4 : Bool
      value.g1_io4
    end

    # G1_IO4 Schmitt trigger hysteresis              mode
    def self.g1_io4=(value : Bool) : Bool
      self.set(g1_io4: value)
      value
    end

    # G2_IO1 Schmitt trigger hysteresis              mode
    def g2_io1 : Bool
      @value.bits_set?(0x10_u32)
    end

    # G2_IO1 Schmitt trigger hysteresis              mode
    def self.g2_io1 : Bool
      value.g2_io1
    end

    # G2_IO1 Schmitt trigger hysteresis              mode
    def self.g2_io1=(value : Bool) : Bool
      self.set(g2_io1: value)
      value
    end

    # G2_IO2 Schmitt trigger hysteresis              mode
    def g2_io2 : Bool
      @value.bits_set?(0x20_u32)
    end

    # G2_IO2 Schmitt trigger hysteresis              mode
    def self.g2_io2 : Bool
      value.g2_io2
    end

    # G2_IO2 Schmitt trigger hysteresis              mode
    def self.g2_io2=(value : Bool) : Bool
      self.set(g2_io2: value)
      value
    end

    # G2_IO3 Schmitt trigger hysteresis              mode
    def g2_io3 : Bool
      @value.bits_set?(0x40_u32)
    end

    # G2_IO3 Schmitt trigger hysteresis              mode
    def self.g2_io3 : Bool
      value.g2_io3
    end

    # G2_IO3 Schmitt trigger hysteresis              mode
    def self.g2_io3=(value : Bool) : Bool
      self.set(g2_io3: value)
      value
    end

    # G2_IO4 Schmitt trigger hysteresis              mode
    def g2_io4 : Bool
      @value.bits_set?(0x80_u32)
    end

    # G2_IO4 Schmitt trigger hysteresis              mode
    def self.g2_io4 : Bool
      value.g2_io4
    end

    # G2_IO4 Schmitt trigger hysteresis              mode
    def self.g2_io4=(value : Bool) : Bool
      self.set(g2_io4: value)
      value
    end

    # G3_IO1 Schmitt trigger hysteresis              mode
    def g3_io1 : Bool
      @value.bits_set?(0x100_u32)
    end

    # G3_IO1 Schmitt trigger hysteresis              mode
    def self.g3_io1 : Bool
      value.g3_io1
    end

    # G3_IO1 Schmitt trigger hysteresis              mode
    def self.g3_io1=(value : Bool) : Bool
      self.set(g3_io1: value)
      value
    end

    # G3_IO2 Schmitt trigger hysteresis              mode
    def g3_io2 : Bool
      @value.bits_set?(0x200_u32)
    end

    # G3_IO2 Schmitt trigger hysteresis              mode
    def self.g3_io2 : Bool
      value.g3_io2
    end

    # G3_IO2 Schmitt trigger hysteresis              mode
    def self.g3_io2=(value : Bool) : Bool
      self.set(g3_io2: value)
      value
    end

    # G3_IO3 Schmitt trigger hysteresis              mode
    def g3_io3 : Bool
      @value.bits_set?(0x400_u32)
    end

    # G3_IO3 Schmitt trigger hysteresis              mode
    def self.g3_io3 : Bool
      value.g3_io3
    end

    # G3_IO3 Schmitt trigger hysteresis              mode
    def self.g3_io3=(value : Bool) : Bool
      self.set(g3_io3: value)
      value
    end

    # G3_IO4 Schmitt trigger hysteresis              mode
    def g3_io4 : Bool
      @value.bits_set?(0x800_u32)
    end

    # G3_IO4 Schmitt trigger hysteresis              mode
    def self.g3_io4 : Bool
      value.g3_io4
    end

    # G3_IO4 Schmitt trigger hysteresis              mode
    def self.g3_io4=(value : Bool) : Bool
      self.set(g3_io4: value)
      value
    end

    # G4_IO1 Schmitt trigger hysteresis              mode
    def g4_io1 : Bool
      @value.bits_set?(0x1000_u32)
    end

    # G4_IO1 Schmitt trigger hysteresis              mode
    def self.g4_io1 : Bool
      value.g4_io1
    end

    # G4_IO1 Schmitt trigger hysteresis              mode
    def self.g4_io1=(value : Bool) : Bool
      self.set(g4_io1: value)
      value
    end

    # G4_IO2 Schmitt trigger hysteresis              mode
    def g4_io2 : Bool
      @value.bits_set?(0x2000_u32)
    end

    # G4_IO2 Schmitt trigger hysteresis              mode
    def self.g4_io2 : Bool
      value.g4_io2
    end

    # G4_IO2 Schmitt trigger hysteresis              mode
    def self.g4_io2=(value : Bool) : Bool
      self.set(g4_io2: value)
      value
    end

    # G4_IO3 Schmitt trigger hysteresis              mode
    def g4_io3 : Bool
      @value.bits_set?(0x4000_u32)
    end

    # G4_IO3 Schmitt trigger hysteresis              mode
    def self.g4_io3 : Bool
      value.g4_io3
    end

    # G4_IO3 Schmitt trigger hysteresis              mode
    def self.g4_io3=(value : Bool) : Bool
      self.set(g4_io3: value)
      value
    end

    # G4_IO4 Schmitt trigger hysteresis              mode
    def g4_io4 : Bool
      @value.bits_set?(0x8000_u32)
    end

    # G4_IO4 Schmitt trigger hysteresis              mode
    def self.g4_io4 : Bool
      value.g4_io4
    end

    # G4_IO4 Schmitt trigger hysteresis              mode
    def self.g4_io4=(value : Bool) : Bool
      self.set(g4_io4: value)
      value
    end

    # G5_IO1 Schmitt trigger hysteresis              mode
    def g5_io1 : Bool
      @value.bits_set?(0x10000_u32)
    end

    # G5_IO1 Schmitt trigger hysteresis              mode
    def self.g5_io1 : Bool
      value.g5_io1
    end

    # G5_IO1 Schmitt trigger hysteresis              mode
    def self.g5_io1=(value : Bool) : Bool
      self.set(g5_io1: value)
      value
    end

    # G5_IO2 Schmitt trigger hysteresis              mode
    def g5_io2 : Bool
      @value.bits_set?(0x20000_u32)
    end

    # G5_IO2 Schmitt trigger hysteresis              mode
    def self.g5_io2 : Bool
      value.g5_io2
    end

    # G5_IO2 Schmitt trigger hysteresis              mode
    def self.g5_io2=(value : Bool) : Bool
      self.set(g5_io2: value)
      value
    end

    # G5_IO3 Schmitt trigger hysteresis              mode
    def g5_io3 : Bool
      @value.bits_set?(0x40000_u32)
    end

    # G5_IO3 Schmitt trigger hysteresis              mode
    def self.g5_io3 : Bool
      value.g5_io3
    end

    # G5_IO3 Schmitt trigger hysteresis              mode
    def self.g5_io3=(value : Bool) : Bool
      self.set(g5_io3: value)
      value
    end

    # G5_IO4 Schmitt trigger hysteresis              mode
    def g5_io4 : Bool
      @value.bits_set?(0x80000_u32)
    end

    # G5_IO4 Schmitt trigger hysteresis              mode
    def self.g5_io4 : Bool
      value.g5_io4
    end

    # G5_IO4 Schmitt trigger hysteresis              mode
    def self.g5_io4=(value : Bool) : Bool
      self.set(g5_io4: value)
      value
    end

    # G6_IO1 Schmitt trigger hysteresis              mode
    def g6_io1 : Bool
      @value.bits_set?(0x100000_u32)
    end

    # G6_IO1 Schmitt trigger hysteresis              mode
    def self.g6_io1 : Bool
      value.g6_io1
    end

    # G6_IO1 Schmitt trigger hysteresis              mode
    def self.g6_io1=(value : Bool) : Bool
      self.set(g6_io1: value)
      value
    end

    # G6_IO2 Schmitt trigger hysteresis              mode
    def g6_io2 : Bool
      @value.bits_set?(0x200000_u32)
    end

    # G6_IO2 Schmitt trigger hysteresis              mode
    def self.g6_io2 : Bool
      value.g6_io2
    end

    # G6_IO2 Schmitt trigger hysteresis              mode
    def self.g6_io2=(value : Bool) : Bool
      self.set(g6_io2: value)
      value
    end

    # G6_IO3 Schmitt trigger hysteresis              mode
    def g6_io3 : Bool
      @value.bits_set?(0x400000_u32)
    end

    # G6_IO3 Schmitt trigger hysteresis              mode
    def self.g6_io3 : Bool
      value.g6_io3
    end

    # G6_IO3 Schmitt trigger hysteresis              mode
    def self.g6_io3=(value : Bool) : Bool
      self.set(g6_io3: value)
      value
    end

    # G6_IO4 Schmitt trigger hysteresis              mode
    def g6_io4 : Bool
      @value.bits_set?(0x800000_u32)
    end

    # G6_IO4 Schmitt trigger hysteresis              mode
    def self.g6_io4 : Bool
      value.g6_io4
    end

    # G6_IO4 Schmitt trigger hysteresis              mode
    def self.g6_io4=(value : Bool) : Bool
      self.set(g6_io4: value)
      value
    end

    # G7_IO1 Schmitt trigger hysteresis              mode
    def g7_io1 : Bool
      @value.bits_set?(0x1000000_u32)
    end

    # G7_IO1 Schmitt trigger hysteresis              mode
    def self.g7_io1 : Bool
      value.g7_io1
    end

    # G7_IO1 Schmitt trigger hysteresis              mode
    def self.g7_io1=(value : Bool) : Bool
      self.set(g7_io1: value)
      value
    end

    # G7_IO2 Schmitt trigger hysteresis              mode
    def g7_io2 : Bool
      @value.bits_set?(0x2000000_u32)
    end

    # G7_IO2 Schmitt trigger hysteresis              mode
    def self.g7_io2 : Bool
      value.g7_io2
    end

    # G7_IO2 Schmitt trigger hysteresis              mode
    def self.g7_io2=(value : Bool) : Bool
      self.set(g7_io2: value)
      value
    end

    # G7_IO3 Schmitt trigger hysteresis              mode
    def g7_io3 : Bool
      @value.bits_set?(0x4000000_u32)
    end

    # G7_IO3 Schmitt trigger hysteresis              mode
    def self.g7_io3 : Bool
      value.g7_io3
    end

    # G7_IO3 Schmitt trigger hysteresis              mode
    def self.g7_io3=(value : Bool) : Bool
      self.set(g7_io3: value)
      value
    end

    # G7_IO4 Schmitt trigger hysteresis              mode
    def g7_io4 : Bool
      @value.bits_set?(0x8000000_u32)
    end

    # G7_IO4 Schmitt trigger hysteresis              mode
    def self.g7_io4 : Bool
      value.g7_io4
    end

    # G7_IO4 Schmitt trigger hysteresis              mode
    def self.g7_io4=(value : Bool) : Bool
      self.set(g7_io4: value)
      value
    end

    # G8_IO1 Schmitt trigger hysteresis              mode
    def g8_io1 : Bool
      @value.bits_set?(0x10000000_u32)
    end

    # G8_IO1 Schmitt trigger hysteresis              mode
    def self.g8_io1 : Bool
      value.g8_io1
    end

    # G8_IO1 Schmitt trigger hysteresis              mode
    def self.g8_io1=(value : Bool) : Bool
      self.set(g8_io1: value)
      value
    end

    # G8_IO2 Schmitt trigger hysteresis              mode
    def g8_io2 : Bool
      @value.bits_set?(0x20000000_u32)
    end

    # G8_IO2 Schmitt trigger hysteresis              mode
    def self.g8_io2 : Bool
      value.g8_io2
    end

    # G8_IO2 Schmitt trigger hysteresis              mode
    def self.g8_io2=(value : Bool) : Bool
      self.set(g8_io2: value)
      value
    end

    # G8_IO3 Schmitt trigger hysteresis              mode
    def g8_io3 : Bool
      @value.bits_set?(0x40000000_u32)
    end

    # G8_IO3 Schmitt trigger hysteresis              mode
    def self.g8_io3 : Bool
      value.g8_io3
    end

    # G8_IO3 Schmitt trigger hysteresis              mode
    def self.g8_io3=(value : Bool) : Bool
      self.set(g8_io3: value)
      value
    end

    # G8_IO4 Schmitt trigger hysteresis              mode
    def g8_io4 : Bool
      @value.bits_set?(0x80000000_u32)
    end

    # G8_IO4 Schmitt trigger hysteresis              mode
    def self.g8_io4 : Bool
      value.g8_io4
    end

    # G8_IO4 Schmitt trigger hysteresis              mode
    def self.g8_io4=(value : Bool) : Bool
      self.set(g8_io4: value)
      value
    end

    def copy_with(
      *,

      g1_io1 : Bool? = nil,

      g1_io2 : Bool? = nil,

      g1_io3 : Bool? = nil,

      g1_io4 : Bool? = nil,

      g2_io1 : Bool? = nil,

      g2_io2 : Bool? = nil,

      g2_io3 : Bool? = nil,

      g2_io4 : Bool? = nil,

      g3_io1 : Bool? = nil,

      g3_io2 : Bool? = nil,

      g3_io3 : Bool? = nil,

      g3_io4 : Bool? = nil,

      g4_io1 : Bool? = nil,

      g4_io2 : Bool? = nil,

      g4_io3 : Bool? = nil,

      g4_io4 : Bool? = nil,

      g5_io1 : Bool? = nil,

      g5_io2 : Bool? = nil,

      g5_io3 : Bool? = nil,

      g5_io4 : Bool? = nil,

      g6_io1 : Bool? = nil,

      g6_io2 : Bool? = nil,

      g6_io3 : Bool? = nil,

      g6_io4 : Bool? = nil,

      g7_io1 : Bool? = nil,

      g7_io2 : Bool? = nil,

      g7_io3 : Bool? = nil,

      g7_io4 : Bool? = nil,

      g8_io1 : Bool? = nil,

      g8_io2 : Bool? = nil,

      g8_io3 : Bool? = nil,

      g8_io4 : Bool? = nil
    ) : self
      value = @value

      unless g1_io1.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(g1_io1.to_int).&(0x1_u32) << 0
      end

      unless g1_io2.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(g1_io2.to_int).&(0x1_u32) << 1
      end

      unless g1_io3.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(g1_io3.to_int).&(0x1_u32) << 2
      end

      unless g1_io4.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(g1_io4.to_int).&(0x1_u32) << 3
      end

      unless g2_io1.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(g2_io1.to_int).&(0x1_u32) << 4
      end

      unless g2_io2.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(g2_io2.to_int).&(0x1_u32) << 5
      end

      unless g2_io3.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(g2_io3.to_int).&(0x1_u32) << 6
      end

      unless g2_io4.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(g2_io4.to_int).&(0x1_u32) << 7
      end

      unless g3_io1.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(g3_io1.to_int).&(0x1_u32) << 8
      end

      unless g3_io2.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(g3_io2.to_int).&(0x1_u32) << 9
      end

      unless g3_io3.nil?
        value = (value & 0xfffffbff_u32) |
                UInt32.new!(g3_io3.to_int).&(0x1_u32) << 10
      end

      unless g3_io4.nil?
        value = (value & 0xfffff7ff_u32) |
                UInt32.new!(g3_io4.to_int).&(0x1_u32) << 11
      end

      unless g4_io1.nil?
        value = (value & 0xffffefff_u32) |
                UInt32.new!(g4_io1.to_int).&(0x1_u32) << 12
      end

      unless g4_io2.nil?
        value = (value & 0xffffdfff_u32) |
                UInt32.new!(g4_io2.to_int).&(0x1_u32) << 13
      end

      unless g4_io3.nil?
        value = (value & 0xffffbfff_u32) |
                UInt32.new!(g4_io3.to_int).&(0x1_u32) << 14
      end

      unless g4_io4.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(g4_io4.to_int).&(0x1_u32) << 15
      end

      unless g5_io1.nil?
        value = (value & 0xfffeffff_u32) |
                UInt32.new!(g5_io1.to_int).&(0x1_u32) << 16
      end

      unless g5_io2.nil?
        value = (value & 0xfffdffff_u32) |
                UInt32.new!(g5_io2.to_int).&(0x1_u32) << 17
      end

      unless g5_io3.nil?
        value = (value & 0xfffbffff_u32) |
                UInt32.new!(g5_io3.to_int).&(0x1_u32) << 18
      end

      unless g5_io4.nil?
        value = (value & 0xfff7ffff_u32) |
                UInt32.new!(g5_io4.to_int).&(0x1_u32) << 19
      end

      unless g6_io1.nil?
        value = (value & 0xffefffff_u32) |
                UInt32.new!(g6_io1.to_int).&(0x1_u32) << 20
      end

      unless g6_io2.nil?
        value = (value & 0xffdfffff_u32) |
                UInt32.new!(g6_io2.to_int).&(0x1_u32) << 21
      end

      unless g6_io3.nil?
        value = (value & 0xffbfffff_u32) |
                UInt32.new!(g6_io3.to_int).&(0x1_u32) << 22
      end

      unless g6_io4.nil?
        value = (value & 0xff7fffff_u32) |
                UInt32.new!(g6_io4.to_int).&(0x1_u32) << 23
      end

      unless g7_io1.nil?
        value = (value & 0xfeffffff_u32) |
                UInt32.new!(g7_io1.to_int).&(0x1_u32) << 24
      end

      unless g7_io2.nil?
        value = (value & 0xfdffffff_u32) |
                UInt32.new!(g7_io2.to_int).&(0x1_u32) << 25
      end

      unless g7_io3.nil?
        value = (value & 0xfbffffff_u32) |
                UInt32.new!(g7_io3.to_int).&(0x1_u32) << 26
      end

      unless g7_io4.nil?
        value = (value & 0xf7ffffff_u32) |
                UInt32.new!(g7_io4.to_int).&(0x1_u32) << 27
      end

      unless g8_io1.nil?
        value = (value & 0xefffffff_u32) |
                UInt32.new!(g8_io1.to_int).&(0x1_u32) << 28
      end

      unless g8_io2.nil?
        value = (value & 0xdfffffff_u32) |
                UInt32.new!(g8_io2.to_int).&(0x1_u32) << 29
      end

      unless g8_io3.nil?
        value = (value & 0xbfffffff_u32) |
                UInt32.new!(g8_io3.to_int).&(0x1_u32) << 30
      end

      unless g8_io4.nil?
        value = (value & 0x7fffffff_u32) |
                UInt32.new!(g8_io4.to_int).&(0x1_u32) << 31
      end

      self.class.new(value)
    end

    def self.set(
      *,
      g1_io1 : Bool? = nil,
      g1_io2 : Bool? = nil,
      g1_io3 : Bool? = nil,
      g1_io4 : Bool? = nil,
      g2_io1 : Bool? = nil,
      g2_io2 : Bool? = nil,
      g2_io3 : Bool? = nil,
      g2_io4 : Bool? = nil,
      g3_io1 : Bool? = nil,
      g3_io2 : Bool? = nil,
      g3_io3 : Bool? = nil,
      g3_io4 : Bool? = nil,
      g4_io1 : Bool? = nil,
      g4_io2 : Bool? = nil,
      g4_io3 : Bool? = nil,
      g4_io4 : Bool? = nil,
      g5_io1 : Bool? = nil,
      g5_io2 : Bool? = nil,
      g5_io3 : Bool? = nil,
      g5_io4 : Bool? = nil,
      g6_io1 : Bool? = nil,
      g6_io2 : Bool? = nil,
      g6_io3 : Bool? = nil,
      g6_io4 : Bool? = nil,
      g7_io1 : Bool? = nil,
      g7_io2 : Bool? = nil,
      g7_io3 : Bool? = nil,
      g7_io4 : Bool? = nil,
      g8_io1 : Bool? = nil,
      g8_io2 : Bool? = nil,
      g8_io3 : Bool? = nil,
      g8_io4 : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        g1_io1: g1_io1,
        g1_io2: g1_io2,
        g1_io3: g1_io3,
        g1_io4: g1_io4,
        g2_io1: g2_io1,
        g2_io2: g2_io2,
        g2_io3: g2_io3,
        g2_io4: g2_io4,
        g3_io1: g3_io1,
        g3_io2: g3_io2,
        g3_io3: g3_io3,
        g3_io4: g3_io4,
        g4_io1: g4_io1,
        g4_io2: g4_io2,
        g4_io3: g4_io3,
        g4_io4: g4_io4,
        g5_io1: g5_io1,
        g5_io2: g5_io2,
        g5_io3: g5_io3,
        g5_io4: g5_io4,
        g6_io1: g6_io1,
        g6_io2: g6_io2,
        g6_io3: g6_io3,
        g6_io4: g6_io4,
        g7_io1: g7_io1,
        g7_io2: g7_io2,
        g7_io3: g7_io3,
        g7_io4: g7_io4,
        g8_io1: g8_io1,
        g8_io2: g8_io2,
        g8_io3: g8_io3,
        g8_io4: g8_io4,
      )
    end
  end # struct

  # I/O analog switch control          register
  struct IOASCR
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

    # G1_IO1 analog switch              enable
    def g1_io1 : Bool
      @value.bits_set?(0x1_u32)
    end

    # G1_IO1 analog switch              enable
    def self.g1_io1 : Bool
      value.g1_io1
    end

    # G1_IO1 analog switch              enable
    def self.g1_io1=(value : Bool) : Bool
      self.set(g1_io1: value)
      value
    end

    # G1_IO2 analog switch              enable
    def g1_io2 : Bool
      @value.bits_set?(0x2_u32)
    end

    # G1_IO2 analog switch              enable
    def self.g1_io2 : Bool
      value.g1_io2
    end

    # G1_IO2 analog switch              enable
    def self.g1_io2=(value : Bool) : Bool
      self.set(g1_io2: value)
      value
    end

    # G1_IO3 analog switch              enable
    def g1_io3 : Bool
      @value.bits_set?(0x4_u32)
    end

    # G1_IO3 analog switch              enable
    def self.g1_io3 : Bool
      value.g1_io3
    end

    # G1_IO3 analog switch              enable
    def self.g1_io3=(value : Bool) : Bool
      self.set(g1_io3: value)
      value
    end

    # G1_IO4 analog switch              enable
    def g1_io4 : Bool
      @value.bits_set?(0x8_u32)
    end

    # G1_IO4 analog switch              enable
    def self.g1_io4 : Bool
      value.g1_io4
    end

    # G1_IO4 analog switch              enable
    def self.g1_io4=(value : Bool) : Bool
      self.set(g1_io4: value)
      value
    end

    # G2_IO1 analog switch              enable
    def g2_io1 : Bool
      @value.bits_set?(0x10_u32)
    end

    # G2_IO1 analog switch              enable
    def self.g2_io1 : Bool
      value.g2_io1
    end

    # G2_IO1 analog switch              enable
    def self.g2_io1=(value : Bool) : Bool
      self.set(g2_io1: value)
      value
    end

    # G2_IO2 analog switch              enable
    def g2_io2 : Bool
      @value.bits_set?(0x20_u32)
    end

    # G2_IO2 analog switch              enable
    def self.g2_io2 : Bool
      value.g2_io2
    end

    # G2_IO2 analog switch              enable
    def self.g2_io2=(value : Bool) : Bool
      self.set(g2_io2: value)
      value
    end

    # G2_IO3 analog switch              enable
    def g2_io3 : Bool
      @value.bits_set?(0x40_u32)
    end

    # G2_IO3 analog switch              enable
    def self.g2_io3 : Bool
      value.g2_io3
    end

    # G2_IO3 analog switch              enable
    def self.g2_io3=(value : Bool) : Bool
      self.set(g2_io3: value)
      value
    end

    # G2_IO4 analog switch              enable
    def g2_io4 : Bool
      @value.bits_set?(0x80_u32)
    end

    # G2_IO4 analog switch              enable
    def self.g2_io4 : Bool
      value.g2_io4
    end

    # G2_IO4 analog switch              enable
    def self.g2_io4=(value : Bool) : Bool
      self.set(g2_io4: value)
      value
    end

    # G3_IO1 analog switch              enable
    def g3_io1 : Bool
      @value.bits_set?(0x100_u32)
    end

    # G3_IO1 analog switch              enable
    def self.g3_io1 : Bool
      value.g3_io1
    end

    # G3_IO1 analog switch              enable
    def self.g3_io1=(value : Bool) : Bool
      self.set(g3_io1: value)
      value
    end

    # G3_IO2 analog switch              enable
    def g3_io2 : Bool
      @value.bits_set?(0x200_u32)
    end

    # G3_IO2 analog switch              enable
    def self.g3_io2 : Bool
      value.g3_io2
    end

    # G3_IO2 analog switch              enable
    def self.g3_io2=(value : Bool) : Bool
      self.set(g3_io2: value)
      value
    end

    # G3_IO3 analog switch              enable
    def g3_io3 : Bool
      @value.bits_set?(0x400_u32)
    end

    # G3_IO3 analog switch              enable
    def self.g3_io3 : Bool
      value.g3_io3
    end

    # G3_IO3 analog switch              enable
    def self.g3_io3=(value : Bool) : Bool
      self.set(g3_io3: value)
      value
    end

    # G3_IO4 analog switch              enable
    def g3_io4 : Bool
      @value.bits_set?(0x800_u32)
    end

    # G3_IO4 analog switch              enable
    def self.g3_io4 : Bool
      value.g3_io4
    end

    # G3_IO4 analog switch              enable
    def self.g3_io4=(value : Bool) : Bool
      self.set(g3_io4: value)
      value
    end

    # G4_IO1 analog switch              enable
    def g4_io1 : Bool
      @value.bits_set?(0x1000_u32)
    end

    # G4_IO1 analog switch              enable
    def self.g4_io1 : Bool
      value.g4_io1
    end

    # G4_IO1 analog switch              enable
    def self.g4_io1=(value : Bool) : Bool
      self.set(g4_io1: value)
      value
    end

    # G4_IO2 analog switch              enable
    def g4_io2 : Bool
      @value.bits_set?(0x2000_u32)
    end

    # G4_IO2 analog switch              enable
    def self.g4_io2 : Bool
      value.g4_io2
    end

    # G4_IO2 analog switch              enable
    def self.g4_io2=(value : Bool) : Bool
      self.set(g4_io2: value)
      value
    end

    # G4_IO3 analog switch              enable
    def g4_io3 : Bool
      @value.bits_set?(0x4000_u32)
    end

    # G4_IO3 analog switch              enable
    def self.g4_io3 : Bool
      value.g4_io3
    end

    # G4_IO3 analog switch              enable
    def self.g4_io3=(value : Bool) : Bool
      self.set(g4_io3: value)
      value
    end

    # G4_IO4 analog switch              enable
    def g4_io4 : Bool
      @value.bits_set?(0x8000_u32)
    end

    # G4_IO4 analog switch              enable
    def self.g4_io4 : Bool
      value.g4_io4
    end

    # G4_IO4 analog switch              enable
    def self.g4_io4=(value : Bool) : Bool
      self.set(g4_io4: value)
      value
    end

    # G5_IO1 analog switch              enable
    def g5_io1 : Bool
      @value.bits_set?(0x10000_u32)
    end

    # G5_IO1 analog switch              enable
    def self.g5_io1 : Bool
      value.g5_io1
    end

    # G5_IO1 analog switch              enable
    def self.g5_io1=(value : Bool) : Bool
      self.set(g5_io1: value)
      value
    end

    # G5_IO2 analog switch              enable
    def g5_io2 : Bool
      @value.bits_set?(0x20000_u32)
    end

    # G5_IO2 analog switch              enable
    def self.g5_io2 : Bool
      value.g5_io2
    end

    # G5_IO2 analog switch              enable
    def self.g5_io2=(value : Bool) : Bool
      self.set(g5_io2: value)
      value
    end

    # G5_IO3 analog switch              enable
    def g5_io3 : Bool
      @value.bits_set?(0x40000_u32)
    end

    # G5_IO3 analog switch              enable
    def self.g5_io3 : Bool
      value.g5_io3
    end

    # G5_IO3 analog switch              enable
    def self.g5_io3=(value : Bool) : Bool
      self.set(g5_io3: value)
      value
    end

    # G5_IO4 analog switch              enable
    def g5_io4 : Bool
      @value.bits_set?(0x80000_u32)
    end

    # G5_IO4 analog switch              enable
    def self.g5_io4 : Bool
      value.g5_io4
    end

    # G5_IO4 analog switch              enable
    def self.g5_io4=(value : Bool) : Bool
      self.set(g5_io4: value)
      value
    end

    # G6_IO1 analog switch              enable
    def g6_io1 : Bool
      @value.bits_set?(0x100000_u32)
    end

    # G6_IO1 analog switch              enable
    def self.g6_io1 : Bool
      value.g6_io1
    end

    # G6_IO1 analog switch              enable
    def self.g6_io1=(value : Bool) : Bool
      self.set(g6_io1: value)
      value
    end

    # G6_IO2 analog switch              enable
    def g6_io2 : Bool
      @value.bits_set?(0x200000_u32)
    end

    # G6_IO2 analog switch              enable
    def self.g6_io2 : Bool
      value.g6_io2
    end

    # G6_IO2 analog switch              enable
    def self.g6_io2=(value : Bool) : Bool
      self.set(g6_io2: value)
      value
    end

    # G6_IO3 analog switch              enable
    def g6_io3 : Bool
      @value.bits_set?(0x400000_u32)
    end

    # G6_IO3 analog switch              enable
    def self.g6_io3 : Bool
      value.g6_io3
    end

    # G6_IO3 analog switch              enable
    def self.g6_io3=(value : Bool) : Bool
      self.set(g6_io3: value)
      value
    end

    # G6_IO4 analog switch              enable
    def g6_io4 : Bool
      @value.bits_set?(0x800000_u32)
    end

    # G6_IO4 analog switch              enable
    def self.g6_io4 : Bool
      value.g6_io4
    end

    # G6_IO4 analog switch              enable
    def self.g6_io4=(value : Bool) : Bool
      self.set(g6_io4: value)
      value
    end

    # G7_IO1 analog switch              enable
    def g7_io1 : Bool
      @value.bits_set?(0x1000000_u32)
    end

    # G7_IO1 analog switch              enable
    def self.g7_io1 : Bool
      value.g7_io1
    end

    # G7_IO1 analog switch              enable
    def self.g7_io1=(value : Bool) : Bool
      self.set(g7_io1: value)
      value
    end

    # G7_IO2 analog switch              enable
    def g7_io2 : Bool
      @value.bits_set?(0x2000000_u32)
    end

    # G7_IO2 analog switch              enable
    def self.g7_io2 : Bool
      value.g7_io2
    end

    # G7_IO2 analog switch              enable
    def self.g7_io2=(value : Bool) : Bool
      self.set(g7_io2: value)
      value
    end

    # G7_IO3 analog switch              enable
    def g7_io3 : Bool
      @value.bits_set?(0x4000000_u32)
    end

    # G7_IO3 analog switch              enable
    def self.g7_io3 : Bool
      value.g7_io3
    end

    # G7_IO3 analog switch              enable
    def self.g7_io3=(value : Bool) : Bool
      self.set(g7_io3: value)
      value
    end

    # G7_IO4 analog switch              enable
    def g7_io4 : Bool
      @value.bits_set?(0x8000000_u32)
    end

    # G7_IO4 analog switch              enable
    def self.g7_io4 : Bool
      value.g7_io4
    end

    # G7_IO4 analog switch              enable
    def self.g7_io4=(value : Bool) : Bool
      self.set(g7_io4: value)
      value
    end

    # G8_IO1 analog switch              enable
    def g8_io1 : Bool
      @value.bits_set?(0x10000000_u32)
    end

    # G8_IO1 analog switch              enable
    def self.g8_io1 : Bool
      value.g8_io1
    end

    # G8_IO1 analog switch              enable
    def self.g8_io1=(value : Bool) : Bool
      self.set(g8_io1: value)
      value
    end

    # G8_IO2 analog switch              enable
    def g8_io2 : Bool
      @value.bits_set?(0x20000000_u32)
    end

    # G8_IO2 analog switch              enable
    def self.g8_io2 : Bool
      value.g8_io2
    end

    # G8_IO2 analog switch              enable
    def self.g8_io2=(value : Bool) : Bool
      self.set(g8_io2: value)
      value
    end

    # G8_IO3 analog switch              enable
    def g8_io3 : Bool
      @value.bits_set?(0x40000000_u32)
    end

    # G8_IO3 analog switch              enable
    def self.g8_io3 : Bool
      value.g8_io3
    end

    # G8_IO3 analog switch              enable
    def self.g8_io3=(value : Bool) : Bool
      self.set(g8_io3: value)
      value
    end

    # G8_IO4 analog switch              enable
    def g8_io4 : Bool
      @value.bits_set?(0x80000000_u32)
    end

    # G8_IO4 analog switch              enable
    def self.g8_io4 : Bool
      value.g8_io4
    end

    # G8_IO4 analog switch              enable
    def self.g8_io4=(value : Bool) : Bool
      self.set(g8_io4: value)
      value
    end

    def copy_with(
      *,

      g1_io1 : Bool? = nil,

      g1_io2 : Bool? = nil,

      g1_io3 : Bool? = nil,

      g1_io4 : Bool? = nil,

      g2_io1 : Bool? = nil,

      g2_io2 : Bool? = nil,

      g2_io3 : Bool? = nil,

      g2_io4 : Bool? = nil,

      g3_io1 : Bool? = nil,

      g3_io2 : Bool? = nil,

      g3_io3 : Bool? = nil,

      g3_io4 : Bool? = nil,

      g4_io1 : Bool? = nil,

      g4_io2 : Bool? = nil,

      g4_io3 : Bool? = nil,

      g4_io4 : Bool? = nil,

      g5_io1 : Bool? = nil,

      g5_io2 : Bool? = nil,

      g5_io3 : Bool? = nil,

      g5_io4 : Bool? = nil,

      g6_io1 : Bool? = nil,

      g6_io2 : Bool? = nil,

      g6_io3 : Bool? = nil,

      g6_io4 : Bool? = nil,

      g7_io1 : Bool? = nil,

      g7_io2 : Bool? = nil,

      g7_io3 : Bool? = nil,

      g7_io4 : Bool? = nil,

      g8_io1 : Bool? = nil,

      g8_io2 : Bool? = nil,

      g8_io3 : Bool? = nil,

      g8_io4 : Bool? = nil
    ) : self
      value = @value

      unless g1_io1.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(g1_io1.to_int).&(0x1_u32) << 0
      end

      unless g1_io2.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(g1_io2.to_int).&(0x1_u32) << 1
      end

      unless g1_io3.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(g1_io3.to_int).&(0x1_u32) << 2
      end

      unless g1_io4.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(g1_io4.to_int).&(0x1_u32) << 3
      end

      unless g2_io1.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(g2_io1.to_int).&(0x1_u32) << 4
      end

      unless g2_io2.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(g2_io2.to_int).&(0x1_u32) << 5
      end

      unless g2_io3.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(g2_io3.to_int).&(0x1_u32) << 6
      end

      unless g2_io4.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(g2_io4.to_int).&(0x1_u32) << 7
      end

      unless g3_io1.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(g3_io1.to_int).&(0x1_u32) << 8
      end

      unless g3_io2.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(g3_io2.to_int).&(0x1_u32) << 9
      end

      unless g3_io3.nil?
        value = (value & 0xfffffbff_u32) |
                UInt32.new!(g3_io3.to_int).&(0x1_u32) << 10
      end

      unless g3_io4.nil?
        value = (value & 0xfffff7ff_u32) |
                UInt32.new!(g3_io4.to_int).&(0x1_u32) << 11
      end

      unless g4_io1.nil?
        value = (value & 0xffffefff_u32) |
                UInt32.new!(g4_io1.to_int).&(0x1_u32) << 12
      end

      unless g4_io2.nil?
        value = (value & 0xffffdfff_u32) |
                UInt32.new!(g4_io2.to_int).&(0x1_u32) << 13
      end

      unless g4_io3.nil?
        value = (value & 0xffffbfff_u32) |
                UInt32.new!(g4_io3.to_int).&(0x1_u32) << 14
      end

      unless g4_io4.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(g4_io4.to_int).&(0x1_u32) << 15
      end

      unless g5_io1.nil?
        value = (value & 0xfffeffff_u32) |
                UInt32.new!(g5_io1.to_int).&(0x1_u32) << 16
      end

      unless g5_io2.nil?
        value = (value & 0xfffdffff_u32) |
                UInt32.new!(g5_io2.to_int).&(0x1_u32) << 17
      end

      unless g5_io3.nil?
        value = (value & 0xfffbffff_u32) |
                UInt32.new!(g5_io3.to_int).&(0x1_u32) << 18
      end

      unless g5_io4.nil?
        value = (value & 0xfff7ffff_u32) |
                UInt32.new!(g5_io4.to_int).&(0x1_u32) << 19
      end

      unless g6_io1.nil?
        value = (value & 0xffefffff_u32) |
                UInt32.new!(g6_io1.to_int).&(0x1_u32) << 20
      end

      unless g6_io2.nil?
        value = (value & 0xffdfffff_u32) |
                UInt32.new!(g6_io2.to_int).&(0x1_u32) << 21
      end

      unless g6_io3.nil?
        value = (value & 0xffbfffff_u32) |
                UInt32.new!(g6_io3.to_int).&(0x1_u32) << 22
      end

      unless g6_io4.nil?
        value = (value & 0xff7fffff_u32) |
                UInt32.new!(g6_io4.to_int).&(0x1_u32) << 23
      end

      unless g7_io1.nil?
        value = (value & 0xfeffffff_u32) |
                UInt32.new!(g7_io1.to_int).&(0x1_u32) << 24
      end

      unless g7_io2.nil?
        value = (value & 0xfdffffff_u32) |
                UInt32.new!(g7_io2.to_int).&(0x1_u32) << 25
      end

      unless g7_io3.nil?
        value = (value & 0xfbffffff_u32) |
                UInt32.new!(g7_io3.to_int).&(0x1_u32) << 26
      end

      unless g7_io4.nil?
        value = (value & 0xf7ffffff_u32) |
                UInt32.new!(g7_io4.to_int).&(0x1_u32) << 27
      end

      unless g8_io1.nil?
        value = (value & 0xefffffff_u32) |
                UInt32.new!(g8_io1.to_int).&(0x1_u32) << 28
      end

      unless g8_io2.nil?
        value = (value & 0xdfffffff_u32) |
                UInt32.new!(g8_io2.to_int).&(0x1_u32) << 29
      end

      unless g8_io3.nil?
        value = (value & 0xbfffffff_u32) |
                UInt32.new!(g8_io3.to_int).&(0x1_u32) << 30
      end

      unless g8_io4.nil?
        value = (value & 0x7fffffff_u32) |
                UInt32.new!(g8_io4.to_int).&(0x1_u32) << 31
      end

      self.class.new(value)
    end

    def self.set(
      *,
      g1_io1 : Bool? = nil,
      g1_io2 : Bool? = nil,
      g1_io3 : Bool? = nil,
      g1_io4 : Bool? = nil,
      g2_io1 : Bool? = nil,
      g2_io2 : Bool? = nil,
      g2_io3 : Bool? = nil,
      g2_io4 : Bool? = nil,
      g3_io1 : Bool? = nil,
      g3_io2 : Bool? = nil,
      g3_io3 : Bool? = nil,
      g3_io4 : Bool? = nil,
      g4_io1 : Bool? = nil,
      g4_io2 : Bool? = nil,
      g4_io3 : Bool? = nil,
      g4_io4 : Bool? = nil,
      g5_io1 : Bool? = nil,
      g5_io2 : Bool? = nil,
      g5_io3 : Bool? = nil,
      g5_io4 : Bool? = nil,
      g6_io1 : Bool? = nil,
      g6_io2 : Bool? = nil,
      g6_io3 : Bool? = nil,
      g6_io4 : Bool? = nil,
      g7_io1 : Bool? = nil,
      g7_io2 : Bool? = nil,
      g7_io3 : Bool? = nil,
      g7_io4 : Bool? = nil,
      g8_io1 : Bool? = nil,
      g8_io2 : Bool? = nil,
      g8_io3 : Bool? = nil,
      g8_io4 : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        g1_io1: g1_io1,
        g1_io2: g1_io2,
        g1_io3: g1_io3,
        g1_io4: g1_io4,
        g2_io1: g2_io1,
        g2_io2: g2_io2,
        g2_io3: g2_io3,
        g2_io4: g2_io4,
        g3_io1: g3_io1,
        g3_io2: g3_io2,
        g3_io3: g3_io3,
        g3_io4: g3_io4,
        g4_io1: g4_io1,
        g4_io2: g4_io2,
        g4_io3: g4_io3,
        g4_io4: g4_io4,
        g5_io1: g5_io1,
        g5_io2: g5_io2,
        g5_io3: g5_io3,
        g5_io4: g5_io4,
        g6_io1: g6_io1,
        g6_io2: g6_io2,
        g6_io3: g6_io3,
        g6_io4: g6_io4,
        g7_io1: g7_io1,
        g7_io2: g7_io2,
        g7_io3: g7_io3,
        g7_io4: g7_io4,
        g8_io1: g8_io1,
        g8_io2: g8_io2,
        g8_io3: g8_io3,
        g8_io4: g8_io4,
      )
    end
  end # struct

  # I/O sampling control register
  struct IOSCR
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

    # G1_IO1 sampling mode
    def g1_io1 : Bool
      @value.bits_set?(0x1_u32)
    end

    # G1_IO1 sampling mode
    def self.g1_io1 : Bool
      value.g1_io1
    end

    # G1_IO1 sampling mode
    def self.g1_io1=(value : Bool) : Bool
      self.set(g1_io1: value)
      value
    end

    # G1_IO2 sampling mode
    def g1_io2 : Bool
      @value.bits_set?(0x2_u32)
    end

    # G1_IO2 sampling mode
    def self.g1_io2 : Bool
      value.g1_io2
    end

    # G1_IO2 sampling mode
    def self.g1_io2=(value : Bool) : Bool
      self.set(g1_io2: value)
      value
    end

    # G1_IO3 sampling mode
    def g1_io3 : Bool
      @value.bits_set?(0x4_u32)
    end

    # G1_IO3 sampling mode
    def self.g1_io3 : Bool
      value.g1_io3
    end

    # G1_IO3 sampling mode
    def self.g1_io3=(value : Bool) : Bool
      self.set(g1_io3: value)
      value
    end

    # G1_IO4 sampling mode
    def g1_io4 : Bool
      @value.bits_set?(0x8_u32)
    end

    # G1_IO4 sampling mode
    def self.g1_io4 : Bool
      value.g1_io4
    end

    # G1_IO4 sampling mode
    def self.g1_io4=(value : Bool) : Bool
      self.set(g1_io4: value)
      value
    end

    # G2_IO1 sampling mode
    def g2_io1 : Bool
      @value.bits_set?(0x10_u32)
    end

    # G2_IO1 sampling mode
    def self.g2_io1 : Bool
      value.g2_io1
    end

    # G2_IO1 sampling mode
    def self.g2_io1=(value : Bool) : Bool
      self.set(g2_io1: value)
      value
    end

    # G2_IO2 sampling mode
    def g2_io2 : Bool
      @value.bits_set?(0x20_u32)
    end

    # G2_IO2 sampling mode
    def self.g2_io2 : Bool
      value.g2_io2
    end

    # G2_IO2 sampling mode
    def self.g2_io2=(value : Bool) : Bool
      self.set(g2_io2: value)
      value
    end

    # G2_IO3 sampling mode
    def g2_io3 : Bool
      @value.bits_set?(0x40_u32)
    end

    # G2_IO3 sampling mode
    def self.g2_io3 : Bool
      value.g2_io3
    end

    # G2_IO3 sampling mode
    def self.g2_io3=(value : Bool) : Bool
      self.set(g2_io3: value)
      value
    end

    # G2_IO4 sampling mode
    def g2_io4 : Bool
      @value.bits_set?(0x80_u32)
    end

    # G2_IO4 sampling mode
    def self.g2_io4 : Bool
      value.g2_io4
    end

    # G2_IO4 sampling mode
    def self.g2_io4=(value : Bool) : Bool
      self.set(g2_io4: value)
      value
    end

    # G3_IO1 sampling mode
    def g3_io1 : Bool
      @value.bits_set?(0x100_u32)
    end

    # G3_IO1 sampling mode
    def self.g3_io1 : Bool
      value.g3_io1
    end

    # G3_IO1 sampling mode
    def self.g3_io1=(value : Bool) : Bool
      self.set(g3_io1: value)
      value
    end

    # G3_IO2 sampling mode
    def g3_io2 : Bool
      @value.bits_set?(0x200_u32)
    end

    # G3_IO2 sampling mode
    def self.g3_io2 : Bool
      value.g3_io2
    end

    # G3_IO2 sampling mode
    def self.g3_io2=(value : Bool) : Bool
      self.set(g3_io2: value)
      value
    end

    # G3_IO3 sampling mode
    def g3_io3 : Bool
      @value.bits_set?(0x400_u32)
    end

    # G3_IO3 sampling mode
    def self.g3_io3 : Bool
      value.g3_io3
    end

    # G3_IO3 sampling mode
    def self.g3_io3=(value : Bool) : Bool
      self.set(g3_io3: value)
      value
    end

    # G3_IO4 sampling mode
    def g3_io4 : Bool
      @value.bits_set?(0x800_u32)
    end

    # G3_IO4 sampling mode
    def self.g3_io4 : Bool
      value.g3_io4
    end

    # G3_IO4 sampling mode
    def self.g3_io4=(value : Bool) : Bool
      self.set(g3_io4: value)
      value
    end

    # G4_IO1 sampling mode
    def g4_io1 : Bool
      @value.bits_set?(0x1000_u32)
    end

    # G4_IO1 sampling mode
    def self.g4_io1 : Bool
      value.g4_io1
    end

    # G4_IO1 sampling mode
    def self.g4_io1=(value : Bool) : Bool
      self.set(g4_io1: value)
      value
    end

    # G4_IO2 sampling mode
    def g4_io2 : Bool
      @value.bits_set?(0x2000_u32)
    end

    # G4_IO2 sampling mode
    def self.g4_io2 : Bool
      value.g4_io2
    end

    # G4_IO2 sampling mode
    def self.g4_io2=(value : Bool) : Bool
      self.set(g4_io2: value)
      value
    end

    # G4_IO3 sampling mode
    def g4_io3 : Bool
      @value.bits_set?(0x4000_u32)
    end

    # G4_IO3 sampling mode
    def self.g4_io3 : Bool
      value.g4_io3
    end

    # G4_IO3 sampling mode
    def self.g4_io3=(value : Bool) : Bool
      self.set(g4_io3: value)
      value
    end

    # G4_IO4 sampling mode
    def g4_io4 : Bool
      @value.bits_set?(0x8000_u32)
    end

    # G4_IO4 sampling mode
    def self.g4_io4 : Bool
      value.g4_io4
    end

    # G4_IO4 sampling mode
    def self.g4_io4=(value : Bool) : Bool
      self.set(g4_io4: value)
      value
    end

    # G5_IO1 sampling mode
    def g5_io1 : Bool
      @value.bits_set?(0x10000_u32)
    end

    # G5_IO1 sampling mode
    def self.g5_io1 : Bool
      value.g5_io1
    end

    # G5_IO1 sampling mode
    def self.g5_io1=(value : Bool) : Bool
      self.set(g5_io1: value)
      value
    end

    # G5_IO2 sampling mode
    def g5_io2 : Bool
      @value.bits_set?(0x20000_u32)
    end

    # G5_IO2 sampling mode
    def self.g5_io2 : Bool
      value.g5_io2
    end

    # G5_IO2 sampling mode
    def self.g5_io2=(value : Bool) : Bool
      self.set(g5_io2: value)
      value
    end

    # G5_IO3 sampling mode
    def g5_io3 : Bool
      @value.bits_set?(0x40000_u32)
    end

    # G5_IO3 sampling mode
    def self.g5_io3 : Bool
      value.g5_io3
    end

    # G5_IO3 sampling mode
    def self.g5_io3=(value : Bool) : Bool
      self.set(g5_io3: value)
      value
    end

    # G5_IO4 sampling mode
    def g5_io4 : Bool
      @value.bits_set?(0x80000_u32)
    end

    # G5_IO4 sampling mode
    def self.g5_io4 : Bool
      value.g5_io4
    end

    # G5_IO4 sampling mode
    def self.g5_io4=(value : Bool) : Bool
      self.set(g5_io4: value)
      value
    end

    # G6_IO1 sampling mode
    def g6_io1 : Bool
      @value.bits_set?(0x100000_u32)
    end

    # G6_IO1 sampling mode
    def self.g6_io1 : Bool
      value.g6_io1
    end

    # G6_IO1 sampling mode
    def self.g6_io1=(value : Bool) : Bool
      self.set(g6_io1: value)
      value
    end

    # G6_IO2 sampling mode
    def g6_io2 : Bool
      @value.bits_set?(0x200000_u32)
    end

    # G6_IO2 sampling mode
    def self.g6_io2 : Bool
      value.g6_io2
    end

    # G6_IO2 sampling mode
    def self.g6_io2=(value : Bool) : Bool
      self.set(g6_io2: value)
      value
    end

    # G6_IO3 sampling mode
    def g6_io3 : Bool
      @value.bits_set?(0x400000_u32)
    end

    # G6_IO3 sampling mode
    def self.g6_io3 : Bool
      value.g6_io3
    end

    # G6_IO3 sampling mode
    def self.g6_io3=(value : Bool) : Bool
      self.set(g6_io3: value)
      value
    end

    # G6_IO4 sampling mode
    def g6_io4 : Bool
      @value.bits_set?(0x800000_u32)
    end

    # G6_IO4 sampling mode
    def self.g6_io4 : Bool
      value.g6_io4
    end

    # G6_IO4 sampling mode
    def self.g6_io4=(value : Bool) : Bool
      self.set(g6_io4: value)
      value
    end

    # G7_IO1 sampling mode
    def g7_io1 : Bool
      @value.bits_set?(0x1000000_u32)
    end

    # G7_IO1 sampling mode
    def self.g7_io1 : Bool
      value.g7_io1
    end

    # G7_IO1 sampling mode
    def self.g7_io1=(value : Bool) : Bool
      self.set(g7_io1: value)
      value
    end

    # G7_IO2 sampling mode
    def g7_io2 : Bool
      @value.bits_set?(0x2000000_u32)
    end

    # G7_IO2 sampling mode
    def self.g7_io2 : Bool
      value.g7_io2
    end

    # G7_IO2 sampling mode
    def self.g7_io2=(value : Bool) : Bool
      self.set(g7_io2: value)
      value
    end

    # G7_IO3 sampling mode
    def g7_io3 : Bool
      @value.bits_set?(0x4000000_u32)
    end

    # G7_IO3 sampling mode
    def self.g7_io3 : Bool
      value.g7_io3
    end

    # G7_IO3 sampling mode
    def self.g7_io3=(value : Bool) : Bool
      self.set(g7_io3: value)
      value
    end

    # G7_IO4 sampling mode
    def g7_io4 : Bool
      @value.bits_set?(0x8000000_u32)
    end

    # G7_IO4 sampling mode
    def self.g7_io4 : Bool
      value.g7_io4
    end

    # G7_IO4 sampling mode
    def self.g7_io4=(value : Bool) : Bool
      self.set(g7_io4: value)
      value
    end

    # G8_IO1 sampling mode
    def g8_io1 : Bool
      @value.bits_set?(0x10000000_u32)
    end

    # G8_IO1 sampling mode
    def self.g8_io1 : Bool
      value.g8_io1
    end

    # G8_IO1 sampling mode
    def self.g8_io1=(value : Bool) : Bool
      self.set(g8_io1: value)
      value
    end

    # G8_IO2 sampling mode
    def g8_io2 : Bool
      @value.bits_set?(0x20000000_u32)
    end

    # G8_IO2 sampling mode
    def self.g8_io2 : Bool
      value.g8_io2
    end

    # G8_IO2 sampling mode
    def self.g8_io2=(value : Bool) : Bool
      self.set(g8_io2: value)
      value
    end

    # G8_IO3 sampling mode
    def g8_io3 : Bool
      @value.bits_set?(0x40000000_u32)
    end

    # G8_IO3 sampling mode
    def self.g8_io3 : Bool
      value.g8_io3
    end

    # G8_IO3 sampling mode
    def self.g8_io3=(value : Bool) : Bool
      self.set(g8_io3: value)
      value
    end

    # G8_IO4 sampling mode
    def g8_io4 : Bool
      @value.bits_set?(0x80000000_u32)
    end

    # G8_IO4 sampling mode
    def self.g8_io4 : Bool
      value.g8_io4
    end

    # G8_IO4 sampling mode
    def self.g8_io4=(value : Bool) : Bool
      self.set(g8_io4: value)
      value
    end

    def copy_with(
      *,

      g1_io1 : Bool? = nil,

      g1_io2 : Bool? = nil,

      g1_io3 : Bool? = nil,

      g1_io4 : Bool? = nil,

      g2_io1 : Bool? = nil,

      g2_io2 : Bool? = nil,

      g2_io3 : Bool? = nil,

      g2_io4 : Bool? = nil,

      g3_io1 : Bool? = nil,

      g3_io2 : Bool? = nil,

      g3_io3 : Bool? = nil,

      g3_io4 : Bool? = nil,

      g4_io1 : Bool? = nil,

      g4_io2 : Bool? = nil,

      g4_io3 : Bool? = nil,

      g4_io4 : Bool? = nil,

      g5_io1 : Bool? = nil,

      g5_io2 : Bool? = nil,

      g5_io3 : Bool? = nil,

      g5_io4 : Bool? = nil,

      g6_io1 : Bool? = nil,

      g6_io2 : Bool? = nil,

      g6_io3 : Bool? = nil,

      g6_io4 : Bool? = nil,

      g7_io1 : Bool? = nil,

      g7_io2 : Bool? = nil,

      g7_io3 : Bool? = nil,

      g7_io4 : Bool? = nil,

      g8_io1 : Bool? = nil,

      g8_io2 : Bool? = nil,

      g8_io3 : Bool? = nil,

      g8_io4 : Bool? = nil
    ) : self
      value = @value

      unless g1_io1.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(g1_io1.to_int).&(0x1_u32) << 0
      end

      unless g1_io2.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(g1_io2.to_int).&(0x1_u32) << 1
      end

      unless g1_io3.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(g1_io3.to_int).&(0x1_u32) << 2
      end

      unless g1_io4.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(g1_io4.to_int).&(0x1_u32) << 3
      end

      unless g2_io1.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(g2_io1.to_int).&(0x1_u32) << 4
      end

      unless g2_io2.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(g2_io2.to_int).&(0x1_u32) << 5
      end

      unless g2_io3.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(g2_io3.to_int).&(0x1_u32) << 6
      end

      unless g2_io4.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(g2_io4.to_int).&(0x1_u32) << 7
      end

      unless g3_io1.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(g3_io1.to_int).&(0x1_u32) << 8
      end

      unless g3_io2.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(g3_io2.to_int).&(0x1_u32) << 9
      end

      unless g3_io3.nil?
        value = (value & 0xfffffbff_u32) |
                UInt32.new!(g3_io3.to_int).&(0x1_u32) << 10
      end

      unless g3_io4.nil?
        value = (value & 0xfffff7ff_u32) |
                UInt32.new!(g3_io4.to_int).&(0x1_u32) << 11
      end

      unless g4_io1.nil?
        value = (value & 0xffffefff_u32) |
                UInt32.new!(g4_io1.to_int).&(0x1_u32) << 12
      end

      unless g4_io2.nil?
        value = (value & 0xffffdfff_u32) |
                UInt32.new!(g4_io2.to_int).&(0x1_u32) << 13
      end

      unless g4_io3.nil?
        value = (value & 0xffffbfff_u32) |
                UInt32.new!(g4_io3.to_int).&(0x1_u32) << 14
      end

      unless g4_io4.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(g4_io4.to_int).&(0x1_u32) << 15
      end

      unless g5_io1.nil?
        value = (value & 0xfffeffff_u32) |
                UInt32.new!(g5_io1.to_int).&(0x1_u32) << 16
      end

      unless g5_io2.nil?
        value = (value & 0xfffdffff_u32) |
                UInt32.new!(g5_io2.to_int).&(0x1_u32) << 17
      end

      unless g5_io3.nil?
        value = (value & 0xfffbffff_u32) |
                UInt32.new!(g5_io3.to_int).&(0x1_u32) << 18
      end

      unless g5_io4.nil?
        value = (value & 0xfff7ffff_u32) |
                UInt32.new!(g5_io4.to_int).&(0x1_u32) << 19
      end

      unless g6_io1.nil?
        value = (value & 0xffefffff_u32) |
                UInt32.new!(g6_io1.to_int).&(0x1_u32) << 20
      end

      unless g6_io2.nil?
        value = (value & 0xffdfffff_u32) |
                UInt32.new!(g6_io2.to_int).&(0x1_u32) << 21
      end

      unless g6_io3.nil?
        value = (value & 0xffbfffff_u32) |
                UInt32.new!(g6_io3.to_int).&(0x1_u32) << 22
      end

      unless g6_io4.nil?
        value = (value & 0xff7fffff_u32) |
                UInt32.new!(g6_io4.to_int).&(0x1_u32) << 23
      end

      unless g7_io1.nil?
        value = (value & 0xfeffffff_u32) |
                UInt32.new!(g7_io1.to_int).&(0x1_u32) << 24
      end

      unless g7_io2.nil?
        value = (value & 0xfdffffff_u32) |
                UInt32.new!(g7_io2.to_int).&(0x1_u32) << 25
      end

      unless g7_io3.nil?
        value = (value & 0xfbffffff_u32) |
                UInt32.new!(g7_io3.to_int).&(0x1_u32) << 26
      end

      unless g7_io4.nil?
        value = (value & 0xf7ffffff_u32) |
                UInt32.new!(g7_io4.to_int).&(0x1_u32) << 27
      end

      unless g8_io1.nil?
        value = (value & 0xefffffff_u32) |
                UInt32.new!(g8_io1.to_int).&(0x1_u32) << 28
      end

      unless g8_io2.nil?
        value = (value & 0xdfffffff_u32) |
                UInt32.new!(g8_io2.to_int).&(0x1_u32) << 29
      end

      unless g8_io3.nil?
        value = (value & 0xbfffffff_u32) |
                UInt32.new!(g8_io3.to_int).&(0x1_u32) << 30
      end

      unless g8_io4.nil?
        value = (value & 0x7fffffff_u32) |
                UInt32.new!(g8_io4.to_int).&(0x1_u32) << 31
      end

      self.class.new(value)
    end

    def self.set(
      *,
      g1_io1 : Bool? = nil,
      g1_io2 : Bool? = nil,
      g1_io3 : Bool? = nil,
      g1_io4 : Bool? = nil,
      g2_io1 : Bool? = nil,
      g2_io2 : Bool? = nil,
      g2_io3 : Bool? = nil,
      g2_io4 : Bool? = nil,
      g3_io1 : Bool? = nil,
      g3_io2 : Bool? = nil,
      g3_io3 : Bool? = nil,
      g3_io4 : Bool? = nil,
      g4_io1 : Bool? = nil,
      g4_io2 : Bool? = nil,
      g4_io3 : Bool? = nil,
      g4_io4 : Bool? = nil,
      g5_io1 : Bool? = nil,
      g5_io2 : Bool? = nil,
      g5_io3 : Bool? = nil,
      g5_io4 : Bool? = nil,
      g6_io1 : Bool? = nil,
      g6_io2 : Bool? = nil,
      g6_io3 : Bool? = nil,
      g6_io4 : Bool? = nil,
      g7_io1 : Bool? = nil,
      g7_io2 : Bool? = nil,
      g7_io3 : Bool? = nil,
      g7_io4 : Bool? = nil,
      g8_io1 : Bool? = nil,
      g8_io2 : Bool? = nil,
      g8_io3 : Bool? = nil,
      g8_io4 : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        g1_io1: g1_io1,
        g1_io2: g1_io2,
        g1_io3: g1_io3,
        g1_io4: g1_io4,
        g2_io1: g2_io1,
        g2_io2: g2_io2,
        g2_io3: g2_io3,
        g2_io4: g2_io4,
        g3_io1: g3_io1,
        g3_io2: g3_io2,
        g3_io3: g3_io3,
        g3_io4: g3_io4,
        g4_io1: g4_io1,
        g4_io2: g4_io2,
        g4_io3: g4_io3,
        g4_io4: g4_io4,
        g5_io1: g5_io1,
        g5_io2: g5_io2,
        g5_io3: g5_io3,
        g5_io4: g5_io4,
        g6_io1: g6_io1,
        g6_io2: g6_io2,
        g6_io3: g6_io3,
        g6_io4: g6_io4,
        g7_io1: g7_io1,
        g7_io2: g7_io2,
        g7_io3: g7_io3,
        g7_io4: g7_io4,
        g8_io1: g8_io1,
        g8_io2: g8_io2,
        g8_io3: g8_io3,
        g8_io4: g8_io4,
      )
    end
  end # struct

  # I/O channel control register
  struct IOCCR
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

    # G1_IO1 channel mode
    def g1_io1 : Bool
      @value.bits_set?(0x1_u32)
    end

    # G1_IO1 channel mode
    def self.g1_io1 : Bool
      value.g1_io1
    end

    # G1_IO1 channel mode
    def self.g1_io1=(value : Bool) : Bool
      self.set(g1_io1: value)
      value
    end

    # G1_IO2 channel mode
    def g1_io2 : Bool
      @value.bits_set?(0x2_u32)
    end

    # G1_IO2 channel mode
    def self.g1_io2 : Bool
      value.g1_io2
    end

    # G1_IO2 channel mode
    def self.g1_io2=(value : Bool) : Bool
      self.set(g1_io2: value)
      value
    end

    # G1_IO3 channel mode
    def g1_io3 : Bool
      @value.bits_set?(0x4_u32)
    end

    # G1_IO3 channel mode
    def self.g1_io3 : Bool
      value.g1_io3
    end

    # G1_IO3 channel mode
    def self.g1_io3=(value : Bool) : Bool
      self.set(g1_io3: value)
      value
    end

    # G1_IO4 channel mode
    def g1_io4 : Bool
      @value.bits_set?(0x8_u32)
    end

    # G1_IO4 channel mode
    def self.g1_io4 : Bool
      value.g1_io4
    end

    # G1_IO4 channel mode
    def self.g1_io4=(value : Bool) : Bool
      self.set(g1_io4: value)
      value
    end

    # G2_IO1 channel mode
    def g2_io1 : Bool
      @value.bits_set?(0x10_u32)
    end

    # G2_IO1 channel mode
    def self.g2_io1 : Bool
      value.g2_io1
    end

    # G2_IO1 channel mode
    def self.g2_io1=(value : Bool) : Bool
      self.set(g2_io1: value)
      value
    end

    # G2_IO2 channel mode
    def g2_io2 : Bool
      @value.bits_set?(0x20_u32)
    end

    # G2_IO2 channel mode
    def self.g2_io2 : Bool
      value.g2_io2
    end

    # G2_IO2 channel mode
    def self.g2_io2=(value : Bool) : Bool
      self.set(g2_io2: value)
      value
    end

    # G2_IO3 channel mode
    def g2_io3 : Bool
      @value.bits_set?(0x40_u32)
    end

    # G2_IO3 channel mode
    def self.g2_io3 : Bool
      value.g2_io3
    end

    # G2_IO3 channel mode
    def self.g2_io3=(value : Bool) : Bool
      self.set(g2_io3: value)
      value
    end

    # G2_IO4 channel mode
    def g2_io4 : Bool
      @value.bits_set?(0x80_u32)
    end

    # G2_IO4 channel mode
    def self.g2_io4 : Bool
      value.g2_io4
    end

    # G2_IO4 channel mode
    def self.g2_io4=(value : Bool) : Bool
      self.set(g2_io4: value)
      value
    end

    # G3_IO1 channel mode
    def g3_io1 : Bool
      @value.bits_set?(0x100_u32)
    end

    # G3_IO1 channel mode
    def self.g3_io1 : Bool
      value.g3_io1
    end

    # G3_IO1 channel mode
    def self.g3_io1=(value : Bool) : Bool
      self.set(g3_io1: value)
      value
    end

    # G3_IO2 channel mode
    def g3_io2 : Bool
      @value.bits_set?(0x200_u32)
    end

    # G3_IO2 channel mode
    def self.g3_io2 : Bool
      value.g3_io2
    end

    # G3_IO2 channel mode
    def self.g3_io2=(value : Bool) : Bool
      self.set(g3_io2: value)
      value
    end

    # G3_IO3 channel mode
    def g3_io3 : Bool
      @value.bits_set?(0x400_u32)
    end

    # G3_IO3 channel mode
    def self.g3_io3 : Bool
      value.g3_io3
    end

    # G3_IO3 channel mode
    def self.g3_io3=(value : Bool) : Bool
      self.set(g3_io3: value)
      value
    end

    # G3_IO4 channel mode
    def g3_io4 : Bool
      @value.bits_set?(0x800_u32)
    end

    # G3_IO4 channel mode
    def self.g3_io4 : Bool
      value.g3_io4
    end

    # G3_IO4 channel mode
    def self.g3_io4=(value : Bool) : Bool
      self.set(g3_io4: value)
      value
    end

    # G4_IO1 channel mode
    def g4_io1 : Bool
      @value.bits_set?(0x1000_u32)
    end

    # G4_IO1 channel mode
    def self.g4_io1 : Bool
      value.g4_io1
    end

    # G4_IO1 channel mode
    def self.g4_io1=(value : Bool) : Bool
      self.set(g4_io1: value)
      value
    end

    # G4_IO2 channel mode
    def g4_io2 : Bool
      @value.bits_set?(0x2000_u32)
    end

    # G4_IO2 channel mode
    def self.g4_io2 : Bool
      value.g4_io2
    end

    # G4_IO2 channel mode
    def self.g4_io2=(value : Bool) : Bool
      self.set(g4_io2: value)
      value
    end

    # G4_IO3 channel mode
    def g4_io3 : Bool
      @value.bits_set?(0x4000_u32)
    end

    # G4_IO3 channel mode
    def self.g4_io3 : Bool
      value.g4_io3
    end

    # G4_IO3 channel mode
    def self.g4_io3=(value : Bool) : Bool
      self.set(g4_io3: value)
      value
    end

    # G4_IO4 channel mode
    def g4_io4 : Bool
      @value.bits_set?(0x8000_u32)
    end

    # G4_IO4 channel mode
    def self.g4_io4 : Bool
      value.g4_io4
    end

    # G4_IO4 channel mode
    def self.g4_io4=(value : Bool) : Bool
      self.set(g4_io4: value)
      value
    end

    # G5_IO1 channel mode
    def g5_io1 : Bool
      @value.bits_set?(0x10000_u32)
    end

    # G5_IO1 channel mode
    def self.g5_io1 : Bool
      value.g5_io1
    end

    # G5_IO1 channel mode
    def self.g5_io1=(value : Bool) : Bool
      self.set(g5_io1: value)
      value
    end

    # G5_IO2 channel mode
    def g5_io2 : Bool
      @value.bits_set?(0x20000_u32)
    end

    # G5_IO2 channel mode
    def self.g5_io2 : Bool
      value.g5_io2
    end

    # G5_IO2 channel mode
    def self.g5_io2=(value : Bool) : Bool
      self.set(g5_io2: value)
      value
    end

    # G5_IO3 channel mode
    def g5_io3 : Bool
      @value.bits_set?(0x40000_u32)
    end

    # G5_IO3 channel mode
    def self.g5_io3 : Bool
      value.g5_io3
    end

    # G5_IO3 channel mode
    def self.g5_io3=(value : Bool) : Bool
      self.set(g5_io3: value)
      value
    end

    # G5_IO4 channel mode
    def g5_io4 : Bool
      @value.bits_set?(0x80000_u32)
    end

    # G5_IO4 channel mode
    def self.g5_io4 : Bool
      value.g5_io4
    end

    # G5_IO4 channel mode
    def self.g5_io4=(value : Bool) : Bool
      self.set(g5_io4: value)
      value
    end

    # G6_IO1 channel mode
    def g6_io1 : Bool
      @value.bits_set?(0x100000_u32)
    end

    # G6_IO1 channel mode
    def self.g6_io1 : Bool
      value.g6_io1
    end

    # G6_IO1 channel mode
    def self.g6_io1=(value : Bool) : Bool
      self.set(g6_io1: value)
      value
    end

    # G6_IO2 channel mode
    def g6_io2 : Bool
      @value.bits_set?(0x200000_u32)
    end

    # G6_IO2 channel mode
    def self.g6_io2 : Bool
      value.g6_io2
    end

    # G6_IO2 channel mode
    def self.g6_io2=(value : Bool) : Bool
      self.set(g6_io2: value)
      value
    end

    # G6_IO3 channel mode
    def g6_io3 : Bool
      @value.bits_set?(0x400000_u32)
    end

    # G6_IO3 channel mode
    def self.g6_io3 : Bool
      value.g6_io3
    end

    # G6_IO3 channel mode
    def self.g6_io3=(value : Bool) : Bool
      self.set(g6_io3: value)
      value
    end

    # G6_IO4 channel mode
    def g6_io4 : Bool
      @value.bits_set?(0x800000_u32)
    end

    # G6_IO4 channel mode
    def self.g6_io4 : Bool
      value.g6_io4
    end

    # G6_IO4 channel mode
    def self.g6_io4=(value : Bool) : Bool
      self.set(g6_io4: value)
      value
    end

    # G7_IO1 channel mode
    def g7_io1 : Bool
      @value.bits_set?(0x1000000_u32)
    end

    # G7_IO1 channel mode
    def self.g7_io1 : Bool
      value.g7_io1
    end

    # G7_IO1 channel mode
    def self.g7_io1=(value : Bool) : Bool
      self.set(g7_io1: value)
      value
    end

    # G7_IO2 channel mode
    def g7_io2 : Bool
      @value.bits_set?(0x2000000_u32)
    end

    # G7_IO2 channel mode
    def self.g7_io2 : Bool
      value.g7_io2
    end

    # G7_IO2 channel mode
    def self.g7_io2=(value : Bool) : Bool
      self.set(g7_io2: value)
      value
    end

    # G7_IO3 channel mode
    def g7_io3 : Bool
      @value.bits_set?(0x4000000_u32)
    end

    # G7_IO3 channel mode
    def self.g7_io3 : Bool
      value.g7_io3
    end

    # G7_IO3 channel mode
    def self.g7_io3=(value : Bool) : Bool
      self.set(g7_io3: value)
      value
    end

    # G7_IO4 channel mode
    def g7_io4 : Bool
      @value.bits_set?(0x8000000_u32)
    end

    # G7_IO4 channel mode
    def self.g7_io4 : Bool
      value.g7_io4
    end

    # G7_IO4 channel mode
    def self.g7_io4=(value : Bool) : Bool
      self.set(g7_io4: value)
      value
    end

    # G8_IO1 channel mode
    def g8_io1 : Bool
      @value.bits_set?(0x10000000_u32)
    end

    # G8_IO1 channel mode
    def self.g8_io1 : Bool
      value.g8_io1
    end

    # G8_IO1 channel mode
    def self.g8_io1=(value : Bool) : Bool
      self.set(g8_io1: value)
      value
    end

    # G8_IO2 channel mode
    def g8_io2 : Bool
      @value.bits_set?(0x20000000_u32)
    end

    # G8_IO2 channel mode
    def self.g8_io2 : Bool
      value.g8_io2
    end

    # G8_IO2 channel mode
    def self.g8_io2=(value : Bool) : Bool
      self.set(g8_io2: value)
      value
    end

    # G8_IO3 channel mode
    def g8_io3 : Bool
      @value.bits_set?(0x40000000_u32)
    end

    # G8_IO3 channel mode
    def self.g8_io3 : Bool
      value.g8_io3
    end

    # G8_IO3 channel mode
    def self.g8_io3=(value : Bool) : Bool
      self.set(g8_io3: value)
      value
    end

    # G8_IO4 channel mode
    def g8_io4 : Bool
      @value.bits_set?(0x80000000_u32)
    end

    # G8_IO4 channel mode
    def self.g8_io4 : Bool
      value.g8_io4
    end

    # G8_IO4 channel mode
    def self.g8_io4=(value : Bool) : Bool
      self.set(g8_io4: value)
      value
    end

    def copy_with(
      *,

      g1_io1 : Bool? = nil,

      g1_io2 : Bool? = nil,

      g1_io3 : Bool? = nil,

      g1_io4 : Bool? = nil,

      g2_io1 : Bool? = nil,

      g2_io2 : Bool? = nil,

      g2_io3 : Bool? = nil,

      g2_io4 : Bool? = nil,

      g3_io1 : Bool? = nil,

      g3_io2 : Bool? = nil,

      g3_io3 : Bool? = nil,

      g3_io4 : Bool? = nil,

      g4_io1 : Bool? = nil,

      g4_io2 : Bool? = nil,

      g4_io3 : Bool? = nil,

      g4_io4 : Bool? = nil,

      g5_io1 : Bool? = nil,

      g5_io2 : Bool? = nil,

      g5_io3 : Bool? = nil,

      g5_io4 : Bool? = nil,

      g6_io1 : Bool? = nil,

      g6_io2 : Bool? = nil,

      g6_io3 : Bool? = nil,

      g6_io4 : Bool? = nil,

      g7_io1 : Bool? = nil,

      g7_io2 : Bool? = nil,

      g7_io3 : Bool? = nil,

      g7_io4 : Bool? = nil,

      g8_io1 : Bool? = nil,

      g8_io2 : Bool? = nil,

      g8_io3 : Bool? = nil,

      g8_io4 : Bool? = nil
    ) : self
      value = @value

      unless g1_io1.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(g1_io1.to_int).&(0x1_u32) << 0
      end

      unless g1_io2.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(g1_io2.to_int).&(0x1_u32) << 1
      end

      unless g1_io3.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(g1_io3.to_int).&(0x1_u32) << 2
      end

      unless g1_io4.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(g1_io4.to_int).&(0x1_u32) << 3
      end

      unless g2_io1.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(g2_io1.to_int).&(0x1_u32) << 4
      end

      unless g2_io2.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(g2_io2.to_int).&(0x1_u32) << 5
      end

      unless g2_io3.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(g2_io3.to_int).&(0x1_u32) << 6
      end

      unless g2_io4.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(g2_io4.to_int).&(0x1_u32) << 7
      end

      unless g3_io1.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(g3_io1.to_int).&(0x1_u32) << 8
      end

      unless g3_io2.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(g3_io2.to_int).&(0x1_u32) << 9
      end

      unless g3_io3.nil?
        value = (value & 0xfffffbff_u32) |
                UInt32.new!(g3_io3.to_int).&(0x1_u32) << 10
      end

      unless g3_io4.nil?
        value = (value & 0xfffff7ff_u32) |
                UInt32.new!(g3_io4.to_int).&(0x1_u32) << 11
      end

      unless g4_io1.nil?
        value = (value & 0xffffefff_u32) |
                UInt32.new!(g4_io1.to_int).&(0x1_u32) << 12
      end

      unless g4_io2.nil?
        value = (value & 0xffffdfff_u32) |
                UInt32.new!(g4_io2.to_int).&(0x1_u32) << 13
      end

      unless g4_io3.nil?
        value = (value & 0xffffbfff_u32) |
                UInt32.new!(g4_io3.to_int).&(0x1_u32) << 14
      end

      unless g4_io4.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(g4_io4.to_int).&(0x1_u32) << 15
      end

      unless g5_io1.nil?
        value = (value & 0xfffeffff_u32) |
                UInt32.new!(g5_io1.to_int).&(0x1_u32) << 16
      end

      unless g5_io2.nil?
        value = (value & 0xfffdffff_u32) |
                UInt32.new!(g5_io2.to_int).&(0x1_u32) << 17
      end

      unless g5_io3.nil?
        value = (value & 0xfffbffff_u32) |
                UInt32.new!(g5_io3.to_int).&(0x1_u32) << 18
      end

      unless g5_io4.nil?
        value = (value & 0xfff7ffff_u32) |
                UInt32.new!(g5_io4.to_int).&(0x1_u32) << 19
      end

      unless g6_io1.nil?
        value = (value & 0xffefffff_u32) |
                UInt32.new!(g6_io1.to_int).&(0x1_u32) << 20
      end

      unless g6_io2.nil?
        value = (value & 0xffdfffff_u32) |
                UInt32.new!(g6_io2.to_int).&(0x1_u32) << 21
      end

      unless g6_io3.nil?
        value = (value & 0xffbfffff_u32) |
                UInt32.new!(g6_io3.to_int).&(0x1_u32) << 22
      end

      unless g6_io4.nil?
        value = (value & 0xff7fffff_u32) |
                UInt32.new!(g6_io4.to_int).&(0x1_u32) << 23
      end

      unless g7_io1.nil?
        value = (value & 0xfeffffff_u32) |
                UInt32.new!(g7_io1.to_int).&(0x1_u32) << 24
      end

      unless g7_io2.nil?
        value = (value & 0xfdffffff_u32) |
                UInt32.new!(g7_io2.to_int).&(0x1_u32) << 25
      end

      unless g7_io3.nil?
        value = (value & 0xfbffffff_u32) |
                UInt32.new!(g7_io3.to_int).&(0x1_u32) << 26
      end

      unless g7_io4.nil?
        value = (value & 0xf7ffffff_u32) |
                UInt32.new!(g7_io4.to_int).&(0x1_u32) << 27
      end

      unless g8_io1.nil?
        value = (value & 0xefffffff_u32) |
                UInt32.new!(g8_io1.to_int).&(0x1_u32) << 28
      end

      unless g8_io2.nil?
        value = (value & 0xdfffffff_u32) |
                UInt32.new!(g8_io2.to_int).&(0x1_u32) << 29
      end

      unless g8_io3.nil?
        value = (value & 0xbfffffff_u32) |
                UInt32.new!(g8_io3.to_int).&(0x1_u32) << 30
      end

      unless g8_io4.nil?
        value = (value & 0x7fffffff_u32) |
                UInt32.new!(g8_io4.to_int).&(0x1_u32) << 31
      end

      self.class.new(value)
    end

    def self.set(
      *,
      g1_io1 : Bool? = nil,
      g1_io2 : Bool? = nil,
      g1_io3 : Bool? = nil,
      g1_io4 : Bool? = nil,
      g2_io1 : Bool? = nil,
      g2_io2 : Bool? = nil,
      g2_io3 : Bool? = nil,
      g2_io4 : Bool? = nil,
      g3_io1 : Bool? = nil,
      g3_io2 : Bool? = nil,
      g3_io3 : Bool? = nil,
      g3_io4 : Bool? = nil,
      g4_io1 : Bool? = nil,
      g4_io2 : Bool? = nil,
      g4_io3 : Bool? = nil,
      g4_io4 : Bool? = nil,
      g5_io1 : Bool? = nil,
      g5_io2 : Bool? = nil,
      g5_io3 : Bool? = nil,
      g5_io4 : Bool? = nil,
      g6_io1 : Bool? = nil,
      g6_io2 : Bool? = nil,
      g6_io3 : Bool? = nil,
      g6_io4 : Bool? = nil,
      g7_io1 : Bool? = nil,
      g7_io2 : Bool? = nil,
      g7_io3 : Bool? = nil,
      g7_io4 : Bool? = nil,
      g8_io1 : Bool? = nil,
      g8_io2 : Bool? = nil,
      g8_io3 : Bool? = nil,
      g8_io4 : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        g1_io1: g1_io1,
        g1_io2: g1_io2,
        g1_io3: g1_io3,
        g1_io4: g1_io4,
        g2_io1: g2_io1,
        g2_io2: g2_io2,
        g2_io3: g2_io3,
        g2_io4: g2_io4,
        g3_io1: g3_io1,
        g3_io2: g3_io2,
        g3_io3: g3_io3,
        g3_io4: g3_io4,
        g4_io1: g4_io1,
        g4_io2: g4_io2,
        g4_io3: g4_io3,
        g4_io4: g4_io4,
        g5_io1: g5_io1,
        g5_io2: g5_io2,
        g5_io3: g5_io3,
        g5_io4: g5_io4,
        g6_io1: g6_io1,
        g6_io2: g6_io2,
        g6_io3: g6_io3,
        g6_io4: g6_io4,
        g7_io1: g7_io1,
        g7_io2: g7_io2,
        g7_io3: g7_io3,
        g7_io4: g7_io4,
        g8_io1: g8_io1,
        g8_io2: g8_io2,
        g8_io3: g8_io3,
        g8_io4: g8_io4,
      )
    end
  end # struct

  # I/O group control status          register
  struct IOGCSR
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

    # Analog I/O group x status
    def g8_s : Bool
      @value.bits_set?(0x800000_u32)
    end

    # Analog I/O group x status
    def self.g8_s : Bool
      value.g8_s
    end

    # Analog I/O group x status
    def self.g8_s=(value : Bool) : Bool
      self.set(g8_s: value)
      value
    end

    # Analog I/O group x status
    def g7_s : Bool
      @value.bits_set?(0x400000_u32)
    end

    # Analog I/O group x status
    def self.g7_s : Bool
      value.g7_s
    end

    # Analog I/O group x status
    def self.g7_s=(value : Bool) : Bool
      self.set(g7_s: value)
      value
    end

    # Analog I/O group x status
    def g6_s : Bool
      @value.bits_set?(0x200000_u32)
    end

    # Analog I/O group x status
    def self.g6_s : Bool
      value.g6_s
    end

    # Analog I/O group x status
    def g5_s : Bool
      @value.bits_set?(0x100000_u32)
    end

    # Analog I/O group x status
    def self.g5_s : Bool
      value.g5_s
    end

    # Analog I/O group x status
    def g4_s : Bool
      @value.bits_set?(0x80000_u32)
    end

    # Analog I/O group x status
    def self.g4_s : Bool
      value.g4_s
    end

    # Analog I/O group x status
    def g3_s : Bool
      @value.bits_set?(0x40000_u32)
    end

    # Analog I/O group x status
    def self.g3_s : Bool
      value.g3_s
    end

    # Analog I/O group x status
    def g2_s : Bool
      @value.bits_set?(0x20000_u32)
    end

    # Analog I/O group x status
    def self.g2_s : Bool
      value.g2_s
    end

    # Analog I/O group x status
    def g1_s : Bool
      @value.bits_set?(0x10000_u32)
    end

    # Analog I/O group x status
    def self.g1_s : Bool
      value.g1_s
    end

    # Analog I/O group x enable
    def g8_e : Bool
      @value.bits_set?(0x80_u32)
    end

    # Analog I/O group x enable
    def self.g8_e : Bool
      value.g8_e
    end

    # Analog I/O group x enable
    def self.g8_e=(value : Bool) : Bool
      self.set(g8_e: value)
      value
    end

    # Analog I/O group x enable
    def g7_e : Bool
      @value.bits_set?(0x40_u32)
    end

    # Analog I/O group x enable
    def self.g7_e : Bool
      value.g7_e
    end

    # Analog I/O group x enable
    def self.g7_e=(value : Bool) : Bool
      self.set(g7_e: value)
      value
    end

    # Analog I/O group x enable
    def g6_e : Bool
      @value.bits_set?(0x20_u32)
    end

    # Analog I/O group x enable
    def self.g6_e : Bool
      value.g6_e
    end

    # Analog I/O group x enable
    def self.g6_e=(value : Bool) : Bool
      self.set(g6_e: value)
      value
    end

    # Analog I/O group x enable
    def g5_e : Bool
      @value.bits_set?(0x10_u32)
    end

    # Analog I/O group x enable
    def self.g5_e : Bool
      value.g5_e
    end

    # Analog I/O group x enable
    def self.g5_e=(value : Bool) : Bool
      self.set(g5_e: value)
      value
    end

    # Analog I/O group x enable
    def g4_e : Bool
      @value.bits_set?(0x8_u32)
    end

    # Analog I/O group x enable
    def self.g4_e : Bool
      value.g4_e
    end

    # Analog I/O group x enable
    def self.g4_e=(value : Bool) : Bool
      self.set(g4_e: value)
      value
    end

    # Analog I/O group x enable
    def g3_e : Bool
      @value.bits_set?(0x4_u32)
    end

    # Analog I/O group x enable
    def self.g3_e : Bool
      value.g3_e
    end

    # Analog I/O group x enable
    def self.g3_e=(value : Bool) : Bool
      self.set(g3_e: value)
      value
    end

    # Analog I/O group x enable
    def g2_e : Bool
      @value.bits_set?(0x2_u32)
    end

    # Analog I/O group x enable
    def self.g2_e : Bool
      value.g2_e
    end

    # Analog I/O group x enable
    def self.g2_e=(value : Bool) : Bool
      self.set(g2_e: value)
      value
    end

    # Analog I/O group x enable
    def g1_e : Bool
      @value.bits_set?(0x1_u32)
    end

    # Analog I/O group x enable
    def self.g1_e : Bool
      value.g1_e
    end

    # Analog I/O group x enable
    def self.g1_e=(value : Bool) : Bool
      self.set(g1_e: value)
      value
    end

    def copy_with(
      *,

      g8_s : Bool? = nil,

      g7_s : Bool? = nil,

      g8_e : Bool? = nil,

      g7_e : Bool? = nil,

      g6_e : Bool? = nil,

      g5_e : Bool? = nil,

      g4_e : Bool? = nil,

      g3_e : Bool? = nil,

      g2_e : Bool? = nil,

      g1_e : Bool? = nil
    ) : self
      value = @value

      unless g8_s.nil?
        value = (value & 0xff7fffff_u32) |
                UInt32.new!(g8_s.to_int).&(0x1_u32) << 23
      end

      unless g7_s.nil?
        value = (value & 0xffbfffff_u32) |
                UInt32.new!(g7_s.to_int).&(0x1_u32) << 22
      end

      unless g8_e.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(g8_e.to_int).&(0x1_u32) << 7
      end

      unless g7_e.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(g7_e.to_int).&(0x1_u32) << 6
      end

      unless g6_e.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(g6_e.to_int).&(0x1_u32) << 5
      end

      unless g5_e.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(g5_e.to_int).&(0x1_u32) << 4
      end

      unless g4_e.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(g4_e.to_int).&(0x1_u32) << 3
      end

      unless g3_e.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(g3_e.to_int).&(0x1_u32) << 2
      end

      unless g2_e.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(g2_e.to_int).&(0x1_u32) << 1
      end

      unless g1_e.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(g1_e.to_int).&(0x1_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      g8_s : Bool? = nil,
      g7_s : Bool? = nil,
      g8_e : Bool? = nil,
      g7_e : Bool? = nil,
      g6_e : Bool? = nil,
      g5_e : Bool? = nil,
      g4_e : Bool? = nil,
      g3_e : Bool? = nil,
      g2_e : Bool? = nil,
      g1_e : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        g8_s: g8_s,
        g7_s: g7_s,
        g8_e: g8_e,
        g7_e: g7_e,
        g6_e: g6_e,
        g5_e: g5_e,
        g4_e: g4_e,
        g3_e: g3_e,
        g2_e: g2_e,
        g1_e: g1_e,
      )
    end
  end # struct

  # I/O group x counter register
  abstract struct IOGCR
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

    # Counter value
    def cnt : UInt16
      UInt16.new!((@value >> 0) & 0x3fff_u32)
    end

    # Counter value
    def self.cnt : UInt16
      value.cnt
    end
  end # struct

  # dim.instance_name(register.name, dim_index)
  struct IOGCR0 < IOGCR
    ADDRESS = BASE_ADDRESS + 0x34_u64

    protected def self.address : UInt64
      ADDRESS
    end
  end

  # dim.instance_name(register.name, dim_index)
  struct IOGCR1 < IOGCR
    ADDRESS = BASE_ADDRESS + 0x38_u64

    protected def self.address : UInt64
      ADDRESS
    end
  end

  # dim.instance_name(register.name, dim_index)
  struct IOGCR2 < IOGCR
    ADDRESS = BASE_ADDRESS + 0x3c_u64

    protected def self.address : UInt64
      ADDRESS
    end
  end

  # dim.instance_name(register.name, dim_index)
  struct IOGCR3 < IOGCR
    ADDRESS = BASE_ADDRESS + 0x40_u64

    protected def self.address : UInt64
      ADDRESS
    end
  end

  # dim.instance_name(register.name, dim_index)
  struct IOGCR4 < IOGCR
    ADDRESS = BASE_ADDRESS + 0x44_u64

    protected def self.address : UInt64
      ADDRESS
    end
  end

  # dim.instance_name(register.name, dim_index)
  struct IOGCR5 < IOGCR
    ADDRESS = BASE_ADDRESS + 0x48_u64

    protected def self.address : UInt64
      ADDRESS
    end
  end

  # dim.instance_name(register.name, dim_index)
  struct IOGCR6 < IOGCR
    ADDRESS = BASE_ADDRESS + 0x4c_u64

    protected def self.address : UInt64
      ADDRESS
    end
  end

  # dim.instance_name(register.name, dim_index)
  struct IOGCR7 < IOGCR
    ADDRESS = BASE_ADDRESS + 0x50_u64

    protected def self.address : UInt64
      ADDRESS
    end
  end
end
