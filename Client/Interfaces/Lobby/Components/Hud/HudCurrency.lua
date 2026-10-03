-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.Hud.HudCurrency
-- Decompile time: 8.69 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Components = ReplicatedStorage.Client.Interfaces.Components
local Hooks = ReplicatedStorage.Client.Interfaces.Hooks
local Comma = require(ReplicatedStorage.Shared.UI.Comma)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactFlow = require(ReplicatedStorage.Packages.ReactFlow)
local useFontScale = require(Hooks.useFontScale)
local useScale = require(Hooks.useScale)
local useViewEnabled = require(Hooks.useViewEnabled)
local ImageLabel = require(Components.ImageLabel)
local ParticleEmitter = require(Components.ParticleEmitter)
local Tween = ReactFlow.Tween
local useRef = React.useRef
local useTween = ReactFlow.useTween
local useSpring = ReactFlow.useSpring
local useState = React.useState
local useAnimation = ReactFlow.useAnimation
local useGroupAnimation = ReactFlow.useGroupAnimation
local useEffect = React.useEffect
local useBinding = React.useBinding
local createElement = React.createElement
return React.memo(function(a1) -- Line: 55
    -- upvalues: ReactFlow (val), useRef (val), useFontScale (val), useBinding (val), useTween (val), useSpring (val)
    -- upvalues: useScale (val), useGroupAnimation (val), useAnimation (val), Tween (val), useState (val)
    -- upvalues: useEffect (val), useViewEnabled (val), createElement (val), ParticleEmitter (val), React (val)
    -- upvalues: ImageLabel (val), Comma (val)
    local v1
    local v2, u5 = ReactFlow.useSpring({start = 1, target = 1, speed = 48, damper = 0.6})
    local Size = a1.Size
    if not Size then
        Size = UDim2.fromScale(0, 0.435)
    end
    local AutomaticSize = a1.AutomaticSize
    local Position = a1.Position
    local AnchorPoint = a1.AnchorPoint
    local v3 = a1.phone == true
    local u21 = a1.Visible ~= false
    local v4 = a1.LayoutOrder or 0
    local icon = a1.icon
    local v5 = a1.name or ""
    local u29 = a1.currency or 0
    local view = a1.view
    local v6 = useRef()
    local v7 = (useFontScale({scale = 2})) * (a1.textScale or 1)
    local v8, u42 = useBinding(Vector2.zero)
    local v9, u49 = useTween({start = u29, target = u29, info = TweenInfo.new(0.2)})
    local v10, u53 = useSpring({damper = 0.5, speed = 15, start = 0, target = 0})
    local v11 = math.min(1, (useScale(1.5)))
    local v12, u106 = useGroupAnimation({
        enable = useAnimation({
            transparency = Tween({target = 0, info = TweenInfo.new(0.15)}),
            position = Tween({target = UDim2.fromScale(0, 0.5), info = TweenInfo.new(0.15)}),
        }),
        disable = useAnimation({
            transparency = Tween({target = 1, info = TweenInfo.new(0.15)}),
            position = Tween({target = UDim2.fromScale(0, 1), info = TweenInfo.new(0.15)}),
        }),
    }, {transparency = 1, position = UDim2.fromScale(0, 1)})
    local u109 = useRef(u29)
    local v13, u113 = useState(false)
    local v14 = {u29}
    useEffect(function() -- Line: 114 -- upvalues: u109 (val), u29 (val), u113 (val), u53 (val), u49 (val)
        if u109.current == u29 then
            return
        end
        local v1 = math.abs(u29 - u109.current)
        u109.current = u29
        u113(true)
        u53({force = math.clamp(math.min(3, v1 * 0.001), 0, 10)})
        u49({target = u29})
        local u29_2 = nil
        u29_2 = task.spawn(function() -- Line: 131 -- upvalues: u113 (upval), u29_2 (ref)
            task.wait(0.2)
            u113(false)
            u29_2 = nil
        end)
        return function() -- Line: 137 -- upvalues: u29_2 (ref)
            if u29_2 then
                task.cancel(u29_2)
            end
        end
    end, v14)
    v14 = {u21}
    useEffect(function() -- Line: 144 -- upvalues: u106 (val), u21 (val)
        u106(if not u21 then "disable" else "enable")
    end, v14)
    if view and not useViewEnabled(view) then
        return nil
    end
    v14 = {BackgroundTransparency = 1, AnchorPoint = AnchorPoint or Vector2.new(0, 0.5)}
    v14.Position = Position or UDim2.fromScale(0, 0.5)
    v14.AutomaticSize = Enum.AutomaticSize.None
    v14.LayoutOrder = v4
    v14.ref = v6
    v14.ZIndex = a1.LayoutOrder
    local v15 = if AutomaticSize == Enum.AutomaticSize.None then Size else v8:map(function(a1) -- Line: 165 -- upvalues: Size (val)
        return UDim2.new(UDim.new(Size.X.Scale, a1.X), Size.Y)
    end)
    v14.Size = v15
    v15 = {}
    local v16 = {
        BackgroundTransparency = 1,
        Position = UDim2.fromScale(0, 0),
        Visible = v8:map(function(a1) -- Line: 173
            local v1 = false
            if 0 < a1.X then
                v1 = 0 < a1.Y
            end
            return v1
        end),
        Size = v8:map(function(a1) -- Line: 176
            return UDim2.fromOffset(a1.X, a1.Y)
        end),
    }
    local v17 = {}
    local v18 = {
        drag = 5,
        rate = 40,
        enabled = v13 and u21,
        lifeTime = NumberRange.new(0.5, 0.8),
        acceleration = Vector2.new(0, -50),
        speed = NumberRange.new(10, 20),
        spreadAngle = NumberRange.new(-45, 45),
        rotation = NumberRange.new(-180, 180),
    }
    local new = NumberSequence.new
    local v19 = {NumberSequenceKeypoint.new(0, 0), (NumberSequenceKeypoint.new(1, 1))}
    v18.transparency = new(v19)
    local v20 = not (typeof(icon) ~= "number") and ("rbxassetid://%*"):format(icon) or icon
    v18.texture = v20
    v17.emitter = createElement(ParticleEmitter, v18)
    v15.emitterContainer = createElement("Frame", v16, v17)
    v16 = {
        BackgroundTransparency = 1,
        AnchorPoint = Vector2.new(0, 0.5),
        Position = v12.position,
        Size = UDim2.fromScale(0, 1),
        AutomaticSize = Enum.AutomaticSize.X,
    }
    v17 = {}
    local v21 = createElement
    v18 = {
        Scale = v10:map(function(a1) -- Line: 205
            return 1 + a1 * 0.9
        end),
    }
    v17.scale = v21("UIScale", v18)
    local getExtra = a1.getExtra
    if getExtra then
        v21 = createElement
        v18 = {
            ZIndex = 9999,
            LayoutOrder = -3,
            Size = UDim2.fromScale(0.5, 0.5),
            Position = UDim2.fromScale(-0.1, 0.5),
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.fromRGB(0, 183, 255),
        }
        v20 = {
            UICorner = createElement("UICorner", {CornerRadius = UDim.new(0.25, 0)}),
            UIStroke = createElement("UIStroke", {
                Transparency = 0.1,
                Thickness = 0.1,
                Color = Color3.fromRGB(0, 57, 110),
                StrokeSizingMode = Enum.StrokeSizingMode.ScaledSize,
            }),
            AspectRatio = createElement("UIAspectRatioConstraint", {AspectRatio = 1}),
            UIScale = createElement("UIScale", {Scale = v2}),
        }
        v19 = createElement
        v1 = {Size = UDim2.fromScale(1, 1), Text = "", BackgroundTransparency = 1}

        v1[React.Event.MouseButton1Click] = function() -- Line: 240 -- upvalues: a1 (val)
            a1.onExtraClick()
        end

        v1[React.Event.MouseEnter] = function() -- Line: 243 -- upvalues: u5 (val)
            u5({target = 1.2})
        end

        v1[React.Event.MouseLeave] = function() -- Line: 246 -- upvalues: u5 (val)
            u5({target = 1})
        end

        v1[React.Event.MouseButton1Down] = function() -- Line: 249 -- upvalues: u5 (val)
            u5({target = 0.9})
        end

        v1[React.Event.MouseButton1Up] = function() -- Line: 252 -- upvalues: u5 (val)
            u5({target = 1.2})
        end

        v20.Button = v19("TextButton", v1)
        v20.textLabel = createElement("TextLabel", {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Text = "+",
            TextScaled = true,
            TextWrapped = true,
            TextTransparency = 0.5,
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.ExtraBold, Enum.FontStyle.Normal),
            Size = UDim2.fromScale(1.2, 1.2),
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
            TextColor3 = Color3.fromRGB(0, 0, 0),
        })
        getExtra = v21("Frame", v18, v20)
    end
    v17.getExtra = getExtra
    v21 = createElement
    v18 = {
        FillDirection = Enum.FillDirection.Horizontal,
        HorizontalAlignment = Enum.HorizontalAlignment.Left,
        VerticalAlignment = Enum.VerticalAlignment.Center,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, 4),
    }

    v18[React.Change.AbsoluteContentSize] = function(a1) -- Line: 284 -- upvalues: u42 (val)
        u42(a1.AbsoluteContentSize)
    end

    v17.list = v21("UIListLayout", v18)
    v18 = {
        BackgroundTransparency = 1,
        ZIndex = 4,
        LayoutOrder = -1,
        AnchorPoint = Vector2.new(0, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(27, 42, 53),
    }
    v18.Image = not (typeof(icon) ~= "number") and ("rbxassetid://%*"):format(icon) or icon
    v18.ImageTransparency = v12.transparency
    v18.Position = UDim2.fromScale(0, 0.5)
    v18.Size = UDim2.fromScale(0.8, 0.8)
    v17.icon = createElement(ImageLabel, v18, {aspectRatio = createElement("UIAspectRatioConstraint")})
    v18 = {
        BackgroundTransparency = 1,
        Size = UDim2.fromScale(0, 0),
        AutomaticSize = Enum.AutomaticSize.XY,
    }
    v20 = {
        list = createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical,
            HorizontalAlignment = Enum.HorizontalAlignment.Left,
            VerticalAlignment = Enum.VerticalAlignment.Center,
            SortOrder = Enum.SortOrder.LayoutOrder,
            Padding = UDim.new(0, 0),
        }),
        name = not v3 and createElement("TextLabel", {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            TextScaled = false,
            TextWrapped = false,
            LayoutOrder = -1,
            AnchorPoint = Vector2.new(0, 0.5),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
            Position = UDim2.fromScale(0.6, 0.312),
            Size = UDim2.fromScale(0, 0),
            Text = v5,
            TextColor3 = Color3.fromRGB(255, 255, 255),
            TextTransparency = v12.transparency,
            TextSize = math.round(v7 * 0.9),
            AutomaticSize = Enum.AutomaticSize.XY,
            TextXAlignment = Enum.TextXAlignment.Left,
        }, {
            uIStroke1 = createElement("UIStroke", {
                Color = Color3.fromRGB(57, 57, 57),
                Transparency = v12.transparency,
                Thickness = v11 * 4,
            }),
        }),
    }
    v1 = {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        TextScaled = false,
        TextWrapped = false,
        AnchorPoint = Vector2.new(0, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
        Position = UDim2.fromScale(0.6, if not v3 then 0.688 else 0.5),
        Size = UDim2.fromScale(0, 0),
        AutomaticSize = Enum.AutomaticSize.XY,
        Text = v9:map(function(a1) -- Line: 361 -- upvalues: Comma (upval)
            return Comma((math.floor(a1)))
        end),
        TextTransparency = v12.transparency,
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextSize = v7,
        TextXAlignment = Enum.TextXAlignment.Left,
    }
    local v22 = {}
    local v23 = {Rotation = 83}
    local textColor = a1.textColor or ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(254, 243, 23)),
        (ColorSequenceKeypoint.new(1, Color3.fromRGB(216, 101, 0))),
    })
    v23.Color = textColor
    v22.uIGradient = createElement("UIGradient", v23)
    v23 = {
        Color = Color3.fromRGB(255, 255, 255),
        Transparency = v12.transparency,
        Thickness = v11 * 4,
    }
    local v24 = {}
    local v25 = {Rotation = 83}
    local textStokeColor = a1.textStokeColor or ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(45, 21, 0)),
        (ColorSequenceKeypoint.new(1, Color3.fromRGB(83, 69, 18))),
    })
    v25.Color = textStokeColor
    v24.uIGradient1 = createElement("UIGradient", v25)
    v22.uIStroke = createElement("UIStroke", v23, v24)
    v20.currencyValue = createElement("TextLabel", v1, v22)
    v17.currency = createElement("Frame", v18, v20)
    v15.content = createElement("Frame", v16, v17)
    return createElement("Frame", v14, v15)
end)