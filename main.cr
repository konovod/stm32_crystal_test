require "./bindings/*"
require "./stm32/*"

LEDS   = {9, 8, 15, 14, 13, 12, 11, 10}.map { |i| STM32::OutputPin.new(GPIOE::BASE_ADDRESS, i) }
BUTTON = STM32::InputPin.new(GPIOA::BASE_ADDRESS, 0)

#

def wait
  100_0000.times { asm("nop" :::: "volatile") }
end

STM32.init
reg = Register.new(RCC::AHBENR.pointer)
reg.set_bit(21, true)
wait
reg.set_bit(17, true)
wait
LEDS.each &.configure
# BUTTON.configure # somehow breaks program

while true
  LEDS.at(0).turn(true)
  LEDS.at(1).turn(!LEDS.at(1).read)

  LEDS.at(2).turn(BUTTON.read)
  LEDS.at(3).turn(!BUTTON.read)

  i = 6
  LEDS[i].turn(true)
  LEDS[7u8].turn(true) # somehow LEDS[7] breaks program

  wait
  next

  LEDS.each do |led|
    led.turn(true)
    wait
  end
  LEDS.each do |led|
    led.turn(false)
    wait
  end
end
