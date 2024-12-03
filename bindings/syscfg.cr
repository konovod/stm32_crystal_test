# System configuration controller
module SYSCFG
  VERSION      = nil
  BASE_ADDRESS = 0x40013800_u64

  # memory remap register
  struct MEMRM
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

    # Memory mapping selection
    def mem_mode : UInt8
      UInt8.new!((@value >> 0) & 0x7_u32)
    end

    # Memory mapping selection
    def self.mem_mode : UInt8
      value.mem_mode
    end

    # Memory mapping selection
    def self.mem_mode=(value : UInt8) : UInt8
      self.set(mem_mode: value)
      value
    end

    # Flash bank mode selection
    def fb_mode : Bool
      @value.bits_set?(0x100_u32)
    end

    # Flash bank mode selection
    def self.fb_mode : Bool
      value.fb_mode
    end

    # Flash bank mode selection
    def self.fb_mode=(value : Bool) : Bool
      self.set(fb_mode: value)
      value
    end

    # FMC memory mapping swap
    def swp_fmc : UInt8
      UInt8.new!((@value >> 10) & 0x3_u32)
    end

    # FMC memory mapping swap
    def self.swp_fmc : UInt8
      value.swp_fmc
    end

    # FMC memory mapping swap
    def self.swp_fmc=(value : UInt8) : UInt8
      self.set(swp_fmc: value)
      value
    end

    def copy_with(
      *,

      mem_mode : UInt8? = nil,

      fb_mode : Bool? = nil,

      swp_fmc : UInt8? = nil
    ) : self
      value = @value

      unless mem_mode.nil?
        value = (value & 0xfffffff8_u32) |
                UInt32.new!(mem_mode.to_int).&(0x7_u32) << 0
      end

      unless fb_mode.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(fb_mode.to_int).&(0x1_u32) << 8
      end

      unless swp_fmc.nil?
        value = (value & 0xfffff3ff_u32) |
                UInt32.new!(swp_fmc.to_int).&(0x3_u32) << 10
      end

      self.class.new(value)
    end

    def self.set(
      *,
      mem_mode : UInt8? = nil,
      fb_mode : Bool? = nil,
      swp_fmc : UInt8? = nil
    ) : Nil
      self.value = self.value.copy_with(
        mem_mode: mem_mode,
        fb_mode: fb_mode,
        swp_fmc: swp_fmc,
      )
    end
  end # struct

  # peripheral mode configuration          register
  struct PMC
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

    # Ethernet PHY interface              selection
    def mii_rmii_sel : Bool
      @value.bits_set?(0x800000_u32)
    end

    # Ethernet PHY interface              selection
    def self.mii_rmii_sel : Bool
      value.mii_rmii_sel
    end

    # Ethernet PHY interface              selection
    def self.mii_rmii_sel=(value : Bool) : Bool
      self.set(mii_rmii_sel: value)
      value
    end

    # ADC1DC2
    def adc1_dc2 : Bool
      @value.bits_set?(0x10000_u32)
    end

    # ADC1DC2
    def self.adc1_dc2 : Bool
      value.adc1_dc2
    end

    # ADC1DC2
    def self.adc1_dc2=(value : Bool) : Bool
      self.set(adc1_dc2: value)
      value
    end

    # ADC2DC2
    def adc2_dc2 : Bool
      @value.bits_set?(0x20000_u32)
    end

    # ADC2DC2
    def self.adc2_dc2 : Bool
      value.adc2_dc2
    end

    # ADC2DC2
    def self.adc2_dc2=(value : Bool) : Bool
      self.set(adc2_dc2: value)
      value
    end

    # ADC3DC2
    def adc3_dc2 : Bool
      @value.bits_set?(0x40000_u32)
    end

    # ADC3DC2
    def self.adc3_dc2 : Bool
      value.adc3_dc2
    end

    # ADC3DC2
    def self.adc3_dc2=(value : Bool) : Bool
      self.set(adc3_dc2: value)
      value
    end

    def copy_with(
      *,

      mii_rmii_sel : Bool? = nil,

      adc1_dc2 : Bool? = nil,

      adc2_dc2 : Bool? = nil,

      adc3_dc2 : Bool? = nil
    ) : self
      value = @value

      unless mii_rmii_sel.nil?
        value = (value & 0xff7fffff_u32) |
                UInt32.new!(mii_rmii_sel.to_int).&(0x1_u32) << 23
      end

      unless adc1_dc2.nil?
        value = (value & 0xfffeffff_u32) |
                UInt32.new!(adc1_dc2.to_int).&(0x1_u32) << 16
      end

      unless adc2_dc2.nil?
        value = (value & 0xfffdffff_u32) |
                UInt32.new!(adc2_dc2.to_int).&(0x1_u32) << 17
      end

      unless adc3_dc2.nil?
        value = (value & 0xfffbffff_u32) |
                UInt32.new!(adc3_dc2.to_int).&(0x1_u32) << 18
      end

      self.class.new(value)
    end

    def self.set(
      *,
      mii_rmii_sel : Bool? = nil,
      adc1_dc2 : Bool? = nil,
      adc2_dc2 : Bool? = nil,
      adc3_dc2 : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        mii_rmii_sel: mii_rmii_sel,
        adc1_dc2: adc1_dc2,
        adc2_dc2: adc2_dc2,
        adc3_dc2: adc3_dc2,
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

    # EXTI x configuration (x = 0 to              3)
    def exti3 : UInt8
      UInt8.new!((@value >> 12) & 0xf_u32)
    end

    # EXTI x configuration (x = 0 to              3)
    def self.exti3 : UInt8
      value.exti3
    end

    # EXTI x configuration (x = 0 to              3)
    def self.exti3=(value : UInt8) : UInt8
      self.set(exti3: value)
      value
    end

    # EXTI x configuration (x = 0 to              3)
    def exti2 : UInt8
      UInt8.new!((@value >> 8) & 0xf_u32)
    end

    # EXTI x configuration (x = 0 to              3)
    def self.exti2 : UInt8
      value.exti2
    end

    # EXTI x configuration (x = 0 to              3)
    def self.exti2=(value : UInt8) : UInt8
      self.set(exti2: value)
      value
    end

    # EXTI x configuration (x = 0 to              3)
    def exti1 : UInt8
      UInt8.new!((@value >> 4) & 0xf_u32)
    end

    # EXTI x configuration (x = 0 to              3)
    def self.exti1 : UInt8
      value.exti1
    end

    # EXTI x configuration (x = 0 to              3)
    def self.exti1=(value : UInt8) : UInt8
      self.set(exti1: value)
      value
    end

    # EXTI x configuration (x = 0 to              3)
    def exti0 : UInt8
      UInt8.new!((@value >> 0) & 0xf_u32)
    end

    # EXTI x configuration (x = 0 to              3)
    def self.exti0 : UInt8
      value.exti0
    end

    # EXTI x configuration (x = 0 to              3)
    def self.exti0=(value : UInt8) : UInt8
      self.set(exti0: value)
      value
    end

    def copy_with(
      *,

      exti3 : UInt8? = nil,

      exti2 : UInt8? = nil,

      exti1 : UInt8? = nil,

      exti0 : UInt8? = nil
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
      exti3 : UInt8? = nil,
      exti2 : UInt8? = nil,
      exti1 : UInt8? = nil,
      exti0 : UInt8? = nil
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

    # EXTI x configuration (x = 4 to              7)
    def exti7 : UInt8
      UInt8.new!((@value >> 12) & 0xf_u32)
    end

    # EXTI x configuration (x = 4 to              7)
    def self.exti7 : UInt8
      value.exti7
    end

    # EXTI x configuration (x = 4 to              7)
    def self.exti7=(value : UInt8) : UInt8
      self.set(exti7: value)
      value
    end

    # EXTI x configuration (x = 4 to              7)
    def exti6 : UInt8
      UInt8.new!((@value >> 8) & 0xf_u32)
    end

    # EXTI x configuration (x = 4 to              7)
    def self.exti6 : UInt8
      value.exti6
    end

    # EXTI x configuration (x = 4 to              7)
    def self.exti6=(value : UInt8) : UInt8
      self.set(exti6: value)
      value
    end

    # EXTI x configuration (x = 4 to              7)
    def exti5 : UInt8
      UInt8.new!((@value >> 4) & 0xf_u32)
    end

    # EXTI x configuration (x = 4 to              7)
    def self.exti5 : UInt8
      value.exti5
    end

    # EXTI x configuration (x = 4 to              7)
    def self.exti5=(value : UInt8) : UInt8
      self.set(exti5: value)
      value
    end

    # EXTI x configuration (x = 4 to              7)
    def exti4 : UInt8
      UInt8.new!((@value >> 0) & 0xf_u32)
    end

    # EXTI x configuration (x = 4 to              7)
    def self.exti4 : UInt8
      value.exti4
    end

    # EXTI x configuration (x = 4 to              7)
    def self.exti4=(value : UInt8) : UInt8
      self.set(exti4: value)
      value
    end

    def copy_with(
      *,

      exti7 : UInt8? = nil,

      exti6 : UInt8? = nil,

      exti5 : UInt8? = nil,

      exti4 : UInt8? = nil
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
      exti7 : UInt8? = nil,
      exti6 : UInt8? = nil,
      exti5 : UInt8? = nil,
      exti4 : UInt8? = nil
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

    # EXTI x configuration (x = 8 to              11)
    def exti11 : UInt8
      UInt8.new!((@value >> 12) & 0xf_u32)
    end

    # EXTI x configuration (x = 8 to              11)
    def self.exti11 : UInt8
      value.exti11
    end

    # EXTI x configuration (x = 8 to              11)
    def self.exti11=(value : UInt8) : UInt8
      self.set(exti11: value)
      value
    end

    # EXTI10
    def exti10 : UInt8
      UInt8.new!((@value >> 8) & 0xf_u32)
    end

    # EXTI10
    def self.exti10 : UInt8
      value.exti10
    end

    # EXTI10
    def self.exti10=(value : UInt8) : UInt8
      self.set(exti10: value)
      value
    end

    # EXTI x configuration (x = 8 to              11)
    def exti9 : UInt8
      UInt8.new!((@value >> 4) & 0xf_u32)
    end

    # EXTI x configuration (x = 8 to              11)
    def self.exti9 : UInt8
      value.exti9
    end

    # EXTI x configuration (x = 8 to              11)
    def self.exti9=(value : UInt8) : UInt8
      self.set(exti9: value)
      value
    end

    # EXTI x configuration (x = 8 to              11)
    def exti8 : UInt8
      UInt8.new!((@value >> 0) & 0xf_u32)
    end

    # EXTI x configuration (x = 8 to              11)
    def self.exti8 : UInt8
      value.exti8
    end

    # EXTI x configuration (x = 8 to              11)
    def self.exti8=(value : UInt8) : UInt8
      self.set(exti8: value)
      value
    end

    def copy_with(
      *,

      exti11 : UInt8? = nil,

      exti10 : UInt8? = nil,

      exti9 : UInt8? = nil,

      exti8 : UInt8? = nil
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
      exti11 : UInt8? = nil,
      exti10 : UInt8? = nil,
      exti9 : UInt8? = nil,
      exti8 : UInt8? = nil
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

    # EXTI x configuration (x = 12 to              15)
    def exti15 : UInt8
      UInt8.new!((@value >> 12) & 0xf_u32)
    end

    # EXTI x configuration (x = 12 to              15)
    def self.exti15 : UInt8
      value.exti15
    end

    # EXTI x configuration (x = 12 to              15)
    def self.exti15=(value : UInt8) : UInt8
      self.set(exti15: value)
      value
    end

    # EXTI x configuration (x = 12 to              15)
    def exti14 : UInt8
      UInt8.new!((@value >> 8) & 0xf_u32)
    end

    # EXTI x configuration (x = 12 to              15)
    def self.exti14 : UInt8
      value.exti14
    end

    # EXTI x configuration (x = 12 to              15)
    def self.exti14=(value : UInt8) : UInt8
      self.set(exti14: value)
      value
    end

    # EXTI x configuration (x = 12 to              15)
    def exti13 : UInt8
      UInt8.new!((@value >> 4) & 0xf_u32)
    end

    # EXTI x configuration (x = 12 to              15)
    def self.exti13 : UInt8
      value.exti13
    end

    # EXTI x configuration (x = 12 to              15)
    def self.exti13=(value : UInt8) : UInt8
      self.set(exti13: value)
      value
    end

    # EXTI x configuration (x = 12 to              15)
    def exti12 : UInt8
      UInt8.new!((@value >> 0) & 0xf_u32)
    end

    # EXTI x configuration (x = 12 to              15)
    def self.exti12 : UInt8
      value.exti12
    end

    # EXTI x configuration (x = 12 to              15)
    def self.exti12=(value : UInt8) : UInt8
      self.set(exti12: value)
      value
    end

    def copy_with(
      *,

      exti15 : UInt8? = nil,

      exti14 : UInt8? = nil,

      exti13 : UInt8? = nil,

      exti12 : UInt8? = nil
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
      exti15 : UInt8? = nil,
      exti14 : UInt8? = nil,
      exti13 : UInt8? = nil,
      exti12 : UInt8? = nil
    ) : Nil
      self.value = self.value.copy_with(
        exti15: exti15,
        exti14: exti14,
        exti13: exti13,
        exti12: exti12,
      )
    end
  end # struct

  # Compensation cell control          register
  struct CMPCR
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

    # READY
    def ready : Bool
      @value.bits_set?(0x100_u32)
    end

    # READY
    def self.ready : Bool
      value.ready
    end

    # Compensation cell              power-down
    def cmp_pd : Bool
      @value.bits_set?(0x1_u32)
    end

    # Compensation cell              power-down
    def self.cmp_pd : Bool
      value.cmp_pd
    end
  end # struct

end
