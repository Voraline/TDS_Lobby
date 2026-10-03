-- Script path: ReplicatedStorage.Client.Interfaces.Components.Currency
-- Decompile time: 2.16 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Comma = require(ReplicatedStorage.Client.Modules.Comma)
local Icons = require(ReplicatedStorage.Client.Interfaces.LegacyInterface.Icons)
local ImageLabel = require(ReplicatedStorage.Client.Interfaces.Components.ImageLabel)
local React = require(ReplicatedStorage.Shared.UI.React)
local createElement = React.createElement
return React.memo(function(a1) -- Line: 22
    -- upvalues: createElement (val), React (val), ImageLabel (val), Icons (val), Comma (val)
    local v1
    local v2 = {}
    local anchorPoint = a1.anchorPoint or Vector2.new(0, 0.5)
    v2.AnchorPoint = anchorPoint
    v2.AutomaticSize = Enum.AutomaticSize.X
    v2.BackgroundTransparency = 1
    v2.LayoutOrder = a1.layoutOrder or 1
    local position = a1.position or UDim2.fromScale(0, 0.5)
    v2.Position = position
    v2.Selectable = false
    local size = a1.size or UDim2.fromOffset(0, 40)
    v2.Size = size
    v2.ZIndex = a1.zIndex or 1
    v2.Text = ""
    v2[React.Event.Activated] = a1.clicked
    local v3 = {
        dropShadow = createElement("ImageLabel", {
            BackgroundTransparency = 1,
            Image = "rbxassetid://9073106548",
            ImageTransparency = 0.2,
            SliceScale = 1.25,
            ZIndex = -1,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
            ScaleType = Enum.ScaleType.Slice,
            Size = UDim2.new(1, 8, 1, 8),
            SliceCenter = Rect.new(39, 39, 39, 39),
        }),
        background = createElement("Frame", {
            BackgroundTransparency = 0.4,
            ZIndex = 0,
            BackgroundColor3 = Color3.new(),
            Size = UDim2.fromScale(1, 1),
        }, {corner = createElement("UICorner", {CornerRadius = UDim.new(1, 0)})}),
        icon = createElement(ImageLabel, {
            BackgroundTransparency = 1,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Image = if not a1.type then nil else Icons[a1.type],
            Position = UDim2.fromScale(1, 0.5),
            Size = UDim2.fromOffset(56, 56),
        }),
    }
    local v4 = {
        BackgroundTransparency = 1,
        TextSize = 30,
        AnchorPoint = Vector2.new(0, 0.5),
        AutomaticSize = Enum.AutomaticSize.X,
        FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
        Position = UDim2.fromScale(0, 0.5),
        Size = UDim2.new(1, 0, 0, 50),
    }
    local value = if not a1.value then a1.value else Comma(a1.value)
    v4.Text = value
    v4.TextColor3 = Color3.new(1, 1, 1)
    v3.amount = createElement("TextLabel", v4, {
        padding = createElement("UIPadding", {PaddingLeft = UDim.new(0, 26), PaddingRight = UDim.new(0, 30)}),
        stroke = createElement("UIStroke", {Thickness = 2, Transparency = 0.9, Color = Color3.new(1, 1, 1)}),
    })
    if not a1.clicked then
        v1 = nil
    else
        v1 = createElement
        v4 = {
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.fromRGB(0, 170, 255),
            Position = UDim2.fromScale(0, 0.5),
            Size = UDim2.fromOffset(30, 30),
            Text = "",
        }
        v4[React.Event.Activated] = a1.clicked
        v1 = v1("TextButton", v4, {
            dropShadow = createElement("ImageLabel", {
                BackgroundTransparency = 1,
                Image = "rbxassetid://9073106548",
                ImageTransparency = 0.2,
                SliceScale = 1.25,
                ZIndex = -1,
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.fromScale(0.5, 0.5),
                ScaleType = Enum.ScaleType.Slice,
                Size = UDim2.new(1, 8, 1, 8),
                SliceCenter = Rect.new(39, 39, 39, 39),
            }),
            icon = createElement("ImageLabel", {
                BackgroundTransparency = 1,
                Image = "rbxassetid://9230983672",
                ZIndex = 2,
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.fromScale(0.5, 0.5),
                Size = UDim2.fromOffset(24, 24),
            }),
            corner = createElement("UICorner", {CornerRadius = UDim.new(1, 0)}),
        })
    end
    v3.button = v1
    return createElement("TextButton", v2, v3)
end)