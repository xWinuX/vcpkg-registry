vcpkg_check_linkage(ONLY_STATIC_LIBRARY)

vcpkg_from_github(
        OUT_SOURCE_PATH SOURCE_PATH
        REPO xWinuX/SplitEngine
        REF ab2a2ed7eb077ab8a7db429e1bc0d974ef038a2f
        SHA512 9d1e60efd7abaf40f22e993e0039205f0c7e0e38a6e21b0f8cb92b6f79e97cb274a44501ee23b61602fa25a7b3d442465fc6873a43a292ba3474cf1dcd443300
        HEAD_REF main
)

vcpkg_cmake_configure(
        SOURCE_PATH ${SOURCE_PATH}
)

vcpkg_cmake_install()

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

vcpkg_cmake_config_fixup(
        CONFIG_PATH lib/cmake/SplitEngine
        PACKAGE_NAME SplitEngine
)

vcpkg_copy_pdbs()

file(
        INSTALL "${SOURCE_PATH}/LICENSE.md"
        DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}"
        RENAME copyright)