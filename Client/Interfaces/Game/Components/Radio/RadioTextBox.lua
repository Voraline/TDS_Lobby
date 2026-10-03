-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.Radio.RadioTextBox
-- Decompile time: 2.04 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local u28 = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(85, 170, 0)),
    (ColorSequenceKeypoint.new(1, Color3.fromRGB(225, 255, 178))),
})
local u47 = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(170, 0, 0)),
    (ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 178, 178))),
})
local u66 = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 170, 170)),
    (ColorSequenceKeypoint.new(1, Color3.fromRGB(178, 255, 255))),
})
local u71 = Color3.fromRGB(37, 74, 0)
local u76 = Color3.fromRGB(74, 0, 0)
local u81 = Color3.fromRGB(0, 74, 74)
return function(a1) -- Line: 33
    -- upvalues: React (val), u47 (val), u66 (val), u28 (val), u76 (val), u81 (val), u71 (val)
    local radioState = a1.radioState
    local createElement = React.createElement
    local v1 = {Active = true, BorderSizePixel = 0, Selectable = true}
    local AnchorPoint = a1.AnchorPoint or Vector2.new(0.5, 0.5)
    v1.AnchorPoint = AnchorPoint
    v1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    v1.BorderColor3 = Color3.fromRGB(0, 0, 0)
    local Position = a1.Position or UDim2.fromScale(0.5, 0.4)
    v1.Position = Position
    local Size = a1.Size or UDim2.fromScale(0.46, 0.3)
    v1.Size = Size
    local v2 = {
        uICorner = React.createElement("UICorner", {CornerRadius = UDim.new(0.15, 0)}),
        uIGradient = React.createElement("UIGradient", {
            Rotation = 90,
            Color = if radioState ~= "incorrect" then if radioState ~= "correct" then u28 else u66 else u47,
        }),
    }
    local createElement_4 = React.createElement
    local v3 = {
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BackgroundTransparency = 1,
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        BorderSizePixel = 0,
        FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
        PlaceholderColor3 = if radioState ~= "incorrect" then if radioState ~= "correct" then u71 else u81 else u76,
        PlaceholderText = if radioState ~= "incorrect" then if radioState ~= "sending" then if radioState ~= "correct" then "[ ENTER CODE ]" else "[ ACCEPTED ]" else "[ SENDING ]" else "[ REJECTED ]",
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(1, 1),
        Text = a1.Text or "",
        TextColor3 = Color3.fromRGB(0, 0, 0),
        TextScaled = true,
        TextSize = 14,
        TextEditable = radioState ~= "incorrect",
        TextWrapped = true,
    }

    v3[React.Change.Text] = function(a1_2) -- Line: 87 -- upvalues: a1 (val)
        if a1.onTextChanged then
            a1.onTextChanged(a1_2.Text)
        end
    end

    v2.textBox = createElement_4("TextBox", v3, {
        uICorner1 = React.createElement("UICorner", {CornerRadius = UDim.new(0.15, 0)}),
        uIPadding = React.createElement("UIPadding", {
            PaddingBottom = UDim.new(0.35, 0),
            PaddingLeft = UDim.new(0.05, 0),
            PaddingRight = UDim.new(0.05, 0),
            PaddingTop = UDim.new(0.35, 0),
        }),
    })
    v2.uIStroke = React.createElement("UIStroke", {Thickness = 2, Color = Color3.fromRGB(204, 204, 204)})
    return createElement("Frame", v1, v2)
end