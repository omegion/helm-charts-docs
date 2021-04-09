PACKAGE_JSON_FILE  = src/package.json
ACTION_FILE  	   = action.yml

.PHONY: cut-tag
cut-tag:
	@echo "Cutting $(version)"
	yq eval '.inputs.dockerImageVersion.default = "$(version)"' -i $(ACTION_FILE)
	cd src && npm version $(version) --no-git-tag-version --allow-same-version
	git commit -m "Bump to $(version)" $(PACKAGE_JSON_FILE) $(ACTION_FILE) --allow-empty
	git push
	git tag $(version)
	git push origin $(version)
