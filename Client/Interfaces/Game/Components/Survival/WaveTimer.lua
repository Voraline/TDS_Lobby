-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.Survival.WaveTimer
-- Decompile time: 5.92 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ImageLabel = require(ReplicatedStorage.Client.Interfaces.Components.ImageLabel)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactFlow = require(ReplicatedStorage.Packages.ReactFlow)
local TextLabel = require(ReplicatedStorage.Client.Interfaces.Components.TextLabel)
local createElement = React.createElement
local useBinding = React.useBinding
local useEffect = React.useEffect
local useState = React.useState
local memo = React.memo
local useSpring = ReactFlow.useSpring
return (memo(function(a1) -- Line: 16
    -- upvalues: useBinding (val), useState (val), useSpring (val), useEffect (val), createElement (val)
    -- upvalues: TextLabel (val), ImageLabel (val), React (val)
    local v1, u4 = useBinding(a1.timeLeft)
    local u7, u8 = useState(a1.timeLeft)
    local v2, u12 = useSpring({damper = 1, speed = 15, start = 0, target = 0})
    local v3 = useEffect
    local v4 = {a1.timeLeft}
    v3(function() -- Line: 27 -- upvalues: a1 (val), u4 (val), u7 (val), u8 (val)
        if a1.timeLeft ~= -1 and not (5940 < a1.timeLeft) then
            u4(a1.timeLeft)
            if (math.floor(a1.timeLeft)) ~= u7 then
                u8((math.floor(a1.timeLeft)))
            end
            return
        end
        u4(-1)
    end, v4)
    v4 = {u7}
    useEffect(function() -- Line: 39 -- upvalues: u7 (val), u12 (val)
        if u7 <= 5 and u7 ~= -1 then
            u12({force = 8})
        end
    end, v4)
    return createElement("Frame", {
        BackgroundTransparency = 1,
        Size = a1.size,
        Position = a1.position,
        AnchorPoint = a1.anchorPoint,
    }, {
        listLayout = createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical,
            SortOrder = Enum.SortOrder.LayoutOrder,
            Padding = UDim.new(0, 0),
        }),
        bin = createElement("Frame", {BackgroundTransparency = 1, LayoutOrder = 1, Size = UDim2.fromScale(1, 0.3)}, {
            listLayout = createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal,
                SortOrder = Enum.SortOrder.LayoutOrder,
                Padding = UDim.new(0, 0),
            }),
            title = createElement(TextLabel, {
                StrokeTransparency = 0.35,
                StrokeThickness = 3,
                Text = "Time Left:",
                TextScaled = true,
                FontWeight = "SemiBold",
                LayoutOrder = 2,
                Size = UDim2.fromScale(0.7, 1),
                Position = UDim2.fromScale(0, 0),
                StrokeColor = Color3.new(0, 0, 0),
                ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual,
            }),
            icon = createElement(ImageLabel, {
                BackgroundTransparency = 1,
                Image = "rbxassetid://5577896365",
                LayoutOrder = 1,
                Size = UDim2.fromScale(1.2, 1.2),
                SizeConstraint = Enum.SizeConstraint.RelativeYY,
            }),
        }),
        container = createElement("Frame", {BackgroundTransparency = 1, LayoutOrder = 2, Size = UDim2.fromScale(1, 0.65)}, {
            value = createElement(TextLabel, {
                FontWeight = "ExtraBold",
                TextScaled = true,
                StrokeTransparency = 0.35,
                StrokeThickness = 3,
                Size = UDim2.fromScale(1, 1),
                Position = v2:map(function(a1) -- Line: 95
                    return UDim2.fromScale(0, -a1)
                end),
                AnchorPoint = Vector2.zero,
                TextXAlignment = Enum.TextXAlignment.Left,
                Text = v1:map(function(a1) -- Line: 102
                    if a1 ~= -1 and not (a1 > 5940) then
                        if a1 <= 0 then
                            return "00:00"
                        end
                        return string.format("%02d:%02d", math.floor(a1 / 60), (math.floor(a1 % 60)))
                    end
                    return utf8.char(8734)
                end),
                TextColor3 = React.joinBindings({v2, v1}):map(function(a1) -- Line: 117
                    if a1[2] <= 5 then
                        return (Color3.fromRGB(255, 255, 255)):Lerp(Color3.fromRGB(255, 64, 64), a1[1] * 4)
                    end
                    return Color3.fromRGB(255, 255, 255)
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
            }),
        }),
    })
end))