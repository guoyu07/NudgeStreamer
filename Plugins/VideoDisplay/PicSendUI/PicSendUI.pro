#-------------------------------------------------
#
# Project created by QtCreator 2017-05-26T10:45:15
#
#-------------------------------------------------

QT       += core gui

TARGET = PicSendUI
TEMPLATE = lib
CONFIG += staticlib
DEFINES += PICSENDUI_LIBRARY

# The following define makes your compiler emit warnings if you use
# any feature of Qt which as been marked as deprecated (the exact warnings
# depend on your compiler). Please consult the documentation of the
# deprecated API in order to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

# You can also make your code fail to compile if you use deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

CONFIG  +=  c++11

unix{
DESTDIR +=  $$PWD/../../bin/
}

win32{
CONFIG(debug, debug | release):{
DESTDIR +=  $$PWD/../../../bin/Debug/Plugins/VideoDisplay/PicSendUI/
}else{
DESTDIR +=  $$PWD/../../../bin/Release/Plugins/VideoDisplay/PicSendUI/
}
}

INCLUDEPATH +=  . \
                ./../../ \
                ./../../../Streamer

SOURCES +=  PicSendUI.cpp

HEADERS +=  PicSendUI.h

#引入ffmpeg库
INCLUDEPATH +=  $$PWD/../../../lib/ffmpeg/include
LIBS    +=  -L$$PWD/../../../lib/ffmpeg/lib/    -lavcodec \
                                                -lavdevice \
                                                -lavfilter \
                                                -lavformat \
                                                -lavutil \
                                                -lpostproc \
                                                -lswscale

unix {
    target.path = /usr/lib
    INSTALLS += target
}

# Log
win32:CONFIG(release, debug|release): LIBS += -L$$PWD/../../../bin/Release/ -lLog
else:win32:CONFIG(debug, debug|release): LIBS += -L$$PWD/../../../bin/Debug/ -lLog
else:unix: LIBS += -L$$PWD/../../../bin/ -lLog

INCLUDEPATH += $$PWD/../../../Log
DEPENDPATH += $$PWD/../../../Log

win32-g++:CONFIG(release, debug|release): PRE_TARGETDEPS += $$PWD/../../../bin/Release/libLog.a
else:win32-g++:CONFIG(debug, debug|release): PRE_TARGETDEPS += $$PWD/../../../bin/Debug/libLog.a
else:win32:!win32-g++:CONFIG(release, debug|release): PRE_TARGETDEPS += $$PWD/../../../bin/Release/Log.lib
else:win32:!win32-g++:CONFIG(debug, debug|release): PRE_TARGETDEPS += $$PWD/../../../bin/Debug/Log.lib
else:unix: PRE_TARGETDEPS += $$PWD/../../../bin/libLog.a
