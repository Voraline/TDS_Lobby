-- Script path: ReplicatedStorage.Content.Maps.Classic Island Chaos.Animator.Events.Time
-- Decompile time: 2.10 ms

local Lighting = game:GetService("Lighting")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local GameState = require(game.ReplicatedStorage.Shared.Modules.GameState)
local v1 = {_defaultTime = Lighting.ClockTime}
local u24 = {}

local function lerp(a1, a2, a3) -- Line: 12
    return a1 + (a2 - a1) * a3
end

local function tween(a1, a2, a3, a4, a5, a6) -- Line: 16
    -- upvalues: u24 (val), RunService (val), GameState (val), TweenService (val)
    local u6 = 0
    local u7 = a2[a3]
    if u24[a2] then
        u24[a2]:Disconnect()
    end
    u24[a2] = (RunService.RenderStepped:Connect(function(a1_2) -- Line: 24
        -- upvalues: u6 (ref), GameState (upval), a1 (val), TweenService (upval), a5 (val), a6 (val), a2 (val), a3 (val)
        -- upvalues: u7 (val), a4 (val), u24 (upval)
        u6 = u6 + a1_2 * GameState.TimeScale / a1
        local Value = TweenService:GetValue(u6, a5, a6)
        local v1 = u7
        a2[a3] = v1 + (a4 - v1) * Value
        if Value >= 1 then
            u24[a2]:Disconnect()
        end
    end))
end

function v1.rewind(a1) -- Line: 36
    -- upvalues: Lighting (val), u24 (val), RunService (val), GameState (val), TweenService (val)
    local u1 = Lighting
    local _defaultTime = a1._defaultTime
    local Sine = Enum.EasingStyle.Sine
    local InOut = Enum.EasingDirection.InOut
    local u5 = 0
    local ClockTime = u1.ClockTime
    if u24[u1] then
        u24[u1]:Disconnect()
    end
    local v1 = u24
    local RenderStepped = RunService.RenderStepped
    local u17 = 2
    local u18 = "ClockTime"
    v1[u1] = (RenderStepped:Connect(function(a1) -- Line: 24
        -- upvalues: u5 (ref), GameState (upval), u17 (val), TweenService (upval), Sine (val), InOut (val), u1 (val)
        -- upvalues: u18 (val), ClockTime (val), _defaultTime (val), u24 (upval)
        u5 = u5 + a1 * GameState.TimeScale / u17
        local Value = TweenService:GetValue(u5, Sine, InOut)
        local v1 = ClockTime
        u1[u18] = v1 + (_defaultTime - v1) * Value
        if Value >= 1 then
            u24[u1]:Disconnect()
        end
    end))
end

function v1.start(a1) -- Line: 47
    -- upvalues: Lighting (val), u24 (val), RunService (val), GameState (val), TweenService (val)
    local u1 = Lighting
    local Linear = Enum.EasingStyle.Linear
    local InOut = Enum.EasingDirection.InOut
    local u4 = 0
    local ClockTime = u1.ClockTime
    if u24[u1] then
        u24[u1]:Disconnect()
    end
    local v1 = u24
    local RenderStepped = RunService.RenderStepped
    local u16 = 25
    local u17 = "ClockTime"
    local u18 = 17.8
    v1[u1] = (RenderStepped:Connect(function(a1) -- Line: 24
        -- upvalues: u4 (ref), GameState (upval), u16 (val), TweenService (upval), Linear (val), InOut (val), u1 (val)
        -- upvalues: u17 (val), ClockTime (val), u18 (val), u24 (upval)
        u4 = u4 + a1 * GameState.TimeScale / u16
        local Value = TweenService:GetValue(u4, Linear, InOut)
        local v1 = ClockTime
        u1[u17] = v1 + (u18 - v1) * Value
        if Value >= 1 then
            u24[u1]:Disconnect()
        end
    end))
end

return v1