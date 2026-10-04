-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.Sandbox.Options.OptionTypes.BooleanOption
-- Decompile time: 4.68 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local SandboxStore = require(ReplicatedStorage.Client.Interfaces.Stores.Game.SandboxStore)
local useCharmSelector = require(ReplicatedStorage.Client.Interfaces.Hooks.useCharmSelector)
local useSound = require(ReplicatedStorage.Client.Interfaces.Hooks.useSound)
local useSpring = require(ReplicatedStorage.Client.Interfaces.Hooks.useSpring)
local createElement = React.createElement
return function(a1) -- Line: 16
    -- upvalues: useSpring (val), useCharmSelector (val), SandboxStore (val), React (val), useSound (val)
    -- upvalues: createElement (val)
    local v1, u7 = useSpring(0, 1, 40, true)
    local v2, u14 = useSpring(0, 1, 40, true)
    local v3 = useCharmSelector
    local getState = SandboxStore.getState
    local v4 = {a1.id}
    local u21 = v3(getState, function(a1_2) -- Line: 20 -- upvalues: a1 (val)
        return a1_2[a1.id]
    end, v4)
    local v5 = React.joinBindings({v1, v2})
    local HoverHotbar = useSound("HoverHotbar")
    local Click = useSound("Click")
    local v6 = {
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(24, 24, 24),
        TextColor3 = Color3.fromRGB(255, 255, 255),
        Text = if not u21 then "" else "✓",
        Font = Enum.Font.Gotham,
        TextSize = 24,
        Size = UDim2.fromOffset(100, 20),
    }

    v6[React.Event.MouseEnter] = function() -- Line: 39 -- upvalues: HoverHotbar (val), u7 (val)
        HoverHotbar()
        u7(1)
    end

    v6[React.Event.MouseLeave] = function() -- Line: 43 -- upvalues: HoverHotbar (val), u7 (val)
        HoverHotbar()
        u7(0)
    end

    v6[React.Event.MouseButton1Down] = function() -- Line: 47 -- upvalues: u14 (val)
        u14(1)
    end

    v6[React.Event.MouseButton1Up] = function() -- Line: 50 -- upvalues: u14 (val)
        u14(0)
    end

    v6[React.Event.Activated] = function() -- Line: 53 -- upvalues: Click (val), a1 (val), u21 (val)
        Click()
        a1.activate(not u21)
    end

    return createElement("TextButton", v6, {
        scale = createElement("UIScale", {
            Scale = v5:map(function(a1) -- Line: 59
                return 1 + a1[1] * (1 - a1[2]) * 0.1 - a1[2] * 0.1
            end),
        }),
        aspectRatio = createElement("UIAspectRatioConstraint"),
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