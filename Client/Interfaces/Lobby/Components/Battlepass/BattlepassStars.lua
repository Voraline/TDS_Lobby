-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.Battlepass.BattlepassStars
-- Decompile time: 7.23 ms

local HttpService = game:GetService("HttpService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactFlow = require(ReplicatedStorage.Packages.ReactFlow)
local table = require(ReplicatedStorage.Shared.Modules.Utils.table)
local useEffect = React.useEffect
local useBinding = React.useBinding
local useMemo = React.useMemo
local useRef = React.useRef
local useState = React.useState
local createElement = React.createElement
local memo = React.memo
local u38 = Random.new()

local function id() -- Line: 27 -- upvalues: HttpService (val)
    return HttpService:GenerateGUID(false)
end

local u42 = memo(function(a1) -- Line: 31
    -- upvalues: useMemo (val), u38 (val), useBinding (val), ReactFlow (val), useEffect (val), RunService (val)
    -- upvalues: createElement (val)
    local duration = a1.duration
    local speed = a1.speed
    local remove = a1.remove
    local v1 = useMemo(function() -- Line: 36 -- upvalues: u38 (upval)
        return UDim2.fromScale(u38:NextNumber(0, 1), u38:NextNumber(0, 1))
    end, {})
    local u11 = useMemo(function() -- Line: 40 -- upvalues: u38 (upval), duration (val)
        return u38:NextNumber(duration.Min, duration.Max)
    end, {})
    local v2, u15 = useBinding(0)
    local v3, u25 = ReactFlow.useTween({
        target = 0,
        start = 0,
        info = TweenInfo.new(u11 / 2, Enum.EasingStyle.Sine, Enum.EasingDirection.Out),
    })
    useEffect(function() -- Line: 52
        -- upvalues: u38 (upval), RunService (upval), speed (val), u15 (val), u11 (val), remove (val), u25 (val)
        local u0 = 0
        local u5 = u38:NextNumber() * 360
        local u11_2 = RunService.Heartbeat:Connect(function(a1) -- Line: 56 -- upvalues: u0 (ref), speed (upval), u15 (upval), u5 (val) -- types: a1: number
            u0 = u0 + a1 * speed
            u15(u5 + u0)
        end)
        local u14 = task.spawn(function() -- Line: 61 -- upvalues: u11 (upval), remove (upval)
            task.delay(u11, function() -- Line: 62 -- upvalues: remove (upval)
                remove()
            end)
        end)
        local u17 = task.spawn(function() -- Line: 67 -- upvalues: u25 (upval), u11 (upval)
            u25({start = 0, target = 1})
            task.wait(u11 / 2)
            u25({start = 1, target = 0})
        end)
        return function() -- Line: 79 -- upvalues: u14 (val), u17 (val), u11_2 (val)
            task.cancel(u14)
            task.cancel(u17)
            u11_2:Disconnect()
        end
    end, {})
    return createElement("ImageLabel", {
        Image = "rbxassetid://9808478554",
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ZIndex = 999,
        ImageTransparency = a1.Transparency,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = v1,
        SizeConstraint = Enum.SizeConstraint.RelativeYY,
        Size = v3:map(function(a1_2) -- Line: 96 -- upvalues: a1 (val)
            local v1 = a1_2 * a1.scale
            return UDim2.fromScale(0.2 * v1, 0.2 * v1)
        end),
        AnchorPoint = Vector2.new(0.5, 0.5),
        Rotation = v2,
    })
end)
return memo(function(a1) -- Line: 106
    -- upvalues: useBinding (val), useRef (val), useState (val), table (val), createElement (val), u42 (val)
    -- upvalues: useEffect (val), HttpService (val), React (val)
    local u22
    local Transparency = a1.Transparency
    if not Transparency then
        Transparency = useBinding(0)
    end
    local duration = a1.duration
    if not duration then
        duration = NumberRange.new(1)
    end
    local u12 = a1.speed or 90
    local u14 = a1.scale or 1
    local u16 = a1.rate or 1
    local u19 = useRef({})
    _, u22 = useState()
    local v1 = table.reduce(u19.current, function(a1, a2, a3) -- Line: 116
        -- upvalues: createElement (upval), u42 (upval), Transparency (val), u16 (val), u12 (val), u14 (val)
        -- upvalues: duration (val), u19 (val), u22 (val)
        a1[a3] = (createElement(u42, {
            Transparency = Transparency,
            rate = u16,
            speed = u12,
            scale = u14,
            duration = duration,
            remove = function() -- Line: 123 -- upvalues: u19 (upval), a3 (val), u22 (upval)
                local v1 = u19.current[a3] ~= nil
                u19.current[a3] = nil
                if v1 then
                    u22({})
                end
            end,
        }))
        return a1
    end, {})
    local v2 = {u16}
    useEffect(function() -- Line: 135 -- upvalues: u16 (val), Transparency (val), u19 (val), HttpService (upval), u22 (val)
        local u0 = true
        local u3 = task.spawn(function() -- Line: 137
            -- upvalues: u0 (ref), u16 (upval), Transparency (upval), u19 (upval), HttpService (upval), u22 (upval)
            while u0 do
                task.wait(1 / u16)
                if (Transparency:getValue()) < 1 then
                    u19.current[(HttpService:GenerateGUID(false))] = true
                    u22({})
                end
            end
        end)
        return function() -- Line: 148 -- upvalues: u0 (ref), u3 (val)
            u0 = false
            task.cancel(u3)
        end
    end, v2)
    return createElement("Frame", {
        BackgroundTransparency = 1,
        ZIndex = 999,
        Size = UDim2.fromScale(1, 1),
        Position = UDim2.fromScale(0.5, 0.5),
        AnchorPoint = Vector2.new(0.5, 0.5),
    }, {stars = createElement(React.Fragment, nil, v1)})
end)