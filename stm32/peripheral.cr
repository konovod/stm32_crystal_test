struct UInt32
  def ~
    self ^ 0xFFFFFFFF
  end
end

module Register
  abstract def pointer : Pointer(UInt32)

  def set_bit(bit, value : Bool)
    if value
      pointer.update(volatile: true) { |v| v | (1u32 << bit) }
    else
      pointer.update(volatile: true) { |v| v & ~(1u32 << bit) }
    end
  end

  def set_bits(bit, count, value : UInt32)
    pointer.update(volatile: true) do |v|
      mask = (1u32 << count) - 1
      v &= ~(mask << bit)
      v | (value << bit)
    end
  end

  def get_bits(bit, count)
    mask = (1u32 << count) - 1
    (value >> bit) & mask
  end

  def get_bit(bit)
    ((value >> bit) & 1) > 0
  end

  def value
    pointer.load(volatile: true)
  end

  def value=(v)
    pointer.store(v, volatile: true)
  end
end

struct CustomRegister
  include Register

  def initialize(@raw : Pointer(UInt32))
  end
  
  def initialize(addr : UInt64)
    @raw = Pointer(UInt32).new(addr)
  end

  @[AlwaysInline]
  def pointer : Pointer(UInt32)
    @raw
  end
end

module FixedRegister
  include Register  
  @[AlwaysInline]
  def pointer : Pointer(UInt32)
    ADDRESS
  end
end

module Peripheral
  @[AlwaysInline]
  def register(offset : Int32)
    CustomRegister.new(base_address + offset)
  end
end
