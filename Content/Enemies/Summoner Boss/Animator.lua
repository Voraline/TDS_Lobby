-- Script path: ReplicatedStorage.Content.Enemies.Summoner Boss.Animator
-- Decompile time: 0.46 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local v1 = {}
v1.__index = v1

function v1.Initialize(a1) -- Line: 9 -- upvalues: Animation (val)
    a1.Executables = {
        Attack = function(a1_2, a2) -- Line: 11 -- upvalues: a1 (val), Animation (upval)
            a1.Model.Head.Summon:Play()
            Animation.new({
                Track = a1.Model.Animations.SpawnTroop,
                Target = a1.Model.AnimationController,
            }):Play()
            a1:Delay(0.25)
            a1.Model.Staff.Crystal.Lightning.Enabled = true
            a1:Delay(0.6)
            a1.Model.Staff.Crystal.Lightning.Enabled = false
        end,
    }
end

return v1