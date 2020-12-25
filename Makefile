build-step-1:
	@mkdir -p build/step-1
	@rm -rf build/step-1/*
	cd build/step-1 && cmake ../../Step1
	cd build/step-1 && cmake --build .
