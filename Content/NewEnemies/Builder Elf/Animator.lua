-- Script path: ReplicatedStorage.Content.NewEnemies.Builder Elf.Animator
-- Decompile time: 0.46 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
game:GetService("TweenService")
local v1 = {}
v1.__index = v1
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
require(ReplicatedStorage.Client.Controllers.Game.EffectsController)
require(ReplicatedStorage.Shared.Modules.Projectile)

function v1.Initialize(a1) -- Line: 14 -- upvalues: Animation (val)
    local u9 = Animation.new({
        IsPersistent = true,
        Track = a1.Model.Animations.Build,
        Target = a1.Model.AnimationController,
    })
    a1.Executables = {
        Build = function(a1) -- Line: 22 -- upvalues: u9 (val)
            u9:Play()
        end,
        BuildStop = function() -- Line: 25 -- upvalues: u9 (val)
            u9:Stop()
        end,
    }
end

return v1