ARMGNU ?= aarch64-linux-gnu

##################################################################

BUILD_DIR=build
SRC_DIR=src
INCLUDE_DIR=include

SRC_S:=$(wildcard $(SRC_DIR)/*.S)
OBJ_S:=$(patsubst $(SRC_DIR)/%.S, $(BUILD_DIR)/%.o, $(SRC_S))
SRC_c:=$(wildcard $(SRC_DIR)/*.c)
OBJ_c:=$(patsubst $(SRC_DIR)/%.c, $(BUILD_DIR)/%.o, $(SRC_c))
#OBJ:=$(OBJ_S) $(OBJ_c)


##################################################################
debug: $(OBJ_S) $(OBJ_c)
	$(ARMGNU)-ld $^ -Ttext 0x0 -o $(BUILD_DIR)/demo.elf  
# 使用 ld 链接器来链接 demo.o
# -Ttext 0x0 是一个选项，它设置了程序的起始地址为 0x0

$(OBJ_S): $(SRC_S)
	$(ARMGNU)-gcc -c $^ -o $@ -g
$(OBJ_c): $(SRC_c)
	$(ARMGNU)-gcc -c $^ -o $@ -g

.PHONY:clear print
clean:
	$(RM) $(OBJ_S) $(OBJ_C)
print:
	echo $(SRC_S)
	echo $(SRC_c)
	echo $(OBJ_S)
	echo $(OBJ_C)
