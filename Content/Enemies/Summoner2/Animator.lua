-- Script path: ReplicatedStorage.Content.Enemies.Summoner2.Animator
-- Decompile time: 0.65 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local v1 = {}
v1.__index = v1

function v1.Initialize(a1) -- Line: 9 -- upvalues: Animation (val)
    a1.Name = "Necromancer Boss"
    a1.Executables = {
        Attack = function(a1_2, a2) -- Line: 14 -- upvalues: Animation (upval), a1 (val)
            local Attribute
            local v1 = Animation.new({
                Track = a1.Model.Animations.Summon,
                Target = a1.Model.AnimationController,
            })
            v1:Play()
            a1.Model.Staff.Charm.Smoke.Enabled = true
            a1:Delay(0.5)
            a1.Model.Head.Summon:Play()
            for k, v in pairs(a1.Model.HumanoidRootPart.SpawnEffect:GetChildren()) do
                if v:IsA("ParticleEmitter") then
                    Attribute = v:GetAttribute("EmitCount")
                    if Attribute then
                        v:Emit(Attribute)
                    end
                end
            end
            a1:Delay(v1.Controller.Length - 0.5)
            a1.Model.Staff.Charm.Smoke.Enabled = false
        end,
    }
end

return v1