-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.QuestWindow.PinButton
-- Decompile time: 2.68 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local StudioElements = require(script.Parent.StudioElements)
local useSpring = require(ReplicatedStorage.Client.Interfaces.Hooks.useSpring)
local createElement = React.createElement
local Event = React.Event
local useRef = React.useRef
local scaledStroke = StudioElements.scaledStroke
local u59 = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(7, 7, 7)),
    ColorSequenceKeypoint.new(0.35, Color3.fromRGB(33, 33, 33)),
    ColorSequenceKeypoint.new(0.6, Color3.fromRGB(33, 33, 33)),
    (ColorSequenceKeypoint.new(1, Color3.fromRGB(7, 7, 7))),
})
return function(a1) -- Line: 31
    -- upvalues: useSpring (val), useRef (val), createElement (val), Event (val), u59 (val), scaledStroke (val)
    local v1, u7 = useSpring(1, 0.6, 30, true)
    local u10 = useRef(false)
    local v2 = a1.Disabled == true
    local v3 = a1.ZIndex or 5
    local Size = a1.Size or UDim2.fromOffset(32, 32)
    local v4 = {}
    local AnchorPoint = a1.AnchorPoint or Vector2.new(1, 0)
    v4.AnchorPoint = AnchorPoint
    v4.AutoButtonColor = false
    v4.Active = not v2
    v4.BackgroundTransparency = 1
    v4.BorderSizePixel = 0
    v4.Position = a1.Position
    v4.Size = UDim2.new(Size.X.Scale, Size.X.Offset + 24, Size.Y.Scale, Size.Y.Offset + 24)
    v4.Selectable = not v2
    v4.Text = ""
    v4.ZIndex = v3
    local Activated = Event.Activated
    v4[Activated] = if not v2 then a1.OnActivated else nil
    local MouseButton1Down = Event.MouseButton1Down
    v4[MouseButton1Down] = if not v2 then function() -- Line: 58 -- upvalues: u7 (val)
        u7(0.85)
    end else nil
    local MouseButton1Up = Event.MouseButton1Up
    v4[MouseButton1Up] = if not v2 then function() -- Line: 63 -- upvalues: u7 (val), u10 (val)
        u7(if not u10.current then 1 else 1.15)
    end else nil
    local MouseEnter = Event.MouseEnter
    v4[MouseEnter] = if not v2 then function() -- Line: 68 -- upvalues: u10 (val), u7 (val)
        u10.current = true
        u7(1.15)
    end else nil
    local MouseLeave = Event.MouseLeave
    v4[MouseLeave] = if not v2 then function() -- Line: 74 -- upvalues: u10 (val), u7 (val)
        u10.current = false
        u7(1)
    end else nil
    local v5 = {}
    local v6 = {
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.new(1, -24, 1, -24),
        ZIndex = v3 + 1,
    }
    local v7 = {
        Scale = createElement("UIScale", {Scale = v1}),
        Corner = createElement("UICorner", {CornerRadius = UDim.new(0.2, 0)}),
        Gradient = createElement("UIGradient", {Rotation = 90, Color = u59}),
        BlackStroke = scaledStroke({Thickness = 0.03, Color = Color3.fromRGB(0, 0, 0)}),
        GrayStroke = scaledStroke({Thickness = 0.01, Transparency = 0, Color = Color3.fromRGB(191, 191, 191)}),
    }
    local v8 = {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Image = "rbxassetid://88075573899396",
        AnchorPoint = Vector2.new(0.5, 0.5),
    }
    local v9 = if not a1.IsPinned then Color3.fromRGB(255, 255, 255) else Color3.fromRGB(255, 166, 0)
    v8.ImageColor3 = v9
    v8.ImageTransparency = if not v2 then 0 else 0.5
    v8.Position = UDim2.fromScale(0.5, 0.5)
    v8.ScaleType = Enum.ScaleType.Fit
    v8.Size = UDim2.fromScale(0.686, 0.686)
    v8.ZIndex = v3 + 2
    v7.Icon = createElement("ImageLabel", v8)
    v5.Visual = createElement("Frame", v6, v7)
    return createElement("TextButton", v4, v5)
end