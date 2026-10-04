-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.Radio.RadioCloseButton
-- Decompile time: 1.82 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
return function(a1) -- Line: 16 -- upvalues: React (val) -- types: a1: table
    local createElement = React.createElement
    local v1 = {}
    local AnchorPoint = a1.AnchorPoint or Vector2.new(0.5, 0.5)
    v1.AnchorPoint = AnchorPoint
    v1.BackgroundColor3 = Color3.fromRGB(255, 60, 60)
    v1.BorderColor3 = Color3.fromRGB(0, 0, 0)
    v1.BorderSizePixel = 0
    v1.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json")
    local Position = a1.Position or UDim2.fromScale(0.969, 0.0208)
    v1.Position = Position
    local Size = a1.Size or UDim2.fromScale(0.15, 0.1)
    v1.Size = Size
    v1.Text = ""
    v1.TextColor3 = Color3.fromRGB(0, 0, 0)
    v1.TextScaled = true
    v1.TextSize = 14
    v1.TextWrapped = true
    v1.ZIndex = a1.ZIndex
    v1.ref = a1.ButtonRef
    v1[React.Event.Activated] = a1.onActivated
    return createElement("TextButton", v1, {
        uICorner = React.createElement("UICorner", {CornerRadius = UDim.new(0.167, 0)}),
        uIStroke = React.createElement("UIStroke", {
            Thickness = 2,
            ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
            Color = Color3.fromRGB(168, 58, 58),
        }),
        imageLabel = React.createElement("ImageLabel", {
            BackgroundTransparency = 0.999,
            BorderSizePixel = 0,
            Image = "rbxassetid://132339685519457",
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromScale(0.533, 0.533),
        }),
        uIAspectRatioConstraint = React.createElement("UIAspectRatioConstraint"),
        uITextSizeConstraint = React.createElement("UITextSizeConstraint", {MaxTextSize = 38}),
    })
end