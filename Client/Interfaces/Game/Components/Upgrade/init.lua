-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.Upgrade
-- Decompile time: 17.66 ms

local applyBuffs, deepAssign, deepCompare, u50
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local v1 = RunService:IsRunning()
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
local GameRules = require(ReplicatedStorage.Shared.Modules.GameRules)
local table = require(ReplicatedStorage.Shared.Modules.Utils.table)
local u34 = nil
if not v1 then
    u50 = {}

    function u50.Create(...) end
else
    u34 = ReplicatedStorage:WaitForChild("State")
    u50 = require(ReplicatedStorage.Client.Modules.Universal.Interface.Components.Notification)
end
local Icons = require(ReplicatedStorage.Client.Interfaces.Icons)
local SettingsStore = require(ReplicatedStorage.Client.Interfaces.Stores.Shared.SettingsStore)
local useCharmSelector = require(ReplicatedStorage.Client.Interfaces.Hooks.useCharmSelector)
local useGameRule = require(ReplicatedStorage.Client.Interfaces.Hooks.useGameRule)
local useMediaQuery = require(ReplicatedStorage.Client.Interfaces.Hooks.useMediaQuery)
local useScale = require(ReplicatedStorage.Client.Interfaces.Hooks.useScale)
local React = require(ReplicatedStorage.Shared.UI.React)
local TowerAbilityIcons = require(ReplicatedStorage.Shared.Modules.TowerAbilityIcons)
local TowerUpgradeUtils = require(ReplicatedStorage.Shared.Modules.TowerUpgradeUtils)
local Troops = require(ReplicatedStorage.Shared.Modules.Asset.Handlers.Troops)
local createElement = React.createElement
local useState = React.useState
local useRef = React.useRef
local useEffect = React.useEffect
local u115 = {}
u115.Horizontal = require(ReplicatedStorage.Client.Interfaces.Game.Components.Upgrade.Alignments.HorizontalUpgrade)
u115.Vertical = require(ReplicatedStorage.Client.Interfaces.Game.Components.Upgrade.Alignments.VerticalUpgrade)
local u152 = table.freeze({
    Enum.TargetingMode.First,
    Enum.TargetingMode.Last,
    Enum.TargetingMode.Strongest,
    Enum.TargetingMode.Weakest,
    Enum.TargetingMode.Closest,
    Enum.TargetingMode.Farthest,
    Enum.TargetingMode.Random,
})
local u153 = {
    [Enum.TargetingMode.First] = "First Enemy",
    [Enum.TargetingMode.Last] = "Last Enemy",
    [Enum.TargetingMode.Strongest] = "Strongest",
    [Enum.TargetingMode.Weakest] = "Weakest",
    [Enum.TargetingMode.Closest] = "Closest",
    [Enum.TargetingMode.Farthest] = "Farthest",
    [Enum.TargetingMode.Random] = "Random",
}
local u175 = {
    HiddenDetection = {Icon = "Hidden", Text = "Hidden Detection"},
    FlyingDetection = {Icon = "Flying", Text = "Flying Detection"},
    LeadDetection = {Icon = "Lead", Text = "Lead Detection"},
    FreezeImmune = {Icon = "FreezeImmune", Text = "Freeze Immunity"},
    StunImmune = {Icon = "StunImmune", Text = "Stun Immunity"},
}
local u181 = {}
u181["Military Base"] = UDim2.fromScale(0, -0.15)
u181["Mecha Base"] = UDim2.fromScale(-0.05, -0.05)
u181.Pursuit = UDim2.fromScale(0, -0.1)
u181["Ace Pilot"] = UDim2.fromScale(-0.025, -0.05)

local function getTargetIndex(a1) -- Line: 102 -- upvalues: u152 (val)
    local v1 = tostring(a1)
    for i, v in ipairs(u152) do
        if tostring(v) == v1 then
            return i
        end
    end
    return 1
end

local function checkOwn(a1, a2, a3) -- Line: 115 -- upvalues: u50 (ref) -- types: a1: boolean, a2: string, a3: function
    if not a1 then
        return function() -- Line: 117 -- upvalues: u50 (upval), a2 (val)
            u50.Create({Text = a2, Color = Color3.fromRGB(236, 0, 0)})
        end
    end
    return a3
end

function deepAssign(a1, a2) -- Line: 129 -- upvalues: deepAssign (val)
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

function deepCompare(a1, a2) -- Line: 145 -- upvalues: deepCompare (val) -- types: a1: table, a2: table
    local v1, v2
    local v3 = {}
    for k, v in pairs(a2) do
        if type(v) == "table" then
            v1 = a1[k]
            if type(v1) == "table" then
                v2 = deepCompare(v1, v)
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

local function applyBuff(a1, a2, a3) -- Line: 171 -- upvalues: u34 (ref), GameRules (val) -- types: a2: string
    local v1
    if a3 == 0 then
        return a3
    end
    if a2 == "Cost" then
        if not u34 then
            return 0
        end
        v1 = a3 - (a1.Discount or 0) / 100 * a3
        local PriceScale = u34:FindFirstChild("PriceScale")
        if PriceScale then
            v1 = v1 * PriceScale.Value
        end
        v1 = v1 * ((GameRules.Get("UpgradeCostMultiplier")) or 1)
        return (math.floor(v1))
    end
    if a2 == "Range" then
        v1 = a3 + a3 * (a1.Range or 0) / 100 - a3 * (a1.Scared or 0) / 100
        local v2 = GameRules.Get("TowerRangeMultiplier") or 1
        if v2 ~= 1 then
            v1 = math.round(v1 * v2)
        end
        return v1
    end
    if a2 == "Damage" then
        return a3 + a3 * (a1.Damage or 0) / 100
    end
    if a2 == "Cooldown" then
        return (math.clamp(a3 - (a3 - a3 / (1 + (a1.Cooldown or 0) / 100)) + (a3 - a3 / (1 + (a1.Fatigue or 0) / 100)), 0.02, (1 / 0)))
    end
    return a3
end

local function getCurrentPrice(a1, a2) -- Line: 216 -- types: a1: number
    local v1
    local Price = a2.Defaults.Price
    for i = 1, a1 do
        v1 = a2.Upgrades[i]
        if v1 then
            Price = Price + v1.Cost
        end
    end
    return Price
end

function applyBuffs(a1, a2) -- Line: 229 -- upvalues: applyBuffs (val), applyBuff (val) -- types: a1: table, a2: table
    local v1
    for k, v in pairs(a2) do
        if type(v) == "table" then
            applyBuffs(a1, a2[k])
        elseif type(v) == "number" then
            v1 = (applyBuff(a1, k, v)) * 100
            a2[k] = math.floor(v1) / 100
        end
    end
end

local function getStats(a1, a2) -- Line: 244 -- upvalues: deepAssign (val), table (val) -- types: a2: number
    local v1
    local v2 = {}
    deepAssign(v2, a1.Defaults)
    if a2 < 1 then
        return v2
    end
    local v3 = nil
    for i = 1, a2 do
        v1 = a1.Upgrades[i]
        if not v1 then
            break
        end
        deepAssign(v2, v1.Stats)
        v3 = v1
    end
    return v2, table.deepClone(v3)
end

local function getUpgradeChanges(a1, a2) -- Line: 266
    -- upvalues: deepCompare (val), u175 (val), Icons (val), table (val)
    local v1, v2
    local v3 = deepCompare(a1, a2)
    local Extras = a2.Extras
    local v4 = {}
    if v3.Detections then
        for k, v in pairs(v3.Detections) do
            v1 = u175[k]
            if v1 then
                v2 = Icons[v1.Icon]
                if v2 and v == true then
                    table.insert(v4, {Icon = v2, Text = v1.Text})
                end
            end
        end
    end
    for k2, i in pairs(v3) do
        v1 = type(i)
        if v1 ~= "table" and v1 ~= "boolean" then
            v2 = Icons[k2]
            if v2 then
                table.insert(v4, {
                    Icon = v2,
                    Text = if not a1[k2] then string.format("%s", i) else string.format("%s -> %s", a1[k2], i),
                })
            end
        end
    end
    if Extras then
        for i2, j in ipairs(Extras) do
            table.insert(v4, {Text = j})
        end
    end
    return v4
end

local u210 = false

local function assignProps(a1) -- Line: 330
    -- upvalues: useRef (val), useState (val), Enum (val), Troops (val), getStats (val), applyBuffs (val)
    -- upvalues: getUpgradeChanges (val), table (val), u175 (val), Icons (val), TowerUpgradeUtils (val)
    -- upvalues: TowerAbilityIcons (val), u50 (ref), u152 (val), u210 (ref), u153 (val), u181 (val)
    local OnSell, OnUpgrade, insert, merge_2, v1, v2, v3, v4, v5, v6, v7, v8
    local Owns = a1.Owns
    if not Owns then
        Owns = not a1.OwnerName
    end
    local Visible = if a1.Visible == nil then true else a1.Visible
    local OnAbility = Owns and a1.OnAbility or function() -- Line: 333
        return
    end
    if not Owns then
        function OnUpgrade() end
    else
        OnUpgrade = a1.OnUpgrade
        if not OnUpgrade then
            function OnUpgrade() end
        end
    end
    if not Owns then
        function OnSell() end
    else
        OnSell = a1.OnSell
        if not OnSell then
            function OnSell() end
        end
    end
    local Buffs = a1.Buffs or {}
    local v9 = a1.Level or 0
    local v10 = a1.Tower or "Commander"
    local v11 = a1.Golden or false
    local v12 = a1.Damage or 1000
    local v13 = a1.Spent or 2000
    local v14 = a1.Ammo or 0
    local v15 = a1.MaxAmmo or 0
    local Model = a1.Model
    local Name = Model and Model.Name
    local Locked = a1.Locked
    local Path = a1.Path
    local v16 = useRef(false)
    local v17 = useRef(v10)
    if v17.current ~= v10 then
        v16.current = false
        v17.current = v10
    end
    local current = v16.current
    if Visible then
        v16.current = true
    end
    local Target = a1.Target
    local OnTarget = a1.OnTarget
    if not Target then
        local v18
        v18, v2 = useState(Enum.TargetingMode.First)
        Target = v18
        OnTarget = v2
    end
    v2 = assert(Troops(v10), "Tower " .. v10 .. " does not exist")
    local TowerDisplayName = a1.TowerDisplayName or v2.Properties.DisplayName or v10
    local Default = if not v11 then v2.Stats.Default else assert(v2.Stats.Golden, "Tower " .. v10 .. " does not have golden stats")
    local u340 = math.clamp(v9, 0, #Default.Upgrades)
    local v19 = getStats(Default, u340)
    local v20, v21 = getStats(Default, u340 + 1)
    applyBuffs(Buffs, v19)
    applyBuffs(Buffs, v20)
    applyBuffs(Buffs, v21)
    local v22 = u340 + 1
    if not (#Default.Upgrades < v22) then
        v3 = getUpgradeChanges(v19, v20)
    else
        v22 = getStats(Default, u340 - 1)
        applyBuffs(Buffs, v22)
        v3 = getUpgradeChanges(v22, v19)
    end
    v20 = table.merge({}, v21, {Stats = v20})
    local Detections = v19.Detections or {}
    local v23 = {}
    local v24 = {}
    for k, v in pairs(Detections) do
        v5 = u175[k]
        if v5 then
            v6 = Icons[v5.Icon]
            if v6 and v then
                table.insert(v23, {Icon = v6})
            end
        end
    end
    local v25 = ipairs
    local Abilities = Default.Defaults.Abilities or {}
    for i, i2 in v25(Abilities) do
        if TowerUpgradeUtils.matchesPath(i2, Path) then
            insert = table.insert
            merge_2 = table.merge
            v7 = {Icon = TowerAbilityIcons.getIcon(v2, Name, i2)}
            insert(v24, merge_2({}, i2, v7))
        end
    end

    local function updateTarget(a1) -- Line: 432
        -- upvalues: Owns (val), u50 (upval), Target (ref), u152 (upval), OnTarget (ref)
        return function() -- Line: 433 -- upvalues: Owns (upval), u50 (upval), Target (upval), u152 (upval), a1 (val), OnTarget (upval)
            if not Owns then
                u50.Create({
                    Text = "You can only re-target your towers!",
                    Color = Color3.fromRGB(255, 0, 0),
                })
                return
            end
            local v1 = tostring(Target)
            for i, v in ipairs(u152) do
                if tostring(v) == v1 then
                    v1 = (i or 1) + (if not a1 then -1 else 1)
                    if #u152 < v1 then
                        v1 = 1
                    elseif v1 < 1 then
                        v1 = #u152
                    end
                    OnTarget(u152[v1])
                    return
                end
            end
            v1 = 1 + (if not a1 then -1 else 1)
            if #u152 < v1 then
                v1 = 1
            elseif v1 < 1 then
                v1 = #u152
            end
            OnTarget(u152[v1])
        end
    end

    local v26 = {}
    if Owns then
        function v4(...) -- Line: 479 -- upvalues: u210 (upval), OnSell (val)
            if u210 then
                return
            end
            u210 = true
            task.delay(0.1, function() -- Line: 485 -- upvalues: u210 (upval)
                u210 = false
            end)
            OnSell(...)
        end
    else
        local u239 = "You can only sell your tower!"

        function v4() -- Line: 117 -- upvalues: u50 (upval), u239 (val)
            u50.Create({Text = u239, Color = Color3.fromRGB(236, 0, 0)})
        end
    end
    v26.OnSell = v4
    v26.OwnerName = a1.OwnerName
    v26.Owns = Owns
    v26.Locked = Locked
    v26.Animatable = current
    local u252 = true

    function v26.UpdateTargetLeft() -- Line: 433
        -- upvalues: Owns (val), u50 (upval), Target (ref), u152 (upval), u252 (val), OnTarget (ref)
        if not Owns then
            u50.Create({Text = "You can only re-target your towers!", Color = Color3.fromRGB(255, 0, 0)})
            return
        end
        local v1 = tostring(Target)
        for i, v in ipairs(u152) do
            if tostring(v) == v1 then
                v1 = (i or 1) + (if not u252 then -1 else 1)
                if #u152 < v1 then
                    v1 = 1
                elseif v1 < 1 then
                    v1 = #u152
                end
                OnTarget(u152[v1])
                return
            end
        end
        v1 = 1 + (if not u252 then -1 else 1)
        if #u152 < v1 then
            v1 = 1
        elseif v1 < 1 then
            v1 = #u152
        end
        OnTarget(u152[v1])
    end

    local u256 = false

    function v26.UpdateTargetRight() -- Line: 433
        -- upvalues: Owns (val), u50 (upval), Target (ref), u152 (upval), u256 (val), OnTarget (ref)
        if not Owns then
            u50.Create({Text = "You can only re-target your towers!", Color = Color3.fromRGB(255, 0, 0)})
            return
        end
        local v1 = tostring(Target)
        for i, v in ipairs(u152) do
            if tostring(v) == v1 then
                v1 = (i or 1) + (if not u256 then -1 else 1)
                if #u152 < v1 then
                    v1 = 1
                elseif v1 < 1 then
                    v1 = #u152
                end
                OnTarget(u152[v1])
                return
            end
        end
        v1 = 1 + (if not u256 then -1 else 1)
        if #u152 < v1 then
            v1 = 1
        elseif v1 < 1 then
            v1 = #u152
        end
        OnTarget(u152[v1])
    end

    v4 = u153[Target] or u153[1]
    v26.TargetName = v4
    v26.Detections = v23
    if Owns then
        v4 = OnAbility
    else
        local u268 = "You can only use your own towers abilities!"

        function v4() -- Line: 117 -- upvalues: u50 (upval), u268 (val)
            u50.Create({Text = u268, Color = Color3.fromRGB(236, 0, 0)})
        end
    end
    v26.OnAbility = v4
    if Owns then
        function v4(...) -- Line: 455 -- upvalues: u210 (upval), u340 (ref), Default (ref), u50 (upval), OnUpgrade (val)
            if u210 then
                return
            end
            u210 = true
            task.delay(0.1, function() -- Line: 462 -- upvalues: u210 (upval)
                u210 = false
            end)
            local v1 = u340
            if not (#Default.Upgrades <= v1) then
                return OnUpgrade(...)
            end
            u50.Create({Text = "Your tower is already max level!", Color = Color3.fromRGB(255, 0, 0)})
        end
    else
        local u277 = "You can only upgrade your tower!"

        function v4() -- Line: 117 -- upvalues: u50 (upval), u277 (val)
            u50.Create({Text = u277, Color = Color3.fromRGB(236, 0, 0)})
        end
    end
    v26.OnUpgrade = v4
    v6 = u340
    local v27 = Default
    local Price = v27.Defaults.Price
    for j = 1, v6 do
        v8 = v27.Upgrades[j]
        if v8 then
            Price = Price + v8.Cost
        end
    end
    v26.SellPrice = math.floor(Price / 3)
    v26.MaxUpgrades = #Default.Upgrades
    v26.Visible = Visible
    v26.Level = u340
    v26.Tower = v10
    v26.TowerDisplayName = TowerDisplayName
    v26.Golden = v11
    v26.Damage = v12
    v26.Spent = v13
    v26.Ammo = v14
    v26.MaxAmmo = v15
    v26.Stats = v19
    v26.StatChanges = v3
    v26.NextUpgrade = v20
    v26.Buffs = Buffs
    v26.Model = Model
    local Units = v1.Units or {}
    v26.Units = Units
    local Options = v1.Options or {}
    v26.Options = Options
    v26.Path = v1.Path
    v26.OnOption = v1.OnOption
    v26.Abilities = v24
    v26.TowerIconOverride = u181[v10]
    v26.Cooldown = v1.Cooldown
    v26.GlobalOptionsCoolDown = if not v1.GlobalOptionsCoolDown then nil else if not (0 < v1.GlobalOptionsCoolDown) then nil else v1.GlobalOptionsCoolDown
    v26.GlobalOptionsSync = v1.GlobalOptionsSync or nil
    v26.GlobalOptionsStart = v1.GlobalOptionsStart or nil
    return v26
end

return function(a1, ...) -- Line: 535
    -- upvalues: useCharmSelector (val), SettingsStore (val), useGameRule (val), useMediaQuery (val), u115 (val)
    -- upvalues: useScale (val), assignProps (val), createElement (val), UserInputService (val), React (val)
    local v1 = useCharmSelector(SettingsStore.getState, function(a1) -- Line: 536
        return a1.Game and a1.Game["Prefer Vertical Upgrades"]
    end)
    useGameRule("UpgradeCostMultiplier", 1)
    useGameRule("TowerRangeMultiplier", 1)
    local Alignment = a1.Alignment
    local large = useMediaQuery("large")
    if not Alignment then
        Alignment = "Horizontal"
        if v1 then
            if not game:GetService("VRService").VREnabled then
                Alignment = "Vertical"
            end
        elseif not large and not game:GetService("VRService").VREnabled then
            Alignment = "Vertical"
        end
    end
    local v2 = u115[Alignment]
    assert(v2, "Invalid alignment: " .. Alignment)
    local v3 = nil
    local v4 = useScale(2, nil, true)
    local v5 = assignProps(a1)
    if a1.Visible == false then
        return
    end
    if a1.Model ~= nil and a1.Visible == false then
        local v6 = {
            Text = "Double Tap to Place",
            TextScaled = true,
            TextSize = 14,
            TextStrokeTransparency = 0.8,
            TextWrapped = true,
            BackgroundTransparency = 1,
            FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
            TextColor3 = Color3.fromRGB(255, 255, 255),
            AnchorPoint = Vector2.new(0.5, 1),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            Position = UDim2.new(0.5, 0, 1, -95 * v4),
            Size = UDim2.new(0.5, 0, 0, 20),
        }
        local TouchEnabled = UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled
        v6.Visible = TouchEnabled
        v3 = createElement("TextLabel", v6)
    end
    return React.createElement(React.Fragment, {}, {upgrades = createElement(v2, v5, ...), mobile = v3})
end