.DEFAULT_GOAL := help

.PHONY: help deploy

help: ## Show available make targets
	@awk 'BEGIN {FS = ":.*##"} /^[a-zA-Z0-9_.-]+:.*##/ {printf "  %-20s %s\n", $$1, $$2}' $(MAKEFILE_LIST)

deploy: ## Run deployment script
	bash ./scripts/deploy.sh
