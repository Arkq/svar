# Distributed under the terms of the MIT license.

find_path(LAME_INCLUDE_DIR lame/lame.h)
find_library(LAME_LIBRARIES NAMES mp3lame)

if(LAME_INCLUDE_DIR AND LAME_LIBRARIES)

	add_library(Mp3Lame::Mp3Lame INTERFACE IMPORTED)
	set_property(TARGET Mp3Lame::Mp3Lame PROPERTY
		INTERFACE_INCLUDE_DIRECTORIES "${LAME_INCLUDE_DIR}")
	set_property(TARGET Mp3Lame::Mp3Lame PROPERTY
		INTERFACE_LINK_LIBRARIES "${LAME_LIBRARIES}")

	if(NOT Mp3Lame_FIND_QUIETLY)
		message(STATUS "Found mp3lame includes: ${LAME_INCLUDE_DIR}/lame/lame.h")
		message(STATUS "Found mp3lame library: ${LAME_LIBRARIES}")
	endif()

else()

	if(Mp3Lame_FIND_REQUIRED)
		message(FATAL_ERROR "Could NOT find mp3lame development files")
	endif()

endif()
