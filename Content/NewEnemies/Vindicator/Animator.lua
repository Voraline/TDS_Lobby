-- Script path: ReplicatedStorage.Content.NewEnemies.Vindicator.Animator
-- Decompile time: 7.22 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local ArcPath = require(ReplicatedStorage.Shared.Modules.ArcPath)
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local ServerTicks = require(ReplicatedStorage.Shared.Modules.ServerTicks)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local v1 = {}
v1.__index = v1

local function safeUnit(a1, a2) -- Line: 16
    local Magnitude = a1.Magnitude
    if Magnitude == Magnitude and not (Magnitude <= 1e-06) and Magnitude ~= (1 / 0) then
        return a1 / Magnitude
    end
    return a2 or Vector3.new(0, 0, 0)
end

local function getDirection(a1, a2, a3) -- Line: 26
    local v1 = a2 - a1
    local Magnitude = v1.Magnitude
    if Magnitude == Magnitude and not (Magnitude <= 1e-06) and Magnitude ~= (1 / 0) then
        return v1 / Magnitude
    end
    return a3 or Vector3.new(0, 0, 0)
end

local function getThrowDirection(a1, a2) -- Line: 30
    local v1
    local v2 = a2 - a1
    local Magnitude = v2.Magnitude
    local v3 = (if Magnitude ~= Magnitude then Vector3.new(0, 0, 1) else if Magnitude <= 1e-06 then Vector3.new(0, 0, 1) else if Magnitude ~= (1 / 0) then v2 / Magnitude else Vector3.new(0, 0, 1)) + Vector3.new(0, 1, 0)
    local Magnitude_2 = v3.Magnitude
    if Magnitude_2 == Magnitude_2 and not (Magnitude_2 <= 1e-06) and Magnitude_2 ~= (1 / 0) then
        return v3 / Magnitude_2
    end
    return v1 or Vector3.new(0, 0, 0)
end

function v1.Initialize(a1) -- Line: 36
    -- upvalues: Animation (val), TimescaleUtilities (val), EmitterManager (val), ArcPath (val), TweenService (val)
    -- upvalues: ServerTicks (val), RunService (val), GameState (val)
    local Sound, volume
    local Animations = a1.Model:WaitForChild("Animations")
    local AnimationController = a1.Model:WaitForChild("AnimationController")
    a1._animations = {}
    for i, j in Animations:GetChildren() do
        a1._animations[j.Name] = (Animation.new({
            Preload = true,
            IgnorePriority = true,
            Track = j,
            Target = AnimationController,
            Entity = {TimeScaled = true},
        }))
    end
    a1.sounds = {}
    local v1 = nil
    local v2 = nil
    for k, n in a1.Stats.Sounds, v1, v2 do
        Sound = Instance.new("Sound")
        Sound.Name = k
        Sound.SoundId = "rbxassetid://" .. n.id
        Sound.RollOffMaxDistance = a1.Stats.SoundEmitter.RollOffMaxDistance
        Sound.RollOffMinDistance = a1.Stats.SoundEmitter.RollOffMinDistance
        Sound.RollOffMode = a1.Stats.SoundEmitter.RollOffMode
        Sound.Parent = a1.Model.PrimaryPart
        Sound.Looped = n.looped or false
        volume = n.volume or a1.Stats.SoundEmitter.Volume or 0.5
        Sound.Volume = volume
        a1.sounds[k] = Sound
    end

    function a1:_playSound(a2, a3) -- Line: 69
        -- upvalues: TimescaleUtilities (upval)
        if a3 then
            local u7 = self.sounds[a2]:Clone()
            u7.Parent = self.Model.PrimaryPart
            u7:Play()
            TimescaleUtilities.Delay(u7.TimeLength + 1, function() -- Line: 74 -- upvalues: u7 (val)
                u7:Destroy()
            end)
        end
        local v1 = self.sounds[a2]
        if v1 then
            v1:Play()
        end
        return v1
    end

    function a1._stopSound(a1, a2) -- Line: 88 -- types: a1: table, a2: string
        local v1 = a1.sounds[a2]
        if v1 then
            v1:Stop()
        end
    end

    a1.Executables = {
        Intro = function(a1_2) -- Line: 96 -- upvalues: a1 (val)
            a1:_playSound("throw")
            a1:Face(a1_2, TweenInfo.new(0.5), true)
            a1._animations.Throw:Play()
            a1:Delay(0.1, function() -- Line: 101 -- upvalues: a1 (upval)
                if a1:IsAlive() then
                    a1._animations.ThrowLoop:Play()
                end
            end)
        end,
        Hammer = function(a1_2, a2, a3) -- Line: 108
            -- upvalues: a1 (val), EmitterManager (upval), TimescaleUtilities (upval), ArcPath (upval)
            -- upvalues: TweenService (upval), ServerTicks (upval), RunService (upval), GameState (upval)
            local v1
            local u8 = a1.sounds.throw_loop:Clone()
            local u14 = a1.Model.HammerThrow:Clone()
            u14.Highlight.Enabled = true
            u14.Parent = workspace
            u14.Transparency = 0
            EmitterManager.toggle(u14, true)
            u8.Parent = u14
            u8.Volume = 0.45
            u8:Play()

            local function hammerCleanup() -- Line: 122
                -- upvalues: EmitterManager (upval), u14 (val), TimescaleUtilities (upval)
                EmitterManager.toggle(u14, false)
                u14.Transparency = 1
                TimescaleUtilities.CleanUp(u14, 2)
            end

            local v2 = a2[1]
            local v3 = a2[2] - v2
            local Magnitude = v3.Magnitude
            v3 = (if Magnitude ~= Magnitude then Vector3.new(0, 0, 1) else if Magnitude <= 1e-06 then Vector3.new(0, 0, 1) else if Magnitude ~= (1 / 0) then v3 / Magnitude else Vector3.new(0, 0, 1)) + Vector3.new(0, 1, 0)
            local Magnitude_2 = v3.Magnitude
            local v4 = if Magnitude_2 ~= Magnitude_2 then v1 or Vector3.new(0, 0, 0) else if Magnitude_2 <= 1e-06 then v1 or Vector3.new(0, 0, 0) else if Magnitude_2 ~= (1 / 0) then v3 / Magnitude_2 else v1 or Vector3.new(0, 0, 0)
            v1 = a2[#a2 - 1]
            local v5 = a2[#a2] - v1
            local Magnitude_3 = v5.Magnitude
            v2 = (if Magnitude_3 ~= Magnitude_3 then v4 or Vector3.new(0, 0, 0) else if Magnitude_3 <= 1e-06 then v4 or Vector3.new(0, 0, 0) else if Magnitude_3 ~= (1 / 0) then v5 / Magnitude_3 else v4 or Vector3.new(0, 0, 0)) + Vector3.new(0, 0.5, 0)
            local u72 = ArcPath.new(a2, v4, v2, {Resolution = 200, ArcAngleStep = 0.1})
            local u73 = nil
            local u77 = math.max(u72.Length, 1e-06)
            local u79 = (u77 - 20) / u77
            local u81 = (u77 - 15) / u77
            local u83 = (u77 - 40) / u77
            local u84 = 0
            local u89 = u72.Length / a1.Stats.HammerTravelTime
            local u90 = 0
            local u91 = {}
            local u92 = false

            local function onUpdate(a1_2) -- Line: 163
                -- upvalues: u84 (ref), u77 (val), u92 (ref), u8 (val), a1 (upval), u73 (ref), EmitterManager (upval)
                -- upvalues: u14 (val), TimescaleUtilities (upval), u79 (val), u81 (val), TweenService (upval)
                -- upvalues: u83 (val), u89 (val), u90 (ref), u72 (val), a3 (val), a2 (val), u91 (val)
                local v1, v2, v3, v4
                local v5 = u84 / u77
                if v5 >= 0.7 and not u92 then
                    u8:Stop()
                    a1:_playSound("catch")
                    u92 = true
                    a1._animations.ThrowLoop:Stop()
                    a1._animations.Recive:Play()
                end
                if u77 <= u84 then
                    u73:Disconnect()
                    EmitterManager.toggle(u14, false)
                    u14.Transparency = 1
                    TimescaleUtilities.CleanUp(u14, 2)
                    return
                end
                local v6 = math.clamp(math.map(v5, u79, u81, 0, 1), 0, 1)
                v6 = 1 - TweenService:GetValue(v6, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut)
                local v7 = math.clamp(math.map(v5, u83, 1, 0, 1), 0, 1)
                local v8 = u89 * (1 + TweenService:GetValue(v7, Enum.EasingStyle.Quad, Enum.EasingDirection.In) * 8)
                u84 = u84 + v8 * a1_2
                u90 = (u90 + 360 * v8 / 20 * (a1_2 * v6)) % 360
                local v9 = math.sin(u84 * 0.3) * 0.45
                local v10 = (math.cos(u84 * 0.1)) * 1.45
                local v11 = Vector3.new(0, 1, 0) * v9 + Vector3.new(1, 0, 0) * v10
                local v12 = (u72:getCFrame(u84 / u77)) + v11 * v6
                local v13 = v12.Position + (u72:getDirection(u84 / u77))
                local v14 = CFrame.Angles(math.rad((1 - v6) * 90), 0, 0)
                local v15 = CFrame.new(v12.Position, v13) * v14 * CFrame.Angles(0, 0, (math.rad(u90)))
                u14.CFrame = v15
                u8.PlaybackSpeed = v8 / 24
                for i = 1, a3 do
                    v1 = a2[i + 1]
                    v2 = u72:getWaypointT(i + 1)
                    if v2 and v2 <= v5 and not u91[i] then
                        TweenService:Create(u14.Highlight, TweenInfo.new(0.05), {FillTransparency = 0.2}):Play()
                        TimescaleUtilities.Delay(0.05, function() -- Line: 228 -- upvalues: TweenService (upval), u14 (upval)
                            TweenService:Create(
                                u14.Highlight,
                                TweenInfo.new(1, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
                                {FillTransparency = 1}
                            ):Play()
                        end)
                        v3 = a1.sounds.hit:Clone()
                        v3.Parent = u14
                        v3:Play()
                        v4 = a1.Model.HitVFX:Clone()
                        v4:PivotTo((CFrame.new(v1)))
                        v4.Parent = workspace
                        v4:ScaleTo(2)
                        EmitterManager.manualEmit(v4)
                        TimescaleUtilities.CleanUp(v4, 2)
                        u91[i] = true
                    end
                end
            end

            local v6 = ServerTicks.getTime() - a1_2
            local v7 = 0
            while v7 < v6 do
                v7 = v7 + 0.016666666666666666
                onUpdate(0.016666666666666666)
            end
            local v8 = RunService.Stepped:Connect(function(a1, a2) -- Line: 265 -- upvalues: onUpdate (val), GameState (upval)
                onUpdate(a2 * GameState.TimeScale)
            end)
        end,
        Shield = function() -- Line: 270 -- upvalues: a1 (val), EmitterManager (upval), TweenService (upval)
            a1._animations.ShieldBreak:Play()
            EmitterManager.toggle(a1.Model.VFX, false)
            TweenService:Create(a1.Model.Shield, TweenInfo.new(0.45), {Transparency = 1}):Play()
        end,
        Death = function() -- Line: 278 -- upvalues: a1 (val)
            a1._animations.ThrowLoop:Stop()
            a1._animations.Recive:Stop()
            a1._animations.Death:Play()
        end,
    }
end

return v1