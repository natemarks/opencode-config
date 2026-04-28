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

# Directories that must exist before copying
TARGET_DIRS := $(sort $(dir $(ALL_TARGETS)))

# ── Targets ──────────────────────────────────────────────────────────────
.PHONY: help deploy clean redeploy

help: ## Show available make targets
	@awk 'BEGIN {FS = ":.*##"} /^[a-zA-Z0-9_.-]+:.*##/ {printf "  %-20s %s\n", $$1, $$2}' $(MAKEFILE_LIST)

deploy: $(ALL_TARGETS) ## Deploy configuration to ~/.config/opencode

redeploy: clean deploy ## Clean managed files then deploy

clean: ## Remove deployed configuration files
	rm -rf $(TARGET_DIR)/agent
	rm -rf $(TARGET_DIR)/skills
	rm -f  $(TARGET_DIR)/opencode.json

# ── Directory creation ───────────────────────────────────────────────────
$(TARGET_DIRS):
	mkdir -p $@

# ── File copy rules ─────────────────────────────────────────────────────
$(TARGET_DIR)/agent/%.md: agent/%.md | $(TARGET_DIR)/agent/
	cp $< $@

$(TARGET_DIR)/skills/%: skills/% | $(TARGET_DIR)/skills/
	@mkdir -p $(dir $@)
	cp $< $@

$(TARGET_DIR)/opencode.json: opencode.json | $(TARGET_DIR)/
	cp $< $@
