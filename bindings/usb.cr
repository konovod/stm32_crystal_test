# Universal serial bus full-speed device      interface
module USB
  VERSION      = nil
  BASE_ADDRESS = 0x40005c00_u64

  # endpoint 0 register
  struct EP0R
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

    # Endpoint address
    def ea : UInt8
      UInt8.new!((@value >> 0) & 0xf_u32)
    end

    # Endpoint address
    def self.ea : UInt8
      value.ea
    end

    # Endpoint address
    def self.ea=(value : UInt8) : UInt8
      self.set(ea: value)
      value
    end

    enum STAT_TX : UInt8
      # all transmission requests addressed to this endpoint are ignored
      DISABLED = 0x0_u64

      # the endpoint is stalled and all transmission requests result in a STALL handshake
      STALL = 0x1_u64

      # the endpoint is naked and all transmission requests result in a NAK handshake
      NAK = 0x2_u64

      # this endpoint is enabled for transmission
      VALID = 0x3_u64

      def self.reset_value : STAT_TX
        EP0R.reset_value.stat_tx
      end
    end

    # Status bits, for transmission              transfers
    def stat_tx : STAT_TX
      STAT_TX.new!((@value >> 4) & 0x3_u32)
    end

    # Status bits, for transmission              transfers
    def self.stat_tx : STAT_TX
      value.stat_tx
    end

    # Status bits, for transmission              transfers
    def self.stat_tx=(value : STAT_TX) : STAT_TX
      self.set(stat_tx: value)
      value
    end

    # Data Toggle, for transmission              transfers
    def dtog_tx : Bool
      @value.bits_set?(0x40_u32)
    end

    # Data Toggle, for transmission              transfers
    def self.dtog_tx : Bool
      value.dtog_tx
    end

    # Data Toggle, for transmission              transfers
    def self.dtog_tx=(value : Bool) : Bool
      self.set(dtog_tx: value)
      value
    end

    # Correct Transfer for              transmission
    def ctr_tx : Bool
      @value.bits_set?(0x80_u32)
    end

    # Correct Transfer for              transmission
    def self.ctr_tx : Bool
      value.ctr_tx
    end

    # Correct Transfer for              transmission
    def self.ctr_tx=(value : Bool) : Bool
      self.set(ctr_tx: value)
      value
    end

    # Endpoint kind
    def ep_kind : Bool
      @value.bits_set?(0x100_u32)
    end

    # Endpoint kind
    def self.ep_kind : Bool
      value.ep_kind
    end

    # Endpoint kind
    def self.ep_kind=(value : Bool) : Bool
      self.set(ep_kind: value)
      value
    end

    enum EP_TYPE : UInt8
      # Bulk endpoint
      BULK = 0x0_u64

      # Control endpoint
      CONTROL = 0x1_u64

      # Iso endpoint
      ISO = 0x2_u64

      # Interrupt endpoint
      INTERRUPT = 0x3_u64

      def self.reset_value : EP_TYPE
        EP0R.reset_value.ep_type
      end
    end

    # Endpoint type
    def ep_type : EP_TYPE
      EP_TYPE.new!((@value >> 9) & 0x3_u32)
    end

    # Endpoint type
    def self.ep_type : EP_TYPE
      value.ep_type
    end

    # Endpoint type
    def self.ep_type=(value : EP_TYPE) : EP_TYPE
      self.set(ep_type: value)
      value
    end

    # Setup transaction              completed
    def setup : Bool
      @value.bits_set?(0x800_u32)
    end

    # Setup transaction              completed
    def self.setup : Bool
      value.setup
    end

    enum STAT_RX : UInt8
      # all reception requests addressed to this endpoint are ignored
      DISABLED = 0x0_u64

      # the endpoint is stalled and all reception requests result in a STALL handshake
      STALL = 0x1_u64

      # the endpoint is naked and all reception requests result in a NAK handshake
      NAK = 0x2_u64

      # this endpoint is enabled for reception
      VALID = 0x3_u64

      def self.reset_value : STAT_RX
        EP0R.reset_value.stat_rx
      end
    end

    # Status bits, for reception              transfers
    def stat_rx : STAT_RX
      STAT_RX.new!((@value >> 12) & 0x3_u32)
    end

    # Status bits, for reception              transfers
    def self.stat_rx : STAT_RX
      value.stat_rx
    end

    # Status bits, for reception              transfers
    def self.stat_rx=(value : STAT_RX) : STAT_RX
      self.set(stat_rx: value)
      value
    end

    # Data Toggle, for reception              transfers
    def dtog_rx : Bool
      @value.bits_set?(0x4000_u32)
    end

    # Data Toggle, for reception              transfers
    def self.dtog_rx : Bool
      value.dtog_rx
    end

    # Data Toggle, for reception              transfers
    def self.dtog_rx=(value : Bool) : Bool
      self.set(dtog_rx: value)
      value
    end

    # Correct transfer for              reception
    def ctr_rx : Bool
      @value.bits_set?(0x8000_u32)
    end

    # Correct transfer for              reception
    def self.ctr_rx : Bool
      value.ctr_rx
    end

    # Correct transfer for              reception
    def self.ctr_rx=(value : Bool) : Bool
      self.set(ctr_rx: value)
      value
    end

    def copy_with(
      *,

      ea : UInt8? = nil,

      stat_tx : STAT_TX? = nil,

      dtog_tx : Bool? = nil,

      ctr_tx : Bool? = nil,

      ep_kind : Bool? = nil,

      ep_type : EP_TYPE? = nil,

      stat_rx : STAT_RX? = nil,

      dtog_rx : Bool? = nil,

      ctr_rx : Bool? = nil
    ) : self
      value = @value

      unless ea.nil?
        value = (value & 0xfffffff0_u32) |
                UInt32.new!(ea.to_int).&(0xf_u32) << 0
      end

      unless stat_tx.nil?
        value = (value & 0xffffffcf_u32) |
                UInt32.new!(stat_tx.to_int).&(0x3_u32) << 4
      end

      unless dtog_tx.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(dtog_tx.to_int).&(0x1_u32) << 6
      end

      unless ctr_tx.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(ctr_tx.to_int).&(0x1_u32) << 7
      end

      unless ep_kind.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(ep_kind.to_int).&(0x1_u32) << 8
      end

      unless ep_type.nil?
        value = (value & 0xfffff9ff_u32) |
                UInt32.new!(ep_type.to_int).&(0x3_u32) << 9
      end

      unless stat_rx.nil?
        value = (value & 0xffffcfff_u32) |
                UInt32.new!(stat_rx.to_int).&(0x3_u32) << 12
      end

      unless dtog_rx.nil?
        value = (value & 0xffffbfff_u32) |
                UInt32.new!(dtog_rx.to_int).&(0x1_u32) << 14
      end

      unless ctr_rx.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(ctr_rx.to_int).&(0x1_u32) << 15
      end

      self.class.new(value)
    end

    def self.set(
      *,
      ea : UInt8? = nil,
      stat_tx : STAT_TX? = nil,
      dtog_tx : Bool? = nil,
      ctr_tx : Bool? = nil,
      ep_kind : Bool? = nil,
      ep_type : EP_TYPE? = nil,
      stat_rx : STAT_RX? = nil,
      dtog_rx : Bool? = nil,
      ctr_rx : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        ea: ea,
        stat_tx: stat_tx,
        dtog_tx: dtog_tx,
        ctr_tx: ctr_tx,
        ep_kind: ep_kind,
        ep_type: ep_type,
        stat_rx: stat_rx,
        dtog_rx: dtog_rx,
        ctr_rx: ctr_rx,
      )
    end
  end # struct

  # endpoint 1 register
  struct EP1R
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

    # Endpoint address
    def ea : UInt8
      UInt8.new!((@value >> 0) & 0xf_u32)
    end

    # Endpoint address
    def self.ea : UInt8
      value.ea
    end

    # Endpoint address
    def self.ea=(value : UInt8) : UInt8
      self.set(ea: value)
      value
    end

    enum STAT_TX : UInt8
      # all transmission requests addressed to this endpoint are ignored
      DISABLED = 0x0_u64

      # the endpoint is stalled and all transmission requests result in a STALL handshake
      STALL = 0x1_u64

      # the endpoint is naked and all transmission requests result in a NAK handshake
      NAK = 0x2_u64

      # this endpoint is enabled for transmission
      VALID = 0x3_u64

      def self.reset_value : STAT_TX
        EP1R.reset_value.stat_tx
      end
    end

    # Status bits, for transmission              transfers
    def stat_tx : STAT_TX
      STAT_TX.new!((@value >> 4) & 0x3_u32)
    end

    # Status bits, for transmission              transfers
    def self.stat_tx : STAT_TX
      value.stat_tx
    end

    # Status bits, for transmission              transfers
    def self.stat_tx=(value : STAT_TX) : STAT_TX
      self.set(stat_tx: value)
      value
    end

    # Data Toggle, for transmission              transfers
    def dtog_tx : Bool
      @value.bits_set?(0x40_u32)
    end

    # Data Toggle, for transmission              transfers
    def self.dtog_tx : Bool
      value.dtog_tx
    end

    # Data Toggle, for transmission              transfers
    def self.dtog_tx=(value : Bool) : Bool
      self.set(dtog_tx: value)
      value
    end

    # Correct Transfer for              transmission
    def ctr_tx : Bool
      @value.bits_set?(0x80_u32)
    end

    # Correct Transfer for              transmission
    def self.ctr_tx : Bool
      value.ctr_tx
    end

    # Correct Transfer for              transmission
    def self.ctr_tx=(value : Bool) : Bool
      self.set(ctr_tx: value)
      value
    end

    # Endpoint kind
    def ep_kind : Bool
      @value.bits_set?(0x100_u32)
    end

    # Endpoint kind
    def self.ep_kind : Bool
      value.ep_kind
    end

    # Endpoint kind
    def self.ep_kind=(value : Bool) : Bool
      self.set(ep_kind: value)
      value
    end

    enum EP_TYPE : UInt8
      # Bulk endpoint
      BULK = 0x0_u64

      # Control endpoint
      CONTROL = 0x1_u64

      # Iso endpoint
      ISO = 0x2_u64

      # Interrupt endpoint
      INTERRUPT = 0x3_u64

      def self.reset_value : EP_TYPE
        EP1R.reset_value.ep_type
      end
    end

    # Endpoint type
    def ep_type : EP_TYPE
      EP_TYPE.new!((@value >> 9) & 0x3_u32)
    end

    # Endpoint type
    def self.ep_type : EP_TYPE
      value.ep_type
    end

    # Endpoint type
    def self.ep_type=(value : EP_TYPE) : EP_TYPE
      self.set(ep_type: value)
      value
    end

    # Setup transaction              completed
    def setup : Bool
      @value.bits_set?(0x800_u32)
    end

    # Setup transaction              completed
    def self.setup : Bool
      value.setup
    end

    enum STAT_RX : UInt8
      # all reception requests addressed to this endpoint are ignored
      DISABLED = 0x0_u64

      # the endpoint is stalled and all reception requests result in a STALL handshake
      STALL = 0x1_u64

      # the endpoint is naked and all reception requests result in a NAK handshake
      NAK = 0x2_u64

      # this endpoint is enabled for reception
      VALID = 0x3_u64

      def self.reset_value : STAT_RX
        EP1R.reset_value.stat_rx
      end
    end

    # Status bits, for reception              transfers
    def stat_rx : STAT_RX
      STAT_RX.new!((@value >> 12) & 0x3_u32)
    end

    # Status bits, for reception              transfers
    def self.stat_rx : STAT_RX
      value.stat_rx
    end

    # Status bits, for reception              transfers
    def self.stat_rx=(value : STAT_RX) : STAT_RX
      self.set(stat_rx: value)
      value
    end

    # Data Toggle, for reception              transfers
    def dtog_rx : Bool
      @value.bits_set?(0x4000_u32)
    end

    # Data Toggle, for reception              transfers
    def self.dtog_rx : Bool
      value.dtog_rx
    end

    # Data Toggle, for reception              transfers
    def self.dtog_rx=(value : Bool) : Bool
      self.set(dtog_rx: value)
      value
    end

    # Correct transfer for              reception
    def ctr_rx : Bool
      @value.bits_set?(0x8000_u32)
    end

    # Correct transfer for              reception
    def self.ctr_rx : Bool
      value.ctr_rx
    end

    # Correct transfer for              reception
    def self.ctr_rx=(value : Bool) : Bool
      self.set(ctr_rx: value)
      value
    end

    def copy_with(
      *,

      ea : UInt8? = nil,

      stat_tx : STAT_TX? = nil,

      dtog_tx : Bool? = nil,

      ctr_tx : Bool? = nil,

      ep_kind : Bool? = nil,

      ep_type : EP_TYPE? = nil,

      stat_rx : STAT_RX? = nil,

      dtog_rx : Bool? = nil,

      ctr_rx : Bool? = nil
    ) : self
      value = @value

      unless ea.nil?
        value = (value & 0xfffffff0_u32) |
                UInt32.new!(ea.to_int).&(0xf_u32) << 0
      end

      unless stat_tx.nil?
        value = (value & 0xffffffcf_u32) |
                UInt32.new!(stat_tx.to_int).&(0x3_u32) << 4
      end

      unless dtog_tx.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(dtog_tx.to_int).&(0x1_u32) << 6
      end

      unless ctr_tx.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(ctr_tx.to_int).&(0x1_u32) << 7
      end

      unless ep_kind.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(ep_kind.to_int).&(0x1_u32) << 8
      end

      unless ep_type.nil?
        value = (value & 0xfffff9ff_u32) |
                UInt32.new!(ep_type.to_int).&(0x3_u32) << 9
      end

      unless stat_rx.nil?
        value = (value & 0xffffcfff_u32) |
                UInt32.new!(stat_rx.to_int).&(0x3_u32) << 12
      end

      unless dtog_rx.nil?
        value = (value & 0xffffbfff_u32) |
                UInt32.new!(dtog_rx.to_int).&(0x1_u32) << 14
      end

      unless ctr_rx.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(ctr_rx.to_int).&(0x1_u32) << 15
      end

      self.class.new(value)
    end

    def self.set(
      *,
      ea : UInt8? = nil,
      stat_tx : STAT_TX? = nil,
      dtog_tx : Bool? = nil,
      ctr_tx : Bool? = nil,
      ep_kind : Bool? = nil,
      ep_type : EP_TYPE? = nil,
      stat_rx : STAT_RX? = nil,
      dtog_rx : Bool? = nil,
      ctr_rx : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        ea: ea,
        stat_tx: stat_tx,
        dtog_tx: dtog_tx,
        ctr_tx: ctr_tx,
        ep_kind: ep_kind,
        ep_type: ep_type,
        stat_rx: stat_rx,
        dtog_rx: dtog_rx,
        ctr_rx: ctr_rx,
      )
    end
  end # struct

  # endpoint 2 register
  struct EP2R
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

    # Endpoint address
    def ea : UInt8
      UInt8.new!((@value >> 0) & 0xf_u32)
    end

    # Endpoint address
    def self.ea : UInt8
      value.ea
    end

    # Endpoint address
    def self.ea=(value : UInt8) : UInt8
      self.set(ea: value)
      value
    end

    enum STAT_TX : UInt8
      # all transmission requests addressed to this endpoint are ignored
      DISABLED = 0x0_u64

      # the endpoint is stalled and all transmission requests result in a STALL handshake
      STALL = 0x1_u64

      # the endpoint is naked and all transmission requests result in a NAK handshake
      NAK = 0x2_u64

      # this endpoint is enabled for transmission
      VALID = 0x3_u64

      def self.reset_value : STAT_TX
        EP2R.reset_value.stat_tx
      end
    end

    # Status bits, for transmission              transfers
    def stat_tx : STAT_TX
      STAT_TX.new!((@value >> 4) & 0x3_u32)
    end

    # Status bits, for transmission              transfers
    def self.stat_tx : STAT_TX
      value.stat_tx
    end

    # Status bits, for transmission              transfers
    def self.stat_tx=(value : STAT_TX) : STAT_TX
      self.set(stat_tx: value)
      value
    end

    # Data Toggle, for transmission              transfers
    def dtog_tx : Bool
      @value.bits_set?(0x40_u32)
    end

    # Data Toggle, for transmission              transfers
    def self.dtog_tx : Bool
      value.dtog_tx
    end

    # Data Toggle, for transmission              transfers
    def self.dtog_tx=(value : Bool) : Bool
      self.set(dtog_tx: value)
      value
    end

    # Correct Transfer for              transmission
    def ctr_tx : Bool
      @value.bits_set?(0x80_u32)
    end

    # Correct Transfer for              transmission
    def self.ctr_tx : Bool
      value.ctr_tx
    end

    # Correct Transfer for              transmission
    def self.ctr_tx=(value : Bool) : Bool
      self.set(ctr_tx: value)
      value
    end

    # Endpoint kind
    def ep_kind : Bool
      @value.bits_set?(0x100_u32)
    end

    # Endpoint kind
    def self.ep_kind : Bool
      value.ep_kind
    end

    # Endpoint kind
    def self.ep_kind=(value : Bool) : Bool
      self.set(ep_kind: value)
      value
    end

    enum EP_TYPE : UInt8
      # Bulk endpoint
      BULK = 0x0_u64

      # Control endpoint
      CONTROL = 0x1_u64

      # Iso endpoint
      ISO = 0x2_u64

      # Interrupt endpoint
      INTERRUPT = 0x3_u64

      def self.reset_value : EP_TYPE
        EP2R.reset_value.ep_type
      end
    end

    # Endpoint type
    def ep_type : EP_TYPE
      EP_TYPE.new!((@value >> 9) & 0x3_u32)
    end

    # Endpoint type
    def self.ep_type : EP_TYPE
      value.ep_type
    end

    # Endpoint type
    def self.ep_type=(value : EP_TYPE) : EP_TYPE
      self.set(ep_type: value)
      value
    end

    # Setup transaction              completed
    def setup : Bool
      @value.bits_set?(0x800_u32)
    end

    # Setup transaction              completed
    def self.setup : Bool
      value.setup
    end

    enum STAT_RX : UInt8
      # all reception requests addressed to this endpoint are ignored
      DISABLED = 0x0_u64

      # the endpoint is stalled and all reception requests result in a STALL handshake
      STALL = 0x1_u64

      # the endpoint is naked and all reception requests result in a NAK handshake
      NAK = 0x2_u64

      # this endpoint is enabled for reception
      VALID = 0x3_u64

      def self.reset_value : STAT_RX
        EP2R.reset_value.stat_rx
      end
    end

    # Status bits, for reception              transfers
    def stat_rx : STAT_RX
      STAT_RX.new!((@value >> 12) & 0x3_u32)
    end

    # Status bits, for reception              transfers
    def self.stat_rx : STAT_RX
      value.stat_rx
    end

    # Status bits, for reception              transfers
    def self.stat_rx=(value : STAT_RX) : STAT_RX
      self.set(stat_rx: value)
      value
    end

    # Data Toggle, for reception              transfers
    def dtog_rx : Bool
      @value.bits_set?(0x4000_u32)
    end

    # Data Toggle, for reception              transfers
    def self.dtog_rx : Bool
      value.dtog_rx
    end

    # Data Toggle, for reception              transfers
    def self.dtog_rx=(value : Bool) : Bool
      self.set(dtog_rx: value)
      value
    end

    # Correct transfer for              reception
    def ctr_rx : Bool
      @value.bits_set?(0x8000_u32)
    end

    # Correct transfer for              reception
    def self.ctr_rx : Bool
      value.ctr_rx
    end

    # Correct transfer for              reception
    def self.ctr_rx=(value : Bool) : Bool
      self.set(ctr_rx: value)
      value
    end

    def copy_with(
      *,

      ea : UInt8? = nil,

      stat_tx : STAT_TX? = nil,

      dtog_tx : Bool? = nil,

      ctr_tx : Bool? = nil,

      ep_kind : Bool? = nil,

      ep_type : EP_TYPE? = nil,

      stat_rx : STAT_RX? = nil,

      dtog_rx : Bool? = nil,

      ctr_rx : Bool? = nil
    ) : self
      value = @value

      unless ea.nil?
        value = (value & 0xfffffff0_u32) |
                UInt32.new!(ea.to_int).&(0xf_u32) << 0
      end

      unless stat_tx.nil?
        value = (value & 0xffffffcf_u32) |
                UInt32.new!(stat_tx.to_int).&(0x3_u32) << 4
      end

      unless dtog_tx.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(dtog_tx.to_int).&(0x1_u32) << 6
      end

      unless ctr_tx.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(ctr_tx.to_int).&(0x1_u32) << 7
      end

      unless ep_kind.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(ep_kind.to_int).&(0x1_u32) << 8
      end

      unless ep_type.nil?
        value = (value & 0xfffff9ff_u32) |
                UInt32.new!(ep_type.to_int).&(0x3_u32) << 9
      end

      unless stat_rx.nil?
        value = (value & 0xffffcfff_u32) |
                UInt32.new!(stat_rx.to_int).&(0x3_u32) << 12
      end

      unless dtog_rx.nil?
        value = (value & 0xffffbfff_u32) |
                UInt32.new!(dtog_rx.to_int).&(0x1_u32) << 14
      end

      unless ctr_rx.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(ctr_rx.to_int).&(0x1_u32) << 15
      end

      self.class.new(value)
    end

    def self.set(
      *,
      ea : UInt8? = nil,
      stat_tx : STAT_TX? = nil,
      dtog_tx : Bool? = nil,
      ctr_tx : Bool? = nil,
      ep_kind : Bool? = nil,
      ep_type : EP_TYPE? = nil,
      stat_rx : STAT_RX? = nil,
      dtog_rx : Bool? = nil,
      ctr_rx : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        ea: ea,
        stat_tx: stat_tx,
        dtog_tx: dtog_tx,
        ctr_tx: ctr_tx,
        ep_kind: ep_kind,
        ep_type: ep_type,
        stat_rx: stat_rx,
        dtog_rx: dtog_rx,
        ctr_rx: ctr_rx,
      )
    end
  end # struct

  # endpoint 3 register
  struct EP3R
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

    # Endpoint address
    def ea : UInt8
      UInt8.new!((@value >> 0) & 0xf_u32)
    end

    # Endpoint address
    def self.ea : UInt8
      value.ea
    end

    # Endpoint address
    def self.ea=(value : UInt8) : UInt8
      self.set(ea: value)
      value
    end

    enum STAT_TX : UInt8
      # all transmission requests addressed to this endpoint are ignored
      DISABLED = 0x0_u64

      # the endpoint is stalled and all transmission requests result in a STALL handshake
      STALL = 0x1_u64

      # the endpoint is naked and all transmission requests result in a NAK handshake
      NAK = 0x2_u64

      # this endpoint is enabled for transmission
      VALID = 0x3_u64

      def self.reset_value : STAT_TX
        EP3R.reset_value.stat_tx
      end
    end

    # Status bits, for transmission              transfers
    def stat_tx : STAT_TX
      STAT_TX.new!((@value >> 4) & 0x3_u32)
    end

    # Status bits, for transmission              transfers
    def self.stat_tx : STAT_TX
      value.stat_tx
    end

    # Status bits, for transmission              transfers
    def self.stat_tx=(value : STAT_TX) : STAT_TX
      self.set(stat_tx: value)
      value
    end

    # Data Toggle, for transmission              transfers
    def dtog_tx : Bool
      @value.bits_set?(0x40_u32)
    end

    # Data Toggle, for transmission              transfers
    def self.dtog_tx : Bool
      value.dtog_tx
    end

    # Data Toggle, for transmission              transfers
    def self.dtog_tx=(value : Bool) : Bool
      self.set(dtog_tx: value)
      value
    end

    # Correct Transfer for              transmission
    def ctr_tx : Bool
      @value.bits_set?(0x80_u32)
    end

    # Correct Transfer for              transmission
    def self.ctr_tx : Bool
      value.ctr_tx
    end

    # Correct Transfer for              transmission
    def self.ctr_tx=(value : Bool) : Bool
      self.set(ctr_tx: value)
      value
    end

    # Endpoint kind
    def ep_kind : Bool
      @value.bits_set?(0x100_u32)
    end

    # Endpoint kind
    def self.ep_kind : Bool
      value.ep_kind
    end

    # Endpoint kind
    def self.ep_kind=(value : Bool) : Bool
      self.set(ep_kind: value)
      value
    end

    enum EP_TYPE : UInt8
      # Bulk endpoint
      BULK = 0x0_u64

      # Control endpoint
      CONTROL = 0x1_u64

      # Iso endpoint
      ISO = 0x2_u64

      # Interrupt endpoint
      INTERRUPT = 0x3_u64

      def self.reset_value : EP_TYPE
        EP3R.reset_value.ep_type
      end
    end

    # Endpoint type
    def ep_type : EP_TYPE
      EP_TYPE.new!((@value >> 9) & 0x3_u32)
    end

    # Endpoint type
    def self.ep_type : EP_TYPE
      value.ep_type
    end

    # Endpoint type
    def self.ep_type=(value : EP_TYPE) : EP_TYPE
      self.set(ep_type: value)
      value
    end

    # Setup transaction              completed
    def setup : Bool
      @value.bits_set?(0x800_u32)
    end

    # Setup transaction              completed
    def self.setup : Bool
      value.setup
    end

    enum STAT_RX : UInt8
      # all reception requests addressed to this endpoint are ignored
      DISABLED = 0x0_u64

      # the endpoint is stalled and all reception requests result in a STALL handshake
      STALL = 0x1_u64

      # the endpoint is naked and all reception requests result in a NAK handshake
      NAK = 0x2_u64

      # this endpoint is enabled for reception
      VALID = 0x3_u64

      def self.reset_value : STAT_RX
        EP3R.reset_value.stat_rx
      end
    end

    # Status bits, for reception              transfers
    def stat_rx : STAT_RX
      STAT_RX.new!((@value >> 12) & 0x3_u32)
    end

    # Status bits, for reception              transfers
    def self.stat_rx : STAT_RX
      value.stat_rx
    end

    # Status bits, for reception              transfers
    def self.stat_rx=(value : STAT_RX) : STAT_RX
      self.set(stat_rx: value)
      value
    end

    # Data Toggle, for reception              transfers
    def dtog_rx : Bool
      @value.bits_set?(0x4000_u32)
    end

    # Data Toggle, for reception              transfers
    def self.dtog_rx : Bool
      value.dtog_rx
    end

    # Data Toggle, for reception              transfers
    def self.dtog_rx=(value : Bool) : Bool
      self.set(dtog_rx: value)
      value
    end

    # Correct transfer for              reception
    def ctr_rx : Bool
      @value.bits_set?(0x8000_u32)
    end

    # Correct transfer for              reception
    def self.ctr_rx : Bool
      value.ctr_rx
    end

    # Correct transfer for              reception
    def self.ctr_rx=(value : Bool) : Bool
      self.set(ctr_rx: value)
      value
    end

    def copy_with(
      *,

      ea : UInt8? = nil,

      stat_tx : STAT_TX? = nil,

      dtog_tx : Bool? = nil,

      ctr_tx : Bool? = nil,

      ep_kind : Bool? = nil,

      ep_type : EP_TYPE? = nil,

      stat_rx : STAT_RX? = nil,

      dtog_rx : Bool? = nil,

      ctr_rx : Bool? = nil
    ) : self
      value = @value

      unless ea.nil?
        value = (value & 0xfffffff0_u32) |
                UInt32.new!(ea.to_int).&(0xf_u32) << 0
      end

      unless stat_tx.nil?
        value = (value & 0xffffffcf_u32) |
                UInt32.new!(stat_tx.to_int).&(0x3_u32) << 4
      end

      unless dtog_tx.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(dtog_tx.to_int).&(0x1_u32) << 6
      end

      unless ctr_tx.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(ctr_tx.to_int).&(0x1_u32) << 7
      end

      unless ep_kind.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(ep_kind.to_int).&(0x1_u32) << 8
      end

      unless ep_type.nil?
        value = (value & 0xfffff9ff_u32) |
                UInt32.new!(ep_type.to_int).&(0x3_u32) << 9
      end

      unless stat_rx.nil?
        value = (value & 0xffffcfff_u32) |
                UInt32.new!(stat_rx.to_int).&(0x3_u32) << 12
      end

      unless dtog_rx.nil?
        value = (value & 0xffffbfff_u32) |
                UInt32.new!(dtog_rx.to_int).&(0x1_u32) << 14
      end

      unless ctr_rx.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(ctr_rx.to_int).&(0x1_u32) << 15
      end

      self.class.new(value)
    end

    def self.set(
      *,
      ea : UInt8? = nil,
      stat_tx : STAT_TX? = nil,
      dtog_tx : Bool? = nil,
      ctr_tx : Bool? = nil,
      ep_kind : Bool? = nil,
      ep_type : EP_TYPE? = nil,
      stat_rx : STAT_RX? = nil,
      dtog_rx : Bool? = nil,
      ctr_rx : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        ea: ea,
        stat_tx: stat_tx,
        dtog_tx: dtog_tx,
        ctr_tx: ctr_tx,
        ep_kind: ep_kind,
        ep_type: ep_type,
        stat_rx: stat_rx,
        dtog_rx: dtog_rx,
        ctr_rx: ctr_rx,
      )
    end
  end # struct

  # endpoint 4 register
  struct EP4R
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

    # Endpoint address
    def ea : UInt8
      UInt8.new!((@value >> 0) & 0xf_u32)
    end

    # Endpoint address
    def self.ea : UInt8
      value.ea
    end

    # Endpoint address
    def self.ea=(value : UInt8) : UInt8
      self.set(ea: value)
      value
    end

    enum STAT_TX : UInt8
      # all transmission requests addressed to this endpoint are ignored
      DISABLED = 0x0_u64

      # the endpoint is stalled and all transmission requests result in a STALL handshake
      STALL = 0x1_u64

      # the endpoint is naked and all transmission requests result in a NAK handshake
      NAK = 0x2_u64

      # this endpoint is enabled for transmission
      VALID = 0x3_u64

      def self.reset_value : STAT_TX
        EP4R.reset_value.stat_tx
      end
    end

    # Status bits, for transmission              transfers
    def stat_tx : STAT_TX
      STAT_TX.new!((@value >> 4) & 0x3_u32)
    end

    # Status bits, for transmission              transfers
    def self.stat_tx : STAT_TX
      value.stat_tx
    end

    # Status bits, for transmission              transfers
    def self.stat_tx=(value : STAT_TX) : STAT_TX
      self.set(stat_tx: value)
      value
    end

    # Data Toggle, for transmission              transfers
    def dtog_tx : Bool
      @value.bits_set?(0x40_u32)
    end

    # Data Toggle, for transmission              transfers
    def self.dtog_tx : Bool
      value.dtog_tx
    end

    # Data Toggle, for transmission              transfers
    def self.dtog_tx=(value : Bool) : Bool
      self.set(dtog_tx: value)
      value
    end

    # Correct Transfer for              transmission
    def ctr_tx : Bool
      @value.bits_set?(0x80_u32)
    end

    # Correct Transfer for              transmission
    def self.ctr_tx : Bool
      value.ctr_tx
    end

    # Correct Transfer for              transmission
    def self.ctr_tx=(value : Bool) : Bool
      self.set(ctr_tx: value)
      value
    end

    # Endpoint kind
    def ep_kind : Bool
      @value.bits_set?(0x100_u32)
    end

    # Endpoint kind
    def self.ep_kind : Bool
      value.ep_kind
    end

    # Endpoint kind
    def self.ep_kind=(value : Bool) : Bool
      self.set(ep_kind: value)
      value
    end

    enum EP_TYPE : UInt8
      # Bulk endpoint
      BULK = 0x0_u64

      # Control endpoint
      CONTROL = 0x1_u64

      # Iso endpoint
      ISO = 0x2_u64

      # Interrupt endpoint
      INTERRUPT = 0x3_u64

      def self.reset_value : EP_TYPE
        EP4R.reset_value.ep_type
      end
    end

    # Endpoint type
    def ep_type : EP_TYPE
      EP_TYPE.new!((@value >> 9) & 0x3_u32)
    end

    # Endpoint type
    def self.ep_type : EP_TYPE
      value.ep_type
    end

    # Endpoint type
    def self.ep_type=(value : EP_TYPE) : EP_TYPE
      self.set(ep_type: value)
      value
    end

    # Setup transaction              completed
    def setup : Bool
      @value.bits_set?(0x800_u32)
    end

    # Setup transaction              completed
    def self.setup : Bool
      value.setup
    end

    enum STAT_RX : UInt8
      # all reception requests addressed to this endpoint are ignored
      DISABLED = 0x0_u64

      # the endpoint is stalled and all reception requests result in a STALL handshake
      STALL = 0x1_u64

      # the endpoint is naked and all reception requests result in a NAK handshake
      NAK = 0x2_u64

      # this endpoint is enabled for reception
      VALID = 0x3_u64

      def self.reset_value : STAT_RX
        EP4R.reset_value.stat_rx
      end
    end

    # Status bits, for reception              transfers
    def stat_rx : STAT_RX
      STAT_RX.new!((@value >> 12) & 0x3_u32)
    end

    # Status bits, for reception              transfers
    def self.stat_rx : STAT_RX
      value.stat_rx
    end

    # Status bits, for reception              transfers
    def self.stat_rx=(value : STAT_RX) : STAT_RX
      self.set(stat_rx: value)
      value
    end

    # Data Toggle, for reception              transfers
    def dtog_rx : Bool
      @value.bits_set?(0x4000_u32)
    end

    # Data Toggle, for reception              transfers
    def self.dtog_rx : Bool
      value.dtog_rx
    end

    # Data Toggle, for reception              transfers
    def self.dtog_rx=(value : Bool) : Bool
      self.set(dtog_rx: value)
      value
    end

    # Correct transfer for              reception
    def ctr_rx : Bool
      @value.bits_set?(0x8000_u32)
    end

    # Correct transfer for              reception
    def self.ctr_rx : Bool
      value.ctr_rx
    end

    # Correct transfer for              reception
    def self.ctr_rx=(value : Bool) : Bool
      self.set(ctr_rx: value)
      value
    end

    def copy_with(
      *,

      ea : UInt8? = nil,

      stat_tx : STAT_TX? = nil,

      dtog_tx : Bool? = nil,

      ctr_tx : Bool? = nil,

      ep_kind : Bool? = nil,

      ep_type : EP_TYPE? = nil,

      stat_rx : STAT_RX? = nil,

      dtog_rx : Bool? = nil,

      ctr_rx : Bool? = nil
    ) : self
      value = @value

      unless ea.nil?
        value = (value & 0xfffffff0_u32) |
                UInt32.new!(ea.to_int).&(0xf_u32) << 0
      end

      unless stat_tx.nil?
        value = (value & 0xffffffcf_u32) |
                UInt32.new!(stat_tx.to_int).&(0x3_u32) << 4
      end

      unless dtog_tx.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(dtog_tx.to_int).&(0x1_u32) << 6
      end

      unless ctr_tx.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(ctr_tx.to_int).&(0x1_u32) << 7
      end

      unless ep_kind.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(ep_kind.to_int).&(0x1_u32) << 8
      end

      unless ep_type.nil?
        value = (value & 0xfffff9ff_u32) |
                UInt32.new!(ep_type.to_int).&(0x3_u32) << 9
      end

      unless stat_rx.nil?
        value = (value & 0xffffcfff_u32) |
                UInt32.new!(stat_rx.to_int).&(0x3_u32) << 12
      end

      unless dtog_rx.nil?
        value = (value & 0xffffbfff_u32) |
                UInt32.new!(dtog_rx.to_int).&(0x1_u32) << 14
      end

      unless ctr_rx.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(ctr_rx.to_int).&(0x1_u32) << 15
      end

      self.class.new(value)
    end

    def self.set(
      *,
      ea : UInt8? = nil,
      stat_tx : STAT_TX? = nil,
      dtog_tx : Bool? = nil,
      ctr_tx : Bool? = nil,
      ep_kind : Bool? = nil,
      ep_type : EP_TYPE? = nil,
      stat_rx : STAT_RX? = nil,
      dtog_rx : Bool? = nil,
      ctr_rx : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        ea: ea,
        stat_tx: stat_tx,
        dtog_tx: dtog_tx,
        ctr_tx: ctr_tx,
        ep_kind: ep_kind,
        ep_type: ep_type,
        stat_rx: stat_rx,
        dtog_rx: dtog_rx,
        ctr_rx: ctr_rx,
      )
    end
  end # struct

  # endpoint 5 register
  struct EP5R
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

    # Endpoint address
    def ea : UInt8
      UInt8.new!((@value >> 0) & 0xf_u32)
    end

    # Endpoint address
    def self.ea : UInt8
      value.ea
    end

    # Endpoint address
    def self.ea=(value : UInt8) : UInt8
      self.set(ea: value)
      value
    end

    enum STAT_TX : UInt8
      # all transmission requests addressed to this endpoint are ignored
      DISABLED = 0x0_u64

      # the endpoint is stalled and all transmission requests result in a STALL handshake
      STALL = 0x1_u64

      # the endpoint is naked and all transmission requests result in a NAK handshake
      NAK = 0x2_u64

      # this endpoint is enabled for transmission
      VALID = 0x3_u64

      def self.reset_value : STAT_TX
        EP5R.reset_value.stat_tx
      end
    end

    # Status bits, for transmission              transfers
    def stat_tx : STAT_TX
      STAT_TX.new!((@value >> 4) & 0x3_u32)
    end

    # Status bits, for transmission              transfers
    def self.stat_tx : STAT_TX
      value.stat_tx
    end

    # Status bits, for transmission              transfers
    def self.stat_tx=(value : STAT_TX) : STAT_TX
      self.set(stat_tx: value)
      value
    end

    # Data Toggle, for transmission              transfers
    def dtog_tx : Bool
      @value.bits_set?(0x40_u32)
    end

    # Data Toggle, for transmission              transfers
    def self.dtog_tx : Bool
      value.dtog_tx
    end

    # Data Toggle, for transmission              transfers
    def self.dtog_tx=(value : Bool) : Bool
      self.set(dtog_tx: value)
      value
    end

    # Correct Transfer for              transmission
    def ctr_tx : Bool
      @value.bits_set?(0x80_u32)
    end

    # Correct Transfer for              transmission
    def self.ctr_tx : Bool
      value.ctr_tx
    end

    # Correct Transfer for              transmission
    def self.ctr_tx=(value : Bool) : Bool
      self.set(ctr_tx: value)
      value
    end

    # Endpoint kind
    def ep_kind : Bool
      @value.bits_set?(0x100_u32)
    end

    # Endpoint kind
    def self.ep_kind : Bool
      value.ep_kind
    end

    # Endpoint kind
    def self.ep_kind=(value : Bool) : Bool
      self.set(ep_kind: value)
      value
    end

    enum EP_TYPE : UInt8
      # Bulk endpoint
      BULK = 0x0_u64

      # Control endpoint
      CONTROL = 0x1_u64

      # Iso endpoint
      ISO = 0x2_u64

      # Interrupt endpoint
      INTERRUPT = 0x3_u64

      def self.reset_value : EP_TYPE
        EP5R.reset_value.ep_type
      end
    end

    # Endpoint type
    def ep_type : EP_TYPE
      EP_TYPE.new!((@value >> 9) & 0x3_u32)
    end

    # Endpoint type
    def self.ep_type : EP_TYPE
      value.ep_type
    end

    # Endpoint type
    def self.ep_type=(value : EP_TYPE) : EP_TYPE
      self.set(ep_type: value)
      value
    end

    # Setup transaction              completed
    def setup : Bool
      @value.bits_set?(0x800_u32)
    end

    # Setup transaction              completed
    def self.setup : Bool
      value.setup
    end

    enum STAT_RX : UInt8
      # all reception requests addressed to this endpoint are ignored
      DISABLED = 0x0_u64

      # the endpoint is stalled and all reception requests result in a STALL handshake
      STALL = 0x1_u64

      # the endpoint is naked and all reception requests result in a NAK handshake
      NAK = 0x2_u64

      # this endpoint is enabled for reception
      VALID = 0x3_u64

      def self.reset_value : STAT_RX
        EP5R.reset_value.stat_rx
      end
    end

    # Status bits, for reception              transfers
    def stat_rx : STAT_RX
      STAT_RX.new!((@value >> 12) & 0x3_u32)
    end

    # Status bits, for reception              transfers
    def self.stat_rx : STAT_RX
      value.stat_rx
    end

    # Status bits, for reception              transfers
    def self.stat_rx=(value : STAT_RX) : STAT_RX
      self.set(stat_rx: value)
      value
    end

    # Data Toggle, for reception              transfers
    def dtog_rx : Bool
      @value.bits_set?(0x4000_u32)
    end

    # Data Toggle, for reception              transfers
    def self.dtog_rx : Bool
      value.dtog_rx
    end

    # Data Toggle, for reception              transfers
    def self.dtog_rx=(value : Bool) : Bool
      self.set(dtog_rx: value)
      value
    end

    # Correct transfer for              reception
    def ctr_rx : Bool
      @value.bits_set?(0x8000_u32)
    end

    # Correct transfer for              reception
    def self.ctr_rx : Bool
      value.ctr_rx
    end

    # Correct transfer for              reception
    def self.ctr_rx=(value : Bool) : Bool
      self.set(ctr_rx: value)
      value
    end

    def copy_with(
      *,

      ea : UInt8? = nil,

      stat_tx : STAT_TX? = nil,

      dtog_tx : Bool? = nil,

      ctr_tx : Bool? = nil,

      ep_kind : Bool? = nil,

      ep_type : EP_TYPE? = nil,

      stat_rx : STAT_RX? = nil,

      dtog_rx : Bool? = nil,

      ctr_rx : Bool? = nil
    ) : self
      value = @value

      unless ea.nil?
        value = (value & 0xfffffff0_u32) |
                UInt32.new!(ea.to_int).&(0xf_u32) << 0
      end

      unless stat_tx.nil?
        value = (value & 0xffffffcf_u32) |
                UInt32.new!(stat_tx.to_int).&(0x3_u32) << 4
      end

      unless dtog_tx.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(dtog_tx.to_int).&(0x1_u32) << 6
      end

      unless ctr_tx.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(ctr_tx.to_int).&(0x1_u32) << 7
      end

      unless ep_kind.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(ep_kind.to_int).&(0x1_u32) << 8
      end

      unless ep_type.nil?
        value = (value & 0xfffff9ff_u32) |
                UInt32.new!(ep_type.to_int).&(0x3_u32) << 9
      end

      unless stat_rx.nil?
        value = (value & 0xffffcfff_u32) |
                UInt32.new!(stat_rx.to_int).&(0x3_u32) << 12
      end

      unless dtog_rx.nil?
        value = (value & 0xffffbfff_u32) |
                UInt32.new!(dtog_rx.to_int).&(0x1_u32) << 14
      end

      unless ctr_rx.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(ctr_rx.to_int).&(0x1_u32) << 15
      end

      self.class.new(value)
    end

    def self.set(
      *,
      ea : UInt8? = nil,
      stat_tx : STAT_TX? = nil,
      dtog_tx : Bool? = nil,
      ctr_tx : Bool? = nil,
      ep_kind : Bool? = nil,
      ep_type : EP_TYPE? = nil,
      stat_rx : STAT_RX? = nil,
      dtog_rx : Bool? = nil,
      ctr_rx : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        ea: ea,
        stat_tx: stat_tx,
        dtog_tx: dtog_tx,
        ctr_tx: ctr_tx,
        ep_kind: ep_kind,
        ep_type: ep_type,
        stat_rx: stat_rx,
        dtog_rx: dtog_rx,
        ctr_rx: ctr_rx,
      )
    end
  end # struct

  # endpoint 6 register
  struct EP6R
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

    # Endpoint address
    def ea : UInt8
      UInt8.new!((@value >> 0) & 0xf_u32)
    end

    # Endpoint address
    def self.ea : UInt8
      value.ea
    end

    # Endpoint address
    def self.ea=(value : UInt8) : UInt8
      self.set(ea: value)
      value
    end

    enum STAT_TX : UInt8
      # all transmission requests addressed to this endpoint are ignored
      DISABLED = 0x0_u64

      # the endpoint is stalled and all transmission requests result in a STALL handshake
      STALL = 0x1_u64

      # the endpoint is naked and all transmission requests result in a NAK handshake
      NAK = 0x2_u64

      # this endpoint is enabled for transmission
      VALID = 0x3_u64

      def self.reset_value : STAT_TX
        EP6R.reset_value.stat_tx
      end
    end

    # Status bits, for transmission              transfers
    def stat_tx : STAT_TX
      STAT_TX.new!((@value >> 4) & 0x3_u32)
    end

    # Status bits, for transmission              transfers
    def self.stat_tx : STAT_TX
      value.stat_tx
    end

    # Status bits, for transmission              transfers
    def self.stat_tx=(value : STAT_TX) : STAT_TX
      self.set(stat_tx: value)
      value
    end

    # Data Toggle, for transmission              transfers
    def dtog_tx : Bool
      @value.bits_set?(0x40_u32)
    end

    # Data Toggle, for transmission              transfers
    def self.dtog_tx : Bool
      value.dtog_tx
    end

    # Data Toggle, for transmission              transfers
    def self.dtog_tx=(value : Bool) : Bool
      self.set(dtog_tx: value)
      value
    end

    # Correct Transfer for              transmission
    def ctr_tx : Bool
      @value.bits_set?(0x80_u32)
    end

    # Correct Transfer for              transmission
    def self.ctr_tx : Bool
      value.ctr_tx
    end

    # Correct Transfer for              transmission
    def self.ctr_tx=(value : Bool) : Bool
      self.set(ctr_tx: value)
      value
    end

    # Endpoint kind
    def ep_kind : Bool
      @value.bits_set?(0x100_u32)
    end

    # Endpoint kind
    def self.ep_kind : Bool
      value.ep_kind
    end

    # Endpoint kind
    def self.ep_kind=(value : Bool) : Bool
      self.set(ep_kind: value)
      value
    end

    enum EP_TYPE : UInt8
      # Bulk endpoint
      BULK = 0x0_u64

      # Control endpoint
      CONTROL = 0x1_u64

      # Iso endpoint
      ISO = 0x2_u64

      # Interrupt endpoint
      INTERRUPT = 0x3_u64

      def self.reset_value : EP_TYPE
        EP6R.reset_value.ep_type
      end
    end

    # Endpoint type
    def ep_type : EP_TYPE
      EP_TYPE.new!((@value >> 9) & 0x3_u32)
    end

    # Endpoint type
    def self.ep_type : EP_TYPE
      value.ep_type
    end

    # Endpoint type
    def self.ep_type=(value : EP_TYPE) : EP_TYPE
      self.set(ep_type: value)
      value
    end

    # Setup transaction              completed
    def setup : Bool
      @value.bits_set?(0x800_u32)
    end

    # Setup transaction              completed
    def self.setup : Bool
      value.setup
    end

    enum STAT_RX : UInt8
      # all reception requests addressed to this endpoint are ignored
      DISABLED = 0x0_u64

      # the endpoint is stalled and all reception requests result in a STALL handshake
      STALL = 0x1_u64

      # the endpoint is naked and all reception requests result in a NAK handshake
      NAK = 0x2_u64

      # this endpoint is enabled for reception
      VALID = 0x3_u64

      def self.reset_value : STAT_RX
        EP6R.reset_value.stat_rx
      end
    end

    # Status bits, for reception              transfers
    def stat_rx : STAT_RX
      STAT_RX.new!((@value >> 12) & 0x3_u32)
    end

    # Status bits, for reception              transfers
    def self.stat_rx : STAT_RX
      value.stat_rx
    end

    # Status bits, for reception              transfers
    def self.stat_rx=(value : STAT_RX) : STAT_RX
      self.set(stat_rx: value)
      value
    end

    # Data Toggle, for reception              transfers
    def dtog_rx : Bool
      @value.bits_set?(0x4000_u32)
    end

    # Data Toggle, for reception              transfers
    def self.dtog_rx : Bool
      value.dtog_rx
    end

    # Data Toggle, for reception              transfers
    def self.dtog_rx=(value : Bool) : Bool
      self.set(dtog_rx: value)
      value
    end

    # Correct transfer for              reception
    def ctr_rx : Bool
      @value.bits_set?(0x8000_u32)
    end

    # Correct transfer for              reception
    def self.ctr_rx : Bool
      value.ctr_rx
    end

    # Correct transfer for              reception
    def self.ctr_rx=(value : Bool) : Bool
      self.set(ctr_rx: value)
      value
    end

    def copy_with(
      *,

      ea : UInt8? = nil,

      stat_tx : STAT_TX? = nil,

      dtog_tx : Bool? = nil,

      ctr_tx : Bool? = nil,

      ep_kind : Bool? = nil,

      ep_type : EP_TYPE? = nil,

      stat_rx : STAT_RX? = nil,

      dtog_rx : Bool? = nil,

      ctr_rx : Bool? = nil
    ) : self
      value = @value

      unless ea.nil?
        value = (value & 0xfffffff0_u32) |
                UInt32.new!(ea.to_int).&(0xf_u32) << 0
      end

      unless stat_tx.nil?
        value = (value & 0xffffffcf_u32) |
                UInt32.new!(stat_tx.to_int).&(0x3_u32) << 4
      end

      unless dtog_tx.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(dtog_tx.to_int).&(0x1_u32) << 6
      end

      unless ctr_tx.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(ctr_tx.to_int).&(0x1_u32) << 7
      end

      unless ep_kind.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(ep_kind.to_int).&(0x1_u32) << 8
      end

      unless ep_type.nil?
        value = (value & 0xfffff9ff_u32) |
                UInt32.new!(ep_type.to_int).&(0x3_u32) << 9
      end

      unless stat_rx.nil?
        value = (value & 0xffffcfff_u32) |
                UInt32.new!(stat_rx.to_int).&(0x3_u32) << 12
      end

      unless dtog_rx.nil?
        value = (value & 0xffffbfff_u32) |
                UInt32.new!(dtog_rx.to_int).&(0x1_u32) << 14
      end

      unless ctr_rx.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(ctr_rx.to_int).&(0x1_u32) << 15
      end

      self.class.new(value)
    end

    def self.set(
      *,
      ea : UInt8? = nil,
      stat_tx : STAT_TX? = nil,
      dtog_tx : Bool? = nil,
      ctr_tx : Bool? = nil,
      ep_kind : Bool? = nil,
      ep_type : EP_TYPE? = nil,
      stat_rx : STAT_RX? = nil,
      dtog_rx : Bool? = nil,
      ctr_rx : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        ea: ea,
        stat_tx: stat_tx,
        dtog_tx: dtog_tx,
        ctr_tx: ctr_tx,
        ep_kind: ep_kind,
        ep_type: ep_type,
        stat_rx: stat_rx,
        dtog_rx: dtog_rx,
        ctr_rx: ctr_rx,
      )
    end
  end # struct

  # endpoint 7 register
  struct EP7R
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

    # Endpoint address
    def ea : UInt8
      UInt8.new!((@value >> 0) & 0xf_u32)
    end

    # Endpoint address
    def self.ea : UInt8
      value.ea
    end

    # Endpoint address
    def self.ea=(value : UInt8) : UInt8
      self.set(ea: value)
      value
    end

    enum STAT_TX : UInt8
      # all transmission requests addressed to this endpoint are ignored
      DISABLED = 0x0_u64

      # the endpoint is stalled and all transmission requests result in a STALL handshake
      STALL = 0x1_u64

      # the endpoint is naked and all transmission requests result in a NAK handshake
      NAK = 0x2_u64

      # this endpoint is enabled for transmission
      VALID = 0x3_u64

      def self.reset_value : STAT_TX
        EP7R.reset_value.stat_tx
      end
    end

    # Status bits, for transmission              transfers
    def stat_tx : STAT_TX
      STAT_TX.new!((@value >> 4) & 0x3_u32)
    end

    # Status bits, for transmission              transfers
    def self.stat_tx : STAT_TX
      value.stat_tx
    end

    # Status bits, for transmission              transfers
    def self.stat_tx=(value : STAT_TX) : STAT_TX
      self.set(stat_tx: value)
      value
    end

    # Data Toggle, for transmission              transfers
    def dtog_tx : Bool
      @value.bits_set?(0x40_u32)
    end

    # Data Toggle, for transmission              transfers
    def self.dtog_tx : Bool
      value.dtog_tx
    end

    # Data Toggle, for transmission              transfers
    def self.dtog_tx=(value : Bool) : Bool
      self.set(dtog_tx: value)
      value
    end

    # Correct Transfer for              transmission
    def ctr_tx : Bool
      @value.bits_set?(0x80_u32)
    end

    # Correct Transfer for              transmission
    def self.ctr_tx : Bool
      value.ctr_tx
    end

    # Correct Transfer for              transmission
    def self.ctr_tx=(value : Bool) : Bool
      self.set(ctr_tx: value)
      value
    end

    # Endpoint kind
    def ep_kind : Bool
      @value.bits_set?(0x100_u32)
    end

    # Endpoint kind
    def self.ep_kind : Bool
      value.ep_kind
    end

    # Endpoint kind
    def self.ep_kind=(value : Bool) : Bool
      self.set(ep_kind: value)
      value
    end

    enum EP_TYPE : UInt8
      # Bulk endpoint
      BULK = 0x0_u64

      # Control endpoint
      CONTROL = 0x1_u64

      # Iso endpoint
      ISO = 0x2_u64

      # Interrupt endpoint
      INTERRUPT = 0x3_u64

      def self.reset_value : EP_TYPE
        EP7R.reset_value.ep_type
      end
    end

    # Endpoint type
    def ep_type : EP_TYPE
      EP_TYPE.new!((@value >> 9) & 0x3_u32)
    end

    # Endpoint type
    def self.ep_type : EP_TYPE
      value.ep_type
    end

    # Endpoint type
    def self.ep_type=(value : EP_TYPE) : EP_TYPE
      self.set(ep_type: value)
      value
    end

    # Setup transaction              completed
    def setup : Bool
      @value.bits_set?(0x800_u32)
    end

    # Setup transaction              completed
    def self.setup : Bool
      value.setup
    end

    enum STAT_RX : UInt8
      # all reception requests addressed to this endpoint are ignored
      DISABLED = 0x0_u64

      # the endpoint is stalled and all reception requests result in a STALL handshake
      STALL = 0x1_u64

      # the endpoint is naked and all reception requests result in a NAK handshake
      NAK = 0x2_u64

      # this endpoint is enabled for reception
      VALID = 0x3_u64

      def self.reset_value : STAT_RX
        EP7R.reset_value.stat_rx
      end
    end

    # Status bits, for reception              transfers
    def stat_rx : STAT_RX
      STAT_RX.new!((@value >> 12) & 0x3_u32)
    end

    # Status bits, for reception              transfers
    def self.stat_rx : STAT_RX
      value.stat_rx
    end

    # Status bits, for reception              transfers
    def self.stat_rx=(value : STAT_RX) : STAT_RX
      self.set(stat_rx: value)
      value
    end

    # Data Toggle, for reception              transfers
    def dtog_rx : Bool
      @value.bits_set?(0x4000_u32)
    end

    # Data Toggle, for reception              transfers
    def self.dtog_rx : Bool
      value.dtog_rx
    end

    # Data Toggle, for reception              transfers
    def self.dtog_rx=(value : Bool) : Bool
      self.set(dtog_rx: value)
      value
    end

    # Correct transfer for              reception
    def ctr_rx : Bool
      @value.bits_set?(0x8000_u32)
    end

    # Correct transfer for              reception
    def self.ctr_rx : Bool
      value.ctr_rx
    end

    # Correct transfer for              reception
    def self.ctr_rx=(value : Bool) : Bool
      self.set(ctr_rx: value)
      value
    end

    def copy_with(
      *,

      ea : UInt8? = nil,

      stat_tx : STAT_TX? = nil,

      dtog_tx : Bool? = nil,

      ctr_tx : Bool? = nil,

      ep_kind : Bool? = nil,

      ep_type : EP_TYPE? = nil,

      stat_rx : STAT_RX? = nil,

      dtog_rx : Bool? = nil,

      ctr_rx : Bool? = nil
    ) : self
      value = @value

      unless ea.nil?
        value = (value & 0xfffffff0_u32) |
                UInt32.new!(ea.to_int).&(0xf_u32) << 0
      end

      unless stat_tx.nil?
        value = (value & 0xffffffcf_u32) |
                UInt32.new!(stat_tx.to_int).&(0x3_u32) << 4
      end

      unless dtog_tx.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(dtog_tx.to_int).&(0x1_u32) << 6
      end

      unless ctr_tx.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(ctr_tx.to_int).&(0x1_u32) << 7
      end

      unless ep_kind.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(ep_kind.to_int).&(0x1_u32) << 8
      end

      unless ep_type.nil?
        value = (value & 0xfffff9ff_u32) |
                UInt32.new!(ep_type.to_int).&(0x3_u32) << 9
      end

      unless stat_rx.nil?
        value = (value & 0xffffcfff_u32) |
                UInt32.new!(stat_rx.to_int).&(0x3_u32) << 12
      end

      unless dtog_rx.nil?
        value = (value & 0xffffbfff_u32) |
                UInt32.new!(dtog_rx.to_int).&(0x1_u32) << 14
      end

      unless ctr_rx.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(ctr_rx.to_int).&(0x1_u32) << 15
      end

      self.class.new(value)
    end

    def self.set(
      *,
      ea : UInt8? = nil,
      stat_tx : STAT_TX? = nil,
      dtog_tx : Bool? = nil,
      ctr_tx : Bool? = nil,
      ep_kind : Bool? = nil,
      ep_type : EP_TYPE? = nil,
      stat_rx : STAT_RX? = nil,
      dtog_rx : Bool? = nil,
      ctr_rx : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        ea: ea,
        stat_tx: stat_tx,
        dtog_tx: dtog_tx,
        ctr_tx: ctr_tx,
        ep_kind: ep_kind,
        ep_type: ep_type,
        stat_rx: stat_rx,
        dtog_rx: dtog_rx,
        ctr_rx: ctr_rx,
      )
    end
  end # struct

  # control register
  struct CNTR
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

    enum FRES : UInt8
      # Clear USB reset
      NORESET = 0x0_u64

      # Force a reset of the USB peripheral, exactly like a RESET signaling on the USB
      RESET = 0x1_u64

      def self.reset_value : FRES
        CNTR.reset_value.fres
      end
    end

    # Force USB Reset
    def fres : FRES
      FRES.new!((@value >> 0) & 0x1_u32)
    end

    # Force USB Reset
    def self.fres : FRES
      value.fres
    end

    # Force USB Reset
    def self.fres=(value : FRES) : FRES
      self.set(fres: value)
      value
    end

    enum PDWN : UInt8
      # No power down
      DISABLED = 0x0_u64

      # Enter power down mode
      ENABLED = 0x1_u64

      def self.reset_value : PDWN
        CNTR.reset_value.pdwn
      end
    end

    # Power down
    def pdwn : PDWN
      PDWN.new!((@value >> 1) & 0x1_u32)
    end

    # Power down
    def self.pdwn : PDWN
      value.pdwn
    end

    # Power down
    def self.pdwn=(value : PDWN) : PDWN
      self.set(pdwn: value)
      value
    end

    enum LPMODE : UInt8
      # No low-power mode
      DISABLED = 0x0_u64

      # Enter low-power mode
      ENABLED = 0x1_u64

      def self.reset_value : LPMODE
        CNTR.reset_value.lpmode
      end
    end

    # Low-power mode
    def lpmode : LPMODE
      LPMODE.new!((@value >> 2) & 0x1_u32)
    end

    # Low-power mode
    def self.lpmode : LPMODE
      value.lpmode
    end

    # Low-power mode
    def self.lpmode=(value : LPMODE) : LPMODE
      self.set(lpmode: value)
      value
    end

    enum FSUSP : UInt8
      # No effect
      NOEFFECT = 0x0_u64

      # Enter suspend mode. Clocks and static power dissipation in the analog transceiver are left unaffected
      SUSPEND = 0x1_u64

      def self.reset_value : FSUSP
        CNTR.reset_value.fsusp
      end
    end

    # Force suspend
    def fsusp : FSUSP
      FSUSP.new!((@value >> 3) & 0x1_u32)
    end

    # Force suspend
    def self.fsusp : FSUSP
      value.fsusp
    end

    # Force suspend
    def self.fsusp=(value : FSUSP) : FSUSP
      self.set(fsusp: value)
      value
    end

    enum RESUME : UInt8
      # Resume requested
      REQUESTED = 0x1_u64

      def self.reset_value : RESUME
        CNTR.reset_value.resume
      end
    end

    # Resume request
    def resume : RESUME
      RESUME.new!((@value >> 4) & 0x1_u32)
    end

    # Resume request
    def self.resume : RESUME
      value.resume
    end

    # Resume request
    def self.resume=(value : RESUME) : RESUME
      self.set(resume: value)
      value
    end

    enum ESOFM : UInt8
      # ESOF Interrupt disabled
      DISABLED = 0x0_u64

      # ESOF Interrupt enabled, an interrupt request is generated when the corresponding bit in the USB_ISTR register is set
      ENABLED = 0x1_u64

      def self.reset_value : ESOFM
        CNTR.reset_value.esofm
      end
    end

    # Expected start of frame interrupt              mask
    def esofm : ESOFM
      ESOFM.new!((@value >> 8) & 0x1_u32)
    end

    # Expected start of frame interrupt              mask
    def self.esofm : ESOFM
      value.esofm
    end

    # Expected start of frame interrupt              mask
    def self.esofm=(value : ESOFM) : ESOFM
      self.set(esofm: value)
      value
    end

    enum SOFM : UInt8
      # SOF Interrupt disabled
      DISABLED = 0x0_u64

      # SOF Interrupt enabled, an interrupt request is generated when the corresponding bit in the USB_ISTR register is set
      ENABLED = 0x1_u64

      def self.reset_value : SOFM
        CNTR.reset_value.sofm
      end
    end

    # Start of frame interrupt              mask
    def sofm : SOFM
      SOFM.new!((@value >> 9) & 0x1_u32)
    end

    # Start of frame interrupt              mask
    def self.sofm : SOFM
      value.sofm
    end

    # Start of frame interrupt              mask
    def self.sofm=(value : SOFM) : SOFM
      self.set(sofm: value)
      value
    end

    enum RESETM : UInt8
      # RESET Interrupt disabled
      DISABLED = 0x0_u64

      # RESET Interrupt enabled, an interrupt request is generated when the corresponding bit in the USB_ISTR register is set
      ENABLED = 0x1_u64

      def self.reset_value : RESETM
        CNTR.reset_value.resetm
      end
    end

    # USB reset interrupt mask
    def resetm : RESETM
      RESETM.new!((@value >> 10) & 0x1_u32)
    end

    # USB reset interrupt mask
    def self.resetm : RESETM
      value.resetm
    end

    # USB reset interrupt mask
    def self.resetm=(value : RESETM) : RESETM
      self.set(resetm: value)
      value
    end

    enum SUSPM : UInt8
      # Suspend Mode Request SUSP Interrupt disabled
      DISABLED = 0x0_u64

      # SUSP Interrupt enabled, an interrupt request is generated when the corresponding bit in the USB_ISTR register is set
      ENABLED = 0x1_u64

      def self.reset_value : SUSPM
        CNTR.reset_value.suspm
      end
    end

    # Suspend mode interrupt              mask
    def suspm : SUSPM
      SUSPM.new!((@value >> 11) & 0x1_u32)
    end

    # Suspend mode interrupt              mask
    def self.suspm : SUSPM
      value.suspm
    end

    # Suspend mode interrupt              mask
    def self.suspm=(value : SUSPM) : SUSPM
      self.set(suspm: value)
      value
    end

    enum WKUPM : UInt8
      # WKUP Interrupt disabled
      DISABLED = 0x0_u64

      # WKUP Interrupt enabled, an interrupt request is generated when the corresponding bit in the USB_ISTR register is set
      ENABLED = 0x1_u64

      def self.reset_value : WKUPM
        CNTR.reset_value.wkupm
      end
    end

    # Wakeup interrupt mask
    def wkupm : WKUPM
      WKUPM.new!((@value >> 12) & 0x1_u32)
    end

    # Wakeup interrupt mask
    def self.wkupm : WKUPM
      value.wkupm
    end

    # Wakeup interrupt mask
    def self.wkupm=(value : WKUPM) : WKUPM
      self.set(wkupm: value)
      value
    end

    enum ERRM : UInt8
      # ERR Interrupt disabled
      DISABLED = 0x0_u64

      # ERR Interrupt enabled, an interrupt request is generated when the corresponding bit in the USB_ISTR register is set
      ENABLED = 0x1_u64

      def self.reset_value : ERRM
        CNTR.reset_value.errm
      end
    end

    # Error interrupt mask
    def errm : ERRM
      ERRM.new!((@value >> 13) & 0x1_u32)
    end

    # Error interrupt mask
    def self.errm : ERRM
      value.errm
    end

    # Error interrupt mask
    def self.errm=(value : ERRM) : ERRM
      self.set(errm: value)
      value
    end

    enum PMAOVRM : UInt8
      # PMAOVR Interrupt disabled
      DISABLED = 0x0_u64

      # PMAOVR Interrupt enabled, an interrupt request is generated when the corresponding bit in the USB_ISTR register is set
      ENABLED = 0x1_u64

      def self.reset_value : PMAOVRM
        CNTR.reset_value.pmaovrm
      end
    end

    # Packet memory area over / underrun              interrupt mask
    def pmaovrm : PMAOVRM
      PMAOVRM.new!((@value >> 14) & 0x1_u32)
    end

    # Packet memory area over / underrun              interrupt mask
    def self.pmaovrm : PMAOVRM
      value.pmaovrm
    end

    # Packet memory area over / underrun              interrupt mask
    def self.pmaovrm=(value : PMAOVRM) : PMAOVRM
      self.set(pmaovrm: value)
      value
    end

    enum CTRM : UInt8
      # Correct Transfer (CTR) Interrupt disabled
      DISABLED = 0x0_u64

      # CTR Interrupt enabled, an interrupt request is generated when the corresponding bit in the USB_ISTR register is set
      ENABLED = 0x1_u64

      def self.reset_value : CTRM
        CNTR.reset_value.ctrm
      end
    end

    # Correct transfer interrupt              mask
    def ctrm : CTRM
      CTRM.new!((@value >> 15) & 0x1_u32)
    end

    # Correct transfer interrupt              mask
    def self.ctrm : CTRM
      value.ctrm
    end

    # Correct transfer interrupt              mask
    def self.ctrm=(value : CTRM) : CTRM
      self.set(ctrm: value)
      value
    end

    def copy_with(
      *,

      fres : FRES? = nil,

      pdwn : PDWN? = nil,

      lpmode : LPMODE? = nil,

      fsusp : FSUSP? = nil,

      resume : RESUME? = nil,

      esofm : ESOFM? = nil,

      sofm : SOFM? = nil,

      resetm : RESETM? = nil,

      suspm : SUSPM? = nil,

      wkupm : WKUPM? = nil,

      errm : ERRM? = nil,

      pmaovrm : PMAOVRM? = nil,

      ctrm : CTRM? = nil
    ) : self
      value = @value

      unless fres.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(fres.to_int).&(0x1_u32) << 0
      end

      unless pdwn.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(pdwn.to_int).&(0x1_u32) << 1
      end

      unless lpmode.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(lpmode.to_int).&(0x1_u32) << 2
      end

      unless fsusp.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(fsusp.to_int).&(0x1_u32) << 3
      end

      unless resume.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(resume.to_int).&(0x1_u32) << 4
      end

      unless esofm.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(esofm.to_int).&(0x1_u32) << 8
      end

      unless sofm.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(sofm.to_int).&(0x1_u32) << 9
      end

      unless resetm.nil?
        value = (value & 0xfffffbff_u32) |
                UInt32.new!(resetm.to_int).&(0x1_u32) << 10
      end

      unless suspm.nil?
        value = (value & 0xfffff7ff_u32) |
                UInt32.new!(suspm.to_int).&(0x1_u32) << 11
      end

      unless wkupm.nil?
        value = (value & 0xffffefff_u32) |
                UInt32.new!(wkupm.to_int).&(0x1_u32) << 12
      end

      unless errm.nil?
        value = (value & 0xffffdfff_u32) |
                UInt32.new!(errm.to_int).&(0x1_u32) << 13
      end

      unless pmaovrm.nil?
        value = (value & 0xffffbfff_u32) |
                UInt32.new!(pmaovrm.to_int).&(0x1_u32) << 14
      end

      unless ctrm.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(ctrm.to_int).&(0x1_u32) << 15
      end

      self.class.new(value)
    end

    def self.set(
      *,
      fres : FRES? = nil,
      pdwn : PDWN? = nil,
      lpmode : LPMODE? = nil,
      fsusp : FSUSP? = nil,
      resume : RESUME? = nil,
      esofm : ESOFM? = nil,
      sofm : SOFM? = nil,
      resetm : RESETM? = nil,
      suspm : SUSPM? = nil,
      wkupm : WKUPM? = nil,
      errm : ERRM? = nil,
      pmaovrm : PMAOVRM? = nil,
      ctrm : CTRM? = nil
    ) : Nil
      self.value = self.value.copy_with(
        fres: fres,
        pdwn: pdwn,
        lpmode: lpmode,
        fsusp: fsusp,
        resume: resume,
        esofm: esofm,
        sofm: sofm,
        resetm: resetm,
        suspm: suspm,
        wkupm: wkupm,
        errm: errm,
        pmaovrm: pmaovrm,
        ctrm: ctrm,
      )
    end
  end # struct

  # interrupt status register
  struct ISTR
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

    # Endpoint Identifier
    def ep_id : UInt8
      UInt8.new!((@value >> 0) & 0xf_u32)
    end

    # Endpoint Identifier
    def self.ep_id : UInt8
      value.ep_id
    end

    enum DIR : UInt8
      # data transmitted by the USB peripheral to the host PC
      TO = 0x0_u64

      # data received by the USB peripheral from the host PC
      FROM = 0x1_u64

      def self.reset_value : DIR
        ISTR.reset_value.dir
      end
    end

    # Direction of transaction
    def dir : DIR
      DIR.new!((@value >> 4) & 0x1_u32)
    end

    # Direction of transaction
    def self.dir : DIR
      value.dir
    end

    enum ESOF : UInt8
      # an SOF packet is expected but not received
      EXPECTEDSTARTOFFRAME = 0x1_u64

      def self.reset_value : ESOF
        ISTR.reset_value.esof
      end
    end

    # Expected start frame
    def esof : ESOF
      ESOF.new!((@value >> 8) & 0x1_u32)
    end

    # Expected start frame
    def self.esof : ESOF
      value.esof
    end

    # Expected start frame
    def self.esof=(value : ESOF) : ESOF
      self.set(esof: value)
      value
    end

    enum SOF : UInt8
      # beginning of a new USB frame and it is set when a SOF packet arrives through the USB bus
      STARTOFFRAME = 0x1_u64

      def self.reset_value : SOF
        ISTR.reset_value.sof
      end
    end

    # start of frame
    def sof : SOF
      SOF.new!((@value >> 9) & 0x1_u32)
    end

    # start of frame
    def self.sof : SOF
      value.sof
    end

    # start of frame
    def self.sof=(value : SOF) : SOF
      self.set(sof: value)
      value
    end

    enum RESET : UInt8
      # peripheral detects an active USB RESET signal at its inputs
      RESET = 0x1_u64

      def self.reset_value : RESET
        ISTR.reset_value.reset
      end
    end

    # reset request
    def reset : RESET
      RESET.new!((@value >> 10) & 0x1_u32)
    end

    # reset request
    def self.reset : RESET
      value.reset
    end

    # reset request
    def self.reset=(value : RESET) : RESET
      self.set(reset: value)
      value
    end

    enum SUSP : UInt8
      # no traffic has been received for 3 ms, indicating a suspend mode request from the USB bus
      SUSPEND = 0x1_u64

      def self.reset_value : SUSP
        ISTR.reset_value.susp
      end
    end

    # Suspend mode request
    def susp : SUSP
      SUSP.new!((@value >> 11) & 0x1_u32)
    end

    # Suspend mode request
    def self.susp : SUSP
      value.susp
    end

    # Suspend mode request
    def self.susp=(value : SUSP) : SUSP
      self.set(susp: value)
      value
    end

    enum WKUP : UInt8
      # activity is detected that wakes up the USB peripheral
      WAKEUP = 0x1_u64

      def self.reset_value : WKUP
        ISTR.reset_value.wkup
      end
    end

    # Wakeup
    def wkup : WKUP
      WKUP.new!((@value >> 12) & 0x1_u32)
    end

    # Wakeup
    def self.wkup : WKUP
      value.wkup
    end

    # Wakeup
    def self.wkup=(value : WKUP) : WKUP
      self.set(wkup: value)
      value
    end

    enum ERR : UInt8
      # One of No ANSwer, Cyclic Redundancy Check, Bit Stuffing or Framing format Violation error occurred
      ERROR = 0x1_u64

      def self.reset_value : ERR
        ISTR.reset_value.err
      end
    end

    # Error
    def err : ERR
      ERR.new!((@value >> 13) & 0x1_u32)
    end

    # Error
    def self.err : ERR
      value.err
    end

    # Error
    def self.err=(value : ERR) : ERR
      self.set(err: value)
      value
    end

    enum PMAOVR : UInt8
      # microcontroller has not been able to respond in time to an USB memory request
      OVERRUN = 0x1_u64

      def self.reset_value : PMAOVR
        ISTR.reset_value.pmaovr
      end
    end

    # Packet memory area over /              underrun
    def pmaovr : PMAOVR
      PMAOVR.new!((@value >> 14) & 0x1_u32)
    end

    # Packet memory area over /              underrun
    def self.pmaovr : PMAOVR
      value.pmaovr
    end

    # Packet memory area over /              underrun
    def self.pmaovr=(value : PMAOVR) : PMAOVR
      self.set(pmaovr: value)
      value
    end

    enum CTR : UInt8
      # endpoint has successfully completed a transaction
      COMPLETED = 0x1_u64

      def self.reset_value : CTR
        ISTR.reset_value.ctr
      end
    end

    # Correct transfer
    def ctr : CTR
      CTR.new!((@value >> 15) & 0x1_u32)
    end

    # Correct transfer
    def self.ctr : CTR
      value.ctr
    end

    def copy_with(
      *,

      esof : ESOF? = nil,

      sof : SOF? = nil,

      reset : RESET? = nil,

      susp : SUSP? = nil,

      wkup : WKUP? = nil,

      err : ERR? = nil,

      pmaovr : PMAOVR? = nil
    ) : self
      value = @value

      unless esof.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(esof.to_int).&(0x1_u32) << 8
      end

      unless sof.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(sof.to_int).&(0x1_u32) << 9
      end

      unless reset.nil?
        value = (value & 0xfffffbff_u32) |
                UInt32.new!(reset.to_int).&(0x1_u32) << 10
      end

      unless susp.nil?
        value = (value & 0xfffff7ff_u32) |
                UInt32.new!(susp.to_int).&(0x1_u32) << 11
      end

      unless wkup.nil?
        value = (value & 0xffffefff_u32) |
                UInt32.new!(wkup.to_int).&(0x1_u32) << 12
      end

      unless err.nil?
        value = (value & 0xffffdfff_u32) |
                UInt32.new!(err.to_int).&(0x1_u32) << 13
      end

      unless pmaovr.nil?
        value = (value & 0xffffbfff_u32) |
                UInt32.new!(pmaovr.to_int).&(0x1_u32) << 14
      end

      self.class.new(value)
    end

    def self.set(
      *,
      esof : ESOF? = nil,
      sof : SOF? = nil,
      reset : RESET? = nil,
      susp : SUSP? = nil,
      wkup : WKUP? = nil,
      err : ERR? = nil,
      pmaovr : PMAOVR? = nil
    ) : Nil
      self.value = self.value.copy_with(
        esof: esof,
        sof: sof,
        reset: reset,
        susp: susp,
        wkup: wkup,
        err: err,
        pmaovr: pmaovr,
      )
    end
  end # struct

  # frame number register
  struct FNR
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

    # Frame number
    def fn : UInt16
      UInt16.new!((@value >> 0) & 0x7ff_u32)
    end

    # Frame number
    def self.fn : UInt16
      value.fn
    end

    # Lost SOF
    def lsof : UInt8
      UInt8.new!((@value >> 11) & 0x3_u32)
    end

    # Lost SOF
    def self.lsof : UInt8
      value.lsof
    end

    enum LCK : UInt8
      # the frame timer remains in this state until an USB reset or USB suspend event occurs
      LOCKED = 0x1_u64

      def self.reset_value : LCK
        FNR.reset_value.lck
      end
    end

    # Locked
    def lck : LCK
      LCK.new!((@value >> 13) & 0x1_u32)
    end

    # Locked
    def self.lck : LCK
      value.lck
    end

    enum RXDM : UInt8
      # received data minus upstream port data line
      RECEIVED = 0x1_u64

      def self.reset_value : RXDM
        FNR.reset_value.rxdm
      end
    end

    # Receive data - line status
    def rxdm : RXDM
      RXDM.new!((@value >> 14) & 0x1_u32)
    end

    # Receive data - line status
    def self.rxdm : RXDM
      value.rxdm
    end

    enum RXDP : UInt8
      # received data plus upstream port data line
      RECEIVED = 0x1_u64

      def self.reset_value : RXDP
        FNR.reset_value.rxdp
      end
    end

    # Receive data + line status
    def rxdp : RXDP
      RXDP.new!((@value >> 15) & 0x1_u32)
    end

    # Receive data + line status
    def self.rxdp : RXDP
      value.rxdp
    end
  end # struct

  # device address
  struct DADDR
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

    # Device address
    def add : Bool
      @value.bits_set?(0x1_u32)
    end

    # Device address
    def self.add : Bool
      value.add
    end

    # Device address
    def self.add=(value : Bool) : Bool
      self.set(add: value)
      value
    end

    # Device address
    def add1 : Bool
      @value.bits_set?(0x2_u32)
    end

    # Device address
    def self.add1 : Bool
      value.add1
    end

    # Device address
    def self.add1=(value : Bool) : Bool
      self.set(add1: value)
      value
    end

    # Device address
    def add2 : Bool
      @value.bits_set?(0x4_u32)
    end

    # Device address
    def self.add2 : Bool
      value.add2
    end

    # Device address
    def self.add2=(value : Bool) : Bool
      self.set(add2: value)
      value
    end

    # Device address
    def add3 : Bool
      @value.bits_set?(0x8_u32)
    end

    # Device address
    def self.add3 : Bool
      value.add3
    end

    # Device address
    def self.add3=(value : Bool) : Bool
      self.set(add3: value)
      value
    end

    # Device address
    def add4 : Bool
      @value.bits_set?(0x10_u32)
    end

    # Device address
    def self.add4 : Bool
      value.add4
    end

    # Device address
    def self.add4=(value : Bool) : Bool
      self.set(add4: value)
      value
    end

    # Device address
    def add5 : Bool
      @value.bits_set?(0x20_u32)
    end

    # Device address
    def self.add5 : Bool
      value.add5
    end

    # Device address
    def self.add5=(value : Bool) : Bool
      self.set(add5: value)
      value
    end

    # Device address
    def add6 : Bool
      @value.bits_set?(0x40_u32)
    end

    # Device address
    def self.add6 : Bool
      value.add6
    end

    # Device address
    def self.add6=(value : Bool) : Bool
      self.set(add6: value)
      value
    end

    enum EF : UInt8
      # USB device disabled
      DISABLED = 0x0_u64

      # USB device enabled
      ENABLED = 0x1_u64

      def self.reset_value : EF
        DADDR.reset_value.ef
      end
    end

    # Enable function
    def ef : EF
      EF.new!((@value >> 7) & 0x1_u32)
    end

    # Enable function
    def self.ef : EF
      value.ef
    end

    # Enable function
    def self.ef=(value : EF) : EF
      self.set(ef: value)
      value
    end

    def copy_with(
      *,

      add : Bool? = nil,

      add1 : Bool? = nil,

      add2 : Bool? = nil,

      add3 : Bool? = nil,

      add4 : Bool? = nil,

      add5 : Bool? = nil,

      add6 : Bool? = nil,

      ef : EF? = nil
    ) : self
      value = @value

      unless add.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(add.to_int).&(0x1_u32) << 0
      end

      unless add1.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(add1.to_int).&(0x1_u32) << 1
      end

      unless add2.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(add2.to_int).&(0x1_u32) << 2
      end

      unless add3.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(add3.to_int).&(0x1_u32) << 3
      end

      unless add4.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(add4.to_int).&(0x1_u32) << 4
      end

      unless add5.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(add5.to_int).&(0x1_u32) << 5
      end

      unless add6.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(add6.to_int).&(0x1_u32) << 6
      end

      unless ef.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(ef.to_int).&(0x1_u32) << 7
      end

      self.class.new(value)
    end

    def self.set(
      *,
      add : Bool? = nil,
      add1 : Bool? = nil,
      add2 : Bool? = nil,
      add3 : Bool? = nil,
      add4 : Bool? = nil,
      add5 : Bool? = nil,
      add6 : Bool? = nil,
      ef : EF? = nil
    ) : Nil
      self.value = self.value.copy_with(
        add: add,
        add1: add1,
        add2: add2,
        add3: add3,
        add4: add4,
        add5: add5,
        add6: add6,
        ef: ef,
      )
    end
  end # struct

  # Buffer table address
  struct BTABLE
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

    # Buffer table
    def btable : UInt16
      UInt16.new!((@value >> 3) & 0x1fff_u32)
    end

    # Buffer table
    def self.btable : UInt16
      value.btable
    end

    # Buffer table
    def self.btable=(value : UInt16) : UInt16
      self.set(btable: value)
      value
    end

    def copy_with(
      *,

      btable : UInt16? = nil
    ) : self
      value = @value

      unless btable.nil?
        value = (value & 0xffff0007_u32) |
                UInt32.new!(btable.to_int).&(0x1fff_u32) << 3
      end

      self.class.new(value)
    end

    def self.set(
      *,
      btable : UInt16? = nil
    ) : Nil
      self.value = self.value.copy_with(
        btable: btable,
      )
    end
  end # struct

end
