-- Script path: ReplicatedStorage.Content.NewEnemies.Soul Stealer.Animator
-- Decompile time: 1.48 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local EasySound = require(ReplicatedStorage.Shared.Modules.EasySound)
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local SoulStealer = ReplicatedStorage.Assets.Effects.Mob.SoulStealer
local v1 = {}
v1.__index = v1

function v1.Initialize(a1) -- Line: 11
    -- upvalues: EmitterManager (val), SoulStealer (val), Animation (val), EasySound (val)
    function a1._getScaledVFX(a1_2, a2) -- Line: 12
        -- upvalues: a1 (val), EmitterManager (upval)
        local v1 = a1_2:Clone()
        v1.Position = a1.Model.PrimaryPart.Position
        if a2 then
            local v2 = a1.Height * 2 / v1.Size.Y
            local Model = Instance.new("Model")
            v1.Parent = Model
            Model:ScaleTo(v2)
            v1.Parent = a1.Model
            Model:Destroy()
        end
        local WeldConstraint = Instance.new("WeldConstraint")
        WeldConstraint.Part0 = v1
        WeldConstraint.Part1 = a1.Model.PrimaryPart
        WeldConstraint.Parent = v1
        EmitterManager.toggle(v1, true)
        return v1
    end

    a1.Executables = {
        Summon = function() -- Line: 32 -- upvalues: a1 (val), SoulStealer (upval), Animation (upval), EasySound (upval)
            local v1 = a1._getScaledVFX(SoulStealer.Summon, true)
            Animation.new({
                Track = a1.Model.Animations.Summon,
                Target = a1.Model.AnimationController,
                Properties = {Looped = false},
            }):Play()
            local Summon = a1.Model.PrimaryPart:FindFirstChild("Summon")
            if Summon and Summon:IsA("Sound") then
                EasySound.Play({
                    audioGroup = "Enemies",
                    id = Summon.SoundId,
                    parent = a1.Model.PrimaryPart,
                    volume = Summon.Volume,
                })
            end
            a1:Delay(2)
            v1:Destroy()
        end,
        CurseTower = function(a1_2) -- Line: 53 -- upvalues: a1 (val), Animation (upval), EasySound (upval) -- types: a1_2: userdata
            local PrimaryPart = a1_2.PrimaryPart
            if PrimaryPart then
                a1:Face(PrimaryPart.Position, (TweenInfo.new(0.5)))
            end
            Animation.new({
                Track = a1.Model.Animations.Attack,
                Target = a1.Model.AnimationController,
                Properties = {Looped = false},
            }):Play()
            local Curse = a1.Model.PrimaryPart:FindFirstChild("Curse")
            if Curse and Curse:IsA("Sound") then
                EasySound.Play({
                    audioGroup = "Enemies",
                    id = Curse.SoundId,
                    parent = a1.Model.PrimaryPart,
                    volume = Curse.Volume,
                })
            end
        end,
        Death = function() -- Line: 75 -- upvalues: Animation (upval), a1 (val)
            Animation.new({
                Track = a1.Model.Animations.Death,
                Target = a1.Model.AnimationController,
            }):Play()
            a1:Delay(2)
        end,
    }
end

return v1