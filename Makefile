all: index.html js

index.html: template
	tt-render --path=$< --post-chomp index.html > $@

.PHONY: js
js:
	coffee --compile --output js lib/*.coffee


