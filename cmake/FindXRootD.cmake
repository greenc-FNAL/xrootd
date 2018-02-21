# Try to find XRootD
# Once done, this will define
#
# XROOTD_FOUND - system has xrootd
# XROOTD_INCLUDE_DIRS - the xrootd include directories
# XROOTD_LIBRARIES - xrootd libraries directories

find_path( XROOTD_INCLUDE_DIRS XrdSfs/XrdSfsAio.hh
  HINTS
  ${XROOTD_DIR}
  $ENV{XROOTD_DIR}
  /usr
  /opt
  PATH_SUFFIXES include/xrootd
)

find_library( XROOTD_LIBRARIES XrdUtils
  HINTS
  ${XROOTD_DIR}
  $ENV{XROOTD_DIR}
  /usr
  /opt
  PATH_SUFFIXES lib
)

set(XROOTD_INCLUDE_DIR ${XROOTD_INCLUDE_DIRS})
set(XROOTD_LIBRARY     ${XROOTD_LIBRARIES})

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(xrootd DEFAULT_MSG XROOTD_INCLUDE_DIRS XROOTD_LIBRARIES)

