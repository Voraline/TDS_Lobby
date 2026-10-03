-- Script path: ReplicatedStorage.Content.Enemies.Summoner.Animator
-- Decompile time: 0.55 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local v1 = {}
v1.__index = v1
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)

function v1.Initialize(a1) -- Line: 11 -- upvalues: Animation (val)
    a1.Name = "Necromancer"
    a1.Executables = {
        Attack = function(a1_2, a2) -- Line: 16 -- upvalues: Animation (upval), a1 (val)
            local Attribute
            Animation.new({
                Track = a1.Model.Animations.Summon,
                Target = a1.Model.AnimationController,
            }):Play()
            a1:Delay(0.9)
            a1.Model.Head.Summon:Play()
            for k, v in pairs(a1.Model.HumanoidRootPart.SpawnEffect:GetChildren()) do
                if v:IsA("ParticleEmitter") then
                    Attribute = v:GetAttribute("EmitCount")
                    if Attribute then
                        v:Emit(Attribute)
                    end
                end
            end
        end,
    }
end

return v1