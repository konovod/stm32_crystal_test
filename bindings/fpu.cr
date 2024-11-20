# Floting point unit
module FPU
  VERSION      = nil
  BASE_ADDRESS = 0xe000ef34_u64

  # Floating-point context control          register
  struct FPCCR
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

    # LSPACT
    def lspact : Bool
      @value.bits_set?(0x1_u32)
    end

    # LSPACT
    def self.lspact : Bool
      value.lspact
    end

    # LSPACT
    def self.lspact=(value : Bool) : Bool
      self.set(lspact: value)
      value
    end

    # USER
    def user : Bool
      @value.bits_set?(0x2_u32)
    end

    # USER
    def self.user : Bool
      value.user
    end

    # USER
    def self.user=(value : Bool) : Bool
      self.set(user: value)
      value
    end

    # THREAD
    def thread : Bool
      @value.bits_set?(0x8_u32)
    end

    # THREAD
    def self.thread : Bool
      value.thread
    end

    # THREAD
    def self.thread=(value : Bool) : Bool
      self.set(thread: value)
      value
    end

    # HFRDY
    def hfrdy : Bool
      @value.bits_set?(0x10_u32)
    end

    # HFRDY
    def self.hfrdy : Bool
      value.hfrdy
    end

    # HFRDY
    def self.hfrdy=(value : Bool) : Bool
      self.set(hfrdy: value)
      value
    end

    # MMRDY
    def mmrdy : Bool
      @value.bits_set?(0x20_u32)
    end

    # MMRDY
    def self.mmrdy : Bool
      value.mmrdy
    end

    # MMRDY
    def self.mmrdy=(value : Bool) : Bool
      self.set(mmrdy: value)
      value
    end

    # BFRDY
    def bfrdy : Bool
      @value.bits_set?(0x40_u32)
    end

    # BFRDY
    def self.bfrdy : Bool
      value.bfrdy
    end

    # BFRDY
    def self.bfrdy=(value : Bool) : Bool
      self.set(bfrdy: value)
      value
    end

    # MONRDY
    def monrdy : Bool
      @value.bits_set?(0x100_u32)
    end

    # MONRDY
    def self.monrdy : Bool
      value.monrdy
    end

    # MONRDY
    def self.monrdy=(value : Bool) : Bool
      self.set(monrdy: value)
      value
    end

    # LSPEN
    def lspen : Bool
      @value.bits_set?(0x40000000_u32)
    end

    # LSPEN
    def self.lspen : Bool
      value.lspen
    end

    # LSPEN
    def self.lspen=(value : Bool) : Bool
      self.set(lspen: value)
      value
    end

    # ASPEN
    def aspen : Bool
      @value.bits_set?(0x80000000_u32)
    end

    # ASPEN
    def self.aspen : Bool
      value.aspen
    end

    # ASPEN
    def self.aspen=(value : Bool) : Bool
      self.set(aspen: value)
      value
    end

    def copy_with(
      *,

      lspact : Bool? = nil,

      user : Bool? = nil,

      thread : Bool? = nil,

      hfrdy : Bool? = nil,

      mmrdy : Bool? = nil,

      bfrdy : Bool? = nil,

      monrdy : Bool? = nil,

      lspen : Bool? = nil,

      aspen : Bool? = nil
    ) : self
      value = @value

      unless lspact.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(lspact.to_int).&(0x1_u32) << 0
      end

      unless user.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(user.to_int).&(0x1_u32) << 1
      end

      unless thread.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(thread.to_int).&(0x1_u32) << 3
      end

      unless hfrdy.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(hfrdy.to_int).&(0x1_u32) << 4
      end

      unless mmrdy.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(mmrdy.to_int).&(0x1_u32) << 5
      end

      unless bfrdy.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(bfrdy.to_int).&(0x1_u32) << 6
      end

      unless monrdy.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(monrdy.to_int).&(0x1_u32) << 8
      end

      unless lspen.nil?
        value = (value & 0xbfffffff_u32) |
                UInt32.new!(lspen.to_int).&(0x1_u32) << 30
      end

      unless aspen.nil?
        value = (value & 0x7fffffff_u32) |
                UInt32.new!(aspen.to_int).&(0x1_u32) << 31
      end

      self.class.new(value)
    end

    def self.set(
      *,
      lspact : Bool? = nil,
      user : Bool? = nil,
      thread : Bool? = nil,
      hfrdy : Bool? = nil,
      mmrdy : Bool? = nil,
      bfrdy : Bool? = nil,
      monrdy : Bool? = nil,
      lspen : Bool? = nil,
      aspen : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        lspact: lspact,
        user: user,
        thread: thread,
        hfrdy: hfrdy,
        mmrdy: mmrdy,
        bfrdy: bfrdy,
        monrdy: monrdy,
        lspen: lspen,
        aspen: aspen,
      )
    end
  end # struct

  # Floating-point context address          register
  struct FPCAR
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

    # Location of unpopulated              floating-point
    def address : UInt32
      UInt32.new!((@value >> 3) & 0x1fffffff_u32)
    end

    # Location of unpopulated              floating-point
    def self.address : UInt32
      value.address
    end

    # Location of unpopulated              floating-point
    def self.address=(value : UInt32) : UInt32
      self.set(address: value)
      value
    end

    def copy_with(
      *,

      address : UInt32? = nil
    ) : self
      value = @value

      unless address.nil?
        value = (value & 0x7_u32) |
                UInt32.new!(address.to_int).&(0x1fffffff_u32) << 3
      end

      self.class.new(value)
    end

    def self.set(
      *,
      address : UInt32? = nil
    ) : Nil
      self.value = self.value.copy_with(
        address: address,
      )
    end
  end # struct

  # Floating-point status control          register
  struct FPSCR
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

    # Invalid operation cumulative exception              bit
    def ioc : Bool
      @value.bits_set?(0x1_u32)
    end

    # Invalid operation cumulative exception              bit
    def self.ioc : Bool
      value.ioc
    end

    # Invalid operation cumulative exception              bit
    def self.ioc=(value : Bool) : Bool
      self.set(ioc: value)
      value
    end

    # Division by zero cumulative exception              bit.
    def dzc : Bool
      @value.bits_set?(0x2_u32)
    end

    # Division by zero cumulative exception              bit.
    def self.dzc : Bool
      value.dzc
    end

    # Division by zero cumulative exception              bit.
    def self.dzc=(value : Bool) : Bool
      self.set(dzc: value)
      value
    end

    # Overflow cumulative exception              bit
    def ofc : Bool
      @value.bits_set?(0x4_u32)
    end

    # Overflow cumulative exception              bit
    def self.ofc : Bool
      value.ofc
    end

    # Overflow cumulative exception              bit
    def self.ofc=(value : Bool) : Bool
      self.set(ofc: value)
      value
    end

    # Underflow cumulative exception              bit
    def ufc : Bool
      @value.bits_set?(0x8_u32)
    end

    # Underflow cumulative exception              bit
    def self.ufc : Bool
      value.ufc
    end

    # Underflow cumulative exception              bit
    def self.ufc=(value : Bool) : Bool
      self.set(ufc: value)
      value
    end

    # Inexact cumulative exception              bit
    def ixc : Bool
      @value.bits_set?(0x10_u32)
    end

    # Inexact cumulative exception              bit
    def self.ixc : Bool
      value.ixc
    end

    # Inexact cumulative exception              bit
    def self.ixc=(value : Bool) : Bool
      self.set(ixc: value)
      value
    end

    # Input denormal cumulative exception              bit.
    def idc : Bool
      @value.bits_set?(0x80_u32)
    end

    # Input denormal cumulative exception              bit.
    def self.idc : Bool
      value.idc
    end

    # Input denormal cumulative exception              bit.
    def self.idc=(value : Bool) : Bool
      self.set(idc: value)
      value
    end

    # Rounding Mode control              field
    def r_mode : UInt8
      UInt8.new!((@value >> 22) & 0x3_u32)
    end

    # Rounding Mode control              field
    def self.r_mode : UInt8
      value.r_mode
    end

    # Rounding Mode control              field
    def self.r_mode=(value : UInt8) : UInt8
      self.set(r_mode: value)
      value
    end

    # Flush-to-zero mode control              bit:
    def fz : Bool
      @value.bits_set?(0x1000000_u32)
    end

    # Flush-to-zero mode control              bit:
    def self.fz : Bool
      value.fz
    end

    # Flush-to-zero mode control              bit:
    def self.fz=(value : Bool) : Bool
      self.set(fz: value)
      value
    end

    # Default NaN mode control              bit
    def dn : Bool
      @value.bits_set?(0x2000000_u32)
    end

    # Default NaN mode control              bit
    def self.dn : Bool
      value.dn
    end

    # Default NaN mode control              bit
    def self.dn=(value : Bool) : Bool
      self.set(dn: value)
      value
    end

    # Alternative half-precision control              bit
    def ahp : Bool
      @value.bits_set?(0x4000000_u32)
    end

    # Alternative half-precision control              bit
    def self.ahp : Bool
      value.ahp
    end

    # Alternative half-precision control              bit
    def self.ahp=(value : Bool) : Bool
      self.set(ahp: value)
      value
    end

    # Overflow condition code              flag
    def v : Bool
      @value.bits_set?(0x10000000_u32)
    end

    # Overflow condition code              flag
    def self.v : Bool
      value.v
    end

    # Overflow condition code              flag
    def self.v=(value : Bool) : Bool
      self.set(v: value)
      value
    end

    # Carry condition code flag
    def c : Bool
      @value.bits_set?(0x20000000_u32)
    end

    # Carry condition code flag
    def self.c : Bool
      value.c
    end

    # Carry condition code flag
    def self.c=(value : Bool) : Bool
      self.set(c: value)
      value
    end

    # Zero condition code flag
    def z : Bool
      @value.bits_set?(0x40000000_u32)
    end

    # Zero condition code flag
    def self.z : Bool
      value.z
    end

    # Zero condition code flag
    def self.z=(value : Bool) : Bool
      self.set(z: value)
      value
    end

    # Negative condition code              flag
    def n : Bool
      @value.bits_set?(0x80000000_u32)
    end

    # Negative condition code              flag
    def self.n : Bool
      value.n
    end

    # Negative condition code              flag
    def self.n=(value : Bool) : Bool
      self.set(n: value)
      value
    end

    def copy_with(
      *,

      ioc : Bool? = nil,

      dzc : Bool? = nil,

      ofc : Bool? = nil,

      ufc : Bool? = nil,

      ixc : Bool? = nil,

      idc : Bool? = nil,

      r_mode : UInt8? = nil,

      fz : Bool? = nil,

      dn : Bool? = nil,

      ahp : Bool? = nil,

      v : Bool? = nil,

      c : Bool? = nil,

      z : Bool? = nil,

      n : Bool? = nil
    ) : self
      value = @value

      unless ioc.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(ioc.to_int).&(0x1_u32) << 0
      end

      unless dzc.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(dzc.to_int).&(0x1_u32) << 1
      end

      unless ofc.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(ofc.to_int).&(0x1_u32) << 2
      end

      unless ufc.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(ufc.to_int).&(0x1_u32) << 3
      end

      unless ixc.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(ixc.to_int).&(0x1_u32) << 4
      end

      unless idc.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(idc.to_int).&(0x1_u32) << 7
      end

      unless r_mode.nil?
        value = (value & 0xff3fffff_u32) |
                UInt32.new!(r_mode.to_int).&(0x3_u32) << 22
      end

      unless fz.nil?
        value = (value & 0xfeffffff_u32) |
                UInt32.new!(fz.to_int).&(0x1_u32) << 24
      end

      unless dn.nil?
        value = (value & 0xfdffffff_u32) |
                UInt32.new!(dn.to_int).&(0x1_u32) << 25
      end

      unless ahp.nil?
        value = (value & 0xfbffffff_u32) |
                UInt32.new!(ahp.to_int).&(0x1_u32) << 26
      end

      unless v.nil?
        value = (value & 0xefffffff_u32) |
                UInt32.new!(v.to_int).&(0x1_u32) << 28
      end

      unless c.nil?
        value = (value & 0xdfffffff_u32) |
                UInt32.new!(c.to_int).&(0x1_u32) << 29
      end

      unless z.nil?
        value = (value & 0xbfffffff_u32) |
                UInt32.new!(z.to_int).&(0x1_u32) << 30
      end

      unless n.nil?
        value = (value & 0x7fffffff_u32) |
                UInt32.new!(n.to_int).&(0x1_u32) << 31
      end

      self.class.new(value)
    end

    def self.set(
      *,
      ioc : Bool? = nil,
      dzc : Bool? = nil,
      ofc : Bool? = nil,
      ufc : Bool? = nil,
      ixc : Bool? = nil,
      idc : Bool? = nil,
      r_mode : UInt8? = nil,
      fz : Bool? = nil,
      dn : Bool? = nil,
      ahp : Bool? = nil,
      v : Bool? = nil,
      c : Bool? = nil,
      z : Bool? = nil,
      n : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        ioc: ioc,
        dzc: dzc,
        ofc: ofc,
        ufc: ufc,
        ixc: ixc,
        idc: idc,
        r_mode: r_mode,
        fz: fz,
        dn: dn,
        ahp: ahp,
        v: v,
        c: c,
        z: z,
        n: n,
      )
    end
  end # struct

end
