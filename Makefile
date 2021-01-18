SRC = \
	src/model.scad \

STL = $(SRC:.scad=.stl)
PNG = $(SRC:.scad=.png)

all: $(STL)

previews: $(PNG)

%.stl: %.scad config.scad
	openscad -o $@ $<

%.png: %.scad config.scad
	openscad -o $@ --render --viewall --autocenter $<

clean:
	rm -rf $(STL) $(PNG)

.PHONY: clean all previews
