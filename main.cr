require "./bindings/*"
require "./stm32/*"

LEDS = {9, 8, 15, 14, 13, 12, 11, 10}.map { |i| STM32::OutputPin.new(GPIOE, i) }
button = STM32::InputPin.new(GPIOA, 0)
# BUTTON = STM32::InputPin.new(GPIOA::BASE_ADDRESS, 0) doesn't work
BTNS = StaticArray[STM32::InputPin.new(GPIOA, 0)]

def wait
  100_0000.times { asm("nop" :::: "volatile") }
end

STM32.init
RCC::AHBENR.set(iopaen: true, iopeen: true)
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
