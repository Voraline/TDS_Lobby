-- Script path: ReplicatedStorage.Client.Interfaces.Universal.Components.Nametag.Flair
-- Decompile time: 2.04 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local createElement = React.createElement
return function(a1) -- Line: 24 -- upvalues: createElement (val), React (val) -- types: a1: table
    local v1 = a1.icon or ""
    local v2 = a1.name or ""
    local style = a1.style
    local v3 = {
        Name = "Flair",
        AnchorPoint = Vector2.new(0.5, 0),
        AutomaticSize = Enum.AutomaticSize.X,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BackgroundTransparency = 1,
        Position = UDim2.fromScale(0.5, -0.25),
        Size = UDim2.fromScale(0, 0.35),
    }
    local v4 = false
    if a1.visible == true then
        v4 = v2 ~= ""
    end
    v3.Visible = v4

    v3[React.Change.AbsoluteSize] = function(a1_2) -- Line: 38 -- upvalues: a1 (val)
        if a1.onAbsoluteSizeChanged then
            a1.onAbsoluteSizeChanged(a1_2.AbsoluteSize)
        end
    end

    v4 = {
        UIListLayout = createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal,
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            Padding = UDim.new(0.01, 0),
            SortOrder = Enum.SortOrder.LayoutOrder,
            VerticalAlignment = Enum.VerticalAlignment.Center,
        }),
    }
    v4.Icon = createElement("ImageLabel", {
        BackgroundTransparency = 1,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        Image = v1,
        ScaleType = Enum.ScaleType.Fit,
        Size = UDim2.fromScale(1, 1),
        Visible = v1 ~= "",
    }, {UIAspectRatioConstraint = createElement("UIAspectRatioConstraint")})
    local v5 = {
        BackgroundTransparency = 1,
        RichText = true,
        TextScaled = true,
        TextSize = 14,
        TextWrapped = true,
        AutomaticSize = Enum.AutomaticSize.X,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
        Size = UDim2.fromScale(0, 1),
        Text = string.format("[ %s ]", v2),
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextXAlignment = Enum.TextXAlignment.Left,
        TextYAlignment = Enum.TextYAlignment.Top,
    }
    local v6 = {}
    local v7 = {}
    local color = if not style then ColorSequence.new(Color3.new(1, 1, 1)) else if not style.color then ColorSequence.new(Color3.new(1, 1, 1)) else style.color
    v7.Color = color
    v7.Enabled = style ~= nil
    v7.Rotation = if not style then 90 else if not style.colorRotation then 90 else style.colorRotation
    v6.UIGradient = createElement("UIGradient", v7)
    v7 = {Color = Color3.new(1, 1, 1)}
    v7.Enabled = style ~= nil
    v7.Thickness = if not style then 2 else if not style.strokeWidth then 2 else style.strokeWidth
    local v8 = {}
    local v9 = {}
    local strokeColor = if not style then ColorSequence.new(Color3.new(0, 0, 0)) else if not style.strokeColor then ColorSequence.new(Color3.new(0, 0, 0)) else style.strokeColor
    v9.Color = strokeColor
    v9.Rotation = if not style then 90 else if not style.strokeColorRotation then 90 else style.strokeColorRotation
    local strokeColorTransparency = if not style then NumberSequence.new(0.5) else if not style.strokeColorTransparency then NumberSequence.new(0.5) else style.strokeColorTransparency
    v9.Transparency = strokeColorTransparency
    v8.UIGradient = createElement("UIGradient", v9)
    v6.UIStroke = createElement("UIStroke", v7, v8)
    v4.Label = createElement("TextLabel", v5, v6)
    return createElement("Frame", v3, v4)
end