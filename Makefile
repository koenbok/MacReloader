build:
	@./node_modules/.bin/coffee -c reloader.coffee
test: 
	open -a "Safari" test/index.html
	open -a "Google Chrome" test/index.html
	sleep 3
	node test/test.js

.PHONY: build test

