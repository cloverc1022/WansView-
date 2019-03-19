# Install script for directory: /home/mamengchao/vlc/vlc-3.0/contrib/win32/srt

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/mamengchao/vlc/vlc-3.0/contrib/i686-w64-mingw32")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "/home/mamengchao/vlc/vlc-3.0/contrib/win32/srt/libsrt.a")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/srt" TYPE FILE FILES
    "/home/mamengchao/vlc/vlc-3.0/contrib/win32/srt/srtcore/srt.h"
    "/home/mamengchao/vlc/vlc-3.0/contrib/win32/srt/srtcore/logging_api.h"
    "/home/mamengchao/vlc/vlc-3.0/contrib/win32/srt/srtcore/platform_sys.h"
    "/home/mamengchao/vlc/vlc-3.0/contrib/win32/srt/srtcore/udt.h"
    "/home/mamengchao/vlc/vlc-3.0/contrib/win32/srt/srtcore/srt4udt.h"
    "/home/mamengchao/vlc/vlc-3.0/contrib/win32/srt/common/win/wintime.h"
    "/home/mamengchao/vlc/vlc-3.0/contrib/win32/srt/common/win/syslog_defs.h"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/srt/win" TYPE FILE FILES
    "/home/mamengchao/vlc/vlc-3.0/contrib/win32/srt/common/win/wintime.h"
    "/home/mamengchao/vlc/vlc-3.0/contrib/win32/srt/common/win/syslog_defs.h"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/mamengchao/vlc/vlc-3.0/contrib/win32/srt/haisrt.pc")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/mamengchao/vlc/vlc-3.0/contrib/win32/srt/srt.pc")
endif()

if(CMAKE_INSTALL_COMPONENT)
  set(CMAKE_INSTALL_MANIFEST "install_manifest_${CMAKE_INSTALL_COMPONENT}.txt")
else()
  set(CMAKE_INSTALL_MANIFEST "install_manifest.txt")
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
file(WRITE "/home/mamengchao/vlc/vlc-3.0/contrib/win32/srt/${CMAKE_INSTALL_MANIFEST}"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
