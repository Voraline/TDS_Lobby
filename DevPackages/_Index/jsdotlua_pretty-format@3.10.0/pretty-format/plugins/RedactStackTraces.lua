-- Script path: ReplicatedStorage.DevPackages._Index.jsdotlua_pretty-format@3.10.0.pretty-format.plugins.RedactStackTraces
-- Decompile time: 1.02 ms

local getType = require(script.Parent.Parent.Parent:WaitForChild("jest-get-type")).getType
local redactStackTrace = require(script.Parent.Parent.Parent:WaitForChild("jest-roblox-shared")).redactStackTrace
require(script.Parent.Parent:WaitForChild("Types"))
local u31 = {}

function u31.serialize(a1, a2, a3, a4, a5, a6) -- Line: 29
    -- upvalues: getType (val), u31 (val), redactStackTrace (val)
    local v1
    local v2 = a4 + 1
    local v3 = getType(a1)
    if v3 == "string" then
        v1 = table.clone(a2)
        v1.plugins = table.clone(v1.plugins)
        table.remove(v1.plugins, table.find(v1.plugins, u31))
        local v4 = a6(a1, v1, a3, v2, a5)
        if a2.redactStackTracesInStrings then
            v4 = redactStackTrace(v4)
        end
        return v4
    end
    if v3 ~= "error" then
        error("not supported")
        return
    end
    v1 = table.clone(a2)
    v1.plugins = table.clone(v1.plugins)
    table.remove(v1.plugins, table.find(v1.plugins, u31))
    return (redactStackTrace((a6(a1, v1, a3, v2, a5))))
end

function u31.test(a1) -- Line: 59 -- upvalues: getType (val)
    local v1 = getType(a1)
    local v2 = true
    if v1 ~= "error" then
        v2 = v1 == "string"
    end
    return v2
end

return u31