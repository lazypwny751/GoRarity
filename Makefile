PREFIX := .
BUILDD := $(PREFIX)/bin
ENTRY := src/main.go
BIN := $(BUILDD)/goraritygo
GO := go

all: build

build:
	mkdir -vp $(BUILDD)
	$(GO) build -o $(BIN) $(ENTRY)

install:
	install -vm 755 $(BIN) /usr/bin

run:
	$(GO) run $(ENTRY)

clean:
	rm -vr $(BIN)

.PHONY: all build run clean
