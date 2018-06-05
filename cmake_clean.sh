#[clear cmake file shell]

echo "rm cmake cache begin..."
#./
rm ./cmake_install.cmake
rm -r ./CMakeFiles
rm ./Makefile
rm ./CMakeCache.txt
rm -r ./bin

#./src
rm ./src/cmake_install.cmake
rm -r ./src/CMakeFiles
rm ./src/Makefile
rm ./src/CMakeCache.txt
echo "rm cmake cache end..."
