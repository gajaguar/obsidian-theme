##@ Theme

deploy: ## Copy the theme into the vault at $OBSIDIAN__VAULT_PATH
	@test -n "$(OBSIDIAN__VAULT_PATH)" || { echo "OBSIDIAN__VAULT_PATH is required (path to the Obsidian vault)" >&2; exit 1; }
	$(NPM) run build
