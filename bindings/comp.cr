# General purpose comparators
module COMP
  VERSION      = nil
  BASE_ADDRESS = 0x40010000_u64

  # control and status register
  struct N2_CSR
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

    enum N2EN : UInt8
      # Comparator disabled
      DISABLED = 0x0_u64

      # Comparator enabled
      ENABLED = 0x1_u64

      def self.reset_value : N2EN
        N2_CSR.reset_value._2_en
      end
    end

    # Comparator 2 enable
    def _2_en : N2EN
      N2EN.new!((@value >> 0) & 0x1_u32)
    end

    # Comparator 2 enable
    def self._2_en : N2EN
      value._2_en
    end

    # Comparator 2 enable
    def self._2_en=(value : N2EN) : N2EN
      self.set(_2_en: value)
      value
    end

    enum N2INMSEL : UInt8
      # 1/4 of VRefint
      ONEQUARTERVREF = 0x0_u64

      # 1/2 of VRefint
      ONEHALFVREF = 0x1_u64

      # 3/4 of VRefint
      THREEQUARTERVREF = 0x2_u64

      # VRefint
      VREF = 0x3_u64

      # PA4 or DAC1_CH1 output if enabled
      PA4_DAC1_CH1 = 0x4_u64

      # DAC1_CH2
      DAC1_CH2 = 0x5_u64

      # PA2
      PA2 = 0x6_u64

      def self.reset_value : N2INMSEL
        N2_CSR.reset_value._2_inmsel
      end
    end

    # Comparator 2 inverting input selection
    def _2_inmsel : N2INMSEL
      N2INMSEL.new!((@value >> 4) & 0x7_u32)
    end

    # Comparator 2 inverting input selection
    def self._2_inmsel : N2INMSEL
      value._2_inmsel
    end

    # Comparator 2 inverting input selection
    def self._2_inmsel=(value : N2INMSEL) : N2INMSEL
      self.set(_2_inmsel: value)
      value
    end

    enum N2OUTSEL : UInt8
      # No selection
      NOSELECTION = 0x0_u64

      # Timer 1 break input
      TIMER1BREAKINPUT = 0x1_u64

      # Timer 1 break input 2
      TIMER1BREAKINPUT2 = 0x2_u64

      # Timer 1 OCREF_CLR input
      TIMER1OCREFCLEARINPUT = 0x6_u64

      # Timer 1 input capture 1
      TIMER1INPUTCAPTURE1 = 0x7_u64

      # Timer 2 input capture 4
      TIMER2INPUTCAPTURE4 = 0x8_u64

      # Timer 2 OCREF_CLR input
      TIMER2OCREFCLEARINPUT = 0x9_u64

      # Timer 3 input capture 1
      TIMER3INPUTCAPTURE1 = 0xa_u64

      # Timer 3 OCREF_CLR input
      TIMER3OCREFCLEARINPUT = 0xb_u64

      def self.reset_value : N2OUTSEL
        N2_CSR.reset_value._2_outsel
      end
    end

    # Comparator 2 output selection
    def _2_outsel : N2OUTSEL
      N2OUTSEL.new!((@value >> 10) & 0xf_u32)
    end

    # Comparator 2 output selection
    def self._2_outsel : N2OUTSEL
      value._2_outsel
    end

    # Comparator 2 output selection
    def self._2_outsel=(value : N2OUTSEL) : N2OUTSEL
      self.set(_2_outsel: value)
      value
    end

    enum N2POL : UInt8
      # Output is not inverted
      NOTINVERTED = 0x0_u64

      # Output is inverted
      INVERTED = 0x1_u64

      def self.reset_value : N2POL
        N2_CSR.reset_value._2_pol
      end
    end

    # Comparator 2 output polarity
    def _2_pol : N2POL
      N2POL.new!((@value >> 15) & 0x1_u32)
    end

    # Comparator 2 output polarity
    def self._2_pol : N2POL
      value._2_pol
    end

    # Comparator 2 output polarity
    def self._2_pol=(value : N2POL) : N2POL
      self.set(_2_pol: value)
      value
    end

    enum N2_BLANKING : UInt8
      # No blanking
      NOBLANKING = 0x0_u64

      # TIM1 OC5 selected as blanking source
      TIM1OC5 = 0x1_u64

      # TIM2 OC3 selected as blanking source
      TIM2OC3 = 0x2_u64

      # TIM3 OC3 selected as blanking source
      TIM3OC3 = 0x3_u64

      def self.reset_value : N2_BLANKING
        N2_CSR.reset_value._2_blanking
      end
    end

    # Comparator 2 blanking source
    def _2_blanking : N2_BLANKING
      N2_BLANKING.new!((@value >> 18) & 0x7_u32)
    end

    # Comparator 2 blanking source
    def self._2_blanking : N2_BLANKING
      value._2_blanking
    end

    # Comparator 2 blanking source
    def self._2_blanking=(value : N2_BLANKING) : N2_BLANKING
      self.set(_2_blanking: value)
      value
    end

    enum N2OUT : UInt8
      # Non-inverting input below inverting input
      LOW = 0x0_u64

      # Non-inverting input above inverting input
      HIGH = 0x1_u64

      def self.reset_value : N2OUT
        N2_CSR.reset_value._2_out
      end
    end

    # Comparator 2 output
    def _2_out : N2OUT
      N2OUT.new!((@value >> 30) & 0x1_u32)
    end

    # Comparator 2 output
    def self._2_out : N2OUT
      value._2_out
    end

    enum N2LOCK : UInt8
      # Comparator CSR bits are read-write
      UNLOCKED = 0x0_u64

      # Comparator CSR bits are read-only
      LOCKED = 0x1_u64

      def self.reset_value : N2LOCK
        N2_CSR.reset_value._2_lock
      end
    end

    # Comparator 2 lock
    def _2_lock : N2LOCK
      N2LOCK.new!((@value >> 31) & 0x1_u32)
    end

    # Comparator 2 lock
    def self._2_lock : N2LOCK
      value._2_lock
    end

    # Comparator 2 lock
    def self._2_lock=(value : N2LOCK) : N2LOCK
      self.set(_2_lock: value)
      value
    end

    # Comparator 2 mode
    def _2_mode : UInt8
      UInt8.new!((@value >> 2) & 0x3_u32)
    end

    # Comparator 2 mode
    def self._2_mode : UInt8
      value._2_mode
    end

    # Comparator 2 mode
    def self._2_mode=(value : UInt8) : UInt8
      self.set(_2_mode: value)
      value
    end

    # Comparator 2 non inverted input
    def _2_inpsel : Bool
      @value.bits_set?(0x80_u32)
    end

    # Comparator 2 non inverted input
    def self._2_inpsel : Bool
      value._2_inpsel
    end

    # Comparator 2 non inverted input
    def self._2_inpsel=(value : Bool) : Bool
      self.set(_2_inpsel: value)
      value
    end

    # Comparator 2 window mode
    def _2_winmode : Bool
      @value.bits_set?(0x200_u32)
    end

    # Comparator 2 window mode
    def self._2_winmode : Bool
      value._2_winmode
    end

    # Comparator 2 window mode
    def self._2_winmode=(value : Bool) : Bool
      self.set(_2_winmode: value)
      value
    end

    # Comparator 2 hysteresis
    def _2_hyst : UInt8
      UInt8.new!((@value >> 16) & 0x3_u32)
    end

    # Comparator 2 hysteresis
    def self._2_hyst : UInt8
      value._2_hyst
    end

    # Comparator 2 hysteresis
    def self._2_hyst=(value : UInt8) : UInt8
      self.set(_2_hyst: value)
      value
    end

    # Comparator 2 inverting input selection
    def _2_inmsel3 : Bool
      @value.bits_set?(0x400000_u32)
    end

    # Comparator 2 inverting input selection
    def self._2_inmsel3 : Bool
      value._2_inmsel3
    end

    # Comparator 2 inverting input selection
    def self._2_inmsel3=(value : Bool) : Bool
      self.set(_2_inmsel3: value)
      value
    end

    def copy_with(
      *,

      _2_en : N2EN? = nil,

      _2_inmsel : N2INMSEL? = nil,

      _2_outsel : N2OUTSEL? = nil,

      _2_pol : N2POL? = nil,

      _2_blanking : N2_BLANKING? = nil,

      _2_lock : N2LOCK? = nil,

      _2_mode : UInt8? = nil,

      _2_inpsel : Bool? = nil,

      _2_winmode : Bool? = nil,

      _2_hyst : UInt8? = nil,

      _2_inmsel3 : Bool? = nil
    ) : self
      value = @value

      unless _2_en.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(_2_en.to_int).&(0x1_u32) << 0
      end

      unless _2_inmsel.nil?
        value = (value & 0xffffff8f_u32) |
                UInt32.new!(_2_inmsel.to_int).&(0x7_u32) << 4
      end

      unless _2_outsel.nil?
        value = (value & 0xffffc3ff_u32) |
                UInt32.new!(_2_outsel.to_int).&(0xf_u32) << 10
      end

      unless _2_pol.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(_2_pol.to_int).&(0x1_u32) << 15
      end

      unless _2_blanking.nil?
        value = (value & 0xffe3ffff_u32) |
                UInt32.new!(_2_blanking.to_int).&(0x7_u32) << 18
      end

      unless _2_lock.nil?
        value = (value & 0x7fffffff_u32) |
                UInt32.new!(_2_lock.to_int).&(0x1_u32) << 31
      end

      unless _2_mode.nil?
        value = (value & 0xfffffff3_u32) |
                UInt32.new!(_2_mode.to_int).&(0x3_u32) << 2
      end

      unless _2_inpsel.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(_2_inpsel.to_int).&(0x1_u32) << 7
      end

      unless _2_winmode.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(_2_winmode.to_int).&(0x1_u32) << 9
      end

      unless _2_hyst.nil?
        value = (value & 0xfffcffff_u32) |
                UInt32.new!(_2_hyst.to_int).&(0x3_u32) << 16
      end

      unless _2_inmsel3.nil?
        value = (value & 0xffbfffff_u32) |
                UInt32.new!(_2_inmsel3.to_int).&(0x1_u32) << 22
      end

      self.class.new(value)
    end

    def self.set(
      *,
      _2_en : N2EN? = nil,
      _2_inmsel : N2INMSEL? = nil,
      _2_outsel : N2OUTSEL? = nil,
      _2_pol : N2POL? = nil,
      _2_blanking : N2_BLANKING? = nil,
      _2_lock : N2LOCK? = nil,
      _2_mode : UInt8? = nil,
      _2_inpsel : Bool? = nil,
      _2_winmode : Bool? = nil,
      _2_hyst : UInt8? = nil,
      _2_inmsel3 : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        _2_en: _2_en,
        _2_inmsel: _2_inmsel,
        _2_outsel: _2_outsel,
        _2_pol: _2_pol,
        _2_blanking: _2_blanking,
        _2_lock: _2_lock,
        _2_mode: _2_mode,
        _2_inpsel: _2_inpsel,
        _2_winmode: _2_winmode,
        _2_hyst: _2_hyst,
        _2_inmsel3: _2_inmsel3,
      )
    end
  end # struct

  # control and status register
  struct N4_CSR
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

    enum N4EN : UInt8
      # Comparator disabled
      DISABLED = 0x0_u64

      # Comparator enabled
      ENABLED = 0x1_u64

      def self.reset_value : N4EN
        N4_CSR.reset_value._4_en
      end
    end

    # Comparator 4 enable
    def _4_en : N4EN
      N4EN.new!((@value >> 0) & 0x1_u32)
    end

    # Comparator 4 enable
    def self._4_en : N4EN
      value._4_en
    end

    # Comparator 4 enable
    def self._4_en=(value : N4EN) : N4EN
      self.set(_4_en: value)
      value
    end

    enum N4INMSEL : UInt8
      # 1/4 of VRefint
      ONEQUARTERVREF = 0x0_u64

      # 1/2 of VRefint
      ONEHALFVREF = 0x1_u64

      # 3/4 of VRefint
      THREEQUARTERVREF = 0x2_u64

      # VRefint
      VREF = 0x3_u64

      # PA4 or DAC1_CH1 output if enabled
      PA4_DAC1_CH1 = 0x4_u64

      # DAC1_CH2
      DAC1_CH2 = 0x5_u64

      # PB2
      PB2 = 0x7_u64

      def self.reset_value : N4INMSEL
        N4_CSR.reset_value._4_inmsel
      end
    end

    # Comparator 4 inverting input selection
    def _4_inmsel : N4INMSEL
      N4INMSEL.new!((@value >> 4) & 0x7_u32)
    end

    # Comparator 4 inverting input selection
    def self._4_inmsel : N4INMSEL
      value._4_inmsel
    end

    # Comparator 4 inverting input selection
    def self._4_inmsel=(value : N4INMSEL) : N4INMSEL
      self.set(_4_inmsel: value)
      value
    end

    enum N4OUTSEL : UInt8
      # No selection
      NOSELECTION = 0x0_u64

      # Timer 1 break input
      TIMER1BREAKINPUT = 0x1_u64

      # Timer 1 break input 2
      TIMER1BREAKINPUT2 = 0x2_u64

      # Timer 3 input capture 3
      TIMER3INPUTCAPTURE3 = 0x6_u64

      # Timer 15 input capture 2
      TIMER15INPUTCAPTURE2 = 0x8_u64

      # Timer 15 OCREF_CLR input
      TIMER15OCREFCLEARINPUT = 0xa_u64

      # Timer 3 OCREF_CLR input
      TIMER3OCREFCLEARINPUT = 0xb_u64

      def self.reset_value : N4OUTSEL
        N4_CSR.reset_value._4_outsel
      end
    end

    # Comparator 4 output selection
    def _4_outsel : N4OUTSEL
      N4OUTSEL.new!((@value >> 10) & 0xf_u32)
    end

    # Comparator 4 output selection
    def self._4_outsel : N4OUTSEL
      value._4_outsel
    end

    # Comparator 4 output selection
    def self._4_outsel=(value : N4OUTSEL) : N4OUTSEL
      self.set(_4_outsel: value)
      value
    end

    enum N4POL : UInt8
      # Output is not inverted
      NOTINVERTED = 0x0_u64

      # Output is inverted
      INVERTED = 0x1_u64

      def self.reset_value : N4POL
        N4_CSR.reset_value._4_pol
      end
    end

    # Comparator 4 output polarity
    def _4_pol : N4POL
      N4POL.new!((@value >> 15) & 0x1_u32)
    end

    # Comparator 4 output polarity
    def self._4_pol : N4POL
      value._4_pol
    end

    # Comparator 4 output polarity
    def self._4_pol=(value : N4POL) : N4POL
      self.set(_4_pol: value)
      value
    end

    enum N4_BLANKING : UInt8
      # No blanking
      NOBLANKING = 0x0_u64

      # TIM3 OC4 selected as blanking source
      TIM3OC4 = 0x1_u64

      # TIM15 OC1 selected as blanking source
      TIM15OC1 = 0x3_u64

      def self.reset_value : N4_BLANKING
        N4_CSR.reset_value._4_blanking
      end
    end

    # Comparator 4 blanking source
    def _4_blanking : N4_BLANKING
      N4_BLANKING.new!((@value >> 18) & 0x7_u32)
    end

    # Comparator 4 blanking source
    def self._4_blanking : N4_BLANKING
      value._4_blanking
    end

    # Comparator 4 blanking source
    def self._4_blanking=(value : N4_BLANKING) : N4_BLANKING
      self.set(_4_blanking: value)
      value
    end

    enum N4OUT : UInt8
      # Non-inverting input below inverting input
      LOW = 0x0_u64

      # Non-inverting input above inverting input
      HIGH = 0x1_u64

      def self.reset_value : N4OUT
        N4_CSR.reset_value._4_out
      end
    end

    # Comparator 4 output
    def _4_out : N4OUT
      N4OUT.new!((@value >> 30) & 0x1_u32)
    end

    # Comparator 4 output
    def self._4_out : N4OUT
      value._4_out
    end

    enum N4LOCK : UInt8
      # Comparator CSR bits are read-write
      UNLOCKED = 0x0_u64

      # Comparator CSR bits are read-only
      LOCKED = 0x1_u64

      def self.reset_value : N4LOCK
        N4_CSR.reset_value._4_lock
      end
    end

    # Comparator 4 lock
    def _4_lock : N4LOCK
      N4LOCK.new!((@value >> 31) & 0x1_u32)
    end

    # Comparator 4 lock
    def self._4_lock : N4LOCK
      value._4_lock
    end

    # Comparator 4 lock
    def self._4_lock=(value : N4LOCK) : N4LOCK
      self.set(_4_lock: value)
      value
    end

    # Comparator 4 window mode
    def _4_winmode : Bool
      @value.bits_set?(0x200_u32)
    end

    # Comparator 4 window mode
    def self._4_winmode : Bool
      value._4_winmode
    end

    # Comparator 4 window mode
    def self._4_winmode=(value : Bool) : Bool
      self.set(_4_winmode: value)
      value
    end

    # Comparator 4 mode
    def _4_mode : UInt8
      UInt8.new!((@value >> 2) & 0x3_u32)
    end

    # Comparator 4 mode
    def self._4_mode : UInt8
      value._4_mode
    end

    # Comparator 4 mode
    def self._4_mode=(value : UInt8) : UInt8
      self.set(_4_mode: value)
      value
    end

    # Comparator 4 non inverted input
    def _4_inpsel : Bool
      @value.bits_set?(0x80_u32)
    end

    # Comparator 4 non inverted input
    def self._4_inpsel : Bool
      value._4_inpsel
    end

    # Comparator 4 non inverted input
    def self._4_inpsel=(value : Bool) : Bool
      self.set(_4_inpsel: value)
      value
    end

    # Comparator 4 hysteresis
    def _4_hyst : UInt8
      UInt8.new!((@value >> 16) & 0x3_u32)
    end

    # Comparator 4 hysteresis
    def self._4_hyst : UInt8
      value._4_hyst
    end

    # Comparator 4 hysteresis
    def self._4_hyst=(value : UInt8) : UInt8
      self.set(_4_hyst: value)
      value
    end

    # Comparator 4 inverting input selection
    def _4_inmsel3 : Bool
      @value.bits_set?(0x400000_u32)
    end

    # Comparator 4 inverting input selection
    def self._4_inmsel3 : Bool
      value._4_inmsel3
    end

    # Comparator 4 inverting input selection
    def self._4_inmsel3=(value : Bool) : Bool
      self.set(_4_inmsel3: value)
      value
    end

    def copy_with(
      *,

      _4_en : N4EN? = nil,

      _4_inmsel : N4INMSEL? = nil,

      _4_outsel : N4OUTSEL? = nil,

      _4_pol : N4POL? = nil,

      _4_blanking : N4_BLANKING? = nil,

      _4_lock : N4LOCK? = nil,

      _4_winmode : Bool? = nil,

      _4_mode : UInt8? = nil,

      _4_inpsel : Bool? = nil,

      _4_hyst : UInt8? = nil,

      _4_inmsel3 : Bool? = nil
    ) : self
      value = @value

      unless _4_en.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(_4_en.to_int).&(0x1_u32) << 0
      end

      unless _4_inmsel.nil?
        value = (value & 0xffffff8f_u32) |
                UInt32.new!(_4_inmsel.to_int).&(0x7_u32) << 4
      end

      unless _4_outsel.nil?
        value = (value & 0xffffc3ff_u32) |
                UInt32.new!(_4_outsel.to_int).&(0xf_u32) << 10
      end

      unless _4_pol.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(_4_pol.to_int).&(0x1_u32) << 15
      end

      unless _4_blanking.nil?
        value = (value & 0xffe3ffff_u32) |
                UInt32.new!(_4_blanking.to_int).&(0x7_u32) << 18
      end

      unless _4_lock.nil?
        value = (value & 0x7fffffff_u32) |
                UInt32.new!(_4_lock.to_int).&(0x1_u32) << 31
      end

      unless _4_winmode.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(_4_winmode.to_int).&(0x1_u32) << 9
      end

      unless _4_mode.nil?
        value = (value & 0xfffffff3_u32) |
                UInt32.new!(_4_mode.to_int).&(0x3_u32) << 2
      end

      unless _4_inpsel.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(_4_inpsel.to_int).&(0x1_u32) << 7
      end

      unless _4_hyst.nil?
        value = (value & 0xfffcffff_u32) |
                UInt32.new!(_4_hyst.to_int).&(0x3_u32) << 16
      end

      unless _4_inmsel3.nil?
        value = (value & 0xffbfffff_u32) |
                UInt32.new!(_4_inmsel3.to_int).&(0x1_u32) << 22
      end

      self.class.new(value)
    end

    def self.set(
      *,
      _4_en : N4EN? = nil,
      _4_inmsel : N4INMSEL? = nil,
      _4_outsel : N4OUTSEL? = nil,
      _4_pol : N4POL? = nil,
      _4_blanking : N4_BLANKING? = nil,
      _4_lock : N4LOCK? = nil,
      _4_winmode : Bool? = nil,
      _4_mode : UInt8? = nil,
      _4_inpsel : Bool? = nil,
      _4_hyst : UInt8? = nil,
      _4_inmsel3 : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        _4_en: _4_en,
        _4_inmsel: _4_inmsel,
        _4_outsel: _4_outsel,
        _4_pol: _4_pol,
        _4_blanking: _4_blanking,
        _4_lock: _4_lock,
        _4_winmode: _4_winmode,
        _4_mode: _4_mode,
        _4_inpsel: _4_inpsel,
        _4_hyst: _4_hyst,
        _4_inmsel3: _4_inmsel3,
      )
    end
  end # struct

  # control and status register
  struct N6_CSR
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

    enum N6EN : UInt8
      # Comparator disabled
      DISABLED = 0x0_u64

      # Comparator enabled
      ENABLED = 0x1_u64

      def self.reset_value : N6EN
        N6_CSR.reset_value._6_en
      end
    end

    # Comparator 6 enable
    def _6_en : N6EN
      N6EN.new!((@value >> 0) & 0x1_u32)
    end

    # Comparator 6 enable
    def self._6_en : N6EN
      value._6_en
    end

    # Comparator 6 enable
    def self._6_en=(value : N6EN) : N6EN
      self.set(_6_en: value)
      value
    end

    enum N6INMSEL : UInt8
      # 1/4 of VRefint
      ONEQUARTERVREF = 0x0_u64

      # 1/2 of VRefint
      ONEHALFVREF = 0x1_u64

      # 3/4 of VRefint
      THREEQUARTERVREF = 0x2_u64

      # VRefint
      VREF = 0x3_u64

      # PA4 or DAC1_CH1 output if enabled
      PA4_DAC1_CH1 = 0x4_u64

      # DAC1_CH2
      DAC1_CH2 = 0x5_u64

      # PB15
      PB15 = 0x7_u64

      def self.reset_value : N6INMSEL
        N6_CSR.reset_value._6_inmsel
      end
    end

    # Comparator 6 inverting input selection
    def _6_inmsel : N6INMSEL
      N6INMSEL.new!((@value >> 4) & 0x7_u32)
    end

    # Comparator 6 inverting input selection
    def self._6_inmsel : N6INMSEL
      value._6_inmsel
    end

    # Comparator 6 inverting input selection
    def self._6_inmsel=(value : N6INMSEL) : N6INMSEL
      self.set(_6_inmsel: value)
      value
    end

    enum N6OUTSEL : UInt8
      # No selection
      NOSELECTION = 0x0_u64

      # Timer 1 break input
      TIMER1BREAKINPUT = 0x1_u64

      # Timer 1 break input 2
      TIMER1BREAKINPUT2 = 0x2_u64

      # Timer 2 input capture 2
      TIMER2INPUTCAPTURE2 = 0x6_u64

      # Timer 2 OCREF_CLR input
      TIMER2OCREFCLEARINPUT = 0x8_u64

      # Timer 16 OCREF_CLR input
      TIMER16OCREFCLEARINPUT = 0x9_u64

      # Timer 16 input capture 1
      TIMER16INPUTCAPTURE1 = 0xa_u64

      def self.reset_value : N6OUTSEL
        N6_CSR.reset_value._6_outsel
      end
    end

    # Comparator 6 output selection
    def _6_outsel : N6OUTSEL
      N6OUTSEL.new!((@value >> 10) & 0xf_u32)
    end

    # Comparator 6 output selection
    def self._6_outsel : N6OUTSEL
      value._6_outsel
    end

    # Comparator 6 output selection
    def self._6_outsel=(value : N6OUTSEL) : N6OUTSEL
      self.set(_6_outsel: value)
      value
    end

    enum N6POL : UInt8
      # Output is not inverted
      NOTINVERTED = 0x0_u64

      # Output is inverted
      INVERTED = 0x1_u64

      def self.reset_value : N6POL
        N6_CSR.reset_value._6_pol
      end
    end

    # Comparator 6 output polarity
    def _6_pol : N6POL
      N6POL.new!((@value >> 15) & 0x1_u32)
    end

    # Comparator 6 output polarity
    def self._6_pol : N6POL
      value._6_pol
    end

    # Comparator 6 output polarity
    def self._6_pol=(value : N6POL) : N6POL
      self.set(_6_pol: value)
      value
    end

    enum N6_BLANKING : UInt8
      # No blanking
      NOBLANKING = 0x0_u64

      # TIM2 OC4 selected as blanking source
      TIM2OC4 = 0x3_u64

      # TIM15 OC2 selected as blanking source
      TIM15OC2 = 0x4_u64

      def self.reset_value : N6_BLANKING
        N6_CSR.reset_value._6_blanking
      end
    end

    # Comparator 6 blanking source
    def _6_blanking : N6_BLANKING
      N6_BLANKING.new!((@value >> 18) & 0x7_u32)
    end

    # Comparator 6 blanking source
    def self._6_blanking : N6_BLANKING
      value._6_blanking
    end

    # Comparator 6 blanking source
    def self._6_blanking=(value : N6_BLANKING) : N6_BLANKING
      self.set(_6_blanking: value)
      value
    end

    enum N6OUT : UInt8
      # Non-inverting input below inverting input
      LOW = 0x0_u64

      # Non-inverting input above inverting input
      HIGH = 0x1_u64

      def self.reset_value : N6OUT
        N6_CSR.reset_value._6_out
      end
    end

    # Comparator 6 output
    def _6_out : N6OUT
      N6OUT.new!((@value >> 30) & 0x1_u32)
    end

    # Comparator 6 output
    def self._6_out : N6OUT
      value._6_out
    end

    enum N6LOCK : UInt8
      # Comparator CSR bits are read-write
      UNLOCKED = 0x0_u64

      # Comparator CSR bits are read-only
      LOCKED = 0x1_u64

      def self.reset_value : N6LOCK
        N6_CSR.reset_value._6_lock
      end
    end

    # Comparator 6 lock
    def _6_lock : N6LOCK
      N6LOCK.new!((@value >> 31) & 0x1_u32)
    end

    # Comparator 6 lock
    def self._6_lock : N6LOCK
      value._6_lock
    end

    # Comparator 6 lock
    def self._6_lock=(value : N6LOCK) : N6LOCK
      self.set(_6_lock: value)
      value
    end

    # Comparator 6 window mode
    def _6_winmode : Bool
      @value.bits_set?(0x200_u32)
    end

    # Comparator 6 window mode
    def self._6_winmode : Bool
      value._6_winmode
    end

    # Comparator 6 window mode
    def self._6_winmode=(value : Bool) : Bool
      self.set(_6_winmode: value)
      value
    end

    # Comparator 6 mode
    def _6_mode : UInt8
      UInt8.new!((@value >> 2) & 0x3_u32)
    end

    # Comparator 6 mode
    def self._6_mode : UInt8
      value._6_mode
    end

    # Comparator 6 mode
    def self._6_mode=(value : UInt8) : UInt8
      self.set(_6_mode: value)
      value
    end

    # Comparator 6 non inverted input
    def _6_inpsel : Bool
      @value.bits_set?(0x80_u32)
    end

    # Comparator 6 non inverted input
    def self._6_inpsel : Bool
      value._6_inpsel
    end

    # Comparator 6 non inverted input
    def self._6_inpsel=(value : Bool) : Bool
      self.set(_6_inpsel: value)
      value
    end

    # Comparator 6 hysteresis
    def _6_hyst : UInt8
      UInt8.new!((@value >> 16) & 0x3_u32)
    end

    # Comparator 6 hysteresis
    def self._6_hyst : UInt8
      value._6_hyst
    end

    # Comparator 6 hysteresis
    def self._6_hyst=(value : UInt8) : UInt8
      self.set(_6_hyst: value)
      value
    end

    # Comparator 6 inverting input selection
    def _6_inmsel3 : Bool
      @value.bits_set?(0x400000_u32)
    end

    # Comparator 6 inverting input selection
    def self._6_inmsel3 : Bool
      value._6_inmsel3
    end

    # Comparator 6 inverting input selection
    def self._6_inmsel3=(value : Bool) : Bool
      self.set(_6_inmsel3: value)
      value
    end

    def copy_with(
      *,

      _6_en : N6EN? = nil,

      _6_inmsel : N6INMSEL? = nil,

      _6_outsel : N6OUTSEL? = nil,

      _6_pol : N6POL? = nil,

      _6_blanking : N6_BLANKING? = nil,

      _6_lock : N6LOCK? = nil,

      _6_winmode : Bool? = nil,

      _6_mode : UInt8? = nil,

      _6_inpsel : Bool? = nil,

      _6_hyst : UInt8? = nil,

      _6_inmsel3 : Bool? = nil
    ) : self
      value = @value

      unless _6_en.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(_6_en.to_int).&(0x1_u32) << 0
      end

      unless _6_inmsel.nil?
        value = (value & 0xffffff8f_u32) |
                UInt32.new!(_6_inmsel.to_int).&(0x7_u32) << 4
      end

      unless _6_outsel.nil?
        value = (value & 0xffffc3ff_u32) |
                UInt32.new!(_6_outsel.to_int).&(0xf_u32) << 10
      end

      unless _6_pol.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(_6_pol.to_int).&(0x1_u32) << 15
      end

      unless _6_blanking.nil?
        value = (value & 0xffe3ffff_u32) |
                UInt32.new!(_6_blanking.to_int).&(0x7_u32) << 18
      end

      unless _6_lock.nil?
        value = (value & 0x7fffffff_u32) |
                UInt32.new!(_6_lock.to_int).&(0x1_u32) << 31
      end

      unless _6_winmode.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(_6_winmode.to_int).&(0x1_u32) << 9
      end

      unless _6_mode.nil?
        value = (value & 0xfffffff3_u32) |
                UInt32.new!(_6_mode.to_int).&(0x3_u32) << 2
      end

      unless _6_inpsel.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(_6_inpsel.to_int).&(0x1_u32) << 7
      end

      unless _6_hyst.nil?
        value = (value & 0xfffcffff_u32) |
                UInt32.new!(_6_hyst.to_int).&(0x3_u32) << 16
      end

      unless _6_inmsel3.nil?
        value = (value & 0xffbfffff_u32) |
                UInt32.new!(_6_inmsel3.to_int).&(0x1_u32) << 22
      end

      self.class.new(value)
    end

    def self.set(
      *,
      _6_en : N6EN? = nil,
      _6_inmsel : N6INMSEL? = nil,
      _6_outsel : N6OUTSEL? = nil,
      _6_pol : N6POL? = nil,
      _6_blanking : N6_BLANKING? = nil,
      _6_lock : N6LOCK? = nil,
      _6_winmode : Bool? = nil,
      _6_mode : UInt8? = nil,
      _6_inpsel : Bool? = nil,
      _6_hyst : UInt8? = nil,
      _6_inmsel3 : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        _6_en: _6_en,
        _6_inmsel: _6_inmsel,
        _6_outsel: _6_outsel,
        _6_pol: _6_pol,
        _6_blanking: _6_blanking,
        _6_lock: _6_lock,
        _6_winmode: _6_winmode,
        _6_mode: _6_mode,
        _6_inpsel: _6_inpsel,
        _6_hyst: _6_hyst,
        _6_inmsel3: _6_inmsel3,
      )
    end
  end # struct

  # control and status register
  struct N3_CSR
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

    # Comparator 3 enable
    def _3_en : Bool
      @value.bits_set?(0x1_u32)
    end

    # Comparator 3 enable
    def self._3_en : Bool
      value._3_en
    end

    # Comparator 3 enable
    def self._3_en=(value : Bool) : Bool
      self.set(_3_en: value)
      value
    end

    # Comparator 3 mode
    def _3_mode : UInt8
      UInt8.new!((@value >> 2) & 0x3_u32)
    end

    # Comparator 3 mode
    def self._3_mode : UInt8
      value._3_mode
    end

    # Comparator 3 mode
    def self._3_mode=(value : UInt8) : UInt8
      self.set(_3_mode: value)
      value
    end

    # Comparator 3 inverting input selection
    def _3_inmsel : UInt8
      UInt8.new!((@value >> 4) & 0x7_u32)
    end

    # Comparator 3 inverting input selection
    def self._3_inmsel : UInt8
      value._3_inmsel
    end

    # Comparator 3 inverting input selection
    def self._3_inmsel=(value : UInt8) : UInt8
      self.set(_3_inmsel: value)
      value
    end

    # Comparator 3 non inverted input
    def _3_inpsel : Bool
      @value.bits_set?(0x80_u32)
    end

    # Comparator 3 non inverted input
    def self._3_inpsel : Bool
      value._3_inpsel
    end

    # Comparator 3 non inverted input
    def self._3_inpsel=(value : Bool) : Bool
      self.set(_3_inpsel: value)
      value
    end

    # Comparator 3 output selection
    def _3_outsel : UInt8
      UInt8.new!((@value >> 10) & 0xf_u32)
    end

    # Comparator 3 output selection
    def self._3_outsel : UInt8
      value._3_outsel
    end

    # Comparator 3 output selection
    def self._3_outsel=(value : UInt8) : UInt8
      self.set(_3_outsel: value)
      value
    end

    # Comparator 3 output polarity
    def _3_pol : Bool
      @value.bits_set?(0x8000_u32)
    end

    # Comparator 3 output polarity
    def self._3_pol : Bool
      value._3_pol
    end

    # Comparator 3 output polarity
    def self._3_pol=(value : Bool) : Bool
      self.set(_3_pol: value)
      value
    end

    # Comparator 3 hysteresis
    def _3_hyst : UInt8
      UInt8.new!((@value >> 16) & 0x3_u32)
    end

    # Comparator 3 hysteresis
    def self._3_hyst : UInt8
      value._3_hyst
    end

    # Comparator 3 hysteresis
    def self._3_hyst=(value : UInt8) : UInt8
      self.set(_3_hyst: value)
      value
    end

    # Comparator 3 blanking source
    def _3_blanking : UInt8
      UInt8.new!((@value >> 18) & 0x7_u32)
    end

    # Comparator 3 blanking source
    def self._3_blanking : UInt8
      value._3_blanking
    end

    # Comparator 3 blanking source
    def self._3_blanking=(value : UInt8) : UInt8
      self.set(_3_blanking: value)
      value
    end

    # Comparator 3 output
    def _3_out : Bool
      @value.bits_set?(0x40000000_u32)
    end

    # Comparator 3 output
    def self._3_out : Bool
      value._3_out
    end

    # Comparator 3 lock
    def _3_lock : Bool
      @value.bits_set?(0x80000000_u32)
    end

    # Comparator 3 lock
    def self._3_lock : Bool
      value._3_lock
    end

    # Comparator 3 lock
    def self._3_lock=(value : Bool) : Bool
      self.set(_3_lock: value)
      value
    end

    def copy_with(
      *,

      _3_en : Bool? = nil,

      _3_mode : UInt8? = nil,

      _3_inmsel : UInt8? = nil,

      _3_inpsel : Bool? = nil,

      _3_outsel : UInt8? = nil,

      _3_pol : Bool? = nil,

      _3_hyst : UInt8? = nil,

      _3_blanking : UInt8? = nil,

      _3_lock : Bool? = nil
    ) : self
      value = @value

      unless _3_en.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(_3_en.to_int).&(0x1_u32) << 0
      end

      unless _3_mode.nil?
        value = (value & 0xfffffff3_u32) |
                UInt32.new!(_3_mode.to_int).&(0x3_u32) << 2
      end

      unless _3_inmsel.nil?
        value = (value & 0xffffff8f_u32) |
                UInt32.new!(_3_inmsel.to_int).&(0x7_u32) << 4
      end

      unless _3_inpsel.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(_3_inpsel.to_int).&(0x1_u32) << 7
      end

      unless _3_outsel.nil?
        value = (value & 0xffffc3ff_u32) |
                UInt32.new!(_3_outsel.to_int).&(0xf_u32) << 10
      end

      unless _3_pol.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(_3_pol.to_int).&(0x1_u32) << 15
      end

      unless _3_hyst.nil?
        value = (value & 0xfffcffff_u32) |
                UInt32.new!(_3_hyst.to_int).&(0x3_u32) << 16
      end

      unless _3_blanking.nil?
        value = (value & 0xffe3ffff_u32) |
                UInt32.new!(_3_blanking.to_int).&(0x7_u32) << 18
      end

      unless _3_lock.nil?
        value = (value & 0x7fffffff_u32) |
                UInt32.new!(_3_lock.to_int).&(0x1_u32) << 31
      end

      self.class.new(value)
    end

    def self.set(
      *,
      _3_en : Bool? = nil,
      _3_mode : UInt8? = nil,
      _3_inmsel : UInt8? = nil,
      _3_inpsel : Bool? = nil,
      _3_outsel : UInt8? = nil,
      _3_pol : Bool? = nil,
      _3_hyst : UInt8? = nil,
      _3_blanking : UInt8? = nil,
      _3_lock : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        _3_en: _3_en,
        _3_mode: _3_mode,
        _3_inmsel: _3_inmsel,
        _3_inpsel: _3_inpsel,
        _3_outsel: _3_outsel,
        _3_pol: _3_pol,
        _3_hyst: _3_hyst,
        _3_blanking: _3_blanking,
        _3_lock: _3_lock,
      )
    end
  end # struct

  # control and status register
  struct N5_CSR
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

    # Comparator 5 enable
    def _5_en : Bool
      @value.bits_set?(0x1_u32)
    end

    # Comparator 5 enable
    def self._5_en : Bool
      value._5_en
    end

    # Comparator 5 enable
    def self._5_en=(value : Bool) : Bool
      self.set(_5_en: value)
      value
    end

    # Comparator 5 mode
    def _5_mode : UInt8
      UInt8.new!((@value >> 2) & 0x3_u32)
    end

    # Comparator 5 mode
    def self._5_mode : UInt8
      value._5_mode
    end

    # Comparator 5 mode
    def self._5_mode=(value : UInt8) : UInt8
      self.set(_5_mode: value)
      value
    end

    # Comparator 5 inverting input selection
    def _5_inmsel : UInt8
      UInt8.new!((@value >> 4) & 0x7_u32)
    end

    # Comparator 5 inverting input selection
    def self._5_inmsel : UInt8
      value._5_inmsel
    end

    # Comparator 5 inverting input selection
    def self._5_inmsel=(value : UInt8) : UInt8
      self.set(_5_inmsel: value)
      value
    end

    # Comparator 5 non inverted input
    def _5_inpsel : Bool
      @value.bits_set?(0x80_u32)
    end

    # Comparator 5 non inverted input
    def self._5_inpsel : Bool
      value._5_inpsel
    end

    # Comparator 5 non inverted input
    def self._5_inpsel=(value : Bool) : Bool
      self.set(_5_inpsel: value)
      value
    end

    # Comparator 5 output selection
    def _5_outsel : UInt8
      UInt8.new!((@value >> 10) & 0xf_u32)
    end

    # Comparator 5 output selection
    def self._5_outsel : UInt8
      value._5_outsel
    end

    # Comparator 5 output selection
    def self._5_outsel=(value : UInt8) : UInt8
      self.set(_5_outsel: value)
      value
    end

    # Comparator 5 output polarity
    def _5_pol : Bool
      @value.bits_set?(0x8000_u32)
    end

    # Comparator 5 output polarity
    def self._5_pol : Bool
      value._5_pol
    end

    # Comparator 5 output polarity
    def self._5_pol=(value : Bool) : Bool
      self.set(_5_pol: value)
      value
    end

    # Comparator 5 hysteresis
    def _5_hyst : UInt8
      UInt8.new!((@value >> 16) & 0x3_u32)
    end

    # Comparator 5 hysteresis
    def self._5_hyst : UInt8
      value._5_hyst
    end

    # Comparator 5 hysteresis
    def self._5_hyst=(value : UInt8) : UInt8
      self.set(_5_hyst: value)
      value
    end

    # Comparator 5 blanking source
    def _5_blanking : UInt8
      UInt8.new!((@value >> 18) & 0x7_u32)
    end

    # Comparator 5 blanking source
    def self._5_blanking : UInt8
      value._5_blanking
    end

    # Comparator 5 blanking source
    def self._5_blanking=(value : UInt8) : UInt8
      self.set(_5_blanking: value)
      value
    end

    # Comparator 5 output
    def _5_out : Bool
      @value.bits_set?(0x40000000_u32)
    end

    # Comparator 5 output
    def self._5_out : Bool
      value._5_out
    end

    # Comparator 5 lock
    def _5_lock : Bool
      @value.bits_set?(0x80000000_u32)
    end

    # Comparator 5 lock
    def self._5_lock : Bool
      value._5_lock
    end

    # Comparator 5 lock
    def self._5_lock=(value : Bool) : Bool
      self.set(_5_lock: value)
      value
    end

    def copy_with(
      *,

      _5_en : Bool? = nil,

      _5_mode : UInt8? = nil,

      _5_inmsel : UInt8? = nil,

      _5_inpsel : Bool? = nil,

      _5_outsel : UInt8? = nil,

      _5_pol : Bool? = nil,

      _5_hyst : UInt8? = nil,

      _5_blanking : UInt8? = nil,

      _5_lock : Bool? = nil
    ) : self
      value = @value

      unless _5_en.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(_5_en.to_int).&(0x1_u32) << 0
      end

      unless _5_mode.nil?
        value = (value & 0xfffffff3_u32) |
                UInt32.new!(_5_mode.to_int).&(0x3_u32) << 2
      end

      unless _5_inmsel.nil?
        value = (value & 0xffffff8f_u32) |
                UInt32.new!(_5_inmsel.to_int).&(0x7_u32) << 4
      end

      unless _5_inpsel.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(_5_inpsel.to_int).&(0x1_u32) << 7
      end

      unless _5_outsel.nil?
        value = (value & 0xffffc3ff_u32) |
                UInt32.new!(_5_outsel.to_int).&(0xf_u32) << 10
      end

      unless _5_pol.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(_5_pol.to_int).&(0x1_u32) << 15
      end

      unless _5_hyst.nil?
        value = (value & 0xfffcffff_u32) |
                UInt32.new!(_5_hyst.to_int).&(0x3_u32) << 16
      end

      unless _5_blanking.nil?
        value = (value & 0xffe3ffff_u32) |
                UInt32.new!(_5_blanking.to_int).&(0x7_u32) << 18
      end

      unless _5_lock.nil?
        value = (value & 0x7fffffff_u32) |
                UInt32.new!(_5_lock.to_int).&(0x1_u32) << 31
      end

      self.class.new(value)
    end

    def self.set(
      *,
      _5_en : Bool? = nil,
      _5_mode : UInt8? = nil,
      _5_inmsel : UInt8? = nil,
      _5_inpsel : Bool? = nil,
      _5_outsel : UInt8? = nil,
      _5_pol : Bool? = nil,
      _5_hyst : UInt8? = nil,
      _5_blanking : UInt8? = nil,
      _5_lock : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        _5_en: _5_en,
        _5_mode: _5_mode,
        _5_inmsel: _5_inmsel,
        _5_inpsel: _5_inpsel,
        _5_outsel: _5_outsel,
        _5_pol: _5_pol,
        _5_hyst: _5_hyst,
        _5_blanking: _5_blanking,
        _5_lock: _5_lock,
      )
    end
  end # struct

  # control and status register
  struct N7_CSR
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

    # Comparator 7 enable
    def _7_en : Bool
      @value.bits_set?(0x1_u32)
    end

    # Comparator 7 enable
    def self._7_en : Bool
      value._7_en
    end

    # Comparator 7 enable
    def self._7_en=(value : Bool) : Bool
      self.set(_7_en: value)
      value
    end

    # Comparator 7 mode
    def _7_mode : UInt8
      UInt8.new!((@value >> 2) & 0x3_u32)
    end

    # Comparator 7 mode
    def self._7_mode : UInt8
      value._7_mode
    end

    # Comparator 7 mode
    def self._7_mode=(value : UInt8) : UInt8
      self.set(_7_mode: value)
      value
    end

    # Comparator 7 inverting input selection
    def _7_inmsel : UInt8
      UInt8.new!((@value >> 4) & 0x7_u32)
    end

    # Comparator 7 inverting input selection
    def self._7_inmsel : UInt8
      value._7_inmsel
    end

    # Comparator 7 inverting input selection
    def self._7_inmsel=(value : UInt8) : UInt8
      self.set(_7_inmsel: value)
      value
    end

    # Comparator 7 non inverted input
    def _7_inpsel : Bool
      @value.bits_set?(0x80_u32)
    end

    # Comparator 7 non inverted input
    def self._7_inpsel : Bool
      value._7_inpsel
    end

    # Comparator 7 non inverted input
    def self._7_inpsel=(value : Bool) : Bool
      self.set(_7_inpsel: value)
      value
    end

    # Comparator 7 output selection
    def _7_outsel : UInt8
      UInt8.new!((@value >> 10) & 0xf_u32)
    end

    # Comparator 7 output selection
    def self._7_outsel : UInt8
      value._7_outsel
    end

    # Comparator 7 output selection
    def self._7_outsel=(value : UInt8) : UInt8
      self.set(_7_outsel: value)
      value
    end

    # Comparator 7 output polarity
    def _7_pol : Bool
      @value.bits_set?(0x8000_u32)
    end

    # Comparator 7 output polarity
    def self._7_pol : Bool
      value._7_pol
    end

    # Comparator 7 output polarity
    def self._7_pol=(value : Bool) : Bool
      self.set(_7_pol: value)
      value
    end

    # Comparator 7 hysteresis
    def _7_hyst : UInt8
      UInt8.new!((@value >> 16) & 0x3_u32)
    end

    # Comparator 7 hysteresis
    def self._7_hyst : UInt8
      value._7_hyst
    end

    # Comparator 7 hysteresis
    def self._7_hyst=(value : UInt8) : UInt8
      self.set(_7_hyst: value)
      value
    end

    # Comparator 7 blanking source
    def _7_blanking : UInt8
      UInt8.new!((@value >> 18) & 0x7_u32)
    end

    # Comparator 7 blanking source
    def self._7_blanking : UInt8
      value._7_blanking
    end

    # Comparator 7 blanking source
    def self._7_blanking=(value : UInt8) : UInt8
      self.set(_7_blanking: value)
      value
    end

    # Comparator 7 output
    def _7_out : Bool
      @value.bits_set?(0x40000000_u32)
    end

    # Comparator 7 output
    def self._7_out : Bool
      value._7_out
    end

    # Comparator 7 lock
    def _7_lock : Bool
      @value.bits_set?(0x80000000_u32)
    end

    # Comparator 7 lock
    def self._7_lock : Bool
      value._7_lock
    end

    # Comparator 7 lock
    def self._7_lock=(value : Bool) : Bool
      self.set(_7_lock: value)
      value
    end

    def copy_with(
      *,

      _7_en : Bool? = nil,

      _7_mode : UInt8? = nil,

      _7_inmsel : UInt8? = nil,

      _7_inpsel : Bool? = nil,

      _7_outsel : UInt8? = nil,

      _7_pol : Bool? = nil,

      _7_hyst : UInt8? = nil,

      _7_blanking : UInt8? = nil,

      _7_lock : Bool? = nil
    ) : self
      value = @value

      unless _7_en.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(_7_en.to_int).&(0x1_u32) << 0
      end

      unless _7_mode.nil?
        value = (value & 0xfffffff3_u32) |
                UInt32.new!(_7_mode.to_int).&(0x3_u32) << 2
      end

      unless _7_inmsel.nil?
        value = (value & 0xffffff8f_u32) |
                UInt32.new!(_7_inmsel.to_int).&(0x7_u32) << 4
      end

      unless _7_inpsel.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(_7_inpsel.to_int).&(0x1_u32) << 7
      end

      unless _7_outsel.nil?
        value = (value & 0xffffc3ff_u32) |
                UInt32.new!(_7_outsel.to_int).&(0xf_u32) << 10
      end

      unless _7_pol.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(_7_pol.to_int).&(0x1_u32) << 15
      end

      unless _7_hyst.nil?
        value = (value & 0xfffcffff_u32) |
                UInt32.new!(_7_hyst.to_int).&(0x3_u32) << 16
      end

      unless _7_blanking.nil?
        value = (value & 0xffe3ffff_u32) |
                UInt32.new!(_7_blanking.to_int).&(0x7_u32) << 18
      end

      unless _7_lock.nil?
        value = (value & 0x7fffffff_u32) |
                UInt32.new!(_7_lock.to_int).&(0x1_u32) << 31
      end

      self.class.new(value)
    end

    def self.set(
      *,
      _7_en : Bool? = nil,
      _7_mode : UInt8? = nil,
      _7_inmsel : UInt8? = nil,
      _7_inpsel : Bool? = nil,
      _7_outsel : UInt8? = nil,
      _7_pol : Bool? = nil,
      _7_hyst : UInt8? = nil,
      _7_blanking : UInt8? = nil,
      _7_lock : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        _7_en: _7_en,
        _7_mode: _7_mode,
        _7_inmsel: _7_inmsel,
        _7_inpsel: _7_inpsel,
        _7_outsel: _7_outsel,
        _7_pol: _7_pol,
        _7_hyst: _7_hyst,
        _7_blanking: _7_blanking,
        _7_lock: _7_lock,
      )
    end
  end # struct

  # control and status register
  struct N1_CSR
    ADDRESS = BASE_ADDRESS + 0x1c_u64

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

    # Comparator 1 enable
    def _1_en : Bool
      @value.bits_set?(0x1_u32)
    end

    # Comparator 1 enable
    def self._1_en : Bool
      value._1_en
    end

    # Comparator 1 enable
    def self._1_en=(value : Bool) : Bool
      self.set(_1_en: value)
      value
    end

    # Comparator 1 non inverting input connection to DAC output
    def _1_inp_dac : Bool
      @value.bits_set?(0x2_u32)
    end

    # Comparator 1 non inverting input connection to DAC output
    def self._1_inp_dac : Bool
      value._1_inp_dac
    end

    # Comparator 1 non inverting input connection to DAC output
    def self._1_inp_dac=(value : Bool) : Bool
      self.set(_1_inp_dac: value)
      value
    end

    # Comparator 1 mode
    def _1_mode : UInt8
      UInt8.new!((@value >> 2) & 0x3_u32)
    end

    # Comparator 1 mode
    def self._1_mode : UInt8
      value._1_mode
    end

    # Comparator 1 mode
    def self._1_mode=(value : UInt8) : UInt8
      self.set(_1_mode: value)
      value
    end

    # Comparator 1 inverting input selection
    def _1_inmsel : UInt8
      UInt8.new!((@value >> 4) & 0x7_u32)
    end

    # Comparator 1 inverting input selection
    def self._1_inmsel : UInt8
      value._1_inmsel
    end

    # Comparator 1 inverting input selection
    def self._1_inmsel=(value : UInt8) : UInt8
      self.set(_1_inmsel: value)
      value
    end

    # Comparator 1 output selection
    def _1_outsel : UInt8
      UInt8.new!((@value >> 10) & 0xf_u32)
    end

    # Comparator 1 output selection
    def self._1_outsel : UInt8
      value._1_outsel
    end

    # Comparator 1 output selection
    def self._1_outsel=(value : UInt8) : UInt8
      self.set(_1_outsel: value)
      value
    end

    # Comparator 1 output polarity
    def _1_pol : Bool
      @value.bits_set?(0x8000_u32)
    end

    # Comparator 1 output polarity
    def self._1_pol : Bool
      value._1_pol
    end

    # Comparator 1 output polarity
    def self._1_pol=(value : Bool) : Bool
      self.set(_1_pol: value)
      value
    end

    # Comparator 1 hysteresis
    def _1_hyst : UInt8
      UInt8.new!((@value >> 16) & 0x3_u32)
    end

    # Comparator 1 hysteresis
    def self._1_hyst : UInt8
      value._1_hyst
    end

    # Comparator 1 hysteresis
    def self._1_hyst=(value : UInt8) : UInt8
      self.set(_1_hyst: value)
      value
    end

    # Comparator 1 blanking source
    def _1_blanking : UInt8
      UInt8.new!((@value >> 18) & 0x7_u32)
    end

    # Comparator 1 blanking source
    def self._1_blanking : UInt8
      value._1_blanking
    end

    # Comparator 1 blanking source
    def self._1_blanking=(value : UInt8) : UInt8
      self.set(_1_blanking: value)
      value
    end

    # Comparator 1 output
    def _1_out : Bool
      @value.bits_set?(0x40000000_u32)
    end

    # Comparator 1 output
    def self._1_out : Bool
      value._1_out
    end

    # Comparator 1 lock
    def _1_lock : Bool
      @value.bits_set?(0x80000000_u32)
    end

    # Comparator 1 lock
    def self._1_lock : Bool
      value._1_lock
    end

    # Comparator 1 lock
    def self._1_lock=(value : Bool) : Bool
      self.set(_1_lock: value)
      value
    end

    def copy_with(
      *,

      _1_en : Bool? = nil,

      _1_inp_dac : Bool? = nil,

      _1_mode : UInt8? = nil,

      _1_inmsel : UInt8? = nil,

      _1_outsel : UInt8? = nil,

      _1_pol : Bool? = nil,

      _1_hyst : UInt8? = nil,

      _1_blanking : UInt8? = nil,

      _1_lock : Bool? = nil
    ) : self
      value = @value

      unless _1_en.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(_1_en.to_int).&(0x1_u32) << 0
      end

      unless _1_inp_dac.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(_1_inp_dac.to_int).&(0x1_u32) << 1
      end

      unless _1_mode.nil?
        value = (value & 0xfffffff3_u32) |
                UInt32.new!(_1_mode.to_int).&(0x3_u32) << 2
      end

      unless _1_inmsel.nil?
        value = (value & 0xffffff8f_u32) |
                UInt32.new!(_1_inmsel.to_int).&(0x7_u32) << 4
      end

      unless _1_outsel.nil?
        value = (value & 0xffffc3ff_u32) |
                UInt32.new!(_1_outsel.to_int).&(0xf_u32) << 10
      end

      unless _1_pol.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(_1_pol.to_int).&(0x1_u32) << 15
      end

      unless _1_hyst.nil?
        value = (value & 0xfffcffff_u32) |
                UInt32.new!(_1_hyst.to_int).&(0x3_u32) << 16
      end

      unless _1_blanking.nil?
        value = (value & 0xffe3ffff_u32) |
                UInt32.new!(_1_blanking.to_int).&(0x7_u32) << 18
      end

      unless _1_lock.nil?
        value = (value & 0x7fffffff_u32) |
                UInt32.new!(_1_lock.to_int).&(0x1_u32) << 31
      end

      self.class.new(value)
    end

    def self.set(
      *,
      _1_en : Bool? = nil,
      _1_inp_dac : Bool? = nil,
      _1_mode : UInt8? = nil,
      _1_inmsel : UInt8? = nil,
      _1_outsel : UInt8? = nil,
      _1_pol : Bool? = nil,
      _1_hyst : UInt8? = nil,
      _1_blanking : UInt8? = nil,
      _1_lock : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        _1_en: _1_en,
        _1_inp_dac: _1_inp_dac,
        _1_mode: _1_mode,
        _1_inmsel: _1_inmsel,
        _1_outsel: _1_outsel,
        _1_pol: _1_pol,
        _1_hyst: _1_hyst,
        _1_blanking: _1_blanking,
        _1_lock: _1_lock,
      )
    end
  end # struct

end
