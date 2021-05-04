LOCAL_BIN = $(CURDIR)/bin
GIT_COMMIT := $(shell git rev-list -1 HEAD)

check:
	$(HOME)/go/bin/golangci-lint run

.PHONY: build
build:
	mkdir -p $(LOCAL_BIN)
	go build -ldflags "-X main.gitCommit=$(GIT_COMMIT)" -o $(LOCAL_BIN)/csv-query $(CURDIR)/cmd/csv-query

test:
	go test ./...
