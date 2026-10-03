-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.PlaytimeRewards.Holder
-- Decompile time: 0.98 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
return React.memo(function(a1) -- Line: 14 -- upvalues: React (val) -- types: a1: table
    local Size = a1.Size
    local Position = a1.Position
    local v1 = {UICorner = React.createElement("UICorner", {CornerRadius = UDim.new(0, 8)})}
    v1.UIStroke = React.createElement("UIStroke", {Thickness = 1, Color = Color3.fromRGB(255, 255, 255)})
    local children = a1.children
    if children then
        for i, j in children do
            v1[i] = j
        end
    end
    local createElement_3 = React.createElement
    local v2 = {BorderSizePixel = 0, BackgroundTransparency = 0.35}
    local AnchorPoint = a1.AnchorPoint or Vector2.new(0.5, 0.5)
    v2.AnchorPoint = AnchorPoint
    v2.Position = Position
    v2.Size = Size
    v2.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    local AutomaticSize = a1.AutomaticSize or Enum.AutomaticSize.None
    v2.AutomaticSize = AutomaticSize
    return createElement_3("Frame", v2, v1)
end)