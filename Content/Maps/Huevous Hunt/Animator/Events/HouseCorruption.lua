-- Script path: ReplicatedStorage.Content.Maps.Huevous Hunt.Animator.Events.HouseCorruption
-- Decompile time: 2.33 ms

local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local GameState = require(game.ReplicatedStorage.Shared.Modules.GameState)
local v1 = {}
local u18 = {}

local function lerp(a1, a2, a3) -- Line: 12
    return a1 + (a2 - a1) * a3
end

local function tween(a1, a2, a3, a4, a5, a6) -- Line: 16
    -- upvalues: u18 (val), RunService (val), GameState (val), TweenService (val)
    local u6 = 0
    local u7 = a2[a3]
    if u18[a2] then
        u18[a2]:Disconnect()
    end
    u18[a2] = (RunService.RenderStepped:Connect(function(a1_2) -- Line: 24
        -- upvalues: u6 (ref), GameState (upval), a1 (val), TweenService (upval), a5 (val), a6 (val), a2 (val), a3 (val)
        -- upvalues: u7 (val), a4 (val), u18 (upval)
        u6 = u6 + a1_2 * GameState.TimeScale / a1
        local Value = TweenService:GetValue(u6, a5, a6)
        local v1 = u7
        a2[a3] = v1 + (a4 - v1) * Value
        if Value >= 1 then
            u18[a2]:Disconnect()
        end
    end))
end

function v1.rewind(a1) -- Line: 36 -- upvalues: u18 (val), RunService (val), GameState (val), TweenService (val)
    for i, j in a1.map.LightBeamEffect.Main:GetChildren() do
        j.Enabled = false
    end
    local PointLight = a1.map.LightBeamEffect.Main.PointLight
    local Sine = Enum.EasingStyle.Sine
    local InOut = Enum.EasingDirection.InOut
    local u23 = 0
    local Brightness = PointLight.Brightness
    if u18[PointLight] then
        u18[PointLight]:Disconnect()
    end
    local v1 = u18
    local RenderStepped = RunService.RenderStepped
    local u35 = 5
    local u36 = "Brightness"
    local u37 = 0
    v1[PointLight] = (RenderStepped:Connect(function(a1) -- Line: 24
        -- upvalues: u23 (ref), GameState (upval), u35 (val), TweenService (upval), Sine (val), InOut (val)
        -- upvalues: PointLight (val), u36 (val), Brightness (val), u37 (val), u18 (upval)
        u23 = u23 + a1 * GameState.TimeScale / u35
        local Value = TweenService:GetValue(u23, Sine, InOut)
        local v1 = Brightness
        PointLight[u36] = v1 + (u37 - v1) * Value
        if Value >= 1 then
            u18[PointLight]:Disconnect()
        end
    end))
end

function v1.start(a1) -- Line: 51 -- upvalues: u18 (val), RunService (val), GameState (val), TweenService (val)
    for i, j in a1.map.LightBeamEffect.Main:GetChildren() do
        j.Enabled = true
    end
    local PointLight = a1.map.LightBeamEffect.Main.PointLight
    local Sine = Enum.EasingStyle.Sine
    local InOut = Enum.EasingDirection.InOut
    local u23 = 0
    local Brightness = PointLight.Brightness
    if u18[PointLight] then
        u18[PointLight]:Disconnect()
    end
    local v1 = u18
    local RenderStepped = RunService.RenderStepped
    local u35 = 5
    local u36 = "Brightness"
    local u37 = 7
    v1[PointLight] = (RenderStepped:Connect(function(a1) -- Line: 24
        -- upvalues: u23 (ref), GameState (upval), u35 (val), TweenService (upval), Sine (val), InOut (val)
        -- upvalues: PointLight (val), u36 (val), Brightness (val), u37 (val), u18 (upval)
        u23 = u23 + a1 * GameState.TimeScale / u35
        local Value = TweenService:GetValue(u23, Sine, InOut)
        local v1 = Brightness
        PointLight[u36] = v1 + (u37 - v1) * Value
        if Value >= 1 then
            u18[PointLight]:Disconnect()
        end
    end))
end

return v1