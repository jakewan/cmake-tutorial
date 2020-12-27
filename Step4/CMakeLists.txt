cmake_minimum_required(VERSION 3.10)

# set the project name
project(Tutorial VERSION 1.0)

# specify C++ standard
set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED True)

option(USE_MYMATH "Use math implementation provided by the tutorial" ON)

# configure a header to pass the version to the source code
configure_file(TutorialConfig.h.in TutorialConfig.h)

if(USE_MYMATH)
    # add the MathFunctions library
    add_subdirectory(MathFunctions)
    list(APPEND EXTRA_LIBS MathFunctions)
endif()

# add the executable
add_executable(Tutorial tutorial.cxx)

# link the executable and the MathFunctions library
target_link_libraries(Tutorial PUBLIC ${EXTRA_LIBS})

# so that configured files written into the binary tree can be found
target_include_directories(
    Tutorial PUBLIC
    "${PROJECT_BINARY_DIR}"
    )

install(TARGETS Tutorial DESTINATION bin)
install(FILES "${PROJECT_BINARY_DIR}/TutorialConfig.h"
    DESTINATION include
    )
