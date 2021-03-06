TARGET = fluidcontrolsplugin
TARGETPATH = Fluid/Controls
IMPORT_VERSION = 1.0

QT += qml quick

HEADERS += \
    $$PWD/iconthemeimageprovider.h \
    $$PWD/controlsplugin.h

SOURCES += \
    $$PWD/iconthemeimageprovider.cpp \
    $$PWD/controlsplugin.cpp

QML_FILES += \
    $$files(*.qml)

RESOURCES += icons.qrc

INCLUDEPATH += $$PWD

CONFIG += no_cxx_module
load(qml_plugin)

# Copy all files to the build directory so that QtCreator will recognize
# the QML module and the demo will run without installation
qmlfiles2build.files = $$QML_FILES
qmlfiles2build.path = $$DESTDIR
COPIES += qmlfiles2build
