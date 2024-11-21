module STM32
  module GPIOPin
    @base_addr : UInt64
    @index : Int32

    def initialize(@base_addr, @index)
    end

    def register(offset : UInt64)
      Register.new(Pointer(UInt32).new(@base_addr + offset))
    end

    def read
      register(0x10).get_bit(@index)
    end
  end

  struct OutputPin
    include GPIOPin

    def configure
      register(0).set_bits(2*@index, 2, 1)
    end

    def turn(value : Bool)
      register(0x18).value = 1u32 << (@index + (value ? 0 : 16))
    end
  end

  struct InputPin
    include GPIOPin

    def configure
      register(0).set_bits(2*@index, 2, 0)
    end
  end
end
