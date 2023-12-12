vcpkg_check_linkage(ONLY_STATIC_LIBRARY)

vcpkg_from_github(
        OUT_SOURCE_PATH SOURCE_PATH
        REPO xWinuX/SplitEngine
        REF 1dbebe5b30c3df82a00e22d5ccb9e24f711e649e
        SHA512 b3098e61108ccf44301c43c2fb1a0513eeb1a6bd0e5396d32372a157a85ea7b0932a55d71a944930f5c0fc9041ecae00e9e0722a31182d475f4e9106cb1e8f6f
        HEAD_REF dev
)

vcpkg_configure_cmake(
        SOURCE_PATH ${SOURCE_PATH}
        PREFER_NINJA
)

vcpkg_cmake_install()

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

vcpkg_cmake_config_fixup(CONFIG_PATH lib/cmake/SplitEngine)

vcpkg_copy_pdbs()

file(
        INSTALL "${SOURCE_PATH}/LICENSE.md"
        DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}"
        RENAME copyright)