include ./cli/common.mk
include ./cli/ui.mk
include ./cli/server.mk

.PHONY: help test
help:
	@echo "usage: make <option>"
	@echo "options and effects:"
	@echo "    help             : Show help"
	@echo "    all              : Build multiple binary of this project"
	@echo "    test             : Test ..."
	@echo "    dev              : Run with dev mode"
	@echo "    preview          : Preview mode"
	@echo "    build            : Build the binary of this project"
	@echo "    build-win        : Build the windows binary of this project"
	@echo "    build-linux      : Build the linux binary of this project"
	@echo "    build-darwin     : Build the darwin binary of this project"

test:
	@echo $(ROOT_PATH)
	@echo $(PROJECT_ROOT_PATH)

# 开启服务
.PHONY: dev
dev:
	@$(MAKE) dev-server
	echo "[Dev] Start Server success ..."

# 预览模式
preview:
	@$(MAKE) build-ui
	@$(MAKE) mv-ui
	@$(MAKE) dev-server
	echo "Preview success ..."

# build
.PHONY: build
build:
	@$(MAKE) build-ui
	@$(MAKE) mv-ui
	@$(MAKE) build-server
	echo "Build success ..."

.PHONY: all
all: build-win build-linux build-darwin

build-win:
	@$(MAKE) build-ui
	@$(MAKE) mv-ui
	@$(MAKE) build-server-win
	echo "Build windows success ..."

build-linux:
	@$(MAKE) build-ui
	@$(MAKE) mv-ui
	@$(MAKE) build-server-linux
	echo "Build linux success ..."

build-darwin:
	@$(MAKE) build-ui
	@$(MAKE) mv-ui
	@$(MAKE) build-server-darwin
	echo "Build darwin success ..."

.PHONY:	push
push:
	@git add .
	git commit -m "脚本自动push"
	git push origin main