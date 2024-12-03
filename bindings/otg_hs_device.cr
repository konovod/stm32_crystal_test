# USB on the go high speed
module OTG_HS_DEVICE
  VERSION      = nil
  BASE_ADDRESS = 0x40040800_u64

  # OTG_HS device configuration          register
  struct OTG_HS_DCFG
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
      new(0x2200000_u64)
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

    # Device speed
    def dspd : UInt8
      UInt8.new!((@value >> 0) & 0x3_u32)
    end

    # Device speed
    def self.dspd : UInt8
      value.dspd
    end

    # Device speed
    def self.dspd=(value : UInt8) : UInt8
      self.set(dspd: value)
      value
    end

    # Nonzero-length status OUT              handshake
    def nzlsohsk : Bool
      @value.bits_set?(0x4_u32)
    end

    # Nonzero-length status OUT              handshake
    def self.nzlsohsk : Bool
      value.nzlsohsk
    end

    # Nonzero-length status OUT              handshake
    def self.nzlsohsk=(value : Bool) : Bool
      self.set(nzlsohsk: value)
      value
    end

    # Device address
    def dad : UInt8
      UInt8.new!((@value >> 4) & 0x7f_u32)
    end

    # Device address
    def self.dad : UInt8
      value.dad
    end

    # Device address
    def self.dad=(value : UInt8) : UInt8
      self.set(dad: value)
      value
    end

    # Periodic (micro)frame              interval
    def pfivl : UInt8
      UInt8.new!((@value >> 11) & 0x3_u32)
    end

    # Periodic (micro)frame              interval
    def self.pfivl : UInt8
      value.pfivl
    end

    # Periodic (micro)frame              interval
    def self.pfivl=(value : UInt8) : UInt8
      self.set(pfivl: value)
      value
    end

    # Periodic scheduling              interval
    def perschivl : UInt8
      UInt8.new!((@value >> 24) & 0x3_u32)
    end

    # Periodic scheduling              interval
    def self.perschivl : UInt8
      value.perschivl
    end

    # Periodic scheduling              interval
    def self.perschivl=(value : UInt8) : UInt8
      self.set(perschivl: value)
      value
    end

    def copy_with(
      *,

      dspd : UInt8? = nil,

      nzlsohsk : Bool? = nil,

      dad : UInt8? = nil,

      pfivl : UInt8? = nil,

      perschivl : UInt8? = nil
    ) : self
      value = @value

      unless dspd.nil?
        value = (value & 0xfffffffc_u32) |
                UInt32.new!(dspd.to_int).&(0x3_u32) << 0
      end

      unless nzlsohsk.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(nzlsohsk.to_int).&(0x1_u32) << 2
      end

      unless dad.nil?
        value = (value & 0xfffff80f_u32) |
                UInt32.new!(dad.to_int).&(0x7f_u32) << 4
      end

      unless pfivl.nil?
        value = (value & 0xffffe7ff_u32) |
                UInt32.new!(pfivl.to_int).&(0x3_u32) << 11
      end

      unless perschivl.nil?
        value = (value & 0xfcffffff_u32) |
                UInt32.new!(perschivl.to_int).&(0x3_u32) << 24
      end

      self.class.new(value)
    end

    def self.set(
      *,
      dspd : UInt8? = nil,
      nzlsohsk : Bool? = nil,
      dad : UInt8? = nil,
      pfivl : UInt8? = nil,
      perschivl : UInt8? = nil
    ) : Nil
      self.value = self.value.copy_with(
        dspd: dspd,
        nzlsohsk: nzlsohsk,
        dad: dad,
        pfivl: pfivl,
        perschivl: perschivl,
      )
    end
  end # struct

  # OTG_HS device control register
  struct OTG_HS_DCTL
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

    # Remote wakeup signaling
    def rwusig : Bool
      @value.bits_set?(0x1_u32)
    end

    # Remote wakeup signaling
    def self.rwusig : Bool
      value.rwusig
    end

    # Remote wakeup signaling
    def self.rwusig=(value : Bool) : Bool
      self.set(rwusig: value)
      value
    end

    # Soft disconnect
    def sdis : Bool
      @value.bits_set?(0x2_u32)
    end

    # Soft disconnect
    def self.sdis : Bool
      value.sdis
    end

    # Soft disconnect
    def self.sdis=(value : Bool) : Bool
      self.set(sdis: value)
      value
    end

    # Global IN NAK status
    def ginsts : Bool
      @value.bits_set?(0x4_u32)
    end

    # Global IN NAK status
    def self.ginsts : Bool
      value.ginsts
    end

    # Global OUT NAK status
    def gonsts : Bool
      @value.bits_set?(0x8_u32)
    end

    # Global OUT NAK status
    def self.gonsts : Bool
      value.gonsts
    end

    # Test control
    def tctl : UInt8
      UInt8.new!((@value >> 4) & 0x7_u32)
    end

    # Test control
    def self.tctl : UInt8
      value.tctl
    end

    # Test control
    def self.tctl=(value : UInt8) : UInt8
      self.set(tctl: value)
      value
    end

    # Set global IN NAK
    def self.sginak=(value : Bool) : Bool
      self.set(sginak: value)
      value
    end

    # Clear global IN NAK
    def self.cginak=(value : Bool) : Bool
      self.set(cginak: value)
      value
    end

    # Set global OUT NAK
    def self.sgonak=(value : Bool) : Bool
      self.set(sgonak: value)
      value
    end

    # Clear global OUT NAK
    def self.cgonak=(value : Bool) : Bool
      self.set(cgonak: value)
      value
    end

    # Power-on programming done
    def poprgdne : Bool
      @value.bits_set?(0x800_u32)
    end

    # Power-on programming done
    def self.poprgdne : Bool
      value.poprgdne
    end

    # Power-on programming done
    def self.poprgdne=(value : Bool) : Bool
      self.set(poprgdne: value)
      value
    end

    def copy_with(
      *,

      rwusig : Bool? = nil,

      sdis : Bool? = nil,

      tctl : UInt8? = nil,

      sginak : Bool? = nil,

      cginak : Bool? = nil,

      sgonak : Bool? = nil,

      cgonak : Bool? = nil,

      poprgdne : Bool? = nil
    ) : self
      value = @value

      unless rwusig.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(rwusig.to_int).&(0x1_u32) << 0
      end

      unless sdis.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(sdis.to_int).&(0x1_u32) << 1
      end

      unless tctl.nil?
        value = (value & 0xffffff8f_u32) |
                UInt32.new!(tctl.to_int).&(0x7_u32) << 4
      end

      unless sginak.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(sginak.to_int).&(0x1_u32) << 7
      end

      unless cginak.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(cginak.to_int).&(0x1_u32) << 8
      end

      unless sgonak.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(sgonak.to_int).&(0x1_u32) << 9
      end

      unless cgonak.nil?
        value = (value & 0xfffffbff_u32) |
                UInt32.new!(cgonak.to_int).&(0x1_u32) << 10
      end

      unless poprgdne.nil?
        value = (value & 0xfffff7ff_u32) |
                UInt32.new!(poprgdne.to_int).&(0x1_u32) << 11
      end

      self.class.new(value)
    end

    def self.set(
      *,
      rwusig : Bool? = nil,
      sdis : Bool? = nil,
      tctl : UInt8? = nil,
      sginak : Bool? = nil,
      cginak : Bool? = nil,
      sgonak : Bool? = nil,
      cgonak : Bool? = nil,
      poprgdne : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        rwusig: rwusig,
        sdis: sdis,
        tctl: tctl,
        sginak: sginak,
        cginak: cginak,
        sgonak: sgonak,
        cgonak: cgonak,
        poprgdne: poprgdne,
      )
    end
  end # struct

  # OTG_HS device status register
  struct OTG_HS_DSTS
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
      new(0x10_u64)
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

    # Suspend status
    def suspsts : Bool
      @value.bits_set?(0x1_u32)
    end

    # Suspend status
    def self.suspsts : Bool
      value.suspsts
    end

    # Enumerated speed
    def enumspd : UInt8
      UInt8.new!((@value >> 1) & 0x3_u32)
    end

    # Enumerated speed
    def self.enumspd : UInt8
      value.enumspd
    end

    # Erratic error
    def eerr : Bool
      @value.bits_set?(0x8_u32)
    end

    # Erratic error
    def self.eerr : Bool
      value.eerr
    end

    # Frame number of the received              SOF
    def fnsof : UInt16
      UInt16.new!((@value >> 8) & 0x3fff_u32)
    end

    # Frame number of the received              SOF
    def self.fnsof : UInt16
      value.fnsof
    end
  end # struct

  # OTG_HS device IN endpoint common interrupt          mask register
  struct OTG_HS_DIEPMSK
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

    # Transfer completed interrupt              mask
    def xfrcm : Bool
      @value.bits_set?(0x1_u32)
    end

    # Transfer completed interrupt              mask
    def self.xfrcm : Bool
      value.xfrcm
    end

    # Transfer completed interrupt              mask
    def self.xfrcm=(value : Bool) : Bool
      self.set(xfrcm: value)
      value
    end

    # Endpoint disabled interrupt              mask
    def epdm : Bool
      @value.bits_set?(0x2_u32)
    end

    # Endpoint disabled interrupt              mask
    def self.epdm : Bool
      value.epdm
    end

    # Endpoint disabled interrupt              mask
    def self.epdm=(value : Bool) : Bool
      self.set(epdm: value)
      value
    end

    # Timeout condition mask (nonisochronous              endpoints)
    def tom : Bool
      @value.bits_set?(0x8_u32)
    end

    # Timeout condition mask (nonisochronous              endpoints)
    def self.tom : Bool
      value.tom
    end

    # Timeout condition mask (nonisochronous              endpoints)
    def self.tom=(value : Bool) : Bool
      self.set(tom: value)
      value
    end

    # IN token received when TxFIFO empty              mask
    def ittxfemsk : Bool
      @value.bits_set?(0x10_u32)
    end

    # IN token received when TxFIFO empty              mask
    def self.ittxfemsk : Bool
      value.ittxfemsk
    end

    # IN token received when TxFIFO empty              mask
    def self.ittxfemsk=(value : Bool) : Bool
      self.set(ittxfemsk: value)
      value
    end

    # IN token received with EP mismatch              mask
    def inepnmm : Bool
      @value.bits_set?(0x20_u32)
    end

    # IN token received with EP mismatch              mask
    def self.inepnmm : Bool
      value.inepnmm
    end

    # IN token received with EP mismatch              mask
    def self.inepnmm=(value : Bool) : Bool
      self.set(inepnmm: value)
      value
    end

    # IN endpoint NAK effective              mask
    def inepnem : Bool
      @value.bits_set?(0x40_u32)
    end

    # IN endpoint NAK effective              mask
    def self.inepnem : Bool
      value.inepnem
    end

    # IN endpoint NAK effective              mask
    def self.inepnem=(value : Bool) : Bool
      self.set(inepnem: value)
      value
    end

    # FIFO underrun mask
    def txfurm : Bool
      @value.bits_set?(0x100_u32)
    end

    # FIFO underrun mask
    def self.txfurm : Bool
      value.txfurm
    end

    # FIFO underrun mask
    def self.txfurm=(value : Bool) : Bool
      self.set(txfurm: value)
      value
    end

    # BNA interrupt mask
    def bim : Bool
      @value.bits_set?(0x200_u32)
    end

    # BNA interrupt mask
    def self.bim : Bool
      value.bim
    end

    # BNA interrupt mask
    def self.bim=(value : Bool) : Bool
      self.set(bim: value)
      value
    end

    def copy_with(
      *,

      xfrcm : Bool? = nil,

      epdm : Bool? = nil,

      tom : Bool? = nil,

      ittxfemsk : Bool? = nil,

      inepnmm : Bool? = nil,

      inepnem : Bool? = nil,

      txfurm : Bool? = nil,

      bim : Bool? = nil
    ) : self
      value = @value

      unless xfrcm.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(xfrcm.to_int).&(0x1_u32) << 0
      end

      unless epdm.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(epdm.to_int).&(0x1_u32) << 1
      end

      unless tom.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(tom.to_int).&(0x1_u32) << 3
      end

      unless ittxfemsk.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(ittxfemsk.to_int).&(0x1_u32) << 4
      end

      unless inepnmm.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(inepnmm.to_int).&(0x1_u32) << 5
      end

      unless inepnem.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(inepnem.to_int).&(0x1_u32) << 6
      end

      unless txfurm.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(txfurm.to_int).&(0x1_u32) << 8
      end

      unless bim.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(bim.to_int).&(0x1_u32) << 9
      end

      self.class.new(value)
    end

    def self.set(
      *,
      xfrcm : Bool? = nil,
      epdm : Bool? = nil,
      tom : Bool? = nil,
      ittxfemsk : Bool? = nil,
      inepnmm : Bool? = nil,
      inepnem : Bool? = nil,
      txfurm : Bool? = nil,
      bim : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        xfrcm: xfrcm,
        epdm: epdm,
        tom: tom,
        ittxfemsk: ittxfemsk,
        inepnmm: inepnmm,
        inepnem: inepnem,
        txfurm: txfurm,
        bim: bim,
      )
    end
  end # struct

  # OTG_HS device OUT endpoint common interrupt          mask register
  struct OTG_HS_DOEPMSK
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

    # Transfer completed interrupt              mask
    def xfrcm : Bool
      @value.bits_set?(0x1_u32)
    end

    # Transfer completed interrupt              mask
    def self.xfrcm : Bool
      value.xfrcm
    end

    # Transfer completed interrupt              mask
    def self.xfrcm=(value : Bool) : Bool
      self.set(xfrcm: value)
      value
    end

    # Endpoint disabled interrupt              mask
    def epdm : Bool
      @value.bits_set?(0x2_u32)
    end

    # Endpoint disabled interrupt              mask
    def self.epdm : Bool
      value.epdm
    end

    # Endpoint disabled interrupt              mask
    def self.epdm=(value : Bool) : Bool
      self.set(epdm: value)
      value
    end

    # SETUP phase done mask
    def stupm : Bool
      @value.bits_set?(0x8_u32)
    end

    # SETUP phase done mask
    def self.stupm : Bool
      value.stupm
    end

    # SETUP phase done mask
    def self.stupm=(value : Bool) : Bool
      self.set(stupm: value)
      value
    end

    # OUT token received when endpoint              disabled mask
    def otepdm : Bool
      @value.bits_set?(0x10_u32)
    end

    # OUT token received when endpoint              disabled mask
    def self.otepdm : Bool
      value.otepdm
    end

    # OUT token received when endpoint              disabled mask
    def self.otepdm=(value : Bool) : Bool
      self.set(otepdm: value)
      value
    end

    # Back-to-back SETUP packets received              mask
    def b2_bstup : Bool
      @value.bits_set?(0x40_u32)
    end

    # Back-to-back SETUP packets received              mask
    def self.b2_bstup : Bool
      value.b2_bstup
    end

    # Back-to-back SETUP packets received              mask
    def self.b2_bstup=(value : Bool) : Bool
      self.set(b2_bstup: value)
      value
    end

    # OUT packet error mask
    def opem : Bool
      @value.bits_set?(0x100_u32)
    end

    # OUT packet error mask
    def self.opem : Bool
      value.opem
    end

    # OUT packet error mask
    def self.opem=(value : Bool) : Bool
      self.set(opem: value)
      value
    end

    # BNA interrupt mask
    def boim : Bool
      @value.bits_set?(0x200_u32)
    end

    # BNA interrupt mask
    def self.boim : Bool
      value.boim
    end

    # BNA interrupt mask
    def self.boim=(value : Bool) : Bool
      self.set(boim: value)
      value
    end

    def copy_with(
      *,

      xfrcm : Bool? = nil,

      epdm : Bool? = nil,

      stupm : Bool? = nil,

      otepdm : Bool? = nil,

      b2_bstup : Bool? = nil,

      opem : Bool? = nil,

      boim : Bool? = nil
    ) : self
      value = @value

      unless xfrcm.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(xfrcm.to_int).&(0x1_u32) << 0
      end

      unless epdm.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(epdm.to_int).&(0x1_u32) << 1
      end

      unless stupm.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(stupm.to_int).&(0x1_u32) << 3
      end

      unless otepdm.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(otepdm.to_int).&(0x1_u32) << 4
      end

      unless b2_bstup.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(b2_bstup.to_int).&(0x1_u32) << 6
      end

      unless opem.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(opem.to_int).&(0x1_u32) << 8
      end

      unless boim.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(boim.to_int).&(0x1_u32) << 9
      end

      self.class.new(value)
    end

    def self.set(
      *,
      xfrcm : Bool? = nil,
      epdm : Bool? = nil,
      stupm : Bool? = nil,
      otepdm : Bool? = nil,
      b2_bstup : Bool? = nil,
      opem : Bool? = nil,
      boim : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        xfrcm: xfrcm,
        epdm: epdm,
        stupm: stupm,
        otepdm: otepdm,
        b2_bstup: b2_bstup,
        opem: opem,
        boim: boim,
      )
    end
  end # struct

  # OTG_HS device all endpoints interrupt          register
  struct OTG_HS_DAINT
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

    # IN endpoint interrupt bits
    def iepint : UInt16
      UInt16.new!((@value >> 0) & 0xffff_u32)
    end

    # IN endpoint interrupt bits
    def self.iepint : UInt16
      value.iepint
    end

    # OUT endpoint interrupt              bits
    def oepint : UInt16
      UInt16.new!((@value >> 16) & 0xffff_u32)
    end

    # OUT endpoint interrupt              bits
    def self.oepint : UInt16
      value.oepint
    end
  end # struct

  # OTG_HS all endpoints interrupt mask          register
  struct OTG_HS_DAINTMSK
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

    # IN EP interrupt mask bits
    def iepm : UInt16
      UInt16.new!((@value >> 0) & 0xffff_u32)
    end

    # IN EP interrupt mask bits
    def self.iepm : UInt16
      value.iepm
    end

    # IN EP interrupt mask bits
    def self.iepm=(value : UInt16) : UInt16
      self.set(iepm: value)
      value
    end

    # OUT EP interrupt mask bits
    def oepm : UInt16
      UInt16.new!((@value >> 16) & 0xffff_u32)
    end

    # OUT EP interrupt mask bits
    def self.oepm : UInt16
      value.oepm
    end

    # OUT EP interrupt mask bits
    def self.oepm=(value : UInt16) : UInt16
      self.set(oepm: value)
      value
    end

    def copy_with(
      *,

      iepm : UInt16? = nil,

      oepm : UInt16? = nil
    ) : self
      value = @value

      unless iepm.nil?
        value = (value & 0xffff0000_u32) |
                UInt32.new!(iepm.to_int).&(0xffff_u32) << 0
      end

      unless oepm.nil?
        value = (value & 0xffff_u32) |
                UInt32.new!(oepm.to_int).&(0xffff_u32) << 16
      end

      self.class.new(value)
    end

    def self.set(
      *,
      iepm : UInt16? = nil,
      oepm : UInt16? = nil
    ) : Nil
      self.value = self.value.copy_with(
        iepm: iepm,
        oepm: oepm,
      )
    end
  end # struct

  # OTG_HS device VBUS discharge time          register
  struct OTG_HS_DVBUSDIS
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
      new(0x17d7_u64)
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

    # Device VBUS discharge time
    def vbusdt : UInt16
      UInt16.new!((@value >> 0) & 0xffff_u32)
    end

    # Device VBUS discharge time
    def self.vbusdt : UInt16
      value.vbusdt
    end

    # Device VBUS discharge time
    def self.vbusdt=(value : UInt16) : UInt16
      self.set(vbusdt: value)
      value
    end

    def copy_with(
      *,

      vbusdt : UInt16? = nil
    ) : self
      value = @value

      unless vbusdt.nil?
        value = (value & 0xffff0000_u32) |
                UInt32.new!(vbusdt.to_int).&(0xffff_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      vbusdt : UInt16? = nil
    ) : Nil
      self.value = self.value.copy_with(
        vbusdt: vbusdt,
      )
    end
  end # struct

  # OTG_HS device VBUS pulsing time          register
  struct OTG_HS_DVBUSPULSE
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
      new(0x5b8_u64)
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

    # Device VBUS pulsing time
    def dvbusp : UInt16
      UInt16.new!((@value >> 0) & 0xfff_u32)
    end

    # Device VBUS pulsing time
    def self.dvbusp : UInt16
      value.dvbusp
    end

    # Device VBUS pulsing time
    def self.dvbusp=(value : UInt16) : UInt16
      self.set(dvbusp: value)
      value
    end

    def copy_with(
      *,

      dvbusp : UInt16? = nil
    ) : self
      value = @value

      unless dvbusp.nil?
        value = (value & 0xfffff000_u32) |
                UInt32.new!(dvbusp.to_int).&(0xfff_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      dvbusp : UInt16? = nil
    ) : Nil
      self.value = self.value.copy_with(
        dvbusp: dvbusp,
      )
    end
  end # struct

  # OTG_HS Device threshold control          register
  struct OTG_HS_DTHRCTL
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

    # Nonisochronous IN endpoints threshold              enable
    def nonisothren : Bool
      @value.bits_set?(0x1_u32)
    end

    # Nonisochronous IN endpoints threshold              enable
    def self.nonisothren : Bool
      value.nonisothren
    end

    # Nonisochronous IN endpoints threshold              enable
    def self.nonisothren=(value : Bool) : Bool
      self.set(nonisothren: value)
      value
    end

    # ISO IN endpoint threshold              enable
    def isothren : Bool
      @value.bits_set?(0x2_u32)
    end

    # ISO IN endpoint threshold              enable
    def self.isothren : Bool
      value.isothren
    end

    # ISO IN endpoint threshold              enable
    def self.isothren=(value : Bool) : Bool
      self.set(isothren: value)
      value
    end

    # Transmit threshold length
    def txthrlen : UInt16
      UInt16.new!((@value >> 2) & 0x1ff_u32)
    end

    # Transmit threshold length
    def self.txthrlen : UInt16
      value.txthrlen
    end

    # Transmit threshold length
    def self.txthrlen=(value : UInt16) : UInt16
      self.set(txthrlen: value)
      value
    end

    # Receive threshold enable
    def rxthren : Bool
      @value.bits_set?(0x10000_u32)
    end

    # Receive threshold enable
    def self.rxthren : Bool
      value.rxthren
    end

    # Receive threshold enable
    def self.rxthren=(value : Bool) : Bool
      self.set(rxthren: value)
      value
    end

    # Receive threshold length
    def rxthrlen : UInt16
      UInt16.new!((@value >> 17) & 0x1ff_u32)
    end

    # Receive threshold length
    def self.rxthrlen : UInt16
      value.rxthrlen
    end

    # Receive threshold length
    def self.rxthrlen=(value : UInt16) : UInt16
      self.set(rxthrlen: value)
      value
    end

    # Arbiter parking enable
    def arpen : Bool
      @value.bits_set?(0x8000000_u32)
    end

    # Arbiter parking enable
    def self.arpen : Bool
      value.arpen
    end

    # Arbiter parking enable
    def self.arpen=(value : Bool) : Bool
      self.set(arpen: value)
      value
    end

    def copy_with(
      *,

      nonisothren : Bool? = nil,

      isothren : Bool? = nil,

      txthrlen : UInt16? = nil,

      rxthren : Bool? = nil,

      rxthrlen : UInt16? = nil,

      arpen : Bool? = nil
    ) : self
      value = @value

      unless nonisothren.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(nonisothren.to_int).&(0x1_u32) << 0
      end

      unless isothren.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(isothren.to_int).&(0x1_u32) << 1
      end

      unless txthrlen.nil?
        value = (value & 0xfffff803_u32) |
                UInt32.new!(txthrlen.to_int).&(0x1ff_u32) << 2
      end

      unless rxthren.nil?
        value = (value & 0xfffeffff_u32) |
                UInt32.new!(rxthren.to_int).&(0x1_u32) << 16
      end

      unless rxthrlen.nil?
        value = (value & 0xfc01ffff_u32) |
                UInt32.new!(rxthrlen.to_int).&(0x1ff_u32) << 17
      end

      unless arpen.nil?
        value = (value & 0xf7ffffff_u32) |
                UInt32.new!(arpen.to_int).&(0x1_u32) << 27
      end

      self.class.new(value)
    end

    def self.set(
      *,
      nonisothren : Bool? = nil,
      isothren : Bool? = nil,
      txthrlen : UInt16? = nil,
      rxthren : Bool? = nil,
      rxthrlen : UInt16? = nil,
      arpen : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        nonisothren: nonisothren,
        isothren: isothren,
        txthrlen: txthrlen,
        rxthren: rxthren,
        rxthrlen: rxthrlen,
        arpen: arpen,
      )
    end
  end # struct

  # OTG_HS device IN endpoint FIFO empty          interrupt mask register
  struct OTG_HS_DIEPEMPMSK
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

    # IN EP Tx FIFO empty interrupt mask              bits
    def ineptxfem : UInt16
      UInt16.new!((@value >> 0) & 0xffff_u32)
    end

    # IN EP Tx FIFO empty interrupt mask              bits
    def self.ineptxfem : UInt16
      value.ineptxfem
    end

    # IN EP Tx FIFO empty interrupt mask              bits
    def self.ineptxfem=(value : UInt16) : UInt16
      self.set(ineptxfem: value)
      value
    end

    def copy_with(
      *,

      ineptxfem : UInt16? = nil
    ) : self
      value = @value

      unless ineptxfem.nil?
        value = (value & 0xffff0000_u32) |
                UInt32.new!(ineptxfem.to_int).&(0xffff_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      ineptxfem : UInt16? = nil
    ) : Nil
      self.value = self.value.copy_with(
        ineptxfem: ineptxfem,
      )
    end
  end # struct

  # OTG_HS device each endpoint interrupt          register
  struct OTG_HS_DEACHINT
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

    # IN endpoint 1interrupt bit
    def iep1_int : Bool
      @value.bits_set?(0x2_u32)
    end

    # IN endpoint 1interrupt bit
    def self.iep1_int : Bool
      value.iep1_int
    end

    # IN endpoint 1interrupt bit
    def self.iep1_int=(value : Bool) : Bool
      self.set(iep1_int: value)
      value
    end

    # OUT endpoint 1 interrupt              bit
    def oep1_int : Bool
      @value.bits_set?(0x20000_u32)
    end

    # OUT endpoint 1 interrupt              bit
    def self.oep1_int : Bool
      value.oep1_int
    end

    # OUT endpoint 1 interrupt              bit
    def self.oep1_int=(value : Bool) : Bool
      self.set(oep1_int: value)
      value
    end

    def copy_with(
      *,

      iep1_int : Bool? = nil,

      oep1_int : Bool? = nil
    ) : self
      value = @value

      unless iep1_int.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(iep1_int.to_int).&(0x1_u32) << 1
      end

      unless oep1_int.nil?
        value = (value & 0xfffdffff_u32) |
                UInt32.new!(oep1_int.to_int).&(0x1_u32) << 17
      end

      self.class.new(value)
    end

    def self.set(
      *,
      iep1_int : Bool? = nil,
      oep1_int : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        iep1_int: iep1_int,
        oep1_int: oep1_int,
      )
    end
  end # struct

  # OTG_HS device each endpoint interrupt          register mask
  struct OTG_HS_DEACHINTMSK
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

    # IN Endpoint 1 interrupt mask              bit
    def iep1_intm : Bool
      @value.bits_set?(0x2_u32)
    end

    # IN Endpoint 1 interrupt mask              bit
    def self.iep1_intm : Bool
      value.iep1_intm
    end

    # IN Endpoint 1 interrupt mask              bit
    def self.iep1_intm=(value : Bool) : Bool
      self.set(iep1_intm: value)
      value
    end

    # OUT Endpoint 1 interrupt mask              bit
    def oep1_intm : Bool
      @value.bits_set?(0x20000_u32)
    end

    # OUT Endpoint 1 interrupt mask              bit
    def self.oep1_intm : Bool
      value.oep1_intm
    end

    # OUT Endpoint 1 interrupt mask              bit
    def self.oep1_intm=(value : Bool) : Bool
      self.set(oep1_intm: value)
      value
    end

    def copy_with(
      *,

      iep1_intm : Bool? = nil,

      oep1_intm : Bool? = nil
    ) : self
      value = @value

      unless iep1_intm.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(iep1_intm.to_int).&(0x1_u32) << 1
      end

      unless oep1_intm.nil?
        value = (value & 0xfffdffff_u32) |
                UInt32.new!(oep1_intm.to_int).&(0x1_u32) << 17
      end

      self.class.new(value)
    end

    def self.set(
      *,
      iep1_intm : Bool? = nil,
      oep1_intm : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        iep1_intm: iep1_intm,
        oep1_intm: oep1_intm,
      )
    end
  end # struct

  # OTG_HS device each in endpoint-1 interrupt          register
  struct OTG_HS_DIEPEACHMSK1
    ADDRESS = BASE_ADDRESS + 0x40_u64

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

    # Transfer completed interrupt              mask
    def xfrcm : Bool
      @value.bits_set?(0x1_u32)
    end

    # Transfer completed interrupt              mask
    def self.xfrcm : Bool
      value.xfrcm
    end

    # Transfer completed interrupt              mask
    def self.xfrcm=(value : Bool) : Bool
      self.set(xfrcm: value)
      value
    end

    # Endpoint disabled interrupt              mask
    def epdm : Bool
      @value.bits_set?(0x2_u32)
    end

    # Endpoint disabled interrupt              mask
    def self.epdm : Bool
      value.epdm
    end

    # Endpoint disabled interrupt              mask
    def self.epdm=(value : Bool) : Bool
      self.set(epdm: value)
      value
    end

    # Timeout condition mask (nonisochronous              endpoints)
    def tom : Bool
      @value.bits_set?(0x8_u32)
    end

    # Timeout condition mask (nonisochronous              endpoints)
    def self.tom : Bool
      value.tom
    end

    # Timeout condition mask (nonisochronous              endpoints)
    def self.tom=(value : Bool) : Bool
      self.set(tom: value)
      value
    end

    # IN token received when TxFIFO empty              mask
    def ittxfemsk : Bool
      @value.bits_set?(0x10_u32)
    end

    # IN token received when TxFIFO empty              mask
    def self.ittxfemsk : Bool
      value.ittxfemsk
    end

    # IN token received when TxFIFO empty              mask
    def self.ittxfemsk=(value : Bool) : Bool
      self.set(ittxfemsk: value)
      value
    end

    # IN token received with EP mismatch              mask
    def inepnmm : Bool
      @value.bits_set?(0x20_u32)
    end

    # IN token received with EP mismatch              mask
    def self.inepnmm : Bool
      value.inepnmm
    end

    # IN token received with EP mismatch              mask
    def self.inepnmm=(value : Bool) : Bool
      self.set(inepnmm: value)
      value
    end

    # IN endpoint NAK effective              mask
    def inepnem : Bool
      @value.bits_set?(0x40_u32)
    end

    # IN endpoint NAK effective              mask
    def self.inepnem : Bool
      value.inepnem
    end

    # IN endpoint NAK effective              mask
    def self.inepnem=(value : Bool) : Bool
      self.set(inepnem: value)
      value
    end

    # FIFO underrun mask
    def txfurm : Bool
      @value.bits_set?(0x100_u32)
    end

    # FIFO underrun mask
    def self.txfurm : Bool
      value.txfurm
    end

    # FIFO underrun mask
    def self.txfurm=(value : Bool) : Bool
      self.set(txfurm: value)
      value
    end

    # BNA interrupt mask
    def bim : Bool
      @value.bits_set?(0x200_u32)
    end

    # BNA interrupt mask
    def self.bim : Bool
      value.bim
    end

    # BNA interrupt mask
    def self.bim=(value : Bool) : Bool
      self.set(bim: value)
      value
    end

    # NAK interrupt mask
    def nakm : Bool
      @value.bits_set?(0x2000_u32)
    end

    # NAK interrupt mask
    def self.nakm : Bool
      value.nakm
    end

    # NAK interrupt mask
    def self.nakm=(value : Bool) : Bool
      self.set(nakm: value)
      value
    end

    def copy_with(
      *,

      xfrcm : Bool? = nil,

      epdm : Bool? = nil,

      tom : Bool? = nil,

      ittxfemsk : Bool? = nil,

      inepnmm : Bool? = nil,

      inepnem : Bool? = nil,

      txfurm : Bool? = nil,

      bim : Bool? = nil,

      nakm : Bool? = nil
    ) : self
      value = @value

      unless xfrcm.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(xfrcm.to_int).&(0x1_u32) << 0
      end

      unless epdm.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(epdm.to_int).&(0x1_u32) << 1
      end

      unless tom.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(tom.to_int).&(0x1_u32) << 3
      end

      unless ittxfemsk.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(ittxfemsk.to_int).&(0x1_u32) << 4
      end

      unless inepnmm.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(inepnmm.to_int).&(0x1_u32) << 5
      end

      unless inepnem.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(inepnem.to_int).&(0x1_u32) << 6
      end

      unless txfurm.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(txfurm.to_int).&(0x1_u32) << 8
      end

      unless bim.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(bim.to_int).&(0x1_u32) << 9
      end

      unless nakm.nil?
        value = (value & 0xffffdfff_u32) |
                UInt32.new!(nakm.to_int).&(0x1_u32) << 13
      end

      self.class.new(value)
    end

    def self.set(
      *,
      xfrcm : Bool? = nil,
      epdm : Bool? = nil,
      tom : Bool? = nil,
      ittxfemsk : Bool? = nil,
      inepnmm : Bool? = nil,
      inepnem : Bool? = nil,
      txfurm : Bool? = nil,
      bim : Bool? = nil,
      nakm : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        xfrcm: xfrcm,
        epdm: epdm,
        tom: tom,
        ittxfemsk: ittxfemsk,
        inepnmm: inepnmm,
        inepnem: inepnem,
        txfurm: txfurm,
        bim: bim,
        nakm: nakm,
      )
    end
  end # struct

  # OTG_HS device each OUT endpoint-1 interrupt          register
  struct OTG_HS_DOEPEACHMSK1
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

    # Transfer completed interrupt              mask
    def xfrcm : Bool
      @value.bits_set?(0x1_u32)
    end

    # Transfer completed interrupt              mask
    def self.xfrcm : Bool
      value.xfrcm
    end

    # Transfer completed interrupt              mask
    def self.xfrcm=(value : Bool) : Bool
      self.set(xfrcm: value)
      value
    end

    # Endpoint disabled interrupt              mask
    def epdm : Bool
      @value.bits_set?(0x2_u32)
    end

    # Endpoint disabled interrupt              mask
    def self.epdm : Bool
      value.epdm
    end

    # Endpoint disabled interrupt              mask
    def self.epdm=(value : Bool) : Bool
      self.set(epdm: value)
      value
    end

    # Timeout condition mask
    def tom : Bool
      @value.bits_set?(0x8_u32)
    end

    # Timeout condition mask
    def self.tom : Bool
      value.tom
    end

    # Timeout condition mask
    def self.tom=(value : Bool) : Bool
      self.set(tom: value)
      value
    end

    # IN token received when TxFIFO empty              mask
    def ittxfemsk : Bool
      @value.bits_set?(0x10_u32)
    end

    # IN token received when TxFIFO empty              mask
    def self.ittxfemsk : Bool
      value.ittxfemsk
    end

    # IN token received when TxFIFO empty              mask
    def self.ittxfemsk=(value : Bool) : Bool
      self.set(ittxfemsk: value)
      value
    end

    # IN token received with EP mismatch              mask
    def inepnmm : Bool
      @value.bits_set?(0x20_u32)
    end

    # IN token received with EP mismatch              mask
    def self.inepnmm : Bool
      value.inepnmm
    end

    # IN token received with EP mismatch              mask
    def self.inepnmm=(value : Bool) : Bool
      self.set(inepnmm: value)
      value
    end

    # IN endpoint NAK effective              mask
    def inepnem : Bool
      @value.bits_set?(0x40_u32)
    end

    # IN endpoint NAK effective              mask
    def self.inepnem : Bool
      value.inepnem
    end

    # IN endpoint NAK effective              mask
    def self.inepnem=(value : Bool) : Bool
      self.set(inepnem: value)
      value
    end

    # OUT packet error mask
    def txfurm : Bool
      @value.bits_set?(0x100_u32)
    end

    # OUT packet error mask
    def self.txfurm : Bool
      value.txfurm
    end

    # OUT packet error mask
    def self.txfurm=(value : Bool) : Bool
      self.set(txfurm: value)
      value
    end

    # BNA interrupt mask
    def bim : Bool
      @value.bits_set?(0x200_u32)
    end

    # BNA interrupt mask
    def self.bim : Bool
      value.bim
    end

    # BNA interrupt mask
    def self.bim=(value : Bool) : Bool
      self.set(bim: value)
      value
    end

    # Bubble error interrupt              mask
    def berrm : Bool
      @value.bits_set?(0x1000_u32)
    end

    # Bubble error interrupt              mask
    def self.berrm : Bool
      value.berrm
    end

    # Bubble error interrupt              mask
    def self.berrm=(value : Bool) : Bool
      self.set(berrm: value)
      value
    end

    # NAK interrupt mask
    def nakm : Bool
      @value.bits_set?(0x2000_u32)
    end

    # NAK interrupt mask
    def self.nakm : Bool
      value.nakm
    end

    # NAK interrupt mask
    def self.nakm=(value : Bool) : Bool
      self.set(nakm: value)
      value
    end

    # NYET interrupt mask
    def nyetm : Bool
      @value.bits_set?(0x4000_u32)
    end

    # NYET interrupt mask
    def self.nyetm : Bool
      value.nyetm
    end

    # NYET interrupt mask
    def self.nyetm=(value : Bool) : Bool
      self.set(nyetm: value)
      value
    end

    def copy_with(
      *,

      xfrcm : Bool? = nil,

      epdm : Bool? = nil,

      tom : Bool? = nil,

      ittxfemsk : Bool? = nil,

      inepnmm : Bool? = nil,

      inepnem : Bool? = nil,

      txfurm : Bool? = nil,

      bim : Bool? = nil,

      berrm : Bool? = nil,

      nakm : Bool? = nil,

      nyetm : Bool? = nil
    ) : self
      value = @value

      unless xfrcm.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(xfrcm.to_int).&(0x1_u32) << 0
      end

      unless epdm.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(epdm.to_int).&(0x1_u32) << 1
      end

      unless tom.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(tom.to_int).&(0x1_u32) << 3
      end

      unless ittxfemsk.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(ittxfemsk.to_int).&(0x1_u32) << 4
      end

      unless inepnmm.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(inepnmm.to_int).&(0x1_u32) << 5
      end

      unless inepnem.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(inepnem.to_int).&(0x1_u32) << 6
      end

      unless txfurm.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(txfurm.to_int).&(0x1_u32) << 8
      end

      unless bim.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(bim.to_int).&(0x1_u32) << 9
      end

      unless berrm.nil?
        value = (value & 0xffffefff_u32) |
                UInt32.new!(berrm.to_int).&(0x1_u32) << 12
      end

      unless nakm.nil?
        value = (value & 0xffffdfff_u32) |
                UInt32.new!(nakm.to_int).&(0x1_u32) << 13
      end

      unless nyetm.nil?
        value = (value & 0xffffbfff_u32) |
                UInt32.new!(nyetm.to_int).&(0x1_u32) << 14
      end

      self.class.new(value)
    end

    def self.set(
      *,
      xfrcm : Bool? = nil,
      epdm : Bool? = nil,
      tom : Bool? = nil,
      ittxfemsk : Bool? = nil,
      inepnmm : Bool? = nil,
      inepnem : Bool? = nil,
      txfurm : Bool? = nil,
      bim : Bool? = nil,
      berrm : Bool? = nil,
      nakm : Bool? = nil,
      nyetm : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        xfrcm: xfrcm,
        epdm: epdm,
        tom: tom,
        ittxfemsk: ittxfemsk,
        inepnmm: inepnmm,
        inepnem: inepnem,
        txfurm: txfurm,
        bim: bim,
        berrm: berrm,
        nakm: nakm,
        nyetm: nyetm,
      )
    end
  end # struct

  # OTG device endpoint-0 control          register
  struct OTG_HS_DIEPCTL0
    ADDRESS = BASE_ADDRESS + 0x100_u64

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

    # Maximum packet size
    def mpsiz : UInt16
      UInt16.new!((@value >> 0) & 0x7ff_u32)
    end

    # Maximum packet size
    def self.mpsiz : UInt16
      value.mpsiz
    end

    # Maximum packet size
    def self.mpsiz=(value : UInt16) : UInt16
      self.set(mpsiz: value)
      value
    end

    # USB active endpoint
    def usbaep : Bool
      @value.bits_set?(0x8000_u32)
    end

    # USB active endpoint
    def self.usbaep : Bool
      value.usbaep
    end

    # USB active endpoint
    def self.usbaep=(value : Bool) : Bool
      self.set(usbaep: value)
      value
    end

    # Even/odd frame
    def eonum_dpid : Bool
      @value.bits_set?(0x10000_u32)
    end

    # Even/odd frame
    def self.eonum_dpid : Bool
      value.eonum_dpid
    end

    # NAK status
    def naksts : Bool
      @value.bits_set?(0x20000_u32)
    end

    # NAK status
    def self.naksts : Bool
      value.naksts
    end

    # Endpoint type
    def eptyp : UInt8
      UInt8.new!((@value >> 18) & 0x3_u32)
    end

    # Endpoint type
    def self.eptyp : UInt8
      value.eptyp
    end

    # Endpoint type
    def self.eptyp=(value : UInt8) : UInt8
      self.set(eptyp: value)
      value
    end

    # STALL handshake
    def stall : Bool
      @value.bits_set?(0x200000_u32)
    end

    # STALL handshake
    def self.stall : Bool
      value.stall
    end

    # STALL handshake
    def self.stall=(value : Bool) : Bool
      self.set(stall: value)
      value
    end

    # TxFIFO number
    def txfnum : UInt8
      UInt8.new!((@value >> 22) & 0xf_u32)
    end

    # TxFIFO number
    def self.txfnum : UInt8
      value.txfnum
    end

    # TxFIFO number
    def self.txfnum=(value : UInt8) : UInt8
      self.set(txfnum: value)
      value
    end

    # Clear NAK
    def self.cnak=(value : Bool) : Bool
      self.set(cnak: value)
      value
    end

    # Set NAK
    def self.snak=(value : Bool) : Bool
      self.set(snak: value)
      value
    end

    # Set DATA0 PID
    def self.sd0_pid_sevnfrm=(value : Bool) : Bool
      self.set(sd0_pid_sevnfrm: value)
      value
    end

    # Set odd frame
    def self.soddfrm=(value : Bool) : Bool
      self.set(soddfrm: value)
      value
    end

    # Endpoint disable
    def epdis : Bool
      @value.bits_set?(0x40000000_u32)
    end

    # Endpoint disable
    def self.epdis : Bool
      value.epdis
    end

    # Endpoint disable
    def self.epdis=(value : Bool) : Bool
      self.set(epdis: value)
      value
    end

    # Endpoint enable
    def epena : Bool
      @value.bits_set?(0x80000000_u32)
    end

    # Endpoint enable
    def self.epena : Bool
      value.epena
    end

    # Endpoint enable
    def self.epena=(value : Bool) : Bool
      self.set(epena: value)
      value
    end

    def copy_with(
      *,

      mpsiz : UInt16? = nil,

      usbaep : Bool? = nil,

      eptyp : UInt8? = nil,

      stall : Bool? = nil,

      txfnum : UInt8? = nil,

      cnak : Bool? = nil,

      snak : Bool? = nil,

      sd0_pid_sevnfrm : Bool? = nil,

      soddfrm : Bool? = nil,

      epdis : Bool? = nil,

      epena : Bool? = nil
    ) : self
      value = @value

      unless mpsiz.nil?
        value = (value & 0xfffff800_u32) |
                UInt32.new!(mpsiz.to_int).&(0x7ff_u32) << 0
      end

      unless usbaep.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(usbaep.to_int).&(0x1_u32) << 15
      end

      unless eptyp.nil?
        value = (value & 0xfff3ffff_u32) |
                UInt32.new!(eptyp.to_int).&(0x3_u32) << 18
      end

      unless stall.nil?
        value = (value & 0xffdfffff_u32) |
                UInt32.new!(stall.to_int).&(0x1_u32) << 21
      end

      unless txfnum.nil?
        value = (value & 0xfc3fffff_u32) |
                UInt32.new!(txfnum.to_int).&(0xf_u32) << 22
      end

      unless cnak.nil?
        value = (value & 0xfbffffff_u32) |
                UInt32.new!(cnak.to_int).&(0x1_u32) << 26
      end

      unless snak.nil?
        value = (value & 0xf7ffffff_u32) |
                UInt32.new!(snak.to_int).&(0x1_u32) << 27
      end

      unless sd0_pid_sevnfrm.nil?
        value = (value & 0xefffffff_u32) |
                UInt32.new!(sd0_pid_sevnfrm.to_int).&(0x1_u32) << 28
      end

      unless soddfrm.nil?
        value = (value & 0xdfffffff_u32) |
                UInt32.new!(soddfrm.to_int).&(0x1_u32) << 29
      end

      unless epdis.nil?
        value = (value & 0xbfffffff_u32) |
                UInt32.new!(epdis.to_int).&(0x1_u32) << 30
      end

      unless epena.nil?
        value = (value & 0x7fffffff_u32) |
                UInt32.new!(epena.to_int).&(0x1_u32) << 31
      end

      self.class.new(value)
    end

    def self.set(
      *,
      mpsiz : UInt16? = nil,
      usbaep : Bool? = nil,
      eptyp : UInt8? = nil,
      stall : Bool? = nil,
      txfnum : UInt8? = nil,
      cnak : Bool? = nil,
      snak : Bool? = nil,
      sd0_pid_sevnfrm : Bool? = nil,
      soddfrm : Bool? = nil,
      epdis : Bool? = nil,
      epena : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        mpsiz: mpsiz,
        usbaep: usbaep,
        eptyp: eptyp,
        stall: stall,
        txfnum: txfnum,
        cnak: cnak,
        snak: snak,
        sd0_pid_sevnfrm: sd0_pid_sevnfrm,
        soddfrm: soddfrm,
        epdis: epdis,
        epena: epena,
      )
    end
  end # struct

  # OTG device endpoint-1 control          register
  struct OTG_HS_DIEPCTL1
    ADDRESS = BASE_ADDRESS + 0x120_u64

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

    # Maximum packet size
    def mpsiz : UInt16
      UInt16.new!((@value >> 0) & 0x7ff_u32)
    end

    # Maximum packet size
    def self.mpsiz : UInt16
      value.mpsiz
    end

    # Maximum packet size
    def self.mpsiz=(value : UInt16) : UInt16
      self.set(mpsiz: value)
      value
    end

    # USB active endpoint
    def usbaep : Bool
      @value.bits_set?(0x8000_u32)
    end

    # USB active endpoint
    def self.usbaep : Bool
      value.usbaep
    end

    # USB active endpoint
    def self.usbaep=(value : Bool) : Bool
      self.set(usbaep: value)
      value
    end

    # Even/odd frame
    def eonum_dpid : Bool
      @value.bits_set?(0x10000_u32)
    end

    # Even/odd frame
    def self.eonum_dpid : Bool
      value.eonum_dpid
    end

    # NAK status
    def naksts : Bool
      @value.bits_set?(0x20000_u32)
    end

    # NAK status
    def self.naksts : Bool
      value.naksts
    end

    # Endpoint type
    def eptyp : UInt8
      UInt8.new!((@value >> 18) & 0x3_u32)
    end

    # Endpoint type
    def self.eptyp : UInt8
      value.eptyp
    end

    # Endpoint type
    def self.eptyp=(value : UInt8) : UInt8
      self.set(eptyp: value)
      value
    end

    # STALL handshake
    def stall : Bool
      @value.bits_set?(0x200000_u32)
    end

    # STALL handshake
    def self.stall : Bool
      value.stall
    end

    # STALL handshake
    def self.stall=(value : Bool) : Bool
      self.set(stall: value)
      value
    end

    # TxFIFO number
    def txfnum : UInt8
      UInt8.new!((@value >> 22) & 0xf_u32)
    end

    # TxFIFO number
    def self.txfnum : UInt8
      value.txfnum
    end

    # TxFIFO number
    def self.txfnum=(value : UInt8) : UInt8
      self.set(txfnum: value)
      value
    end

    # Clear NAK
    def self.cnak=(value : Bool) : Bool
      self.set(cnak: value)
      value
    end

    # Set NAK
    def self.snak=(value : Bool) : Bool
      self.set(snak: value)
      value
    end

    # Set DATA0 PID
    def self.sd0_pid_sevnfrm=(value : Bool) : Bool
      self.set(sd0_pid_sevnfrm: value)
      value
    end

    # Set odd frame
    def self.soddfrm=(value : Bool) : Bool
      self.set(soddfrm: value)
      value
    end

    # Endpoint disable
    def epdis : Bool
      @value.bits_set?(0x40000000_u32)
    end

    # Endpoint disable
    def self.epdis : Bool
      value.epdis
    end

    # Endpoint disable
    def self.epdis=(value : Bool) : Bool
      self.set(epdis: value)
      value
    end

    # Endpoint enable
    def epena : Bool
      @value.bits_set?(0x80000000_u32)
    end

    # Endpoint enable
    def self.epena : Bool
      value.epena
    end

    # Endpoint enable
    def self.epena=(value : Bool) : Bool
      self.set(epena: value)
      value
    end

    def copy_with(
      *,

      mpsiz : UInt16? = nil,

      usbaep : Bool? = nil,

      eptyp : UInt8? = nil,

      stall : Bool? = nil,

      txfnum : UInt8? = nil,

      cnak : Bool? = nil,

      snak : Bool? = nil,

      sd0_pid_sevnfrm : Bool? = nil,

      soddfrm : Bool? = nil,

      epdis : Bool? = nil,

      epena : Bool? = nil
    ) : self
      value = @value

      unless mpsiz.nil?
        value = (value & 0xfffff800_u32) |
                UInt32.new!(mpsiz.to_int).&(0x7ff_u32) << 0
      end

      unless usbaep.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(usbaep.to_int).&(0x1_u32) << 15
      end

      unless eptyp.nil?
        value = (value & 0xfff3ffff_u32) |
                UInt32.new!(eptyp.to_int).&(0x3_u32) << 18
      end

      unless stall.nil?
        value = (value & 0xffdfffff_u32) |
                UInt32.new!(stall.to_int).&(0x1_u32) << 21
      end

      unless txfnum.nil?
        value = (value & 0xfc3fffff_u32) |
                UInt32.new!(txfnum.to_int).&(0xf_u32) << 22
      end

      unless cnak.nil?
        value = (value & 0xfbffffff_u32) |
                UInt32.new!(cnak.to_int).&(0x1_u32) << 26
      end

      unless snak.nil?
        value = (value & 0xf7ffffff_u32) |
                UInt32.new!(snak.to_int).&(0x1_u32) << 27
      end

      unless sd0_pid_sevnfrm.nil?
        value = (value & 0xefffffff_u32) |
                UInt32.new!(sd0_pid_sevnfrm.to_int).&(0x1_u32) << 28
      end

      unless soddfrm.nil?
        value = (value & 0xdfffffff_u32) |
                UInt32.new!(soddfrm.to_int).&(0x1_u32) << 29
      end

      unless epdis.nil?
        value = (value & 0xbfffffff_u32) |
                UInt32.new!(epdis.to_int).&(0x1_u32) << 30
      end

      unless epena.nil?
        value = (value & 0x7fffffff_u32) |
                UInt32.new!(epena.to_int).&(0x1_u32) << 31
      end

      self.class.new(value)
    end

    def self.set(
      *,
      mpsiz : UInt16? = nil,
      usbaep : Bool? = nil,
      eptyp : UInt8? = nil,
      stall : Bool? = nil,
      txfnum : UInt8? = nil,
      cnak : Bool? = nil,
      snak : Bool? = nil,
      sd0_pid_sevnfrm : Bool? = nil,
      soddfrm : Bool? = nil,
      epdis : Bool? = nil,
      epena : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        mpsiz: mpsiz,
        usbaep: usbaep,
        eptyp: eptyp,
        stall: stall,
        txfnum: txfnum,
        cnak: cnak,
        snak: snak,
        sd0_pid_sevnfrm: sd0_pid_sevnfrm,
        soddfrm: soddfrm,
        epdis: epdis,
        epena: epena,
      )
    end
  end # struct

  # OTG device endpoint-2 control          register
  struct OTG_HS_DIEPCTL2
    ADDRESS = BASE_ADDRESS + 0x140_u64

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

    # Maximum packet size
    def mpsiz : UInt16
      UInt16.new!((@value >> 0) & 0x7ff_u32)
    end

    # Maximum packet size
    def self.mpsiz : UInt16
      value.mpsiz
    end

    # Maximum packet size
    def self.mpsiz=(value : UInt16) : UInt16
      self.set(mpsiz: value)
      value
    end

    # USB active endpoint
    def usbaep : Bool
      @value.bits_set?(0x8000_u32)
    end

    # USB active endpoint
    def self.usbaep : Bool
      value.usbaep
    end

    # USB active endpoint
    def self.usbaep=(value : Bool) : Bool
      self.set(usbaep: value)
      value
    end

    # Even/odd frame
    def eonum_dpid : Bool
      @value.bits_set?(0x10000_u32)
    end

    # Even/odd frame
    def self.eonum_dpid : Bool
      value.eonum_dpid
    end

    # NAK status
    def naksts : Bool
      @value.bits_set?(0x20000_u32)
    end

    # NAK status
    def self.naksts : Bool
      value.naksts
    end

    # Endpoint type
    def eptyp : UInt8
      UInt8.new!((@value >> 18) & 0x3_u32)
    end

    # Endpoint type
    def self.eptyp : UInt8
      value.eptyp
    end

    # Endpoint type
    def self.eptyp=(value : UInt8) : UInt8
      self.set(eptyp: value)
      value
    end

    # STALL handshake
    def stall : Bool
      @value.bits_set?(0x200000_u32)
    end

    # STALL handshake
    def self.stall : Bool
      value.stall
    end

    # STALL handshake
    def self.stall=(value : Bool) : Bool
      self.set(stall: value)
      value
    end

    # TxFIFO number
    def txfnum : UInt8
      UInt8.new!((@value >> 22) & 0xf_u32)
    end

    # TxFIFO number
    def self.txfnum : UInt8
      value.txfnum
    end

    # TxFIFO number
    def self.txfnum=(value : UInt8) : UInt8
      self.set(txfnum: value)
      value
    end

    # Clear NAK
    def self.cnak=(value : Bool) : Bool
      self.set(cnak: value)
      value
    end

    # Set NAK
    def self.snak=(value : Bool) : Bool
      self.set(snak: value)
      value
    end

    # Set DATA0 PID
    def self.sd0_pid_sevnfrm=(value : Bool) : Bool
      self.set(sd0_pid_sevnfrm: value)
      value
    end

    # Set odd frame
    def self.soddfrm=(value : Bool) : Bool
      self.set(soddfrm: value)
      value
    end

    # Endpoint disable
    def epdis : Bool
      @value.bits_set?(0x40000000_u32)
    end

    # Endpoint disable
    def self.epdis : Bool
      value.epdis
    end

    # Endpoint disable
    def self.epdis=(value : Bool) : Bool
      self.set(epdis: value)
      value
    end

    # Endpoint enable
    def epena : Bool
      @value.bits_set?(0x80000000_u32)
    end

    # Endpoint enable
    def self.epena : Bool
      value.epena
    end

    # Endpoint enable
    def self.epena=(value : Bool) : Bool
      self.set(epena: value)
      value
    end

    def copy_with(
      *,

      mpsiz : UInt16? = nil,

      usbaep : Bool? = nil,

      eptyp : UInt8? = nil,

      stall : Bool? = nil,

      txfnum : UInt8? = nil,

      cnak : Bool? = nil,

      snak : Bool? = nil,

      sd0_pid_sevnfrm : Bool? = nil,

      soddfrm : Bool? = nil,

      epdis : Bool? = nil,

      epena : Bool? = nil
    ) : self
      value = @value

      unless mpsiz.nil?
        value = (value & 0xfffff800_u32) |
                UInt32.new!(mpsiz.to_int).&(0x7ff_u32) << 0
      end

      unless usbaep.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(usbaep.to_int).&(0x1_u32) << 15
      end

      unless eptyp.nil?
        value = (value & 0xfff3ffff_u32) |
                UInt32.new!(eptyp.to_int).&(0x3_u32) << 18
      end

      unless stall.nil?
        value = (value & 0xffdfffff_u32) |
                UInt32.new!(stall.to_int).&(0x1_u32) << 21
      end

      unless txfnum.nil?
        value = (value & 0xfc3fffff_u32) |
                UInt32.new!(txfnum.to_int).&(0xf_u32) << 22
      end

      unless cnak.nil?
        value = (value & 0xfbffffff_u32) |
                UInt32.new!(cnak.to_int).&(0x1_u32) << 26
      end

      unless snak.nil?
        value = (value & 0xf7ffffff_u32) |
                UInt32.new!(snak.to_int).&(0x1_u32) << 27
      end

      unless sd0_pid_sevnfrm.nil?
        value = (value & 0xefffffff_u32) |
                UInt32.new!(sd0_pid_sevnfrm.to_int).&(0x1_u32) << 28
      end

      unless soddfrm.nil?
        value = (value & 0xdfffffff_u32) |
                UInt32.new!(soddfrm.to_int).&(0x1_u32) << 29
      end

      unless epdis.nil?
        value = (value & 0xbfffffff_u32) |
                UInt32.new!(epdis.to_int).&(0x1_u32) << 30
      end

      unless epena.nil?
        value = (value & 0x7fffffff_u32) |
                UInt32.new!(epena.to_int).&(0x1_u32) << 31
      end

      self.class.new(value)
    end

    def self.set(
      *,
      mpsiz : UInt16? = nil,
      usbaep : Bool? = nil,
      eptyp : UInt8? = nil,
      stall : Bool? = nil,
      txfnum : UInt8? = nil,
      cnak : Bool? = nil,
      snak : Bool? = nil,
      sd0_pid_sevnfrm : Bool? = nil,
      soddfrm : Bool? = nil,
      epdis : Bool? = nil,
      epena : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        mpsiz: mpsiz,
        usbaep: usbaep,
        eptyp: eptyp,
        stall: stall,
        txfnum: txfnum,
        cnak: cnak,
        snak: snak,
        sd0_pid_sevnfrm: sd0_pid_sevnfrm,
        soddfrm: soddfrm,
        epdis: epdis,
        epena: epena,
      )
    end
  end # struct

  # OTG device endpoint-3 control          register
  struct OTG_HS_DIEPCTL3
    ADDRESS = BASE_ADDRESS + 0x160_u64

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

    # Maximum packet size
    def mpsiz : UInt16
      UInt16.new!((@value >> 0) & 0x7ff_u32)
    end

    # Maximum packet size
    def self.mpsiz : UInt16
      value.mpsiz
    end

    # Maximum packet size
    def self.mpsiz=(value : UInt16) : UInt16
      self.set(mpsiz: value)
      value
    end

    # USB active endpoint
    def usbaep : Bool
      @value.bits_set?(0x8000_u32)
    end

    # USB active endpoint
    def self.usbaep : Bool
      value.usbaep
    end

    # USB active endpoint
    def self.usbaep=(value : Bool) : Bool
      self.set(usbaep: value)
      value
    end

    # Even/odd frame
    def eonum_dpid : Bool
      @value.bits_set?(0x10000_u32)
    end

    # Even/odd frame
    def self.eonum_dpid : Bool
      value.eonum_dpid
    end

    # NAK status
    def naksts : Bool
      @value.bits_set?(0x20000_u32)
    end

    # NAK status
    def self.naksts : Bool
      value.naksts
    end

    # Endpoint type
    def eptyp : UInt8
      UInt8.new!((@value >> 18) & 0x3_u32)
    end

    # Endpoint type
    def self.eptyp : UInt8
      value.eptyp
    end

    # Endpoint type
    def self.eptyp=(value : UInt8) : UInt8
      self.set(eptyp: value)
      value
    end

    # STALL handshake
    def stall : Bool
      @value.bits_set?(0x200000_u32)
    end

    # STALL handshake
    def self.stall : Bool
      value.stall
    end

    # STALL handshake
    def self.stall=(value : Bool) : Bool
      self.set(stall: value)
      value
    end

    # TxFIFO number
    def txfnum : UInt8
      UInt8.new!((@value >> 22) & 0xf_u32)
    end

    # TxFIFO number
    def self.txfnum : UInt8
      value.txfnum
    end

    # TxFIFO number
    def self.txfnum=(value : UInt8) : UInt8
      self.set(txfnum: value)
      value
    end

    # Clear NAK
    def self.cnak=(value : Bool) : Bool
      self.set(cnak: value)
      value
    end

    # Set NAK
    def self.snak=(value : Bool) : Bool
      self.set(snak: value)
      value
    end

    # Set DATA0 PID
    def self.sd0_pid_sevnfrm=(value : Bool) : Bool
      self.set(sd0_pid_sevnfrm: value)
      value
    end

    # Set odd frame
    def self.soddfrm=(value : Bool) : Bool
      self.set(soddfrm: value)
      value
    end

    # Endpoint disable
    def epdis : Bool
      @value.bits_set?(0x40000000_u32)
    end

    # Endpoint disable
    def self.epdis : Bool
      value.epdis
    end

    # Endpoint disable
    def self.epdis=(value : Bool) : Bool
      self.set(epdis: value)
      value
    end

    # Endpoint enable
    def epena : Bool
      @value.bits_set?(0x80000000_u32)
    end

    # Endpoint enable
    def self.epena : Bool
      value.epena
    end

    # Endpoint enable
    def self.epena=(value : Bool) : Bool
      self.set(epena: value)
      value
    end

    def copy_with(
      *,

      mpsiz : UInt16? = nil,

      usbaep : Bool? = nil,

      eptyp : UInt8? = nil,

      stall : Bool? = nil,

      txfnum : UInt8? = nil,

      cnak : Bool? = nil,

      snak : Bool? = nil,

      sd0_pid_sevnfrm : Bool? = nil,

      soddfrm : Bool? = nil,

      epdis : Bool? = nil,

      epena : Bool? = nil
    ) : self
      value = @value

      unless mpsiz.nil?
        value = (value & 0xfffff800_u32) |
                UInt32.new!(mpsiz.to_int).&(0x7ff_u32) << 0
      end

      unless usbaep.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(usbaep.to_int).&(0x1_u32) << 15
      end

      unless eptyp.nil?
        value = (value & 0xfff3ffff_u32) |
                UInt32.new!(eptyp.to_int).&(0x3_u32) << 18
      end

      unless stall.nil?
        value = (value & 0xffdfffff_u32) |
                UInt32.new!(stall.to_int).&(0x1_u32) << 21
      end

      unless txfnum.nil?
        value = (value & 0xfc3fffff_u32) |
                UInt32.new!(txfnum.to_int).&(0xf_u32) << 22
      end

      unless cnak.nil?
        value = (value & 0xfbffffff_u32) |
                UInt32.new!(cnak.to_int).&(0x1_u32) << 26
      end

      unless snak.nil?
        value = (value & 0xf7ffffff_u32) |
                UInt32.new!(snak.to_int).&(0x1_u32) << 27
      end

      unless sd0_pid_sevnfrm.nil?
        value = (value & 0xefffffff_u32) |
                UInt32.new!(sd0_pid_sevnfrm.to_int).&(0x1_u32) << 28
      end

      unless soddfrm.nil?
        value = (value & 0xdfffffff_u32) |
                UInt32.new!(soddfrm.to_int).&(0x1_u32) << 29
      end

      unless epdis.nil?
        value = (value & 0xbfffffff_u32) |
                UInt32.new!(epdis.to_int).&(0x1_u32) << 30
      end

      unless epena.nil?
        value = (value & 0x7fffffff_u32) |
                UInt32.new!(epena.to_int).&(0x1_u32) << 31
      end

      self.class.new(value)
    end

    def self.set(
      *,
      mpsiz : UInt16? = nil,
      usbaep : Bool? = nil,
      eptyp : UInt8? = nil,
      stall : Bool? = nil,
      txfnum : UInt8? = nil,
      cnak : Bool? = nil,
      snak : Bool? = nil,
      sd0_pid_sevnfrm : Bool? = nil,
      soddfrm : Bool? = nil,
      epdis : Bool? = nil,
      epena : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        mpsiz: mpsiz,
        usbaep: usbaep,
        eptyp: eptyp,
        stall: stall,
        txfnum: txfnum,
        cnak: cnak,
        snak: snak,
        sd0_pid_sevnfrm: sd0_pid_sevnfrm,
        soddfrm: soddfrm,
        epdis: epdis,
        epena: epena,
      )
    end
  end # struct

  # OTG device endpoint-4 control          register
  struct OTG_HS_DIEPCTL4
    ADDRESS = BASE_ADDRESS + 0x180_u64

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

    # Maximum packet size
    def mpsiz : UInt16
      UInt16.new!((@value >> 0) & 0x7ff_u32)
    end

    # Maximum packet size
    def self.mpsiz : UInt16
      value.mpsiz
    end

    # Maximum packet size
    def self.mpsiz=(value : UInt16) : UInt16
      self.set(mpsiz: value)
      value
    end

    # USB active endpoint
    def usbaep : Bool
      @value.bits_set?(0x8000_u32)
    end

    # USB active endpoint
    def self.usbaep : Bool
      value.usbaep
    end

    # USB active endpoint
    def self.usbaep=(value : Bool) : Bool
      self.set(usbaep: value)
      value
    end

    # Even/odd frame
    def eonum_dpid : Bool
      @value.bits_set?(0x10000_u32)
    end

    # Even/odd frame
    def self.eonum_dpid : Bool
      value.eonum_dpid
    end

    # NAK status
    def naksts : Bool
      @value.bits_set?(0x20000_u32)
    end

    # NAK status
    def self.naksts : Bool
      value.naksts
    end

    # Endpoint type
    def eptyp : UInt8
      UInt8.new!((@value >> 18) & 0x3_u32)
    end

    # Endpoint type
    def self.eptyp : UInt8
      value.eptyp
    end

    # Endpoint type
    def self.eptyp=(value : UInt8) : UInt8
      self.set(eptyp: value)
      value
    end

    # STALL handshake
    def stall : Bool
      @value.bits_set?(0x200000_u32)
    end

    # STALL handshake
    def self.stall : Bool
      value.stall
    end

    # STALL handshake
    def self.stall=(value : Bool) : Bool
      self.set(stall: value)
      value
    end

    # TxFIFO number
    def txfnum : UInt8
      UInt8.new!((@value >> 22) & 0xf_u32)
    end

    # TxFIFO number
    def self.txfnum : UInt8
      value.txfnum
    end

    # TxFIFO number
    def self.txfnum=(value : UInt8) : UInt8
      self.set(txfnum: value)
      value
    end

    # Clear NAK
    def self.cnak=(value : Bool) : Bool
      self.set(cnak: value)
      value
    end

    # Set NAK
    def self.snak=(value : Bool) : Bool
      self.set(snak: value)
      value
    end

    # Set DATA0 PID
    def self.sd0_pid_sevnfrm=(value : Bool) : Bool
      self.set(sd0_pid_sevnfrm: value)
      value
    end

    # Set odd frame
    def self.soddfrm=(value : Bool) : Bool
      self.set(soddfrm: value)
      value
    end

    # Endpoint disable
    def epdis : Bool
      @value.bits_set?(0x40000000_u32)
    end

    # Endpoint disable
    def self.epdis : Bool
      value.epdis
    end

    # Endpoint disable
    def self.epdis=(value : Bool) : Bool
      self.set(epdis: value)
      value
    end

    # Endpoint enable
    def epena : Bool
      @value.bits_set?(0x80000000_u32)
    end

    # Endpoint enable
    def self.epena : Bool
      value.epena
    end

    # Endpoint enable
    def self.epena=(value : Bool) : Bool
      self.set(epena: value)
      value
    end

    def copy_with(
      *,

      mpsiz : UInt16? = nil,

      usbaep : Bool? = nil,

      eptyp : UInt8? = nil,

      stall : Bool? = nil,

      txfnum : UInt8? = nil,

      cnak : Bool? = nil,

      snak : Bool? = nil,

      sd0_pid_sevnfrm : Bool? = nil,

      soddfrm : Bool? = nil,

      epdis : Bool? = nil,

      epena : Bool? = nil
    ) : self
      value = @value

      unless mpsiz.nil?
        value = (value & 0xfffff800_u32) |
                UInt32.new!(mpsiz.to_int).&(0x7ff_u32) << 0
      end

      unless usbaep.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(usbaep.to_int).&(0x1_u32) << 15
      end

      unless eptyp.nil?
        value = (value & 0xfff3ffff_u32) |
                UInt32.new!(eptyp.to_int).&(0x3_u32) << 18
      end

      unless stall.nil?
        value = (value & 0xffdfffff_u32) |
                UInt32.new!(stall.to_int).&(0x1_u32) << 21
      end

      unless txfnum.nil?
        value = (value & 0xfc3fffff_u32) |
                UInt32.new!(txfnum.to_int).&(0xf_u32) << 22
      end

      unless cnak.nil?
        value = (value & 0xfbffffff_u32) |
                UInt32.new!(cnak.to_int).&(0x1_u32) << 26
      end

      unless snak.nil?
        value = (value & 0xf7ffffff_u32) |
                UInt32.new!(snak.to_int).&(0x1_u32) << 27
      end

      unless sd0_pid_sevnfrm.nil?
        value = (value & 0xefffffff_u32) |
                UInt32.new!(sd0_pid_sevnfrm.to_int).&(0x1_u32) << 28
      end

      unless soddfrm.nil?
        value = (value & 0xdfffffff_u32) |
                UInt32.new!(soddfrm.to_int).&(0x1_u32) << 29
      end

      unless epdis.nil?
        value = (value & 0xbfffffff_u32) |
                UInt32.new!(epdis.to_int).&(0x1_u32) << 30
      end

      unless epena.nil?
        value = (value & 0x7fffffff_u32) |
                UInt32.new!(epena.to_int).&(0x1_u32) << 31
      end

      self.class.new(value)
    end

    def self.set(
      *,
      mpsiz : UInt16? = nil,
      usbaep : Bool? = nil,
      eptyp : UInt8? = nil,
      stall : Bool? = nil,
      txfnum : UInt8? = nil,
      cnak : Bool? = nil,
      snak : Bool? = nil,
      sd0_pid_sevnfrm : Bool? = nil,
      soddfrm : Bool? = nil,
      epdis : Bool? = nil,
      epena : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        mpsiz: mpsiz,
        usbaep: usbaep,
        eptyp: eptyp,
        stall: stall,
        txfnum: txfnum,
        cnak: cnak,
        snak: snak,
        sd0_pid_sevnfrm: sd0_pid_sevnfrm,
        soddfrm: soddfrm,
        epdis: epdis,
        epena: epena,
      )
    end
  end # struct

  # OTG device endpoint-5 control          register
  struct OTG_HS_DIEPCTL5
    ADDRESS = BASE_ADDRESS + 0x1a0_u64

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

    # Maximum packet size
    def mpsiz : UInt16
      UInt16.new!((@value >> 0) & 0x7ff_u32)
    end

    # Maximum packet size
    def self.mpsiz : UInt16
      value.mpsiz
    end

    # Maximum packet size
    def self.mpsiz=(value : UInt16) : UInt16
      self.set(mpsiz: value)
      value
    end

    # USB active endpoint
    def usbaep : Bool
      @value.bits_set?(0x8000_u32)
    end

    # USB active endpoint
    def self.usbaep : Bool
      value.usbaep
    end

    # USB active endpoint
    def self.usbaep=(value : Bool) : Bool
      self.set(usbaep: value)
      value
    end

    # Even/odd frame
    def eonum_dpid : Bool
      @value.bits_set?(0x10000_u32)
    end

    # Even/odd frame
    def self.eonum_dpid : Bool
      value.eonum_dpid
    end

    # NAK status
    def naksts : Bool
      @value.bits_set?(0x20000_u32)
    end

    # NAK status
    def self.naksts : Bool
      value.naksts
    end

    # Endpoint type
    def eptyp : UInt8
      UInt8.new!((@value >> 18) & 0x3_u32)
    end

    # Endpoint type
    def self.eptyp : UInt8
      value.eptyp
    end

    # Endpoint type
    def self.eptyp=(value : UInt8) : UInt8
      self.set(eptyp: value)
      value
    end

    # STALL handshake
    def stall : Bool
      @value.bits_set?(0x200000_u32)
    end

    # STALL handshake
    def self.stall : Bool
      value.stall
    end

    # STALL handshake
    def self.stall=(value : Bool) : Bool
      self.set(stall: value)
      value
    end

    # TxFIFO number
    def txfnum : UInt8
      UInt8.new!((@value >> 22) & 0xf_u32)
    end

    # TxFIFO number
    def self.txfnum : UInt8
      value.txfnum
    end

    # TxFIFO number
    def self.txfnum=(value : UInt8) : UInt8
      self.set(txfnum: value)
      value
    end

    # Clear NAK
    def self.cnak=(value : Bool) : Bool
      self.set(cnak: value)
      value
    end

    # Set NAK
    def self.snak=(value : Bool) : Bool
      self.set(snak: value)
      value
    end

    # Set DATA0 PID
    def self.sd0_pid_sevnfrm=(value : Bool) : Bool
      self.set(sd0_pid_sevnfrm: value)
      value
    end

    # Set odd frame
    def self.soddfrm=(value : Bool) : Bool
      self.set(soddfrm: value)
      value
    end

    # Endpoint disable
    def epdis : Bool
      @value.bits_set?(0x40000000_u32)
    end

    # Endpoint disable
    def self.epdis : Bool
      value.epdis
    end

    # Endpoint disable
    def self.epdis=(value : Bool) : Bool
      self.set(epdis: value)
      value
    end

    # Endpoint enable
    def epena : Bool
      @value.bits_set?(0x80000000_u32)
    end

    # Endpoint enable
    def self.epena : Bool
      value.epena
    end

    # Endpoint enable
    def self.epena=(value : Bool) : Bool
      self.set(epena: value)
      value
    end

    def copy_with(
      *,

      mpsiz : UInt16? = nil,

      usbaep : Bool? = nil,

      eptyp : UInt8? = nil,

      stall : Bool? = nil,

      txfnum : UInt8? = nil,

      cnak : Bool? = nil,

      snak : Bool? = nil,

      sd0_pid_sevnfrm : Bool? = nil,

      soddfrm : Bool? = nil,

      epdis : Bool? = nil,

      epena : Bool? = nil
    ) : self
      value = @value

      unless mpsiz.nil?
        value = (value & 0xfffff800_u32) |
                UInt32.new!(mpsiz.to_int).&(0x7ff_u32) << 0
      end

      unless usbaep.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(usbaep.to_int).&(0x1_u32) << 15
      end

      unless eptyp.nil?
        value = (value & 0xfff3ffff_u32) |
                UInt32.new!(eptyp.to_int).&(0x3_u32) << 18
      end

      unless stall.nil?
        value = (value & 0xffdfffff_u32) |
                UInt32.new!(stall.to_int).&(0x1_u32) << 21
      end

      unless txfnum.nil?
        value = (value & 0xfc3fffff_u32) |
                UInt32.new!(txfnum.to_int).&(0xf_u32) << 22
      end

      unless cnak.nil?
        value = (value & 0xfbffffff_u32) |
                UInt32.new!(cnak.to_int).&(0x1_u32) << 26
      end

      unless snak.nil?
        value = (value & 0xf7ffffff_u32) |
                UInt32.new!(snak.to_int).&(0x1_u32) << 27
      end

      unless sd0_pid_sevnfrm.nil?
        value = (value & 0xefffffff_u32) |
                UInt32.new!(sd0_pid_sevnfrm.to_int).&(0x1_u32) << 28
      end

      unless soddfrm.nil?
        value = (value & 0xdfffffff_u32) |
                UInt32.new!(soddfrm.to_int).&(0x1_u32) << 29
      end

      unless epdis.nil?
        value = (value & 0xbfffffff_u32) |
                UInt32.new!(epdis.to_int).&(0x1_u32) << 30
      end

      unless epena.nil?
        value = (value & 0x7fffffff_u32) |
                UInt32.new!(epena.to_int).&(0x1_u32) << 31
      end

      self.class.new(value)
    end

    def self.set(
      *,
      mpsiz : UInt16? = nil,
      usbaep : Bool? = nil,
      eptyp : UInt8? = nil,
      stall : Bool? = nil,
      txfnum : UInt8? = nil,
      cnak : Bool? = nil,
      snak : Bool? = nil,
      sd0_pid_sevnfrm : Bool? = nil,
      soddfrm : Bool? = nil,
      epdis : Bool? = nil,
      epena : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        mpsiz: mpsiz,
        usbaep: usbaep,
        eptyp: eptyp,
        stall: stall,
        txfnum: txfnum,
        cnak: cnak,
        snak: snak,
        sd0_pid_sevnfrm: sd0_pid_sevnfrm,
        soddfrm: soddfrm,
        epdis: epdis,
        epena: epena,
      )
    end
  end # struct

  # OTG device endpoint-6 control          register
  struct OTG_HS_DIEPCTL6
    ADDRESS = BASE_ADDRESS + 0x1c0_u64

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

    # Maximum packet size
    def mpsiz : UInt16
      UInt16.new!((@value >> 0) & 0x7ff_u32)
    end

    # Maximum packet size
    def self.mpsiz : UInt16
      value.mpsiz
    end

    # Maximum packet size
    def self.mpsiz=(value : UInt16) : UInt16
      self.set(mpsiz: value)
      value
    end

    # USB active endpoint
    def usbaep : Bool
      @value.bits_set?(0x8000_u32)
    end

    # USB active endpoint
    def self.usbaep : Bool
      value.usbaep
    end

    # USB active endpoint
    def self.usbaep=(value : Bool) : Bool
      self.set(usbaep: value)
      value
    end

    # Even/odd frame
    def eonum_dpid : Bool
      @value.bits_set?(0x10000_u32)
    end

    # Even/odd frame
    def self.eonum_dpid : Bool
      value.eonum_dpid
    end

    # NAK status
    def naksts : Bool
      @value.bits_set?(0x20000_u32)
    end

    # NAK status
    def self.naksts : Bool
      value.naksts
    end

    # Endpoint type
    def eptyp : UInt8
      UInt8.new!((@value >> 18) & 0x3_u32)
    end

    # Endpoint type
    def self.eptyp : UInt8
      value.eptyp
    end

    # Endpoint type
    def self.eptyp=(value : UInt8) : UInt8
      self.set(eptyp: value)
      value
    end

    # STALL handshake
    def stall : Bool
      @value.bits_set?(0x200000_u32)
    end

    # STALL handshake
    def self.stall : Bool
      value.stall
    end

    # STALL handshake
    def self.stall=(value : Bool) : Bool
      self.set(stall: value)
      value
    end

    # TxFIFO number
    def txfnum : UInt8
      UInt8.new!((@value >> 22) & 0xf_u32)
    end

    # TxFIFO number
    def self.txfnum : UInt8
      value.txfnum
    end

    # TxFIFO number
    def self.txfnum=(value : UInt8) : UInt8
      self.set(txfnum: value)
      value
    end

    # Clear NAK
    def self.cnak=(value : Bool) : Bool
      self.set(cnak: value)
      value
    end

    # Set NAK
    def self.snak=(value : Bool) : Bool
      self.set(snak: value)
      value
    end

    # Set DATA0 PID
    def self.sd0_pid_sevnfrm=(value : Bool) : Bool
      self.set(sd0_pid_sevnfrm: value)
      value
    end

    # Set odd frame
    def self.soddfrm=(value : Bool) : Bool
      self.set(soddfrm: value)
      value
    end

    # Endpoint disable
    def epdis : Bool
      @value.bits_set?(0x40000000_u32)
    end

    # Endpoint disable
    def self.epdis : Bool
      value.epdis
    end

    # Endpoint disable
    def self.epdis=(value : Bool) : Bool
      self.set(epdis: value)
      value
    end

    # Endpoint enable
    def epena : Bool
      @value.bits_set?(0x80000000_u32)
    end

    # Endpoint enable
    def self.epena : Bool
      value.epena
    end

    # Endpoint enable
    def self.epena=(value : Bool) : Bool
      self.set(epena: value)
      value
    end

    def copy_with(
      *,

      mpsiz : UInt16? = nil,

      usbaep : Bool? = nil,

      eptyp : UInt8? = nil,

      stall : Bool? = nil,

      txfnum : UInt8? = nil,

      cnak : Bool? = nil,

      snak : Bool? = nil,

      sd0_pid_sevnfrm : Bool? = nil,

      soddfrm : Bool? = nil,

      epdis : Bool? = nil,

      epena : Bool? = nil
    ) : self
      value = @value

      unless mpsiz.nil?
        value = (value & 0xfffff800_u32) |
                UInt32.new!(mpsiz.to_int).&(0x7ff_u32) << 0
      end

      unless usbaep.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(usbaep.to_int).&(0x1_u32) << 15
      end

      unless eptyp.nil?
        value = (value & 0xfff3ffff_u32) |
                UInt32.new!(eptyp.to_int).&(0x3_u32) << 18
      end

      unless stall.nil?
        value = (value & 0xffdfffff_u32) |
                UInt32.new!(stall.to_int).&(0x1_u32) << 21
      end

      unless txfnum.nil?
        value = (value & 0xfc3fffff_u32) |
                UInt32.new!(txfnum.to_int).&(0xf_u32) << 22
      end

      unless cnak.nil?
        value = (value & 0xfbffffff_u32) |
                UInt32.new!(cnak.to_int).&(0x1_u32) << 26
      end

      unless snak.nil?
        value = (value & 0xf7ffffff_u32) |
                UInt32.new!(snak.to_int).&(0x1_u32) << 27
      end

      unless sd0_pid_sevnfrm.nil?
        value = (value & 0xefffffff_u32) |
                UInt32.new!(sd0_pid_sevnfrm.to_int).&(0x1_u32) << 28
      end

      unless soddfrm.nil?
        value = (value & 0xdfffffff_u32) |
                UInt32.new!(soddfrm.to_int).&(0x1_u32) << 29
      end

      unless epdis.nil?
        value = (value & 0xbfffffff_u32) |
                UInt32.new!(epdis.to_int).&(0x1_u32) << 30
      end

      unless epena.nil?
        value = (value & 0x7fffffff_u32) |
                UInt32.new!(epena.to_int).&(0x1_u32) << 31
      end

      self.class.new(value)
    end

    def self.set(
      *,
      mpsiz : UInt16? = nil,
      usbaep : Bool? = nil,
      eptyp : UInt8? = nil,
      stall : Bool? = nil,
      txfnum : UInt8? = nil,
      cnak : Bool? = nil,
      snak : Bool? = nil,
      sd0_pid_sevnfrm : Bool? = nil,
      soddfrm : Bool? = nil,
      epdis : Bool? = nil,
      epena : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        mpsiz: mpsiz,
        usbaep: usbaep,
        eptyp: eptyp,
        stall: stall,
        txfnum: txfnum,
        cnak: cnak,
        snak: snak,
        sd0_pid_sevnfrm: sd0_pid_sevnfrm,
        soddfrm: soddfrm,
        epdis: epdis,
        epena: epena,
      )
    end
  end # struct

  # OTG device endpoint-7 control          register
  struct OTG_HS_DIEPCTL7
    ADDRESS = BASE_ADDRESS + 0x1e0_u64

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

    # Maximum packet size
    def mpsiz : UInt16
      UInt16.new!((@value >> 0) & 0x7ff_u32)
    end

    # Maximum packet size
    def self.mpsiz : UInt16
      value.mpsiz
    end

    # Maximum packet size
    def self.mpsiz=(value : UInt16) : UInt16
      self.set(mpsiz: value)
      value
    end

    # USB active endpoint
    def usbaep : Bool
      @value.bits_set?(0x8000_u32)
    end

    # USB active endpoint
    def self.usbaep : Bool
      value.usbaep
    end

    # USB active endpoint
    def self.usbaep=(value : Bool) : Bool
      self.set(usbaep: value)
      value
    end

    # Even/odd frame
    def eonum_dpid : Bool
      @value.bits_set?(0x10000_u32)
    end

    # Even/odd frame
    def self.eonum_dpid : Bool
      value.eonum_dpid
    end

    # NAK status
    def naksts : Bool
      @value.bits_set?(0x20000_u32)
    end

    # NAK status
    def self.naksts : Bool
      value.naksts
    end

    # Endpoint type
    def eptyp : UInt8
      UInt8.new!((@value >> 18) & 0x3_u32)
    end

    # Endpoint type
    def self.eptyp : UInt8
      value.eptyp
    end

    # Endpoint type
    def self.eptyp=(value : UInt8) : UInt8
      self.set(eptyp: value)
      value
    end

    # STALL handshake
    def stall : Bool
      @value.bits_set?(0x200000_u32)
    end

    # STALL handshake
    def self.stall : Bool
      value.stall
    end

    # STALL handshake
    def self.stall=(value : Bool) : Bool
      self.set(stall: value)
      value
    end

    # TxFIFO number
    def txfnum : UInt8
      UInt8.new!((@value >> 22) & 0xf_u32)
    end

    # TxFIFO number
    def self.txfnum : UInt8
      value.txfnum
    end

    # TxFIFO number
    def self.txfnum=(value : UInt8) : UInt8
      self.set(txfnum: value)
      value
    end

    # Clear NAK
    def self.cnak=(value : Bool) : Bool
      self.set(cnak: value)
      value
    end

    # Set NAK
    def self.snak=(value : Bool) : Bool
      self.set(snak: value)
      value
    end

    # Set DATA0 PID
    def self.sd0_pid_sevnfrm=(value : Bool) : Bool
      self.set(sd0_pid_sevnfrm: value)
      value
    end

    # Set odd frame
    def self.soddfrm=(value : Bool) : Bool
      self.set(soddfrm: value)
      value
    end

    # Endpoint disable
    def epdis : Bool
      @value.bits_set?(0x40000000_u32)
    end

    # Endpoint disable
    def self.epdis : Bool
      value.epdis
    end

    # Endpoint disable
    def self.epdis=(value : Bool) : Bool
      self.set(epdis: value)
      value
    end

    # Endpoint enable
    def epena : Bool
      @value.bits_set?(0x80000000_u32)
    end

    # Endpoint enable
    def self.epena : Bool
      value.epena
    end

    # Endpoint enable
    def self.epena=(value : Bool) : Bool
      self.set(epena: value)
      value
    end

    def copy_with(
      *,

      mpsiz : UInt16? = nil,

      usbaep : Bool? = nil,

      eptyp : UInt8? = nil,

      stall : Bool? = nil,

      txfnum : UInt8? = nil,

      cnak : Bool? = nil,

      snak : Bool? = nil,

      sd0_pid_sevnfrm : Bool? = nil,

      soddfrm : Bool? = nil,

      epdis : Bool? = nil,

      epena : Bool? = nil
    ) : self
      value = @value

      unless mpsiz.nil?
        value = (value & 0xfffff800_u32) |
                UInt32.new!(mpsiz.to_int).&(0x7ff_u32) << 0
      end

      unless usbaep.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(usbaep.to_int).&(0x1_u32) << 15
      end

      unless eptyp.nil?
        value = (value & 0xfff3ffff_u32) |
                UInt32.new!(eptyp.to_int).&(0x3_u32) << 18
      end

      unless stall.nil?
        value = (value & 0xffdfffff_u32) |
                UInt32.new!(stall.to_int).&(0x1_u32) << 21
      end

      unless txfnum.nil?
        value = (value & 0xfc3fffff_u32) |
                UInt32.new!(txfnum.to_int).&(0xf_u32) << 22
      end

      unless cnak.nil?
        value = (value & 0xfbffffff_u32) |
                UInt32.new!(cnak.to_int).&(0x1_u32) << 26
      end

      unless snak.nil?
        value = (value & 0xf7ffffff_u32) |
                UInt32.new!(snak.to_int).&(0x1_u32) << 27
      end

      unless sd0_pid_sevnfrm.nil?
        value = (value & 0xefffffff_u32) |
                UInt32.new!(sd0_pid_sevnfrm.to_int).&(0x1_u32) << 28
      end

      unless soddfrm.nil?
        value = (value & 0xdfffffff_u32) |
                UInt32.new!(soddfrm.to_int).&(0x1_u32) << 29
      end

      unless epdis.nil?
        value = (value & 0xbfffffff_u32) |
                UInt32.new!(epdis.to_int).&(0x1_u32) << 30
      end

      unless epena.nil?
        value = (value & 0x7fffffff_u32) |
                UInt32.new!(epena.to_int).&(0x1_u32) << 31
      end

      self.class.new(value)
    end

    def self.set(
      *,
      mpsiz : UInt16? = nil,
      usbaep : Bool? = nil,
      eptyp : UInt8? = nil,
      stall : Bool? = nil,
      txfnum : UInt8? = nil,
      cnak : Bool? = nil,
      snak : Bool? = nil,
      sd0_pid_sevnfrm : Bool? = nil,
      soddfrm : Bool? = nil,
      epdis : Bool? = nil,
      epena : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        mpsiz: mpsiz,
        usbaep: usbaep,
        eptyp: eptyp,
        stall: stall,
        txfnum: txfnum,
        cnak: cnak,
        snak: snak,
        sd0_pid_sevnfrm: sd0_pid_sevnfrm,
        soddfrm: soddfrm,
        epdis: epdis,
        epena: epena,
      )
    end
  end # struct

  # OTG device endpoint-0 interrupt          register
  struct OTG_HS_DIEPINT0
    ADDRESS = BASE_ADDRESS + 0x108_u64

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

    # Transfer completed              interrupt
    def xfrc : Bool
      @value.bits_set?(0x1_u32)
    end

    # Transfer completed              interrupt
    def self.xfrc : Bool
      value.xfrc
    end

    # Transfer completed              interrupt
    def self.xfrc=(value : Bool) : Bool
      self.set(xfrc: value)
      value
    end

    # Endpoint disabled              interrupt
    def epdisd : Bool
      @value.bits_set?(0x2_u32)
    end

    # Endpoint disabled              interrupt
    def self.epdisd : Bool
      value.epdisd
    end

    # Endpoint disabled              interrupt
    def self.epdisd=(value : Bool) : Bool
      self.set(epdisd: value)
      value
    end

    # Timeout condition
    def toc : Bool
      @value.bits_set?(0x8_u32)
    end

    # Timeout condition
    def self.toc : Bool
      value.toc
    end

    # Timeout condition
    def self.toc=(value : Bool) : Bool
      self.set(toc: value)
      value
    end

    # IN token received when TxFIFO is              empty
    def ittxfe : Bool
      @value.bits_set?(0x10_u32)
    end

    # IN token received when TxFIFO is              empty
    def self.ittxfe : Bool
      value.ittxfe
    end

    # IN token received when TxFIFO is              empty
    def self.ittxfe=(value : Bool) : Bool
      self.set(ittxfe: value)
      value
    end

    # IN endpoint NAK effective
    def inepne : Bool
      @value.bits_set?(0x40_u32)
    end

    # IN endpoint NAK effective
    def self.inepne : Bool
      value.inepne
    end

    # IN endpoint NAK effective
    def self.inepne=(value : Bool) : Bool
      self.set(inepne: value)
      value
    end

    # Transmit FIFO empty
    def txfe : Bool
      @value.bits_set?(0x80_u32)
    end

    # Transmit FIFO empty
    def self.txfe : Bool
      value.txfe
    end

    # Transmit Fifo Underrun
    def txfifoudrn : Bool
      @value.bits_set?(0x100_u32)
    end

    # Transmit Fifo Underrun
    def self.txfifoudrn : Bool
      value.txfifoudrn
    end

    # Transmit Fifo Underrun
    def self.txfifoudrn=(value : Bool) : Bool
      self.set(txfifoudrn: value)
      value
    end

    # Buffer not available              interrupt
    def bna : Bool
      @value.bits_set?(0x200_u32)
    end

    # Buffer not available              interrupt
    def self.bna : Bool
      value.bna
    end

    # Buffer not available              interrupt
    def self.bna=(value : Bool) : Bool
      self.set(bna: value)
      value
    end

    # Packet dropped status
    def pktdrpsts : Bool
      @value.bits_set?(0x800_u32)
    end

    # Packet dropped status
    def self.pktdrpsts : Bool
      value.pktdrpsts
    end

    # Packet dropped status
    def self.pktdrpsts=(value : Bool) : Bool
      self.set(pktdrpsts: value)
      value
    end

    # Babble error interrupt
    def berr : Bool
      @value.bits_set?(0x1000_u32)
    end

    # Babble error interrupt
    def self.berr : Bool
      value.berr
    end

    # Babble error interrupt
    def self.berr=(value : Bool) : Bool
      self.set(berr: value)
      value
    end

    # NAK interrupt
    def nak : Bool
      @value.bits_set?(0x2000_u32)
    end

    # NAK interrupt
    def self.nak : Bool
      value.nak
    end

    # NAK interrupt
    def self.nak=(value : Bool) : Bool
      self.set(nak: value)
      value
    end

    def copy_with(
      *,

      xfrc : Bool? = nil,

      epdisd : Bool? = nil,

      toc : Bool? = nil,

      ittxfe : Bool? = nil,

      inepne : Bool? = nil,

      txfifoudrn : Bool? = nil,

      bna : Bool? = nil,

      pktdrpsts : Bool? = nil,

      berr : Bool? = nil,

      nak : Bool? = nil
    ) : self
      value = @value

      unless xfrc.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(xfrc.to_int).&(0x1_u32) << 0
      end

      unless epdisd.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(epdisd.to_int).&(0x1_u32) << 1
      end

      unless toc.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(toc.to_int).&(0x1_u32) << 3
      end

      unless ittxfe.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(ittxfe.to_int).&(0x1_u32) << 4
      end

      unless inepne.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(inepne.to_int).&(0x1_u32) << 6
      end

      unless txfifoudrn.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(txfifoudrn.to_int).&(0x1_u32) << 8
      end

      unless bna.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(bna.to_int).&(0x1_u32) << 9
      end

      unless pktdrpsts.nil?
        value = (value & 0xfffff7ff_u32) |
                UInt32.new!(pktdrpsts.to_int).&(0x1_u32) << 11
      end

      unless berr.nil?
        value = (value & 0xffffefff_u32) |
                UInt32.new!(berr.to_int).&(0x1_u32) << 12
      end

      unless nak.nil?
        value = (value & 0xffffdfff_u32) |
                UInt32.new!(nak.to_int).&(0x1_u32) << 13
      end

      self.class.new(value)
    end

    def self.set(
      *,
      xfrc : Bool? = nil,
      epdisd : Bool? = nil,
      toc : Bool? = nil,
      ittxfe : Bool? = nil,
      inepne : Bool? = nil,
      txfifoudrn : Bool? = nil,
      bna : Bool? = nil,
      pktdrpsts : Bool? = nil,
      berr : Bool? = nil,
      nak : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        xfrc: xfrc,
        epdisd: epdisd,
        toc: toc,
        ittxfe: ittxfe,
        inepne: inepne,
        txfifoudrn: txfifoudrn,
        bna: bna,
        pktdrpsts: pktdrpsts,
        berr: berr,
        nak: nak,
      )
    end
  end # struct

  # OTG device endpoint-1 interrupt          register
  struct OTG_HS_DIEPINT1
    ADDRESS = BASE_ADDRESS + 0x128_u64

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

    # Transfer completed              interrupt
    def xfrc : Bool
      @value.bits_set?(0x1_u32)
    end

    # Transfer completed              interrupt
    def self.xfrc : Bool
      value.xfrc
    end

    # Transfer completed              interrupt
    def self.xfrc=(value : Bool) : Bool
      self.set(xfrc: value)
      value
    end

    # Endpoint disabled              interrupt
    def epdisd : Bool
      @value.bits_set?(0x2_u32)
    end

    # Endpoint disabled              interrupt
    def self.epdisd : Bool
      value.epdisd
    end

    # Endpoint disabled              interrupt
    def self.epdisd=(value : Bool) : Bool
      self.set(epdisd: value)
      value
    end

    # Timeout condition
    def toc : Bool
      @value.bits_set?(0x8_u32)
    end

    # Timeout condition
    def self.toc : Bool
      value.toc
    end

    # Timeout condition
    def self.toc=(value : Bool) : Bool
      self.set(toc: value)
      value
    end

    # IN token received when TxFIFO is              empty
    def ittxfe : Bool
      @value.bits_set?(0x10_u32)
    end

    # IN token received when TxFIFO is              empty
    def self.ittxfe : Bool
      value.ittxfe
    end

    # IN token received when TxFIFO is              empty
    def self.ittxfe=(value : Bool) : Bool
      self.set(ittxfe: value)
      value
    end

    # IN endpoint NAK effective
    def inepne : Bool
      @value.bits_set?(0x40_u32)
    end

    # IN endpoint NAK effective
    def self.inepne : Bool
      value.inepne
    end

    # IN endpoint NAK effective
    def self.inepne=(value : Bool) : Bool
      self.set(inepne: value)
      value
    end

    # Transmit FIFO empty
    def txfe : Bool
      @value.bits_set?(0x80_u32)
    end

    # Transmit FIFO empty
    def self.txfe : Bool
      value.txfe
    end

    # Transmit Fifo Underrun
    def txfifoudrn : Bool
      @value.bits_set?(0x100_u32)
    end

    # Transmit Fifo Underrun
    def self.txfifoudrn : Bool
      value.txfifoudrn
    end

    # Transmit Fifo Underrun
    def self.txfifoudrn=(value : Bool) : Bool
      self.set(txfifoudrn: value)
      value
    end

    # Buffer not available              interrupt
    def bna : Bool
      @value.bits_set?(0x200_u32)
    end

    # Buffer not available              interrupt
    def self.bna : Bool
      value.bna
    end

    # Buffer not available              interrupt
    def self.bna=(value : Bool) : Bool
      self.set(bna: value)
      value
    end

    # Packet dropped status
    def pktdrpsts : Bool
      @value.bits_set?(0x800_u32)
    end

    # Packet dropped status
    def self.pktdrpsts : Bool
      value.pktdrpsts
    end

    # Packet dropped status
    def self.pktdrpsts=(value : Bool) : Bool
      self.set(pktdrpsts: value)
      value
    end

    # Babble error interrupt
    def berr : Bool
      @value.bits_set?(0x1000_u32)
    end

    # Babble error interrupt
    def self.berr : Bool
      value.berr
    end

    # Babble error interrupt
    def self.berr=(value : Bool) : Bool
      self.set(berr: value)
      value
    end

    # NAK interrupt
    def nak : Bool
      @value.bits_set?(0x2000_u32)
    end

    # NAK interrupt
    def self.nak : Bool
      value.nak
    end

    # NAK interrupt
    def self.nak=(value : Bool) : Bool
      self.set(nak: value)
      value
    end

    def copy_with(
      *,

      xfrc : Bool? = nil,

      epdisd : Bool? = nil,

      toc : Bool? = nil,

      ittxfe : Bool? = nil,

      inepne : Bool? = nil,

      txfifoudrn : Bool? = nil,

      bna : Bool? = nil,

      pktdrpsts : Bool? = nil,

      berr : Bool? = nil,

      nak : Bool? = nil
    ) : self
      value = @value

      unless xfrc.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(xfrc.to_int).&(0x1_u32) << 0
      end

      unless epdisd.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(epdisd.to_int).&(0x1_u32) << 1
      end

      unless toc.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(toc.to_int).&(0x1_u32) << 3
      end

      unless ittxfe.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(ittxfe.to_int).&(0x1_u32) << 4
      end

      unless inepne.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(inepne.to_int).&(0x1_u32) << 6
      end

      unless txfifoudrn.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(txfifoudrn.to_int).&(0x1_u32) << 8
      end

      unless bna.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(bna.to_int).&(0x1_u32) << 9
      end

      unless pktdrpsts.nil?
        value = (value & 0xfffff7ff_u32) |
                UInt32.new!(pktdrpsts.to_int).&(0x1_u32) << 11
      end

      unless berr.nil?
        value = (value & 0xffffefff_u32) |
                UInt32.new!(berr.to_int).&(0x1_u32) << 12
      end

      unless nak.nil?
        value = (value & 0xffffdfff_u32) |
                UInt32.new!(nak.to_int).&(0x1_u32) << 13
      end

      self.class.new(value)
    end

    def self.set(
      *,
      xfrc : Bool? = nil,
      epdisd : Bool? = nil,
      toc : Bool? = nil,
      ittxfe : Bool? = nil,
      inepne : Bool? = nil,
      txfifoudrn : Bool? = nil,
      bna : Bool? = nil,
      pktdrpsts : Bool? = nil,
      berr : Bool? = nil,
      nak : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        xfrc: xfrc,
        epdisd: epdisd,
        toc: toc,
        ittxfe: ittxfe,
        inepne: inepne,
        txfifoudrn: txfifoudrn,
        bna: bna,
        pktdrpsts: pktdrpsts,
        berr: berr,
        nak: nak,
      )
    end
  end # struct

  # OTG device endpoint-2 interrupt          register
  struct OTG_HS_DIEPINT2
    ADDRESS = BASE_ADDRESS + 0x148_u64

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

    # Transfer completed              interrupt
    def xfrc : Bool
      @value.bits_set?(0x1_u32)
    end

    # Transfer completed              interrupt
    def self.xfrc : Bool
      value.xfrc
    end

    # Transfer completed              interrupt
    def self.xfrc=(value : Bool) : Bool
      self.set(xfrc: value)
      value
    end

    # Endpoint disabled              interrupt
    def epdisd : Bool
      @value.bits_set?(0x2_u32)
    end

    # Endpoint disabled              interrupt
    def self.epdisd : Bool
      value.epdisd
    end

    # Endpoint disabled              interrupt
    def self.epdisd=(value : Bool) : Bool
      self.set(epdisd: value)
      value
    end

    # Timeout condition
    def toc : Bool
      @value.bits_set?(0x8_u32)
    end

    # Timeout condition
    def self.toc : Bool
      value.toc
    end

    # Timeout condition
    def self.toc=(value : Bool) : Bool
      self.set(toc: value)
      value
    end

    # IN token received when TxFIFO is              empty
    def ittxfe : Bool
      @value.bits_set?(0x10_u32)
    end

    # IN token received when TxFIFO is              empty
    def self.ittxfe : Bool
      value.ittxfe
    end

    # IN token received when TxFIFO is              empty
    def self.ittxfe=(value : Bool) : Bool
      self.set(ittxfe: value)
      value
    end

    # IN endpoint NAK effective
    def inepne : Bool
      @value.bits_set?(0x40_u32)
    end

    # IN endpoint NAK effective
    def self.inepne : Bool
      value.inepne
    end

    # IN endpoint NAK effective
    def self.inepne=(value : Bool) : Bool
      self.set(inepne: value)
      value
    end

    # Transmit FIFO empty
    def txfe : Bool
      @value.bits_set?(0x80_u32)
    end

    # Transmit FIFO empty
    def self.txfe : Bool
      value.txfe
    end

    # Transmit Fifo Underrun
    def txfifoudrn : Bool
      @value.bits_set?(0x100_u32)
    end

    # Transmit Fifo Underrun
    def self.txfifoudrn : Bool
      value.txfifoudrn
    end

    # Transmit Fifo Underrun
    def self.txfifoudrn=(value : Bool) : Bool
      self.set(txfifoudrn: value)
      value
    end

    # Buffer not available              interrupt
    def bna : Bool
      @value.bits_set?(0x200_u32)
    end

    # Buffer not available              interrupt
    def self.bna : Bool
      value.bna
    end

    # Buffer not available              interrupt
    def self.bna=(value : Bool) : Bool
      self.set(bna: value)
      value
    end

    # Packet dropped status
    def pktdrpsts : Bool
      @value.bits_set?(0x800_u32)
    end

    # Packet dropped status
    def self.pktdrpsts : Bool
      value.pktdrpsts
    end

    # Packet dropped status
    def self.pktdrpsts=(value : Bool) : Bool
      self.set(pktdrpsts: value)
      value
    end

    # Babble error interrupt
    def berr : Bool
      @value.bits_set?(0x1000_u32)
    end

    # Babble error interrupt
    def self.berr : Bool
      value.berr
    end

    # Babble error interrupt
    def self.berr=(value : Bool) : Bool
      self.set(berr: value)
      value
    end

    # NAK interrupt
    def nak : Bool
      @value.bits_set?(0x2000_u32)
    end

    # NAK interrupt
    def self.nak : Bool
      value.nak
    end

    # NAK interrupt
    def self.nak=(value : Bool) : Bool
      self.set(nak: value)
      value
    end

    def copy_with(
      *,

      xfrc : Bool? = nil,

      epdisd : Bool? = nil,

      toc : Bool? = nil,

      ittxfe : Bool? = nil,

      inepne : Bool? = nil,

      txfifoudrn : Bool? = nil,

      bna : Bool? = nil,

      pktdrpsts : Bool? = nil,

      berr : Bool? = nil,

      nak : Bool? = nil
    ) : self
      value = @value

      unless xfrc.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(xfrc.to_int).&(0x1_u32) << 0
      end

      unless epdisd.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(epdisd.to_int).&(0x1_u32) << 1
      end

      unless toc.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(toc.to_int).&(0x1_u32) << 3
      end

      unless ittxfe.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(ittxfe.to_int).&(0x1_u32) << 4
      end

      unless inepne.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(inepne.to_int).&(0x1_u32) << 6
      end

      unless txfifoudrn.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(txfifoudrn.to_int).&(0x1_u32) << 8
      end

      unless bna.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(bna.to_int).&(0x1_u32) << 9
      end

      unless pktdrpsts.nil?
        value = (value & 0xfffff7ff_u32) |
                UInt32.new!(pktdrpsts.to_int).&(0x1_u32) << 11
      end

      unless berr.nil?
        value = (value & 0xffffefff_u32) |
                UInt32.new!(berr.to_int).&(0x1_u32) << 12
      end

      unless nak.nil?
        value = (value & 0xffffdfff_u32) |
                UInt32.new!(nak.to_int).&(0x1_u32) << 13
      end

      self.class.new(value)
    end

    def self.set(
      *,
      xfrc : Bool? = nil,
      epdisd : Bool? = nil,
      toc : Bool? = nil,
      ittxfe : Bool? = nil,
      inepne : Bool? = nil,
      txfifoudrn : Bool? = nil,
      bna : Bool? = nil,
      pktdrpsts : Bool? = nil,
      berr : Bool? = nil,
      nak : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        xfrc: xfrc,
        epdisd: epdisd,
        toc: toc,
        ittxfe: ittxfe,
        inepne: inepne,
        txfifoudrn: txfifoudrn,
        bna: bna,
        pktdrpsts: pktdrpsts,
        berr: berr,
        nak: nak,
      )
    end
  end # struct

  # OTG device endpoint-3 interrupt          register
  struct OTG_HS_DIEPINT3
    ADDRESS = BASE_ADDRESS + 0x168_u64

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

    # Transfer completed              interrupt
    def xfrc : Bool
      @value.bits_set?(0x1_u32)
    end

    # Transfer completed              interrupt
    def self.xfrc : Bool
      value.xfrc
    end

    # Transfer completed              interrupt
    def self.xfrc=(value : Bool) : Bool
      self.set(xfrc: value)
      value
    end

    # Endpoint disabled              interrupt
    def epdisd : Bool
      @value.bits_set?(0x2_u32)
    end

    # Endpoint disabled              interrupt
    def self.epdisd : Bool
      value.epdisd
    end

    # Endpoint disabled              interrupt
    def self.epdisd=(value : Bool) : Bool
      self.set(epdisd: value)
      value
    end

    # Timeout condition
    def toc : Bool
      @value.bits_set?(0x8_u32)
    end

    # Timeout condition
    def self.toc : Bool
      value.toc
    end

    # Timeout condition
    def self.toc=(value : Bool) : Bool
      self.set(toc: value)
      value
    end

    # IN token received when TxFIFO is              empty
    def ittxfe : Bool
      @value.bits_set?(0x10_u32)
    end

    # IN token received when TxFIFO is              empty
    def self.ittxfe : Bool
      value.ittxfe
    end

    # IN token received when TxFIFO is              empty
    def self.ittxfe=(value : Bool) : Bool
      self.set(ittxfe: value)
      value
    end

    # IN endpoint NAK effective
    def inepne : Bool
      @value.bits_set?(0x40_u32)
    end

    # IN endpoint NAK effective
    def self.inepne : Bool
      value.inepne
    end

    # IN endpoint NAK effective
    def self.inepne=(value : Bool) : Bool
      self.set(inepne: value)
      value
    end

    # Transmit FIFO empty
    def txfe : Bool
      @value.bits_set?(0x80_u32)
    end

    # Transmit FIFO empty
    def self.txfe : Bool
      value.txfe
    end

    # Transmit Fifo Underrun
    def txfifoudrn : Bool
      @value.bits_set?(0x100_u32)
    end

    # Transmit Fifo Underrun
    def self.txfifoudrn : Bool
      value.txfifoudrn
    end

    # Transmit Fifo Underrun
    def self.txfifoudrn=(value : Bool) : Bool
      self.set(txfifoudrn: value)
      value
    end

    # Buffer not available              interrupt
    def bna : Bool
      @value.bits_set?(0x200_u32)
    end

    # Buffer not available              interrupt
    def self.bna : Bool
      value.bna
    end

    # Buffer not available              interrupt
    def self.bna=(value : Bool) : Bool
      self.set(bna: value)
      value
    end

    # Packet dropped status
    def pktdrpsts : Bool
      @value.bits_set?(0x800_u32)
    end

    # Packet dropped status
    def self.pktdrpsts : Bool
      value.pktdrpsts
    end

    # Packet dropped status
    def self.pktdrpsts=(value : Bool) : Bool
      self.set(pktdrpsts: value)
      value
    end

    # Babble error interrupt
    def berr : Bool
      @value.bits_set?(0x1000_u32)
    end

    # Babble error interrupt
    def self.berr : Bool
      value.berr
    end

    # Babble error interrupt
    def self.berr=(value : Bool) : Bool
      self.set(berr: value)
      value
    end

    # NAK interrupt
    def nak : Bool
      @value.bits_set?(0x2000_u32)
    end

    # NAK interrupt
    def self.nak : Bool
      value.nak
    end

    # NAK interrupt
    def self.nak=(value : Bool) : Bool
      self.set(nak: value)
      value
    end

    def copy_with(
      *,

      xfrc : Bool? = nil,

      epdisd : Bool? = nil,

      toc : Bool? = nil,

      ittxfe : Bool? = nil,

      inepne : Bool? = nil,

      txfifoudrn : Bool? = nil,

      bna : Bool? = nil,

      pktdrpsts : Bool? = nil,

      berr : Bool? = nil,

      nak : Bool? = nil
    ) : self
      value = @value

      unless xfrc.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(xfrc.to_int).&(0x1_u32) << 0
      end

      unless epdisd.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(epdisd.to_int).&(0x1_u32) << 1
      end

      unless toc.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(toc.to_int).&(0x1_u32) << 3
      end

      unless ittxfe.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(ittxfe.to_int).&(0x1_u32) << 4
      end

      unless inepne.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(inepne.to_int).&(0x1_u32) << 6
      end

      unless txfifoudrn.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(txfifoudrn.to_int).&(0x1_u32) << 8
      end

      unless bna.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(bna.to_int).&(0x1_u32) << 9
      end

      unless pktdrpsts.nil?
        value = (value & 0xfffff7ff_u32) |
                UInt32.new!(pktdrpsts.to_int).&(0x1_u32) << 11
      end

      unless berr.nil?
        value = (value & 0xffffefff_u32) |
                UInt32.new!(berr.to_int).&(0x1_u32) << 12
      end

      unless nak.nil?
        value = (value & 0xffffdfff_u32) |
                UInt32.new!(nak.to_int).&(0x1_u32) << 13
      end

      self.class.new(value)
    end

    def self.set(
      *,
      xfrc : Bool? = nil,
      epdisd : Bool? = nil,
      toc : Bool? = nil,
      ittxfe : Bool? = nil,
      inepne : Bool? = nil,
      txfifoudrn : Bool? = nil,
      bna : Bool? = nil,
      pktdrpsts : Bool? = nil,
      berr : Bool? = nil,
      nak : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        xfrc: xfrc,
        epdisd: epdisd,
        toc: toc,
        ittxfe: ittxfe,
        inepne: inepne,
        txfifoudrn: txfifoudrn,
        bna: bna,
        pktdrpsts: pktdrpsts,
        berr: berr,
        nak: nak,
      )
    end
  end # struct

  # OTG device endpoint-4 interrupt          register
  struct OTG_HS_DIEPINT4
    ADDRESS = BASE_ADDRESS + 0x188_u64

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

    # Transfer completed              interrupt
    def xfrc : Bool
      @value.bits_set?(0x1_u32)
    end

    # Transfer completed              interrupt
    def self.xfrc : Bool
      value.xfrc
    end

    # Transfer completed              interrupt
    def self.xfrc=(value : Bool) : Bool
      self.set(xfrc: value)
      value
    end

    # Endpoint disabled              interrupt
    def epdisd : Bool
      @value.bits_set?(0x2_u32)
    end

    # Endpoint disabled              interrupt
    def self.epdisd : Bool
      value.epdisd
    end

    # Endpoint disabled              interrupt
    def self.epdisd=(value : Bool) : Bool
      self.set(epdisd: value)
      value
    end

    # Timeout condition
    def toc : Bool
      @value.bits_set?(0x8_u32)
    end

    # Timeout condition
    def self.toc : Bool
      value.toc
    end

    # Timeout condition
    def self.toc=(value : Bool) : Bool
      self.set(toc: value)
      value
    end

    # IN token received when TxFIFO is              empty
    def ittxfe : Bool
      @value.bits_set?(0x10_u32)
    end

    # IN token received when TxFIFO is              empty
    def self.ittxfe : Bool
      value.ittxfe
    end

    # IN token received when TxFIFO is              empty
    def self.ittxfe=(value : Bool) : Bool
      self.set(ittxfe: value)
      value
    end

    # IN endpoint NAK effective
    def inepne : Bool
      @value.bits_set?(0x40_u32)
    end

    # IN endpoint NAK effective
    def self.inepne : Bool
      value.inepne
    end

    # IN endpoint NAK effective
    def self.inepne=(value : Bool) : Bool
      self.set(inepne: value)
      value
    end

    # Transmit FIFO empty
    def txfe : Bool
      @value.bits_set?(0x80_u32)
    end

    # Transmit FIFO empty
    def self.txfe : Bool
      value.txfe
    end

    # Transmit Fifo Underrun
    def txfifoudrn : Bool
      @value.bits_set?(0x100_u32)
    end

    # Transmit Fifo Underrun
    def self.txfifoudrn : Bool
      value.txfifoudrn
    end

    # Transmit Fifo Underrun
    def self.txfifoudrn=(value : Bool) : Bool
      self.set(txfifoudrn: value)
      value
    end

    # Buffer not available              interrupt
    def bna : Bool
      @value.bits_set?(0x200_u32)
    end

    # Buffer not available              interrupt
    def self.bna : Bool
      value.bna
    end

    # Buffer not available              interrupt
    def self.bna=(value : Bool) : Bool
      self.set(bna: value)
      value
    end

    # Packet dropped status
    def pktdrpsts : Bool
      @value.bits_set?(0x800_u32)
    end

    # Packet dropped status
    def self.pktdrpsts : Bool
      value.pktdrpsts
    end

    # Packet dropped status
    def self.pktdrpsts=(value : Bool) : Bool
      self.set(pktdrpsts: value)
      value
    end

    # Babble error interrupt
    def berr : Bool
      @value.bits_set?(0x1000_u32)
    end

    # Babble error interrupt
    def self.berr : Bool
      value.berr
    end

    # Babble error interrupt
    def self.berr=(value : Bool) : Bool
      self.set(berr: value)
      value
    end

    # NAK interrupt
    def nak : Bool
      @value.bits_set?(0x2000_u32)
    end

    # NAK interrupt
    def self.nak : Bool
      value.nak
    end

    # NAK interrupt
    def self.nak=(value : Bool) : Bool
      self.set(nak: value)
      value
    end

    def copy_with(
      *,

      xfrc : Bool? = nil,

      epdisd : Bool? = nil,

      toc : Bool? = nil,

      ittxfe : Bool? = nil,

      inepne : Bool? = nil,

      txfifoudrn : Bool? = nil,

      bna : Bool? = nil,

      pktdrpsts : Bool? = nil,

      berr : Bool? = nil,

      nak : Bool? = nil
    ) : self
      value = @value

      unless xfrc.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(xfrc.to_int).&(0x1_u32) << 0
      end

      unless epdisd.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(epdisd.to_int).&(0x1_u32) << 1
      end

      unless toc.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(toc.to_int).&(0x1_u32) << 3
      end

      unless ittxfe.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(ittxfe.to_int).&(0x1_u32) << 4
      end

      unless inepne.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(inepne.to_int).&(0x1_u32) << 6
      end

      unless txfifoudrn.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(txfifoudrn.to_int).&(0x1_u32) << 8
      end

      unless bna.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(bna.to_int).&(0x1_u32) << 9
      end

      unless pktdrpsts.nil?
        value = (value & 0xfffff7ff_u32) |
                UInt32.new!(pktdrpsts.to_int).&(0x1_u32) << 11
      end

      unless berr.nil?
        value = (value & 0xffffefff_u32) |
                UInt32.new!(berr.to_int).&(0x1_u32) << 12
      end

      unless nak.nil?
        value = (value & 0xffffdfff_u32) |
                UInt32.new!(nak.to_int).&(0x1_u32) << 13
      end

      self.class.new(value)
    end

    def self.set(
      *,
      xfrc : Bool? = nil,
      epdisd : Bool? = nil,
      toc : Bool? = nil,
      ittxfe : Bool? = nil,
      inepne : Bool? = nil,
      txfifoudrn : Bool? = nil,
      bna : Bool? = nil,
      pktdrpsts : Bool? = nil,
      berr : Bool? = nil,
      nak : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        xfrc: xfrc,
        epdisd: epdisd,
        toc: toc,
        ittxfe: ittxfe,
        inepne: inepne,
        txfifoudrn: txfifoudrn,
        bna: bna,
        pktdrpsts: pktdrpsts,
        berr: berr,
        nak: nak,
      )
    end
  end # struct

  # OTG device endpoint-5 interrupt          register
  struct OTG_HS_DIEPINT5
    ADDRESS = BASE_ADDRESS + 0x1a8_u64

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

    # Transfer completed              interrupt
    def xfrc : Bool
      @value.bits_set?(0x1_u32)
    end

    # Transfer completed              interrupt
    def self.xfrc : Bool
      value.xfrc
    end

    # Transfer completed              interrupt
    def self.xfrc=(value : Bool) : Bool
      self.set(xfrc: value)
      value
    end

    # Endpoint disabled              interrupt
    def epdisd : Bool
      @value.bits_set?(0x2_u32)
    end

    # Endpoint disabled              interrupt
    def self.epdisd : Bool
      value.epdisd
    end

    # Endpoint disabled              interrupt
    def self.epdisd=(value : Bool) : Bool
      self.set(epdisd: value)
      value
    end

    # Timeout condition
    def toc : Bool
      @value.bits_set?(0x8_u32)
    end

    # Timeout condition
    def self.toc : Bool
      value.toc
    end

    # Timeout condition
    def self.toc=(value : Bool) : Bool
      self.set(toc: value)
      value
    end

    # IN token received when TxFIFO is              empty
    def ittxfe : Bool
      @value.bits_set?(0x10_u32)
    end

    # IN token received when TxFIFO is              empty
    def self.ittxfe : Bool
      value.ittxfe
    end

    # IN token received when TxFIFO is              empty
    def self.ittxfe=(value : Bool) : Bool
      self.set(ittxfe: value)
      value
    end

    # IN endpoint NAK effective
    def inepne : Bool
      @value.bits_set?(0x40_u32)
    end

    # IN endpoint NAK effective
    def self.inepne : Bool
      value.inepne
    end

    # IN endpoint NAK effective
    def self.inepne=(value : Bool) : Bool
      self.set(inepne: value)
      value
    end

    # Transmit FIFO empty
    def txfe : Bool
      @value.bits_set?(0x80_u32)
    end

    # Transmit FIFO empty
    def self.txfe : Bool
      value.txfe
    end

    # Transmit Fifo Underrun
    def txfifoudrn : Bool
      @value.bits_set?(0x100_u32)
    end

    # Transmit Fifo Underrun
    def self.txfifoudrn : Bool
      value.txfifoudrn
    end

    # Transmit Fifo Underrun
    def self.txfifoudrn=(value : Bool) : Bool
      self.set(txfifoudrn: value)
      value
    end

    # Buffer not available              interrupt
    def bna : Bool
      @value.bits_set?(0x200_u32)
    end

    # Buffer not available              interrupt
    def self.bna : Bool
      value.bna
    end

    # Buffer not available              interrupt
    def self.bna=(value : Bool) : Bool
      self.set(bna: value)
      value
    end

    # Packet dropped status
    def pktdrpsts : Bool
      @value.bits_set?(0x800_u32)
    end

    # Packet dropped status
    def self.pktdrpsts : Bool
      value.pktdrpsts
    end

    # Packet dropped status
    def self.pktdrpsts=(value : Bool) : Bool
      self.set(pktdrpsts: value)
      value
    end

    # Babble error interrupt
    def berr : Bool
      @value.bits_set?(0x1000_u32)
    end

    # Babble error interrupt
    def self.berr : Bool
      value.berr
    end

    # Babble error interrupt
    def self.berr=(value : Bool) : Bool
      self.set(berr: value)
      value
    end

    # NAK interrupt
    def nak : Bool
      @value.bits_set?(0x2000_u32)
    end

    # NAK interrupt
    def self.nak : Bool
      value.nak
    end

    # NAK interrupt
    def self.nak=(value : Bool) : Bool
      self.set(nak: value)
      value
    end

    def copy_with(
      *,

      xfrc : Bool? = nil,

      epdisd : Bool? = nil,

      toc : Bool? = nil,

      ittxfe : Bool? = nil,

      inepne : Bool? = nil,

      txfifoudrn : Bool? = nil,

      bna : Bool? = nil,

      pktdrpsts : Bool? = nil,

      berr : Bool? = nil,

      nak : Bool? = nil
    ) : self
      value = @value

      unless xfrc.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(xfrc.to_int).&(0x1_u32) << 0
      end

      unless epdisd.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(epdisd.to_int).&(0x1_u32) << 1
      end

      unless toc.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(toc.to_int).&(0x1_u32) << 3
      end

      unless ittxfe.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(ittxfe.to_int).&(0x1_u32) << 4
      end

      unless inepne.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(inepne.to_int).&(0x1_u32) << 6
      end

      unless txfifoudrn.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(txfifoudrn.to_int).&(0x1_u32) << 8
      end

      unless bna.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(bna.to_int).&(0x1_u32) << 9
      end

      unless pktdrpsts.nil?
        value = (value & 0xfffff7ff_u32) |
                UInt32.new!(pktdrpsts.to_int).&(0x1_u32) << 11
      end

      unless berr.nil?
        value = (value & 0xffffefff_u32) |
                UInt32.new!(berr.to_int).&(0x1_u32) << 12
      end

      unless nak.nil?
        value = (value & 0xffffdfff_u32) |
                UInt32.new!(nak.to_int).&(0x1_u32) << 13
      end

      self.class.new(value)
    end

    def self.set(
      *,
      xfrc : Bool? = nil,
      epdisd : Bool? = nil,
      toc : Bool? = nil,
      ittxfe : Bool? = nil,
      inepne : Bool? = nil,
      txfifoudrn : Bool? = nil,
      bna : Bool? = nil,
      pktdrpsts : Bool? = nil,
      berr : Bool? = nil,
      nak : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        xfrc: xfrc,
        epdisd: epdisd,
        toc: toc,
        ittxfe: ittxfe,
        inepne: inepne,
        txfifoudrn: txfifoudrn,
        bna: bna,
        pktdrpsts: pktdrpsts,
        berr: berr,
        nak: nak,
      )
    end
  end # struct

  # OTG device endpoint-6 interrupt          register
  struct OTG_HS_DIEPINT6
    ADDRESS = BASE_ADDRESS + 0x1c8_u64

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

    # Transfer completed              interrupt
    def xfrc : Bool
      @value.bits_set?(0x1_u32)
    end

    # Transfer completed              interrupt
    def self.xfrc : Bool
      value.xfrc
    end

    # Transfer completed              interrupt
    def self.xfrc=(value : Bool) : Bool
      self.set(xfrc: value)
      value
    end

    # Endpoint disabled              interrupt
    def epdisd : Bool
      @value.bits_set?(0x2_u32)
    end

    # Endpoint disabled              interrupt
    def self.epdisd : Bool
      value.epdisd
    end

    # Endpoint disabled              interrupt
    def self.epdisd=(value : Bool) : Bool
      self.set(epdisd: value)
      value
    end

    # Timeout condition
    def toc : Bool
      @value.bits_set?(0x8_u32)
    end

    # Timeout condition
    def self.toc : Bool
      value.toc
    end

    # Timeout condition
    def self.toc=(value : Bool) : Bool
      self.set(toc: value)
      value
    end

    # IN token received when TxFIFO is              empty
    def ittxfe : Bool
      @value.bits_set?(0x10_u32)
    end

    # IN token received when TxFIFO is              empty
    def self.ittxfe : Bool
      value.ittxfe
    end

    # IN token received when TxFIFO is              empty
    def self.ittxfe=(value : Bool) : Bool
      self.set(ittxfe: value)
      value
    end

    # IN endpoint NAK effective
    def inepne : Bool
      @value.bits_set?(0x40_u32)
    end

    # IN endpoint NAK effective
    def self.inepne : Bool
      value.inepne
    end

    # IN endpoint NAK effective
    def self.inepne=(value : Bool) : Bool
      self.set(inepne: value)
      value
    end

    # Transmit FIFO empty
    def txfe : Bool
      @value.bits_set?(0x80_u32)
    end

    # Transmit FIFO empty
    def self.txfe : Bool
      value.txfe
    end

    # Transmit Fifo Underrun
    def txfifoudrn : Bool
      @value.bits_set?(0x100_u32)
    end

    # Transmit Fifo Underrun
    def self.txfifoudrn : Bool
      value.txfifoudrn
    end

    # Transmit Fifo Underrun
    def self.txfifoudrn=(value : Bool) : Bool
      self.set(txfifoudrn: value)
      value
    end

    # Buffer not available              interrupt
    def bna : Bool
      @value.bits_set?(0x200_u32)
    end

    # Buffer not available              interrupt
    def self.bna : Bool
      value.bna
    end

    # Buffer not available              interrupt
    def self.bna=(value : Bool) : Bool
      self.set(bna: value)
      value
    end

    # Packet dropped status
    def pktdrpsts : Bool
      @value.bits_set?(0x800_u32)
    end

    # Packet dropped status
    def self.pktdrpsts : Bool
      value.pktdrpsts
    end

    # Packet dropped status
    def self.pktdrpsts=(value : Bool) : Bool
      self.set(pktdrpsts: value)
      value
    end

    # Babble error interrupt
    def berr : Bool
      @value.bits_set?(0x1000_u32)
    end

    # Babble error interrupt
    def self.berr : Bool
      value.berr
    end

    # Babble error interrupt
    def self.berr=(value : Bool) : Bool
      self.set(berr: value)
      value
    end

    # NAK interrupt
    def nak : Bool
      @value.bits_set?(0x2000_u32)
    end

    # NAK interrupt
    def self.nak : Bool
      value.nak
    end

    # NAK interrupt
    def self.nak=(value : Bool) : Bool
      self.set(nak: value)
      value
    end

    def copy_with(
      *,

      xfrc : Bool? = nil,

      epdisd : Bool? = nil,

      toc : Bool? = nil,

      ittxfe : Bool? = nil,

      inepne : Bool? = nil,

      txfifoudrn : Bool? = nil,

      bna : Bool? = nil,

      pktdrpsts : Bool? = nil,

      berr : Bool? = nil,

      nak : Bool? = nil
    ) : self
      value = @value

      unless xfrc.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(xfrc.to_int).&(0x1_u32) << 0
      end

      unless epdisd.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(epdisd.to_int).&(0x1_u32) << 1
      end

      unless toc.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(toc.to_int).&(0x1_u32) << 3
      end

      unless ittxfe.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(ittxfe.to_int).&(0x1_u32) << 4
      end

      unless inepne.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(inepne.to_int).&(0x1_u32) << 6
      end

      unless txfifoudrn.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(txfifoudrn.to_int).&(0x1_u32) << 8
      end

      unless bna.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(bna.to_int).&(0x1_u32) << 9
      end

      unless pktdrpsts.nil?
        value = (value & 0xfffff7ff_u32) |
                UInt32.new!(pktdrpsts.to_int).&(0x1_u32) << 11
      end

      unless berr.nil?
        value = (value & 0xffffefff_u32) |
                UInt32.new!(berr.to_int).&(0x1_u32) << 12
      end

      unless nak.nil?
        value = (value & 0xffffdfff_u32) |
                UInt32.new!(nak.to_int).&(0x1_u32) << 13
      end

      self.class.new(value)
    end

    def self.set(
      *,
      xfrc : Bool? = nil,
      epdisd : Bool? = nil,
      toc : Bool? = nil,
      ittxfe : Bool? = nil,
      inepne : Bool? = nil,
      txfifoudrn : Bool? = nil,
      bna : Bool? = nil,
      pktdrpsts : Bool? = nil,
      berr : Bool? = nil,
      nak : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        xfrc: xfrc,
        epdisd: epdisd,
        toc: toc,
        ittxfe: ittxfe,
        inepne: inepne,
        txfifoudrn: txfifoudrn,
        bna: bna,
        pktdrpsts: pktdrpsts,
        berr: berr,
        nak: nak,
      )
    end
  end # struct

  # OTG device endpoint-7 interrupt          register
  struct OTG_HS_DIEPINT7
    ADDRESS = BASE_ADDRESS + 0x1e8_u64

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

    # Transfer completed              interrupt
    def xfrc : Bool
      @value.bits_set?(0x1_u32)
    end

    # Transfer completed              interrupt
    def self.xfrc : Bool
      value.xfrc
    end

    # Transfer completed              interrupt
    def self.xfrc=(value : Bool) : Bool
      self.set(xfrc: value)
      value
    end

    # Endpoint disabled              interrupt
    def epdisd : Bool
      @value.bits_set?(0x2_u32)
    end

    # Endpoint disabled              interrupt
    def self.epdisd : Bool
      value.epdisd
    end

    # Endpoint disabled              interrupt
    def self.epdisd=(value : Bool) : Bool
      self.set(epdisd: value)
      value
    end

    # Timeout condition
    def toc : Bool
      @value.bits_set?(0x8_u32)
    end

    # Timeout condition
    def self.toc : Bool
      value.toc
    end

    # Timeout condition
    def self.toc=(value : Bool) : Bool
      self.set(toc: value)
      value
    end

    # IN token received when TxFIFO is              empty
    def ittxfe : Bool
      @value.bits_set?(0x10_u32)
    end

    # IN token received when TxFIFO is              empty
    def self.ittxfe : Bool
      value.ittxfe
    end

    # IN token received when TxFIFO is              empty
    def self.ittxfe=(value : Bool) : Bool
      self.set(ittxfe: value)
      value
    end

    # IN endpoint NAK effective
    def inepne : Bool
      @value.bits_set?(0x40_u32)
    end

    # IN endpoint NAK effective
    def self.inepne : Bool
      value.inepne
    end

    # IN endpoint NAK effective
    def self.inepne=(value : Bool) : Bool
      self.set(inepne: value)
      value
    end

    # Transmit FIFO empty
    def txfe : Bool
      @value.bits_set?(0x80_u32)
    end

    # Transmit FIFO empty
    def self.txfe : Bool
      value.txfe
    end

    # Transmit Fifo Underrun
    def txfifoudrn : Bool
      @value.bits_set?(0x100_u32)
    end

    # Transmit Fifo Underrun
    def self.txfifoudrn : Bool
      value.txfifoudrn
    end

    # Transmit Fifo Underrun
    def self.txfifoudrn=(value : Bool) : Bool
      self.set(txfifoudrn: value)
      value
    end

    # Buffer not available              interrupt
    def bna : Bool
      @value.bits_set?(0x200_u32)
    end

    # Buffer not available              interrupt
    def self.bna : Bool
      value.bna
    end

    # Buffer not available              interrupt
    def self.bna=(value : Bool) : Bool
      self.set(bna: value)
      value
    end

    # Packet dropped status
    def pktdrpsts : Bool
      @value.bits_set?(0x800_u32)
    end

    # Packet dropped status
    def self.pktdrpsts : Bool
      value.pktdrpsts
    end

    # Packet dropped status
    def self.pktdrpsts=(value : Bool) : Bool
      self.set(pktdrpsts: value)
      value
    end

    # Babble error interrupt
    def berr : Bool
      @value.bits_set?(0x1000_u32)
    end

    # Babble error interrupt
    def self.berr : Bool
      value.berr
    end

    # Babble error interrupt
    def self.berr=(value : Bool) : Bool
      self.set(berr: value)
      value
    end

    # NAK interrupt
    def nak : Bool
      @value.bits_set?(0x2000_u32)
    end

    # NAK interrupt
    def self.nak : Bool
      value.nak
    end

    # NAK interrupt
    def self.nak=(value : Bool) : Bool
      self.set(nak: value)
      value
    end

    def copy_with(
      *,

      xfrc : Bool? = nil,

      epdisd : Bool? = nil,

      toc : Bool? = nil,

      ittxfe : Bool? = nil,

      inepne : Bool? = nil,

      txfifoudrn : Bool? = nil,

      bna : Bool? = nil,

      pktdrpsts : Bool? = nil,

      berr : Bool? = nil,

      nak : Bool? = nil
    ) : self
      value = @value

      unless xfrc.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(xfrc.to_int).&(0x1_u32) << 0
      end

      unless epdisd.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(epdisd.to_int).&(0x1_u32) << 1
      end

      unless toc.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(toc.to_int).&(0x1_u32) << 3
      end

      unless ittxfe.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(ittxfe.to_int).&(0x1_u32) << 4
      end

      unless inepne.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(inepne.to_int).&(0x1_u32) << 6
      end

      unless txfifoudrn.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(txfifoudrn.to_int).&(0x1_u32) << 8
      end

      unless bna.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(bna.to_int).&(0x1_u32) << 9
      end

      unless pktdrpsts.nil?
        value = (value & 0xfffff7ff_u32) |
                UInt32.new!(pktdrpsts.to_int).&(0x1_u32) << 11
      end

      unless berr.nil?
        value = (value & 0xffffefff_u32) |
                UInt32.new!(berr.to_int).&(0x1_u32) << 12
      end

      unless nak.nil?
        value = (value & 0xffffdfff_u32) |
                UInt32.new!(nak.to_int).&(0x1_u32) << 13
      end

      self.class.new(value)
    end

    def self.set(
      *,
      xfrc : Bool? = nil,
      epdisd : Bool? = nil,
      toc : Bool? = nil,
      ittxfe : Bool? = nil,
      inepne : Bool? = nil,
      txfifoudrn : Bool? = nil,
      bna : Bool? = nil,
      pktdrpsts : Bool? = nil,
      berr : Bool? = nil,
      nak : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        xfrc: xfrc,
        epdisd: epdisd,
        toc: toc,
        ittxfe: ittxfe,
        inepne: inepne,
        txfifoudrn: txfifoudrn,
        bna: bna,
        pktdrpsts: pktdrpsts,
        berr: berr,
        nak: nak,
      )
    end
  end # struct

  # OTG_HS device IN endpoint 0 transfer size          register
  struct OTG_HS_DIEPTSIZ0
    ADDRESS = BASE_ADDRESS + 0x110_u64

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

    # Transfer size
    def xfrsiz : UInt8
      UInt8.new!((@value >> 0) & 0x7f_u32)
    end

    # Transfer size
    def self.xfrsiz : UInt8
      value.xfrsiz
    end

    # Transfer size
    def self.xfrsiz=(value : UInt8) : UInt8
      self.set(xfrsiz: value)
      value
    end

    # Packet count
    def pktcnt : UInt8
      UInt8.new!((@value >> 19) & 0x3_u32)
    end

    # Packet count
    def self.pktcnt : UInt8
      value.pktcnt
    end

    # Packet count
    def self.pktcnt=(value : UInt8) : UInt8
      self.set(pktcnt: value)
      value
    end

    def copy_with(
      *,

      xfrsiz : UInt8? = nil,

      pktcnt : UInt8? = nil
    ) : self
      value = @value

      unless xfrsiz.nil?
        value = (value & 0xffffff80_u32) |
                UInt32.new!(xfrsiz.to_int).&(0x7f_u32) << 0
      end

      unless pktcnt.nil?
        value = (value & 0xffe7ffff_u32) |
                UInt32.new!(pktcnt.to_int).&(0x3_u32) << 19
      end

      self.class.new(value)
    end

    def self.set(
      *,
      xfrsiz : UInt8? = nil,
      pktcnt : UInt8? = nil
    ) : Nil
      self.value = self.value.copy_with(
        xfrsiz: xfrsiz,
        pktcnt: pktcnt,
      )
    end
  end # struct

  # OTG_HS device endpoint-1 DMA address          register
  struct OTG_HS_DIEPDMA1
    ADDRESS = BASE_ADDRESS + 0x114_u64

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

    # DMA address
    def dmaaddr : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # DMA address
    def self.dmaaddr : UInt32
      value.dmaaddr
    end

    # DMA address
    def self.dmaaddr=(value : UInt32) : UInt32
      self.set(dmaaddr: value)
      value
    end

    def copy_with(
      *,

      dmaaddr : UInt32? = nil
    ) : self
      value = @value

      unless dmaaddr.nil?
        value = (value & 0xffffffff_u32) |
                UInt32.new!(dmaaddr.to_int).&(0x0_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      dmaaddr : UInt32? = nil
    ) : Nil
      self.value = self.value.copy_with(
        dmaaddr: dmaaddr,
      )
    end
  end # struct

  # OTG_HS device endpoint-2 DMA address          register
  struct OTG_HS_DIEPDMA2
    ADDRESS = BASE_ADDRESS + 0x134_u64

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

    # DMA address
    def dmaaddr : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # DMA address
    def self.dmaaddr : UInt32
      value.dmaaddr
    end

    # DMA address
    def self.dmaaddr=(value : UInt32) : UInt32
      self.set(dmaaddr: value)
      value
    end

    def copy_with(
      *,

      dmaaddr : UInt32? = nil
    ) : self
      value = @value

      unless dmaaddr.nil?
        value = (value & 0xffffffff_u32) |
                UInt32.new!(dmaaddr.to_int).&(0x0_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      dmaaddr : UInt32? = nil
    ) : Nil
      self.value = self.value.copy_with(
        dmaaddr: dmaaddr,
      )
    end
  end # struct

  # OTG_HS device endpoint-3 DMA address          register
  struct OTG_HS_DIEPDMA3
    ADDRESS = BASE_ADDRESS + 0x154_u64

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

    # DMA address
    def dmaaddr : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # DMA address
    def self.dmaaddr : UInt32
      value.dmaaddr
    end

    # DMA address
    def self.dmaaddr=(value : UInt32) : UInt32
      self.set(dmaaddr: value)
      value
    end

    def copy_with(
      *,

      dmaaddr : UInt32? = nil
    ) : self
      value = @value

      unless dmaaddr.nil?
        value = (value & 0xffffffff_u32) |
                UInt32.new!(dmaaddr.to_int).&(0x0_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      dmaaddr : UInt32? = nil
    ) : Nil
      self.value = self.value.copy_with(
        dmaaddr: dmaaddr,
      )
    end
  end # struct

  # OTG_HS device endpoint-4 DMA address          register
  struct OTG_HS_DIEPDMA4
    ADDRESS = BASE_ADDRESS + 0x174_u64

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

    # DMA address
    def dmaaddr : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # DMA address
    def self.dmaaddr : UInt32
      value.dmaaddr
    end

    # DMA address
    def self.dmaaddr=(value : UInt32) : UInt32
      self.set(dmaaddr: value)
      value
    end

    def copy_with(
      *,

      dmaaddr : UInt32? = nil
    ) : self
      value = @value

      unless dmaaddr.nil?
        value = (value & 0xffffffff_u32) |
                UInt32.new!(dmaaddr.to_int).&(0x0_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      dmaaddr : UInt32? = nil
    ) : Nil
      self.value = self.value.copy_with(
        dmaaddr: dmaaddr,
      )
    end
  end # struct

  # OTG_HS device endpoint-5 DMA address          register
  struct OTG_HS_DIEPDMA5
    ADDRESS = BASE_ADDRESS + 0x194_u64

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

    # DMA address
    def dmaaddr : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # DMA address
    def self.dmaaddr : UInt32
      value.dmaaddr
    end

    # DMA address
    def self.dmaaddr=(value : UInt32) : UInt32
      self.set(dmaaddr: value)
      value
    end

    def copy_with(
      *,

      dmaaddr : UInt32? = nil
    ) : self
      value = @value

      unless dmaaddr.nil?
        value = (value & 0xffffffff_u32) |
                UInt32.new!(dmaaddr.to_int).&(0x0_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      dmaaddr : UInt32? = nil
    ) : Nil
      self.value = self.value.copy_with(
        dmaaddr: dmaaddr,
      )
    end
  end # struct

  # OTG_HS device IN endpoint transmit FIFO          status register
  struct OTG_HS_DTXFSTS0
    ADDRESS = BASE_ADDRESS + 0x118_u64

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

    # IN endpoint TxFIFO space              avail
    def ineptfsav : UInt16
      UInt16.new!((@value >> 0) & 0xffff_u32)
    end

    # IN endpoint TxFIFO space              avail
    def self.ineptfsav : UInt16
      value.ineptfsav
    end
  end # struct

  # OTG_HS device IN endpoint transmit FIFO          status register
  struct OTG_HS_DTXFSTS1
    ADDRESS = BASE_ADDRESS + 0x138_u64

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

    # IN endpoint TxFIFO space              avail
    def ineptfsav : UInt16
      UInt16.new!((@value >> 0) & 0xffff_u32)
    end

    # IN endpoint TxFIFO space              avail
    def self.ineptfsav : UInt16
      value.ineptfsav
    end
  end # struct

  # OTG_HS device IN endpoint transmit FIFO          status register
  struct OTG_HS_DTXFSTS2
    ADDRESS = BASE_ADDRESS + 0x158_u64

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

    # IN endpoint TxFIFO space              avail
    def ineptfsav : UInt16
      UInt16.new!((@value >> 0) & 0xffff_u32)
    end

    # IN endpoint TxFIFO space              avail
    def self.ineptfsav : UInt16
      value.ineptfsav
    end
  end # struct

  # OTG_HS device IN endpoint transmit FIFO          status register
  struct OTG_HS_DTXFSTS3
    ADDRESS = BASE_ADDRESS + 0x178_u64

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

    # IN endpoint TxFIFO space              avail
    def ineptfsav : UInt16
      UInt16.new!((@value >> 0) & 0xffff_u32)
    end

    # IN endpoint TxFIFO space              avail
    def self.ineptfsav : UInt16
      value.ineptfsav
    end
  end # struct

  # OTG_HS device IN endpoint transmit FIFO          status register
  struct OTG_HS_DTXFSTS4
    ADDRESS = BASE_ADDRESS + 0x198_u64

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

    # IN endpoint TxFIFO space              avail
    def ineptfsav : UInt16
      UInt16.new!((@value >> 0) & 0xffff_u32)
    end

    # IN endpoint TxFIFO space              avail
    def self.ineptfsav : UInt16
      value.ineptfsav
    end
  end # struct

  # OTG_HS device IN endpoint transmit FIFO          status register
  struct OTG_HS_DTXFSTS5
    ADDRESS = BASE_ADDRESS + 0x1b8_u64

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

    # IN endpoint TxFIFO space              avail
    def ineptfsav : UInt16
      UInt16.new!((@value >> 0) & 0xffff_u32)
    end

    # IN endpoint TxFIFO space              avail
    def self.ineptfsav : UInt16
      value.ineptfsav
    end
  end # struct

  # OTG_HS device endpoint transfer size          register
  struct OTG_HS_DIEPTSIZ1
    ADDRESS = BASE_ADDRESS + 0x130_u64

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

    # Transfer size
    def xfrsiz : UInt32
      UInt32.new!((@value >> 0) & 0x7ffff_u32)
    end

    # Transfer size
    def self.xfrsiz : UInt32
      value.xfrsiz
    end

    # Transfer size
    def self.xfrsiz=(value : UInt32) : UInt32
      self.set(xfrsiz: value)
      value
    end

    # Packet count
    def pktcnt : UInt16
      UInt16.new!((@value >> 19) & 0x3ff_u32)
    end

    # Packet count
    def self.pktcnt : UInt16
      value.pktcnt
    end

    # Packet count
    def self.pktcnt=(value : UInt16) : UInt16
      self.set(pktcnt: value)
      value
    end

    # Multi count
    def mcnt : UInt8
      UInt8.new!((@value >> 29) & 0x3_u32)
    end

    # Multi count
    def self.mcnt : UInt8
      value.mcnt
    end

    # Multi count
    def self.mcnt=(value : UInt8) : UInt8
      self.set(mcnt: value)
      value
    end

    def copy_with(
      *,

      xfrsiz : UInt32? = nil,

      pktcnt : UInt16? = nil,

      mcnt : UInt8? = nil
    ) : self
      value = @value

      unless xfrsiz.nil?
        value = (value & 0xfff80000_u32) |
                UInt32.new!(xfrsiz.to_int).&(0x7ffff_u32) << 0
      end

      unless pktcnt.nil?
        value = (value & 0xe007ffff_u32) |
                UInt32.new!(pktcnt.to_int).&(0x3ff_u32) << 19
      end

      unless mcnt.nil?
        value = (value & 0x9fffffff_u32) |
                UInt32.new!(mcnt.to_int).&(0x3_u32) << 29
      end

      self.class.new(value)
    end

    def self.set(
      *,
      xfrsiz : UInt32? = nil,
      pktcnt : UInt16? = nil,
      mcnt : UInt8? = nil
    ) : Nil
      self.value = self.value.copy_with(
        xfrsiz: xfrsiz,
        pktcnt: pktcnt,
        mcnt: mcnt,
      )
    end
  end # struct

  # OTG_HS device endpoint transfer size          register
  struct OTG_HS_DIEPTSIZ2
    ADDRESS = BASE_ADDRESS + 0x150_u64

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

    # Transfer size
    def xfrsiz : UInt32
      UInt32.new!((@value >> 0) & 0x7ffff_u32)
    end

    # Transfer size
    def self.xfrsiz : UInt32
      value.xfrsiz
    end

    # Transfer size
    def self.xfrsiz=(value : UInt32) : UInt32
      self.set(xfrsiz: value)
      value
    end

    # Packet count
    def pktcnt : UInt16
      UInt16.new!((@value >> 19) & 0x3ff_u32)
    end

    # Packet count
    def self.pktcnt : UInt16
      value.pktcnt
    end

    # Packet count
    def self.pktcnt=(value : UInt16) : UInt16
      self.set(pktcnt: value)
      value
    end

    # Multi count
    def mcnt : UInt8
      UInt8.new!((@value >> 29) & 0x3_u32)
    end

    # Multi count
    def self.mcnt : UInt8
      value.mcnt
    end

    # Multi count
    def self.mcnt=(value : UInt8) : UInt8
      self.set(mcnt: value)
      value
    end

    def copy_with(
      *,

      xfrsiz : UInt32? = nil,

      pktcnt : UInt16? = nil,

      mcnt : UInt8? = nil
    ) : self
      value = @value

      unless xfrsiz.nil?
        value = (value & 0xfff80000_u32) |
                UInt32.new!(xfrsiz.to_int).&(0x7ffff_u32) << 0
      end

      unless pktcnt.nil?
        value = (value & 0xe007ffff_u32) |
                UInt32.new!(pktcnt.to_int).&(0x3ff_u32) << 19
      end

      unless mcnt.nil?
        value = (value & 0x9fffffff_u32) |
                UInt32.new!(mcnt.to_int).&(0x3_u32) << 29
      end

      self.class.new(value)
    end

    def self.set(
      *,
      xfrsiz : UInt32? = nil,
      pktcnt : UInt16? = nil,
      mcnt : UInt8? = nil
    ) : Nil
      self.value = self.value.copy_with(
        xfrsiz: xfrsiz,
        pktcnt: pktcnt,
        mcnt: mcnt,
      )
    end
  end # struct

  # OTG_HS device endpoint transfer size          register
  struct OTG_HS_DIEPTSIZ3
    ADDRESS = BASE_ADDRESS + 0x170_u64

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

    # Transfer size
    def xfrsiz : UInt32
      UInt32.new!((@value >> 0) & 0x7ffff_u32)
    end

    # Transfer size
    def self.xfrsiz : UInt32
      value.xfrsiz
    end

    # Transfer size
    def self.xfrsiz=(value : UInt32) : UInt32
      self.set(xfrsiz: value)
      value
    end

    # Packet count
    def pktcnt : UInt16
      UInt16.new!((@value >> 19) & 0x3ff_u32)
    end

    # Packet count
    def self.pktcnt : UInt16
      value.pktcnt
    end

    # Packet count
    def self.pktcnt=(value : UInt16) : UInt16
      self.set(pktcnt: value)
      value
    end

    # Multi count
    def mcnt : UInt8
      UInt8.new!((@value >> 29) & 0x3_u32)
    end

    # Multi count
    def self.mcnt : UInt8
      value.mcnt
    end

    # Multi count
    def self.mcnt=(value : UInt8) : UInt8
      self.set(mcnt: value)
      value
    end

    def copy_with(
      *,

      xfrsiz : UInt32? = nil,

      pktcnt : UInt16? = nil,

      mcnt : UInt8? = nil
    ) : self
      value = @value

      unless xfrsiz.nil?
        value = (value & 0xfff80000_u32) |
                UInt32.new!(xfrsiz.to_int).&(0x7ffff_u32) << 0
      end

      unless pktcnt.nil?
        value = (value & 0xe007ffff_u32) |
                UInt32.new!(pktcnt.to_int).&(0x3ff_u32) << 19
      end

      unless mcnt.nil?
        value = (value & 0x9fffffff_u32) |
                UInt32.new!(mcnt.to_int).&(0x3_u32) << 29
      end

      self.class.new(value)
    end

    def self.set(
      *,
      xfrsiz : UInt32? = nil,
      pktcnt : UInt16? = nil,
      mcnt : UInt8? = nil
    ) : Nil
      self.value = self.value.copy_with(
        xfrsiz: xfrsiz,
        pktcnt: pktcnt,
        mcnt: mcnt,
      )
    end
  end # struct

  # OTG_HS device endpoint transfer size          register
  struct OTG_HS_DIEPTSIZ4
    ADDRESS = BASE_ADDRESS + 0x190_u64

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

    # Transfer size
    def xfrsiz : UInt32
      UInt32.new!((@value >> 0) & 0x7ffff_u32)
    end

    # Transfer size
    def self.xfrsiz : UInt32
      value.xfrsiz
    end

    # Transfer size
    def self.xfrsiz=(value : UInt32) : UInt32
      self.set(xfrsiz: value)
      value
    end

    # Packet count
    def pktcnt : UInt16
      UInt16.new!((@value >> 19) & 0x3ff_u32)
    end

    # Packet count
    def self.pktcnt : UInt16
      value.pktcnt
    end

    # Packet count
    def self.pktcnt=(value : UInt16) : UInt16
      self.set(pktcnt: value)
      value
    end

    # Multi count
    def mcnt : UInt8
      UInt8.new!((@value >> 29) & 0x3_u32)
    end

    # Multi count
    def self.mcnt : UInt8
      value.mcnt
    end

    # Multi count
    def self.mcnt=(value : UInt8) : UInt8
      self.set(mcnt: value)
      value
    end

    def copy_with(
      *,

      xfrsiz : UInt32? = nil,

      pktcnt : UInt16? = nil,

      mcnt : UInt8? = nil
    ) : self
      value = @value

      unless xfrsiz.nil?
        value = (value & 0xfff80000_u32) |
                UInt32.new!(xfrsiz.to_int).&(0x7ffff_u32) << 0
      end

      unless pktcnt.nil?
        value = (value & 0xe007ffff_u32) |
                UInt32.new!(pktcnt.to_int).&(0x3ff_u32) << 19
      end

      unless mcnt.nil?
        value = (value & 0x9fffffff_u32) |
                UInt32.new!(mcnt.to_int).&(0x3_u32) << 29
      end

      self.class.new(value)
    end

    def self.set(
      *,
      xfrsiz : UInt32? = nil,
      pktcnt : UInt16? = nil,
      mcnt : UInt8? = nil
    ) : Nil
      self.value = self.value.copy_with(
        xfrsiz: xfrsiz,
        pktcnt: pktcnt,
        mcnt: mcnt,
      )
    end
  end # struct

  # OTG_HS device endpoint transfer size          register
  struct OTG_HS_DIEPTSIZ5
    ADDRESS = BASE_ADDRESS + 0x1b0_u64

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

    # Transfer size
    def xfrsiz : UInt32
      UInt32.new!((@value >> 0) & 0x7ffff_u32)
    end

    # Transfer size
    def self.xfrsiz : UInt32
      value.xfrsiz
    end

    # Transfer size
    def self.xfrsiz=(value : UInt32) : UInt32
      self.set(xfrsiz: value)
      value
    end

    # Packet count
    def pktcnt : UInt16
      UInt16.new!((@value >> 19) & 0x3ff_u32)
    end

    # Packet count
    def self.pktcnt : UInt16
      value.pktcnt
    end

    # Packet count
    def self.pktcnt=(value : UInt16) : UInt16
      self.set(pktcnt: value)
      value
    end

    # Multi count
    def mcnt : UInt8
      UInt8.new!((@value >> 29) & 0x3_u32)
    end

    # Multi count
    def self.mcnt : UInt8
      value.mcnt
    end

    # Multi count
    def self.mcnt=(value : UInt8) : UInt8
      self.set(mcnt: value)
      value
    end

    def copy_with(
      *,

      xfrsiz : UInt32? = nil,

      pktcnt : UInt16? = nil,

      mcnt : UInt8? = nil
    ) : self
      value = @value

      unless xfrsiz.nil?
        value = (value & 0xfff80000_u32) |
                UInt32.new!(xfrsiz.to_int).&(0x7ffff_u32) << 0
      end

      unless pktcnt.nil?
        value = (value & 0xe007ffff_u32) |
                UInt32.new!(pktcnt.to_int).&(0x3ff_u32) << 19
      end

      unless mcnt.nil?
        value = (value & 0x9fffffff_u32) |
                UInt32.new!(mcnt.to_int).&(0x3_u32) << 29
      end

      self.class.new(value)
    end

    def self.set(
      *,
      xfrsiz : UInt32? = nil,
      pktcnt : UInt16? = nil,
      mcnt : UInt8? = nil
    ) : Nil
      self.value = self.value.copy_with(
        xfrsiz: xfrsiz,
        pktcnt: pktcnt,
        mcnt: mcnt,
      )
    end
  end # struct

  # OTG_HS device control OUT endpoint 0 control          register
  struct OTG_HS_DOEPCTL0
    ADDRESS = BASE_ADDRESS + 0x300_u64

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
      new(0x8000_u64)
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

    # Maximum packet size
    def mpsiz : UInt8
      UInt8.new!((@value >> 0) & 0x3_u32)
    end

    # Maximum packet size
    def self.mpsiz : UInt8
      value.mpsiz
    end

    # USB active endpoint
    def usbaep : Bool
      @value.bits_set?(0x8000_u32)
    end

    # USB active endpoint
    def self.usbaep : Bool
      value.usbaep
    end

    # NAK status
    def naksts : Bool
      @value.bits_set?(0x20000_u32)
    end

    # NAK status
    def self.naksts : Bool
      value.naksts
    end

    # Endpoint type
    def eptyp : UInt8
      UInt8.new!((@value >> 18) & 0x3_u32)
    end

    # Endpoint type
    def self.eptyp : UInt8
      value.eptyp
    end

    # Snoop mode
    def snpm : Bool
      @value.bits_set?(0x100000_u32)
    end

    # Snoop mode
    def self.snpm : Bool
      value.snpm
    end

    # Snoop mode
    def self.snpm=(value : Bool) : Bool
      self.set(snpm: value)
      value
    end

    # STALL handshake
    def stall : Bool
      @value.bits_set?(0x200000_u32)
    end

    # STALL handshake
    def self.stall : Bool
      value.stall
    end

    # STALL handshake
    def self.stall=(value : Bool) : Bool
      self.set(stall: value)
      value
    end

    # Clear NAK
    def self.cnak=(value : Bool) : Bool
      self.set(cnak: value)
      value
    end

    # Set NAK
    def self.snak=(value : Bool) : Bool
      self.set(snak: value)
      value
    end

    # Endpoint disable
    def epdis : Bool
      @value.bits_set?(0x40000000_u32)
    end

    # Endpoint disable
    def self.epdis : Bool
      value.epdis
    end

    # Endpoint enable
    def self.epena=(value : Bool) : Bool
      self.set(epena: value)
      value
    end

    def copy_with(
      *,

      snpm : Bool? = nil,

      stall : Bool? = nil,

      cnak : Bool? = nil,

      snak : Bool? = nil,

      epena : Bool? = nil
    ) : self
      value = @value

      unless snpm.nil?
        value = (value & 0xffefffff_u32) |
                UInt32.new!(snpm.to_int).&(0x1_u32) << 20
      end

      unless stall.nil?
        value = (value & 0xffdfffff_u32) |
                UInt32.new!(stall.to_int).&(0x1_u32) << 21
      end

      unless cnak.nil?
        value = (value & 0xfbffffff_u32) |
                UInt32.new!(cnak.to_int).&(0x1_u32) << 26
      end

      unless snak.nil?
        value = (value & 0xf7ffffff_u32) |
                UInt32.new!(snak.to_int).&(0x1_u32) << 27
      end

      unless epena.nil?
        value = (value & 0x7fffffff_u32) |
                UInt32.new!(epena.to_int).&(0x1_u32) << 31
      end

      self.class.new(value)
    end

    def self.set(
      *,
      snpm : Bool? = nil,
      stall : Bool? = nil,
      cnak : Bool? = nil,
      snak : Bool? = nil,
      epena : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        snpm: snpm,
        stall: stall,
        cnak: cnak,
        snak: snak,
        epena: epena,
      )
    end
  end # struct

  # OTG device endpoint-1 control          register
  struct OTG_HS_DOEPCTL1
    ADDRESS = BASE_ADDRESS + 0x320_u64

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

    # Maximum packet size
    def mpsiz : UInt16
      UInt16.new!((@value >> 0) & 0x7ff_u32)
    end

    # Maximum packet size
    def self.mpsiz : UInt16
      value.mpsiz
    end

    # Maximum packet size
    def self.mpsiz=(value : UInt16) : UInt16
      self.set(mpsiz: value)
      value
    end

    # USB active endpoint
    def usbaep : Bool
      @value.bits_set?(0x8000_u32)
    end

    # USB active endpoint
    def self.usbaep : Bool
      value.usbaep
    end

    # USB active endpoint
    def self.usbaep=(value : Bool) : Bool
      self.set(usbaep: value)
      value
    end

    # Even odd frame/Endpoint data              PID
    def eonum_dpid : Bool
      @value.bits_set?(0x10000_u32)
    end

    # Even odd frame/Endpoint data              PID
    def self.eonum_dpid : Bool
      value.eonum_dpid
    end

    # NAK status
    def naksts : Bool
      @value.bits_set?(0x20000_u32)
    end

    # NAK status
    def self.naksts : Bool
      value.naksts
    end

    # Endpoint type
    def eptyp : UInt8
      UInt8.new!((@value >> 18) & 0x3_u32)
    end

    # Endpoint type
    def self.eptyp : UInt8
      value.eptyp
    end

    # Endpoint type
    def self.eptyp=(value : UInt8) : UInt8
      self.set(eptyp: value)
      value
    end

    # Snoop mode
    def snpm : Bool
      @value.bits_set?(0x100000_u32)
    end

    # Snoop mode
    def self.snpm : Bool
      value.snpm
    end

    # Snoop mode
    def self.snpm=(value : Bool) : Bool
      self.set(snpm: value)
      value
    end

    # STALL handshake
    def stall : Bool
      @value.bits_set?(0x200000_u32)
    end

    # STALL handshake
    def self.stall : Bool
      value.stall
    end

    # STALL handshake
    def self.stall=(value : Bool) : Bool
      self.set(stall: value)
      value
    end

    # Clear NAK
    def self.cnak=(value : Bool) : Bool
      self.set(cnak: value)
      value
    end

    # Set NAK
    def self.snak=(value : Bool) : Bool
      self.set(snak: value)
      value
    end

    # Set DATA0 PID/Set even              frame
    def self.sd0_pid_sevnfrm=(value : Bool) : Bool
      self.set(sd0_pid_sevnfrm: value)
      value
    end

    # Set odd frame
    def self.soddfrm=(value : Bool) : Bool
      self.set(soddfrm: value)
      value
    end

    # Endpoint disable
    def epdis : Bool
      @value.bits_set?(0x40000000_u32)
    end

    # Endpoint disable
    def self.epdis : Bool
      value.epdis
    end

    # Endpoint disable
    def self.epdis=(value : Bool) : Bool
      self.set(epdis: value)
      value
    end

    # Endpoint enable
    def epena : Bool
      @value.bits_set?(0x80000000_u32)
    end

    # Endpoint enable
    def self.epena : Bool
      value.epena
    end

    # Endpoint enable
    def self.epena=(value : Bool) : Bool
      self.set(epena: value)
      value
    end

    def copy_with(
      *,

      mpsiz : UInt16? = nil,

      usbaep : Bool? = nil,

      eptyp : UInt8? = nil,

      snpm : Bool? = nil,

      stall : Bool? = nil,

      cnak : Bool? = nil,

      snak : Bool? = nil,

      sd0_pid_sevnfrm : Bool? = nil,

      soddfrm : Bool? = nil,

      epdis : Bool? = nil,

      epena : Bool? = nil
    ) : self
      value = @value

      unless mpsiz.nil?
        value = (value & 0xfffff800_u32) |
                UInt32.new!(mpsiz.to_int).&(0x7ff_u32) << 0
      end

      unless usbaep.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(usbaep.to_int).&(0x1_u32) << 15
      end

      unless eptyp.nil?
        value = (value & 0xfff3ffff_u32) |
                UInt32.new!(eptyp.to_int).&(0x3_u32) << 18
      end

      unless snpm.nil?
        value = (value & 0xffefffff_u32) |
                UInt32.new!(snpm.to_int).&(0x1_u32) << 20
      end

      unless stall.nil?
        value = (value & 0xffdfffff_u32) |
                UInt32.new!(stall.to_int).&(0x1_u32) << 21
      end

      unless cnak.nil?
        value = (value & 0xfbffffff_u32) |
                UInt32.new!(cnak.to_int).&(0x1_u32) << 26
      end

      unless snak.nil?
        value = (value & 0xf7ffffff_u32) |
                UInt32.new!(snak.to_int).&(0x1_u32) << 27
      end

      unless sd0_pid_sevnfrm.nil?
        value = (value & 0xefffffff_u32) |
                UInt32.new!(sd0_pid_sevnfrm.to_int).&(0x1_u32) << 28
      end

      unless soddfrm.nil?
        value = (value & 0xdfffffff_u32) |
                UInt32.new!(soddfrm.to_int).&(0x1_u32) << 29
      end

      unless epdis.nil?
        value = (value & 0xbfffffff_u32) |
                UInt32.new!(epdis.to_int).&(0x1_u32) << 30
      end

      unless epena.nil?
        value = (value & 0x7fffffff_u32) |
                UInt32.new!(epena.to_int).&(0x1_u32) << 31
      end

      self.class.new(value)
    end

    def self.set(
      *,
      mpsiz : UInt16? = nil,
      usbaep : Bool? = nil,
      eptyp : UInt8? = nil,
      snpm : Bool? = nil,
      stall : Bool? = nil,
      cnak : Bool? = nil,
      snak : Bool? = nil,
      sd0_pid_sevnfrm : Bool? = nil,
      soddfrm : Bool? = nil,
      epdis : Bool? = nil,
      epena : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        mpsiz: mpsiz,
        usbaep: usbaep,
        eptyp: eptyp,
        snpm: snpm,
        stall: stall,
        cnak: cnak,
        snak: snak,
        sd0_pid_sevnfrm: sd0_pid_sevnfrm,
        soddfrm: soddfrm,
        epdis: epdis,
        epena: epena,
      )
    end
  end # struct

  # OTG device endpoint-2 control          register
  struct OTG_HS_DOEPCTL2
    ADDRESS = BASE_ADDRESS + 0x340_u64

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

    # Maximum packet size
    def mpsiz : UInt16
      UInt16.new!((@value >> 0) & 0x7ff_u32)
    end

    # Maximum packet size
    def self.mpsiz : UInt16
      value.mpsiz
    end

    # Maximum packet size
    def self.mpsiz=(value : UInt16) : UInt16
      self.set(mpsiz: value)
      value
    end

    # USB active endpoint
    def usbaep : Bool
      @value.bits_set?(0x8000_u32)
    end

    # USB active endpoint
    def self.usbaep : Bool
      value.usbaep
    end

    # USB active endpoint
    def self.usbaep=(value : Bool) : Bool
      self.set(usbaep: value)
      value
    end

    # Even odd frame/Endpoint data              PID
    def eonum_dpid : Bool
      @value.bits_set?(0x10000_u32)
    end

    # Even odd frame/Endpoint data              PID
    def self.eonum_dpid : Bool
      value.eonum_dpid
    end

    # NAK status
    def naksts : Bool
      @value.bits_set?(0x20000_u32)
    end

    # NAK status
    def self.naksts : Bool
      value.naksts
    end

    # Endpoint type
    def eptyp : UInt8
      UInt8.new!((@value >> 18) & 0x3_u32)
    end

    # Endpoint type
    def self.eptyp : UInt8
      value.eptyp
    end

    # Endpoint type
    def self.eptyp=(value : UInt8) : UInt8
      self.set(eptyp: value)
      value
    end

    # Snoop mode
    def snpm : Bool
      @value.bits_set?(0x100000_u32)
    end

    # Snoop mode
    def self.snpm : Bool
      value.snpm
    end

    # Snoop mode
    def self.snpm=(value : Bool) : Bool
      self.set(snpm: value)
      value
    end

    # STALL handshake
    def stall : Bool
      @value.bits_set?(0x200000_u32)
    end

    # STALL handshake
    def self.stall : Bool
      value.stall
    end

    # STALL handshake
    def self.stall=(value : Bool) : Bool
      self.set(stall: value)
      value
    end

    # Clear NAK
    def self.cnak=(value : Bool) : Bool
      self.set(cnak: value)
      value
    end

    # Set NAK
    def self.snak=(value : Bool) : Bool
      self.set(snak: value)
      value
    end

    # Set DATA0 PID/Set even              frame
    def self.sd0_pid_sevnfrm=(value : Bool) : Bool
      self.set(sd0_pid_sevnfrm: value)
      value
    end

    # Set odd frame
    def self.soddfrm=(value : Bool) : Bool
      self.set(soddfrm: value)
      value
    end

    # Endpoint disable
    def epdis : Bool
      @value.bits_set?(0x40000000_u32)
    end

    # Endpoint disable
    def self.epdis : Bool
      value.epdis
    end

    # Endpoint disable
    def self.epdis=(value : Bool) : Bool
      self.set(epdis: value)
      value
    end

    # Endpoint enable
    def epena : Bool
      @value.bits_set?(0x80000000_u32)
    end

    # Endpoint enable
    def self.epena : Bool
      value.epena
    end

    # Endpoint enable
    def self.epena=(value : Bool) : Bool
      self.set(epena: value)
      value
    end

    def copy_with(
      *,

      mpsiz : UInt16? = nil,

      usbaep : Bool? = nil,

      eptyp : UInt8? = nil,

      snpm : Bool? = nil,

      stall : Bool? = nil,

      cnak : Bool? = nil,

      snak : Bool? = nil,

      sd0_pid_sevnfrm : Bool? = nil,

      soddfrm : Bool? = nil,

      epdis : Bool? = nil,

      epena : Bool? = nil
    ) : self
      value = @value

      unless mpsiz.nil?
        value = (value & 0xfffff800_u32) |
                UInt32.new!(mpsiz.to_int).&(0x7ff_u32) << 0
      end

      unless usbaep.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(usbaep.to_int).&(0x1_u32) << 15
      end

      unless eptyp.nil?
        value = (value & 0xfff3ffff_u32) |
                UInt32.new!(eptyp.to_int).&(0x3_u32) << 18
      end

      unless snpm.nil?
        value = (value & 0xffefffff_u32) |
                UInt32.new!(snpm.to_int).&(0x1_u32) << 20
      end

      unless stall.nil?
        value = (value & 0xffdfffff_u32) |
                UInt32.new!(stall.to_int).&(0x1_u32) << 21
      end

      unless cnak.nil?
        value = (value & 0xfbffffff_u32) |
                UInt32.new!(cnak.to_int).&(0x1_u32) << 26
      end

      unless snak.nil?
        value = (value & 0xf7ffffff_u32) |
                UInt32.new!(snak.to_int).&(0x1_u32) << 27
      end

      unless sd0_pid_sevnfrm.nil?
        value = (value & 0xefffffff_u32) |
                UInt32.new!(sd0_pid_sevnfrm.to_int).&(0x1_u32) << 28
      end

      unless soddfrm.nil?
        value = (value & 0xdfffffff_u32) |
                UInt32.new!(soddfrm.to_int).&(0x1_u32) << 29
      end

      unless epdis.nil?
        value = (value & 0xbfffffff_u32) |
                UInt32.new!(epdis.to_int).&(0x1_u32) << 30
      end

      unless epena.nil?
        value = (value & 0x7fffffff_u32) |
                UInt32.new!(epena.to_int).&(0x1_u32) << 31
      end

      self.class.new(value)
    end

    def self.set(
      *,
      mpsiz : UInt16? = nil,
      usbaep : Bool? = nil,
      eptyp : UInt8? = nil,
      snpm : Bool? = nil,
      stall : Bool? = nil,
      cnak : Bool? = nil,
      snak : Bool? = nil,
      sd0_pid_sevnfrm : Bool? = nil,
      soddfrm : Bool? = nil,
      epdis : Bool? = nil,
      epena : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        mpsiz: mpsiz,
        usbaep: usbaep,
        eptyp: eptyp,
        snpm: snpm,
        stall: stall,
        cnak: cnak,
        snak: snak,
        sd0_pid_sevnfrm: sd0_pid_sevnfrm,
        soddfrm: soddfrm,
        epdis: epdis,
        epena: epena,
      )
    end
  end # struct

  # OTG device endpoint-3 control          register
  struct OTG_HS_DOEPCTL3
    ADDRESS = BASE_ADDRESS + 0x360_u64

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

    # Maximum packet size
    def mpsiz : UInt16
      UInt16.new!((@value >> 0) & 0x7ff_u32)
    end

    # Maximum packet size
    def self.mpsiz : UInt16
      value.mpsiz
    end

    # Maximum packet size
    def self.mpsiz=(value : UInt16) : UInt16
      self.set(mpsiz: value)
      value
    end

    # USB active endpoint
    def usbaep : Bool
      @value.bits_set?(0x8000_u32)
    end

    # USB active endpoint
    def self.usbaep : Bool
      value.usbaep
    end

    # USB active endpoint
    def self.usbaep=(value : Bool) : Bool
      self.set(usbaep: value)
      value
    end

    # Even odd frame/Endpoint data              PID
    def eonum_dpid : Bool
      @value.bits_set?(0x10000_u32)
    end

    # Even odd frame/Endpoint data              PID
    def self.eonum_dpid : Bool
      value.eonum_dpid
    end

    # NAK status
    def naksts : Bool
      @value.bits_set?(0x20000_u32)
    end

    # NAK status
    def self.naksts : Bool
      value.naksts
    end

    # Endpoint type
    def eptyp : UInt8
      UInt8.new!((@value >> 18) & 0x3_u32)
    end

    # Endpoint type
    def self.eptyp : UInt8
      value.eptyp
    end

    # Endpoint type
    def self.eptyp=(value : UInt8) : UInt8
      self.set(eptyp: value)
      value
    end

    # Snoop mode
    def snpm : Bool
      @value.bits_set?(0x100000_u32)
    end

    # Snoop mode
    def self.snpm : Bool
      value.snpm
    end

    # Snoop mode
    def self.snpm=(value : Bool) : Bool
      self.set(snpm: value)
      value
    end

    # STALL handshake
    def stall : Bool
      @value.bits_set?(0x200000_u32)
    end

    # STALL handshake
    def self.stall : Bool
      value.stall
    end

    # STALL handshake
    def self.stall=(value : Bool) : Bool
      self.set(stall: value)
      value
    end

    # Clear NAK
    def self.cnak=(value : Bool) : Bool
      self.set(cnak: value)
      value
    end

    # Set NAK
    def self.snak=(value : Bool) : Bool
      self.set(snak: value)
      value
    end

    # Set DATA0 PID/Set even              frame
    def self.sd0_pid_sevnfrm=(value : Bool) : Bool
      self.set(sd0_pid_sevnfrm: value)
      value
    end

    # Set odd frame
    def self.soddfrm=(value : Bool) : Bool
      self.set(soddfrm: value)
      value
    end

    # Endpoint disable
    def epdis : Bool
      @value.bits_set?(0x40000000_u32)
    end

    # Endpoint disable
    def self.epdis : Bool
      value.epdis
    end

    # Endpoint disable
    def self.epdis=(value : Bool) : Bool
      self.set(epdis: value)
      value
    end

    # Endpoint enable
    def epena : Bool
      @value.bits_set?(0x80000000_u32)
    end

    # Endpoint enable
    def self.epena : Bool
      value.epena
    end

    # Endpoint enable
    def self.epena=(value : Bool) : Bool
      self.set(epena: value)
      value
    end

    def copy_with(
      *,

      mpsiz : UInt16? = nil,

      usbaep : Bool? = nil,

      eptyp : UInt8? = nil,

      snpm : Bool? = nil,

      stall : Bool? = nil,

      cnak : Bool? = nil,

      snak : Bool? = nil,

      sd0_pid_sevnfrm : Bool? = nil,

      soddfrm : Bool? = nil,

      epdis : Bool? = nil,

      epena : Bool? = nil
    ) : self
      value = @value

      unless mpsiz.nil?
        value = (value & 0xfffff800_u32) |
                UInt32.new!(mpsiz.to_int).&(0x7ff_u32) << 0
      end

      unless usbaep.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(usbaep.to_int).&(0x1_u32) << 15
      end

      unless eptyp.nil?
        value = (value & 0xfff3ffff_u32) |
                UInt32.new!(eptyp.to_int).&(0x3_u32) << 18
      end

      unless snpm.nil?
        value = (value & 0xffefffff_u32) |
                UInt32.new!(snpm.to_int).&(0x1_u32) << 20
      end

      unless stall.nil?
        value = (value & 0xffdfffff_u32) |
                UInt32.new!(stall.to_int).&(0x1_u32) << 21
      end

      unless cnak.nil?
        value = (value & 0xfbffffff_u32) |
                UInt32.new!(cnak.to_int).&(0x1_u32) << 26
      end

      unless snak.nil?
        value = (value & 0xf7ffffff_u32) |
                UInt32.new!(snak.to_int).&(0x1_u32) << 27
      end

      unless sd0_pid_sevnfrm.nil?
        value = (value & 0xefffffff_u32) |
                UInt32.new!(sd0_pid_sevnfrm.to_int).&(0x1_u32) << 28
      end

      unless soddfrm.nil?
        value = (value & 0xdfffffff_u32) |
                UInt32.new!(soddfrm.to_int).&(0x1_u32) << 29
      end

      unless epdis.nil?
        value = (value & 0xbfffffff_u32) |
                UInt32.new!(epdis.to_int).&(0x1_u32) << 30
      end

      unless epena.nil?
        value = (value & 0x7fffffff_u32) |
                UInt32.new!(epena.to_int).&(0x1_u32) << 31
      end

      self.class.new(value)
    end

    def self.set(
      *,
      mpsiz : UInt16? = nil,
      usbaep : Bool? = nil,
      eptyp : UInt8? = nil,
      snpm : Bool? = nil,
      stall : Bool? = nil,
      cnak : Bool? = nil,
      snak : Bool? = nil,
      sd0_pid_sevnfrm : Bool? = nil,
      soddfrm : Bool? = nil,
      epdis : Bool? = nil,
      epena : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        mpsiz: mpsiz,
        usbaep: usbaep,
        eptyp: eptyp,
        snpm: snpm,
        stall: stall,
        cnak: cnak,
        snak: snak,
        sd0_pid_sevnfrm: sd0_pid_sevnfrm,
        soddfrm: soddfrm,
        epdis: epdis,
        epena: epena,
      )
    end
  end # struct

  # OTG_HS device endpoint-0 interrupt          register
  struct OTG_HS_DOEPINT0
    ADDRESS = BASE_ADDRESS + 0x308_u64

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

    # Transfer completed              interrupt
    def xfrc : Bool
      @value.bits_set?(0x1_u32)
    end

    # Transfer completed              interrupt
    def self.xfrc : Bool
      value.xfrc
    end

    # Transfer completed              interrupt
    def self.xfrc=(value : Bool) : Bool
      self.set(xfrc: value)
      value
    end

    # Endpoint disabled              interrupt
    def epdisd : Bool
      @value.bits_set?(0x2_u32)
    end

    # Endpoint disabled              interrupt
    def self.epdisd : Bool
      value.epdisd
    end

    # Endpoint disabled              interrupt
    def self.epdisd=(value : Bool) : Bool
      self.set(epdisd: value)
      value
    end

    # SETUP phase done
    def stup : Bool
      @value.bits_set?(0x8_u32)
    end

    # SETUP phase done
    def self.stup : Bool
      value.stup
    end

    # SETUP phase done
    def self.stup=(value : Bool) : Bool
      self.set(stup: value)
      value
    end

    # OUT token received when endpoint              disabled
    def otepdis : Bool
      @value.bits_set?(0x10_u32)
    end

    # OUT token received when endpoint              disabled
    def self.otepdis : Bool
      value.otepdis
    end

    # OUT token received when endpoint              disabled
    def self.otepdis=(value : Bool) : Bool
      self.set(otepdis: value)
      value
    end

    # Back-to-back SETUP packets              received
    def b2_bstup : Bool
      @value.bits_set?(0x40_u32)
    end

    # Back-to-back SETUP packets              received
    def self.b2_bstup : Bool
      value.b2_bstup
    end

    # Back-to-back SETUP packets              received
    def self.b2_bstup=(value : Bool) : Bool
      self.set(b2_bstup: value)
      value
    end

    # NYET interrupt
    def nyet : Bool
      @value.bits_set?(0x4000_u32)
    end

    # NYET interrupt
    def self.nyet : Bool
      value.nyet
    end

    # NYET interrupt
    def self.nyet=(value : Bool) : Bool
      self.set(nyet: value)
      value
    end

    def copy_with(
      *,

      xfrc : Bool? = nil,

      epdisd : Bool? = nil,

      stup : Bool? = nil,

      otepdis : Bool? = nil,

      b2_bstup : Bool? = nil,

      nyet : Bool? = nil
    ) : self
      value = @value

      unless xfrc.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(xfrc.to_int).&(0x1_u32) << 0
      end

      unless epdisd.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(epdisd.to_int).&(0x1_u32) << 1
      end

      unless stup.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(stup.to_int).&(0x1_u32) << 3
      end

      unless otepdis.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(otepdis.to_int).&(0x1_u32) << 4
      end

      unless b2_bstup.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(b2_bstup.to_int).&(0x1_u32) << 6
      end

      unless nyet.nil?
        value = (value & 0xffffbfff_u32) |
                UInt32.new!(nyet.to_int).&(0x1_u32) << 14
      end

      self.class.new(value)
    end

    def self.set(
      *,
      xfrc : Bool? = nil,
      epdisd : Bool? = nil,
      stup : Bool? = nil,
      otepdis : Bool? = nil,
      b2_bstup : Bool? = nil,
      nyet : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        xfrc: xfrc,
        epdisd: epdisd,
        stup: stup,
        otepdis: otepdis,
        b2_bstup: b2_bstup,
        nyet: nyet,
      )
    end
  end # struct

  # OTG_HS device endpoint-1 interrupt          register
  struct OTG_HS_DOEPINT1
    ADDRESS = BASE_ADDRESS + 0x328_u64

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

    # Transfer completed              interrupt
    def xfrc : Bool
      @value.bits_set?(0x1_u32)
    end

    # Transfer completed              interrupt
    def self.xfrc : Bool
      value.xfrc
    end

    # Transfer completed              interrupt
    def self.xfrc=(value : Bool) : Bool
      self.set(xfrc: value)
      value
    end

    # Endpoint disabled              interrupt
    def epdisd : Bool
      @value.bits_set?(0x2_u32)
    end

    # Endpoint disabled              interrupt
    def self.epdisd : Bool
      value.epdisd
    end

    # Endpoint disabled              interrupt
    def self.epdisd=(value : Bool) : Bool
      self.set(epdisd: value)
      value
    end

    # SETUP phase done
    def stup : Bool
      @value.bits_set?(0x8_u32)
    end

    # SETUP phase done
    def self.stup : Bool
      value.stup
    end

    # SETUP phase done
    def self.stup=(value : Bool) : Bool
      self.set(stup: value)
      value
    end

    # OUT token received when endpoint              disabled
    def otepdis : Bool
      @value.bits_set?(0x10_u32)
    end

    # OUT token received when endpoint              disabled
    def self.otepdis : Bool
      value.otepdis
    end

    # OUT token received when endpoint              disabled
    def self.otepdis=(value : Bool) : Bool
      self.set(otepdis: value)
      value
    end

    # Back-to-back SETUP packets              received
    def b2_bstup : Bool
      @value.bits_set?(0x40_u32)
    end

    # Back-to-back SETUP packets              received
    def self.b2_bstup : Bool
      value.b2_bstup
    end

    # Back-to-back SETUP packets              received
    def self.b2_bstup=(value : Bool) : Bool
      self.set(b2_bstup: value)
      value
    end

    # NYET interrupt
    def nyet : Bool
      @value.bits_set?(0x4000_u32)
    end

    # NYET interrupt
    def self.nyet : Bool
      value.nyet
    end

    # NYET interrupt
    def self.nyet=(value : Bool) : Bool
      self.set(nyet: value)
      value
    end

    def copy_with(
      *,

      xfrc : Bool? = nil,

      epdisd : Bool? = nil,

      stup : Bool? = nil,

      otepdis : Bool? = nil,

      b2_bstup : Bool? = nil,

      nyet : Bool? = nil
    ) : self
      value = @value

      unless xfrc.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(xfrc.to_int).&(0x1_u32) << 0
      end

      unless epdisd.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(epdisd.to_int).&(0x1_u32) << 1
      end

      unless stup.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(stup.to_int).&(0x1_u32) << 3
      end

      unless otepdis.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(otepdis.to_int).&(0x1_u32) << 4
      end

      unless b2_bstup.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(b2_bstup.to_int).&(0x1_u32) << 6
      end

      unless nyet.nil?
        value = (value & 0xffffbfff_u32) |
                UInt32.new!(nyet.to_int).&(0x1_u32) << 14
      end

      self.class.new(value)
    end

    def self.set(
      *,
      xfrc : Bool? = nil,
      epdisd : Bool? = nil,
      stup : Bool? = nil,
      otepdis : Bool? = nil,
      b2_bstup : Bool? = nil,
      nyet : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        xfrc: xfrc,
        epdisd: epdisd,
        stup: stup,
        otepdis: otepdis,
        b2_bstup: b2_bstup,
        nyet: nyet,
      )
    end
  end # struct

  # OTG_HS device endpoint-2 interrupt          register
  struct OTG_HS_DOEPINT2
    ADDRESS = BASE_ADDRESS + 0x348_u64

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

    # Transfer completed              interrupt
    def xfrc : Bool
      @value.bits_set?(0x1_u32)
    end

    # Transfer completed              interrupt
    def self.xfrc : Bool
      value.xfrc
    end

    # Transfer completed              interrupt
    def self.xfrc=(value : Bool) : Bool
      self.set(xfrc: value)
      value
    end

    # Endpoint disabled              interrupt
    def epdisd : Bool
      @value.bits_set?(0x2_u32)
    end

    # Endpoint disabled              interrupt
    def self.epdisd : Bool
      value.epdisd
    end

    # Endpoint disabled              interrupt
    def self.epdisd=(value : Bool) : Bool
      self.set(epdisd: value)
      value
    end

    # SETUP phase done
    def stup : Bool
      @value.bits_set?(0x8_u32)
    end

    # SETUP phase done
    def self.stup : Bool
      value.stup
    end

    # SETUP phase done
    def self.stup=(value : Bool) : Bool
      self.set(stup: value)
      value
    end

    # OUT token received when endpoint              disabled
    def otepdis : Bool
      @value.bits_set?(0x10_u32)
    end

    # OUT token received when endpoint              disabled
    def self.otepdis : Bool
      value.otepdis
    end

    # OUT token received when endpoint              disabled
    def self.otepdis=(value : Bool) : Bool
      self.set(otepdis: value)
      value
    end

    # Back-to-back SETUP packets              received
    def b2_bstup : Bool
      @value.bits_set?(0x40_u32)
    end

    # Back-to-back SETUP packets              received
    def self.b2_bstup : Bool
      value.b2_bstup
    end

    # Back-to-back SETUP packets              received
    def self.b2_bstup=(value : Bool) : Bool
      self.set(b2_bstup: value)
      value
    end

    # NYET interrupt
    def nyet : Bool
      @value.bits_set?(0x4000_u32)
    end

    # NYET interrupt
    def self.nyet : Bool
      value.nyet
    end

    # NYET interrupt
    def self.nyet=(value : Bool) : Bool
      self.set(nyet: value)
      value
    end

    def copy_with(
      *,

      xfrc : Bool? = nil,

      epdisd : Bool? = nil,

      stup : Bool? = nil,

      otepdis : Bool? = nil,

      b2_bstup : Bool? = nil,

      nyet : Bool? = nil
    ) : self
      value = @value

      unless xfrc.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(xfrc.to_int).&(0x1_u32) << 0
      end

      unless epdisd.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(epdisd.to_int).&(0x1_u32) << 1
      end

      unless stup.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(stup.to_int).&(0x1_u32) << 3
      end

      unless otepdis.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(otepdis.to_int).&(0x1_u32) << 4
      end

      unless b2_bstup.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(b2_bstup.to_int).&(0x1_u32) << 6
      end

      unless nyet.nil?
        value = (value & 0xffffbfff_u32) |
                UInt32.new!(nyet.to_int).&(0x1_u32) << 14
      end

      self.class.new(value)
    end

    def self.set(
      *,
      xfrc : Bool? = nil,
      epdisd : Bool? = nil,
      stup : Bool? = nil,
      otepdis : Bool? = nil,
      b2_bstup : Bool? = nil,
      nyet : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        xfrc: xfrc,
        epdisd: epdisd,
        stup: stup,
        otepdis: otepdis,
        b2_bstup: b2_bstup,
        nyet: nyet,
      )
    end
  end # struct

  # OTG_HS device endpoint-3 interrupt          register
  struct OTG_HS_DOEPINT3
    ADDRESS = BASE_ADDRESS + 0x368_u64

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

    # Transfer completed              interrupt
    def xfrc : Bool
      @value.bits_set?(0x1_u32)
    end

    # Transfer completed              interrupt
    def self.xfrc : Bool
      value.xfrc
    end

    # Transfer completed              interrupt
    def self.xfrc=(value : Bool) : Bool
      self.set(xfrc: value)
      value
    end

    # Endpoint disabled              interrupt
    def epdisd : Bool
      @value.bits_set?(0x2_u32)
    end

    # Endpoint disabled              interrupt
    def self.epdisd : Bool
      value.epdisd
    end

    # Endpoint disabled              interrupt
    def self.epdisd=(value : Bool) : Bool
      self.set(epdisd: value)
      value
    end

    # SETUP phase done
    def stup : Bool
      @value.bits_set?(0x8_u32)
    end

    # SETUP phase done
    def self.stup : Bool
      value.stup
    end

    # SETUP phase done
    def self.stup=(value : Bool) : Bool
      self.set(stup: value)
      value
    end

    # OUT token received when endpoint              disabled
    def otepdis : Bool
      @value.bits_set?(0x10_u32)
    end

    # OUT token received when endpoint              disabled
    def self.otepdis : Bool
      value.otepdis
    end

    # OUT token received when endpoint              disabled
    def self.otepdis=(value : Bool) : Bool
      self.set(otepdis: value)
      value
    end

    # Back-to-back SETUP packets              received
    def b2_bstup : Bool
      @value.bits_set?(0x40_u32)
    end

    # Back-to-back SETUP packets              received
    def self.b2_bstup : Bool
      value.b2_bstup
    end

    # Back-to-back SETUP packets              received
    def self.b2_bstup=(value : Bool) : Bool
      self.set(b2_bstup: value)
      value
    end

    # NYET interrupt
    def nyet : Bool
      @value.bits_set?(0x4000_u32)
    end

    # NYET interrupt
    def self.nyet : Bool
      value.nyet
    end

    # NYET interrupt
    def self.nyet=(value : Bool) : Bool
      self.set(nyet: value)
      value
    end

    def copy_with(
      *,

      xfrc : Bool? = nil,

      epdisd : Bool? = nil,

      stup : Bool? = nil,

      otepdis : Bool? = nil,

      b2_bstup : Bool? = nil,

      nyet : Bool? = nil
    ) : self
      value = @value

      unless xfrc.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(xfrc.to_int).&(0x1_u32) << 0
      end

      unless epdisd.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(epdisd.to_int).&(0x1_u32) << 1
      end

      unless stup.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(stup.to_int).&(0x1_u32) << 3
      end

      unless otepdis.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(otepdis.to_int).&(0x1_u32) << 4
      end

      unless b2_bstup.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(b2_bstup.to_int).&(0x1_u32) << 6
      end

      unless nyet.nil?
        value = (value & 0xffffbfff_u32) |
                UInt32.new!(nyet.to_int).&(0x1_u32) << 14
      end

      self.class.new(value)
    end

    def self.set(
      *,
      xfrc : Bool? = nil,
      epdisd : Bool? = nil,
      stup : Bool? = nil,
      otepdis : Bool? = nil,
      b2_bstup : Bool? = nil,
      nyet : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        xfrc: xfrc,
        epdisd: epdisd,
        stup: stup,
        otepdis: otepdis,
        b2_bstup: b2_bstup,
        nyet: nyet,
      )
    end
  end # struct

  # OTG_HS device endpoint-4 interrupt          register
  struct OTG_HS_DOEPINT4
    ADDRESS = BASE_ADDRESS + 0x388_u64

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

    # Transfer completed              interrupt
    def xfrc : Bool
      @value.bits_set?(0x1_u32)
    end

    # Transfer completed              interrupt
    def self.xfrc : Bool
      value.xfrc
    end

    # Transfer completed              interrupt
    def self.xfrc=(value : Bool) : Bool
      self.set(xfrc: value)
      value
    end

    # Endpoint disabled              interrupt
    def epdisd : Bool
      @value.bits_set?(0x2_u32)
    end

    # Endpoint disabled              interrupt
    def self.epdisd : Bool
      value.epdisd
    end

    # Endpoint disabled              interrupt
    def self.epdisd=(value : Bool) : Bool
      self.set(epdisd: value)
      value
    end

    # SETUP phase done
    def stup : Bool
      @value.bits_set?(0x8_u32)
    end

    # SETUP phase done
    def self.stup : Bool
      value.stup
    end

    # SETUP phase done
    def self.stup=(value : Bool) : Bool
      self.set(stup: value)
      value
    end

    # OUT token received when endpoint              disabled
    def otepdis : Bool
      @value.bits_set?(0x10_u32)
    end

    # OUT token received when endpoint              disabled
    def self.otepdis : Bool
      value.otepdis
    end

    # OUT token received when endpoint              disabled
    def self.otepdis=(value : Bool) : Bool
      self.set(otepdis: value)
      value
    end

    # Back-to-back SETUP packets              received
    def b2_bstup : Bool
      @value.bits_set?(0x40_u32)
    end

    # Back-to-back SETUP packets              received
    def self.b2_bstup : Bool
      value.b2_bstup
    end

    # Back-to-back SETUP packets              received
    def self.b2_bstup=(value : Bool) : Bool
      self.set(b2_bstup: value)
      value
    end

    # NYET interrupt
    def nyet : Bool
      @value.bits_set?(0x4000_u32)
    end

    # NYET interrupt
    def self.nyet : Bool
      value.nyet
    end

    # NYET interrupt
    def self.nyet=(value : Bool) : Bool
      self.set(nyet: value)
      value
    end

    def copy_with(
      *,

      xfrc : Bool? = nil,

      epdisd : Bool? = nil,

      stup : Bool? = nil,

      otepdis : Bool? = nil,

      b2_bstup : Bool? = nil,

      nyet : Bool? = nil
    ) : self
      value = @value

      unless xfrc.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(xfrc.to_int).&(0x1_u32) << 0
      end

      unless epdisd.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(epdisd.to_int).&(0x1_u32) << 1
      end

      unless stup.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(stup.to_int).&(0x1_u32) << 3
      end

      unless otepdis.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(otepdis.to_int).&(0x1_u32) << 4
      end

      unless b2_bstup.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(b2_bstup.to_int).&(0x1_u32) << 6
      end

      unless nyet.nil?
        value = (value & 0xffffbfff_u32) |
                UInt32.new!(nyet.to_int).&(0x1_u32) << 14
      end

      self.class.new(value)
    end

    def self.set(
      *,
      xfrc : Bool? = nil,
      epdisd : Bool? = nil,
      stup : Bool? = nil,
      otepdis : Bool? = nil,
      b2_bstup : Bool? = nil,
      nyet : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        xfrc: xfrc,
        epdisd: epdisd,
        stup: stup,
        otepdis: otepdis,
        b2_bstup: b2_bstup,
        nyet: nyet,
      )
    end
  end # struct

  # OTG_HS device endpoint-5 interrupt          register
  struct OTG_HS_DOEPINT5
    ADDRESS = BASE_ADDRESS + 0x3a8_u64

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

    # Transfer completed              interrupt
    def xfrc : Bool
      @value.bits_set?(0x1_u32)
    end

    # Transfer completed              interrupt
    def self.xfrc : Bool
      value.xfrc
    end

    # Transfer completed              interrupt
    def self.xfrc=(value : Bool) : Bool
      self.set(xfrc: value)
      value
    end

    # Endpoint disabled              interrupt
    def epdisd : Bool
      @value.bits_set?(0x2_u32)
    end

    # Endpoint disabled              interrupt
    def self.epdisd : Bool
      value.epdisd
    end

    # Endpoint disabled              interrupt
    def self.epdisd=(value : Bool) : Bool
      self.set(epdisd: value)
      value
    end

    # SETUP phase done
    def stup : Bool
      @value.bits_set?(0x8_u32)
    end

    # SETUP phase done
    def self.stup : Bool
      value.stup
    end

    # SETUP phase done
    def self.stup=(value : Bool) : Bool
      self.set(stup: value)
      value
    end

    # OUT token received when endpoint              disabled
    def otepdis : Bool
      @value.bits_set?(0x10_u32)
    end

    # OUT token received when endpoint              disabled
    def self.otepdis : Bool
      value.otepdis
    end

    # OUT token received when endpoint              disabled
    def self.otepdis=(value : Bool) : Bool
      self.set(otepdis: value)
      value
    end

    # Back-to-back SETUP packets              received
    def b2_bstup : Bool
      @value.bits_set?(0x40_u32)
    end

    # Back-to-back SETUP packets              received
    def self.b2_bstup : Bool
      value.b2_bstup
    end

    # Back-to-back SETUP packets              received
    def self.b2_bstup=(value : Bool) : Bool
      self.set(b2_bstup: value)
      value
    end

    # NYET interrupt
    def nyet : Bool
      @value.bits_set?(0x4000_u32)
    end

    # NYET interrupt
    def self.nyet : Bool
      value.nyet
    end

    # NYET interrupt
    def self.nyet=(value : Bool) : Bool
      self.set(nyet: value)
      value
    end

    def copy_with(
      *,

      xfrc : Bool? = nil,

      epdisd : Bool? = nil,

      stup : Bool? = nil,

      otepdis : Bool? = nil,

      b2_bstup : Bool? = nil,

      nyet : Bool? = nil
    ) : self
      value = @value

      unless xfrc.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(xfrc.to_int).&(0x1_u32) << 0
      end

      unless epdisd.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(epdisd.to_int).&(0x1_u32) << 1
      end

      unless stup.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(stup.to_int).&(0x1_u32) << 3
      end

      unless otepdis.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(otepdis.to_int).&(0x1_u32) << 4
      end

      unless b2_bstup.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(b2_bstup.to_int).&(0x1_u32) << 6
      end

      unless nyet.nil?
        value = (value & 0xffffbfff_u32) |
                UInt32.new!(nyet.to_int).&(0x1_u32) << 14
      end

      self.class.new(value)
    end

    def self.set(
      *,
      xfrc : Bool? = nil,
      epdisd : Bool? = nil,
      stup : Bool? = nil,
      otepdis : Bool? = nil,
      b2_bstup : Bool? = nil,
      nyet : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        xfrc: xfrc,
        epdisd: epdisd,
        stup: stup,
        otepdis: otepdis,
        b2_bstup: b2_bstup,
        nyet: nyet,
      )
    end
  end # struct

  # OTG_HS device endpoint-6 interrupt          register
  struct OTG_HS_DOEPINT6
    ADDRESS = BASE_ADDRESS + 0x3c8_u64

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

    # Transfer completed              interrupt
    def xfrc : Bool
      @value.bits_set?(0x1_u32)
    end

    # Transfer completed              interrupt
    def self.xfrc : Bool
      value.xfrc
    end

    # Transfer completed              interrupt
    def self.xfrc=(value : Bool) : Bool
      self.set(xfrc: value)
      value
    end

    # Endpoint disabled              interrupt
    def epdisd : Bool
      @value.bits_set?(0x2_u32)
    end

    # Endpoint disabled              interrupt
    def self.epdisd : Bool
      value.epdisd
    end

    # Endpoint disabled              interrupt
    def self.epdisd=(value : Bool) : Bool
      self.set(epdisd: value)
      value
    end

    # SETUP phase done
    def stup : Bool
      @value.bits_set?(0x8_u32)
    end

    # SETUP phase done
    def self.stup : Bool
      value.stup
    end

    # SETUP phase done
    def self.stup=(value : Bool) : Bool
      self.set(stup: value)
      value
    end

    # OUT token received when endpoint              disabled
    def otepdis : Bool
      @value.bits_set?(0x10_u32)
    end

    # OUT token received when endpoint              disabled
    def self.otepdis : Bool
      value.otepdis
    end

    # OUT token received when endpoint              disabled
    def self.otepdis=(value : Bool) : Bool
      self.set(otepdis: value)
      value
    end

    # Back-to-back SETUP packets              received
    def b2_bstup : Bool
      @value.bits_set?(0x40_u32)
    end

    # Back-to-back SETUP packets              received
    def self.b2_bstup : Bool
      value.b2_bstup
    end

    # Back-to-back SETUP packets              received
    def self.b2_bstup=(value : Bool) : Bool
      self.set(b2_bstup: value)
      value
    end

    # NYET interrupt
    def nyet : Bool
      @value.bits_set?(0x4000_u32)
    end

    # NYET interrupt
    def self.nyet : Bool
      value.nyet
    end

    # NYET interrupt
    def self.nyet=(value : Bool) : Bool
      self.set(nyet: value)
      value
    end

    def copy_with(
      *,

      xfrc : Bool? = nil,

      epdisd : Bool? = nil,

      stup : Bool? = nil,

      otepdis : Bool? = nil,

      b2_bstup : Bool? = nil,

      nyet : Bool? = nil
    ) : self
      value = @value

      unless xfrc.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(xfrc.to_int).&(0x1_u32) << 0
      end

      unless epdisd.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(epdisd.to_int).&(0x1_u32) << 1
      end

      unless stup.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(stup.to_int).&(0x1_u32) << 3
      end

      unless otepdis.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(otepdis.to_int).&(0x1_u32) << 4
      end

      unless b2_bstup.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(b2_bstup.to_int).&(0x1_u32) << 6
      end

      unless nyet.nil?
        value = (value & 0xffffbfff_u32) |
                UInt32.new!(nyet.to_int).&(0x1_u32) << 14
      end

      self.class.new(value)
    end

    def self.set(
      *,
      xfrc : Bool? = nil,
      epdisd : Bool? = nil,
      stup : Bool? = nil,
      otepdis : Bool? = nil,
      b2_bstup : Bool? = nil,
      nyet : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        xfrc: xfrc,
        epdisd: epdisd,
        stup: stup,
        otepdis: otepdis,
        b2_bstup: b2_bstup,
        nyet: nyet,
      )
    end
  end # struct

  # OTG_HS device endpoint-7 interrupt          register
  struct OTG_HS_DOEPINT7
    ADDRESS = BASE_ADDRESS + 0x3e8_u64

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

    # Transfer completed              interrupt
    def xfrc : Bool
      @value.bits_set?(0x1_u32)
    end

    # Transfer completed              interrupt
    def self.xfrc : Bool
      value.xfrc
    end

    # Transfer completed              interrupt
    def self.xfrc=(value : Bool) : Bool
      self.set(xfrc: value)
      value
    end

    # Endpoint disabled              interrupt
    def epdisd : Bool
      @value.bits_set?(0x2_u32)
    end

    # Endpoint disabled              interrupt
    def self.epdisd : Bool
      value.epdisd
    end

    # Endpoint disabled              interrupt
    def self.epdisd=(value : Bool) : Bool
      self.set(epdisd: value)
      value
    end

    # SETUP phase done
    def stup : Bool
      @value.bits_set?(0x8_u32)
    end

    # SETUP phase done
    def self.stup : Bool
      value.stup
    end

    # SETUP phase done
    def self.stup=(value : Bool) : Bool
      self.set(stup: value)
      value
    end

    # OUT token received when endpoint              disabled
    def otepdis : Bool
      @value.bits_set?(0x10_u32)
    end

    # OUT token received when endpoint              disabled
    def self.otepdis : Bool
      value.otepdis
    end

    # OUT token received when endpoint              disabled
    def self.otepdis=(value : Bool) : Bool
      self.set(otepdis: value)
      value
    end

    # Back-to-back SETUP packets              received
    def b2_bstup : Bool
      @value.bits_set?(0x40_u32)
    end

    # Back-to-back SETUP packets              received
    def self.b2_bstup : Bool
      value.b2_bstup
    end

    # Back-to-back SETUP packets              received
    def self.b2_bstup=(value : Bool) : Bool
      self.set(b2_bstup: value)
      value
    end

    # NYET interrupt
    def nyet : Bool
      @value.bits_set?(0x4000_u32)
    end

    # NYET interrupt
    def self.nyet : Bool
      value.nyet
    end

    # NYET interrupt
    def self.nyet=(value : Bool) : Bool
      self.set(nyet: value)
      value
    end

    def copy_with(
      *,

      xfrc : Bool? = nil,

      epdisd : Bool? = nil,

      stup : Bool? = nil,

      otepdis : Bool? = nil,

      b2_bstup : Bool? = nil,

      nyet : Bool? = nil
    ) : self
      value = @value

      unless xfrc.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(xfrc.to_int).&(0x1_u32) << 0
      end

      unless epdisd.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(epdisd.to_int).&(0x1_u32) << 1
      end

      unless stup.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(stup.to_int).&(0x1_u32) << 3
      end

      unless otepdis.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(otepdis.to_int).&(0x1_u32) << 4
      end

      unless b2_bstup.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(b2_bstup.to_int).&(0x1_u32) << 6
      end

      unless nyet.nil?
        value = (value & 0xffffbfff_u32) |
                UInt32.new!(nyet.to_int).&(0x1_u32) << 14
      end

      self.class.new(value)
    end

    def self.set(
      *,
      xfrc : Bool? = nil,
      epdisd : Bool? = nil,
      stup : Bool? = nil,
      otepdis : Bool? = nil,
      b2_bstup : Bool? = nil,
      nyet : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        xfrc: xfrc,
        epdisd: epdisd,
        stup: stup,
        otepdis: otepdis,
        b2_bstup: b2_bstup,
        nyet: nyet,
      )
    end
  end # struct

  # OTG_HS device endpoint-1 transfer size          register
  struct OTG_HS_DOEPTSIZ0
    ADDRESS = BASE_ADDRESS + 0x310_u64

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

    # Transfer size
    def xfrsiz : UInt8
      UInt8.new!((@value >> 0) & 0x7f_u32)
    end

    # Transfer size
    def self.xfrsiz : UInt8
      value.xfrsiz
    end

    # Transfer size
    def self.xfrsiz=(value : UInt8) : UInt8
      self.set(xfrsiz: value)
      value
    end

    # Packet count
    def pktcnt : Bool
      @value.bits_set?(0x80000_u32)
    end

    # Packet count
    def self.pktcnt : Bool
      value.pktcnt
    end

    # Packet count
    def self.pktcnt=(value : Bool) : Bool
      self.set(pktcnt: value)
      value
    end

    # SETUP packet count
    def stupcnt : UInt8
      UInt8.new!((@value >> 29) & 0x3_u32)
    end

    # SETUP packet count
    def self.stupcnt : UInt8
      value.stupcnt
    end

    # SETUP packet count
    def self.stupcnt=(value : UInt8) : UInt8
      self.set(stupcnt: value)
      value
    end

    def copy_with(
      *,

      xfrsiz : UInt8? = nil,

      pktcnt : Bool? = nil,

      stupcnt : UInt8? = nil
    ) : self
      value = @value

      unless xfrsiz.nil?
        value = (value & 0xffffff80_u32) |
                UInt32.new!(xfrsiz.to_int).&(0x7f_u32) << 0
      end

      unless pktcnt.nil?
        value = (value & 0xfff7ffff_u32) |
                UInt32.new!(pktcnt.to_int).&(0x1_u32) << 19
      end

      unless stupcnt.nil?
        value = (value & 0x9fffffff_u32) |
                UInt32.new!(stupcnt.to_int).&(0x3_u32) << 29
      end

      self.class.new(value)
    end

    def self.set(
      *,
      xfrsiz : UInt8? = nil,
      pktcnt : Bool? = nil,
      stupcnt : UInt8? = nil
    ) : Nil
      self.value = self.value.copy_with(
        xfrsiz: xfrsiz,
        pktcnt: pktcnt,
        stupcnt: stupcnt,
      )
    end
  end # struct

  # OTG_HS device endpoint-2 transfer size          register
  struct OTG_HS_DOEPTSIZ1
    ADDRESS = BASE_ADDRESS + 0x330_u64

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

    # Transfer size
    def xfrsiz : UInt32
      UInt32.new!((@value >> 0) & 0x7ffff_u32)
    end

    # Transfer size
    def self.xfrsiz : UInt32
      value.xfrsiz
    end

    # Transfer size
    def self.xfrsiz=(value : UInt32) : UInt32
      self.set(xfrsiz: value)
      value
    end

    # Packet count
    def pktcnt : UInt16
      UInt16.new!((@value >> 19) & 0x3ff_u32)
    end

    # Packet count
    def self.pktcnt : UInt16
      value.pktcnt
    end

    # Packet count
    def self.pktcnt=(value : UInt16) : UInt16
      self.set(pktcnt: value)
      value
    end

    # Received data PID/SETUP packet              count
    def rxdpid_stupcnt : UInt8
      UInt8.new!((@value >> 29) & 0x3_u32)
    end

    # Received data PID/SETUP packet              count
    def self.rxdpid_stupcnt : UInt8
      value.rxdpid_stupcnt
    end

    # Received data PID/SETUP packet              count
    def self.rxdpid_stupcnt=(value : UInt8) : UInt8
      self.set(rxdpid_stupcnt: value)
      value
    end

    def copy_with(
      *,

      xfrsiz : UInt32? = nil,

      pktcnt : UInt16? = nil,

      rxdpid_stupcnt : UInt8? = nil
    ) : self
      value = @value

      unless xfrsiz.nil?
        value = (value & 0xfff80000_u32) |
                UInt32.new!(xfrsiz.to_int).&(0x7ffff_u32) << 0
      end

      unless pktcnt.nil?
        value = (value & 0xe007ffff_u32) |
                UInt32.new!(pktcnt.to_int).&(0x3ff_u32) << 19
      end

      unless rxdpid_stupcnt.nil?
        value = (value & 0x9fffffff_u32) |
                UInt32.new!(rxdpid_stupcnt.to_int).&(0x3_u32) << 29
      end

      self.class.new(value)
    end

    def self.set(
      *,
      xfrsiz : UInt32? = nil,
      pktcnt : UInt16? = nil,
      rxdpid_stupcnt : UInt8? = nil
    ) : Nil
      self.value = self.value.copy_with(
        xfrsiz: xfrsiz,
        pktcnt: pktcnt,
        rxdpid_stupcnt: rxdpid_stupcnt,
      )
    end
  end # struct

  # OTG_HS device endpoint-3 transfer size          register
  struct OTG_HS_DOEPTSIZ2
    ADDRESS = BASE_ADDRESS + 0x350_u64

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

    # Transfer size
    def xfrsiz : UInt32
      UInt32.new!((@value >> 0) & 0x7ffff_u32)
    end

    # Transfer size
    def self.xfrsiz : UInt32
      value.xfrsiz
    end

    # Transfer size
    def self.xfrsiz=(value : UInt32) : UInt32
      self.set(xfrsiz: value)
      value
    end

    # Packet count
    def pktcnt : UInt16
      UInt16.new!((@value >> 19) & 0x3ff_u32)
    end

    # Packet count
    def self.pktcnt : UInt16
      value.pktcnt
    end

    # Packet count
    def self.pktcnt=(value : UInt16) : UInt16
      self.set(pktcnt: value)
      value
    end

    # Received data PID/SETUP packet              count
    def rxdpid_stupcnt : UInt8
      UInt8.new!((@value >> 29) & 0x3_u32)
    end

    # Received data PID/SETUP packet              count
    def self.rxdpid_stupcnt : UInt8
      value.rxdpid_stupcnt
    end

    # Received data PID/SETUP packet              count
    def self.rxdpid_stupcnt=(value : UInt8) : UInt8
      self.set(rxdpid_stupcnt: value)
      value
    end

    def copy_with(
      *,

      xfrsiz : UInt32? = nil,

      pktcnt : UInt16? = nil,

      rxdpid_stupcnt : UInt8? = nil
    ) : self
      value = @value

      unless xfrsiz.nil?
        value = (value & 0xfff80000_u32) |
                UInt32.new!(xfrsiz.to_int).&(0x7ffff_u32) << 0
      end

      unless pktcnt.nil?
        value = (value & 0xe007ffff_u32) |
                UInt32.new!(pktcnt.to_int).&(0x3ff_u32) << 19
      end

      unless rxdpid_stupcnt.nil?
        value = (value & 0x9fffffff_u32) |
                UInt32.new!(rxdpid_stupcnt.to_int).&(0x3_u32) << 29
      end

      self.class.new(value)
    end

    def self.set(
      *,
      xfrsiz : UInt32? = nil,
      pktcnt : UInt16? = nil,
      rxdpid_stupcnt : UInt8? = nil
    ) : Nil
      self.value = self.value.copy_with(
        xfrsiz: xfrsiz,
        pktcnt: pktcnt,
        rxdpid_stupcnt: rxdpid_stupcnt,
      )
    end
  end # struct

  # OTG_HS device endpoint-4 transfer size          register
  struct OTG_HS_DOEPTSIZ3
    ADDRESS = BASE_ADDRESS + 0x370_u64

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

    # Transfer size
    def xfrsiz : UInt32
      UInt32.new!((@value >> 0) & 0x7ffff_u32)
    end

    # Transfer size
    def self.xfrsiz : UInt32
      value.xfrsiz
    end

    # Transfer size
    def self.xfrsiz=(value : UInt32) : UInt32
      self.set(xfrsiz: value)
      value
    end

    # Packet count
    def pktcnt : UInt16
      UInt16.new!((@value >> 19) & 0x3ff_u32)
    end

    # Packet count
    def self.pktcnt : UInt16
      value.pktcnt
    end

    # Packet count
    def self.pktcnt=(value : UInt16) : UInt16
      self.set(pktcnt: value)
      value
    end

    # Received data PID/SETUP packet              count
    def rxdpid_stupcnt : UInt8
      UInt8.new!((@value >> 29) & 0x3_u32)
    end

    # Received data PID/SETUP packet              count
    def self.rxdpid_stupcnt : UInt8
      value.rxdpid_stupcnt
    end

    # Received data PID/SETUP packet              count
    def self.rxdpid_stupcnt=(value : UInt8) : UInt8
      self.set(rxdpid_stupcnt: value)
      value
    end

    def copy_with(
      *,

      xfrsiz : UInt32? = nil,

      pktcnt : UInt16? = nil,

      rxdpid_stupcnt : UInt8? = nil
    ) : self
      value = @value

      unless xfrsiz.nil?
        value = (value & 0xfff80000_u32) |
                UInt32.new!(xfrsiz.to_int).&(0x7ffff_u32) << 0
      end

      unless pktcnt.nil?
        value = (value & 0xe007ffff_u32) |
                UInt32.new!(pktcnt.to_int).&(0x3ff_u32) << 19
      end

      unless rxdpid_stupcnt.nil?
        value = (value & 0x9fffffff_u32) |
                UInt32.new!(rxdpid_stupcnt.to_int).&(0x3_u32) << 29
      end

      self.class.new(value)
    end

    def self.set(
      *,
      xfrsiz : UInt32? = nil,
      pktcnt : UInt16? = nil,
      rxdpid_stupcnt : UInt8? = nil
    ) : Nil
      self.value = self.value.copy_with(
        xfrsiz: xfrsiz,
        pktcnt: pktcnt,
        rxdpid_stupcnt: rxdpid_stupcnt,
      )
    end
  end # struct

  # OTG_HS device endpoint-5 transfer size          register
  struct OTG_HS_DOEPTSIZ4
    ADDRESS = BASE_ADDRESS + 0x390_u64

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

    # Transfer size
    def xfrsiz : UInt32
      UInt32.new!((@value >> 0) & 0x7ffff_u32)
    end

    # Transfer size
    def self.xfrsiz : UInt32
      value.xfrsiz
    end

    # Transfer size
    def self.xfrsiz=(value : UInt32) : UInt32
      self.set(xfrsiz: value)
      value
    end

    # Packet count
    def pktcnt : UInt16
      UInt16.new!((@value >> 19) & 0x3ff_u32)
    end

    # Packet count
    def self.pktcnt : UInt16
      value.pktcnt
    end

    # Packet count
    def self.pktcnt=(value : UInt16) : UInt16
      self.set(pktcnt: value)
      value
    end

    # Received data PID/SETUP packet              count
    def rxdpid_stupcnt : UInt8
      UInt8.new!((@value >> 29) & 0x3_u32)
    end

    # Received data PID/SETUP packet              count
    def self.rxdpid_stupcnt : UInt8
      value.rxdpid_stupcnt
    end

    # Received data PID/SETUP packet              count
    def self.rxdpid_stupcnt=(value : UInt8) : UInt8
      self.set(rxdpid_stupcnt: value)
      value
    end

    def copy_with(
      *,

      xfrsiz : UInt32? = nil,

      pktcnt : UInt16? = nil,

      rxdpid_stupcnt : UInt8? = nil
    ) : self
      value = @value

      unless xfrsiz.nil?
        value = (value & 0xfff80000_u32) |
                UInt32.new!(xfrsiz.to_int).&(0x7ffff_u32) << 0
      end

      unless pktcnt.nil?
        value = (value & 0xe007ffff_u32) |
                UInt32.new!(pktcnt.to_int).&(0x3ff_u32) << 19
      end

      unless rxdpid_stupcnt.nil?
        value = (value & 0x9fffffff_u32) |
                UInt32.new!(rxdpid_stupcnt.to_int).&(0x3_u32) << 29
      end

      self.class.new(value)
    end

    def self.set(
      *,
      xfrsiz : UInt32? = nil,
      pktcnt : UInt16? = nil,
      rxdpid_stupcnt : UInt8? = nil
    ) : Nil
      self.value = self.value.copy_with(
        xfrsiz: xfrsiz,
        pktcnt: pktcnt,
        rxdpid_stupcnt: rxdpid_stupcnt,
      )
    end
  end # struct

end
