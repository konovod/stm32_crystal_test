module STM32
  module GPIOPin
    @base : GPIO
    @index : Int32

    def initialize(@base, @index)
    end

    def read
      @base.register(0x10).get_bit(@index)
    end
  end

  struct OutputPin
    include GPIOPin

    def configure
      @base.register(0).set_bits(2*@index, 2, 1)
    end

    def turn(value : Bool)
      @base.register(0x18).value = 1u32 << (@index + (value ? 0 : 16))
    end
  end

  struct InputPin
    include GPIOPin

    def configure
      @base.register(0).set_bits(2*@index, 2, 0)
    end
  end
end
