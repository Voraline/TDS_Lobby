-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.Sandbox.QuickCmds.QuickCmdButton
-- Decompile time: 3.01 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local createElement = React.createElement
return function(a1) -- Line: 16 -- upvalues: createElement (val), React (val) -- types: a1: table
    local v1 = {Position = a1.position, AnchorPoint = a1.anchorPoint}
    local size = a1.size or UDim2.fromScale(0, 1)
    v1.Size = size
    v1.AutomaticSize = Enum.AutomaticSize.X
    v1.BackgroundColor3 = Color3.fromRGB(170, 170, 170)
    v1.BorderColor3 = Color3.fromRGB(0, 0, 0)
    v1.BorderSizePixel = 0
    v1.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json")
    v1.Text = ""
    v1.TextColor3 = Color3.fromRGB(0, 0, 0)
    v1.TextSize = 14
    v1.LayoutOrder = a1.layoutOrder

    v1[React.Event.Activated] = function() -- Line: 35 -- upvalues: a1 (val)
        if a1.clicked then
            a1.clicked()
        end
    end

    return createElement("TextButton", v1, {
        textLabel = createElement("TextLabel", {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            TextSize = 20,
            TextWrapped = true,
            AnchorPoint = Vector2.new(0, 0),
            Position = UDim2.fromScale(0, 0),
            Size = UDim2.fromScale(0, 1),
            AutomaticSize = Enum.AutomaticSize.X,
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
            Text = a1.displayText,
            TextColor3 = Color3.fromRGB(255, 255, 255),
        }, {
            uIStroke = createElement("UIStroke", {Thickness = 2}),
            uIPadding = createElement("UIPadding", {
                PaddingLeft = UDim.new(0, 10),
                PaddingRight = UDim.new(0, 10),
                PaddingTop = UDim.new(0, 4),
                PaddingBottom = UDim.new(0, 2),
            }),
        }),
        uICorner = createElement("UICorner", {CornerRadius = UDim.new(0, 4)}),
        uIStroke1 = createElement("UIStroke", {
            Thickness = 2,
            ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
            Color = Color3.fromRGB(255, 255, 255),
        }, {
            uIGradient = createElement("UIGradient", {
                Rotation = -90,
                Color = ColorSequence.new({
                    ColorSequenceKeypoint.new(0, Color3.fromRGB(58, 58, 58)),
                    (ColorSequenceKeypoint.new(1, Color3.fromRGB(209, 209, 209))),
                }),
            }),
        }),
        uISizeConstraint = createElement("UISizeConstraint", {MaxSize = Vector2.new((1 / 0), 24)}),
    })
end