
include(${CMAKE_SOURCE_DIR}/sources.cmake)

set(SOS_LIB_SOURCELIST
	${TLS_SOURCES}
	${X509_SOURCES}
	${SOURCES}
	${HEADERS}
	sos_config.h
	sos_config.c
	net_sockets.c
	timing_alt.h
	mbedtls_api.h
	mbedtls_api.c
	threading.c)


# kernel release and debug configurations
set(SOS_LIB_TYPE release)
set(SOS_LIB_OPTION kernel)
set(SOS_LIB_INCLUDE_DIRECTORIES mbedtls/include ${CMAKE_SOURCE_DIR})
set(SOS_LIB_DEFINITIONS -DMBEDTLS_CONFIG_FILE="sos_config.h" -DHAVE_LWIP_SOCKETS_H)
include(${SOS_TOOLCHAIN_CMAKE_PATH}/sos-lib-std.cmake)

set(SOS_LIB_TYPE debug)
include(${SOS_TOOLCHAIN_CMAKE_PATH}/sos-lib-std.cmake)

