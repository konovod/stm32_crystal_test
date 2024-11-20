# Independent watchdog
module IWDG
  VERSION      = nil
  BASE_ADDRESS = 0x40003000_u64

  # Key register
  struct KR
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

    enum KEY : UInt16
      # Enable access to PR, RLR and WINR registers (0x5555)
      ENABLE = 0x5555_u64

      # Reset the watchdog value (0xAAAA)
      RESET = 0xaaaa_u64

      # Start the watchdog (0xCCCC)
      START = 0xcccc_u64

      def self.reset_value : KEY
        KR.reset_value.key
      end
    end

    # Key value
    def self.key=(value : KEY) : KEY
      self.set(key: value)
      value
    end

    def copy_with(
      *,

      key : KEY? = nil
    ) : self
      value = @value

      unless key.nil?
        value = (value & 0xffff0000_u32) |
                UInt32.new!(key.to_int).&(0xffff_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      key : KEY? = nil
    ) : Nil
      self.value = self.value.copy_with(
        key: key,
      )
    end
  end # struct

  # Prescaler register
  struct PR
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

    enum PR : UInt8
      # Divider /4
      DIVIDEBY4 = 0x0_u64

      # Divider /8
      DIVIDEBY8 = 0x1_u64

      # Divider /16
      DIVIDEBY16 = 0x2_u64

      # Divider /32
      DIVIDEBY32 = 0x3_u64

      # Divider /64
      DIVIDEBY64 = 0x4_u64

      # Divider /128
      DIVIDEBY128 = 0x5_u64

      # Divider /256
      DIVIDEBY256 = 0x6_u64

      # Divider /256
      DIVIDEBY256BIS = 0x7_u64

      def self.reset_value : PR
        PR.reset_value.pr
      end
    end

    # Prescaler divider
    def pr : PR
      PR.new!((@value >> 0) & 0x7_u32)
    end

    # Prescaler divider
    def self.pr : PR
      value.pr
    end

    # Prescaler divider
    def self.pr=(value : PR) : PR
      self.set(pr: value)
      value
    end

    def copy_with(
      *,

      pr : PR? = nil
    ) : self
      value = @value

      unless pr.nil?
        value = (value & 0xfffffff8_u32) |
                UInt32.new!(pr.to_int).&(0x7_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      pr : PR? = nil
    ) : Nil
      self.value = self.value.copy_with(
        pr: pr,
      )
    end
  end # struct

  # Reload register
  struct RLR
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
      new(0xfff_u64)
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

    # Watchdog counter reload              value
    def rl : UInt16
      UInt16.new!((@value >> 0) & 0xfff_u32)
    end

    # Watchdog counter reload              value
    def self.rl : UInt16
      value.rl
    end

    # Watchdog counter reload              value
    def self.rl=(value : UInt16) : UInt16
      self.set(rl: value)
      value
    end

    def copy_with(
      *,

      rl : UInt16? = nil
    ) : self
      value = @value

      unless rl.nil?
        value = (value & 0xfffff000_u32) |
                UInt32.new!(rl.to_int).&(0xfff_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      rl : UInt16? = nil
    ) : Nil
      self.value = self.value.copy_with(
        rl: rl,
      )
    end
  end # struct

  # Status register
  struct SR
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

    # Watchdog prescaler value              update
    def pvu : Bool
      @value.bits_set?(0x1_u32)
    end

    # Watchdog prescaler value              update
    def self.pvu : Bool
      value.pvu
    end

    # Watchdog counter reload value              update
    def rvu : Bool
      @value.bits_set?(0x2_u32)
    end

    # Watchdog counter reload value              update
    def self.rvu : Bool
      value.rvu
    end

    # Watchdog counter window value              update
    def wvu : Bool
      @value.bits_set?(0x4_u32)
    end

    # Watchdog counter window value              update
    def self.wvu : Bool
      value.wvu
    end
  end # struct

  # Window register
  struct WINR
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
      new(0xfff_u64)
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

    # Watchdog counter window              value
    def win : UInt16
      UInt16.new!((@value >> 0) & 0xfff_u32)
    end

    # Watchdog counter window              value
    def self.win : UInt16
      value.win
    end

    # Watchdog counter window              value
    def self.win=(value : UInt16) : UInt16
      self.set(win: value)
      value
    end

    def copy_with(
      *,

      win : UInt16? = nil
    ) : self
      value = @value

      unless win.nil?
        value = (value & 0xfffff000_u32) |
                UInt32.new!(win.to_int).&(0xfff_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      win : UInt16? = nil
    ) : Nil
      self.value = self.value.copy_with(
        win: win,
      )
    end
  end # struct

end
