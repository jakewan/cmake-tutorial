# CMake Tutorial Workbook

This is project captures results from following the basic [CMake tutorial](https://cmake.org/cmake/help/v3.19/guide/tutorial/).

## Workarounds

### 1\. RPATH issue on macOS

I got into hot water at Step 9 trying to run the executable from the install `bin` directory. This has something to do with how we "refactor MathFunctions to become a real library". Basically, on macOS, CMake causes the linker to produce an executable that works in the build tree, but not so well when installed. There is information about this issue at [RPATH Handling](https://gitlab.kitware.com/cmake/community/-/wikis/doc/cmake/RPATH-handling), but unfortunately, I wasn't able to understand it well enough to come up with a proper solution. What I ended up doing was assuming that on macOS, it's necessary to supply a value for `DYLD_LIBRARY_PATH` that includes the directory containing libMathFunctions.dylib.

```bash
DYLD_LIBRARY_PATH="$(pwd)/install/step-9-with-my-math/lib" install/step-9-with-my-math/bin/Tutorial 9
Use the table to help find an initial value
Computing sqrt of 9 to be 3
Computing sqrt of 9 to be 3
Computing sqrt of 9 to be 3
Computing sqrt of 9 to be 3
Computing sqrt of 9 to be 3
Computing sqrt of 9 to be 3
Computing sqrt of 9 to be 3
Computing sqrt of 9 to be 3
Computing sqrt of 9 to be 3
Computing sqrt of 9 to be 3
The square root of 9 is 3
```

This allows me to continue the tutorial, but hopefully a way to fix this by changing the top-level CMakeLists.txt file will present itself.
