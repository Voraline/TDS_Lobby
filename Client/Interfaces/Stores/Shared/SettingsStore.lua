-- Script path: ReplicatedStorage.Client.Interfaces.Stores.Shared.SettingsStore
-- Decompile time: 1.66 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Charm = require(ReplicatedStorage.Packages.Charm)
local SettingsController = require(ReplicatedStorage.Client.Controllers.Shared.SettingsController)
local table = require(ReplicatedStorage.Shared.Modules.Utils.table)
local u24, u25 = Charm.signal({})
local u26 = false
local u27 = {getState = u24}

local function copySettings(a1) -- Line: 24 -- upvalues: table (val) -- types: a1: table?
    if a1 then
        return (table.deepClone(a1))
    end
    return {}
end

function u27.getGameSettings() -- Line: 28 -- upvalues: u24 (val)
    return u24().Game or {}
end

function u27.getUserSettings() -- Line: 32 -- upvalues: u24 (val)
    return u24().User or {}
end

function u27.getGameSetting(a1, a2) -- Line: 36 -- upvalues: u27 (val) -- types: a1: string
    local v1 = u27.getGameSettings()[a1]
    if v1 == nil then
        return a2
    end
    return v1
end

function u27.update(a1, a2, a3) -- Line: 41
    -- upvalues: u24 (val), table (val), u25 (val)
    local v1 = table.deepClone((u24()))
    local v2 = v1[a1]
    if not v2 then
        v1[a1] = {}
    end
    if v2[a2] == a3 and typeof(a3) ~= "table" then
        return
    end
    v2[a2] = if typeof(a3) ~= "table" then a3 else table.deepClone(a3)
    u25(v1)
end

function u27.set(a1, a2) -- Line: 59 -- upvalues: u24 (val), table (val), u25 (val) -- types: a1: string, a2: table
    local v1 = u24()
    local v2 = if not a2 then {} else table.deepClone(a2)
    if v1[a1] and table.deepCompare(v1[a1], v2) then
        return
    end
    u25(table.merge({}, v1, {[a1] = v2}))
end

function u27.setGameSetting(a1, a2) -- Line: 72 -- upvalues: SettingsController (val) -- types: a1: string
    SettingsController.Game:Set(a1, a2)
end

function u27.start() -- Line: 76 -- upvalues: u26 (ref), SettingsController (val), u27 (val)
    local All, set
    if u26 then
        return
    end
    u26 = true
    local v1 = {Game = SettingsController.Game, User = SettingsController.User}
    local v2 = nil
    local v3 = nil
    for i, j in v1, v2, v3 do
        set = u27.set
        All = j:GetAll() or {}
        set(i, All)
        j.Updated:Connect(function(a1, a2) -- Line: 91 -- upvalues: u27 (upval), i (val) -- types: a1: string
            u27.update(i, a1, a2)
        end)
    end
end

u27.start()
return u27