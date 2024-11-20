# Power control
module PWR
  VERSION      = nil
  BASE_ADDRESS = 0x40007000_u64

  # power control register
  struct CR
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

    # Low-power deep sleep
    def lpds : Bool
      @value.bits_set?(0x1_u32)
    end

    # Low-power deep sleep
    def self.lpds : Bool
      value.lpds
    end

    # Low-power deep sleep
    def self.lpds=(value : Bool) : Bool
      self.set(lpds: value)
      value
    end

    enum PDDS : UInt8
      # Enter Stop mode when the CPU enters deepsleep
      STOP_MODE = 0x0_u64

      # Enter Standby mode when the CPU enters deepsleep
      STANDBY_MODE = 0x1_u64

      def self.reset_value : PDDS
        CR.reset_value.pdds
      end
    end

    # Power down deepsleep
    def pdds : PDDS
      PDDS.new!((@value >> 1) & 0x1_u32)
    end

    # Power down deepsleep
    def self.pdds : PDDS
      value.pdds
    end

    # Power down deepsleep
    def self.pdds=(value : PDDS) : PDDS
      self.set(pdds: value)
      value
    end

    # Clear wakeup flag
    def cwuf : Bool
      @value.bits_set?(0x4_u32)
    end

    # Clear wakeup flag
    def self.cwuf : Bool
      value.cwuf
    end

    # Clear wakeup flag
    def self.cwuf=(value : Bool) : Bool
      self.set(cwuf: value)
      value
    end

    # Clear standby flag
    def csbf : Bool
      @value.bits_set?(0x8_u32)
    end

    # Clear standby flag
    def self.csbf : Bool
      value.csbf
    end

    # Clear standby flag
    def self.csbf=(value : Bool) : Bool
      self.set(csbf: value)
      value
    end

    # Power voltage detector              enable
    def pvde : Bool
      @value.bits_set?(0x10_u32)
    end

    # Power voltage detector              enable
    def self.pvde : Bool
      value.pvde
    end

    # Power voltage detector              enable
    def self.pvde=(value : Bool) : Bool
      self.set(pvde: value)
      value
    end

    # PVD level selection
    def pls : UInt8
      UInt8.new!((@value >> 5) & 0x7_u32)
    end

    # PVD level selection
    def self.pls : UInt8
      value.pls
    end

    # PVD level selection
    def self.pls=(value : UInt8) : UInt8
      self.set(pls: value)
      value
    end

    # Disable backup domain write              protection
    def dbp : Bool
      @value.bits_set?(0x100_u32)
    end

    # Disable backup domain write              protection
    def self.dbp : Bool
      value.dbp
    end

    # Disable backup domain write              protection
    def self.dbp=(value : Bool) : Bool
      self.set(dbp: value)
      value
    end

    def copy_with(
      *,

      lpds : Bool? = nil,

      pdds : PDDS? = nil,

      cwuf : Bool? = nil,

      csbf : Bool? = nil,

      pvde : Bool? = nil,

      pls : UInt8? = nil,

      dbp : Bool? = nil
    ) : self
      value = @value

      unless lpds.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(lpds.to_int).&(0x1_u32) << 0
      end

      unless pdds.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(pdds.to_int).&(0x1_u32) << 1
      end

      unless cwuf.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(cwuf.to_int).&(0x1_u32) << 2
      end

      unless csbf.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(csbf.to_int).&(0x1_u32) << 3
      end

      unless pvde.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(pvde.to_int).&(0x1_u32) << 4
      end

      unless pls.nil?
        value = (value & 0xffffff1f_u32) |
                UInt32.new!(pls.to_int).&(0x7_u32) << 5
      end

      unless dbp.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(dbp.to_int).&(0x1_u32) << 8
      end

      self.class.new(value)
    end

    def self.set(
      *,
      lpds : Bool? = nil,
      pdds : PDDS? = nil,
      cwuf : Bool? = nil,
      csbf : Bool? = nil,
      pvde : Bool? = nil,
      pls : UInt8? = nil,
      dbp : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        lpds: lpds,
        pdds: pdds,
        cwuf: cwuf,
        csbf: csbf,
        pvde: pvde,
        pls: pls,
        dbp: dbp,
      )
    end
  end # struct

  # power control/status register
  struct CSR
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

    # Wakeup flag
    def wuf : Bool
      @value.bits_set?(0x1_u32)
    end

    # Wakeup flag
    def self.wuf : Bool
      value.wuf
    end

    # Standby flag
    def sbf : Bool
      @value.bits_set?(0x2_u32)
    end

    # Standby flag
    def self.sbf : Bool
      value.sbf
    end

    # PVD output
    def pvdo : Bool
      @value.bits_set?(0x4_u32)
    end

    # PVD output
    def self.pvdo : Bool
      value.pvdo
    end

    # Enable WKUP1 pin
    def ewup1 : Bool
      @value.bits_set?(0x100_u32)
    end

    # Enable WKUP1 pin
    def self.ewup1 : Bool
      value.ewup1
    end

    # Enable WKUP1 pin
    def self.ewup1=(value : Bool) : Bool
      self.set(ewup1: value)
      value
    end

    # Enable WKUP2 pin
    def ewup2 : Bool
      @value.bits_set?(0x200_u32)
    end

    # Enable WKUP2 pin
    def self.ewup2 : Bool
      value.ewup2
    end

    # Enable WKUP2 pin
    def self.ewup2=(value : Bool) : Bool
      self.set(ewup2: value)
      value
    end

    # Internal voltage reference ready flag
    def vrefintrdyf : Bool
      @value.bits_set?(0x8_u32)
    end

    # Internal voltage reference ready flag
    def self.vrefintrdyf : Bool
      value.vrefintrdyf
    end

    # Enable WKUP3 pin
    def ewup3 : Bool
      @value.bits_set?(0x400_u32)
    end

    # Enable WKUP3 pin
    def self.ewup3 : Bool
      value.ewup3
    end

    # Enable WKUP3 pin
    def self.ewup3=(value : Bool) : Bool
      self.set(ewup3: value)
      value
    end

    def copy_with(
      *,

      ewup1 : Bool? = nil,

      ewup2 : Bool? = nil,

      ewup3 : Bool? = nil
    ) : self
      value = @value

      unless ewup1.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(ewup1.to_int).&(0x1_u32) << 8
      end

      unless ewup2.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(ewup2.to_int).&(0x1_u32) << 9
      end

      unless ewup3.nil?
        value = (value & 0xfffffbff_u32) |
                UInt32.new!(ewup3.to_int).&(0x1_u32) << 10
      end

      self.class.new(value)
    end

    def self.set(
      *,
      ewup1 : Bool? = nil,
      ewup2 : Bool? = nil,
      ewup3 : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        ewup1: ewup1,
        ewup2: ewup2,
        ewup3: ewup3,
      )
    end
  end # struct

end
