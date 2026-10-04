-- Script path: ReplicatedStorage.DevPackages._Index.jsdotlua_jest-console@3.10.0.jest-console.helpers
-- Decompile time: 2.68 ms

local inspect = require(script.Parent.Parent:WaitForChild("luau-polyfill")).util.inspect
require(script.Parent:WaitForChild("types"))

function concatRestArgs(a1) -- Line: 24
    local v1 = ""
    if #a1 > 0 then
        v1 = " " .. table.concat(a1, " ")
    end
    return v1
end

function getFormattedValue(a1, a2) -- Line: 32 -- upvalues: inspect (val)
    if type(a1) == "string" then
        return a1
    end
    return (inspect(a1, a2))
end

function format(...) -- Line: 36
    return formatter(nil, ...)
end

function formatWithOptions(a1, a2, ...) -- Line: 40
    return formatter(a1, a2, ...)
end

function formatter(a1, a2, ...) -- Line: 44 -- upvalues: inspect (val)
    local v1
    local v2 = {...}
    local v3 = {}
    local v4 = {}
    if type(a2) ~= "string" then
        v1 = inspect(a2, a1)
        for k, v in pairs(v2) do
            table.insert(v4, (getFormattedValue(v, a1)))
        end
    else
        local v5, v6
        _, v6 = a2:gsub("%%[sdj%%]", "")
        for k2, i in pairs(v2) do
            v5 = getFormattedValue(i, a1)
            if not (k2 <= v6) then
                table.insert(v4, v5)
            else
                table.insert(v3, v5)
            end
        end
        v1 = a2
    end
    return (string.format(v1, table.unpack(v3))) .. concatRestArgs(v4)
end

return {format = format, formatWithOptions = formatWithOptions, concatRestArgs = concatRestArgs}