#-------------------------------------------------------------------------------
# Define the default build parameters
#-------------------------------------------------------------------------------
if( "${CMAKE_BUILD_TYPE}" STREQUAL "" )
  if( Solaris AND NOT SUNCC_CAN_DO_OPTS )
    set( CMAKE_BUILD_TYPE Debug )
  else()
    set( CMAKE_BUILD_TYPE RelWithDebInfo )
  endif()
endif()

include( CMakeDependentOption )

define_default( PLUGIN_VERSION    5 )
option( ENABLE_FUSE      "Enable the fuse filesystem driver if possible."                 TRUE )
option( ENABLE_CRYPTO    "Enable the OpenSSL cryprography support."                       TRUE )
option( ENABLE_KRB5      "Enable the Kerberos 5 authentication if possible."              TRUE )
option( ENABLE_READLINE  "Enable the lib readline support in the commandline utilities."  TRUE )
option( ENABLE_XRDCL     "Enable XRootD client."                                          TRUE )
option( ENABLE_TESTS     "Enable unit tests."                                             FALSE )
option( ENABLE_HTTP      "Enable HTTP component."                                         TRUE )
option( ENABLE_PYTHON    "Enable python bindings."                                        TRUE )
# As PIP_OPTIONS uses the cache, make sure to clean cache if rebuilding (e.g. cmake --build <build dir> --clean-first)
SET(PIP_OPTIONS "" CACHE STRING "pip options used during the Python bindings install.")
option( XRDCL_ONLY       "Build only the client and necessary dependencies"               FALSE )
option( XRDCL_LIB_ONLY   "Build only the client libraries and necessary dependencies"     FALSE )
option( PYPI_BUILD       "The project is being built for PyPI release"                    FALSE )
option( ENABLE_VOMS      "Enable VOMS plug-in if possible."                               TRUE )
option( ENABLE_XRDEC     "Enable erasure coding component."                               FALSE )
option( ENABLE_ASAN      "Enable adress sanitizer."                                       FALSE )
option( ENABLE_TSAN      "Enable thread sanitizer."                                       FALSE )
option( ENABLE_XRDCLHTTP "Enable xrdcl-http plugin."                                      TRUE )
option( ENABLE_SCITOKENS "Enable SciTokens plugin."                                       TRUE )
cmake_dependent_option( ENABLE_MACAROONS "Enable Macaroons plugin." TRUE "NOT XRDCL_ONLY" FALSE )
option( FORCE_ENABLED    "Fail build if enabled components cannot be built."              FALSE )
cmake_dependent_option( USE_SYSTEM_ISAL  "Use isa-l installed in the system" FALSE "ENABLE_XRDEC" FALSE )
define_default( XRD_PYTHON_REQ_VERSION 3 )
