-- Script path: ReplicatedStorage.Client.Interfaces.Game.Views.Range
-- Decompile time: 69.15 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local NewTowerRange = require(ReplicatedStorage.Client.Interfaces.Game.Components.NewTowerRange)
local ReplicatedTowerRange = require(ReplicatedStorage.Client.Interfaces.Game.Components.ReplicatedTowerRange)
local useGameStateValue = require(ReplicatedStorage.Client.Interfaces.Hooks.useGameStateValue)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
local SettingsStore = require(ReplicatedStorage.Client.Interfaces.Stores.Shared.SettingsStore)
local UpgradesStore = require(ReplicatedStorage.Client.Interfaces.Stores.Game.UpgradesStore)
local useCharmSelector = require(ReplicatedStorage.Client.Interfaces.Hooks.useCharmSelector)
local useInGameTowers = require(ReplicatedStorage.Client.Interfaces.Hooks.useInGameTowers)
local useUnits = require(ReplicatedStorage.Client.Interfaces.Hooks.useUnits)
local useUserSetting = require(ReplicatedStorage.Client.Interfaces.Hooks.useUserSetting)
local React = require(ReplicatedStorage.Shared.UI.React)
local createElement = React.createElement
local useMemo = React.useMemo
local Asset = require(ReplicatedStorage.Shared.Modules.Asset)
local SharedGameConstants = require(ReplicatedStorage.Shared.Modules.SharedGameConstants)
local u85 = {}

local function isRangeTarget(a1) -- Line: 29
    local v1 = false
    if typeof(a1) == "Instance" then
        v1 = a1:IsA("BasePart") or a1:IsA("Attachment")
    end
    return v1
end

local function addWatchField(a1, a2) -- Line: 33 -- types: a1: table
    if typeof(a2) == "string" then
        a1[a2] = true
    end
end

local function getRangeProviderTowerFields(a1) -- Line: 39 -- types: a1: table
    local Attribute, ProviderAttribute, ProviderProximityAttribute, ProviderProximityProviderAttribute
    if next(a1) == nil then
        return nil
    end
    local v1 = {}
    local v2 = nil
    local v3 = nil
    for i, j in a1, v2, v3 do
        Attribute = j.Attribute
        if typeof(Attribute) == "string" then
            v1[Attribute] = true
        end
        ProviderAttribute = j.ProviderAttribute
        if typeof(ProviderAttribute) == "string" then
            v1[ProviderAttribute] = true
        end
        ProviderProximityAttribute = j.ProviderProximityAttribute
        if typeof(ProviderProximityAttribute) == "string" then
            v1[ProviderProximityAttribute] = true
        end
        ProviderProximityProviderAttribute = j.ProviderProximityProviderAttribute
        if typeof(ProviderProximityProviderAttribute) == "string" then
            v1[ProviderProximityProviderAttribute] = true
        end
    end
    local v4 = {
        Range = true,
        RangeBuff = true,
        ScaredBuff = true,
        StatusEffects = true,
        Upgrade = true,
    }
    if next(v1) ~= nil then
        v4.Attributes = v1
    end
    return v4
end

local function getRangeTarget(a1) -- Line: 67 -- types: a1: userdata
    local HeightOffset = a1:FindFirstChild("HeightOffset")
    local v1 = false
    if typeof(HeightOffset) == "Instance" then
        v1 = HeightOffset:IsA("BasePart") or HeightOffset:IsA("Attachment")
    end
    if v1 then
        return HeightOffset
    end
    local PrimaryPart = a1.PrimaryPart
    if not PrimaryPart then
        return nil
    end
    local HeightOffset_2 = PrimaryPart:FindFirstChild("HeightOffset")
    local v2 = false
    if typeof(HeightOffset_2) == "Instance" then
        v2 = HeightOffset_2:IsA("BasePart") or HeightOffset_2:IsA("Attachment")
    end
    if v2 then
        return HeightOffset_2
    end
    return PrimaryPart
end

local function getRangeTargetPosition(a1) -- Line: 86
    if a1:IsA("Attachment") then
        return a1.WorldPosition
    end
    if a1:IsA("BasePart") then
        return a1.Position
    end
    return nil
end

local function getTowerPosition(a1) -- Line: 98
    local Model = a1 and a1.Model
    if Model and Model.Parent then
        local v1
        local HeightOffset = Model:FindFirstChild("HeightOffset")
        local v2 = false
        if typeof(HeightOffset) == "Instance" then
            v2 = HeightOffset:IsA("BasePart") or HeightOffset:IsA("Attachment")
        end
        if not v2 then
            local PrimaryPart = Model.PrimaryPart
            if PrimaryPart then
                local HeightOffset_2 = PrimaryPart:FindFirstChild("HeightOffset")
                local v3 = false
                if typeof(HeightOffset_2) == "Instance" then
                    v3 = HeightOffset_2:IsA("BasePart") or HeightOffset_2:IsA("Attachment")
                end
                v1 = if not v3 then PrimaryPart else HeightOffset_2
            else
                v1 = nil
            end
        else
            v1 = HeightOffset
        end
        return v1 and (if not v1:IsA("Attachment") then if not v1:IsA("BasePart") then nil else v1.Position else v1.WorldPosition) or Model:GetPivot().Position
    end
    return nil
end

local function planarDistanceSquared(a1, a2) -- Line: 108 -- types: a1: vector, a2: vector
    local v1 = a1.X - a2.X
    local v2 = a1.Z - a2.Z
    return v1 * v1 + v2 * v2
end

local function getTowerValue(a1, a2) -- Line: 115 -- types: a2: string
    if not a1 then
        return nil
    end
    if a1[a2] ~= nil then
        return a1[a2]
    end
    if a1.State and a1.State[a2] ~= nil then
        return a1.State[a2]
    end
    if a1.Replicator then
        return a1.Replicator:Get(a2)
    end
    return nil
end

local function getTowerUID(a1) -- Line: 135
    local UID = if a1 then if a1.UID == nil then if not a1.State then if not a1.Replicator then nil else a1.Replicator:Get("UID") else if a1.State.UID == nil then if not a1.Replicator then nil else a1.Replicator:Get("UID") else a1.State.UID else a1.UID else nil
    if UID ~= nil then
        return (tostring(UID))
    end
    return (tostring(a1))
end

local function getTowerName(a1) -- Line: 140
    return (if a1 then if a1.Name == nil then if not a1.State then if not a1.Replicator then nil else a1.Replicator:Get("Name") else if a1.State.Name == nil then if not a1.Replicator then nil else a1.Replicator:Get("Name") else a1.State.Name else a1.Name else nil) or (if not a1 then nil else a1.Name or a1.TowerName or nil)
end

local function getTowerAttributes(a1) -- Line: 144
    local Stats = a1 and a1.Stats and a1.Stats.Attributes
    if typeof(Stats) == "table" then
        return Stats
    end
    local Attributes = a1 and a1.Attributes
    if typeof(Attributes) == "table" then
        return Attributes
    end
    return {}
end

local function getTowerAttackRange(a1) -- Line: 158
    local Range
    if a1 and type(a1.GetRange) == "function" then
        local success, result = pcall(function() -- Line: 160 -- upvalues: a1 (val)
            return a1:GetRange()
        end)
        if success and typeof(result) == "number" then
            return result
        end
    end
    if typeof(if a1 then if a1.Range == nil then if not a1.State then if not a1.Replicator then nil else a1.Replicator:Get("Range") else if a1.State.Range == nil then if not a1.Replicator then nil else a1.Replicator:Get("Range") else a1.State.Range else a1.Range else nil) ~= "number" then
        return 0
    end
    local RangeBuff = if a1 then if a1.RangeBuff == nil then if not a1.State then if not a1.Replicator then nil else a1.Replicator:Get("RangeBuff") else if a1.State.RangeBuff == nil then if not a1.Replicator then nil else a1.Replicator:Get("RangeBuff") else a1.State.RangeBuff else a1.RangeBuff else nil
    local ScaredBuff = if a1 then if a1.ScaredBuff == nil then if not a1.State then if not a1.Replicator then nil else a1.Replicator:Get("ScaredBuff") else if a1.State.ScaredBuff == nil then if not a1.Replicator then nil else a1.Replicator:Get("ScaredBuff") else a1.State.ScaredBuff else a1.ScaredBuff else nil
    if typeof(RangeBuff) ~= "number" then
        RangeBuff = 0
    end
    if typeof(ScaredBuff) ~= "number" then
        ScaredBuff = 0
    end
    return Range + Range * RangeBuff / 100 - Range * ScaredBuff / 100
end

local function hasStatusEffect(a1, a2) -- Line: 182 -- types: a2: string
    local StatusEffectRenderer = a1 and a1.StatusEffectRenderer
    if StatusEffectRenderer and StatusEffectRenderer.has and StatusEffectRenderer:has(a2) then
        return true
    end
    local StatusEffects = a1 and a1.StatusEffects
    local v1 = false
    if typeof(StatusEffects) == "table" then
        v1 = StatusEffects[a2] ~= nil
    end
    return v1
end

local function areAllied(a1, a2) -- Line: 192
    local Team = if a1 then if a1.Team == nil then if not a1.State then if not a1.Replicator then nil else a1.Replicator:Get("Team") else if a1.State.Team == nil then if not a1.Replicator then nil else a1.Replicator:Get("Team") else a1.State.Team else a1.Team else nil
    local Team_2 = if a2 then if a2.Team == nil then if not a2.State then if not a2.Replicator then nil else a2.Replicator:Get("Team") else if a2.State.Team == nil then if not a2.Replicator then nil else a2.Replicator:Get("Team") else a2.State.Team else a2.Team else nil
    if Team == nil and Team_2 == nil then
        local OwnerId = if a1 then if a1.OwnerId == nil then if not a1.State then if not a1.Replicator then nil else a1.Replicator:Get("OwnerId") else if a1.State.OwnerId == nil then if not a1.Replicator then nil else a1.Replicator:Get("OwnerId") else a1.State.OwnerId else a1.OwnerId else nil
        local v1 = false
        if OwnerId ~= nil then
            v1 = OwnerId == (if a2 then if a2.OwnerId == nil then if not a2.State then if not a2.Replicator then nil else a2.Replicator:Get("OwnerId") else if a2.State.OwnerId == nil then if not a2.Replicator then nil else a2.Replicator:Get("OwnerId") else a2.State.OwnerId else a2.OwnerId else nil)
        end
        return v1
    end
    return Team == Team_2
end

local function towerNameMatches(a1, a2) -- Line: 204 -- types: a1: string?
    if a2 == nil then
        return true
    end
    if typeof(a2) == "string" then
        return a1 == a2
    end
    if typeof(a2) ~= "table" then
        return false
    end
    for i, j in a2 do
        if a1 == j then
            return true
        end
    end
    return false
end

local function attributeMatches(a1, a2) -- Line: 226
    if a2 ~= nil then
        return a1 == a2
    end
    local v1 = true
    if a1 ~= true then
        v1 = false
        if typeof(a1) == "number" then
            v1 = a1 > 0
        end
    end
    return v1
end

local function statusEffectMatches(a1, a2) -- Line: 234
    local StatusEffectRenderer_2, StatusEffects_2, v1
    if a2 == nil then
        return true
    end
    if typeof(a2) ~= "table" then
        local StatusEffectRenderer = a1 and a1.StatusEffectRenderer
        if StatusEffectRenderer and StatusEffectRenderer.has and StatusEffectRenderer:has(a2) then
            return true
        end
        local StatusEffects = a1 and a1.StatusEffects
        local v2 = false
        if typeof(StatusEffects) == "table" then
            v2 = StatusEffects[a2] ~= nil
        end
        return v2
    end
    local v3 = nil
    local v4 = nil
    local v5 = a1
    for i, j in a2, v3, v4 do
        StatusEffectRenderer_2 = v5 and v5.StatusEffectRenderer
        if not StatusEffectRenderer_2 or not StatusEffectRenderer_2.has or not StatusEffectRenderer_2:has(j) then
            StatusEffects_2 = v5 and v5.StatusEffects
            v1 = false
            if typeof(StatusEffects_2) == "table" then
                v1 = StatusEffects_2[j] ~= nil
            end
        else
            v1 = true
        end
        if v1 then
            return true
        end
    end
    return false
end

local function hasAnyStatusEffect(a1, a2) -- Line: 252
    local StatusEffectRenderer_2, StatusEffects_2, v1
    if a2 == nil then
        return false
    end
    if typeof(a2) ~= "table" then
        local StatusEffectRenderer = a1 and a1.StatusEffectRenderer
        if StatusEffectRenderer and StatusEffectRenderer.has and StatusEffectRenderer:has(a2) then
            return true
        end
        local StatusEffects = a1 and a1.StatusEffects
        local v2 = false
        if typeof(StatusEffects) == "table" then
            v2 = StatusEffects[a2] ~= nil
        end
        return v2
    end
    local v3 = nil
    local v4 = nil
    local v5 = a1
    for i, j in a2, v3, v4 do
        StatusEffectRenderer_2 = v5 and v5.StatusEffectRenderer
        if not StatusEffectRenderer_2 or not StatusEffectRenderer_2.has or not StatusEffectRenderer_2:has(j) then
            StatusEffects_2 = v5 and v5.StatusEffects
            v1 = false
            if typeof(StatusEffects_2) == "table" then
                v1 = StatusEffects_2[j] ~= nil
            end
        else
            v1 = true
        end
        if v1 then
            return true
        end
    end
    return false
end

local function hasStatusEffectTag(a1, a2) -- Line: 270 -- types: a2: string?
    local StatusEffectRenderer = a1 and a1.StatusEffectRenderer
    if a2 == nil then
        return false
    end
    if StatusEffectRenderer ~= nil
        and StatusEffectRenderer.hasAnyWithTag ~= nil
        and StatusEffectRenderer:hasAnyWithTag(a2) then
        return true
    end
    local StatusEffects = a1 and a1.StatusEffects
    if typeof(StatusEffects) ~= "table" then
        return false
    end
    local v1 = nil
    local v2 = nil
    for i, j in StatusEffects, v1, v2 do
        if typeof(j) == "table" then
            for k, n in j.tags or {} do
                if n == a2 then
                    return true
                end
            end
        end
    end
    return false
end

local function rangeProviderConfigIsUnlocked(a1, a2) -- Line: 300
    -- upvalues: hasAnyStatusEffect (val), hasStatusEffectTag (val)
    local v1
    if hasAnyStatusEffect(a1, a2.BlockedStatusEffect)
        or hasAnyStatusEffect(a1, a2.BlockedStatusEffects)
        or hasStatusEffectTag(a1, a2.BlockedStatusTag) then
        return false
    end
    local v2 = false
    if a2.StatusEffect then
        v2 = true
        local StatusEffect = a2.StatusEffect
        local StatusEffectRenderer = a1 and a1.StatusEffectRenderer
        if not StatusEffectRenderer or not StatusEffectRenderer.has or not StatusEffectRenderer:has(StatusEffect) then
            local StatusEffects = a1 and a1.StatusEffects
            v1 = false
            if typeof(StatusEffects) == "table" then
                v1 = StatusEffects[StatusEffect] ~= nil
            end
        else
            v1 = true
        end
        if v1 then
            return true
        end
    end
    if a2.Attribute then
        local v3
        v2 = true
        local Stats = a1 and a1.Stats and a1.Stats.Attributes
        if typeof(Stats) ~= "table" then
            local Attributes = a1 and a1.Attributes
            v3 = if typeof(Attributes) ~= "table" then {} else Attributes
        else
            v3 = Stats
        end
        local v4 = v3[a2.Attribute]
        local AttributeValue = a2.AttributeValue
        if AttributeValue == nil then
            v1 = true
            if v4 ~= true then
                v1 = false
                if typeof(v4) == "number" then
                    v1 = v4 > 0
                end
            end
        else
            v1 = v4 == AttributeValue
        end
        if v1 then
            return true
        end
    end
    if a2.MinUpgrade then
        v2 = true
        if a2.MinUpgrade <= ((if a1 then if a1.Upgrade == nil then if not a1.State then if not a1.Replicator then nil else a1.Replicator:Get("Upgrade") else if a1.State.Upgrade == nil then if not a1.Replicator then nil else a1.Replicator:Get("Upgrade") else a1.State.Upgrade else a1.Upgrade else nil) or 0) then
            return true
        end
    end
    return not v2
end

local function rangeProviderConfigMatchesProvider(a1, a2) -- Line: 339 -- upvalues: statusEffectMatches (val)
    local v1 = false
    if a2.ProviderStatusEffect then
        v1 = true
        if statusEffectMatches(a1, a2.ProviderStatusEffect) then
            return true
        end
    end
    if a2.ProviderStatusEffects then
        v1 = true
        if statusEffectMatches(a1, a2.ProviderStatusEffects) then
            return true
        end
    end
    if a2.ProviderAttribute then
        local v2, v3
        v1 = true
        local Stats = a1 and a1.Stats and a1.Stats.Attributes
        if typeof(Stats) ~= "table" then
            local Attributes = a1 and a1.Attributes
            v3 = if typeof(Attributes) ~= "table" then {} else Attributes
        else
            v3 = Stats
        end
        local v4 = v3[a2.ProviderAttribute]
        local ProviderAttributeValue = a2.ProviderAttributeValue
        if ProviderAttributeValue == nil then
            v2 = true
            if v4 ~= true then
                v2 = false
                if typeof(v4) == "number" then
                    v2 = v4 > 0
                end
            end
        else
            v2 = v4 == ProviderAttributeValue
        end
        if v2 then
            return true
        end
    end
    if a2.ProviderMinUpgrade then
        v1 = true
        if a2.ProviderMinUpgrade <= ((if a1 then if a1.Upgrade == nil then if not a1.State then if not a1.Replicator then nil else a1.Replicator:Get("Upgrade") else if a1.State.Upgrade == nil then if not a1.Replicator then nil else a1.Replicator:Get("Upgrade") else a1.State.Upgrade else a1.Upgrade else nil) or 0) then
            return true
        end
    end
    return not v1
end

local function getConfiguredProximityRange(a1, a2, a3) -- Line: 378 -- types: a2: string?
    if a2 then
        local v1
        local Stats = a1 and a1.Stats and a1.Stats.Attributes
        if typeof(Stats) ~= "table" then
            local Attributes = a1 and a1.Attributes
            v1 = if typeof(Attributes) ~= "table" then {} else Attributes
        else
            v1 = Stats
        end
        local v2 = v1[a2]
        if typeof(v2) == "number" then
            return v2
        end
    end
    if typeof(a3) == "number" then
        return a3
    end
    return 0
end

local function rangeProviderProximityMatches(a1, a2, a3) -- Line: 389 -- upvalues: getTowerAttackRange (val)
    local WorldPosition, WorldPosition_2, v1, v2, v3, v4, v5, v6
    local ProviderProximityRange = a3.ProviderProximityRange
    local ProviderProximityAttribute = a3.ProviderProximityAttribute
    local ProviderProximityProviderAttribute = a3.ProviderProximityProviderAttribute
    local v7 = a3.ProviderProximityUseSelectedRange == true
    local v8 = a3.ProviderProximityUseProviderRange == true
    if ProviderProximityRange == nil
        and ProviderProximityAttribute == nil
        and ProviderProximityProviderAttribute == nil
        and not v7
        and not v8 then
        return true
    end
    local Model = a1 and a1.Model
    if not Model then
        WorldPosition = nil
    elseif Model.Parent then
        local HeightOffset = Model:FindFirstChild("HeightOffset")
        v3 = false
        if typeof(HeightOffset) == "Instance" then
            v3 = HeightOffset:IsA("BasePart") or HeightOffset:IsA("Attachment")
        end
        if not v3 then
            local PrimaryPart = Model.PrimaryPart
            if PrimaryPart then
                local HeightOffset_2 = PrimaryPart:FindFirstChild("HeightOffset")
                v5 = false
                if typeof(HeightOffset_2) == "Instance" then
                    v5 = HeightOffset_2:IsA("BasePart") or HeightOffset_2:IsA("Attachment")
                end
                v1 = if not v5 then PrimaryPart else HeightOffset_2
            else
                v1 = nil
            end
        else
            v1 = HeightOffset
        end
        WorldPosition = v1 and (if not v1:IsA("Attachment") then if not v1:IsA("BasePart") then nil else v1.Position else v1.WorldPosition) or Model:GetPivot().Position
    else
        WorldPosition = nil
    end
    local Model_2 = a2 and a2.Model
    if not Model_2 then
        WorldPosition_2 = nil
    elseif Model_2.Parent then
        local HeightOffset_3 = Model_2:FindFirstChild("HeightOffset")
        v4 = false
        if typeof(HeightOffset_3) == "Instance" then
            v4 = HeightOffset_3:IsA("BasePart") or HeightOffset_3:IsA("Attachment")
        end
        if not v4 then
            local PrimaryPart_2 = Model_2.PrimaryPart
            if PrimaryPart_2 then
                local HeightOffset_4 = PrimaryPart_2:FindFirstChild("HeightOffset")
                v6 = false
                if typeof(HeightOffset_4) == "Instance" then
                    v6 = HeightOffset_4:IsA("BasePart") or HeightOffset_4:IsA("Attachment")
                end
                v2 = if not v6 then PrimaryPart_2 else HeightOffset_4
            else
                v2 = nil
            end
        else
            v2 = HeightOffset_3
        end
        WorldPosition_2 = v2 and (if not v2:IsA("Attachment") then if not v2:IsA("BasePart") then nil else v2.Position else v2.WorldPosition) or Model_2:GetPivot().Position
    else
        WorldPosition_2 = nil
    end
    if WorldPosition and WorldPosition_2 then
        v2 = WorldPosition.X - WorldPosition_2.X
        v3 = WorldPosition.Z - WorldPosition_2.Z
        v1 = v2 * v2 + v3 * v3
        if typeof(ProviderProximityRange) == "number" and ProviderProximityRange > 0 then
            return v1 <= ProviderProximityRange * ProviderProximityRange
        end
        local ProviderProximityFallback = a3.ProviderProximityFallback
        if not ProviderProximityAttribute then
            v2 = if typeof(ProviderProximityFallback) ~= "number" then 0 else ProviderProximityFallback
        else
            local Stats = a1 and a1.Stats and a1.Stats.Attributes
            if typeof(Stats) ~= "table" then
                local Attributes = a1 and a1.Attributes
                v5 = if typeof(Attributes) ~= "table" then {} else Attributes
            else
                v5 = Stats
            end
            v4 = v5[ProviderProximityAttribute]
            v2 = if typeof(v4) ~= "number" then if typeof(ProviderProximityFallback) ~= "number" then 0 else ProviderProximityFallback else v4
        end
        if v7 then
            v2 = math.max(v2, (getTowerAttackRange(a1)))
        end
        if v2 > 0 and v1 <= v2 * v2 then
            return true
        end
        local ProviderProximityProviderFallback = a3.ProviderProximityProviderFallback
        if not ProviderProximityProviderAttribute then
            v3 = if typeof(ProviderProximityProviderFallback) ~= "number" then 0 else ProviderProximityProviderFallback
        else
            local Stats_2 = a2 and a2.Stats and a2.Stats.Attributes
            if typeof(Stats_2) ~= "table" then
                local Attributes_2 = a2 and a2.Attributes
                v6 = if typeof(Attributes_2) ~= "table" then {} else Attributes_2
            else
                v6 = Stats_2
            end
            v5 = v6[ProviderProximityProviderAttribute]
            v3 = if typeof(v5) ~= "number" then if typeof(ProviderProximityProviderFallback) ~= "number" then 0 else ProviderProximityProviderFallback else v5
        end
        if v8 then
            v3 = math.max(v3, (getTowerAttackRange(a2)))
        end
        v4 = false
        if v3 > 0 then
            v4 = v1 <= v3 * v3
        end
        return v4
    end
    return false
end

local function rangeProviderMatches(a1, a2, a3) -- Line: 440
    -- upvalues: areAllied (val), hasStatusEffectTag (val), rangeProviderConfigMatchesProvider (val)
    -- upvalues: rangeProviderProximityMatches (val)
    local BlockedProviderStatusEffects, StatusEffectRenderer, StatusEffects, v1, v2, v3, v4, v5, v6, v7
    if a1 == a2 and a3.ExcludeSelf ~= false then
        return false
    end
    if a3.AlliedOnly ~= false and not areAllied(a1, a2) then
        return false
    end
    local Name = (if a2 then if a2.Name == nil then if not a2.State then if not a2.Replicator then nil else a2.Replicator:Get("Name") else if a2.State.Name == nil then if not a2.Replicator then nil else a2.Replicator:Get("Name") else a2.State.Name else a2.Name else nil) or (if not a2 then nil else a2.Name or a2.TowerName or nil)
    local ProviderTower = a3.ProviderTower or a3.ProviderTowers
    if ProviderTower == nil then
        v4 = true
    elseif typeof(ProviderTower) == "string" then
        v4 = Name == ProviderTower
    else
        if typeof(ProviderTower) == "table" then
            v7 = nil
            for i, j in ProviderTower, nil, v7 do
                if Name == j then
                    if false then
                        return false
                    end
                    BlockedProviderStatusEffects = a3.BlockedProviderStatusEffects or {}
                    v5 = nil
                    v6 = nil
                    v2, v3, v1 = a2, a3, a1
                    for k, n in BlockedProviderStatusEffects, v5, v6 do
                        StatusEffectRenderer = v2 and v2.StatusEffectRenderer
                        if not StatusEffectRenderer
                            or not StatusEffectRenderer.has
                            or not StatusEffectRenderer:has(n) then
                            StatusEffects = v2 and v2.StatusEffects
                            v7 = false
                            if typeof(StatusEffects) == "table" then
                                v7 = StatusEffects[n] ~= nil
                            end
                        else
                            v7 = true
                        end
                        if v7 then
                            return false
                        end
                    end
                    if hasStatusEffectTag(v2, v3.BlockedProviderStatusTag)
                        or not rangeProviderConfigMatchesProvider(v2, v3)
                        or not rangeProviderProximityMatches(v1, v2, v3) then
                        return false
                    end
                    return true
                end
            end
        end
        v4 = false
    end
    if not v4 then
        return false
    end
    BlockedProviderStatusEffects = a3.BlockedProviderStatusEffects or {}
    v5 = nil
    v6 = nil
    v2, v3, v1 = a2, a3, a1
    for m, i5 in BlockedProviderStatusEffects, v5, v6 do
        StatusEffectRenderer = v2 and v2.StatusEffectRenderer
        if not StatusEffectRenderer or not StatusEffectRenderer.has or not StatusEffectRenderer:has(i5) then
            StatusEffects = v2 and v2.StatusEffects
            v7 = false
            if typeof(StatusEffects) == "table" then
                v7 = StatusEffects[i5] ~= nil
            end
        else
            v7 = true
        end
        if v7 then
            return false
        end
    end
    if hasStatusEffectTag(v2, v3.BlockedProviderStatusTag)
        or not rangeProviderConfigMatchesProvider(v2, v3)
        or not rangeProviderProximityMatches(v1, v2, v3) then
        return false
    end
    return true
end

local function collectRangeProviderTowers(a1, a2, a3) -- Line: 479 -- upvalues: rangeProviderMatches (val)
    local v1
    local v2 = {}
    if a3.ProviderChain ~= true then
        for k2, i in pairs(a2) do
            if rangeProviderMatches(a1, i, a3) then
                table.insert(v2, {model = k2, tower = i})
            end
        end
        return v2
    end
    local v3 = {[a1] = true}
    local v4 = {a1}
    local v5 = 1
    while v5 <= #v4 do
        v1 = v4[v5]
        v5 = v5 + 1
        for k, v in pairs(a2) do
            if not v3[v] and rangeProviderMatches(v1, v, v6) then
                v3[v] = true
                table.insert(v4, v)
                table.insert(v2, {model = k, tower = v})
            end
        end
    end
    return v2
end

local function getRangeProviderRingConfigs(a1) -- Line: 524
    local Properties = a1 and a1.Properties
    local RangeProviderRings = Properties and Properties.RangeProviderRings
    if typeof(RangeProviderRings) == "table" then
        return RangeProviderRings
    end
    return {}
end

local function getSavedQualityLevel(a1) -- Line: 531
    local User = a1.User
    if not User then
        return
    end
    local SavedQualityLevel = User.SavedQualityLevel
    if typeof(SavedQualityLevel) == "EnumItem" then
        return SavedQualityLevel.Value
    end
    return SavedQualityLevel
end

function u85.RenderTowers(a1) -- Line: 543
    -- upvalues: useInGameTowers (val), useGameStateValue (val), Asset (val), SharedGameConstants (val)
    -- upvalues: createElement (val), ReplicatedTowerRange (val), React (val)
    local BoundarySize, HeightOffset, PrimaryPart, UID, v1, v2, v3, v4
    local v5 = useInGameTowers()
    local v6 = useGameStateValue("GlobalModifiersEnabled", {}).Quarantine == true
    local v7 = {}
    local v8 = 0
    debug.profilebegin("UIFanout_RangeTowers")
    for k, v in pairs(v5) do
        PrimaryPart = k.PrimaryPart
        UID = v.UID
        if PrimaryPart then
            v1 = PrimaryPart
            HeightOffset = PrimaryPart:FindFirstChild("HeightOffset")
            v2 = false
            if typeof(HeightOffset) == "Instance" then
                v2 = HeightOffset:IsA("BasePart") or HeightOffset:IsA("Attachment")
            end
            if v2 then
                v1 = HeightOffset
            end
            v2 = Asset("Troops", v.Name)
            v3 = k:GetExtentsSize() / 2
            BoundarySize = if not v2 then math.max(v3.X, v3.Z) + 0.2 else v2.Properties.BoundarySize or SharedGameConstants.DEFAULT_BOUNDARY_SIZE
            if v6 then
                BoundarySize = BoundarySize + 10
            end
            v8 = v8 + 1
            v4 = tostring(UID or v8)
            v7[v4] = (createElement(ReplicatedTowerRange, {
                Valid = false,
                ShowOnlyBoundary = true,
                isLowQuality = a1.isLowQuality,
                Target = v1,
                Boundary = BoundarySize,
                Replicator = v.Replicator,
            }))
        end
    end
    debug.profileend()
    return React.createElement(React.Fragment, {}, v7)
end

function u85.Render() -- Line: 596
    -- upvalues: useCharmSelector (val), UpgradesStore (val), useUnits (val), useUserSetting (val), SettingsStore (val)
    -- upvalues: getSavedQualityLevel (val), Asset (val), useMemo (val), getRangeProviderTowerFields (val)
    -- upvalues: useInGameTowers (val), createElement (val), NewTowerRange (val), rangeProviderConfigIsUnlocked (val)
    -- upvalues: collectRangeProviderTowers (val), ReplicatedTowerRange (val), u85 (val)
    local Node, PrimaryPart_3, v1, v2, v3, v4, v5, v6
    local v7 = {}
    local v8 = {}
    local v9 = useCharmSelector(UpgradesStore.getState, function(a1) -- Line: 600
        return a1.tower
    end, {})
    local u837 = useCharmSelector(UpgradesStore.getState, function(a1) -- Line: 603
        return a1.model
    end, {})
    local v10 = useCharmSelector(UpgradesStore.getState, function(a1) -- Line: 606
        return a1.range
    end, {})
    local v11 = useCharmSelector(UpgradesStore.getState, function(a1) -- Line: 609
        return a1.boundary
    end, {})
    local v12 = useCharmSelector(UpgradesStore.getState, function(a1) -- Line: 612
        return a1.deadzone
    end, {})
    local v13 = useCharmSelector(UpgradesStore.getState, function(a1) -- Line: 615
        return a1.buildzone
    end, {})
    local v14 = useCharmSelector(UpgradesStore.getState, function(a1) -- Line: 618
        return a1.flightRange
    end, {})
    local v15 = useCharmSelector(UpgradesStore.getState, function(a1) -- Line: 621
        return a1.extraRings
    end, {})
    local v16 = useCharmSelector(UpgradesStore.getState, function(a1) -- Line: 624
        return a1.valid
    end, {})
    local v17 = useCharmSelector(UpgradesStore.getState, function(a1) -- Line: 627
        return a1.showBoundaries
    end, {})
    local v18 = useUnits(u837)
    local v19 = useUserSetting("Low Quality Rings", false) == true
    local v20 = useCharmSelector(SettingsStore.getState, getSavedQualityLevel, {})
    local v21 = if not v9 then nil else Asset("Troops", v9)
    local Properties = v21 and v21.Properties
    local RangeProviderRings = Properties and Properties.RangeProviderRings
    local u1011 = if typeof(RangeProviderRings) ~= "table" then {} else RangeProviderRings
    local v22 = {v9, u837}
    local v23 = useInGameTowers((useMemo(function() -- Line: 636 -- upvalues: u837 (val), getRangeProviderTowerFields (upval), u1011 (val)
        if not u837 then
            return nil
        end
        return (getRangeProviderTowerFields(u1011))
    end, v22)))
    v22 = u837 and v23[u837]
    if u837 then
        local v24
        local HeightOffset = u837:FindFirstChild("HeightOffset")
        v1 = false
        if typeof(HeightOffset) == "Instance" then
            v1 = HeightOffset:IsA("BasePart") or HeightOffset:IsA("Attachment")
        end
        if not v1 then
            local PrimaryPart = u837.PrimaryPart
            if PrimaryPart then
                local HeightOffset_2 = PrimaryPart:FindFirstChild("HeightOffset")
                local v25 = false
                if typeof(HeightOffset_2) == "Instance" then
                    v25 = HeightOffset_2:IsA("BasePart") or HeightOffset_2:IsA("Attachment")
                end
                v24 = if not v25 then PrimaryPart else HeightOffset_2
            else
                v24 = nil
            end
        else
            v24 = HeightOffset
        end
        local FlightPos = u837:FindFirstChild("FlightPos")
        v1 = false
        if typeof(FlightPos) == "Instance" then
            v1 = FlightPos:IsA("BasePart") or FlightPos:IsA("Attachment")
        end
        if v1 then
            v7.Flight = FlightPos
        end
        v1 = false
        if typeof(v24) == "Instance" then
            v1 = v24:IsA("BasePart") or v24:IsA("Attachment")
        end
        if v1 then
            v7.Tower = v24
        end
    end
    for k, v in pairs(v7) do
        v2 = 0
        v3 = 0
        v4 = 0
        v5 = 0
        if k == "Tower" then
            if not v7.Flight then
                v2 = v11
                v3 = v12
            else
                v5 = v14 or 0
            end
            v4 = v13
        end
        v6 = {
            Target = v,
            Tower = if k ~= "Tower" then nil else v9,
            Model = u837,
            Valid = v16,
            Range = v10,
            Boundary = v2,
            Deadzone = v3,
            Buildzone = v4,
            ExtraRings = if k ~= "Tower" then nil else v15,
            FlightRange = v5,
            isLowQuality = v19,
            QualityMode = v20,
        }
        v7[k] = (createElement(NewTowerRange, v6))
    end
    if v22 then
        local Color, HeightOffset_3, HeightOffset_4, PrimaryPart_2, UID, model, tower, v26, v27, v28, v29, v30
        local v31 = nil
        v1 = nil
        for i, j in u1011, v31, v1 do
            if rangeProviderConfigIsUnlocked(v22, j) then
                for k2, n in collectRangeProviderTowers(v22, v23, j) do
                    model = n.model
                    tower = n.tower
                    HeightOffset_3 = model:FindFirstChild("HeightOffset")
                    v28 = false
                    if typeof(HeightOffset_3) == "Instance" then
                        v28 = HeightOffset_3:IsA("BasePart") or HeightOffset_3:IsA("Attachment")
                    end
                    if not v28 then
                        PrimaryPart_2 = model.PrimaryPart
                        if PrimaryPart_2 then
                            HeightOffset_4 = PrimaryPart_2:FindFirstChild("HeightOffset")
                            v30 = false
                            if typeof(HeightOffset_4) == "Instance" then
                                v30 = HeightOffset_4:IsA("BasePart") or HeightOffset_4:IsA("Attachment")
                            end
                            v26 = if not v30 then PrimaryPart_2 else HeightOffset_4
                        else
                            v26 = nil
                        end
                    else
                        v26 = HeightOffset_3
                    end
                    if v26 then
                        v29 = j.Key or "Range"
                        UID = if tower then if tower.UID == nil then if not tower.State then if not tower.Replicator then nil else tower.Replicator:Get("UID") else if tower.State.UID == nil then if not tower.Replicator then nil else tower.Replicator:Get("UID") else tower.State.UID else tower.UID else nil
                        v27 = ("Provider_%*_%*"):format(v29, if UID == nil then tostring(tower) else tostring(UID))
                        v30 = {Target = v26}
                        v30.Tower = (if tower then if tower.Name == nil then if not tower.State then if not tower.Replicator then nil else tower.Replicator:Get("Name") else if tower.State.Name == nil then if not tower.Replicator then nil else tower.Replicator:Get("Name") else tower.State.Name else tower.Name else nil) or (if not tower then nil else tower.Name or tower.TowerName or nil) or ""
                        v30.Model = model
                        v30.Valid = if j.Valid ~= nil then j.Valid else true
                        v30.DisableFill = j.DisableFill == true
                        v30.FillTransparency = j.FillTransparency
                        v30.LineOffset = j.LineOffset
                        v30.LineSize = j.LineSize
                        v30.LineTransparency = j.LineTransparency
                        Color = j.Color or j.BorderColor
                        v30.BorderColor = Color
                        v30.Boundary = j.Boundary or 0
                        v30.Replicator = tower.Replicator
                        v30.isLowQuality = v19
                        v30.QualityMode = v20
                        v7[v27] = (createElement(ReplicatedTowerRange, v30))
                    end
                end
            end
        end
    end
    for k3, m in pairs(v18) do
        PrimaryPart_3 = m.model.PrimaryPart
        if PrimaryPart_3 then
            Node = PrimaryPart_3:FindFirstChild("Node")
            v4 = false
            if typeof(Node) == "Instance" then
                v4 = Node:IsA("BasePart") or Node:IsA("Attachment")
            end
            if v4 then
                v4 = "Unit" .. k3
                v8[v4] = (createElement(NewTowerRange, {
                    Valid = true,
                    DisableFill = true,
                    Boundary = 0,
                    isLowQuality = true,
                    Target = Node,
                    Range = m.states.Range or 0,
                }))
            end
        end
    end
    return createElement("Folder", {Name = "TowerRings"}, {
        boundaries = if not v17 then nil else createElement(u85.RenderTowers, {isLowQuality = v19}),
        tower = createElement("Folder", {}, v7),
        unit = createElement("Folder", {}, v8),
    })
end

return function(a1) -- Line: 758 -- upvalues: ReactRoblox (val), createElement (val), u85 (val)
    return ReactRoblox.createPortal({range = createElement(u85.Render)}, workspace.CurrentCamera, "range")
end