-- Script path: ReplicatedStorage.Client.Interfaces.Game.Views.TowerBuffs
-- Decompile time: 3.45 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
local table = require(ReplicatedStorage.Shared.Modules.Utils.table)
local TooltipStore = require(ReplicatedStorage.Client.Interfaces.Stores.Shared.TooltipStore)
local UpgradesStore = require(ReplicatedStorage.Client.Interfaces.Stores.Game.UpgradesStore)
local useCharmSelector = require(ReplicatedStorage.Client.Interfaces.Hooks.useCharmSelector)
local useChild = require(ReplicatedStorage.Client.Interfaces.Hooks.useChild)
local useInGameTowers = require(ReplicatedStorage.Client.Interfaces.Hooks.useInGameTowers)
local usePrimaryPart = require(ReplicatedStorage.Client.Interfaces.Hooks.usePrimaryPart)
local useUserSetting = require(ReplicatedStorage.Client.Interfaces.Hooks.useUserSetting)
local TowerBuffs = require(ReplicatedStorage.Client.Interfaces.Game.Components.TowerBuffs)
local createElement = React.createElement
local createPortal = ReactRoblox.createPortal
local memo = React.memo
local u80 = {
    "Discount",
    "Cooldown",
    Enum.StatusEffect.Fatigue,
    "Damage",
    Enum.StatusEffect.Hidden,
    "Range",
    Enum.StatusEffect.Scared,
    Enum.StatusEffect.DisableDiscount,
    Enum.StatusEffect.HiddenExposed,
    Enum.StatusEffect.Coordination,
    Enum.StatusEffect.SharedOptics,
    Enum.StatusEffect.FireworkBuff,
}
local u101 = {}
for i, j in u80 do
    u101[j] = true
end

local function useTowerBuffs(a1) -- Line: 42
    -- upvalues: React (val), u80 (val), table (val), u101 (val)
    local v1, u5 = React.useState({})
    local v2 = {a1}
    React.useEffect(function() -- Line: 45 -- upvalues: a1 (val), u5 (val), u80 (upval), table (upval), u101 (upval)
        local PropertyChangedSignal
        if not a1 then
            u5({})
            return
        end
        local u4 = {}
        local u5_2 = {}

        local function updateBuffs() -- Line: 54 -- upvalues: u80 (upval), a1 (upval), table (upval), u5 (upval)
            local Value, v1
            local v2 = {}
            for i, j in u80 do
                v1 = a1:FindFirstChild(j)
                if v1 then
                    Value = v1.Value
                    if typeof(Value) == "number" and Value > 0 then
                        table.insert(v2, {name = j, value = Value})
                    end
                end
            end
            u5(v2)
        end

        local function watchChild(a1) -- Line: 72
            -- upvalues: u101 (upval), u5_2 (val), updateBuffs (val)
            if u101[a1.Name] and not u5_2[a1] then
                u5_2[a1] = ((a1:GetPropertyChangedSignal("Value")):Connect(updateBuffs))
                return
            end
        end

        for i, j in a1:GetChildren() do
            if u101[j.Name] and not u5_2[j] then
                PropertyChangedSignal = j:GetPropertyChangedSignal("Value")
                u5_2[j] = (PropertyChangedSignal:Connect(updateBuffs))
            end
        end
        table.insert(u4, a1.ChildAdded:Connect(function(a1) -- Line: 86 -- upvalues: u101 (upval), u5_2 (val), updateBuffs (val)
            if u101[a1.Name] and not u5_2[a1] then
                u5_2[a1] = ((a1:GetPropertyChangedSignal("Value")):Connect(updateBuffs))
            end
            updateBuffs()
        end))
        table.insert(u4, a1.ChildRemoved:Connect(function(a1) -- Line: 94 -- upvalues: u5_2 (val), u101 (upval), updateBuffs (val)
            local v1 = u5_2[a1]
            if v1 then
                v1:Disconnect()
                u5_2[a1] = nil
            end
            if u101[a1.Name] then
                updateBuffs()
            end
        end))
        updateBuffs()
        return function() -- Line: 109 -- upvalues: u4 (val), u5_2 (val)
            for i, j in u4 do
                j:Disconnect()
            end
            for k, n in u5_2 do
                n:Disconnect()
                u5_2[k] = nil
            end
        end
    end, v2)
    return v1
end

local u125 = memo(function(a1) -- Line: 124
    -- upvalues: usePrimaryPart (val), useChild (val), useTowerBuffs (val), createPortal (val), createElement (val)
    -- upvalues: TowerBuffs (val)
    local model = a1.model
    local v1 = usePrimaryPart(model)
    local v2 = useTowerBuffs((useChild(model, "Display")))
    local alwaysDisplayTowerBuffs = a1.alwaysDisplayTowerBuffs or a1.isHovered or a1.isSelected
    if v1 and alwaysDisplayTowerBuffs and #v2 ~= 0 then
        return createPortal({allBuffs = createElement(TowerBuffs, {adornee = v1, buffs = v2})}, v1, "BuffsDisplay")
    end
end)
return function() -- Line: 144
    -- upvalues: useInGameTowers (val), useCharmSelector (val), TooltipStore (val), UpgradesStore (val)
    -- upvalues: useUserSetting (val), table (val), createElement (val), u125 (val), React (val)
    local v1 = useInGameTowers()
    local u6 = useCharmSelector(TooltipStore.getState, function(a1) -- Line: 146
        local tooltipValue = a1.tooltipValue
        if a1.tooltipType == "Tower" and tooltipValue then
            return tooltipValue.Model
        end
        return nil
    end)
    local u11 = useCharmSelector(UpgradesStore.getState, function(a1) -- Line: 150
        return a1.model
    end)
    local u15 = useUserSetting("Always Display Tower Buffs", false)
    debug.profilebegin("UIFanout_TowerBuffs")
    local v2 = table.reduce(v1, function(a1, a2, a3) -- Line: 156
        -- upvalues: createElement (upval), u125 (upval), u15 (val), u6 (val), u11 (val)
        local UID = a2.UID
        local v1 = createElement
        local v2 = {
            model = a3,
            alwaysDisplayTowerBuffs = u15,
            isHovered = u6 == a3,
            isSelected = u11 == a3,
        }
        a1[UID] = (v1(u125, v2))
        return a1
    end, {})
    debug.profileend()
    return createElement(React.Fragment, {}, {children = createElement(React.Fragment, {}, v2)})
end