include("${CMAKE_CURRENT_LIST_DIR}/lib/cmake/freetype/freetype-config.cmake")

if(CMAKE_CXX_COMPILER_ID STREQUAL "MSVC")
    add_custom_target(
        FreeType-DLL-Copy
        DEPENDS "${CMAKE_CURRENT_LIST_DIR}/__run_always"
        COMMENT "FreeType DLL Copy"
        COMMAND ${CMAKE_COMMAND} -E copy_if_different "${CMAKE_CURRENT_LIST_DIR}/bin/freetype.dll" "${CMAKE_BINARY_DIR}/$<CONFIG>/bin/freetype.dll"
    )
    add_dependencies(freetype FreeType-DLL-Copy)
endif()
 