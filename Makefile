.PHONY: cut-tag
cut-tag:
	@echo "Cutting v$(version)"
	git tag v$(version)
	git push origin v$(version)
