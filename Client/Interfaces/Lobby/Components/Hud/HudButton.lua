-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.Hud.HudButton
-- Decompile time: 26.34 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Components = ReplicatedStorage.Client.Interfaces.Components
local Hooks = ReplicatedStorage.Client.Interfaces.Hooks
local Icons = require(ReplicatedStorage.Client.Interfaces.LegacyInterface.Icons)
local Notification = require(ReplicatedStorage.Client.Modules.Universal.Interface.Components.Notification)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactFlow = require(ReplicatedStorage.Packages.ReactFlow)
local UltimateEffect = require(ReplicatedStorage.Client.Interfaces.Game.Components.UltimateEffect)
local useScale = require(Hooks.useScale)
local useSound = require(Hooks.useSound)
local useTransparencyModifier = require(Hooks.useTransparencyModifier)
local ImageLabel = require(Components.ImageLabel)
local Spotlight = require(Components.Spotlight)
local Tooltip = require(Components.Tooltip)
local Spring = ReactFlow.Spring
local Tween = ReactFlow.Tween
local Event = React.Event
local useSpring = ReactFlow.useSpring
local useState = React.useState
local useAnimation = ReactFlow.useAnimation
local useGroupAnimation = ReactFlow.useGroupAnimation
local useEffect = React.useEffect
local createElement = React.createElement
local memo = React.memo
local u71 = memo(function(a1) -- Line: 67 -- upvalues: createElement (val), ImageLabel (val)
    local v1 = {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ZIndex = 3,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
    }
    local textPosition = a1.textPosition or UDim2.fromScale(0.5, 0.907)
    v1.Position = textPosition
    v1.Size = UDim2.fromScale(1.2, 0.279)
    return createElement("Frame", v1, {
        label = createElement("TextLabel", {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            TextScaled = true,
            TextSize = 14,
            TextWrapped = true,
            ZIndex = 2,
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.ExtraBold, Enum.FontStyle.Normal),
            Size = UDim2.fromScale(1, 1),
            Text = a1.text,
            TextTransparency = a1.transparency,
            TextColor3 = Color3.fromRGB(255, 255, 255),
        }, {
            uIStroke1 = createElement("UIStroke", {
                Color = Color3.fromRGB(255, 255, 255),
                Transparency = a1.transparency,
                Thickness = a1.strokeThickness,
            }, {
                uIGradient1 = createElement("UIGradient", {
                    Rotation = 90,
                    Color = ColorSequence.new({
                        ColorSequenceKeypoint.new(0, Color3.fromRGB(80, 80, 80)),
                        (ColorSequenceKeypoint.new(1, Color3.fromRGB(20, 20, 20))),
                    }),
                }),
            }),
            uITextSizeConstraint = createElement("UITextSizeConstraint", {MaxTextSize = 24}),
        }),
        imageLabel = createElement(ImageLabel, {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Image = "rbxassetid://72870681931101",
            disableSpinner = true,
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            ImageColor3 = Color3.fromRGB(0, 0, 0),
            ImageTransparency = a1.imageTransparency,
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromScale(1, 2),
        }),
    })
end)
local u74 = memo(function(a1) -- Line: 132 -- upvalues: createElement (val)
    local v1 = {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ZIndex = 3,
        AnchorPoint = Vector2.new(0, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
    }
    local textPosition = a1.textPosition or UDim2.fromScale(0.5, 0.5)
    v1.Position = textPosition
    v1.Size = UDim2.fromScale(1.2, 0.35)
    return createElement("Frame", v1, {
        label = createElement("TextLabel", {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            TextScaled = true,
            TextSize = 14,
            TextWrapped = true,
            ZIndex = 2,
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.ExtraBold, Enum.FontStyle.Normal),
            Size = UDim2.fromScale(1, 1),
            Text = a1.text,
            TextXAlignment = Enum.TextXAlignment.Left,
            TextTransparency = a1.transparency,
            TextColor3 = Color3.fromRGB(255, 255, 255),
        }, {
            uIStroke1 = createElement("UIStroke", {
                Color = Color3.fromRGB(255, 255, 255),
                Transparency = a1.transparency,
                Thickness = a1.strokeThickness,
            }, {
                uIGradient1 = createElement("UIGradient", {
                    Rotation = 90,
                    Color = ColorSequence.new({
                        ColorSequenceKeypoint.new(0, Color3.fromRGB(80, 80, 80)),
                        (ColorSequenceKeypoint.new(1, Color3.fromRGB(20, 20, 20))),
                    }),
                }),
            }),
            uITextSizeConstraint = createElement("UITextSizeConstraint", {MaxTextSize = 24}),
        }),
    })
end)
return memo(function(a1) -- Line: 184
    -- upvalues: useScale (val), useState (val), useSpring (val), useGroupAnimation (val), useAnimation (val)
    -- upvalues: Spring (val), Tween (val), useTransparencyModifier (val), useSound (val), useEffect (val)
    -- upvalues: createElement (val), Event (val), Notification (val), Spotlight (val), Tooltip (val)
    -- upvalues: UltimateEffect (val), ImageLabel (val), Icons (val), u74 (val), u71 (val)
    local displayName = a1.displayName
    if not displayName then
        displayName = a1.name
    end
    local u6 = a1.Visible ~= false
    local u10 = a1.large == true
    local v1 = a1.shine == true
    local v2 = math.min(1, (useScale(1.5)))
    local v3 = a1.level or 0
    local levelLock = a1.levelLock
    local u27 = levelLock
    if u27 then
        u27 = v3 < levelLock
    end
    local gradient = a1.gradient
    local strokeColor = if not gradient then a1.strokeColor or Color3.fromRGB(85, 255, 127) else Color3.new(1, 1, 1)
    local color = if not gradient then a1.color or Color3.fromRGB(0, 255, 0) else strokeColor
    local icon = a1.icon
    local text = a1.text
    local notifications = a1.notifications
    local clicked = a1.clicked
    local tooltip = a1.tooltip
    local u59, u60 = useState(false)
    local v4, u64 = useSpring({start = 0, target = 0, speed = 20, damper = 0.5})
    local v5 = {
        hover = useAnimation({
            scale = Spring({target = 1.1, speed = 20, damper = 0.5}),
            glow = Tween({target = 0, info = TweenInfo.new(0.15)}),
        }),
    }
    v5.press = useAnimation({
        scale = Spring({target = 0.88, speed = 20, damper = 0.5}),
        glow = Tween({target = 0, info = TweenInfo.new(0.15)}),
    })
    v5.default = useAnimation({
        transparency = Tween({target = 0, info = TweenInfo.new(0.15)}),
        position = Tween({target = UDim2.fromScale(0.5, 0.5), info = TweenInfo.new(0.15)}),
        scale = Tween({target = 1, info = TweenInfo.new(0.15)}),
        glow = Tween({target = 1, info = TweenInfo.new(0.15)}),
    })
    v5.disable = useAnimation({
        transparency = Tween({target = 1, info = TweenInfo.new(0.15)}),
        glow = Tween({target = 1, info = TweenInfo.new(0.15)}),
        position = Tween({target = UDim2.fromScale(0.5, 1), info = TweenInfo.new(0.15)}),
        scale = Spring({target = 1, speed = 20, damper = 0.5}),
    })
    local v6 = {glow = 1, scale = 1}
    local v7 = u6 and UDim2.fromScale(0.5, 0.5) or UDim2.fromScale(0.5, 1)
    v6.position = v7
    v6.transparency = if not u6 then 1 else 0
    local v8, u181 = useGroupAnimation(v5, v6)
    v6 = useTransparencyModifier(v8.transparency)
    local Click = useSound("Click")
    if notifications and notifications > 99 then
        notifications = 99
    end
    local v9 = {u6}
    useEffect(function() -- Line: 249 -- upvalues: u181 (val), u6 (val)
        u181(if not u6 then "disable" else "default")
    end, v9)
    v9 = {notifications}
    useEffect(function() -- Line: 253 -- upvalues: u64 (val)
        u64({force = 8})
    end, v9)
    v9 = {
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BackgroundTransparency = 1,
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        BorderSizePixel = 0,
    }
    local Size = a1.Size or (if not u10 then UDim2.fromScale(0.47, 0.47) else UDim2.fromScale(1, 0.15))
    v9.Size = Size
    v9.Position = a1.Position
    v9.AnchorPoint = a1.AnchorPoint
    local ZIndex = a1.ZIndex or a1.LayoutOrder or 0
    v9.ZIndex = ZIndex + (if not u59 then 0 else 99)
    v9.LayoutOrder = a1.LayoutOrder
    v9.Text = ""
    v9.Visible = v8.transparency:map(function(a1) -- Line: 271
        return a1 < 0.99
    end)

    v9[Event.MouseEnter] = function() -- Line: 275 -- upvalues: u6 (val), u27 (val), u60 (val), u181 (val)
        if u6 and not u27 then
            u60(true)
            u181("hover")
            return
        end
    end

    v9[Event.MouseLeave] = function() -- Line: 284 -- upvalues: u6 (val), u27 (val), u60 (val), u181 (val)
        if u6 and not u27 then
            u60(false)
            u181("default")
            return
        end
    end

    v9[Event.MouseButton1Down] = function() -- Line: 293 -- upvalues: u6 (val), u27 (val), u181 (val)
        if not u6 or u27 then
            return
        end
        u181("press")
    end

    v9[Event.MouseButton1Up] = function() -- Line: 305
        -- upvalues: u6 (val), u27 (val), Notification (upval), levelLock (val), displayName (val), u59 (val)
        -- upvalues: u181 (val), Click (val), clicked (val)
        if not u6 then
            return
        end
        if u27 then
            Notification.Create({
                Sound = "Error",
                Text = ("You need to be level %* to view %*!"):format(levelLock, displayName),
                Color = Color3.fromRGB(255, 0, 0),
            })
            return
        end
        if not u59 then
            u181("default")
            return
        end
        u181("hover")
        Click()
        if not clicked then
            return
        end
        clicked()
    end

    local v10 = {
        uIAspectRatioConstraint1 = createElement("UIAspectRatioConstraint", {
            AspectRatio = if not u10 then 1 else 2.5,
            AspectType = Enum.AspectType.ScaleWithParentSize,
            DominantAxis = Enum.DominantAxis.Width,
        }),
    }
    local name = a1.name and createElement(Spotlight, {name = a1.name})
    v10.spotLight = name
    local v11 = {
        BackgroundTransparency = 1,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = v8.position,
        Size = v8.scale:map(function(a1) -- Line: 346
            return UDim2.fromScale(a1, a1)
        end),
    }
    local v12 = {toolTip = tooltip and createElement(Tooltip, tooltip)}
    local v13 = {
        BorderSizePixel = 0,
        ZIndex = 2,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BackgroundTransparency = v6(0.1),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(1, 1),
    }
    local v14 = {}
    local v15 = {}
    local corner = a1.corner or UDim.new(0.25, 0)
    v15.CornerRadius = corner
    v14.uICorner = createElement("UICorner", v15)
    v14.uIGradient = createElement("UIGradient", {
        Rotation = 90,
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, strokeColor:Lerp(Color3.new(), 0.4)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 0, 0)),
        }),
    })
    v14.uIStroke = createElement("UIStroke", {Thickness = 2, Color = strokeColor, Transparency = v8.transparency}, {
        gradient = if not gradient then nil else createElement("UIGradient", {Color = gradient, Rotation = a1.gradientRotation}),
    })
    v15 = {BackgroundTransparency = 1}
    local v16 = if not u10 then UDim2.fromScale(1, 1) else UDim2.fromScale(2, 2)
    v15.Size = v16
    v16 = if not u10 then UDim2.fromScale(0.5, 0.5) else UDim2.fromScale(0.5, 1)
    v15.Position = v16
    v16 = if not u10 then Vector2.new(0.5, 0.5) else Vector2.new(0.5, 1)
    v15.AnchorPoint = v16
    v15.ClipsDescendants = if u10 then true else false
    v16 = {
        shine = v1 and u6 and createElement("Frame", {
            BackgroundTransparency = 1,
            ZIndex = 0,
            Position = UDim2.fromScale(0.5, 0.5),
            AnchorPoint = Vector2.new(0.5, 0.5),
            Size = UDim2.new(1, -15, 1, -15),
        }, {
            inner = createElement(UltimateEffect, {
                Rotation = true,
                NoBorder = true,
                Color = Color3.fromRGB(255, 255, 255),
                SweepColor = color:Lerp(Color3.new(1, 1, 1), 0.5),
            }),
        }),
    }
    local v17 = {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ZIndex = 2,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
    }
    v17.Image = not (typeof(icon) ~= "number") and ("rbxassetid://%*"):format(icon) or icon
    v17.ImageTransparency = v8.transparency
    local v18 = if not u27 then Color3.new(1, 1, 1) else Color3.fromRGB(100, 100, 100)
    v17.ImageColor3 = v18
    v17.ScaleType = Enum.ScaleType.Fit
    local iconPosition = a1.iconPosition or UDim2.fromScale(0.5, 0.45)
    v17.Position = iconPosition
    local iconSize = a1.iconSize or UDim2.fromScale(1, 1)
    v17.Size = iconSize
    v16.icon = createElement(ImageLabel, v17, {
        uIAspectRatioConstraint = createElement("UIAspectRatioConstraint"),
        lock = if not u27 then nil else createElement("Frame", {
            BackgroundTransparency = 1,
            ZIndex = 9999,
            Size = UDim2.fromScale(0.8, 0.8),
            Position = UDim2.fromScale(0.5, 0.5),
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        }, {
            uICorner = createElement("UICorner", {CornerRadius = UDim.new(0.25, 0)}),
            list = createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical,
                HorizontalAlignment = Enum.HorizontalAlignment.Center,
                VerticalAlignment = Enum.VerticalAlignment.Center,
                SortOrder = Enum.SortOrder.LayoutOrder,
                Padding = UDim.new(0, 4),
            }),
            icon = createElement(ImageLabel, {
                BackgroundTransparency = 1,
                Image = Icons.Locked,
                Size = UDim2.fromScale(0.5, 0.5),
                SizeConstraint = Enum.SizeConstraint.RelativeYY,
                Position = UDim2.fromScale(0.5, 0.5),
                AnchorPoint = Vector2.new(0.5, 0.5),
            }),
            text = createElement("TextLabel", {
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                TextScaled = true,
                TextSize = 14,
                TextWrapped = true,
                ZIndex = 9999,
                LayoutOrder = 2,
                FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.ExtraBold, Enum.FontStyle.Normal),
                Text = ("Lvl. %*"):format(levelLock),
                TextColor3 = Color3.fromRGB(255, 255, 255),
                Size = UDim2.fromScale(0, 0.2),
                AutomaticSize = Enum.AutomaticSize.X,
            }, {
                uIStroke = createElement("UIStroke", {Transparency = 0.5, Thickness = 2, Color = Color3.fromRGB(0, 0, 0)}),
            }),
        }),
    })
    v14.images = createElement("Frame", v15, v16)
    v12.content = createElement("Frame", v13, v14)
    v12.text = createElement(if not u10 then u71 else u74, {
        text = text,
        transparency = v8.transparency,
        strokeThickness = (a1.labelStrokeThickness or 4) * v2,
        imageTransparency = v6(0.85),
        textPosition = a1.textPosition,
    })
    v12.glow = not a1.corner and createElement(ImageLabel, {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Image = "rbxassetid://70977168125466",
        disableSpinner = true,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        ImageTransparency = v8.glow,
        ImageColor3 = color,
        ScaleType = Enum.ScaleType.Slice,
        SliceCenter = Rect.new(62, 62, 62, 62),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = v8.glow:map(function(a1) -- Line: 509 -- upvalues: u10 (val)
            local v1 = math.min(1, 1 - a1 + 0.5)
            return UDim2.fromScale((if not u10 then 1.4 else 1.2) * v1, v1 * 1.4)
        end),
    }, {
        gradient = if not gradient then nil else createElement("UIGradient", {Color = gradient, Rotation = a1.gradientRotation}),
    })
    v12.notification = not u27 and notifications and createElement("Frame", {
        BorderSizePixel = 0,
        ZIndex = 4,
        Size = UDim2.fromScale(0.4, 0.4),
        Position = UDim2.fromScale(0.9, 0),
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(238, 24, 24),
        BackgroundTransparency = v8.transparency,
    }, {
        uICorner1 = createElement("UICorner", {CornerRadius = UDim.new(1, 0)}),
        uIPadding = createElement("UIPadding", {
            PaddingBottom = UDim.new(0.1, 0),
            PaddingLeft = UDim.new(0.15, 0),
            PaddingRight = UDim.new(0.15, 0),
            PaddingTop = UDim.new(0.1, 0),
        }),
        text = createElement("TextLabel", {
            BackgroundTransparency = 1,
            TextScaled = true,
            TextSize = 18,
            TextWrapped = true,
            ZIndex = 5,
            AnchorPoint = Vector2.new(0.5, 0.5),
            BorderColor3 = Color3.fromRGB(27, 42, 53),
            Size = UDim2.fromScale(1, 1),
            FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Heavy, Enum.FontStyle.Normal),
            Position = v4:map(function(a1) -- Line: 553
                return UDim2.fromScale(0.5, 0.5 - a1)
            end),
            Text = notifications,
            TextTransparency = v8.transparency,
            TextColor3 = Color3.fromRGB(255, 255, 255),
        }, {uIAspectRatioConstraint2 = createElement("UIAspectRatioConstraint")}),
    })
    v10.sizeContainer = createElement("Frame", v11, v12)
    return createElement("TextButton", v9, v10)
end)