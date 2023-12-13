vcpkg_check_linkage(ONLY_STATIC_LIBRARY)

vcpkg_from_github(
        OUT_SOURCE_PATH SOURCE_PATH
        REPO xWinuX/SplitEngine
        REF 9a685b587082043e41a1ba91c2332c6cf73580b6
        SHA512 c71b4c20fbca4115fdc355c7aa39f9b38eeb7bd89f55599386a923fd68cbd464e26472f0e442eaf1394087b123becc70938c90a58cd6a418004ebe678f93cb2f
        HEAD_REF dev
)

vcpkg_configure_cmake(
        SOURCE_PATH ${SOURCE_PATH}
        PREFER_NINJA
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