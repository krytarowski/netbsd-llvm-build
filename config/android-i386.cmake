set(LLVM_TARGET_ARCH X86)
set(LLVM_HOST_TRIPLE_ARCH i386)
set(LLVM_USE_LINKER gold)
set(ANDROID_ABI x86)
set(ANDROID_PLATFORM android-9)

include(${CMAKE_CURRENT_LIST_DIR}/android.cmake)