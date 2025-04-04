cmake_minimum_required(VERSION 3.10)

project(FreeType-Package)

# Package freetype.zip
configure_file("${CMAKE_CURRENT_LIST_DIR}/config.cmake" "${CMAKE_BINARY_DIR}/freetype-$ENV{FREETYPE_VERSION}/freetype/config.cmake" COPYONLY)
add_custom_target(FreeType-Zip ALL
    COMMAND ${CMAKE_COMMAND} -E tar cfv "${CMAKE_BINARY_DIR}/freetype.zip" --format=zip .
    WORKING_DIRECTORY "${CMAKE_BINARY_DIR}/freetype-$ENV{FREETYPE_VERSION}")
