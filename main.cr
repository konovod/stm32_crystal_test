require "./bindings/*"
require "./stm32/*"

LEDS = {9, 8, 15, 14, 13, 12, 11, 10}.map { |i| STM32::OutputPin.new(GPIOE::BASE_ADDRESS, i) }

def wait
  100_0000.times { asm("nop" :::: "volatile") }
end

STM32.init
RegPointer.new(RCC::AHBENR.pointer).set_bit(21, true)
wait
LEDS.each &.configure
while true
  LEDS.each do |led|
    led.turn(true)
    wait
  end
  LEDS.each do |led|
    led.turn(false)
    wait
  end
end
