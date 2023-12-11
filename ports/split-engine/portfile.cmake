vcpkg_from_github(
        OUT_SOURCE_PATH SOURCE_PATH
        REPO xWinuX/SplitEngine
        REF 3b3d70137d36fcd6268dbfd8d398417ac74eacaf
        SHA512 785fe8220d7c6593b688c8d7bdc4fa8b74427e63122db32494e2fc9e06db20bf13cf19c092fb861d0e1784f2fed010335f2fb32dda4e511a50f4264c3507575e
        HEAD_REF dev
)

vcpkg_check_features(
        OUT_FEATURE_OPTIONS FEATURE_OPTIONS
        FEATURES
        headless HEADLESS
)

vcpkg_configure_cmake(
        SOURCE_PATH ${SOURCE_PATH}
        PREFER_NINJA
        OPTIONS ${FEATURE_OPTIONS}
        "-DCMAKE_LIBRARY_OUTPUT_DIRECTORY=${CMAKE_CURRENT_BINARY_DIR}/lib"
)

vcpkg_install_cmake()
vcpkg_fixup_cmake_targets()

file(REMOVE_RECURSE
        ${CURRENT_PACKAGES_DIR}/debug/include
        ${CURRENT_PACKAGES_DIR}/debug/share
)

file(INSTALL ${SOURCE_PATH}/include DESTINATION ${CURRENT_PACKAGES_DIR}/include
        FILES_MATCHING
        PATTERN "*.h"
        PATTERN "*.hpp"
)

file(
        INSTALL "${SOURCE_PATH}/LICENSE"
        DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}"
        RENAME copyright)

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