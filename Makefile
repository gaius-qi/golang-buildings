# Project related variables.
VERSION := $(shell git rev-parse --verify HEAD --short=7)
PROJECTNAME := "hw"
ARCHIVE_PREFIX="$(PROJECTNAME)_$(VERSION)"

all: help

bin:
	@mkdir $@

build-linux: bin 
	@echo "build linux"
	GOOS=linux GOARCH=amd64 go build -o bin/hw main.go

build-rpm: bin build-linux
	@echo "build rpm"
	@docker run --rm \
	-v "$(PWD):/tmp" \
	-e "VERSION=$(VERSION)" \
	goreleaser/nfpm pkg \
		--config /tmp/build/package/hw/nfpm.yaml \
		--target /tmp/bin/$(ARCHIVE_PREFIX)_linux_amd64.rpm

build-deb: bin build-linux
	@echo "build rpm"
	@docker run --rm \
	-v "$(PWD):/tmp" \
	-e "VERSION=$(VERSION)" \
	goreleaser/nfpm pkg \
		--config /tmp/build/package/hw/nfpm.yaml \
		--target /tmp/bin/$(ARCHIVE_PREFIX)_linux_amd64.deb

changelog:
	@git-chglog -o CHANGELOG.md

clean:
	go clean
	@rm -rf bin

help: 
	@echo "make bin       		create bin directory"
	@echo "make build-linux       		build linux"
	@echo "make build-rpm       		build rpm"
	@echo "make build-deb       		build deb"
