-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.PVP.PVPTowerInventoryHeader
-- Decompile time: 3.46 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactFlow = require(ReplicatedStorage.Packages.ReactFlow)
require(ReplicatedStorage.Shared.UI.ReactTypes)
local useSound = require(ReplicatedStorage.Client.Interfaces.Hooks.useSound)
local useSpring = ReactFlow.useSpring
local useTween = ReactFlow.useTween
local createElement = React.createElement
local memo = React.memo
local useRef = React.useRef
local useEffect = React.useEffect
return memo(function(a1) -- Line: 33
    -- upvalues: useSound (val), useRef (val), useSpring (val), useTween (val), useEffect (val), createElement (val)
    local timer = a1.timer
    local title = a1.title
    local color = a1.color
    local u6 = a1.Visible ~= false
    local Timer = useSound("Timer")
    local u13 = useRef(title)
    local u16 = useRef(0)
    local v1, u20 = useSpring({start = 0, target = 0, damper = 1, speed = 8})
    local v2, u24 = useSpring({start = 0, target = 0, damper = 0.6, speed = 10})
    local v3, u28 = useSpring({start = 0, target = 0, damper = 0.6, speed = 10})
    local v4, u37 = useTween({
        start = 0,
        target = 0,
        info = TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out),
    })
    local v5 = {u6}
    useEffect(function() -- Line: 67 -- upvalues: u6 (val), u37 (val)
        if not u6 then
            return
        end
        local u1 = true
        local u4 = task.spawn(function() -- Line: 73 -- upvalues: u1 (ref), u37 (upval)
            local v1 = 0
            while u1 do
                task.wait(1)
                u37({target = v1})
                v1 = v1 + 180
            end
        end)
        return function() -- Line: 86 -- upvalues: u1 (ref), u4 (val)
            u1 = false
            task.cancel(u4)
        end
    end, v5)
    v5 = {title}
    useEffect(function() -- Line: 92 -- upvalues: u13 (val), title (val), u28 (val)
        local current = u13.current
        u13.current = title
        if current == title then
            return
        end
        u28({force = 200})
    end, v5)
    v5 = {BackgroundTransparency = 1, BorderSizePixel = 0, LayoutOrder = 2, ZIndex = 2}
    local AnchorPoint = a1.AnchorPoint or Vector2.new(0, 1)
    v5.AnchorPoint = AnchorPoint
    local Position = a1.Position or UDim2.fromScale(0, -0.01)
    v5.Position = Position
    local Size = a1.Size or UDim2.fromScale(1, 0.1)
    v5.Size = Size
    local v6 = {}
    local v7 = {
        BackgroundTransparency = 1,
        TextScaled = true,
        Size = UDim2.fromScale(1, 0.5),
        Position = v3:map(function(a1) -- Line: 119
            return UDim2.new(1, 0, 0.5, -a1)
        end),
        AnchorPoint = Vector2.new(1, 0.5),
        Text = title,
        TextColor3 = color,
    }
    v7.TextXAlignment = timer and Enum.TextXAlignment.Left or Enum.TextXAlignment.Center
    v7.TextYAlignment = Enum.TextYAlignment.Bottom
    v7.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.ExtraBold, Enum.FontStyle.Normal)
    v6.title = createElement("TextLabel", v7, {
        stroke = createElement("UIStroke", {Thickness = 2, Transparency = 0.5, Color = Color3.new(0, 0, 0)}),
        gradient = createElement("UIGradient", {
            Rotation = 90,
            Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
                ColorSequenceKeypoint.new(0.6, Color3.fromRGB(255, 255, 255)),
                ColorSequenceKeypoint.new(0.601, Color3.fromRGB(235, 235, 235)),
                (ColorSequenceKeypoint.new(1, Color3.fromRGB(235, 235, 235))),
            }),
        }),
    })
    v6.timer = timer and createElement("TextLabel", {
        BackgroundTransparency = 1,
        TextScaled = true,
        Size = UDim2.new(0, 100, 0.5, 0),
        Position = v2:map(function(a1) -- Line: 158
            return UDim2.new(0.97, 0, 0.5, -a1)
        end),
        AnchorPoint = Vector2.new(1, 0.5),
        Text = timer:map(function(a1) -- Line: 165 -- upvalues: u16 (val), Timer (val), u20 (val), u24 (val)
            local v1 = math.floor(a1)
            local current = u16.current
            u16.current = v1
            if current ~= v1 and a1 <= 6 then
                Timer()
                u20({force = 18})
                u24({force = 200})
            end
            return string.format("%02d:%02d", a1 / 60, a1 % 60)
        end),
        TextColor3 = v1:map(function(a1) -- Line: 185
            return (Color3.new(1, 1, 1)):Lerp(Color3.new(1, 0, 0), (math.min(1, a1)))
        end),
        TextXAlignment = Enum.TextXAlignment.Right,
        TextYAlignment = Enum.TextYAlignment.Center,
        FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.ExtraBold, Enum.FontStyle.Normal),
    }, {
        stroke = createElement("UIStroke", {Thickness = 2, Transparency = 0.5, Color = Color3.new(0, 0, 0)}),
    })
    v6.icon = timer and createElement("ImageLabel", {
        BackgroundTransparency = 1,
        Image = "rbxassetid://5577896365",
        AnchorPoint = Vector2.new(0.8, 0.5),
        Position = UDim2.fromScale(1, 0.5),
        Size = UDim2.fromScale(0.5, 0.5),
        SizeConstraint = Enum.SizeConstraint.RelativeYY,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        ScaleType = Enum.ScaleType.Fit,
        Rotation = v4,
    })
    return createElement("Frame", v5, v6, a1.children)
end)