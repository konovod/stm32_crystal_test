# External interrupt/event      controller
module EXTI
  VERSION      = nil
  BASE_ADDRESS = 0x40010400_u64

  # Interrupt mask register
  struct IMR1
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
      new(0x1f800000_u64)
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

    enum MR0 : UInt8
      # Interrupt request line is masked
      MASKED = 0x0_u64

      # Interrupt request line is unmasked
      UNMASKED = 0x1_u64

      def self.reset_value : MR0
        IMR1.reset_value.mr0
      end
    end

    # Interrupt Mask on line 0
    def mr0 : MR0
      MR0.new!((@value >> 0) & 0x1_u32)
    end

    # Interrupt Mask on line 0
    def self.mr0 : MR0
      value.mr0
    end

    # Interrupt Mask on line 0
    def self.mr0=(value : MR0) : MR0
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

    # Interrupt Mask on line 23
    def mr23 : Bool
      @value.bits_set?(0x800000_u32)
    end

    # Interrupt Mask on line 23
    def self.mr23 : Bool
      value.mr23
    end

    # Interrupt Mask on line 23
    def self.mr23=(value : Bool) : Bool
      self.set(mr23: value)
      value
    end

    # Interrupt Mask on line 24
    def mr24 : Bool
      @value.bits_set?(0x1000000_u32)
    end

    # Interrupt Mask on line 24
    def self.mr24 : Bool
      value.mr24
    end

    # Interrupt Mask on line 24
    def self.mr24=(value : Bool) : Bool
      self.set(mr24: value)
      value
    end

    # Interrupt Mask on line 25
    def mr25 : Bool
      @value.bits_set?(0x2000000_u32)
    end

    # Interrupt Mask on line 25
    def self.mr25 : Bool
      value.mr25
    end

    # Interrupt Mask on line 25
    def self.mr25=(value : Bool) : Bool
      self.set(mr25: value)
      value
    end

    # Interrupt Mask on line 26
    def mr26 : Bool
      @value.bits_set?(0x4000000_u32)
    end

    # Interrupt Mask on line 26
    def self.mr26 : Bool
      value.mr26
    end

    # Interrupt Mask on line 26
    def self.mr26=(value : Bool) : Bool
      self.set(mr26: value)
      value
    end

    # Interrupt Mask on line 27
    def mr27 : Bool
      @value.bits_set?(0x8000000_u32)
    end

    # Interrupt Mask on line 27
    def self.mr27 : Bool
      value.mr27
    end

    # Interrupt Mask on line 27
    def self.mr27=(value : Bool) : Bool
      self.set(mr27: value)
      value
    end

    # Interrupt Mask on line 28
    def mr28 : Bool
      @value.bits_set?(0x10000000_u32)
    end

    # Interrupt Mask on line 28
    def self.mr28 : Bool
      value.mr28
    end

    # Interrupt Mask on line 28
    def self.mr28=(value : Bool) : Bool
      self.set(mr28: value)
      value
    end

    # Interrupt Mask on line 29
    def mr29 : Bool
      @value.bits_set?(0x20000000_u32)
    end

    # Interrupt Mask on line 29
    def self.mr29 : Bool
      value.mr29
    end

    # Interrupt Mask on line 29
    def self.mr29=(value : Bool) : Bool
      self.set(mr29: value)
      value
    end

    # Interrupt Mask on line 30
    def mr30 : Bool
      @value.bits_set?(0x40000000_u32)
    end

    # Interrupt Mask on line 30
    def self.mr30 : Bool
      value.mr30
    end

    # Interrupt Mask on line 30
    def self.mr30=(value : Bool) : Bool
      self.set(mr30: value)
      value
    end

    # Interrupt Mask on line 31
    def mr31 : Bool
      @value.bits_set?(0x80000000_u32)
    end

    # Interrupt Mask on line 31
    def self.mr31 : Bool
      value.mr31
    end

    # Interrupt Mask on line 31
    def self.mr31=(value : Bool) : Bool
      self.set(mr31: value)
      value
    end

    def copy_with(
      *,

      mr0 : MR0? = nil,

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

      mr22 : Bool? = nil,

      mr23 : Bool? = nil,

      mr24 : Bool? = nil,

      mr25 : Bool? = nil,

      mr26 : Bool? = nil,

      mr27 : Bool? = nil,

      mr28 : Bool? = nil,

      mr29 : Bool? = nil,

      mr30 : Bool? = nil,

      mr31 : Bool? = nil
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

      unless mr23.nil?
        value = (value & 0xff7fffff_u32) |
                UInt32.new!(mr23.to_int).&(0x1_u32) << 23
      end

      unless mr24.nil?
        value = (value & 0xfeffffff_u32) |
                UInt32.new!(mr24.to_int).&(0x1_u32) << 24
      end

      unless mr25.nil?
        value = (value & 0xfdffffff_u32) |
                UInt32.new!(mr25.to_int).&(0x1_u32) << 25
      end

      unless mr26.nil?
        value = (value & 0xfbffffff_u32) |
                UInt32.new!(mr26.to_int).&(0x1_u32) << 26
      end

      unless mr27.nil?
        value = (value & 0xf7ffffff_u32) |
                UInt32.new!(mr27.to_int).&(0x1_u32) << 27
      end

      unless mr28.nil?
        value = (value & 0xefffffff_u32) |
                UInt32.new!(mr28.to_int).&(0x1_u32) << 28
      end

      unless mr29.nil?
        value = (value & 0xdfffffff_u32) |
                UInt32.new!(mr29.to_int).&(0x1_u32) << 29
      end

      unless mr30.nil?
        value = (value & 0xbfffffff_u32) |
                UInt32.new!(mr30.to_int).&(0x1_u32) << 30
      end

      unless mr31.nil?
        value = (value & 0x7fffffff_u32) |
                UInt32.new!(mr31.to_int).&(0x1_u32) << 31
      end

      self.class.new(value)
    end

    def self.set(
      *,
      mr0 : MR0? = nil,
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
      mr22 : Bool? = nil,
      mr23 : Bool? = nil,
      mr24 : Bool? = nil,
      mr25 : Bool? = nil,
      mr26 : Bool? = nil,
      mr27 : Bool? = nil,
      mr28 : Bool? = nil,
      mr29 : Bool? = nil,
      mr30 : Bool? = nil,
      mr31 : Bool? = nil
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
        mr23: mr23,
        mr24: mr24,
        mr25: mr25,
        mr26: mr26,
        mr27: mr27,
        mr28: mr28,
        mr29: mr29,
        mr30: mr30,
        mr31: mr31,
      )
    end
  end # struct

  # Event mask register
  struct EMR1
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

    enum MR0 : UInt8
      # Interrupt request line is masked
      MASKED = 0x0_u64

      # Interrupt request line is unmasked
      UNMASKED = 0x1_u64

      def self.reset_value : MR0
        EMR1.reset_value.mr0
      end
    end

    # Event Mask on line 0
    def mr0 : MR0
      MR0.new!((@value >> 0) & 0x1_u32)
    end

    # Event Mask on line 0
    def self.mr0 : MR0
      value.mr0
    end

    # Event Mask on line 0
    def self.mr0=(value : MR0) : MR0
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

    # Event Mask on line 23
    def mr23 : Bool
      @value.bits_set?(0x800000_u32)
    end

    # Event Mask on line 23
    def self.mr23 : Bool
      value.mr23
    end

    # Event Mask on line 23
    def self.mr23=(value : Bool) : Bool
      self.set(mr23: value)
      value
    end

    # Event Mask on line 24
    def mr24 : Bool
      @value.bits_set?(0x1000000_u32)
    end

    # Event Mask on line 24
    def self.mr24 : Bool
      value.mr24
    end

    # Event Mask on line 24
    def self.mr24=(value : Bool) : Bool
      self.set(mr24: value)
      value
    end

    # Event Mask on line 25
    def mr25 : Bool
      @value.bits_set?(0x2000000_u32)
    end

    # Event Mask on line 25
    def self.mr25 : Bool
      value.mr25
    end

    # Event Mask on line 25
    def self.mr25=(value : Bool) : Bool
      self.set(mr25: value)
      value
    end

    # Event Mask on line 26
    def mr26 : Bool
      @value.bits_set?(0x4000000_u32)
    end

    # Event Mask on line 26
    def self.mr26 : Bool
      value.mr26
    end

    # Event Mask on line 26
    def self.mr26=(value : Bool) : Bool
      self.set(mr26: value)
      value
    end

    # Event Mask on line 27
    def mr27 : Bool
      @value.bits_set?(0x8000000_u32)
    end

    # Event Mask on line 27
    def self.mr27 : Bool
      value.mr27
    end

    # Event Mask on line 27
    def self.mr27=(value : Bool) : Bool
      self.set(mr27: value)
      value
    end

    # Event Mask on line 28
    def mr28 : Bool
      @value.bits_set?(0x10000000_u32)
    end

    # Event Mask on line 28
    def self.mr28 : Bool
      value.mr28
    end

    # Event Mask on line 28
    def self.mr28=(value : Bool) : Bool
      self.set(mr28: value)
      value
    end

    # Event Mask on line 29
    def mr29 : Bool
      @value.bits_set?(0x20000000_u32)
    end

    # Event Mask on line 29
    def self.mr29 : Bool
      value.mr29
    end

    # Event Mask on line 29
    def self.mr29=(value : Bool) : Bool
      self.set(mr29: value)
      value
    end

    # Event Mask on line 30
    def mr30 : Bool
      @value.bits_set?(0x40000000_u32)
    end

    # Event Mask on line 30
    def self.mr30 : Bool
      value.mr30
    end

    # Event Mask on line 30
    def self.mr30=(value : Bool) : Bool
      self.set(mr30: value)
      value
    end

    # Event Mask on line 31
    def mr31 : Bool
      @value.bits_set?(0x80000000_u32)
    end

    # Event Mask on line 31
    def self.mr31 : Bool
      value.mr31
    end

    # Event Mask on line 31
    def self.mr31=(value : Bool) : Bool
      self.set(mr31: value)
      value
    end

    def copy_with(
      *,

      mr0 : MR0? = nil,

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

      mr22 : Bool? = nil,

      mr23 : Bool? = nil,

      mr24 : Bool? = nil,

      mr25 : Bool? = nil,

      mr26 : Bool? = nil,

      mr27 : Bool? = nil,

      mr28 : Bool? = nil,

      mr29 : Bool? = nil,

      mr30 : Bool? = nil,

      mr31 : Bool? = nil
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

      unless mr23.nil?
        value = (value & 0xff7fffff_u32) |
                UInt32.new!(mr23.to_int).&(0x1_u32) << 23
      end

      unless mr24.nil?
        value = (value & 0xfeffffff_u32) |
                UInt32.new!(mr24.to_int).&(0x1_u32) << 24
      end

      unless mr25.nil?
        value = (value & 0xfdffffff_u32) |
                UInt32.new!(mr25.to_int).&(0x1_u32) << 25
      end

      unless mr26.nil?
        value = (value & 0xfbffffff_u32) |
                UInt32.new!(mr26.to_int).&(0x1_u32) << 26
      end

      unless mr27.nil?
        value = (value & 0xf7ffffff_u32) |
                UInt32.new!(mr27.to_int).&(0x1_u32) << 27
      end

      unless mr28.nil?
        value = (value & 0xefffffff_u32) |
                UInt32.new!(mr28.to_int).&(0x1_u32) << 28
      end

      unless mr29.nil?
        value = (value & 0xdfffffff_u32) |
                UInt32.new!(mr29.to_int).&(0x1_u32) << 29
      end

      unless mr30.nil?
        value = (value & 0xbfffffff_u32) |
                UInt32.new!(mr30.to_int).&(0x1_u32) << 30
      end

      unless mr31.nil?
        value = (value & 0x7fffffff_u32) |
                UInt32.new!(mr31.to_int).&(0x1_u32) << 31
      end

      self.class.new(value)
    end

    def self.set(
      *,
      mr0 : MR0? = nil,
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
      mr22 : Bool? = nil,
      mr23 : Bool? = nil,
      mr24 : Bool? = nil,
      mr25 : Bool? = nil,
      mr26 : Bool? = nil,
      mr27 : Bool? = nil,
      mr28 : Bool? = nil,
      mr29 : Bool? = nil,
      mr30 : Bool? = nil,
      mr31 : Bool? = nil
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
        mr23: mr23,
        mr24: mr24,
        mr25: mr25,
        mr26: mr26,
        mr27: mr27,
        mr28: mr28,
        mr29: mr29,
        mr30: mr30,
        mr31: mr31,
      )
    end
  end # struct

  # Rising Trigger selection          register
  struct RTSR1
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

    enum TR0 : UInt8
      # Rising edge trigger is disabled
      DISABLED = 0x0_u64

      # Rising edge trigger is enabled
      ENABLED = 0x1_u64

      def self.reset_value : TR0
        RTSR1.reset_value.tr0
      end
    end

    # Rising trigger event configuration of              line 0
    def tr0 : TR0
      TR0.new!((@value >> 0) & 0x1_u32)
    end

    # Rising trigger event configuration of              line 0
    def self.tr0 : TR0
      value.tr0
    end

    # Rising trigger event configuration of              line 0
    def self.tr0=(value : TR0) : TR0
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

    # Rising trigger event configuration of              line 29
    def tr29 : Bool
      @value.bits_set?(0x20000000_u32)
    end

    # Rising trigger event configuration of              line 29
    def self.tr29 : Bool
      value.tr29
    end

    # Rising trigger event configuration of              line 29
    def self.tr29=(value : Bool) : Bool
      self.set(tr29: value)
      value
    end

    # Rising trigger event configuration of              line 30
    def tr30 : Bool
      @value.bits_set?(0x40000000_u32)
    end

    # Rising trigger event configuration of              line 30
    def self.tr30 : Bool
      value.tr30
    end

    # Rising trigger event configuration of              line 30
    def self.tr30=(value : Bool) : Bool
      self.set(tr30: value)
      value
    end

    # Rising trigger event configuration of              line 31
    def tr31 : Bool
      @value.bits_set?(0x80000000_u32)
    end

    # Rising trigger event configuration of              line 31
    def self.tr31 : Bool
      value.tr31
    end

    # Rising trigger event configuration of              line 31
    def self.tr31=(value : Bool) : Bool
      self.set(tr31: value)
      value
    end

    def copy_with(
      *,

      tr0 : TR0? = nil,

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

      tr22 : Bool? = nil,

      tr29 : Bool? = nil,

      tr30 : Bool? = nil,

      tr31 : Bool? = nil
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

      unless tr29.nil?
        value = (value & 0xdfffffff_u32) |
                UInt32.new!(tr29.to_int).&(0x1_u32) << 29
      end

      unless tr30.nil?
        value = (value & 0xbfffffff_u32) |
                UInt32.new!(tr30.to_int).&(0x1_u32) << 30
      end

      unless tr31.nil?
        value = (value & 0x7fffffff_u32) |
                UInt32.new!(tr31.to_int).&(0x1_u32) << 31
      end

      self.class.new(value)
    end

    def self.set(
      *,
      tr0 : TR0? = nil,
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
      tr22 : Bool? = nil,
      tr29 : Bool? = nil,
      tr30 : Bool? = nil,
      tr31 : Bool? = nil
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
        tr29: tr29,
        tr30: tr30,
        tr31: tr31,
      )
    end
  end # struct

  # Falling Trigger selection          register
  struct FTSR1
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

    enum TR0 : UInt8
      # Falling edge trigger is disabled
      DISABLED = 0x0_u64

      # Falling edge trigger is enabled
      ENABLED = 0x1_u64

      def self.reset_value : TR0
        FTSR1.reset_value.tr0
      end
    end

    # Falling trigger event configuration of              line 0
    def tr0 : TR0
      TR0.new!((@value >> 0) & 0x1_u32)
    end

    # Falling trigger event configuration of              line 0
    def self.tr0 : TR0
      value.tr0
    end

    # Falling trigger event configuration of              line 0
    def self.tr0=(value : TR0) : TR0
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

    # Falling trigger event configuration of              line 29
    def tr29 : Bool
      @value.bits_set?(0x20000000_u32)
    end

    # Falling trigger event configuration of              line 29
    def self.tr29 : Bool
      value.tr29
    end

    # Falling trigger event configuration of              line 29
    def self.tr29=(value : Bool) : Bool
      self.set(tr29: value)
      value
    end

    # Falling trigger event configuration of              line 30.
    def tr30 : Bool
      @value.bits_set?(0x40000000_u32)
    end

    # Falling trigger event configuration of              line 30.
    def self.tr30 : Bool
      value.tr30
    end

    # Falling trigger event configuration of              line 30.
    def self.tr30=(value : Bool) : Bool
      self.set(tr30: value)
      value
    end

    # Falling trigger event configuration of              line 31
    def tr31 : Bool
      @value.bits_set?(0x80000000_u32)
    end

    # Falling trigger event configuration of              line 31
    def self.tr31 : Bool
      value.tr31
    end

    # Falling trigger event configuration of              line 31
    def self.tr31=(value : Bool) : Bool
      self.set(tr31: value)
      value
    end

    def copy_with(
      *,

      tr0 : TR0? = nil,

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

      tr22 : Bool? = nil,

      tr29 : Bool? = nil,

      tr30 : Bool? = nil,

      tr31 : Bool? = nil
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

      unless tr29.nil?
        value = (value & 0xdfffffff_u32) |
                UInt32.new!(tr29.to_int).&(0x1_u32) << 29
      end

      unless tr30.nil?
        value = (value & 0xbfffffff_u32) |
                UInt32.new!(tr30.to_int).&(0x1_u32) << 30
      end

      unless tr31.nil?
        value = (value & 0x7fffffff_u32) |
                UInt32.new!(tr31.to_int).&(0x1_u32) << 31
      end

      self.class.new(value)
    end

    def self.set(
      *,
      tr0 : TR0? = nil,
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
      tr22 : Bool? = nil,
      tr29 : Bool? = nil,
      tr30 : Bool? = nil,
      tr31 : Bool? = nil
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
        tr29: tr29,
        tr30: tr30,
        tr31: tr31,
      )
    end
  end # struct

  # Software interrupt event          register
  struct SWIER1
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

    enum SWIER0 : UInt8
      # Generates an interrupt request
      PEND = 0x1_u64

      def self.reset_value : SWIER0
        SWIER1.reset_value.swier0
      end
    end

    # Software Interrupt on line              0
    def swier0 : SWIER0
      SWIER0.new!((@value >> 0) & 0x1_u32)
    end

    # Software Interrupt on line              0
    def self.swier0 : SWIER0
      value.swier0
    end

    # Software Interrupt on line              0
    def self.swier0=(value : SWIER0) : SWIER0
      self.set(swier0: value)
      value
    end

    # Software Interrupt on line              1
    def swier1 : Bool
      @value.bits_set?(0x2_u32)
    end

    # Software Interrupt on line              1
    def self.swier1 : Bool
      value.swier1
    end

    # Software Interrupt on line              1
    def self.swier1=(value : Bool) : Bool
      self.set(swier1: value)
      value
    end

    # Software Interrupt on line              2
    def swier2 : Bool
      @value.bits_set?(0x4_u32)
    end

    # Software Interrupt on line              2
    def self.swier2 : Bool
      value.swier2
    end

    # Software Interrupt on line              2
    def self.swier2=(value : Bool) : Bool
      self.set(swier2: value)
      value
    end

    # Software Interrupt on line              3
    def swier3 : Bool
      @value.bits_set?(0x8_u32)
    end

    # Software Interrupt on line              3
    def self.swier3 : Bool
      value.swier3
    end

    # Software Interrupt on line              3
    def self.swier3=(value : Bool) : Bool
      self.set(swier3: value)
      value
    end

    # Software Interrupt on line              4
    def swier4 : Bool
      @value.bits_set?(0x10_u32)
    end

    # Software Interrupt on line              4
    def self.swier4 : Bool
      value.swier4
    end

    # Software Interrupt on line              4
    def self.swier4=(value : Bool) : Bool
      self.set(swier4: value)
      value
    end

    # Software Interrupt on line              5
    def swier5 : Bool
      @value.bits_set?(0x20_u32)
    end

    # Software Interrupt on line              5
    def self.swier5 : Bool
      value.swier5
    end

    # Software Interrupt on line              5
    def self.swier5=(value : Bool) : Bool
      self.set(swier5: value)
      value
    end

    # Software Interrupt on line              6
    def swier6 : Bool
      @value.bits_set?(0x40_u32)
    end

    # Software Interrupt on line              6
    def self.swier6 : Bool
      value.swier6
    end

    # Software Interrupt on line              6
    def self.swier6=(value : Bool) : Bool
      self.set(swier6: value)
      value
    end

    # Software Interrupt on line              7
    def swier7 : Bool
      @value.bits_set?(0x80_u32)
    end

    # Software Interrupt on line              7
    def self.swier7 : Bool
      value.swier7
    end

    # Software Interrupt on line              7
    def self.swier7=(value : Bool) : Bool
      self.set(swier7: value)
      value
    end

    # Software Interrupt on line              8
    def swier8 : Bool
      @value.bits_set?(0x100_u32)
    end

    # Software Interrupt on line              8
    def self.swier8 : Bool
      value.swier8
    end

    # Software Interrupt on line              8
    def self.swier8=(value : Bool) : Bool
      self.set(swier8: value)
      value
    end

    # Software Interrupt on line              9
    def swier9 : Bool
      @value.bits_set?(0x200_u32)
    end

    # Software Interrupt on line              9
    def self.swier9 : Bool
      value.swier9
    end

    # Software Interrupt on line              9
    def self.swier9=(value : Bool) : Bool
      self.set(swier9: value)
      value
    end

    # Software Interrupt on line              10
    def _0 : Bool
      @value.bits_set?(0x400_u32)
    end

    # Software Interrupt on line              10
    def self._0 : Bool
      value._0
    end

    # Software Interrupt on line              10
    def self._0=(value : Bool) : Bool
      self.set(_0: value)
      value
    end

    # Software Interrupt on line              11
    def _1 : Bool
      @value.bits_set?(0x800_u32)
    end

    # Software Interrupt on line              11
    def self._1 : Bool
      value._1
    end

    # Software Interrupt on line              11
    def self._1=(value : Bool) : Bool
      self.set(_1: value)
      value
    end

    # Software Interrupt on line              12
    def _2 : Bool
      @value.bits_set?(0x1000_u32)
    end

    # Software Interrupt on line              12
    def self._2 : Bool
      value._2
    end

    # Software Interrupt on line              12
    def self._2=(value : Bool) : Bool
      self.set(_2: value)
      value
    end

    # Software Interrupt on line              13
    def _3 : Bool
      @value.bits_set?(0x2000_u32)
    end

    # Software Interrupt on line              13
    def self._3 : Bool
      value._3
    end

    # Software Interrupt on line              13
    def self._3=(value : Bool) : Bool
      self.set(_3: value)
      value
    end

    # Software Interrupt on line              14
    def _4 : Bool
      @value.bits_set?(0x4000_u32)
    end

    # Software Interrupt on line              14
    def self._4 : Bool
      value._4
    end

    # Software Interrupt on line              14
    def self._4=(value : Bool) : Bool
      self.set(_4: value)
      value
    end

    # Software Interrupt on line              15
    def _5 : Bool
      @value.bits_set?(0x8000_u32)
    end

    # Software Interrupt on line              15
    def self._5 : Bool
      value._5
    end

    # Software Interrupt on line              15
    def self._5=(value : Bool) : Bool
      self.set(_5: value)
      value
    end

    # Software Interrupt on line              16
    def _6 : Bool
      @value.bits_set?(0x10000_u32)
    end

    # Software Interrupt on line              16
    def self._6 : Bool
      value._6
    end

    # Software Interrupt on line              16
    def self._6=(value : Bool) : Bool
      self.set(_6: value)
      value
    end

    # Software Interrupt on line              17
    def _7 : Bool
      @value.bits_set?(0x20000_u32)
    end

    # Software Interrupt on line              17
    def self._7 : Bool
      value._7
    end

    # Software Interrupt on line              17
    def self._7=(value : Bool) : Bool
      self.set(_7: value)
      value
    end

    # Software Interrupt on line              18
    def _8 : Bool
      @value.bits_set?(0x40000_u32)
    end

    # Software Interrupt on line              18
    def self._8 : Bool
      value._8
    end

    # Software Interrupt on line              18
    def self._8=(value : Bool) : Bool
      self.set(_8: value)
      value
    end

    # Software Interrupt on line              19
    def _9 : Bool
      @value.bits_set?(0x80000_u32)
    end

    # Software Interrupt on line              19
    def self._9 : Bool
      value._9
    end

    # Software Interrupt on line              19
    def self._9=(value : Bool) : Bool
      self.set(_9: value)
      value
    end

    # Software Interrupt on line              20
    def swier20 : Bool
      @value.bits_set?(0x100000_u32)
    end

    # Software Interrupt on line              20
    def self.swier20 : Bool
      value.swier20
    end

    # Software Interrupt on line              20
    def self.swier20=(value : Bool) : Bool
      self.set(swier20: value)
      value
    end

    # Software Interrupt on line              21
    def swier21 : Bool
      @value.bits_set?(0x200000_u32)
    end

    # Software Interrupt on line              21
    def self.swier21 : Bool
      value.swier21
    end

    # Software Interrupt on line              21
    def self.swier21=(value : Bool) : Bool
      self.set(swier21: value)
      value
    end

    # Software Interrupt on line              22
    def swier22 : Bool
      @value.bits_set?(0x400000_u32)
    end

    # Software Interrupt on line              22
    def self.swier22 : Bool
      value.swier22
    end

    # Software Interrupt on line              22
    def self.swier22=(value : Bool) : Bool
      self.set(swier22: value)
      value
    end

    # Software Interrupt on line              29
    def swier29 : Bool
      @value.bits_set?(0x20000000_u32)
    end

    # Software Interrupt on line              29
    def self.swier29 : Bool
      value.swier29
    end

    # Software Interrupt on line              29
    def self.swier29=(value : Bool) : Bool
      self.set(swier29: value)
      value
    end

    # Software Interrupt on line              309
    def swier30 : Bool
      @value.bits_set?(0x40000000_u32)
    end

    # Software Interrupt on line              309
    def self.swier30 : Bool
      value.swier30
    end

    # Software Interrupt on line              309
    def self.swier30=(value : Bool) : Bool
      self.set(swier30: value)
      value
    end

    # Software Interrupt on line              319
    def swier31 : Bool
      @value.bits_set?(0x80000000_u32)
    end

    # Software Interrupt on line              319
    def self.swier31 : Bool
      value.swier31
    end

    # Software Interrupt on line              319
    def self.swier31=(value : Bool) : Bool
      self.set(swier31: value)
      value
    end

    def copy_with(
      *,

      swier0 : SWIER0? = nil,

      swier1 : Bool? = nil,

      swier2 : Bool? = nil,

      swier3 : Bool? = nil,

      swier4 : Bool? = nil,

      swier5 : Bool? = nil,

      swier6 : Bool? = nil,

      swier7 : Bool? = nil,

      swier8 : Bool? = nil,

      swier9 : Bool? = nil,

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

      swier20 : Bool? = nil,

      swier21 : Bool? = nil,

      swier22 : Bool? = nil,

      swier29 : Bool? = nil,

      swier30 : Bool? = nil,

      swier31 : Bool? = nil
    ) : self
      value = @value

      unless swier0.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(swier0.to_int).&(0x1_u32) << 0
      end

      unless swier1.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(swier1.to_int).&(0x1_u32) << 1
      end

      unless swier2.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(swier2.to_int).&(0x1_u32) << 2
      end

      unless swier3.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(swier3.to_int).&(0x1_u32) << 3
      end

      unless swier4.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(swier4.to_int).&(0x1_u32) << 4
      end

      unless swier5.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(swier5.to_int).&(0x1_u32) << 5
      end

      unless swier6.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(swier6.to_int).&(0x1_u32) << 6
      end

      unless swier7.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(swier7.to_int).&(0x1_u32) << 7
      end

      unless swier8.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(swier8.to_int).&(0x1_u32) << 8
      end

      unless swier9.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(swier9.to_int).&(0x1_u32) << 9
      end

      unless _0.nil?
        value = (value & 0xfffffbff_u32) |
                UInt32.new!(_0.to_int).&(0x1_u32) << 10
      end

      unless _1.nil?
        value = (value & 0xfffff7ff_u32) |
                UInt32.new!(_1.to_int).&(0x1_u32) << 11
      end

      unless _2.nil?
        value = (value & 0xffffefff_u32) |
                UInt32.new!(_2.to_int).&(0x1_u32) << 12
      end

      unless _3.nil?
        value = (value & 0xffffdfff_u32) |
                UInt32.new!(_3.to_int).&(0x1_u32) << 13
      end

      unless _4.nil?
        value = (value & 0xffffbfff_u32) |
                UInt32.new!(_4.to_int).&(0x1_u32) << 14
      end

      unless _5.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(_5.to_int).&(0x1_u32) << 15
      end

      unless _6.nil?
        value = (value & 0xfffeffff_u32) |
                UInt32.new!(_6.to_int).&(0x1_u32) << 16
      end

      unless _7.nil?
        value = (value & 0xfffdffff_u32) |
                UInt32.new!(_7.to_int).&(0x1_u32) << 17
      end

      unless _8.nil?
        value = (value & 0xfffbffff_u32) |
                UInt32.new!(_8.to_int).&(0x1_u32) << 18
      end

      unless _9.nil?
        value = (value & 0xfff7ffff_u32) |
                UInt32.new!(_9.to_int).&(0x1_u32) << 19
      end

      unless swier20.nil?
        value = (value & 0xffefffff_u32) |
                UInt32.new!(swier20.to_int).&(0x1_u32) << 20
      end

      unless swier21.nil?
        value = (value & 0xffdfffff_u32) |
                UInt32.new!(swier21.to_int).&(0x1_u32) << 21
      end

      unless swier22.nil?
        value = (value & 0xffbfffff_u32) |
                UInt32.new!(swier22.to_int).&(0x1_u32) << 22
      end

      unless swier29.nil?
        value = (value & 0xdfffffff_u32) |
                UInt32.new!(swier29.to_int).&(0x1_u32) << 29
      end

      unless swier30.nil?
        value = (value & 0xbfffffff_u32) |
                UInt32.new!(swier30.to_int).&(0x1_u32) << 30
      end

      unless swier31.nil?
        value = (value & 0x7fffffff_u32) |
                UInt32.new!(swier31.to_int).&(0x1_u32) << 31
      end

      self.class.new(value)
    end

    def self.set(
      *,
      swier0 : SWIER0? = nil,
      swier1 : Bool? = nil,
      swier2 : Bool? = nil,
      swier3 : Bool? = nil,
      swier4 : Bool? = nil,
      swier5 : Bool? = nil,
      swier6 : Bool? = nil,
      swier7 : Bool? = nil,
      swier8 : Bool? = nil,
      swier9 : Bool? = nil,
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
      swier20 : Bool? = nil,
      swier21 : Bool? = nil,
      swier22 : Bool? = nil,
      swier29 : Bool? = nil,
      swier30 : Bool? = nil,
      swier31 : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        swier0: swier0,
        swier1: swier1,
        swier2: swier2,
        swier3: swier3,
        swier4: swier4,
        swier5: swier5,
        swier6: swier6,
        swier7: swier7,
        swier8: swier8,
        swier9: swier9,
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
        swier20: swier20,
        swier21: swier21,
        swier22: swier22,
        swier29: swier29,
        swier30: swier30,
        swier31: swier31,
      )
    end
  end # struct

  # Pending register
  struct PR1
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

    enum PR0 : UInt8
      # No trigger request occurred
      NOTPENDING = 0x0_u64

      # Selected trigger request occurred
      PENDING = 0x1_u64

      def self.reset_value : PR0
        PR1.reset_value.pr0
      end
    end

    # Pending bit 0
    def pr0 : PR0
      PR0.new!((@value >> 0) & 0x1_u32)
    end

    # Pending bit 0
    def self.pr0 : PR0
      value.pr0
    end

    # Pending bit 0
    def self.pr0=(value : PR0) : PR0
      self.set(pr0: value)
      value
    end

    # Pending bit 1
    def pr1 : Bool
      @value.bits_set?(0x2_u32)
    end

    # Pending bit 1
    def self.pr1 : Bool
      value.pr1
    end

    # Pending bit 1
    def self.pr1=(value : Bool) : Bool
      self.set(pr1: value)
      value
    end

    # Pending bit 2
    def pr2 : Bool
      @value.bits_set?(0x4_u32)
    end

    # Pending bit 2
    def self.pr2 : Bool
      value.pr2
    end

    # Pending bit 2
    def self.pr2=(value : Bool) : Bool
      self.set(pr2: value)
      value
    end

    # Pending bit 3
    def pr3 : Bool
      @value.bits_set?(0x8_u32)
    end

    # Pending bit 3
    def self.pr3 : Bool
      value.pr3
    end

    # Pending bit 3
    def self.pr3=(value : Bool) : Bool
      self.set(pr3: value)
      value
    end

    # Pending bit 4
    def pr4 : Bool
      @value.bits_set?(0x10_u32)
    end

    # Pending bit 4
    def self.pr4 : Bool
      value.pr4
    end

    # Pending bit 4
    def self.pr4=(value : Bool) : Bool
      self.set(pr4: value)
      value
    end

    # Pending bit 5
    def pr5 : Bool
      @value.bits_set?(0x20_u32)
    end

    # Pending bit 5
    def self.pr5 : Bool
      value.pr5
    end

    # Pending bit 5
    def self.pr5=(value : Bool) : Bool
      self.set(pr5: value)
      value
    end

    # Pending bit 6
    def pr6 : Bool
      @value.bits_set?(0x40_u32)
    end

    # Pending bit 6
    def self.pr6 : Bool
      value.pr6
    end

    # Pending bit 6
    def self.pr6=(value : Bool) : Bool
      self.set(pr6: value)
      value
    end

    # Pending bit 7
    def pr7 : Bool
      @value.bits_set?(0x80_u32)
    end

    # Pending bit 7
    def self.pr7 : Bool
      value.pr7
    end

    # Pending bit 7
    def self.pr7=(value : Bool) : Bool
      self.set(pr7: value)
      value
    end

    # Pending bit 8
    def pr8 : Bool
      @value.bits_set?(0x100_u32)
    end

    # Pending bit 8
    def self.pr8 : Bool
      value.pr8
    end

    # Pending bit 8
    def self.pr8=(value : Bool) : Bool
      self.set(pr8: value)
      value
    end

    # Pending bit 9
    def pr9 : Bool
      @value.bits_set?(0x200_u32)
    end

    # Pending bit 9
    def self.pr9 : Bool
      value.pr9
    end

    # Pending bit 9
    def self.pr9=(value : Bool) : Bool
      self.set(pr9: value)
      value
    end

    # Pending bit 10
    def _0 : Bool
      @value.bits_set?(0x400_u32)
    end

    # Pending bit 10
    def self._0 : Bool
      value._0
    end

    # Pending bit 10
    def self._0=(value : Bool) : Bool
      self.set(_0: value)
      value
    end

    # Pending bit 11
    def _1 : Bool
      @value.bits_set?(0x800_u32)
    end

    # Pending bit 11
    def self._1 : Bool
      value._1
    end

    # Pending bit 11
    def self._1=(value : Bool) : Bool
      self.set(_1: value)
      value
    end

    # Pending bit 12
    def _2 : Bool
      @value.bits_set?(0x1000_u32)
    end

    # Pending bit 12
    def self._2 : Bool
      value._2
    end

    # Pending bit 12
    def self._2=(value : Bool) : Bool
      self.set(_2: value)
      value
    end

    # Pending bit 13
    def _3 : Bool
      @value.bits_set?(0x2000_u32)
    end

    # Pending bit 13
    def self._3 : Bool
      value._3
    end

    # Pending bit 13
    def self._3=(value : Bool) : Bool
      self.set(_3: value)
      value
    end

    # Pending bit 14
    def _4 : Bool
      @value.bits_set?(0x4000_u32)
    end

    # Pending bit 14
    def self._4 : Bool
      value._4
    end

    # Pending bit 14
    def self._4=(value : Bool) : Bool
      self.set(_4: value)
      value
    end

    # Pending bit 15
    def _5 : Bool
      @value.bits_set?(0x8000_u32)
    end

    # Pending bit 15
    def self._5 : Bool
      value._5
    end

    # Pending bit 15
    def self._5=(value : Bool) : Bool
      self.set(_5: value)
      value
    end

    # Pending bit 16
    def _6 : Bool
      @value.bits_set?(0x10000_u32)
    end

    # Pending bit 16
    def self._6 : Bool
      value._6
    end

    # Pending bit 16
    def self._6=(value : Bool) : Bool
      self.set(_6: value)
      value
    end

    # Pending bit 17
    def _7 : Bool
      @value.bits_set?(0x20000_u32)
    end

    # Pending bit 17
    def self._7 : Bool
      value._7
    end

    # Pending bit 17
    def self._7=(value : Bool) : Bool
      self.set(_7: value)
      value
    end

    # Pending bit 18
    def _8 : Bool
      @value.bits_set?(0x40000_u32)
    end

    # Pending bit 18
    def self._8 : Bool
      value._8
    end

    # Pending bit 18
    def self._8=(value : Bool) : Bool
      self.set(_8: value)
      value
    end

    # Pending bit 19
    def _9 : Bool
      @value.bits_set?(0x80000_u32)
    end

    # Pending bit 19
    def self._9 : Bool
      value._9
    end

    # Pending bit 19
    def self._9=(value : Bool) : Bool
      self.set(_9: value)
      value
    end

    # Pending bit 20
    def pr20 : Bool
      @value.bits_set?(0x100000_u32)
    end

    # Pending bit 20
    def self.pr20 : Bool
      value.pr20
    end

    # Pending bit 20
    def self.pr20=(value : Bool) : Bool
      self.set(pr20: value)
      value
    end

    # Pending bit 21
    def pr21 : Bool
      @value.bits_set?(0x200000_u32)
    end

    # Pending bit 21
    def self.pr21 : Bool
      value.pr21
    end

    # Pending bit 21
    def self.pr21=(value : Bool) : Bool
      self.set(pr21: value)
      value
    end

    # Pending bit 22
    def pr22 : Bool
      @value.bits_set?(0x400000_u32)
    end

    # Pending bit 22
    def self.pr22 : Bool
      value.pr22
    end

    # Pending bit 22
    def self.pr22=(value : Bool) : Bool
      self.set(pr22: value)
      value
    end

    # Pending bit 29
    def pr29 : Bool
      @value.bits_set?(0x20000000_u32)
    end

    # Pending bit 29
    def self.pr29 : Bool
      value.pr29
    end

    # Pending bit 29
    def self.pr29=(value : Bool) : Bool
      self.set(pr29: value)
      value
    end

    # Pending bit 30
    def pr30 : Bool
      @value.bits_set?(0x40000000_u32)
    end

    # Pending bit 30
    def self.pr30 : Bool
      value.pr30
    end

    # Pending bit 30
    def self.pr30=(value : Bool) : Bool
      self.set(pr30: value)
      value
    end

    # Pending bit 31
    def pr31 : Bool
      @value.bits_set?(0x80000000_u32)
    end

    # Pending bit 31
    def self.pr31 : Bool
      value.pr31
    end

    # Pending bit 31
    def self.pr31=(value : Bool) : Bool
      self.set(pr31: value)
      value
    end

    def copy_with(
      *,

      pr0 : PR0? = nil,

      pr1 : Bool? = nil,

      pr2 : Bool? = nil,

      pr3 : Bool? = nil,

      pr4 : Bool? = nil,

      pr5 : Bool? = nil,

      pr6 : Bool? = nil,

      pr7 : Bool? = nil,

      pr8 : Bool? = nil,

      pr9 : Bool? = nil,

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

      pr20 : Bool? = nil,

      pr21 : Bool? = nil,

      pr22 : Bool? = nil,

      pr29 : Bool? = nil,

      pr30 : Bool? = nil,

      pr31 : Bool? = nil
    ) : self
      value = @value

      unless pr0.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(pr0.to_int).&(0x1_u32) << 0
      end

      unless pr1.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(pr1.to_int).&(0x1_u32) << 1
      end

      unless pr2.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(pr2.to_int).&(0x1_u32) << 2
      end

      unless pr3.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(pr3.to_int).&(0x1_u32) << 3
      end

      unless pr4.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(pr4.to_int).&(0x1_u32) << 4
      end

      unless pr5.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(pr5.to_int).&(0x1_u32) << 5
      end

      unless pr6.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(pr6.to_int).&(0x1_u32) << 6
      end

      unless pr7.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(pr7.to_int).&(0x1_u32) << 7
      end

      unless pr8.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(pr8.to_int).&(0x1_u32) << 8
      end

      unless pr9.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(pr9.to_int).&(0x1_u32) << 9
      end

      unless _0.nil?
        value = (value & 0xfffffbff_u32) |
                UInt32.new!(_0.to_int).&(0x1_u32) << 10
      end

      unless _1.nil?
        value = (value & 0xfffff7ff_u32) |
                UInt32.new!(_1.to_int).&(0x1_u32) << 11
      end

      unless _2.nil?
        value = (value & 0xffffefff_u32) |
                UInt32.new!(_2.to_int).&(0x1_u32) << 12
      end

      unless _3.nil?
        value = (value & 0xffffdfff_u32) |
                UInt32.new!(_3.to_int).&(0x1_u32) << 13
      end

      unless _4.nil?
        value = (value & 0xffffbfff_u32) |
                UInt32.new!(_4.to_int).&(0x1_u32) << 14
      end

      unless _5.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(_5.to_int).&(0x1_u32) << 15
      end

      unless _6.nil?
        value = (value & 0xfffeffff_u32) |
                UInt32.new!(_6.to_int).&(0x1_u32) << 16
      end

      unless _7.nil?
        value = (value & 0xfffdffff_u32) |
                UInt32.new!(_7.to_int).&(0x1_u32) << 17
      end

      unless _8.nil?
        value = (value & 0xfffbffff_u32) |
                UInt32.new!(_8.to_int).&(0x1_u32) << 18
      end

      unless _9.nil?
        value = (value & 0xfff7ffff_u32) |
                UInt32.new!(_9.to_int).&(0x1_u32) << 19
      end

      unless pr20.nil?
        value = (value & 0xffefffff_u32) |
                UInt32.new!(pr20.to_int).&(0x1_u32) << 20
      end

      unless pr21.nil?
        value = (value & 0xffdfffff_u32) |
                UInt32.new!(pr21.to_int).&(0x1_u32) << 21
      end

      unless pr22.nil?
        value = (value & 0xffbfffff_u32) |
                UInt32.new!(pr22.to_int).&(0x1_u32) << 22
      end

      unless pr29.nil?
        value = (value & 0xdfffffff_u32) |
                UInt32.new!(pr29.to_int).&(0x1_u32) << 29
      end

      unless pr30.nil?
        value = (value & 0xbfffffff_u32) |
                UInt32.new!(pr30.to_int).&(0x1_u32) << 30
      end

      unless pr31.nil?
        value = (value & 0x7fffffff_u32) |
                UInt32.new!(pr31.to_int).&(0x1_u32) << 31
      end

      self.class.new(value)
    end

    def self.set(
      *,
      pr0 : PR0? = nil,
      pr1 : Bool? = nil,
      pr2 : Bool? = nil,
      pr3 : Bool? = nil,
      pr4 : Bool? = nil,
      pr5 : Bool? = nil,
      pr6 : Bool? = nil,
      pr7 : Bool? = nil,
      pr8 : Bool? = nil,
      pr9 : Bool? = nil,
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
      pr20 : Bool? = nil,
      pr21 : Bool? = nil,
      pr22 : Bool? = nil,
      pr29 : Bool? = nil,
      pr30 : Bool? = nil,
      pr31 : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        pr0: pr0,
        pr1: pr1,
        pr2: pr2,
        pr3: pr3,
        pr4: pr4,
        pr5: pr5,
        pr6: pr6,
        pr7: pr7,
        pr8: pr8,
        pr9: pr9,
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
        pr20: pr20,
        pr21: pr21,
        pr22: pr22,
        pr29: pr29,
        pr30: pr30,
        pr31: pr31,
      )
    end
  end # struct

  # Interrupt mask register
  struct IMR2
    ADDRESS = BASE_ADDRESS + 0x20_u64

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
      new(0xfffffffc_u64)
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

    enum MR32 : UInt8
      # Interrupt request line is masked
      MASKED = 0x0_u64

      # Interrupt request line is unmasked
      UNMASKED = 0x1_u64

      def self.reset_value : MR32
        IMR2.reset_value.mr32
      end
    end

    # Interrupt Mask on external/internal line              32
    def mr32 : MR32
      MR32.new!((@value >> 0) & 0x1_u32)
    end

    # Interrupt Mask on external/internal line              32
    def self.mr32 : MR32
      value.mr32
    end

    # Interrupt Mask on external/internal line              32
    def self.mr32=(value : MR32) : MR32
      self.set(mr32: value)
      value
    end

    # Interrupt Mask on external/internal line              33
    def mr33 : Bool
      @value.bits_set?(0x2_u32)
    end

    # Interrupt Mask on external/internal line              33
    def self.mr33 : Bool
      value.mr33
    end

    # Interrupt Mask on external/internal line              33
    def self.mr33=(value : Bool) : Bool
      self.set(mr33: value)
      value
    end

    # Interrupt Mask on external/internal line              34
    def mr34 : Bool
      @value.bits_set?(0x4_u32)
    end

    # Interrupt Mask on external/internal line              34
    def self.mr34 : Bool
      value.mr34
    end

    # Interrupt Mask on external/internal line              34
    def self.mr34=(value : Bool) : Bool
      self.set(mr34: value)
      value
    end

    # Interrupt Mask on external/internal line              35
    def mr35 : Bool
      @value.bits_set?(0x8_u32)
    end

    # Interrupt Mask on external/internal line              35
    def self.mr35 : Bool
      value.mr35
    end

    # Interrupt Mask on external/internal line              35
    def self.mr35=(value : Bool) : Bool
      self.set(mr35: value)
      value
    end

    def copy_with(
      *,

      mr32 : MR32? = nil,

      mr33 : Bool? = nil,

      mr34 : Bool? = nil,

      mr35 : Bool? = nil
    ) : self
      value = @value

      unless mr32.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(mr32.to_int).&(0x1_u32) << 0
      end

      unless mr33.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(mr33.to_int).&(0x1_u32) << 1
      end

      unless mr34.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(mr34.to_int).&(0x1_u32) << 2
      end

      unless mr35.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(mr35.to_int).&(0x1_u32) << 3
      end

      self.class.new(value)
    end

    def self.set(
      *,
      mr32 : MR32? = nil,
      mr33 : Bool? = nil,
      mr34 : Bool? = nil,
      mr35 : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        mr32: mr32,
        mr33: mr33,
        mr34: mr34,
        mr35: mr35,
      )
    end
  end # struct

  # Event mask register
  struct EMR2
    ADDRESS = BASE_ADDRESS + 0x24_u64

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

    enum MR32 : UInt8
      # Interrupt request line is masked
      MASKED = 0x0_u64

      # Interrupt request line is unmasked
      UNMASKED = 0x1_u64

      def self.reset_value : MR32
        EMR2.reset_value.mr32
      end
    end

    # Event mask on external/internal line              32
    def mr32 : MR32
      MR32.new!((@value >> 0) & 0x1_u32)
    end

    # Event mask on external/internal line              32
    def self.mr32 : MR32
      value.mr32
    end

    # Event mask on external/internal line              32
    def self.mr32=(value : MR32) : MR32
      self.set(mr32: value)
      value
    end

    # Event mask on external/internal line              33
    def mr33 : Bool
      @value.bits_set?(0x2_u32)
    end

    # Event mask on external/internal line              33
    def self.mr33 : Bool
      value.mr33
    end

    # Event mask on external/internal line              33
    def self.mr33=(value : Bool) : Bool
      self.set(mr33: value)
      value
    end

    # Event mask on external/internal line              34
    def mr34 : Bool
      @value.bits_set?(0x4_u32)
    end

    # Event mask on external/internal line              34
    def self.mr34 : Bool
      value.mr34
    end

    # Event mask on external/internal line              34
    def self.mr34=(value : Bool) : Bool
      self.set(mr34: value)
      value
    end

    # Event mask on external/internal line              35
    def mr35 : Bool
      @value.bits_set?(0x8_u32)
    end

    # Event mask on external/internal line              35
    def self.mr35 : Bool
      value.mr35
    end

    # Event mask on external/internal line              35
    def self.mr35=(value : Bool) : Bool
      self.set(mr35: value)
      value
    end

    def copy_with(
      *,

      mr32 : MR32? = nil,

      mr33 : Bool? = nil,

      mr34 : Bool? = nil,

      mr35 : Bool? = nil
    ) : self
      value = @value

      unless mr32.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(mr32.to_int).&(0x1_u32) << 0
      end

      unless mr33.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(mr33.to_int).&(0x1_u32) << 1
      end

      unless mr34.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(mr34.to_int).&(0x1_u32) << 2
      end

      unless mr35.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(mr35.to_int).&(0x1_u32) << 3
      end

      self.class.new(value)
    end

    def self.set(
      *,
      mr32 : MR32? = nil,
      mr33 : Bool? = nil,
      mr34 : Bool? = nil,
      mr35 : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        mr32: mr32,
        mr33: mr33,
        mr34: mr34,
        mr35: mr35,
      )
    end
  end # struct

  # Rising Trigger selection          register
  struct RTSR2
    ADDRESS = BASE_ADDRESS + 0x28_u64

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

    enum TR32 : UInt8
      # Rising edge trigger is disabled
      DISABLED = 0x0_u64

      # Rising edge trigger is enabled
      ENABLED = 0x1_u64

      def self.reset_value : TR32
        RTSR2.reset_value.tr32
      end
    end

    # Rising trigger event configuration bit              of line 32
    def tr32 : TR32
      TR32.new!((@value >> 0) & 0x1_u32)
    end

    # Rising trigger event configuration bit              of line 32
    def self.tr32 : TR32
      value.tr32
    end

    # Rising trigger event configuration bit              of line 32
    def self.tr32=(value : TR32) : TR32
      self.set(tr32: value)
      value
    end

    # Rising trigger event configuration bit              of line 33
    def tr33 : Bool
      @value.bits_set?(0x2_u32)
    end

    # Rising trigger event configuration bit              of line 33
    def self.tr33 : Bool
      value.tr33
    end

    # Rising trigger event configuration bit              of line 33
    def self.tr33=(value : Bool) : Bool
      self.set(tr33: value)
      value
    end

    def copy_with(
      *,

      tr32 : TR32? = nil,

      tr33 : Bool? = nil
    ) : self
      value = @value

      unless tr32.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(tr32.to_int).&(0x1_u32) << 0
      end

      unless tr33.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(tr33.to_int).&(0x1_u32) << 1
      end

      self.class.new(value)
    end

    def self.set(
      *,
      tr32 : TR32? = nil,
      tr33 : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        tr32: tr32,
        tr33: tr33,
      )
    end
  end # struct

  # Falling Trigger selection          register
  struct FTSR2
    ADDRESS = BASE_ADDRESS + 0x2c_u64

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

    enum TR32 : UInt8
      # Falling edge trigger is disabled
      DISABLED = 0x0_u64

      # Falling edge trigger is enabled
      ENABLED = 0x1_u64

      def self.reset_value : TR32
        FTSR2.reset_value.tr32
      end
    end

    # Falling trigger event configuration bit              of line 32
    def tr32 : TR32
      TR32.new!((@value >> 0) & 0x1_u32)
    end

    # Falling trigger event configuration bit              of line 32
    def self.tr32 : TR32
      value.tr32
    end

    # Falling trigger event configuration bit              of line 32
    def self.tr32=(value : TR32) : TR32
      self.set(tr32: value)
      value
    end

    # Falling trigger event configuration bit              of line 33
    def tr33 : Bool
      @value.bits_set?(0x2_u32)
    end

    # Falling trigger event configuration bit              of line 33
    def self.tr33 : Bool
      value.tr33
    end

    # Falling trigger event configuration bit              of line 33
    def self.tr33=(value : Bool) : Bool
      self.set(tr33: value)
      value
    end

    def copy_with(
      *,

      tr32 : TR32? = nil,

      tr33 : Bool? = nil
    ) : self
      value = @value

      unless tr32.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(tr32.to_int).&(0x1_u32) << 0
      end

      unless tr33.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(tr33.to_int).&(0x1_u32) << 1
      end

      self.class.new(value)
    end

    def self.set(
      *,
      tr32 : TR32? = nil,
      tr33 : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        tr32: tr32,
        tr33: tr33,
      )
    end
  end # struct

  # Software interrupt event          register
  struct SWIER2
    ADDRESS = BASE_ADDRESS + 0x30_u64

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

    enum SWIER32 : UInt8
      # Generates an interrupt request
      PEND = 0x1_u64

      def self.reset_value : SWIER32
        SWIER2.reset_value.swier32
      end
    end

    # Software interrupt on line              32
    def swier32 : SWIER32
      SWIER32.new!((@value >> 0) & 0x1_u32)
    end

    # Software interrupt on line              32
    def self.swier32 : SWIER32
      value.swier32
    end

    # Software interrupt on line              32
    def self.swier32=(value : SWIER32) : SWIER32
      self.set(swier32: value)
      value
    end

    # Software interrupt on line              33
    def swier33 : Bool
      @value.bits_set?(0x2_u32)
    end

    # Software interrupt on line              33
    def self.swier33 : Bool
      value.swier33
    end

    # Software interrupt on line              33
    def self.swier33=(value : Bool) : Bool
      self.set(swier33: value)
      value
    end

    def copy_with(
      *,

      swier32 : SWIER32? = nil,

      swier33 : Bool? = nil
    ) : self
      value = @value

      unless swier32.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(swier32.to_int).&(0x1_u32) << 0
      end

      unless swier33.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(swier33.to_int).&(0x1_u32) << 1
      end

      self.class.new(value)
    end

    def self.set(
      *,
      swier32 : SWIER32? = nil,
      swier33 : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        swier32: swier32,
        swier33: swier33,
      )
    end
  end # struct

  # Pending register
  struct PR2
    ADDRESS = BASE_ADDRESS + 0x34_u64

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

    enum PR32 : UInt8
      # No trigger request occurred
      NOTPENDING = 0x0_u64

      # Selected trigger request occurred
      PENDING = 0x1_u64

      def self.reset_value : PR32
        PR2.reset_value.pr32
      end
    end

    # Pending bit on line 32
    def pr32 : PR32
      PR32.new!((@value >> 0) & 0x1_u32)
    end

    # Pending bit on line 32
    def self.pr32 : PR32
      value.pr32
    end

    # Pending bit on line 32
    def self.pr32=(value : PR32) : PR32
      self.set(pr32: value)
      value
    end

    # Pending bit on line 33
    def pr33 : Bool
      @value.bits_set?(0x2_u32)
    end

    # Pending bit on line 33
    def self.pr33 : Bool
      value.pr33
    end

    # Pending bit on line 33
    def self.pr33=(value : Bool) : Bool
      self.set(pr33: value)
      value
    end

    def copy_with(
      *,

      pr32 : PR32? = nil,

      pr33 : Bool? = nil
    ) : self
      value = @value

      unless pr32.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(pr32.to_int).&(0x1_u32) << 0
      end

      unless pr33.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(pr33.to_int).&(0x1_u32) << 1
      end

      self.class.new(value)
    end

    def self.set(
      *,
      pr32 : PR32? = nil,
      pr33 : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        pr32: pr32,
        pr33: pr33,
      )
    end
  end # struct

end
