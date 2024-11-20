CRYSTAL_PATH=/mnt/crystal/stm32/kecil crystal build --cross-compile --release --no-debug --target arm-none-eabi --mcpu cortex-m4 main.cr
clang --target=arm-none-eabi -mcpu=cortex-m4 -c boot/vector_table.S
ld.lld --gc-sections -T boot/stm32.ld --defsym=__flash_size=256K --defsym=__ram_size=40K ./main.o ./vector_table.o
objcopy -S -O ihex a.out a.hex