
VERSION=0.0.1

dev: build

.PHONY: clean
clean:
	rm -fr dist
	find . -name __pycache__ -exec "rm" "-fr" "{}" ";" -prune
	find . -name *.egg-info -exec "rm" "-fr" "{}" ";" -prune

.PHONY: build
build:
	python3 -m build

.PHONY: test
test: requirements.txt
	python3 -m unittest discover --buffer --start-directory python/
	jehon/usr/bin/jh-python-test

release: build
	mkdir -p tmp/release/jpython
	cp dist/* tmp/release/jpython
	