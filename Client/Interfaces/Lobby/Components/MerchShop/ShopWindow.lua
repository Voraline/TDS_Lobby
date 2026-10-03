-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.MerchShop.ShopWindow
-- Decompile time: 5.43 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Hooks = ReplicatedStorage.Client.Interfaces.Hooks
local Components = ReplicatedStorage.Client.Interfaces.Components
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactFlow = require(ReplicatedStorage.Packages.ReactFlow)
local IconButton = require(ReplicatedStorage.Client.Interfaces.Components.IconButton)
local ImageLabel = require(Components.ImageLabel)
local Loader = require(ReplicatedStorage.Client.Interfaces.Components.Loader)
local useScale = require(Hooks.useScale)
local Tween = ReactFlow.Tween
local useGroupAnimation = ReactFlow.useGroupAnimation
local useAnimation = ReactFlow.useAnimation
local createElement = React.createElement
local useState = React.useState
local memo = React.memo
local u46 = memo(function(a1) -- Line: 55 -- upvalues: createElement (val), ImageLabel (val), IconButton (val)
    local v1 = {BackgroundTransparency = 1}
    local anchorPoint = a1.anchorPoint or Vector2.new(0.5, 0)
    v1.AnchorPoint = anchorPoint
    local position = a1.position or UDim2.fromScale(0.5, 0)
    v1.Position = position
    local size = a1.size or UDim2.fromScale(1.015, 0.10717)
    v1.Size = size
    v1.ZIndex = a1.zIndex or 4
    v1.Visible = a1.visible
    local v2 = {}
    local v3 = {BackgroundTransparency = 1, ZIndex = 3, AnchorPoint = Vector2.new(0.5, 0.5)}
    local icon_3 = typeof(a1.icon) == "number" and ("rbxassetid://%*"):format(a1.icon) or a1.icon
    v3.Image = icon_3
    v3.Position = UDim2.fromScale(0.0497276, 0.134729)
    v3.ScaleType = Enum.ScaleType.Fit
    v3.Size = UDim2.fromScale(0.128402, 1.71716)
    v2.icon = createElement(ImageLabel, v3)
    v2.title = createElement("TextLabel", {
        BackgroundTransparency = 1,
        TextScaled = true,
        AnchorPoint = Vector2.new(0, 0.5),
        FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.ExtraBold, Enum.FontStyle.Normal),
        Position = UDim2.fromScale(0.102945, 0.5),
        Size = UDim2.fromScale(0.322132, 0.705851),
        Text = a1.text,
        TextColor3 = Color3.new(1, 1, 1),
        TextXAlignment = Enum.TextXAlignment.Left,
    }, {uIStroke = createElement("UIStroke", {Thickness = 3})})
    v2.leave = createElement(IconButton, {
        BackgroundTransparency = 1,
        LayoutOrder = 6,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.959651, 0.500866),
        Color = Color3.fromRGB(255, 60, 60),
        Size = UDim2.fromScale(0.7, 0.7),
        Clicked = a1.onClose,
    }, {aspectRatio = createElement("UIAspectRatioConstraint", {AspectRatio = 1})})
    v2.dropShadow = createElement("ImageLabel", {
        BackgroundTransparency = 1,
        Image = "rbxassetid://9239716855",
        ZIndex = -2,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        ScaleType = Enum.ScaleType.Slice,
        Size = UDim2.new(1, 14, 1, 14),
        SliceCenter = Rect.new(14, 14, 64, 24),
    })
    v2.background = createElement("Frame", {
        ZIndex = -1,
        BackgroundColor3 = Color3.fromRGB(56, 56, 56),
        Size = UDim2.fromScale(1, 1),
    }, {
        uIStroke = createElement("UIStroke", {Thickness = 2, Transparency = 0.4, Color = Color3.new(1, 1, 1)}, {
            uIGradient = createElement("UIGradient", {
                Rotation = 90,
                Color = ColorSequence.new({
                    ColorSequenceKeypoint.new(0, Color3.new(1, 1, 1)),
                    ColorSequenceKeypoint.new(0.466321, Color3.fromRGB(54, 54, 54)),
                    (ColorSequenceKeypoint.new(1, Color3.new())),
                }),
            }),
        }),
        uICorner = createElement("UICorner", {CornerRadius = UDim.new(0, 10)}),
        uIGradient = createElement("UIGradient", {
            Rotation = 90,
            Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, Color3.new(1, 1, 1)),
                (ColorSequenceKeypoint.new(1, Color3.fromRGB(130, 130, 130))),
            }),
        }),
    })
    return createElement("Frame", v1, v2)
end)
local u49 = memo(function(a1) -- Line: 154
    -- upvalues: useGroupAnimation (val), useAnimation (val), Tween (val), createElement (val), ImageLabel (val)
    local v1, v2 = useGroupAnimation({
        enable = useAnimation({
            transparency = Tween({target = 0, info = TweenInfo.new(0.2)}),
            position = Tween({target = UDim2.fromScale(0.5, 0.5), info = TweenInfo.new(0.2)}),
        }),
        disable = useAnimation({
            transparency = Tween({target = 1, info = TweenInfo.new(0.2)}),
            position = Tween({target = UDim2.fromScale(0.5, 0.8), info = TweenInfo.new(0.2)}),
        }),
    }, {transparency = 1, position = UDim2.fromScale(0.5, 0.8)})
    v2(if not a1.Visible then "disable" else "enable")
    return createElement("Frame", {
        BackgroundTransparency = 1,
        Size = UDim2.fromScale(0.6, 0.6),
        Position = v1.position,
        AnchorPoint = Vector2.new(0.5, 0.5),
    }, {
        listLayout = createElement("UIListLayout", {
            Padding = UDim.new(0, 0),
            SortOrder = Enum.SortOrder.LayoutOrder,
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            VerticalAlignment = Enum.VerticalAlignment.Center,
        }),
        frame = createElement("Frame", {
            BackgroundTransparency = 1,
            Size = UDim2.fromScale(0.5, 0.5),
            SizeConstraint = Enum.SizeConstraint.RelativeYY,
        }, {
            image = createElement(ImageLabel, {
                BackgroundTransparency = 1,
                Image = "rbxassetid://104789469370491",
                ZIndex = 1,
                LayoutOrder = 0,
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.fromScale(0.5, 0.5),
                Size = UDim2.fromScale(1, 1),
                SizeConstraint = Enum.SizeConstraint.RelativeYY,
                ImageTransparency = v1.transparency,
                ScaleType = Enum.ScaleType.Fit,
            }),
        }, {padding = createElement("UIPadding", {PaddingBottom = UDim.new(0.1, 0)})}),
        title = createElement("TextLabel", {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Text = "Uh oh...",
            TextScaled = true,
            TextSize = 14,
            TextWrapped = true,
            ZIndex = 1,
            LayoutOrder = 1,
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.ExtraBold, Enum.FontStyle.Normal),
            Size = UDim2.fromScale(0.7, 0.09),
            TextTransparency = v1.transparency,
            TextColor3 = Color3.fromRGB(165, 165, 165),
            TextXAlignment = Enum.TextXAlignment.Center,
        }),
        subTitle = createElement("TextLabel", {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Text = "what happened to all the items?",
            TextScaled = true,
            TextSize = 14,
            TextWrapped = true,
            ZIndex = 1,
            LayoutOrder = 2,
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Medium, Enum.FontStyle.Normal),
            Size = UDim2.fromScale(0.7, 0.09),
            TextTransparency = v1.transparency,
            TextColor3 = Color3.fromRGB(165, 165, 165),
            TextXAlignment = Enum.TextXAlignment.Center,
        }),
    })
end)
return (memo(function(a1) -- Line: 258
    -- upvalues: useState (val), useScale (val), createElement (val), u46 (val), u49 (val), Loader (val), React (val)
    local v1, u4 = useState(Vector2.zero)
    local v2 = useScale(1, nil, true)
    local v3 = a1.loading == true
    local children = a1.children and next(a1.children) ~= nil
    local v4 = {BackgroundTransparency = 0.2, BorderSizePixel = 0}
    local anchorPoint = a1.anchorPoint or Vector2.new(0.5, 0.5)
    v4.AnchorPoint = anchorPoint
    local position = a1.position or UDim2.fromScale(0.5, 0.5)
    v4.Position = position
    local size = a1.size or UDim2.fromScale(0.762025, 0.773931)
    v4.Size = size
    v4.BackgroundColor3 = Color3.new()
    v4.BorderColor3 = Color3.new()
    v4.LayoutOrder = a1.layoutOrder
    v4.ZIndex = a1.zIndex or 1
    v4.Visible = a1.visible
    local v5 = {
        aspectRatio = createElement("UIAspectRatioConstraint", {AspectRatio = a1.aspectRatio or 1.5}),
    }
    v5.sizeConstraint = createElement("UISizeConstraint", {MaxSize = Vector2.new((1 / 0), 700)})
    v5.header = createElement(u46, {text = a1.header, onClose = a1.onClose, icon = a1.icon})
    local v6 = {}
    local cornerRadius = a1.cornerRadius or UDim.new(0.02, 0)
    v6.CornerRadius = cornerRadius
    v5.corner = createElement("UICorner", v6)
    v5.empty = if children or v3 then nil else createElement(u49, {Visible = true})
    v5.loader = if not v3 then nil else createElement(Loader, {
        BackgroundTransparency = 1,
        Visible = true,
        Size = UDim2.fromScale(0.2, 0.2),
        Position = UDim2.fromScale(0.5, 0.5),
        AnchorPoint = Vector2.new(0.5, 0.5),
    })
    local v7 = createElement
    v6 = {
        Active = true,
        BackgroundTransparency = 1,
        BottomImage = "",
        BorderSizePixel = 0,
        TopImage = "",
        AnchorPoint = Vector2.new(0.5, 0),
        Position = UDim2.fromScale(0.5, 0.10717),
        Size = UDim2.fromScale(1, 0.89283),
        CanvasSize = UDim2.new(0, 0, 0, v1.Y + 50 * v2),
        Visible = not v3,
    }
    local v8 = {}
    local v9 = createElement
    local v10 = {
        FillDirection = Enum.FillDirection.Horizontal,
        HorizontalAlignment = Enum.HorizontalAlignment.Center,
        HorizontalFlex = Enum.UIFlexAlignment.SpaceAround,
        Padding = UDim.new(0, 20 * v2),
        SortOrder = Enum.SortOrder.LayoutOrder,
        Wraps = true,
    }

    v10[React.Change.AbsoluteContentSize] = function(a1) -- Line: 333 -- upvalues: u4 (val) -- types: a1: userdata
        u4(a1.AbsoluteContentSize)
    end

    v8.listLayout = v9("UIListLayout", v10)
    v8.padding = createElement("UIPadding", {
        PaddingBottom = UDim.new(0, 16),
        PaddingLeft = UDim.new(0, 16),
        PaddingRight = UDim.new(0, 16),
        PaddingTop = UDim.new(0, 30 * v2),
    })
    v5.scrollingFrame = v7("ScrollingFrame", v6, v8, a1.children)
    return createElement("Frame", v4, v5)
end))