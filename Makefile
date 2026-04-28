.DEFAULT_GOAL := help

# ── Paths ────────────────────────────────────────────────────────────────
TARGET_DIR := $(HOME)/.config/opencode

# Source files
AGENT_SRCS  := $(wildcard agent/*.md)
SKILL_SRCS  := $(shell find skills -type f)
CONFIG_SRC  := opencode.json

# Corresponding targets under $(TARGET_DIR)
AGENT_TARGETS := $(addprefix $(TARGET_DIR)/,$(AGENT_SRCS))
SKILL_TARGETS := $(addprefix $(TARGET_DIR)/,$(SKILL_SRCS))
CONFIG_TARGET := $(TARGET_DIR)/opencode.json

ALL_TARGETS := $(AGENT_TARGETS) $(SKILL_TARGETS) $(CONFIG_TARGET)

# ── Targets ──────────────────────────────────────────────────────────────
.PHONY: help deploy clean redeploy

help: ## Show available make targets
	@awk 'BEGIN {FS = ":.*##"} /^[a-zA-Z0-9_.-]+:.*##/ {printf "  %-20s %s\n", $$1, $$2}' $(MAKEFILE_LIST)

deploy: $(ALL_TARGETS) ## Deploy configuration to ~/.config/opencode

redeploy: ## Clean managed files then deploy
	$(MAKE) clean
	$(MAKE) deploy

clean: ## Remove deployed configuration files
	rm -rf $(TARGET_DIR)/agent
	rm -rf $(TARGET_DIR)/skills
	rm -f  $(TARGET_DIR)/opencode.json

# ── File copy rules ─────────────────────────────────────────────────────
$(TARGET_DIR)/agent/%.md: agent/%.md
	@mkdir -p $(dir $@)
	cp $< $@

$(TARGET_DIR)/skills/%: skills/%
	@mkdir -p $(dir $@)
	cp $< $@

$(TARGET_DIR)/opencode.json: opencode.json
	@mkdir -p $(dir $@)
	cp $< $@
