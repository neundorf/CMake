option(CMAKE_ENABLE_EXTRA_GENERATOR_KATE "Enable project files for Kate")
if(CMAKE_ENABLE_EXTRA_GENERATOR_KATE)
  include("${CMAKE_CURRENT_LIST_DIR}/CMakeFindKate.cmake")
endif()

option(CMAKE_ENABLE_EXTRA_GENERATOR_ECLIPSE "Enable project files for Eclipse CDT")
if(CMAKE_ENABLE_EXTRA_GENERATOR_ECLIPSE)
  include("${CMAKE_CURRENT_LIST_DIR}/CMakeFindEclipseCDT4.cmake")
endif()

option(CMAKE_ENABLE_EXTRA_GENERATOR_CODEBLOCKS "Enable project files for Code::Blocks")
if(CMAKE_ENABLE_EXTRA_GENERATOR_CODEBLOCKS)
  include("${CMAKE_CURRENT_LIST_DIR}/CMakeFindCodeBlocks.cmake")
endif()

option(CMAKE_ENABLE_EXTRA_GENERATOR_KDEVELOP3 "Enable project files for KDevelop3")
if(CMAKE_ENABLE_EXTRA_GENERATOR_KDEVELOP3)
  include("${CMAKE_CURRENT_LIST_DIR}/CMakeFindKDevelop3.cmake")
endif()

option(CMAKE_ENABLE_EXTRA_GENERATOR_CODELITE "Enable project files for CodeLite")

option(CMAKE_ENABLE_EXTRA_GENERATOR_SUBLIME "Enable project files for Sublime")
