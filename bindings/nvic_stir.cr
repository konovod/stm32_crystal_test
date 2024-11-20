# Nested vectored interrupt      controller
module NVIC_STIR
  VERSION      = nil
  BASE_ADDRESS = 0xe000ef00_u64

  # Software trigger interrupt          register
  struct STIR
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

    # Software generated interrupt              ID
    def intid : UInt16
      UInt16.new!((@value >> 0) & 0x1ff_u32)
    end

    # Software generated interrupt              ID
    def self.intid : UInt16
      value.intid
    end

    # Software generated interrupt              ID
    def self.intid=(value : UInt16) : UInt16
      self.set(intid: value)
      value
    end

    def copy_with(
      *,

      intid : UInt16? = nil
    ) : self
      value = @value

      unless intid.nil?
        value = (value & 0xfffffe00_u32) |
                UInt32.new!(intid.to_int).&(0x1ff_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      intid : UInt16? = nil
    ) : Nil
      self.value = self.value.copy_with(
        intid: intid,
      )
    end
  end # struct

end
