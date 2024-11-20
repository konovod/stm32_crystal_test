# Universal synchronous asynchronous receiver      transmitter
module USART1
  VERSION      = nil
  BASE_ADDRESS = 0x40013800_u64

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

    enum EOBIE : UInt8
      # Interrupt is inhibited
      DISABLED = 0x0_u64

      # A USART interrupt is generated when the EOBF flag is set in the ISR register
      ENABLED = 0x1_u64

      def self.reset_value : EOBIE
        CR1.reset_value.eobie
      end
    end

    # End of Block interrupt              enable
    def eobie : EOBIE
      EOBIE.new!((@value >> 27) & 0x1_u32)
    end

    # End of Block interrupt              enable
    def self.eobie : EOBIE
      value.eobie
    end

    # End of Block interrupt              enable
    def self.eobie=(value : EOBIE) : EOBIE
      self.set(eobie: value)
      value
    end

    enum RTOIE : UInt8
      # Interrupt is inhibited
      DISABLED = 0x0_u64

      # An USART interrupt is generated when the RTOF bit is set in the ISR register
      ENABLED = 0x1_u64

      def self.reset_value : RTOIE
        CR1.reset_value.rtoie
      end
    end

    # Receiver timeout interrupt              enable
    def rtoie : RTOIE
      RTOIE.new!((@value >> 26) & 0x1_u32)
    end

    # Receiver timeout interrupt              enable
    def self.rtoie : RTOIE
      value.rtoie
    end

    # Receiver timeout interrupt              enable
    def self.rtoie=(value : RTOIE) : RTOIE
      self.set(rtoie: value)
      value
    end

    # Driver Enable assertion              time
    def deat : UInt8
      UInt8.new!((@value >> 21) & 0x1f_u32)
    end

    # Driver Enable assertion              time
    def self.deat : UInt8
      value.deat
    end

    # Driver Enable assertion              time
    def self.deat=(value : UInt8) : UInt8
      self.set(deat: value)
      value
    end

    # Driver Enable deassertion              time
    def dedt : UInt8
      UInt8.new!((@value >> 16) & 0x1f_u32)
    end

    # Driver Enable deassertion              time
    def self.dedt : UInt8
      value.dedt
    end

    # Driver Enable deassertion              time
    def self.dedt=(value : UInt8) : UInt8
      self.set(dedt: value)
      value
    end

    enum OVER8 : UInt8
      # Oversampling by 16
      OVERSAMPLING16 = 0x0_u64

      # Oversampling by 8
      OVERSAMPLING8 = 0x1_u64

      def self.reset_value : OVER8
        CR1.reset_value.over8
      end
    end

    # Oversampling mode
    def over8 : OVER8
      OVER8.new!((@value >> 15) & 0x1_u32)
    end

    # Oversampling mode
    def self.over8 : OVER8
      value.over8
    end

    # Oversampling mode
    def self.over8=(value : OVER8) : OVER8
      self.set(over8: value)
      value
    end

    enum CMIE : UInt8
      # Interrupt is disabled
      DISABLED = 0x0_u64

      # Interrupt is generated when the CMF bit is set in the ISR register
      ENABLED = 0x1_u64

      def self.reset_value : CMIE
        CR1.reset_value.cmie
      end
    end

    # Character match interrupt              enable
    def cmie : CMIE
      CMIE.new!((@value >> 14) & 0x1_u32)
    end

    # Character match interrupt              enable
    def self.cmie : CMIE
      value.cmie
    end

    # Character match interrupt              enable
    def self.cmie=(value : CMIE) : CMIE
      self.set(cmie: value)
      value
    end

    enum MME : UInt8
      # Receiver in active mode permanently
      DISABLED = 0x0_u64

      # Receiver can switch between mute mode and active mode
      ENABLED = 0x1_u64

      def self.reset_value : MME
        CR1.reset_value.mme
      end
    end

    # Mute mode enable
    def mme : MME
      MME.new!((@value >> 13) & 0x1_u32)
    end

    # Mute mode enable
    def self.mme : MME
      value.mme
    end

    # Mute mode enable
    def self.mme=(value : MME) : MME
      self.set(mme: value)
      value
    end

    enum M : UInt8
      # 1 start bit, 8 data bits, n stop bits
      BIT8 = 0x0_u64

      # 1 start bit, 9 data bits, n stop bits
      BIT9 = 0x1_u64

      def self.reset_value : M
        CR1.reset_value.m
      end
    end

    # Word length
    def m : M
      M.new!((@value >> 12) & 0x1_u32)
    end

    # Word length
    def self.m : M
      value.m
    end

    # Word length
    def self.m=(value : M) : M
      self.set(m: value)
      value
    end

    enum WAKE : UInt8
      # Idle line
      IDLE = 0x0_u64

      # Address mask
      ADDRESS = 0x1_u64

      def self.reset_value : WAKE
        CR1.reset_value.wake
      end
    end

    # Receiver wakeup method
    def wake : WAKE
      WAKE.new!((@value >> 11) & 0x1_u32)
    end

    # Receiver wakeup method
    def self.wake : WAKE
      value.wake
    end

    # Receiver wakeup method
    def self.wake=(value : WAKE) : WAKE
      self.set(wake: value)
      value
    end

    enum PCE : UInt8
      # Parity control disabled
      DISABLED = 0x0_u64

      # Parity control enabled
      ENABLED = 0x1_u64

      def self.reset_value : PCE
        CR1.reset_value.pce
      end
    end

    # Parity control enable
    def pce : PCE
      PCE.new!((@value >> 10) & 0x1_u32)
    end

    # Parity control enable
    def self.pce : PCE
      value.pce
    end

    # Parity control enable
    def self.pce=(value : PCE) : PCE
      self.set(pce: value)
      value
    end

    enum PS : UInt8
      # Even parity
      EVEN = 0x0_u64

      # Odd parity
      ODD = 0x1_u64

      def self.reset_value : PS
        CR1.reset_value.ps
      end
    end

    # Parity selection
    def ps : PS
      PS.new!((@value >> 9) & 0x1_u32)
    end

    # Parity selection
    def self.ps : PS
      value.ps
    end

    # Parity selection
    def self.ps=(value : PS) : PS
      self.set(ps: value)
      value
    end

    enum PEIE : UInt8
      # Interrupt is disabled
      DISABLED = 0x0_u64

      # Interrupt is generated whenever PE=1 in the ISR register
      ENABLED = 0x1_u64

      def self.reset_value : PEIE
        CR1.reset_value.peie
      end
    end

    # PE interrupt enable
    def peie : PEIE
      PEIE.new!((@value >> 8) & 0x1_u32)
    end

    # PE interrupt enable
    def self.peie : PEIE
      value.peie
    end

    # PE interrupt enable
    def self.peie=(value : PEIE) : PEIE
      self.set(peie: value)
      value
    end

    enum TXEIE : UInt8
      # Interrupt is disabled
      DISABLED = 0x0_u64

      # Interrupt is generated whenever TXE=1 in the ISR register
      ENABLED = 0x1_u64

      def self.reset_value : TXEIE
        CR1.reset_value.txeie
      end
    end

    # interrupt enable
    def txeie : TXEIE
      TXEIE.new!((@value >> 7) & 0x1_u32)
    end

    # interrupt enable
    def self.txeie : TXEIE
      value.txeie
    end

    # interrupt enable
    def self.txeie=(value : TXEIE) : TXEIE
      self.set(txeie: value)
      value
    end

    enum TCIE : UInt8
      # Interrupt is disabled
      DISABLED = 0x0_u64

      # Interrupt is generated whenever TC=1 in the ISR register
      ENABLED = 0x1_u64

      def self.reset_value : TCIE
        CR1.reset_value.tcie
      end
    end

    # Transmission complete interrupt              enable
    def tcie : TCIE
      TCIE.new!((@value >> 6) & 0x1_u32)
    end

    # Transmission complete interrupt              enable
    def self.tcie : TCIE
      value.tcie
    end

    # Transmission complete interrupt              enable
    def self.tcie=(value : TCIE) : TCIE
      self.set(tcie: value)
      value
    end

    enum RXNEIE : UInt8
      # Interrupt is disabled
      DISABLED = 0x0_u64

      # Interrupt is generated whenever ORE=1 or RXNE=1 in the ISR register
      ENABLED = 0x1_u64

      def self.reset_value : RXNEIE
        CR1.reset_value.rxneie
      end
    end

    # RXNE interrupt enable
    def rxneie : RXNEIE
      RXNEIE.new!((@value >> 5) & 0x1_u32)
    end

    # RXNE interrupt enable
    def self.rxneie : RXNEIE
      value.rxneie
    end

    # RXNE interrupt enable
    def self.rxneie=(value : RXNEIE) : RXNEIE
      self.set(rxneie: value)
      value
    end

    enum IDLEIE : UInt8
      # Interrupt is disabled
      DISABLED = 0x0_u64

      # Interrupt is generated whenever IDLE=1 in the ISR register
      ENABLED = 0x1_u64

      def self.reset_value : IDLEIE
        CR1.reset_value.idleie
      end
    end

    # IDLE interrupt enable
    def idleie : IDLEIE
      IDLEIE.new!((@value >> 4) & 0x1_u32)
    end

    # IDLE interrupt enable
    def self.idleie : IDLEIE
      value.idleie
    end

    # IDLE interrupt enable
    def self.idleie=(value : IDLEIE) : IDLEIE
      self.set(idleie: value)
      value
    end

    enum TE : UInt8
      # Transmitter is disabled
      DISABLED = 0x0_u64

      # Transmitter is enabled
      ENABLED = 0x1_u64

      def self.reset_value : TE
        CR1.reset_value.te
      end
    end

    # Transmitter enable
    def te : TE
      TE.new!((@value >> 3) & 0x1_u32)
    end

    # Transmitter enable
    def self.te : TE
      value.te
    end

    # Transmitter enable
    def self.te=(value : TE) : TE
      self.set(te: value)
      value
    end

    enum RE : UInt8
      # Receiver is disabled
      DISABLED = 0x0_u64

      # Receiver is enabled
      ENABLED = 0x1_u64

      def self.reset_value : RE
        CR1.reset_value.re
      end
    end

    # Receiver enable
    def re : RE
      RE.new!((@value >> 2) & 0x1_u32)
    end

    # Receiver enable
    def self.re : RE
      value.re
    end

    # Receiver enable
    def self.re=(value : RE) : RE
      self.set(re: value)
      value
    end

    enum UESM : UInt8
      # USART not able to wake up the MCU from Stop mode
      DISABLED = 0x0_u64

      # USART able to wake up the MCU from Stop mode
      ENABLED = 0x1_u64

      def self.reset_value : UESM
        CR1.reset_value.uesm
      end
    end

    # USART enable in Stop mode
    def uesm : UESM
      UESM.new!((@value >> 1) & 0x1_u32)
    end

    # USART enable in Stop mode
    def self.uesm : UESM
      value.uesm
    end

    # USART enable in Stop mode
    def self.uesm=(value : UESM) : UESM
      self.set(uesm: value)
      value
    end

    enum UE : UInt8
      # UART is disabled
      DISABLED = 0x0_u64

      # UART is enabled
      ENABLED = 0x1_u64

      def self.reset_value : UE
        CR1.reset_value.ue
      end
    end

    # USART enable
    def ue : UE
      UE.new!((@value >> 0) & 0x1_u32)
    end

    # USART enable
    def self.ue : UE
      value.ue
    end

    # USART enable
    def self.ue=(value : UE) : UE
      self.set(ue: value)
      value
    end

    def copy_with(
      *,

      eobie : EOBIE? = nil,

      rtoie : RTOIE? = nil,

      deat : UInt8? = nil,

      dedt : UInt8? = nil,

      over8 : OVER8? = nil,

      cmie : CMIE? = nil,

      mme : MME? = nil,

      m : M? = nil,

      wake : WAKE? = nil,

      pce : PCE? = nil,

      ps : PS? = nil,

      peie : PEIE? = nil,

      txeie : TXEIE? = nil,

      tcie : TCIE? = nil,

      rxneie : RXNEIE? = nil,

      idleie : IDLEIE? = nil,

      te : TE? = nil,

      re : RE? = nil,

      uesm : UESM? = nil,

      ue : UE? = nil
    ) : self
      value = @value

      unless eobie.nil?
        value = (value & 0xf7ffffff_u32) |
                UInt32.new!(eobie.to_int).&(0x1_u32) << 27
      end

      unless rtoie.nil?
        value = (value & 0xfbffffff_u32) |
                UInt32.new!(rtoie.to_int).&(0x1_u32) << 26
      end

      unless deat.nil?
        value = (value & 0xfc1fffff_u32) |
                UInt32.new!(deat.to_int).&(0x1f_u32) << 21
      end

      unless dedt.nil?
        value = (value & 0xffe0ffff_u32) |
                UInt32.new!(dedt.to_int).&(0x1f_u32) << 16
      end

      unless over8.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(over8.to_int).&(0x1_u32) << 15
      end

      unless cmie.nil?
        value = (value & 0xffffbfff_u32) |
                UInt32.new!(cmie.to_int).&(0x1_u32) << 14
      end

      unless mme.nil?
        value = (value & 0xffffdfff_u32) |
                UInt32.new!(mme.to_int).&(0x1_u32) << 13
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

      unless uesm.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(uesm.to_int).&(0x1_u32) << 1
      end

      unless ue.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(ue.to_int).&(0x1_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      eobie : EOBIE? = nil,
      rtoie : RTOIE? = nil,
      deat : UInt8? = nil,
      dedt : UInt8? = nil,
      over8 : OVER8? = nil,
      cmie : CMIE? = nil,
      mme : MME? = nil,
      m : M? = nil,
      wake : WAKE? = nil,
      pce : PCE? = nil,
      ps : PS? = nil,
      peie : PEIE? = nil,
      txeie : TXEIE? = nil,
      tcie : TCIE? = nil,
      rxneie : RXNEIE? = nil,
      idleie : IDLEIE? = nil,
      te : TE? = nil,
      re : RE? = nil,
      uesm : UESM? = nil,
      ue : UE? = nil
    ) : Nil
      self.value = self.value.copy_with(
        eobie: eobie,
        rtoie: rtoie,
        deat: deat,
        dedt: dedt,
        over8: over8,
        cmie: cmie,
        mme: mme,
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
        uesm: uesm,
        ue: ue,
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

    enum RTOEN : UInt8
      # Receiver timeout feature disabled
      DISABLED = 0x0_u64

      # Receiver timeout feature enabled
      ENABLED = 0x1_u64

      def self.reset_value : RTOEN
        CR2.reset_value.rtoen
      end
    end

    # Receiver timeout enable
    def rtoen : RTOEN
      RTOEN.new!((@value >> 23) & 0x1_u32)
    end

    # Receiver timeout enable
    def self.rtoen : RTOEN
      value.rtoen
    end

    # Receiver timeout enable
    def self.rtoen=(value : RTOEN) : RTOEN
      self.set(rtoen: value)
      value
    end

    enum ABRMOD : UInt8
      # Measurement of the start bit is used to detect the baud rate
      START = 0x0_u64

      # Falling edge to falling edge measurement
      EDGE = 0x1_u64

      # 0x7F frame detection
      FRAME7F = 0x2_u64

      # 0x55 frame detection
      FRAME55 = 0x3_u64

      def self.reset_value : ABRMOD
        CR2.reset_value.abrmod
      end
    end

    # Auto baud rate mode
    def abrmod : ABRMOD
      ABRMOD.new!((@value >> 21) & 0x3_u32)
    end

    # Auto baud rate mode
    def self.abrmod : ABRMOD
      value.abrmod
    end

    # Auto baud rate mode
    def self.abrmod=(value : ABRMOD) : ABRMOD
      self.set(abrmod: value)
      value
    end

    enum ABREN : UInt8
      # Auto baud rate detection is disabled
      DISABLED = 0x0_u64

      # Auto baud rate detection is enabled
      ENABLED = 0x1_u64

      def self.reset_value : ABREN
        CR2.reset_value.abren
      end
    end

    # Auto baud rate enable
    def abren : ABREN
      ABREN.new!((@value >> 20) & 0x1_u32)
    end

    # Auto baud rate enable
    def self.abren : ABREN
      value.abren
    end

    # Auto baud rate enable
    def self.abren=(value : ABREN) : ABREN
      self.set(abren: value)
      value
    end

    enum MSBFIRST : UInt8
      # data is transmitted/received with data bit 0 first, following the start bit
      LSB = 0x0_u64

      # data is transmitted/received with MSB (bit 7/8/9) first, following the start bit
      MSB = 0x1_u64

      def self.reset_value : MSBFIRST
        CR2.reset_value.msbfirst
      end
    end

    # Most significant bit first
    def msbfirst : MSBFIRST
      MSBFIRST.new!((@value >> 19) & 0x1_u32)
    end

    # Most significant bit first
    def self.msbfirst : MSBFIRST
      value.msbfirst
    end

    # Most significant bit first
    def self.msbfirst=(value : MSBFIRST) : MSBFIRST
      self.set(msbfirst: value)
      value
    end

    enum DATAINV : UInt8
      # Logical data from the data register are send/received in positive/direct logic
      POSITIVE = 0x0_u64

      # Logical data from the data register are send/received in negative/inverse logic
      NEGATIVE = 0x1_u64

      def self.reset_value : DATAINV
        CR2.reset_value.datainv
      end
    end

    # Binary data inversion
    def datainv : DATAINV
      DATAINV.new!((@value >> 18) & 0x1_u32)
    end

    # Binary data inversion
    def self.datainv : DATAINV
      value.datainv
    end

    # Binary data inversion
    def self.datainv=(value : DATAINV) : DATAINV
      self.set(datainv: value)
      value
    end

    enum TXINV : UInt8
      # TX pin signal works using the standard logic levels
      STANDARD = 0x0_u64

      # TX pin signal values are inverted
      INVERTED = 0x1_u64

      def self.reset_value : TXINV
        CR2.reset_value.txinv
      end
    end

    # TX pin active level              inversion
    def txinv : TXINV
      TXINV.new!((@value >> 17) & 0x1_u32)
    end

    # TX pin active level              inversion
    def self.txinv : TXINV
      value.txinv
    end

    # TX pin active level              inversion
    def self.txinv=(value : TXINV) : TXINV
      self.set(txinv: value)
      value
    end

    enum RXINV : UInt8
      # RX pin signal works using the standard logic levels
      STANDARD = 0x0_u64

      # RX pin signal values are inverted
      INVERTED = 0x1_u64

      def self.reset_value : RXINV
        CR2.reset_value.rxinv
      end
    end

    # RX pin active level              inversion
    def rxinv : RXINV
      RXINV.new!((@value >> 16) & 0x1_u32)
    end

    # RX pin active level              inversion
    def self.rxinv : RXINV
      value.rxinv
    end

    # RX pin active level              inversion
    def self.rxinv=(value : RXINV) : RXINV
      self.set(rxinv: value)
      value
    end

    enum SWAP : UInt8
      # TX/RX pins are used as defined in standard pinout
      STANDARD = 0x0_u64

      # The TX and RX pins functions are swapped
      SWAPPED = 0x1_u64

      def self.reset_value : SWAP
        CR2.reset_value.swap
      end
    end

    # Swap TX/RX pins
    def swap : SWAP
      SWAP.new!((@value >> 15) & 0x1_u32)
    end

    # Swap TX/RX pins
    def self.swap : SWAP
      value.swap
    end

    # Swap TX/RX pins
    def self.swap=(value : SWAP) : SWAP
      self.set(swap: value)
      value
    end

    enum LINEN : UInt8
      # LIN mode disabled
      DISABLED = 0x0_u64

      # LIN mode enabled
      ENABLED = 0x1_u64

      def self.reset_value : LINEN
        CR2.reset_value.linen
      end
    end

    # LIN mode enable
    def linen : LINEN
      LINEN.new!((@value >> 14) & 0x1_u32)
    end

    # LIN mode enable
    def self.linen : LINEN
      value.linen
    end

    # LIN mode enable
    def self.linen=(value : LINEN) : LINEN
      self.set(linen: value)
      value
    end

    enum STOP : UInt8
      # 1 stop bit
      STOP1 = 0x0_u64

      # 0.5 stop bit
      STOP0P5 = 0x1_u64

      # 2 stop bit
      STOP2 = 0x2_u64

      # 1.5 stop bit
      STOP1P5 = 0x3_u64

      def self.reset_value : STOP
        CR2.reset_value.stop
      end
    end

    # STOP bits
    def stop : STOP
      STOP.new!((@value >> 12) & 0x3_u32)
    end

    # STOP bits
    def self.stop : STOP
      value.stop
    end

    # STOP bits
    def self.stop=(value : STOP) : STOP
      self.set(stop: value)
      value
    end

    enum CLKEN : UInt8
      # CK pin disabled
      DISABLED = 0x0_u64

      # CK pin enabled
      ENABLED = 0x1_u64

      def self.reset_value : CLKEN
        CR2.reset_value.clken
      end
    end

    # Clock enable
    def clken : CLKEN
      CLKEN.new!((@value >> 11) & 0x1_u32)
    end

    # Clock enable
    def self.clken : CLKEN
      value.clken
    end

    # Clock enable
    def self.clken=(value : CLKEN) : CLKEN
      self.set(clken: value)
      value
    end

    enum CPOL : UInt8
      # Steady low value on CK pin outside transmission window
      LOW = 0x0_u64

      # Steady high value on CK pin outside transmission window
      HIGH = 0x1_u64

      def self.reset_value : CPOL
        CR2.reset_value.cpol
      end
    end

    # Clock polarity
    def cpol : CPOL
      CPOL.new!((@value >> 10) & 0x1_u32)
    end

    # Clock polarity
    def self.cpol : CPOL
      value.cpol
    end

    # Clock polarity
    def self.cpol=(value : CPOL) : CPOL
      self.set(cpol: value)
      value
    end

    enum CPHA : UInt8
      # The first clock transition is the first data capture edge
      FIRST = 0x0_u64

      # The second clock transition is the first data capture edge
      SECOND = 0x1_u64

      def self.reset_value : CPHA
        CR2.reset_value.cpha
      end
    end

    # Clock phase
    def cpha : CPHA
      CPHA.new!((@value >> 9) & 0x1_u32)
    end

    # Clock phase
    def self.cpha : CPHA
      value.cpha
    end

    # Clock phase
    def self.cpha=(value : CPHA) : CPHA
      self.set(cpha: value)
      value
    end

    enum LBCL : UInt8
      # The clock pulse of the last data bit is not output to the CK pin
      NOTOUTPUT = 0x0_u64

      # The clock pulse of the last data bit is output to the CK pin
      OUTPUT = 0x1_u64

      def self.reset_value : LBCL
        CR2.reset_value.lbcl
      end
    end

    # Last bit clock pulse
    def lbcl : LBCL
      LBCL.new!((@value >> 8) & 0x1_u32)
    end

    # Last bit clock pulse
    def self.lbcl : LBCL
      value.lbcl
    end

    # Last bit clock pulse
    def self.lbcl=(value : LBCL) : LBCL
      self.set(lbcl: value)
      value
    end

    enum LBDIE : UInt8
      # Interrupt is inhibited
      DISABLED = 0x0_u64

      # An interrupt is generated whenever LBDF=1 in the ISR register
      ENABLED = 0x1_u64

      def self.reset_value : LBDIE
        CR2.reset_value.lbdie
      end
    end

    # LIN break detection interrupt              enable
    def lbdie : LBDIE
      LBDIE.new!((@value >> 6) & 0x1_u32)
    end

    # LIN break detection interrupt              enable
    def self.lbdie : LBDIE
      value.lbdie
    end

    # LIN break detection interrupt              enable
    def self.lbdie=(value : LBDIE) : LBDIE
      self.set(lbdie: value)
      value
    end

    enum LBDL : UInt8
      # 10-bit break detection
      BIT10 = 0x0_u64

      # 11-bit break detection
      BIT11 = 0x1_u64

      def self.reset_value : LBDL
        CR2.reset_value.lbdl
      end
    end

    # LIN break detection length
    def lbdl : LBDL
      LBDL.new!((@value >> 5) & 0x1_u32)
    end

    # LIN break detection length
    def self.lbdl : LBDL
      value.lbdl
    end

    # LIN break detection length
    def self.lbdl=(value : LBDL) : LBDL
      self.set(lbdl: value)
      value
    end

    enum ADDM7 : UInt8
      # 4-bit address detection
      BIT4 = 0x0_u64

      # 7-bit address detection
      BIT7 = 0x1_u64

      def self.reset_value : ADDM7
        CR2.reset_value.addm7
      end
    end

    # 7-bit Address Detection/4-bit Address              Detection
    def addm7 : ADDM7
      ADDM7.new!((@value >> 4) & 0x1_u32)
    end

    # 7-bit Address Detection/4-bit Address              Detection
    def self.addm7 : ADDM7
      value.addm7
    end

    # 7-bit Address Detection/4-bit Address              Detection
    def self.addm7=(value : ADDM7) : ADDM7
      self.set(addm7: value)
      value
    end

    # Address of the USART node
    def add : UInt8
      UInt8.new!((@value >> 24) & 0xff_u32)
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

      rtoen : RTOEN? = nil,

      abrmod : ABRMOD? = nil,

      abren : ABREN? = nil,

      msbfirst : MSBFIRST? = nil,

      datainv : DATAINV? = nil,

      txinv : TXINV? = nil,

      rxinv : RXINV? = nil,

      swap : SWAP? = nil,

      linen : LINEN? = nil,

      stop : STOP? = nil,

      clken : CLKEN? = nil,

      cpol : CPOL? = nil,

      cpha : CPHA? = nil,

      lbcl : LBCL? = nil,

      lbdie : LBDIE? = nil,

      lbdl : LBDL? = nil,

      addm7 : ADDM7? = nil,

      add : UInt8? = nil
    ) : self
      value = @value

      unless rtoen.nil?
        value = (value & 0xff7fffff_u32) |
                UInt32.new!(rtoen.to_int).&(0x1_u32) << 23
      end

      unless abrmod.nil?
        value = (value & 0xff9fffff_u32) |
                UInt32.new!(abrmod.to_int).&(0x3_u32) << 21
      end

      unless abren.nil?
        value = (value & 0xffefffff_u32) |
                UInt32.new!(abren.to_int).&(0x1_u32) << 20
      end

      unless msbfirst.nil?
        value = (value & 0xfff7ffff_u32) |
                UInt32.new!(msbfirst.to_int).&(0x1_u32) << 19
      end

      unless datainv.nil?
        value = (value & 0xfffbffff_u32) |
                UInt32.new!(datainv.to_int).&(0x1_u32) << 18
      end

      unless txinv.nil?
        value = (value & 0xfffdffff_u32) |
                UInt32.new!(txinv.to_int).&(0x1_u32) << 17
      end

      unless rxinv.nil?
        value = (value & 0xfffeffff_u32) |
                UInt32.new!(rxinv.to_int).&(0x1_u32) << 16
      end

      unless swap.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(swap.to_int).&(0x1_u32) << 15
      end

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

      unless addm7.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(addm7.to_int).&(0x1_u32) << 4
      end

      unless add.nil?
        value = (value & 0xffffff_u32) |
                UInt32.new!(add.to_int).&(0xff_u32) << 24
      end

      self.class.new(value)
    end

    def self.set(
      *,
      rtoen : RTOEN? = nil,
      abrmod : ABRMOD? = nil,
      abren : ABREN? = nil,
      msbfirst : MSBFIRST? = nil,
      datainv : DATAINV? = nil,
      txinv : TXINV? = nil,
      rxinv : RXINV? = nil,
      swap : SWAP? = nil,
      linen : LINEN? = nil,
      stop : STOP? = nil,
      clken : CLKEN? = nil,
      cpol : CPOL? = nil,
      cpha : CPHA? = nil,
      lbcl : LBCL? = nil,
      lbdie : LBDIE? = nil,
      lbdl : LBDL? = nil,
      addm7 : ADDM7? = nil,
      add : UInt8? = nil
    ) : Nil
      self.value = self.value.copy_with(
        rtoen: rtoen,
        abrmod: abrmod,
        abren: abren,
        msbfirst: msbfirst,
        datainv: datainv,
        txinv: txinv,
        rxinv: rxinv,
        swap: swap,
        linen: linen,
        stop: stop,
        clken: clken,
        cpol: cpol,
        cpha: cpha,
        lbcl: lbcl,
        lbdie: lbdie,
        lbdl: lbdl,
        addm7: addm7,
        add: add,
      )
    end
  end # struct

  # Control register 3
  struct CR3
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

    enum WUFIE : UInt8
      # Interrupt is inhibited
      DISABLED = 0x0_u64

      # An USART interrupt is generated whenever WUF=1 in the ISR register
      ENABLED = 0x1_u64

      def self.reset_value : WUFIE
        CR3.reset_value.wufie
      end
    end

    # Wakeup from Stop mode interrupt              enable
    def wufie : WUFIE
      WUFIE.new!((@value >> 22) & 0x1_u32)
    end

    # Wakeup from Stop mode interrupt              enable
    def self.wufie : WUFIE
      value.wufie
    end

    # Wakeup from Stop mode interrupt              enable
    def self.wufie=(value : WUFIE) : WUFIE
      self.set(wufie: value)
      value
    end

    enum WUS : UInt8
      # WUF active on address match
      ADDRESS = 0x0_u64

      # WuF active on Start bit detection
      START = 0x2_u64

      # WUF active on RXNE
      RXNE = 0x3_u64

      def self.reset_value : WUS
        CR3.reset_value.wus
      end
    end

    # Wakeup from Stop mode interrupt flag              selection
    def wus : WUS
      WUS.new!((@value >> 20) & 0x3_u32)
    end

    # Wakeup from Stop mode interrupt flag              selection
    def self.wus : WUS
      value.wus
    end

    # Wakeup from Stop mode interrupt flag              selection
    def self.wus=(value : WUS) : WUS
      self.set(wus: value)
      value
    end

    # Smartcard auto-retry count
    def scarcnt : UInt8
      UInt8.new!((@value >> 17) & 0x7_u32)
    end

    # Smartcard auto-retry count
    def self.scarcnt : UInt8
      value.scarcnt
    end

    # Smartcard auto-retry count
    def self.scarcnt=(value : UInt8) : UInt8
      self.set(scarcnt: value)
      value
    end

    enum DEP : UInt8
      # DE signal is active high
      HIGH = 0x0_u64

      # DE signal is active low
      LOW = 0x1_u64

      def self.reset_value : DEP
        CR3.reset_value.dep
      end
    end

    # Driver enable polarity              selection
    def dep : DEP
      DEP.new!((@value >> 15) & 0x1_u32)
    end

    # Driver enable polarity              selection
    def self.dep : DEP
      value.dep
    end

    # Driver enable polarity              selection
    def self.dep=(value : DEP) : DEP
      self.set(dep: value)
      value
    end

    enum DEM : UInt8
      # DE function is disabled
      DISABLED = 0x0_u64

      # The DE signal is output on the RTS pin
      ENABLED = 0x1_u64

      def self.reset_value : DEM
        CR3.reset_value.dem
      end
    end

    # Driver enable mode
    def dem : DEM
      DEM.new!((@value >> 14) & 0x1_u32)
    end

    # Driver enable mode
    def self.dem : DEM
      value.dem
    end

    # Driver enable mode
    def self.dem=(value : DEM) : DEM
      self.set(dem: value)
      value
    end

    enum DDRE : UInt8
      # DMA is not disabled in case of reception error
      NOTDISABLED = 0x0_u64

      # DMA is disabled following a reception error
      DISABLED = 0x1_u64

      def self.reset_value : DDRE
        CR3.reset_value.ddre
      end
    end

    # DMA Disable on Reception              Error
    def ddre : DDRE
      DDRE.new!((@value >> 13) & 0x1_u32)
    end

    # DMA Disable on Reception              Error
    def self.ddre : DDRE
      value.ddre
    end

    # DMA Disable on Reception              Error
    def self.ddre=(value : DDRE) : DDRE
      self.set(ddre: value)
      value
    end

    enum OVRDIS : UInt8
      # Overrun Error Flag, ORE, is set when received data is not read before receiving new data
      ENABLED = 0x0_u64

      # Overrun functionality is disabled. If new data is received while the RXNE flag is still set the ORE flag is not set and the new received data overwrites the previous content of the RDR register
      DISABLED = 0x1_u64

      def self.reset_value : OVRDIS
        CR3.reset_value.ovrdis
      end
    end

    # Overrun Disable
    def ovrdis : OVRDIS
      OVRDIS.new!((@value >> 12) & 0x1_u32)
    end

    # Overrun Disable
    def self.ovrdis : OVRDIS
      value.ovrdis
    end

    # Overrun Disable
    def self.ovrdis=(value : OVRDIS) : OVRDIS
      self.set(ovrdis: value)
      value
    end

    enum ONEBIT : UInt8
      # Three sample bit method
      SAMPLE3 = 0x0_u64

      # One sample bit method
      SAMPLE1 = 0x1_u64

      def self.reset_value : ONEBIT
        CR3.reset_value.onebit
      end
    end

    # One sample bit method              enable
    def onebit : ONEBIT
      ONEBIT.new!((@value >> 11) & 0x1_u32)
    end

    # One sample bit method              enable
    def self.onebit : ONEBIT
      value.onebit
    end

    # One sample bit method              enable
    def self.onebit=(value : ONEBIT) : ONEBIT
      self.set(onebit: value)
      value
    end

    enum CTSIE : UInt8
      # Interrupt is inhibited
      DISABLED = 0x0_u64

      # An interrupt is generated whenever CTSIF=1 in the ISR register
      ENABLED = 0x1_u64

      def self.reset_value : CTSIE
        CR3.reset_value.ctsie
      end
    end

    # CTS interrupt enable
    def ctsie : CTSIE
      CTSIE.new!((@value >> 10) & 0x1_u32)
    end

    # CTS interrupt enable
    def self.ctsie : CTSIE
      value.ctsie
    end

    # CTS interrupt enable
    def self.ctsie=(value : CTSIE) : CTSIE
      self.set(ctsie: value)
      value
    end

    enum CTSE : UInt8
      # CTS hardware flow control disabled
      DISABLED = 0x0_u64

      # CTS mode enabled, data is only transmitted when the CTS input is asserted
      ENABLED = 0x1_u64

      def self.reset_value : CTSE
        CR3.reset_value.ctse
      end
    end

    # CTS enable
    def ctse : CTSE
      CTSE.new!((@value >> 9) & 0x1_u32)
    end

    # CTS enable
    def self.ctse : CTSE
      value.ctse
    end

    # CTS enable
    def self.ctse=(value : CTSE) : CTSE
      self.set(ctse: value)
      value
    end

    enum RTSE : UInt8
      # RTS hardware flow control disabled
      DISABLED = 0x0_u64

      # RTS output enabled, data is only requested when there is space in the receive buffer
      ENABLED = 0x1_u64

      def self.reset_value : RTSE
        CR3.reset_value.rtse
      end
    end

    # RTS enable
    def rtse : RTSE
      RTSE.new!((@value >> 8) & 0x1_u32)
    end

    # RTS enable
    def self.rtse : RTSE
      value.rtse
    end

    # RTS enable
    def self.rtse=(value : RTSE) : RTSE
      self.set(rtse: value)
      value
    end

    enum DMAT : UInt8
      # DMA mode is disabled for transmission
      DISABLED = 0x0_u64

      # DMA mode is enabled for transmission
      ENABLED = 0x1_u64

      def self.reset_value : DMAT
        CR3.reset_value.dmat
      end
    end

    # DMA enable transmitter
    def dmat : DMAT
      DMAT.new!((@value >> 7) & 0x1_u32)
    end

    # DMA enable transmitter
    def self.dmat : DMAT
      value.dmat
    end

    # DMA enable transmitter
    def self.dmat=(value : DMAT) : DMAT
      self.set(dmat: value)
      value
    end

    enum DMAR : UInt8
      # DMA mode is disabled for reception
      DISABLED = 0x0_u64

      # DMA mode is enabled for reception
      ENABLED = 0x1_u64

      def self.reset_value : DMAR
        CR3.reset_value.dmar
      end
    end

    # DMA enable receiver
    def dmar : DMAR
      DMAR.new!((@value >> 6) & 0x1_u32)
    end

    # DMA enable receiver
    def self.dmar : DMAR
      value.dmar
    end

    # DMA enable receiver
    def self.dmar=(value : DMAR) : DMAR
      self.set(dmar: value)
      value
    end

    enum SCEN : UInt8
      # Smartcard Mode disabled
      DISABLED = 0x0_u64

      # Smartcard Mode enabled
      ENABLED = 0x1_u64

      def self.reset_value : SCEN
        CR3.reset_value.scen
      end
    end

    # Smartcard mode enable
    def scen : SCEN
      SCEN.new!((@value >> 5) & 0x1_u32)
    end

    # Smartcard mode enable
    def self.scen : SCEN
      value.scen
    end

    # Smartcard mode enable
    def self.scen=(value : SCEN) : SCEN
      self.set(scen: value)
      value
    end

    enum NACK : UInt8
      # NACK transmission in case of parity error is disabled
      DISABLED = 0x0_u64

      # NACK transmission during parity error is enabled
      ENABLED = 0x1_u64

      def self.reset_value : NACK
        CR3.reset_value.nack
      end
    end

    # Smartcard NACK enable
    def nack : NACK
      NACK.new!((@value >> 4) & 0x1_u32)
    end

    # Smartcard NACK enable
    def self.nack : NACK
      value.nack
    end

    # Smartcard NACK enable
    def self.nack=(value : NACK) : NACK
      self.set(nack: value)
      value
    end

    enum HDSEL : UInt8
      # Half duplex mode is not selected
      NOTSELECTED = 0x0_u64

      # Half duplex mode is selected
      SELECTED = 0x1_u64

      def self.reset_value : HDSEL
        CR3.reset_value.hdsel
      end
    end

    # Half-duplex selection
    def hdsel : HDSEL
      HDSEL.new!((@value >> 3) & 0x1_u32)
    end

    # Half-duplex selection
    def self.hdsel : HDSEL
      value.hdsel
    end

    # Half-duplex selection
    def self.hdsel=(value : HDSEL) : HDSEL
      self.set(hdsel: value)
      value
    end

    enum IRLP : UInt8
      # Normal mode
      NORMAL = 0x0_u64

      # Low-power mode
      LOWPOWER = 0x1_u64

      def self.reset_value : IRLP
        CR3.reset_value.irlp
      end
    end

    # IrDA low-power
    def irlp : IRLP
      IRLP.new!((@value >> 2) & 0x1_u32)
    end

    # IrDA low-power
    def self.irlp : IRLP
      value.irlp
    end

    # IrDA low-power
    def self.irlp=(value : IRLP) : IRLP
      self.set(irlp: value)
      value
    end

    enum IREN : UInt8
      # IrDA disabled
      DISABLED = 0x0_u64

      # IrDA enabled
      ENABLED = 0x1_u64

      def self.reset_value : IREN
        CR3.reset_value.iren
      end
    end

    # IrDA mode enable
    def iren : IREN
      IREN.new!((@value >> 1) & 0x1_u32)
    end

    # IrDA mode enable
    def self.iren : IREN
      value.iren
    end

    # IrDA mode enable
    def self.iren=(value : IREN) : IREN
      self.set(iren: value)
      value
    end

    enum EIE : UInt8
      # Interrupt is inhibited
      DISABLED = 0x0_u64

      # An interrupt is generated when FE=1 or ORE=1 or NF=1 in the ISR register
      ENABLED = 0x1_u64

      def self.reset_value : EIE
        CR3.reset_value.eie
      end
    end

    # Error interrupt enable
    def eie : EIE
      EIE.new!((@value >> 0) & 0x1_u32)
    end

    # Error interrupt enable
    def self.eie : EIE
      value.eie
    end

    # Error interrupt enable
    def self.eie=(value : EIE) : EIE
      self.set(eie: value)
      value
    end

    def copy_with(
      *,

      wufie : WUFIE? = nil,

      wus : WUS? = nil,

      scarcnt : UInt8? = nil,

      dep : DEP? = nil,

      dem : DEM? = nil,

      ddre : DDRE? = nil,

      ovrdis : OVRDIS? = nil,

      onebit : ONEBIT? = nil,

      ctsie : CTSIE? = nil,

      ctse : CTSE? = nil,

      rtse : RTSE? = nil,

      dmat : DMAT? = nil,

      dmar : DMAR? = nil,

      scen : SCEN? = nil,

      nack : NACK? = nil,

      hdsel : HDSEL? = nil,

      irlp : IRLP? = nil,

      iren : IREN? = nil,

      eie : EIE? = nil
    ) : self
      value = @value

      unless wufie.nil?
        value = (value & 0xffbfffff_u32) |
                UInt32.new!(wufie.to_int).&(0x1_u32) << 22
      end

      unless wus.nil?
        value = (value & 0xffcfffff_u32) |
                UInt32.new!(wus.to_int).&(0x3_u32) << 20
      end

      unless scarcnt.nil?
        value = (value & 0xfff1ffff_u32) |
                UInt32.new!(scarcnt.to_int).&(0x7_u32) << 17
      end

      unless dep.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(dep.to_int).&(0x1_u32) << 15
      end

      unless dem.nil?
        value = (value & 0xffffbfff_u32) |
                UInt32.new!(dem.to_int).&(0x1_u32) << 14
      end

      unless ddre.nil?
        value = (value & 0xffffdfff_u32) |
                UInt32.new!(ddre.to_int).&(0x1_u32) << 13
      end

      unless ovrdis.nil?
        value = (value & 0xffffefff_u32) |
                UInt32.new!(ovrdis.to_int).&(0x1_u32) << 12
      end

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
      wufie : WUFIE? = nil,
      wus : WUS? = nil,
      scarcnt : UInt8? = nil,
      dep : DEP? = nil,
      dem : DEM? = nil,
      ddre : DDRE? = nil,
      ovrdis : OVRDIS? = nil,
      onebit : ONEBIT? = nil,
      ctsie : CTSIE? = nil,
      ctse : CTSE? = nil,
      rtse : RTSE? = nil,
      dmat : DMAT? = nil,
      dmar : DMAR? = nil,
      scen : SCEN? = nil,
      nack : NACK? = nil,
      hdsel : HDSEL? = nil,
      irlp : IRLP? = nil,
      iren : IREN? = nil,
      eie : EIE? = nil
    ) : Nil
      self.value = self.value.copy_with(
        wufie: wufie,
        wus: wus,
        scarcnt: scarcnt,
        dep: dep,
        dem: dem,
        ddre: ddre,
        ovrdis: ovrdis,
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

  # Baud rate register
  struct BRR
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

    # mantissa of USARTDIV
    def brr : UInt16
      UInt16.new!((@value >> 0) & 0xffff_u32)
    end

    # mantissa of USARTDIV
    def self.brr : UInt16
      value.brr
    end

    # mantissa of USARTDIV
    def self.brr=(value : UInt16) : UInt16
      self.set(brr: value)
      value
    end

    def copy_with(
      *,

      brr : UInt16? = nil
    ) : self
      value = @value

      unless brr.nil?
        value = (value & 0xffff0000_u32) |
                UInt32.new!(brr.to_int).&(0xffff_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      brr : UInt16? = nil
    ) : Nil
      self.value = self.value.copy_with(
        brr: brr,
      )
    end
  end # struct

  # Guard time and prescaler          register
  struct GTPR
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

  # Receiver timeout register
  struct RTOR
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

    # Block Length
    def blen : UInt8
      UInt8.new!((@value >> 24) & 0xff_u32)
    end

    # Block Length
    def self.blen : UInt8
      value.blen
    end

    # Block Length
    def self.blen=(value : UInt8) : UInt8
      self.set(blen: value)
      value
    end

    # Receiver timeout value
    def rto : UInt32
      UInt32.new!((@value >> 0) & 0xffffff_u32)
    end

    # Receiver timeout value
    def self.rto : UInt32
      value.rto
    end

    # Receiver timeout value
    def self.rto=(value : UInt32) : UInt32
      self.set(rto: value)
      value
    end

    def copy_with(
      *,

      blen : UInt8? = nil,

      rto : UInt32? = nil
    ) : self
      value = @value

      unless blen.nil?
        value = (value & 0xffffff_u32) |
                UInt32.new!(blen.to_int).&(0xff_u32) << 24
      end

      unless rto.nil?
        value = (value & 0xff000000_u32) |
                UInt32.new!(rto.to_int).&(0xffffff_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      blen : UInt8? = nil,
      rto : UInt32? = nil
    ) : Nil
      self.value = self.value.copy_with(
        blen: blen,
        rto: rto,
      )
    end
  end # struct

  # Request register
  struct RQR
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

    enum TXFRQ : UInt8
      # Set the TXE flags. This allows to discard the transmit data
      DISCARD = 0x1_u64

      def self.reset_value : TXFRQ
        RQR.reset_value.txfrq
      end
    end

    # Transmit data flush              request
    def txfrq : TXFRQ
      TXFRQ.new!((@value >> 4) & 0x1_u32)
    end

    # Transmit data flush              request
    def self.txfrq : TXFRQ
      value.txfrq
    end

    # Transmit data flush              request
    def self.txfrq=(value : TXFRQ) : TXFRQ
      self.set(txfrq: value)
      value
    end

    enum RXFRQ : UInt8
      # clears the RXNE flag. This allows to discard the received data without reading it, and avoid an overrun condition
      DISCARD = 0x1_u64

      def self.reset_value : RXFRQ
        RQR.reset_value.rxfrq
      end
    end

    # Receive data flush request
    def rxfrq : RXFRQ
      RXFRQ.new!((@value >> 3) & 0x1_u32)
    end

    # Receive data flush request
    def self.rxfrq : RXFRQ
      value.rxfrq
    end

    # Receive data flush request
    def self.rxfrq=(value : RXFRQ) : RXFRQ
      self.set(rxfrq: value)
      value
    end

    enum MMRQ : UInt8
      # Puts the USART in mute mode and sets the RWU flag
      MUTE = 0x1_u64

      def self.reset_value : MMRQ
        RQR.reset_value.mmrq
      end
    end

    # Mute mode request
    def mmrq : MMRQ
      MMRQ.new!((@value >> 2) & 0x1_u32)
    end

    # Mute mode request
    def self.mmrq : MMRQ
      value.mmrq
    end

    # Mute mode request
    def self.mmrq=(value : MMRQ) : MMRQ
      self.set(mmrq: value)
      value
    end

    enum SBKRQ : UInt8
      # sets the SBKF flag and request to send a BREAK on the line, as soon as the transmit machine is available
      BREAK = 0x1_u64

      def self.reset_value : SBKRQ
        RQR.reset_value.sbkrq
      end
    end

    # Send break request
    def sbkrq : SBKRQ
      SBKRQ.new!((@value >> 1) & 0x1_u32)
    end

    # Send break request
    def self.sbkrq : SBKRQ
      value.sbkrq
    end

    # Send break request
    def self.sbkrq=(value : SBKRQ) : SBKRQ
      self.set(sbkrq: value)
      value
    end

    enum ABRRQ : UInt8
      # resets the ABRF flag in the USART_ISR and request an automatic baud rate measurement on the next received data frame
      REQUEST = 0x1_u64

      def self.reset_value : ABRRQ
        RQR.reset_value.abrrq
      end
    end

    # Auto baud rate request
    def abrrq : ABRRQ
      ABRRQ.new!((@value >> 0) & 0x1_u32)
    end

    # Auto baud rate request
    def self.abrrq : ABRRQ
      value.abrrq
    end

    # Auto baud rate request
    def self.abrrq=(value : ABRRQ) : ABRRQ
      self.set(abrrq: value)
      value
    end

    def copy_with(
      *,

      txfrq : TXFRQ? = nil,

      rxfrq : RXFRQ? = nil,

      mmrq : MMRQ? = nil,

      sbkrq : SBKRQ? = nil,

      abrrq : ABRRQ? = nil
    ) : self
      value = @value

      unless txfrq.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(txfrq.to_int).&(0x1_u32) << 4
      end

      unless rxfrq.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(rxfrq.to_int).&(0x1_u32) << 3
      end

      unless mmrq.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(mmrq.to_int).&(0x1_u32) << 2
      end

      unless sbkrq.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(sbkrq.to_int).&(0x1_u32) << 1
      end

      unless abrrq.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(abrrq.to_int).&(0x1_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      txfrq : TXFRQ? = nil,
      rxfrq : RXFRQ? = nil,
      mmrq : MMRQ? = nil,
      sbkrq : SBKRQ? = nil,
      abrrq : ABRRQ? = nil
    ) : Nil
      self.value = self.value.copy_with(
        txfrq: txfrq,
        rxfrq: rxfrq,
        mmrq: mmrq,
        sbkrq: sbkrq,
        abrrq: abrrq,
      )
    end
  end # struct

  # Interrupt & status          register
  struct ISR
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
      new(0xc0_u64)
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

    # Receive enable acknowledge              flag
    def reack : Bool
      @value.bits_set?(0x400000_u32)
    end

    # Receive enable acknowledge              flag
    def self.reack : Bool
      value.reack
    end

    # Transmit enable acknowledge              flag
    def teack : Bool
      @value.bits_set?(0x200000_u32)
    end

    # Transmit enable acknowledge              flag
    def self.teack : Bool
      value.teack
    end

    # Wakeup from Stop mode flag
    def wuf : Bool
      @value.bits_set?(0x100000_u32)
    end

    # Wakeup from Stop mode flag
    def self.wuf : Bool
      value.wuf
    end

    # Receiver wakeup from Mute              mode
    def rwu : Bool
      @value.bits_set?(0x80000_u32)
    end

    # Receiver wakeup from Mute              mode
    def self.rwu : Bool
      value.rwu
    end

    # Send break flag
    def sbkf : Bool
      @value.bits_set?(0x40000_u32)
    end

    # Send break flag
    def self.sbkf : Bool
      value.sbkf
    end

    # character match flag
    def cmf : Bool
      @value.bits_set?(0x20000_u32)
    end

    # character match flag
    def self.cmf : Bool
      value.cmf
    end

    # Busy flag
    def busy : Bool
      @value.bits_set?(0x10000_u32)
    end

    # Busy flag
    def self.busy : Bool
      value.busy
    end

    # Auto baud rate flag
    def abrf : Bool
      @value.bits_set?(0x8000_u32)
    end

    # Auto baud rate flag
    def self.abrf : Bool
      value.abrf
    end

    # Auto baud rate error
    def abre : Bool
      @value.bits_set?(0x4000_u32)
    end

    # Auto baud rate error
    def self.abre : Bool
      value.abre
    end

    # End of block flag
    def eobf : Bool
      @value.bits_set?(0x1000_u32)
    end

    # End of block flag
    def self.eobf : Bool
      value.eobf
    end

    # Receiver timeout
    def rtof : Bool
      @value.bits_set?(0x800_u32)
    end

    # Receiver timeout
    def self.rtof : Bool
      value.rtof
    end

    # CTS flag
    def cts : Bool
      @value.bits_set?(0x400_u32)
    end

    # CTS flag
    def self.cts : Bool
      value.cts
    end

    # CTS interrupt flag
    def ctsif : Bool
      @value.bits_set?(0x200_u32)
    end

    # CTS interrupt flag
    def self.ctsif : Bool
      value.ctsif
    end

    # LIN break detection flag
    def lbdf : Bool
      @value.bits_set?(0x100_u32)
    end

    # LIN break detection flag
    def self.lbdf : Bool
      value.lbdf
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

    # Read data register not              empty
    def rxne : Bool
      @value.bits_set?(0x20_u32)
    end

    # Read data register not              empty
    def self.rxne : Bool
      value.rxne
    end

    # Idle line detected
    def idle : Bool
      @value.bits_set?(0x10_u32)
    end

    # Idle line detected
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
  end # struct

  # Interrupt flag clear register
  struct ICR
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

    enum WUCF : UInt8
      # Clears the WUF flag in the ISR register
      CLEAR = 0x1_u64

      def self.reset_value : WUCF
        ICR.reset_value.wucf
      end
    end

    # Wakeup from Stop mode clear              flag
    def wucf : WUCF
      WUCF.new!((@value >> 20) & 0x1_u32)
    end

    # Wakeup from Stop mode clear              flag
    def self.wucf : WUCF
      value.wucf
    end

    # Wakeup from Stop mode clear              flag
    def self.wucf=(value : WUCF) : WUCF
      self.set(wucf: value)
      value
    end

    enum CMCF : UInt8
      # Clears the CMF flag in the ISR register
      CLEAR = 0x1_u64

      def self.reset_value : CMCF
        ICR.reset_value.cmcf
      end
    end

    # Character match clear flag
    def cmcf : CMCF
      CMCF.new!((@value >> 17) & 0x1_u32)
    end

    # Character match clear flag
    def self.cmcf : CMCF
      value.cmcf
    end

    # Character match clear flag
    def self.cmcf=(value : CMCF) : CMCF
      self.set(cmcf: value)
      value
    end

    enum EOBCF : UInt8
      # Clears the EOBF flag in the ISR register
      CLEAR = 0x1_u64

      def self.reset_value : EOBCF
        ICR.reset_value.eobcf
      end
    end

    # End of timeout clear flag
    def eobcf : EOBCF
      EOBCF.new!((@value >> 12) & 0x1_u32)
    end

    # End of timeout clear flag
    def self.eobcf : EOBCF
      value.eobcf
    end

    # End of timeout clear flag
    def self.eobcf=(value : EOBCF) : EOBCF
      self.set(eobcf: value)
      value
    end

    enum RTOCF : UInt8
      # Clears the RTOF flag in the ISR register
      CLEAR = 0x1_u64

      def self.reset_value : RTOCF
        ICR.reset_value.rtocf
      end
    end

    # Receiver timeout clear              flag
    def rtocf : RTOCF
      RTOCF.new!((@value >> 11) & 0x1_u32)
    end

    # Receiver timeout clear              flag
    def self.rtocf : RTOCF
      value.rtocf
    end

    # Receiver timeout clear              flag
    def self.rtocf=(value : RTOCF) : RTOCF
      self.set(rtocf: value)
      value
    end

    enum CTSCF : UInt8
      # Clears the CTSIF flag in the ISR register
      CLEAR = 0x1_u64

      def self.reset_value : CTSCF
        ICR.reset_value.ctscf
      end
    end

    # CTS clear flag
    def ctscf : CTSCF
      CTSCF.new!((@value >> 9) & 0x1_u32)
    end

    # CTS clear flag
    def self.ctscf : CTSCF
      value.ctscf
    end

    # CTS clear flag
    def self.ctscf=(value : CTSCF) : CTSCF
      self.set(ctscf: value)
      value
    end

    enum LBDCF : UInt8
      # Clears the LBDF flag in the ISR register
      CLEAR = 0x1_u64

      def self.reset_value : LBDCF
        ICR.reset_value.lbdcf
      end
    end

    # LIN break detection clear              flag
    def lbdcf : LBDCF
      LBDCF.new!((@value >> 8) & 0x1_u32)
    end

    # LIN break detection clear              flag
    def self.lbdcf : LBDCF
      value.lbdcf
    end

    # LIN break detection clear              flag
    def self.lbdcf=(value : LBDCF) : LBDCF
      self.set(lbdcf: value)
      value
    end

    enum TCCF : UInt8
      # Clears the TC flag in the ISR register
      CLEAR = 0x1_u64

      def self.reset_value : TCCF
        ICR.reset_value.tccf
      end
    end

    # Transmission complete clear              flag
    def tccf : TCCF
      TCCF.new!((@value >> 6) & 0x1_u32)
    end

    # Transmission complete clear              flag
    def self.tccf : TCCF
      value.tccf
    end

    # Transmission complete clear              flag
    def self.tccf=(value : TCCF) : TCCF
      self.set(tccf: value)
      value
    end

    enum IDLECF : UInt8
      # Clears the IDLE flag in the ISR register
      CLEAR = 0x1_u64

      def self.reset_value : IDLECF
        ICR.reset_value.idlecf
      end
    end

    # Idle line detected clear              flag
    def idlecf : IDLECF
      IDLECF.new!((@value >> 4) & 0x1_u32)
    end

    # Idle line detected clear              flag
    def self.idlecf : IDLECF
      value.idlecf
    end

    # Idle line detected clear              flag
    def self.idlecf=(value : IDLECF) : IDLECF
      self.set(idlecf: value)
      value
    end

    enum ORECF : UInt8
      # Clears the ORE flag in the ISR register
      CLEAR = 0x1_u64

      def self.reset_value : ORECF
        ICR.reset_value.orecf
      end
    end

    # Overrun error clear flag
    def orecf : ORECF
      ORECF.new!((@value >> 3) & 0x1_u32)
    end

    # Overrun error clear flag
    def self.orecf : ORECF
      value.orecf
    end

    # Overrun error clear flag
    def self.orecf=(value : ORECF) : ORECF
      self.set(orecf: value)
      value
    end

    enum NCF : UInt8
      # Clears the NF flag in the ISR register
      CLEAR = 0x1_u64

      def self.reset_value : NCF
        ICR.reset_value.ncf
      end
    end

    # Noise detected clear flag
    def ncf : NCF
      NCF.new!((@value >> 2) & 0x1_u32)
    end

    # Noise detected clear flag
    def self.ncf : NCF
      value.ncf
    end

    # Noise detected clear flag
    def self.ncf=(value : NCF) : NCF
      self.set(ncf: value)
      value
    end

    enum FECF : UInt8
      # Clears the FE flag in the ISR register
      CLEAR = 0x1_u64

      def self.reset_value : FECF
        ICR.reset_value.fecf
      end
    end

    # Framing error clear flag
    def fecf : FECF
      FECF.new!((@value >> 1) & 0x1_u32)
    end

    # Framing error clear flag
    def self.fecf : FECF
      value.fecf
    end

    # Framing error clear flag
    def self.fecf=(value : FECF) : FECF
      self.set(fecf: value)
      value
    end

    enum PECF : UInt8
      # Clears the PE flag in the ISR register
      CLEAR = 0x1_u64

      def self.reset_value : PECF
        ICR.reset_value.pecf
      end
    end

    # Parity error clear flag
    def pecf : PECF
      PECF.new!((@value >> 0) & 0x1_u32)
    end

    # Parity error clear flag
    def self.pecf : PECF
      value.pecf
    end

    # Parity error clear flag
    def self.pecf=(value : PECF) : PECF
      self.set(pecf: value)
      value
    end

    def copy_with(
      *,

      wucf : WUCF? = nil,

      cmcf : CMCF? = nil,

      eobcf : EOBCF? = nil,

      rtocf : RTOCF? = nil,

      ctscf : CTSCF? = nil,

      lbdcf : LBDCF? = nil,

      tccf : TCCF? = nil,

      idlecf : IDLECF? = nil,

      orecf : ORECF? = nil,

      ncf : NCF? = nil,

      fecf : FECF? = nil,

      pecf : PECF? = nil
    ) : self
      value = @value

      unless wucf.nil?
        value = (value & 0xffefffff_u32) |
                UInt32.new!(wucf.to_int).&(0x1_u32) << 20
      end

      unless cmcf.nil?
        value = (value & 0xfffdffff_u32) |
                UInt32.new!(cmcf.to_int).&(0x1_u32) << 17
      end

      unless eobcf.nil?
        value = (value & 0xffffefff_u32) |
                UInt32.new!(eobcf.to_int).&(0x1_u32) << 12
      end

      unless rtocf.nil?
        value = (value & 0xfffff7ff_u32) |
                UInt32.new!(rtocf.to_int).&(0x1_u32) << 11
      end

      unless ctscf.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(ctscf.to_int).&(0x1_u32) << 9
      end

      unless lbdcf.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(lbdcf.to_int).&(0x1_u32) << 8
      end

      unless tccf.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(tccf.to_int).&(0x1_u32) << 6
      end

      unless idlecf.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(idlecf.to_int).&(0x1_u32) << 4
      end

      unless orecf.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(orecf.to_int).&(0x1_u32) << 3
      end

      unless ncf.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(ncf.to_int).&(0x1_u32) << 2
      end

      unless fecf.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(fecf.to_int).&(0x1_u32) << 1
      end

      unless pecf.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(pecf.to_int).&(0x1_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      wucf : WUCF? = nil,
      cmcf : CMCF? = nil,
      eobcf : EOBCF? = nil,
      rtocf : RTOCF? = nil,
      ctscf : CTSCF? = nil,
      lbdcf : LBDCF? = nil,
      tccf : TCCF? = nil,
      idlecf : IDLECF? = nil,
      orecf : ORECF? = nil,
      ncf : NCF? = nil,
      fecf : FECF? = nil,
      pecf : PECF? = nil
    ) : Nil
      self.value = self.value.copy_with(
        wucf: wucf,
        cmcf: cmcf,
        eobcf: eobcf,
        rtocf: rtocf,
        ctscf: ctscf,
        lbdcf: lbdcf,
        tccf: tccf,
        idlecf: idlecf,
        orecf: orecf,
        ncf: ncf,
        fecf: fecf,
        pecf: pecf,
      )
    end
  end # struct

  # Receive data register
  struct RDR
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

    # Receive data value
    def rdr : UInt16
      UInt16.new!((@value >> 0) & 0x1ff_u32)
    end

    # Receive data value
    def self.rdr : UInt16
      value.rdr
    end
  end # struct

  # Transmit data register
  struct TDR
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

    # Transmit data value
    def tdr : UInt16
      UInt16.new!((@value >> 0) & 0x1ff_u32)
    end

    # Transmit data value
    def self.tdr : UInt16
      value.tdr
    end

    # Transmit data value
    def self.tdr=(value : UInt16) : UInt16
      self.set(tdr: value)
      value
    end

    def copy_with(
      *,

      tdr : UInt16? = nil
    ) : self
      value = @value

      unless tdr.nil?
        value = (value & 0xfffffe00_u32) |
                UInt32.new!(tdr.to_int).&(0x1ff_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      tdr : UInt16? = nil
    ) : Nil
      self.value = self.value.copy_with(
        tdr: tdr,
      )
    end
  end # struct

end
