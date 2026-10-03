-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.Login.LoginReward
-- Decompile time: 4.53 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local Sound = require(ReplicatedStorage.Client.Modules.LegacyInterfaces.Components.Sound)
local useConfetti = require(ReplicatedStorage.Client.Interfaces.Hooks.useConfetti)
local useScale = require(ReplicatedStorage.Client.Interfaces.Hooks.useScale)
local useSpring = require(ReplicatedStorage.Client.Interfaces.Hooks.useSpring)
local createElement = React.createElement
local useBinding = React.useBinding
local useEffect = React.useEffect
local useRef = React.useRef
local Event = React.Event
local u40 = {}
u40[1] = {
    Amount = 40,
    Lifetime = 1,
    Force = 20,
    Radius = 5,
    Direction = Vector2.new(-0.9, 0),
}
return function(a1) -- Line: 42
    -- upvalues: useScale (val), useSpring (val), useBinding (val), useRef (val), useConfetti (val), u40 (val)
    -- upvalues: useEffect (val), Sound (val), createElement (val), Event (val)
    local color = a1.color or Color3.fromRGB(255, 170, 0)
    local u10 = a1.claimed == true
    local u14 = a1.current == true
    local day = a1.day
    local amount = a1.amount
    local disabled = a1.disabled
    local icon = a1.icon
    local textColor = a1.textColor
    local u23 = useScale(1)
    local v1, u30 = useSpring(1, 0.7, 30, true)
    local InnerPosition = a1.InnerPosition or useBinding(0)
    local u40_2 = useRef(u10)
    local u42 = useRef()
    local u45, u46 = useConfetti(u40)
    if u14 then
        color = Color3.fromRGB(85, 255, 127)
    end
    if disabled or u10 then
        color = Color3.fromRGB(150, 150, 150)
        textColor = Color3.fromRGB(255, 255, 255)
    end
    local v2 = {u10}
    useEffect(function() -- Line: 70 -- upvalues: u40_2 (val), u10 (val), u14 (val), u46 (val), Sound (upval)
        local current = u40_2.current
        u40_2.current = u10
        if u14 and u10 then
            if current ~= false then
                return
            end
            u46()
            Sound("Obtain"):Play()
            return
        end
    end, v2)
    v2 = {u45, u42}
    useEffect(function() -- Line: 87 -- upvalues: u45 (val), u42 (val)
        if u45.current and u42.current then
            u45.current.Parent = u42.current
            return
        end
    end, v2)
    v2 = {BackgroundTransparency = 1}
    local Size = a1.Size or UDim2.fromOffset(112, 112)
    v2.Size = Size
    v2.Position = a1.Position
    v2.AnchorPoint = a1.AnchorPoint
    v2.LayoutOrder = a1.LayoutOrder
    v2.ref = u42
    local v3 = {}
    local v4 = {
        BackgroundTransparency = 1,
        ClipsDescendants = true,
        Size = UDim2.fromScale(1, 1),
        Position = UDim2.fromScale(0.5, 0.5),
        AnchorPoint = Vector2.new(0.5, 0.5),
    }
    local v5 = {
        uIScale = createElement("UIScale", {
            Scale = v1:map(function(a1) -- Line: 111 -- upvalues: u14 (val)
                return (if not u14 then 1 else 1.15) * a1
            end),
        }),
    }
    local v6 = {
        Text = "",
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        BackgroundTransparency = 0.2,
        Selectable = false,
        Size = UDim2.new(1, -20, 1, -20),
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = InnerPosition:map(function(a1) -- Line: 125
            return UDim2.fromScale(0.5, 0.5 + a1)
        end),
    }

    v6[Event.MouseEnter] = function() -- Line: 129 -- upvalues: u30 (val), u23 (val)
        u30(1 + 0.1 * u23)
    end

    v6[Event.MouseLeave] = function() -- Line: 133 -- upvalues: u30 (val)
        u30(1)
    end

    local v7 = {
        icon = createElement("ImageLabel", {
            BackgroundTransparency = 1,
            Image = if typeof(icon) ~= "number" then icon else ("rbxassetid://%*"):format(icon),
            SliceCenter = Rect.new(16, 16, 16, 16),
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            Position = UDim2.new(0.5, 0, 0.5, 12),
            Size = UDim2.fromScale(0.7, 0.7),
        }, {
            ratio = createElement("UIAspectRatioConstraint"),
            value = amount and createElement("TextLabel", {
                TextScaled = true,
                TextSize = 14,
                TextWrapped = true,
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.ExtraBold, Enum.FontStyle.Normal),
                Text = ("x%*"):format(amount),
                TextColor3 = Color3.fromRGB(255, 255, 255),
                AutomaticSize = Enum.AutomaticSize.X,
                AnchorPoint = Vector2.new(1, 1),
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                BorderColor3 = Color3.fromRGB(0, 0, 0),
                Position = UDim2.fromScale(1.1, 0.92),
                Size = UDim2.fromScale(0, 0.23),
            }, {uIStroke = createElement("UIStroke", {Thickness = 2})}),
        }),
    }
    local v8 = {Thickness = 2, ApplyStrokeMode = Enum.ApplyStrokeMode.Border}
    v8.Color = u14 and Color3.fromRGB(255, 255, 255) or color
    v8.LineJoinMode = Enum.LineJoinMode.Bevel
    v7.uIStroke = createElement("UIStroke", v8)
    v7.textLabel = createElement("TextLabel", {
        TextSize = 22,
        TextWrapped = true,
        BorderSizePixel = 0,
        FontFace = Font.new("rbxassetid://11702779517", Enum.FontWeight.ExtraBold, Enum.FontStyle.Normal),
        Text = ("Day %*"):format(day),
        TextColor3 = textColor or Color3.fromRGB(0, 0, 0),
        BackgroundColor3 = color,
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Size = UDim2.new(1, 0, 0, 24),
    })
    v7.light = createElement("ImageButton", {
        Image = "rbxassetid://13772117423",
        ImageTransparency = 0.3,
        Active = false,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Selectable = false,
        ZIndex = -1,
        ImageColor3 = color,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(1, 1),
    }, {
        uIGradient = createElement("UIGradient", {
            Rotation = -90,
            Transparency = NumberSequence.new({
                NumberSequenceKeypoint.new(0, 0),
                NumberSequenceKeypoint.new(0.222, 0.412),
                NumberSequenceKeypoint.new(0.579, 0.85),
                (NumberSequenceKeypoint.new(1, 1)),
            }),
        }),
    })
    v7.check = createElement("ImageLabel", {
        Image = "rbxassetid://12289762618",
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ZIndex = 4,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.new(0.5, 0, 0.5, 12),
        Size = UDim2.fromScale(0.5, 0.5),
        Visible = u10,
    })
    v5.content = createElement("TextButton", v6, v7)
    v3.content = createElement("Frame", v4, v5)
    return createElement("Frame", v2, v3)
end