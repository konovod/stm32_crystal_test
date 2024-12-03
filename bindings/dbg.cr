# Debug support
module DBG
  VERSION      = nil
  BASE_ADDRESS = 0xe0042000_u64

  # IDCODE
  struct MCU_IDCODE
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
      new(0x10006411_u64)
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

    # DEV_ID
    def dev_id : UInt16
      UInt16.new!((@value >> 0) & 0xfff_u32)
    end

    # DEV_ID
    def self.dev_id : UInt16
      value.dev_id
    end

    # REV_ID
    def rev_id : UInt16
      UInt16.new!((@value >> 16) & 0xffff_u32)
    end

    # REV_ID
    def self.rev_id : UInt16
      value.rev_id
    end
  end # struct

  # Control Register
  struct MCU_CR
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

    # DBG_SLEEP
    def sleep : Bool
      @value.bits_set?(0x1_u32)
    end

    # DBG_SLEEP
    def self.sleep : Bool
      value.sleep
    end

    # DBG_SLEEP
    def self.sleep=(value : Bool) : Bool
      self.set(sleep: value)
      value
    end

    # DBG_STOP
    def stop : Bool
      @value.bits_set?(0x2_u32)
    end

    # DBG_STOP
    def self.stop : Bool
      value.stop
    end

    # DBG_STOP
    def self.stop=(value : Bool) : Bool
      self.set(stop: value)
      value
    end

    # DBG_STANDBY
    def standby : Bool
      @value.bits_set?(0x4_u32)
    end

    # DBG_STANDBY
    def self.standby : Bool
      value.standby
    end

    # DBG_STANDBY
    def self.standby=(value : Bool) : Bool
      self.set(standby: value)
      value
    end

    # TRACE_IOEN
    def trace_ioen : Bool
      @value.bits_set?(0x20_u32)
    end

    # TRACE_IOEN
    def self.trace_ioen : Bool
      value.trace_ioen
    end

    # TRACE_IOEN
    def self.trace_ioen=(value : Bool) : Bool
      self.set(trace_ioen: value)
      value
    end

    # TRACE_MODE
    def trace_mode : UInt8
      UInt8.new!((@value >> 6) & 0x3_u32)
    end

    # TRACE_MODE
    def self.trace_mode : UInt8
      value.trace_mode
    end

    # TRACE_MODE
    def self.trace_mode=(value : UInt8) : UInt8
      self.set(trace_mode: value)
      value
    end

    def copy_with(
      *,

      sleep : Bool? = nil,

      stop : Bool? = nil,

      standby : Bool? = nil,

      trace_ioen : Bool? = nil,

      trace_mode : UInt8? = nil
    ) : self
      value = @value

      unless sleep.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(sleep.to_int).&(0x1_u32) << 0
      end

      unless stop.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(stop.to_int).&(0x1_u32) << 1
      end

      unless standby.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(standby.to_int).&(0x1_u32) << 2
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
      sleep : Bool? = nil,
      stop : Bool? = nil,
      standby : Bool? = nil,
      trace_ioen : Bool? = nil,
      trace_mode : UInt8? = nil
    ) : Nil
      self.value = self.value.copy_with(
        sleep: sleep,
        stop: stop,
        standby: standby,
        trace_ioen: trace_ioen,
        trace_mode: trace_mode,
      )
    end
  end # struct

  # Debug MCU APB1 Freeze registe
  struct MCU_APB1_FZ
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

    # DBG_TIM2_STOP
    def tim2_stop : Bool
      @value.bits_set?(0x1_u32)
    end

    # DBG_TIM2_STOP
    def self.tim2_stop : Bool
      value.tim2_stop
    end

    # DBG_TIM2_STOP
    def self.tim2_stop=(value : Bool) : Bool
      self.set(tim2_stop: value)
      value
    end

    # DBG_TIM3 _STOP
    def tim3_stop : Bool
      @value.bits_set?(0x2_u32)
    end

    # DBG_TIM3 _STOP
    def self.tim3_stop : Bool
      value.tim3_stop
    end

    # DBG_TIM3 _STOP
    def self.tim3_stop=(value : Bool) : Bool
      self.set(tim3_stop: value)
      value
    end

    # DBG_TIM4_STOP
    def tim4_stop : Bool
      @value.bits_set?(0x4_u32)
    end

    # DBG_TIM4_STOP
    def self.tim4_stop : Bool
      value.tim4_stop
    end

    # DBG_TIM4_STOP
    def self.tim4_stop=(value : Bool) : Bool
      self.set(tim4_stop: value)
      value
    end

    # DBG_TIM5_STOP
    def tim5_stop : Bool
      @value.bits_set?(0x8_u32)
    end

    # DBG_TIM5_STOP
    def self.tim5_stop : Bool
      value.tim5_stop
    end

    # DBG_TIM5_STOP
    def self.tim5_stop=(value : Bool) : Bool
      self.set(tim5_stop: value)
      value
    end

    # DBG_TIM6_STOP
    def tim6_stop : Bool
      @value.bits_set?(0x10_u32)
    end

    # DBG_TIM6_STOP
    def self.tim6_stop : Bool
      value.tim6_stop
    end

    # DBG_TIM6_STOP
    def self.tim6_stop=(value : Bool) : Bool
      self.set(tim6_stop: value)
      value
    end

    # DBG_TIM7_STOP
    def tim7_stop : Bool
      @value.bits_set?(0x20_u32)
    end

    # DBG_TIM7_STOP
    def self.tim7_stop : Bool
      value.tim7_stop
    end

    # DBG_TIM7_STOP
    def self.tim7_stop=(value : Bool) : Bool
      self.set(tim7_stop: value)
      value
    end

    # DBG_TIM12_STOP
    def tim12_stop : Bool
      @value.bits_set?(0x40_u32)
    end

    # DBG_TIM12_STOP
    def self.tim12_stop : Bool
      value.tim12_stop
    end

    # DBG_TIM12_STOP
    def self.tim12_stop=(value : Bool) : Bool
      self.set(tim12_stop: value)
      value
    end

    # DBG_TIM13_STOP
    def tim13_stop : Bool
      @value.bits_set?(0x80_u32)
    end

    # DBG_TIM13_STOP
    def self.tim13_stop : Bool
      value.tim13_stop
    end

    # DBG_TIM13_STOP
    def self.tim13_stop=(value : Bool) : Bool
      self.set(tim13_stop: value)
      value
    end

    # DBG_TIM14_STOP
    def tim14_stop : Bool
      @value.bits_set?(0x100_u32)
    end

    # DBG_TIM14_STOP
    def self.tim14_stop : Bool
      value.tim14_stop
    end

    # DBG_TIM14_STOP
    def self.tim14_stop=(value : Bool) : Bool
      self.set(tim14_stop: value)
      value
    end

    # DBG_WWDG_STOP
    def wwdg_stop : Bool
      @value.bits_set?(0x800_u32)
    end

    # DBG_WWDG_STOP
    def self.wwdg_stop : Bool
      value.wwdg_stop
    end

    # DBG_WWDG_STOP
    def self.wwdg_stop=(value : Bool) : Bool
      self.set(wwdg_stop: value)
      value
    end

    # DBG_IWDEG_STOP
    def iwdeg_stop : Bool
      @value.bits_set?(0x1000_u32)
    end

    # DBG_IWDEG_STOP
    def self.iwdeg_stop : Bool
      value.iwdeg_stop
    end

    # DBG_IWDEG_STOP
    def self.iwdeg_stop=(value : Bool) : Bool
      self.set(iwdeg_stop: value)
      value
    end

    # DBG_J2C1_SMBUS_TIMEOUT
    def j2_c1_smbus_timeout : Bool
      @value.bits_set?(0x200000_u32)
    end

    # DBG_J2C1_SMBUS_TIMEOUT
    def self.j2_c1_smbus_timeout : Bool
      value.j2_c1_smbus_timeout
    end

    # DBG_J2C1_SMBUS_TIMEOUT
    def self.j2_c1_smbus_timeout=(value : Bool) : Bool
      self.set(j2_c1_smbus_timeout: value)
      value
    end

    # DBG_J2C2_SMBUS_TIMEOUT
    def j2_c2_smbus_timeout : Bool
      @value.bits_set?(0x400000_u32)
    end

    # DBG_J2C2_SMBUS_TIMEOUT
    def self.j2_c2_smbus_timeout : Bool
      value.j2_c2_smbus_timeout
    end

    # DBG_J2C2_SMBUS_TIMEOUT
    def self.j2_c2_smbus_timeout=(value : Bool) : Bool
      self.set(j2_c2_smbus_timeout: value)
      value
    end

    # DBG_J2C3SMBUS_TIMEOUT
    def j2_c3_smbus_timeout : Bool
      @value.bits_set?(0x800000_u32)
    end

    # DBG_J2C3SMBUS_TIMEOUT
    def self.j2_c3_smbus_timeout : Bool
      value.j2_c3_smbus_timeout
    end

    # DBG_J2C3SMBUS_TIMEOUT
    def self.j2_c3_smbus_timeout=(value : Bool) : Bool
      self.set(j2_c3_smbus_timeout: value)
      value
    end

    # DBG_CAN1_STOP
    def can1_stop : Bool
      @value.bits_set?(0x2000000_u32)
    end

    # DBG_CAN1_STOP
    def self.can1_stop : Bool
      value.can1_stop
    end

    # DBG_CAN1_STOP
    def self.can1_stop=(value : Bool) : Bool
      self.set(can1_stop: value)
      value
    end

    # DBG_CAN2_STOP
    def can2_stop : Bool
      @value.bits_set?(0x4000000_u32)
    end

    # DBG_CAN2_STOP
    def self.can2_stop : Bool
      value.can2_stop
    end

    # DBG_CAN2_STOP
    def self.can2_stop=(value : Bool) : Bool
      self.set(can2_stop: value)
      value
    end

    def copy_with(
      *,

      tim2_stop : Bool? = nil,

      tim3_stop : Bool? = nil,

      tim4_stop : Bool? = nil,

      tim5_stop : Bool? = nil,

      tim6_stop : Bool? = nil,

      tim7_stop : Bool? = nil,

      tim12_stop : Bool? = nil,

      tim13_stop : Bool? = nil,

      tim14_stop : Bool? = nil,

      wwdg_stop : Bool? = nil,

      iwdeg_stop : Bool? = nil,

      j2_c1_smbus_timeout : Bool? = nil,

      j2_c2_smbus_timeout : Bool? = nil,

      j2_c3_smbus_timeout : Bool? = nil,

      can1_stop : Bool? = nil,

      can2_stop : Bool? = nil
    ) : self
      value = @value

      unless tim2_stop.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(tim2_stop.to_int).&(0x1_u32) << 0
      end

      unless tim3_stop.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(tim3_stop.to_int).&(0x1_u32) << 1
      end

      unless tim4_stop.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(tim4_stop.to_int).&(0x1_u32) << 2
      end

      unless tim5_stop.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(tim5_stop.to_int).&(0x1_u32) << 3
      end

      unless tim6_stop.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(tim6_stop.to_int).&(0x1_u32) << 4
      end

      unless tim7_stop.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(tim7_stop.to_int).&(0x1_u32) << 5
      end

      unless tim12_stop.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(tim12_stop.to_int).&(0x1_u32) << 6
      end

      unless tim13_stop.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(tim13_stop.to_int).&(0x1_u32) << 7
      end

      unless tim14_stop.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(tim14_stop.to_int).&(0x1_u32) << 8
      end

      unless wwdg_stop.nil?
        value = (value & 0xfffff7ff_u32) |
                UInt32.new!(wwdg_stop.to_int).&(0x1_u32) << 11
      end

      unless iwdeg_stop.nil?
        value = (value & 0xffffefff_u32) |
                UInt32.new!(iwdeg_stop.to_int).&(0x1_u32) << 12
      end

      unless j2_c1_smbus_timeout.nil?
        value = (value & 0xffdfffff_u32) |
                UInt32.new!(j2_c1_smbus_timeout.to_int).&(0x1_u32) << 21
      end

      unless j2_c2_smbus_timeout.nil?
        value = (value & 0xffbfffff_u32) |
                UInt32.new!(j2_c2_smbus_timeout.to_int).&(0x1_u32) << 22
      end

      unless j2_c3_smbus_timeout.nil?
        value = (value & 0xff7fffff_u32) |
                UInt32.new!(j2_c3_smbus_timeout.to_int).&(0x1_u32) << 23
      end

      unless can1_stop.nil?
        value = (value & 0xfdffffff_u32) |
                UInt32.new!(can1_stop.to_int).&(0x1_u32) << 25
      end

      unless can2_stop.nil?
        value = (value & 0xfbffffff_u32) |
                UInt32.new!(can2_stop.to_int).&(0x1_u32) << 26
      end

      self.class.new(value)
    end

    def self.set(
      *,
      tim2_stop : Bool? = nil,
      tim3_stop : Bool? = nil,
      tim4_stop : Bool? = nil,
      tim5_stop : Bool? = nil,
      tim6_stop : Bool? = nil,
      tim7_stop : Bool? = nil,
      tim12_stop : Bool? = nil,
      tim13_stop : Bool? = nil,
      tim14_stop : Bool? = nil,
      wwdg_stop : Bool? = nil,
      iwdeg_stop : Bool? = nil,
      j2_c1_smbus_timeout : Bool? = nil,
      j2_c2_smbus_timeout : Bool? = nil,
      j2_c3_smbus_timeout : Bool? = nil,
      can1_stop : Bool? = nil,
      can2_stop : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        tim2_stop: tim2_stop,
        tim3_stop: tim3_stop,
        tim4_stop: tim4_stop,
        tim5_stop: tim5_stop,
        tim6_stop: tim6_stop,
        tim7_stop: tim7_stop,
        tim12_stop: tim12_stop,
        tim13_stop: tim13_stop,
        tim14_stop: tim14_stop,
        wwdg_stop: wwdg_stop,
        iwdeg_stop: iwdeg_stop,
        j2_c1_smbus_timeout: j2_c1_smbus_timeout,
        j2_c2_smbus_timeout: j2_c2_smbus_timeout,
        j2_c3_smbus_timeout: j2_c3_smbus_timeout,
        can1_stop: can1_stop,
        can2_stop: can2_stop,
      )
    end
  end # struct

  # Debug MCU APB2 Freeze registe
  struct MCU_APB2_FZ
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

    # TIM1 counter stopped when core is              halted
    def tim1_stop : Bool
      @value.bits_set?(0x1_u32)
    end

    # TIM1 counter stopped when core is              halted
    def self.tim1_stop : Bool
      value.tim1_stop
    end

    # TIM1 counter stopped when core is              halted
    def self.tim1_stop=(value : Bool) : Bool
      self.set(tim1_stop: value)
      value
    end

    # TIM8 counter stopped when core is              halted
    def tim8_stop : Bool
      @value.bits_set?(0x2_u32)
    end

    # TIM8 counter stopped when core is              halted
    def self.tim8_stop : Bool
      value.tim8_stop
    end

    # TIM8 counter stopped when core is              halted
    def self.tim8_stop=(value : Bool) : Bool
      self.set(tim8_stop: value)
      value
    end

    # TIM9 counter stopped when core is              halted
    def tim9_stop : Bool
      @value.bits_set?(0x10000_u32)
    end

    # TIM9 counter stopped when core is              halted
    def self.tim9_stop : Bool
      value.tim9_stop
    end

    # TIM9 counter stopped when core is              halted
    def self.tim9_stop=(value : Bool) : Bool
      self.set(tim9_stop: value)
      value
    end

    # TIM10 counter stopped when core is              halted
    def tim10_stop : Bool
      @value.bits_set?(0x20000_u32)
    end

    # TIM10 counter stopped when core is              halted
    def self.tim10_stop : Bool
      value.tim10_stop
    end

    # TIM10 counter stopped when core is              halted
    def self.tim10_stop=(value : Bool) : Bool
      self.set(tim10_stop: value)
      value
    end

    # TIM11 counter stopped when core is              halted
    def tim11_stop : Bool
      @value.bits_set?(0x40000_u32)
    end

    # TIM11 counter stopped when core is              halted
    def self.tim11_stop : Bool
      value.tim11_stop
    end

    # TIM11 counter stopped when core is              halted
    def self.tim11_stop=(value : Bool) : Bool
      self.set(tim11_stop: value)
      value
    end

    def copy_with(
      *,

      tim1_stop : Bool? = nil,

      tim8_stop : Bool? = nil,

      tim9_stop : Bool? = nil,

      tim10_stop : Bool? = nil,

      tim11_stop : Bool? = nil
    ) : self
      value = @value

      unless tim1_stop.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(tim1_stop.to_int).&(0x1_u32) << 0
      end

      unless tim8_stop.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(tim8_stop.to_int).&(0x1_u32) << 1
      end

      unless tim9_stop.nil?
        value = (value & 0xfffeffff_u32) |
                UInt32.new!(tim9_stop.to_int).&(0x1_u32) << 16
      end

      unless tim10_stop.nil?
        value = (value & 0xfffdffff_u32) |
                UInt32.new!(tim10_stop.to_int).&(0x1_u32) << 17
      end

      unless tim11_stop.nil?
        value = (value & 0xfffbffff_u32) |
                UInt32.new!(tim11_stop.to_int).&(0x1_u32) << 18
      end

      self.class.new(value)
    end

    def self.set(
      *,
      tim1_stop : Bool? = nil,
      tim8_stop : Bool? = nil,
      tim9_stop : Bool? = nil,
      tim10_stop : Bool? = nil,
      tim11_stop : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        tim1_stop: tim1_stop,
        tim8_stop: tim8_stop,
        tim9_stop: tim9_stop,
        tim10_stop: tim10_stop,
        tim11_stop: tim11_stop,
      )
    end
  end # struct

end
