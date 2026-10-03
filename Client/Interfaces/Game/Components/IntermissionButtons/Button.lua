-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.IntermissionButtons.Button
-- Decompile time: 2.58 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local React = require(ReplicatedStorage.Shared.UI.React)
local createElement = React.createElement
local useEffect = React.useEffect
local useState = React.useState
local useSpring = require(ReplicatedStorage.Client.Interfaces.Hooks.useSpring)
local Sound = require(ReplicatedStorage.Client.Modules.LegacyInterfaces.Components.Sound)
return function(a1) -- Line: 13
    -- upvalues: useSpring (val), useState (val), useEffect (val), RunService (val), createElement (val), React (val)
    -- upvalues: Sound (val)
    local v1, u7 = useSpring(a1.ButtonColor, 1, 40, true)
    local v2, u14 = useSpring(1, 0.6, 40, true)
    local u24 = a1.ButtonColor:Lerp(Color3.new(0, 0, 0), 0.2)
    local u34 = a1.ButtonColor:Lerp(Color3.new(1, 1, 1), 0.2)
    local Disabled = if a1.Disabled == nil then false else a1.Disabled
    local u40, u41 = useState(false)
    local u44, u45 = useState(nil)
    local v3 = {Disabled}
    useEffect(function() -- Line: 25 -- upvalues: Disabled (val), u7 (val), u14 (val), a1 (val)
        if Disabled then
            u7(Color3.new(0.5, 0.5, 0.5))
            u14(1)
            return
        end
        u7(a1.ButtonColor)
        u14(1)
    end, v3)
    v3 = {u40, u44}
    useEffect(function() -- Line: 35 -- upvalues: u40 (val), RunService (upval), u44 (val), u41 (val)
        if not u40 then
            return
        end
        local u6 = RunService.Heartbeat:Connect(function() -- Line: 37 -- upvalues: u44 (upval), u41 (upval)
            if 0.2 <= tick() - u44 then
                u41(false)
            end
        end)
        return function() -- Line: 43 -- upvalues: u6 (val)
            if u6.Connected then
                u6:Disconnect()
            end
        end
    end, v3)
    local v4 = createElement
    v3 = {
        Image = "rbxassetid://8429088937",
        ImageColor3 = v1,
        ScaleType = Enum.ScaleType.Slice,
        SliceCenter = Rect.new(8, 8, 152, 32),
        AnchorPoint = a1.AnchorPoint,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BackgroundTransparency = 1,
        LayoutOrder = a1.LayoutOrder,
        Position = a1.Position,
        Size = a1.Size,
    }

    v3[React.Event.MouseEnter] = function() -- Line: 63 -- upvalues: Disabled (val), u7 (val), u34 (val), u14 (val)
        if Disabled then
            return
        end
        u7(u34)
        u14(1.1)
    end

    v3[React.Event.MouseLeave] = function() -- Line: 72 -- upvalues: Disabled (val), u7 (val), a1 (val), u14 (val)
        if Disabled then
            return
        end
        u7(a1.ButtonColor)
        u14(1)
    end

    v3[React.Event.MouseButton1Down] = function() -- Line: 81 -- upvalues: Disabled (val), u7 (val), u24 (val), u14 (val)
        if Disabled then
            return
        end
        u7(u24)
        u14(0.9)
    end

    v3[React.Event.MouseButton1Up] = function() -- Line: 90 -- upvalues: Disabled (val), u7 (val), a1 (val), u14 (val), Sound (upval)
        if Disabled then
            return
        end
        u7(a1.ButtonColor)
        u14(1)
        Sound("Click"):Play()
    end

    v3[React.Event.Activated] = function() -- Line: 100 -- upvalues: Disabled (val), u40 (val), u45 (val), u41 (val), a1 (val)
        if not Disabled and not u40 then
            u45(tick())
            u41(true)
            if a1.OnClick then
                a1.OnClick()
            end
            return
        end
    end

    return v4("ImageButton", v3, {
        value = createElement("TextLabel", {
            BackgroundTransparency = 1,
            LayoutOrder = 1,
            FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
            Text = a1.Title,
            TextColor3 = Color3.fromRGB(255, 255, 255),
            TextSize = a1.TextSize,
            AnchorPoint = Vector2.new(0.5, 0.5),
            AutomaticSize = Enum.AutomaticSize.X,
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            Position = UDim2.fromScale(0.625, 0.5),
            Size = UDim2.fromScale(0, 0.5),
        }, {
            stroke = createElement("UIStroke", {Thickness = 2, Transparency = 0.5, LineJoinMode = Enum.LineJoinMode.Miter}),
        }),
        icon = createElement("ImageLabel", {
            BackgroundTransparency = 1,
            Image = a1.Icon,
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            Position = UDim2.fromScale(0.075, 0.5),
            Size = UDim2.fromOffset(24, 24),
            SizeConstraint = Enum.SizeConstraint.RelativeYY,
        }),
        padding = createElement("UIPadding", {PaddingLeft = UDim.new(0, 16), PaddingRight = UDim.new(0, 16)}),
        scale = createElement("UIScale", {Scale = v2}),
    })
end