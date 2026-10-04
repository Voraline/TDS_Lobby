-- Script path: ReplicatedStorage.DevPackages._Index.jsdotlua_jest-roblox-shared@3.10.0.jest-roblox-shared.normalizePromiseError
-- Decompile time: 1.14 ms

local Boolean = require(script.Parent.Parent:WaitForChild("luau-polyfill")).Boolean

local function getPromiseErrorStack(a1) -- Line: 20 -- upvalues: Boolean (val)
    local parent = a1
    while not Boolean.toJSBoolean(parent.trace) do
        if not parent.parent then
            break
        end
        parent = parent.parent
    end
    return parent.trace or ""
end

local function getPromiseErrorMessage(a1) -- Line: 28 -- upvalues: Boolean (val)
    local parent = a1
    local error = a1.error
    while not Boolean.toJSBoolean(parent.trace) do
        if not parent.parent then
            break
        end
        parent = parent.parent
        error = parent.error or error
    end
    return parent.message or error
end

return function(a1) -- Line: 38 -- upvalues: getPromiseErrorMessage (val), getPromiseErrorStack (val)
    a1.message = getPromiseErrorMessage(a1)
    a1.stack = getPromiseErrorStack(a1)
    return a1
end