# Real-time clock
module RTC
  VERSION      = nil
  BASE_ADDRESS = 0x40002800_u64

  # time register
  struct TR
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

    enum PM : UInt8
      # AM or 24-hour format
      AM = 0x0_u64

      # PM
      PM = 0x1_u64

      def self.reset_value : PM
        TR.reset_value.pm
      end
    end

    # AM/PM notation
    def pm : PM
      PM.new!((@value >> 22) & 0x1_u32)
    end

    # AM/PM notation
    def self.pm : PM
      value.pm
    end

    # AM/PM notation
    def self.pm=(value : PM) : PM
      self.set(pm: value)
      value
    end

    # Hour tens in BCD format
    def ht : UInt8
      UInt8.new!((@value >> 20) & 0x3_u32)
    end

    # Hour tens in BCD format
    def self.ht : UInt8
      value.ht
    end

    # Hour tens in BCD format
    def self.ht=(value : UInt8) : UInt8
      self.set(ht: value)
      value
    end

    # Hour units in BCD format
    def hu : UInt8
      UInt8.new!((@value >> 16) & 0xf_u32)
    end

    # Hour units in BCD format
    def self.hu : UInt8
      value.hu
    end

    # Hour units in BCD format
    def self.hu=(value : UInt8) : UInt8
      self.set(hu: value)
      value
    end

    # Minute tens in BCD format
    def mnt : UInt8
      UInt8.new!((@value >> 12) & 0x7_u32)
    end

    # Minute tens in BCD format
    def self.mnt : UInt8
      value.mnt
    end

    # Minute tens in BCD format
    def self.mnt=(value : UInt8) : UInt8
      self.set(mnt: value)
      value
    end

    # Minute units in BCD format
    def mnu : UInt8
      UInt8.new!((@value >> 8) & 0xf_u32)
    end

    # Minute units in BCD format
    def self.mnu : UInt8
      value.mnu
    end

    # Minute units in BCD format
    def self.mnu=(value : UInt8) : UInt8
      self.set(mnu: value)
      value
    end

    # Second tens in BCD format
    def st : UInt8
      UInt8.new!((@value >> 4) & 0x7_u32)
    end

    # Second tens in BCD format
    def self.st : UInt8
      value.st
    end

    # Second tens in BCD format
    def self.st=(value : UInt8) : UInt8
      self.set(st: value)
      value
    end

    # Second units in BCD format
    def su : UInt8
      UInt8.new!((@value >> 0) & 0xf_u32)
    end

    # Second units in BCD format
    def self.su : UInt8
      value.su
    end

    # Second units in BCD format
    def self.su=(value : UInt8) : UInt8
      self.set(su: value)
      value
    end

    def copy_with(
      *,

      pm : PM? = nil,

      ht : UInt8? = nil,

      hu : UInt8? = nil,

      mnt : UInt8? = nil,

      mnu : UInt8? = nil,

      st : UInt8? = nil,

      su : UInt8? = nil
    ) : self
      value = @value

      unless pm.nil?
        value = (value & 0xffbfffff_u32) |
                UInt32.new!(pm.to_int).&(0x1_u32) << 22
      end

      unless ht.nil?
        value = (value & 0xffcfffff_u32) |
                UInt32.new!(ht.to_int).&(0x3_u32) << 20
      end

      unless hu.nil?
        value = (value & 0xfff0ffff_u32) |
                UInt32.new!(hu.to_int).&(0xf_u32) << 16
      end

      unless mnt.nil?
        value = (value & 0xffff8fff_u32) |
                UInt32.new!(mnt.to_int).&(0x7_u32) << 12
      end

      unless mnu.nil?
        value = (value & 0xfffff0ff_u32) |
                UInt32.new!(mnu.to_int).&(0xf_u32) << 8
      end

      unless st.nil?
        value = (value & 0xffffff8f_u32) |
                UInt32.new!(st.to_int).&(0x7_u32) << 4
      end

      unless su.nil?
        value = (value & 0xfffffff0_u32) |
                UInt32.new!(su.to_int).&(0xf_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      pm : PM? = nil,
      ht : UInt8? = nil,
      hu : UInt8? = nil,
      mnt : UInt8? = nil,
      mnu : UInt8? = nil,
      st : UInt8? = nil,
      su : UInt8? = nil
    ) : Nil
      self.value = self.value.copy_with(
        pm: pm,
        ht: ht,
        hu: hu,
        mnt: mnt,
        mnu: mnu,
        st: st,
        su: su,
      )
    end
  end # struct

  # date register
  struct DR
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
      new(0x2101_u64)
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

    # Year tens in BCD format
    def yt : UInt8
      UInt8.new!((@value >> 20) & 0xf_u32)
    end

    # Year tens in BCD format
    def self.yt : UInt8
      value.yt
    end

    # Year tens in BCD format
    def self.yt=(value : UInt8) : UInt8
      self.set(yt: value)
      value
    end

    # Year units in BCD format
    def yu : UInt8
      UInt8.new!((@value >> 16) & 0xf_u32)
    end

    # Year units in BCD format
    def self.yu : UInt8
      value.yu
    end

    # Year units in BCD format
    def self.yu=(value : UInt8) : UInt8
      self.set(yu: value)
      value
    end

    # Week day units
    def wdu : UInt8
      UInt8.new!((@value >> 13) & 0x7_u32)
    end

    # Week day units
    def self.wdu : UInt8
      value.wdu
    end

    # Week day units
    def self.wdu=(value : UInt8) : UInt8
      self.set(wdu: value)
      value
    end

    # Month tens in BCD format
    def mt : Bool
      @value.bits_set?(0x1000_u32)
    end

    # Month tens in BCD format
    def self.mt : Bool
      value.mt
    end

    # Month tens in BCD format
    def self.mt=(value : Bool) : Bool
      self.set(mt: value)
      value
    end

    # Month units in BCD format
    def mu : UInt8
      UInt8.new!((@value >> 8) & 0xf_u32)
    end

    # Month units in BCD format
    def self.mu : UInt8
      value.mu
    end

    # Month units in BCD format
    def self.mu=(value : UInt8) : UInt8
      self.set(mu: value)
      value
    end

    # Date tens in BCD format
    def dt : UInt8
      UInt8.new!((@value >> 4) & 0x3_u32)
    end

    # Date tens in BCD format
    def self.dt : UInt8
      value.dt
    end

    # Date tens in BCD format
    def self.dt=(value : UInt8) : UInt8
      self.set(dt: value)
      value
    end

    # Date units in BCD format
    def du : UInt8
      UInt8.new!((@value >> 0) & 0xf_u32)
    end

    # Date units in BCD format
    def self.du : UInt8
      value.du
    end

    # Date units in BCD format
    def self.du=(value : UInt8) : UInt8
      self.set(du: value)
      value
    end

    def copy_with(
      *,

      yt : UInt8? = nil,

      yu : UInt8? = nil,

      wdu : UInt8? = nil,

      mt : Bool? = nil,

      mu : UInt8? = nil,

      dt : UInt8? = nil,

      du : UInt8? = nil
    ) : self
      value = @value

      unless yt.nil?
        value = (value & 0xff0fffff_u32) |
                UInt32.new!(yt.to_int).&(0xf_u32) << 20
      end

      unless yu.nil?
        value = (value & 0xfff0ffff_u32) |
                UInt32.new!(yu.to_int).&(0xf_u32) << 16
      end

      unless wdu.nil?
        value = (value & 0xffff1fff_u32) |
                UInt32.new!(wdu.to_int).&(0x7_u32) << 13
      end

      unless mt.nil?
        value = (value & 0xffffefff_u32) |
                UInt32.new!(mt.to_int).&(0x1_u32) << 12
      end

      unless mu.nil?
        value = (value & 0xfffff0ff_u32) |
                UInt32.new!(mu.to_int).&(0xf_u32) << 8
      end

      unless dt.nil?
        value = (value & 0xffffffcf_u32) |
                UInt32.new!(dt.to_int).&(0x3_u32) << 4
      end

      unless du.nil?
        value = (value & 0xfffffff0_u32) |
                UInt32.new!(du.to_int).&(0xf_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      yt : UInt8? = nil,
      yu : UInt8? = nil,
      wdu : UInt8? = nil,
      mt : Bool? = nil,
      mu : UInt8? = nil,
      dt : UInt8? = nil,
      du : UInt8? = nil
    ) : Nil
      self.value = self.value.copy_with(
        yt: yt,
        yu: yu,
        wdu: wdu,
        mt: mt,
        mu: mu,
        dt: dt,
        du: du,
      )
    end
  end # struct

  # control register
  struct CR
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

    enum WUCKSEL : UInt8
      # RTC/16 clock is selected
      DIV16 = 0x0_u64

      # RTC/8 clock is selected
      DIV8 = 0x1_u64

      # RTC/4 clock is selected
      DIV4 = 0x2_u64

      # RTC/2 clock is selected
      DIV2 = 0x3_u64

      # ck_spre (usually 1 Hz) clock is selected
      CLOCKSPARE = 0x4_u64

      # ck_spre (usually 1 Hz) clock is selected and 2^16 is added to the WUT counter value
      CLOCKSPAREWITHOFFSET = 0x6_u64

      def self.reset_value : WUCKSEL
        CR.reset_value.wucksel
      end
    end

    # Wakeup clock selection
    def wucksel : WUCKSEL
      WUCKSEL.new!((@value >> 0) & 0x7_u32)
    end

    # Wakeup clock selection
    def self.wucksel : WUCKSEL
      value.wucksel
    end

    # Wakeup clock selection
    def self.wucksel=(value : WUCKSEL) : WUCKSEL
      self.set(wucksel: value)
      value
    end

    enum TSEDGE : UInt8
      # RTC_TS input rising edge generates a time-stamp event
      RISINGEDGE = 0x0_u64

      # RTC_TS input falling edge generates a time-stamp event
      FALLINGEDGE = 0x1_u64

      def self.reset_value : TSEDGE
        CR.reset_value.tsedge
      end
    end

    # Time-stamp event active              edge
    def tsedge : TSEDGE
      TSEDGE.new!((@value >> 3) & 0x1_u32)
    end

    # Time-stamp event active              edge
    def self.tsedge : TSEDGE
      value.tsedge
    end

    # Time-stamp event active              edge
    def self.tsedge=(value : TSEDGE) : TSEDGE
      self.set(tsedge: value)
      value
    end

    enum REFCKON : UInt8
      # RTC_REFIN detection disabled
      DISABLED = 0x0_u64

      # RTC_REFIN detection enabled
      ENABLED = 0x1_u64

      def self.reset_value : REFCKON
        CR.reset_value.refckon
      end
    end

    # Reference clock detection enable (50 or              60 Hz)
    def refckon : REFCKON
      REFCKON.new!((@value >> 4) & 0x1_u32)
    end

    # Reference clock detection enable (50 or              60 Hz)
    def self.refckon : REFCKON
      value.refckon
    end

    # Reference clock detection enable (50 or              60 Hz)
    def self.refckon=(value : REFCKON) : REFCKON
      self.set(refckon: value)
      value
    end

    enum BYPSHAD : UInt8
      # Calendar values (when reading from RTC_SSR, RTC_TR, and RTC_DR) are taken from the shadow registers, which are updated once every two RTCCLK cycles
      SHADOWREG = 0x0_u64

      # Calendar values (when reading from RTC_SSR, RTC_TR, and RTC_DR) are taken directly from the calendar counters
      BYPASSSHADOWREG = 0x1_u64

      def self.reset_value : BYPSHAD
        CR.reset_value.bypshad
      end
    end

    # Bypass the shadow              registers
    def bypshad : BYPSHAD
      BYPSHAD.new!((@value >> 5) & 0x1_u32)
    end

    # Bypass the shadow              registers
    def self.bypshad : BYPSHAD
      value.bypshad
    end

    # Bypass the shadow              registers
    def self.bypshad=(value : BYPSHAD) : BYPSHAD
      self.set(bypshad: value)
      value
    end

    enum FMT : UInt8
      # 24 hour/day format
      TWENTY_FOUR_HOUR = 0x0_u64

      # AM/PM hour format
      AM_PM = 0x1_u64

      def self.reset_value : FMT
        CR.reset_value.fmt
      end
    end

    # Hour format
    def fmt : FMT
      FMT.new!((@value >> 6) & 0x1_u32)
    end

    # Hour format
    def self.fmt : FMT
      value.fmt
    end

    # Hour format
    def self.fmt=(value : FMT) : FMT
      self.set(fmt: value)
      value
    end

    enum ALRAE : UInt8
      # Alarm A disabled
      DISABLED = 0x0_u64

      # Alarm A enabled
      ENABLED = 0x1_u64

      def self.reset_value : ALRAE
        CR.reset_value.alrae
      end
    end

    # Alarm A enable
    def alrae : ALRAE
      ALRAE.new!((@value >> 8) & 0x1_u32)
    end

    # Alarm A enable
    def self.alrae : ALRAE
      value.alrae
    end

    # Alarm A enable
    def self.alrae=(value : ALRAE) : ALRAE
      self.set(alrae: value)
      value
    end

    enum ALRBE : UInt8
      # Alarm B disabled
      DISABLED = 0x0_u64

      # Alarm B enabled
      ENABLED = 0x1_u64

      def self.reset_value : ALRBE
        CR.reset_value.alrbe
      end
    end

    # Alarm B enable
    def alrbe : ALRBE
      ALRBE.new!((@value >> 9) & 0x1_u32)
    end

    # Alarm B enable
    def self.alrbe : ALRBE
      value.alrbe
    end

    # Alarm B enable
    def self.alrbe=(value : ALRBE) : ALRBE
      self.set(alrbe: value)
      value
    end

    enum WUTE : UInt8
      # Wakeup timer disabled
      DISABLED = 0x0_u64

      # Wakeup timer enabled
      ENABLED = 0x1_u64

      def self.reset_value : WUTE
        CR.reset_value.wute
      end
    end

    # Wakeup timer enable
    def wute : WUTE
      WUTE.new!((@value >> 10) & 0x1_u32)
    end

    # Wakeup timer enable
    def self.wute : WUTE
      value.wute
    end

    # Wakeup timer enable
    def self.wute=(value : WUTE) : WUTE
      self.set(wute: value)
      value
    end

    enum TSE : UInt8
      # Timestamp disabled
      DISABLED = 0x0_u64

      # Timestamp enabled
      ENABLED = 0x1_u64

      def self.reset_value : TSE
        CR.reset_value.tse
      end
    end

    # Time stamp enable
    def tse : TSE
      TSE.new!((@value >> 11) & 0x1_u32)
    end

    # Time stamp enable
    def self.tse : TSE
      value.tse
    end

    # Time stamp enable
    def self.tse=(value : TSE) : TSE
      self.set(tse: value)
      value
    end

    enum ALRAIE : UInt8
      # Alarm A interrupt disabled
      DISABLED = 0x0_u64

      # Alarm A interrupt enabled
      ENABLED = 0x1_u64

      def self.reset_value : ALRAIE
        CR.reset_value.alraie
      end
    end

    # Alarm A interrupt enable
    def alraie : ALRAIE
      ALRAIE.new!((@value >> 12) & 0x1_u32)
    end

    # Alarm A interrupt enable
    def self.alraie : ALRAIE
      value.alraie
    end

    # Alarm A interrupt enable
    def self.alraie=(value : ALRAIE) : ALRAIE
      self.set(alraie: value)
      value
    end

    enum ALRBIE : UInt8
      # Alarm B Interrupt disabled
      DISABLED = 0x0_u64

      # Alarm B Interrupt enabled
      ENABLED = 0x1_u64

      def self.reset_value : ALRBIE
        CR.reset_value.alrbie
      end
    end

    # Alarm B interrupt enable
    def alrbie : ALRBIE
      ALRBIE.new!((@value >> 13) & 0x1_u32)
    end

    # Alarm B interrupt enable
    def self.alrbie : ALRBIE
      value.alrbie
    end

    # Alarm B interrupt enable
    def self.alrbie=(value : ALRBIE) : ALRBIE
      self.set(alrbie: value)
      value
    end

    enum WUTIE : UInt8
      # Wakeup timer interrupt disabled
      DISABLED = 0x0_u64

      # Wakeup timer interrupt enabled
      ENABLED = 0x1_u64

      def self.reset_value : WUTIE
        CR.reset_value.wutie
      end
    end

    # Wakeup timer interrupt              enable
    def wutie : WUTIE
      WUTIE.new!((@value >> 14) & 0x1_u32)
    end

    # Wakeup timer interrupt              enable
    def self.wutie : WUTIE
      value.wutie
    end

    # Wakeup timer interrupt              enable
    def self.wutie=(value : WUTIE) : WUTIE
      self.set(wutie: value)
      value
    end

    enum TSIE : UInt8
      # Time-stamp Interrupt disabled
      DISABLED = 0x0_u64

      # Time-stamp Interrupt enabled
      ENABLED = 0x1_u64

      def self.reset_value : TSIE
        CR.reset_value.tsie
      end
    end

    # Time-stamp interrupt              enable
    def tsie : TSIE
      TSIE.new!((@value >> 15) & 0x1_u32)
    end

    # Time-stamp interrupt              enable
    def self.tsie : TSIE
      value.tsie
    end

    # Time-stamp interrupt              enable
    def self.tsie=(value : TSIE) : TSIE
      self.set(tsie: value)
      value
    end

    enum ADD1H : UInt8
      # Adds 1 hour to the current time. This can be used for summer time change outside initialization mode
      ADD1 = 0x1_u64

      def self.reset_value : ADD1H
        CR.reset_value.add1_h
      end
    end

    # Add 1 hour (summer time              change)
    def add1_h : ADD1H
      ADD1H.new!((@value >> 16) & 0x1_u32)
    end

    # Add 1 hour (summer time              change)
    def self.add1_h : ADD1H
      value.add1_h
    end

    # Add 1 hour (summer time              change)
    def self.add1_h=(value : ADD1H) : ADD1H
      self.set(add1_h: value)
      value
    end

    enum SUB1H : UInt8
      # Subtracts 1 hour to the current time. This can be used for winter time change outside initialization mode
      SUB1 = 0x1_u64

      def self.reset_value : SUB1H
        CR.reset_value.sub1_h
      end
    end

    # Subtract 1 hour (winter time              change)
    def sub1_h : SUB1H
      SUB1H.new!((@value >> 17) & 0x1_u32)
    end

    # Subtract 1 hour (winter time              change)
    def self.sub1_h : SUB1H
      value.sub1_h
    end

    # Subtract 1 hour (winter time              change)
    def self.sub1_h=(value : SUB1H) : SUB1H
      self.set(sub1_h: value)
      value
    end

    enum BKP : UInt8
      # Daylight Saving Time change has not been performed
      DST_NOT_CHANGED = 0x0_u64

      # Daylight Saving Time change has been performed
      DST_CHANGED = 0x1_u64

      def self.reset_value : BKP
        CR.reset_value.bkp
      end
    end

    # Backup
    def bkp : BKP
      BKP.new!((@value >> 18) & 0x1_u32)
    end

    # Backup
    def self.bkp : BKP
      value.bkp
    end

    # Backup
    def self.bkp=(value : BKP) : BKP
      self.set(bkp: value)
      value
    end

    enum COSEL : UInt8
      # Calibration output is 512 Hz (with default prescaler setting)
      CALFREQ_512HZ = 0x0_u64

      # Calibration output is 1 Hz (with default prescaler setting)
      CALFREQ_1HZ = 0x1_u64

      def self.reset_value : COSEL
        CR.reset_value.cosel
      end
    end

    # Calibration output              selection
    def cosel : COSEL
      COSEL.new!((@value >> 19) & 0x1_u32)
    end

    # Calibration output              selection
    def self.cosel : COSEL
      value.cosel
    end

    # Calibration output              selection
    def self.cosel=(value : COSEL) : COSEL
      self.set(cosel: value)
      value
    end

    enum POL : UInt8
      # The pin is high when ALRAF/ALRBF/WUTF is asserted (depending on OSEL[1:0])
      HIGH = 0x0_u64

      # The pin is low when ALRAF/ALRBF/WUTF is asserted (depending on OSEL[1:0])
      LOW = 0x1_u64

      def self.reset_value : POL
        CR.reset_value.pol
      end
    end

    # Output polarity
    def pol : POL
      POL.new!((@value >> 20) & 0x1_u32)
    end

    # Output polarity
    def self.pol : POL
      value.pol
    end

    # Output polarity
    def self.pol=(value : POL) : POL
      self.set(pol: value)
      value
    end

    enum OSEL : UInt8
      # Output disabled
      DISABLED = 0x0_u64

      # Alarm A output enabled
      ALARMA = 0x1_u64

      # Alarm B output enabled
      ALARMB = 0x2_u64

      # Wakeup output enabled
      WAKEUP = 0x3_u64

      def self.reset_value : OSEL
        CR.reset_value.osel
      end
    end

    # Output selection
    def osel : OSEL
      OSEL.new!((@value >> 21) & 0x3_u32)
    end

    # Output selection
    def self.osel : OSEL
      value.osel
    end

    # Output selection
    def self.osel=(value : OSEL) : OSEL
      self.set(osel: value)
      value
    end

    enum COE : UInt8
      # Calibration output disabled
      DISABLED = 0x0_u64

      # Calibration output enabled
      ENABLED = 0x1_u64

      def self.reset_value : COE
        CR.reset_value.coe
      end
    end

    # Calibration output enable
    def coe : COE
      COE.new!((@value >> 23) & 0x1_u32)
    end

    # Calibration output enable
    def self.coe : COE
      value.coe
    end

    # Calibration output enable
    def self.coe=(value : COE) : COE
      self.set(coe: value)
      value
    end

    def copy_with(
      *,

      wucksel : WUCKSEL? = nil,

      tsedge : TSEDGE? = nil,

      refckon : REFCKON? = nil,

      bypshad : BYPSHAD? = nil,

      fmt : FMT? = nil,

      alrae : ALRAE? = nil,

      alrbe : ALRBE? = nil,

      wute : WUTE? = nil,

      tse : TSE? = nil,

      alraie : ALRAIE? = nil,

      alrbie : ALRBIE? = nil,

      wutie : WUTIE? = nil,

      tsie : TSIE? = nil,

      add1_h : ADD1H? = nil,

      sub1_h : SUB1H? = nil,

      bkp : BKP? = nil,

      cosel : COSEL? = nil,

      pol : POL? = nil,

      osel : OSEL? = nil,

      coe : COE? = nil
    ) : self
      value = @value

      unless wucksel.nil?
        value = (value & 0xfffffff8_u32) |
                UInt32.new!(wucksel.to_int).&(0x7_u32) << 0
      end

      unless tsedge.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(tsedge.to_int).&(0x1_u32) << 3
      end

      unless refckon.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(refckon.to_int).&(0x1_u32) << 4
      end

      unless bypshad.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(bypshad.to_int).&(0x1_u32) << 5
      end

      unless fmt.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(fmt.to_int).&(0x1_u32) << 6
      end

      unless alrae.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(alrae.to_int).&(0x1_u32) << 8
      end

      unless alrbe.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(alrbe.to_int).&(0x1_u32) << 9
      end

      unless wute.nil?
        value = (value & 0xfffffbff_u32) |
                UInt32.new!(wute.to_int).&(0x1_u32) << 10
      end

      unless tse.nil?
        value = (value & 0xfffff7ff_u32) |
                UInt32.new!(tse.to_int).&(0x1_u32) << 11
      end

      unless alraie.nil?
        value = (value & 0xffffefff_u32) |
                UInt32.new!(alraie.to_int).&(0x1_u32) << 12
      end

      unless alrbie.nil?
        value = (value & 0xffffdfff_u32) |
                UInt32.new!(alrbie.to_int).&(0x1_u32) << 13
      end

      unless wutie.nil?
        value = (value & 0xffffbfff_u32) |
                UInt32.new!(wutie.to_int).&(0x1_u32) << 14
      end

      unless tsie.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(tsie.to_int).&(0x1_u32) << 15
      end

      unless add1_h.nil?
        value = (value & 0xfffeffff_u32) |
                UInt32.new!(add1_h.to_int).&(0x1_u32) << 16
      end

      unless sub1_h.nil?
        value = (value & 0xfffdffff_u32) |
                UInt32.new!(sub1_h.to_int).&(0x1_u32) << 17
      end

      unless bkp.nil?
        value = (value & 0xfffbffff_u32) |
                UInt32.new!(bkp.to_int).&(0x1_u32) << 18
      end

      unless cosel.nil?
        value = (value & 0xfff7ffff_u32) |
                UInt32.new!(cosel.to_int).&(0x1_u32) << 19
      end

      unless pol.nil?
        value = (value & 0xffefffff_u32) |
                UInt32.new!(pol.to_int).&(0x1_u32) << 20
      end

      unless osel.nil?
        value = (value & 0xff9fffff_u32) |
                UInt32.new!(osel.to_int).&(0x3_u32) << 21
      end

      unless coe.nil?
        value = (value & 0xff7fffff_u32) |
                UInt32.new!(coe.to_int).&(0x1_u32) << 23
      end

      self.class.new(value)
    end

    def self.set(
      *,
      wucksel : WUCKSEL? = nil,
      tsedge : TSEDGE? = nil,
      refckon : REFCKON? = nil,
      bypshad : BYPSHAD? = nil,
      fmt : FMT? = nil,
      alrae : ALRAE? = nil,
      alrbe : ALRBE? = nil,
      wute : WUTE? = nil,
      tse : TSE? = nil,
      alraie : ALRAIE? = nil,
      alrbie : ALRBIE? = nil,
      wutie : WUTIE? = nil,
      tsie : TSIE? = nil,
      add1_h : ADD1H? = nil,
      sub1_h : SUB1H? = nil,
      bkp : BKP? = nil,
      cosel : COSEL? = nil,
      pol : POL? = nil,
      osel : OSEL? = nil,
      coe : COE? = nil
    ) : Nil
      self.value = self.value.copy_with(
        wucksel: wucksel,
        tsedge: tsedge,
        refckon: refckon,
        bypshad: bypshad,
        fmt: fmt,
        alrae: alrae,
        alrbe: alrbe,
        wute: wute,
        tse: tse,
        alraie: alraie,
        alrbie: alrbie,
        wutie: wutie,
        tsie: tsie,
        add1_h: add1_h,
        sub1_h: sub1_h,
        bkp: bkp,
        cosel: cosel,
        pol: pol,
        osel: osel,
        coe: coe,
      )
    end
  end # struct

  # initialization and status          register
  struct ISR
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

    enum ALRAWF : UInt8
      # Alarm update not allowed
      UPDATENOTALLOWED = 0x0_u64

      # Alarm update allowed
      UPDATEALLOWED = 0x1_u64

      def self.reset_value : ALRAWF
        ISR.reset_value.alrawf
      end
    end

    # Alarm A write flag
    def alrawf : ALRAWF
      ALRAWF.new!((@value >> 0) & 0x1_u32)
    end

    # Alarm A write flag
    def self.alrawf : ALRAWF
      value.alrawf
    end

    # Alarm B write flag
    def alrbwf : Bool
      @value.bits_set?(0x2_u32)
    end

    # Alarm B write flag
    def self.alrbwf : Bool
      value.alrbwf
    end

    enum WUTWF : UInt8
      # Wakeup timer configuration update not allowed
      UPDATENOTALLOWED = 0x0_u64

      # Wakeup timer configuration update allowed
      UPDATEALLOWED = 0x1_u64

      def self.reset_value : WUTWF
        ISR.reset_value.wutwf
      end
    end

    # Wakeup timer write flag
    def wutwf : WUTWF
      WUTWF.new!((@value >> 2) & 0x1_u32)
    end

    # Wakeup timer write flag
    def self.wutwf : WUTWF
      value.wutwf
    end

    enum SHPF : UInt8
      # No shift operation is pending
      NOSHIFTPENDING = 0x0_u64

      # A shift operation is pending
      SHIFTPENDING = 0x1_u64

      def self.reset_value : SHPF
        ISR.reset_value.shpf
      end
    end

    # Shift operation pending
    def shpf : SHPF
      SHPF.new!((@value >> 3) & 0x1_u32)
    end

    # Shift operation pending
    def self.shpf : SHPF
      value.shpf
    end

    # Shift operation pending
    def self.shpf=(value : SHPF) : SHPF
      self.set(shpf: value)
      value
    end

    enum INITS : UInt8
      # Calendar has not been initialized
      NOTINITALIZED = 0x0_u64

      # Calendar has been initialized
      INITALIZED = 0x1_u64

      def self.reset_value : INITS
        ISR.reset_value.inits
      end
    end

    # Initialization status flag
    def inits : INITS
      INITS.new!((@value >> 4) & 0x1_u32)
    end

    # Initialization status flag
    def self.inits : INITS
      value.inits
    end

    enum RSF : UInt8
      # Calendar shadow registers not yet synchronized
      NOTSYNCED = 0x0_u64

      # Calendar shadow registers synchronized
      SYNCED = 0x1_u64

      def self.reset_value : RSF
        ISR.reset_value.rsf
      end
    end

    # Registers synchronization              flag
    def rsf : RSF
      RSF.new!((@value >> 5) & 0x1_u32)
    end

    # Registers synchronization              flag
    def self.rsf : RSF
      value.rsf
    end

    # Registers synchronization              flag
    def self.rsf=(value : RSF) : RSF
      self.set(rsf: value)
      value
    end

    enum INITF : UInt8
      # Calendar registers update is not allowed
      NOTALLOWED = 0x0_u64

      # Calendar registers update is allowed
      ALLOWED = 0x1_u64

      def self.reset_value : INITF
        ISR.reset_value.initf
      end
    end

    # Initialization flag
    def initf : INITF
      INITF.new!((@value >> 6) & 0x1_u32)
    end

    # Initialization flag
    def self.initf : INITF
      value.initf
    end

    enum INIT : UInt8
      # Free running mode
      FREERUNNINGMODE = 0x0_u64

      # Initialization mode used to program time and date register (RTC_TR and RTC_DR), and prescaler register (RTC_PRER). Counters are stopped and start counting from the new value when INIT is reset.
      INITMODE = 0x1_u64

      def self.reset_value : INIT
        ISR.reset_value.init
      end
    end

    # Initialization mode
    def init : INIT
      INIT.new!((@value >> 7) & 0x1_u32)
    end

    # Initialization mode
    def self.init : INIT
      value.init
    end

    # Initialization mode
    def self.init=(value : INIT) : INIT
      self.set(init: value)
      value
    end

    enum ALRAF : UInt8
      # This flag is set by hardware when the time/date registers (RTC_TR and RTC_DR) match the Alarm A register (RTC_ALRMAR)
      MATCH = 0x1_u64

      def self.reset_value : ALRAF
        ISR.reset_value.alraf
      end
    end

    # Alarm A flag
    def alraf : ALRAF
      ALRAF.new!((@value >> 8) & 0x1_u32)
    end

    # Alarm A flag
    def self.alraf : ALRAF
      value.alraf
    end

    # Alarm A flag
    def self.alraf=(value : ALRAF) : ALRAF
      self.set(alraf: value)
      value
    end

    enum ALRBF : UInt8
      # This flag is set by hardware when the time/date registers (RTC_TR and RTC_DR) match the Alarm B register (RTC_ALRMBR)
      MATCH = 0x1_u64

      def self.reset_value : ALRBF
        ISR.reset_value.alrbf
      end
    end

    # Alarm B flag
    def alrbf : ALRBF
      ALRBF.new!((@value >> 9) & 0x1_u32)
    end

    # Alarm B flag
    def self.alrbf : ALRBF
      value.alrbf
    end

    # Alarm B flag
    def self.alrbf=(value : ALRBF) : ALRBF
      self.set(alrbf: value)
      value
    end

    enum WUTF : UInt8
      # This flag is set by hardware when the wakeup auto-reload counter reaches 0
      ZERO = 0x1_u64

      def self.reset_value : WUTF
        ISR.reset_value.wutf
      end
    end

    # Wakeup timer flag
    def wutf : WUTF
      WUTF.new!((@value >> 10) & 0x1_u32)
    end

    # Wakeup timer flag
    def self.wutf : WUTF
      value.wutf
    end

    # Wakeup timer flag
    def self.wutf=(value : WUTF) : WUTF
      self.set(wutf: value)
      value
    end

    enum TSF : UInt8
      # This flag is set by hardware when a time-stamp event occurs
      TIMESTAMPEVENT = 0x1_u64

      def self.reset_value : TSF
        ISR.reset_value.tsf
      end
    end

    # Time-stamp flag
    def tsf : TSF
      TSF.new!((@value >> 11) & 0x1_u32)
    end

    # Time-stamp flag
    def self.tsf : TSF
      value.tsf
    end

    # Time-stamp flag
    def self.tsf=(value : TSF) : TSF
      self.set(tsf: value)
      value
    end

    enum TSOVF : UInt8
      # This flag is set by hardware when a time-stamp event occurs while TSF is already set
      OVERFLOW = 0x1_u64

      def self.reset_value : TSOVF
        ISR.reset_value.tsovf
      end
    end

    # Time-stamp overflow flag
    def tsovf : TSOVF
      TSOVF.new!((@value >> 12) & 0x1_u32)
    end

    # Time-stamp overflow flag
    def self.tsovf : TSOVF
      value.tsovf
    end

    # Time-stamp overflow flag
    def self.tsovf=(value : TSOVF) : TSOVF
      self.set(tsovf: value)
      value
    end

    enum TAMP1F : UInt8
      # This flag is set by hardware when a tamper detection event is detected on the RTC_TAMPx input
      TAMPERED = 0x1_u64

      def self.reset_value : TAMP1F
        ISR.reset_value.tamp1_f
      end
    end

    # Tamper detection flag
    def tamp1_f : TAMP1F
      TAMP1F.new!((@value >> 13) & 0x1_u32)
    end

    # Tamper detection flag
    def self.tamp1_f : TAMP1F
      value.tamp1_f
    end

    # Tamper detection flag
    def self.tamp1_f=(value : TAMP1F) : TAMP1F
      self.set(tamp1_f: value)
      value
    end

    # RTC_TAMP2 detection flag
    def tamp2_f : Bool
      @value.bits_set?(0x4000_u32)
    end

    # RTC_TAMP2 detection flag
    def self.tamp2_f : Bool
      value.tamp2_f
    end

    # RTC_TAMP2 detection flag
    def self.tamp2_f=(value : Bool) : Bool
      self.set(tamp2_f: value)
      value
    end

    # RTC_TAMP3 detection flag
    def tamp3_f : Bool
      @value.bits_set?(0x8000_u32)
    end

    # RTC_TAMP3 detection flag
    def self.tamp3_f : Bool
      value.tamp3_f
    end

    # RTC_TAMP3 detection flag
    def self.tamp3_f=(value : Bool) : Bool
      self.set(tamp3_f: value)
      value
    end

    enum RECALPF : UInt8
      # The RECALPF status flag is automatically set to 1 when software writes to the RTC_CALR register, indicating that the RTC_CALR register is blocked. When the new calibration settings are taken into account, this bit returns to 0
      PENDING = 0x1_u64

      def self.reset_value : RECALPF
        ISR.reset_value.recalpf
      end
    end

    # Recalibration pending Flag
    def recalpf : RECALPF
      RECALPF.new!((@value >> 16) & 0x1_u32)
    end

    # Recalibration pending Flag
    def self.recalpf : RECALPF
      value.recalpf
    end

    def copy_with(
      *,

      shpf : SHPF? = nil,

      rsf : RSF? = nil,

      init : INIT? = nil,

      alraf : ALRAF? = nil,

      alrbf : ALRBF? = nil,

      wutf : WUTF? = nil,

      tsf : TSF? = nil,

      tsovf : TSOVF? = nil,

      tamp1_f : TAMP1F? = nil,

      tamp2_f : Bool? = nil,

      tamp3_f : Bool? = nil
    ) : self
      value = @value

      unless shpf.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(shpf.to_int).&(0x1_u32) << 3
      end

      unless rsf.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(rsf.to_int).&(0x1_u32) << 5
      end

      unless init.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(init.to_int).&(0x1_u32) << 7
      end

      unless alraf.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(alraf.to_int).&(0x1_u32) << 8
      end

      unless alrbf.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(alrbf.to_int).&(0x1_u32) << 9
      end

      unless wutf.nil?
        value = (value & 0xfffffbff_u32) |
                UInt32.new!(wutf.to_int).&(0x1_u32) << 10
      end

      unless tsf.nil?
        value = (value & 0xfffff7ff_u32) |
                UInt32.new!(tsf.to_int).&(0x1_u32) << 11
      end

      unless tsovf.nil?
        value = (value & 0xffffefff_u32) |
                UInt32.new!(tsovf.to_int).&(0x1_u32) << 12
      end

      unless tamp1_f.nil?
        value = (value & 0xffffdfff_u32) |
                UInt32.new!(tamp1_f.to_int).&(0x1_u32) << 13
      end

      unless tamp2_f.nil?
        value = (value & 0xffffbfff_u32) |
                UInt32.new!(tamp2_f.to_int).&(0x1_u32) << 14
      end

      unless tamp3_f.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(tamp3_f.to_int).&(0x1_u32) << 15
      end

      self.class.new(value)
    end

    def self.set(
      *,
      shpf : SHPF? = nil,
      rsf : RSF? = nil,
      init : INIT? = nil,
      alraf : ALRAF? = nil,
      alrbf : ALRBF? = nil,
      wutf : WUTF? = nil,
      tsf : TSF? = nil,
      tsovf : TSOVF? = nil,
      tamp1_f : TAMP1F? = nil,
      tamp2_f : Bool? = nil,
      tamp3_f : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        shpf: shpf,
        rsf: rsf,
        init: init,
        alraf: alraf,
        alrbf: alrbf,
        wutf: wutf,
        tsf: tsf,
        tsovf: tsovf,
        tamp1_f: tamp1_f,
        tamp2_f: tamp2_f,
        tamp3_f: tamp3_f,
      )
    end
  end # struct

  # prescaler register
  struct PRER
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
      new(0x7f00ff_u64)
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

    # Asynchronous prescaler              factor
    def prediv_a : UInt8
      UInt8.new!((@value >> 16) & 0x7f_u32)
    end

    # Asynchronous prescaler              factor
    def self.prediv_a : UInt8
      value.prediv_a
    end

    # Asynchronous prescaler              factor
    def self.prediv_a=(value : UInt8) : UInt8
      self.set(prediv_a: value)
      value
    end

    # Synchronous prescaler              factor
    def prediv_s : UInt16
      UInt16.new!((@value >> 0) & 0x7fff_u32)
    end

    # Synchronous prescaler              factor
    def self.prediv_s : UInt16
      value.prediv_s
    end

    # Synchronous prescaler              factor
    def self.prediv_s=(value : UInt16) : UInt16
      self.set(prediv_s: value)
      value
    end

    def copy_with(
      *,

      prediv_a : UInt8? = nil,

      prediv_s : UInt16? = nil
    ) : self
      value = @value

      unless prediv_a.nil?
        value = (value & 0xff80ffff_u32) |
                UInt32.new!(prediv_a.to_int).&(0x7f_u32) << 16
      end

      unless prediv_s.nil?
        value = (value & 0xffff8000_u32) |
                UInt32.new!(prediv_s.to_int).&(0x7fff_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      prediv_a : UInt8? = nil,
      prediv_s : UInt16? = nil
    ) : Nil
      self.value = self.value.copy_with(
        prediv_a: prediv_a,
        prediv_s: prediv_s,
      )
    end
  end # struct

  # wakeup timer register
  struct WUTR
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
      new(0xffff_u64)
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

    # Wakeup auto-reload value              bits
    def wut : UInt16
      UInt16.new!((@value >> 0) & 0xffff_u32)
    end

    # Wakeup auto-reload value              bits
    def self.wut : UInt16
      value.wut
    end

    # Wakeup auto-reload value              bits
    def self.wut=(value : UInt16) : UInt16
      self.set(wut: value)
      value
    end

    def copy_with(
      *,

      wut : UInt16? = nil
    ) : self
      value = @value

      unless wut.nil?
        value = (value & 0xffff0000_u32) |
                UInt32.new!(wut.to_int).&(0xffff_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      wut : UInt16? = nil
    ) : Nil
      self.value = self.value.copy_with(
        wut: wut,
      )
    end
  end # struct

  # alarm A register
  struct ALRMAR
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

    # Alarm A date mask
    def msk4 : Bool
      @value.bits_set?(0x80000000_u32)
    end

    # Alarm A date mask
    def self.msk4 : Bool
      value.msk4
    end

    # Alarm A date mask
    def self.msk4=(value : Bool) : Bool
      self.set(msk4: value)
      value
    end

    enum WDSEL : UInt8
      # DU[3:0] represents the date units
      DATEUNITS = 0x0_u64

      # DU[3:0] represents the week day. DT[1:0] is don’t care.
      WEEKDAY = 0x1_u64

      def self.reset_value : WDSEL
        ALRMAR.reset_value.wdsel
      end
    end

    # Week day selection
    def wdsel : WDSEL
      WDSEL.new!((@value >> 30) & 0x1_u32)
    end

    # Week day selection
    def self.wdsel : WDSEL
      value.wdsel
    end

    # Week day selection
    def self.wdsel=(value : WDSEL) : WDSEL
      self.set(wdsel: value)
      value
    end

    # Date tens in BCD format
    def dt : UInt8
      UInt8.new!((@value >> 28) & 0x3_u32)
    end

    # Date tens in BCD format
    def self.dt : UInt8
      value.dt
    end

    # Date tens in BCD format
    def self.dt=(value : UInt8) : UInt8
      self.set(dt: value)
      value
    end

    # Date units or day in BCD              format
    def du : UInt8
      UInt8.new!((@value >> 24) & 0xf_u32)
    end

    # Date units or day in BCD              format
    def self.du : UInt8
      value.du
    end

    # Date units or day in BCD              format
    def self.du=(value : UInt8) : UInt8
      self.set(du: value)
      value
    end

    # Alarm A hours mask
    def msk3 : Bool
      @value.bits_set?(0x800000_u32)
    end

    # Alarm A hours mask
    def self.msk3 : Bool
      value.msk3
    end

    # Alarm A hours mask
    def self.msk3=(value : Bool) : Bool
      self.set(msk3: value)
      value
    end

    enum PM : UInt8
      # AM or 24-hour format
      AM = 0x0_u64

      # PM
      PM = 0x1_u64

      def self.reset_value : PM
        ALRMAR.reset_value.pm
      end
    end

    # AM/PM notation
    def pm : PM
      PM.new!((@value >> 22) & 0x1_u32)
    end

    # AM/PM notation
    def self.pm : PM
      value.pm
    end

    # AM/PM notation
    def self.pm=(value : PM) : PM
      self.set(pm: value)
      value
    end

    # Hour tens in BCD format
    def ht : UInt8
      UInt8.new!((@value >> 20) & 0x3_u32)
    end

    # Hour tens in BCD format
    def self.ht : UInt8
      value.ht
    end

    # Hour tens in BCD format
    def self.ht=(value : UInt8) : UInt8
      self.set(ht: value)
      value
    end

    # Hour units in BCD format
    def hu : UInt8
      UInt8.new!((@value >> 16) & 0xf_u32)
    end

    # Hour units in BCD format
    def self.hu : UInt8
      value.hu
    end

    # Hour units in BCD format
    def self.hu=(value : UInt8) : UInt8
      self.set(hu: value)
      value
    end

    # Alarm A minutes mask
    def msk2 : Bool
      @value.bits_set?(0x8000_u32)
    end

    # Alarm A minutes mask
    def self.msk2 : Bool
      value.msk2
    end

    # Alarm A minutes mask
    def self.msk2=(value : Bool) : Bool
      self.set(msk2: value)
      value
    end

    # Minute tens in BCD format
    def mnt : UInt8
      UInt8.new!((@value >> 12) & 0x7_u32)
    end

    # Minute tens in BCD format
    def self.mnt : UInt8
      value.mnt
    end

    # Minute tens in BCD format
    def self.mnt=(value : UInt8) : UInt8
      self.set(mnt: value)
      value
    end

    # Minute units in BCD format
    def mnu : UInt8
      UInt8.new!((@value >> 8) & 0xf_u32)
    end

    # Minute units in BCD format
    def self.mnu : UInt8
      value.mnu
    end

    # Minute units in BCD format
    def self.mnu=(value : UInt8) : UInt8
      self.set(mnu: value)
      value
    end

    enum MSK1 : UInt8
      # Alarm set if the date/day match
      MASK = 0x0_u64

      # Date/day don’t care in Alarm comparison
      NOTMASK = 0x1_u64

      def self.reset_value : MSK1
        ALRMAR.reset_value.msk1
      end
    end

    # Alarm A seconds mask
    def msk1 : MSK1
      MSK1.new!((@value >> 7) & 0x1_u32)
    end

    # Alarm A seconds mask
    def self.msk1 : MSK1
      value.msk1
    end

    # Alarm A seconds mask
    def self.msk1=(value : MSK1) : MSK1
      self.set(msk1: value)
      value
    end

    # Second tens in BCD format
    def st : UInt8
      UInt8.new!((@value >> 4) & 0x7_u32)
    end

    # Second tens in BCD format
    def self.st : UInt8
      value.st
    end

    # Second tens in BCD format
    def self.st=(value : UInt8) : UInt8
      self.set(st: value)
      value
    end

    # Second units in BCD format
    def su : UInt8
      UInt8.new!((@value >> 0) & 0xf_u32)
    end

    # Second units in BCD format
    def self.su : UInt8
      value.su
    end

    # Second units in BCD format
    def self.su=(value : UInt8) : UInt8
      self.set(su: value)
      value
    end

    def copy_with(
      *,

      msk4 : Bool? = nil,

      wdsel : WDSEL? = nil,

      dt : UInt8? = nil,

      du : UInt8? = nil,

      msk3 : Bool? = nil,

      pm : PM? = nil,

      ht : UInt8? = nil,

      hu : UInt8? = nil,

      msk2 : Bool? = nil,

      mnt : UInt8? = nil,

      mnu : UInt8? = nil,

      msk1 : MSK1? = nil,

      st : UInt8? = nil,

      su : UInt8? = nil
    ) : self
      value = @value

      unless msk4.nil?
        value = (value & 0x7fffffff_u32) |
                UInt32.new!(msk4.to_int).&(0x1_u32) << 31
      end

      unless wdsel.nil?
        value = (value & 0xbfffffff_u32) |
                UInt32.new!(wdsel.to_int).&(0x1_u32) << 30
      end

      unless dt.nil?
        value = (value & 0xcfffffff_u32) |
                UInt32.new!(dt.to_int).&(0x3_u32) << 28
      end

      unless du.nil?
        value = (value & 0xf0ffffff_u32) |
                UInt32.new!(du.to_int).&(0xf_u32) << 24
      end

      unless msk3.nil?
        value = (value & 0xff7fffff_u32) |
                UInt32.new!(msk3.to_int).&(0x1_u32) << 23
      end

      unless pm.nil?
        value = (value & 0xffbfffff_u32) |
                UInt32.new!(pm.to_int).&(0x1_u32) << 22
      end

      unless ht.nil?
        value = (value & 0xffcfffff_u32) |
                UInt32.new!(ht.to_int).&(0x3_u32) << 20
      end

      unless hu.nil?
        value = (value & 0xfff0ffff_u32) |
                UInt32.new!(hu.to_int).&(0xf_u32) << 16
      end

      unless msk2.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(msk2.to_int).&(0x1_u32) << 15
      end

      unless mnt.nil?
        value = (value & 0xffff8fff_u32) |
                UInt32.new!(mnt.to_int).&(0x7_u32) << 12
      end

      unless mnu.nil?
        value = (value & 0xfffff0ff_u32) |
                UInt32.new!(mnu.to_int).&(0xf_u32) << 8
      end

      unless msk1.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(msk1.to_int).&(0x1_u32) << 7
      end

      unless st.nil?
        value = (value & 0xffffff8f_u32) |
                UInt32.new!(st.to_int).&(0x7_u32) << 4
      end

      unless su.nil?
        value = (value & 0xfffffff0_u32) |
                UInt32.new!(su.to_int).&(0xf_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      msk4 : Bool? = nil,
      wdsel : WDSEL? = nil,
      dt : UInt8? = nil,
      du : UInt8? = nil,
      msk3 : Bool? = nil,
      pm : PM? = nil,
      ht : UInt8? = nil,
      hu : UInt8? = nil,
      msk2 : Bool? = nil,
      mnt : UInt8? = nil,
      mnu : UInt8? = nil,
      msk1 : MSK1? = nil,
      st : UInt8? = nil,
      su : UInt8? = nil
    ) : Nil
      self.value = self.value.copy_with(
        msk4: msk4,
        wdsel: wdsel,
        dt: dt,
        du: du,
        msk3: msk3,
        pm: pm,
        ht: ht,
        hu: hu,
        msk2: msk2,
        mnt: mnt,
        mnu: mnu,
        msk1: msk1,
        st: st,
        su: su,
      )
    end
  end # struct

  # alarm B register
  struct ALRMBR
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

    # Alarm B date mask
    def msk4 : Bool
      @value.bits_set?(0x80000000_u32)
    end

    # Alarm B date mask
    def self.msk4 : Bool
      value.msk4
    end

    # Alarm B date mask
    def self.msk4=(value : Bool) : Bool
      self.set(msk4: value)
      value
    end

    enum WDSEL : UInt8
      # DU[3:0] represents the date units
      DATEUNITS = 0x0_u64

      # DU[3:0] represents the week day. DT[1:0] is don’t care.
      WEEKDAY = 0x1_u64

      def self.reset_value : WDSEL
        ALRMBR.reset_value.wdsel
      end
    end

    # Week day selection
    def wdsel : WDSEL
      WDSEL.new!((@value >> 30) & 0x1_u32)
    end

    # Week day selection
    def self.wdsel : WDSEL
      value.wdsel
    end

    # Week day selection
    def self.wdsel=(value : WDSEL) : WDSEL
      self.set(wdsel: value)
      value
    end

    # Date tens in BCD format
    def dt : UInt8
      UInt8.new!((@value >> 28) & 0x3_u32)
    end

    # Date tens in BCD format
    def self.dt : UInt8
      value.dt
    end

    # Date tens in BCD format
    def self.dt=(value : UInt8) : UInt8
      self.set(dt: value)
      value
    end

    # Date units or day in BCD              format
    def du : UInt8
      UInt8.new!((@value >> 24) & 0xf_u32)
    end

    # Date units or day in BCD              format
    def self.du : UInt8
      value.du
    end

    # Date units or day in BCD              format
    def self.du=(value : UInt8) : UInt8
      self.set(du: value)
      value
    end

    # Alarm B hours mask
    def msk3 : Bool
      @value.bits_set?(0x800000_u32)
    end

    # Alarm B hours mask
    def self.msk3 : Bool
      value.msk3
    end

    # Alarm B hours mask
    def self.msk3=(value : Bool) : Bool
      self.set(msk3: value)
      value
    end

    enum PM : UInt8
      # AM or 24-hour format
      AM = 0x0_u64

      # PM
      PM = 0x1_u64

      def self.reset_value : PM
        ALRMBR.reset_value.pm
      end
    end

    # AM/PM notation
    def pm : PM
      PM.new!((@value >> 22) & 0x1_u32)
    end

    # AM/PM notation
    def self.pm : PM
      value.pm
    end

    # AM/PM notation
    def self.pm=(value : PM) : PM
      self.set(pm: value)
      value
    end

    # Hour tens in BCD format
    def ht : UInt8
      UInt8.new!((@value >> 20) & 0x3_u32)
    end

    # Hour tens in BCD format
    def self.ht : UInt8
      value.ht
    end

    # Hour tens in BCD format
    def self.ht=(value : UInt8) : UInt8
      self.set(ht: value)
      value
    end

    # Hour units in BCD format
    def hu : UInt8
      UInt8.new!((@value >> 16) & 0xf_u32)
    end

    # Hour units in BCD format
    def self.hu : UInt8
      value.hu
    end

    # Hour units in BCD format
    def self.hu=(value : UInt8) : UInt8
      self.set(hu: value)
      value
    end

    # Alarm B minutes mask
    def msk2 : Bool
      @value.bits_set?(0x8000_u32)
    end

    # Alarm B minutes mask
    def self.msk2 : Bool
      value.msk2
    end

    # Alarm B minutes mask
    def self.msk2=(value : Bool) : Bool
      self.set(msk2: value)
      value
    end

    # Minute tens in BCD format
    def mnt : UInt8
      UInt8.new!((@value >> 12) & 0x7_u32)
    end

    # Minute tens in BCD format
    def self.mnt : UInt8
      value.mnt
    end

    # Minute tens in BCD format
    def self.mnt=(value : UInt8) : UInt8
      self.set(mnt: value)
      value
    end

    # Minute units in BCD format
    def mnu : UInt8
      UInt8.new!((@value >> 8) & 0xf_u32)
    end

    # Minute units in BCD format
    def self.mnu : UInt8
      value.mnu
    end

    # Minute units in BCD format
    def self.mnu=(value : UInt8) : UInt8
      self.set(mnu: value)
      value
    end

    enum MSK1 : UInt8
      # Alarm set if the date/day match
      MASK = 0x0_u64

      # Date/day don’t care in Alarm comparison
      NOTMASK = 0x1_u64

      def self.reset_value : MSK1
        ALRMBR.reset_value.msk1
      end
    end

    # Alarm B seconds mask
    def msk1 : MSK1
      MSK1.new!((@value >> 7) & 0x1_u32)
    end

    # Alarm B seconds mask
    def self.msk1 : MSK1
      value.msk1
    end

    # Alarm B seconds mask
    def self.msk1=(value : MSK1) : MSK1
      self.set(msk1: value)
      value
    end

    # Second tens in BCD format
    def st : UInt8
      UInt8.new!((@value >> 4) & 0x7_u32)
    end

    # Second tens in BCD format
    def self.st : UInt8
      value.st
    end

    # Second tens in BCD format
    def self.st=(value : UInt8) : UInt8
      self.set(st: value)
      value
    end

    # Second units in BCD format
    def su : UInt8
      UInt8.new!((@value >> 0) & 0xf_u32)
    end

    # Second units in BCD format
    def self.su : UInt8
      value.su
    end

    # Second units in BCD format
    def self.su=(value : UInt8) : UInt8
      self.set(su: value)
      value
    end

    def copy_with(
      *,

      msk4 : Bool? = nil,

      wdsel : WDSEL? = nil,

      dt : UInt8? = nil,

      du : UInt8? = nil,

      msk3 : Bool? = nil,

      pm : PM? = nil,

      ht : UInt8? = nil,

      hu : UInt8? = nil,

      msk2 : Bool? = nil,

      mnt : UInt8? = nil,

      mnu : UInt8? = nil,

      msk1 : MSK1? = nil,

      st : UInt8? = nil,

      su : UInt8? = nil
    ) : self
      value = @value

      unless msk4.nil?
        value = (value & 0x7fffffff_u32) |
                UInt32.new!(msk4.to_int).&(0x1_u32) << 31
      end

      unless wdsel.nil?
        value = (value & 0xbfffffff_u32) |
                UInt32.new!(wdsel.to_int).&(0x1_u32) << 30
      end

      unless dt.nil?
        value = (value & 0xcfffffff_u32) |
                UInt32.new!(dt.to_int).&(0x3_u32) << 28
      end

      unless du.nil?
        value = (value & 0xf0ffffff_u32) |
                UInt32.new!(du.to_int).&(0xf_u32) << 24
      end

      unless msk3.nil?
        value = (value & 0xff7fffff_u32) |
                UInt32.new!(msk3.to_int).&(0x1_u32) << 23
      end

      unless pm.nil?
        value = (value & 0xffbfffff_u32) |
                UInt32.new!(pm.to_int).&(0x1_u32) << 22
      end

      unless ht.nil?
        value = (value & 0xffcfffff_u32) |
                UInt32.new!(ht.to_int).&(0x3_u32) << 20
      end

      unless hu.nil?
        value = (value & 0xfff0ffff_u32) |
                UInt32.new!(hu.to_int).&(0xf_u32) << 16
      end

      unless msk2.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(msk2.to_int).&(0x1_u32) << 15
      end

      unless mnt.nil?
        value = (value & 0xffff8fff_u32) |
                UInt32.new!(mnt.to_int).&(0x7_u32) << 12
      end

      unless mnu.nil?
        value = (value & 0xfffff0ff_u32) |
                UInt32.new!(mnu.to_int).&(0xf_u32) << 8
      end

      unless msk1.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(msk1.to_int).&(0x1_u32) << 7
      end

      unless st.nil?
        value = (value & 0xffffff8f_u32) |
                UInt32.new!(st.to_int).&(0x7_u32) << 4
      end

      unless su.nil?
        value = (value & 0xfffffff0_u32) |
                UInt32.new!(su.to_int).&(0xf_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      msk4 : Bool? = nil,
      wdsel : WDSEL? = nil,
      dt : UInt8? = nil,
      du : UInt8? = nil,
      msk3 : Bool? = nil,
      pm : PM? = nil,
      ht : UInt8? = nil,
      hu : UInt8? = nil,
      msk2 : Bool? = nil,
      mnt : UInt8? = nil,
      mnu : UInt8? = nil,
      msk1 : MSK1? = nil,
      st : UInt8? = nil,
      su : UInt8? = nil
    ) : Nil
      self.value = self.value.copy_with(
        msk4: msk4,
        wdsel: wdsel,
        dt: dt,
        du: du,
        msk3: msk3,
        pm: pm,
        ht: ht,
        hu: hu,
        msk2: msk2,
        mnt: mnt,
        mnu: mnu,
        msk1: msk1,
        st: st,
        su: su,
      )
    end
  end # struct

  # write protection register
  struct WPR
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

    # Write protection key
    def self.key=(value : UInt8) : UInt8
      self.set(key: value)
      value
    end

    def copy_with(
      *,

      key : UInt8? = nil
    ) : self
      value = @value

      unless key.nil?
        value = (value & 0xffffff00_u32) |
                UInt32.new!(key.to_int).&(0xff_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      key : UInt8? = nil
    ) : Nil
      self.value = self.value.copy_with(
        key: key,
      )
    end
  end # struct

  # sub second register
  struct SSR
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

    # Sub second value
    def ss : UInt16
      UInt16.new!((@value >> 0) & 0xffff_u32)
    end

    # Sub second value
    def self.ss : UInt16
      value.ss
    end
  end # struct

  # shift control register
  struct SHIFTR
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

    enum ADD1S : UInt8
      # Add one second to the clock/calendar
      ADD1 = 0x1_u64

      def self.reset_value : ADD1S
        SHIFTR.reset_value.add1_s
      end
    end

    # Add one second
    def self.add1_s=(value : ADD1S) : ADD1S
      self.set(add1_s: value)
      value
    end

    # Subtract a fraction of a              second
    def self.subfs=(value : UInt16) : UInt16
      self.set(subfs: value)
      value
    end

    def copy_with(
      *,

      add1_s : ADD1S? = nil,

      subfs : UInt16? = nil
    ) : self
      value = @value

      unless add1_s.nil?
        value = (value & 0x7fffffff_u32) |
                UInt32.new!(add1_s.to_int).&(0x1_u32) << 31
      end

      unless subfs.nil?
        value = (value & 0xffff8000_u32) |
                UInt32.new!(subfs.to_int).&(0x7fff_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      add1_s : ADD1S? = nil,
      subfs : UInt16? = nil
    ) : Nil
      self.value = self.value.copy_with(
        add1_s: add1_s,
        subfs: subfs,
      )
    end
  end # struct

  # time stamp time register
  struct TSTR
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

    # Second units in BCD format
    def su : UInt8
      UInt8.new!((@value >> 0) & 0xf_u32)
    end

    # Second units in BCD format
    def self.su : UInt8
      value.su
    end

    # Second tens in BCD format
    def st : UInt8
      UInt8.new!((@value >> 4) & 0x7_u32)
    end

    # Second tens in BCD format
    def self.st : UInt8
      value.st
    end

    # Minute units in BCD format
    def mnu : UInt8
      UInt8.new!((@value >> 8) & 0xf_u32)
    end

    # Minute units in BCD format
    def self.mnu : UInt8
      value.mnu
    end

    # Minute tens in BCD format
    def mnt : UInt8
      UInt8.new!((@value >> 12) & 0x7_u32)
    end

    # Minute tens in BCD format
    def self.mnt : UInt8
      value.mnt
    end

    # Hour units in BCD format
    def hu : UInt8
      UInt8.new!((@value >> 16) & 0xf_u32)
    end

    # Hour units in BCD format
    def self.hu : UInt8
      value.hu
    end

    # Hour tens in BCD format
    def ht : UInt8
      UInt8.new!((@value >> 20) & 0x3_u32)
    end

    # Hour tens in BCD format
    def self.ht : UInt8
      value.ht
    end

    # AM/PM notation
    def pm : Bool
      @value.bits_set?(0x400000_u32)
    end

    # AM/PM notation
    def self.pm : Bool
      value.pm
    end
  end # struct

  # time stamp date register
  struct TSDR
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

    # Week day units
    def wdu : UInt8
      UInt8.new!((@value >> 13) & 0x7_u32)
    end

    # Week day units
    def self.wdu : UInt8
      value.wdu
    end

    # Month tens in BCD format
    def mt : Bool
      @value.bits_set?(0x1000_u32)
    end

    # Month tens in BCD format
    def self.mt : Bool
      value.mt
    end

    # Month units in BCD format
    def mu : UInt8
      UInt8.new!((@value >> 8) & 0xf_u32)
    end

    # Month units in BCD format
    def self.mu : UInt8
      value.mu
    end

    # Date tens in BCD format
    def dt : UInt8
      UInt8.new!((@value >> 4) & 0x3_u32)
    end

    # Date tens in BCD format
    def self.dt : UInt8
      value.dt
    end

    # Date units in BCD format
    def du : UInt8
      UInt8.new!((@value >> 0) & 0xf_u32)
    end

    # Date units in BCD format
    def self.du : UInt8
      value.du
    end
  end # struct

  # timestamp sub second register
  struct TSSSR
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

    # Sub second value
    def ss : UInt16
      UInt16.new!((@value >> 0) & 0xffff_u32)
    end

    # Sub second value
    def self.ss : UInt16
      value.ss
    end
  end # struct

  # calibration register
  struct CALR
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

    enum CALP : UInt8
      # No RTCCLK pulses are added
      NOCHANGE = 0x0_u64

      # One RTCCLK pulse is effectively inserted every 2^11 pulses (frequency increased by 488.5 ppm)
      INCREASEFREQ = 0x1_u64

      def self.reset_value : CALP
        CALR.reset_value.calp
      end
    end

    # Increase frequency of RTC by 488.5              ppm
    def calp : CALP
      CALP.new!((@value >> 15) & 0x1_u32)
    end

    # Increase frequency of RTC by 488.5              ppm
    def self.calp : CALP
      value.calp
    end

    # Increase frequency of RTC by 488.5              ppm
    def self.calp=(value : CALP) : CALP
      self.set(calp: value)
      value
    end

    enum CALW8 : UInt8
      # When CALW8 is set to ‘1’, the 8-second calibration cycle period is selected
      EIGHT_SECOND = 0x1_u64

      def self.reset_value : CALW8
        CALR.reset_value.calw8
      end
    end

    # Use an 8-second calibration cycle              period
    def calw8 : CALW8
      CALW8.new!((@value >> 14) & 0x1_u32)
    end

    # Use an 8-second calibration cycle              period
    def self.calw8 : CALW8
      value.calw8
    end

    # Use an 8-second calibration cycle              period
    def self.calw8=(value : CALW8) : CALW8
      self.set(calw8: value)
      value
    end

    enum CALW16 : UInt8
      # When CALW16 is set to ‘1’, the 16-second calibration cycle period is selected.This bit must not be set to ‘1’ if CALW8=1
      SIXTEEN_SECOND = 0x1_u64

      def self.reset_value : CALW16
        CALR.reset_value.calw16
      end
    end

    # Use a 16-second calibration cycle              period
    def calw16 : CALW16
      CALW16.new!((@value >> 13) & 0x1_u32)
    end

    # Use a 16-second calibration cycle              period
    def self.calw16 : CALW16
      value.calw16
    end

    # Use a 16-second calibration cycle              period
    def self.calw16=(value : CALW16) : CALW16
      self.set(calw16: value)
      value
    end

    # Calibration minus
    def calm : UInt16
      UInt16.new!((@value >> 0) & 0x1ff_u32)
    end

    # Calibration minus
    def self.calm : UInt16
      value.calm
    end

    # Calibration minus
    def self.calm=(value : UInt16) : UInt16
      self.set(calm: value)
      value
    end

    def copy_with(
      *,

      calp : CALP? = nil,

      calw8 : CALW8? = nil,

      calw16 : CALW16? = nil,

      calm : UInt16? = nil
    ) : self
      value = @value

      unless calp.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(calp.to_int).&(0x1_u32) << 15
      end

      unless calw8.nil?
        value = (value & 0xffffbfff_u32) |
                UInt32.new!(calw8.to_int).&(0x1_u32) << 14
      end

      unless calw16.nil?
        value = (value & 0xffffdfff_u32) |
                UInt32.new!(calw16.to_int).&(0x1_u32) << 13
      end

      unless calm.nil?
        value = (value & 0xfffffe00_u32) |
                UInt32.new!(calm.to_int).&(0x1ff_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      calp : CALP? = nil,
      calw8 : CALW8? = nil,
      calw16 : CALW16? = nil,
      calm : UInt16? = nil
    ) : Nil
      self.value = self.value.copy_with(
        calp: calp,
        calw8: calw8,
        calw16: calw16,
        calm: calm,
      )
    end
  end # struct

  # tamper and alternate function configuration          register
  struct TAFCR
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

    enum TAMP1E : UInt8
      # RTC_TAMPx input detection disabled
      DISABLED = 0x0_u64

      # RTC_TAMPx input detection enabled
      ENABLED = 0x1_u64

      def self.reset_value : TAMP1E
        TAFCR.reset_value.tamp1_e
      end
    end

    # Tamper 1 detection enable
    def tamp1_e : TAMP1E
      TAMP1E.new!((@value >> 0) & 0x1_u32)
    end

    # Tamper 1 detection enable
    def self.tamp1_e : TAMP1E
      value.tamp1_e
    end

    # Tamper 1 detection enable
    def self.tamp1_e=(value : TAMP1E) : TAMP1E
      self.set(tamp1_e: value)
      value
    end

    enum TAMP1TRG : UInt8
      # If TAMPFLT = 00: RTC_TAMPx input rising edge triggers a tamper detection event. If TAMPFLT ≠ 00: RTC_TAMPx input staying low triggers a tamper detection event.
      RISINGEDGE = 0x0_u64

      # If TAMPFLT = 00: RTC_TAMPx input staying high triggers a tamper detection event. If TAMPFLT ≠ 00: RTC_TAMPx input falling edge triggers a tamper detection event
      FALLINGEDGE = 0x1_u64

      def self.reset_value : TAMP1TRG
        TAFCR.reset_value.tamp1_trg
      end
    end

    # Active level for tamper 1
    def tamp1_trg : TAMP1TRG
      TAMP1TRG.new!((@value >> 1) & 0x1_u32)
    end

    # Active level for tamper 1
    def self.tamp1_trg : TAMP1TRG
      value.tamp1_trg
    end

    # Active level for tamper 1
    def self.tamp1_trg=(value : TAMP1TRG) : TAMP1TRG
      self.set(tamp1_trg: value)
      value
    end

    enum TAMPIE : UInt8
      # Tamper interrupt disabled
      DISABLED = 0x0_u64

      # Tamper interrupt enabled
      ENABLED = 0x1_u64

      def self.reset_value : TAMPIE
        TAFCR.reset_value.tampie
      end
    end

    # Tamper interrupt enable
    def tampie : TAMPIE
      TAMPIE.new!((@value >> 2) & 0x1_u32)
    end

    # Tamper interrupt enable
    def self.tampie : TAMPIE
      value.tampie
    end

    # Tamper interrupt enable
    def self.tampie=(value : TAMPIE) : TAMPIE
      self.set(tampie: value)
      value
    end

    # Tamper 2 detection enable
    def tamp2_e : Bool
      @value.bits_set?(0x8_u32)
    end

    # Tamper 2 detection enable
    def self.tamp2_e : Bool
      value.tamp2_e
    end

    # Tamper 2 detection enable
    def self.tamp2_e=(value : Bool) : Bool
      self.set(tamp2_e: value)
      value
    end

    # Active level for tamper 2
    def tamp2_trg : Bool
      @value.bits_set?(0x10_u32)
    end

    # Active level for tamper 2
    def self.tamp2_trg : Bool
      value.tamp2_trg
    end

    # Active level for tamper 2
    def self.tamp2_trg=(value : Bool) : Bool
      self.set(tamp2_trg: value)
      value
    end

    # Tamper 3 detection enable
    def tamp3_e : Bool
      @value.bits_set?(0x20_u32)
    end

    # Tamper 3 detection enable
    def self.tamp3_e : Bool
      value.tamp3_e
    end

    # Tamper 3 detection enable
    def self.tamp3_e=(value : Bool) : Bool
      self.set(tamp3_e: value)
      value
    end

    # Active level for tamper 3
    def tamp3_trg : Bool
      @value.bits_set?(0x40_u32)
    end

    # Active level for tamper 3
    def self.tamp3_trg : Bool
      value.tamp3_trg
    end

    # Active level for tamper 3
    def self.tamp3_trg=(value : Bool) : Bool
      self.set(tamp3_trg: value)
      value
    end

    enum TAMPTS : UInt8
      # Tamper detection event does not cause a timestamp to be saved
      NOSAVE = 0x0_u64

      # Save timestamp on tamper detection event
      SAVE = 0x1_u64

      def self.reset_value : TAMPTS
        TAFCR.reset_value.tampts
      end
    end

    # Activate timestamp on tamper detection              event
    def tampts : TAMPTS
      TAMPTS.new!((@value >> 7) & 0x1_u32)
    end

    # Activate timestamp on tamper detection              event
    def self.tampts : TAMPTS
      value.tampts
    end

    # Activate timestamp on tamper detection              event
    def self.tampts=(value : TAMPTS) : TAMPTS
      self.set(tampts: value)
      value
    end

    enum TAMPFREQ : UInt8
      # RTCCLK / 32768 (1 Hz when RTCCLK = 32768 Hz)
      DIV32768 = 0x0_u64

      # RTCCLK / 16384 (2 Hz when RTCCLK = 32768 Hz)
      DIV16384 = 0x1_u64

      # RTCCLK / 8192 (4 Hz when RTCCLK = 32768 Hz)
      DIV8192 = 0x2_u64

      # RTCCLK / 4096 (8 Hz when RTCCLK = 32768 Hz)
      DIV4096 = 0x3_u64

      # RTCCLK / 2048 (16 Hz when RTCCLK = 32768 Hz)
      DIV2048 = 0x4_u64

      # RTCCLK / 1024 (32 Hz when RTCCLK = 32768 Hz)
      DIV1024 = 0x5_u64

      # RTCCLK / 512 (64 Hz when RTCCLK = 32768 Hz)
      DIV512 = 0x6_u64

      # RTCCLK / 256 (128 Hz when RTCCLK = 32768 Hz)
      DIV256 = 0x7_u64

      def self.reset_value : TAMPFREQ
        TAFCR.reset_value.tampfreq
      end
    end

    # Tamper sampling frequency
    def tampfreq : TAMPFREQ
      TAMPFREQ.new!((@value >> 8) & 0x7_u32)
    end

    # Tamper sampling frequency
    def self.tampfreq : TAMPFREQ
      value.tampfreq
    end

    # Tamper sampling frequency
    def self.tampfreq=(value : TAMPFREQ) : TAMPFREQ
      self.set(tampfreq: value)
      value
    end

    enum TAMPFLT : UInt8
      # Tamper event is activated on edge of RTC_TAMPx input transitions to the active level (no internal pull-up on RTC_TAMPx input)
      IMMEDIATE = 0x0_u64

      # Tamper event is activated after 2 consecutive samples at the active level
      SAMPLES2 = 0x1_u64

      # Tamper event is activated after 4 consecutive samples at the active level
      SAMPLES4 = 0x2_u64

      # Tamper event is activated after 8 consecutive samples at the active level
      SAMPLES8 = 0x3_u64

      def self.reset_value : TAMPFLT
        TAFCR.reset_value.tampflt
      end
    end

    # Tamper filter count
    def tampflt : TAMPFLT
      TAMPFLT.new!((@value >> 11) & 0x3_u32)
    end

    # Tamper filter count
    def self.tampflt : TAMPFLT
      value.tampflt
    end

    # Tamper filter count
    def self.tampflt=(value : TAMPFLT) : TAMPFLT
      self.set(tampflt: value)
      value
    end

    enum TAMPPRCH : UInt8
      # 1 RTCCLK cycle
      CYCLES1 = 0x0_u64

      # 2 RTCCLK cycles
      CYCLES2 = 0x1_u64

      # 4 RTCCLK cycles
      CYCLES4 = 0x2_u64

      # 8 RTCCLK cycles
      CYCLES8 = 0x3_u64

      def self.reset_value : TAMPPRCH
        TAFCR.reset_value.tampprch
      end
    end

    # Tamper precharge duration
    def tampprch : TAMPPRCH
      TAMPPRCH.new!((@value >> 13) & 0x3_u32)
    end

    # Tamper precharge duration
    def self.tampprch : TAMPPRCH
      value.tampprch
    end

    # Tamper precharge duration
    def self.tampprch=(value : TAMPPRCH) : TAMPPRCH
      self.set(tampprch: value)
      value
    end

    enum TAMPPUDIS : UInt8
      # Precharge RTC_TAMPx pins before sampling (enable internal pull-up)
      ENABLED = 0x0_u64

      # Disable precharge of RTC_TAMPx pins
      DISABLED = 0x1_u64

      def self.reset_value : TAMPPUDIS
        TAFCR.reset_value.tamppudis
      end
    end

    # TAMPER pull-up disable
    def tamppudis : TAMPPUDIS
      TAMPPUDIS.new!((@value >> 15) & 0x1_u32)
    end

    # TAMPER pull-up disable
    def self.tamppudis : TAMPPUDIS
      value.tamppudis
    end

    # TAMPER pull-up disable
    def self.tamppudis=(value : TAMPPUDIS) : TAMPPUDIS
      self.set(tamppudis: value)
      value
    end

    enum PC13VALUE : UInt8
      # If the LSE is disabled and PCxMODE = 1, set PCxVALUE to logic high
      HIGH = 0x1_u64

      # If the LSE is disabled and PCxMODE = 1, set PCxVALUE to logic low
      LOW = 0x0_u64

      def self.reset_value : PC13VALUE
        TAFCR.reset_value.pc13_value
      end
    end

    # PC13 value
    def pc13_value : PC13VALUE
      PC13VALUE.new!((@value >> 18) & 0x1_u32)
    end

    # PC13 value
    def self.pc13_value : PC13VALUE
      value.pc13_value
    end

    # PC13 value
    def self.pc13_value=(value : PC13VALUE) : PC13VALUE
      self.set(pc13_value: value)
      value
    end

    enum PC13MODE : UInt8
      # PCx is controlled by the GPIO configuration Register. Consequently PC15 is floating in Standby mode
      FLOATING = 0x0_u64

      # PCx is forced to push-pull output if LSE is disabled
      PUSHPULL = 0x1_u64

      def self.reset_value : PC13MODE
        TAFCR.reset_value.pc13_mode
      end
    end

    # PC13 mode
    def pc13_mode : PC13MODE
      PC13MODE.new!((@value >> 19) & 0x1_u32)
    end

    # PC13 mode
    def self.pc13_mode : PC13MODE
      value.pc13_mode
    end

    # PC13 mode
    def self.pc13_mode=(value : PC13MODE) : PC13MODE
      self.set(pc13_mode: value)
      value
    end

    # PC14 value
    def pc14_value : Bool
      @value.bits_set?(0x100000_u32)
    end

    # PC14 value
    def self.pc14_value : Bool
      value.pc14_value
    end

    # PC14 value
    def self.pc14_value=(value : Bool) : Bool
      self.set(pc14_value: value)
      value
    end

    # PC 14 mode
    def pc14_mode : Bool
      @value.bits_set?(0x200000_u32)
    end

    # PC 14 mode
    def self.pc14_mode : Bool
      value.pc14_mode
    end

    # PC 14 mode
    def self.pc14_mode=(value : Bool) : Bool
      self.set(pc14_mode: value)
      value
    end

    # PC15 value
    def pc15_value : Bool
      @value.bits_set?(0x400000_u32)
    end

    # PC15 value
    def self.pc15_value : Bool
      value.pc15_value
    end

    # PC15 value
    def self.pc15_value=(value : Bool) : Bool
      self.set(pc15_value: value)
      value
    end

    # PC15 mode
    def pc15_mode : Bool
      @value.bits_set?(0x800000_u32)
    end

    # PC15 mode
    def self.pc15_mode : Bool
      value.pc15_mode
    end

    # PC15 mode
    def self.pc15_mode=(value : Bool) : Bool
      self.set(pc15_mode: value)
      value
    end

    def copy_with(
      *,

      tamp1_e : TAMP1E? = nil,

      tamp1_trg : TAMP1TRG? = nil,

      tampie : TAMPIE? = nil,

      tamp2_e : Bool? = nil,

      tamp2_trg : Bool? = nil,

      tamp3_e : Bool? = nil,

      tamp3_trg : Bool? = nil,

      tampts : TAMPTS? = nil,

      tampfreq : TAMPFREQ? = nil,

      tampflt : TAMPFLT? = nil,

      tampprch : TAMPPRCH? = nil,

      tamppudis : TAMPPUDIS? = nil,

      pc13_value : PC13VALUE? = nil,

      pc13_mode : PC13MODE? = nil,

      pc14_value : Bool? = nil,

      pc14_mode : Bool? = nil,

      pc15_value : Bool? = nil,

      pc15_mode : Bool? = nil
    ) : self
      value = @value

      unless tamp1_e.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(tamp1_e.to_int).&(0x1_u32) << 0
      end

      unless tamp1_trg.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(tamp1_trg.to_int).&(0x1_u32) << 1
      end

      unless tampie.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(tampie.to_int).&(0x1_u32) << 2
      end

      unless tamp2_e.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(tamp2_e.to_int).&(0x1_u32) << 3
      end

      unless tamp2_trg.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(tamp2_trg.to_int).&(0x1_u32) << 4
      end

      unless tamp3_e.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(tamp3_e.to_int).&(0x1_u32) << 5
      end

      unless tamp3_trg.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(tamp3_trg.to_int).&(0x1_u32) << 6
      end

      unless tampts.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(tampts.to_int).&(0x1_u32) << 7
      end

      unless tampfreq.nil?
        value = (value & 0xfffff8ff_u32) |
                UInt32.new!(tampfreq.to_int).&(0x7_u32) << 8
      end

      unless tampflt.nil?
        value = (value & 0xffffe7ff_u32) |
                UInt32.new!(tampflt.to_int).&(0x3_u32) << 11
      end

      unless tampprch.nil?
        value = (value & 0xffff9fff_u32) |
                UInt32.new!(tampprch.to_int).&(0x3_u32) << 13
      end

      unless tamppudis.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(tamppudis.to_int).&(0x1_u32) << 15
      end

      unless pc13_value.nil?
        value = (value & 0xfffbffff_u32) |
                UInt32.new!(pc13_value.to_int).&(0x1_u32) << 18
      end

      unless pc13_mode.nil?
        value = (value & 0xfff7ffff_u32) |
                UInt32.new!(pc13_mode.to_int).&(0x1_u32) << 19
      end

      unless pc14_value.nil?
        value = (value & 0xffefffff_u32) |
                UInt32.new!(pc14_value.to_int).&(0x1_u32) << 20
      end

      unless pc14_mode.nil?
        value = (value & 0xffdfffff_u32) |
                UInt32.new!(pc14_mode.to_int).&(0x1_u32) << 21
      end

      unless pc15_value.nil?
        value = (value & 0xffbfffff_u32) |
                UInt32.new!(pc15_value.to_int).&(0x1_u32) << 22
      end

      unless pc15_mode.nil?
        value = (value & 0xff7fffff_u32) |
                UInt32.new!(pc15_mode.to_int).&(0x1_u32) << 23
      end

      self.class.new(value)
    end

    def self.set(
      *,
      tamp1_e : TAMP1E? = nil,
      tamp1_trg : TAMP1TRG? = nil,
      tampie : TAMPIE? = nil,
      tamp2_e : Bool? = nil,
      tamp2_trg : Bool? = nil,
      tamp3_e : Bool? = nil,
      tamp3_trg : Bool? = nil,
      tampts : TAMPTS? = nil,
      tampfreq : TAMPFREQ? = nil,
      tampflt : TAMPFLT? = nil,
      tampprch : TAMPPRCH? = nil,
      tamppudis : TAMPPUDIS? = nil,
      pc13_value : PC13VALUE? = nil,
      pc13_mode : PC13MODE? = nil,
      pc14_value : Bool? = nil,
      pc14_mode : Bool? = nil,
      pc15_value : Bool? = nil,
      pc15_mode : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        tamp1_e: tamp1_e,
        tamp1_trg: tamp1_trg,
        tampie: tampie,
        tamp2_e: tamp2_e,
        tamp2_trg: tamp2_trg,
        tamp3_e: tamp3_e,
        tamp3_trg: tamp3_trg,
        tampts: tampts,
        tampfreq: tampfreq,
        tampflt: tampflt,
        tampprch: tampprch,
        tamppudis: tamppudis,
        pc13_value: pc13_value,
        pc13_mode: pc13_mode,
        pc14_value: pc14_value,
        pc14_mode: pc14_mode,
        pc15_value: pc15_value,
        pc15_mode: pc15_mode,
      )
    end
  end # struct

  # alarm A sub second register
  struct ALRMASSR
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

    # Mask the most-significant bits starting              at this bit
    def maskss : UInt8
      UInt8.new!((@value >> 24) & 0xf_u32)
    end

    # Mask the most-significant bits starting              at this bit
    def self.maskss : UInt8
      value.maskss
    end

    # Mask the most-significant bits starting              at this bit
    def self.maskss=(value : UInt8) : UInt8
      self.set(maskss: value)
      value
    end

    # Sub seconds value
    def ss : UInt16
      UInt16.new!((@value >> 0) & 0x7fff_u32)
    end

    # Sub seconds value
    def self.ss : UInt16
      value.ss
    end

    # Sub seconds value
    def self.ss=(value : UInt16) : UInt16
      self.set(ss: value)
      value
    end

    def copy_with(
      *,

      maskss : UInt8? = nil,

      ss : UInt16? = nil
    ) : self
      value = @value

      unless maskss.nil?
        value = (value & 0xf0ffffff_u32) |
                UInt32.new!(maskss.to_int).&(0xf_u32) << 24
      end

      unless ss.nil?
        value = (value & 0xffff8000_u32) |
                UInt32.new!(ss.to_int).&(0x7fff_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      maskss : UInt8? = nil,
      ss : UInt16? = nil
    ) : Nil
      self.value = self.value.copy_with(
        maskss: maskss,
        ss: ss,
      )
    end
  end # struct

  # alarm B sub second register
  struct ALRMBSSR
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

    # Mask the most-significant bits starting              at this bit
    def maskss : UInt8
      UInt8.new!((@value >> 24) & 0xf_u32)
    end

    # Mask the most-significant bits starting              at this bit
    def self.maskss : UInt8
      value.maskss
    end

    # Mask the most-significant bits starting              at this bit
    def self.maskss=(value : UInt8) : UInt8
      self.set(maskss: value)
      value
    end

    # Sub seconds value
    def ss : UInt16
      UInt16.new!((@value >> 0) & 0x7fff_u32)
    end

    # Sub seconds value
    def self.ss : UInt16
      value.ss
    end

    # Sub seconds value
    def self.ss=(value : UInt16) : UInt16
      self.set(ss: value)
      value
    end

    def copy_with(
      *,

      maskss : UInt8? = nil,

      ss : UInt16? = nil
    ) : self
      value = @value

      unless maskss.nil?
        value = (value & 0xf0ffffff_u32) |
                UInt32.new!(maskss.to_int).&(0xf_u32) << 24
      end

      unless ss.nil?
        value = (value & 0xffff8000_u32) |
                UInt32.new!(ss.to_int).&(0x7fff_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      maskss : UInt8? = nil,
      ss : UInt16? = nil
    ) : Nil
      self.value = self.value.copy_with(
        maskss: maskss,
        ss: ss,
      )
    end
  end # struct

  # backup register
  abstract struct BKPR
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

    # BKP
    def bkp : UInt32
      UInt32.new!((@value >> 0) & 0x0_u32)
    end

    # BKP
    def self.bkp : UInt32
      value.bkp
    end

    # BKP
    def self.bkp=(value : UInt32) : UInt32
      self.set(bkp: value)
      value
    end

    def copy_with(
      *,

      bkp : UInt32? = nil
    ) : self
      value = @value

      unless bkp.nil?
        value = (value & 0xffffffff_u32) |
                UInt32.new!(bkp.to_int).&(0x0_u32) << 0
      end

      self.class.new(value)
    end

    def self.set(
      *,
      bkp : UInt32? = nil
    ) : Nil
      self.value = self.value.copy_with(
        bkp: bkp,
      )
    end
  end # struct

  # dim.instance_name(register.name, dim_index)
  struct BKPR0 < BKPR
    ADDRESS = BASE_ADDRESS + 0x50_u64

    protected def self.address : UInt64
      ADDRESS
    end
  end

  # dim.instance_name(register.name, dim_index)
  struct BKPR1 < BKPR
    ADDRESS = BASE_ADDRESS + 0x54_u64

    protected def self.address : UInt64
      ADDRESS
    end
  end

  # dim.instance_name(register.name, dim_index)
  struct BKPR2 < BKPR
    ADDRESS = BASE_ADDRESS + 0x58_u64

    protected def self.address : UInt64
      ADDRESS
    end
  end

  # dim.instance_name(register.name, dim_index)
  struct BKPR3 < BKPR
    ADDRESS = BASE_ADDRESS + 0x5c_u64

    protected def self.address : UInt64
      ADDRESS
    end
  end

  # dim.instance_name(register.name, dim_index)
  struct BKPR4 < BKPR
    ADDRESS = BASE_ADDRESS + 0x60_u64

    protected def self.address : UInt64
      ADDRESS
    end
  end

  # dim.instance_name(register.name, dim_index)
  struct BKPR5 < BKPR
    ADDRESS = BASE_ADDRESS + 0x64_u64

    protected def self.address : UInt64
      ADDRESS
    end
  end

  # dim.instance_name(register.name, dim_index)
  struct BKPR6 < BKPR
    ADDRESS = BASE_ADDRESS + 0x68_u64

    protected def self.address : UInt64
      ADDRESS
    end
  end

  # dim.instance_name(register.name, dim_index)
  struct BKPR7 < BKPR
    ADDRESS = BASE_ADDRESS + 0x6c_u64

    protected def self.address : UInt64
      ADDRESS
    end
  end

  # dim.instance_name(register.name, dim_index)
  struct BKPR8 < BKPR
    ADDRESS = BASE_ADDRESS + 0x70_u64

    protected def self.address : UInt64
      ADDRESS
    end
  end

  # dim.instance_name(register.name, dim_index)
  struct BKPR9 < BKPR
    ADDRESS = BASE_ADDRESS + 0x74_u64

    protected def self.address : UInt64
      ADDRESS
    end
  end

  # dim.instance_name(register.name, dim_index)
  struct BKPR10 < BKPR
    ADDRESS = BASE_ADDRESS + 0x78_u64

    protected def self.address : UInt64
      ADDRESS
    end
  end

  # dim.instance_name(register.name, dim_index)
  struct BKPR11 < BKPR
    ADDRESS = BASE_ADDRESS + 0x7c_u64

    protected def self.address : UInt64
      ADDRESS
    end
  end

  # dim.instance_name(register.name, dim_index)
  struct BKPR12 < BKPR
    ADDRESS = BASE_ADDRESS + 0x80_u64

    protected def self.address : UInt64
      ADDRESS
    end
  end

  # dim.instance_name(register.name, dim_index)
  struct BKPR13 < BKPR
    ADDRESS = BASE_ADDRESS + 0x84_u64

    protected def self.address : UInt64
      ADDRESS
    end
  end

  # dim.instance_name(register.name, dim_index)
  struct BKPR14 < BKPR
    ADDRESS = BASE_ADDRESS + 0x88_u64

    protected def self.address : UInt64
      ADDRESS
    end
  end

  # dim.instance_name(register.name, dim_index)
  struct BKPR15 < BKPR
    ADDRESS = BASE_ADDRESS + 0x8c_u64

    protected def self.address : UInt64
      ADDRESS
    end
  end

  # dim.instance_name(register.name, dim_index)
  struct BKPR16 < BKPR
    ADDRESS = BASE_ADDRESS + 0x90_u64

    protected def self.address : UInt64
      ADDRESS
    end
  end

  # dim.instance_name(register.name, dim_index)
  struct BKPR17 < BKPR
    ADDRESS = BASE_ADDRESS + 0x94_u64

    protected def self.address : UInt64
      ADDRESS
    end
  end

  # dim.instance_name(register.name, dim_index)
  struct BKPR18 < BKPR
    ADDRESS = BASE_ADDRESS + 0x98_u64

    protected def self.address : UInt64
      ADDRESS
    end
  end

  # dim.instance_name(register.name, dim_index)
  struct BKPR19 < BKPR
    ADDRESS = BASE_ADDRESS + 0x9c_u64

    protected def self.address : UInt64
      ADDRESS
    end
  end

  # dim.instance_name(register.name, dim_index)
  struct BKPR20 < BKPR
    ADDRESS = BASE_ADDRESS + 0xa0_u64

    protected def self.address : UInt64
      ADDRESS
    end
  end

  # dim.instance_name(register.name, dim_index)
  struct BKPR21 < BKPR
    ADDRESS = BASE_ADDRESS + 0xa4_u64

    protected def self.address : UInt64
      ADDRESS
    end
  end

  # dim.instance_name(register.name, dim_index)
  struct BKPR22 < BKPR
    ADDRESS = BASE_ADDRESS + 0xa8_u64

    protected def self.address : UInt64
      ADDRESS
    end
  end

  # dim.instance_name(register.name, dim_index)
  struct BKPR23 < BKPR
    ADDRESS = BASE_ADDRESS + 0xac_u64

    protected def self.address : UInt64
      ADDRESS
    end
  end

  # dim.instance_name(register.name, dim_index)
  struct BKPR24 < BKPR
    ADDRESS = BASE_ADDRESS + 0xb0_u64

    protected def self.address : UInt64
      ADDRESS
    end
  end

  # dim.instance_name(register.name, dim_index)
  struct BKPR25 < BKPR
    ADDRESS = BASE_ADDRESS + 0xb4_u64

    protected def self.address : UInt64
      ADDRESS
    end
  end

  # dim.instance_name(register.name, dim_index)
  struct BKPR26 < BKPR
    ADDRESS = BASE_ADDRESS + 0xb8_u64

    protected def self.address : UInt64
      ADDRESS
    end
  end

  # dim.instance_name(register.name, dim_index)
  struct BKPR27 < BKPR
    ADDRESS = BASE_ADDRESS + 0xbc_u64

    protected def self.address : UInt64
      ADDRESS
    end
  end

  # dim.instance_name(register.name, dim_index)
  struct BKPR28 < BKPR
    ADDRESS = BASE_ADDRESS + 0xc0_u64

    protected def self.address : UInt64
      ADDRESS
    end
  end

  # dim.instance_name(register.name, dim_index)
  struct BKPR29 < BKPR
    ADDRESS = BASE_ADDRESS + 0xc4_u64

    protected def self.address : UInt64
      ADDRESS
    end
  end

  # dim.instance_name(register.name, dim_index)
  struct BKPR30 < BKPR
    ADDRESS = BASE_ADDRESS + 0xc8_u64

    protected def self.address : UInt64
      ADDRESS
    end
  end

  # dim.instance_name(register.name, dim_index)
  struct BKPR31 < BKPR
    ADDRESS = BASE_ADDRESS + 0xcc_u64

    protected def self.address : UInt64
      ADDRESS
    end
  end
end
