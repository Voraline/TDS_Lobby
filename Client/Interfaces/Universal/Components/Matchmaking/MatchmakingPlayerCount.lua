-- Script path: ReplicatedStorage.Client.Interfaces.Universal.Components.Matchmaking.MatchmakingPlayerCount
-- Decompile time: 20.50 ms

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactFlow = require(ReplicatedStorage.Packages.ReactFlow)
local useAttribute = require(ReplicatedStorage.Client.Interfaces.Hooks.useAttribute)
local useGamepass = require(ReplicatedStorage.Client.Interfaces.Hooks.useGamepass)
local usePooledEvent = require(ReplicatedStorage.Client.Interfaces.Hooks.usePooledEvent)
local useSound = require(ReplicatedStorage.Client.Interfaces.Hooks.useSound)
local useSpring = require(ReplicatedStorage.Client.Interfaces.Hooks.useSpring)
local useTransparencyModifier = require(ReplicatedStorage.Client.Interfaces.Hooks.useTransparencyModifier)
local useTween = require(ReplicatedStorage.Client.Interfaces.Hooks.useTween)
local createElement = React.createElement
local useBinding = React.useBinding
local useEffect = React.useEffect
local useRef = React.useRef
local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()
local u74 = {"Solo", "Duo", "Trio", "Quad", "Squad", "Mega"}
local u81 = {139606842766700, 132540015709205, 82763221350924, 91192473479229, 91192473479229, 91192473479229}
return function(a1) -- Line: 56
    -- upvalues: u81 (val), u74 (val), useRef (val), useSound (val), useAttribute (val), LocalPlayer (val)
    -- upvalues: useGamepass (val), useBinding (val), useTween (val), ReactFlow (val), useSpring (val)
    -- upvalues: useTransparencyModifier (val), useEffect (val), usePooledEvent (val), RunService (val), Mouse (val)
    -- upvalues: createElement (val), React (val)
    local u3 = a1.Visible ~= false
    local v1 = a1.background or 97114317696329
    local clicked = a1.clicked
    local count = a1.count
    if not count then
        count = a1.LayoutOrder
        if not count then
            count = 1
        end
    end
    local v2 = u81[count] or u81[1]
    local playerCounts = a1.playerCounts or u74
    local v3 = playerCounts[count] or "Solo"
    local v4 = if a1.max ~= 6 then 0.45 else 0.33
    local level = a1.level
    local currentLevel = a1.currentLevel
    local u65 = false
    local gamepass = a1.gamepass
    local attribute = a1.attribute
    local u37 = a1.isGamepass == true
    local u61 = nil
    local u62 = nil
    local v5 = nil
    local u42 = useRef()
    local Click = useSound("Click")
    if attribute then
        v5 = useAttribute(LocalPlayer, attribute) == true
    end
    if gamepass and u37 then
        local v6, v7 = useGamepass(gamepass)
        u62 = v7
        u65 = not v6
        if v5 then
            u65 = false
        end
    end
    if not u37 and level and level <= currentLevel then
        u65 = false
    end
    local u76, u77 = useBinding(false)
    local u80, u81_2 = useBinding(Vector2.zero)
    local u84, u85 = useBinding(Vector2.zero)
    local v8, u95 = useTween(0, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), true, true)
    local v9 = v8:map(function(a1) -- Line: 106
        return 1 - a1
    end)
    local v10, u104 = ReactFlow.useSpring({start = 0, speed = 25, damper = 0.8})
    local v11, u111 = useSpring(1, 0.5, 20, true)
    local v12, u118 = useSpring(2, 0.5, 20, true)
    local v13, u132 = useTween(Color3.fromRGB(145, 145, 145), TweenInfo.new(0.2, Enum.EasingStyle.Quad), true, true)
    local v14, u146 = useTween(Color3.fromRGB(88, 88, 88), TweenInfo.new(1, Enum.EasingStyle.Sine), true, true)
    local v15 = TweenInfo.new(0.5, Enum.EasingStyle.Exponential)
    local v16, u163 = useTween(if not u65 then 1 else 0, v15, true, true)
    v15 = useTransparencyModifier(v16)
    local v17 = {count, u3}
    useEffect(function() -- Line: 129 -- upvalues: count (val), u95 (val), u3 (val)
        local u6 = task.delay(0.05 * (count - 1), function() -- Line: 130 -- upvalues: u95 (upval), u3 (upval)
            u95(if not u3 then 0 else 1)
        end)
        return function() -- Line: 134 -- upvalues: u6 (val)
            if u6 then
                task.cancel(u6)
            end
        end
    end, v17)
    v17 = {u65}
    useEffect(function() -- Line: 141 -- upvalues: u163 (val), u65 (ref)
        u163(if not u65 then 1 else 0)
    end, v17)
    usePooledEvent(RunService.Heartbeat, function(a1) -- Line: 145 -- upvalues: u84 (val), u80 (val), u85 (val)
        u85((u84:getValue()):Lerp(u80:getValue(), a1 * 10))
    end, {})
    local v18 = {u65}
    usePooledEvent(Mouse.Move, function() -- Line: 152 -- upvalues: u42 (val), u76 (val), u65 (ref), Mouse (upval), u81_2 (val)
        local current = u42.current
        if current and u76:getValue() and not u65 then
            local AbsolutePosition = current.AbsolutePosition
            local AbsoluteSize = current.AbsoluteSize
            local v1 = (Mouse.X - AbsolutePosition.X) / AbsoluteSize.X
            local v2 = (Mouse.Y - AbsolutePosition.Y) / AbsoluteSize.Y
            u81_2(Vector2.new(math.round((v1 - 0.5) * 30 / 2) * 2 / 2, math.round((v2 - 0.5) * 30 / 2) * 2))
            return
        end
    end, v18)
    v17 = {BackgroundTransparency = 1, Position = a1.Position, AnchorPoint = a1.AnchorPoint}
    local Size = a1.Size or UDim2.fromScale(v4, v4)
    v17.Size = Size
    local LayoutOrder = a1.LayoutOrder or a1.count or 1
    v17.LayoutOrder = LayoutOrder
    v17.ZIndex = u76:map(function(a1) -- Line: 181
        if a1 then
            return 2
        end
        return 1
    end)
    v18 = {}
    local v19 = {
        Size = UDim2.fromScale(1, 1),
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BackgroundTransparency = 1,
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        BorderSizePixel = 0,
        Selectable = true,
        Text = "",
        ref = u42,
        Position = v9:map(function(a1) -- Line: 197
            return (UDim2.fromScale(0.5, 0.5)) + UDim2.fromOffset(0, 100 * a1)
        end),
    }

    v19[React.Event.MouseButton1Down] = function() -- Line: 201 -- upvalues: u111 (val), u118 (val)
        u111(0.99)
        u118(4)
    end

    v19[React.Event.MouseButton1Up] = function() -- Line: 206
        -- upvalues: u111 (val), u76 (val), u118 (val), Click (val), u37 (val), u61 (ref), u62 (ref), u65 (ref)
        -- upvalues: clicked (val)
        u111(if not u76:getValue() then 1 else 1.05)
        u118(2)
        Click()
        if u37 and not u61 then
            u62()
            return
        end
        if u65 then
            return
        end
        if clicked then
            clicked()
        end
    end

    v19[React.Event.MouseEnter] = function() -- Line: 227 -- upvalues: u65 (ref), u132 (val), u146 (val), u111 (val), u104 (val), u77 (val)
        if not u65 then
            u132(Color3.fromRGB(255, 255, 255))
            u146(Color3.fromRGB(255, 255, 255))
        end
        u111(1.05)
        u104({target = 1})
        u77(true)
    end

    v19[React.Event.MouseLeave] = function() -- Line: 238 -- upvalues: u65 (ref), u132 (val), u146 (val), u111 (val), u104 (val), u81_2 (val), u77 (val)
        if not u65 then
            u132(Color3.fromRGB(145, 145, 145))
            u146(Color3.fromRGB(88, 88, 88))
        end
        u111(1)
        u104({target = 0})
        u81_2(Vector2.zero)
        u77(false)
    end

    local v20 = {scale = createElement("UIScale", {Scale = v11})}
    local v21 = {
        ClipsDescendants = true,
        BackgroundTransparency = 1,
        Size = UDim2.fromScale(1, 1),
        Position = UDim2.fromScale(0.5, 0.5),
        AnchorPoint = Vector2.new(0.5, 0.5),
        GroupTransparency = v9,
    }
    local v22 = {
        uIStroke = createElement("UIStroke", {Color = v13, Thickness = v12, Transparency = v9}),
        uICorner = createElement("UICorner"),
    }
    v22.locked = createElement("Frame", {
        BorderSizePixel = 0,
        Active = false,
        ZIndex = 5,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        BackgroundTransparency = v15(0.4),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(1, 1),
        Visible = v16:map(function(a1) -- Line: 281
            return a1 < 1
        end),
    }, {
        list = createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical,
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            VerticalAlignment = Enum.VerticalAlignment.Center,
            SortOrder = Enum.SortOrder.LayoutOrder,
            Padding = UDim.new(0, 10),
        }),
        lock = createElement("ImageLabel", {
            Image = "rbxassetid://1197061307",
            BackgroundTransparency = 1,
            LayoutOrder = 1,
            ZIndex = 10,
            ImageTransparency = v15(0),
            ScaleType = Enum.ScaleType.Fit,
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BorderColor3 = Color3.fromRGB(27, 42, 53),
            Position = UDim2.fromScale(0.5, 0.35),
            Size = UDim2.fromScale(0.4, 0.4),
        }, {uIAspectRatioConstraint1 = createElement("UIAspectRatioConstraint")}),
        textLabel = createElement("TextLabel", {
            Text = "Purchase \"Admin Gamepass\" to unlock!",
            TextScaled = true,
            TextSize = 14,
            TextWrapped = true,
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            LayoutOrder = 2,
            FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
            TextColor3 = Color3.fromRGB(153, 153, 153),
            TextTransparency = v15(0.4),
            AnchorPoint = Vector2.new(0.5, 1),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            Position = UDim2.fromScale(0.5, 1),
            Size = UDim2.fromScale(1, 0.3),
        }, {uIStroke = createElement("UIStroke", {Thickness = 4, Transparency = v15(0.8)})}),
    })
    local v23 = {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Selectable = false,
        ZIndex = 1,
        Size = v10:map(function(a1) -- Line: 340
            return UDim2.fromScale(1.2 + a1 * 0.15, 1.2 + a1 * 0.15)
        end),
        AnchorPoint = Vector2.new(0.5, 0.5),
    }
    v23.Image = not (typeof(v1) ~= "string") and v1 or ("rbxassetid://%*"):format(v1)
    v23.ImageColor3 = v14
    v23.ScaleType = Enum.ScaleType.Crop
    v23.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    v23.BorderColor3 = Color3.fromRGB(0, 0, 0)
    v23.Position = u84:map(function(a1) -- Line: 355
        return UDim2.new(0.5, a1.X * 0.6, 0.5, a1.Y * 0.6)
    end)
    v22.background = createElement("ImageLabel", v23)
    v22.icon = createElement("ImageLabel", {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ZIndex = 2,
        Image = not (typeof(v2) ~= "string") and v2 or ("rbxassetid://%*"):format(v2),
        ScaleType = Enum.ScaleType.Fit,
        AnchorPoint = Vector2.new(0.5, 0.4),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Size = v10:map(function(a1) -- Line: 373
            return UDim2.fromScale(2 + a1 * 0.15, 2 + a1 * 0.15)
        end),
        Position = u84:map(function(a1) -- Line: 377
            return UDim2.new(0.5, a1.X, 0.5, a1.Y)
        end),
    })
    v22.title = createElement("Frame", {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ZIndex = 5,
        AnchorPoint = Vector2.new(0.5, 1),
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.5, 1),
        Size = UDim2.fromScale(1, 0.25),
    }, {
        background = createElement("ImageLabel", {
            Image = "rbxassetid://18850792444",
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            ZIndex = 5,
            ImageColor3 = Color3.fromRGB(15, 17, 20),
            ImageTransparency = v10:map(function(a1) -- Line: 396
                return 1 - 0.7 * a1
            end),
            ScaleType = Enum.ScaleType.Slice,
            SliceCenter = Rect.new(8, 0, 56, 56),
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.fromRGB(0, 0, 0),
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            Position = v10:map(function(a1) -- Line: 406
                return UDim2.fromScale(0.5, 0.5 + (1 - a1))
            end),
            Size = UDim2.fromScale(1, 1),
        }),
        textLabel = createElement("TextLabel", {
            TextScaled = true,
            TextWrapped = true,
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            ZIndex = 6,
            FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.ExtraBold, Enum.FontStyle.Normal),
            Text = v3,
            TextColor3 = Color3.fromRGB(255, 255, 255),
            TextXAlignment = Enum.TextXAlignment.Left,
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.fromRGB(0, 0, 0),
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromScale(1, 1),
        }, {
            uIStroke1 = createElement("UIStroke", {Thickness = 4, Color = Color3.fromRGB(102, 102, 102)}, {
                uIGradient = createElement("UIGradient", {
                    Rotation = 90,
                    Color = ColorSequence.new({
                        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
                        (ColorSequenceKeypoint.new(1, Color3.fromRGB(40, 40, 40))),
                    }),
                }),
            }),
            uIPadding = createElement("UIPadding", {
                PaddingBottom = UDim.new(0.1, 0),
                PaddingLeft = UDim.new(0, 25),
                PaddingRight = UDim.new(0, 25),
                PaddingTop = UDim.new(0.1, 0),
            }),
        }),
    })
    v20.innerContent = createElement("CanvasGroup", v21, v22)
    v20.dropShadow = createElement("ImageLabel", {
        Image = "rbxassetid://9239716855",
        BackgroundTransparency = 1,
        ZIndex = -1,
        ImageTransparency = v8:map(function(a1) -- Line: 458
            return 1 - 0.8 * a1
        end),
        ScaleType = Enum.ScaleType.Slice,
        SliceCenter = Rect.new(14, 14, 64, 24),
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(27, 42, 53),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.new(1, 14, 1, 14),
    })
    v18.content = createElement("TextButton", v19, v20)
    return (createElement("Frame", v17, v18))
end