-- Script path: ReplicatedStorage.Client.Interfaces.Universal.Components.Inventory.Button
-- Decompile time: 24.95 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")
local CircularProgressBar = require(ReplicatedStorage.Client.Interfaces.Universal.Components.CircularProgressBar)
local Loader = require(ReplicatedStorage.Client.Interfaces.Components.Loader)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactFlow = require(ReplicatedStorage.Packages.ReactFlow)
require(ReplicatedStorage.Shared.UI.ReactTypes)
local Spotlight = require(ReplicatedStorage.Client.Interfaces.Components.Spotlight)
local SpotlightStore = require(ReplicatedStorage.Client.Interfaces.Stores.Shared.SpotlightStore)
local useAspectRatio = require(ReplicatedStorage.Client.Interfaces.Hooks.useAspectRatio)
local useMediaQuery = require(ReplicatedStorage.Client.Interfaces.Hooks.useMediaQuery)
local useScale = require(ReplicatedStorage.Client.Interfaces.Hooks.useScale)
local useSound = require(ReplicatedStorage.Client.Interfaces.Hooks.useSound)
local useTransparencyModifier = require(ReplicatedStorage.Client.Interfaces.Hooks.useTransparencyModifier)
local createElement = React.createElement
local memo = React.memo
local useMemo = React.useMemo
local useBinding = React.useBinding
local useCallback = React.useCallback
local useEffect = React.useEffect
local useRef = React.useRef

local function shiftHSV(a1, a2) -- Line: 60 -- upvalues: useMemo (val) -- types: a1: userdata, a2: number
    return useMemo(function() -- Line: 61 -- upvalues: a1 (val), a2 (val)
        local v1, v2, v3 = Color3.toHSV(a1)
        return Color3.fromHSV(v1, v2, v3 + a2)
    end, {a1})
end

return memo(function(a1) -- Line: 67
    -- upvalues: useAspectRatio (val), useMemo (val), useBinding (val), useTransparencyModifier (val), useRef (val)
    -- upvalues: ReactFlow (val), useMediaQuery (val), React (val), useScale (val), useCallback (val), useSound (val)
    -- upvalues: useEffect (val), UserInputService (val), createElement (val), SpotlightStore (val), Spotlight (val)
    -- upvalues: Loader (val), CircularProgressBar (val)
    local left, new_2, u8, v1
    local u3 = a1.disabled == true
    if a1.dontUseRatio then
        u8 = 1
    else
        u8 = useAspectRatio()
        if not u8 then
            u8 = 1
        end
    end
    local padding = a1.padding
    local holdTime = a1.holdTime
    local u14 = a1.btnHoverScale or 5
    local color = a1.color
    if not color then
        color = Color3.fromRGB(80, 255, 86)
    end
    local v2 = useMemo
    local u22 = 0.1
    local v3 = {color}
    v2 = v2(function() -- Line: 61 -- upvalues: color (val), u22 (val)
        local v1, v2, v3 = Color3.toHSV(color)
        return Color3.fromHSV(v1, v2, v3 + u22)
    end, v3)
    local v4 = useMemo
    local u29 = 0.2
    local v5 = {color}
    v4 = v4(function() -- Line: 61 -- upvalues: color (val), u29 (val)
        local v1, v2, v3 = Color3.toHSV(color)
        return Color3.fromHSV(v1, v2, v3 + u29)
    end, v5)
    v5 = useTransparencyModifier(a1.transparency or useBinding(0))
    local v6 = useRef(nil)
    local v7, u50 = ReactFlow.useSpring({target = 0, start = 0, speed = 45, damper = 0.7})
    local v8 = not useMediaQuery("large")
    local v9 = a1.dontScale and React.useBinding(1) or useScale(if not v8 then 1.5 else 2.2, nil, true, nil, true)
    local v10 = useScale(1.3, nil, true, nil)
    if a1.dontScale then
        v10 = 1
    end
    if v8 then
        v10 = 1
    end
    local u90 = React.useRef(nil)
    local u105, u106, u107 = ReactFlow.useTween({
        start = 0,
        target = 1,
        info = TweenInfo.new(holdTime or 0, Enum.EasingStyle.Linear),
    })
    local v11 = {u106}
    local u112 = useCallback(function() -- Line: 110 -- upvalues: u90 (val), u106 (val), u105 (val)
        if not u90.current then
            return
        end
        u90.current()
        u90.current = nil
        u106({
            target = 0,
            start = u105:getValue(),
            info = TweenInfo.new(0.2, Enum.EasingStyle.Quad),
        })
    end, v11)
    local v12 = {holdTime, u106}
    local u120 = useCallback(function() -- Line: 125 -- upvalues: u90 (val), u107 (val), holdTime (val), u106 (val), u105 (val), a1 (val)
        local u9
        if u90.current then
            u90.current()
        end
        u107()
        local u7 = nil

        function u9() -- Line: 135 -- upvalues: u7 (ref), u90 (upval), u9 (ref)
            if u7 then
                task.cancel(u7)
                u7 = nil
            end
            if u90.current == u9 then
                u90.current = nil
            end
        end

        local v1 = task.delay(holdTime, function() -- Line: 146 -- upvalues: u90 (upval), u9 (ref), u106 (upval), u105 (upval), a1 (upval)
            if u90.current ~= u9 then
                return
            end
            u90.current = nil
            u106({
                target = 0,
                start = u105:getValue(),
                info = TweenInfo.new(0.2, Enum.EasingStyle.Quad),
            })
            if a1.onClick then
                a1.onClick()
            end
        end)
        u90.current = u9
        u106({
            start = 0,
            target = 1,
            info = TweenInfo.new(holdTime, Enum.EasingStyle.Linear),
        })
    end, v12)
    local PurchaseHold, PurchaseHold_2 = useSound("PurchaseHold")
    local CancelPurchase = useSound("CancelPurchase")
    local Click = useSound("Click")
    local v13 = v5(0):map(function(a1) -- Line: 176
        return a1 < 1
    end)
    local v14 = v13:map(function(a1) -- Line: 179 -- upvalues: u3 (val)
        return a1 and not u3
    end)
    useEffect(function() -- Line: 183
        -- upvalues: u90 (val), PurchaseHold_2 (val), CancelPurchase (val), u112 (val), UserInputService (upval)
        local function cancel() -- Line: 184
            -- upvalues: u90 (upval), PurchaseHold_2 (upval), CancelPurchase (upval), u112 (upval)
            if not u90.current then
                return
            end
            PurchaseHold_2()
            CancelPurchase()
            u112()
        end

        local u6 = UserInputService.WindowFocusReleased:Connect(function() -- Line: 194 -- upvalues: u90 (upval), PurchaseHold_2 (upval), CancelPurchase (upval), u112 (upval)
            if not u90.current then
                return
            end
            PurchaseHold_2()
            CancelPurchase()
            u112()
        end)
        return function() -- Line: 198 -- upvalues: u6 (val), u90 (upval), PurchaseHold_2 (upval), CancelPurchase (upval), u112 (upval)
            u6:Disconnect()
            if not u90.current then
                return
            end
            PurchaseHold_2()
            CancelPurchase()
            u112()
        end
    end, {})
    local v15 = {}
    local anchorPoint = a1.anchorPoint or Vector2.new(0, 0)
    v15.AnchorPoint = anchorPoint
    local automaticSize = a1.automaticSize or Enum.AutomaticSize.X
    v15.AutomaticSize = automaticSize
    v15.BackgroundColor3 = color
    v15.ImageColor3 = v2
    v15.ImageTransparency = v5(0)
    v15.BackgroundTransparency = v5(0)
    local position = a1.position or UDim2.fromScale(0.25, 0.94)
    v15.Position = position
    v15.ScaleType = Enum.ScaleType.Tile
    v15.Selectable = v14
    local size = a1.size or UDim2.fromScale(0, 1)
    v15.Size = size
    v15.TileSize = UDim2.fromOffset(45, 45)
    v15.LayoutOrder = a1.layoutOrder
    v15.ZIndex = a1.zIndex or 1
    v15.Visible = v13
    v15.Active = v14
    v15.ref = v6

    v15[React.Event.MouseButton1Down] = function() -- Line: 222
        -- upvalues: u3 (val), holdTime (val), u50 (val), u120 (val), PurchaseHold (val), a1 (val), Click (val)
        -- upvalues: SpotlightStore (upval)
        if u3 then
            return
        end
        if holdTime then
            u50({target = 0.5})
            u120()
            PurchaseHold()
            return
        end
        u50({target = -0.3 * (a1.scaleMultiplier or 1)})
        if a1.onClick then
            Click()
            a1.onClick()
        end
        if a1.spotLight then
            SpotlightStore.fire(a1.spotLight)
        end
    end

    v15[React.Event.MouseButton1Up] = function() -- Line: 246
        -- upvalues: u3 (val), holdTime (val), PurchaseHold_2 (val), CancelPurchase (val), u112 (val), u50 (val)
        -- upvalues: a1 (val)
        if u3 then
            return
        end
        if holdTime then
            PurchaseHold_2()
            CancelPurchase()
            u112()
        end
        u50({target = 1 * (a1.scaleMultiplier or 1)})
    end

    v15[React.Event.MouseEnter] = function() -- Line: 262 -- upvalues: u3 (val), u50 (val), a1 (val)
        if u3 then
            return
        end
        u50({target = 1 * (a1.scaleMultiplier or 1)})
    end

    v15[React.Event.MouseLeave] = function() -- Line: 272 -- upvalues: u90 (val), PurchaseHold_2 (val), CancelPurchase (val), u112 (val), u50 (val)
        if u90.current then
            PurchaseHold_2()
            CancelPurchase()
            u112()
        end
        u50({target = 0})
    end

    local v16 = {
        uIScale = createElement("UIScale", {
            Scale = (React.joinBindings({v9, v7})):map(function(a1) -- Line: 285 -- upvalues: u14 (val), u8 (val)
                return (a1[1] + a1[2] / u14) / u8
            end),
        }),
    }
    local aspectRatio = a1.aspectRatio and createElement("UIAspectRatioConstraint", {AspectRatio = a1.aspectRatio})
    v16.uiAspectRatio = aspectRatio
    local spotLight = a1.spotLight and createElement(Spotlight, {name = a1.spotLight, btnRef = v6})
    v16.spotlight = spotLight
    local loading = a1.loading and createElement(Loader, {
        BackgroundTransparency = 1,
        Visible = true,
        ZIndex = 100,
        Size = UDim2.fromScale(0.7, 0.7),
        Position = UDim2.fromScale(0.5, 0.5),
        AnchorPoint = Vector2.new(0.5, 0.5),
        ImageTransparency = v5(0),
    })
    v16.loadingCircle = loading
    v16.corner = createElement("UICorner", {CornerRadius = UDim.new(0.0615385, 0)})
    v16.gradient = createElement("UIGradient", {
        Rotation = 90,
        Transparency = v5(NumberSequence.new(0)),
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.new(1, 1, 1)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(130, 130, 130))),
        }),
    })
    v16.stroke = createElement("UIStroke", {Thickness = 2, Color = v4, Transparency = v5(0)})
    v16.UIShadow = createElement("UIShadow", {
        Transparency = 0.5,
        BlurRadius = UDim.new(0.1, 0),
        Offset = UDim2.fromOffset(0, 3),
        Spread = UDim2.fromOffset(4, 4),
    })
    v16.listLayout = createElement("UIListLayout", {
        FillDirection = Enum.FillDirection.Horizontal,
        HorizontalAlignment = Enum.HorizontalAlignment.Center,
        Padding = UDim.new(0.05, 0),
        SortOrder = Enum.SortOrder.LayoutOrder,
        VerticalAlignment = Enum.VerticalAlignment.Center,
    })
    local v17 = {}
    if not padding then
        new_2 = UDim.new
        v1 = if not holdTime then 1 else 0
        left = new_2(0, 25 * v10 * v1)
    else
        left = padding.left
        if not left then
            new_2 = UDim.new
            v1 = if not holdTime then 1 else 0
            left = new_2(0, 25 * v10 * v1)
        end
    end
    v17.PaddingLeft = left
    local right = padding and padding.right or UDim.new(0, 25 * v10)
    v17.PaddingRight = right
    v17.PaddingTop = padding and padding.top
    v17.PaddingBottom = padding and padding.bottom
    v16.padding = createElement("UIPadding", v17)
    local text = a1.text
    if text then
        v17 = {
            BackgroundTransparency = 1,
            TextScaled = false,
            AnchorPoint = Vector2.new(0.5, 0.5),
            AutomaticSize = Enum.AutomaticSize.X,
            FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
            Position = UDim2.fromScale(0.5, 0.5),
            TextSize = (a1.textSize or 14) * v10,
            Text = a1.text,
        }
        local textColor = a1.textColor or Color3.new(1, 1, 1)
        v17.TextColor3 = textColor
        v17.TextTransparency = v5(0)
        text = createElement("TextLabel", v17, {
            uIStroke = createElement("UIStroke", {
                Thickness = 2,
                LineJoinMode = Enum.LineJoinMode.Bevel,
                Transparency = v5(0.5),
            }),
        })
    end
    v16.text = text
    local v18 = holdTime
    if v18 then
        v17 = {BackgroundTransparency = 1, LayoutOrder = -1, AnchorPoint = Vector2.new(0.5, 0.5)}
        local iconSize = a1.iconSize or UDim2.fromScale(0.4, 0.4)
        v17.Size = iconSize
        v18 = createElement("Frame", v17, {
            uIAspectRatioConstraint = createElement("UIAspectRatioConstraint"),
            bg = createElement("Frame", {
                BackgroundTransparency = 1,
                Size = UDim2.fromScale(0.95, 0.95),
                Position = UDim2.fromScale(0.5, 0.5),
                AnchorPoint = Vector2.new(0.5, 0.5),
                BackgroundColor3 = Color3.new(0, 0, 0),
            }, {
                corner = createElement("UICorner", {CornerRadius = UDim.new(1, 0)}),
                stroke = createElement("UIStroke", {Thickness = 2, Color = Color3.new(1, 1, 1), Transparency = v5(0.8)}),
            }),
            timer = createElement(CircularProgressBar, {
                Reverse = true,
                Transparency = 0.2,
                Thickness = 5,
                Alpha = u105:map(function(a1) -- Line: 401
                    return a1
                end),
                Color = Color3.new(1, 1, 1),
                Size = UDim2.fromScale(1.25, 1.25),
                Position = UDim2.fromScale(0.5, 0.5),
                AnchorPoint = Vector2.new(0.5, 0.5),
            }),
        })
    end
    v16.holdIcon = v18
    local icon = not holdTime
    if icon then
        icon = a1.icon
        if icon then
            v17 = {
                BackgroundTransparency = 1,
                LayoutOrder = -1,
                AnchorPoint = Vector2.new(0.5, 0.5),
                ImageTransparency = v5(0),
            }
            local icon_4 = if typeof(a1.icon) ~= "number" then a1.icon else ("rbxassetid://%*"):format(a1.icon)
            v17.Image = icon_4
            local iconSize_2 = a1.iconSize or UDim2.fromScale(0.8, 0.8)
            v17.Size = iconSize_2
            icon = createElement("ImageLabel", v17, {uIAspectRatioConstraint = createElement("UIAspectRatioConstraint")})
        end
    end
    v16.icon = icon
    return createElement("ImageButton", v15, v16, a1.children)
end)