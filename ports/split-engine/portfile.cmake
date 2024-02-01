vcpkg_check_linkage(ONLY_STATIC_LIBRARY)

include(vcpkg_common_functions)
find_program(GIT git)

set(GIT_URL "https://github.com/xWinuX/SplitEngine.git")
set(GIT_REV "ab2a2ed7eb077ab8a7db429e1bc0d974ef038a2f")


if(NOT EXISTS "${SOURCE_PATH}/.git")
    message(STATUS "Cloning and fetching submodules")
    vcpkg_execute_required_process(
            COMMAND ${GIT} clone --recurse-submodules ${GIT_URL} ${SOURCE_PATH}
            WORKING_DIRECTORY ${SOURCE_PATH}
            LOGNAME clone
    )

    message(STATUS "Checkout revision ${GIT_REV}")
    vcpkg_execute_required_process(
            COMMAND ${GIT} checkout ${GIT_REV}
            WORKING_DIRECTORY ${SOURCE_PATH}
            LOGNAME checkout
    )
endif()
message(STATUS "Cloning done")

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