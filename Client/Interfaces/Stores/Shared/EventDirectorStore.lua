-- Script path: ReplicatedStorage.Client.Interfaces.Stores.Shared.EventDirectorStore
-- Decompile time: 0.57 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local u12, u13 = (require(ReplicatedStorage.Packages.Charm)).signal({available = false, open = false})
return {
    getState = u12,
    setAvailable = function(a1) -- Line: 21 -- upvalues: u12 (val), u13 (val) -- types: a1: boolean
        local v1 = u12()
        if v1.available == a1 then
            return
        end
        local v2 = table.clone(v1)
        v2.available = a1
        u13(v2)
    end,
    setOpen = function(a1) -- Line: 32 -- upvalues: u12 (val), u13 (val) -- types: a1: boolean
        local v1 = u12()
        if v1.open == a1 then
            return
        end
        local v2 = table.clone(v1)
        v2.open = a1
        u13(v2)
    end,
    toggle = function() -- Line: 43 -- upvalues: u12 (val), u13 (val)
        local v1 = u12()
        local v2 = table.clone(v1)
        v2.open = not v1.open
        u13(v2)
    end,
}