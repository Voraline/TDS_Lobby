-- Script path: ReplicatedStorage.Client.Interfaces.Universal.Components.TopBar.TopBarCollectible
-- Decompile time: 2.23 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Comma = require(ReplicatedStorage.Shared.UI.Comma)
local React = require(ReplicatedStorage.Shared.UI.React)
local createElement = React.createElement
return React.memo(function(a1) -- Line: 19 -- upvalues: createElement (val), Comma (val) -- types: a1: table
    local v1 = a1.Visible ~= false
    local amount = a1.amount
    local icon = a1.icon
    if not amount then
        return
    end
    local v2 = {
        Text = "",
        TextSize = 14,
        BackgroundTransparency = 0.2,
        FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json"),
        TextColor3 = Color3.fromRGB(0, 0, 0),
        AutomaticSize = Enum.AutomaticSize.X,
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        BorderColor3 = Color3.fromRGB(27, 42, 53),
        Size = UDim2.fromScale(0, 0.9),
        Visible = v1,
        LayoutOrder = a1.LayoutOrder,
    }
    local v3 = {uiSizeConstraint = createElement("UISizeConstraint", {MinSize = Vector2.new(0, 36)})}
    v3.uiCorner = createElement("UICorner", {CornerRadius = UDim.new(1, 0)})
    v3.uiPadding = createElement("UIPadding", {PaddingLeft = UDim.new(0, 8), PaddingRight = UDim.new(0, 16)})
    v3.uiListLayout = createElement("UIListLayout", {
        Padding = UDim.new(0, 4),
        FillDirection = Enum.FillDirection.Horizontal,
        HorizontalAlignment = Enum.HorizontalAlignment.Center,
        SortOrder = Enum.SortOrder.LayoutOrder,
        VerticalAlignment = Enum.VerticalAlignment.Center,
    })
    v3.text = createElement("TextLabel", {
        TextSize = 17,
        BackgroundTransparency = 1,
        LayoutOrder = 1,
        FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
        Text = Comma(amount),
        TextColor3 = Color3.fromRGB(255, 255, 255),
        AnchorPoint = Vector2.new(0, 0.5),
        AutomaticSize = Enum.AutomaticSize.X,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(27, 42, 53),
        Position = UDim2.fromScale(0, 0.5),
        Size = UDim2.fromScale(0, 1),
    })
    v3.icon = createElement("ImageLabel", {
        Name = "Icon",
        BackgroundTransparency = 1,
        Image = not (typeof(icon) ~= "number") and ("rbxassetid://%*"):format(icon) or icon,
        AnchorPoint = Vector2.new(0, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(27, 42, 53),
        Position = UDim2.fromScale(0, 0.5),
        Size = UDim2.fromScale(0.9, 0.9),
        SizeConstraint = Enum.SizeConstraint.RelativeYY,
    })
    return createElement("TextLabel", v2, v3)
end)