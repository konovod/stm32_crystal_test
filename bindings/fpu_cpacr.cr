# Floating point unit CPACR
module FPU_CPACR
  VERSION      = nil
  BASE_ADDRESS = 0xe000ed88_u64

  # Coprocessor access control          register
  struct CPACR
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

    # CP
    def cp : UInt8
      UInt8.new!((@value >> 20) & 0xf_u32)
    end

    # CP
    def self.cp : UInt8
      value.cp
    end

    # CP
    def self.cp=(value : UInt8) : UInt8
      self.set(cp: value)
      value
    end

    def copy_with(
      *,

      cp : UInt8? = nil
    ) : self
      value = @value

      unless cp.nil?
        value = (value & 0xff0fffff_u32) |
                UInt32.new!(cp.to_int).&(0xf_u32) << 20
      end

      self.class.new(value)
    end

    def self.set(
      *,
      cp : UInt8? = nil
    ) : Nil
      self.value = self.value.copy_with(
        cp: cp,
      )
    end
  end # struct

end
