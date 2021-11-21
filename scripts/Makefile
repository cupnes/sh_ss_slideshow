NAME=sh_ss_slideshow
TARGETS=$(NAME).iso $(NAME).cue
TOOLS_PATH=tools
EMU=yabause -a -nb -i
IMAGES_PATH=../images

all: $(TARGETS)

$(NAME).cue: $(NAME).iso
	$(TOOLS_PATH)/make_cue.sh $< >$@

$(NAME).iso: converted_images 0.BIN
	./iso9660.sh 0.BIN converted_images/* >$@

0.BIN: src/main.sh src/vars.o src/vars_map.sh src/funcs.o src/funcs_map.sh
	./$< >$@

src/funcs.o src/funcs_map.sh: src/funcs.sh src/vars_map.sh
	src/funcs.sh >src/funcs.o

src/vars.o src/vars_map.sh: src/vars.sh font.lut
	src/vars.sh >src/vars.o

converted_images:
	./prepare_images.sh $(IMAGES_PATH)

run: $(NAME).iso
	$(EMU) $<

clean:
	rm -rf *~ *.o *.dat *.bin 0.BIN *.lst *.img *.ppm	\
	src/*_map.sh $(TARGETS) src/*~ src/*.o include/*~	\
	converted_images convert_tmp

clean_all: clean
	rm -f IP.BIN

.PHONY: run clean clean_all
