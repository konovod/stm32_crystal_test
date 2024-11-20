# DMA controller 1
module DMA1
  VERSION      = nil
  BASE_ADDRESS = 0x40020000_u64

  # DMA interrupt status register          (DMA_ISR)
  struct ISR
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

    enum GIF1 : UInt8
      # No transfer error, half event, complete event
      NOEVENT = 0x0_u64

      # A transfer error, half event or complete event has occured
      EVENT = 0x1_u64

      def self.reset_value : GIF1
        ISR.reset_value.gif1
      end
    end

    # Channel 1 Global interrupt              flag
    def gif1 : GIF1
      GIF1.new!((@value >> 0) & 0x1_u32)
    end

    # Channel 1 Global interrupt              flag
    def self.gif1 : GIF1
      value.gif1
    end

    enum TCIF1 : UInt8
      # No transfer complete event
      NOTCOMPLETE = 0x0_u64

      # A transfer complete event has occured
      COMPLETE = 0x1_u64

      def self.reset_value : TCIF1
        ISR.reset_value.tcif1
      end
    end

    # Channel 1 Transfer Complete              flag
    def tcif1 : TCIF1
      TCIF1.new!((@value >> 1) & 0x1_u32)
    end

    # Channel 1 Transfer Complete              flag
    def self.tcif1 : TCIF1
      value.tcif1
    end

    enum HTIF1 : UInt8
      # No half transfer event
      NOTHALF = 0x0_u64

      # A half transfer event has occured
      HALF = 0x1_u64

      def self.reset_value : HTIF1
        ISR.reset_value.htif1
      end
    end

    # Channel 1 Half Transfer Complete              flag
    def htif1 : HTIF1
      HTIF1.new!((@value >> 2) & 0x1_u32)
    end

    # Channel 1 Half Transfer Complete              flag
    def self.htif1 : HTIF1
      value.htif1
    end

    enum TEIF1 : UInt8
      # No transfer error
      NOERROR = 0x0_u64

      # A transfer error has occured
      ERROR = 0x1_u64

      def self.reset_value : TEIF1
        ISR.reset_value.teif1
      end
    end

    # Channel 1 Transfer Error              flag
    def teif1 : TEIF1
      TEIF1.new!((@value >> 3) & 0x1_u32)
    end

    # Channel 1 Transfer Error              flag
    def self.teif1 : TEIF1
      value.teif1
    end

    # Channel 2 Global interrupt              flag
    def gif2 : Bool
      @value.bits_set?(0x10_u32)
    end

    # Channel 2 Global interrupt              flag
    def self.gif2 : Bool
      value.gif2
    end

    # Channel 2 Transfer Complete              flag
    def tcif2 : Bool
      @value.bits_set?(0x20_u32)
    end

    # Channel 2 Transfer Complete              flag
    def self.tcif2 : Bool
      value.tcif2
    end

    # Channel 2 Half Transfer Complete              flag
    def htif2 : Bool
      @value.bits_set?(0x40_u32)
    end

    # Channel 2 Half Transfer Complete              flag
    def self.htif2 : Bool
      value.htif2
    end

    # Channel 2 Transfer Error              flag
    def teif2 : Bool
      @value.bits_set?(0x80_u32)
    end

    # Channel 2 Transfer Error              flag
    def self.teif2 : Bool
      value.teif2
    end

    # Channel 3 Global interrupt              flag
    def gif3 : Bool
      @value.bits_set?(0x100_u32)
    end

    # Channel 3 Global interrupt              flag
    def self.gif3 : Bool
      value.gif3
    end

    # Channel 3 Transfer Complete              flag
    def tcif3 : Bool
      @value.bits_set?(0x200_u32)
    end

    # Channel 3 Transfer Complete              flag
    def self.tcif3 : Bool
      value.tcif3
    end

    # Channel 3 Half Transfer Complete              flag
    def htif3 : Bool
      @value.bits_set?(0x400_u32)
    end

    # Channel 3 Half Transfer Complete              flag
    def self.htif3 : Bool
      value.htif3
    end

    # Channel 3 Transfer Error              flag
    def teif3 : Bool
      @value.bits_set?(0x800_u32)
    end

    # Channel 3 Transfer Error              flag
    def self.teif3 : Bool
      value.teif3
    end

    # Channel 4 Global interrupt              flag
    def gif4 : Bool
      @value.bits_set?(0x1000_u32)
    end

    # Channel 4 Global interrupt              flag
    def self.gif4 : Bool
      value.gif4
    end

    # Channel 4 Transfer Complete              flag
    def tcif4 : Bool
      @value.bits_set?(0x2000_u32)
    end

    # Channel 4 Transfer Complete              flag
    def self.tcif4 : Bool
      value.tcif4
    end

    # Channel 4 Half Transfer Complete              flag
    def htif4 : Bool
      @value.bits_set?(0x4000_u32)
    end

    # Channel 4 Half Transfer Complete              flag
    def self.htif4 : Bool
      value.htif4
    end

    # Channel 4 Transfer Error              flag
    def teif4 : Bool
      @value.bits_set?(0x8000_u32)
    end

    # Channel 4 Transfer Error              flag
    def self.teif4 : Bool
      value.teif4
    end

    # Channel 5 Global interrupt              flag
    def gif5 : Bool
      @value.bits_set?(0x10000_u32)
    end

    # Channel 5 Global interrupt              flag
    def self.gif5 : Bool
      value.gif5
    end

    # Channel 5 Transfer Complete              flag
    def tcif5 : Bool
      @value.bits_set?(0x20000_u32)
    end

    # Channel 5 Transfer Complete              flag
    def self.tcif5 : Bool
      value.tcif5
    end

    # Channel 5 Half Transfer Complete              flag
    def htif5 : Bool
      @value.bits_set?(0x40000_u32)
    end

    # Channel 5 Half Transfer Complete              flag
    def self.htif5 : Bool
      value.htif5
    end

    # Channel 5 Transfer Error              flag
    def teif5 : Bool
      @value.bits_set?(0x80000_u32)
    end

    # Channel 5 Transfer Error              flag
    def self.teif5 : Bool
      value.teif5
    end

    # Channel 6 Global interrupt              flag
    def gif6 : Bool
      @value.bits_set?(0x100000_u32)
    end

    # Channel 6 Global interrupt              flag
    def self.gif6 : Bool
      value.gif6
    end

    # Channel 6 Transfer Complete              flag
    def tcif6 : Bool
      @value.bits_set?(0x200000_u32)
    end

    # Channel 6 Transfer Complete              flag
    def self.tcif6 : Bool
      value.tcif6
    end

    # Channel 6 Half Transfer Complete              flag
    def htif6 : Bool
      @value.bits_set?(0x400000_u32)
    end

    # Channel 6 Half Transfer Complete              flag
    def self.htif6 : Bool
      value.htif6
    end

    # Channel 6 Transfer Error              flag
    def teif6 : Bool
      @value.bits_set?(0x800000_u32)
    end

    # Channel 6 Transfer Error              flag
    def self.teif6 : Bool
      value.teif6
    end

    # Channel 7 Global interrupt              flag
    def gif7 : Bool
      @value.bits_set?(0x1000000_u32)
    end

    # Channel 7 Global interrupt              flag
    def self.gif7 : Bool
      value.gif7
    end

    # Channel 7 Transfer Complete              flag
    def tcif7 : Bool
      @value.bits_set?(0x2000000_u32)
    end

    # Channel 7 Transfer Complete              flag
    def self.tcif7 : Bool
      value.tcif7
    end

    # Channel 7 Half Transfer Complete              flag
    def htif7 : Bool
      @value.bits_set?(0x4000000_u32)
    end

    # Channel 7 Half Transfer Complete              flag
    def self.htif7 : Bool
      value.htif7
    end

    # Channel 7 Transfer Error              flag
    def teif7 : Bool
      @value.bits_set?(0x8000000_u32)
    end

    # Channel 7 Transfer Error              flag
    def self.teif7 : Bool
      value.teif7
    end
  end # struct

  # DMA interrupt flag clear register          (DMA_IFCR)
  struct IFCR
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

    enum CGIF1 : UInt8
      # Clears the GIF, TEIF, HTIF, TCIF flags in the ISR register
      CLEAR = 0x1_u64

      def self.reset_value : CGIF1
        IFCR.reset_value.cgif1
      end
    end

    # Channel 1 Global interrupt              clear
    def self.cgif1=(value : CGIF1) : CGIF1
      self.set(cgif1: value)
      value
    end

    enum CTCIF1 : UInt8
      # Clears the TCIF flag in the ISR register
      CLEAR = 0x1_u64

      def self.reset_value : CTCIF1
        IFCR.reset_value.ctcif1
      end
    end

    # Channel 1 Transfer Complete              clear
    def self.ctcif1=(value : CTCIF1) : CTCIF1
      self.set(ctcif1: value)
      value
    end

    enum CHTIF1 : UInt8
      # Clears the HTIF flag in the ISR register
      CLEAR = 0x1_u64

      def self.reset_value : CHTIF1
        IFCR.reset_value.chtif1
      end
    end

    # Channel 1 Half Transfer              clear
    def self.chtif1=(value : CHTIF1) : CHTIF1
      self.set(chtif1: value)
      value
    end

    enum CTEIF1 : UInt8
      # Clears the TEIF flag in the ISR register
      CLEAR = 0x1_u64

      def self.reset_value : CTEIF1
        IFCR.reset_value.cteif1
      end
    end

    # Channel 1 Transfer Error              clear
    def self.cteif1=(value : CTEIF1) : CTEIF1
      self.set(cteif1: value)
      value
    end

    # Channel 2 Global interrupt              clear
    def self.cgif2=(value : Bool) : Bool
      self.set(cgif2: value)
      value
    end

    # Channel 2 Transfer Complete              clear
    def self.ctcif2=(value : Bool) : Bool
      self.set(ctcif2: value)
      value
    end

    # Channel 2 Half Transfer              clear
    def self.chtif2=(value : Bool) : Bool
      self.set(chtif2: value)
      value
    end

    # Channel 2 Transfer Error              clear
    def self.cteif2=(value : Bool) : Bool
      self.set(cteif2: value)
      value
    end

    # Channel 3 Global interrupt              clear
    def self.cgif3=(value : Bool) : Bool
      self.set(cgif3: value)
      value
    end

    # Channel 3 Transfer Complete              clear
    def self.ctcif3=(value : Bool) : Bool
      self.set(ctcif3: value)
      value
    end

    # Channel 3 Half Transfer              clear
    def self.chtif3=(value : Bool) : Bool
      self.set(chtif3: value)
      value
    end

    # Channel 3 Transfer Error              clear
    def self.cteif3=(value : Bool) : Bool
      self.set(cteif3: value)
      value
    end

    # Channel 4 Global interrupt              clear
    def self.cgif4=(value : Bool) : Bool
      self.set(cgif4: value)
      value
    end

    # Channel 4 Transfer Complete              clear
    def self.ctcif4=(value : Bool) : Bool
      self.set(ctcif4: value)
      value
    end

    # Channel 4 Half Transfer              clear
    def self.chtif4=(value : Bool) : Bool
      self.set(chtif4: value)
      value
    end

    # Channel 4 Transfer Error              clear
    def self.cteif4=(value : Bool) : Bool
      self.set(cteif4: value)
      value
    end

    # Channel 5 Global interrupt              clear
    def self.cgif5=(value : Bool) : Bool
      self.set(cgif5: value)
      value
    end

    # Channel 5 Transfer Complete              clear
    def self.ctcif5=(value : Bool) : Bool
      self.set(ctcif5: value)
      value
    end

    # Channel 5 Half Transfer              clear
    def self.chtif5=(value : Bool) : Bool
      self.set(chtif5: value)
      value
    end

    # Channel 5 Transfer Error              clear
    def self.cteif5=(value : Bool) : Bool
      self.set(cteif5: value)
      value
    end

    # Channel 6 Global interrupt              clear
    def self.cgif6=(value : Bool) : Bool
      self.set(cgif6: value)
      value
    end

    # Channel 6 Transfer Complete              clear
    def self.ctcif6=(value : Bool) : Bool
      self.set(ctcif6: value)
      value
    end

    # Channel 6 Half Transfer              clear
    def self.chtif6=(value : Bool) : Bool
      self.set(chtif6: value)
      value
    end

    # Channel 6 Transfer Error              clear
    def self.cteif6=(value : Bool) : Bool
      self.set(cteif6: value)
      value
    end

    # Channel 7 Global interrupt              clear
    def self.cgif7=(value : Bool) : Bool
      self.set(cgif7: value)
      value
    end

    # Channel 7 Transfer Complete              clear
    def self.ctcif7=(value : Bool) : Bool
      self.set(ctcif7: value)
      value
    end

    # Channel 7 Half Transfer              clear
    def self.chtif7=(value : Bool) : Bool
      self.set(chtif7: value)
      value
    end

    # Channel 7 Transfer Error              clear
    def self.cteif7=(value : Bool) : Bool
      self.set(cteif7: value)
      value
    end

    def copy_with(
      *,

      cgif1 : CGIF1? = nil,

      ctcif1 : CTCIF1? = nil,

      chtif1 : CHTIF1? = nil,

      cteif1 : CTEIF1? = nil,

      cgif2 : Bool? = nil,

      ctcif2 : Bool? = nil,

      chtif2 : Bool? = nil,

      cteif2 : Bool? = nil,

      cgif3 : Bool? = nil,

      ctcif3 : Bool? = nil,

      chtif3 : Bool? = nil,

      cteif3 : Bool? = nil,

      cgif4 : Bool? = nil,

      ctcif4 : Bool? = nil,

      chtif4 : Bool? = nil,

      cteif4 : Bool? = nil,

      cgif5 : Bool? = nil,

      ctcif5 : Bool? = nil,

      chtif5 : Bool? = nil,

      cteif5 : Bool? = nil,

      cgif6 : Bool? = nil,

      ctcif6 : Bool? = nil,

      chtif6 : Bool? = nil,

      cteif6 : Bool? = nil,

      cgif7 : Bool? = nil,

      ctcif7 : Bool? = nil,

      chtif7 : Bool? = nil,

      cteif7 : Bool? = nil
    ) : self
      value = @value

      unless cgif1.nil?
        value = (value & 0xfffffffe_u32) |
                UInt32.new!(cgif1.to_int).&(0x1_u32) << 0
      end

      unless ctcif1.nil?
        value = (value & 0xfffffffd_u32) |
                UInt32.new!(ctcif1.to_int).&(0x1_u32) << 1
      end

      unless chtif1.nil?
        value = (value & 0xfffffffb_u32) |
                UInt32.new!(chtif1.to_int).&(0x1_u32) << 2
      end

      unless cteif1.nil?
        value = (value & 0xfffffff7_u32) |
                UInt32.new!(cteif1.to_int).&(0x1_u32) << 3
      end

      unless cgif2.nil?
        value = (value & 0xffffffef_u32) |
                UInt32.new!(cgif2.to_int).&(0x1_u32) << 4
      end

      unless ctcif2.nil?
        value = (value & 0xffffffdf_u32) |
                UInt32.new!(ctcif2.to_int).&(0x1_u32) << 5
      end

      unless chtif2.nil?
        value = (value & 0xffffffbf_u32) |
                UInt32.new!(chtif2.to_int).&(0x1_u32) << 6
      end

      unless cteif2.nil?
        value = (value & 0xffffff7f_u32) |
                UInt32.new!(cteif2.to_int).&(0x1_u32) << 7
      end

      unless cgif3.nil?
        value = (value & 0xfffffeff_u32) |
                UInt32.new!(cgif3.to_int).&(0x1_u32) << 8
      end

      unless ctcif3.nil?
        value = (value & 0xfffffdff_u32) |
                UInt32.new!(ctcif3.to_int).&(0x1_u32) << 9
      end

      unless chtif3.nil?
        value = (value & 0xfffffbff_u32) |
                UInt32.new!(chtif3.to_int).&(0x1_u32) << 10
      end

      unless cteif3.nil?
        value = (value & 0xfffff7ff_u32) |
                UInt32.new!(cteif3.to_int).&(0x1_u32) << 11
      end

      unless cgif4.nil?
        value = (value & 0xffffefff_u32) |
                UInt32.new!(cgif4.to_int).&(0x1_u32) << 12
      end

      unless ctcif4.nil?
        value = (value & 0xffffdfff_u32) |
                UInt32.new!(ctcif4.to_int).&(0x1_u32) << 13
      end

      unless chtif4.nil?
        value = (value & 0xffffbfff_u32) |
                UInt32.new!(chtif4.to_int).&(0x1_u32) << 14
      end

      unless cteif4.nil?
        value = (value & 0xffff7fff_u32) |
                UInt32.new!(cteif4.to_int).&(0x1_u32) << 15
      end

      unless cgif5.nil?
        value = (value & 0xfffeffff_u32) |
                UInt32.new!(cgif5.to_int).&(0x1_u32) << 16
      end

      unless ctcif5.nil?
        value = (value & 0xfffdffff_u32) |
                UInt32.new!(ctcif5.to_int).&(0x1_u32) << 17
      end

      unless chtif5.nil?
        value = (value & 0xfffbffff_u32) |
                UInt32.new!(chtif5.to_int).&(0x1_u32) << 18
      end

      unless cteif5.nil?
        value = (value & 0xfff7ffff_u32) |
                UInt32.new!(cteif5.to_int).&(0x1_u32) << 19
      end

      unless cgif6.nil?
        value = (value & 0xffefffff_u32) |
                UInt32.new!(cgif6.to_int).&(0x1_u32) << 20
      end

      unless ctcif6.nil?
        value = (value & 0xffdfffff_u32) |
                UInt32.new!(ctcif6.to_int).&(0x1_u32) << 21
      end

      unless chtif6.nil?
        value = (value & 0xffbfffff_u32) |
                UInt32.new!(chtif6.to_int).&(0x1_u32) << 22
      end

      unless cteif6.nil?
        value = (value & 0xff7fffff_u32) |
                UInt32.new!(cteif6.to_int).&(0x1_u32) << 23
      end

      unless cgif7.nil?
        value = (value & 0xfeffffff_u32) |
                UInt32.new!(cgif7.to_int).&(0x1_u32) << 24
      end

      unless ctcif7.nil?
        value = (value & 0xfdffffff_u32) |
                UInt32.new!(ctcif7.to_int).&(0x1_u32) << 25
      end

      unless chtif7.nil?
        value = (value & 0xfbffffff_u32) |
                UInt32.new!(chtif7.to_int).&(0x1_u32) << 26
      end

      unless cteif7.nil?
        value = (value & 0xf7ffffff_u32) |
                UInt32.new!(cteif7.to_int).&(0x1_u32) << 27
      end

      self.class.new(value)
    end

    def self.set(
      *,
      cgif1 : CGIF1? = nil,
      ctcif1 : CTCIF1? = nil,
      chtif1 : CHTIF1? = nil,
      cteif1 : CTEIF1? = nil,
      cgif2 : Bool? = nil,
      ctcif2 : Bool? = nil,
      chtif2 : Bool? = nil,
      cteif2 : Bool? = nil,
      cgif3 : Bool? = nil,
      ctcif3 : Bool? = nil,
      chtif3 : Bool? = nil,
      cteif3 : Bool? = nil,
      cgif4 : Bool? = nil,
      ctcif4 : Bool? = nil,
      chtif4 : Bool? = nil,
      cteif4 : Bool? = nil,
      cgif5 : Bool? = nil,
      ctcif5 : Bool? = nil,
      chtif5 : Bool? = nil,
      cteif5 : Bool? = nil,
      cgif6 : Bool? = nil,
      ctcif6 : Bool? = nil,
      chtif6 : Bool? = nil,
      cteif6 : Bool? = nil,
      cgif7 : Bool? = nil,
      ctcif7 : Bool? = nil,
      chtif7 : Bool? = nil,
      cteif7 : Bool? = nil
    ) : Nil
      self.value = self.value.copy_with(
        cgif1: cgif1,
        ctcif1: ctcif1,
        chtif1: chtif1,
        cteif1: cteif1,
        cgif2: cgif2,
        ctcif2: ctcif2,
        chtif2: chtif2,
        cteif2: cteif2,
        cgif3: cgif3,
        ctcif3: ctcif3,
        chtif3: chtif3,
        cteif3: cteif3,
        cgif4: cgif4,
        ctcif4: ctcif4,
        chtif4: chtif4,
        cteif4: cteif4,
        cgif5: cgif5,
        ctcif5: ctcif5,
        chtif5: chtif5,
        cteif5: cteif5,
        cgif6: cgif6,
        ctcif6: ctcif6,
        chtif6: chtif6,
        cteif6: cteif6,
        cgif7: cgif7,
        ctcif7: ctcif7,
        chtif7: chtif7,
        cteif7: cteif7,
      )
    end
  end # struct

  # Channel cluster: CCR?, CNDTR?, CPAR?, and CMAR? registers
  module CH0
    BASE_ADDRESS = DMA1::BASE_ADDRESS + 0x8_u64

    # DMA channel configuration register          (DMA_CCR)
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

      enum EN : UInt8
        # Channel disabled
        DISABLED = 0x0_u64

        # Channel enabled
        ENABLED = 0x1_u64

        def self.reset_value : EN
          CR.reset_value.en
        end
      end

      # Channel enable
      def en : EN
        EN.new!((@value >> 0) & 0x1_u32)
      end

      # Channel enable
      def self.en : EN
        value.en
      end

      # Channel enable
      def self.en=(value : EN) : EN
        self.set(en: value)
        value
      end

      enum TCIE : UInt8
        # Transfer Complete interrupt disabled
        DISABLED = 0x0_u64

        # Transfer Complete interrupt enabled
        ENABLED = 0x1_u64

        def self.reset_value : TCIE
          CR.reset_value.tcie
        end
      end

      # Transfer complete interrupt              enable
      def tcie : TCIE
        TCIE.new!((@value >> 1) & 0x1_u32)
      end

      # Transfer complete interrupt              enable
      def self.tcie : TCIE
        value.tcie
      end

      # Transfer complete interrupt              enable
      def self.tcie=(value : TCIE) : TCIE
        self.set(tcie: value)
        value
      end

      enum HTIE : UInt8
        # Half Transfer interrupt disabled
        DISABLED = 0x0_u64

        # Half Transfer interrupt enabled
        ENABLED = 0x1_u64

        def self.reset_value : HTIE
          CR.reset_value.htie
        end
      end

      # Half Transfer interrupt              enable
      def htie : HTIE
        HTIE.new!((@value >> 2) & 0x1_u32)
      end

      # Half Transfer interrupt              enable
      def self.htie : HTIE
        value.htie
      end

      # Half Transfer interrupt              enable
      def self.htie=(value : HTIE) : HTIE
        self.set(htie: value)
        value
      end

      enum TEIE : UInt8
        # Transfer Error interrupt disabled
        DISABLED = 0x0_u64

        # Transfer Error interrupt enabled
        ENABLED = 0x1_u64

        def self.reset_value : TEIE
          CR.reset_value.teie
        end
      end

      # Transfer error interrupt              enable
      def teie : TEIE
        TEIE.new!((@value >> 3) & 0x1_u32)
      end

      # Transfer error interrupt              enable
      def self.teie : TEIE
        value.teie
      end

      # Transfer error interrupt              enable
      def self.teie=(value : TEIE) : TEIE
        self.set(teie: value)
        value
      end

      enum DIR : UInt8
        # Read from peripheral
        FROMPERIPHERAL = 0x0_u64

        # Read from memory
        FROMMEMORY = 0x1_u64

        def self.reset_value : DIR
          CR.reset_value.dir
        end
      end

      # Data transfer direction
      def dir : DIR
        DIR.new!((@value >> 4) & 0x1_u32)
      end

      # Data transfer direction
      def self.dir : DIR
        value.dir
      end

      # Data transfer direction
      def self.dir=(value : DIR) : DIR
        self.set(dir: value)
        value
      end

      enum CIRC : UInt8
        # Circular buffer disabled
        DISABLED = 0x0_u64

        # Circular buffer enabled
        ENABLED = 0x1_u64

        def self.reset_value : CIRC
          CR.reset_value.circ
        end
      end

      # Circular mode
      def circ : CIRC
        CIRC.new!((@value >> 5) & 0x1_u32)
      end

      # Circular mode
      def self.circ : CIRC
        value.circ
      end

      # Circular mode
      def self.circ=(value : CIRC) : CIRC
        self.set(circ: value)
        value
      end

      enum PINC : UInt8
        # Increment mode disabled
        DISABLED = 0x0_u64

        # Increment mode enabled
        ENABLED = 0x1_u64

        def self.reset_value : PINC
          CR.reset_value.pinc
        end
      end

      # Peripheral increment mode
      def pinc : PINC
        PINC.new!((@value >> 6) & 0x1_u32)
      end

      # Peripheral increment mode
      def self.pinc : PINC
        value.pinc
      end

      # Peripheral increment mode
      def self.pinc=(value : PINC) : PINC
        self.set(pinc: value)
        value
      end

      # Memory increment mode
      def minc : Bool
        @value.bits_set?(0x80_u32)
      end

      # Memory increment mode
      def self.minc : Bool
        value.minc
      end

      # Memory increment mode
      def self.minc=(value : Bool) : Bool
        self.set(minc: value)
        value
      end

      enum PSIZE : UInt8
        # 8-bit size
        BITS8 = 0x0_u64

        # 16-bit size
        BITS16 = 0x1_u64

        # 32-bit size
        BITS32 = 0x2_u64

        def self.reset_value : PSIZE
          CR.reset_value.psize
        end
      end

      # Peripheral size
      def psize : PSIZE
        PSIZE.new!((@value >> 8) & 0x3_u32)
      end

      # Peripheral size
      def self.psize : PSIZE
        value.psize
      end

      # Peripheral size
      def self.psize=(value : PSIZE) : PSIZE
        self.set(psize: value)
        value
      end

      # Memory size
      def msize : UInt8
        UInt8.new!((@value >> 10) & 0x3_u32)
      end

      # Memory size
      def self.msize : UInt8
        value.msize
      end

      # Memory size
      def self.msize=(value : UInt8) : UInt8
        self.set(msize: value)
        value
      end

      enum PL : UInt8
        # Low priority
        LOW = 0x0_u64

        # Medium priority
        MEDIUM = 0x1_u64

        # High priority
        HIGH = 0x2_u64

        # Very high priority
        VERYHIGH = 0x3_u64

        def self.reset_value : PL
          CR.reset_value.pl
        end
      end

      # Channel Priority level
      def pl : PL
        PL.new!((@value >> 12) & 0x3_u32)
      end

      # Channel Priority level
      def self.pl : PL
        value.pl
      end

      # Channel Priority level
      def self.pl=(value : PL) : PL
        self.set(pl: value)
        value
      end

      enum MEM2MEM : UInt8
        # Memory to memory mode disabled
        DISABLED = 0x0_u64

        # Memory to memory mode enabled
        ENABLED = 0x1_u64

        def self.reset_value : MEM2MEM
          CR.reset_value.mem2_mem
        end
      end

      # Memory to memory mode
      def mem2_mem : MEM2MEM
        MEM2MEM.new!((@value >> 14) & 0x1_u32)
      end

      # Memory to memory mode
      def self.mem2_mem : MEM2MEM
        value.mem2_mem
      end

      # Memory to memory mode
      def self.mem2_mem=(value : MEM2MEM) : MEM2MEM
        self.set(mem2_mem: value)
        value
      end

      def copy_with(
        *,

        en : EN? = nil,

        tcie : TCIE? = nil,

        htie : HTIE? = nil,

        teie : TEIE? = nil,

        dir : DIR? = nil,

        circ : CIRC? = nil,

        pinc : PINC? = nil,

        minc : Bool? = nil,

        psize : PSIZE? = nil,

        msize : UInt8? = nil,

        pl : PL? = nil,

        mem2_mem : MEM2MEM? = nil
      ) : self
        value = @value

        unless en.nil?
          value = (value & 0xfffffffe_u32) |
                  UInt32.new!(en.to_int).&(0x1_u32) << 0
        end

        unless tcie.nil?
          value = (value & 0xfffffffd_u32) |
                  UInt32.new!(tcie.to_int).&(0x1_u32) << 1
        end

        unless htie.nil?
          value = (value & 0xfffffffb_u32) |
                  UInt32.new!(htie.to_int).&(0x1_u32) << 2
        end

        unless teie.nil?
          value = (value & 0xfffffff7_u32) |
                  UInt32.new!(teie.to_int).&(0x1_u32) << 3
        end

        unless dir.nil?
          value = (value & 0xffffffef_u32) |
                  UInt32.new!(dir.to_int).&(0x1_u32) << 4
        end

        unless circ.nil?
          value = (value & 0xffffffdf_u32) |
                  UInt32.new!(circ.to_int).&(0x1_u32) << 5
        end

        unless pinc.nil?
          value = (value & 0xffffffbf_u32) |
                  UInt32.new!(pinc.to_int).&(0x1_u32) << 6
        end

        unless minc.nil?
          value = (value & 0xffffff7f_u32) |
                  UInt32.new!(minc.to_int).&(0x1_u32) << 7
        end

        unless psize.nil?
          value = (value & 0xfffffcff_u32) |
                  UInt32.new!(psize.to_int).&(0x3_u32) << 8
        end

        unless msize.nil?
          value = (value & 0xfffff3ff_u32) |
                  UInt32.new!(msize.to_int).&(0x3_u32) << 10
        end

        unless pl.nil?
          value = (value & 0xffffcfff_u32) |
                  UInt32.new!(pl.to_int).&(0x3_u32) << 12
        end

        unless mem2_mem.nil?
          value = (value & 0xffffbfff_u32) |
                  UInt32.new!(mem2_mem.to_int).&(0x1_u32) << 14
        end

        self.class.new(value)
      end

      def self.set(
        *,
        en : EN? = nil,
        tcie : TCIE? = nil,
        htie : HTIE? = nil,
        teie : TEIE? = nil,
        dir : DIR? = nil,
        circ : CIRC? = nil,
        pinc : PINC? = nil,
        minc : Bool? = nil,
        psize : PSIZE? = nil,
        msize : UInt8? = nil,
        pl : PL? = nil,
        mem2_mem : MEM2MEM? = nil
      ) : Nil
        self.value = self.value.copy_with(
          en: en,
          tcie: tcie,
          htie: htie,
          teie: teie,
          dir: dir,
          circ: circ,
          pinc: pinc,
          minc: minc,
          psize: psize,
          msize: msize,
          pl: pl,
          mem2_mem: mem2_mem,
        )
      end
    end # struct

    # DMA channel 1 number of data          register
    struct NDTR
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

      # Number of data to transfer
      def ndt : UInt16
        UInt16.new!((@value >> 0) & 0xffff_u32)
      end

      # Number of data to transfer
      def self.ndt : UInt16
        value.ndt
      end

      # Number of data to transfer
      def self.ndt=(value : UInt16) : UInt16
        self.set(ndt: value)
        value
      end

      def copy_with(
        *,

        ndt : UInt16? = nil
      ) : self
        value = @value

        unless ndt.nil?
          value = (value & 0xffff0000_u32) |
                  UInt32.new!(ndt.to_int).&(0xffff_u32) << 0
        end

        self.class.new(value)
      end

      def self.set(
        *,
        ndt : UInt16? = nil
      ) : Nil
        self.value = self.value.copy_with(
          ndt: ndt,
        )
      end
    end # struct

    # DMA channel 1 peripheral address          register
    struct PAR
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

      # Peripheral address
      def pa : UInt32
        UInt32.new!((@value >> 0) & 0x0_u32)
      end

      # Peripheral address
      def self.pa : UInt32
        value.pa
      end

      # Peripheral address
      def self.pa=(value : UInt32) : UInt32
        self.set(pa: value)
        value
      end

      def copy_with(
        *,

        pa : UInt32? = nil
      ) : self
        value = @value

        unless pa.nil?
          value = (value & 0xffffffff_u32) |
                  UInt32.new!(pa.to_int).&(0x0_u32) << 0
        end

        self.class.new(value)
      end

      def self.set(
        *,
        pa : UInt32? = nil
      ) : Nil
        self.value = self.value.copy_with(
          pa: pa,
        )
      end
    end # struct

    # DMA channel 1 memory address          register
    struct MAR
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

      # Memory address
      def ma : UInt32
        UInt32.new!((@value >> 0) & 0x0_u32)
      end

      # Memory address
      def self.ma : UInt32
        value.ma
      end

      # Memory address
      def self.ma=(value : UInt32) : UInt32
        self.set(ma: value)
        value
      end

      def copy_with(
        *,

        ma : UInt32? = nil
      ) : self
        value = @value

        unless ma.nil?
          value = (value & 0xffffffff_u32) |
                  UInt32.new!(ma.to_int).&(0x0_u32) << 0
        end

        self.class.new(value)
      end

      def self.set(
        *,
        ma : UInt32? = nil
      ) : Nil
        self.value = self.value.copy_with(
          ma: ma,
        )
      end
    end # struct

  end

  # Channel cluster: CCR?, CNDTR?, CPAR?, and CMAR? registers
  module CH1
    BASE_ADDRESS = DMA1::BASE_ADDRESS + 0x1c_u64

    # DMA channel configuration register          (DMA_CCR)
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

      enum EN : UInt8
        # Channel disabled
        DISABLED = 0x0_u64

        # Channel enabled
        ENABLED = 0x1_u64

        def self.reset_value : EN
          CR.reset_value.en
        end
      end

      # Channel enable
      def en : EN
        EN.new!((@value >> 0) & 0x1_u32)
      end

      # Channel enable
      def self.en : EN
        value.en
      end

      # Channel enable
      def self.en=(value : EN) : EN
        self.set(en: value)
        value
      end

      enum TCIE : UInt8
        # Transfer Complete interrupt disabled
        DISABLED = 0x0_u64

        # Transfer Complete interrupt enabled
        ENABLED = 0x1_u64

        def self.reset_value : TCIE
          CR.reset_value.tcie
        end
      end

      # Transfer complete interrupt              enable
      def tcie : TCIE
        TCIE.new!((@value >> 1) & 0x1_u32)
      end

      # Transfer complete interrupt              enable
      def self.tcie : TCIE
        value.tcie
      end

      # Transfer complete interrupt              enable
      def self.tcie=(value : TCIE) : TCIE
        self.set(tcie: value)
        value
      end

      enum HTIE : UInt8
        # Half Transfer interrupt disabled
        DISABLED = 0x0_u64

        # Half Transfer interrupt enabled
        ENABLED = 0x1_u64

        def self.reset_value : HTIE
          CR.reset_value.htie
        end
      end

      # Half Transfer interrupt              enable
      def htie : HTIE
        HTIE.new!((@value >> 2) & 0x1_u32)
      end

      # Half Transfer interrupt              enable
      def self.htie : HTIE
        value.htie
      end

      # Half Transfer interrupt              enable
      def self.htie=(value : HTIE) : HTIE
        self.set(htie: value)
        value
      end

      enum TEIE : UInt8
        # Transfer Error interrupt disabled
        DISABLED = 0x0_u64

        # Transfer Error interrupt enabled
        ENABLED = 0x1_u64

        def self.reset_value : TEIE
          CR.reset_value.teie
        end
      end

      # Transfer error interrupt              enable
      def teie : TEIE
        TEIE.new!((@value >> 3) & 0x1_u32)
      end

      # Transfer error interrupt              enable
      def self.teie : TEIE
        value.teie
      end

      # Transfer error interrupt              enable
      def self.teie=(value : TEIE) : TEIE
        self.set(teie: value)
        value
      end

      enum DIR : UInt8
        # Read from peripheral
        FROMPERIPHERAL = 0x0_u64

        # Read from memory
        FROMMEMORY = 0x1_u64

        def self.reset_value : DIR
          CR.reset_value.dir
        end
      end

      # Data transfer direction
      def dir : DIR
        DIR.new!((@value >> 4) & 0x1_u32)
      end

      # Data transfer direction
      def self.dir : DIR
        value.dir
      end

      # Data transfer direction
      def self.dir=(value : DIR) : DIR
        self.set(dir: value)
        value
      end

      enum CIRC : UInt8
        # Circular buffer disabled
        DISABLED = 0x0_u64

        # Circular buffer enabled
        ENABLED = 0x1_u64

        def self.reset_value : CIRC
          CR.reset_value.circ
        end
      end

      # Circular mode
      def circ : CIRC
        CIRC.new!((@value >> 5) & 0x1_u32)
      end

      # Circular mode
      def self.circ : CIRC
        value.circ
      end

      # Circular mode
      def self.circ=(value : CIRC) : CIRC
        self.set(circ: value)
        value
      end

      enum PINC : UInt8
        # Increment mode disabled
        DISABLED = 0x0_u64

        # Increment mode enabled
        ENABLED = 0x1_u64

        def self.reset_value : PINC
          CR.reset_value.pinc
        end
      end

      # Peripheral increment mode
      def pinc : PINC
        PINC.new!((@value >> 6) & 0x1_u32)
      end

      # Peripheral increment mode
      def self.pinc : PINC
        value.pinc
      end

      # Peripheral increment mode
      def self.pinc=(value : PINC) : PINC
        self.set(pinc: value)
        value
      end

      # Memory increment mode
      def minc : Bool
        @value.bits_set?(0x80_u32)
      end

      # Memory increment mode
      def self.minc : Bool
        value.minc
      end

      # Memory increment mode
      def self.minc=(value : Bool) : Bool
        self.set(minc: value)
        value
      end

      enum PSIZE : UInt8
        # 8-bit size
        BITS8 = 0x0_u64

        # 16-bit size
        BITS16 = 0x1_u64

        # 32-bit size
        BITS32 = 0x2_u64

        def self.reset_value : PSIZE
          CR.reset_value.psize
        end
      end

      # Peripheral size
      def psize : PSIZE
        PSIZE.new!((@value >> 8) & 0x3_u32)
      end

      # Peripheral size
      def self.psize : PSIZE
        value.psize
      end

      # Peripheral size
      def self.psize=(value : PSIZE) : PSIZE
        self.set(psize: value)
        value
      end

      # Memory size
      def msize : UInt8
        UInt8.new!((@value >> 10) & 0x3_u32)
      end

      # Memory size
      def self.msize : UInt8
        value.msize
      end

      # Memory size
      def self.msize=(value : UInt8) : UInt8
        self.set(msize: value)
        value
      end

      enum PL : UInt8
        # Low priority
        LOW = 0x0_u64

        # Medium priority
        MEDIUM = 0x1_u64

        # High priority
        HIGH = 0x2_u64

        # Very high priority
        VERYHIGH = 0x3_u64

        def self.reset_value : PL
          CR.reset_value.pl
        end
      end

      # Channel Priority level
      def pl : PL
        PL.new!((@value >> 12) & 0x3_u32)
      end

      # Channel Priority level
      def self.pl : PL
        value.pl
      end

      # Channel Priority level
      def self.pl=(value : PL) : PL
        self.set(pl: value)
        value
      end

      enum MEM2MEM : UInt8
        # Memory to memory mode disabled
        DISABLED = 0x0_u64

        # Memory to memory mode enabled
        ENABLED = 0x1_u64

        def self.reset_value : MEM2MEM
          CR.reset_value.mem2_mem
        end
      end

      # Memory to memory mode
      def mem2_mem : MEM2MEM
        MEM2MEM.new!((@value >> 14) & 0x1_u32)
      end

      # Memory to memory mode
      def self.mem2_mem : MEM2MEM
        value.mem2_mem
      end

      # Memory to memory mode
      def self.mem2_mem=(value : MEM2MEM) : MEM2MEM
        self.set(mem2_mem: value)
        value
      end

      def copy_with(
        *,

        en : EN? = nil,

        tcie : TCIE? = nil,

        htie : HTIE? = nil,

        teie : TEIE? = nil,

        dir : DIR? = nil,

        circ : CIRC? = nil,

        pinc : PINC? = nil,

        minc : Bool? = nil,

        psize : PSIZE? = nil,

        msize : UInt8? = nil,

        pl : PL? = nil,

        mem2_mem : MEM2MEM? = nil
      ) : self
        value = @value

        unless en.nil?
          value = (value & 0xfffffffe_u32) |
                  UInt32.new!(en.to_int).&(0x1_u32) << 0
        end

        unless tcie.nil?
          value = (value & 0xfffffffd_u32) |
                  UInt32.new!(tcie.to_int).&(0x1_u32) << 1
        end

        unless htie.nil?
          value = (value & 0xfffffffb_u32) |
                  UInt32.new!(htie.to_int).&(0x1_u32) << 2
        end

        unless teie.nil?
          value = (value & 0xfffffff7_u32) |
                  UInt32.new!(teie.to_int).&(0x1_u32) << 3
        end

        unless dir.nil?
          value = (value & 0xffffffef_u32) |
                  UInt32.new!(dir.to_int).&(0x1_u32) << 4
        end

        unless circ.nil?
          value = (value & 0xffffffdf_u32) |
                  UInt32.new!(circ.to_int).&(0x1_u32) << 5
        end

        unless pinc.nil?
          value = (value & 0xffffffbf_u32) |
                  UInt32.new!(pinc.to_int).&(0x1_u32) << 6
        end

        unless minc.nil?
          value = (value & 0xffffff7f_u32) |
                  UInt32.new!(minc.to_int).&(0x1_u32) << 7
        end

        unless psize.nil?
          value = (value & 0xfffffcff_u32) |
                  UInt32.new!(psize.to_int).&(0x3_u32) << 8
        end

        unless msize.nil?
          value = (value & 0xfffff3ff_u32) |
                  UInt32.new!(msize.to_int).&(0x3_u32) << 10
        end

        unless pl.nil?
          value = (value & 0xffffcfff_u32) |
                  UInt32.new!(pl.to_int).&(0x3_u32) << 12
        end

        unless mem2_mem.nil?
          value = (value & 0xffffbfff_u32) |
                  UInt32.new!(mem2_mem.to_int).&(0x1_u32) << 14
        end

        self.class.new(value)
      end

      def self.set(
        *,
        en : EN? = nil,
        tcie : TCIE? = nil,
        htie : HTIE? = nil,
        teie : TEIE? = nil,
        dir : DIR? = nil,
        circ : CIRC? = nil,
        pinc : PINC? = nil,
        minc : Bool? = nil,
        psize : PSIZE? = nil,
        msize : UInt8? = nil,
        pl : PL? = nil,
        mem2_mem : MEM2MEM? = nil
      ) : Nil
        self.value = self.value.copy_with(
          en: en,
          tcie: tcie,
          htie: htie,
          teie: teie,
          dir: dir,
          circ: circ,
          pinc: pinc,
          minc: minc,
          psize: psize,
          msize: msize,
          pl: pl,
          mem2_mem: mem2_mem,
        )
      end
    end # struct

    # DMA channel 1 number of data          register
    struct NDTR
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

      # Number of data to transfer
      def ndt : UInt16
        UInt16.new!((@value >> 0) & 0xffff_u32)
      end

      # Number of data to transfer
      def self.ndt : UInt16
        value.ndt
      end

      # Number of data to transfer
      def self.ndt=(value : UInt16) : UInt16
        self.set(ndt: value)
        value
      end

      def copy_with(
        *,

        ndt : UInt16? = nil
      ) : self
        value = @value

        unless ndt.nil?
          value = (value & 0xffff0000_u32) |
                  UInt32.new!(ndt.to_int).&(0xffff_u32) << 0
        end

        self.class.new(value)
      end

      def self.set(
        *,
        ndt : UInt16? = nil
      ) : Nil
        self.value = self.value.copy_with(
          ndt: ndt,
        )
      end
    end # struct

    # DMA channel 1 peripheral address          register
    struct PAR
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

      # Peripheral address
      def pa : UInt32
        UInt32.new!((@value >> 0) & 0x0_u32)
      end

      # Peripheral address
      def self.pa : UInt32
        value.pa
      end

      # Peripheral address
      def self.pa=(value : UInt32) : UInt32
        self.set(pa: value)
        value
      end

      def copy_with(
        *,

        pa : UInt32? = nil
      ) : self
        value = @value

        unless pa.nil?
          value = (value & 0xffffffff_u32) |
                  UInt32.new!(pa.to_int).&(0x0_u32) << 0
        end

        self.class.new(value)
      end

      def self.set(
        *,
        pa : UInt32? = nil
      ) : Nil
        self.value = self.value.copy_with(
          pa: pa,
        )
      end
    end # struct

    # DMA channel 1 memory address          register
    struct MAR
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

      # Memory address
      def ma : UInt32
        UInt32.new!((@value >> 0) & 0x0_u32)
      end

      # Memory address
      def self.ma : UInt32
        value.ma
      end

      # Memory address
      def self.ma=(value : UInt32) : UInt32
        self.set(ma: value)
        value
      end

      def copy_with(
        *,

        ma : UInt32? = nil
      ) : self
        value = @value

        unless ma.nil?
          value = (value & 0xffffffff_u32) |
                  UInt32.new!(ma.to_int).&(0x0_u32) << 0
        end

        self.class.new(value)
      end

      def self.set(
        *,
        ma : UInt32? = nil
      ) : Nil
        self.value = self.value.copy_with(
          ma: ma,
        )
      end
    end # struct

  end

  # Channel cluster: CCR?, CNDTR?, CPAR?, and CMAR? registers
  module CH2
    BASE_ADDRESS = DMA1::BASE_ADDRESS + 0x30_u64

    # DMA channel configuration register          (DMA_CCR)
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

      enum EN : UInt8
        # Channel disabled
        DISABLED = 0x0_u64

        # Channel enabled
        ENABLED = 0x1_u64

        def self.reset_value : EN
          CR.reset_value.en
        end
      end

      # Channel enable
      def en : EN
        EN.new!((@value >> 0) & 0x1_u32)
      end

      # Channel enable
      def self.en : EN
        value.en
      end

      # Channel enable
      def self.en=(value : EN) : EN
        self.set(en: value)
        value
      end

      enum TCIE : UInt8
        # Transfer Complete interrupt disabled
        DISABLED = 0x0_u64

        # Transfer Complete interrupt enabled
        ENABLED = 0x1_u64

        def self.reset_value : TCIE
          CR.reset_value.tcie
        end
      end

      # Transfer complete interrupt              enable
      def tcie : TCIE
        TCIE.new!((@value >> 1) & 0x1_u32)
      end

      # Transfer complete interrupt              enable
      def self.tcie : TCIE
        value.tcie
      end

      # Transfer complete interrupt              enable
      def self.tcie=(value : TCIE) : TCIE
        self.set(tcie: value)
        value
      end

      enum HTIE : UInt8
        # Half Transfer interrupt disabled
        DISABLED = 0x0_u64

        # Half Transfer interrupt enabled
        ENABLED = 0x1_u64

        def self.reset_value : HTIE
          CR.reset_value.htie
        end
      end

      # Half Transfer interrupt              enable
      def htie : HTIE
        HTIE.new!((@value >> 2) & 0x1_u32)
      end

      # Half Transfer interrupt              enable
      def self.htie : HTIE
        value.htie
      end

      # Half Transfer interrupt              enable
      def self.htie=(value : HTIE) : HTIE
        self.set(htie: value)
        value
      end

      enum TEIE : UInt8
        # Transfer Error interrupt disabled
        DISABLED = 0x0_u64

        # Transfer Error interrupt enabled
        ENABLED = 0x1_u64

        def self.reset_value : TEIE
          CR.reset_value.teie
        end
      end

      # Transfer error interrupt              enable
      def teie : TEIE
        TEIE.new!((@value >> 3) & 0x1_u32)
      end

      # Transfer error interrupt              enable
      def self.teie : TEIE
        value.teie
      end

      # Transfer error interrupt              enable
      def self.teie=(value : TEIE) : TEIE
        self.set(teie: value)
        value
      end

      enum DIR : UInt8
        # Read from peripheral
        FROMPERIPHERAL = 0x0_u64

        # Read from memory
        FROMMEMORY = 0x1_u64

        def self.reset_value : DIR
          CR.reset_value.dir
        end
      end

      # Data transfer direction
      def dir : DIR
        DIR.new!((@value >> 4) & 0x1_u32)
      end

      # Data transfer direction
      def self.dir : DIR
        value.dir
      end

      # Data transfer direction
      def self.dir=(value : DIR) : DIR
        self.set(dir: value)
        value
      end

      enum CIRC : UInt8
        # Circular buffer disabled
        DISABLED = 0x0_u64

        # Circular buffer enabled
        ENABLED = 0x1_u64

        def self.reset_value : CIRC
          CR.reset_value.circ
        end
      end

      # Circular mode
      def circ : CIRC
        CIRC.new!((@value >> 5) & 0x1_u32)
      end

      # Circular mode
      def self.circ : CIRC
        value.circ
      end

      # Circular mode
      def self.circ=(value : CIRC) : CIRC
        self.set(circ: value)
        value
      end

      enum PINC : UInt8
        # Increment mode disabled
        DISABLED = 0x0_u64

        # Increment mode enabled
        ENABLED = 0x1_u64

        def self.reset_value : PINC
          CR.reset_value.pinc
        end
      end

      # Peripheral increment mode
      def pinc : PINC
        PINC.new!((@value >> 6) & 0x1_u32)
      end

      # Peripheral increment mode
      def self.pinc : PINC
        value.pinc
      end

      # Peripheral increment mode
      def self.pinc=(value : PINC) : PINC
        self.set(pinc: value)
        value
      end

      # Memory increment mode
      def minc : Bool
        @value.bits_set?(0x80_u32)
      end

      # Memory increment mode
      def self.minc : Bool
        value.minc
      end

      # Memory increment mode
      def self.minc=(value : Bool) : Bool
        self.set(minc: value)
        value
      end

      enum PSIZE : UInt8
        # 8-bit size
        BITS8 = 0x0_u64

        # 16-bit size
        BITS16 = 0x1_u64

        # 32-bit size
        BITS32 = 0x2_u64

        def self.reset_value : PSIZE
          CR.reset_value.psize
        end
      end

      # Peripheral size
      def psize : PSIZE
        PSIZE.new!((@value >> 8) & 0x3_u32)
      end

      # Peripheral size
      def self.psize : PSIZE
        value.psize
      end

      # Peripheral size
      def self.psize=(value : PSIZE) : PSIZE
        self.set(psize: value)
        value
      end

      # Memory size
      def msize : UInt8
        UInt8.new!((@value >> 10) & 0x3_u32)
      end

      # Memory size
      def self.msize : UInt8
        value.msize
      end

      # Memory size
      def self.msize=(value : UInt8) : UInt8
        self.set(msize: value)
        value
      end

      enum PL : UInt8
        # Low priority
        LOW = 0x0_u64

        # Medium priority
        MEDIUM = 0x1_u64

        # High priority
        HIGH = 0x2_u64

        # Very high priority
        VERYHIGH = 0x3_u64

        def self.reset_value : PL
          CR.reset_value.pl
        end
      end

      # Channel Priority level
      def pl : PL
        PL.new!((@value >> 12) & 0x3_u32)
      end

      # Channel Priority level
      def self.pl : PL
        value.pl
      end

      # Channel Priority level
      def self.pl=(value : PL) : PL
        self.set(pl: value)
        value
      end

      enum MEM2MEM : UInt8
        # Memory to memory mode disabled
        DISABLED = 0x0_u64

        # Memory to memory mode enabled
        ENABLED = 0x1_u64

        def self.reset_value : MEM2MEM
          CR.reset_value.mem2_mem
        end
      end

      # Memory to memory mode
      def mem2_mem : MEM2MEM
        MEM2MEM.new!((@value >> 14) & 0x1_u32)
      end

      # Memory to memory mode
      def self.mem2_mem : MEM2MEM
        value.mem2_mem
      end

      # Memory to memory mode
      def self.mem2_mem=(value : MEM2MEM) : MEM2MEM
        self.set(mem2_mem: value)
        value
      end

      def copy_with(
        *,

        en : EN? = nil,

        tcie : TCIE? = nil,

        htie : HTIE? = nil,

        teie : TEIE? = nil,

        dir : DIR? = nil,

        circ : CIRC? = nil,

        pinc : PINC? = nil,

        minc : Bool? = nil,

        psize : PSIZE? = nil,

        msize : UInt8? = nil,

        pl : PL? = nil,

        mem2_mem : MEM2MEM? = nil
      ) : self
        value = @value

        unless en.nil?
          value = (value & 0xfffffffe_u32) |
                  UInt32.new!(en.to_int).&(0x1_u32) << 0
        end

        unless tcie.nil?
          value = (value & 0xfffffffd_u32) |
                  UInt32.new!(tcie.to_int).&(0x1_u32) << 1
        end

        unless htie.nil?
          value = (value & 0xfffffffb_u32) |
                  UInt32.new!(htie.to_int).&(0x1_u32) << 2
        end

        unless teie.nil?
          value = (value & 0xfffffff7_u32) |
                  UInt32.new!(teie.to_int).&(0x1_u32) << 3
        end

        unless dir.nil?
          value = (value & 0xffffffef_u32) |
                  UInt32.new!(dir.to_int).&(0x1_u32) << 4
        end

        unless circ.nil?
          value = (value & 0xffffffdf_u32) |
                  UInt32.new!(circ.to_int).&(0x1_u32) << 5
        end

        unless pinc.nil?
          value = (value & 0xffffffbf_u32) |
                  UInt32.new!(pinc.to_int).&(0x1_u32) << 6
        end

        unless minc.nil?
          value = (value & 0xffffff7f_u32) |
                  UInt32.new!(minc.to_int).&(0x1_u32) << 7
        end

        unless psize.nil?
          value = (value & 0xfffffcff_u32) |
                  UInt32.new!(psize.to_int).&(0x3_u32) << 8
        end

        unless msize.nil?
          value = (value & 0xfffff3ff_u32) |
                  UInt32.new!(msize.to_int).&(0x3_u32) << 10
        end

        unless pl.nil?
          value = (value & 0xffffcfff_u32) |
                  UInt32.new!(pl.to_int).&(0x3_u32) << 12
        end

        unless mem2_mem.nil?
          value = (value & 0xffffbfff_u32) |
                  UInt32.new!(mem2_mem.to_int).&(0x1_u32) << 14
        end

        self.class.new(value)
      end

      def self.set(
        *,
        en : EN? = nil,
        tcie : TCIE? = nil,
        htie : HTIE? = nil,
        teie : TEIE? = nil,
        dir : DIR? = nil,
        circ : CIRC? = nil,
        pinc : PINC? = nil,
        minc : Bool? = nil,
        psize : PSIZE? = nil,
        msize : UInt8? = nil,
        pl : PL? = nil,
        mem2_mem : MEM2MEM? = nil
      ) : Nil
        self.value = self.value.copy_with(
          en: en,
          tcie: tcie,
          htie: htie,
          teie: teie,
          dir: dir,
          circ: circ,
          pinc: pinc,
          minc: minc,
          psize: psize,
          msize: msize,
          pl: pl,
          mem2_mem: mem2_mem,
        )
      end
    end # struct

    # DMA channel 1 number of data          register
    struct NDTR
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

      # Number of data to transfer
      def ndt : UInt16
        UInt16.new!((@value >> 0) & 0xffff_u32)
      end

      # Number of data to transfer
      def self.ndt : UInt16
        value.ndt
      end

      # Number of data to transfer
      def self.ndt=(value : UInt16) : UInt16
        self.set(ndt: value)
        value
      end

      def copy_with(
        *,

        ndt : UInt16? = nil
      ) : self
        value = @value

        unless ndt.nil?
          value = (value & 0xffff0000_u32) |
                  UInt32.new!(ndt.to_int).&(0xffff_u32) << 0
        end

        self.class.new(value)
      end

      def self.set(
        *,
        ndt : UInt16? = nil
      ) : Nil
        self.value = self.value.copy_with(
          ndt: ndt,
        )
      end
    end # struct

    # DMA channel 1 peripheral address          register
    struct PAR
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

      # Peripheral address
      def pa : UInt32
        UInt32.new!((@value >> 0) & 0x0_u32)
      end

      # Peripheral address
      def self.pa : UInt32
        value.pa
      end

      # Peripheral address
      def self.pa=(value : UInt32) : UInt32
        self.set(pa: value)
        value
      end

      def copy_with(
        *,

        pa : UInt32? = nil
      ) : self
        value = @value

        unless pa.nil?
          value = (value & 0xffffffff_u32) |
                  UInt32.new!(pa.to_int).&(0x0_u32) << 0
        end

        self.class.new(value)
      end

      def self.set(
        *,
        pa : UInt32? = nil
      ) : Nil
        self.value = self.value.copy_with(
          pa: pa,
        )
      end
    end # struct

    # DMA channel 1 memory address          register
    struct MAR
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

      # Memory address
      def ma : UInt32
        UInt32.new!((@value >> 0) & 0x0_u32)
      end

      # Memory address
      def self.ma : UInt32
        value.ma
      end

      # Memory address
      def self.ma=(value : UInt32) : UInt32
        self.set(ma: value)
        value
      end

      def copy_with(
        *,

        ma : UInt32? = nil
      ) : self
        value = @value

        unless ma.nil?
          value = (value & 0xffffffff_u32) |
                  UInt32.new!(ma.to_int).&(0x0_u32) << 0
        end

        self.class.new(value)
      end

      def self.set(
        *,
        ma : UInt32? = nil
      ) : Nil
        self.value = self.value.copy_with(
          ma: ma,
        )
      end
    end # struct

  end

  # Channel cluster: CCR?, CNDTR?, CPAR?, and CMAR? registers
  module CH3
    BASE_ADDRESS = DMA1::BASE_ADDRESS + 0x44_u64

    # DMA channel configuration register          (DMA_CCR)
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

      enum EN : UInt8
        # Channel disabled
        DISABLED = 0x0_u64

        # Channel enabled
        ENABLED = 0x1_u64

        def self.reset_value : EN
          CR.reset_value.en
        end
      end

      # Channel enable
      def en : EN
        EN.new!((@value >> 0) & 0x1_u32)
      end

      # Channel enable
      def self.en : EN
        value.en
      end

      # Channel enable
      def self.en=(value : EN) : EN
        self.set(en: value)
        value
      end

      enum TCIE : UInt8
        # Transfer Complete interrupt disabled
        DISABLED = 0x0_u64

        # Transfer Complete interrupt enabled
        ENABLED = 0x1_u64

        def self.reset_value : TCIE
          CR.reset_value.tcie
        end
      end

      # Transfer complete interrupt              enable
      def tcie : TCIE
        TCIE.new!((@value >> 1) & 0x1_u32)
      end

      # Transfer complete interrupt              enable
      def self.tcie : TCIE
        value.tcie
      end

      # Transfer complete interrupt              enable
      def self.tcie=(value : TCIE) : TCIE
        self.set(tcie: value)
        value
      end

      enum HTIE : UInt8
        # Half Transfer interrupt disabled
        DISABLED = 0x0_u64

        # Half Transfer interrupt enabled
        ENABLED = 0x1_u64

        def self.reset_value : HTIE
          CR.reset_value.htie
        end
      end

      # Half Transfer interrupt              enable
      def htie : HTIE
        HTIE.new!((@value >> 2) & 0x1_u32)
      end

      # Half Transfer interrupt              enable
      def self.htie : HTIE
        value.htie
      end

      # Half Transfer interrupt              enable
      def self.htie=(value : HTIE) : HTIE
        self.set(htie: value)
        value
      end

      enum TEIE : UInt8
        # Transfer Error interrupt disabled
        DISABLED = 0x0_u64

        # Transfer Error interrupt enabled
        ENABLED = 0x1_u64

        def self.reset_value : TEIE
          CR.reset_value.teie
        end
      end

      # Transfer error interrupt              enable
      def teie : TEIE
        TEIE.new!((@value >> 3) & 0x1_u32)
      end

      # Transfer error interrupt              enable
      def self.teie : TEIE
        value.teie
      end

      # Transfer error interrupt              enable
      def self.teie=(value : TEIE) : TEIE
        self.set(teie: value)
        value
      end

      enum DIR : UInt8
        # Read from peripheral
        FROMPERIPHERAL = 0x0_u64

        # Read from memory
        FROMMEMORY = 0x1_u64

        def self.reset_value : DIR
          CR.reset_value.dir
        end
      end

      # Data transfer direction
      def dir : DIR
        DIR.new!((@value >> 4) & 0x1_u32)
      end

      # Data transfer direction
      def self.dir : DIR
        value.dir
      end

      # Data transfer direction
      def self.dir=(value : DIR) : DIR
        self.set(dir: value)
        value
      end

      enum CIRC : UInt8
        # Circular buffer disabled
        DISABLED = 0x0_u64

        # Circular buffer enabled
        ENABLED = 0x1_u64

        def self.reset_value : CIRC
          CR.reset_value.circ
        end
      end

      # Circular mode
      def circ : CIRC
        CIRC.new!((@value >> 5) & 0x1_u32)
      end

      # Circular mode
      def self.circ : CIRC
        value.circ
      end

      # Circular mode
      def self.circ=(value : CIRC) : CIRC
        self.set(circ: value)
        value
      end

      enum PINC : UInt8
        # Increment mode disabled
        DISABLED = 0x0_u64

        # Increment mode enabled
        ENABLED = 0x1_u64

        def self.reset_value : PINC
          CR.reset_value.pinc
        end
      end

      # Peripheral increment mode
      def pinc : PINC
        PINC.new!((@value >> 6) & 0x1_u32)
      end

      # Peripheral increment mode
      def self.pinc : PINC
        value.pinc
      end

      # Peripheral increment mode
      def self.pinc=(value : PINC) : PINC
        self.set(pinc: value)
        value
      end

      # Memory increment mode
      def minc : Bool
        @value.bits_set?(0x80_u32)
      end

      # Memory increment mode
      def self.minc : Bool
        value.minc
      end

      # Memory increment mode
      def self.minc=(value : Bool) : Bool
        self.set(minc: value)
        value
      end

      enum PSIZE : UInt8
        # 8-bit size
        BITS8 = 0x0_u64

        # 16-bit size
        BITS16 = 0x1_u64

        # 32-bit size
        BITS32 = 0x2_u64

        def self.reset_value : PSIZE
          CR.reset_value.psize
        end
      end

      # Peripheral size
      def psize : PSIZE
        PSIZE.new!((@value >> 8) & 0x3_u32)
      end

      # Peripheral size
      def self.psize : PSIZE
        value.psize
      end

      # Peripheral size
      def self.psize=(value : PSIZE) : PSIZE
        self.set(psize: value)
        value
      end

      # Memory size
      def msize : UInt8
        UInt8.new!((@value >> 10) & 0x3_u32)
      end

      # Memory size
      def self.msize : UInt8
        value.msize
      end

      # Memory size
      def self.msize=(value : UInt8) : UInt8
        self.set(msize: value)
        value
      end

      enum PL : UInt8
        # Low priority
        LOW = 0x0_u64

        # Medium priority
        MEDIUM = 0x1_u64

        # High priority
        HIGH = 0x2_u64

        # Very high priority
        VERYHIGH = 0x3_u64

        def self.reset_value : PL
          CR.reset_value.pl
        end
      end

      # Channel Priority level
      def pl : PL
        PL.new!((@value >> 12) & 0x3_u32)
      end

      # Channel Priority level
      def self.pl : PL
        value.pl
      end

      # Channel Priority level
      def self.pl=(value : PL) : PL
        self.set(pl: value)
        value
      end

      enum MEM2MEM : UInt8
        # Memory to memory mode disabled
        DISABLED = 0x0_u64

        # Memory to memory mode enabled
        ENABLED = 0x1_u64

        def self.reset_value : MEM2MEM
          CR.reset_value.mem2_mem
        end
      end

      # Memory to memory mode
      def mem2_mem : MEM2MEM
        MEM2MEM.new!((@value >> 14) & 0x1_u32)
      end

      # Memory to memory mode
      def self.mem2_mem : MEM2MEM
        value.mem2_mem
      end

      # Memory to memory mode
      def self.mem2_mem=(value : MEM2MEM) : MEM2MEM
        self.set(mem2_mem: value)
        value
      end

      def copy_with(
        *,

        en : EN? = nil,

        tcie : TCIE? = nil,

        htie : HTIE? = nil,

        teie : TEIE? = nil,

        dir : DIR? = nil,

        circ : CIRC? = nil,

        pinc : PINC? = nil,

        minc : Bool? = nil,

        psize : PSIZE? = nil,

        msize : UInt8? = nil,

        pl : PL? = nil,

        mem2_mem : MEM2MEM? = nil
      ) : self
        value = @value

        unless en.nil?
          value = (value & 0xfffffffe_u32) |
                  UInt32.new!(en.to_int).&(0x1_u32) << 0
        end

        unless tcie.nil?
          value = (value & 0xfffffffd_u32) |
                  UInt32.new!(tcie.to_int).&(0x1_u32) << 1
        end

        unless htie.nil?
          value = (value & 0xfffffffb_u32) |
                  UInt32.new!(htie.to_int).&(0x1_u32) << 2
        end

        unless teie.nil?
          value = (value & 0xfffffff7_u32) |
                  UInt32.new!(teie.to_int).&(0x1_u32) << 3
        end

        unless dir.nil?
          value = (value & 0xffffffef_u32) |
                  UInt32.new!(dir.to_int).&(0x1_u32) << 4
        end

        unless circ.nil?
          value = (value & 0xffffffdf_u32) |
                  UInt32.new!(circ.to_int).&(0x1_u32) << 5
        end

        unless pinc.nil?
          value = (value & 0xffffffbf_u32) |
                  UInt32.new!(pinc.to_int).&(0x1_u32) << 6
        end

        unless minc.nil?
          value = (value & 0xffffff7f_u32) |
                  UInt32.new!(minc.to_int).&(0x1_u32) << 7
        end

        unless psize.nil?
          value = (value & 0xfffffcff_u32) |
                  UInt32.new!(psize.to_int).&(0x3_u32) << 8
        end

        unless msize.nil?
          value = (value & 0xfffff3ff_u32) |
                  UInt32.new!(msize.to_int).&(0x3_u32) << 10
        end

        unless pl.nil?
          value = (value & 0xffffcfff_u32) |
                  UInt32.new!(pl.to_int).&(0x3_u32) << 12
        end

        unless mem2_mem.nil?
          value = (value & 0xffffbfff_u32) |
                  UInt32.new!(mem2_mem.to_int).&(0x1_u32) << 14
        end

        self.class.new(value)
      end

      def self.set(
        *,
        en : EN? = nil,
        tcie : TCIE? = nil,
        htie : HTIE? = nil,
        teie : TEIE? = nil,
        dir : DIR? = nil,
        circ : CIRC? = nil,
        pinc : PINC? = nil,
        minc : Bool? = nil,
        psize : PSIZE? = nil,
        msize : UInt8? = nil,
        pl : PL? = nil,
        mem2_mem : MEM2MEM? = nil
      ) : Nil
        self.value = self.value.copy_with(
          en: en,
          tcie: tcie,
          htie: htie,
          teie: teie,
          dir: dir,
          circ: circ,
          pinc: pinc,
          minc: minc,
          psize: psize,
          msize: msize,
          pl: pl,
          mem2_mem: mem2_mem,
        )
      end
    end # struct

    # DMA channel 1 number of data          register
    struct NDTR
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

      # Number of data to transfer
      def ndt : UInt16
        UInt16.new!((@value >> 0) & 0xffff_u32)
      end

      # Number of data to transfer
      def self.ndt : UInt16
        value.ndt
      end

      # Number of data to transfer
      def self.ndt=(value : UInt16) : UInt16
        self.set(ndt: value)
        value
      end

      def copy_with(
        *,

        ndt : UInt16? = nil
      ) : self
        value = @value

        unless ndt.nil?
          value = (value & 0xffff0000_u32) |
                  UInt32.new!(ndt.to_int).&(0xffff_u32) << 0
        end

        self.class.new(value)
      end

      def self.set(
        *,
        ndt : UInt16? = nil
      ) : Nil
        self.value = self.value.copy_with(
          ndt: ndt,
        )
      end
    end # struct

    # DMA channel 1 peripheral address          register
    struct PAR
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

      # Peripheral address
      def pa : UInt32
        UInt32.new!((@value >> 0) & 0x0_u32)
      end

      # Peripheral address
      def self.pa : UInt32
        value.pa
      end

      # Peripheral address
      def self.pa=(value : UInt32) : UInt32
        self.set(pa: value)
        value
      end

      def copy_with(
        *,

        pa : UInt32? = nil
      ) : self
        value = @value

        unless pa.nil?
          value = (value & 0xffffffff_u32) |
                  UInt32.new!(pa.to_int).&(0x0_u32) << 0
        end

        self.class.new(value)
      end

      def self.set(
        *,
        pa : UInt32? = nil
      ) : Nil
        self.value = self.value.copy_with(
          pa: pa,
        )
      end
    end # struct

    # DMA channel 1 memory address          register
    struct MAR
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

      # Memory address
      def ma : UInt32
        UInt32.new!((@value >> 0) & 0x0_u32)
      end

      # Memory address
      def self.ma : UInt32
        value.ma
      end

      # Memory address
      def self.ma=(value : UInt32) : UInt32
        self.set(ma: value)
        value
      end

      def copy_with(
        *,

        ma : UInt32? = nil
      ) : self
        value = @value

        unless ma.nil?
          value = (value & 0xffffffff_u32) |
                  UInt32.new!(ma.to_int).&(0x0_u32) << 0
        end

        self.class.new(value)
      end

      def self.set(
        *,
        ma : UInt32? = nil
      ) : Nil
        self.value = self.value.copy_with(
          ma: ma,
        )
      end
    end # struct

  end

  # Channel cluster: CCR?, CNDTR?, CPAR?, and CMAR? registers
  module CH4
    BASE_ADDRESS = DMA1::BASE_ADDRESS + 0x58_u64

    # DMA channel configuration register          (DMA_CCR)
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

      enum EN : UInt8
        # Channel disabled
        DISABLED = 0x0_u64

        # Channel enabled
        ENABLED = 0x1_u64

        def self.reset_value : EN
          CR.reset_value.en
        end
      end

      # Channel enable
      def en : EN
        EN.new!((@value >> 0) & 0x1_u32)
      end

      # Channel enable
      def self.en : EN
        value.en
      end

      # Channel enable
      def self.en=(value : EN) : EN
        self.set(en: value)
        value
      end

      enum TCIE : UInt8
        # Transfer Complete interrupt disabled
        DISABLED = 0x0_u64

        # Transfer Complete interrupt enabled
        ENABLED = 0x1_u64

        def self.reset_value : TCIE
          CR.reset_value.tcie
        end
      end

      # Transfer complete interrupt              enable
      def tcie : TCIE
        TCIE.new!((@value >> 1) & 0x1_u32)
      end

      # Transfer complete interrupt              enable
      def self.tcie : TCIE
        value.tcie
      end

      # Transfer complete interrupt              enable
      def self.tcie=(value : TCIE) : TCIE
        self.set(tcie: value)
        value
      end

      enum HTIE : UInt8
        # Half Transfer interrupt disabled
        DISABLED = 0x0_u64

        # Half Transfer interrupt enabled
        ENABLED = 0x1_u64

        def self.reset_value : HTIE
          CR.reset_value.htie
        end
      end

      # Half Transfer interrupt              enable
      def htie : HTIE
        HTIE.new!((@value >> 2) & 0x1_u32)
      end

      # Half Transfer interrupt              enable
      def self.htie : HTIE
        value.htie
      end

      # Half Transfer interrupt              enable
      def self.htie=(value : HTIE) : HTIE
        self.set(htie: value)
        value
      end

      enum TEIE : UInt8
        # Transfer Error interrupt disabled
        DISABLED = 0x0_u64

        # Transfer Error interrupt enabled
        ENABLED = 0x1_u64

        def self.reset_value : TEIE
          CR.reset_value.teie
        end
      end

      # Transfer error interrupt              enable
      def teie : TEIE
        TEIE.new!((@value >> 3) & 0x1_u32)
      end

      # Transfer error interrupt              enable
      def self.teie : TEIE
        value.teie
      end

      # Transfer error interrupt              enable
      def self.teie=(value : TEIE) : TEIE
        self.set(teie: value)
        value
      end

      enum DIR : UInt8
        # Read from peripheral
        FROMPERIPHERAL = 0x0_u64

        # Read from memory
        FROMMEMORY = 0x1_u64

        def self.reset_value : DIR
          CR.reset_value.dir
        end
      end

      # Data transfer direction
      def dir : DIR
        DIR.new!((@value >> 4) & 0x1_u32)
      end

      # Data transfer direction
      def self.dir : DIR
        value.dir
      end

      # Data transfer direction
      def self.dir=(value : DIR) : DIR
        self.set(dir: value)
        value
      end

      enum CIRC : UInt8
        # Circular buffer disabled
        DISABLED = 0x0_u64

        # Circular buffer enabled
        ENABLED = 0x1_u64

        def self.reset_value : CIRC
          CR.reset_value.circ
        end
      end

      # Circular mode
      def circ : CIRC
        CIRC.new!((@value >> 5) & 0x1_u32)
      end

      # Circular mode
      def self.circ : CIRC
        value.circ
      end

      # Circular mode
      def self.circ=(value : CIRC) : CIRC
        self.set(circ: value)
        value
      end

      enum PINC : UInt8
        # Increment mode disabled
        DISABLED = 0x0_u64

        # Increment mode enabled
        ENABLED = 0x1_u64

        def self.reset_value : PINC
          CR.reset_value.pinc
        end
      end

      # Peripheral increment mode
      def pinc : PINC
        PINC.new!((@value >> 6) & 0x1_u32)
      end

      # Peripheral increment mode
      def self.pinc : PINC
        value.pinc
      end

      # Peripheral increment mode
      def self.pinc=(value : PINC) : PINC
        self.set(pinc: value)
        value
      end

      # Memory increment mode
      def minc : Bool
        @value.bits_set?(0x80_u32)
      end

      # Memory increment mode
      def self.minc : Bool
        value.minc
      end

      # Memory increment mode
      def self.minc=(value : Bool) : Bool
        self.set(minc: value)
        value
      end

      enum PSIZE : UInt8
        # 8-bit size
        BITS8 = 0x0_u64

        # 16-bit size
        BITS16 = 0x1_u64

        # 32-bit size
        BITS32 = 0x2_u64

        def self.reset_value : PSIZE
          CR.reset_value.psize
        end
      end

      # Peripheral size
      def psize : PSIZE
        PSIZE.new!((@value >> 8) & 0x3_u32)
      end

      # Peripheral size
      def self.psize : PSIZE
        value.psize
      end

      # Peripheral size
      def self.psize=(value : PSIZE) : PSIZE
        self.set(psize: value)
        value
      end

      # Memory size
      def msize : UInt8
        UInt8.new!((@value >> 10) & 0x3_u32)
      end

      # Memory size
      def self.msize : UInt8
        value.msize
      end

      # Memory size
      def self.msize=(value : UInt8) : UInt8
        self.set(msize: value)
        value
      end

      enum PL : UInt8
        # Low priority
        LOW = 0x0_u64

        # Medium priority
        MEDIUM = 0x1_u64

        # High priority
        HIGH = 0x2_u64

        # Very high priority
        VERYHIGH = 0x3_u64

        def self.reset_value : PL
          CR.reset_value.pl
        end
      end

      # Channel Priority level
      def pl : PL
        PL.new!((@value >> 12) & 0x3_u32)
      end

      # Channel Priority level
      def self.pl : PL
        value.pl
      end

      # Channel Priority level
      def self.pl=(value : PL) : PL
        self.set(pl: value)
        value
      end

      enum MEM2MEM : UInt8
        # Memory to memory mode disabled
        DISABLED = 0x0_u64

        # Memory to memory mode enabled
        ENABLED = 0x1_u64

        def self.reset_value : MEM2MEM
          CR.reset_value.mem2_mem
        end
      end

      # Memory to memory mode
      def mem2_mem : MEM2MEM
        MEM2MEM.new!((@value >> 14) & 0x1_u32)
      end

      # Memory to memory mode
      def self.mem2_mem : MEM2MEM
        value.mem2_mem
      end

      # Memory to memory mode
      def self.mem2_mem=(value : MEM2MEM) : MEM2MEM
        self.set(mem2_mem: value)
        value
      end

      def copy_with(
        *,

        en : EN? = nil,

        tcie : TCIE? = nil,

        htie : HTIE? = nil,

        teie : TEIE? = nil,

        dir : DIR? = nil,

        circ : CIRC? = nil,

        pinc : PINC? = nil,

        minc : Bool? = nil,

        psize : PSIZE? = nil,

        msize : UInt8? = nil,

        pl : PL? = nil,

        mem2_mem : MEM2MEM? = nil
      ) : self
        value = @value

        unless en.nil?
          value = (value & 0xfffffffe_u32) |
                  UInt32.new!(en.to_int).&(0x1_u32) << 0
        end

        unless tcie.nil?
          value = (value & 0xfffffffd_u32) |
                  UInt32.new!(tcie.to_int).&(0x1_u32) << 1
        end

        unless htie.nil?
          value = (value & 0xfffffffb_u32) |
                  UInt32.new!(htie.to_int).&(0x1_u32) << 2
        end

        unless teie.nil?
          value = (value & 0xfffffff7_u32) |
                  UInt32.new!(teie.to_int).&(0x1_u32) << 3
        end

        unless dir.nil?
          value = (value & 0xffffffef_u32) |
                  UInt32.new!(dir.to_int).&(0x1_u32) << 4
        end

        unless circ.nil?
          value = (value & 0xffffffdf_u32) |
                  UInt32.new!(circ.to_int).&(0x1_u32) << 5
        end

        unless pinc.nil?
          value = (value & 0xffffffbf_u32) |
                  UInt32.new!(pinc.to_int).&(0x1_u32) << 6
        end

        unless minc.nil?
          value = (value & 0xffffff7f_u32) |
                  UInt32.new!(minc.to_int).&(0x1_u32) << 7
        end

        unless psize.nil?
          value = (value & 0xfffffcff_u32) |
                  UInt32.new!(psize.to_int).&(0x3_u32) << 8
        end

        unless msize.nil?
          value = (value & 0xfffff3ff_u32) |
                  UInt32.new!(msize.to_int).&(0x3_u32) << 10
        end

        unless pl.nil?
          value = (value & 0xffffcfff_u32) |
                  UInt32.new!(pl.to_int).&(0x3_u32) << 12
        end

        unless mem2_mem.nil?
          value = (value & 0xffffbfff_u32) |
                  UInt32.new!(mem2_mem.to_int).&(0x1_u32) << 14
        end

        self.class.new(value)
      end

      def self.set(
        *,
        en : EN? = nil,
        tcie : TCIE? = nil,
        htie : HTIE? = nil,
        teie : TEIE? = nil,
        dir : DIR? = nil,
        circ : CIRC? = nil,
        pinc : PINC? = nil,
        minc : Bool? = nil,
        psize : PSIZE? = nil,
        msize : UInt8? = nil,
        pl : PL? = nil,
        mem2_mem : MEM2MEM? = nil
      ) : Nil
        self.value = self.value.copy_with(
          en: en,
          tcie: tcie,
          htie: htie,
          teie: teie,
          dir: dir,
          circ: circ,
          pinc: pinc,
          minc: minc,
          psize: psize,
          msize: msize,
          pl: pl,
          mem2_mem: mem2_mem,
        )
      end
    end # struct

    # DMA channel 1 number of data          register
    struct NDTR
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

      # Number of data to transfer
      def ndt : UInt16
        UInt16.new!((@value >> 0) & 0xffff_u32)
      end

      # Number of data to transfer
      def self.ndt : UInt16
        value.ndt
      end

      # Number of data to transfer
      def self.ndt=(value : UInt16) : UInt16
        self.set(ndt: value)
        value
      end

      def copy_with(
        *,

        ndt : UInt16? = nil
      ) : self
        value = @value

        unless ndt.nil?
          value = (value & 0xffff0000_u32) |
                  UInt32.new!(ndt.to_int).&(0xffff_u32) << 0
        end

        self.class.new(value)
      end

      def self.set(
        *,
        ndt : UInt16? = nil
      ) : Nil
        self.value = self.value.copy_with(
          ndt: ndt,
        )
      end
    end # struct

    # DMA channel 1 peripheral address          register
    struct PAR
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

      # Peripheral address
      def pa : UInt32
        UInt32.new!((@value >> 0) & 0x0_u32)
      end

      # Peripheral address
      def self.pa : UInt32
        value.pa
      end

      # Peripheral address
      def self.pa=(value : UInt32) : UInt32
        self.set(pa: value)
        value
      end

      def copy_with(
        *,

        pa : UInt32? = nil
      ) : self
        value = @value

        unless pa.nil?
          value = (value & 0xffffffff_u32) |
                  UInt32.new!(pa.to_int).&(0x0_u32) << 0
        end

        self.class.new(value)
      end

      def self.set(
        *,
        pa : UInt32? = nil
      ) : Nil
        self.value = self.value.copy_with(
          pa: pa,
        )
      end
    end # struct

    # DMA channel 1 memory address          register
    struct MAR
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

      # Memory address
      def ma : UInt32
        UInt32.new!((@value >> 0) & 0x0_u32)
      end

      # Memory address
      def self.ma : UInt32
        value.ma
      end

      # Memory address
      def self.ma=(value : UInt32) : UInt32
        self.set(ma: value)
        value
      end

      def copy_with(
        *,

        ma : UInt32? = nil
      ) : self
        value = @value

        unless ma.nil?
          value = (value & 0xffffffff_u32) |
                  UInt32.new!(ma.to_int).&(0x0_u32) << 0
        end

        self.class.new(value)
      end

      def self.set(
        *,
        ma : UInt32? = nil
      ) : Nil
        self.value = self.value.copy_with(
          ma: ma,
        )
      end
    end # struct

  end

  # Channel cluster: CCR?, CNDTR?, CPAR?, and CMAR? registers
  module CH5
    BASE_ADDRESS = DMA1::BASE_ADDRESS + 0x6c_u64

    # DMA channel configuration register          (DMA_CCR)
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

      enum EN : UInt8
        # Channel disabled
        DISABLED = 0x0_u64

        # Channel enabled
        ENABLED = 0x1_u64

        def self.reset_value : EN
          CR.reset_value.en
        end
      end

      # Channel enable
      def en : EN
        EN.new!((@value >> 0) & 0x1_u32)
      end

      # Channel enable
      def self.en : EN
        value.en
      end

      # Channel enable
      def self.en=(value : EN) : EN
        self.set(en: value)
        value
      end

      enum TCIE : UInt8
        # Transfer Complete interrupt disabled
        DISABLED = 0x0_u64

        # Transfer Complete interrupt enabled
        ENABLED = 0x1_u64

        def self.reset_value : TCIE
          CR.reset_value.tcie
        end
      end

      # Transfer complete interrupt              enable
      def tcie : TCIE
        TCIE.new!((@value >> 1) & 0x1_u32)
      end

      # Transfer complete interrupt              enable
      def self.tcie : TCIE
        value.tcie
      end

      # Transfer complete interrupt              enable
      def self.tcie=(value : TCIE) : TCIE
        self.set(tcie: value)
        value
      end

      enum HTIE : UInt8
        # Half Transfer interrupt disabled
        DISABLED = 0x0_u64

        # Half Transfer interrupt enabled
        ENABLED = 0x1_u64

        def self.reset_value : HTIE
          CR.reset_value.htie
        end
      end

      # Half Transfer interrupt              enable
      def htie : HTIE
        HTIE.new!((@value >> 2) & 0x1_u32)
      end

      # Half Transfer interrupt              enable
      def self.htie : HTIE
        value.htie
      end

      # Half Transfer interrupt              enable
      def self.htie=(value : HTIE) : HTIE
        self.set(htie: value)
        value
      end

      enum TEIE : UInt8
        # Transfer Error interrupt disabled
        DISABLED = 0x0_u64

        # Transfer Error interrupt enabled
        ENABLED = 0x1_u64

        def self.reset_value : TEIE
          CR.reset_value.teie
        end
      end

      # Transfer error interrupt              enable
      def teie : TEIE
        TEIE.new!((@value >> 3) & 0x1_u32)
      end

      # Transfer error interrupt              enable
      def self.teie : TEIE
        value.teie
      end

      # Transfer error interrupt              enable
      def self.teie=(value : TEIE) : TEIE
        self.set(teie: value)
        value
      end

      enum DIR : UInt8
        # Read from peripheral
        FROMPERIPHERAL = 0x0_u64

        # Read from memory
        FROMMEMORY = 0x1_u64

        def self.reset_value : DIR
          CR.reset_value.dir
        end
      end

      # Data transfer direction
      def dir : DIR
        DIR.new!((@value >> 4) & 0x1_u32)
      end

      # Data transfer direction
      def self.dir : DIR
        value.dir
      end

      # Data transfer direction
      def self.dir=(value : DIR) : DIR
        self.set(dir: value)
        value
      end

      enum CIRC : UInt8
        # Circular buffer disabled
        DISABLED = 0x0_u64

        # Circular buffer enabled
        ENABLED = 0x1_u64

        def self.reset_value : CIRC
          CR.reset_value.circ
        end
      end

      # Circular mode
      def circ : CIRC
        CIRC.new!((@value >> 5) & 0x1_u32)
      end

      # Circular mode
      def self.circ : CIRC
        value.circ
      end

      # Circular mode
      def self.circ=(value : CIRC) : CIRC
        self.set(circ: value)
        value
      end

      enum PINC : UInt8
        # Increment mode disabled
        DISABLED = 0x0_u64

        # Increment mode enabled
        ENABLED = 0x1_u64

        def self.reset_value : PINC
          CR.reset_value.pinc
        end
      end

      # Peripheral increment mode
      def pinc : PINC
        PINC.new!((@value >> 6) & 0x1_u32)
      end

      # Peripheral increment mode
      def self.pinc : PINC
        value.pinc
      end

      # Peripheral increment mode
      def self.pinc=(value : PINC) : PINC
        self.set(pinc: value)
        value
      end

      # Memory increment mode
      def minc : Bool
        @value.bits_set?(0x80_u32)
      end

      # Memory increment mode
      def self.minc : Bool
        value.minc
      end

      # Memory increment mode
      def self.minc=(value : Bool) : Bool
        self.set(minc: value)
        value
      end

      enum PSIZE : UInt8
        # 8-bit size
        BITS8 = 0x0_u64

        # 16-bit size
        BITS16 = 0x1_u64

        # 32-bit size
        BITS32 = 0x2_u64

        def self.reset_value : PSIZE
          CR.reset_value.psize
        end
      end

      # Peripheral size
      def psize : PSIZE
        PSIZE.new!((@value >> 8) & 0x3_u32)
      end

      # Peripheral size
      def self.psize : PSIZE
        value.psize
      end

      # Peripheral size
      def self.psize=(value : PSIZE) : PSIZE
        self.set(psize: value)
        value
      end

      # Memory size
      def msize : UInt8
        UInt8.new!((@value >> 10) & 0x3_u32)
      end

      # Memory size
      def self.msize : UInt8
        value.msize
      end

      # Memory size
      def self.msize=(value : UInt8) : UInt8
        self.set(msize: value)
        value
      end

      enum PL : UInt8
        # Low priority
        LOW = 0x0_u64

        # Medium priority
        MEDIUM = 0x1_u64

        # High priority
        HIGH = 0x2_u64

        # Very high priority
        VERYHIGH = 0x3_u64

        def self.reset_value : PL
          CR.reset_value.pl
        end
      end

      # Channel Priority level
      def pl : PL
        PL.new!((@value >> 12) & 0x3_u32)
      end

      # Channel Priority level
      def self.pl : PL
        value.pl
      end

      # Channel Priority level
      def self.pl=(value : PL) : PL
        self.set(pl: value)
        value
      end

      enum MEM2MEM : UInt8
        # Memory to memory mode disabled
        DISABLED = 0x0_u64

        # Memory to memory mode enabled
        ENABLED = 0x1_u64

        def self.reset_value : MEM2MEM
          CR.reset_value.mem2_mem
        end
      end

      # Memory to memory mode
      def mem2_mem : MEM2MEM
        MEM2MEM.new!((@value >> 14) & 0x1_u32)
      end

      # Memory to memory mode
      def self.mem2_mem : MEM2MEM
        value.mem2_mem
      end

      # Memory to memory mode
      def self.mem2_mem=(value : MEM2MEM) : MEM2MEM
        self.set(mem2_mem: value)
        value
      end

      def copy_with(
        *,

        en : EN? = nil,

        tcie : TCIE? = nil,

        htie : HTIE? = nil,

        teie : TEIE? = nil,

        dir : DIR? = nil,

        circ : CIRC? = nil,

        pinc : PINC? = nil,

        minc : Bool? = nil,

        psize : PSIZE? = nil,

        msize : UInt8? = nil,

        pl : PL? = nil,

        mem2_mem : MEM2MEM? = nil
      ) : self
        value = @value

        unless en.nil?
          value = (value & 0xfffffffe_u32) |
                  UInt32.new!(en.to_int).&(0x1_u32) << 0
        end

        unless tcie.nil?
          value = (value & 0xfffffffd_u32) |
                  UInt32.new!(tcie.to_int).&(0x1_u32) << 1
        end

        unless htie.nil?
          value = (value & 0xfffffffb_u32) |
                  UInt32.new!(htie.to_int).&(0x1_u32) << 2
        end

        unless teie.nil?
          value = (value & 0xfffffff7_u32) |
                  UInt32.new!(teie.to_int).&(0x1_u32) << 3
        end

        unless dir.nil?
          value = (value & 0xffffffef_u32) |
                  UInt32.new!(dir.to_int).&(0x1_u32) << 4
        end

        unless circ.nil?
          value = (value & 0xffffffdf_u32) |
                  UInt32.new!(circ.to_int).&(0x1_u32) << 5
        end

        unless pinc.nil?
          value = (value & 0xffffffbf_u32) |
                  UInt32.new!(pinc.to_int).&(0x1_u32) << 6
        end

        unless minc.nil?
          value = (value & 0xffffff7f_u32) |
                  UInt32.new!(minc.to_int).&(0x1_u32) << 7
        end

        unless psize.nil?
          value = (value & 0xfffffcff_u32) |
                  UInt32.new!(psize.to_int).&(0x3_u32) << 8
        end

        unless msize.nil?
          value = (value & 0xfffff3ff_u32) |
                  UInt32.new!(msize.to_int).&(0x3_u32) << 10
        end

        unless pl.nil?
          value = (value & 0xffffcfff_u32) |
                  UInt32.new!(pl.to_int).&(0x3_u32) << 12
        end

        unless mem2_mem.nil?
          value = (value & 0xffffbfff_u32) |
                  UInt32.new!(mem2_mem.to_int).&(0x1_u32) << 14
        end

        self.class.new(value)
      end

      def self.set(
        *,
        en : EN? = nil,
        tcie : TCIE? = nil,
        htie : HTIE? = nil,
        teie : TEIE? = nil,
        dir : DIR? = nil,
        circ : CIRC? = nil,
        pinc : PINC? = nil,
        minc : Bool? = nil,
        psize : PSIZE? = nil,
        msize : UInt8? = nil,
        pl : PL? = nil,
        mem2_mem : MEM2MEM? = nil
      ) : Nil
        self.value = self.value.copy_with(
          en: en,
          tcie: tcie,
          htie: htie,
          teie: teie,
          dir: dir,
          circ: circ,
          pinc: pinc,
          minc: minc,
          psize: psize,
          msize: msize,
          pl: pl,
          mem2_mem: mem2_mem,
        )
      end
    end # struct

    # DMA channel 1 number of data          register
    struct NDTR
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

      # Number of data to transfer
      def ndt : UInt16
        UInt16.new!((@value >> 0) & 0xffff_u32)
      end

      # Number of data to transfer
      def self.ndt : UInt16
        value.ndt
      end

      # Number of data to transfer
      def self.ndt=(value : UInt16) : UInt16
        self.set(ndt: value)
        value
      end

      def copy_with(
        *,

        ndt : UInt16? = nil
      ) : self
        value = @value

        unless ndt.nil?
          value = (value & 0xffff0000_u32) |
                  UInt32.new!(ndt.to_int).&(0xffff_u32) << 0
        end

        self.class.new(value)
      end

      def self.set(
        *,
        ndt : UInt16? = nil
      ) : Nil
        self.value = self.value.copy_with(
          ndt: ndt,
        )
      end
    end # struct

    # DMA channel 1 peripheral address          register
    struct PAR
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

      # Peripheral address
      def pa : UInt32
        UInt32.new!((@value >> 0) & 0x0_u32)
      end

      # Peripheral address
      def self.pa : UInt32
        value.pa
      end

      # Peripheral address
      def self.pa=(value : UInt32) : UInt32
        self.set(pa: value)
        value
      end

      def copy_with(
        *,

        pa : UInt32? = nil
      ) : self
        value = @value

        unless pa.nil?
          value = (value & 0xffffffff_u32) |
                  UInt32.new!(pa.to_int).&(0x0_u32) << 0
        end

        self.class.new(value)
      end

      def self.set(
        *,
        pa : UInt32? = nil
      ) : Nil
        self.value = self.value.copy_with(
          pa: pa,
        )
      end
    end # struct

    # DMA channel 1 memory address          register
    struct MAR
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

      # Memory address
      def ma : UInt32
        UInt32.new!((@value >> 0) & 0x0_u32)
      end

      # Memory address
      def self.ma : UInt32
        value.ma
      end

      # Memory address
      def self.ma=(value : UInt32) : UInt32
        self.set(ma: value)
        value
      end

      def copy_with(
        *,

        ma : UInt32? = nil
      ) : self
        value = @value

        unless ma.nil?
          value = (value & 0xffffffff_u32) |
                  UInt32.new!(ma.to_int).&(0x0_u32) << 0
        end

        self.class.new(value)
      end

      def self.set(
        *,
        ma : UInt32? = nil
      ) : Nil
        self.value = self.value.copy_with(
          ma: ma,
        )
      end
    end # struct

  end

  # Channel cluster: CCR?, CNDTR?, CPAR?, and CMAR? registers
  module CH6
    BASE_ADDRESS = DMA1::BASE_ADDRESS + 0x80_u64

    # DMA channel configuration register          (DMA_CCR)
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

      enum EN : UInt8
        # Channel disabled
        DISABLED = 0x0_u64

        # Channel enabled
        ENABLED = 0x1_u64

        def self.reset_value : EN
          CR.reset_value.en
        end
      end

      # Channel enable
      def en : EN
        EN.new!((@value >> 0) & 0x1_u32)
      end

      # Channel enable
      def self.en : EN
        value.en
      end

      # Channel enable
      def self.en=(value : EN) : EN
        self.set(en: value)
        value
      end

      enum TCIE : UInt8
        # Transfer Complete interrupt disabled
        DISABLED = 0x0_u64

        # Transfer Complete interrupt enabled
        ENABLED = 0x1_u64

        def self.reset_value : TCIE
          CR.reset_value.tcie
        end
      end

      # Transfer complete interrupt              enable
      def tcie : TCIE
        TCIE.new!((@value >> 1) & 0x1_u32)
      end

      # Transfer complete interrupt              enable
      def self.tcie : TCIE
        value.tcie
      end

      # Transfer complete interrupt              enable
      def self.tcie=(value : TCIE) : TCIE
        self.set(tcie: value)
        value
      end

      enum HTIE : UInt8
        # Half Transfer interrupt disabled
        DISABLED = 0x0_u64

        # Half Transfer interrupt enabled
        ENABLED = 0x1_u64

        def self.reset_value : HTIE
          CR.reset_value.htie
        end
      end

      # Half Transfer interrupt              enable
      def htie : HTIE
        HTIE.new!((@value >> 2) & 0x1_u32)
      end

      # Half Transfer interrupt              enable
      def self.htie : HTIE
        value.htie
      end

      # Half Transfer interrupt              enable
      def self.htie=(value : HTIE) : HTIE
        self.set(htie: value)
        value
      end

      enum TEIE : UInt8
        # Transfer Error interrupt disabled
        DISABLED = 0x0_u64

        # Transfer Error interrupt enabled
        ENABLED = 0x1_u64

        def self.reset_value : TEIE
          CR.reset_value.teie
        end
      end

      # Transfer error interrupt              enable
      def teie : TEIE
        TEIE.new!((@value >> 3) & 0x1_u32)
      end

      # Transfer error interrupt              enable
      def self.teie : TEIE
        value.teie
      end

      # Transfer error interrupt              enable
      def self.teie=(value : TEIE) : TEIE
        self.set(teie: value)
        value
      end

      enum DIR : UInt8
        # Read from peripheral
        FROMPERIPHERAL = 0x0_u64

        # Read from memory
        FROMMEMORY = 0x1_u64

        def self.reset_value : DIR
          CR.reset_value.dir
        end
      end

      # Data transfer direction
      def dir : DIR
        DIR.new!((@value >> 4) & 0x1_u32)
      end

      # Data transfer direction
      def self.dir : DIR
        value.dir
      end

      # Data transfer direction
      def self.dir=(value : DIR) : DIR
        self.set(dir: value)
        value
      end

      enum CIRC : UInt8
        # Circular buffer disabled
        DISABLED = 0x0_u64

        # Circular buffer enabled
        ENABLED = 0x1_u64

        def self.reset_value : CIRC
          CR.reset_value.circ
        end
      end

      # Circular mode
      def circ : CIRC
        CIRC.new!((@value >> 5) & 0x1_u32)
      end

      # Circular mode
      def self.circ : CIRC
        value.circ
      end

      # Circular mode
      def self.circ=(value : CIRC) : CIRC
        self.set(circ: value)
        value
      end

      enum PINC : UInt8
        # Increment mode disabled
        DISABLED = 0x0_u64

        # Increment mode enabled
        ENABLED = 0x1_u64

        def self.reset_value : PINC
          CR.reset_value.pinc
        end
      end

      # Peripheral increment mode
      def pinc : PINC
        PINC.new!((@value >> 6) & 0x1_u32)
      end

      # Peripheral increment mode
      def self.pinc : PINC
        value.pinc
      end

      # Peripheral increment mode
      def self.pinc=(value : PINC) : PINC
        self.set(pinc: value)
        value
      end

      # Memory increment mode
      def minc : Bool
        @value.bits_set?(0x80_u32)
      end

      # Memory increment mode
      def self.minc : Bool
        value.minc
      end

      # Memory increment mode
      def self.minc=(value : Bool) : Bool
        self.set(minc: value)
        value
      end

      enum PSIZE : UInt8
        # 8-bit size
        BITS8 = 0x0_u64

        # 16-bit size
        BITS16 = 0x1_u64

        # 32-bit size
        BITS32 = 0x2_u64

        def self.reset_value : PSIZE
          CR.reset_value.psize
        end
      end

      # Peripheral size
      def psize : PSIZE
        PSIZE.new!((@value >> 8) & 0x3_u32)
      end

      # Peripheral size
      def self.psize : PSIZE
        value.psize
      end

      # Peripheral size
      def self.psize=(value : PSIZE) : PSIZE
        self.set(psize: value)
        value
      end

      # Memory size
      def msize : UInt8
        UInt8.new!((@value >> 10) & 0x3_u32)
      end

      # Memory size
      def self.msize : UInt8
        value.msize
      end

      # Memory size
      def self.msize=(value : UInt8) : UInt8
        self.set(msize: value)
        value
      end

      enum PL : UInt8
        # Low priority
        LOW = 0x0_u64

        # Medium priority
        MEDIUM = 0x1_u64

        # High priority
        HIGH = 0x2_u64

        # Very high priority
        VERYHIGH = 0x3_u64

        def self.reset_value : PL
          CR.reset_value.pl
        end
      end

      # Channel Priority level
      def pl : PL
        PL.new!((@value >> 12) & 0x3_u32)
      end

      # Channel Priority level
      def self.pl : PL
        value.pl
      end

      # Channel Priority level
      def self.pl=(value : PL) : PL
        self.set(pl: value)
        value
      end

      enum MEM2MEM : UInt8
        # Memory to memory mode disabled
        DISABLED = 0x0_u64

        # Memory to memory mode enabled
        ENABLED = 0x1_u64

        def self.reset_value : MEM2MEM
          CR.reset_value.mem2_mem
        end
      end

      # Memory to memory mode
      def mem2_mem : MEM2MEM
        MEM2MEM.new!((@value >> 14) & 0x1_u32)
      end

      # Memory to memory mode
      def self.mem2_mem : MEM2MEM
        value.mem2_mem
      end

      # Memory to memory mode
      def self.mem2_mem=(value : MEM2MEM) : MEM2MEM
        self.set(mem2_mem: value)
        value
      end

      def copy_with(
        *,

        en : EN? = nil,

        tcie : TCIE? = nil,

        htie : HTIE? = nil,

        teie : TEIE? = nil,

        dir : DIR? = nil,

        circ : CIRC? = nil,

        pinc : PINC? = nil,

        minc : Bool? = nil,

        psize : PSIZE? = nil,

        msize : UInt8? = nil,

        pl : PL? = nil,

        mem2_mem : MEM2MEM? = nil
      ) : self
        value = @value

        unless en.nil?
          value = (value & 0xfffffffe_u32) |
                  UInt32.new!(en.to_int).&(0x1_u32) << 0
        end

        unless tcie.nil?
          value = (value & 0xfffffffd_u32) |
                  UInt32.new!(tcie.to_int).&(0x1_u32) << 1
        end

        unless htie.nil?
          value = (value & 0xfffffffb_u32) |
                  UInt32.new!(htie.to_int).&(0x1_u32) << 2
        end

        unless teie.nil?
          value = (value & 0xfffffff7_u32) |
                  UInt32.new!(teie.to_int).&(0x1_u32) << 3
        end

        unless dir.nil?
          value = (value & 0xffffffef_u32) |
                  UInt32.new!(dir.to_int).&(0x1_u32) << 4
        end

        unless circ.nil?
          value = (value & 0xffffffdf_u32) |
                  UInt32.new!(circ.to_int).&(0x1_u32) << 5
        end

        unless pinc.nil?
          value = (value & 0xffffffbf_u32) |
                  UInt32.new!(pinc.to_int).&(0x1_u32) << 6
        end

        unless minc.nil?
          value = (value & 0xffffff7f_u32) |
                  UInt32.new!(minc.to_int).&(0x1_u32) << 7
        end

        unless psize.nil?
          value = (value & 0xfffffcff_u32) |
                  UInt32.new!(psize.to_int).&(0x3_u32) << 8
        end

        unless msize.nil?
          value = (value & 0xfffff3ff_u32) |
                  UInt32.new!(msize.to_int).&(0x3_u32) << 10
        end

        unless pl.nil?
          value = (value & 0xffffcfff_u32) |
                  UInt32.new!(pl.to_int).&(0x3_u32) << 12
        end

        unless mem2_mem.nil?
          value = (value & 0xffffbfff_u32) |
                  UInt32.new!(mem2_mem.to_int).&(0x1_u32) << 14
        end

        self.class.new(value)
      end

      def self.set(
        *,
        en : EN? = nil,
        tcie : TCIE? = nil,
        htie : HTIE? = nil,
        teie : TEIE? = nil,
        dir : DIR? = nil,
        circ : CIRC? = nil,
        pinc : PINC? = nil,
        minc : Bool? = nil,
        psize : PSIZE? = nil,
        msize : UInt8? = nil,
        pl : PL? = nil,
        mem2_mem : MEM2MEM? = nil
      ) : Nil
        self.value = self.value.copy_with(
          en: en,
          tcie: tcie,
          htie: htie,
          teie: teie,
          dir: dir,
          circ: circ,
          pinc: pinc,
          minc: minc,
          psize: psize,
          msize: msize,
          pl: pl,
          mem2_mem: mem2_mem,
        )
      end
    end # struct

    # DMA channel 1 number of data          register
    struct NDTR
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

      # Number of data to transfer
      def ndt : UInt16
        UInt16.new!((@value >> 0) & 0xffff_u32)
      end

      # Number of data to transfer
      def self.ndt : UInt16
        value.ndt
      end

      # Number of data to transfer
      def self.ndt=(value : UInt16) : UInt16
        self.set(ndt: value)
        value
      end

      def copy_with(
        *,

        ndt : UInt16? = nil
      ) : self
        value = @value

        unless ndt.nil?
          value = (value & 0xffff0000_u32) |
                  UInt32.new!(ndt.to_int).&(0xffff_u32) << 0
        end

        self.class.new(value)
      end

      def self.set(
        *,
        ndt : UInt16? = nil
      ) : Nil
        self.value = self.value.copy_with(
          ndt: ndt,
        )
      end
    end # struct

    # DMA channel 1 peripheral address          register
    struct PAR
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

      # Peripheral address
      def pa : UInt32
        UInt32.new!((@value >> 0) & 0x0_u32)
      end

      # Peripheral address
      def self.pa : UInt32
        value.pa
      end

      # Peripheral address
      def self.pa=(value : UInt32) : UInt32
        self.set(pa: value)
        value
      end

      def copy_with(
        *,

        pa : UInt32? = nil
      ) : self
        value = @value

        unless pa.nil?
          value = (value & 0xffffffff_u32) |
                  UInt32.new!(pa.to_int).&(0x0_u32) << 0
        end

        self.class.new(value)
      end

      def self.set(
        *,
        pa : UInt32? = nil
      ) : Nil
        self.value = self.value.copy_with(
          pa: pa,
        )
      end
    end # struct

    # DMA channel 1 memory address          register
    struct MAR
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

      # Memory address
      def ma : UInt32
        UInt32.new!((@value >> 0) & 0x0_u32)
      end

      # Memory address
      def self.ma : UInt32
        value.ma
      end

      # Memory address
      def self.ma=(value : UInt32) : UInt32
        self.set(ma: value)
        value
      end

      def copy_with(
        *,

        ma : UInt32? = nil
      ) : self
        value = @value

        unless ma.nil?
          value = (value & 0xffffffff_u32) |
                  UInt32.new!(ma.to_int).&(0x0_u32) << 0
        end

        self.class.new(value)
      end

      def self.set(
        *,
        ma : UInt32? = nil
      ) : Nil
        self.value = self.value.copy_with(
          ma: ma,
        )
      end
    end # struct

  end
end
