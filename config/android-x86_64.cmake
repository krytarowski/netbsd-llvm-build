set(LLVM_TARGET_ARCH X86)
set(LLVM_HOST_TRIPLE_ARCH x86_64)
set(LLVM_USE_LINKER gold)
set(ANDROID_ABI x86_64)

include(${CMAKE_CURRENT_LIST_DIR}/android.cmake)
