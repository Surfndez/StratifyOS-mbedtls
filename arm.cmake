
include(${CMAKE_SOURCE_DIR}/sources.cmake)

set(SOS_SOURCELIST
	${TLS_SOURCES}
	${X509_SOURCES}
	${SOURCES}
	${HEADERS}
	config/mbedtls/config.h
	mbedtls_sos_config.h
	sos_config.c
	net_sockets.c
	timing_alt.h
	mbedtls_api.h
	mbedtls_api.c
	mbedtls_crypt_api.c
	threading.c)

set(SOS_OPTION kernel)
set(SOS_DEFINITIONS ${SOS_DEFINITIONS} -DHAVE_LWIP_SOCKETS_H)

# kernel release and debug configurations
option(BUILD_RELEASE "Build release version of library" OFF)
if(BUILD_RELEASE)
set(SOS_CONFIG release)
include(${SOS_TOOLCHAIN_CMAKE_PATH}/sos-lib-std.cmake)
endif()

option(BUILD_DEBUG "Build debug version of library" ON)
if(BUILD_DEBUG)
set(SOS_CONFIG debug)
include(${SOS_TOOLCHAIN_CMAKE_PATH}/sos-lib-std.cmake)
endif()

