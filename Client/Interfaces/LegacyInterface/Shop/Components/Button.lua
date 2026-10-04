-- Script path: ReplicatedStorage.Client.Interfaces.LegacyInterface.Shop.Components.Button
-- Decompile time: 3.09 ms

local Fusion = require(game.ReplicatedStorage.Shared.UI.Fusion)
local New = Fusion.New
local Children = Fusion.Children
local Cleanup = Fusion.Cleanup
local OnEvent = Fusion.OnEvent
return function(a1) -- Line: 7 -- upvalues: New (val), Cleanup (val), OnEvent (val), Children (val)
    local TextButton = New("TextButton")
    local v1 = {Text = a1.Text, BackgroundTransparency = a1.BackgroundTransparency}
    local Color = a1.Color or Color3.fromRGB(68, 74, 113)
    v1.BackgroundColor3 = Color
    v1.AnchorPoint = a1.AnchorPoint
    v1.Position = a1.Position
    v1.Size = a1.Size
    v1[Cleanup] = a1[Cleanup]
    local Activated = OnEvent("Activated")
    v1[Activated] = a1.Clicked
    local MouseEnter = OnEvent("MouseEnter")
    v1[MouseEnter] = a1.MouseEnter
    local MouseLeave = OnEvent("MouseLeave")
    v1[MouseLeave] = a1.MouseLeave
    local v2 = {}
    local v3 = New("UICorner")({})
    local UIStroke = New("UIStroke")
    local v4 = {
        ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
        Thickness = a1.StrokeThickness or 1,
    }
    local StrokeColor = a1.StrokeColor or Color3.fromRGB(255, 255, 255)
    v4.Color = StrokeColor
    local v5 = UIStroke(v4)
    v2[1] = v3
    v2[2] = v5
    v2[3] = a1[Children]
    v1[Children] = v2
    return TextButton(v1)
end