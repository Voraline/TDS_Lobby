-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.Level.Bar
-- Decompile time: 2.15 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ImageLabel = require(ReplicatedStorage.Client.Interfaces.Components.ImageLabel)
local React = require(ReplicatedStorage.Shared.UI.React)
local createElement = React.createElement
local useBinding = React.useBinding
return (React.memo(function(a1) -- Line: 10 -- upvalues: useBinding (val), createElement (val), ImageLabel (val), React (val)
    return createElement(ImageLabel, {
        BorderSizePixel = 0,
        Image = "rbxassetid://76876230251877",
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Size = (a1.progress or useBinding(0)):map(function(a1) -- Line: 18
            return UDim2.fromScale(math.clamp(a1, 0, 1), 1)
        end),
    }, {
        uiGradient = React.createElement("UIGradient", {
            Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, Color3.fromRGB(87, 210, 255)),
                ColorSequenceKeypoint.new(0.231, Color3.fromRGB(42, 117, 255)),
                ColorSequenceKeypoint.new(0.523, Color3.fromRGB(0, 170, 255)),
                ColorSequenceKeypoint.new(0.765, Color3.fromRGB(245, 252, 255)),
                (ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 255))),
            }),
            Offset = Vector2.new(0.2, 0),
            Transparency = a1.transparency:map(function(a1) -- Line: 31
                return NumberSequence.new(a1)
            end),
        }),
        uiCorner = React.createElement("UICorner"),
    })
end))