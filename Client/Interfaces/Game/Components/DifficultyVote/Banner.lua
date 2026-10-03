-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.DifficultyVote.Banner
-- Decompile time: 0.91 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local createElement = require(ReplicatedStorage.Shared.UI.React).createElement
return function(a1) -- Line: 6 -- upvalues: createElement (val)
    local v1 = {
        BorderSizePixel = 0,
        LayoutOrder = 5,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.5, 1),
        Size = UDim2.new(0.5, 0, 0, 8),
    }
    local Revamped = a1.Revamped or a1.NewMode or a1.SubTitle or false
    v1.Visible = Revamped
    return createElement("Frame", v1, {
        textLabel = createElement("TextLabel", {
            TextSize = 16,
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Heavy, Enum.FontStyle.Normal),
            Text = if not a1.SubTitle then if not a1.Revamped then "[NEW]" else "[REVAMPED]" else a1.SubTitle,
            TextColor3 = Color3.fromRGB(255, 170, 0),
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.new(1, 0, 0, 16),
        }, {uIStroke6 = createElement("UIStroke", {Thickness = 3})}),
        uIGradient = createElement("UIGradient", {
            Transparency = NumberSequence.new({
                NumberSequenceKeypoint.new(0, 1),
                NumberSequenceKeypoint.new(0.5, 0),
                (NumberSequenceKeypoint.new(1, 1)),
            }),
        }),
    })
end