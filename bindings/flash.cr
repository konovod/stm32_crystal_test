# Flash
module FLASH
  VERSION      = nil
  BASE_ADDRESS = 0x40022000_u64

  # Flash access control register
  struct ACR
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
      new(0x30_u64)
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

    enum LATENCY : UInt8
      # 0 wait states, if 0 < HCLK <= 24 MHz
      WS0 = 0x0_u64

      # 1 wait state, if 24 < HCLK <= 48 MHz
      WS1 = 0x1_u64

      # 2 wait states, if 48 < HCLK <= 72 MHz
      WS2 = 0x2_u64

      def self.reset_value : LATENCY
        ACR.reset_value.latency
      end
    end

    # LATENCY
    def latency : LATENCY
      LATENCY.new!((@value >> 0) & 0x7_u32)
    end

    # LATENCY
    def self.latency : LATENCY
      value.latency
    end

    # LATENCY
    def self.latency=(value : LATENCY) : LATENCY
      self.set(latency: value)
      value
    end

    enum PRFTBE : UInt8
      # Prefetch is disabled
      DISABLED = 0x0_u64

      # Prefetch is enabled
      ENABLED = 0x1_u64

      def self.reset_value : PRFTBE
        ACR.reset_value.prftbe
      end
    end

    # PRFTBE
    def prftbe : PRFTBE
      PRFTBE.new!((@value >> 4) & 0x1_u32)
    end

    # PRFTBE
    def self.prftbe : PRFTBE
      value.prftbe
    end

    # PRFTBE
    def self.prftbe=(value : PRFTBE) : PRFTBE
      self.set(prftbe: value)
      value
    end

    enum PRFTBS : UInt8
      # Prefetch buffer is disabled
      DISABLED = 0x0_u64

      # Prefetch buffer is enabled
      ENABLED = 0x1_u64

      def self.reset_value : PRFTBS
        ACR.reset_value.prftbs
      end
    end

    # PRFTBS
    def prftbs : PRFTBS
      PRFTBS.new!((@value >> 5) & 0x1_u32)
    end

    # PRFTBS
    def self.prftbs : PRFTBS
      value.prftbs
    end

    enum HLFCYA : UInt8
      # Half cycle is disabled
      DISABLED = 0x0_u64

      # Half cycle is enabled
      ENABLED = 0x1_u64

      def self.reset_value : HLFCYA
        ACR.reset_value.hlfcya
      end
    end

    # Flash half cycle access enable
    def hlfcya : HLFCYA
      HLFCYA.new!((@value >> 3) & 0x1_u32)
    end

    # Flash half cycle access enable
    def self.hlfcya : HLFCYA
      value.hlfcya
    end

    # Flash half cycle access enable
    def self.hlfcya=(value : HLFCYA) : HLFCYA
      self.set(hlfcya: value)
      value
    end

    def copy_with(
      *,

      latency : LATENCY? = nil,

      prftbe : PRFTBE? = nil,

      hlfcya : HLFCYA? = nil
    ) : self
      value = @value

      unless latency.nil?
        value = (value & 0xfffffff8_u32) |
                UInt32.new!(latency.to_int).&(0x7_u32) << 0
      end

      unless prftbe.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(prftbe.to_int).&(0x1_u32) << 4
      end

      unless hlfcya.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(hlfcya.to_int).&(0x1_u32) << 3
      end

      self.class.new(value)
    end

    def self.set(
      *,
      latency : LATENCY? = nil,
      prftbe : PRFTBE? = nil,
      hlfcya : HLFCYA? = nil
    ) : Nil
      self.value = self.value.copy_with(
        latency: latency,
        prftbe: prftbe,
        hlfcya: hlfcya,
      )
    end
  end # struct

  # Flash key register
  struct KEYR
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

    # Flash Key
    def self.fkeyr=(value : UInt32) : UInt32
      self.set(fkeyr: value)
      value
    end

    def copy_with(
      *,

      fkeyr : UInt32? = nil
    ) : self
      value = @value

      unless fkeyr.nil?
        value = (value & 0xffffffff_u32) |
                UInt32.new!(fkeyr.to_int).&(0x0_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      fkeyr : UInt32? = nil
    ) : Nil
      self.value = self.value.copy_with(
        fkeyr: fkeyr,
      )
    end
  end # struct

  # Flash option key register
  struct OPTKEYR
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

    # Option byte key
    def self.optkeyr=(value : UInt32) : UInt32
      self.set(optkeyr: value)
      value
    end

    def copy_with(
      *,

      optkeyr : UInt32? = nil
    ) : self
      value = @value

      unless optkeyr.nil?
        value = (value & 0xffffffff_u32) |
                UInt32.new!(optkeyr.to_int).&(0x0_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      optkeyr : UInt32? = nil
    ) : Nil
      self.value = self.value.copy_with(
        optkeyr: optkeyr,
      )
    end
  end # struct

  # Flash status register
  struct SR
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

    enum EOP : UInt8
      # No EOP event occurred
      NOEVENT = 0x0_u64

      # An EOP event occurred
      EVENT = 0x1_u64

      def self.reset_value : EOP
        SR.reset_value.eop
      end
    end

    # End of operation
    def eop : EOP
      EOP.new!((@value >> 5) & 0x1_u32)
    end

    # End of operation
    def self.eop : EOP
      value.eop
    end

    # End of operation
    def self.eop=(value : EOP) : EOP
      self.set(eop: value)
      value
    end

    enum WRPRTERR : UInt8
      # No write protection error occurred
      NOERROR = 0x0_u64

      # A write protection error occurred
      ERROR = 0x1_u64

      def self.reset_value : WRPRTERR
        SR.reset_value.wrprterr
      end
    end

    # Write protection error
    def wrprterr : WRPRTERR
      WRPRTERR.new!((@value >> 4) & 0x1_u32)
    end

    # Write protection error
    def self.wrprterr : WRPRTERR
      value.wrprterr
    end

    # Write protection error
    def self.wrprterr=(value : WRPRTERR) : WRPRTERR
      self.set(wrprterr: value)
      value
    end

    enum PGERR : UInt8
      # No programming error occurred
      NOERROR = 0x0_u64

      # A programming error occurred
      ERROR = 0x1_u64

      def self.reset_value : PGERR
        SR.reset_value.pgerr
      end
    end

    # Programming error
    def pgerr : PGERR
      PGERR.new!((@value >> 2) & 0x1_u32)
    end

    # Programming error
    def self.pgerr : PGERR
      value.pgerr
    end

    # Programming error
    def self.pgerr=(value : PGERR) : PGERR
      self.set(pgerr: value)
      value
    end

    enum BSY : UInt8
      # No write/erase operation is in progress
      INACTIVE = 0x0_u64

      # No write/erase operation is in progress
      ACTIVE = 0x1_u64

      def self.reset_value : BSY
        SR.reset_value.bsy
      end
    end

    # Busy
    def bsy : BSY
      BSY.new!((@value >> 0) & 0x1_u32)
    end

    # Busy
    def self.bsy : BSY
      value.bsy
    end

    def copy_with(
      *,

      eop : EOP? = nil,

      wrprterr : WRPRTERR? = nil,

      pgerr : PGERR? = nil
    ) : self
      value = @value

      unless eop.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(eop.to_int).&(0x1_u32) << 5
      end

      unless wrprterr.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(wrprterr.to_int).&(0x1_u32) << 4
      end

      unless pgerr.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(pgerr.to_int).&(0x1_u32) << 2
      end

      self.class.new(value)
    end

    def self.set(
      *,
      eop : EOP? = nil,
      wrprterr : WRPRTERR? = nil,
      pgerr : PGERR? = nil
    ) : Nil
      self.value = self.value.copy_with(
        eop: eop,
        wrprterr: wrprterr,
        pgerr: pgerr,
      )
    end
  end # struct

  # Flash control register
  struct CR
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
      new(0x80_u64)
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

    enum OBL_LAUNCH : UInt8
      # Force option byte loading inactive
      INACTIVE = 0x0_u64

      # Force option byte loading active
      ACTIVE = 0x1_u64

      def self.reset_value : OBL_LAUNCH
        CR.reset_value.obl_launch
      end
    end

    # Force option byte loading
    def obl_launch : OBL_LAUNCH
      OBL_LAUNCH.new!((@value >> 13) & 0x1_u32)
    end

    # Force option byte loading
    def self.obl_launch : OBL_LAUNCH
      value.obl_launch
    end

    # Force option byte loading
    def self.obl_launch=(value : OBL_LAUNCH) : OBL_LAUNCH
      self.set(obl_launch: value)
      value
    end

    enum EOPIE : UInt8
      # End of operation interrupt disabled
      DISABLED = 0x0_u64

      # End of operation interrupt enabled
      ENABLED = 0x1_u64

      def self.reset_value : EOPIE
        CR.reset_value.eopie
      end
    end

    # End of operation interrupt              enable
    def eopie : EOPIE
      EOPIE.new!((@value >> 12) & 0x1_u32)
    end

    # End of operation interrupt              enable
    def self.eopie : EOPIE
      value.eopie
    end

    # End of operation interrupt              enable
    def self.eopie=(value : EOPIE) : EOPIE
      self.set(eopie: value)
      value
    end

    enum ERRIE : UInt8
      # Error interrupt generation disabled
      DISABLED = 0x0_u64

      # Error interrupt generation enabled
      ENABLED = 0x1_u64

      def self.reset_value : ERRIE
        CR.reset_value.errie
      end
    end

    # Error interrupt enable
    def errie : ERRIE
      ERRIE.new!((@value >> 10) & 0x1_u32)
    end

    # Error interrupt enable
    def self.errie : ERRIE
      value.errie
    end

    # Error interrupt enable
    def self.errie=(value : ERRIE) : ERRIE
      self.set(errie: value)
      value
    end

    enum OPTWRE : UInt8
      # Option byte write enabled
      DISABLED = 0x0_u64

      # Option byte write disabled
      ENABLED = 0x1_u64

      def self.reset_value : OPTWRE
        CR.reset_value.optwre
      end
    end

    # Option bytes write enable
    def optwre : OPTWRE
      OPTWRE.new!((@value >> 9) & 0x1_u32)
    end

    # Option bytes write enable
    def self.optwre : OPTWRE
      value.optwre
    end

    # Option bytes write enable
    def self.optwre=(value : OPTWRE) : OPTWRE
      self.set(optwre: value)
      value
    end

    enum LOCK : UInt8
      # FLASH_CR register is unlocked
      UNLOCKED = 0x0_u64

      # FLASH_CR register is locked
      LOCKED = 0x1_u64

      def self.reset_value : LOCK
        CR.reset_value.lock
      end
    end

    # Lock
    def lock : LOCK
      LOCK.new!((@value >> 7) & 0x1_u32)
    end

    # Lock
    def self.lock : LOCK
      value.lock
    end

    # Lock
    def self.lock=(value : LOCK) : LOCK
      self.set(lock: value)
      value
    end

    enum STRT : UInt8
      # Trigger an erase operation
      START = 0x1_u64

      def self.reset_value : STRT
        CR.reset_value.strt
      end
    end

    # Start
    def strt : STRT
      STRT.new!((@value >> 6) & 0x1_u32)
    end

    # Start
    def self.strt : STRT
      value.strt
    end

    # Start
    def self.strt=(value : STRT) : STRT
      self.set(strt: value)
      value
    end

    enum OPTER : UInt8
      # Erase option byte activated
      OPTIONBYTEERASE = 0x1_u64

      def self.reset_value : OPTER
        CR.reset_value.opter
      end
    end

    # Option byte erase
    def opter : OPTER
      OPTER.new!((@value >> 5) & 0x1_u32)
    end

    # Option byte erase
    def self.opter : OPTER
      value.opter
    end

    # Option byte erase
    def self.opter=(value : OPTER) : OPTER
      self.set(opter: value)
      value
    end

    enum OPTPG : UInt8
      # Program option byte activated
      OPTIONBYTEPROGRAMMING = 0x1_u64

      def self.reset_value : OPTPG
        CR.reset_value.optpg
      end
    end

    # Option byte programming
    def optpg : OPTPG
      OPTPG.new!((@value >> 4) & 0x1_u32)
    end

    # Option byte programming
    def self.optpg : OPTPG
      value.optpg
    end

    # Option byte programming
    def self.optpg=(value : OPTPG) : OPTPG
      self.set(optpg: value)
      value
    end

    enum MER : UInt8
      # Erase activated for all user sectors
      MASSERASE = 0x1_u64

      def self.reset_value : MER
        CR.reset_value.mer
      end
    end

    # Mass erase
    def mer : MER
      MER.new!((@value >> 2) & 0x1_u32)
    end

    # Mass erase
    def self.mer : MER
      value.mer
    end

    # Mass erase
    def self.mer=(value : MER) : MER
      self.set(mer: value)
      value
    end

    enum PER : UInt8
      # Erase activated for selected page
      PAGEERASE = 0x1_u64

      def self.reset_value : PER
        CR.reset_value.per
      end
    end

    # Page erase
    def per : PER
      PER.new!((@value >> 1) & 0x1_u32)
    end

    # Page erase
    def self.per : PER
      value.per
    end

    # Page erase
    def self.per=(value : PER) : PER
      self.set(per: value)
      value
    end

    enum PG : UInt8
      # Flash programming activated
      PROGRAM = 0x1_u64

      def self.reset_value : PG
        CR.reset_value.pg
      end
    end

    # Programming
    def pg : PG
      PG.new!((@value >> 0) & 0x1_u32)
    end

    # Programming
    def self.pg : PG
      value.pg
    end

    # Programming
    def self.pg=(value : PG) : PG
      self.set(pg: value)
      value
    end

    def copy_with(
      *,

      obl_launch : OBL_LAUNCH? = nil,

      eopie : EOPIE? = nil,

      errie : ERRIE? = nil,

      optwre : OPTWRE? = nil,

      lock : LOCK? = nil,

      strt : STRT? = nil,

      opter : OPTER? = nil,

      optpg : OPTPG? = nil,

      mer : MER? = nil,

      per : PER? = nil,

      pg : PG? = nil
    ) : self
      value = @value

      unless obl_launch.nil?
        value = (value & 0xffffdfff_u32) |
                UInt32.new!(obl_launch.to_int).&(0x1_u32) << 13
      end

      unless eopie.nil?
        value = (value & 0xffffefff_u32) |
                UInt32.new!(eopie.to_int).&(0x1_u32) << 12
      end

      unless errie.nil?
        value = (value & 0xfffffbff_u32) |
                UInt32.new!(errie.to_int).&(0x1_u32) << 10
      end

      unless optwre.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(optwre.to_int).&(0x1_u32) << 9
      end

      unless lock.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(lock.to_int).&(0x1_u32) << 7
      end

      unless strt.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(strt.to_int).&(0x1_u32) << 6
      end

      unless opter.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(opter.to_int).&(0x1_u32) << 5
      end

      unless optpg.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(optpg.to_int).&(0x1_u32) << 4
      end

      unless mer.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(mer.to_int).&(0x1_u32) << 2
      end

      unless per.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(per.to_int).&(0x1_u32) << 1
      end

      unless pg.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(pg.to_int).&(0x1_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      obl_launch : OBL_LAUNCH? = nil,
      eopie : EOPIE? = nil,
      errie : ERRIE? = nil,
      optwre : OPTWRE? = nil,
      lock : LOCK? = nil,
      strt : STRT? = nil,
      opter : OPTER? = nil,
      optpg : OPTPG? = nil,
      mer : MER? = nil,
      per : PER? = nil,
      pg : PG? = nil
    ) : Nil
      self.value = self.value.copy_with(
        obl_launch: obl_launch,
        eopie: eopie,
        errie: errie,
        optwre: optwre,
        lock: lock,
        strt: strt,
        opter: opter,
        optpg: optpg,
        mer: mer,
        per: per,
        pg: pg,
      )
    end
  end # struct

  # Flash address register
  struct AR
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

    # Flash address
    def self.far=(value : UInt32) : UInt32
      self.set(far: value)
      value
    end

    def copy_with(
      *,

      far : UInt32? = nil
    ) : self
      value = @value

      unless far.nil?
        value = (value & 0xffffffff_u32) |
                UInt32.new!(far.to_int).&(0x0_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      far : UInt32? = nil
    ) : Nil
      self.value = self.value.copy_with(
        far: far,
      )
    end
  end # struct

  # Option byte register
  struct OBR
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
      new(0xffffff0f_u64)
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

    enum OPTERR : UInt8
      # The loaded option byte and its complement do not match
      OPTIONBYTEERROR = 0x1_u64

      def self.reset_value : OPTERR
        OBR.reset_value.opterr
      end
    end

    # Option byte error
    def opterr : OPTERR
      OPTERR.new!((@value >> 0) & 0x1_u32)
    end

    # Option byte error
    def self.opterr : OPTERR
      value.opterr
    end

    enum WDG_SW : UInt8
      # Hardware watchdog
      HARDWARE = 0x0_u64

      # Software watchdog
      SOFTWARE = 0x1_u64

      def self.reset_value : WDG_SW
        OBR.reset_value.wdg_sw
      end
    end

    # WDG_SW
    def wdg_sw : WDG_SW
      WDG_SW.new!((@value >> 8) & 0x1_u32)
    end

    # WDG_SW
    def self.wdg_sw : WDG_SW
      value.wdg_sw
    end

    enum NnRST_STOP : UInt8
      # Reset generated when entering Stop mode
      RESET = 0x0_u64

      # No reset generated
      NORESET = 0x1_u64

      def self.reset_value : NnRST_STOP
        OBR.reset_value.n_rst_stop
      end
    end

    # nRST_STOP
    def n_rst_stop : NnRST_STOP
      NnRST_STOP.new!((@value >> 9) & 0x1_u32)
    end

    # nRST_STOP
    def self.n_rst_stop : NnRST_STOP
      value.n_rst_stop
    end

    enum NnRST_STDBY : UInt8
      # Reset generated when entering Standby mode
      RESET = 0x0_u64

      # No reset generated
      NORESET = 0x1_u64

      def self.reset_value : NnRST_STDBY
        OBR.reset_value.n_rst_stdby
      end
    end

    # nRST_STDBY
    def n_rst_stdby : NnRST_STDBY
      NnRST_STDBY.new!((@value >> 10) & 0x1_u32)
    end

    # nRST_STDBY
    def self.n_rst_stdby : NnRST_STDBY
      value.n_rst_stdby
    end

    enum NnBOOT1 : UInt8
      # Together with BOOT0, select the device boot mode
      DISABLED = 0x0_u64

      # Together with BOOT0, select the device boot mode
      ENABLED = 0x1_u64

      def self.reset_value : NnBOOT1
        OBR.reset_value.n_boot1
      end
    end

    # BOOT1
    def n_boot1 : NnBOOT1
      NnBOOT1.new!((@value >> 12) & 0x1_u32)
    end

    # BOOT1
    def self.n_boot1 : NnBOOT1
      value.n_boot1
    end

    enum VDDA_MONITOR : UInt8
      # VDDA power supply supervisor disabled
      DISABLED = 0x0_u64

      # VDDA power supply supervisor enabled
      ENABLED = 0x1_u64

      def self.reset_value : VDDA_MONITOR
        OBR.reset_value.vdda_monitor
      end
    end

    # VDDA_MONITOR
    def vdda_monitor : VDDA_MONITOR
      VDDA_MONITOR.new!((@value >> 13) & 0x1_u32)
    end

    # VDDA_MONITOR
    def self.vdda_monitor : VDDA_MONITOR
      value.vdda_monitor
    end

    enum SRAM_PARITY_CHECK : UInt8
      # RAM parity check disabled
      DISABLED = 0x0_u64

      # RAM parity check enabled
      ENABLED = 0x1_u64

      def self.reset_value : SRAM_PARITY_CHECK
        OBR.reset_value.sram_parity_check
      end
    end

    # SRAM_PARITY_CHECK
    def sram_parity_check : SRAM_PARITY_CHECK
      SRAM_PARITY_CHECK.new!((@value >> 14) & 0x1_u32)
    end

    # SRAM_PARITY_CHECK
    def self.sram_parity_check : SRAM_PARITY_CHECK
      value.sram_parity_check
    end

    # Data0
    def data0 : UInt8
      UInt8.new!((@value >> 16) & 0xff_u32)
    end

    # Data0
    def self.data0 : UInt8
      value.data0
    end

    # Data1
    def data1 : UInt8
      UInt8.new!((@value >> 24) & 0xff_u32)
    end

    # Data1
    def self.data1 : UInt8
      value.data1
    end

    enum RDPRT : UInt8
      # Level 0
      LEVEL0 = 0x0_u64

      # Level 1
      LEVEL1 = 0x1_u64

      # Level 2
      LEVEL2 = 0x3_u64

      def self.reset_value : RDPRT
        OBR.reset_value.rdprt
      end
    end

    # Read protection Level status
    def rdprt : RDPRT
      RDPRT.new!((@value >> 1) & 0x3_u32)
    end

    # Read protection Level status
    def self.rdprt : RDPRT
      value.rdprt
    end
  end # struct

  # Write protection register
  struct WRPR
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
      new(0xffffffff_u64)
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

    # Write protect
    def wrp : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # Write protect
    def self.wrp : UInt32
      value.wrp
    end
  end # struct

end
