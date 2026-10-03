-- Script path: ReplicatedStorage.Client.Interfaces.Stores.Shared.ProfilerStore
-- Decompile time: 0.36 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local u12, u13 = (require(ReplicatedStorage.Packages.Charm)).signal({})
return {
    getState = u12,
    update = function(a1, a2) -- Line: 15 -- upvalues: u12 (val), u13 (val) -- types: a1: string, a2: table
        local v1 = u12()
        if v1[a1] == a2 then
            return
        end
        local v2 = table.clone(v1)
        v2[a1] = a2
        u13(v2)
    end,
}