vcpkg_from_github(
        OUT_SOURCE_PATH SOURCE_PATH
        REPO xWinuX/SplitEngine # Please replace with actual value
        REF 3b3d70137d36fcd6268dbfd8d398417ac74eacaf # replace with actual value
        SHA512 0 # replace with actual value
        HEAD_REF dev
)

vcpkg_check_features(
        OUT_FEATURE_OPTIONS FEATURE_OPTIONS
        FEATURES
        headless HEADLESS
)

vcpkg_find_acquire_program(CMAKE)
get_filename_component(CMAKE_EXE_PATH ${CMAKE} DIRECTORY)

vcpkg_configure_cmake(
        SOURCE_PATH ${SOURCE_PATH}
        PREFER_NINJA
        OPTIONS ${FEATURE_OPTIONS}
        "-DCMAKE_ARCHIVE_OUTPUT_DIRECTORY=${CMAKE_CURRENT_BINARY_DIR}/lib"
        "-DCMAKE_LIBRARY_OUTPUT_DIRECTORY=${CMAKE_CURRENT_BINARY_DIR}/lib"
        "-DCMAKE_RUNTIME_OUTPUT_DIRECTORY=${CMAKE_CURRENT_BINARY_DIR}/bin"
)

vcpkg_install_cmake()

vcpkg_fixup_cmake_targets(CONFIG_PATH lib/cmake/${PORT})

file(INSTALL ${SOURCE_PATH}/include DESTINATION ${CURRENT_PACKAGES_DIR}/include
        FILES_MATCHING
        PATTERN "*.h"
        PATTERN "*.hpp"
)

vcpkg_copy_pdbs()

file(REMOVE_RECURSE
        ${CURRENT_PACKAGES_DIR}/debug/include
        ${CURRENT_PACKAGES_DIR}/debug/share
)

vcpkg_find_acquire_program(SPIRV-CROSS)
vcpkg_find_acquire_program(VULKAN-HEADERS)
vcpkg_find_acquire_program(VULKAN-MEMORY-ALLOCATOR)

vcpkg_copy_tools(
        TARGET_FILES ${SOURCE_PATH}/tool_files
        TOOL_NAMES spirv-cross-core spirv-cross-glsl spirv-cross-cpp spirv-cross-reflect spirv-cross-util
        AUTO_CLEAN
)

vcpkg_copy_tools(TOOL_NAMES Vulkan Vulkan::Headers GPUOpen::VulkanMemoryAllocator)
vcpkg_copy_tools(TOOL_NAMES imgui::imgui)
vcpkg_copy_tools(TOOL_NAMES glm::glm)
vcpkg_copy_tools(TOOL_NAMES SDL2::SDL2main)
vcpkg_copy_tools(TOOL_NAMES SDL2::SDL2-static)
vcpkg_copy_tools(TOOL_NAMES Stb)

file(INSTALL ${SOURCE_PATH}/res DESTINATION ${CURRENT_PACKAGES_DIR}/share/${PORT})

vcpkg_test_cmake(PACKAGE_NAME ${PORT})