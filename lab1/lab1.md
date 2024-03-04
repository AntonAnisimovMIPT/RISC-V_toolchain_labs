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
  ```
  docs     env.sh  riscv-gcc      tools             workspace
  eclipse  llvm    start-scr-ide  vscode-extension

  ```
- Запустил `source /opt/sc-dt/env.sh`. В результате:
  ```
  SC-DT environment
  Done!
  ```
- Чтобы сравнить переменные среды до выполнения `env.sh` и после, то т.к. я уже выполнил этот скрипт и переменные среды изменились, мне пришлось создать еще один контейнер `cpp_env`, но там я не выполнян этот сркипт, а сразу командой `env` просмотрел переменные среды:
  ```
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
  ```
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
- Находясь внутри контейнера, склонировал репозиторий командой
  ```
  git clone https://github.com/riscv-technologies-lab/riscv-toolchain-labs.git
  ```
  Далее перешел в директорию ```02-toolchain``` и командой
  ```
  CC=/opt/sc-dt/riscv-gcc/bin/riscv64-unknown-linux-gnu-gcc QEMU_USER=/opt/sc-dt/tools/bin/qemu-riscv64 make build
  ```
  собрал проект. Проверил создавшуюся папку `build`, в ней действительно находится файл `hello.elf` (можно было не делать, достаточно видеть сообщение `/opt/sc-dt/riscv-gcc/bin/riscv64-unknown-linux-gnu-gcc  hello.c -o build/hello.elf`)
  командой `CC=/opt/sc-dt/riscv-gcc/bin/riscv64-unknown-linux-gnu-gcc QEMU_USER=/opt/sc-dt/tools/bin/qemu-riscv64 CFLAGS=-static make run-qemu` запустил на Qemu,     вывелось сообщение
  ```/opt/sc-dt/riscv-gcc/bin/riscv64-unknown-linux-gnu-gcc -static hello.c -o build/hello.elf
     /opt/sc-dt/tools/bin/qemu-riscv64 build/hello.elf
     Hello, RISC-V!
  ```
  значит все работает успешно.
  Теперь используя `export` сделал переменные `CC`, `QEMU_USER`, `CFLAGS` доступными для подпроцессов:
  ```
    export CC=/opt/sc-dt/riscv-gcc/bin/riscv64-unknown-linux-gnu-gcc
    export QEMU_USER=/opt/sc-dt/tools/bin/qemu-riscv64
    export CFLAGS=-static
  ```
  Собрал проект:
  ```
    make build
  ```
  все выполнилось успешно, как и в прошлый раз.
  
  Запустил на Qemu:
  ```
    make run-qemu
  ```
  все также выполнилоь успешно.
  
  Т.о. можно видеть, что разница между обычным присваиванием значения и присваиванием значения с помощью `export` состоит в том, что у них разные области видимости, т.е. с помощью `export` нам не нужно каждый раз пробрасывать значение в наш Makefile, а достаточно просто один раз их определить и они будут видимыми для всех подпроцессов.
  
