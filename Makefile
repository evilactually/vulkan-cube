
cube.exe: cube.c cube-frag.spv cube-vert.spv
	gcc -std=c99 $< -lvulkan-1 -lgdi32 -L lib -I include -o $@

cube-vert.spv: cube.vert
	glslangValidator -G $< -o $@

cube-frag.spv: cube.frag
	glslangValidator -G $< -o $@

# $(BIN_DIR)/LustriousPaint.exe: $(SRC_DIR)/main.rs \
# 	                           $(LIB_DIR)/libctypes.rlib \
# 	                           $(LIB_DIR)/libwin32.rlib \
# 	                           $(LIB_DIR)/libdx11.rlib \
# 	                           $(RES_DIR)/icon.res \
# 	                           $(RES_DIR)/version.res \
# 	                           | $(BIN_DIR)
# 	rustc $< -L $(LIB_DIR) -C link_args="-Wl,--subsystem,windows build/res/icon.res build/res/version.res libtest.o" -L ./ -o $@

# # -lD3D11.lib

# $(LIB_DIR)/libctypes.rlib: $(SRC_DIR)/ctypes.rs | $(LIB_DIR)
# 	rustc $< -L $(LIB_DIR) --out-dir=$(LIB_DIR)

# $(LIB_DIR)/libwin32.rlib: $(SRC_DIR)/win32/lib.rs $(SRC_DIR)/win32/*.rs $(LIB_DIR)/libctypes.rlib | $(LIB_DIR)
# 	rustc $< -L $(LIB_DIR) --out-dir=$(LIB_DIR)

# $(LIB_DIR)/libdx11.rlib: $(SRC_DIR)/dx11/lib.rs $(SRC_DIR)/dx11/*.rs $(LIB_DIR)/libwin32.rlib $(LIB_DIR)/libctypes.rlib | $(LIB_DIR)
# 	rustc $< -L $(LIB_DIR) --out-dir=$(LIB_DIR)

# $(RES_DIR)/icon.res: $(RESOURCES_DIR)/icon.rc $(RESOURCES_DIR)/icon.ico | $(RES_DIR)
# 	windres.exe -i $< -O coff -o $@

# $(RES_DIR)/version.res: $(RESOURCES_DIR)/version.rc | $(RES_DIR)
# 	windres.exe -i $< -O coff -o $@

# $(RES_DIR):
# 	mkdir -p $@

# $(LIB_DIR):
# 	mkdir -p $@

$(BIN_DIR):
	mkdir -p $@

clean:
	rm -rf cube.exe cube-frag.spv cube-vert.spv
