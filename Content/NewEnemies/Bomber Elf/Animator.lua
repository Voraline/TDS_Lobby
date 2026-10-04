-- Script path: ReplicatedStorage.Content.NewEnemies.Bomber Elf.Animator
-- Decompile time: 0.39 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
game:GetService("TweenService")
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local Shaker = require(ReplicatedStorage.Client.Modules.Shaker)
local v1 = {}
v1.__index = v1

function v1.Initialize(a1) -- Line: 13 -- upvalues: Shaker (val), EmitterManager (val)
    a1.Model.Bomb.Fuse:Play()
    a1.Executables = {
        Explode = function(a1, a2) -- Line: 17 -- upvalues: Shaker (upval), EmitterManager (upval)
            Shaker:Shake({1.5, 20, 0.1, 1}, 0.2, 0.5)
            EmitterManager.Emit("ImpactExplosion", a1, a2)
        end,
    }
end

return v1