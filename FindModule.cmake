set({MODULE}_LIBRARIES "")
set({MODULE}_HEADERS "")
set({MODULE}_VERSION 1.0)

foreach(header IN LISTS {MODULE}_HEADERS)
    find_path(INTERNAL_HEADERS_DIR "${header}")

    list(FIND {MODULE}_INCLUDE_DIR ${INTERNAL_HEADERS_DIR} result)
    if(result EQUAL -1)
        list(APPEND {MODULE}_INCLUDE_DIR ${INTERNAL_HEADERS_DIR})
    endif(result EQUAL -1)
    unset(INTERNAL_HEADERS_DIR CACHE)
endforeach(header)

foreach(library IN LISTS {MODULE}_LIBRARIES)
    find_library(INTERNAL_LIBRARIES "${library}")
    list(FIND {MODULE}_LIBRARIES_DIR ${INTERNAL_LIBRARIES} result)
    if(result EQUAL -1)
        list(APPEND {MODULE}_LIBRARIES_DIR ${INTERNAL_LIBRARIES})
    endif(result EQUAL -1)
    unset(INTERNAL_LIBRARIES_DIR CACHE)
endforeach(library)

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args({MODULE}
    REQUIRED_VARS
        {MODULE}_INCLUDE_DIR {MODULE}_LIBRARIES_DIR
    VERSION_VAR MODULE_VERSION
    HANDLE_COMPONENTS
)
