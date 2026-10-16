CC     := gcc
CFLAGS := -std=c11 -Wall -Wextra -Wpedantic -g -O0 -fsanitize=address,undefined
SRCS   := $(wildcard src/*.c)
BINS   := $(patsubst src/%.c,bin/%,$(SRCS))

all: $(BINS)

bin/%: src/%.c | bin
	$(CC) $(CFLAGS) $< -o $@

bin:
	mkdir -p bin

clean:
	rm -rf bin
