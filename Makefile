INSTALL_ROOT=$(shell pwd)/install

step-1-build:
	@mkdir -p build/step-1
	@rm -rf build/step-1/*
	cd build/step-1 && cmake ../../Step1
	cd build/step-1 && cmake --build .

step-2-build-with-my-math:
	@mkdir -p build/step-2-with-my-math
	@rm -rf build/step-2-with-my-math/*
	cd build/step-2-with-my-math && cmake ../../Step2
	cd build/step-2-with-my-math && cmake --build .

step-2-build-without-my-math:
	@mkdir -p build/step-2-without-my-math
	@rm -rf build/step-2-without-my-math/*
	cd build/step-2-without-my-math && cmake ../../Step2 -DUSE_MYMATH=OFF
	cd build/step-2-without-my-math && cmake --build .

step-3-build-with-my-math:
	@mkdir -p build/step-3-with-my-math
	@rm -rf build/step-3-with-my-math/*
	cd build/step-3-with-my-math && cmake ../../Step3
	cd build/step-3-with-my-math && cmake --build .

step-3-build-without-my-math:
	@mkdir -p build/step-3-without-my-math
	@rm -rf build/step-3-without-my-math/*
	cd build/step-3-without-my-math && cmake ../../Step3 -DUSE_MYMATH=OFF
	cd build/step-3-without-my-math && cmake --build .

step-4-build-with-my-math:
	@mkdir -p build/step-4-with-my-math
	@rm -rf build/step-4-with-my-math/*
	cd build/step-4-with-my-math && cmake ../../Step4
	cd build/step-4-with-my-math && cmake --build .

step-4-install-with-my-math:
	mkdir -p install/step-4-with-my-math
	rm -rf install/step-4-with-my-math/*
	cd build/step-4-with-my-math && cmake \
		--install . \
		--prefix "$(INSTALL_ROOT)/step-4-with-my-math"

step-4-test-with-my-math:
	cd build/step-4-with-my-math && ctest -N

step-4-build-without-my-math:
	@mkdir -p build/step-4-without-my-math
	@rm -rf build/step-4-without-my-math/*
	cd build/step-4-without-my-math && cmake ../../Step4 -DUSE_MYMATH=OFF
	cd build/step-4-without-my-math && cmake --build .

step-4-install-without-my-math:
	mkdir -p install/step-4-without-my-math
	rm -rf install/step-4-without-my-math/*
	cd build/step-4-without-my-math && cmake \
		--install . \
		--prefix "$(INSTALL_ROOT)/step-4-without-my-math"

step-4-test-without-my-math:
	cd build/step-4-without-my-math && ctest -N

step-5-build-with-my-math:
	@mkdir -p build/step-5-with-my-math
	@rm -rf build/step-5-with-my-math/*
	cd build/step-5-with-my-math && cmake ../../Step5
	cd build/step-5-with-my-math && cmake --build .

step-5-install-with-my-math:
	mkdir -p install/step-5-with-my-math
	rm -rf install/step-5-with-my-math/*
	cd build/step-5-with-my-math && cmake \
		--install . \
		--prefix "$(INSTALL_ROOT)/step-5-with-my-math"

step-6-build-with-my-math:
	@mkdir -p build/step-6-with-my-math
	@rm -rf build/step-6-with-my-math/*
	cd build/step-6-with-my-math && cmake ../../Step6
	cd build/step-6-with-my-math && cmake --build .

step-6-install-with-my-math:
	mkdir -p install/step-6-with-my-math
	rm -rf install/step-6-with-my-math/*
	cd build/step-6-with-my-math && cmake \
		--install . \
		--prefix "$(INSTALL_ROOT)/step-6-with-my-math"

step-7-build-with-my-math:
	@mkdir -p build/step-7-with-my-math
	@rm -rf build/step-7-with-my-math/*
	cd build/step-7-with-my-math && cmake ../../Step7
	cd build/step-7-with-my-math && cmake --build .

step-7-create-binary-distribution: step-7-build-with-my-math
	cd build/step-7-with-my-math && cpack -G ZIP

step-8-build-with-my-math:
	@mkdir -p build/step-8-with-my-math
	@rm -rf build/step-8-with-my-math/*
	cd build/step-8-with-my-math && cmake ../../Step8
	cd build/step-8-with-my-math && cmake --build .

step-8-test-and-submit: step-8-build-with-my-math
	cd build/step-8-with-my-math && ctest -D Experimental

step-9-build-with-my-math:
	@mkdir -p build/step-9-with-my-math
	@rm -rf build/step-9-with-my-math/*
	cd build/step-9-with-my-math && cmake ../../Step9
	cd build/step-9-with-my-math && cmake --build .

step-9-install-with-my-math: step-9-build-with-my-math
	@mkdir -p install/step-9-with-my-math
	@rm -rf install/step-9-with-my-math/*
	cd build/step-9-with-my-math && cmake \
		--install . \
		--prefix "$(INSTALL_ROOT)/step-9-with-my-math"
