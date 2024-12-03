require "./bindings/*"
require "./stm32/*"

# STM32F3DISC1
# LEDS = {9, 8, 15, 14, 13, 12, 11, 10}.map { |i| STM32::OutputPin.new(GPIOE, i) }
# BTNS = StaticArray[STM32::InputPin.new(GPIOA, 0)]

# Nucleo-F429ZI
BTNS = StaticArray[STM32::InputPin.new(GPIOC, 13)]
LEDS = StaticArray[STM32::OutputPin.new(GPIOB, 0), STM32::OutputPin.new(GPIOB, 7), STM32::OutputPin.new(GPIOB, 14)]

def wait
  100_0000.times { asm("nop" :::: "volatile") }
end

STM32.init
RCC::AHB1ENR.set(gpioben: true, gpiocen: true)
wait
LEDS.each &.configure
# BTNS[0].configure
while true
  LEDS[0].turn(true)             # works
  LEDS[1].turn(!LEDS[1].read) # works
  LEDS[2].turn(!LEDS[1].read)
  wait
end
