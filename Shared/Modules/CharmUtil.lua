-- Script path: ReplicatedStorage.Shared.Modules.CharmUtil
-- Decompile time: 0.71 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Charm = require(ReplicatedStorage.Packages.Charm)
return {
    set = function(a1, a2, a3) -- Line: 6 -- types: a1: table
        if a1[a2] == a3 then
            return a1
        end
        local v1 = table.clone(a1)
        v1[a2] = a3
        return v1
    end,
    deleteKey = function(a1, a2) -- Line: 17 -- types: a1: table
        if not a1[a2] then
            return a1
        end
        local v1 = table.clone(a1)
        v1[a2] = nil
        return v1
    end,
    merge = function(a1, a2) -- Line: 28 -- types: a1: table, a2: table
        if not next(a2) then
            return a1
        end
        local v1 = table.clone(a1)
        for i, j in a2 do
            v1[i] = j
        end
        return v1
    end,
    watch = function(a1, a2) -- Line: 42 -- upvalues: Charm (val) -- types: a1: function, a2: function
        task.spawn(function() -- Line: 43 -- upvalues: a2 (val), Charm (upval), a1 (val)
            a2(Charm.untracked(a1))
        end)
        return Charm.subscribe(a1, a2)
    end,
}