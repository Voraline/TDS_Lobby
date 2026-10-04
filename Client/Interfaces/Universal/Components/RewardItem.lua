-- Script path: ReplicatedStorage.Client.Interfaces.Universal.Components.RewardItem
-- Decompile time: 1.94 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local createElement = require(ReplicatedStorage.Shared.UI.React).createElement
return function(a1) -- Line: 16 -- upvalues: createElement (val) -- types: a1: table
    return createElement("Frame", {
        BackgroundTransparency = 0.8,
        AnchorPoint = a1.AnchorPoint,
        Size = a1.Size,
        Position = a1.Position,
        BackgroundColor3 = Color3.fromRGB(124, 124, 124),
        LayoutOrder = a1.LayoutOrder,
    }, {
        uicorner = createElement("UICorner", {CornerRadius = UDim.new(0, 8)}),
        uistroke = createElement("UIStroke", {
            Thickness = 1,
            Transparency = 0.5,
            ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
            Color = Color3.fromRGB(0, 0, 0),
        }),
        imageLabel = createElement("ImageLabel", {
            BackgroundTransparency = 0.5,
            AnchorPoint = Vector2.new(0.5, 0),
            BackgroundColor3 = Color3.fromRGB(109, 109, 109),
            Position = UDim2.new(0.5, 0, 0, 12),
            Size = UDim2.fromScale(0.8, 0.8),
            Image = a1.Icon,
        }, {
            uiAspectRatioConstraint = createElement("UIAspectRatioConstraint"),
            uiCorner = createElement("UICorner", {CornerRadius = UDim.new(0, 6)}),
            uistroke = createElement("UIStroke", {
                Thickness = 2,
                Transparency = 0.8,
                ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual,
                Color = Color3.fromRGB(255, 255, 255),
                LineJoinMode = Enum.LineJoinMode.Round,
            }),
        }),
        textLabel = createElement("TextLabel", {
            BackgroundTransparency = 1,
            ZIndex = 2,
            TextScaled = true,
            AnchorPoint = Vector2.new(0.5, 1),
            Position = UDim2.new(0.5, 0, 1, -14),
            Size = UDim2.new(1, -20, 0, 32),
            Text = a1.RewardText,
            TextColor3 = Color3.fromRGB(255, 255, 255),
            FontFace = Font.fromEnum(Enum.Font.GothamBlack),
        }, {
            uistroke = createElement("UIStroke", {
                Thickness = 2,
                Transparency = 0,
                ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual,
                Color = Color3.fromRGB(0, 0, 0),
                LineJoinMode = Enum.LineJoinMode.Round,
            }),
        }),
    })
end