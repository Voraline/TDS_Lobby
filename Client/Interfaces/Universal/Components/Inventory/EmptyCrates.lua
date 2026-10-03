-- Script path: ReplicatedStorage.Client.Interfaces.Universal.Components.Inventory.EmptyCrates
-- Decompile time: 0.90 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local Button = require(script.Parent.Button)
local createElement = React.createElement
return React.memo(function(a1) -- Line: 16 -- upvalues: createElement (val), Button (val) -- types: a1: table
    return createElement("Frame", {
        BackgroundTransparency = 1,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.54),
        Size = UDim2.fromScale(0.8, 0.3),
    }, {
        Layout = createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical,
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            Padding = UDim.new(0.04, 0),
            SortOrder = Enum.SortOrder.LayoutOrder,
            VerticalAlignment = Enum.VerticalAlignment.Center,
        }),
        Message = createElement("TextLabel", {
            BackgroundTransparency = 1,
            LayoutOrder = 1,
            Text = "You have no crates!",
            TextScaled = true,
            FontFace = Font.fromName("Montserrat", Enum.FontWeight.ExtraBold, Enum.FontStyle.Normal),
            Size = UDim2.fromScale(1, 0.28),
            TextColor3 = Color3.new(1, 1, 1),
        }, {
            SizeConstraint = createElement("UITextSizeConstraint", {MaxTextSize = 32, MinTextSize = 18}),
            Stroke = createElement("UIStroke", {Thickness = 2, Transparency = 0.5}),
        }),
        GoToShop = createElement(Button, {
            dontScale = true,
            dontUseRatio = true,
            layoutOrder = 2,
            text = "Go to Shop",
            textSize = 18,
            color = Color3.fromRGB(0, 217, 255),
            onClick = a1.onGoToShop,
            size = UDim2.fromOffset(200, 54),
        }),
    })
end)