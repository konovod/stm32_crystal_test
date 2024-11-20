require "./bindings/*"
require "./stm32/*"

def wait
  100_0000.times { asm("nop" :::: "volatile") }
end

# 9 8 10 15 11 14 12 13
# 1 2 4  6  8  7  5  3
# 9 8 15 14 13 12 11 10
# LED_INDEX = {9,8,15,14,13,12,11,10}

def led(n, v)
# n = LED_INDEX[n]-8
case n
  when 0
    v ? GPIOE::BSRR.bs9=true : GPIOE::BSRR.br9=true
  when 1
    v ? GPIOE::BSRR.bs8=true : GPIOE::BSRR.br8=true
  when 2
    v ? GPIOE::BSRR.bs15=true : GPIOE::BSRR.br15=true
  when 3
    v ? GPIOE::BSRR.bs14=true : GPIOE::BSRR.br14=true
  when 4
    v ? GPIOE::BSRR.bs13=true : GPIOE::BSRR.br13=true
  when 5
    v ? GPIOE::BSRR.bs12=true : GPIOE::BSRR.br12=true
  when 6
    v ? GPIOE::BSRR.bs11=true : GPIOE::BSRR.br11=true
  when 7
    v ? GPIOE::BSRR.bs10=true : GPIOE::BSRR.br10=true
end
end

STM32.init
v = RCC::AHBENR.pointer.load(volatile: true)
v |= (1u32<<21)
RCC::AHBENR.pointer.store(v, volatile: true)
wait
GPIOE::MODER._15=1
GPIOE::MODER._14=1
GPIOE::MODER._13=1
GPIOE::MODER._12=1
GPIOE::MODER._11=1
GPIOE::MODER._10=1
GPIOE::MODER._9=1
GPIOE::MODER._8=1
while true
  8.times do |i| 
    led(i, true)
    wait
  end  
  8.times do |i| 
    led(i, false)
    wait
  end  
end
