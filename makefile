CC = clang
CFLAGS = -Wall -Wextra -Werror
LDFLAGS = -ltreesitter

SRC_DIR = src
BUILD_DIR = bin
SRC_FILES = $(wildcard $(SRC_DIR)/*.c)
OBJ_FILES = $(patsubst $(SRC_DIR)/%.c, $(BUILD_DIR)/%.o, $(SRC_FILES))

TARGET = headless

.PHONY: all clean

all: $(TARGET)

$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

$(BUILD_DIR)/%.o: $(SRC_DIR)/%.c | $(BUILD_DIR)
	$(CC) $(CFLAGS) -c $< -o $@

$(TARGET): $(OBJ_FILES)
	$(CC) $(CFLAGS) ./tree-sitter/lib/src/lib.c tree-sitter-c/src/parser.c  ./main.c -I tree-sitter/lib/src -I tree-sitter/lib/include -o ./bin/headless

clean:
	rm -rf $(BUILD_DIR) $(TARGET)
