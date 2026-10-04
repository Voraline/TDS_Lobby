-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.IntermissionTopBar.Arena
-- Decompile time: 2.90 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local PVPConstants = require(ReplicatedStorage.Shared.Modules.PVPConstants)
local React = require(ReplicatedStorage.Shared.UI.React)
local createElement = React.createElement
local useState = React.useState
return function(a1) -- Line: 9 -- upvalues: createElement (val), PVPConstants (val)
    local PrimaryColor = a1.PrimaryColor or Color3.fromRGB(255, 255, 255)
    local SubColor = a1.SubColor or Color3.fromRGB(235, 235, 235)
    local v1 = {
        BackgroundTransparency = 1,
        AnchorPoint = Vector2.new(0.5, 0),
        AutomaticSize = Enum.AutomaticSize.X,
        BackgroundColor3 = PrimaryColor,
    }
    local Position = a1.Position or UDim2.fromScale(0.5, 0)
    v1.Position = Position
    local Size = a1.Size or UDim2.fromOffset(0, 50)
    v1.Size = Size
    return createElement("Frame", v1, {
        label = createElement("TextLabel", {
            BackgroundTransparency = 1,
            FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Heavy, Enum.FontStyle.Normal),
            Text = PVPConstants.ARENA_NAMES[a1.ArenaText] or "NOT SET",
            TextColor3 = PrimaryColor,
            TextSize = a1.TextSize or 50,
            AutomaticSize = Enum.AutomaticSize.X,
            BackgroundColor3 = PrimaryColor,
            Size = UDim2.fromScale(0, 1),
        }, {
            stroke = createElement("UIStroke", {Thickness = 2, Transparency = 0.5}),
            gradient = createElement("UIGradient", {
                Rotation = 90,
                Color = ColorSequence.new({
                    ColorSequenceKeypoint.new(0, PrimaryColor),
                    ColorSequenceKeypoint.new(0.6, PrimaryColor),
                    ColorSequenceKeypoint.new(0.601, SubColor),
                    (ColorSequenceKeypoint.new(1, SubColor)),
                }),
            }),
            padding = createElement("UIPadding", {PaddingLeft = UDim.new(0, 40), PaddingRight = UDim.new(0, 40)}),
        }),
        arenaImage = createElement("ImageLabel", {
            BackgroundTransparency = 1,
            ImageTransparency = 0,
            ZIndex = 0,
            AnchorPoint = Vector2.new(0.5, 0.95),
            Position = UDim2.fromScale(0.5, 0.95),
            Size = UDim2.fromScale(3, 3),
            Image = PVPConstants.ARENA_IMAGES[a1.ArenaText] or "",
        }, {
            {
                uiAspectRatio = createElement("UIAspectRatioConstraint", {AspectRatio = 2.6391752577319587}),
            },
        }),
    })
end