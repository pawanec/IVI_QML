QT += quick

CONFIG += c++11

# You can make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += \
        main.cpp

RESOURCES += qml.qrc

TRANSLATIONS +=

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

DISTFILES += \
    Cell.qml \
    CentreScreen.qml \
    LeftBar.qml \
    RightBar.qml \
    images/Home.png \
    images/apps/Bluetooth (2).png \
    images/apps/Bluetooth (2).png \
    images/apps/Music.png \
    images/apps/Radio.png \
    images/apps/Setting.png \
    images/apps/Video.png \
    images/apps/audio_.jpg \
    images/apps/folder.png \
    images/apps/video_.jpg \
    images/base.png \
    images/mute.png \
    main.qml
