THEME	 = pix9
SRC	 = $(wildcard src/*)
ARROWS	 = e-resize ew-resize nw-resize nwse-resize s-resize se-resize sw-resize w-resize
CURSORS	 = $(SRC:src/%=%) $(ARROWS)
SCALE	?= 2

PREFIX	?= /usr
DESTDIR	 = $(PREFIX)/share/icons/$(THEME)

export PATH := $(PWD):$(PATH)

all: $(CURSORS)

$(CURSORS): $(addprefix cursors/, $(CURSORS))

cursors/%: src/%
	ascii2xcur $< > $@

$(addprefix src/, $(ARROWS)):
	cd src/; mkarrows

lint:
	cd src/; lint

install: all
	install -D -t $(DESTDIR) index.theme
	install -D -t $(DESTDIR)/cursors cursors/*

clean:
	find cursors/ -type f -exec rm -f -- {} +
	rm -f -- $(addprefix src/, $(ARROWS))
	rm -f -- preview previews/*

preview: $(addprefix src/, $(ARROWS))
	mkpreview > preview
	< preview ascii2svg > previews/alpha.svg
	sed '1s/\(background-color: *\)none/\1grey/' previews/alpha.svg > previews/grey.svg
#	< preview ascii2tga > previews/alpha.tga
#	< preview tr ' ' 'O' | ascii2tga > previews/light.tga
#	< preview tr ' ' ':' | ascii2tga > previews/dark.tga
#	< preview ascii2ppm > preview_light.ppm
#	< preview tr ' ' ':' | ascii2ppm > preview_dark.ppm

.PHONY: all lint install clean preview
