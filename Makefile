# Project related variables.
VERSION := $(shell git rev-parse --verify HEAD --short=7)
BRANCH=$(shell git rev-parse --abbrev-ref HEAD)
PROJECTNAME := $(shell basename "$(PWD)")

all: help

build-hw:
	@echo "build ${PROJECTNAME}"
	go build -o bin/hw main.go

help: 
	@echo "make build       		build hw"
