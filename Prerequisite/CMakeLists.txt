cmake_minimum_required(VERSION 3.10)

project(FreeType-Prerequisite)

# Download FreeType
if(NOT EXISTS "${CMAKE_BINARY_DIR}/Downloads/freetype-$ENV{FREETYPE_VERSION}.zip")
    file(DOWNLOAD "https://gitlab.com/freetype/freetype/-/archive/VER-$ENV{FREETYPE_VERSION}/freetype-VER-$ENV{FREETYPE_VERSION}.zip" "${CMAKE_BINARY_DIR}/Downloads/freetype-$ENV{FREETYPE_VERSION}.zip" SHOW_PROGRESS)
endif()
# Extract FreeType
if(NOT EXISTS "${CMAKE_BINARY_DIR}/Downloads/freetype-$ENV{FREETYPE_VERSION}")
    file(ARCHIVE_EXTRACT INPUT "${CMAKE_BINARY_DIR}/Downloads/freetype-$ENV{FREETYPE_VERSION}.zip" DESTINATION "${CMAKE_BINARY_DIR}/Downloads")
endif()