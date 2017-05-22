cmake_minimum_required(VERSION 3.2.2)
include(build/Build.cmake)

# IMPORTED libav
set(LIBAV_LIB_DIR ${CMAKE_CURRENT_LIST_DIR}/sdk/libav/lib)
set(LIBAV_INCLUDE_DIR ${CMAKE_CURRENT_LIST_DIR}/sdk/libav/include)
add_library(avcodec SHARED IMPORTED)
set_target_properties(avcodec PROPERTIES
	IMPORTED_LOCATION ${LIBAV_LIB_DIR}/libavcodec.so
)
add_library(avdevice SHARED IMPORTED)
set_target_properties(avdevice PROPERTIES
	IMPORTED_LOCATION ${LIBAV_LIB_DIR}/libavdevice.so
)
add_library(avfilter SHARED IMPORTED)
set_target_properties(avfilter PROPERTIES
	IMPORTED_LOCATION ${LIBAV_LIB_DIR}/libavfilter.so
)
add_library(avformat SHARED IMPORTED)
set_target_properties(avformat PROPERTIES
	IMPORTED_LOCATION ${LIBAV_LIB_DIR}/libavformat.so
)
add_library(avutil SHARED IMPORTED)
set_target_properties(avutil PROPERTIES
	IMPORTED_LOCATION ${LIBAV_LIB_DIR}/libavutil.so
)
add_library(swscale SHARED IMPORTED)
set_target_properties(swscale PROPERTIES
	IMPORTED_LOCATION ${LIBAV_LIB_DIR}/libswscale.so
)
set_target_properties(avcodec avdevice avfilter avformat avutil swscale PROPERTIES
	INTERFACE_INCLUDE_DIRECTORIES ${LIBAV_INCLUDE_DIR}
)
install(
	FILES
		${LIBAV_LIB_DIR}/libavcodec.so
		${LIBAV_LIB_DIR}/libavdevice.so
		${LIBAV_LIB_DIR}/libavfilter.so
		${LIBAV_LIB_DIR}/libavformat.so
		${LIBAV_LIB_DIR}/libavutil.so
		${LIBAV_LIB_DIR}/libswscale.so
	DESTINATION sdk/lib
)
install(
	DIRECTORY
		${LIBAV_INCLUDE_DIR}/libavcodec
		${LIBAV_INCLUDE_DIR}/libavdevice
		${LIBAV_INCLUDE_DIR}/libavfilter
		${LIBAV_INCLUDE_DIR}/libavformat
		${LIBAV_INCLUDE_DIR}/libavutil
	DESTINATION sdk/include
)

# IMPORTED libspotify
set(SPOTIFY_LIB_DIR ${CMAKE_CURRENT_LIST_DIR}/sdk/libspotify-12.1.51/lib)
set(SPOTIFY_INCLUDE_DIR ${CMAKE_CURRENT_LIST_DIR}/sdk/libspotify-12.1.51/include)
add_library(spotify SHARED IMPORTED)
set_target_properties(spotify PROPERTIES
	IMPORTED_LOCATION ${SPOTIFY_LIB_DIR}/libspotify.so
)
set_target_properties(spotify PROPERTIES
	INTERFACE_INCLUDE_DIRECTORIES ${LIBAV_INCLUDE_DIR}
)
install(
	FILES
		${SPOTIFY_LIB_DIR}/libspotify.so
	DESTINATION sdk/lib
)
install(
	DIRECTORY
		${SPOTIFY_INCLUDE_DIR}/libspotify
	DESTINATION sdk/include
)

# Sample deployment
install(
	DIRECTORY
		src/sample/gen
		src/sample/jni
		src/sample/res
		src/sample/src
	DESTINATION src/sample
	PATTERN "obj" EXCLUDE
	PATTERN ".svn" EXCLUDE
)
install(
	FILES
		src/sample/AndroidManifest.xml
		src/sample/build.gradle
		src/sample/lint.xml
		src/sample/project.properties
	DESTINATION src/sample
)

# Firecast build
set(PLATFORM_COMPONENTS
	common/media/libFCMediaSrcDrv
	common/media/libFCMediaSource
	common/helper
	common/java
)
if(FC_PLATFORM STREQUAL "Studio")
	set(PLATFORM_COMPONENTS ${PLATFORM_COMPONENTS}
		sample/jni
	)
else()
	set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wno-psabi")
	set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fno-rtti")
endif()

build_platform(
	ARCH arm
	TOOLCHAIN gcc
	OS android
	BOARD generic
	DEFAULTS
		GCC
	    Core
		Opus
		Trace
		PID
		Update
	OPTIONS
		THREAD_MONITOR
	COMPONENTS
		${PLATFORM_COMPONENTS}
)

get_property(FC_GLOBAL_CFLAGS GLOBAL PROPERTY FC_GLOBAL_DEFINITIONS)
configure_file(${CMAKE_CURRENT_LIST_DIR}/CMakeLists.install ${CMAKE_BINARY_DIR}/CMakeLists.txt @ONLY)
install(FILES ${CMAKE_BINARY_DIR}/CMakeLists.txt DESTINATION ./)

if(0)
#if(NOT FC_PLATFORM STREQUAL "Studio")
	file(RELATIVE_PATH PROJECT_ROOT ${CMAKE_CURRENT_LIST_DIR}/src/sample ${CMAKE_CURRENT_LIST_DIR})
	file(RELATIVE_PATH PROJECT_PREFIX ${CMAKE_CURRENT_LIST_DIR} ${CMAKE_INSTALL_PREFIX})
	set(PROJECT_COMMON_DIR src/common/helper)
	set(PROJECT_MEDIASOURCE_DIR src/common/media/libFCMediaSource)
	configure_file(${CMAKE_CURRENT_LIST_DIR}/Application.mk.in ${CMAKE_CURRENT_LIST_DIR}/src/sample/jni/Application.mk)
	configure_file(${CMAKE_CURRENT_LIST_DIR}/Android.mk.in ${CMAKE_CURRENT_LIST_DIR}/src/sample/jni/Android.mk)
endif()
