INSTALL_ROOT=$(shell pwd)/install

build-step-1:
	@mkdir -p build/step-1
	@rm -rf build/step-1/*
	cd build/step-1 && cmake ../../Step1
	cd build/step-1 && cmake --build .

build-step-2-with-my-math:
	@mkdir -p build/step-2-with-my-math
	@rm -rf build/step-2-with-my-math/*
	cd build/step-2-with-my-math && cmake ../../Step2
	cd build/step-2-with-my-math && cmake --build .

build-step-2-without-my-math:
	@mkdir -p build/step-2-without-my-math
	@rm -rf build/step-2-without-my-math/*
	cd build/step-2-without-my-math && cmake ../../Step2 -DUSE_MYMATH=OFF
	cd build/step-2-without-my-math && cmake --build .

build-step-3-with-my-math:
	@mkdir -p build/step-3-with-my-math
	@rm -rf build/step-3-with-my-math/*
	cd build/step-3-with-my-math && cmake ../../Step3
	cd build/step-3-with-my-math && cmake --build .

build-step-3-without-my-math:
	@mkdir -p build/step-3-without-my-math
	@rm -rf build/step-3-without-my-math/*
	cd build/step-3-without-my-math && cmake ../../Step3 -DUSE_MYMATH=OFF
	cd build/step-3-without-my-math && cmake --build .

build-step-4-with-my-math:
	@mkdir -p build/step-4-with-my-math
	@rm -rf build/step-4-with-my-math/*
	cd build/step-4-with-my-math && cmake ../../Step4
	cd build/step-4-with-my-math && cmake --build .

install-step-4-with-my-math:
	mkdir -p install/step-4-with-my-math
	rm -rf install/step-4-with-my-math/*
	cd build/step-4-with-my-math && cmake \
		--install . \
		--prefix "$(INSTALL_ROOT)/step-4-with-my-math"

test-step-4-with-my-math:
	cd build/step-4-with-my-math && ctest -N

build-step-4-without-my-math:
	@mkdir -p build/step-4-without-my-math
	@rm -rf build/step-4-without-my-math/*
	cd build/step-4-without-my-math && cmake ../../Step4 -DUSE_MYMATH=OFF
	cd build/step-4-without-my-math && cmake --build .

install-step-4-without-my-math:
	mkdir -p install/step-4-without-my-math
	rm -rf install/step-4-without-my-math/*
	cd build/step-4-without-my-math && cmake \
		--install . \
		--prefix "$(INSTALL_ROOT)/step-4-without-my-math"

test-step-4-without-my-math:
	cd build/step-4-without-my-math && ctest -N

build-step-5-with-my-math:
	@mkdir -p build/step-5-with-my-math
	@rm -rf build/step-5-with-my-math/*
	cd build/step-5-with-my-math && cmake ../../Step5
	cd build/step-5-with-my-math && cmake --build .

install-step-5-with-my-math:
	mkdir -p install/step-5-with-my-math
	rm -rf install/step-5-with-my-math/*
	cd build/step-5-with-my-math && cmake \
		--install . \
		--prefix "$(INSTALL_ROOT)/step-5-with-my-math"
