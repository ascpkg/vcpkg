vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO nyanmisaka/mpp
    REF 4e5b4cfe7fa30394c5d5c37b67229f148865ccbd # fix[sys_cfg]: Do not align FBC hor_stride (Commits on Nov 28, 2025)
    SHA512 f7142a7862db157b05fe8e2400ce515fd28e0c484b8f0511fb3a4e725ba17b1cc211f11a73a4ffe396f3f2075c5997668de2f9a5e2c090e208fa291be370d310
    HEAD_REF jellyfin-mpp
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS
        -DBUILD_TEST=OFF
)

vcpkg_cmake_install()
vcpkg_fixup_pkgconfig()
vcpkg_copy_pdbs()


file(INSTALL "${CMAKE_CURRENT_LIST_DIR}/usage" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}")

