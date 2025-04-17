# 🧠 RISC-V 미니멀 OS 아키텍처 요약

## 📦 전체 구조 개요

```mermaid
graph TD
    subgraph 사용자영역
        shell[Shell - shell.c]
        userlib[UserLib - user.c, user.h]
    end

    subgraph 커널영역
        kernel[Kernel - kernel.c]
        common[Common - common.c, common.h]
        virtio[VirtIO Driver]
        fs[File System]
    end

    subgraph 빌드와실행
        build[Build Script - run.sh]
        qemu[QEMU 실행 환경]
    end

    shell --> userlib
    userlib --> kernel
    kernel --> fs
    kernel --> virtio
    kernel --> common
    build --> shell
    build --> kernel
    build --> qemu
```

---

## 🔁 커널 부트 및 실행 흐름

```mermaid
graph TD
    boot[boot.s] --> kernel_main[Set SP and call kernel_main]
    kernel_main --> init_virtio[virtio_blk_init]
    init_virtio --> init_fs[fs_init]
    init_fs --> idle_proc[create_process for idle]
    idle_proc --> shell_proc[create_process shell.bin]
    shell_proc --> yield
```

---

## 🧰 주요 컴포넌트 기능 흐름

### 🎯 시스템 콜 처리 흐름

```mermaid
graph TD
    user_app[User App] --> syscall_call[ecall in user.c]
    syscall_call --> trap_entry[kernel_entry → handle_trap]
    trap_entry --> handle_syscall
    handle_syscall --> putchar_call[SYS_PUTCHAR → putchar]
    handle_syscall --> getchar_call[SYS_GETCHAR → getchar]
    handle_syscall --> exit_call[SYS_EXIT → process_exit]
    handle_syscall --> readfile_call[SYS_READFILE → fs_lookup → fs_flush]
```

### 📁 파일 시스템 구조

```mermaid
graph TD
    memfile[file memory array] --> flush[flush to disk]
    flush --> block[disk block (tar format)]
    block --> virtioio[virtio-blk write]
```

### 💿 VirtIO 디바이스 초기화 흐름

```mermaid
graph TD
    start --> init[virtio_blk_init]
    init --> check[Check VIRTIO_REG_MAGIC]
    check --> setup_queue[virtqueue init]
    setup_queue --> setup_regs[Set up registers]
```

### 🧵 프로세스 컨텍스트 스위칭

```mermaid
graph TD
    yield --> pick_proc[Select next runnable process]
    pick_proc --> set_satp[Set SATP + sscratch]
    set_satp --> switch_context
```

---

## 🖥 쉘 명령 구조 (user-space)

```mermaid
graph TD
    shell_main[main in shell.c] --> parse_command[Parse Command]
    parse_command --> hello_cmd[Run hello]
    parse_command --> exit_cmd[Run exit]
    parse_command --> readfile_cmd[Run readfile]
    parse_command --> writefile_cmd[Run writefile]
```

---

## 🔄 컴포넌트 간 상호작용 (Call Graph)

```mermaid
graph TD
    shell --> user_start[start]
    user_start --> user_main[main - shell.c]
    user_main --> syscall_exit
    user_main --> syscall_getchar
    user_main --> syscall_readfile
    user_main --> syscall_writefile

    syscall_exit --> kernel_trap
    syscall_getchar --> kernel_trap
    syscall_readfile --> kernel_trap
    syscall_writefile --> kernel_trap

    kernel_trap --> handle_syscall
    handle_syscall --> fs_read
    handle_syscall --> fs_write
    fs_read --> virtio_blk
    fs_write --> virtio_blk
```

---

## ⏱ 타이밍 시퀀스 다이어그램 (System Call: readfile)

```mermaid
sequenceDiagram
    participant User as User App
    participant Libc as User Library
    participant Kernel as Kernel
    participant FS as File System
    participant Disk as VirtIO

    User->>Libc: readfile("hello.txt")
    Libc->>Kernel: ecall SYS_READFILE
    Kernel->>FS: fs_lookup()
    FS->>Disk: virtio_blk_read()
    Disk-->>FS: 512B block
    FS-->>Kernel: buffer pointer
    Kernel-->>Libc: return length
    Libc-->>User: file data
```

---

## ✅ 특이 사항

- 커널과 유저가 **완전히 분리된 바이너리** (`shell.elf`, `kernel.elf`)
- 커널은 유저 프로세스를 위한 **MMU 세팅**과 가상 메모리 매핑 수행
- VirtIO 블록 디바이스를 통해 tar 기반 간이 파일 시스템 사용
- 커널 스택과 유저 스택을 철저히 분리

---

## 📂 빌드 및 실행 (run.sh)

```bash
$ ./run.sh
```

- `shell.c + user.c + common.c` → `shell.elf` → `shell.bin`
- `kernel.c + common.c + shell.bin.o` → `kernel.elf`
- QEMU에서 `kernel.elf` 실행

