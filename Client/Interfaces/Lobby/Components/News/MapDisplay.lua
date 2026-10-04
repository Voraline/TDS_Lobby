-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.News.MapDisplay
-- Decompile time: 2.30 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local createElement = require(ReplicatedStorage.Shared.UI.React).createElement
return function(a1) -- Line: 12 -- upvalues: createElement (val) -- types: a1: table
    return createElement("Frame", {
        BackgroundTransparency = 0.8,
        Size = UDim2.new(0.919, 0, 0, 45),
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        LayoutOrder = a1.LayoutOrder,
    }, {
        uiCorner = createElement("UICorner", {CornerRadius = UDim.new(0, 4)}),
        uiStroke = createElement("UIStroke", {Thickness = 1, Transparency = 0.2, Color = Color3.fromRGB(104, 104, 104)}),
        subject = createElement("TextLabel", {
            BackgroundTransparency = 1,
            TextSize = 20,
            LayoutOrder = 0,
            Size = UDim2.fromScale(1, 1),
            Text = a1.MapName,
            TextColor3 = Color3.fromRGB(255, 255, 255),
            TextXAlignment = Enum.TextXAlignment.Left,
            FontFace = Font.fromEnum(Enum.Font.SourceSansSemibold),
        }, {
            uiPadding = createElement("UIPadding", {PaddingLeft = UDim.new(0, 8), PaddingRight = UDim.new(0, 8)}),
        }),
        mapIcon = createElement("ImageLabel", {
            BackgroundTransparency = 1,
            ImageTransparency = 0,
            LayoutOrder = 1,
            Size = UDim2.fromScale(0.7, 1),
            AnchorPoint = Vector2.new(1, 0.5),
            Position = UDim2.fromScale(1, 0.5),
            Image = "rbxassetid://" .. a1.MapIcon,
            ScaleType = Enum.ScaleType.Crop,
        }, {
            uiCorner = createElement("UICorner", {CornerRadius = UDim.new(0, 4)}),
            uiGradient = createElement("UIGradient", {
                Rotation = 180,
                Transparency = NumberSequence.new({
                    NumberSequenceKeypoint.new(0, 0),
                    NumberSequenceKeypoint.new(0.5, 0),
                    (NumberSequenceKeypoint.new(1, 1)),
                }),
            }),
        }),
    })
end