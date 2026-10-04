-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.NewTowerRange.ExtraRangeRings
-- Decompile time: 5.70 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Troops = require(ReplicatedStorage.Shared.Modules.Asset.Handlers.Troops)
local v1 = {}

local function toNumber(a1) -- Line: 39
    if typeof(a1) == "number" then
        return a1
    end
    return 0
end

local function getTowerName(a1) -- Line: 43
    if not a1 then
        return nil
    end
    local Replicator = a1.Replicator
    local v1 = Replicator and Replicator:Get("Name")
    return a1.Name or a1.TowerName or v1
end

local function getAssetData(a1, a2) -- Line: 54 -- upvalues: Troops (val) -- types: a1: string?
    if not a2 and a1 then
        return Troops(a1)
    end
    return a2
end

local function getDefinitions(a1, a2) -- Line: 62 -- upvalues: Troops (val) -- types: a1: string?
    local v1 = if a2 then a2 else if a1 then Troops(a1) else a2
    local Properties = v1 and v1.Properties
    return Properties and Properties.RangeRings or {}
end

local function readAttributes(a1) -- Line: 69
    return a1 and a1.Attributes
end

local function hasStatusEffect(a1, a2) -- Line: 73 -- types: a2: string
    local StatusEffectRenderer = a1 and a1.StatusEffectRenderer
    return StatusEffectRenderer and StatusEffectRenderer:has(a2) or false
end

local function hasBlockedStatusEffect(a1, a2) -- Line: 78 -- types: a2: table
    local StatusEffectRenderer_2
    local StatusEffectRenderer = a1 and a1.StatusEffectRenderer
    if a2.BlockedStatusTag
        and StatusEffectRenderer
        and StatusEffectRenderer.hasAnyWithTag
        and StatusEffectRenderer:hasAnyWithTag(a2.BlockedStatusTag) then
        return true
    end
    local BlockedStatusEffects = a2.BlockedStatusEffects or {}
    local v1 = nil
    local v2 = nil
    local v3 = a1
    for i, j in BlockedStatusEffects, v1, v2 do
        StatusEffectRenderer_2 = v3 and v3.StatusEffectRenderer
        if StatusEffectRenderer_2 and StatusEffectRenderer_2:has(j) or false then
            return true
        end
    end
    return false
end

local function readDefinitionRadius(a1, a2) -- Line: 98 -- types: a1: table
    if a1.Radius then
        local Radius = a1.Radius
        if typeof(Radius) == "number" then
            return Radius
        end
        return 0
    end
    if not a1.Attribute then
        return 0
    end
    local v1 = a2 and a2[a1.Attribute]
    if typeof(v1) == "number" then
        return v1
    end
    return 0
end

local function readPlacementRadius(a1, a2) -- Line: 110 -- types: a1: table
    local v1
    if a1.ShowOnPlacement == false then
        return 0
    end
    local Stats = a2 and a2.Stats and a2.Stats.Default
    local Defaults = Stats and Stats.Defaults
    local Attributes = Defaults and Defaults.Attributes
    if a1.Radius then
        local Radius = a1.Radius
        v1 = if typeof(Radius) ~= "number" then 0 else Radius
    elseif not a1.Attribute then
        v1 = 0
    else
        local v2 = Attributes and Attributes[a1.Attribute]
        v1 = if typeof(v2) ~= "number" then 0 else v2
    end
    if v1 <= 0 and a1.PlacementUpgrade then
        local Upgrades = Stats and Stats.Upgrades and Stats.Upgrades[a1.PlacementUpgrade]
        local Stats_2 = Upgrades and Upgrades.Stats
        local Attributes_2 = Stats_2 and Stats_2.Attributes
        if a1.Radius then
            local Radius_2 = a1.Radius
            v1 = if typeof(Radius_2) ~= "number" then 0 else Radius_2
        elseif not a1.Attribute then
            v1 = 0
        else
            local v3 = Attributes_2 and Attributes_2[a1.Attribute]
            v1 = if typeof(v3) ~= "number" then 0 else v3
        end
    end
    if v1 <= 0 then
        local PlacementFallback = a1.PlacementFallback
        if typeof(PlacementFallback) == "number" then
            return PlacementFallback
        end
        v1 = 0
    end
    return v1
end

local function createRing(a1, a2) -- Line: 130 -- types: a1: table, a2: number
    if a2 <= 0 then
        return nil
    end
    return {
        Key = a1.Key,
        Color = a1.Color,
        DisableFill = a1.DisableFill,
        FillTransparency = a1.FillTransparency,
        LineOffset = a1.LineOffset,
        LineSize = a1.LineSize,
        LineTransparency = a1.LineTransparency,
        Radius = a2,
        ShowWhenInvalid = a1.ShowWhenInvalid,
        ZIndex = a1.ZIndex,
    }
end

local function resolveRings(a1, a2, a3) -- Line: 149
    -- upvalues: Troops (val), createRing (val)
    local v1
    local v2 = {}
    local v3 = if a2 then a2 else if a1 then Troops(a1) else a2
    local Properties = v3 and v3.Properties
    local RangeRings = Properties and Properties.RangeRings or {}
    local v4 = nil
    local v5 = nil
    for i, j in RangeRings, v4, v5 do
        v1 = createRing(j, a3(j))
        if v1 then
            if not v1.Key then
                v1.Key = ("Ring%*"):format(i)
            end
            table.insert(v2, v1)
        end
    end
    return v2
end

function v1.forPlacement(a1, a2) -- Line: 172
    -- upvalues: Troops (val), resolveRings (val), readPlacementRadius (val)
    local u4 = if a2 then a2 else if a1 then Troops(a1) else a2
    return (resolveRings(a1, u4, function(a1) -- Line: 175 -- upvalues: readPlacementRadius (upval), u4 (val)
        return (readPlacementRadius(a1, u4))
    end))
end

function v1.forTowerEntity(a1, a2) -- Line: 180
    -- upvalues: resolveRings (val), Troops (val), hasBlockedStatusEffect (val)
    local Name
    if a1 then
        local Replicator = a1.Replicator
        local v1 = Replicator and Replicator:Get("Name")
        Name = a1.Name or a1.TowerName or v1
    else
        Name = nil
    end
    local Stats = a1
    if Stats then
        Stats = a1.Stats
        if Stats then
            Stats = a1.Stats.Attributes
        end
    end
    return (resolveRings(Name, if a2 then a2 else if Name then Troops(Name) else a2, function(a1_2) -- Line: 184 -- upvalues: hasBlockedStatusEffect (upval), a1 (val), Stats (val)
        if hasBlockedStatusEffect(a1, a1_2) then
            return 0
        end
        local v1 = Stats
        if a1_2.Radius then
            local Radius = a1_2.Radius
            if typeof(Radius) == "number" then
                return Radius
            end
            return 0
        end
        if not a1_2.Attribute then
            return 0
        end
        local v2 = v1 and v1[a1_2.Attribute]
        if typeof(v2) == "number" then
            return v2
        end
        return 0
    end))
end

function v1.dependsOnAttribute(a1, a2, a3) -- Line: 193 -- upvalues: Troops (val) -- types: a1: string?, a2: string
    local v1 = if a3 then a3 else if a1 then Troops(a1) else a3
    local Properties = v1 and v1.Properties
    for i, j in Properties and Properties.RangeRings or {} do
        if j.Attribute == a2 then
            return true
        end
    end
    return false
end

return v1