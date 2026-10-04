-- Script path: ReplicatedStorage.Client.Interfaces.Stores.Shared.ToolTipKeybindStore
-- Decompile time: 1.60 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local u13, u14 = (require(ReplicatedStorage.Packages.Charm)).signal({binds = {}})
return {
    getState = u13,
    addBinds = function(a1) -- Line: 19 -- upvalues: u13 (val), u14 (val) -- types: a1: table
        local v1 = u13()
        if v1.binds == a1 then
            return
        end
        local v2 = table.clone(v1)
        v2.binds = a1
        u14(v2)
    end,
    removeBind = function(a1) -- Line: 30 -- upvalues: u13 (val), u14 (val)
        local v1 = u13()
        if v1.binds[a1] == nil then
            return
        end
        local v2 = table.clone(v1.binds)
        v2[a1] = nil
        local v3 = table.clone(v1)
        v3.binds = v2
        u14(v3)
    end,
    reset = function() -- Line: 44 -- upvalues: u13 (val), u14 (val)
        if next(u13().binds) == nil then
            return
        end
        u14({binds = {}})
    end,
}