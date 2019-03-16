.DEFAULT_GOAL := help
.PHONY: test tap unit jshint skel help
REPORTER = spec

all: jshint test  ## TODO: Document

build:  ## runs the application
	npm run build

help:  ## Prints this help message.
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

jshint:  ## TODO: Document
	jshint lib examples test index.js

run:  ## runs the application
	npm run start

skel:  ## Sets up the skeleton for a project.
	mkdir examples lib test
	touch index.js
	npm install mocha chai --save-dev

tap:  ## TODO: Document
	@NODE_ENV=test ./node_modules/.bin/mocha -R tap > results.tap

tests: test  ## Synonym for test

test:  ## TODO: Document
	@NODE_ENV=test ./node_modules/.bin/mocha --recursive --reporter $(REPORTER) --timeout 3000

unit:  ## TODO: Document
	npm run test-unit

unit-cover:  ## TODO: Document
	find ./src -name "*.spec.js" -not -path "./node_modules/*" -print0 | xargs -0 npx istanbul cover _mocha --compilers js:@babel/register
