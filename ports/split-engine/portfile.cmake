vcpkg_from_github(
        OUT_SOURCE_PATH SOURCE_PATH
        REPO xWinuX/SplitEngine
        REF 1a4031afd6c6d287a328b1149adc9d4891be079c
        SHA512 93ca5de5a54ed87831f2e8ca74a9580a033cff293e6444d5b6abee870ea25c6e1d1e5b44f39dab2b6652c199f2124c6f9f2be2b2b406f3dd4e6796e353884619
        HEAD_REF dev
)

vcpkg_configure_cmake(
        SOURCE_PATH ${SOURCE_PATH}
        "-DCMAKE_LIBRARY_OUTPUT_DIRECTORY=${CMAKE_CURRENT_BINARY_DIR}/lib"
)

vcpkg_build_cmake(TARGET SplitEngine)

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

vcpkg_cmake_config_fixup(CONFIG_PATH lib/cmake/box2d)

vcpkg_copy_pdbs()