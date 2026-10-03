-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.TowerInformation.TowerInformationStatsPanel
-- Decompile time: 5.14 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Icons = require(ReplicatedStorage.Client.Interfaces.LegacyInterface.Icons)
local Icons_2 = require(ReplicatedStorage.Client.Interfaces.Icons)
local React = require(ReplicatedStorage.Shared.UI.React)
local createElement = React.createElement
local u23 = {"Range", "Damage", "Cooldown", "Limit"}
local u28 = {
    HiddenDetection = {Name = "Hidden", Icon = "Hidden", Text = "Hidden Detection"},
    FlyingDetection = {Name = "Flying", Icon = "Flying", Text = "Flying Detection"},
    LeadDetection = {Name = "Lead", Icon = "Lead", Text = "Lead Detection"},
    FreezeImmune = {Name = "Freeze Immune", Icon = "FreezeImmune", Text = "Freeze Immunity"},
    StunImmune = {Name = "Stun Immune", Icon = "StunImmune", Text = "Stun Immunity"},
}

local function formatPercent(a1) -- Line: 45 -- types: a1: number
    local v1 = math.round(a1 * 10) / 10
    if v1 == math.floor(v1) then
        return (tostring(v1))
    end
    return string.format("%.1f", v1)
end

local function formatSignedPercent(a1) -- Line: 55 -- types: a1: number
    local v1 = if not (a1 > 0) then "" else "+"
    local v2 = math.round(a1 * 10) / 10
    return (("%*%*%%"):format(v1, if v2 ~= math.floor(v2) then string.format("%.1f", v2) else tostring(v2)))
end

local function getCoordinationDamageBonusText(a1) -- Line: 61
    local Attributes = a1 and a1.Attributes
    local CoordinationDamageBonus = Attributes and Attributes.CoordinationDamageBonus
    if type(CoordinationDamageBonus) == "number" and not ((math.abs(CoordinationDamageBonus)) < 0.05) then
        local v1 = if not (CoordinationDamageBonus > 0) then "" else "+"
        local v2 = math.round(CoordinationDamageBonus * 10) / 10
        return (("%*%*%%"):format(v1, if v2 ~= math.floor(v2) then string.format("%.1f", v2) else tostring(v2)))
    end
    return nil
end

local function toAssetId(a1) -- Line: 72
    if typeof(a1) == "number" then
        return (("rbxassetid://%*"):format(a1))
    end
    if typeof(a1) == "string" then
        return a1
    end
    return nil
end

local function statFrame(a1) -- Line: 84 -- upvalues: createElement (val), Icons (val) -- types: a1: table
    local v1 = {
        BackgroundTransparency = 1,
        ZIndex = 30,
        LayoutOrder = a1.layoutOrder,
        Size = UDim2.new(1, 0, 0, 60),
    }
    local v2 = {}
    local v3 = {BackgroundTransparency = 1, ZIndex = 56, AnchorPoint = Vector2.new(0, 0.5)}
    local icon = a1.icon
    v3.Image = (if typeof(icon) ~= "number" then if typeof(icon) ~= "string" then nil else icon else ("rbxassetid://%*"):format(icon)) or Icons.Locked
    v3.Position = UDim2.fromScale(0, 0.5)
    v3.Size = UDim2.fromOffset(55, 55)
    v2.imageLabel = createElement("ImageLabel", v3)
    v2.title = createElement("TextLabel", {
        BackgroundTransparency = 1,
        TextSize = 24,
        TextWrapped = true,
        ZIndex = 999,
        FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal),
        Size = UDim2.fromScale(1, 1),
        Text = a1.title,
        TextColor3 = Color3.new(1, 1, 1),
        TextXAlignment = Enum.TextXAlignment.Left,
    }, {uIPadding = createElement("UIPadding", {PaddingLeft = UDim.new(0, 55)})})
    v2.value = createElement("TextLabel", {
        BackgroundTransparency = 1,
        TextSize = 24,
        TextWrapped = true,
        ZIndex = 999,
        FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal),
        Size = UDim2.fromScale(1, 1),
        Text = a1.value or "",
        TextColor3 = Color3.new(1, 1, 1),
        TextXAlignment = Enum.TextXAlignment.Right,
    }, {uIPadding = createElement("UIPadding", {PaddingRight = UDim.new(0, 2)})})
    return createElement("Frame", v1, v2)
end

local function createStatRows(a1, a2) -- Line: 142
    -- upvalues: u23 (val), createElement (val), statFrame (val), Icons (val), Icons_2 (val), u28 (val)
    local u160 = {}
    local u67 = 0
    if a1 then
        local Locked, v1, v2, v3
        local v4 = u23
        local v5 = nil
        local v6 = nil
        for i, j in v4, v5, v6 do
            v3 = a1[j]
            if v3 ~= nil then
                u67 = u67 + 1
                v1 = createElement
                v2 = {}
                Locked = Icons[j] or Icons.Locked
                v2.icon = Locked
                v2.layoutOrder = u67
                v2.title = j
                v2.value = tostring(v3)
                u160[j] = (v1(statFrame, v2))
            end
        end
        local Attributes = a1 and a1.Attributes
        local CoordinationDamageBonus = Attributes and Attributes.CoordinationDamageBonus
        if type(CoordinationDamageBonus) ~= "number" then
            v4 = nil
        elseif not ((math.abs(CoordinationDamageBonus)) < 0.05) then
            v2 = math.round(CoordinationDamageBonus * 10) / 10
            local v7 = if v2 ~= math.floor(v2) then string.format("%.1f", v2) else tostring(v2)
            v4 = ("%*%*%%"):format(if not (CoordinationDamageBonus > 0) then "" else "+", v7)
        else
            v4 = nil
        end
        if v4 then
            u67 = u67 + 1
            u160.CoordinationDamageBonus = createElement(statFrame, {
                title = "Coord. Damage",
                icon = Icons_2.Coordination,
                layoutOrder = u67,
                value = v4,
            })
        end
    end
    local u106 = {}

    local function pushBadge(a1) -- Line: 173
        -- upvalues: u28 (upval), u106 (val), u67 (ref), u160 (val), createElement (upval), statFrame (upval)
        -- upvalues: Icons_2 (upval)
        local v1 = u28[a1]
        if v1 and not u106[v1.Name] then
            u106[v1.Name] = true
            u67 = u67 + 1
            u160[v1.Name] = (createElement(statFrame, {
                value = "",
                icon = Icons_2[v1.Icon],
                layoutOrder = u67,
                title = v1.Text,
            }))
            return
        end
    end

    if a1 and a1.Detections then
        for k, n in a1.Detections do
            if n then
                pushBadge(k)
            end
        end
    end
    if a2 then
        for m, i5 in a2 do
            if i5 then
                pushBadge(m)
            end
        end
    end
    return u160
end

return React.memo(function(a1) -- Line: 208 -- upvalues: createStatRows (val), createElement (val) -- types: a1: table
    return createElement("Frame", {
        BackgroundTransparency = 0.2,
        ZIndex = 12,
        BackgroundColor3 = Color3.new(),
        Position = UDim2.fromScale(0.035472, 0.24239),
        Size = UDim2.fromOffset(341, 414),
    }, {
        uIStroke = createElement("UIStroke", {Thickness = 2, Transparency = 0.5, Color = Color3.new(1, 1, 1)}, {
            uIGradient = createElement("UIGradient", {
                Rotation = 90,
                Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 0), (NumberSequenceKeypoint.new(1, 1))}),
            }),
        }),
        scrollingFrame = createElement("ScrollingFrame", {
            Active = true,
            BackgroundTransparency = 1,
            BottomImage = "",
            MidImage = "rbxassetid://95591733073455",
            ScrollBarImageTransparency = 0.2,
            ScrollBarThickness = 4,
            BorderSizePixel = 0,
            TopImage = "",
            ZIndex = 25,
            AutomaticCanvasSize = Enum.AutomaticSize.Y,
            CanvasSize = UDim2.new(),
            Size = UDim2.fromScale(1, 1),
            VerticalScrollBarInset = Enum.ScrollBarInset.ScrollBar,
        }, {
            uIListLayout = createElement("UIListLayout", {Padding = UDim.new(0, 5), SortOrder = Enum.SortOrder.LayoutOrder}),
        }, (createStatRows(a1.towerStats, a1.statusEffects))),
        uIPadding = createElement("UIPadding", {
            PaddingBottom = UDim.new(0, 15),
            PaddingLeft = UDim.new(0, 15),
            PaddingRight = UDim.new(0, 15),
            PaddingTop = UDim.new(0, 15),
        }),
        uICorner = createElement("UICorner"),
    })
end)