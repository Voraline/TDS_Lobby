-- Script path: ReplicatedStorage.Packages._Index.jsdotlua_shared@17.2.1.shared.isValidElementType
-- Decompile time: 1.21 ms

local ReactSymbols = require(script.Parent:WaitForChild("ReactSymbols"))
local REACT_CONTEXT_TYPE = ReactSymbols.REACT_CONTEXT_TYPE
local REACT_FORWARD_REF_TYPE = ReactSymbols.REACT_FORWARD_REF_TYPE
local REACT_FRAGMENT_TYPE = ReactSymbols.REACT_FRAGMENT_TYPE
local REACT_PROFILER_TYPE = ReactSymbols.REACT_PROFILER_TYPE
local REACT_PROVIDER_TYPE = ReactSymbols.REACT_PROVIDER_TYPE
local REACT_DEBUG_TRACING_MODE_TYPE = ReactSymbols.REACT_DEBUG_TRACING_MODE_TYPE
local REACT_STRICT_MODE_TYPE = ReactSymbols.REACT_STRICT_MODE_TYPE
local REACT_SUSPENSE_TYPE = ReactSymbols.REACT_SUSPENSE_TYPE
local REACT_MEMO_TYPE = ReactSymbols.REACT_MEMO_TYPE
local REACT_LAZY_TYPE = ReactSymbols.REACT_LAZY_TYPE
local REACT_FUNDAMENTAL_TYPE = ReactSymbols.REACT_FUNDAMENTAL_TYPE
local REACT_BLOCK_TYPE = ReactSymbols.REACT_BLOCK_TYPE
local REACT_SERVER_BLOCK_TYPE = ReactSymbols.REACT_SERVER_BLOCK_TYPE
local REACT_LEGACY_HIDDEN_TYPE = ReactSymbols.REACT_LEGACY_HIDDEN_TYPE
return function(a1) -- Line: 31
    -- upvalues: REACT_FRAGMENT_TYPE (val), REACT_PROFILER_TYPE (val), REACT_DEBUG_TRACING_MODE_TYPE (val)
    -- upvalues: REACT_STRICT_MODE_TYPE (val), REACT_SUSPENSE_TYPE (val), REACT_LEGACY_HIDDEN_TYPE (val)
    -- upvalues: REACT_LAZY_TYPE (val), REACT_MEMO_TYPE (val), REACT_PROVIDER_TYPE (val), REACT_CONTEXT_TYPE (val)
    -- upvalues: REACT_FORWARD_REF_TYPE (val), REACT_FUNDAMENTAL_TYPE (val), REACT_BLOCK_TYPE (val)
    -- upvalues: REACT_SERVER_BLOCK_TYPE (val)
    local v1 = typeof(a1)
    if v1 ~= "string" and v1 ~= "function" then
        if a1 ~= REACT_FRAGMENT_TYPE
            and a1 ~= REACT_PROFILER_TYPE
            and a1 ~= REACT_DEBUG_TRACING_MODE_TYPE
            and a1 ~= REACT_STRICT_MODE_TYPE
            and a1 ~= REACT_SUSPENSE_TYPE
            and a1 ~= REACT_LEGACY_HIDDEN_TYPE then
            if v1 ~= "table" then
                return false
            end
            if a1.isReactComponent then
                return true
            end
            if a1["$$typeof"] ~= REACT_LAZY_TYPE
                and a1["$$typeof"] ~= REACT_MEMO_TYPE
                and a1["$$typeof"] ~= REACT_PROVIDER_TYPE
                and a1["$$typeof"] ~= REACT_CONTEXT_TYPE
                and a1["$$typeof"] ~= REACT_FORWARD_REF_TYPE
                and a1["$$typeof"] ~= REACT_FUNDAMENTAL_TYPE
                and a1["$$typeof"] ~= REACT_BLOCK_TYPE
                and a1[1] ~= REACT_SERVER_BLOCK_TYPE then
                return false
            end
            return true
        end
        return true
    end
    return true
end