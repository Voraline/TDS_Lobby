-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.LogBook.Sidebars.MapSidebar.MapSidebarScores
-- Decompile time: 1.96 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local useSpring = (require(ReplicatedStorage.Packages.ReactFlow)).useSpring
local memo = React.memo
local useEffect = React.useEffect
local createElement = React.createElement
local u20 = memo(function(a1) -- Line: 13 -- upvalues: useSpring (val), useEffect (val), createElement (val)
    local u2 = a1.layoutOrder or 0
    local text = a1.text
    local map = a1.map
    local v1, u8 = useSpring({start = 0, target = 0, damper = 1, speed = 20})
    local v2 = v1:map(function(a1) -- Line: 24
        return 1 - a1
    end)
    local v3 = {map}
    useEffect(function() -- Line: 28 -- upvalues: u8 (val), u2 (val)
        u8({start = 0, target = 1, force = -math.floor((u2 + 1) / 2) * 20})
    end, v3)
    return createElement("Frame", {BackgroundTransparency = 1, Size = UDim2.fromScale(0.45, 0.353), LayoutOrder = u2}, {
        content = createElement("TextLabel", {
            BorderSizePixel = 0,
            TextScaled = true,
            TextSize = 14,
            TextWrapped = true,
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BackgroundTransparency = v1:map(function(a1) -- Line: 43
                return 1 - a1 * 0.1
            end),
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal),
            Size = UDim2.fromScale(1, 1),
            Position = v1:map(function(a1) -- Line: 54
                return UDim2.fromScale(0, 1 - a1)
            end),
            Text = text,
            TextTransparency = v2,
            TextColor3 = Color3.fromRGB(255, 255, 255),
        }, {
            uICorner = createElement("UICorner", {CornerRadius = UDim.new(0, 4)}),
            uIStroke = createElement("UIStroke", {
                ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
                Color = Color3.fromRGB(145, 145, 145),
                Transparency = v2,
            }),
            uIPadding = createElement("UIPadding", {
                PaddingBottom = UDim.new(0.2, 0),
                PaddingLeft = UDim.new(0.1, 0),
                PaddingRight = UDim.new(0.1, 0),
                PaddingTop = UDim.new(0.2, 0),
            }),
        }),
    })
end)
return (memo(function(a1) -- Line: 84 -- upvalues: createElement (val), u20 (val), React (val)
    local v1 = {}
    for i, v in ipairs(a1.scores) do
        v1[v.name] = (createElement(u20, {
            layoutOrder = i,
            map = a1.map,
            text = ("%*: %*"):format(v.name, v.value),
        }))
    end
    return createElement("Frame", {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0, 0.49),
        Size = UDim2.fromScale(1, 0.152),
    }, {
        uIAspectRatioConstraint = createElement("UIAspectRatioConstraint", {AspectRatio = 3.8, AspectType = Enum.AspectType.ScaleWithParentSize}),
        uIGridLayout = createElement("UIGridLayout", {
            CellPadding = UDim2.fromScale(0.02, 0.07),
            CellSize = UDim2.fromScale(0.49, 0.4),
            FillDirection = Enum.FillDirection.Horizontal,
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            SortOrder = Enum.SortOrder.LayoutOrder,
            VerticalAlignment = Enum.VerticalAlignment.Center,
        }),
        content = createElement(React.Fragment, {}, v1),
    })
end))