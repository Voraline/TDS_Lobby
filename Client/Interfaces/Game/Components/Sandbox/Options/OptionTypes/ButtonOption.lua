-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.Sandbox.Options.OptionTypes.ButtonOption
-- Decompile time: 1.61 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local useSound = require(ReplicatedStorage.Client.Interfaces.Hooks.useSound)
local useSpring = require(ReplicatedStorage.Client.Interfaces.Hooks.useSpring)
local createElement = React.createElement
return function(a1) -- Line: 17
    -- upvalues: useSpring (val), React (val), useSound (val), createElement (val)
    local v1, u7 = useSpring(0, 1, 40, true)
    local v2, u14 = useSpring(0, 1, 40, true)
    local v3 = React.joinBindings({v1, v2})
    local HoverHotbar = useSound("HoverHotbar")
    local Click = useSound("Click")
    local v4 = {
        Image = a1.icon,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
    }
    local iconColor = a1.iconColor or Color3.fromRGB(255, 255, 255)
    v4.ImageColor3 = iconColor
    v4.ImageTransparency = a1.iconTransparency or 0
    local color = a1.color or Color3.fromRGB(24, 24, 24)
    v4.BackgroundColor3 = color
    v4.ScaleType = Enum.ScaleType.Fit
    v4.Size = UDim2.fromOffset(100, 20)

    v4[React.Event.MouseEnter] = function() -- Line: 36 -- upvalues: HoverHotbar (val), u7 (val)
        HoverHotbar()
        u7(1)
    end

    v4[React.Event.MouseLeave] = function() -- Line: 40 -- upvalues: HoverHotbar (val), u7 (val)
        HoverHotbar()
        u7(0)
    end

    v4[React.Event.MouseButton1Down] = function() -- Line: 44 -- upvalues: u14 (val)
        u14(1)
    end

    v4[React.Event.MouseButton1Up] = function() -- Line: 47 -- upvalues: u14 (val)
        u14(0)
    end

    v4[React.Event.Activated] = function() -- Line: 50 -- upvalues: Click (val), a1 (val)
        Click()
        a1.activate()
    end

    return createElement("ImageButton", v4, {
        scale = createElement("UIScale", {
            Scale = v3:map(function(a1) -- Line: 56
                return 1 + a1[1] * (1 - a1[2]) * 0.1 - a1[2] * 0.1
            end),
        }),
        uICorner = createElement("UICorner"),
        uIGradient = createElement("UIGradient", {
            Rotation = 90,
            Transparency = NumberSequence.new({
                NumberSequenceKeypoint.new(0, 0),
                NumberSequenceKeypoint.new(0.2, 0),
                (NumberSequenceKeypoint.new(1, 0.2)),
            }),
        }),
        stroke = createElement("UIStroke", {
            Transparency = 0,
            ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
            Color = Color3.fromRGB(115, 116, 128),
            LineJoinMode = Enum.LineJoinMode.Round,
        }),
    })
end