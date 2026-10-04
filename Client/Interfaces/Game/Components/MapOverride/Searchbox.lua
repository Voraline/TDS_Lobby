-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.MapOverride.Searchbox
-- Decompile time: 1.22 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local createElement = React.createElement
return function(a1) -- Line: 6 -- upvalues: createElement (val), React (val)
    local v1 = createElement
    local v2 = {
        BackgroundTransparency = 0.3,
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        Size = UDim2.new(1, 0, 0, 32),
    }
    local v3 = {
        corner = createElement("UICorner"),
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
        Size = UDim2.new(1, 0, 1, -12),
    }

    v5[React.Change.Text] = function(a1_2) -- Line: 46 -- upvalues: a1 (val) -- types: a1_2: userdata
        if a1.OnSearch then
            a1.OnSearch(a1_2.Text:lower())
        end
    end

    v3.serach = v4("TextBox", v5, {padding = createElement("UIPadding", {PaddingLeft = UDim.new(0, 32)})})
    v3.icon = createElement("ImageLabel", {
        Image = "rbxassetid://10762683760",
        BackgroundTransparency = 1,
        AnchorPoint = Vector2.new(0, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        Position = UDim2.new(0, 8, 0.5, 0),
        Size = UDim2.fromOffset(16, 16),
    })
    return v1("Frame", v2, v3)
end