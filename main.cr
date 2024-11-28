require "./bindings/*"
require "./stm32/*"

# module RCC
#   BASE_ADDRESS = 0x40021000_u64
#   AHBENR = CustomRegister.new(BASE_ADDRESS + 0x14_u64)
# end
# module GPIOA
#   BASE_ADDRESS = 0x48000000_u64
# end
# module GPIOE
#   BASE_ADDRESS = 0x48001000_u64
# end


LEDS   = {9, 8, 15, 14, 13, 12, 11, 10}.map { |i| STM32::OutputPin.new(GPIOE, i) }
button = STM32::InputPin.new(GPIOA, 0)
# BUTTON = STM32::InputPin.new(GPIOA::BASE_ADDRESS, 0) doesn't work
BTNS = StaticArray[STM32::InputPin.new(GPIOA, 0)]

def wait
  100_0000.times { asm("nop" :::: "volatile") }
end

STM32.init
RCC::AHBENR.set_bit(21, true)
wait
RCC::AHBENR.set_bit(17, true)
wait
LEDS.each &.configure
button.configure         

while true
  LEDS.at(0).turn(true)             # works
  LEDS.at(1).turn(!LEDS.at(1).read) # works
  LEDS.at(2).turn(button.read)
  LEDS.at(3).turn(!BTNS[0].read)
  i = 6
  LEDS[i].turn(true) # works
  # LEDS[7].turn(true)              # halts
  # LEDS[7i32].turn(true)              # halts
  LEDS[7u32].turn(true)
  LEDS[7i8].turn(true)

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
