-- Script path: ReplicatedStorage.Packages.Sift.Dictionary.filter
-- Decompile time: 0.40 ms

local Parent_2 = script.Parent.Parent
local Util = require(Parent_2.Util)
return function(a1, a2) -- Line: 24 -- upvalues: Util (val) -- types: a1: table, a2: function?
    local v1 = {}
    if type(a2) ~= "function" then
        a2 = Util.func.truthy
    end
    for k, v in pairs(a1) do
        if a2(v, k, a1) then
            v1[k] = v
        end
    end
    return v1
end