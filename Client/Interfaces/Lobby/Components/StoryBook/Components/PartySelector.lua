-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.StoryBook.Components.PartySelector
-- Decompile time: 3.64 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local createElement = React.createElement
return function(a1) -- Line: 13 -- upvalues: createElement (val), React (val) -- types: a1: table
    local v1, v2, v3, v4, v5
    local v6 = {
        UIListLayout = createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal,
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            VerticalAlignment = Enum.VerticalAlignment.Center,
            SortOrder = Enum.SortOrder.LayoutOrder,
            Padding = UDim.new(0.03, 0),
        }),
    }
    local v7 = nil
    local v8 = nil
    for i, j in a1.sizes, v7, v8 do
        v5 = ("Size_%*"):format(j)
        v1 = {}
        v2 = if a1.selected ~= j then Color3.fromRGB(90, 90, 90) else Color3.fromRGB(0, 255, 150)
        v1.BackgroundColor3 = v2
        v1.BorderSizePixel = 0
        v1.LayoutOrder = j
        v1.Size = UDim2.fromScale(0.24, 0.8)

        v1[React.Event.Activated] = function() -- Line: 33 -- upvalues: a1 (val), j (val)
            a1.onSelect(j)
        end

        v2 = {UIAspectRatioConstraint = createElement("UIAspectRatioConstraint", {AspectRatio = 1})}
        v2.UICorner = createElement("UICorner", {CornerRadius = UDim.new(0.15, 0)})
        v3 = {
            Thickness = 0.075,
            ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
            StrokeSizingMode = Enum.StrokeSizingMode.ScaledSize,
        }
        v4 = not (a1.selected ~= j) and Color3.fromRGB(0, 187, 109) or Color3.fromRGB(75, 75, 75)
        v3.Color = v4
        v2.UIStroke = createElement("UIStroke", v3)
        v2.Label = createElement("TextLabel", {
            BackgroundTransparency = 1,
            TextScaled = true,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromScale(0.8, 0.8),
            FontFace = Font.fromName("Montserrat", Enum.FontWeight.Heavy),
            Text = tostring(j),
            TextColor3 = Color3.fromRGB(255, 255, 255),
        }, {
            UIStroke = createElement("UIStroke", {Thickness = 0.05, StrokeSizingMode = Enum.StrokeSizingMode.ScaledSize}),
        })
        v6[v5] = (createElement("ImageButton", v1, v2))
    end
    return createElement("Frame", {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(0, 1),
        Position = UDim2.fromScale(0.27, 0.595),
        Size = UDim2.fromScale(0.3, 0.16),
    }, {
        PartySizeLabel = createElement("TextLabel", {
            BackgroundTransparency = 1,
            Text = "Party Size:",
            TextScaled = true,
            AnchorPoint = Vector2.new(0.5, 1),
            Position = UDim2.fromScale(0.5, 0.42),
            Size = UDim2.fromScale(1, 0.42),
            FontFace = Font.fromName("Montserrat", Enum.FontWeight.Heavy),
            TextColor3 = Color3.fromRGB(255, 255, 255),
        }, {UIStroke = createElement("UIStroke", {Thickness = 2})}),
        SizeList = createElement("Frame", {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            AnchorPoint = Vector2.new(0.5, 1),
            Position = UDim2.fromScale(0.5, 1),
            Size = UDim2.fromScale(1, 0.5),
        }, v6),
    })
end