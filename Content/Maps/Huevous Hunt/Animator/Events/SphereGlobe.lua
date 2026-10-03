-- Script path: ReplicatedStorage.Content.Maps.Huevous Hunt.Animator.Events.SphereGlobe
-- Decompile time: 3.35 ms

local Lighting = game:GetService("Lighting")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local GameState = require(game.ReplicatedStorage.Shared.Modules.GameState)
local v1 = {}
local u23 = {}

local function lerp(a1, a2, a3) -- Line: 13
    return a1 + (a2 - a1) * a3
end

local function tween(a1, a2, a3, a4, a5, a6) -- Line: 17
    -- upvalues: u23 (val), RunService (val), GameState (val), TweenService (val)
    local u6 = 0
    local u7 = a2[a3]
    if u23[a2] then
        u23[a2]:Disconnect()
    end
    u23[a2] = (RunService.RenderStepped:Connect(function(a1_2) -- Line: 25
        -- upvalues: u6 (ref), GameState (upval), a1 (val), TweenService (upval), a5 (val), a6 (val), a2 (val), a3 (val)
        -- upvalues: u7 (val), a4 (val), u23 (upval)
        u6 = u6 + a1_2 * GameState.TimeScale / a1
        local Value = TweenService:GetValue(u6, a5, a6)
        local v1 = u7
        a2[a3] = v1 + (a4 - v1) * Value
        if Value >= 1 then
            u23[a2]:Disconnect()
        end
    end))
end

function v1.rewind(a1) -- Line: 37
    -- upvalues: u23 (val), RunService (val), GameState (val), TweenService (val), Lighting (val)
    local InnerParticleDome = a1.map.InnerParticleDome
    local Linear = Enum.EasingStyle.Linear
    local InOut = Enum.EasingDirection.InOut
    local u5 = 0
    local Transparency = InnerParticleDome.Transparency
    if u23[InnerParticleDome] then
        u23[InnerParticleDome]:Disconnect()
    end
    local v1 = u23
    local RenderStepped = RunService.RenderStepped
    local u17 = 1
    local u18 = "Transparency"
    local u19 = 1
    v1[InnerParticleDome] = (RenderStepped:Connect(function(a1) -- Line: 25
        -- upvalues: u5 (ref), GameState (upval), u17 (val), TweenService (upval), Linear (val), InOut (val)
        -- upvalues: InnerParticleDome (val), u18 (val), Transparency (val), u19 (val), u23 (upval)
        u5 = u5 + a1 * GameState.TimeScale / u17
        local Value = TweenService:GetValue(u5, Linear, InOut)
        local v1 = Transparency
        InnerParticleDome[u18] = v1 + (u19 - v1) * Value
        if Value >= 1 then
            u23[InnerParticleDome]:Disconnect()
        end
    end))
    if a1._spinConnection then
        a1._spinConnection:Disconnect()
    end
    if a1._ambientColor and a1._outdoorAmbientColor then
        Lighting.Ambient = a1._ambientColor
        Lighting.OutdoorAmbient = a1._outdoorAmbientColor
    end
end

function v1.start(a1) -- Line: 57
    -- upvalues: u23 (val), RunService (val), GameState (val), TweenService (val), Lighting (val)
    local u1 = 0
    local InnerParticleDome = a1.map.InnerParticleDome
    local Linear = Enum.EasingStyle.Linear
    local InOut = Enum.EasingDirection.InOut
    local u6 = 0
    local Transparency = InnerParticleDome.Transparency
    if u23[InnerParticleDome] then
        u23[InnerParticleDome]:Disconnect()
    end
    local v1 = u23
    local RenderStepped = RunService.RenderStepped
    local u18 = 30
    local u19 = "Transparency"
    local u20 = 0
    v1[InnerParticleDome] = (RenderStepped:Connect(function(a1) -- Line: 25
        -- upvalues: u6 (ref), GameState (upval), u18 (val), TweenService (upval), Linear (val), InOut (val)
        -- upvalues: InnerParticleDome (val), u19 (val), Transparency (val), u20 (val), u23 (upval)
        u6 = u6 + a1 * GameState.TimeScale / u18
        local Value = TweenService:GetValue(u6, Linear, InOut)
        local v1 = Transparency
        InnerParticleDome[u19] = v1 + (u20 - v1) * Value
        if Value >= 1 then
            u23[InnerParticleDome]:Disconnect()
        end
    end))
    a1._ambientColor = Lighting.Ambient
    a1._outdoorAmbientColor = Lighting.OutdoorAmbient
    a1._spinConnection = RunService.Heartbeat:Connect(function(a1_2) -- Line: 74 -- upvalues: u1 (ref), GameState (upval), Lighting (upval), a1 (val)
        u1 = u1 + a1_2 * GameState.TimeScale / 30
        if u1 < 1 then
            local v1 = Lighting.Ambient:Lerp(Color3.fromRGB(90, 90, 90), u1)
            Lighting.Ambient = v1
            local v2 = Lighting.OutdoorAmbient:Lerp(Color3.fromRGB(189, 189, 189), u1)
            Lighting.OutdoorAmbient = v2
        end
        a1.map.InnerParticleDome.CFrame = a1.map.InnerParticleDome.CFrame * CFrame.Angles(0, math.rad(a1_2 * 90 * GameState.TimeScale), 0)
    end)
end

return v1