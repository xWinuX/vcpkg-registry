vcpkg_from_github(
        OUT_SOURCE_PATH SOURCE_PATH
        REPO xWinuX/SplitEngine
        REF 0d18ee68268be2314c386e9a953ac1707174e60c
        SHA512 b77904a5ef763062f42edaa124a821de684b575ead224795cc3827b56632b92d585d21bdf802b47371547654e2616565d8e10aca7d6747a494ede4b897f6d6a2
        HEAD_REF dev
)

vcpkg_configure_cmake(
        SOURCE_PATH ${SOURCE_PATH}
)

vcpkg_build_cmake(TARGET SplitEngine)

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

install(
        TARGETS SplitEngine
        LIBRARY DESTINATION lib
        INCLUDES DESTINATION include
        PUBLIC_HEADER DESTINATION include
)

file(
        INSTALL "${SOURCE_PATH}/LICENSE.md"
        DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}"
        RENAME copyright)