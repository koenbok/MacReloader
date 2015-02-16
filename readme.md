#### Browser Reloader

This script lets you reload any open url in Safari and Chrome (Mac only). It works via AppleScript and is very hacky but reliable.

It is a pretty great alternative to browsersync (no server required) and livereload (polling).

#### Usage

```
reloader = require("macreloader")
reloader.reload("file://home/koen/test.html")
```

#### Testing

- run `make test`

Your browser(s) should open a test index.html and refresh after three seconds.

#### Building

- run `make build`