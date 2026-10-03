-- Script path: ReplicatedStorage.Client.Interfaces.Stores.Shared.NewTooltipStore
-- Decompile time: 0.49 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local u12, u13 = (require(ReplicatedStorage.Packages.Charm)).signal({})
return {
    getState = u12,
    addOrUpdate = function(a1) -- Line: 24 -- upvalues: u12 (val), u13 (val) -- types: a1: table
        local v1 = u12()
        if v1[a1.name] == a1 then
            return
        end
        local v2 = table.clone(v1)
        v2[a1.name] = a1
        u13(v2)
    end,
    remove = function(a1) -- Line: 35 -- upvalues: u12 (val), u13 (val) -- types: a1: string
        local v1 = u12()
        if v1[a1] == nil then
            return
        end
        local v2 = table.clone(v1)
        v2[a1] = nil
        u13(v2)
    end,
}