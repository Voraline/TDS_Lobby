-- Script path: ReplicatedStorage.Content.Enemies.Charger.Animator
-- Decompile time: 0.39 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
game:GetService("TweenService")
local v1 = {}
v1.__index = v1
require(ReplicatedStorage.Shared.Modules.Animation)

function v1.Initialize(a1) -- Line: 12
    a1.Executables = {
        Scream = function(a1_2) -- Line: 14 -- upvalues: a1 (val)
            a1.Model.Head.Scream:Play()
            a1.Model.HumanoidRootPart.Node.Dirt.Enabled = true
            a1:Delay(a1_2)
            a1.Model.HumanoidRootPart.Node.Dirt.Enabled = false
        end,
    }
end

return v1