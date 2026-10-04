-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.Survival.Wave
-- Decompile time: 5.91 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local FakeWaveText = require(ReplicatedStorage.Client.Interfaces.Game.Components.FakeWaveText)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactFlow = require(ReplicatedStorage.Packages.ReactFlow)
local TextLabel = require(ReplicatedStorage.Client.Interfaces.Components.TextLabel)
local createElement = React.createElement
local useBinding = React.useBinding
local useEffect = React.useEffect
local memo = React.memo
local useSpring = ReactFlow.useSpring
return (memo(function(a1) -- Line: 15
    -- upvalues: useBinding (val), useSpring (val), useEffect (val), createElement (val), TextLabel (val)
    -- upvalues: FakeWaveText (val), React (val)
    local u2 = a1.totalWaves or 0
    local v1, u6 = useBinding(a1.wave)
    local v2, u10 = useBinding(a1.isFinalWave)
    local v3, u14 = useSpring({damper = 1, speed = 15, start = 0, target = 0})
    local v4 = useEffect
    local v5 = {a1.wave, a1.isFinalWave}
    v4(function() -- Line: 27 -- upvalues: u6 (val), a1 (val), u10 (val), u14 (val)
        u6(a1.wave)
        u10(a1.isFinalWave)
        u14({force = 8})
    end, v5)
    v5 = {
        BackgroundTransparency = 1,
        Size = a1.size,
        Position = a1.position,
        AnchorPoint = a1.anchorPoint,
    }
    local v6 = {
        listLayout = createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical,
            SortOrder = Enum.SortOrder.LayoutOrder,
            Padding = UDim.new(0, 0),
        }),
        title = createElement(TextLabel, {
            StrokeTransparency = 0.35,
            StrokeThickness = 3,
            Text = "Wave:",
            TextScaled = true,
            FontWeight = "SemiBold",
            LayoutOrder = 2,
            Size = UDim2.fromScale(1, 0.3),
            Position = UDim2.fromScale(0, 0),
            StrokeColor = Color3.new(0, 0, 0),
            ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual,
            TextXAalignment = Enum.TextXAlignment.Left,
        }),
    }
    local v7 = {BackgroundTransparency = 1, LayoutOrder = 2, Size = UDim2.fromScale(1, 0.65)}
    local v8 = {}
    local v9 = if not a1.hiddenWave then createElement(TextLabel, {
        FontWeight = "ExtraBold",
        TextScaled = true,
        StrokeTransparency = 0.35,
        StrokeThickness = 3,
        Size = UDim2.fromScale(0.75, 1),
        Position = v3:map(function(a1) -- Line: 85
            return UDim2.fromScale(0.5, -a1)
        end),
        AnchorPoint = Vector2.new(0.5, 0),
        Text = v1:map(function(a1) -- Line: 91 -- upvalues: u2 (val)
            if a1 ~= -1 and not (a1 >= 90000) then
                if a1 == 0 and u2 == 0 then
                    return "--"
                end
                return (("%* / %*"):format(a1, (math.max(u2, a1))))
            end
            return "∞"
        end),
        TextColor3 = (React.joinBindings({v3, v1, v2})):map(function(a1_2) -- Line: 103 -- upvalues: a1 (val)
            return (if not a1_2[3] then Color3.new(1, 1, 1) else a1.finalWaveColor or Color3.fromRGB(255, 64, 64)):Lerp(
                Color3.fromRGB(255, 255, 255),
                a1_2[1] * 4
            )
        end),
        StrokeColor = Color3.new(0, 0, 0),
    }, {
        gradient = createElement("UIGradient", {
            Rotation = 90,
            Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
                ColorSequenceKeypoint.new(0.6, Color3.fromRGB(255, 255, 255)),
                ColorSequenceKeypoint.new(0.601, Color3.fromRGB(235, 235, 235)),
                (ColorSequenceKeypoint.new(1, Color3.fromRGB(235, 235, 235))),
            }),
        }),
        padding = createElement("UIPadding", {PaddingLeft = UDim.new(0.05, 0)}),
    }) else createElement("Frame", {
        BackgroundTransparency = 1,
        Size = UDim2.fromScale(0.75, 1),
        Position = v3:map(function(a1) -- Line: 67
            return UDim2.fromScale(0.5, -a1)
        end),
        AnchorPoint = Vector2.new(0.5, 0),
    }, {
        UIListLayout = createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal,
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            SortOrder = Enum.SortOrder.LayoutOrder,
        }),
        Text = createElement(FakeWaveText, {text = "???", scale = 1.5}),
    })
    v8.value = v9
    v6.container = createElement("Frame", v7, v8)
    return createElement("Frame", v5, v6)
end))