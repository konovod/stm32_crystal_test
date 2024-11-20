# Debug support
module DBGMCU
  VERSION      = nil
  BASE_ADDRESS = 0xe0042000_u64

  # MCU Device ID Code Register
  struct IDCODE
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

    # Device Identifier
    def dev_id : UInt16
      UInt16.new!((@value >> 0) & 0xfff_u32)
    end

    # Device Identifier
    def self.dev_id : UInt16
      value.dev_id
    end

    # Revision Identifier
    def rev_id : UInt16
      UInt16.new!((@value >> 16) & 0xffff_u32)
    end

    # Revision Identifier
    def self.rev_id : UInt16
      value.rev_id
    end
  end # struct

  # Debug MCU Configuration          Register
  struct CR
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

    # Debug Sleep mode
    def dbg_sleep : Bool
      @value.bits_set?(0x1_u32)
    end

    # Debug Sleep mode
    def self.dbg_sleep : Bool
      value.dbg_sleep
    end

    # Debug Sleep mode
    def self.dbg_sleep=(value : Bool) : Bool
      self.set(dbg_sleep: value)
      value
    end

    # Debug Stop Mode
    def dbg_stop : Bool
      @value.bits_set?(0x2_u32)
    end

    # Debug Stop Mode
    def self.dbg_stop : Bool
      value.dbg_stop
    end

    # Debug Stop Mode
    def self.dbg_stop=(value : Bool) : Bool
      self.set(dbg_stop: value)
      value
    end

    # Debug Standby Mode
    def dbg_standby : Bool
      @value.bits_set?(0x4_u32)
    end

    # Debug Standby Mode
    def self.dbg_standby : Bool
      value.dbg_standby
    end

    # Debug Standby Mode
    def self.dbg_standby=(value : Bool) : Bool
      self.set(dbg_standby: value)
      value
    end

    # Trace pin assignment              control
    def trace_ioen : Bool
      @value.bits_set?(0x20_u32)
    end

    # Trace pin assignment              control
    def self.trace_ioen : Bool
      value.trace_ioen
    end

    # Trace pin assignment              control
    def self.trace_ioen=(value : Bool) : Bool
      self.set(trace_ioen: value)
      value
    end

    # Trace pin assignment              control
    def trace_mode : UInt8
      UInt8.new!((@value >> 6) & 0x3_u32)
    end

    # Trace pin assignment              control
    def self.trace_mode : UInt8
      value.trace_mode
    end

    # Trace pin assignment              control
    def self.trace_mode=(value : UInt8) : UInt8
      self.set(trace_mode: value)
      value
    end

    def copy_with(
      *,

      dbg_sleep : Bool? = nil,

      dbg_stop : Bool? = nil,

      dbg_standby : Bool? = nil,

      trace_ioen : Bool? = nil,

      trace_mode : UInt8? = nil
    ) : self
      value = @value

      unless dbg_sleep.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(dbg_sleep.to_int).&(0x1_u32) << 0
      end

      unless dbg_stop.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(dbg_stop.to_int).&(0x1_u32) << 1
      end

      unless dbg_standby.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(dbg_standby.to_int).&(0x1_u32) << 2
      end

      unless trace_ioen.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(trace_ioen.to_int).&(0x1_u32) << 5
      end

      unless trace_mode.nil?
        value = (value & 0xffffff3f_u32) |
                UInt32.new!(trace_mode.to_int).&(0x3_u32) << 6
      end

      self.class.new(value)
    end

    def self.set(
      *,
      dbg_sleep : Bool? = nil,
      dbg_stop : Bool? = nil,
      dbg_standby : Bool? = nil,
      trace_ioen : Bool? = nil,
      trace_mode : UInt8? = nil
    ) : Nil
      self.value = self.value.copy_with(
        dbg_sleep: dbg_sleep,
        dbg_stop: dbg_stop,
        dbg_standby: dbg_standby,
        trace_ioen: trace_ioen,
        trace_mode: trace_mode,
      )
    end
  end # struct

  # APB Low Freeze Register
  struct APB1_FZ
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

    # Debug Timer 2 stopped when Core is              halted
    def dbg_tim2_stop : Bool
      @value.bits_set?(0x1_u32)
    end

    # Debug Timer 2 stopped when Core is              halted
    def self.dbg_tim2_stop : Bool
      value.dbg_tim2_stop
    end

    # Debug Timer 2 stopped when Core is              halted
    def self.dbg_tim2_stop=(value : Bool) : Bool
      self.set(dbg_tim2_stop: value)
      value
    end

    # Debug Timer 3 stopped when Core is              halted
    def dbg_tim3_stop : Bool
      @value.bits_set?(0x2_u32)
    end

    # Debug Timer 3 stopped when Core is              halted
    def self.dbg_tim3_stop : Bool
      value.dbg_tim3_stop
    end

    # Debug Timer 3 stopped when Core is              halted
    def self.dbg_tim3_stop=(value : Bool) : Bool
      self.set(dbg_tim3_stop: value)
      value
    end

    # Debug Timer 4 stopped when Core is              halted
    def dbg_tim4_stop : Bool
      @value.bits_set?(0x4_u32)
    end

    # Debug Timer 4 stopped when Core is              halted
    def self.dbg_tim4_stop : Bool
      value.dbg_tim4_stop
    end

    # Debug Timer 4 stopped when Core is              halted
    def self.dbg_tim4_stop=(value : Bool) : Bool
      self.set(dbg_tim4_stop: value)
      value
    end

    # Debug Timer 5 stopped when Core is              halted
    def dbg_tim5_stop : Bool
      @value.bits_set?(0x8_u32)
    end

    # Debug Timer 5 stopped when Core is              halted
    def self.dbg_tim5_stop : Bool
      value.dbg_tim5_stop
    end

    # Debug Timer 5 stopped when Core is              halted
    def self.dbg_tim5_stop=(value : Bool) : Bool
      self.set(dbg_tim5_stop: value)
      value
    end

    # Debug Timer 6 stopped when Core is              halted
    def dbg_tim6_stop : Bool
      @value.bits_set?(0x10_u32)
    end

    # Debug Timer 6 stopped when Core is              halted
    def self.dbg_tim6_stop : Bool
      value.dbg_tim6_stop
    end

    # Debug Timer 6 stopped when Core is              halted
    def self.dbg_tim6_stop=(value : Bool) : Bool
      self.set(dbg_tim6_stop: value)
      value
    end

    # Debug Timer 7 stopped when Core is              halted
    def dbg_tim7_stop : Bool
      @value.bits_set?(0x20_u32)
    end

    # Debug Timer 7 stopped when Core is              halted
    def self.dbg_tim7_stop : Bool
      value.dbg_tim7_stop
    end

    # Debug Timer 7 stopped when Core is              halted
    def self.dbg_tim7_stop=(value : Bool) : Bool
      self.set(dbg_tim7_stop: value)
      value
    end

    # Debug Timer 12 stopped when Core is              halted
    def dbg_tim12_stop : Bool
      @value.bits_set?(0x40_u32)
    end

    # Debug Timer 12 stopped when Core is              halted
    def self.dbg_tim12_stop : Bool
      value.dbg_tim12_stop
    end

    # Debug Timer 12 stopped when Core is              halted
    def self.dbg_tim12_stop=(value : Bool) : Bool
      self.set(dbg_tim12_stop: value)
      value
    end

    # Debug Timer 13 stopped when Core is              halted
    def dbg_tim13_stop : Bool
      @value.bits_set?(0x80_u32)
    end

    # Debug Timer 13 stopped when Core is              halted
    def self.dbg_tim13_stop : Bool
      value.dbg_tim13_stop
    end

    # Debug Timer 13 stopped when Core is              halted
    def self.dbg_tim13_stop=(value : Bool) : Bool
      self.set(dbg_tim13_stop: value)
      value
    end

    # Debug Timer 14 stopped when Core is              halted
    def dbg_timer14_stop : Bool
      @value.bits_set?(0x100_u32)
    end

    # Debug Timer 14 stopped when Core is              halted
    def self.dbg_timer14_stop : Bool
      value.dbg_timer14_stop
    end

    # Debug Timer 14 stopped when Core is              halted
    def self.dbg_timer14_stop=(value : Bool) : Bool
      self.set(dbg_timer14_stop: value)
      value
    end

    # Debug Timer 18 stopped when Core is              halted
    def dbg_tim18_stop : Bool
      @value.bits_set?(0x200_u32)
    end

    # Debug Timer 18 stopped when Core is              halted
    def self.dbg_tim18_stop : Bool
      value.dbg_tim18_stop
    end

    # Debug Timer 18 stopped when Core is              halted
    def self.dbg_tim18_stop=(value : Bool) : Bool
      self.set(dbg_tim18_stop: value)
      value
    end

    # Debug RTC stopped when Core is              halted
    def dbg_rtc_stop : Bool
      @value.bits_set?(0x400_u32)
    end

    # Debug RTC stopped when Core is              halted
    def self.dbg_rtc_stop : Bool
      value.dbg_rtc_stop
    end

    # Debug RTC stopped when Core is              halted
    def self.dbg_rtc_stop=(value : Bool) : Bool
      self.set(dbg_rtc_stop: value)
      value
    end

    # Debug Window Wachdog stopped when Core              is halted
    def dbg_wwdg_stop : Bool
      @value.bits_set?(0x800_u32)
    end

    # Debug Window Wachdog stopped when Core              is halted
    def self.dbg_wwdg_stop : Bool
      value.dbg_wwdg_stop
    end

    # Debug Window Wachdog stopped when Core              is halted
    def self.dbg_wwdg_stop=(value : Bool) : Bool
      self.set(dbg_wwdg_stop: value)
      value
    end

    # Debug Independent Wachdog stopped when              Core is halted
    def dbg_iwdg_stop : Bool
      @value.bits_set?(0x1000_u32)
    end

    # Debug Independent Wachdog stopped when              Core is halted
    def self.dbg_iwdg_stop : Bool
      value.dbg_iwdg_stop
    end

    # Debug Independent Wachdog stopped when              Core is halted
    def self.dbg_iwdg_stop=(value : Bool) : Bool
      self.set(dbg_iwdg_stop: value)
      value
    end

    # SMBUS timeout mode stopped when Core is              halted
    def i2_c1_smbus_timeout : Bool
      @value.bits_set?(0x200000_u32)
    end

    # SMBUS timeout mode stopped when Core is              halted
    def self.i2_c1_smbus_timeout : Bool
      value.i2_c1_smbus_timeout
    end

    # SMBUS timeout mode stopped when Core is              halted
    def self.i2_c1_smbus_timeout=(value : Bool) : Bool
      self.set(i2_c1_smbus_timeout: value)
      value
    end

    # SMBUS timeout mode stopped when Core is              halted
    def i2_c2_smbus_timeout : Bool
      @value.bits_set?(0x400000_u32)
    end

    # SMBUS timeout mode stopped when Core is              halted
    def self.i2_c2_smbus_timeout : Bool
      value.i2_c2_smbus_timeout
    end

    # SMBUS timeout mode stopped when Core is              halted
    def self.i2_c2_smbus_timeout=(value : Bool) : Bool
      self.set(i2_c2_smbus_timeout: value)
      value
    end

    # Debug CAN stopped when core is              halted
    def dbg_can_stop : Bool
      @value.bits_set?(0x2000000_u32)
    end

    # Debug CAN stopped when core is              halted
    def self.dbg_can_stop : Bool
      value.dbg_can_stop
    end

    # Debug CAN stopped when core is              halted
    def self.dbg_can_stop=(value : Bool) : Bool
      self.set(dbg_can_stop: value)
      value
    end

    def copy_with(
      *,

      dbg_tim2_stop : Bool? = nil,

      dbg_tim3_stop : Bool? = nil,

      dbg_tim4_stop : Bool? = nil,

      dbg_tim5_stop : Bool? = nil,

      dbg_tim6_stop : Bool? = nil,

      dbg_tim7_stop : Bool? = nil,

      dbg_tim12_stop : Bool? = nil,

      dbg_tim13_stop : Bool? = nil,

      dbg_timer14_stop : Bool? = nil,

      dbg_tim18_stop : Bool? = nil,

      dbg_rtc_stop : Bool? = nil,

      dbg_wwdg_stop : Bool? = nil,

      dbg_iwdg_stop : Bool? = nil,

      i2_c1_smbus_timeout : Bool? = nil,

      i2_c2_smbus_timeout : Bool? = nil,

      dbg_can_stop : Bool? = nil
    ) : self
      value = @value

      unless dbg_tim2_stop.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(dbg_tim2_stop.to_int).&(0x1_u32) << 0
      end

      unless dbg_tim3_stop.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(dbg_tim3_stop.to_int).&(0x1_u32) << 1
      end

      unless dbg_tim4_stop.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(dbg_tim4_stop.to_int).&(0x1_u32) << 2
      end

      unless dbg_tim5_stop.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(dbg_tim5_stop.to_int).&(0x1_u32) << 3
      end

      unless dbg_tim6_stop.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(dbg_tim6_stop.to_int).&(0x1_u32) << 4
      end

      unless dbg_tim7_stop.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(dbg_tim7_stop.to_int).&(0x1_u32) << 5
      end

      unless dbg_tim12_stop.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(dbg_tim12_stop.to_int).&(0x1_u32) << 6
      end

      unless dbg_tim13_stop.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(dbg_tim13_stop.to_int).&(0x1_u32) << 7
      end

      unless dbg_timer14_stop.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(dbg_timer14_stop.to_int).&(0x1_u32) << 8
      end

      unless dbg_tim18_stop.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(dbg_tim18_stop.to_int).&(0x1_u32) << 9
      end

      unless dbg_rtc_stop.nil?
        value = (value & 0xfffffbff_u32) |
                UInt32.new!(dbg_rtc_stop.to_int).&(0x1_u32) << 10
      end

      unless dbg_wwdg_stop.nil?
        value = (value & 0xfffff7ff_u32) |
                UInt32.new!(dbg_wwdg_stop.to_int).&(0x1_u32) << 11
      end

      unless dbg_iwdg_stop.nil?
        value = (value & 0xffffefff_u32) |
                UInt32.new!(dbg_iwdg_stop.to_int).&(0x1_u32) << 12
      end

      unless i2_c1_smbus_timeout.nil?
        value = (value & 0xffdfffff_u32) |
                UInt32.new!(i2_c1_smbus_timeout.to_int).&(0x1_u32) << 21
      end

      unless i2_c2_smbus_timeout.nil?
        value = (value & 0xffbfffff_u32) |
                UInt32.new!(i2_c2_smbus_timeout.to_int).&(0x1_u32) << 22
      end

      unless dbg_can_stop.nil?
        value = (value & 0xfdffffff_u32) |
                UInt32.new!(dbg_can_stop.to_int).&(0x1_u32) << 25
      end

      self.class.new(value)
    end

    def self.set(
      *,
      dbg_tim2_stop : Bool? = nil,
      dbg_tim3_stop : Bool? = nil,
      dbg_tim4_stop : Bool? = nil,
      dbg_tim5_stop : Bool? = nil,
      dbg_tim6_stop : Bool? = nil,
      dbg_tim7_stop : Bool? = nil,
      dbg_tim12_stop : Bool? = nil,
      dbg_tim13_stop : Bool? = nil,
      dbg_timer14_stop : Bool? = nil,
      dbg_tim18_stop : Bool? = nil,
      dbg_rtc_stop : Bool? = nil,
      dbg_wwdg_stop : Bool? = nil,
      dbg_iwdg_stop : Bool? = nil,
      i2_c1_smbus_timeout : Bool? = nil,
      i2_c2_smbus_timeout : Bool? = nil,
      dbg_can_stop : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        dbg_tim2_stop: dbg_tim2_stop,
        dbg_tim3_stop: dbg_tim3_stop,
        dbg_tim4_stop: dbg_tim4_stop,
        dbg_tim5_stop: dbg_tim5_stop,
        dbg_tim6_stop: dbg_tim6_stop,
        dbg_tim7_stop: dbg_tim7_stop,
        dbg_tim12_stop: dbg_tim12_stop,
        dbg_tim13_stop: dbg_tim13_stop,
        dbg_timer14_stop: dbg_timer14_stop,
        dbg_tim18_stop: dbg_tim18_stop,
        dbg_rtc_stop: dbg_rtc_stop,
        dbg_wwdg_stop: dbg_wwdg_stop,
        dbg_iwdg_stop: dbg_iwdg_stop,
        i2_c1_smbus_timeout: i2_c1_smbus_timeout,
        i2_c2_smbus_timeout: i2_c2_smbus_timeout,
        dbg_can_stop: dbg_can_stop,
      )
    end
  end # struct

  # APB High Freeze Register
  struct APB2FZ
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

    # Debug Timer 15 stopped when Core is              halted
    def dbg_tim15_stop : Bool
      @value.bits_set?(0x4_u32)
    end

    # Debug Timer 15 stopped when Core is              halted
    def self.dbg_tim15_stop : Bool
      value.dbg_tim15_stop
    end

    # Debug Timer 15 stopped when Core is              halted
    def self.dbg_tim15_stop=(value : Bool) : Bool
      self.set(dbg_tim15_stop: value)
      value
    end

    # Debug Timer 16 stopped when Core is              halted
    def dbg_tim16_stop : Bool
      @value.bits_set?(0x8_u32)
    end

    # Debug Timer 16 stopped when Core is              halted
    def self.dbg_tim16_stop : Bool
      value.dbg_tim16_stop
    end

    # Debug Timer 16 stopped when Core is              halted
    def self.dbg_tim16_stop=(value : Bool) : Bool
      self.set(dbg_tim16_stop: value)
      value
    end

    # Debug Timer 17 stopped when Core is              halted
    def dbg_tim17_sto : Bool
      @value.bits_set?(0x10_u32)
    end

    # Debug Timer 17 stopped when Core is              halted
    def self.dbg_tim17_sto : Bool
      value.dbg_tim17_sto
    end

    # Debug Timer 17 stopped when Core is              halted
    def self.dbg_tim17_sto=(value : Bool) : Bool
      self.set(dbg_tim17_sto: value)
      value
    end

    # Debug Timer 19 stopped when Core is              halted
    def dbg_tim19_stop : Bool
      @value.bits_set?(0x20_u32)
    end

    # Debug Timer 19 stopped when Core is              halted
    def self.dbg_tim19_stop : Bool
      value.dbg_tim19_stop
    end

    # Debug Timer 19 stopped when Core is              halted
    def self.dbg_tim19_stop=(value : Bool) : Bool
      self.set(dbg_tim19_stop: value)
      value
    end

    def copy_with(
      *,

      dbg_tim15_stop : Bool? = nil,

      dbg_tim16_stop : Bool? = nil,

      dbg_tim17_sto : Bool? = nil,

      dbg_tim19_stop : Bool? = nil
    ) : self
      value = @value

      unless dbg_tim15_stop.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(dbg_tim15_stop.to_int).&(0x1_u32) << 2
      end

      unless dbg_tim16_stop.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(dbg_tim16_stop.to_int).&(0x1_u32) << 3
      end

      unless dbg_tim17_sto.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(dbg_tim17_sto.to_int).&(0x1_u32) << 4
      end

      unless dbg_tim19_stop.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(dbg_tim19_stop.to_int).&(0x1_u32) << 5
      end

      self.class.new(value)
    end

    def self.set(
      *,
      dbg_tim15_stop : Bool? = nil,
      dbg_tim16_stop : Bool? = nil,
      dbg_tim17_sto : Bool? = nil,
      dbg_tim19_stop : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        dbg_tim15_stop: dbg_tim15_stop,
        dbg_tim16_stop: dbg_tim16_stop,
        dbg_tim17_sto: dbg_tim17_sto,
        dbg_tim19_stop: dbg_tim19_stop,
      )
    end
  end # struct

end
