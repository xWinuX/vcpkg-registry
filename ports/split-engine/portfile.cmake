vcpkg_from_github(
        OUT_SOURCE_PATH SOURCE_PATH
        REPO xWinuX/SplitEngine
        REF edba43d5e1848f7fbe78eeef57acc747e5c2605f
        SHA512 11fc3c53cce90acede38b4b3419a8a3db4b4d535a236ce44400ac4b694c573a8cb0e10855c799a49ff1a442ff1e52eaeb4fd6cfd51b8b793d0be8e2b9a024989
        HEAD_REF dev
)

vcpkg_configure_cmake(
        SOURCE_PATH ${SOURCE_PATH}
        PREFER_NINJA
        OPTIONS ${FEATURE_OPTIONS}
        "-DCMAKE_LIBRARY_OUTPUT_DIRECTORY=${CMAKE_CURRENT_BINARY_DIR}/lib"
)

vcpkg_install_cmake()

vcpkg_fixup_cmake_targets()

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

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

file(
        INSTALL "${SOURCE_PATH}/LICENSE"
        DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}"
        RENAME copyright)
