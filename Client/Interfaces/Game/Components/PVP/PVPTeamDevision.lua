-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.PVP.PVPTeamDevision
-- Decompile time: 5.34 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ImageLabel = require(ReplicatedStorage.Client.Interfaces.Components.ImageLabel)
local React = require(ReplicatedStorage.Shared.UI.React)
local createElement = React.createElement
return React.memo(function(a1) -- Line: 9 -- upvalues: createElement (val), ImageLabel (val), React (val)
    local v1 = {BackgroundTransparency = 1, BorderSizePixel = 0}
    local Size = a1.Size or UDim2.fromScale(1, 1)
    v1.Size = Size
    v1.Position = a1.Position
    v1.AnchorPoint = a1.AnchorPoint
    v1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    v1.BorderColor3 = Color3.fromRGB(0, 0, 0)
    v1.ClipsDescendants = a1.ClipsDescendants
    local v2 = {}
    local v3 = {ZIndex = -1}
    local backgroundSize = a1.backgroundSize or UDim2.fromScale(1, 1)
    v3.Size = backgroundSize
    local backgroundPosition = a1.backgroundPosition or UDim2.fromScale(0.5, 0.5)
    v3.Position = backgroundPosition
    local backgroundAnchorPoint = a1.backgroundAnchorPoint or Vector2.new(0.5, 0.5)
    v3.AnchorPoint = backgroundAnchorPoint
    local v4 = {
        team1 = createElement("Frame", {
            BorderSizePixel = 0,
            ZIndex = 2,
            BackgroundColor3 = Color3.fromRGB(236, 36, 83),
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            Size = UDim2.fromScale(1, 1),
        }, {
            uIGradient = createElement("UIGradient", {
                Rotation = 15,
                Transparency = NumberSequence.new({
                    NumberSequenceKeypoint.new(0, 0),
                    NumberSequenceKeypoint.new(0.5, 0),
                    NumberSequenceKeypoint.new(0.501, 1),
                    (NumberSequenceKeypoint.new(1, 1)),
                }),
            }),
        }),
    }
    v4.team2 = createElement("Frame", {
        BorderSizePixel = 0,
        BackgroundColor3 = Color3.fromRGB(0, 149, 248),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Size = UDim2.fromScale(1, 1),
    })
    v4.pattern = createElement(ImageLabel, {
        BackgroundTransparency = 1,
        Image = "rbxassetid://2151781758",
        ImageTransparency = 0.9,
        ZIndex = 3,
        AnchorPoint = Vector2.new(0.5, 0.5),
        ImageColor3 = Color3.fromRGB(11, 11, 11),
        Position = UDim2.fromScale(0.5, 0.5),
        ScaleType = Enum.ScaleType.Tile,
        Size = UDim2.fromScale(1, 1),
        TileSize = UDim2.fromOffset(30, 60),
    }, {
        uIGradient1 = createElement("UIGradient", {
            Rotation = 90,
            Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 0), (NumberSequenceKeypoint.new(1, 1))}),
        }),
    })
    local backgroundCornerRadiusScale = if a1.backgroundCornerRadius then createElement("UICorner", {
        CornerRadius = UDim.new(a1.backgroundCornerRadiusScale, a1.backgroundCornerRadius),
    }) else a1.backgroundCornerRadiusScale and createElement("UICorner", {
        CornerRadius = UDim.new(a1.backgroundCornerRadiusScale, a1.backgroundCornerRadius),
    })
    v4.corner = backgroundCornerRadiusScale
    v2.background = createElement("CanvasGroup", v3, v4)
    v2.children = createElement(React.Fragment, {}, a1.children)
    return createElement("Frame", v1, v2)
end)