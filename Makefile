# Project related variables.
PROJECTNAME := $(shell basename "$(PWD)")

all: help

build-linux:
	@echo "build ${PROJECTNAME}"
	GOOS=linux GOARCH=amd64 go build -o bin/hw main.go

help: 
	@echo "make build       		build hw"
