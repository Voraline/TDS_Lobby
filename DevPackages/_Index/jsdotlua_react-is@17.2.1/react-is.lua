-- Script path: ReplicatedStorage.DevPackages._Index.jsdotlua_react-is@17.2.1.react-is
-- Decompile time: 3.09 ms

local console = require(script.Parent:WaitForChild("shared")).console
local v1 = {}
local ReactSymbols = require(script.Parent:WaitForChild("shared")).ReactSymbols
local REACT_CONTEXT_TYPE = ReactSymbols.REACT_CONTEXT_TYPE
local REACT_ELEMENT_TYPE = ReactSymbols.REACT_ELEMENT_TYPE
local REACT_FORWARD_REF_TYPE = ReactSymbols.REACT_FORWARD_REF_TYPE
local REACT_FRAGMENT_TYPE = ReactSymbols.REACT_FRAGMENT_TYPE
local REACT_LAZY_TYPE = ReactSymbols.REACT_LAZY_TYPE
local REACT_MEMO_TYPE = ReactSymbols.REACT_MEMO_TYPE
local REACT_PORTAL_TYPE = ReactSymbols.REACT_PORTAL_TYPE
local REACT_PROFILER_TYPE = ReactSymbols.REACT_PROFILER_TYPE
local REACT_PROVIDER_TYPE = ReactSymbols.REACT_PROVIDER_TYPE
local REACT_STRICT_MODE_TYPE = ReactSymbols.REACT_STRICT_MODE_TYPE
local REACT_SUSPENSE_TYPE = ReactSymbols.REACT_SUSPENSE_TYPE
local REACT_SUSPENSE_LIST_TYPE = ReactSymbols.REACT_SUSPENSE_LIST_TYPE
local isValidElementType = (require((script.Parent:WaitForChild("shared")))).isValidElementType
local REACT_BINDING_TYPE = ReactSymbols.REACT_BINDING_TYPE

local function typeOf(a1) -- Line: 43
    -- upvalues: REACT_ELEMENT_TYPE (val), REACT_FRAGMENT_TYPE (val), REACT_PROFILER_TYPE (val)
    -- upvalues: REACT_STRICT_MODE_TYPE (val), REACT_SUSPENSE_TYPE (val), REACT_SUSPENSE_LIST_TYPE (val)
    -- upvalues: REACT_CONTEXT_TYPE (val), REACT_FORWARD_REF_TYPE (val), REACT_LAZY_TYPE (val), REACT_MEMO_TYPE (val)
    -- upvalues: REACT_PROVIDER_TYPE (val), REACT_PORTAL_TYPE (val), REACT_BINDING_TYPE (val)
    if typeof(a1) == "table" and a1 ~= nil then
        local v1 = a1["$$typeof"]
        if v1 ~= REACT_ELEMENT_TYPE then
            if v1 ~= REACT_PORTAL_TYPE and v1 ~= REACT_BINDING_TYPE then
                return nil
            end
            return v1
        end
        local type = a1.type
        if type ~= REACT_FRAGMENT_TYPE
            and type ~= REACT_PROFILER_TYPE
            and type ~= REACT_STRICT_MODE_TYPE
            and type ~= REACT_SUSPENSE_TYPE
            and type ~= REACT_SUSPENSE_LIST_TYPE then
            local v2 = type
            if v2 then
                v2 = false
                if typeof(type) == "table" then
                    v2 = type["$$typeof"]
                end
            end
            if v2 ~= REACT_CONTEXT_TYPE
                and v2 ~= REACT_FORWARD_REF_TYPE
                and v2 ~= REACT_LAZY_TYPE
                and v2 ~= REACT_MEMO_TYPE
                and v2 ~= REACT_PROVIDER_TYPE then
                return v1
            end
            return v2
        end
        return type
    end
    return nil
end

v1.typeOf = typeOf
v1.ContextConsumer = REACT_CONTEXT_TYPE
v1.ContextProvider = REACT_PROVIDER_TYPE
v1.Element = REACT_ELEMENT_TYPE
v1.ForwardRef = REACT_FORWARD_REF_TYPE
v1.Fragment = REACT_FRAGMENT_TYPE
v1.Lazy = REACT_LAZY_TYPE
v1.Memo = REACT_MEMO_TYPE
v1.Portal = REACT_PORTAL_TYPE
v1.Profiler = REACT_PROFILER_TYPE
v1.StrictMode = REACT_STRICT_MODE_TYPE
v1.Suspense = REACT_SUSPENSE_TYPE
v1.Binding = ReactSymbols.REACT_BINDING_TYPE
v1.isValidElementType = isValidElementType
local u43 = false
local u44 = false

function v1.isAsyncMode(a1) -- Line: 162 -- upvalues: u43 (ref), console (val)
    if _G.__DEV__ and not u43 then
        u43 = true
        console.warn("The ReactIs.isAsyncMode() alias has been deprecated, and will be removed in React 18+.")
    end
    return false
end

function v1.isConcurrentMode(a1) -- Line: 179 -- upvalues: u44 (ref), console (val)
    if _G.__DEV__ and not u44 then
        u44 = true
        console.warn("The ReactIs.isConcurrentMode() alias has been deprecated, and will be removed in React 18+.")
    end
    return false
end

function v1.isContextConsumer(a1) -- Line: 196 -- upvalues: typeOf (val), REACT_CONTEXT_TYPE (val)
    return (typeOf(a1)) == REACT_CONTEXT_TYPE
end

function v1.isContextProvider(a1) -- Line: 200 -- upvalues: typeOf (val), REACT_PROVIDER_TYPE (val)
    return (typeOf(a1)) == REACT_PROVIDER_TYPE
end

function v1.isElement(a1) -- Line: 204 -- upvalues: REACT_ELEMENT_TYPE (val)
    local v1 = false
    if typeof(a1) == "table" then
        v1 = false
        if a1 ~= nil then
            v1 = a1["$$typeof"] == REACT_ELEMENT_TYPE
        end
    end
    return v1
end

function v1.isForwardRef(a1) -- Line: 210 -- upvalues: typeOf (val), REACT_FORWARD_REF_TYPE (val)
    return (typeOf(a1)) == REACT_FORWARD_REF_TYPE
end

function v1.isFragment(a1) -- Line: 214 -- upvalues: typeOf (val), REACT_FRAGMENT_TYPE (val)
    return (typeOf(a1)) == REACT_FRAGMENT_TYPE
end

function v1.isLazy(a1) -- Line: 218 -- upvalues: typeOf (val), REACT_LAZY_TYPE (val)
    return (typeOf(a1)) == REACT_LAZY_TYPE
end

function v1.isMemo(a1) -- Line: 222 -- upvalues: typeOf (val), REACT_MEMO_TYPE (val)
    return (typeOf(a1)) == REACT_MEMO_TYPE
end

function v1.isPortal(a1) -- Line: 226 -- upvalues: typeOf (val), REACT_PORTAL_TYPE (val)
    return (typeOf(a1)) == REACT_PORTAL_TYPE
end

function v1.isProfiler(a1) -- Line: 230 -- upvalues: typeOf (val), REACT_PROFILER_TYPE (val)
    return (typeOf(a1)) == REACT_PROFILER_TYPE
end

function v1.isStrictMode(a1) -- Line: 234 -- upvalues: typeOf (val), REACT_STRICT_MODE_TYPE (val)
    return (typeOf(a1)) == REACT_STRICT_MODE_TYPE
end

function v1.isSuspense(a1) -- Line: 238 -- upvalues: typeOf (val), REACT_SUSPENSE_TYPE (val)
    return (typeOf(a1)) == REACT_SUSPENSE_TYPE
end

function v1.isBinding(a1) -- Line: 243 -- upvalues: typeOf (val), REACT_BINDING_TYPE (val)
    return (typeOf(a1)) == REACT_BINDING_TYPE
end

return v1