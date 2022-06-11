cmake_minimum_required(VERSION 3.16)

project(kwin_impanel)

set(PROJECT_VERSION "1.0")

set(QT_MIN_VERSION "5.15.0")
set(KF5_MIN_VERSION "5.90")
set(KDE_COMPILERSETTINGS_LEVEL "5.82")

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(ECM ${KF5_MIN_VERSION} REQUIRED NO_MODULE)
set(CMAKE_MODULE_PATH ${ECM_MODULE_PATH} ${CMAKE_CURRENT_SOURCE_DIR}/cmake/modules)

include(KDEInstallDirs)
include(KDECMakeSettings)
include(KDECompilerSettings NO_POLICY_SCOPE)
include(KDEClangFormat)
include(KDEGitCommitHooks)

include(ECMInstallIcons)
include(ECMOptionalAddSubdirectory)
include(ECMConfiguredInstall)
include(ECMQtDeclareLoggingCategory)

find_package(Qt5 ${QT_MIN_VERSION} CONFIG REQUIRED COMPONENTS
    Quick
    QuickWidgets
    DBus
    Widgets
    Svg
)

# required frameworks by Core
find_package(KF5 ${KF5_MIN_VERSION} REQUIRED COMPONENTS
    #Auth
    #Config
    #ConfigWidgets
    #CoreAddons
    #Crash
    #DBusAddons
    #GlobalAccel
    #I18n
    #IdleTime
    Package
    #Plasma
    #WidgetsAddons
    #WindowSystem
)
# required frameworks by config modules
#find_package(KF5 ${KF5_MIN_VERSION} REQUIRED COMPONENTS
    #Declarative
    #KCMUtils
    #NewStuff
    #Service
    #XmlGui
    #ItemViews
#)

add_subdirectory(plugin)
# https://github.com/KDE/kpackage/blob/master/KF5PackageMacros.cmake
# kpackage_install_package(path componentname [root] [install_dir])
kpackage_install_package(package kwin_impanel scripts kwin)
