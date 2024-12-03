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
      new(0xc000_u64)
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

    # Power down deepsleep
    def pdds : Bool
      @value.bits_set?(0x2_u32)
    end

    # Power down deepsleep
    def self.pdds : Bool
      value.pdds
    end

    # Power down deepsleep
    def self.pdds=(value : Bool) : Bool
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

    # Flash power down in Stop              mode
    def fpds : Bool
      @value.bits_set?(0x200_u32)
    end

    # Flash power down in Stop              mode
    def self.fpds : Bool
      value.fpds
    end

    # Flash power down in Stop              mode
    def self.fpds=(value : Bool) : Bool
      self.set(fpds: value)
      value
    end

    # Low-Power Regulator Low Voltage in              deepsleep
    def lplvds : Bool
      @value.bits_set?(0x400_u32)
    end

    # Low-Power Regulator Low Voltage in              deepsleep
    def self.lplvds : Bool
      value.lplvds
    end

    # Low-Power Regulator Low Voltage in              deepsleep
    def self.lplvds=(value : Bool) : Bool
      self.set(lplvds: value)
      value
    end

    # Main regulator low voltage in deepsleep              mode
    def mrlvds : Bool
      @value.bits_set?(0x800_u32)
    end

    # Main regulator low voltage in deepsleep              mode
    def self.mrlvds : Bool
      value.mrlvds
    end

    # Main regulator low voltage in deepsleep              mode
    def self.mrlvds=(value : Bool) : Bool
      self.set(mrlvds: value)
      value
    end

    # Regulator voltage scaling output              selection
    def vos : UInt8
      UInt8.new!((@value >> 14) & 0x3_u32)
    end

    # Regulator voltage scaling output              selection
    def self.vos : UInt8
      value.vos
    end

    # Regulator voltage scaling output              selection
    def self.vos=(value : UInt8) : UInt8
      self.set(vos: value)
      value
    end

    # Over-drive enable
    def oden : Bool
      @value.bits_set?(0x10000_u32)
    end

    # Over-drive enable
    def self.oden : Bool
      value.oden
    end

    # Over-drive enable
    def self.oden=(value : Bool) : Bool
      self.set(oden: value)
      value
    end

    # Over-drive switching              enabled
    def odswen : Bool
      @value.bits_set?(0x20000_u32)
    end

    # Over-drive switching              enabled
    def self.odswen : Bool
      value.odswen
    end

    # Over-drive switching              enabled
    def self.odswen=(value : Bool) : Bool
      self.set(odswen: value)
      value
    end

    # Under-drive enable in stop              mode
    def uden : UInt8
      UInt8.new!((@value >> 18) & 0x3_u32)
    end

    # Under-drive enable in stop              mode
    def self.uden : UInt8
      value.uden
    end

    # Under-drive enable in stop              mode
    def self.uden=(value : UInt8) : UInt8
      self.set(uden: value)
      value
    end

    def copy_with(
      *,

      lpds : Bool? = nil,

      pdds : Bool? = nil,

      cwuf : Bool? = nil,

      csbf : Bool? = nil,

      pvde : Bool? = nil,

      pls : UInt8? = nil,

      dbp : Bool? = nil,

      fpds : Bool? = nil,

      lplvds : Bool? = nil,

      mrlvds : Bool? = nil,

      vos : UInt8? = nil,

      oden : Bool? = nil,

      odswen : Bool? = nil,

      uden : UInt8? = nil
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

      unless fpds.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(fpds.to_int).&(0x1_u32) << 9
      end

      unless lplvds.nil?
        value = (value & 0xfffffbff_u32) |
                UInt32.new!(lplvds.to_int).&(0x1_u32) << 10
      end

      unless mrlvds.nil?
        value = (value & 0xfffff7ff_u32) |
                UInt32.new!(mrlvds.to_int).&(0x1_u32) << 11
      end

      unless vos.nil?
        value = (value & 0xffff3fff_u32) |
                UInt32.new!(vos.to_int).&(0x3_u32) << 14
      end

      unless oden.nil?
        value = (value & 0xfffeffff_u32) |
                UInt32.new!(oden.to_int).&(0x1_u32) << 16
      end

      unless odswen.nil?
        value = (value & 0xfffdffff_u32) |
                UInt32.new!(odswen.to_int).&(0x1_u32) << 17
      end

      unless uden.nil?
        value = (value & 0xfff3ffff_u32) |
                UInt32.new!(uden.to_int).&(0x3_u32) << 18
      end

      self.class.new(value)
    end

    def self.set(
      *,
      lpds : Bool? = nil,
      pdds : Bool? = nil,
      cwuf : Bool? = nil,
      csbf : Bool? = nil,
      pvde : Bool? = nil,
      pls : UInt8? = nil,
      dbp : Bool? = nil,
      fpds : Bool? = nil,
      lplvds : Bool? = nil,
      mrlvds : Bool? = nil,
      vos : UInt8? = nil,
      oden : Bool? = nil,
      odswen : Bool? = nil,
      uden : UInt8? = nil
    ) : Nil
      self.value = self.value.copy_with(
        lpds: lpds,
        pdds: pdds,
        cwuf: cwuf,
        csbf: csbf,
        pvde: pvde,
        pls: pls,
        dbp: dbp,
        fpds: fpds,
        lplvds: lplvds,
        mrlvds: mrlvds,
        vos: vos,
        oden: oden,
        odswen: odswen,
        uden: uden,
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

    # Backup regulator ready
    def brr : Bool
      @value.bits_set?(0x8_u32)
    end

    # Backup regulator ready
    def self.brr : Bool
      value.brr
    end

    # Enable WKUP pin
    def ewup : Bool
      @value.bits_set?(0x100_u32)
    end

    # Enable WKUP pin
    def self.ewup : Bool
      value.ewup
    end

    # Enable WKUP pin
    def self.ewup=(value : Bool) : Bool
      self.set(ewup: value)
      value
    end

    # Backup regulator enable
    def bre : Bool
      @value.bits_set?(0x200_u32)
    end

    # Backup regulator enable
    def self.bre : Bool
      value.bre
    end

    # Backup regulator enable
    def self.bre=(value : Bool) : Bool
      self.set(bre: value)
      value
    end

    # Regulator voltage scaling output              selection ready bit
    def vosrdy : Bool
      @value.bits_set?(0x4000_u32)
    end

    # Regulator voltage scaling output              selection ready bit
    def self.vosrdy : Bool
      value.vosrdy
    end

    # Regulator voltage scaling output              selection ready bit
    def self.vosrdy=(value : Bool) : Bool
      self.set(vosrdy: value)
      value
    end

    # Over-drive mode ready
    def odrdy : Bool
      @value.bits_set?(0x10000_u32)
    end

    # Over-drive mode ready
    def self.odrdy : Bool
      value.odrdy
    end

    # Over-drive mode switching              ready
    def odswrdy : Bool
      @value.bits_set?(0x20000_u32)
    end

    # Over-drive mode switching              ready
    def self.odswrdy : Bool
      value.odswrdy
    end

    # Under-drive ready flag
    def udrdy : UInt8
      UInt8.new!((@value >> 18) & 0x3_u32)
    end

    # Under-drive ready flag
    def self.udrdy : UInt8
      value.udrdy
    end

    # Under-drive ready flag
    def self.udrdy=(value : UInt8) : UInt8
      self.set(udrdy: value)
      value
    end

    def copy_with(
      *,

      ewup : Bool? = nil,

      bre : Bool? = nil,

      vosrdy : Bool? = nil,

      udrdy : UInt8? = nil
    ) : self
      value = @value

      unless ewup.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(ewup.to_int).&(0x1_u32) << 8
      end

      unless bre.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(bre.to_int).&(0x1_u32) << 9
      end

      unless vosrdy.nil?
        value = (value & 0xffffbfff_u32) |
                UInt32.new!(vosrdy.to_int).&(0x1_u32) << 14
      end

      unless udrdy.nil?
        value = (value & 0xfff3ffff_u32) |
                UInt32.new!(udrdy.to_int).&(0x3_u32) << 18
      end

      self.class.new(value)
    end

    def self.set(
      *,
      ewup : Bool? = nil,
      bre : Bool? = nil,
      vosrdy : Bool? = nil,
      udrdy : UInt8? = nil
    ) : Nil
      self.value = self.value.copy_with(
        ewup: ewup,
        bre: bre,
        vosrdy: vosrdy,
        udrdy: udrdy,
      )
    end
  end # struct

end
