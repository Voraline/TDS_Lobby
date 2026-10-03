-- Script path: ReplicatedStorage.Client.Interfaces.Stores.Game.UserTowerStore
-- Decompile time: 1.35 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Cache = require(ReplicatedStorage:WaitForChild("Client").Modules.Cache)
local Charm = require(ReplicatedStorage.Packages.Charm)
local table = require(ReplicatedStorage.Shared.Modules.Utils.table)
local u32, u33 = Charm.signal({
    equipped = {"Scout", "Sniper"},
    inventory = {
        Scout = {Skin = "Default", Equipped = true, GoldenPerks = false},
        Sniper = {Skin = "Default", Equipped = true, GoldenPerks = false},
    },
})
local u34 = {getState = u32}
local u35 = false

function u34.setInventory(a1) -- Line: 41 -- upvalues: u33 (val), table (val), u32 (val) -- types: a1: table
    u33((table.merge({}, u32(), {inventory = a1})))
end

function u34.setEquipped(a1) -- Line: 47 -- upvalues: u33 (val), table (val), u32 (val) -- types: a1: table
    u33((table.merge({}, u32(), {equipped = a1})))
end

local function cacheObserver(a1, a2) -- Line: 53 -- upvalues: Cache (val) -- types: a1: string, a2: function
    local v1 = Cache(a1)
    local u5 = false
    local u10 = v1.Updated:Connect(function(a1) -- Line: 57 -- upvalues: a2 (val)
        a2(a1)
    end)
    ;(v1:Get()):andThen(function(a1) -- Line: 61 -- upvalues: u5 (ref), a2 (val)
        if u5 then
            return
        end
        a2(a1)
    end)
    return function() -- Line: 69 -- upvalues: u5 (ref), u10 (val)
        u5 = true
        u10:Disconnect()
    end
end

function u34.start() -- Line: 75 -- upvalues: u35 (ref), cacheObserver (val), u34 (val)
    if u35 then
        return
    end
    u35 = true
    cacheObserver("Equipped.Troops", function(a1) -- Line: 82 -- upvalues: u34 (upval)
        u34.setEquipped(a1)
    end)
    cacheObserver("Inventory.Troops", function(a1) -- Line: 86 -- upvalues: u34 (upval)
        u34.setInventory(a1)
    end)
end

u34.start()
return u34