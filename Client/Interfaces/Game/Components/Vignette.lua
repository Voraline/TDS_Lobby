-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.Vignette
-- Decompile time: 0.44 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local createElement = require(ReplicatedStorage.Shared.UI.React).createElement
return function(a1) -- Line: 6 -- upvalues: createElement (val) -- types: a1: table
    local v1 = {
        BackgroundTransparency = 1,
        ImageTransparency = a1.transparency,
        ImageColor3 = a1.color,
    }
    local AnchorPoint = a1.AnchorPoint or Vector2.new(0.5, 0.5)
    v1.AnchorPoint = AnchorPoint
    local Size = a1.Size or UDim2.new(1, 0, 1, 0)
    v1.Size = Size
    v1.Position = UDim2.new(0.5, 0, 0.5, 0)
    v1.Image = "rbxassetid://" .. (a1.Image or "15644830771")
    return createElement("ImageLabel", v1)
end