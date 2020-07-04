cmake_minimum_required(VERSION 3.17)

project(hello-qt-qml LANGUAGES CXX)

set(CMAKE_INCLUDE_CURRENT_DIR ON)

set(CMAKE_AUTOUIC ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# QtCreator supports the following variables for Android, which are identical to qmake Android variables.
# Check http://doc.qt.io/qt-5/deployment-android.html for more information.
# They need to be set before the find_package(Qt5 ...) call.

#if(ANDROID)
#    set(ANDROID_PACKAGE_SOURCE_DIR "${CMAKE_CURRENT_SOURCE_DIR}/android")
#    if (ANDROID_ABI STREQUAL "armeabi-v7a")
#        set(ANDROID_EXTRA_LIBS
#            ${CMAKE_CURRENT_SOURCE_DIR}/path/to/libcrypto.so
#            ${CMAKE_CURRENT_SOURCE_DIR}/path/to/libssl.so)
#    endif()
#endif()

find_package(Qt5 COMPONENTS Core Quick LinguistTools REQUIRED)

set(TS_FILES
    ts/hello-qt-qml_en.ts
    ts/hello-qt-qml_es.ts)

qt5_add_translation(QM_FILES ${TS_FILES})
configure_file(ts/translations.qrc ${CMAKE_BINARY_DIR} COPYONLY)

if(ANDROID)
    add_library(${PROJECT_NAME} SHARED
        ${CMAKE_BINARY_DIR}/translations.qrc
        src/counter.hpp
        src/counter.cpp
        src/main.cpp
        qml/qml.qrc
        ${QM_FILES}
        ${TS_FILES})
else()
    add_executable(${PROJECT_NAME}
        ${CMAKE_BINARY_DIR}/translations.qrc
        src/counter.hpp
        src/counter.cpp
        src/main.cpp
        qml/qml.qrc
        ${QM_FILES}
        ${TS_FILES})
endif()

target_include_directories(${PROJECT_NAME}
    PRIVATE src)
target_compile_definitions(${PROJECT_NAME}
    PRIVATE $<$<OR:$<CONFIG:Debug>,$<CONFIG:RelWithDebInfo>>:QT_QML_DEBUG>)
target_link_libraries(${PROJECT_NAME}
    PRIVATE Qt5::Core Qt5::Quick)
