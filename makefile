.PHONY: build-docs

build-docs:
	update-docc-gh-pages-documentation-site swift-extensions FzkExtensions --include-extended-types
