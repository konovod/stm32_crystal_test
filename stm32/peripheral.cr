struct UInt32
  def ~
    self ^ 0xFFFFFFFF
  end
end

struct Register
  def initialize(@raw : Pointer(UInt32))
  end

  def set_bit(bit, value : Bool)
    if value
      @raw.update(volatile: true) { |v| v | (1u32 << bit) }
    else
      @raw.update(volatile: true) { |v| v & ~(1u32 << bit) }
    end
  end

  def set_bits(bit, count, value : UInt32)
    @raw.update(volatile: true) do |v|
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
    @raw.load(volatile: true)
  end

  def value=(v)
    @raw.store(v, volatile: true)
  end
end
