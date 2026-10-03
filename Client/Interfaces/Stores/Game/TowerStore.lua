-- Script path: ReplicatedStorage.Client.Interfaces.Stores.Game.TowerStore
-- Decompile time: 0.69 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Charm = require(ReplicatedStorage.Packages.Charm)
local Signal = require(ReplicatedStorage.Shared.Modules.Signal)
local table = require(ReplicatedStorage.Shared.Modules.Utils.table)
local u23, u24 = Charm.signal({})
local u25 = {}
u25.TowerAdded = Signal.new()
u25.TowerRemoved = Signal.new()
u25.getState = u23

function u25.addTower(a1, a2, a3) -- Line: 21
    -- upvalues: u23 (val), table (val), u24 (val), u25 (val)
    assert(a1, "Tower model is nil")
    local v1 = u23()
    if v1[a1] then
        return
    end
    local v2 = table.clone(v1)
    v2[a1] = a2
    u24(v2)
    u25.TowerAdded:Fire(a3 or a2)
end

function u25.removeTower(a1, a2) -- Line: 35
    -- upvalues: u23 (val), table (val), u24 (val), u25 (val)
    assert(a1, "Tower model is nil")
    local v1 = u23()
    local v2 = v1[a1]
    if not v2 then
        return
    end
    local v3 = table.clone(v1)
    v3[a1] = nil
    u24(v3)
    u25.TowerRemoved:Fire(a2 or v2)
end

return u25