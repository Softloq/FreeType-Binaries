@setlocal
@for /F "delims== tokens=1,* eol=#" %%i in ('type .env') do @set %%i=%%~j

cmake -S %~dp0Prerequisite -B %~dp0build/Prerequisite
cmake --build %~dp0build/Prerequisite

cmake -S %~dp0build/Prerequisite/Downloads/freetype-VER-%FREETYPE_VERSION% -B %~dp0build/Compile -G"Visual Studio 17 2022" -DCMAKE_INSTALL_PREFIX="%~dp0build/Package/freetype-%FREETYPE_VERSION%/freetype" -DCMAKE_BUILD_TYPE=Release -DCMAKE_CXX_STANDARD=23 -DCMAKE_CXX_STANDARD_REQUIRED=TRUE -DCMAKE_CXX_EXTENSIONS=OFF -DCMAKE_CXX_FLAGS_RELEASE="/MD" -DBUILD_SHARED_LIBS=ON
cmake --build %~dp0build/Compile --config Release --target install -j%NUMBER_OF_PROCESSORS%

cmake -S %~dp0Package -B %~dp0build/Package
cmake --build %~dp0build/Package
@endlocal