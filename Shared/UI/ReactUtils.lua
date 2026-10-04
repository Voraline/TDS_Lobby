-- Script path: ReplicatedStorage.Shared.UI.ReactUtils
-- Decompile time: 1.26 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
require(ReplicatedStorage.Shared.UI.ReactTypes)
local table = require(ReplicatedStorage.Shared.Modules.Utils.table)
return {
    isBinding = function(a1) -- Line: 11
        local v1 = false
        if type(a1) == "table" then
            v1 = a1.getValue ~= nil
        end
        return v1
    end,
    mapMultiple = function(a1, a2) -- Line: 23 -- upvalues: React (val) -- types: a1: table, a2: function
        local v1 = a1[1]
        local v2 = false
        if type(v1) == "table" then
            v2 = v1.getValue ~= nil
        end
        if v2 then
            return (React.joinBindings(a1)):map(function(a1) -- Line: 25 -- upvalues: a2 (val)
                return a2(unpack(a1))
            end)
        end
        return a2(unpack(a1))
    end,
    doesEqual = function(a1, a2) -- Line: 33 -- upvalues: table (val) -- types: a1: table, a2: boolean?
        return function(a1_2, a2_2) -- Line: 34 -- upvalues: a1 (val), a2 (val), table (upval) -- types: a1_2: table, a2_2: table
            local v1, v2, v3
            for i, j in a1 do
                v1 = a1_2[j]
                v2 = a2_2[j]
                v3 = typeof(v1)
                if v3 ~= typeof(v2) then
                    return false
                end
                if v3 == "table" then
                    if a2 then
                        return table.deepCompare(v1, v2)
                    end
                    return table.shallowCompare(v1, v2)
                end
                if v1 ~= v2 then
                    return false
                end
            end
            return true
        end
    end,
    map = function(a1, a2) -- Line: 15 -- types: a2: function
        local v1 = false
        if type(a1) == "table" then
            v1 = a1.getValue ~= nil
        end
        if v1 then
            return (a1:map(a2))
        end
        return a2(a1)
    end,
}