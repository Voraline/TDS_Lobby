-- Script path: ReplicatedStorage.Content.Enemies.Lunar Shard.Animator
-- Decompile time: 0.42 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local v1 = {}
v1.__index = v1

function v1.Initialize(a1) -- Line: 10 -- upvalues: TimescaleUtilities (val)
    a1.Executables = {
        Death = function() -- Line: 12 -- upvalues: a1 (val), TimescaleUtilities (upval)
            local u6 = a1.Model.Torso.Center:Clone()
            u6.Name = "SolarParticles"
            u6.Parent = workspace.Terrain
            u6.WorldPosition = a1.Model.Torso.Center.WorldPosition
            u6.DeathEmitter:Emit(40)
            TimescaleUtilities.Delay(3, function() -- Line: 19 -- upvalues: u6 (val)
                u6:Destroy()
            end)
        end,
    }
end

return v1