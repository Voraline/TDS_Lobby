-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.MerchShop.ShopIcon
-- Decompile time: 4.75 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local useFontScale = require(ReplicatedStorage.Client.Interfaces.Hooks.useFontScale)
local Components = ReplicatedStorage.Client.Interfaces.Components
local ShopItemBanner = require(script.Parent.ShopItemBanner)
local ImageLabel = require(Components.ImageLabel)
local createElement = React.createElement
local useRef = React.useRef
return (React.memo(function(a1) -- Line: 41
    -- upvalues: useRef (val), useFontScale (val), createElement (val), ShopItemBanner (val), ImageLabel (val)
    local v1 = useRef()
    local v2 = useFontScale({scale = 1.1})
    local v3 = {BackgroundTransparency = 0}
    local anchorPoint = a1.anchorPoint or Vector2.new(0.5, 0.5)
    v3.AnchorPoint = anchorPoint
    local position = a1.position or UDim2.fromScale(0.770672, 0.526851)
    v3.Position = position
    local size = a1.size or UDim2.fromScale(0.368056, 0.641129)
    v3.Size = size
    local color = a1.color or Color3.fromRGB(64, 93, 255)
    v3.BackgroundColor3 = color
    v3.LayoutOrder = a1.layoutOrder
    v3.ZIndex = a1.zIndex or 1
    v3.ref = v1
    local v4 = {
        aspectRatio = createElement("UIAspectRatioConstraint", {
            AspectRatio = a1.aspectRatio or 1,
            AspectType = Enum.AspectType.FitWithinMaxSize,
            DominantAxis = Enum.DominantAxis.Height,
        }),
    }
    local v5 = {}
    local cornerRadius = a1.cornerRadius or UDim.new(0.1, 0)
    v5.CornerRadius = cornerRadius
    v4.corner = createElement("UICorner", v5)
    v4.stroke = createElement("UIStroke", {
        Thickness = 0.01,
        Color = Color3.new(1, 1, 1),
        ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
        StrokeSizingMode = Enum.StrokeSizingMode.ScaledSize,
    })
    v4.gradient = createElement("UIGradient", {
        Rotation = 90,
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.new(1, 1, 1)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(48, 48, 48))),
        }),
    })
    v4.text = createElement("TextLabel", {
        BackgroundTransparency = 1,
        TextScaled = false,
        TextWrapped = true,
        RichText = true,
        ZIndex = 4,
        AnchorPoint = Vector2.new(0.5, 1),
        FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Heavy, Enum.FontStyle.Normal),
        Position = UDim2.fromScale(0.4995, 1.05),
        Size = UDim2.fromScale(1.2, 0),
        AutomaticSize = Enum.AutomaticSize.Y,
        Text = a1.text,
        TextColor3 = Color3.new(1, 1, 1),
        TextSize = v2,
    }, {stroke = createElement("UIStroke", {Thickness = 2})})
    local banner = a1.banner and createElement(ShopItemBanner, {zIndex = 5, text = a1.banner})
    v4.banner = banner
    v5 = {
        BackgroundTransparency = 1,
        ZIndex = 3,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(1, 1),
    }
    local v6 = {}
    local v7 = {}
    local cornerRadius_2 = a1.cornerRadius or UDim.new(0.1, 0)
    v7.CornerRadius = cornerRadius_2
    v6.corner = createElement("UICorner", v7)
    v7 = {BackgroundTransparency = 1, ZIndex = 3, AnchorPoint = Vector2.new(0.5, 0.5)}
    local icon_3 = typeof(a1.icon) == "number" and ("rbxassetid://%*"):format(a1.icon) or a1.icon
    v7.Image = icon_3
    v7.Position = UDim2.fromScale(0.5, 0.5)
    local iconScaleType = a1.iconScaleType or Enum.ScaleType.Fit
    v7.ScaleType = iconScaleType
    local iconSize = a1.iconSize or UDim2.fromScale(0.8, 0.8)
    v7.Size = iconSize
    v6.icon = createElement(ImageLabel, v7, {})
    v4.iconContainer = createElement("CanvasGroup", v5, v6)
    v4.shine = createElement("ImageLabel", {
        BackgroundTransparency = 1,
        Image = "rbxassetid://122771904830088",
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        ScaleType = Enum.ScaleType.Fit,
        Size = UDim2.fromScale(1.2, 1.2),
    })
    return createElement("Frame", v3, v4, a1.children)
end))