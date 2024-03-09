CC ?= 
QEMU_USER ?= 
CFLAGS ?= 
OPTIMIZATION_LEVEL ?= -O0

BUILD_DIR := build

.DEFAULT_GOAL := quadratic_equation_solver

.PHONY: _build_dir quadratic_equation_solver clean build-docker

_build_dir:
	@mkdir -p ${BUILD_DIR}

quadratic_equation_solver: quadratic_equation_solver.c _build_dir
	${CC} ${CFLAGS} ${OPTIMIZATION_LEVEL} quadratic_equation_solver.c -o ${BUILD_DIR}/quadratic_equation_solver.elf -lm

build: quadratic_equation_solver

show: quadratic_equation_solver
	file ${BUILD_DIR}/quadratic_equation_solver.elf

run: quadratic_equation_solver
	${BUILD_DIR}/quadratic_equation_solver.elf

run-qemu: quadratic_equation_solver
	${QEMU_USER} ${BUILD_DIR}/quadratic_equation_solver.elf
	
run-qemu-gdb: quadratic_equation_solver
	${QEMU_USER} -g 1234 ${BUILD_DIR}/quadratic_equation_solver.elf

clean:
	rm -r ${BUILD_DIR}
	
build-docker:
	docker stop quad_eq_sol || true # Если вдруг мы до этого уже делали build, то при создании еще одного контейнера с таким же именем будет ошибка, значит нужно остановить тезку, чтобы потом удалить.
	docker rm quad_eq_sol || true # А теперь и удалить.
	docker run \
	  --interactive \
          --tty \
          --detach \
          --env "TERM=xterm-256color" \
          --mount type=bind,source=$(shell pwd),target=$(shell pwd)  \
          --name quad_eq_sol \
          --ulimit nofile=1024:1024 \
          --env "CC=${CC}" \
          --env "QEMU_USER=${QEMU_USER}" \
          --env "CFLAGS=${CFLAGS}" \
          ghcr.io/riscv-technologies-lab/rv_tools_image:1.0.1 \
          /bin/bash -c "make -C /home/anton/Documents/RISC-V_Spring_2024/toolchain-labs/RISC-V_toolchain_labs/lab1 build && tail -f /dev/null"
        
run-qemu-docker:
	docker start quad_eq_sol || true && \
	docker exec -it quad_eq_sol /bin/bash -c "make -C /home/anton/Documents/RISC-V_Spring_2024/toolchain-labs/RISC-V_toolchain_labs/lab1 run-qemu"

run-qemu-gdb-docker:
	docker start quad_eq_sol || true && \
	docker exec -it quad_eq_sol /bin/bash -c "make -C /home/anton/Documents/RISC-V_Spring_2024/toolchain-labs/RISC-V_toolchain_labs/lab1 run-qemu-gdb"
          

