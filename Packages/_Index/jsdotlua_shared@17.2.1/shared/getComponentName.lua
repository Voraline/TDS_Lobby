-- Script path: ReplicatedStorage.Packages._Index.jsdotlua_shared@17.2.1.shared.getComponentName
-- Decompile time: 3.07 ms

local getComponentName
local console = require(script.Parent:WaitForChild("console"))
local ReactSymbols = require(script.Parent:WaitForChild("ReactSymbols"))
local REACT_CONTEXT_TYPE = ReactSymbols.REACT_CONTEXT_TYPE
local REACT_FORWARD_REF_TYPE = ReactSymbols.REACT_FORWARD_REF_TYPE
local REACT_FRAGMENT_TYPE = ReactSymbols.REACT_FRAGMENT_TYPE
local REACT_PORTAL_TYPE = ReactSymbols.REACT_PORTAL_TYPE
local REACT_MEMO_TYPE = ReactSymbols.REACT_MEMO_TYPE
local REACT_PROFILER_TYPE = ReactSymbols.REACT_PROFILER_TYPE
local REACT_PROVIDER_TYPE = ReactSymbols.REACT_PROVIDER_TYPE
local REACT_STRICT_MODE_TYPE = ReactSymbols.REACT_STRICT_MODE_TYPE
local REACT_SUSPENSE_TYPE = ReactSymbols.REACT_SUSPENSE_TYPE
local REACT_SUSPENSE_LIST_TYPE = ReactSymbols.REACT_SUSPENSE_LIST_TYPE
local REACT_LAZY_TYPE = ReactSymbols.REACT_LAZY_TYPE
local REACT_BLOCK_TYPE = ReactSymbols.REACT_BLOCK_TYPE
require(script.Parent:WaitForChild("ReactTypes"))
local describeError = (require((script.Parent:WaitForChild("ErrorHandling.roblox")))).describeError

local function getWrappedName(a1, a2, a3) -- Line: 40 -- types: a3: string
    local v1 = "<function>"
    if typeof(a2) == "table" then
        v1 = a2.displayName or a2.name or ""
    end
    return a1.displayName or not (v1 == "") and string.format("%s(%s)", a3, v1) or a3
end

local function getContextName(a1) -- Line: 53
    return a1.displayName or "Context"
end

function getComponentName(a1) -- Line: 57
    -- upvalues: console (val), REACT_FRAGMENT_TYPE (val), REACT_PORTAL_TYPE (val), REACT_PROFILER_TYPE (val)
    -- upvalues: REACT_STRICT_MODE_TYPE (val), REACT_SUSPENSE_TYPE (val), REACT_SUSPENSE_LIST_TYPE (val)
    -- upvalues: REACT_CONTEXT_TYPE (val), REACT_PROVIDER_TYPE (val), REACT_FORWARD_REF_TYPE (val)
    -- upvalues: REACT_MEMO_TYPE (val), getComponentName (val), REACT_BLOCK_TYPE (val), REACT_LAZY_TYPE (val)
    -- upvalues: describeError (val)
    local v1
    if a1 == nil then
        return nil
    end
    local v2 = typeof(a1)
    if _G.__DEV__ and v2 == "table" and typeof(a1.tag) == "number" then
        console.warn("Received an unexpected object in getComponentName(). This is likely a bug in React. Please file an issue.")
    end
    if v2 == "function" then
        v1 = debug.info(a1, "n")
        if v1 and 0 < (string.len(v1)) then
            return v1
        end
        return nil
    end
    if v2 == "string" then
        return a1
    end
    if a1 == REACT_FRAGMENT_TYPE then
        return "Fragment"
    end
    if a1 == REACT_PORTAL_TYPE then
        return "Portal"
    end
    if a1 == REACT_PROFILER_TYPE then
        return "Profiler"
    end
    if a1 == REACT_STRICT_MODE_TYPE then
        return "StrictMode"
    end
    if a1 == REACT_SUSPENSE_TYPE then
        return "Suspense"
    end
    if a1 == REACT_SUSPENSE_LIST_TYPE then
        return "SuspenseList"
    end
    if v2 == "table" then
        v1 = a1["$$typeof"]
        if v1 == REACT_CONTEXT_TYPE then
            return (a1.displayName or "Context") .. ".Consumer"
        end
        if v1 == REACT_PROVIDER_TYPE then
            return (a1._context.displayName or "Context") .. ".Provider"
        end
        if v1 == REACT_FORWARD_REF_TYPE then
            local render = a1.render
            local v3 = "<function>"
            if typeof(render) == "table" then
                v3 = render.displayName or render.name or ""
            end
            return a1.displayName or not (v3 == "") and string.format("%s(%s)", "ForwardRef", v3) or "ForwardRef"
        end
        if v1 == REACT_MEMO_TYPE then
            return getComponentName(a1.type)
        end
        if v1 == REACT_BLOCK_TYPE then
            return getComponentName(a1._render)
        end
        if v1 == REACT_LAZY_TYPE then
            local success, result = xpcall(a1._init, describeError, a1._payload)
            if success then
                return getComponentName(result)
            end
            return nil
        end
        if a1.displayName then
            return a1.displayName
        end
        if a1.name then
            return a1.name
        end
        local v4 = getmetatable(a1)
        if v4 and rawget(v4, "__tostring") then
            return (tostring(a1))
        end
    end
    return nil
end

return getComponentName