# This file is processed when the IAR compiler is used for a C or C++ file
# Documentation can be downloaded here: http://www.iar.com/website1/1.0.1.0/675/1/
# The initial bug report is here: http://public.kitware.com/Bug/view.php?id=10176
# It also contains additional links and information.

IF(_IAR_CMAKE_LOADED)
  RETURN()
ENDIF(_IAR_CMAKE_LOADED)
SET(_IAR_CMAKE_LOADED TRUE)


IF("${CMAKE_C_COMPILER}" MATCHES "arm"  OR  "${CMAKE_CXX_COMPILER}" MATCHES "arm"  OR  "${CMAKE_ASM_COMPILER}" MATCHES "arm")
  SET(CMAKE_EXECUTABLE_SUFFIX ".elf")

  # For arm, IAR uses the "ilinkarm" linker and "iarchive" archiver:
  FIND_PROGRAM(CMAKE_IAR_LINKER ilinkarm HINTS "${_CMAKE_TOOLCHAIN_LOCATION}" )
  FIND_PROGRAM(CMAKE_IAR_AR iarchive HINTS "${_CMAKE_TOOLCHAIN_LOCATION}" )

  SET(IAR_TARGET_ARCHITECTURE "ARM" CACHE STRING "IAR compiler target architecture")
ENDIF("${CMAKE_C_COMPILER}" MATCHES "arm"  OR  "${CMAKE_CXX_COMPILER}" MATCHES "arm"  OR  "${CMAKE_ASM_COMPILER}" MATCHES "arm")

IF("${CMAKE_C_COMPILER}" MATCHES "avr"  OR  "${CMAKE_CXX_COMPILER}" MATCHES "avr"  OR  "${CMAKE_ASM_COMPILER}" MATCHES "avr")
  SET(CMAKE_EXECUTABLE_SUFFIX ".bin")

  # For AVR and AVR32, IAR uses the "xlink" linker and the "xar" archiver:
  FIND_PROGRAM(CMAKE_IAR_LINKER xlink HINTS "${_CMAKE_TOOLCHAIN_LOCATION}" )
  FIND_PROGRAM(CMAKE_IAR_AR xar HINTS "${_CMAKE_TOOLCHAIN_LOCATION}" )

  SET(IAR_TARGET_ARCHITECTURE "AVR" CACHE STRING "IAR compiler target architecture")

  SET(CMAKE_LIBRARY_PATH_FLAG "-I")

ENDIF("${CMAKE_C_COMPILER}" MATCHES "avr"  OR  "${CMAKE_CXX_COMPILER}" MATCHES "avr"  OR  "${CMAKE_ASM_COMPILER}" MATCHES "avr")

IF(NOT IAR_TARGET_ARCHITECTURE)
  MESSAGE(FATAL_ERROR "The IAR compiler for this architecture is not yet supported "
          " by CMake. Please go to http://public.kitware.com/Bug and enter a feature request there.")
ENDIF(NOT IAR_TARGET_ARCHITECTURE)

SET(CMAKE_LINKER ${CMAKE_IAR_LINKER} CACHE FILEPATH "The IAR linker" FORCE)
SET(CMAKE_AR ${CMAKE_IAR_AR} CACHE FILEPATH "The IAR archiver" FORCE)
