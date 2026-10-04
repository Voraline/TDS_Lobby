-- Script path: ReplicatedStorage.Packages._Index.jsdotlua_react-reconciler@17.2.1.react-reconciler.ReactFiberDevToolsHook.new
-- Decompile time: 2.98 ms

local console = require(script.Parent.Parent:WaitForChild("shared")).console
require(script.Parent.Parent:WaitForChild("luau-polyfill"))
local v1 = {}

local function isCallable(a1) -- Line: 27
    if typeof(a1) == "function" then
        return true
    end
    if typeof(a1) == "table" then
        local v1 = getmetatable(a1)
        if v1 and rawget(v1, "__call") then
            return true
        end
        if a1._isMockFunction then
            return true
        end
    end
    return false
end

local enableProfilerTimer = require(script.Parent.Parent:WaitForChild("shared")).ReactFeatureFlags.enableProfilerTimer
require(script.Parent:WaitForChild("ReactInternalTypes"))
require(script.Parent.Parent:WaitForChild("shared"))
local DidCapture = (require((script.Parent:WaitForChild("ReactFiberFlags")))).DidCapture
local u58 = nil
local u59 = nil
local u60 = false

function v1.isDevToolsPresent() -- Line: 63
    return _G.__REACT_DEVTOOLS_GLOBAL_HOOK__ ~= nil
end

function v1.injectInternals(a1) -- Line: 67 -- upvalues: console (val), u58 (ref), u59 (ref)
    if _G.__REACT_DEVTOOLS_GLOBAL_HOOK__ == nil then
        return false
    end
    local __REACT_DEVTOOLS_GLOBAL_HOOK__ = _G.__REACT_DEVTOOLS_GLOBAL_HOOK__
    if __REACT_DEVTOOLS_GLOBAL_HOOK__.isDisabled then
        return true
    end
    if not __REACT_DEVTOOLS_GLOBAL_HOOK__.supportsFiber then
        if _G.__DEV__ then
            console.error("The installed version of React DevTools is too old and will not work with the current version of React. Please update React DevTools. https://reactjs.org/link/react-devtools")
        end
        return true
    end
    local success, result = pcall(function() -- Line: 90 -- upvalues: u58 (upval), __REACT_DEVTOOLS_GLOBAL_HOOK__ (val), a1 (val), u59 (upval)
        u58 = __REACT_DEVTOOLS_GLOBAL_HOOK__.inject(a1)
        u59 = __REACT_DEVTOOLS_GLOBAL_HOOK__
    end)
    if not success and _G.__DEV__ then
        console.error("React instrumentation encountered an error: %s.", result)
    end
    return true
end

function v1.onScheduleRoot(a1, a2) -- Line: 106 -- upvalues: u59 (ref), u58 (ref), u60 (ref), console (val)
    if _G.__DEV__ and u59 then
        local v1
        local onScheduleFiberRoot = u59.onScheduleFiberRoot
        if typeof(onScheduleFiberRoot) == "function" then
            v1 = true
        elseif typeof(onScheduleFiberRoot) ~= "table" then
            v1 = false
        else
            local v2 = getmetatable(onScheduleFiberRoot)
            v1 = if not v2 then not not onScheduleFiberRoot._isMockFunction else if not rawget(v2, "__call") then not not onScheduleFiberRoot._isMockFunction else true
        end
        if v1 then
            local success, result = pcall(u59.onScheduleFiberRoot, u58, a1, a2)
            if not success and _G.__DEV__ and not u60 then
                u60 = true
                console.error("React instrumentation encountered an error: %s", result)
            end
        end
    end
end

function v1.onCommitRoot(a1, a2) -- Line: 126
    -- upvalues: u59 (ref), DidCapture (val), enableProfilerTimer (val), u58 (ref), u60 (ref), console (val)
    if u59 then
        local v1
        local onCommitFiberRoot = u59.onCommitFiberRoot
        if typeof(onCommitFiberRoot) == "function" then
            v1 = true
        elseif typeof(onCommitFiberRoot) ~= "table" then
            v1 = false
        else
            local v2 = getmetatable(onCommitFiberRoot)
            v1 = if not v2 then not not onCommitFiberRoot._isMockFunction else if not rawget(v2, "__call") then not not onCommitFiberRoot._isMockFunction else true
        end
        if v1 then
            local success, result = pcall(function() -- Line: 132
                -- upvalues: a1 (val), DidCapture (upval), enableProfilerTimer (upval), u59 (upval), u58 (upval)
                -- upvalues: a2 (val)
                local v1 = (bit32.band(a1.current.flags, DidCapture)) == DidCapture
                if enableProfilerTimer then
                    u59.onCommitFiberRoot(u58, a1, a2, v1)
                    return
                end
                u59.onCommitFiberRoot(u58, a1, nil, v1)
            end)
            if not success and _G.__DEV__ and not u60 then
                u60 = true
                console.error("React instrumentation encountered an error: %s", result)
            end
        end
    end
end

function v1.onCommitUnmount(a1) -- Line: 151 -- upvalues: u59 (ref), u58 (ref), u60 (ref), console (val)
    if u59 then
        local v1
        local onCommitFiberUnmount = u59.onCommitFiberUnmount
        if typeof(onCommitFiberUnmount) == "function" then
            v1 = true
        elseif typeof(onCommitFiberUnmount) ~= "table" then
            v1 = false
        else
            local v2 = getmetatable(onCommitFiberUnmount)
            v1 = if not v2 then not not onCommitFiberUnmount._isMockFunction else if not rawget(v2, "__call") then not not onCommitFiberUnmount._isMockFunction else true
        end
        if v1 then
            local success, result = pcall(u59.onCommitFiberUnmount, u58, a1)
            if not success and _G.__DEV__ and not u60 then
                u60 = true
                console.error("React instrumentation encountered an error: %s", result)
            end
        end
    end
end

return v1