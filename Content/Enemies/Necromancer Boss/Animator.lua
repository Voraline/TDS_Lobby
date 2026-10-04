-- Script path: ReplicatedStorage.Content.Enemies.Necromancer Boss.Animator
-- Decompile time: 0.51 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local v1 = {}
v1.__index = v1
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)

function v1.Initialize(a1) -- Line: 11 -- upvalues: Animation (val)
    a1.Executables = {
        Attack = function() -- Line: 13 -- upvalues: Animation (upval), a1 (val)
            Animation.new({
                Track = a1.Model.Animations.SpawnTroop,
                Target = a1.Model.AnimationController,
            }):Play()
            a1:Delay(0.25)
            a1.Model.Head.Summon:Play()
            a1.Model.Staff.Attachment.Particles.Enabled = true
            a1:Delay(0.67)
            a1.Model.Staff.Attachment.Particles.Enabled = false
        end,
        Death = function() -- Line: 25 -- upvalues: Animation (upval), a1 (val)
            Animation.new({
                Track = a1.Model.Animations.Died,
                Target = a1.Model.AnimationController,
            }):Play()
            a1.Model.Head.Dead:Play()
        end,
    }
end

return v1