mkdir build
cd build

cmake ^
    -G "Ninja" ^
    -DCMAKE_C_COMPILER=clang-cl ^
    -DCMAKE_CXX_COMPILER=clang-cl ^
    -DBoost_NO_BOOST_CMAKE=ON ^
    -DCMAKE_BUILD_TYPE=Release ^
    -DCMAKE_PREFIX_PATH=%LIBRARY_PREFIX% ^
    -DCMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% ^
    -DAUDI_BUILD_AUDI=yes ^
    -DAUDI_BUILD_MAIN=no ^
    -DAUDI_BUILD_TESTS=yes ^
    -DAUDI_BUILD_PYAUDI=no ^
    ..

cmake --build . -- -v

ctest --output-on-failure -j${CPU_COUNT}

cmake --build . --target install
