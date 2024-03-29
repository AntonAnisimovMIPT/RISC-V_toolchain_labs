## Docker usage
- Так как ранее на моей системе не был установлен Docker, то пришлось его установить и настроить:
  ```bash
  # Add Docker's official GPG key:
  sudo apt-get update
  sudo apt-get install ca-certificates curl
  sudo install -m 0755 -d /etc/apt/keyrings
  sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
  sudo chmod a+r /etc/apt/keyrings/docker.asc
  
  # Add the repository to Apt sources:
  echo \
    "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
    $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
    sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
  sudo apt-get update
  ```
  ```bash
  sudo apt-get install docker-ce \
                     docker-ce-cli \
                     containerd.io \
                     docker-buildx-plugin \
                     docker-compose-plugin
  ```
  После ввода ```sudo docker run hello-world``` вывелось сообщение
  ```
  Hello from Docker!
  This message shows that your installation appears to be working correctly.
  
  To generate this message, Docker took the following steps:
   1. The Docker client contacted the Docker daemon.
   2. The Docker daemon pulled the "hello-world" image from the Docker Hub.
      (amd64)
   3. The Docker daemon created a new container from that image which runs the
      executable that produces the output you are currently reading.
   4. The Docker daemon streamed that output to the Docker client, which sent it
      to your terminal.
  
  To try something more ambitious, you can run an Ubuntu container with:
   $ docker run -it ubuntu bash
  
  Share images, automate workflows, and more with a free Docker ID:
   https://hub.docker.com/
  
  For more examples and ideas, visit:
  https://docs.docker.com/get-started/

  ```
  значит все прошло успешно.
  Также настроил возможность работы с докером, не прописывая всегда команду sudo:
  ```bash
  sudo groupadd docker
  sudo usermod -aG docker $USER
  ```
  Перезашел в терминал и ввел:
  ```bash
  docker run hello-world
  ```
  Опять получил сообщение о приветсвии, значит все прошло успешно.
- Извлек образ и запустил контейнер:
  ```bash
  docker run \
    --interactive \
    --tty \
    --detach \
    --env "TERM=xterm-256color" \
    --mount type=bind,source="$(pwd)",target="$(pwd)" \
    --name cpp \
    --ulimit nofile=1024:1024 \
    ghcr.io/riscv-technologies-lab/rv_tools_image:1.0.1
  ```

## Glancing at your first toolchain
- Перепроверил, что контейнер запущен. Для этого выполнил команду ```docker ps```.

  Результат выполнения:
  ```bash
  CONTAINER ID   IMAGE                                                 COMMAND       CREATED         STATUS         PORTS     NAMES
  55633b1fe706   ghcr.io/riscv-technologies-lab/rv_tools_image:1.0.1   "/bin/bash"   7 minutes ago   Up 7 minutes             cpp
  ```
  поэтому контейнер `cpp` действительно запущен.

- Теперь перешел в этот контейнер, выполнив ```docker exec -it cpp /bin/bash``` (открытие интерактивного сеанса внутри контейнера `cpp`, используя командную оболочку bash). Т.о. успешно вошел в контейнер под пользователем root ```root@55633b1fe706:~#```.
- Чтобы просмотреть файлы в ```/opt/sc-dt/```, выполнил ```ls /opt/sc-dt/```. В результате:
  ```bash
  docs     env.sh  riscv-gcc      tools             workspace
  eclipse  llvm    start-scr-ide  vscode-extension

  ```
- Запустил `source /opt/sc-dt/env.sh`. В результате:
  ```bash
  SC-DT environment
  Done!
  ```
- Чтобы сравнить переменные среды до выполнения `env.sh` и после, то т.к. я уже выполнил этот скрипт и переменные среды изменились, мне пришлось создать еще один контейнер `cpp_env`, но там я не выполнял этот сркипт, а сразу командой `env` просмотрел переменные среды:
  ```bash
  HOSTNAME=60b75d7294f1
  SCDT_INSTALLATION_ROOT=/opt/sc-dt
  PWD=/root
  HOME=/root
  LS_COLORS=rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:mi=00:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arc=01;31:*.arj=01;31:*.taz=01;31:*.lha=01;31:*.lz4=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.tzo=01;31:*.t7z=01;31:*.zip=01;31:*.z=01;31:*.dz=01;31:*.gz=01;31:*.lrz=01;31:*.lz=01;31:*.lzo=01;31:*.xz=01;31:*.zst=01;31:*.tzst=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.alz=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.cab=01;31:*.wim=01;31:*.swm=01;31:*.dwm=01;31:*.esd=01;31:*.jpg=01;35:*.jpeg=01;35:*.mjpg=01;35:*.mjpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.webp=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.m4a=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.oga=00;36:*.opus=00;36:*.spx=00;36:*.xspf=00;36:
  LESSCLOSE=/usr/bin/lesspipe %s %s
  TERM=xterm-256color
  LESSOPEN=| /usr/bin/lesspipe %s
  SHLVL=1
  VCPKG_INSTALLATION_ROOT=/usr/local/vcpkg
  PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
  _=/usr/bin/env

  ```
  потом командой `exit` вышел из этого контейнера `cpp_env`, командой `docker stop cpp_env` остановил его, командой `docker rm cpp_env` удалил его.
- После чего снова перешел в первый контейнер `cpp`, в котором я уже запускал `env.sh`. Командой `env` просмотрел текущие переменные среды:
  ```bash
  SC_CLANG_PATH=/opt/sc-dt/llvm
  HOSTNAME=55633b1fe706
  SC_QEMU_PATH=/opt/sc-dt/tools/bin
  SCDT_INSTALLATION_ROOT=/opt/sc-dt
  SC_QEMU_SYSTEM32=/opt/sc-dt/tools/bin/qemu-system-riscv32
  SC_QEMU_SYSTEM=/opt/sc-dt/tools/bin/qemu-system-riscv64
  SC_DT_PATH=/opt/sc-dt
  SC_GDB_PATH=/opt/sc-dt/riscv-gcc
  PWD=/root
  SC_BSP_PATH=/opt/sc-dt/workspace/bsp
  SC_OPENOCD_PATH=/opt/sc-dt/tools
  SC_QEMU_SYSTEM64=/opt/sc-dt/tools/bin/qemu-system-riscv64
  HOME=/root
  LS_COLORS=rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:mi=00:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arc=01;31:*.arj=01;31:*.taz=01;31:*.lha=01;31:*.lz4=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.tzo=01;31:*.t7z=01;31:*.zip=01;31:*.z=01;31:*.dz=01;31:*.gz=01;31:*.lrz=01;31:*.lz=01;31:*.lzo=01;31:*.xz=01;31:*.zst=01;31:*.tzst=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.alz=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.cab=01;31:*.wim=01;31:*.swm=01;31:*.dwm=01;31:*.esd=01;31:*.jpg=01;35:*.jpeg=01;35:*.mjpg=01;35:*.mjpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.webp=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.m4a=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.oga=00;36:*.opus=00;36:*.spx=00;36:*.xspf=00;36:
  SC_PATHS=/opt/sc-dt/riscv-gcc/bin:/opt/sc-dt/llvm/bin:/opt/sc-dt/tools/bin:/opt/sc-dt/riscv-gcc/bin:/opt/sc-dt/tools/bin:/opt/sc-dt/tools/bin
  LESSCLOSE=/usr/bin/lesspipe %s %s
  TERM=xterm-256color
  LESSOPEN=| /usr/bin/lesspipe %s
  SHLVL=1
  VCPKG_INSTALLATION_ROOT=/usr/local/vcpkg
  SC_CMAKE_TOOLCHAINS=/opt/sc-dt/workspace/cmake-toolchains
  PATH=/opt/sc-dt/riscv-gcc/bin:/opt/sc-dt/llvm/bin:/opt/sc-dt/tools/bin:/opt/sc-dt/riscv-gcc/bin:/opt/sc-dt/tools/bin:/opt/sc-dt/tools/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
  SC_GCC_PATH=/opt/sc-dt/riscv-gcc
  _=/usr/bin/env
  ```
  Как можно видеть, после выполнения `env.sh` произошли изменения в переменных среды: было добавлено много новых переменных среды,а некоторые были изменены (например PATH).
  Команда ```source``` позволяет выполнить скрипт в текущем окружении оболочки.
- Cклонировал репозиторий командой
  ```bash
  git clone https://github.com/riscv-technologies-lab/riscv-toolchain-labs.git
  ```
  Далее перешел в директорию ```02-toolchain``` и командой
  ```bash
  CC=/opt/sc-dt/riscv-gcc/bin/riscv64-unknown-linux-gnu-gcc QEMU_USER=/opt/sc-dt/tools/bin/qemu-riscv64 make build
  ```
  собрал проект. Проверил создавшуюся папку `build`, в ней действительно находится файл `hello.elf` (можно было не делать, достаточно видеть сообщение `/opt/sc-dt/riscv-gcc/bin/riscv64-unknown-linux-gnu-gcc  hello.c -o build/hello.elf`), командой `CC=/opt/sc-dt/riscv-gcc/bin/riscv64-unknown-linux-gnu-gcc QEMU_USER=/opt/sc-dt/tools/bin/qemu-riscv64 CFLAGS=-static make run-qemu` запустил на Qemu, вывелось сообщение:
  ```bash
  /opt/sc-dt/riscv-gcc/bin/riscv64-unknown-linux-gnu-gcc -static hello.c -o build/hello.elf
     /opt/sc-dt/tools/bin/qemu-riscv64 build/hello.elf
     Hello, RISC-V!
  ```
  значит все работает успешно.
  Теперь используя `export` сделал переменные `CC`, `QEMU_USER`, `CFLAGS` доступными для подпроцессов:
  ```bash
    export CC=/opt/sc-dt/riscv-gcc/bin/riscv64-unknown-linux-gnu-gcc
    export QEMU_USER=/opt/sc-dt/tools/bin/qemu-riscv64
    export CFLAGS=-static
  ```
  Собрал проект:
  ```bash
    make build
  ```
  все выполнилось успешно, как и в прошлый раз.
  
  Запустил на Qemu:
  ```bash
    make run-qemu
  ```
  все также выполнилоь успешно.
  
  Т.о. можно видеть, что разница между обычным присваиванием значения и присваиванием значения с помощью `export` состоит в том, что у них разные области видимости, т.е. с помощью `export` нам не нужно каждый раз пробрасывать значение в наш Makefile, а достаточно просто один раз их определить и они будут видимыми для всех подпроцессов.
## Connecting with debugger
- Просмотрел размер ранее скомпиллированного файла hello.elf:
  ```bash
  objdump -h hello.elf
  hello.elf:     file format elf64-little

  Sections:
  Idx Name          Size      VMA               LMA               File off  Algn
  0 .note.ABI-tag 00000020  00000000000101c8  00000000000101c8  000001c8  2**2
                  CONTENTS, ALLOC, LOAD, READONLY, DATA
  1 .rela.dyn     000001c8  00000000000101e8  00000000000101e8  000001e8  2**3
                  CONTENTS, ALLOC, LOAD, READONLY, DATA
  2 .text         0003c5da  00000000000103b0  00000000000103b0  000003b0  2**2
                  CONTENTS, ALLOC, LOAD, READONLY, CODE
  3 __libc_freeres_fn 000007a6  000000000004c98a  000000000004c98a  0003c98a  2**1
                  CONTENTS, ALLOC, LOAD, READONLY, CODE
  4 .rodata       0001d8c4  000000000004d130  000000000004d130  0003d130  2**4
                  CONTENTS, ALLOC, LOAD, READONLY, DATA
  5 __libc_subfreeres 00000048  000000000006a9f8  000000000006a9f8  0005a9f8  2**3
                  CONTENTS, ALLOC, LOAD, READONLY, DATA
  6 __libc_IO_vtables 00000690  000000000006aa40  000000000006aa40  0005aa40  2**3
                  CONTENTS, ALLOC, LOAD, READONLY, DATA
  7 __libc_atexit 00000008  000000000006b0d0  000000000006b0d0  0005b0d0  2**3
                  CONTENTS, ALLOC, LOAD, READONLY, DATA
  8 .eh_frame     00002de4  000000000006b0d8  000000000006b0d8  0005b0d8  2**3
                  CONTENTS, ALLOC, LOAD, READONLY, DATA
  9 .gcc_except_table 00000165  000000000006debc  000000000006debc  0005debc  2**0
                  CONTENTS, ALLOC, LOAD, READONLY, DATA
  10 .tdata        00000020  000000000006f538  000000000006f538  0005e538  2**3
                  CONTENTS, ALLOC, LOAD, DATA, THREAD_LOCAL
  11 .tbss         00000040  000000000006f558  000000000006f558  0005e558  2**3
                  ALLOC, THREAD_LOCAL
  12 .preinit_array 00000008  000000000006f558  000000000006f558  0005e558  2**0
                  CONTENTS, ALLOC, LOAD, DATA
  13 .init_array   00000008  000000000006f560  000000000006f560  0005e560  2**3
                  CONTENTS, ALLOC, LOAD, DATA
  14 .fini_array   00000010  000000000006f568  000000000006f568  0005e568  2**3
                  CONTENTS, ALLOC, LOAD, DATA
  15 .data.rel.ro  00000a84  000000000006f578  000000000006f578  0005e578  2**3
                  CONTENTS, ALLOC, LOAD, DATA
  16 .data         000017f8  0000000000070000  0000000000070000  0005f000  2**3
                  CONTENTS, ALLOC, LOAD, DATA
  17 .got          000000d0  00000000000717f8  00000000000717f8  000607f8  2**3
                  CONTENTS, ALLOC, LOAD, DATA
  18 .sdata        000001d0  00000000000718c8  00000000000718c8  000608c8  2**3
                  CONTENTS, ALLOC, LOAD, DATA
  19 .sbss         000003c4  0000000000071a98  0000000000071a98  00060a98  2**3
                  ALLOC
  20 .bss          000011d8  0000000000071e60  0000000000071e60  00060a98  2**3
                  ALLOC
  21 __libc_freeres_ptrs 00000020  0000000000073038  0000000000073038  00060a98  2**3
                  ALLOC
  22 .comment      00000033  0000000000000000  0000000000000000  00060a98  2**0
                  CONTENTS, READONLY
  23 .riscv.attributes 00000042  0000000000000000  0000000000000000  00060acb  2**0
                  CONTENTS, READONLY


  ```
- Добавил значние `-g` к переменной `CFLAGS`, снова собрал и сделал objdump:
  ```bash
  export CFLAGS="-g"
  make build
  objdump -h hello.elf
  hello.elf:     file format elf64-little

  Sections:
  Idx Name          Size      VMA               LMA               File off  Algn
  0 .interp       00000021  0000000000010270  0000000000010270  00000270  2**0
                  CONTENTS, ALLOC, LOAD, READONLY, DATA
  1 .note.ABI-tag 00000020  0000000000010294  0000000000010294  00000294  2**2
                  CONTENTS, ALLOC, LOAD, READONLY, DATA
  2 .hash         00000024  00000000000102b8  00000000000102b8  000002b8  2**3
                  CONTENTS, ALLOC, LOAD, READONLY, DATA
  3 .gnu.hash     00000030  00000000000102e0  00000000000102e0  000002e0  2**3
                  CONTENTS, ALLOC, LOAD, READONLY, DATA
  4 .dynsym       00000060  0000000000010310  0000000000010310  00000310  2**3
                  CONTENTS, ALLOC, LOAD, READONLY, DATA
  5 .dynstr       0000003f  0000000000010370  0000000000010370  00000370  2**0
                  CONTENTS, ALLOC, LOAD, READONLY, DATA
  6 .gnu.version  00000008  00000000000103b0  00000000000103b0  000003b0  2**1
                  CONTENTS, ALLOC, LOAD, READONLY, DATA
  7 .gnu.version_r 00000020  00000000000103b8  00000000000103b8  000003b8  2**3
                  CONTENTS, ALLOC, LOAD, READONLY, DATA
  8 .rela.plt     00000030  00000000000103d8  00000000000103d8  000003d8  2**3
                  CONTENTS, ALLOC, LOAD, READONLY, DATA
  9 .plt          00000040  0000000000010410  0000000000010410  00000410  2**4
                  CONTENTS, ALLOC, LOAD, READONLY, CODE
  10 .text         0000011c  0000000000010450  0000000000010450  00000450  2**2
                  CONTENTS, ALLOC, LOAD, READONLY, CODE
  11 .rodata       0000000f  0000000000010570  0000000000010570  00000570  2**3
                  CONTENTS, ALLOC, LOAD, READONLY, DATA
  12 .eh_frame_hdr 00000014  0000000000010580  0000000000010580  00000580  2**2
                  CONTENTS, ALLOC, LOAD, READONLY, DATA
  13 .eh_frame     0000002c  0000000000010598  0000000000010598  00000598  2**3
                  CONTENTS, ALLOC, LOAD, READONLY, DATA
  14 .preinit_array 00000008  0000000000011e08  0000000000011e08  00000e08  2**0
                  CONTENTS, ALLOC, LOAD, DATA
  15 .init_array   00000008  0000000000011e10  0000000000011e10  00000e10  2**3
                  CONTENTS, ALLOC, LOAD, DATA
  16 .fini_array   00000008  0000000000011e18  0000000000011e18  00000e18  2**3
                  CONTENTS, ALLOC, LOAD, DATA
  17 .dynamic      000001e0  0000000000011e20  0000000000011e20  00000e20  2**3
                  CONTENTS, ALLOC, LOAD, DATA
  18 .got          00000028  0000000000012000  0000000000012000  00001000  2**3
                  CONTENTS, ALLOC, LOAD, DATA
  19 .sdata        00000010  0000000000012028  0000000000012028  00001028  2**3
                  CONTENTS, ALLOC, LOAD, DATA
  20 .bss          00000008  0000000000012038  0000000000012038  00001038  2**0
                  ALLOC
  21 .comment      00000033  0000000000000000  0000000000000000  00001038  2**0
                  CONTENTS, READONLY
  22 .riscv.attributes 0000003e  0000000000000000  0000000000000000  0000106b  2**0
                  CONTENTS, READONLY
  23 .debug_aranges 00000030  0000000000000000  0000000000000000  000010a9  2**0
                  CONTENTS, READONLY, DEBUGGING, OCTETS
  24 .debug_info   0000008c  0000000000000000  0000000000000000  000010d9  2**0
                  CONTENTS, READONLY, DEBUGGING, OCTETS
  25 .debug_abbrev 00000043  0000000000000000  0000000000000000  00001165  2**0
                  CONTENTS, READONLY, DEBUGGING, OCTETS
  26 .debug_line   0000005a  0000000000000000  0000000000000000  000011a8  2**0
                  CONTENTS, READONLY, DEBUGGING, OCTETS
  27 .debug_frame  00000040  0000000000000000  0000000000000000  00001208  2**3
                  CONTENTS, READONLY, DEBUGGING, OCTETS
  28 .debug_str    000000ac  0000000000000000  0000000000000000  00001248  2**0
                  CONTENTS, READONLY, DEBUGGING, OCTETS
  29 .debug_line_str 00000035  0000000000000000  0000000000000000  000012f4  2**0
                  CONTENTS, READONLY, DEBUGGING, OCTETS
  ```
  Как можно видеть, добавились новые заголовки секций (как мне кажется, они и отвечают за отладочную информацию (к тому же в них есть слово DEBUGGING)).
- Собрал проект:
  ```bash
  CC=$SC_GCC_PATH/bin/riscv64-unknown-linux-gnu-gcc QEMU_USER=/opt/sc-dt/tools/bin/qemu-riscv64 CFLAGS="-g -static" make build
  ```
  Подключился к qemu, застваил ее ждать подключения GDB к порту 1234:
  ```bash
  /opt/sc-dt/tools/bin/qemu-riscv64 -g 1234 build/hello.elf
  ```
  Открыл новое окно терминала, перешел в этот контейнер:
  ```bash
  docker exec -it cpp /bin/bash
  ```
  Подключился к qemu, используя GDB:
  ```bash
  /opt/sc-dt/riscv-gcc/bin/riscv64-unknown-linux-gnu-gdb
  ```
  Что получилось успешно, судя по этому сообщению:
  ```bash
  GNU gdb (GDB) 13.2
  Copyright (C) 2023 Free Software Foundation, Inc.
  License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>
  This is free software: you are free to change and redistribute it.
  There is NO WARRANTY, to the extent permitted by law.
  Type "show copying" and "show warranty" for details.
  This GDB was configured as "--host=x86_64-pc-linux-gnu --target=riscv64-unknown-linux-gnu".
  Type "show configuration" for configuration details.
  For bug reporting instructions, please see:
  <https://www.gnu.org/software/gdb/bugs/>.
  Find the GDB manual and other documentation resources online at:
      <http://www.gnu.org/software/gdb/documentation/>.
  
  For help, type "help".
  Type "apropos word" to search for commands related to "word".
  ```
  Далее подключился к порту 1234, выставил брейкпоинт на main и продолжил:
  ```bash
  (gdb) target remote localhost:1234
  Remote debugging using localhost:1234
  Reading /root/riscv-toolchain-labs/labs/02-toolchain/build/hello.elf from remote target...
  warning: File transfers from remote targets can be slow. Use "set sysroot" to access files locally instead.
  Reading /root/riscv-toolchain-labs/labs/02-toolchain/build/hello.elf from remote target...
  Reading symbols from target:/root/riscv-toolchain-labs/labs/02-toolchain/build/hello.elf...
  0x0000000000010514 in _start ()
  (gdb) b main
  Breakpoint 1 at 0x105fa: file hello.c, line 2.
  (gdb) continue
  ```
  В итоге в этом терминале получил вывод:
  ```bash
  Continuing.
  
  Breakpoint 1, main () at hello.c:2
  2	int main() { printf("Hello, RISC-V!\n"); }
  ```
  Если еще раз нажать продолжить, то имеем:
  ```bash
  Continuing.
  [Inferior 1 (process 201) exited normally]
  ```
  Также в первом изначальном окне терминала вывелось сообщение:
  ```bash
  Hello, RISC-V!
  ```
  Это еще раз подтверждает факт, что все правильно отработало.
## Major tasks
- Создал файл ```quadratic_equations_solver.c``` и ```Makefile``` для него (см. папку lab1).
  Протестировал работу командами:
  - Сборки через докер:
    ```
    CC=/opt/sc-dt/riscv-gcc/bin/riscv64-unknown-linux-gnu-gcc QEMU_USER=/opt/sc-dt/tools/bin/qemu-riscv64 CFLAGS="-g -static" make build-docker
    ```
  - Запуска на qemu через докер:
    ```
    CC=/opt/sc-dt/riscv-gcc/bin/riscv64-unknown-linux-gnu-gcc QEMU_USER=/opt/sc-dt/tools/bin/qemu-riscv64 CFLAGS="-g -static" make run-qemu-docker
    ```
  - Запуска gdb на qemu через докер:
    ```
    CC=/opt/sc-dt/riscv-gcc/bin/riscv64-unknown-linux-gnu-gcc QEMU_USER=/opt/sc-dt/tools/bin/qemu-riscv64 CFLAGS="-g -static" make run-qemu-gdb-docker
    ```
    В итоге все работает, папка build с файлом ```quadratic_equations_solver.elf``` создается, через qemu запускается, qdb запускается и брейкпоинты ставятся, отладка идет без проблем.
    Аналогичные действия проделал с тулчейном llvm, указав вместо ```/opt/sc-dt/riscv-gcc/bin/riscv64-unknown-linux-gnu-gcc``` значение ```/opt/sc-dt/llvm/bin/clang```, все так же успешно работает.
- Cкомпиллировал ```quadratic_equation_solver.c``` с разными флагами оптимизации, используя тулчейн llvm и компиллятор clang:
  ```bash
  /home/anton/Documents/RISC-V_Spring_2024/toolchain-labs/RISC-V_toolchain_labs/lab1# /opt/sc-dt/llvm/bin/clang -S -O0 -o quadratic_equation_solver_clang_O0.s quadratic_equation_solver.c 
  /home/anton/Documents/RISC-V_Spring_2024/toolchain-labs/RISC-V_toolchain_labs/lab1# /opt/sc-dt/llvm/bin/clang -S -O1 -o quadratic_equation_solver_clang_O1.s quadratic_equation_solver.c 
  /home/anton/Documents/RISC-V_Spring_2024/toolchain-labs/RISC-V_toolchain_labs/lab1# /opt/sc-dt/llvm/bin/clang -S -O2 -o quadratic_equation_solver_clang_O2.s quadratic_equation_solver.c 
  /home/anton/Documents/RISC-V_Spring_2024/toolchain-labs/RISC-V_toolchain_labs/lab1# /opt/sc-dt/llvm/bin/clang -S -O3 -o quadratic_equation_solver_clang_O3.s quadratic_equation_solver.c 
  ```
- Проделал ту же работу, но с тулчейном gnu, используя gcc:
  ```bash
  /home/anton/Documents/RISC-V_Spring_2024/toolchain-labs/RISC-V_toolchain_labs/lab1# /opt/sc-dt/riscv-gcc/bin/riscv64-unknown-linux-gnu-gcc -S -O0 -o quadratic_equation_solver_gcc_O0.s quadratic_equation_solver.c 
  /home/anton/Documents/RISC-V_Spring_2024/toolchain-labs/RISC-V_toolchain_labs/lab1# /opt/sc-dt/riscv-gcc/bin/riscv64-unknown-linux-gnu-gcc -S -O1 -o quadratic_equation_solver_gcc_O1.s quadratic_equation_solver.c 
  /home/anton/Documents/RISC-V_Spring_2024/toolchain-labs/RISC-V_toolchain_labs/lab1# /opt/sc-dt/riscv-gcc/bin/riscv64-unknown-linux-gnu-gcc -S -O2 -o quadratic_equation_solver_gcc_O2.s quadratic_equation_solver.c 
  /home/anton/Documents/RISC-V_Spring_2024/toolchain-labs/RISC-V_toolchain_labs/lab1# /opt/sc-dt/riscv-gcc/bin/riscv64-unknown-linux-gnu-gcc -S -O3 -o quadratic_equation_solver_gcc_O3.s quadratic_equation_solver.c
  ```
  (все полученные файлы находятся в папке Assemblers этой лабораторной работы)
- Попробовал проанализировать полученные ассемблерные файлы.
  
  Как можно видеть, у clang размер файлов больше, чем у gcc.

  Так же у clang различаются файлы с только оптимизацией ```-O0``` и ```-O1```, в то время как ```-O1```, ```-O2```, ```-O3``` абсолютно одинаковые.
  
  У gcc ситуация поинтереснее: различаются все, кроме ```-O2``` и ```-O3```.
  
  Возможно это связано с особенностью моего исходника и в более больших проектах различии посущественнее.




  

  

