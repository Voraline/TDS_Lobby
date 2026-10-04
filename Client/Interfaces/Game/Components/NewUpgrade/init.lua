-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.NewUpgrade
-- Decompile time: 83.90 ms

local deepAssign, getBuffedValues, getDeltaTable, u39
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local VRService = game:GetService("VRService")
local v1 = RunService:IsRunning()
local u23 = nil
if not v1 then
    u39 = {}

    function u39.Create(...) end
else
    u23 = ReplicatedStorage:WaitForChild("State")
    u39 = require(ReplicatedStorage.Client.Modules.Universal.Interface.Components.Notification)
end
local Content = require(ReplicatedStorage.Shared.Modules.Content)
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
local EvolvedTowerUnlocksUtil = require(ReplicatedStorage.Shared.Modules.EvolvedTowerUnlocksUtil)
local GameRules = require(ReplicatedStorage.Shared.Modules.GameRules)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local HorizontalUpgrade = require(ReplicatedStorage.Client.Interfaces.Game.Components.NewUpgrade.Alignments.HorizontalUpgrade)
local Icons = require(ReplicatedStorage.Client.Interfaces.Icons)
local React = require(ReplicatedStorage.Shared.UI.React)
local TowerAbilityIcons = require(ReplicatedStorage.Shared.Modules.TowerAbilityIcons)
local TowerInformation = require(script.Parent.TowerInformation)
local TowerUpgradeUtils = require(ReplicatedStorage.Shared.Modules.TowerUpgradeUtils)
local Troops = require(ReplicatedStorage.Shared.Modules.Asset.Handlers.Troops)
local VerticalUpgrade = require(ReplicatedStorage.Client.Interfaces.Game.Components.NewUpgrade.Alignments.VerticalUpgrade)
local table = require(ReplicatedStorage.Shared.Modules.Utils.table)
local useCache = require(ReplicatedStorage.Client.Interfaces.Hooks.useCache)
local useGameRule = require(ReplicatedStorage.Client.Interfaces.Hooks.useGameRule)
require(ReplicatedStorage.Client.Interfaces.Hooks.useGameStateValue)
local useScale = require(ReplicatedStorage.Client.Interfaces.Hooks.useScale)
local useSkill = require(ReplicatedStorage.Client.Interfaces.Hooks.useSkill)
local useUserSetting = require(ReplicatedStorage.Client.Interfaces.Hooks.useUserSetting)
local createElement = React.createElement
local useCallback = React.useCallback
local useEffect = React.useEffect
local useMemo = React.useMemo
local useBinding = React.useBinding
local u164 = {
    Cooldown = 5577896365,
    Damage = 5577895610,
    Cash = 5547581690,
    Income = 5547581690,
    Range = 5577896808,
    CoordinationDamageBonus = Icons.Coordination,
}

local function noop(a1) end

local function noopUpgrade(a1, a2) end

local function noopOption(a1, a2, a3) end

local function isOptionValueLocked(a1, a2, a3) -- Line: 67
    -- upvalues: TowerUpgradeUtils (val)
    if a1.Level and a2 < a1.Level then
        return true
    end
    return not TowerUpgradeUtils.matchesPath(a1, a3)
end

local Unit = Content("Unit")
local u173 = {}

local function getString(a1) -- Line: 78
    if typeof(a1) == "string" and a1 ~= "" then
        return a1
    end
    return nil
end

local function getDisplayString(a1) -- Line: 82
    if typeof(a1) == "string" then
        return a1
    end
    if typeof(a1) ~= "number" and typeof(a1) ~= "boolean" then
        return nil
    end
    return (tostring(a1))
end

local function getStatsDisplayName(a1, a2) -- Line: 94 -- types: a2: boolean
    if typeof(a1) ~= "table" then
        return nil
    end
    local Default = a1[if not a2 then "Default" else "Golden"] or a1.Default
    if typeof(Default) ~= "table" then
        local DisplayName = a1.DisplayName
        if typeof(DisplayName) == "string" and DisplayName ~= "" then
            return DisplayName
        end
        return nil
    end
    local DisplayName_2 = Default.DisplayName
    local v1 = if typeof(DisplayName_2) ~= "string" then nil else if DisplayName_2 == "" then nil else DisplayName_2
    if not v1 then
        local Defaults = Default.Defaults and Default.Defaults.DisplayName
        v1 = if typeof(Defaults) ~= "string" then nil else if Defaults == "" then nil else Defaults
        if not v1 then
            local DisplayName_3 = a1.DisplayName
            if typeof(DisplayName_3) == "string" and DisplayName_3 ~= "" then
                return DisplayName_3
            end
            v1 = nil
        end
    end
    return v1
end

local function getUnitDisplayName(a1, a2) -- Line: 109
    -- upvalues: GameState (val), u173 (val), Unit (val), getStatsDisplayName (val)
    local v1 = a1
    local v2 = if typeof(v1) ~= "string" then if typeof(v1) == "number" then tostring(v1) else if typeof(v1) ~= "boolean" then nil else tostring(v1) else v1
    if v2 and v2 ~= "" then
        v1 = ("%*:%*:%*"):format(v2, GameState.GameMode, a2)
        local v3 = u173[v1]
        if v3 ~= nil then
            return v3 or nil
        end
        local v4 = Unit:FindFirstChild(v2)
        local Stats = v4 and v4:FindFirstChild("Stats")
        local v5 = v4 and v4:FindFirstChild("Stats-PVP")
        if GameState.GameMode == "PVP" and v5 then
            Stats = v5
        end
        local v6 = nil
        if Stats then
            local success, result = pcall(require, Stats)
            if success then
                v6 = getStatsDisplayName(result, a2)
            end
        end
        u173[v1] = v6 or false
        return v6
    end
    return nil
end

local function getUnitNameForQueue(a1, a2) -- Line: 140
    local v1 = (if typeof(a1) ~= "string" then if typeof(a1) == "number" then tostring(a1) else if typeof(a1) ~= "boolean" then nil else tostring(a1) else a1) or ""
    local Attributes = a2.Attributes or {}
    if v1 == "Pistol_Crook" then
        return "Goon1", "Pistol Crook"
    end
    if v1 == "Tommy_Crook" then
        return if not Attributes.TommyDrum then "Goon2" else "Goon3", "Tommy Crook"
    end
    local UnitToSend = Attributes.UnitToSend
    local v2 = if typeof(UnitToSend) ~= "string" then if typeof(UnitToSend) == "number" then tostring(UnitToSend) else if typeof(UnitToSend) ~= "boolean" then nil else tostring(UnitToSend) else UnitToSend
    if v2 and v1 == "Spawn_Military_Base_Units" then
        return v2
    end
    return v1:gsub("_", " ")
end

local u179 = {
    HiddenDetection = {Name = "Hidden", Icon = "Hidden", Text = "Hidden Detection"},
    FlyingDetection = {Name = "Flying", Icon = "Flying", Text = "Flying Detection"},
    LeadDetection = {Name = "Lead", Icon = "Lead", Text = "Lead Detection"},
    FreezeImmune = {Name = "Freeze Immune", Icon = "FreezeImmune", Text = "Freeze Immunity"},
    StunImmune = {Name = "Stun Immune", Icon = "StunImmune", Text = "Stun Immunity"},
    [Enum.StatusEffect.FireworkBuff] = {Name = "Firework", Icon = "FireworkBuff", Text = "Firework"},
}
u179[Enum.StatusEffect.Coordination] = {Name = "Coordination", Icon = "Coordination", Text = "Coordination"}
u179[Enum.StatusEffect.SharedOptics] = {Name = "Shared Optics", Icon = "SharedOptics", Text = "Shared Optics"}
local u194 = {}
u194[Enum.Modifier.Hidden] = Enum.StatusEffect.HiddenDetection
u194[Enum.Modifier.Flying] = Enum.StatusEffect.FlyingDetection
u194[Enum.Modifier.Lead] = Enum.StatusEffect.LeadDetection
local u211 = Color3.fromRGB(170, 170, 170)
local u212 = {}

function u212.Cooldown(a1, a2) -- Line: 216 -- types: a1: number, a2: number
    return (1 - a1 / a2) * 100
end

local u214 = {
    Default = true,
    DPS = true,
    ["Gun DPS"] = true,
    ["Normal DPS"] = true,
    ["Regular DPS"] = true,
    ["Total DPS"] = true,
}
local u225 = Color3.fromRGB(255, 85, 85)
local u226 = {
    [Enum.TargetingMode.First] = "First Enemy",
    [Enum.TargetingMode.Last] = "Last Enemy",
    [Enum.TargetingMode.Strongest] = "Strongest",
    [Enum.TargetingMode.Weakest] = "Weakest",
    [Enum.TargetingMode.Closest] = "Closest",
    [Enum.TargetingMode.Farthest] = "Farthest",
    [Enum.TargetingMode.Random] = "Random",
}

local function getTargetMode(a1) -- Line: 242 -- upvalues: u226 (val) -- types: a1: string
    for k, v in pairs(u226) do
        if v == a1 then
            return k
        end
    end
    return nil
end

local function formatPercent(a1) -- Line: 252 -- types: a1: number
    local v1 = math.round(a1 * 10) / 10
    if v1 == math.floor(v1) then
        return (tostring(v1))
    end
    return string.format("%.1f", v1)
end

local function getMultiplierPercent(a1) -- Line: 262 -- types: a1: number?
    local v1 = ((a1 or 1) - 1) * 100
    if (math.abs(v1)) < 0.05 then
        return nil
    end
    return v1
end

local function formatSignedPercent(a1) -- Line: 272 -- types: a1: number
    local v1 = if not (a1 > 0) then "" else "+"
    local v2 = math.round(a1 * 10) / 10
    return (("%*%*%%"):format(v1, if v2 ~= math.floor(v2) then string.format("%.1f", v2) else tostring(v2)))
end

local function getUpgradeCostMultiplierText(a1) -- Line: 278 -- types: a1: number?
    local v1
    local v2 = a1 or 1
    local v3 = ((v2 or 1) - 1) * 100
    if not (if not ((math.abs(v3)) < 0.05) then v3 else nil) then
        return nil
    end
    local v4 = if not (v2 > 1) then "rgb(71, 255, 15)" else "rgb(255, 96, 96)"
    local v5 = math.round(v1 * 10) / 10
    local v6 = if v5 ~= math.floor(v5) then string.format("%.1f", v5) else tostring(v5)
    return (("<font color=\"%*\"> (%*)</font>"):format(v4, (("%*%*%%"):format(if not (v1 > 0) then "" else "+", v6))))
end

local function getCoordinationDamageBonus(a1) -- Line: 292 -- upvalues: Enum (val) -- types: a1: table?
    local v1 = a1 and a1[Enum.StatusEffect.Coordination]
    if type(v1) ~= "table" then
        return 0
    end
    local value = v1.value or v1.Value
    if type(value) == "number" then
        return value
    end
    return 0
end

local function insertCoordinationDamageBonusStat(a1, a2) -- Line: 306
    -- upvalues: table (val), u164 (val)
    local Attributes = a2.Attributes or {}
    local CoordinationDamageBonus = Attributes.CoordinationDamageBonus
    if type(CoordinationDamageBonus) == "number" and not ((math.abs(CoordinationDamageBonus)) < 0.05) then
        local insert = table.insert
        local v1 = {Icon = u164.CoordinationDamageBonus}
        local v2 = math.round(CoordinationDamageBonus * 10) / 10
        local v3 = if v2 ~= math.floor(v2) then string.format("%.1f", v2) else tostring(v2)
        v1.Value = ("%*%*%%"):format(if not (CoordinationDamageBonus > 0) then "" else "+", v3)
        insert(a1, v1)
        return
    end
end

local function getStatBuffData(a1, a2, a3) -- Line: 320 -- upvalues: u212 (val), u211 (val) -- types: a1: string
    if typeof(a2) == "number" and typeof(a3) == "number" and a2 ~= 0 and a3 ~= 0 then
        local v1
        local v2 = u212[a1]
        if (math.abs(if not v2 then (a3 / a2 - 1) * 100 else v2(a2, a3))) < 0.05 then
            return nil
        end
        local v3 = {}
        local v4 = math.round(v1 * 10) / 10
        local v5 = if v4 ~= math.floor(v4) then string.format("%.1f", v4) else tostring(v4)
        v3.Text = ("%*%*%%"):format(if not (v1 > 0) then "" else "+", v5)
        v3.Color = u211
        return v3
    end
    return nil
end

function deepAssign(a1, a2) -- Line: 349 -- upvalues: deepAssign (val)
    local v1
    local v2 = a1
    for k, v in pairs(a2) do
        if type(v) ~= "table" then
            v2[k] = v
        else
            v1 = v2[k]
            if not v1 then
                v2[k] = {}
            end
            deepAssign(v1, v)
        end
    end
end

function getDeltaTable(a1, a2) -- Line: 365 -- upvalues: getDeltaTable (val) -- types: a1: table, a2: table
    local v1, v2
    local v3 = {}
    for k, v in pairs(a2) do
        if type(v) == "table" then
            v1 = a1[k]
            if type(v1) == "table" then
                v2 = getDeltaTable(v1, v)
                if next(v2) then
                    v3[k] = v2
                end
            else
                v3[k] = v
            end
        elseif a1[k] ~= a2[k] then
            v3[k] = v
        end
    end
    return v3
end

local function getBuffedValue(a1, a2, a3, a4) -- Line: 390
    -- upvalues: u23 (ref), GameState (val), GameRules (val)
    local v1
    if a3 == 0 then
        return a3
    end
    if a2 == "Cost" then
        if not u23 then
            return 0
        end
        v1 = a3 - (a1.Discount or 0) / 100 * a3
        local PriceScale = u23:FindFirstChild("PriceScale")
        if PriceScale then
            v1 = v1 * PriceScale.Value
        end
        if GameState.IsModifierEnabled("Inflation") then
            v1 = math.round(v1 * 1.5)
        end
        v1 = v1 * ((GameRules.Get("UpgradeCostMultiplier")) or 1)
        return (math.floor(v1))
    end
    if a2 ~= "Range" then
        if a2 == "Damage" then
            return a3 + a3 * (a1.Damage or 0) / 100
        end
        if a2 == "CoordinationDamageBonus" then
            return a3
        end
        if a2 == "Cooldown" then
            return (math.clamp(a3 - (a3 - a3 / (1 + (a1.Cooldown or 0) / 100)) + (a3 - a3 / (1 + (a1.Fatigue or 0) / 100)), 0.02, (1 / 0)))
        end
        return a3
    end
    v1 = a3 * (a1.Range or 0) / 100
    local v2 = a3 * (a4 or 0) / 100
    local v3 = a3 * (a1.Scared or 0) / 100
    local v4 = a3 + v1 + v2 - v3
    if GameState.IsModifierEnabled("Fog") then
        v4 = math.round(v4 * 0.65)
    end
    local v5 = GameRules.Get("TowerRangeMultiplier") or 1
    if v5 ~= 1 then
        v4 = math.round(v4 * v5)
    end
    return v4
end

function getBuffedValues(a1, a2, a3, a4) -- Line: 452
    -- upvalues: getBuffedValues (val), getBuffedValue (val)
    local v1
    local v2 = {}
    local v3 = if a4 ~= nil then a4 else true
    local v4, v5, v6 = a1, a2, a3
    for k, v in pairs(a2) do
        if type(v) == "table" then
            v2[k] = (getBuffedValues(v4, v5[k], v6, false))
        elseif type(v) == "number" then
            v1 = (getBuffedValue(v4, k, v, if not v3 then nil else v6)) * 100
            v2[k] = math.floor(v1) / 100
        else
            v2[k] = v
        end
    end
    return v2
end

local function getDpsDisplayCalculator(a1) -- Line: 483
    local v1
    if type(a1) == "function" then
        return a1
    end
    if type(a1) ~= "table" then
        return nil
    end
    for i, j in {"Calculate", "Calculation", "Calculator", "Formula", "Value", 1} do
        v1 = a1[j]
        if type(v1) == "function" then
            return v1
        end
    end
    return nil
end

local function getSelectedOptions(a1) -- Line: 502 -- types: a1: table
    local v1 = {}
    for i, j in a1 or {} do
        if j.Name then
            v1[j.Name] = j.Selected
        end
    end
    return v1
end

local function optionValueMatches(a1, a2) -- Line: 514
    if type(a1) ~= "table" then
        return a1 == a2
    end
    for k, v in pairs(a1) do
        if v == a2 then
            return true
        end
    end
    return false
end

local function dpsOptionRuleMatches(a1, a2) -- Line: 528 -- types: a2: table
    local Value, v1, v2
    if type(a1) ~= "table" then
        return true
    end
    if not a1.Name then
        local v3
        for k, v in pairs(a1) do
            v3 = a2[k]
            if type(v) ~= "table" then
                v1 = v == v3
            else
                for k2, i in pairs(v) do
                    if i == v3 then
                        if true then
                            break
                        end
                        return false
                    end
                end
                v1 = false
            end
            if not v1 then
                return false
            end
        end
        return true
    end
    if type(a1.Name) ~= "table" then
        local Value_2 = a1.Value
        local v4 = a2[a1.Name]
        if type(Value_2) == "table" then
            for k3, j in pairs(Value_2) do
                if j == v4 then
                    return true
                end
            end
            return false
        end
        return Value_2 == v4
    end
    local v5, v6 = a1, a2
    for k4, k5 in pairs(a1.Name) do
        Value = v5.Value
        v2 = v6[k5]
        if type(Value) ~= "table" then
            v1 = Value == v2
        else
            for k6, n in pairs(Value) do
                if n == v2 then
                    if false then
                        break
                    end
                    return true
                end
            end
            v1 = false
        end
        if v1 then
            return true
        end
    end
    return false
end

local function shouldShowDpsDisplay(a1, a2, a3) -- Line: 556
    -- upvalues: dpsOptionRuleMatches (val)
    if type(a1) ~= "table" then
        return true
    end
    if a1.Visible == nil then
        return (dpsOptionRuleMatches(a1.Option or a1.Options, a2.Options or {}))
    end
    if type(a1.Visible) ~= "function" then
        return a1.Visible == true
    end
    local success, result = pcall(a1.Visible, a2, a3)
    if success then
        return result == true
    end
    warn((("Failed to evaluate DPS display visibility: %*"):format(result)))
    return false
end

local function getDpsDisplayIcon(a1, a2) -- Line: 582 -- upvalues: Icons (val), u214 (val) -- types: a1: string
    if type(a2) == "table" and a2.Icon then
        if type(a2.Icon) == "string" and type(Icons[a2.Icon]) == "string" then
            return Icons[a2.Icon]
        end
        return a2.Icon
    end
    if u214[a1] then
        return Icons.Attack
    end
    local v1 = string.lower(a1)
    if not v1:find("burn", 1, true) and not v1:find("fire", 1, true) then
        if not v1:find("explosion", 1, true)
            and not v1:find("splash", 1, true)
            and not v1:find("bomb", 1, true)
            and not v1:find("missile", 1, true)
            and not v1:find("rocket", 1, true)
            and not v1:find("cluster", 1, true) then
            if not v1:find("poison", 1, true)
                and not v1:find("toxic", 1, true)
                and not v1:find("slime", 1, true)
                and not v1:find("thorns", 1, true) then
                if not v1:find("bee", 1, true) and not v1:find("sting", 1, true) then
                    if not v1:find("freeze", 1, true)
                        and not v1:find("frost", 1, true)
                        and not v1:find("ice", 1, true)
                        and not v1:find("chill", 1, true) then
                        if not v1:find("stun", 1, true) and not v1:find("shock", 1, true) then
                            return Icons.Attack
                        end
                        return Icons.StunImmune
                    end
                    return Icons.FreezeImmune
                end
                return Icons.Bee
            end
            return Icons.Slime
        end
        return Icons.ExplosionDamage
    end
    return Icons.FireImmune
end

local function isTotalDpsName(a1) -- Line: 630 -- types: a1: string
    return string.lower(a1):find("total dps", 1, true) ~= nil
end

local function isDefaultDpsName(a1) -- Line: 634 -- types: a1: string
    local v1 = true
    if a1 ~= "Default" then
        v1 = true
        if a1 ~= "DPS" then
            v1 = true
            if a1 ~= "Gun DPS" then
                v1 = true
                if a1 ~= "Normal DPS" then
                    v1 = a1 == "Regular DPS"
                end
            end
        end
    end
    return v1
end

local function dpsDisplaySortGroup(a1) -- Line: 642 -- types: a1: string
    local v1 = true
    if a1 ~= "Default" then
        v1 = true
        if a1 ~= "DPS" then
            v1 = true
            if a1 ~= "Gun DPS" then
                v1 = true
                if a1 ~= "Normal DPS" then
                    v1 = a1 == "Regular DPS"
                end
            end
        end
    end
    if v1 then
        return 0
    end
    if string.lower(a1):find("total dps", 1, true) ~= nil then
        return 2
    end
    return 1
end

local function getDpsDisplayTooltip(a1, a2, a3, a4) -- Line: 654 -- types: a1: string, a3: table, a4: table
    if type(a2) == "table" and a2.Tooltip then
        if type(a2.Tooltip) ~= "function" then
            return a2.Tooltip
        end
        local success, result = pcall(a2.Tooltip, a3, a4)
        if success then
            return result
        end
        warn((("Failed to calculate %* tooltip: %*"):format(a1, result)))
    end
    if a1 == "Default" then
        return "Default DPS"
    end
    return a1
end

local function formatDpsValue(a1) -- Line: 679
    if type(a1) == "number" and a1 == a1 and a1 ~= (1 / 0) and a1 ~= (-1 / 0) then
        return math.floor(a1 * 100 + 0.5) / 100
    end
    return nil
end

local function insertDpsDisplayEntry(a1, a2, a3, a4, a5) -- Line: 687
    -- upvalues: shouldShowDpsDisplay (val), getDpsDisplayCalculator (val), table (val), getDpsDisplayIcon (val)
    -- upvalues: getDpsDisplayTooltip (val), u225 (val)
    if not shouldShowDpsDisplay(a3, a5, a4) then
        return
    end
    local v1 = getDpsDisplayCalculator(a3)
    if not v1 then
        return
    end
    local success, result = pcall(v1, a4, a5)
    if not success then
        warn((("Failed to calculate %*: %*"):format(a2, result)))
        return
    end
    local v2 = if type(result) ~= "number" or result ~= result or result == (1 / 0) then nil else if result ~= (-1 / 0) then math.floor(result * 100 + 0.5) / 100 else nil
    if v2 and v2 ~= 0 then
        table.insert(a1, {
            Name = a2,
            Icon = getDpsDisplayIcon(a2, a3),
            Tooltip = getDpsDisplayTooltip(a2, a3, a4, a5),
            TextColor3 = if not (string.lower(a2):find("total dps", 1, true) ~= nil) then nil else u225,
            PulseColor3 = if not (string.lower(a2):find("total dps", 1, true) ~= nil) then nil else u225,
            Value = v2,
        })
        return
    end
end

local function getDpsDisplayStats(a1, a2, a3) -- Line: 724
    -- upvalues: getSelectedOptions (val), table (val), insertDpsDisplayEntry (val)
    local Name
    local v1 = {}
    if type(a1) ~= "table" then
        return v1
    end
    local v2 = {Options = getSelectedOptions(a3 or {}), SourceStats = a2}
    local u16 = {}
    local u17 = {}

    local function addEntry(a1, a2, a3) -- Line: 741
        -- upvalues: u17 (val), table (upval), u16 (val)
        if type(a1) == "string" and not u17[a1] then
            u17[a1] = true
            table.insert(u16, {Name = a1, Data = a2, Order = a3 or (1 / 0)})
            return
        end
    end

    if a1.Default then
        local Default = a1.Default
        if not u17.Default then
            u17.Default = true
            table.insert(u16, {Name = "Default", Order = 0, Data = Default})
        end
    end
    for i, v in ipairs(a1) do
        if type(v) == "table" and v.Name then
            Name = v.Name
            if type(Name) == "string" and not u17[Name] then
                u17[Name] = true
                table.insert(u16, {Name = Name, Data = v, Order = i or (1 / 0)})
            end
        end
    end
    for k, i2 in pairs(a1) do
        if type(k) == "string" and k ~= "Default" and type(k) == "string" and not u17[k] then
            u17[k] = true
            table.insert(u16, {Order = (1 / 0), Name = k, Data = i2})
        end
    end
    table.sort(u16, function(a1, a2) -- Line: 770
        local Name = a1.Name
        local v1 = true
        if Name ~= "Default" then
            v1 = true
            if Name ~= "DPS" then
                v1 = true
                if Name ~= "Gun DPS" then
                    v1 = true
                    if Name ~= "Normal DPS" then
                        v1 = Name == "Regular DPS"
                    end
                end
            end
        end
        local v2 = if not v1 then if not (string.lower(Name):find("total dps", 1, true) ~= nil) then 1 else 2 else 0
        local Name_2 = a2.Name
        local v3 = true
        if Name_2 ~= "Default" then
            v3 = true
            if Name_2 ~= "DPS" then
                v3 = true
                if Name_2 ~= "Gun DPS" then
                    v3 = true
                    if Name_2 ~= "Normal DPS" then
                        v3 = Name_2 == "Regular DPS"
                    end
                end
            end
        end
        local v4 = if not v3 then if not (string.lower(Name_2):find("total dps", 1, true) ~= nil) then 1 else 2 else 0
        if v2 ~= v4 then
            return v2 < v4
        end
        if a1.Order ~= a2.Order then
            return a1.Order < a2.Order
        end
        return a1.Name < a2.Name
    end)
    for i3, j in ipairs(u16) do
        insertDpsDisplayEntry(v1, j.Name, j.Data, a2, v2)
    end
    return v1
end

local function getPathCount(a1) -- Line: 792
    local v1
    local v2 = 0
    local v3 = #a1.Upgrades
    for i = 1, v3 do
        v1 = a1.Upgrades[i]
        if v1[1] then
            v2 = math.max(v2, #v1)
        end
    end
    return v2
end

local function getPathStats(a1, a2, a3) -- Line: 805 -- upvalues: deepAssign (val) -- types: a2: number, a3: number?
    local v1
    local v2 = {}
    deepAssign(v2, a1.Defaults)
    if a2 < 1 then
        return v2, nil, false
    end
    local v3 = nil
    local v4 = false
    local v5, v6 = a1, a3
    for i = 1, a2 do
        v1 = v5.Upgrades[i]
        if v1 and v1[1] then
            v1 = if not v6 then nil else v1[v6]
            v4 = true
        end
        if not v1 then
            return nil, nil, v4
        end
        deepAssign(v2, v1.Stats)
        v3 = v1
    end
    return v2, v3, v4
end

local function getPathChanges(a1, a2, a3, a4, a5, a6) -- Line: 839
    -- upvalues: getPathStats (val), getBuffedValues (val), getDeltaTable (val), u179 (val), u194 (val), Icons (val)
    -- upvalues: table (val)
    local v1, v2, v3, v4, v5

    local function purgeRichText(a1) -- Line: 847 -- types: a1: string
        return (a1:gsub("<[^>]+>", ""))
    end

    local function replaceArrow(a1) -- Line: 851 -- types: a1: string
        return ((a1:gsub("->", "→")):gsub(">", "→"))
    end

    local function processLegacyText(a1) -- Line: 855
        if a1 == nil then
            return ""
        end
        return ((tostring(a1):gsub("<[^>]+>", ""):gsub("->", "→")):gsub(">", "→"))
    end

    v5, _, v1 = getPathStats(a2, a3, a4)
    if not v5 then
        return nil
    end
    local v6, v7, v8 = getPathStats(a2, a3 + 1, a4)
    if not v6 then
        v2, v3, v4 = getPathStats(a2, a3 - 1, a4)
        v5 = v2
        v1 = v4
        v2, v3, v4 = getPathStats(a2, a3, a4)
        v6 = v2
        v7 = v3
        v8 = v4
    end
    if a4 and a4 > 1 and not v1 and not v8 then
        return nil
    end
    if v5 and v6 and v7 then
        local v9, v10, v11, v12, v13
        v5 = getBuffedValues(a1, v5, a6)
        v6 = getBuffedValues(a1, v6, a6)
        v7 = getBuffedValues(a1, v7, a6)
        v2 = getDeltaTable(v5, v6)
        v3 = {}
        if v2.Detections and next(v2.Detections) then
            for k, v in pairs(v2.Detections) do
                v10 = u179[u194[k] or k]
                if v10 then
                    v11 = Icons[v10.Icon]
                    if v11 and v == true then
                        table.insert(v3, {Icon = v11, Text = v10.Text})
                    end
                end
            end
        end
        local v14, v15, v16 = a3, a2, a5
        for k2, i in pairs(v2) do
            v10 = typeof(i)
            if v10 ~= "table" and v10 ~= "boolean" then
                v11 = Icons[k2]
                if v11 then
                    v13 = v5[k2]
                    v12 = if not v13 then ("%*"):format(i) else ("%* → %*"):format(v13, i)
                    table.insert(v3, {
                        Icon = v11,
                        Text = if v12 ~= nil then (tostring(v12):gsub("<[^>]+>", ""):gsub("->", "→")):gsub(">", "→") else "",
                    })
                end
            end
        end
        if v6.Extras then
            for i2, j in ipairs(v6.Extras) do
                table.insert(v3, {
                    Text = if j ~= nil then (tostring(j):gsub("<[^>]+>", ""):gsub("->", "→")):gsub(">", "→") else "",
                })
            end
        end
        if v7.Tooltips then
            local ButtonText, Expand, Text, insert_3
            for i3, k3 in ipairs(v7.Tooltips) do
                v10 = {}
                ButtonText = k3.ButtonText
                v10.Text = if ButtonText ~= nil then (tostring(ButtonText):gsub("<[^>]+>", ""):gsub("->", "→")):gsub(">", "→") else ""
                v10.Expand = {}
                for i4, n in ipairs(k3.Content) do
                    if n.Text then
                        insert_3 = table.insert
                        Expand = v10.Expand
                        Text = n.Text
                        insert_3(
                            Expand,
                            if Text ~= nil then (tostring(Text):gsub("<[^>]+>", ""):gsub("->", "→")):gsub(">", "→") else ""
                        )
                    end
                end
                table.insert(v3, v10)
            end
        end
        v4 = {
            Level = v14,
            MaxLevel = #v15.Upgrades,
            Name = v7.Title,
            Icon = v7.Image,
            Cost = v7.Cost,
        }
        local v17 = v16 or 1
        v10 = ((v17 or 1) - 1) * 100
        local v18 = if not ((math.abs(v10)) < 0.05) then v10 else nil
        if v18 then
            local v19 = math.round(v18 * 10) / 10
            local v20 = if v19 ~= math.floor(v19) then string.format("%.1f", v19) else tostring(v19)
            local v21 = ("%*%*%%"):format(if not (v18 > 0) then "" else "+", v20)
            v9 = ("<font color=\"%*\"> (%*)</font>"):format(if not (v17 > 1) then "rgb(71, 255, 15)" else "rgb(255, 96, 96)", v21)
        else
            v9 = nil
        end
        v4.CostModifierText = v9
        v4.Stats = v3
        return v4
    end
    return nil
end

local function getCurrentStats(a1, a2, a3) -- Line: 972 -- upvalues: deepAssign (val) -- types: a2: number, a3: number?
    local v1
    local v2 = {}
    deepAssign(v2, a1.Defaults)
    if a2 < 1 then
        return v2
    end
    local v3, v4 = a1, a3
    for i = 1, a2 do
        v1 = v3.Upgrades[i]
        if v1 and v1[1] then
            v1 = if not v4 then nil else v1[v4]
        end
        if not v1 then
            break
        end
        deepAssign(v2, v1.Stats)
    end
    return v2
end

return (React.memo(function(a1, ...) -- Line: 1001
    -- upvalues: useBinding (val), useCache (val), useGameRule (val), noop (val), noopUpgrade (val), noopOption (val)
    -- upvalues: useUserSetting (val), useMemo (val), Troops (val), useEffect (val), table (val)
    -- upvalues: EvolvedTowerUnlocksUtil (val), Enum (val), getCurrentStats (val), useSkill (val), VRService (val)
    -- upvalues: getPathChanges (val), useCallback (val), u226 (val), u39 (ref), React (val), createElement (val)
    -- upvalues: UserInputService (val), useScale (val), TowerInformation (val), VerticalUpgrade (val)
    -- upvalues: HorizontalUpgrade (val), u179 (val), Icons (val), u194 (val), getBuffedValues (val), u164 (val)
    -- upvalues: getBuffedValue (val), getStatBuffData (val), insertCoordinationDamageBonusStat (val)
    -- upvalues: getDpsDisplayStats (val), getUnitNameForQueue (val), getUnitDisplayName (val), TowerUpgradeUtils (val)
    -- upvalues: TowerAbilityIcons (val)
    local OnAbility, OnOption, OnSell, OnTarget, OnUpgrade, u287, v1, v2, v3, v4
    local Alignment = a1.Alignment
    local Owns = a1.Owns
    if not Owns then
        Owns = not a1.OwnerName
    end
    local Visible = if a1.Visible == nil then true else a1.Visible
    local PlayerCash = a1.PlayerCash or useBinding(0)
    local Path = a1.Path
    local Options = a1.Options
    if not Options then
        Options = {}
    end
    local Buffs = a1.Buffs
    if not Buffs then
        Buffs = {}
    end
    local u23 = a1.Tower or "Commander"
    local u25 = a1.Golden or false
    local u27 = a1.Damage or 0
    local u29 = a1.Spent or 0
    local u31 = a1.Ammo or 0
    local u33 = a1.MaxAmmo or 0
    local Model = a1.Model
    local Name = Model
    if Name then
        Name = Model.Name
    end
    local v5 = a1.Unsellable == true
    local u44 = useCache("TowerExp", {})
    local u48 = useGameRule("ProgressionDisabled", false)
    local u52 = useGameRule("UpgradeCostMultiplier", 1)
    local v6 = useGameRule("TowerRangeMultiplier", 1)
    if not Owns then
        OnAbility = noop
    else
        OnAbility = a1.OnAbility
        if not OnAbility then
            OnAbility = noop
        end
    end
    if not Owns then
        OnUpgrade = noopUpgrade
    else
        OnUpgrade = a1.OnUpgrade
        if not OnUpgrade then
            OnUpgrade = noopUpgrade
        end
    end
    if not Owns then
        OnSell = noop
    else
        OnSell = a1.OnSell
        if not OnSell then
            OnSell = noop
        end
    end
    if not Owns then
        OnTarget = noop
    else
        OnTarget = a1.OnTarget
        if not OnTarget then
            OnTarget = noop
        end
    end
    if not Owns then
        OnOption = noopOption
    else
        OnOption = a1.OnOption
        if not OnOption then
            OnOption = noopOption
        end
    end
    local v7 = useUserSetting("Prefer Vertical Upgrades")
    local v8, u109 = useBinding(u31)
    local v9, u125 = useBinding(u33)
    local v10 = {u23}
    local u142 = useMemo(function() -- Line: 1033 -- upvalues: Troops (upval), u23 (val)
        return assert(Troops(u23), (("Tower %* does not exist"):format(u23)))
    end, v10)
    local TowerDisplayName = a1.TowerDisplayName or u142.Properties.DisplayName or u23
    local u151, u152 = useBinding(false)
    local v11 = {Visible}
    useEffect(function() -- Line: 1040 -- upvalues: Visible (val), u152 (val)
        if not Visible then
            u152(false)
        end
    end, v11)
    v11 = {u25, u142}
    local u195 = useMemo(function() -- Line: 1046 -- upvalues: u25 (val), u142 (val), u23 (val)
        if u25 then
            return assert(u142.Stats.Golden, (("Tower %* does not have golden stats"):format(u23)))
        end
        return u142.Stats.Default
    end, v11)
    local v12 = useMemo
    local v13 = {u195, a1.gameMode}
    local u202 = v12(function() -- Line: 1053 -- upvalues: u195 (val), table (upval), a1 (val)
        local v1 = {}
        local Abilities = u195.Defaults.Abilities or {}
        local v2 = nil
        local v3 = nil
        for i, j in Abilities, v2, v3 do
            if not j.ExcludeModes or not table.find(j.ExcludeModes, a1.gameMode) then
                table.insert(v1, j)
            end
        end
        return v1
    end, v13)
    local u209 = math.clamp(a1.Level or 0, 0, #u195.Upgrades)
    local v14 = {u44}
    local u225 = useMemo(function() -- Line: 1068 -- upvalues: u44 (val)
        return {TowerExp = u44}
    end, v14)

    local function isNextUpgradeLocked(a1) -- Line: 1074
        -- upvalues: u48 (val), u209 (val), u195 (val), EvolvedTowerUnlocksUtil (upval), u225 (val), u23 (val)
        if not u48 and not (#u195.Upgrades <= u209) then
            return not EvolvedTowerUnlocksUtil.canAccessUpgrade(u225, u23, u209 + 1, a1)
        end
        return false
    end

    local function getNextUpgradePath(a1) -- Line: 1087 -- upvalues: u195 (val), u209 (val) -- types: a1: number
        local v1 = u195.Upgrades[u209 + 1]
        if v1 and v1[1] then
            return a1
        end
        return nil
    end

    local v15, u268 = useBinding({Level = u209, TotalCost = u29, TotalDamage = u27})
    local StatusEffects = a1.StatusEffects
    local v16 = StatusEffects and StatusEffects[Enum.StatusEffect.Coordination]
    if type(v16) == "table" then
        local value = v16.value or v16.Value
        u287 = if type(value) ~= "number" then 0 else value
    else
        u287 = 0
    end
    local v17 = {u195, Path, u209, u287}
    local u320 = useMemo(function() -- Line: 1103
        -- upvalues: getCurrentStats (upval), u195 (val), u209 (val), Path (val), table (upval), u287 (val)
        local v1 = getCurrentStats(u195, u209, Path)
        v1.Attributes = table.merge({}, v1.Attributes or {}, {CoordinationDamageBonus = u287})
        return v1
    end, v17)
    local v18 = {u195}
    local u369 = useMemo(function() -- Line: 1112 -- upvalues: u195 (val)
        if u195.Defaults.Sellback then
            return u195.Defaults.Sellback()
        end
        return 0.3333333333333333
    end, v18)
    local u361 = 1
    v18 = useGameRule("SkillsEnabled", true)
    local v19 = useGameRule("Skills", {})
    _, v1 = useSkill(Enum.SkillTreeNode.EnhancedOptics)
    _, v2 = useSkill(Enum.SkillTreeNode.ResellValue)
    _, v3 = useSkill(Enum.SkillTreeNode.ExpandedBarracks)
    local u355 = 0
    if v18 then
        if v19.EnhancedOptics then
            u355 = v1 or 0
        end
        if v19.ExpandedBarracks then
            u361 = u361 - v3 / 100
        end
        if v19.ResellValue then
            u369 = u369 + v2 / 100
        end
    end
    local v20, u390 = useBinding(if not a1.IsFullRefund then u29 * u369 else u29)
    if not Alignment then
        Alignment = if not v7 then "Horizontal" else if VRService.VREnabled then "Horizontal" else "Vertical"
    end
    local v21 = {Buffs, u195, u209, Path, u225, u23, u48, u52, v6, u355}
    local u555 = useMemo(function() -- Line: 1155
        -- upvalues: getPathChanges (upval), Buffs (val), u195 (val), u209 (val), u52 (val), u355 (ref), Path (val)
        -- upvalues: u48 (val), EvolvedTowerUnlocksUtil (upval), u225 (val), u23 (val)
        local v1 = getPathChanges(Buffs, u195, u209, 1, u52, u355)
        if v1 then
            local v2, v3, v4
            if not Path or not (Path > 0) then
                v4 = u195.Upgrades[u209 + 1]
                v3 = if not v4 then nil else if not v4[1] then nil else 1
                v2 = if u48 then false else if not (#u195.Upgrades <= u209) then not EvolvedTowerUnlocksUtil.canAccessUpgrade(u225, u23, u209 + 1, v3) else false
            else
                v2 = true
                if Path == 1 then
                    v4 = u195.Upgrades[u209 + 1]
                    v3 = if not v4 then nil else if not v4[1] then nil else 1
                    v2 = if u48 then false else if not (#u195.Upgrades <= u209) then not EvolvedTowerUnlocksUtil.canAccessUpgrade(u225, u23, u209 + 1, v3) else false
                end
            end
            v1.Locked = v2
        end
        return v1
    end, v21)
    local v22 = {Buffs, u195, u209, Path, u225, u23, u48, u52, v6, u355}
    local u569 = useMemo(function() -- Line: 1184
        -- upvalues: u195 (val), getPathChanges (upval), Buffs (val), u209 (val), u52 (val), u355 (ref), Path (val)
        -- upvalues: u48 (val), EvolvedTowerUnlocksUtil (upval), u225 (val), u23 (val)
        local v1, v2
        local v3 = u195
        local v4 = 0
        local v5 = #v3.Upgrades
        for i = 1, v5 do
            v2 = v3.Upgrades[i]
            if v2[1] then
                v4 = math.max(v4, #v2)
            end
        end
        if v4 < 2 then
            return nil
        end
        v4 = getPathChanges(Buffs, u195, u209, 2, u52, u355)
        if not v4 then
            return nil
        end
        if not Path or not (Path > 0) then
            v1 = u195.Upgrades[u209 + 1]
            v5 = if not v1 then nil else if not v1[1] then nil else 2
            v3 = if u48 then false else if not (#u195.Upgrades <= u209) then not EvolvedTowerUnlocksUtil.canAccessUpgrade(u225, u23, u209 + 1, v5) else false
        else
            v3 = true
            if Path == 2 then
                v1 = u195.Upgrades[u209 + 1]
                v5 = if not v1 then nil else if not v1[1] then nil else 2
                v3 = if u48 then false else if not (#u195.Upgrades <= u209) then not EvolvedTowerUnlocksUtil.canAccessUpgrade(u225, u23, u209 + 1, v5) else false
            end
        end
        v4.Locked = v3
        return v4
    end, v22)
    v21 = useEffect
    local v23 = {u209, u29, u27, Path, u31, u33, a1.IsFullRefund}
    v21(function() -- Line: 1219
        -- upvalues: u268 (val), u209 (val), u29 (val), u27 (val), u390 (val), a1 (val), u369 (ref), u109 (val)
        -- upvalues: u31 (val), u125 (val), u33 (val)
        u268({Level = u209, TotalCost = u29, TotalDamage = u27})
        u390(if not a1.IsFullRefund then u29 * u369 else u29)
        u109(u31)
        u125(u33)
    end, v23)
    v21 = if not Path or not (Path > 0) then nil else string.char(96 + Path)
    v22 = if not Path then tonumber(u209) else ("%*%*"):format(u209, v21)
    v23 = useCallback(function() -- Line: 1234 -- upvalues: u152 (val)
        u152(false)
    end, {})
    local v24 = useCallback(function() -- Line: 1238 -- upvalues: u152 (val), u151 (val)
        u152(not u151:getValue())
    end, {})
    local v25 = {OnTarget}
    local v26 = useCallback(function(a1) -- Line: 1242 -- upvalues: OnTarget (val), u226 (upval) -- types: a1: string
        local v1
        for k, v in pairs(u226) do
            if v == a1 then
                OnTarget(k)
                return
            end
        end
        v1(nil)
    end, v25)
    local v27 = {Owns, u209, u195, u569, u555, OnUpgrade}
    local v28 = useCallback(function(a1, a2) -- Line: 1246
        -- upvalues: Owns (val), u39 (upval), u209 (val), u195 (val), u569 (val), u555 (val), OnUpgrade (val)
        if not Owns then
            u39.Create({Text = "You can only upgrade your tower!", Color = Color3.fromRGB(236, 0, 0)})
            return
        end
        if not a1 then
            u39.Create({Text = "You cannot afford this upgrade!", Color = Color3.fromRGB(255, 0, 0)})
            return
        end
        if #u195.Upgrades <= u209 then
            u39.Create({Text = "Your tower is already max level!", Color = Color3.fromRGB(255, 0, 0)})
            return
        end
        local v1 = a2 and u569 or u555
        local v2 = if not a2 then 1 else 2
        local Cost = v1 and v1.Cost or 0
        local v3 = u195.Upgrades[u209 + 1]
        OnUpgrade(Cost, if not v3 then nil else if not v3[1] then nil else v2)
    end, v27)
    local v29 = {Owns, OnSell}
    v25 = useCallback(function() -- Line: 1282 -- upvalues: Owns (val), u39 (upval), OnSell (val)
        if not Owns then
            u39.Create({Text = "You can only sell your tower!", Color = Color3.fromRGB(236, 0, 0)})
            return
        end
        OnSell()
    end, v29)
    local Properties = u142.Properties or {}
    local SkinData = Properties.SkinData and Properties.SkinData[Name or "Default"]
    local Preview = Properties.Preview or {}
    local Icon = if not SkinData then Preview.Icon else if SkinData.Icon == 0 then Preview.Icon else SkinData.Icon
    local createElement_2 = React.createElement
    local Fragment = React.Fragment
    local v30 = {}
    local v31 = {
        BackgroundTransparency = 1,
        Text = "Double Tap to Place",
        TextScaled = true,
        TextSize = 14,
        TextStrokeTransparency = 0.8,
        TextWrapped = true,
    }
    local TouchEnabled = false
    if a1.Model ~= nil then
        TouchEnabled = false
        if a1.Visible == false then
            TouchEnabled = UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled
        end
    end
    v31.Visible = TouchEnabled
    v31.AnchorPoint = Vector2.new(0.5, 1)
    v31.Position = UDim2.new(0.5, 0, 1, -95 * useScale(2, nil, true))
    v31.Size = UDim2.new(0.5, 0, 0, 20)
    v31.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    v31.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
    v31.TextColor3 = Color3.fromRGB(255, 255, 255)
    v30.mobile = createElement("TextLabel", v31)
    local TowerInformation_2 = u142.TowerInformation
    if TowerInformation_2 then
        v31 = {}
        v4 = u25 and u142.TowerInformation.Golden and u142.TowerInformation.Golden[v22] or u142.TowerInformation[v22] or u142.TowerInformation[0]
        v31.plotData = v4
        v31.upgradeOptions = u142.UpgradeOptions or nil
        v31.towerAsset = u142
        v31.towerIcon = Icon
        v31.towerModel = Model
        v31.towerName = TowerDisplayName
        v31.towerRole = if not Properties.Role then nil else Enum.TowerRole.ToString(Properties.Role)
        v31.towerSkin = Name
        v31.towerStats = u320
        v31.statusEffects = a1.StatusEffects
        v31.towerInformationEnabled = u151
        v31.level = u209
        v31.path = Path
        v31.onClose = v23
        TowerInformation_2 = createElement(TowerInformation, v31)
    end
    v30.towerInformation = TowerInformation_2
    local Fragment_2 = if not Visible then React.Fragment else not (Alignment ~= "Vertical") and VerticalUpgrade or HorizontalUpgrade or React.Fragment
    v31 = {
        Visible = Visible,
        Valid = a1.Valid,
        TowersSelection = a1.TowersSelection,
        TowersSelectionAmount = a1.TowersSelectionAmount,
        TowersSelected = a1.TowersSelected,
        TowerName = u23,
        TowerDisplayName = TowerDisplayName,
        TowerModel = Model,
        UID = a1.UID,
        TowerLevel = u209,
        TowerPath = Path,
        Hologram = a1.Hologram,
        PlayerCash = PlayerCash,
        TowerInformationEnabled = u151,
        ToggleInformation = v24,
        TowerTarget = u226[a1.Target],
        hideTargetingMode = u320.HideTargetingMode,
    }
    v4 = useMemo
    local v32 = {u320, a1.StatusEffects}
    v31.TowerDetections = v4(function() -- Line: 1381 -- upvalues: u179 (upval), Icons (upval), table (upval), u320 (val), u194 (upval), a1 (val)
        local u0 = {}
        local u1 = {}

        local function addBadge(a1) -- Line: 1385
            -- upvalues: u179 (upval), u1 (val), Icons (upval), table (upval), u0 (val)
            local v1 = u179[a1]
            if v1 and not u1[v1.Name] then
                local v2 = Icons[v1.Icon]
                if v2 then
                    table.insert(u0, {Name = v1.Name, Icon = v2})
                    u1[v1.Name] = true
                end
                return
            end
        end

        for i, j in u320.Detections or {} do
            if j then
                addBadge(u194[i] or i)
            end
        end
        for k, n in a1.StatusEffects or {} do
            addBadge(k)
        end
        return u0
    end, v32)
    v31.TowerActiveStats = v15
    v32 = {Buffs, u320, v6, u355}
    v31.TowerStats = useMemo(function() -- Line: 1431
        -- upvalues: getBuffedValues (upval), Buffs (val), u320 (val), u355 (ref), table (upval), u164 (upval)
        -- upvalues: getBuffedValue (upval), getStatBuffData (upval), insertCoordinationDamageBonusStat (upval)
        local v1 = getBuffedValues(Buffs, u320, u355)
        local v2 = table.reduce(v1, function(a1, a2, a3) -- Line: 1435
            -- upvalues: u164 (upval), getBuffedValue (upval), Buffs (upval), u320 (upval), u355 (upval)
            -- upvalues: getStatBuffData (upval), table (upval)
            if u164[a3] then
                local v1 = getBuffedValue(Buffs, a3, u320[a3], u355)
                local v2 = getStatBuffData(a3, u320[a3], v1)
                table.insert(a1, {
                    Icon = u164[a3],
                    Value = a2,
                    BuffText = v2 and v2.Text,
                    BuffColor = v2 and v2.Color,
                })
            end
            return a1
        end, {})
        insertCoordinationDamageBonusStat(v2, v1)
        return v2
    end, v32)
    v32 = {Buffs, u320, u142, Options, v6, u355}
    v31.TowerDPSStats = useMemo(function() -- Line: 1457
        -- upvalues: getBuffedValues (upval), Buffs (val), u320 (val), u355 (ref), u142 (val)
        -- upvalues: getDpsDisplayStats (upval), Options (val)
        return (getDpsDisplayStats((u142.Properties or {}).DPS_Display, getBuffedValues(Buffs, u320, u355), Options))
    end, v32)
    v31.TowerSellValue = v20
    v4 = useCallback
    v32 = {
        u202,
        u142,
        Name,
        u320,
        u209,
        Path,
        Options,
        a1.UID,
        a1.Inflation,
        Model,
        u25,
        u361,
        OnAbility,
        OnOption,
    }
    v31.BuildTowerActions = v4(function(a1_2) -- Line: 1474
        -- upvalues: Options (val), table (upval), getUnitNameForQueue (upval), u320 (val), getUnitDisplayName (upval)
        -- upvalues: u25 (val), u361 (ref), u202 (val), u209 (val), TowerUpgradeUtils (upval), Path (val), a1 (val)
        -- upvalues: Model (val), TowerAbilityIcons (upval), u142 (val), Name (val), OnAbility (val), OnOption (val)
        local insert, insert_2, v1, v2, v3, v4, v5, v6
        local Units = a1_2.Units or {}
        local AbilityAmmoStore = a1_2.AbilityAmmoStore
        if not AbilityAmmoStore then
            AbilityAmmoStore = {}
        end
        local DisabledAbilities = a1_2.DisabledAbilities
        if not DisabledAbilities then
            DisabledAbilities = {}
        end
        local GlobalOptionsCoolDown = if not a1_2.GlobalOptionsCoolDown then nil else if not (0 < a1_2.GlobalOptionsCoolDown) then nil else a1_2.GlobalOptionsCoolDown
        local v7 = a1_2.GlobalOptionsStart or nil
        local u19 = {}
        local u306 = 1
        local v8 = {}
        local v9 = {}
        for i, j in Options do
            if j.QueueName then
                u19[(j.QueueName:gsub(" ", "_"))] = true
            end
        end
        local v10 = table.reduce(Units, function(a1, a2) -- Line: 1496
            -- upvalues: u19 (val), getUnitNameForQueue (upval), u320 (upval), u306 (ref), table (upval)
            -- upvalues: getUnitDisplayName (upval), u25 (upval), u361 (upval)
            if u19[a2.id] then
                return a1
            end
            local v1, v2 = getUnitNameForQueue(a2.id, u320)
            u306 = u306 + 1
            local insert = table.insert
            local v3 = {Name = a2.id, UnitName = v1}
            local v4 = getUnitDisplayName(v1, u25) or v2 or v1:gsub("_", " ")
            v3.DisplayName = v4
            v3.LayoutOrder = u306
            v3.Interval = a2.interval * u361
            v3.StartTick = a2.started
            insert(a1, v3)
            return a1
        end, {})
        local v11 = table.reduce(u202, function(a1_2, a2) -- Line: 1521
            -- upvalues: u209 (upval), TowerUpgradeUtils (upval), Path (upval), AbilityAmmoStore (val), a1 (upval)
            -- upvalues: u306 (ref), table (upval), Model (upval), TowerAbilityIcons (upval), u142 (upval), Name (upval)
            -- upvalues: DisabledAbilities (val), OnAbility (upval)
            if a2.Level then
                local Level = a2.Level
                if u209 < Level then
                    return a1_2
                end
            end
            if not TowerUpgradeUtils.matchesPath(a2, Path) then
                return a1_2
            end
            local v1 = AbilityAmmoStore[a2.Name .. a1.UID] or {}
            u306 = u306 + 1
            local insert = table.insert
            local v2 = {LayoutOrder = u306, Name = a2.Name}
            local DisplayName = a2.DisplayName or a2.Name
            v2.DisplayName = DisplayName
            v2.Description = a2.Description
            v2.Model = Model
            local Price_2 = if not a1.Inflation or not a2.Price then a2.Price else math.round(a2.Price * 1.5)
            v2.Price = Price_2
            v2.Icon = TowerAbilityIcons.getIcon(u142, Name, a2)
            v2.Level = a2.Level
            v2.CoolDown = a2.Debounce or 0
            v2.Interval = v1.interval
            v2.StartTick = v1.startTick
            v2.ForcedLocked = DisabledAbilities[a2.Name]
            v2.Ammo = v1.ammo
            v2.MaxAmmo = v1.maxAmmo

            function v2.OnActivated() -- Line: 1556 -- upvalues: OnAbility (upval), a2 (val)
                return OnAbility(a2.Name)
            end

            insert(a1_2, v2)
            return a1_2
        end, {})
        local v12 = nil
        local v13 = nil
        for k, n in Options, v12, v13 do
            if not n.QueueName then
                v1 = true
                v3 = nil
                v4 = nil
                for m, i5 in n.Values, v3, v4 do
                    v6 = Path
                    if not (if not i5.Level then not TowerUpgradeUtils.matchesPath(i5, v6) else if not (u209 < i5.Level) then not TowerUpgradeUtils.matchesPath(i5, v6) else true) then
                        break
                    end
                end
                if not next(n.Values) then
                    u306 = u306 + 1
                    insert_2 = table.insert
                    v4 = {Name = n.Name, LayoutOrder = u306, Level = u209}
                    for i6, i7 in n.Values do
                        if i7.Value == n.Selected then
                            v4.Selected = i6

                            function v4.OnSelected(a1, a2) -- Line: 1600 -- upvalues: OnOption (upval), n (val)
                                OnOption(n.Name, a2.Name, a2.Value)
                            end

                            v4.Options = table.reduce(n.Values, function(a1, a2) -- Line: 1604 -- upvalues: table (upval), u209 (upval), Path (upval), TowerUpgradeUtils (upval)
                                local insert = table.insert
                                local v1 = {Name = a2.Name, Icon = a2.Icon, Level = a2.Level}
                                local v2 = Path
                                v1.Locked = if not a2.Level then not TowerUpgradeUtils.matchesPath(a2, v2) else if not (u209 < a2.Level) then not TowerUpgradeUtils.matchesPath(a2, v2) else true
                                v1.Value = a2.Value
                                v1.Tooltip = a2.Tooltip
                                insert(a1, v1)
                                return a1
                            end, {})
                            v4.Interval = GlobalOptionsCoolDown
                            v4.StartTick = GlobalOptionsCoolDown and v7
                            insert_2(v8, v4)
                            u306 = u306 + 1
                            break
                        end
                    end
                    v4.Selected = 1

                    function v4.OnSelected(a1, a2) -- Line: 1600 -- upvalues: OnOption (upval), n (val)
                        OnOption(n.Name, a2.Name, a2.Value)
                    end

                    v4.Options = table.reduce(n.Values, function(a1, a2) -- Line: 1604 -- upvalues: table (upval), u209 (upval), Path (upval), TowerUpgradeUtils (upval)
                        local insert = table.insert
                        local v1 = {Name = a2.Name, Icon = a2.Icon, Level = a2.Level}
                        local v2 = Path
                        v1.Locked = if not a2.Level then not TowerUpgradeUtils.matchesPath(a2, v2) else if not (u209 < a2.Level) then not TowerUpgradeUtils.matchesPath(a2, v2) else true
                        v1.Value = a2.Value
                        v1.Tooltip = a2.Tooltip
                        insert(a1, v1)
                        return a1
                    end, {})
                    v4.Interval = GlobalOptionsCoolDown
                    v4.StartTick = GlobalOptionsCoolDown and v7
                    insert_2(v8, v4)
                    u306 = u306 + 1
                elseif not v1 then
                    u306 = u306 + 1
                    insert_2 = table.insert
                    v4 = {Name = n.Name, LayoutOrder = u306, Level = u209}
                    for i8, i9 in n.Values do
                        if i9.Value == n.Selected then
                            v4.Selected = i8

                            function v4.OnSelected(a1, a2) -- Line: 1600 -- upvalues: OnOption (upval), n (val)
                                OnOption(n.Name, a2.Name, a2.Value)
                            end

                            v4.Options = table.reduce(n.Values, function(a1, a2) -- Line: 1604 -- upvalues: table (upval), u209 (upval), Path (upval), TowerUpgradeUtils (upval)
                                local insert = table.insert
                                local v1 = {Name = a2.Name, Icon = a2.Icon, Level = a2.Level}
                                local v2 = Path
                                v1.Locked = if not a2.Level then not TowerUpgradeUtils.matchesPath(a2, v2) else if not (u209 < a2.Level) then not TowerUpgradeUtils.matchesPath(a2, v2) else true
                                v1.Value = a2.Value
                                v1.Tooltip = a2.Tooltip
                                insert(a1, v1)
                                return a1
                            end, {})
                            v4.Interval = GlobalOptionsCoolDown
                            v4.StartTick = GlobalOptionsCoolDown and v7
                            insert_2(v8, v4)
                            u306 = u306 + 1
                            break
                        end
                    end
                    v4.Selected = 1

                    function v4.OnSelected(a1, a2) -- Line: 1600 -- upvalues: OnOption (upval), n (val)
                        OnOption(n.Name, a2.Name, a2.Value)
                    end

                    v4.Options = table.reduce(n.Values, function(a1, a2) -- Line: 1604 -- upvalues: table (upval), u209 (upval), Path (upval), TowerUpgradeUtils (upval)
                        local insert = table.insert
                        local v1 = {Name = a2.Name, Icon = a2.Icon, Level = a2.Level}
                        local v2 = Path
                        v1.Locked = if not a2.Level then not TowerUpgradeUtils.matchesPath(a2, v2) else if not (u209 < a2.Level) then not TowerUpgradeUtils.matchesPath(a2, v2) else true
                        v1.Value = a2.Value
                        v1.Tooltip = a2.Tooltip
                        insert(a1, v1)
                        return a1
                    end, {})
                    v4.Interval = GlobalOptionsCoolDown
                    v4.StartTick = GlobalOptionsCoolDown and v7
                    insert_2(v8, v4)
                    u306 = u306 + 1
                end
            end
        end
        v12 = nil
        v13 = nil
        for i10, i11 in Options, v12, v13 do
            if i11.QueueName then
                v1 = nil
                v2 = i11.QueueName:gsub(" ", "_")
                for i2, v in ipairs(Units) do
                    if v.id == v2 then
                        v1 = v
                        break
                    end
                end
                if v1 then
                    u306 = u306 + 1
                    insert = table.insert
                    v4 = v9
                    v5 = {
                        HideSelectedName = true,
                        HideOptionNames = true,
                        Name = i11.QueueName,
                        LayoutOrder = u306,
                        Level = u209,
                    }
                    for i12, i13 in i11.Values do
                        if i13.Value == i11.Selected then
                            v5.Selected = i12

                            function v5.OnSelected(a1, a2) -- Line: 1660 -- upvalues: OnOption (upval), i11 (val)
                                OnOption(i11.Name, a2.Name, a2.Value)
                            end

                            v5.Options = table.reduce(i11.Values, function(a1, a2) -- Line: 1667 -- upvalues: table (upval), u209 (upval), Path (upval), TowerUpgradeUtils (upval)
                                local insert = table.insert
                                local v1 = {Name = a2.Name, Icon = a2.Icon, Level = a2.Level}
                                local v2 = Path
                                v1.Locked = if not a2.Level then not TowerUpgradeUtils.matchesPath(a2, v2) else if not (u209 < a2.Level) then not TowerUpgradeUtils.matchesPath(a2, v2) else true
                                v1.Value = a2.Value
                                v1.Tooltip = a2.Tooltip
                                insert(a1, v1)
                                return a1
                            end, {})
                            v5.Interval = GlobalOptionsCoolDown or v1.interval
                            v5.StartTick = GlobalOptionsCoolDown and v7 or v1.started
                            insert(v4, v5)
                            break
                        end
                    end
                    v5.Selected = 1

                    function v5.OnSelected(a1, a2) -- Line: 1660 -- upvalues: OnOption (upval), i11 (val)
                        OnOption(i11.Name, a2.Name, a2.Value)
                    end

                    v5.Options = table.reduce(i11.Values, function(a1, a2) -- Line: 1667 -- upvalues: table (upval), u209 (upval), Path (upval), TowerUpgradeUtils (upval)
                        local insert = table.insert
                        local v1 = {Name = a2.Name, Icon = a2.Icon, Level = a2.Level}
                        local v2 = Path
                        v1.Locked = if not a2.Level then not TowerUpgradeUtils.matchesPath(a2, v2) else if not (u209 < a2.Level) then not TowerUpgradeUtils.matchesPath(a2, v2) else true
                        v1.Value = a2.Value
                        v1.Tooltip = a2.Tooltip
                        insert(a1, v1)
                        return a1
                    end, {})
                    v5.Interval = GlobalOptionsCoolDown or v1.interval
                    v5.StartTick = GlobalOptionsCoolDown and v7 or v1.started
                    insert(v4, v5)
                elseif v7 and GlobalOptionsCoolDown then
                    u306 = u306 + 1
                    insert = table.insert
                    v4 = v9
                    v5 = {
                        HideSelectedName = true,
                        HideOptionNames = true,
                        Name = i11.QueueName,
                        LayoutOrder = u306,
                        Level = u209,
                    }
                    for i14, i15 in i11.Values do
                        if i15.Value == i11.Selected then
                            v5.Selected = i14

                            function v5.OnSelected(a1, a2) -- Line: 1660 -- upvalues: OnOption (upval), i11 (val)
                                OnOption(i11.Name, a2.Name, a2.Value)
                            end

                            v5.Options = table.reduce(i11.Values, function(a1, a2) -- Line: 1667 -- upvalues: table (upval), u209 (upval), Path (upval), TowerUpgradeUtils (upval)
                                local insert = table.insert
                                local v1 = {Name = a2.Name, Icon = a2.Icon, Level = a2.Level}
                                local v2 = Path
                                v1.Locked = if not a2.Level then not TowerUpgradeUtils.matchesPath(a2, v2) else if not (u209 < a2.Level) then not TowerUpgradeUtils.matchesPath(a2, v2) else true
                                v1.Value = a2.Value
                                v1.Tooltip = a2.Tooltip
                                insert(a1, v1)
                                return a1
                            end, {})
                            v5.Interval = GlobalOptionsCoolDown or v1.interval
                            v5.StartTick = GlobalOptionsCoolDown and v7 or v1.started
                            insert(v4, v5)
                            break
                        end
                    end
                    v5.Selected = 1

                    function v5.OnSelected(a1, a2) -- Line: 1660 -- upvalues: OnOption (upval), i11 (val)
                        OnOption(i11.Name, a2.Name, a2.Value)
                    end

                    v5.Options = table.reduce(i11.Values, function(a1, a2) -- Line: 1667 -- upvalues: table (upval), u209 (upval), Path (upval), TowerUpgradeUtils (upval)
                        local insert = table.insert
                        local v1 = {Name = a2.Name, Icon = a2.Icon, Level = a2.Level}
                        local v2 = Path
                        v1.Locked = if not a2.Level then not TowerUpgradeUtils.matchesPath(a2, v2) else if not (u209 < a2.Level) then not TowerUpgradeUtils.matchesPath(a2, v2) else true
                        v1.Value = a2.Value
                        v1.Tooltip = a2.Tooltip
                        insert(a1, v1)
                        return a1
                    end, {})
                    v5.Interval = GlobalOptionsCoolDown or v1.interval
                    v5.StartTick = GlobalOptionsCoolDown and v7 or v1.started
                    insert(v4, v5)
                end
            end
        end
        return {Powers = v8, Abilities = v11, UnitSelectors = v9, UnitIndicators = v10}
    end, v32)
    v31.CanEditTower = Owns
    v31.CanSellTower = not v5
    v31.ShowTowerAmmo = u33 > 0
    v31.TowerAmmo = v8
    v31.TowerMaxAmmo = v9
    v31.TopUpgradePath = u555
    v31.BottomUpgradePath = u569
    v31.OnTarget = v26
    v31.OnUpgrade = v28
    v31.OnSell = v25
    v30.upgrades = createElement(Fragment_2, v31, ...)
    return (createElement_2(Fragment, {}, v30))
end, function(a1, a2) -- Line: 1726 -- upvalues: table (val)
    local v1 = false
    if a1.Alignment == a2.Alignment then
        v1 = false
        if a1.Owns == a2.Owns then
            v1 = false
            if a1.OwnerName == a2.OwnerName then
                v1 = false
                if a1.Visible == a2.Visible then
                    v1 = false
                    if a1.PlayerCash == a2.PlayerCash then
                        v1 = false
                        if a1.Path == a2.Path then
                            v1 = false
                            if a1.Valid == a2.Valid then
                                v1 = table.shallowCompare(a1.Buffs or {}, a2.Buffs or {})
                                if v1 then
                                    v1 = false
                                    if a1.Tower == a2.Tower then
                                        v1 = false
                                        if a1.TowerDisplayName == a2.TowerDisplayName then
                                            v1 = false
                                            if a1.Target == a2.Target then
                                                v1 = false
                                                if a1.Golden == a2.Golden then
                                                    v1 = false
                                                    if a1.Damage == a2.Damage then
                                                        v1 = false
                                                        if a1.Spent == a2.Spent then
                                                            v1 = false
                                                            if a1.IsFullRefund == a2.IsFullRefund then
                                                                v1 = false
                                                                if a1.Ammo == a2.Ammo then
                                                                    v1 = false
                                                                    if a1.MaxAmmo == a2.MaxAmmo then
                                                                        v1 = false
                                                                        if a1.Model == a2.Model then
                                                                            v1 = false
                                                                            if a1.Locked == a2.Locked then
                                                                                v1 = false
                                                                                if a1.Options == a2.Options then
                                                                                    v1 = false
                                                                                    if a1.Abilities == a2.Abilities then
                                                                                        v1 = false
                                                                                        if a1.UID == a2.UID then
                                                                                            v1 = false
                                                                                            if a1.StatusEffects == a2.StatusEffects then
                                                                                                v1 = false
                                                                                                if a1.Hologram == a2.Hologram then
                                                                                                    v1 = false
                                                                                                    if a1.TowersSelected == a2.TowersSelected then
                                                                                                        v1 = false
                                                                                                        if a1.TowersSelection == a2.TowersSelection then
                                                                                                            v1 = false
                                                                                                            if a1.TowersSelectionAmount == a2.TowersSelectionAmount then
                                                                                                                v1 = false
                                                                                                                if a1.Unsellable == a2.Unsellable then
                                                                                                                    v1 = false
                                                                                                                    if a1.Inflation == a2.Inflation then
                                                                                                                        v1 = a1.gameMode == a2.gameMode
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
                            end
                        end
                    end
                end
            end
        end
    end
    return v1
end))