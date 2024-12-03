rm a.out*
set -e
CRYSTAL_PATH=/mnt/crystal/stm32/kecil crystal build --cross-compile --release --no-debug --target arm-none-eabi --mcpu cortex-m4 main.cr
clang --target=arm-none-eabi -mcpu=cortex-m4 -c boot/vector_table.S
ld.lld --gc-sections -T boot/stm32.ld --defsym=__flash_size=2048K --defsym=__ram_size=192K ./main.o ./vector_table.o
objcopy -S -O ihex a.out a.hex
openocd -f interface/stlink.cfg -f target/stm32f4x.cfg -c "adapter speed 4000; init; reset halt; flash write_image erase a.hex; flash verify_image a.hex; reset; exit"