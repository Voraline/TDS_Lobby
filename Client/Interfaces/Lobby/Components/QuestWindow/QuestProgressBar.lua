-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.QuestWindow.QuestProgressBar
-- Decompile time: 1.87 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local createElement = require(ReplicatedStorage.Shared.UI.React).createElement
return function(a1) -- Line: 16 -- upvalues: createElement (val) -- types: a1: table
    local v1 = {BorderSizePixel = 0, ClipsDescendants = true}
    local AnchorPoint = a1.AnchorPoint or Vector2.new(0.5, 0.5)
    v1.AnchorPoint = AnchorPoint
    v1.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
    v1.LayoutOrder = a1.LayoutOrder
    v1.Position = a1.Position
    v1.Size = a1.Size
    v1.ZIndex = a1.ZIndex
    return createElement("Frame", v1, {
        InnerBar = createElement("Frame", {
            BorderSizePixel = 0,
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            Size = UDim2.new(math.clamp(a1.Progress or 0, 0, 1), 0, 1, 0),
            ZIndex = a1.ZIndex,
        }, {
            Gradient = createElement("UIGradient", {
                Color = ColorSequence.new({
                    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 124, 0)),
                    ColorSequenceKeypoint.new(0.3633, Color3.fromRGB(255, 165, 11)),
                    ColorSequenceKeypoint.new(0.7422, Color3.fromRGB(255, 207, 22)),
                    (ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 255))),
                }),
            }),
            Corner = createElement("UICorner", {CornerRadius = UDim.new(0, 100)}),
        }),
        Corner = createElement("UICorner", {CornerRadius = UDim.new(0, 100)}),
    })
end