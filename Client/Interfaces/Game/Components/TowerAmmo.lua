-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.TowerAmmo
-- Decompile time: 2.99 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local createElement = require(ReplicatedStorage.Shared.UI.React).createElement
return function(a1) -- Line: 5 -- upvalues: createElement (val)
    local v1 = a1.MaxAmmo or 100
    local v2 = a1.Ammo or 0
    local v3 = a1.Reloading or false
    local v4 = {BackgroundTransparency = 0.4, BorderSizePixel = 0}
    local AnchorPoint = a1.AnchorPoint or Vector2.new(0.5, 1)
    v4.AnchorPoint = AnchorPoint
    v4.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    local Position = a1.Position or UDim2.new(0.5, 0, 0, -8)
    v4.Position = Position
    local Size = a1.Size or UDim2.new(1, -64, 0, 16)
    v4.Size = Size
    v4.Visible = v1 > 0
    return createElement("Frame", v4, {
        reloadingBar = createElement("Frame", {
            BackgroundTransparency = 0.1,
            BorderSizePixel = 0,
            ZIndex = 7,
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.fromRGB(255, 52, 89),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromScale(1, 1),
            Visible = v3,
        }, {
            textLabel = createElement("TextLabel", {
                Text = "RELOADING",
                TextScaled = true,
                TextSize = 12,
                TextStrokeTransparency = 0,
                TextWrapped = true,
                BackgroundTransparency = 1,
                FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.ExtraBold, Enum.FontStyle.Normal),
                TextColor3 = Color3.fromRGB(255, 255, 255),
                Size = UDim2.fromScale(1, 0.9),
            }),
        }),
        bar = createElement("Frame", {
            BackgroundTransparency = 1,
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.new(1, -4, 1, -4),
        }, {
            progress = createElement("Frame", {
                AnchorPoint = Vector2.new(0.5, 0),
                BackgroundColor3 = Color3.fromRGB(255, 170, 0),
                Position = UDim2.fromScale(0.5, 0),
                Size = UDim2.fromScale(v2 / v1, 1),
            }),
        }),
        textLabel = createElement("TextLabel", {
            TextScaled = true,
            TextSize = 12,
            TextStrokeTransparency = 0,
            TextWrapped = true,
            BackgroundTransparency = 1,
            ZIndex = 4,
            FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Heavy, Enum.FontStyle.Normal),
            Text = string.format("%d/%d", v2, v1),
            TextColor3 = Color3.fromRGB(255, 255, 255),
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.new(1, 0, 1, -4),
        }),
        uIStroke = createElement("UIStroke", {
            Color = Color3.fromRGB(255, 255, 255),
            LineJoinMode = Enum.LineJoinMode.Bevel,
        }),
    })
end