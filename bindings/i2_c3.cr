# Inter-integrated circuit
module I2C3
  VERSION      = nil
  BASE_ADDRESS = 0x40005c00_u64

  # Control register 1
  struct CR1
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

    # Software reset
    def swrst : Bool
      @value.bits_set?(0x8000_u32)
    end

    # Software reset
    def self.swrst : Bool
      value.swrst
    end

    # Software reset
    def self.swrst=(value : Bool) : Bool
      self.set(swrst: value)
      value
    end

    # SMBus alert
    def alert : Bool
      @value.bits_set?(0x2000_u32)
    end

    # SMBus alert
    def self.alert : Bool
      value.alert
    end

    # SMBus alert
    def self.alert=(value : Bool) : Bool
      self.set(alert: value)
      value
    end

    # Packet error checking
    def pec : Bool
      @value.bits_set?(0x1000_u32)
    end

    # Packet error checking
    def self.pec : Bool
      value.pec
    end

    # Packet error checking
    def self.pec=(value : Bool) : Bool
      self.set(pec: value)
      value
    end

    # Acknowledge/PEC Position (for data              reception)
    def pos : Bool
      @value.bits_set?(0x800_u32)
    end

    # Acknowledge/PEC Position (for data              reception)
    def self.pos : Bool
      value.pos
    end

    # Acknowledge/PEC Position (for data              reception)
    def self.pos=(value : Bool) : Bool
      self.set(pos: value)
      value
    end

    # Acknowledge enable
    def ack : Bool
      @value.bits_set?(0x400_u32)
    end

    # Acknowledge enable
    def self.ack : Bool
      value.ack
    end

    # Acknowledge enable
    def self.ack=(value : Bool) : Bool
      self.set(ack: value)
      value
    end

    # Stop generation
    def stop : Bool
      @value.bits_set?(0x200_u32)
    end

    # Stop generation
    def self.stop : Bool
      value.stop
    end

    # Stop generation
    def self.stop=(value : Bool) : Bool
      self.set(stop: value)
      value
    end

    # Start generation
    def start : Bool
      @value.bits_set?(0x100_u32)
    end

    # Start generation
    def self.start : Bool
      value.start
    end

    # Start generation
    def self.start=(value : Bool) : Bool
      self.set(start: value)
      value
    end

    # Clock stretching disable (Slave              mode)
    def nostretch : Bool
      @value.bits_set?(0x80_u32)
    end

    # Clock stretching disable (Slave              mode)
    def self.nostretch : Bool
      value.nostretch
    end

    # Clock stretching disable (Slave              mode)
    def self.nostretch=(value : Bool) : Bool
      self.set(nostretch: value)
      value
    end

    # General call enable
    def engc : Bool
      @value.bits_set?(0x40_u32)
    end

    # General call enable
    def self.engc : Bool
      value.engc
    end

    # General call enable
    def self.engc=(value : Bool) : Bool
      self.set(engc: value)
      value
    end

    # PEC enable
    def enpec : Bool
      @value.bits_set?(0x20_u32)
    end

    # PEC enable
    def self.enpec : Bool
      value.enpec
    end

    # PEC enable
    def self.enpec=(value : Bool) : Bool
      self.set(enpec: value)
      value
    end

    # ARP enable
    def enarp : Bool
      @value.bits_set?(0x10_u32)
    end

    # ARP enable
    def self.enarp : Bool
      value.enarp
    end

    # ARP enable
    def self.enarp=(value : Bool) : Bool
      self.set(enarp: value)
      value
    end

    # SMBus type
    def smbtype : Bool
      @value.bits_set?(0x8_u32)
    end

    # SMBus type
    def self.smbtype : Bool
      value.smbtype
    end

    # SMBus type
    def self.smbtype=(value : Bool) : Bool
      self.set(smbtype: value)
      value
    end

    # SMBus mode
    def smbus : Bool
      @value.bits_set?(0x2_u32)
    end

    # SMBus mode
    def self.smbus : Bool
      value.smbus
    end

    # SMBus mode
    def self.smbus=(value : Bool) : Bool
      self.set(smbus: value)
      value
    end

    # Peripheral enable
    def pe : Bool
      @value.bits_set?(0x1_u32)
    end

    # Peripheral enable
    def self.pe : Bool
      value.pe
    end

    # Peripheral enable
    def self.pe=(value : Bool) : Bool
      self.set(pe: value)
      value
    end

    def copy_with(
      *,

      swrst : Bool? = nil,

      alert : Bool? = nil,

      pec : Bool? = nil,

      pos : Bool? = nil,

      ack : Bool? = nil,

      stop : Bool? = nil,

      start : Bool? = nil,

      nostretch : Bool? = nil,

      engc : Bool? = nil,

      enpec : Bool? = nil,

      enarp : Bool? = nil,

      smbtype : Bool? = nil,

      smbus : Bool? = nil,

      pe : Bool? = nil
    ) : self
      value = @value

      unless swrst.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(swrst.to_int).&(0x1_u32) << 15
      end

      unless alert.nil?
        value = (value & 0xffffdfff_u32) |
                UInt32.new!(alert.to_int).&(0x1_u32) << 13
      end

      unless pec.nil?
        value = (value & 0xffffefff_u32) |
                UInt32.new!(pec.to_int).&(0x1_u32) << 12
      end

      unless pos.nil?
        value = (value & 0xfffff7ff_u32) |
                UInt32.new!(pos.to_int).&(0x1_u32) << 11
      end

      unless ack.nil?
        value = (value & 0xfffffbff_u32) |
                UInt32.new!(ack.to_int).&(0x1_u32) << 10
      end

      unless stop.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(stop.to_int).&(0x1_u32) << 9
      end

      unless start.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(start.to_int).&(0x1_u32) << 8
      end

      unless nostretch.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(nostretch.to_int).&(0x1_u32) << 7
      end

      unless engc.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(engc.to_int).&(0x1_u32) << 6
      end

      unless enpec.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(enpec.to_int).&(0x1_u32) << 5
      end

      unless enarp.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(enarp.to_int).&(0x1_u32) << 4
      end

      unless smbtype.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(smbtype.to_int).&(0x1_u32) << 3
      end

      unless smbus.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(smbus.to_int).&(0x1_u32) << 1
      end

      unless pe.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(pe.to_int).&(0x1_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      swrst : Bool? = nil,
      alert : Bool? = nil,
      pec : Bool? = nil,
      pos : Bool? = nil,
      ack : Bool? = nil,
      stop : Bool? = nil,
      start : Bool? = nil,
      nostretch : Bool? = nil,
      engc : Bool? = nil,
      enpec : Bool? = nil,
      enarp : Bool? = nil,
      smbtype : Bool? = nil,
      smbus : Bool? = nil,
      pe : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        swrst: swrst,
        alert: alert,
        pec: pec,
        pos: pos,
        ack: ack,
        stop: stop,
        start: start,
        nostretch: nostretch,
        engc: engc,
        enpec: enpec,
        enarp: enarp,
        smbtype: smbtype,
        smbus: smbus,
        pe: pe,
      )
    end
  end # struct

  # Control register 2
  struct CR2
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

    # DMA last transfer
    def last : Bool
      @value.bits_set?(0x1000_u32)
    end

    # DMA last transfer
    def self.last : Bool
      value.last
    end

    # DMA last transfer
    def self.last=(value : Bool) : Bool
      self.set(last: value)
      value
    end

    # DMA requests enable
    def dmaen : Bool
      @value.bits_set?(0x800_u32)
    end

    # DMA requests enable
    def self.dmaen : Bool
      value.dmaen
    end

    # DMA requests enable
    def self.dmaen=(value : Bool) : Bool
      self.set(dmaen: value)
      value
    end

    # Buffer interrupt enable
    def itbufen : Bool
      @value.bits_set?(0x400_u32)
    end

    # Buffer interrupt enable
    def self.itbufen : Bool
      value.itbufen
    end

    # Buffer interrupt enable
    def self.itbufen=(value : Bool) : Bool
      self.set(itbufen: value)
      value
    end

    # Event interrupt enable
    def itevten : Bool
      @value.bits_set?(0x200_u32)
    end

    # Event interrupt enable
    def self.itevten : Bool
      value.itevten
    end

    # Event interrupt enable
    def self.itevten=(value : Bool) : Bool
      self.set(itevten: value)
      value
    end

    # Error interrupt enable
    def iterren : Bool
      @value.bits_set?(0x100_u32)
    end

    # Error interrupt enable
    def self.iterren : Bool
      value.iterren
    end

    # Error interrupt enable
    def self.iterren=(value : Bool) : Bool
      self.set(iterren: value)
      value
    end

    # Peripheral clock frequency
    def freq : UInt8
      UInt8.new!((@value >> 0) & 0x3f_u32)
    end

    # Peripheral clock frequency
    def self.freq : UInt8
      value.freq
    end

    # Peripheral clock frequency
    def self.freq=(value : UInt8) : UInt8
      self.set(freq: value)
      value
    end

    def copy_with(
      *,

      last : Bool? = nil,

      dmaen : Bool? = nil,

      itbufen : Bool? = nil,

      itevten : Bool? = nil,

      iterren : Bool? = nil,

      freq : UInt8? = nil
    ) : self
      value = @value

      unless last.nil?
        value = (value & 0xffffefff_u32) |
                UInt32.new!(last.to_int).&(0x1_u32) << 12
      end

      unless dmaen.nil?
        value = (value & 0xfffff7ff_u32) |
                UInt32.new!(dmaen.to_int).&(0x1_u32) << 11
      end

      unless itbufen.nil?
        value = (value & 0xfffffbff_u32) |
                UInt32.new!(itbufen.to_int).&(0x1_u32) << 10
      end

      unless itevten.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(itevten.to_int).&(0x1_u32) << 9
      end

      unless iterren.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(iterren.to_int).&(0x1_u32) << 8
      end

      unless freq.nil?
        value = (value & 0xffffffc0_u32) |
                UInt32.new!(freq.to_int).&(0x3f_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      last : Bool? = nil,
      dmaen : Bool? = nil,
      itbufen : Bool? = nil,
      itevten : Bool? = nil,
      iterren : Bool? = nil,
      freq : UInt8? = nil
    ) : Nil
      self.value = self.value.copy_with(
        last: last,
        dmaen: dmaen,
        itbufen: itbufen,
        itevten: itevten,
        iterren: iterren,
        freq: freq,
      )
    end
  end # struct

  # Own address register 1
  struct OAR1
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

    # Addressing mode (slave              mode)
    def addmode : Bool
      @value.bits_set?(0x8000_u32)
    end

    # Addressing mode (slave              mode)
    def self.addmode : Bool
      value.addmode
    end

    # Addressing mode (slave              mode)
    def self.addmode=(value : Bool) : Bool
      self.set(addmode: value)
      value
    end

    # Interface address
    def add10 : UInt8
      UInt8.new!((@value >> 8) & 0x3_u32)
    end

    # Interface address
    def self.add10 : UInt8
      value.add10
    end

    # Interface address
    def self.add10=(value : UInt8) : UInt8
      self.set(add10: value)
      value
    end

    # Interface address
    def add7 : UInt8
      UInt8.new!((@value >> 1) & 0x7f_u32)
    end

    # Interface address
    def self.add7 : UInt8
      value.add7
    end

    # Interface address
    def self.add7=(value : UInt8) : UInt8
      self.set(add7: value)
      value
    end

    # Interface address
    def add0 : Bool
      @value.bits_set?(0x1_u32)
    end

    # Interface address
    def self.add0 : Bool
      value.add0
    end

    # Interface address
    def self.add0=(value : Bool) : Bool
      self.set(add0: value)
      value
    end

    def copy_with(
      *,

      addmode : Bool? = nil,

      add10 : UInt8? = nil,

      add7 : UInt8? = nil,

      add0 : Bool? = nil
    ) : self
      value = @value

      unless addmode.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(addmode.to_int).&(0x1_u32) << 15
      end

      unless add10.nil?
        value = (value & 0xfffffcff_u32) |
                UInt32.new!(add10.to_int).&(0x3_u32) << 8
      end

      unless add7.nil?
        value = (value & 0xffffff01_u32) |
                UInt32.new!(add7.to_int).&(0x7f_u32) << 1
      end

      unless add0.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(add0.to_int).&(0x1_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      addmode : Bool? = nil,
      add10 : UInt8? = nil,
      add7 : UInt8? = nil,
      add0 : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        addmode: addmode,
        add10: add10,
        add7: add7,
        add0: add0,
      )
    end
  end # struct

  # Own address register 2
  struct OAR2
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

    # Interface address
    def add2 : UInt8
      UInt8.new!((@value >> 1) & 0x7f_u32)
    end

    # Interface address
    def self.add2 : UInt8
      value.add2
    end

    # Interface address
    def self.add2=(value : UInt8) : UInt8
      self.set(add2: value)
      value
    end

    # Dual addressing mode              enable
    def endual : Bool
      @value.bits_set?(0x1_u32)
    end

    # Dual addressing mode              enable
    def self.endual : Bool
      value.endual
    end

    # Dual addressing mode              enable
    def self.endual=(value : Bool) : Bool
      self.set(endual: value)
      value
    end

    def copy_with(
      *,

      add2 : UInt8? = nil,

      endual : Bool? = nil
    ) : self
      value = @value

      unless add2.nil?
        value = (value & 0xffffff01_u32) |
                UInt32.new!(add2.to_int).&(0x7f_u32) << 1
      end

      unless endual.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(endual.to_int).&(0x1_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      add2 : UInt8? = nil,
      endual : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        add2: add2,
        endual: endual,
      )
    end
  end # struct

  # Data register
  struct DR
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

    # 8-bit data register
    def dr : UInt8
      UInt8.new!((@value >> 0) & 0xff_u32)
    end

    # 8-bit data register
    def self.dr : UInt8
      value.dr
    end

    # 8-bit data register
    def self.dr=(value : UInt8) : UInt8
      self.set(dr: value)
      value
    end

    def copy_with(
      *,

      dr : UInt8? = nil
    ) : self
      value = @value

      unless dr.nil?
        value = (value & 0xffffff00_u32) |
                UInt32.new!(dr.to_int).&(0xff_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      dr : UInt8? = nil
    ) : Nil
      self.value = self.value.copy_with(
        dr: dr,
      )
    end
  end # struct

  # Status register 1
  struct SR1
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

    # SMBus alert
    def smbalert : Bool
      @value.bits_set?(0x8000_u32)
    end

    # SMBus alert
    def self.smbalert : Bool
      value.smbalert
    end

    # SMBus alert
    def self.smbalert=(value : Bool) : Bool
      self.set(smbalert: value)
      value
    end

    # Timeout or Tlow error
    def timeout : Bool
      @value.bits_set?(0x4000_u32)
    end

    # Timeout or Tlow error
    def self.timeout : Bool
      value.timeout
    end

    # Timeout or Tlow error
    def self.timeout=(value : Bool) : Bool
      self.set(timeout: value)
      value
    end

    # PEC Error in reception
    def pecerr : Bool
      @value.bits_set?(0x1000_u32)
    end

    # PEC Error in reception
    def self.pecerr : Bool
      value.pecerr
    end

    # PEC Error in reception
    def self.pecerr=(value : Bool) : Bool
      self.set(pecerr: value)
      value
    end

    # Overrun/Underrun
    def ovr : Bool
      @value.bits_set?(0x800_u32)
    end

    # Overrun/Underrun
    def self.ovr : Bool
      value.ovr
    end

    # Overrun/Underrun
    def self.ovr=(value : Bool) : Bool
      self.set(ovr: value)
      value
    end

    # Acknowledge failure
    def af : Bool
      @value.bits_set?(0x400_u32)
    end

    # Acknowledge failure
    def self.af : Bool
      value.af
    end

    # Acknowledge failure
    def self.af=(value : Bool) : Bool
      self.set(af: value)
      value
    end

    # Arbitration lost (master              mode)
    def arlo : Bool
      @value.bits_set?(0x200_u32)
    end

    # Arbitration lost (master              mode)
    def self.arlo : Bool
      value.arlo
    end

    # Arbitration lost (master              mode)
    def self.arlo=(value : Bool) : Bool
      self.set(arlo: value)
      value
    end

    # Bus error
    def berr : Bool
      @value.bits_set?(0x100_u32)
    end

    # Bus error
    def self.berr : Bool
      value.berr
    end

    # Bus error
    def self.berr=(value : Bool) : Bool
      self.set(berr: value)
      value
    end

    # Data register empty              (transmitters)
    def tx_e : Bool
      @value.bits_set?(0x80_u32)
    end

    # Data register empty              (transmitters)
    def self.tx_e : Bool
      value.tx_e
    end

    # Data register not empty              (receivers)
    def rx_ne : Bool
      @value.bits_set?(0x40_u32)
    end

    # Data register not empty              (receivers)
    def self.rx_ne : Bool
      value.rx_ne
    end

    # Stop detection (slave              mode)
    def stopf : Bool
      @value.bits_set?(0x10_u32)
    end

    # Stop detection (slave              mode)
    def self.stopf : Bool
      value.stopf
    end

    # 10-bit header sent (Master              mode)
    def add10 : Bool
      @value.bits_set?(0x8_u32)
    end

    # 10-bit header sent (Master              mode)
    def self.add10 : Bool
      value.add10
    end

    # Byte transfer finished
    def btf : Bool
      @value.bits_set?(0x4_u32)
    end

    # Byte transfer finished
    def self.btf : Bool
      value.btf
    end

    # Address sent (master mode)/matched              (slave mode)
    def addr : Bool
      @value.bits_set?(0x2_u32)
    end

    # Address sent (master mode)/matched              (slave mode)
    def self.addr : Bool
      value.addr
    end

    # Start bit (Master mode)
    def sb : Bool
      @value.bits_set?(0x1_u32)
    end

    # Start bit (Master mode)
    def self.sb : Bool
      value.sb
    end

    def copy_with(
      *,

      smbalert : Bool? = nil,

      timeout : Bool? = nil,

      pecerr : Bool? = nil,

      ovr : Bool? = nil,

      af : Bool? = nil,

      arlo : Bool? = nil,

      berr : Bool? = nil
    ) : self
      value = @value

      unless smbalert.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(smbalert.to_int).&(0x1_u32) << 15
      end

      unless timeout.nil?
        value = (value & 0xffffbfff_u32) |
                UInt32.new!(timeout.to_int).&(0x1_u32) << 14
      end

      unless pecerr.nil?
        value = (value & 0xffffefff_u32) |
                UInt32.new!(pecerr.to_int).&(0x1_u32) << 12
      end

      unless ovr.nil?
        value = (value & 0xfffff7ff_u32) |
                UInt32.new!(ovr.to_int).&(0x1_u32) << 11
      end

      unless af.nil?
        value = (value & 0xfffffbff_u32) |
                UInt32.new!(af.to_int).&(0x1_u32) << 10
      end

      unless arlo.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(arlo.to_int).&(0x1_u32) << 9
      end

      unless berr.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(berr.to_int).&(0x1_u32) << 8
      end

      self.class.new(value)
    end

    def self.set(
      *,
      smbalert : Bool? = nil,
      timeout : Bool? = nil,
      pecerr : Bool? = nil,
      ovr : Bool? = nil,
      af : Bool? = nil,
      arlo : Bool? = nil,
      berr : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        smbalert: smbalert,
        timeout: timeout,
        pecerr: pecerr,
        ovr: ovr,
        af: af,
        arlo: arlo,
        berr: berr,
      )
    end
  end # struct

  # Status register 2
  struct SR2
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

    # acket error checking              register
    def pec : UInt8
      UInt8.new!((@value >> 8) & 0xff_u32)
    end

    # acket error checking              register
    def self.pec : UInt8
      value.pec
    end

    # Dual flag (Slave mode)
    def dualf : Bool
      @value.bits_set?(0x80_u32)
    end

    # Dual flag (Slave mode)
    def self.dualf : Bool
      value.dualf
    end

    # SMBus host header (Slave              mode)
    def smbhost : Bool
      @value.bits_set?(0x40_u32)
    end

    # SMBus host header (Slave              mode)
    def self.smbhost : Bool
      value.smbhost
    end

    # SMBus device default address (Slave              mode)
    def smbdefault : Bool
      @value.bits_set?(0x20_u32)
    end

    # SMBus device default address (Slave              mode)
    def self.smbdefault : Bool
      value.smbdefault
    end

    # General call address (Slave              mode)
    def gencall : Bool
      @value.bits_set?(0x10_u32)
    end

    # General call address (Slave              mode)
    def self.gencall : Bool
      value.gencall
    end

    # Transmitter/receiver
    def tra : Bool
      @value.bits_set?(0x4_u32)
    end

    # Transmitter/receiver
    def self.tra : Bool
      value.tra
    end

    # Bus busy
    def busy : Bool
      @value.bits_set?(0x2_u32)
    end

    # Bus busy
    def self.busy : Bool
      value.busy
    end

    # Master/slave
    def msl : Bool
      @value.bits_set?(0x1_u32)
    end

    # Master/slave
    def self.msl : Bool
      value.msl
    end
  end # struct

  # Clock control register
  struct CCR
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

    # I2C master mode selection
    def f_s : Bool
      @value.bits_set?(0x8000_u32)
    end

    # I2C master mode selection
    def self.f_s : Bool
      value.f_s
    end

    # I2C master mode selection
    def self.f_s=(value : Bool) : Bool
      self.set(f_s: value)
      value
    end

    # Fast mode duty cycle
    def duty : Bool
      @value.bits_set?(0x4000_u32)
    end

    # Fast mode duty cycle
    def self.duty : Bool
      value.duty
    end

    # Fast mode duty cycle
    def self.duty=(value : Bool) : Bool
      self.set(duty: value)
      value
    end

    # Clock control register in Fast/Standard              mode (Master mode)
    def ccr : UInt16
      UInt16.new!((@value >> 0) & 0xfff_u32)
    end

    # Clock control register in Fast/Standard              mode (Master mode)
    def self.ccr : UInt16
      value.ccr
    end

    # Clock control register in Fast/Standard              mode (Master mode)
    def self.ccr=(value : UInt16) : UInt16
      self.set(ccr: value)
      value
    end

    def copy_with(
      *,

      f_s : Bool? = nil,

      duty : Bool? = nil,

      ccr : UInt16? = nil
    ) : self
      value = @value

      unless f_s.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(f_s.to_int).&(0x1_u32) << 15
      end

      unless duty.nil?
        value = (value & 0xffffbfff_u32) |
                UInt32.new!(duty.to_int).&(0x1_u32) << 14
      end

      unless ccr.nil?
        value = (value & 0xfffff000_u32) |
                UInt32.new!(ccr.to_int).&(0xfff_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      f_s : Bool? = nil,
      duty : Bool? = nil,
      ccr : UInt16? = nil
    ) : Nil
      self.value = self.value.copy_with(
        f_s: f_s,
        duty: duty,
        ccr: ccr,
      )
    end
  end # struct

  # TRISE register
  struct TRISE
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
      new(0x2_u64)
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

    # Maximum rise time in Fast/Standard mode              (Master mode)
    def trise : UInt8
      UInt8.new!((@value >> 0) & 0x3f_u32)
    end

    # Maximum rise time in Fast/Standard mode              (Master mode)
    def self.trise : UInt8
      value.trise
    end

    # Maximum rise time in Fast/Standard mode              (Master mode)
    def self.trise=(value : UInt8) : UInt8
      self.set(trise: value)
      value
    end

    def copy_with(
      *,

      trise : UInt8? = nil
    ) : self
      value = @value

      unless trise.nil?
        value = (value & 0xffffffc0_u32) |
                UInt32.new!(trise.to_int).&(0x3f_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      trise : UInt8? = nil
    ) : Nil
      self.value = self.value.copy_with(
        trise: trise,
      )
    end
  end # struct

  # I2C FLTR register
  struct FLTR
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

    # Digital noise filter
    def dnf : UInt8
      UInt8.new!((@value >> 0) & 0xf_u32)
    end

    # Digital noise filter
    def self.dnf : UInt8
      value.dnf
    end

    # Digital noise filter
    def self.dnf=(value : UInt8) : UInt8
      self.set(dnf: value)
      value
    end

    # Analog noise filter OFF
    def anoff : Bool
      @value.bits_set?(0x10_u32)
    end

    # Analog noise filter OFF
    def self.anoff : Bool
      value.anoff
    end

    # Analog noise filter OFF
    def self.anoff=(value : Bool) : Bool
      self.set(anoff: value)
      value
    end

    def copy_with(
      *,

      dnf : UInt8? = nil,

      anoff : Bool? = nil
    ) : self
      value = @value

      unless dnf.nil?
        value = (value & 0xfffffff0_u32) |
                UInt32.new!(dnf.to_int).&(0xf_u32) << 0
      end

      unless anoff.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(anoff.to_int).&(0x1_u32) << 4
      end

      self.class.new(value)
    end

    def self.set(
      *,
      dnf : UInt8? = nil,
      anoff : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        dnf: dnf,
        anoff: anoff,
      )
    end
  end # struct

end
