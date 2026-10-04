-- Script path: ReplicatedStorage.Client.Interfaces.Stores.Game.UpgradesStore
-- Decompile time: 26.48 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Charm = require(ReplicatedStorage.Packages.Charm)
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
local Signal = require(ReplicatedStorage.Shared.Modules.Signal)
local table = require(ReplicatedStorage.Shared.Modules.Utils.table)
local u25 = {
    level = 0,
    tower = "Scout",
    golden = false,
    valid = false,
    showBoundaries = false,
    figure8 = false,
    range = 0,
    boundary = 0,
    deadzone = 0,
    buildzone = 0,
    damage = 0,
    spent = 0,
    ammo = 0,
    maxAmmo = 0,
    unitsChanged = -1,
    enabled = false,
    disabled = false,
    locked = false,
    globalOptionsStart = 0,
    globalOptionsCoolDown = 0,
    globalOptionsSync = 0,
    extraRings = {},
    units = {},
    buffs = {},
    options = {},
    target = Enum.TargetingMode.First,
}
local u34, u35 = Charm.signal(u25)
local u36 = 0
local u37 = nil
local v1 = {
    Target = Signal.new(),
    UpdateOption = Signal.new(),
    Sell = Signal.new(),
    Upgrade = Signal.new(),
    getState = u34,
}

local function areValuesEqual(a1, a2) -- Line: 58 -- upvalues: table (val)
    if a1 == a2 then
        return true
    end
    if typeof(a1) == "table" and typeof(a2) == "table" then
        return table.deepCompare(a1, a2)
    end
    return false
end

local function areStatesEqual(a1, a2) -- Line: 70 -- upvalues: table (val)
    local v1
    local v2 = nil
    local v3 = nil
    local v4, v5 = a2, a1
    for i, j in a1, v2, v3 do
        v1 = v4[i]
        if not (if j ~= v1 then if typeof(j) ~= "table" then false else if typeof(v1) ~= "table" then false else table.deepCompare(j, v1) else true) then
            return false
        end
    end
    v2 = nil
    v3 = nil
    for k, n in v4, v2, v3 do
        v1 = v5[k]
        if not (if n ~= v1 then if typeof(n) ~= "table" then false else if typeof(v1) ~= "table" then false else table.deepCompare(n, v1) else true) then
            return false
        end
    end
    return true
end

local function publishStateIfChanged(a1) -- Line: 86 -- upvalues: areStatesEqual (val), u34 (val), u35 (val)
    if areStatesEqual(u34(), a1) then
        return false
    end
    u35(a1)
    return true
end

local function getWorkingState() -- Line: 95 -- upvalues: u37 (ref), u34 (val)
    return u37 or u34()
end

local function setStateIfChanged(a1) -- Line: 99
    -- upvalues: u36 (ref), areStatesEqual (val), u37 (ref), u34 (val), u35 (val)
    if u36 > 0 then
        if areStatesEqual(u37 or u34(), a1) then
            return false
        end
        u37 = a1
        return true
    end
    if areStatesEqual(u34(), a1) then
        return false
    end
    u35(a1)
    return true
end

local function flushPendingState() -- Line: 112 -- upvalues: u37 (ref), areStatesEqual (val), u34 (val), u35 (val)
    local v1 = u37
    u37 = nil
    if not v1 or areStatesEqual(u34(), v1) then
        return false
    end
    u35(v1)
    return true
end

function v1.batch(a1) -- Line: 123 -- upvalues: u36 (ref), u37 (ref), areStatesEqual (val), u34 (val), u35 (val)
    u36 = u36 + 1
    local success, result = pcall(a1)
    u36 = u36 - 1
    if not success then
        if u36 == 0 then
            u37 = nil
        end
        error(result, 2)
    end
    if u36 == 0 then
        local v1 = u37
        u37 = nil
        if not v1 or areStatesEqual(u34(), v1) then
            return result
        end
        u35(v1)
    end
    return result
end

function v1.reset() -- Line: 144
    -- upvalues: table (val), u25 (val), u37 (ref), u34 (val), u36 (ref), areStatesEqual (val), u35 (val)
    local v1 = table.merge({}, u25, {disabled = (u37 or u34()).disabled})
    if u36 > 0 then
        if areStatesEqual(u37 or u34(), v1) then
            return
        end
        u37 = v1
        return
    end
    if areStatesEqual(u34(), v1) then
        return
    end
    u35(v1)
end

function v1.setLocked(a1) -- Line: 150
    -- upvalues: table (val), u37 (ref), u34 (val), u36 (ref), areStatesEqual (val), u35 (val)
    local v1 = {locked = a1}
    local v2 = table.merge({}, u37 or u34(), v1)
    if u36 > 0 then
        if areStatesEqual(u37 or u34(), v2) then
            return
        end
        u37 = v2
        return
    end
    if areStatesEqual(u34(), v2) then
        return
    end
    u35(v2)
end

function v1.setDisabled(a1) -- Line: 156
    -- upvalues: table (val), u37 (ref), u34 (val), u36 (ref), areStatesEqual (val), u35 (val)
    local v1 = {disabled = a1}
    local v2 = table.merge({}, u37 or u34(), v1)
    if u36 > 0 then
        if areStatesEqual(u37 or u34(), v2) then
            return
        end
        u37 = v2
        return
    end
    if areStatesEqual(u34(), v2) then
        return
    end
    u35(v2)
end

function v1.setFigure8Enabled(a1) -- Line: 162
    -- upvalues: table (val), u37 (ref), u34 (val), u36 (ref), areStatesEqual (val), u35 (val)
    local v1 = {figure8 = a1}
    local v2 = table.merge({}, u37 or u34(), v1)
    if u36 > 0 then
        if areStatesEqual(u37 or u34(), v2) then
            return
        end
        u37 = v2
        return
    end
    if areStatesEqual(u34(), v2) then
        return
    end
    u35(v2)
end

function v1.addUnit(a1) -- Line: 168
    -- upvalues: u37 (ref), u34 (val), table (val), u36 (ref), areStatesEqual (val), u35 (val)
    local v1 = u37 or u34()
    local v2 = nil
    for i, v in ipairs(v1.units) do
        if v.id == a1.id then
            v2 = i
            break
        end
    end
    local v3 = {
        id = a1.id,
        icon = a1.icon,
        interval = a1.interval,
        started = a1.started,
    }
    local v4 = table.clone(v1.units)
    local unitsChanged = v1.unitsChanged
    if not v2 then
        unitsChanged = unitsChanged + 1
        table.insert(v4, v3)
    else
        v4[v2] = v3
    end
    local v5 = table.merge({}, v1, {units = v4, unitsChanged = unitsChanged})
    if u36 > 0 then
        if areStatesEqual(u37 or u34(), v5) then
            return
        end
        u37 = v5
        return
    end
    if areStatesEqual(u34(), v5) then
        return
    end
    u35(v5)
end

function v1.removeUnit(a1) -- Line: 207
    -- upvalues: u37 (ref), u34 (val), table (val), u36 (ref), areStatesEqual (val), u35 (val)
    local v1 = u37 or u34()
    local v2 = table.clone(v1.units)
    local v3 = false
    for i, v in ipairs(v2) do
        if v.id == a1 then
            v3 = true
            table.remove(v2, i)
            break
        end
    end
    if v3 then
        local v4 = table.merge({}, v1, {units = v2, unitsChanged = v1.unitsChanged + 1})
        if u36 > 0 then
            if areStatesEqual(u37 or u34(), v4) then
                return
            end
            u37 = v4
            return
        end
        if areStatesEqual(u34(), v4) then
            return
        end
        u35(v4)
    end
end

function v1.updateTowerOptions(a1) -- Line: 228
    -- upvalues: u37 (ref), u34 (val), table (val), u36 (ref), areStatesEqual (val), u35 (val)
    local v1, v2
    local v3 = u37 or u34()
    local v4 = table.merge({}, v3.options)
    local v5 = false
    for i, j in v4 do
        v2 = a1[j.Name]
        if v2 ~= nil then
            v1 = table.merge({}, j)
            v1.Selected = v2
            v4[i] = v1
            v5 = true
        end
    end
    if not v5 then
        return
    end
    local v6 = table.merge({}, v3, {options = v4})
    if u36 > 0 then
        if areStatesEqual(u37 or u34(), v6) then
            return
        end
        u37 = v6
        return
    end
    if areStatesEqual(u34(), v6) then
        return
    end
    u35(v6)
end

function v1.updateGlobalOptions(a1) -- Line: 255
    -- upvalues: table (val), u37 (ref), u34 (val), u36 (ref), areStatesEqual (val), u35 (val)
    local v1 = {globalOptionsCoolDown = a1}
    local v2 = table.merge({}, u37 or u34(), v1)
    if u36 > 0 then
        if areStatesEqual(u37 or u34(), v2) then
            return
        end
        u37 = v2
        return
    end
    if areStatesEqual(u34(), v2) then
        return
    end
    u35(v2)
end

function v1.updateGlobalOptionsStart(a1) -- Line: 261
    -- upvalues: table (val), u37 (ref), u34 (val), u36 (ref), areStatesEqual (val), u35 (val)
    local v1 = {globalOptionsStart = a1}
    local v2 = table.merge({}, u37 or u34(), v1)
    if u36 > 0 then
        if areStatesEqual(u37 or u34(), v2) then
            return
        end
        u37 = v2
        return
    end
    if areStatesEqual(u34(), v2) then
        return
    end
    u35(v2)
end

function v1.updateGlobalOptionsSync(a1) -- Line: 267
    -- upvalues: table (val), u37 (ref), u34 (val), u36 (ref), areStatesEqual (val), u35 (val)
    local v1 = {globalOptionsSync = a1}
    local v2 = table.merge({}, u37 or u34(), v1)
    if u36 > 0 then
        if areStatesEqual(u37 or u34(), v2) then
            return
        end
        u37 = v2
        return
    end
    if areStatesEqual(u34(), v2) then
        return
    end
    u35(v2)
end

function v1.updateTower(a1) -- Line: 273
    -- upvalues: u37 (ref), u34 (val), table (val), u25 (val), Enum (val), u36 (ref), areStatesEqual (val), u35 (val)
    local v1
    local v2 = u37 or u34()
    local v3 = 0
    if a1.model then
        v1 = a1.model:GetExtentsSize() / 2
        v3 = math.max(v1.X, v1.Z) + 0.2
    end
    local merge = table.merge
    local v4 = {level = a1.level, tower = a1.tower}
    local towerDisplayName = a1.towerDisplayName or a1.tower
    v4.towerDisplayName = towerDisplayName
    v4.valid = a1.valid
    local path = a1.path or v2.path
    v4.path = path
    v4.golden = a1.golden or false
    v4.flightRange = a1.flightRange or nil
    local extraRings = a1.extraRings or {}
    v4.extraRings = extraRings
    v4.showBoundaries = a1.showBoundaries or false
    v4.figure8 = a1.figure8 or false
    v4.range = a1.range or 0
    v4.boundary = a1.boundary or v3
    v4.deadzone = a1.deadzone or 0
    v4.buildzone = a1.buildzone or 0
    v4.damage = a1.damage or 0
    v4.spent = a1.spent or 0
    v4.ammo = a1.ammo or 0
    v4.maxAmmo = a1.maxAmmo or 0
    local units = a1.units or {}
    v4.units = units
    v4.unitsChanged = a1.unitsChanged or -1
    local buffs = a1.buffs or {}
    v4.buffs = buffs
    local options = a1.options or {}
    v4.options = options
    v4.targetModel = a1.targetModel or nil
    v4.ownerName = a1.ownerName
    local target = a1.target or Enum.TargetingMode.First
    v4.target = target
    v4.enabled = a1.enabled
    v4.model = a1.model
    v4.disabled = v2.disabled
    v4.locked = a1.locked or false
    v4.globalOptionsCoolDown = a1.globalOptionsCoolDown
    v4.globalOptionsStart = a1.globalOptionsStart
    v4.globalOptionsSync = a1.globalOptionsSync
    v1 = merge({}, u25, v4)
    if u36 > 0 then
        if areStatesEqual(u37 or u34(), v1) then
            return
        end
        u37 = v1
        return
    end
    if areStatesEqual(u34(), v1) then
        return
    end
    u35(v1)
end

function v1.updateBuff(a1, a2) -- Line: 317
    -- upvalues: u37 (ref), u34 (val), table (val), u36 (ref), areStatesEqual (val), u35 (val)
    local v1 = u37 or u34()
    local v2 = table.merge({}, v1.buffs)
    v2[a1] = a2
    local v3 = table.merge({}, v1, {buffs = v2})
    if u36 > 0 then
        if areStatesEqual(u37 or u34(), v3) then
            return
        end
        u37 = v3
        return
    end
    if areStatesEqual(u34(), v3) then
        return
    end
    u35(v3)
end

function v1.updateLevel(a1) -- Line: 327
    -- upvalues: u37 (ref), u34 (val), table (val), u36 (ref), areStatesEqual (val), u35 (val)
    local v1 = u37 or u34()
    local v2 = table.merge({}, v1, {level = a1 or v1.level or 0})
    if u36 > 0 then
        if areStatesEqual(u37 or u34(), v2) then
            return
        end
        u37 = v2
        return
    end
    if areStatesEqual(u34(), v2) then
        return
    end
    u35(v2)
end

function v1.updateValid(a1, a2) -- Line: 334
    -- upvalues: u37 (ref), u34 (val), table (val), u36 (ref), areStatesEqual (val), u35 (val)
    local v1 = u37 or u34()
    if a1 ~= v1.model then
        return
    end
    local v2 = table.merge({}, v1, {valid = a2})
    if u36 > 0 then
        if areStatesEqual(u37 or u34(), v2) then
            return
        end
        u37 = v2
        return
    end
    if areStatesEqual(u34(), v2) then
        return
    end
    u35(v2)
end

function v1.updateVisibility(a1) -- Line: 345
    -- upvalues: table (val), u37 (ref), u34 (val), u36 (ref), areStatesEqual (val), u35 (val)
    local v1 = {enabled = a1}
    local v2 = table.merge({}, u37 or u34(), v1)
    if u36 > 0 then
        if areStatesEqual(u37 or u34(), v2) then
            return
        end
        u37 = v2
        return
    end
    if areStatesEqual(u34(), v2) then
        return
    end
    u35(v2)
end

function v1.updateZone(a1) -- Line: 351
    -- upvalues: u37 (ref), u34 (val), table (val), u36 (ref), areStatesEqual (val), u35 (val)
    local v1 = u37 or u34()
    local merge = table.merge
    local v2 = {}
    local range = a1.range or v1.range
    v2.range = range
    local boundary = a1.boundary or v1.boundary
    v2.boundary = boundary
    local deadzone = a1.deadzone or v1.deadzone
    v2.deadzone = deadzone
    local buildzone = a1.buildzone or v1.buildzone
    v2.buildzone = buildzone
    local flightRange = a1.flightRange or v1.flightRange
    v2.flightRange = flightRange
    local extraRings = if a1.extraRings == nil then v1.extraRings else a1.extraRings
    v2.extraRings = extraRings
    local v3 = merge({}, v1, v2)
    if u36 > 0 then
        if areStatesEqual(u37 or u34(), v3) then
            return
        end
        u37 = v3
        return
    end
    if areStatesEqual(u34(), v3) then
        return
    end
    u35(v3)
end

function v1.updateStats(a1) -- Line: 363
    -- upvalues: u37 (ref), u34 (val), table (val), u36 (ref), areStatesEqual (val), u35 (val)
    local v1 = u37 or u34()
    local merge = table.merge
    local v2 = {}
    local spent = a1.spent or v1.spent
    v2.spent = spent
    local damage = a1.damage or v1.damage
    v2.damage = damage
    local ammo = a1.ammo or v1.ammo
    v2.ammo = ammo
    local maxAmmo = a1.maxAmmo or v1.maxAmmo
    v2.maxAmmo = maxAmmo
    local v3 = merge({}, v1, v2)
    if u36 > 0 then
        if areStatesEqual(u37 or u34(), v3) then
            return
        end
        u37 = v3
        return
    end
    if areStatesEqual(u34(), v3) then
        return
    end
    u35(v3)
end

function v1.updateTargettedEnemy(a1) -- Line: 373
    -- upvalues: table (val), u37 (ref), u34 (val), u36 (ref), areStatesEqual (val), u35 (val)
    local v1 = {targetModel = a1 or nil}
    local v2 = table.merge({}, u37 or u34(), v1)
    if u36 > 0 then
        if areStatesEqual(u37 or u34(), v2) then
            return
        end
        u37 = v2
        return
    end
    if areStatesEqual(u34(), v2) then
        return
    end
    u35(v2)
end

function v1.updateOwner(a1) -- Line: 379
    -- upvalues: table (val), u37 (ref), u34 (val), u36 (ref), areStatesEqual (val), u35 (val)
    local v1 = {ownerName = a1}
    local v2 = table.merge({}, u37 or u34(), v1)
    if u36 > 0 then
        if areStatesEqual(u37 or u34(), v2) then
            return
        end
        u37 = v2
        return
    end
    if areStatesEqual(u34(), v2) then
        return
    end
    u35(v2)
end

function v1.updateTowerDisplayName(a1) -- Line: 385
    -- upvalues: u37 (ref), u34 (val), table (val), u36 (ref), areStatesEqual (val), u35 (val)
    local v1 = u37 or u34()
    local v2 = table.merge({}, v1, {towerDisplayName = a1 or v1.tower})
    if u36 > 0 then
        if areStatesEqual(u37 or u34(), v2) then
            return
        end
        u37 = v2
        return
    end
    if areStatesEqual(u34(), v2) then
        return
    end
    u35(v2)
end

function v1.updateUnits(a1) -- Line: 392
    -- upvalues: u37 (ref), u34 (val), table (val), u36 (ref), areStatesEqual (val), u35 (val)
    local v1 = u37 or u34()
    local units = a1 or v1.units
    local units_2 = v1.units
    if if units_2 ~= units then if typeof(units_2) ~= "table" then false else if typeof(units) ~= "table" then false else table.deepCompare(units_2, units) else true then
        return
    end
    local v2 = table.merge({}, v1, {units = units, unitsChanged = v1.unitsChanged + 1})
    if u36 > 0 then
        if areStatesEqual(u37 or u34(), v2) then
            return
        end
        u37 = v2
        return
    end
    if areStatesEqual(u34(), v2) then
        return
    end
    u35(v2)
end

function v1.updateTarget(a1) -- Line: 405
    -- upvalues: table (val), u37 (ref), u34 (val), Enum (val), u36 (ref), areStatesEqual (val), u35 (val)
    local merge = table.merge
    local v1 = {target = a1 or Enum.TargetingMode.First}
    local v2 = merge({}, u37 or u34(), v1)
    if u36 > 0 then
        if areStatesEqual(u37 or u34(), v2) then
            return
        end
        u37 = v2
        return
    end
    if areStatesEqual(u34(), v2) then
        return
    end
    u35(v2)
end

function v1.updateFlightRange(a1) -- Line: 411
    -- upvalues: table (val), u37 (ref), u34 (val), u36 (ref), areStatesEqual (val), u35 (val)
    local v1 = {flightRange = a1 or nil}
    local v2 = table.merge({}, u37 or u34(), v1)
    if u36 > 0 then
        if areStatesEqual(u37 or u34(), v2) then
            return
        end
        u37 = v2
        return
    end
    if areStatesEqual(u34(), v2) then
        return
    end
    u35(v2)
end

function v1.updatePath(a1) -- Line: 417
    -- upvalues: table (val), u37 (ref), u34 (val), u36 (ref), areStatesEqual (val), u35 (val)
    local v1 = {path = a1 or nil}
    local v2 = table.merge({}, u37 or u34(), v1)
    if u36 > 0 then
        if areStatesEqual(u37 or u34(), v2) then
            return
        end
        u37 = v2
        return
    end
    if areStatesEqual(u34(), v2) then
        return
    end
    u35(v2)
end

return v1