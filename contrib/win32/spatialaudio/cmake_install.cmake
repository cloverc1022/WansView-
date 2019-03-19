# Install script for directory: /home/mamengchao/vlc/vlc-3.0/contrib/win32/spatialaudio

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "/home/mamengchao/vlc/vlc-3.0/contrib/win32/spatialaudio/libspatialaudio.a")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/spatialaudio" TYPE FILE FILES
    "/home/mamengchao/vlc/vlc-3.0/contrib/win32/spatialaudio/include/AmbisonicBase.h"
    "/home/mamengchao/vlc/vlc-3.0/contrib/win32/spatialaudio/include/AmbisonicDecoderPresets.h"
    "/home/mamengchao/vlc/vlc-3.0/contrib/win32/spatialaudio/include/AmbisonicProcessor.h"
    "/home/mamengchao/vlc/vlc-3.0/contrib/win32/spatialaudio/include/AmbisonicSpeaker.h"
    "/home/mamengchao/vlc/vlc-3.0/contrib/win32/spatialaudio/include/AmbisonicBinauralizer.h"
    "/home/mamengchao/vlc/vlc-3.0/contrib/win32/spatialaudio/include/AmbisonicEncoderDist.h"
    "/home/mamengchao/vlc/vlc-3.0/contrib/win32/spatialaudio/include/AmbisonicPsychoacousticFilters.h"
    "/home/mamengchao/vlc/vlc-3.0/contrib/win32/spatialaudio/include/AmbisonicTypesDefinesCommons.h"
    "/home/mamengchao/vlc/vlc-3.0/contrib/win32/spatialaudio/include/SpeakersBinauralizer.h"
    "/home/mamengchao/vlc/vlc-3.0/contrib/win32/spatialaudio/include/AmbisonicCommons.h"
    "/home/mamengchao/vlc/vlc-3.0/contrib/win32/spatialaudio/include/AmbisonicEncoder.h"
    "/home/mamengchao/vlc/vlc-3.0/contrib/win32/spatialaudio/include/Ambisonics.h"
    "/home/mamengchao/vlc/vlc-3.0/contrib/win32/spatialaudio/include/AmbisonicZoomer.h"
    "/home/mamengchao/vlc/vlc-3.0/contrib/win32/spatialaudio/include/mit_hrtf_filter.h"
    "/home/mamengchao/vlc/vlc-3.0/contrib/win32/spatialaudio/include/AmbisonicDecoder.h"
    "/home/mamengchao/vlc/vlc-3.0/contrib/win32/spatialaudio/include/AmbisonicMicrophone.h"
    "/home/mamengchao/vlc/vlc-3.0/contrib/win32/spatialaudio/include/AmbisonicSource.h"
    "/home/mamengchao/vlc/vlc-3.0/contrib/win32/spatialaudio/include/BFormat.h"
    "/home/mamengchao/vlc/vlc-3.0/contrib/win32/spatialaudio/include/mit_hrtf_lib.h"
    "/home/mamengchao/vlc/vlc-3.0/contrib/win32/spatialaudio/include/hrtf/hrtf.h"
    "/home/mamengchao/vlc/vlc-3.0/contrib/win32/spatialaudio/include/hrtf/mit_hrtf.h"
    "/home/mamengchao/vlc/vlc-3.0/contrib/win32/spatialaudio/include/hrtf/sofa_hrtf.h"
    "/home/mamengchao/vlc/vlc-3.0/contrib/win32/spatialaudio/include/normal/mit_hrtf_normal_44100.h"
    "/home/mamengchao/vlc/vlc-3.0/contrib/win32/spatialaudio/include/normal/mit_hrtf_normal_48000.h"
    "/home/mamengchao/vlc/vlc-3.0/contrib/win32/spatialaudio/include/normal/mit_hrtf_normal_88200.h"
    "/home/mamengchao/vlc/vlc-3.0/contrib/win32/spatialaudio/include/normal/mit_hrtf_normal_96000.h"
    "/home/mamengchao/vlc/vlc-3.0/contrib/win32/spatialaudio/source/kiss_fft/kiss_fftr.h"
    "/home/mamengchao/vlc/vlc-3.0/contrib/win32/spatialaudio/source/kiss_fft/kiss_fft.h"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/mamengchao/vlc/vlc-3.0/contrib/win32/spatialaudio/spatialaudio.pc")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/spatialaudio" TYPE FILE FILES "/home/mamengchao/vlc/vlc-3.0/contrib/win32/spatialaudio/config.h")
endif()

if(CMAKE_INSTALL_COMPONENT)
  set(CMAKE_INSTALL_MANIFEST "install_manifest_${CMAKE_INSTALL_COMPONENT}.txt")
else()
  set(CMAKE_INSTALL_MANIFEST "install_manifest.txt")
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
file(WRITE "/home/mamengchao/vlc/vlc-3.0/contrib/win32/spatialaudio/${CMAKE_INSTALL_MANIFEST}"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
