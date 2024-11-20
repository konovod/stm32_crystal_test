# Operational Amplifier
module OPAMP
  VERSION      = nil
  BASE_ADDRESS = 0x40010000_u64

  # OPAMP2 control register
  struct N2_CSR
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

    enum N2EN : UInt8
      # OPAMP2 is disabled
      DISABLED = 0x0_u64

      # OPAMP2 is enabled
      ENABLED = 0x1_u64

      def self.reset_value : N2EN
        N2_CSR.reset_value._2_en
      end
    end

    # OPAMP2 enable
    def _2_en : N2EN
      N2EN.new!((@value >> 0) & 0x1_u32)
    end

    # OPAMP2 enable
    def self._2_en : N2EN
      value._2_en
    end

    # OPAMP2 enable
    def self._2_en=(value : N2EN) : N2EN
      self.set(_2_en: value)
      value
    end

    enum FORCE_VP : UInt8
      # Normal operating mode
      NORMAL = 0x0_u64

      # Calibration mode. Non-inverting input connected to calibration reference
      CALIBRATION = 0x1_u64

      def self.reset_value : FORCE_VP
        N2_CSR.reset_value.force_vp
      end
    end

    # FORCE_VP
    def force_vp : FORCE_VP
      FORCE_VP.new!((@value >> 1) & 0x1_u32)
    end

    # FORCE_VP
    def self.force_vp : FORCE_VP
      value.force_vp
    end

    # FORCE_VP
    def self.force_vp=(value : FORCE_VP) : FORCE_VP
      self.set(force_vp: value)
      value
    end

    enum VP_SEL : UInt8
      # PB14 used as OPAMP2 non-inverting input
      PB14 = 0x1_u64

      # PB0 used as OPAMP2 non-inverting input
      PB0 = 0x2_u64

      # PA7 used as OPAMP2 non-inverting input
      PA7 = 0x3_u64

      def self.reset_value : VP_SEL
        N2_CSR.reset_value.vp_sel
      end
    end

    # OPAMP Non inverting input selection
    def vp_sel : VP_SEL
      VP_SEL.new!((@value >> 2) & 0x3_u32)
    end

    # OPAMP Non inverting input selection
    def self.vp_sel : VP_SEL
      value.vp_sel
    end

    # OPAMP Non inverting input selection
    def self.vp_sel=(value : VP_SEL) : VP_SEL
      self.set(vp_sel: value)
      value
    end

    enum VM_SEL : UInt8
      # PC5 (VM0) used as OPAMP2 inverting input
      PC5 = 0x0_u64

      # PA5 (VM1) used as OPAMP2 inverting input
      PA5 = 0x1_u64

      # Resistor feedback output (PGA mode)
      PGA = 0x2_u64

      # Follower mode
      FOLLOWER = 0x3_u64

      def self.reset_value : VM_SEL
        N2_CSR.reset_value.vm_sel
      end
    end

    # OPAMP inverting input selection
    def vm_sel : VM_SEL
      VM_SEL.new!((@value >> 5) & 0x3_u32)
    end

    # OPAMP inverting input selection
    def self.vm_sel : VM_SEL
      value.vm_sel
    end

    # OPAMP inverting input selection
    def self.vm_sel=(value : VM_SEL) : VM_SEL
      self.set(vm_sel: value)
      value
    end

    enum TCM_EN : UInt8
      # Timer controlled mux disabled
      DISABLED = 0x0_u64

      # Timer controlled mux enabled
      ENABLED = 0x1_u64

      def self.reset_value : TCM_EN
        N2_CSR.reset_value.tcm_en
      end
    end

    # Timer controlled Mux mode enable
    def tcm_en : TCM_EN
      TCM_EN.new!((@value >> 7) & 0x1_u32)
    end

    # Timer controlled Mux mode enable
    def self.tcm_en : TCM_EN
      value.tcm_en
    end

    # Timer controlled Mux mode enable
    def self.tcm_en=(value : TCM_EN) : TCM_EN
      self.set(tcm_en: value)
      value
    end

    enum VMS_SEL : UInt8
      # PC5 (VM0) used as OPAMP2 inverting input when TCM_EN=1
      PC5 = 0x0_u64

      # PA5 (VM1) used as OPAMP2 inverting input when TCM_EN=1
      PA5 = 0x1_u64

      def self.reset_value : VMS_SEL
        N2_CSR.reset_value.vms_sel
      end
    end

    # OPAMP inverting input secondary selection
    def vms_sel : VMS_SEL
      VMS_SEL.new!((@value >> 8) & 0x1_u32)
    end

    # OPAMP inverting input secondary selection
    def self.vms_sel : VMS_SEL
      value.vms_sel
    end

    # OPAMP inverting input secondary selection
    def self.vms_sel=(value : VMS_SEL) : VMS_SEL
      self.set(vms_sel: value)
      value
    end

    enum VPS_SEL : UInt8
      # PB14 used as OPAMP2 non-inverting input when TCM_EN=1
      PB14 = 0x1_u64

      # PB0 used as OPAMP2 non-inverting input when TCM_EN=1
      PB0 = 0x2_u64

      # PA7 used as OPAMP2 non-inverting input when TCM_EN=1
      PA7 = 0x3_u64

      def self.reset_value : VPS_SEL
        N2_CSR.reset_value.vps_sel
      end
    end

    # OPAMP Non inverting input secondary selection
    def vps_sel : VPS_SEL
      VPS_SEL.new!((@value >> 9) & 0x3_u32)
    end

    # OPAMP Non inverting input secondary selection
    def self.vps_sel : VPS_SEL
      value.vps_sel
    end

    # OPAMP Non inverting input secondary selection
    def self.vps_sel=(value : VPS_SEL) : VPS_SEL
      self.set(vps_sel: value)
      value
    end

    enum CALON : UInt8
      # Calibration mode disabled
      DISABLED = 0x0_u64

      # Calibration mode enabled
      ENABLED = 0x1_u64

      def self.reset_value : CALON
        N2_CSR.reset_value.calon
      end
    end

    # Calibration mode enable
    def calon : CALON
      CALON.new!((@value >> 11) & 0x1_u32)
    end

    # Calibration mode enable
    def self.calon : CALON
      value.calon
    end

    # Calibration mode enable
    def self.calon=(value : CALON) : CALON
      self.set(calon: value)
      value
    end

    enum CALSEL : UInt8
      # VREFOPAMP=3.3% VDDA
      PERCENT3_3 = 0x0_u64

      # VREFOPAMP=10% VDDA
      PERCENT10 = 0x1_u64

      # VREFOPAMP=50% VDDA
      PERCENT50 = 0x2_u64

      # VREFOPAMP=90% VDDA
      PERCENT90 = 0x3_u64

      def self.reset_value : CALSEL
        N2_CSR.reset_value.calsel
      end
    end

    # Calibration selection
    def calsel : CALSEL
      CALSEL.new!((@value >> 12) & 0x3_u32)
    end

    # Calibration selection
    def self.calsel : CALSEL
      value.calsel
    end

    # Calibration selection
    def self.calsel=(value : CALSEL) : CALSEL
      self.set(calsel: value)
      value
    end

    enum PGA_GAIN : UInt8
      # Gain 2
      GAIN2 = 0x0_u64

      # Gain 4
      GAIN4 = 0x1_u64

      # Gain 8
      GAIN8 = 0x2_u64

      # Gain 16
      GAIN16 = 0x4_u64

      # Gain 2, feedback connected to VM0
      GAIN2_VM0 = 0x8_u64

      # Gain 4, feedback connected to VM0
      GAIN4_VM0 = 0x9_u64

      # Gain 8, feedback connected to VM0
      GAIN8_VM0 = 0xa_u64

      # Gain 16, feedback connected to VM0
      GAIN16_VM0 = 0xb_u64

      # Gain 2, feedback connected to VM1
      GAIN2_VM1 = 0xc_u64

      # Gain 4, feedback connected to VM1
      GAIN4_VM1 = 0xd_u64

      # Gain 8, feedback connected to VM1
      GAIN8_VM1 = 0xe_u64

      # Gain 16, feedback connected to VM1
      GAIN16_VM1 = 0xf_u64

      def self.reset_value : PGA_GAIN
        N2_CSR.reset_value.pga_gain
      end
    end

    # Gain in PGA mode
    def pga_gain : PGA_GAIN
      PGA_GAIN.new!((@value >> 14) & 0xf_u32)
    end

    # Gain in PGA mode
    def self.pga_gain : PGA_GAIN
      value.pga_gain
    end

    # Gain in PGA mode
    def self.pga_gain=(value : PGA_GAIN) : PGA_GAIN
      self.set(pga_gain: value)
      value
    end

    enum USER_TRIM : UInt8
      # User trimming disabled
      DISABLED = 0x0_u64

      # User trimming enabled
      ENABLED = 0x1_u64

      def self.reset_value : USER_TRIM
        N2_CSR.reset_value.user_trim
      end
    end

    # User trimming enable
    def user_trim : USER_TRIM
      USER_TRIM.new!((@value >> 18) & 0x1_u32)
    end

    # User trimming enable
    def self.user_trim : USER_TRIM
      value.user_trim
    end

    # User trimming enable
    def self.user_trim=(value : USER_TRIM) : USER_TRIM
      self.set(user_trim: value)
      value
    end

    # Offset trimming value (PMOS)
    def trimoffsetp : UInt8
      UInt8.new!((@value >> 19) & 0x1f_u32)
    end

    # Offset trimming value (PMOS)
    def self.trimoffsetp : UInt8
      value.trimoffsetp
    end

    # Offset trimming value (PMOS)
    def self.trimoffsetp=(value : UInt8) : UInt8
      self.set(trimoffsetp: value)
      value
    end

    # Offset trimming value (NMOS)
    def trimoffsetn : UInt8
      UInt8.new!((@value >> 24) & 0x1f_u32)
    end

    # Offset trimming value (NMOS)
    def self.trimoffsetn : UInt8
      value.trimoffsetn
    end

    # Offset trimming value (NMOS)
    def self.trimoffsetn=(value : UInt8) : UInt8
      self.set(trimoffsetn: value)
      value
    end

    enum TSTREF : UInt8
      # VREFOPAMP2 is output
      OUTPUT = 0x0_u64

      # VREFOPAMP2 is not output
      NOTOUTPUT = 0x1_u64

      def self.reset_value : TSTREF
        N2_CSR.reset_value.tstref
      end
    end

    # TSTREF
    def tstref : TSTREF
      TSTREF.new!((@value >> 29) & 0x1_u32)
    end

    # TSTREF
    def self.tstref : TSTREF
      value.tstref
    end

    # TSTREF
    def self.tstref=(value : TSTREF) : TSTREF
      self.set(tstref: value)
      value
    end

    enum OUTCAL : UInt8
      # Non-inverting < inverting
      LOW = 0x0_u64

      # Non-inverting > inverting
      HIGH = 0x1_u64

      def self.reset_value : OUTCAL
        N2_CSR.reset_value.outcal
      end
    end

    # OPAMP ouput status flag
    def outcal : OUTCAL
      OUTCAL.new!((@value >> 30) & 0x1_u32)
    end

    # OPAMP ouput status flag
    def self.outcal : OUTCAL
      value.outcal
    end

    enum LOCK : UInt8
      # Comparator CSR bits are read-write
      UNLOCKED = 0x0_u64

      # Comparator CSR bits are read-only
      LOCKED = 0x1_u64

      def self.reset_value : LOCK
        N2_CSR.reset_value.lock
      end
    end

    # OPAMP lock
    def lock : LOCK
      LOCK.new!((@value >> 31) & 0x1_u32)
    end

    # OPAMP lock
    def self.lock : LOCK
      value.lock
    end

    # OPAMP lock
    def self.lock=(value : LOCK) : LOCK
      self.set(lock: value)
      value
    end

    def copy_with(
      *,

      _2_en : N2EN? = nil,

      force_vp : FORCE_VP? = nil,

      vp_sel : VP_SEL? = nil,

      vm_sel : VM_SEL? = nil,

      tcm_en : TCM_EN? = nil,

      vms_sel : VMS_SEL? = nil,

      vps_sel : VPS_SEL? = nil,

      calon : CALON? = nil,

      calsel : CALSEL? = nil,

      pga_gain : PGA_GAIN? = nil,

      user_trim : USER_TRIM? = nil,

      trimoffsetp : UInt8? = nil,

      trimoffsetn : UInt8? = nil,

      tstref : TSTREF? = nil,

      lock : LOCK? = nil
    ) : self
      value = @value

      unless _2_en.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(_2_en.to_int).&(0x1_u32) << 0
      end

      unless force_vp.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(force_vp.to_int).&(0x1_u32) << 1
      end

      unless vp_sel.nil?
        value = (value & 0xfffffff3_u32) |
                UInt32.new!(vp_sel.to_int).&(0x3_u32) << 2
      end

      unless vm_sel.nil?
        value = (value & 0xffffff9f_u32) |
                UInt32.new!(vm_sel.to_int).&(0x3_u32) << 5
      end

      unless tcm_en.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(tcm_en.to_int).&(0x1_u32) << 7
      end

      unless vms_sel.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(vms_sel.to_int).&(0x1_u32) << 8
      end

      unless vps_sel.nil?
        value = (value & 0xfffff9ff_u32) |
                UInt32.new!(vps_sel.to_int).&(0x3_u32) << 9
      end

      unless calon.nil?
        value = (value & 0xfffff7ff_u32) |
                UInt32.new!(calon.to_int).&(0x1_u32) << 11
      end

      unless calsel.nil?
        value = (value & 0xffffcfff_u32) |
                UInt32.new!(calsel.to_int).&(0x3_u32) << 12
      end

      unless pga_gain.nil?
        value = (value & 0xfffc3fff_u32) |
                UInt32.new!(pga_gain.to_int).&(0xf_u32) << 14
      end

      unless user_trim.nil?
        value = (value & 0xfffbffff_u32) |
                UInt32.new!(user_trim.to_int).&(0x1_u32) << 18
      end

      unless trimoffsetp.nil?
        value = (value & 0xff07ffff_u32) |
                UInt32.new!(trimoffsetp.to_int).&(0x1f_u32) << 19
      end

      unless trimoffsetn.nil?
        value = (value & 0xe0ffffff_u32) |
                UInt32.new!(trimoffsetn.to_int).&(0x1f_u32) << 24
      end

      unless tstref.nil?
        value = (value & 0xdfffffff_u32) |
                UInt32.new!(tstref.to_int).&(0x1_u32) << 29
      end

      unless lock.nil?
        value = (value & 0x7fffffff_u32) |
                UInt32.new!(lock.to_int).&(0x1_u32) << 31
      end

      self.class.new(value)
    end

    def self.set(
      *,
      _2_en : N2EN? = nil,
      force_vp : FORCE_VP? = nil,
      vp_sel : VP_SEL? = nil,
      vm_sel : VM_SEL? = nil,
      tcm_en : TCM_EN? = nil,
      vms_sel : VMS_SEL? = nil,
      vps_sel : VPS_SEL? = nil,
      calon : CALON? = nil,
      calsel : CALSEL? = nil,
      pga_gain : PGA_GAIN? = nil,
      user_trim : USER_TRIM? = nil,
      trimoffsetp : UInt8? = nil,
      trimoffsetn : UInt8? = nil,
      tstref : TSTREF? = nil,
      lock : LOCK? = nil
    ) : Nil
      self.value = self.value.copy_with(
        _2_en: _2_en,
        force_vp: force_vp,
        vp_sel: vp_sel,
        vm_sel: vm_sel,
        tcm_en: tcm_en,
        vms_sel: vms_sel,
        vps_sel: vps_sel,
        calon: calon,
        calsel: calsel,
        pga_gain: pga_gain,
        user_trim: user_trim,
        trimoffsetp: trimoffsetp,
        trimoffsetn: trimoffsetn,
        tstref: tstref,
        lock: lock,
      )
    end
  end # struct

  # OPAMP3 control register
  struct N3_CSR
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

    # OPAMP3 enable
    def _3_en : Bool
      @value.bits_set?(0x1_u32)
    end

    # OPAMP3 enable
    def self._3_en : Bool
      value._3_en
    end

    # OPAMP3 enable
    def self._3_en=(value : Bool) : Bool
      self.set(_3_en: value)
      value
    end

    # FORCE_VP
    def force_vp : Bool
      @value.bits_set?(0x2_u32)
    end

    # FORCE_VP
    def self.force_vp : Bool
      value.force_vp
    end

    # FORCE_VP
    def self.force_vp=(value : Bool) : Bool
      self.set(force_vp: value)
      value
    end

    # OPAMP Non inverting input selection
    def vp_sel : UInt8
      UInt8.new!((@value >> 2) & 0x3_u32)
    end

    # OPAMP Non inverting input selection
    def self.vp_sel : UInt8
      value.vp_sel
    end

    # OPAMP Non inverting input selection
    def self.vp_sel=(value : UInt8) : UInt8
      self.set(vp_sel: value)
      value
    end

    # OPAMP inverting input selection
    def vm_sel : UInt8
      UInt8.new!((@value >> 5) & 0x3_u32)
    end

    # OPAMP inverting input selection
    def self.vm_sel : UInt8
      value.vm_sel
    end

    # OPAMP inverting input selection
    def self.vm_sel=(value : UInt8) : UInt8
      self.set(vm_sel: value)
      value
    end

    # Timer controlled Mux mode enable
    def tcm_en : Bool
      @value.bits_set?(0x80_u32)
    end

    # Timer controlled Mux mode enable
    def self.tcm_en : Bool
      value.tcm_en
    end

    # Timer controlled Mux mode enable
    def self.tcm_en=(value : Bool) : Bool
      self.set(tcm_en: value)
      value
    end

    # OPAMP inverting input secondary selection
    def vms_sel : Bool
      @value.bits_set?(0x100_u32)
    end

    # OPAMP inverting input secondary selection
    def self.vms_sel : Bool
      value.vms_sel
    end

    # OPAMP inverting input secondary selection
    def self.vms_sel=(value : Bool) : Bool
      self.set(vms_sel: value)
      value
    end

    # OPAMP Non inverting input secondary selection
    def vps_sel : UInt8
      UInt8.new!((@value >> 9) & 0x3_u32)
    end

    # OPAMP Non inverting input secondary selection
    def self.vps_sel : UInt8
      value.vps_sel
    end

    # OPAMP Non inverting input secondary selection
    def self.vps_sel=(value : UInt8) : UInt8
      self.set(vps_sel: value)
      value
    end

    # Calibration mode enable
    def calon : Bool
      @value.bits_set?(0x800_u32)
    end

    # Calibration mode enable
    def self.calon : Bool
      value.calon
    end

    # Calibration mode enable
    def self.calon=(value : Bool) : Bool
      self.set(calon: value)
      value
    end

    # Calibration selection
    def calsel : UInt8
      UInt8.new!((@value >> 12) & 0x3_u32)
    end

    # Calibration selection
    def self.calsel : UInt8
      value.calsel
    end

    # Calibration selection
    def self.calsel=(value : UInt8) : UInt8
      self.set(calsel: value)
      value
    end

    # Gain in PGA mode
    def pga_gain : UInt8
      UInt8.new!((@value >> 14) & 0xf_u32)
    end

    # Gain in PGA mode
    def self.pga_gain : UInt8
      value.pga_gain
    end

    # Gain in PGA mode
    def self.pga_gain=(value : UInt8) : UInt8
      self.set(pga_gain: value)
      value
    end

    # User trimming enable
    def user_trim : Bool
      @value.bits_set?(0x40000_u32)
    end

    # User trimming enable
    def self.user_trim : Bool
      value.user_trim
    end

    # User trimming enable
    def self.user_trim=(value : Bool) : Bool
      self.set(user_trim: value)
      value
    end

    # Offset trimming value (PMOS)
    def trimoffsetp : UInt8
      UInt8.new!((@value >> 19) & 0x1f_u32)
    end

    # Offset trimming value (PMOS)
    def self.trimoffsetp : UInt8
      value.trimoffsetp
    end

    # Offset trimming value (PMOS)
    def self.trimoffsetp=(value : UInt8) : UInt8
      self.set(trimoffsetp: value)
      value
    end

    # Offset trimming value (NMOS)
    def trimoffsetn : UInt8
      UInt8.new!((@value >> 24) & 0x1f_u32)
    end

    # Offset trimming value (NMOS)
    def self.trimoffsetn : UInt8
      value.trimoffsetn
    end

    # Offset trimming value (NMOS)
    def self.trimoffsetn=(value : UInt8) : UInt8
      self.set(trimoffsetn: value)
      value
    end

    # TSTREF
    def tstref : Bool
      @value.bits_set?(0x20000000_u32)
    end

    # TSTREF
    def self.tstref : Bool
      value.tstref
    end

    # TSTREF
    def self.tstref=(value : Bool) : Bool
      self.set(tstref: value)
      value
    end

    # OPAMP ouput status flag
    def outcal : Bool
      @value.bits_set?(0x40000000_u32)
    end

    # OPAMP ouput status flag
    def self.outcal : Bool
      value.outcal
    end

    # OPAMP lock
    def lock : Bool
      @value.bits_set?(0x80000000_u32)
    end

    # OPAMP lock
    def self.lock : Bool
      value.lock
    end

    # OPAMP lock
    def self.lock=(value : Bool) : Bool
      self.set(lock: value)
      value
    end

    def copy_with(
      *,

      _3_en : Bool? = nil,

      force_vp : Bool? = nil,

      vp_sel : UInt8? = nil,

      vm_sel : UInt8? = nil,

      tcm_en : Bool? = nil,

      vms_sel : Bool? = nil,

      vps_sel : UInt8? = nil,

      calon : Bool? = nil,

      calsel : UInt8? = nil,

      pga_gain : UInt8? = nil,

      user_trim : Bool? = nil,

      trimoffsetp : UInt8? = nil,

      trimoffsetn : UInt8? = nil,

      tstref : Bool? = nil,

      lock : Bool? = nil
    ) : self
      value = @value

      unless _3_en.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(_3_en.to_int).&(0x1_u32) << 0
      end

      unless force_vp.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(force_vp.to_int).&(0x1_u32) << 1
      end

      unless vp_sel.nil?
        value = (value & 0xfffffff3_u32) |
                UInt32.new!(vp_sel.to_int).&(0x3_u32) << 2
      end

      unless vm_sel.nil?
        value = (value & 0xffffff9f_u32) |
                UInt32.new!(vm_sel.to_int).&(0x3_u32) << 5
      end

      unless tcm_en.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(tcm_en.to_int).&(0x1_u32) << 7
      end

      unless vms_sel.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(vms_sel.to_int).&(0x1_u32) << 8
      end

      unless vps_sel.nil?
        value = (value & 0xfffff9ff_u32) |
                UInt32.new!(vps_sel.to_int).&(0x3_u32) << 9
      end

      unless calon.nil?
        value = (value & 0xfffff7ff_u32) |
                UInt32.new!(calon.to_int).&(0x1_u32) << 11
      end

      unless calsel.nil?
        value = (value & 0xffffcfff_u32) |
                UInt32.new!(calsel.to_int).&(0x3_u32) << 12
      end

      unless pga_gain.nil?
        value = (value & 0xfffc3fff_u32) |
                UInt32.new!(pga_gain.to_int).&(0xf_u32) << 14
      end

      unless user_trim.nil?
        value = (value & 0xfffbffff_u32) |
                UInt32.new!(user_trim.to_int).&(0x1_u32) << 18
      end

      unless trimoffsetp.nil?
        value = (value & 0xff07ffff_u32) |
                UInt32.new!(trimoffsetp.to_int).&(0x1f_u32) << 19
      end

      unless trimoffsetn.nil?
        value = (value & 0xe0ffffff_u32) |
                UInt32.new!(trimoffsetn.to_int).&(0x1f_u32) << 24
      end

      unless tstref.nil?
        value = (value & 0xdfffffff_u32) |
                UInt32.new!(tstref.to_int).&(0x1_u32) << 29
      end

      unless lock.nil?
        value = (value & 0x7fffffff_u32) |
                UInt32.new!(lock.to_int).&(0x1_u32) << 31
      end

      self.class.new(value)
    end

    def self.set(
      *,
      _3_en : Bool? = nil,
      force_vp : Bool? = nil,
      vp_sel : UInt8? = nil,
      vm_sel : UInt8? = nil,
      tcm_en : Bool? = nil,
      vms_sel : Bool? = nil,
      vps_sel : UInt8? = nil,
      calon : Bool? = nil,
      calsel : UInt8? = nil,
      pga_gain : UInt8? = nil,
      user_trim : Bool? = nil,
      trimoffsetp : UInt8? = nil,
      trimoffsetn : UInt8? = nil,
      tstref : Bool? = nil,
      lock : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        _3_en: _3_en,
        force_vp: force_vp,
        vp_sel: vp_sel,
        vm_sel: vm_sel,
        tcm_en: tcm_en,
        vms_sel: vms_sel,
        vps_sel: vps_sel,
        calon: calon,
        calsel: calsel,
        pga_gain: pga_gain,
        user_trim: user_trim,
        trimoffsetp: trimoffsetp,
        trimoffsetn: trimoffsetn,
        tstref: tstref,
        lock: lock,
      )
    end
  end # struct

  # OPAMP4 control register
  struct N4_CSR
    ADDRESS = BASE_ADDRESS + 0x44_u64

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

    # OPAMP4 enable
    def _4_en : Bool
      @value.bits_set?(0x1_u32)
    end

    # OPAMP4 enable
    def self._4_en : Bool
      value._4_en
    end

    # OPAMP4 enable
    def self._4_en=(value : Bool) : Bool
      self.set(_4_en: value)
      value
    end

    # FORCE_VP
    def force_vp : Bool
      @value.bits_set?(0x2_u32)
    end

    # FORCE_VP
    def self.force_vp : Bool
      value.force_vp
    end

    # FORCE_VP
    def self.force_vp=(value : Bool) : Bool
      self.set(force_vp: value)
      value
    end

    # OPAMP Non inverting input selection
    def vp_sel : UInt8
      UInt8.new!((@value >> 2) & 0x3_u32)
    end

    # OPAMP Non inverting input selection
    def self.vp_sel : UInt8
      value.vp_sel
    end

    # OPAMP Non inverting input selection
    def self.vp_sel=(value : UInt8) : UInt8
      self.set(vp_sel: value)
      value
    end

    # OPAMP inverting input selection
    def vm_sel : UInt8
      UInt8.new!((@value >> 5) & 0x3_u32)
    end

    # OPAMP inverting input selection
    def self.vm_sel : UInt8
      value.vm_sel
    end

    # OPAMP inverting input selection
    def self.vm_sel=(value : UInt8) : UInt8
      self.set(vm_sel: value)
      value
    end

    # Timer controlled Mux mode enable
    def tcm_en : Bool
      @value.bits_set?(0x80_u32)
    end

    # Timer controlled Mux mode enable
    def self.tcm_en : Bool
      value.tcm_en
    end

    # Timer controlled Mux mode enable
    def self.tcm_en=(value : Bool) : Bool
      self.set(tcm_en: value)
      value
    end

    # OPAMP inverting input secondary selection
    def vms_sel : Bool
      @value.bits_set?(0x100_u32)
    end

    # OPAMP inverting input secondary selection
    def self.vms_sel : Bool
      value.vms_sel
    end

    # OPAMP inverting input secondary selection
    def self.vms_sel=(value : Bool) : Bool
      self.set(vms_sel: value)
      value
    end

    # OPAMP Non inverting input secondary selection
    def vps_sel : UInt8
      UInt8.new!((@value >> 9) & 0x3_u32)
    end

    # OPAMP Non inverting input secondary selection
    def self.vps_sel : UInt8
      value.vps_sel
    end

    # OPAMP Non inverting input secondary selection
    def self.vps_sel=(value : UInt8) : UInt8
      self.set(vps_sel: value)
      value
    end

    # Calibration mode enable
    def calon : Bool
      @value.bits_set?(0x800_u32)
    end

    # Calibration mode enable
    def self.calon : Bool
      value.calon
    end

    # Calibration mode enable
    def self.calon=(value : Bool) : Bool
      self.set(calon: value)
      value
    end

    # Calibration selection
    def calsel : UInt8
      UInt8.new!((@value >> 12) & 0x3_u32)
    end

    # Calibration selection
    def self.calsel : UInt8
      value.calsel
    end

    # Calibration selection
    def self.calsel=(value : UInt8) : UInt8
      self.set(calsel: value)
      value
    end

    # Gain in PGA mode
    def pga_gain : UInt8
      UInt8.new!((@value >> 14) & 0xf_u32)
    end

    # Gain in PGA mode
    def self.pga_gain : UInt8
      value.pga_gain
    end

    # Gain in PGA mode
    def self.pga_gain=(value : UInt8) : UInt8
      self.set(pga_gain: value)
      value
    end

    # User trimming enable
    def user_trim : Bool
      @value.bits_set?(0x40000_u32)
    end

    # User trimming enable
    def self.user_trim : Bool
      value.user_trim
    end

    # User trimming enable
    def self.user_trim=(value : Bool) : Bool
      self.set(user_trim: value)
      value
    end

    # Offset trimming value (PMOS)
    def trimoffsetp : UInt8
      UInt8.new!((@value >> 19) & 0x1f_u32)
    end

    # Offset trimming value (PMOS)
    def self.trimoffsetp : UInt8
      value.trimoffsetp
    end

    # Offset trimming value (PMOS)
    def self.trimoffsetp=(value : UInt8) : UInt8
      self.set(trimoffsetp: value)
      value
    end

    # Offset trimming value (NMOS)
    def trimoffsetn : UInt8
      UInt8.new!((@value >> 24) & 0x1f_u32)
    end

    # Offset trimming value (NMOS)
    def self.trimoffsetn : UInt8
      value.trimoffsetn
    end

    # Offset trimming value (NMOS)
    def self.trimoffsetn=(value : UInt8) : UInt8
      self.set(trimoffsetn: value)
      value
    end

    # TSTREF
    def tstref : Bool
      @value.bits_set?(0x20000000_u32)
    end

    # TSTREF
    def self.tstref : Bool
      value.tstref
    end

    # TSTREF
    def self.tstref=(value : Bool) : Bool
      self.set(tstref: value)
      value
    end

    # OPAMP ouput status flag
    def outcal : Bool
      @value.bits_set?(0x40000000_u32)
    end

    # OPAMP ouput status flag
    def self.outcal : Bool
      value.outcal
    end

    # OPAMP lock
    def lock : Bool
      @value.bits_set?(0x80000000_u32)
    end

    # OPAMP lock
    def self.lock : Bool
      value.lock
    end

    # OPAMP lock
    def self.lock=(value : Bool) : Bool
      self.set(lock: value)
      value
    end

    def copy_with(
      *,

      _4_en : Bool? = nil,

      force_vp : Bool? = nil,

      vp_sel : UInt8? = nil,

      vm_sel : UInt8? = nil,

      tcm_en : Bool? = nil,

      vms_sel : Bool? = nil,

      vps_sel : UInt8? = nil,

      calon : Bool? = nil,

      calsel : UInt8? = nil,

      pga_gain : UInt8? = nil,

      user_trim : Bool? = nil,

      trimoffsetp : UInt8? = nil,

      trimoffsetn : UInt8? = nil,

      tstref : Bool? = nil,

      lock : Bool? = nil
    ) : self
      value = @value

      unless _4_en.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(_4_en.to_int).&(0x1_u32) << 0
      end

      unless force_vp.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(force_vp.to_int).&(0x1_u32) << 1
      end

      unless vp_sel.nil?
        value = (value & 0xfffffff3_u32) |
                UInt32.new!(vp_sel.to_int).&(0x3_u32) << 2
      end

      unless vm_sel.nil?
        value = (value & 0xffffff9f_u32) |
                UInt32.new!(vm_sel.to_int).&(0x3_u32) << 5
      end

      unless tcm_en.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(tcm_en.to_int).&(0x1_u32) << 7
      end

      unless vms_sel.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(vms_sel.to_int).&(0x1_u32) << 8
      end

      unless vps_sel.nil?
        value = (value & 0xfffff9ff_u32) |
                UInt32.new!(vps_sel.to_int).&(0x3_u32) << 9
      end

      unless calon.nil?
        value = (value & 0xfffff7ff_u32) |
                UInt32.new!(calon.to_int).&(0x1_u32) << 11
      end

      unless calsel.nil?
        value = (value & 0xffffcfff_u32) |
                UInt32.new!(calsel.to_int).&(0x3_u32) << 12
      end

      unless pga_gain.nil?
        value = (value & 0xfffc3fff_u32) |
                UInt32.new!(pga_gain.to_int).&(0xf_u32) << 14
      end

      unless user_trim.nil?
        value = (value & 0xfffbffff_u32) |
                UInt32.new!(user_trim.to_int).&(0x1_u32) << 18
      end

      unless trimoffsetp.nil?
        value = (value & 0xff07ffff_u32) |
                UInt32.new!(trimoffsetp.to_int).&(0x1f_u32) << 19
      end

      unless trimoffsetn.nil?
        value = (value & 0xe0ffffff_u32) |
                UInt32.new!(trimoffsetn.to_int).&(0x1f_u32) << 24
      end

      unless tstref.nil?
        value = (value & 0xdfffffff_u32) |
                UInt32.new!(tstref.to_int).&(0x1_u32) << 29
      end

      unless lock.nil?
        value = (value & 0x7fffffff_u32) |
                UInt32.new!(lock.to_int).&(0x1_u32) << 31
      end

      self.class.new(value)
    end

    def self.set(
      *,
      _4_en : Bool? = nil,
      force_vp : Bool? = nil,
      vp_sel : UInt8? = nil,
      vm_sel : UInt8? = nil,
      tcm_en : Bool? = nil,
      vms_sel : Bool? = nil,
      vps_sel : UInt8? = nil,
      calon : Bool? = nil,
      calsel : UInt8? = nil,
      pga_gain : UInt8? = nil,
      user_trim : Bool? = nil,
      trimoffsetp : UInt8? = nil,
      trimoffsetn : UInt8? = nil,
      tstref : Bool? = nil,
      lock : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        _4_en: _4_en,
        force_vp: force_vp,
        vp_sel: vp_sel,
        vm_sel: vm_sel,
        tcm_en: tcm_en,
        vms_sel: vms_sel,
        vps_sel: vps_sel,
        calon: calon,
        calsel: calsel,
        pga_gain: pga_gain,
        user_trim: user_trim,
        trimoffsetp: trimoffsetp,
        trimoffsetn: trimoffsetn,
        tstref: tstref,
        lock: lock,
      )
    end
  end # struct

  # OPAMP1 control register
  struct N1_CSR
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

    # OPAMP1 enable
    def _1_en : Bool
      @value.bits_set?(0x1_u32)
    end

    # OPAMP1 enable
    def self._1_en : Bool
      value._1_en
    end

    # OPAMP1 enable
    def self._1_en=(value : Bool) : Bool
      self.set(_1_en: value)
      value
    end

    # FORCE_VP
    def force_vp : Bool
      @value.bits_set?(0x2_u32)
    end

    # FORCE_VP
    def self.force_vp : Bool
      value.force_vp
    end

    # FORCE_VP
    def self.force_vp=(value : Bool) : Bool
      self.set(force_vp: value)
      value
    end

    # OPAMP Non inverting input selection
    def vp_sel : UInt8
      UInt8.new!((@value >> 2) & 0x3_u32)
    end

    # OPAMP Non inverting input selection
    def self.vp_sel : UInt8
      value.vp_sel
    end

    # OPAMP Non inverting input selection
    def self.vp_sel=(value : UInt8) : UInt8
      self.set(vp_sel: value)
      value
    end

    # OPAMP inverting input selection
    def vm_sel : UInt8
      UInt8.new!((@value >> 5) & 0x3_u32)
    end

    # OPAMP inverting input selection
    def self.vm_sel : UInt8
      value.vm_sel
    end

    # OPAMP inverting input selection
    def self.vm_sel=(value : UInt8) : UInt8
      self.set(vm_sel: value)
      value
    end

    # Timer controlled Mux mode enable
    def tcm_en : Bool
      @value.bits_set?(0x80_u32)
    end

    # Timer controlled Mux mode enable
    def self.tcm_en : Bool
      value.tcm_en
    end

    # Timer controlled Mux mode enable
    def self.tcm_en=(value : Bool) : Bool
      self.set(tcm_en: value)
      value
    end

    # OPAMP inverting input secondary selection
    def vms_sel : Bool
      @value.bits_set?(0x100_u32)
    end

    # OPAMP inverting input secondary selection
    def self.vms_sel : Bool
      value.vms_sel
    end

    # OPAMP inverting input secondary selection
    def self.vms_sel=(value : Bool) : Bool
      self.set(vms_sel: value)
      value
    end

    # OPAMP Non inverting input secondary selection
    def vps_sel : UInt8
      UInt8.new!((@value >> 9) & 0x3_u32)
    end

    # OPAMP Non inverting input secondary selection
    def self.vps_sel : UInt8
      value.vps_sel
    end

    # OPAMP Non inverting input secondary selection
    def self.vps_sel=(value : UInt8) : UInt8
      self.set(vps_sel: value)
      value
    end

    # Calibration mode enable
    def calon : Bool
      @value.bits_set?(0x800_u32)
    end

    # Calibration mode enable
    def self.calon : Bool
      value.calon
    end

    # Calibration mode enable
    def self.calon=(value : Bool) : Bool
      self.set(calon: value)
      value
    end

    # Calibration selection
    def calsel : UInt8
      UInt8.new!((@value >> 12) & 0x3_u32)
    end

    # Calibration selection
    def self.calsel : UInt8
      value.calsel
    end

    # Calibration selection
    def self.calsel=(value : UInt8) : UInt8
      self.set(calsel: value)
      value
    end

    # Gain in PGA mode
    def pga_gain : UInt8
      UInt8.new!((@value >> 14) & 0xf_u32)
    end

    # Gain in PGA mode
    def self.pga_gain : UInt8
      value.pga_gain
    end

    # Gain in PGA mode
    def self.pga_gain=(value : UInt8) : UInt8
      self.set(pga_gain: value)
      value
    end

    # User trimming enable
    def user_trim : Bool
      @value.bits_set?(0x40000_u32)
    end

    # User trimming enable
    def self.user_trim : Bool
      value.user_trim
    end

    # User trimming enable
    def self.user_trim=(value : Bool) : Bool
      self.set(user_trim: value)
      value
    end

    # Offset trimming value (PMOS)
    def trimoffsetp : UInt8
      UInt8.new!((@value >> 19) & 0x1f_u32)
    end

    # Offset trimming value (PMOS)
    def self.trimoffsetp : UInt8
      value.trimoffsetp
    end

    # Offset trimming value (PMOS)
    def self.trimoffsetp=(value : UInt8) : UInt8
      self.set(trimoffsetp: value)
      value
    end

    # Offset trimming value (NMOS)
    def trimoffsetn : UInt8
      UInt8.new!((@value >> 24) & 0x1f_u32)
    end

    # Offset trimming value (NMOS)
    def self.trimoffsetn : UInt8
      value.trimoffsetn
    end

    # Offset trimming value (NMOS)
    def self.trimoffsetn=(value : UInt8) : UInt8
      self.set(trimoffsetn: value)
      value
    end

    # TSTREF
    def tstref : Bool
      @value.bits_set?(0x20000000_u32)
    end

    # TSTREF
    def self.tstref : Bool
      value.tstref
    end

    # TSTREF
    def self.tstref=(value : Bool) : Bool
      self.set(tstref: value)
      value
    end

    # OPAMP ouput status flag
    def outcal : Bool
      @value.bits_set?(0x40000000_u32)
    end

    # OPAMP ouput status flag
    def self.outcal : Bool
      value.outcal
    end

    # OPAMP lock
    def lock : Bool
      @value.bits_set?(0x80000000_u32)
    end

    # OPAMP lock
    def self.lock : Bool
      value.lock
    end

    # OPAMP lock
    def self.lock=(value : Bool) : Bool
      self.set(lock: value)
      value
    end

    def copy_with(
      *,

      _1_en : Bool? = nil,

      force_vp : Bool? = nil,

      vp_sel : UInt8? = nil,

      vm_sel : UInt8? = nil,

      tcm_en : Bool? = nil,

      vms_sel : Bool? = nil,

      vps_sel : UInt8? = nil,

      calon : Bool? = nil,

      calsel : UInt8? = nil,

      pga_gain : UInt8? = nil,

      user_trim : Bool? = nil,

      trimoffsetp : UInt8? = nil,

      trimoffsetn : UInt8? = nil,

      tstref : Bool? = nil,

      lock : Bool? = nil
    ) : self
      value = @value

      unless _1_en.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(_1_en.to_int).&(0x1_u32) << 0
      end

      unless force_vp.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(force_vp.to_int).&(0x1_u32) << 1
      end

      unless vp_sel.nil?
        value = (value & 0xfffffff3_u32) |
                UInt32.new!(vp_sel.to_int).&(0x3_u32) << 2
      end

      unless vm_sel.nil?
        value = (value & 0xffffff9f_u32) |
                UInt32.new!(vm_sel.to_int).&(0x3_u32) << 5
      end

      unless tcm_en.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(tcm_en.to_int).&(0x1_u32) << 7
      end

      unless vms_sel.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(vms_sel.to_int).&(0x1_u32) << 8
      end

      unless vps_sel.nil?
        value = (value & 0xfffff9ff_u32) |
                UInt32.new!(vps_sel.to_int).&(0x3_u32) << 9
      end

      unless calon.nil?
        value = (value & 0xfffff7ff_u32) |
                UInt32.new!(calon.to_int).&(0x1_u32) << 11
      end

      unless calsel.nil?
        value = (value & 0xffffcfff_u32) |
                UInt32.new!(calsel.to_int).&(0x3_u32) << 12
      end

      unless pga_gain.nil?
        value = (value & 0xfffc3fff_u32) |
                UInt32.new!(pga_gain.to_int).&(0xf_u32) << 14
      end

      unless user_trim.nil?
        value = (value & 0xfffbffff_u32) |
                UInt32.new!(user_trim.to_int).&(0x1_u32) << 18
      end

      unless trimoffsetp.nil?
        value = (value & 0xff07ffff_u32) |
                UInt32.new!(trimoffsetp.to_int).&(0x1f_u32) << 19
      end

      unless trimoffsetn.nil?
        value = (value & 0xe0ffffff_u32) |
                UInt32.new!(trimoffsetn.to_int).&(0x1f_u32) << 24
      end

      unless tstref.nil?
        value = (value & 0xdfffffff_u32) |
                UInt32.new!(tstref.to_int).&(0x1_u32) << 29
      end

      unless lock.nil?
        value = (value & 0x7fffffff_u32) |
                UInt32.new!(lock.to_int).&(0x1_u32) << 31
      end

      self.class.new(value)
    end

    def self.set(
      *,
      _1_en : Bool? = nil,
      force_vp : Bool? = nil,
      vp_sel : UInt8? = nil,
      vm_sel : UInt8? = nil,
      tcm_en : Bool? = nil,
      vms_sel : Bool? = nil,
      vps_sel : UInt8? = nil,
      calon : Bool? = nil,
      calsel : UInt8? = nil,
      pga_gain : UInt8? = nil,
      user_trim : Bool? = nil,
      trimoffsetp : UInt8? = nil,
      trimoffsetn : UInt8? = nil,
      tstref : Bool? = nil,
      lock : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        _1_en: _1_en,
        force_vp: force_vp,
        vp_sel: vp_sel,
        vm_sel: vm_sel,
        tcm_en: tcm_en,
        vms_sel: vms_sel,
        vps_sel: vps_sel,
        calon: calon,
        calsel: calsel,
        pga_gain: pga_gain,
        user_trim: user_trim,
        trimoffsetp: trimoffsetp,
        trimoffsetn: trimoffsetn,
        tstref: tstref,
        lock: lock,
      )
    end
  end # struct

end
