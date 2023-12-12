vcpkg_from_github(
        OUT_SOURCE_PATH SOURCE_PATH
        REPO xWinuX/SplitEngine
        REF ae64f465ee7eab523b0960cc57494081ac2ff83b
        SHA512 63f45af53a12e2bedf42a88f178283860868a0b1b6d670cf99ffccba25aa3a1288af250f4dd53cd823625761b3054055630b2872d2079dc1fb7ee065329bfaa7
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