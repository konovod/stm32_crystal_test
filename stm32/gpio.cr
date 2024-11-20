struct UInt32
  def ~
    self ^ 0xFFFFFFFF
  end
end

struct RegPointer
  def initialize(@raw : Pointer(UInt32))
  end

  def set_bit(bit, value : Bool)
    if value
      @raw.update(volatile: true) { |v| v |= (1u32 << bit) }
    else
      @raw.update(volatile: true) { |v| v &= ~(1u32 << bit) }
    end
  end

  def set_bits(bit, count, value)
    @raw.update(volatile: true) do |v|
      mask = (1u32 << count) - 1
      v &= ~(mask << bit)
      v |= (value.to_u32! << bit)
    end
  end

  def value
    @raw.load(volatile: true)
  end

  def value=(v)
    @raw.store(v, volatile: true)
  end
end

module STM32
  module GPIOPin
    @base_addr : UInt64
    @index : Int32

    def initialize(@base_addr, @index)
    end

    def reg_ptr(offset : UInt64)
      RegPointer.new(Pointer(UInt32).new(@base_addr + offset))
    end
  end

  struct OutputPin
    include GPIOPin

    def configure
      reg_ptr(0).set_bits(2*@index, 2, 1)
    end

    def turn(value : Bool)
      reg_ptr(0x18).value = 1u32 << (@index + (value ? 0 : 16))
    end
  end
end
