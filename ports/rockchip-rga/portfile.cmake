vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO nyanmisaka/rk-mirrors
    REF 1d330cc28551943bed3380261a5a9c6fbd58ff53 # normal: fix inverted RGB/BGR order in FBCE of RGA3 (Oct 19, 2025)
    SHA512 731c50e7fa1f95d4fb45be8db2d2e184da088b32d6ffde2a9f02f2c721d77fd2dd2d1063d6fbd41c929bb654f0c585c78935e173e1f8f1733e71268ba36bd3d0
    HEAD_REF jellyfin-rga
)

set(LIBRARY_TYPE ${VCPKG_LIBRARY_LINKAGE})
if (LIBRARY_TYPE STREQUAL "dynamic")
    set(LIBRARY_TYPE "shared")
endif(LIBRARY_TYPE STREQUAL "dynamic")

vcpkg_configure_meson(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS
        --default-library=${LIBRARY_TYPE}
        -Dlibdrm=false
        -Dlibrga_demo=false
)

vcpkg_install_meson()
vcpkg_copy_pdbs()
vcpkg_fixup_pkgconfig()

file(INSTALL "${CMAKE_CURRENT_LIST_DIR}/usage" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}")
vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/COPYING")
