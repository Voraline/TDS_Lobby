-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.PVP.PVPTowerInventoryTroop
-- Decompile time: 21.90 ms

local HttpService = game:GetService("HttpService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Interfaces = ReplicatedStorage.Client.Interfaces
local Components = Interfaces.Components
local Hooks = Interfaces.Hooks
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactFlow = require(ReplicatedStorage.Packages.ReactFlow)
local ImageLabel = require(Components.ImageLabel)
local Tooltip = require(Components.Tooltip)
local useScale = require(Hooks.useScale)
local Event = React.Event
local createElement = React.createElement
local useEffect = React.useEffect
local useBinding = React.useBinding
local useRef = React.useRef
local joinBindings = React.joinBindings
local useCallback = React.useCallback
local memo = React.memo
local useMemo = React.useMemo
local useTween = ReactFlow.useTween
local useSpring = ReactFlow.useSpring
local useGroupAnimation = ReactFlow.useGroupAnimation
local useAnimation = ReactFlow.useAnimation
local Tween = ReactFlow.Tween
local Spring = ReactFlow.Spring
local u51 = Color3.new(1, 1, 1)

local function lightenBorder(a1) -- Line: 75 -- upvalues: u51 (val) -- types: a1: userdata
    return a1:Lerp(u51, 0.4)
end

local function wrapUpdateState(a1, a2) -- Line: 79
    -- upvalues: useRef (val), useCallback (val)
    local u7 = useRef(if not a1 then "disabled" else "enabled")
    return useCallback(function(a1) -- Line: 83 -- upvalues: u7 (val), a2 (val) -- types: a1: boolean
        local v1
        if u7.current == (if not a1 then "disabled" else "enabled") then
            return
        end
        u7.current = v1
        a2(v1)
    end, {})
end

return (memo(function(a1) -- Line: 94
    -- upvalues: useBinding (val), useScale (val), useSpring (val), useMemo (val), HttpService (val)
    -- upvalues: useGroupAnimation (val), useAnimation (val), Spring (val), Tween (val), wrapUpdateState (val)
    -- upvalues: useTween (val), useEffect (val), u51 (val), createElement (val), Tooltip (val), Event (val)
    -- upvalues: ImageLabel (val), joinBindings (val)
    local u63
    local u3 = a1.banned == true
    local v1 = a1.banning == true
    local v2 = a1.locallyBanning == true
    local u19 = u3
    if not u19 then
        u19 = a1.locked == true
    end
    local v3 = not u3 and a1.selected == true
    local u29 = a1.equipped == true
    local v4 = a1.name or ""
    local icon = a1.icon
    local clicked = a1.clicked
    local tooltip = a1.tooltip
    local u145 = true
    local u39, u40 = useBinding(false)
    local u43 = useScale(1)
    local v5, u47 = useSpring({start = 1, target = 1, speed = 25, damper = 0.6})
    local v6 = useMemo(function() -- Line: 117 -- upvalues: HttpService (upval)
        return HttpService:GenerateGUID(false)
    end, {})
    if not v3 then
        u63 = Color3.fromRGB(154, 127, 127)
    else
        u63 = Color3.fromRGB(255, 255, 255)
        if not u63 then
            u63 = Color3.fromRGB(154, 127, 127)
        end
    end
    local v7 = if not v3 then Color3.fromRGB(58, 58, 58) else Color3.fromRGB(255, 255, 255)
    local u91 = if not u19 then Color3.fromRGB(255, 255, 255) else Color3.fromRGB(58, 58, 58)
    local u105 = if not u3 then v7 else Color3.fromRGB(255, 81, 127)
    if v1 and not u3 then
        if not v2 then
            u145 = false
            u40(false)
            u47({target = 1})
            u105 = Color3.new(0.1, 0.1, 0.1)
            v7 = Color3.new(0.1, 0.1, 0.1)
            u63 = Color3.new(0.6, 0.6, 0.6)
            u91 = Color3.new(0.5, 0.5, 0.5)
        else
            u105 = (Color3.fromRGB(129, 59, 38))
            u63 = Color3.new(1, 1, 1)
            u91 = Color3.new(1, 1, 1)
        end
    end
    local v8, v9 = useGroupAnimation({
        enabled = useAnimation({
            bump = Spring({target = 0, speed = 10, damper = 0.6, force = 200}),
            position = Tween({
                target = 0,
                info = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            }),
            transparency = Tween({
                target = 0,
                info = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            }),
        }),
        disabled = useAnimation({
            position = Tween({
                target = 10,
                info = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            }),
            transparency = Tween({
                target = 1,
                info = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            }),
        }),
    }, {bump = 0, position = if not u29 then 10 else 0, transparency = if not u29 then 1 else 0})
    local v10, v11 = useGroupAnimation({
        enabled = useAnimation({
            bump = Spring({target = 0, speed = 10, damper = 0.6, force = 200}),
            position = Tween({
                target = 0,
                info = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            }),
            transparency = Tween({
                target = 0,
                info = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            }),
        }),
        disabled = useAnimation({
            position = Tween({
                target = 10,
                info = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            }),
            transparency = Tween({
                target = 1,
                info = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            }),
        }),
    }, {bump = 0, position = if not u19 then 10 else 0, transparency = if not u19 then 1 else 0})
    local v12, v13 = useGroupAnimation({
        enabled = useAnimation({
            bump = Spring({target = 0, speed = 10, damper = 0.6, force = 200}),
            rotation = Spring({target = 0, speed = 20, damper = 0.5, force = 400}),
            scale = Spring({target = 1, speed = 10, damper = 0.6}),
            position = Tween({
                target = 0,
                info = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            }),
            transparency = Tween({
                target = 0,
                info = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            }),
        }),
        disabled = useAnimation({
            scale = Spring({target = 0, speed = 10, damper = 1}),
            position = Tween({
                target = 10,
                info = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            }),
            transparency = Tween({
                target = 1,
                info = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            }),
        }),
    }, {
        rotation = 0,
        bump = 0,
        position = if not u3 then 10 else 0,
        transparency = if not u3 then 0 else 0,
        scale = if not u3 then 0 else 1,
    })
    local u412 = wrapUpdateState(not u3 and u29, v9)
    local u423 = wrapUpdateState(u19, v11)
    local u427 = wrapUpdateState(u3, v13)
    local v14, u446 = useTween({
        info = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
        start = u91,
        target = u91,
    })
    local v15, u464 = useTween({
        info = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
        start = v7,
        target = v7,
    })
    local v16, u485 = useTween({
        info = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
        start = u63,
        target = u63,
    })
    if not u145 then
        u446({target = u91})
        u464({target = v7})
        u485({target = u63})
    end
    local v17 = {v1, u3, v2, u19, u29, v3}
    useEffect(function() -- Line: 266
        -- upvalues: u464 (val), u39 (val), u105 (ref), u51 (upval), u485 (val), u63 (ref), u446 (val), u91 (ref)
        u464({target = if not u39:getValue() then u105 else u105:Lerp(u51, 0.4)})
        u485({target = u63})
        u446({target = u91})
    end, v17)
    v17 = {u3, u29}
    useEffect(function() -- Line: 282 -- upvalues: u412 (val), u3 (val), u29 (val)
        u412(not u3 and u29)
    end, v17)
    v17 = {u3, u19}
    useEffect(function() -- Line: 286 -- upvalues: u423 (val), u3 (val), u19 (val)
        u423(not u3 and u19)
    end, v17)
    v17 = {u3}
    useEffect(function() -- Line: 290 -- upvalues: u427 (val), u3 (val)
        u427(u3)
    end, v17)
    v17 = {BackgroundTransparency = 1}
    local Size = a1.Size or UDim2.fromOffset(100, 100)
    v17.Size = Size
    v17.Position = a1.Position
    v17.AnchorPoint = a1.AnchorPoint
    v17.LayoutOrder = a1.LayoutOrder
    v17.Visible = a1.Visible
    local v18 = {
        tooltip = if not tooltip then nil else createElement(Tooltip, {
            Name = v6,
            Header = tooltip.header,
            Subject = tooltip.subject,
            Content = tooltip.content,
        }),
    }
    local v19 = {
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        BackgroundTransparency = 1,
        BorderColor3 = Color3.fromRGB(27, 42, 53),
        BorderSizePixel = 0,
        Selectable = false,
        Size = UDim2.fromScale(1, 1),
        Position = UDim2.fromScale(0.5, 0.5),
        AnchorPoint = Vector2.new(0.5, 0.5),
    }

    v19[Event.MouseButton1Up] = function() -- Line: 323 -- upvalues: u39 (val), u145 (ref), u47 (val), u43 (val), clicked (val)
        local v1 = u39:getValue()
        if u145 then
            u47({target = if not v1 then 1 else 1 + 0.05 * u43})
        end
        if v1 and clicked then
            clicked()
        end
    end

    v19[Event.MouseButton1Down] = function() -- Line: 335 -- upvalues: u145 (ref), u47 (val), u43 (val)
        if u145 then
            u47({target = 1 - 0.05 * u43})
        end
    end

    v19[Event.MouseEnter] = function() -- Line: 341 -- upvalues: u145 (ref), u47 (val), u43 (val), u40 (val), u464 (val), u105 (ref), u51 (upval)
        if u145 then
            u47({target = 1 + 0.05 * u43})
            u40(true)
            u464({target = u105:Lerp(u51, 0.4)})
        end
    end

    v19[Event.MouseLeave] = function() -- Line: 351 -- upvalues: u145 (ref), u47 (val), u43 (val), u40 (val), u464 (val), u105 (ref)
        if u145 then
            u47({target = 1 - 0.05 * u43})
            u40(false)
            u464({target = u105})
        end
    end

    local v20 = {scale = createElement("UIScale", {Scale = v5})}
    v20.corner = createElement("UICorner", {CornerRadius = UDim.new(0, 4)})
    v20.states = createElement("Frame", {
        BackgroundTransparency = 1,
        ZIndex = 2,
        AnchorPoint = Vector2.new(1, 0),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(27, 42, 53),
        Position = UDim2.fromScale(1, 0),
        Size = UDim2.fromScale(0.175, 0.175),
        SizeConstraint = Enum.SizeConstraint.RelativeYY,
    }, {
        equipped = createElement(ImageLabel, {
            BackgroundTransparency = 1,
            Image = "rbxassetid://8418292821",
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BorderColor3 = Color3.fromRGB(27, 42, 53),
            Size = UDim2.fromScale(1, 1),
            ImageTransparency = v8.transparency,
            Visible = v8.transparency:map(function(a1) -- Line: 388
                return a1 < 1
            end),
            Position = joinBindings({v8.position, v8.bump}):map(function(a1) -- Line: 393
                return UDim2.fromOffset(0, a1[1] - a1[2])
            end),
        }),
        locked = createElement(ImageLabel, {
            BackgroundTransparency = 1,
            Image = "rbxassetid://8418293221",
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BorderColor3 = Color3.fromRGB(27, 42, 53),
            Size = UDim2.fromScale(1, 1),
            ImageTransparency = v10.transparency,
            Visible = v10.transparency:map(function(a1) -- Line: 407
                return a1 < 1
            end),
            Position = joinBindings({v10.position, v10.bump}):map(function(a1) -- Line: 412
                return UDim2.fromOffset(0, a1[1] - a1[2])
            end),
        }),
    })
    v20.banned = createElement(ImageLabel, {
        BackgroundTransparency = 1,
        ZIndex = 3,
        Image = "rbxassetid://91688211474848",
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(27, 42, 53),
        Size = UDim2.fromScale(0.9, 0.9),
        SizeConstraint = Enum.SizeConstraint.RelativeYY,
        ImageTransparency = v12.transparency,
        Rotation = v12.rotation,
        Visible = v12.transparency:map(function(a1) -- Line: 431
            return a1 < 1
        end),
        Position = joinBindings({v12.position, v12.bump}):map(function(a1) -- Line: 436
            return (UDim2.fromScale(0.5, 0.5)) + UDim2.fromOffset(0, a1[1] - a1[2])
        end),
    }, {scale = createElement("UIScale", {Scale = v12.scale})})
    local v21 = {
        BackgroundTransparency = 1,
        ZIndex = 2,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(27, 42, 53),
    }
    v21.Image = not (typeof(icon) ~= "number") and ("rbxassetid://%*"):format(icon) or icon
    v21.ImageColor3 = v14
    v21.ScaleType = Enum.ScaleType.Fit
    v21.Position = UDim2.fromScale(0.5, 0.5)
    v21.Size = UDim2.fromScale(1.16, 1.16)
    v21.SizeConstraint = Enum.SizeConstraint.RelativeYY
    v20.icon = createElement(ImageLabel, v21)
    v20.background = createElement(ImageLabel, {
        BackgroundTransparency = 1,
        Image = "rbxassetid://8418173081",
        ZIndex = 0,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(27, 42, 53),
        ImageColor3 = v15,
        Position = UDim2.fromScale(0.5, 0.5),
        ScaleType = Enum.ScaleType.Slice,
        Size = UDim2.new(1, -10, 1, -10),
        SliceCenter = Rect.new(10, 10, 90, 90),
    })
    v20.title = createElement("TextLabel", {
        BackgroundTransparency = 1,
        TextSize = 22,
        ZIndex = 3,
        AnchorPoint = Vector2.new(0, 1),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(27, 42, 53),
        FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
        Position = UDim2.fromScale(0, 1),
        Size = UDim2.new(1, 0, 0.175, 0),
        Text = v4,
        TextColor3 = v16,
    }, {uIStroke = createElement("UIStroke", {Thickness = 2, Transparency = 0.5})})
    v18.content = createElement("ImageButton", v19, v20)
    return (createElement("Frame", v17, v18))
end))