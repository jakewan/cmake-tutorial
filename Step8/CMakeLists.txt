cmake_minimum_required(VERSION 3.10)

# Set the project name
project(Tutorial VERSION 1.0)

# Specify C++ standard
set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED True)

option(USE_MYMATH "Use math implementation provided by the tutorial" ON)

# Configure a header to pass the version to the source code
configure_file(TutorialConfig.h.in TutorialConfig.h)

if(USE_MYMATH)
    # Add the MathFunctions library
    add_subdirectory(MathFunctions)
    list(APPEND EXTRA_LIBS MathFunctions)
endif()

# Add the executable
add_executable(Tutorial tutorial.cxx)

# Link the executable and the MathFunctions library
target_link_libraries(Tutorial PUBLIC ${EXTRA_LIBS})

# Ensure configured files written into the binary tree can be found
target_include_directories(
    Tutorial PUBLIC
    "${PROJECT_BINARY_DIR}"
    )

install(TARGETS Tutorial DESTINATION bin)
install(FILES "${PROJECT_BINARY_DIR}/TutorialConfig.h"
    DESTINATION include
    )

# Enable dashboard scripting
include(CTest)

# Does the application run?
add_test(NAME Runs COMMAND Tutorial 25)

# Does the usage message work?
add_test(NAME Usage COMMAND Tutorial)
set_tests_properties(Usage
    PROPERTIES PASS_REGULAR_EXPRESSION "Usage:.*number"
)

# Define a function to simplify adding tests
function(do_test target arg result)
    add_test(NAME Comp${arg} COMMAND ${target} ${arg})
    set_tests_properties(Comp${arg}
        PROPERTIES PASS_REGULAR_EXPRESSION ${result}
    )
endfunction(do_test)

# Do a bunch of result based tests
do_test(Tutorial 4 "4 is 2")
do_test(Tutorial 9 "9 is 3")
do_test(Tutorial 5 "5 is 2.236")
do_test(Tutorial 7 "7 is 2.645")
do_test(Tutorial 25 "25 is 5")
do_test(Tutorial -25 "-25 is [-nan|nan|0]")
do_test(Tutorial 0.0001 "0.0001 is 0.01")

include(InstallRequiredSystemLibraries)
set(CPACK_RESOURCE_FILE_LICENSE "${CMAKE_CURRENT_SOURCE_DIR}/License.txt")
set(CPACK_PACKAGE_VERSION_MAJOR "${Tutorial_VERSION_MAJOR}")
set(CPACK_PACKAGE_VERSION_MINOR "${Tutorial_VERSION_MINOR}")
include(CPack)
