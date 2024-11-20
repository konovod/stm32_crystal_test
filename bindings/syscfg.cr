# System configuration controller
module SYSCFG
  VERSION      = nil
  BASE_ADDRESS = 0x40010000_u64

  # configuration register 1
  struct CFGR1
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

    enum MEM_MODE : UInt8
      # Main Flash memory mapped at 0x0000_0000
      MAINFLASH = 0x0_u64

      # System Flash memory mapped at 0x0000_0000
      SYSTEMFLASH = 0x1_u64

      # Embedded SRAM mapped at 0x0000_0000
      SRAM = 0x3_u64

      # FMC Bank (Only the first  two banks) (Available on STM32F303xD/E only)
      FMC = 0x4_u64

      def self.reset_value : MEM_MODE
        CFGR1.reset_value.mem_mode
      end
    end

    # Memory mapping selection              bits
    def mem_mode : MEM_MODE
      MEM_MODE.new!((@value >> 0) & 0x7_u32)
    end

    # Memory mapping selection              bits
    def self.mem_mode : MEM_MODE
      value.mem_mode
    end

    # Memory mapping selection              bits
    def self.mem_mode=(value : MEM_MODE) : MEM_MODE
      self.set(mem_mode: value)
      value
    end

    enum USB_IT_RMP : UInt8
      # USB_HP, USB_LP and USB_WAKEUP interrupts are mapped on interrupt lines 19, 20 and 42 respectively
      NOTREMAPPED = 0x0_u64

      # USB_HP, USB_LP and USB_WAKEUP interrupts are mapped on interrupt lines 74, 75 and 76 respectively
      REMAPPED = 0x1_u64

      def self.reset_value : USB_IT_RMP
        CFGR1.reset_value.usb_it_rmp
      end
    end

    # USB interrupt remap
    def usb_it_rmp : USB_IT_RMP
      USB_IT_RMP.new!((@value >> 5) & 0x1_u32)
    end

    # USB interrupt remap
    def self.usb_it_rmp : USB_IT_RMP
      value.usb_it_rmp
    end

    # USB interrupt remap
    def self.usb_it_rmp=(value : USB_IT_RMP) : USB_IT_RMP
      self.set(usb_it_rmp: value)
      value
    end

    enum TIM1_ITR3_RMP : UInt8
      # TIM1_ITR3 = TIM4_TRGO in STM32F303xB/C and STM32F358xC devices
      NOTREMAPPED = 0x0_u64

      # TIM1_ITR3 = TIM17_OC
      REMAPPED = 0x1_u64

      def self.reset_value : TIM1_ITR3_RMP
        CFGR1.reset_value.tim1_itr3_rmp
      end
    end

    # Timer 1 ITR3 selection
    def tim1_itr3_rmp : TIM1_ITR3_RMP
      TIM1_ITR3_RMP.new!((@value >> 6) & 0x1_u32)
    end

    # Timer 1 ITR3 selection
    def self.tim1_itr3_rmp : TIM1_ITR3_RMP
      value.tim1_itr3_rmp
    end

    # Timer 1 ITR3 selection
    def self.tim1_itr3_rmp=(value : TIM1_ITR3_RMP) : TIM1_ITR3_RMP
      self.set(tim1_itr3_rmp: value)
      value
    end

    enum DAC1_TRIG_RMP : UInt8
      # DAC trigger is TIM8_TRGO in STM32F303xB/C and STM32F358xC devices
      NOTREMAPPED = 0x0_u64

      # DAC trigger is TIM3_TRGO
      REMAPPED = 0x1_u64

      def self.reset_value : DAC1_TRIG_RMP
        CFGR1.reset_value.dac1_trig_rmp
      end
    end

    # DAC trigger remap (when TSEL =              001)
    def dac1_trig_rmp : DAC1_TRIG_RMP
      DAC1_TRIG_RMP.new!((@value >> 7) & 0x1_u32)
    end

    # DAC trigger remap (when TSEL =              001)
    def self.dac1_trig_rmp : DAC1_TRIG_RMP
      value.dac1_trig_rmp
    end

    # DAC trigger remap (when TSEL =              001)
    def self.dac1_trig_rmp=(value : DAC1_TRIG_RMP) : DAC1_TRIG_RMP
      self.set(dac1_trig_rmp: value)
      value
    end

    enum ADC2_DMA_RMP : UInt8
      # ADC24 DMA requests mapped on DMA2 channels 1 and 2
      NOTREMAPPED = 0x0_u64

      # ADC24 DMA requests mapped on DMA2 channels 3 and 4
      REMAPPED = 0x1_u64

      def self.reset_value : ADC2_DMA_RMP
        CFGR1.reset_value.adc2_dma_rmp
      end
    end

    # ADC24 DMA remapping bit
    def adc2_dma_rmp : ADC2_DMA_RMP
      ADC2_DMA_RMP.new!((@value >> 8) & 0x1_u32)
    end

    # ADC24 DMA remapping bit
    def self.adc2_dma_rmp : ADC2_DMA_RMP
      value.adc2_dma_rmp
    end

    # ADC24 DMA remapping bit
    def self.adc2_dma_rmp=(value : ADC2_DMA_RMP) : ADC2_DMA_RMP
      self.set(adc2_dma_rmp: value)
      value
    end

    enum TIM16_DMA_RMP : UInt8
      # TIM16_CH1 and TIM16_UP DMA requests mapped on DMA channel 3
      NOTREMAPPED = 0x0_u64

      # TIM16_CH1 and TIM16_UP DMA requests mapped on DMA channel 4
      REMAPPED = 0x1_u64

      def self.reset_value : TIM16_DMA_RMP
        CFGR1.reset_value.tim16_dma_rmp
      end
    end

    # TIM16 DMA request remapping              bit
    def tim16_dma_rmp : TIM16_DMA_RMP
      TIM16_DMA_RMP.new!((@value >> 11) & 0x1_u32)
    end

    # TIM16 DMA request remapping              bit
    def self.tim16_dma_rmp : TIM16_DMA_RMP
      value.tim16_dma_rmp
    end

    # TIM16 DMA request remapping              bit
    def self.tim16_dma_rmp=(value : TIM16_DMA_RMP) : TIM16_DMA_RMP
      self.set(tim16_dma_rmp: value)
      value
    end

    enum TIM17_DMA_RMP : UInt8
      # TIM17_CH1 and TIM17_UP DMA requests mapped on DMA channel 1
      NOTREMAPPED = 0x0_u64

      # TIM17_CH1 and TIM17_UP DMA requests mapped on DMA channel 2
      REMAPPED = 0x1_u64

      def self.reset_value : TIM17_DMA_RMP
        CFGR1.reset_value.tim17_dma_rmp
      end
    end

    # TIM17 DMA request remapping              bit
    def tim17_dma_rmp : TIM17_DMA_RMP
      TIM17_DMA_RMP.new!((@value >> 12) & 0x1_u32)
    end

    # TIM17 DMA request remapping              bit
    def self.tim17_dma_rmp : TIM17_DMA_RMP
      value.tim17_dma_rmp
    end

    # TIM17 DMA request remapping              bit
    def self.tim17_dma_rmp=(value : TIM17_DMA_RMP) : TIM17_DMA_RMP
      self.set(tim17_dma_rmp: value)
      value
    end

    enum TIM6_DAC1_CH1_DMA_RMP : UInt8
      # TIM6_UP and DAC_CH1 DMA requests mapped on DMA2 channel 3 in STM32F303xB/C and STM32F358xC
      NOTREMAPPED = 0x0_u64

      # TIM6_UP and DAC_CH1 DMA requests mapped on DMA1 channel 3
      REMAPPED = 0x1_u64

      def self.reset_value : TIM6_DAC1_CH1_DMA_RMP
        CFGR1.reset_value.tim6_dac1_ch1_dma_rmp
      end
    end

    # TIM6 and DAC1 DMA request remapping              bit
    def tim6_dac1_ch1_dma_rmp : TIM6_DAC1_CH1_DMA_RMP
      TIM6_DAC1_CH1_DMA_RMP.new!((@value >> 13) & 0x1_u32)
    end

    # TIM6 and DAC1 DMA request remapping              bit
    def self.tim6_dac1_ch1_dma_rmp : TIM6_DAC1_CH1_DMA_RMP
      value.tim6_dac1_ch1_dma_rmp
    end

    # TIM6 and DAC1 DMA request remapping              bit
    def self.tim6_dac1_ch1_dma_rmp=(value : TIM6_DAC1_CH1_DMA_RMP) : TIM6_DAC1_CH1_DMA_RMP
      self.set(tim6_dac1_ch1_dma_rmp: value)
      value
    end

    enum TIM7_DAC1_CH2_DMA_RMP : UInt8
      # TIM7_UP and DAC_CH2 DMA requests mapped on DMA2 channel 4 in STM32F303xB/C and STM32F358xC devices
      NOTREMAPPED = 0x0_u64

      # TIM7_UP and DAC_CH2 DMA requests mapped on DMA1 channel 4
      REMAPPED = 0x1_u64

      def self.reset_value : TIM7_DAC1_CH2_DMA_RMP
        CFGR1.reset_value.tim7_dac1_ch2_dma_rmp
      end
    end

    # TIM7 and DAC2 DMA request remapping              bit
    def tim7_dac1_ch2_dma_rmp : TIM7_DAC1_CH2_DMA_RMP
      TIM7_DAC1_CH2_DMA_RMP.new!((@value >> 14) & 0x1_u32)
    end

    # TIM7 and DAC2 DMA request remapping              bit
    def self.tim7_dac1_ch2_dma_rmp : TIM7_DAC1_CH2_DMA_RMP
      value.tim7_dac1_ch2_dma_rmp
    end

    # TIM7 and DAC2 DMA request remapping              bit
    def self.tim7_dac1_ch2_dma_rmp=(value : TIM7_DAC1_CH2_DMA_RMP) : TIM7_DAC1_CH2_DMA_RMP
      self.set(tim7_dac1_ch2_dma_rmp: value)
      value
    end

    enum I2C_PB6_FMP : UInt8
      # PB6 pin operate in standard mode
      STANDARD = 0x0_u64

      # I2C FM+ mode enabled on PB6 and the Speed control is bypassed
      FMP = 0x1_u64

      def self.reset_value : I2C_PB6_FMP
        CFGR1.reset_value.i2_c_pb6_fmp
      end
    end

    # Fast Mode Plus (FM+) driving capability              activation bits.
    def i2_c_pb6_fmp : I2C_PB6_FMP
      I2C_PB6_FMP.new!((@value >> 16) & 0x1_u32)
    end

    # Fast Mode Plus (FM+) driving capability              activation bits.
    def self.i2_c_pb6_fmp : I2C_PB6_FMP
      value.i2_c_pb6_fmp
    end

    # Fast Mode Plus (FM+) driving capability              activation bits.
    def self.i2_c_pb6_fmp=(value : I2C_PB6_FMP) : I2C_PB6_FMP
      self.set(i2_c_pb6_fmp: value)
      value
    end

    enum I2C_PB7_FMP : UInt8
      # PB7 pin operate in standard mode
      STANDARD = 0x0_u64

      # I2C FM+ mode enabled on PB7 and the Speed control is bypassed
      FMP = 0x1_u64

      def self.reset_value : I2C_PB7_FMP
        CFGR1.reset_value.i2_c_pb7_fmp
      end
    end

    # Fast Mode Plus (FM+) driving capability              activation bits.
    def i2_c_pb7_fmp : I2C_PB7_FMP
      I2C_PB7_FMP.new!((@value >> 17) & 0x1_u32)
    end

    # Fast Mode Plus (FM+) driving capability              activation bits.
    def self.i2_c_pb7_fmp : I2C_PB7_FMP
      value.i2_c_pb7_fmp
    end

    # Fast Mode Plus (FM+) driving capability              activation bits.
    def self.i2_c_pb7_fmp=(value : I2C_PB7_FMP) : I2C_PB7_FMP
      self.set(i2_c_pb7_fmp: value)
      value
    end

    enum I2C_PB8_FMP : UInt8
      # PB8 pin operate in standard mode
      STANDARD = 0x0_u64

      # I2C FM+ mode enabled on PB8 and the Speed control is bypassed
      FMP = 0x1_u64

      def self.reset_value : I2C_PB8_FMP
        CFGR1.reset_value.i2_c_pb8_fmp
      end
    end

    # Fast Mode Plus (FM+) driving capability              activation bits.
    def i2_c_pb8_fmp : I2C_PB8_FMP
      I2C_PB8_FMP.new!((@value >> 18) & 0x1_u32)
    end

    # Fast Mode Plus (FM+) driving capability              activation bits.
    def self.i2_c_pb8_fmp : I2C_PB8_FMP
      value.i2_c_pb8_fmp
    end

    # Fast Mode Plus (FM+) driving capability              activation bits.
    def self.i2_c_pb8_fmp=(value : I2C_PB8_FMP) : I2C_PB8_FMP
      self.set(i2_c_pb8_fmp: value)
      value
    end

    enum I2C_PB9_FMP : UInt8
      # PB9 pin operate in standard mode
      STANDARD = 0x0_u64

      # I2C FM+ mode enabled on PB9 and the Speed control is bypassed
      FMP = 0x1_u64

      def self.reset_value : I2C_PB9_FMP
        CFGR1.reset_value.i2_c_pb9_fmp
      end
    end

    # Fast Mode Plus (FM+) driving capability              activation bits.
    def i2_c_pb9_fmp : I2C_PB9_FMP
      I2C_PB9_FMP.new!((@value >> 19) & 0x1_u32)
    end

    # Fast Mode Plus (FM+) driving capability              activation bits.
    def self.i2_c_pb9_fmp : I2C_PB9_FMP
      value.i2_c_pb9_fmp
    end

    # Fast Mode Plus (FM+) driving capability              activation bits.
    def self.i2_c_pb9_fmp=(value : I2C_PB9_FMP) : I2C_PB9_FMP
      self.set(i2_c_pb9_fmp: value)
      value
    end

    enum I2C1_FMP : UInt8
      # FM+ mode is controlled by I2C_Pxx_FMP bits only
      STANDARD = 0x0_u64

      # FM+ mode is enabled on all I2C1 pins selected through selection through IOPORT control registers AF selection bits
      FMP = 0x1_u64

      def self.reset_value : I2C1_FMP
        CFGR1.reset_value.i2_c1_fmp
      end
    end

    # I2C1 Fast Mode Plus
    def i2_c1_fmp : I2C1_FMP
      I2C1_FMP.new!((@value >> 20) & 0x1_u32)
    end

    # I2C1 Fast Mode Plus
    def self.i2_c1_fmp : I2C1_FMP
      value.i2_c1_fmp
    end

    # I2C1 Fast Mode Plus
    def self.i2_c1_fmp=(value : I2C1_FMP) : I2C1_FMP
      self.set(i2_c1_fmp: value)
      value
    end

    enum I2C2_FMP : UInt8
      # FM+ mode is controlled by I2C_Pxx_FMP bits only
      STANDARD = 0x0_u64

      # FM+ mode is enabled on all I2C2 pins selected through selection through IOPORT control registers AF selection bits
      FMP = 0x1_u64

      def self.reset_value : I2C2_FMP
        CFGR1.reset_value.i2_c2_fmp
      end
    end

    # I2C2 Fast Mode Plus
    def i2_c2_fmp : I2C2_FMP
      I2C2_FMP.new!((@value >> 21) & 0x1_u32)
    end

    # I2C2 Fast Mode Plus
    def self.i2_c2_fmp : I2C2_FMP
      value.i2_c2_fmp
    end

    # I2C2 Fast Mode Plus
    def self.i2_c2_fmp=(value : I2C2_FMP) : I2C2_FMP
      self.set(i2_c2_fmp: value)
      value
    end

    enum ENCODER_MODE : UInt8
      # No redirection
      NOREDIRECTION = 0x0_u64

      # TIM2 IC1 and TIM2 IC2 are connected to TIM15 IC1 and TIM15 IC2 respectively
      MAPTIM2TIM15 = 0x1_u64

      # TIM3 IC1 and TIM3 IC2 are connected to TIM15 IC1 and TIM15 IC2 respectively
      MAPTIM3TIM15 = 0x2_u64

      # TIM4 IC1 and TIM4 IC2 are connected to TIM15 IC1 and TIM15 IC2 respectively (STM32F303xB/C and STM32F358xC devices only)
      MAPTIM4TIM15 = 0x3_u64

      def self.reset_value : ENCODER_MODE
        CFGR1.reset_value.encoder_mode
      end
    end

    # Encoder mode
    def encoder_mode : ENCODER_MODE
      ENCODER_MODE.new!((@value >> 22) & 0x3_u32)
    end

    # Encoder mode
    def self.encoder_mode : ENCODER_MODE
      value.encoder_mode
    end

    # Encoder mode
    def self.encoder_mode=(value : ENCODER_MODE) : ENCODER_MODE
      self.set(encoder_mode: value)
      value
    end

    enum FPU_IE5 : UInt8
      # Inexact interrupt disable
      DISABLED = 0x0_u64

      # Inexact interrupt enable
      ENABLED = 0x1_u64

      def self.reset_value : FPU_IE5
        CFGR1.reset_value.fpu_ie5
      end
    end

    # Inexact interrupt enable
    def fpu_ie5 : FPU_IE5
      FPU_IE5.new!((@value >> 31) & 0x1_u32)
    end

    # Inexact interrupt enable
    def self.fpu_ie5 : FPU_IE5
      value.fpu_ie5
    end

    # Inexact interrupt enable
    def self.fpu_ie5=(value : FPU_IE5) : FPU_IE5
      self.set(fpu_ie5: value)
      value
    end

    enum FPU_IE4 : UInt8
      # Input denormal interrupt disable
      DISABLED = 0x0_u64

      # Input denormal interrupt enable
      ENABLED = 0x1_u64

      def self.reset_value : FPU_IE4
        CFGR1.reset_value.fpu_ie4
      end
    end

    # Input denormal interrupt enable
    def fpu_ie4 : FPU_IE4
      FPU_IE4.new!((@value >> 30) & 0x1_u32)
    end

    # Input denormal interrupt enable
    def self.fpu_ie4 : FPU_IE4
      value.fpu_ie4
    end

    # Input denormal interrupt enable
    def self.fpu_ie4=(value : FPU_IE4) : FPU_IE4
      self.set(fpu_ie4: value)
      value
    end

    enum FPU_IE3 : UInt8
      # Overflow interrupt disable
      DISABLED = 0x0_u64

      # Overflow interrupt enable
      ENABLED = 0x1_u64

      def self.reset_value : FPU_IE3
        CFGR1.reset_value.fpu_ie3
      end
    end

    # Overflow interrupt enable
    def fpu_ie3 : FPU_IE3
      FPU_IE3.new!((@value >> 29) & 0x1_u32)
    end

    # Overflow interrupt enable
    def self.fpu_ie3 : FPU_IE3
      value.fpu_ie3
    end

    # Overflow interrupt enable
    def self.fpu_ie3=(value : FPU_IE3) : FPU_IE3
      self.set(fpu_ie3: value)
      value
    end

    enum FPU_IE2 : UInt8
      # Underflow interrupt disable
      DISABLED = 0x0_u64

      # Underflow interrupt enable
      ENABLED = 0x1_u64

      def self.reset_value : FPU_IE2
        CFGR1.reset_value.fpu_ie2
      end
    end

    # Underflow interrupt enable
    def fpu_ie2 : FPU_IE2
      FPU_IE2.new!((@value >> 28) & 0x1_u32)
    end

    # Underflow interrupt enable
    def self.fpu_ie2 : FPU_IE2
      value.fpu_ie2
    end

    # Underflow interrupt enable
    def self.fpu_ie2=(value : FPU_IE2) : FPU_IE2
      self.set(fpu_ie2: value)
      value
    end

    enum FPU_IE1 : UInt8
      # Devide-by-zero interrupt disable
      DISABLED = 0x0_u64

      # Devide-by-zero interrupt enable
      ENABLED = 0x1_u64

      def self.reset_value : FPU_IE1
        CFGR1.reset_value.fpu_ie1
      end
    end

    # Devide-by-zero interrupt enable
    def fpu_ie1 : FPU_IE1
      FPU_IE1.new!((@value >> 27) & 0x1_u32)
    end

    # Devide-by-zero interrupt enable
    def self.fpu_ie1 : FPU_IE1
      value.fpu_ie1
    end

    # Devide-by-zero interrupt enable
    def self.fpu_ie1=(value : FPU_IE1) : FPU_IE1
      self.set(fpu_ie1: value)
      value
    end

    enum FPU_IE0 : UInt8
      # Invalid operation interrupt disable
      DISABLED = 0x0_u64

      # Invalid operation interrupt enable
      ENABLED = 0x1_u64

      def self.reset_value : FPU_IE0
        CFGR1.reset_value.fpu_ie0
      end
    end

    # Invalid operation interrupt enable
    def fpu_ie0 : FPU_IE0
      FPU_IE0.new!((@value >> 26) & 0x1_u32)
    end

    # Invalid operation interrupt enable
    def self.fpu_ie0 : FPU_IE0
      value.fpu_ie0
    end

    # Invalid operation interrupt enable
    def self.fpu_ie0=(value : FPU_IE0) : FPU_IE0
      self.set(fpu_ie0: value)
      value
    end

    enum DAC2_CH1_DMA_RMP : UInt8
      # Not remapped
      NOTREMAPPED = 0x0_u64

      # DAC2_CH1 DMA requests mapped on DMA1 channel 5
      REMAPPED = 0x1_u64

      def self.reset_value : DAC2_CH1_DMA_RMP
        CFGR1.reset_value.dac2_ch1_dma_rmp
      end
    end

    # DAC2 channel1 DMA remap
    def dac2_ch1_dma_rmp : DAC2_CH1_DMA_RMP
      DAC2_CH1_DMA_RMP.new!((@value >> 15) & 0x1_u32)
    end

    # DAC2 channel1 DMA remap
    def self.dac2_ch1_dma_rmp : DAC2_CH1_DMA_RMP
      value.dac2_ch1_dma_rmp
    end

    # DAC2 channel1 DMA remap
    def self.dac2_ch1_dma_rmp=(value : DAC2_CH1_DMA_RMP) : DAC2_CH1_DMA_RMP
      self.set(dac2_ch1_dma_rmp: value)
      value
    end

    enum I2C3_FMP : UInt8
      # FM+ mode is controlled by I2C_Pxx_FMP bits only
      STANDARD = 0x0_u64

      # FM+ mode is enabled on all I2C3 pins selected through selection through IOPORT control registers AF selection bits
      FMP = 0x1_u64

      def self.reset_value : I2C3_FMP
        CFGR1.reset_value.i2_c3_fmp
      end
    end

    # I2C3 Fast Mode Plus
    def i2_c3_fmp : I2C3_FMP
      I2C3_FMP.new!((@value >> 24) & 0x1_u32)
    end

    # I2C3 Fast Mode Plus
    def self.i2_c3_fmp : I2C3_FMP
      value.i2_c3_fmp
    end

    # I2C3 Fast Mode Plus
    def self.i2_c3_fmp=(value : I2C3_FMP) : I2C3_FMP
      self.set(i2_c3_fmp: value)
      value
    end

    def copy_with(
      *,

      mem_mode : MEM_MODE? = nil,

      usb_it_rmp : USB_IT_RMP? = nil,

      tim1_itr3_rmp : TIM1_ITR3_RMP? = nil,

      dac1_trig_rmp : DAC1_TRIG_RMP? = nil,

      adc2_dma_rmp : ADC2_DMA_RMP? = nil,

      tim16_dma_rmp : TIM16_DMA_RMP? = nil,

      tim17_dma_rmp : TIM17_DMA_RMP? = nil,

      tim6_dac1_ch1_dma_rmp : TIM6_DAC1_CH1_DMA_RMP? = nil,

      tim7_dac1_ch2_dma_rmp : TIM7_DAC1_CH2_DMA_RMP? = nil,

      i2_c_pb6_fmp : I2C_PB6_FMP? = nil,

      i2_c_pb7_fmp : I2C_PB7_FMP? = nil,

      i2_c_pb8_fmp : I2C_PB8_FMP? = nil,

      i2_c_pb9_fmp : I2C_PB9_FMP? = nil,

      i2_c1_fmp : I2C1_FMP? = nil,

      i2_c2_fmp : I2C2_FMP? = nil,

      encoder_mode : ENCODER_MODE? = nil,

      fpu_ie5 : FPU_IE5? = nil,

      fpu_ie4 : FPU_IE4? = nil,

      fpu_ie3 : FPU_IE3? = nil,

      fpu_ie2 : FPU_IE2? = nil,

      fpu_ie1 : FPU_IE1? = nil,

      fpu_ie0 : FPU_IE0? = nil,

      dac2_ch1_dma_rmp : DAC2_CH1_DMA_RMP? = nil,

      i2_c3_fmp : I2C3_FMP? = nil
    ) : self
      value = @value

      unless mem_mode.nil?
        value = (value & 0xfffffff8_u32) |
                UInt32.new!(mem_mode.to_int).&(0x7_u32) << 0
      end

      unless usb_it_rmp.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(usb_it_rmp.to_int).&(0x1_u32) << 5
      end

      unless tim1_itr3_rmp.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(tim1_itr3_rmp.to_int).&(0x1_u32) << 6
      end

      unless dac1_trig_rmp.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(dac1_trig_rmp.to_int).&(0x1_u32) << 7
      end

      unless adc2_dma_rmp.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(adc2_dma_rmp.to_int).&(0x1_u32) << 8
      end

      unless tim16_dma_rmp.nil?
        value = (value & 0xfffff7ff_u32) |
                UInt32.new!(tim16_dma_rmp.to_int).&(0x1_u32) << 11
      end

      unless tim17_dma_rmp.nil?
        value = (value & 0xffffefff_u32) |
                UInt32.new!(tim17_dma_rmp.to_int).&(0x1_u32) << 12
      end

      unless tim6_dac1_ch1_dma_rmp.nil?
        value = (value & 0xffffdfff_u32) |
                UInt32.new!(tim6_dac1_ch1_dma_rmp.to_int).&(0x1_u32) << 13
      end

      unless tim7_dac1_ch2_dma_rmp.nil?
        value = (value & 0xffffbfff_u32) |
                UInt32.new!(tim7_dac1_ch2_dma_rmp.to_int).&(0x1_u32) << 14
      end

      unless i2_c_pb6_fmp.nil?
        value = (value & 0xfffeffff_u32) |
                UInt32.new!(i2_c_pb6_fmp.to_int).&(0x1_u32) << 16
      end

      unless i2_c_pb7_fmp.nil?
        value = (value & 0xfffdffff_u32) |
                UInt32.new!(i2_c_pb7_fmp.to_int).&(0x1_u32) << 17
      end

      unless i2_c_pb8_fmp.nil?
        value = (value & 0xfffbffff_u32) |
                UInt32.new!(i2_c_pb8_fmp.to_int).&(0x1_u32) << 18
      end

      unless i2_c_pb9_fmp.nil?
        value = (value & 0xfff7ffff_u32) |
                UInt32.new!(i2_c_pb9_fmp.to_int).&(0x1_u32) << 19
      end

      unless i2_c1_fmp.nil?
        value = (value & 0xffefffff_u32) |
                UInt32.new!(i2_c1_fmp.to_int).&(0x1_u32) << 20
      end

      unless i2_c2_fmp.nil?
        value = (value & 0xffdfffff_u32) |
                UInt32.new!(i2_c2_fmp.to_int).&(0x1_u32) << 21
      end

      unless encoder_mode.nil?
        value = (value & 0xff3fffff_u32) |
                UInt32.new!(encoder_mode.to_int).&(0x3_u32) << 22
      end

      unless fpu_ie5.nil?
        value = (value & 0x7fffffff_u32) |
                UInt32.new!(fpu_ie5.to_int).&(0x1_u32) << 31
      end

      unless fpu_ie4.nil?
        value = (value & 0xbfffffff_u32) |
                UInt32.new!(fpu_ie4.to_int).&(0x1_u32) << 30
      end

      unless fpu_ie3.nil?
        value = (value & 0xdfffffff_u32) |
                UInt32.new!(fpu_ie3.to_int).&(0x1_u32) << 29
      end

      unless fpu_ie2.nil?
        value = (value & 0xefffffff_u32) |
                UInt32.new!(fpu_ie2.to_int).&(0x1_u32) << 28
      end

      unless fpu_ie1.nil?
        value = (value & 0xf7ffffff_u32) |
                UInt32.new!(fpu_ie1.to_int).&(0x1_u32) << 27
      end

      unless fpu_ie0.nil?
        value = (value & 0xfbffffff_u32) |
                UInt32.new!(fpu_ie0.to_int).&(0x1_u32) << 26
      end

      unless dac2_ch1_dma_rmp.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(dac2_ch1_dma_rmp.to_int).&(0x1_u32) << 15
      end

      unless i2_c3_fmp.nil?
        value = (value & 0xfeffffff_u32) |
                UInt32.new!(i2_c3_fmp.to_int).&(0x1_u32) << 24
      end

      self.class.new(value)
    end

    def self.set(
      *,
      mem_mode : MEM_MODE? = nil,
      usb_it_rmp : USB_IT_RMP? = nil,
      tim1_itr3_rmp : TIM1_ITR3_RMP? = nil,
      dac1_trig_rmp : DAC1_TRIG_RMP? = nil,
      adc2_dma_rmp : ADC2_DMA_RMP? = nil,
      tim16_dma_rmp : TIM16_DMA_RMP? = nil,
      tim17_dma_rmp : TIM17_DMA_RMP? = nil,
      tim6_dac1_ch1_dma_rmp : TIM6_DAC1_CH1_DMA_RMP? = nil,
      tim7_dac1_ch2_dma_rmp : TIM7_DAC1_CH2_DMA_RMP? = nil,
      i2_c_pb6_fmp : I2C_PB6_FMP? = nil,
      i2_c_pb7_fmp : I2C_PB7_FMP? = nil,
      i2_c_pb8_fmp : I2C_PB8_FMP? = nil,
      i2_c_pb9_fmp : I2C_PB9_FMP? = nil,
      i2_c1_fmp : I2C1_FMP? = nil,
      i2_c2_fmp : I2C2_FMP? = nil,
      encoder_mode : ENCODER_MODE? = nil,
      fpu_ie5 : FPU_IE5? = nil,
      fpu_ie4 : FPU_IE4? = nil,
      fpu_ie3 : FPU_IE3? = nil,
      fpu_ie2 : FPU_IE2? = nil,
      fpu_ie1 : FPU_IE1? = nil,
      fpu_ie0 : FPU_IE0? = nil,
      dac2_ch1_dma_rmp : DAC2_CH1_DMA_RMP? = nil,
      i2_c3_fmp : I2C3_FMP? = nil
    ) : Nil
      self.value = self.value.copy_with(
        mem_mode: mem_mode,
        usb_it_rmp: usb_it_rmp,
        tim1_itr3_rmp: tim1_itr3_rmp,
        dac1_trig_rmp: dac1_trig_rmp,
        adc2_dma_rmp: adc2_dma_rmp,
        tim16_dma_rmp: tim16_dma_rmp,
        tim17_dma_rmp: tim17_dma_rmp,
        tim6_dac1_ch1_dma_rmp: tim6_dac1_ch1_dma_rmp,
        tim7_dac1_ch2_dma_rmp: tim7_dac1_ch2_dma_rmp,
        i2_c_pb6_fmp: i2_c_pb6_fmp,
        i2_c_pb7_fmp: i2_c_pb7_fmp,
        i2_c_pb8_fmp: i2_c_pb8_fmp,
        i2_c_pb9_fmp: i2_c_pb9_fmp,
        i2_c1_fmp: i2_c1_fmp,
        i2_c2_fmp: i2_c2_fmp,
        encoder_mode: encoder_mode,
        fpu_ie5: fpu_ie5,
        fpu_ie4: fpu_ie4,
        fpu_ie3: fpu_ie3,
        fpu_ie2: fpu_ie2,
        fpu_ie1: fpu_ie1,
        fpu_ie0: fpu_ie0,
        dac2_ch1_dma_rmp: dac2_ch1_dma_rmp,
        i2_c3_fmp: i2_c3_fmp,
      )
    end
  end # struct

  # external interrupt configuration register          1
  struct EXTICR1
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

    enum EXTI3 : UInt8
      # Select PA3 as the source input for the EXTI3 external interrupt
      PA3 = 0x0_u64

      # Select PB3 as the source input for the EXTI3 external interrupt
      PB3 = 0x1_u64

      # Select PC3 as the source input for the EXTI3 external interrupt
      PC3 = 0x2_u64

      # Select PD3 as the source input for the EXTI3 external interrupt
      PD3 = 0x3_u64

      # Select PE3 as the source input for the EXTI3 external interrupt
      PE3 = 0x4_u64

      # Select PF3 as the source input for the EXTI3 external interrupt
      PF3 = 0x5_u64

      # Select PG3 as the source input for the EXTI3 external interrupt
      PG3 = 0x6_u64

      def self.reset_value : EXTI3
        EXTICR1.reset_value.exti3
      end
    end

    # EXTI 3 configuration bits
    def exti3 : EXTI3
      EXTI3.new!((@value >> 12) & 0xf_u32)
    end

    # EXTI 3 configuration bits
    def self.exti3 : EXTI3
      value.exti3
    end

    # EXTI 3 configuration bits
    def self.exti3=(value : EXTI3) : EXTI3
      self.set(exti3: value)
      value
    end

    enum EXTI2 : UInt8
      # Select PA2 as the source input for the EXTI2 external interrupt
      PA2 = 0x0_u64

      # Select PB2 as the source input for the EXTI2 external interrupt
      PB2 = 0x1_u64

      # Select PC2 as the source input for the EXTI2 external interrupt
      PC2 = 0x2_u64

      # Select PD2 as the source input for the EXTI2 external interrupt
      PD2 = 0x3_u64

      # Select PE2 as the source input for the EXTI2 external interrupt
      PE2 = 0x4_u64

      # Select PF2 as the source input for the EXTI2 external interrupt
      PF2 = 0x5_u64

      # Select PG2 as the source input for the EXTI2 external interrupt
      PG2 = 0x6_u64

      # Select PH2 as the source input for the EXTI2 external interrupt
      PH2 = 0x7_u64

      def self.reset_value : EXTI2
        EXTICR1.reset_value.exti2
      end
    end

    # EXTI 2 configuration bits
    def exti2 : EXTI2
      EXTI2.new!((@value >> 8) & 0xf_u32)
    end

    # EXTI 2 configuration bits
    def self.exti2 : EXTI2
      value.exti2
    end

    # EXTI 2 configuration bits
    def self.exti2=(value : EXTI2) : EXTI2
      self.set(exti2: value)
      value
    end

    enum EXTI1 : UInt8
      # Select PA1 as the source input for the EXTI1 external interrupt
      PA1 = 0x0_u64

      # Select PB1 as the source input for the EXTI1 external interrupt
      PB1 = 0x1_u64

      # Select PC1 as the source input for the EXTI1 external interrupt
      PC1 = 0x2_u64

      # Select PD1 as the source input for the EXTI1 external interrupt
      PD1 = 0x3_u64

      # Select PE1 as the source input for the EXTI1 external interrupt
      PE1 = 0x4_u64

      # Select PF1 as the source input for the EXTI1 external interrupt
      PF1 = 0x5_u64

      # Select PG1 as the source input for the EXTI1 external interrupt
      PG1 = 0x6_u64

      # Select PH1 as the source input for the EXTI1 external interrupt
      PH1 = 0x7_u64

      def self.reset_value : EXTI1
        EXTICR1.reset_value.exti1
      end
    end

    # EXTI 1 configuration bits
    def exti1 : EXTI1
      EXTI1.new!((@value >> 4) & 0xf_u32)
    end

    # EXTI 1 configuration bits
    def self.exti1 : EXTI1
      value.exti1
    end

    # EXTI 1 configuration bits
    def self.exti1=(value : EXTI1) : EXTI1
      self.set(exti1: value)
      value
    end

    enum EXTI0 : UInt8
      # Select PA0 as the source input for the EXTI0 external interrupt
      PA0 = 0x0_u64

      # Select PB0 as the source input for the EXTI0 external interrupt
      PB0 = 0x1_u64

      # Select PC0 as the source input for the EXTI0 external interrupt
      PC0 = 0x2_u64

      # Select PD0 as the source input for the EXTI0 external interrupt
      PD0 = 0x3_u64

      # Select PE0 as the source input for the EXTI0 external interrupt
      PE0 = 0x4_u64

      # Select PF0 as the source input for the EXTI0 external interrupt
      PF0 = 0x5_u64

      # Select PG0 as the source input for the EXTI0 external interrupt
      PG0 = 0x6_u64

      # Select PH0 as the source input for the EXTI0 external interrupt
      PH0 = 0x7_u64

      def self.reset_value : EXTI0
        EXTICR1.reset_value.exti0
      end
    end

    # EXTI 0 configuration bits
    def exti0 : EXTI0
      EXTI0.new!((@value >> 0) & 0xf_u32)
    end

    # EXTI 0 configuration bits
    def self.exti0 : EXTI0
      value.exti0
    end

    # EXTI 0 configuration bits
    def self.exti0=(value : EXTI0) : EXTI0
      self.set(exti0: value)
      value
    end

    def copy_with(
      *,

      exti3 : EXTI3? = nil,

      exti2 : EXTI2? = nil,

      exti1 : EXTI1? = nil,

      exti0 : EXTI0? = nil
    ) : self
      value = @value

      unless exti3.nil?
        value = (value & 0xffff0fff_u32) |
                UInt32.new!(exti3.to_int).&(0xf_u32) << 12
      end

      unless exti2.nil?
        value = (value & 0xfffff0ff_u32) |
                UInt32.new!(exti2.to_int).&(0xf_u32) << 8
      end

      unless exti1.nil?
        value = (value & 0xffffff0f_u32) |
                UInt32.new!(exti1.to_int).&(0xf_u32) << 4
      end

      unless exti0.nil?
        value = (value & 0xfffffff0_u32) |
                UInt32.new!(exti0.to_int).&(0xf_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      exti3 : EXTI3? = nil,
      exti2 : EXTI2? = nil,
      exti1 : EXTI1? = nil,
      exti0 : EXTI0? = nil
    ) : Nil
      self.value = self.value.copy_with(
        exti3: exti3,
        exti2: exti2,
        exti1: exti1,
        exti0: exti0,
      )
    end
  end # struct

  # external interrupt configuration register          2
  struct EXTICR2
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

    enum EXTI7 : UInt8
      # Select PA7 as the source input for the EXTI7 external interrupt
      PA7 = 0x0_u64

      # Select PB7 as the source input for the EXTI7 external interrupt
      PB7 = 0x1_u64

      # Select PC7 as the source input for the EXTI7 external interrupt
      PC7 = 0x2_u64

      # Select PD7 as the source input for the EXTI7 external interrupt
      PD7 = 0x3_u64

      # Select PE7 as the source input for the EXTI7 external interrupt
      PE7 = 0x4_u64

      # Select PF7 as the source input for the EXTI7 external interrupt
      PF7 = 0x5_u64

      # Select PG7 as the source input for the EXTI7 external interrupt
      PG7 = 0x6_u64

      def self.reset_value : EXTI7
        EXTICR2.reset_value.exti7
      end
    end

    # EXTI 7 configuration bits
    def exti7 : EXTI7
      EXTI7.new!((@value >> 12) & 0xf_u32)
    end

    # EXTI 7 configuration bits
    def self.exti7 : EXTI7
      value.exti7
    end

    # EXTI 7 configuration bits
    def self.exti7=(value : EXTI7) : EXTI7
      self.set(exti7: value)
      value
    end

    enum EXTI6 : UInt8
      # Select PA6 as the source input for the EXTI6 external interrupt
      PA6 = 0x0_u64

      # Select PB6 as the source input for the EXTI6 external interrupt
      PB6 = 0x1_u64

      # Select PC6 as the source input for the EXTI6 external interrupt
      PC6 = 0x2_u64

      # Select PD6 as the source input for the EXTI6 external interrupt
      PD6 = 0x3_u64

      # Select PE6 as the source input for the EXTI6 external interrupt
      PE6 = 0x4_u64

      # Select PF6 as the source input for the EXTI6 external interrupt
      PF6 = 0x5_u64

      # Select PG6 as the source input for the EXTI6 external interrupt
      PG6 = 0x6_u64

      def self.reset_value : EXTI6
        EXTICR2.reset_value.exti6
      end
    end

    # EXTI 6 configuration bits
    def exti6 : EXTI6
      EXTI6.new!((@value >> 8) & 0xf_u32)
    end

    # EXTI 6 configuration bits
    def self.exti6 : EXTI6
      value.exti6
    end

    # EXTI 6 configuration bits
    def self.exti6=(value : EXTI6) : EXTI6
      self.set(exti6: value)
      value
    end

    enum EXTI5 : UInt8
      # Select PA5 as the source input for the EXTI5 external interrupt
      PA5 = 0x0_u64

      # Select PB5 as the source input for the EXTI5 external interrupt
      PB5 = 0x1_u64

      # Select PC5 as the source input for the EXTI5 external interrupt
      PC5 = 0x2_u64

      # Select PD5 as the source input for the EXTI5 external interrupt
      PD5 = 0x3_u64

      # Select PE5 as the source input for the EXTI5 external interrupt
      PE5 = 0x4_u64

      # Select PF5 as the source input for the EXTI5 external interrupt
      PF5 = 0x5_u64

      # Select PG5 as the source input for the EXTI5 external interrupt
      PG5 = 0x6_u64

      def self.reset_value : EXTI5
        EXTICR2.reset_value.exti5
      end
    end

    # EXTI 5 configuration bits
    def exti5 : EXTI5
      EXTI5.new!((@value >> 4) & 0xf_u32)
    end

    # EXTI 5 configuration bits
    def self.exti5 : EXTI5
      value.exti5
    end

    # EXTI 5 configuration bits
    def self.exti5=(value : EXTI5) : EXTI5
      self.set(exti5: value)
      value
    end

    enum EXTI4 : UInt8
      # Select PA4 as the source input for the EXTI4 external interrupt
      PA4 = 0x0_u64

      # Select PB4 as the source input for the EXTI4 external interrupt
      PB4 = 0x1_u64

      # Select PC4 as the source input for the EXTI4 external interrupt
      PC4 = 0x2_u64

      # Select PD4 as the source input for the EXTI4 external interrupt
      PD4 = 0x3_u64

      # Select PE4 as the source input for the EXTI4 external interrupt
      PE4 = 0x4_u64

      # Select PF4 as the source input for the EXTI4 external interrupt
      PF4 = 0x5_u64

      # Select PG4 as the source input for the EXTI4 external interrupt
      PG4 = 0x6_u64

      def self.reset_value : EXTI4
        EXTICR2.reset_value.exti4
      end
    end

    # EXTI 4 configuration bits
    def exti4 : EXTI4
      EXTI4.new!((@value >> 0) & 0xf_u32)
    end

    # EXTI 4 configuration bits
    def self.exti4 : EXTI4
      value.exti4
    end

    # EXTI 4 configuration bits
    def self.exti4=(value : EXTI4) : EXTI4
      self.set(exti4: value)
      value
    end

    def copy_with(
      *,

      exti7 : EXTI7? = nil,

      exti6 : EXTI6? = nil,

      exti5 : EXTI5? = nil,

      exti4 : EXTI4? = nil
    ) : self
      value = @value

      unless exti7.nil?
        value = (value & 0xffff0fff_u32) |
                UInt32.new!(exti7.to_int).&(0xf_u32) << 12
      end

      unless exti6.nil?
        value = (value & 0xfffff0ff_u32) |
                UInt32.new!(exti6.to_int).&(0xf_u32) << 8
      end

      unless exti5.nil?
        value = (value & 0xffffff0f_u32) |
                UInt32.new!(exti5.to_int).&(0xf_u32) << 4
      end

      unless exti4.nil?
        value = (value & 0xfffffff0_u32) |
                UInt32.new!(exti4.to_int).&(0xf_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      exti7 : EXTI7? = nil,
      exti6 : EXTI6? = nil,
      exti5 : EXTI5? = nil,
      exti4 : EXTI4? = nil
    ) : Nil
      self.value = self.value.copy_with(
        exti7: exti7,
        exti6: exti6,
        exti5: exti5,
        exti4: exti4,
      )
    end
  end # struct

  # external interrupt configuration register          3
  struct EXTICR3
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

    enum EXTI11 : UInt8
      # Select PA11 as the source input for the EXTI11 external interrupt
      PA11 = 0x0_u64

      # Select PB11 as the source input for the EXTI11 external interrupt
      PB11 = 0x1_u64

      # Select PC11 as the source input for the EXTI11 external interrupt
      PC11 = 0x2_u64

      # Select PD11 as the source input for the EXTI11 external interrupt
      PD11 = 0x3_u64

      # Select PE11 as the source input for the EXTI11 external interrupt
      PE11 = 0x4_u64

      # Select PF11 as the source input for the EXTI11 external interrupt
      PF11 = 0x5_u64

      # Select PG11 as the source input for the EXTI11 external interrupt
      PG11 = 0x6_u64

      def self.reset_value : EXTI11
        EXTICR3.reset_value.exti11
      end
    end

    # EXTI 11 configuration bits
    def exti11 : EXTI11
      EXTI11.new!((@value >> 12) & 0xf_u32)
    end

    # EXTI 11 configuration bits
    def self.exti11 : EXTI11
      value.exti11
    end

    # EXTI 11 configuration bits
    def self.exti11=(value : EXTI11) : EXTI11
      self.set(exti11: value)
      value
    end

    enum EXTI10 : UInt8
      # Select PA10 as the source input for the EXTI10 external interrupt
      PA10 = 0x0_u64

      # Select PB10 as the source input for the EXTI10 external interrupt
      PB10 = 0x1_u64

      # Select PC10 as the source input for the EXTI10 external interrupt
      PC10 = 0x2_u64

      # Select PD10 as the source input for the EXTI10 external interrupt
      PD10 = 0x3_u64

      # Select PE10 as the source input for the EXTI10 external interrupt
      PE10 = 0x4_u64

      # Select PF10 as the source input for the EXTI10 external interrupt
      PF10 = 0x5_u64

      # Select PG10 as the source input for the EXTI10 external interrupt
      PG10 = 0x6_u64

      def self.reset_value : EXTI10
        EXTICR3.reset_value.exti10
      end
    end

    # EXTI 10 configuration bits
    def exti10 : EXTI10
      EXTI10.new!((@value >> 8) & 0xf_u32)
    end

    # EXTI 10 configuration bits
    def self.exti10 : EXTI10
      value.exti10
    end

    # EXTI 10 configuration bits
    def self.exti10=(value : EXTI10) : EXTI10
      self.set(exti10: value)
      value
    end

    enum EXTI9 : UInt8
      # Select PA9 as the source input for the EXTI9 external interrupt
      PA9 = 0x0_u64

      # Select PB9 as the source input for the EXTI9 external interrupt
      PB9 = 0x1_u64

      # Select PC9 as the source input for the EXTI9 external interrupt
      PC9 = 0x2_u64

      # Select PD9 as the source input for the EXTI9 external interrupt
      PD9 = 0x3_u64

      # Select PE9 as the source input for the EXTI9 external interrupt
      PE9 = 0x4_u64

      # Select PF9 as the source input for the EXTI9 external interrupt
      PF9 = 0x5_u64

      # Select PG9 as the source input for the EXTI9 external interrupt
      PG9 = 0x6_u64

      def self.reset_value : EXTI9
        EXTICR3.reset_value.exti9
      end
    end

    # EXTI 9 configuration bits
    def exti9 : EXTI9
      EXTI9.new!((@value >> 4) & 0xf_u32)
    end

    # EXTI 9 configuration bits
    def self.exti9 : EXTI9
      value.exti9
    end

    # EXTI 9 configuration bits
    def self.exti9=(value : EXTI9) : EXTI9
      self.set(exti9: value)
      value
    end

    enum EXTI8 : UInt8
      # Select PA8 as the source input for the EXTI8 external interrupt
      PA8 = 0x0_u64

      # Select PB8 as the source input for the EXTI8 external interrupt
      PB8 = 0x1_u64

      # Select PC8 as the source input for the EXTI8 external interrupt
      PC8 = 0x2_u64

      # Select PD8 as the source input for the EXTI8 external interrupt
      PD8 = 0x3_u64

      # Select PE8 as the source input for the EXTI8 external interrupt
      PE8 = 0x4_u64

      # Select PF8 as the source input for the EXTI8 external interrupt
      PF8 = 0x5_u64

      # Select PG8 as the source input for the EXTI8 external interrupt
      PG8 = 0x6_u64

      def self.reset_value : EXTI8
        EXTICR3.reset_value.exti8
      end
    end

    # EXTI 8 configuration bits
    def exti8 : EXTI8
      EXTI8.new!((@value >> 0) & 0xf_u32)
    end

    # EXTI 8 configuration bits
    def self.exti8 : EXTI8
      value.exti8
    end

    # EXTI 8 configuration bits
    def self.exti8=(value : EXTI8) : EXTI8
      self.set(exti8: value)
      value
    end

    def copy_with(
      *,

      exti11 : EXTI11? = nil,

      exti10 : EXTI10? = nil,

      exti9 : EXTI9? = nil,

      exti8 : EXTI8? = nil
    ) : self
      value = @value

      unless exti11.nil?
        value = (value & 0xffff0fff_u32) |
                UInt32.new!(exti11.to_int).&(0xf_u32) << 12
      end

      unless exti10.nil?
        value = (value & 0xfffff0ff_u32) |
                UInt32.new!(exti10.to_int).&(0xf_u32) << 8
      end

      unless exti9.nil?
        value = (value & 0xffffff0f_u32) |
                UInt32.new!(exti9.to_int).&(0xf_u32) << 4
      end

      unless exti8.nil?
        value = (value & 0xfffffff0_u32) |
                UInt32.new!(exti8.to_int).&(0xf_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      exti11 : EXTI11? = nil,
      exti10 : EXTI10? = nil,
      exti9 : EXTI9? = nil,
      exti8 : EXTI8? = nil
    ) : Nil
      self.value = self.value.copy_with(
        exti11: exti11,
        exti10: exti10,
        exti9: exti9,
        exti8: exti8,
      )
    end
  end # struct

  # external interrupt configuration register          4
  struct EXTICR4
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

    enum EXTI15 : UInt8
      # Select PA15 as the source input for the EXTI15 external interrupt
      PA15 = 0x0_u64

      # Select PB15 as the source input for the EXTI15 external interrupt
      PB15 = 0x1_u64

      # Select PC15 as the source input for the EXTI15 external interrupt
      PC15 = 0x2_u64

      # Select PD15 as the source input for the EXTI15 external interrupt
      PD15 = 0x3_u64

      # Select PE15 as the source input for the EXTI15 external interrupt
      PE15 = 0x4_u64

      # Select PF15 as the source input for the EXTI15 external interrupt
      PF15 = 0x5_u64

      # Select PG15 as the source input for the EXTI15 external interrupt
      PG15 = 0x6_u64

      def self.reset_value : EXTI15
        EXTICR4.reset_value.exti15
      end
    end

    # EXTI 15 configuration bits
    def exti15 : EXTI15
      EXTI15.new!((@value >> 12) & 0xf_u32)
    end

    # EXTI 15 configuration bits
    def self.exti15 : EXTI15
      value.exti15
    end

    # EXTI 15 configuration bits
    def self.exti15=(value : EXTI15) : EXTI15
      self.set(exti15: value)
      value
    end

    enum EXTI14 : UInt8
      # Select PA14 as the source input for the EXTI14 external interrupt
      PA14 = 0x0_u64

      # Select PB14 as the source input for the EXTI14 external interrupt
      PB14 = 0x1_u64

      # Select PC14 as the source input for the EXTI14 external interrupt
      PC14 = 0x2_u64

      # Select PD14 as the source input for the EXTI14 external interrupt
      PD14 = 0x3_u64

      # Select PE14 as the source input for the EXTI14 external interrupt
      PE14 = 0x4_u64

      # Select PF14 as the source input for the EXTI14 external interrupt
      PF14 = 0x5_u64

      # Select PG14 as the source input for the EXTI14 external interrupt
      PG14 = 0x6_u64

      def self.reset_value : EXTI14
        EXTICR4.reset_value.exti14
      end
    end

    # EXTI 14 configuration bits
    def exti14 : EXTI14
      EXTI14.new!((@value >> 8) & 0xf_u32)
    end

    # EXTI 14 configuration bits
    def self.exti14 : EXTI14
      value.exti14
    end

    # EXTI 14 configuration bits
    def self.exti14=(value : EXTI14) : EXTI14
      self.set(exti14: value)
      value
    end

    enum EXTI13 : UInt8
      # Select PA13 as the source input for the EXTI13 external interrupt
      PA13 = 0x0_u64

      # Select PB13 as the source input for the EXTI13 external interrupt
      PB13 = 0x1_u64

      # Select PC13 as the source input for the EXTI13 external interrupt
      PC13 = 0x2_u64

      # Select PD13 as the source input for the EXTI13 external interrupt
      PD13 = 0x3_u64

      # Select PE13 as the source input for the EXTI13 external interrupt
      PE13 = 0x4_u64

      # Select PF13 as the source input for the EXTI13 external interrupt
      PF13 = 0x5_u64

      # Select PG13 as the source input for the EXTI13 external interrupt
      PG13 = 0x6_u64

      def self.reset_value : EXTI13
        EXTICR4.reset_value.exti13
      end
    end

    # EXTI 13 configuration bits
    def exti13 : EXTI13
      EXTI13.new!((@value >> 4) & 0xf_u32)
    end

    # EXTI 13 configuration bits
    def self.exti13 : EXTI13
      value.exti13
    end

    # EXTI 13 configuration bits
    def self.exti13=(value : EXTI13) : EXTI13
      self.set(exti13: value)
      value
    end

    enum EXTI12 : UInt8
      # Select PA12 as the source input for the EXTI12 external interrupt
      PA12 = 0x0_u64

      # Select PB12 as the source input for the EXTI12 external interrupt
      PB12 = 0x1_u64

      # Select PC12 as the source input for the EXTI12 external interrupt
      PC12 = 0x2_u64

      # Select PD12 as the source input for the EXTI12 external interrupt
      PD12 = 0x3_u64

      # Select PE12 as the source input for the EXTI12 external interrupt
      PE12 = 0x4_u64

      # Select PF12 as the source input for the EXTI12 external interrupt
      PF12 = 0x5_u64

      # Select PG12 as the source input for the EXTI12 external interrupt
      PG12 = 0x6_u64

      def self.reset_value : EXTI12
        EXTICR4.reset_value.exti12
      end
    end

    # EXTI 12 configuration bits
    def exti12 : EXTI12
      EXTI12.new!((@value >> 0) & 0xf_u32)
    end

    # EXTI 12 configuration bits
    def self.exti12 : EXTI12
      value.exti12
    end

    # EXTI 12 configuration bits
    def self.exti12=(value : EXTI12) : EXTI12
      self.set(exti12: value)
      value
    end

    def copy_with(
      *,

      exti15 : EXTI15? = nil,

      exti14 : EXTI14? = nil,

      exti13 : EXTI13? = nil,

      exti12 : EXTI12? = nil
    ) : self
      value = @value

      unless exti15.nil?
        value = (value & 0xffff0fff_u32) |
                UInt32.new!(exti15.to_int).&(0xf_u32) << 12
      end

      unless exti14.nil?
        value = (value & 0xfffff0ff_u32) |
                UInt32.new!(exti14.to_int).&(0xf_u32) << 8
      end

      unless exti13.nil?
        value = (value & 0xffffff0f_u32) |
                UInt32.new!(exti13.to_int).&(0xf_u32) << 4
      end

      unless exti12.nil?
        value = (value & 0xfffffff0_u32) |
                UInt32.new!(exti12.to_int).&(0xf_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      exti15 : EXTI15? = nil,
      exti14 : EXTI14? = nil,
      exti13 : EXTI13? = nil,
      exti12 : EXTI12? = nil
    ) : Nil
      self.value = self.value.copy_with(
        exti15: exti15,
        exti14: exti14,
        exti13: exti13,
        exti12: exti12,
      )
    end
  end # struct

  # configuration register 2
  struct CFGR2
    ADDRESS = BASE_ADDRESS + 0x18_u64

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

    enum LOCKUP_LOCK : UInt8
      # Cortex-M4F LOCKUP output disconnected from TIM1/15/16/17 Break input
      DISCONNECTED = 0x0_u64

      # Cortex-M4F LOCKUP output connected to TIM1/15/16/17 Break input
      CONNECTED = 0x1_u64

      def self.reset_value : LOCKUP_LOCK
        CFGR2.reset_value.lockup_lock
      end
    end

    # Cortex-M0 LOCKUP bit enable              bit
    def lockup_lock : LOCKUP_LOCK
      LOCKUP_LOCK.new!((@value >> 0) & 0x1_u32)
    end

    # Cortex-M0 LOCKUP bit enable              bit
    def self.lockup_lock : LOCKUP_LOCK
      value.lockup_lock
    end

    # Cortex-M0 LOCKUP bit enable              bit
    def self.lockup_lock=(value : LOCKUP_LOCK) : LOCKUP_LOCK
      self.set(lockup_lock: value)
      value
    end

    enum SRAM_PARITY_LOCK : UInt8
      # SRAM parity error disconnected from TIM1/15/16/17 Break input
      DISCONNECTED = 0x0_u64

      # SRAM parity error connected to TIM1/15/16/17 Break input
      CONNECTED = 0x1_u64

      def self.reset_value : SRAM_PARITY_LOCK
        CFGR2.reset_value.sram_parity_lock
      end
    end

    # SRAM parity lock bit
    def sram_parity_lock : SRAM_PARITY_LOCK
      SRAM_PARITY_LOCK.new!((@value >> 1) & 0x1_u32)
    end

    # SRAM parity lock bit
    def self.sram_parity_lock : SRAM_PARITY_LOCK
      value.sram_parity_lock
    end

    # SRAM parity lock bit
    def self.sram_parity_lock=(value : SRAM_PARITY_LOCK) : SRAM_PARITY_LOCK
      self.set(sram_parity_lock: value)
      value
    end

    enum PVD_LOCK : UInt8
      # PVD interrupt disconnected from TIM15/16/17 Break input
      DISCONNECTED = 0x0_u64

      # PVD interrupt connected to TIM15/16/17 Break input
      CONNECTED = 0x1_u64

      def self.reset_value : PVD_LOCK
        CFGR2.reset_value.pvd_lock
      end
    end

    # PVD lock enable bit
    def pvd_lock : PVD_LOCK
      PVD_LOCK.new!((@value >> 2) & 0x1_u32)
    end

    # PVD lock enable bit
    def self.pvd_lock : PVD_LOCK
      value.pvd_lock
    end

    # PVD lock enable bit
    def self.pvd_lock=(value : PVD_LOCK) : PVD_LOCK
      self.set(pvd_lock: value)
      value
    end

    enum BYP_ADDR_PAR : UInt8
      # The ramload operation is performed taking into consideration bit 29 of the address when the parity is calculated
      NOBYPASS = 0x0_u64

      # The ramload operation is performed without taking into consideration bit 29 of the address when the parity is calculated
      BYPASS = 0x1_u64

      def self.reset_value : BYP_ADDR_PAR
        CFGR2.reset_value.byp_addr_par
      end
    end

    # Bypass address bit 29 in parity              calculation
    def byp_addr_par : BYP_ADDR_PAR
      BYP_ADDR_PAR.new!((@value >> 4) & 0x1_u32)
    end

    # Bypass address bit 29 in parity              calculation
    def self.byp_addr_par : BYP_ADDR_PAR
      value.byp_addr_par
    end

    # Bypass address bit 29 in parity              calculation
    def self.byp_addr_par=(value : BYP_ADDR_PAR) : BYP_ADDR_PAR
      self.set(byp_addr_par: value)
      value
    end

    enum SRAM_PEF : UInt8
      # No SRAM parity error detected
      NOPARITYERROR = 0x0_u64

      # SRAM parity error detected
      PARITYERRORDETECTED = 0x1_u64

      def self.reset_value : SRAM_PEF
        CFGR2.reset_value.sram_pef
      end
    end

    # SRAM parity flag
    def sram_pef : SRAM_PEF
      SRAM_PEF.new!((@value >> 8) & 0x1_u32)
    end

    # SRAM parity flag
    def self.sram_pef : SRAM_PEF
      value.sram_pef
    end

    # SRAM parity flag
    def self.sram_pef=(value : SRAM_PEF) : SRAM_PEF
      self.set(sram_pef: value)
      value
    end

    def copy_with(
      *,

      lockup_lock : LOCKUP_LOCK? = nil,

      sram_parity_lock : SRAM_PARITY_LOCK? = nil,

      pvd_lock : PVD_LOCK? = nil,

      byp_addr_par : BYP_ADDR_PAR? = nil,

      sram_pef : SRAM_PEF? = nil
    ) : self
      value = @value

      unless lockup_lock.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(lockup_lock.to_int).&(0x1_u32) << 0
      end

      unless sram_parity_lock.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(sram_parity_lock.to_int).&(0x1_u32) << 1
      end

      unless pvd_lock.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(pvd_lock.to_int).&(0x1_u32) << 2
      end

      unless byp_addr_par.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(byp_addr_par.to_int).&(0x1_u32) << 4
      end

      unless sram_pef.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(sram_pef.to_int).&(0x1_u32) << 8
      end

      self.class.new(value)
    end

    def self.set(
      *,
      lockup_lock : LOCKUP_LOCK? = nil,
      sram_parity_lock : SRAM_PARITY_LOCK? = nil,
      pvd_lock : PVD_LOCK? = nil,
      byp_addr_par : BYP_ADDR_PAR? = nil,
      sram_pef : SRAM_PEF? = nil
    ) : Nil
      self.value = self.value.copy_with(
        lockup_lock: lockup_lock,
        sram_parity_lock: sram_parity_lock,
        pvd_lock: pvd_lock,
        byp_addr_par: byp_addr_par,
        sram_pef: sram_pef,
      )
    end
  end # struct

  # CCM SRAM protection register
  struct RCR
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

    enum PAGE0_WP : UInt8
      # Write protection of pagex is disabled
      DISABLED = 0x0_u64

      # Write protection of pagex is enabled
      ENABLED = 0x1_u64

      def self.reset_value : PAGE0_WP
        RCR.reset_value.page0_wp
      end
    end

    # CCM SRAM page write protection              bit
    def page0_wp : PAGE0_WP
      PAGE0_WP.new!((@value >> 0) & 0x1_u32)
    end

    # CCM SRAM page write protection              bit
    def self.page0_wp : PAGE0_WP
      value.page0_wp
    end

    # CCM SRAM page write protection              bit
    def self.page0_wp=(value : PAGE0_WP) : PAGE0_WP
      self.set(page0_wp: value)
      value
    end

    # CCM SRAM page write protection              bit
    def page1_wp : Bool
      @value.bits_set?(0x2_u32)
    end

    # CCM SRAM page write protection              bit
    def self.page1_wp : Bool
      value.page1_wp
    end

    # CCM SRAM page write protection              bit
    def self.page1_wp=(value : Bool) : Bool
      self.set(page1_wp: value)
      value
    end

    # CCM SRAM page write protection              bit
    def page2_wp : Bool
      @value.bits_set?(0x4_u32)
    end

    # CCM SRAM page write protection              bit
    def self.page2_wp : Bool
      value.page2_wp
    end

    # CCM SRAM page write protection              bit
    def self.page2_wp=(value : Bool) : Bool
      self.set(page2_wp: value)
      value
    end

    # CCM SRAM page write protection              bit
    def page3_wp : Bool
      @value.bits_set?(0x8_u32)
    end

    # CCM SRAM page write protection              bit
    def self.page3_wp : Bool
      value.page3_wp
    end

    # CCM SRAM page write protection              bit
    def self.page3_wp=(value : Bool) : Bool
      self.set(page3_wp: value)
      value
    end

    # CCM SRAM page write protection              bit
    def page4_wp : Bool
      @value.bits_set?(0x10_u32)
    end

    # CCM SRAM page write protection              bit
    def self.page4_wp : Bool
      value.page4_wp
    end

    # CCM SRAM page write protection              bit
    def self.page4_wp=(value : Bool) : Bool
      self.set(page4_wp: value)
      value
    end

    # CCM SRAM page write protection              bit
    def page5_wp : Bool
      @value.bits_set?(0x20_u32)
    end

    # CCM SRAM page write protection              bit
    def self.page5_wp : Bool
      value.page5_wp
    end

    # CCM SRAM page write protection              bit
    def self.page5_wp=(value : Bool) : Bool
      self.set(page5_wp: value)
      value
    end

    # CCM SRAM page write protection              bit
    def page6_wp : Bool
      @value.bits_set?(0x40_u32)
    end

    # CCM SRAM page write protection              bit
    def self.page6_wp : Bool
      value.page6_wp
    end

    # CCM SRAM page write protection              bit
    def self.page6_wp=(value : Bool) : Bool
      self.set(page6_wp: value)
      value
    end

    # CCM SRAM page write protection              bit
    def page7_wp : Bool
      @value.bits_set?(0x80_u32)
    end

    # CCM SRAM page write protection              bit
    def self.page7_wp : Bool
      value.page7_wp
    end

    # CCM SRAM page write protection              bit
    def self.page7_wp=(value : Bool) : Bool
      self.set(page7_wp: value)
      value
    end

    # CCM SRAM page write protection bit
    def page8_wp : Bool
      @value.bits_set?(0x100_u32)
    end

    # CCM SRAM page write protection bit
    def self.page8_wp : Bool
      value.page8_wp
    end

    # CCM SRAM page write protection bit
    def self.page8_wp=(value : Bool) : Bool
      self.set(page8_wp: value)
      value
    end

    # CCM SRAM page write protection bit
    def page9_wp : Bool
      @value.bits_set?(0x200_u32)
    end

    # CCM SRAM page write protection bit
    def self.page9_wp : Bool
      value.page9_wp
    end

    # CCM SRAM page write protection bit
    def self.page9_wp=(value : Bool) : Bool
      self.set(page9_wp: value)
      value
    end

    # CCM SRAM page write protection bit
    def page10_wp : Bool
      @value.bits_set?(0x400_u32)
    end

    # CCM SRAM page write protection bit
    def self.page10_wp : Bool
      value.page10_wp
    end

    # CCM SRAM page write protection bit
    def self.page10_wp=(value : Bool) : Bool
      self.set(page10_wp: value)
      value
    end

    # CCM SRAM page write protection bit
    def page11_wp : Bool
      @value.bits_set?(0x800_u32)
    end

    # CCM SRAM page write protection bit
    def self.page11_wp : Bool
      value.page11_wp
    end

    # CCM SRAM page write protection bit
    def self.page11_wp=(value : Bool) : Bool
      self.set(page11_wp: value)
      value
    end

    # CCM SRAM page write protection bit
    def page12_wp : Bool
      @value.bits_set?(0x1000_u32)
    end

    # CCM SRAM page write protection bit
    def self.page12_wp : Bool
      value.page12_wp
    end

    # CCM SRAM page write protection bit
    def self.page12_wp=(value : Bool) : Bool
      self.set(page12_wp: value)
      value
    end

    # CCM SRAM page write protection bit
    def page13_wp : Bool
      @value.bits_set?(0x2000_u32)
    end

    # CCM SRAM page write protection bit
    def self.page13_wp : Bool
      value.page13_wp
    end

    # CCM SRAM page write protection bit
    def self.page13_wp=(value : Bool) : Bool
      self.set(page13_wp: value)
      value
    end

    # CCM SRAM page write protection bit
    def page14_wp : Bool
      @value.bits_set?(0x4000_u32)
    end

    # CCM SRAM page write protection bit
    def self.page14_wp : Bool
      value.page14_wp
    end

    # CCM SRAM page write protection bit
    def self.page14_wp=(value : Bool) : Bool
      self.set(page14_wp: value)
      value
    end

    # CCM SRAM page write protection bit
    def page15_wp : Bool
      @value.bits_set?(0x8000_u32)
    end

    # CCM SRAM page write protection bit
    def self.page15_wp : Bool
      value.page15_wp
    end

    # CCM SRAM page write protection bit
    def self.page15_wp=(value : Bool) : Bool
      self.set(page15_wp: value)
      value
    end

    def copy_with(
      *,

      page0_wp : PAGE0_WP? = nil,

      page1_wp : Bool? = nil,

      page2_wp : Bool? = nil,

      page3_wp : Bool? = nil,

      page4_wp : Bool? = nil,

      page5_wp : Bool? = nil,

      page6_wp : Bool? = nil,

      page7_wp : Bool? = nil,

      page8_wp : Bool? = nil,

      page9_wp : Bool? = nil,

      page10_wp : Bool? = nil,

      page11_wp : Bool? = nil,

      page12_wp : Bool? = nil,

      page13_wp : Bool? = nil,

      page14_wp : Bool? = nil,

      page15_wp : Bool? = nil
    ) : self
      value = @value

      unless page0_wp.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(page0_wp.to_int).&(0x1_u32) << 0
      end

      unless page1_wp.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(page1_wp.to_int).&(0x1_u32) << 1
      end

      unless page2_wp.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(page2_wp.to_int).&(0x1_u32) << 2
      end

      unless page3_wp.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(page3_wp.to_int).&(0x1_u32) << 3
      end

      unless page4_wp.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(page4_wp.to_int).&(0x1_u32) << 4
      end

      unless page5_wp.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(page5_wp.to_int).&(0x1_u32) << 5
      end

      unless page6_wp.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(page6_wp.to_int).&(0x1_u32) << 6
      end

      unless page7_wp.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(page7_wp.to_int).&(0x1_u32) << 7
      end

      unless page8_wp.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(page8_wp.to_int).&(0x1_u32) << 8
      end

      unless page9_wp.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(page9_wp.to_int).&(0x1_u32) << 9
      end

      unless page10_wp.nil?
        value = (value & 0xfffffbff_u32) |
                UInt32.new!(page10_wp.to_int).&(0x1_u32) << 10
      end

      unless page11_wp.nil?
        value = (value & 0xfffff7ff_u32) |
                UInt32.new!(page11_wp.to_int).&(0x1_u32) << 11
      end

      unless page12_wp.nil?
        value = (value & 0xffffefff_u32) |
                UInt32.new!(page12_wp.to_int).&(0x1_u32) << 12
      end

      unless page13_wp.nil?
        value = (value & 0xffffdfff_u32) |
                UInt32.new!(page13_wp.to_int).&(0x1_u32) << 13
      end

      unless page14_wp.nil?
        value = (value & 0xffffbfff_u32) |
                UInt32.new!(page14_wp.to_int).&(0x1_u32) << 14
      end

      unless page15_wp.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(page15_wp.to_int).&(0x1_u32) << 15
      end

      self.class.new(value)
    end

    def self.set(
      *,
      page0_wp : PAGE0_WP? = nil,
      page1_wp : Bool? = nil,
      page2_wp : Bool? = nil,
      page3_wp : Bool? = nil,
      page4_wp : Bool? = nil,
      page5_wp : Bool? = nil,
      page6_wp : Bool? = nil,
      page7_wp : Bool? = nil,
      page8_wp : Bool? = nil,
      page9_wp : Bool? = nil,
      page10_wp : Bool? = nil,
      page11_wp : Bool? = nil,
      page12_wp : Bool? = nil,
      page13_wp : Bool? = nil,
      page14_wp : Bool? = nil,
      page15_wp : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        page0_wp: page0_wp,
        page1_wp: page1_wp,
        page2_wp: page2_wp,
        page3_wp: page3_wp,
        page4_wp: page4_wp,
        page5_wp: page5_wp,
        page6_wp: page6_wp,
        page7_wp: page7_wp,
        page8_wp: page8_wp,
        page9_wp: page9_wp,
        page10_wp: page10_wp,
        page11_wp: page11_wp,
        page12_wp: page12_wp,
        page13_wp: page13_wp,
        page14_wp: page14_wp,
        page15_wp: page15_wp,
      )
    end
  end # struct

  # configuration register 3
  struct CFGR3
    ADDRESS = BASE_ADDRESS + 0x50_u64

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
      new(0x200_u64)
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

    enum SPI1_RX_DMA_RMP : UInt8
      # SPI1_RX mapped on DMA1 CH2
      MAPDMA1CH3 = 0x0_u64

      # SPI1_RX mapped on DMA1 CH4
      MAPDMA1CH5 = 0x1_u64

      # SPI1_RX mapped on DMA1 CH6
      MAPDMA1CH7 = 0x2_u64

      def self.reset_value : SPI1_RX_DMA_RMP
        CFGR3.reset_value.spi1_rx_dma_rmp
      end
    end

    # SPI1_RX DMA remapping bit
    def spi1_rx_dma_rmp : SPI1_RX_DMA_RMP
      SPI1_RX_DMA_RMP.new!((@value >> 0) & 0x3_u32)
    end

    # SPI1_RX DMA remapping bit
    def self.spi1_rx_dma_rmp : SPI1_RX_DMA_RMP
      value.spi1_rx_dma_rmp
    end

    # SPI1_RX DMA remapping bit
    def self.spi1_rx_dma_rmp=(value : SPI1_RX_DMA_RMP) : SPI1_RX_DMA_RMP
      self.set(spi1_rx_dma_rmp: value)
      value
    end

    enum SPI1_TX_DMA_RMP : UInt8
      # SPI1_TX mapped on DMA1 CH3
      MAPDMA1CH3 = 0x0_u64

      # SPI1_TX mapped on DMA1 CH5
      MAPDMA1CH5 = 0x1_u64

      # SPI1_TX mapped on DMA1 CH7
      MAPDMA1CH7 = 0x2_u64

      def self.reset_value : SPI1_TX_DMA_RMP
        CFGR3.reset_value.spi1_tx_dma_rmp
      end
    end

    # SPI1_TX DMA remapping bit
    def spi1_tx_dma_rmp : SPI1_TX_DMA_RMP
      SPI1_TX_DMA_RMP.new!((@value >> 2) & 0x3_u32)
    end

    # SPI1_TX DMA remapping bit
    def self.spi1_tx_dma_rmp : SPI1_TX_DMA_RMP
      value.spi1_tx_dma_rmp
    end

    # SPI1_TX DMA remapping bit
    def self.spi1_tx_dma_rmp=(value : SPI1_TX_DMA_RMP) : SPI1_TX_DMA_RMP
      self.set(spi1_tx_dma_rmp: value)
      value
    end

    enum I2C1_RX_DMA_RMP : UInt8
      # I2C1_RX mapped on DMA1 CH7
      MAPDMA1CH7 = 0x0_u64

      # I2C1_RX mapped on DMA1 CH3
      MAPDMA1CH3 = 0x1_u64

      # I2C1_RX mapped on DMA1 CH5
      MAPDMA1CH5 = 0x2_u64

      def self.reset_value : I2C1_RX_DMA_RMP
        CFGR3.reset_value.i2_c1_rx_dma_rmp
      end
    end

    # I2C1_RX DMA remapping bit
    def i2_c1_rx_dma_rmp : I2C1_RX_DMA_RMP
      I2C1_RX_DMA_RMP.new!((@value >> 4) & 0x3_u32)
    end

    # I2C1_RX DMA remapping bit
    def self.i2_c1_rx_dma_rmp : I2C1_RX_DMA_RMP
      value.i2_c1_rx_dma_rmp
    end

    # I2C1_RX DMA remapping bit
    def self.i2_c1_rx_dma_rmp=(value : I2C1_RX_DMA_RMP) : I2C1_RX_DMA_RMP
      self.set(i2_c1_rx_dma_rmp: value)
      value
    end

    enum I2C1_TX_DMA_RMP : UInt8
      # I2C1_TX mapped on DMA1 CH6
      MAPDMA1CH6 = 0x0_u64

      # I2C1_TX mapped on DMA1 CH2
      MAPDMA1CH2 = 0x1_u64

      # I2C1_TX mapped on DMA1 CH4
      MAPDMA1CH4 = 0x2_u64

      def self.reset_value : I2C1_TX_DMA_RMP
        CFGR3.reset_value.i2_c1_tx_dma_rmp
      end
    end

    # I2C1_TX DMA remapping bit
    def i2_c1_tx_dma_rmp : I2C1_TX_DMA_RMP
      I2C1_TX_DMA_RMP.new!((@value >> 6) & 0x3_u32)
    end

    # I2C1_TX DMA remapping bit
    def self.i2_c1_tx_dma_rmp : I2C1_TX_DMA_RMP
      value.i2_c1_tx_dma_rmp
    end

    # I2C1_TX DMA remapping bit
    def self.i2_c1_tx_dma_rmp=(value : I2C1_TX_DMA_RMP) : I2C1_TX_DMA_RMP
      self.set(i2_c1_tx_dma_rmp: value)
      value
    end

    enum ADC2_DMA_RMP : UInt8
      # ADC2 mapped on DMA2
      MAPDMA2 = 0x0_u64

      # ADC2 mapped on DMA1 channel 2
      MAPDMA1CH2 = 0x2_u64

      # ADC2 mapped on DMA1 channel 4
      MAPDMA1CH4 = 0x3_u64

      def self.reset_value : ADC2_DMA_RMP
        CFGR3.reset_value.adc2_dma_rmp
      end
    end

    # ADC2 DMA remapping bit
    def adc2_dma_rmp : ADC2_DMA_RMP
      ADC2_DMA_RMP.new!((@value >> 8) & 0x3_u32)
    end

    # ADC2 DMA remapping bit
    def self.adc2_dma_rmp : ADC2_DMA_RMP
      value.adc2_dma_rmp
    end

    # ADC2 DMA remapping bit
    def self.adc2_dma_rmp=(value : ADC2_DMA_RMP) : ADC2_DMA_RMP
      self.set(adc2_dma_rmp: value)
      value
    end

    def copy_with(
      *,

      spi1_rx_dma_rmp : SPI1_RX_DMA_RMP? = nil,

      spi1_tx_dma_rmp : SPI1_TX_DMA_RMP? = nil,

      i2_c1_rx_dma_rmp : I2C1_RX_DMA_RMP? = nil,

      i2_c1_tx_dma_rmp : I2C1_TX_DMA_RMP? = nil,

      adc2_dma_rmp : ADC2_DMA_RMP? = nil
    ) : self
      value = @value

      unless spi1_rx_dma_rmp.nil?
        value = (value & 0xfffffffc_u32) |
                UInt32.new!(spi1_rx_dma_rmp.to_int).&(0x3_u32) << 0
      end

      unless spi1_tx_dma_rmp.nil?
        value = (value & 0xfffffff3_u32) |
                UInt32.new!(spi1_tx_dma_rmp.to_int).&(0x3_u32) << 2
      end

      unless i2_c1_rx_dma_rmp.nil?
        value = (value & 0xffffffcf_u32) |
                UInt32.new!(i2_c1_rx_dma_rmp.to_int).&(0x3_u32) << 4
      end

      unless i2_c1_tx_dma_rmp.nil?
        value = (value & 0xffffff3f_u32) |
                UInt32.new!(i2_c1_tx_dma_rmp.to_int).&(0x3_u32) << 6
      end

      unless adc2_dma_rmp.nil?
        value = (value & 0xfffffcff_u32) |
                UInt32.new!(adc2_dma_rmp.to_int).&(0x3_u32) << 8
      end

      self.class.new(value)
    end

    def self.set(
      *,
      spi1_rx_dma_rmp : SPI1_RX_DMA_RMP? = nil,
      spi1_tx_dma_rmp : SPI1_TX_DMA_RMP? = nil,
      i2_c1_rx_dma_rmp : I2C1_RX_DMA_RMP? = nil,
      i2_c1_tx_dma_rmp : I2C1_TX_DMA_RMP? = nil,
      adc2_dma_rmp : ADC2_DMA_RMP? = nil
    ) : Nil
      self.value = self.value.copy_with(
        spi1_rx_dma_rmp: spi1_rx_dma_rmp,
        spi1_tx_dma_rmp: spi1_tx_dma_rmp,
        i2_c1_rx_dma_rmp: i2_c1_rx_dma_rmp,
        i2_c1_tx_dma_rmp: i2_c1_tx_dma_rmp,
        adc2_dma_rmp: adc2_dma_rmp,
      )
    end
  end # struct

  # configuration register 4
  struct CFGR4
    ADDRESS = BASE_ADDRESS + 0x48_u64

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

    enum ADC12_EXT2_RMP : UInt8
      # Trigger source is TIM3_CC3
      TIM1 = 0x0_u64

      # rigger source is TIM20_TRGO
      TIM20 = 0x1_u64

      def self.reset_value : ADC12_EXT2_RMP
        CFGR4.reset_value.adc12_ext2_rmp
      end
    end

    # Controls the Input trigger of ADC12 regular channel EXT2
    def adc12_ext2_rmp : ADC12_EXT2_RMP
      ADC12_EXT2_RMP.new!((@value >> 0) & 0x1_u32)
    end

    # Controls the Input trigger of ADC12 regular channel EXT2
    def self.adc12_ext2_rmp : ADC12_EXT2_RMP
      value.adc12_ext2_rmp
    end

    # Controls the Input trigger of ADC12 regular channel EXT2
    def self.adc12_ext2_rmp=(value : ADC12_EXT2_RMP) : ADC12_EXT2_RMP
      self.set(adc12_ext2_rmp: value)
      value
    end

    enum ADC12_EXT3_RMP : UInt8
      # Trigger source is TIM2_CC2
      TIM2 = 0x0_u64

      # rigger source is TIM20_TRGO2
      TIM20 = 0x1_u64

      def self.reset_value : ADC12_EXT3_RMP
        CFGR4.reset_value.adc12_ext3_rmp
      end
    end

    # Controls the Input trigger of ADC12 regular channel EXT3
    def adc12_ext3_rmp : ADC12_EXT3_RMP
      ADC12_EXT3_RMP.new!((@value >> 1) & 0x1_u32)
    end

    # Controls the Input trigger of ADC12 regular channel EXT3
    def self.adc12_ext3_rmp : ADC12_EXT3_RMP
      value.adc12_ext3_rmp
    end

    # Controls the Input trigger of ADC12 regular channel EXT3
    def self.adc12_ext3_rmp=(value : ADC12_EXT3_RMP) : ADC12_EXT3_RMP
      self.set(adc12_ext3_rmp: value)
      value
    end

    enum ADC12_EXT5_RMP : UInt8
      # Trigger source is TIM4_CC4
      TIM4 = 0x0_u64

      # Trigger source is TIM20_CC1
      TIM20 = 0x1_u64

      def self.reset_value : ADC12_EXT5_RMP
        CFGR4.reset_value.adc12_ext5_rmp
      end
    end

    # Controls the Input trigger of ADC12 regular channel EXT5
    def adc12_ext5_rmp : ADC12_EXT5_RMP
      ADC12_EXT5_RMP.new!((@value >> 2) & 0x1_u32)
    end

    # Controls the Input trigger of ADC12 regular channel EXT5
    def self.adc12_ext5_rmp : ADC12_EXT5_RMP
      value.adc12_ext5_rmp
    end

    # Controls the Input trigger of ADC12 regular channel EXT5
    def self.adc12_ext5_rmp=(value : ADC12_EXT5_RMP) : ADC12_EXT5_RMP
      self.set(adc12_ext5_rmp: value)
      value
    end

    enum ADC12_EXT13_RMP : UInt8
      # Trigger source is TIM6_TRGO
      TIM6 = 0x0_u64

      # Trigger source is TIM20_CC2
      TIM20 = 0x1_u64

      def self.reset_value : ADC12_EXT13_RMP
        CFGR4.reset_value.adc12_ext13_rmp
      end
    end

    # Controls the Input trigger of ADC12 regular channel EXT13
    def adc12_ext13_rmp : ADC12_EXT13_RMP
      ADC12_EXT13_RMP.new!((@value >> 3) & 0x1_u32)
    end

    # Controls the Input trigger of ADC12 regular channel EXT13
    def self.adc12_ext13_rmp : ADC12_EXT13_RMP
      value.adc12_ext13_rmp
    end

    # Controls the Input trigger of ADC12 regular channel EXT13
    def self.adc12_ext13_rmp=(value : ADC12_EXT13_RMP) : ADC12_EXT13_RMP
      self.set(adc12_ext13_rmp: value)
      value
    end

    enum ADC12_EXT15_RMP : UInt8
      # Trigger source is TIM3_CC4
      TIM3 = 0x0_u64

      # Trigger source is TIM20_CC3
      TIM20 = 0x1_u64

      def self.reset_value : ADC12_EXT15_RMP
        CFGR4.reset_value.adc12_ext15_rmp
      end
    end

    # Controls the Input trigger of ADC12 regular channel EXT15
    def adc12_ext15_rmp : ADC12_EXT15_RMP
      ADC12_EXT15_RMP.new!((@value >> 4) & 0x1_u32)
    end

    # Controls the Input trigger of ADC12 regular channel EXT15
    def self.adc12_ext15_rmp : ADC12_EXT15_RMP
      value.adc12_ext15_rmp
    end

    # Controls the Input trigger of ADC12 regular channel EXT15
    def self.adc12_ext15_rmp=(value : ADC12_EXT15_RMP) : ADC12_EXT15_RMP
      self.set(adc12_ext15_rmp: value)
      value
    end

    enum ADC12_JEXT3_RMP : UInt8
      # Trigger source is TIM2_CC1
      TIM2 = 0x0_u64

      # Trigger source is TIM20_TRGO
      TIM20 = 0x1_u64

      def self.reset_value : ADC12_JEXT3_RMP
        CFGR4.reset_value.adc12_jext3_rmp
      end
    end

    # Controls the Input trigger of ADC12 injected channel JEXT3
    def adc12_jext3_rmp : ADC12_JEXT3_RMP
      ADC12_JEXT3_RMP.new!((@value >> 5) & 0x1_u32)
    end

    # Controls the Input trigger of ADC12 injected channel JEXT3
    def self.adc12_jext3_rmp : ADC12_JEXT3_RMP
      value.adc12_jext3_rmp
    end

    # Controls the Input trigger of ADC12 injected channel JEXT3
    def self.adc12_jext3_rmp=(value : ADC12_JEXT3_RMP) : ADC12_JEXT3_RMP
      self.set(adc12_jext3_rmp: value)
      value
    end

    enum ADC12_JEXT6_RMP : UInt8
      # Trigger source is EXTI line 15
      EXTI15 = 0x0_u64

      # Trigger source is TIM20_TRGO2
      TIM20 = 0x1_u64

      def self.reset_value : ADC12_JEXT6_RMP
        CFGR4.reset_value.adc12_jext6_rmp
      end
    end

    # Controls the Input trigger of ADC12 injected channel JEXT6
    def adc12_jext6_rmp : ADC12_JEXT6_RMP
      ADC12_JEXT6_RMP.new!((@value >> 6) & 0x1_u32)
    end

    # Controls the Input trigger of ADC12 injected channel JEXT6
    def self.adc12_jext6_rmp : ADC12_JEXT6_RMP
      value.adc12_jext6_rmp
    end

    # Controls the Input trigger of ADC12 injected channel JEXT6
    def self.adc12_jext6_rmp=(value : ADC12_JEXT6_RMP) : ADC12_JEXT6_RMP
      self.set(adc12_jext6_rmp: value)
      value
    end

    enum ADC12_JEXT13_RMP : UInt8
      # Trigger source is TIM3_CC1
      TIM3 = 0x0_u64

      # Trigger source is TIM20_CC4
      TIM20 = 0x1_u64

      def self.reset_value : ADC12_JEXT13_RMP
        CFGR4.reset_value.adc12_jext13_rmp
      end
    end

    # Controls the Input trigger of ADC12 injected channel JEXT13
    def adc12_jext13_rmp : ADC12_JEXT13_RMP
      ADC12_JEXT13_RMP.new!((@value >> 7) & 0x1_u32)
    end

    # Controls the Input trigger of ADC12 injected channel JEXT13
    def self.adc12_jext13_rmp : ADC12_JEXT13_RMP
      value.adc12_jext13_rmp
    end

    # Controls the Input trigger of ADC12 injected channel JEXT13
    def self.adc12_jext13_rmp=(value : ADC12_JEXT13_RMP) : ADC12_JEXT13_RMP
      self.set(adc12_jext13_rmp: value)
      value
    end

    enum ADC34_EXT5_RMP : UInt8
      # Trigger source is EXTI line 2 when reset at 0
      EXTI2 = 0x0_u64

      # Trigger source is TIM20_TRGO
      TIM20 = 0x1_u64

      def self.reset_value : ADC34_EXT5_RMP
        CFGR4.reset_value.adc34_ext5_rmp
      end
    end

    # Controls the Input trigger of ADC34 regular channel EXT5
    def adc34_ext5_rmp : ADC34_EXT5_RMP
      ADC34_EXT5_RMP.new!((@value >> 8) & 0x1_u32)
    end

    # Controls the Input trigger of ADC34 regular channel EXT5
    def self.adc34_ext5_rmp : ADC34_EXT5_RMP
      value.adc34_ext5_rmp
    end

    # Controls the Input trigger of ADC34 regular channel EXT5
    def self.adc34_ext5_rmp=(value : ADC34_EXT5_RMP) : ADC34_EXT5_RMP
      self.set(adc34_ext5_rmp: value)
      value
    end

    enum ADC34_EXT6_RMP : UInt8
      # Trigger source is TIM4_CC1
      TIM4 = 0x0_u64

      # Trigger source is TIM20_TRGO2
      TIM20 = 0x1_u64

      def self.reset_value : ADC34_EXT6_RMP
        CFGR4.reset_value.adc34_ext6_rmp
      end
    end

    # Controls the Input trigger of ADC34 regular channel EXT6
    def adc34_ext6_rmp : ADC34_EXT6_RMP
      ADC34_EXT6_RMP.new!((@value >> 9) & 0x1_u32)
    end

    # Controls the Input trigger of ADC34 regular channel EXT6
    def self.adc34_ext6_rmp : ADC34_EXT6_RMP
      value.adc34_ext6_rmp
    end

    # Controls the Input trigger of ADC34 regular channel EXT6
    def self.adc34_ext6_rmp=(value : ADC34_EXT6_RMP) : ADC34_EXT6_RMP
      self.set(adc34_ext6_rmp: value)
      value
    end

    enum ADC34_EXT15_RMP : UInt8
      # Trigger source is TIM2_CC1
      TIM2 = 0x0_u64

      # Trigger source is TIM20_CC1
      TIM20 = 0x1_u64

      def self.reset_value : ADC34_EXT15_RMP
        CFGR4.reset_value.adc34_ext15_rmp
      end
    end

    # Controls the Input trigger of ADC34 regular channel EXT15
    def adc34_ext15_rmp : ADC34_EXT15_RMP
      ADC34_EXT15_RMP.new!((@value >> 10) & 0x1_u32)
    end

    # Controls the Input trigger of ADC34 regular channel EXT15
    def self.adc34_ext15_rmp : ADC34_EXT15_RMP
      value.adc34_ext15_rmp
    end

    # Controls the Input trigger of ADC34 regular channel EXT15
    def self.adc34_ext15_rmp=(value : ADC34_EXT15_RMP) : ADC34_EXT15_RMP
      self.set(adc34_ext15_rmp: value)
      value
    end

    enum ADC34_JEXT5_RMP : UInt8
      # Trigger source is TIM4_CC3
      TIM4 = 0x0_u64

      # Trigger source is TIM20_TRGO
      TIM20 = 0x1_u64

      def self.reset_value : ADC34_JEXT5_RMP
        CFGR4.reset_value.adc34_jext5_rmp
      end
    end

    # Controls the Input trigger of ADC34 injected channel JEXT5
    def adc34_jext5_rmp : ADC34_JEXT5_RMP
      ADC34_JEXT5_RMP.new!((@value >> 11) & 0x1_u32)
    end

    # Controls the Input trigger of ADC34 injected channel JEXT5
    def self.adc34_jext5_rmp : ADC34_JEXT5_RMP
      value.adc34_jext5_rmp
    end

    # Controls the Input trigger of ADC34 injected channel JEXT5
    def self.adc34_jext5_rmp=(value : ADC34_JEXT5_RMP) : ADC34_JEXT5_RMP
      self.set(adc34_jext5_rmp: value)
      value
    end

    enum ADC34_JEXT11_RMP : UInt8
      # Trigger source is TIM1_CC3
      TIM1 = 0x0_u64

      # Trigger source is TIM20_TRGO2
      TIM20 = 0x1_u64

      def self.reset_value : ADC34_JEXT11_RMP
        CFGR4.reset_value.adc34_jext11_rmp
      end
    end

    # Controls the Input trigger of ADC34 injected channel JEXT11
    def adc34_jext11_rmp : ADC34_JEXT11_RMP
      ADC34_JEXT11_RMP.new!((@value >> 12) & 0x1_u32)
    end

    # Controls the Input trigger of ADC34 injected channel JEXT11
    def self.adc34_jext11_rmp : ADC34_JEXT11_RMP
      value.adc34_jext11_rmp
    end

    # Controls the Input trigger of ADC34 injected channel JEXT11
    def self.adc34_jext11_rmp=(value : ADC34_JEXT11_RMP) : ADC34_JEXT11_RMP
      self.set(adc34_jext11_rmp: value)
      value
    end

    enum ADC34_JEXT14_RMP : UInt8
      # Trigger source is TIM7_TRGO
      TIM7 = 0x0_u64

      # Trigger source is TIM20_CC2
      TIM20 = 0x1_u64

      def self.reset_value : ADC34_JEXT14_RMP
        CFGR4.reset_value.adc34_jext14_rmp
      end
    end

    # Controls the Input trigger of ADC34 injected channel JEXT14
    def adc34_jext14_rmp : ADC34_JEXT14_RMP
      ADC34_JEXT14_RMP.new!((@value >> 13) & 0x1_u32)
    end

    # Controls the Input trigger of ADC34 injected channel JEXT14
    def self.adc34_jext14_rmp : ADC34_JEXT14_RMP
      value.adc34_jext14_rmp
    end

    # Controls the Input trigger of ADC34 injected channel JEXT14
    def self.adc34_jext14_rmp=(value : ADC34_JEXT14_RMP) : ADC34_JEXT14_RMP
      self.set(adc34_jext14_rmp: value)
      value
    end

    def copy_with(
      *,

      adc12_ext2_rmp : ADC12_EXT2_RMP? = nil,

      adc12_ext3_rmp : ADC12_EXT3_RMP? = nil,

      adc12_ext5_rmp : ADC12_EXT5_RMP? = nil,

      adc12_ext13_rmp : ADC12_EXT13_RMP? = nil,

      adc12_ext15_rmp : ADC12_EXT15_RMP? = nil,

      adc12_jext3_rmp : ADC12_JEXT3_RMP? = nil,

      adc12_jext6_rmp : ADC12_JEXT6_RMP? = nil,

      adc12_jext13_rmp : ADC12_JEXT13_RMP? = nil,

      adc34_ext5_rmp : ADC34_EXT5_RMP? = nil,

      adc34_ext6_rmp : ADC34_EXT6_RMP? = nil,

      adc34_ext15_rmp : ADC34_EXT15_RMP? = nil,

      adc34_jext5_rmp : ADC34_JEXT5_RMP? = nil,

      adc34_jext11_rmp : ADC34_JEXT11_RMP? = nil,

      adc34_jext14_rmp : ADC34_JEXT14_RMP? = nil
    ) : self
      value = @value

      unless adc12_ext2_rmp.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(adc12_ext2_rmp.to_int).&(0x1_u32) << 0
      end

      unless adc12_ext3_rmp.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(adc12_ext3_rmp.to_int).&(0x1_u32) << 1
      end

      unless adc12_ext5_rmp.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(adc12_ext5_rmp.to_int).&(0x1_u32) << 2
      end

      unless adc12_ext13_rmp.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(adc12_ext13_rmp.to_int).&(0x1_u32) << 3
      end

      unless adc12_ext15_rmp.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(adc12_ext15_rmp.to_int).&(0x1_u32) << 4
      end

      unless adc12_jext3_rmp.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(adc12_jext3_rmp.to_int).&(0x1_u32) << 5
      end

      unless adc12_jext6_rmp.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(adc12_jext6_rmp.to_int).&(0x1_u32) << 6
      end

      unless adc12_jext13_rmp.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(adc12_jext13_rmp.to_int).&(0x1_u32) << 7
      end

      unless adc34_ext5_rmp.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(adc34_ext5_rmp.to_int).&(0x1_u32) << 8
      end

      unless adc34_ext6_rmp.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(adc34_ext6_rmp.to_int).&(0x1_u32) << 9
      end

      unless adc34_ext15_rmp.nil?
        value = (value & 0xfffffbff_u32) |
                UInt32.new!(adc34_ext15_rmp.to_int).&(0x1_u32) << 10
      end

      unless adc34_jext5_rmp.nil?
        value = (value & 0xfffff7ff_u32) |
                UInt32.new!(adc34_jext5_rmp.to_int).&(0x1_u32) << 11
      end

      unless adc34_jext11_rmp.nil?
        value = (value & 0xffffefff_u32) |
                UInt32.new!(adc34_jext11_rmp.to_int).&(0x1_u32) << 12
      end

      unless adc34_jext14_rmp.nil?
        value = (value & 0xffffdfff_u32) |
                UInt32.new!(adc34_jext14_rmp.to_int).&(0x1_u32) << 13
      end

      self.class.new(value)
    end

    def self.set(
      *,
      adc12_ext2_rmp : ADC12_EXT2_RMP? = nil,
      adc12_ext3_rmp : ADC12_EXT3_RMP? = nil,
      adc12_ext5_rmp : ADC12_EXT5_RMP? = nil,
      adc12_ext13_rmp : ADC12_EXT13_RMP? = nil,
      adc12_ext15_rmp : ADC12_EXT15_RMP? = nil,
      adc12_jext3_rmp : ADC12_JEXT3_RMP? = nil,
      adc12_jext6_rmp : ADC12_JEXT6_RMP? = nil,
      adc12_jext13_rmp : ADC12_JEXT13_RMP? = nil,
      adc34_ext5_rmp : ADC34_EXT5_RMP? = nil,
      adc34_ext6_rmp : ADC34_EXT6_RMP? = nil,
      adc34_ext15_rmp : ADC34_EXT15_RMP? = nil,
      adc34_jext5_rmp : ADC34_JEXT5_RMP? = nil,
      adc34_jext11_rmp : ADC34_JEXT11_RMP? = nil,
      adc34_jext14_rmp : ADC34_JEXT14_RMP? = nil
    ) : Nil
      self.value = self.value.copy_with(
        adc12_ext2_rmp: adc12_ext2_rmp,
        adc12_ext3_rmp: adc12_ext3_rmp,
        adc12_ext5_rmp: adc12_ext5_rmp,
        adc12_ext13_rmp: adc12_ext13_rmp,
        adc12_ext15_rmp: adc12_ext15_rmp,
        adc12_jext3_rmp: adc12_jext3_rmp,
        adc12_jext6_rmp: adc12_jext6_rmp,
        adc12_jext13_rmp: adc12_jext13_rmp,
        adc34_ext5_rmp: adc34_ext5_rmp,
        adc34_ext6_rmp: adc34_ext6_rmp,
        adc34_ext15_rmp: adc34_ext15_rmp,
        adc34_jext5_rmp: adc34_jext5_rmp,
        adc34_jext11_rmp: adc34_jext11_rmp,
        adc34_jext14_rmp: adc34_jext14_rmp,
      )
    end
  end # struct

end
