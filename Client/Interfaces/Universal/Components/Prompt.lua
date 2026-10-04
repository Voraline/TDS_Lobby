-- Script path: ReplicatedStorage.Client.Interfaces.Universal.Components.Prompt
-- Decompile time: 20.83 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactFlow = require(ReplicatedStorage.Packages.ReactFlow)
local Sift = require(ReplicatedStorage.Packages.Sift)
local Button = require(ReplicatedStorage.Client.Interfaces.Universal.Components.Inventory.Button)
local ImageLabel = require(ReplicatedStorage.Client.Interfaces.Components.ImageLabel)
local useFontScale = require(ReplicatedStorage.Client.Interfaces.Hooks.useFontScale)
local useScreenSize = require(ReplicatedStorage.Client.Interfaces.Hooks.useScreenSize)
local useTransparencyModifier = require(ReplicatedStorage.Client.Interfaces.Hooks.useTransparencyModifier)
local createElement = React.createElement
local useEffect = React.useEffect
local useRef = React.useRef
local memo = React.memo
local useGroupAnimation = ReactFlow.useGroupAnimation
local useAnimation = ReactFlow.useAnimation
local Tween = ReactFlow.Tween
local Spring = ReactFlow.Spring
local u60 = memo(function(a1) -- Line: 57 -- upvalues: useTransparencyModifier (val), createElement (val), ImageLabel (val)
    local v1 = useTransparencyModifier(a1.transparency)
    local v2 = {
        Active = true,
        Selectable = true,
        AutomaticSize = Enum.AutomaticSize.XY,
        BackgroundColor3 = Color3.new(1, 1, 1),
        BackgroundTransparency = v1(0),
        Position = UDim2.new(0.5, 0, 1, -94),
    }
    local v3 = {corner = createElement("UICorner", {CornerRadius = UDim.new(0.102434, 0)})}
    v3.listLayout = createElement("UIListLayout", {
        FillDirection = Enum.FillDirection.Horizontal,
        HorizontalAlignment = Enum.HorizontalAlignment.Center,
        ItemLineAlignment = Enum.ItemLineAlignment.Center,
        Padding = UDim.new(0, 4),
        SortOrder = Enum.SortOrder.LayoutOrder,
        VerticalAlignment = Enum.VerticalAlignment.Center,
    })
    v3.padding = createElement("UIPadding", {
        PaddingBottom = UDim.new(0, 5),
        PaddingLeft = UDim.new(0, 10),
        PaddingRight = UDim.new(0, 15),
        PaddingTop = UDim.new(0, 5),
    })
    v3.value = createElement("TextLabel", {
        BackgroundTransparency = 1,
        LayoutOrder = 1,
        TextSize = 20,
        AnchorPoint = Vector2.new(0, 0.5),
        AutomaticSize = Enum.AutomaticSize.X,
        FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
        Position = UDim2.fromScale(0, 0.5),
        Size = UDim2.fromOffset(0, 40),
        Text = a1.value,
        TextColor3 = Color3.new(1, 1, 1),
        TextXAlignment = Enum.TextXAlignment.Left,
        TextTransparency = v1(0),
    }, {
        gradient = createElement("UIGradient", {
            Rotation = 90,
            Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, Color3.new(1, 1, 1)),
                (ColorSequenceKeypoint.new(1, Color3.fromRGB(184, 184, 184))),
            }),
        }),
    })
    local v4 = createElement
    local v5 = {
        Rotation = 90,
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.new()),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(15, 15, 15))),
        }),
        Transparency = v1(NumberSequence.new({NumberSequenceKeypoint.new(0, 0.4), (NumberSequenceKeypoint.new(1, 0.4))})),
    }
    v3.gradient = v4("UIGradient", v5)
    if not a1.icon then
        v4 = nil
    else
        v5 = {BackgroundTransparency = 1, AnchorPoint = Vector2.new(0.5, 0.5)}
        local icon_3 = typeof(a1.icon) == "number" and ("rbxassetid://%*"):format(a1.icon) or a1.icon
        v5.Image = icon_3
        v5.ImageTransparency = v1(0)
        v5.Position = UDim2.new(0, 16, 0.5, 0)
        v5.ScaleType = Enum.ScaleType.Fit
        v5.Size = UDim2.fromOffset(35, 35)
        v5.SizeConstraint = Enum.SizeConstraint.RelativeYY
        v4 = createElement(ImageLabel, v5, {aspectRatio = createElement("UIAspectRatioConstraint")}) or nil
    end
    v3.icon = v4
    return createElement("Frame", v2, v3)
end)
local u63 = memo(function(a1) -- Line: 148 -- upvalues: createElement (val), Button (val), Sift (val)
    local v1 = {BackgroundTransparency = 1}
    local wrapperSize = a1.wrapperSize or UDim2.fromScale(1, 1)
    v1.Size = wrapperSize
    v1.LayoutOrder = a1.layoutOrder
    local v2 = {}
    local v3 = a1.wrapperAspectRatio and createElement("UIAspectRatioConstraint", {AspectRatio = a1.wrapperAspectRatio}) or nil
    v2.aspectRatio = v3
    v2.btn = createElement(Button, Sift.Dictionary.join({}, a1, {
        layoutOrder = 1,
        dontScale = true,
        dontUseRatio = true,
        scaleMultiplier = 0.5,
        position = UDim2.fromScale(0.5, 0.5),
        anchorPoint = Vector2.new(0.5, 0.5),
        size = UDim2.fromScale(1, 1),
        textSize = a1.textSize,
        transparency = a1.transparency,
    }))
    return createElement("Frame", v1, v2)
end)
return (memo(function(a1) -- Line: 175
    -- upvalues: useRef (val), useFontScale (val), useGroupAnimation (val), useAnimation (val), Tween (val)
    -- upvalues: Spring (val), useTransparencyModifier (val), useEffect (val), createElement (val), u60 (val), u63 (val)
    -- upvalues: Sift (val), React (val), useScreenSize (val), ImageLabel (val)
    local join, join_2, u150, v1, v2, v3, v4, v5
    local anchorPoint = a1.anchorPoint or Vector2.new(0.5, 0.5)
    local position = a1.position
    if not position then
        position = UDim2.fromScale(0.5, 0.5)
    end
    local u15 = a1.visible ~= false
    local v6 = {}
    local v7 = {}
    local v8 = {}
    local v9 = useFontScale({scale = 1.5, ref = useRef()})
    local v10, u91 = useGroupAnimation({
        enabled = useAnimation({
            transparency = Tween({target = 0, info = TweenInfo.new(0.4)}),
            bgTransparency = Tween({target = 0, info = TweenInfo.new(0.2)}),
            scale = Spring({target = 1, speed = 20, damper = 0.5}),
            position = Spring({speed = 18, damper = 0.8, target = UDim2.fromScale(0, 0)}),
            anchorPoint = Spring({speed = 18, damper = 0.5, target = anchorPoint}),
        }),
        disabled = useAnimation({
            transparency = Tween({target = 1, info = TweenInfo.new(0.3)}),
            bgTransparency = Tween({target = 1, info = TweenInfo.new(0.3)}),
            scale = Spring({target = 0.1, speed = 30, damper = 1}),
            position = Spring({speed = 25, damper = 1, target = UDim2.fromScale(0, 0.6)}),
            anchorPoint = Spring({speed = 25, damper = 1, target = anchorPoint}),
        }),
    }, {
        scale = 0.1,
        transparency = 1,
        bgTransparency = 1,
        position = UDim2.fromScale(0, 1),
        anchorPoint = anchorPoint,
    })
    local v11 = useTransparencyModifier(v10.transparency)
    local v12 = useTransparencyModifier(v10.bgTransparency)
    local v13 = {u15}
    useEffect(function() -- Line: 213 -- upvalues: u91 (val), u15 (val)
        u91(if not u15 then "disabled" else "enabled")
    end, v13)
    local v14 = ipairs
    local items = a1.items or {}
    for i, v in v14(items) do
        v1 = createElement
        v2 = u60
        v3 = {
            icon = v.icon,
            value = v.value,
            transparency = v10.transparency,
            layoutOrder = i,
        }
        v6[i] = (v1(v2, v3))
    end
    for i2, j in a1.actions or {} do
        v1 = createElement
        v2 = u63
        join_2 = Sift.Dictionary.join
        v5 = {
            aspectRatio = 6,
            wrapperAspectRatio = 6,
            size = UDim2.fromScale(1, 1),
            textSize = v9,
            transparency = v10.transparency,
            layoutOrder = 3 + j.layoutOrder,
        }
        v7[i2] = (v1(v2, join_2({}, j, v5)))
    end
    for k, n in a1.horizontalActions or {} do
        v1 = createElement
        v2 = u63
        join = Sift.Dictionary.join
        v5 = {
            size = UDim2.fromScale(1, 1),
            textSize = v9,
            transparency = v10.transparency,
            wrapperSize = UDim2.new(0.5, -5, 1, 0),
        }
        v8[k] = (v1(v2, join({}, n, v5)))
    end
    v14, u150 = React.useBinding(1)
    local u152 = useScreenSize()
    v1 = {u152}
    useEffect(function() -- Line: 255 -- upvalues: u150 (val), u152 (val)
        local function aspectMultiplier(a1) -- Line: 256 -- types: a1: userdata
            return (math.clamp((math.min(a1.X, a1.Y)) / 720, 0.25, 1))
        end

        local v1 = u152
        u150((math.clamp((math.min(v1.X, v1.Y)) / 720, 0.25, 1)))
    end, v1)
    v1 = {
        BackgroundTransparency = 1,
        ZIndex = 999999,
        Size = UDim2.fromScale(1, 1),
        Visible = v10.transparency:map(function(a1) -- Line: 273
            return a1 < 1
        end),
    }
    v2 = {}
    v3 = false
    if a1.hideModal ~= false then
        v3 = createElement
        v4 = {
            AutoButtonColor = false,
            Text = "",
            BorderSizePixel = 0,
            BackgroundColor3 = Color3.new(),
            BackgroundTransparency = v12(0.3),
            Size = UDim2.fromScale(1, 1),
            Modal = true,
        }
        v4[React.Event.Activated] = a1.onModalClicked
        v4.ZIndex = -1
        v3 = v3("TextButton", v4)
    end
    v2.modal = v3
    v2.customContent = a1.content
    if a1.content then
        v3 = nil
    else
        v4 = {
            AnchorPoint = v10.anchorPoint,
            AutomaticSize = Enum.AutomaticSize.XY,
            BackgroundColor3 = Color3.new(1, 1, 1),
            BackgroundTransparency = v11(0),
            Size = UDim2.fromScale(0, 0),
        }
        v4.Position = v10.position:map(function(a1) -- Line: 297 -- upvalues: position (val)
            return position + a1
        end)
        v5 = {
            scale = createElement("UIScale", {
                Scale = React.joinBindings({v10.scale, v14}):map(function(a1) -- Line: 303
                    return a1[1] * a1[2]
                end),
            }),
        }
        v5.corner = createElement("UICorner", {CornerRadius = UDim.new(0.027972, 0)})
        v5.background = createElement("UIGradient", {
            Rotation = 90,
            Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, Color3.new()),
                (ColorSequenceKeypoint.new(1, Color3.fromRGB(35, 35, 35))),
            }),
            Transparency = v11(NumberSequence.new({NumberSequenceKeypoint.new(0, 0.05), (NumberSequenceKeypoint.new(1, 0.05))})),
        })
        v5.stroke = createElement("UIStroke", {Thickness = 2, Color = Color3.new(1, 1, 1), Transparency = v11(0.7)})
        v5.padding = createElement("UIPadding", {
            PaddingTop = UDim.new(0, 30),
            PaddingBottom = UDim.new(0, 30),
            PaddingLeft = UDim.new(0, 30),
            PaddingRight = UDim.new(0, 30),
        })
        local v15 = {
            BackgroundTransparency = 1,
            AutomaticSize = Enum.AutomaticSize.XY,
            Size = UDim2.fromScale(0, 0),
        }
        local v16 = {
            listLayout = createElement("UIListLayout", {
                HorizontalAlignment = Enum.HorizontalAlignment.Center,
                Padding = UDim.new(0, 15),
                SortOrder = Enum.SortOrder.LayoutOrder,
                VerticalAlignment = Enum.VerticalAlignment.Center,
            }),
        }
        local v17 = {BackgroundTransparency = 1, LayoutOrder = 0, AnchorPoint = Vector2.new(0.5, 0)}
        local icon_3 = typeof(a1.icon) == "number" and ("rbxassetid://%*"):format(a1.icon) or a1.icon
        v17.Image = icon_3
        v17.ImageTransparency = v11(0)
        v17.Position = UDim2.new(0.5, 0, -0.259002, 32)
        v17.ScaleType = Enum.ScaleType.Fit
        v17.Size = UDim2.fromScale(0.4, 0.4)
        v16.icon = createElement(ImageLabel, v17, {aspectRatio = createElement("UIAspectRatioConstraint")})
        v16.text = createElement("Frame", {
            BackgroundTransparency = 1,
            LayoutOrder = 1,
            AutomaticSize = Enum.AutomaticSize.XY,
            Size = UDim2.fromScale(0, 0),
        }, {
            listLayout = createElement("UIListLayout", {
                HorizontalAlignment = Enum.HorizontalAlignment.Center,
                ItemLineAlignment = Enum.ItemLineAlignment.Center,
                Padding = UDim.new(0, 8),
                SortOrder = Enum.SortOrder.LayoutOrder,
            }),
            subject = createElement("TextLabel", {
                BackgroundTransparency = 1,
                LayoutOrder = 1,
                TextSize = 40,
                AnchorPoint = Vector2.new(0.5, 0.5),
                AutomaticSize = Enum.AutomaticSize.XY,
                FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
                Position = UDim2.fromScale(0.5, 0.5),
                Size = UDim2.fromScale(0, 0),
                Text = a1.title,
                TextColor3 = Color3.new(1, 1, 1),
                TextTransparency = v11(0),
            }, {
                sizeConstraint = createElement("UISizeConstraint", {MaxSize = Vector2.new(300, (1 / 0))}),
                stroke = createElement("UIStroke", {Thickness = 3, Transparency = v11(0.8)}),
            }),
            description = createElement("TextLabel", {
                BackgroundTransparency = 1,
                LayoutOrder = 2,
                RichText = true,
                TextSize = 24,
                TextWrapped = true,
                AutomaticSize = Enum.AutomaticSize.XY,
                FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
                Size = UDim2.fromScale(0, 0),
                Text = a1.description,
                TextColor3 = Color3.fromRGB(163, 163, 163),
                TextYAlignment = Enum.TextYAlignment.Top,
                TextTransparency = v11(0),
            }, {
                sizeConstraint = createElement("UISizeConstraint", {MaxSize = Vector2.new(300, (1 / 0)), MinSize = Vector2.new(220, 0)}),
            }),
        })
        local v18 = next(v6) and createElement("Frame", {
            BackgroundTransparency = 1,
            LayoutOrder = 3,
            AutomaticSize = Enum.AutomaticSize.XY,
            Size = UDim2.fromScale(0.8, 0),
        }, {
            listLayout = createElement("UIListLayout", {
                Wraps = true,
                FillDirection = Enum.FillDirection.Horizontal,
                HorizontalAlignment = Enum.HorizontalAlignment.Center,
                ItemLineAlignment = Enum.ItemLineAlignment.Start,
                Padding = UDim.new(0, 10),
                SortOrder = Enum.SortOrder.LayoutOrder,
            }),
            sizeConstraint = createElement("UISizeConstraint", {MaxSize = Vector2.new(300, (1 / 0))}),
        }, v6)
        v16.items = v18
        v18 = next(v8) and createElement("Frame", {BackgroundTransparency = 1, LayoutOrder = 4, Size = UDim2.fromOffset(300, 50)}, {
            listLayout = createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal,
                HorizontalAlignment = Enum.HorizontalAlignment.Center,
                Padding = UDim.new(0, 10),
                SortOrder = Enum.SortOrder.LayoutOrder,
                VerticalAlignment = Enum.VerticalAlignment.Center,
            }),
        }, v8) or nil
        v16.horizontalActions = v18
        v18 = next(v7) and createElement(React.Fragment, nil, v7)
        v16.actions = v18
        v5.content = createElement("Frame", v15, v16)
        v3 = createElement("Frame", v4, v5) or nil
    end
    v2.promptElement = v3
    return createElement("Frame", v1, v2)
end))