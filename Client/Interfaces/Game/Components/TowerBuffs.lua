-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.TowerBuffs
-- Decompile time: 4.86 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
local React = require(ReplicatedStorage.Shared.UI.React)
local table = require(ReplicatedStorage.Shared.Modules.Utils.table)
local createElement = React.createElement
local memo = React.memo
local u23 = {
    Cooldown = "rbxassetid://5652595271",
    Discount = "rbxassetid://5652597075",
    [Enum.StatusEffect.Fatigue] = "rbxassetid://5652596037",
    ["Damage"] = "rbxassetid://5652595012",
    [Enum.StatusEffect.Hidden] = "rbxassetid://5652660508",
    ["Range"] = "rbxassetid://5652596533",
    [Enum.StatusEffect.Scared] = "rbxassetid://10396577103",
    [Enum.StatusEffect.DisableDiscount] = "rbxassetid://128447486371630",
    [Enum.StatusEffect.HiddenExposed] = "rbxassetid://102870200825278",
    [Enum.StatusEffect.FireworkBuff] = "rbxassetid://114727715199473",
    [Enum.StatusEffect.Coordination] = "rbxassetid://114589404718941",
    [Enum.StatusEffect.SharedOptics] = "rbxassetid://138731994983910",
}
local u52 = {
    [Enum.StatusEffect.FireworkBuff] = true,
    [Enum.StatusEffect.SharedOptics] = true,
}
local u59 = {}
u59[Enum.StatusEffect.Coordination] = (Color3.fromRGB(0, 240, 255))
local u67 = {[Enum.StatusEffect.Coordination] = 0.45}

local function formatBuffValue(a1, a2) -- Line: 44 -- upvalues: u52 (val), Enum (val) -- types: a2: number?
    if not u52[a1] and a2 then
        if a1 == Enum.StatusEffect.Coordination then
            return (("+%*%%"):format(a2))
        end
        return (("%*%%"):format(a2))
    end
    return ""
end

local u74 = memo(function(a1) -- Line: 56
    -- upvalues: createElement (val), u23 (val), u52 (val), Enum (val), u67 (val), u59 (val)
    local buff = a1.buff or {}
    local v1 = {BackgroundTransparency = 1, Size = UDim2.new(0.25, 0, 1, 0)}
    local v2 = {}
    local v3 = {
        ZIndex = 0,
        ImageTransparency = 0,
        BackgroundTransparency = 1,
        Size = UDim2.new(1, 0, 1, 0),
        Position = UDim2.new(0.5, 0, 0.5, 0),
        AnchorPoint = Vector2.new(0.5, 0.5),
    }
    v3.Image = buff.name and u23[buff.name] or "rbxassetid://0"
    v3.ScaleType = Enum.ScaleType.Fit
    v2.icon = createElement("ImageLabel", v3)
    v3 = {
        TextScaled = true,
        ZIndex = 1,
        BackgroundTransparency = 1,
        TextTransparency = 0,
        Size = UDim2.new(2, 0, 0.5, 0),
        Position = UDim2.new(0.5, 0, 0.5, 0),
        AnchorPoint = Vector2.new(0.5, 0.5),
    }
    local name = buff.name
    local value = buff.value
    v3.Text = if u52[name] then "" else if value then if name ~= Enum.StatusEffect.Coordination then ("%*%%"):format(value) else ("+%*%%"):format(value) else ""
    v3.Font = Enum.Font.GothamBold
    v3.TextStrokeTransparency = u67[buff.name] or 0.8
    local v4 = u59[buff.name] or Color3.fromRGB(255, 255, 255)
    v3.TextColor3 = v4
    v3.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
    v2.text = createElement("TextLabel", v3)
    v2.aspectRatio = createElement("UIAspectRatioConstraint")
    return createElement("Frame", v1, v2)
end)
local u77 = memo(function(a1) -- Line: 101 -- upvalues: createElement (val), React (val)
    local v1 = createElement("Frame", {
        BackgroundTransparency = 1,
        Position = UDim2.fromScale(0.5, 0),
        Size = UDim2.fromScale(1, 1),
        AnchorPoint = Vector2.new(0.5, 0),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(27, 42, 53),
    }, {
        layout = createElement("UIListLayout", {
            Wraps = true,
            FillDirection = Enum.FillDirection.Horizontal,
            SortOrder = Enum.SortOrder.Name,
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            VerticalAlignment = Enum.VerticalAlignment.Center,
            Padding = UDim.new(0.15, 0),
        }),
        children = createElement(React.Fragment, {}, a1.children),
    })
    if a1.story then
        return createElement("Frame", {BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1)}, {content = v1})
    end
    return createElement("BillboardGui", {
        Active = true,
        MaxDistance = 25,
        ResetOnSpawn = false,
        AlwaysOnTop = true,
        Size = UDim2.fromScale(2, 2),
        Adornee = a1.adornee,
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
    }, {content = v1})
end)
return (memo(function(a1) -- Line: 146
    -- upvalues: table (val), createElement (val), u74 (val), u77 (val), React (val)
    return createElement(u77, {story = a1.story, adornee = a1.adornee}, {
        buffs = createElement(React.Fragment, {}, (table.reduce(a1.buffs, function(a1, a2, a3) -- Line: 147 -- upvalues: createElement (upval), u74 (upval)
            a1[a3] = (createElement(u74, {LayoutOrder = a3, buff = a2}))
            return a1
        end, {}))),
    })
end))