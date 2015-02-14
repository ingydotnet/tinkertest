all: index.html js

index.html: template
	tt-render --path=$< --post-chomp index.html > $@

.PHONY: js
js:
	coffee --compile --output js lib/*.coffee

start:
	sudo plackup -s Starman -p 5001 -E deployment --workers=10 -a bin/tinkertest
