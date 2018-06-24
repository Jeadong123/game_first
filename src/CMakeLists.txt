set(myexe_EXEC_SRCS
    main.cpp
    ${PROJECT_SOURCE_DIR}/src/Demo/Common/SimpleEvent.cpp
    ${PROJECT_SOURCE_DIR}/src/Demo/TapQuoteAPI/Quote.cpp
    )

include_directories(
    ${PROJECT_SOURCE_DIR}/include/
    #${PROJECT_BINARY_DIR}/libs/
    #${PROJECT_SOURCE_DIR}/src/markup
    #${PROJECT_SOURCE_DIR}/src/modules/
    #/opt/Ice/include
    /usr/include/
)

link_directories(
    /usr/lib64/
    ${PROJECT_SOURCE_DIR}/lib
    #$ENV{ORACLE_HOME}/lib
)


#link_libraries(myexe markup)
#link_libraries(main hellolib)

add_executable(main ${myexe_EXEC_SRCS})

target_link_libraries(main libconfig++.so libTapQuoteAPI.so)

set(EXECUTABLE_OUTPUT_PATH ${PROJECT_SOURCE_DIR}/bin/)

#install(TARGETS main RUNTIME DESTINATION bin)

