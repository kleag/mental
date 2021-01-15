cmake_minimum_required(VERSION 3.0)

project(Mental)

find_package(Qt5 REQUIRED COMPONENTS Gui Qml)

set(CMAKE_AUTOMOC ON)

add_subdirectory(src)
