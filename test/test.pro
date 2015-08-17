TEMPLATE = app
QT += testlib widgets xml xmlpatterns
CONFIG += testcase
SOURCES += test.cpp

# Define the build user (for TCX).
DEFINES += $$shell_quote(BUILD_USER=unit tests)

# Disable automatic ASCII conversions (best practice for internationalization).
DEFINES += QT_NO_CAST_FROM_ASCII QT_NO_CAST_TO_ASCII

# Add the embedded resources.
RESOURCES = ../qrc/app.qrc

# Neaten the output directories.
CONFIG(debug,debug|release) DESTDIR = debug
CONFIG(release,debug|release) DESTDIR = release
MOC_DIR = $$DESTDIR/tmp
OBJECTS_DIR = $$DESTDIR/tmp
RCC_DIR = $$DESTDIR/tmp
UI_DIR = $$DESTDIR/tmp

# Code coverage reporting (for Linux at least).
unix {
    # Enable gcov compile and link flags.
    QMAKE_CXXFLAGS += -fprofile-arcs -ftest-coverage
    QMAKE_LFLAGS += -fprofile-arcs -ftest-coverage
    QMAKE_CXXFLAGS_RELEASE -= -O1 -O2 -O3
    QMAKE_RPATHDIR += ../release

    # Generate gcov's gcda files by executing the test program.
    gcov.depends = test
    gcov.target = build/test.gcda
    gcov.commands = ./test

    # Generate an lcov tracefile from gcov's gcda files.
    lcov.depends = build/test.gcda
    lcov.target = build/coverage.info
    lcov.commands = lcov --capture --base-directory ../src --directory build \
                         --output build/coverage.info --quiet; \
                    lcov --remove build/coverage.info '"/usr/include/*/*"' \
                         '"src/*/test*"' '"src/build/*"' src/test.cpp \
                         --output build/coverage.info --quiet

    # Generate HTML coverage reports from lcov's tracefile.
    coverage.depends = build/coverage.info
    coverage.commands += genhtml --output-directory coverage_html \
                         --prefix `readlink -f ../src` --quiet \
                         --title PROJECT_NAME build/coverage.info

    # Include the custom targets in the generated build scripts (eg Makefile).
    QMAKE_EXTRA_TARGETS += coverage gcov lcov

    # Clean up files generated by the above custom targets.
    QMAKE_CLEAN += build/*.gcda build/*.gcno build/coverage.info
    QMAKE_DISTCLEAN += -r coverage_html
}

# Qt 5.3 MSVC 64-bit (on AppVeyor at least) needs a stack larger than the 1MB default.
win32:equals(QT_ARCH, x86_64):contains(QT_VERSION, ^5\\.3\\..*):QMAKE_LFLAGS += /STACK:2097152

INCLUDEPATH += $$PWD
INCLUDEPATH += ../src
include(polar/v2/v2.pri)
include(protobuf/protobuf.pri)
include(tools/tools.pri)
include(../src/os/os.pri)
