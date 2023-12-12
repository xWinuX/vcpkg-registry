vcpkg_from_git(
        OUT_SOURCE_PATH SOURCE_PATH
        URL git@github.com:xWinuX/SplitEngine.git
        REF edba43d5e1848f7fbe78eeef57acc747e5c2605f
)

vcpkg_configure_cmake(
        SOURCE_PATH ${SOURCE_PATH}
)

vcpkg_install_cmake()

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

file(
        INSTALL "${SOURCE_PATH}/LICENSE.md"
        DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}"
        RENAME copyright)