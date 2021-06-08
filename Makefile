# Project related variables.
VERSION := $(shell git rev-parse --verify HEAD --short=7)
BRANCH=$(shell git rev-parse --abbrev-ref HEAD)
PROJECTNAME := $(shell basename "$(PWD)")

all: help

build-hw-linux:
	@echo "build ${PROJECTNAME}"
	GOOS=linux GOARCH=amd64 go build -o bin/hw main.go

help: 
	@echo "make build       		build hw"
