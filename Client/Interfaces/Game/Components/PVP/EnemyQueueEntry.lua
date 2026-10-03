-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.PVP.EnemyQueueEntry
-- Decompile time: 5.22 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Comma = require(ReplicatedStorage.Client.Modules.Comma)
local React = require(ReplicatedStorage.Shared.UI.React)
local Icons = require(ReplicatedStorage.Shared.Data.Icons)
require(ReplicatedStorage.Shared.Modules.PVPConstants)
local useReactBinding = require(ReplicatedStorage.Client.Interfaces.Hooks.useReactBinding)
local useSpring = require(ReplicatedStorage.Client.Interfaces.Hooks.useSpring)
local createElement = React.createElement
local joinBindings = React.joinBindings
local useEffect = React.useEffect
local u49 = Color3.fromRGB(211, 77, 77)
local u54 = Color3.fromRGB(155, 157, 170)

local function now() -- Line: 31 -- upvalues: RunService (val)
    if RunService:IsRunning() then
        return workspace:GetServerTimeNow()
    end
    return os.clock()
end

return function(a1) -- Line: 39
    -- upvalues: useSpring (val), useReactBinding (val), Icons (val), React (val), useEffect (val), RunService (val)
    -- upvalues: createElement (val), joinBindings (val), u54 (val), Comma (val), u49 (val)
    local u36, u45, v1, v2
    local v3, u11 = useSpring(if not a1.new then 1 else 0, 1, 40, true)
    local v4, u23 = useSpring(if not a1.main then 0 else 1, 1, 40, true)
    local u27, u28 = useReactBinding(a1.count)
    v2, _, u36 = useSpring(0, 1, 80, true)
    v1, _, _, u45 = useSpring(1, 0.6, 20, true)
    local v5 = Icons.Enemies[a1.id]
    local timer = a1.timer
    local maxTimer = a1.maxTimer
    local deleting = a1.deleting
    local v6, u57 = React.useBinding(0)
    local v7 = useEffect
    local v8 = {a1.main}
    v7(function() -- Line: 55 -- upvalues: u23 (val), a1 (val)
        u23(if not a1.main then 0 else 1)
    end, v8)
    v7 = useEffect
    v8 = {a1.count}
    v7(function() -- Line: 59 -- upvalues: a1 (val), u27 (val), u36 (val), u45 (val), u28 (val)
        if a1.count ~= u27:getValue() then
            u36(1)
            u45(10)
        end
        u28(a1.count)
    end, v8)
    v7 = useEffect
    v8 = {a1.deleting}
    v7(function() -- Line: 68 -- upvalues: a1 (val), u11 (val)
        if a1.deleting then
            u11(0)
            return
        end
        u11(1)
    end, v8)
    v8 = {maxTimer, timer, deleting}
    useEffect(function() -- Line: 76 -- upvalues: timer (val), deleting (val), maxTimer (val), u57 (val), RunService (upval)
        if timer and not deleting and maxTimer then
            local v1 = timer
            local ServerTimeNow = if not RunService:IsRunning() then os.clock() else workspace:GetServerTimeNow()
            if v1 - ServerTimeNow <= 0 then
                u57(0)
                return
            end
            u57(0)
            local u24 = nil
            u24 = RunService.Heartbeat:Connect(function(a1) -- Line: 91 -- upvalues: timer (upval), RunService (upval), u57 (upval), u24 (ref)
                local v1 = math.max(0, timer - (if not RunService:IsRunning() then os.clock() else workspace:GetServerTimeNow()))
                u57(v1)
                if v1 <= 0 then
                    u24:Disconnect()
                end
            end)
            return function() -- Line: 100 -- upvalues: u24 (ref)
                if u24.Connected then
                    u24:Disconnect()
                end
            end
        end
        u57(0)
    end, v8)
    v8 = {
        BackgroundTransparency = 1,
        LayoutOrder = a1.idx,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Size = UDim2.fromOffset(84, 64),
        Visible = v3:map(function(a1) -- Line: 112
            return a1 > 0.001
        end),
    }
    local v9 = {
        scale = createElement("UIScale", {
            Scale = joinBindings({v3, v1}):map(function(a1) -- Line: 117
                return a1[1] * a1[2]
            end),
        }),
    }
    local v10 = {
        BackgroundTransparency = 0.25,
        Size = UDim2.fromScale(1, 1),
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = v4:map(function(a1) -- Line: 124 -- types: a1: number
            return (UDim2.fromScale(0.5, 0.5)):Lerp(UDim2.fromScale(0.5, 0.4), a1)
        end),
        BackgroundColor3 = Color3.fromRGB(97, 111, 139),
    }
    local v11 = {ratio = createElement("UIAspectRatioConstraint")}
    v11.corner = createElement("UICorner", {CornerRadius = UDim.new(0, 4)})
    v11.gradient = createElement("UIGradient", {
        Rotation = 90,
        Color = ColorSequence.new(Color3.new(1, 1, 1), Color3.fromRGB(45, 45, 45)),
    })
    v11.stroke = createElement("UIStroke", {
        Thickness = 2,
        Color = v4:map(function(a1) -- Line: 139 -- upvalues: u54 (upval)
            return u54:Lerp(Color3.fromRGB(236, 239, 255), a1)
        end),
        LineJoinMode = Enum.LineJoinMode.Round,
    })
    v11.timer = createElement("Frame", {
        BackgroundTransparency = 0.3,
        ZIndex = 2,
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        Size = UDim2.fromScale(1, 1),
        Visible = v6:map(function(a1) -- Line: 150
            return a1 > 0
        end),
    }, {
        uiCorner = createElement("UICorner"),
        uiGradient = createElement("UIGradient", {
            Rotation = -90,
            Offset = v6:map(function(a1) -- Line: 158 -- upvalues: maxTimer (val)
                return Vector2.new(0, (math.clamp(1 - math.clamp(if not (a1 <= 0) then a1 / maxTimer else 1, 0, 1) - 0.5, -0.5, 0.5)))
            end),
            Transparency = NumberSequence.new({
                NumberSequenceKeypoint.new(0, 0),
                NumberSequenceKeypoint.new(0.5, 0),
                NumberSequenceKeypoint.new(0.505, 1),
                (NumberSequenceKeypoint.new(1, 1)),
            }),
        }),
    })
    v11.timeLeft = createElement("TextLabel", {
        TextTransparency = 0,
        ZIndex = 3,
        TextScaled = true,
        TextSize = 10,
        TextWrapped = true,
        BackgroundTransparency = 1,
        FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Heavy, Enum.FontStyle.Normal),
        Text = v6:map(function(a1) -- Line: 180
            return string.format("%.1f", a1)
        end),
        Visible = v6:map(function(a1) -- Line: 184
            return a1 > 0
        end),
        TextColor3 = Color3.fromRGB(255, 255, 255),
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(1, 0.4),
    }, {uiStroke2 = createElement("UIStroke", {Thickness = 3, Transparency = 0.5})})
    local v12 = createElement
    local v13 = {
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(229, 31, 31),
        Position = UDim2.new(1, -4, 0, 4),
        Size = UDim2.fromOffset(20, 20),
        Text = "",
        ZIndex = 3,
        Visible = not a1.main,
    }
    v13[React.Event.Activated] = a1.onCancel
    v11.close = v12("TextButton", v13, {
        corner = createElement("UICorner", {CornerRadius = UDim.new(1, 0)}),
        image = createElement("ImageLabel", {
            BackgroundTransparency = 1,
            Image = "rbxassetid://12289763206",
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromScale(0.7, 0.7),
            ScaleType = Enum.ScaleType.Fit,
        }),
    })
    v11.icon = createElement("ImageLabel", {
        BackgroundTransparency = 1,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromOffset(80, 80),
        Image = v5 or "rbxassetid://14233747136",
        ScaleType = Enum.ScaleType.Fit,
    })
    v13 = {
        BackgroundTransparency = 1,
        TextSize = 22,
        TextWrapped = false,
        ZIndex = 4,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.8),
        Size = v2:map(function(a1) -- Line: 241 -- types: a1: number
            return (UDim2.fromOffset(32, 32)):Lerp(UDim2.fromOffset(40, 40), a1)
        end),
        Font = Enum.Font.GothamBlack,
    }
    v13.Text = if not a1.count or not (0 < a1.count) then "" else ("x%*"):format((Comma(a1.count)))
    v13.TextColor3 = v2:map(function(a1) -- Line: 249 -- upvalues: u49 (upval) -- types: a1: number
        return (Color3.new(1, 1, 1)):Lerp(u49, a1)
    end)
    v11.count = createElement("TextLabel", v13, {stroke = createElement("UIStroke", {Thickness = 2})})
    v9.content = createElement("Frame", v10, v11)
    return createElement("Frame", v8, v9)
end