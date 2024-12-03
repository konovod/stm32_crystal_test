# USB on the go high speed
module OTG_HS_PWRCLK
  VERSION      = nil
  BASE_ADDRESS = 0x40040e00_u64

  # Power and clock gating control          register
  struct OTG_HS_PCGCR
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

    # Stop PHY clock
    def stppclk : Bool
      @value.bits_set?(0x1_u32)
    end

    # Stop PHY clock
    def self.stppclk : Bool
      value.stppclk
    end

    # Stop PHY clock
    def self.stppclk=(value : Bool) : Bool
      self.set(stppclk: value)
      value
    end

    # Gate HCLK
    def gatehclk : Bool
      @value.bits_set?(0x2_u32)
    end

    # Gate HCLK
    def self.gatehclk : Bool
      value.gatehclk
    end

    # Gate HCLK
    def self.gatehclk=(value : Bool) : Bool
      self.set(gatehclk: value)
      value
    end

    # PHY suspended
    def physusp : Bool
      @value.bits_set?(0x10_u32)
    end

    # PHY suspended
    def self.physusp : Bool
      value.physusp
    end

    # PHY suspended
    def self.physusp=(value : Bool) : Bool
      self.set(physusp: value)
      value
    end

    def copy_with(
      *,

      stppclk : Bool? = nil,

      gatehclk : Bool? = nil,

      physusp : Bool? = nil
    ) : self
      value = @value

      unless stppclk.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(stppclk.to_int).&(0x1_u32) << 0
      end

      unless gatehclk.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(gatehclk.to_int).&(0x1_u32) << 1
      end

      unless physusp.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(physusp.to_int).&(0x1_u32) << 4
      end

      self.class.new(value)
    end

    def self.set(
      *,
      stppclk : Bool? = nil,
      gatehclk : Bool? = nil,
      physusp : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        stppclk: stppclk,
        gatehclk: gatehclk,
        physusp: physusp,
      )
    end
  end # struct

end
