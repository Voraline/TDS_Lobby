-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.TimescaleButton
-- Decompile time: 5.35 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local u5 = {
    normal = "rbxassetid://17409380232",
    paused = "rbxassetid://17409412937",
    fast = "rbxassetid://17409380135",
    locked = "rbxassetid://17409380232",
}
local u6 = {}
u6.unpaused = {button = Color3.fromRGB(69, 235, 94), stroke = Color3.fromRGB(99, 255, 198)}
u6.paused = {button = Color3.fromRGB(255, 200, 0), stroke = Color3.fromRGB(255, 215, 71)}
local React = require(ReplicatedStorage.Shared.UI.React)
local createElement = React.createElement
local useCallback = React.useCallback

local function grayscale(a1) -- Line: 36 -- types: a1: userdata
    local R = a1.R
    local G = a1.G
    local B = a1.B
    local v1 = R * 0.299 + G * 0.587 + B * 0.114
    return Color3.new(v1, v1, v1)
end

local function darken(a1, a2) -- Line: 42 -- types: a1: userdata, a2: number
    return a1:Lerp(Color3.new(0, 0, 0), a2)
end

return function(a1) -- Line: 46
    -- upvalues: useCallback (val), darken (val), u6 (val), createElement (val), React (val), u5 (val)
    local v1 = useCallback
    local v2 = {a1.state}
    v1 = v1(function(a1_2) -- Line: 47 -- upvalues: a1 (val), darken (upval) -- types: a1_2: userdata
        if a1.state ~= "locked" then
            return a1_2
        end
        local v1 = darken
        local R = a1_2.R
        local G = a1_2.G
        local B = a1_2.B
        local v2 = R * 0.299 + G * 0.587 + B * 0.114
        return v1(Color3.new(v2, v2, v2), 0.5)
    end, v2)
    local v3 = u6[if a1.state ~= "paused" then "unpaused" else "paused"]
    local v4 = {}
    local Size = a1.Size or UDim2.fromOffset(52, 52)
    v4.Size = Size
    v4.Position = a1.Position
    v4.AnchorPoint = Vector2.new(1, 0.5)
    v4.BackgroundColor3 = v1(v3.button)
    v4.BackgroundTransparency = 0.25
    v4[React.Event.MouseButton1Click] = a1.onClick
    local v5 = {
        Children = React.createElement(React.Fragment, {}, a1.children or {}),
        Corner = createElement("UICorner", {CornerRadius = UDim.new(0, 4)}),
        Stroke = createElement("UIStroke", {Thickness = 3, Color = v1(v3.stroke)}, {
            Gradient = createElement("UIGradient", {
                Rotation = 45,
                Transparency = NumberSequence.new({
                    NumberSequenceKeypoint.new(0, 0),
                    NumberSequenceKeypoint.new(0.2, 0.75),
                    NumberSequenceKeypoint.new(0.5, 1),
                    NumberSequenceKeypoint.new(0.8, 0.75),
                    (NumberSequenceKeypoint.new(1, 0)),
                }),
            }),
        }),
        Icon = createElement("ImageLabel", {
            BackgroundTransparency = 1,
            Size = UDim2.fromOffset(32, 32),
            Position = UDim2.fromScale(0.5, 0.5),
            AnchorPoint = Vector2.new(0.5, 0.5),
            Image = u5[a1.state],
            ImageColor3 = v1(Color3.fromRGB(255, 255, 255)),
        }),
    }
    local v6 = false
    if a1.state == "locked" then
        v6 = createElement("ImageLabel", {
            BackgroundTransparency = 1,
            Image = "rbxassetid://1197061307",
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromOffset(4, 4),
            Size = UDim2.fromOffset(24, 24),
        })
    end
    v5.Lock = v6
    v5.Speed = createElement("TextLabel", {
        BackgroundTransparency = 1,
        TextSize = 18,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 1),
        Size = UDim2.fromOffset(18, 18),
        FontFace = Font.fromName("GothamSSm", Enum.FontWeight.Bold),
        Text = ("x%*"):format(a1.speed),
        TextColor3 = v1(Color3.fromRGB(255, 255, 255)),
    }, {
        Stroke = createElement("UIStroke", {Thickness = 3, Transparency = 0.5, Color = Color3.fromRGB(0, 0, 0)}),
    })
    return createElement("ImageButton", v4, v5)
end