-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.NewUpgrade.Alignments.Components.ConnectedActionPanel
-- Decompile time: 4.30 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local AbilityAmmoStore = require(ReplicatedStorage.Client.Interfaces.Stores.Game.AbilityAmmoStore)
local ActionPanel = require(script.Parent.ActionPanel)
local React = require(ReplicatedStorage.Shared.UI.React)
local table = require(ReplicatedStorage.Shared.Modules.Utils.table)
local UpgradeActionSelector = require(ReplicatedStorage.Client.Interfaces.Stores.Game.UpgradeActionSelector)
local UpgradesStore = require(ReplicatedStorage.Client.Interfaces.Stores.Game.UpgradesStore)
local useCharmSelector = require(ReplicatedStorage.Client.Interfaces.Hooks.useCharmSelector)
local useTowerReplicatorField = require(ReplicatedStorage.Client.Interfaces.Hooks.useTowerReplicatorField)
local createElement = React.createElement
local useMemo = React.useMemo
local u56 = {}
local u57 = {}

local function isAbilityAmmoIdForUID(a1, a2) -- Line: 20 -- types: a1: string, a2: string
    local v1 = string.match(a1, "%d+$")
    if v1 then
        return v1 == a2
    end
    return string.sub(a1, -#a2) == a2
end

local function shallowCompareValues(a1, a2) -- Line: 29 -- upvalues: table (val)
    if a1 == a2 then
        return true
    end
    if typeof(a1) == "table" and typeof(a2) == "table" then
        return table.shallowCompare(a1, a2)
    end
    return false
end

local function deepCompareValues(a1, a2) -- Line: 41 -- upvalues: table (val)
    if a1 == a2 then
        return true
    end
    if typeof(a1) == "table" and typeof(a2) == "table" then
        return table.deepCompare(a1, a2)
    end
    return false
end

return React.memo(function(a1) -- Line: 53
    -- upvalues: useCharmSelector (val), UpgradesStore (val), UpgradeActionSelector (val), AbilityAmmoStore (val)
    -- upvalues: u56 (val), deepCompareValues (val), useTowerReplicatorField (val), u57 (val)
    -- upvalues: shallowCompareValues (val), useMemo (val), createElement (val), ActionPanel (val)
    local UID = a1.UID
    local u12 = useCharmSelector(UpgradesStore.getState, UpgradeActionSelector.select, nil, UpgradeActionSelector.isEqual)
    local v1 = {UID or false}
    local u22 = useCharmSelector(AbilityAmmoStore.getState, function(a1) -- Line: 63 -- upvalues: UID (val), u56 (upval)
        if UID and UID ~= 0 then
            local v1, v2, v3
            local v4 = tostring(UID)
            local v5 = {}
            local v6 = nil
            local v7 = nil
            for i, j in a1, v6, v7 do
                v3 = string.match(i, "%d+$")
                if not v3 then
                    v1 = -#v4
                    v2 = string.sub(i, v1) == v4
                else
                    v2 = v3 == v4
                end
                if v2 then
                    v5[i] = j
                end
            end
            return v5
        end
        return u56
    end, v1, deepCompareValues)
    local u30 = useTowerReplicatorField(if not UID then nil else if UID == 0 then nil else UID, "DisabledAbilities", u57, shallowCompareValues)
    if not u30 then
        u30 = u57
    end
    local v2 = useMemo
    local v3 = {a1.BuildTowerActions, a1.TowerActions, u12, u22, u30}
    v2 = v2(function() -- Line: 87 -- upvalues: a1 (val), u12 (val), u22 (val), u30 (val)
        if not a1.BuildTowerActions then
            return a1.TowerActions or {}
        end
        return a1.BuildTowerActions({
            Units = u12.units,
            GlobalOptionsCoolDown = u12.globalOptionsCoolDown,
            GlobalOptionsStart = u12.globalOptionsStart,
            AbilityAmmoStore = u22,
            DisabledAbilities = u30,
        })
    end, v3)
    return createElement(ActionPanel, {
        Size = a1.Size,
        Position = a1.Position,
        AnchorPoint = a1.AnchorPoint,
        LayoutOrder = a1.LayoutOrder,
        Visible = a1.Visible,
        Faded = a1.Faded,
        Transparency = a1.Transparency,
        TowerName = a1.TowerName,
        TowerDisplayName = a1.TowerDisplayName,
        TowerActions = v2,
    })
end, function(a1, a2) -- Line: 121
    local v1 = false
    if a1.Size == a2.Size then
        v1 = false
        if a1.Position == a2.Position then
            v1 = false
            if a1.AnchorPoint == a2.AnchorPoint then
                v1 = false
                if a1.LayoutOrder == a2.LayoutOrder then
                    v1 = false
                    if a1.Visible == a2.Visible then
                        v1 = false
                        if a1.Faded == a2.Faded then
                            v1 = false
                            if a1.Transparency == a2.Transparency then
                                v1 = false
                                if a1.TowerName == a2.TowerName then
                                    v1 = false
                                    if a1.TowerDisplayName == a2.TowerDisplayName then
                                        v1 = false
                                        if a1.TowerActions == a2.TowerActions then
                                            v1 = false
                                            if a1.BuildTowerActions == a2.BuildTowerActions then
                                                v1 = a1.UID == a2.UID
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end
    return v1
end)