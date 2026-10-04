-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.PlaytimeRewards.TextLabel
-- Decompile time: 1.48 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
return React.memo(function(a1) -- Line: 17 -- upvalues: React (val) -- types: a1: table
    local v1 = table.clone(a1.children or {})
    if v1.UIStroke == nil then
        v1.UIStroke = React.createElement("UIStroke", {
            Thickness = 3,
            Color = Color3.fromRGB(0, 0, 0),
            ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual,
        })
    end
    local createElement_2 = React.createElement
    local v2 = {TextScaled = true, AnchorPoint = a1.AnchorPoint, Size = a1.Size}
    local BackgroundColor3 = a1.BackgroundColor3 or Color3.fromRGB(255, 255, 255)
    v2.BackgroundColor3 = BackgroundColor3
    v2.Position = a1.Position
    v2.BackgroundTransparency = if a1.BackgroundColor3 == nil then 1 else 0
    v2.Text = a1.Text
    v2.TextColor3 = Color3.fromRGB(255, 255, 255)
    v2.FontFace = Font.fromName("Montserrat", a1.FontWeight or Enum.FontWeight.Bold, Enum.FontStyle.Normal)
    local TextXAlignment = a1.TextXAlignment or Enum.TextXAlignment.Center
    v2.TextXAlignment = TextXAlignment
    v2.LayoutOrder = a1.LayoutOrder
    return createElement_2("TextLabel", v2, v1)
end)