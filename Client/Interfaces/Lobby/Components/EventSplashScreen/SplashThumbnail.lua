-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.EventSplashScreen.SplashThumbnail
-- Decompile time: 0.99 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Outline = require(ReplicatedStorage.Client.Interfaces.Universal.Components.Outline)
local createElement = require(ReplicatedStorage.Shared.UI.React).createElement
return function(a1) -- Line: 17 -- upvalues: createElement (val), Outline (val) -- types: a1: table
    return createElement("ImageLabel", {
        BackgroundTransparency = 1,
        Size = a1.Size,
        Position = a1.Position,
        AnchorPoint = a1.AnchorPoint,
        Image = a1.Image,
        ScaleType = Enum.ScaleType.Crop,
    }, {
        uicorner = createElement("UICorner", {CornerRadius = UDim.new(0, 8)}),
        outline = createElement(Outline, {Size = a1.Size + UDim2.fromOffset(16, 16)}),
        label = createElement("TextLabel", {
            BackgroundTransparency = 1,
            TextScaled = true,
            AnchorPoint = Vector2.new(0.5, 1),
            Size = UDim2.new(0.9, 0, 0, 32),
            Position = UDim2.new(0.5, 0, 1, -32),
            FontFace = Font.fromEnum(Enum.Font.Cartoon),
            TextColor3 = Color3.fromRGB(255, 233, 120),
            Text = a1.Description,
        }, {
            uistroke = createElement("UIStroke", {
                Thickness = 4,
                Transparency = 0.5,
                ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual,
                Color = Color3.fromRGB(0, 0, 0),
            }),
        }),
        smallLabel = if a1.SmallDescription == nil then nil else createElement("TextLabel", {
            BackgroundTransparency = 1,
            TextScaled = true,
            AnchorPoint = Vector2.new(0.5, 1),
            Size = UDim2.new(0.9, 0, 0, 16),
            Position = UDim2.new(0.5, 0, 1, -12),
            FontFace = Font.fromEnum(Enum.Font.Cartoon),
            TextColor3 = Color3.fromRGB(255, 233, 120),
            Text = a1.SmallDescription,
        }, {
            uistroke = createElement("UIStroke", {
                Thickness = 4,
                Transparency = 0.5,
                ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual,
                Color = Color3.fromRGB(0, 0, 0),
            }),
        }),
    })
end