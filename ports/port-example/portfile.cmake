vcpkg_check_linkage(ONLY_STATIC_LIBRARY)

vcpkg_from_git(
        OUT_SOURCE_PATH SOURCE_PATH
        URL https://github.com/sunzhenkai/vcpkg-port-example.git
        REF "0e81be583e6c9e9a46bd04b05610ae4645fbb450"
        HEAD_REF main
)

vcpkg_cmake_configure(
        SOURCE_PATH "${SOURCE_PATH}"
)

vcpkg_cmake_install()
vcpkg_cmake_config_fixup(PACKAGE_NAME "port-example")

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

file(INSTALL "${SOURCE_PATH}/LICENSE" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" RENAME copyright)
configure_file("${CMAKE_CURRENT_LIST_DIR}/usage" "${CURRENT_PACKAGES_DIR}/share/${PORT}/usage" COPYONLY)