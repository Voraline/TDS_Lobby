-- Script path: ReplicatedStorage.Client.Interfaces.Universal.Components.Outline
-- Decompile time: 0.53 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local createElement = require(ReplicatedStorage.Shared.UI.React).createElement
return function(a1) -- Line: 14 -- upvalues: createElement (val) -- types: a1: table
    local v1 = {
        BackgroundTransparency = 1,
        Size = a1.Size,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
    }
    local v2 = {}
    local v3 = {ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual}
    local OutlineColor = a1.OutlineColor or Color3.fromRGB(255, 255, 255)
    v3.Color = OutlineColor
    v3.Thickness = a1.OutlineThickness or 1
    v2.uistroke = createElement("UIStroke", v3)
    v3 = {}
    local CornerRadius = a1.CornerRadius or UDim.new(0, 10)
    v3.CornerRadius = CornerRadius
    v2.uicorner = createElement("UICorner", v3)
    return createElement("Frame", v1, v2)
end