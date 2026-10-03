-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.Sandbox.StatsPanel.StatsEntry
-- Decompile time: 2.58 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Container = require(ReplicatedStorage.Client.Interfaces.Game.Components.NewUpgrade.Alignments.BaseComponents.Container)
local ImageLabel = require(ReplicatedStorage.Client.Interfaces.Components.ImageLabel)
local React = require(ReplicatedStorage.Shared.UI.React)
local StatsNumberEntry = require(script.Parent.StatsNumberEntry)
local TextLabel = require(ReplicatedStorage.Client.Interfaces.Components.TextLabel)
local useSpring = require(ReplicatedStorage.Client.Interfaces.Hooks.useSpring)
local createElement = React.createElement
local u44 = {
    Price = {min = 0, max = 9999999},
    Cost = {min = 0, max = 9999999},
    Limit = {min = 0, max = 100},
    Income = {min = 0, max = 9999999},
    Cooldown = {min = 0.01, max = 100},
    Damage = {min = 0, max = 9999999},
}
return function(a1) -- Line: 31
    -- upvalues: useSpring (val), u44 (val), createElement (val), React (val), Container (val), ImageLabel (val)
    -- upvalues: TextLabel (val), StatsNumberEntry (val)
    local v1, u7 = useSpring(0, 1, 30, true)
    local v2 = u44[a1.name] or {min = 0.01, max = 100}
    local v3 = createElement
    local v4 = {Size = UDim2.fromScale(1, 0.15), BackgroundTransparency = 1}

    v4[React.Event.MouseEnter] = function() -- Line: 40 -- upvalues: u7 (val)
        u7(1)
    end

    v4[React.Event.MouseLeave] = function() -- Line: 43 -- upvalues: u7 (val)
        u7(0)
    end

    return v3("Frame", v4, {
        bg = createElement(Container, {
            BackgroundTransparency = 0.5,
            BorderSizePixel = 0,
            ZIndex = -1,
            CornerRadius = 8,
            StrokeThickness = 2,
            ClipsDescendants = true,
            Size = UDim2.new(1, 0, 1, 0),
            BackgroundColor3 = Color3.fromRGB(27, 27, 27),
            StrokeColor = Color3.fromRGB(90, 90, 90),
        }, {
            padding = createElement("UIPadding", {
                PaddingTop = UDim.new(0, 10),
                PaddingBottom = UDim.new(0, 10),
                PaddingLeft = UDim.new(0, 10),
                PaddingRight = UDim.new(0, 10),
            }),
            titleContainer = createElement("Frame", {
                BackgroundTransparency = 1,
                LayoutOrder = 1,
                Size = UDim2.fromScale(1, 0.4),
                AnchorPoint = Vector2.new(0, 0.5),
                Position = UDim2.fromScale(0, 0.5),
            }, {
                list = createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder,
                    HorizontalAlignment = Enum.HorizontalAlignment.Left,
                    VerticalAlignment = Enum.VerticalAlignment.Center,
                    FillDirection = Enum.FillDirection.Horizontal,
                    Padding = UDim.new(0, 15),
                }),
                icon = createElement(ImageLabel, {
                    BackgroundTransparency = 1,
                    LayoutOrder = 0,
                    Image = a1.icon,
                    Size = UDim2.fromScale(1, 1),
                }, {aspect = createElement("UIAspectRatioConstraint", {})}),
                name = createElement(TextLabel, {
                    LayoutOrder = 1,
                    FontWeight = "Black",
                    StrokeThickness = 4,
                    Size = UDim2.fromScale(0.5, 1),
                    Position = UDim2.fromScale(0, 0),
                    AnchorPoint = Vector2.new(0, 0),
                    Text = a1.name,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    TextYAlignment = Enum.TextYAlignment.Center,
                }),
            }),
            descriptionContainer = createElement("Frame", {
                BackgroundTransparency = 1,
                LayoutOrder = 2,
                ClipsDescendants = false,
                Size = UDim2.fromScale(1, 1),
            }, {
                description = createElement(TextLabel, {
                    LayoutOrder = 1,
                    FontWeight = "Medium",
                    StrokeThickness = 4,
                    Size = UDim2.fromScale(1, 0.2),
                    AnchorPoint = Vector2.new(0, 1),
                    Text = ("%* (%* - %*)"):format(a1.description, v2.min, v2.max),
                    Transparency = v1:map(function(a1) -- Line: 124
                        return 1 - a1
                    end),
                    Position = v1:map(function(a1) -- Line: 127
                        return (UDim2.fromScale(0.01, 1.5)):Lerp(UDim2.fromScale(0.01, 1.1), a1)
                    end),
                    TextXAlignment = Enum.TextXAlignment.Left,
                    TextYAlignment = Enum.TextYAlignment.Center,
                }),
            }),
            inputContainer = createElement("Frame", {
                BackgroundTransparency = 1,
                LayoutOrder = 3,
                Size = UDim2.fromScale(0.5, 0.5),
                AnchorPoint = Vector2.new(1, 0.5),
                Position = UDim2.fromScale(1, 0.5),
            }, {
                input = createElement(StatsNumberEntry, {
                    min = v2.min,
                    max = v2.max,
                    baseValue = a1.value,
                    activate = a1.onConfirm,
                }),
            }),
        }),
    })
end