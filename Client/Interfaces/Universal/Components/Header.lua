-- Script path: ReplicatedStorage.Client.Interfaces.Universal.Components.Header
-- Decompile time: 0.86 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local createElement = require(ReplicatedStorage.Shared.UI.React).createElement
return function(a1) -- Line: 15 -- upvalues: createElement (val) -- types: a1: table
    return createElement("TextLabel", {
        BackgroundTransparency = 1,
        Position = a1.Position,
        Size = a1.Size,
        FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
        Text = a1.Title,
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextSize = a1.TextSize,
        TextXAlignment = Enum.TextXAlignment.Left,
    }, {
        icon = createElement("ImageLabel", {
            BackgroundTransparency = 1,
            AnchorPoint = Vector2.new(0, 0.5),
            Image = a1.TitleIcon,
            ScaleType = Enum.ScaleType.Stretch,
            Position = UDim2.new(0, -a1.Size.Y.Offset, 0.5, 0),
            Size = UDim2.fromOffset(a1.Size.Y.Offset * 0.625, a1.Size.Y.Offset * 0.625),
        }),
        underline = createElement("Frame", {
            Position = UDim2.new(0, -a1.Size.Y.Offset, 1, 0),
            Size = UDim2.new(1, a1.Size.Y.Offset, 0, 2),
        }, {
            uiGradient = createElement("UIGradient", {
                Color = ColorSequence.new(Color3.fromRGB(255, 255, 255)),
                Transparency = NumberSequence.new(0.5, 1),
            }),
        }),
    })
end