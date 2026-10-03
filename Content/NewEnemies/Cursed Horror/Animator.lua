-- Script path: ReplicatedStorage.Content.NewEnemies.Cursed Horror.Animator
-- Decompile time: 0.49 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local EffectsController = require(ReplicatedStorage.Client.Controllers.Game.EffectsController)
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local v1 = {}
v1.__index = v1

function v1.Initialize(a1) -- Line: 8 -- upvalues: EffectsController (val), EmitterManager (val)
    a1.Executables = {
        Death = function(a1_2) -- Line: 10
            -- upvalues: EffectsController (upval), a1 (val), EmitterManager (upval)
            EffectsController.StunRaidus(a1.Model.PrimaryPart.Node.WorldCFrame, a1_2)
            EmitterManager.Emit("EnergyExplosion", CFrame.new(a1.Model.PrimaryPart.Position), 2)
        end,
    }
end

return v1