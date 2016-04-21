
cube.exe: cube.c cube-frag.spv cube-vert.spv
	gcc -std=c99 $< -lvulkan-1 -lgdi32 -L lib -I include -o $@

cube-vert.spv: cube.vert
	glslangValidator -G $< -o $@

cube-frag.spv: cube.frag
	glslangValidator -G $< -o $@

$(BIN_DIR):
	mkdir -p $@

clean:
	rm -rf cube.exe cube-frag.spv cube-vert.spv
