-- Script path: ReplicatedStorage.Client.Interfaces.Universal.Components.Objectives.Objective
-- Decompile time: 3.71 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local ProgressBar = require(ReplicatedStorage.Client.Interfaces.Universal.Components.ProgressBar)
local createElement = React.createElement
return function(a1) -- Line: 9 -- upvalues: createElement (val), ProgressBar (val)
    local v1 = {
        BackgroundTransparency = 1,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        LayoutOrder = a1.LayoutOrder or 1,
        AutomaticSize = Enum.AutomaticSize.Y,
        Size = UDim2.fromScale(1, 0),
    }
    local v2 = {}
    local v3 = {
        TextSize = 20,
        BackgroundTransparency = 0.5,
        FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
        Text = a1.Title,
        TextColor3 = Color3.fromRGB(65, 65, 65),
        AutomaticSize = Enum.AutomaticSize.X,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        Size = UDim2.fromOffset(0, 24),
    }
    local v4 = {
        padding = createElement("UIPadding", {PaddingLeft = UDim.new(0, 32), PaddingRight = UDim.new(0, 8)}),
        corner = createElement("UICorner"),
    }
    local v5 = {Rotation = 45, ZIndex = 0, AnchorPoint = Vector2.new(0.5, 0.5)}
    local ObjectiveColor = a1.ObjectiveColor or Color3.fromRGB(255, 255, 127)
    v5.BackgroundColor3 = ObjectiveColor
    v5.Position = UDim2.new(0, -24, 0.5, 0)
    v5.Size = UDim2.fromOffset(24, 24)
    v4.shape = createElement("Frame", v5, {
        corner = createElement("UICorner"),
        stroke = createElement("UIStroke", {Thickness = 2, Transparency = 0.5}),
    })
    v4.icon = createElement("ImageLabel", {
        Image = "http://www.roblox.com/asset/?id=9363073916",
        BackgroundTransparency = 1,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 127),
        Position = UDim2.new(0, -24, 0.5, 0),
        Size = UDim2.fromOffset(20, 20),
    })
    v2.title = createElement("TextLabel", v3, v4)
    v2.task = createElement("Frame", {
        BackgroundTransparency = 1,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        Position = UDim2.fromOffset(0, 30),
        Size = UDim2.new(1, 0, 0, 0),
        AutomaticSize = Enum.AutomaticSize.Y,
    }, {
        listLayout = createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical,
            HorizontalAlignment = Enum.HorizontalAlignment.Left,
            SortOrder = Enum.SortOrder.LayoutOrder,
            VerticalAlignment = Enum.VerticalAlignment.Top,
            Padding = UDim.new(0, 8),
        }),
        description = createElement("TextLabel", {
            BackgroundTransparency = 1,
            TextWrapped = true,
            LayoutOrder = 1,
            FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
            Text = a1.GoalDescription,
            TextColor3 = Color3.fromRGB(255, 255, 255),
            TextSize = a1.GoalDescriptionTextSize or 20,
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            AutomaticSize = Enum.AutomaticSize.Y,
            Size = UDim2.new(1, 0, 0, 0),
        }, {stroke = createElement("UIStroke", {Thickness = 2, Transparency = 0.5})}),
        progress = createElement(ProgressBar, {
            LayoutOrder = 2,
            Value = a1.Progress,
            Size = UDim2.new(1, 0, 0, 10),
            Position = UDim2.fromOffset(0, 26),
        }),
        padding = createElement("UIPadding", {PaddingLeft = UDim.new(0, 16), PaddingRight = UDim.new(0, 16)}),
    })
    return createElement("Frame", v1, v2)
end