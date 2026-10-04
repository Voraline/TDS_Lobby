-- Script path: ReplicatedStorage.Client.Interfaces.Game.Views.Tooltip
-- Decompile time: 5.20 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")
local table = require(ReplicatedStorage.Shared.Modules.Utils.table)
local HealthTooltip = require(ReplicatedStorage.Client.Interfaces.Game.Components.HealthTooltip)
local TowerTooltip = require(ReplicatedStorage.Client.Interfaces.Game.Components.TowerTooltip)
local Icons = require(ReplicatedStorage.Client.Interfaces.Icons)
local CrosshairStore = require(ReplicatedStorage.Client.Interfaces.Stores.Game.CrosshairStore)
local React = require(ReplicatedStorage.Shared.UI.React)
local TooltipStore = require(ReplicatedStorage.Client.Interfaces.Stores.Shared.TooltipStore)
local useCharmBinding = require(ReplicatedStorage.Client.Interfaces.Hooks.useCharmBinding)
local useCharmSelector = require(ReplicatedStorage.Client.Interfaces.Hooks.useCharmSelector)
local createElement = React.createElement
local u67 = {
    Fire = "Burn",
    HealthRegen = "Health Regen",
    MoltenCorpse = "Corpse",
    Ignore = "No Target",
    HiddenExposed = "Exposed",
}
UserInputService.MouseIconEnabled = true
return function(a1) -- Line: 28
    -- upvalues: useCharmSelector (val), CrosshairStore (val), TooltipStore (val), useCharmBinding (val), table (val)
    -- upvalues: Icons (val), u67 (val), createElement (val), HealthTooltip (val), TowerTooltip (val)
    -- upvalues: UserInputService (val)
    local v1 = useCharmSelector(CrosshairStore.getState, function(a1) -- Line: 29
        return a1.enabled
    end)
    local v2 = useCharmSelector(TooltipStore.getState, function(a1) -- Line: 32
        return a1.tooltipType or "None"
    end)
    local v3 = useCharmSelector(TooltipStore.getState, function(a1) -- Line: 35
        return a1.tooltipValue or {}
    end)
    local v4 = useCharmBinding(TooltipStore.getPosition)
    if v1 then
        return nil
    end
    local v5 = nil
    if v2 == "Health" then
        local v6
        local v7 = {}
        local Detections = v3.Detections or {}
        local v8 = v3.Stats or {}
        local v9 = nil
        local v10 = nil
        for i, j in v8, v9, v10 do
            if type(j) ~= "number" or j ~= 0 then
                table.insert(v7, {Icon = Icons[i] or 0, Text = j})
            end
        end
        v9 = nil
        v10 = nil
        for k, n in Detections, v9, v10 do
            if n ~= false then
                v6 = k:match("^(.+)Immune$")
                if v6 then
                    v6 = "No " .. (u67[v6] or v6)
                elseif u67[k] then
                    v6 = u67[k]
                end
                table.insert(v7, {Icon = Icons[k] or 0, Text = v6 or k})
            end
        end
        v5 = createElement(HealthTooltip, {
            Name = v3.Name,
            Health = v3.Health,
            MaxHealth = v3.MaxHealth,
            Shield = v3.Shield,
            TimeLeft = v3.TimeLeft,
            MaxTimeLeft = v3.MaxTimeLeft,
            NoHealth = v3.NoHealth,
            Extras = v7,
        })
    elseif v2 == "Tower" then
        v5 = createElement(TowerTooltip, {
            Name = v3.Name,
            Owner = v3.Owner,
            Level = v3.Level,
            Model = v3.Model,
            MaxAmmo = v3.MaxAmmo,
            Ammo = v3.Ammo,
        })
    end
    UserInputService.MouseIcon = if v2 == "None" then "" else "rbxasset://textures/Cursors/KeyboardMouse/ArrowCursor.png"
    return createElement("Frame", {
        BackgroundTransparency = 1,
        Size = UDim2.fromScale(1, 1),
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = v4,
    }, {tooltip = v5})
end