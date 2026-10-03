-- Script path: ReplicatedStorage.Client.Interfaces.Universal.Components.Hotbar.HotbarStars
-- Decompile time: 1.88 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactFlow = require(ReplicatedStorage.Packages.ReactFlow)
local useEffect = React.useEffect
local useBinding = React.useBinding
local createElement = React.createElement
local joinBindings = React.joinBindings
local u24 = Random.new()

local function star() -- Line: 13
    -- upvalues: useBinding (val), u24 (val), ReactFlow (val), useEffect (val), RunService (val), React (val)
    -- upvalues: joinBindings (val), createElement (val)
    local v1 = useBinding(u24:NextNumber(0, 1))
    local v2 = useBinding(u24:NextNumber(0, 1))
    local v3, u24_2 = ReactFlow.useTween({target = 0, start = 0, info = TweenInfo.new(0.3, Enum.EasingStyle.Linear)})
    local v4, u28 = useBinding(0)
    useEffect(function() -- Line: 25 -- upvalues: RunService (upval), u28 (val), u24_2 (val)
        local u0 = 0
        local u6 = RunService.Heartbeat:Connect(function(a1) -- Line: 27 -- upvalues: u0 (ref), u28 (upval) -- types: a1: number
            u0 = u0 + a1 * 90
            u28(u0)
        end)
        local u9 = task.spawn(function() -- Line: 32 -- upvalues: u24_2 (upval)
            while true do
                local u4 = math.random(3, 7) * 2
                u24_2({target = 1, info = TweenInfo.new(0.2, Enum.EasingStyle.Linear)})
                task.delay(0.3, function() -- Line: 37 -- upvalues: u24_2 (upval), u4 (val)
                    u24_2({
                        target = 0.3,
                        info = TweenInfo.new(u4, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
                    })
                end)
                task.wait(u4)
            end
        end)
        return function() -- Line: 52 -- upvalues: u6 (val), u9 (val)
            u6:Disconnect()
            task.cancel(u9)
        end
    end, {})
    return React.createElement("ImageLabel", {
        Image = "rbxassetid://10598374841",
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ZIndex = 999,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = joinBindings({v1, v2}):map(function(a1) -- Line: 64
            return UDim2.fromScale(a1[1], a1[2])
        end),
        Size = UDim2.fromOffset(50, 50),
        AnchorPoint = Vector2.new(0.5, 0.5),
        Rotation = v4,
    }, {uIScale = createElement("UIScale", {Scale = v3})})
end

return function(a1) -- Line: 82 -- upvalues: createElement (val), star (val), React (val) -- types: a1: table
    local v1 = a1.Amount or 8
    local v2 = {}
    for i = 1, v1 do
        table.insert(v2, (createElement(star)))
    end
    return createElement("Frame", {
        BackgroundTransparency = 1,
        ZIndex = 999,
        Size = UDim2.fromScale(1, 1),
        Position = UDim2.fromScale(0.5, 0.5),
        AnchorPoint = Vector2.new(0.5, 0.5),
    }, {stars = createElement(React.Fragment, nil, v2)})
end