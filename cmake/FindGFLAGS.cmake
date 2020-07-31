set(_gflags_ORIG_CMAKE_FIND_LIBRARY_SUFFIXES ${CMAKE_FIND_LIBRARY_SUFFIXES})

find_path(GFLAGS_INCLUDE_PATH gflags/gflags.h)

if (GFLAGS_STATIC)
  if (WIN32)
    set(CMAKE_FIND_LIBRARY_SUFFIXES .lib ${CMAKE_FIND_LIBRARY_SUFFIXES})
  else (WIN32)
    set(CMAKE_FIND_LIBRARY_SUFFIXES .a ${CMAKE_FIND_LIBRARY_SUFFIXES})
  endif (WIN32)
endif (GFLAGS_STATIC)
find_library(GFLAGS_LIBRARY NAMES gflags libgflags gflags_debug libgflags_debug gflags_nothreads libgflags_nothreads gflags_nothreads_debug libgflags_nothreads_debug)
if(GFLAGS_INCLUDE_PATH AND GFLAGS_LIBRARY)
  set(GFLAGS_FOUND TRUE)
endif(GFLAGS_INCLUDE_PATH AND GFLAGS_LIBRARY)
if(GFLAGS_FOUND)
  if(NOT GFLAGS_FIND_QUIETLY)
    message(STATUS "Found gflags: ${GFLAGS_LIBRARY}")
  endif(NOT GFLAGS_FIND_QUIETLY)
else(GFLAGS_FOUND)
  if(GFLAGS_FIND_REQUIRED)
    message(FATAL_ERROR "Could not find gflags library.")
  endif(GFLAGS_FIND_REQUIRED)
endif(GFLAGS_FOUND)

set(CMAKE_FIND_LIBRARY_SUFFIXES ${_gflags_ORIG_CMAKE_FIND_LIBRARY_SUFFIXES})
