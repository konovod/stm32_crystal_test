# System control block ACTLR
module SCB_ACTRL
  VERSION      = nil
  BASE_ADDRESS = 0xe000e008_u64

  # Auxiliary control register
  struct ACTRL
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

    # DISMCYCINT
    def dismcycint : Bool
      @value.bits_set?(0x1_u32)
    end

    # DISMCYCINT
    def self.dismcycint : Bool
      value.dismcycint
    end

    # DISMCYCINT
    def self.dismcycint=(value : Bool) : Bool
      self.set(dismcycint: value)
      value
    end

    # DISDEFWBUF
    def disdefwbuf : Bool
      @value.bits_set?(0x2_u32)
    end

    # DISDEFWBUF
    def self.disdefwbuf : Bool
      value.disdefwbuf
    end

    # DISDEFWBUF
    def self.disdefwbuf=(value : Bool) : Bool
      self.set(disdefwbuf: value)
      value
    end

    # DISFOLD
    def disfold : Bool
      @value.bits_set?(0x4_u32)
    end

    # DISFOLD
    def self.disfold : Bool
      value.disfold
    end

    # DISFOLD
    def self.disfold=(value : Bool) : Bool
      self.set(disfold: value)
      value
    end

    # DISFPCA
    def disfpca : Bool
      @value.bits_set?(0x100_u32)
    end

    # DISFPCA
    def self.disfpca : Bool
      value.disfpca
    end

    # DISFPCA
    def self.disfpca=(value : Bool) : Bool
      self.set(disfpca: value)
      value
    end

    # DISOOFP
    def disoofp : Bool
      @value.bits_set?(0x200_u32)
    end

    # DISOOFP
    def self.disoofp : Bool
      value.disoofp
    end

    # DISOOFP
    def self.disoofp=(value : Bool) : Bool
      self.set(disoofp: value)
      value
    end

    def copy_with(
      *,

      dismcycint : Bool? = nil,

      disdefwbuf : Bool? = nil,

      disfold : Bool? = nil,

      disfpca : Bool? = nil,

      disoofp : Bool? = nil
    ) : self
      value = @value

      unless dismcycint.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(dismcycint.to_int).&(0x1_u32) << 0
      end

      unless disdefwbuf.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(disdefwbuf.to_int).&(0x1_u32) << 1
      end

      unless disfold.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(disfold.to_int).&(0x1_u32) << 2
      end

      unless disfpca.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(disfpca.to_int).&(0x1_u32) << 8
      end

      unless disoofp.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(disoofp.to_int).&(0x1_u32) << 9
      end

      self.class.new(value)
    end

    def self.set(
      *,
      dismcycint : Bool? = nil,
      disdefwbuf : Bool? = nil,
      disfold : Bool? = nil,
      disfpca : Bool? = nil,
      disoofp : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        dismcycint: dismcycint,
        disdefwbuf: disdefwbuf,
        disfold: disfold,
        disfpca: disfpca,
        disoofp: disoofp,
      )
    end
  end # struct

end
