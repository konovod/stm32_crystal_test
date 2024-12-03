# Ethernet: MAC management counters
module Ethernet_MMC
  VERSION      = nil
  BASE_ADDRESS = 0x40028100_u64

  # Ethernet MMC control register
  struct MMCCR
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

    # CR
    def cr : Bool
      @value.bits_set?(0x1_u32)
    end

    # CR
    def self.cr : Bool
      value.cr
    end

    # CR
    def self.cr=(value : Bool) : Bool
      self.set(cr: value)
      value
    end

    # CSR
    def csr : Bool
      @value.bits_set?(0x2_u32)
    end

    # CSR
    def self.csr : Bool
      value.csr
    end

    # CSR
    def self.csr=(value : Bool) : Bool
      self.set(csr: value)
      value
    end

    # ROR
    def ror : Bool
      @value.bits_set?(0x4_u32)
    end

    # ROR
    def self.ror : Bool
      value.ror
    end

    # ROR
    def self.ror=(value : Bool) : Bool
      self.set(ror: value)
      value
    end

    # MCF
    def mcf : Bool
      @value.bits_set?(0x8_u32)
    end

    # MCF
    def self.mcf : Bool
      value.mcf
    end

    # MCF
    def self.mcf=(value : Bool) : Bool
      self.set(mcf: value)
      value
    end

    # MCP
    def mcp : Bool
      @value.bits_set?(0x10_u32)
    end

    # MCP
    def self.mcp : Bool
      value.mcp
    end

    # MCP
    def self.mcp=(value : Bool) : Bool
      self.set(mcp: value)
      value
    end

    # MCFHP
    def mcfhp : Bool
      @value.bits_set?(0x20_u32)
    end

    # MCFHP
    def self.mcfhp : Bool
      value.mcfhp
    end

    # MCFHP
    def self.mcfhp=(value : Bool) : Bool
      self.set(mcfhp: value)
      value
    end

    def copy_with(
      *,

      cr : Bool? = nil,

      csr : Bool? = nil,

      ror : Bool? = nil,

      mcf : Bool? = nil,

      mcp : Bool? = nil,

      mcfhp : Bool? = nil
    ) : self
      value = @value

      unless cr.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(cr.to_int).&(0x1_u32) << 0
      end

      unless csr.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(csr.to_int).&(0x1_u32) << 1
      end

      unless ror.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(ror.to_int).&(0x1_u32) << 2
      end

      unless mcf.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(mcf.to_int).&(0x1_u32) << 3
      end

      unless mcp.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(mcp.to_int).&(0x1_u32) << 4
      end

      unless mcfhp.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(mcfhp.to_int).&(0x1_u32) << 5
      end

      self.class.new(value)
    end

    def self.set(
      *,
      cr : Bool? = nil,
      csr : Bool? = nil,
      ror : Bool? = nil,
      mcf : Bool? = nil,
      mcp : Bool? = nil,
      mcfhp : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        cr: cr,
        csr: csr,
        ror: ror,
        mcf: mcf,
        mcp: mcp,
        mcfhp: mcfhp,
      )
    end
  end # struct

  # Ethernet MMC receive interrupt          register
  struct MMCRIR
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

    # RFCES
    def rfces : Bool
      @value.bits_set?(0x20_u32)
    end

    # RFCES
    def self.rfces : Bool
      value.rfces
    end

    # RFCES
    def self.rfces=(value : Bool) : Bool
      self.set(rfces: value)
      value
    end

    # RFAES
    def rfaes : Bool
      @value.bits_set?(0x40_u32)
    end

    # RFAES
    def self.rfaes : Bool
      value.rfaes
    end

    # RFAES
    def self.rfaes=(value : Bool) : Bool
      self.set(rfaes: value)
      value
    end

    # RGUFS
    def rgufs : Bool
      @value.bits_set?(0x20000_u32)
    end

    # RGUFS
    def self.rgufs : Bool
      value.rgufs
    end

    # RGUFS
    def self.rgufs=(value : Bool) : Bool
      self.set(rgufs: value)
      value
    end

    def copy_with(
      *,

      rfces : Bool? = nil,

      rfaes : Bool? = nil,

      rgufs : Bool? = nil
    ) : self
      value = @value

      unless rfces.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(rfces.to_int).&(0x1_u32) << 5
      end

      unless rfaes.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(rfaes.to_int).&(0x1_u32) << 6
      end

      unless rgufs.nil?
        value = (value & 0xfffdffff_u32) |
                UInt32.new!(rgufs.to_int).&(0x1_u32) << 17
      end

      self.class.new(value)
    end

    def self.set(
      *,
      rfces : Bool? = nil,
      rfaes : Bool? = nil,
      rgufs : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        rfces: rfces,
        rfaes: rfaes,
        rgufs: rgufs,
      )
    end
  end # struct

  # Ethernet MMC transmit interrupt          register
  struct MMCTIR
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

    # TGFSCS
    def tgfscs : Bool
      @value.bits_set?(0x4000_u32)
    end

    # TGFSCS
    def self.tgfscs : Bool
      value.tgfscs
    end

    # TGFMSCS
    def tgfmscs : Bool
      @value.bits_set?(0x8000_u32)
    end

    # TGFMSCS
    def self.tgfmscs : Bool
      value.tgfmscs
    end

    # TGFS
    def tgfs : Bool
      @value.bits_set?(0x200000_u32)
    end

    # TGFS
    def self.tgfs : Bool
      value.tgfs
    end
  end # struct

  # Ethernet MMC receive interrupt mask          register
  struct MMCRIMR
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

    # RFCEM
    def rfcem : Bool
      @value.bits_set?(0x20_u32)
    end

    # RFCEM
    def self.rfcem : Bool
      value.rfcem
    end

    # RFCEM
    def self.rfcem=(value : Bool) : Bool
      self.set(rfcem: value)
      value
    end

    # RFAEM
    def rfaem : Bool
      @value.bits_set?(0x40_u32)
    end

    # RFAEM
    def self.rfaem : Bool
      value.rfaem
    end

    # RFAEM
    def self.rfaem=(value : Bool) : Bool
      self.set(rfaem: value)
      value
    end

    # RGUFM
    def rgufm : Bool
      @value.bits_set?(0x20000_u32)
    end

    # RGUFM
    def self.rgufm : Bool
      value.rgufm
    end

    # RGUFM
    def self.rgufm=(value : Bool) : Bool
      self.set(rgufm: value)
      value
    end

    def copy_with(
      *,

      rfcem : Bool? = nil,

      rfaem : Bool? = nil,

      rgufm : Bool? = nil
    ) : self
      value = @value

      unless rfcem.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(rfcem.to_int).&(0x1_u32) << 5
      end

      unless rfaem.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(rfaem.to_int).&(0x1_u32) << 6
      end

      unless rgufm.nil?
        value = (value & 0xfffdffff_u32) |
                UInt32.new!(rgufm.to_int).&(0x1_u32) << 17
      end

      self.class.new(value)
    end

    def self.set(
      *,
      rfcem : Bool? = nil,
      rfaem : Bool? = nil,
      rgufm : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        rfcem: rfcem,
        rfaem: rfaem,
        rgufm: rgufm,
      )
    end
  end # struct

  # Ethernet MMC transmit interrupt mask          register
  struct MMCTIMR
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

    # TGFSCM
    def tgfscm : Bool
      @value.bits_set?(0x4000_u32)
    end

    # TGFSCM
    def self.tgfscm : Bool
      value.tgfscm
    end

    # TGFSCM
    def self.tgfscm=(value : Bool) : Bool
      self.set(tgfscm: value)
      value
    end

    # TGFMSCM
    def tgfmscm : Bool
      @value.bits_set?(0x8000_u32)
    end

    # TGFMSCM
    def self.tgfmscm : Bool
      value.tgfmscm
    end

    # TGFMSCM
    def self.tgfmscm=(value : Bool) : Bool
      self.set(tgfmscm: value)
      value
    end

    # TGFM
    def tgfm : Bool
      @value.bits_set?(0x10000_u32)
    end

    # TGFM
    def self.tgfm : Bool
      value.tgfm
    end

    # TGFM
    def self.tgfm=(value : Bool) : Bool
      self.set(tgfm: value)
      value
    end

    def copy_with(
      *,

      tgfscm : Bool? = nil,

      tgfmscm : Bool? = nil,

      tgfm : Bool? = nil
    ) : self
      value = @value

      unless tgfscm.nil?
        value = (value & 0xffffbfff_u32) |
                UInt32.new!(tgfscm.to_int).&(0x1_u32) << 14
      end

      unless tgfmscm.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(tgfmscm.to_int).&(0x1_u32) << 15
      end

      unless tgfm.nil?
        value = (value & 0xfffeffff_u32) |
                UInt32.new!(tgfm.to_int).&(0x1_u32) << 16
      end

      self.class.new(value)
    end

    def self.set(
      *,
      tgfscm : Bool? = nil,
      tgfmscm : Bool? = nil,
      tgfm : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        tgfscm: tgfscm,
        tgfmscm: tgfmscm,
        tgfm: tgfm,
      )
    end
  end # struct

  # Ethernet MMC transmitted good frames after a          single collision counter
  struct MMCTGFSCCR
    ADDRESS = BASE_ADDRESS + 0x4c_u64

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

    # TGFSCC
    def tgfscc : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # TGFSCC
    def self.tgfscc : UInt32
      value.tgfscc
    end
  end # struct

  # Ethernet MMC transmitted good frames after          more than a single collision
  struct MMCTGFMSCCR
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

    # TGFMSCC
    def tgfmscc : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # TGFMSCC
    def self.tgfmscc : UInt32
      value.tgfmscc
    end
  end # struct

  # Ethernet MMC transmitted good frames counter          register
  struct MMCTGFCR
    ADDRESS = BASE_ADDRESS + 0x68_u64

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

    # HTL
    def tgfc : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # HTL
    def self.tgfc : UInt32
      value.tgfc
    end
  end # struct

  # Ethernet MMC received frames with CRC error          counter register
  struct MMCRFCECR
    ADDRESS = BASE_ADDRESS + 0x94_u64

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

    # RFCFC
    def rfcfc : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # RFCFC
    def self.rfcfc : UInt32
      value.rfcfc
    end
  end # struct

  # Ethernet MMC received frames with alignment          error counter register
  struct MMCRFAECR
    ADDRESS = BASE_ADDRESS + 0x98_u64

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

    # RFAEC
    def rfaec : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # RFAEC
    def self.rfaec : UInt32
      value.rfaec
    end
  end # struct

  # MMC received good unicast frames counter          register
  struct MMCRGUFCR
    ADDRESS = BASE_ADDRESS + 0xc4_u64

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

    # RGUFC
    def rgufc : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # RGUFC
    def self.rgufc : UInt32
      value.rgufc
    end
  end # struct

end
