-- Script path: ReplicatedStorage.Client.Interfaces.Universal.Components.Inventory.DisplayPannel
-- Decompile time: 0.48 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local createElement = React.createElement
return React.memo(function(a1) -- Line: 14 -- upvalues: createElement (val) -- types: a1: table
    local v1 = {BackgroundTransparency = 1, AnchorPoint = Vector2.new(1, 0)}
    local Position = a1.Position or UDim2.fromScale(1, 0)
    v1.Position = Position
    v1.Size = UDim2.fromScale(0.45, 1)
    v1.Visible = a1.Visible
    return createElement("Frame", v1, a1.children)
end)