set -xue

#QEMU 실행 파일 경로
QEMU=qemu-system-riscv32

CC=/opt/homebrew/opt/llvm/bin/clang
CFLAGS="-std=c11 -O2 -g3 -Wall -Wextra --target=riscv32 -ffreestanding -nostdlib"

$CC $CFLAGS -Wl, -Tkernel.ld -Wl,-Map=kernel.map -o kernel.elf \
    kernel.c

#QEMU 실행
$QEMU -machine virt -bios default -nographic -serial mon:stdio --no-reboot \
    -kernel kernel.elf