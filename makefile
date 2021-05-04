LOCAL_BIN=$(CURDIR)/bin
GIT_COMMIT := $(shell git rev-list -1 HEAD)
GOOS=linux
GOARCH=amd64

check:
	${HOME}/go/bin/golangci-lint run

.PHONY: build
build:
	mkdir -p ${LOCAL_BIN}
	GOOS=$(GOOS) GOARCH=$(GOARCH) go build -ldflags "-X main.gitCommit=$(GIT_COMMIT)" .
	
	go build -o ${LOCAL_BIN}/querier $(CURDIR)/cmd/querier 

test:
	@go test ./...
