set(ANDROID_API_LEVEL 8)
set(ANDROID_ARCH arm)
set(ANDROID_NDK /opt/android/ndk)
set(ANDROID_TOOLCHAIN /opt/android/toolchain)
set(SYSTEM_SYSROOT ${ANDROID_TOOLCHAIN}/sysroot)
set(SYSTEM_CC ${ANDROID_TOOLCHAIN}/bin/arm-linux-androideabi-gcc)
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

add_definitions(-DANDROID)
