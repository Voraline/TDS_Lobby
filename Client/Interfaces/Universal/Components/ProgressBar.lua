-- Script path: ReplicatedStorage.Client.Interfaces.Universal.Components.ProgressBar
-- Decompile time: 1.50 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local createElement = require(ReplicatedStorage.Shared.UI.React).createElement
return function(a1) -- Line: 19 -- upvalues: createElement (val) -- types: a1: table
    local ProgressBarColor = a1.ProgressBarColor or Color3.fromRGB(255, 255, 255)
    local v1 = {AnchorPoint = a1.AnchorPoint, BackgroundColor3 = ProgressBarColor}
    local Position = a1.Position or UDim2.fromOffset(0, 26)
    v1.Position = Position
    local Size = a1.Size or UDim2.new(1, 0, 0, 10)
    v1.Size = Size
    v1.LayoutOrder = a1.LayoutOrder
    local v2 = {}
    local v3 = createElement("UIStroke", {Color = ProgressBarColor})
    local v4 = {}
    local v5 = if 0.999 <= a1.Value then ColorSequence.new(ProgressBarColor) else if not (a1.Value <= 0) then ColorSequence.new({
        ColorSequenceKeypoint.new(0, ProgressBarColor),
        ColorSequenceKeypoint.new(a1.Value, ProgressBarColor),
        ColorSequenceKeypoint.new(a1.Value + 0.001, Color3.fromRGB(0, 0, 0)),
        (ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 0, 0))),
    }) else ColorSequence.new(Color3.fromRGB(0, 0, 0))
    v4.Color = v5
    v5 = if 0.999 <= a1.Value then NumberSequence.new(0) else if not (a1.Value <= 0) then NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0.2),
        NumberSequenceKeypoint.new(a1.Value, 0.2),
        NumberSequenceKeypoint.new(a1.Value + 0.001, 0.5),
        (NumberSequenceKeypoint.new(1, 0.5)),
    }) else NumberSequence.new(1)
    v4.Transparency = v5
    v2[1] = v3
    v2[2] = createElement("UIGradient", v4)
    return createElement("Frame", v1, v2)
end