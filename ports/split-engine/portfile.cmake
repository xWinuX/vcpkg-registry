vcpkg_from_github(
        OUT_SOURCE_PATH SOURCE_PATH
        REPO xWinuX/SplitEngine
        REF 3b3d70137d36fcd6268dbfd8d398417ac74eacaf
        SHA512 785fe8220d7c6593b688c8d7bdc4fa8b74427e63122db32494e2fc9e06db20bf13cf19c092fb861d0e1784f2fed010335f2fb32dda4e511a50f4264c3507575e
        HEAD_REF dev
)

vcpkg_check_features(
        OUT_FEATURE_OPTIONS FEATURE_OPTIONS
        FEATURES
        headless HEADLESS
)

vcpkg_configure_cmake(
        SOURCE_PATH ${SOURCE_PATH}
        PREFER_NINJA
        OPTIONS ${FEATURE_OPTIONS}
        "-DCMAKE_LIBRARY_OUTPUT_DIRECTORY=${CMAKE_CURRENT_BINARY_DIR}/lib"
)

vcpkg_install_cmake()
vcpkg_fixup_cmake_targets()

file(REMOVE_RECURSE
        ${CURRENT_PACKAGES_DIR}/debug/include
        ${CURRENT_PACKAGES_DIR}/debug/share
)

file(INSTALL ${SOURCE_PATH}/include DESTINATION ${CURRENT_PACKAGES_DIR}/include
        FILES_MATCHING
        PATTERN "*.h"
        PATTERN "*.hpp"
)

file(
        INSTALL "${SOURCE_PATH}/LICENSE"
        DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}"
        RENAME copyright)

file(INSTALL ${SOURCE_PATH}/res DESTINATION ${CURRENT_PACKAGES_DIR}/share/${PORT})