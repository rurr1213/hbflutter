if(NDK_DIR$ENV{NDK_DIR})
	message(FATAL_ERROR "Set NDK_DIR environment variable to NDK root directory.")
endif()

set(SYSTEM_SYSROOT "$ENV{NDK_DIR}/platforms/android-15/arch-arm")
set(SYSTEM_CC "$ENV{NDK_DIR}/toolchains/arm-linux-androideabi-4.9/prebuilt/windows-x86_64/bin/arm-linux-androideabi-gcc.exe")
set(SYSTEM_ARCH "arm")

set(CMAKE_SYSTEM_NAME Android)
set(CMAKE_SYSTEM_VERSION 1)
set(CMAKE_SYSROOT ${SYSTEM_SYSROOT})
set(CMAKE_FIND_ROOT_PATH ${SYSTEM_SYSROOT})
set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
set(CMAKE_C_COMPILER ${SYSTEM_CC})
set(CMAKE_CXX_COMPILER ${SYSTEM_CC})

include_directories(
	$ENV{NDK_DIR}/sources/cxx-stl/gnu-libstdc++/4.9/libs/armeabi/include
	$ENV{NDK_DIR}/sources/cxx-stl/gnu-libstdc++/4.9/include
)
