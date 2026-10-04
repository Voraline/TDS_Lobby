-- Script path: ReplicatedStorage.Client.Interfaces.Stores.Game.UpgradeViewSelector
-- Decompile time: 2.33 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local table = require(ReplicatedStorage.Shared.Modules.Utils.table)
local v1 = {}
local u12 = {
    "model",
    "tower",
    "enabled",
    "disabled",
    "level",
    "towerDisplayName",
    "golden",
    "damage",
    "spent",
    "target",
    "ammo",
    "maxAmmo",
    "ownerName",
    "locked",
    "path",
    "valid",
}

local function shallowCompareValues(a1, a2) -- Line: 26 -- upvalues: table (val)
    if a1 == a2 then
        return true
    end
    if typeof(a1) == "table" and typeof(a2) == "table" then
        return table.shallowCompare(a1, a2)
    end
    return false
end

local function deepCompareValues(a1, a2) -- Line: 38 -- upvalues: table (val)
    if a1 == a2 then
        return true
    end
    if typeof(a1) == "table" and typeof(a2) == "table" then
        return table.deepCompare(a1, a2)
    end
    return false
end

function v1.select(a1) -- Line: 50
    return {
        model = a1.model,
        tower = a1.tower,
        enabled = a1.enabled,
        disabled = a1.disabled,
        level = a1.level,
        towerDisplayName = a1.towerDisplayName,
        golden = a1.golden,
        damage = a1.damage,
        spent = a1.spent,
        target = a1.target,
        ammo = a1.ammo,
        maxAmmo = a1.maxAmmo,
        ownerName = a1.ownerName,
        buffs = a1.buffs,
        options = a1.options,
        locked = a1.locked,
        path = a1.path,
        valid = a1.valid,
    }
end

function v1.isEqual(a1, a2) -- Line: 73 -- upvalues: u12 (val), table (val)
    for i, j in u12 do
        if a1[j] ~= a2[j] then
            return false
        end
    end
    local buffs = a1.buffs
    local buffs_2 = a2.buffs
    if not (if buffs ~= buffs_2 then if typeof(buffs) ~= "table" then false else if typeof(buffs_2) == "table" then table.shallowCompare(buffs, buffs_2) else false else true) then
        return false
    end
    local options = a1.options
    local options_2 = a2.options
    if not (if options ~= options_2 then if typeof(options) ~= "table" then false else if typeof(options_2) == "table" then table.deepCompare(options, options_2) else false else true) then
        return false
    end
    return true
end

return v1