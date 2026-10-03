-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.Sandbox.Options.OptionTypes.NumberOption
-- Decompile time: 2.14 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local SandboxStore = require(ReplicatedStorage.Client.Interfaces.Stores.Game.SandboxStore)
local useCharmBinding = require(ReplicatedStorage.Client.Interfaces.Hooks.useCharmBinding)
local Container = require(ReplicatedStorage.Client.Interfaces.Game.Components.NewUpgrade.Alignments.BaseComponents.Container)
local useSpring = require(ReplicatedStorage.Client.Interfaces.Hooks.useSpring)
local createElement = React.createElement
return function(a1) -- Line: 21
    -- upvalues: useCharmBinding (val), SandboxStore (val), useSpring (val), createElement (val), Container (val)
    -- upvalues: React (val)
    local v1 = useCharmBinding
    local getState = SandboxStore.getState
    local v2 = {a1.id}
    v1 = v1(getState, function(a1_2) -- Line: 22 -- upvalues: a1 (val)
        return a1_2[a1.id] or 0
    end, v2)
    local v3, u14 = useSpring(1, 1, 30, true)
    v2 = createElement
    local v4 = Container
    local v5 = {
        BackgroundTransparency = 0.25,
        CornerRadius = 8,
        StrokeThickness = 2,
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        Size = UDim2.new(0, 100, 1, 0),
        StrokeColor = Color3.fromRGB(90, 90, 90),
    }
    local v6 = {
        padding = createElement("UIPadding", {
            PaddingTop = UDim.new(0, 2),
            PaddingBottom = UDim.new(0, 2),
            PaddingLeft = UDim.new(0, 2),
            PaddingRight = UDim.new(0, 2),
        }),
    }
    local v7 = createElement
    local v8 = {
        ClearTextOnFocus = false,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Text = v1,
        Font = Enum.Font.GothamMedium,
        TextScaled = true,
        BackgroundTransparency = 1,
        Size = UDim2.fromScale(1, 1),
        TextColor3 = v3:map(function(a1) -- Line: 55
            return (Color3.fromRGB(168, 64, 64)):Lerp(Color3.fromRGB(255, 255, 255), a1)
        end),
    }

    v8[React.Change.Text] = function(a1_2) -- Line: 59 -- upvalues: a1 (val), u14 (val)
        local v1 = tonumber(a1_2.Text)
        local v2 = false
        if v1 ~= nil then
            v2 = false
            if (a1.min or (-1 / 0)) <= v1 then
                v2 = v1 <= (a1.max or (1 / 0))
            end
        end
        u14(if not v2 then 0 else 1)
    end

    v8[React.Event.FocusLost] = function(a1_2) -- Line: 68 -- upvalues: a1 (val), SandboxStore (upval)
        local v1 = tonumber(a1_2.Text)
        if not v1 then
            a1_2.Text = tostring((SandboxStore.getState())[a1.id] or 0)
            return
        end
        v1 = math.clamp(v1, a1.min or (-1 / 0), a1.max or (1 / 0))
        a1.activate(v1)
    end

    v6.content = v7("TextBox", v8, {
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
            Color = Color3.fromRGB(115, 116, 128),
            LineJoinMode = Enum.LineJoinMode.Round,
        }),
    })
    return v2(v4, v5, v6)
end