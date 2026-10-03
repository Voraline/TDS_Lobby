-- Script path: ReplicatedStorage.Packages.Fusion.Utility.restrictRead
-- Decompile time: 0.36 ms

local Parent_2 = script.Parent.Parent
local logError = require(Parent_2.Logging.logError)
return function(a1, a2) -- Line: 12 -- upvalues: logError (val) -- types: a1: string, a2: table
    local v1 = getmetatable(a2)
    if v1 == nil then
        setmetatable(a2, {})
    end

    function v1.__index(a1_2, a2) -- Line: 21 -- upvalues: logError (upval), a1 (val)
        logError("strictReadError", nil, tostring(a2), a1)
    end

    return a2
end