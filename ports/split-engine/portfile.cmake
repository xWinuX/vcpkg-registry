vcpkg_from_github(
        OUT_SOURCE_PATH SOURCE_PATH
        REPO xWinuX/SplitEngine
        REF d30788cd1063301798537a7b293983daa15f55f5
        SHA512 93ca5de5a54ed87831f2e8ca74a9580a033cff293e6444d5b6abee870ea25c6e1d1e5b44f39dab2b6652c199f2124c6f9f2be2b2b406f3dd4e6796e353884619
        HEAD_REF dev
)

vcpkg_configure_cmake(
        SOURCE_PATH ${SOURCE_PATH}
        "-DCMAKE_LIBRARY_OUTPUT_DIRECTORY=${CMAKE_CURRENT_BINARY_DIR}/lib"
)

vcpkg_build_cmake(TARGET SplitEngine)

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

file(
        INSTALL "${SOURCE_PATH}/include/SplitEngine"
        DESTINATION "${CURRENT_PACKAGES_DIR}/include")

file(
        INSTALL "${SOURCE_PATH}/${TARGET_TRIPLET}/${CMAKE_BUILD_TYPE}/SplitEngine.lib"
        DESTINATION "${CURRENT_PACKAGES_DIR}/lib")

file(
        INSTALL "${SOURCE_PATH}/LICENSE.md"
        DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}"
        RENAME copyright)