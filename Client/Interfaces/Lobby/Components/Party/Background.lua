-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.Party.Background
-- Decompile time: 0.56 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local createElement = require(ReplicatedStorage.Shared.UI.React).createElement
return function() -- Line: 7 -- upvalues: createElement (val)
    return createElement("Frame", {
        BackgroundTransparency = 0.6,
        BorderSizePixel = 0,
        ZIndex = -3,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(1.3, 0.95),
    }, {
        uiGradient = createElement("UIGradient", {
            Transparency = NumberSequence.new({
                NumberSequenceKeypoint.new(0, 1),
                NumberSequenceKeypoint.new(0.2, 0.25),
                NumberSequenceKeypoint.new(0.5, 0),
                NumberSequenceKeypoint.new(0.8, 0.25),
                (NumberSequenceKeypoint.new(1, 1)),
            }),
        }),
    })
end