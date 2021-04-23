#acceptable build_types: Release/Debug/Profile
build_type=Release

.SILENT:

all: msgs build build/CMakeLists.txt.copy
	$(info Build_type is [${build_type}])
	$(MAKE) --no-print-directory -C build

clean:
	rm -rf build bin lib

build/CMakeLists.txt.copy: build CMakeLists.txt Makefile manifest.xml
	cd build && cmake -DCMAKE_BUILD_TYPE=$(build_type) ..
	cp CMakeLists.txt build/CMakeLists.txt.copy

build:
	mkdir -p build

msgs: 
	cd amrl_msgs && $(MAKE)
	cd amrl_shared_lib && $(MAKE)
	cd vector_display && $(MAKE)
	cd ut_multirobot_sim && $(MAKE) 
