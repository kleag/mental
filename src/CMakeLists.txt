qt5_add_resources(mental_SRCS resources.qrc)
add_executable(mental main.cpp ${mental_SRCS})
target_link_libraries(mental Qt5::Qml Qt5::Gui)

