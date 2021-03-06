################################################################################
# Find available package generators
################################################################################

if(UNIX)
  # DEB
  find_program(DPKG_PROGRAM dpkg)
  if(EXISTS ${DPKG_PROGRAM})
    list(APPEND CPACK_GENERATOR "DEB")
  endif(EXISTS ${DPKG_PROGRAM})
  # TODO: RPM
  #find_program(RPMBUILD_PROGRAM rpmbuild)
  #if(EXISTS ${RPMBUILD_PROGRAM})
  #  list(APPEND CPACK_GENERATOR "RPM")
  #endif(EXISTS ${RPMBUILD_PROGRAM})
endif(UNIX)

if(WIN32)
    # NSLS
    list(APPEND CPACK_GENERATOR "NSIS")    
endif(WIN32)

# TODO: list(APPEND CPACK_SOURCE_GENERATOR "TGZ")
# TODO: list(APPEND CPACK_SOURCE_GENERATOR "ZIP")
list(APPEND CPACK_SOURCE_IGNORE_FILES ";.git;.gitignore;todo.txt;_clang-format;build/")

# set dependencies explicitly
include(InstallRequiredSystemLibraries)
set(DEBIAN_PACKAGE_DEPENDS "libhdf5-7, libfftw3-3, libboost-program-options-dev")
# TODO: set(RPM_PACKAGE_DEPENDS "hdf5-devel")

# where the package metadata are
set(ISMRMRD_CPACK_CFG_FILE "${PROJECT_BINARY_DIR}/cpack_options.cmake")
