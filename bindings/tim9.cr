# General purpose timers
module TIM9
  VERSION      = nil
  BASE_ADDRESS = 0x40014000_u64

  # control register 1
  struct CR1
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

    # Clock division
    def ckd : UInt8
      UInt8.new!((@value >> 8) & 0x3_u32)
    end

    # Clock division
    def self.ckd : UInt8
      value.ckd
    end

    # Clock division
    def self.ckd=(value : UInt8) : UInt8
      self.set(ckd: value)
      value
    end

    # Auto-reload preload enable
    def arpe : Bool
      @value.bits_set?(0x80_u32)
    end

    # Auto-reload preload enable
    def self.arpe : Bool
      value.arpe
    end

    # Auto-reload preload enable
    def self.arpe=(value : Bool) : Bool
      self.set(arpe: value)
      value
    end

    # One-pulse mode
    def opm : Bool
      @value.bits_set?(0x8_u32)
    end

    # One-pulse mode
    def self.opm : Bool
      value.opm
    end

    # One-pulse mode
    def self.opm=(value : Bool) : Bool
      self.set(opm: value)
      value
    end

    # Update request source
    def urs : Bool
      @value.bits_set?(0x4_u32)
    end

    # Update request source
    def self.urs : Bool
      value.urs
    end

    # Update request source
    def self.urs=(value : Bool) : Bool
      self.set(urs: value)
      value
    end

    # Update disable
    def udis : Bool
      @value.bits_set?(0x2_u32)
    end

    # Update disable
    def self.udis : Bool
      value.udis
    end

    # Update disable
    def self.udis=(value : Bool) : Bool
      self.set(udis: value)
      value
    end

    # Counter enable
    def cen : Bool
      @value.bits_set?(0x1_u32)
    end

    # Counter enable
    def self.cen : Bool
      value.cen
    end

    # Counter enable
    def self.cen=(value : Bool) : Bool
      self.set(cen: value)
      value
    end

    def copy_with(
      *,

      ckd : UInt8? = nil,

      arpe : Bool? = nil,

      opm : Bool? = nil,

      urs : Bool? = nil,

      udis : Bool? = nil,

      cen : Bool? = nil
    ) : self
      value = @value

      unless ckd.nil?
        value = (value & 0xfffffcff_u32) |
                UInt32.new!(ckd.to_int).&(0x3_u32) << 8
      end

      unless arpe.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(arpe.to_int).&(0x1_u32) << 7
      end

      unless opm.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(opm.to_int).&(0x1_u32) << 3
      end

      unless urs.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(urs.to_int).&(0x1_u32) << 2
      end

      unless udis.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(udis.to_int).&(0x1_u32) << 1
      end

      unless cen.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(cen.to_int).&(0x1_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      ckd : UInt8? = nil,
      arpe : Bool? = nil,
      opm : Bool? = nil,
      urs : Bool? = nil,
      udis : Bool? = nil,
      cen : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        ckd: ckd,
        arpe: arpe,
        opm: opm,
        urs: urs,
        udis: udis,
        cen: cen,
      )
    end
  end # struct

  # control register 2
  struct CR2
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

    # Master mode selection
    def mms : UInt8
      UInt8.new!((@value >> 4) & 0x7_u32)
    end

    # Master mode selection
    def self.mms : UInt8
      value.mms
    end

    # Master mode selection
    def self.mms=(value : UInt8) : UInt8
      self.set(mms: value)
      value
    end

    def copy_with(
      *,

      mms : UInt8? = nil
    ) : self
      value = @value

      unless mms.nil?
        value = (value & 0xffffff8f_u32) |
                UInt32.new!(mms.to_int).&(0x7_u32) << 4
      end

      self.class.new(value)
    end

    def self.set(
      *,
      mms : UInt8? = nil
    ) : Nil
      self.value = self.value.copy_with(
        mms: mms,
      )
    end
  end # struct

  # slave mode control register
  struct SMCR
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

    # Master/Slave mode
    def msm : Bool
      @value.bits_set?(0x80_u32)
    end

    # Master/Slave mode
    def self.msm : Bool
      value.msm
    end

    # Master/Slave mode
    def self.msm=(value : Bool) : Bool
      self.set(msm: value)
      value
    end

    # Trigger selection
    def ts : UInt8
      UInt8.new!((@value >> 4) & 0x7_u32)
    end

    # Trigger selection
    def self.ts : UInt8
      value.ts
    end

    # Trigger selection
    def self.ts=(value : UInt8) : UInt8
      self.set(ts: value)
      value
    end

    # Slave mode selection
    def sms : UInt8
      UInt8.new!((@value >> 0) & 0x7_u32)
    end

    # Slave mode selection
    def self.sms : UInt8
      value.sms
    end

    # Slave mode selection
    def self.sms=(value : UInt8) : UInt8
      self.set(sms: value)
      value
    end

    def copy_with(
      *,

      msm : Bool? = nil,

      ts : UInt8? = nil,

      sms : UInt8? = nil
    ) : self
      value = @value

      unless msm.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(msm.to_int).&(0x1_u32) << 7
      end

      unless ts.nil?
        value = (value & 0xffffff8f_u32) |
                UInt32.new!(ts.to_int).&(0x7_u32) << 4
      end

      unless sms.nil?
        value = (value & 0xfffffff8_u32) |
                UInt32.new!(sms.to_int).&(0x7_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      msm : Bool? = nil,
      ts : UInt8? = nil,
      sms : UInt8? = nil
    ) : Nil
      self.value = self.value.copy_with(
        msm: msm,
        ts: ts,
        sms: sms,
      )
    end
  end # struct

  # DMA/Interrupt enable register
  struct DIER
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

    # Trigger interrupt enable
    def tie : Bool
      @value.bits_set?(0x40_u32)
    end

    # Trigger interrupt enable
    def self.tie : Bool
      value.tie
    end

    # Trigger interrupt enable
    def self.tie=(value : Bool) : Bool
      self.set(tie: value)
      value
    end

    # Capture/Compare 2 interrupt              enable
    def cc2_ie : Bool
      @value.bits_set?(0x4_u32)
    end

    # Capture/Compare 2 interrupt              enable
    def self.cc2_ie : Bool
      value.cc2_ie
    end

    # Capture/Compare 2 interrupt              enable
    def self.cc2_ie=(value : Bool) : Bool
      self.set(cc2_ie: value)
      value
    end

    # Capture/Compare 1 interrupt              enable
    def cc1_ie : Bool
      @value.bits_set?(0x2_u32)
    end

    # Capture/Compare 1 interrupt              enable
    def self.cc1_ie : Bool
      value.cc1_ie
    end

    # Capture/Compare 1 interrupt              enable
    def self.cc1_ie=(value : Bool) : Bool
      self.set(cc1_ie: value)
      value
    end

    # Update interrupt enable
    def uie : Bool
      @value.bits_set?(0x1_u32)
    end

    # Update interrupt enable
    def self.uie : Bool
      value.uie
    end

    # Update interrupt enable
    def self.uie=(value : Bool) : Bool
      self.set(uie: value)
      value
    end

    def copy_with(
      *,

      tie : Bool? = nil,

      cc2_ie : Bool? = nil,

      cc1_ie : Bool? = nil,

      uie : Bool? = nil
    ) : self
      value = @value

      unless tie.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(tie.to_int).&(0x1_u32) << 6
      end

      unless cc2_ie.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(cc2_ie.to_int).&(0x1_u32) << 2
      end

      unless cc1_ie.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(cc1_ie.to_int).&(0x1_u32) << 1
      end

      unless uie.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(uie.to_int).&(0x1_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      tie : Bool? = nil,
      cc2_ie : Bool? = nil,
      cc1_ie : Bool? = nil,
      uie : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        tie: tie,
        cc2_ie: cc2_ie,
        cc1_ie: cc1_ie,
        uie: uie,
      )
    end
  end # struct

  # status register
  struct SR
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

    # Capture/compare 2 overcapture              flag
    def cc2_of : Bool
      @value.bits_set?(0x400_u32)
    end

    # Capture/compare 2 overcapture              flag
    def self.cc2_of : Bool
      value.cc2_of
    end

    # Capture/compare 2 overcapture              flag
    def self.cc2_of=(value : Bool) : Bool
      self.set(cc2_of: value)
      value
    end

    # Capture/Compare 1 overcapture              flag
    def cc1_of : Bool
      @value.bits_set?(0x200_u32)
    end

    # Capture/Compare 1 overcapture              flag
    def self.cc1_of : Bool
      value.cc1_of
    end

    # Capture/Compare 1 overcapture              flag
    def self.cc1_of=(value : Bool) : Bool
      self.set(cc1_of: value)
      value
    end

    # Trigger interrupt flag
    def tif : Bool
      @value.bits_set?(0x40_u32)
    end

    # Trigger interrupt flag
    def self.tif : Bool
      value.tif
    end

    # Trigger interrupt flag
    def self.tif=(value : Bool) : Bool
      self.set(tif: value)
      value
    end

    # Capture/Compare 2 interrupt              flag
    def cc2_if : Bool
      @value.bits_set?(0x4_u32)
    end

    # Capture/Compare 2 interrupt              flag
    def self.cc2_if : Bool
      value.cc2_if
    end

    # Capture/Compare 2 interrupt              flag
    def self.cc2_if=(value : Bool) : Bool
      self.set(cc2_if: value)
      value
    end

    # Capture/compare 1 interrupt              flag
    def cc1_if : Bool
      @value.bits_set?(0x2_u32)
    end

    # Capture/compare 1 interrupt              flag
    def self.cc1_if : Bool
      value.cc1_if
    end

    # Capture/compare 1 interrupt              flag
    def self.cc1_if=(value : Bool) : Bool
      self.set(cc1_if: value)
      value
    end

    # Update interrupt flag
    def uif : Bool
      @value.bits_set?(0x1_u32)
    end

    # Update interrupt flag
    def self.uif : Bool
      value.uif
    end

    # Update interrupt flag
    def self.uif=(value : Bool) : Bool
      self.set(uif: value)
      value
    end

    def copy_with(
      *,

      cc2_of : Bool? = nil,

      cc1_of : Bool? = nil,

      tif : Bool? = nil,

      cc2_if : Bool? = nil,

      cc1_if : Bool? = nil,

      uif : Bool? = nil
    ) : self
      value = @value

      unless cc2_of.nil?
        value = (value & 0xfffffbff_u32) |
                UInt32.new!(cc2_of.to_int).&(0x1_u32) << 10
      end

      unless cc1_of.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(cc1_of.to_int).&(0x1_u32) << 9
      end

      unless tif.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(tif.to_int).&(0x1_u32) << 6
      end

      unless cc2_if.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(cc2_if.to_int).&(0x1_u32) << 2
      end

      unless cc1_if.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(cc1_if.to_int).&(0x1_u32) << 1
      end

      unless uif.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(uif.to_int).&(0x1_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      cc2_of : Bool? = nil,
      cc1_of : Bool? = nil,
      tif : Bool? = nil,
      cc2_if : Bool? = nil,
      cc1_if : Bool? = nil,
      uif : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        cc2_of: cc2_of,
        cc1_of: cc1_of,
        tif: tif,
        cc2_if: cc2_if,
        cc1_if: cc1_if,
        uif: uif,
      )
    end
  end # struct

  # event generation register
  struct EGR
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

    # Trigger generation
    def self.tg=(value : Bool) : Bool
      self.set(tg: value)
      value
    end

    # Capture/compare 2              generation
    def self.cc2_g=(value : Bool) : Bool
      self.set(cc2_g: value)
      value
    end

    # Capture/compare 1              generation
    def self.cc1_g=(value : Bool) : Bool
      self.set(cc1_g: value)
      value
    end

    # Update generation
    def self.ug=(value : Bool) : Bool
      self.set(ug: value)
      value
    end

    def copy_with(
      *,

      tg : Bool? = nil,

      cc2_g : Bool? = nil,

      cc1_g : Bool? = nil,

      ug : Bool? = nil
    ) : self
      value = @value

      unless tg.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(tg.to_int).&(0x1_u32) << 6
      end

      unless cc2_g.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(cc2_g.to_int).&(0x1_u32) << 2
      end

      unless cc1_g.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(cc1_g.to_int).&(0x1_u32) << 1
      end

      unless ug.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(ug.to_int).&(0x1_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      tg : Bool? = nil,
      cc2_g : Bool? = nil,
      cc1_g : Bool? = nil,
      ug : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        tg: tg,
        cc2_g: cc2_g,
        cc1_g: cc1_g,
        ug: ug,
      )
    end
  end # struct

  # capture/compare mode register 1 (output          mode)
  struct CCMR1_Output
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

    # Output Compare 2 mode
    def oc2_m : UInt8
      UInt8.new!((@value >> 12) & 0x7_u32)
    end

    # Output Compare 2 mode
    def self.oc2_m : UInt8
      value.oc2_m
    end

    # Output Compare 2 mode
    def self.oc2_m=(value : UInt8) : UInt8
      self.set(oc2_m: value)
      value
    end

    # Output Compare 2 preload              enable
    def oc2_pe : Bool
      @value.bits_set?(0x800_u32)
    end

    # Output Compare 2 preload              enable
    def self.oc2_pe : Bool
      value.oc2_pe
    end

    # Output Compare 2 preload              enable
    def self.oc2_pe=(value : Bool) : Bool
      self.set(oc2_pe: value)
      value
    end

    # Output Compare 2 fast              enable
    def oc2_fe : Bool
      @value.bits_set?(0x400_u32)
    end

    # Output Compare 2 fast              enable
    def self.oc2_fe : Bool
      value.oc2_fe
    end

    # Output Compare 2 fast              enable
    def self.oc2_fe=(value : Bool) : Bool
      self.set(oc2_fe: value)
      value
    end

    # Capture/Compare 2              selection
    def cc2_s : UInt8
      UInt8.new!((@value >> 8) & 0x3_u32)
    end

    # Capture/Compare 2              selection
    def self.cc2_s : UInt8
      value.cc2_s
    end

    # Capture/Compare 2              selection
    def self.cc2_s=(value : UInt8) : UInt8
      self.set(cc2_s: value)
      value
    end

    # Output Compare 1 mode
    def oc1_m : UInt8
      UInt8.new!((@value >> 4) & 0x7_u32)
    end

    # Output Compare 1 mode
    def self.oc1_m : UInt8
      value.oc1_m
    end

    # Output Compare 1 mode
    def self.oc1_m=(value : UInt8) : UInt8
      self.set(oc1_m: value)
      value
    end

    # Output Compare 1 preload              enable
    def oc1_pe : Bool
      @value.bits_set?(0x8_u32)
    end

    # Output Compare 1 preload              enable
    def self.oc1_pe : Bool
      value.oc1_pe
    end

    # Output Compare 1 preload              enable
    def self.oc1_pe=(value : Bool) : Bool
      self.set(oc1_pe: value)
      value
    end

    # Output Compare 1 fast              enable
    def oc1_fe : Bool
      @value.bits_set?(0x4_u32)
    end

    # Output Compare 1 fast              enable
    def self.oc1_fe : Bool
      value.oc1_fe
    end

    # Output Compare 1 fast              enable
    def self.oc1_fe=(value : Bool) : Bool
      self.set(oc1_fe: value)
      value
    end

    # Capture/Compare 1              selection
    def cc1_s : UInt8
      UInt8.new!((@value >> 0) & 0x3_u32)
    end

    # Capture/Compare 1              selection
    def self.cc1_s : UInt8
      value.cc1_s
    end

    # Capture/Compare 1              selection
    def self.cc1_s=(value : UInt8) : UInt8
      self.set(cc1_s: value)
      value
    end

    def copy_with(
      *,

      oc2_m : UInt8? = nil,

      oc2_pe : Bool? = nil,

      oc2_fe : Bool? = nil,

      cc2_s : UInt8? = nil,

      oc1_m : UInt8? = nil,

      oc1_pe : Bool? = nil,

      oc1_fe : Bool? = nil,

      cc1_s : UInt8? = nil
    ) : self
      value = @value

      unless oc2_m.nil?
        value = (value & 0xffff8fff_u32) |
                UInt32.new!(oc2_m.to_int).&(0x7_u32) << 12
      end

      unless oc2_pe.nil?
        value = (value & 0xfffff7ff_u32) |
                UInt32.new!(oc2_pe.to_int).&(0x1_u32) << 11
      end

      unless oc2_fe.nil?
        value = (value & 0xfffffbff_u32) |
                UInt32.new!(oc2_fe.to_int).&(0x1_u32) << 10
      end

      unless cc2_s.nil?
        value = (value & 0xfffffcff_u32) |
                UInt32.new!(cc2_s.to_int).&(0x3_u32) << 8
      end

      unless oc1_m.nil?
        value = (value & 0xffffff8f_u32) |
                UInt32.new!(oc1_m.to_int).&(0x7_u32) << 4
      end

      unless oc1_pe.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(oc1_pe.to_int).&(0x1_u32) << 3
      end

      unless oc1_fe.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(oc1_fe.to_int).&(0x1_u32) << 2
      end

      unless cc1_s.nil?
        value = (value & 0xfffffffc_u32) |
                UInt32.new!(cc1_s.to_int).&(0x3_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      oc2_m : UInt8? = nil,
      oc2_pe : Bool? = nil,
      oc2_fe : Bool? = nil,
      cc2_s : UInt8? = nil,
      oc1_m : UInt8? = nil,
      oc1_pe : Bool? = nil,
      oc1_fe : Bool? = nil,
      cc1_s : UInt8? = nil
    ) : Nil
      self.value = self.value.copy_with(
        oc2_m: oc2_m,
        oc2_pe: oc2_pe,
        oc2_fe: oc2_fe,
        cc2_s: cc2_s,
        oc1_m: oc1_m,
        oc1_pe: oc1_pe,
        oc1_fe: oc1_fe,
        cc1_s: cc1_s,
      )
    end
  end # struct

  # capture/compare mode register 1 (input          mode)
  struct CCMR1_Input
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

    # Input capture 2 filter
    def ic2_f : UInt8
      UInt8.new!((@value >> 12) & 0x7_u32)
    end

    # Input capture 2 filter
    def self.ic2_f : UInt8
      value.ic2_f
    end

    # Input capture 2 filter
    def self.ic2_f=(value : UInt8) : UInt8
      self.set(ic2_f: value)
      value
    end

    # Input capture 2 prescaler
    def ic2_pcs : UInt8
      UInt8.new!((@value >> 10) & 0x3_u32)
    end

    # Input capture 2 prescaler
    def self.ic2_pcs : UInt8
      value.ic2_pcs
    end

    # Input capture 2 prescaler
    def self.ic2_pcs=(value : UInt8) : UInt8
      self.set(ic2_pcs: value)
      value
    end

    # Capture/Compare 2              selection
    def cc2_s : UInt8
      UInt8.new!((@value >> 8) & 0x3_u32)
    end

    # Capture/Compare 2              selection
    def self.cc2_s : UInt8
      value.cc2_s
    end

    # Capture/Compare 2              selection
    def self.cc2_s=(value : UInt8) : UInt8
      self.set(cc2_s: value)
      value
    end

    # Input capture 1 filter
    def ic1_f : UInt8
      UInt8.new!((@value >> 4) & 0x7_u32)
    end

    # Input capture 1 filter
    def self.ic1_f : UInt8
      value.ic1_f
    end

    # Input capture 1 filter
    def self.ic1_f=(value : UInt8) : UInt8
      self.set(ic1_f: value)
      value
    end

    # Input capture 1 prescaler
    def icpcs : UInt8
      UInt8.new!((@value >> 2) & 0x3_u32)
    end

    # Input capture 1 prescaler
    def self.icpcs : UInt8
      value.icpcs
    end

    # Input capture 1 prescaler
    def self.icpcs=(value : UInt8) : UInt8
      self.set(icpcs: value)
      value
    end

    # Capture/Compare 1              selection
    def cc1_s : UInt8
      UInt8.new!((@value >> 0) & 0x3_u32)
    end

    # Capture/Compare 1              selection
    def self.cc1_s : UInt8
      value.cc1_s
    end

    # Capture/Compare 1              selection
    def self.cc1_s=(value : UInt8) : UInt8
      self.set(cc1_s: value)
      value
    end

    def copy_with(
      *,

      ic2_f : UInt8? = nil,

      ic2_pcs : UInt8? = nil,

      cc2_s : UInt8? = nil,

      ic1_f : UInt8? = nil,

      icpcs : UInt8? = nil,

      cc1_s : UInt8? = nil
    ) : self
      value = @value

      unless ic2_f.nil?
        value = (value & 0xffff8fff_u32) |
                UInt32.new!(ic2_f.to_int).&(0x7_u32) << 12
      end

      unless ic2_pcs.nil?
        value = (value & 0xfffff3ff_u32) |
                UInt32.new!(ic2_pcs.to_int).&(0x3_u32) << 10
      end

      unless cc2_s.nil?
        value = (value & 0xfffffcff_u32) |
                UInt32.new!(cc2_s.to_int).&(0x3_u32) << 8
      end

      unless ic1_f.nil?
        value = (value & 0xffffff8f_u32) |
                UInt32.new!(ic1_f.to_int).&(0x7_u32) << 4
      end

      unless icpcs.nil?
        value = (value & 0xfffffff3_u32) |
                UInt32.new!(icpcs.to_int).&(0x3_u32) << 2
      end

      unless cc1_s.nil?
        value = (value & 0xfffffffc_u32) |
                UInt32.new!(cc1_s.to_int).&(0x3_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      ic2_f : UInt8? = nil,
      ic2_pcs : UInt8? = nil,
      cc2_s : UInt8? = nil,
      ic1_f : UInt8? = nil,
      icpcs : UInt8? = nil,
      cc1_s : UInt8? = nil
    ) : Nil
      self.value = self.value.copy_with(
        ic2_f: ic2_f,
        ic2_pcs: ic2_pcs,
        cc2_s: cc2_s,
        ic1_f: ic1_f,
        icpcs: icpcs,
        cc1_s: cc1_s,
      )
    end
  end # struct

  # capture/compare enable          register
  struct CCER
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

    # Capture/Compare 2 output              Polarity
    def cc2_np : Bool
      @value.bits_set?(0x80_u32)
    end

    # Capture/Compare 2 output              Polarity
    def self.cc2_np : Bool
      value.cc2_np
    end

    # Capture/Compare 2 output              Polarity
    def self.cc2_np=(value : Bool) : Bool
      self.set(cc2_np: value)
      value
    end

    # Capture/Compare 2 output              Polarity
    def cc2_p : Bool
      @value.bits_set?(0x20_u32)
    end

    # Capture/Compare 2 output              Polarity
    def self.cc2_p : Bool
      value.cc2_p
    end

    # Capture/Compare 2 output              Polarity
    def self.cc2_p=(value : Bool) : Bool
      self.set(cc2_p: value)
      value
    end

    # Capture/Compare 2 output              enable
    def cc2_e : Bool
      @value.bits_set?(0x10_u32)
    end

    # Capture/Compare 2 output              enable
    def self.cc2_e : Bool
      value.cc2_e
    end

    # Capture/Compare 2 output              enable
    def self.cc2_e=(value : Bool) : Bool
      self.set(cc2_e: value)
      value
    end

    # Capture/Compare 1 output              Polarity
    def cc1_np : Bool
      @value.bits_set?(0x8_u32)
    end

    # Capture/Compare 1 output              Polarity
    def self.cc1_np : Bool
      value.cc1_np
    end

    # Capture/Compare 1 output              Polarity
    def self.cc1_np=(value : Bool) : Bool
      self.set(cc1_np: value)
      value
    end

    # Capture/Compare 1 output              Polarity
    def cc1_p : Bool
      @value.bits_set?(0x2_u32)
    end

    # Capture/Compare 1 output              Polarity
    def self.cc1_p : Bool
      value.cc1_p
    end

    # Capture/Compare 1 output              Polarity
    def self.cc1_p=(value : Bool) : Bool
      self.set(cc1_p: value)
      value
    end

    # Capture/Compare 1 output              enable
    def cc1_e : Bool
      @value.bits_set?(0x1_u32)
    end

    # Capture/Compare 1 output              enable
    def self.cc1_e : Bool
      value.cc1_e
    end

    # Capture/Compare 1 output              enable
    def self.cc1_e=(value : Bool) : Bool
      self.set(cc1_e: value)
      value
    end

    def copy_with(
      *,

      cc2_np : Bool? = nil,

      cc2_p : Bool? = nil,

      cc2_e : Bool? = nil,

      cc1_np : Bool? = nil,

      cc1_p : Bool? = nil,

      cc1_e : Bool? = nil
    ) : self
      value = @value

      unless cc2_np.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(cc2_np.to_int).&(0x1_u32) << 7
      end

      unless cc2_p.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(cc2_p.to_int).&(0x1_u32) << 5
      end

      unless cc2_e.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(cc2_e.to_int).&(0x1_u32) << 4
      end

      unless cc1_np.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(cc1_np.to_int).&(0x1_u32) << 3
      end

      unless cc1_p.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(cc1_p.to_int).&(0x1_u32) << 1
      end

      unless cc1_e.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(cc1_e.to_int).&(0x1_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      cc2_np : Bool? = nil,
      cc2_p : Bool? = nil,
      cc2_e : Bool? = nil,
      cc1_np : Bool? = nil,
      cc1_p : Bool? = nil,
      cc1_e : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        cc2_np: cc2_np,
        cc2_p: cc2_p,
        cc2_e: cc2_e,
        cc1_np: cc1_np,
        cc1_p: cc1_p,
        cc1_e: cc1_e,
      )
    end
  end # struct

  # counter
  struct CNT
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

    # counter value
    def cnt : UInt16
      UInt16.new!((@value >> 0) & 0xffff_u32)
    end

    # counter value
    def self.cnt : UInt16
      value.cnt
    end

    # counter value
    def self.cnt=(value : UInt16) : UInt16
      self.set(cnt: value)
      value
    end

    def copy_with(
      *,

      cnt : UInt16? = nil
    ) : self
      value = @value

      unless cnt.nil?
        value = (value & 0xffff0000_u32) |
                UInt32.new!(cnt.to_int).&(0xffff_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      cnt : UInt16? = nil
    ) : Nil
      self.value = self.value.copy_with(
        cnt: cnt,
      )
    end
  end # struct

  # prescaler
  struct PSC
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

    # Prescaler value
    def psc : UInt16
      UInt16.new!((@value >> 0) & 0xffff_u32)
    end

    # Prescaler value
    def self.psc : UInt16
      value.psc
    end

    # Prescaler value
    def self.psc=(value : UInt16) : UInt16
      self.set(psc: value)
      value
    end

    def copy_with(
      *,

      psc : UInt16? = nil
    ) : self
      value = @value

      unless psc.nil?
        value = (value & 0xffff0000_u32) |
                UInt32.new!(psc.to_int).&(0xffff_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      psc : UInt16? = nil
    ) : Nil
      self.value = self.value.copy_with(
        psc: psc,
      )
    end
  end # struct

  # auto-reload register
  struct ARR
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

    # Auto-reload value
    def arr : UInt16
      UInt16.new!((@value >> 0) & 0xffff_u32)
    end

    # Auto-reload value
    def self.arr : UInt16
      value.arr
    end

    # Auto-reload value
    def self.arr=(value : UInt16) : UInt16
      self.set(arr: value)
      value
    end

    def copy_with(
      *,

      arr : UInt16? = nil
    ) : self
      value = @value

      unless arr.nil?
        value = (value & 0xffff0000_u32) |
                UInt32.new!(arr.to_int).&(0xffff_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      arr : UInt16? = nil
    ) : Nil
      self.value = self.value.copy_with(
        arr: arr,
      )
    end
  end # struct

  # capture/compare register 1
  struct CCR1
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

    # Capture/Compare 1 value
    def ccr1 : UInt16
      UInt16.new!((@value >> 0) & 0xffff_u32)
    end

    # Capture/Compare 1 value
    def self.ccr1 : UInt16
      value.ccr1
    end

    # Capture/Compare 1 value
    def self.ccr1=(value : UInt16) : UInt16
      self.set(ccr1: value)
      value
    end

    def copy_with(
      *,

      ccr1 : UInt16? = nil
    ) : self
      value = @value

      unless ccr1.nil?
        value = (value & 0xffff0000_u32) |
                UInt32.new!(ccr1.to_int).&(0xffff_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      ccr1 : UInt16? = nil
    ) : Nil
      self.value = self.value.copy_with(
        ccr1: ccr1,
      )
    end
  end # struct

  # capture/compare register 2
  struct CCR2
    ADDRESS = BASE_ADDRESS + 0x38_u64

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

    # Capture/Compare 2 value
    def ccr2 : UInt16
      UInt16.new!((@value >> 0) & 0xffff_u32)
    end

    # Capture/Compare 2 value
    def self.ccr2 : UInt16
      value.ccr2
    end

    # Capture/Compare 2 value
    def self.ccr2=(value : UInt16) : UInt16
      self.set(ccr2: value)
      value
    end

    def copy_with(
      *,

      ccr2 : UInt16? = nil
    ) : self
      value = @value

      unless ccr2.nil?
        value = (value & 0xffff0000_u32) |
                UInt32.new!(ccr2.to_int).&(0xffff_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      ccr2 : UInt16? = nil
    ) : Nil
      self.value = self.value.copy_with(
        ccr2: ccr2,
      )
    end
  end # struct

end
