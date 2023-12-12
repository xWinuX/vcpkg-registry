vcpkg_from_github(
        OUT_SOURCE_PATH SOURCE_PATH
        REPO xWinuX/SplitEngine
        REF 6e957d5e71b88920972cf3b4b76bf6d75f327163
        SHA512 38c14d01b2e766c1b83c30ad43f9575e306185a959f2df3274453b291c356d1dfacb782ff5c0538366b3664fb8c92a4906b6e965843a9de0a3c07bbd4fb7d78f
        HEAD_REF dev
)

vcpkg_configure_cmake(
        SOURCE_PATH ${SOURCE_PATH}
        "-DCMAKE_LIBRARY_OUTPUT_DIRECTORY=${CMAKE_CURRENT_BINARY_DIR}/lib"
)

vcpkg_install_cmake()

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

vcpkg_copy_pdbs()

file(
        INSTALL "${SOURCE_PATH}/LICENSE.md"
        DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}"
        RENAME copyright)