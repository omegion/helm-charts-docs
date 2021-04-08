.PHONY: cut-tag
cut-tag:
	@echo "Cutting $(version)"
	yq eval '.inputs.dockerImageVersion.default = "$(version)"' -i action.yml
	git tag $(version)
	git push origin $(version)
