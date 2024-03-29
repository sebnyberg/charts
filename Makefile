# Determine this makefile's path.
# Be sure to place this BEFORE `include` directives, if any.
THIS_FILE := $(lastword $(MAKEFILE_LIST))

.PHONY: app, api, postgresql, update-index

all:  api postgresql update-index

postgresql:
	@helm package --save=false charts/postgresql

update-index:
	@helm repo index --url https://sebnyberg.github.io/charts .