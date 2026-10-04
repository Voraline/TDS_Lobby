-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.Sandbox.Searchbox
-- Decompile time: 3.78 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local createElement = React.createElement
return function(a1) -- Line: 6 -- upvalues: createElement (val), React (val)
    local v1 = createElement
    local v2 = {
        BackgroundTransparency = 1,
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        Size = UDim2.new(1, 0, 0, 45),
    }
    local v3 = {
        stroke = createElement("UIStroke", {Thickness = 1, Transparency = 0.4, Color = Color3.new(1, 1, 1)}),
        dropShadow = createElement("ImageLabel", {
            Image = "rbxassetid://9239716855",
            ImageTransparency = 0.2,
            BackgroundTransparency = 1,
            ZIndex = -1,
            ScaleType = Enum.ScaleType.Slice,
            SliceCenter = Rect.new(14, 14, 64, 24),
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.new(1, 14, 1, 14),
        }),
    }
    local v4 = createElement
    local v5 = {
        BackgroundTransparency = 1,
        Size = UDim2.new(1, -20, 1, -15),
        Position = UDim2.fromScale(0.5, 0.5),
        AnchorPoint = Vector2.new(0.5, 0.5),
    }
    local v6 = {
        listLayout = createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal,
            HorizontalAlignment = Enum.HorizontalAlignment.Left,
            SortOrder = Enum.SortOrder.LayoutOrder,
            VerticalAlignment = Enum.VerticalAlignment.Center,
            Padding = UDim.new(0, 10),
        }),
        icon = createElement("ImageLabel", {
            Image = "rbxassetid://10762683760",
            BackgroundTransparency = 1,
            LayoutOrder = 0,
            AnchorPoint = Vector2.new(0, 0.5),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            Position = UDim2.new(0, 8, 0.5, 0),
            Size = UDim2.fromScale(1, 1),
            SizeConstraint = Enum.SizeConstraint.RelativeYY,
        }),
    }
    local v7 = createElement
    local v8 = {
        FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
        PlaceholderText = a1.Text or "Search for Maps",
        Text = "",
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextScaled = true,
        TextSize = 14,
        TextWrapped = true,
        TextXAlignment = Enum.TextXAlignment.Left,
        AnchorPoint = Vector2.new(0, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BackgroundTransparency = 1,
        Position = UDim2.fromScale(0, 0.5),
        Size = UDim2.new(0, 0, 1, -12),
        LayoutOrder = 1,
    }

    v8[React.Change.Text] = function(a1_2) -- Line: 76 -- upvalues: a1 (val) -- types: a1_2: userdata
        if a1.OnSearch then
            a1.OnSearch(a1_2.Text:lower())
        end
    end

    v6.search = v7("TextBox", v8, {flex = createElement("UIFlexItem", {FlexMode = Enum.UIFlexMode.Grow})})
    v3.content = v4("Frame", v5, v6)
    return v1("Frame", v2, v3)
end