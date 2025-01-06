PREFIX := .
BUILDD := $(PREFIX)/bin
ENTRY := src/main.go
BIN := $(BUILDD)/goraritygo
GO := go

all: run

run:
	$(GO) run $(ENTRY)
