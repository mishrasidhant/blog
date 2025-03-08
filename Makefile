HUGO=hugo
SUBMODULE_PUBLIC_DIR=public
BASE_URL?="https://mishrasidhant.github.io/"
GIT_CONFIG_GLOBAL := $(HOME)/.gitconfig

default: localhost

check-user:
	whoami
	git config --global --list; \
	ssh -T git@github.com

clean:
	rm -rf $(SUBMODULE_PUBLIC_DIR)/*

generate:
	$(HUGO) --gc --minify --baseURL $(BASE_URL)

check-commit-message:
	@if [ -z "$(m)" ]; then \
		printf "Error: Commit message empty. \n\tUsage: make publish m=\"Add commit message\"\n" && exit 1; \
	fi

commit-submodule:
	@cd $(SUBMODULE_PUBLIC_DIR); \
	git add . && git commit -m "$(m)" && git push origin main

get-submodule-sha:
	$(eval SUBMODULE_SHA := $(shell cd $(SUBMODULE_PUBLIC_DIR) && git rev-parse HEAD))

commit-main: get-submodule-sha
	@git add . && git commit -m "$(m) - $(SUBMODULE_SHA)" && git push origin main

publish: check-commit-message clean generate commit-submodule commit-main

localhost: clean
	$(HUGO) server

.PHONY: localhost publish