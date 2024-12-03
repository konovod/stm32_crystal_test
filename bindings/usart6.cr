# Universal synchronous asynchronous receiver      transmitter
module USART6
  VERSION      = nil
  BASE_ADDRESS = 0x40011400_u64

  # Status register
  struct SR
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
      new(0xc00000_u64)
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

    # CTS flag
    def cts : Bool
      @value.bits_set?(0x200_u32)
    end

    # CTS flag
    def self.cts : Bool
      value.cts
    end

    # CTS flag
    def self.cts=(value : Bool) : Bool
      self.set(cts: value)
      value
    end

    # LIN break detection flag
    def lbd : Bool
      @value.bits_set?(0x100_u32)
    end

    # LIN break detection flag
    def self.lbd : Bool
      value.lbd
    end

    # LIN break detection flag
    def self.lbd=(value : Bool) : Bool
      self.set(lbd: value)
      value
    end

    # Transmit data register              empty
    def txe : Bool
      @value.bits_set?(0x80_u32)
    end

    # Transmit data register              empty
    def self.txe : Bool
      value.txe
    end

    # Transmission complete
    def tc : Bool
      @value.bits_set?(0x40_u32)
    end

    # Transmission complete
    def self.tc : Bool
      value.tc
    end

    # Transmission complete
    def self.tc=(value : Bool) : Bool
      self.set(tc: value)
      value
    end

    # Read data register not              empty
    def rxne : Bool
      @value.bits_set?(0x20_u32)
    end

    # Read data register not              empty
    def self.rxne : Bool
      value.rxne
    end

    # Read data register not              empty
    def self.rxne=(value : Bool) : Bool
      self.set(rxne: value)
      value
    end

    # IDLE line detected
    def idle : Bool
      @value.bits_set?(0x10_u32)
    end

    # IDLE line detected
    def self.idle : Bool
      value.idle
    end

    # Overrun error
    def ore : Bool
      @value.bits_set?(0x8_u32)
    end

    # Overrun error
    def self.ore : Bool
      value.ore
    end

    # Noise detected flag
    def nf : Bool
      @value.bits_set?(0x4_u32)
    end

    # Noise detected flag
    def self.nf : Bool
      value.nf
    end

    # Framing error
    def fe : Bool
      @value.bits_set?(0x2_u32)
    end

    # Framing error
    def self.fe : Bool
      value.fe
    end

    # Parity error
    def pe : Bool
      @value.bits_set?(0x1_u32)
    end

    # Parity error
    def self.pe : Bool
      value.pe
    end

    def copy_with(
      *,

      cts : Bool? = nil,

      lbd : Bool? = nil,

      tc : Bool? = nil,

      rxne : Bool? = nil
    ) : self
      value = @value

      unless cts.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(cts.to_int).&(0x1_u32) << 9
      end

      unless lbd.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(lbd.to_int).&(0x1_u32) << 8
      end

      unless tc.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(tc.to_int).&(0x1_u32) << 6
      end

      unless rxne.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(rxne.to_int).&(0x1_u32) << 5
      end

      self.class.new(value)
    end

    def self.set(
      *,
      cts : Bool? = nil,
      lbd : Bool? = nil,
      tc : Bool? = nil,
      rxne : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        cts: cts,
        lbd: lbd,
        tc: tc,
        rxne: rxne,
      )
    end
  end # struct

  # Data register
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

    # Data value
    def dr : UInt16
      UInt16.new!((@value >> 0) & 0x1ff_u32)
    end

    # Data value
    def self.dr : UInt16
      value.dr
    end

    # Data value
    def self.dr=(value : UInt16) : UInt16
      self.set(dr: value)
      value
    end

    def copy_with(
      *,

      dr : UInt16? = nil
    ) : self
      value = @value

      unless dr.nil?
        value = (value & 0xfffffe00_u32) |
                UInt32.new!(dr.to_int).&(0x1ff_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      dr : UInt16? = nil
    ) : Nil
      self.value = self.value.copy_with(
        dr: dr,
      )
    end
  end # struct

  # Baud rate register
  struct BRR
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

    # mantissa of USARTDIV
    def div_mantissa : UInt16
      UInt16.new!((@value >> 4) & 0xfff_u32)
    end

    # mantissa of USARTDIV
    def self.div_mantissa : UInt16
      value.div_mantissa
    end

    # mantissa of USARTDIV
    def self.div_mantissa=(value : UInt16) : UInt16
      self.set(div_mantissa: value)
      value
    end

    # fraction of USARTDIV
    def div_fraction : UInt8
      UInt8.new!((@value >> 0) & 0xf_u32)
    end

    # fraction of USARTDIV
    def self.div_fraction : UInt8
      value.div_fraction
    end

    # fraction of USARTDIV
    def self.div_fraction=(value : UInt8) : UInt8
      self.set(div_fraction: value)
      value
    end

    def copy_with(
      *,

      div_mantissa : UInt16? = nil,

      div_fraction : UInt8? = nil
    ) : self
      value = @value

      unless div_mantissa.nil?
        value = (value & 0xffff000f_u32) |
                UInt32.new!(div_mantissa.to_int).&(0xfff_u32) << 4
      end

      unless div_fraction.nil?
        value = (value & 0xfffffff0_u32) |
                UInt32.new!(div_fraction.to_int).&(0xf_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      div_mantissa : UInt16? = nil,
      div_fraction : UInt8? = nil
    ) : Nil
      self.value = self.value.copy_with(
        div_mantissa: div_mantissa,
        div_fraction: div_fraction,
      )
    end
  end # struct

  # Control register 1
  struct CR1
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

    # Oversampling mode
    def over8 : Bool
      @value.bits_set?(0x8000_u32)
    end

    # Oversampling mode
    def self.over8 : Bool
      value.over8
    end

    # Oversampling mode
    def self.over8=(value : Bool) : Bool
      self.set(over8: value)
      value
    end

    # USART enable
    def ue : Bool
      @value.bits_set?(0x2000_u32)
    end

    # USART enable
    def self.ue : Bool
      value.ue
    end

    # USART enable
    def self.ue=(value : Bool) : Bool
      self.set(ue: value)
      value
    end

    # Word length
    def m : Bool
      @value.bits_set?(0x1000_u32)
    end

    # Word length
    def self.m : Bool
      value.m
    end

    # Word length
    def self.m=(value : Bool) : Bool
      self.set(m: value)
      value
    end

    # Wakeup method
    def wake : Bool
      @value.bits_set?(0x800_u32)
    end

    # Wakeup method
    def self.wake : Bool
      value.wake
    end

    # Wakeup method
    def self.wake=(value : Bool) : Bool
      self.set(wake: value)
      value
    end

    # Parity control enable
    def pce : Bool
      @value.bits_set?(0x400_u32)
    end

    # Parity control enable
    def self.pce : Bool
      value.pce
    end

    # Parity control enable
    def self.pce=(value : Bool) : Bool
      self.set(pce: value)
      value
    end

    # Parity selection
    def ps : Bool
      @value.bits_set?(0x200_u32)
    end

    # Parity selection
    def self.ps : Bool
      value.ps
    end

    # Parity selection
    def self.ps=(value : Bool) : Bool
      self.set(ps: value)
      value
    end

    # PE interrupt enable
    def peie : Bool
      @value.bits_set?(0x100_u32)
    end

    # PE interrupt enable
    def self.peie : Bool
      value.peie
    end

    # PE interrupt enable
    def self.peie=(value : Bool) : Bool
      self.set(peie: value)
      value
    end

    # TXE interrupt enable
    def txeie : Bool
      @value.bits_set?(0x80_u32)
    end

    # TXE interrupt enable
    def self.txeie : Bool
      value.txeie
    end

    # TXE interrupt enable
    def self.txeie=(value : Bool) : Bool
      self.set(txeie: value)
      value
    end

    # Transmission complete interrupt              enable
    def tcie : Bool
      @value.bits_set?(0x40_u32)
    end

    # Transmission complete interrupt              enable
    def self.tcie : Bool
      value.tcie
    end

    # Transmission complete interrupt              enable
    def self.tcie=(value : Bool) : Bool
      self.set(tcie: value)
      value
    end

    # RXNE interrupt enable
    def rxneie : Bool
      @value.bits_set?(0x20_u32)
    end

    # RXNE interrupt enable
    def self.rxneie : Bool
      value.rxneie
    end

    # RXNE interrupt enable
    def self.rxneie=(value : Bool) : Bool
      self.set(rxneie: value)
      value
    end

    # IDLE interrupt enable
    def idleie : Bool
      @value.bits_set?(0x10_u32)
    end

    # IDLE interrupt enable
    def self.idleie : Bool
      value.idleie
    end

    # IDLE interrupt enable
    def self.idleie=(value : Bool) : Bool
      self.set(idleie: value)
      value
    end

    # Transmitter enable
    def te : Bool
      @value.bits_set?(0x8_u32)
    end

    # Transmitter enable
    def self.te : Bool
      value.te
    end

    # Transmitter enable
    def self.te=(value : Bool) : Bool
      self.set(te: value)
      value
    end

    # Receiver enable
    def re : Bool
      @value.bits_set?(0x4_u32)
    end

    # Receiver enable
    def self.re : Bool
      value.re
    end

    # Receiver enable
    def self.re=(value : Bool) : Bool
      self.set(re: value)
      value
    end

    # Receiver wakeup
    def rwu : Bool
      @value.bits_set?(0x2_u32)
    end

    # Receiver wakeup
    def self.rwu : Bool
      value.rwu
    end

    # Receiver wakeup
    def self.rwu=(value : Bool) : Bool
      self.set(rwu: value)
      value
    end

    # Send break
    def sbk : Bool
      @value.bits_set?(0x1_u32)
    end

    # Send break
    def self.sbk : Bool
      value.sbk
    end

    # Send break
    def self.sbk=(value : Bool) : Bool
      self.set(sbk: value)
      value
    end

    def copy_with(
      *,

      over8 : Bool? = nil,

      ue : Bool? = nil,

      m : Bool? = nil,

      wake : Bool? = nil,

      pce : Bool? = nil,

      ps : Bool? = nil,

      peie : Bool? = nil,

      txeie : Bool? = nil,

      tcie : Bool? = nil,

      rxneie : Bool? = nil,

      idleie : Bool? = nil,

      te : Bool? = nil,

      re : Bool? = nil,

      rwu : Bool? = nil,

      sbk : Bool? = nil
    ) : self
      value = @value

      unless over8.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(over8.to_int).&(0x1_u32) << 15
      end

      unless ue.nil?
        value = (value & 0xffffdfff_u32) |
                UInt32.new!(ue.to_int).&(0x1_u32) << 13
      end

      unless m.nil?
        value = (value & 0xffffefff_u32) |
                UInt32.new!(m.to_int).&(0x1_u32) << 12
      end

      unless wake.nil?
        value = (value & 0xfffff7ff_u32) |
                UInt32.new!(wake.to_int).&(0x1_u32) << 11
      end

      unless pce.nil?
        value = (value & 0xfffffbff_u32) |
                UInt32.new!(pce.to_int).&(0x1_u32) << 10
      end

      unless ps.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(ps.to_int).&(0x1_u32) << 9
      end

      unless peie.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(peie.to_int).&(0x1_u32) << 8
      end

      unless txeie.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(txeie.to_int).&(0x1_u32) << 7
      end

      unless tcie.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(tcie.to_int).&(0x1_u32) << 6
      end

      unless rxneie.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(rxneie.to_int).&(0x1_u32) << 5
      end

      unless idleie.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(idleie.to_int).&(0x1_u32) << 4
      end

      unless te.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(te.to_int).&(0x1_u32) << 3
      end

      unless re.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(re.to_int).&(0x1_u32) << 2
      end

      unless rwu.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(rwu.to_int).&(0x1_u32) << 1
      end

      unless sbk.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(sbk.to_int).&(0x1_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      over8 : Bool? = nil,
      ue : Bool? = nil,
      m : Bool? = nil,
      wake : Bool? = nil,
      pce : Bool? = nil,
      ps : Bool? = nil,
      peie : Bool? = nil,
      txeie : Bool? = nil,
      tcie : Bool? = nil,
      rxneie : Bool? = nil,
      idleie : Bool? = nil,
      te : Bool? = nil,
      re : Bool? = nil,
      rwu : Bool? = nil,
      sbk : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        over8: over8,
        ue: ue,
        m: m,
        wake: wake,
        pce: pce,
        ps: ps,
        peie: peie,
        txeie: txeie,
        tcie: tcie,
        rxneie: rxneie,
        idleie: idleie,
        te: te,
        re: re,
        rwu: rwu,
        sbk: sbk,
      )
    end
  end # struct

  # Control register 2
  struct CR2
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

    # LIN mode enable
    def linen : Bool
      @value.bits_set?(0x4000_u32)
    end

    # LIN mode enable
    def self.linen : Bool
      value.linen
    end

    # LIN mode enable
    def self.linen=(value : Bool) : Bool
      self.set(linen: value)
      value
    end

    # STOP bits
    def stop : UInt8
      UInt8.new!((@value >> 12) & 0x3_u32)
    end

    # STOP bits
    def self.stop : UInt8
      value.stop
    end

    # STOP bits
    def self.stop=(value : UInt8) : UInt8
      self.set(stop: value)
      value
    end

    # Clock enable
    def clken : Bool
      @value.bits_set?(0x800_u32)
    end

    # Clock enable
    def self.clken : Bool
      value.clken
    end

    # Clock enable
    def self.clken=(value : Bool) : Bool
      self.set(clken: value)
      value
    end

    # Clock polarity
    def cpol : Bool
      @value.bits_set?(0x400_u32)
    end

    # Clock polarity
    def self.cpol : Bool
      value.cpol
    end

    # Clock polarity
    def self.cpol=(value : Bool) : Bool
      self.set(cpol: value)
      value
    end

    # Clock phase
    def cpha : Bool
      @value.bits_set?(0x200_u32)
    end

    # Clock phase
    def self.cpha : Bool
      value.cpha
    end

    # Clock phase
    def self.cpha=(value : Bool) : Bool
      self.set(cpha: value)
      value
    end

    # Last bit clock pulse
    def lbcl : Bool
      @value.bits_set?(0x100_u32)
    end

    # Last bit clock pulse
    def self.lbcl : Bool
      value.lbcl
    end

    # Last bit clock pulse
    def self.lbcl=(value : Bool) : Bool
      self.set(lbcl: value)
      value
    end

    # LIN break detection interrupt              enable
    def lbdie : Bool
      @value.bits_set?(0x40_u32)
    end

    # LIN break detection interrupt              enable
    def self.lbdie : Bool
      value.lbdie
    end

    # LIN break detection interrupt              enable
    def self.lbdie=(value : Bool) : Bool
      self.set(lbdie: value)
      value
    end

    # lin break detection length
    def lbdl : Bool
      @value.bits_set?(0x20_u32)
    end

    # lin break detection length
    def self.lbdl : Bool
      value.lbdl
    end

    # lin break detection length
    def self.lbdl=(value : Bool) : Bool
      self.set(lbdl: value)
      value
    end

    # Address of the USART node
    def add : UInt8
      UInt8.new!((@value >> 0) & 0xf_u32)
    end

    # Address of the USART node
    def self.add : UInt8
      value.add
    end

    # Address of the USART node
    def self.add=(value : UInt8) : UInt8
      self.set(add: value)
      value
    end

    def copy_with(
      *,

      linen : Bool? = nil,

      stop : UInt8? = nil,

      clken : Bool? = nil,

      cpol : Bool? = nil,

      cpha : Bool? = nil,

      lbcl : Bool? = nil,

      lbdie : Bool? = nil,

      lbdl : Bool? = nil,

      add : UInt8? = nil
    ) : self
      value = @value

      unless linen.nil?
        value = (value & 0xffffbfff_u32) |
                UInt32.new!(linen.to_int).&(0x1_u32) << 14
      end

      unless stop.nil?
        value = (value & 0xffffcfff_u32) |
                UInt32.new!(stop.to_int).&(0x3_u32) << 12
      end

      unless clken.nil?
        value = (value & 0xfffff7ff_u32) |
                UInt32.new!(clken.to_int).&(0x1_u32) << 11
      end

      unless cpol.nil?
        value = (value & 0xfffffbff_u32) |
                UInt32.new!(cpol.to_int).&(0x1_u32) << 10
      end

      unless cpha.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(cpha.to_int).&(0x1_u32) << 9
      end

      unless lbcl.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(lbcl.to_int).&(0x1_u32) << 8
      end

      unless lbdie.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(lbdie.to_int).&(0x1_u32) << 6
      end

      unless lbdl.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(lbdl.to_int).&(0x1_u32) << 5
      end

      unless add.nil?
        value = (value & 0xfffffff0_u32) |
                UInt32.new!(add.to_int).&(0xf_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      linen : Bool? = nil,
      stop : UInt8? = nil,
      clken : Bool? = nil,
      cpol : Bool? = nil,
      cpha : Bool? = nil,
      lbcl : Bool? = nil,
      lbdie : Bool? = nil,
      lbdl : Bool? = nil,
      add : UInt8? = nil
    ) : Nil
      self.value = self.value.copy_with(
        linen: linen,
        stop: stop,
        clken: clken,
        cpol: cpol,
        cpha: cpha,
        lbcl: lbcl,
        lbdie: lbdie,
        lbdl: lbdl,
        add: add,
      )
    end
  end # struct

  # Control register 3
  struct CR3
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

    # One sample bit method              enable
    def onebit : Bool
      @value.bits_set?(0x800_u32)
    end

    # One sample bit method              enable
    def self.onebit : Bool
      value.onebit
    end

    # One sample bit method              enable
    def self.onebit=(value : Bool) : Bool
      self.set(onebit: value)
      value
    end

    # CTS interrupt enable
    def ctsie : Bool
      @value.bits_set?(0x400_u32)
    end

    # CTS interrupt enable
    def self.ctsie : Bool
      value.ctsie
    end

    # CTS interrupt enable
    def self.ctsie=(value : Bool) : Bool
      self.set(ctsie: value)
      value
    end

    # CTS enable
    def ctse : Bool
      @value.bits_set?(0x200_u32)
    end

    # CTS enable
    def self.ctse : Bool
      value.ctse
    end

    # CTS enable
    def self.ctse=(value : Bool) : Bool
      self.set(ctse: value)
      value
    end

    # RTS enable
    def rtse : Bool
      @value.bits_set?(0x100_u32)
    end

    # RTS enable
    def self.rtse : Bool
      value.rtse
    end

    # RTS enable
    def self.rtse=(value : Bool) : Bool
      self.set(rtse: value)
      value
    end

    # DMA enable transmitter
    def dmat : Bool
      @value.bits_set?(0x80_u32)
    end

    # DMA enable transmitter
    def self.dmat : Bool
      value.dmat
    end

    # DMA enable transmitter
    def self.dmat=(value : Bool) : Bool
      self.set(dmat: value)
      value
    end

    # DMA enable receiver
    def dmar : Bool
      @value.bits_set?(0x40_u32)
    end

    # DMA enable receiver
    def self.dmar : Bool
      value.dmar
    end

    # DMA enable receiver
    def self.dmar=(value : Bool) : Bool
      self.set(dmar: value)
      value
    end

    # Smartcard mode enable
    def scen : Bool
      @value.bits_set?(0x20_u32)
    end

    # Smartcard mode enable
    def self.scen : Bool
      value.scen
    end

    # Smartcard mode enable
    def self.scen=(value : Bool) : Bool
      self.set(scen: value)
      value
    end

    # Smartcard NACK enable
    def nack : Bool
      @value.bits_set?(0x10_u32)
    end

    # Smartcard NACK enable
    def self.nack : Bool
      value.nack
    end

    # Smartcard NACK enable
    def self.nack=(value : Bool) : Bool
      self.set(nack: value)
      value
    end

    # Half-duplex selection
    def hdsel : Bool
      @value.bits_set?(0x8_u32)
    end

    # Half-duplex selection
    def self.hdsel : Bool
      value.hdsel
    end

    # Half-duplex selection
    def self.hdsel=(value : Bool) : Bool
      self.set(hdsel: value)
      value
    end

    # IrDA low-power
    def irlp : Bool
      @value.bits_set?(0x4_u32)
    end

    # IrDA low-power
    def self.irlp : Bool
      value.irlp
    end

    # IrDA low-power
    def self.irlp=(value : Bool) : Bool
      self.set(irlp: value)
      value
    end

    # IrDA mode enable
    def iren : Bool
      @value.bits_set?(0x2_u32)
    end

    # IrDA mode enable
    def self.iren : Bool
      value.iren
    end

    # IrDA mode enable
    def self.iren=(value : Bool) : Bool
      self.set(iren: value)
      value
    end

    # Error interrupt enable
    def eie : Bool
      @value.bits_set?(0x1_u32)
    end

    # Error interrupt enable
    def self.eie : Bool
      value.eie
    end

    # Error interrupt enable
    def self.eie=(value : Bool) : Bool
      self.set(eie: value)
      value
    end

    def copy_with(
      *,

      onebit : Bool? = nil,

      ctsie : Bool? = nil,

      ctse : Bool? = nil,

      rtse : Bool? = nil,

      dmat : Bool? = nil,

      dmar : Bool? = nil,

      scen : Bool? = nil,

      nack : Bool? = nil,

      hdsel : Bool? = nil,

      irlp : Bool? = nil,

      iren : Bool? = nil,

      eie : Bool? = nil
    ) : self
      value = @value

      unless onebit.nil?
        value = (value & 0xfffff7ff_u32) |
                UInt32.new!(onebit.to_int).&(0x1_u32) << 11
      end

      unless ctsie.nil?
        value = (value & 0xfffffbff_u32) |
                UInt32.new!(ctsie.to_int).&(0x1_u32) << 10
      end

      unless ctse.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(ctse.to_int).&(0x1_u32) << 9
      end

      unless rtse.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(rtse.to_int).&(0x1_u32) << 8
      end

      unless dmat.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(dmat.to_int).&(0x1_u32) << 7
      end

      unless dmar.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(dmar.to_int).&(0x1_u32) << 6
      end

      unless scen.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(scen.to_int).&(0x1_u32) << 5
      end

      unless nack.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(nack.to_int).&(0x1_u32) << 4
      end

      unless hdsel.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(hdsel.to_int).&(0x1_u32) << 3
      end

      unless irlp.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(irlp.to_int).&(0x1_u32) << 2
      end

      unless iren.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(iren.to_int).&(0x1_u32) << 1
      end

      unless eie.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(eie.to_int).&(0x1_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      onebit : Bool? = nil,
      ctsie : Bool? = nil,
      ctse : Bool? = nil,
      rtse : Bool? = nil,
      dmat : Bool? = nil,
      dmar : Bool? = nil,
      scen : Bool? = nil,
      nack : Bool? = nil,
      hdsel : Bool? = nil,
      irlp : Bool? = nil,
      iren : Bool? = nil,
      eie : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        onebit: onebit,
        ctsie: ctsie,
        ctse: ctse,
        rtse: rtse,
        dmat: dmat,
        dmar: dmar,
        scen: scen,
        nack: nack,
        hdsel: hdsel,
        irlp: irlp,
        iren: iren,
        eie: eie,
      )
    end
  end # struct

  # Guard time and prescaler          register
  struct GTPR
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

    # Guard time value
    def gt : UInt8
      UInt8.new!((@value >> 8) & 0xff_u32)
    end

    # Guard time value
    def self.gt : UInt8
      value.gt
    end

    # Guard time value
    def self.gt=(value : UInt8) : UInt8
      self.set(gt: value)
      value
    end

    # Prescaler value
    def psc : UInt8
      UInt8.new!((@value >> 0) & 0xff_u32)
    end

    # Prescaler value
    def self.psc : UInt8
      value.psc
    end

    # Prescaler value
    def self.psc=(value : UInt8) : UInt8
      self.set(psc: value)
      value
    end

    def copy_with(
      *,

      gt : UInt8? = nil,

      psc : UInt8? = nil
    ) : self
      value = @value

      unless gt.nil?
        value = (value & 0xffff00ff_u32) |
                UInt32.new!(gt.to_int).&(0xff_u32) << 8
      end

      unless psc.nil?
        value = (value & 0xffffff00_u32) |
                UInt32.new!(psc.to_int).&(0xff_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      gt : UInt8? = nil,
      psc : UInt8? = nil
    ) : Nil
      self.value = self.value.copy_with(
        gt: gt,
        psc: psc,
      )
    end
  end # struct

end
