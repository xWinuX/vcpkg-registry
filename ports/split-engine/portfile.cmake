vcpkg_check_linkage(ONLY_STATIC_LIBRARY)

vcpkg_from_github(
        OUT_SOURCE_PATH SOURCE_PATH
        REPO xWinuX/SplitEngine
        REF 642e99adb60d9cb3a8ca2e8c78ea39811841acae
        SHA512 38f82ebf441954839d411c3f3657a1a281e236f8150beea2a41557c22357be66adde3174009f7a80cc820a478ed0d7f978db9d22d96100120026360f89bfbf04
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