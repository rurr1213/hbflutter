# Android Studio

If using Android Studio 2.2 or greater, the blackfire CMake project structure can be directly referenced from your Android project.

## Sample App

The Android Studio sample app is located in src/samples/android/studio.  This project can simply be opened in Android Studio and built without any additional configuration.  Unlike the legacy toolchain, no separate NDK build is necessary; all Blackfire libraries are built automatically by Studio.  Also, the libav libraries are bundled with this toolchain and automatically extracted as needed.

## Linking Gradle to Firecast

This describes how to link new Android Studio projects to the Firecast build process.

1. Link the core/blackfire project CMakeLists.txt to Gradle as described here: https://developer.android.com/studio/projects/add-native-code.html#link-gradle
2. Add the following to your module build.gradle:

```
android {
	...
    defaultConfig {
		...
        externalNativeBuild {
            cmake {
                arguments "-DANDROID_TOOLCHAIN=gcc"
            }
        }
	}
}
```

This is required because Android clang is incompatible.

# Eclipse

The Toolchain.cmake file can be used to create the prebuilt libraries expected by the Eclipse project.
