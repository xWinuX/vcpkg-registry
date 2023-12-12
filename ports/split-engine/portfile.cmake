vcpkg_from_github(
        OUT_SOURCE_PATH SOURCE_PATH
        REPO xWinuX/SplitEngine
        REF ae64f465ee7eab523b0960cc57494081ac2ff83b
        SHA512 50b48ed65d5b284a0a26b2214ff6b0634997ba080ebbae44d7f5b1626b4df26b057fdb8b7e29cb609a7e788956b97ccb4940f607aee0f73fc6cc772f3ef6343a
        HEAD_REF dev
)

vcpkg_configure_cmake(
        SOURCE_PATH ${SOURCE_PATH}
        "-DCMAKE_LIBRARY_OUTPUT_DIRECTORY=${CMAKE_CURRENT_BINARY_DIR}/lib"
)

vcpkg_cmake_install()

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

vcpkg_cmake_config_fixup(CONFIG_PATH lib/cmake/SplitEngine)

vcpkg_copy_pdbs()

file(
        INSTALL "${SOURCE_PATH}/LICENSE.md"
        DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}"
        RENAME copyright)