-- Script path: ReplicatedStorage.Client.Interfaces.Stores.Game.PathCursorStore
-- Decompile time: 1.60 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Charm = require(ReplicatedStorage.Packages.Charm)
local table = require(ReplicatedStorage.Shared.Modules.Utils.table)
local u18, u19 = Charm.signal({visible = false, position = Vector3.new(0, 0, 0), size = 4})
return {
    getState = u18,
    setPosition = function(a1) -- Line: 20 -- upvalues: u18 (val), table (val), u19 (val) -- types: a1: vector
        local v1 = u18()
        if v1.position == a1 then
            return
        end
        local v2 = table.clone(v1)
        v2.position = a1
        u19(v2)
    end,
    setSize = function(a1) -- Line: 31 -- upvalues: u18 (val), table (val), u19 (val) -- types: a1: number
        local v1 = u18()
        if v1.size == a1 then
            return
        end
        local v2 = table.clone(v1)
        v2.size = a1
        u19(v2)
    end,
    setVisible = function(a1) -- Line: 42 -- upvalues: u18 (val), table (val), u19 (val) -- types: a1: boolean
        local v1 = u18()
        if v1.visible == a1 then
            return
        end
        local v2 = table.clone(v1)
        v2.visible = a1
        u19(v2)
    end,
}