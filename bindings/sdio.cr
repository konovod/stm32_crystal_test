# Secure digital input/output      interface
module SDIO
  VERSION      = nil
  BASE_ADDRESS = 0x40012c00_u64

  # power control register
  struct POWER
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

    # PWRCTRL
    def pwrctrl : UInt8
      UInt8.new!((@value >> 0) & 0x3_u32)
    end

    # PWRCTRL
    def self.pwrctrl : UInt8
      value.pwrctrl
    end

    # PWRCTRL
    def self.pwrctrl=(value : UInt8) : UInt8
      self.set(pwrctrl: value)
      value
    end

    def copy_with(
      *,

      pwrctrl : UInt8? = nil
    ) : self
      value = @value

      unless pwrctrl.nil?
        value = (value & 0xfffffffc_u32) |
                UInt32.new!(pwrctrl.to_int).&(0x3_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      pwrctrl : UInt8? = nil
    ) : Nil
      self.value = self.value.copy_with(
        pwrctrl: pwrctrl,
      )
    end
  end # struct

  # SDI clock control register
  struct CLKCR
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

    # HW Flow Control enable
    def hwfc_en : Bool
      @value.bits_set?(0x4000_u32)
    end

    # HW Flow Control enable
    def self.hwfc_en : Bool
      value.hwfc_en
    end

    # HW Flow Control enable
    def self.hwfc_en=(value : Bool) : Bool
      self.set(hwfc_en: value)
      value
    end

    # SDIO_CK dephasing selection              bit
    def negedge : Bool
      @value.bits_set?(0x2000_u32)
    end

    # SDIO_CK dephasing selection              bit
    def self.negedge : Bool
      value.negedge
    end

    # SDIO_CK dephasing selection              bit
    def self.negedge=(value : Bool) : Bool
      self.set(negedge: value)
      value
    end

    # Wide bus mode enable bit
    def widbus : UInt8
      UInt8.new!((@value >> 11) & 0x3_u32)
    end

    # Wide bus mode enable bit
    def self.widbus : UInt8
      value.widbus
    end

    # Wide bus mode enable bit
    def self.widbus=(value : UInt8) : UInt8
      self.set(widbus: value)
      value
    end

    # Clock divider bypass enable              bit
    def bypass : Bool
      @value.bits_set?(0x400_u32)
    end

    # Clock divider bypass enable              bit
    def self.bypass : Bool
      value.bypass
    end

    # Clock divider bypass enable              bit
    def self.bypass=(value : Bool) : Bool
      self.set(bypass: value)
      value
    end

    # Power saving configuration              bit
    def pwrsav : Bool
      @value.bits_set?(0x200_u32)
    end

    # Power saving configuration              bit
    def self.pwrsav : Bool
      value.pwrsav
    end

    # Power saving configuration              bit
    def self.pwrsav=(value : Bool) : Bool
      self.set(pwrsav: value)
      value
    end

    # Clock enable bit
    def clken : Bool
      @value.bits_set?(0x100_u32)
    end

    # Clock enable bit
    def self.clken : Bool
      value.clken
    end

    # Clock enable bit
    def self.clken=(value : Bool) : Bool
      self.set(clken: value)
      value
    end

    # Clock divide factor
    def clkdiv : UInt8
      UInt8.new!((@value >> 0) & 0xff_u32)
    end

    # Clock divide factor
    def self.clkdiv : UInt8
      value.clkdiv
    end

    # Clock divide factor
    def self.clkdiv=(value : UInt8) : UInt8
      self.set(clkdiv: value)
      value
    end

    def copy_with(
      *,

      hwfc_en : Bool? = nil,

      negedge : Bool? = nil,

      widbus : UInt8? = nil,

      bypass : Bool? = nil,

      pwrsav : Bool? = nil,

      clken : Bool? = nil,

      clkdiv : UInt8? = nil
    ) : self
      value = @value

      unless hwfc_en.nil?
        value = (value & 0xffffbfff_u32) |
                UInt32.new!(hwfc_en.to_int).&(0x1_u32) << 14
      end

      unless negedge.nil?
        value = (value & 0xffffdfff_u32) |
                UInt32.new!(negedge.to_int).&(0x1_u32) << 13
      end

      unless widbus.nil?
        value = (value & 0xffffe7ff_u32) |
                UInt32.new!(widbus.to_int).&(0x3_u32) << 11
      end

      unless bypass.nil?
        value = (value & 0xfffffbff_u32) |
                UInt32.new!(bypass.to_int).&(0x1_u32) << 10
      end

      unless pwrsav.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(pwrsav.to_int).&(0x1_u32) << 9
      end

      unless clken.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(clken.to_int).&(0x1_u32) << 8
      end

      unless clkdiv.nil?
        value = (value & 0xffffff00_u32) |
                UInt32.new!(clkdiv.to_int).&(0xff_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      hwfc_en : Bool? = nil,
      negedge : Bool? = nil,
      widbus : UInt8? = nil,
      bypass : Bool? = nil,
      pwrsav : Bool? = nil,
      clken : Bool? = nil,
      clkdiv : UInt8? = nil
    ) : Nil
      self.value = self.value.copy_with(
        hwfc_en: hwfc_en,
        negedge: negedge,
        widbus: widbus,
        bypass: bypass,
        pwrsav: pwrsav,
        clken: clken,
        clkdiv: clkdiv,
      )
    end
  end # struct

  # argument register
  struct ARG
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

    # Command argument
    def cmdarg : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # Command argument
    def self.cmdarg : UInt32
      value.cmdarg
    end

    # Command argument
    def self.cmdarg=(value : UInt32) : UInt32
      self.set(cmdarg: value)
      value
    end

    def copy_with(
      *,

      cmdarg : UInt32? = nil
    ) : self
      value = @value

      unless cmdarg.nil?
        value = (value & 0xffffffff_u32) |
                UInt32.new!(cmdarg.to_int).&(0x0_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      cmdarg : UInt32? = nil
    ) : Nil
      self.value = self.value.copy_with(
        cmdarg: cmdarg,
      )
    end
  end # struct

  # command register
  struct CMD
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

    # CE-ATA command
    def ce_atacmd : Bool
      @value.bits_set?(0x4000_u32)
    end

    # CE-ATA command
    def self.ce_atacmd : Bool
      value.ce_atacmd
    end

    # CE-ATA command
    def self.ce_atacmd=(value : Bool) : Bool
      self.set(ce_atacmd: value)
      value
    end

    # not Interrupt Enable
    def n_ien : Bool
      @value.bits_set?(0x2000_u32)
    end

    # not Interrupt Enable
    def self.n_ien : Bool
      value.n_ien
    end

    # not Interrupt Enable
    def self.n_ien=(value : Bool) : Bool
      self.set(n_ien: value)
      value
    end

    # Enable CMD completion
    def encm_dcompl : Bool
      @value.bits_set?(0x1000_u32)
    end

    # Enable CMD completion
    def self.encm_dcompl : Bool
      value.encm_dcompl
    end

    # Enable CMD completion
    def self.encm_dcompl=(value : Bool) : Bool
      self.set(encm_dcompl: value)
      value
    end

    # SD I/O suspend command
    def suspend : Bool
      @value.bits_set?(0x800_u32)
    end

    # SD I/O suspend command
    def self.suspend : Bool
      value.suspend
    end

    # SD I/O suspend command
    def self.suspend=(value : Bool) : Bool
      self.set(suspend: value)
      value
    end

    # Command path state machine (CPSM) Enable              bit
    def cpsmen : Bool
      @value.bits_set?(0x400_u32)
    end

    # Command path state machine (CPSM) Enable              bit
    def self.cpsmen : Bool
      value.cpsmen
    end

    # Command path state machine (CPSM) Enable              bit
    def self.cpsmen=(value : Bool) : Bool
      self.set(cpsmen: value)
      value
    end

    # CPSM Waits for ends of data transfer              (CmdPend internal signal).
    def waitpend : Bool
      @value.bits_set?(0x200_u32)
    end

    # CPSM Waits for ends of data transfer              (CmdPend internal signal).
    def self.waitpend : Bool
      value.waitpend
    end

    # CPSM Waits for ends of data transfer              (CmdPend internal signal).
    def self.waitpend=(value : Bool) : Bool
      self.set(waitpend: value)
      value
    end

    # CPSM waits for interrupt              request
    def waitint : Bool
      @value.bits_set?(0x100_u32)
    end

    # CPSM waits for interrupt              request
    def self.waitint : Bool
      value.waitint
    end

    # CPSM waits for interrupt              request
    def self.waitint=(value : Bool) : Bool
      self.set(waitint: value)
      value
    end

    # Wait for response bits
    def waitresp : UInt8
      UInt8.new!((@value >> 6) & 0x3_u32)
    end

    # Wait for response bits
    def self.waitresp : UInt8
      value.waitresp
    end

    # Wait for response bits
    def self.waitresp=(value : UInt8) : UInt8
      self.set(waitresp: value)
      value
    end

    # Command index
    def index : UInt8
      UInt8.new!((@value >> 0) & 0x3f_u32)
    end

    # Command index
    def self.index : UInt8
      value.index
    end

    # Command index
    def self.index=(value : UInt8) : UInt8
      self.set(index: value)
      value
    end

    def copy_with(
      *,

      ce_atacmd : Bool? = nil,

      n_ien : Bool? = nil,

      encm_dcompl : Bool? = nil,

      suspend : Bool? = nil,

      cpsmen : Bool? = nil,

      waitpend : Bool? = nil,

      waitint : Bool? = nil,

      waitresp : UInt8? = nil,

      index : UInt8? = nil
    ) : self
      value = @value

      unless ce_atacmd.nil?
        value = (value & 0xffffbfff_u32) |
                UInt32.new!(ce_atacmd.to_int).&(0x1_u32) << 14
      end

      unless n_ien.nil?
        value = (value & 0xffffdfff_u32) |
                UInt32.new!(n_ien.to_int).&(0x1_u32) << 13
      end

      unless encm_dcompl.nil?
        value = (value & 0xffffefff_u32) |
                UInt32.new!(encm_dcompl.to_int).&(0x1_u32) << 12
      end

      unless suspend.nil?
        value = (value & 0xfffff7ff_u32) |
                UInt32.new!(suspend.to_int).&(0x1_u32) << 11
      end

      unless cpsmen.nil?
        value = (value & 0xfffffbff_u32) |
                UInt32.new!(cpsmen.to_int).&(0x1_u32) << 10
      end

      unless waitpend.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(waitpend.to_int).&(0x1_u32) << 9
      end

      unless waitint.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(waitint.to_int).&(0x1_u32) << 8
      end

      unless waitresp.nil?
        value = (value & 0xffffff3f_u32) |
                UInt32.new!(waitresp.to_int).&(0x3_u32) << 6
      end

      unless index.nil?
        value = (value & 0xffffffc0_u32) |
                UInt32.new!(index.to_int).&(0x3f_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      ce_atacmd : Bool? = nil,
      n_ien : Bool? = nil,
      encm_dcompl : Bool? = nil,
      suspend : Bool? = nil,
      cpsmen : Bool? = nil,
      waitpend : Bool? = nil,
      waitint : Bool? = nil,
      waitresp : UInt8? = nil,
      index : UInt8? = nil
    ) : Nil
      self.value = self.value.copy_with(
        ce_atacmd: ce_atacmd,
        n_ien: n_ien,
        encm_dcompl: encm_dcompl,
        suspend: suspend,
        cpsmen: cpsmen,
        waitpend: waitpend,
        waitint: waitint,
        waitresp: waitresp,
        index: index,
      )
    end
  end # struct

  # command response register
  struct RESPCMD
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

    # Response command index
    def respcmd : UInt8
      UInt8.new!((@value >> 0) & 0x3f_u32)
    end

    # Response command index
    def self.respcmd : UInt8
      value.respcmd
    end
  end # struct

  # response 1..4 register
  struct RESP1
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

    # see Table 132.
    def cardstatus1 : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # see Table 132.
    def self.cardstatus1 : UInt32
      value.cardstatus1
    end
  end # struct

  # response 1..4 register
  struct RESP2
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

    # see Table 132.
    def cardstatus2 : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # see Table 132.
    def self.cardstatus2 : UInt32
      value.cardstatus2
    end
  end # struct

  # response 1..4 register
  struct RESP3
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

    # see Table 132.
    def cardstatus3 : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # see Table 132.
    def self.cardstatus3 : UInt32
      value.cardstatus3
    end
  end # struct

  # response 1..4 register
  struct RESP4
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

    # see Table 132.
    def cardstatus4 : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # see Table 132.
    def self.cardstatus4 : UInt32
      value.cardstatus4
    end
  end # struct

  # data timer register
  struct DTIMER
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

    # Data timeout period
    def datatime : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # Data timeout period
    def self.datatime : UInt32
      value.datatime
    end

    # Data timeout period
    def self.datatime=(value : UInt32) : UInt32
      self.set(datatime: value)
      value
    end

    def copy_with(
      *,

      datatime : UInt32? = nil
    ) : self
      value = @value

      unless datatime.nil?
        value = (value & 0xffffffff_u32) |
                UInt32.new!(datatime.to_int).&(0x0_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      datatime : UInt32? = nil
    ) : Nil
      self.value = self.value.copy_with(
        datatime: datatime,
      )
    end
  end # struct

  # data length register
  struct DLEN
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

    # Data length value
    def datalength : UInt32
      UInt32.new!((@value >> 0) & 0x1ffffff_u32)
    end

    # Data length value
    def self.datalength : UInt32
      value.datalength
    end

    # Data length value
    def self.datalength=(value : UInt32) : UInt32
      self.set(datalength: value)
      value
    end

    def copy_with(
      *,

      datalength : UInt32? = nil
    ) : self
      value = @value

      unless datalength.nil?
        value = (value & 0xfe000000_u32) |
                UInt32.new!(datalength.to_int).&(0x1ffffff_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      datalength : UInt32? = nil
    ) : Nil
      self.value = self.value.copy_with(
        datalength: datalength,
      )
    end
  end # struct

  # data control register
  struct DCTRL
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

    # SD I/O enable functions
    def en : Bool
      @value.bits_set?(0x800_u32)
    end

    # SD I/O enable functions
    def self.en : Bool
      value.en
    end

    # SD I/O enable functions
    def self.en=(value : Bool) : Bool
      self.set(en: value)
      value
    end

    # Read wait mode
    def rwmod : Bool
      @value.bits_set?(0x400_u32)
    end

    # Read wait mode
    def self.rwmod : Bool
      value.rwmod
    end

    # Read wait mode
    def self.rwmod=(value : Bool) : Bool
      self.set(rwmod: value)
      value
    end

    # Read wait stop
    def rwstop : Bool
      @value.bits_set?(0x200_u32)
    end

    # Read wait stop
    def self.rwstop : Bool
      value.rwstop
    end

    # Read wait stop
    def self.rwstop=(value : Bool) : Bool
      self.set(rwstop: value)
      value
    end

    # Read wait start
    def rwstart : Bool
      @value.bits_set?(0x100_u32)
    end

    # Read wait start
    def self.rwstart : Bool
      value.rwstart
    end

    # Read wait start
    def self.rwstart=(value : Bool) : Bool
      self.set(rwstart: value)
      value
    end

    # Data block size
    def dblocksize : UInt8
      UInt8.new!((@value >> 4) & 0xf_u32)
    end

    # Data block size
    def self.dblocksize : UInt8
      value.dblocksize
    end

    # Data block size
    def self.dblocksize=(value : UInt8) : UInt8
      self.set(dblocksize: value)
      value
    end

    # DMA enable bit
    def dmaen : Bool
      @value.bits_set?(0x8_u32)
    end

    # DMA enable bit
    def self.dmaen : Bool
      value.dmaen
    end

    # DMA enable bit
    def self.dmaen=(value : Bool) : Bool
      self.set(dmaen: value)
      value
    end

    # Data transfer mode selection 1: Stream              or SDIO multibyte data transfer.
    def dtmode : Bool
      @value.bits_set?(0x4_u32)
    end

    # Data transfer mode selection 1: Stream              or SDIO multibyte data transfer.
    def self.dtmode : Bool
      value.dtmode
    end

    # Data transfer mode selection 1: Stream              or SDIO multibyte data transfer.
    def self.dtmode=(value : Bool) : Bool
      self.set(dtmode: value)
      value
    end

    # Data transfer direction              selection
    def dtdir : Bool
      @value.bits_set?(0x2_u32)
    end

    # Data transfer direction              selection
    def self.dtdir : Bool
      value.dtdir
    end

    # Data transfer direction              selection
    def self.dtdir=(value : Bool) : Bool
      self.set(dtdir: value)
      value
    end

    # DTEN
    def dten : Bool
      @value.bits_set?(0x1_u32)
    end

    # DTEN
    def self.dten : Bool
      value.dten
    end

    # DTEN
    def self.dten=(value : Bool) : Bool
      self.set(dten: value)
      value
    end

    def copy_with(
      *,

      en : Bool? = nil,

      rwmod : Bool? = nil,

      rwstop : Bool? = nil,

      rwstart : Bool? = nil,

      dblocksize : UInt8? = nil,

      dmaen : Bool? = nil,

      dtmode : Bool? = nil,

      dtdir : Bool? = nil,

      dten : Bool? = nil
    ) : self
      value = @value

      unless en.nil?
        value = (value & 0xfffff7ff_u32) |
                UInt32.new!(en.to_int).&(0x1_u32) << 11
      end

      unless rwmod.nil?
        value = (value & 0xfffffbff_u32) |
                UInt32.new!(rwmod.to_int).&(0x1_u32) << 10
      end

      unless rwstop.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(rwstop.to_int).&(0x1_u32) << 9
      end

      unless rwstart.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(rwstart.to_int).&(0x1_u32) << 8
      end

      unless dblocksize.nil?
        value = (value & 0xffffff0f_u32) |
                UInt32.new!(dblocksize.to_int).&(0xf_u32) << 4
      end

      unless dmaen.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(dmaen.to_int).&(0x1_u32) << 3
      end

      unless dtmode.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(dtmode.to_int).&(0x1_u32) << 2
      end

      unless dtdir.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(dtdir.to_int).&(0x1_u32) << 1
      end

      unless dten.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(dten.to_int).&(0x1_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      en : Bool? = nil,
      rwmod : Bool? = nil,
      rwstop : Bool? = nil,
      rwstart : Bool? = nil,
      dblocksize : UInt8? = nil,
      dmaen : Bool? = nil,
      dtmode : Bool? = nil,
      dtdir : Bool? = nil,
      dten : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        en: en,
        rwmod: rwmod,
        rwstop: rwstop,
        rwstart: rwstart,
        dblocksize: dblocksize,
        dmaen: dmaen,
        dtmode: dtmode,
        dtdir: dtdir,
        dten: dten,
      )
    end
  end # struct

  # data counter register
  struct DCOUNT
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

    # Data count value
    def datacount : UInt32
      UInt32.new!((@value >> 0) & 0x1ffffff_u32)
    end

    # Data count value
    def self.datacount : UInt32
      value.datacount
    end
  end # struct

  # status register
  struct STA
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

    # CE-ATA command completion signal              received for CMD61
    def ceataend : Bool
      @value.bits_set?(0x800000_u32)
    end

    # CE-ATA command completion signal              received for CMD61
    def self.ceataend : Bool
      value.ceataend
    end

    # SDIO interrupt received
    def it : Bool
      @value.bits_set?(0x400000_u32)
    end

    # SDIO interrupt received
    def self.it : Bool
      value.it
    end

    # Data available in receive              FIFO
    def rxdavl : Bool
      @value.bits_set?(0x200000_u32)
    end

    # Data available in receive              FIFO
    def self.rxdavl : Bool
      value.rxdavl
    end

    # Data available in transmit              FIFO
    def txdavl : Bool
      @value.bits_set?(0x100000_u32)
    end

    # Data available in transmit              FIFO
    def self.txdavl : Bool
      value.txdavl
    end

    # Receive FIFO empty
    def rxfifoe : Bool
      @value.bits_set?(0x80000_u32)
    end

    # Receive FIFO empty
    def self.rxfifoe : Bool
      value.rxfifoe
    end

    # Transmit FIFO empty
    def txfifoe : Bool
      @value.bits_set?(0x40000_u32)
    end

    # Transmit FIFO empty
    def self.txfifoe : Bool
      value.txfifoe
    end

    # Receive FIFO full
    def rxfifof : Bool
      @value.bits_set?(0x20000_u32)
    end

    # Receive FIFO full
    def self.rxfifof : Bool
      value.rxfifof
    end

    # Transmit FIFO full
    def txfifof : Bool
      @value.bits_set?(0x10000_u32)
    end

    # Transmit FIFO full
    def self.txfifof : Bool
      value.txfifof
    end

    # Receive FIFO half full: there are at              least 8 words in the FIFO
    def rxfifohf : Bool
      @value.bits_set?(0x8000_u32)
    end

    # Receive FIFO half full: there are at              least 8 words in the FIFO
    def self.rxfifohf : Bool
      value.rxfifohf
    end

    # Transmit FIFO half empty: at least 8              words can be written into the FIFO
    def txfifohe : Bool
      @value.bits_set?(0x4000_u32)
    end

    # Transmit FIFO half empty: at least 8              words can be written into the FIFO
    def self.txfifohe : Bool
      value.txfifohe
    end

    # Data receive in progress
    def rxact : Bool
      @value.bits_set?(0x2000_u32)
    end

    # Data receive in progress
    def self.rxact : Bool
      value.rxact
    end

    # Data transmit in progress
    def txact : Bool
      @value.bits_set?(0x1000_u32)
    end

    # Data transmit in progress
    def self.txact : Bool
      value.txact
    end

    # Command transfer in              progress
    def cmdact : Bool
      @value.bits_set?(0x800_u32)
    end

    # Command transfer in              progress
    def self.cmdact : Bool
      value.cmdact
    end

    # Data block sent/received (CRC check              passed)
    def dbckend : Bool
      @value.bits_set?(0x400_u32)
    end

    # Data block sent/received (CRC check              passed)
    def self.dbckend : Bool
      value.dbckend
    end

    # Start bit not detected on all data              signals in wide bus mode
    def stbiterr : Bool
      @value.bits_set?(0x200_u32)
    end

    # Start bit not detected on all data              signals in wide bus mode
    def self.stbiterr : Bool
      value.stbiterr
    end

    # Data end (data counter, SDIDCOUNT, is              zero)
    def dataend : Bool
      @value.bits_set?(0x100_u32)
    end

    # Data end (data counter, SDIDCOUNT, is              zero)
    def self.dataend : Bool
      value.dataend
    end

    # Command sent (no response              required)
    def cmdsent : Bool
      @value.bits_set?(0x80_u32)
    end

    # Command sent (no response              required)
    def self.cmdsent : Bool
      value.cmdsent
    end

    # Command response received (CRC check              passed)
    def cmdrend : Bool
      @value.bits_set?(0x40_u32)
    end

    # Command response received (CRC check              passed)
    def self.cmdrend : Bool
      value.cmdrend
    end

    # Received FIFO overrun              error
    def rxoverr : Bool
      @value.bits_set?(0x20_u32)
    end

    # Received FIFO overrun              error
    def self.rxoverr : Bool
      value.rxoverr
    end

    # Transmit FIFO underrun              error
    def txunderr : Bool
      @value.bits_set?(0x10_u32)
    end

    # Transmit FIFO underrun              error
    def self.txunderr : Bool
      value.txunderr
    end

    # Data timeout
    def dtimeout : Bool
      @value.bits_set?(0x8_u32)
    end

    # Data timeout
    def self.dtimeout : Bool
      value.dtimeout
    end

    # Command response timeout
    def ctimeout : Bool
      @value.bits_set?(0x4_u32)
    end

    # Command response timeout
    def self.ctimeout : Bool
      value.ctimeout
    end

    # Data block sent/received (CRC check              failed)
    def dcrcfail : Bool
      @value.bits_set?(0x2_u32)
    end

    # Data block sent/received (CRC check              failed)
    def self.dcrcfail : Bool
      value.dcrcfail
    end

    # Command response received (CRC check              failed)
    def ccrcfail : Bool
      @value.bits_set?(0x1_u32)
    end

    # Command response received (CRC check              failed)
    def self.ccrcfail : Bool
      value.ccrcfail
    end
  end # struct

  # interrupt clear register
  struct ICR
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

    # CEATAEND flag clear bit
    def ceataendc : Bool
      @value.bits_set?(0x800000_u32)
    end

    # CEATAEND flag clear bit
    def self.ceataendc : Bool
      value.ceataendc
    end

    # CEATAEND flag clear bit
    def self.ceataendc=(value : Bool) : Bool
      self.set(ceataendc: value)
      value
    end

    # SDIOIT flag clear bit
    def itc : Bool
      @value.bits_set?(0x400000_u32)
    end

    # SDIOIT flag clear bit
    def self.itc : Bool
      value.itc
    end

    # SDIOIT flag clear bit
    def self.itc=(value : Bool) : Bool
      self.set(itc: value)
      value
    end

    # DBCKEND flag clear bit
    def dbckendc : Bool
      @value.bits_set?(0x400_u32)
    end

    # DBCKEND flag clear bit
    def self.dbckendc : Bool
      value.dbckendc
    end

    # DBCKEND flag clear bit
    def self.dbckendc=(value : Bool) : Bool
      self.set(dbckendc: value)
      value
    end

    # STBITERR flag clear bit
    def stbiterrc : Bool
      @value.bits_set?(0x200_u32)
    end

    # STBITERR flag clear bit
    def self.stbiterrc : Bool
      value.stbiterrc
    end

    # STBITERR flag clear bit
    def self.stbiterrc=(value : Bool) : Bool
      self.set(stbiterrc: value)
      value
    end

    # DATAEND flag clear bit
    def dataendc : Bool
      @value.bits_set?(0x100_u32)
    end

    # DATAEND flag clear bit
    def self.dataendc : Bool
      value.dataendc
    end

    # DATAEND flag clear bit
    def self.dataendc=(value : Bool) : Bool
      self.set(dataendc: value)
      value
    end

    # CMDSENT flag clear bit
    def cmdsentc : Bool
      @value.bits_set?(0x80_u32)
    end

    # CMDSENT flag clear bit
    def self.cmdsentc : Bool
      value.cmdsentc
    end

    # CMDSENT flag clear bit
    def self.cmdsentc=(value : Bool) : Bool
      self.set(cmdsentc: value)
      value
    end

    # CMDREND flag clear bit
    def cmdrendc : Bool
      @value.bits_set?(0x40_u32)
    end

    # CMDREND flag clear bit
    def self.cmdrendc : Bool
      value.cmdrendc
    end

    # CMDREND flag clear bit
    def self.cmdrendc=(value : Bool) : Bool
      self.set(cmdrendc: value)
      value
    end

    # RXOVERR flag clear bit
    def rxoverrc : Bool
      @value.bits_set?(0x20_u32)
    end

    # RXOVERR flag clear bit
    def self.rxoverrc : Bool
      value.rxoverrc
    end

    # RXOVERR flag clear bit
    def self.rxoverrc=(value : Bool) : Bool
      self.set(rxoverrc: value)
      value
    end

    # TXUNDERR flag clear bit
    def txunderrc : Bool
      @value.bits_set?(0x10_u32)
    end

    # TXUNDERR flag clear bit
    def self.txunderrc : Bool
      value.txunderrc
    end

    # TXUNDERR flag clear bit
    def self.txunderrc=(value : Bool) : Bool
      self.set(txunderrc: value)
      value
    end

    # DTIMEOUT flag clear bit
    def dtimeoutc : Bool
      @value.bits_set?(0x8_u32)
    end

    # DTIMEOUT flag clear bit
    def self.dtimeoutc : Bool
      value.dtimeoutc
    end

    # DTIMEOUT flag clear bit
    def self.dtimeoutc=(value : Bool) : Bool
      self.set(dtimeoutc: value)
      value
    end

    # CTIMEOUT flag clear bit
    def ctimeoutc : Bool
      @value.bits_set?(0x4_u32)
    end

    # CTIMEOUT flag clear bit
    def self.ctimeoutc : Bool
      value.ctimeoutc
    end

    # CTIMEOUT flag clear bit
    def self.ctimeoutc=(value : Bool) : Bool
      self.set(ctimeoutc: value)
      value
    end

    # DCRCFAIL flag clear bit
    def dcrcfailc : Bool
      @value.bits_set?(0x2_u32)
    end

    # DCRCFAIL flag clear bit
    def self.dcrcfailc : Bool
      value.dcrcfailc
    end

    # DCRCFAIL flag clear bit
    def self.dcrcfailc=(value : Bool) : Bool
      self.set(dcrcfailc: value)
      value
    end

    # CCRCFAIL flag clear bit
    def ccrcfailc : Bool
      @value.bits_set?(0x1_u32)
    end

    # CCRCFAIL flag clear bit
    def self.ccrcfailc : Bool
      value.ccrcfailc
    end

    # CCRCFAIL flag clear bit
    def self.ccrcfailc=(value : Bool) : Bool
      self.set(ccrcfailc: value)
      value
    end

    def copy_with(
      *,

      ceataendc : Bool? = nil,

      itc : Bool? = nil,

      dbckendc : Bool? = nil,

      stbiterrc : Bool? = nil,

      dataendc : Bool? = nil,

      cmdsentc : Bool? = nil,

      cmdrendc : Bool? = nil,

      rxoverrc : Bool? = nil,

      txunderrc : Bool? = nil,

      dtimeoutc : Bool? = nil,

      ctimeoutc : Bool? = nil,

      dcrcfailc : Bool? = nil,

      ccrcfailc : Bool? = nil
    ) : self
      value = @value

      unless ceataendc.nil?
        value = (value & 0xff7fffff_u32) |
                UInt32.new!(ceataendc.to_int).&(0x1_u32) << 23
      end

      unless itc.nil?
        value = (value & 0xffbfffff_u32) |
                UInt32.new!(itc.to_int).&(0x1_u32) << 22
      end

      unless dbckendc.nil?
        value = (value & 0xfffffbff_u32) |
                UInt32.new!(dbckendc.to_int).&(0x1_u32) << 10
      end

      unless stbiterrc.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(stbiterrc.to_int).&(0x1_u32) << 9
      end

      unless dataendc.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(dataendc.to_int).&(0x1_u32) << 8
      end

      unless cmdsentc.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(cmdsentc.to_int).&(0x1_u32) << 7
      end

      unless cmdrendc.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(cmdrendc.to_int).&(0x1_u32) << 6
      end

      unless rxoverrc.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(rxoverrc.to_int).&(0x1_u32) << 5
      end

      unless txunderrc.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(txunderrc.to_int).&(0x1_u32) << 4
      end

      unless dtimeoutc.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(dtimeoutc.to_int).&(0x1_u32) << 3
      end

      unless ctimeoutc.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(ctimeoutc.to_int).&(0x1_u32) << 2
      end

      unless dcrcfailc.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(dcrcfailc.to_int).&(0x1_u32) << 1
      end

      unless ccrcfailc.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(ccrcfailc.to_int).&(0x1_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      ceataendc : Bool? = nil,
      itc : Bool? = nil,
      dbckendc : Bool? = nil,
      stbiterrc : Bool? = nil,
      dataendc : Bool? = nil,
      cmdsentc : Bool? = nil,
      cmdrendc : Bool? = nil,
      rxoverrc : Bool? = nil,
      txunderrc : Bool? = nil,
      dtimeoutc : Bool? = nil,
      ctimeoutc : Bool? = nil,
      dcrcfailc : Bool? = nil,
      ccrcfailc : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        ceataendc: ceataendc,
        itc: itc,
        dbckendc: dbckendc,
        stbiterrc: stbiterrc,
        dataendc: dataendc,
        cmdsentc: cmdsentc,
        cmdrendc: cmdrendc,
        rxoverrc: rxoverrc,
        txunderrc: txunderrc,
        dtimeoutc: dtimeoutc,
        ctimeoutc: ctimeoutc,
        dcrcfailc: dcrcfailc,
        ccrcfailc: ccrcfailc,
      )
    end
  end # struct

  # mask register
  struct MASK
    ADDRESS = BASE_ADDRESS + 0x3c_u64

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

    # CE-ATA command completion signal              received interrupt enable
    def ceataendie : Bool
      @value.bits_set?(0x800000_u32)
    end

    # CE-ATA command completion signal              received interrupt enable
    def self.ceataendie : Bool
      value.ceataendie
    end

    # CE-ATA command completion signal              received interrupt enable
    def self.ceataendie=(value : Bool) : Bool
      self.set(ceataendie: value)
      value
    end

    # SDIO mode interrupt received interrupt              enable
    def itie : Bool
      @value.bits_set?(0x400000_u32)
    end

    # SDIO mode interrupt received interrupt              enable
    def self.itie : Bool
      value.itie
    end

    # SDIO mode interrupt received interrupt              enable
    def self.itie=(value : Bool) : Bool
      self.set(itie: value)
      value
    end

    # Data available in Rx FIFO interrupt              enable
    def rxdavlie : Bool
      @value.bits_set?(0x200000_u32)
    end

    # Data available in Rx FIFO interrupt              enable
    def self.rxdavlie : Bool
      value.rxdavlie
    end

    # Data available in Rx FIFO interrupt              enable
    def self.rxdavlie=(value : Bool) : Bool
      self.set(rxdavlie: value)
      value
    end

    # Data available in Tx FIFO interrupt              enable
    def txdavlie : Bool
      @value.bits_set?(0x100000_u32)
    end

    # Data available in Tx FIFO interrupt              enable
    def self.txdavlie : Bool
      value.txdavlie
    end

    # Data available in Tx FIFO interrupt              enable
    def self.txdavlie=(value : Bool) : Bool
      self.set(txdavlie: value)
      value
    end

    # Rx FIFO empty interrupt              enable
    def rxfifoeie : Bool
      @value.bits_set?(0x80000_u32)
    end

    # Rx FIFO empty interrupt              enable
    def self.rxfifoeie : Bool
      value.rxfifoeie
    end

    # Rx FIFO empty interrupt              enable
    def self.rxfifoeie=(value : Bool) : Bool
      self.set(rxfifoeie: value)
      value
    end

    # Tx FIFO empty interrupt              enable
    def txfifoeie : Bool
      @value.bits_set?(0x40000_u32)
    end

    # Tx FIFO empty interrupt              enable
    def self.txfifoeie : Bool
      value.txfifoeie
    end

    # Tx FIFO empty interrupt              enable
    def self.txfifoeie=(value : Bool) : Bool
      self.set(txfifoeie: value)
      value
    end

    # Rx FIFO full interrupt              enable
    def rxfifofie : Bool
      @value.bits_set?(0x20000_u32)
    end

    # Rx FIFO full interrupt              enable
    def self.rxfifofie : Bool
      value.rxfifofie
    end

    # Rx FIFO full interrupt              enable
    def self.rxfifofie=(value : Bool) : Bool
      self.set(rxfifofie: value)
      value
    end

    # Tx FIFO full interrupt              enable
    def txfifofie : Bool
      @value.bits_set?(0x10000_u32)
    end

    # Tx FIFO full interrupt              enable
    def self.txfifofie : Bool
      value.txfifofie
    end

    # Tx FIFO full interrupt              enable
    def self.txfifofie=(value : Bool) : Bool
      self.set(txfifofie: value)
      value
    end

    # Rx FIFO half full interrupt              enable
    def rxfifohfie : Bool
      @value.bits_set?(0x8000_u32)
    end

    # Rx FIFO half full interrupt              enable
    def self.rxfifohfie : Bool
      value.rxfifohfie
    end

    # Rx FIFO half full interrupt              enable
    def self.rxfifohfie=(value : Bool) : Bool
      self.set(rxfifohfie: value)
      value
    end

    # Tx FIFO half empty interrupt              enable
    def txfifoheie : Bool
      @value.bits_set?(0x4000_u32)
    end

    # Tx FIFO half empty interrupt              enable
    def self.txfifoheie : Bool
      value.txfifoheie
    end

    # Tx FIFO half empty interrupt              enable
    def self.txfifoheie=(value : Bool) : Bool
      self.set(txfifoheie: value)
      value
    end

    # Data receive acting interrupt              enable
    def rxactie : Bool
      @value.bits_set?(0x2000_u32)
    end

    # Data receive acting interrupt              enable
    def self.rxactie : Bool
      value.rxactie
    end

    # Data receive acting interrupt              enable
    def self.rxactie=(value : Bool) : Bool
      self.set(rxactie: value)
      value
    end

    # Data transmit acting interrupt              enable
    def txactie : Bool
      @value.bits_set?(0x1000_u32)
    end

    # Data transmit acting interrupt              enable
    def self.txactie : Bool
      value.txactie
    end

    # Data transmit acting interrupt              enable
    def self.txactie=(value : Bool) : Bool
      self.set(txactie: value)
      value
    end

    # Command acting interrupt              enable
    def cmdactie : Bool
      @value.bits_set?(0x800_u32)
    end

    # Command acting interrupt              enable
    def self.cmdactie : Bool
      value.cmdactie
    end

    # Command acting interrupt              enable
    def self.cmdactie=(value : Bool) : Bool
      self.set(cmdactie: value)
      value
    end

    # Data block end interrupt              enable
    def dbckendie : Bool
      @value.bits_set?(0x400_u32)
    end

    # Data block end interrupt              enable
    def self.dbckendie : Bool
      value.dbckendie
    end

    # Data block end interrupt              enable
    def self.dbckendie=(value : Bool) : Bool
      self.set(dbckendie: value)
      value
    end

    # Start bit error interrupt              enable
    def stbiterrie : Bool
      @value.bits_set?(0x200_u32)
    end

    # Start bit error interrupt              enable
    def self.stbiterrie : Bool
      value.stbiterrie
    end

    # Start bit error interrupt              enable
    def self.stbiterrie=(value : Bool) : Bool
      self.set(stbiterrie: value)
      value
    end

    # Data end interrupt enable
    def dataendie : Bool
      @value.bits_set?(0x100_u32)
    end

    # Data end interrupt enable
    def self.dataendie : Bool
      value.dataendie
    end

    # Data end interrupt enable
    def self.dataendie=(value : Bool) : Bool
      self.set(dataendie: value)
      value
    end

    # Command sent interrupt              enable
    def cmdsentie : Bool
      @value.bits_set?(0x80_u32)
    end

    # Command sent interrupt              enable
    def self.cmdsentie : Bool
      value.cmdsentie
    end

    # Command sent interrupt              enable
    def self.cmdsentie=(value : Bool) : Bool
      self.set(cmdsentie: value)
      value
    end

    # Command response received interrupt              enable
    def cmdrendie : Bool
      @value.bits_set?(0x40_u32)
    end

    # Command response received interrupt              enable
    def self.cmdrendie : Bool
      value.cmdrendie
    end

    # Command response received interrupt              enable
    def self.cmdrendie=(value : Bool) : Bool
      self.set(cmdrendie: value)
      value
    end

    # Rx FIFO overrun error interrupt              enable
    def rxoverrie : Bool
      @value.bits_set?(0x20_u32)
    end

    # Rx FIFO overrun error interrupt              enable
    def self.rxoverrie : Bool
      value.rxoverrie
    end

    # Rx FIFO overrun error interrupt              enable
    def self.rxoverrie=(value : Bool) : Bool
      self.set(rxoverrie: value)
      value
    end

    # Tx FIFO underrun error interrupt              enable
    def txunderrie : Bool
      @value.bits_set?(0x10_u32)
    end

    # Tx FIFO underrun error interrupt              enable
    def self.txunderrie : Bool
      value.txunderrie
    end

    # Tx FIFO underrun error interrupt              enable
    def self.txunderrie=(value : Bool) : Bool
      self.set(txunderrie: value)
      value
    end

    # Data timeout interrupt              enable
    def dtimeoutie : Bool
      @value.bits_set?(0x8_u32)
    end

    # Data timeout interrupt              enable
    def self.dtimeoutie : Bool
      value.dtimeoutie
    end

    # Data timeout interrupt              enable
    def self.dtimeoutie=(value : Bool) : Bool
      self.set(dtimeoutie: value)
      value
    end

    # Command timeout interrupt              enable
    def ctimeoutie : Bool
      @value.bits_set?(0x4_u32)
    end

    # Command timeout interrupt              enable
    def self.ctimeoutie : Bool
      value.ctimeoutie
    end

    # Command timeout interrupt              enable
    def self.ctimeoutie=(value : Bool) : Bool
      self.set(ctimeoutie: value)
      value
    end

    # Data CRC fail interrupt              enable
    def dcrcfailie : Bool
      @value.bits_set?(0x2_u32)
    end

    # Data CRC fail interrupt              enable
    def self.dcrcfailie : Bool
      value.dcrcfailie
    end

    # Data CRC fail interrupt              enable
    def self.dcrcfailie=(value : Bool) : Bool
      self.set(dcrcfailie: value)
      value
    end

    # Command CRC fail interrupt              enable
    def ccrcfailie : Bool
      @value.bits_set?(0x1_u32)
    end

    # Command CRC fail interrupt              enable
    def self.ccrcfailie : Bool
      value.ccrcfailie
    end

    # Command CRC fail interrupt              enable
    def self.ccrcfailie=(value : Bool) : Bool
      self.set(ccrcfailie: value)
      value
    end

    def copy_with(
      *,

      ceataendie : Bool? = nil,

      itie : Bool? = nil,

      rxdavlie : Bool? = nil,

      txdavlie : Bool? = nil,

      rxfifoeie : Bool? = nil,

      txfifoeie : Bool? = nil,

      rxfifofie : Bool? = nil,

      txfifofie : Bool? = nil,

      rxfifohfie : Bool? = nil,

      txfifoheie : Bool? = nil,

      rxactie : Bool? = nil,

      txactie : Bool? = nil,

      cmdactie : Bool? = nil,

      dbckendie : Bool? = nil,

      stbiterrie : Bool? = nil,

      dataendie : Bool? = nil,

      cmdsentie : Bool? = nil,

      cmdrendie : Bool? = nil,

      rxoverrie : Bool? = nil,

      txunderrie : Bool? = nil,

      dtimeoutie : Bool? = nil,

      ctimeoutie : Bool? = nil,

      dcrcfailie : Bool? = nil,

      ccrcfailie : Bool? = nil
    ) : self
      value = @value

      unless ceataendie.nil?
        value = (value & 0xff7fffff_u32) |
                UInt32.new!(ceataendie.to_int).&(0x1_u32) << 23
      end

      unless itie.nil?
        value = (value & 0xffbfffff_u32) |
                UInt32.new!(itie.to_int).&(0x1_u32) << 22
      end

      unless rxdavlie.nil?
        value = (value & 0xffdfffff_u32) |
                UInt32.new!(rxdavlie.to_int).&(0x1_u32) << 21
      end

      unless txdavlie.nil?
        value = (value & 0xffefffff_u32) |
                UInt32.new!(txdavlie.to_int).&(0x1_u32) << 20
      end

      unless rxfifoeie.nil?
        value = (value & 0xfff7ffff_u32) |
                UInt32.new!(rxfifoeie.to_int).&(0x1_u32) << 19
      end

      unless txfifoeie.nil?
        value = (value & 0xfffbffff_u32) |
                UInt32.new!(txfifoeie.to_int).&(0x1_u32) << 18
      end

      unless rxfifofie.nil?
        value = (value & 0xfffdffff_u32) |
                UInt32.new!(rxfifofie.to_int).&(0x1_u32) << 17
      end

      unless txfifofie.nil?
        value = (value & 0xfffeffff_u32) |
                UInt32.new!(txfifofie.to_int).&(0x1_u32) << 16
      end

      unless rxfifohfie.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(rxfifohfie.to_int).&(0x1_u32) << 15
      end

      unless txfifoheie.nil?
        value = (value & 0xffffbfff_u32) |
                UInt32.new!(txfifoheie.to_int).&(0x1_u32) << 14
      end

      unless rxactie.nil?
        value = (value & 0xffffdfff_u32) |
                UInt32.new!(rxactie.to_int).&(0x1_u32) << 13
      end

      unless txactie.nil?
        value = (value & 0xffffefff_u32) |
                UInt32.new!(txactie.to_int).&(0x1_u32) << 12
      end

      unless cmdactie.nil?
        value = (value & 0xfffff7ff_u32) |
                UInt32.new!(cmdactie.to_int).&(0x1_u32) << 11
      end

      unless dbckendie.nil?
        value = (value & 0xfffffbff_u32) |
                UInt32.new!(dbckendie.to_int).&(0x1_u32) << 10
      end

      unless stbiterrie.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(stbiterrie.to_int).&(0x1_u32) << 9
      end

      unless dataendie.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(dataendie.to_int).&(0x1_u32) << 8
      end

      unless cmdsentie.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(cmdsentie.to_int).&(0x1_u32) << 7
      end

      unless cmdrendie.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(cmdrendie.to_int).&(0x1_u32) << 6
      end

      unless rxoverrie.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(rxoverrie.to_int).&(0x1_u32) << 5
      end

      unless txunderrie.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(txunderrie.to_int).&(0x1_u32) << 4
      end

      unless dtimeoutie.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(dtimeoutie.to_int).&(0x1_u32) << 3
      end

      unless ctimeoutie.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(ctimeoutie.to_int).&(0x1_u32) << 2
      end

      unless dcrcfailie.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(dcrcfailie.to_int).&(0x1_u32) << 1
      end

      unless ccrcfailie.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(ccrcfailie.to_int).&(0x1_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      ceataendie : Bool? = nil,
      itie : Bool? = nil,
      rxdavlie : Bool? = nil,
      txdavlie : Bool? = nil,
      rxfifoeie : Bool? = nil,
      txfifoeie : Bool? = nil,
      rxfifofie : Bool? = nil,
      txfifofie : Bool? = nil,
      rxfifohfie : Bool? = nil,
      txfifoheie : Bool? = nil,
      rxactie : Bool? = nil,
      txactie : Bool? = nil,
      cmdactie : Bool? = nil,
      dbckendie : Bool? = nil,
      stbiterrie : Bool? = nil,
      dataendie : Bool? = nil,
      cmdsentie : Bool? = nil,
      cmdrendie : Bool? = nil,
      rxoverrie : Bool? = nil,
      txunderrie : Bool? = nil,
      dtimeoutie : Bool? = nil,
      ctimeoutie : Bool? = nil,
      dcrcfailie : Bool? = nil,
      ccrcfailie : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        ceataendie: ceataendie,
        itie: itie,
        rxdavlie: rxdavlie,
        txdavlie: txdavlie,
        rxfifoeie: rxfifoeie,
        txfifoeie: txfifoeie,
        rxfifofie: rxfifofie,
        txfifofie: txfifofie,
        rxfifohfie: rxfifohfie,
        txfifoheie: txfifoheie,
        rxactie: rxactie,
        txactie: txactie,
        cmdactie: cmdactie,
        dbckendie: dbckendie,
        stbiterrie: stbiterrie,
        dataendie: dataendie,
        cmdsentie: cmdsentie,
        cmdrendie: cmdrendie,
        rxoverrie: rxoverrie,
        txunderrie: txunderrie,
        dtimeoutie: dtimeoutie,
        ctimeoutie: ctimeoutie,
        dcrcfailie: dcrcfailie,
        ccrcfailie: ccrcfailie,
      )
    end
  end # struct

  # FIFO counter register
  struct FIFOCNT
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

    # Remaining number of words to be written              to or read from the FIFO.
    def fifocount : UInt32
      UInt32.new!((@value >> 0) & 0xffffff_u32)
    end

    # Remaining number of words to be written              to or read from the FIFO.
    def self.fifocount : UInt32
      value.fifocount
    end
  end # struct

  # data FIFO register
  struct FIFO
    ADDRESS = BASE_ADDRESS + 0x80_u64

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

    # Receive and transmit FIFO              data
    def data : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # Receive and transmit FIFO              data
    def self.data : UInt32
      value.data
    end

    # Receive and transmit FIFO              data
    def self.data=(value : UInt32) : UInt32
      self.set(data: value)
      value
    end

    def copy_with(
      *,

      data : UInt32? = nil
    ) : self
      value = @value

      unless data.nil?
        value = (value & 0xffffffff_u32) |
                UInt32.new!(data.to_int).&(0x0_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      data : UInt32? = nil
    ) : Nil
      self.value = self.value.copy_with(
        data: data,
      )
    end
  end # struct

end
