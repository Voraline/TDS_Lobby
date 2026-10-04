-- Script path: ReplicatedStorage.Content.Tower.Ace Pilot.Animator.SkinEffects
-- Decompile time: 1.39 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local EasySound = require(ReplicatedStorage.Shared.Modules.EasySound)
local TweenService = require(ReplicatedStorage.Client.Modules.TweenService)
return {
    EXTRA_FIRE_END_SOUNDS = {
        Default = {
            [5] = function(a1, a2) -- Line: 10 -- upvalues: EasySound (val), TweenService (val) -- types: a2: number
                if a2 > 0.85 then
                    local FireEnd = a1.Model.Weapon.Main:FindFirstChild("FireEnd")
                    if FireEnd and FireEnd:IsA("Sound") then
                        local v1 = string.match(FireEnd.SoundId or "", "%d+")
                        local v2 = v1 and tonumber(v1)
                        if v2 then
                            local Volume = FireEnd.Volume
                            TweenService:Create(EasySound.Play({
                                volume = 0,
                                audioGroup = "Towers",
                                destroyOnEnd = true,
                                id = v2,
                                parent = a1.Model.Weapon.Main,
                                playbackSpeed = 1 + Random.new():NextNumber(-0.05, 0.05),
                            }), TweenInfo.new(0.35), {Volume = Volume}):Play()
                        end
                    end
                end
            end,
        },
    },
    SHOOT_SOUNDS = {
        Default = {
            [5] = function(a1, a2) -- Line: 38 -- upvalues: TweenService (val), RunService (val)
                task.spawn(function() -- Line: 40 -- upvalues: a1 (val), a2 (val), TweenService (upval), RunService (upval)
                    local v1
                    for i = 1, 10 do
                        v1 = a1:_shootSound(a2)
                        if v1 then
                            TweenService:Create(v1, TweenInfo.new(0.043), {Volume = 0}):Play()
                        end
                        RunService.RenderStepped:Wait()
                    end
                end)
            end,
        },
    },
}