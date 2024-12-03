# External interrupt/event      controller
module EXTI
  VERSION      = nil
  BASE_ADDRESS = 0x40013c00_u64

  # Interrupt mask register          (EXTI_IMR)
  struct IMR
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

    # Interrupt Mask on line 0
    def mr0 : Bool
      @value.bits_set?(0x1_u32)
    end

    # Interrupt Mask on line 0
    def self.mr0 : Bool
      value.mr0
    end

    # Interrupt Mask on line 0
    def self.mr0=(value : Bool) : Bool
      self.set(mr0: value)
      value
    end

    # Interrupt Mask on line 1
    def mr1 : Bool
      @value.bits_set?(0x2_u32)
    end

    # Interrupt Mask on line 1
    def self.mr1 : Bool
      value.mr1
    end

    # Interrupt Mask on line 1
    def self.mr1=(value : Bool) : Bool
      self.set(mr1: value)
      value
    end

    # Interrupt Mask on line 2
    def mr2 : Bool
      @value.bits_set?(0x4_u32)
    end

    # Interrupt Mask on line 2
    def self.mr2 : Bool
      value.mr2
    end

    # Interrupt Mask on line 2
    def self.mr2=(value : Bool) : Bool
      self.set(mr2: value)
      value
    end

    # Interrupt Mask on line 3
    def mr3 : Bool
      @value.bits_set?(0x8_u32)
    end

    # Interrupt Mask on line 3
    def self.mr3 : Bool
      value.mr3
    end

    # Interrupt Mask on line 3
    def self.mr3=(value : Bool) : Bool
      self.set(mr3: value)
      value
    end

    # Interrupt Mask on line 4
    def mr4 : Bool
      @value.bits_set?(0x10_u32)
    end

    # Interrupt Mask on line 4
    def self.mr4 : Bool
      value.mr4
    end

    # Interrupt Mask on line 4
    def self.mr4=(value : Bool) : Bool
      self.set(mr4: value)
      value
    end

    # Interrupt Mask on line 5
    def mr5 : Bool
      @value.bits_set?(0x20_u32)
    end

    # Interrupt Mask on line 5
    def self.mr5 : Bool
      value.mr5
    end

    # Interrupt Mask on line 5
    def self.mr5=(value : Bool) : Bool
      self.set(mr5: value)
      value
    end

    # Interrupt Mask on line 6
    def mr6 : Bool
      @value.bits_set?(0x40_u32)
    end

    # Interrupt Mask on line 6
    def self.mr6 : Bool
      value.mr6
    end

    # Interrupt Mask on line 6
    def self.mr6=(value : Bool) : Bool
      self.set(mr6: value)
      value
    end

    # Interrupt Mask on line 7
    def mr7 : Bool
      @value.bits_set?(0x80_u32)
    end

    # Interrupt Mask on line 7
    def self.mr7 : Bool
      value.mr7
    end

    # Interrupt Mask on line 7
    def self.mr7=(value : Bool) : Bool
      self.set(mr7: value)
      value
    end

    # Interrupt Mask on line 8
    def mr8 : Bool
      @value.bits_set?(0x100_u32)
    end

    # Interrupt Mask on line 8
    def self.mr8 : Bool
      value.mr8
    end

    # Interrupt Mask on line 8
    def self.mr8=(value : Bool) : Bool
      self.set(mr8: value)
      value
    end

    # Interrupt Mask on line 9
    def mr9 : Bool
      @value.bits_set?(0x200_u32)
    end

    # Interrupt Mask on line 9
    def self.mr9 : Bool
      value.mr9
    end

    # Interrupt Mask on line 9
    def self.mr9=(value : Bool) : Bool
      self.set(mr9: value)
      value
    end

    # Interrupt Mask on line 10
    def mr10 : Bool
      @value.bits_set?(0x400_u32)
    end

    # Interrupt Mask on line 10
    def self.mr10 : Bool
      value.mr10
    end

    # Interrupt Mask on line 10
    def self.mr10=(value : Bool) : Bool
      self.set(mr10: value)
      value
    end

    # Interrupt Mask on line 11
    def mr11 : Bool
      @value.bits_set?(0x800_u32)
    end

    # Interrupt Mask on line 11
    def self.mr11 : Bool
      value.mr11
    end

    # Interrupt Mask on line 11
    def self.mr11=(value : Bool) : Bool
      self.set(mr11: value)
      value
    end

    # Interrupt Mask on line 12
    def mr12 : Bool
      @value.bits_set?(0x1000_u32)
    end

    # Interrupt Mask on line 12
    def self.mr12 : Bool
      value.mr12
    end

    # Interrupt Mask on line 12
    def self.mr12=(value : Bool) : Bool
      self.set(mr12: value)
      value
    end

    # Interrupt Mask on line 13
    def mr13 : Bool
      @value.bits_set?(0x2000_u32)
    end

    # Interrupt Mask on line 13
    def self.mr13 : Bool
      value.mr13
    end

    # Interrupt Mask on line 13
    def self.mr13=(value : Bool) : Bool
      self.set(mr13: value)
      value
    end

    # Interrupt Mask on line 14
    def mr14 : Bool
      @value.bits_set?(0x4000_u32)
    end

    # Interrupt Mask on line 14
    def self.mr14 : Bool
      value.mr14
    end

    # Interrupt Mask on line 14
    def self.mr14=(value : Bool) : Bool
      self.set(mr14: value)
      value
    end

    # Interrupt Mask on line 15
    def mr15 : Bool
      @value.bits_set?(0x8000_u32)
    end

    # Interrupt Mask on line 15
    def self.mr15 : Bool
      value.mr15
    end

    # Interrupt Mask on line 15
    def self.mr15=(value : Bool) : Bool
      self.set(mr15: value)
      value
    end

    # Interrupt Mask on line 16
    def mr16 : Bool
      @value.bits_set?(0x10000_u32)
    end

    # Interrupt Mask on line 16
    def self.mr16 : Bool
      value.mr16
    end

    # Interrupt Mask on line 16
    def self.mr16=(value : Bool) : Bool
      self.set(mr16: value)
      value
    end

    # Interrupt Mask on line 17
    def mr17 : Bool
      @value.bits_set?(0x20000_u32)
    end

    # Interrupt Mask on line 17
    def self.mr17 : Bool
      value.mr17
    end

    # Interrupt Mask on line 17
    def self.mr17=(value : Bool) : Bool
      self.set(mr17: value)
      value
    end

    # Interrupt Mask on line 18
    def mr18 : Bool
      @value.bits_set?(0x40000_u32)
    end

    # Interrupt Mask on line 18
    def self.mr18 : Bool
      value.mr18
    end

    # Interrupt Mask on line 18
    def self.mr18=(value : Bool) : Bool
      self.set(mr18: value)
      value
    end

    # Interrupt Mask on line 19
    def mr19 : Bool
      @value.bits_set?(0x80000_u32)
    end

    # Interrupt Mask on line 19
    def self.mr19 : Bool
      value.mr19
    end

    # Interrupt Mask on line 19
    def self.mr19=(value : Bool) : Bool
      self.set(mr19: value)
      value
    end

    # Interrupt Mask on line 20
    def mr20 : Bool
      @value.bits_set?(0x100000_u32)
    end

    # Interrupt Mask on line 20
    def self.mr20 : Bool
      value.mr20
    end

    # Interrupt Mask on line 20
    def self.mr20=(value : Bool) : Bool
      self.set(mr20: value)
      value
    end

    # Interrupt Mask on line 21
    def mr21 : Bool
      @value.bits_set?(0x200000_u32)
    end

    # Interrupt Mask on line 21
    def self.mr21 : Bool
      value.mr21
    end

    # Interrupt Mask on line 21
    def self.mr21=(value : Bool) : Bool
      self.set(mr21: value)
      value
    end

    # Interrupt Mask on line 22
    def mr22 : Bool
      @value.bits_set?(0x400000_u32)
    end

    # Interrupt Mask on line 22
    def self.mr22 : Bool
      value.mr22
    end

    # Interrupt Mask on line 22
    def self.mr22=(value : Bool) : Bool
      self.set(mr22: value)
      value
    end

    def copy_with(
      *,

      mr0 : Bool? = nil,

      mr1 : Bool? = nil,

      mr2 : Bool? = nil,

      mr3 : Bool? = nil,

      mr4 : Bool? = nil,

      mr5 : Bool? = nil,

      mr6 : Bool? = nil,

      mr7 : Bool? = nil,

      mr8 : Bool? = nil,

      mr9 : Bool? = nil,

      mr10 : Bool? = nil,

      mr11 : Bool? = nil,

      mr12 : Bool? = nil,

      mr13 : Bool? = nil,

      mr14 : Bool? = nil,

      mr15 : Bool? = nil,

      mr16 : Bool? = nil,

      mr17 : Bool? = nil,

      mr18 : Bool? = nil,

      mr19 : Bool? = nil,

      mr20 : Bool? = nil,

      mr21 : Bool? = nil,

      mr22 : Bool? = nil
    ) : self
      value = @value

      unless mr0.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(mr0.to_int).&(0x1_u32) << 0
      end

      unless mr1.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(mr1.to_int).&(0x1_u32) << 1
      end

      unless mr2.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(mr2.to_int).&(0x1_u32) << 2
      end

      unless mr3.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(mr3.to_int).&(0x1_u32) << 3
      end

      unless mr4.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(mr4.to_int).&(0x1_u32) << 4
      end

      unless mr5.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(mr5.to_int).&(0x1_u32) << 5
      end

      unless mr6.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(mr6.to_int).&(0x1_u32) << 6
      end

      unless mr7.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(mr7.to_int).&(0x1_u32) << 7
      end

      unless mr8.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(mr8.to_int).&(0x1_u32) << 8
      end

      unless mr9.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(mr9.to_int).&(0x1_u32) << 9
      end

      unless mr10.nil?
        value = (value & 0xfffffbff_u32) |
                UInt32.new!(mr10.to_int).&(0x1_u32) << 10
      end

      unless mr11.nil?
        value = (value & 0xfffff7ff_u32) |
                UInt32.new!(mr11.to_int).&(0x1_u32) << 11
      end

      unless mr12.nil?
        value = (value & 0xffffefff_u32) |
                UInt32.new!(mr12.to_int).&(0x1_u32) << 12
      end

      unless mr13.nil?
        value = (value & 0xffffdfff_u32) |
                UInt32.new!(mr13.to_int).&(0x1_u32) << 13
      end

      unless mr14.nil?
        value = (value & 0xffffbfff_u32) |
                UInt32.new!(mr14.to_int).&(0x1_u32) << 14
      end

      unless mr15.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(mr15.to_int).&(0x1_u32) << 15
      end

      unless mr16.nil?
        value = (value & 0xfffeffff_u32) |
                UInt32.new!(mr16.to_int).&(0x1_u32) << 16
      end

      unless mr17.nil?
        value = (value & 0xfffdffff_u32) |
                UInt32.new!(mr17.to_int).&(0x1_u32) << 17
      end

      unless mr18.nil?
        value = (value & 0xfffbffff_u32) |
                UInt32.new!(mr18.to_int).&(0x1_u32) << 18
      end

      unless mr19.nil?
        value = (value & 0xfff7ffff_u32) |
                UInt32.new!(mr19.to_int).&(0x1_u32) << 19
      end

      unless mr20.nil?
        value = (value & 0xffefffff_u32) |
                UInt32.new!(mr20.to_int).&(0x1_u32) << 20
      end

      unless mr21.nil?
        value = (value & 0xffdfffff_u32) |
                UInt32.new!(mr21.to_int).&(0x1_u32) << 21
      end

      unless mr22.nil?
        value = (value & 0xffbfffff_u32) |
                UInt32.new!(mr22.to_int).&(0x1_u32) << 22
      end

      self.class.new(value)
    end

    def self.set(
      *,
      mr0 : Bool? = nil,
      mr1 : Bool? = nil,
      mr2 : Bool? = nil,
      mr3 : Bool? = nil,
      mr4 : Bool? = nil,
      mr5 : Bool? = nil,
      mr6 : Bool? = nil,
      mr7 : Bool? = nil,
      mr8 : Bool? = nil,
      mr9 : Bool? = nil,
      mr10 : Bool? = nil,
      mr11 : Bool? = nil,
      mr12 : Bool? = nil,
      mr13 : Bool? = nil,
      mr14 : Bool? = nil,
      mr15 : Bool? = nil,
      mr16 : Bool? = nil,
      mr17 : Bool? = nil,
      mr18 : Bool? = nil,
      mr19 : Bool? = nil,
      mr20 : Bool? = nil,
      mr21 : Bool? = nil,
      mr22 : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        mr0: mr0,
        mr1: mr1,
        mr2: mr2,
        mr3: mr3,
        mr4: mr4,
        mr5: mr5,
        mr6: mr6,
        mr7: mr7,
        mr8: mr8,
        mr9: mr9,
        mr10: mr10,
        mr11: mr11,
        mr12: mr12,
        mr13: mr13,
        mr14: mr14,
        mr15: mr15,
        mr16: mr16,
        mr17: mr17,
        mr18: mr18,
        mr19: mr19,
        mr20: mr20,
        mr21: mr21,
        mr22: mr22,
      )
    end
  end # struct

  # Event mask register (EXTI_EMR)
  struct EMR
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

    # Event Mask on line 0
    def mr0 : Bool
      @value.bits_set?(0x1_u32)
    end

    # Event Mask on line 0
    def self.mr0 : Bool
      value.mr0
    end

    # Event Mask on line 0
    def self.mr0=(value : Bool) : Bool
      self.set(mr0: value)
      value
    end

    # Event Mask on line 1
    def mr1 : Bool
      @value.bits_set?(0x2_u32)
    end

    # Event Mask on line 1
    def self.mr1 : Bool
      value.mr1
    end

    # Event Mask on line 1
    def self.mr1=(value : Bool) : Bool
      self.set(mr1: value)
      value
    end

    # Event Mask on line 2
    def mr2 : Bool
      @value.bits_set?(0x4_u32)
    end

    # Event Mask on line 2
    def self.mr2 : Bool
      value.mr2
    end

    # Event Mask on line 2
    def self.mr2=(value : Bool) : Bool
      self.set(mr2: value)
      value
    end

    # Event Mask on line 3
    def mr3 : Bool
      @value.bits_set?(0x8_u32)
    end

    # Event Mask on line 3
    def self.mr3 : Bool
      value.mr3
    end

    # Event Mask on line 3
    def self.mr3=(value : Bool) : Bool
      self.set(mr3: value)
      value
    end

    # Event Mask on line 4
    def mr4 : Bool
      @value.bits_set?(0x10_u32)
    end

    # Event Mask on line 4
    def self.mr4 : Bool
      value.mr4
    end

    # Event Mask on line 4
    def self.mr4=(value : Bool) : Bool
      self.set(mr4: value)
      value
    end

    # Event Mask on line 5
    def mr5 : Bool
      @value.bits_set?(0x20_u32)
    end

    # Event Mask on line 5
    def self.mr5 : Bool
      value.mr5
    end

    # Event Mask on line 5
    def self.mr5=(value : Bool) : Bool
      self.set(mr5: value)
      value
    end

    # Event Mask on line 6
    def mr6 : Bool
      @value.bits_set?(0x40_u32)
    end

    # Event Mask on line 6
    def self.mr6 : Bool
      value.mr6
    end

    # Event Mask on line 6
    def self.mr6=(value : Bool) : Bool
      self.set(mr6: value)
      value
    end

    # Event Mask on line 7
    def mr7 : Bool
      @value.bits_set?(0x80_u32)
    end

    # Event Mask on line 7
    def self.mr7 : Bool
      value.mr7
    end

    # Event Mask on line 7
    def self.mr7=(value : Bool) : Bool
      self.set(mr7: value)
      value
    end

    # Event Mask on line 8
    def mr8 : Bool
      @value.bits_set?(0x100_u32)
    end

    # Event Mask on line 8
    def self.mr8 : Bool
      value.mr8
    end

    # Event Mask on line 8
    def self.mr8=(value : Bool) : Bool
      self.set(mr8: value)
      value
    end

    # Event Mask on line 9
    def mr9 : Bool
      @value.bits_set?(0x200_u32)
    end

    # Event Mask on line 9
    def self.mr9 : Bool
      value.mr9
    end

    # Event Mask on line 9
    def self.mr9=(value : Bool) : Bool
      self.set(mr9: value)
      value
    end

    # Event Mask on line 10
    def mr10 : Bool
      @value.bits_set?(0x400_u32)
    end

    # Event Mask on line 10
    def self.mr10 : Bool
      value.mr10
    end

    # Event Mask on line 10
    def self.mr10=(value : Bool) : Bool
      self.set(mr10: value)
      value
    end

    # Event Mask on line 11
    def mr11 : Bool
      @value.bits_set?(0x800_u32)
    end

    # Event Mask on line 11
    def self.mr11 : Bool
      value.mr11
    end

    # Event Mask on line 11
    def self.mr11=(value : Bool) : Bool
      self.set(mr11: value)
      value
    end

    # Event Mask on line 12
    def mr12 : Bool
      @value.bits_set?(0x1000_u32)
    end

    # Event Mask on line 12
    def self.mr12 : Bool
      value.mr12
    end

    # Event Mask on line 12
    def self.mr12=(value : Bool) : Bool
      self.set(mr12: value)
      value
    end

    # Event Mask on line 13
    def mr13 : Bool
      @value.bits_set?(0x2000_u32)
    end

    # Event Mask on line 13
    def self.mr13 : Bool
      value.mr13
    end

    # Event Mask on line 13
    def self.mr13=(value : Bool) : Bool
      self.set(mr13: value)
      value
    end

    # Event Mask on line 14
    def mr14 : Bool
      @value.bits_set?(0x4000_u32)
    end

    # Event Mask on line 14
    def self.mr14 : Bool
      value.mr14
    end

    # Event Mask on line 14
    def self.mr14=(value : Bool) : Bool
      self.set(mr14: value)
      value
    end

    # Event Mask on line 15
    def mr15 : Bool
      @value.bits_set?(0x8000_u32)
    end

    # Event Mask on line 15
    def self.mr15 : Bool
      value.mr15
    end

    # Event Mask on line 15
    def self.mr15=(value : Bool) : Bool
      self.set(mr15: value)
      value
    end

    # Event Mask on line 16
    def mr16 : Bool
      @value.bits_set?(0x10000_u32)
    end

    # Event Mask on line 16
    def self.mr16 : Bool
      value.mr16
    end

    # Event Mask on line 16
    def self.mr16=(value : Bool) : Bool
      self.set(mr16: value)
      value
    end

    # Event Mask on line 17
    def mr17 : Bool
      @value.bits_set?(0x20000_u32)
    end

    # Event Mask on line 17
    def self.mr17 : Bool
      value.mr17
    end

    # Event Mask on line 17
    def self.mr17=(value : Bool) : Bool
      self.set(mr17: value)
      value
    end

    # Event Mask on line 18
    def mr18 : Bool
      @value.bits_set?(0x40000_u32)
    end

    # Event Mask on line 18
    def self.mr18 : Bool
      value.mr18
    end

    # Event Mask on line 18
    def self.mr18=(value : Bool) : Bool
      self.set(mr18: value)
      value
    end

    # Event Mask on line 19
    def mr19 : Bool
      @value.bits_set?(0x80000_u32)
    end

    # Event Mask on line 19
    def self.mr19 : Bool
      value.mr19
    end

    # Event Mask on line 19
    def self.mr19=(value : Bool) : Bool
      self.set(mr19: value)
      value
    end

    # Event Mask on line 20
    def mr20 : Bool
      @value.bits_set?(0x100000_u32)
    end

    # Event Mask on line 20
    def self.mr20 : Bool
      value.mr20
    end

    # Event Mask on line 20
    def self.mr20=(value : Bool) : Bool
      self.set(mr20: value)
      value
    end

    # Event Mask on line 21
    def mr21 : Bool
      @value.bits_set?(0x200000_u32)
    end

    # Event Mask on line 21
    def self.mr21 : Bool
      value.mr21
    end

    # Event Mask on line 21
    def self.mr21=(value : Bool) : Bool
      self.set(mr21: value)
      value
    end

    # Event Mask on line 22
    def mr22 : Bool
      @value.bits_set?(0x400000_u32)
    end

    # Event Mask on line 22
    def self.mr22 : Bool
      value.mr22
    end

    # Event Mask on line 22
    def self.mr22=(value : Bool) : Bool
      self.set(mr22: value)
      value
    end

    def copy_with(
      *,

      mr0 : Bool? = nil,

      mr1 : Bool? = nil,

      mr2 : Bool? = nil,

      mr3 : Bool? = nil,

      mr4 : Bool? = nil,

      mr5 : Bool? = nil,

      mr6 : Bool? = nil,

      mr7 : Bool? = nil,

      mr8 : Bool? = nil,

      mr9 : Bool? = nil,

      mr10 : Bool? = nil,

      mr11 : Bool? = nil,

      mr12 : Bool? = nil,

      mr13 : Bool? = nil,

      mr14 : Bool? = nil,

      mr15 : Bool? = nil,

      mr16 : Bool? = nil,

      mr17 : Bool? = nil,

      mr18 : Bool? = nil,

      mr19 : Bool? = nil,

      mr20 : Bool? = nil,

      mr21 : Bool? = nil,

      mr22 : Bool? = nil
    ) : self
      value = @value

      unless mr0.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(mr0.to_int).&(0x1_u32) << 0
      end

      unless mr1.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(mr1.to_int).&(0x1_u32) << 1
      end

      unless mr2.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(mr2.to_int).&(0x1_u32) << 2
      end

      unless mr3.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(mr3.to_int).&(0x1_u32) << 3
      end

      unless mr4.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(mr4.to_int).&(0x1_u32) << 4
      end

      unless mr5.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(mr5.to_int).&(0x1_u32) << 5
      end

      unless mr6.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(mr6.to_int).&(0x1_u32) << 6
      end

      unless mr7.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(mr7.to_int).&(0x1_u32) << 7
      end

      unless mr8.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(mr8.to_int).&(0x1_u32) << 8
      end

      unless mr9.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(mr9.to_int).&(0x1_u32) << 9
      end

      unless mr10.nil?
        value = (value & 0xfffffbff_u32) |
                UInt32.new!(mr10.to_int).&(0x1_u32) << 10
      end

      unless mr11.nil?
        value = (value & 0xfffff7ff_u32) |
                UInt32.new!(mr11.to_int).&(0x1_u32) << 11
      end

      unless mr12.nil?
        value = (value & 0xffffefff_u32) |
                UInt32.new!(mr12.to_int).&(0x1_u32) << 12
      end

      unless mr13.nil?
        value = (value & 0xffffdfff_u32) |
                UInt32.new!(mr13.to_int).&(0x1_u32) << 13
      end

      unless mr14.nil?
        value = (value & 0xffffbfff_u32) |
                UInt32.new!(mr14.to_int).&(0x1_u32) << 14
      end

      unless mr15.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(mr15.to_int).&(0x1_u32) << 15
      end

      unless mr16.nil?
        value = (value & 0xfffeffff_u32) |
                UInt32.new!(mr16.to_int).&(0x1_u32) << 16
      end

      unless mr17.nil?
        value = (value & 0xfffdffff_u32) |
                UInt32.new!(mr17.to_int).&(0x1_u32) << 17
      end

      unless mr18.nil?
        value = (value & 0xfffbffff_u32) |
                UInt32.new!(mr18.to_int).&(0x1_u32) << 18
      end

      unless mr19.nil?
        value = (value & 0xfff7ffff_u32) |
                UInt32.new!(mr19.to_int).&(0x1_u32) << 19
      end

      unless mr20.nil?
        value = (value & 0xffefffff_u32) |
                UInt32.new!(mr20.to_int).&(0x1_u32) << 20
      end

      unless mr21.nil?
        value = (value & 0xffdfffff_u32) |
                UInt32.new!(mr21.to_int).&(0x1_u32) << 21
      end

      unless mr22.nil?
        value = (value & 0xffbfffff_u32) |
                UInt32.new!(mr22.to_int).&(0x1_u32) << 22
      end

      self.class.new(value)
    end

    def self.set(
      *,
      mr0 : Bool? = nil,
      mr1 : Bool? = nil,
      mr2 : Bool? = nil,
      mr3 : Bool? = nil,
      mr4 : Bool? = nil,
      mr5 : Bool? = nil,
      mr6 : Bool? = nil,
      mr7 : Bool? = nil,
      mr8 : Bool? = nil,
      mr9 : Bool? = nil,
      mr10 : Bool? = nil,
      mr11 : Bool? = nil,
      mr12 : Bool? = nil,
      mr13 : Bool? = nil,
      mr14 : Bool? = nil,
      mr15 : Bool? = nil,
      mr16 : Bool? = nil,
      mr17 : Bool? = nil,
      mr18 : Bool? = nil,
      mr19 : Bool? = nil,
      mr20 : Bool? = nil,
      mr21 : Bool? = nil,
      mr22 : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        mr0: mr0,
        mr1: mr1,
        mr2: mr2,
        mr3: mr3,
        mr4: mr4,
        mr5: mr5,
        mr6: mr6,
        mr7: mr7,
        mr8: mr8,
        mr9: mr9,
        mr10: mr10,
        mr11: mr11,
        mr12: mr12,
        mr13: mr13,
        mr14: mr14,
        mr15: mr15,
        mr16: mr16,
        mr17: mr17,
        mr18: mr18,
        mr19: mr19,
        mr20: mr20,
        mr21: mr21,
        mr22: mr22,
      )
    end
  end # struct

  # Rising Trigger selection register          (EXTI_RTSR)
  struct RTSR
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

    # Rising trigger event configuration of              line 0
    def tr0 : Bool
      @value.bits_set?(0x1_u32)
    end

    # Rising trigger event configuration of              line 0
    def self.tr0 : Bool
      value.tr0
    end

    # Rising trigger event configuration of              line 0
    def self.tr0=(value : Bool) : Bool
      self.set(tr0: value)
      value
    end

    # Rising trigger event configuration of              line 1
    def tr1 : Bool
      @value.bits_set?(0x2_u32)
    end

    # Rising trigger event configuration of              line 1
    def self.tr1 : Bool
      value.tr1
    end

    # Rising trigger event configuration of              line 1
    def self.tr1=(value : Bool) : Bool
      self.set(tr1: value)
      value
    end

    # Rising trigger event configuration of              line 2
    def tr2 : Bool
      @value.bits_set?(0x4_u32)
    end

    # Rising trigger event configuration of              line 2
    def self.tr2 : Bool
      value.tr2
    end

    # Rising trigger event configuration of              line 2
    def self.tr2=(value : Bool) : Bool
      self.set(tr2: value)
      value
    end

    # Rising trigger event configuration of              line 3
    def tr3 : Bool
      @value.bits_set?(0x8_u32)
    end

    # Rising trigger event configuration of              line 3
    def self.tr3 : Bool
      value.tr3
    end

    # Rising trigger event configuration of              line 3
    def self.tr3=(value : Bool) : Bool
      self.set(tr3: value)
      value
    end

    # Rising trigger event configuration of              line 4
    def tr4 : Bool
      @value.bits_set?(0x10_u32)
    end

    # Rising trigger event configuration of              line 4
    def self.tr4 : Bool
      value.tr4
    end

    # Rising trigger event configuration of              line 4
    def self.tr4=(value : Bool) : Bool
      self.set(tr4: value)
      value
    end

    # Rising trigger event configuration of              line 5
    def tr5 : Bool
      @value.bits_set?(0x20_u32)
    end

    # Rising trigger event configuration of              line 5
    def self.tr5 : Bool
      value.tr5
    end

    # Rising trigger event configuration of              line 5
    def self.tr5=(value : Bool) : Bool
      self.set(tr5: value)
      value
    end

    # Rising trigger event configuration of              line 6
    def tr6 : Bool
      @value.bits_set?(0x40_u32)
    end

    # Rising trigger event configuration of              line 6
    def self.tr6 : Bool
      value.tr6
    end

    # Rising trigger event configuration of              line 6
    def self.tr6=(value : Bool) : Bool
      self.set(tr6: value)
      value
    end

    # Rising trigger event configuration of              line 7
    def tr7 : Bool
      @value.bits_set?(0x80_u32)
    end

    # Rising trigger event configuration of              line 7
    def self.tr7 : Bool
      value.tr7
    end

    # Rising trigger event configuration of              line 7
    def self.tr7=(value : Bool) : Bool
      self.set(tr7: value)
      value
    end

    # Rising trigger event configuration of              line 8
    def tr8 : Bool
      @value.bits_set?(0x100_u32)
    end

    # Rising trigger event configuration of              line 8
    def self.tr8 : Bool
      value.tr8
    end

    # Rising trigger event configuration of              line 8
    def self.tr8=(value : Bool) : Bool
      self.set(tr8: value)
      value
    end

    # Rising trigger event configuration of              line 9
    def tr9 : Bool
      @value.bits_set?(0x200_u32)
    end

    # Rising trigger event configuration of              line 9
    def self.tr9 : Bool
      value.tr9
    end

    # Rising trigger event configuration of              line 9
    def self.tr9=(value : Bool) : Bool
      self.set(tr9: value)
      value
    end

    # Rising trigger event configuration of              line 10
    def tr10 : Bool
      @value.bits_set?(0x400_u32)
    end

    # Rising trigger event configuration of              line 10
    def self.tr10 : Bool
      value.tr10
    end

    # Rising trigger event configuration of              line 10
    def self.tr10=(value : Bool) : Bool
      self.set(tr10: value)
      value
    end

    # Rising trigger event configuration of              line 11
    def tr11 : Bool
      @value.bits_set?(0x800_u32)
    end

    # Rising trigger event configuration of              line 11
    def self.tr11 : Bool
      value.tr11
    end

    # Rising trigger event configuration of              line 11
    def self.tr11=(value : Bool) : Bool
      self.set(tr11: value)
      value
    end

    # Rising trigger event configuration of              line 12
    def tr12 : Bool
      @value.bits_set?(0x1000_u32)
    end

    # Rising trigger event configuration of              line 12
    def self.tr12 : Bool
      value.tr12
    end

    # Rising trigger event configuration of              line 12
    def self.tr12=(value : Bool) : Bool
      self.set(tr12: value)
      value
    end

    # Rising trigger event configuration of              line 13
    def tr13 : Bool
      @value.bits_set?(0x2000_u32)
    end

    # Rising trigger event configuration of              line 13
    def self.tr13 : Bool
      value.tr13
    end

    # Rising trigger event configuration of              line 13
    def self.tr13=(value : Bool) : Bool
      self.set(tr13: value)
      value
    end

    # Rising trigger event configuration of              line 14
    def tr14 : Bool
      @value.bits_set?(0x4000_u32)
    end

    # Rising trigger event configuration of              line 14
    def self.tr14 : Bool
      value.tr14
    end

    # Rising trigger event configuration of              line 14
    def self.tr14=(value : Bool) : Bool
      self.set(tr14: value)
      value
    end

    # Rising trigger event configuration of              line 15
    def tr15 : Bool
      @value.bits_set?(0x8000_u32)
    end

    # Rising trigger event configuration of              line 15
    def self.tr15 : Bool
      value.tr15
    end

    # Rising trigger event configuration of              line 15
    def self.tr15=(value : Bool) : Bool
      self.set(tr15: value)
      value
    end

    # Rising trigger event configuration of              line 16
    def tr16 : Bool
      @value.bits_set?(0x10000_u32)
    end

    # Rising trigger event configuration of              line 16
    def self.tr16 : Bool
      value.tr16
    end

    # Rising trigger event configuration of              line 16
    def self.tr16=(value : Bool) : Bool
      self.set(tr16: value)
      value
    end

    # Rising trigger event configuration of              line 17
    def tr17 : Bool
      @value.bits_set?(0x20000_u32)
    end

    # Rising trigger event configuration of              line 17
    def self.tr17 : Bool
      value.tr17
    end

    # Rising trigger event configuration of              line 17
    def self.tr17=(value : Bool) : Bool
      self.set(tr17: value)
      value
    end

    # Rising trigger event configuration of              line 18
    def tr18 : Bool
      @value.bits_set?(0x40000_u32)
    end

    # Rising trigger event configuration of              line 18
    def self.tr18 : Bool
      value.tr18
    end

    # Rising trigger event configuration of              line 18
    def self.tr18=(value : Bool) : Bool
      self.set(tr18: value)
      value
    end

    # Rising trigger event configuration of              line 19
    def tr19 : Bool
      @value.bits_set?(0x80000_u32)
    end

    # Rising trigger event configuration of              line 19
    def self.tr19 : Bool
      value.tr19
    end

    # Rising trigger event configuration of              line 19
    def self.tr19=(value : Bool) : Bool
      self.set(tr19: value)
      value
    end

    # Rising trigger event configuration of              line 20
    def tr20 : Bool
      @value.bits_set?(0x100000_u32)
    end

    # Rising trigger event configuration of              line 20
    def self.tr20 : Bool
      value.tr20
    end

    # Rising trigger event configuration of              line 20
    def self.tr20=(value : Bool) : Bool
      self.set(tr20: value)
      value
    end

    # Rising trigger event configuration of              line 21
    def tr21 : Bool
      @value.bits_set?(0x200000_u32)
    end

    # Rising trigger event configuration of              line 21
    def self.tr21 : Bool
      value.tr21
    end

    # Rising trigger event configuration of              line 21
    def self.tr21=(value : Bool) : Bool
      self.set(tr21: value)
      value
    end

    # Rising trigger event configuration of              line 22
    def tr22 : Bool
      @value.bits_set?(0x400000_u32)
    end

    # Rising trigger event configuration of              line 22
    def self.tr22 : Bool
      value.tr22
    end

    # Rising trigger event configuration of              line 22
    def self.tr22=(value : Bool) : Bool
      self.set(tr22: value)
      value
    end

    def copy_with(
      *,

      tr0 : Bool? = nil,

      tr1 : Bool? = nil,

      tr2 : Bool? = nil,

      tr3 : Bool? = nil,

      tr4 : Bool? = nil,

      tr5 : Bool? = nil,

      tr6 : Bool? = nil,

      tr7 : Bool? = nil,

      tr8 : Bool? = nil,

      tr9 : Bool? = nil,

      tr10 : Bool? = nil,

      tr11 : Bool? = nil,

      tr12 : Bool? = nil,

      tr13 : Bool? = nil,

      tr14 : Bool? = nil,

      tr15 : Bool? = nil,

      tr16 : Bool? = nil,

      tr17 : Bool? = nil,

      tr18 : Bool? = nil,

      tr19 : Bool? = nil,

      tr20 : Bool? = nil,

      tr21 : Bool? = nil,

      tr22 : Bool? = nil
    ) : self
      value = @value

      unless tr0.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(tr0.to_int).&(0x1_u32) << 0
      end

      unless tr1.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(tr1.to_int).&(0x1_u32) << 1
      end

      unless tr2.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(tr2.to_int).&(0x1_u32) << 2
      end

      unless tr3.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(tr3.to_int).&(0x1_u32) << 3
      end

      unless tr4.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(tr4.to_int).&(0x1_u32) << 4
      end

      unless tr5.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(tr5.to_int).&(0x1_u32) << 5
      end

      unless tr6.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(tr6.to_int).&(0x1_u32) << 6
      end

      unless tr7.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(tr7.to_int).&(0x1_u32) << 7
      end

      unless tr8.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(tr8.to_int).&(0x1_u32) << 8
      end

      unless tr9.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(tr9.to_int).&(0x1_u32) << 9
      end

      unless tr10.nil?
        value = (value & 0xfffffbff_u32) |
                UInt32.new!(tr10.to_int).&(0x1_u32) << 10
      end

      unless tr11.nil?
        value = (value & 0xfffff7ff_u32) |
                UInt32.new!(tr11.to_int).&(0x1_u32) << 11
      end

      unless tr12.nil?
        value = (value & 0xffffefff_u32) |
                UInt32.new!(tr12.to_int).&(0x1_u32) << 12
      end

      unless tr13.nil?
        value = (value & 0xffffdfff_u32) |
                UInt32.new!(tr13.to_int).&(0x1_u32) << 13
      end

      unless tr14.nil?
        value = (value & 0xffffbfff_u32) |
                UInt32.new!(tr14.to_int).&(0x1_u32) << 14
      end

      unless tr15.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(tr15.to_int).&(0x1_u32) << 15
      end

      unless tr16.nil?
        value = (value & 0xfffeffff_u32) |
                UInt32.new!(tr16.to_int).&(0x1_u32) << 16
      end

      unless tr17.nil?
        value = (value & 0xfffdffff_u32) |
                UInt32.new!(tr17.to_int).&(0x1_u32) << 17
      end

      unless tr18.nil?
        value = (value & 0xfffbffff_u32) |
                UInt32.new!(tr18.to_int).&(0x1_u32) << 18
      end

      unless tr19.nil?
        value = (value & 0xfff7ffff_u32) |
                UInt32.new!(tr19.to_int).&(0x1_u32) << 19
      end

      unless tr20.nil?
        value = (value & 0xffefffff_u32) |
                UInt32.new!(tr20.to_int).&(0x1_u32) << 20
      end

      unless tr21.nil?
        value = (value & 0xffdfffff_u32) |
                UInt32.new!(tr21.to_int).&(0x1_u32) << 21
      end

      unless tr22.nil?
        value = (value & 0xffbfffff_u32) |
                UInt32.new!(tr22.to_int).&(0x1_u32) << 22
      end

      self.class.new(value)
    end

    def self.set(
      *,
      tr0 : Bool? = nil,
      tr1 : Bool? = nil,
      tr2 : Bool? = nil,
      tr3 : Bool? = nil,
      tr4 : Bool? = nil,
      tr5 : Bool? = nil,
      tr6 : Bool? = nil,
      tr7 : Bool? = nil,
      tr8 : Bool? = nil,
      tr9 : Bool? = nil,
      tr10 : Bool? = nil,
      tr11 : Bool? = nil,
      tr12 : Bool? = nil,
      tr13 : Bool? = nil,
      tr14 : Bool? = nil,
      tr15 : Bool? = nil,
      tr16 : Bool? = nil,
      tr17 : Bool? = nil,
      tr18 : Bool? = nil,
      tr19 : Bool? = nil,
      tr20 : Bool? = nil,
      tr21 : Bool? = nil,
      tr22 : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        tr0: tr0,
        tr1: tr1,
        tr2: tr2,
        tr3: tr3,
        tr4: tr4,
        tr5: tr5,
        tr6: tr6,
        tr7: tr7,
        tr8: tr8,
        tr9: tr9,
        tr10: tr10,
        tr11: tr11,
        tr12: tr12,
        tr13: tr13,
        tr14: tr14,
        tr15: tr15,
        tr16: tr16,
        tr17: tr17,
        tr18: tr18,
        tr19: tr19,
        tr20: tr20,
        tr21: tr21,
        tr22: tr22,
      )
    end
  end # struct

  # Falling Trigger selection register          (EXTI_FTSR)
  struct FTSR
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

    # Falling trigger event configuration of              line 0
    def tr0 : Bool
      @value.bits_set?(0x1_u32)
    end

    # Falling trigger event configuration of              line 0
    def self.tr0 : Bool
      value.tr0
    end

    # Falling trigger event configuration of              line 0
    def self.tr0=(value : Bool) : Bool
      self.set(tr0: value)
      value
    end

    # Falling trigger event configuration of              line 1
    def tr1 : Bool
      @value.bits_set?(0x2_u32)
    end

    # Falling trigger event configuration of              line 1
    def self.tr1 : Bool
      value.tr1
    end

    # Falling trigger event configuration of              line 1
    def self.tr1=(value : Bool) : Bool
      self.set(tr1: value)
      value
    end

    # Falling trigger event configuration of              line 2
    def tr2 : Bool
      @value.bits_set?(0x4_u32)
    end

    # Falling trigger event configuration of              line 2
    def self.tr2 : Bool
      value.tr2
    end

    # Falling trigger event configuration of              line 2
    def self.tr2=(value : Bool) : Bool
      self.set(tr2: value)
      value
    end

    # Falling trigger event configuration of              line 3
    def tr3 : Bool
      @value.bits_set?(0x8_u32)
    end

    # Falling trigger event configuration of              line 3
    def self.tr3 : Bool
      value.tr3
    end

    # Falling trigger event configuration of              line 3
    def self.tr3=(value : Bool) : Bool
      self.set(tr3: value)
      value
    end

    # Falling trigger event configuration of              line 4
    def tr4 : Bool
      @value.bits_set?(0x10_u32)
    end

    # Falling trigger event configuration of              line 4
    def self.tr4 : Bool
      value.tr4
    end

    # Falling trigger event configuration of              line 4
    def self.tr4=(value : Bool) : Bool
      self.set(tr4: value)
      value
    end

    # Falling trigger event configuration of              line 5
    def tr5 : Bool
      @value.bits_set?(0x20_u32)
    end

    # Falling trigger event configuration of              line 5
    def self.tr5 : Bool
      value.tr5
    end

    # Falling trigger event configuration of              line 5
    def self.tr5=(value : Bool) : Bool
      self.set(tr5: value)
      value
    end

    # Falling trigger event configuration of              line 6
    def tr6 : Bool
      @value.bits_set?(0x40_u32)
    end

    # Falling trigger event configuration of              line 6
    def self.tr6 : Bool
      value.tr6
    end

    # Falling trigger event configuration of              line 6
    def self.tr6=(value : Bool) : Bool
      self.set(tr6: value)
      value
    end

    # Falling trigger event configuration of              line 7
    def tr7 : Bool
      @value.bits_set?(0x80_u32)
    end

    # Falling trigger event configuration of              line 7
    def self.tr7 : Bool
      value.tr7
    end

    # Falling trigger event configuration of              line 7
    def self.tr7=(value : Bool) : Bool
      self.set(tr7: value)
      value
    end

    # Falling trigger event configuration of              line 8
    def tr8 : Bool
      @value.bits_set?(0x100_u32)
    end

    # Falling trigger event configuration of              line 8
    def self.tr8 : Bool
      value.tr8
    end

    # Falling trigger event configuration of              line 8
    def self.tr8=(value : Bool) : Bool
      self.set(tr8: value)
      value
    end

    # Falling trigger event configuration of              line 9
    def tr9 : Bool
      @value.bits_set?(0x200_u32)
    end

    # Falling trigger event configuration of              line 9
    def self.tr9 : Bool
      value.tr9
    end

    # Falling trigger event configuration of              line 9
    def self.tr9=(value : Bool) : Bool
      self.set(tr9: value)
      value
    end

    # Falling trigger event configuration of              line 10
    def tr10 : Bool
      @value.bits_set?(0x400_u32)
    end

    # Falling trigger event configuration of              line 10
    def self.tr10 : Bool
      value.tr10
    end

    # Falling trigger event configuration of              line 10
    def self.tr10=(value : Bool) : Bool
      self.set(tr10: value)
      value
    end

    # Falling trigger event configuration of              line 11
    def tr11 : Bool
      @value.bits_set?(0x800_u32)
    end

    # Falling trigger event configuration of              line 11
    def self.tr11 : Bool
      value.tr11
    end

    # Falling trigger event configuration of              line 11
    def self.tr11=(value : Bool) : Bool
      self.set(tr11: value)
      value
    end

    # Falling trigger event configuration of              line 12
    def tr12 : Bool
      @value.bits_set?(0x1000_u32)
    end

    # Falling trigger event configuration of              line 12
    def self.tr12 : Bool
      value.tr12
    end

    # Falling trigger event configuration of              line 12
    def self.tr12=(value : Bool) : Bool
      self.set(tr12: value)
      value
    end

    # Falling trigger event configuration of              line 13
    def tr13 : Bool
      @value.bits_set?(0x2000_u32)
    end

    # Falling trigger event configuration of              line 13
    def self.tr13 : Bool
      value.tr13
    end

    # Falling trigger event configuration of              line 13
    def self.tr13=(value : Bool) : Bool
      self.set(tr13: value)
      value
    end

    # Falling trigger event configuration of              line 14
    def tr14 : Bool
      @value.bits_set?(0x4000_u32)
    end

    # Falling trigger event configuration of              line 14
    def self.tr14 : Bool
      value.tr14
    end

    # Falling trigger event configuration of              line 14
    def self.tr14=(value : Bool) : Bool
      self.set(tr14: value)
      value
    end

    # Falling trigger event configuration of              line 15
    def tr15 : Bool
      @value.bits_set?(0x8000_u32)
    end

    # Falling trigger event configuration of              line 15
    def self.tr15 : Bool
      value.tr15
    end

    # Falling trigger event configuration of              line 15
    def self.tr15=(value : Bool) : Bool
      self.set(tr15: value)
      value
    end

    # Falling trigger event configuration of              line 16
    def tr16 : Bool
      @value.bits_set?(0x10000_u32)
    end

    # Falling trigger event configuration of              line 16
    def self.tr16 : Bool
      value.tr16
    end

    # Falling trigger event configuration of              line 16
    def self.tr16=(value : Bool) : Bool
      self.set(tr16: value)
      value
    end

    # Falling trigger event configuration of              line 17
    def tr17 : Bool
      @value.bits_set?(0x20000_u32)
    end

    # Falling trigger event configuration of              line 17
    def self.tr17 : Bool
      value.tr17
    end

    # Falling trigger event configuration of              line 17
    def self.tr17=(value : Bool) : Bool
      self.set(tr17: value)
      value
    end

    # Falling trigger event configuration of              line 18
    def tr18 : Bool
      @value.bits_set?(0x40000_u32)
    end

    # Falling trigger event configuration of              line 18
    def self.tr18 : Bool
      value.tr18
    end

    # Falling trigger event configuration of              line 18
    def self.tr18=(value : Bool) : Bool
      self.set(tr18: value)
      value
    end

    # Falling trigger event configuration of              line 19
    def tr19 : Bool
      @value.bits_set?(0x80000_u32)
    end

    # Falling trigger event configuration of              line 19
    def self.tr19 : Bool
      value.tr19
    end

    # Falling trigger event configuration of              line 19
    def self.tr19=(value : Bool) : Bool
      self.set(tr19: value)
      value
    end

    # Falling trigger event configuration of              line 20
    def tr20 : Bool
      @value.bits_set?(0x100000_u32)
    end

    # Falling trigger event configuration of              line 20
    def self.tr20 : Bool
      value.tr20
    end

    # Falling trigger event configuration of              line 20
    def self.tr20=(value : Bool) : Bool
      self.set(tr20: value)
      value
    end

    # Falling trigger event configuration of              line 21
    def tr21 : Bool
      @value.bits_set?(0x200000_u32)
    end

    # Falling trigger event configuration of              line 21
    def self.tr21 : Bool
      value.tr21
    end

    # Falling trigger event configuration of              line 21
    def self.tr21=(value : Bool) : Bool
      self.set(tr21: value)
      value
    end

    # Falling trigger event configuration of              line 22
    def tr22 : Bool
      @value.bits_set?(0x400000_u32)
    end

    # Falling trigger event configuration of              line 22
    def self.tr22 : Bool
      value.tr22
    end

    # Falling trigger event configuration of              line 22
    def self.tr22=(value : Bool) : Bool
      self.set(tr22: value)
      value
    end

    def copy_with(
      *,

      tr0 : Bool? = nil,

      tr1 : Bool? = nil,

      tr2 : Bool? = nil,

      tr3 : Bool? = nil,

      tr4 : Bool? = nil,

      tr5 : Bool? = nil,

      tr6 : Bool? = nil,

      tr7 : Bool? = nil,

      tr8 : Bool? = nil,

      tr9 : Bool? = nil,

      tr10 : Bool? = nil,

      tr11 : Bool? = nil,

      tr12 : Bool? = nil,

      tr13 : Bool? = nil,

      tr14 : Bool? = nil,

      tr15 : Bool? = nil,

      tr16 : Bool? = nil,

      tr17 : Bool? = nil,

      tr18 : Bool? = nil,

      tr19 : Bool? = nil,

      tr20 : Bool? = nil,

      tr21 : Bool? = nil,

      tr22 : Bool? = nil
    ) : self
      value = @value

      unless tr0.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(tr0.to_int).&(0x1_u32) << 0
      end

      unless tr1.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(tr1.to_int).&(0x1_u32) << 1
      end

      unless tr2.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(tr2.to_int).&(0x1_u32) << 2
      end

      unless tr3.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(tr3.to_int).&(0x1_u32) << 3
      end

      unless tr4.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(tr4.to_int).&(0x1_u32) << 4
      end

      unless tr5.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(tr5.to_int).&(0x1_u32) << 5
      end

      unless tr6.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(tr6.to_int).&(0x1_u32) << 6
      end

      unless tr7.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(tr7.to_int).&(0x1_u32) << 7
      end

      unless tr8.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(tr8.to_int).&(0x1_u32) << 8
      end

      unless tr9.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(tr9.to_int).&(0x1_u32) << 9
      end

      unless tr10.nil?
        value = (value & 0xfffffbff_u32) |
                UInt32.new!(tr10.to_int).&(0x1_u32) << 10
      end

      unless tr11.nil?
        value = (value & 0xfffff7ff_u32) |
                UInt32.new!(tr11.to_int).&(0x1_u32) << 11
      end

      unless tr12.nil?
        value = (value & 0xffffefff_u32) |
                UInt32.new!(tr12.to_int).&(0x1_u32) << 12
      end

      unless tr13.nil?
        value = (value & 0xffffdfff_u32) |
                UInt32.new!(tr13.to_int).&(0x1_u32) << 13
      end

      unless tr14.nil?
        value = (value & 0xffffbfff_u32) |
                UInt32.new!(tr14.to_int).&(0x1_u32) << 14
      end

      unless tr15.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(tr15.to_int).&(0x1_u32) << 15
      end

      unless tr16.nil?
        value = (value & 0xfffeffff_u32) |
                UInt32.new!(tr16.to_int).&(0x1_u32) << 16
      end

      unless tr17.nil?
        value = (value & 0xfffdffff_u32) |
                UInt32.new!(tr17.to_int).&(0x1_u32) << 17
      end

      unless tr18.nil?
        value = (value & 0xfffbffff_u32) |
                UInt32.new!(tr18.to_int).&(0x1_u32) << 18
      end

      unless tr19.nil?
        value = (value & 0xfff7ffff_u32) |
                UInt32.new!(tr19.to_int).&(0x1_u32) << 19
      end

      unless tr20.nil?
        value = (value & 0xffefffff_u32) |
                UInt32.new!(tr20.to_int).&(0x1_u32) << 20
      end

      unless tr21.nil?
        value = (value & 0xffdfffff_u32) |
                UInt32.new!(tr21.to_int).&(0x1_u32) << 21
      end

      unless tr22.nil?
        value = (value & 0xffbfffff_u32) |
                UInt32.new!(tr22.to_int).&(0x1_u32) << 22
      end

      self.class.new(value)
    end

    def self.set(
      *,
      tr0 : Bool? = nil,
      tr1 : Bool? = nil,
      tr2 : Bool? = nil,
      tr3 : Bool? = nil,
      tr4 : Bool? = nil,
      tr5 : Bool? = nil,
      tr6 : Bool? = nil,
      tr7 : Bool? = nil,
      tr8 : Bool? = nil,
      tr9 : Bool? = nil,
      tr10 : Bool? = nil,
      tr11 : Bool? = nil,
      tr12 : Bool? = nil,
      tr13 : Bool? = nil,
      tr14 : Bool? = nil,
      tr15 : Bool? = nil,
      tr16 : Bool? = nil,
      tr17 : Bool? = nil,
      tr18 : Bool? = nil,
      tr19 : Bool? = nil,
      tr20 : Bool? = nil,
      tr21 : Bool? = nil,
      tr22 : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        tr0: tr0,
        tr1: tr1,
        tr2: tr2,
        tr3: tr3,
        tr4: tr4,
        tr5: tr5,
        tr6: tr6,
        tr7: tr7,
        tr8: tr8,
        tr9: tr9,
        tr10: tr10,
        tr11: tr11,
        tr12: tr12,
        tr13: tr13,
        tr14: tr14,
        tr15: tr15,
        tr16: tr16,
        tr17: tr17,
        tr18: tr18,
        tr19: tr19,
        tr20: tr20,
        tr21: tr21,
        tr22: tr22,
      )
    end
  end # struct

  # Software interrupt event register          (EXTI_SWIER)
  struct SWIER
    ADDRESS = BASE_ADDRESS + 0x10_u64

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

    # Software Interrupt on line              0
    def _0 : Bool
      @value.bits_set?(0x1_u32)
    end

    # Software Interrupt on line              0
    def self._0 : Bool
      value._0
    end

    # Software Interrupt on line              0
    def self._0=(value : Bool) : Bool
      self.set(_0: value)
      value
    end

    # Software Interrupt on line              1
    def _1 : Bool
      @value.bits_set?(0x2_u32)
    end

    # Software Interrupt on line              1
    def self._1 : Bool
      value._1
    end

    # Software Interrupt on line              1
    def self._1=(value : Bool) : Bool
      self.set(_1: value)
      value
    end

    # Software Interrupt on line              2
    def _2 : Bool
      @value.bits_set?(0x4_u32)
    end

    # Software Interrupt on line              2
    def self._2 : Bool
      value._2
    end

    # Software Interrupt on line              2
    def self._2=(value : Bool) : Bool
      self.set(_2: value)
      value
    end

    # Software Interrupt on line              3
    def _3 : Bool
      @value.bits_set?(0x8_u32)
    end

    # Software Interrupt on line              3
    def self._3 : Bool
      value._3
    end

    # Software Interrupt on line              3
    def self._3=(value : Bool) : Bool
      self.set(_3: value)
      value
    end

    # Software Interrupt on line              4
    def _4 : Bool
      @value.bits_set?(0x10_u32)
    end

    # Software Interrupt on line              4
    def self._4 : Bool
      value._4
    end

    # Software Interrupt on line              4
    def self._4=(value : Bool) : Bool
      self.set(_4: value)
      value
    end

    # Software Interrupt on line              5
    def _5 : Bool
      @value.bits_set?(0x20_u32)
    end

    # Software Interrupt on line              5
    def self._5 : Bool
      value._5
    end

    # Software Interrupt on line              5
    def self._5=(value : Bool) : Bool
      self.set(_5: value)
      value
    end

    # Software Interrupt on line              6
    def _6 : Bool
      @value.bits_set?(0x40_u32)
    end

    # Software Interrupt on line              6
    def self._6 : Bool
      value._6
    end

    # Software Interrupt on line              6
    def self._6=(value : Bool) : Bool
      self.set(_6: value)
      value
    end

    # Software Interrupt on line              7
    def _7 : Bool
      @value.bits_set?(0x80_u32)
    end

    # Software Interrupt on line              7
    def self._7 : Bool
      value._7
    end

    # Software Interrupt on line              7
    def self._7=(value : Bool) : Bool
      self.set(_7: value)
      value
    end

    # Software Interrupt on line              8
    def _8 : Bool
      @value.bits_set?(0x100_u32)
    end

    # Software Interrupt on line              8
    def self._8 : Bool
      value._8
    end

    # Software Interrupt on line              8
    def self._8=(value : Bool) : Bool
      self.set(_8: value)
      value
    end

    # Software Interrupt on line              9
    def _9 : Bool
      @value.bits_set?(0x200_u32)
    end

    # Software Interrupt on line              9
    def self._9 : Bool
      value._9
    end

    # Software Interrupt on line              9
    def self._9=(value : Bool) : Bool
      self.set(_9: value)
      value
    end

    # Software Interrupt on line              10
    def _10 : Bool
      @value.bits_set?(0x400_u32)
    end

    # Software Interrupt on line              10
    def self._10 : Bool
      value._10
    end

    # Software Interrupt on line              10
    def self._10=(value : Bool) : Bool
      self.set(_10: value)
      value
    end

    # Software Interrupt on line              11
    def _11 : Bool
      @value.bits_set?(0x800_u32)
    end

    # Software Interrupt on line              11
    def self._11 : Bool
      value._11
    end

    # Software Interrupt on line              11
    def self._11=(value : Bool) : Bool
      self.set(_11: value)
      value
    end

    # Software Interrupt on line              12
    def _12 : Bool
      @value.bits_set?(0x1000_u32)
    end

    # Software Interrupt on line              12
    def self._12 : Bool
      value._12
    end

    # Software Interrupt on line              12
    def self._12=(value : Bool) : Bool
      self.set(_12: value)
      value
    end

    # Software Interrupt on line              13
    def _13 : Bool
      @value.bits_set?(0x2000_u32)
    end

    # Software Interrupt on line              13
    def self._13 : Bool
      value._13
    end

    # Software Interrupt on line              13
    def self._13=(value : Bool) : Bool
      self.set(_13: value)
      value
    end

    # Software Interrupt on line              14
    def _14 : Bool
      @value.bits_set?(0x4000_u32)
    end

    # Software Interrupt on line              14
    def self._14 : Bool
      value._14
    end

    # Software Interrupt on line              14
    def self._14=(value : Bool) : Bool
      self.set(_14: value)
      value
    end

    # Software Interrupt on line              15
    def _15 : Bool
      @value.bits_set?(0x8000_u32)
    end

    # Software Interrupt on line              15
    def self._15 : Bool
      value._15
    end

    # Software Interrupt on line              15
    def self._15=(value : Bool) : Bool
      self.set(_15: value)
      value
    end

    # Software Interrupt on line              16
    def _16 : Bool
      @value.bits_set?(0x10000_u32)
    end

    # Software Interrupt on line              16
    def self._16 : Bool
      value._16
    end

    # Software Interrupt on line              16
    def self._16=(value : Bool) : Bool
      self.set(_16: value)
      value
    end

    # Software Interrupt on line              17
    def _17 : Bool
      @value.bits_set?(0x20000_u32)
    end

    # Software Interrupt on line              17
    def self._17 : Bool
      value._17
    end

    # Software Interrupt on line              17
    def self._17=(value : Bool) : Bool
      self.set(_17: value)
      value
    end

    # Software Interrupt on line              18
    def _18 : Bool
      @value.bits_set?(0x40000_u32)
    end

    # Software Interrupt on line              18
    def self._18 : Bool
      value._18
    end

    # Software Interrupt on line              18
    def self._18=(value : Bool) : Bool
      self.set(_18: value)
      value
    end

    # Software Interrupt on line              19
    def _19 : Bool
      @value.bits_set?(0x80000_u32)
    end

    # Software Interrupt on line              19
    def self._19 : Bool
      value._19
    end

    # Software Interrupt on line              19
    def self._19=(value : Bool) : Bool
      self.set(_19: value)
      value
    end

    # Software Interrupt on line              20
    def _20 : Bool
      @value.bits_set?(0x100000_u32)
    end

    # Software Interrupt on line              20
    def self._20 : Bool
      value._20
    end

    # Software Interrupt on line              20
    def self._20=(value : Bool) : Bool
      self.set(_20: value)
      value
    end

    # Software Interrupt on line              21
    def _21 : Bool
      @value.bits_set?(0x200000_u32)
    end

    # Software Interrupt on line              21
    def self._21 : Bool
      value._21
    end

    # Software Interrupt on line              21
    def self._21=(value : Bool) : Bool
      self.set(_21: value)
      value
    end

    # Software Interrupt on line              22
    def _22 : Bool
      @value.bits_set?(0x400000_u32)
    end

    # Software Interrupt on line              22
    def self._22 : Bool
      value._22
    end

    # Software Interrupt on line              22
    def self._22=(value : Bool) : Bool
      self.set(_22: value)
      value
    end

    def copy_with(
      *,

      _0 : Bool? = nil,

      _1 : Bool? = nil,

      _2 : Bool? = nil,

      _3 : Bool? = nil,

      _4 : Bool? = nil,

      _5 : Bool? = nil,

      _6 : Bool? = nil,

      _7 : Bool? = nil,

      _8 : Bool? = nil,

      _9 : Bool? = nil,

      _10 : Bool? = nil,

      _11 : Bool? = nil,

      _12 : Bool? = nil,

      _13 : Bool? = nil,

      _14 : Bool? = nil,

      _15 : Bool? = nil,

      _16 : Bool? = nil,

      _17 : Bool? = nil,

      _18 : Bool? = nil,

      _19 : Bool? = nil,

      _20 : Bool? = nil,

      _21 : Bool? = nil,

      _22 : Bool? = nil
    ) : self
      value = @value

      unless _0.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(_0.to_int).&(0x1_u32) << 0
      end

      unless _1.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(_1.to_int).&(0x1_u32) << 1
      end

      unless _2.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(_2.to_int).&(0x1_u32) << 2
      end

      unless _3.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(_3.to_int).&(0x1_u32) << 3
      end

      unless _4.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(_4.to_int).&(0x1_u32) << 4
      end

      unless _5.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(_5.to_int).&(0x1_u32) << 5
      end

      unless _6.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(_6.to_int).&(0x1_u32) << 6
      end

      unless _7.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(_7.to_int).&(0x1_u32) << 7
      end

      unless _8.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(_8.to_int).&(0x1_u32) << 8
      end

      unless _9.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(_9.to_int).&(0x1_u32) << 9
      end

      unless _10.nil?
        value = (value & 0xfffffbff_u32) |
                UInt32.new!(_10.to_int).&(0x1_u32) << 10
      end

      unless _11.nil?
        value = (value & 0xfffff7ff_u32) |
                UInt32.new!(_11.to_int).&(0x1_u32) << 11
      end

      unless _12.nil?
        value = (value & 0xffffefff_u32) |
                UInt32.new!(_12.to_int).&(0x1_u32) << 12
      end

      unless _13.nil?
        value = (value & 0xffffdfff_u32) |
                UInt32.new!(_13.to_int).&(0x1_u32) << 13
      end

      unless _14.nil?
        value = (value & 0xffffbfff_u32) |
                UInt32.new!(_14.to_int).&(0x1_u32) << 14
      end

      unless _15.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(_15.to_int).&(0x1_u32) << 15
      end

      unless _16.nil?
        value = (value & 0xfffeffff_u32) |
                UInt32.new!(_16.to_int).&(0x1_u32) << 16
      end

      unless _17.nil?
        value = (value & 0xfffdffff_u32) |
                UInt32.new!(_17.to_int).&(0x1_u32) << 17
      end

      unless _18.nil?
        value = (value & 0xfffbffff_u32) |
                UInt32.new!(_18.to_int).&(0x1_u32) << 18
      end

      unless _19.nil?
        value = (value & 0xfff7ffff_u32) |
                UInt32.new!(_19.to_int).&(0x1_u32) << 19
      end

      unless _20.nil?
        value = (value & 0xffefffff_u32) |
                UInt32.new!(_20.to_int).&(0x1_u32) << 20
      end

      unless _21.nil?
        value = (value & 0xffdfffff_u32) |
                UInt32.new!(_21.to_int).&(0x1_u32) << 21
      end

      unless _22.nil?
        value = (value & 0xffbfffff_u32) |
                UInt32.new!(_22.to_int).&(0x1_u32) << 22
      end

      self.class.new(value)
    end

    def self.set(
      *,
      _0 : Bool? = nil,
      _1 : Bool? = nil,
      _2 : Bool? = nil,
      _3 : Bool? = nil,
      _4 : Bool? = nil,
      _5 : Bool? = nil,
      _6 : Bool? = nil,
      _7 : Bool? = nil,
      _8 : Bool? = nil,
      _9 : Bool? = nil,
      _10 : Bool? = nil,
      _11 : Bool? = nil,
      _12 : Bool? = nil,
      _13 : Bool? = nil,
      _14 : Bool? = nil,
      _15 : Bool? = nil,
      _16 : Bool? = nil,
      _17 : Bool? = nil,
      _18 : Bool? = nil,
      _19 : Bool? = nil,
      _20 : Bool? = nil,
      _21 : Bool? = nil,
      _22 : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        _0: _0,
        _1: _1,
        _2: _2,
        _3: _3,
        _4: _4,
        _5: _5,
        _6: _6,
        _7: _7,
        _8: _8,
        _9: _9,
        _10: _10,
        _11: _11,
        _12: _12,
        _13: _13,
        _14: _14,
        _15: _15,
        _16: _16,
        _17: _17,
        _18: _18,
        _19: _19,
        _20: _20,
        _21: _21,
        _22: _22,
      )
    end
  end # struct

  # Pending register (EXTI_PR)
  struct PR
    ADDRESS = BASE_ADDRESS + 0x14_u64

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

    # Pending bit 0
    def _0 : Bool
      @value.bits_set?(0x1_u32)
    end

    # Pending bit 0
    def self._0 : Bool
      value._0
    end

    # Pending bit 0
    def self._0=(value : Bool) : Bool
      self.set(_0: value)
      value
    end

    # Pending bit 1
    def _1 : Bool
      @value.bits_set?(0x2_u32)
    end

    # Pending bit 1
    def self._1 : Bool
      value._1
    end

    # Pending bit 1
    def self._1=(value : Bool) : Bool
      self.set(_1: value)
      value
    end

    # Pending bit 2
    def _2 : Bool
      @value.bits_set?(0x4_u32)
    end

    # Pending bit 2
    def self._2 : Bool
      value._2
    end

    # Pending bit 2
    def self._2=(value : Bool) : Bool
      self.set(_2: value)
      value
    end

    # Pending bit 3
    def _3 : Bool
      @value.bits_set?(0x8_u32)
    end

    # Pending bit 3
    def self._3 : Bool
      value._3
    end

    # Pending bit 3
    def self._3=(value : Bool) : Bool
      self.set(_3: value)
      value
    end

    # Pending bit 4
    def _4 : Bool
      @value.bits_set?(0x10_u32)
    end

    # Pending bit 4
    def self._4 : Bool
      value._4
    end

    # Pending bit 4
    def self._4=(value : Bool) : Bool
      self.set(_4: value)
      value
    end

    # Pending bit 5
    def _5 : Bool
      @value.bits_set?(0x20_u32)
    end

    # Pending bit 5
    def self._5 : Bool
      value._5
    end

    # Pending bit 5
    def self._5=(value : Bool) : Bool
      self.set(_5: value)
      value
    end

    # Pending bit 6
    def _6 : Bool
      @value.bits_set?(0x40_u32)
    end

    # Pending bit 6
    def self._6 : Bool
      value._6
    end

    # Pending bit 6
    def self._6=(value : Bool) : Bool
      self.set(_6: value)
      value
    end

    # Pending bit 7
    def _7 : Bool
      @value.bits_set?(0x80_u32)
    end

    # Pending bit 7
    def self._7 : Bool
      value._7
    end

    # Pending bit 7
    def self._7=(value : Bool) : Bool
      self.set(_7: value)
      value
    end

    # Pending bit 8
    def _8 : Bool
      @value.bits_set?(0x100_u32)
    end

    # Pending bit 8
    def self._8 : Bool
      value._8
    end

    # Pending bit 8
    def self._8=(value : Bool) : Bool
      self.set(_8: value)
      value
    end

    # Pending bit 9
    def _9 : Bool
      @value.bits_set?(0x200_u32)
    end

    # Pending bit 9
    def self._9 : Bool
      value._9
    end

    # Pending bit 9
    def self._9=(value : Bool) : Bool
      self.set(_9: value)
      value
    end

    # Pending bit 10
    def _10 : Bool
      @value.bits_set?(0x400_u32)
    end

    # Pending bit 10
    def self._10 : Bool
      value._10
    end

    # Pending bit 10
    def self._10=(value : Bool) : Bool
      self.set(_10: value)
      value
    end

    # Pending bit 11
    def _11 : Bool
      @value.bits_set?(0x800_u32)
    end

    # Pending bit 11
    def self._11 : Bool
      value._11
    end

    # Pending bit 11
    def self._11=(value : Bool) : Bool
      self.set(_11: value)
      value
    end

    # Pending bit 12
    def _12 : Bool
      @value.bits_set?(0x1000_u32)
    end

    # Pending bit 12
    def self._12 : Bool
      value._12
    end

    # Pending bit 12
    def self._12=(value : Bool) : Bool
      self.set(_12: value)
      value
    end

    # Pending bit 13
    def _13 : Bool
      @value.bits_set?(0x2000_u32)
    end

    # Pending bit 13
    def self._13 : Bool
      value._13
    end

    # Pending bit 13
    def self._13=(value : Bool) : Bool
      self.set(_13: value)
      value
    end

    # Pending bit 14
    def _14 : Bool
      @value.bits_set?(0x4000_u32)
    end

    # Pending bit 14
    def self._14 : Bool
      value._14
    end

    # Pending bit 14
    def self._14=(value : Bool) : Bool
      self.set(_14: value)
      value
    end

    # Pending bit 15
    def _15 : Bool
      @value.bits_set?(0x8000_u32)
    end

    # Pending bit 15
    def self._15 : Bool
      value._15
    end

    # Pending bit 15
    def self._15=(value : Bool) : Bool
      self.set(_15: value)
      value
    end

    # Pending bit 16
    def _16 : Bool
      @value.bits_set?(0x10000_u32)
    end

    # Pending bit 16
    def self._16 : Bool
      value._16
    end

    # Pending bit 16
    def self._16=(value : Bool) : Bool
      self.set(_16: value)
      value
    end

    # Pending bit 17
    def _17 : Bool
      @value.bits_set?(0x20000_u32)
    end

    # Pending bit 17
    def self._17 : Bool
      value._17
    end

    # Pending bit 17
    def self._17=(value : Bool) : Bool
      self.set(_17: value)
      value
    end

    # Pending bit 18
    def _18 : Bool
      @value.bits_set?(0x40000_u32)
    end

    # Pending bit 18
    def self._18 : Bool
      value._18
    end

    # Pending bit 18
    def self._18=(value : Bool) : Bool
      self.set(_18: value)
      value
    end

    # Pending bit 19
    def _19 : Bool
      @value.bits_set?(0x80000_u32)
    end

    # Pending bit 19
    def self._19 : Bool
      value._19
    end

    # Pending bit 19
    def self._19=(value : Bool) : Bool
      self.set(_19: value)
      value
    end

    # Pending bit 20
    def _20 : Bool
      @value.bits_set?(0x100000_u32)
    end

    # Pending bit 20
    def self._20 : Bool
      value._20
    end

    # Pending bit 20
    def self._20=(value : Bool) : Bool
      self.set(_20: value)
      value
    end

    # Pending bit 21
    def _21 : Bool
      @value.bits_set?(0x200000_u32)
    end

    # Pending bit 21
    def self._21 : Bool
      value._21
    end

    # Pending bit 21
    def self._21=(value : Bool) : Bool
      self.set(_21: value)
      value
    end

    # Pending bit 22
    def _22 : Bool
      @value.bits_set?(0x400000_u32)
    end

    # Pending bit 22
    def self._22 : Bool
      value._22
    end

    # Pending bit 22
    def self._22=(value : Bool) : Bool
      self.set(_22: value)
      value
    end

    def copy_with(
      *,

      _0 : Bool? = nil,

      _1 : Bool? = nil,

      _2 : Bool? = nil,

      _3 : Bool? = nil,

      _4 : Bool? = nil,

      _5 : Bool? = nil,

      _6 : Bool? = nil,

      _7 : Bool? = nil,

      _8 : Bool? = nil,

      _9 : Bool? = nil,

      _10 : Bool? = nil,

      _11 : Bool? = nil,

      _12 : Bool? = nil,

      _13 : Bool? = nil,

      _14 : Bool? = nil,

      _15 : Bool? = nil,

      _16 : Bool? = nil,

      _17 : Bool? = nil,

      _18 : Bool? = nil,

      _19 : Bool? = nil,

      _20 : Bool? = nil,

      _21 : Bool? = nil,

      _22 : Bool? = nil
    ) : self
      value = @value

      unless _0.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(_0.to_int).&(0x1_u32) << 0
      end

      unless _1.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(_1.to_int).&(0x1_u32) << 1
      end

      unless _2.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(_2.to_int).&(0x1_u32) << 2
      end

      unless _3.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(_3.to_int).&(0x1_u32) << 3
      end

      unless _4.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(_4.to_int).&(0x1_u32) << 4
      end

      unless _5.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(_5.to_int).&(0x1_u32) << 5
      end

      unless _6.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(_6.to_int).&(0x1_u32) << 6
      end

      unless _7.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(_7.to_int).&(0x1_u32) << 7
      end

      unless _8.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(_8.to_int).&(0x1_u32) << 8
      end

      unless _9.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(_9.to_int).&(0x1_u32) << 9
      end

      unless _10.nil?
        value = (value & 0xfffffbff_u32) |
                UInt32.new!(_10.to_int).&(0x1_u32) << 10
      end

      unless _11.nil?
        value = (value & 0xfffff7ff_u32) |
                UInt32.new!(_11.to_int).&(0x1_u32) << 11
      end

      unless _12.nil?
        value = (value & 0xffffefff_u32) |
                UInt32.new!(_12.to_int).&(0x1_u32) << 12
      end

      unless _13.nil?
        value = (value & 0xffffdfff_u32) |
                UInt32.new!(_13.to_int).&(0x1_u32) << 13
      end

      unless _14.nil?
        value = (value & 0xffffbfff_u32) |
                UInt32.new!(_14.to_int).&(0x1_u32) << 14
      end

      unless _15.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(_15.to_int).&(0x1_u32) << 15
      end

      unless _16.nil?
        value = (value & 0xfffeffff_u32) |
                UInt32.new!(_16.to_int).&(0x1_u32) << 16
      end

      unless _17.nil?
        value = (value & 0xfffdffff_u32) |
                UInt32.new!(_17.to_int).&(0x1_u32) << 17
      end

      unless _18.nil?
        value = (value & 0xfffbffff_u32) |
                UInt32.new!(_18.to_int).&(0x1_u32) << 18
      end

      unless _19.nil?
        value = (value & 0xfff7ffff_u32) |
                UInt32.new!(_19.to_int).&(0x1_u32) << 19
      end

      unless _20.nil?
        value = (value & 0xffefffff_u32) |
                UInt32.new!(_20.to_int).&(0x1_u32) << 20
      end

      unless _21.nil?
        value = (value & 0xffdfffff_u32) |
                UInt32.new!(_21.to_int).&(0x1_u32) << 21
      end

      unless _22.nil?
        value = (value & 0xffbfffff_u32) |
                UInt32.new!(_22.to_int).&(0x1_u32) << 22
      end

      self.class.new(value)
    end

    def self.set(
      *,
      _0 : Bool? = nil,
      _1 : Bool? = nil,
      _2 : Bool? = nil,
      _3 : Bool? = nil,
      _4 : Bool? = nil,
      _5 : Bool? = nil,
      _6 : Bool? = nil,
      _7 : Bool? = nil,
      _8 : Bool? = nil,
      _9 : Bool? = nil,
      _10 : Bool? = nil,
      _11 : Bool? = nil,
      _12 : Bool? = nil,
      _13 : Bool? = nil,
      _14 : Bool? = nil,
      _15 : Bool? = nil,
      _16 : Bool? = nil,
      _17 : Bool? = nil,
      _18 : Bool? = nil,
      _19 : Bool? = nil,
      _20 : Bool? = nil,
      _21 : Bool? = nil,
      _22 : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        _0: _0,
        _1: _1,
        _2: _2,
        _3: _3,
        _4: _4,
        _5: _5,
        _6: _6,
        _7: _7,
        _8: _8,
        _9: _9,
        _10: _10,
        _11: _11,
        _12: _12,
        _13: _13,
        _14: _14,
        _15: _15,
        _16: _16,
        _17: _17,
        _18: _18,
        _19: _19,
        _20: _20,
        _21: _21,
        _22: _22,
      )
    end
  end # struct

end
