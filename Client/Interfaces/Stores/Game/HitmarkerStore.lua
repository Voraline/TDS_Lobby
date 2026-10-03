-- Script path: ReplicatedStorage.Client.Interfaces.Stores.Game.HitmarkerStore
-- Decompile time: 0.47 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local u12, u13 = (require(ReplicatedStorage.Packages.Charm)).signal({})
return {
    getState = u12,
    add = function(a1) -- Line: 14 -- upvalues: u12 (val), u13 (val)
        local v1 = u12()
        if v1[a1] then
            return
        end
        local v2 = table.clone(v1)
        v2[a1] = true
        u13(v2)
    end,
    remove = function(a1) -- Line: 25 -- upvalues: u12 (val), u13 (val)
        local v1 = u12()
        if v1[a1] == nil then
            return
        end
        local v2 = table.clone(v1)
        v2[a1] = nil
        u13(v2)
    end,
}