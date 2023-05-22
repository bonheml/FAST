# Download clarius cast API
include(cmake/Externals.cmake)

ExternalProject_Add(clarius_headers
    PREFIX ${FAST_EXTERNAL_BUILD_DIR}/clarius
    URL https://github.com/clariusdev/cast/archive/7a03fc63b523ec3921b7189e41adcb4546e8e1fd.zip
    UPDATE_COMMAND ""
    CONFIGURE_COMMAND ""
    BUILD_COMMAND ""
    INSTALL_COMMAND ${CMAKE_COMMAND} -E copy_directory ${FAST_EXTERNAL_BUILD_DIR}/clarius/src/clarius_headers/desktop/src/include ${FAST_EXTERNAL_INSTALL_DIR}/include/
)

if(WIN32)
    set(URL "https://github.com/clariusdev/cast/releases/download/v10.2.3/cast-10.2.3-windows.zip")
elseif(APPLE)
    set(URL "https://github.com/clariusdev/cast/releases/download/v10.2.3/cast-10.2.3-macos.zip")
else()
    set(URL "https://github.com/clariusdev/cast/releases/download/v10.2.3/cast-10.2.3-linux.zip")
endif()

if(WIN32)
ExternalProject_Add(clarius
        PREFIX ${FAST_EXTERNAL_BUILD_DIR}/clarius # The folder in which the package will downloaded to
        URL ${URL}
        UPDATE_COMMAND ""
        CONFIGURE_COMMAND ""
        BUILD_COMMAND ""
        INSTALL_COMMAND ${CMAKE_COMMAND} -E copy ${FAST_EXTERNAL_BUILD_DIR}/clarius/src/clarius/cast.lib ${FAST_EXTERNAL_INSTALL_DIR}/lib/ COMMAND
          ${CMAKE_COMMAND} -E copy ${FAST_EXTERNAL_BUILD_DIR}/clarius/src/clarius/cast.dll ${FAST_EXTERNAL_INSTALL_DIR}/bin/
        DEPENDS clarius_headers

)
elseif(APPLE)
ExternalProject_Add(clarius
        PREFIX ${FAST_EXTERNAL_BUILD_DIR}/clarius # The folder in which the package will downloaded to
        URL ${URL}
        UPDATE_COMMAND ""
        CONFIGURE_COMMAND ""
        BUILD_COMMAND ""
        INSTALL_COMMAND ${CMAKE_COMMAND} -E copy ${FAST_EXTERNAL_BUILD_DIR}/clarius/src/clarius/libcast${CMAKE_SHARED_LIBRARY_SUFFIX} ${FAST_EXTERNAL_INSTALL_DIR}/lib/
        DEPENDS clarius_headers
)
else()
ExternalProject_Add(clarius
        PREFIX ${FAST_EXTERNAL_BUILD_DIR}/clarius # The folder in which the package will downloaded to
        URL ${URL}
        UPDATE_COMMAND ""
        CONFIGURE_COMMAND ""
        BUILD_COMMAND ""
        INSTALL_COMMAND ${CMAKE_COMMAND} -E copy ${FAST_EXTERNAL_BUILD_DIR}/clarius/src/clarius/20.04/libcast${CMAKE_SHARED_LIBRARY_SUFFIX} ${FAST_EXTERNAL_INSTALL_DIR}/lib/
        DEPENDS clarius_headers
)
endif()
list(APPEND FAST_EXTERNAL_DEPENDENCIES clarius)
