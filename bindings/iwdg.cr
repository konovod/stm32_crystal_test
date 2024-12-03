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

    # Key value (write only, read              0000h)
    def self.key=(value : UInt16) : UInt16
      self.set(key: value)
      value
    end

    def copy_with(
      *,

      key : UInt16? = nil
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
      key : UInt16? = nil
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

    # Prescaler divider
    def pr : UInt8
      UInt8.new!((@value >> 0) & 0x7_u32)
    end

    # Prescaler divider
    def self.pr : UInt8
      value.pr
    end

    # Prescaler divider
    def self.pr=(value : UInt8) : UInt8
      self.set(pr: value)
      value
    end

    def copy_with(
      *,

      pr : UInt8? = nil
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
      pr : UInt8? = nil
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

    # Watchdog counter reload value              update
    def rvu : Bool
      @value.bits_set?(0x2_u32)
    end

    # Watchdog counter reload value              update
    def self.rvu : Bool
      value.rvu
    end

    # Watchdog prescaler value              update
    def pvu : Bool
      @value.bits_set?(0x1_u32)
    end

    # Watchdog prescaler value              update
    def self.pvu : Bool
      value.pvu
    end
  end # struct

end
