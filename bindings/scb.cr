# System control block
module SCB
  VERSION      = nil
  BASE_ADDRESS = 0xe000ed00_u64

  # CPUID base register
  struct CPUID
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
      new(0x410fc241_u64)
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

    # Revision number
    def revision : UInt8
      UInt8.new!((@value >> 0) & 0xf_u32)
    end

    # Revision number
    def self.revision : UInt8
      value.revision
    end

    # Part number of the              processor
    def part_no : UInt16
      UInt16.new!((@value >> 4) & 0xfff_u32)
    end

    # Part number of the              processor
    def self.part_no : UInt16
      value.part_no
    end

    # Reads as 0xF
    def constant : UInt8
      UInt8.new!((@value >> 16) & 0xf_u32)
    end

    # Reads as 0xF
    def self.constant : UInt8
      value.constant
    end

    # Variant number
    def variant : UInt8
      UInt8.new!((@value >> 20) & 0xf_u32)
    end

    # Variant number
    def self.variant : UInt8
      value.variant
    end

    # Implementer code
    def implementer : UInt8
      UInt8.new!((@value >> 24) & 0xff_u32)
    end

    # Implementer code
    def self.implementer : UInt8
      value.implementer
    end
  end # struct

  # Interrupt control and state          register
  struct ICSR
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

    # Active vector
    def vectactive : UInt16
      UInt16.new!((@value >> 0) & 0x1ff_u32)
    end

    # Active vector
    def self.vectactive : UInt16
      value.vectactive
    end

    # Active vector
    def self.vectactive=(value : UInt16) : UInt16
      self.set(vectactive: value)
      value
    end

    # Return to base level
    def rettobase : Bool
      @value.bits_set?(0x800_u32)
    end

    # Return to base level
    def self.rettobase : Bool
      value.rettobase
    end

    # Return to base level
    def self.rettobase=(value : Bool) : Bool
      self.set(rettobase: value)
      value
    end

    # Pending vector
    def vectpending : UInt8
      UInt8.new!((@value >> 12) & 0x7f_u32)
    end

    # Pending vector
    def self.vectpending : UInt8
      value.vectpending
    end

    # Pending vector
    def self.vectpending=(value : UInt8) : UInt8
      self.set(vectpending: value)
      value
    end

    # Interrupt pending flag
    def isrpending : Bool
      @value.bits_set?(0x400000_u32)
    end

    # Interrupt pending flag
    def self.isrpending : Bool
      value.isrpending
    end

    # Interrupt pending flag
    def self.isrpending=(value : Bool) : Bool
      self.set(isrpending: value)
      value
    end

    # SysTick exception clear-pending              bit
    def pendstclr : Bool
      @value.bits_set?(0x2000000_u32)
    end

    # SysTick exception clear-pending              bit
    def self.pendstclr : Bool
      value.pendstclr
    end

    # SysTick exception clear-pending              bit
    def self.pendstclr=(value : Bool) : Bool
      self.set(pendstclr: value)
      value
    end

    # SysTick exception set-pending              bit
    def pendstset : Bool
      @value.bits_set?(0x4000000_u32)
    end

    # SysTick exception set-pending              bit
    def self.pendstset : Bool
      value.pendstset
    end

    # SysTick exception set-pending              bit
    def self.pendstset=(value : Bool) : Bool
      self.set(pendstset: value)
      value
    end

    # PendSV clear-pending bit
    def pendsvclr : Bool
      @value.bits_set?(0x8000000_u32)
    end

    # PendSV clear-pending bit
    def self.pendsvclr : Bool
      value.pendsvclr
    end

    # PendSV clear-pending bit
    def self.pendsvclr=(value : Bool) : Bool
      self.set(pendsvclr: value)
      value
    end

    # PendSV set-pending bit
    def pendsvset : Bool
      @value.bits_set?(0x10000000_u32)
    end

    # PendSV set-pending bit
    def self.pendsvset : Bool
      value.pendsvset
    end

    # PendSV set-pending bit
    def self.pendsvset=(value : Bool) : Bool
      self.set(pendsvset: value)
      value
    end

    # NMI set-pending bit.
    def nmipendset : Bool
      @value.bits_set?(0x80000000_u32)
    end

    # NMI set-pending bit.
    def self.nmipendset : Bool
      value.nmipendset
    end

    # NMI set-pending bit.
    def self.nmipendset=(value : Bool) : Bool
      self.set(nmipendset: value)
      value
    end

    def copy_with(
      *,

      vectactive : UInt16? = nil,

      rettobase : Bool? = nil,

      vectpending : UInt8? = nil,

      isrpending : Bool? = nil,

      pendstclr : Bool? = nil,

      pendstset : Bool? = nil,

      pendsvclr : Bool? = nil,

      pendsvset : Bool? = nil,

      nmipendset : Bool? = nil
    ) : self
      value = @value

      unless vectactive.nil?
        value = (value & 0xfffffe00_u32) |
                UInt32.new!(vectactive.to_int).&(0x1ff_u32) << 0
      end

      unless rettobase.nil?
        value = (value & 0xfffff7ff_u32) |
                UInt32.new!(rettobase.to_int).&(0x1_u32) << 11
      end

      unless vectpending.nil?
        value = (value & 0xfff80fff_u32) |
                UInt32.new!(vectpending.to_int).&(0x7f_u32) << 12
      end

      unless isrpending.nil?
        value = (value & 0xffbfffff_u32) |
                UInt32.new!(isrpending.to_int).&(0x1_u32) << 22
      end

      unless pendstclr.nil?
        value = (value & 0xfdffffff_u32) |
                UInt32.new!(pendstclr.to_int).&(0x1_u32) << 25
      end

      unless pendstset.nil?
        value = (value & 0xfbffffff_u32) |
                UInt32.new!(pendstset.to_int).&(0x1_u32) << 26
      end

      unless pendsvclr.nil?
        value = (value & 0xf7ffffff_u32) |
                UInt32.new!(pendsvclr.to_int).&(0x1_u32) << 27
      end

      unless pendsvset.nil?
        value = (value & 0xefffffff_u32) |
                UInt32.new!(pendsvset.to_int).&(0x1_u32) << 28
      end

      unless nmipendset.nil?
        value = (value & 0x7fffffff_u32) |
                UInt32.new!(nmipendset.to_int).&(0x1_u32) << 31
      end

      self.class.new(value)
    end

    def self.set(
      *,
      vectactive : UInt16? = nil,
      rettobase : Bool? = nil,
      vectpending : UInt8? = nil,
      isrpending : Bool? = nil,
      pendstclr : Bool? = nil,
      pendstset : Bool? = nil,
      pendsvclr : Bool? = nil,
      pendsvset : Bool? = nil,
      nmipendset : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        vectactive: vectactive,
        rettobase: rettobase,
        vectpending: vectpending,
        isrpending: isrpending,
        pendstclr: pendstclr,
        pendstset: pendstset,
        pendsvclr: pendsvclr,
        pendsvset: pendsvset,
        nmipendset: nmipendset,
      )
    end
  end # struct

  # Vector table offset register
  struct VTOR
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

    # Vector table base offset              field
    def tbloff : UInt32
      UInt32.new!((@value >> 9) & 0x1fffff_u32)
    end

    # Vector table base offset              field
    def self.tbloff : UInt32
      value.tbloff
    end

    # Vector table base offset              field
    def self.tbloff=(value : UInt32) : UInt32
      self.set(tbloff: value)
      value
    end

    def copy_with(
      *,

      tbloff : UInt32? = nil
    ) : self
      value = @value

      unless tbloff.nil?
        value = (value & 0xc00001ff_u32) |
                UInt32.new!(tbloff.to_int).&(0x1fffff_u32) << 9
      end

      self.class.new(value)
    end

    def self.set(
      *,
      tbloff : UInt32? = nil
    ) : Nil
      self.value = self.value.copy_with(
        tbloff: tbloff,
      )
    end
  end # struct

  # Application interrupt and reset control          register
  struct AIRCR
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

    # VECTRESET
    def vectreset : Bool
      @value.bits_set?(0x1_u32)
    end

    # VECTRESET
    def self.vectreset : Bool
      value.vectreset
    end

    # VECTRESET
    def self.vectreset=(value : Bool) : Bool
      self.set(vectreset: value)
      value
    end

    # VECTCLRACTIVE
    def vectclractive : Bool
      @value.bits_set?(0x2_u32)
    end

    # VECTCLRACTIVE
    def self.vectclractive : Bool
      value.vectclractive
    end

    # VECTCLRACTIVE
    def self.vectclractive=(value : Bool) : Bool
      self.set(vectclractive: value)
      value
    end

    # SYSRESETREQ
    def sysresetreq : Bool
      @value.bits_set?(0x4_u32)
    end

    # SYSRESETREQ
    def self.sysresetreq : Bool
      value.sysresetreq
    end

    # SYSRESETREQ
    def self.sysresetreq=(value : Bool) : Bool
      self.set(sysresetreq: value)
      value
    end

    # PRIGROUP
    def prigroup : UInt8
      UInt8.new!((@value >> 8) & 0x7_u32)
    end

    # PRIGROUP
    def self.prigroup : UInt8
      value.prigroup
    end

    # PRIGROUP
    def self.prigroup=(value : UInt8) : UInt8
      self.set(prigroup: value)
      value
    end

    # ENDIANESS
    def endianess : Bool
      @value.bits_set?(0x8000_u32)
    end

    # ENDIANESS
    def self.endianess : Bool
      value.endianess
    end

    # ENDIANESS
    def self.endianess=(value : Bool) : Bool
      self.set(endianess: value)
      value
    end

    # Register key
    def vectkeystat : UInt16
      UInt16.new!((@value >> 16) & 0xffff_u32)
    end

    # Register key
    def self.vectkeystat : UInt16
      value.vectkeystat
    end

    # Register key
    def self.vectkeystat=(value : UInt16) : UInt16
      self.set(vectkeystat: value)
      value
    end

    def copy_with(
      *,

      vectreset : Bool? = nil,

      vectclractive : Bool? = nil,

      sysresetreq : Bool? = nil,

      prigroup : UInt8? = nil,

      endianess : Bool? = nil,

      vectkeystat : UInt16? = nil
    ) : self
      value = @value

      unless vectreset.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(vectreset.to_int).&(0x1_u32) << 0
      end

      unless vectclractive.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(vectclractive.to_int).&(0x1_u32) << 1
      end

      unless sysresetreq.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(sysresetreq.to_int).&(0x1_u32) << 2
      end

      unless prigroup.nil?
        value = (value & 0xfffff8ff_u32) |
                UInt32.new!(prigroup.to_int).&(0x7_u32) << 8
      end

      unless endianess.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(endianess.to_int).&(0x1_u32) << 15
      end

      unless vectkeystat.nil?
        value = (value & 0xffff_u32) |
                UInt32.new!(vectkeystat.to_int).&(0xffff_u32) << 16
      end

      self.class.new(value)
    end

    def self.set(
      *,
      vectreset : Bool? = nil,
      vectclractive : Bool? = nil,
      sysresetreq : Bool? = nil,
      prigroup : UInt8? = nil,
      endianess : Bool? = nil,
      vectkeystat : UInt16? = nil
    ) : Nil
      self.value = self.value.copy_with(
        vectreset: vectreset,
        vectclractive: vectclractive,
        sysresetreq: sysresetreq,
        prigroup: prigroup,
        endianess: endianess,
        vectkeystat: vectkeystat,
      )
    end
  end # struct

  # System control register
  struct SCR
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

    # SLEEPONEXIT
    def sleeponexit : Bool
      @value.bits_set?(0x2_u32)
    end

    # SLEEPONEXIT
    def self.sleeponexit : Bool
      value.sleeponexit
    end

    # SLEEPONEXIT
    def self.sleeponexit=(value : Bool) : Bool
      self.set(sleeponexit: value)
      value
    end

    # SLEEPDEEP
    def sleepdeep : Bool
      @value.bits_set?(0x4_u32)
    end

    # SLEEPDEEP
    def self.sleepdeep : Bool
      value.sleepdeep
    end

    # SLEEPDEEP
    def self.sleepdeep=(value : Bool) : Bool
      self.set(sleepdeep: value)
      value
    end

    # Send Event on Pending bit
    def seveonpend : Bool
      @value.bits_set?(0x10_u32)
    end

    # Send Event on Pending bit
    def self.seveonpend : Bool
      value.seveonpend
    end

    # Send Event on Pending bit
    def self.seveonpend=(value : Bool) : Bool
      self.set(seveonpend: value)
      value
    end

    def copy_with(
      *,

      sleeponexit : Bool? = nil,

      sleepdeep : Bool? = nil,

      seveonpend : Bool? = nil
    ) : self
      value = @value

      unless sleeponexit.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(sleeponexit.to_int).&(0x1_u32) << 1
      end

      unless sleepdeep.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(sleepdeep.to_int).&(0x1_u32) << 2
      end

      unless seveonpend.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(seveonpend.to_int).&(0x1_u32) << 4
      end

      self.class.new(value)
    end

    def self.set(
      *,
      sleeponexit : Bool? = nil,
      sleepdeep : Bool? = nil,
      seveonpend : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        sleeponexit: sleeponexit,
        sleepdeep: sleepdeep,
        seveonpend: seveonpend,
      )
    end
  end # struct

  # Configuration and control          register
  struct CCR
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

    # Configures how the processor enters              Thread mode
    def nonbasethrdena : Bool
      @value.bits_set?(0x1_u32)
    end

    # Configures how the processor enters              Thread mode
    def self.nonbasethrdena : Bool
      value.nonbasethrdena
    end

    # Configures how the processor enters              Thread mode
    def self.nonbasethrdena=(value : Bool) : Bool
      self.set(nonbasethrdena: value)
      value
    end

    # USERSETMPEND
    def usersetmpend : Bool
      @value.bits_set?(0x2_u32)
    end

    # USERSETMPEND
    def self.usersetmpend : Bool
      value.usersetmpend
    end

    # USERSETMPEND
    def self.usersetmpend=(value : Bool) : Bool
      self.set(usersetmpend: value)
      value
    end

    # UNALIGN_ TRP
    def unalign__trp : Bool
      @value.bits_set?(0x8_u32)
    end

    # UNALIGN_ TRP
    def self.unalign__trp : Bool
      value.unalign__trp
    end

    # UNALIGN_ TRP
    def self.unalign__trp=(value : Bool) : Bool
      self.set(unalign__trp: value)
      value
    end

    # DIV_0_TRP
    def div_0_trp : Bool
      @value.bits_set?(0x10_u32)
    end

    # DIV_0_TRP
    def self.div_0_trp : Bool
      value.div_0_trp
    end

    # DIV_0_TRP
    def self.div_0_trp=(value : Bool) : Bool
      self.set(div_0_trp: value)
      value
    end

    # BFHFNMIGN
    def bfhfnmign : Bool
      @value.bits_set?(0x100_u32)
    end

    # BFHFNMIGN
    def self.bfhfnmign : Bool
      value.bfhfnmign
    end

    # BFHFNMIGN
    def self.bfhfnmign=(value : Bool) : Bool
      self.set(bfhfnmign: value)
      value
    end

    # STKALIGN
    def stkalign : Bool
      @value.bits_set?(0x200_u32)
    end

    # STKALIGN
    def self.stkalign : Bool
      value.stkalign
    end

    # STKALIGN
    def self.stkalign=(value : Bool) : Bool
      self.set(stkalign: value)
      value
    end

    def copy_with(
      *,

      nonbasethrdena : Bool? = nil,

      usersetmpend : Bool? = nil,

      unalign__trp : Bool? = nil,

      div_0_trp : Bool? = nil,

      bfhfnmign : Bool? = nil,

      stkalign : Bool? = nil
    ) : self
      value = @value

      unless nonbasethrdena.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(nonbasethrdena.to_int).&(0x1_u32) << 0
      end

      unless usersetmpend.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(usersetmpend.to_int).&(0x1_u32) << 1
      end

      unless unalign__trp.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(unalign__trp.to_int).&(0x1_u32) << 3
      end

      unless div_0_trp.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(div_0_trp.to_int).&(0x1_u32) << 4
      end

      unless bfhfnmign.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(bfhfnmign.to_int).&(0x1_u32) << 8
      end

      unless stkalign.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(stkalign.to_int).&(0x1_u32) << 9
      end

      self.class.new(value)
    end

    def self.set(
      *,
      nonbasethrdena : Bool? = nil,
      usersetmpend : Bool? = nil,
      unalign__trp : Bool? = nil,
      div_0_trp : Bool? = nil,
      bfhfnmign : Bool? = nil,
      stkalign : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        nonbasethrdena: nonbasethrdena,
        usersetmpend: usersetmpend,
        unalign__trp: unalign__trp,
        div_0_trp: div_0_trp,
        bfhfnmign: bfhfnmign,
        stkalign: stkalign,
      )
    end
  end # struct

  # System handler priority          registers
  struct SHPR1
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

    # Priority of system handler              4
    def pri_4 : UInt8
      UInt8.new!((@value >> 0) & 0xff_u32)
    end

    # Priority of system handler              4
    def self.pri_4 : UInt8
      value.pri_4
    end

    # Priority of system handler              4
    def self.pri_4=(value : UInt8) : UInt8
      self.set(pri_4: value)
      value
    end

    # Priority of system handler              5
    def pri_5 : UInt8
      UInt8.new!((@value >> 8) & 0xff_u32)
    end

    # Priority of system handler              5
    def self.pri_5 : UInt8
      value.pri_5
    end

    # Priority of system handler              5
    def self.pri_5=(value : UInt8) : UInt8
      self.set(pri_5: value)
      value
    end

    # Priority of system handler              6
    def pri_6 : UInt8
      UInt8.new!((@value >> 16) & 0xff_u32)
    end

    # Priority of system handler              6
    def self.pri_6 : UInt8
      value.pri_6
    end

    # Priority of system handler              6
    def self.pri_6=(value : UInt8) : UInt8
      self.set(pri_6: value)
      value
    end

    def copy_with(
      *,

      pri_4 : UInt8? = nil,

      pri_5 : UInt8? = nil,

      pri_6 : UInt8? = nil
    ) : self
      value = @value

      unless pri_4.nil?
        value = (value & 0xffffff00_u32) |
                UInt32.new!(pri_4.to_int).&(0xff_u32) << 0
      end

      unless pri_5.nil?
        value = (value & 0xffff00ff_u32) |
                UInt32.new!(pri_5.to_int).&(0xff_u32) << 8
      end

      unless pri_6.nil?
        value = (value & 0xff00ffff_u32) |
                UInt32.new!(pri_6.to_int).&(0xff_u32) << 16
      end

      self.class.new(value)
    end

    def self.set(
      *,
      pri_4 : UInt8? = nil,
      pri_5 : UInt8? = nil,
      pri_6 : UInt8? = nil
    ) : Nil
      self.value = self.value.copy_with(
        pri_4: pri_4,
        pri_5: pri_5,
        pri_6: pri_6,
      )
    end
  end # struct

  # System handler priority          registers
  struct SHPR2
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

    # Priority of system handler              11
    def pri_11 : UInt8
      UInt8.new!((@value >> 24) & 0xff_u32)
    end

    # Priority of system handler              11
    def self.pri_11 : UInt8
      value.pri_11
    end

    # Priority of system handler              11
    def self.pri_11=(value : UInt8) : UInt8
      self.set(pri_11: value)
      value
    end

    def copy_with(
      *,

      pri_11 : UInt8? = nil
    ) : self
      value = @value

      unless pri_11.nil?
        value = (value & 0xffffff_u32) |
                UInt32.new!(pri_11.to_int).&(0xff_u32) << 24
      end

      self.class.new(value)
    end

    def self.set(
      *,
      pri_11 : UInt8? = nil
    ) : Nil
      self.value = self.value.copy_with(
        pri_11: pri_11,
      )
    end
  end # struct

  # System handler priority          registers
  struct SHPR3
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

    # Priority of system handler              14
    def pri_14 : UInt8
      UInt8.new!((@value >> 16) & 0xff_u32)
    end

    # Priority of system handler              14
    def self.pri_14 : UInt8
      value.pri_14
    end

    # Priority of system handler              14
    def self.pri_14=(value : UInt8) : UInt8
      self.set(pri_14: value)
      value
    end

    # Priority of system handler              15
    def pri_15 : UInt8
      UInt8.new!((@value >> 24) & 0xff_u32)
    end

    # Priority of system handler              15
    def self.pri_15 : UInt8
      value.pri_15
    end

    # Priority of system handler              15
    def self.pri_15=(value : UInt8) : UInt8
      self.set(pri_15: value)
      value
    end

    def copy_with(
      *,

      pri_14 : UInt8? = nil,

      pri_15 : UInt8? = nil
    ) : self
      value = @value

      unless pri_14.nil?
        value = (value & 0xff00ffff_u32) |
                UInt32.new!(pri_14.to_int).&(0xff_u32) << 16
      end

      unless pri_15.nil?
        value = (value & 0xffffff_u32) |
                UInt32.new!(pri_15.to_int).&(0xff_u32) << 24
      end

      self.class.new(value)
    end

    def self.set(
      *,
      pri_14 : UInt8? = nil,
      pri_15 : UInt8? = nil
    ) : Nil
      self.value = self.value.copy_with(
        pri_14: pri_14,
        pri_15: pri_15,
      )
    end
  end # struct

  # System handler control and state          register
  struct SHCRS
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

    # Memory management fault exception active              bit
    def memfaultact : Bool
      @value.bits_set?(0x1_u32)
    end

    # Memory management fault exception active              bit
    def self.memfaultact : Bool
      value.memfaultact
    end

    # Memory management fault exception active              bit
    def self.memfaultact=(value : Bool) : Bool
      self.set(memfaultact: value)
      value
    end

    # Bus fault exception active              bit
    def busfaultact : Bool
      @value.bits_set?(0x2_u32)
    end

    # Bus fault exception active              bit
    def self.busfaultact : Bool
      value.busfaultact
    end

    # Bus fault exception active              bit
    def self.busfaultact=(value : Bool) : Bool
      self.set(busfaultact: value)
      value
    end

    # Usage fault exception active              bit
    def usgfaultact : Bool
      @value.bits_set?(0x8_u32)
    end

    # Usage fault exception active              bit
    def self.usgfaultact : Bool
      value.usgfaultact
    end

    # Usage fault exception active              bit
    def self.usgfaultact=(value : Bool) : Bool
      self.set(usgfaultact: value)
      value
    end

    # SVC call active bit
    def svcallact : Bool
      @value.bits_set?(0x80_u32)
    end

    # SVC call active bit
    def self.svcallact : Bool
      value.svcallact
    end

    # SVC call active bit
    def self.svcallact=(value : Bool) : Bool
      self.set(svcallact: value)
      value
    end

    # Debug monitor active bit
    def monitoract : Bool
      @value.bits_set?(0x100_u32)
    end

    # Debug monitor active bit
    def self.monitoract : Bool
      value.monitoract
    end

    # Debug monitor active bit
    def self.monitoract=(value : Bool) : Bool
      self.set(monitoract: value)
      value
    end

    # PendSV exception active              bit
    def pendsvact : Bool
      @value.bits_set?(0x400_u32)
    end

    # PendSV exception active              bit
    def self.pendsvact : Bool
      value.pendsvact
    end

    # PendSV exception active              bit
    def self.pendsvact=(value : Bool) : Bool
      self.set(pendsvact: value)
      value
    end

    # SysTick exception active              bit
    def systickact : Bool
      @value.bits_set?(0x800_u32)
    end

    # SysTick exception active              bit
    def self.systickact : Bool
      value.systickact
    end

    # SysTick exception active              bit
    def self.systickact=(value : Bool) : Bool
      self.set(systickact: value)
      value
    end

    # Usage fault exception pending              bit
    def usgfaultpended : Bool
      @value.bits_set?(0x1000_u32)
    end

    # Usage fault exception pending              bit
    def self.usgfaultpended : Bool
      value.usgfaultpended
    end

    # Usage fault exception pending              bit
    def self.usgfaultpended=(value : Bool) : Bool
      self.set(usgfaultpended: value)
      value
    end

    # Memory management fault exception              pending bit
    def memfaultpended : Bool
      @value.bits_set?(0x2000_u32)
    end

    # Memory management fault exception              pending bit
    def self.memfaultpended : Bool
      value.memfaultpended
    end

    # Memory management fault exception              pending bit
    def self.memfaultpended=(value : Bool) : Bool
      self.set(memfaultpended: value)
      value
    end

    # Bus fault exception pending              bit
    def busfaultpended : Bool
      @value.bits_set?(0x4000_u32)
    end

    # Bus fault exception pending              bit
    def self.busfaultpended : Bool
      value.busfaultpended
    end

    # Bus fault exception pending              bit
    def self.busfaultpended=(value : Bool) : Bool
      self.set(busfaultpended: value)
      value
    end

    # SVC call pending bit
    def svcallpended : Bool
      @value.bits_set?(0x8000_u32)
    end

    # SVC call pending bit
    def self.svcallpended : Bool
      value.svcallpended
    end

    # SVC call pending bit
    def self.svcallpended=(value : Bool) : Bool
      self.set(svcallpended: value)
      value
    end

    # Memory management fault enable              bit
    def memfaultena : Bool
      @value.bits_set?(0x10000_u32)
    end

    # Memory management fault enable              bit
    def self.memfaultena : Bool
      value.memfaultena
    end

    # Memory management fault enable              bit
    def self.memfaultena=(value : Bool) : Bool
      self.set(memfaultena: value)
      value
    end

    # Bus fault enable bit
    def busfaultena : Bool
      @value.bits_set?(0x20000_u32)
    end

    # Bus fault enable bit
    def self.busfaultena : Bool
      value.busfaultena
    end

    # Bus fault enable bit
    def self.busfaultena=(value : Bool) : Bool
      self.set(busfaultena: value)
      value
    end

    # Usage fault enable bit
    def usgfaultena : Bool
      @value.bits_set?(0x40000_u32)
    end

    # Usage fault enable bit
    def self.usgfaultena : Bool
      value.usgfaultena
    end

    # Usage fault enable bit
    def self.usgfaultena=(value : Bool) : Bool
      self.set(usgfaultena: value)
      value
    end

    def copy_with(
      *,

      memfaultact : Bool? = nil,

      busfaultact : Bool? = nil,

      usgfaultact : Bool? = nil,

      svcallact : Bool? = nil,

      monitoract : Bool? = nil,

      pendsvact : Bool? = nil,

      systickact : Bool? = nil,

      usgfaultpended : Bool? = nil,

      memfaultpended : Bool? = nil,

      busfaultpended : Bool? = nil,

      svcallpended : Bool? = nil,

      memfaultena : Bool? = nil,

      busfaultena : Bool? = nil,

      usgfaultena : Bool? = nil
    ) : self
      value = @value

      unless memfaultact.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(memfaultact.to_int).&(0x1_u32) << 0
      end

      unless busfaultact.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(busfaultact.to_int).&(0x1_u32) << 1
      end

      unless usgfaultact.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(usgfaultact.to_int).&(0x1_u32) << 3
      end

      unless svcallact.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(svcallact.to_int).&(0x1_u32) << 7
      end

      unless monitoract.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(monitoract.to_int).&(0x1_u32) << 8
      end

      unless pendsvact.nil?
        value = (value & 0xfffffbff_u32) |
                UInt32.new!(pendsvact.to_int).&(0x1_u32) << 10
      end

      unless systickact.nil?
        value = (value & 0xfffff7ff_u32) |
                UInt32.new!(systickact.to_int).&(0x1_u32) << 11
      end

      unless usgfaultpended.nil?
        value = (value & 0xffffefff_u32) |
                UInt32.new!(usgfaultpended.to_int).&(0x1_u32) << 12
      end

      unless memfaultpended.nil?
        value = (value & 0xffffdfff_u32) |
                UInt32.new!(memfaultpended.to_int).&(0x1_u32) << 13
      end

      unless busfaultpended.nil?
        value = (value & 0xffffbfff_u32) |
                UInt32.new!(busfaultpended.to_int).&(0x1_u32) << 14
      end

      unless svcallpended.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(svcallpended.to_int).&(0x1_u32) << 15
      end

      unless memfaultena.nil?
        value = (value & 0xfffeffff_u32) |
                UInt32.new!(memfaultena.to_int).&(0x1_u32) << 16
      end

      unless busfaultena.nil?
        value = (value & 0xfffdffff_u32) |
                UInt32.new!(busfaultena.to_int).&(0x1_u32) << 17
      end

      unless usgfaultena.nil?
        value = (value & 0xfffbffff_u32) |
                UInt32.new!(usgfaultena.to_int).&(0x1_u32) << 18
      end

      self.class.new(value)
    end

    def self.set(
      *,
      memfaultact : Bool? = nil,
      busfaultact : Bool? = nil,
      usgfaultact : Bool? = nil,
      svcallact : Bool? = nil,
      monitoract : Bool? = nil,
      pendsvact : Bool? = nil,
      systickact : Bool? = nil,
      usgfaultpended : Bool? = nil,
      memfaultpended : Bool? = nil,
      busfaultpended : Bool? = nil,
      svcallpended : Bool? = nil,
      memfaultena : Bool? = nil,
      busfaultena : Bool? = nil,
      usgfaultena : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        memfaultact: memfaultact,
        busfaultact: busfaultact,
        usgfaultact: usgfaultact,
        svcallact: svcallact,
        monitoract: monitoract,
        pendsvact: pendsvact,
        systickact: systickact,
        usgfaultpended: usgfaultpended,
        memfaultpended: memfaultpended,
        busfaultpended: busfaultpended,
        svcallpended: svcallpended,
        memfaultena: memfaultena,
        busfaultena: busfaultena,
        usgfaultena: usgfaultena,
      )
    end
  end # struct

  # Configurable fault status          register
  struct CFSR_UFSR_BFSR_MMFSR
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

    # Instruction access violation              flag
    def iaccviol : Bool
      @value.bits_set?(0x2_u32)
    end

    # Instruction access violation              flag
    def self.iaccviol : Bool
      value.iaccviol
    end

    # Instruction access violation              flag
    def self.iaccviol=(value : Bool) : Bool
      self.set(iaccviol: value)
      value
    end

    # Memory manager fault on unstacking for a              return from exception
    def munstkerr : Bool
      @value.bits_set?(0x8_u32)
    end

    # Memory manager fault on unstacking for a              return from exception
    def self.munstkerr : Bool
      value.munstkerr
    end

    # Memory manager fault on unstacking for a              return from exception
    def self.munstkerr=(value : Bool) : Bool
      self.set(munstkerr: value)
      value
    end

    # Memory manager fault on stacking for              exception entry.
    def mstkerr : Bool
      @value.bits_set?(0x10_u32)
    end

    # Memory manager fault on stacking for              exception entry.
    def self.mstkerr : Bool
      value.mstkerr
    end

    # Memory manager fault on stacking for              exception entry.
    def self.mstkerr=(value : Bool) : Bool
      self.set(mstkerr: value)
      value
    end

    # MLSPERR
    def mlsperr : Bool
      @value.bits_set?(0x20_u32)
    end

    # MLSPERR
    def self.mlsperr : Bool
      value.mlsperr
    end

    # MLSPERR
    def self.mlsperr=(value : Bool) : Bool
      self.set(mlsperr: value)
      value
    end

    # Memory Management Fault Address Register              (MMAR) valid flag
    def mmarvalid : Bool
      @value.bits_set?(0x80_u32)
    end

    # Memory Management Fault Address Register              (MMAR) valid flag
    def self.mmarvalid : Bool
      value.mmarvalid
    end

    # Memory Management Fault Address Register              (MMAR) valid flag
    def self.mmarvalid=(value : Bool) : Bool
      self.set(mmarvalid: value)
      value
    end

    # Instruction bus error
    def ibuserr : Bool
      @value.bits_set?(0x100_u32)
    end

    # Instruction bus error
    def self.ibuserr : Bool
      value.ibuserr
    end

    # Instruction bus error
    def self.ibuserr=(value : Bool) : Bool
      self.set(ibuserr: value)
      value
    end

    # Precise data bus error
    def preciserr : Bool
      @value.bits_set?(0x200_u32)
    end

    # Precise data bus error
    def self.preciserr : Bool
      value.preciserr
    end

    # Precise data bus error
    def self.preciserr=(value : Bool) : Bool
      self.set(preciserr: value)
      value
    end

    # Imprecise data bus error
    def impreciserr : Bool
      @value.bits_set?(0x400_u32)
    end

    # Imprecise data bus error
    def self.impreciserr : Bool
      value.impreciserr
    end

    # Imprecise data bus error
    def self.impreciserr=(value : Bool) : Bool
      self.set(impreciserr: value)
      value
    end

    # Bus fault on unstacking for a return              from exception
    def unstkerr : Bool
      @value.bits_set?(0x800_u32)
    end

    # Bus fault on unstacking for a return              from exception
    def self.unstkerr : Bool
      value.unstkerr
    end

    # Bus fault on unstacking for a return              from exception
    def self.unstkerr=(value : Bool) : Bool
      self.set(unstkerr: value)
      value
    end

    # Bus fault on stacking for exception              entry
    def stkerr : Bool
      @value.bits_set?(0x1000_u32)
    end

    # Bus fault on stacking for exception              entry
    def self.stkerr : Bool
      value.stkerr
    end

    # Bus fault on stacking for exception              entry
    def self.stkerr=(value : Bool) : Bool
      self.set(stkerr: value)
      value
    end

    # Bus fault on floating-point lazy state              preservation
    def lsperr : Bool
      @value.bits_set?(0x2000_u32)
    end

    # Bus fault on floating-point lazy state              preservation
    def self.lsperr : Bool
      value.lsperr
    end

    # Bus fault on floating-point lazy state              preservation
    def self.lsperr=(value : Bool) : Bool
      self.set(lsperr: value)
      value
    end

    # Bus Fault Address Register (BFAR) valid              flag
    def bfarvalid : Bool
      @value.bits_set?(0x8000_u32)
    end

    # Bus Fault Address Register (BFAR) valid              flag
    def self.bfarvalid : Bool
      value.bfarvalid
    end

    # Bus Fault Address Register (BFAR) valid              flag
    def self.bfarvalid=(value : Bool) : Bool
      self.set(bfarvalid: value)
      value
    end

    # Undefined instruction usage              fault
    def undefinstr : Bool
      @value.bits_set?(0x10000_u32)
    end

    # Undefined instruction usage              fault
    def self.undefinstr : Bool
      value.undefinstr
    end

    # Undefined instruction usage              fault
    def self.undefinstr=(value : Bool) : Bool
      self.set(undefinstr: value)
      value
    end

    # Invalid state usage fault
    def invstate : Bool
      @value.bits_set?(0x20000_u32)
    end

    # Invalid state usage fault
    def self.invstate : Bool
      value.invstate
    end

    # Invalid state usage fault
    def self.invstate=(value : Bool) : Bool
      self.set(invstate: value)
      value
    end

    # Invalid PC load usage              fault
    def invpc : Bool
      @value.bits_set?(0x40000_u32)
    end

    # Invalid PC load usage              fault
    def self.invpc : Bool
      value.invpc
    end

    # Invalid PC load usage              fault
    def self.invpc=(value : Bool) : Bool
      self.set(invpc: value)
      value
    end

    # No coprocessor usage              fault.
    def nocp : Bool
      @value.bits_set?(0x80000_u32)
    end

    # No coprocessor usage              fault.
    def self.nocp : Bool
      value.nocp
    end

    # No coprocessor usage              fault.
    def self.nocp=(value : Bool) : Bool
      self.set(nocp: value)
      value
    end

    # Unaligned access usage              fault
    def unaligned : Bool
      @value.bits_set?(0x1000000_u32)
    end

    # Unaligned access usage              fault
    def self.unaligned : Bool
      value.unaligned
    end

    # Unaligned access usage              fault
    def self.unaligned=(value : Bool) : Bool
      self.set(unaligned: value)
      value
    end

    # Divide by zero usage fault
    def divbyzero : Bool
      @value.bits_set?(0x2000000_u32)
    end

    # Divide by zero usage fault
    def self.divbyzero : Bool
      value.divbyzero
    end

    # Divide by zero usage fault
    def self.divbyzero=(value : Bool) : Bool
      self.set(divbyzero: value)
      value
    end

    def copy_with(
      *,

      iaccviol : Bool? = nil,

      munstkerr : Bool? = nil,

      mstkerr : Bool? = nil,

      mlsperr : Bool? = nil,

      mmarvalid : Bool? = nil,

      ibuserr : Bool? = nil,

      preciserr : Bool? = nil,

      impreciserr : Bool? = nil,

      unstkerr : Bool? = nil,

      stkerr : Bool? = nil,

      lsperr : Bool? = nil,

      bfarvalid : Bool? = nil,

      undefinstr : Bool? = nil,

      invstate : Bool? = nil,

      invpc : Bool? = nil,

      nocp : Bool? = nil,

      unaligned : Bool? = nil,

      divbyzero : Bool? = nil
    ) : self
      value = @value

      unless iaccviol.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(iaccviol.to_int).&(0x1_u32) << 1
      end

      unless munstkerr.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(munstkerr.to_int).&(0x1_u32) << 3
      end

      unless mstkerr.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(mstkerr.to_int).&(0x1_u32) << 4
      end

      unless mlsperr.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(mlsperr.to_int).&(0x1_u32) << 5
      end

      unless mmarvalid.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(mmarvalid.to_int).&(0x1_u32) << 7
      end

      unless ibuserr.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(ibuserr.to_int).&(0x1_u32) << 8
      end

      unless preciserr.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(preciserr.to_int).&(0x1_u32) << 9
      end

      unless impreciserr.nil?
        value = (value & 0xfffffbff_u32) |
                UInt32.new!(impreciserr.to_int).&(0x1_u32) << 10
      end

      unless unstkerr.nil?
        value = (value & 0xfffff7ff_u32) |
                UInt32.new!(unstkerr.to_int).&(0x1_u32) << 11
      end

      unless stkerr.nil?
        value = (value & 0xffffefff_u32) |
                UInt32.new!(stkerr.to_int).&(0x1_u32) << 12
      end

      unless lsperr.nil?
        value = (value & 0xffffdfff_u32) |
                UInt32.new!(lsperr.to_int).&(0x1_u32) << 13
      end

      unless bfarvalid.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(bfarvalid.to_int).&(0x1_u32) << 15
      end

      unless undefinstr.nil?
        value = (value & 0xfffeffff_u32) |
                UInt32.new!(undefinstr.to_int).&(0x1_u32) << 16
      end

      unless invstate.nil?
        value = (value & 0xfffdffff_u32) |
                UInt32.new!(invstate.to_int).&(0x1_u32) << 17
      end

      unless invpc.nil?
        value = (value & 0xfffbffff_u32) |
                UInt32.new!(invpc.to_int).&(0x1_u32) << 18
      end

      unless nocp.nil?
        value = (value & 0xfff7ffff_u32) |
                UInt32.new!(nocp.to_int).&(0x1_u32) << 19
      end

      unless unaligned.nil?
        value = (value & 0xfeffffff_u32) |
                UInt32.new!(unaligned.to_int).&(0x1_u32) << 24
      end

      unless divbyzero.nil?
        value = (value & 0xfdffffff_u32) |
                UInt32.new!(divbyzero.to_int).&(0x1_u32) << 25
      end

      self.class.new(value)
    end

    def self.set(
      *,
      iaccviol : Bool? = nil,
      munstkerr : Bool? = nil,
      mstkerr : Bool? = nil,
      mlsperr : Bool? = nil,
      mmarvalid : Bool? = nil,
      ibuserr : Bool? = nil,
      preciserr : Bool? = nil,
      impreciserr : Bool? = nil,
      unstkerr : Bool? = nil,
      stkerr : Bool? = nil,
      lsperr : Bool? = nil,
      bfarvalid : Bool? = nil,
      undefinstr : Bool? = nil,
      invstate : Bool? = nil,
      invpc : Bool? = nil,
      nocp : Bool? = nil,
      unaligned : Bool? = nil,
      divbyzero : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        iaccviol: iaccviol,
        munstkerr: munstkerr,
        mstkerr: mstkerr,
        mlsperr: mlsperr,
        mmarvalid: mmarvalid,
        ibuserr: ibuserr,
        preciserr: preciserr,
        impreciserr: impreciserr,
        unstkerr: unstkerr,
        stkerr: stkerr,
        lsperr: lsperr,
        bfarvalid: bfarvalid,
        undefinstr: undefinstr,
        invstate: invstate,
        invpc: invpc,
        nocp: nocp,
        unaligned: unaligned,
        divbyzero: divbyzero,
      )
    end
  end # struct

  # Hard fault status register
  struct HFSR
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

    # Vector table hard fault
    def vecttbl : Bool
      @value.bits_set?(0x2_u32)
    end

    # Vector table hard fault
    def self.vecttbl : Bool
      value.vecttbl
    end

    # Vector table hard fault
    def self.vecttbl=(value : Bool) : Bool
      self.set(vecttbl: value)
      value
    end

    # Forced hard fault
    def forced : Bool
      @value.bits_set?(0x40000000_u32)
    end

    # Forced hard fault
    def self.forced : Bool
      value.forced
    end

    # Forced hard fault
    def self.forced=(value : Bool) : Bool
      self.set(forced: value)
      value
    end

    # Reserved for Debug use
    def debug_vt : Bool
      @value.bits_set?(0x80000000_u32)
    end

    # Reserved for Debug use
    def self.debug_vt : Bool
      value.debug_vt
    end

    # Reserved for Debug use
    def self.debug_vt=(value : Bool) : Bool
      self.set(debug_vt: value)
      value
    end

    def copy_with(
      *,

      vecttbl : Bool? = nil,

      forced : Bool? = nil,

      debug_vt : Bool? = nil
    ) : self
      value = @value

      unless vecttbl.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(vecttbl.to_int).&(0x1_u32) << 1
      end

      unless forced.nil?
        value = (value & 0xbfffffff_u32) |
                UInt32.new!(forced.to_int).&(0x1_u32) << 30
      end

      unless debug_vt.nil?
        value = (value & 0x7fffffff_u32) |
                UInt32.new!(debug_vt.to_int).&(0x1_u32) << 31
      end

      self.class.new(value)
    end

    def self.set(
      *,
      vecttbl : Bool? = nil,
      forced : Bool? = nil,
      debug_vt : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        vecttbl: vecttbl,
        forced: forced,
        debug_vt: debug_vt,
      )
    end
  end # struct

  # Memory management fault address          register
  struct MMFAR
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

    # Memory management fault              address
    def mmfar : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # Memory management fault              address
    def self.mmfar : UInt32
      value.mmfar
    end

    # Memory management fault              address
    def self.mmfar=(value : UInt32) : UInt32
      self.set(mmfar: value)
      value
    end

    def copy_with(
      *,

      mmfar : UInt32? = nil
    ) : self
      value = @value

      unless mmfar.nil?
        value = (value & 0xffffffff_u32) |
                UInt32.new!(mmfar.to_int).&(0x0_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      mmfar : UInt32? = nil
    ) : Nil
      self.value = self.value.copy_with(
        mmfar: mmfar,
      )
    end
  end # struct

  # Bus fault address register
  struct BFAR
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

    # Bus fault address
    def bfar : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # Bus fault address
    def self.bfar : UInt32
      value.bfar
    end

    # Bus fault address
    def self.bfar=(value : UInt32) : UInt32
      self.set(bfar: value)
      value
    end

    def copy_with(
      *,

      bfar : UInt32? = nil
    ) : self
      value = @value

      unless bfar.nil?
        value = (value & 0xffffffff_u32) |
                UInt32.new!(bfar.to_int).&(0x0_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      bfar : UInt32? = nil
    ) : Nil
      self.value = self.value.copy_with(
        bfar: bfar,
      )
    end
  end # struct

  # Auxiliary fault status          register
  struct AFSR
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

    # Implementation defined
    def impdef : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # Implementation defined
    def self.impdef : UInt32
      value.impdef
    end

    # Implementation defined
    def self.impdef=(value : UInt32) : UInt32
      self.set(impdef: value)
      value
    end

    def copy_with(
      *,

      impdef : UInt32? = nil
    ) : self
      value = @value

      unless impdef.nil?
        value = (value & 0xffffffff_u32) |
                UInt32.new!(impdef.to_int).&(0x0_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      impdef : UInt32? = nil
    ) : Nil
      self.value = self.value.copy_with(
        impdef: impdef,
      )
    end
  end # struct

end
