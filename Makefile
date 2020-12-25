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
