#include <stddef.h>
#include "api.h"

#if defined(TIC_RUNTIME_STATIC)

    #if defined (TIC_BUILD_WITH_LUA)
    extern const tic_script_config LuaSyntaxConfig;
    #endif

    #if defined(TIC_BUILD_WITH_MRUBY)
    extern const tic_script_config RubySyntaxConfig;
    #endif

    #if defined(TIC_BUILD_WITH_JS)
    extern const tic_script_config JsSyntaxConfig;
    #endif

    #if defined(TIC_BUILD_WITH_MOON)
    extern const tic_script_config MoonSyntaxConfig;
    #endif

    #if defined(TIC_BUILD_WITH_FENNEL)
    extern const tic_script_config FennelSyntaxConfig;
    #endif

    #if defined(TIC_BUILD_WITH_SQUIRREL)
    extern const tic_script_config SquirrelSyntaxConfig;
    #endif

    #if defined(TIC_BUILD_WITH_SCHEME)
    extern const tic_script_config SchemeSyntaxConfig;
    #endif

    #if defined(TIC_BUILD_WITH_WREN)
    extern const tic_script_config WrenSyntaxConfig;
    #endif

    #if defined(TIC_BUILD_WITH_WASM)
    extern const tic_script_config WasmSyntaxConfig;
    #endif

    #if defined(TIC_BUILD_WITH_JANET)
    extern const tic_script_config JanetSyntaxConfig;
    #endif

    #if defined(TIC_BUILD_WITH_PYTHON)
    extern const tic_script_config PythonSyntaxConfig;
    #endif
#endif

const tic_script_config* Languages[MAX_SUPPORTED_LANGS + 1] = 
{

#if defined(TIC_RUNTIME_STATIC)

    #if defined (TIC_BUILD_WITH_LUA)
    &LuaSyntaxConfig,
    #endif

    #if defined(TIC_BUILD_WITH_MRUBY)
    &RubySyntaxConfig,
    #endif

    #if defined(TIC_BUILD_WITH_JS)
    &JsSyntaxConfig,
    #endif

    #if defined(TIC_BUILD_WITH_MOON)
    &MoonSyntaxConfig,
    #endif

    #if defined(TIC_BUILD_WITH_FENNEL)
    &FennelSyntaxConfig,
    #endif

    #if defined(TIC_BUILD_WITH_SCHEME)
    &SchemeSyntaxConfig,
    #endif

    #if defined(TIC_BUILD_WITH_SQUIRREL)
    &SquirrelSyntaxConfig,
    #endif

    #if defined(TIC_BUILD_WITH_WREN)
    &WrenSyntaxConfig,
    #endif

    #if defined(TIC_BUILD_WITH_WASM)
    &WasmSyntaxConfig,
    #endif

    #if defined(TIC_BUILD_WITH_JANET)
    &JanetSyntaxConfig,
    #endif

    #if defined(TIC_BUILD_WITH_PYTHON)
    &PythonSyntaxConfig,
    #endif

#endif
};
