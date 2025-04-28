include("${CMAKE_CURRENT_LIST_DIR}/lib/cmake/freetype/freetype-config.cmake")

if(CMAKE_CXX_COMPILER_ID STREQUAL "MSVC")
    add_custom_target(
        Copy-FreeType-DLL
        COMMENT "Copy FreeType DLL"
        COMMAND ${CMAKE_COMMAND} -E copy_if_different "${CMAKE_CURRENT_LIST_DIR}/bin/freetype.dll" "${CMAKE_BINARY_DIR}/$<CONFIG>/bin/freetype.dll"
    )
    add_dependencies(freetype Copy-FreeType-DLL)
endif()
 