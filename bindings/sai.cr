# Serial audio interface
module SAI
  VERSION      = nil
  BASE_ADDRESS = 0x40015800_u64

  # BConfiguration register 1
  struct BCR1
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
      new(0x40_u64)
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

    # Master clock divider
    def mcjdiv : UInt8
      UInt8.new!((@value >> 20) & 0xf_u32)
    end

    # Master clock divider
    def self.mcjdiv : UInt8
      value.mcjdiv
    end

    # Master clock divider
    def self.mcjdiv=(value : UInt8) : UInt8
      self.set(mcjdiv: value)
      value
    end

    # No divider
    def nodiv : Bool
      @value.bits_set?(0x80000_u32)
    end

    # No divider
    def self.nodiv : Bool
      value.nodiv
    end

    # No divider
    def self.nodiv=(value : Bool) : Bool
      self.set(nodiv: value)
      value
    end

    # DMA enable
    def dmaen : Bool
      @value.bits_set?(0x20000_u32)
    end

    # DMA enable
    def self.dmaen : Bool
      value.dmaen
    end

    # DMA enable
    def self.dmaen=(value : Bool) : Bool
      self.set(dmaen: value)
      value
    end

    # Audio block B enable
    def ben : Bool
      @value.bits_set?(0x10000_u32)
    end

    # Audio block B enable
    def self.ben : Bool
      value.ben
    end

    # Audio block B enable
    def self.ben=(value : Bool) : Bool
      self.set(ben: value)
      value
    end

    # Output drive
    def out_dri : Bool
      @value.bits_set?(0x2000_u32)
    end

    # Output drive
    def self.out_dri : Bool
      value.out_dri
    end

    # Output drive
    def self.out_dri=(value : Bool) : Bool
      self.set(out_dri: value)
      value
    end

    # Mono mode
    def mono : Bool
      @value.bits_set?(0x1000_u32)
    end

    # Mono mode
    def self.mono : Bool
      value.mono
    end

    # Mono mode
    def self.mono=(value : Bool) : Bool
      self.set(mono: value)
      value
    end

    # Synchronization enable
    def syncen : UInt8
      UInt8.new!((@value >> 10) & 0x3_u32)
    end

    # Synchronization enable
    def self.syncen : UInt8
      value.syncen
    end

    # Synchronization enable
    def self.syncen=(value : UInt8) : UInt8
      self.set(syncen: value)
      value
    end

    # Clock strobing edge
    def ckstr : Bool
      @value.bits_set?(0x200_u32)
    end

    # Clock strobing edge
    def self.ckstr : Bool
      value.ckstr
    end

    # Clock strobing edge
    def self.ckstr=(value : Bool) : Bool
      self.set(ckstr: value)
      value
    end

    # Least significant bit              first
    def lsbfirst : Bool
      @value.bits_set?(0x100_u32)
    end

    # Least significant bit              first
    def self.lsbfirst : Bool
      value.lsbfirst
    end

    # Least significant bit              first
    def self.lsbfirst=(value : Bool) : Bool
      self.set(lsbfirst: value)
      value
    end

    # Data size
    def ds : UInt8
      UInt8.new!((@value >> 5) & 0x7_u32)
    end

    # Data size
    def self.ds : UInt8
      value.ds
    end

    # Data size
    def self.ds=(value : UInt8) : UInt8
      self.set(ds: value)
      value
    end

    # Protocol configuration
    def prtcfg : UInt8
      UInt8.new!((@value >> 2) & 0x3_u32)
    end

    # Protocol configuration
    def self.prtcfg : UInt8
      value.prtcfg
    end

    # Protocol configuration
    def self.prtcfg=(value : UInt8) : UInt8
      self.set(prtcfg: value)
      value
    end

    # Audio block mode
    def mode : UInt8
      UInt8.new!((@value >> 0) & 0x3_u32)
    end

    # Audio block mode
    def self.mode : UInt8
      value.mode
    end

    # Audio block mode
    def self.mode=(value : UInt8) : UInt8
      self.set(mode: value)
      value
    end

    def copy_with(
      *,

      mcjdiv : UInt8? = nil,

      nodiv : Bool? = nil,

      dmaen : Bool? = nil,

      ben : Bool? = nil,

      out_dri : Bool? = nil,

      mono : Bool? = nil,

      syncen : UInt8? = nil,

      ckstr : Bool? = nil,

      lsbfirst : Bool? = nil,

      ds : UInt8? = nil,

      prtcfg : UInt8? = nil,

      mode : UInt8? = nil
    ) : self
      value = @value

      unless mcjdiv.nil?
        value = (value & 0xff0fffff_u32) |
                UInt32.new!(mcjdiv.to_int).&(0xf_u32) << 20
      end

      unless nodiv.nil?
        value = (value & 0xfff7ffff_u32) |
                UInt32.new!(nodiv.to_int).&(0x1_u32) << 19
      end

      unless dmaen.nil?
        value = (value & 0xfffdffff_u32) |
                UInt32.new!(dmaen.to_int).&(0x1_u32) << 17
      end

      unless ben.nil?
        value = (value & 0xfffeffff_u32) |
                UInt32.new!(ben.to_int).&(0x1_u32) << 16
      end

      unless out_dri.nil?
        value = (value & 0xffffdfff_u32) |
                UInt32.new!(out_dri.to_int).&(0x1_u32) << 13
      end

      unless mono.nil?
        value = (value & 0xffffefff_u32) |
                UInt32.new!(mono.to_int).&(0x1_u32) << 12
      end

      unless syncen.nil?
        value = (value & 0xfffff3ff_u32) |
                UInt32.new!(syncen.to_int).&(0x3_u32) << 10
      end

      unless ckstr.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(ckstr.to_int).&(0x1_u32) << 9
      end

      unless lsbfirst.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(lsbfirst.to_int).&(0x1_u32) << 8
      end

      unless ds.nil?
        value = (value & 0xffffff1f_u32) |
                UInt32.new!(ds.to_int).&(0x7_u32) << 5
      end

      unless prtcfg.nil?
        value = (value & 0xfffffff3_u32) |
                UInt32.new!(prtcfg.to_int).&(0x3_u32) << 2
      end

      unless mode.nil?
        value = (value & 0xfffffffc_u32) |
                UInt32.new!(mode.to_int).&(0x3_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      mcjdiv : UInt8? = nil,
      nodiv : Bool? = nil,
      dmaen : Bool? = nil,
      ben : Bool? = nil,
      out_dri : Bool? = nil,
      mono : Bool? = nil,
      syncen : UInt8? = nil,
      ckstr : Bool? = nil,
      lsbfirst : Bool? = nil,
      ds : UInt8? = nil,
      prtcfg : UInt8? = nil,
      mode : UInt8? = nil
    ) : Nil
      self.value = self.value.copy_with(
        mcjdiv: mcjdiv,
        nodiv: nodiv,
        dmaen: dmaen,
        ben: ben,
        out_dri: out_dri,
        mono: mono,
        syncen: syncen,
        ckstr: ckstr,
        lsbfirst: lsbfirst,
        ds: ds,
        prtcfg: prtcfg,
        mode: mode,
      )
    end
  end # struct

  # BConfiguration register 2
  struct BCR2
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

    # Companding mode
    def comp : UInt8
      UInt8.new!((@value >> 14) & 0x3_u32)
    end

    # Companding mode
    def self.comp : UInt8
      value.comp
    end

    # Companding mode
    def self.comp=(value : UInt8) : UInt8
      self.set(comp: value)
      value
    end

    # Complement bit
    def cpl : Bool
      @value.bits_set?(0x2000_u32)
    end

    # Complement bit
    def self.cpl : Bool
      value.cpl
    end

    # Complement bit
    def self.cpl=(value : Bool) : Bool
      self.set(cpl: value)
      value
    end

    # Mute counter
    def mutecn : UInt8
      UInt8.new!((@value >> 7) & 0x3f_u32)
    end

    # Mute counter
    def self.mutecn : UInt8
      value.mutecn
    end

    # Mute counter
    def self.mutecn=(value : UInt8) : UInt8
      self.set(mutecn: value)
      value
    end

    # Mute value
    def muteval : Bool
      @value.bits_set?(0x40_u32)
    end

    # Mute value
    def self.muteval : Bool
      value.muteval
    end

    # Mute value
    def self.muteval=(value : Bool) : Bool
      self.set(muteval: value)
      value
    end

    # Mute
    def mute : Bool
      @value.bits_set?(0x20_u32)
    end

    # Mute
    def self.mute : Bool
      value.mute
    end

    # Mute
    def self.mute=(value : Bool) : Bool
      self.set(mute: value)
      value
    end

    # Tristate management on data              line
    def tris : Bool
      @value.bits_set?(0x10_u32)
    end

    # Tristate management on data              line
    def self.tris : Bool
      value.tris
    end

    # Tristate management on data              line
    def self.tris=(value : Bool) : Bool
      self.set(tris: value)
      value
    end

    # FIFO flush
    def fflus : Bool
      @value.bits_set?(0x8_u32)
    end

    # FIFO flush
    def self.fflus : Bool
      value.fflus
    end

    # FIFO flush
    def self.fflus=(value : Bool) : Bool
      self.set(fflus: value)
      value
    end

    # FIFO threshold
    def fth : UInt8
      UInt8.new!((@value >> 0) & 0x7_u32)
    end

    # FIFO threshold
    def self.fth : UInt8
      value.fth
    end

    # FIFO threshold
    def self.fth=(value : UInt8) : UInt8
      self.set(fth: value)
      value
    end

    def copy_with(
      *,

      comp : UInt8? = nil,

      cpl : Bool? = nil,

      mutecn : UInt8? = nil,

      muteval : Bool? = nil,

      mute : Bool? = nil,

      tris : Bool? = nil,

      fflus : Bool? = nil,

      fth : UInt8? = nil
    ) : self
      value = @value

      unless comp.nil?
        value = (value & 0xffff3fff_u32) |
                UInt32.new!(comp.to_int).&(0x3_u32) << 14
      end

      unless cpl.nil?
        value = (value & 0xffffdfff_u32) |
                UInt32.new!(cpl.to_int).&(0x1_u32) << 13
      end

      unless mutecn.nil?
        value = (value & 0xffffe07f_u32) |
                UInt32.new!(mutecn.to_int).&(0x3f_u32) << 7
      end

      unless muteval.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(muteval.to_int).&(0x1_u32) << 6
      end

      unless mute.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(mute.to_int).&(0x1_u32) << 5
      end

      unless tris.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(tris.to_int).&(0x1_u32) << 4
      end

      unless fflus.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(fflus.to_int).&(0x1_u32) << 3
      end

      unless fth.nil?
        value = (value & 0xfffffff8_u32) |
                UInt32.new!(fth.to_int).&(0x7_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      comp : UInt8? = nil,
      cpl : Bool? = nil,
      mutecn : UInt8? = nil,
      muteval : Bool? = nil,
      mute : Bool? = nil,
      tris : Bool? = nil,
      fflus : Bool? = nil,
      fth : UInt8? = nil
    ) : Nil
      self.value = self.value.copy_with(
        comp: comp,
        cpl: cpl,
        mutecn: mutecn,
        muteval: muteval,
        mute: mute,
        tris: tris,
        fflus: fflus,
        fth: fth,
      )
    end
  end # struct

  # BFRCR
  struct BFRCR
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
      new(0x7_u64)
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

    # Frame synchronization              offset
    def fsoff : Bool
      @value.bits_set?(0x40000_u32)
    end

    # Frame synchronization              offset
    def self.fsoff : Bool
      value.fsoff
    end

    # Frame synchronization              offset
    def self.fsoff=(value : Bool) : Bool
      self.set(fsoff: value)
      value
    end

    # Frame synchronization              polarity
    def fspol : Bool
      @value.bits_set?(0x20000_u32)
    end

    # Frame synchronization              polarity
    def self.fspol : Bool
      value.fspol
    end

    # Frame synchronization              polarity
    def self.fspol=(value : Bool) : Bool
      self.set(fspol: value)
      value
    end

    # Frame synchronization              definition
    def fsdef : Bool
      @value.bits_set?(0x10000_u32)
    end

    # Frame synchronization              definition
    def self.fsdef : Bool
      value.fsdef
    end

    # Frame synchronization              definition
    def self.fsdef=(value : Bool) : Bool
      self.set(fsdef: value)
      value
    end

    # Frame synchronization active level              length
    def fsall : UInt8
      UInt8.new!((@value >> 8) & 0x7f_u32)
    end

    # Frame synchronization active level              length
    def self.fsall : UInt8
      value.fsall
    end

    # Frame synchronization active level              length
    def self.fsall=(value : UInt8) : UInt8
      self.set(fsall: value)
      value
    end

    # Frame length
    def frl : UInt8
      UInt8.new!((@value >> 0) & 0xff_u32)
    end

    # Frame length
    def self.frl : UInt8
      value.frl
    end

    # Frame length
    def self.frl=(value : UInt8) : UInt8
      self.set(frl: value)
      value
    end

    def copy_with(
      *,

      fsoff : Bool? = nil,

      fspol : Bool? = nil,

      fsdef : Bool? = nil,

      fsall : UInt8? = nil,

      frl : UInt8? = nil
    ) : self
      value = @value

      unless fsoff.nil?
        value = (value & 0xfffbffff_u32) |
                UInt32.new!(fsoff.to_int).&(0x1_u32) << 18
      end

      unless fspol.nil?
        value = (value & 0xfffdffff_u32) |
                UInt32.new!(fspol.to_int).&(0x1_u32) << 17
      end

      unless fsdef.nil?
        value = (value & 0xfffeffff_u32) |
                UInt32.new!(fsdef.to_int).&(0x1_u32) << 16
      end

      unless fsall.nil?
        value = (value & 0xffff80ff_u32) |
                UInt32.new!(fsall.to_int).&(0x7f_u32) << 8
      end

      unless frl.nil?
        value = (value & 0xffffff00_u32) |
                UInt32.new!(frl.to_int).&(0xff_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      fsoff : Bool? = nil,
      fspol : Bool? = nil,
      fsdef : Bool? = nil,
      fsall : UInt8? = nil,
      frl : UInt8? = nil
    ) : Nil
      self.value = self.value.copy_with(
        fsoff: fsoff,
        fspol: fspol,
        fsdef: fsdef,
        fsall: fsall,
        frl: frl,
      )
    end
  end # struct

  # BSlot register
  struct BSLOTR
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

    # Slot enable
    def sloten : UInt16
      UInt16.new!((@value >> 16) & 0xffff_u32)
    end

    # Slot enable
    def self.sloten : UInt16
      value.sloten
    end

    # Slot enable
    def self.sloten=(value : UInt16) : UInt16
      self.set(sloten: value)
      value
    end

    # Number of slots in an audio              frame
    def nbslot : UInt8
      UInt8.new!((@value >> 8) & 0xf_u32)
    end

    # Number of slots in an audio              frame
    def self.nbslot : UInt8
      value.nbslot
    end

    # Number of slots in an audio              frame
    def self.nbslot=(value : UInt8) : UInt8
      self.set(nbslot: value)
      value
    end

    # Slot size
    def slotsz : UInt8
      UInt8.new!((@value >> 6) & 0x3_u32)
    end

    # Slot size
    def self.slotsz : UInt8
      value.slotsz
    end

    # Slot size
    def self.slotsz=(value : UInt8) : UInt8
      self.set(slotsz: value)
      value
    end

    # First bit offset
    def fboff : UInt8
      UInt8.new!((@value >> 0) & 0x1f_u32)
    end

    # First bit offset
    def self.fboff : UInt8
      value.fboff
    end

    # First bit offset
    def self.fboff=(value : UInt8) : UInt8
      self.set(fboff: value)
      value
    end

    def copy_with(
      *,

      sloten : UInt16? = nil,

      nbslot : UInt8? = nil,

      slotsz : UInt8? = nil,

      fboff : UInt8? = nil
    ) : self
      value = @value

      unless sloten.nil?
        value = (value & 0xffff_u32) |
                UInt32.new!(sloten.to_int).&(0xffff_u32) << 16
      end

      unless nbslot.nil?
        value = (value & 0xfffff0ff_u32) |
                UInt32.new!(nbslot.to_int).&(0xf_u32) << 8
      end

      unless slotsz.nil?
        value = (value & 0xffffff3f_u32) |
                UInt32.new!(slotsz.to_int).&(0x3_u32) << 6
      end

      unless fboff.nil?
        value = (value & 0xffffffe0_u32) |
                UInt32.new!(fboff.to_int).&(0x1f_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      sloten : UInt16? = nil,
      nbslot : UInt8? = nil,
      slotsz : UInt8? = nil,
      fboff : UInt8? = nil
    ) : Nil
      self.value = self.value.copy_with(
        sloten: sloten,
        nbslot: nbslot,
        slotsz: slotsz,
        fboff: fboff,
      )
    end
  end # struct

  # BInterrupt mask register2
  struct BIM
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

    # Late frame synchronization detection              interrupt enable
    def lfsdetie : Bool
      @value.bits_set?(0x40_u32)
    end

    # Late frame synchronization detection              interrupt enable
    def self.lfsdetie : Bool
      value.lfsdetie
    end

    # Late frame synchronization detection              interrupt enable
    def self.lfsdetie=(value : Bool) : Bool
      self.set(lfsdetie: value)
      value
    end

    # Anticipated frame synchronization              detection interrupt enable
    def afsdetie : Bool
      @value.bits_set?(0x20_u32)
    end

    # Anticipated frame synchronization              detection interrupt enable
    def self.afsdetie : Bool
      value.afsdetie
    end

    # Anticipated frame synchronization              detection interrupt enable
    def self.afsdetie=(value : Bool) : Bool
      self.set(afsdetie: value)
      value
    end

    # Codec not ready interrupt              enable
    def cnrdyie : Bool
      @value.bits_set?(0x10_u32)
    end

    # Codec not ready interrupt              enable
    def self.cnrdyie : Bool
      value.cnrdyie
    end

    # Codec not ready interrupt              enable
    def self.cnrdyie=(value : Bool) : Bool
      self.set(cnrdyie: value)
      value
    end

    # FIFO request interrupt              enable
    def freqie : Bool
      @value.bits_set?(0x8_u32)
    end

    # FIFO request interrupt              enable
    def self.freqie : Bool
      value.freqie
    end

    # FIFO request interrupt              enable
    def self.freqie=(value : Bool) : Bool
      self.set(freqie: value)
      value
    end

    # Wrong clock configuration interrupt              enable
    def wckcfg : Bool
      @value.bits_set?(0x4_u32)
    end

    # Wrong clock configuration interrupt              enable
    def self.wckcfg : Bool
      value.wckcfg
    end

    # Wrong clock configuration interrupt              enable
    def self.wckcfg=(value : Bool) : Bool
      self.set(wckcfg: value)
      value
    end

    # Mute detection interrupt              enable
    def mutedet : Bool
      @value.bits_set?(0x2_u32)
    end

    # Mute detection interrupt              enable
    def self.mutedet : Bool
      value.mutedet
    end

    # Mute detection interrupt              enable
    def self.mutedet=(value : Bool) : Bool
      self.set(mutedet: value)
      value
    end

    # Overrun/underrun interrupt              enable
    def ovrudrie : Bool
      @value.bits_set?(0x1_u32)
    end

    # Overrun/underrun interrupt              enable
    def self.ovrudrie : Bool
      value.ovrudrie
    end

    # Overrun/underrun interrupt              enable
    def self.ovrudrie=(value : Bool) : Bool
      self.set(ovrudrie: value)
      value
    end

    def copy_with(
      *,

      lfsdetie : Bool? = nil,

      afsdetie : Bool? = nil,

      cnrdyie : Bool? = nil,

      freqie : Bool? = nil,

      wckcfg : Bool? = nil,

      mutedet : Bool? = nil,

      ovrudrie : Bool? = nil
    ) : self
      value = @value

      unless lfsdetie.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(lfsdetie.to_int).&(0x1_u32) << 6
      end

      unless afsdetie.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(afsdetie.to_int).&(0x1_u32) << 5
      end

      unless cnrdyie.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(cnrdyie.to_int).&(0x1_u32) << 4
      end

      unless freqie.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(freqie.to_int).&(0x1_u32) << 3
      end

      unless wckcfg.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(wckcfg.to_int).&(0x1_u32) << 2
      end

      unless mutedet.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(mutedet.to_int).&(0x1_u32) << 1
      end

      unless ovrudrie.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(ovrudrie.to_int).&(0x1_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      lfsdetie : Bool? = nil,
      afsdetie : Bool? = nil,
      cnrdyie : Bool? = nil,
      freqie : Bool? = nil,
      wckcfg : Bool? = nil,
      mutedet : Bool? = nil,
      ovrudrie : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        lfsdetie: lfsdetie,
        afsdetie: afsdetie,
        cnrdyie: cnrdyie,
        freqie: freqie,
        wckcfg: wckcfg,
        mutedet: mutedet,
        ovrudrie: ovrudrie,
      )
    end
  end # struct

  # BStatus register
  struct BSR
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

    # FIFO level threshold
    def flvl : UInt8
      UInt8.new!((@value >> 16) & 0x7_u32)
    end

    # FIFO level threshold
    def self.flvl : UInt8
      value.flvl
    end

    # Late frame synchronization              detection
    def lfsdet : Bool
      @value.bits_set?(0x40_u32)
    end

    # Late frame synchronization              detection
    def self.lfsdet : Bool
      value.lfsdet
    end

    # Anticipated frame synchronization              detection
    def afsdet : Bool
      @value.bits_set?(0x20_u32)
    end

    # Anticipated frame synchronization              detection
    def self.afsdet : Bool
      value.afsdet
    end

    # Codec not ready
    def cnrdy : Bool
      @value.bits_set?(0x10_u32)
    end

    # Codec not ready
    def self.cnrdy : Bool
      value.cnrdy
    end

    # FIFO request
    def freq : Bool
      @value.bits_set?(0x8_u32)
    end

    # FIFO request
    def self.freq : Bool
      value.freq
    end

    # Wrong clock configuration              flag
    def wckcfg : Bool
      @value.bits_set?(0x4_u32)
    end

    # Wrong clock configuration              flag
    def self.wckcfg : Bool
      value.wckcfg
    end

    # Mute detection
    def mutedet : Bool
      @value.bits_set?(0x2_u32)
    end

    # Mute detection
    def self.mutedet : Bool
      value.mutedet
    end

    # Overrun / underrun
    def ovrudr : Bool
      @value.bits_set?(0x1_u32)
    end

    # Overrun / underrun
    def self.ovrudr : Bool
      value.ovrudr
    end
  end # struct

  # BClear flag register
  struct BCLRFR
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

    # Clear late frame synchronization              detection flag
    def self.lfsdet=(value : Bool) : Bool
      self.set(lfsdet: value)
      value
    end

    # Clear anticipated frame synchronization              detection flag
    def self.cafsdet=(value : Bool) : Bool
      self.set(cafsdet: value)
      value
    end

    # Clear codec not ready flag
    def self.cnrdy=(value : Bool) : Bool
      self.set(cnrdy: value)
      value
    end

    # Clear wrong clock configuration              flag
    def self.wckcfg=(value : Bool) : Bool
      self.set(wckcfg: value)
      value
    end

    # Mute detection flag
    def self.mutedet=(value : Bool) : Bool
      self.set(mutedet: value)
      value
    end

    # Clear overrun / underrun
    def self.ovrudr=(value : Bool) : Bool
      self.set(ovrudr: value)
      value
    end

    def copy_with(
      *,

      lfsdet : Bool? = nil,

      cafsdet : Bool? = nil,

      cnrdy : Bool? = nil,

      wckcfg : Bool? = nil,

      mutedet : Bool? = nil,

      ovrudr : Bool? = nil
    ) : self
      value = @value

      unless lfsdet.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(lfsdet.to_int).&(0x1_u32) << 6
      end

      unless cafsdet.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(cafsdet.to_int).&(0x1_u32) << 5
      end

      unless cnrdy.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(cnrdy.to_int).&(0x1_u32) << 4
      end

      unless wckcfg.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(wckcfg.to_int).&(0x1_u32) << 2
      end

      unless mutedet.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(mutedet.to_int).&(0x1_u32) << 1
      end

      unless ovrudr.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(ovrudr.to_int).&(0x1_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      lfsdet : Bool? = nil,
      cafsdet : Bool? = nil,
      cnrdy : Bool? = nil,
      wckcfg : Bool? = nil,
      mutedet : Bool? = nil,
      ovrudr : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        lfsdet: lfsdet,
        cafsdet: cafsdet,
        cnrdy: cnrdy,
        wckcfg: wckcfg,
        mutedet: mutedet,
        ovrudr: ovrudr,
      )
    end
  end # struct

  # BData register
  struct BDR
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

    # Data
    def data : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # Data
    def self.data : UInt32
      value.data
    end

    # Data
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

  # AConfiguration register 1
  struct ACR1
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
      new(0x40_u64)
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

    # Master clock divider
    def mcjdiv : UInt8
      UInt8.new!((@value >> 20) & 0xf_u32)
    end

    # Master clock divider
    def self.mcjdiv : UInt8
      value.mcjdiv
    end

    # Master clock divider
    def self.mcjdiv=(value : UInt8) : UInt8
      self.set(mcjdiv: value)
      value
    end

    # No divider
    def nodiv : Bool
      @value.bits_set?(0x80000_u32)
    end

    # No divider
    def self.nodiv : Bool
      value.nodiv
    end

    # No divider
    def self.nodiv=(value : Bool) : Bool
      self.set(nodiv: value)
      value
    end

    # DMA enable
    def dmaen : Bool
      @value.bits_set?(0x20000_u32)
    end

    # DMA enable
    def self.dmaen : Bool
      value.dmaen
    end

    # DMA enable
    def self.dmaen=(value : Bool) : Bool
      self.set(dmaen: value)
      value
    end

    # Audio block A enable
    def aen : Bool
      @value.bits_set?(0x10000_u32)
    end

    # Audio block A enable
    def self.aen : Bool
      value.aen
    end

    # Audio block A enable
    def self.aen=(value : Bool) : Bool
      self.set(aen: value)
      value
    end

    # Output drive
    def out_dri : Bool
      @value.bits_set?(0x2000_u32)
    end

    # Output drive
    def self.out_dri : Bool
      value.out_dri
    end

    # Output drive
    def self.out_dri=(value : Bool) : Bool
      self.set(out_dri: value)
      value
    end

    # Mono mode
    def mono : Bool
      @value.bits_set?(0x1000_u32)
    end

    # Mono mode
    def self.mono : Bool
      value.mono
    end

    # Mono mode
    def self.mono=(value : Bool) : Bool
      self.set(mono: value)
      value
    end

    # Synchronization enable
    def syncen : UInt8
      UInt8.new!((@value >> 10) & 0x3_u32)
    end

    # Synchronization enable
    def self.syncen : UInt8
      value.syncen
    end

    # Synchronization enable
    def self.syncen=(value : UInt8) : UInt8
      self.set(syncen: value)
      value
    end

    # Clock strobing edge
    def ckstr : Bool
      @value.bits_set?(0x200_u32)
    end

    # Clock strobing edge
    def self.ckstr : Bool
      value.ckstr
    end

    # Clock strobing edge
    def self.ckstr=(value : Bool) : Bool
      self.set(ckstr: value)
      value
    end

    # Least significant bit              first
    def lsbfirst : Bool
      @value.bits_set?(0x100_u32)
    end

    # Least significant bit              first
    def self.lsbfirst : Bool
      value.lsbfirst
    end

    # Least significant bit              first
    def self.lsbfirst=(value : Bool) : Bool
      self.set(lsbfirst: value)
      value
    end

    # Data size
    def ds : UInt8
      UInt8.new!((@value >> 5) & 0x7_u32)
    end

    # Data size
    def self.ds : UInt8
      value.ds
    end

    # Data size
    def self.ds=(value : UInt8) : UInt8
      self.set(ds: value)
      value
    end

    # Protocol configuration
    def prtcfg : UInt8
      UInt8.new!((@value >> 2) & 0x3_u32)
    end

    # Protocol configuration
    def self.prtcfg : UInt8
      value.prtcfg
    end

    # Protocol configuration
    def self.prtcfg=(value : UInt8) : UInt8
      self.set(prtcfg: value)
      value
    end

    # Audio block mode
    def mode : UInt8
      UInt8.new!((@value >> 0) & 0x3_u32)
    end

    # Audio block mode
    def self.mode : UInt8
      value.mode
    end

    # Audio block mode
    def self.mode=(value : UInt8) : UInt8
      self.set(mode: value)
      value
    end

    def copy_with(
      *,

      mcjdiv : UInt8? = nil,

      nodiv : Bool? = nil,

      dmaen : Bool? = nil,

      aen : Bool? = nil,

      out_dri : Bool? = nil,

      mono : Bool? = nil,

      syncen : UInt8? = nil,

      ckstr : Bool? = nil,

      lsbfirst : Bool? = nil,

      ds : UInt8? = nil,

      prtcfg : UInt8? = nil,

      mode : UInt8? = nil
    ) : self
      value = @value

      unless mcjdiv.nil?
        value = (value & 0xff0fffff_u32) |
                UInt32.new!(mcjdiv.to_int).&(0xf_u32) << 20
      end

      unless nodiv.nil?
        value = (value & 0xfff7ffff_u32) |
                UInt32.new!(nodiv.to_int).&(0x1_u32) << 19
      end

      unless dmaen.nil?
        value = (value & 0xfffdffff_u32) |
                UInt32.new!(dmaen.to_int).&(0x1_u32) << 17
      end

      unless aen.nil?
        value = (value & 0xfffeffff_u32) |
                UInt32.new!(aen.to_int).&(0x1_u32) << 16
      end

      unless out_dri.nil?
        value = (value & 0xffffdfff_u32) |
                UInt32.new!(out_dri.to_int).&(0x1_u32) << 13
      end

      unless mono.nil?
        value = (value & 0xffffefff_u32) |
                UInt32.new!(mono.to_int).&(0x1_u32) << 12
      end

      unless syncen.nil?
        value = (value & 0xfffff3ff_u32) |
                UInt32.new!(syncen.to_int).&(0x3_u32) << 10
      end

      unless ckstr.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(ckstr.to_int).&(0x1_u32) << 9
      end

      unless lsbfirst.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(lsbfirst.to_int).&(0x1_u32) << 8
      end

      unless ds.nil?
        value = (value & 0xffffff1f_u32) |
                UInt32.new!(ds.to_int).&(0x7_u32) << 5
      end

      unless prtcfg.nil?
        value = (value & 0xfffffff3_u32) |
                UInt32.new!(prtcfg.to_int).&(0x3_u32) << 2
      end

      unless mode.nil?
        value = (value & 0xfffffffc_u32) |
                UInt32.new!(mode.to_int).&(0x3_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      mcjdiv : UInt8? = nil,
      nodiv : Bool? = nil,
      dmaen : Bool? = nil,
      aen : Bool? = nil,
      out_dri : Bool? = nil,
      mono : Bool? = nil,
      syncen : UInt8? = nil,
      ckstr : Bool? = nil,
      lsbfirst : Bool? = nil,
      ds : UInt8? = nil,
      prtcfg : UInt8? = nil,
      mode : UInt8? = nil
    ) : Nil
      self.value = self.value.copy_with(
        mcjdiv: mcjdiv,
        nodiv: nodiv,
        dmaen: dmaen,
        aen: aen,
        out_dri: out_dri,
        mono: mono,
        syncen: syncen,
        ckstr: ckstr,
        lsbfirst: lsbfirst,
        ds: ds,
        prtcfg: prtcfg,
        mode: mode,
      )
    end
  end # struct

  # AConfiguration register 2
  struct ACR2
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

    # Companding mode
    def comp : UInt8
      UInt8.new!((@value >> 14) & 0x3_u32)
    end

    # Companding mode
    def self.comp : UInt8
      value.comp
    end

    # Companding mode
    def self.comp=(value : UInt8) : UInt8
      self.set(comp: value)
      value
    end

    # Complement bit
    def cpl : Bool
      @value.bits_set?(0x2000_u32)
    end

    # Complement bit
    def self.cpl : Bool
      value.cpl
    end

    # Complement bit
    def self.cpl=(value : Bool) : Bool
      self.set(cpl: value)
      value
    end

    # Mute counter
    def mutecn : UInt8
      UInt8.new!((@value >> 7) & 0x3f_u32)
    end

    # Mute counter
    def self.mutecn : UInt8
      value.mutecn
    end

    # Mute counter
    def self.mutecn=(value : UInt8) : UInt8
      self.set(mutecn: value)
      value
    end

    # Mute value
    def muteval : Bool
      @value.bits_set?(0x40_u32)
    end

    # Mute value
    def self.muteval : Bool
      value.muteval
    end

    # Mute value
    def self.muteval=(value : Bool) : Bool
      self.set(muteval: value)
      value
    end

    # Mute
    def mute : Bool
      @value.bits_set?(0x20_u32)
    end

    # Mute
    def self.mute : Bool
      value.mute
    end

    # Mute
    def self.mute=(value : Bool) : Bool
      self.set(mute: value)
      value
    end

    # Tristate management on data              line
    def tris : Bool
      @value.bits_set?(0x10_u32)
    end

    # Tristate management on data              line
    def self.tris : Bool
      value.tris
    end

    # Tristate management on data              line
    def self.tris=(value : Bool) : Bool
      self.set(tris: value)
      value
    end

    # FIFO flush
    def fflus : Bool
      @value.bits_set?(0x8_u32)
    end

    # FIFO flush
    def self.fflus : Bool
      value.fflus
    end

    # FIFO flush
    def self.fflus=(value : Bool) : Bool
      self.set(fflus: value)
      value
    end

    # FIFO threshold
    def fth : UInt8
      UInt8.new!((@value >> 0) & 0x7_u32)
    end

    # FIFO threshold
    def self.fth : UInt8
      value.fth
    end

    # FIFO threshold
    def self.fth=(value : UInt8) : UInt8
      self.set(fth: value)
      value
    end

    def copy_with(
      *,

      comp : UInt8? = nil,

      cpl : Bool? = nil,

      mutecn : UInt8? = nil,

      muteval : Bool? = nil,

      mute : Bool? = nil,

      tris : Bool? = nil,

      fflus : Bool? = nil,

      fth : UInt8? = nil
    ) : self
      value = @value

      unless comp.nil?
        value = (value & 0xffff3fff_u32) |
                UInt32.new!(comp.to_int).&(0x3_u32) << 14
      end

      unless cpl.nil?
        value = (value & 0xffffdfff_u32) |
                UInt32.new!(cpl.to_int).&(0x1_u32) << 13
      end

      unless mutecn.nil?
        value = (value & 0xffffe07f_u32) |
                UInt32.new!(mutecn.to_int).&(0x3f_u32) << 7
      end

      unless muteval.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(muteval.to_int).&(0x1_u32) << 6
      end

      unless mute.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(mute.to_int).&(0x1_u32) << 5
      end

      unless tris.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(tris.to_int).&(0x1_u32) << 4
      end

      unless fflus.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(fflus.to_int).&(0x1_u32) << 3
      end

      unless fth.nil?
        value = (value & 0xfffffff8_u32) |
                UInt32.new!(fth.to_int).&(0x7_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      comp : UInt8? = nil,
      cpl : Bool? = nil,
      mutecn : UInt8? = nil,
      muteval : Bool? = nil,
      mute : Bool? = nil,
      tris : Bool? = nil,
      fflus : Bool? = nil,
      fth : UInt8? = nil
    ) : Nil
      self.value = self.value.copy_with(
        comp: comp,
        cpl: cpl,
        mutecn: mutecn,
        muteval: muteval,
        mute: mute,
        tris: tris,
        fflus: fflus,
        fth: fth,
      )
    end
  end # struct

  # AFRCR
  struct AFRCR
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
      new(0x7_u64)
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

    # Frame synchronization              offset
    def fsoff : Bool
      @value.bits_set?(0x40000_u32)
    end

    # Frame synchronization              offset
    def self.fsoff : Bool
      value.fsoff
    end

    # Frame synchronization              offset
    def self.fsoff=(value : Bool) : Bool
      self.set(fsoff: value)
      value
    end

    # Frame synchronization              polarity
    def fspol : Bool
      @value.bits_set?(0x20000_u32)
    end

    # Frame synchronization              polarity
    def self.fspol : Bool
      value.fspol
    end

    # Frame synchronization              polarity
    def self.fspol=(value : Bool) : Bool
      self.set(fspol: value)
      value
    end

    # Frame synchronization              definition
    def fsdef : Bool
      @value.bits_set?(0x10000_u32)
    end

    # Frame synchronization              definition
    def self.fsdef : Bool
      value.fsdef
    end

    # Frame synchronization              definition
    def self.fsdef=(value : Bool) : Bool
      self.set(fsdef: value)
      value
    end

    # Frame synchronization active level              length
    def fsall : UInt8
      UInt8.new!((@value >> 8) & 0x7f_u32)
    end

    # Frame synchronization active level              length
    def self.fsall : UInt8
      value.fsall
    end

    # Frame synchronization active level              length
    def self.fsall=(value : UInt8) : UInt8
      self.set(fsall: value)
      value
    end

    # Frame length
    def frl : UInt8
      UInt8.new!((@value >> 0) & 0xff_u32)
    end

    # Frame length
    def self.frl : UInt8
      value.frl
    end

    # Frame length
    def self.frl=(value : UInt8) : UInt8
      self.set(frl: value)
      value
    end

    def copy_with(
      *,

      fsoff : Bool? = nil,

      fspol : Bool? = nil,

      fsdef : Bool? = nil,

      fsall : UInt8? = nil,

      frl : UInt8? = nil
    ) : self
      value = @value

      unless fsoff.nil?
        value = (value & 0xfffbffff_u32) |
                UInt32.new!(fsoff.to_int).&(0x1_u32) << 18
      end

      unless fspol.nil?
        value = (value & 0xfffdffff_u32) |
                UInt32.new!(fspol.to_int).&(0x1_u32) << 17
      end

      unless fsdef.nil?
        value = (value & 0xfffeffff_u32) |
                UInt32.new!(fsdef.to_int).&(0x1_u32) << 16
      end

      unless fsall.nil?
        value = (value & 0xffff80ff_u32) |
                UInt32.new!(fsall.to_int).&(0x7f_u32) << 8
      end

      unless frl.nil?
        value = (value & 0xffffff00_u32) |
                UInt32.new!(frl.to_int).&(0xff_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      fsoff : Bool? = nil,
      fspol : Bool? = nil,
      fsdef : Bool? = nil,
      fsall : UInt8? = nil,
      frl : UInt8? = nil
    ) : Nil
      self.value = self.value.copy_with(
        fsoff: fsoff,
        fspol: fspol,
        fsdef: fsdef,
        fsall: fsall,
        frl: frl,
      )
    end
  end # struct

  # ASlot register
  struct ASLOTR
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

    # Slot enable
    def sloten : UInt16
      UInt16.new!((@value >> 16) & 0xffff_u32)
    end

    # Slot enable
    def self.sloten : UInt16
      value.sloten
    end

    # Slot enable
    def self.sloten=(value : UInt16) : UInt16
      self.set(sloten: value)
      value
    end

    # Number of slots in an audio              frame
    def nbslot : UInt8
      UInt8.new!((@value >> 8) & 0xf_u32)
    end

    # Number of slots in an audio              frame
    def self.nbslot : UInt8
      value.nbslot
    end

    # Number of slots in an audio              frame
    def self.nbslot=(value : UInt8) : UInt8
      self.set(nbslot: value)
      value
    end

    # Slot size
    def slotsz : UInt8
      UInt8.new!((@value >> 6) & 0x3_u32)
    end

    # Slot size
    def self.slotsz : UInt8
      value.slotsz
    end

    # Slot size
    def self.slotsz=(value : UInt8) : UInt8
      self.set(slotsz: value)
      value
    end

    # First bit offset
    def fboff : UInt8
      UInt8.new!((@value >> 0) & 0x1f_u32)
    end

    # First bit offset
    def self.fboff : UInt8
      value.fboff
    end

    # First bit offset
    def self.fboff=(value : UInt8) : UInt8
      self.set(fboff: value)
      value
    end

    def copy_with(
      *,

      sloten : UInt16? = nil,

      nbslot : UInt8? = nil,

      slotsz : UInt8? = nil,

      fboff : UInt8? = nil
    ) : self
      value = @value

      unless sloten.nil?
        value = (value & 0xffff_u32) |
                UInt32.new!(sloten.to_int).&(0xffff_u32) << 16
      end

      unless nbslot.nil?
        value = (value & 0xfffff0ff_u32) |
                UInt32.new!(nbslot.to_int).&(0xf_u32) << 8
      end

      unless slotsz.nil?
        value = (value & 0xffffff3f_u32) |
                UInt32.new!(slotsz.to_int).&(0x3_u32) << 6
      end

      unless fboff.nil?
        value = (value & 0xffffffe0_u32) |
                UInt32.new!(fboff.to_int).&(0x1f_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      sloten : UInt16? = nil,
      nbslot : UInt8? = nil,
      slotsz : UInt8? = nil,
      fboff : UInt8? = nil
    ) : Nil
      self.value = self.value.copy_with(
        sloten: sloten,
        nbslot: nbslot,
        slotsz: slotsz,
        fboff: fboff,
      )
    end
  end # struct

  # AInterrupt mask register2
  struct AIM
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

    # Late frame synchronization detection              interrupt enable
    def lfsdet : Bool
      @value.bits_set?(0x40_u32)
    end

    # Late frame synchronization detection              interrupt enable
    def self.lfsdet : Bool
      value.lfsdet
    end

    # Late frame synchronization detection              interrupt enable
    def self.lfsdet=(value : Bool) : Bool
      self.set(lfsdet: value)
      value
    end

    # Anticipated frame synchronization              detection interrupt enable
    def afsdetie : Bool
      @value.bits_set?(0x20_u32)
    end

    # Anticipated frame synchronization              detection interrupt enable
    def self.afsdetie : Bool
      value.afsdetie
    end

    # Anticipated frame synchronization              detection interrupt enable
    def self.afsdetie=(value : Bool) : Bool
      self.set(afsdetie: value)
      value
    end

    # Codec not ready interrupt              enable
    def cnrdyie : Bool
      @value.bits_set?(0x10_u32)
    end

    # Codec not ready interrupt              enable
    def self.cnrdyie : Bool
      value.cnrdyie
    end

    # Codec not ready interrupt              enable
    def self.cnrdyie=(value : Bool) : Bool
      self.set(cnrdyie: value)
      value
    end

    # FIFO request interrupt              enable
    def freqie : Bool
      @value.bits_set?(0x8_u32)
    end

    # FIFO request interrupt              enable
    def self.freqie : Bool
      value.freqie
    end

    # FIFO request interrupt              enable
    def self.freqie=(value : Bool) : Bool
      self.set(freqie: value)
      value
    end

    # Wrong clock configuration interrupt              enable
    def wckcfg : Bool
      @value.bits_set?(0x4_u32)
    end

    # Wrong clock configuration interrupt              enable
    def self.wckcfg : Bool
      value.wckcfg
    end

    # Wrong clock configuration interrupt              enable
    def self.wckcfg=(value : Bool) : Bool
      self.set(wckcfg: value)
      value
    end

    # Mute detection interrupt              enable
    def mutedet : Bool
      @value.bits_set?(0x2_u32)
    end

    # Mute detection interrupt              enable
    def self.mutedet : Bool
      value.mutedet
    end

    # Mute detection interrupt              enable
    def self.mutedet=(value : Bool) : Bool
      self.set(mutedet: value)
      value
    end

    # Overrun/underrun interrupt              enable
    def ovrudrie : Bool
      @value.bits_set?(0x1_u32)
    end

    # Overrun/underrun interrupt              enable
    def self.ovrudrie : Bool
      value.ovrudrie
    end

    # Overrun/underrun interrupt              enable
    def self.ovrudrie=(value : Bool) : Bool
      self.set(ovrudrie: value)
      value
    end

    def copy_with(
      *,

      lfsdet : Bool? = nil,

      afsdetie : Bool? = nil,

      cnrdyie : Bool? = nil,

      freqie : Bool? = nil,

      wckcfg : Bool? = nil,

      mutedet : Bool? = nil,

      ovrudrie : Bool? = nil
    ) : self
      value = @value

      unless lfsdet.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(lfsdet.to_int).&(0x1_u32) << 6
      end

      unless afsdetie.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(afsdetie.to_int).&(0x1_u32) << 5
      end

      unless cnrdyie.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(cnrdyie.to_int).&(0x1_u32) << 4
      end

      unless freqie.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(freqie.to_int).&(0x1_u32) << 3
      end

      unless wckcfg.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(wckcfg.to_int).&(0x1_u32) << 2
      end

      unless mutedet.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(mutedet.to_int).&(0x1_u32) << 1
      end

      unless ovrudrie.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(ovrudrie.to_int).&(0x1_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      lfsdet : Bool? = nil,
      afsdetie : Bool? = nil,
      cnrdyie : Bool? = nil,
      freqie : Bool? = nil,
      wckcfg : Bool? = nil,
      mutedet : Bool? = nil,
      ovrudrie : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        lfsdet: lfsdet,
        afsdetie: afsdetie,
        cnrdyie: cnrdyie,
        freqie: freqie,
        wckcfg: wckcfg,
        mutedet: mutedet,
        ovrudrie: ovrudrie,
      )
    end
  end # struct

  # AStatus register
  struct ASR
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

    # FIFO level threshold
    def flvl : UInt8
      UInt8.new!((@value >> 16) & 0x7_u32)
    end

    # FIFO level threshold
    def self.flvl : UInt8
      value.flvl
    end

    # FIFO level threshold
    def self.flvl=(value : UInt8) : UInt8
      self.set(flvl: value)
      value
    end

    # Late frame synchronization              detection
    def lfsdet : Bool
      @value.bits_set?(0x40_u32)
    end

    # Late frame synchronization              detection
    def self.lfsdet : Bool
      value.lfsdet
    end

    # Late frame synchronization              detection
    def self.lfsdet=(value : Bool) : Bool
      self.set(lfsdet: value)
      value
    end

    # Anticipated frame synchronization              detection
    def afsdet : Bool
      @value.bits_set?(0x20_u32)
    end

    # Anticipated frame synchronization              detection
    def self.afsdet : Bool
      value.afsdet
    end

    # Anticipated frame synchronization              detection
    def self.afsdet=(value : Bool) : Bool
      self.set(afsdet: value)
      value
    end

    # Codec not ready
    def cnrdy : Bool
      @value.bits_set?(0x10_u32)
    end

    # Codec not ready
    def self.cnrdy : Bool
      value.cnrdy
    end

    # Codec not ready
    def self.cnrdy=(value : Bool) : Bool
      self.set(cnrdy: value)
      value
    end

    # FIFO request
    def freq : Bool
      @value.bits_set?(0x8_u32)
    end

    # FIFO request
    def self.freq : Bool
      value.freq
    end

    # FIFO request
    def self.freq=(value : Bool) : Bool
      self.set(freq: value)
      value
    end

    # Wrong clock configuration flag. This bit              is read only.
    def wckcfg : Bool
      @value.bits_set?(0x4_u32)
    end

    # Wrong clock configuration flag. This bit              is read only.
    def self.wckcfg : Bool
      value.wckcfg
    end

    # Wrong clock configuration flag. This bit              is read only.
    def self.wckcfg=(value : Bool) : Bool
      self.set(wckcfg: value)
      value
    end

    # Mute detection
    def mutedet : Bool
      @value.bits_set?(0x2_u32)
    end

    # Mute detection
    def self.mutedet : Bool
      value.mutedet
    end

    # Mute detection
    def self.mutedet=(value : Bool) : Bool
      self.set(mutedet: value)
      value
    end

    # Overrun / underrun
    def ovrudr : Bool
      @value.bits_set?(0x1_u32)
    end

    # Overrun / underrun
    def self.ovrudr : Bool
      value.ovrudr
    end

    # Overrun / underrun
    def self.ovrudr=(value : Bool) : Bool
      self.set(ovrudr: value)
      value
    end

    def copy_with(
      *,

      flvl : UInt8? = nil,

      lfsdet : Bool? = nil,

      afsdet : Bool? = nil,

      cnrdy : Bool? = nil,

      freq : Bool? = nil,

      wckcfg : Bool? = nil,

      mutedet : Bool? = nil,

      ovrudr : Bool? = nil
    ) : self
      value = @value

      unless flvl.nil?
        value = (value & 0xfff8ffff_u32) |
                UInt32.new!(flvl.to_int).&(0x7_u32) << 16
      end

      unless lfsdet.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(lfsdet.to_int).&(0x1_u32) << 6
      end

      unless afsdet.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(afsdet.to_int).&(0x1_u32) << 5
      end

      unless cnrdy.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(cnrdy.to_int).&(0x1_u32) << 4
      end

      unless freq.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(freq.to_int).&(0x1_u32) << 3
      end

      unless wckcfg.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(wckcfg.to_int).&(0x1_u32) << 2
      end

      unless mutedet.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(mutedet.to_int).&(0x1_u32) << 1
      end

      unless ovrudr.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(ovrudr.to_int).&(0x1_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      flvl : UInt8? = nil,
      lfsdet : Bool? = nil,
      afsdet : Bool? = nil,
      cnrdy : Bool? = nil,
      freq : Bool? = nil,
      wckcfg : Bool? = nil,
      mutedet : Bool? = nil,
      ovrudr : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        flvl: flvl,
        lfsdet: lfsdet,
        afsdet: afsdet,
        cnrdy: cnrdy,
        freq: freq,
        wckcfg: wckcfg,
        mutedet: mutedet,
        ovrudr: ovrudr,
      )
    end
  end # struct

  # AClear flag register
  struct ACLRFR
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

    # Clear late frame synchronization              detection flag
    def lfsdet : Bool
      @value.bits_set?(0x40_u32)
    end

    # Clear late frame synchronization              detection flag
    def self.lfsdet : Bool
      value.lfsdet
    end

    # Clear late frame synchronization              detection flag
    def self.lfsdet=(value : Bool) : Bool
      self.set(lfsdet: value)
      value
    end

    # Clear anticipated frame synchronization              detection flag.
    def cafsdet : Bool
      @value.bits_set?(0x20_u32)
    end

    # Clear anticipated frame synchronization              detection flag.
    def self.cafsdet : Bool
      value.cafsdet
    end

    # Clear anticipated frame synchronization              detection flag.
    def self.cafsdet=(value : Bool) : Bool
      self.set(cafsdet: value)
      value
    end

    # Clear codec not ready flag
    def cnrdy : Bool
      @value.bits_set?(0x10_u32)
    end

    # Clear codec not ready flag
    def self.cnrdy : Bool
      value.cnrdy
    end

    # Clear codec not ready flag
    def self.cnrdy=(value : Bool) : Bool
      self.set(cnrdy: value)
      value
    end

    # Clear wrong clock configuration              flag
    def wckcfg : Bool
      @value.bits_set?(0x4_u32)
    end

    # Clear wrong clock configuration              flag
    def self.wckcfg : Bool
      value.wckcfg
    end

    # Clear wrong clock configuration              flag
    def self.wckcfg=(value : Bool) : Bool
      self.set(wckcfg: value)
      value
    end

    # Mute detection flag
    def mutedet : Bool
      @value.bits_set?(0x2_u32)
    end

    # Mute detection flag
    def self.mutedet : Bool
      value.mutedet
    end

    # Mute detection flag
    def self.mutedet=(value : Bool) : Bool
      self.set(mutedet: value)
      value
    end

    # Clear overrun / underrun
    def ovrudr : Bool
      @value.bits_set?(0x1_u32)
    end

    # Clear overrun / underrun
    def self.ovrudr : Bool
      value.ovrudr
    end

    # Clear overrun / underrun
    def self.ovrudr=(value : Bool) : Bool
      self.set(ovrudr: value)
      value
    end

    def copy_with(
      *,

      lfsdet : Bool? = nil,

      cafsdet : Bool? = nil,

      cnrdy : Bool? = nil,

      wckcfg : Bool? = nil,

      mutedet : Bool? = nil,

      ovrudr : Bool? = nil
    ) : self
      value = @value

      unless lfsdet.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(lfsdet.to_int).&(0x1_u32) << 6
      end

      unless cafsdet.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(cafsdet.to_int).&(0x1_u32) << 5
      end

      unless cnrdy.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(cnrdy.to_int).&(0x1_u32) << 4
      end

      unless wckcfg.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(wckcfg.to_int).&(0x1_u32) << 2
      end

      unless mutedet.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(mutedet.to_int).&(0x1_u32) << 1
      end

      unless ovrudr.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(ovrudr.to_int).&(0x1_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      lfsdet : Bool? = nil,
      cafsdet : Bool? = nil,
      cnrdy : Bool? = nil,
      wckcfg : Bool? = nil,
      mutedet : Bool? = nil,
      ovrudr : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        lfsdet: lfsdet,
        cafsdet: cafsdet,
        cnrdy: cnrdy,
        wckcfg: wckcfg,
        mutedet: mutedet,
        ovrudr: ovrudr,
      )
    end
  end # struct

  # AData register
  struct ADR
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

    # Data
    def data : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # Data
    def self.data : UInt32
      value.data
    end

    # Data
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
