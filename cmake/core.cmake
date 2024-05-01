################################
# TIC-80 core
################################

macro(MACRO_CORE SCRIPT DEFINE BUILD_DEPRECATED)

    set(TIC80CORE_DIR ${CMAKE_SOURCE_DIR}/src)
    set(TIC80CORE_SRC
        ${TIC80CORE_DIR}/core/core.c
        ${TIC80CORE_DIR}/core/draw.c
        ${TIC80CORE_DIR}/core/io.c
        ${TIC80CORE_DIR}/core/sound.c
        ${TIC80CORE_DIR}/tic.c
        ${TIC80CORE_DIR}/cart.c
        ${TIC80CORE_DIR}/tools.c
        ${TIC80CORE_DIR}/zip.c
        ${TIC80CORE_DIR}/tilesheet.c
    )

    if(${BUILD_DEPRECATED})
        set(TIC80CORE_SRC ${TIC80CORE_SRC} ${TIC80CORE_DIR}/ext/gif.c)
    endif()

    add_library(tic80core${SCRIPT} STATIC ${TIC80CORE_SRC})

    if (FREEBSD)
        target_include_directories(tic80core${SCRIPT} PRIVATE ${SYSROOT_PATH}/usr/local/include)
        target_link_directories(tic80core${SCRIPT} PRIVATE ${SYSROOT_PATH}/usr/local/lib)
    endif()

    target_include_directories(tic80core${SCRIPT}
        PRIVATE
            ${THIRDPARTY_DIR}/moonscript
            ${THIRDPARTY_DIR}/fennel
            ${POCKETPY_DIR}/src
        PUBLIC
            ${CMAKE_SOURCE_DIR}/include
            ${CMAKE_SOURCE_DIR}/src)

    target_link_libraries(tic80core${SCRIPT} PRIVATE blipbuf zlib)


    if(BUILD_STATIC)
        if(BUILD_WITH_LUA)
            # !TODO: make it PRIVATE
            target_link_libraries(tic80core${SCRIPT} PUBLIC lua)
        endif()

        if(BUILD_WITH_MOON)
            target_link_libraries(tic80core${SCRIPT} PRIVATE moon)
        endif()

        if(BUILD_WITH_FENNEL)
            target_link_libraries(tic80core${SCRIPT} PRIVATE fennel)
        endif()
        
        if(BUILD_WITH_JS)
            target_link_libraries(tic80core${SCRIPT} PRIVATE js)
        endif()

        if(BUILD_WITH_SCHEME)
            target_link_libraries(tic80core${SCRIPT} PRIVATE scheme)
        endif()

        if(BUILD_WITH_SQUIRREL)
            target_link_libraries(tic80core${SCRIPT} PRIVATE squirrel)
        endif()

        if(BUILD_WITH_PYTHON)
            target_link_libraries(tic80core${SCRIPT} PRIVATE python)
        endif()

        if(BUILD_WITH_WREN)
            target_link_libraries(tic80core${SCRIPT} PRIVATE wren)
        endif()

        if(BUILD_WITH_MRUBY)
            target_link_libraries(tic80core${SCRIPT} PRIVATE ruby)
        endif()

        if(BUILD_WITH_JANET)
            target_link_libraries(tic80core${SCRIPT} PRIVATE janet)
        endif()

        if(BUILD_WITH_WASM)
            target_link_libraries(tic80core${SCRIPT} PRIVATE wasm)
        endif()

        target_link_libraries(tic80core${SCRIPT} PRIVATE runtime)

    elseif(WIN32)
        target_include_directories(tic80core${SCRIPT} PRIVATE ${THIRDPARTY_DIR}/dlfcn/src)
        add_library(dlfcn STATIC ${THIRDPARTY_DIR}/dlfcn/src/dlfcn.c)
        target_link_libraries(tic80core${SCRIPT} PRIVATE dlfcn)
    endif()

    if(${BUILD_DEPRECATED})
        target_compile_definitions(tic80core${SCRIPT} PRIVATE BUILD_DEPRECATED)
        target_link_libraries(tic80core${SCRIPT} PRIVATE giflib)
    endif()

    if(LINUX)
        target_link_libraries(tic80core${SCRIPT} PRIVATE m)
    endif()

    target_compile_definitions(tic80core${SCRIPT} PUBLIC ${DEFINE})

endmacro()

MACRO_CORE("" "" TRUE)

if(BUILD_STATIC AND BUILD_STUB)

    if(BUILD_WITH_LUA)
        MACRO_CORE(lua TIC_BUILD_WITH_LUA FALSE)
    endif()

    if(BUILD_WITH_MOON)
        MACRO_CORE(moon TIC_BUILD_WITH_MOON FALSE)
    endif()

    if(BUILD_WITH_FENNEL)
        MACRO_CORE(fennel TIC_BUILD_WITH_FENNEL FALSE)
    endif()

    if(BUILD_WITH_JS)
        MACRO_CORE(js TIC_BUILD_WITH_JS FALSE)
    endif()

    if(BUILD_WITH_SCHEME)
        MACRO_CORE(scheme TIC_BUILD_WITH_SCHEME FALSE)
    endif()

    if(BUILD_WITH_SQUIRREL)
        MACRO_CORE(squirrel TIC_BUILD_WITH_SQUIRREL FALSE)
    endif()

    if(BUILD_WITH_PYTHON)
        MACRO_CORE(python TIC_BUILD_WITH_PYTHON FALSE)
    endif()

    if(BUILD_WITH_WREN)
        MACRO_CORE(wren TIC_BUILD_WITH_WREN FALSE)
    endif()

    if(BUILD_WITH_MRUBY)
        MACRO_CORE(ruby TIC_BUILD_WITH_MRUBY FALSE)
    endif()

    if(BUILD_WITH_JANET)
        MACRO_CORE(janet TIC_BUILD_WITH_JANET FALSE)
    endif()

    if(BUILD_WITH_WASM)
        MACRO_CORE(wasm TIC_BUILD_WITH_WASM FALSE)
    endif()

endif()
