-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.News.NewsButton
-- Decompile time: 3.84 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Hooks = ReplicatedStorage.Client.Interfaces.Hooks
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactFlow = require(ReplicatedStorage.Packages.ReactFlow)
local useScale = require(Hooks.useScale)
local useSound = require(Hooks.useSound)
local useSpring = require(Hooks.useSpring)
local createElement = React.createElement
local useBinding = React.useBinding
local useEffect = React.useEffect
local useRef = React.useRef
local memo = React.memo
local u40 = Color3.fromRGB(80, 255, 86)
return memo(function(a1) -- Line: 35
    -- upvalues: u40 (val), useSound (val), useSpring (val), ReactFlow (val), useBinding (val), useRef (val)
    -- upvalues: useScale (val), useEffect (val), RunService (val), createElement (val), React (val)
    local u3 = a1.Visible ~= false
    local Color = a1.Color or a1.BackgroundColor3 or u40
    local v1 = Color:Lerp(Color3.new(1, 1, 1), 0.25)
    local v2 = Color:Lerp(Color3.new(0, 0, 0), 0.7)
    local Click = useSound("Click")
    local v3, u36 = useSpring(1, 0.6, 40, true)
    local v4, u43 = useSpring(0, 0.8, 20, true)
    local v5 = v4:map(function(a1) -- Line: 45
        return 1 - a1
    end)
    local v6, u52 = ReactFlow.useSpring({speed = 2, damper = 0.5, start = 2, target = 6})
    local u55, u56 = useBinding(false)
    local u60 = useRef(tick())
    local u63 = useScale(1)
    local v7 = {u3}
    useEffect(function() -- Line: 60 -- upvalues: u3 (val), RunService (upval), u60 (val), u52 (val)
        if not u3 then
            return
        end
        local u6 = RunService.RenderStepped:Connect(function() -- Line: 65 -- upvalues: u60 (upval), u52 (upval)
            if 4 < tick() - u60.current then
                u60.current = tick()
                u52({force = 5})
            end
        end)
        return function() -- Line: 73 -- upvalues: u6 (val)
            u6:Disconnect()
        end
    end, v7)
    v7 = {u3}
    useEffect(function() -- Line: 78 -- upvalues: u43 (val), u3 (val)
        u43(if not u3 then 0 else 1)
    end, v7)
    v7 = {BackgroundTransparency = 1, LayoutOrder = a1.LayoutOrder}
    local Size = a1.Size or UDim2.new(0.6, 0, 0, 75)
    v7.Size = Size
    local AnchorPoint = a1.AnchorPoint or Vector2.new(0.5, 1)
    v7.AnchorPoint = AnchorPoint
    local Position = a1.Position or UDim2.new(0.5, 0, 1, -105)
    v7.Position = Position
    v7.ZIndex = a1.ZIndex
    v7.Visible = v4:map(function(a1) -- Line: 89
        return a1 > 0.01
    end)
    local v8 = {}
    local v9 = a1.children and createElement(React.Fragment, {}, a1.children) or nil
    v8.children = v9
    local v10 = {
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color,
        BorderColor3 = v2,
        ImageColor3 = v1,
        ScaleType = Enum.ScaleType.Tile,
        Selectable = true,
        TileSize = UDim2.fromOffset(45, 45),
        BackgroundTransparency = v5,
        Size = UDim2.fromScale(1, 1),
        ZIndex = a1.ZIndex,
        Position = v5:map(function(a1) -- Line: 107
            return (UDim2.new(0.5, 0, 0.5, 0)) + UDim2.new(0, 0, 0, 40 * a1)
        end),
    }

    v10[React.Event.MouseButton1Down] = function() -- Line: 111 -- upvalues: u36 (val), u63 (val)
        u36(1 - 0.1 * u63)
    end

    v10[React.Event.MouseButton1Up] = function() -- Line: 115 -- upvalues: u36 (val), u55 (val), u63 (val), Click (val), a1 (val)
        u36(u55:getValue() and 1 + 0.1 * u63 or 1)
        Click()
        if a1.Clicked then
            a1.Clicked()
        end
    end

    v10[React.Event.MouseEnter] = function() -- Line: 124 -- upvalues: u36 (val), u63 (val), u56 (val)
        u36(1 + 0.1 * u63)
        u56(true)
    end

    v10[React.Event.MouseLeave] = function() -- Line: 128 -- upvalues: u36 (val), u56 (val)
        u36(1)
        u56(false)
    end

    v8.content = createElement("ImageButton", v10, {
        scale = createElement("UIScale", {
            Scale = v3:map(function(a1) -- Line: 134
                return a1 * 0.7
            end),
        }),
        uICorner = createElement("UICorner", {CornerRadius = UDim.new(0, 4)}),
        dropShadow = createElement("ImageLabel", {
            BackgroundTransparency = 1,
            Image = "rbxassetid://18610113607",
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BorderColor3 = v2,
            ImageColor3 = Color,
            ImageTransparency = v5,
            Position = UDim2.fromScale(0.5, 0.5),
            ScaleType = Enum.ScaleType.Slice,
            Size = UDim2.new(1, 16, 1, 16),
            SliceCenter = Rect.new(8, 8, 54, 54),
            Visible = u55:map(function(a1) -- Line: 155
                return a1
            end),
            ZIndex = (a1.ZIndex or 0) - 1,
        }),
        uIGradient = createElement("UIGradient", {
            Rotation = 90,
            Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
                (ColorSequenceKeypoint.new(1, Color3.fromRGB(130, 130, 130))),
            }),
        }),
        uIStroke1 = createElement("UIStroke", {
            Color = Color3.fromRGB(255, 255, 255),
            Transparency = v5,
            Thickness = React.joinBindings({v4, v6}):map(function(a1) -- Line: 173
                return a1[2] * a1[1] * 2
            end),
        }),
        textLabel1 = createElement("TextLabel", {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            TextScaled = true,
            TextSize = 14,
            TextWrapped = true,
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromScale(0.8, 0.5),
            Text = if a1.Text == nil then "" else a1.Text,
            TextColor3 = Color3.fromRGB(255, 255, 255),
            TextTransparency = v5,
            ZIndex = a1.ZIndex,
        }, {
            uIStroke2 = createElement("UIStroke", {
                Thickness = 3,
                Color = v2,
                LineJoinMode = Enum.LineJoinMode.Bevel,
                Transparency = v5,
            }),
        }),
    })
    return createElement("Frame", v7, v8)
end)