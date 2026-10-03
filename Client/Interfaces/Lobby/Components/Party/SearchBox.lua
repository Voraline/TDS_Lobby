-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.Party.SearchBox
-- Decompile time: 1.02 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local TextBox = require(ReplicatedStorage.Client.Interfaces.Components.TextBox)
local createElement = React.createElement
return function(a1) -- Line: 22 -- upvalues: createElement (val), TextBox (val) -- types: a1: table
    local v1 = a1.placeholderText or "Type to search"
    local v2 = {}
    local backgroundColor = a1.backgroundColor or Color3.fromRGB(0, 0, 0)
    v2.BackgroundColor3 = backgroundColor
    v2.BackgroundTransparency = a1.backgroundTransparency or 0.5
    local position = a1.position or UDim2.fromOffset(512, 32)
    v2.Position = position
    local size = a1.size or UDim2.fromOffset(240, 24)
    v2.Size = size
    v2.BorderSizePixel = a1.borderSizePixel or 0
    local borderColor = a1.borderColor or Color3.fromRGB(0, 0, 0)
    v2.BorderColor3 = borderColor
    v2.ZIndex = a1.zIndex or 1
    return createElement("Frame", v2, {
        uiCorner = createElement("UICorner", {CornerRadius = UDim.new(0, 4)}),
        uiStroke = createElement("UIStroke", {Color = Color3.fromRGB(255, 255, 255)}),
        searchBox = createElement(TextBox, {
            FontWeight = "Bold",
            Text = "",
            TextScaled = true,
            TextSize = 14,
            TextWrapped = true,
            AutoLocalize = false,
            PlaceholderText = v1,
            TextColor3 = a1.textColor,
            TextXAlignment = Enum.TextXAlignment.Left,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.new(0.9, 0, 0, 35),
            OnTextChanged = function(a1_2) -- Line: 56 -- upvalues: a1 (val) -- types: a1_2: userdata
                if a1.onTextChanged then
                    a1.onTextChanged(a1_2.Text)
                end
            end,
        }, {uiTextSizeConstraint = createElement("UITextSizeConstraint", {MaxTextSize = 18})}),
    })
end