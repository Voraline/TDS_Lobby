-- Script path: ReplicatedStorage.DevPackages._Index.jsdotlua_jest-matcher-utils@3.10.0.jest-matcher-utils.Replaceable
-- Decompile time: 0.71 ms

local getType = require(script.Parent.Parent:WaitForChild("jest-get-type")).getType
local u10 = {}
u10.__index = u10

function u10.new(a1) -- Line: 16 -- upvalues: getType (val), u10 (val)
    local v1 = {object = a1, type = getType(a1)}
    if v1.type ~= "table" then
        error("Type " .. v1.type .. " is not supported in Replaceable!")
    end
    setmetatable(v1, u10)
    return v1
end

function u10.isReplaceable(a1, a2) -- Line: 30 -- upvalues: getType (val)
    local v1 = getType(a1)
    local v2 = false
    if v1 == (getType(a2)) then
        v2 = v1 == "table"
    end
    return v2
end

function u10.forEach(a1, a2) -- Line: 37 -- types: a1: table, a2: function
    for k, v in pairs(a1.object) do
        a2(v, k, a1.object)
    end
end

function u10.get(a1, a2) -- Line: 43
    return a1.object[a2]
end

function u10.set(a1, a2, a3) -- Line: 47
    a1.object[a2] = a3
end

return u10