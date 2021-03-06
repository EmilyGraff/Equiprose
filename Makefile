BIN = ./node_modules/.bin
REPORTER = spec

install:
	@npm install --production

dev:
	@npm install

test:
	@NODE_ENV=test $(BIN)/mocha --require blanket --reporter $(REPORTER)

test-cov:
	$(MAKE) test REPORTER=html-cov 1> coverage.html

test-coveralls:
	$(MAKE) test REPORTER=mocha-lcov-reporter | $(BIN)/coveralls

.PHONY: install dev test test-coveralls test-cov
