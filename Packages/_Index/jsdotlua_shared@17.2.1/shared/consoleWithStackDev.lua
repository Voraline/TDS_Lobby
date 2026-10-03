-- Script path: ReplicatedStorage.Packages._Index.jsdotlua_shared@17.2.1.shared.consoleWithStackDev
-- Decompile time: 0.83 ms

local v1 = require(script.Parent.Parent:WaitForChild("luau-polyfill"))
local console = v1.console
local Array = v1.Array
local ReactSharedInternals = require(script.Parent:WaitForChild("ReactSharedInternals"))
local printWarning = nil
local v2 = {
    warn = function(a1, ...) -- Line: 24 -- upvalues: printWarning (ref)
        if _G.__DEV__ then
            printWarning("warn", a1, {...})
        end
    end,
    error = function(a1, ...) -- Line: 29 -- upvalues: printWarning (ref)
        if _G.__DEV__ then
            printWarning("error", a1, {...})
        end
    end,
}

function printWarning(a1, a2, a3) -- Line: 35 -- upvalues: ReactSharedInternals (val), Array (val), console (val)
    if _G.__DEV__ then
        local v1 = ReactSharedInternals.ReactDebugCurrentFrame.getStackAddendum()
        if v1 ~= "" then
            a2 = a2 .. "%s"
            a3 = Array.slice(a3, 1)
            table.insert(a3, v1)
        end
        local v2 = Array.map(a3, tostring)
        table.insert(v2, 1, "Warning: " .. a2)
        console[a1](unpack(v2))
    end
end

return v2