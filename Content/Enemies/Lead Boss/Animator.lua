-- Script path: ReplicatedStorage.Content.Enemies.Lead Boss.Animator
-- Decompile time: 0.49 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
game:GetService("TweenService")
local v1 = {}
v1.__index = v1
require(ReplicatedStorage.Shared.Modules.Animation)

function v1.Initialize(a1) -- Line: 12
    a1.Executables = {
        Breaking = function(a1_2) -- Line: 15 -- upvalues: a1 (val)
            local v1 = a1.Model.Breaking.Breaking[a1_2]
            v1.Transparency = 0
            v1 = a1.Model.Breaking.Armor[a1_2]
            v1.Transparency = 1
            print(a1_2)
            a1.Model.Head.Break:Play()
        end,
        Free = function(a1_2) -- Line: 24 -- upvalues: a1 (val)
            local v1 = a1.Model.Breaking.Breaking[a1_2]
            v1.Transparency = 1
            a1.Model.Head.Break:Play()
        end,
    }
end

return v1