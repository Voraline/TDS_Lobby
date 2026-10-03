-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.Unit
-- Decompile time: 4.07 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local React = require(ReplicatedStorage.Shared.UI.React)
local ServerTicks = require(ReplicatedStorage.Shared.Modules.ServerTicks)
local usePooledEvent = require(ReplicatedStorage.Client.Interfaces.Hooks.usePooledEvent)
local useReactBinding = require(ReplicatedStorage.Client.Interfaces.Hooks.useReactBinding)
local useEffect = React.useEffect
local useState = React.useState
local useRef = React.useRef
local createElement = React.createElement
return function(a1) -- Line: 15
    -- upvalues: useState (val), ServerTicks (val), useReactBinding (val), useRef (val), React (val)
    -- upvalues: usePooledEvent (val), RunService (val), useEffect (val), createElement (val)
    local u2 = a1.Interval or 10
    local StartTick = a1.StartTick
    if not StartTick then
        StartTick = useState(ServerTicks.getTime())
    end
    local v1, u12 = useReactBinding(0)
    local u15, u16 = useReactBinding(nil)
    local u19, u20 = useReactBinding(true)
    local u23 = useRef(0)
    local v2 = (React.joinBindings({v1})):map(function(a1) -- Line: 25 -- upvalues: u2 (val)
        return 1 - a1[1] / u2
    end):map(function(a1) -- Line: 28
        return a1 % 1
    end)
    local v3 = v2:map(function(a1) -- Line: 31
        return (math.max(a1 * 360, 179))
    end)
    local v4 = v2:map(function(a1) -- Line: 34
        return (math.min(a1 * 360, 180))
    end)
    usePooledEvent(RunService.Heartbeat, function(a1) -- Line: 38 -- upvalues: u23 (val), ServerTicks (upval), u2 (val), StartTick (val), u12 (val)
        local v1 = u23
        v1.current = v1.current + a1
        if u23.current < 0.05 then
            return
        end
        u23.current = 0
        u12((math.clamp(ServerTicks.getTime() + u2 - StartTick, 0, u2)))
    end)
    local v5 = useEffect
    local v6 = {u2, StartTick, a1.Model}
    v5(function() -- Line: 52 -- upvalues: u19 (val), a1 (val), u15 (val), u16 (val), u12 (val), StartTick (val), u20 (val)
        local v1 = u19:getValue()
        if a1.Model ~= u15:getValue() then
            u16(a1.Model)
            v1 = true
        end
        if not v1 then
            u12(StartTick)
            return
        end
        u20(false)
    end, v6)
    v6 = {
        BackgroundTransparency = 0.4,
        Position = a1.Position,
        AnchorPoint = a1.AnchorPoint,
        LayoutOrder = a1.LayoutOrder,
    }
    local Size = a1.Size or UDim2.fromOffset(56, 56)
    v6.Size = Size
    v6.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    return createElement("Frame", v6, {
        seconds = createElement("TextLabel", {
            TextSize = 24,
            BackgroundTransparency = 1,
            ZIndex = 3,
            FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Heavy, Enum.FontStyle.Normal),
            Text = v2:map(function(a1) -- Line: 80 -- upvalues: u2 (val)
                return (tostring((math.ceil(a1 * u2))))
            end),
            TextColor3 = Color3.fromRGB(255, 255, 255),
            AnchorPoint = Vector2.new(0.5, 0.5),
            AutomaticSize = Enum.AutomaticSize.X,
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            Position = UDim2.new(1, -8, 1, -8),
            Size = UDim2.fromOffset(0, 32),
        }, {uIStroke = createElement("UIStroke", {Thickness = 2, Transparency = 0.5})}),
        icon = createElement("ImageLabel", {
            BackgroundTransparency = 1,
            Image = "rbxassetid://" .. (a1.Icon or 6877509129),
            ScaleType = Enum.ScaleType.Fit,
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromOffset(36, 36),
        }),
        uICorner = createElement("UICorner", {CornerRadius = UDim.new(1, 0)}),
        circularProgressBar = createElement("Frame", {
            BackgroundTransparency = 1,
            ZIndex = 2,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.new(1, 8, 1, 8),
        }, {
            gradient2 = createElement("Frame", {
                BackgroundTransparency = 1,
                ClipsDescendants = true,
                Position = UDim2.fromScale(0.5, 0),
                Size = UDim2.fromScale(0.5, 1),
            }, {
                imageLabel = createElement("ImageLabel", {
                    Image = "rbxasset://textures/ui/Controls/RadialFill@3x.png",
                    BackgroundTransparency = 1,
                    ImageColor3 = Color3.fromRGB(85, 255, 127),
                    Position = UDim2.fromScale(-1, 0),
                    Size = UDim2.fromScale(2, 1),
                }, {
                    uIGradient = createElement("UIGradient", {
                        Offset = Vector2.zero,
                        Rotation = v4,
                        Transparency = NumberSequence.new({
                            NumberSequenceKeypoint.new(0, 0),
                            NumberSequenceKeypoint.new(0.5, 0),
                            NumberSequenceKeypoint.new(0.501, 1),
                            (NumberSequenceKeypoint.new(1, 1)),
                        }),
                    }),
                }),
            }),
            progress = createElement("NumberValue"),
            gradient1 = createElement("Frame", {
                BackgroundTransparency = 1,
                ClipsDescendants = true,
                Size = UDim2.fromScale(0.5, 1),
            }, {
                imageLabel1 = createElement("ImageLabel", {
                    Image = "rbxasset://textures/ui/Controls/RadialFill@3x.png",
                    BackgroundTransparency = 1,
                    ImageColor3 = Color3.fromRGB(85, 255, 127),
                    Size = UDim2.fromScale(2, 1),
                }, {
                    uIGradient1 = createElement("UIGradient", {
                        Rotation = v3,
                        Offset = Vector2.zero,
                        Transparency = NumberSequence.new({
                            NumberSequenceKeypoint.new(0, 0),
                            NumberSequenceKeypoint.new(0.5, 0),
                            NumberSequenceKeypoint.new(0.501, 1),
                            (NumberSequenceKeypoint.new(1, 1)),
                        }),
                    }),
                }),
            }),
        }),
        uIStroke1 = createElement("UIStroke", {Thickness = 3, Transparency = 0.2}),
    })
end