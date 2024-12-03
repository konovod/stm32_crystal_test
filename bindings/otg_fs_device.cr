# USB on the go full speed
module OTG_FS_DEVICE
  VERSION      = nil
  BASE_ADDRESS = 0x50000800_u64

  # OTG_FS device configuration register          (OTG_FS_DCFG)
  struct FS_DCFG
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

    # Non-zero-length status OUT              handshake
    def nzlsohsk : Bool
      @value.bits_set?(0x4_u32)
    end

    # Non-zero-length status OUT              handshake
    def self.nzlsohsk : Bool
      value.nzlsohsk
    end

    # Non-zero-length status OUT              handshake
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

    # Periodic frame interval
    def pfivl : UInt8
      UInt8.new!((@value >> 11) & 0x3_u32)
    end

    # Periodic frame interval
    def self.pfivl : UInt8
      value.pfivl
    end

    # Periodic frame interval
    def self.pfivl=(value : UInt8) : UInt8
      self.set(pfivl: value)
      value
    end

    def copy_with(
      *,

      dspd : UInt8? = nil,

      nzlsohsk : Bool? = nil,

      dad : UInt8? = nil,

      pfivl : UInt8? = nil
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

      self.class.new(value)
    end

    def self.set(
      *,
      dspd : UInt8? = nil,
      nzlsohsk : Bool? = nil,
      dad : UInt8? = nil,
      pfivl : UInt8? = nil
    ) : Nil
      self.value = self.value.copy_with(
        dspd: dspd,
        nzlsohsk: nzlsohsk,
        dad: dad,
        pfivl: pfivl,
      )
    end
  end # struct

  # OTG_FS device control register          (OTG_FS_DCTL)
  struct FS_DCTL
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
    def sginak : Bool
      @value.bits_set?(0x80_u32)
    end

    # Set global IN NAK
    def self.sginak : Bool
      value.sginak
    end

    # Set global IN NAK
    def self.sginak=(value : Bool) : Bool
      self.set(sginak: value)
      value
    end

    # Clear global IN NAK
    def cginak : Bool
      @value.bits_set?(0x100_u32)
    end

    # Clear global IN NAK
    def self.cginak : Bool
      value.cginak
    end

    # Clear global IN NAK
    def self.cginak=(value : Bool) : Bool
      self.set(cginak: value)
      value
    end

    # Set global OUT NAK
    def sgonak : Bool
      @value.bits_set?(0x200_u32)
    end

    # Set global OUT NAK
    def self.sgonak : Bool
      value.sgonak
    end

    # Set global OUT NAK
    def self.sgonak=(value : Bool) : Bool
      self.set(sgonak: value)
      value
    end

    # Clear global OUT NAK
    def cgonak : Bool
      @value.bits_set?(0x400_u32)
    end

    # Clear global OUT NAK
    def self.cgonak : Bool
      value.cgonak
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

  # OTG_FS device status register          (OTG_FS_DSTS)
  struct FS_DSTS
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

  # OTG_FS device IN endpoint common interrupt          mask register (OTG_FS_DIEPMSK)
  struct FS_DIEPMSK
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

    # Timeout condition mask (Non-isochronous              endpoints)
    def tom : Bool
      @value.bits_set?(0x8_u32)
    end

    # Timeout condition mask (Non-isochronous              endpoints)
    def self.tom : Bool
      value.tom
    end

    # Timeout condition mask (Non-isochronous              endpoints)
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

    def copy_with(
      *,

      xfrcm : Bool? = nil,

      epdm : Bool? = nil,

      tom : Bool? = nil,

      ittxfemsk : Bool? = nil,

      inepnmm : Bool? = nil,

      inepnem : Bool? = nil
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

      self.class.new(value)
    end

    def self.set(
      *,
      xfrcm : Bool? = nil,
      epdm : Bool? = nil,
      tom : Bool? = nil,
      ittxfemsk : Bool? = nil,
      inepnmm : Bool? = nil,
      inepnem : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        xfrcm: xfrcm,
        epdm: epdm,
        tom: tom,
        ittxfemsk: ittxfemsk,
        inepnmm: inepnmm,
        inepnem: inepnem,
      )
    end
  end # struct

  # OTG_FS device OUT endpoint common interrupt          mask register (OTG_FS_DOEPMSK)
  struct FS_DOEPMSK
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

    def copy_with(
      *,

      xfrcm : Bool? = nil,

      epdm : Bool? = nil,

      stupm : Bool? = nil,

      otepdm : Bool? = nil
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

      self.class.new(value)
    end

    def self.set(
      *,
      xfrcm : Bool? = nil,
      epdm : Bool? = nil,
      stupm : Bool? = nil,
      otepdm : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        xfrcm: xfrcm,
        epdm: epdm,
        stupm: stupm,
        otepdm: otepdm,
      )
    end
  end # struct

  # OTG_FS device all endpoints interrupt          register (OTG_FS_DAINT)
  struct FS_DAINT
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

  # OTG_FS all endpoints interrupt mask register          (OTG_FS_DAINTMSK)
  struct FS_DAINTMSK
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

    # OUT endpoint interrupt              bits
    def oepint : UInt16
      UInt16.new!((@value >> 16) & 0xffff_u32)
    end

    # OUT endpoint interrupt              bits
    def self.oepint : UInt16
      value.oepint
    end

    # OUT endpoint interrupt              bits
    def self.oepint=(value : UInt16) : UInt16
      self.set(oepint: value)
      value
    end

    def copy_with(
      *,

      iepm : UInt16? = nil,

      oepint : UInt16? = nil
    ) : self
      value = @value

      unless iepm.nil?
        value = (value & 0xffff0000_u32) |
                UInt32.new!(iepm.to_int).&(0xffff_u32) << 0
      end

      unless oepint.nil?
        value = (value & 0xffff_u32) |
                UInt32.new!(oepint.to_int).&(0xffff_u32) << 16
      end

      self.class.new(value)
    end

    def self.set(
      *,
      iepm : UInt16? = nil,
      oepint : UInt16? = nil
    ) : Nil
      self.value = self.value.copy_with(
        iepm: iepm,
        oepint: oepint,
      )
    end
  end # struct

  # OTG_FS device VBUS discharge time          register
  struct DVBUSDIS
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

  # OTG_FS device VBUS pulsing time          register
  struct DVBUSPULSE
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

  # OTG_FS device IN endpoint FIFO empty          interrupt mask register
  struct DIEPEMPMSK
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

  # OTG_FS device control IN endpoint 0 control          register (OTG_FS_DIEPCTL0)
  struct FS_DIEPCTL0
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
    def mpsiz : UInt8
      UInt8.new!((@value >> 0) & 0x3_u32)
    end

    # Maximum packet size
    def self.mpsiz : UInt8
      value.mpsiz
    end

    # Maximum packet size
    def self.mpsiz=(value : UInt8) : UInt8
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

    # Endpoint disable
    def epdis : Bool
      @value.bits_set?(0x40000000_u32)
    end

    # Endpoint disable
    def self.epdis : Bool
      value.epdis
    end

    # Endpoint enable
    def epena : Bool
      @value.bits_set?(0x80000000_u32)
    end

    # Endpoint enable
    def self.epena : Bool
      value.epena
    end

    def copy_with(
      *,

      mpsiz : UInt8? = nil,

      stall : Bool? = nil,

      txfnum : UInt8? = nil,

      cnak : Bool? = nil,

      snak : Bool? = nil
    ) : self
      value = @value

      unless mpsiz.nil?
        value = (value & 0xfffffffc_u32) |
                UInt32.new!(mpsiz.to_int).&(0x3_u32) << 0
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

      self.class.new(value)
    end

    def self.set(
      *,
      mpsiz : UInt8? = nil,
      stall : Bool? = nil,
      txfnum : UInt8? = nil,
      cnak : Bool? = nil,
      snak : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        mpsiz: mpsiz,
        stall: stall,
        txfnum: txfnum,
        cnak: cnak,
        snak: snak,
      )
    end
  end # struct

  # OTG device endpoint-1 control          register
  struct DIEPCTL1
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

    # EPENA
    def epena : Bool
      @value.bits_set?(0x80000000_u32)
    end

    # EPENA
    def self.epena : Bool
      value.epena
    end

    # EPENA
    def self.epena=(value : Bool) : Bool
      self.set(epena: value)
      value
    end

    # EPDIS
    def epdis : Bool
      @value.bits_set?(0x40000000_u32)
    end

    # EPDIS
    def self.epdis : Bool
      value.epdis
    end

    # EPDIS
    def self.epdis=(value : Bool) : Bool
      self.set(epdis: value)
      value
    end

    # SODDFRM/SD1PID
    def self.soddfrm_sd1_pid=(value : Bool) : Bool
      self.set(soddfrm_sd1_pid: value)
      value
    end

    # SD0PID/SEVNFRM
    def self.sd0_pid_sevnfrm=(value : Bool) : Bool
      self.set(sd0_pid_sevnfrm: value)
      value
    end

    # SNAK
    def self.snak=(value : Bool) : Bool
      self.set(snak: value)
      value
    end

    # CNAK
    def self.cnak=(value : Bool) : Bool
      self.set(cnak: value)
      value
    end

    # TXFNUM
    def txfnum : UInt8
      UInt8.new!((@value >> 22) & 0xf_u32)
    end

    # TXFNUM
    def self.txfnum : UInt8
      value.txfnum
    end

    # TXFNUM
    def self.txfnum=(value : UInt8) : UInt8
      self.set(txfnum: value)
      value
    end

    # Stall
    def stall : Bool
      @value.bits_set?(0x200000_u32)
    end

    # Stall
    def self.stall : Bool
      value.stall
    end

    # Stall
    def self.stall=(value : Bool) : Bool
      self.set(stall: value)
      value
    end

    # EPTYP
    def eptyp : UInt8
      UInt8.new!((@value >> 18) & 0x3_u32)
    end

    # EPTYP
    def self.eptyp : UInt8
      value.eptyp
    end

    # EPTYP
    def self.eptyp=(value : UInt8) : UInt8
      self.set(eptyp: value)
      value
    end

    # NAKSTS
    def naksts : Bool
      @value.bits_set?(0x20000_u32)
    end

    # NAKSTS
    def self.naksts : Bool
      value.naksts
    end

    # EONUM/DPID
    def eonum_dpid : Bool
      @value.bits_set?(0x10000_u32)
    end

    # EONUM/DPID
    def self.eonum_dpid : Bool
      value.eonum_dpid
    end

    # USBAEP
    def usbaep : Bool
      @value.bits_set?(0x8000_u32)
    end

    # USBAEP
    def self.usbaep : Bool
      value.usbaep
    end

    # USBAEP
    def self.usbaep=(value : Bool) : Bool
      self.set(usbaep: value)
      value
    end

    # MPSIZ
    def mpsiz : UInt16
      UInt16.new!((@value >> 0) & 0x7ff_u32)
    end

    # MPSIZ
    def self.mpsiz : UInt16
      value.mpsiz
    end

    # MPSIZ
    def self.mpsiz=(value : UInt16) : UInt16
      self.set(mpsiz: value)
      value
    end

    def copy_with(
      *,

      epena : Bool? = nil,

      epdis : Bool? = nil,

      soddfrm_sd1_pid : Bool? = nil,

      sd0_pid_sevnfrm : Bool? = nil,

      snak : Bool? = nil,

      cnak : Bool? = nil,

      txfnum : UInt8? = nil,

      stall : Bool? = nil,

      eptyp : UInt8? = nil,

      usbaep : Bool? = nil,

      mpsiz : UInt16? = nil
    ) : self
      value = @value

      unless epena.nil?
        value = (value & 0x7fffffff_u32) |
                UInt32.new!(epena.to_int).&(0x1_u32) << 31
      end

      unless epdis.nil?
        value = (value & 0xbfffffff_u32) |
                UInt32.new!(epdis.to_int).&(0x1_u32) << 30
      end

      unless soddfrm_sd1_pid.nil?
        value = (value & 0xdfffffff_u32) |
                UInt32.new!(soddfrm_sd1_pid.to_int).&(0x1_u32) << 29
      end

      unless sd0_pid_sevnfrm.nil?
        value = (value & 0xefffffff_u32) |
                UInt32.new!(sd0_pid_sevnfrm.to_int).&(0x1_u32) << 28
      end

      unless snak.nil?
        value = (value & 0xf7ffffff_u32) |
                UInt32.new!(snak.to_int).&(0x1_u32) << 27
      end

      unless cnak.nil?
        value = (value & 0xfbffffff_u32) |
                UInt32.new!(cnak.to_int).&(0x1_u32) << 26
      end

      unless txfnum.nil?
        value = (value & 0xfc3fffff_u32) |
                UInt32.new!(txfnum.to_int).&(0xf_u32) << 22
      end

      unless stall.nil?
        value = (value & 0xffdfffff_u32) |
                UInt32.new!(stall.to_int).&(0x1_u32) << 21
      end

      unless eptyp.nil?
        value = (value & 0xfff3ffff_u32) |
                UInt32.new!(eptyp.to_int).&(0x3_u32) << 18
      end

      unless usbaep.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(usbaep.to_int).&(0x1_u32) << 15
      end

      unless mpsiz.nil?
        value = (value & 0xfffff800_u32) |
                UInt32.new!(mpsiz.to_int).&(0x7ff_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      epena : Bool? = nil,
      epdis : Bool? = nil,
      soddfrm_sd1_pid : Bool? = nil,
      sd0_pid_sevnfrm : Bool? = nil,
      snak : Bool? = nil,
      cnak : Bool? = nil,
      txfnum : UInt8? = nil,
      stall : Bool? = nil,
      eptyp : UInt8? = nil,
      usbaep : Bool? = nil,
      mpsiz : UInt16? = nil
    ) : Nil
      self.value = self.value.copy_with(
        epena: epena,
        epdis: epdis,
        soddfrm_sd1_pid: soddfrm_sd1_pid,
        sd0_pid_sevnfrm: sd0_pid_sevnfrm,
        snak: snak,
        cnak: cnak,
        txfnum: txfnum,
        stall: stall,
        eptyp: eptyp,
        usbaep: usbaep,
        mpsiz: mpsiz,
      )
    end
  end # struct

  # OTG device endpoint-2 control          register
  struct DIEPCTL2
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

    # EPENA
    def epena : Bool
      @value.bits_set?(0x80000000_u32)
    end

    # EPENA
    def self.epena : Bool
      value.epena
    end

    # EPENA
    def self.epena=(value : Bool) : Bool
      self.set(epena: value)
      value
    end

    # EPDIS
    def epdis : Bool
      @value.bits_set?(0x40000000_u32)
    end

    # EPDIS
    def self.epdis : Bool
      value.epdis
    end

    # EPDIS
    def self.epdis=(value : Bool) : Bool
      self.set(epdis: value)
      value
    end

    # SODDFRM
    def self.soddfrm=(value : Bool) : Bool
      self.set(soddfrm: value)
      value
    end

    # SD0PID/SEVNFRM
    def self.sd0_pid_sevnfrm=(value : Bool) : Bool
      self.set(sd0_pid_sevnfrm: value)
      value
    end

    # SNAK
    def self.snak=(value : Bool) : Bool
      self.set(snak: value)
      value
    end

    # CNAK
    def self.cnak=(value : Bool) : Bool
      self.set(cnak: value)
      value
    end

    # TXFNUM
    def txfnum : UInt8
      UInt8.new!((@value >> 22) & 0xf_u32)
    end

    # TXFNUM
    def self.txfnum : UInt8
      value.txfnum
    end

    # TXFNUM
    def self.txfnum=(value : UInt8) : UInt8
      self.set(txfnum: value)
      value
    end

    # Stall
    def stall : Bool
      @value.bits_set?(0x200000_u32)
    end

    # Stall
    def self.stall : Bool
      value.stall
    end

    # Stall
    def self.stall=(value : Bool) : Bool
      self.set(stall: value)
      value
    end

    # EPTYP
    def eptyp : UInt8
      UInt8.new!((@value >> 18) & 0x3_u32)
    end

    # EPTYP
    def self.eptyp : UInt8
      value.eptyp
    end

    # EPTYP
    def self.eptyp=(value : UInt8) : UInt8
      self.set(eptyp: value)
      value
    end

    # NAKSTS
    def naksts : Bool
      @value.bits_set?(0x20000_u32)
    end

    # NAKSTS
    def self.naksts : Bool
      value.naksts
    end

    # EONUM/DPID
    def eonum_dpid : Bool
      @value.bits_set?(0x10000_u32)
    end

    # EONUM/DPID
    def self.eonum_dpid : Bool
      value.eonum_dpid
    end

    # USBAEP
    def usbaep : Bool
      @value.bits_set?(0x8000_u32)
    end

    # USBAEP
    def self.usbaep : Bool
      value.usbaep
    end

    # USBAEP
    def self.usbaep=(value : Bool) : Bool
      self.set(usbaep: value)
      value
    end

    # MPSIZ
    def mpsiz : UInt16
      UInt16.new!((@value >> 0) & 0x7ff_u32)
    end

    # MPSIZ
    def self.mpsiz : UInt16
      value.mpsiz
    end

    # MPSIZ
    def self.mpsiz=(value : UInt16) : UInt16
      self.set(mpsiz: value)
      value
    end

    def copy_with(
      *,

      epena : Bool? = nil,

      epdis : Bool? = nil,

      soddfrm : Bool? = nil,

      sd0_pid_sevnfrm : Bool? = nil,

      snak : Bool? = nil,

      cnak : Bool? = nil,

      txfnum : UInt8? = nil,

      stall : Bool? = nil,

      eptyp : UInt8? = nil,

      usbaep : Bool? = nil,

      mpsiz : UInt16? = nil
    ) : self
      value = @value

      unless epena.nil?
        value = (value & 0x7fffffff_u32) |
                UInt32.new!(epena.to_int).&(0x1_u32) << 31
      end

      unless epdis.nil?
        value = (value & 0xbfffffff_u32) |
                UInt32.new!(epdis.to_int).&(0x1_u32) << 30
      end

      unless soddfrm.nil?
        value = (value & 0xdfffffff_u32) |
                UInt32.new!(soddfrm.to_int).&(0x1_u32) << 29
      end

      unless sd0_pid_sevnfrm.nil?
        value = (value & 0xefffffff_u32) |
                UInt32.new!(sd0_pid_sevnfrm.to_int).&(0x1_u32) << 28
      end

      unless snak.nil?
        value = (value & 0xf7ffffff_u32) |
                UInt32.new!(snak.to_int).&(0x1_u32) << 27
      end

      unless cnak.nil?
        value = (value & 0xfbffffff_u32) |
                UInt32.new!(cnak.to_int).&(0x1_u32) << 26
      end

      unless txfnum.nil?
        value = (value & 0xfc3fffff_u32) |
                UInt32.new!(txfnum.to_int).&(0xf_u32) << 22
      end

      unless stall.nil?
        value = (value & 0xffdfffff_u32) |
                UInt32.new!(stall.to_int).&(0x1_u32) << 21
      end

      unless eptyp.nil?
        value = (value & 0xfff3ffff_u32) |
                UInt32.new!(eptyp.to_int).&(0x3_u32) << 18
      end

      unless usbaep.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(usbaep.to_int).&(0x1_u32) << 15
      end

      unless mpsiz.nil?
        value = (value & 0xfffff800_u32) |
                UInt32.new!(mpsiz.to_int).&(0x7ff_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      epena : Bool? = nil,
      epdis : Bool? = nil,
      soddfrm : Bool? = nil,
      sd0_pid_sevnfrm : Bool? = nil,
      snak : Bool? = nil,
      cnak : Bool? = nil,
      txfnum : UInt8? = nil,
      stall : Bool? = nil,
      eptyp : UInt8? = nil,
      usbaep : Bool? = nil,
      mpsiz : UInt16? = nil
    ) : Nil
      self.value = self.value.copy_with(
        epena: epena,
        epdis: epdis,
        soddfrm: soddfrm,
        sd0_pid_sevnfrm: sd0_pid_sevnfrm,
        snak: snak,
        cnak: cnak,
        txfnum: txfnum,
        stall: stall,
        eptyp: eptyp,
        usbaep: usbaep,
        mpsiz: mpsiz,
      )
    end
  end # struct

  # OTG device endpoint-3 control          register
  struct DIEPCTL3
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

    # EPENA
    def epena : Bool
      @value.bits_set?(0x80000000_u32)
    end

    # EPENA
    def self.epena : Bool
      value.epena
    end

    # EPENA
    def self.epena=(value : Bool) : Bool
      self.set(epena: value)
      value
    end

    # EPDIS
    def epdis : Bool
      @value.bits_set?(0x40000000_u32)
    end

    # EPDIS
    def self.epdis : Bool
      value.epdis
    end

    # EPDIS
    def self.epdis=(value : Bool) : Bool
      self.set(epdis: value)
      value
    end

    # SODDFRM
    def self.soddfrm=(value : Bool) : Bool
      self.set(soddfrm: value)
      value
    end

    # SD0PID/SEVNFRM
    def self.sd0_pid_sevnfrm=(value : Bool) : Bool
      self.set(sd0_pid_sevnfrm: value)
      value
    end

    # SNAK
    def self.snak=(value : Bool) : Bool
      self.set(snak: value)
      value
    end

    # CNAK
    def self.cnak=(value : Bool) : Bool
      self.set(cnak: value)
      value
    end

    # TXFNUM
    def txfnum : UInt8
      UInt8.new!((@value >> 22) & 0xf_u32)
    end

    # TXFNUM
    def self.txfnum : UInt8
      value.txfnum
    end

    # TXFNUM
    def self.txfnum=(value : UInt8) : UInt8
      self.set(txfnum: value)
      value
    end

    # Stall
    def stall : Bool
      @value.bits_set?(0x200000_u32)
    end

    # Stall
    def self.stall : Bool
      value.stall
    end

    # Stall
    def self.stall=(value : Bool) : Bool
      self.set(stall: value)
      value
    end

    # EPTYP
    def eptyp : UInt8
      UInt8.new!((@value >> 18) & 0x3_u32)
    end

    # EPTYP
    def self.eptyp : UInt8
      value.eptyp
    end

    # EPTYP
    def self.eptyp=(value : UInt8) : UInt8
      self.set(eptyp: value)
      value
    end

    # NAKSTS
    def naksts : Bool
      @value.bits_set?(0x20000_u32)
    end

    # NAKSTS
    def self.naksts : Bool
      value.naksts
    end

    # EONUM/DPID
    def eonum_dpid : Bool
      @value.bits_set?(0x10000_u32)
    end

    # EONUM/DPID
    def self.eonum_dpid : Bool
      value.eonum_dpid
    end

    # USBAEP
    def usbaep : Bool
      @value.bits_set?(0x8000_u32)
    end

    # USBAEP
    def self.usbaep : Bool
      value.usbaep
    end

    # USBAEP
    def self.usbaep=(value : Bool) : Bool
      self.set(usbaep: value)
      value
    end

    # MPSIZ
    def mpsiz : UInt16
      UInt16.new!((@value >> 0) & 0x7ff_u32)
    end

    # MPSIZ
    def self.mpsiz : UInt16
      value.mpsiz
    end

    # MPSIZ
    def self.mpsiz=(value : UInt16) : UInt16
      self.set(mpsiz: value)
      value
    end

    def copy_with(
      *,

      epena : Bool? = nil,

      epdis : Bool? = nil,

      soddfrm : Bool? = nil,

      sd0_pid_sevnfrm : Bool? = nil,

      snak : Bool? = nil,

      cnak : Bool? = nil,

      txfnum : UInt8? = nil,

      stall : Bool? = nil,

      eptyp : UInt8? = nil,

      usbaep : Bool? = nil,

      mpsiz : UInt16? = nil
    ) : self
      value = @value

      unless epena.nil?
        value = (value & 0x7fffffff_u32) |
                UInt32.new!(epena.to_int).&(0x1_u32) << 31
      end

      unless epdis.nil?
        value = (value & 0xbfffffff_u32) |
                UInt32.new!(epdis.to_int).&(0x1_u32) << 30
      end

      unless soddfrm.nil?
        value = (value & 0xdfffffff_u32) |
                UInt32.new!(soddfrm.to_int).&(0x1_u32) << 29
      end

      unless sd0_pid_sevnfrm.nil?
        value = (value & 0xefffffff_u32) |
                UInt32.new!(sd0_pid_sevnfrm.to_int).&(0x1_u32) << 28
      end

      unless snak.nil?
        value = (value & 0xf7ffffff_u32) |
                UInt32.new!(snak.to_int).&(0x1_u32) << 27
      end

      unless cnak.nil?
        value = (value & 0xfbffffff_u32) |
                UInt32.new!(cnak.to_int).&(0x1_u32) << 26
      end

      unless txfnum.nil?
        value = (value & 0xfc3fffff_u32) |
                UInt32.new!(txfnum.to_int).&(0xf_u32) << 22
      end

      unless stall.nil?
        value = (value & 0xffdfffff_u32) |
                UInt32.new!(stall.to_int).&(0x1_u32) << 21
      end

      unless eptyp.nil?
        value = (value & 0xfff3ffff_u32) |
                UInt32.new!(eptyp.to_int).&(0x3_u32) << 18
      end

      unless usbaep.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(usbaep.to_int).&(0x1_u32) << 15
      end

      unless mpsiz.nil?
        value = (value & 0xfffff800_u32) |
                UInt32.new!(mpsiz.to_int).&(0x7ff_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      epena : Bool? = nil,
      epdis : Bool? = nil,
      soddfrm : Bool? = nil,
      sd0_pid_sevnfrm : Bool? = nil,
      snak : Bool? = nil,
      cnak : Bool? = nil,
      txfnum : UInt8? = nil,
      stall : Bool? = nil,
      eptyp : UInt8? = nil,
      usbaep : Bool? = nil,
      mpsiz : UInt16? = nil
    ) : Nil
      self.value = self.value.copy_with(
        epena: epena,
        epdis: epdis,
        soddfrm: soddfrm,
        sd0_pid_sevnfrm: sd0_pid_sevnfrm,
        snak: snak,
        cnak: cnak,
        txfnum: txfnum,
        stall: stall,
        eptyp: eptyp,
        usbaep: usbaep,
        mpsiz: mpsiz,
      )
    end
  end # struct

  # device endpoint-0 control          register
  struct DOEPCTL0
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

    # EPENA
    def self.epena=(value : Bool) : Bool
      self.set(epena: value)
      value
    end

    # EPDIS
    def epdis : Bool
      @value.bits_set?(0x40000000_u32)
    end

    # EPDIS
    def self.epdis : Bool
      value.epdis
    end

    # SNAK
    def self.snak=(value : Bool) : Bool
      self.set(snak: value)
      value
    end

    # CNAK
    def self.cnak=(value : Bool) : Bool
      self.set(cnak: value)
      value
    end

    # Stall
    def stall : Bool
      @value.bits_set?(0x200000_u32)
    end

    # Stall
    def self.stall : Bool
      value.stall
    end

    # Stall
    def self.stall=(value : Bool) : Bool
      self.set(stall: value)
      value
    end

    # SNPM
    def snpm : Bool
      @value.bits_set?(0x100000_u32)
    end

    # SNPM
    def self.snpm : Bool
      value.snpm
    end

    # SNPM
    def self.snpm=(value : Bool) : Bool
      self.set(snpm: value)
      value
    end

    # EPTYP
    def eptyp : UInt8
      UInt8.new!((@value >> 18) & 0x3_u32)
    end

    # EPTYP
    def self.eptyp : UInt8
      value.eptyp
    end

    # NAKSTS
    def naksts : Bool
      @value.bits_set?(0x20000_u32)
    end

    # NAKSTS
    def self.naksts : Bool
      value.naksts
    end

    # USBAEP
    def usbaep : Bool
      @value.bits_set?(0x8000_u32)
    end

    # USBAEP
    def self.usbaep : Bool
      value.usbaep
    end

    # MPSIZ
    def mpsiz : UInt8
      UInt8.new!((@value >> 0) & 0x3_u32)
    end

    # MPSIZ
    def self.mpsiz : UInt8
      value.mpsiz
    end

    def copy_with(
      *,

      epena : Bool? = nil,

      snak : Bool? = nil,

      cnak : Bool? = nil,

      stall : Bool? = nil,

      snpm : Bool? = nil
    ) : self
      value = @value

      unless epena.nil?
        value = (value & 0x7fffffff_u32) |
                UInt32.new!(epena.to_int).&(0x1_u32) << 31
      end

      unless snak.nil?
        value = (value & 0xf7ffffff_u32) |
                UInt32.new!(snak.to_int).&(0x1_u32) << 27
      end

      unless cnak.nil?
        value = (value & 0xfbffffff_u32) |
                UInt32.new!(cnak.to_int).&(0x1_u32) << 26
      end

      unless stall.nil?
        value = (value & 0xffdfffff_u32) |
                UInt32.new!(stall.to_int).&(0x1_u32) << 21
      end

      unless snpm.nil?
        value = (value & 0xffefffff_u32) |
                UInt32.new!(snpm.to_int).&(0x1_u32) << 20
      end

      self.class.new(value)
    end

    def self.set(
      *,
      epena : Bool? = nil,
      snak : Bool? = nil,
      cnak : Bool? = nil,
      stall : Bool? = nil,
      snpm : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        epena: epena,
        snak: snak,
        cnak: cnak,
        stall: stall,
        snpm: snpm,
      )
    end
  end # struct

  # device endpoint-1 control          register
  struct DOEPCTL1
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

    # EPENA
    def epena : Bool
      @value.bits_set?(0x80000000_u32)
    end

    # EPENA
    def self.epena : Bool
      value.epena
    end

    # EPENA
    def self.epena=(value : Bool) : Bool
      self.set(epena: value)
      value
    end

    # EPDIS
    def epdis : Bool
      @value.bits_set?(0x40000000_u32)
    end

    # EPDIS
    def self.epdis : Bool
      value.epdis
    end

    # EPDIS
    def self.epdis=(value : Bool) : Bool
      self.set(epdis: value)
      value
    end

    # SODDFRM
    def self.soddfrm=(value : Bool) : Bool
      self.set(soddfrm: value)
      value
    end

    # SD0PID/SEVNFRM
    def self.sd0_pid_sevnfrm=(value : Bool) : Bool
      self.set(sd0_pid_sevnfrm: value)
      value
    end

    # SNAK
    def self.snak=(value : Bool) : Bool
      self.set(snak: value)
      value
    end

    # CNAK
    def self.cnak=(value : Bool) : Bool
      self.set(cnak: value)
      value
    end

    # Stall
    def stall : Bool
      @value.bits_set?(0x200000_u32)
    end

    # Stall
    def self.stall : Bool
      value.stall
    end

    # Stall
    def self.stall=(value : Bool) : Bool
      self.set(stall: value)
      value
    end

    # SNPM
    def snpm : Bool
      @value.bits_set?(0x100000_u32)
    end

    # SNPM
    def self.snpm : Bool
      value.snpm
    end

    # SNPM
    def self.snpm=(value : Bool) : Bool
      self.set(snpm: value)
      value
    end

    # EPTYP
    def eptyp : UInt8
      UInt8.new!((@value >> 18) & 0x3_u32)
    end

    # EPTYP
    def self.eptyp : UInt8
      value.eptyp
    end

    # EPTYP
    def self.eptyp=(value : UInt8) : UInt8
      self.set(eptyp: value)
      value
    end

    # NAKSTS
    def naksts : Bool
      @value.bits_set?(0x20000_u32)
    end

    # NAKSTS
    def self.naksts : Bool
      value.naksts
    end

    # EONUM/DPID
    def eonum_dpid : Bool
      @value.bits_set?(0x10000_u32)
    end

    # EONUM/DPID
    def self.eonum_dpid : Bool
      value.eonum_dpid
    end

    # USBAEP
    def usbaep : Bool
      @value.bits_set?(0x8000_u32)
    end

    # USBAEP
    def self.usbaep : Bool
      value.usbaep
    end

    # USBAEP
    def self.usbaep=(value : Bool) : Bool
      self.set(usbaep: value)
      value
    end

    # MPSIZ
    def mpsiz : UInt16
      UInt16.new!((@value >> 0) & 0x7ff_u32)
    end

    # MPSIZ
    def self.mpsiz : UInt16
      value.mpsiz
    end

    # MPSIZ
    def self.mpsiz=(value : UInt16) : UInt16
      self.set(mpsiz: value)
      value
    end

    def copy_with(
      *,

      epena : Bool? = nil,

      epdis : Bool? = nil,

      soddfrm : Bool? = nil,

      sd0_pid_sevnfrm : Bool? = nil,

      snak : Bool? = nil,

      cnak : Bool? = nil,

      stall : Bool? = nil,

      snpm : Bool? = nil,

      eptyp : UInt8? = nil,

      usbaep : Bool? = nil,

      mpsiz : UInt16? = nil
    ) : self
      value = @value

      unless epena.nil?
        value = (value & 0x7fffffff_u32) |
                UInt32.new!(epena.to_int).&(0x1_u32) << 31
      end

      unless epdis.nil?
        value = (value & 0xbfffffff_u32) |
                UInt32.new!(epdis.to_int).&(0x1_u32) << 30
      end

      unless soddfrm.nil?
        value = (value & 0xdfffffff_u32) |
                UInt32.new!(soddfrm.to_int).&(0x1_u32) << 29
      end

      unless sd0_pid_sevnfrm.nil?
        value = (value & 0xefffffff_u32) |
                UInt32.new!(sd0_pid_sevnfrm.to_int).&(0x1_u32) << 28
      end

      unless snak.nil?
        value = (value & 0xf7ffffff_u32) |
                UInt32.new!(snak.to_int).&(0x1_u32) << 27
      end

      unless cnak.nil?
        value = (value & 0xfbffffff_u32) |
                UInt32.new!(cnak.to_int).&(0x1_u32) << 26
      end

      unless stall.nil?
        value = (value & 0xffdfffff_u32) |
                UInt32.new!(stall.to_int).&(0x1_u32) << 21
      end

      unless snpm.nil?
        value = (value & 0xffefffff_u32) |
                UInt32.new!(snpm.to_int).&(0x1_u32) << 20
      end

      unless eptyp.nil?
        value = (value & 0xfff3ffff_u32) |
                UInt32.new!(eptyp.to_int).&(0x3_u32) << 18
      end

      unless usbaep.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(usbaep.to_int).&(0x1_u32) << 15
      end

      unless mpsiz.nil?
        value = (value & 0xfffff800_u32) |
                UInt32.new!(mpsiz.to_int).&(0x7ff_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      epena : Bool? = nil,
      epdis : Bool? = nil,
      soddfrm : Bool? = nil,
      sd0_pid_sevnfrm : Bool? = nil,
      snak : Bool? = nil,
      cnak : Bool? = nil,
      stall : Bool? = nil,
      snpm : Bool? = nil,
      eptyp : UInt8? = nil,
      usbaep : Bool? = nil,
      mpsiz : UInt16? = nil
    ) : Nil
      self.value = self.value.copy_with(
        epena: epena,
        epdis: epdis,
        soddfrm: soddfrm,
        sd0_pid_sevnfrm: sd0_pid_sevnfrm,
        snak: snak,
        cnak: cnak,
        stall: stall,
        snpm: snpm,
        eptyp: eptyp,
        usbaep: usbaep,
        mpsiz: mpsiz,
      )
    end
  end # struct

  # device endpoint-2 control          register
  struct DOEPCTL2
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

    # EPENA
    def epena : Bool
      @value.bits_set?(0x80000000_u32)
    end

    # EPENA
    def self.epena : Bool
      value.epena
    end

    # EPENA
    def self.epena=(value : Bool) : Bool
      self.set(epena: value)
      value
    end

    # EPDIS
    def epdis : Bool
      @value.bits_set?(0x40000000_u32)
    end

    # EPDIS
    def self.epdis : Bool
      value.epdis
    end

    # EPDIS
    def self.epdis=(value : Bool) : Bool
      self.set(epdis: value)
      value
    end

    # SODDFRM
    def self.soddfrm=(value : Bool) : Bool
      self.set(soddfrm: value)
      value
    end

    # SD0PID/SEVNFRM
    def self.sd0_pid_sevnfrm=(value : Bool) : Bool
      self.set(sd0_pid_sevnfrm: value)
      value
    end

    # SNAK
    def self.snak=(value : Bool) : Bool
      self.set(snak: value)
      value
    end

    # CNAK
    def self.cnak=(value : Bool) : Bool
      self.set(cnak: value)
      value
    end

    # Stall
    def stall : Bool
      @value.bits_set?(0x200000_u32)
    end

    # Stall
    def self.stall : Bool
      value.stall
    end

    # Stall
    def self.stall=(value : Bool) : Bool
      self.set(stall: value)
      value
    end

    # SNPM
    def snpm : Bool
      @value.bits_set?(0x100000_u32)
    end

    # SNPM
    def self.snpm : Bool
      value.snpm
    end

    # SNPM
    def self.snpm=(value : Bool) : Bool
      self.set(snpm: value)
      value
    end

    # EPTYP
    def eptyp : UInt8
      UInt8.new!((@value >> 18) & 0x3_u32)
    end

    # EPTYP
    def self.eptyp : UInt8
      value.eptyp
    end

    # EPTYP
    def self.eptyp=(value : UInt8) : UInt8
      self.set(eptyp: value)
      value
    end

    # NAKSTS
    def naksts : Bool
      @value.bits_set?(0x20000_u32)
    end

    # NAKSTS
    def self.naksts : Bool
      value.naksts
    end

    # EONUM/DPID
    def eonum_dpid : Bool
      @value.bits_set?(0x10000_u32)
    end

    # EONUM/DPID
    def self.eonum_dpid : Bool
      value.eonum_dpid
    end

    # USBAEP
    def usbaep : Bool
      @value.bits_set?(0x8000_u32)
    end

    # USBAEP
    def self.usbaep : Bool
      value.usbaep
    end

    # USBAEP
    def self.usbaep=(value : Bool) : Bool
      self.set(usbaep: value)
      value
    end

    # MPSIZ
    def mpsiz : UInt16
      UInt16.new!((@value >> 0) & 0x7ff_u32)
    end

    # MPSIZ
    def self.mpsiz : UInt16
      value.mpsiz
    end

    # MPSIZ
    def self.mpsiz=(value : UInt16) : UInt16
      self.set(mpsiz: value)
      value
    end

    def copy_with(
      *,

      epena : Bool? = nil,

      epdis : Bool? = nil,

      soddfrm : Bool? = nil,

      sd0_pid_sevnfrm : Bool? = nil,

      snak : Bool? = nil,

      cnak : Bool? = nil,

      stall : Bool? = nil,

      snpm : Bool? = nil,

      eptyp : UInt8? = nil,

      usbaep : Bool? = nil,

      mpsiz : UInt16? = nil
    ) : self
      value = @value

      unless epena.nil?
        value = (value & 0x7fffffff_u32) |
                UInt32.new!(epena.to_int).&(0x1_u32) << 31
      end

      unless epdis.nil?
        value = (value & 0xbfffffff_u32) |
                UInt32.new!(epdis.to_int).&(0x1_u32) << 30
      end

      unless soddfrm.nil?
        value = (value & 0xdfffffff_u32) |
                UInt32.new!(soddfrm.to_int).&(0x1_u32) << 29
      end

      unless sd0_pid_sevnfrm.nil?
        value = (value & 0xefffffff_u32) |
                UInt32.new!(sd0_pid_sevnfrm.to_int).&(0x1_u32) << 28
      end

      unless snak.nil?
        value = (value & 0xf7ffffff_u32) |
                UInt32.new!(snak.to_int).&(0x1_u32) << 27
      end

      unless cnak.nil?
        value = (value & 0xfbffffff_u32) |
                UInt32.new!(cnak.to_int).&(0x1_u32) << 26
      end

      unless stall.nil?
        value = (value & 0xffdfffff_u32) |
                UInt32.new!(stall.to_int).&(0x1_u32) << 21
      end

      unless snpm.nil?
        value = (value & 0xffefffff_u32) |
                UInt32.new!(snpm.to_int).&(0x1_u32) << 20
      end

      unless eptyp.nil?
        value = (value & 0xfff3ffff_u32) |
                UInt32.new!(eptyp.to_int).&(0x3_u32) << 18
      end

      unless usbaep.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(usbaep.to_int).&(0x1_u32) << 15
      end

      unless mpsiz.nil?
        value = (value & 0xfffff800_u32) |
                UInt32.new!(mpsiz.to_int).&(0x7ff_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      epena : Bool? = nil,
      epdis : Bool? = nil,
      soddfrm : Bool? = nil,
      sd0_pid_sevnfrm : Bool? = nil,
      snak : Bool? = nil,
      cnak : Bool? = nil,
      stall : Bool? = nil,
      snpm : Bool? = nil,
      eptyp : UInt8? = nil,
      usbaep : Bool? = nil,
      mpsiz : UInt16? = nil
    ) : Nil
      self.value = self.value.copy_with(
        epena: epena,
        epdis: epdis,
        soddfrm: soddfrm,
        sd0_pid_sevnfrm: sd0_pid_sevnfrm,
        snak: snak,
        cnak: cnak,
        stall: stall,
        snpm: snpm,
        eptyp: eptyp,
        usbaep: usbaep,
        mpsiz: mpsiz,
      )
    end
  end # struct

  # device endpoint-3 control          register
  struct DOEPCTL3
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

    # EPENA
    def epena : Bool
      @value.bits_set?(0x80000000_u32)
    end

    # EPENA
    def self.epena : Bool
      value.epena
    end

    # EPENA
    def self.epena=(value : Bool) : Bool
      self.set(epena: value)
      value
    end

    # EPDIS
    def epdis : Bool
      @value.bits_set?(0x40000000_u32)
    end

    # EPDIS
    def self.epdis : Bool
      value.epdis
    end

    # EPDIS
    def self.epdis=(value : Bool) : Bool
      self.set(epdis: value)
      value
    end

    # SODDFRM
    def self.soddfrm=(value : Bool) : Bool
      self.set(soddfrm: value)
      value
    end

    # SD0PID/SEVNFRM
    def self.sd0_pid_sevnfrm=(value : Bool) : Bool
      self.set(sd0_pid_sevnfrm: value)
      value
    end

    # SNAK
    def self.snak=(value : Bool) : Bool
      self.set(snak: value)
      value
    end

    # CNAK
    def self.cnak=(value : Bool) : Bool
      self.set(cnak: value)
      value
    end

    # Stall
    def stall : Bool
      @value.bits_set?(0x200000_u32)
    end

    # Stall
    def self.stall : Bool
      value.stall
    end

    # Stall
    def self.stall=(value : Bool) : Bool
      self.set(stall: value)
      value
    end

    # SNPM
    def snpm : Bool
      @value.bits_set?(0x100000_u32)
    end

    # SNPM
    def self.snpm : Bool
      value.snpm
    end

    # SNPM
    def self.snpm=(value : Bool) : Bool
      self.set(snpm: value)
      value
    end

    # EPTYP
    def eptyp : UInt8
      UInt8.new!((@value >> 18) & 0x3_u32)
    end

    # EPTYP
    def self.eptyp : UInt8
      value.eptyp
    end

    # EPTYP
    def self.eptyp=(value : UInt8) : UInt8
      self.set(eptyp: value)
      value
    end

    # NAKSTS
    def naksts : Bool
      @value.bits_set?(0x20000_u32)
    end

    # NAKSTS
    def self.naksts : Bool
      value.naksts
    end

    # EONUM/DPID
    def eonum_dpid : Bool
      @value.bits_set?(0x10000_u32)
    end

    # EONUM/DPID
    def self.eonum_dpid : Bool
      value.eonum_dpid
    end

    # USBAEP
    def usbaep : Bool
      @value.bits_set?(0x8000_u32)
    end

    # USBAEP
    def self.usbaep : Bool
      value.usbaep
    end

    # USBAEP
    def self.usbaep=(value : Bool) : Bool
      self.set(usbaep: value)
      value
    end

    # MPSIZ
    def mpsiz : UInt16
      UInt16.new!((@value >> 0) & 0x7ff_u32)
    end

    # MPSIZ
    def self.mpsiz : UInt16
      value.mpsiz
    end

    # MPSIZ
    def self.mpsiz=(value : UInt16) : UInt16
      self.set(mpsiz: value)
      value
    end

    def copy_with(
      *,

      epena : Bool? = nil,

      epdis : Bool? = nil,

      soddfrm : Bool? = nil,

      sd0_pid_sevnfrm : Bool? = nil,

      snak : Bool? = nil,

      cnak : Bool? = nil,

      stall : Bool? = nil,

      snpm : Bool? = nil,

      eptyp : UInt8? = nil,

      usbaep : Bool? = nil,

      mpsiz : UInt16? = nil
    ) : self
      value = @value

      unless epena.nil?
        value = (value & 0x7fffffff_u32) |
                UInt32.new!(epena.to_int).&(0x1_u32) << 31
      end

      unless epdis.nil?
        value = (value & 0xbfffffff_u32) |
                UInt32.new!(epdis.to_int).&(0x1_u32) << 30
      end

      unless soddfrm.nil?
        value = (value & 0xdfffffff_u32) |
                UInt32.new!(soddfrm.to_int).&(0x1_u32) << 29
      end

      unless sd0_pid_sevnfrm.nil?
        value = (value & 0xefffffff_u32) |
                UInt32.new!(sd0_pid_sevnfrm.to_int).&(0x1_u32) << 28
      end

      unless snak.nil?
        value = (value & 0xf7ffffff_u32) |
                UInt32.new!(snak.to_int).&(0x1_u32) << 27
      end

      unless cnak.nil?
        value = (value & 0xfbffffff_u32) |
                UInt32.new!(cnak.to_int).&(0x1_u32) << 26
      end

      unless stall.nil?
        value = (value & 0xffdfffff_u32) |
                UInt32.new!(stall.to_int).&(0x1_u32) << 21
      end

      unless snpm.nil?
        value = (value & 0xffefffff_u32) |
                UInt32.new!(snpm.to_int).&(0x1_u32) << 20
      end

      unless eptyp.nil?
        value = (value & 0xfff3ffff_u32) |
                UInt32.new!(eptyp.to_int).&(0x3_u32) << 18
      end

      unless usbaep.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(usbaep.to_int).&(0x1_u32) << 15
      end

      unless mpsiz.nil?
        value = (value & 0xfffff800_u32) |
                UInt32.new!(mpsiz.to_int).&(0x7ff_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      epena : Bool? = nil,
      epdis : Bool? = nil,
      soddfrm : Bool? = nil,
      sd0_pid_sevnfrm : Bool? = nil,
      snak : Bool? = nil,
      cnak : Bool? = nil,
      stall : Bool? = nil,
      snpm : Bool? = nil,
      eptyp : UInt8? = nil,
      usbaep : Bool? = nil,
      mpsiz : UInt16? = nil
    ) : Nil
      self.value = self.value.copy_with(
        epena: epena,
        epdis: epdis,
        soddfrm: soddfrm,
        sd0_pid_sevnfrm: sd0_pid_sevnfrm,
        snak: snak,
        cnak: cnak,
        stall: stall,
        snpm: snpm,
        eptyp: eptyp,
        usbaep: usbaep,
        mpsiz: mpsiz,
      )
    end
  end # struct

  # device endpoint-x interrupt          register
  struct DIEPINT0
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

    # TXFE
    def txfe : Bool
      @value.bits_set?(0x80_u32)
    end

    # TXFE
    def self.txfe : Bool
      value.txfe
    end

    # INEPNE
    def inepne : Bool
      @value.bits_set?(0x40_u32)
    end

    # INEPNE
    def self.inepne : Bool
      value.inepne
    end

    # INEPNE
    def self.inepne=(value : Bool) : Bool
      self.set(inepne: value)
      value
    end

    # ITTXFE
    def ittxfe : Bool
      @value.bits_set?(0x10_u32)
    end

    # ITTXFE
    def self.ittxfe : Bool
      value.ittxfe
    end

    # ITTXFE
    def self.ittxfe=(value : Bool) : Bool
      self.set(ittxfe: value)
      value
    end

    # TOC
    def toc : Bool
      @value.bits_set?(0x8_u32)
    end

    # TOC
    def self.toc : Bool
      value.toc
    end

    # TOC
    def self.toc=(value : Bool) : Bool
      self.set(toc: value)
      value
    end

    # EPDISD
    def epdisd : Bool
      @value.bits_set?(0x2_u32)
    end

    # EPDISD
    def self.epdisd : Bool
      value.epdisd
    end

    # EPDISD
    def self.epdisd=(value : Bool) : Bool
      self.set(epdisd: value)
      value
    end

    # XFRC
    def xfrc : Bool
      @value.bits_set?(0x1_u32)
    end

    # XFRC
    def self.xfrc : Bool
      value.xfrc
    end

    # XFRC
    def self.xfrc=(value : Bool) : Bool
      self.set(xfrc: value)
      value
    end

    def copy_with(
      *,

      inepne : Bool? = nil,

      ittxfe : Bool? = nil,

      toc : Bool? = nil,

      epdisd : Bool? = nil,

      xfrc : Bool? = nil
    ) : self
      value = @value

      unless inepne.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(inepne.to_int).&(0x1_u32) << 6
      end

      unless ittxfe.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(ittxfe.to_int).&(0x1_u32) << 4
      end

      unless toc.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(toc.to_int).&(0x1_u32) << 3
      end

      unless epdisd.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(epdisd.to_int).&(0x1_u32) << 1
      end

      unless xfrc.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(xfrc.to_int).&(0x1_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      inepne : Bool? = nil,
      ittxfe : Bool? = nil,
      toc : Bool? = nil,
      epdisd : Bool? = nil,
      xfrc : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        inepne: inepne,
        ittxfe: ittxfe,
        toc: toc,
        epdisd: epdisd,
        xfrc: xfrc,
      )
    end
  end # struct

  # device endpoint-1 interrupt          register
  struct DIEPINT1
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

    # TXFE
    def txfe : Bool
      @value.bits_set?(0x80_u32)
    end

    # TXFE
    def self.txfe : Bool
      value.txfe
    end

    # INEPNE
    def inepne : Bool
      @value.bits_set?(0x40_u32)
    end

    # INEPNE
    def self.inepne : Bool
      value.inepne
    end

    # INEPNE
    def self.inepne=(value : Bool) : Bool
      self.set(inepne: value)
      value
    end

    # ITTXFE
    def ittxfe : Bool
      @value.bits_set?(0x10_u32)
    end

    # ITTXFE
    def self.ittxfe : Bool
      value.ittxfe
    end

    # ITTXFE
    def self.ittxfe=(value : Bool) : Bool
      self.set(ittxfe: value)
      value
    end

    # TOC
    def toc : Bool
      @value.bits_set?(0x8_u32)
    end

    # TOC
    def self.toc : Bool
      value.toc
    end

    # TOC
    def self.toc=(value : Bool) : Bool
      self.set(toc: value)
      value
    end

    # EPDISD
    def epdisd : Bool
      @value.bits_set?(0x2_u32)
    end

    # EPDISD
    def self.epdisd : Bool
      value.epdisd
    end

    # EPDISD
    def self.epdisd=(value : Bool) : Bool
      self.set(epdisd: value)
      value
    end

    # XFRC
    def xfrc : Bool
      @value.bits_set?(0x1_u32)
    end

    # XFRC
    def self.xfrc : Bool
      value.xfrc
    end

    # XFRC
    def self.xfrc=(value : Bool) : Bool
      self.set(xfrc: value)
      value
    end

    def copy_with(
      *,

      inepne : Bool? = nil,

      ittxfe : Bool? = nil,

      toc : Bool? = nil,

      epdisd : Bool? = nil,

      xfrc : Bool? = nil
    ) : self
      value = @value

      unless inepne.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(inepne.to_int).&(0x1_u32) << 6
      end

      unless ittxfe.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(ittxfe.to_int).&(0x1_u32) << 4
      end

      unless toc.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(toc.to_int).&(0x1_u32) << 3
      end

      unless epdisd.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(epdisd.to_int).&(0x1_u32) << 1
      end

      unless xfrc.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(xfrc.to_int).&(0x1_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      inepne : Bool? = nil,
      ittxfe : Bool? = nil,
      toc : Bool? = nil,
      epdisd : Bool? = nil,
      xfrc : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        inepne: inepne,
        ittxfe: ittxfe,
        toc: toc,
        epdisd: epdisd,
        xfrc: xfrc,
      )
    end
  end # struct

  # device endpoint-2 interrupt          register
  struct DIEPINT2
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

    # TXFE
    def txfe : Bool
      @value.bits_set?(0x80_u32)
    end

    # TXFE
    def self.txfe : Bool
      value.txfe
    end

    # INEPNE
    def inepne : Bool
      @value.bits_set?(0x40_u32)
    end

    # INEPNE
    def self.inepne : Bool
      value.inepne
    end

    # INEPNE
    def self.inepne=(value : Bool) : Bool
      self.set(inepne: value)
      value
    end

    # ITTXFE
    def ittxfe : Bool
      @value.bits_set?(0x10_u32)
    end

    # ITTXFE
    def self.ittxfe : Bool
      value.ittxfe
    end

    # ITTXFE
    def self.ittxfe=(value : Bool) : Bool
      self.set(ittxfe: value)
      value
    end

    # TOC
    def toc : Bool
      @value.bits_set?(0x8_u32)
    end

    # TOC
    def self.toc : Bool
      value.toc
    end

    # TOC
    def self.toc=(value : Bool) : Bool
      self.set(toc: value)
      value
    end

    # EPDISD
    def epdisd : Bool
      @value.bits_set?(0x2_u32)
    end

    # EPDISD
    def self.epdisd : Bool
      value.epdisd
    end

    # EPDISD
    def self.epdisd=(value : Bool) : Bool
      self.set(epdisd: value)
      value
    end

    # XFRC
    def xfrc : Bool
      @value.bits_set?(0x1_u32)
    end

    # XFRC
    def self.xfrc : Bool
      value.xfrc
    end

    # XFRC
    def self.xfrc=(value : Bool) : Bool
      self.set(xfrc: value)
      value
    end

    def copy_with(
      *,

      inepne : Bool? = nil,

      ittxfe : Bool? = nil,

      toc : Bool? = nil,

      epdisd : Bool? = nil,

      xfrc : Bool? = nil
    ) : self
      value = @value

      unless inepne.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(inepne.to_int).&(0x1_u32) << 6
      end

      unless ittxfe.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(ittxfe.to_int).&(0x1_u32) << 4
      end

      unless toc.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(toc.to_int).&(0x1_u32) << 3
      end

      unless epdisd.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(epdisd.to_int).&(0x1_u32) << 1
      end

      unless xfrc.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(xfrc.to_int).&(0x1_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      inepne : Bool? = nil,
      ittxfe : Bool? = nil,
      toc : Bool? = nil,
      epdisd : Bool? = nil,
      xfrc : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        inepne: inepne,
        ittxfe: ittxfe,
        toc: toc,
        epdisd: epdisd,
        xfrc: xfrc,
      )
    end
  end # struct

  # device endpoint-3 interrupt          register
  struct DIEPINT3
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

    # TXFE
    def txfe : Bool
      @value.bits_set?(0x80_u32)
    end

    # TXFE
    def self.txfe : Bool
      value.txfe
    end

    # INEPNE
    def inepne : Bool
      @value.bits_set?(0x40_u32)
    end

    # INEPNE
    def self.inepne : Bool
      value.inepne
    end

    # INEPNE
    def self.inepne=(value : Bool) : Bool
      self.set(inepne: value)
      value
    end

    # ITTXFE
    def ittxfe : Bool
      @value.bits_set?(0x10_u32)
    end

    # ITTXFE
    def self.ittxfe : Bool
      value.ittxfe
    end

    # ITTXFE
    def self.ittxfe=(value : Bool) : Bool
      self.set(ittxfe: value)
      value
    end

    # TOC
    def toc : Bool
      @value.bits_set?(0x8_u32)
    end

    # TOC
    def self.toc : Bool
      value.toc
    end

    # TOC
    def self.toc=(value : Bool) : Bool
      self.set(toc: value)
      value
    end

    # EPDISD
    def epdisd : Bool
      @value.bits_set?(0x2_u32)
    end

    # EPDISD
    def self.epdisd : Bool
      value.epdisd
    end

    # EPDISD
    def self.epdisd=(value : Bool) : Bool
      self.set(epdisd: value)
      value
    end

    # XFRC
    def xfrc : Bool
      @value.bits_set?(0x1_u32)
    end

    # XFRC
    def self.xfrc : Bool
      value.xfrc
    end

    # XFRC
    def self.xfrc=(value : Bool) : Bool
      self.set(xfrc: value)
      value
    end

    def copy_with(
      *,

      inepne : Bool? = nil,

      ittxfe : Bool? = nil,

      toc : Bool? = nil,

      epdisd : Bool? = nil,

      xfrc : Bool? = nil
    ) : self
      value = @value

      unless inepne.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(inepne.to_int).&(0x1_u32) << 6
      end

      unless ittxfe.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(ittxfe.to_int).&(0x1_u32) << 4
      end

      unless toc.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(toc.to_int).&(0x1_u32) << 3
      end

      unless epdisd.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(epdisd.to_int).&(0x1_u32) << 1
      end

      unless xfrc.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(xfrc.to_int).&(0x1_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      inepne : Bool? = nil,
      ittxfe : Bool? = nil,
      toc : Bool? = nil,
      epdisd : Bool? = nil,
      xfrc : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        inepne: inepne,
        ittxfe: ittxfe,
        toc: toc,
        epdisd: epdisd,
        xfrc: xfrc,
      )
    end
  end # struct

  # device endpoint-0 interrupt          register
  struct DOEPINT0
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

    # B2BSTUP
    def b2_bstup : Bool
      @value.bits_set?(0x40_u32)
    end

    # B2BSTUP
    def self.b2_bstup : Bool
      value.b2_bstup
    end

    # B2BSTUP
    def self.b2_bstup=(value : Bool) : Bool
      self.set(b2_bstup: value)
      value
    end

    # OTEPDIS
    def otepdis : Bool
      @value.bits_set?(0x10_u32)
    end

    # OTEPDIS
    def self.otepdis : Bool
      value.otepdis
    end

    # OTEPDIS
    def self.otepdis=(value : Bool) : Bool
      self.set(otepdis: value)
      value
    end

    # STUP
    def stup : Bool
      @value.bits_set?(0x8_u32)
    end

    # STUP
    def self.stup : Bool
      value.stup
    end

    # STUP
    def self.stup=(value : Bool) : Bool
      self.set(stup: value)
      value
    end

    # EPDISD
    def epdisd : Bool
      @value.bits_set?(0x2_u32)
    end

    # EPDISD
    def self.epdisd : Bool
      value.epdisd
    end

    # EPDISD
    def self.epdisd=(value : Bool) : Bool
      self.set(epdisd: value)
      value
    end

    # XFRC
    def xfrc : Bool
      @value.bits_set?(0x1_u32)
    end

    # XFRC
    def self.xfrc : Bool
      value.xfrc
    end

    # XFRC
    def self.xfrc=(value : Bool) : Bool
      self.set(xfrc: value)
      value
    end

    def copy_with(
      *,

      b2_bstup : Bool? = nil,

      otepdis : Bool? = nil,

      stup : Bool? = nil,

      epdisd : Bool? = nil,

      xfrc : Bool? = nil
    ) : self
      value = @value

      unless b2_bstup.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(b2_bstup.to_int).&(0x1_u32) << 6
      end

      unless otepdis.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(otepdis.to_int).&(0x1_u32) << 4
      end

      unless stup.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(stup.to_int).&(0x1_u32) << 3
      end

      unless epdisd.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(epdisd.to_int).&(0x1_u32) << 1
      end

      unless xfrc.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(xfrc.to_int).&(0x1_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      b2_bstup : Bool? = nil,
      otepdis : Bool? = nil,
      stup : Bool? = nil,
      epdisd : Bool? = nil,
      xfrc : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        b2_bstup: b2_bstup,
        otepdis: otepdis,
        stup: stup,
        epdisd: epdisd,
        xfrc: xfrc,
      )
    end
  end # struct

  # device endpoint-1 interrupt          register
  struct DOEPINT1
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

    # B2BSTUP
    def b2_bstup : Bool
      @value.bits_set?(0x40_u32)
    end

    # B2BSTUP
    def self.b2_bstup : Bool
      value.b2_bstup
    end

    # B2BSTUP
    def self.b2_bstup=(value : Bool) : Bool
      self.set(b2_bstup: value)
      value
    end

    # OTEPDIS
    def otepdis : Bool
      @value.bits_set?(0x10_u32)
    end

    # OTEPDIS
    def self.otepdis : Bool
      value.otepdis
    end

    # OTEPDIS
    def self.otepdis=(value : Bool) : Bool
      self.set(otepdis: value)
      value
    end

    # STUP
    def stup : Bool
      @value.bits_set?(0x8_u32)
    end

    # STUP
    def self.stup : Bool
      value.stup
    end

    # STUP
    def self.stup=(value : Bool) : Bool
      self.set(stup: value)
      value
    end

    # EPDISD
    def epdisd : Bool
      @value.bits_set?(0x2_u32)
    end

    # EPDISD
    def self.epdisd : Bool
      value.epdisd
    end

    # EPDISD
    def self.epdisd=(value : Bool) : Bool
      self.set(epdisd: value)
      value
    end

    # XFRC
    def xfrc : Bool
      @value.bits_set?(0x1_u32)
    end

    # XFRC
    def self.xfrc : Bool
      value.xfrc
    end

    # XFRC
    def self.xfrc=(value : Bool) : Bool
      self.set(xfrc: value)
      value
    end

    def copy_with(
      *,

      b2_bstup : Bool? = nil,

      otepdis : Bool? = nil,

      stup : Bool? = nil,

      epdisd : Bool? = nil,

      xfrc : Bool? = nil
    ) : self
      value = @value

      unless b2_bstup.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(b2_bstup.to_int).&(0x1_u32) << 6
      end

      unless otepdis.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(otepdis.to_int).&(0x1_u32) << 4
      end

      unless stup.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(stup.to_int).&(0x1_u32) << 3
      end

      unless epdisd.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(epdisd.to_int).&(0x1_u32) << 1
      end

      unless xfrc.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(xfrc.to_int).&(0x1_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      b2_bstup : Bool? = nil,
      otepdis : Bool? = nil,
      stup : Bool? = nil,
      epdisd : Bool? = nil,
      xfrc : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        b2_bstup: b2_bstup,
        otepdis: otepdis,
        stup: stup,
        epdisd: epdisd,
        xfrc: xfrc,
      )
    end
  end # struct

  # device endpoint-2 interrupt          register
  struct DOEPINT2
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

    # B2BSTUP
    def b2_bstup : Bool
      @value.bits_set?(0x40_u32)
    end

    # B2BSTUP
    def self.b2_bstup : Bool
      value.b2_bstup
    end

    # B2BSTUP
    def self.b2_bstup=(value : Bool) : Bool
      self.set(b2_bstup: value)
      value
    end

    # OTEPDIS
    def otepdis : Bool
      @value.bits_set?(0x10_u32)
    end

    # OTEPDIS
    def self.otepdis : Bool
      value.otepdis
    end

    # OTEPDIS
    def self.otepdis=(value : Bool) : Bool
      self.set(otepdis: value)
      value
    end

    # STUP
    def stup : Bool
      @value.bits_set?(0x8_u32)
    end

    # STUP
    def self.stup : Bool
      value.stup
    end

    # STUP
    def self.stup=(value : Bool) : Bool
      self.set(stup: value)
      value
    end

    # EPDISD
    def epdisd : Bool
      @value.bits_set?(0x2_u32)
    end

    # EPDISD
    def self.epdisd : Bool
      value.epdisd
    end

    # EPDISD
    def self.epdisd=(value : Bool) : Bool
      self.set(epdisd: value)
      value
    end

    # XFRC
    def xfrc : Bool
      @value.bits_set?(0x1_u32)
    end

    # XFRC
    def self.xfrc : Bool
      value.xfrc
    end

    # XFRC
    def self.xfrc=(value : Bool) : Bool
      self.set(xfrc: value)
      value
    end

    def copy_with(
      *,

      b2_bstup : Bool? = nil,

      otepdis : Bool? = nil,

      stup : Bool? = nil,

      epdisd : Bool? = nil,

      xfrc : Bool? = nil
    ) : self
      value = @value

      unless b2_bstup.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(b2_bstup.to_int).&(0x1_u32) << 6
      end

      unless otepdis.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(otepdis.to_int).&(0x1_u32) << 4
      end

      unless stup.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(stup.to_int).&(0x1_u32) << 3
      end

      unless epdisd.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(epdisd.to_int).&(0x1_u32) << 1
      end

      unless xfrc.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(xfrc.to_int).&(0x1_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      b2_bstup : Bool? = nil,
      otepdis : Bool? = nil,
      stup : Bool? = nil,
      epdisd : Bool? = nil,
      xfrc : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        b2_bstup: b2_bstup,
        otepdis: otepdis,
        stup: stup,
        epdisd: epdisd,
        xfrc: xfrc,
      )
    end
  end # struct

  # device endpoint-3 interrupt          register
  struct DOEPINT3
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

    # B2BSTUP
    def b2_bstup : Bool
      @value.bits_set?(0x40_u32)
    end

    # B2BSTUP
    def self.b2_bstup : Bool
      value.b2_bstup
    end

    # B2BSTUP
    def self.b2_bstup=(value : Bool) : Bool
      self.set(b2_bstup: value)
      value
    end

    # OTEPDIS
    def otepdis : Bool
      @value.bits_set?(0x10_u32)
    end

    # OTEPDIS
    def self.otepdis : Bool
      value.otepdis
    end

    # OTEPDIS
    def self.otepdis=(value : Bool) : Bool
      self.set(otepdis: value)
      value
    end

    # STUP
    def stup : Bool
      @value.bits_set?(0x8_u32)
    end

    # STUP
    def self.stup : Bool
      value.stup
    end

    # STUP
    def self.stup=(value : Bool) : Bool
      self.set(stup: value)
      value
    end

    # EPDISD
    def epdisd : Bool
      @value.bits_set?(0x2_u32)
    end

    # EPDISD
    def self.epdisd : Bool
      value.epdisd
    end

    # EPDISD
    def self.epdisd=(value : Bool) : Bool
      self.set(epdisd: value)
      value
    end

    # XFRC
    def xfrc : Bool
      @value.bits_set?(0x1_u32)
    end

    # XFRC
    def self.xfrc : Bool
      value.xfrc
    end

    # XFRC
    def self.xfrc=(value : Bool) : Bool
      self.set(xfrc: value)
      value
    end

    def copy_with(
      *,

      b2_bstup : Bool? = nil,

      otepdis : Bool? = nil,

      stup : Bool? = nil,

      epdisd : Bool? = nil,

      xfrc : Bool? = nil
    ) : self
      value = @value

      unless b2_bstup.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(b2_bstup.to_int).&(0x1_u32) << 6
      end

      unless otepdis.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(otepdis.to_int).&(0x1_u32) << 4
      end

      unless stup.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(stup.to_int).&(0x1_u32) << 3
      end

      unless epdisd.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(epdisd.to_int).&(0x1_u32) << 1
      end

      unless xfrc.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(xfrc.to_int).&(0x1_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      b2_bstup : Bool? = nil,
      otepdis : Bool? = nil,
      stup : Bool? = nil,
      epdisd : Bool? = nil,
      xfrc : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        b2_bstup: b2_bstup,
        otepdis: otepdis,
        stup: stup,
        epdisd: epdisd,
        xfrc: xfrc,
      )
    end
  end # struct

  # device endpoint-0 transfer size          register
  struct DIEPTSIZ0
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

    def copy_with(
      *,

      pktcnt : UInt8? = nil,

      xfrsiz : UInt8? = nil
    ) : self
      value = @value

      unless pktcnt.nil?
        value = (value & 0xffe7ffff_u32) |
                UInt32.new!(pktcnt.to_int).&(0x3_u32) << 19
      end

      unless xfrsiz.nil?
        value = (value & 0xffffff80_u32) |
                UInt32.new!(xfrsiz.to_int).&(0x7f_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      pktcnt : UInt8? = nil,
      xfrsiz : UInt8? = nil
    ) : Nil
      self.value = self.value.copy_with(
        pktcnt: pktcnt,
        xfrsiz: xfrsiz,
      )
    end
  end # struct

  # device OUT endpoint-0 transfer size          register
  struct DOEPTSIZ0
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

    def copy_with(
      *,

      stupcnt : UInt8? = nil,

      pktcnt : Bool? = nil,

      xfrsiz : UInt8? = nil
    ) : self
      value = @value

      unless stupcnt.nil?
        value = (value & 0x9fffffff_u32) |
                UInt32.new!(stupcnt.to_int).&(0x3_u32) << 29
      end

      unless pktcnt.nil?
        value = (value & 0xfff7ffff_u32) |
                UInt32.new!(pktcnt.to_int).&(0x1_u32) << 19
      end

      unless xfrsiz.nil?
        value = (value & 0xffffff80_u32) |
                UInt32.new!(xfrsiz.to_int).&(0x7f_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      stupcnt : UInt8? = nil,
      pktcnt : Bool? = nil,
      xfrsiz : UInt8? = nil
    ) : Nil
      self.value = self.value.copy_with(
        stupcnt: stupcnt,
        pktcnt: pktcnt,
        xfrsiz: xfrsiz,
      )
    end
  end # struct

  # device endpoint-1 transfer size          register
  struct DIEPTSIZ1
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

    def copy_with(
      *,

      mcnt : UInt8? = nil,

      pktcnt : UInt16? = nil,

      xfrsiz : UInt32? = nil
    ) : self
      value = @value

      unless mcnt.nil?
        value = (value & 0x9fffffff_u32) |
                UInt32.new!(mcnt.to_int).&(0x3_u32) << 29
      end

      unless pktcnt.nil?
        value = (value & 0xe007ffff_u32) |
                UInt32.new!(pktcnt.to_int).&(0x3ff_u32) << 19
      end

      unless xfrsiz.nil?
        value = (value & 0xfff80000_u32) |
                UInt32.new!(xfrsiz.to_int).&(0x7ffff_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      mcnt : UInt8? = nil,
      pktcnt : UInt16? = nil,
      xfrsiz : UInt32? = nil
    ) : Nil
      self.value = self.value.copy_with(
        mcnt: mcnt,
        pktcnt: pktcnt,
        xfrsiz: xfrsiz,
      )
    end
  end # struct

  # device endpoint-2 transfer size          register
  struct DIEPTSIZ2
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

    def copy_with(
      *,

      mcnt : UInt8? = nil,

      pktcnt : UInt16? = nil,

      xfrsiz : UInt32? = nil
    ) : self
      value = @value

      unless mcnt.nil?
        value = (value & 0x9fffffff_u32) |
                UInt32.new!(mcnt.to_int).&(0x3_u32) << 29
      end

      unless pktcnt.nil?
        value = (value & 0xe007ffff_u32) |
                UInt32.new!(pktcnt.to_int).&(0x3ff_u32) << 19
      end

      unless xfrsiz.nil?
        value = (value & 0xfff80000_u32) |
                UInt32.new!(xfrsiz.to_int).&(0x7ffff_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      mcnt : UInt8? = nil,
      pktcnt : UInt16? = nil,
      xfrsiz : UInt32? = nil
    ) : Nil
      self.value = self.value.copy_with(
        mcnt: mcnt,
        pktcnt: pktcnt,
        xfrsiz: xfrsiz,
      )
    end
  end # struct

  # device endpoint-3 transfer size          register
  struct DIEPTSIZ3
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

    def copy_with(
      *,

      mcnt : UInt8? = nil,

      pktcnt : UInt16? = nil,

      xfrsiz : UInt32? = nil
    ) : self
      value = @value

      unless mcnt.nil?
        value = (value & 0x9fffffff_u32) |
                UInt32.new!(mcnt.to_int).&(0x3_u32) << 29
      end

      unless pktcnt.nil?
        value = (value & 0xe007ffff_u32) |
                UInt32.new!(pktcnt.to_int).&(0x3ff_u32) << 19
      end

      unless xfrsiz.nil?
        value = (value & 0xfff80000_u32) |
                UInt32.new!(xfrsiz.to_int).&(0x7ffff_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      mcnt : UInt8? = nil,
      pktcnt : UInt16? = nil,
      xfrsiz : UInt32? = nil
    ) : Nil
      self.value = self.value.copy_with(
        mcnt: mcnt,
        pktcnt: pktcnt,
        xfrsiz: xfrsiz,
      )
    end
  end # struct

  # OTG_FS device IN endpoint transmit FIFO          status register
  struct DTXFSTS0
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

    # IN endpoint TxFIFO space              available
    def ineptfsav : UInt16
      UInt16.new!((@value >> 0) & 0xffff_u32)
    end

    # IN endpoint TxFIFO space              available
    def self.ineptfsav : UInt16
      value.ineptfsav
    end
  end # struct

  # OTG_FS device IN endpoint transmit FIFO          status register
  struct DTXFSTS1
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

    # IN endpoint TxFIFO space              available
    def ineptfsav : UInt16
      UInt16.new!((@value >> 0) & 0xffff_u32)
    end

    # IN endpoint TxFIFO space              available
    def self.ineptfsav : UInt16
      value.ineptfsav
    end
  end # struct

  # OTG_FS device IN endpoint transmit FIFO          status register
  struct DTXFSTS2
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

    # IN endpoint TxFIFO space              available
    def ineptfsav : UInt16
      UInt16.new!((@value >> 0) & 0xffff_u32)
    end

    # IN endpoint TxFIFO space              available
    def self.ineptfsav : UInt16
      value.ineptfsav
    end
  end # struct

  # OTG_FS device IN endpoint transmit FIFO          status register
  struct DTXFSTS3
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

    # IN endpoint TxFIFO space              available
    def ineptfsav : UInt16
      UInt16.new!((@value >> 0) & 0xffff_u32)
    end

    # IN endpoint TxFIFO space              available
    def self.ineptfsav : UInt16
      value.ineptfsav
    end
  end # struct

  # device OUT endpoint-1 transfer size          register
  struct DOEPTSIZ1
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

    def copy_with(
      *,

      rxdpid_stupcnt : UInt8? = nil,

      pktcnt : UInt16? = nil,

      xfrsiz : UInt32? = nil
    ) : self
      value = @value

      unless rxdpid_stupcnt.nil?
        value = (value & 0x9fffffff_u32) |
                UInt32.new!(rxdpid_stupcnt.to_int).&(0x3_u32) << 29
      end

      unless pktcnt.nil?
        value = (value & 0xe007ffff_u32) |
                UInt32.new!(pktcnt.to_int).&(0x3ff_u32) << 19
      end

      unless xfrsiz.nil?
        value = (value & 0xfff80000_u32) |
                UInt32.new!(xfrsiz.to_int).&(0x7ffff_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      rxdpid_stupcnt : UInt8? = nil,
      pktcnt : UInt16? = nil,
      xfrsiz : UInt32? = nil
    ) : Nil
      self.value = self.value.copy_with(
        rxdpid_stupcnt: rxdpid_stupcnt,
        pktcnt: pktcnt,
        xfrsiz: xfrsiz,
      )
    end
  end # struct

  # device OUT endpoint-2 transfer size          register
  struct DOEPTSIZ2
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

    def copy_with(
      *,

      rxdpid_stupcnt : UInt8? = nil,

      pktcnt : UInt16? = nil,

      xfrsiz : UInt32? = nil
    ) : self
      value = @value

      unless rxdpid_stupcnt.nil?
        value = (value & 0x9fffffff_u32) |
                UInt32.new!(rxdpid_stupcnt.to_int).&(0x3_u32) << 29
      end

      unless pktcnt.nil?
        value = (value & 0xe007ffff_u32) |
                UInt32.new!(pktcnt.to_int).&(0x3ff_u32) << 19
      end

      unless xfrsiz.nil?
        value = (value & 0xfff80000_u32) |
                UInt32.new!(xfrsiz.to_int).&(0x7ffff_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      rxdpid_stupcnt : UInt8? = nil,
      pktcnt : UInt16? = nil,
      xfrsiz : UInt32? = nil
    ) : Nil
      self.value = self.value.copy_with(
        rxdpid_stupcnt: rxdpid_stupcnt,
        pktcnt: pktcnt,
        xfrsiz: xfrsiz,
      )
    end
  end # struct

  # device OUT endpoint-3 transfer size          register
  struct DOEPTSIZ3
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

    def copy_with(
      *,

      rxdpid_stupcnt : UInt8? = nil,

      pktcnt : UInt16? = nil,

      xfrsiz : UInt32? = nil
    ) : self
      value = @value

      unless rxdpid_stupcnt.nil?
        value = (value & 0x9fffffff_u32) |
                UInt32.new!(rxdpid_stupcnt.to_int).&(0x3_u32) << 29
      end

      unless pktcnt.nil?
        value = (value & 0xe007ffff_u32) |
                UInt32.new!(pktcnt.to_int).&(0x3ff_u32) << 19
      end

      unless xfrsiz.nil?
        value = (value & 0xfff80000_u32) |
                UInt32.new!(xfrsiz.to_int).&(0x7ffff_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      rxdpid_stupcnt : UInt8? = nil,
      pktcnt : UInt16? = nil,
      xfrsiz : UInt32? = nil
    ) : Nil
      self.value = self.value.copy_with(
        rxdpid_stupcnt: rxdpid_stupcnt,
        pktcnt: pktcnt,
        xfrsiz: xfrsiz,
      )
    end
  end # struct

end
