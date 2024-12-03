# Digital camera interface
module DCMI
  VERSION      = nil
  BASE_ADDRESS = 0x50050000_u64

  # control register 1
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

    # DCMI enable
    def enable : Bool
      @value.bits_set?(0x4000_u32)
    end

    # DCMI enable
    def self.enable : Bool
      value.enable
    end

    # DCMI enable
    def self.enable=(value : Bool) : Bool
      self.set(enable: value)
      value
    end

    # Extended data mode
    def edm : UInt8
      UInt8.new!((@value >> 10) & 0x3_u32)
    end

    # Extended data mode
    def self.edm : UInt8
      value.edm
    end

    # Extended data mode
    def self.edm=(value : UInt8) : UInt8
      self.set(edm: value)
      value
    end

    # Frame capture rate control
    def fcrc : UInt8
      UInt8.new!((@value >> 8) & 0x3_u32)
    end

    # Frame capture rate control
    def self.fcrc : UInt8
      value.fcrc
    end

    # Frame capture rate control
    def self.fcrc=(value : UInt8) : UInt8
      self.set(fcrc: value)
      value
    end

    # Vertical synchronization              polarity
    def vspol : Bool
      @value.bits_set?(0x80_u32)
    end

    # Vertical synchronization              polarity
    def self.vspol : Bool
      value.vspol
    end

    # Vertical synchronization              polarity
    def self.vspol=(value : Bool) : Bool
      self.set(vspol: value)
      value
    end

    # Horizontal synchronization              polarity
    def hspol : Bool
      @value.bits_set?(0x40_u32)
    end

    # Horizontal synchronization              polarity
    def self.hspol : Bool
      value.hspol
    end

    # Horizontal synchronization              polarity
    def self.hspol=(value : Bool) : Bool
      self.set(hspol: value)
      value
    end

    # Pixel clock polarity
    def pckpol : Bool
      @value.bits_set?(0x20_u32)
    end

    # Pixel clock polarity
    def self.pckpol : Bool
      value.pckpol
    end

    # Pixel clock polarity
    def self.pckpol=(value : Bool) : Bool
      self.set(pckpol: value)
      value
    end

    # Embedded synchronization              select
    def ess : Bool
      @value.bits_set?(0x10_u32)
    end

    # Embedded synchronization              select
    def self.ess : Bool
      value.ess
    end

    # Embedded synchronization              select
    def self.ess=(value : Bool) : Bool
      self.set(ess: value)
      value
    end

    # JPEG format
    def jpeg : Bool
      @value.bits_set?(0x8_u32)
    end

    # JPEG format
    def self.jpeg : Bool
      value.jpeg
    end

    # JPEG format
    def self.jpeg=(value : Bool) : Bool
      self.set(jpeg: value)
      value
    end

    # Crop feature
    def op : Bool
      @value.bits_set?(0x4_u32)
    end

    # Crop feature
    def self.op : Bool
      value.op
    end

    # Crop feature
    def self.op=(value : Bool) : Bool
      self.set(op: value)
      value
    end

    # Capture mode
    def cm : Bool
      @value.bits_set?(0x2_u32)
    end

    # Capture mode
    def self.cm : Bool
      value.cm
    end

    # Capture mode
    def self.cm=(value : Bool) : Bool
      self.set(cm: value)
      value
    end

    # Capture enable
    def capture : Bool
      @value.bits_set?(0x1_u32)
    end

    # Capture enable
    def self.capture : Bool
      value.capture
    end

    # Capture enable
    def self.capture=(value : Bool) : Bool
      self.set(capture: value)
      value
    end

    def copy_with(
      *,

      enable : Bool? = nil,

      edm : UInt8? = nil,

      fcrc : UInt8? = nil,

      vspol : Bool? = nil,

      hspol : Bool? = nil,

      pckpol : Bool? = nil,

      ess : Bool? = nil,

      jpeg : Bool? = nil,

      op : Bool? = nil,

      cm : Bool? = nil,

      capture : Bool? = nil
    ) : self
      value = @value

      unless enable.nil?
        value = (value & 0xffffbfff_u32) |
                UInt32.new!(enable.to_int).&(0x1_u32) << 14
      end

      unless edm.nil?
        value = (value & 0xfffff3ff_u32) |
                UInt32.new!(edm.to_int).&(0x3_u32) << 10
      end

      unless fcrc.nil?
        value = (value & 0xfffffcff_u32) |
                UInt32.new!(fcrc.to_int).&(0x3_u32) << 8
      end

      unless vspol.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(vspol.to_int).&(0x1_u32) << 7
      end

      unless hspol.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(hspol.to_int).&(0x1_u32) << 6
      end

      unless pckpol.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(pckpol.to_int).&(0x1_u32) << 5
      end

      unless ess.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(ess.to_int).&(0x1_u32) << 4
      end

      unless jpeg.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(jpeg.to_int).&(0x1_u32) << 3
      end

      unless op.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(op.to_int).&(0x1_u32) << 2
      end

      unless cm.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(cm.to_int).&(0x1_u32) << 1
      end

      unless capture.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(capture.to_int).&(0x1_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      enable : Bool? = nil,
      edm : UInt8? = nil,
      fcrc : UInt8? = nil,
      vspol : Bool? = nil,
      hspol : Bool? = nil,
      pckpol : Bool? = nil,
      ess : Bool? = nil,
      jpeg : Bool? = nil,
      op : Bool? = nil,
      cm : Bool? = nil,
      capture : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        enable: enable,
        edm: edm,
        fcrc: fcrc,
        vspol: vspol,
        hspol: hspol,
        pckpol: pckpol,
        ess: ess,
        jpeg: jpeg,
        op: op,
        cm: cm,
        capture: capture,
      )
    end
  end # struct

  # status register
  struct SR
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

    # FIFO not empty
    def fne : Bool
      @value.bits_set?(0x4_u32)
    end

    # FIFO not empty
    def self.fne : Bool
      value.fne
    end

    # VSYNC
    def vsync : Bool
      @value.bits_set?(0x2_u32)
    end

    # VSYNC
    def self.vsync : Bool
      value.vsync
    end

    # HSYNC
    def hsync : Bool
      @value.bits_set?(0x1_u32)
    end

    # HSYNC
    def self.hsync : Bool
      value.hsync
    end
  end # struct

  # raw interrupt status register
  struct RIS
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

    # Line raw interrupt status
    def line_ris : Bool
      @value.bits_set?(0x10_u32)
    end

    # Line raw interrupt status
    def self.line_ris : Bool
      value.line_ris
    end

    # VSYNC raw interrupt status
    def vsync_ris : Bool
      @value.bits_set?(0x8_u32)
    end

    # VSYNC raw interrupt status
    def self.vsync_ris : Bool
      value.vsync_ris
    end

    # Synchronization error raw interrupt              status
    def err_ris : Bool
      @value.bits_set?(0x4_u32)
    end

    # Synchronization error raw interrupt              status
    def self.err_ris : Bool
      value.err_ris
    end

    # Overrun raw interrupt              status
    def ovr_ris : Bool
      @value.bits_set?(0x2_u32)
    end

    # Overrun raw interrupt              status
    def self.ovr_ris : Bool
      value.ovr_ris
    end

    # Capture complete raw interrupt              status
    def frame_ris : Bool
      @value.bits_set?(0x1_u32)
    end

    # Capture complete raw interrupt              status
    def self.frame_ris : Bool
      value.frame_ris
    end
  end # struct

  # interrupt enable register
  struct IER
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

    # Line interrupt enable
    def line_ie : Bool
      @value.bits_set?(0x10_u32)
    end

    # Line interrupt enable
    def self.line_ie : Bool
      value.line_ie
    end

    # Line interrupt enable
    def self.line_ie=(value : Bool) : Bool
      self.set(line_ie: value)
      value
    end

    # VSYNC interrupt enable
    def vsync_ie : Bool
      @value.bits_set?(0x8_u32)
    end

    # VSYNC interrupt enable
    def self.vsync_ie : Bool
      value.vsync_ie
    end

    # VSYNC interrupt enable
    def self.vsync_ie=(value : Bool) : Bool
      self.set(vsync_ie: value)
      value
    end

    # Synchronization error interrupt              enable
    def err_ie : Bool
      @value.bits_set?(0x4_u32)
    end

    # Synchronization error interrupt              enable
    def self.err_ie : Bool
      value.err_ie
    end

    # Synchronization error interrupt              enable
    def self.err_ie=(value : Bool) : Bool
      self.set(err_ie: value)
      value
    end

    # Overrun interrupt enable
    def ovr_ie : Bool
      @value.bits_set?(0x2_u32)
    end

    # Overrun interrupt enable
    def self.ovr_ie : Bool
      value.ovr_ie
    end

    # Overrun interrupt enable
    def self.ovr_ie=(value : Bool) : Bool
      self.set(ovr_ie: value)
      value
    end

    # Capture complete interrupt              enable
    def frame_ie : Bool
      @value.bits_set?(0x1_u32)
    end

    # Capture complete interrupt              enable
    def self.frame_ie : Bool
      value.frame_ie
    end

    # Capture complete interrupt              enable
    def self.frame_ie=(value : Bool) : Bool
      self.set(frame_ie: value)
      value
    end

    def copy_with(
      *,

      line_ie : Bool? = nil,

      vsync_ie : Bool? = nil,

      err_ie : Bool? = nil,

      ovr_ie : Bool? = nil,

      frame_ie : Bool? = nil
    ) : self
      value = @value

      unless line_ie.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(line_ie.to_int).&(0x1_u32) << 4
      end

      unless vsync_ie.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(vsync_ie.to_int).&(0x1_u32) << 3
      end

      unless err_ie.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(err_ie.to_int).&(0x1_u32) << 2
      end

      unless ovr_ie.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(ovr_ie.to_int).&(0x1_u32) << 1
      end

      unless frame_ie.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(frame_ie.to_int).&(0x1_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      line_ie : Bool? = nil,
      vsync_ie : Bool? = nil,
      err_ie : Bool? = nil,
      ovr_ie : Bool? = nil,
      frame_ie : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        line_ie: line_ie,
        vsync_ie: vsync_ie,
        err_ie: err_ie,
        ovr_ie: ovr_ie,
        frame_ie: frame_ie,
      )
    end
  end # struct

  # masked interrupt status          register
  struct MIS
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

    # Line masked interrupt              status
    def line_mis : Bool
      @value.bits_set?(0x10_u32)
    end

    # Line masked interrupt              status
    def self.line_mis : Bool
      value.line_mis
    end

    # VSYNC masked interrupt              status
    def vsync_mis : Bool
      @value.bits_set?(0x8_u32)
    end

    # VSYNC masked interrupt              status
    def self.vsync_mis : Bool
      value.vsync_mis
    end

    # Synchronization error masked interrupt              status
    def err_mis : Bool
      @value.bits_set?(0x4_u32)
    end

    # Synchronization error masked interrupt              status
    def self.err_mis : Bool
      value.err_mis
    end

    # Overrun masked interrupt              status
    def ovr_mis : Bool
      @value.bits_set?(0x2_u32)
    end

    # Overrun masked interrupt              status
    def self.ovr_mis : Bool
      value.ovr_mis
    end

    # Capture complete masked interrupt              status
    def frame_mis : Bool
      @value.bits_set?(0x1_u32)
    end

    # Capture complete masked interrupt              status
    def self.frame_mis : Bool
      value.frame_mis
    end
  end # struct

  # interrupt clear register
  struct ICR
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

    # line interrupt status              clear
    def self.line_isc=(value : Bool) : Bool
      self.set(line_isc: value)
      value
    end

    # Vertical synch interrupt status              clear
    def self.vsync_isc=(value : Bool) : Bool
      self.set(vsync_isc: value)
      value
    end

    # Synchronization error interrupt status              clear
    def self.err_isc=(value : Bool) : Bool
      self.set(err_isc: value)
      value
    end

    # Overrun interrupt status              clear
    def self.ovr_isc=(value : Bool) : Bool
      self.set(ovr_isc: value)
      value
    end

    # Capture complete interrupt status              clear
    def self.frame_isc=(value : Bool) : Bool
      self.set(frame_isc: value)
      value
    end

    def copy_with(
      *,

      line_isc : Bool? = nil,

      vsync_isc : Bool? = nil,

      err_isc : Bool? = nil,

      ovr_isc : Bool? = nil,

      frame_isc : Bool? = nil
    ) : self
      value = @value

      unless line_isc.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(line_isc.to_int).&(0x1_u32) << 4
      end

      unless vsync_isc.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(vsync_isc.to_int).&(0x1_u32) << 3
      end

      unless err_isc.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(err_isc.to_int).&(0x1_u32) << 2
      end

      unless ovr_isc.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(ovr_isc.to_int).&(0x1_u32) << 1
      end

      unless frame_isc.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(frame_isc.to_int).&(0x1_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      line_isc : Bool? = nil,
      vsync_isc : Bool? = nil,
      err_isc : Bool? = nil,
      ovr_isc : Bool? = nil,
      frame_isc : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        line_isc: line_isc,
        vsync_isc: vsync_isc,
        err_isc: err_isc,
        ovr_isc: ovr_isc,
        frame_isc: frame_isc,
      )
    end
  end # struct

  # embedded synchronization code          register
  struct ESCR
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

    # Frame end delimiter code
    def fec : UInt8
      UInt8.new!((@value >> 24) & 0xff_u32)
    end

    # Frame end delimiter code
    def self.fec : UInt8
      value.fec
    end

    # Frame end delimiter code
    def self.fec=(value : UInt8) : UInt8
      self.set(fec: value)
      value
    end

    # Line end delimiter code
    def lec : UInt8
      UInt8.new!((@value >> 16) & 0xff_u32)
    end

    # Line end delimiter code
    def self.lec : UInt8
      value.lec
    end

    # Line end delimiter code
    def self.lec=(value : UInt8) : UInt8
      self.set(lec: value)
      value
    end

    # Line start delimiter code
    def lsc : UInt8
      UInt8.new!((@value >> 8) & 0xff_u32)
    end

    # Line start delimiter code
    def self.lsc : UInt8
      value.lsc
    end

    # Line start delimiter code
    def self.lsc=(value : UInt8) : UInt8
      self.set(lsc: value)
      value
    end

    # Frame start delimiter code
    def fsc : UInt8
      UInt8.new!((@value >> 0) & 0xff_u32)
    end

    # Frame start delimiter code
    def self.fsc : UInt8
      value.fsc
    end

    # Frame start delimiter code
    def self.fsc=(value : UInt8) : UInt8
      self.set(fsc: value)
      value
    end

    def copy_with(
      *,

      fec : UInt8? = nil,

      lec : UInt8? = nil,

      lsc : UInt8? = nil,

      fsc : UInt8? = nil
    ) : self
      value = @value

      unless fec.nil?
        value = (value & 0xffffff_u32) |
                UInt32.new!(fec.to_int).&(0xff_u32) << 24
      end

      unless lec.nil?
        value = (value & 0xff00ffff_u32) |
                UInt32.new!(lec.to_int).&(0xff_u32) << 16
      end

      unless lsc.nil?
        value = (value & 0xffff00ff_u32) |
                UInt32.new!(lsc.to_int).&(0xff_u32) << 8
      end

      unless fsc.nil?
        value = (value & 0xffffff00_u32) |
                UInt32.new!(fsc.to_int).&(0xff_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      fec : UInt8? = nil,
      lec : UInt8? = nil,
      lsc : UInt8? = nil,
      fsc : UInt8? = nil
    ) : Nil
      self.value = self.value.copy_with(
        fec: fec,
        lec: lec,
        lsc: lsc,
        fsc: fsc,
      )
    end
  end # struct

  # embedded synchronization unmask          register
  struct ESUR
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

    # Frame end delimiter unmask
    def feu : UInt8
      UInt8.new!((@value >> 24) & 0xff_u32)
    end

    # Frame end delimiter unmask
    def self.feu : UInt8
      value.feu
    end

    # Frame end delimiter unmask
    def self.feu=(value : UInt8) : UInt8
      self.set(feu: value)
      value
    end

    # Line end delimiter unmask
    def leu : UInt8
      UInt8.new!((@value >> 16) & 0xff_u32)
    end

    # Line end delimiter unmask
    def self.leu : UInt8
      value.leu
    end

    # Line end delimiter unmask
    def self.leu=(value : UInt8) : UInt8
      self.set(leu: value)
      value
    end

    # Line start delimiter              unmask
    def lsu : UInt8
      UInt8.new!((@value >> 8) & 0xff_u32)
    end

    # Line start delimiter              unmask
    def self.lsu : UInt8
      value.lsu
    end

    # Line start delimiter              unmask
    def self.lsu=(value : UInt8) : UInt8
      self.set(lsu: value)
      value
    end

    # Frame start delimiter              unmask
    def fsu : UInt8
      UInt8.new!((@value >> 0) & 0xff_u32)
    end

    # Frame start delimiter              unmask
    def self.fsu : UInt8
      value.fsu
    end

    # Frame start delimiter              unmask
    def self.fsu=(value : UInt8) : UInt8
      self.set(fsu: value)
      value
    end

    def copy_with(
      *,

      feu : UInt8? = nil,

      leu : UInt8? = nil,

      lsu : UInt8? = nil,

      fsu : UInt8? = nil
    ) : self
      value = @value

      unless feu.nil?
        value = (value & 0xffffff_u32) |
                UInt32.new!(feu.to_int).&(0xff_u32) << 24
      end

      unless leu.nil?
        value = (value & 0xff00ffff_u32) |
                UInt32.new!(leu.to_int).&(0xff_u32) << 16
      end

      unless lsu.nil?
        value = (value & 0xffff00ff_u32) |
                UInt32.new!(lsu.to_int).&(0xff_u32) << 8
      end

      unless fsu.nil?
        value = (value & 0xffffff00_u32) |
                UInt32.new!(fsu.to_int).&(0xff_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      feu : UInt8? = nil,
      leu : UInt8? = nil,
      lsu : UInt8? = nil,
      fsu : UInt8? = nil
    ) : Nil
      self.value = self.value.copy_with(
        feu: feu,
        leu: leu,
        lsu: lsu,
        fsu: fsu,
      )
    end
  end # struct

  # crop window start
  struct CWSTRT
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

    # Vertical start line count
    def vst : UInt16
      UInt16.new!((@value >> 16) & 0x1fff_u32)
    end

    # Vertical start line count
    def self.vst : UInt16
      value.vst
    end

    # Vertical start line count
    def self.vst=(value : UInt16) : UInt16
      self.set(vst: value)
      value
    end

    # Horizontal offset count
    def hoffcnt : UInt16
      UInt16.new!((@value >> 0) & 0x3fff_u32)
    end

    # Horizontal offset count
    def self.hoffcnt : UInt16
      value.hoffcnt
    end

    # Horizontal offset count
    def self.hoffcnt=(value : UInt16) : UInt16
      self.set(hoffcnt: value)
      value
    end

    def copy_with(
      *,

      vst : UInt16? = nil,

      hoffcnt : UInt16? = nil
    ) : self
      value = @value

      unless vst.nil?
        value = (value & 0xe000ffff_u32) |
                UInt32.new!(vst.to_int).&(0x1fff_u32) << 16
      end

      unless hoffcnt.nil?
        value = (value & 0xffffc000_u32) |
                UInt32.new!(hoffcnt.to_int).&(0x3fff_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      vst : UInt16? = nil,
      hoffcnt : UInt16? = nil
    ) : Nil
      self.value = self.value.copy_with(
        vst: vst,
        hoffcnt: hoffcnt,
      )
    end
  end # struct

  # crop window size
  struct CWSIZE
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

    # Vertical line count
    def vline : UInt16
      UInt16.new!((@value >> 16) & 0x3fff_u32)
    end

    # Vertical line count
    def self.vline : UInt16
      value.vline
    end

    # Vertical line count
    def self.vline=(value : UInt16) : UInt16
      self.set(vline: value)
      value
    end

    # Capture count
    def capcnt : UInt16
      UInt16.new!((@value >> 0) & 0x3fff_u32)
    end

    # Capture count
    def self.capcnt : UInt16
      value.capcnt
    end

    # Capture count
    def self.capcnt=(value : UInt16) : UInt16
      self.set(capcnt: value)
      value
    end

    def copy_with(
      *,

      vline : UInt16? = nil,

      capcnt : UInt16? = nil
    ) : self
      value = @value

      unless vline.nil?
        value = (value & 0xc000ffff_u32) |
                UInt32.new!(vline.to_int).&(0x3fff_u32) << 16
      end

      unless capcnt.nil?
        value = (value & 0xffffc000_u32) |
                UInt32.new!(capcnt.to_int).&(0x3fff_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      vline : UInt16? = nil,
      capcnt : UInt16? = nil
    ) : Nil
      self.value = self.value.copy_with(
        vline: vline,
        capcnt: capcnt,
      )
    end
  end # struct

  # data register
  struct DR
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

    # Data byte 3
    def byte3 : UInt8
      UInt8.new!((@value >> 24) & 0xff_u32)
    end

    # Data byte 3
    def self.byte3 : UInt8
      value.byte3
    end

    # Data byte 2
    def byte2 : UInt8
      UInt8.new!((@value >> 16) & 0xff_u32)
    end

    # Data byte 2
    def self.byte2 : UInt8
      value.byte2
    end

    # Data byte 1
    def byte1 : UInt8
      UInt8.new!((@value >> 8) & 0xff_u32)
    end

    # Data byte 1
    def self.byte1 : UInt8
      value.byte1
    end

    # Data byte 0
    def byte0 : UInt8
      UInt8.new!((@value >> 0) & 0xff_u32)
    end

    # Data byte 0
    def self.byte0 : UInt8
      value.byte0
    end
  end # struct

end
